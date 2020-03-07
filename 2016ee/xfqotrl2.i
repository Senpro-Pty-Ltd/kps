/* xfqotrl2.i - QUOTE TRAILER FOR GTM                                         */
/* sqqotrl2.i - QUOTE TRAILER FOR GTM                                         */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfqotrl2.i,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 7.4            CREATED: 10/09/95   BY: jym *G0YN*                */
/* REVISION: 8.5      LAST MODIFIED: 06/20/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 01/08/96   BY: jzw *H0K0*                */
/* REVISION: 8.6      LAST MODIFIED: 11/25/96   BY: jzw *K01X*                */
/* REVISION: 8.6      LAST MODIFIED: 10/09/97   BY: *K0JV* Surendra Kumar     */
/* REVISION: 8.6      LAST MODIFIED: 01/15/98   BY: *J2B2* Manish  K.         */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* Adam Harris        */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* REVISION: 8.6E     LAST MODIFIED: 06/11/98   BY: *L02K* Russ Witt          */
/* REVISION: 8.6E     LAST MODIFIED: 01/22/99   BY: *J38T* Poonam Bahl        */
/* REVISION: 8.6E     LAST MODIFIED: 05/07/99   BY: *J3DQ* Niranjan R.        */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Patti Gaultney     */
/* REVISION: 9.1      LAST MODIFIED: 02/24/00   BY: *M0K0* Ranjit Jain        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/06/00   BY: *N0D0* Santosh Rao        */
/* Revision: 1.21       BY: Katie Hilbert        DATE: 04/01/01  ECO: *P002*  */
/* Revision: 1.22       BY: Kaustubh K.          DATE: 07/26/01  ECO: *M1DS*  */
/* Revision: 1.23       BY: Jean Miller          DATE: 04/09/02  ECO: *P058*  */
/* Revision: 1.25       BY: Mercy Chittilapilly  DATE: 12/23/02  ECO: *N212*  */
/* Revision: 1.26       BY: Mamata Samant        DATE: 01/23/03  ECO: *N23T*  */
/* Revision: 1.27       BY: Kirti Desai          DATE: 03/20/03  ECO: *N28H*  */
/* Revision: 1.28  BY: Vandna Rohira DATE: 04/28/03 ECO: *N1YL* */
/* Revision: 1.30  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00M* */
/* Revision: 1.31         BY: Vivek Gogte        DATE: 08/02/03  ECO: *N2GZ* */
/* Revision: 1.32         BY: Manish Dani        DATE: 09/01/03  ECO: *P0VZ* */
/* Revision: 1.33         BY: Rajaneesh S.       DATE: 01/08/04  ECO: *P1GK* */
/* Revision: 1.35         BY: Manish Dani        DATE: 09/20/04  ECO: *P2L3* */
/* Revision: 1.37         BY: Suyash Keny        DATE: 08/16/06  ECO: *R086* */
/* Revision: 1.38         BY: Jean Miller        DATE: 04/11/07  ECO: *R0C6* */
/* Revision: 1.39         BY: Jean Miller        DATE: 11/22/09  ECO: *R1TW* */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 18/02/10  ECO: *eb3sp5* */
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

{us/so/sotxidef.i}

/* NEW SHARED VARIABLES, BUFFERS AND FRAMES */
define new shared variable undo_txdetrp like mfc_logical.
define new shared variable tax_recno    as recid.

/* AND NOT JUST VIEWED IN DR/CR MEMO MAINTENANCE                   */
define new shared variable l_txchg     like mfc_logical initial no.

/* SHARED VARIABLES, BUFFERS AND FRAMES */
define shared variable rndmthd      like gl_rnd_mthd.
define shared variable display_trail    like mfc_logical.
define shared variable calc_open_qty    like mfc_logical.
define shared variable qo_recno         as recid.
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
define shared variable tax_edit         like mfc_logical.
define shared variable tax_edit_lbl     like mfc_char format "x(28)".
define shared variable user_desc        like trl_desc extent 3.
define shared variable total_pst        like line_total.
define shared variable tax_date         like qo_tax_date.
define shared variable new_order        like mfc_logical.
define shared variable undo_trl2        like mfc_logical.
define shared variable l_nontaxable_lbl as character format "x(12)" no-undo.
define shared variable l_taxable_lbl    as character format "x(12)" no-undo.

define shared frame qotot.

/* LOCAL VARIABLES, BUFFERS AND FRAMES */
define variable i                   as integer.
define variable term-disc           like ct_disc_pct.
define variable ext_price           like qod_price.
define variable ext_actual          like qod_price.
define variable recalc              like mfc_logical initial true.
define variable tax_tr_type         like tx2d_tr_type initial "10".
define variable tax_nbr             like tx2d_nbr initial "".
define variable tax_lines           like tx2d_line initial 0.
define variable page_break          as integer initial 10.
define variable col-80              as logical initial true.
define variable disc_pct            like qo_disc_pct no-undo.
define variable l_tmp_amt           like line_total.
define variable retval              as integer.
define variable l_tax_in            like tax_amt         no-undo.
define variable l_yn                like mfc_logical     no-undo.
define variable l_tax_amt1          like tax_amt         no-undo.
define variable l_tax_amt2          like tax_amt         no-undo.
define variable l_nontax_amt        like tx2d_nontax_amt no-undo.
/* l_linetot_tax_in IS THE EXTENDED AMOUNT EXCLUDING TAX WHEN THE LINE IS */
/* TAX INCLUDED                                                           */
define variable l_linetot_tax_in    like qod_price       no-undo.
/*eb3sp5*/ {us/xf/xftxtots.i}

{us/et/etvar.i}
{us/et/etrpvar.i}

{us/tx/txcalvar.i}

if maint then
   find qo_mstr where recid(qo_mstr) = qo_recno
   exclusive-lock no-error.
else
   find qo_mstr where recid(qo_mstr) = qo_recno
   no-lock no-error.

/**** FORMS ****/
form
   qo_nbr
   qo_cust
   qo_bill
   qo_ship
with frame a side-labels width 80 .

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
   qo_cr_init   colon 15
   qo_print_qo  colon 39
   qo_prepaid   colon 56   label "Prepaid"   skip
   qo_cr_card   colon 15
   qo_print_pl  colon 39
   qo_fob       colon 56                     skip
   qo_stat      colon 15
   qo_partial   colon 39
   qo_shipvia   colon 56                     skip
   qo_rev       colon 15
with frame d side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

{us/sq/sqcurvar.i}  /* VARIABLES REQUIRED FOR CURRENCY DISPLAY */
{us/tx/txcurvar.i}  /* VARIABLES REQUIRED FOR TAX CURRENCY DISPLAY */
{us/sq/sqtotfrm.i}  /* GLOBAL TAX QUOTE TRAILER FORM */

if not maint and display_trail then do:

   tax_edit_lbl = "".
   undo_txdetrp = true.
/**eb3sp5 COMMENTED PORTION BEGINS**
   {us/bbi/gprun.i  ""txdetrp.p""
      "(input tax_tr_type,
        input qo_nbr,
        input tax_nbr,
        input col-80,
        input page_break,
        input '',
        input yes)" }
**eb3sp5 COMMENTED PORTION ENDS**/
/*eb3sp5 ADDED PORTION BEGINS*/
   {us/bbi/gprun.i  ""xfdetrp.p"" 
              "(input tax_tr_type,
                input qo_nbr,
                input tax_nbr,
                input col-80,
                input page_break,
                input '',
                input yes)" }
/*eb3sp5 ADDED PORTION ENDS*/
   if undo_txdetrp = true then undo, leave.

   if page-size - line-counter < page_break then page.

   do while page-size - line-counter > page_break:
      put skip(1).
   end.

   put
      "-----------------------------------------" +
      "-----------------------------------------" format "x(80)".
end.

taxloop:
do on endkey undo, leave:

   empty temp-table t_store_ext_actual no-error.

   /*** GET TOTALS FOR LINES ***/
   assign
      line_total     = 0
      taxable_amt    = 0
      l_ord_contains_tax_in_lines = can-find (first qod_det
                                              where qod_domain = global_domain
                                              and   qod_nbr    = qo_nbr
                                              and   qod_taxable
                                              and   qod_tax_in)
      nontaxable_amt = 0.

   /*CALCULATE EXTENDED AMOUNTS*/
   for each qod_det where qod_domain = global_domain
      and qod_nbr = qo_nbr
   no-lock:

      if maint or calc_open_qty then
         ext_actual   = (qod_price * (qod_qty_quot - qod_qty_rel)).

      else
         ext_actual = qod_price * qod_rel_chg.

      /* ROUND AMOUNT ACCORDING TO DOC CURRENCY ROUNDING METHOD */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output ext_actual,
           input rndmthd,
           output mc-error-number)"}

      for first t_store_ext_actual
         where t_line = qod_line
      no-lock: end.

      if not available t_store_ext_actual
      then do:
         create t_store_ext_actual.
         assign
            t_line       = qod_line
            t_ext_actual = ext_actual.
      end. /* IF NOT AVAILABLE t_store_ext_actual ... */

      /* USE THE EXISTING LOGIC TO CALCULATE ORDER TOTAL ONLY */
      /* WHEN SALES ORDER DOES NOT HAVE TAX INCLUDED LINES    */
      if l_ord_contains_tax_in_lines = no then
         line_total = line_total + ext_actual.

      if qod_taxable then
      assign
         taxable_amt      = taxable_amt + ext_actual
         line_taxable_amt = taxable_amt.
      else
         nontaxable_amt = nontaxable_amt + ext_actual.
   end. /* FOR EACH QOD_DET..*/

   /* Sales volume discount */
   if maint and not qo__log01 then do:

      find cm_mstr where cm_mstr.cm_domain = global_domain
                     and cm_mstr.cm_addr = qo_cust
      no-lock no-error.

      if qo_cust <> qo_ship and
         can-find (cm_mstr where cm_mstr.cm_domain = global_domain and
                                 cm_mstr.cm_addr = qo_ship)
      then
         find cm_mstr where cm_mstr.cm_domain = global_domain and
                            cm_mstr.cm_addr = qo_ship
         no-lock.

      /* ADDED SECOND EXCHANGE RATE BELOW */
      {us/bbi/gprun.i ""sosd.p"" "(input qo_ord_date,
           input qo_ex_rate,
           input qo_ex_rate2,
           input qo_cust,
           input qo_curr,
           input line_total,
           output disc_pct)"}

      if disc_pct > cm_disc_pct and disc_pct <> 0 then
         qo_disc_pct = disc_pct.
      else
         qo_disc_pct = cm_disc_pct.

   end.

   disc_amt = (- line_total * (qo_disc_pct / 100)).

   /* ROUND AMOUNT ACCORDING TO DOC CURRENCY ROUNDING METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output disc_amt,
        input rndmthd,
        output mc-error-number)"}

   /* CALCULATE TAXABLE AMOUNT LESS DISCOUNT             */
   l_tmp_amt = taxable_amt * qo_disc_pct / 100.
   /* ROUND AMOUNT ACCORDING TO DOC CURRENCY ROUNDING METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_tmp_amt,
        input        rndmthd,
        output       mc-error-number)"}

   taxable_amt = taxable_amt - l_tmp_amt.

   /* CALCULATE NONTAXABLE AMOUNT LESS DISCOUNT          */
   l_tmp_amt = nontaxable_amt * qo_disc_pct / 100.
   /* ROUND AMOUNT ACCORDING TO DOC CURRENCY ROUNDING METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_tmp_amt,
        input        rndmthd,
        output       mc-error-number)"}

   nontaxable_amt = nontaxable_amt - l_tmp_amt.

   /* ADD TRAILER AMOUNTS */
   {us/tx/txtrltrl.i qo_trl1_cd qo_trl1_amt user_desc[1] qo_tax_env}
   {us/tx/txtrltrl.i qo_trl2_cd qo_trl2_amt user_desc[2] qo_tax_env}
   {us/tx/txtrltrl.i qo_trl3_cd qo_trl3_amt user_desc[3] qo_tax_env}

   /****** CALCULATE TAXES ************/
   /* NOTE nbr FIELD BLANK UNTIL I KNOW HOW TO USE IT */
   /* CHECK PREVIOUS DETAIL FOR EDITED VALUES */
   find first tx2d_det where tx2d_domain = global_domain and
      tx2d_ref = qo_nbr          and
      tx2d_nbr = tax_nbr         and
      tx2d_tr_type = tax_tr_type and
      tx2d_edited
   no-lock no-error.

   if available(tx2d_det) then do:
      /* Previous tax values edited. Recalculate? */
      {us/bbi/pxmsg.i &MSGNUM=917 &ERRORLEVEL=2 &CONFIRM=recalc}
   end.

   if execname = "sqqorp05.p"
      and not available tx2d_det
   then do:

      tax_tr_type = "09".

      {us/bbi/gprun.i  ""txcalc.p""
         "(input  tax_tr_type,
           input  qo_nbr,
           input  tax_nbr,
           input  tax_lines, /* ALL LINES */
           input  no,
           output result-status)"}

   end. /* IF EXECNAME = "SQQORP05.P" AND ... */

   if maint then do:
      /* CALULATE THE TAX AMOUNT BEFORE TXCALC.P CALCULATES THE NEW */
      /* TAXES SO AS TO COMPARE IF THE TAX AMOUNT HAS BEEN CHANGED  */

      /* CALCULATE TOTALS */
      {us/bbi/gprun.i ""txtotal.p""
         "(input  tax_tr_type,
           input  qo_nbr,
           input  tax_nbr,
           input  tax_lines,   /* ALL LINES */
           output l_tax_amt1)"}

      /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
      {us/bbi/gprun.i ""txtotal1.p""
         "(input  tax_tr_type,
           input  qo_nbr,
           input  tax_nbr,
           input  tax_lines,  /* ALL LINES */
           output l_tax_amt2)"}

      l_tax_amt1 = l_tax_amt1 + l_tax_amt2.
   end. /* IF maint */

   if maint and recalc then do:
      l_nontax_amt  = 0.

      for first tx2d_det
         where tx2d_domain = global_domain
           and tx2d_ref       = qo_nbr
           and tx2d_tr_type    = tax_tr_type
           and tx2d_nontax_amt <> 0
      no-lock:
         l_nontax_amt = tx2d_nontax_amt.
      end. /* FOR FIRST tx2d_det */

      {us/bbi/gprun.i ""txcalc.p""
         "(input  tax_tr_type,
           input  qo_nbr,
           input  tax_nbr,
           input  tax_lines, /* ALL LINES */
           input no,
           output result-status)"}
   end.

   {us/bbi/gprun.i ""txabsrb.p""
      "(input qo_nbr,
        input ' ',
        input tax_tr_type,
        input-output line_total,
        input-output taxable_amt)"}

   /* GET TAX TOTALS */
   {us/bbi/gprun.i ""txtotal.p""
      "(input  tax_tr_type,
        input  qo_nbr,
        input  tax_nbr,
        input  tax_lines,           /* ALL LINES */
        output tax_amt)"}

   /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
   {us/bbi/gprun.i ""txtotal1.p""
      "(input  tax_tr_type,
        input  qo_nbr,
        input  tax_nbr,
        input  tax_lines,       /* ALL LINES */
        output l_tax_in)"}

   /* WHEN TAX DETAIL RECORDS ARE NOT AVAILABLE AND SO IS TAXABLE  */
   /* THEN USE THE PROCEDURE TO CALCULATE ORDER TOTAL AND DISCOUNT */

   /* WHEN TAX INCLUDED IS YES ORDER DISCOUNT SHOULD BE    */
   /* CALCULATED ON THE LINE TOTAL AFTER REDUCING THE LINE */
   /* TOTAL BY THE INCLUDED TAX                            */
   if l_tax_in <> 0 or
     (l_ord_contains_tax_in_lines and
     (not can-find (tx2d_det where tx2d_domain = global_domain
                             and   tx2d_ref    = qo_nbr
                             and   tx2d_nbr    = "")))
   then do:

      {us/gp/gprunp.i "sopl" "p" "calDiscAmountAfterSubtractingTax"
         "(input table  t_store_ext_actual,
           input        rndmthd,
           input        qo_disc_pct,
           input        qo_nbr,
           input        """",
           input        tax_tr_type,
           output       line_total,
           output       disc_amt)"}

      /* DISCOUNT AMOUNT IS ADJUSTED TO AVOID ROUNDING ERROR */
      /* IN CALCULATION OF ORDER AMOUNT                      */
      {us/gp/gprunp.i "sopl" "p" "adjustDiscountAmount"
         "(input        taxable_amt - l_tax_in,
           input        nontaxable_amt,
           input        qo_trl1_amt,
           input        qo_trl2_amt,
           input        qo_trl3_amt,
           input        line_total,
           input-output disc_amt)"}

   end. /* IF l_tax_in <> 0 ... */

   /* ADJUSTING LINE TOTALS AND TOTAL TAX BY INCLUDED TAX */
   assign
      taxable_amt      = taxable_amt - l_tax_in
      line_taxable_amt = taxable_amt
      tax_amt          = tax_amt + l_tax_in.

   /* ADD ROUNDED AMOUNTS TO GET ORD_AMT                 */
   ord_amt =  line_total + disc_amt + qo_trl1_amt +
              qo_trl2_amt + qo_trl3_amt + tax_amt + total_pst.

   /*IF MAINT-EDIT TRAILER, INIT, CALC EXTENDED, TOTAL,
     SET CR., DISP TOTS*/
   if maint then do: /* on endkey undo taxloop, leave: */

      /* DISPLAY SALES QUOTE TRAILER TOTALS */
      run sq_tot_dsp.

      trlloop:
      do on error undo trlloop, retry
         on endkey undo taxloop, leave:

         /* STORING THE DEFAULT VOLUME DISCOUNT PERCENTAGE */
         assign disc_pct = qo_disc_pct.

         set
            qo_disc_pct qo_trl1_cd qo_trl1_amt qo_trl2_cd
            qo_trl2_amt qo_trl3_cd qo_trl3_amt tax_edit
         with frame qotot
         editing:

            readkey.

            if  keyfunction(lastkey) = "end-error"
            then do:
               hide message no-pause.
               /* TAX DETAIL RECORDS WILL NOT BE SAVED WHEN F4 */
               /* OR ESC IS PRESSED.                           */
               {us/bbi/pxmsg.i &MSGNUM=4773 &ERRORLEVEL=2}
               /* CONTINUE WITHOUT SAVING?                     */
               {us/bbi/pxmsg.i &MSGNUM=4774 &ERRORLEVEL=1 &CONFIRM=l_yn}
               hide message no-pause.
               if l_yn
               then
                  undo taxloop, leave.
            end. /* IF KEYFUNCTION(LASTKEY) */
            else
               apply lastkey.

         end. /* EDITING */

         if qo_disc_pct >   100
         or qo_disc_pct < - 100
         then do:
            {us/bbi/pxmsg.i &MSGNUM=6932 &ERRORLEVEL=3 &MSGARG1=qo_disc_pct}
            next-prompt qo_disc_pct with frame qotot.
            undo trlloop, retry.
         end. /* IF qo_disc_pct  */

         /* CHECK WHETHER VOLUME DICOUNT PERCENTAGE MANUALLY ENTERED*/
         if qo_disc_pct <> disc_pct then
            qo__log01 = yes.

         {us/tx/txedttrl.i &code  = "qo_trl1_cd"
            &amt   = "qo_trl1_amt"
            &desc  = "user_desc[1]"
            &frame = "qotot"
            &loop  = "trlloop"}

         /* VALIDATE QO_TRL1_AMT AGAINST CURRENCY ROUNDING UNIT */
         if (qo_trl1_amt <> 0) then do:
            {us/bbi/gprun.i ""gpcurval.p""
               "(input qo_trl1_amt,
                 input rndmthd,
                 output retval)"}
            if (retval <> 0) then do:
               next-prompt qo_trl1_amt with frame qotot.
               undo trlloop, retry.
            end.
         end. /* IF QO_TRL1_AMT <> 0 */

         {us/tx/txedttrl.i &code  = "qo_trl2_cd"
            &amt   = "qo_trl2_amt"
            &desc  = "user_desc[2]"
            &frame = "qotot"
            &loop  = "trlloop"}

         /* VALIDATE QO_TRL2_AMT AGAINST CURRENCY ROUNDING UNIT */
         if (qo_trl2_amt <> 0) then do:
            {us/bbi/gprun.i ""gpcurval.p"" "(input qo_trl2_amt,
                 input rndmthd,
                 output retval)"}
            if (retval <> 0) then do:
               next-prompt qo_trl2_amt with frame qotot.
               undo trlloop, retry.
            end.
         end. /* IF QO_TRL2_AMT <> 0 */

         {us/tx/txedttrl.i &code  = "qo_trl3_cd"
            &amt   = "qo_trl3_amt"
            &desc  = "user_desc[3]"
            &frame = "qotot"
            &loop  = "trlloop"}

         /* VALIDATE QO_TRL3_AMT AGAINST CURRENCY ROUNDING UNIT */
         if (qo_trl3_amt <> 0) then do:
            {us/bbi/gprun.i ""gpcurval.p"" "(input qo_trl3_amt,
                 input rndmthd,
                 output retval)"}
            if (retval <> 0) then do:
               next-prompt qo_trl3_amt with frame qotot.
               undo trlloop, retry.
            end.
         end. /* IF QO_TRL3_AMT <> 0 */

      end. /* EDIT_TRAILER_CODES: DO ON ENDKEY UNDO */

      /* TAX CALULATIONS ARE PERFORMED AGAIN FOR RE-DISPLAY */
      /*** GET TOTALS FOR LINES ***/
      assign
         line_total     = 0
         taxable_amt    = 0
         nontaxable_amt = 0.

      /*CALCULATE EXTENDED AMOUNTS*/
      for each qod_det where qod_domain = global_domain
         and qod_nbr = qo_nbr
      no-lock:

         if maint then
            ext_actual   =   (qod_price * (qod_qty_quot - qod_qty_rel)).
         else
            ext_actual   = qod_price * qod_qty_rel.

         /* ROUND AMT ACCORDING TO DOC CURRENCY ROUNDING MTHD */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output ext_actual,
              input rndmthd,
              output mc-error-number)"}

         l_linetot_tax_in = ext_actual.

         /* CALL THE PROCEDURE TO GET LINE TOTAL ONLY WHEN TAX IS INCLUDED */
         if qod_tax_in
         then do:
            {us/gp/gprunp.i "sopl" "p" "getExtendedAmount"
               "(input        rndmthd,
                 input        qod_line,
                 input        qo_nbr,
                 input        """",
                 input        tax_tr_type,
                 input-output l_linetot_tax_in)"}
         end. /* IF qod_tax_in ... */

         line_total = line_total + l_linetot_tax_in.

         if qod_taxable then
         assign
            taxable_amt      = taxable_amt + ext_actual
            line_taxable_amt = taxable_amt.
         else
            nontaxable_amt = nontaxable_amt + ext_actual.

      end. /* FOR EACH QOD_DET..*/

      disc_amt = (- line_total * (qo_disc_pct / 100)).
      /* ROUND AMOUNT ACCORDING TO DOC CURRENCY ROUNDING METHOD */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output disc_amt,
           input rndmthd,
           output mc-error-number)"}

      /* CALCULATE TAXABLE AMOUNT LESS DISCOUNT             */
      l_tmp_amt = taxable_amt * qo_disc_pct / 100.
      /* ROUND AMOUNT ACCORDING TO DOC CURRENCY ROUNDING METHOD */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output l_tmp_amt,
           input        rndmthd,
           output       mc-error-number)"}

      taxable_amt = taxable_amt - l_tmp_amt.

      /* CALCULATE NONTAXABLE AMOUNT LESS DISCOUNT          */
      l_tmp_amt = nontaxable_amt * qo_disc_pct / 100.
      /* ROUND AMOUNT ACCORDING TO DOC CURRENCY ROUNDING METHOD */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output l_tmp_amt,
           input        rndmthd,
           output       mc-error-number)"}

      nontaxable_amt = nontaxable_amt - l_tmp_amt.

      /* ADD TRAILER AMOUNTS */

      {us/tx/txtrltrl.i qo_trl1_cd qo_trl1_amt user_desc[1] qo_tax_env}
      {us/tx/txtrltrl.i qo_trl2_cd qo_trl2_amt user_desc[2] qo_tax_env}
      {us/tx/txtrltrl.i qo_trl3_cd qo_trl3_amt user_desc[3] qo_tax_env}

      /****** CALCULATE TAXES ************/
      /* NOTE nbr FIELD BLANK UNTIL I KNOW HOW TO USE IT */
      if recalc then do:
         {us/bbi/gprun.i ""txcalc.p""
            "(input  tax_tr_type,
              input  qo_nbr,
              input  tax_nbr,
              input  tax_lines,  /*ALL LINES*/
              input  no,
              output result-status)"}
      end.

      {us/bbi/gprun.i ""txabsrb.p""
         "(input qo_nbr,
           input ' ',
           input tax_tr_type,
           input-output line_total,
           input-output taxable_amt)"}

      /* DO TAX DETAIL DISPLAY / EDIT HERE */
      if tax_edit then do:
         hide frame qotot no-pause.
         hide frame d no-pause.

         /* ADDED qo_curr,qo_ex_ratetype,qo_ex_rate,qo_ex_rate2  */
         /* AND tax_date AS SIXTH, SEVENTH, EIGTH, NINTH         */
         /* AND TENTH INPUT PARAMETER RESPECTIVELY.              */

         {us/bbi/gprun.i ""txedit.p""
            "(input  tax_tr_type,
              input  qo_nbr,
              input  tax_nbr,
              input  tax_lines, /* ALL LINES  */
              input  qo_tax_env,
              input  qo_curr,
              input  qo_ex_ratetype,
              input  qo_ex_rate,
              input  qo_ex_rate2,
              input  tax_date,
              output tax_amt)"}
         view frame qotot.
         /* Unnecessary, causes double frames */
         /* to be displayed.                  */
      end.

      /* GET TAX TOTALS */
      {us/bbi/gprun.i ""txtotal.p""
         "(input  tax_tr_type,
           input  qo_nbr,
           input  tax_nbr,
           input  tax_lines,      /* ALL LINES */
           output tax_amt)"}

      /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
      {us/bbi/gprun.i ""txtotal1.p""
         "(input  tax_tr_type,
           input  qo_nbr,
           input  tax_nbr,
           input  tax_lines,     /* ALL LINES */
           output l_tax_in)"}

      /* ADJUSTING LINE TOTALS AND TOTAL TAX BY INCLUDED TAX */
      assign
         taxable_amt      = taxable_amt - l_tax_in
         line_taxable_amt = taxable_amt
         tax_amt          = tax_amt + l_tax_in.

      /* DISCOUNT AMOUNT IS ADJUSTED TO AVOID ROUNDING ERROR */
      /* IN CALCULATION OF ORDER AMOUNT                      */
      if l_tax_in <> 0
      then do:
         {us/gp/gprunp.i "sopl" "p" "adjustDiscountAmount"
            "(input        taxable_amt,
              input        nontaxable_amt,
              input        qo_trl1_amt,
              input        qo_trl2_amt,
              input        qo_trl3_amt,
              input        line_total,
              input-output disc_amt)"}
      end. /* IF l_tax_in <> 0 */

      ord_amt =  line_total + disc_amt + qo_trl1_amt +
                 qo_trl2_amt + qo_trl3_amt + tax_amt + total_pst.

   end.   /*MAINT LOOP*/

   if display_trail then do:
      /* DISPLAY SALES QUOTE TRAILER TOTALS */
      run sq_tot_dsp.
   end.

   undo_trl2 = false.

   if tax_tr_type = "09" then
      for each tx2d_det
         where tx2d_domain = global_domain
           and tx2d_ref     = qo_nbr
           and tx2d_nbr     = tax_nbr
           and tx2d_tr_type = tax_tr_type
      exclusive-lock:
         delete tx2d_det.
      end. /* FOR EACH tx2d_det */

end.   /*TAXLOOP */

/* WE MAY ADD CODE HERE TO PRINT THE TAX DATA IN A CERTAIN WAY */
/* FOR SALES ORDER PRINTING */

/* PROCEDURE sq_tot_dsp IS INTRODUCED AS PROGRESS GETS       */
/* CONFUSED BETWEEN TWO FRAMES WITH SAME FILED IN us/sq/sqtotdsp.i */
/* AND ALLOWED UNAUTORIZED USER TO UPDATE qo_disc_pct FIELD. */
PROCEDURE sq_tot_dsp:

  /*93sp12.1 {us/sq/sqtotdsp.i} */
/*eb3sp5*/ {us/xf/xfqotds9.i}

END PROCEDURE. /* sq_tot_dsp */
