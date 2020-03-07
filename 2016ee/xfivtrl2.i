/* xfivtrl2.i - PENDING INVOICE TRAILER                                       */
/* soivtrl2.i - PENDING INVOICE TRAILER                                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivtrl2.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 7.4            CREATED:  10/02/95   BY: jym *G0XY*               */
/* REVISION: 7.4           MODIFIED:  11/29/95   BY: rxm *H0GY*               */
/* REVISION: 8.5           MODIFIED:  07/13/95   BY: taf *J053*               */
/* REVISION: 8.5           MODIFIED:  01/08/96   BY: jzw *H0K0*               */
/* REVISION: 8.5      LAST MODIFIED:  09/10/96   BY: *H0MP* Aruna Patil       */
/* REVISION: 8.6      LAST MODIFIED:  11/25/96   BY: *K01X* Jeff Wootton      */
/* REVISION: 8.6      LAST MODIFIED:  10/09/97   BY: *K0JV* Surendra Kumar    */
/* REVISION: 8.6      LAST MODIFIED:  01/15/98   BY: *J2B2* Manish Kulkarni   */
/* REVISION: 8.6E     LAST MODIFIED:  02/23/98   BY: *L007* Annasheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED:  05/05/98   BY: *L00V* Ed van de Gevel   */
/* REVISION: 8.6E     LAST MODIFIED:  05/09/98   BY: *L00Y* Jeff Wootton      */
/* REVISION: 8.6E     LAST MODIFIED:  06/23/98   BY: *L01G* Robin McCarthy    */
/* REVISION: 8.6E     LAST MODIFIED:  07/02/98   BY: *L024* Sami Kureishy     */
/* REVISION: 8.6E     LAST MODIFIED:  08/10/98   BY: *J2VV* Rajesh Talele     */
/* REVISION: 8.6E     LAST MODIFIED:  08/19/98   BY: *J2WV* Surekha Joshi     */
/* REVISION: 9.0      LAST MODIFIED:  09/29/98   BY: *J2CZ* Reetu Kapoor      */
/* REVISION: 9.0      LAST MODIFIED:  11/17/98   BY: *H1LN* Poonam Bahl       */
/* REVISION: 9.0      LAST MODIFIED:  01/22/99   BY: *J38T* Poonam Bahl       */
/* REVISION: 9.0      LAST MODIFIED:  03/13/99   BY: *M0BD* Alfred Tan        */
/* REVISION: 9.0      LAST MODIFIED:  05/07/99   BY: *J3DQ* Niranjan Ranka    */
/* REVISION: 9.1      LAST MODIFIED:  09/08/99   BY: *N02P* Robert Jensen     */
/* REVISION: 9.1      LAST MODIFIED:  10/01/99   BY: *N014* Murali Ayyagari   */
/* REVISION: 9.1      LAST MODIFIED:  02/24/00   BY: *M0K0* Ranjit Jain       */
/* REVISION: 9.1      LAST MODIFIED:  03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED:  07/05/00   BY: *N0F4* Mudit Mehta       */
/* REVISION: 9.1      LAST MODIFIED:  09/05/00   BY: *N0RF* Mark Brown        */
/* REVISION: 9.1      LAST MODIFIED:  09/06/00   BY: *N0D0* Santosh Rao       */
/* REVISION: 9.1      LAST MODIFIED:  10/16/00   BY: *N0W8* Mudit Mehta       */
/* REVISION: 9.1      LAST MODIFIED:  03/05/01   BY: *M12V* Rajaneesh Sarangi */
/* Revision: 1.42         BY: Ellen Borden        DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.43         BY: Kaustubh Kulkarni   DATE: 07/26/01  ECO: *M1DS* */
/* Revision: 1.44         BY: Mark Christian      DATE: 02/07/02  ECO: *N18X* */
/* Revision: 1.46         BY: Ellen Borden        DATE: 03/15/02  ECO: *P00G* */
/* Revision: 1.47         BY: Jean Miller         DATE: 04/09/02  ECO: *P058* */
/* Revision: 1.48         BY: Manisha Sawant      DATE: 07/11/02  ECO: *N1NW* */
/* Revision: 1.49         BY: Gnanasekar          DATE: 11/12/02  ECO: *N1Y0* */
/* Revision: 1.50         BY: Mamata Samant       DATE: 01/23/03  ECO: *N23T* */
/* Revision: 1.51         BY: Amit Chaturvedi     DATE: 01/26/03  ECO: *N20Y* */
/* Revision: 1.57         BY: Vandna Rohira       DATE: 04/28/03  ECO: *N1YL* */
/* Revision: 1.59         BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.60         BY: Vivek Gogte         DATE: 08/02/03  ECO: *N2GZ* */
/* Revision: 1.61         BY: Manish Dani         DATE: 09/01/03  ECO: *P0VZ* */
/* Revision: 1.62         BY: Ashish Maheshwari   DATE: 10/15/03  ECO: *P15L* */
/* Revision: 1.63         BY: Sunil Fegade        DATE: 12/11/03  ECO: *P1F7* */
/* Revision: 1.64         BY: Vinay Soman         DATE: 01/20/04  ECO: *N2NZ* */
/* Revision: 1.65         BY: Vinay Soman         DATE: 01/23/04  ECO: *P1JP* */
/* Revision: 1.66         BY: Rajaneesh Sarangi   DATE: 01/23/04  ECO: *P1GK* */
/* Revision: 1.69         BY: Swati Sharma        DATE: 02/27/04  ECO: *P1R4* */
/* Revision: 1.70         BY: Prashant Parab      DATE: 04/06/04  ECO: *P1WT* */
/* Revision: 1.72         BY: Robin McCarthy      DATE: 04/19/04  ECO: *P15V* */
/* Revision: 1.74         BY: Somesh Jeswani      DATE: 06/16/04  ECO: *P25V* */
/* Revision: 1.74         BY: Sachin Deshmukh     DATE: 07/07/04  ECO: *P268* */
/* Revision: 1.76         BY: Manish Dani         DATE: 09/20/04  ECO: *P2L3* */
/* Revision: 1.77         BY: Sachin Deshmukh     DATE: 09/22/04  ECO: *P2LR* */
/* Revision: 1.78         BY: Niranjan Ranka      DATE: 10/04/04  ECO: *P2MQ* */
/* Revision: 1.79         BY: Dan Herman          DATE: 10/25/04  ECO: *P2QS* */
/* Revision: 1.80         BY: Bharath Kumar       DATE: 11/09/04  ECO: *P2TB* */
/* Revision: 1.82         BY: Shivganesh Hegde    DATE: 01/03/05  ECO: *Q0G5* */
/* Revision: 1.84         BY: Ed van de Gevel     DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.85         BY: Dayanand Jethwa     DATE: 04/01/05  ECO: *P27M* */
/* Revision: 1.86         BY: Robin McCarthy      DATE: 10/01/05  ECO: *P3MZ* */
/* Revision: 1.87         BY: Sandeep Panchal     DATE: 01/17/06  ECO: *P3HZ* */
/* Revision: 1.88         BY: Nishit V            DATE: 02/06/06  ECO: *P4GY* */
/* Revision: 1.90         BY: Jean Miller         DATE: 02/28/06  ECO: *Q0R5* */
/* Revision: 1.91         BY: Ashwini G.          DATE: 03/28/06  ECO: *P4ML* */
/* Revision: 1.93         BY: Suyash Keny         DATE: 09/07/06  ECO: *R086* */
/* Revision: 1.94         BY: Rafiq S.            DATE: 11/23/06  ECO: *P4YY* */
/* Revision: 1.95         BY: Nan Zhang           DATE: 07/03/07  ECO: *R0C6* */
/* Revision: 1.98         BY: Jean Miller         DATE: 11/17/07  ECO: *P62Q* */
/* Revision: 1.99         BY: Iram Momin          DATE: 03/10/08  ECO: *P6G5* */
/* Revision: 1.102        BY: Jean Miller         DATE: 06/24/08  ECO: *R0VH* */
/* Revision: 1.103        BY: Katie Hilbert       DATE: 11/07/08  ECO: *R175* */
/* Revision: 1.104        BY: Xiaolei Meng        DATE: 12/31/08  ECO: *R179* */
/* Revision: 1.105        BY: Mukesh singh        DATE: 02/05/09  ECO: *P5VC* */
/* Revision: 1.109        BY: Dipanshu Talwar     DATE: 10/01/09  ECO: *P552* */
/* Revision: 1.111       BY: Jean Miller         DATE: 11/23/09  ECO: *R1TW* */
/* $Revision: 1.2 $     BY: Anurag Sharma       DATE: 06/28/10  ECO: *Q45J* */
/* Revision: QAD2014      BY: Amol Dudvadkar    DATE: 03/16/15  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*!
 * PARAMETERS:
 *
 * I/O    NAME                 LIKE         DESCRIPTION
 * ------ --------------- ------------ ---------------------------------------
 * input  ref             tx2d_ref     so_nbr until inv print; then so_inv_nbr
 * input  nbr             tx2d_nbr     blank until inv print; then so_nbr
 * input  col-80          mfc_logical  true to print report with 80 columns
 *                                     otherwise report uses 132 columns
 * input  tot_tr_type     tx2d_tr_type 13 for Pending SO; 16 for posting
 * input  tot_cont_charge decimal      Total container charge amount
 * input  tot_line_charge decimal      Total line charge amount
 * input  p_consolidate   mfc_logical  false to initialize taxable
 *                                     and non taxable amounts
 */

/*! N1YL HAS CHANGED THE WAY TAXABLE/NON-TAXABLE AMOUNT IS CALCULATED.
 *  THE ORDER DISCOUNT IS APPLIED FOR EACH LINE TOTAL AND THEN IT IS
 *  SUMMED UP TO CALCULATE THE TAXABLE/NON-TAXABLE AMOUNT BASED ON THE
 *  TAXABLE STATUS OF EACH LINE. PREVIOUSLY, TAXABLE/NON-TAXABLE AMOUNT
 *  WAS OBTAINED FROM THE GTM TABLES. THIS CAUSED PROBLEMS WHEN
 *  MULTIPLE TAXABLE BASES ARE USED TO CALCULATE TAX.
 *
 *  TAXABLE/NON-TAXABLE AMOUNT WILL NOW BE DISPLAYED IN THE TRAILER
 *  FRAME BASED ON THE VALUE OF THE FLAG "DISPLAY TAXABLE/NON-TAXABLE
 *  AMOUNT ON TRAILER" IN THE GLOBAL TAX MANAGEMENT CTRL FILE
 */

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

{us/so/sotxidef.i}

{us/gp/gprunpdf.i "sopl" "p"}
{us/gp/gprunpdf.i "mcpl" "p"}

{us/so/sotrhstb.i}   /* DEFINITION FOR TEMP-TABLE t_tr_hist1 */
{us/xf/xfdefa.i} /*grc338*/

define input parameter ref             like tx2d_ref     no-undo.
define input parameter nbr             like tx2d_nbr     no-undo.
define input parameter col-80          like mfc_logical  no-undo.
define input parameter tax_tr_type     like tx2d_tr_type no-undo.
define input parameter tot_cont_charge as   decimal      no-undo.
define input parameter tot_line_charge as   decimal      no-undo.
define input parameter p_consolidate   like mfc_logical  no-undo.

define new shared variable undo_txdetrp like mfc_logical.
/* l_txchg IS SET TO TRUE IN TXEDIT.P WHEN TAXES ARE BEING EDITED  */
/* AND NOT JUST VIEWED IN DR/CR MEMO MAINTENANCE                   */
define new shared variable l_txchg      like mfc_logical initial no.
define shared variable rndmthd          like rnd_rnd_mthd.
define shared variable so_recno         as   recid.
define shared variable maint            as   logical.
define shared variable consolidate      like mfc_logical.
define shared variable addtax           like mfc_logical.
define shared variable taxable_amt      as decimal format "->>>>,>>>,>>9.99"
   label "Taxable".
define shared variable nontaxable_amt   like taxable_amt label "Non-Taxable".
define shared variable line_total       as decimal format "-zzzz,zzz,zz9.99"
   label "Line Total".
define shared variable disc_amt         like line_total label "Discount"
   format "(zzzz,zzz,zz9.99)".
define shared variable tax_amt          like line_total label "Total Tax".
define shared variable ord_amt          like line_total label "Total".
define shared variable invcrdt          as   character format "x(15)".
define shared variable user_desc        like trl_desc extent 3.
define shared variable tax_date         like so_tax_date.
define shared variable new_order        like mfc_logical.
define shared variable tax_edit         like mfc_logical.
define shared variable tax_edit_lbl     like mfc_char format "x(28)".
define shared variable undo_trl2        like mfc_logical.
define shared variable tot_line_comm    as decimal extent 4
   format "->>>>,>>>,>>9.99<<<<".
define shared  variable container_charge_total as decimal
   format "->>>>>>>>9.99"
   label "Containers" no-undo.
define  shared variable line_charge_total as decimal
   format "->>>>>>>>9.99"
   label "Line Charges" no-undo.
define shared variable l_nontaxable_lbl as   character format "x(12)" no-undo.
define shared variable l_taxable_lbl    as   character format "x(12)" no-undo.
{us/xf/xfso10v.i} /*grc338*/
define variable msg as character. /*grc338*/

define shared frame sotot.
define shared frame d.

define variable ext_price        like sod_price                         no-undo.
define variable ext_actual       like sod_price                         no-undo.
define variable tax_lines        like tx2d_line   initial 0             no-undo.
define variable page_break       as   integer     initial 0             no-undo.
define variable recalc           like mfc_logical initial true          no-undo.
define variable tax-edited       like mfc_logical initial false         no-undo.
define variable ext_margin       as   decimal format "->>>>,>>>,>>9.99" no-undo.
define variable disc_pct         like so_disc_pct                       no-undo.
define variable l_tmp_amt        as   decimal                           no-undo.
define variable retval           as   integer                           no-undo.
define variable l_retrobill      like mfc_logical                       no-undo.
define variable l_tax_in         like tax_amt                           no-undo.
define variable l_yn             like mfc_logical                       no-undo.
define variable l_tax_amt1       like tax_amt                           no-undo.
define variable l_tax_amt2       like tax_amt                           no-undo.
define variable l_nontax_amt     like tx2d_nontax_amt                   no-undo.
define variable auth_price       like sod_price                         no-undo
       format "->>>>,>>>,>>9.99".
define variable auth_found       like mfc_logical  no-undo.
define variable corr_inv         like mfc_logical  no-undo.
define variable return_status    as   character    no-undo.
define variable undo_flag        as   logical.                /* NOT no-undo */
define variable invoice_domain   as   character.              /* NOT no-undo */
define variable l_tmp_line_total as   decimal      no-undo.
define variable l_old_ord_amt    like line_total   no-undo.
define variable l_roundedDiscAmt like line_total
   format "(zzzz,zzz,zz9.99)" no-undo.
define variable exrate  like exr_rate no-undo.
define variable exrate2 like exr_rate no-undo.
define variable ordertotal as decimal no-undo.
define variable before_ordertotal as decimal no-undo.

define variable hCreditManagementLib  as handle  no-undo.
define variable iReturnStatus         as integer no-undo.

/* CREDIT MANAGEMENT ROUTINE                */
{us/mf/mfcredpl.i hCreditManagementLib}

run initialiseCreditManagementLibrary
   ( input  hCreditManagementLib,
     output hCreditManagementLib).

define shared temp-table t_absr_det             no-undo
   field t_absr_id        like absr_id
   field t_absr_reference like absr_reference
   field t_absr_qty       as decimal format "->>>>,>>>,>>9.99"
   field t_absr_ext       as decimal format "->>>>,>>>,>>9.99"
   index t_absr_indx t_absr_id t_absr_reference.

empty temp-table t_absr_det no-error.

if execname = "rcrbrp01.p" then
   l_retrobill = yes.

{us/tx/txcalvar.i}
{us/et/etvar.i}     /* TOOLKIT GENERAL VARIABLES */
{us/et/etrpvar.i}   /* TOOLKIT REPORTING CURRENCY VARIABLES */
{us/so/socnvars.i}  /* CONSIGNMENT VARIABLES */

{us/bbi/gpfilev.i}   /* VARIABLE DEFINITIONS FOR gpfile.i */

{us/cc/cclc.i}      /*DETERMINE IF CONTAINER AND LINE CHARGES ARE ENABLED*/

/* CHECK TO SEE IF CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ENABLE_CUSTOMER_CONSIGNMENT,
     input 10,
     input ADG,
     input CUST_CONSIGN_CTRL_TABLE,
     output using_cust_consignment)"}

for first soc_ctrl where soc_domain = global_domain
no-lock: end.

for first txc_ctrl where txc_domain = global_domain
no-lock: end.

invoice_domain = global_domain.

if maint then
   find so_mstr where recid(so_mstr) = so_recno
   exclusive-lock no-error.
else
   for first so_mstr where recid(so_mstr) = so_recno
   no-lock: end.

/* CREATE TEMP-TABLE TO STORE tr_hist RECORDS AND RETRIEVE THE SAME IN */
/* soauthbl.p TO IMPROVE THE PERFORMANCE WHILE PRINTING AUTHORIZATION  */
/* NUMBERS FOR SCHEDULE ORDERS.                                         */
if  available so_mstr
   and so_sched = yes
   and so__qadc03 = "yes"
   and not can-find(first t_tr_hist1 where t_tr_nbr = so_nbr)
then do:
   {us/bbi/gprun.i ""sotrhstb.p""
      "(input        so_nbr,
        input        '',
        input-output table t_tr_hist1)"}
end. /* IF AVAILABLE so_mstr */

find cil_mstr where cil_domain = global_domain
   and cil_cor_so_nbr = so_nbr
no-lock no-error.

corr_inv = available cil_mstr.

/**** FORMS ****/
form
   so_cr_init     colon 15
   so_to_inv      colon 48
   so_cr_card     colon 15
   so_print_so    colon 48
   so_stat        colon 15
   so_print_pl    colon 48
   so_rev         colon 15
   so_prepaid     colon 48
   so_fob         colon 15
with frame d side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

{us/so/socurvar.i}
{us/tx/txcurvar.i}
/*grc338 {us/so/sototfrm.i} */

taxloop:
do on endkey undo, leave:

   if can-find (first tx2d_det
                where tx2d_domain  = global_domain
                and   tx2d_ref     = ref
                and   tx2d_nbr     = nbr
                and   tx2d_tr_type = tax_tr_type)
   then do:
       run p_calc.
       if undo_txdetrp = true then
          undo, leave.
   end. /* can-find (first tx2d_det ... */

   /* UNTIL AN INVOICE IS PRINTED REF IS so_nbr AND */
   /* nbr IS BLANK.  ONCE AN INVOICE IS PRINTED     */
   /* REF IS so_inv_nbr AND nbr IS so_nbr           */
   /* CALCULATE TAX AMOUNTS ONLY IF MAINT           */
   if maint then do:

      /* SEE IF ANY TAX DETAIL EXISTS */
      for first tx2d_det where tx2d_domain  = global_domain
          and tx2d_ref     = so_nbr
          and tx2d_nbr     = nbr
          and tx2d_tr_type = tax_tr_type
      no-lock: end.

      if available tx2d_det then do:
         /* CHECK PREVIOUS DETAIL FOR EDITED VALUES */
         if can-find (first tx2d_det
                      where tx2d_domain  = global_domain
                      and   tx2d_ref     = so_nbr
                      and   tx2d_nbr     = nbr
                      and   tx2d_tr_type = tax_tr_type
                      and   tx2d_edited)
         then do:
           /* PREVIOUS TAX VALUES EDITED. RECALCULATE? */
           {us/bbi/pxmsg.i &MSGNUM=917 &ERRORLEVEL=2 &CONFIRM=recalc}
         end.
      end.

      else do:
         tax-edited = no.

         {us/bbi/gprun.i ""txedtchk.p""
                  "(input  '11'               /* SOURCE TR  */,
                    input  so_nbr             /* SOURCE REF */,
                    input  nbr                /* SOURCE NBR */,
                    input  0                  /* ALL LINES  */,
                    output tax-edited)"}      /* RETURN VAL */

         if tax-edited then do:
            /* Copy edited tax values? */
            {us/bbi/pxmsg.i &MSGNUM=935 &ERRORLEVEL=2 &CONFIRM=tax-edited}
         end. /* IF tax-edited */

      end. /* ELSE IF AVAILABLE tx2d_det */

      if recalc then do:

         l_nontax_amt  = 0.

         for first tx2d_det where tx2d_domain = global_domain
            and tx2d_ref = so_nbr
            and tx2d_tr_type    = tax_tr_type
            and tx2d_nontax_amt <> 0
         no-lock:
            l_nontax_amt = tx2d_nontax_amt.
         end. /* FOR FIRST tx2d_det */

         /* THE POST FLAG IS SET TO 'NO' BECAUSE WE ARE NOT CREATING */
         /* QUANTUM REGISTER RECORDS FROM THIS CALL TO TXCALC.P      */
         {us/bbi/gprun.i ""txcalc.p""
                  "(input  tax_tr_type,
                    input  ref,
                    input  nbr,
                    input  tax_lines /* ALL LINES */,
                    input  no,
                    output result-status)"}
         if maint
         then do:
            if not can-find(first tx2d_det
                               where tx2d_domain  = global_domain
                               and   tx2d_ref     = ref
                               and   tx2d_nbr     = nbr
                               and   tx2d_tr_type = tax_tr_type
                               and  (tax_lines    = 0
                                  or tx2d_line    = tax_lines)
                            no-lock)
            then do:
               /* TAX DATA IS INCOMPLETE. TAX DETAIL WAS NOT CREATED */
               {us/bbi/pxmsg.i &MSGNUM=11415 &ERRORLEVEL=2}
               /* INVOICE WILL NOT POST FOR THIS SALES ORDER */
               {us/bbi/pxmsg.i &MSGNUM=11416 &ERRORLEVEL=1}
            end. /* IF NOT CAN-FIND ... */
         end. /* IF maint */

         /* CREATES TAX RECORDS WITH TRANSACTION TYPE "11" */
         /* FOR THE QUANTITY BACKORDER DURING PENDING      */
         /* INVOICE MAINTENANCE                            */
         if not so_sched then do:
            {us/bbi/gprun.i ""txcalc.p""
                     "(input  "11",
                       input  ref,
                       input  nbr,
                       input  tax_lines,
                       input  no,
                       output result-status)"}
         end. /* IF NOT so_sched */

      end. /* IF recalc */
      run p_calc.

      if undo_txdetrp = true then
         undo, leave.

   end. /* IF maint */

   if maint then do on endkey undo taxloop, leave:

      /*grc338 comment begin
      if txc__qad03 then
         display
            l_nontaxable_lbl
            nontaxable_amt
            l_taxable_lbl
            taxable_amt
         with frame sotot.
      else
         display
            "" @ l_nontaxable_lbl
            "" @ nontaxable_amt
            "" @ l_taxable_lbl
            "" @ taxable_amt
         with frame sotot.
      find ih_hist where
           ih_hist.ih_domain  = global_domain and
           ih_hist.ih_inv_nbr = so_inv_nbr
           no-lock no-error.
      if available ih_hist  and
         ih__qadc05 <> "":U and 
         ih__qadc05 <> ?    and 
         num-entries(ih__qadc05,chr(4)) = 2
      then display
         so_curr
         absolute(line_total)    @ line_total
         absolute(so_disc_pct)   @ so_disc_pct
         absolute(disc_amt)      @ disc_amt
         tax_date
         user_desc[1] so_trl1_cd absolute(so_trl1_amt) @ so_trl1_amt
         user_desc[2] so_trl2_cd absolute(so_trl2_amt) @ so_trl2_amt
         user_desc[3] so_trl3_cd absolute(so_trl3_amt) @ so_trl3_amt
         absolute(tax_amt)                             @ tax_amt
         absolute(ord_amt)                             @ ord_amt
         absolute(container_charge_total)              @ container_charge_total
         absolute(line_charge_total)                   @ line_charge_total
         tax_edit 
         invcrdt 
         with frame sotot.
      else display
         so_curr
         line_total
         so_disc_pct
         disc_amt
         tax_date
         user_desc[1] so_trl1_cd so_trl1_amt
         user_desc[2] so_trl2_cd so_trl2_amt
         user_desc[3] so_trl3_cd so_trl3_amt
         tax_amt
         ord_amt
         container_charge_total
         line_charge_total
         tax_edit
         invcrdt
      with frame sotot.
      grc338 comment end*/

      /* DON'T RE-SET THE TAX DATA */
      trlloop:
      do on error undo trlloop, retry
         on endkey undo taxloop, leave:

         /* STORING THE DEFAULT VOLUME DISCOUNT PERCENTAGE */
         assign
            disc_pct = so_disc_pct.

         /*grc338 comment begin
         set
            so_disc_pct when not corr_inv
            so_trl1_cd  when not corr_inv
            so_trl1_amt
            so_trl2_cd  when not corr_inv
            so_trl2_amt
            so_trl3_cd  when not corr_inv
            so_trl3_amt
            tax_edit
         with frame sotot
         editing:
            readkey.
            if  keyfunction(lastkey) = "end-error"
            then do:
               hide message no-pause.
                /* TAX AND TRAILER WILL NOT BE SAVED WHEN <BACK> */
                /* OR <END> PRESSED */
               {us/bbi/pxmsg.i &MSGNUM=4773 &ERRORLEVEL=2}
               /* INVOICE WILL NOT POST FOR THIS SALES ORDER */
               {us/bbi/pxmsg.i &MSGNUM=11416 &ERRORLEVEL=1}
               /* CONTINUE WITHOUT SAVING?                     */
               so_disc_pct = disc_pct.
               display so_disc_pct with frame sotot.
               {us/bbi/pxmsg.i &MSGNUM=4774 &ERRORLEVEL=1 &CONFIRM=l_yn}
               so_disc_pct = disc_pct.
               display so_disc_pct with frame sotot.
               hide message no-pause.

               if l_yn then
                  undo taxloop, leave.
            end. /* IF KEYFUNCTION(LASTKEY) */
            else
               apply lastkey.
         end. /* EDITING */

         if so_disc_pct >   100
         or so_disc_pct < - 100
         then do:
            {us/bbi/pxmsg.i &MSGNUM=6932 &ERRORLEVEL=3 &MSGARG1=so_disc_pct}
            next-prompt so_disc_pct with frame sotot.
            undo trlloop, retry.
         end.
         grc338 comment end*/

         /* TO CHECK WHETHER DISCOUNT PERCENTAGE MANUALLY ENTERED?*/
         if so_disc_pct <> disc_pct then
            so__qadl01 = yes.

         /*grc338 comment begin
         {us/tx/txedttrl.i &code  = "so_trl1_cd"
                     &amt   = "so_trl1_amt"
                     &desc  = "user_desc[1]"
                     &frame = "sotot"
                     &loop  = "trlloop"}
         grc338 comment end*/
         /*grc338 add begin*/
         {us/tx/txedttrl.i &code  = "so_trl1_cd"
                     &amt   = "so_trl1_amt"
                     &desc  = "user_desc[1]"
                     &frame = "a"
                     &loop  = "trlloop"}
         /*grc338 add end*/

         /* VALIDATE TRAILER 1 AMOUNT */
         if (so_trl1_amt <> 0) then do:

            {us/bbi/gprun.i ""gpcurval.p""
               "(input  so_trl1_amt,
                 input  rndmthd,
                 output retval)"}

            if retval <> 0 then do:
               /* next-prompt so_trl1_amt with frame sotot. */ /*grc338*/
               undo trlloop, retry.
            end.

         end.
         /*grc338 comment begin
         {us/tx/txedttrl.i &code  = "so_trl2_cd"
                     &amt   = "so_trl2_amt"
                     &desc  = "user_desc[2]"
                     &frame = "sotot"
                     &loop  = "trlloop"}
         grc338 comment end*/
         /*grc338 add begin*/
         {us/tx/txedttrl.i &code  = "so_trl2_cd"
                     &amt   = "so_trl2_amt"
                     &desc  = "user_desc[2]"
                     &frame = "a"
                     &loop  = "trlloop"}
         /*grc338 add end*/

         /* VALIDATE TRAILER 2 AMOUNT */
         if (so_trl2_amt <> 0) then do:
            {us/bbi/gprun.i ""gpcurval.p""
               "(input  so_trl2_amt,
                 input  rndmthd,
                 output retval)"}

            if retval <> 0 then do:
               /* next-prompt so_trl2_amt with frame sotot. */ /*grc338*/
               undo trlloop, retry.
            end.
         end.

         /*grc338 comment begin
         {us/tx/txedttrl.i &code  = "so_trl3_cd"
                     &amt   = "so_trl3_amt"
                     &desc  = "user_desc[3]"
                     &frame = "sotot"
                     &loop  = "trlloop"}
         grc338 comment end*/
         /*grc338 add begin*/
         {us/tx/txedttrl.i &code  = "so_trl3_cd"
                     &amt   = "so_trl3_amt"
                     &desc  = "user_desc[3]"
                     &frame = "a"
                     &loop  = "trlloop"}
         /*grc338 add end*/

         /* VALIDATE TRAILER 3 AMOUNT */
         if (so_trl3_amt <> 0) then do:
            {us/bbi/gprun.i ""gpcurval.p""
               "(input  so_trl3_amt,
                 input  rndmthd,
                 output retval)"}

            if retval <> 0 then do:
               /* next-prompt so_trl3_amt with frame sotot. */ /*grc338*/
               undo trlloop, retry.
            end.
         end.

      end. /* TRLLOOP */

      /****** CALCULATE TAXES ************/

      /* UNTIL AN INVOICE IS PRINTED REF IS so_nbr AND */
      /* nbr IS BLANK.  ONCE AN INVOICE IS PRINTED     */
      /* REF BECOMES so_inv_nbr AND nbr IS so_nbr      */

      if recalc and not tax-edited then do:

         {us/bbi/gprun.i ""txcalc.p""
            "(input  tax_tr_type,
              input  ref,
              input  nbr,
              input  tax_lines, /* ALL LINES */
              input  no,
              output result-status)"}

         /* CREATES TAX RECORDS WITH TRANSACTION TYPE "11" */
         /* FOR THE QUANTITY BACKORDER DURING PENDING      */
         /* INVOICE MAINTENANCE                            */
         if not so_sched then do:

            {us/bbi/gprun.i ""txcalc.p""
               "(input  "11",
                 input  ref,
                 input  nbr,
                 input  tax_lines,
                 input  no,
                 output result-status)"}

         end. /* IF NOT so_sched */

      end.

      {us/bbi/gprun.i ""txabsrb.p""
         "(input so_nbr,
           input ' ',
           input '13',
           input-output line_total,
           input-output taxable_amt)"}

      /* DO TAX DETAIL DISPLAY / EDIT HERE */
      if tax_edit then do:

         hide frame sotot no-pause.
         hide frame d no-pause.

         {us/bbi/gprun.i ""txedit.p""
            "(input  tax_tr_type,
              input  ref,
              input  nbr,
              input  tax_lines, /* ALL LINES */
              input  so_tax_env,
              input  so_curr,
              input  so_ex_ratetype,
              input  so_ex_rate,
              input  so_ex_rate2,
              input  tax_date,
              output tax_amt)"}

         run p_calc.

         if undo_txdetrp = true then
            undo, leave.

      end.

   end. /* END IF maint BLOCK */

   l_old_ord_amt        = ord_amt.

   run p_calc.

   if l_old_ord_amt <> ord_amt
      and execname  = "soivmt.p"
   then do:
      find first so_mstr where recid(so_mstr) = so_recno
      exclusive-lock no-error.
      if available so_mstr then
         assign
            so_to_inv   = yes
            so_invoiced = no.
   end.

   if undo_txdetrp = true then
      undo, leave.

   if maint then do:
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
      if (base_curr =  cm_curr and
         base_curr <> so_curr) and
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
            run updateOpenOrderTotal in hCreditManagementLib
               ( input  so_bill,
                 input  before_ordertotal,
                 input  OrderTotal,
                 input  cm_curr,
                 output iReturnStatus).
         end. /* if (before_ordertotal - ordertotal) <> 0 */
      end. /* base_curr =  cm_curr and base_curr <> so_curr  */
      else do:
         /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
         run updateOpenOrderTotal in hCreditManagementLib
            (input  so_bill,
             input  getBeforeOrderTotal(input so_nbr),
             input  getOrderTotal      (input so_nbr),
             input  so_curr,
             output iReturnStatus).
      end. /* else */

      view frame sotot.
      view frame d.

   end.

   /* DISPLAY TRAILER ONLY IF INVOICES ARE NOT CONSOLIDATED */
   /*grc338 comment begin
   if not consolidate then do:

      if txc__qad03 then
         display
            l_nontaxable_lbl
            nontaxable_amt
            l_taxable_lbl
            taxable_amt
         with frame sotot.
      else
         display
            "" @ l_nontaxable_lbl
            "" @ nontaxable_amt
            "" @ l_taxable_lbl
            "" @ taxable_amt
         with frame sotot.

      display
         so_curr
         line_total
         so_disc_pct
         disc_amt
         tax_date
         user_desc[1]
         so_trl1_cd
         so_trl1_amt
         user_desc[2]
         so_trl2_cd
         so_trl2_amt
         user_desc[3]
         so_trl3_cd
         so_trl3_amt
         tax_amt
         ord_amt
         container_charge_total
         line_charge_total
         invcrdt
      with frame sotot.

   end.
   grc338 comment end*/

   undo_trl2 = FALSE.

end. /* TAXLOOP */

empty temp-table t_tr_hist1.

/* ========================================================================== */
/* ************************* INTERNAL PROCEDURES **************************** */
/* ========================================================================== */

PROCEDURE ip_calc_amt:
   define input-output parameter p_ext_actual     like sod_price no-undo.
   define input-output parameter p_line_total     as decimal     no-undo.
   define input-output parameter p_taxable_amt    as decimal.
   define input-output parameter p_nontaxable_amt as decimal.
   define input-output parameter l_taxable_amt    as decimal.
   define parameter    buffer    somstr for so_mstr.
   define parameter    buffer    soddet for sod_det.

   /* l_ext_actual IS THE EXTENDED AMOUNT EXCLUDING DISCOUNT. IT WILL */
   /* BE USED FOR THE CALCULATION OF taxable_amt AND nontaxable_amt   */
   define variable l_ext_actual like sod_price   no-undo.

   if somstr.so_fsm_type = "SC" then do:
      p_ext_actual =  soddet.sod_price * soddet.sod_qty_item.

      if can-find (sac_ctrl where sac_domain = global_domain
                      and sac_int_rnd)
      then do:
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output p_ext_actual,
              input        rndmthd,
              output       mc-error-number)"}

         if mc-error-number <> 0
         then do:

            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}

         end. /* IF mc-error-number <> 0 */
      end. /* IF CAN-FIND (sac_ctrl... */

      p_ext_actual = p_ext_actual  * soddet.sod_qty_per.
   end. /* IF somstr.so_fsm_type = "SC" */
   else
      p_ext_actual = (soddet.sod_price  * soddet.sod_qty_inv).

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
             "(input-output p_ext_actual,
               input rndmthd,
               output mc-error-number)"}

   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.

   /* CHECK AUTHORIZATION RECS FOR DIFFERENT EXT PRICE */
   if soddet.sod_sched  = yes
      and somstr.so__qadc03 = "yes"
   then do:

      auth_found = no.

      /* SECOND PARAMETER IS BLANK IN ORDER TO MATCH */
      /* THE INVOICE TOTAL WITH DR/CR MEMO TOTAL     */
      {us/bbi/gprun.i ""soauthbl.p""
               "(input table t_tr_hist1,
                 input '',
                 input somstr.so__qadc03,
                 input soddet.sod_nbr,
                 input soddet.sod_line,
                 input soddet.sod_price,
                 input soddet.sod_site,
                 input p_ext_actual,
                 output auth_price,
                 output auth_found)"}
      assign
         ext_actual   = auth_price
         p_ext_actual = auth_price.

   end. /*IF sod_sched */
   l_ext_actual = (p_ext_actual * (1 - somstr.so_disc_pct / 100)).
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
             "(input-output l_ext_actual,
               input rndmthd,
               output mc-error-number)"}

   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.

   for first t_store_ext_actual
      where t_line = sod_line
   no-lock:
   end. /* FOR FIRST t_store_ext_actual ... */

      /* CALL THE PROCEDURE TO GET LINE TOTAL ONLY WHEN TAX IS INCLUDED */
      /* AND THE TAX HAS BEEN ALREADY CALCULATED WHICH IS INDICATED BY  */
      /* THE EXISTENCE OF TEMPORARY TABLE t_store_ext_actual            */
      /*                                                                */
      /* AFTER WE GET THE LINE TOTAL WE CAN USE THE EXISTING LOGIC TO   */
      /* CALCULATE ORDER TOTAL AND DISCOUNT                             */
   if not available t_store_ext_actual
   then do:
      create t_store_ext_actual.
      assign
         t_line       = sod_line
         t_ext_actual = l_ext_actual.
   end. /* IF NOT AVAILABLE t_store_ext_actual ... */

   if available t_store_ext_actual
   then do:
      if soddet.sod_tax_in and soddet.sod_taxable
      then do:
         run getExtendedAmount
             (input        rndmthd,
              input        soddet.sod_line,
              input        somstr.so_nbr,
              input        somstr.so_inv_nbr,
              input        tax_tr_type,
              input-output l_ext_actual).
         p_line_total = p_line_total + l_ext_actual.
      end. /* IF soddet.sod_tax_in */
      else
         p_line_total = p_line_total + p_ext_actual.
   end. /* IF AVAILABLE t_store_ext_actual ... */

   /* FOR CALL INVOICES, SFB_TAXABLE (IN 86E) OF SFB_DET DETERMINES */
   /* TAXABILITY AND THERE COULD BE MULTIPLE SFB_DET FOR A SOD_DET. */
   if soddet.sod_fsm_type = "FSM-RO"
      and soddet.sod_taxable
      and not soddet.sod_fix_pr
   then do:
      for each sfb_det
         where sfb_domain = global_domain
         and   sfb_nbr = soddet.sod_nbr
         and   sfb_so_line = soddet.sod_line
      no-lock:
         if sfb_exchange then
            p_ext_actual =  0 - (sfb_exg_price * sfb_qty_ret).
         else
            p_ext_actual = sfb_price * sfb_qty_req.

         /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                   "(input-output p_ext_actual,
                     input rndmthd,
                     output mc-error-number)"}

         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.

         if sfb_exchange then
            l_ext_actual = p_ext_actual * (1 - somstr.so_disc_pct / 100).
         else
            assign
               p_ext_actual = p_ext_actual - sfb_covered_amt
               l_ext_actual = p_ext_actual * (1 - somstr.so_disc_pct / 100).

         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                   "(input-output l_ext_actual,
                     input rndmthd,
                     output mc-error-number)"}

         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.

         if sfb_taxable then
            if soddet.sod_tax_in
            then
               l_taxable_amt    = l_taxable_amt    + l_ext_actual.
            else
               p_taxable_amt    = p_taxable_amt    + p_ext_actual.
         else
            p_nontaxable_amt = p_nontaxable_amt + p_ext_actual.

      end. /* FOR EACH SFB_DET */
   end. /* IF SOD_FSM_TYPE = FSM-RO ... */
   else
      if soddet.sod_taxable then
         if soddet.sod_tax_in
         then
            l_taxable_amt    = l_taxable_amt    + l_ext_actual.
         else
            p_taxable_amt    = p_taxable_amt    + p_ext_actual.
      else
         p_nontaxable_amt = p_nontaxable_amt + p_ext_actual.

   if using_line_charges then do:

      if can-find(first absl_det
         where absl_domain    = global_domain
         and   absl_order     = sod_nbr
         and   absl_ord_line  = sod_line)
         and   sod_qty_inv   <> 0
      then do:
         for each absl_det
            where   absl_domain   = global_domain
            and     absl_order    = sod_nbr
            and     absl_ord_line = sod_line
            and    (absl_inv_nbr = "" or absl_inv_nbr = ref)
            and     absl_confirm  = yes
            and     absl_inv_post = no
         no-lock:
            for first trl_mstr
               where   trl_domain = global_domain
               and     trl_code   = absl_trl_code
            no-lock:
               if trl_taxable then
                  p_taxable_amt    = p_taxable_amt    + absl_ext_price.
               else
                  p_nontaxable_amt = p_nontaxable_amt + absl_ext_price.
            end. /* FOR FIRST trl_mstr */
         end. /* FOR EACH absl_det */
      end. /* IF AVAILABLE absl_det */

      if not can-find(first absl_det
         where absl_domain    = global_domain
         and   absl_order     = sod_nbr
         and   absl_ord_line  = sod_line)
         and sod_qty_inv <> 0
      then do:

         for each sodlc_det
            where   sodlc_domain           = global_domain
            and     sodlc_order            = sod_nbr
            and     sodlc_ord_line         = sod_line
         no-lock:
            if sodlc_one_time
               and sodlc_times_charged > 0
            then
               next.

            for first trl_mstr
               where   trl_domain  = global_domain
               and     trl_code    = sodlc_trl_code
            no-lock:
               if trl_taxable then
                  p_taxable_amt    = p_taxable_amt    + sodlc_lc_amt.
               else
                  p_nontaxable_amt = p_nontaxable_amt + sodlc_lc_amt.
            end. /* FOR FIRST trl_mstr */

         end. /* FOR EACH sodlc_det*/

      end. /* IF not available absl_det */

   end. /* IF using_line_charges */

   if using_container_charges 
   then do:

      for each abscc_det
         where   abscc_domain      = global_domain
         and     abscc_order       = sod_nbr
         and     abscc_ord_line    = sod_line
         and    (abscc_inv_nbr     = "" or abscc_inv_nbr = ref)
         and     abscc_confirm     = yes
         and     abscc_inv_post    = no
      no-lock:
      
         if abscc_taxable    = yes 
         then
            p_taxable_amt    = p_taxable_amt 
                               + (abscc_cont_price * abscc_qty).
         else
            p_nontaxable_amt = p_nontaxable_amt 
                               + (abscc_cont_price * abscc_qty).
      end. /* FOR EACH abscc_det */
   end. /* IF using_container_charges */

END PROCEDURE. /* ip_calc_amt */

/* ========================================================================== */
PROCEDURE switchDomain:
/* -------------------------------------------------------------------------- */
   define input  parameter ip_domain  as character no-undo.
   define output parameter op_undo    as logical   no-undo.

   define variable err-flag           as integer   no-undo.

   /* SWITCH TO INVOICE DOMAIN */
   {us/bbi/gprun.i ""gpmdas.p""
            "(input  ip_domain,
              output err-flag)"}

   if err-flag <> 0 then do:
      /* DOMAIN # IS NOT AVAILABLE */
      {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=ip_domain}
      assign
         global_domain = ip_domain
         op_undo       = yes.
   end.

END PROCEDURE.   /* switchDomain */

PROCEDURE p_calc :
   define buffer b_si_mstr for si_mstr.
   define variable l_taxtot_tax_in_yes as decimal no-undo.
   define variable l_taxtot_tax_in_no  as decimal no-undo.

   l_tmp_line_total  = 0 .

   if available so_mstr
   then .

   if available soc_ctrl
   then .

   empty temp-table t_store_ext_actual no-error.

   /* WHERE THE INVOICES HAVE NOT BEEN CONSOLIDATED */
   if not maint
      and not consolidate
   then do:

      undo_txdetrp = true.

     /* {us/bbi/gprun.i  ""txdetrp.p"" */ /*grc338*/
     /*grc338*/ {us/bbi/gprun.i  ""xfdetrp.p""
                "(input tax_tr_type,
                  input ref,
                  input nbr,
                  input col-80,
                  input page_break,
                  input '',
                  input yes)"}

      if undo_txdetrp = true then
         return .

   end. /* if not maint */
   /*** GET TOTALS FOR LINES ***/
   assign
      ext_actual             = 0
      tax_amt                = 0
      l_tax_in               = 0
      disc_amt               = 0
      line_total             = 0
      tot_line_comm[1]       = 0
      tot_line_comm[2]       = 0
      tot_line_comm[3]       = 0
      tot_line_comm[4]       = 0
      tax_date               = so_due_date
      taxable_amt            = 0
      l_taxtot_tax_in_no     = 0
      l_taxtot_tax_in_yes    = 0
      nontaxable_amt         = 0 /*              when not p_consolidate */
      container_charge_total = tot_cont_charge when (using_container_charges or
                                                     using_line_charges )
      line_charge_total      = tot_line_charge when (using_container_charges or
                                                     using_line_charges )
      ord_amt                = 0               when (using_container_charges or
                                                     using_line_charges )
      l_ord_contains_tax_in_lines = can-find (first sod_det
                                              where sod_domain = global_domain
                                                and sod_nbr = so_nbr
                                                and sod_taxable
                                                and sod_tax_in
                                                and sod_compl_stat = "") .

   if so_tax_date <> ? then
      tax_date = so_tax_date.
   else
   if so_ship_date <> ? then
      tax_date = so_ship_date.
	
   if using_container_charges then
      line_total = line_total + tot_cont_charge.
   if using_line_charges then
      line_total = line_total + tot_line_charge.
   sod_detloop:
   for each sod_det where sod_domain  = global_domain
      and sod_nbr = so_nbr
      and sod_compl_stat = ""
   no-lock:

      /* IF THE ORDER LINE IS A CONSIGNMENT ORDER LINE  */
      /* THEN WE DON'T WANT THE DOLLAR AMOUNT INCLUDED  */
      /* ON THE INVOICE WHEN THE LINE HAS BEEN SHIPPED, */
      /* BUT WHEN THE SHIPMENT HAS BEEN USED.           */
      if using_cust_consignment
         and sod_consignment
      then do:

         for first b_si_mstr
             where b_si_mstr.si_domain = global_domain
              and  b_si_mstr.si_site = sod_site
         no-lock:
            if b_si_mstr.si_db <> global_domain then do:
               /* SWITCH TO INVENTORY DOMAIN */
               run switchDomain
                  (input  b_si_mstr.si_db,
                   output undo_flag).
               if undo_flag then
                  undo.
            end.
         end.   /* FOR FIRST b_si_mstr */

         /* IF NON-INVOICED CONSIGNMENT USAGE RECORDS EXIST, INVOICE THEM */
         {us/bbi/gprun.i ""soivtr2a.p""
               "(input  so_tax_date,
                 input  so_nbr,
                 input  sod_line,
                 output consign_flag,
                 output consign_loc,
                 output intrans_loc,
                 output max_aging_days,
                 output auto_replenish,
                 output return_status,
                 input-output tax_date)"}

         if invoice_domain <> global_domain then do:
            /* SWITCH TO INVOICE DOMAIN */
            run switchDomain
               (input  invoice_domain,
                output undo_flag).
            if undo_flag then
               undo.
         end.

      end. /* IF using_cust_consignment */

      run ip_calc_amt
         (input-output ext_actual,
          input-output line_total,
          input-output l_taxtot_tax_in_no,
          input-output nontaxable_amt,
          input-output l_taxtot_tax_in_yes,
          buffer       so_mstr,
          buffer       sod_det).

      ext_margin = ext_actual - round(sod_std_cost * (sod_qty_inv),2).

      /* COMMISSIONS BASED ON MARGIN */
      if soc_margin = yes
      then
         assign
            tot_line_comm[1] = tot_line_comm[1]
                             + ext_margin * sod_comm_pct[1] / 100
            tot_line_comm[2] = tot_line_comm[2]
                             + ext_margin * sod_comm_pct[2] / 100
            tot_line_comm[3] = tot_line_comm[3]
                             + ext_margin * sod_comm_pct[3] / 100
            tot_line_comm[4] = tot_line_comm[4]
                             + ext_margin * sod_comm_pct[4] / 100.
      else        /* Commissions based on sales  */
         assign
            tot_line_comm[1] = tot_line_comm[1]
                             + ext_actual * sod_comm_pct[1] / 100
            tot_line_comm[2] = tot_line_comm[2]
                             + ext_actual * sod_comm_pct[2] / 100
            tot_line_comm[3] = tot_line_comm[3]
                             + ext_actual * sod_comm_pct[3] / 100
            tot_line_comm[4] = tot_line_comm[4]
                             + ext_actual * sod_comm_pct[4] / 100.

   end.   /* FOR EACH SOD_DET */

   /* SKIPPING SALES VOLUME DISCOUNT CALCULATION    */
   /* FOR RETROBILLED ITEMS                         */
   if maint
      and not so__qadl01
      and not l_retrobill
   then do:

      for first cm_mstr
         where cm_domain = global_domain
         and   cm_addr = so_cust
      no-lock:
      end.

      if so_cust <> so_ship
         and can-find (cm_mstr where cm_mstr.cm_domain = global_domain
                               and   cm_mstr.cm_addr = so_ship)
      then
         for first cm_mstr
            where cm_mstr.cm_domain = global_domain
            and   cm_mstr.cm_addr = so_ship
         no-lock:
         end.

      {us/bbi/gprun.i ""sosd.p""
               "(input so_ord_date,
                 input so_ex_rate,
                 input so_ex_rate2,
                 input so_cust,
                 input so_curr,
                 input line_total,
                 output disc_pct)"}
      if disc_pct      > cm_disc_pct
         and disc_pct <> 0
      then
         so_disc_pct = disc_pct.
      else
         so_disc_pct = cm_disc_pct.

   end. /* IF maint */

   l_tmp_amt = l_taxtot_tax_in_no * so_disc_pct / 100.

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_tmp_amt,
        input rndmthd,
        output mc-error-number)"}
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.

   assign
      l_taxtot_tax_in_no = l_taxtot_tax_in_no - l_tmp_amt
      l_tmp_amt          = nontaxable_amt * so_disc_pct / 100.

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_tmp_amt,
        input rndmthd,
        output mc-error-number)"}
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.

   nontaxable_amt = nontaxable_amt - l_tmp_amt.

   taxable_amt    = l_taxtot_tax_in_no + l_taxtot_tax_in_yes.

   if can-find(first sod_det where sod_domain = global_domain
                    and sod_nbr      = so_nbr
                    and sod_fsm_type = "FSM-RO"
                    and sod_taxable
                    and not sod_fix_pr
                    and sod_compl_stat = "")
   then do:
      {us/bbi/gprun.i ""txtotal1.p""
               "(input  tax_tr_type,
                 input  ref,
                 input  so_nbr,
                 input  tax_lines,      /* ALL LINES */
                 output l_tax_in)"}

      taxable_amt  =  taxable_amt - l_tax_in .
   end. /* IF CAN-FIND (FIRST sod_det .. */

   /* USE THE EXISTING LOGIC TO CALCULATE DISCOUNT ONLY WHEN */
   /* SALES ORDER DOES NOT HAVE TAX INCLUDED LINES           */
   if l_ord_contains_tax_in_lines = no
   then
      assign
         disc_amt = (- line_total * (so_disc_pct / 100))
         l_roundedDiscAmt = disc_amt.

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_roundedDiscAmt,
        input rndmthd,
        output mc-error-number)"}

   if mc-error-number <> 0
   then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end. /* IF mc-error-number <> 0 */

   if addtax
   then do:
      {us/bbi/gprun.i ""txtotal.p""
         "(input  tax_tr_type,
           input  ref,
           input  nbr,
           input  tax_lines, /* ALL LINES */
           output tax_amt)"}

      /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
      {us/bbi/gprun.i ""txtotal1.p""
         "(input  tax_tr_type,
           input  ref,
           input  nbr,
           input  tax_lines,      /* ALL LINES */
           output l_tax_in)"}
   end. /* IF addtax */
   else
      assign
         tax_amt    = 0
         l_tax_in   = 0.

   /* WHEN TAX DETAIL RECORDS ARE NOT AVAILABLE AND SO IS */
   /* TAXABLE THEN USE THE PROCEDURE TO CALCULATE ORDER   */
   /* TOTAL AND DISCOUNT                                  */
   /*                                                     */
   /* WHEN TAX INCLUDED IS YES, ORDER DISCOUNT SHOULD BE */
   /* CALCULATED ON THE ORDER TOTAL AFTER REDUCING THE   */
   /* ORDER TOTAL BY THE INCLUDED TAX                    */

   if (l_tax_in <> 0
      or (l_ord_contains_tax_in_lines
          and (not can-find (tx2d_det
                                where tx2d_domain = global_domain
                                and   tx2d_ref = so_nbr
                                and   tx2d_nbr = so_inv_nbr))))
   then do:

      {us/bbi/gprun.i ""txabsrb.p""
         "(input so_nbr,
           input ' ',
           input '13',
           input-output line_total,
           input-output taxable_amt)"}
      l_tmp_line_total = taxable_amt + nontaxable_amt .

      line_total = l_tmp_line_total * (100 / (100 - so_disc_pct)) .

      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output line_total,
	   input        rndmthd,
	   output       mc-error-number)"}
	    
      assign
         disc_amt   = ( - line_total * (so_disc_pct / 100))
         l_roundedDiscAmt = disc_amt.

      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output l_roundedDiscAmt,
              input  rndmthd,
              output mc-error-number)"}

      if mc-error-number <> 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */
   end. /* IF l_tax_in <> 0 ... */

   /* ADD TRAILER AMOUNTS */
   {us/tx/txtrltrl.i so_trl1_cd so_trl1_amt user_desc[1] so_tax_env}
   {us/tx/txtrltrl.i so_trl2_cd so_trl2_amt user_desc[2] so_tax_env}
   {us/tx/txtrltrl.i so_trl3_cd so_trl3_amt user_desc[3] so_tax_env}

   assign
      tax_amt     = tax_amt + l_tax_in
      ord_amt     = line_total + l_roundedDiscAmt + so_trl1_amt
                  + so_trl2_amt + so_trl3_amt + tax_amt.

   if ord_amt < 0
   then
      invcrdt = "**" + getTermLabel("C_R_E_D_I_T",11) + "**".
   else
      invcrdt = "".

END PROCEDURE. /* p_calc */

PROCEDURE getExtendedAmount:
/* THIS PROCEDURE RETURNS LINE TOTAL, LINE TOTAL IS RE-CALCULATED  */
/* AFTER SUBTRACTING INCLUDED TAX                                  */

/* INPUT PARAMETERS                                                */
/* p_rndmthd      - CURRENCY ROUNDING METHOD                       */
/* p_line         - ORDER LINE FOR SALES ORDER, SALES QUOTE ETC.   */
/* p_tx2d_ref     - SALES ORDER NUMBER IF IT IS CALLED BY SALES    */
/*                  ORDER FUNCTIONS                                */
/*                  SALES QUOTE NUMBER IF IT IS CALLED BY SALES    */
/*                  QUOTE FUNCTIONS                                */
/*                  INVOICE NUMBER IF IT IS CALLED BY INVOICE      */
/*                  FUNCTIONS                                      */
/* p_tx2d_nbr     - SALES QUOTE NUMBER OR INVOICE NUMBER IF        */
/*                  IT IS CALLED BY SALES ORDER FUNCTIONS          */
/*                  BLANK IF IT IS CALLED BY SALES QUOTE FUNCTIONS */
/*                  SALES ORDER NUMBER IF IT IS CALLED BY INVOICE  */
/*                  FUNCTIONS                                      */
/* p_tax_tr_type  - TAX TRANSACTION TYPE                           */
/*                                                                 */
/* INPUT-OUTPUT PARAMETER                                          */
/* p_ext_actual   - LINE TOTAL                                     */

   define input        parameter p_rndmthd          like rnd_rnd_mthd  no-undo.
   define input        parameter p_line             like sod_line      no-undo.
   define input        parameter p_tx2d_ref         like so_nbr        no-undo.
   define input        parameter p_tx2d_nbr         like so_inv_nbr    no-undo.
   define input        parameter p_tax_tr_type      like tx2d_tr_type  no-undo.
   define input-output parameter p_ext_actual       like sod_price     no-undo.

   define variable mc-error-number like msg_nbr no-undo.

   define variable l_ext_actual  like sod_price initial 0 no-undo.
   define variable l_ext_actual1 like sod_price initial 0 no-undo.

   l_ext_actual = p_ext_actual.

   for each tx2d_det
      where tx2d_domain   = global_domain
      and   tx2d_ref     = p_tx2d_ref
      and  (tx2d_nbr     = ""
         or tx2d_nbr  = p_tx2d_ref
         or tx2d_nbr  = p_tx2d_nbr)
      and  tx2d_line    = p_line
      and  tx2d_tr_type = p_tax_tr_type
      and  tx2d_tax_in  = yes
   no-lock :

      l_ext_actual1 = l_ext_actual1 +
                      (tx2d_cur_tax_amt + tx2d_cur_abs_ret_amt)  .

   end. /* FOR EACH tx2d_det ... */

   for each tx2d_det
      where tx2d_domain  = global_domain
      and   tx2d_ref     = p_tx2d_nbr
      and  (tx2d_nbr     = ""
         or tx2d_nbr     = p_tx2d_ref
         or tx2d_nbr     = p_tx2d_nbr)
      and   tx2d_line    = p_line
      and   tx2d_tr_type = p_tax_tr_type
      and   tx2d_tax_in  = yes
   no-lock :
      l_ext_actual1 = l_ext_actual1 +
                      (tx2d_cur_tax_amt + tx2d_cur_abs_ret_amt)  .
   end. /* FOR EACH tx2d_det ... */



   p_ext_actual = l_ext_actual - l_ext_actual1.

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output p_ext_actual,
        input        p_rndmthd,
        output       mc-error-number)"}

   if mc-error-number <> 0
   then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end. /* IF mc-error-number <> 0 */

END PROCEDURE. /* getExtendedAmount */
