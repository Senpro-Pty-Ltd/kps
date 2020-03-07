/* xxfnkit.i  Shared funcs    for pending invoice kits                   */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */
/************************************************************************/
/* Everhard    BY: gbg   DATE: Dec 2006    Q0002                         */
/* Everhard upgrade  LAST MODIFIED: FEB-2008    BY: gbg *q3301*               */
/* CYB           MODIFIED: 09-MAY-2011            BY: psu *cy1021*            */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB   LAST MODIFIED: 22-MAR-2012  BY:  gbg *c1287*                  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */



/************************************************************************/
/*Q3301*   added pt_domain = global_domain*/

function isserialpart returns logical
(ippart as char).

 return can-find(first pt_mstr 
		 where pt_part = ippart
		 and   pt_domain = global_domain
		 and   pt_lot_ser = "S").

end.


/************************************************************************/
function isenoughstock returns logical
(ipsite as char,
 iploc  as char,
 ippart as char,
 ipser  as char,
 ipqty  as dec).
def var vserial as logical.
vserial = not isserialpart(ippart).
  if ipqty <= 0 then return yes.

  find first ld_det no-lock
  where ld_site = ipsite
  and   ld_loc  = iploc
  and   ld_part = ippart
  and   (vserial or ld_lot = ipser)
  and   (ld_qty_oh - ld_qty_all) > 0 
  and   (ld_qty_oh - ld_qty_all) >= ipqty
/*Q3301*/ and  ld_domain = global_domain
  no-error.
  if available ld_det then return yes.
  return no.

end.



/************************************************************************/
function fiskit returns logical (ippart as char).
find first pt_mstr no-lock
where pt_part = ippart
/*Q3301*/ and pt_domain = global_domain
no-error.
if not available pt_mstr then return no.
if pt_cfg = "2" then return yes.
return no.
end.


/************************************************************************/
function shipsofar returns decimal 
   (ipnbr as char, ippart as char, ipline as int).
def var totaltoship as dec.

  {us/bbi/gprun.i ""xxchgcalc.p""
           "(ipnbr,
             ipline,
             ippart,
             output totaltoship
            )"}
   return totaltoship. 
end.  /* function shipsofar */
