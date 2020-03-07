/* xxcimsoi  -  CIM TO SHIPMENT PROCESSING                                    */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB    LAST MODIFIED: 08 Sep 2010    BY:  nac *q9021*C1197*              */
/* CYB    LAST MODIFIED: 08 Sep 2010    BY:  nac *q9021*C1197a*              */
/* CYB    LAST MODIFIED: 22 Sep 2010    BY:  nac *q9021*C1197b*              */
/* CYB    LAST MODIFIED: 22 Sep 2010    BY:  nac *q9021*C1197c*              */
/* CYB    LAST MODIFIED: 30 Sep 2010    BY:  nac *q9021*C1197d*              */
/* CYB    LAST MODIFIED: 04 Oct 2010    BY:  nac *q9021*C1197e*              */
/* CYB    LAST MODIFIED: 04 Oct 2010    BY:  nac *q9021*C1197f*              */
/* CYB    LAST MODIFIED: 04 Feb 2011    BY:  nac *q9021*C1197g*              */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 15-SEP-2011    BY:  gbg *c1243*                     */
/* CYB    LAST MODIFIED:                BY:  nac *ca791753*                  */
/* CYB    LAST MODIFIED: 22-SEP-2011    BY:  gbg *c1245*                      */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1022*              */
/* CYB                LAST MODIFIED: 13-JUN-2012 BY: gbg *c1312*           */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                LAST MODIFIED: 11-Feb-2013 BY: nac *c1363*           */
/*                                                                            */


{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}

define input parameter ipnbr    as char.
define output parameter operr   as int.
define output parameter opmsg   as char.

/*cy1022a*/ define shared variable cyb_so_type as char no-undo.

def var group_id as int no-undo.
def var error_ind as log no-undo.
def var error_msg as char no-undo.
def var line_no as int no-undo.
def var progress_errors as int no-undo.
def var function_errors as int no-undo.
def var function_warnings as int no-undo.
def var group_list as char no-undo.
def var linedata as char no-undo.
def var confdata as char no-undo.

def buffer bcomponents for pt_mstr.
def var vAllAvailable as log.
/*c1197d*/ def var issmsg as char format "x(50)".
/*nac*/ define variable v_ship_frame as logical no-undo.
/*nac*/ define variable v_shipgrp like sg_grp no-undo.

/*c1363>>*/
def var pos_qty as logical initial no.
def var neg_qty as logical initial no.
/*c1363<<*/


{us/xx/xxshipfns.i}  /* Shipping functions */

find first so_mstr no-lock
where so_domain = global_domain
and   so_nbr = ipnbr
no-error.
if not available so_mstr
then do:
  operr = 1.
  opmsg = "Order " + ipnbr + " does not exist in domain " + 
          global_domain.
  return.
end.



if cyb_so_type = "warranty" then do: /*cy1197c*/
   run pcheckavail (so_nbr, output vAllAvailable, output issmsg).
   if not vAllAvailable
   then do:
     operr = 2.
     opmsg = "Insufficient Stock to complete order".
/*c1197d*/ if issmsg <> "" then opmsg = issmsg.
     return.
   end.

   find first so_mstr no-lock
   where so_domain = global_domain
   and   so_nbr = ipnbr
   no-error.
end. /*cy1197c*/

/*c1363<<*/
   for each sod_det no-lock
   where sod_domain = global_domain
   and   sod_nbr = so_nbr:
     if sod_qty_ord - sod_qty_ship < 0 then neg_qty = yes.
     if sod_qty_ord - sod_qty_ship > 0 then pos_qty = yes.
   end.
/*c1363<<*/

/*nac>>*/

do:
   v_ship_frame = yes.
   /* CHECK THAT ADDRESSES ARE DIFFERENT.  IF NOT THEN LEAVE. */
   if so_site = so_ship then
      v_ship_frame = no.

   /* CHECK THAT BOTH ADDRESSES EXIST.  IF NOT THEN LEAVE. */
   if not
      (can-find (ad_mstr where ad_domain = global_domain and
                               ad_addr = so_site) and
       can-find (ad_mstr where ad_domain = global_domain and
                               ad_addr = so_ship))
   then
      v_ship_frame = no.

   /* CHECK IF SHIPPING GROUP EXISTS.  IF NOT THEN LEAVE. */
   {us/bbi/gprun.i ""gpgetgrp.p""
     "(so_site, so_ship, output v_shipgrp)" }

   for first sg_mstr where sg_domain = global_domain
      and sg_grp = v_shipgrp
   no-lock: end.

   if not available sg_mstr then
      v_ship_frame = no.

   /* CHECK THAT SHIPPING GROUP INCLUDES AT LEAST ONE VALID */
   /* INVENTORY MOVEMENT CODE.  IF NOT THEN LEAVE.          */
   for first sgid_det where sgid_domain = global_domain
      and sgid_grp = sg_grp
      and can-find (first im_mstr where im_domain = global_domain and
                                        im_inv_mov = sgid_inv_mov and
                                        im_tr_type = "iss-so")
   no-lock: end.

   if not available sgid_det then
      v_ship_frame = no.
end.
/*nac<<*/


operr = 0.
opmsg = "Success".

{us/bbi/gprun.i ""xxbdlid.p""
       "("""",
          ""sosois.p"",
          output group_id,
          output error_ind,
          output error_msg)"}


/*c1312* linedata = so_nbr. */
/*c1312*/ linedata = '"' + so_nbr + '"'.

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}


linedata = "-".

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

/*d2101 This is causing trouble in 2012. not sure wat its about. */
/*d2101 So commenting it out for now                             */
/*d2101* 2013-Jan-24 ** gbg 

/*nac>>*/
/*patch is now applied to standard*/
   linedata = '""' + " -".

   {us/bbi/gprun.i ""xxbdld.p""
         "("""",
            group_id,
            linedata,
            input-output line_no,
            output error_ind,
            output error_msg)"}
*d2101 *  <<<<<<<<<<<<<<<<<<<<<<<<< */
/*
if v_ship_frame then do:
   linedata = '""' + " -".

   {us/bbi/gprun.i ""xxbdld.p""
         "("""",
            group_id,
            linedata,
            input-output line_no,
            output error_ind,
            output error_msg)"}
end.
*/
/*nac<<*/

if fbackflushscreen(so_nbr, "")
then do:
  linedata = "yes no".    /* Backflush, Use Pick Logic */
  {us/bbi/gprun.i ""xxbdld.p"" 
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}
end.  /* fbackflushscreen */

for each sod_det no-lock
where sod_domain = global_domain
and   sod_nbr = so_nbr:
  qtytoship = sod_qty_ord - sod_qty_ship.
/*cy1187*   if abs(qtytoship) > 0 */
/*cy1187*/  if abs(qtytoship) <> 0
  then do:
    linedata = string(sod_line, "99").
    {us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

/*c1197e*/ if so__chr01 <> "" then
       linedata = string(qtytoship, "->>>>>9.9999") + " " +
                  cimit(sod_site) +  " " +
	          cimit(so__chr01).
/*c1197e>>*/
    else 
       linedata = string(qtytoship, "->>>>>9.9999") + " " +
                  cimit(sod_site) +  " " +
   	          cimit(sod_loc).
/*c1197e<<*/
   
    {us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

/*C1197c*/ if sod_type = "" then do:   /*not a memo item*/
    if fiskit(sod_part)
/*C1197    and qtytoship > 0.0 */
/*C1197*/  and qtytoship <> 0.0
    then do:
        linedata =  "yes".    /* Issue Components */
        {us/bbi/gprun.i ""xxbdld.p""
            "("""",
               group_id,
               linedata,
               input-output line_no,
               output error_ind,
               output error_msg)"}

/*c1197f  added no for picklogic to default to required pick location */
/*c1197f>>
 *        linedata =  cimit(so__chr01) +
 *                    " - - - - - " +
 *                    cimit(so__chr01) + 
 * 		      " - -".
 *c1197f<<*/

          linedata =  cimit(so__chr01) +
                      " - - - - " + "no " +
                      cimit(so__chr01) + 
		      " - -".

       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

       linedata = "-".    /* components */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

       linedata = "-".   /* Display Items being Issued */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

       linedata =  "-".    /* all information correct */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

    end.  /* if fiskit */
/*cy1197c*/ end. /* not a memo item */
  end.  /* abs(qtytoship) > 0 */
end.  /* each sod_det */

       linedata =  ".".    /* finished lines */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

       linedata =  "no".    /* Display items being shipped */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

       linedata = "-".  /* all information correct */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

       linedata = "-".   /* Trailer screen */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

       linedata = "-".   /* Ship via etc */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

/*cy1197g>>*/
/*C1363       linedata =  ".".  /* Shipping Information */ */
/*C1363 /*C1363*/     linedata =  "-".  /* Shipping Information */ */
/*C1363*/     linedata = '""' + " -".
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

       linedata = "-".   /* more trailer info carrier etc */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}
/*cy1197g<<*/

/*C1363>>*/
       linedata =  "-".  /* Trailer Information */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}
/*C1363<<*/

       linedata =  ".".  /* exit program */
       {us/bbi/gprun.i ""xxbdld.p""
           "("""",
              group_id,
              linedata,
              input-output line_no,
              output error_ind,
              output error_msg)"}

/*c1363>>*/
       if neg_qty and pos_qty then do:
          linedata = '""' + " -".
          {us/bbi/gprun.i ""xxbdld.p""
              "("""",
                 group_id,
                 linedata,
                 input-output line_no,
                 output error_ind,
                 output error_msg)"}

          linedata = "-".   /* more trailer info carrier etc */
          {us/bbi/gprun.i ""xxbdld.p""
              "("""",
                 group_id,
                 linedata,
                 input-output line_no,
                 output error_ind,
                 output error_msg)"}

          linedata =  "-".  /* Trailer Information */
          {us/bbi/gprun.i ""xxbdld.p""
              "("""",
                 group_id,
                 linedata,
                 input-output line_no,
                 output error_ind,
                 output error_msg)"}

          linedata =  ".".  /* exit program */
          {us/bbi/gprun.i ""xxbdld.p""
              "("""",
                 group_id,
                 linedata,
                 input-output line_no,
                 output error_ind,
                 output error_msg)"}

       end.
/*c1363<<*/


group_list = string(group_id,"99999999").

/* /*c1241*/ {us/xx/xxisgate.i} */
{us/bbi/gprun.i ""xxbdxpro.p"" 
             "("""",
               group_list,
               no, no,
               output progress_errors,
               output function_errors,
               output function_warnings)"}


if progress_errors > 0
or function_errors > 0
then do:
    find first usrw_wkfl no-lock
    where 
/*c1125*/ usrw_domain = global_domain and
    usrw_key1 = "CIM_OUT" + string(group_id, "99999999")
    no-error.
    if available usrw_wkfl
    then do:
       operr = progress_errors + function_errors.
       opmsg = usrw_charfld[1].
/*cy1020*
       display 
       "CIM returned the following error:" skip
       usrw_charfld[1]    format "x(60)"
       with frame cimer centered overlay no-labels no-attr-space.
       pause.
*cy1020*/
    end.
end.



procedure pcheckavail.
def input parameter ipnbr as char.
def output parameter oplog as log.
/*c1197c*/ def output parameter overissuemsg as char format "x(50)".

def var useloc as char.
def var qtyavail as dec.
/*c1197d*/ def var allowoverissue like is_overissue.

oplog = yes.
overissuemsg = "".

soloop:
for each so_mstr no-lock
where so_domain = global_domain
and   so_nbr = ipnbr
,
each sod_det no-lock
where sod_domain = global_domain
and   sod_nbr = so_nbr
and sod_type = "",
first pt_mstr no-lock
where pt_mstr.pt_domain = global_domain
and   pt_mstr.pt_part = sod_part:

   useloc = pt_mstr.pt_loc.
/*c1197d*/ allowoverissue = yes.
/*c1197c*/ overissuemsg = "Issue Allowed".

   if can-find(first loc_mstr
               where loc_domain = global_domain
	       and   loc_site = sod_site
	       and   loc_loc  = sod_loc)
   then useloc = sod_loc.
   if can-find(first loc_mstr
               where loc_domain = global_domain
	       and   loc_site = sod_site
	       and   loc_loc  = so__chr01)
/*c1197d*/ and so__chr01 <> ""
   then useloc = so__chr01.

   if pt_mstr.pt_cfg_type   = "2"
   then do:   /*  kit */


      for each sob_det no-lock
      where sob_domain = global_domain
      and   sob_nbr = so_nbr
      and   sob_line = sod_line:


        find first bcomponents no-lock
        where bcomponents.pt_domain = global_domain
        and   bcomponents.pt_part = sob_part
        no-error.
        if available bcomponents
        then do:
           useloc = bcomponents.pt_loc.
           if can-find(first loc_mstr
                  where loc_domain = global_domain
	          and   loc_site = sob_site
	          and   loc_loc  = sob_loc)
           then useloc = sob_loc.
           if can-find(first loc_mstr
                  where loc_domain = global_domain
	          and   loc_site = sob_site
	          and   loc_loc  = so__chr01)
/*c1197d*/ and so__chr01 <> ""
           then useloc = so__chr01.
           qtyavail = 0.0.


           for each ld_det
           where ld_domain = global_domain
           and   ld_site = sob_site
           and   ld_loc = useloc
           and   ld_part = sob_part:
/*gbgdebug*/  qtyavail = qtyavail + (ld_qty_oh  / sod_um_conv).
/*gbgdebug*   qtyavail = qtyavail + (ld_qty_oh - ld_qty_all) / sod_um_conv. */
           end.

/*c1197d>>*/
           find first loc_mstr no-lock
           where loc_domain = global_domain
           and   loc_site = sod_site
           and   loc_loc = useloc
           no-error.
           if available loc_mstr
           then do:
               find first is_mstr no-lock
               where is_domain = global_domain
               and   is_status = loc_status
               no-error.
               if available is_mstr 
               then do:
                  allowoverissue =  is_overissue.
               end.
           end.
/*c1197d<<*/


           if sod_qty_ord > 0.0
/*cy1197d*/ and not allowoverissue
           and qtyavail < (sod_qty_ord - sod_qty_ship)
           then do:
	        oplog = no.
	 overissuemsg = " Kit issue fail " + sob_part + " at site " + sob_site + " location " + useloc
/*c1197e*/    + " QtyAv " + string(qtyavail).
	        leave soloop.
           end.


        end.  /* available bcomponents */


      end.  /* each sob_det  */


   end.  /* pt_cfg_ = 2 = kit */
   else do:

/*c1197d>>*/
      find first loc_mstr no-lock
      where loc_domain = global_domain
      and   loc_site = sod_site
      and   loc_loc = useloc
      no-error.
      if available loc_mstr
      then do:
          find first is_mstr no-lock
          where is_domain = global_domain
          and   is_status = loc_status
          no-error.
          if available is_mstr 
          then do:
             allowoverissue =  is_overissue.
          end.
      end.
/*c1197d<<*/

      qtyavail = 0.0.
      for each ld_det
      where ld_domain = global_domain
      and   ld_site = sod_site
      and   ld_loc = useloc
      and   ld_part = sod_part:
/*gbgdebug*   qtyavail = qtyavail + (ld_qty_oh - ld_qty_all) / sod_um_conv. */
/*gbgdebug*/  qtyavail = qtyavail + (ld_qty_oh / sod_um_conv).
      end.

      if sod_qty_ord > 0.0
/*c1197d*/ and not allowoverissue
      and qtyavail < (sod_qty_ord - sod_qty_ship)
      then do:
         oplog = no.
	 overissuemsg = " Inv issue fail " + sod_part + " at site " + sod_site + " location " + useloc 
/*c1197e*/    + " QtyAv " + string(qtyavail).
	 leave soloop.
      end.
   end.
end.  /* each so_mstr */
end.  /* procedure pcheckavail */

