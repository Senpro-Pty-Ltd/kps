/* xfrp1amb.i - FORMTRAP ADDRESS MANIPULATION INCLUDE FILE                    */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

for each tt_tax exclusive-lock :
   delete tt_tax.
end. /*for each tt_tax*/

/*** LOAD TEMP TABLE WITH TAX DETAILS ***/
create tt_tax.
assign tt_sfb = 0.
if recid(tt_tax) = -1 then .

if sod_fsm_type <> fsmro_c /*NOT SSM*/
or (sod_fsm_type = fsmro_c and sod_fix_pr) /*SSM & fixed price*/
then do :
   /*** OBTAIN TAX LINKED TO sod_det ***/

   {us/bbi/gprun.i ""xftxtots.p"" "(
      input ""16"",
      input if comb_inv_nbr <> """" then comb_inv_nbr else so_inv_nbr, /* tx2d_ref */
      input so_nbr,   /*tx2d_nbr*/
      input sod_line,
      input """",     /*tx2d_trl*/
      output tot_tax,
      output tot_ex_tax)"}
   
   assign
      tt_tax_amt    = tot_tax
      tt_tax_ex_amt = tot_ex_tax.
end. /*if sod_fsm_type <> fsmro_c*/
else do:
   /*** OBTAIN TAX LINKED TO sfb_dets ***/
   assign tax_seq = 0.
   for each sfb_det no-lock
      where sfb_domain  = global_domain
        and sfb_nbr     = sod_nbr
        and sfb_so_line = sod_line
   by sfb_line :
      assign
         tax_seq  = tax_seq + 1
         tax_seqx = string(tax_seq,"99").

      {us/bbi/gprun.i ""xftxtots.p"" "(
         input ""16"",
         input if comb_inv_nbr <> """" then comb_inv_nbr else so_inv_nbr, /*ref*/
         input so_nbr,   /*tx2d_nbr*/
         input sod_line,
         input tax_seqx, /*tx2d_trl*/
         output tot_tax,
         output tot_ex_tax)"}

      create tt_tax.
      assign
         tt_sfb        = recid(sfb_det)
         tt_tax_amt    = tot_tax
         tt_tax_ex_amt = tot_ex_tax.
   end. /*for each sfb_det*/
   
   if not call-detail
   then do :
      /*** SUM ALL TAX AMOUNTS TO SOD LINE LEVEL ***/
      for each tt_tax exclusive-lock
         where tt_sfb <> 0 :
         accumulate
            tt_tax_amt (total)
            tt_tax_ex_amt (total).
         delete tt_tax.
      end. /*for each tt_tax*/
      
      find first tt_tax
         where tt_sfb = 0
      no-error.
      if available tt_tax then
         assign
            tt_tax_amt    = accum total tt_tax_amt
            tt_tax_ex_amt = accum total tt_tax_ex_amt.
   end. /*if not call-detail*/
end. /*else*/
