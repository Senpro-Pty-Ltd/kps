/* xxstkavail.p - Check stock availability for van/warranty sales             */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* CYB    LAST MODIFIED: 22-SEP-2011    BY:  gbg *cy1020/cy1022*              */
/* CYB    LAST MODIFIED: 22-SEP-2011    BY:  gbg *c1245*                      */
/* CYB    LAST MODIFIED: 15-DEC-2011    BY:  gbg *c1266*                      */
/* CYB    LAST MODIFIED: 28-AUG-2012    BY:  gbg *c1332*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 2015-08-26     BY:  gbg *c1541*                      */
/*----------------------------------------------------------------------------*/


{us/bbi/mfdeclre.i}


define input parameter ipnbr as char.
define output parameter opstatus as logical.

{us/xx/xx1021.i NEW}
run plbattlist.
{us/xx/xxfnkit.i}

define var vQtyReq   as dec.
define var vQtyShip  as dec.
define var vQtyAll   as dec.
define var vMessage  as char.
define var tdesc     as char format "x(40)" label "Description".

define temp-table ttsod no-undo
field ttpart         like sod_part
field ttopen         as dec format "->>>9" label "Open"
field ttavail        as dec format "->>>9" label "Avail"
field ttoh           as dec format "->>>9" label "OH"
field ttall          as dec format "->>>9" label "Alloc".

def temp-table ttpart no-undo
field tpart  like sod_part
field tsite  like sod_site
field tkit   as logical
field tline  like sod_line
field tloc   like loc_loc
field tord   as dec
field tordorig   as dec
field tship  as dec
field tall   as dec.

       form
       ttpart    column-label "Item"
       ttopen    
       ttall    
       ttavail 
       ttoh   
       skip
       tdesc    no-label
       with frame d width 78 row 6 12 down center overlay.

/*c1332*  function fQtyOH returns decimal (ippart as char, ipsite as char, iploc as char): */

/*c1332*/ function fQtyOH 
/*c1332*/ returns decimal 
/*c1332*/ (ippart as char, ipsite as char):
define var vQOH as dec.
   vQOH = 0.0.
   for first in_mstr no-lock
   where  in_domain = global_domain
   and    in_site = ipsite
   and    in_part = ippart:
/*c1541*/ vQOH = vQOH + in_qty_avail.
/*c1541*  vQOH = vQOH + in_qty_oh. */
   end.
/*c1332* start added code */
   for each ld_det no-lock
   where ld_domain = global_domain
   and  ld_site = ipsite
   and  ld_part = ippart
   and  (ld_lot <> "" or ld_ref <> "")
   and  ld_qty_oh > 0,
   first loc_mstr no-lock
   where loc_domain = global_domain
   and   loc_site = ld_site
   and   loc_loc = ld_loc,
   first is_mstr no-lock
   where is_domain = global_domain
   and   is_status = loc_status
   and   is_avail:
     vQOH = vQOH - ld_qty_oh.
   end.
/*c1332* end   added code */
/*c1238>>>>
   for each ld_det no-lock
   where ld_domain = global_domain
   and  ld_site = ipsite
   and  ld_loc = iploc
   and  ld_part = ippart,
   first loc_mstr no-lock
   where loc_domain = global_domain
   and   loc_site = ld_site
   and   loc_loc = ld_loc:
     find first is_mstr no-lock
     where is_domain = global_domain
     and   is_status = loc_status
     no-error.
     if available is_mstr and is_avail then
     vQOH = vQOH + ld_qty_oh.
   end.
*/
   return max(vQOH, 0).
end.  /* function fQtyOH */

function fQtyAvail returns dec (ippart as char, ipsite as char, iploc as char):
define var vAll as dec.

   vAll = 0.0.
for each in_mstr no-lock
where in_domain = global_domain
and   in_site = ipsite
and   in_part = ippart:
    vAll = vAll + max(0, in_qty_oh) - max(0, in_qty_all).
end.

   return max(0, vAll).

end.  /* function fQtyAvail */

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


function isbattery returns logical (ippart as char):
  find first pt_mstr no-lock  
  where pt_domain = global_domain
  and   pt_part = ippart
  no-error.
  if not available pt_mstr then return no.
   
  return lookup(pt_prod_line, pl_batterys) <> 0.
end.

find first so_mstr no-lock
where so_domain = global_domain
and   so_nbr = ipnbr
no-error.
if not available so_mstr then return.

empty temp-table ttsod.
empty temp-table ttpart.


for each sod_det no-lock
where sod_domain = global_domain
and   sod_nbr = so_nbr
/*c1266* and sod_type <> ? */
/*c1266* and sod_type <> "" */
/*c1266*/ and sod_type = ""
/*c1266*/ and can-find(first pt_mstr
/*c1266*/              where pt_domain = global_domain
/*c1266*/              and   pt_part = sod_part)
/*c1266* /*c1266*/              and   pt_memo_type  = " ") */
and (sod_qty_ord - sod_qty_ship) > 0.0
break by sod_site by sod_part:
   if fiskit(sod_part)
   then do:
     for each sob_det
     no-lock
     where sob_domain = global_domain
     and   sob_nbr = sod_nbr
     and   sob_line = sod_line:
      if isbattery(sob_part)
      then do:
        create ttpart.
        assign
        tpart = sob_part
        tline = sod_line
        tkit = yes
        tloc = useloc(sod_site, so__chr01, sob_part)
        tsite = sod_site
        tordorig = sob_qty_req * sod_um_conv
        tord     = max(0, tordorig)
        tship = sod_qty_ship * sod_um_conv * (sob_qty_req / sod_qty_ord)
        tall  = 0.0.
        if canOverIssue(sod_site, so__chr01, sob_part) then tord = 0.0.
      end.
     end.
   end.
   else do:
     create ttpart.
     assign
     tpart = sod_part
     tline = sod_line
     tkit = no
     tloc = useloc(sod_site, so__chr01, sod_part)
     tsite = sod_site
     tordorig  = sod_qty_ord * sod_um_conv
     tord     = max(0, tordorig)
     tship = sod_qty_ship * sod_um_conv
     tall = (sod_qty_all + sod_qty_pick) * sod_um_conv.
     if canOverIssue(sod_site, so__chr01, sod_part) then 
      assign
      tord = 0.0
      tall = 0.0.
   end.
end.


for each ttpart
break by tsite by tpart:
    if first-of(tpart)
    then do:
      vQtyReq = 0.0.
      vQtyShip = 0.0.
      vQtyAll = 0.0.
    end.

    vQtyReq = vQtyReq + tord.
    vQtyShip = vQtyShip + tship.
    vQtyAll = vQtyAll + tall.

    if last-of(tpart)
/*c1332*/      and  fQtyOH(tpart, tsite) < vQtyReq - vQtyShip 
/*c1332*       and  fQtyOH(tpart, tsite, tloc) < vQtyReq - vQtyShip  */
/*    and ((not tkit and vQtyReq - vQtyShip <> vQtyAll) */
/*    or fQtyOH(tpart, tsite, tloc) < vQtyReq - vQtyShip) */
    then do:
      create ttsod.
      assign
      ttpart = tpart
      ttopen = vQtyReq - vQtyShip
      ttavail = fQtyAvail(tpart, tsite, tloc)
/*c1332*/ ttoh  = fQtyOH(tpart, tSite)
/*c1332*       ttoh  = fQtyOH(tpart, tSite, tloc) */
      ttall = vQtyAll.
    end.
end.


opstatus = yes.
if can-find(first ttsod)
then do:
   opstatus = no.
   vMessage = "Stock Unavailable. Shipping Aborted".
/*c1332*/   vMessage = "Stock Unavailable or has Lot/Ref. Shipping Aborted".
   {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=1}
   for each ttsod:
       find first pt_mstr no-lock
       where pt_domain = global_domain
       and pt_part = ttpart
       no-error.
       tdesc = if available pt_mstr then trim(pt_desc1) + " " + trim(pt_desc2)
               else " ".
       display 
       ttpart    column-label "Item"
       ttopen    
       ttall    
       ttavail 
       ttoh   
       skip
       tdesc    no-label
       with frame d.
       down with frame d.
   end.
   pause.
   hide frame d no-pause.
   clear frame d all.
end.  /* if can-find(first ttsod) */
