/* xxicshprt.p - Shipper Print "on the fly"                                  */
/* icshprt.p - Shipper Print "on the fly"                                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxicshprt.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/*                                                                           */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K04X* Steve Goeke       */
/* REVISION: 8.6      LAST MODIFIED: 04/09/97   BY: *K08N* Steve Goeke       */
/* REVISION: 8.6      LAST MODIFIED: 06/20/97   BY: *H19N* Aruna Patil       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane         */
/* REVISION: 8.6E     LAST MODIFIED: 05/15/98   BY: *K1JN* Niranjan R.       */
/* REVISION: 8.6E     LAST MODIFIED: 07/20/98   BY: *H1MC* Mansih K.         */
/* REVISION: 8.6E     LAST MODIFIED: 08/05/98   BY: *J2VP* Mansih K.         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan        */
/* REVISION: 9.0      LAST MODIFIED: 03/10/99   BY: *M0B8* Hemanth Ebenezer  */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan        */
/* REVISION: 9.0      LAST MODIFIED: 06/22/99   BY: *K21B* Reetu Kapoor      */
/* REVISION: 9.1      LAST MODIFIED: 12/28/99   BY: *N05X* Surekha Joshi     */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KS* myb               */
/* REVISION: 9.1      LAST MODIFIED: 09/25/00   BY: *N0W6* BalbeerS Rajput   */
/* Revision: 1.17     BY: Nikita Joshi          DATE: 09/07/01  ECO: *M1JZ*  */
/* Revision: 1.21     BY: Ashish Kapadia        DATE: 08/16/02  ECO: *N1Q1*  */
/* Revision: 1.23     BY: Paul Donnelly (SB)    DATE: 06/26/03  ECO: *Q00G*  */
/* Revision: 1.24     BY: Vinod Nair            DATE: 04/13/04  ECO: *P1XC*  */
/* Revision: 1.26     BY: Ed van de Gevel       DATE: 03/01/05  ECO: *R00G*  */
/* Revision: 1.27     BY: Steve Nugent          DATE: 01/30/08  ECO: *R059*  */
/* Revision: 1.28     BY: Xavier Prat           DATE: 06/26/08  ECO: *R0NZ*  */
/* Revision: 1.29     BY: Ellen Borden          DATE: 07/23/08  ECO: *R0YR*  */
/* Revision: 1.37     BY: Jean Miller           DATE: 08/12/08  ECO: *R118*  */
/* Revision: 1.38     BY: Jean Miller           DATE: 03/18/09  ECO: *R1FD*  */
/* Revision: 1.39     BY: Prajakta Patil        DATE: 06/22/09  ECO: *P66L*  */
/* $Revision: 1.2 $  BY: Katie Hilbert         DATE: 06/29/09  ECO: *R1L2*  */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 06-JUN-2012    BY:  gbg *c1308*                     */
/* CYB    LAST MODIFIED: 14-AUG-2012    BY:  gbg *c1329*                     */
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
 
/* PRINT LOT/SERIAL NUMBERS TO BE DISPLAYED FOR SO SHIPPERS AND            */
/* NON SO SHIPPERS EXCEPT FOR THOSE WITH ISS-WO (REPETITIVE) TRANSACTIONS. */
 
{us/mf/mfdtitle.i}
 {us/px/pxmaint.i}

{us/so/sottval.i}  /* COMMON TEMP-TABLES FOR ASN VALIDATION */
{us/so/sovalcon.i} /* COMMON VALIDATION CONSTANTS */
{us/so/sovalprc.i} /* COMMON PROCEDURES FOR ASN VALIDATION */
 
{us/pa/paconst.i}

{us/px/pxphdef.i pasopixr}
{us/px/pxphdef.i pascxr}

/* INPUT PARAMETERS */
define input parameter i_recid as recid no-undo.
define input parameter ipShipStep as character no-undo.
define input parameter table for tt_validation_fields.
define input-output parameter lEndValidationExecuted as logical.
 
/* LOCAL VARIABLES */
define variable v_ship_cmmts like mfc_logical initial true
   label "Include Shipper Comments"                   no-undo.
define variable v_pack_cmmts like mfc_logical initial true
   label "Include Packing List Comments"              no-undo.
define variable v_features   like mfc_logical initial false
   label "Print Features and Options"                 no-undo.
define variable v_assign     like mfc_logical initial false
   label "Assign Shipper Number"                      no-undo.
define variable v_assigned   like mfc_logical         no-undo.
define variable v_so_shipper like mfc_logical         no-undo.
define variable v_old_print  as character             no-undo.
define variable v_ok         like mfc_logical         no-undo.
define variable v_abort      like mfc_logical         no-undo.
define variable v_err        like mfc_logical         no-undo.
define variable v_errnum     as integer               no-undo.
define variable l_cust       like mfc_logical initial yes
   label "Print Customer Address"                     no-undo.
define variable v_print_sodet like mfc_logical initial no
   label "Print Sales Order Detail"                   no-undo.
define variable l_so_um       like mfc_logical
   label "Display Quantity In SO UM"                  no-undo.
define variable comp_addr          like ad_addr
   label "Company Address"                            no-undo.
define variable l_abs_id           like abs_id        no-undo.
define variable l_print_lotserials like mfc_logical initial yes
   label "Print Lot/Serial Numbers"                   no-undo.
define variable remove_pending_pick_qty like mfc_logical initial no
   label "Remove Pending Pick Qty"                   no-undo.
define variable l_tr_type          like im_tr_type    no-undo.
/*cy1024*/ define shared variable cyb_pst_prt as logical initial yes
/*cy1024*/   label "Post & Print Invoice"             no-undo.
/*cy1024*/ define shared variable cyb_so_recid as recid no-undo.
/*cy1024*/ define shared variable cyb_so_nbr like so_nbr no-undo.
define variable cValFld as character extent 14 no-undo.
define variable cValValue as character extent 14 no-undo.
define variable lValidationErrors as logical no-undo.
define variable lValidationWarnings as logical no-undo.
define variable cShipStep as character no-undo.
define variable yn as logical no-undo.
define variable isSerializationActive as logical no-undo.
define variable report_framework like mfc_logical no-undo.
define variable l_rf_report      as   logical          no-undo.

/* Determine whether API enabled version of RF is installed and whether converted report has been loaded */
l_rf_report = ({us/bbi/gpiswrap.i}) and
              (search("com/qad/shell/report/BatchServiceNextId.p") <> ?) and
              (can-find(first rptres_mstr where rptres_domain >= "" and rptres_code = "QAD_RetrobillRpt")) and
              (execname = "rcshwb.p" 
               or execname = "iclotr01.p"
               or execname = "iclotr02.p"
               or execname = "iclotr03.p"
               or execname = "iclotr04.p"
               or execname = "sosois.p").

define temp-table ttabsrecid no-undo
   field tabs_recid as recid
.

define variable scheduledReportID as integer initial -1 no-undo.

define temp-table ttExtraInfo no-undo
   field fName  as character
   field fType  as character
   field fValue as character
index nameIdx is unique primary fName.

define buffer shc_ctrl for shc_ctrl.
 
define buffer abs_item for abs_mstr.

/* FRAMES */
form
   v_ship_cmmts       colon 34
   v_pack_cmmts       colon 34
   v_features         colon 34
   v_print_sodet      colon 34
   v_assign           colon 34
   l_so_um            colon 34
   comp_addr          colon 34
   l_print_lotserials colon 34
   l_cust             colon 34
   remove_pending_pick_qty colon 34
   report_framework   colon 34
   skip
with frame a side-labels width 80
title color normal (getFrameTitle("PRINT_SHIPPER",20)).
report_framework:hidden in frame a = (l_rf_report = no).
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
for first soc_ctrl where soc_domain = global_domain
no-lock: end.
 
{us/px/pxrun.i &PROC  ='isSerializationActive'
               &PROGRAM = 'pascxr.p'
               &PARAM = "(output isSerializationActive)"
               &NOAPPERROR = true
               &CATCHERROR = true}

/* MAIN PROCEDURE BODY */
main_blk:
repeat with frame a:
 
   /* SET DEFAULT COMPANY ADDRESS */
 
   if comp_addr = ""
      and available soc_ctrl
   then
      comp_addr = soc_company.
 
   /* Read the shipper record */
   for first abs_mstr where recid(abs_mstr) = i_recid
   no-lock: end.
 
   if not available abs_mstr
      or abs_format = ""
      or abs_canceled
   then
      return.
 
   /* Check whether shipper is for sales orders */
   v_so_shipper = (abs_inv_mov = "" and
                  (abs_type = "s" or abs_type = "p")) or
                 can-find (im_mstr where im_domain = global_domain
                           and im_inv_mov = abs_inv_mov
                           and (im_tr_type = "ISS-SO" or im_tr_type = "ISS-COR")).
 
   /* GET THE SHIPPER'S TRANSACTION TYPE                    */
   /* icshtyp.p RETURNS BLANK VALUE FOR ISS-WO TRANSACTIONS */
   {us/bbi/gprun.i ""icshtyp.p""
            "(input i_recid,
              output l_tr_type)"}
 
   /* Hide inapplicable fields if not SO shipper */
   if not v_so_shipper then
   assign
      v_pack_cmmts:hidden       = true
      v_pack_cmmts              = false
      v_features:hidden         = true
      v_features                = false
      v_print_sodet:hidden      = true
      v_print_sodet             = false
      v_assign:hidden           = true
      v_assign                  = false
      l_so_um:hidden            = true
      l_so_um                   = false
      comp_addr:hidden          = true
      l_print_lotserials:hidden = true  when (   l_tr_type = ""
                                              or l_tr_type = "ISS-WO")
 
      l_print_lotserials        = false when (   l_tr_type = ""
                                              or l_tr_type = "ISS-WO")
      l_cust                    = true
      remove_pending_pick_qty:hidden = true
      remove_pending_pick_qty = false
      report_framework:hidden = true
      report_framework        = false
      .
 
   /* Save print flag */
   v_old_print = substring(abs_status,1,1).
 
   /* ONLY DEFAULT FIELDS IF AN SO SHIPPER */
   if v_so_shipper
   then do:
      run getFieldDefaults
         (input-output v_ship_cmmts,
          input-output v_pack_cmmts,
          input-output v_features,
          input-output v_print_sodet,
          input-output v_assign,
          input-output l_so_um,
          input-output comp_addr,
          input-output l_print_lotserials,
          input abs_id,
          input l_tr_type,
          input table tt_validation_fields).
 
      display
         v_ship_cmmts
         v_pack_cmmts
         v_features
         v_print_sodet
         v_assign
         l_so_um
         comp_addr
         l_print_lotserials
         remove_pending_pick_qty
         report_framework when (l_rf_report)
      with frame a.
 
   end.
 
   /* Get print criteria */
   update
      v_ship_cmmts
      v_pack_cmmts       when (v_so_shipper)
      v_features         when (v_so_shipper)
      v_print_sodet      when (v_so_shipper)
      v_assign           when (v_so_shipper
                               and abs_id begins "p")
      l_so_um            when (v_so_shipper)
      comp_addr          when (v_so_shipper)
      l_print_lotserials when (    l_tr_type <> ""
                               and l_tr_type <> "ISS-WO")
      l_cust             when (v_so_shipper)
      remove_pending_pick_qty when (v_so_shipper) and isSerializationActive
      report_framework   when (l_rf_report)
   with frame a
   editing:
 
      readkey.
      if frame-field = "comp_addr"
      then do:
         /* USE BRANCHED LOOKUPS FOR COMPANY ADDRESS */
         run determineBrowse
            (input frame-field,
             input "comp_addr",
             input "gplu007.p",
             input false,
             input table tt_validation_fields,
             input table tt_data_correction).
      end.
      apply lastkey.
   end.
 
   /* RESET THE BRANCHED BROWSE FOR THE COMPANY ADDRESS FIELD */
   {us/bbi/gprun.i ""gpbranch.p""
            "(input 'gplu007.p',
              input '')"}
 
   /* VALIDATE THE COMPANY ADDRESS ONLY IF IT IS NOT BLANK */
   if comp_addr <> ""
   then do:
 
      for first ad_mstr where ad_mstr.ad_domain = global_domain
         and ad_addr = comp_addr
      no-lock: end.
 
      if not available ad_mstr
      then do:
         /* INVALID COMPANY ADDRESS */
         {us/bbi/pxmsg.i &MSGNUM=3516 &ERRORLEVEL=3}
         next-prompt comp_addr with frame a.
         undo main_blk, retry main_blk.
      end. /* IF NOT AVAILABLE AD_MSTR */
 
      for first ls_mstr where ls_mstr.ls_domain = global_domain
         and ls_addr = ad_addr
         and ls_type = "company"
      no-lock: end.
 
      if not available ls_mstr
      then do:
         /* INVALID COMPANY ADDRESS */
         {us/bbi/pxmsg.i &MSGNUM=3516 &ERRORLEVEL=3}
         next-prompt comp_addr with frame a.
         undo main_blk, retry main_blk.
      end. /* IF NOT AVAILABLE LS_MSTR */
 
   end. /* IF comp_addr <> "" */
 
   /* VALIDATE SCREEN FIELDS BEFORE ALLOWING THE DOCUMENT TO PRINT */
   assign
      cValFld[1]    = "v_ship_cmmts"
      cValValue[1]  = trim(string(v_ship_cmmts))
      cValFld[2]    = "v_pack_cmmts"
      cValValue[2]  = trim(string(v_pack_cmmts))
      cValFld[3]    = "v_features"
      cValValue[3]  = trim(string(v_features))
      cValFld[4]    = "v_print_sodet"
      cValValue[4]  = trim(string(v_print_sodet))
      cValFld[5]    = "v_assign"
      cValValue[5]  = trim(string(v_assign))
      cValFld[6]    = "l_so_um"
      cValValue[6]  = trim(string(l_so_um))
      cValFld[7]    = "comp_addr"
      cValValue[7]  = trim(string(comp_addr))
      cValFld[8]    = "l_print_lotserials"
      cValValue[8]  = trim(string(l_print_lotserials)).
 
   run updateValidationTT
      (input cValFld,
       input cValValue,
       input-output table tt_validation_fields).
 
   empty temp-table tt_validation_errors.
   run validateFields
      (input abs_id,
       input abs_shipfrom,
       input abs_shipto,
       input "",            /* INVENTORY MOVEMENT CODE */
       input no,            /* SO SHIPMENT */
       input no,            /* CONFIRMED */
       input no,            /* CANCELED */
       input l_tr_type,
       input ipShipStep,
       input-output table tt_validation_fields,
       output table tt_validation_errors).
 
   /* DISPLAY VALIDATION MESSAGES */
   run displayValMessages
      (input table tt_validation_errors).
 
   /* RECORD VALIDATION MESSAGES */
   run recordValMessages
      (input table tt_validation_errors).
 
   /* IF HARD VALIDATION ERRORS HAVE OCCURRED RE-DO main_blk */
   if can-find(first tt_validation_errors where
                     tt_val_level = 3)
   then
      next main_blk.
 
   /* Set up batch parameters */
   bcdparm = "".
   {us/mf/mfquoter.i v_ship_cmmts}
   if v_so_shipper
   then do:
      {us/mf/mfquoter.i v_pack_cmmts}
      {us/mf/mfquoter.i v_features}
      {us/mf/mfquoter.i v_print_sodet}
      {us/mf/mfquoter.i v_assign}
      {us/mf/mfquoter.i l_so_um}
      {us/mf/mfquoter.i comp_addr}
      {us/mf/mfquoter.i l_cust}
      {us/mf/mfquoter.i remove_pending_pick_qty}
      {us/mf/mfquoter.i report_framework}
   end.  /* if v_so_shipper */
 
   if  l_tr_type <> ""
   and l_tr_type <> "ISS-WO"
   then
      {us/mf/mfquoter.i l_print_lotserials}
 
   /* Assign shipper number */
   if v_assign and not v_assigned
   then do:
      /* REBUILT THE FIELD VALIDATION LIST FOR THE NEW SHIPPER */
      empty temp-table tt_validation_fields.
 
      run getFieldsToValidate
         (input abs_shipfrom,
          input abs_shipto,
          input {&TYPE_Shipper},
          input abs_shp_date,
          output table tt_validation_fields).
 
      {us/bbi/gprun.i ""icshcnv.p""
         "(i_recid,
           false,
           """",
           input table tt_validation_fields,
           output v_abort,
           output v_err,
           output v_errnum)" }
 
      if v_err
      then do:
         {us/bbi/pxmsg.i &MSGNUM=v_errnum &ERRORLEVEL=3 }
         undo main_blk, retry main_blk.
      end.  /* if v_err */

      if v_abort then
         undo main_blk, retry main_blk.

      v_assigned = true.

   end.  /* if v_assign */

   /* REMOVE PENDING PICK LINES FOR SERIALIZATION 
    * Just shipper can remove pending pick line
    */
   if abs_id begins "s" then do:
      if remove_pending_pick_qty and
         can-find(first serd_det
            where serd_type = {&SERD-TYPE-PICKING}
              and serd_table_name = {&SERD-ABS-MSTR}
              and oid_table_record = abs_mstr.oid_abs_mstr) then do:
         {us/px/pxrun.i &PROC = 'removePendingPickQtyFromShipper'
                        &PROGRAM='pasopixr.p'
                        &HANDLE = ph_pasopixr
                        &PARAM = "(input abs_mstr.oid_abs_mstr)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
      end.
   end.

   /*PREVENT SHIPPER FROM BEING PRINTED IF VALIDATION ERRORS EXIST.*/
 
   /* Get the shipper id */
   for first abs_mstr where recid(abs_mstr) = i_recid
   no-lock: end.
 
   if not available abs_mstr then
      return.
 
   else do:
 
      if can-find(first tt_validation_fields
                  where tt_shphv_valpoint = 2
                    and tt_is_usrfld = true)
      then do:
 
         if abs_mstr.abs_id begins "s" then
            cShipStep = {&TYPE_Shipper}.
         else
            cShipStep = {&TYPE_PreShip}.
 
         run validateUserFieldsAtEnd
            (input abs_mstr.abs_id,
             input abs_mstr.abs_shipfrom,
             input abs_mstr.abs_shipto,
             input cShipStep,
             input table tt_validation_fields).
 
         lEndValidationExecuted = yes.
 
      end.
 
      run checkForValidationErrors
         (input abs_mstr.abs_id,
          input abs_mstr.abs_shipfrom,
          output lValidationErrors,
          output lValidationWarnings).
 
   end. /*ELSE DO*/
 
   if lValidationErrors then do:
 
      run getShcCtrl
         (buffer shc_ctrl).
 
      if shc_shipper_print = no then do:
         /* SHIPPER CANNOT BE PRINTED UNTIL VALIDATION ERRORS ARE CORRECTED */
         {us/bbi/pxmsg.i &MSGNUM=7674 &ERRORLEVEL=4}
         undo main_blk, leave main_blk.
      end.
      else do:
         yn = yes.
         /* SHIPPER ERRORS EXIST, CONTINUE WITH PRINTING? */
         {us/bbi/pxmsg.i &MSGNUM=8094 &ERRORLEVEL=1 &CONFIRM=yn}
         if yn = no then do:
            undo main_blk, leave main_blk.
         end.
      end. /*ELSE DO*/
 
   end.
 
   if not report_framework then do:
      /* OUTPUT DESTINATION SELECTION */
      {us/gp/gpselout.i &printType = "printer"
                  &printWidth = 80
                  &pagedFlag = " "
                  &stream = " "
                  &appendToFile = " "
                  &streamedOutputToTerminal = " "
                  &withBatchOption = "no"
                  &displayStatementType = 1
                  &withCancelMessage = "no"
                  &pageBottomMargin = 6
                  &withEmail = "yes"
                  &withWinprint = "yes"
                  &defineVariables = "yes"}
   end.
 
   /* Set print flag */
   do transaction:
 
      /* Refind and lock record */
      find abs_mstr where recid(abs_mstr) = i_recid
      exclusive-lock no-error.
      if not available abs_mstr
      then return.
 
      /* Mark as printed */
      substring(abs_mstr.abs_status,1,1) = "y".
 
      release abs_mstr.
 
   end.  /* transaction */
 
   if report_framework then do:
      if not can-find (first ttabsrecid where ttabsrecid.tabs_recid = i_recid) then do:
         create ttabsrecid.
         assign
            ttabsrecid.tabs_recid = i_recid.
         release ttabsrecid.
      end.
      run LaunchReportInViewer (
              v_ship_cmmts,
              v_pack_cmmts,
              v_features,
              v_print_sodet,
              l_so_um,
              comp_addr,
              l_print_lotserials,
              l_cust,
              table ttabsrecid).
   end.
   else do:
      /* Print shipper using shipper form services */
      {us/bbi/gprun.i ""sofspr.p""
         "(i_recid,
           v_ship_cmmts,
           v_pack_cmmts,
           v_features,
           v_print_sodet,
           l_so_um,
           comp_addr,
           l_print_lotserials,
           l_cust,
           'no')" }
 
      {us/mf/mfrpchk.i}
 
      {us/bbi/mfreset.i}
   end.

   /* Try to reset the frame before the prompt */
   hide all no-pause.
   view frame dtitle.
/*c1329*   view frame a. */
 
   /* Prompt whether documents printed correctly */
   v_ok = true.
 
/*cy1024*>>>>>>
   /* Have all documents printed correctly? */
   {us/bbi/pxmsg.i &MSGNUM=7158 &ERRORLEVEL=1 &CONFIRM=v_ok }
*cy1024*<<<<<<<<<<<*/
/*cy1024*/ pause 0.

   if not v_ok
   then do:
 
      do transaction:
 
         /* Refind and lock record */
         find abs_mstr where recid(abs_mstr) = i_recid
         exclusive-lock no-error.
 
         if not available abs_mstr then
            return.
 
         /* Reset print flag */
         substring(abs_status,1,1) = v_old_print.
 
         l_abs_id = abs_id.
         release abs_mstr.
 
      end.  /* transaction */
 
      /* Restore preshipper number */
      if v_assigned
      then do:
 
         /* Prompt whether to unassign shipper number */
         v_ok = false.
         /* Undo shipper number assignment? */
         {us/bbi/pxmsg.i &MSGNUM=5809 &ERRORLEVEL=1 &CONFIRM=v_ok }
 
         if v_ok
         then do:
            {us/bbi/gprun.i ""icshunc.p"" "(i_recid)" }
            v_assigned = false.
         end.  /* if v_ok */
 
      end.  /* if v_assigned */
 
      next main_blk.
 
   end.  /* if not v_ok (transaction) */
 
   leave main_blk.
 
end.  /* main_blk */
 
hide frame a.
 
/* END OF MAIN PROCEDURE BODY */
/*----------------------------------------------------------------------------*/
PROCEDURE getFieldDefaults:
/*----------------------------------------------------------------------------*/
   define input-output parameter ipShipCmmts as logical no-undo.
   define input-output parameter ipPackCmmts as logical no-undo.
   define input-output parameter ipFeatures as logical no-undo.
   define input-output parameter ipPrintSod as logical no-undo.
   define input-output parameter ipAssign as logical no-undo.
   define input-output parameter ipSoUm as logical no-undo.
   define input-output parameter ipCompAddr as character no-undo.
   define input-output parameter ipPrintLotSer as logical no-undo.
   define input        parameter ipAbsID as character no-undo.
   define input        parameter ipTrType as character no-undo.
   define input        parameter table for tt_validation_fields.
 
 
   /* GET DEFAULT VALUES FOR FIELDS ON THE SCREEN */
   for each tt_validation_fields no-lock:
 
      if tt_shphv_field = "v_ship_cmmts"  /* SHIPPER COMMENTS */
      then do:
         if tt_shphv_default = "yes"
         then ipShipCmmts = true.
         else ipShipCmmts = false.
      end.
      else
      if tt_shphv_field = "v_pack_cmmts"  /* PACKING LIST COMMENTS */
      then do:
         if tt_shphv_default = "yes"
         then ipPackCmmts = true.
         else ipPackCmmts = false.
      end.
      else
      if tt_shphv_field = "v_features"    /* PRINT FEATURES AND OPTIONS */
      then do:
         if tt_shphv_default = "yes"
         then ipFeatures = true.
         else ipFeatures = false.
      end.
      else
      if tt_shphv_field = "v_print_sodet" /* PRINT SALES ORDER DETAIL */
      then do:
         if tt_shphv_default = "yes"
         then ipPrintSod = true.
         else ipPrintSod = false.
      end.
      else
      if tt_shphv_field = "v_assign"      /* ASSIGN SHIPPER NUMBER */
         and ipAbsID begins "p"
      then do:
         if tt_shphv_default = "yes"
         then ipAssign = true.
         else ipAssign = false.
      end.
      else
      if tt_shphv_field = "l_so_um"       /* DISPLAY QTY IN SO UM */
      then do:
         if tt_shphv_default = "yes"
         then ipSoUm = true.
         else ipSoUm = false.
      end.
      else
      if tt_shphv_field = "comp_addr"     /* COMPANY ADDRESS */
      then
         ipCompAddr = tt_shphv_default.
      else
      if tt_shphv_field = "l_print_lotserials"  /* PRINT LOT/SERIALS */
         and (ipTrType <> "" and ipTrType <> "ISS-WO")
      then do:
         if tt_shphv_default = "yes"
         then ipPrintLotSer = true.
         else ipPrintLotSer = false.
      end.
   end.
 
END PROCEDURE. /* getFieldDefaults */

/* This function will be called by the Widget Walker to     */
/* add program specific globals variables to the screen     */
/* xml.  These will be available to the Browse Engine.      */
/* It is also used to raise .NET UI inter-plugin events.    */
FUNCTION GetExternalProgramData returns handle:
   for each ttExtraInfo exclusive-lock:
      delete ttExtraInfo.
   end.

   /* If we have a report scheduled then raise .NET UI inter-plugin event. */
   if scheduledReportID <> -1 then do:
      create ttExtraInfo.
      assign
         ttExtraInfo.fName = "QAD_AppEvent"
         ttExtraInfo.fType = "character"
         ttExtraInfo.fValue = "LaunchReportViewer".

      create ttExtraInfo.
      assign
         ttExtraInfo.fName = "LaunchReportViewer|1"
         ttExtraInfo.fType = "character"
         ttExtraInfo.fValue = string(scheduledReportID) + "|Pre-Shipper/Shipper Print||" + getTermLabel("QUERY     ING_DATA",20).
   end.

   scheduledReportID = -1.
   return temp-table ttExtraInfo:handle.
END FUNCTION.

PROCEDURE LaunchReportInViewer:
   define input parameter i_ship_comments    as logical no-undo.
   define input parameter i_pack_comments    as logical no-undo.
   define input parameter i_features         as logical  no-undo.
   define input parameter i_print_sodet      as logical  no-undo.
   define input parameter i_so_um            as logical  no-undo.
   define input parameter i_comp_addr        like ad_addr     no-undo.
   define input parameter i_print_lotserials as logical  no-undo.
   define input parameter p_cust             as logical  no-undo.
   define input parameter table for ttabsrecid.
   define variable rptErrorCode as integer no-undo.

   /* Schedule Site Report to be run by the Reporting Framework Service. */
   {us/bbi/gprun.i ""rcrp13prpt.p""
      "(i_ship_comments,
        i_pack_comments,
        i_features,
        i_print_sodet,
        i_so_um,
        i_comp_addr,
        i_print_lotserials,
        p_cust,
        table ttabsrecid,
        output scheduledReportID, output rptErrorCode)"}

   if scheduledReportID = -1 then do:
      define variable msgTxt as character no-undo.
      msgTxt = "Error scheduling report. " + string(rptErrorCode).
      {us/bbi/pxmsg.i &MSGTEXT=msgTxt &ERRORLEVEL=1}
   end.
end PROCEDURE.
