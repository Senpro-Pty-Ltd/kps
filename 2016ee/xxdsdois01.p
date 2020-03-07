/* xxdsdois01.p - DISTRIBUTION ORDER ISSUE                                      */
/* dsdois01.p - DISTRIBUTION ORDER ISSUE                                      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdsdois01.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/*                                                                            */
/*! dsdois01.p IS CALLED FROM dsdois.p AND dsdomt02.p                         */
/*                                                                            */
/* Revision: 1.13          BY: Samir Bavkar       DATE: 07/31/01  ECO: *P009* */
/* Revision: 1.15          BY: Manish Kulkarni    DATE: 06/05/02  ECO: *P042* */
/* Revision: 1.21          BY: Robin McCarthy     DATE: 06/16/02  ECO: *P08P* */
/* Revision: 1.23          BY: Robin McCarthy     DATE: 07/03/02  ECO: *P08Q* */
/* Revision: 1.24          BY: Robin McCarthy     DATE: 07/15/02  ECO: *P0BJ* */
/* Revision: 1.25          BY: Manjusha Inglay    DATE: 07/29/02  ECO: *N1P4* */
/* Revision: 1.26          BY: A.R. Jayaram       DATE: 08/08/02  ECO: *N1QY* */
/* Revision: 1.29          BY: Robin McCarthy     DATE: 08/15/02  ECO: *P09K* */
/* Revision: 1.31          BY: Samir Bavkar       DATE: 08/18/02  ECO: *P0FS* */
/* Revision: 1.32          BY: Dave Caveney       DATE: 09/04/02  ECO: *P0HB* */
/* Revision: 1.34          BY: Paul Donnelly (SB) DATE: 06/26/03  ECO: *Q00P* */
/* Revision: 1.35          BY: Rajinder Kamra     DATE: 06/23/03  ECO  *Q00Y* */
/* Revision: 1.36          BY: Abhishek Jha       DATE: 05/05/04  ECO *P206*  */
/* Revision: 1.37          BY: Shoma Salgaonkar   DATE: 06/14/04  ECO *P25Y*  */
/* Revision: 1.38          BY: Dan Herman         DATE: 11/01/04  ECO: *M1L8* */
/* Revision: 1.40          BY: Sunil Fegade       DATE: 05/10/05  ECO: *Q0J4* */
/* Revision: 1.41          BY: Andrew Dedman      DATE: 10/19/05  ECO: *R021* */
/* Revision: 1.42          BY: Andrew Dedman      DATE: 10/05/05  ECO: *R02C* */
/* Revision: 1.43          BY: Shilpa Kamath      DATE: 04/04/06  ECO: *R03V* */
/* Revision: 1.44          BY: Shilpa Kamath      DATE: 06/04/06  ECO: *R05V* */
/* Revision: 1.45          BY: Xavier Prat        DATE: 06/15/06  ECO: *R03Q* */
/* Revision: 1.46          BY: Gerard Menezes     DATE: 09/21/06  ECO: *P572* */
/* Revision: 1.51          BY: Sumit Karunakaran  DATE: 03/31/07  ECO: *P5S8* */
/* Revision: 1.52          BY: Xavier Prat        DATE: 01/17/08  ECO: *R0KY* */
/* Revision: 1.55          BY: Jean Miller        DATE: 02/12/08  ECO: *P60P* */
/* Revision: 1.56          BY: Anish mandalia     DATE: 04/14/08  ECO: *P6HS* */
/* Revision: 1.57          BY: Sandeep Panchal    DATE: 06/06/08  ECO: *P6SR* */
/* Revision: 1.58          BY: Sandeep Panchal    DATE: 08/22/08  ECO: *P6ZP* */
/* Revision: 1.59          BY: Namita Patil       DATE: 08/28/08  ECO: *P702* */
/* Revision: 1.60          BY: Mukesh Singh       DATE: 03/31/09  ECO: *P6VQ* */
/* Revision: 1.61          BY: Chandrakant Ingale DATE: 07/02/09  ECO: *Q33S* */
/* Revision: 1.62          BY: Ambrose Almeida    DATE: 07/10/09  ECO: *Q322* */
/* Revision: 1.63          BY: Jean Miller        DATE: 09/24/09  ECO: *P69Z* */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
using com.qad.eefin.bdomain.DomainForOperationalInfo.
using com.qad.eefin.bexchangeratetype.ExchangeRateTypeByTypeCode.
using com.qad.eefin.bcurrency.SelectCurrency.

{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i}    /* EXTERNAL LABEL INCLUDE */
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/px/pxmaint.i}
{us/px/pxphdef.i ppitxr}
{us/px/pxphdef.i pafunc}
{us/px/pxphdef.i paicxr}

{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}

define input parameter auto_do_proc like mfc_logical no-undo.
define input parameter orderNbr  like dss_nbr       no-undo.
define input parameter shipSite  like dss_shipsite  no-undo.
define input parameter recSite   like dss_rec_site  no-undo.

define new shared variable rec_site            like dss_rec_site.
define new shared variable part                like ds_part.
define new shared variable eff_date            like tr_date.
define new shared variable dss_recno           as recid.
define new shared variable site                like sr_site no-undo.
define new shared variable location            like sr_loc no-undo.
define new shared variable lotserial           like sr_lotser no-undo.
define new shared variable lotref              like sr_ref no-undo.
define new shared variable lotserial_qty       like ds_qty_chg no-undo.
define new shared variable multi_entry         like mfc_logical
                                               label "Multi Entry" no-undo.
define new shared variable lotserial_control   as character.
define new shared variable cline               as character.
define new shared variable row_nbr             as integer.
define new shared variable col_nbr             as integer.
define new shared variable issue_or_receipt    as character.
define new shared variable total_lotserial_qty like ds_qty_chg.
define new shared variable trans_um            like pt_um.
define new shared variable trans_conv          like sod_um_conv.
define new shared variable transtype           as character initial "ISS-TR".
define new shared variable ds_recno            as recid.
define new shared variable cancel_bo           as logical no-undo.
define new shared variable calc_fr             like mfc_logical
                                               label "Calculate Freight" no-undo.
define new shared variable disp_fr             like mfc_logical
                                               label "Display Weight" no-undo.
define new shared variable freight_ok          like mfc_logical no-undo.
define new shared variable shipment_id         as   character   no-undo.
define new shared variable rndmthd             like      rnd_rnd_mthd.
define new shared variable new_order           like      mfc_logical.
define new shared variable new_line            like      mfc_logical.
define new shared variable gl_amt              like      ds_fr_chg.
define new shared variable undo_dsdomtp        like mfc_logical no-undo.
define new shared variable intransit           like mfc_logical no-undo.
define new shared variable use-ship-info       like mfc_logical
                                               label "Use Shipment Information"
                                               initial yes no-undo.

define variable fill_all             like mfc_logical
                                     label "Ship Allocated" initial no.
define variable fill_pick            like mfc_logical
                                     label "Ship Picked" initial yes.
define variable nbr                  like dss_nbr.
define variable qopen                like ds_qty_ord label "Qty Open".
define variable yn                   like mfc_logical.
define variable yn1                  like mfc_logical.
define variable ref                  like glt_ref.
define variable desc1                like pt_desc1.
define variable i                    as integer.
define variable trqty                like tr_qty_chg no-undo.
define variable trlot                like tr_lot.
define variable qty_left             like tr_qty_chg.
define variable del-yn               like mfc_logical initial no.
define variable j                    as integer.
define variable k                    as integer no-undo.
define variable tot_lad_all          like lad_qty_all.
define variable ladqtychg            like lad_qty_all.
define variable qty_chg              like ds_qty_chg.
define variable bo_chg               like wod_bo_chg.
define variable qty_all              like ds_qty_all.
define variable qty_pick             like ds_qty_pick.
define variable req-nbr              like ds_req_nbr.
define variable original_db          as character.
define variable err-flag             as integer.
define variable undo-input           like mfc_logical.
define variable undo-update          like mfc_logical no-undo.
define variable from_ld_exists       like mfc_logical no-undo initial no.
define variable from_expire          like ld_expire no-undo.
define variable from_assay           like ld_assay no-undo.
define variable from_grade           like ld_grade no-undo.
define variable from_status          like ld_status no-undo.
define variable lotnext              like wo_lot_next.
define variable lotprcpt             like wo_lot_rcpt no-undo.
define variable dblcol               as character initial "::" no-undo.
define variable c-err-msg            as character no-undo.
define variable ord_nbr              like dss_nbr no-undo.
define variable ship_site            like dss_shipsite no-undo.
define variable old_um               like fr_um             no-undo.
define variable use-log-acctg        as   logical           no-undo.
define variable lv_nrm_seqid         like lac_soship_nrm_id no-undo.
define variable lv_undo_flag         as   logical           no-undo.
define variable lv_accrue_freight    as   logical           no-undo.
define variable lv_shipment_type     as   character         no-undo.
define variable mc-error-number      like msg_nbr           no-undo.
define variable last_dsline          like ds_line           no-undo.
define variable lv_error_num         as integer             no-undo.
define variable lv_name              as character           no-undo.
define variable apiShipSite          like dss_shipsite      no-undo.
define variable l_pt_loc             as character           no-undo.
define variable looseQty             like sr_qty            no-undo.
define variable isSerialized         as logical             no-undo.
define variable lLegacyAPI           as   logical           no-undo.
define variable allowToIssue         as logical             no-undo.

define variable DomainInfo           as DomainForOperationalInfo   no-undo.
define variable ExchangeRateType     as ExchangeRateTypeByTypeCode no-undo.
define variable StatCurrency         as SelectCurrency             no-undo.

define buffer dsdet for ds_det.

{us/gp/gpscdef.i}

/* TEMP TABLE tt-frcalc DEFINITION FOR CREATING PVO_MSTR, PVOD_DET */
{us/la/lafrttmp.i "new"}

define new shared workfile trans_info
   field tpart   like pt_part
   field tsite   like si_site
   field tloc    like sr_loc
   field tlot    like sr_lotser
   field tref    like sr_ref
   field texpire like ld_expire
   field tgrade  like ld_grade
   field tassay  like ld_assay
   field tstatus like ld_status.

define temp-table tt_bo no-undo
   field tt_domain      like global_domain
   field tt_ds_req_nbr  like ds_req_nbr
   field tt_cancel_bo   like mfc_logical
index tt_index tt_domain tt_ds_req_nbr.

define temp-table tt_ds_det no-undo
   field tt_ds_domain   like ds_domain
   field tt_ds_nbr      like ds_nbr
   field tt_ds_part     like ds_part
   field tt_ds_site     like ds_site
   field tt_ds_req_nbr  like ds_req_nbr
   field tt_ds_shipsite like ds_shipsite
   field tt_ds_qty_conf like ds_qty_conf
   field tt_ds_qty_ship like ds_qty_ship
   field tt_ds_qty_chg  like ds_qty_chg
   field tt_ds_loc      like ds_loc
   index inds_nbr tt_ds_part tt_ds_req_nbr ascending.

{us/up/updaterestriction.i}

/* Start Update Restriction Library running Persistantly */
run mfairunh.p (input "mgurpl.p",
                input ?,
                output hUpdateRestrictedLibrary).

{us/mf/mfaimfg.i} /* COMMON API CONSTANTS AND VARIABLES */
{us/ds/dsdsois1.i "reference-only"} /* API 2.0 DATASET */

{us/ds/dsdoit01.i} /* DEFINE API DISTRIBUTION ORDER TEMP TABLES  */
{us/ic/icicit01.i} /* DEFINE API INVENTORY CONTROL TEMP TABLES   */
{us/ic/icshxt01.i} /* DEFINE API SHIPPER TEMP TABLES             */

 if c-application-mode = "API" then do:

   {us/bbi/gprun.i ""gpaigach.p"" "(output ApiMethodHandle)"}

   if valid-handle(ApiMethodHandle) then do:
      run getRequestDataset in ApiMethodHandle(output dataset dsDistributionOrder bind).
      lLegacyAPI = false.
   end.
   else do:
      lLegacyAPI  = true.

      /* GET HANDLE OF API CONTROLLER */
      {us/bbi/gprun.i ""gpaigh.p""
               "(output ApiMethodHandle,
                 output ApiProgramName,
                 output ApiMethodName,
                 output ApiContextString)"}

      /* GET DISTRIBUTION ORDER TRANSACTION TEMP-TABLE */
      run getDistOrderTransRecord in ApiMethodHandle (buffer ttDistOrderTrans).

      /* GET DISTRIBUTION ORDER TRANSACTION DETAIL TEMP-TABLE */
      run getDistOrderTransDet in ApiMethodHandle
         (output table ttDistOrderTransDet).

      /* GET DISTRIBUTION ORDER SHIPPER TEMP-TABLE */
      run getDistOrderShipper in ApiMethodHandle
         (output table ttDistOrderShipper).

      /* GET DISTRIBUTION ORDER SHIPPER CARRIER TEMP-TABLE */
      run getDistOrderShipCarrier in ApiMethodHandle
         (output table ttDistOrderShipCarrier).

      /* GET DISTRIBUTION ORDER SHIPPER COMMENT TEMP-TABLE */
      run getDistOrderShipCmt in ApiMethodHandle
         (output table ttDistOrderShipCmt).

      /* GET DISTRIBUTION ORDER TRAILER COMMENT TEMP-TABLE */
      run getDistOrderShipTrlCmt in ApiMethodHandle
         (output table ttDistOrderShipTrlCmt).
   end.

end. /* if c-application-mode = "API" */

issue_or_receipt = getTermLabel("ISSUE",8).

{us/gp/gpglefv.i}

/* INPUT OPTION FORM */
form
   dss_nbr      colon 15
   dss_shipsite colon 31
   rec_site     colon 51
   eff_date     colon 68
   fill_all     colon 68
   fill_pick    colon 68
with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form with frame c 4 down width 80.
/* SET EXTERNAL LABELS */
setFrameLabels(frame c:handle).

form
   part           colon 13
   req-nbr                   label "Req"
   site           colon 53
   location       colon 68   label "Loc"
   pt_desc1       colon 13
   lotserial      colon 53
   qopen          colon 13
   pt_um
   lotref         colon 53
   lotserial_qty  colon 13
   multi_entry    colon 53
   cancel_bo      colon 13   label "Cancel B/O"
with frame d side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

eff_date = today.

if c-application-mode <> "API" then
   display
      global_site @ dss_shipsite
   with frame a.

original_db = global_db.

{us/gp/gpscproxy.i}


/* DISPLAY */
mainloop:
repeat:

   if c-application-mode = "API" and retry
      then return error return-value.

   if c-application-mode = "API" and not lLegacyAPI then do:
      run getNextRecord in ApiMethodHandle (input "ttDistributionOrder").
      if return-value = {&RECORD-NOT-FOUND} then
         leave mainloop.
   end. /* if c-application-mode = "API" */

   for each trans_info exclusive-lock:
      delete trans_info.
   end.

   nbr = "".

   if c-application-mode <> "API" then do:
      if auto_do_proc then
         display
            orderNbr @ dss_nbr
            shipSite @ dss_shipsite
            recSite  @ rec_site
         with frame a.

      display
         eff_date
         fill_all
         fill_pick
      with frame a.

      view frame c.
      view frame d.
   end. /* if c-application-mode <> "API" then do */
   else
      assign
         dss_nbr:screen-value       = orderNbr when auto_do_proc
         dss_shipsite:screen-value  = shipSite when auto_do_proc
         rec_site:screen-value      = recSite  when auto_do_proc
         eff_date:screen-value      = string(eff_date)
         fill_all:screen-value      = string(fill_all)
         fill_pick:screen-value     = string(fill_pick).


   if (not auto_do_proc)  then do:
      if c-application-mode <> "API" then
      prompt-for
         dss_nbr
         dss_shipsite
         rec_site
         eff_date
         fill_all
         fill_pick
      with frame a
      editing:
         if frame-field = "dss_nbr" then do:
            /* FIND NEXT/PREVIOUS RECORD */
            {us/mf/mfnp05.i dss_mstr dss_nbr  " dss_mstr.dss_domain = global_domain
            and yes "  dss_nbr "input dss_nbr"}
            if recno <> ? then do:
               display dss_nbr dss_shipsite dss_rec_site @ rec_site
               with frame a.
            end.
         end.
         else do:
            status input.
            readkey.
            apply lastkey.
         end.
      end.
      else if not lLegacyAPI then
         assign
            {us/mf/mfaiprvl.i dss_nbr        ttDistributionOrder.dssNbr}
            {us/mf/mfaiprvl.i dss_shipsite   ttDistributionOrder.dssShipsite}
            {us/mf/mfaiprvl.i rec_site       ttDistributionOrder.recSite}.

      assign
         ord_nbr = input dss_nbr
         ship_site = input dss_shipsite.

      if c-application-mode = "API" and lLegacyAPI then
         assign
            {us/mf/mfaiset.i ord_nbr ttDistOrderTrans.nbr}
            {us/mf/mfaiset.i ship_site ttDistOrderTrans.shipSite}.
   end. /* IF (not auto_do_proc)*/
   else do:
      if c-application-mode <> "API" then
         prompt-for
           eff_date
           fill_all
           fill_pick
         with frame a.

      assign
         ord_nbr = orderNbr
         ship_site = shipSite.
   end. /* IF auto_do_proc */

   if c-application-mode = "API" and not lLegacyAPI then
      assign
         {us/mf/mfaidflt.i ttDistributionOrder.effDate  date(eff_date:screen-value)}
         eff_date:screen-value   = string(ttDistributionOrder.effDate)
         {us/mf/mfaidflt.i ttDistributionOrder.fillAll  logical(fill_all:screen-value)}
         fill_all:screen-value   = string(ttDistributionOrder.fillAll)
         {us/mf/mfaidflt.i ttDistributionOrder.fillPick logical(fill_pick:screen-value)}
         fill_pick:screen-value  = string(ttDistributionOrder.fillPick).

   assign
      rec_site
      eff_date
      fill_all
      fill_pick.

   if c-application-mode = "API" and lLegacyAPI then do:
      assign
         {us/mf/mfaiset.i rec_site ttDistOrderTrans.recSite}
         {us/mf/mfaiset.i eff_date ttDistOrderTrans.effDate}
         fill_all  = no
         fill_pick = no.

      for first dss_mstr
         where dss_mstr.dss_domain = global_domain
         and dss_nbr      = ttDistOrderTrans.nbr
         and dss_shipsite = ttDistOrderTrans.shipSite
         no-lock:
      end.
   end. /* if c-application-mode = "API" and lLegacyAPI */
   else
      find dss_mstr  no-lock where dss_mstr.dss_domain = global_domain and  dss_nbr =
      ord_nbr and dss_shipsite = ship_site
      no-error.

   if not available dss_mstr then do:
      /* DISTRIBUTION ORDER DOES NOT EXIST */
      {us/bbi/pxmsg.i &MSGNUM = 1600 &ERRORLEVEL = 3}
      undo, retry.
   end.

   if c-application-mode = "API" and lLegacyAPI
      and ( ( not {us/gp/gppswd3.i &field = ""dss_shipsite"" } )
            or ( not {gpsite.v  &field = dss_shipsite
                                &blank_ok = yes}))
      then do:
      /* INVALID SITE */
      {us/bbi/pxmsg.i  &MSGNUM = 2797  &ERRORLEVEL = 3}
       return error.
   end.

   if not auto_do_proc then do:
      /* CHECK SITE SECURITY */
      {us/bbi/gprun.i ""gpsiver.p""
         "(input dss_shipsite, input ?, output return_int)"}
      if return_int = 0 then do:
         /* USER DOES NOT HAVE ACCESS TO SITE */
         {us/bbi/pxmsg.i &MSGNUM = 725 &ERRORLEVEL = 3
            &FIELDNAME = ""ttDistributionOrder.dssShipsite""}
         if c-application-mode <> "API" then
            next-prompt dss_shipsite with frame a.
         undo mainloop, retry.
      end.
   end. /* IF (not auto_do_proc) */

   if eff_date = ? then
      eff_date = today.

   if c-application-mode <> "API" then
      display
         dss_nbr
         dss_shipsite
         eff_date
      with frame a.

   /* CHECK GL EFFECTIVE DATE */
   do k = 1 to 2:
      if k = 1 then
         find si_mstr  where si_mstr.si_domain = global_domain and  si_site =
         dss_shipsite no-lock no-error.
      else
         find si_mstr  where si_mstr.si_domain = global_domain and  si_site =
         rec_site no-lock no-error.
      if available si_mstr then do:
         {us/gp/gpglef1.i
            &module = ""IC""
            &entity = si_entity
            &date   = eff_date
            &prompt = "eff_date"
            &frame  = "a"
            &loop   = "mainloop"
            }
         if dss_shipsite = rec_site then
            leave.
      end.
   end.

   find si_mstr no-lock  where si_mstr.si_domain = global_domain and  si_site =
   dss_shipsite no-error.
   if not available si_mstr then do:
      {us/bbi/pxmsg.i &MSGNUM = 708 &ERRORLEVEL = 3
         &FIELDNAME = ""ttDistributionOrder.dssShipsite""} /* SITE DOES NOT EXIST */
      if c-application-mode <> "API" then
         next-prompt dss_shipsite with frame a.
      undo, retry.
   end.

   if si_db <> global_db then do:
      /* SITE IS NOT ASSIGNED TO THIS DOMAIN */
      {us/bbi/pxmsg.i &MSGNUM = 6251 &ERRORLEVEL = 3}
      undo, retry.
   end.

   if rec_site <> "" then do:
      find si_mstr no-lock  where si_mstr.si_domain = global_domain and
      si_site = rec_site no-error.
      if not available si_mstr then do:
         /* SITE DOES NOT EXIST */
         {us/bbi/pxmsg.i &MSGNUM = 708 &ERRORLEVEL = 3
            &FIELDNAME = ""ttDistributionOrder.recSite""}
         if c-application-mode <> "API" then
            next-prompt rec_site with frame a.
         undo, retry.
      end.
      if si_db <> global_db then do:
         {us/gp/gprunp.i "mgdompl" "p" "ppDomainConnect"
                             "(input si_db,
                               output lv_error_num,
                               output lv_name)"}

         if lv_error_num <> 0  then do:
            c-err-msg = getTermLabel("FOR_SITE",15) + " " + lv_name.
            /* DATABASE IS NOT AVAILABLE */
            {us/bbi/pxmsg.i &MSGNUM = lv_error_num &ERRORLEVEL = 3
                     &MSGARG1 = c-err-msg
                     &MSGARG2 = """"
                     &MSGARG3 = """"
                     &FIELDNAME = ""ttDistributionOrder.recSite""}
            if c-application-mode <> "API" then
               next-prompt rec_site with frame a.
            undo, retry.
         end.
      end.
   end.

   if rec_site <> "" then do:
      if c-application-mode = "API" and lLegacyAPI then
          for first dss_mstr
             where dss_mstr.dss_domain = global_domain
             and   dss_nbr      = ttDistOrderTrans.nbr
             and   dss_shipsite = ttDistOrderTrans.shipSite
             and   dss_rec_site = rec_site
             no-lock:
          end.
      else
         find dss_mstr no-lock using dss_nbr and dss_shipsite
          where dss_mstr.dss_domain = global_domain and  dss_rec_site =
          rec_site no-error.

      if not available dss_mstr then do:
         /* DISTRIBUTION ORDER DOES NOT EXIST */
         {us/bbi/pxmsg.i &MSGNUM = 1600 &ERRORLEVEL = 3
            &FIELDNAME=""ttDistributionOrder.recSite""}
         if c-application-mode <> "API" then
            next-prompt rec_site with frame a.
         undo, retry.
      end.
   end.

   do transaction:

      /* PREVENT MULTIPLE USERS FROM SHIPPING THE SAME D.O. AT THE SAME TIME */
      repeat:
         if c-application-mode = "API" and lLegacyAPI then
            for first dss_mstr
               where dss_mstr.dss_domain = global_domain
               and dss_nbr      = ttDistOrderTrans.nbr
               and dss_shipsite = ttDistOrderTrans.shipSite
               exclusive-lock:
            end.
         else
            find dss_mstr exclusive-lock
               using dss_nbr and dss_shipsite
               where dss_mstr.dss_domain = global_domain
            no-wait no-error.

         if not available dss_mstr
            then do on endkey undo mainloop, next mainloop:
            /* ATTEMPTING TO LOCK <<#>> RECORD. <<#>> TO EXIT. */
            {us/bbi/pxmsg.i &MSGNUM = 1400 &ERRORLEVEL = 1
                     &MSGARG1 = getTermLabel(""'DISTRIBUTION_ORDER'"",25)
                     &MSGARG2 = kblabel(""end-error"")}
            if c-application-mode <> "API" then
               pause 5.
            next.
         end.
         leave.
      end.

      global_site = dss_shipsite.

      {us/bbi/gprun.i ""dsdoisb.p""
               "(input dss_nbr,
                 input dss_shipsite,
                 input rec_site,
                 input fill_all,
                 input fill_pick)"}
   end. /* transaction */

   /* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
   {us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

   if use-log-acctg then do:
      if c-application-mode <> "API" then do:
         clear frame c all.
         hide frame c no-pause.

         clear frame d all.
         hide frame d  no-pause.
      end. /* if c-application-mode <> "API" */

      if c-application-mode <> "API"
         or (c-application-mode = "API" and not lLegacyAPI)
      then do:
         assign
            calc_fr = true
            disp_fr = true
            undo_dsdomtp = true.

         if c-application-mode = "API" and not lLegacyAPI then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "ttFreightData").
         end. /* c-application-mode = "API" */

         /* PROMPT FOR FREIGHT DATA */
         {us/gp/gprunmo.i &module = "LA" &program = "dsdomtp.p"
                    &param  = """(input recid(dss_mstr),
                                  input false)"""}

         if c-application-mode = "API" and not lLegacyAPI then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "").
         end. /* c-application-mode = "API" */

         if undo_dsdomtp then
            undo mainloop,retry mainloop.
      end. /* if c-application-mode <> "API" or (c-application-mode = "API" */
   end. /* IF use-log-acctg */

   partSelect:
   do transaction on error undo, retry:

      if c-application-mode = "API" and retry
         then return error return-value.

      setd:
      do while true:
         assign
            part = ""
            req-nbr = "".

         empty temp-table tt_bo.
         empty temp-table tt_ds_det.

         for each ds_det no-lock
            where ds_det.ds_domain = global_domain
            and  (ds_nbr           = dss_nbr
            and   ds_shipsite = dss_shipsite
            and   ds_status <> "c"
            and   (ds_site = rec_site or rec_site = "")
            and   (ds_part > part
               or (ds_part = part and ds_req_nbr >= req-nbr))
             and ((ds_qty_conf >= 0 and ds_qty_conf > ds_qty_ship)
                or   (ds_qty_conf < 0 and ds_qty_conf < ds_qty_ship)))
             by    ds_part:
             create tt_ds_det.
                assign
                   tt_ds_det.tt_ds_domain   = ds_domain
                   tt_ds_det.tt_ds_nbr      = ds_nbr
                   tt_ds_det.tt_ds_part     = ds_part
                   tt_ds_det.tt_ds_site     = ds_site
                   tt_ds_det.tt_ds_req_nbr  = ds_req_nbr
                   tt_ds_det.tt_ds_shipsite = ds_shipsite
                   tt_ds_det.tt_ds_qty_conf = ds_qty_conf
                   tt_ds_det.tt_ds_qty_ship = ds_qty_ship
                   tt_ds_det.tt_ds_qty_chg  = ds_qty_chg
                   tt_ds_det.tt_ds_loc      = ds_loc.
         end.


         /* DISPLAY DETAIL */
         display-detail:
         repeat:
            if c-application-mode = "API" and retry
               then return error return-value.

            if c-application-mode <> "API" then do:
               clear frame c all no-pause.
               clear frame d all no-pause.
               view frame c.
               view frame d.
            end.
            for each ds_det no-lock use-index ds_nbr
                   where ds_det.ds_domain = global_domain and (  ds_nbr =
                   dss_nbr
                  and ds_shipsite = dss_shipsite
                  and ds_status <> "c"
                  and (ds_site = rec_site or rec_site = "")
                  and (ds_part > part
                  or (ds_part = part and ds_req_nbr >= req-nbr))
                  and ((ds_qty_conf >= 0 and ds_qty_conf > ds_qty_ship)
                  or   (ds_qty_conf < 0 and ds_qty_conf < ds_qty_ship))
                  ) by ds_nbr
                  by ds_part by ds_site by ds_req_nbr:

               if ds_qty_conf >= 0 then
                  qopen = max(ds_qty_conf - max(ds_qty_ship, 0), 0).
               else
                  qopen = min(ds_qty_conf - min(ds_qty_ship, 0), 0).

               if c-application-mode <> "API" then
                  display
                     ds_part
                     ds_site
                     ds_req_nbr
                     ds_qty_conf    format "->>>>>>>9.9<<<<<<<"
                     qopen          format "->>>>>>>9.9<<<<<<<"
                                    label "Qty Open"
                     ds_qty_chg     format "->>>>>>>9.9<<<<<<<"
                  with frame c.

               if frame-line(c) = frame-down(c) then
                  leave.
               if c-application-mode <> "API" then
                  down 1 with frame c.
            end.

            /* us/bbi/gpiswrap.i QUERIES THE SESSION PARAMETER FOR */
            /* THE MFGWRAPPER TAG                           */
            if not {us/bbi/gpiswrap.i}
            then
               input clear.

            if c-application-mode <> "API" then
               display
                  part
                  req-nbr
               with frame d.

            frame-d-input:
            do on error undo, retry:
               if c-application-mode = "API" and retry
                  then return error return-value.

               if c-application-mode = "API" then do:
                  if not lLegacyAPI then do:
                     run getNextRecord in ApiMethodHandle (input "ttOrderItem").
                     if return-value = {&RECORD-NOT-FOUND} then
                        leave display-detail.
                  end.
                  else do:
                     find first ttDistOrderTransDet
                        where ttDistOrderTransDet.nbr  = dss_nbr
                        no-lock no-error.
                     if not available ttDistOrderTransDet then leave.
                  end.
               end.

               if c-application-mode <> "API" then
               set
                  part
                  req-nbr
               with frame d
               editing:
                  if frame-field = "part" then do:
                     /* FIND NEXT/PREVIOUS RECORD */
                     {us/mf/mfnp17.i tt_ds_det inds_nbr
                        "    tt_ds_det.tt_ds_domain = global_domain
                         and tt_ds_nbr              = dss_nbr
                         and tt_ds_shipsite         = dss_shipsite
                         and (tt_ds_site            = rec_site
                          or rec_site               = """")"
                        tt_ds_part "input part"}

                     if recno <> ? then do:
                        assign
                           part    = tt_ds_det.tt_ds_part
                           req-nbr = tt_ds_det.tt_ds_req_nbr.

                        display
                           part
                           req-nbr
                        with frame d.

                        find pt_mstr no-lock
                          where pt_mstr.pt_domain = global_domain
                          and   pt_part           = tt_ds_det.tt_ds_part
                        no-error.
                        if available pt_mstr then
                           display
                              pt_um
                              pt_desc1
                           with frame d.
                        else
                           display
                              "" @ pt_um
                              "" @ pt_desc1
                        with frame d.

                        if tt_ds_det.tt_ds_qty_conf >= 0 then
                           qopen = max(tt_ds_det.tt_ds_qty_conf -
                                   max(tt_ds_det.tt_ds_qty_ship, 0), 0).
                        else
                           qopen   = min(tt_ds_det.tt_ds_qty_conf -
                                     min(tt_ds_det.tt_ds_qty_ship, 0), 0).
                           qty_chg = tt_ds_det.tt_ds_qty_chg.

                        display
                           qopen
                           qty_chg                  @ lotserial_qty
                           ""                       @ lotserial
                           tt_ds_det.tt_ds_loc      @ location
                           tt_ds_det.tt_ds_shipsite @ site
                           ""                       @ multi_entry
                        with frame d.

                     end.
                  end.
                  else do:
                     status input.
                     readkey.
                     apply lastkey.
                  end.
               end.
               else
                  if not lLegacyAPI then
                     assign
                        {us/mf/mfaiset.i part    ttOrderItem.part}
                        {us/mf/mfaiset.i req-nbr ttOrderItem.reqNbr}.
                  else
                     assign
                        {us/mf/mfaiset.i part    ttDistOrderTransDet.part}
                        {us/mf/mfaiset.i req-nbr ttDistOrderTransDet.reqNbr}.

               status input.

               if part = "" and req-nbr = "" then
                  leave.

               frame-d-loop:
               repeat:

                  if retry and c-application-mode = "API"
                     then return error return-value.

                  multi_entry = no.

                  if c-application-mode = "API" and lLegacyAPI then
                     for first ds_det use-index ds_nbr
                        where ds_det.ds_domain = global_domain
                        and ds_nbr      = dss_nbr
                        and ds_shipsite = dss_shipsite
                        and ds_site     = dss_rec_site
                        and ds_part     = part
                        and ds_req_nbr  = req-nbr
                        no-lock:
                     end.
                  else
                     find first ds_det  where ds_det.ds_domain = global_domain and
                     (  ds_nbr = dss_nbr
                        and ds_shipsite = dss_shipsite
                        and ds_site = dss_rec_site
                        and (ds_part = part or part = "")
                        and (ds_req_nbr = req-nbr or req-nbr = "")
                        ) use-index ds_nbr no-lock
                        no-error.

                  {us/px/pxrun.i &PROC = 'isItemSerializationMandatory'
                              &PROGRAM = 'pafunc.p'
                              &HANDLE = ph_pafunc
                              &PARAM = "(input part,
                                         output isSerialized)"
                              &NOAPPERROR = true
                              &CATCHERROR = true}

                  if isSerialized then do:
                     /* ITEM NUMBER DOES NOT EXIST */
                     {us/bbi/pxmsg.i &MSGNUM = 13694 &ERRORLEVEL = 3}
                     undo frame-d-input, retry frame-d-input.
                  end.

                  if not available ds_det then do:

                     if part > "" then do:
                        find pt_mstr
                            where pt_mstr.pt_domain = global_domain and
                            pt_part = part no-lock no-error.
                        if not available pt_mstr then do:
                           /* ITEM NUMBER DOES NOT EXIST */
                           {us/bbi/pxmsg.i &MSGNUM = 16 &ERRORLEVEL = 3}
                           undo frame-d-input, retry frame-d-input.
                        end.
                     end.

                     if (req-nbr > "" and
                        can-find (first ds_det  where ds_det.ds_domain =
                        global_domain and
                        ds_shipsite = dss_shipsite
                        and ds_site = dss_rec_site
                        and ds_req_nbr = req-nbr))
                     then do:

                        find ds_det no-lock
                            where ds_det.ds_domain = global_domain and
                            ds_shipsite = dss_shipsite
                           and ds_site = dss_rec_site
                           and ds_req_nbr = req-nbr
                           and ds_part = part no-error.

                        if available ds_det and ds_nbr > "" then do:
                           /* REQ ALREADY ATTACHED TO DISTRIBUTION ORDER # */
                           {us/bbi/pxmsg.i &MSGNUM = 1610 &ERRORLEVEL = 3
                                    &MSGARG1 = ds_nbr
                                    &MSGARG2 = """"
                                    &MSGARG3 = """"}
                        end.
                        else do:
                           /* REQ NOT ATTACHED TO THIS DISTRIBUTION ORDER */
                           {us/bbi/pxmsg.i &MSGNUM = 1609 &ERRORLEVEL = 3}
                        end.
                        undo frame-d-input, retry frame-d-input.
                     end.

                     if (req-nbr = "" and
                        can-find (first ds_det  where ds_det.ds_domain =
                        global_domain and
                        ds_shipsite = dss_shipsite
                        and ds_part = part))
                     then do:
                        /* REQ NOT ATTACHED TO THIS DISTRIBUTION ORDER */
                        {us/bbi/pxmsg.i &MSGNUM = 1609 &ERRORLEVEL = 3}
                        undo frame-d-input, retry frame-d-input.
                     end.

                     /* REQUISITION DOES NOT EXIST */
                     {us/bbi/pxmsg.i &MSGNUM = 193 &ERRORLEVEL = 3}
                     undo frame-d-input, retry frame-d-input.
                  end.

                  find si_mstr no-lock  where si_mstr.si_domain = global_domain
                  and  si_site = ds_site
                     no-error.
                  if not available si_mstr then do:
                     /* SITE DOES NOT EXIST */
                     {us/bbi/pxmsg.i &MSGNUM = 708 &ERRORLEVEL = 3}
                     undo frame-d-input, retry frame-d-input.
                  end.

                  if si_db <> global_db then do:
                     {us/gp/gprunp.i "mgdompl" "p" "ppDomainConnect"
                            "(input si_db,
                              output lv_error_num,
                              output lv_name)"}

                     if lv_error_num <> 0 then do:
                        c-err-msg = getTermLabel("FOR_SITE",15) + " " + lv_name.
                       /* DATABASE IS NOT AVAILABLE */
                       {us/bbi/pxmsg.i &MSGNUM = lv_error_num &ERRORLEVEL = 3
                                &MSGARG1 = c-err-msg
                                &MSGARG2 = """"
                                &MSGARG3 = """"}

                       undo frame-d-input, retry frame-d-input.
                     end.
                  end.
                  find pt_mstr
                      where pt_mstr.pt_domain = global_domain and  pt_part =
                      ds_part no-lock no-error.
                  if not available pt_mstr then do:
                     /* ITEM NUMBER DOES NOT EXIST */
                     {us/bbi/pxmsg.i &MSGNUM = 16 &ERRORLEVEL = 2}
                     if c-application-mode <> "API" then
                        display
                           part
                           " " @ pt_um
                           " " @ pt_desc1
                        with frame d.
                  end.
                  else do:
                     if c-application-mode <> "API" then
                        display
                           pt_part @ part
                           pt_um
                           pt_desc1
                        with frame d.
                  end.

                  ds_recno = recid(ds_det).
                  find ds_det exclusive-lock
                     where recid(ds_det) = ds_recno no-error.

                  /* NEED TO ASSIGN ds_line ON PRE-EXISTING ds_det IF ZERO */
                  if ds_line = 0 then do:
                     do for dsdet:
                        for last dsdet
                             where dsdet.ds_domain = global_domain and
                             dsdet.ds_nbr = dss_nbr
                            and dsdet.ds_shipsite = dss_shipsite
                        no-lock
                        use-index ds_nbr:
                           last_dsline = dsdet.ds_line + 1.
                        end.

                        if not available dsdet then
                           last_dsline = 1.
                     end. /* DO FOR dsdet */

                     ds_line = last_dsline.
                  end.

                  assign
                     part = ds_part
                     req-nbr = ds_req_nbr.


                  if ds_qty_conf >= 0 then
                     qopen = max(ds_qty_conf - max(ds_qty_ship, 0), 0).
                  else
                     qopen = min(ds_qty_conf - min(ds_qty_ship, 0), 0).

                  qty_chg = ds_qty_chg.

                  if c-application-mode <> "API" then
                     display
                        ds_req_nbr  @ req-nbr
                        qopen
                        qty_chg     @ lotserial_qty
                        ""          @ lotserial
                        ds_loc      @ location
                        ds_shipsite @ site
                        ""          @ multi_entry
                     with frame d.

                  lotserial_control = "".

                  if available pt_mstr then do:
                     {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                              &HANDLE = ph_ppitxr
                              &PARAM = "( input  part,
                                          input  ds_shipsite,
                                          input ""pt_lot_ser"",
                                          output lotserial_control)"
                              &NOAPPERROR = true
                              &CATCHERROR = true
                     }
                  end.
                  if can-find (first ds_det
                     where ds_domain   = global_domain
                     and   ds_nbr      = dss_nbr
                     and   ds_site     = dss_rec_site
                     and   ds_shipsite = dss_shipsite
                     and   ds_part     = part
                     and   ds_req_nbr  = req-nbr
                     and   ds_status   = "c")
                  then do:
                     /* REQUISITION CLOSED,                 */
                     /* CANNOT PROCESS DISTRIBUTION ORDER # */
                     {us/bbi/pxmsg.i &MSGNUM=6790 &ERRORLEVEL=3 &MSGARG1=dss_nbr}
                     undo frame-d-input, retry frame-d-input.
                  end. /* IF CAN-FIND (FIRST ds_det ... */

                  run proc-setup-frame-d.

                  do on error undo, retry on endkey undo, leave:

                     if retry and c-application-mode = "API"
                        then return error return-value.

                     ds_recno = recid(ds_det).

                     /*REMOVE ANY PREVIOUSLY CREATED TRANS_INFO RECORD*/
                     if lotserial_qty <> 0 then do:
                        {us/bbi/gprun.i ""dsdorcb.p""
                                 "(input site,
                                   input location,
                                   input pt_part,
                                   input lotserial,
                                   input lotref,
                                   input 0,
                                   input ds_git_site,
                                   input ds_trans_id,
                                   input ""ISS-DO"",
                                   output from_expire,
                                   output from_grade,
                                   output from_assay,
                                   output from_status,
                                   output from_ld_exists)"}
                     end.

                     cancel_bo = false.

                     if c-application-mode <> "API" then
                     update
                        lotserial_qty
                        cancel_bo
                        site
                        location
                        lotserial
                        lotref
                        multi_entry
                     with frame d
                     editing:
                        assign
                           global_site = input site
                           global_loc = input location
                           global_lot = input lotserial.
                        readkey.
                        apply lastkey.
                     end.
                     else if not lLegacyAPI then
                        assign
                           {us/mf/mfaistvl.i lotserial_qty  ttOrderItem.issueQty}
                           {us/mf/mfaistvl.i cancel_bo      ttOrderItem.cancelBO}
                           {us/mf/mfaistvl.i site           ttOrderItem.site}
                           {us/mf/mfaistvl.i location       ttOrderItem.location}
                           {us/mf/mfaistvl.i lotserial      ttOrderItem.lotSerial}
                           {us/mf/mfaistvl.i lotref         ttOrderItem.lotRef}
                           {us/mf/mfaistvl.i multi_entry    ttOrderItem.multiEntry}
                           global_site = input site
                           global_loc  = input location
                           global_lot  = input lotserial.

                     for first tt_bo
                        where tt_domain     = global_domain
                        and   tt_bo.tt_ds_req_nbr = ds_req_nbr
                     no-lock:
                     end. /* FOR FIRST tt_bo*/

                     if not available tt_bo
                     then do:
                        create tt_bo.
                        assign
                           tt_domain     = global_domain
                           tt_bo.tt_ds_req_nbr = ds_req_nbr.
                     end. /* IF NOT AVAILABLE tt_bo */

                     assign
                        tt_domain          = global_domain
                        tt_bo.tt_cancel_bo = cancel_bo.


                     if c-application-mode = "API" and lLegacyAPI then do:
                        assign
                           {us/mf/mfaiset.i lotserial_qty ttDistOrderTransDet.qty}
                           {us/mf/mfaiset.i site ttDistOrderTransDet.site}
                           {us/mf/mfaiset.i location ttDistOrderTransDet.loc}
                           {us/mf/mfaiset.i lotserial ttDistOrderTransDet.lot}
                           {us/mf/mfaiset.i lotref ttDistOrderTransDet.ref}
                           multi_entry = yes.
                      end.

                     i = 0.
                     for each sr_wkfl no-lock
                            where sr_wkfl.sr_domain = global_domain and
                            sr_userid = SessionUniqueID
                           and sr_lineid = cline:
                        i = i + 1.
                        if i > 1 then do:
                           multi_entry = yes.
                           leave.
                        end.
                     end.

                     for first tt_ds_det
                        where tt_ds_det.tt_ds_domain  = global_domain
                          and tt_ds_det.tt_ds_nbr     = dss_nbr
                          and tt_ds_det.tt_ds_part    = input part
                          and tt_ds_det.tt_ds_req_nbr = ds_req_nbr
                     exclusive-lock:
                        tt_ds_qty_chg = lotserial_qty.
                     end. /* FOR FIRST tt_ds_det  */

                     assign
                        total_lotserial_qty = qty_chg
                        trans_um = (if available pt_mstr then pt_um else "")
                        trans_conv = 1.

                     if multi_entry then do:
                        if i >= 1 then do:
                           assign
                              site = ""
                              location = ""
                              lotserial = ""
                              lotref = "".
                        end.

                        assign
                           lotnext = lotserial
                           lotprcpt = no.

                        if c-application-mode = "API" and lLegacyAPI then do:
                           assign
                              apiShipSite = ttDistOrderTransDet.site.
                            {us/gp/gpttmv.i
                                     ttDistOrderTransDet
                                     ttInventoryTransDet
                                     "ttDistOrderTransDet.nbr = ds_det.ds_nbr
                                      and ttDistOrderTransDet.reqNbr
                                          = ds_det.ds_req_nbr
                                      and ttDistOrderTransDet.site
                                          = apiShipSite"}

                           run setInventoryTransDet in apiMethodHandle
                              (input table ttInventoryTransDet).
                        end.

                        if c-application-mode = "API" and not lLegacyAPI then do:
                           run setCommonDataBuffer in ApiMethodHandle
                              (input "ttItemMultiEntry").
                        end. /* c-application-mode = "API" */

                        /* UPDATE sr_wkfl WITH MULTI-ENTRY DATA */
                        {us/bbi/gprun.i ""dssrup.p""
                                 "(input ds_shipsite,
                                   input ds_git_site,
                                   input ds_trans_id,
                                   input site,
                                   input location,
                                   input lotserial,
                                   input lotref,
                                   input lotserial_qty,
                                   input cline,
                                   input ""ISS-DO"",
                                   input """",
                                   input """",
                                   input lotprcpt,
                                   input rec_site,
                                   input nbr,
                                   input shipsite,
                                   input rec_site,
                                   input-output lotnext,
                                   output total_lotserial_qty)"}

                        if c-application-mode = "API" and not lLegacyAPI then do:
                           run setCommonDataBuffer in ApiMethodHandle
                              (input "").
                        end. /* c-application-mode = "API" */

                     end.
                     else do:
                        find si_mstr no-lock  where si_mstr.si_domain =
                        global_domain and  si_site = site
                           no-error.
                        if not available si_mstr then do:
                           /* SITE DOES NOT EXIST */
                           {us/bbi/pxmsg.i &MSGNUM = 708 &ERRORLEVEL = 3
                              &FIELDNAME = ""ttOrderItem.site""}
                           if c-application-mode <> "API" then
                              next-prompt site with frame d.
                           undo, retry.
                        end.

                        /* Check if Item, Site & Loc Combination is restricted */
                        if lookup(execname, "dsdois.p,dsdomt02.p") > 0
                        then do:

                           empty temp-table ttUpdateRestrictionSignature.
                           create ttUpdateRestrictionSignature.

                           assign
                              ttUpdateRestrictionSignature.category   = {&DOSHP}
                              ttUpdateRestrictionSignature.program    = execname
                              ttUpdateRestrictionSignature.part       = part
                              ttUpdateRestrictionSignature.site       = site
                              ttUpdateRestrictionSignature.siteTo     = rec_site
                              ttUpdateRestrictionSignature.location   = location
                              ttUpdateRestrictionSignature.locationTo = ?
                              ttUpdateRestrictionSignature.inventoryStatus   = ?
                              ttUpdateRestrictionSignature.inventoryStatusTo = ?
                              ttUpdateRestrictionSignature.account           = ?
                              ttUpdateRestrictionSignature.subAccount        = ?
                              ttUpdateRestrictionSignature.costCenter        = ?
                              ttUpdateRestrictionSignature.project           = ?
                              ttUpdateRestrictionSignature.changeInventoryStatus
                                 = ?.

                           if isUpdateRestricted
                              (input table ttUpdateRestrictionSignature,
                               input yes)
                           then do:
                              undo, retry.
                           end.
                        end. /* if execname = "dsdois.p" or "dsdomt02.p" */
                        /* Finish check if Item, Site & Loc is restricted */

 
                        trqty = lotserial_qty.
                        for each sr_wkfl no-lock  where sr_wkfl.sr_domain =
                        global_domain and
                              sr_userid = SessionUniqueID
                              and sr_lineid begins
                              substring(cline,1,index(cline,dblcol) + 1)
                              and sr_lineid <> cline
                              and sr_site = site
                              and sr_loc = location
                              and sr_lotser = lotserial
                              and sr_ref = lotref
                              and sr_qty > 0:
                           trqty = trqty + sr_qty.
                        end.

/*c1603*/               allowToIssue = yes.
                        if trqty > 0 then do:
                           {us/px/pxrun.i &PROC = 'allowIssueWithoutSerialization'
                                 &PROGRAM = 'paicxr.p'
                                 &HANDLE = ph_paicxr
                                 &PARAM = "(input global_part,
                                            input site,
                                            input location,
                                            input lotserial,
                                            input lotref,
                                            input trqty,
                                            output allowToIssue,
                                            output looseQty)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true}
                        end.
                        else if trqty < 0 then do:
                           {us/px/pxrun.i &PROC = 'allowIssueWithoutSerialization'
                                    &PROGRAM = 'paicxr.p'
                                    &HANDLE = ph_paicxr
                                    &PARAM = "(input global_part,
                                               input ds_git_site,
                                               input ds_trans_id,
                                               input lotserial,
                                               input lotref,
                                               input abs(trqty),
                                               output allowToIssue,
                                               output looseQty)"
                                    &NOAPPERROR = true
                                    &CATCHERROR = true}
                        end.

                        if not allowToIssue then do:
                           {us/bbi/pxmsg.i &MSGNUM=12772 &ERRORLEVEL=4 }
                           undo frame-d-input, retry frame-d-input.
                        end.

                        /* CREATE INVENTORY TRANSACTION */
                        {us/bbi/gprun.i ""icedit.p""
                                 "(input ""ISS-DO"",
                                   input site,
                                   input location,
                                   input global_part,
                                   input lotserial,
                                   input lotref,
                                   input trqty,
                                   input trans_um,
                                   input """",
                                   input """",
                                   output undo-input)" }

                        if undo-input then
                           undo, retry.

                        /* FOLLOWING SECTION VALIDATES GIT */
                        /* SITE AND LOCATION FOR "RCT-GIT" TRAN.   */
                        {us/bbi/gprun.i ""dsdoisd.p""
                                 "(input recid(ds_det),
                                   input site,
                                   input location,
                                   input lotserial,
                                   input lotref,
                                   input trqty,
                                   input trans_um,
                                   output undo-input)"}

                        if undo-input then
                           undo, retry.

                        /* icedit4.p IS CALLED HERE TO VALIDATE */
                        /* "ISS-TR" AND "RCT-TR" IN ADDITION TO */
                        /* THE MAIN TRANSACTION ITSELF.         */
                        if site <> ds_shipsite then do:
                           {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                                    &HANDLE = ph_ppitxr
                                    &PARAM = "(input  global_part,
                                              input  ds_shipsite,
                                              input ""pt_loc"",
                                              output l_pt_loc)"
                                    &NOAPPERROR = true
                                    &CATCHERROR = true
                           }
                           {us/bbi/gprun.i ""icedit4.p""
                                    "(input ""ISS-DO"",
                                      input ds_shipsite,
                                      input site,
                                      input l_pt_loc,
                                      input location,
                                      input global_part,
                                      input lotserial,
                                      input lotref,
                                      input trqty,
                                      input trans_um,
                                      input """",
                                      input """",
                                      output undo-input)"}

                           if undo-input then
                              undo, retry.
                        end.

                        find first sr_wkfl  where sr_wkfl.sr_domain =
                        global_domain and  sr_userid = SessionUniqueID
                           and sr_lineid = cline no-error.

                        if lotserial_qty = 0
                           and not cancel_bo
                        then do:
                           if available sr_wkfl
                           then do:
                              total_lotserial_qty =
                              total_lotserial_qty - sr_qty.
                              delete sr_wkfl.
                           end. /* IF AVAILABLE sr_wkfl */
                        end. /* IF lotserial_qty = 0 */
                        else do:
                           if available sr_wkfl then do:
                              assign
                                 total_lotserial_qty =
                                 total_lotserial_qty - sr_qty
                                 + lotserial_qty
                                 sr_site = site
                                 sr_loc = location
                                 sr_lotser = lotserial
                                 sr_ref = lotref
                                 sr_qty = lotserial_qty.
                           end.
                           else do:
                              create sr_wkfl. sr_wkfl.sr_domain = global_domain.
                              assign
                                 sr_userid = SessionUniqueID
                                 sr_lineid = cline
                                 sr_site = site
                                 sr_loc = location
                                 sr_lotser = lotserial
                                 sr_ref = lotref
                                 sr_qty = lotserial_qty.
                              total_lotserial_qty = lotserial_qty.
                              recno = recid(sr_wkfl).
                           end.
                        end.
                     end.

                     ds_qty_chg = total_lotserial_qty.

                     if use-log-acctg and ds_fr_list <> ""
                        and dss_fr_terms <> ""
                     then do:

                        set_wt:
                        do on error undo, retry:

                           if c-application-mode = "API" and retry
                              then return error return-value.

                           if c-application-mode = "API" and not lLegacyAPI then do:
                              run setCommonDataBuffer in ApiMethodHandle
                                 (input "ttItemFreight").
                           end. /* c-application-mode = "API" */

                           {us/bbi/gprun.i ""gpfrlwt.p""
                                     "(input base_curr,
                                       input 1,
                                       input 1,
                                       input dss_fr_min_wt,
                                       input dss_fr_terms,
                                       input dss_rec_site,
                                       if ds_due_date <> ?  then
                                          ds_due_date
                                       else
                                          today,
                                       input ds_fr_list,
                                       input ds_part,
                                       input ds_qty_chg,
                                       input dss_shipsite,
                                       input """",
                                       input pt_um,
                                       input calc_fr,
                                       input disp_fr,
                                       input dss_nbr,
                                       input "0",
                                       input "yes",
                                       input-output ds_fr_wt,
                                       input-output ds_fr_wt_um,
                                       input-output ds_fr_class,
                                       input-output ds_fr_chg,
                                       input-output freight_ok)" }

                           if c-application-mode = "API" and not lLegacyAPI then do:
                              run setCommonDataBuffer in ApiMethodHandle
                                 (input "").
                           end. /* c-application-mode = "API" */

                           if not freight_ok then do:
                              /* FREIGHT ERROR DETECTED.FREIGHT CHARGES MAY */
                              /* BE INCOMPLETE  */
                              {us/bbi/pxmsg.i &MSGNUM = 669 &ERRORLEVEL = 2 }
                              if c-application-mode <> "API" then
                                 if not (batchrun or {us/bbi/gpiswrap.i}) then pause.
                              undo set_wt,leave set_wt.
                           end. /* if not freight_ok */
                        end. /* set_wt */
                     end. /* If use-log-acctg  */
                  end.

                  leave.

               end.
            end.  /* FRAME D-INPUT */
         end.  /* REPEAT */

         do on endkey undo mainloop, retry mainloop:

            if retry and c-application-mode = "API"
               then return error return-value.

            yn = yes.
            /* DISPLAY ITEMS BEING ISSUED */
            {us/bbi/pxmsg.i &MSGNUM = 636 &ERRORLEVEL = 1
                     &CONFIRM = yn
                     &CONFIRM-TYPE = 'LOGICAL'}

            if yn = yes then do:
               if c-application-mode <> "API" then do:
                  hide frame c no-pause.
                  hide frame d no-pause.
               end.

               for each ds_det no-lock  where ds_det.ds_domain = global_domain
               and (  ds_nbr = dss_nbr
                     and ds_shipsite = dss_shipsite
                     and (ds_site = rec_site or rec_site = "")
                     ) use-index ds_nbr,
                     each sr_wkfl no-lock  where sr_wkfl.sr_domain =
                     global_domain and  sr_userid = SessionUniqueID
                     and sr_lineid = ds_part + dblcol + ds_req_nbr
                     + dblcol + ds_shipsite
                     by ds_nbr by ds_part by ds_site by ds_req_nbr
                  with frame review width 80:

                  /* SET EXTERNAL LABELS */
                  setFrameLabels(frame review:handle).

                  if c-application-mode <> "API" then
                     display
                        ds_part
                        sr_site
                        sr_loc
                        sr_lotser
                        sr_ref format "x(8)" column-label "Ref"
                        sr_qty.
               end. /* For each ds_det */
            end.
         end.
         do on endkey undo mainloop, retry mainloop
            on error undo mainloop,  retry mainloop:

            allowToIssue = yes.

            for each ds_det no-lock
               where ds_det.ds_domain = global_domain
                 and (ds_nbr = dss_nbr
                      and ds_shipsite = dss_shipsite
                      and (ds_site = rec_site or rec_site = "")
                        ) use-index ds_nbr,
            each sr_wkfl no-lock
               where sr_wkfl.sr_domain = global_domain
                 and sr_userid = SessionUniqueID
                 and sr_lineid = ds_part + dblcol + ds_req_nbr
                     + dblcol + ds_shipsite:

               part = ds_part.

               if sr_qty > 0 then do:
                  {us/px/pxrun.i &PROC = 'allowIssueWithoutSerialization'
                                 &PROGRAM='paicxr.p'
                                 &HANDLE = ph_paicxr
                                 &PARAM = "(input ds_part,
                                            input sr_site,
                                            input sr_loc,
                                            input sr_lotser,
                                            input sr_ref,
                                            input sr_qty,
                                            output allowToIssue,
                                            output looseQty)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true}
               end.
               else if sr_qty < 0 then do:

                  {us/px/pxrun.i &PROC = 'allowIssueWithoutSerialization'
                                 &PROGRAM = 'paicxr.p'
                                 &HANDLE = ph_paicxr
                                 &PARAM = "(input ds_part,
                                            input ds_git_site,
                                            input ds_trans_id,
                                            input sr_lotser,
                                            input sr_ref,
                                            input abs(sr_qty),
                                            output allowToIssue,
                                            output looseQty)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true}
               end.
               if not allowToIssue then leave.

            end. /* For each ds_det */

            if not allowToIssue then do:
               /* There's no enough loose inventory for item */
               {us/bbi/pxmsg.i &MSGNUM=13336 &ERRORLEVEL=4 &MSGARG1=part}
               pause.
               undo partSelect, retry partSelect.
            end.
         end.

         do on endkey undo mainloop, retry mainloop:

            if retry and c-application-mode = "API"
               then return error return-value.

            yn1 = yes.
            /* IS ALL INFORMATION CORRECT? */
            {us/bbi/pxmsg.i &MSGNUM = 12 &ERRORLEVEL = 1
                     &CONFIRM = yn1
                     &CONFIRM-TYPE = 'LOGICAL'}
            if yn1 then do:
               undo-update = no.
               run validate-final-input.

               if undo-input and c-application-mode = "API"
                  then return error return-value.

               if undo-input then
                  next setd.

               if undo-update and c-application-mode = "API"
                  then return error return-value.

               if undo-update then
                  next setd.

               if c-application-mode <> "API" then do:
                  hide frame c.
                  hide frame d.
               end.
               leave setd.
            end.
         end.
      end.   /* DO WHILE TRUE */
   end.   /* DO TRANSACTION setd */

   dss_recno = recid(dss_mstr).

    if c-application-mode = "API" and lLegacyAPI then do:
       run setDistOrderTransRow in apiMethodHandle
          (input ttDistOrderTrans.apiSequence).
    end.

   if c-application-mode = "API" and not lLegacyAPI then do:
      run setCommonDataBuffer in ApiMethodHandle
         (input "ttShipmentTrailer").
   end. /* c-application-mode = "API" */

   /* DO SHIPMENT TRAILER */
   {us/bbi/gprun.i ""dsdoisc.p""}

   if c-application-mode = "API" and not lLegacyAPI then do:
      run setCommonDataBuffer in ApiMethodHandle
         (input "ttShipmentTrailer").
   end. /* c-application-mode = "API" */

   /* WHEN  THE  "END-ERROR" KEY IS PRESSED, CONTROL SHOULD    */
   /* BE RETURNED TO THE D/O PROCESSING SCREEN IF THIS PROGRAM */
   /* WAS CALLED FROM THE D/O PROCESSING SCREEN(auto_do_proc). */
   if keyfunction(lastkey) = "end-error" then
      if auto_do_proc then
         undo, leave.
      else
         undo, next.

   lv_accrue_freight = no.

   if use-log-acctg      and
      dss_fr_list  <> "" and
      dss_fr_terms <> "" and
      can-find (first ds_det  where ds_det.ds_domain = global_domain and
      ds_nbr = dss_nbr and ds_fr_list <> "" )
   then do transaction on error undo, retry:

      for first ft_mstr
          where ft_mstr.ft_domain = global_domain and  ft_terms = dss_fr_terms
          no-lock:

         if (ft_accrual_level = {&LEVEL_Shipment} or
             ft_accrual_level = {&LEVEL_Line})
         then do:

            lv_accrue_freight = yes.

            /* DISPLAY LOGISTICS CHARGE CODE DETAIL */
            {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                        &param  = """(input 'ADD',
                                      input '{&TYPE_DO}',
                                      input dss_nbr,
                                      input dss_shipsite,
                                      input ft_lc_charge,
                                      input ft_accrual_level,
                                      input if c-application-mode <> 'API' then
                                            yes else no,
                                      input no)"""}
            /* CALL PROCEDURE TO CALCULATE LINE DETAIL */
            {us/gp/gprunp.i "lagenpro" "p" "pCalculateLineCharges"
            "(input recid(dss_mstr), input '{&TYPE_DO}')"}

            /* FREIGHT CALCULATION */
            {us/gp/gprunmo.i  &module = "LA" &program = "dsfrcals.p"
                        &param  = """(input dss_recno, input ' ')"""}

         end. /* IF ft_accrual_level . .*/
      end. /* FOR FIRST ft_mstr */
   end. /* IF use-log-acctg and  */

   if c-application-mode <> "API" then
      hide frame a no-pause.

   if c-application-mode = "API" and lLegacyAPI then do:
      /* Copy distribution order shipment shipper temp table data
       * into shipper temp tables.  icshmt.p is called from multiple
       * menus and uses the commonly defined shipper temp table data.
       */
      {us/gp/gpttcp.i ttDistOrderShipper
                ttShipper
                "ttDistOrderShipper.nbr      = dss_mstr.dss_nbr
                 and ttDistOrderShipper.shipFrom = dss_mstr.dss_shipsite"}

      run setShipper in apiMethodHandle (input table ttShipper).

      {us/gp/gpttcp.i ttDistOrderShipCarrier
                ttShipperCarrierDet
                "ttDistOrderShipCarrier.nbr = dss_mstr.dss_nbr
                 and ttDistOrderShipCarrier.shipSite = dss_mstr.dss_shipsite"}

      run setShipperCarrierDet in apiMethodHandle
         (input table ttShipperCarrierDet).

      {us/gp/gpttcp.i ttDistOrderShipCmt
                ttShipperComment
                "ttDistOrderShipCmt.nbr = dss_mstr.dss_nbr
                 and ttDistOrderShipCmt.shipSite = dss_mstr.dss_shipsite"}

      run setShipperComment in apiMethodHandle (input table ttShipperComment).

      {us/gp/gpttcp.i ttDistOrderShipTrlCmt
                ttShipperTrlCmt
                "ttDistOrderShipTrlCmt.nbr = dss_mstr.dss_nbr
                 and ttDistOrderShipTrlCmt.shipSite = dss_mstr.dss_shipsite"}

      run setShipperTrlCmt in apiMethodHandle (input table ttShipperTrlCmt).
   end.

   shipment_id = "".

   if use-log-acctg and lv_accrue_freight then
   do transaction on error undo, retry:

      if shipment_id = "" then do:
         /* IF GLOBAL SHIPPING WAS USED TO SHIP DISTRIBUTION ORDER */
         /* SHIPMENT ID WILL BE NON-BLANK.  IF SHIPMENT ID IS      */
         /* BLANK, THEN PROMPT USER FOR SHIPMENT ID.               */
         assign
            lv_undo_flag = true
            lv_shipment_type = {&TYPE_DOShipment}
            lv_nrm_seqid = "".

         /* GET THE DO SHIPMENT SEQUENCE ID DEFINED IN LOGISTICS     */
         /* ACCOUNTING CONTROL FILE.                                 */
         for first lac_ctrl
          where lac_ctrl.lac_domain = global_domain no-lock:
            lv_nrm_seqid = lac_doship_nrm_id.
         end.

         if c-application-mode <> "API" then
            view frame a.

         if c-application-mode = "API" and not lLegacyAPI then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "ttShipmentID").
         end. /* c-application-mode = "API" */

         /* ENTER SHIPMENT-ID FOR DISCRETE SHIPMENTS */
         {us/gp/gprunmo.i  &module  = "LA" &program = "lalgship.p"
                     &param   = """(input lv_nrm_seqid,
                                    output shipment_id,
                                    input-output lv_undo_flag)"""}

         if c-application-mode = "API" and not lLegacyAPI then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "").
         end. /* c-application-mode = "API" */

         if c-application-mode <> "API" then
            hide frame a no-pause.

         if lv_undo_flag then lv_shipment_type = {&TYPE_DOShipper}.

      end.   /* if shipment-id = ""*/
      else
         lv_shipment_type = {&TYPE_DOShipper}.

   end. /* IF use-log-acctg and  */

   if c-application-mode = "API" and not lLegacyAPI then do:
      run setCommonDataBuffer in ApiMethodHandle
         (input "ttCommonShipperInfo").
   end. /* c-application-mode = "API" */

   {us/bbi/gprun.i ""dsdoisa.p"" "(input table tt_bo)" }

   if c-application-mode = "API" and not lLegacyAPI then do:
      run setCommonDataBuffer in ApiMethodHandle
         (input "").
   end. /* c-application-mode = "API" */

   if use-log-acctg and lv_accrue_freight 
   then do:
      /* CREATE FREIGHT ACCRUAL */
      {us/gp/gprunmo.i  &module = "LA" &program = "lafrpst.p"
                        &param  = """(input lv_shipment_type,
                                      input shipment_id,
                                      input dss_nbr,
                                      input dss_shipdate,
                                      input eff_date,
                                      input dss_rec_site,
                                      input '{&TYPE_DO}',
                                      input base_curr,
                                      input 1,
                                      input 1,
                                      input '',           /* pvo_ex_ratetype */
                                      input 0,            /* pvo_exru_seq */
                                      input '')"""}
   end. /* if use-log-acctg and lv_accrue_freight */

   if not auto_do_proc and c-application-mode <> "API" then
      view frame a.

   global_site = dss_shipsite.

   if c-application-mode = "API" and lLegacyAPI then leave.

   /* WHEN THIS PROGRAM IS CALLED FROM THE D/O PROCESSING SCREEN */
   /* CONTROL SHOULD BE RETURNED TO THE D/O PROCESSING SCREEN.   */
   if auto_do_proc then
      leave mainloop.

   release dss_mstr.
end.

delete procedure hUpdateRestrictedLibrary no-error.

/* * * * * * * * * * INTERNAL PROCEDURES * * * * * * */

PROCEDURE proc-setup-frame-d:
   /* -------------------------------------------------------------
   Purpose: Setup/Initialize input fields/variables used in frame d.
   ----------------------------------------------------------------*/

   find ds_det exclusive-lock
      where recid(ds_det) = ds_recno no-error.

   assign
      site = ""
      location = ""
      lotserial = ""
      lotref = ""
      lotserial_qty = qty_chg
      cline = ds_part + dblcol + ds_req_nbr
            + dblcol + ds_shipsite
      global_part = ds_part.

   assign
      site = ds_shipsite
      location = ds_loc.

   i = 0.
   for each sr_wkfl no-lock
          where sr_wkfl.sr_domain = global_domain and  sr_userid = SessionUniqueID
         and sr_lineid = cline:

      assign
         site = sr_site
         location = sr_loc
         lotserial = sr_lotser
         lotref = sr_ref.

      i = i + 1.

      if i > 1 then do:
         assign
            site = ""
            location = ""
            lotserial = ""
            lotref = ""
            multi_entry = yes.
         leave.
      end. /* end i > 1  */
   end.   /* end for each sr_wkfl  */
END PROCEDURE.  /* PROCEDURE proc-setup-frames-d  */

PROCEDURE validate-final-input:

   /* -------------------------------------------------------------
   Purpose: Validate the input after the user responds "yes" to the
   "IS ALL INFORMATION CORRECT" prompt.
   ----------------------------------------------------------------*/

   define buffer srwkfl for sr_wkfl.

   for each ds_det no-lock  where ds_det.ds_domain = global_domain and (
   ds_nbr = dss_mstr.dss_nbr
         and ds_shipsite = dss_shipsite
         and (ds_site = rec_site or rec_site = "")
         ) use-index ds_nbr,
         each sr_wkfl no-lock  where sr_wkfl.sr_domain = global_domain and
         sr_userid = SessionUniqueID
         and sr_lineid = ds_part + dblcol + ds_req_nbr
         + dblcol + ds_shipsite
         by ds_nbr by ds_part by ds_site by ds_req_nbr:

      find si_mstr no-lock  where si_mstr.si_domain = global_domain and
      si_site = ds_site no-error.
      if not available si_mstr then do:
         /* SITE DOES NOT EXIST */
         {us/bbi/pxmsg.i &MSGNUM = 708 &ERRORLEVEL = 3}
         undo-input = yes.
         leave.
      end.

      if si_db <> global_db then do:
         {us/gp/gprunp.i "mgdompl" "p" "ppDomainConnect"
                             "(input si_db,
                               output lv_error_num,
                               output lv_name)"}

         if lv_error_num <> 0 then do:

            c-err-msg = getTermLabel("FOR_SITE",15) + " " + lv_name.
            /* DATABASE IS NOT AVAILABLE */
            {us/bbi/pxmsg.i &MSGNUM = lv_error_num &ERRORLEVEL = 3
                     &MSGARG1 = c-err-msg
                     &MSGARG2 = """"
                     &MSGARG3 = """"}
            undo-input = yes.
            leave.
         end.
      end.

      find pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
      pt_part = ds_part no-error.
      assign
         trans_um = if available pt_mstr then pt_um else ""
         trqty = 0.

      do for srwkfl:
         for each srwkfl no-lock  where srwkfl.sr_domain = global_domain and
               srwkfl.sr_userid = SessionUniqueID
               and srwkfl.sr_lineid begins
               substring(sr_wkfl.sr_lineid,1,
               index(sr_wkfl.sr_lineid,dblcol) + 1)
               and srwkfl.sr_site = sr_wkfl.sr_site
               and srwkfl.sr_loc = sr_wkfl.sr_loc
               and srwkfl.sr_lotser = sr_wkfl.sr_lotser
               and srwkfl.sr_ref = sr_wkfl.sr_ref
               and srwkfl.sr_qty > 0
               by ds_nbr by ds_part by ds_site by ds_req_nbr:
            trqty = trqty + sr_qty.
         end.
      end.

      /* CREATE INVENTORY TRANSACTION */
      {us/bbi/gprun.i ""icedit.p""
               "(input ""ISS-DO"",
                 input sr_site,
                 input sr_loc,
                 input ds_part,
                 input sr_lotser,
                 input sr_ref,
                 input trqty,
                 input trans_um,
                 input """",
                 input """",
                 output undo-input)" }

      if not undo-input then do:
         assign
            undo-update = yes
            lotserial_qty = sr_qty.

         /* VALIDATE GIT */
         {us/bbi/gprun.i ""dsdoisd.p""
                  "(input recid(ds_det),
                    input sr_site,
                    input sr_loc,
                    input sr_lotser,
                    input sr_ref,
                    input trqty,
                    input trans_um,
                    output undo-input)"}

         undo-update = undo-input.
      end.

      if undo-input then
         {us/bbi/pxmsg.i &MSGTEXT = "getTermLabel(""ITEM"",10) + "": ""
                           + ds_part + "" ""
                           + getTermLabel(""REQUISTION"",10) + "": ""
                           +  ds_req_nbr + "" ""
                           + getTermLabel(""SITE"",10) + "": ""
                           + sr_site + "" ""
                           + getTermLabel(""LOCATION"",15) + "": ""
                           + sr_loc"}.

      if undo-input then
         leave.

   end. /* for each ds_det */
END PROCEDURE. /* PROCEDURE validate-final-input */
