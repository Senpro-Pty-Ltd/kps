/* xxuttx02.p - Utility to replace tx2d_det records                      */
/*************************************************************************/
/* CYB    LAST MODIFIED: 15-MAY-2013     BY:  gbg c1406*                 */
/*************************************************************************/

{us/mf/mfdtitle.i x1}



def var invnbr    like ih_inv_nbr.
def var invnbr1   like ih_inv_nbr label "To".
def var vdate     like ih_inv_date.
def var vdate1    like ih_inv_date label "To".
def var vupdate   as logical.
def var vtaxamt   as dec format "->>,>>>,>>9.99" label "Tax Amt".


form
invnbr    colon 16  invnbr1 colon 44
vdate     colon 16  vdate1  colon 44
skip(1)
vupdate   colon 16 label "Update Y/N"
skip(2)
with frame a side-labels width 80.


mainloop:
repeat:

   if invnbr1 = hi_char then invnbr1 = " ".
   if vdate = low_date then vdate = ?.
   if vdate1 = hi_date then vdate1 = ?.
   vupdate = no.

   seloop:
   repeat:
      update
      invnbr invnbr1
      vdate  vdate1
      vupdate
      with frame a.

      leave seloop.
   end.
   if keyfunction(lastkey) = "end-error" then undo, leave.

   if invnbr1 = " " then invnbr1 = hi_char.
   if vdate = ? then vdate = low_date.
   if vdate1 = ? then vdate1 = hi_date.

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

   for each ih_hist no-lock
   where ih_domain = global_domain
   and   ih_inv_nbr >= invnbr and ih_inv_nbr <= invnbr1
   and   ih_inv_date >= vdate and ih_inv_date <= vdate1
   and   not can-find(first tx2d_det
                      where tx2d_domain = global_domain
		      and    tx2d_ref = ih_inv_nbr)
   :

      vtaxamt = 0.0.
      if ih_taxable 
      then do:
         vtaxamt = if ih_domain begins "au"
	           then (round(ih_invoicetotal / 11, 2))
	           else (round(ih_invoicetotal * 15 / 115, 2)).
      end.
      display
      ih_inv_nbr 
      ih_nbr
      ih_inv_date
      ih_invoicetotal  label "Invoice Total"
      vtaxamt
      ih_taxable
      ih_tax_usage
      with frame d width 132 down no-attr-space no-box. 
      down with frame d.

      if vupdate 
      then do transaction:

	 find first si_mstr no-lock
	 where si_domain = global_domain
	 and   si_site = ih_site
	 no-error.
	 find first tx2_mstr no-lock
	 where tx2_domain = global_domain
	 and   tx2_tax_type = "GST-O"
	 and   tx2_pt_taxc = ih_taxc
	 and   tx2_tax_usage = ih_tax_usage
	 and   tx2_effdate <= ih_inv_date
	 no-error.
	 find first idh_hist no-lock
	 where idh_domain = ih_domain
	 and   idh_inv_nbr = ih_inv_nbr
	 and   idh_taxable
	 no-error.

	 create tx2d_det.
	 assign
         tx2d_det.tx2d_abs_ret_amt =  0.0
         tx2d_det.tx2d_by_line = no
         tx2d_det.tx2d_carrier = ""
         tx2d_det.tx2d_curr = ih_curr
         tx2d_det.tx2d_cur_abs_ret_amt = 0.0
         tx2d_det.tx2d_cur_nontax_amt = 0.0
         tx2d_det.tx2d_cur_recov_amt = 0.0
         tx2d_det.tx2d_cur_tax_amt = vtaxamt
         tx2d_det.tx2d_domain =  global_domain
         tx2d_det.tx2d_edited = no
         tx2d_det.tx2d_effdate = ih_inv_date
         tx2d_det.tx2d_ent_abs_ret_amt = 0.0
         tx2d_det.tx2d_ent_nontax_amt = 0.0
         tx2d_det.tx2d_ent_recov_amt = 0.0
         tx2d_det.tx2d_ent_tax_amt = 0.0
         tx2d_det.tx2d_line =  0
         tx2d_det.tx2d_line_site_ent = if available si_mstr then si_ent else "1000"
         tx2d_det.tx2d_nbr =  ih_nbr
         tx2d_det.tx2d_nontax_amt =  0.0
         tx2d_det.tx2d_posted_date = ih_inv_date
         tx2d_det.tx2d_rcpt_tax_point = no
         tx2d_det.tx2d_recov_amt = 0.0
         tx2d_det.tx2d_ref =   ih_inv_nbr
         tx2d_det.tx2d_taxable_amt =  ih_invoicetotal - vtaxamt
	 .
	 assign
         tx2d_det.tx2d_taxc = ih_taxc
         tx2d_det.tx2d_tax_amt = vtaxamt
         tx2d_det.tx2d_tax_code = if available tx2_mstr then tx2_tax_code else "G010110"
         tx2d_det.tx2d_tax_env = ih_tax_env
         tx2d_det.tx2d_tax_in =  if available idh_hist then idh_tax_in else no
         tx2d_det.tx2d_tax_type = "GST-O"
         tx2d_det.tx2d_tax_usage = ih_tax_usage
         tx2d_det.tx2d_totamt = ih_invoicetotal - vtaxamt
         tx2d_det.tx2d_tottax = ih_invoicetotal - vtaxamt
         tx2d_det.tx2d_trans_ent = if available si_mstr then si_ent else "1000"
         tx2d_det.tx2d_trl =  ""
         tx2d_det.tx2d_tr_type = "16"
         tx2d_det.tx2d_usage_tax_point = no
         tx2d_det.tx2d_user1 =  "TEST"
         tx2d_det.tx2d_user2 =  ""
         tx2d_det.tx2d_zone_from = "COM"
         tx2d_det.tx2d_zone_to = "EXT"
	 .

      end.  /* if vupdate */

   end.    /* each ih_hist */
   {us/mf/mfrtrail.i}
end.
