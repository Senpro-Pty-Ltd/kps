/* xxchgiss.p  - Change ship quantities for kit shipments                    */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 7-Sep-2011      BY: gbg *c1238*          */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 15-MAR-2013    BY:  gbg *c1374*                      */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/*---------------------------------------------------------------------------*/


{us/bbi/mfdeclre.i}
/*c1374*/ {us/gp/gpuid.i}

define input    parameter ipnbr   like so_nbr.
define input    parameter ipline  like sod_line.
define input    parameter ippart  like sob_part.
define input    parameter iprecid  as recid.
define input    parameter ipqty   as dec.
define output   parameter opsuccess as logical.

define var vFactor  as dec.
define var vPer     as dec.
define var sodRecid as recid.

opsuccess = no.
find first so_mstr no-lock
where so_domain = global_domain
and   so_nbr = ipnbr
no-error.
if not available so_mstr then return.
find first sod_det no-lock
where sod_domain = global_domain
and   sod_nbr = so_nbr
and   sod_line = ipline
no-error.
if not available sod_det then return.
sodRecid = recid(sod_det).
find first sob_det no-lock
where sob_domain = global_domain
and   sob_nbr = so_nbr
and   sob_line = sod_line
and   sob_part = ippart
no-error.
if not available sob_det then return.

if sod_qty_ord = 0 then return.  /* would cause a divide by 0 */
if sob_qty_req = 0 then return.  /* would cause a divide by 0 */
vPer    = truncate(sob_qty_req / sod_qty_ord, 0).
vFactor = truncate(ipqty / vPer, 0).




opsuccess = yes.

do transaction:
find current sod_det exclusive-lock no-error.
if not available sod_det then return.
sod_qty_chg = vFactor.
for each sob_det no-lock
where sob_domain = global_domain
and   sob_nbr = so_nbr
and   sob_line = sod_line:
    for each sr_wkfl
    where sr_domain = global_domain
    and   sr_userid = SessionUniqueID
    and   sr_lineid begins string(sod_line) + "ISS" + sob_part:
        sr_qty = sob_qty_req * vFactor / sod_qty_ord.
    end.
end.
end.  /* transaction */
