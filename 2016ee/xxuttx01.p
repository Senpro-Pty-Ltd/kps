/* xxuttx01.p - Find and optionally delete Tax Only Invoices                 */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 29-NOV-2011     BY: gbg *c1263*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

{us/mf/mfdtitle.i +1}

define var nbr as char label "Order" .
define var nbr1 as char label "To".
define var vDelete as logical label "Delete".
define var vArchive as char format "x(40)" label "Archive".
define buffer btx2d  for tx2d_det.
define var vText as char format "x(78)" extent 2.
vText[1] = "This utility will list Sales Orders which only have tax details.".
vText[2] = "With the option to delete the tax records.".

define stream arc.

form
nbr colon 10 nbr1
vDelete   colon 10
vArchive  colon 10
skip (2)
vText[1] no-label
vText[2] no-label
with frame a width 80 side-labels no-attr-space.

nbr = " ".
nbr1 = " ".
vArchive = "tx2d.arc." + replace(string(today), "/", "").

mainloop:
repeat:
   if nbr1 = hi_char then nbr1 = "".
   vDelete = no.

   display
   vText[1]
   vText[2]
   with frame a.
   Update 
   nbr nbr1
   vDelete
   vArchive
   with frame a.

   if nbr1 = "" then nbr1 = hi_char.

   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType                = "printer"
               &printWidth               = 132
               &pagedFlag                = " "
               &stream                   = " "
               &appendToFile             = " "
               &streamedOutputToTerminal = " "
               &withBatchOption          = "yes"
               &displayStatementType     = 1
               &withCancelMessage        = "yes"
               &pageBottomMargin         = 6
               &withEmail                = "yes"
               &withWinprint             = "yes"
               &defineVariables          = "yes"}
   {us/bbi/mfphead.i}
   view frame phead1.
   output stream arc to value(vArchive).

   for each so_mstr no-lock 
   where so_domain = global_domain
   and   so_nbr >= nbr 
   and   so_nbr <= nbr1 
   and    so_compl_stat = "",
   each tx2d_det no-lock 
   where tx2d_det.tx2d_domain = so_domain
   and   tx2d_det.tx2d_ref = so_nbr
   and   tx2d_det.tx2d_nbr = ""
   and   tx2d_det.tx2d_line = 0
   and   tx2d_det.tx2d_trl = ""
   and   tx2d_det.tx2d_tr_type = "13" 
/*   and   tx2d_cur_tax_amt = tx2d_totamt */
   and   tx2d_totamt <> 0:
      
     find first sod_det no-lock 
     where sod_domain = so_domain 
     and   sod_nbr = so_nbr 
     and   sod_qty_inv <> 0 no-error .
     
     if not available sod_det 
     then  do:
         disp 
         tx2d_det.tx2d_ref 
         tx2d_det.tx2d_line 
         tx2d_det.tx2d_tax_code 
         tx2d_det.tx2d_cur_tax_amt 
         tx2d_det.tx2d_totamt   .  
	     export stream arc tx2d_det.
	 if vDelete
	 then do:
	     find first btx2d exclusive-lock
	     where recid(btx2d) = recid(tx2d_det)
	     no-error.
	     if available btx2d 
	     then do:
	       export stream arc tx2d_det.
               delete btx2d.
	     end.
	 end.
     end.  /* no available sod_det */
   end.

/*   {us/bbi/mfreset.i}   /* close output stream */ */
   {us/mf/mfrtrail.i}  /* print selection criteria */
   output stream arc close.
end.  /* mainloop */
