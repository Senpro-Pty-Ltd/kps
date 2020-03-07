/* xxivtx.p - List Orders with missing tax records                      */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */
/* $Revision: 1.2 $                                                     */
/*V8:ConvertMode=Report                                                 */
/* CYB   LAST MODIFIED: 13-OCT-2011        BY: gbg *c1251*               */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "1+ "}

def var nbr    like so_nbr.
def var nbr1   like so_nbr.

form
nbr    colon 16  label "Order"   nbr1 label "to" colon 34
skip(1)
with frame a width 80 side-labels no-attr-space.

form
so_nbr
so_ord_date
so_site
so_to_inv
so_invoiced
sod_line
sod_part
sod_type
sod_qty_inv
with frame d width 132 no-box no-attr-space down.


mainloop:
repeat:

   if nbr1 = hi_char then nbr1 = "".


   update nbr nbr1
   with frame a.

   if nbr1 = "" then nbr1 = hi_char.

   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
         &printWidth = 132
         &pagedFlag = " "
         &stream = " "
         &appendToFile = " "
         &streamedOutputToTerminal = " "
         &withBatchOption = "yes"
         &displayStatementType = 1
         &withCancelMessage = "yes"
         &pageBottomMargin = 6
         &withEmail = "yes"
         &withWinprint = "yes"
         &defineVariables = "yes"}




   for each sod_det no-lock
   where sod_domain = global_domain
   and   sod_nbr >= nbr and sod_nbr <= nbr1
   and   sod_qty_inv <> 0.0
   and   not can-find(first tx2d_det
         where tx2d_domain = global_domain
         and   tx2d_ref = sod_nbr
         and   tx2d_line = sod_line
         and   tx2d_tr_type = "13")
   and   not can-find(first tx2d_det
         where tx2d_domain = global_domain
         and   tx2d_ref = sod_nbr
         and   tx2d_line = 0
	 and   tx2d_trl = " "
         and   tx2d_tr_type = "13")
   ,
   first so_mstr no-lock
   where so_domain = global_domain
   and   so_nbr = sod_nbr:
       display
       so_nbr
       so_ord_date
       so_site
       so_to_inv
       so_invoiced
       sod_line
       sod_part
       sod_type
       sod_qty_inv
       with frame d.
       down with frame d.
   end.

   {us/bbi/mfreset.i}

end.   /* mainloop */
