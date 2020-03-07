/* xysosomt1.p - SALES ORDER MAINTENANCE                                      */
/* xxsosomt1.p - SALES ORDER MAINTENANCE                                      */
/* sosomt1.p - SALES ORDER MAINTENANCE                                        */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xysosomt1.p,v 1.2 2018/03/13 17:10:02 gbg Exp $: */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: *F0PN* dzn                */
/* REVISION: 8.5      LAST MODIFIED: 08/25/95   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/09/96   BY: *J034* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/09/96   BY: *J042* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/09/96   BY: *J053* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/17/96   BY: *J0HR* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/19/96   BY: *J0JW* gwm                */
/* REVISION: 8.5      LAST MODIFIED: 04/26/96   BY: *J0KJ* DAH                */
/* REVISION: 8.5      LAST MODIFIED: 05/14/96   BY: *J0M3* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 07/10/96   BY: *J0YH* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 07/29/96   BY: *J12Q* Andy Wasilczuk     */
/* REVISION: 8.6      LAST MODIFIED: 09/27/96   BY: *K007* svs                */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Elke Van Maele     */
/* REVISION: 8.6      LAST MODIFIED: 11/05/96   BY: *K01T* Stephane Collard   */
/* REVISION: 8.6      LAST MODIFIED: 05/07/97   BY: *J1P5* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 06/06/97   BY: *K0CZ* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 07/11/97   BY: *K0DH* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 08/06/97   BY: *J1YG* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 09/23/97   BY: *K0HB* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 11/18/97   BY: *J25B* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 11/18/97   BY: *K1BG* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 12/01/97   BY: *K1BN* Bryan Merich       */
/* REVISION: 8.6      LAST MODIFIED: 01/31/98   BY: *J2D6* Seema Varma        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* Ed van de Gevel    */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 11/24/98   BY: *M017* David Morris       */
/* REVISION: 9.0      LAST MODIFIED: 02/24/99   BY: *M094* Jean Miller        */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/06/99   BY: *L0J4* Satish Chavan      */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 04/25/00   BY: *N0CG* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 06/14/00   BY: *L0Y4* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 07/03/00   BY: *N0DX* Rajinder Kamra     */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 11/19/00   BY: *M0WC* Rajesh Thomas      */
/* REVISION: 9.1      LAST MODIFIED: 12/18/00   BY: *M0TZ* Veena Lad          */
/* REVISION: 9.1      LAST MODIFIED: 10/16/00   BY: *N0WB* BalbeerS Rajput    */
/* Revision: 1.35         BY: Katie Hilbert       DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.36         BY: Sachin Shinde       DATE: 06/26/01  ECO: *M1C2* */
/* Revision: 1.37         BY: Ellen Borden        DATE: 02/27/01  ECO: *P007* */
/* Revision: 1.38         BY: Jean Miller         DATE: 08/08/01  ECO: *M11Z* */
/* Revision: 1.39         BY: Russ Witt           DATE: 09/21/01  ECO: *P01H* */
/* Revision: 1.40         BY: Ashwini Ghaisas     DATE: 01/10/02  ECO: *L194* */
/* Revision: 1.41         BY: Santhosh Nair       DATE: 03/05/02  ECO: *M1H1* */
/* Revision: 1.42         BY: Ashish Maheshwari   DATE: 05/14/02  ECO: *P06M* */
/* Revision: 1.43         BY: Ashish Maheshwari   DATE: 05/20/02  ECO: *P04J* */
/* Revision: 1.45         BY: Samir Bavkar        DATE: 04/29/02  ECO: *P042* */
/* Revision: 1.47         BY: Robin McCarthy      DATE: 07/03/02  ECO: *P08Q* */
/* Revision: 1.48         BY: Samir Bavkar        DATE: 07/07/02  ECO: *P0B0* */
/* Revision: 1.49         BY: Robin McCarthy      DATE: 07/15/02  ECO: *P0BJ* */
/* Revision: 1.51         BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.52         BY: Ashish Maheshwari   DATE: 09/03/03  ECO: *N2KT* */
/* Revision: 1.55         BY: Rajaneesh S.        DATE: 10/07/03  ECO: *P15F* */
/* Revision: 1.56         BY: Ken Casey           DATE: 02/19/04  ECO: *N2GM* */
/* Revision: 1.59         BY: Jean Miller         DATE: 02/23/04  ECO: *Q063* */
/* Revision: 1.60         BY: Jean Miller         DATE: 02/23/04  ECO: *Q062* */
/* Revision: 1.61         BY: Katie Hilbert       DATE: 03/02/04  ECO: *Q06B* */
/* Revision: 1.62         BY: Shivaraman V.       DATE: 04/28/04  ECO: *P1Z7* */
/* Revision: 1.63         BY: Mercy Chittilapilly DATE: 05/10/04  ECO: *P20G* */
/* Revision: 1.64         BY: Shivanand H         DATE: 05/13/04  ECO: *P1YS* */
/* Revision: 1.65         BY: Vivek Gogte         DATE: 06/09/04  ECO: *P25L* */
/* Revision: 1.66         BY: Ed van de Gevel     DATE: 06/23/04  ECO: *Q09H* */
/* Revision: 1.67         BY: Shivanand H         DATE: 06/22/04  ECO: *P25X* */
/* Revision: 1.68         BY: Paul Dreslinski     DATE: 10/15/04  ECO: *P2Q4* */
/* Revision: 1.69         BY: Jean Miller         DATE: 12/08/04  ECO: *P2RY* */
/* Revision: 1.70         BY: Ed van de Gevel     DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.72         BY: Ed van de Gevel     DATE: 03/07/05  ECO: *R00K* */
/* Revision: 1.75         BY: Ken Casey           DATE: 02/22/05  ECO: *P38T* */
/* Revision: 1.77         BY: Nishit V            DATE: 05/19/05  ECO: *P3LY* */
/* Revision: 1.78         BY: Anitha Gopal        DATE: 06/26/05  ECO: *P3Q7* */
/* Revision: 1.79         BY: Paul Dreslinski     DATE: 08/15/05  ECO: *Q0KY* */
/* Revision: 1.80         BY: Shilpa Kamath       DATE: 11/03/05  ECO: *R02B* */
/* Revision: 1.81         BY: Shivaraman V.       DATE: 11/21/05  ECO: *P484* */
/* Revision: 1.82         BY: Shivganesh Hegde    DATE: 02/03/05  ECO: *P4H6* */
/* Revision: 1.83         BY: Tejasvi Kulkarni    DATE: 07/21/06  ECO: *P4MJ* */
/* Revision: 1.84         BY: Austin Xie          DATE: 03/30/06  ECO: *R084* */
/* Revision: 1.85         BY: Masroor Alam        DATE: 09/29/06  ECO: *P4XK* */
/* Revision: 1.91         BY: Arun Kumar          DATE: 01/10/07  ECO: *R0C6* */
/* Revision: 1.92         BY: Chi Liu             DATE: 12/12/07  ECO: *P6BR* */
/* Revision: 1.95         BY: Vivek Kamath        DATE: 01/14/08  ECO: *P6JP* */
/* Revision: 1.96         BY: Vivek Kamath        DATE: 02/20/08  ECO: *P6M2* */
/* Revision: 1.99         BY: Jean Miller         DATE: 06/15/08  ECO: *R0TC* */
/* Revision: 1.101        BY: Jean Miller         DATE: 08/12/08  ECO: *P4RW* */
/* Revision: 1.102        BY: Chi Liu             DATE: 01/19/09  ECO: *Q22F* */
/* Revision: 1.103        BY: Trupti Khairnar     DATE: 07/10/09  ECO: *Q30C* */
/* Revision: 1.104        BY: Prabu M             DATE: 08/31/09  ECO: *Q39L* */
/* Revision: 1.105        BY: Robert Jensen       DATE: 10/05/09  ECO: *Q3GV* */
/* $Revision: 1.2 $     BY: Katie Hilbert       DATE: 10/05/09  ECO: *Q3RL* */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB    LAST MODIFIED: 19-JUL-2010    BY:  nac *q9021*cy1022*              */
/* CYB    LAST MODIFIED: 29-Apr-2011    BY:  nac *q9021*cy1042*              */
/* CYB    LAST MODIFIED: 19-JUL-2010    BY:  nac *q9021*cy1022z*             */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*!
 *  Sosomt1.p performs the 'driver' function for Sales Order and RMA
 *  Maintenance.  These two functions were previously handled by sosomt.p
 *  and fsrmamt.p.  This program was originally copied from sosomt.p.
*/

/* DISPLAY TITLE */
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}    /* EXTERNAL LABEL INCLUDE */
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/la/laapmtdf.i}

&SCOPED-DEFINE QXO-EVENT SalesOrderMaintenance
&SCOPED-DEFINE QXO-TABLE so_mstr
{us/qx/qxodef.i}

define input parameter         this-is-rma     as logical.

define new shared variable lDomSwthBlocked as logical no-undo.

define new shared variable line          like sod_line.
define new shared variable del-yn        like mfc_logical.
define new shared variable qty_req       like in_qty_req.
define new shared variable prev_due      like sod_due_date.
define new shared variable prev_qty_ord  like sod_qty_ord.
define new shared variable trnbr         like tr_trnbr.
define new shared variable qty           as decimal.
define new shared variable part          as character format "x(18)".
define new shared variable eff_date      as date.
define new shared variable all_days      like soc_all_days.
define new shared variable all_avail     like soc_all_avl.
define new shared variable sngl_ln       like soc_ln_fmt.
define new shared variable so_recno      as recid.
define new shared variable cm_recno      as recid.
define new shared variable comp          like ps_comp.
define new shared variable cmtindx       like cmt_indx.
define new shared variable socmmts       like soc_hcmmts label "Comments".
define new shared variable prev_abnormal like sod_abnormal.
define new shared variable promise_date  as date label "Promise Date".
define new shared variable perform_date  as date label "Perform Date".
define new shared variable base_amt      like ar_amt.
define new shared variable sod_recno     as recid.
define new shared variable consume       like sod_consume.
define new shared variable prev_consume  like sod_consume.
define new shared variable confirm       like mfc_logical initial yes
                                         label "Confirmed".
define new shared variable sotrcust      like so_cust.
define new shared variable merror        like mfc_logical initial no.
define new shared variable so-detail-all like soc_det_all.
define new shared variable new_order     like mfc_logical initial no.
define new shared variable sotax_trl     like tax_trl.
define new shared variable tax_in        like cm_tax_in.
define new shared variable rebook_lines  as logical initial no no-undo.
define new shared variable so_db         like dc_name.
define new shared variable inv_db        like dc_name.
define new shared variable mult_slspsn   like mfc_logical no-undo.
define new shared variable undo_cust     like mfc_logical.
define new shared variable freight_ok    like mfc_logical initial yes.
define new shared variable old_ft_type   like ft_type.
define new shared variable calc_fr       like mfc_logical
                                         label "Calculate Freight".
define new shared variable undo_flag     like mfc_logical.
define new shared variable disp_fr       like mfc_logical.
define new shared variable display_trail like mfc_logical initial yes.
define new shared variable soc_pc_line   like mfc_logical initial yes.
define new shared variable socrt_int     like sod_crt_int.
define new shared variable impexp_label  as character format "x(12)" no-undo.
define new shared variable impexp        like mfc_logical no-undo.
define new shared variable sonbr         like so_nbr.
define new shared variable picust        like cm_addr.
define new shared variable price_changed like mfc_logical.
define new shared variable line_pricing  like pic_so_linpri
                                         label "Line Pricing".
define new shared variable reprice       like mfc_logical label "Reprice"
                                         initial no.
define new shared variable rndmthd       like rnd_rnd_mthd.
define new shared variable oldcurr       like so_curr.
define new shared variable balance_fmt   as character.
define new shared variable limit_fmt     as character.
define new shared variable prepaid_fmt   as character no-undo.
define new shared variable prepaid_old   as character no-undo.
define new shared variable trans_conv    like sod_um_conv.
define new shared variable wk_bs_line    like pih_bonus_line no-undo.
define new shared variable wk_bs_promo   as character format "x(8)" no-undo.
define new shared variable wk_bs_listid  like pih_list_id no-undo.
define new shared variable inv_org       like cil_prev_inv  no-undo.
define new shared variable org_nbr       like cil_prev_so_nbr no-undo.
define new shared variable coverage-discount  like sod_disc_pct.
define new shared variable old_billto    like so_bill no-undo.

define variable lv_shipfrom     like so_site no-undo.
define variable comment_type    like so_lang no-undo.
define variable old_so_print_pl like so_print_pl no-undo.
define variable impexp_edit     like mfc_logical no-undo.
define variable upd_okay        like mfc_logical no-undo.
define variable batch_job       as logical no-undo.
define variable dev             as character no-undo.
define variable batch_id        as character no-undo.
define variable use-log-acctg   as logical no-undo.
define variable allaccepted     like mfc_logical no-undo.
/*cy1022*/ define shared variable cyb_so_type as char no-undo.

/* RMA-SPECIFIC VARIABLES */
define variable rma-recno       as recid  no-undo.

/* Handle for the restore on stop condition */
define variable stop_recno  as recid no-undo.

/* TEMP TABLE DEFINITIONS FOR APM/API */
{us/if/ifttcmdr.i "new"}
{us/if/ifttcmdv.i "new"}

{us/so/sobtbvar.i "new"}   /* BACK TO BACK SHARED WORKFILES AND VARIABLES */

define variable imp-okay    as logical no-undo.

/* RECORD BUFFERS */
define buffer   bill_cm     for  cm_mstr.

/* SHARED FRAMES */
define new shared frame a.
define new shared frame sotot.
define new shared frame d.

{us/pp/pppivar.i "new"}  /* PRICING VARIABLES */

/* FREIGHT ACCRUAL TEMP TABLE DEFINITION */
{us/la/lafrttmp.i "new"}

/*THIS TEMP TABLE IS CREATED TO CALCULATE FREIGHT CHARGES  */
/*WHEN A NEW SALES ORDER LINE IS ADDED TO AN EXISTING ORDER*/
/*WHEN THE FREIGHT TYPE IS "INCLUDE".                      */
define new shared temp-table l_fr_table
       field l_fr_sonbr   like sod_nbr
       field l_fr_soline  like sod_line
       field l_fr_chrg    like sod_fr_chg
       field l_sodlist_pr like sod_list_pr
       index nbrline is primary l_fr_sonbr l_fr_soline.

{us/gp/gptxcdec.i}
{us/et/etdcrvar.i "new"}
{us/et/etvar.i &new="new"}
{us/et/etrpvar.i &new="new"}

{us/et/etsotrla.i "NEW"}
{us/so/sosomt01.i}

{us/gp/gpcrfmt.i}

/*DEFINE WORKFILE FOR QTY ACCUM USED BY BEST PRICING ROUTINES*/
{us/pp/pppiwqty.i "new" }

/*CHECK IF USER IS IN VIEWER MODE */
{us/gp/gpvwckhd.i}


define new shared temp-table tt_soddet no-undo like sod_det.

assign
   lDomSwthBlocked = no.

/* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
assign
   nontax_old      = nontaxable_amt:format
   taxable_old     = taxable_amt:format
   line_tot_old    = line_total:format
   disc_old        = disc_amt:format
   trl_amt_old     = so_trl1_amt:format
   tax_amt_old     = tax_amt:format
   ord_amt_old     = ord_amt:format
   prepaid_old     = so_prepaid:format
   container_old   = container_charge_total:format
   line_charge_old = line_charge_total:format.

oldcurr = "".

for first gl_ctrl where gl_domain = global_domain
no-lock: end.

/* SET LIMIT_FMT ACCORDING TO BASE CURR ROUND METHOD*/
limit_fmt = "->>>>,>>>,>>9.99".
run gpcrfmt
   (input-output limit_fmt,
    input gl_rnd_mthd).

/* SET BALANCE_FMT ACCORDING TO BASE CURR ROUND METHOD*/
balance_fmt = "->>>>,>>>,>>9.99".
run gpcrfmt
   (input-output balance_fmt,
    input gl_rnd_mthd).

/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

do transaction on error undo, retry:       /* TRANSACTION 10 */

   for first soc_ctrl where soc_domain = global_domain
   no-lock: end.

   if not available soc_ctrl then do:
      create soc_ctrl.
      soc_domain = global_domain.
      if recid(soc_ctrl) = -1 then.
   end.

   assign
      all_days     = soc_all_days
      all_avail    = soc_all_avl
      sngl_ln      = soc_ln_fmt
      socmmts      = soc_hcmmts
      comment_type = global_type
      confirm      = soc_confirm.

   /* BATCH PROCESSING PARAMETERS */
   for first mfc_ctrl where mfc_domain = global_domain
        and mfc_field = "soc_batch"
   no-lock:
      batch_job = mfc_logical.
   end.

   for first mfc_ctrl where mfc_domain = global_domain
        and mfc_field = "soc_print_id"
   no-lock:
      dev = mfc_char.
   end.

   for first mfc_ctrl where mfc_domain = global_domain
        and mfc_field = "soc_batch_id"
   no-lock:
      batch_id = mfc_char.
   end.

   /* FOR RMA'S, VALUES USUALLY OBTAINED FROM SOC_CTRL */
   /* COME FROM RMC_CTRL.  GET SVC_CTRL ALSO - IT'LL   */
   /* BE NEEDED LATER ON...                            */
   if this-is-rma then do:

      for first rmc_ctrl where rmc_domain = global_domain
      no-lock: end.

      if not available rmc_ctrl then do:
         create rmc_ctrl.
         assign
            rmc_domain   = global_domain
            rmc_hcmmts   = soc_hcmmts
            rmc_lcmmts   = soc_lcmmts
            rmc_det_all  = soc_det_all
            rmc_all_days = soc_all_days
            rmc_edit_isb = soc_edit_isb
            rmc_history  = soc_so_hist.
         if recid(rmc_ctrl) = -1 then.
      end.

      assign
         socmmts  = rmc_hcmmts
         consume  = rmc_consume
         all_days = rmc_all_days.

   end.   /* if this-is-rma */

end. /* TRANSACTION 10 */

/* Transaction 20 */
do transaction on error undo, retry:

   /* SET UP PRICING BY LINE VALUES */
   for first mfc_ctrl where mfc_domain = global_domain
      and mfc_field = "soc_pc_line"
   no-lock:
      soc_pc_line = mfc_logical.
   end. /* FOR FIRST MFC_CTRL */

end. /* TRANSACTION 20 */

so_db = global_db.

/* Transaction 25 */
do transaction on error undo, retry:
   for first pic_ctrl where pic_domain = global_domain
   no-lock: end.
   if not available pic_ctrl then do:
      create pic_ctrl.
      pic_domain = global_domain.
      if recid(pic_ctrl) = -1 then.
   end.
end.

stopskip:
do:
   stoptrap:
   do:
      mainloop:
      repeat on stop undo, leave stoptrap:

         stop_recno = ?.

         if not this-is-rma then do:
            /* TRAILER FRAMES FOR RMA ARE HIDDED IN sosomtc.p */
            hide frame sotot no-pause.
            hide frame d no-pause.
         end. /* IF NOT THIS-IS-RMA */

         for first mfc_ctrl where mfc_domain = global_domain
            and mfc_field = "soc_batch"
          no-lock:
            batch_job = mfc_logical.
         end. /* FOR FIRST MFC_CTRL */

/*cy1020*  {us/so/sosomt02.i}  /* FORM DEFINITIONS FOR SHARED FRAMES A AND B */ */
/*cy1020*/ {us/xx/xxsosomt02.i}  /* FORM DEFINITIONS FOR SHARED FRAMES A AND B */

         assign
            cr_terms_changed = no
            tax_edit         = no.

         /* IF AN EXPLICIT TRANSACTION SURROUNDS THIS, SOC_CTRL */
         /* IS LOCKED FOR THE DURATION OF SO HEADER PROCESSING  */

         /* PROCESS SALES ORDER HEADER FRAMES */
/*cy1020*         {us/bbi/gprun.i ""sosomta1.p"" */
/*c1402* /*cy1020*/ {us/bbi/gprun.i ""xxsosomta1.p"" */
/*c1402*/ {us/bbi/gprun.i ""xysosomta1.p""
            "(input this-is-rma,
              output return_int,
              output rma-recno)"}
         if lDomSwthBlocked then return.

         if return_int = 1 then next mainloop.
         if return_int = 2 then undo mainloop, next mainloop.
         if return_int = 3 then undo mainloop, retry mainloop.
         if return_int = 4 then undo mainloop, leave.

         /* record the current salesorder no-undo */
         stop_recno = so_recno.

         /* FIND SO_MSTR NO-LOCK TO ENSURE THE USER DIDN'T DELETE */
         /* IT.  NO-LOCK ALSO PREVENTS WARNINGS RELATED TO THE    */
         /* OTHER EXPLICIT TRANSACTIONS IN THIS PROGRAM.          */
         for first so_mstr where recid(so_mstr) = so_recno
         no-lock: end.

         if not available so_mstr then undo mainloop, leave mainloop.

         /* During line-item entry/edit, the printing of packing list is
            disabled */
         do transaction:

            for first so_mstr where recid(so_mstr) = so_recno exclusive-lock:
            end.
            assign
               old_so_print_pl = so_print_pl
               so_print_pl     = false.

         end. /* transaction */

         /* CHECK FOR A CHANGE TO THE CREDIT STATUS */
         if soc_use_btb
            and so_primary
         then do:
            /* PROCESS THE SO MASTER TO CREATE NEW EMT PO */
            {us/gp/gprunp.i "soemttrg" "p" "process-order-header"
               "(input new_order,
             input so_nbr,
             output return-msg)" }

            if return-msg <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=return-msg &ERRORLEVEL=4}
               return-msg = 0.
               if not batchrun then pause.
               undo mainloop, retry mainloop.
            end. /* IF return-msg <> 0 */

         end. /* IF soc_use_btb ... */


         /* LINE ITEMS */

         line_loop:
         do on endkey undo ,retry:

            /* SOSOMTA.P'S THIRD INPUT PARAMETER IS USED BY RMA'S ONLY.   */
            /* YES INDICATES THAT RMA ISSUE LINES ARE BEING PROCESSED.    */
            /* FOR RMA'S, WE'LL CALL SOSOMTA.P TWICE - FIRST FOR ISSUES   */
            /* THEN FOR RMA RECEIPT LINES.                                */

            /* Identify context for QXtend */
            {us/gp/gpcontxt.i
               &STACKFRAG = 'sosomta,sosomt1,fsrmamt'
               &FRAME = 'c' &CONTEXT = 'ISS'}

/*cy1022*    {us/bbi/gprun.i ""sosomta.p"" */
/*cy1042*  /*cy1022*/           {us/bbi/gprun.i ""xxsosomta.p"" */
/*cy1042*/   {us/bbi/gprun.i ""xysosomta.p""
               "(input this-is-rma,
                 input rma-recno,
                 input yes)"}

            if lDomSwthBlocked then return.

            /* Clear context for QXtend */
            {us/gp/gpcontxt.i
               &STACKFRAG = 'sosomta,sosomt1,fsrmamt'
               &FRAME = 'c'}

            if this-is-rma then do:

               /* Identify context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = '*sosomta,sosomt1,fsrmamt*'
                  &FRAME =
                   'a,c,c_site,d,rmd-prodline,j,h,set_comm,set_tax,line_pop'
                  &CONTEXT = 'REC'}

               /* FOR RMA'S, WE CREATED OUR ISSUE LINES (THE PARTS WE'LL BE   */
               /* SENDING OUT TO CUSTOMERS).  NOW, CREATE THE RECEIPT LINES   */
               /* (THE PARTS THEY'RE RETURNING TO US).                        */
               {us/bbi/gprun.i ""sosomta.p""
                  "(input this-is-rma,
                    input rma-recno,
                    input no)"}

               /* Clear context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = '*sosomta,sosomt1,fsrmamt*'
                  &FRAME =
                   'a,c,c_site,d,rmd-prodline,j,h,set_comm,set_tax,line_pop'}

            end.    /* if this-is-rma */

            if can-find (cil_mstr where cil_domain = global_domain
                         and cil_cor_so_nbr = so_nbr) = no
            then do:
               /* Reprice after Line processing */
               {us/bbi/gprun.i ""sosoprc.p""
                  "(input so_recno,
                    input reprice,
                    input new_order,
                    input line_pricing)" }
            end.

            /*Show the items which line quantity below min order qty*/
            if new_order and line_pricing = no and this-is-rma = no
            then do:
               {us/bbi/gprun.i ""sorcmt.p""  "(input so_nbr,output allaccepted)"}
               if not allaccepted then
                  undo line_loop, retry line_loop.
            end.

         end. /* lineloop */

         /* SET CREDIT & FREIGHT TERMS FIELDS */
         do transaction:
            /* SUPPRESS THIS CODE IF INVOKED IN VIEWER MODE */
            if not isViewer and current_cr_terms <> "" and
               current_cr_terms <> so_cr_terms
            then
               assign
                  cr_terms_changed = yes
                  so_cr_terms = current_cr_terms.

            /* SUPPRESS THIS CODE IF INVOKED IN VIEWER MODE */
            if not isViewer and current_fr_terms <> ""
               and so_manual_fr_terms = no
            then
               so_fr_terms = current_fr_terms.

            assign
               current_cr_terms = ""
               current_fr_terms = ""
               so_print_pl   =  old_so_print_pl
               stop_recno = ?. /* Disable special stop processing here */

         end.

         view frame a.
         display so_ship with frame a.

         /* IF LOGISTICS ACCOUNTING IS ENABLED AND VALID FREIGHT TERMS/LIST */
         /* IS ENTERED DISPLAY THE LOGISTICS CHARGE DETAIL FRAME WHICH      */
         /* DISPLAYS THE DEFAULT LOGISTICS SUPPLIER FOR THIS ORDER WHICH CAN*/
         /* BE UPDATED IN THIS FRAME. NOTE: A CORRESPONDING lacd_det RECORD */
         /* IS CREATED AND THIS LOGISTICS SUPPLIER IS STORED THERE.         */
         if use-log-acctg and
            so_fr_terms <> "" and
            (can-find(first sod_det where sod_domain = global_domain and
                                          sod_nbr = so_nbr and
                                          sod_fr_list <> "" and
                                          sod_compl_stat = ""))
         then do transaction on error undo, retry:

            for first ft_mstr where ft_domain = global_domain
               and ft_terms = so_fr_terms
            no-lock: end.

            if available ft_mstr
               and (ft_accrual_level = {&LEVEL_Shipment}
                    or ft_accrual_level = {&LEVEL_Line})
            then do:

               lv_shipfrom = "".

               for first sod_det where sod_domain = global_domain
                  and sod_nbr = so_nbr
                  and sod_compl_stat = ""
                  no-lock:
                  lv_shipfrom = sod_site.
               end.

               if ft_accrual_level = {&LEVEL_Shipment} and so_site <> "" then
                  lv_shipfrom = so_site.

               if not isViewer and calc_fr = yes then do:
                  {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                              &param  = """(input 'DELETE',
                                            input '{&TYPE_SO}',
                                            input so_nbr,
                                            input lv_shipfrom,
                                            input ft_lc_charge,
                                            input ft_accrual_level,
                                            input yes,
                                            input yes)"""}
               end.
               /* DISPLAY LOGISTICS CHARGE DETAIL */
               {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                           &param  = """(input 'ADD',
                                         input '{&TYPE_SO}',
                                         input so_nbr,
                                         input lv_shipfrom,
                                         input ft_lc_charge,
                                         input ft_accrual_level,
                                         input yes,
                                         input yes)"""}

               if use-log-acctg = yes and
                  can-find(first lacd_det no-lock where 
                     lacd_domain = global_domain and
                     lacd_internal_ref      = so_nbr     and
                     lacd_shipfrom          = lv_shipfrom and
                     lacd_internal_ref_type = {&TYPE_SO} and
                     lacd_apportion_method <> {&APPORTION_TYPE_COST}) then do:

                  {us/bbi/gprun.i ""lacamts.p""
                     "(input global_domain,
                       input '',
                       input so_nbr,
                       input '{&TYPE_SO}',
                       input lv_shipfrom)"}.

               end.
            end. /* IF AVAILABLE FT_MSTR AND ... */

         end.   /* TRANSACTION */

         do transaction on error undo, retry:

            /* INITIALIZE TRAILER CODES FROM CONTROL FILE FOR NEW ORDERS ONLY */
            if can-find (cil_mstr where cil_domain = global_domain
                         and cil_cor_so_nbr = so_nbr) = no
            then do:
               {us/gp/gpgettrl.i &hdr_file="so" &ctrl_file="soc"}
            end.

            /* FOR A VALID fr_list ENTERED IN SO HEADER, WHICH IS NOT A  */
            /* DEFAULT IN SALES ORDER CONTROL FILE, TRAILER CODE 1 IS    */
            /* UPDATED WITH TRAILER CODE OF THE FREIGHT LIST.            */
            if new_order
               and soc_use_frt_trl_cd
            then do:

               for first fr_mstr where fr_domain = global_domain
                    and fr_list = so_fr_list
                    and fr_site = so_site
                    and fr_curr = so_curr
               no-lock:
                  so_trl1_cd = fr_trl_cd.
               end. /* FOR FIRST fr_mstr */

            end. /* IF new-order and ... */

            /* CALCULATE FREIGHT */
            if calc_fr and so_fr_terms = "" then do:
               /* INVALID FREIGHT TERMS */
               {us/bbi/pxmsg.i &MSGNUM=671 &ERRORLEVEL=2 &MSGARG1=so_fr_terms}
            end. /* IF CALC_FR AND SO_FR_TERMS */

            /* SUPPRESS THIS CODE IF INVOKED IN VIEWER MODE */
            if not isViewer and calc_fr and so_fr_terms <> "" then do:
               {us/bbi/gprun.i ""sofrcalc.p""}

               if use-log-acctg then do:
                  /* CREATE TAX RECORDS FOR FREIGHT ACCRUAL */
                  {us/gp/gprunmo.i  &module = "LA" &program = "lafrtax.p"
                              &param  =
                                 """(input so_site,
                                     input '{&TYPE_SO}',
                                     input (if so_tax_date <> ? then
                                                so_tax_date
                                             else if so_due_date <> ? then
                                                so_due_date
                                             else so_ord_date),
                                     input (if so_due_date <> ? then
                                               so_due_date
                                            else so_ord_date),
                                     input so_curr,
                                     input so_ex_rate,
                                     input so_ex_rate2,
                                     input ' ',  /* BLANK PVO_EX_RATETYPE */
                                     input so_exru_seq,
                                     input this-is-rma)"""}
               end.
            end.
            
            if use-log-acctg = yes and
               can-find(first lacd_det no-lock where 
                  lacd_domain = global_domain and
                  lacd_internal_ref      = so_nbr     and
                  lacd_shipfrom          = lv_shipfrom and
                  lacd_internal_ref_type = {&TYPE_SO} and
                  lacd_apportion_method = {&APPORTION_TYPE_COST} ) then do:

                  {us/bbi/gprun.i ""lacamts.p""
                                  "(input global_domain,
                                    input '',
                                    input so_nbr,
                                    input '{&TYPE_SO}',
                                    input lv_shipfrom)"}.

            end. /*if use-log-acctg = yes and */

         end.   /* TRANSACTION */

         /* TRAILER */
         for first bill_cm
            where bill_cm.cm_domain = global_domain
              and bill_cm.cm_addr = so_bill
         no-lock: end.

         cm_recno = recid(bill_cm).

         /* Maintain Trailer Section */
/*cy1020*         {us/bbi/gprun.i ""sosomtc.p"" "(input this-is-rma)"} */
/*cy1020*/        {us/bbi/gprun.i ""xxsosomtc.p"" "(input this-is-rma)"}

         /* CHECK FOR A CHANGE TO THE CREDIT STATUS */
         if soc_use_btb
            and so_primary
         then do:
            /* PROCESS THE SO MASTER TO CREATE NEW EMT PO */
            {us/gp/gprunp.i "soemttrg" "p" "process-order-header"
               "(input new_order,
             input so_nbr,
             output return-msg)" }

            if return-msg <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=return-msg &ERRORLEVEL=4}
               return-msg = 0.
               if not batchrun then pause.
               undo mainloop, retry mainloop.
            end. /* IF return-msg <> 0 */

         end. /* IF soc_use_btb ... */

         {us/gp/gpdelp.i "soemttrg" "p"}

         for first mfc_ctrl where mfc_domain = global_domain
            and mfc_field = "soc_act_stat"
            and (mfc_char = so_stat or mfc_char = "")
         no-lock:
         end. /* FOR FIRST mfc_ctrl ... */

         for each wkf-btb
            where w-msg-type <> ""
            break by w-po-nbr by w-msg-type:

            if first-of(w-po-nbr)
               and can-find(po_mstr
                               where po_domain = global_domain
                               and   po_nbr    = w-po-nbr)
            then do:

               for first po_mstr
                   where po_domain = global_domain
                   and   po_nbr    = w-po-nbr
               exclusive-lock:

                  assign
                     po_so_hold = if available mfc_ctrl
                                     and so_stat <> ""
                                     and bill_cm.cm_btb_cr
                                  then
                                     yes
                                  else
                                     no.

                  for first sod_det where sod_domain = global_domain
                     and sod_nbr    = w-so-nbr
                     and sod_line   = w-sod-line
                     and sod_compl_stat = ""
                  no-lock: end.

                  if available sod_det
                     and sod_det.sod_btb_type = "03"
                  then
                     po_shipvia = so_shipvia.

                  else do:

                     for first vd_mstr where vd_domain = global_domain
                        and vd_addr   = po_vend
                     no-lock: end.

                     if available vd_mstr then
                        po_shipvia = vd_shipvia.

                  end. /* IF NOT AVAILABLE sod_det  */

                  po_fob     = so_fob.

               end. /* FOR FIRST po_mstr */

               for first po_mstr where po_domain = global_domain
                  and po_nbr    = w-po-nbr
               no-lock: end.

            end. /* IF FIRST-OF */

            assign
               doc-type = "PO"
               doc-ref  = w-po-nbr
               add-ref  = ""
               msg-type = w-msg-type
               trq-id   = 0.

            {us/bbi/gprun.i ""gpquedoc.p""
               "(input-output doc-type,
                 input-output doc-ref,
                 input-output add-ref,
                 input-output msg-type,
                 input-output trq-id,
                 input no)"}

         end. /* FOR EACH wkf-btb */

         {us/so/sofsemt.i}

         /* MAKE SURE THIS IS NOT AN ELSE - CAN HAVE SITUATION WHERE ORDER
          * IS PRIMARY AND SECONDARY - THEREFORE IT CAN NOT BE ONE OR THE
          * EITHER MUST CHECK BOTH */
         if so_secondary
         then do:

            for first wkf-btb
               where w-msg-type <> ""
               and   w-msg-type <> "ORDERS"
               and   w-msg-type <> "ORDCHG"
            exclusive-lock: end.

            if available wkf-btb
            then do:

               assign
                  doc-type = "SO"
                  doc-ref  = w-so-nbr
                  add-ref  = ""
                  msg-type = w-msg-type
                  trq-id   = 0.

               /* QUEUE DOCUMENT FOR TRANSMISSION - EMT */
               {us/bbi/gprun.i ""gpquedoc.p""
                  "(input-output doc-type,
                    input-output doc-ref,
                    input-output add-ref,
                    input-output msg-type,
                    input-output trq-id,
                    input yes)"}

            end.  /* AVAIL WKF-BTB AND INVOICE METHOD = EDI */

            if available wkf-btb then delete wkf-btb.

         end. /* SECONDARY SO */

         hide frame d.

         /* IF IMPORT EXPORT FLAG IS SET TO YES CALL THE IMPORT EXPORT   */
         /* CREATE ROUTINE TO CREATE ie_mstr ied_det AND UPDATE  ie_mstr */

         if impexp then do:
            imp-okay = no.
            {us/bbi/gprun.i ""iemstrcr.p"" "(input ""1"",
              input so_nbr,
              input recid(so_mstr),
              input-output imp-okay )"}
         end.


         /* IMPORT EXPORT FLAG IS SET TO YES CALL THE IMPORT EXPORT DETAIL */
         /* LINE MAINTENANCE PROGRAM FOR USER TO UPDATE ied_det            */

         if not batchrun and impexp then do:

            impexp_edit = no.

            /* VIEW EDIT IMPORT EXPORT DATA ? */
            {us/bbi/pxmsg.i &MSGNUM=271 &ERRORLEVEL=1 &CONFIRM=impexp_edit}

            if impexp_edit then do:
               hide frame sotot no-pause.
               hide frame d no-pause.
               upd_okay = no.
               {us/bbi/gprun.i ""iedmta.p""
                  "(input ""1"",
                    input so_nbr,
                    input-output upd_okay )" }
            end.
         end.    /* if not batchrun and impexp */

         if not this-is-rma then do:
            /* TRAILER FRAMES FOR RMA ARE HIDDED IN sosomtc.p */
            hide frame sotot no-pause.
            hide frame d no-pause.
         end. /* IF NOT THIS-IS-RMA */

         /* FOR RMA'S, THE ADDITIONAL TRAILER ROUTINE WILL OPTIONALLY   */
         /* REDISPLAY THE RMA LINES, AND ALLOWS THE USER TO SHIP AND    */
         /* RECEIVE RMA LINES FROM RMA MAINTENANCE.                     */
         if this-is-rma then do:
            {us/bbi/gprun.i ""fsrmamtu.p"" "(input rma-recno)"}
         end.

         global_type = comment_type.

         /* Batch checking for SO processing*/
         for first sod_det where sod_domain = global_domain
            and sod_nbr = so_nbr
            and not sod_confirm
            and sod_compl_stat = ""
         no-lock: end.

         /* SUPPRESS THIS CODE IF INVOKED IN VIEWER MODE */
         if not isViewer and batch_job and available sod_det then do:
            {us/bbi/gprun.i ""sobatch.p""
               "(input so_nbr,
                 input-output batch_job,
                 input-output dev,
                 input-output batch_id)"}
         end.

         /* RECORD QXTEND OUTBOUND EVENT. */
         run fireOutboundEvent (input '{&QXO-EVENT}',
                                input '{&QXO-TABLE}',
                                input rowid({&QXO-TABLE}),
                                input oid_{&QXO-TABLE},
                                input 'WRITE').

      end. /* mainloop */

      leave stopskip. /* Bypass stop processing */
   end. /*stoptrap*/

   /* This code should only be executed if STOP occured */
   /* in the mainloop */
   if old_so_print_pl <> ? and stop_recno <> ? then
      run revertSOPrintPL.
   /* Rethrow the STOP */
   STOP.

end. /*stopskip*/

{us/gp/gpdelp.i "soemttrg" "p"}

status input.

PROCEDURE revertSOPrintPL:
   define buffer so_mstr for so_mstr.
   do transaction:
      find first so_mstr where recid(so_mstr) = stop_recno
      exclusive-lock no-wait.
      if available so_mstr then
         so_print_pl = old_so_print_pl.
      release so_mstr no-error.
   end.

END PROCEDURE.
