/* xfivto10.i - GTM CONSOLIDATED INVOICE TRAILER DETAIL DISPLAY FOR {txnew.i} */
/* soivto10.i - GTM CONSOLIDATED INVOICE TRAILER DETAIL DISPLAY FOR {txnew.i} */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivto10.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 8.6E          CREATED: 12/04/98   BY: *J360* Poonam Bahl         */
/* REVISION: 9.0     LAST MODIFIED: 08/10/99   BY: *M0DM* Satish Chavan       */
/* REVISION: 9.0     LAST MODIFIED: 10/05/99   BY: *L0JV* Anup Pereira        */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane    */
/* REVISION: 9.1     LAST MODIFIED: 08/12/00   BY: *N0KN* myb                 */
/* Revision: 1.1.1.11   BY: Ellen Borden       DATE: 07/09/01 ECO: *P007*     */
/* Revision: 1.1.1.12   BY: Vandna Rohira      DATE: 04/28/03 ECO: *N1YL*     */
/* Revision: 1.1.1.14   BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L*     */
/* Revision: 1.1.1.15   BY: Shoma Salgaonkar   DATE: 01/27/04 ECO: *P1L8*     */
/* Revision: 1.1.1.17   BY: Swati Sharma       DATE: 02/27/04 ECO: *P1R4*     */
/* Revision: 1.1.1.18   BY: Tom Kennedy        DATE: 06/08/06 ECO: *Q0LK*     */
/* Revision: 1.1.1.19   BY: Masroor Alam       DATE: 08/05/06 ECO: *P54F*     */
/* Revision: 1.1.1.20     BY: Jing Li             DATE: 01/09/08  ECO: *R0JR* */
/* $Revision: 1.2 $  BY: Jean Miller         DATE: 11/23/09  ECO: *R1TW* */
/* Revision: QAD2016      BY: sxh   DATE: 31/03/16  ECO: *grc338*  */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

define variable l_rnd_flag       like mfc_logical     no-undo.
define variable rnd_amt          like sod_act_price   no-undo.
define variable rnd_acct         like sod_acct        no-undo.
define variable rnd_sub          like rndc_sub        no-undo.
define variable st_rndmthd       like rnd_rnd_mthd    no-undo.
define variable st_curr          like g_mgmt_curr     no-undo.

assign
   invtot_taxable_amt    = invtot_taxable_amt    + l_tax_amt
   invtot_nontaxable_amt = invtot_nontaxable_amt + l_nontax_amt.

for first txc_ctrl where txc_domain = global_domain
no-lock: end.

/* DISPLAY **C R E D I T** IN THE INVOICE TRAILER FOR CREDIT MEMOS */
if invtot_ord_amt < 0 then
   invcrdt = "**" + getTermLabel("C_R_E_D_I_T",11) + "**".
else
   invcrdt = "".

assign trl_amt = ih_trl_amt.

/*grc338 
do with frame ihtot:
*/ do :

   /* Apply Swiss Rounding before print */
   if ih_trl_amt <> 0
   then do:
      /* Check whether Swiss Rounding is enabled */
      {us/bbi/gprun.i ""soivpret.p"" "(output l_rnd_flag)"}

      /* Get rounded amount if rounding is enabled */
      if l_rnd_flag then do:
         {us/bbi/gprun.i ""sosorcet.p"" "(input ih_site,
                                   input ih_ship,
                                   input ih_curr,
                                   input invtot_ord_amt,
                                   output rnd_amt,
                                   output rnd_acct,
                                   output rnd_sub,
                                   output mc-error-number)"}
         /* Add trailer amount and modify total */
         assign
            trl_amt        = rnd_amt - invtot_ord_amt
            invtot_ord_amt = rnd_amt.
      end.
   end.
   /* GET ROUNDING METHOD FROM CURRENCY MASTER */
   st_curr = g_mgmt_curr.
   if g_mgmt_curr = "" then do:
      st_curr = if base_rpt =  "" then base_curr else ih_curr.
   end.
   {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
      "(input st_curr,
        output st_rndmthd,
        output mc-error-number)"}
   if mc-error-number <> 0
   then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      leave.
   end. /* IF mc-error-number <> 0 */
   /*grc338
   tax_sc_amt_fmt = tax_sc_amt:format in frame ihtot.               
   {us/bbi/gprun.i ""gpcurfmt.p"" 
      "(input-output tax_sc_amt_fmt,
       input st_rndmthd)"}
   tax_sc_amt:format in frame ihtot = tax_sc_amt_fmt.  
   /* SET EXTERNAL LABELS */  
   setFrameLabels(frame ihtot:handle).
   *grc338 **/

    /*grc338 - deleted
   if txc__qad03
   then do:
       /* invoice certification test */
       if ih__qadc05 <> "":U and 
          ih__qadc05 <> ?    and 
          num-entries(ih__qadc05,chr(4)) = 2
       then display 
               l_nontaxable_lbl
               absolute(invtot_nontaxable_amt) @ nontaxable_amt
               l_taxable_lbl
               absolute(invtot_taxable_amt) @ taxable_amt
               with frame ihtot.
       else display 
               l_nontaxable_lbl
               invtot_nontaxable_amt @ nontaxable_amt
               l_taxable_lbl
               invtot_taxable_amt @ taxable_amt
               with frame ihtot.
   end.
      
   else
      display
         "" @ l_nontaxable_lbl
         "" @ nontaxable_amt
         "" @ l_taxable_lbl
         "" @ taxable_amt
         with frame ihtot.

   /* invoice certification test */
   if ih__qadc05 <> "":U and 
      ih__qadc05 <> ?    and 
      num-entries(ih__qadc05,chr(4)) = 2
   then display
      ih_curr      when (base_rpt <> "")
      base_curr    when (base_rpt =  "")
                                 @ ih_curr
      absolute(invtot_line_total)          @ line_total
      (if invtot_line_total <> 0 then
               (round(invtot_disc_amt / invtot_line_total * -100, 2))
              else
                (ih_disc_pct)) @ ih_disc_pct
      absolute(invtot_disc_amt)            @ disc_amt
      tax_date
      user_desc[1]
      so-trl1-cd   when isConsolDom = yes @ ih_trl1_cd
      ih_trl1_cd   when isConsolDom = no
      absolute(invtot_trl1_amt)            @ ih_trl1_amt
      absolute(invtot_container_amt)       @ container_charge_total
      user_desc[2]
      so-trl2-cd   when isConsolDom = yes @ ih_trl2_cd
      ih_trl2_cd   when isConsolDom = no
      absolute(invtot_trl2_amt)            @ ih_trl2_amt
      absolute(invtot_linecharge_amt)      @ line_charge_total
      user_desc[3]
      so-trl3-cd   when isConsolDom = yes @ ih_trl3_cd
      ih_trl3_cd   when isConsolDom = no
      absolute(invtot_trl3_amt)            @ ih_trl3_amt
      absolute(invtot_tax_amt)             @ tax_amt
      g_mgmt_curr
      tax_sc_amt
      absolute(trl_amt)                    @ trl_amt
      absolute(invtot_ord_amt)             @ ord_amt
      invcrdt
      with frame ihtot.
   else display
      ih_curr      when (base_rpt <> "")
      base_curr    when (base_rpt =  "") @ ih_curr
      invtot_line_total                  @ line_total
      (if invtot_line_total <> 0 then
        (round(invtot_disc_amt / invtot_line_total * -100, 2))
       else
        (ih_disc_pct)) @ ih_disc_pct
      invtot_disc_amt                     @ disc_amt
      tax_date
      user_desc[1]
      so-trl1-cd   when isConsolDom = yes @ ih_trl1_cd
      ih_trl1_cd   when isConsolDom = no
      invtot_trl1_amt                     @ ih_trl1_amt
      invtot_container_amt                @ container_charge_total
      user_desc[2]
      so-trl2-cd   when isConsolDom = yes @ ih_trl2_cd
      ih_trl2_cd   when isConsolDom = no
      invtot_trl2_amt                     @ ih_trl2_amt
      invtot_linecharge_amt               @ line_charge_total
      user_desc[3]
      so-trl3-cd   when isConsolDom = yes @ ih_trl3_cd
      ih_trl3_cd   when isConsolDom = no
      invtot_trl3_amt                     @ ih_trl3_amt
      invtot_tax_amt                      @ tax_amt
      g_mgmt_curr
      tax_sc_amt
      trl_amt
      invtot_ord_amt                      @ ord_amt
      invcrdt
      with frame ihtot.
      grc338 comment end*/
end.
{us/xf/xfivto19m5.i} /*grc338*/
