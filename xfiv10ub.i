/* xfiv10ub.i - INVOICE RE-PRINT USER CODE RECORD TYPE "B"                    */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/******************************************************************************/
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* CYB       LAST MODIFIED: 10-AUG-2010     BY: gbg *cy1002*                  */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 05-FEB-2013     BY: gbg *cy1002h*                 */
/******************************************************************************/
/*V8:ConvertMode=Report                                                       */
/******************************************************************************/

/* start of new code >> */
find first pt_mstr no-lock
where pt_domain = global_domain
and   pt_part = idh_part
no-error.


lvshippedprior = idh_qty_ship - idh_qty_inv.
lvextweight = if available pt_mstr then
               (pt_ship_wt * idh_qty_inv * idh_um_conv)
	     else 0.0.  

lvtotweight = lvtotweight + lvextweight.

put stream ft
 {us/xf/xfput.i idh_qty_ord     350 "->,>>>,>>9.99" }  /* Qty Ordered */
 {us/xf/xfput.i lvshippedprior  363 "->,>>>,>>9.99" }  /* Qty Ordered */
 .
if available pt_mstr
then do:
 put stream ft
 {us/xf/xfput.i pt_ship_wt      376 "->,>>>,>>9.99" }  /* Item Weight */
 {us/xf/xfput.i pt_ship_wt_um   389 "x(2)" }  /* unit of measure */
 {us/xf/xfput.i lvextweight     391 "->,>>>,>>9.99" }  /* Extended Weight */
 .

end.

/* end of new code << */
