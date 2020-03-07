/* xfivtot8.i - CONSOLIDATED INVOICE TRAILER DETAIL DISPLAY FOR {txnew.i}  */
/* soivtot8.i - CONSOLIDATED INVOICE TRAILER DETAIL DISPLAY FOR {txnew.i}  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivtot8.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 7.4      LAST MODIFIED: 07/29/93   BY: jjs *H050*             */
/* REVISION: 7.4      LAST MODIFIED: 11/17/94   BY: afs *GO53*             */
/* REVISION: 8.5      LAST MODIFIED: 11/27/97   BY: *J273* Nirav Parikh    */
/* REVISION: 8.6E     LAST MODIFIED: 05/05/98   BY: *L00L* Ed v.d.Gevel    */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan      */
/* REVISION: 8.6E     LAST MODIFIED: 08/19/98   BY: *J2WV* Surekha Joshi   */
/* REVISION: 8.6E     LAST MODIFIED: 10/05/99   BY: *L0JV* Anup Pereira    */
/* REVISION: 9.1      LAST MODIFIED: 12/17/99   BY: *J3MX* Surekha Joshi   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 07/06/00   BY: *N0F4* Mudit Mehta      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb              */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.6.1.6       BY: Ellen Borden       DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.6.1.7       BY: Manisha Sawant     DATE: 08/16/02  ECO: *N1RB* */
/* Revision: 1.6.1.8       BY: Vandna Rohira      DATE: 04/28/03  ECO: *N1YL* */
/* Revision: 1.6.1.10      BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.6.1.11      BY: Dinesh Dubey       DATE: 01/17/06  ECO: *P3HZ* */
/* $Revision: 1.2 $   BY: Jean Miller        DATE: 11/23/09  ECO: *R1TW* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong    DATE: 12/10/12  ECO: *93sp12.1   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/xf/xfivto98mx.i} /*93sp12.1*/
for first txc_ctrl where txc_ctrl.txc_domain = global_domain
no-lock: end.

if invtot_ord_amt < 0 then
   assign
      invcrdt = "**" + getTermLabel("C_R_E_D_I_T",11) + "**".
else
   assign
      invcrdt = "".

/*eb3sp5 comment begin
do on endkey undo, leave:
   assign
      nontax_fmt      = nontax_old
      taxable_fmt     = taxable_old
      line_tot_fmt    = line_tot_old
      container_fmt   = container_old
      line_charge_fmt = line_charge_old
      tax_amt_fmt     = tax_amt_old
      trl_amt_fmt     = trl_amt_old
      ord_amt_fmt     = ord_amt_old
      disc_fmt        = disc_old.

   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output nontax_fmt,   input rndmthd)"} 
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output taxable_fmt,  input rndmthd)"} 
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output line_tot_fmt, input rndmthd)"}
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output container_fmt,input rndmthd)"}
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output line_charge_fmt,input rndmthd)"}
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output tax_amt_fmt,  input rndmthd)"}
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output trl_amt_fmt,  input rndmthd)"}
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output ord_amt_fmt,  input rndmthd)"}
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output disc_fmt,     input rndmthd)"}
             
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame sotot:handle).

   assign
      nontaxable_amt:format in frame sotot         = nontax_fmt 
      taxable_amt:format in frame sotot            = taxable_fmt
      line_total:format in frame sotot             = line_tot_fmt
      container_charge_total:format in frame sotot = container_fmt      
      line_charge_total:format in frame sotot      = line_charge_fmt
      tax_amt:format in frame sotot                = tax_amt_fmt
      so_trl1_amt:format  in frame sotot           = trl_amt_fmt
      so_trl2_amt:format  in frame sotot           = trl_amt_fmt
      so_trl3_amt:format  in frame sotot           = trl_amt_fmt      
      ord_amt:format in frame sotot                = ord_amt_fmt
      disc_amt:format in frame sotot               = disc_fmt.    
        
   if txc__qad03 then
      display
         l_nontaxable_lbl
         invtot_nontaxable_amt @ nontaxable_amt
         l_taxable_lbl
         invtot_taxable_amt    @  taxable_amt
         with frame sotot.
   else
      display
         "" @ l_nontaxable_lbl
         "" @ nontaxable_amt
         "" @ l_taxable_lbl
         "" @ taxable_amt
         with frame sotot.

   display
      invtot_line_total          @ line_total
      invtot_container_amt       @ container_charge_total
      invtot_linecharge_amt      @ line_charge_total
      (if invtot_line_total <> 0 and l_consolidate then
      (round(invtot_disc_amt / invtot_line_total * -100, 2))
      else
      (so_disc_pct))
      @ so_disc_pct
      invtot_disc_amt            @ disc_amt
      user_desc
      so_trl1_cd invtot_trl1_amt @ so_trl1_amt
      so_trl2_cd invtot_trl2_amt @ so_trl2_amt
      so_trl3_cd invtot_trl3_amt @ so_trl3_amt
      invtot_tax_amt             @ tax_amt
      so_curr
      invcrdt
      invtot_ord_amt             @ ord_amt
      tax_date
      "" when (not maint)        @ tax_edit
   with frame sotot.

end. /* DO ON ENDKEY UNDO, LEAVE */
eb3sp5 comment end*/
