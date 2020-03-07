/* xfdetrpb.i - DISPLAY TAX DETAIL AMOUNTS FOR A TRANSACTION                  */
/* txdetrpb.i - DISPLAY TAX DETAIL AMOUNTS FOR A TRANSACTION                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfdetrpb.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/*  This program displays a down frame of tax detail (by) for each            */
/*  tax type/class/usage shows the tax; descrip, amount, base amount & tax %  */
/* REVISION: 8.6            CREATED: 11/13/96   BY: *H0N8* Ajit Deodhar       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 12/28/98   BY: *J37L* Seema Varma        */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 12/29/99   BY: *J3MX* Surekha Joshi      */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 07/19/00   BY: *N0G9* Arul Victoria   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KC* myb                */
/* REVISION: 9.1      LAST MODIFIED: 08/18/00   BY: *N0LN* Mudit Mehta        */
/* Revision: 1.16       BY: Ed van de Gevel       DATE: 03/16/05  ECO: *R00H* */
/* Revision: 1.17       BY: Ed van de Gevel       DATE: 05/27/05  ECO: *R01J* */
/* Revision: 1.18     BY: Jean Miller           DATE: 03/02/06  ECO: *R02W* */
/* Revision: 1.21     BY: Puja Bajaj            DATE: 04/12/06  ECO: *P4P1* */
/* Revision: 1.22     BY: Prajakta Patil        DATE: 01/07/08  ECO: *P67L* */
/* $Revision: 1.2 $  BY: Alex Joy     DATE: 07/25/09  ECO: *P6WC* */
/* Revision: QAD2014  BY: Amol Dudvadkar        DATE: 03/16/15  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/

define buffer   local_ih_hist          for ih_hist.
define variable isInvoiceCertification as logical  no-undo.

find local_ih_hist where
     local_ih_hist.ih_domain  = global_domain and
     local_ih_hist.ih_inv_nbr = ref
     no-lock no-error.
if available local_ih_hist and
   local_ih_hist.ih__qadc05 <> ""  and
   local_ih_hist.ih__qadc05 <> ?   and
  num-entries(local_ih_hist.ih__qadc05,chr(4)) = 2
then assign isInvoiceCertification = true.
else assign isInvoiceCertification = false.

/* DISPLAY OF TAX DETAILS. */
for each taxdetail by typedesc
                   by taxclass
                   by taxusage:

   assign
      l_sign = if tr_type = "25" or tr_type = "21"
               then -1
               else  1.

      if taxtotal < 0
      then
         taxtotal = taxtotal * l_sign.

      if taxbase < 0
      then
         taxbase  = taxbase  * l_sign.

      if nontax < 0
      then
         nontax   = nontax   * l_sign.

   if col-80 then do:

      /*grc338
      if page-size - line-counter - (if first_page then page_break else 0) < 3
      then do:
         view frame continue.
         page.
         first_page = false.
      end.

      if not taxstopdisplay
      then do:
	     if isInvoiceCertification
         then display
				taxdetail.typedesc @ taxdetail.taxdesc
				taxdetail.taxclass
				absolute(taxdetail.taxtotal) @ taxdetail.taxtotalsc
				taxdetail.taxpercnt
				absolute(taxdetail.taxbase) @ taxdetail.nontax
				with frame det_80.
         else display
				taxdetail.typedesc @ taxdetail.taxdesc
				taxdetail.taxclass
				taxdetail.taxtotal @ taxdetail.taxtotalsc
				taxdetail.taxpercnt
				taxdetail.taxbase @ taxdetail.nontax
				with frame det_80.


         down with frame det_80.

         if taxdetail.taxadj <> 0 then
            display taxdetail.taxadj @ taxdetail.taxtotalsc with frame det_80.

		 if isInvoiceCertification
         then display
				taxdetail.taxdesc
				taxdetail.taxusage @ taxdetail.taxclass
                                taxdetail.taxtotal @ taxdetail.taxtotalsc
				absolute(taxdetail.nontax) when (taxdetail.nontax <> 0) @ taxdetail.nontax
				with frame det_80.
         else display
				taxdetail.taxdesc
				taxdetail.taxusage @ taxdetail.taxclass
                                taxdetail.taxtotal @ taxdetail.taxtotalsc
				taxdetail.nontax when (taxdetail.nontax <> 0) @ taxdetail.nontax
				with frame det_80.

         put skip(1).
      end. /* IF NOT taxstopdisplay */
      ************grc338*/
   end.

   else do:

      assign
         l-taxdesc  = taxdetail.taxdesc
         l-taxclass = taxdetail.taxclass
         l-nontax   = taxdetail.nontax.


      /*grc338
      if not taxstopdisplay
      then do:
	     if isInvoiceCertification
		 then display
				taxdetail.typedesc
				l-taxdesc
				l-taxclass
				taxdetail.taxusage
				absolute(taxdetail.taxtotal) @ taxdetail.taxtotal
				taxdetail.taxpercnt
				absolute(taxdetail.taxbase) @ taxdetail.taxbase
				l-nontax
				with frame det_132.
		 else display
				taxdetail.typedesc
				l-taxdesc
				l-taxclass
				taxdetail.taxusage
				taxdetail.taxtotal
				taxdetail.taxpercnt
				taxdetail.taxbase
				l-nontax
				with frame det_132.

         down 1 with frame det_132.

         if taxdetail.taxadj <> 0 then do:

            down with frame det_132.

			if isInvoiceCertification
			then do:
				if ar_ap then
				   display
					  "  " + getTermLabel("ABSORBED",22) @ l-taxdesc
					  absolute(taxdetail.taxadj) @ taxdetail.taxtotal
					  with frame det_132.
				else
				   display
					  "  " + getTermLabel("RECOVERABLE",22) @ l-taxdesc
					  absolute(taxdetail.taxadj) @ taxdetail.taxtotal
					  with frame det_132.
			end.
			else do:
				if ar_ap then
					   display
						  "  " + getTermLabel("ABSORBED",22) @ l-taxdesc
						  taxdetail.taxadj @ taxdetail.taxtotal
						  with frame det_132.
					else
					   display
						  "  " + getTermLabel("RECOVERABLE",22) @ l-taxdesc
						  taxdetail.taxadj @ taxdetail.taxtotal
						  with frame det_132.
			end.

            down with frame det_132.

         end.
      end. /* IF NOT taxstopdisplay */
      *****grc338***/
   end.

   {us/xf/xfdetr9bms.i} /*grc338*/

   /*grc338
   if execname <> "soivpst.p" then
   */ if (execname <> "soivpst.p" and execname <> "xfivpst.p") then
   do:
      {us/mf/mfrpchk.i &label=mainloop} /* exit if f4 */
   end. /* IF EXECNAME <> "SOIVPST.P" */

   /*grc338 **
   if taxdetail.taxpercnt = 0 then do:
      if taxdetail.taxlang <> "" then do:
         for first txc_ctrl where txc_domain = global_domain
         no-lock:
            repeat i = 1 to num-entries(taxdetail.taxlang):
               l_taxlang = entry(i, taxdetail.taxlang).
               {us/gp/gpcmtpr2.i
                  &type=txc_comment_type
                  &id=taxdetail.taxcmtindx
                  &pos=3
                  &lang=l_taxlang}
            end.
         end.
      end.
   end.
   **grc338*/

end. /* FOR EACH DETAIL */
