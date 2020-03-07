/* xypopomtb2.p - PURCHASE ORDER MAINTENANCE -- ORDER DELETE                  */
/* popomtb2.p - PURCHASE ORDER MAINTENANCE -- ORDER DELETE                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xypopomtb2.p,v 1.2 2018/03/13 17:10:02 gbg Exp $: */
/* Revision: 7.4  BY: tj                          DATE: 11/22/93 ECO: *H082*  */
/* Revision: 7.4  BY: Alex Simmons                DATE: 03/18/94 ECO: *H298*  */
/* Revision: 7.4  BY: Bill Gates                  DATE: 04/20/94 ECO: *FN48*  */
/* Revision: 7.4  BY: Rob Hayter                  DATE: 09/11/94 ECO: *GM16*  */
/* Revision: 7.4  BY: Robin McCarthy              DATE: 10/13/94 ECO: *FS33*  */
/* Revision: 7.4  BY: mmp                         DATE: 10/31/94 ECO: *H584*  */
/* Revision: 7.5  BY: Marianne Deleeuw            DATE: 11/14/94 ECO: *J034*  */
/* Revision: 7.5  BY: Dhanraj Mahendra            DATE: 02/27/95 ECO: *J044*  */
/* Revision: 7.4  BY: Dhanraj Mahendra            DATE: 01/17/95 ECO: *G0CC*  */
/* Revision: 7.4  BY: Bryan Merich                DATE: 02/08/95 ECO: *F0HG*  */
/* Revision: 7.4  BY: Robin McCarthy              DATE: 07/19/95 ECO: *G0QG*  */
/* Revision: 7.4  BY: Dwight Kahng                DATE: 11/07/95 ECO: *G0XK*  */
/* Revision: 7.4  BY: ais                         DATE: 01/15/96 ECO: *G1JY*  */
/* Revision: 8.5  BY: Vinay Nayaksujir            DATE: 03/22/96 ECO: *G1R5*  */
/* Revision: 8.5  BY: Bill Gates                  DATE: 07/18/97 ECO: *J1YW*  */
/* Revision: 8.5  BY: Nirav Parikh                DATE: 09/04/97 ECO: *G2PD*  */
/* Revision: 8.6E BY: A. Rahane                   DATE: 02/23/98 ECO: *L007*  */
/* Revision: 8.6E BY: Alfred Tan                  DATE: 05/20/98 ECO: *K1Q4*  */
/* Revision: 8.6E BY: Charles Yen                 DATE: 06/28/98 ECO: *L020*  */
/* Revision: 8.6E BY: Santosh Rao                 DATE: 09/14/99 ECO: *K22R*  */
/* Revision: 9.1  BY: John Corda                  DATE: 10/08/99 ECO: *K23J*  */
/* Revision: 9.1  BY: Reetu Kapoor                DATE: 10/12/99 ECO: *J39R*  */
/* Revision: 9.1  BY: Kedar Deherkar              DATE: 04/26/00 ECO: *L0WT*  */
/* Revision: 9.1  BY: Anup Pereira                DATE: 07/07/00 ECO: *N059*  */
/* Revision: 9.1  BY: Mark Brown                  DATE: 08/25/00 ECO: *N0P3*  */
/* Revision: 9.1  BY: Jean Miller                 DATE: 11/08/00 ECO: *N0TN*  */
/* Revision: 1.14.2.12   BY: Tiziana Giustozzi    DATE: 05/24/02 ECO: *P03Z*  */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.14.2.13    BY: Tiziana Giustozzi  DATE: 07/29/02  ECO: *P09N*  */
/* Revision: 1.14.2.14    BY: Rajaneesh S.       DATE: 08/29/02  ECO: *M1BY*  */
/* Revision: 1.14.2.15    BY: Laurene Sheridan   DATE: 10/17/02  ECO: *N13P* */
/* Revision: 1.14.2.16    BY: Jyoti Thatte       DATE: 11/25/02  ECO: *P0K1* */
/* Revision: 1.14.2.17    BY: Shilpa Athalye     DATE: 05/29/03 ECO: *N2G4*  */
/* Revision: 1.14.2.19    BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00J*  */
/* Revision: 1.14.2.20    BY: Geeta Kotian       DATE: 11/24/03 ECO: *P1BQ* */
/* Revision: 1.14.2.21.3.1 BY: Ajay Nair          DATE: 06/08/04 ECO: *P253* */
/* Revision: 1.14.2.22    BY: David Morris        DATE: 09/29/05  ECO: *R021* */
/* Revision: 1.14.2.23    BY: Shilpa Kamath        DATE: 11/03/05  ECO: *R02B* */
/* Revision: 1.14.2.24    BY: Ellen Borden   DATE: 12/01/05  ECO: *R000*  */
/* Revision: 1.14.2.25    BY: Masroor Alam     DATE: 06/09/06  ECO: *P4T6*  */
/* Revision: 1.14.2.26    BY: Amit Kumar     DATE: 06/12/09  ECO: *Q30J*  */
/* CYB    LAST MODIFIED: 31-MAY-2013    BY:  gbg *c1416*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* ************************************************************************** */
/* Note: This code has been modified to run when called inside an MFG/PRO API */
/* method as well as from the MFG/PRO menu, using the global variable         */
/* c-application-mode to conditionally execute API- vs. UI-specific logic.    */
/* Before modifying the code, please review the MFG/PRO API Development Guide */
/* in the QAD Development Standards for specific API coding standards and     */
/* guidelines.                                                                */
/* ************************************************************************** */
 
/* CHANGES MADE HERE MAY ALSO NEED TO BE MADE TO socramb2.p, AS WELL          */
 
/*============================================================================*/
/* ****************************** Definitions ******************************* */
/*============================================================================*/
 
{us/bbi/mfdeclre.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i gpcmxr}
{us/bbi/gplabel.i}
{us/px/pxsevcon.i}
{us/ap/apconsdf.i}
{us/tx/txwht.i}

{us/px/pxmaint.i}
{us/px/pxphdef.i captxr}
{us/px/pxphdef.i pasopixr}

/* INPUT-OUTPUT PARAMETERS */
define input parameter pOpenRequisitionResponse as logical no-undo.
  
/* SHARED VARIABLES */
define shared variable undo_all  like mfc_logical.
define shared variable po_recno  as   recid.
define shared variable ponbr     like po_nbr.
define shared variable del-yn    like mfc_logical.
define shared variable blanket   like mfc_logical.
define variable l_delay   like mfc_logical no-undo.
define variable l_pod_qty_ord like pod_qty_ord no-undo.
define variable l_pod_pur_cost like pod_pur_cost no-undo.

define variable l_legacyAPI   as   logical     no-undo.
/*COMMON API CONSTANTS AND VARIABLES*/
{us/mf/mfaimfg.i}
 
/*PURCHASE ORDER API TEMP-TABLE, NAMED USING THE "api" PREFIX*/
{us/po/popoit01.i}

/* PURCHASE ORDER MAINTENANCE API dataset definition */
{us/po/podsmt.i "reference-only"}

/* User Update Restrictions Temp Table Definition */
{us/up/updaterestriction.i}
 
/* User Update Restriction Procedure Library */
run mfairunh.p
   (input "mgurpl.p",
   input ?,
   output hUpdateRestrictedLibrary).
 
/* User Update Restriction Constants */
{us/mg/mgurpl.i "hUpdateRestrictedLibrary"}
 
/*CHECK IF USER IS IN VIEWER MODE */
{us/gp/gpvwckhd.i}
 
if c-application-mode = "API"
   then do on error undo, return:
 
   /* Get handle of API Controller */
   {us/bbi/gprun.i ""gpaigach.p"" 
      "(output ApiMethodHandle)"}

   if valid-handle(ApiMethodHandle) 
   then do:
      /* Get the PURCHASE ORDER MAINTENANCE API dataset from the controller */
      run getRequestDataset in ApiMethodHandle 
         (output dataset dsPurchaseOrder bind).

      l_legacyAPI = no.
   end. /* IF VALID-HANDLE(ApiMethodHandle) */
   else do:
      /*GET HANDLE OF API CONTROLLER*/
      {us/bbi/gprun.i ""gpaigh.p"" 
         "(output ApiMethodHandle,
           output ApiProgramName,
           output ApiMethodName,
           output apiContextString)"}
 
      /* GET LOCAL PO MASTER TEMP-TABLE */
      create ttPurchaseOrder.
      run getPurchaseOrderRecord in ApiMethodHandle
         (buffer ttPurchaseOrder).
      l_legacyAPI = yes.
   end. /* ELSE DO */ 
end.  /* If c-application-mode = "API" */
 
/* BUFFERS */
define buffer pomstr for po_mstr.
define buffer poddet for pod_det.
 
/* LOCAL VARIABLES */
define variable requm           as character     no-undo.
define variable ok              as logical       no-undo.
define variable mc-error-number like msg_nbr     no-undo.
define variable bl_qty_chg      like pod_rel_qty no-undo.
define variable save_del_yn     like mfc_logical no-undo.
define variable line            like pod_line    no-undo.
define variable qty_ord         like pod_qty_ord no-undo.
define variable tax_nbr         like tx2d_nbr     initial ""   no-undo.
define variable tax_tr_type     like tx2d_tr_type initial "20" no-undo.
define variable l_conf_ship     as   integer     no-undo.
define variable l_conf_shid     like abs_par_id  no-undo.
define variable l_shipper_found as   integer     no-undo.
define variable l_save_abs      like abs_par_id  no-undo.
define variable using_grs       like mfc_logical no-undo.
define variable use-log-acctg   as logical no-undo.
 
/*============================================================================*/
/* ****************************** Main Block ******************************** */
/*============================================================================*/
 
{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'grs_installed',
     input '',
     input '',
     input '',
     output using_grs)"}
 
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}
 
for first po_mstr exclusive-lock
   where recid(po_mstr) = po_recno:
end.
setb:
do on error undo, retry:
   /* DO NOT RETRY WHEN PROCESSING API REQUEST */
   if retry and c-application-mode = "API" then
      undo setb, return error.
 
   for first prh_hist  
      where prh_hist.prh_domain = global_domain 
       and  prh_nbr = po_nbr 
   no-lock:
   /* DELETE NOT ALLOWED, PO LINE HAS RECEIPTS */
   /* MESSAGE #364 - DELETE NOT ALLOWED, PO LINE HAS RECEIPTS */
   {us/bbi/pxmsg.i
      &MSGNUM=364
      &ERRORLEVEL={&APP-ERROR-NO-REENTER-RESULT}}
   undo setb, return.
   end.
 
   assign
      l_conf_ship     = 0
      l_shipper_found = 0.
 
   for each pod_det  
      where pod_det.pod_domain = global_domain 
       and  pod_nbr = po_nbr 
   no-lock:
      for first si_mstr  
         where si_mstr.si_domain = global_domain 
          and  si_site = pod_site 
      no-lock:
         {us/bbi/gprun.i ""gpsiver.p"" "(input si_site,
            input recid(si_mstr),
            output return_int)"}
         if return_int = 0
         then do:
            /* MESSAGE #2709 - DELETE NOT ALLOWED; USER DOES */
            /* NOT HAVE ACCESS TO DETAIL SITE(S) */
            {us/bbi/pxmsg.i
               &MSGNUM=2709
               &ERRORLEVEL={&APP-ERROR-NO-REENTER-RESULT}}
            if c-application-mode <> "API" then
               undo setb, retry.
            else
               undo setb, return error.
         end.
      end.  /* for first */
 
      /*CHECK FOR EXISTENCE OF PO ROUTING/OP RECORDS FOR SUBCONTRACT LINES*/
      if pod_type = "s" and
         can-find (first poa_mstr  where poa_mstr.poa_domain = global_domain
         and
         poa_site = pod_site  and
         poa_part = pod_part and
         can-find (first poad_det  where poad_det.poad_domain =
         global_domain and
         poad_po_nbr = pod_nbr and
         poad_det.oid_poa_mstr = poa_mstr.oid_poa_mstr)) then do:
 
         /* MESSAGE #5962 - DELETE NOT ALLOWED; SUBCONTRACT ROUTING/OP PO RECORD EXISTS*/
         {us/bbi/pxmsg.i
            &MSGNUM=5962
            &ERRORLEVEL={&APP-ERROR-NO-REENTER-RESULT}}
         if c-application-mode <> "API" then
            undo setb, return.
         else
            undo setb, return error.
      end. /*IF POD_TYPE*/
 
      /* CHECK FOR EXISTENCE OF CONFIRMED/UNCONFIRMED SHIPPER */
      {us/bbi/gprun.i ""rssddelb.p"" "(input pod_det.pod_nbr,
           input pod_det.pod_line,
           input pod_det.pod_site,
           input-output l_shipper_found,
           input-output l_save_abs,
           input-output l_conf_ship,
           input-output l_conf_shid)"}
   end.  /* FOR EACH... */
 
   if l_shipper_found > 0
   then do:
      l_save_abs   = substring(l_save_abs,2,20).
 
      /* # SHIPPERS/CONTAINERS EXISTS FOR ORDER, INCLUDING # */
      /* MESSAGE #1118 - # SHIPPERS/CONTAINERS EXIST FOR ORDER, INCLUDING # */
      {us/bbi/pxmsg.i
         &MSGNUM=1118
         &ERRORLEVEL={&APP-ERROR-RESULT}
         &MSGARG1=l_shipper_found
         &MSGARG2=l_save_abs
         }
      /* DO NOT ALLOW TO DELETE ORDER LINE, IF UNCONFIRMED */
      /* SHIPPER EXISTS                                    */
      if c-application-mode <> "API" then
         undo setb, return.
      else
         undo setb, return error.
 
   end. /* IF L_SHIPPER_FOUND > 0 */
 
   /* IF ALL THE SHIPPERS FOR THE ORDER HAVE BEEN CONFIRMED  */
   /* DISPLAY WARNING AND ALLOW TO DELETE ORDER              */
   else
   if l_conf_ship > 0
   then do:
      l_conf_shid = substring(l_conf_shid,2,20).
      /* MESSAGE #3314 - # CONFIRMED SHIPPERS EXIST FOR ORDER, INCLUDING # */
      {us/bbi/pxmsg.i
         &MSGNUM=3314
         &ERRORLEVEL={&WARNING-RESULT}
         &MSGARG1=l_conf_ship
         &MSGARG2=l_conf_shid
         &PAUSEAFTER=true
         }
   end. /* IF L_CONF_SHIP > 0 */
 
   for first sch_mstr  
      where sch_mstr.sch_domain = global_domain 
       and  sch_type = 4 
       and sch_nbr = po_nbr 
   no-lock:
   /* MESSAGE #6022 -  SCHEDULE EXISTS, DELETE NOT ALLOWED */
   {us/bbi/pxmsg.i
      &MSGNUM=6022
      &ERRORLEVEL={&APP-ERROR-RESULT}
      }
   if c-application-mode <> "API" then
      undo setb, retry.
   else
      undo setb, return error.
   end.
 
   if po_type = "B" and po_rel_nbr <> 0
      then do for pomstr:
         for first pomstr
            where pomstr.po_domain = global_domain and  pomstr.po_vend =
            po_mstr.po_vend
            and pomstr.po_nbr <> po_mstr.po_nbr
            and pomstr.po_blanket = po_mstr.po_nbr
         no-lock:
 
         /* MESSAGE #1102 - DELETE NOT ALLOWED.  # WAS RELEASED */
         /* FROM THIS BLANKET PO */
         {us/bbi/pxmsg.i
            &MSGNUM=1102
            &ERRORLEVEL={&APP-ERROR-NO-REENTER-RESULT}
            &MSGARG1=pomstr.po_nbr}
         if c-application-mode <> "API"
            then
            undo setb, leave.
         else
            undo setb, return error.
         end.  /* for first */
      end.
      del-yn = yes.
 
      if c-application-mode <> "API"
      then do:
         /* MESSAGE #11 - PLEASE CONFIRM DELETE */
         {us/bbi/pxmsg.i
            &MSGNUM=11
            &ERRORLEVEL={&INFORMATION-RESULT}
            &CONFIRM=del-yn
            }
      end.
      else
         del-yn = if l_legacyAPI = yes
                  then
                     (ttPurchaseOrder.operation = {&REMOVE})
                  else
                     (ttPurchaseOrderHeader.operation = {&REMOVE}).

      if c-application-mode <> "API"
      then do:
         if not del-yn then
            undo setb, leave.
      end.  /* If c-application-mode <> "API" */
      else  /* c-application-mode = "API" */
      if not del-yn then undo setb, return error.
 
      /* VALIDATE ALL LINES ON BLANKET ORDER CAN BE RELEASED */
      /* DUE TO USER UPDATE RESTRICTIONS                     */
      for each pod_det no-lock
            where pod_domain   = global_domain
            and   pod_nbr      = po_nbr:
 
         /* VALIDATE IF THE USER UPDATE IS RESTRICTED */
         /* CLEAR TEMP TABLE RECORDS BEFORE CREATING NEW RECORD */
         empty temp-table ttUpdateRestrictionSignature.
 
         /* CREATE TEMP-TABLE RECORD */
         create ttUpdateRestrictionSignature.
         assign
            ttUpdateRestrictionSignature.category              = {&POMT}
            ttUpdateRestrictionSignature.program               = execname
            ttUpdateRestrictionSignature.part                  = pod_part
            ttUpdateRestrictionSignature.site                  = pod_site
            ttUpdateRestrictionSignature.siteTo                = ?
            ttUpdateRestrictionSignature.location              = pod_loc
            ttUpdateRestrictionSignature.locationTo            = ?
            ttUpdateRestrictionSignature.inventoryStatus       = ?
            ttUpdateRestrictionSignature.inventoryStatusTo     = ?
            ttUpdateRestrictionSignature.account               = ?
            ttUpdateRestrictionSignature.subaccount            = ?
            ttUpdateRestrictionSignature.costCenter            = ?
            ttUpdateRestrictionSignature.project               = ?
            ttUpdateRestrictionSignature.changeInventoryStatus = ?.
 
         if isUpdateRestricted(input table ttUpdateRestrictionSignature,
            input yes)
         then do:
            undo setb, return error.
         end.
 
      end.
 
      line = 0.
      for each pod_det  
         where pod_det.pod_domain = global_domain 
           and  pod_nbr = po_nbr:

         line = line + 1.
 
         if  po_stat    <> "c"
         and po_stat    <> "x"
         and pod_status <> "c"
         and pod_status <> "x"
         then do:
            /* SUBTRACT FROM PT MSTR QTY ON ORDER & UPDATE REQ'S */
            assign
               save_del_yn = del-yn
               del-yn = no.
 
            /* PO INCLUDE FILE: UPDATE PART MASTER AND REQUISITIONS */
            {us/mf/mfpotr.i "DELETE"}
 
            del-yn = save_del_yn.
 
            if pod_type = ""
            then do:
 
               /* MRP WORKFILE */
               {us/mf/mfmrw.i
                     "pod_det"
                     pod_part
                     pod_nbr
                     string(pod_line)
                     """"
                     ?
                     pod_due_date
                     "0"
                     "SUPPLY"
                     PURCHASE_ORDER
                     pod_site}
            end. /* IF pod_type = "" */
         end.  /* IF PO_STAT <> "c" ... */
 
         /* DELETE LINE COMMENTS */
         {us/px/pxrun.i &PROC  = 'deleteAllTransactionComments' &PROGRAM = 'gpcmxr.p'
                        &HANDLE=ph_gpcmxr
                        &PARAM="(pod_cmtindx)"
                        &NOAPPERROR=True
                        &CATCHERROR=True}
 
         /* DELETE IMPORT EXPORT RECORDS */
         for each ied_det   
            where ied_det.ied_domain = global_domain
              and ied_type = "2" and ied_nbr = po_nbr
         exclusive-lock:        
            delete ied_det.
         end. /* for each ied_det */
 
         if pod_sched
         then do:
            for first scx_ref
               where scx_ref.scx_domain = global_domain 
               and scx_type = 2
               and scx_shipfrom = po_vend
               and scx_shipto = pod_site
               and scx_part = pod_part
               and scx_po = po_nbr
            exclusive-lock:
               delete scx_ref.
            end.
         end.
 
         if  po_stat    <> "c"
            and po_stat    <> "x"
            and pod_status <> "c"
            and pod_status <> "x"
            and not blanket
         then do:
            /* PO MAINTENANCE ADJUST BLANKET INCLUDE FILE */
            {us/po/pobladj.i}
         end.
 
         if using_grs
            and pod_req_nbr  > ""
            and pod_req_line <> 0
         then do:
 
/*c1416* start deleted code >>>>>
            /* REOPENING A CLOSED REQ AND/OR REQ LINE WHEN A  */
            /* PO REFERENCING A REQ IS DELETED                */
            {us/gp/gprunmo.i
               &program = "popodel.p"
               &module = "GRS"
               &param = """(input pod_req_nbr,
                            input pod_req_line,
                            input pOpenRequisitionResponse)"""}
*c1416* end deleted code <<<<<<< */

            {us/gp/gprunmo.i
               &program="rqporef.p"
               &module="GRS"
               &param="""(input pod_req_nbr,
                          input pod_req_line, 
                          input pod_nbr,
                          input pod_line, 
                          input 0, 
                          input pod_um,
                          output requm, 
                          output ok)"""}
 
            {us/gp/gprunmo.i
               &program="rqmrw.p"
               &module="GRS"
               &param="""(input pod_req_nbr,
                          input pod_req_line)"""}
 
            /* IF DELETING THE PO LINE THEN WE ALSO NEED TO DELETE */
            /* THE qad_wkfl LINK WITH THE REQUISITION IF ANY */
            for first qad_wkfl
               where qad_domain = global_domain
               and   qad_key1   = pod_req_nbr
               and   qad_key2   = string(pod_req_line)
            exclusive-lock:
               delete qad_wkfl.
            end. /* FOR FIRST qad_wkfl ..*/
         end. /* IF USING_GRS AND .. */
 
         /* DELETE LOGISTICS ACCOUNTING tx2d_det RECORDS FOR THIS LINE */
         if use-log-acctg then do:
            {us/gp/gprunmo.i &module = "LA" &program = "lataxdel.p"
               &param  = """(input '48',
                             input pod_nbr,
                             input pod_line)"""}
         end.

         /* DELETE THE PURCHASE ORDER LINE */

         /* Delete the PO Line profile */
         {us/px/pxrun.i &PROC       = 'deletePOLineProfile'
                        &PROGRAM    = 'captxr.p'
                        &HANDLE     = ph_captxr
                        &PARAM      = "(input pod_det.pod_nbr,
                                        input pod_det.pod_line)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
         {us/px/pxrun.i &PROC       = 'deleteRelatedSerialInfoByPoLine'
                        &PROGRAM    = 'pasopixr.p'
                        &HANDLE     = ph_pasopixr
                        &PARAM      = "(input pod_det.pod_nbr,
                                        input pod_det.pod_line)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
         delete pod_det.
      end.
 
      /* Only display this message from CHUI UI Mode, not needed for API Mode*/
      if c-application-mode <> 'API'
      then do:
         deleted_msg:
         do on endkey undo deleted_msg, leave deleted_msg:
 
            /* MESSAGE #24 - LINE ITEM RECORD(S) DELETED */
            {us/bbi/pxmsg.i &MSGNUM=24 &ERRORLEVEL={&INFORMATION-RESULT}
                            &MSGARG1=line}
            hide message.
         end.
      end.
 
      /* DELETE TAX DETAIL RECORDS */
      tax_nbr = po_blanket.
      {us/bbi/gprun.i ""txdelete.p"" 
         "(input tax_tr_type,
           input po_nbr,
           input tax_nbr)"}
 
      /* DELETE ANY WITHHOLDING TAX RECORDS */
      {us/bbi/gprun.i ""txdelete.p"" 
         "(input {&AP_WHT_TAX_TRANSACTION_TYPE} /*60*/,
           input po_nbr,
           input tax_nbr)"}     
 
      /* DELETE HEADER COMMENTS */
      {us/px/pxrun.i &PROC  = 'deleteAllTransactionComments' &PROGRAM = 'gpcmxr.p'
                     &HANDLE=ph_gpcmxr
                     &PARAM="(po_cmtindx)"
                     &NOAPPERROR=True
                     &CATCHERROR=True}
 
      /* DELETE ALL IMPORT/EXPORT RECORDS ASSOCIATED WITH THIS */
      /* PURCHASE ORDER NUMBER */
      for each ie_mstr exclusive-lock
         where ie_mstr.ie_domain = global_domain 
          and  ie_type = "2" and ie_nbr = po_nbr:
         delete ie_mstr.
      end. /* FOR EACH ie_mstr */
  
      /* DELETE LOGISTICS ACCOUNTING LACD_DET RECORDS */
      for each lacd_det
            where lacd_det.lacd_domain = global_domain
            and lacd_det.lacd_internal_ref = po_nbr
            and lacd_det.lacd_internal_ref_type = {&TYPE_PO}
      exclusive-lock:
 
         for each lacod_det of lacd_det exclusive-lock:
            delete lacod_det.
         end.
         delete lacd_det.
 
      end.
 
      /* DELETE PURCHASE ORDER RECORD */
      {us/bbi/gprun.i ""gpxrdlln.p""
         "(input po_nbr,
           input ' ',
           input 'po')" }
      delete po_mstr.
 
      undo_all = no.
      delete PROCEDURE hUpdateRestrictedLibrary.
   end. /* setb */
