/* xxsoisx.p - Shipment Cancel Bo                                       */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */
/* CYB    LAST MODIFIED: July 2011     BY: gbg *cy1021*/
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB   LAST MODIFIED: 22-MAR-2012  BY:  gbg *c1287*                  */
/* CYB    LAST MODIFIED: 02-OCT-2012    BY:  gbg *c1348*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 22-FEB-2013    BY:  gbg *c1367*                      */
/* CYB    LAST MODIFIED: 2015-08-26     BY:  gbg *c1541*                      */
/* CYB    LAST MODIFIED: 2018-AUG-10    BY: gbg *k10017* Task*T1086*           */
/*----------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
/*d2101*/ {us/gp/gpuid.i}
{us/xx/xxfnkit.i}
/*k10017* start added code */
def var stkavailok   as log.
/*k10017* end added code   */



def input parameter iprec    as recid.
define input parameter ipcanbo as log.

function fQtyOH returns decimal (ippart as char, ipsite as char, iploc as char):
define var vQOH as dec.
   vQOH = 0.0.
   for first in_mstr no-lock
   where  in_domain = global_domain
   and    in_site = ipsite
   and    in_part = ippart:
/*c1541*   vQOH = vQOH + in_qty_oh. */
/*c1541*/  vQOH = vQOH + in_qty_avail.
   end.
   vQOH = 0.
   for first ld_det no-lock
   where ld_domain = global_domain
   and   ld_part = ippart
   and   ld_site = ipsite
   and   ld_loc =  iploc:
        vQOH = vQOH + ld_qty_oh - ld_qty_all.
   end.

   return max(0, vQOH).
end.

function overIssue returns logical (ipsite as char, iploc as char):
  find first loc_mstr no-lock
  where loc_domain = global_domain
  and   loc_site = ipsite
  and   loc_loc = iploc
  and   iploc <> ?
  and   iploc <> ""
  no-error.
  if not available loc_mstr then return no.
  find first is_mstr no-lock
  where is_domain = global_domain
  and   is_status = loc_status
  no-error.
  if not available is_mstr then return no.
  return is_overissue.
end.  /* function overIssue */

function useLoc returns char (ipsite as char, iploc as char, ippart as char):
  find first pt_mstr no-lock
  where pt_domain = global_domain
  and pt_part = ippart
  no-error.
  find first si_mstr no-lock
  where si_domain = global_domain
  and   si_site = ipsite
  no-error.
  if not available si_mstr then return iploc.
  find first pti_det no-lock
  where pti_det.oid_pt_mstr = pt_mstr.oid_pt_mstr
  and   pti_det.oid_si_mstr = si_mstr.oid_si_mstr
  no-error.
  find first loc_mstr no-lock
  where loc_domain = global_domain
  and loc_site = ipsite
  and loc_loc = iploc
  and iploc <> ?
  and iploc <> ""
  no-error.
  if not available loc_mstr
  then do:
     if available pti_det then
       find first loc_mstr no-lock
       where loc_domain = global_domain
       and loc_site = ipsite
       and loc_loc = pti_loc
       no-error.
     else
       if available pt_mstr then
       find first loc_mstr no-lock
       where loc_domain = global_domain
       and loc_site = ipsite
       and loc_loc = pti_loc
       no-error.
       else return "".
  end.
  return if available loc_mstr then loc_loc else "".

end.  /* function useLoc */

function canOverIssue returns logical (ipsite as char, iploc as char, ippart as char):
  return overissue(ipsite, useloc(ipsite, iploc, ippart)).
end.







find first sod_det exclusive-lock
where recid(sod_det) = iprec
no-error.
find first so_mstr no-lock
where so_domain = global_domain
and   so_nbr = sod_nbr
no-error.
if available sod_det
then do:
   if fiskit(sod_part)
   then do:
	{us/bbi/gprun.i ""xxdfstk1a.p""
	                "(recid(so_mstr),
			  recid(sod_det),
			  output stkavailok)"}
        if stkavailok
        then do:
/*c1348* start added code */
	/*******************************************************/
	/* There shouldnt be allocations for the kit parent!   */
	/*******************************************************/
        find first in_mstr exclusive-lock
        where  in_domain = global_domain
        and    in_site = sod_site
        and    in_part = sod_part
        no-error.
        if available in_mstr
        then do:
	    in_qty_all = 0.0.
        end.
	sod_qty_all = sod_qty_all - sod_bo_chg.
	if ipcanbo
	then do:
	   sod_bo_chg = 0.0.
	end.
/*c1348* end   added code */

/*c1348* start deleted code >>>
    if ipcanbo then do:
      sod_bo_chg = 0.0.
/*c1348* start added code */ 
      find first in_mstr exclusive-lock
      where  in_domain = global_domain
      and    in_site = sod_site
      and    in_part = sod_part
      no-error.
      if available in_mstr
      and  in_qty_all <> 0 then in_qty_all = in_qty_all - sod_qty_all.
      sod_qty_all = 0.
/*c1348* end added code */ 
    end.  /* if ipcanbo */
*c1348* end deleted code <<<<< */
        end.  /* debug */

   end.  /* if fiskit */
   else do:
     if sod_qty_ord < 0.0
     then do:
        find first sr_wkfl exclusive-lock
        where sr_domain = global_domain
        and   sr_userid = SessionUniqueID /*d2101*/
        and   sr_lineid = string(sod_line)
        no-error.
        if not available sr_wkfl
        then do:
            create sr_wkfl.
            assign
            sr_domain = global_domain
            sr_userid = SessionUniqueID /*d2101*/
            sr_lineid = string(sod_line)
            sr_site = sod_site
            sr_loc = sod_loc
            sr_lotser = ""
            sr_ref = "".
        end.  /* if not available sr_wkfl */
        sod_qty_chg = sod_qty_ord - sod_qty_ship.
        sod_bo_chg = 0.0.
        sr_qty = sod_qty_chg.
     end.  /* if sod_qty_ord < 0 */
     else do:
/*c1246*  start added code */
       if sod_type = ""
       then do:
/*k10017* start added code >>>>>> */
	{us/bbi/gprun.i ""xxdfstk1a.p""
	                "(recid(so_mstr),
			  recid(sod_det),
			  output stkavailok)"}
        if stkavailok
        then do:
/*k10017* end added code <<<<<<< */
          find first sr_wkfl exclusive-lock
          where sr_domain = global_domain
          and   sr_userid = SessionUniqueID /*d2101*/
          and   sr_lineid = string(sod_line)
          no-error.
          if not available sr_wkfl
          then do:
              create sr_wkfl.
              assign
              sr_domain = global_domain
              sr_userid = SessionUniqueID /*d2101*/
              sr_lineid = string(sod_line)
              sr_site = sod_site
              sr_loc = sod_loc
              sr_lotser = ""
              sr_ref = "".
          end.  /* not available sr_wkfl */
          if canoverissue(sod_site, so__chr01, sod_part)
          then sod_qty_chg = sod_qty_ord - sod_qty_ship.
          else
          sod_qty_chg = min(sod_qty_ord - sod_qty_ship,
                        fqtyoh(sod_part, sod_site, 
                              useloc(sod_site, so__chr01, sod_part)) - 
                              shipsofar(sod_nbr, sod_part, sod_line)).
          sod_bo_chg = sod_qty_ord - sod_qty_ship - sod_qty_chg.
          if ipcanbo then do:
              assign
              sod_bo_chg = 0.0.
          end.
          sr_qty = sod_qty_chg.
        end.  /* k10017 */
       end.
       else do:   /* MEMO Item */
          find first sr_wkfl exclusive-lock
          where sr_domain = global_domain
          and   sr_userid = SessionUniqueID /*d2101*/
          and   sr_lineid = string(sod_line)
          no-error.
          if not available sr_wkfl
          then do:
              create sr_wkfl.
              assign
              sr_domain = global_domain
              sr_userid = SessionUniqueID /*d2101*/
              sr_lineid = string(sod_line)
              sr_site = sod_site
              sr_loc = sod_loc
              sr_lotser = ""
              sr_ref = "".
          end.  /* not available sr_wkfl */
         sod_qty_chg = sod_qty_ord - sod_qty_ship.
	 sod_bo_chg = 0.0.
         sr_qty = sod_qty_chg.
       end.
/*c1246*  end   added code */
     end.  /* if sod_qty_ord < 0 .. else .. */
   end.  /* if fiskit ...  else do:  */
end.
