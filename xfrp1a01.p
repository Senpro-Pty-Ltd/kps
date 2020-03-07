/* xfrp1a01.p - SALES ORDER INVOICE PRINT - LINE DISPLAY AND SUBTOTAL        */
/* sorp1a01.p - SALES ORDER INVOICE PRINT - LINE DISPLAY AND SUBTOTAL        */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrp1a01.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 08/31/92   BY: afs *G047*               */
/* REVISION: 7.3      LAST MODIFIED: 11/12/92   BY: tjs *G191*               */
/* REVISION: 7.4      LAST MODIFIED: 07/30/93   BY: jjs *H050*               */
/* REVISION: 7.4      LAST MODIFIED: 08/19/93   BY: pcd *H009*               */
/* REVISION: 7.4      LAST MODIFIED: 09/30/93   BY: WUG *H145*               */
/* REVISION: 7.4      LAST MODIFIED: 05/03/94   BY: cdt *FN91*               */
/* REVISION: 7.3      LAST MODIFIED: 06/22/94   BY: WUG *GK60*               */
/* REVISION: 7.4      LAST MODIFIED: 11/17/94   BY: rxm *FT54*               */
/* REVISION: 7.4      LAST MODIFIED: 11/18/94   BY: smp *FT80*               */
/* REVISION: 7.4      LAST MODIFIED: 01/14/94   BY: bcm *G0C4*               */
/* REVISION: 7.4      LAST MODIFIED: 04/27/95   BY: rxm *F0PD*               */
/* REVISION: 8.5      LAST MODIFIED: 03/20/95   BY: nte *J042*               */
/* REVISION: 8.5      LAST MODIFIED: 10/05/95   BY: srk *J08B*               */
/* REVISION: 8.5      LAST MODIFIED: 07/25/95   BY: taf *J053*               */
/* REVISION: 8.5      LAST MODIFIED: 04/10/96   BY: *J04C* Sue Poland        */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: *J0T0* Dennis Hensen     */
/* REVISION: 8.5      LAST MODIFIED: 06/26/96   BY: *J0WF* Sue Poland        */
/* REVISION: 8.5      LAST MODIFIED: 08/13/96   BY: *G29K* Markus Barone     */
/* REVISION: 8.5      LAST MODIFIED: 10/03/96   BY: *J15C* Markus Barone     */
/* REVISION: 8.5      LAST MODIFIED: 01/17/97   BY: *G2H2* Vinay Nayak-Sujir */
/* REVISION: 8.5      LAST MODIFIED: 04/14/97   BY: *J1N0* Ajit Deodhar      */
/* REVISION: 8.6      LAST MODIFIED: 12/09/97   BY: *K1DL* Suresh Nayak      */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane         */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* Adam Harris       */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* Old ECO marker removed, but no ECO header exists *F191*                   */
/* Old ECO marker removed, but no ECO header exists *F277*                   */
/* Old ECO marker removed, but no ECO header exists *F369*                   */
/* Old ECO marker removed, but no ECO header exists *F378*                   */
/* REVISION: 8.6E     LAST MODIFIED: 06/29/98   BY: *L024* Sami Kureishy     */
/* REVISION: 8.6E     LAST MODIFIED: 08/13/98   BY: *J2S3* Dana Tunstall     */
/* REVISION: 8.6E     LAST MODIFIED: 02/01/99   BY: *L0D5* Robin McCarthy    */
/* REVISION: 8.6E     LAST MODIFIED: 02/17/99   BY: *K1ZK* Reetu Kapoor      */
/* REVISION: 9.1      LAST MODIFIED: 06/01/99   BY: *J3F3* Satish Chavan     */
/* REVISION: 9.1      LAST MODIFIED: 09/01/99   BY: *N004* Steve Nugent      */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 05/17/00   BY: *N0BC* Arul Victoria     */
/* REVISION: 9.1      LAST MODIFIED: 07/01/00   BY: *N0DX* BalbeerS Rajput   */
/* REVISION: 9.1      LAST MODIFIED: 07/10/00   BY: *N0FD* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb               */
/* Old ECO marker removed, but no ECO header exists *F0PN*                   */
/* Revision: 1.23.1.13       BY: Katie Hilbert   DATE: 04/01/01  ECO: *P002*  */
/* Revision: 1.23.1.16       BY: Steve Nugent    DATE: 07/09/01  ECO: *P007*  */
/* Revision: 1.23.1.19       BY: Jeff Wootton    DATE: 03/13/02  ECO: *P020*  */
/* Revision: 1.23.1.20       BY: Patrick Rowan   DATE: 04/24/01  ECO: *P00G*  */
/* Revision: 1.23.1.22       BY: Katie Hilbert   DATE: 04/15/02  ECO: *P03J*  */
/* Revision: 1.23.1.23       BY: Jean Miller     DATE: 05/13/02  ECO: *P05M*  */
/* Revision: 1.23.1.24       BY: Gnanasekar      DATE: 11/12/02  ECO: *N1Y0*  */
/* Revision: 1.23.1.25       BY: Karan Motwani   DATE: 12/02/02  ECO: *N210*  */
/* Revision: 1.23.1.26       BY: Amit Chaturvedi DATE: 01/20/03  ECO: *N20Y*  */
/* Revision: 1.23.1.27       BY: Narathip W.     DATE: 05/12/03  ECO: *P0RT*  */
/* Revision: 1.23.1.29       BY: Paul Donnelly(SB) DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.23.1.30       BY: Rajinder Kamra  DATE: 06/23/03   ECO *Q003*  */
/* Revision: 1.23.1.31       BY: Gnanasekar      DATE: 08/04/03   ECO *P0V7*  */
/* Revision: 1.23.1.32       BY: Ashish Maheshwari DATE: 11/15/03 ECO *P15L*  */
/* Revision: 1.23.1.33       BY: Vinay Soman     DATE: 01/20/04   ECO *N2NZ*  */
/* Revision: 1.23.1.34       BY: Anitha Gopal    DATE: 03/23/04   ECO *Q06L*  */
/* Revision: 1.23.1.35       BY: Ajay Nair       DATE: 05/24/04   ECO *P230*  */
/* Revision: 1.23.1.36       BY: Sachin Deshmukh DATE: 09/22/04   ECO *P2LR*  */
/* Revision: 1.23.1.37       BY: Niranjan R.     DATE: 10/04/04   ECO *P2MR*  */
/* Revision: 1.23.1.38       BY: Priyank Khandare DATE: 11/28/05  ECO: *P49L* */
/* Revision: 1.23.1.39       BY: Nishit V         DATE: 02/06/06  ECO: *P4GY* */
/* Revision: 1.23.1.40       BY: Katie Hilbert    DATE: 06/08/06  ECO: *Q0LK* */
/* Revision: 1.23.1.41       BY: Vaibhav Desai    DATE: 09/19/06  ECO: *P56N* */
/* Revision: 1.23.1.42       BY: Jean Miller      DATE: 03/08/07  ECO: *R0C5* */
/* Revision: 1.23.1.43       BY: Ambrose Almeida  DATE: 05/21/08  ECO: *P6TK* */
/* Revision: 1.23.1.46       BY: Jean Miller      DATE: 06/19/08  ECO: *R0VG* */
/* Revision: 1.23.1.47       BY: Dipanshu Talwar  DATE: 06/10/09  ECO: *Q2K3* */
/* Revision: 1.23.1.49       BY: Xiaolei Meng     DATE: 07/31/09  ECO: *R1N2* */
/* Revision: 1.23.1.50       BY: Dipanshu Talwar  DATE: 10/01/09  ECO: *P552* */
/* Revision: 1.23.1.52       BY: Jean Miller      DATE: 11/23/09  ECO: *R1TW* */
/* Revision: QAD2014         BY: Amol Dudvadkar DATE: 03/16/15  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i gpumxr}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

/*grc338 add begin*/
{us/xf/xfso10u.i}    /*FT User vars*/
{us/xf/xfso10v.i}    /*FT Global Vars */
{us/xf/xfdefa.i}     /*FT Stream setup */
{us/xf/xftxtots.i}
/*grc338 add end*/

{us/et/etvar.i}
{us/et/etrpvar.i}
/*grc338 {us/et/etsotrla.i} */
{us/xf/xfsotrla.i} /*grc338*/

/* DEFINITION FOR TEMP TABLE  t_tr_hist1 */
{us/so/sotrhstb.i}

define output parameter tot_cont_charge as decimal no-undo.
define output parameter tot_line_charge as decimal no-undo.

define new shared variable qty_bo           like sod_qty_ord
                                            format "->>>>>>9.9<<<<".
define new shared variable ext_price        like sod_price
                                            label "Ext Price"
                                            format "->>>>,>>>,>>9.99".
define new shared variable so_db            like dc_name.
define new shared variable sonbr            like sod_nbr.
define new shared variable soline           like sod_line.
define new shared variable sopart           like sod_part.
define new shared variable soinv            like idh_inv_nbr no-undo.

define     shared variable rndmthd          like rnd_rnd_mthd.
define     shared variable inv_only         as logical.
define     shared variable rmaso            like mfc_logical.
define     shared variable sacontract       like mfc_logical.
define     shared variable fsremarks        as character format "x(60)".
define     shared variable print_lotserials as logical.
define     shared variable print_options    as logical.
define     shared variable ext_actual       like sod_price.
define     shared variable ext_margin       like sod_price.
define     shared variable so_recno         as recid.
define     shared variable comb_inv_nbr     like so_inv_nbr.
define     shared variable disc_prnt_label  as character.
define     shared variable call-detail      like mfc_logical
                                            label "Print Call Invoice Detail".
/* Invoice Print Settings */
{us/so/soprsets.i}

define variable jk                      as integer no-undo.
define variable desc1                   like sod_desc.
define variable desc2                   like desc1.
define variable prepaid-lbl             as character format "x(12)".
define variable po-lbl                  as character format "x(8)".
define variable po-lbl2                 as character format "x(16)".
define variable lot-lbl                 as character format "x(43)".
define variable cspart-lbl              as character format "x(15)".
define variable call-lbl                as character format "x(16)".
define variable lotserial_total         like tr_qty_chg.
define variable err_flag                as integer.
define variable restock_pct             like sv_rstk_pct no-undo.
define variable restock_amt             like rmd_restock no-undo.
define variable restock_prc             like sod_price no-undo.
define variable ext_price_fmt           as character.
define variable tmp_amt                 as decimal.
define variable billable-amt            like sod_price no-undo.
define variable display-price           like mfc_logical.
define variable pm_code                 like pt_pm_code.
define variable hdl_disc_lbl            as handle.
define variable total-billable          like sfb_price no-undo.
define variable total-covered           like sfb_price no-undo.
define variable total-price             like sfb_price no-undo.
define variable total-exchange          like sfb_price no-undo.
define variable sfb-line-count          as integer no-undo.
define variable using_seq_schedules     like mfc_logical initial no no-undo.
define variable ent_ord_bill            like so_bill     no-undo.
define variable ent_ord_ship            like so_ship     no-undo.
define variable ent_ord_nbr             like so_nbr      no-undo.
define variable ent_ord_line            like sod_line    no-undo.
define variable ent_ord_line_part       like sod_part    no-undo.
define variable ent_ord_line_uom        like sod_um      no-undo.
define variable conversion_factor       as decimal       no-undo.
define variable auth_price              like sod_price
                                        format "->>>>,>>>,>>9.99" no-undo.
define variable auth_found              like mfc_logical no-undo.
define variable l_inv_nbr               like so_inv_nbr  no-undo.

define new shared temp-table t_absr_det   no-undo
   field t_absr_id        like absr_id
   field t_absr_reference like absr_reference
   field t_absr_qty       as decimal format "->>>>,>>>,>>9.99"
   field t_absr_ext       as decimal format "->>>>,>>>,>>9.99"
   index t_absr_indx t_absr_id t_absr_reference.

define temp-table t_seq_lines no-undo
   field t_seqnbr like so_nbr
   field t_seqln  like sod_line.

define new shared frame d.
define new shared frame dent.
define new shared frame deuro.

{us/so/sodiscwk.i} /* Shared workfile for summary discounts */

{us/so/so10a01.i}
/*grc338 {us/so/so10e02.i} */
/*grc338 {us/fs/fs10b01.i}  */  /* frame e definition for call-details */

{us/fs/fsconst.i}    /* FIELD SERVICE CONSTANTS */

{us/xf/xfrp1amv.i} /*grc338*/
/* CUSTOMER SEQUENCE SCHEDULES INSTALLED? */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'enable_sequence_schedules',
     input '',
     input '',
     input 'rcf_ctrl',
     output using_seq_schedules)"}

{us/cc/cclc.i} /* DETERMINE IF CONTAINER/LINE CHARGES IS ACTIVE */

/*grc338 ext_price_fmt = ext_price:format. */
{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output ext_price_fmt, input rndmthd)"}

/* IF INCLUDING CALL DETAILS, HANDLE CDR FOR THOSE PRINT FIELDS */
/*grc338 comment begin
if call-detail then
   assign
      billable-amt:format = ext_price_fmt
      sfb_price:format    = ext_price_fmt.

/* Set the label for the discount display */
hdl_disc_lbl = prnt_disc_amt:handle in frame disc_print.
grc338 comment end*/

find first svc_ctrl where svc_domain = global_domain no-lock no-error.
find first rmc_ctrl where rmc_domain = global_domain no-lock no-error.

find so_mstr where recid(so_mstr) = so_recno no-lock.

/* sotrhstb.p CREATES TEMP-TABLE TO STORE tr_hist RECORDS AND RETRIEVE IN     */
/* soauthbl.p AND so10h01.p TO IMPROVE THE PERFORMANCE WHILE PRINTING         */
/* AUTHORIZATION NUMBERS FOR SCHEDULE ORDERS AND LOTSERIAL NUMBER RESPECTIVELY*/
if available so_mstr
   and ((so_sched       = yes
         and so__qadc03 = "yes")
        or print_lotserials)
   and not can-find(first t_tr_hist1
                       where t_tr_nbr = so_nbr)
then do:

   {us/bbi/gprun.i ""sotrhstb.p""
      "(input  so_nbr,
        input  """",
        input-output table t_tr_hist1)"}

end. /* IF AVAILABLE so_mstr */

/* Display sub-header for additional SOs on the invoice */
if comb_inv_nbr <> ""
then do with frame subheada:

   find ad_mstr where ad_domain = global_domain
      and ad_addr = so_ship
   no-lock no-wait no-error.

   /* SET EXTERNAL LABELS */
   setFrameLabels(frame subheada:handle).

   /*grc338 comment begin
   display
      so_nbr  label "Order"
      ad_name label "Ship-To" when (available ad_mstr)
      so_po   label "P/O"
   with frame subheada side-labels no-box.
   grc338 comment end*/
   {us/xf/xfrp1amg.i} /*grc338*/

   if sacontract
   then do:      
      /* FOR SERVICE CONTRACT INVOICES, PRINT THE PERIOD  */
      /* OF COVERAGE BEING BILLED FOR, AND THE CONTRACT # */
      fsremarks = getTermLabel("FOR_PERIOD",25) + ": " +
                  string(so_req_date,"99/99/99")       +
                  " " + getTermLabel("TO",10) + ": "   +
                  string(so_due_date,"99/99/99").
      put
         fsremarks  at 15.

      fsremarks = getTermLabel("SERVICE_CONTRACT",35) + ": " + so_sa_nbr.
      put
         fsremarks at 15.
      put skip(1).
      fsremarks = "".
   end. /* IF sacontract */

   if so_cmtindx <> 0
   then do:
      /*grc338 comment begin
      put skip(1).
      run PrintHeaderComment(input so_cmtindx,
                             input vcPriHeadComment).
      put skip(1).
      grc338 comment end*/
      {us/xf/xfcmtprt.i &type=IN &id=so_cmtindx &rectype=H} /*grc338*/
   end. /* IF so_cmtindx <> 0 */

end. /* IF comb_inv_nbr <> "" */

/* PRINT ORDER DETAIL  */
for each sod_det where sod_domain = global_domain
    and sod_nbr = so_nbr
    and (sod_qty_inv <> 0 or not inv_only)
    and sod_compl_stat = ""
by sod_line:

   conversion_factor = 1.

   if so_app_owner = 'DOM' then do:
      {us/bbi/gprun.i ""sodomxr.p""
         "(input sod_nbr,
           input sod_line,
           input 'SO',
           output ent_ord_nbr,
           output ent_ord_line,
           output ent_ord_bill,
           output ent_ord_ship,
           output ent_ord_line_part,
           output ent_ord_line_uom)" }

      if sod_um <> ent_ord_line_uom then do:
         {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                        &HANDLE=ph_gpumxr
                        &PARAM="(input ent_ord_line_part,
                                 input ent_ord_line_uom,
                                 input sod_um,
                                 output conversion_factor)"
                        &NOAPPERROR=True
                        &CATCHERROR=True}
      end.
   end.

   /* IF THIS IS AN RMA RECEIPT LINE WITH ZERO DOLLARS AND */
   /* PRINT RETURNS (RMC_PRT_RTN) IS NO, SKIP IT.          */
   /* IF THIS IS A SERVICE CONTRACT LINE WITH ZERO DOLLARS */
   /* AND PRINT NO CHARGE INVOICES (SVC_PRT_0ITM) IS NO,   */
   /* SKIP IT.                                             */
   /* IF A ZERO PRICED RMA RECEIPT LINE, AND     */
   /* "PRINT NO CHARGE RECEIPTS" IS NO, SKIP IT. */
   if sod_fsm_type = rmarct_c and available rmc_ctrl then
      if not rmc_prt_rtn and sod_price = 0 then
         next.

   /* IF A ZERO PRICED SERVICE CONTRACT LINE, AND */
   /* "PRINT NO CHARGE LINES" IS NO, SKIP IT.     */
   if sod_fsm_type begins scontract_c and available svc_ctrl then
      if not svc_prt_0itm and sod_price = 0 then next.

   restock_amt = 0.

   if sod_fsm_type = rmarct_c then do:
      restock_amt = sod_covered_amt.
      if restock_amt <> 0 then
         assign
            restock_pct = sod_disc_pct
            restock_prc = sod_price + restock_amt.
   end.  /* if RMA receipt */

   if sod_qty_ord >= 0 then
      qty_bo = max(sod_qty_ord - sod_qty_ship, 0).
   else
      qty_bo = min(sod_qty_ord - sod_qty_ship, 0).

   if sacontract
   then do:
      ext_price = sod_price * sod_qty_item.
      if can-find (sac_ctrl where sac_domain = global_domain
                      and sac_int_rnd)
      then do:
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output ext_price,
              input        rndmthd,
              output       mc-error-number)"}
      end. /* IF CAN-FIND (sac_ctrl... */
      ext_price = ext_price * sod_qty_per.
   end. /* IF sacontract */
   else
      ext_price = sod_qty_inv * sod_price.

   /* ROUND TO DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output ext_price,
        input rndmthd,
        output mc-error-number)"}

   /* CHECK AUTHORIZATION RECORDS FOR DIFFERENT EXTENDED PRICE */
   if sod_sched  = yes and
      so__qadc03 = "yes"
   then do:

      auth_found = no.
      {us/bbi/gprun.i ""soauthbl.p""
         "(input table t_tr_hist1,
           input '',
           input so__qadc03,
           input sod_nbr,
           input sod_line,
           input sod_price,
           input sod_site,
           input ext_price,
           output auth_price,
           output auth_found)"}

      ext_price = auth_price.

   end. /* IF sod_sched */
   accumulate ext_price (total).

   /* Contract billing line items use sod_part for the */
   /* contract type. Get the contract type description */
   /* from the sv_mstr. The sod_desc field is storing  */
   /* the item's under contract (sod_for) modified     */
   /* description.                                     */
   if not sacontract then do:
      find pt_mstr where pt_domain = global_domain
          and pt_part = sod_part
      no-lock no-wait no-error.
      if available pt_mstr then do:
         if sod_desc = "" then
            desc1 = pt_desc1.
         else
            desc1 = sod_desc.
         desc2 = pt_desc2.
      end.
      else
         assign
            desc1 = sod_desc
            desc2 = "".
   end.

   else do:
      find sv_mstr where sv_domain = global_domain
          and sv_code = sod_part
      no-lock no-error.
      if available sv_mstr then
         desc1 = sv_desc.
      else
         desc1 = "".
   end.

   /*grc338 comment begin
   assign
      ext_price:format in frame d     = ext_price_fmt
      ext_price:format in frame dent  = ext_price_fmt.
   grc338 comment end*/

   if sod_fsm_type =  fsmro_c then do:
      /* THE CALL LINE ITEM (ITM_DET) CORRESPONDS TO THE */
      /* SALES ORDER LINE. IT CONTAINS THE ITEM REPAIRED */
      /* ON THE CALL.                                    */
      find itm_det where itm_domain = global_domain
         and itm_nbr    = so_nbr
         and itm_prefix = caprefix_c
         and itm_type   = mfblank
         and itm_line   = sod_line
      no-lock no-error.

    /*grc338  sod_qty_inv:label = getTermLabelRt("REPAIRED",10). */
   end.
   /*grc338 comment begin
   else
      sod_qty_inv:label = getTermLabelRt("INVOICED",10).
   grc338 comment end*/
   {us/xf/xfrp1amb.i} /*grc338*/

   /* Record the tax data for print */
   run RecordTaxData(input "16",
                     input if available so_mstr then so_inv_nbr
                                                else sod_inv_nbr,
                     input sod_nbr,
                     input sod_line).
   /* PRINT LINE ITEMS */
   /*grc338 {us/so/so10e01.i} */
   {us/xf/xf10e01.i} /*grc338*/

   if rmaso and restock_amt <> 0 then do:

      /*grc338 comment begin
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h01.i}
      end.

      put {us/bbi/gplblfmt.i &FUNC=getTermLabelRtColon(""RESTOCKING_CHARGE"",16)}
          to 20 restock_pct restock_amt
          {us/bbi/gplblfmt.i &FUNC=getTermLabelRtColon(""LIST"",8)}
          to 48 restock_prc skip.
      grc338 comment end*/
      {us/xf/xfrp1ami.i} /*grc338*/
   end.

   /*grc338 comment begin
   run PrintCustomerItem(input sod_custpart,
                         input 3).

   /* DISPLAY CUSTOMER REF IF NOT NULL AND DIFFERENT FROM CUST PART */
   if  ((available sod_det) and (sod_custref <> "")
         and (sod_custref <> sod_custpart ))
   then do:
      put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""CUSTOMER_REFERENCE"",15)
             &CONCAT="':'"} at 3 sod_custref at 20 skip.
   end. /* IF  ((AVAILABLE SOD_DET) AND (SOD_CUSTREF <> ""))" */

   /* DISPLAY MODEL YEAR IF NOT NULL */
   if  ((available sod_det) and (sod_modelyr <> "")) then do:
      put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""MODEL_YEAR"",15)
             &CONCAT="':'"} at 3 sod_modelyr at 20 skip.
   end. /* IF  ((AVAILABLE SOD_DET) AND (SOD_MODELYR <> ""))" */

   run PrintDescription(input desc1,
                        input true,
                        input false,
                        input 3).

   run PrintDescription(input desc2,
                        input false,
                        input true,
                        input 3).
   grc338 comment end*/
   for first rbc_ctrl no-lock where rbc_domain = global_domain and rbc_print_inv_det:
      {us/bbi/gprun.i ""sorbrp01.p""
                        "(input sod_nbr,
                          input '',  /* Blank invoice number */
                          input sod_part,
                          input so_mstr.so_app_owner = 'DOM')"}
   end.
   /***********************************************/
   /*              Repair Order                   */
   /***********************************************/
   if  sod_fsm_type =  fsmro_c
   then do:
      fsremarks = "".
      if sod_serial <> ""
      then do:
         fsremarks = getTermLabelRtColon("SERIAL", 15) + " " + sod_serial.
      end. /* IF sod_serial <> ""   and (print_lotserials  or call-detail) THEN DO ... */

      form
         fsremarks                     no-label
         skip(1)
         itm_ca_int_type     colon 16
         fwk_desc            colon 30  no-label
         sv_code             colon 16
         sv_desc             colon 30  no-label
         skip(1)
      with frame detaila  no-box side-labels width 80.

      /* SET EXTERNAL LABELS */
      setFrameLabels(frame detaila:handle).

      /*grc338 comment begin
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h01.i}
      end.
      grc338 comment end*/

      if available itm_det then do:

         /*grc338 comment begin
         if page-size - line-counter < 1 then do:
            page.
            {us/so/so10h01.i}
         end.
         grc338 comment end*/

         /* FWK_MSTR IS THE WORK CODE, SV_MSTR IS SERVICE TYPE */
         find fwk_mst where fwk_domain = global_domain
            and fwk_ca_int_type = itm_ca_int_type
         no-lock no-error.

         find sv_mstr where sv_domain = global_domain
             and sv_code   = itm_sv_code
             and sv_type   = mfblank
         no-lock no-error.

         /*grc338 comment begin
         display
       fsremarks       when (fsremarks <> "")
            itm_ca_int_type
            fwk_desc        when (available fwk_mstr)
            sv_code         when (available sv_mstr)
            sv_desc         when (available sv_mstr)
         with frame detaila.
         grc338 comment end*/
         {us/xf/xfrp1amj.i} /*grc338*/

      end. /***************itm_det***************/

      if call-detail then do:

         assign
            sfb-line-count = 0
            total-price    = 0
            total-covered  = 0
            total-billable = 0.
         assign tot_tax = 0 tot_ex_tax = 0. /*grc338*/

         /* IF PRINTING CALL DETAIL, PRINT THE LOWER LEVEL */
         /* DETAILS (SFB_DET = BILLING DETAIL) RELATED TO  */
         /* THIS REPAIR LINE.  THIS DETAIL IS THE PARTS,   */
         /* LABOR AND EXPENSES INVOLVED IN THIS REPAIR.    */
         for each sfb_det no-lock
            where sfb_domain   = global_domain
            and   sfb_nbr      = sod_nbr
            and   sfb_so_line  = sod_line
            break by sfb_pt_type
                  by sfb_fis_sort
                  by sfb_line:

            /* SFB_DETAIL INDICATES WE WILL PRINT EVERY   */
            /* UNIQUE DETAIL OF THE REPAIR ACTIVITY,      */
            /* INSTEAD OF SUMMARIZING BY INVOICE SORT     */
            /* (WHERE INVOICE SORT WOULD BE SOMETHING LIKE*/
            /* PARTS, LABOR, TRAVEL EXPENSE...)           */

            /* IF NOT SFB_DETAIL THEN ACCUMULATE TOTAL PRICE */
            /* LESS ANY EXCHANGE AMOUNT (ITEMS ONLY) AND     */
            /* TOTAL COVERED AMOUNT FOR THE INVOICE SORT AND */
            /* PRINT ONE DETAIL LINE ONLY WHEN WE GET TO THE */
            /* LAST ONE... */
            find first tt_tax where tt_sfb = recid(sfb_det) no-error. /*grc338*/

            if sfb_detail and first-of(sfb_fis_sort) then do:

               /* SO, IF WE'RE PRINTING "DETAIL", PRINT A     */
               /* HEADING LINE WHEN WE HIT A NEW INVOICE SORT */
               /*grc338 comment begin
               if page-size - line-counter < 1 then do:
                  page.
                  {us/so/so10h01.i}
               end.

               down 1 with frame e.

               put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""TYPE"",8)
                      &CONCAT="': '"} at 30
                   sfb_fis_sort.
               grc338 comment end*/
               {us/xf/xfrp1amk.i} /*grc338*/

            end.    /* if sfb_detail and... */

            billable-amt  = sfb_price * sfb_qty_req.

            {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
               "(input-output billable-amt,
                 input rndmthd,
                 output mc-error-number)"}

            billable-amt  = billable-amt - sfb_covered_amt.

            if sfb_detail then do:
               /*****************************************/
               /* IF THIS IS A FIXED PRICE BILLING THEN */
               /* WE DON'T WANT TO PRINT THE PRICE      */
               /*****************************************/

               /*grc338 add begin*/
               assign
                  tot_tax    = if available tt_tax then tt_tax_amt
                               else 0
                  tot_ex_tax = if available tt_tax then tt_tax_ex_amt
                               else 0.
               /*grc338 add end*/

               if sod_fix_pr then
                  display-price = no.
               else
                  display-price = yes.

               /*grc338 comment begin
               if page-size - line-counter < 2 then do:
                  page.
                  {us/so/so10h01.i}
               end.
               grc338 comment end*/

               /* FOR ALL BUT RETURNS/EXCHANGES PRINT LIKE THIS: */
               if sfb_qty_ret = 0 then do:
                  /* FOR PARTS, PRINT PART NUMBER @ DESCRIPTION,
                     ELSE, PRINT SERVICE CATEGORY */
                  display
                     sfb_part     when (sfb_pt_type = 0)  @ sfb_desc
                     sfb_fsc_code when (sfb_pt_type <> 0) @ sfb_desc
                     sfb_line
                     sfb_qty_req
                     sfb_price          when (display-price)
                     billable-amt       when (display-price)
                  with frame e.

                  down 1 with frame e.
                  if display-price then do:
                     display
                        (- sfb_covered_amt) @ sfb_price
                        sfb_desc
                        sfb_fcg_code    when (not sod_fix_pr)
                        @ sfb_qty_req
                     with frame e.
                     down 1 with frame e.
                  end.  /* if display-price */
                  else if sfb_desc > "" or not sod_fix_pr then do:
                     display
                        sfb_desc
                        sfb_fcg_code    when (not sod_fix_pr)
                        @ sfb_qty_req
                     with frame e.
                     down 1 with frame e.
                  end.
                  {us/xf/xfrp1aml.i} /*grc338*/
               end.    /* if sfb_qty_ret = 0 */
               else do:
                  /* IF THE REPAIR INCLUDED AN EXCHANGE FROM THE */
                  /* CUSTOMER (I.E. WE GAVE HIM SOME CREDIT FOR  */
                  /* THE BROKEN PART THAT HE RETURNED), PRINT    */
                  /* THAT DETAIL ALSO.                           */

                  tmp_amt = (sfb_exg_price * sfb_qty_ret).

                  {us/bbi/gprun.i ""gpcurrnd.p""
                     "(input-output tmp_amt,
                       input rndmthd)"}

                  display
                     sfb_part          @ sfb_desc
                     sfb_line
                     (- sfb_qty_ret)   @ sfb_qty_req
                     (- sfb_exg_price) when (sfb_exchange)
                     @ sfb_price
                     (- tmp_amt )      when (sfb_exchange)
                     @ billable-amt
                  with frame e.

                  down 1 with frame e.

                  display
                     sfb_desc
                     getTermLabel("EXCHANGE", 10)  when (sfb_exchange)
                     @ sfb_qty_req
                     getTermLabel("RETURN", 10)    when (not sfb_exchange)
                     @ sfb_qty_req
                  with frame e.

                  down 1 with frame e.
                  {us/xf/xfrp1amm.i} /*grc338*/
               end. /*  else, sfb_qty_ret <> 0, do  */

               /* PRINT COMMENTS FOR THE SFB_DETS ALSO */
               /*grc338  put skip(1). */
               /*grc338 comment begin
               run PrintLineComment(input sfb_cmtindx,
                                    input vcPriLineComment).
                grc338 comment end*/
               {us/xf/xfcmtprt.i &type=IN &id=sfb_cmtindx &rectype=N} /*grc338*/
           end.  /* if sfb_detail */

            else do:

               /* FOR FIXED PRICE LINES, WE WON'T PRINT ANY PRICES */
               /* AND, IF WE'RE NOT PRINTING ANY DETAIL, SAVE      */
               /* OURSELVES THE OVERHEAD OF ALL THIS. */
               if not sod_fix_pr then do:
                  tmp_amt = (sfb_price * sfb_qty_req).

                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                     "(input-output tmp_amt,
                       input rndmthd,
                       output mc-error-number)"}

                  /* ACCUMULATE AMOUNTS FOR THIS INVOICE SORT */
                  assign
                     total-covered  = total-covered + sfb_covered_amt
                     total-price    = total-price  + tmp_amt
                     total-billable = total-billable + billable-amt.

                  /*grc338 add begin*/
                  assign
                     tot_tax     =  tot_tax +
                                    if available tt_tax then tt_tax_amt
                                    else 0
                     tot_ex_tax  =  tot_ex_tax +
                                    if available tt_tax then tt_tax_ex_amt
                                    else 0.
                  /*grc338 add end*/

                  if sfb_exchange then do:
                     tmp_amt = (sfb_exg_price * sfb_qty_ret).

                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                        "(input-output tmp_amt,
                          input rndmthd,
                          output mc-error-number)"}

                     assign total-exchange = total-exchange + tmp_amt.
                  end.    /* if sfb_exchange */

                  if last-of (sfb_fis_sort) then do:

                     /* PRINT THE INVOICE SORT HEADING */
                     /*grc338 comment begin
                     if page-size - line-counter < 1 then do:
                        page.
                        {us/so/so10h01.i}
                     end.

                     down 1 with frame e.

                     put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""TYPE"",8)
                            &CONCAT="': '"} at 30
                         sfb_fis_sort.

                     if page-size - line-counter < 2 then do:
                        page.
                        {us/so/so10h01.i}
                     end.
                     grc338 comment end*/
                     {us/xf/xfrp1amk.i} /*grc338*/

                     /* ROUND INVOICE SORT TOTAL AMOUNTS */

                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                        "(input-output total-covered,
                          input rndmthd,
                          output mc-error-number)"}

                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                        "(input-output total-price,
                          input rndmthd,
                          output mc-error-number)"}

                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                        "(input-output total-billable,
                          input rndmthd,
                          output mc-error-number)"}

                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                        "(input-output total-exchange,
                          input rndmthd,
                          output mc-error-number)"}

                     /* DISPLAY TOTALS FOR THE INVOICE SORT */
                     sfb-line-count = sfb-line-count + 1.

                     find fis_mstr where fis_domain = global_domain
                        and fis_sort = sfb_fis_sort
                     no-lock.

                     display
                        sfb-line-count  @ sfb_line
                        fis_desc        @ sfb_desc
                        total-price     @ sfb_price
                        total-billable  @  billable-amt
                     with frame e.

                     down 1 with frame e.

                     display
                        getTermLabel("COVERED_AMOUNT", 24) @ sfb_desc
                        (- total-covered) @ sfb_price
                     with frame e.

                     down 1 with frame e.

                     if total-exchange <> 0 then do:
                        display
                           getTermLabel("EXCHANGES", 24) @ sfb_desc
                           (- total-exchange) @ sfb_price
                           (- total-exchange) @ billable-amt
                        with frame e.
                        down 1 with frame e.
                     end.   /* if total-exchange <> 0 */

                     assign
                        total-price    = 0
                        total-covered  = 0
                        total-billable = 0
                        total-exchange = 0.
                     /*grc338 add begin*/
                     assign
                        tot_tax        = 0
                        tot_ex_tax     = 0.
                     /*grc338 add end*/
                  end.    /* if last-of (sfb_fis_sort) */
               end.    /* if not sod_fix_pr */
            end.  /* else, not sfb_detail, do */

         end. /*********for each sfb_det**********/

      end.   /* if call-detail */

   end. /***************repair order*************/

   if sacontract then do:

      /**********************************************/
      /*   Check to see if this SO is in sas_mstr   */
      /**********************************************/
      if sod_req_date <> ? and sod_due_date <> ?
      then do:

         /* SUMMARY BILLING DOES NOT POPULATE THESE 2 DATES */
         if sod_req_date <> so_req_date or
            sod_due_date <> so_due_date
         then do:

            fsremarks = getTermLabel("FOR_THE_PERIOD", 13) + ": "
                        + string(sod_req_date,"99/99/99")
                        + " " + getTermLabel("TO", 10) + ": "
                        + string(sod_due_date,"99/99/99").

            /* put  fsremarks  at 15. */ /*grc338*/
            {us/xf/xfrp1amo.i} /*grc338*/
         end.
      end.
      /*grc338 comment begin
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h01.i}
      end.
      grc338 comment end*/

      /* If the item under contract has a modified desc use */
      /* it. Else use the ISB desc, then the part desc.     */
      /* desc1 = "".                                        */
      desc1 = sod_desc.
      if desc1 = "" then do:

         find isb_mstr where isb_domain = global_domain
            and isb_eu_nbr = so_ship
            and isb_part   = sod_for
            and isb_serial = sod_serial
            and isb_ref    = sod_ref
         no-lock no-error.

         if available isb_mstr and isb_desc1 <> "" then
            desc1 = isb_desc1.
         else do:
            find pt_mstr where pt_domain = global_domain
               and pt_part = sod_for
            no-lock no-error.
            if available pt_mstr then
               desc1 = pt_desc1.
         end.
      end.

      fsremarks = "".
      if sod_for <> "" then
         fsremarks = sod_for + " ".
      fsremarks = fsremarks + desc1.

      if sod_serial <> "" and print_lotserials = no then do:
         fsremarks = fsremarks + getTermLabelRtColon("SERIAL", 15)
                   + " " + sod_serial.
      end.
      /*grc338 comment begin
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h01.i}
      end.

      put fsremarks at 3.
      grc338 comment end*/
      {us/xf/xfrp1amo.i} /*grc338*/

      if sod_enduser <> "" then do:
         fsremarks = getTermLabelRtColon("END_USER",9) + sod_enduser.
         /*grc338 comment begin
         if page-size - line-counter < 1 then do:
            page.
            {us/so/so10h01.i}
         end.
         put fsremarks at 3.
         grc338 comment end*/
         {us/xf/xfrp1amo.i} /*grc338*/
      end.

      if sod_qty_per  > 1 or
         sod_qty_item > 1
      then do:

         /*grc338 comment begin
         if page-size - line-counter < 1 then do:
            page.
            {us/so/so10h01.i}
         end.

         put
            {us/bbi/gplblfmt.i &FUNC=getTermLabel(""UNITS"",5)} at 3
            sod_qty_item     at 9
            " x " at 24
            {us/bbi/gplblfmt.i &FUNC=getTermLabel(""PERIODS"",7)}
            sod_qty_per      at 35
            " = " at 47
            {us/bbi/gplblfmt.i &FUNC=getTermLabel(""SHIPPED"",7)}
            sod_qty_inv      at 58.
         grc338 comment end*/
         {us/xf/xfrp1amr.i} /*grc338*/
      end.

   end. /*************sacontract ************/

   /* Do not print P.O.'s for Service Contracts. The contract */
   /* has already been displayed in the invoice header.       */
   if sod_contr_id <> "" and (sod_sched or rmaso) then do:
      /*grc338 comment begin
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h01.i}
      end.

      /* PRINT THE PO NUMBER IF A SCHEDULED ORDER INVOICE,   */
      /* ELSE PRINT THE SERVICE CONTRACT FOR AN RMA INVOICE. */
      if sod_sched then
         put {us/bbi/gplblfmt.i &FUNC=getTermLabelRtColon(""PURCHASE_ORDER"",16)}
             at 3 sod_contr_id at 20 skip.
      else

         put {us/bbi/gplblfmt.i &FUNC=getTermLabelRtColon(""SERVICE_CONTRACT"",16)}
             at 3 sod_contr_id at 20 skip.
      grc338 comment end*/
      {us/xf/xfrp1amp.i} /*grc338*/
   end.

   /* Print Lot/Serial Numbers */
   so_db = global_db.

   find si_mstr where si_domain = global_domain
      and si_site = sod_site
   no-lock no-error.

   /* CHANGE DOMAINS IF USING MULTI-DOMAINS TO LOCATE tr_hist */
   if si_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err_flag)" }
   end.

   assign
      sonbr  = sod_nbr
      soline = sod_line
      sopart = sod_part.

   /* Print Lot/Serial Numbers */
   if print_lotserials then do:
     /*grc338  {us/bbi/gprun.i ""so10h01.p"" */
     /*grc338 */  {us/bbi/gprun.i ""xf10h01.p""
         "(input table t_tr_hist1,
           input so_app_owner)"}
   end. /* END OF IF print_lotserials */

   /* CALL ROUTINE SOAUTH.P FOR SCHEDULE ORDERS ONLY */
   /* WHEN 'INVOICE BY AUTHORIZATION' IS 'YES'       */
   if sod_sched and
      so__qadc03 = "yes"
   and can-find (first rqm_det where rqm_domain = global_domain
                  and rqm_nbr  = sonbr
                  and rqm_line =  soline
                  and rqm_cat  = "authnbr")
   then do:

      /* ROUTINE TO PRINT AUTHORIZATION NUMBER AND PEGGED QTY */
      /*grc338  {us/bbi/gprun.i ""soauth.p""} */
      /*grc338*/  {us/bbi/gprun.i ""xfauth.p""}

      /* UPDATE SEQUENCE SCHEDULE WITH INVOICE NUMBER */
      if using_seq_schedules
      then do:
         l_inv_nbr = so_inv_nbr.
         {us/gp/gprunmo.i
            &program = ""soabssiv.p""
            &module = "ASQ"
            &param="""(input sonbr,
                       input soline,
                       input so_inv_nbr)"""}
      end.
   end. /* IF SOD_SCHED */

   /* RESET THE DOMAIN TO THE SALES ORDER DOMAIN */
   if si_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err_flag)" }
   end.

   /* Print Features and Options */
   /********************************************
   sob_serial subfield positions:
   1-4     operation number (old - now 0's)
   5-10    scrap percent
   11-14   id number of this record
   15-15   structure code
   16-16   "y" (indicates "new" format sob_det record)
   17-34   original qty per parent
   35-35   original mandatory indicator (y/n)
   36-36   original default indicator (y/n)
   37-39   leadtime offset
   40-40   price manually updated (y/n)
   41-46   operation number (new - 6 digits)
   *******************************************/

   if print_options and
      can-find(first sob_det where sob_domain = global_domain
                  and sob_nbr = so_nbr
                  and sob_line = sod_line)
   then do:

      /* Print discounts for parent item */
      /* added net price parameter */
      /* changed qty from ordered to invoiced*/
      /*grc338 comment begin
      {us/so/sopiprn1.i &doctype="1"
                  &nbr=sod_nbr
                  &line=sod_line
                  &part=sod_part
                  &parent=""""
                  &feature=""""
                  &opt=""""
                  &qty=sod_qty_inv
                  &list_price=sod_list_pr
                  &net_price=sod_price
                  &confg_disc="no"
                  &command="~{us/so/so10h01.i~}"}
      grc338 comment end*/
      /*grc338 add begin*/
      {us/xf/xfpiprn1.i &doctype="1"
                  &nbr=sod_nbr
                  &line=sod_line
                  &part=sod_part
                  &parent=""""
                  &feature=""""
                  &opt=""""
                  &qty=sod_qty_inv
                  &list_price=sod_list_pr
                  &net_price=sod_price
                  &confg_disc="no"}
      /*grc338 add end*/

      find first sob_det where sob_domain = global_domain
         and sob_nbr = sod_nbr
         and sob_line = sod_line
      no-lock no-error.

     /*grc338  {us/bbi/gprun.i ""sorp1b01.p"" */
  /*grc338*/  {us/bbi/gprun.i ""xfrp1b01.p""
         "(input """",
           input 0,
           input sod_nbr,
           input sod_line,
           input print_lotserials)"}

   end.

   /* Test for configured parent without components */
   if available pt_mstr then do:

      pm_code = pt_pm_code.

      find ptp_det where ptp_domain = global_domain
         and ptp_part = sod_part
         and ptp_site = sod_site
      no-lock no-error.

      if available ptp_det then
         pm_code = ptp_pm_code.

      if pm_code = "C" and
         not can-find(first sob_det where sob_domain = global_domain
                         and sob_nbr = sod_nbr
                         and sob_line = sod_line)
      then do:
         /*grc338 comment begin
         {us/so/sopiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
            &part=sod_part
            &parent="""" &feature="""" &opt=""""
            &qty=sod_qty_inv &list_price=sod_list_pr
            &net_price=sod_price
            &confg_disc="no"
            &command="~{us/so/so10h01.i~}"}
         grc338 comment end*/
         /*grc338 add begin*/
         {us/xf/xfpiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
            &part=sod_part
            &parent="""" &feature="""" &opt=""""
            &qty=sod_qty_inv &list_price=sod_list_pr
            &net_price=sod_price
            &confg_disc="no"}
         /*grc338 add end*/
      end.
   end.

   /* Print global discounts for item/configuration */
   /*grc338 comment begin
   {us/so/sopiprn1.i
      &doctype="1"
      &nbr=sod_nbr
      &line=sod_line
      &part=sod_part
      &parent=""""
      &feature=""""
      &opt=""""
      &qty=sod_qty_inv
      &list_price=sod_list_pr
      &net_price=sod_price
      &confg_disc="yes"
      &command="~{us/so/so10h01.i~}"}
   grc338 comment end*/
   /*grc338 add begin*/
   {us/xf/xfpiprn1.i
      &doctype="1"
      &nbr=sod_nbr
      &line=sod_line
      &part=sod_part
      &parent=""""
      &feature=""""
      &opt=""""
      &qty=sod_qty_inv
      &list_price=sod_list_pr
      &net_price=sod_price
      &confg_disc="yes"}
   /*grc338 add end*/

   if sod_cmtindx <> 0 then
   do:
      /*grc338 comment begin
      put skip(1).
      run PrintLineComment(input sod_cmtindx,
                           input vcPriLineComment).
      grc338 comment end*/
   end.

   /* put skip(1). */ /*grc338*/
   {us/xf/xfcmtprt.i &type=IN &id=sod_cmtindx &rectype=D} /*grc338*/

   /* Accumulate order totals, commissions and taxes */

   if sacontract
   then do:
      ext_actual = sod_price * sod_qty_item.
      if can-find (sac_ctrl where sac_domain = global_domain
                      and sac_int_rnd)
      then do:
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output ext_actual,
              input        rndmthd,
              output       mc-error-number)"}
      end. /* IF CAN-FIND (sac_ctrl... */
      ext_actual = ext_actual * sod_qty_per.
   end. /* IF sacontract */
   else
      ext_actual = sod_price * sod_qty_inv.

   /* ROUND TO DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output ext_actual,
        input rndmthd,
        output mc-error-number)"}

   /* IF WE USED THE PRICE FROM THE AUTHORIZATIONS */
   assign
      ext_actual = if (sod_sched
                      and auth_found)
                   then
                      auth_price
                   else
                      ext_actual

      ext_margin = (sod_price - sod_std_cost) * sod_qty_inv.

   /* ROUND TO DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output ext_margin,
        input rndmthd,
        output mc-error-number)"}

   /* LINE TOTAL IS CALCULATED IN SOIVTRL2.P UNDER NEW TAXES */

   /* Commissions */
   do jk = 1 to 4:
      if soc_margin then do:
         tmp_amt = ext_margin * sod_comm_pct[jk].
         /* ROUND TO DOCUMENT CURRENCY ROUND METHOD */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output tmp_amt,
              input rndmthd,
              output mc-error-number)"}

         tot_line_comm[jk] = tot_line_comm[jk] + tmp_amt.
      end.
      else do:
         tmp_amt = ext_actual * sod_comm_pct[jk].
         /* ROUND TO DOCUMENT CURRENCY ROUND METHOD */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output tmp_amt,
              input rndmthd,
              output mc-error-number)"}

         tot_line_comm[jk] = tot_line_comm[jk] + tmp_amt.
      end.
   end.

   if using_line_charges then do:
    /* PROCEDURE TO CALCULATE AND PRINT LINE AND CONTAINER CHARGES */
    /* ON THE INVOICE OUTPUT.                                      */
      {us/gp/gprunmo.i
         &module = "ACL"
         &program = ""solcrp.p""
         &param = """(input recid(so_mstr),
                      input recid(sod_det),
                      input comb_inv_nbr,
                      input-output tot_line_charge)"""}
   end.

   {us/mf/mfrpchk.i}

   create t_seq_lines.
   assign
      t_seqnbr = so_nbr
      t_seqln  = sod_line.
end.

empty temp-table t_tr_hist1.

if using_container_charges then do:
  /* PROCEDURE TO CALCULATE AND PRINT LINE AND CONTAINER CHARGES */
 /* ON THE INVOICE OUTPUT.                                      */
   {us/gp/gprunmo.i
      &module = "ACL"
      &program = ""soccrp.p""
      &param = """(input recid(so_mstr),
                   input comb_inv_nbr,
                   output tot_cont_charge)"""}
end.

if using_seq_schedules then do:

   /* CHANGE DOMAIN TO LOCATE abss_det */
   so_db = global_db.
   find si_mstr where si_domain = global_domain
       and si_site = so_site
   no-lock no-error.
   if available si_mstr
   then do:
      if si_db <> so_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err_flag)" }
      end.

      if err_flag <> 0 and err_flag <> 9 then do:
         /* DOMAIN # IS NOT AVAILABLE */
         {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                  &MSGARG1=getTermLabel(""FOR_CUSTOMER_SEQUENCES"",35)}
      end.
      else do:
         if comb_inv_nbr = "" then
            l_inv_nbr = so_inv_nbr.
         else
            l_inv_nbr = comb_inv_nbr.

         run print_seqdata( input l_inv_nbr).

         /* PRINT SEQUENCE RANGE ON INVOICE */
         {us/gp/gprunmo.i
            &program=""rcsqps.p""
            &module="ASQ"
            &param="""(input l_inv_nbr)"""}

         /* RESET THE DOMAIN TO THE SALES ORDER DOMAIN */
         if si_db <> so_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err_flag)" }
         end.
      end.  /* else do */
   end. /* IF AVAILABLE si_mstr */
end.  /* if using_seq_schedules  */

PROCEDURE print_seqdata:
   define input parameter p_inv_nbr like idh_inv_nbr no-undo.

   do transaction:
      for each t_seq_lines:
         {us/gp/gprunmo.i
             &program = ""soabssiv.p""
             &module  = "ASQ"
             &param   = """(input t_seqnbr,
                            input t_seqln,
                            input p_inv_nbr)"""}
      end. /* for each t_seq_lines */

      /* PRINT SEQUENCE RANGE ON INVOICE */
      /* CHANGED INPUT PARAMETER TO l_inv_nbr */
      {us/gp/gprunmo.i
          &program = ""rcsqps.p""
          &module  = "ASQ"
          &param   = """(input p_inv_nbr)"""}

      undo , leave.
   end. /* transactions */

END PROCEDURE. /* print_seqdata */

/* Procedures of Print Settings */
/*grc338 {us/so/soprprc2.i &PageEnd="us/so/so10h01.i"} */
{us/xf/xfprprc2.i} /*grc338*/

