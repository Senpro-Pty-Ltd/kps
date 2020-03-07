/* xfsotr92.i - SALES ORDER TRAILER - TAX MANAGEMENT                          */
/* sosotrl2.i - SALES ORDER TRAILER - TAX MANAGEMENT                          */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsotr92.i,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* REVISION: 7.4            CREATED: 10/02/95   BY: jym *G0XY*                */
/* REVISION: 8.5      LAST MODIFIED: 07/22/93   BY: bcm *H032*                */
/* REVISION: 8.5      LAST MODIFIED: 07/12/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 01/08/96   BY: jzw *H0K0*                */
/* REVISION: 8.5      LAST MODIFIED: 04/11/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/11/96   BY: *J04C* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 06/10/96   BY: *J0RX* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 06/24/96   BY: *J0WF* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 07/22/96   BY: *J10J* Kieu Nguyen        */
/* REVISION: 8.5      LAST MODIFIED: 08/02/96   BY: *J13H* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 11/25/96   BY: *K01X* jzw                */
/* REVISION: 8.6      LAST MODIFIED: 03/18/97   BY: *J1L9* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 10/09/97   BY: *K0JV* Surendra Kumar     */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/05/98   BY: *L00L* E. vdGevel         */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/23/98   BY: *L01G* Robin McCarthy     */
/* REVISION: 8.6E     LAST MODIFIED: 06/24/98   BY: *L02W* Russ Witt          */
/* REVISION: 8.6E     LAST MODIFIED: 01/22/99   BY: *J38T* Poonam Bahl        */
/* REVISION: 8.6E     LAST MODIFIED: 02/10/99   BY: *L0D4* Satish Chavan      */
/* REVISION: 8.6E     LAST MODIFIED: 05/07/99   BY: *J3DQ* Niranjan R.        */
/* REVISION: 8.6E     LAST MODIFIED: 09/28/99   BY: *L0J4* Satish Chavan      */
/* REVISION: 9.1      LAST MODIFIED: 02/24/00   BY: *M0K0* Ranjit Jain        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 07/06/00   BY: *N0F4* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/06/00   BY: *N0D0* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 10/16/00   BY: *N0WC* Mudit Mehta        */
/* Revision: 1.24       BY: Katie Hilbert        DATE: 04/01/01  ECO: *P002*  */
/* Revision: 1.25       BY: Ellen Borden         DATE: 07/06/01  ECO: *P007*  */
/* Revision: 1.26       BY: Ashwini G.           DATE: 01/10/02  ECO: *L194*  */
/* Revision: 1.27       BY: Jean Miller          DATE: 04/09/02  ECO: *P058*  */
/* Revision: 1.28       BY: Manisha Sawant       DATE: 07/11/02  ECO: *N1NW*  */
/* Revision: 1.29       BY: Vandna Rohira        DATE: 04/28/03  ECO: *N1YL*  */
/* Revision: 1.31       BY: Paul Donnelly (SB)   DATE: 06/28/03  ECO: *Q00L*  */
/* Revision: 1.32       BY: Vivek Gogte          DATE: 08/02/03  ECO: *N2GZ*  */
/* Revision: 1.33       BY: Manish Dani          DATE: 09/01/03  ECO: *P0VZ*  */
/* Revision: 1.34       BY: Rajaneesh S.         DATE: 01/08/04  ECO: *P1GK*  */
/* Revision: 1.35       BY: Sachin Deshmukh      DATE: 07/21/04  ECO: *P2BQ*  */
/* Revision: 1.38       BY: Ed van de Gevel      DATE: 03/01/05  ECO: *R00G*  */
/* Revision: 1.39       BY: Prashant Menezes     DATE: 08/29/06  ECO: *P53L*  */
/* Revision: 1.41       BY: Suyash Keny          DATE: 09/08/06  ECO: *R086*  */
/* Revision: 1.42       BY: Zheng Huang          DATE: 05/08/07  ECO: *R0C6*  */
/* Revision: 1.43       BY: Sameer Lodha         DATE: 10/24/07  ECO: *R0J5*  */
/* Revision: 1.45       BY: Deirdre O'Brien      DATE: 03/13/08  ECO: *R0P6*  */
/* Revision: 1.46       BY: Jean Miller          DATE: 06/18/08  ECO: *R0TC*  */
/* Revision: 1.49       BY: Jean Miller          DATE: 07/11/08  ECO: *R0WJ*  */
/* $Revision: 1.2 $    BY: Jean Miller          DATE: 11/22/09  ECO: *R1TW*  */
/* Revision: QAD2014    BY: Amol Dudvadkar       DATE: 03/16/15 ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*! N1YL HAS CHANGED THE WAY TAXABLE/NON-TAXABLE AMOUNT IS CALCULATED.
    THE ORDER DISCOUNT IS APPLIED FOR EACH LINE TOTAL AND THEN IT IS
    SUMMED UP TO CALCULATE THE TAXABLE/NON-TAXABLE AMOUNT BASED ON THE
    TAXABLE STATUS OF EACH LINE. PREVIOUSLY, TAXABLE/NON-TAXABLE AMOUNT
    WAS OBTAINED FROM THE GTM TABLES. THIS CAUSED PROBLEMS WHEN
    MULTIPLE TAXABLE BASES ARE USED TO CALCULATE TAX.

    TAXABLE/NON-TAXABLE AMOUNT WILL NOW BE DISPLAYED IN THE TRAILER
    FRAME BASED ON THE VALUE OF THE FLAG "DISPLAY TAXABLE/NON-TAXABLE
    AMOUNT ON TRAILER" IN THE GLOBAL TAX MANAGEMENT CTRL FILE
 */

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

/*grc338 */ {us/xf/xfso05u.i}
/*grc338*/  {us/xf/xftxtots.i}
{us/gp/gprunpdf.i "sopl" "p"}
{us/px/pxmaint.i}
{us/px/pxphdef.i sosoxr}
{us/so/sotxidef.i}

/* NEW SHARED VARIABLES, BUFFERS AND FRAMES */
define new shared variable undo_txdetrp     like mfc_logical.
define new shared variable tax_recno        as recid.

/* l_txchg IS SET TO TRUE IN TXEDIT.P WHEN TAXES ARE BEING EDITED  */
/* AND NOT JUST VIEWED IN DR/CR MEMO MAINTENANCE                   */
define new shared variable l_txchg     like mfc_logical initial no.

/* SHARED VARIABLES, BUFFERS AND FRAMES */
define shared variable rndmthd          like rnd_rnd_mthd.
define shared variable display_trail    like mfc_logical.
define shared variable so_recno         as recid.
define shared variable maint            like mfc_logical.
define shared variable taxable_amt      as decimal
   format "->>>>,>>>,>>9.99"
   label "Taxable".
define shared variable line_taxable_amt like taxable_amt.
define shared variable nontaxable_amt   like taxable_amt label "Non-Taxable".
define shared variable line_total       as decimal
   format "-zzzz,zzz,zz9.99"
   label "Line Total".
define shared variable disc_amt         like line_total
   label "Discount"
   format "(zzzz,zzz,zz9.99)".
define shared variable tax_amt          like line_total label "Total Tax".
define shared variable ord_amt          like line_total label "Total".
define shared variable user_desc        like trl_desc extent 3.
define shared variable total_pst        like line_total.
define shared variable tax_date         like so_tax_date.
define shared variable new_order        like mfc_logical.
define shared variable tax_edit         like mfc_logical.
define shared variable tax_edit_lbl     like mfc_char format "x(28)".
define shared variable invcrdt          as character  format "x(15)".
define shared variable undo_trl2        like mfc_logical.
define shared variable due_date_range   like mfc_logical.
define shared variable date_range       like sod_due_date.
define shared variable date_range1      like sod_due_date.
define shared variable l_cr_ord_amt     like line_total  no-undo.

define shared  variable container_charge_total as decimal
   format "->>>>>>>>9.99"
   label "Containers" no-undo.
define  shared variable line_charge_total as decimal
   format "->>>>>>>>9.99"
   label "Line Charges" no-undo.
define shared variable l_nontaxable_lbl as character format "x(12)" no-undo.
define shared variable l_taxable_lbl    as character format "x(12)" no-undo.

/*grc338 define shared frame sotot. */

/* LOCAL VARIABLES, BUFFERS AND FRAMES */
define variable tax_tr_type     like tx2d_tr_type initial "11".
define variable tax_nbr         like tx2d_nbr initial "".
define variable tax_lines       like tx2d_line initial 0.
define variable disc_pct        like so_disc_pct.
define variable page_break      as integer initial 10.
define variable col-80          as logical initial true.
define variable recalc          like mfc_logical initial true.
define variable credit_hold     like mfc_logical no-undo.
define variable corr_inv        like mfc_logical no-undo.
define variable base_amt        like ar_amt.
define variable retval          as integer.
define variable balance_fmt     as character.
define variable limit_fmt       as character.
define variable ext_line_actual like sod_price no-undo.
define variable l_cr_line_total as   decimal    no-undo.
define variable l_cr_disc_amt   like line_total no-undo.
define variable tms-error       like msg_nbr    no-undo.
define variable exrate          like exr_rate no-undo.
define variable exrate2         like exr_rate no-undo.
define variable ordertotal      as   decimal  no-undo.
define variable before_ordertotal as decimal  no-undo.
define variable iValidCustomerCreditLimit as integer        no-undo.
define variable creditStatus    as character initial "HD"   no-undo.

/* CREDIT MANAGEMENT */
define variable hCreditLibrary    as handle        no-undo.
define variable iReturnStatus         as integer no-undo.

{us/mf/mfcredpl.i "hCreditLibrary"}
{us/fs/fsconst.i} /* FIELD SERVICE CONSTANTS */
{us/tx/txcalvar.i}

{us/et/etvar.i}     /* TOOLKIT GENERAL VARIABLES */
{us/et/etrpvar.i}   /* TOOLKIT REPORTING CURRENCY VARIABLES */
{us/bbi/gpfilev.i}   /* VARIABLE DEFINITIONS FOR gpfile.i */

{us/cc/cclc.i}  /* DETERMINE IF CONTAINER AND LINE CHARGES ARE ENABLED */


run initialiseCreditManagementLibrary
   ( input  hCreditLibrary,
     output hCreditLibrary).

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.
find first soc_ctrl where soc_ctrl.soc_domain = global_domain no-lock.

/* SET LIMIT_FMT ACCORDING TO BASE CURR ROUND METHOD*/
limit_fmt = "->>>>,>>>,>>9.99".
{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output limit_fmt,
     input gl_rnd_mthd)"}

/* SET BALANCE_FMT ACCORDING TO BASE CURR ROUND METHOD*/
balance_fmt = "->>>>,>>>,>>9.99".
{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output balance_fmt,
     input gl_rnd_mthd)"}

if maint then /* LOCK THE RECORD */
   find so_mstr where recid(so_mstr) = so_recno exclusive-lock.
else /* PRINTING - DON'T LOCK THE RECORD */
   find so_mstr where recid(so_mstr) = so_recno no-lock.

tax_nbr = so_quote.

if so_fsm_type = 'RMA' then
   assign tax_tr_type = '36'.

/* USE TRANSACTION TYPE 38 FOR CALL INVOICE RECORDING (SSM) */
/* AND SET THE TAX_NBR TO THE CALL'S QUOTE (IF ANY) */
if so_fsm_type = fsmro_c then do:

   for first ca_mstr where ca_domain = global_domain
      and ca_category = '0'
      and ca_nbr      = so_nbr
   no-lock:
      tax_nbr = ca_quote_nbr.
   end.

   tax_tr_type = "38".

end.

/**** FORMS ****/
form
   so_nbr
   so_cust
   so_bill
   so_ship
with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

{us/so/sosomt01.i}  /* Define shared frame d */
{us/so/socurvar.i}
{us/tx/txcurvar.i}
/*grc338
{us/so/sototfrm.i} */

tax_nbr = so_quote.

if not maint and display_trail then do:

   tax_edit_lbl = "".
   undo_txdetrp = true.

/**grc338 COMMENTED PORTION BEGINS**
   {us/bbi/gprun.i  ""txdetrp.p""
      "(input tax_tr_type,
        input so_nbr,
        input tax_nbr,
        input col-80,
        input page_break,
        input '',
        input yes)" }
**grc338 COMMENTED PORTION ENDS**/

/**grc338 ADDED PORTION BEGINS**/
   {us/bbi/gprun.i  ""xfdetrp.p"" "(input tax_tr_type,
        input so_nbr,
        input tax_nbr,
        input col-80,
        input page_break,
        input '',
        input yes)" }
/**grc338 ADDED PORTION ENDS**/

   if undo_txdetrp = true then undo, leave.

   if page-size - line-counter < page_break then page.

/**grc338 COMMENTED PORTION BEGINS**
   do while page-size - line-counter > page_break:
      put skip(1).
   end.

   put
      "-----------------------------------------" +
      "-----------------------------------------" format "x(80)".
**grc338 COMMENTED PORTION ENDS**/
end.

taxloop:
do on endkey undo, leave:

   /*** GET TOTALS FOR LINES ***/
   assign
      l_cr_line_total         = 0
      line_total              = 0
      taxable_amt             = 0
      l_ord_contains_tax_in_lines = can-find (first sod_det
                                              where sod_domain = global_domain
                                              and sod_nbr    = so_nbr
                                              and sod_taxable
                                              and sod_tax_in
                                              and sod_compl_stat = "")
      nontaxable_amt          = 0
      container_charge_total  = 0
      line_charge_total       = 0.

   if so_tax_date = ? then
      tax_date = so_due_date.
   else
      tax_date = so_tax_date.
   if tax_date = ? then
      tax_date = so_ord_date.

   empty temp-table t_store_ext_actual no-error.

   /* ACCUMULATE LINE AMOUNTS */
   for each sod_det where sod_domain = global_domain
      and sod_nbr = so_nbr
      and sod_compl_stat = ""
   {&sod_for_each} no-lock:

      /* NEW SET OF VARIABLES ARE INTRODUCED TO CALCULATE THE ORDER */
      /* AMOUNT WHICH IS USED IN CREDIT HOLD LOGIC AND THE EXISTING */
      /* SET OF VARIABLES ARE USED TO CALCULATE THE OPEN AMOUNT     */
      if using_line_charges then do:

         for each sodlc_det where sodlc_domain = global_domain
            and sodlc_order = sod_nbr
            and sodlc_ord_line = sod_line
         no-lock:

            if sodlc_one_time and sodlc_times_charged > 0 then next.

            ext_line_actual = sodlc_ext_price.

            /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
               "(input-output ext_line_actual,
                 input rndmthd,
                 output mc-error-number)"}
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM = mc-error-number &ERRORLEVEL=2}
            end.
            assign
               line_charge_total = line_charge_total + ext_line_actual
               line_total = line_total + ext_line_actual.

            for first trl_mstr where trl_domain = global_domain
               and trl_code = sodlc_trl_code
            no-lock: end.

            if available trl_mstr then do:
               if trl_taxable then
                  taxable_amt = taxable_amt + ext_line_actual.
               else
                  nontaxable_amt = nontaxable_amt + ext_line_actual.
            end. /*IF AVAILABLE TRL_MSTR*/

         end. /* FOR EACH SODLC_DET*/

      end. /*IF USING_LINE_CHARGES*/

      run p-line-total
         (input        rndmthd,
          input        mc-error-number,
          input        so_disc_pct,
          input-output line_total,
          input-output l_cr_line_total,
          input-output taxable_amt,
          input-output line_taxable_amt,
          input-output nontaxable_amt,
          buffer       sod_det).

   end.

   find cil_mstr where cil_domain = global_domain
      and cil_cor_so_nbr = so_nbr
   no-lock no-error.

   corr_inv = available cil_mstr.

   if not corr_inv and maint and new_order then do: /* Sales volume discount */

      {us/bbi/gprun.i ""sosd.p"" "(input so_ord_date,
           input so_ex_rate,
           input so_ex_rate2,
           input so_cust,
           input so_curr,
           input line_total,
           output disc_pct)"}

      if disc_pct > so_disc_pct and disc_pct <> 0 then
         so_disc_pct = disc_pct.

   end.

   run p-disc-taxable-nontaxable-amt
      (input        rndmthd,
       input        mc-error-number,
       input        line_total,
       input        l_cr_line_total,
       input        so_disc_pct,
       input-output disc_amt,
       input-output l_cr_disc_amt,
       input-output taxable_amt,
       input-output nontaxable_amt).

   /* ADD TRAILER AMOUNTS */
   {us/tx/txtrltrl.i so_trl1_cd so_trl1_amt user_desc[1] so_tax_env}
   {us/tx/txtrltrl.i so_trl2_cd so_trl2_amt user_desc[2] so_tax_env}
   {us/tx/txtrltrl.i so_trl3_cd so_trl3_amt user_desc[3] so_tax_env}

   /* CHECK PREVIOUS DETAIL FOR EDITED VALUES */
   if maint
   then do:
      for first tx2d_det where tx2d_domain = global_domain
         and tx2d_ref = so_nbr
         and tx2d_nbr = so_quote
         and tx2d_tr_type = tax_tr_type
         and tx2d_edited
      no-lock: end.
      if available(tx2d_det) then do:
         /* Previous tax values edited. Recalculate? */
         {us/bbi/pxmsg.i &MSGNUM=917 &ERRORLEVEL=2 &CONFIRM=recalc}
      end.
   end.

   if maint and recalc then do:
      /* CALCULATE TAXES */
      /* NOTE nbr FIELD BLANK FOR SALES ORDERS */
      /* ADDED TWO PARAMETERS TO TXCALC.P, INPUT PARAMETER VQ-POST
       *  AND OUTPUT PARAMETER RESULT-STATUS. THE POST FLAG IS SET
       *  TO 'NO' BECAUSE WE ARE NOT CREATING QUANTUM REGISTER
       *  RECORDS FROM THIS CALL TO TXCALC.P */
      {us/bbi/gprun.i ""txcalc.p""
         "(input  tax_tr_type,
           input  so_nbr,
           input  tax_nbr,
           input  tax_lines, /*ALL LINES*/
           input  no,
           output result-status)"}
   end. /* if maint */

   {us/bbi/gprun.i ""txabsrb.p""
      "(input so_nbr,
        input so_quote,
        input tax_tr_type,
        input-output line_total,
        input-output taxable_amt)"}

   run p-linetax-incltax-ord-amt
      (input        tax_tr_type,
       input        tax_nbr,
       input        tax_lines,
       input        total_pst,
       input        l_cr_disc_amt,
       input-output disc_amt,
       input-output tax_amt,
       input-output line_total,
       input-output l_cr_line_total,
       input-output line_taxable_amt,
       input-output ord_amt,
       input-output l_cr_ord_amt,
       input-output taxable_amt,
       buffer       so_mstr).

   /* CHECK CREDIT AMOUNTS */
   if ord_amt < 0 then
      invcrdt = "**" + getTermLabel("C_R_E_D_I_T",11) + "**".
   else
      invcrdt = "".

   /* IF IN SO MAINT. THEN RECALCULATE TAXES AFTER EDITING */
   if maint then do:

      /* CHECK CREDIT LIMIT */
      /* If the bill-to customer's outstanding balance is already above   */
      /* F4 out of the trailer screen, bypassing the check done after     */
      /* Note that we don't bother checking if we're not going to put the */
      if so_stat = "" and so_app_owner <> "DOM"
         and soc_cr_hold
      then do:

         for first cm_mstr where cm_domain = global_domain
            and cm_addr = so_bill
         no-lock: end.

         base_amt = ord_amt.

         if so_curr <> base_curr
         then do:
            /* CONVERT TO BASE CURRENCY */
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
               "(input so_curr,
                 input base_curr,
                 input so_ex_rate,
                 input so_ex_rate2,
                 input base_amt,
                 input true,
                 output base_amt,
                 output mc-error-number)"}
         end.

         iValidCustomerCreditLimit = validCustomerCreditLimit(
                                     cm_mstr.cm_addr,
                                     ord_amt,
                                     getBeforeOrderTotal(so_nbr),
                                     so_curr,
                                     2,
                                     "SO",
                                     no).

         if iValidCustomerCreditLimit <> 0 then do:
            creditStatus = getActionStatus("SO").
         end.

         /* NOTE: DO NOT PUT CALL REPAIR ORDERS (FSM-RO) ON HOLD - BECAUSE */
         /*    THESE ORDERS WILL NOT BE SHIPPING ANYTHING, ONLY INVOICING  */
         /*    FOR WORK ALREADY DONE.                                      */
         if iValidCustomerCreditLimit < 0
            and so_fsm_type <> "FSM-RO"
            and so_fsm_type <> "RMA"
         then do:
            /* Sales Order placed on credit hold */
            assign
               credit_hold = true
               so_stat = creditStatus.

            display so_stat with frame d.

            /* # Placed on Credit Hold */
            {us/bbi/pxmsg.i &MSGNUM=690 &ERRORLEVEL=1
                     &MSGARG1=getTermLabel(""SALES_ORDER"",20)}
         end.

      end.

    /*grc338  {us/so/sototdsp.i} /* DISPLAY ALL FIELDS */ */
/*grc338*/ {us/xf/xfsotds9.i}

      trlloop:
      do on error undo, retry
         on endkey undo taxloop, leave:

         set
            so_disc_pct when not corr_inv
            so_trl1_cd  when not corr_inv
            so_trl1_amt
            so_trl2_cd  when not corr_inv
            so_trl2_amt
            so_trl3_cd  when not corr_inv
            so_trl3_amt
            tax_edit
         with frame sotot.

         if so_disc_pct >   100
         or so_disc_pct < - 100
         then do:
            {us/bbi/pxmsg.i &MSGNUM=6932 &ERRORLEVEL=3 &MSGARG1=so_disc_pct}
            next-prompt so_disc_pct with frame sotot.
            undo trlloop, retry.
         end.

         {us/tx/txedttrl.i &code  = "so_trl1_cd"
            &amt   = "so_trl1_amt"
            &desc  = "user_desc[1]"
            &frame = "sotot"
            &loop  = "trlloop"}

         /* VALIDATE TRAILER AMOUNT BASE ON ROUNDING METHOD */
         if (so_trl1_amt <> 0) then do:
            {us/bbi/gprun.i ""gpcurval.p""
               "(input so_trl1_amt,
                 input rndmthd,
                 output retval)"}
            if (retval <> 0) then do:
               next-prompt so_trl1_amt with frame sotot.
               undo trlloop, retry.
            end.
         end.

         {us/tx/txedttrl.i &code  = "so_trl2_cd"
            &amt   = "so_trl2_amt"
            &desc  = "user_desc[2]"
            &frame = "sotot"
            &loop  = "trlloop"}

         /* VALIDATE TRAILER AMOUNT BASE ON ROUNDING METHOD */
         if (so_trl2_amt <> 0) then do:
            {us/bbi/gprun.i ""gpcurval.p""
               "(input so_trl2_amt,
                 input rndmthd,
                 output retval)"}
            if (retval <> 0) then do:
               next-prompt so_trl2_amt with frame sotot.
               undo trlloop, retry.
            end.
         end.

         {us/tx/txedttrl.i &code  = "so_trl3_cd"
            &amt   = "so_trl3_amt"
            &desc  = "user_desc[3]"
            &frame = "sotot"
            &loop  = "trlloop"}

         /* VALIDATE TRAILER AMOUNT BASE ON ROUNDING METHOD */
         if (so_trl3_amt <> 0) then do:
            {us/bbi/gprun.i ""gpcurval.p""
               "(input so_trl3_amt,
                 input rndmthd,
                 output retval)"}
             if (retval <> 0) then do:
                next-prompt so_trl3_amt with frame sotot.
                undo trlloop, retry.
             end.
         end.

      end. /* TRLLOOP: DO ON ERROR UNDO, RETRY */

      /*** RECALCULATE TOTALS FOR LINES ***/
      assign
         l_cr_line_total        = 0
         line_total             = 0
         taxable_amt            = 0
         nontaxable_amt         = 0
         container_charge_total = 0
         line_charge_total      = 0.

      /* ACCUMULATE LINE AMOUNTS */
      for each sod_det where sod_domain = global_domain
         and sod_nbr = so_nbr
         and sod_compl_stat = ""
      {&sod_for_each} no-lock:

         if using_line_charges then do:

            for each sodlc_det where sodlc_domain = global_domain
               and sodlc_order = sod_nbr
               and sodlc_ord_line = sod_line
            no-lock:

               if sodlc_one_time and sodlc_times_charged > 0 then next.

               ext_line_actual = sodlc_ext_price.

               /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                  "(input-output ext_line_actual,
                    input rndmthd,
                    output mc-error-number)"}
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
               end.

               assign
                  line_charge_total = line_charge_total + ext_line_actual
                  line_total = line_total + ext_line_actual.

               for first trl_mstr where trl_domain = global_domain
                  and trl_code = sodlc_trl_code
               no-lock:
                  if trl_taxable then
                     taxable_amt = taxable_amt + ext_line_actual.
                  else
                     nontaxable_amt = nontaxable_amt + ext_line_actual.
               end.

            end. /* FOR EACH SODLC_DET*/

         end. /*IF USING_LINE_CHARGES*/

         run p-line-total
            (input        rndmthd,
             input        mc-error-number,
             input        so_disc_pct,
             input-output line_total,
             input-output l_cr_line_total,
             input-output taxable_amt,
             input-output line_taxable_amt,
             input-output nontaxable_amt,
             buffer       sod_det).

      end.

      run p-disc-taxable-nontaxable-amt
         (input        rndmthd,
          input        mc-error-number,
          input        line_total,
          input        l_cr_line_total,
          input        so_disc_pct,
          input-output disc_amt,
          input-output l_cr_disc_amt,
          input-output taxable_amt,
          input-output nontaxable_amt).

      /* ADD TRAILER AMOUNTS */
      {us/tx/txtrltrl.i so_trl1_cd so_trl1_amt user_desc[1] so_tax_env}
      {us/tx/txtrltrl.i so_trl2_cd so_trl2_amt user_desc[2] so_tax_env}
      {us/tx/txtrltrl.i so_trl3_cd so_trl3_amt user_desc[3] so_tax_env}

      /****** CALCULATE TAXES ************/
      if recalc then do:
         /* ADDED TWO PARAMETERS TO TXCALC.P, INPUT PARAMETER VQ-POST
         *  AND OUTPUT PARAMETER RESULT-STATUS. THE POST FLAG IS SET
         *  TO 'NO' BECAUSE WE ARE NOT CREATING QUANTUM REGISTER
         *  RECORDS FROM THIS CALL TO TXCALC.P */
         {us/bbi/gprun.i ""txcalc.p""
            "(input  tax_tr_type,
              input  so_nbr,
              input  tax_nbr,
              input  tax_lines, /*ALL LINES*/
              input  no,
              output result-status)"}
      end.

      {us/bbi/gprun.i ""txabsrb.p""
         "(input so_nbr,
           input so_quote,
           input tax_tr_type,
           input-output line_total,
           input-output taxable_amt)"}

      /* DO TAX DETAIL DISPLAY / EDIT HERE */
      if tax_edit then do:
         hide frame sotot no-pause.
         hide frame d no-pause.

         /* ADDED so_curr,so_ex_ratetype,so_ex_rate,so_ex_rate2  */
         /* AND tax_date AS SIXTH, SEVENTH, EIGTH, NINTH         */
         /* AND TENTH INPUT PARAMETER RESPECTIVELY.              */

         {us/bbi/gprun.i ""txedit.p""
            "(input  tax_tr_type,
              input  so_nbr,
              input  tax_nbr,
              input  tax_lines, /*ALL LINES*/
              input  so_tax_env,
              input  so_curr,
              input  so_ex_ratetype,
              input  so_ex_rate,
              input  so_ex_rate2,
              input  tax_date,
              output tax_amt)"}

         view frame sotot.
         view frame d.

      end.

      run p-linetax-incltax-ord-amt
         (input        tax_tr_type,
          input        tax_nbr,
          input        tax_lines,
          input        total_pst,
          input        l_cr_disc_amt,
          input-output disc_amt,
          input-output tax_amt,
          input-output line_total,
          input-output l_cr_line_total,
          input-output line_taxable_amt,
          input-output ord_amt,
          input-output l_cr_ord_amt,
          input-output taxable_amt,
          buffer       so_mstr).

      /* CHECK CREDIT AMOUNTS */
      if ord_amt < 0 then
         invcrdt = "**" + getTermLabel("C_R_E_D_I_T",11) + "**".
      else
         invcrdt = "".

      /* CALCULATE SALES ORDR BALANCE BY APPLYING EXCHANGE RATE ENTERED   */
      /* BY USER ON SO HEADER ONLY WHEN BASE CURRENCY = CUSTOMER CURRENCY */
      /* AND FIXED RATE = YES AND USER ENTERED EXCHANGE RATE.             */
      /* SINCE FINANCIAL SIDE DO NOT KNOW THE USER ENTERED EXCHANGE RATE  */
      /* SALES ORDER BALANCE IS CALCULATED HERE BY APPLYING EXCHANGE RATE */
      /* FROM SALES ORDER AND CALLING PROCEDURE  updateOpenOrderTotal  BY */
      /* PASSING CUSTOMER CURRENCY INSTEAD OF SALES ORDER CURRENCY.       */
      /* NOTE: SALES ORDER EXCHANGE RATE IS STORED AS                     */
      /*       SO_EX_RATE = FOREIGN CURR AND SO_EX_RATE2 = BASE CURR      */
      /* GET CURRENCY OF BILL-TO ADDRESS */
      find first cm_mstr
          where cm_domain = global_domain
          and   cm_addr   = so_bill
      no-lock no-error.

      if base_curr = so_curr
      then do:
          assign
             exrate   = 1
             exrate2  = 1.
      end. /* base_curr = so_curr */
      else do:
         /* IF BASE CURRENCY AND CUSTOMER CURRENCY ARE SAME                */
         /* AND SALES ORDER IN FOREIGN CURRENCY AND SO_FXIED_RATE = YES    */
         if base_curr = cm_curr and
            so_fix_rate = yes
         then do:
            for first exr_rate
               where exr_domain     = global_domain
                 and exr_curr1      = base_curr
                 and exr_curr2      = so_curr
                 and exr_ratetype   = ''
                 and exr_start_date <= so_ord_date
                 and exr_end_date   >= so_ord_date
            no-lock:
            end.

           if available exr_rate then
               assign
                  exrate2  = exr_rate
                  exrate   = exr_rate2.
            else do:
               for first exr_rate
                  where exr_domain     = global_domain
                    and exr_curr1      = so_curr
                    and exr_curr2      = base_curr
                    and exr_ratetype   = ''
                   and exr_start_date <= so_ord_date
                    and exr_end_date  >= so_ord_date
               no-lock:
               end.
               if available exr_rate then
                  assign
                     exrate    = exr_rate
                     exrate2   = exr_rate2.
            end. /* else */
         end. /* base_curr = cm_curr and  so_fix_rate = yes */
      end. /* base_curr <> so_curr */

      /* IF BASE CURRENCY AND CUSTOMER CURRENCY ARE SAME                */
      /* AND SALES ORDER IN FOREIGN CURRENCY AND SO_FXIED_RATE = YES    */
      /* THEN UPDATE DEBTOR BALANCE BASED ON USER ENTERED EXCHANGE RATE */
      if base_curr =  cm_curr and
         base_curr <> so_curr and
         so_fix_rate = yes
      then do:

         assign
            ordertotal = getOrderTotal (input so_nbr)
            before_ordertotal = getBeforeOrderTotal(input so_nbr).
         /* CONVERT THE ORDER TOTAL */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
            "(input so_curr,
              input base_curr,
              input so_ex_rate,
              input so_ex_rate2,
              input ordertotal,
              input false,
              output ordertotal,
              output mc-error-number)"}

         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.

         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
            "(input so_curr,
              input base_curr,
              input so_ex_rate,
              input so_ex_rate2,
              input before_ordertotal,
              input false,
              output before_ordertotal,
              output mc-error-number)"}

         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.
         if (before_ordertotal - ordertotal) <> 0 then do:
            /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
            run updateOpenOrderTotal in hCreditLibrary
               ( input  so_bill,
                 input  before_ordertotal,
                 input  OrderTotal,
                 input  cm_curr,
                 output iReturnStatus).
         end. /* if (before_ordertotal - ordertotal) <> 0 */
      end. /* base_curr =  cm_curr and base_curr <> so_curr  */
      else do:
         /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
         run updateOpenOrderTotal in hCreditLibrary
            ( input  so_bill,
              input  getBeforeOrderTotal(input so_nbr),
              input  getOrderTotal      (input so_nbr),
              input  so_curr,
              output iReturnStatus).
      end. /* else */
   end. /* IF MAINT */

   if display_trail then do:
     /*grc338 {us/so/sototdsp.i} /* DISPLAY ALL FIELDS */ */
/*grc338*/ {us/xf/xfsotds9.i}
   end.

   undo_trl2 = false.

end. /* taxloop*/

if maint then do:

   if credit_hold then do:
      {us/px/pxrun.i &PROC='getCreditHoldStatusCode'
                     &PROGRAM='sosoxr.p'
                     &HANDLE = ph_sosoxr
                     &PARAM="(input 'SO',
                              output creditStatus)"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
      so_stat = creditStatus.
   end.

   /* TMS Black Box Interface */
   assign
      tms-error = 0.

   {us/bbi/gprun.i ""sotmsbb.p""
      "(input 'sow',
        input recid(so_mstr),
        input yes,
        output tms-error)"}

end.

/* DO NOT DELETE THIS PROCEDURE BECAUSE IT MAY BE CREATED IN THE HIGHER
 * LEVEL PROGRAM. SETTING IT TO NULL VALUE IS ENOUGH */
hCreditLibrary = ? .

/* CREATED FOLLOWING THREE INTERNAL PROCEDURES p-line-total,   */
/* p-disc-taxable-nontaxable-amt AND p-linetax-incltax-ord-amt */
/* TO AVOID CODE REDUNDANCY                                    */

PROCEDURE p-line-total:

   define input        parameter l_rndmthd      like rnd_rnd_mthd
      no-undo.
   define input        parameter l_mc_error_nbr like msg_nbr     no-undo.
   define input        parameter l_so_disc_pct  like so_disc_pct no-undo.
   define input-output parameter l_line_tot     as   decimal     no-undo.
   define input-output parameter l_cr_line_tot  as   decimal     no-undo.
   define input-output parameter l_tx_amt       as   decimal     no-undo.
   define input-output parameter l_line_tx_amt  as   decimal     no-undo.
   define input-output parameter l_nontx_amt    as   decimal     no-undo.
   define              parameter buffer sod_det for  sod_det.

   define              variable l_ext_actual     like sod_price no-undo.
   define              variable l_cr_ext_actual  like sod_price no-undo.
/* l_linetot_tax_in IS THE EXTENDED AMOUNT EXCLUDING TAX WHEN THE LINE IS */
/* TAX INCLUDED                                                           */
   define              variable l_linetot_tax_in like sod_price no-undo.

   assign
      l_ext_actual    = (sod_price   * (sod_qty_ord - sod_qty_ivcd))
      l_cr_ext_actual = ( sod_price   *
                        ((sod_qty_ord) + sod_qty_inv)).

   /* For Overshipping a Positive Sales Order */
   if sod_qty_ord > 0
       and sod_qty_ship > 0
       and sod_qty_ship > sod_qty_ord then
      l_ext_actual    = l_ext_actual +
                          (sod_price * (sod_qty_ship - sod_qty_ord)).

   /* For Overshipping a Negative Sales Order */
   else if sod_qty_ord < 0
      and sod_qty_ship < 0
      and sod_qty_ord > sod_qty_ship then
      l_ext_actual    = l_ext_actual +
                          (sod_price * (sod_qty_ship - sod_qty_ord)).

   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_ext_actual,
        input        l_rndmthd,
        output       l_mc_error_nbr)"}

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_cr_ext_actual,
        input        l_rndmthd,
        output       l_mc_error_nbr)"}

   l_linetot_tax_in = l_ext_actual.

   for first t_store_ext_actual
      where t_line = sod_line
   no-lock: end.

   if available t_store_ext_actual
      and sod_tax_in
   then do:
      {us/gp/gprunp.i "sopl" "p" "getExtendedAmount"
         "(input        l_rndmthd,
           input        sod_det.sod_line,
           input        so_mstr.so_nbr,
           input        so_mstr.so_inv_nbr,
           input        tax_tr_type,
           input-output l_linetot_tax_in)"}
   end. /* IF AVAILABLE t_store_ext_actual ... */

   else do:
      create t_store_ext_actual.
      assign
         t_line       = sod_line
         t_ext_actual = l_ext_actual.
   end. /* ELSE DO */

   if l_ord_contains_tax_in_lines = no
   then
      l_line_tot    = (l_line_tot + l_linetot_tax_in).

   l_cr_line_tot = (l_cr_line_tot + l_cr_ext_actual).

   if sod_taxable then
      assign
         l_tx_amt      = (l_tx_amt + l_ext_actual)
         l_line_tx_amt = l_tx_amt.
   else
      l_nontx_amt = (l_nontx_amt + l_ext_actual).

END PROCEDURE. /* p-line-total */

PROCEDURE p-disc-taxable-nontaxable-amt:

   define input        parameter l_rndmthd      like rnd_rnd_mthd
      no-undo.
   define input        parameter l_mc_error_nbr like msg_nbr no-undo.
   define input        parameter l_line_tot     as   decimal no-undo.
   define input        parameter l_cr_line_tot  as   decimal no-undo.
   define input        parameter l_so_disc_pct  like so_disc_pct
      no-undo.
   define input-output parameter l_dis_amt      as   decimal no-undo.
   define input-output parameter l_cr_dis_amt   as   decimal no-undo.
   define input-output parameter l_tx_amt       as   decimal no-undo.
   define input-output parameter l_nontx_amt    as   decimal no-undo.

   define              variable  l_tmp_amt      as   decimal no-undo.

   if l_ord_contains_tax_in_lines = no
   then
      l_dis_amt    = (- l_line_tot    * (l_so_disc_pct / 100)).

   assign
      l_cr_dis_amt = (- l_cr_line_tot * (l_so_disc_pct / 100))
      l_tmp_amt    = (  l_tx_amt      * (l_so_disc_pct / 100)).

   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_dis_amt,
        input        l_rndmthd,
        output       l_mc_error_nbr)"}

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_cr_dis_amt,
        input        l_rndmthd,
        output       l_mc_error_nbr)"}

   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_tmp_amt,
        input        l_rndmthd,
        output       l_mc_error_nbr)"}
   assign
      l_tx_amt   = (l_tx_amt - l_tmp_amt)
      l_tmp_amt  = (l_nontx_amt * (l_so_disc_pct / 100)).

   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_tmp_amt,
        input        l_rndmthd,
        output       l_mc_error_nbr)"}

   l_nontx_amt = (l_nontx_amt - l_tmp_amt).
END PROCEDURE. /* p-disc-taxable-nontaxable-amt */

PROCEDURE p-linetax-incltax-ord-amt:

   define input        parameter l_tx_tr_type   like tx2d_tr_type
      no-undo.
   define input        parameter l_tx_nbr       like tx2d_nbr  no-undo.
   define input        parameter l_tx_lines     like tx2d_line no-undo.
   define input        parameter l_total_pst    as   decimal   no-undo.
   define input        parameter l_cr_dis_amt   as   decimal   no-undo.
   define input-output parameter l_dis_amt      as   decimal   no-undo.
   define input-output parameter l_tx_amt       as   decimal   no-undo.
   define input-output parameter l_line_tot     as   decimal   no-undo.
   define input-output parameter l_cr_line_tot  as   decimal   no-undo.
   define input-output parameter l_line_tx_amt  as   decimal   no-undo.
   define input-output parameter l_ord_amt      as   decimal   no-undo.
   define input-output parameter l_crd_ord_amt  as   decimal   no-undo.
   define input-output parameter l_taxable_amt  as   decimal   no-undo.
   define              parameter buffer so_mstr for  so_mstr.

   define              variable  l_tax_in       as   decimal   no-undo.
   define              variable  l_cr_tx_amt    as   decimal   no-undo.
   define              variable  l_cr_l_tx_in   as   decimal   no-undo.
   define              variable  l_inv_tx_amt   as   decimal   no-undo.

   /* GET TAX TOTALS */
   if available so_mstr 
      and not so_sched 
      and l_tx_tr_type = "11" 
   then do:
      {us/bbi/gprun.i ""txtotal.p""
         "(input  "13",
           input  so_nbr,
           input  l_tx_nbr,
           input  l_tx_lines, /* ALL LINES*/
           output l_inv_tx_amt)"}
   end. /* IF AVAILABLE so_mstr AND NOT so_sched AND l_tx_tr_type = "11" */

   {us/bbi/gprun.i ""txtotal.p""
      "(input  l_tx_tr_type,
        input  so_nbr,
        input  l_tx_nbr,
        input  l_tx_lines, /* ALL LINES */
        output l_tx_amt)"}

   l_tx_amt = l_tx_amt + l_inv_tx_amt.

   /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
   {us/bbi/gprun.i ""txtotal1.p""
      "(input  l_tx_tr_type,
        input  so_nbr,
        input  l_tx_nbr,
        input  l_tx_lines, /* ALL LINES */
        output l_tax_in)"}

   if due_date_range
      and not can-find(first sod_det
                          where sod_domain     = global_domain
                          and   sod_nbr        = so_nbr
                          and   sod_compl_stat = ""
                          {&sod_for_each})
   then
      assign
         l_tx_amt = 0
         l_tax_in = 0.

   /* WHEN TAX DETAIL RECORDS ARE NOT AVAILABLE AND SO IS TAXABLE  */
   /* THEN USE THE PROCEDURE TO CALCULATE ORDER TOTAL AND DISCOUNT */

   /* WHEN TAX INCLUDED IS YES, ORDER DISCOUNT SHOULD BE         */
   /* CALCULATED ON THE LINE TOTAL AFTER REDUCING THE LINE TOTAL */
   /* BY THE INCLUDED TAX                                        */
   if l_tax_in <> 0
      or (l_ord_contains_tax_in_lines
          and ((not can-find (tx2d_det
                             where tx2d_domain = global_domain
                             and   tx2d_ref    = so_nbr
                             and   tx2d_nbr    = so_inv_nbr))
          or l_line_tot = 0))
   then do:
      {us/gp/gprunp.i "sopl" "p" "calDiscAmountAfterSubtractingTax"
         "(input table  t_store_ext_actual,
           input        rndmthd,
           input        so_disc_pct,
           input        so_nbr,
           input        so_inv_nbr,
           input        tax_tr_type,
           output       l_line_tot,
           output       l_dis_amt)"}

      /* DISCOUNT AMOUNT IS ADJUSTED TO AVOID ROUNDING ERROR */
      /* IN CALCULATION OF ORDER AMOUNT                      */
      {us/gp/gprunp.i "sopl" "p" "adjustDiscountAmount"
         "(input        l_taxable_amt - l_tax_in,
           input        nontaxable_amt,
           input        so_trl1_amt,
           input        so_trl2_amt,
           input        so_trl3_amt,
           input        l_line_tot,
           input-output l_dis_amt)"}

   end. /* IF l_tax_in <> 0 */

   /* OBTAINING TOTAL TAX AND INCLUDED TAX FOR THE SHIPPED ORDERED */
   /* LINES WHERE INVOICE IS NOT PRINTED OR POSTED                 */
   if l_cr_line_tot <> l_line_tot
   then do:

      {us/bbi/gprun.i ""txtotal.p""
         "(input  ""13"",
           input  so_nbr,
           input  l_tx_nbr,
           input  l_tx_lines, /* ALL LINES */
           output l_cr_tx_amt)"}

      {us/bbi/gprun.i ""txtotal1.p""
         "(input  ""13"",
           input  so_nbr,
           input  l_tx_nbr,
           input  l_tx_lines, /* ALL LINES */
           output l_cr_l_tx_in)"}

   end. /* IF l_cr_line_tot <> l_line_tot */

   /* ADJUSTING LINE TOTALS AND TOTAL TAX BY INCLUDED TAX */
   assign
      l_taxable_amt = (l_taxable_amt - l_tax_in)
      l_cr_line_tot = (l_cr_line_tot - (l_tax_in + l_cr_l_tx_in))
      l_line_tx_amt =  l_taxable_amt
      l_tx_amt      = (l_tx_amt     + l_tax_in)
      l_cr_tx_amt   = ((l_tx_amt    + l_cr_tx_amt) +
                       l_cr_l_tx_in)

      /* CALCULATE ORDER TOTAL */
      l_ord_amt     = (l_line_tot  + l_dis_amt   +
                       so_trl1_amt + so_trl2_amt +
                       so_trl3_amt + l_tx_amt    +
                       l_total_pst)

      /* CALCULATE ORDER TOTAL FOR CREDIT LIMIT LOGIC */
      l_crd_ord_amt = (l_cr_line_tot + l_cr_dis_amt +
                       so_trl1_amt   + so_trl2_amt  +
                       so_trl3_amt   + l_cr_tx_amt  +
                       l_total_pst).

END PROCEDURE. /* p-linetax-incltax-ord-amt */
