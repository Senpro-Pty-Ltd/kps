/* xxporcxr.p - Purchase Order Responsibility Owning Program                  */
/* porcxr.p - Purchase Order Responsibility Owning Program                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxporcxr.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/*                                                                            */
/*Purchase Order Responsibility Owning Program                                */
/*                                                                            */
/* Revision: 1.3      BY: Hemanth Ebenezer  DATE: 07/12/00  ECO: *N0DK*       */
/* Revision: 1.4      BY: Mark Brown        DATE: 08/13/00  ECO: *N0KQ*       */
/* Revision: 1.12     BY: Larry Leeth       DATE: 08/30/00  ECO: *N0QQ*       */
/* Revision: 1.15     BY: Markus Barone     DATE: 08/13/00  ECO: *N0R3*       */
/* Revision: 1.18     BY: Markus Barone     DATE: 09/07/00  ECO: *N0HS*       */
/* Revision: 1.19     BY: Zheng Huang       DATE: 10/11/00  ECO: *N0SQ*       */
/* Revision: 1.20     BY: Zheng Huang       DATE: 10/24/00  ECO: *N0T5*       */
/* Revision: 1.21     BY: Larry Leeth       DATE: 12/02/00  ECO: *N0V1*       */
/* Revision: 1.22     BY: Manish Kulkarni   DATE: 01/12/01  ECO: *N0VL*       */
/* Revision: 1.23     BY: Steve Nugent      DATE: 06/04/01  ECO: *M11Z*       */
/* Revision: 1.24     BY: Vandna Rohira     DATE: 12/26/01  ECO: *N179*       */
/* Revision: 1.26     BY: Dan Herman        DATE: 04/17/02  ECO: *P043*       */
/* Revision: 1.29     BY: Ashwini G.        DATE: 04/26/02  ECO: *M1XB*       */
/* Revision: 1.30     BY: Ashwini G.        DATE: 05/24/02  ECO: *N1JY*       */
/* Revision: 1.31     BY: Dan Herman        DATE: 05/24/02  ECO: *P018*     */
/* Revision: 1.33     BY: Steve Nugent      DATE: 06/13/02 ECO: *P08K* */
/* Revision: 1.35     BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00J* */
/* Revision: 1.36     BY: Rajinder Kamra    DATE: 04/25/03 ECO: *Q003**/
/* Revision: 1.37     BY: Rajinder Kamra    DATE: 08/19/03 ECO: *Q02H**/
/* Revision: 1.38        BY: Veena Lad            DATE: 06/03/04  ECO: *P24K* */
/* Revision: 1.39        BY: Steve Nugent         DATE: 08/11/05  ECO: *P2PJ* */
/* Revision: 1.40        BY: Puja Bajaj           DATE: 04/12/06  ECO: *P4P1* */
/* Revision: 1.41        BY: Amit Kumar           DATE: 08/28/06  ECO: *P53J* */
/* Revision: 1.42        BY: Julie Milligan       DATE: 09/27/06  ECO: *P57P* */
/* Revision: 1.43        BY: Sameer Lodha         DATE: 01/12/07  ECO: *R0C6* */
/* Revision: 1.44        BY: Mukesh Singh         DATE: 03/12/09  ECO: *P61X* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB     LAST MODIFIED: 11-Jun-2010              BY: gbg *c1171*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/*                                                                            */
/* ========================================================================== */
/* ******************************* DEFINITIONS ****************************** */
/* ========================================================================== */
 
 
/* STANDARD INCLUDE FILES */
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/px/pxmaint.i}
{us/po/porcdefx.i}
 
{us/gp/gprunpdf.i "mgdompl" "p"}
 
/* Dataset that contains serial IDs picked for PO */
{us/pa/papodspk.i}

{us/ca/cattdef2.i}

define temp-table tt_POReceiver no-undo
   field tt_rcv_pod_line as integer
   field tt_sel_receiver as character
   index tt_idx1 as primary tt_rcv_pod_line.

/* Define Handles for the programs. */
{us/px/pxphdef.i adadxr}
{us/px/pxphdef.i icsixr}
{us/px/pxphdef.i mcexxr}
{us/px/pxphdef.i popoxr}
{us/px/pxphdef.i porcxr1}
{us/px/pxphdef.i porcxr2}
{us/px/pxphdef.i pxgblmgr}
{us/px/pxphdef.i txtxxr}
/* End Define Handles for the programs. */
 
define variable        lv_error_num  as integer    no-undo.
define variable        lv_name       as character  no-undo.
 
 
/* ========================================================================== */
/* ******************************* MAIN BLOCK ******************************* */
/* ========================================================================== */
 
/* ========================================================================== */
/* *************************** INTERNAL PROCEDURES ************************** */
/* ========================================================================== */
 
/*============================================================================*/
PROCEDURE DeleteQadwkfl :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
DeleteQadWkfl (
   input character pRecvStr,
   input character pRecvNbr,
   input character pMfgUser,
   input character pGlobalId)
 
Parameters:
 
   pRecvStr
   pRecvNbr
   pMfgUser
   pGlobalId
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input parameter pRecvStr   like qad_key1 no-undo.
   define input parameter pRecvNbr   like qad_key2 no-undo.
   define input parameter pMfguser   like qad_key4 no-undo.
   define input parameter pGlobalId  like qad_key6 no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
 
      if can-find (first qad_wkfl
                       where qad_wkfl.qad_domain = global_domain 
                        and  qad_key1  = pRecvStr
                        and  qad_key2 = pRecvNbr
                        and  qad_key4 = pMfgUser
                        and  qad_key6 = pGlobalid )
      then do:
 
         find first qad_wkfl
             where qad_wkfl.qad_domain = global_domain and  qad_key1 = pRecvStr
              and qad_key2 = pRecvNbr
              and qad_key4 = pMfgUser
              and qad_key6 = pGlobalid
         exclusive-lock no-error.
 
         if available qad_wkfl
         then
            delete qad_wkfl.
 
         if recid (qad_wkfl) = -1
         then.
 
         release qad_wkfl.
 
      end. /* IF CAN-FIND (FIRST qad_wkfl .. */
 
   end. /* DO ON ERROR ... */
   return {&SUCCESS-RESULT}.
 
END PROCEDURE.
 
 
/*============================================================================*/
PROCEDURE commitReceipt :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
commitReceipt (
   input character pShipNbr,
   input date pShipDate,
   input character pInvMov)
 
Parameters:
   pShipNbr -
   pShipDate -
   pInvMov -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
   Added a fifth parameter to poporcb.p call. The value will
   be "no" to signify that this is not an automatic EMT PO
   receipt.
</Comment3>
------------------------------------------------------------------------------*/
   define input parameter pShipNbr as character no-undo.
   define input parameter pShipDate as date no-undo.
   define input parameter pInvMov as character no-undo.
   define input parameter pUsage as logical no-undo.
   define input parameter pUsageQty as decimal no-undo.
   define input parameter pTranNbr as character no-undo.
   define input parameter p_int_ref_type like lacd_internal_ref_type   no-undo.
   define input parameter table for tt_attr_pfvalue.
   define variable pRctPOTrnbr like tr_hist.tr_trnbr no-undo.
   define variable p_undo_lagit  like mfc_logical no-undo. 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
/*c1171*       {us/bbi/gprun.i ""poporcb.p"" */
/*c1171*/      {us/bbi/gprun.i ""xxporcb.p""
         "(input pShipNbr,
           input pShipDate,
           input pInvMov,
           input """",
           input no,
           input pUsage,
           input pUsageQty,
           input 0,
           input pTranNbr,
           input 0,
           input p_int_ref_type,
           input table tt_POReceiver by-reference,
           input table tt_attr_pfvalue by-reference,
           input-output dataset dsSerialPicked by-reference,
           input pShipNbr,
           output pRctPOTrnbr,
           output p_undo_lagit)"}
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE. 
 
/*sqc*/
/*============================================================================*/
PROCEDURE validateSiteSecurity :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
validateSiteSecurity (
   input character pPurchaseOrderId)
 
Parameters:
   pPurchaseOrderId -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
  define input parameter pPurchaseOrderId as character no-undo.
  
  do on error undo, return error {&GENERAL-APP-EXCEPT}:
     chkpodsite:
     for each pod_det
        where pod_det.pod_domain = global_domain 
         and  pod_nbr = pPurchaseOrderId 
     no-lock:
  
        {us/px/pxrun.i &PROC='validateSiteSecurity' &PROGRAM='icsixr.p'
                       &HANDLE=ph_icsixr
                       &PARAM="(input pod_site,
                                input '')"
        }
        if return-value <> {&SUCCESS-RESULT} then do:
           /* MESSAGE #2328 - USER NOT AUTHORIZED FOR THIS SITE */
           {us/bbi/pxmsg.i &MSGNUM=2328 &ERRORLEVEL={&APP-ERROR-RESULT}}
           return error {&APP-ERROR-RESULT}.
        end.
     end. /* FOR EACH POD_DET */
  end.
  return {&SUCCESS-RESULT}.
END PROCEDURE.
 
/* extract from poporcm.i */
/* ========================================================================== */
/* *************************** INTERNAL PROCEDURES ************************** */
/* ========================================================================== */
 
 
 
/*============================================================================*/
PROCEDURE assignDefaultsForNewReceipt :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
assignDefaultsForNewReceipt (
   input-output character pReceiverNbr,
   input-output date pEffectiveDate,
   output logical pMove)
 
Parameters:
   pReceiverNbr -
   pEffectiveDate -
   pMove -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input-output parameter pReceiverNbr as character no-undo.
   define input-output parameter pEffectiveDate as date no-undo.
   define output parameter pReceiptDate as date no-undo.
   define output parameter pMove as logical no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      if pReceiverNbr = ? then pReceiverNbr = "".
      if pEffectiveDate = ? then pEffectiveDate = today.
 
      assign
         pMove        = yes
         pReceiptDate = pEffectiveDate.
 
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
/*============================================================================*/
PROCEDURE getExchangeRate :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
getExchangeRate (
   input decimal pExchRateType,
   input character pCurrency,
   input logical pFixedRate,
   output decimal pExchangeRate1,
   output decimal pExchangeRate2)
 
Parameters:
   pExchRateType -
   pCurrency -
   pFixedRate -
   pExchangeRate1 -
   pExchangeRate2 -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define parameter buffer pPo_mstr for po_mstr.
   define input parameter pExchRateType as character no-undo.
   define input parameter pEffectiveDate as date no-undo.
   define output parameter pRate1 as decimal no-undo.
   define output parameter pRate2 as decimal no-undo.
 
   define variable baseCurrencyId as character no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      {us/px/pxgetph.i pxgblmgr}
      baseCurrencyId =
          {us/px/pxfunct.i &FUNCTION = 'getCharacterValue' &PROGRAM = 'pxgblmgr.p'
                     &HANDLE=ph_pxgblmgr
                     &PARAM = 'base_curr'}.
 
 
      /* FIND EXCH RATE IF CURRENCY NOT BASE */
      if baseCurrencyId <> pPo_mstr.po_curr then do:
         if pPo_mstr.po_fix_rate then do:
            assign
               pRate1 = po_ex_rate
               pRate2 = po_ex_rate2.
 
         end. /* if pPo_mstr.po_fix_rate */
         else do:  /* IF NOT FIXED RATE ALLOW FOR SPOT RATE */
            /* GET EXCHANGE RATE */
 
            {us/px/pxrun.i &PROC='getExchangeRate' &PROGRAM='mcexxr.p'
                      &HANDLE=ph_mcexxr
                     &PARAM="(input pPo_mstr.po_curr,
                              input baseCurrencyId,
                              input pExchRateType,
                              input pEffectiveDate,
                              output pRate1,
                              output pRate2)"
            }
 
         end. /*IF  NOT FIXED RATE */
      end. /* IF BASECURRENCYID <> pCurrency */
      else
         assign
            pRate1       = 1.0
            pRate2       = 1.0.
   end.
   return {&SUCCESS-RESULT}.
 
END PROCEDURE.
 
/*============================================================================*/
PROCEDURE setEffectiveDate :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
setEffectiveDate (
   input-output date pEffectiveDate,
   input-output date pShipDate)
 
Parameters:
   pEffectiveDate -
   pShipDate -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input-output parameter pEffectiveDate as date no-undo.
   define input-output parameter pShipDate as date no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      if pEffectiveDate = ? then pEffectiveDate = today.
      if pShipDate = ? then pShipDate = pEffectiveDate.
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
 
/*============================================================================*/
PROCEDURE validateBlanketReceipt :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
validateBlanketReceipt (
   input character pPurchaseOrderType)
 
Parameters:
   pPurchaseOrderType -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input parameter pPurchaseOrderType as character no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      if pPurchaseOrderType = "B" then do:
         /* MESSAGE #385 - BLANKET ORDER NOT ALLOWED */
         {us/bbi/pxmsg.i
            &MSGNUM=385
            &ERRORLEVEL={&APP-ERROR-RESULT}}
         return error {&APP-ERROR-RESULT}.
      end. /* IF pPurchaseOrderType = "B" */
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
 
/*============================================================================*/
PROCEDURE validateEMTReceipt :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
validateEMTReceipt (
   input logical pIsBtb)
 
Parameters:
   pIsBtb -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input parameter pIsBtb as logical no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      if pIsBtb then do:
         /* MESSAGE #2828 - EMT PO CANNOT BE RECEIVED HERE, USE PO SHIPPER */
         {us/bbi/pxmsg.i
            &MSGNUM=2828
            &ERRORLEVEL={&APP-ERROR-RESULT}}
         return error {&APP-ERROR-RESULT}.
      end. /* IF pIsBtb */
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
 
/*============================================================================*/
PROCEDURE validatePOStatus :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
validatePOStatus (
   input character pOrderStatus)
 
Parameters:
   pOrderStatus -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input parameter pOrderStatus as character no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      if pOrderStatus = "C" then do:
         /* MESSAGE #326 - PURCHASE ORDER CLOSED */
         {us/bbi/pxmsg.i
            &MSGNUM=326
            &ERRORLEVEL={&APP-ERROR-RESULT}}
 
         return error {&APP-ERROR-RESULT}.
 
      end. /* IF pOrderStatus = "C" */
 
      if pOrderStatus = "X" then do:
         /* MESSAGE #395 - PURCHASE ORDER CANCELLED */
         {us/bbi/pxmsg.i
            &MSGNUM=395
            &ERRORLEVEL={&APP-ERROR-RESULT}}
 
         return error {&APP-ERROR-RESULT}.
 
      end. /* IF pOrderStatus = "X" */
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
 
/*============================================================================*/
PROCEDURE validateReceiptLines :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
validateReceiptLines (
   input character pPurchaseOrderId)
 
Parameters:
   pPurchaseOrderId -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input parameter pPurchaseOrderId as character no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      if not can-find(first pod_det  where pod_det.pod_domain = global_domain
      and  pod_nbr = pPurchaseOrderId) then do:
         /* MESSAGE #611 - ORDER HAS NO LINE ITEMS */
         {us/bbi/pxmsg.i
            &MSGNUM=611
            &ERRORLEVEL={&APP-ERROR-RESULT}}
         return error {&APP-ERROR-RESULT}.
      end. /* IF NOT CAN-FIND(FIRST POD_DET */
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
 
/*============================================================================*/
PROCEDURE validateReceiverId :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
validateReceiverId (
   input character pReceiverNbr,
   input integer pReceiverType)
 
Parameters:
   pReceiverNbr -
   pReceiverType -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input parameter pReceiverNbr as character no-undo.
   define input parameter pReceiverType as integer no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      if pReceiverNbr <> "" and pReceiverType = 2 then do:
         /* MESSAGE #354 - RECEIVER NBR IS SYSTEM ASSIGNED FOR */
         /* RECEIVER TYPE 2 */
         {us/bbi/pxmsg.i
            &MSGNUM=354
            &ERRORLEVEL={&APP-ERROR-NO-REENTER-RESULT}}
         return error {&APP-ERROR-NO-REENTER-RESULT}.
      end. /* IF pReceiverNbr <> "" AND pReceiverType = 2 */
 
      if (pReceiverNbr <> "")
      and ( can-find(first prh_hist  where prh_hist.prh_domain = global_domain
      and (  prh_receiver = pReceiverNbr)) or
            can-find (first qad_wkfl  where qad_wkfl.qad_domain = global_domain
            and  qad_key1 = "Receiver"
                                       and qad_key2 = pReceiverNbr))
      then
         return error {&APP-ERROR-RESULT}.
 
      if (pReceiverNbr <> "" )
      then do:
 
         create qad_wkfl. qad_wkfl.qad_domain = global_domain.
         assign
            qad_key1       = "Receiver"
            qad_key2       = pReceiverNbr .
 
         if recid(qad_wkfl)= -1
         then .
 
         assign
            qad_key3       = execname
            qad_key4       = SessionUniqueID
            qad_key6       = global_userid
            qad_datefld[1] = today.
 
         release qad_wkfl .
      end. /* IF pReceiverNbr <> "" */
 
   end. /* DO ON ERROR .. */
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
 
 
/*============================================================================*/
PROCEDURE validateRTSReceipt :
/*------------------------------------------------------------------------------
<Comment1>
porcxr.p
validateRTSReceipt (
   input character pFSMType)
 
Parameters:
   pFSMType -
 
Exceptions:
 
PreConditions:
 
PostConditions:
 
</Comment1>
<Comment2>
Notes:
 
</Comment2>
<Comment3>
History:
 
</Comment3>
------------------------------------------------------------------------------*/
   define input parameter pFSMType as character no-undo.
   define input parameter pPorts as character no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      if pPorts = "" and pFSMType <> pPorts then do:
         /* MESSAGE #7364 - CANNOT PROCESS RTS ORDERS WITH PURCHASE */
         /* ORDER PROGRAMS */
         {us/bbi/pxmsg.i
            &MSGNUM=7364
            &ERRORLEVEL={&APP-ERROR-RESULT}}
         return error {&APP-ERROR-RESULT}.
      end. /* IF PORTS = "" AND pFSMType <> PORTS */
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
  
/*============================================================================*/
FUNCTION isReturnReceipt RETURNS logical
   (input pTransactionType as character):
/*------------------------------------------------------------------------------
Purpose:       Return a logical indicating that the transaction being processed
               is actually a return and not a receipt.
Exceptions:
Conditions:
        Pre:   NONE
        Post:  tx2d_det(r)
Notes:         Extracted from pomttrld.p (split from pomttrl2.i)
History:
------------------------------------------------------------------------------*/
   define variable returnData as logical no-undo.
 
   if pTransactionType = {&TAX-TR-TYPE-PO-RETURN-TO-SUPPLIER}
   then
      returnData = TRUE.
   else
      returnData = FALSE.
 
   return (returnData).
END FUNCTION.
 
/*============================================================================*/
PROCEDURE getTaxZones:
/*------------------------------------------------------------------------------
Purpose:       Return the two tax zones based on the site Id and supplier Id
               passed in.  If site Id is not found then system default tax
               address is used.
Exceptions:
Conditions:
        Pre:   NONE
        Post:  NONE
Notes:         Extracted from poporctx.p
History:
 
------------------------------------------------------------------------------*/
   define input parameter pSiteId as character no-undo.
   define input parameter pSupplierId as character no-undo.
   define output parameter pZoneTo as character no-undo.
   define output parameter pZoneFrom as character no-undo.
 
   /* These variables are used as placeholders in the getTaxData calls. */
   define variable dummyLog as logical no-undo.
   define variable dummyChar as character no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
 
      /* USE SITE ADDRESS */
      {us/px/pxrun.i &PROC = 'getTaxData' &PROGRAM = 'adadxr.p'
               &HANDLE=ph_adadxr
               &PARAM = "(input pSiteId,
                          output dummyLog,
                          output dummyChar,
                          output dummyLog,
                          output dummyChar,
                          output dummyChar,
                          output pZoneTo)"
      }
      if return-value = {&RECORD-NOT-FOUND} then do:
         for first txc_ctrl
            where txc_ctrl.txc_domain = global_domain no-lock:
         end. /* FOR FIRST txc_ctrl */
         if available txc_ctrl then
            pZoneTo  = txc_tax_zone.
         else
            pZoneTo  = "".
      end.
 
      /* GET VENDOR SHIP-FROM TAX ZONE FROM ADDRESS */
      {us/px/pxrun.i &PROC = 'getTaxData' &PROGRAM = 'adadxr.p'
               &HANDLE=ph_adadxr
               &PARAM = "(input pSupplierId,
                          output dummyLog,
                          output dummyChar,
                          output dummyLog,
                          output dummyChar,
                          output dummyChar,
                          output pZoneFrom)"
      }
 
   end.
 
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
/*============================================================================*/
PROCEDURE calculateExtendedTotals:
/*------------------------------------------------------------------------------
Purpose:       Calculate total taxable, nontaxable and non-taxed line total
               amounts for the order passed in.
Exceptions:
Conditions:
        Pre:   NONE
        Post:  prh_hist (r)
               po_mstr (r)
Notes:         Extracted from porctrl2.i
History:
 
------------------------------------------------------------------------------*/
   define input parameter pOrderId as character no-undo.
   define input parameter pReceiverId as character no-undo.
   define input parameter pRoundMethod as character no-undo.
   define input parameter pTransactionType as character no-undo.
   define output parameter pLinesTotal as decimal no-undo.
   define output parameter pTaxableAmount as decimal no-undo.
   define output parameter pNontaxableAmount as decimal no-undo.
 
   define buffer prh_hist for prh_hist.
   define buffer po_mstr for po_mstr.
 
   define variable isModified as logical no-undo initial FALSE.
   define variable sign as decimal no-undo.
   define variable extendedAmount as decimal no-undo.
   define variable messageNumber as integer no-undo.
   define variable pOrderTaxType as character no-undo.
 
   do transaction on error undo, return error {&GENERAL-APP-EXCEPT}:
 
      assign
         pLinesTotal = 0
         pTaxableAmount = 0
         pNontaxableAmount = 0.
 
      if {us/px/pxfunct.i &FUNCTION = 'isReturnReceipt'
                    &PARAM ="pTransactionType"
         }
      then
         sign = (-1).
      else
         sign = 1.
 
      /* Get FSM type if PO was generated by FSM. */
      for first po_mstr 
          where po_mstr.po_domain = global_domain 
           and  po_nbr = pOrderId
      no-lock:
 
         {us/px/pxrun.i &PROC = 'getOrderTaxType'
                  &PARAM = "(input po_fsm_type,
                             output pOrderTaxType)"
         }
 
      end.
 
 
      for each prh_hist
          where prh_hist.prh_domain = global_domain and  prh_nbr = pOrderId
           and prh_receiver = pReceiverId 
      no-lock:
 
         if not isModified then do:
 
            /* Determine if taxes were modified during PO processing. */
            {us/px/pxgetph.i txtxxr}
            isModified =
               {us/px/pxfunct.i &FUNCTION = 'isTaxLineEdited' &PROGRAM = 'txtxxr.p'
                          &HANDLE=ph_txtxxr
                          &PARAM = "input pOrderId,
                                    input prh_line,
                                    input '',
                                    input pOrderTaxType"
               }.
         end. /* if not isModified */
 
         /* USE PRH_CURR_AMT TO GET EXTENDED AMOUNT IN DOCUMENT*/
         /* CURRENCY.  PRH_PUR_COST IS IN BASE */
         extendedAmount = sign * prh_curr_amt * prh_um_conv * prh_rcvd.
 
         /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
         {us/px/pxrun.i &PROC = 'roundAmount' &PROGRAM = 'mcexxr.p'
                  &HANDLE=ph_mcexxr
                  &PARAM="(input-output extendedAmount,
                           input pRoundMethod,
                           output messageNumber)"
         }
         if messageNumber <> 0 then do:
 
            /* May return "ROUNDING METHOD DOES NOT EXIST" error number. */
            {us/bbi/pxmsg.i &MSGNUM=messageNumber &ERRORLEVEL={&APP-ERROR-RESULT}}
            return error {&APP-ERROR-RESULT}.
 
         end.
 
         pLinesTotal = pLinesTotal + extendedAmount.
 
         if prh_tax_at = "yes" then
            pTaxableAmount = pTaxableAmount + extendedAmount.
         else
            pNontaxableAmount = pNontaxableAmount + extendedAmount.
 
      end. /* FOR EACH PRH_HIST */
 
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
/*============================================================================*/
PROCEDURE calculateOrderAndTaxTotal:
/*------------------------------------------------------------------------------
Purpose:       Calculate tax totals for order passed in.
Exceptions:
Conditions:
        Pre:   NONE
        Post:  NONE
Notes:         Extracted from porctrl2.i
History:
 
------------------------------------------------------------------------------*/
   define input parameter pOrderId as character no-undo.
   define input parameter pTransactionType as character no-undo.
   define input parameter pReferenceId as character no-undo.
   define input parameter pTaxLine as integer no-undo.
   define input parameter notIncludeRetained as logical no-undo.
   define input-output parameter pLineTotals as decimal no-undo.
   define input-output parameter pTaxableAmount as decimal no-undo.
   define output parameter pTaxTotal as decimal no-undo.
   define output parameter pOrderTotal as decimal no-undo.
 
 
   define variable taxIncluded as decimal no-undo.
 
   define variable sign as decimal no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
      {us/px/pxrun.i &PROC = 'calculateTaxTotal' &PROGRAM = 'txtxxr.p'
               &HANDLE=ph_txtxxr
               &PARAM = "(input pTransactionType,
                          input pReferenceId,
                          input pOrderId,
                          input pTaxLine,
                          input notIncludeRetained,
                          output pTaxTotal,
                          output taxIncluded)"
 
      }
 
      if {us/px/pxfunct.i &FUNCTION = 'isReturnReceipt'
                    &PARAM ="pTransactionType"
         }
      then
         sign = (-1).
      else
         sign = 1.
 
      assign
         pTaxTotal      = pTaxTotal      * sign
         taxIncluded    = taxIncluded    * sign
         pTaxableAmount = pTaxableAmount - taxIncluded
         pLineTotals    = pLineTotals    - taxIncluded
         pOrderTotal    = pLineTotals    + pTaxTotal.
 
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
  
/*============================================================================*/
PROCEDURE getOrderTaxType:
/*------------------------------------------------------------------------------
Purpose:       Return the tax type to be used for the reciept based on whether
               the purchase order was created for FSM or not.
Exceptions:
Conditions:
        Pre:   NONE
        Post:  poc_ctrl(w)
Notes:         Extracted from poporcb.p
History:
 
------------------------------------------------------------------------------*/
define input parameter pPOType as character no-undo.
define output parameter pOrderTaxType as character no-undo.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
 
   /* SET ORDER-TAX-TYPE BASED ON ORDER TYPE TO ALLOW
   COPY OF EDITED TAX DETAILS FOR RTS'S AND PO'S */
   if pPOType = "RTS" then
      pOrderTaxType = {&TAX-TR-TYPE-RETURN-TO-SHIPPER}.
   else
      pOrderTaxType = {&TAX-TR-TYPE-PO}.
 
 
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
/*============================================================================*/
PROCEDURE getReceiverPolicy:
/*------------------------------------------------------------------------------
Purpose:       Return the for this receipt which is based on control file
            settings.
Exceptions:
Conditions:
        Pre:   NONE
        Post:  poc_ctrl(r)
            mfc_ctrl(r)
Notes:         Extracted from poporcb.p
History:
 
------------------------------------------------------------------------------*/
   define output parameter pReceiverType as decimal no-undo.
   define output parameter pReceiverSeq  as logical no-undo.
 
   define buffer poc_ctrl for poc_ctrl.
   define buffer mfc_ctrl for mfc_ctrl.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
 
      for first poc_ctrl
         where poc_ctrl.poc_domain = global_domain 
      no-lock:
          pReceiverType = poc_rcv_type.
      end. /* FOR FIRST POC_CTRL */
 
      for first mfc_ctrl
         where mfc_ctrl.mfc_domain = global_domain 
          and  mfc_field = "poc_seq_rcv" 
      no-lock:
          pReceiverSeq = mfc_logical.
      end. /* FOR FIRST MFC_CTRL */
 
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
 
 
/*============================================================================*/
PROCEDURE closePOIfNeeded:
/*------------------------------------------------------------------------------
Purpose:       Close the purchase order if all the lines are closed.
Exceptions:
Conditions:
        Pre:   Valid purchase order number passed in.
        Post:  pod_det(r)
            po_mstr(r,w)
Notes:         Extracted from poporcb.p
History:
 
------------------------------------------------------------------------------*/
   define input parameter pOrderId as character no-undo.
 
   define buffer pod_det for pod_det.
   define buffer po_mstr for po_mstr.
 
   do on error undo, return error {&GENERAL-APP-EXCEPT}:
 
      for first po_mstr  
        where po_mstr.po_domain = global_domain 
         and  po_nbr = pOrderId 
      exclusive-lock:
 
         if not po_sched then do:
 
            close-po:
            do on error undo, leave:
               if po_stat <> "c" then do:
                  for each pod_det  where pod_det.pod_domain = global_domain
                  and  pod_nbr = po_nbr no-lock:
                     if pod_status <> "c" and pod_status <> "x" then
                        leave close-po.
                  end.
                  assign
                     po_stat     = "c"
                     po_cls_date = today.
               end.
            end.
         end.
     end.
   end.
   return {&SUCCESS-RESULT}.
END PROCEDURE.
