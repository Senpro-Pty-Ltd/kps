/*  xxplprint.p - Pallet label print                                    */
/* CYB               LAST MODIFIED: 08-SEP-2011 BY: gbg *cy1033*        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 20-MAR-2013 BY: gbg *c1375*   */
/* CYB LAST MODIFIED: 2013-DEC-11      BY: gbg *c1447*                */
/************************************************************************/
{us/bbi/mfdeclre.i}

define input parameter   iptrnbr   like tr_trnbr.
define input parameter   ipopnbr   like op_trnbr.

define shared stream ft.
/*c1447*/ def stream lga.

def var vwkctr  like op_wkctr.
def var vmch    like op_mch.
def var desc1   as char.
def var desc2   as char.
def var intQty  as int.
def var decQty  as dec.
def var chrQty  as char.

find first tr_hist no-lock
where tr_domain = global_domain
and   tr_trnbr = iptrnbr
no-error.
if not available tr_hist then return.

find first pt_mstr no-lock
where pt_mstr.pt_domain = global_domain
and   pt_mstr.pt_part = tr_part
no-error.

desc1 = if available pt_mstr then replace(pt_desc1, ",", "") else "".
desc2 = if available pt_mstr then replace(pt_desc2, ",", "") else "".

find first op_hist no-lock
where op_domain = global_domain
and  op_trnbr = ipopnbr
no-error.

vwkctr = if available op_hist then op_wkctr else "".
vmch  = if available op_hist then op_mch   else "".

   decQty = tr_qty_loc.
   intQty = integer(decQty).
   if decQty = intQty then
   chrQty = string(intQty, ">>>>>>>>9").
   else chrQty = string(decQty, ">>>>>>>>>9.9<<<<<<<").


   put stream ft
   unformatted
   string(tr_loc, "x(8)")
   ","
   string(vwkctr, "x(8)")
   ","
   string(vmch, "x(8)")
   ","
/*c1375* start adeleted code *
   string(tr_site, "x(8)")
   ","
*c1375* end deleted code */
   trim(tr_hist.tr_part)
   ","
   trim(desc1)
   ","
   trim(desc2)
   ","
   trim(tr_serial)
   ","
   trim(tr_ref)
   ","
   trim(string(day(tr_date), "99"))
   "-"
   trim(string(month(tr_date), "99"))
   "-"
   trim(string(year(tr_date), "9999"))
   ","
   trim(string(tr_time, "HH:MM:SS"))
   ","
/*   trim(string(tr_qty_loc, ">>>>>>>>9.9<<<<<<<")) */
   trim(chrQty)
   ","
   trim(tr_site)
   ","
   trim(tr_loc)
   ","
   trim(vwkctr)
   ","
   trim(vmch)
   skip.



/*c1447* start added code */
output stream lga to value("iclotr_" + 
		  string(year(today), "9999") +
		  string(month(today), "99") +
		  string(day(today), "99") +
		  ".log") append.


   put stream lga
   unformatted
   string(tr_loc, "x(8)")
   ","
   string(vwkctr, "x(8)")
   ","
   string(vmch, "x(8)")
   ","
/*c1375* start adeleted code *
   string(tr_site, "x(8)")
   ","
*c1375* end deleted code */
   trim(tr_hist.tr_part)
   ","
   trim(desc1)
   ","
   trim(desc2)
   ","
   trim(tr_serial)
   ","
   trim(tr_ref)
   ","
   trim(string(day(tr_date), "99"))
   "-"
   trim(string(month(tr_date), "99"))
   "-"
   trim(string(year(tr_date), "9999"))
   ","
   trim(string(tr_time, "HH:MM:SS"))
   ","
/*   trim(string(tr_qty_loc, ">>>>>>>>9.9<<<<<<<")) */
   trim(chrQty)
   ","
   trim(tr_site)
   ","
   trim(tr_loc)
   ","
   trim(vwkctr)
   ","
   trim(vmch)
   skip.
output stream lga close.
/*c1447* end added code */

