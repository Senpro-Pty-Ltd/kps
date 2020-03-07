/* xxsosoisa.p - SALES ORDER SHIPMENT WITH SERIAL NUMBERS                     */
/* sosoisa.p - SALES ORDER SHIPMENT WITH SERIAL NUMBERS                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsosoisa.p,v 1.2 2018/03/13 17:10:01 gbg Exp $: */
/* REVISION: 6.0         LAST MODIFIED: 04/16/90   BY: WUG *D002*             */
/* REVISION: 6.0         LAST MODIFIED: 04/30/90   BY: MLB *D021*             */
/* REVISION: 6.0         LAST MODIFIED: 07/06/90   BY: EMB *D040*             */
/* REVISION: 6.0         LAST MODIFIED: 01/15/91   BY: emb *D313*             */
/* REVISION: 6.0         LAST MODIFIED: 03/18/91   BY: MLB *D443*             */
/* REVISION: 6.0         LAST MODIFIED: 04/02/91   BY: WUG *D472*             */
/* REVISION: 6.0         LAST MODIFIED: 04/03/91   BY: afs *D477*             */
/* REVISION: 6.0         LAST MODIFIED: 05/07/91   BY: emb *D643*             */
/* REVISION: 6.0         LAST MODIFIED: 05/28/91   BY: emb *D661*             */
/* REVISION: 6.0         LAST MODIFIED: 09/19/91   BY: afs *F040*             */
/* REVISION: 7.0         LAST MODIFIED: 10/30/91   BY: pma *F003*             */
/* REVISION: 7.0         LAST MODIFIED: 11/13/91   BY: WUG *D887*             */
/* REVISION: 7.0         LAST MODIFIED: 11/29/91   BY: SAS *F017*             */
/* REVISION: 7.0         LAST MODIFIED: 01/30/92   BY: WUG *F110*             */
/* REVISION: 7.0         LAST MODIFIED: 05/11/92   BY: afs *F459*             */
/* REVISION: 7.0         LAST MODIFIED: 06/09/92   BY: tjs *F504*             */
/* REVISION: 7.0         LAST MODIFIED: 06/25/92   BY: sas *F595*             */
/* REVISION: 7.3         LAST MODIFIED: 09/27/92   BY: jcd *G247*             */
/* REVISION: 7.3         LAST MODIFIED: 04/02/93   BY: WUG *G898*             */
/* REVISION: 7.3         LAST MODIFIED: 04/13/93   BY: WUG *G946*             */
/* REVISION: 7.3         LAST MODIFIED: 04/20/93   BY: WUG *G982*             */
/* REVISION: 7.3         LAST MODIFIED: 06/15/93   BY: sas *GC18*             */
/* REVISION: 7.3         LAST MODIFIED: 11/01/93   BY: afs *GG84*             */
/* REVISION: 7.3         LAST MODIFIED: 11/11/93   BY: afs *GH18*             */
/* REVISION: 7.2         LAST MODIFIED: 01/27/94   BY: afs *FL76*             */
/* REVISION: 7.3         LAST MODIFIED: 05/18/94   BY: afs *FN92*             */
/* REVISION: 7.3         LAST MODIFIED: 05/20/94   BY: WUG *FN92*             */
/* REVISION: 7.3         LAST MODIFIED: 01/13/95   BY: dpm *F0DR*             */
/* REVISION: 7.3         LAST MODIFIED: 02/06/95   BY: smp *F0H4*             */
/* REVISION: 7.3         LAST MODIFIED: 03/20/95   BY: smp *F0ND*             */
/* REVISION: 8.5         LAST MODIFIED: 03/29/95   BY: dzn *F0PN*             */
/* REVISION: 8.5         LAST MODIFIED: 06/16/95   BY: rmh *J04R*             */
/* REVISION: 7.3         LAST MODIFIED: 05/18/95   BY: jym *FORR* s/b F0RR    */
/* REVISION: 7.3         LAST MODIFIED: 06/14/95   BY: bcm *F0SR*             */
/* REVISION: 7.3         LAST MODIFIED: 10/05/95   BY: ais *G0YK*             */
/* REVISION: 7.3         LAST MODIFIED: 10/26/95   BY: ais *G1B1*             */
/* REVISION: 8.5         LAST MODIFIED: 07/18/95   BY: taf *J053*             */
/* REVISION: 8.5         LAST MODIFIED: 02/15/96   BY: dxk *G1NF*             */
/* REVISION: 8.5         LAST MODIFIED: 03/27/96   BY: dxk *G1PH*             */
/* REVISION: 8.5         LAST MODIFIED: 04/14/95   BY: *J04C* Sue Poland      */
/* REVISION: 8.5         LAST MODIFIED: 05/19/95   BY: *F0RR* Julie Milligan  */
/* REVISION: 8.5         LAST MODIFIED: 06/13/96   BY: *G1Y6* Sue Poland      */
/* REVISION: 8.5         LAST MODIFIED: 07/09/96   BY: *G1WN* Robin McCarthy  */
/* REVISION: 8.5         LAST MODIFIED: 10/29/96   BY: *G2HC* Ajit Deodhar    */
/* REVISION: 8.5         LAST MODIFIED: 09/01/97   BY: *H1DX* Seema Varma     */
/* REVISION: 8.6         LAST MODIFIED: 11/07/97   BY: *K15N* Jim Williams    */
/* REVISION: 8.6E        LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane*/
/* REVISION: 8.6E        LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton    */
/* REVISION: 8.6E        LAST MODIFIED: 06/25/98   BY: *L034* Russ Witt       */
/* REVISION: 8.6E        LAST MODIFIED: 07/10/98   BY: *L024* Sami Kureishy   */
/* REVISION: 8.6E        LAST MODIFIED: 02/16/99   BY: *J3B4* Madhavi Pradhan */
/* REVISION: 8.6E        LAST MODIFIED: 07/09/99   BY: *J3HQ* G.Latha         */
/* REVISION: 8.6E        LAST MODIFIED: 04/03/00   BY: *L0PZ* Santosh Rao     */
/* REVISION: 9.1         LAST MODIFIED: 06/08/00   BY: *M0MV* Sachin Shinde   */
/* REVISION: 9.1         LAST MODIFIED: 06/19/00   BY: *N0CG* Santosh Rao     */
/* REVISION: 9.1         LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown      */
/* REVISION: 9.1         LAST MODIFIED: 11/15/00   BY: *M0WD* Kaustubh K.     */
/* REVISION: 9.1         LAST MODIFIED: 10/14/00   BY: *N0WB* Mudit Mehta     */
/* Revision: 1.15.1.11     BY: Sachin Shinde       DATE: 06/26/01 ECO: *M1C2* */
/* Revision: 1.15.1.12     BY: Rajiv Ramaiah       DATE: 07/16/01 ECO: *M1DG* */
/* Revision: 1.15.1.13     BY: Manisha Sawant      DATE: 07/23/01 ECO: *M1CY* */
/* Revision: 1.15.1.18     BY: Ashwini Ghaisas     DATE: 08/06/01 ECO: *M1GW* */
/* Revision: 1.15.1.19     BY: Steve Nugent        DATE: 10/15/01 ECO: *P004* */
/* Revision: 1.15.1.20     BY: Patrick Rowan       DATE: 03/14/02 ECO: *P00G* */
/* Revision: 1.15.1.23     BY: Robin McCarthy      DATE: 02/28/03 ECO: *P0M9* */
/* Revision: 1.15.1.24     BY: Dorota Hohol        DATE: 03/06/03 ECO: *P0N6* */
/* Revision: 1.15.1.25     BY: Deepak Rao          DATE: 04/08/03 ECO: *N2CQ* */
/* Revision: 1.15.1.27     BY: Paul Donnelly (SB)  DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.15.1.28     BY: Rajinder Kamra      DATE: 06/23/03  ECO *Q003* */
/* Revision: 1.15.1.29     BY: Ed van de Gevel     DATE: 12/24/03 ECO: *Q04S* */
/* Revision: 1.15.1.30     BY: Robin McCarthy      DATE: 04/19/04 ECO: *P15V* */
/* Revision: 1.15.1.31     BY: Nishit V            DATE: 06/18/04 ECO: *P266* */
/* Revision: 1.15.1.32     BY: Sachin Deshmukh     DATE: 07/27/04 ECO: *P2CG* */
/* Revision: 1.15.1.33     BY: Gaurav Kerkar       DATE: 08/27/04 ECO: *P2H4* */
/* Revision: 1.15.1.34     BY: Vinod Kumar         DATE: 12/10/04 ECO: *P2TK* */
/* Revision: 1.15.1.35     BY: Sunil Fegade        DATE: 02/09/05 ECO: *P37K* */
/* Revision: 1.15.1.36     BY: Ed van de Gevel     DATE: 03/07/05 ECO: *R00K* */
/* Revision: 1.15.1.37     BY: Ed van de Gevel     DATE: 18/03/05 ECO: *R00F* */
/* Revision: 1.15.1.38     BY: Binoy John          DATE: 31/05/05 ECO: *Q0JM* */
/* Revision: 1.15.1.41     BY: Jean Miller         DATE: 01/11/06 ECO: *Q0PD* */
/* Revision: 1.15.1.42     BY: Shivaraman V.       DATE: 08/18/06 ECO: *R06D* */
/* Revision: 1.15.1.43     BY: Zheng Huang         DATE: 05/15/07 ECO: *R0C6* */
/* Revision: 1.15.1.44     BY: Deirdre O'Brien     DATE: 03/13/08 ECO: *R0P6* */
/* Revision: 1.15.1.45     BY: Vivek Kamath        DATE: 04/22/08 ECO: *P4LG* */
/* Revision: 1.15.1.48     BY: Anish Mandalia      DATE: 09/22/08 ECO: *R151* */
/* $Revision: 1.2 $           BY: Xiaolei Meng      DATE: 12/31/08 ECO: *R179* */
/* CENTURY YUASA      LAST MODIFIED: 18-AUG-2011 BY: gbg *cy1044*          */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB   LAST MODIFIED: 22-MAR-2012  BY:  gbg *c1287*                  */
/* CYB    LAST MODIFIED: 07-AUG-2012    BY:  gbg *c1324*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/px/pxmaint.i}
{us/so/socnis.i}     /* CUSTOMER CONSIGNMENT SHIPMENT TEMP-TABLE DEFINITION */
{us/rc/rcwabsdf.i new}
 
{us/ca/cattdef2.i}
{us/so/sosoms.i}
{us/px/pxphdef.i scxrefxr}
define input-output parameter table for tt_consign_shipment_detail.
define input-output parameter table for tt_attr_pfvalue.
define input-output parameter table for tt_serials.
 
define new shared variable prev_qty_ord  like sod_qty_ord.
define new shared variable prev_due      like sod_due_date.
define new shared variable i             as integer.
define new shared variable qty           as decimal.
define new shared variable part          as character format "x(18)".
define new shared variable prev_consume  like sod_consume.
define new shared variable sod_recno     as recid.
define new shared variable prev_site     like sod_site.
define new shared variable prev_type     like sod_type.
define new shared variable so_hist       like soc_so_hist.
define new shared variable new_site      like sod_site.
define new shared variable qty_ord       like sod_qty_ord.
define new shared variable qty_ship      like sod_qty_ship.
define new shared variable qty_cum_ship  like sod_qty_ship.
define new shared variable qty_inv       like sod_qty_inv.
define new shared variable qty_chg       like sod_qty_chg.
define new shared variable qty_bo        like sod_bo_chg.
define new shared variable sod_entity    like en_entity.
define new shared variable mtlcogs       like sct_mtl_tl.
define new shared variable lbrcogs       like sct_lbr_tl.
define new shared variable bdncogs       like sct_bdn_tl.
define new shared variable ovhcogs       like sct_ovh_tl.
define new shared variable subcogs       like sct_sub_tl.
define new shared variable accum_wip     like tr_gl_amt.
define new shared variable qty_iss_rcv   like tr_qty_loc.
define new shared variable wolot         like tr_lot.
define new shared variable std_cost      like sod_std_cost.
define new shared variable qty_all       like sod_qty_all.
define new shared variable err-flag      as integer.
define new shared variable ord-db-cmtype like cm_type no-undo.
define new shared variable l_undo_flag   like mfc_logical no-undo.
 
define     shared variable rndmthd       like rnd_rnd_mthd.
define     shared variable so_mstr_recid as recid.
define     shared variable qty_left      like tr_qty_chg.
define     shared variable trqty         like tr_qty_chg.
define     shared variable eff_date      like glt_effdate label "Effective".
define     shared variable trlot         like tr_lot.
define     shared variable ref           like glt_ref.
define     shared variable qty_req       like in_qty_req.
define     shared variable open_ref      like sod_qty_ord.
define     shared variable loc           like pt_loc.
define     shared variable fas_so_rec    as character.
define     shared variable exch_rate     like exr_rate.
define     shared variable exch_rate2    like exr_rate2.
define     shared variable exch_ratetype like exr_ratetype.
define     shared variable ship_site     like sod_site.
define     shared variable so_db         like global_db.
define     shared variable ship_db       like global_db.
define     shared variable change_db     like mfc_logical.
define     shared variable ship_so       like so_nbr.
define     shared variable ship_line     like sod_line.
define     shared variable copyusr       like mfc_logical.
define     shared variable trans_conv    like sod_um_conv.
define     shared variable site_to       like sod_site.
define     shared variable loc_to        like sod_loc.
define     shared variable undo-select   like mfc_logical no-undo.
define     shared variable base_amt      like ar_amt.
define     shared variable transtype     as character.
 
define            variable prev_abnormal like sod_abnormal.
define            variable effdate       like glt_effdate.
define            variable remote-base-curr like gl_base_curr.
define            variable site          like sod_site.
define            variable location      like sod_loc.
define            variable lotser        like sod_serial.
define            variable exch-rate     like exr_rate.
define            variable exch-rate2    like exr_rate2.
define            variable mc-error-number like msg_nbr no-undo.
define            variable prev_qty_all  like sod_qty_all no-undo.
define            variable open_qty      like sod_qty_ord.
define            variable site_change   as logical initial no.
define            variable using_shipment_perf  like mfc_logical no-undo.
define            variable collect_data         like mfc_logical no-undo.
define            variable first_time      as logical no-undo initial true.
define            variable countOfSrwkfl   as   integer     no-undo.
define            variable l_prev_curr     like base_curr   no-undo.
define            variable l_reallocate    like mfc_logical
                                           initial yes no-undo.
 
define            buffer   soddet        for sod_det.
define            buffer   seoc_buf      for seoc_ctrl.
 
define variable hCreditLibrary    as handle        no-undo.
define variable iReturnStatus     as integer       no-undo.
 
{us/mf/mfcredpl.i "hCreditLibrary"}
 
define new shared temp-table IntraStat field StatID as recid.
 
{us/so/sosois1.i}
 
run initialiseCreditManagementLibrary ( input  hCreditLibrary,
                                        output hCreditLibrary).
 
/* DETERMINE IF SHIPMENT PERFORMANCE IS INSTALLED */
for first mfc_ctrl
   where mfc_domain = global_domain
   and   mfc_field = "enable_shipment_perf"
   and   mfc_module = "ADG"
   and   mfc_logical = yes
no-lock:
   using_shipment_perf = yes.
end.
 
for first mfc_ctrl
   where mfc_ctrl.mfc_domain = global_domain
   and            mfc_field  = "rcc_reallocate"
no-lock:
   l_reallocate = mfc_logical.
end. /* FOR FIRST mfc_ctrl */
 
effdate = eff_date.
 
for first soc_ctrl
   where   soc_domain = global_domain
no-lock: end.
 
so_hist = soc_so_hist.
 
for first so_mstr
   where recid(so_mstr) = so_mstr_recid
no-lock: end.
 
if sorec    = fsseoship
   or sorec = fsktship
then do:
   /* REMEMBER, THIS IS USED FOR ALL TYPES OF 'SHIPPING' */
   /* INCLUDING SALES ORDERS AND RMA'S.  WITH 8.5, WE    */
   /* HAVE TWO NEW SHIPPING FUNCTIONS: MATERIAL          */
   /* ORDERS (MO'S) AND SERVICE KITS...                  */
   for first seoc_ctrl
      where   seoc_domain = global_domain
   no-lock:
      so_hist = seoc_so_hist.
   end.
end.
 
for first gl_ctrl
   where   gl_domain = global_domain
no-lock:
   base_curr = gl_base_curr.
end.
 
/* FIND IMPORT EXPORT CONTROL FILE */
for first iec_ctrl
   where   iec_domain = global_domain
no-lock: end.
 
/*! MULTI-DOMAIN: USE SHIP-TO CUSTOMER TYPE FOR DEFAULT
 * IF AVAILABLE ELSE USE BILL-TO TYPE USED TO
 * FIND COGS ACCOUNT IN SOCOST02.p */
{us/bbi/gprun.i ""gpcust.p""
         "(input  so_nbr,
           output ord-db-cmtype)"}
 
if so_fsm_type = "RMA"
then do:
   for first svc_ctrl
      where   svc_domain = global_domain
   no-lock: end.
 
   for first cm_mstr
      where   cm_domain = global_domain
      and     cm_addr = so_bill
   no-lock: end.
end. /* IF SO_FSM_TYPE = "RMA" */
 
/* Save the Order Total, This could be a new order or an existing
 * order, Store this value, it is used as a before value */
run addSalesOrderTotal in hCreditLibrary
   (input so_nbr,
    input getOrderTotal( input so_nbr)).
 
mainloop1:
for each sod_det
   no-lock
   where sod_domain = global_domain
   and  (sod_nbr = so_nbr
   and  (sod_site = ship_site or ship_site = "")
   and   sod_confirm)
by sod_qty_ord:
 
   if (sorec = fsrmarec    and sod_fsm_type  <> "RMA-RCT")
      or (sorec = fsrmaship   and sod_fsm_type  <> "RMA-ISS")
      or (sorec = fssormaship and sod_fsm_type  =  "RMA-RCT")
      or (sorec = fssoship    and sod_fsm_type  <> "")
   then
      next.
 
   if sod_qty_chg = 0
      and not l_reallocate
      and sod_bo_chg <> 0
   then
      next.
 
   /* Skip this line if nothing has changed */
   if sod_fsm_type = "RMA-ISS" then
      if validCustomerCreditLimit
         (cm_addr, 0.0, 0.0, so_curr, 0, "SO", no) < 0
        and svc_hold_call = 2
      then
         next.
 
   if can-find (first sob_det
                where sob_domain = global_domain
                  and sob_nbr = sod_nbr
                  and sob_line = sod_line)
      and  (can-find (first sr_wkfl
                      where sr_domain = global_domain
                        and sr_userid = SessionUniqueID
                        and sr_lineid begins string(sod_line) + "ISS")
      or   (sod_qty_chg <> 0 and sod_fa_nbr = ""))
   then do transaction:
 
      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
         if err-flag = 2 or err-flag = 3 then do:
            /* DOMAIN # IS NOT AVAILABLE*/
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                     &MSGARG1="ship_db"}
            if c-application-mode <> "API" then
               pause.
            undo-select = true.
            undo, leave.
         end.
      end.
 
      {us/bbi/gprun.i ""gpnxtsq.p"" "(output wolot)"}
 
      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
         if err-flag = 2 or err-flag = 3 then do:
            /* DOMAIN # IS NOT AVAILABLE*/
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                     &MSGARG1="so_db"}
            if c-application-mode <> "API" then
               pause.
            undo-select = true.
            undo, leave.
         end.
      end.
   end.   /* IF CAN-FIND sob_det */
 
   /* SKIPPING OVERSHIPPED SALES ORDER LINES  */
   if sod_qty_chg = 0 and sod_bo_chg = 0
      and ((sod_qty_ord >= 0 and sod_qty_ord <= sod_qty_ship)
      or   (sod_qty_ord <  0 and sod_qty_ord >= sod_qty_ship))
   then
      next.
 
   skipBlock:
   do:
 
      updateBlock:
      do on stop undo, leave:
 
         do for soddet transaction:
            find soddet
               where recid(soddet) = recid(sod_det)
            exclusive-lock.
 
            for first si_mstr
               where   si_domain = global_domain
               and     si_site = sod_site
            no-lock: end.
 
            assign
               sod_entity    = si_entity
               prev_due      = sod_due_date
               prev_qty_ord  = sod_qty_ord * sod_um_conv
               prev_abnormal = sod_abnormal
               prev_consume  = sod_consume
               prev_site     = sod_site
               prev_type     = sod_type
               ship_so       = sod_nbr
               ship_line     = sod_line
               qty_chg       = sod_qty_chg
               qty_bo        = sod_bo_chg.
 
            /* ONLY CALL THE INTRASTAT ROUTINE FOR LINES WITH A SHIPMENT QTY.   */
            /* SINCE WE ARE IN A FOR EACH sod_det LOOP ON THE ENTIRE SO, THERE  */
            /* MAY BE SOME LINES WHERE sod_qty_chg = 0. WE DON'T WANT TO CREATE */
            /* ANY IMPORT EXPORT HISTORY RECORDS FOR LINES THAT ARE NOT BEING   */
            /* SHIPPED.                                                         */
            if available iec_ctrl
               and iec_use_instat
               and sod_qty_chg <> 0
            then do:
 
               /* CREATE IMPORT EXPORT HISTORY RECORD */
           /* THIRD AND FOURTH PARAMETER ADDED     */
           /* TO AVOID PARAMETER MISMATCH.         */
 
               {us/bbi/gprun.i ""iehistso.p"" "(buffer sod_det,
                                         input sod_qty_chg,
                         input """",
                         input 0,
                                         input eff_date,
                                         input ""SHIP"")"}
 
               if so_fsm_type = "SEO" and so_ca_nbr = " "
               then do:
                 {us/bbi/gprun.i ""iehisteo.p""
                            "(input recid(sod_det),
                            input sod_qty_chg,
                            input ""SHIP"")"}
               end. /* IF so_fsm_type AND so_ca_nr */
 
            end. /* IF AVAILABLE iec_ctrl AND ice_use_instat AND sod_qty_chg */
 
            /* IT SEEMS THAT gpalias3.p COULD BE CALLED BEFORE THIS 'if' STATE- */
            /* MENT AND AGAIN AFTER THE CALL TO sofarc.p - BUT BECAUSE ISSUING  */
            /* COMPONENTS AND RECEIVING THE WORK ORDER USUALLY WON'T BE CALLED  */
            /* DURING THE SAME LINE ITEM SWITCHING DOMAIN'S IS DONE WITHIN THE  */
            /* 'if' BLOCKS FOR MORE EFFICIENT PROCESSING                        */
            if can-find (first sob_det
               where sob_domain = global_domain
               and  (sob_nbr = sod_nbr
               and   sob_line = sod_line))
               and  (can-find (first sr_wkfl
               where sr_domain = global_domain
               and  (sr_userid = SessionUniqueID
               and   sr_lineid begins string(sod_line) + "ISS"))
               or   (sod_qty_chg <> 0 and sod_fa_nbr = ""))
               and   sod_type = ""
               and   sod_cfg_type = "2"
            then do:
 
               if change_db then do:
                  {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
                  if err-flag = 2 or err-flag = 3 then do:
                     /* DOMAIN # IS NOT AVAILABLE*/
                     {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                              &MSGARG1="ship_db"}
                     if c-application-mode <> "API" then
                        pause.
                     undo-select = true.
                     undo, leave.
                  end.
               end.
               else
                  sod_recno = recid(sod_det).
 
               accum_wip = 0.
 
               /* SALES ORDER BILL COMPONENT BACKFLUSH */
               {us/bbi/gprun.i ""soise03.p"" "(input sod_nbr, input sod_line,
                                         input-output table tt_attr_pfvalue by-reference,
                                         input-output table tt_serials by-reference)"}
               {us/bbi/gprun.i ""soise04.p"" "(input sod_nbr, input sod_line)"}
 
               if change_db then do:
                  {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
                  if err-flag = 2 or err-flag = 3 then do:
                     /* DOMAIN # IS NOT AVAILABLE*/
                     {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                              &MSGARG1="so_db"}
                     if c-application-mode <> "API" then
                        pause.
                     undo-select = true.
                     undo, leave.
                  end.
               end.
            end.
 
            /* UPDATE FINAL ASSEMBLY WORK ORDERS */
            /* MOVED FIND OF wo_mstr TO sofarc.p BECAUSE IN CENTRAL ORDER */
            /* PROCESSING THE WORK ORDER EXISTS ONLY IN THE INVENTORY DOMAIN */
            if sod_qty_chg <> 0
               and sod_lot <> ""
               and fas_so_rec = string(true)
            then do:
               if change_db then do:
                  {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
                  if err-flag = 2 or err-flag = 3 then do:
                     /* DOMAIN # IS NOT AVAILABLE*/
                     {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                              &MSGARG1="ship_db"}
                     if c-application-mode <> "API" then
                        pause.
                     undo-select = true.
                     undo, leave.
                  end.
               end.
               else
                  sod_recno = recid(sod_det).
 
               /* DO NOT CALL sofarc.p FOR RMA RECEIPTS */
               if sod_rma_type <> "I" then do:
                  {us/bbi/gprun.i ""sofarc.p"" "(input sod_nbr, input sod_line)"}
               end. /* IF sod_rma_type <> "I" */
 
               if change_db then do:
                  {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
                  if err-flag = 2 or err-flag = 3 then do:
                     /* DOMAIN # IS NOT AVAILABLE*/
                     {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                              &MSGARG1="so_db"}
                     if c-application-mode <> "API" then
                        pause.
                     undo-select = true.
                     undo, leave.
                  end.
               end.
            end. /* sod_qty_chg <> 0 */
 
            /* IF ORDER QTY CHANGED CREATE ORD-SO TRANS, UPDATE PART MASTER */
            eff_date = effdate.
 
            /* FOR RMA RECEIPTS, DO NOT ADJUST IN_QTY_ALL. FOR OTHER SHIPMENTS, */
            /* REDUCE ALLOCATIONS BY EITHER QTY SHIPPED OR QTY ALLOCATED PRIOR  */
            if sod_fsm_type = "RMA-RCT" then
               qty_all = 0.
            else do:
               if sod_sched then do:
                  if (sod_qty_chg > 0) then
                     qty_all = - min(sod_qty_all + sod_qty_pick, sod_qty_chg).
               end. /* IF sod_sched ... */
               else
               if sod_qty_ord <= 0 then
                  qty_all = 0.
               else
               if sod_qty_ord < sod_qty_ship then
                  qty_all = max (0, sod_qty_ord - sod_qty_ship - sod_qty_chg).
               else
                  if sod_qty_chg > 0
                  then
                     qty_all = - min(sod_qty_all + sod_qty_pick, sod_qty_chg).
 
               if sod_bo_chg   = 0  and
                  sod_type     = "" and
                  sod_fsm_type = ""
               then
                  qty_all = - (sod_qty_all + sod_qty_pick).
 
            end. /* sod_fsm_type <> "RMA-RCT" */
 
            /* MFSOTR.I EXPECTS QTY_ALL TO HAVE BEEN CONVERTED TO THE SKU */
            /* UNIT OF MEASURE.  THE REST OF THIS PROGRAM DOES NOT...     */
            assign
               prev_qty_all = qty_all
               qty_all      = qty_all * sod_um_conv.
 
            {us/mf/mfsotr.i "QTYCHG"}
 
            /* IF SHIPMENT PERFORMANCE IS INSTALLED */
            /* THEN CALL A SUBPROGRAM TO COLLECT    */
            /* SHIPMENT PERFORMANCE INFORMATION.    */
            if using_shipment_perf
               and (  (sod_due_date <= eff_date)
                   or (sod_per_date <= eff_date)
                   or (sod_req_date <= eff_date)
                   or (sod_qty_chg  <> 0 ) 
/*cy1044*/         or (sod_qty_ship + sod_qty_chg  <> sod_qty_ord ) 
		   )
            then do:
/*cy1044*      {us/gp/gprunmo.i &program = ""soshpso.p"" &module = "ASR" */
/*cy1044*/     {us/gp/gprunmo.i &program = ""xxsoshpso.p"" &module = "ASR"
                          &param   = """(input recid(sod_det),
                                         input '',
                                         input '',
                                         input '',
                                         input no,
                                         input 0,
                                         input yes,
                                         input 0,
                                         input no)"""}
            end. /* IF using_shipment_perf */
 
            l_prev_curr = base_curr.
 
            /* Switch to the inventory database (if different) */
            assign
               qty_all = prev_qty_all
               remote-base-curr = base_curr
               ship_db   = si_db
               change_db = (ship_db <> global_db).
 
            if change_db then do:
               {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
               if err-flag = 2 or err-flag = 3 then do:
                  /* DOMAIN # IS NOT AVAILABLE*/
                  {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                           &MSGARG1="ship_db"}
                  if c-application-mode <> "API" then
                     pause.
                  undo-select = true.
                  undo, leave.
               end.
 
               /* GET THE BASE CURRENCY OF THE REMOTE DATABASE */
               {us/bbi/gprun.i ""gpbascur.p"" "(output remote-base-curr)"}
            end.
 
            if remote-base-curr <> base_curr
            then
               base_curr = remote-base-curr.
 
            trans_conv = sod_um_conv.
 
            /* Update inventory data */
            {us/bbi/gprun.i ""sosoisu3.p""
                     "(input transtype,
                       input table tt_consign_shipment_detail,
                       input-output first_time,
                       input-output countOfSrwkfl,
                       input-output table tt_attr_pfvalue by-reference,
                       input-output table tt_serials by-reference)"}
 
            base_curr = l_prev_curr.
 
            /* UNDOING SHIPMENT AND RETURNING THE CONTROL TO THE SO NUMBER */
            if l_undo_flag then do:
               undo-select = true.
               undo mainloop1, leave mainloop1.
            end. /* IF L_UNDO_FLAG THEN .. */
 
            /* Make sure to switch back to SO DOMAIN */
            if change_db then do:
               {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
               if err-flag = 2 or err-flag = 3 then do:
                  /* DOMAIN # IS NOT AVAILABLE*/
                  {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                           &MSGARG1="so_db"}
                  if c-application-mode <> "API" then
                     pause.
                  undo-select = true.
                  undo, leave.
               end.
            end.
 
            {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
                      "(input base_curr,
                        input remote-base-curr,
                        input """",
                        input eff_date,
                        output exch-rate2,
                        output exch-rate,
                        output mc-error-number)"}
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end.
            if sod_sched 
            then do:
               {us/px/pxrun.i &PROC='syncReplcumqty' &PROGRAM='scxrefxr.p'     
                  &HANDLE=ph_scxrefxr
                  &PARAM="(input sod_nbr, input sod_line,
                           input (qty_cum_ship - sod_cum_qty[1]))"
                  &NOAPPERROR=True
                  &CATCHERROR=True}
            end. /* IF sod_sched */  
            assign
               sod_qty_chg    = 0
               sod_bo_chg     = 0
               /* Update quantities in the sales order database (if different) */
               sod_qty_ord    = qty_ord
               sod_qty_ship   = qty_ship
               sod_qty_inv    = qty_inv
               sod_cum_qty[1] = qty_cum_ship
               sod_pickdate   = ?
               sod_qty_all    = qty_all.
            if l_reallocate
            then
               sod_qty_pick = 0.
 
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                      "(input remote-base-curr,
                        input so_curr,
                        input exch-rate,
                        input exch-rate2,
                        input std_cost,
                        input false,
                        output sod_std_cost,
                      output mc-error-number)"}
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end.
         end.
         leave skipBlock. /* NO CTRL-C PROCESSING */
      end. /* UPDATEBLOCK */
      /* WHEN CTRL-C IS PRESSED WE NEED TO UPDATE OPENSALESORDERBALANCE */
      run updateSalesOrderBal (input so_nbr,
                               input so_bill,
                               input so_curr).
      /* EXECUTE CTRL-C AGAIN */
      stop.
   end. /* SKIPBLOCK */
end. /* transaction */
 
run updateSalesOrderBal (input so_nbr,
                         input so_bill,
                         input so_curr).
 
do transaction:
   find qad_wkfl where qad_wkfl.qad_domain = global_domain and
        qad_key1 = "ABS_ID" and
        qad_key2 = SessionUniqueID
   exclusive-lock no-error.
   if available qad_wkfl then delete qad_wkfl.
end.
 
eff_date = effdate.
 
procedure updateSalesOrderBal:
   define input parameter p_so_nbr  like so_nbr  no-undo.
   define input parameter p_so_bill like so_bill no-undo.
   define input parameter p_so_curr like so_curr no-undo.
 
   /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
   run updateOpenOrderTotal in hCreditLibrary
     ( input  p_so_bill,
        input  getBeforeOrderTotal(input p_so_nbr),
        input  getOrderTotal      (input p_so_nbr),
        input  p_so_curr,
        output iReturnStatus).
   /* CLEAR qad_wkfl AFTER UPDATE IS OK */
   if iReturnStatus >= 0 
   then
      run clearSOTotals in hCreditLibrary ( input  p_so_nbr).
   else
      undo-select = true.
end procedure. /* UPDATESALESORDERBAL */
