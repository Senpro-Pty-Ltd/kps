/* xfivrp1a.p  -  SALES ORDER INVOICE REPRINT - LINE ITEMS              */
/* soivrp1a.p  -  SALES ORDER INVOICE REPRINT - LINE ITEMS              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivrp1a.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 5.0      LAST MODIFIED: 01/08/90   BY: ftb *B511**/
/* REVISION: 6.0      LAST MODIFIED: 04/20/90   BY: ftb **/
/* REVISION: 6.0      LAST MODIFIED: 07/05/90   BY: WUG *D043**/
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425**/
/* REVISION: 6.0      LAST MODIFIED: 10/21/91   BY: afs *D903**/
/* REVISION: 7.0      LAST MODIFIED: 02/10/92   BY: tjs *F191**/
/* REVISION: 7.0      LAST MODIFIED: 03/25/92   BY: tjs *F320**/
/* REVISION: 7.0      LAST MODIFIED: 04/02/92   BY: afs *F348**/
/* REVISION: 7.3      LAST MODIFIED: 09/04/92   BY: afs *G047**/
/* REVISION: 7.3      LAST MODIFIED: 11/19/92   BY: tjs *G191**/
/* REVISION: 7.3      LAST MODIFIED: 02/19/93   BY: jms *G712**/
/* REVISION: 7.3      LAST MODIFIED: 03/17/93   BY: afs *G820**/
/* REVISION: 7.3      LAST MODIFIED: 04/29/93   BY: bcm *GA56**/
/* REVISION: 7.3      LAST MODIFIED: 05/13/93   BY: kgs *GA93**/
/* REVISION: 7.3      LAST MODIFIED: 09/30/93   BY: WUG *GG08**/
/* REVISION: 7.4      LAST MODIFIED: 05/24/94   BY: dpm *FO25**/
/* REVISION: 7.4      LAST MODIFIED: 05/24/94   BY: dpm *GJ94**/
/* REVISION: 7.4      LAST MODIFIED: 05/27/94   BY: dpm *GJ96**/
/* REVISION: 7.3      LAST MODIFIED: 07/08/94   BY: WUG *GK60**/
/* REVISION: 7.4      LAST MODIFIED: 11/17/94   BY: rxm *FT54**/
/* REVISION: 7.4      LAST MODIFIED: 12/07/94   BY: jxz *GO76**/
/* REVISION: 7.4      LAST MODIFIED: 02/16/95   BY: dxb *G0GB**/
/* REVISION: 7.4      LAST MODIFIED: 04/27/95   BY: rxm *F0PD**/
/* REVISION: 8.5      LAST MODIFIED: 03/20/95   BY: nte *J042**/
/* REVISION: 8.5      LAST MODIFIED: 08/18/95   BY: afs *J06R**/
/* REVISION: 7.4      LAST MODIFIED: 09/05/95   BY: jym *G0W9**/
/* REVISION: 7.4      LAST MODIFIED: 09/21/95   BY: jym *G0XP**/
/* REVISION: 7.4      LAST MODIFIED: 10/02/95   BY: jym *G0Y6**/
/* REVISION: 8.5      LAST MODIFIED: 07/27/95   BY: taf *J053**/
/* REVISION: 8.5      LAST MODIFIED: 03/25/96   BY: kxn *J0GC**/
/* REVISION: 8.5      LAST MODIFIED: 04/12/96   BY: *J04C* Sue Poland        */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: *J0T0* Dennis Hensen     */
/* REVISION: 8.5      LAST MODIFIED: 06/26/96   BY: *J0WF* Sue Poland        */
/* REVISION: 8.5      LAST MODIFIED: 08/07/96   BY: *G29K* Markus Barone     */
/* REVISION: 8.5      LAST MODIFIED: 10/03/96   BY: *J15C* Markus Barone     */
/* REVISION: 8.5      LAST MODIFIED: 01/17/97   BY: *G2H2* Vinay Nayak-Sujir */
/* REVISION: 8.5      LAST MODIFIED: 02/25/97   BY: *G2KX* Suresh Nayak      */
/* REVISION: 8.5      LAST MODIFIED: 04/14/97   BY: *J1N0* Ajit Deodhar      */
/* REVISION: 8.5      LAST MODIFIED: 05/14/97   BY: *G2N0* Sue Poland        */
/* REVISION: 8.6      LAST MODIFIED: 12/09/97   BY: *K1DL* Suresh Nayak      */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane         */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* EvdGevel          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6E     LAST MODIFIED: 06/06/98   BY: *L01M* Jean Miller       */
/* REVISION: 8.6E     LAST MODIFIED: 06/29/98   BY: *L024* Sami Kureishy     */
/* REVISION: 8.6E     LAST MODIFIED: 07/08/98   BY: *J2Q6* Samir Bavkar      */
/* REVISION: 8.6E     LAST MODIFIED: 08/19/98   BY: *L06H* Jean Miller       */
/* REVISION: 9.0      LAST MODIFIED: 11/20/98   BY: *J33Y* Poonam Bahl       */
/* REVISION: 9.0      LAST MODIFIED: 02/01/99   BY: *L0D5* Robin McCarthy    */
/* REVISION: 9.0      LAST MODIFIED: 02/17/99   BY: *K1ZK* Reetu Kapoor      */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 10/29/99   BY: *N049* Robert Jensen     */
/* REVISION: 9.1      LAST MODIFIED: 11/03/99   BY: *N004* Steve Nugent      */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 05/11/00   BY: *N0BF* Luke Pokic        */
/* REVISION: 9.1      LAST MODIFIED: 05/17/00   BY: *N0BC* Arul Victoria     */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00   BY: *N0JM* Mudit Mehta       */
/* Old ECO marker removed, but no ECO header exists *F0PN*                   */
/* Revision: 1.29.2.11     BY: Katie Hilbert  DATE: 04/01/01  ECO: *P002*    */
/* Revision: 1.29.2.12     BY: Steve Nugent   DATE: 07/09/01  ECO: *P007*    */
/* Revision: 1.29.2.13     BY: Steve Nugent   DATE: 03/15/02  ECO: *P00G*    */
/* Revision: 1.29.2.15     BY: Katie Hilbert  DATE: 04/15/02  ECO: *P03J*    */
/* Revision: 1.29.2.16     BY: Amit Chaturvedi DATE: 01/20/03  ECO: *N20Y*   */
/* Revision: 1.29.2.17     BY: Narathip W.     DATE: 05/14/03  ECO: *P0RT*   */
/* Revision: 1.29.2.19     BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.29.2.20     BY: Rajinder Kamra     DATE: 06/23/03 ECO: *Q003* */
/* Revision: 1.29.2.21     BY: Rajinder Kamra     DATE: 07/17/03 ECO: *Q013* */
/* Revision: 1.29.2.22     BY: Gnanasekar        DATE: 08/04/03  ECO: *P0V7*  */
/* Revision: 1.29.2.23     BY: Ashish Maheshwari DATE: 11/15/03  ECO: *P15L*  */
/* Revision: 1.29.2.24     BY: Subramanian Iyer  DATE: 11/27/03  ECO: *P13Q*  */
/* Revision: 1.29.2.25     BY: Vinay Soman       DATE: 01/20/04  ECO: *N2NZ*  */
/* Revision: 1.29.2.28     BY: Swati Sharma      DATE: 02/27/04  ECO: *P1R4*  */
/* Revision: 1.29.2.29     BY: Ajay Nair         DATE: 03/31/04  ECO: *P1W7*  */
/* Revision: 1.29.2.30     BY: Sachin Deshmukh   DATE: 09/22/04  ECO: *P2LR*  */
/* Revision: 1.29.2.31     BY: Dan Herman        DATE: 10/21/04  ECO: *P2QS*  */
/* Revision: 1.29.2.32     BY: Sushant Pradhan   DATE: 02/17/05  ECO: *P37X*  */
/* Revision: 1.29.2.33     BY: Bharath Kumar     DATE: 02/25/05  ECO: *P39Z*  */
/* Revision: 1.29.2.34     BY: Priyank Khandare  DATE: 03/21/05  ECO: *P339*  */
/* Revision: 1.29.2.36     BY: Surajit Roy       DATE: 03/23/05  ECO: *P32N*  */
/* Revision: 1.29.2.37     BY: Priyank Khandare  DATE: 11/28/05  ECO: *P49L*  */
/* Revision: 1.29.2.38     BY: Nishit V          DATE: 02/02/06  ECO: *P4GY*  */
/* Revision: 1.29.2.39     BY: Jean Miller       DATE: 02/28/06  ECO: *Q0R5*  */
/* Revision: 1.29.2.40     BY: Sanat Paul        DATE: 04/25/06  ECO: *P4Q9*  */
/* Revision: 1.29.2.41     BY: Katie Hilbert     DATE: 06/08/06  ECO: *Q0LK*  */
/* Revision: 1.29.2.44     BY: Jean Miller       DATE: 06/22/07  ECO: *R0C5* */
/* Revision: 1.29.2.45     BY: Katie Hilbert     DATE: 09/24/07  ECO: *R0C6* */
/* Revision: 1.29.2.49     BY: Jean Miller       DATE: 11/06/07  ECO: *P5Z7* */
/* Revision: 1.29.2.50     BY: Hemant Dhavse       DATE: 03/20/09  ECO: *Q2J3* */
/* Revision: 1.29.2.51     BY: Anju Dubey        DATE: 03/30/09  ECO: *P6K5* */
/* Revision: 1.29.2.52     BY: Dipanshu Talwar   DATE: 06/10/09  ECO: *Q2K3* */
/* Revision: 1.29.2.54     BY: Xiaolei Meng      DATE: 07/31/09  ECO: *R1N2*  */
/* Revision: 1.29.2.55     BY: Yizhou Mao        DATE: 08/27/09  ECO: *R1Q6*  */
/* Revision: 1.29.2.56     BY: Dipanshu Talwar   DATE: 10/01/09  ECO: *P552*  */
/* Revision: 1.29.2.58     BY: Jean Miller       DATE: 11/23/09  ECO: *R1TW*  */
/* Revision: QAD2015       BY: sxh    DATE: 06/04/16 ECO: *grc338* */
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
{us/gp/gprunpdf.i "mcpl" "p" }
 
{us/px/pxmaint.i}
{us/px/pxphdef.i pasexr}
{us/px/pxphdef.i pashphxr}
{us/px/pxphdef.i pasldel}
 
{us/pa/pattrciq.i}
 
define output parameter container_charge_tot  like abs_price no-undo.
define output parameter line_charge_tot       like absl_lc_amt no-undo.
define input-output parameter l_nontax_amt    like ih_trl2_amt no-undo.
define input-output parameter l_tax_amt       like ih_trl2_amt no-undo.
 
define new shared variable ext_price_fmt      as character.
define new shared variable lotserial_total    like tr_qty_chg.
define new shared variable lotserials_toprint as integer.
define new shared variable so_db              like dc_name.
define new shared variable sonbr              like idh_nbr.
define new shared variable soline             like idh_line.
define new shared variable soinv              like idh_inv_nbr no-undo.
define new shared variable sopart             like idh_part.
define new shared variable shipper_id         like abs_id no-undo.
define new shared variable shipper_date       like abs_shp_date no-undo.
define new shared variable abs_recno          as recid.
 
define shared variable ih_recno           as recid.
define shared variable rndmthd            like rnd_rnd_mthd.
define shared variable print_lotserials   like mfc_logical initial no
                                          label "Print Lot/Serial Numbers Shipped".
define shared variable first_line         like mfc_logical.
define shared variable pages              as integer.
define shared variable company            as character format "x(38)" extent 6.
define shared variable billto             as character format "x(38)" extent 6.
define shared variable soldto             as character format "x(38)" extent 6.
define shared variable inv_date           like ih_inv_date.
define shared variable call-detail        like mfc_logical
                                          label "Print Call Invoice Detail".
define shared variable disc_prnt_label    as character.
define shared variable rmaso              like mfc_logical.
define shared variable sacontract         like mfc_logical.
define shared variable print_options      like mfc_logical initial no
                                          label "Print Features and Options".
define shared variable isDomOrder         as logical no-undo.
 
/* Invoice Print Settings */
{us/so/soprsets.i}
 
define variable ent_ord_bill        like ih_bill     no-undo.
define variable ent_ord_ship        like ih_ship     no-undo.
define variable ent_ord_nbr         like ih_nbr      no-undo.
define variable ent_ord_line        like idh_line    no-undo.
define variable ent_ord_line_part   like idh_part    no-undo.
define variable ent_ord_line_uom    like idh_um      no-undo.
define variable qty_bo              like idh_qty_ord
                                    format "->>>>>>9.9<<<<"
                                    label "Backorder".
define variable ext_price           like idh_price
                                    format "->>>>,>>>,>>9.99"
                                    label "XXXXXXXXXXXXXXXX".
define variable i                   as integer no-undo.
define variable ibh_desc            like pt_desc1.
define variable ibh_desc2           like pt_desc2.
define variable ibh_um              like pt_um.
define variable desc1               like pt_desc1 no-undo.
define variable desc2               like pt_desc2 no-undo.
define variable err_flag            as integer.
define variable sob-qty             like ibh_qty_req.
define variable svremarks           as character format "x(60)".
define variable billable-amt        like sod_price no-undo.
define variable display-price       like mfc_logical.
define variable work-code           like itm_ca_int_type.
define variable pm_code             like pt_pm_code.
define variable hdl_disc_lbl        as handle.
define variable total-billable      like sfb_price no-undo.
define variable total-covered       like sfb_price no-undo.
define variable total-price         like sfb_price no-undo.
define variable total-exchange      like sfb_price no-undo.
define variable sfb-line-count      as integer     no-undo.
define variable tmp_amt             as decimal.
define variable restock_pct         like sv_rstk_pct no-undo.
define variable restock_amt         like rmd_restock no-undo.
define variable restock_prc         like sod_price   no-undo.
 
define variable auth_price          like sod_price
                                    format "->>>>,>>>,>>9.99"  no-undo.
define variable auth_found          like mfc_logical no-undo.
define variable conversion_factor   as decimal no-undo.
define variable l_inv_nbr           like ih_inv_nbr  no-undo.
define variable xab                 as character format "x(45)" .
 
define variable l_lot-lbl           as character format "x(56)".
define variable l_lotsrl_tot        like tr_qty_chg.
define variable l_effdate           as date no-undo.
define variable using_sequence_schedules like mfc_logical
   initial no no-undo.
define variable fromShippingHist as logical no-undo.
define variable progName as character no-undo.
 
define new shared temp-table t_absr_det no-undo
   field t_absr_id        like absr_id
   field t_absr_reference like absr_reference
   field t_absr_qty         as decimal format "->>>>,>>>,>>9.99"
   field t_absr_ext         as decimal format "->>>>,>>>,>>9.99"
   index t_absr_indx t_absr_id t_absr_reference.
 
define temp-table tt_item_serials no-undo
   field tt_serial_id      like ser_serial_id
   index idx_p tt_serial_id.
 
define temp-table tt_tr_hist no-undo
   field tt_tr_trnbr     as integer
   field tt_tr_type      as character
   field tt_tr_rmks      as character
   field tt_tr_serial    as character
   field tt_tr_expire    as date
   field tt_tr_ref       as character
   field tt_tr_nbr       as character
   field tt_tr_part      as character
   field tt_tr_effdate   as date
   field tt_tr_qty_loc   as decimal
   field tt_display      as logical
   index tt_tr_trnbr tt_tr_trnbr.
 
define buffer ihhist for ih_hist.
define buffer kit_item_tr_hist for tr_hist.
define buffer kit_item_abs_mstr for abs_mstr.
 
l_lot-lbl = getTermLabelRtColon("LOT/SERIAL_NUMBERS_SHIPPED",27) + " " +
            getTermLabelRt("QUANTITY",6) + " " +
            getTermLabelRt("EXPIRE",8) + " " +
            getTermLabelRt("REFERENCE",12).
 
/*grc338 add begin*/
{us/xf/xfiv10u.i}
{us/xf/xftxtots.i}
{us/xf/xfivrp9amv.i}
{us/xf/xfiv10v.i}
{us/xf/xfdefa.i}
/*grc338 add end*/
{us/et/etvar.i}
{us/et/etrpvar.i}
 
/* DEFINITION FOR TEMP TABLE  t_tr_hist1 */
{us/so/sotrhstb.i}
 
define new shared frame d.
define new shared frame dent.
 
/* SSM CONSTANTS */
{us/fs/fsconst.i}
 
/* FRAME e-hist DEFINITION FOR CALL DETAILS */
{us/fs/fs10b01.i}
 
/* SHARED WORKFILE FOR SUMMARY DISCOUNTS */
{us/so/sodiscwk.i}
 
/* SET THE LABEL FOR THE DISCOUNT DISPLAY */
hdl_disc_lbl = prnt_disc_amt:handle in frame disc_print.
 
/* Form definitions for frame d, dent */
{us/so/soivhfm2.i}
 
/* DETERMINE IF CONTAINER/LINE CHARGES IS ACTIVATED */
{us/cc/cclc.i}
 
ext_price_fmt = ext_price:format.
{us/bbi/gprun.i ""gpcurfmt.p"" "(input-output ext_price_fmt,
                          input rndmthd)"}
 
/* IF INCLUDING CALL DETAILS, HANDLE CDR FOR THOSE PRINT FIELDS */
if call-detail
then
   assign
      billable-amt:format = ext_price_fmt
      sfh_price:format    = ext_price_fmt.
 
find first rmc_ctrl where rmc_domain = global_domain no-lock no-error.
find first svc_ctrl where svc_domain = global_domain no-lock no-error.
find first soc_ctrl where soc_domain = global_domain no-lock no-error.
 
l_inv_nbr = "".
 
find ih_hist where recid(ih_hist) = ih_recno no-lock.
 
/* DEFINE VARIABLES FOR DISPLAY OF VAT REG. NO & COUNTRY CODE */
{us/gp/gpvtecdf.i &var="SHARED"}
{us/gp/gpvtepdf.i &var="SHARED"}
 
/* sotrhstb.p CREATES TEMP-TABLE TO STORE tr_hist RECORDS AND RETRIEVE IN    */
/* soauthbl.p TO  IMPROVE THE PERFORMANCE WHILE PRINTING AUTHORIZATION       */
/* NUMBERS FOR SCHEDULE ORDERS AND IN soivpr1c.p AND soivpr1d.p TO PRINT     */
/* LOTSERIAL NUMBER.                                                         */
 
if available ih_hist
then
   l_inv_nbr = ih_inv_nbr.
 
do for ihhist:
   for each ihhist
      no-lock
      where ih_domain  = global_domain
      and   ih_inv_nbr = l_inv_nbr
      and   ((ih_sched = yes
              and can-find(first idh_hist
                              where idh_domain  = global_domain
                              and   idh_inv_nbr = ih_inv_nbr
                              and   idh_nbr     = ih_nbr
                              and   idh__qadc06 = "yes"))
              or print_lotserials)
      and not can-find(first t_tr_hist1
                          where t_tr_nbr = ih_nbr):
 
         {us/bbi/gprun.i ""sotrhstb.p""
            "(input  ih_nbr,
              input  ih_inv_nbr,
              input-output table t_tr_hist1)"}
 
   end. /* FOR EACH ihhist */
end.    /* DO FOR ihhist */
 
/* start invoice certification */
define variable isPositive as logical initial true no-undo.
/* end. invoice certification */
 
for each idh_hist
   where idh_domain = global_domain
      and (idh_inv_nbr = ih_inv_nbr)
      and (idh_qty_inv <> 0 )
break by idh_nbr
      by idh_line:
 
   conversion_factor = 1.
   if isDomOrder then do:
      {us/bbi/gprun.i ""sodomxr.p""
         "(input idh_nbr,
           input idh_line,
           input 'SO',
           output ent_ord_nbr,
           output ent_ord_line,
           output ent_ord_bill,
           output ent_ord_ship,
           output ent_ord_line_part,
           output ent_ord_line_uom)" }
      if idh_um <> ent_ord_line_uom then do:
         {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                        &HANDLE=ph_gpumxr
                        &PARAM="(input ent_ord_line_part,
                                 input ent_ord_line_uom,
                                 input idh_um,
                                 output conversion_factor)"
                        &NOAPPERROR=True
                        &CATCHERROR=True}
      end.
   end.
 
   /* IF A ZERO PRICED RMA RECEIPT LINE, AND     */
   /* "PRINT NO CHARGE RECEIPTS" IS NO, SKIP IT. */
   if idh_fsm_type = rmarct_c and available rmc_ctrl
   then
      if not rmc_prt_rtn and idh_price = 0
   then
      next.
 
   /* IF A ZERO PRICED SERVICE CONTRACT LINE, AND */
   /* "PRINT NO CHARGE LINES" IS NO, SKIP IT.     */
   if sacontract and available svc_ctrl
   then
      if not svc_prt_0itm and idh_price = 0
      then
         next.
 
   restock_amt = 0.
   if idh_fsm_type = rmarct_c
   then do:
 
      restock_amt = idh_covered_amt.
      if restock_amt <> 0
      then
         assign
            restock_pct = idh_disc_pct
            restock_prc = idh_price + restock_amt.
   end.  /* if RMA receipt */
 
   /* PRINT ORDER DETAIL  */
 
   if idh_qty_ord >= 0
   then
      qty_bo = max(idh_qty_ord - idh_qty_ship, 0).
   else
      qty_bo = min(idh_qty_ord - idh_qty_ship, 0).
 
   /* ROUND OFF THE INVOICE PRICE BEFORE CALCULATING THE */
   /* EXTENDED PRICE AND EXTENDED MARGIN.                */
 
   ext_price = idh_price.
   if   (idh_fsm_type = "SC"
      or idh_fsm_type = "SC-ADD")
      and can-find (sac_ctrl where sac_domain = global_domain
                       and sac_int_rnd)
   then do:
      run mcpl-mc-curr-rnd
         (input-output ext_price,
          input        rndmthd,
          output       mc-error-number).
      if mc-error-number <> 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */
   end. /* IF idh_fsm_type = "SC" */
 
   /* CALCULATE EXTENDED PRICE AND EXTENDED MARGIN USING */
   /* ROUNDED OFF VALUE OF THE INVOICE PRICE.            */
 
   ext_price = idh_qty_inv * ext_price.
 
   run mcpl-mc-curr-rnd
       (input-output ext_price,
        input rndmthd,
        output mc-error-number).
 
   /* CHECK AUTHORIZATION RECORDS FOR DIFFERENT EXT PRICE */
   if  idh_sched   = yes
   and idh__qadc06 = "yes"
   then do:
 
      auth_found = no.
 
      {us/bbi/gprun.i ""soauthbl.p""
         "(input  table t_tr_hist1,
           input  idh_inv_nbr,
           input  idh__qadc06,
           input  idh_nbr,
           input  idh_line,
           input  idh_price,
           input  idh_site,
           input  ext_price,
           output auth_price,
           output auth_found)"}
 
      ext_price = auth_price.
 
   end. /*IF idh_sched */
 
   accumulate ext_price (total).
 
   assign
      desc1 = idh_desc
      desc2 = "".
   find pt_mstr
      where pt_domain = global_domain
       and  pt_part = idh_part
   no-lock no-wait no-error.
   if desc1 = "" and available pt_mstr
   then
      desc1 = pt_desc1.
   if available pt_mstr
   then
      desc2 = pt_desc2.
 
   if print_lotserials
   then do:
 
      lotserials_toprint = 0.
 
      /* CHANGE DOMAINS IF USING MULTI-DOMAINS TO LOCATE tr_hist */
      so_db = global_db.
      find si_mstr
         where si_domain = global_domain
          and  si_site = idh_site no-lock.
      if si_db <> so_db
      then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err_flag)" }
      end.
      assign
         sonbr  = idh_nbr
         soline = idh_line
         soinv  = idh_inv_nbr.
 
      {us/bbi/gprun.i ""soivrp1c.p""
         "(input table t_tr_hist1)"}
 
      /* RESET THE DOMAIN TO THE SALES ORDER DOMAIN */
      if si_db <> so_db
      then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err_flag)" }
      end.
 
   end. /* if print_lotserials */
 
   first_line = no.
 
   assign
      ext_price:format in frame d     = ext_price_fmt.
 
   /* Display sub-header for additional SOs on the invoice */
   if first-of(idh_nbr) and not first(idh_nbr)
   then do for ihhist:
 
      find ihhist
         where ihhist.ih_domain   = global_domain
           and  ihhist.ih_inv_nbr = idh_inv_nbr
           and  ihhist.ih_nbr     = idh_nbr
      no-lock no-error.
      if available ihhist
      then
         find ad_mstr
            where ad_domain = global_domain
             and  ad_addr   = ihhist.ih_ship
         no-lock no-error.
      do with frame subheada:
         /* SET EXTERNAL LABELS */
         setFrameLabels(frame subheada:handle).
         display
            skip(1)
            idh_nbr      label "Order"
            ad_name      label "Ship-To" when (available ad_mstr)
            ihhist.ih_po label "PO"      when (available ihhist)
         with frame subheada side-labels no-box.
      end. /* do with */
 
      if available ihhist 
         and ihhist.ih_fsm_type = "SC"
      then do:
         svremarks = getTermLabel("FOR_PERIOD",25) + ": "
            + string(ih_hist.ih_req_date,"99/99/99")
            + " " + getTermLabel("TO",10) + ": "
            + string(ihhist.ih_due_date,"99/99/99").
         put svremarks at 15.
 
         svremarks = getTermLabel("SERVICE_CONTRACT",30) + ": "
            + ihhist.ih_sa_nbr.
         put svremarks at 15.
         svremarks = "".
      end. /* IF ih_fsm_type = "SC" */
      put skip(1).
 
      {us/xf/xfivrp9amg.i} /*grc338*/
      if available ihhist and ihhist.ih_cmtindx <> 0
      then do:
         /*         put skip(1).  grc338*/
         /*grc338 comment begin
         run PrintHeaderComment(input ihhist.ih_cmtindx,
                                input vcPriHeadComment).
         grc338 comment end*/
         {us/xf/xfcmtprt.i &type=IN &id=ihhist.ih_cmtindx &rectype=H} /*grc338*/
        /*  put skip(1). grc338*/
      end. /* if available ihhist */
 
   end. /* if first-of(idh_nbr) */
 
   if idh_fsm_type = "FSM-RO"
   then do:
 
      /* ITM_DET SHOULD STILL EXIST, UNLESS THE CLOSED */
      /* CALL HAS BEEN MOVED TO HISTORY (FSCACLS.P)    */
      find itm_det
         where itm_domain = global_domain
          and  itm_nbr     = idh_nbr
          and  itm_prefix  = caprefix_c
          and  itm_type    = mfblank
          and  itm_line    = idh_line
      no-lock no-error.
      if not available itm_det
      then
         find itmh_hist
            where itmh_domain = global_domain
              and itmh_nbr    = idh_nbr
              and itmh_prefix = caprefix_c
              and itmh_type   = mfblank
              and itmh_line   = idh_line
         no-lock no-error.
 
      idh_qty_inv:label = getTermLabelRt("REPAIRED",8).
 
   end.    /* if idh_fsm_type = "FSM-RO" */
   else
 
      idh_qty_inv:label = getTermLabelRt("SHIPPED",8).
 
   /* WHERE AN EXCHANGE IS INCLUDED, THE NET PRICE COULD BE NEGATIVE*/
   /* FOR CALL INVOICES, WE DON'T ALWAYS PRINT THE PRICE BECAUSE,     */
   /* WHEN IT'S NOT A 'FIXED PRICE REPAIR' (MEANING WHENEVER PART     */
   /* NUMBER X GETS FIXED, IT COSTS $100, FOR EXAMPLE), SOD_PRICE IS  */
   /* THE TOTAL OF ALL LABOR/EXPENSES/PARTS USED IN THE REPAIR LESS   */
   /* EXCHANGE CREDITS, LESS CONTRACT COVERAGE.  AND, THAT PRICE IS   */
   /* FOR THE FULL QUANTITY OF PARTS REPAIRED - IT'S NOT A UNIT PRICE */
   /* SO, IT DOESN'T MAKE SENSE TO PRINT IT THAT WAY. HOWEVER, WHEN   */
   /* FIXED PRICE REPAIRS ARE BEING INVOICED, THE GROSS FIXED PRICE   */
   /* DOES PRINT IN THE 'PRICE' COLUMN.  THE NET PRICE DISPLAYED IS   */
   /* NET OF ANY EXCHANGE CREDIT GIVEN.                               */
 
   /* ALSO, FOR CALL INVOICES, AS WE DON'T REALLY 'SHIP' ANYTHING,    */
   /* THE QUANTITY OF INTEREST IS THE QUANTITY REPAIRED ON THE CALL   */
   /* LINE.  THEREFORE, PRINT THAT INSTEAD OF QTY TO INVOICE AND      */
   /* PRINT NO BACKORDER QUANTITY (BECAUSE THERE ISN'T ANY).          */
 
   if idh_fsm_type <> "FSM-RO"
   then
      assign
         ext_price:label in frame d     = getTermLabelRt("EXTENDED_PRICE",16)
         ext_price:label in frame dent  = getTermLabelRt("EXTENDED_PRICE",16).
   else
      assign
         ext_price:label in frame d     = getTermLabelRt("NET_PRICE",16)
         ext_price:label in frame dent  = getTermLabelRt("NET_PRICE",16).
 
   /* Label it "Shipped" */
   assign
      idh_qty_inv:label in frame d     = getTermLabelRt("SHIPPED",8)
      idh_qty_inv:label in frame dent  = getTermLabelRt("SHIPPED",8).
 
   /* Record the tax data for print */
   run RecordTaxData(input "16",
                     input if available ih_hist then ih_inv_nbr
                                                else idh_inv_nbr,                                    input idh_nbr,
                     input idh_line).
 
   /* Note it is still neccessary to give it a label below. */
   /* This provides room for the alternate labels above. */
 
   {us/xf/xfiv1amb.i} /**grc338*/
   /* PRINT LINE ITEMS */
   {us/xf/xfivrp9ams.i} /*grc338*/
   /***************grc338
   if isDomOrder
   then do:
       if ih__qadc05 <> "":U and 
          ih__qadc05 <> ?    and 
          num-entries(ih__qadc05,chr(4)) = 2
       then display idh_part @ ent_ord_line_part
                    idh_um   @ ent_ord_line_uom
                    absolute(idh_qty_inv) @ idh_qty_inv
                    qty_bo
                    idh_taxable
                    idh_price
                    ext_price        when (not auth_found)
                    ""               when (auth_found) @ ext_price
                    with frame dent.
       else display idh_part @ ent_ord_line_part
                    idh_um   @ ent_ord_line_uom
                    idh_qty_inv
                    qty_bo
                    idh_taxable
                    idh_price
                    ext_price        when (not auth_found)
                    ""               when (auth_found) @ ext_price
                    with frame dent.                    
 
 
      /* Only display the Enterprise Item data if the item id or uom are different */
      /* from the MFG/PRO values. Otherwise it would just be duplicate information  */
      if (ent_ord_line_part <> idh_part) or
         (ent_ord_line_uom <> idh_um)
      then do:
         down 1 with frame dent.
         if ih__qadc05 <> "":U and 
            ih__qadc05 <> ?    and 
            num-entries(ih__qadc05,chr(4)) = 2
         then display ent_ord_line_part
                      ent_ord_line_uom
                      absolute(  idh_qty_inv * conversion_factor) @ idh_qty_inv
                     (qty_bo * conversion_factor)               @ qty_bo
                     ""                                         @ idh_taxable
                     ""                                         @ idh_price
                     ""                                         @ ext_price
                     with frame dent.
 
      end. /* if isDomOrder */
 
   end.
   else do:
   /* start invoice certification */
      if ih__qadc05 <> "":U and 
         ih__qadc05 <> ?    and 
         num-entries(ih__qadc05,chr(4)) = 2
      then display 
             idh_part
             idh_um
             absolute(idh_qty_inv) 
                when (idh_fsm_type <> "FSM-RO")
                @ idh_qty_inv
                label "Invoiced"
             absolute(itm_qty_call)
                when (idh_fsm_type = "FSM-RO" and available itm_det)
                @ idh_qty_inv
             absolute(itmh_qty_call)
                when (idh_fsm_type = "FSM-RO" and available itmh_hist)
                @ idh_qty_inv
             qty_bo
                when (idh_fsm_type <> "FSM-RO")
             idh_taxable
             idh_price
                when (idh_fsm_type   <> "FSM-RO"
                or   (idh_fsm_type   = "FSM-RO"
                      and idh_fix_pr = no))
             idh_fixed_price
                when (idh_fsm_type = "FSM-RO" and idh_fix_pr)
                @ idh_price
             absolute(ext_price)
                when (not auth_found)
                @ ext_price
             ""
                when (auth_found) @ ext_price
          with frame d.
      else  display 
             idh_part
             idh_um
             idh_qty_inv label "Invoiced"
                when (idh_fsm_type <> "FSM-RO")
             itm_qty_call
                when (idh_fsm_type = "FSM-RO" and available itm_det)
                @ idh_qty_inv
             itmh_qty_call
                when (idh_fsm_type = "FSM-RO" and available itmh_hist)
                @ idh_qty_inv
             qty_bo
                when (idh_fsm_type <> "FSM-RO")
             idh_taxable
             idh_price
                when (idh_fsm_type   <> "FSM-RO"
                or   (idh_fsm_type   = "FSM-RO"
                      and idh_fix_pr = no))
             idh_fixed_price
                when (idh_fsm_type = "FSM-RO" and idh_fix_pr)
                @ idh_price
             ext_price
                when (not auth_found)
             ""
                when (auth_found) @ ext_price
          with frame d.
   end.   
   /* end invoice certification */
   grc338*/
 
 
 
   if rmaso and restock_amt <> 0
   then do:
      {us/xf/xfivrp9ami.i} /*grc338*/
      /*grc338
      {us/et/etivsa.i d dent}
 
      put
         {us/bbi/gplblfmt.i
            &FUNC=getTermLabelRtColon(""RESTOCKING_CHARGE"",17)}
            to 20 restock_pct restock_amt
         {us/bbi/gplblfmt.i
            &FUNC=getTermLabelRtColon(""LIST"",8)}
            to 48 restock_prc skip.
      * grc338*/
   end. /* if rmaso */
 
   /*grc338
   run PrintCustomerItem(input idh_custpart,
                         input 1).
   */
 
   /*grc338* {us/et/etivsa.i d dent} */
 
   /* IF WE HAVE A SERVICE CONTRACT AND THIS INVOICE WAS NOT CREATED */
   /* VIA CUSTOMER SCHEDULES, THEN GET THE SERVICE TYPE DESCRIPTION  */
   if sacontract
   then do:
 
      find first sv_mstr where sv_domain = global_domain
          and sv_code = idh_part
      no-lock no-error.
      if available sv_mstr then
         desc1 = sv_desc.
      else
         desc1 = "".
   end.
 
   /*grc338
   run PrintDescription(input desc1,
                        input true,
                        input false,
                        input 1).
 
   run PrintDescription(input desc2,
                        input false,
                        input true,
                        input 1).
   grc338*/
 
   if available soc_ctrl
      and soc_print_ship = yes
   then do:
      for each abs_mstr
         where abs_mstr.abs_domain   = global_domain
         and   abs_mstr.abs_order    = idh_nbr
         and   abs_mstr.abs_inv_nbr  = idh_inv_nbr
         and   abs_mstr.abs_line     = string(idh_line)
         and   abs_mstr.abs_shp_date <> ?
         and   abs_mstr.abs_type     = "s"
      no-lock
      break by abs_mstr.abs_id
            by abs_mstr.abs_line:
         if first(abs_mstr.abs_line)
         then do:
            abs_recno = recid(abs_mstr).
            {us/bbi/gprun.i ""sososhr6.p""}
            xab = getTermLabel("SHIPPER_NUMBER",20)
                  + ": " + substring(shipper_id,2)
                  + " "  + getTermLabel("DATE",10)
                  + ": " + string(shipper_date).
            put xab at 1 format "x(45)" skip.
         end. /* IF FIRST(abs_mstr.abs_line) */
      end. /* FOR EACH abs_mstr */
   end. /* IF AVAILABLE soc_ctrl AND ... */
 
   for first rbc_ctrl no-lock where rbc_domain = global_domain and rbc_print_inv_det:
      {us/bbi/gprun.i ""sorbrp01.p""
                        "(input idh_nbr,
                          input idh_inv_nbr,
                          input idh_part,
                          input isDomOrder)"}
   end.
   /***********************************************/
   /*              Repair Order                   */
   /***********************************************/
   if idh_fsm_type =  fsmro_c
   then do:
 
      if idh_serial <> ""
      then do:
         svremarks = " " + getTermLabelRtColon("SERIAL", 15) + " " + idh_serial.
      end. /* IF idh_serial <> ""  and (print_lotserials or call-detail) THEN DO ... */
 
      form
         svremarks             no-label
         skip(1)
         work-code   colon 16
         fwk_desc    colon 30  no-label
         sv_code     colon 16
         sv_desc     colon 30  no-label
         skip(1)
      with frame detaila  no-box side-labels width 80.
 
      /* SET EXTERNAL LABELS */
      setFrameLabels(frame detaila:handle).
 
      /*grc338* {us/et/etivsa.i d dent} */
 
      if available itm_det
      then do:
 
         work-code = itm_ca_int_type.
         find sv_mstr
            where sv_domain = global_domain
             and  sv_code   = itm_sv_code
             and  sv_type   = mfblank
         no-lock no-error.
      end.     /* if available itm_det */
      else do:
         if available itmh_hist
         then
            work-code = itmh_ca_int_type.
         else
            work-code = mfblank.
         if available itmh_hist
         then
            find sv_mstr
               where sv_domain = global_domain
                and  sv_code   = itmh_sv_code
                and  sv_type   = mfblank
            no-lock no-error.
      end.   /* else do, not available itm_det, do */
 
      if work-code <> mfblank
      then do:
 
         find fwk_mstr
            where fwk_domain = global_domain
              and fwk_ca_int_type = work-code
         no-lock no-error.
         /*grc338
         display
            svremarks       when (svremarks <> "")
            work-code
            fwk_desc        when (available fwk_mstr)
            sv_code         when (available sv_mstr)
            sv_desc         when (available sv_mstr)
         with frame detaila.
         grc338*/
         {us/xf/xfivrp9amj.i} /*grc338*/
      end.   /* if work-code <> mfblank */
 
      if call-detail
      then do:
         /*grc338 add begin*/
         assign
            tot_tax = 0
            tot_ex_tax = 0.
         /*grc338 add end*/
         assign
            sfb-line-count = 0
            total-price    = 0
            total-covered  = 0
            total-billable = 0.
 
         /* IF PRINTING CALL DETAIL, PRINT THE LOWER LEVEL */
         /* DETAILS (SFH-HIST = BILLING DETAIL) RELATED TO */
         /* THIS REPAIR LINE.  THIS DETAIL IS THE PARTS,   */
         /* LABOR AND EXPENSES INVOLVED IN THIS REPAIR.    */
         for each sfh_hist  no-lock
            where sfh_domain = global_domain
              and sfh_nbr     = idh_nbr
              and sfh_so_line = idh_line
              and sfh_inv_nbr = idh_inv_nbr
         break by sfh_pt_type
               by sfh_fis_sort
               by sfh_line:
 
            /* SFH_DETAIL INDICATES WE WILL PRINT EVERY   */
            /* UNIQUE DETAIL OF THE REPAIR ACTIVITY,      */
            /* INSTEAD OF SUMMARIZING BY INVOICE SORT     */
            /* (WHERE INVOICE SORT WOULD BE SOMETHING LIKE*/
            /* PARTS, LABOR, TRAVEL EXPENSE...)           */
 
            /* IF NOT SFH_DETAIL THEN ACCUMULATE TOTAL PRICE */
            /* LESS ANY EXCHANGE AMOUNT (ITEMS ONLY) AND     */
            /* TOTAL COVERED AMOUNT FOR THE INVOICE SORT AND */
            /* PRINT ONE DETAIL LINE ONLY WHEN WE GET TO THE */
            /* LAST ONE... */
 
            find tt_tax where tt_sfb = recid(sfh_hist) no-error. /*grc338*/
            if sfh_detail         and
               first-of(sfh_fis_sort)
            then do:
 
               /* SO, IF WE'RE PRINTING "DETAIL", PRINT A     */
               /* HEADING LINE WHEN WE HIT A NEW INVOICE SORT */
              /*grc338  {us/et/etivsa.i d dent} */
 
               down 1 with frame e-hist.
 
               put
                  {us/bbi/gplblfmt.i &FUNC=getTermLabel(""TYPE"",8)
                              &CONCAT="': '"} at 30
                  sfh_fis_sort.
                  {us/xf/xfivrp9amk.i} /*grc338*/
            end.    /* if sfh_detail and... */
 
            billable-amt  = sfh_price * sfh_qty_req .
 
            run mcpl-mc-curr-rnd
               (input-output billable-amt,
                 input rndmthd,
                 output mc-error-number).
 
            billable-amt  = billable-amt - sfh_covered_amt.
 
            if sfh_detail
            then do:
               {us/xf/xfivrp9amta.i} /*grc338*/
               /*****************************************/
               /* IF THIS IS A FIXED PRICE BILLING THEN */
               /* WE DON'T WANT TO PRINT THE PRICE      */
               /*****************************************/
               if idh_fix_pr
               then
                  display-price = no.
               else
                  display-price = yes.
 
            /*grc338   {us/et/etivsa.i d dent} */
 
               /* FOR ALL BUT RETURNS/EXCHANGES PRINT LIKE THIS: */
               if sfh_qty_ret = 0
               then do:
                  {us/xf/xfivrp9aml.i} /*grc338*/
 
                  /*grc338
                  /* FOR PARTS, PRINT PART NUMBER @ DESCRIPTION,
                  ELSE, PRINT SERVICE CATEGORY */
                  display
                     sfh_part      when (sfh_pt_type = 0)  @ sfh_desc
                     sfh_fsc_code  when (sfh_pt_type <> 0) @ sfh_desc
                     sfh_line
                     sfh_qty_req
                     sfh_price     when (display-price)
                     billable-amt  when (display-price)
                  with frame e-hist.
 
                  down 1 with frame e-hist.
 
                  if display-price
                  then do:
 
                     display
                        (- sfh_covered_amt) @ sfh_price
                        sfh_desc
                        sfh_fcg_code    when (not idh_fix_pr)
                                        @ sfh_qty_req
                     with frame e-hist.
                     down 1 with frame e-hist.
                  end.  /* if display-price */
 
                  else
                  if sfh_desc > "" or not idh_fix_pr
                  then do:
 
                     display
                        sfh_desc
                        sfh_fcg_code    when (not idh_fix_pr)
                                        @ sfh_qty_req
                     with frame e-hist.
                     down 1 with frame e-hist.
                  end.    /* if sfh_desc > ""... */
                 grc338*/
               end.    /* if sfh_qty_ret = 0 */
               /*  grc338*
               else do:
                  /* IF THE REPAIR INCLUDED AN EXCHANGE FROM THE */
                  /* CUSTOMER (I.E. WE GAVE HIM SOME CREDIT FOR  */
                  /* THE BROKEN PART THAT HE RETURNED), PRINT    */
                  /* THAT DETAIL ALSO.                           */
                  display
                     sfh_part          @ sfh_desc
                     sfh_line
                     (- sfh_qty_ret)   @ sfh_qty_req
                     (- sfh_exg_price) when (sfh_exchange)
                                       @ sfh_price
                     (- sfh_exg_price) when (sfh_exchange)
                                       @ billable-amt
                  with frame e-hist.
                  down 1 with frame e-hist.
                  display
                     sfh_desc
                     getTermLabel("EXCHANGE",10)  when (sfh_exchange)
                                                  @ sfh_qty_req
                     getTermLabel("RETURN",10)    when (not sfh_exchange)
                                                  @ sfh_qty_req
                  with frame e-hist.
                  down 1 with frame e-hist.
 
               end. /* else, sfh_qty_ret <> 0, do  */
               *********grc338 ****/
 
               /* PRINT COMMENTS FOR THE SFH_HISTS ALSO */
               /*grc338 comment begin
               put skip(1).
               run PrintLineComment(input sfh_cmtindx,
                                    input vcPriLineComment).
               grc338 comment end*/
               {us/xf/xfcmtprt.i &type=IN &id=sfh_cmtindx &rectype=N} /*grc338*/
            end.  /* if sfh_detail */
 
            else do:
 
               /* FOR FIXED PRICE LINES, WE WON'T PRINT ANY PRICES */
               /* AND, IF WE'RE NOT PRINTING ANY DETAIL, SAVE      */
               /* OURSELVES THE OVERHEAD OF ALL THIS. */
               if not idh_fix_pr
               then do:
 
                  tmp_amt = (sfh_price * sfh_qty_req).
 
                  run mcpl-mc-curr-rnd
                     (input-output tmp_amt,
                      input rndmthd,
                      output mc-error-number).
                  {us/xf/xfivrp9amta.i} /*grc338*/
                  /* ACCUMULATE AMOUNTS FOR THIS INVOICE SORT */
                  assign
                     total-covered  = total-covered + sfh_covered_amt
                     total-price    = total-price  + tmp_amt
                     total-billable = total-billable + billable-amt.
                  if sfh_exchange
                  then do:
 
                     assign
                        tmp_amt        = (sfh_exg_price * sfh_qty_ret)
                        total-exchange = total-exchange + tmp_amt.
 
                     run mcpl-mc-curr-rnd
                        (input-output tmp_amt,
                         input rndmthd,
                         output mc-error-number).
 
                  end.    /* if sfh_exchange */
 
                  if last-of (sfh_fis_sort)
                  then do:
 
                     /* PRINT THE INVOICE SORT HEADING */
                  /*grc338* {us/et/etivsa.i d dent} */
 
                     down 1 with frame e-hist.
 
                     put
                        {us/bbi/gplblfmt.i &FUNC=getTermLabel(""TYPE"",8)
                                    &CONCAT="': '"} at 30
                        sfh_fis_sort.
                   /*grc338*  {us/et/etivsa.i d dent} */
                     {us/xf/xfivrp9amk.i} /*grc338*/
 
                     /* ROUND INVOICE SORT TOTAL AMOUNTS */
                     run mcpl-mc-curr-rnd
                        (input-output total-covered,
                          input rndmthd,
                          output mc-error-number).
 
                     run mcpl-mc-curr-rnd
                        (input-output total-price,
                          input rndmthd,
                          output mc-error-number).
 
                     run mcpl-mc-curr-rnd
                        (input-output total-billable,
                          input rndmthd,
                          output mc-error-number).
 
                     run mcpl-mc-curr-rnd
                        (input-output total-exchange,
                         input rndmthd,
                        output mc-error-number).
 
                     /* DISPLAY TOTALS FOR THE INVOICE SORT */
                     sfb-line-count = sfb-line-count + 1.
                     find fis_mstr
                        where fis_domain = global_domain
                         and  fis_sort = sfh_fis_sort
                     no-lock.
                     /*grc338
                     display
                        sfb-line-count  @ sfh_line
                        fis_desc        @ sfh_desc
                        total-price     @ sfh_price
                        total-billable  @  billable-amt
                     with frame e-hist.
                     down 1 with frame e-hist.
                     display
                        getTermLabel("COVERED_AMOUNT",24)  @ sfh_desc
                        (- total-covered) @ sfh_price
                     with frame e-hist.
                     down 1 with frame e-hist.
                     grc338*/
                     if total-exchange <> 0
                     then do:
 
                        /*grc338
                        display
                           getTermLabel("EXCHANGES",24)    @ sfh_desc
                           (- total-exchange) @ sfh_price
                           (- total-exchange) @ billable-amt
                        with frame e-hist.
                        down 1 with frame e-hist.
                        grc338*/
                     end.   /* if total-exchange <> 0 */
 
                     /*grc338 add begin*/
                     {us/xf/xfivrp9amu.i}
                     assign
                        tot_tax    = 0
                        tot_ex_tax = 0.
                     /*grc338 add end*/
                     assign
                        total-price    = 0
                        total-covered  = 0
                        total-billable = 0
                        total-exchange = 0.
 
                  end.    /* if last-of (sfh_fis_sort) */
 
               end.    /* if not idh_fix_pr */
 
            end.  /* else, not sfh_detail, do */
 
         end. /********* for each sfh_hist ******/
 
      end.   /* if call-detail */
 
   end.   /* if idh_fsm_type = fsmro_c */
 
   /* PRINT THE SERVICE CONTRACT INFO ON THE INVOICE IF WE HAVE A
      CONTRACT AND THIS IS NOT AN INVOICE FROM CUSTOMER SCHEDULES */
   if sacontract
   then do for ihhist:
 
      find ihhist
         where  ihhist.ih_domain  = global_domain
         and    ihhist.ih_inv_nbr = idh_inv_nbr
         and    ihhist.ih_nbr     = idh_nbr
      no-lock no-error.
      if available ihhist
      then do:
 
         if idh_req_date <> ihhist.ih_req_date or
            idh_due_date <> ihhist.ih_due_date
         then do:
 
            svremarks = getTermLabel("FOR_PERIOD",25) + ": "
                      + string(idh_req_date,"99/99/99")
                      + " " + getTermLabel("TO",10) + ": "
                      + string(idh_due_date,"99/99/99").
 
            {us/xf/xfivrp9amo.i} /*grc338*/
	    /*grc338
            put svremarks at 15.
	    */
         end.
      end.  /* if avail ihhist */
 
      /*grc338
      {us/et/etivsa.i d dent}
      */
 
      /* If the item under contract has a modified desc use */
      /* it. Else use the ISB desc, then the part desc.     */
      desc1 = idh_desc.
      if desc1 = "" and available ihhist
      then do:
 
         find isb_mstr where isb_domain = global_domain
            and isb_eu_nbr = ihhist.ih_ship
            and isb_part   = idh_for
            and isb_serial = idh_serial
            and isb_ref    = idh_ref
         no-lock no-error.
 
         if available isb_mstr and isb_desc1 <> "" then
            desc1 = isb_desc1.
 
      end.  /* if desc1 = ""... */
 
      if desc1 = ""
      then do:
 
         find pt_mstr where pt_domain = global_domain
             and pt_part = idh_for
         no-lock no-error.
         if available pt_mstr then
            desc1 = pt_desc1.
 
      end.  /* if desc1 = "" */
 
      svremarks = idh_for + " " + desc1.
 
      if idh_serial      <> "" and
         print_lotserials = no
      then
         svremarks = svremarks + getTermLabelRtColon("SERIAL",15) + " " + idh_serial.
 
      /* grc338
      {us/et/etivsa.i d dent}
 
      put svremarks at 3 skip.
      */
      {us/xf/xfivrp9amo.i} /*grc338*/
 
      if idh_qty_per  > 1 or
         idh_qty_item > 1
      then do:
 
         /*grc338
         {us/et/etivsa.i d dent}
 
         put
            {us/bbi/gplblfmt.i &FUNC=getTermLabel(""UNITS"",5)
                        &CONCAT="' '"}   at  3
            idh_qty_item       at  9
 
            " x " +
            {us/bbi/gplblfmt.i &FUNC=getTermLabel(""PERIODS"",7)
                        &CONCAT="' '"}   at 24
            idh_qty_per        at 35
 
            " = "
            {us/bbi/gplblfmt.i &FUNC=getTermLabel(""SHIPPED"",7)
                        &CONCAT="' '"}   at 47
            idh_qty_inv        at 58.
          ***grc338 */
         {us/xf/xfivrp9amo.i} /*grc338*/
      end.  /* if qty_per or qty_item > 1 */
 
   end.  /* if sacontract */
 
   if idh_contr_id <> ""
      and (idh_sched or rmaso)
   then do:
 
      /*grc338
      {us/et/etivsa.i d dent}
 
      /* MODIFIED PRINT OF 'PURCHASE ORDER' TO ONLY PRINT IF THIS
      INVOICE WAS CREATED VIA CUSTOMER SCHEDULES.
      ACTUALLY, PRINT IF NOT A SERVICE CONTRACT INVOICE. */
 
      /* PRINT THE PO NUMBER IF A SCHEDULED ORDER INVOICE,   */
      /* ELSE PRINT THE SERVICE CONTRACT FOR AN RMA INVOICE. */
      if idh_sched
      then
         put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""PURCHASE_ORDER"",15)
                         &CONCAT="':'"} at 1
             idh_contr_id at 20.
      else
         put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""SERVICE_CONTRACT"",16)
                         &CONCAT="':'"} at 1
             idh_contr_id at 20.
      *grc338*/
 
      {us/xf/xfivrp9amob.i} /*grc338*/
      /* FIND CORRECT SCHEDULE ORDER WITH SALES ORDER # AND LINE # */
      find scx_ref where scx_domain = global_domain
          and scx_order  = idh_nbr
          and scx_line   = idh_line
      no-lock no-error.
      if available scx_ref
      then do:
 
         /* DISPLAY CUSTOMER REF IF NOT NULL AND DIFFERENT FROM CUST PART */
         if scx_custref <> "" and scx_custref <> idh_custpart
         then
            put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""CUSTOMER_REFERENCE"",16)
                            &CONCAT="':'"} at 1
                   scx_custref at 20.
         /* DISPLAY MODEL YEAR IF NOT NULL */
         if scx_modelyr <> "" then
            put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""MODEL_YEAR"",16)
                            &CONCAT="':'"} at 1
                   scx_modelyr at 20.
      end.
 
   end. /* if idh_contr_id */
 
   /* CHANGE DOMAINS IF USING MULTI-DOMAINS TO LOCATE tr_hist */
   so_db = global_db.
   find si_mstr where si_domain = global_domain
       and si_site = idh_site
   no-lock.
   if si_db <> so_db
   then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err_flag)" }
   end.
 
   assign
      sonbr  = idh_nbr
      soline = idh_line
      soinv  = idh_inv_nbr
      sopart = idh_part.
 
   if print_lotserials and lotserials_toprint <> 0
   then do:
 
      /*grc338 comment begin
      {us/et/etivsa.i d dent}
 
      put
         getTermLabelRtColon("LOT/SERIAL_NUMBERS_SHIPPED",27)
         + " " + getTermLabelRt("QUANTITY",6) + " "
         + getTermLabelRt("EXPIRE",8) at 3 format "x(43)"
         {us/bbi/gplblfmt.i &FUNC=getTermLabelRt(""REFERENCE"",13)}
         skip.
 
      /* CHANGE DOMAINS IF USING MULTI-DOMAINS TO LOCATE tr_hist */
      {us/bbi/gprun.i ""soivrp1d.p""
         "(input table t_tr_hist1)"}
 
      grc338 comment end*/
      {us/bbi/gprun.i ""xfivrp1d.p"" "(input table t_tr_hist1)"} /*grc338*/
   end. /* if print_lotserials */
 
   /* CALL ROUTINE SOAUTH.P FOR SCHEDULE ORDERS ONLY */
   /* WHEN 'INVOICE BY AUTHORIZATION' IS 'YES'       */
   if idh_sched
      and idh__qadc06 = "yes"
   then do:
      /* ROUTINE TO PRINT AUTHORIZATION NUMBER AND PEGGED QTY */
     /*grc338 {us/bbi/gprun.i ""soauth.p""} */
      {us/bbi/gprun.i ""xfauth.p""} /*grc338*/
   end. /* IF IDH_SCHED */
 
   /* RESET THE DOMAIN TO THE SALES ORDER DOMAIN */
   if si_db <> so_db
   then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err_flag)" }
   end.
 
   /********************************************
   ibh_serial subfield positions:
   1-4     operation number
   5-10    scrap percent
   11-14   id number of this record
   15-15   structure code
   16-16   "y" (indicates "new" format sob_det record)
   17-34   original qty per parent
   35-35   original mandatory indicator (y/n)
   36-36   original default indicator (y/n)
   37-39   leadtime offset
   *******************************************/
 
   if print_options and
      can-find(first ibh_hist where ibh_domain  = global_domain
                                and ibh_inv_nbr = ih_hist.ih_inv_nbr
                                and ibh_line    = idh_line
                                and ibh_nbr     = ih_hist.ih_nbr)
   then do:
      /* PRINT DISCOUNTS FOR THE PARENT ITEM */
      /*grc338 comment begin
      {us/so/sopiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
         &line=idh_line &part=idh_part
         &parent="""" &feature="""" &opt=""""
         &qty=idh_qty_inv &list_price=idh_list_pr
         &net_price=idh_price
         &confg_disc="no"
         &command="~{us/so/soivcmd.i~}"}
      grc338 comment end*/
 
      /*grc338 add begin*/
      {us/xf/xfpiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
         &line=idh_line &part=idh_part
         &parent="""" &feature="""" &opt=""""
         &qty=idh_qty_inv &list_price=idh_list_pr
         &net_price=idh_price
         &confg_disc="no"}
      /*grc338 add end*/
      find first ibh_hist
         where ibh_domain  = global_domain
           and ibh_inv_nbr = ih_hist.ih_inv_nbr
           and ibh_line    = idh_line
           and ibh_nbr     = ih_hist.ih_nbr
      no-lock no-error.
 
      /* NEW STYLE ibh_hist RECORDS DO NOT HAVE DATA IN ibh_parent
      THAT CORRESPONDS TO A pt_part RECORD.  THEY CONTAIN A
      SYMBOLIC REFERENCE IDENTIFIED BY BYTES 11-14 IN ibh_serial.
      NEW STYLE ibh_hist RECORDS ARE FOR SALES ORDERS CREATED
      SINCE PATCH GK60. */
 
      if substring(ibh_serial, 16, 1) = "Y"
      then do:
       /*grc338*  {us/bbi/gprun.i ""soivrp1f.p"" "(input """", */
         /*grc338*/ {us/bbi/gprun.i ""xfivrp1f.p"" "(input """",
                                   input 0,
                                   input idh_nbr,
                                   input idh_line,
                                   input print_lotserials)"}
      end.
      else do:
         for each ibh_hist
            where ibh_domain = global_domain
             and (ibh_inv_nbr = ih_hist.ih_inv_nbr
             and  ibh_nbr = ih_hist.ih_nbr
             and  ibh_line = idh_line
             and (ibh_parent = idh_part or ibh_parent = "")
             and  ibh_qty_req <> 0)
         no-lock:
 
            if idh_qty_ord = 0
            then
               sob-qty = 0.
            else
               sob-qty = ibh_qty_req / idh_qty_ord.
            assign
               ibh_desc  = ""
               ibh_desc2 = "".
            find pt_mstr
               where pt_domain = global_domain
                and  pt_part = ibh_part
            no-lock no-error.
            if available pt_mstr
            then
               assign
                  ibh_desc  = pt_desc1
                  ibh_desc2 = pt_desc2
                  ibh_um    = pt_um.
 
            /*grc338
            {us/et/etivsa.i d dent}
 
            put
               ibh_feature format "x(12)" at 5
               " " ibh_part
               sob-qty
               " " ibh_um.
 
            run PrintDescription(input ibh_desc,
                                 input false,
                                 input false,
                                 input 20).
 
            run PrintDescription(input ibh_desc2,
                                 input false,
                                 input true,
                                 input 20).
              grc338*/
 
            /* PRINT DISCOUNTS FOR COMPONENT ITEM */
            /*grc338 comment begin
            {us/so/sopiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
               &line=idh_line &part=idh_part
               &parent=ibh_parent
               &feature="substring(ibh_feature,1,12)"
               &opt=ibh_part
               &qty="(sob-qty * idh_qty_inv)"
               &list_price=ibh_tot_std
               &net_price=ibh_price
               &confg_disc="no"
               &command="~{us/so/soivcmd.i~}"}
            grc338 comment end*/
            /*grc338 add begin*/
            {us/xf/xfpiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
               &line=idh_line &part=idh_part
               &parent=ibh_parent
               &feature="substring(ibh_feature,1,12)"
               &opt=ibh_part
               &qty="(sob-qty * idh_qty_inv)"
               &list_price=ibh_tot_std
               &net_price=ibh_price
               &confg_disc="no"}
            /*grc338 add end*/

            if print_lotserials
            then do:
               for first sod_det
                  where sod_domain      = global_domain
                  and   sod_nbr         = idh_nbr
                  and   sod_line        = idh_line
               no-lock:
               end. /* FOR FIRST sod_det */
               if available sod_det
               then do:
                  if sod_consignment = no
                  then do:
                     /*grc338
                     {us/so/solotspr.i}
                      */ {us/xf/xfsolotspr.i} 
                  end. /* IF sod_consignment = no */ 
               end. /* IF AVAILABLE sod_det */
               else do:
                  if not can-find(first cncix_mstr
                                     where cncix_domain   = global_domain
                                     and   cncix_so_nbr   = idh_nbr
                                     and   cncix_sod_line = idh_line)
                     and not can-find(first cncu_mstr
                                         where cncu_domain   = global_domain
                                         and   cncu_so_nbr   = idh_nbr
                                         and   cncu_sod_line = idh_line)
                  then do:
                     /*grc338
                     {us/so/solotspr.i}
                      */ {us/xf/xfsolotspr.i} 
                  end. /* IF NOT CAN-FIND(FIRST cncix_mstr AND ... */
               end. /* IF NOT AVAILABLE sod_det */
            end. /* IF print_lotserials */
 
         end. /* for each */
      end. /* else do */
 
   end. /* if printoptions */
 
   /* TEST FOR CONFIGURED PARENT WITHOUT COMPONENTS */
 
   if available pt_mstr
   then do:
 
      pm_code = pt_pm_code.
      find ptp_det
         where ptp_domain = global_domain
          and  ptp_part = idh_part
          and  ptp_site = idh_site
      no-lock no-error.
      if available ptp_det
      then
         pm_code = ptp_pm_code.
      if pm_code = "C" and
         not can-find(first ibh_hist where ibh_domain   = global_domain
                                      and  ibh_inv_nbr  = idh_inv_nbr
                                      and  ibh_line     = idh_line
                                      and  ibh_nbr      = idh_nbr)
      then do:
 
         /*grc338 comment begin
         {us/so/sopiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
            &line=idh_line &part=idh_part
            &parent="""" &feature="""" &opt=""""
            &qty=idh_qty_inv &list_price=idh_list_pr
            &net_price=idh_price
            &confg_disc="no"
            &command="~{us/so/soivcmd.i~}"}
         grc338 comment end*/
         /*grc338 add begin*/
         {us/xf/xfpiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
            &line=idh_line &part=idh_part
            &parent="""" &feature="""" &opt=""""
            &qty=idh_qty_inv &list_price=idh_list_pr
            &net_price=idh_price
            &confg_disc="no"}
         /*grc338 add end*/
      end.
   end. /* if available pt_mstr */
 
   /* PRINT GLOBAL DISCOUNT FOR ITEM/CONFIGURATION */
   /*grc338 comment begin
   {us/so/sopiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
      &line=idh_line &part=idh_part
      &parent="""" &feature="""" &opt=""""
      &qty=idh_qty_inv &list_price=idh_list_pr
      &net_price=idh_price
      &confg_disc="yes"
      &command="~{us/so/soivcmd.i~}"}
   grc338 comment end*/
   /*grc338 add begin*/
   {us/xf/xfpiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
      &line=idh_line &part=idh_part
      &parent="""" &feature="""" &opt=""""
      &qty=idh_qty_inv &list_price=idh_list_pr
      &net_price=idh_price
      &confg_disc="yes"}
   /*grc338 add end*/

   if idh_cmtindx <> 0 then
   do:
      put skip(1).
      /*grc338 comment begin
      run PrintLineComment(input idh_cmtindx,
                           input vcPriLineComment).
      grc338 comment end*/
   end.
    /*grc338
   put skip(1).
     */
   {us/xf/xfcmtprt.i &type=IN &id=idh_cmtindx &rectype=D} /*grc338*/
 
   if using_line_charges
   then do:
 
      /* GET TOTALS FOR LINE CHARGES */
      {us/gp/gprunmo.i
         &module = "ACL"
         &program = ""soivlcrp.p""
         &param = """(input idh_inv_nbr,
                      input idh_nbr,
                      input idh_line,
                      input ih_ship,
                      input ih_site,
                      input no,
                      input '',
                      input '',
                      input '',
                      input '',
                      input '',
                      input-output line_charge_tot)"""}
      run ip_line_charges
         (input idh_nbr,
          input idh_inv_nbr,
          input idh_line,
          input-output l_nontax_amt,
          input-output l_tax_amt).
 
   end.
 
   if last-of(idh_nbr) and using_container_charges
   then do:
 
      /* GET TOTALS FOR CONTAINER CHARGES */
      {us/gp/gprunmo.i
         &module = "ACL"
         &program = ""soivccrp.p""
         &param = """(input ih_inv_nbr,
                      input idh_nbr,
                      input ih_ship,
                      input ih_site,
                      input no,
                      input '',
                      input '',
                      input '',
                      input '',
                      input '',
                      input-output container_charge_tot)"""}
 
 
   end.
   if using_container_charges
   then do:
      run ip_container_charges
            (input idh_nbr,
             input idh_inv_nbr,
             input idh_line,
             input-output l_nontax_amt,
             input-output l_tax_amt).
   end. /* IF using_container_charges */
 
   {us/mf/mfrpchk.i}
 
end. /* for each idh_hist */
 
empty temp-table t_tr_hist1.
 
/* CUSTOMER SEQUENCE SCHEDULES INSTALLED? */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'enable_sequence_schedules',
     input '',
     input '',
     input 'rcf_ctrl',
     output using_sequence_schedules)"}
 
if using_sequence_schedules
then do:
 
   /* CHANGE DOMAIN TO LOCATE abss_det */
   so_db = global_db.
   find si_mstr
      where si_domain = global_domain
       and  si_site = ih_site
   no-lock.
   if si_db <> so_db
   then do:
 
      {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err_flag)" }
   end.
 
   if err_flag <> 0 and err_flag <> 9
   then do:
      /* DOMAIN # IS NOT AVAILABLE */
      {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=getTermLabel(""'FOR_CUSTOMER_SEQUENCES'"",30)}
   end.
   else do:
      /* PRINT SEQUENCE RANGE LIST ON INVOICE */
      {us/gp/gprunmo.i
         &program=""rcsqps.p""
         &module="ASQ"
         &param="""(input ih_inv_nbr)"""}
 
      /* RESET THE DOMAIN TO THE SALES ORDER DOMAIN */
      if si_db <> so_db
      then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err_flag)" }
      end.
   end.  /* else do */
 
end.  /* if can-find (mfc_ctrl where ... */
 
PROCEDURE mcpl-mc-curr-rnd:
/*-----------------------------------------------------------------------
   Purpose:      To round an amount using given rounding method
 
   Parameters:   1. input-output  io_amount Amount to be converted
                 2. input i_rndmthd Rounding Method
                 3. output o_error error number (if any error found)
 
   Note:         Procedure created to remove Error "Action Segment has exceeded
                 its limit of 63488 bytes".
-------------------------------------------------------------------------*/
 
    define input-output parameter io_amount   like ar_amt    no-undo.
    define input parameter i_rndmthd          like rndmthd   no-undo.
    define output parameter o_error           as integer     no-undo.
 
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output io_amount,
        input i_rndmthd,
        output o_error)"}
 
END PROCEDURE. /* mcpl-mc-curr-rnd */
 
PROCEDURE ip_line_charges:
   define input        parameter p_idh_nbr     like idh_nbr     no-undo.
   define input        parameter p_idh_inv_nbr like idh_inv_nbr no-undo.
   define input        parameter p_idh_line    like idh_line    no-undo.
   define input-output parameter l_nontax_amt  like ih_trl2_amt no-undo.
   define input-output parameter l_tax_amt     like ih_trl2_amt no-undo.
 
   if can-find(first absl_det
      where absl_domain    = global_domain
      and   absl_order     = p_idh_nbr
      and   absl_ord_line  = p_idh_line)
   then do:
      for each absl_det
         where absl_domain   = global_domain
         and   absl_order    = p_idh_nbr
         and   absl_ord_line = p_idh_line
         and  (absl_inv_nbr = "" or absl_inv_nbr = p_idh_inv_nbr)
         and   absl_confirm  = yes
         and   absl_inv_post = yes
      no-lock:
         for first trl_mstr
            where trl_domain = global_domain
            and   trl_code   = absl_trl_code
         no-lock:
         end. /* FOR FIRST trl_mstr */
         if available trl_mstr
         then do:
               if trl_taxable
               then
                  l_tax_amt    = l_tax_amt    + absl_ext_price.
               else
                  l_nontax_amt = l_nontax_amt + absl_ext_price.
         end. /*IF AVAILABLE trl_mstr */
      end. /* FOR EACH absl_det */
   end. /* IF CAN-FIND absl_det */
   else if not available absl_det
   then do:
      for each idhlc_hist
         where idhlc_domain  = global_domain
         and   idhlc_nbr     = p_idh_nbr
         and   idhlc_inv_nbr = p_idh_inv_nbr
         and   idhlc_line    = p_idh_line
      no-lock:
         for first trl_mstr
            where trl_domain = global_domain
            and   trl_code   = idhlc_trl
         no-lock:
            if trl_taxable
            then
               l_tax_amt     = l_tax_amt    + idhlc_price.
            else
               l_nontax_amt  = l_nontax_amt + idhlc_price.
         end. /* FOR FIRST trl_mstr */
      end. /* FOR EACH idhlc_det*/
   end. /* ELSE if not available absl_det */
END PROCEDURE. /* ip_line_charges */
 
PROCEDURE ip_container_charges:
   define input parameter  p_idh_nbr           like idh_nbr     no-undo.
   define input parameter  p_idh_inv_nbr       like idh_inv_nbr no-undo.
   define input parameter  p_idh_line          like idh_line    no-undo.
   define input-output parameter l_nontax_amt  like ih_trl2_amt no-undo.
   define input-output parameter l_tax_amt     like ih_trl2_amt no-undo.
 
   for each abscc_det
      where  abscc_domain    = global_domain
      and    abscc_order     = p_idh_nbr
      and    abscc_ord_line  = p_idh_line
      and   (abscc_inv_nbr  = "" or abscc_inv_nbr = p_idh_inv_nbr)
      and    abscc_confirm   = yes
      and    abscc_inv_post  = yes
   no-lock:
      if abscc_taxable       = yes
      then
         l_tax_amt           = l_tax_amt    + (abscc_cont_price * abscc_qty).
      else
         l_nontax_amt        = l_nontax_amt + (abscc_cont_price * abscc_qty).
      end. /* FOR EACH abscc_det */
END PROCEDURE. /* ip_container_charges */
 
/* Procedures of Print Settings */
{us/so/soprprc2.i &PageEnd="us/so/soivcmd.i"}
