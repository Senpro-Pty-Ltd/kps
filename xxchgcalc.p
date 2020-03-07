/* xxshgcalc.p Calculate qty of item shipped on and order               */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */
/************************************************************************/
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1021*                     */
/* CYB   LAST MODIFIED: 22-MAR-2012  BY:  gbg *c1287*                  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB   LAST MODIFIED: 30-MAY-2013  BY:  gbg *c1413*                  */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/************************************************************************/
{us/bbi/mfdeclre.i}

define input parameter ipnbr as char.
define input parameter ipline as int.
define input parameter ippart as char.
define output parameter opqty as dec.


opqty = 0.0.
for each sod_det no-lock
where sod_domain = global_domain
and   sod_nbr = ipnbr
and   sod_part = ippart
and   sod_line <> ipline
/*c1413*/ and sod_type = ""
:
   opqty = opqty + sod_qty_chg.
end.
for each sod_det no-lock
where sod_domain = global_domain
and   sod_nbr = ipnbr
and   sod_line <> ipline
/*c1413*/ and sod_type = "",
each sob_det no-lock
where sob_domain = global_domain
and   sob_nbr = sod_nbr
and   sob_part = ippart
and   sob_line = sod_line
:
   opqty = opqty + (sob_qty_req * (sod_qty_chg / sod_qty_ord)).
end.
