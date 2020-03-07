/* soivpstfinpl.p - QAD Financials Invoice Post Procedure Library             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: soivpstfinpl.p,v 1.2 2018/03/13 17:09:34 gbg Exp $: */
/* Description:                                                               */
/* This program is a collection of internal procedures that is used to        */     
/* perform the invoice post functionality to QAD Financials from MFG/PRO.     */
/*                                                                            */
/* Revision: 1.1         BY: Katie Hilbert        DATE: 08/07/07  ECO: *R0C6* */
/* Revision: 1.2         BY: Mike Dempsey         DATE: 02/09/08  ECO: *R0KD* */
/* Revision: 1.3         BY: Dilip Manawat        DATE: 03/07/08  ECO: *R0NB* */
/* Revision: 1.4         BY: Deirdre O'Brien      DATE: 03/14/08  ECO: *R0P6* */
/* Revision: 1.65        BY: Deirdre O'Brien      DATE: 03/14/08  ECO: *R0S1* */
/* Revision: 1.12        BY: Jean Miller          DATE: 06/19/08  ECO: *R0VD* */
/* Revision: 1.13        BY: Juncheng Cui         DATE: 07/17/08  ECO: *R0TP* */
/* Revision: 1.71        BY: Juncheng Cui         DATE: 09/12/08  ECO: *R14F* */   
/* Revision: 1.72        BY: Deepak Keni          DATE: 11/13/08  ECO: *R17F* */
/* Revision: 1.73        BY: Neil Curzon          DATE: 09/26/08  ECO: *R15B* */
/* Revision: 1.76        BY: Neil Curzon          DATE: 11/25/08  ECO: *R17W* */
/* Revision: 1.77        BY: Neil Curzon          DATE: 01/26/09  ECO: *R18P* */
/* Revision: 1.71        BY: Neil Curzon          DATE: 02/06/09  ECO: *R1BD* */
/* Revision: 1.26        BY: Mallika Poojary      DATE: 03/24/09  ECO: *R1FM* */
/* Revision: 1.26        BY: Neil Curzon          DATE: 07/13/09  ECO: *R1LD* */
/* Revision: 1.86        BY: Deirdre O'Brien      DATE: 07/15/09  ECO: *R1HB* */
/* Revision: 1.88        BY: Deirdre O'Brien      DATE: 07/24/09  ECO: *R1N7* */
/* Revision: 1.89        BY: Neil Curzon          DATE: 08/10/09  ECO: *R1PD* */
/* Revision: 1.90        BY: Deepak Keni          DATE: 10/12/09  ECO: *R1S7* */
/* Revision: 1.91        BY: Mallika Poojary      DATE: 10/23/09  ECO: *R1SX* */
/* Revision: 1.91        BY: Neil Curzon          DATE: 10/31/09  ECO: *R1T3* */
/* Revision: 1.92        BY: Neil Curzon          DATE: 10/23/09  ECO: *R1TZ* */
/* Revision: 1.93        BY: Mallika Poojary      DATE: 02/02/10  ECO: *R1XK* */
/* Revision: 1.94        BY: Dinesh Dubey         DATE: 02/22/10  ECO: *R1Y5* */
/* Revision: 1.95        BY: Mitesh Singh         DATE: 02/18/10  ECO: *R1VG* */
/* Revision: 1.94        BY: Neil Curzon          DATE: 03/11/10  ECO: *R1X6* */
/* Revision: 1.95        BY: Deirdre O'Brien      DATE: 07/14/10  ECO: *R22Y* */
/* CYB LAST MODIFIED: 2018-JAN-18      BY: gbg D4081 Q1338820                 */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
using com.qad.eefin.bdinvoice.GetDInvoiceStatus.
using com.qad.eefin.bcompany.CompanyByCompanyCodeForAddress.
using com.qad.eefin.bcompany.SelectCompany.
using com.qad.eefin.bsafconcept.GetActiveSystemSafConceptById.
using com.qad.eefin.bproject.ProjectByGl.

&SCOPED-DEFINE CREDIT "CREDITNOTE"
&SCOPED-DEFINE INVOICE "INVOICE"
&SCOPED-DEFINE CRED_CORR "CREDITNOTECORRECTION"
&SCOPED-DEFINE INV_CORR "INVOICECORRECTION"

&SCOPED-DEFINE DYB_DR_INVOICE "DEBTORINVOICE"
&SCOPED-DEFINE DYB_DR_CREDIT "DEBTORCREDITNOTE"
&SCOPED-DEFINE DYB_DR_CRED_CORR "DEBTORINVOICECORRECT"
&SCOPED-DEFINE DYB_DR_INV_CORR "DEBTORCREDITNOTECORRECT"

&SCOPED-DEFINE DINVOICEOPINFOTYPE-SHIPPER "SHIPPER"
&SCOPED-DEFINE DINVOICEOPINFOTYPE-LEGALDOC "LEGAL DOC"
&SCOPED-DEFINE DINVOICEOPINFOTYPE-SO "SALESORDER"
&SCOPED-DEFINE DINVOICEOPINFOTYPE-GT "GOLDENTAX"
&SCOPED-DEFINE GOLDENTAX-UPDATE-TYPE-AUT "AUTOMATIC"

&SCOPED-DEFINE VATINOUT-OUTPUT 'OUTPUT'

&SCOPED-DEFINE DOCUMENTTYPEDEBTOR-CREDITCARD "CREDITCARD"
&SCOPED-DEFINE DOCUMENTSUBTYPEDEBTOR-AUTO "AUT"
&SCOPED-DEFINE DOCUMENTSTATUS-INCASSO "INCASSO"

&SCOPED-DEFINE SAFCONCEPT-CUSTTYPE "Customer Type"
&SCOPED-DEFINE SAFCONCEPT-ITEMTYPE "Item Type"
&SCOPED-DEFINE SAFCONCEPT-ITEMGRP "Item Group"
&SCOPED-DEFINE SAFCONCEPT-PRODLINE "Product Line"
&SCOPED-DEFINE SAFCONCEPT-REGION "Region"
&SCOPED-DEFINE SAFCONCEPT-SITE "Site"

&SCOPED-DEFINE PROXYACTION-SAVE "SAVE"
&SCOPED-DEFINE TCSTATUS-NEW "N"

{us/bbi/mfdeclre.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i adcrxr}

{us/gp/gprunpdf.i "nrm" "p" }
{us/gp/gpldcons.i} /* CONSTANTS FOR LEGAL DOCUMENT */

{us/rc/rcinvtbl.i new}
{us/rc/rcinvcon.i}

define variable daybookSetBySiteInstalled like mfc_logical no-undo.
define variable hDaybooksetValidation as handle no-undo.
define variable iErrorNumber          as integer no-undo.
define variable l_inv_nbr             like sod_inv_nbr no-undo.
define variable l_so_billto           like so_cust no-undo.
define temp-table t_taxcode_data 
   field t_taxcode_code like tx2_tax_code
   field t_taxcode_taxamt as decimal
   field t_taxcode_tottax as decimal
   field t_taxcode_recamt as decimal
   field t_taxcode_nontaxamt as decimal
   field t_taxcode_curr   like tx2d_curr
index t_idx_taxcode as unique primary t_taxcode_code.

{us/so/sogiatt.i}
{us/gt/gtsoindf.i}

/* DAYBOOKSET VALIDATION LIBRARY PROTOTYPES */
{us/dy/dybvalpl.i hDaybooksetValidation}

/* INITIALIZE PERSISTENT PROCEDURES */
run mfairunh.p
   (input "dybvalpl.p",
    input ?,
    output hDaybooksetValidation).

{us/so/sorp.i}

/* FUNCTION DEFINITIONS */
function getCrossCompanyCode returns character
   (input pModule as character,
    input pType as character,
    input pAccountCode as character) forward.

function getSuspendedTaxInfo returns logical
   (input pSuspTax as logical,
    input pEntity  as character) forward.

/* InvoiceCertification 20110405 : Add include to the new api-method in class bdinvoicejournalentry that will return the invoice-certificate related data of the newly created invoice - the include of proxy/bdinvoicejournalentry/apistdmaintainttdef has been removed  */


{proxy/bddocument/apistdmaintainttdef.i}
{proxy/bjournalentry/apistdmaintainmultittdef.i}
{proxy/bposting/apigetsafconceptsforpostingdef.i}

/* Payment Reference 20130419: Add include to the new api-method in class bdinvoicejournalentry that will return the payment reference -  the include of proxy/bdinvoicejournalentry/apistdmaintainttv01def has been removed */ 
{proxy/bdinvoicejournalentry/apistdmaintainttv02def.i}

define temp-table tTempApiPosting like tApiPosting
   field PostingOriginEntity like glt_det.glt_entity.
define temp-table tTempApiPostingLine like tApiPostingLine.
define temp-table tTempApiPostingSaf like tApiPostingSaf.
define temp-table tTempApiPostingVat like tApiPostingVat.
define temp-table tTempApiPostingVatDelay like tApiPostingVatDelay.
define temp-table tTempApiSafConceptsForPosting like tApiSafConceptsForPosting
   field GLCode like glt_acct
   field CostCenterCode like glt_cc
   field ProjectCode like glt_project
   field t_HasSafConcepts as logical.
define temp-table tGiaApiPosting like tApiPosting
        field PostingOriginEntity like glt_det.glt_entity.
define temp-table tGiaApiPostingLine like tApiPostingLine.
define temp-table tGiaApiPostingSaf like tApiPostingSaf.

define variable hQADFinancialsLib      as handle                         no-undo.
define variable DInvoiceStatus         as GetDInvoiceStatus              no-undo.
define variable CompanyAddress         as CompanyByCompanyCodeForAddress no-undo.
define variable ActiveSystemSafConcept as GetActiveSystemSafConceptById  no-undo.
define variable Project                as ProjectByGl                    no-undo.
define variable selectcompany          as selectcompany                  no-undo.

PROCEDURE createInvoice :
/*------------------------------------------------------------------------------
  Purpose:    Creates the QAD Financials Invoice API Temp-Tables from the
              passed in so_mstr record.
  Parameters:  <input> so_recno - recid of the so_mstr record
               <input> eff_date
               <input> batch
               <input> l_po_schd_nbr
               <input> pay_type

  Notes:
------------------------------------------------------------------------------*/
   define input  parameter so_recno      as recid          no-undo.
   define input  parameter eff_date      as date           no-undo.
   define input  parameter batch         as character      no-undo.
   define input  parameter l_po_schd_nbr like sod_contr_id no-undo.
   define input  parameter pay_type      as character      no-undo.
   define input  parameter exch_rate     like exr_rate     no-undo.
   define input  parameter exch_rate2    like exr_rate     no-undo.
   define input  parameter p_last_taxdt  as date           no-undo. 
   define input  parameter idaybook_code as character     no-undo.
   
   define variable isOriginalNegative    as logical   no-undo.
   define variable errorstate            as logical   no-undo initial false.
   define variable errornumber           as integer   no-undo initial 0.
   define variable adjustmentInvoice     as character no-undo initial "".
   define variable originalInvoiceNumber as character no-undo initial "".
   define variable adjustmentyear        as integer   no-undo initial 0.
   define variable ordertotal            as decimal   no-undo initial 0.
   define variable invoiceTaxable        as logical   no-undo initial false.
   define variable dtExRateDate          as date      no-undo.

   define variable l_year            as integer       no-undo.
   define variable l_daybookcode     as character     no-undo.
   define variable l_voucher         as integer       no-undo.
   define variable p_isvalid         as logical       no-undo.
   define variable DiscountPercent   as decimal       no-undo.
   define variable Description       as character     no-undo.
   define variable Staged            as logical       no-undo.
   define variable invoiceNbr        as character     no-undo.
   
   
   find first so_mstr where recid(so_mstr) = so_recno no-lock no-error.
   /* If at least one line is taxable then the invoice is taxable */
   for first sod_det
      where sod_det.sod_domain = so_mstr.so_domain
        and sod_det.sod_nbr = so_mstr.so_nbr
        and sod_det.sod_taxable = true
        and sod_det.sod_compl_stat = ""
   no-lock:
      assign invoiceTaxable = true.
   end.

   if invoiceTaxable = false then
      /* If there exist a taxable trailer for the Invoice then the invoice is taxable */
      invoiceTaxable = can-find (first tx2d_det
                                    where tx2d_domain = so_mstr.so_domain
                                      and tx2d_ref = so_mstr.so_inv_nbr
                                      and ( tx2d_nbr = so_mstr.so_nbr or tx2d_nbr = "CONSOL")
                                      and tx2d_trl <> ""
                                      and tx2d_tax_type <> "NON-TAX").


   find first tApiDinvoiceDIJE where tApiDinvoiceDIJE.tc_Rowid = so_mstr.so_inv_nbr no-error.

   /* Check to see if the invoice has been created already */
   if not available(tApiDinvoiceDIJE)
   then do:
      /* Create the invoice, movement and the link table */
      create tApiDinvoiceDIJE.

      assign tApiDinvoiceDIJE.tcJournalCode = idaybook_code.
      run getInvoiceComponentsByNRM(input so_mstr.so_inv_nbr,
                              input idaybook_code,
                              input so_mstr.so_domain,
                              input eff_date,
                              output tApiDinvoiceDIJE.DInvoicePostingYear,
                              output tApiDinvoiceDIJE.DInvoiceVoucher,
                              output invoiceNbr).                          

      /* Tax Point Date for a Invoice is the Shipment date */
      if p_last_taxdt = ? 
      then
         for first tx2d_det 
            where tx2d_domain  = global_domain 
            and   tx2d_tr_type = "13"
            and   tx2d_ref     = so_mstr.so_nbr
         no-lock:            
         end.
      /* Tax Point Date for a Invoice is the greatest Shipment date for Consolidated Invoices */
      if p_last_taxdt <> ? 
      then
         tApiDinvoiceDIJE.DInvoiceTaxPointDate     = p_last_taxdt .
      else if available tx2d_det 
      then
         tApiDinvoiceDIJE.DInvoiceTaxPointDate     = tx2d_effdate .
      else 
         tApiDinvoiceDIJE.DInvoiceTaxPointDate     = eff_date .                              
      assign
         tApiDInvoiceDIJE.tcPayFormatTypePayInstrument = pay_type
         tApiDinvoiceDIJE.DInvoiceDate =
            if so_mstr.so_inv_date = ? then eff_date else so_mstr.so_inv_date
         tApiDinvoiceDIJE.DInvoiceDIText           = so_mstr.so_inv_nbr
         tApiDinvoiceDIJE.DInvoiceDescription      = so_mstr.so_rmks /* Q1336763 */
         tApiDinvoiceDIJE.DInvoiceIsOpen           = true
         tApiDinvoiceDIJE.tcCurrencyCode           = so_mstr.so_curr
         tApiDinvoiceDIJE.tcDivisionCode           = ""
         tApiDinvoiceDIJE.tcCostCentreCode         = ""
         tApiDinvoiceDIJE.tcDebtorCode             = so_mstr.so_bill
         tApiDinvoiceDIJE.tcSoldToDebtorCode       = so_mstr.so_cust
         tApiDinvoiceDIJE.DInvoiceVatRateScale     = 1
         tApiDinvoiceDIJE.DInvoiceVatExchangeRate  = 1
         tApiDinvoiceDIJE.DInvoiceIsPaymentAllowed = yes
         tApiDinvoiceDIJE.DInvoiceBatch            = batch
         tApiDinvoiceDIJE.DInvoicePurchaseOrder =
            if so_mstr.so_sched then l_po_schd_nbr else so_mstr.so_po
         tApiDinvoiceDIJE.DInvoiceSlsPsn1              = so_mstr.so_slspsn[1]
         tApiDinvoiceDIJE.DInvoiceSlsPsn2              = so_mstr.so_slspsn[2]
         tApiDinvoiceDIJE.DInvoiceSlsPsn3              = so_mstr.so_slspsn[3]
         tApiDinvoiceDIJE.DInvoiceSlsPsn4              = so_mstr.so_slspsn[4]
         tApiDinvoiceDIJE.DInvoiceComm1                = so_mstr.so_comm_pct[1]
         tApiDinvoiceDIJE.DInvoiceComm2                = so_mstr.so_comm_pct[2]
         tApiDinvoiceDIJE.DInvoiceComm3                = so_mstr.so_comm_pct[3]
         tApiDinvoiceDIJE.DInvoiceComm4                = so_mstr.so_comm_pct[4]
         tApiDinvoiceDIJE.DInvoiceIsTaxable            = invoiceTaxable
         tApiDinvoiceDIJE.DInvoiceIsExternal           = true
         tApiDinvoiceDIJE.DInvoicePostingDate          = eff_date
         tApiDinvoiceDIJE.LastModifiedDate             = today
         tApiDinvoiceDIJE.tcNormalPaymentConditionCode = so_mstr.so_cr_terms
         tApiDinvoiceDIJE.LastModifiedTime             = time
         tApiDinvoiceDIJE.LastModifiedUser             = global_userid
         tApiDinvoiceDIJE.DInvoicePaymentDate          = so_mstr.so_due_date
         tApiDinvoiceDIJE.tc_Rowid                     = so_mstr.so_inv_nbr
         tApiDinvoiceDIJE.tc_Status                    = {&TCSTATUS-NEW}
         tApiDinvoiceDIJE.tcProjectCode                = so_mstr.so_project.

      /*CHECK IF SITE COMPANY ADDRESS HAS A STATE TAX ID */
      for first ad_mstr 
         where ad_domain = global_domain 
           and ad_addr   = so_mstr.so_site
      no-lock:
         if     ad_pst_id <> "":U 
            and ad_pst_id <> ? 
            and can-find( first ls_mstr 
                             where ls_domain = global_domain
                               and ls_addr   = ad_addr
                               and ls_type   = "company")
         then
            assign tApiDinvoiceDIJE.DinvoiceOwnVatNumber = ad_pst_id.
      end.   /* FOR FIRST ad_mstr */

/* Need to ensure that values of DInvoiceExchangeRate & DInvoiceRateScale   */
/* fields are correct. Need to check the direction of the exchange rate     */
/* definition. If the direction moves from base currency to transaction     */
/* currency, then DInvoiceRateScale should be set to exch_rate2 and         */
/* DInvoiceExchangeRate set to 1 / exch_rate.                               */
/* However, the exchange rate maybe defined in the reverse direction        */
/* i.e transaction currency to base currency. In such a circumstance, the   */
/* DInvoiceRateScale should be set to 1/ exch_rate and DInvoiceExchangeRate */
/* set to exch_rate2.                                                       */

      if so_curr = base_curr then
         assign  tApiDinvoiceDIJE.DInvoiceRateScale        = exch_rate2
                 tApiDinvoiceDIJE.DInvoiceExchangeRate     = 1 / exch_rate.
      else do:
         if not so_fix_rate then
            assign dtExRateDate = eff_date.
         else
            assign dtExRateDate = so_ord_date.
         for first exr_rate where exr_domain = global_domain
                              and exr_curr1  = base_curr
                              and exr_curr2  = so_curr
                              and exr_ratetype = ''
                              and exr_start_date <= dtExRateDate
                              and exr_end_date   >= dtExRateDate
         no-lock:
         end.
         if available exr_rate then
            assign  tApiDinvoiceDIJE.DInvoiceRateScale        = exch_rate2
                    tApiDinvoiceDIJE.DInvoiceExchangeRate     = 1 / exch_rate.
         else
            assign  tApiDinvoiceDIJE.DInvoiceRateScale    = 1 / exch_rate
                    tApiDinvoiceDIJE.DInvoiceExchangeRate     = exch_rate2.
      end.

      {us/px/pxrun.i &PROC='getPaymentConditionData' &PROGRAM='adcrxr.p'
            &HANDLE=ph_adcrxr
            &PARAM="(input so_mstr.so_cr_terms,
                     output DiscountPercent,
                     output Description,
                     output Staged)"}

      if Staged = no
      then do:
         /* DETERMINE DUE & DISCOUNT DATE FOR CREDIT TERMS & INVOICE DATE */
         {us/px/pxrun.i &PROC='getDueandDiscountDates' &PROGRAM='adcrxr.p'
            &HANDLE=ph_adcrxr
            &PARAM="(input  tApiDinvoiceDIJE.DInvoiceDate,
                     input  so_mstr.so_cr_terms,
                     output tApiDinvoiceDIJE.DInvoiceDiscountDueDate,
                     output tApiDinvoiceDIJE.DInvoiceDueDate)"}
      end.
      else do:
         /* IF MULTI-LEVEL CREDIT TERM, GET THE LAST DUE DATE */
         for last ctd_det
            where ctd_domain = global_domain
            and   ctd_code   = so_mstr.so_cr_terms
         no-lock:

            /* CALCULATE DATES USING LAST CREDIT TERMS RECORD */
            {us/px/pxrun.i &PROC='getDueandDiscountDates' &PROGRAM='adcrxr.p'
               &HANDLE=ph_adcrxr
               &PARAM="(input  tApiDinvoiceDIJE.DInvoiceDate,
                        input  ctd_date_cd,
                        output tApiDinvoiceDIJE.DInvoiceDiscountDueDate,
                        output tApiDinvoiceDIJE.DInvoiceDueDate)"}
         end.
      end. 

      /* Get GL period and year */
      for first glc_cal
         where glc_cal.glc_domain = global_domain and
            glc_start <= eff_date and
            glc_end  >= eff_date
      no-lock: end.

      assign l_so_billto = "".
      /* Find the bill-to address */
      find first ad_mstr where ad_domain = global_domain
         and ad_addr = so_mstr.so_bill
      no-lock no-error.

      if available ad_mstr then
         assign
            tApiDinvoiceDIJE.DInvoicePostingPeriod = glc_cal.glc_per
            tApiDinvoiceDIJE.DInvoicePostingYearPeriod =
               integer(string(glc_cal.glc_year, "9999") +
               string(glc_cal.glc_per, "99"))
            tApiDinvoiceDIJE.DInvoiceContact = ad_mstr.ad_attn
            l_so_billto                      = ad_addr.

      /* Find the ship-to address */
      find first ad_mstr where ad_domain = global_domain
         and ad_addr = so_mstr.so_ship no-lock.

      if available ad_mstr
      then
         assign
            tApiDinvoiceDIJE.ShipToAddress_ID = ad_mstr.ad_address_id
            tApiDinvoiceDIJE.DInvoiceShiptoCode = ad_mstr.ad_addr.


      create tApiDInvoicePostingDIJE.
      assign
         tApiDInvoicePostingDIJE.tc_Rowid = "LNK" + so_mstr.so_inv_nbr
         tApiDInvoicePostingDIJE.tc_ParentRowid = so_mstr.so_inv_nbr
         tApiDInvoicePostingDIJE.tc_Status = {&TCSTATUS-NEW}.

      assign
         orderTotal = getInvoiceTotal(so_nbr)
         tApiDinvoiceDIJE.DInvoiceType = getInvoiceType(so_nbr,orderTotal)
         originalInvoiceNumber = getOriginalInvoiceNumber(so_mstr.so_nbr).

      /* Check for correction invoices */
      if originalInvoiceNumber <> ""
      then do:
         run isOriginalInvoiceNegative(input originalInvoiceNumber,
                                       output isOriginalNegative).

         /* Verify the Master Invoice is not closed */
         run getHistInvoiceComponentsByNRM(input originalInvoiceNumber,
                                           input so_mstr.so_domain,
                                           output l_year,
                                           output l_daybookcode,
                                           output l_voucher).

         find first en_mstr no-lock
            where en_mstr.en_domain = global_domain  and
                  en_mstr.en_primary  = yes 
         no-error.

         /* Run the data object class to get the Invoice Status */
         /* Parameters: CompanyId, CompanyCode, Year, DaybookCode, Voucher */
         do on error undo, throw:     
            DInvoiceStatus = new GetDInvoiceStatus(?,en_entity,l_year,l_daybookcode,l_voucher).   
            catch anError as Progress.Lang.Error:        
               /* Start qflib.p - QAD Financials Library running persistently */
               run mfairunh.p
                  (input 'qflib.p',
                   input '?',
                   output hQADFinancialsLib) no-error.
               run processExceptions in hQADFinancialsLib (input anError).  
               p_isvalid = false.
               return.
      
            end catch. 
         end. 
         if not DInvoiceStatus:Available
         then do:
            p_isvalid = false.
            return.
         end.
         if (tApiDinvoiceDIJE.DInvoiceType = {&CREDIT} and not(isOriginalNegative)) or
            (tApiDinvoiceDIJE.DInvoiceType = {&INV_CORR} and not(isOriginalNegative) and (DInvoiceStatus:DInvoiceIsOpen)) or
            (tApiDinvoiceDIJE.DInvoiceType = {&CRED_CORR} and isOriginalNegative)
         then do:
            run getHistInvoiceComponentsByNRM(input originalInvoiceNumber,
                                     input so_mstr.so_domain,
                                     output tApiDinvoiceDIJE.tiLinkedPeriodYear,
                                     output tApiDinvoiceDIJE.tcLinkedJournalCode,
                                     output tApiDinvoiceDIJE.tiLinkedDInvoiceVoucher).

            /* Retrieve the adjustment daybook from the daybook set for the SO */
            {us/gp/gprunp.i "nrm" "p" "nr_dispense"
                   "(input getAdjustmentDaybook(so_mstr.so_daybookset),
                     input eff_date,
                     output adjustmentInvoice)"}
            /* Check the nrm procedure to see if an error occured. */
            {us/gp/gprunp.i "nrm" "p" "nr_check_error"
                  "(output errorState,
                    output errorNumber)"}
            /* if an error was returned display it to the user */
            if errorState and errorNumber <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=errorNumber}
               return.
            end.
            run getInvoiceComponents(input adjustmentInvoice,
                                     output adjustmentyear,
                                     output tApiDinvoiceDIJE.tcDAJournalCode,
                                     output tApiDinvoiceDIJE.tiDAVoucher).
         end.
         delete object DInvoiceStatus no-error.

      end.

   end.
END PROCEDURE.

PROCEDURE createInvoiceTax :
/*------------------------------------------------------------------------------
  Purpose:    Creates the QAD Financials Invoice Tax API Temp-Tables from the
              passed in invoice number.
  Parameters:  <input> invoiceNumber
               <input> post_entity

  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber as character  no-undo.
   define input  parameter post_entity as character  no-undo.
   define input  parameter invoiceType   as character  no-undo.

   define variable totTax as decimal    no-undo.
   define variable taxAmt as decimal    no-undo.
   define variable RecAmt as decimal    no-undo.
   define variable iVatCounter as integer no-undo initial 1.
   define variable iLinkRef    as integer no-undo initial 0.
   define variable NonTaxAmt   as decimal no-undo.
   define buffer tx2dbuff for tx2d_det.
   empty temp-table t_taxcode_data.

   for each tx2d_det
         where tx2d_det.tx2d_domain  = global_domain
         and   tx2d_det.tx2d_ref     = invoiceNumber
         and   tx2d_det.tx2d_trans_ent = post_entity no-lock,
       each tx2_mstr no-lock
          where tx2_mstr.tx2_domain   = tx2d_det.tx2d_domain
          and   tx2_mstr.tx2_tax_code = tx2d_det.tx2d_tax_code
   break by tx2d_line:
      find t_taxcode_data         
         where t_taxcode_code = tx2d_det.tx2d_tax_code 
      no-error.
      if available t_taxcode_data
      then do:
         assign
            t_taxcode_taxamt    = t_taxcode_taxamt    + tx2d_tottax        
            t_taxcode_tottax    = t_taxcode_tottax    + tx2d_cur_tax_amt   
            t_taxcode_recamt    = t_taxcode_recamt    + tx2d_cur_recov_amt 
            t_taxcode_nontaxamt = t_taxcode_nontaxamt + tx2d_nontax_amt.   
      end.
      if not available t_taxcode_data
      then do:
         create t_taxcode_data.
         assign
            t_taxcode_code      = tx2d_det.tx2d_tax_code
            t_taxcode_curr      = tx2d_det.tx2d_curr
            t_taxcode_taxamt    = tx2d_tottax
            t_taxcode_tottax    = tx2d_cur_tax_amt
            t_taxcode_recamt    = tx2d_cur_recov_amt
            t_taxcode_nontaxamt = tx2d_nontax_amt.
      end. /* IF NOT AVAILABLE t_taxcode_data */
      if first-of(tx2d_line)
      then
         assign
            iLinkRef = iLinkref + 1.

      /* Need to set the VAT sequence number. If there is only a single   */
      /* tx2d_det record for a given invoice line, then the number can be */
      /* set to 1. If there are several tx2d_det records for a given      */
      /* invoice line, then it's sequence number be determined from the   */
      /* tax environment records.                                         */
      if first-of(tx2d_line) and last-of(tx2d_line)
      then
         assign
            iVatCounter = 1.
      else do:
         assign
            iVatCounter = 1.
            VATseqcheckblock:
            for each tx2dbuff no-lock
                  where tx2dbuff.tx2d_domain  = global_domain
                  and   tx2dbuff.tx2d_ref     = invoiceNumber
                  and   tx2dbuff.tx2d_trans_ent = post_entity
                  and   tx2dbuff.tx2d_line = tx2d_det.tx2d_line
                  and   tx2dbuff.tx2d_tax_env = tx2d_det.tx2d_tax_env,
                each txenv_mstr no-lock
                   where tx2dbuff.tx2d_tax_env = txenv_tax_env,
                each txed_det no-lock
                   where txed_tax_env = txenv_tax_env
                   and   txed_tax_type = tx2dbuff.tx2d_tax_type
            break by txed_seq:
               if (recid(tx2d_det) = recid(tx2dbuff))
                  or (tx2dbuff.tx2d_tax_type = tx2d_det.tx2d_tax_type)
               then leave VATseqcheckblock.
               else
                  assign
                     iVatCounter = iVatCounter + 1.
            end.
      end. /* ELSE DO */
      find first tApiDinvoiceVatDIJE where
               tApiDinvoiceVatDIJE.tcVatCode = tx2d_det.tx2d_tax_code
      exclusive-lock no-error.

      /* If an existing DInvoiceVAT temp table record cannot be found */
      /* then created one.                                            */
      if not available tApiDinvoiceVatDIJE
      then do:
         create tApiDinvoiceVatDIJE.
         assign
            tApiDinvoiceVatDIJE.tcNormalTaxGLCode = tx2_mstr.tx2_ar_acct
            tApiDinvoiceVatDIJE.tcNormalTaxDivisionCode = tx2_mstr.tx2_ar_sub
            tApiDinvoiceVatDIJE.DInvoiceVatSequence = iVatCounter
            tApiDinvoiceVatDIJE.TxuTaxUsage      = tx2d_det.tx2d_tax_usage
            tApiDinvoiceVatDIJE.TxenvTaxEnv      = tx2d_det.tx2d_tax_env
            tApiDinvoiceVatDIJE.TxclTaxCls       = tx2d_det.tx2d_taxc
            tApiDinvoiceVatDIJE.TxtyTaxType      = tx2d_det.tx2d_tax_type
            tApiDinvoiceVatDIJE.tcVatCode        = tx2d_det.tx2d_tax_code
            tApiDinvoiceVatDIJE.tcVatInOut       = {&VATINOUT-OUTPUT}
            tApiDinvoiceVatDIJE.tcDomainCode     = tx2d_det.tx2d_domain
            tApiDinvoiceVatDIJE.LastModifiedDate = today
            tApiDinvoiceVatDIJE.LastModifiedTime = time
            tApiDinvoiceVatDIJE.LastModifiedUser = global_userid
            tApiDinvoiceVatDIJE.tc_Rowid         = string(tx2d_det.oid_tx2d_det)
            tApiDinvoiceVatDIJE.tc_ParentRowid   = invoiceNumber
            tApiDinvoiceVatDIJE.tc_Status        = {&TCSTATUS-NEW}
            tApiDinvoiceVatDIJE.DInvoiceVatUILinkedRowId = string(iLinkRef).
      end. /* IF NOT AVAILABLE tApiDinvoiceVatDIJE */
    end. /* FOR EACH tx2d_det */

    for each t_taxcode_data 
    no-lock:
       find first tx2_mstr
          where tx2_mstr.tx2_domain   = global_domain
          and   tx2_mstr.tx2_tax_code = t_taxcode_data.t_taxcode_code
       no-lock no-error.
       if not available tx2_mstr 
       then
          next.
       find first tApiDinvoiceVatDIJE where
         tApiDinvoiceVatDIJE.tcVatCode = t_taxcode_data.t_taxcode_code
       exclusive-lock no-error.
      if available tApiDinvoiceVatDIJE
       then do:
          assign
             tApiDinvoiceVATDIJE.DInvoiceVATNTBaseCreditTC =
                maximum(t_taxcode_NonTaxAmt, 0)
             tApiDinvoiceVATDIJE.DInvoiceVATNTBaseDebitTC =
                absolute(minimum(t_taxcode_NonTaxAmt, 0))
             tApiDinvoiceVatDIJE.DInvoiceVatVatBaseCreditTC =
                maximum(t_taxcode_taxamt, 0)
             tApiDinvoiceVatDIJE.DInvoiceVatVatBaseDebitTC =
                absolute(minimum(t_taxcode_taxAmt, 0))
             tApiDinvoiceVatDIJE.DInvoiceVatVatCreditTC =
                maximum(if t_taxcode_recamt <> 0 then t_taxcode_recamt else t_taxcode_TotTax, 0)
             tApiDinvoiceVatDIJE.DInvoiceVatVatDebitTC =
                absolute(minimum(if t_taxcode_RecAmt <> 0 then t_taxcode_RecAmt else t_taxcode_TotTax, 0)).

          /*UPDATE ABSORBED TAX DETAILS*/
          if tx2_mstr.tx2_ara_use 
          then do:
             assign tApiDinvoiceVatDIJE.DInvoiceVatIsAbsRet     = tx2_mstr.tx2_ara_use
                    tApiDinvoiceVatDIJE.tcAbsRetTaxGlCode       = tx2_mstr.tx2_ara_acct
                    tApiDinvoiceVatDIJE.tcAbsRetTaxDivisionCode = tx2_mstr.tx2_ara_sub. 
             /* WHEN TAX ABOSRBED tApiDinvoiceVatDIJE.DInvoiceVatVatCreditTC = tApiDinvoiceVatDIJE.DInvoiceVatVatDebitTC */
             if  tApiDinvoiceVatDIJE.DInvoiceVatVatCreditTC <> 0 
             then tApiDinvoiceVatDIJE.DInvoiceVatVatDebitTC  = tApiDinvoiceVatDIJE.DInvoiceVatVatCreditTC.
             else tApiDinvoiceVatDIJE.DInvoiceVatVatCreditTC = tApiDinvoiceVatDIJE.DInvoiceVatVatDebitTC.
          end.

          /* CHECK WHETHER THIS TRANSACTION SHOULD USE SUSPENDE TAX */
          if getSuspendedTaxInfo
             (input tx2_mstr.tx2_stx_dltx_use,
              input post_entity)
          then do:

             assign tApiDinvoiceVatDIJE.DInvoiceVatIsSuspDel       = yes
                    tApiDinvoiceVatDIJE.DInvoiceVatSuspDelTaxAmtTC = if tApiDinvoiceVatDIJE.DInvoiceVatVatCreditTC <> 0
                                                                     then maximum(if t_taxcode_RecAmt <> 0 then t_taxcode_RecAmt else t_taxcode_TotTax, 0)
                                                                     else absolute(minimum(if t_taxcode_RecAmt <> 0 then t_taxcode_RecAmt else t_taxcode_TotTax, 0)).

             if (invoiceType = {&INV_CORR} or invoiceType = {&INVOICE})
             then
                assign
                   tApiDinvoiceVatDIJE.tcSuspDelTaxGLCode         = tx2_mstr.tx2_stx_inv_acct
                   tApiDinvoiceVatDIJE.tcSuspDelTaxDivisionCode   = tx2_mstr.tx2_stx_inv_sub
                   tApiDinvoiceVatDIJE.DInvoiceVatSuspDelTaxAmtTC = if tApiDinvoiceVatDIJE.DInvoiceVatVatDebitTC <> 0 
                                                                    then - tApiDinvoiceVatDIJE.DInvoiceVatSuspDelTaxAmtTC 
                                                                    else tApiDinvoiceVatDIJE.DInvoiceVatSuspDelTaxAmtTC.


             else
                assign
                   tApiDinvoiceVatDIJE.tcSuspDelTaxGLCode         = tx2_mstr.tx2_stx_cn_acct
                   tApiDinvoiceVatDIJE.tcSuspDelTaxDivisionCode   = tx2_mstr.tx2_stx_cn_sub
                   tApiDinvoiceVatDIJE.tcNormalTaxGLCode          = tx2_mstr.tx2_ar_cn_acct
                   tApiDinvoiceVatDIJE.tcNormalTaxDivisionCode    = tx2_mstr.tx2_ar_cn_sub
                   tApiDinvoiceVatDIJE.DInvoiceVatSuspDelTaxAmtTC = if tApiDinvoiceVatDIJE.DInvoiceVatVatCreditTC <> 0
                                                                    then - tApiDinvoiceVatDIJE.DInvoiceVatSuspDelTaxAmtTC
                                                                    else tApiDinvoiceVatDIJE.DInvoiceVatSuspDelTaxAmtTC.

          end.
          else
             assign
                tApiDinvoiceVatDIJE.DInvoiceVatIsSuspDel       = no
                tApiDinvoiceVatDIJE.tcSuspDelTaxGLCode         = ""
                tApiDinvoiceVatDIJE.tcSuspDelTaxDivisionCode   = ""
                tApiDinvoiceVatDIJE.DInvoiceVatSuspDelTaxAmtTC = 0.
       end. /* end of if available tApiDinvoiceVat */

      for each tApiDinvoiceDIJE:
         assign
            tApiDinvoiceDIJE.DInvoiceVatBaseDebitTC =
               tApiDinvoiceDIJE.DInvoiceVatBaseDebitTC +
               tApiDinvoiceVatDIJE.DInvoiceVatVatBaseDebitTC
            tApiDinvoiceDIJE.DInvoiceVatBaseCreditTC =
               tApiDinvoiceDIJE.DInvoiceVatBaseCreditTC +
               tApiDinvoiceVatDIJE.DInvoiceVatVatBaseCreditTC
            tApiDinvoiceDIJE.DInvoiceVatCreditTC =
               tApiDinvoiceDIJE.DInvoiceVatCreditTC +
               tApiDinvoiceVatDIJE.DInvoiceVatVatCreditTC
            tApiDinvoiceDIJE.DInvoiceVatDebitTC =
               tApiDinvoiceDIJE.DInvoiceVatDebitTC +
               tApiDinvoiceVatDIJE.DInvoiceVatVatDebitTC
            tApiDinvoiceVatDIJE.DInvoiceVatIsTaxable = (tx2_tax_type <> "NON-TAX")
               tApiDinvoiceDIJE.tcVatCurrencyCode = t_taxcode_curr.
       end. /* FOR EACH tApiDinvoiceDIJE */
   end. /* FOR EACH t_taxcode_data */

END PROCEDURE.

PROCEDURE updateInvoiceTotals :
/*------------------------------------------------------------------------------
  Purpose:    Updates the QAD Financials Invoice API Temp-tables with the totals
              of the invoice.
  Parameters:  <input> salesAmount
               <input> commPct
               <input> marginAmount

  Notes:
------------------------------------------------------------------------------*/
   define input  parameter  salesAmount  like sod_price    no-undo.
   define input  parameter  commPct      like so_comm_pct  no-undo.
   define input  parameter  marginAmount as   decimal      no-undo.

   for first tApiDInvoiceDIJE:

      assign
         tApiDInvoiceDIJE.DInvoiceSalesAmt
         = tApiDInvoiceDIJE.DInvoiceSalesAmt + salesAmount
         tApiDInvoiceDIJE.DInvoiceComm1 = commPct[1]
         tApiDInvoiceDIJE.DInvoiceComm2 = commPct[2]
         tApiDInvoiceDIJE.DInvoiceComm3 = commPct[3]
         tApiDInvoiceDIJE.DInvoiceComm4 = commPct[4]
         tApiDinvoiceDIJE.DInvoiceMarginAmountTC
            = tApiDinvoiceDIJE.DInvoiceMarginAmountTC + marginAmount.

   end.

END PROCEDURE.



PROCEDURE createPostings :
/*------------------------------------------------------------------------------
  Purpose:    Creates the QAD Financials Posting API Temp-Tables from the
              passed in invoice number.
  Parameters:  <input> invoiceNumber
               <input> eff_date
               <input> post_entity
               <input> daybook_code
               <input> invoiceType

  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber as character  no-undo.
   define input  parameter eff_date      as date       no-undo.
   define input  parameter post_entity   as character  no-undo.
   define input  parameter invoiceType   as character  no-undo.
   define input  parameter daybook_code  as character  no-undo.
   define input  parameter table for ttGiaTransactions.

   define variable totTax as decimal    no-undo.
   define variable basetottax as decimal    no-undo.
   define variable basetaxamt as decimal    no-undo.
   define variable baserecamt as decimal    no-undo.
   define variable taxAmt as decimal    no-undo.
   define variable RecAmt as decimal    no-undo.

   define variable TotalCurAbsorbedTax as decimal no-undo.
   define variable TotalAbsorbedTax    as decimal no-undo.
   define variable l_susp_yn   as logical no-undo initial false.

   define variable ShipToTaxIDFederal like  AddressTaxIDFederal INIT "" no-undo.
   define variable ShipToTaxIDState   like  AddressTaxIDState   INIT "" no-undo.
   define variable ShipToTaxIDMisc1   like  AddressTaxIDMisc1   INIT "" no-undo.
   define variable ShipToTaxIDMisc2   like  AddressTaxIDMisc2   INIT "" no-undo.
   define variable ShipToTaxIDMisc3   like  AddressTaxIDMisc3   INIT "" no-undo.
   define variable cPostingVatTransType as character no-undo.
   define variable iGIAYear           as integer                        no-undo.
   define variable cGIAJournalCode    as character                      no-undo.
   define variable iGIAVoucher        as integer                        no-undo.
   define variable iCounter           as integer                        no-undo.
   define variable loopCount          as integer  initial 0             no-undo.
   /* Obtain the tax information for the posting entity*/
   define variable tempinvoicenumber  as character                      no-undo.
   define variable iYear              as integer                        no-undo.
   define variable iVoucherNumber     as integer                        no-undo.
   define variable iMaxLength         as integer  initial 255           no-undo.

   /* Run the data object class to get the Address Information for the Company */
   /* Parameters: CompanyId, CompanyCode, AddressType */
   do on error undo, throw:     
      CompanyAddress = new CompanyByCompanyCodeForAddress(?,post_entity,'HEADOFFICE').   
      catch anError as Progress.Lang.Error:        
         /* Start qflib.p - QAD Financials Library running persistently */
         run mfairunh.p
            (input 'qflib.p',
             input '?',
             output hQADFinancialsLib) no-error.
         run processExceptions in hQADFinancialsLib (input anError).  
         return.
      
      end catch. 
   end. 

    /* Call hook at this point only if cannot find GIA transactions, if can  *
     * find GIA transactions, records were already filtered                  */
    if not can-find(first ttgiatransactions) then do:
      /*Hook program to filter tApiDInvoiceOpInfoDIJE */
      {us/bbi/gprun.i ""gpldpst.p"" "(input invoiceNumber,
                                      input-output table tApiDInvoiceOpInfoDIJE)"}
    end.

   run getInvoiceComponentsByNRM(
          input invoiceNumber,
          input daybook_code,
          input global_domain,
          input eff_date,
          output iYear,
          output iVoucherNumber,
          output tempinvoicenumber).
/*debug*/ tempinvoicenumber = invoicenumber.

   for first glt_det where glt_det.glt_domain = global_domain and
                            glt_det.glt_ref    = invoiceNumber and
                            glt_det.glt_entity = post_entity
   no-lock:
      /* find the business relation for the address stored */
      /* on the glt_det.                                   */
      if glt_addr <> ""
      then
         for first ad_mstr
         where ad_mstr.ad_domain = glt_domain
           and ad_mstr.ad_addr   = glt_addr
         no-lock :
         end.
      else
         release ad_mstr.

      find first tApiPostingDIJE where
         tApiPostingDIJE.tc_Rowid = "PST" + glt_det.glt_ref no-error.

      /* Check to see if the invoice has been created already */
      if not available(tApiPostingDIJE)
      then do:
         create tApiPostingDIJE.
         run getInvoiceComponents(input tempinvoicenumber,
                                 output tApiPostingDIJE.PostingYear,
                                 output tApiPostingDIJE.tcJournalCode,
                                 output tApiPostingDIJE.PostingVoucher).

         assign
            tApiPostingDIJE.tcReportingJournalCode     = tApiPostingDIJE.tcJournalCode
            tApiPostingDIJE.PostingDate                = glt_det.glt_effdate
            tApiPostingDIJE.PostingOriginAddressCode   = glt_det.glt_addr
            tApiPostingDIJE.PostingOriginIsExternal    = true
            tApiPostingDIJE.PostingIsSkipAutoAssignLC  = false
            tApiPostingDIJE.PostingIsZeroValueAllowed  = true
            tApiPostingDIJE.PostingOriginReference     = glt_det.glt_ref
            tApiPostingDIJE.PostingOriginDocument      = glt_det.glt_doc
            tApiPostingDIJE.PostingOriginDocumentType  = glt_det.glt_doc_type
            tApiPostingDIJE.PostingOriginTransType     = glt_det.glt_tr_type
            tApiPostingDIJE.PostingOriginDaybookCode   = glt_det.glt_dy_code
            tApiPostingDIJE.PostingOriginDaybookNumber = glt_det.glt_dy_num
            tApiPostingDIJE.PostingBatchNumber         = glt_det.glt_batch
            tApiPostingDIJE.LastModifiedDate           = today
            tApiPostingDIJE.LastModifiedTime           = time
            tApiPostingDIJE.LastModifiedUser           = global_userid
            tApiPostingDIJE.PostingBusinessRelationTxt = if available ad_mstr then ad_bus_relation else ""
            tApiPostingDIJE.tc_Rowid                   = "PST" + glt_det.glt_ref
            tApiPostingDIJE.tc_Status                  = {&TCSTATUS-NEW}.
      end.

      /* Get GL period and year */
      for first glc_cal
         where glc_domain = global_domain and
            glc_start <= eff_date and
            glc_end  >= eff_date
         no-lock:
      end.

      assign
         tApiPostingDIJE.PostingPeriod = glc_cal.glc_per
         tApiPostingDIJE.PostingYearPeriod =
            integer(string(glc_cal.glc_year, "9999") +
               string(glc_cal.glc_per, "99")).
   end.

   /* Find the parent invoice record */
   find first tApiDinvoiceDIJE
      where tApiDinvoiceDIJE.tc_Rowid = invoiceNumber
   no-error.
   if available tApiDInvoiceDIJE
   then do:
      find first cm_mstr where
           cm_domain = global_domain and
           cm_addr   = l_so_billto
       no-lock no-error.
       if available cm_mstr
       then
          assign
             ShipToTaxIDFederal = cm_mstr.cm_gst_id
             ShipToTaxIDState   = cm_mstr.cm_pst_id
             ShipToTaxIDMisc1   = cm_mstr.cm_misc1
             ShipToTaxIDMisc2   = cm_mstr.cm_misc2
             ShipToTaxIDMisc3   = cm_mstr.cm_misc3.
   end. /* IF AVAILABLE tApiDInvoiceDIJE */.

   
   for each glt_det
      where glt_det.glt_domain = global_domain and
            glt_det.glt_ref    = invoiceNumber and
            glt_det.glt_entity = post_entity
   no-lock:

       create tApiPostingLineDIJE.

       for first ac_mstr
          where ac_mstr.ac_domain = glt_det.glt_domain
            and ac_mstr.ac_code = glt_det.glt_acc
       no-lock:
       end.

       assign
         tApiPostingLineDIJE.tcGLCode                  = glt_det.glt_acct
         tApiPostingLineDIJE.tcDivisionCode            = glt_det.glt_sub
         tApiPostingLineDIJE.tcCostCentreCode          = glt_det.glt_cc
         tApiPostingLineDIJE.tcProjectCode             = glt_det.glt_project
         tApiPostingLineDIJE.PostingLineSequence       = glt_det.glt_line
         tApiPostingLineDIJE.PostingLineOriginLineNbr  = glt_det.glt_line
         tApiPostingLineDIJE.tcCurrencyCode            = glt_det.glt_curr
         tApiPostingLineDIJE.PostingLineText           = glt_det.glt_desc
         tApiPostingLineDIJE.PostingLineCrossExternRef = glt_det.glt_interco_ref
         tApiPostingLineDIJE.LastModifiedDate          = today
         tApiPostingLineDIJE.LastModifiedTime          = time
         tApiPostingLineDIJE.LastModifiedUser          = global_userid
         tApiPostingLineDIJE.tc_RowId                  = string(glt_det.oid_glt_det)
         tApiPostingLineDIJE.tc_ParentRowid            = "PST" + glt_det.glt_ref
         tApiPostingLineDIJE.tc_Status                 = {&TCSTATUS-NEW}.

      
       /*Update Legal Doc numbers(comma seperated) for PostingLinie record */
       OPLoop:
       for each tApiDInvoiceOpInfoDIJE where tApiDInvoiceOpInfoDIJE.tc_ParentRowid = glt_det.glt_ref 
             and tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-LEGALDOC}
             and tApiDInvoiceOpInfoDIJE.tc_status = {&TCSTATUS-NEW}:
                
          if tApiPostingLineDIJE.PostingLineLegalDocNbr = "" 
          then do:
             if length(tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode,"CHARACTER") <= iMaxLength
             then tApiPostingLineDIJE.PostingLineLegalDocNbr = tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode.
             else leave.
          end.  /* if tApiPostingLineDIJE.PostingLineLegalDocNbr = "" */ 
          else do:
             do loopCount = 1 to num-entries(tApiPostingLineDIJE.PostingLineLegalDocNbr):
                if entry(loopCount,tApiPostingLineDIJE.PostingLineLegalDocNbr,",") = tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode then
                next OPLoop.
             end. 
             if length(tApiPostingLineDIJE.PostingLineLegalDocNbr + "," + tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode,"CHARACTER") <= iMaxLength
             then tApiPostingLineDIJE.PostingLineLegalDocNbr = tApiPostingLineDIJE.PostingLineLegalDocNbr 
                                                                                  + "," + tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode.
             else leave.                                                                     
          end.
       end.
           

      for first exr_rate 
         where exr_domain = global_domain
           and exr_curr1  = base_curr
           and exr_curr2  = glt_det.glt_curr
           and exr_ratetype = ''
           and exr_start_date <= glt_effdate
           and exr_end_date   >= glt_effdate
      no-lock:
      end. /* FOR FIRST exr_rate */

      if available exr_rate 
      then
         assign
            tApiPostingLineDIJE.PostingLineRateScale    = glt_det.glt_ex_rate2
            tApiPostingLineDIJE.PostingLineExchangeRate =  1 / glt_det.glt_ex_rate.
      else
         assign
            tApiPostingLineDIJE.PostingLineRateScale    = 1 / glt_det.glt_ex_rate
            tApiPostingLineDIJE.PostingLineExchangeRate = glt_det.glt_ex_rate2.

      /* Find the correct ttGIAtransactions record so that the invoice */
      /* posting line can be linked to the correct GIA posting.        */
      for first ttGiaTransactions where
         cSalesAcct = glt_det.glt_acct and
         cSalesSub  = glt_det.glt_sub  and
         cSalesCC   = glt_det.glt_cc   and
         cSalesProj = glt_det.glt_proj and
         cEntity    = post_entity
      no-lock:
      end.
        
      if available ttGiaTransactions
      then do:

         for first qad_wkfl where qad_domain = global_domain
               and qad_key1   = "GIA|" + trim(tempinvoicenumber) + '|' + string(glt_det.glt_line)
               and qad_key2   = cSoString
         no-lock:

            run getInvoiceComponents(input cGIATransRef,
                                     output iGIAYear,
                                     output cGIAJournalCode,
                                     output iGIAVoucher).
        
            assign tApiPostingLineDIJE.PostingLineGrossIncAccRef = string(iGIAYear) + '/' +
                                                                       trim(cGIAJournalCode) + '/' +
                                                                       string(iGIAVoucher,'999999999').
         end.
      end.
                                   
                 
      /* POPULATE AMOUNT FIELDS */
      if invoiceType <> {&CRED_CORR} and
         invoiceType <> {&INV_CORR}
      then
         /* NORMAL BOOKING */
         assign
            tApiPostingLineDIJE.PostingLineDebitTC  =
               if (glt_curr_amt >= 0) then glt_det.glt_curr_amt else 0
            tApiPostingLineDIJE.PostingLineCreditTC =
               if (glt_curr_amt < 0) then absolute(glt_det.glt_curr_amt) else 0
            tApiPostingLineDIJE.PostingLineDebitLC  =
               if (glt_amt >= 0) then glt_det.glt_amt else 0
            tApiPostingLineDIJE.PostingLineCreditLC =
               if (glt_amt < 0) then absolute(glt_det.glt_amt) else 0.
      else
         /* CORRECTION BOOKING */
         assign
            tApiPostingLineDIJE.PostingLineDebitTC  =
               if (glt_curr_amt < 0) then glt_det.glt_curr_amt else 0
            tApiPostingLineDIJE.PostingLineCreditTC =
               if (glt_curr_amt >= 0) then (glt_det.glt_curr_amt * -1) else 0
            tApiPostingLineDIJE.PostingLineDebitLC  =
               if (glt_amt < 0) then glt_det.glt_amt else 0
            tApiPostingLineDIJE.PostingLineCreditLC =
               if (glt_amt >= 0) then (glt_det.glt_amt * -1) else 0.

       /*
       * Update order totals -
       * As the customer control a/c is not being replicated it is not possible
       * to update the customer control a/c on the sales order (so_ar_acct)
       * This means so_ar_acct is blank and therefore glt_det.glt_acct is blank
       * for the customer control a/c transaction. We know that the transaction
       * against the customer contorl has the entire amount for the invoice
       * So if the current posting has no a/c its the customer control a/c so we
       * can use amount to populate the invoice totals.
       *
       */
       if tApiPostingLineDIJE.tcGLCode = "" and available tApiDinvoiceDIJE
       then
          assign
             tApiDInvoiceDIJE.DInvoiceOriginalDebitTC = tApiPostingLineDIJE.PostingLineDebitTC
             tApiDInvoiceDIJE.DInvoiceOriginalCreditTC = tApiPostingLineDIJE.PostingLineCreditTC.

       if available ac_mstr then
          assign
          tApiPostingLineDIJE.tcIntercoBusinessRelationCode =
             (if available ac_mstr and ac_gl_type = "CROSSCOMPANY"
              then
                getCrossCompanyCode
                   (input glt_det.glt_tr_type,
                    input "ICO_ACCT",
                    input glt_det.glt_acct) else "").

        /* Process tax lines for invoices */
       if glt_det.glt_acct <> ""
          and (available ac_mstr
               and ac_gl_type = "VAT")
       then do:
          for each tx2d_det
                where tx2d_det.tx2d_domain  = global_domain
                and   tx2d_det.tx2d_ref     = invoiceNumber
                and   tx2d_det.tx2d_trans_ent = post_entity no-lock,
             each  tx2_mstr no-lock
                where tx2_mstr.tx2_domain = tx2d_det.tx2d_domain
                  and tx2_mstr.tx2_tax_code = tx2d_det.tx2d_tax_code
           break by tx2_mstr.tx2_tax_code:

              /* Process absorbed tax */
              if (tx2_mstr.tx2_ara_use and
                 (tx2_mstr.tx2_ara_acct = glt_det.glt_acct and
                  tx2_mstr.tx2_ara_sub = glt_det.glt_sub) and
                 (invoiceType = {&INV_CORR} or invoiceType = {&INVOICE})) or
                 (tx2_mstr.tx2_ara_use and
                 (tx2_mstr.tx2_ara_cn_acct = glt_det.glt_acct and
                  tx2_mstr.tx2_ara_cn_sub = glt_det.glt_sub) and
                  (invoiceType = {&CRED_CORR} or invoiceType = {&CREDIT}))
              then do:
                 /* Total Tax Amount in Transaction Curreny */
                 accumulate tx2d_cur_abs_ret_amt (total by tx2_mstr.tx2_tax_code).
                 /* Total Tax Amount in Base Curreny */
                 accumulate tx2d_abs_ret_amt (total by tx2_mstr.tx2_tax_code).

                 if last-of(tx2_mstr.tx2_tax_code)
                 then do:

                    /* work out PostingVatTransType */
                    run setPostingVatTransType
                        (input tx2d_det.tx2d_zone_from,
                         input tx2d_det.tx2d_zone_to,
                         input yes,
                         output cPostingVatTransType).

                    assign
                       TotalCurAbsorbedTax = accum total by tx2_mstr.tx2_tax_code tx2d_cur_abs_ret_amt.
                       TotalAbsorbedTax    = accum total by tx2_mstr.tx2_tax_code tx2d_abs_ret_amt.
                    
                    iCounter = 0.
                    do while can-find(tApiPostingVatDIJE where tApiPostingVatDIJE.tc_Rowid = string(mtime))
                                and iCounter < 10000:
                       iCounter = iCounter + 1.
                    end.

                    create tApiPostingVatDIJE.
                    assign
                       tApiPostingVatDIJE.PostingVatBaseCreditLC = 0
                       tApiPostingVatDIJE.PostingVatBaseDebitLC  = 0
                       tApiPostingVatDIJE.PostingVatBaseCreditTC = 0
                       tApiPostingVatDIJE.PostingVatBaseDebitTC  = 0
                       tApiPostingVatDIJE.PostingVatTaxPointDate = tx2d_det.tx2d_effdate
                       tApiPostingVatDIJE.PostingVatTaxCreditLC
                          = maximum(TotalAbsorbedTax, 0)
                       tApiPostingVatDIJE.PostingVatTaxDebitLC
                          = absolute(minimum(TotalAbsorbedTax, 0))
                       tApiPostingVatDIJE.PostingVatTaxCreditTC
                          = maximum(TotalCurAbsorbedTax, 0)
                       tApiPostingVatDIJE.PostingVatTaxDebitTC
                          = absolute(minimum(TotalCurAbsorbedTax, 0))
                       tApiPostingVatDIJE.PostingVatTaxTransType = tx2d_det.tx2d_tr_type
                       tApiPostingVatDIJE.PostingVatInOut        = {&VATINOUT-OUTPUT}
                       tApiPostingVatDIJE.tcVatInOut             = {&VATINOUT-OUTPUT}
                       tApiPostingVatDIJE.PostingVatTransType    = cPostingVatTransType
                       tApiPostingVatDIJE.tcVatCode              = tx2d_det.tx2d_tax_code
                       tApiPostingVatDIJE.TxtyTaxType            = tx2d_det.tx2d_tax_type
                       tApiPostingVatDIJE.TxclTaxCls             = tx2d_det.tx2d_taxc
                       tApiPostingVatDIJE.TxuTaxUsage            = tx2d_det.tx2d_tax_usage
                       tApiPostingVatDIJE.PostingVatTaxTransType = tx2d_det.tx2d_tr_type
                       tApiPostingVatDIJE.PostingVatIsReverseCharge = tx2_reverse_charge
                       tApiPostingVatDIJE.tcDomainCode           = tx2d_det.tx2d_domain
                       tApiPostingVatDIJE.TxenvTaxEnv            = tx2d_det.tx2d_tax_env
                       tApiPostingVatDIJE.FromTxzTaxZone         = tx2d_det.tx2d_zone_from
                       tApiPostingVatDIJE.ToTxzTaxZone           = tx2d_det.tx2d_zone_to
                       tApiPostingVatDIJE.LastModifiedDate       = today
                       tApiPostingVatDIJE.LastModifiedTime       = time
                       tApiPostingVatDIJE.LastModifiedUser       = global_userid
                       tApiPostingVatDIJE.tc_Rowid               = string(mtime)
                       tApiPostingVatDIJE.tc_ParentRowid         = string(glt_det.oid_glt_det)
                       tApiPostingVatDIJE.PostingVatIsAbsRet     = true
                       tApiPostingVatDIJE.tc_Status              = {&TCSTATUS-NEW}
                       tApiPostingVatDIJE.PostingVatTaxIDFeder   = ShipToTaxIDFederal
                       tApiPostingVatDIJE.PostingVatTaxIDState   = ShipToTaxIDState
                       tApiPostingVatDIJE.PostingVatTaxIDMisc1   = ShipToTaxIDMisc1
                       tApiPostingVatDIJE.PostingVatTaxIDMisc2   = ShipToTaxIDMisc2
                       tApiPostingVatDIJE.PostingVatTaxIDMisc3   = ShipToTaxIDMisc3.
                       if CompanyAddress:Available then do:
                          assign tApiPostingVatDIJE.PostingVatOwnTaxIDFeder = CompanyAddress:AddressTaxIDFederal
                                 tApiPostingVatDIJE.PostingVatOwnTaxIDMisc1 = CompanyAddress:AddressTaxIDMisc1
                                 tApiPostingVatDIJE.PostingVatOwnTaxIDMisc2 = CompanyAddress:AddressTaxIDMisc2
                                 tApiPostingVatDIJE.PostingVatOwnTaxIDMisc3 = CompanyAddress:AddressTaxIDMisc3.

                          if available tApiDinvoiceDIJE 
                             and (tApiDinvoiceDIJE.DinvoiceOwnVatNumber <> "":U 
                             and  tApiDinvoiceDIJE.DinvoiceOwnVatNumber <> ?)
                          then
                             assign tApiPostingVatDIJE.PostingVatOwnTaxIDState = tApiDinvoiceDIJE.DinvoiceOwnVatNumber.
                          else 
                             assign tApiPostingVatDIJE.PostingVatOwnTaxIDState = CompanyAddress:AddressTaxIDState.
                       end.   /*if CompanyAddress:Available*/
                 end.
              end.
              /* CHECK WHETHER THIS TRANSACTION SHOULD USE SUSPENDE TAX */
              assign l_susp_yn = getSuspendedTaxInfo
                                 (input tx2_mstr.tx2_stx_dltx_use,
                                  input post_entity).

              /* Process normal tax */
              if (not l_susp_yn                           and
                  tx2_mstr.tx2_ar_acct = glt_det.glt_acct and
                  tx2_mstr.tx2_ar_sub = glt_det.glt_sub   and
                  tx2_mstr.tx2_ar_cc = glt_det.glt_cc     and
                  (invoiceType = {&INV_CORR} or invoiceType = {&INVOICE})) or
                 (not l_susp_yn                              and
                  tx2_mstr.tx2_ar_cn_acct = glt_det.glt_acct and
                  tx2_mstr.tx2_ar_cn_sub = glt_det.glt_sub   and
                  (invoiceType = {&CRED_CORR} or invoiceType = {&CREDIT})) or
                  (l_susp_yn                                    and
                   glt_det.glt_acct = tx2_mstr.tx2_stx_inv_acct and
                   glt_det.glt_sub  = tx2_mstr.tx2_stx_inv_sub  and
                   glt_det.glt_cc   = ""                        and
                   (invoiceType = {&INV_CORR} or invoiceType = {&INVOICE}) ) or
                  (l_susp_yn                                    and
                   glt_det.glt_acct = tx2_mstr.tx2_stx_cn_acct  and
                   glt_det.glt_sub  = tx2_mstr.tx2_stx_cn_sub   and
                   glt_det.glt_cc   = ""                        and
                  (invoiceType = {&CRED_CORR} or invoiceType = {&CREDIT}))
              then do:
                /* Total Tax Amount in Transaction Curreny */
                 accumulate tx2d_cur_tax_amt (total by tx2_mstr.tx2_tax_code).
                 /* Total Taxable Amount in Transaction Curreny */
                 accumulate tx2d_tottax (total by tx2_mstr.tx2_tax_code).
                 /* TOTAL RECOVERABLE AMOUNT IN TRANSACTION CURRENCY */
                 accumulate tx2d_cur_recov_amt (total by tx2_mstr.tx2_tax_code).

                 /* Total Tax Amount in base currency */
                 accumulate tx2d_tax_amt     (total by tx2_mstr.tx2_tax_code).
                 /* Total taxable amount in base currency */
                 accumulate tx2d_taxable_amt (total by tx2_mstr.tx2_tax_code).
                 /* Total recoverable Amount in base currency */
                 accumulate tx2d_recov_amt     (total by tx2_mstr.tx2_tax_code).
                 if last-of(tx2_mstr.tx2_tax_code) then do:
                    assign
                       taxAmt = accum total by tx2_mstr.tx2_tax_code tx2d_tottax
                       totTax = accum total by tx2_mstr.tx2_tax_code tx2d_cur_tax_amt
                       RecAmt = accum total by tx2_mstr.tx2_tax_code tx2d_cur_recov_amt
                       basetaxamt = accum total by tx2_mstr.tx2_tax_code tx2d_taxable_amt
                       basetottax = accum total by tx2_mstr.tx2_tax_code tx2d_tax_amt
                       baserecamt =  accum total by tx2_mstr.tx2_tax_code tx2d_recov_amt.
                    run setPostingVatTransType
                        (input tx2d_det.tx2d_zone_from,
                         input tx2d_det.tx2d_zone_to,
                         input yes,
                         output cPostingVatTransType).

                    if not can-find (tApiPostingVatDIJE where tApiPostingVatDIJE.tc_Rowid = string(tx2d_det.oid_tx2d_det))
                    then do:
                       create tApiPostingVatDIJE.
                       assign
                          tApiPostingVatDIJE.PostingVatBaseCreditLC= maximum(basetaxamt,0)
                          tApiPostingVatDIJE.PostingVatBasedebitLC=  absolute(minimum(basetaxamt,0))
                          tApiPostingVatDIJE.PostingVatBaseCreditTC = maximum(taxAmt, 0)
                          tApiPostingVatDIJE.PostingVatBaseDebitTC  = absolute(minimum(taxAmt, 0))
                          tApiPostingVatDIJE.PostingVatTaxPointDate = tx2d_det.tx2d_effdate
                          tApiPostingVatDIJE.PostingVatTaxCreditLC  = maximum(if BaseRecAmt <> 0 then BaseRecAmt else BaseTotTax, 0)
                          tApiPostingVatDIJE.PostingVatTaxDebitLC   = absolute(minimum(if BaseRecAmt <> 0 then BaseRecAmt else BaseTotTax, 0))
                          tApiPostingVatDIJE.PostingVatTaxCreditTC  = maximum(if RecAmt <> 0 then RecAmt else TotTax, 0)
                          tApiPostingVatDIJE.PostingVatTaxDebitTC   = absolute(minimum(if RecAmt <> 0 then RecAmt else TotTax, 0))
                          tApiPostingVatDIJE.PostingVatTaxTransType = tx2d_det.tx2d_tr_type
                          tApiPostingVatDIJE.PostingVatInOut        = {&VATINOUT-OUTPUT}
                          tApiPostingVatDIJE.tcVatInOut             = {&VATINOUT-OUTPUT}
                          tApiPostingVatDIJE.PostingVatTransType    = cPostingVatTransType
                          tApiPostingVatDIJE.tcVatCode              = tx2d_det.tx2d_tax_code
                          tApiPostingVatDIJE.TxtyTaxType            = tx2d_det.tx2d_tax_type
                          tApiPostingVatDIJE.TxclTaxCls             = tx2d_det.tx2d_taxc
                          tApiPostingVatDIJE.TxuTaxUsage            = tx2d_det.tx2d_tax_usage
                          tApiPostingVatDIJE.PostingVatTaxTransType = tx2d_det.tx2d_tr_type
                          tApiPostingVatDIJE.PostingVatIsReverseCharge = tx2_reverse_charge
                          tApiPostingVatDIJE.tcDomainCode           = tx2d_det.tx2d_domain
                          tApiPostingVatDIJE.TxenvTaxEnv            = tx2d_det.tx2d_tax_env
                          tApiPostingVatDIJE.FromTxzTaxZone         = tx2d_det.tx2d_zone_from
                          tApiPostingVatDIJE.ToTxzTaxZone           = tx2d_det.tx2d_zone_to
                          tApiPostingVatDIJE.LastModifiedDate       = today
                          tApiPostingVatDIJE.LastModifiedTime       = time
                          tApiPostingVatDIJE.LastModifiedUser       = global_userid
                          tApiPostingVatDIJE.tc_Rowid               = string(tx2d_det.oid_tx2d_det)
                          tApiPostingVatDIJE.tc_ParentRowid         = string(glt_det.oid_glt_det)
                          tApiPostingVatDIJE.PostingVatIsAbsRet     = false
                          tApiPostingVatDIJE.tc_Status              = {&TCSTATUS-NEW}
                          tApiPostingVatDIJE.PostingVatTaxIDFeder   = ShipToTaxIDFederal
                          tApiPostingVatDIJE.PostingVatTaxIDState   = ShipToTaxIDState
                          tApiPostingVatDIJE.PostingVatTaxIDMisc1   = ShipToTaxIDMisc1
                          tApiPostingVatDIJE.PostingVatTaxIDMisc2   = ShipToTaxIDMisc2
                          tApiPostingVatDIJE.PostingVatTaxIDMisc3   = ShipToTaxIDMisc3.
                       if CompanyAddress:Available then do:
                          assign tApiPostingVatDIJE.PostingVatOwnTaxIDFeder = CompanyAddress:AddressTaxIDFederal
                                 tApiPostingVatDIJE.PostingVatOwnTaxIDMisc1 = CompanyAddress:AddressTaxIDMisc1
                                 tApiPostingVatDIJE.PostingVatOwnTaxIDMisc2 = CompanyAddress:AddressTaxIDMisc2
                                 tApiPostingVatDIJE.PostingVatOwnTaxIDMisc3 = CompanyAddress:AddressTaxIDMisc3.

                          if available tApiDinvoiceDIJE 
                             and (tApiDinvoiceDIJE.DinvoiceOwnVatNumber <> "":U 
                             and  tApiDinvoiceDIJE.DinvoiceOwnVatNumber <> ?)
                          then 
                             assign tApiPostingVatDIJE.PostingVatOwnTaxIDState = tApiDinvoiceDIJE.DinvoiceOwnVatNumber.
                          else 
                             assign tApiPostingVatDIJE.PostingVatOwnTaxIDState = CompanyAddress:AddressTaxIDState.

                       end.   /* if CompanyAddress:Available*/
                       if l_susp_yn 
                       then
                          assign tApiPostingVatDIJE.PostingVatIsSuspDel = yes.
                    end.    /* if not can-find */
                 end.
               end. /*glt_acct equals tax a/c */
          end. /* end of for each tax */
       end. /* gl acct not blank*/
   end.
   delete object CompanyAddress no-error.


END PROCEDURE.

PROCEDURE createGiaPostings :
/*------------------------------------------------------------------------------
  Purpose:    Creates the QAD Financials Posting API Temp-Tables from the
              passed in invoice number for GIA transactions.
  Parameters:  <input> invoiceNumber
               <input> InterCoInvNbr
               <input> PostEntity
               <input> temp-table ttGiaTransactions - populated by sogiapst.p
               <input> eff_date
               <input> invoiceType
 
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber     as character  no-undo.
   define input  parameter InterCoInvNbr     as character  no-undo.
   define input  parameter PostEntity        as character  no-undo.
   define input  parameter table             for ttGiaTransactions.
   define input  parameter eff_date          as date       no-undo.
   define input  parameter invoiceType       as character  no-undo.
   define input  parameter idaybook_code     as character  no-undo.
    
   define variable iInvoiceYear        as integer   no-undo.
   define variable cInvoiceJournalCode as character no-undo.
   define variable iInvoiceVoucher     as integer   no-undo.
   define variable invoiceNbr          as character no-undo.
   define variable cPostDomain         like global_domain no-undo.

   define buffer glt_det for glt_det.

   define variable totTax    as decimal no-undo.
   define variable taxAmt    as decimal no-undo.
   define variable loopCount as integer initial 0 no-undo.
   define variable iMaxLength as integer initial 255 no-undo.
   
   /* if there are no GIA transactions then leave the procedure */
   if not can-find(first ttgiatransactions) then return.
   
   /*Hook program to filter tApiDInvoiceOpInfoDIJE */
   {us/bbi/gprun.i ""gpldpst.p"" "(input invoiceNumber,
                                   input-output table tApiDInvoiceOpInfoDIJE)"}
   
   /* Get GL period and year */
   for first glc_cal
      where glc_cal.glc_domain = global_domain and
            glc_start <= eff_date              and
            glc_end   >= eff_date
      no-lock:
   end.

   /* Run the data object class to get the Address Information for the Company */
   /* Parameters: CompanyId, CompanyCode, AddressType */
   do on error undo, throw:
      SelectCompany = new SelectCompany(?,postentity).
      catch anError as Progress.Lang.Error:
         /* Start qflib.p - QAD Financials Library running persistently */
         run mfairunh.p
            (input 'qflib.p',
             input '?',
             output hQADFinancialsLib) no-error.
         run processExceptions in hQADFinancialsLib (input anError).
         return.
      end catch. /* Catch anError*/
   end. /* Do on error undo, throw */

   /* Process the contents of the ttGiaTransactions temp-table.   */    
   /* For each GIA transaction reference, create a set of         */    
   /* of staging records so the GIA operational transactions will */    
   /* be loaded into the financials.                              */    
    
   ttloop:
   for each ttgiatransactions
      no-lock break by cGIATransRef:
      if first-of(cGIATransRef)
      then do:
         /* Check if the glt_det records exist for the GIA transaction */
         if not can-find(first glt_det where
                               glt_det.glt_domain = global_domain and
                               glt_det.glt_ref    = cGIATransRef)
         then next ttloop.

         /* transfer the connects of the glt_det records into the staging tables. */
         for each glt_det where
            glt_det.glt_domain = global_domain and
            glt_det.glt_ref    = cGIATransRef exclusive-lock
            break by glt_det.glt_entity:

            /* For the first glt_det record, create the posting header record. */
            if first-of(glt_det.glt_entity)
            then do:
               for first tGiaApiPosting where
                  tGiaApiPosting.tc_Rowid = "GIAPST" + glt_det.glt_ref  +
                  glt_det.glt_entity
               exclusive-lock:
               end.
               /* Check to see if the GIA posting header has been created already */
               if not available(tGiaApiPosting)
               then do:
                  create tGiaApiPosting.
                  /* Separate the transaction ref into the invoice number components. */
                  run getInvoiceComponents
                     (input cGIATransRef,
                      output tGiaApiPosting.PostingYear,
                      output tGiaApiPosting.tcJournalCode,
                      output tGiaApiPosting.PostingVoucher).
                  assign
                     tGiaApiPosting.PostingDate                = glt_det.glt_effdate
                     tGiaApiPosting.PostingOriginIsExternal    = true
                     tGiaApiPosting.PostingIsSkipAutoAssignLC  = false
                     tGiaApiPosting.PostingIsZeroValueAllowed  = true
                     tGiaApiPosting.PostingOriginReference     = glt_det.glt_ref
                     tGiaApiPosting.PostingOriginEntity        = glt_det.glt_entity
                     tGiaApiPosting.PostingOriginDocument      = glt_det.glt_doc
                     tGiaApiPosting.PostingOriginDocumentType  = glt_det.glt_doc_type
                     tGiaApiPosting.PostingOriginTransType     = glt_det.glt_tr_type
                     tGiaApiPosting.PostingOriginDaybookCode   = glt_det.glt_dy_code
                     tGiaApiPosting.PostingOriginDaybookNumber = glt_det.glt_dy_num
                     tGiaApiPosting.PostingPeriod              = glc_cal.glc_per
                     tGiaApiPosting.PostingYearPeriod          = integer(string(glc_cal.glc_year, "9999") +
                                                                  string(glc_cal.glc_per, "99"))
                     tGiaApiPosting.LastModifiedDate           = today
                     tGiaApiPosting.LastModifiedTime           = time
                     tGiaApiPosting.LastModifiedUser           = global_userid
                     tGiaApiPosting.tc_Rowid                   = "GIAPST" + glt_det.glt_ref + glt_det.glt_entity
                     tGiaApiPosting.tc_Status                  = {&TCSTATUS-NEW}.
                           
                  /* Check if the transaction is an inter-company one or not: */
                  /* If yes, then use the inter-company reference number for  */
                  /* assigning the invoice reference text field. Otherwise    */
                  /* use the invoice number.                                  */
                  if selectcompany:available 
                     then assign cPostDomain = selectcompany:domaincode.
                  else assign cPostDomain = global_domain.
                                                        
                  if glt_det.glt_entity = PostEntity
                  then do:
                     run getInvoiceComponentsByNRM(
                        input invoiceNumber,
                        input idaybook_code,
                        input cPostDomain,
                        input eff_date,
                        output iInvoiceYear,
                        output iInvoiceVoucher,
                        output invoiceNbr).  

                     assign 
                        cInvoiceJournalCode = idaybook_code.
                  end. /* if glt_det.glt_entity = PostEntity */
                  else 
                  do: 
                     run getInvoiceComponents(input InterCoInvNbr,
                      output iInvoiceYear,
                      output cInvoiceJournalCode,
                      output iInvoiceVoucher). 
                      
                  end. /* NOT  if glt_det.glt_entity = PostEntity */
                  assign 
                     tGiaApiPosting.PostingInvoiceReferenceTxt = string(iInvoiceYear)      + '/' +
																		           trim(cInvoiceJournalCode) + '/' +
																		           string(iInvoiceVoucher,'999999999')
                     glt_det.glt_doc                           = "GIA:" + tGiaApiPosting.PostingInvoiceReferenceTxt.
               end. /* if not available(tGiaApiPosting) */
            end.  /* if first-of(glt_det.glt_entity) */
            create tGiaApiPostingLine.
            assign
               tGiaApiPostingLine.tcGLCode                  = glt_det.glt_acct
               tGiaApiPostingLine.tcDivisionCode            = glt_det.glt_sub
               tGiaApiPostingLine.tcCostCentreCode          = glt_det.glt_cc
               tGiaApiPostingLine.tcProjectCode             = glt_det.glt_project
               tGiaApiPostingLine.PostingLineSequence       = glt_det.glt_line
               tGiaApiPostingLine.PostingLineOriginLineNbr  = glt_det.glt_line
               tGiaApiPostingLine.tcCurrencyCode            = glt_det.glt_curr
               tGiaApiPostingLine.PostingLineText           = glt_det.glt_desc
               tGiaApiPostingLine.PostingLineCrossExternRef = glt_det.glt_interco_ref
               tGiaApiPostingLine.LastModifiedDate          = today
               tGiaApiPostingLine.LastModifiedTime          = time
               tGiaApiPostingLine.LastModifiedUser          = global_userid
               tGiaApiPostingLine.tc_RowId                  = string(glt_det.oid_glt_det)
               tGiaApiPostingLine.tc_ParentRowid            = "GIAPST" + glt_det.glt_ref + glt_det.glt_entity
               tGiaApiPostingLine.tc_Status                 = {&TCSTATUS-NEW}
               tGiaApiPOstingLine.PostingLineGrossIncAccRef = tGiaApiPosting.PostingInvoiceReferenceTxt.

            OPLoop:
            for each tApiDInvoiceOpInfoDIJE where tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber 
               and tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-LEGALDOC}
               and tApiDInvoiceOpInfoDIJE.tc_status = {&TCSTATUS-NEW}:
               if tGiaApiPOstingLine.PostingLineLegalDocNbr = "" 
               then do:
                  if length(tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode,"CHARACTER") <= iMaxLength
                  then tGiaApiPOstingLine.PostingLineLegalDocNbr = tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode.
                  else leave.
               end.  /* if tGiaApiPOstingLine.PostingLineLegalDocNbr = ""  */  
               else do:
                  do loopCount = 1 to num-entries(tGiaApiPOstingLine.PostingLineLegalDocNbr):
                     if entry(loopCount,tGiaApiPOstingLine.PostingLineLegalDocNbr,",") = tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode then
                        next OPLoop.
                  end. /* do loopCount */
                  if length(tGiaApiPOstingLine.PostingLineLegalDocNbr + "," + tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode,"CHARACTER")  <= iMaxLength    
                  then tGiaApiPOstingLine.PostingLineLegalDocNbr = tGiaApiPOstingLine.PostingLineLegalDocNbr 
                     + "," + tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode.
                  else leave.   
               end. /* NOT if tGiaApiPOstingLine.PostingLineLegalDocNbr = "" */
            end. /* OPLoop */

            for first exr_rate 
               where exr_domain = global_domain
               and exr_curr1  = base_curr
               and exr_curr2  = glt_det.glt_curr
               and exr_ratetype = ''
               and exr_start_date <= glt_effdate
               and exr_end_date   >= glt_effdate
               no-lock:
            end. /* FOR FIRST exr_rate */

            if available exr_rate 
            then
               assign
                  tGiaApiPostingLine.PostingLineRateScale    = glt_det.glt_ex_rate2
                  tGiaApiPostingLine.PostingLineExchangeRate = 1 / glt_det.glt_ex_rate.
            else
               assign
                  tGiaApiPostingLine.PostingLineRateScale    = 1 / glt_det.glt_ex_rate
                  tGiaApiPostingLine.PostingLineExchangeRate = glt_det.glt_ex_rate2.
            /* POPULATE AMOUNT FIELDS */
            /* Set posting values based on invoice type */
            if invoiceType <> {&CRED_CORR} and
               invoiceType <> {&INV_CORR}
            then
               assign
                  tGiaApiPostingLine.PostingLineDebitTC = if (glt_curr_amt >= 0) then glt_det.glt_curr_amt else 0
				   tGiaApiPostingLine.PostingLineCreditTC =
					  if (glt_curr_amt < 0) then absolute(glt_det.glt_curr_amt) else 0
				   tGiaApiPostingLine.PostingLineDebitLC  =
					  if (glt_amt >= 0) then glt_det.glt_amt else 0
				   tGiaApiPostingLine.PostingLineCreditLC =
					  if (glt_amt < 0) then absolute(glt_det.glt_amt) else 0.
            else
               assign
                  tGiaApiPostingLine.PostingLineDebitTC = if (glt_curr_amt < 0) then glt_det.glt_curr_amt else 0
				   tGiaApiPostingLine.PostingLineCreditTC =
					  if (glt_curr_amt >= 0) then (glt_det.glt_curr_amt * -1) else 0
				   tGiaApiPostingLine.PostingLineDebitLC  =
					  if (glt_amt < 0) then glt_det.glt_amt else 0
				   tGiaApiPostingLine.PostingLineCreditLC =
					  if (glt_amt >= 0) then (glt_det.glt_amt * -1) else 0.
            /* Buffer copy the SAF information */            
            for each tApiPostingSafDIJE
               where tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det):
               create tGiaApiPostingSaf.
               buffer-copy tApiPostingSafDIJE to tGiaApiPostingSaf.
            end. /* for each tApiPostingSafDIJE */
         end. /* for each glt_det where */
      end. /* if first-of(cGIATransRef) */
   end. /* for each ttgiatransactions */
   
   delete object SelectCompany no-error.
   
END PROCEDURE.

PROCEDURE sendInvoicePostings :
/*------------------------------------------------------------------------------
  Purpose:    Calls the QAD Financials API to create the invoice and postings
  Parameters:  <input> invoiceNumber
               <input> post_entity
               <output> ocDIInvCertCertificate 
               <output> ocDIInvCertSignatureCurr
               <output> tFcMessages
               <output> returnStatus as integer
  Creation: KIV 20110404
  Notes: This procedure is just a copy of sendInvoicePostings with these changes:
            - This method has some additional output params about the invoice-certification
            - This method calls bdinvoicejournalentry:apistdmaintainttrunv01 iso bdinvoicejournalentry:apistdmaintainttrun
------------------------------------------------------------------------------*/

    define input parameter invoiceNumber as character  no-undo.
    define input  parameter post_entity as character  no-undo.

    /* InvoiceCerification 20110405 Add two new params that return the invoice-certificate related info of the newly created invoice */
    define output parameter ocDIInvCertCertificate    as character no-undo.
    define output parameter ocDIInvCertSignatureCurr  as character no-undo.
    
    /* 20130419 : Add output parameter for Payment Reference */
    define output parameter ocDITSMNumber             as character no-undo.

    define output parameter table for tFcMessages.
    define output parameter returnStatus as integer  initial -98  no-undo.

    define buffer glt_det for glt_det.
    
    empty temp-table tFcMessages.

    find first gl_ctrl where gl_domain = global_domain no-lock no-error.
    if available gl_ctrl and not gl_verify then do:
       create tFcMessages.
       assign
          tFcMessages.tcFcContext = invoiceNumber.
       {us/bbi/pxmsg.i &MSGBUFFER=tFcMessages.tcFcMessage &MSGNUM=3162 &ERRORLEVEL=4}
       return.
    end.

   do on error undo, return:
      assign icAction = {&PROXYACTION-SAVE}
         vcProxyCompanyCode = post_entity.

      find first tApiDInvoiceDIJE no-lock no-error.

      if available tApiDInvoiceDIJE then do:

         /* Make the call */

          /* InvoiceCerification 20110405 : Call apistdmaintainttv01 iso apistdmaintaintt */
          /* Payment Reference 20130419 : Call apistdmaintainttv02 iso apistdmaintainttv01 */
          {proxy/bdinvoicejournalentry/apistdmaintainttv02run.i}

         /* Assign the invoice number to the context field */
         for each tFcMessages:
            assign tFcMessages.tcFcContext = invoiceNumber.
         end.
         assign returnStatus = oiReturnStatus.
         /* Error handling */
         if returnStatus < 0 then do:
            run emptyApiTempTables.
             return.
         end.
         else do:
            assign tApiDInvoiceDIJE.DInvoice_ID = INT64(ocLstPrimKey).

            /* InvoiceCerification 20110405 : Capture the invoice-certificate related data of the newly created invoice into tApiDInvoiceDIJE and into the output params */
            /* Payment reference 20130419 : capture the payment reference of the newly created invoice into tApiDInvoiceDIJE and into the output parameter */
            assign tApiDInvoiceDIJE.DInvoiceInvCertCertificate   = ocLstDIInvCertCertificate 
                   tApiDInvoiceDIJE.DInvoiceInvCertSignatureCurr = ocLstDIInvCertSignatureCurr
                   tApiDInvoiceDIJE.DInvoiceTSMNumber            = ocLstDITSMNumber
                   ocDIInvCertCertificate                        = ocLstDIInvCertCertificate
                   ocDIInvCertSignatureCurr                      = ocLstDIInvCertSignatureCurr
                   ocDITSMNumber                                 = ocLstDITSMNumber.
            if tApiDinvoiceDIJE.tcProjectCode = ""
               and oclstCustControlAC <> ""
               and oclstCustControlAC <> ?
            then do:
               do on error undo, throw:     
                  Project =  new ProjectByGl(?,post_entity,oclstCustControlAC).   
                  catch anError as Progress.Lang.Error:
                     /* Start qflib.p - QAD Financials Library running persistently */
                     run mfairunh.p
                     (input 'qflib.p',
                      input '?',
                      output hQADFinancialsLib) no-error.
                     run processExceptions in hQADFinancialsLib (input anError).  
                     return.
                  end catch.
               end. /*DO ON ERROR UNDO, THROW */
            end. /* IF tApiDinvoiceDIJE.tcProjectCode = "" */
            
            /* Store the customer control a/c so it is displayed to the user */
            for each gltw_wkfl exclusive-lock
               where gltw_wkfl.gltw_domain = global_domain
                 and gltw_userid = mfguser
                 and gltw_acct = "":
              assign gltw_acct = oclstCustControlAC
                     gltw_cc   = ocLstCustControlCC
                     gltw_sub  = ocLstCustControlSubAC
                     gltw_project = if     tApiDinvoiceDIJE.tcProjectCode <> "" 
                                       and tApiDinvoiceDIJE.tcProjectCode <> ?
                                    then   tApiDinvoiceDIJE.tcProjectCode
                                    else if (valid-object(Project) and Project:Available)
                                    then Project:ProjectCode 
                                    else "".
            end.  /*  FOR EACH gltw_wkfl */
         end. /*ELSE DO */

      end.
      else do:
         for each tApiPostingDIJE:
            create tApiPosting.
            buffer-copy tApiPostingDIJE to tApiPosting.
         end.

         for each tApiPostingLineDIJE:
            create tApiPostingLine.
            buffer-copy tApiPostingLineDIJE to tApiPostingLine.
         end.

         for each tApiPostingSAFDIJE:
            create tApiPostingSAF.
            buffer-copy tApiPostingSAFDIJE to tApiPostingSAF.
         end.

         for each tApiPostingVATDIJE:
            create tApiPostingVat.
            buffer-copy tApiPostingVATDIJE to tApiPostingVAT.
         end.

         for each tApiPostingVATDelayDIJE:
            create tApiPostingVATDelay.
            buffer-copy tApiPostingVATDelayDIJE to tApiPostingVATDelay.
         end.

         /* Make the call */
         {proxy/bjournalentry/apistdmaintainttrun.i}

         /* Assign the invoice number to the context field */
         for each tFcMessages:
            assign tFcMessages.tcFcContext = invoiceNumber.
         end.
         assign returnStatus = oiReturnStatus.
         /* Error handling */
         if returnStatus < 0 then do:
            run emptyApiTempTables.
             return.
         end.

      end.

      for each glt_det
         where glt_det.glt_domain = global_domain
           and glt_det.glt_ref = invoiceNumber
           and glt_det.glt_entity = post_entity
      exclusive-lock:
           assign glt_det.glt_exp = true.
      end.
   end.

   if valid-object(Project) and Project:Available = yes then do:
      delete object Project no-error.
   end.

END PROCEDURE.

PROCEDURE createInterCoPostings :
/*------------------------------------------------------------------------------
  Purpose:    Creates the QAD Financials Posting API Temp-Tables from the
              passed in invoice number for Inter-Company transactions.
  Parameters:  <input> invoiceNumber
               <input> interCoInvoiceNbr
               <input> eff_date
               <input> post_entity
               <input> invoiceType

  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber     as character  no-undo.
   define input  parameter interCoInvoiceNbr as character  no-undo.
   define input  parameter eff_date          as date       no-undo.
   define input  parameter post_entity       as character  no-undo.
   define input  parameter invoiceType       as character  no-undo.
   define input  parameter table             for ttGiaTransactions.

   define variable iGIAYear           as integer         no-undo.
   define variable cGIAJournalCode    as character       no-undo.
   define variable iGIAVoucher        as integer         no-undo.
   define variable icBusinessRelCode  like ad_bus_relation no-undo.

   define buffer glt_det for glt_det.

   define variable totTax as decimal    no-undo.
   define variable taxAmt as decimal    no-undo.

   /* Check if there are inter-company postings to process. */   
   if not can-find(first glt_det where
      glt_det.glt_domain = global_domain and
      glt_det.glt_ref    = invoiceNumber and
      glt_det.glt_entity <> post_entity)
   then return.

   /* Get GL period and year */
   for first glc_cal
      where glc_cal.glc_domain = global_domain and
            glc_start <= eff_date and
            glc_end  >= eff_date
   no-lock:
   end.
   
   for each glt_det where
            glt_det.glt_domain = global_domain and
            glt_det.glt_ref    = invoiceNumber and
            glt_det.glt_entity <> post_entity no-lock
   break by glt_det.glt_entity:

      icBusinessRelCode = "".
      for first ih_hist 
         where ih_hist.ih_domain     = global_domain
           and ih_hist.ih_inv_nbr    = invoiceNumber
           and ih_hist.ih_cust       = glt_det.glt_addr
      no-lock:
         /* Retrieve the address master to get the Business Relation */
         for first ad_mstr 
            where ad_mstr.ad_domain = global_domain
              and ad_mstr.ad_addr   = ih_hist.ih_bill
         no-lock:
            icBusinessRelCode = ad_mstr.ad_bus_relation.
         end.
      end.


      if first-of(glt_det.glt_entity) then do:
         find first tTempApiPosting where
            tTempApiPosting.tc_Rowid = "PST" + glt_det.glt_ref  +
                                       glt_det.glt_entity no-error.

         /* Check to see if the invoice has been created already */
         if not available(tTempApiPosting)
         then do:

            create tTempApiPosting.
            run getInvoiceComponents
               (input interCoInvoiceNbr,
                output tTempApiPosting.PostingYear,
                output tTempApiPosting.tcJournalCode,
                output tTempApiPosting.PostingVoucher).

            assign
               tTempApiPosting.PostingDate                = glt_det.glt_effdate
               tTempApiPosting.PostingOriginIsExternal    = true
               tTempApiPosting.PostingIsSkipAutoAssignLC  = false
               tTempApiPosting.PostingIsZeroValueAllowed  = true
               tTempApiPosting.PostingOriginReference     = glt_det.glt_ref
               tTempApiPosting.PostingOriginEntity        = glt_det.glt_entity
               tTempApiPosting.PostingOriginDocument      = glt_det.glt_doc
               tTempApiPosting.PostingOriginDocumentType  = glt_det.glt_doc_type
               tTempApiPosting.PostingOriginTransType     = glt_det.glt_tr_type
               tTempApiPosting.PostingOriginDaybookCode   = glt_det.glt_dy_code
               tTempApiPosting.PostingOriginDaybookNumber = glt_det.glt_dy_num
               tTempApiPosting.PostingPeriod              = glc_cal.glc_per
               tTempApiPosting.PostingYearPeriod          =
                  integer(string(glc_cal.glc_year, "9999") +
                     string(glc_cal.glc_per, "99"))
               tTempApiPosting.LastModifiedDate           = today
               tTempApiPosting.LastModifiedTime           = time
               tTempApiPosting.LastModifiedUser           = global_userid
               tTempApiPosting.tc_Rowid                   = "PST" + glt_det.glt_ref + glt_det.glt_entity
               tTempApiPosting.tc_Status                  = {&TCSTATUS-NEW}.
       end.
    end.

    create tTempApiPostingLine.
    assign
      tTempApiPostingLine.tcGLCode                  = glt_det.glt_acct
      tTempApiPostingLine.tcDivisionCode            = glt_det.glt_sub
      tTempApiPostingLine.tcCostCentreCode          = glt_det.glt_cc
      tTempApiPostingLine.tcProjectCode             = glt_det.glt_project
      tTempApiPostingLine.PostingLineSequence       = glt_det.glt_line
      tTempApiPostingLine.PostingLineOriginLineNbr  = glt_det.glt_line
      tTempApiPostingLine.tcCurrencyCode            = glt_det.glt_curr
      tTempApiPostingLine.PostingLineText           = glt_det.glt_desc
      tTempApiPostingLine.PostingLineCrossExternref = glt_det.glt_interco_ref
      tTempApiPostingLine.LastModifiedDate          = today
      tTempApiPostingLine.LastModifiedTime          = time
      tTempApiPostingLine.LastModifiedUser          = global_userid
      tTempApiPostingLine.tc_RowId                  = string(glt_det.oid_glt_det)
      tTempApiPostingLine.tc_ParentRowid            = "PST" + glt_det.glt_ref + glt_det.glt_entity
      tTempApiPostingLine.CustomShort9              = icBusinessRelCode
      tTempApiPostingLine.tc_Status                 = {&TCSTATUS-NEW}.

   for first exr_rate 
      where exr_domain = global_domain
        and exr_curr1  = base_curr
        and exr_curr2  = glt_det.glt_curr
        and exr_ratetype = ''
        and exr_start_date <= glt_effdate
        and exr_end_date   >= glt_effdate
   no-lock:
   end. /* FOR FIRST exr_rate */

   if available exr_rate 
   then
      assign
         tTempApiPostingLine.PostingLineRateScale    = glt_det.glt_ex_rate2
         tTempApiPostingLine.PostingLineExchangeRate =  1 / glt_det.glt_ex_rate.
   else
      assign
         tTempApiPostingLine.PostingLineRateScale    = 1 / glt_det.glt_ex_rate
         tTempApiPostingLine.PostingLineExchangeRate = glt_det.glt_ex_rate2.

    /* Find the correct ttGIATransactions record so the inter-company */
    /* posting line can be linked to the correct GIA posting.         */
    /* The ttGiaTransaction records are created in sogiapst.p.        */
    for first ttGiaTransactions where       
                       cSalesAcct = glt_det.glt_acct and
                       cSalesSub  = glt_det.glt_sub  and
                       cSalesCC   = glt_det.glt_cc   and
                       cSalesProj = glt_det.glt_proj and
                       cEntity     <> post_entity    
    no-lock:
    end.    if available ttGiaTransactions
    then do:
        for each qad_wkfl where qad_domain = global_domain 
                            and qad_key1   = "GIA|" + trim(glt_det.glt_ref) + '|' + string(glt_det.glt_line)
                            and qad_key2   = cSoString
        no-lock:
                            
            run getInvoiceComponents(input cGIATransRef,
                         output iGIAYear,
                         output cGIAJournalCode,
                         output iGIAVoucher).
        
                assign tTempApiPostingLine.PostingLineGrossIncAccRef = string(iGIAYear) + '/' +
                                                                       trim(cGIAJournalCode) + '/' +
                                                                       string(iGIAVoucher,'999999999').
        end.
    end.
          
          
    /* POPULATE AMOUNT FIELDS */
    /* Set posting values based on invoice type */
    if invoiceType <> {&CRED_CORR} and
       invoiceType <> {&INV_CORR}
    then
       assign
          tTempApiPostingLine.PostingLineDebitTC  =
             if (glt_curr_amt >= 0) then glt_det.glt_curr_amt else 0
          tTempApiPostingLine.PostingLineCreditTC =
             if (glt_curr_amt < 0) then absolute(glt_det.glt_curr_amt) else 0
          tTempApiPostingLine.PostingLineDebitLC  =
             if (glt_amt >= 0) then glt_det.glt_amt else 0
          tTempApiPostingLine.PostingLineCreditLC =
             if (glt_amt < 0) then absolute(glt_det.glt_amt) else 0.
    else
       assign
          tTempApiPostingLine.PostingLineDebitTC  =
             if (glt_curr_amt < 0) then glt_det.glt_curr_amt else 0
          tTempApiPostingLine.PostingLineCreditTC =
             if (glt_curr_amt >= 0) then (glt_det.glt_curr_amt * -1) else 0
          tTempApiPostingLine.PostingLineDebitLC  =
             if (glt_amt < 0) then glt_det.glt_amt else 0
          tTempApiPostingLine.PostingLineCreditLC =
             if (glt_amt >= 0) then (glt_det.glt_amt * -1) else 0.

    for each tApiPostingSafDIJE
       where tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det):
       create tTempApiPostingSaf.
       buffer-copy tApiPostingSafDIJE to tTempApiPostingSaf.
    end.
   end.
END PROCEDURE.

PROCEDURE sendInterCoPostings :
/*------------------------------------------------------------------------------
  Purpose:    Calls the QAD Financials API to create the invoice and postings
  Parameters:  <input> invoiceNumber
               <input> interCoInvoiceNbr
               <input> post_entity
               <output> returnStatus as integer
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber     as character  no-undo.
   define input  parameter interCoInvoiceNbr as character  no-undo.
   define input  parameter post_entity       as character  no-undo.
   define output parameter table for tFcMessages.
   define output parameter returnStatus as integer  initial -98  no-undo.

   define buffer glt_det for glt_det.
   if not can-find(first tTempApiPosting) then return.

   empty temp-table tFcMessages.

   do on error undo, return:
      for each glt_det exclusive-lock
         where glt_det.glt_domain = global_domain
           and glt_det.glt_ref    = invoiceNumber
           and glt_det.glt_entity <> post_entity
      break by glt_det.glt_entity:

         if first-of(glt_det.glt_entity) then do:

            assign
               icAction           = {&PROXYACTION-SAVE}
               vcProxyCompanyCode = glt_det.glt_entity.

            for each tTempApiPosting
               where tTempApiPosting.PostingOriginReference = glt_det.glt_ref
                 and tTempApiPosting.PostingOriginEntity    = glt_det.glt_entity:

               create tApiPosting.
               buffer-copy tTempApiPosting to tApiPosting.

               for each tTempApiPostingLine
                  where tTempApiPostingLine.tc_ParentRowid = tTempApiPosting.tc_Rowid:

                  create tApiPostingLine.
                  buffer-copy tTempApiPostingLine to tApiPostingLine.

                  for each tTempApiPostingSAF
                     where tTempApiPostingSAF.tc_ParentRowid = tTempApiPostingLine.tc_Rowid:

                     create tApiPostingSAF.
                     buffer-copy tTempApiPostingSAF to tApiPostingSAF.
                  end.
               end.
            end.

            /* Make the call */
            {proxy/bjournalentry/apistdmaintainttrun.i}

            /* Assign the invoice number to the context field */
            for each tFcMessages:
               assign tFcMessages.tcFcContext = invoiceNumber.
            end.

            assign returnStatus = if (oiReturnStatus < 0 and returnStatus >= 0)
                                  then oiReturnStatus else returnStatus.

            if oiReturnStatus < 0
            then do:
               create tFcMessages.
               assign tFcMessages.tcFcContext = invoiceNumber.
               {us/bbi/pxmsg.i &MSGBUFFER=tFcMessages.tcFcMessage &MSGNUM=7647
                  &ERRORLEVEL=4
                  &MSGARG1=invoiceNumber}
            end.

            empty temp-table tApiPosting.
            empty temp-table tApiPostingLine.
            empty temp-table tApiPostingSaf.

         end.

      end.
   end.
   if oiReturnStatus >=0
   then do:
        /* No erros occured.                                  */
        /* Mark the glt_det records as being exported.        */
        /* This will ensure that the records will be deleted. */
       for each glt_det
          where glt_det.glt_domain =  global_domain
            and glt_det.glt_ref    =  invoiceNumber
            and glt_det.glt_entity <> post_entity
       exclusive-lock:
          assign glt_det.glt_exp = true.
       end.
   end.  
   else do:
        /* An error occured.                                                           */
        /* Mark the transactions as being unbalanced so that the user can correct them */
        /* This will be done using the unposted operational transaction correction     */
        /* program.                                                                    */
        for each ttGiaTransactions
        no-lock:
            for each glt_det
                    where glt_det.glt_domain =  global_domain
                      and glt_det.glt_ref    =  cGIATransRef
            exclusive-lock:
                    assign glt_det.glt_exp = FALSE
                           glt_det.glt_unb = TRUE.
            end.
        end.
    end.
   
   if oiReturnStatus = 0 and returnStatus = -98
   then    
       assign returnStatus = 0.
   else
   /* Need to set the error status to a warning so the transaction is not undone */
   if returnStatus < 0 then
      assign returnStatus = returnStatus * -1.

END PROCEDURE.

PROCEDURE sendGiaPostings :
/*------------------------------------------------------------------------------
  Purpose:    Calls the QAD Financials API to create the GIA postings
  Parameters:  <input> invoiceNumber
               <input> temp-table ttGiaTransactions.
               <output> returnStatus as integer
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber     as character  no-undo.
   define input  parameter table for ttGiaTransactions.
   define output parameter table for tFcMessages.
   define output parameter returnStatus as integer  initial -98  no-undo.

   define variable iCount as integer no-undo.
   define variable cGltDoc as character no-undo.
    
    define buffer glt_det for glt_det.
        /* Check if GIA transactions exist. */
        if not can-find(first tGiaApiPosting) then return.

   empty temp-table tFcMessages.

   assign iCount =  0.
    
   do on error undo, return:
      for each ttGiaTransactions no-lock
      break by cGIATransRef:
         if first-of(cGIATransRef)
         then do:
            for each glt_det exclusive-lock
               where glt_det.glt_domain = global_domain
                 and glt_det.glt_ref    = cGIATransRef
            break by glt_det.glt_entity:

               if first-of(glt_det.glt_entity) then do:

                  assign
                     icAction           = {&PROXYACTION-SAVE}
                     vcProxyCompanyCode = glt_det.glt_entity.
         
                  for each tGiaApiPosting
                     where tGiaApiPosting.PostingOriginReference = glt_det.glt_ref
                       and tGiaApiPosting.PostingOriginEntity    = glt_det.glt_entity:

                     create tApiPosting.
                     buffer-copy tGiaApiPosting to tApiPosting.
                     assign iCount = iCount + 1.

                     for each tGiaApiPostingLine
                        where tGiaApiPostingLine.tc_ParentRowid = tGIaApiPosting.tc_Rowid:

                        create tApiPostingLine.
                        buffer-copy tGiaApiPostingLine to tApiPostingLine.

                        for each tGiaApiPostingSAF
                           where tGiaApiPostingSAF.tc_ParentRowid = tGiaApiPostingLine.tc_Rowid:

                           create tApiPostingSAF.
                           buffer-copy tGiaApiPostingSAF to tApiPostingSAF.
                        end.
                     end.
                  end.
               end.
            end.
         end.
      end.
        
        empty temp-table tFcMessages.

        /* If there is only one journal entry to be posted, then use apistdmaintaintt.       */
        /* Otherwise use apistdmaintainmultitt to keep the number of API calls to a minimum. */
        if iCount = 1 then do:
            {proxy/bjournalentry/apistdmaintainttrun.i}
        end.
        else do:
            {proxy/bjournalentry/apistdmaintainmultittrun.i}
        end.
        
      /* Assign the invoice number to the context field */
      for each tFcMessages:
         assign tFcMessages.tcFcContext = cGIATransRef.
      end.

      assign returnStatus = if (oiReturnStatus < 0 and returnStatus >= 0)
                            then oiReturnStatus else returnStatus.

      if oiReturnStatus < 0
      then do:
         create tFcMessages.
         assign tFcMessages.tcFcContext = cGIATransRef.
         {us/bbi/pxmsg.i &MSGBUFFER=tFcMessages.tcFcMessage &MSGNUM=11244
             &ERRORLEVEL=4
             &MSGARG1=cGIATransRef}
      end.

      empty temp-table tApiPosting.
      empty temp-table tApiPostingLine.
      empty temp-table tApiPostingSaf.
        
   end.

    /* Check if any errors occured during the load into the financials. */
    if oiReturnStatus >=0
    then do:
        /* No erros occured.                                  */
        /* Mark the glt_det records as being exported.        */
        /* This will ensure that the records will be deleted. */
        for each ttGiaTransactions
        no-lock:
            for each glt_det
                    where glt_det.glt_domain =  global_domain
                      and glt_det.glt_ref    =  cGIATransRef
            exclusive-lock:
                    assign glt_det.glt_exp = true.
            end.
        end.
    end.
    else do:
        /* An error occured.                                                           */
        /* Mark the transactions as being unbalanced so that the user can correct them */
        /* This will be done using the unposted operational transaction correction     */
        /* program.                                                                    */
        for each ttGiaTransactions
        no-lock:
                    /* The GIA glt_det records are marked as unblanced in two parts. */
                    /* The first part handles the glt_dets posting to the sales COA  */
                    /* components. The sales order string (number and line) is added */
                    /* tot he glt_desc, separated by the '|' character. The          */
                    /* ttGiaTransaction records is updated with the glt_doc field.   */
                    /* The second part of the glt_det transaction is the posting to  */
                    /* tax expense COA components. Again the sales order string is   */
                    /* added to the glt_desc. The glt_doc field is then assigned the */
                    /* value of the cGltDoc field on the ttGiaTransaction record.    */
                    /* The purpose of updating the glt_desc field is to link the GIA */
                    /* transaction lines to the invoice transactions. This linking   */
                    /* will be done when the operational transaction post.           */
                    /* The purpose of updating the glt_doc fields is so that the     */
                    /* operational transaction post can determine which sales order  */
                    /* a GIA transaction refers to and then determine which SAF      */
                    /* should be used for the financial postings.                    */
                    
            for first glt_det
            where glt_det.glt_domain =  global_domain
              and glt_det.glt_ref    =  cGIATransRef
              and glt_det.glt_line   =  iSoGLLine
              and glt_det.glt_entity =  cEntity
            exclusive-lock:
            
                assign glt_det.glt_exp  = FALSE
                       glt_det.glt_unb  = TRUE
                       cGltDoc          = glt_det.glt_doc.
                
                for first qad_wkfl where qad_domain = global_domain
                                     and qad_key1   = "GIA|" + trim(glt_ref) + '|' + string(glt_line)
                                     and qad_key2   = trim(cSoString)
                no-lock:
                end.
                
                if not available qad_wkfl
                then do:
                    create qad_wkfl.
                    assign qad_domain = global_domain
                           qad_key1   = "GIA|" + trim(glt_ref) + '|' + string(glt_line)
                           qad_key2   = trim(cSoString).
                end.
            end.
            for first glt_det
                    where glt_det.glt_domain =  global_domain
                      and glt_det.glt_ref    =  cGIATransRef
                      and glt_det.glt_line   =  iExGLLine
                      and glt_det.glt_entity =  cEntity
            exclusive-lock:
            
                assign glt_det.glt_exp = FALSE
                       glt_det.glt_unb = TRUE
                       glt_det.glt_doc  = cGltDoc.
                       
                for first qad_wkfl where qad_domain = global_domain
                                     and qad_key1   = "GIA|" + trim(glt_ref) + '|' + string(glt_line)
                                     and qad_key2   = trim(cSoString)
                no-lock:
                end.
                
                if not available qad_wkfl
                then do:
                    create qad_wkfl.
                    assign qad_domain = global_domain
                           qad_key1   = "GIA|" + trim(glt_ref) + '|' + string(glt_line)
                           qad_key2   = trim(cSoString).
                end.
            end.        
        end.
    end.
    
  if oiReturnStatus = 0 and returnStatus = -98 
  then
     assign returnStatus = 0.
  else
  /* Need to set the error status to a warning so the transaction is not undone */
  if returnStatus < 0 then
     assign returnStatus = returnStatus * -1.

      
END PROCEDURE.

PROCEDURE emptyApiTempTables :
/*------------------------------------------------------------------------------
  Purpose:   Empties the API Temp-tables at the start of a new Invoice
  Parameters:  <none>
  Notes:
------------------------------------------------------------------------------*/
      empty temp-table tApiPostingDIJE.
      empty temp-table tApiPostingLineDIJE.
      empty temp-table tApiPostingSafDIJE.
      empty temp-table tApiPostingVatDIJE.
      empty temp-table tApiPostingVatDelayDIJE.
      empty temp-table tApiDinvoiceDIJE.
      empty temp-table tApiDinvoiceMovementDIJE.
      empty temp-table tApiDinvoicePostingDIJE.
      empty temp-table tApiDInvoiceStageDIJE.
      empty temp-table tApiDinvoiceVatDIJE.
      empty temp-table tApiDinvoiceBankDIJE.
      empty temp-table tApiDInvoiceOpInfoDIJE.
      empty temp-table tApiPosting.
      empty temp-table tApiPostingLine.
      empty temp-table tApiPostingSaf.
      empty temp-table tApiPostingVat.
      empty temp-table tApiPostingVatDelay.
      empty temp-table tTempApiPosting.
      empty temp-table tTempApiPostingLine.
      empty temp-table tTempApiPostingSaf.
      empty temp-table tTempApiPostingVat.
      empty temp-table tTempApiPostingVatDelay.
      empty temp-table tApiDDocument.
      empty temp-table tApiDDocumentInvoiceXref.
      empty temp-table tGiaApiPosting.
      empty temp-table tGiaApiPostingLine.
      empty temp-table tGiaApiPostingSaf.
END PROCEDURE.


PROCEDURE createShipperRef :
/*------------------------------------------------------------------------------
  Purpose:     Creates shipper references for the invoice
  Parameters:  <input>
            invoiceNumber
            abs_recid - recid of the shipper reference record
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber as character  no-undo.
   define input parameter abs_recid      as recid      no-undo.
   define variable l_par_absid           as character  no-undo.
   define variable l_par_shipfrom        as character  no-undo.

   for first abs_mstr where recid(abs_mstr) = abs_recid no-lock:

      run get_abs_parent (input abs_mstr.abs_id,
                          input abs_mstr.abs_shipfrom,
                          output l_par_absid,
                          output l_par_shipfrom).

      /*Store the shipper id if it has not already been stored */
      if not can-find(first tApiDInvoiceOpInfoDIJE
         where tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber
           and tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-SHIPPER}
           and tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode = substring(l_par_absid,2))
      then do:
         create tApiDInvoiceOpInfoDIJE.
         assign tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-SHIPPER}
                tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode = substring(l_par_absid,2)
                tApiDInvoiceOpInfoDIJE.tc_Rowid = string(abs_mstr.oid_abs_mstr)
                tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber
                tApiDInvoiceOpInfoDIJE.tc_status = {&TCSTATUS-NEW}.
      end.

      for each lgd_mstr 
         where lgd_domain     =  global_domain
         and   lgd_shipper_id =  l_par_absid
         and   lgd_nbr        <> ""
         and   lgd_ar_amt     <> 0
      no-lock:
         /*Store the legal document number if it has not already been stored */
         if not can-find(first tApiDInvoiceOpInfoDIJE
            where tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber
              and tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-LEGALDOC}
              and tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode = lgd_mstr.lgd_nbr)
         then do:
            create tApiDInvoiceOpInfoDIJE.
            assign tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-LEGALDOC}
                   tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode = lgd_mstr.lgd_nbr
                   tApiDInvoiceOpInfoDIJE.tc_Rowid = string(lgd_mstr.oid_lgd_mstr)
                   tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber
                   tApiDInvoiceOpInfoDIJE.tc_status = {&TCSTATUS-NEW}.
         end.
      end.
   end.
END PROCEDURE.

PROCEDURE createGoldenTaxRef :
/*------------------------------------------------------------------------------
  Purpose:     Creates golden tax references for the invoice
  Parameters:  <input>
            invoiceNumber
            saleNbr -- sale order number
            tt_gt_hist
  Notes:
------------------------------------------------------------------------------*/
   define input parameter invoiceNumber as character  no-undo.
   define input parameter saleNbr as character  no-undo.
   define input parameter table for tt_gt_hist.
   for each tt_gt_hist where tt_gt_hist.tt_gt_hist_sod_nbr = saleNbr no-lock:
      if not can-find(first tApiDInvoiceOpInfoDIJE
         where tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber
           and tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-GT}
           and tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode = tt_gt_hist.tt_gt_hist_docnbr)
      then do:
         create tApiDInvoiceOpInfoDIJE.
         assign tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-GT}
                 tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode = tt_gt_hist.tt_gt_hist_docnbr
                 tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoGTDocNbr = tt_gt_hist.tt_gt_hist_docnbr
                 tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoGTUpdateType = {&GOLDENTAX-UPDATE-TYPE-AUT}
                 tApiDInvoiceOpInfoDIJE.tc_Rowid = string(recid(tt_gt_hist))
                 tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber
                 tApiDInvoiceOpInfoDIJE.tc_status = {&TCSTATUS-NEW}.
      end.
   end.

END PROCEDURE.


PROCEDURE createSalesOrderRef :
/*------------------------------------------------------------------------------
  Purpose:     Creates sales order references for the invoice
  Parameters:  <input>
            invoiceNumber
            so_recid - recid of the sales order record
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber as character  no-undo.
   define input parameter so_recid     as   recid        no-undo.

   assign l_inv_nbr = invoiceNumber.

   for first so_mstr where recid(so_mstr) = so_recid no-lock:
      /*Store the sales order number if it has not already been stored */
      if not can-find(first tApiDInvoiceOpInfoDIJE
         where tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber
         and tApiDInvoiceOpInfoDIJE.tc_Rowid = string(so_mstr.oid_so_mstr))
      then do:
         create tApiDInvoiceOpInfoDIJE.
         assign tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-SO}
                tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode = so_mstr.so_nbr
                tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoDescription = so_mstr.so_site
                tApiDInvoiceOpInfoDIJE.tc_Rowid = string(so_mstr.oid_so_mstr)
                tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber
                tApiDInvoiceOpInfoDIJE.tc_status = {&TCSTATUS-NEW}.

      end.
   end.

END PROCEDURE.

PROCEDURE getSalesOrderRefs :
/*------------------------------------------------------------------------------
  Purpose:     gets the list of Sales Orders for this invoice
  Parameters:  <input> invoiceNumber
               <output> salesOrderNumbers temptable
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter invoiceNumber as character  no-undo.
   define output parameter table for salesOrderNumbers.   

   assign l_inv_nbr = invoiceNumber.
   empty temp-table salesOrderNumbers.
   for each tApiDInvoiceOpInfoDIJE where 
        tApiDInvoiceOpInfoDIJE.tc_ParentRowid = invoiceNumber and
         DInvoiceOpInfoType = {&DINVOICEOPINFOTYPE-SO} no-lock:  
             create salesOrderNumbers.
             assign 
                salesOrderNumbers.soNum = tApiDInvoiceOpInfoDIJE.DInvoiceOpInfoCode
                salesOrderNumbers.invNum = invoiceNumber.
   end.

END PROCEDURE.

PROCEDURE CheckInvoiced:
        define input  parameter sonbr      as character no-undo.
        define input  parameter soline     as integer   no-undo.
        define output parameter undo_all   as logical   no-undo.

        /* CHECK IF THE SALES ORDER LINE IS INVOICED*/
        for first idh_hist
          where idh_domain  = global_domain
            and idh_nbr     = sonbr
            and idh_inv_nbr = l_inv_nbr
            and idh_line    = soline
        no-lock:
        end. /* FOR EACH idh_hist */
        if available idh_hist
        then undo_all = yes.
END PROCEDURE. /* CheckInvoiced */


PROCEDURE createCustomerDocument :
/*------------------------------------------------------------------------------
  Purpose:     Creates customer document record and send them to Financials
  Parameters:  <input>
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter documentReference as character  no-undo.
   define input  parameter invoiceReference as character  no-undo.
   define input  parameter post_entity as character  no-undo.
   define output parameter table for tFcMessages.
   define output parameter returnStatus as integer  initial -98  no-undo.

   empty temp-table tFcMessages.

   find first ccc_ctrl where ccc_ctrl.ccc_domain = global_domain no-lock no-error.
   if available ccc_ctrl then do:
      do on error undo, return:
          for each tApiDInvoiceDIJE:
            create tApiDDocument.
            assign
               tApiDDocument.DDocumentType            = {&DOCUMENTTYPEDEBTOR-CREDITCARD}
               tApiDDocument.ttPostingDate            = today
               tApiDDocument.DDocumentSubType         = {&DOCUMENTSUBTYPEDEBTOR-AUTO}
               tApiDDocument.DDocumentYear            = tApiDInvoiceDIJE.DInvoicePostingYear
               tApiDDocument.tcDebtorCode             = tApiDInvoiceDIJE.tcDebtorCode
               tApiDDocument.DDocumentReference       = documentReference
               tApiDDocument.DDocumentOriginalDebitTC = tApiDInvoiceDIJE.DInvoiceOriginalDebitTC
               tApiDDocument.tcCurrencyCode           = TApiDInvoiceDIJE.tcCurrencyCode
               tApiDDocument.DDocumentStatus          = {&DOCUMENTSTATUS-INCASSO}
               tApiDDocument.DDocumentCreationDate    = today
               tApiDDocument.DDocumentCreationTime    = time
               tApiDDocument.tc_Rowid                 = documentReference
               tApiDDocument.tc_Status                = {&TCSTATUS-NEW}
               tApiDDocument.DDocumentDueDate         = today.

            create tApiDDocumentInvoiceXref.
            assign
               tApiDDocumentInvoiceXref.DInvoice_ID                = tApiDInvoiceDIJE.DInvoice_ID
               tApiDDocumentInvoiceXref.DDocumentInvoiceXrefAlloTC = tApiDInvoiceDIJE.DInvoiceOriginalDebitTC
               tApiDDocumentInvoiceXref.DDocumentInvoiceXrefDiscTC = 0
               tApiDDocumentInvoiceXref.tcDInvoiceReference =
                  string(tApiDInvoiceDIJE.DInvoicePostingYear) + "/" +
                  tApiDInvoiceDIJE.tcJournalCode + "/" +
                  string(tApiDInvoiceDIJE.DInvoiceVoucher, "999999999") + "/CSS"
               tApiDDocumentInvoiceXref.tcCurrencyCode      = tApiDInvoiceDIJE.tcCurrencyCode
               tApiDDocumentInvoiceXref.tc_Rowid            = "DOCXREF-" + invoiceReference
               tApiDDocumentInvoiceXref.tc_ParentRowid      = documentReference
               tApiDDocumentInvoiceXref.tc_Status           = {&TCSTATUS-NEW}.

            assign
               icAction = {&PROXYACTION-SAVE}
               vcProxyCompanyCode = post_entity.

            /* Make the call */
            {proxy/bddocument/apistdmaintainttrun.i}

            /* Assign the invoice number to the context field */
            for each tFcMessages:
               assign tFcMessages.tcFcContext = documentReference.
            end.

            assign returnStatus = oiReturnStatus.

            /* Error handling */
            if oiReturnStatus < 0 then do:
               create tFcMessages.
               assign tFcMessages.tcFcContext = documentReference.
               {us/bbi/pxmsg.i &MSGBUFFER=tFcMessages.tcFcMessage &MSGNUM=7645 &ERRORLEVEL=4}
               return.
            end.

         end.
      end.
   end.
   else do:
      create tFcMessages.
      assign tFcMessages.tcFcContext = documentReference.
      {us/bbi/pxmsg.i &MSGBUFFER=tFcMessages.tcFcMessage &MSGNUM=7646 &ERRORLEVEL=4 &MSGARG1=global_domain}
      create tFcMessages.
      assign tFcMessages.tcFcContext = documentReference.
      {us/bbi/pxmsg.i &MSGBUFFER=tFcMessages.tcFcMessage &MSGNUM=7645 &ERRORLEVEL=4}
      return.
   end.

   assign returnStatus = 0.


END PROCEDURE.


PROCEDURE GetActiveSystemSafConcepts :
/*------------------------------------------------------------------------------
  Purpose:     Runs an API query to retrieve the active system saf concepts
  Parameters:  <none>
  Notes:
------------------------------------------------------------------------------*/
   define output parameter lHasSafConcepts as logical    no-undo.
   define output parameter returnStatus as integer  initial -98  no-undo.

   /* Run the data object class to retrieve the active system saf concepts */
   /* Parameters: SafConceptId */
   do on error undo, throw:     
      ActiveSystemSafConcept = new GetActiveSystemSafConceptById(?).   
      catch anError as Progress.Lang.Error:        
         /* Start qflib.p - QAD Financials Library running persistently */
         run mfairunh.p
            (input 'qflib.p',
             input '?',
             output hQADFinancialsLib) no-error.
         run processExceptions in hQADFinancialsLib (input anError).  
         return.
      
      end catch. 
   end. 

   /* If there are no concepts then we don't have to worry about SAFs */
   if not ActiveSystemSafConcept:Available then
      lHasSafConcepts = no.
   else
      lHasSafConcepts = yes.

   if returnStatus = -98 then
      returnStatus = 0.


END PROCEDURE.


PROCEDURE GetSafConceptsForPosting :
/*------------------------------------------------------------------------------
  Purpose:     Runs an API query to retrieve the saf concepts for this posting
  Parameters:  <none>
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter glCode like glt_acct no-undo.
   define input  parameter costCenterCode like glt_cc no-undo.
   define input  parameter projectCode like glt_project no-undo.
   define output parameter lHasSafConcepts as logical    no-undo.
   define output parameter returnStatus as integer  initial -98  no-undo.

   /* If we already have a copy of these structures then there's no need
      to call the API */
   for first tTempApiSafConceptsForPosting where
      tTempApiSafConceptsForPosting.GLCode = glCode and
      tTempApiSafConceptsForPosting.CostCenterCode = costCenterCode and
      tTempApiSafConceptsForPosting.ProjectCode = projectCode
   no-lock:
      assign returnStatus    = 0
             lHasSafConcepts = tTempApiSafConceptsForPosting.t_HasSafConcepts.
      return.
   end.   /*for first tTempApiSafConceptsForPosting*/

   do on error undo, return:
      assign icGLCode = glCode
         icCostCenterCode = costCenterCode
         icProjectCode = projectCode.
      {proxy/bposting/apigetsafconceptsforpostingrun.i}

      assign returnStatus = oiReturnStatus.

      if returnStatus < 0 then do:
         /* Start qflib.p - QAD Financials Library running persistently */
         run mfairunh.p
            (input 'qflib.p',
             input '?',
             output hQADFinancialsLib) no-error.

         run processErrors in hQADFinancialsLib (input table tFcMessages,
                                                 input 3).
         lHasSafConcepts = no.
         return.
      end.
      else do:
         for each tApiSafConceptsForPosting
            break by tApiSafConceptsForPosting.tcSafConceptCode:

            if first-of(tApiSafConceptsForPosting.tcSafConceptCode)
            then do:
                create tTempApiSafConceptsForPosting.
                buffer-copy tApiSafConceptsForPosting to tTempApiSafConceptsForPosting.
                assign tTempApiSafConceptsForPosting.GLCode       = glCode
                   tTempApiSafConceptsForPosting.CostCenterCode   = costCenterCode
                   tTempApiSafConceptsForPosting.ProjectCode      = projectCode
                   tTempApiSafConceptsForPosting.t_HasSafConcepts = yes.
            end. /* end of first tApiSafConceptsForPosting.tcSafConceptCode */
         end.   /*for each tApiSafConceptsForPosting*/
      end.   /*else do:*/
   end.   /*do on error undo, return*/

   /* If there are no concepts then create temp-tables with t_HasSafConcepts = no */
   if not can-find(first tTempApiSafConceptsForPosting
                   where tTempApiSafConceptsForPosting.GLCode         = glCode
                     and tTempApiSafConceptsForPosting.CostCenterCode = costCenterCode
                     and tTempApiSafConceptsForPosting.ProjectCode    = projectCode)
   then do:
      create tTempApiSafConceptsForPosting.
      assign tTempApiSafConceptsForPosting.GLCode       = glCode
         tTempApiSafConceptsForPosting.CostCenterCode   = costCenterCode
         tTempApiSafConceptsForPosting.ProjectCode      = projectCode
         tTempApiSafConceptsForPosting.t_HasSafConcepts = no
         lHasSafConcepts = no.
   end.   /*if not can-find */
   else
      assign lHasSafConcepts = yes.

   if returnStatus = -98 then
      assign returnStatus = 0.

END PROCEDURE.

PROCEDURE EmptySafTempTables :
/*------------------------------------------------------------------------------
  Purpose:     Clears out the SAF temp-tables - called at the start of each
            invoice run.
  Parameters:  <none>
  Notes:
------------------------------------------------------------------------------*/
   empty temp-table tApiSafConceptsForPosting.
   empty temp-table tTempApiSafConceptsForPosting.

END PROCEDURE.

PROCEDURE GetSalesOrderString:
/*------------------------------------------------------------------------------
  Purpose:    Obtains a sales order number and line string that will be used
            to mark the glt_det records. This will enable the GIA transactions
            to be matched with the invocie transactions to ensure that the
            GIA-Invoice linking functionality in the financials works.
            
  Parameters:  <input>
            sodrecno - recid of the current sod_det record
            sorecno - recid of the current so_mstr record
            <output>            
            salesOrderString
  Notes:
------------------------------------------------------------------------------*/            
            
   define input parameter sodrecno as recid no-undo.
   define input parameter sorecno as recid no-undo.
   define output parameter salesOrderString as char no-undo.


   if sodrecno > 0
   then do:
      find first sod_det where recid(sod_det) = sodrecno no-lock no-error.
      if available sod_det then assign salesOrderString = trim(sod_nbr + '.' + string(sod_line)).
   end.
   else if sorecno > 0 then do:
      for first so_mstr where recid(so_mstr) = sorecno no-lock:
      end.
      if available so_mstr then assign salesOrderString = trim(so_nbr + '.99999999').   end.

END PROCEDURE.

PROCEDURE CheckExistingGLTrans :
/*------------------------------------------------------------------------------
  Purpose:     Checks to see if a new glt_det record should be created.
               This procedure runs through the SAF codes created for a previous
               glt_det record and checks the values against the current sod_det
               record. If any of the values differ then a new record should be
               created, otherwise the current glt_det record should be updated.
  Parameters:  <input>
            gltoid - identifier for the saf concepts
            sodrecno - recid of the current sod_det record
            sorecno - recid of the current so_mstr record
            <output>
            lMatchesExisting - logical which defines whether the current
                             glt_det record matches the sod_det values
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter gltoid like oid_glt_det no-undo.
   define input  parameter sodrecno as recid  no-undo.
   define input  parameter sorecno as recid  no-undo.
   define output parameter lMatchesExisting as logical initial yes no-undo.

   define variable custtype as character  no-undo.
   define variable itemgrp as character  no-undo.
   define variable itemtype as character  no-undo.
   define variable prodline as character  no-undo.
   define variable custregion as character  no-undo.
   define variable site as character  no-undo.

   /* Find the required records and values */
   if sodrecno > 0 then do:

      for first sod_det where recid(sod_det) = sodrecno no-lock: end.

      /* For Contracts: sod_for is the item serviced and sod_part is */
      /* Service Type                                                */
      if sod_fsm_type begins "SC" then do:

         for first pt_mstr where pt_domain = sod_domain
                             and pt_part   = sod_for no-lock:
             assign
                itemgrp   = pt_mstr.pt_group
                itemtype  = pt_mstr.pt_part_type.
         end.

         /* For contracts, prodline should come from SO Line */
         assign
            prodline  = sod_prodline.

      end. /* sod_fsm_type begins "SC" */
      else do:

         for first pt_mstr where pt_domain = sod_domain
                             and pt_part = sod_part
         no-lock:
            assign
               itemgrp = pt_mstr.pt_group
               itemtype = pt_mstr.pt_part_type.
         end.

         if sod_fsm_type = "FSM-RO" then
            prodline = sod_prodline.
         else
            prodline  = if available pt_mstr
                        then
                           pt_mstr.pt_prod_line
                        else
                           "".

      end. /* else do */

      assign site = sod_det.sod_site.

   end.

   if sorecno > 0 then do:
      for first so_mstr where recid(so_mstr) = sorecno no-lock: end.
      for first cm_mstr
         where cm_domain = so_domain
         and   cm_addr   = so_cust
      no-lock:
         assign
             custregion = cm_mstr.cm_region
             custtype   = cm_mstr.cm_type.
      end.
      assign site = if site <> "" then site else so_mstr.so_site.

   end.

   for each  tApiPostingSafDIJE where tApiPostingSafDIJE.tc_ParentRowid = string(gltoid):
      case  tApiPostingSafDIJE.tcSafConceptCode:
         when {&SAFCONCEPT-CUSTTYPE} then
            if tApiPostingSafDIJE.tcSafCode <> custtype then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-ITEMGRP} then
            if tApiPostingSafDIJE.tcSafCode <> itemgrp then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-ITEMTYPE} then
            if tApiPostingSafDIJE.tcSafCode <> itemtype then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-PRODLINE} then
            if tApiPostingSafDIJE.tcSafCode <> prodline then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-REGION} then
            if tApiPostingSafDIJE.tcSafCode <> custregion then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-SITE} then
            if tApiPostingSafDIJE.tcSafCode <> site then
               assign lMatchesExisting = no.
      end case.

      /* If one doesn't match then there's no need to go any further */
      if lMatchesExisting = no then leave.
   end.


END PROCEDURE.

PROCEDURE createSafCodes :
/*------------------------------------------------------------------------------
  Purpose:  Creates a new set of saf codes for the current glt_det record and
            sod_det record.
  Parameters:  <input>
            gltoid - identifier for the saf concepts
            sodrecno - recid of the current sod_det record
            sorecno - recid of the current so_mstr record
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter gltrecno  as recid  no-undo.
   define input  parameter sodrecno as recid  no-undo.
   define input  parameter sorecno as recid  no-undo.

   define variable custtype   as character  no-undo.
   define variable itemgrp    as character  no-undo.
   define variable itemtype   as character  no-undo.
   define variable prodline   as character  no-undo.
   define variable custregion as character  no-undo.
   define variable site       as character  no-undo.

   /* Find the required records and values */
   if sodrecno > 0 then do:

      for first sod_det where recid(sod_det) = sodrecno no-lock: end.
      if available sod_det then do:   

         if sod_fsm_type begins "SC" then
         do:
            for first pt_mstr where pt_domain = sod_domain
                                and pt_part   = sod_for no-lock:
                assign
                   itemgrp  = pt_mstr.pt_group
                   itemtype = pt_mstr.pt_part_type.
            end.
            assign prodline = sod_prodline.

         end. /* sod_fsm_type begins "SC" */
         else do:
            for first pt_mstr where pt_domain = sod_domain
                                and pt_part = sod_part
            no-lock:
               assign
                  itemgrp = pt_mstr.pt_group
                  itemtype = pt_mstr.pt_part_type.

               if sod_fsm_type = "FSM-RO" then
                  prodline = sod_prodline.
               else
                  prodline  = pt_mstr.pt_prod_line.
            end. 

         end. /* else do */

         assign site = sod_det.sod_site.

      end. /* if available sod_det */

   end.

   if sorecno > 0 then do:
      for first so_mstr where recid(so_mstr) = sorecno no-lock: end.
      for first cm_mstr
         where cm_domain = so_domain
         and   cm_addr   = so_cust
      no-lock:
         assign
             custregion = cm_mstr.cm_region
             custtype   = cm_mstr.cm_type.
      end.
      assign site = if site <> "" then site else so_mstr.so_site.
   end.

   for first glt_det where recid(glt_det) = gltrecno no-lock: end.

   /* Create a PostingSaf record for each concept for the posting */
   for each tTempApiSafConceptsForPosting
      where tTempApiSafConceptsForPosting.GLCode = glt_det.glt_acct
        and tTempApiSafConceptsForPosting.CostCenterCode = glt_det.glt_cc
        and tTempApiSafConceptsForPosting.projectCode = glt_det.glt_project
        and tTempApiSafConceptsForPosting.t_HasSafConcepts:

      ActiveSystemSafConcept:First.
      do while ActiveSystemSafConcept:Available:
         if ActiveSystemSafConcept:SafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
         then leave.
         else
            ActiveSystemSafConcept = cast(ActiveSystemSafConcept:Next,GetActiveSystemSafConceptById). 
      end.
      if not ActiveSystemSafConcept:Available then next.

      case  tTempApiSafConceptsForPosting.tcSafConceptCode:
         when {&SAFCONCEPT-CUSTTYPE} then do:
            if not can-find(tApiPostingSafDIJE where 
           tApiPostingSafDIJE.tc_Rowid = "CT" + string(glt_det.oid_glt_det))
        then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "CT" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if custtype <> "" then custtype else ?.
            end.
         end.
         when {&SAFCONCEPT-ITEMGRP} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "IG" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "IG" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if itemgrp <> "" then itemgrp else ?.
            end.
         end.
         when {&SAFCONCEPT-ITEMTYPE} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "IT" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "IT" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if itemtype <> "" then itemtype else ?.
            end.
         end.
         when {&SAFCONCEPT-PRODLINE} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "PL" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "PL" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if prodline <> "" then prodline else ?.
            end.
         end.
         when {&SAFCONCEPT-REGION} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "R" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "R" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if custregion <> "" then custregion else ?.
            end.
         end.
         when {&SAFCONCEPT-SITE} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "S" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "S" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if site <> "" then site else ?.
            end.
         end.
         otherwise do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid  = tTempApiSafConceptsForPosting.tcSafConceptCode + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = tTempApiSafConceptsForPosting.tcSafConceptCode + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = ?.
            end.
         end.
      end case.

   end.

END PROCEDURE.

PROCEDURE CheckExistingGLTransForContract:
/*------------------------------------------------------------------------------
  Purpose:     Checks to see if a new glt_det record should be created.
               This procedure runs through the SAF codes created for a previous
               glt_det record and checks the values against the current sad_det
               record. If any of the values differ then a new record should be
               created, otherwise the current glt_det record should be updated.
  Parameters:  <input>
            gltoid - identifier for the saf concepts
            sadrecno - recid of the current sad_det record
            sarecno - recid of the current sa_mstr record
            <output>
            lMatchesExisting - logical which defines whether the current
                             glt_det record matches the sad_det values
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter gltoid like oid_glt_det no-undo.
   define input  parameter sadrecno as recid  no-undo.
   define input  parameter sarecno as recid  no-undo.
   define output parameter lMatchesExisting as logical initial yes no-undo.

   define variable custtype as character  no-undo.
   define variable itemgrp as character  no-undo.
   define variable itemtype as character  no-undo.
   define variable prodline as character  no-undo.
   define variable custregion as character  no-undo.
   define variable site as character  no-undo.

   /* Find the required records and values */
   if sadrecno > 0 then do:
      for first sad_det where recid(sad_det) = sadrecno no-lock: end.

      /* For Contracts: sad_for is the item serviced  */
      for first pt_mstr where pt_domain = sad_domain
                          and pt_part   = sad_for no-lock:

          assign 
             itemgrp   = pt_mstr.pt_group
             itemtype  = pt_mstr.pt_part_type.
      end.

      /* For contracts, product line should come from Contract Line */
      assign prodline  = sad_prodline.

   end.

   if sarecno > 0 then do:
      for first sa_mstr where recid(sa_mstr) = sarecno no-lock: end.
      if available sa_mstr then do:
         for first cm_mstr where cm_domain = sa_domain
                             and cm_addr   = sa_cust no-lock:
            assign
               custregion = cm_mstr.cm_region
               custtype   = cm_mstr.cm_type.
         end.
         assign site = sa_mstr.sa_site.
      end.
   end.

   for each  tApiPostingSafDIJE where tApiPostingSafDIJE.tc_ParentRowid = string(gltoid):
      case  tApiPostingSafDIJE.tcSafConceptCode:
         when {&SAFCONCEPT-CUSTTYPE} then
            if tApiPostingSafDIJE.tcSafCode <> custtype then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-ITEMGRP} then
            if tApiPostingSafDIJE.tcSafCode <> itemgrp then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-ITEMTYPE} then
            if tApiPostingSafDIJE.tcSafCode <> itemtype then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-PRODLINE} then
            if tApiPostingSafDIJE.tcSafCode <> prodline then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-REGION} then
            if tApiPostingSafDIJE.tcSafCode <> custregion then
               assign lMatchesExisting = no.
         when {&SAFCONCEPT-SITE} then
            if tApiPostingSafDIJE.tcSafCode <> site then
               assign lMatchesExisting = no.
      end case.

      /* If one doesn't match then there's no need to go any further */
      if lMatchesExisting = no then leave.
   end.

END PROCEDURE.


PROCEDURE createSafCodesForContract:
/*------------------------------------------------------------------------------
  Purpose:  Creates a new set of saf codes for the current glt_det record and
            sad_det record.
  Parameters:  <input>
            gltoid - identifier for the saf concepts
            sadrecno - recid of the current sad_det record
            sarecno - recid of the current sa_mstr record
  Notes:
------------------------------------------------------------------------------*/
   define input  parameter gltrecno  as recid  no-undo.
   define input  parameter sadrecno as recid  no-undo.
   define input  parameter sarecno as recid  no-undo.

   define variable custtype   as character  no-undo.
   define variable itemgrp    as character  no-undo.
   define variable itemtype   as character  no-undo.
   define variable prodline   as character  no-undo.
   define variable custregion as character  no-undo.
   define variable site       as character  no-undo.

   /* Find the required records and values */
   if sadrecno > 0 then do:
      for first sad_det where recid(sad_det) = sadrecno no-lock: end.
      if available sad_det then do:
         for first pt_mstr where pt_domain = sad_domain
                             and pt_part   = sad_for no-lock:
             assign
                itemgrp  = pt_mstr.pt_group
                itemtype = pt_mstr.pt_part_type.
         end.
         assign prodline = sad_prodline.
      end. /* if available sad_det */
   end.

   if sarecno > 0 then do:
      for first sa_mstr where recid(sa_mstr) = sarecno no-lock: end.
      if available sa_mstr then do:
         for first cm_mstr
            where cm_domain = sa_domain
            and   cm_addr   = sa_cust no-lock:

            assign
                custregion = cm_mstr.cm_region
                custtype   = cm_mstr.cm_type.
         end.
         assign site = sa_mstr.sa_site.
      end. /* if available sa_mstr */ 
   end.

   for first glt_det where recid(glt_det) = gltrecno no-lock: end.

   /* Create a PostingSaf record for each concept for the posting */
   for each tTempApiSafConceptsForPosting
      where tTempApiSafConceptsForPosting.GLCode = glt_det.glt_acct
        and tTempApiSafConceptsForPosting.CostCenterCode = glt_det.glt_cc
        and tTempApiSafConceptsForPosting.projectCode = glt_det.glt_project
        and tTempApiSafConceptsForPosting.t_HasSafConcepts:

      ActiveSystemSafConcept:First.
      do while ActiveSystemSafConcept:Available:
         if ActiveSystemSafConcept:SafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
         then leave.
         else
            ActiveSystemSafConcept = cast(ActiveSystemSafConcept:Next,GetActiveSystemSafConceptById). 
      end.
      if not ActiveSystemSafConcept:Available then next.

      case  tTempApiSafConceptsForPosting.tcSafConceptCode:
         when {&SAFCONCEPT-CUSTTYPE} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "CT" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "CT" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if custtype <> "" then custtype else ?.
            end.
         end.
         when {&SAFCONCEPT-ITEMGRP} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "IG" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "IG" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if itemgrp <> "" then itemgrp else ?.
            end.
         end.
         when {&SAFCONCEPT-ITEMTYPE} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "IT" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "IT" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if itemtype <> "" then itemtype else ?.
            end.
         end.
         when {&SAFCONCEPT-PRODLINE} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "PL" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "PL" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if prodline <> "" then prodline else ?.
            end.
         end.
         when {&SAFCONCEPT-REGION} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "R" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "R" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if custregion <> "" then custregion else ?.
            end.
         end.
         when {&SAFCONCEPT-SITE} then do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid = "S" + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = "S" + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = if site <> "" then site else ?.
            end.
         end.
         otherwise do:
            if not can-find(tApiPostingSafDIJE where 
               tApiPostingSafDIJE.tc_Rowid  = tTempApiSafConceptsForPosting.tcSafConceptCode + string(glt_det.oid_glt_det))
            then do:
               create  tApiPostingSafDIJE.
               assign
                  tApiPostingSafDIJE.tc_ParentRowid = string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tc_Rowid = tTempApiSafConceptsForPosting.tcSafConceptCode + string(glt_det.oid_glt_det)
                  tApiPostingSafDIJE.tcSafConceptCode = tTempApiSafConceptsForPosting.tcSafConceptCode
                  tApiPostingSafDIJE.tcSafCode = ?.
            end.
         end.
      end case.

   end.
END PROCEDURE.

PROCEDURE checkCCTransactionStatus:
/*------------------------------------------------------------------------------
  Purpose:     Check the transaction status in socc_mstr, with defined domain and
               current SO number.

  Parameters:  <output>
               pcTransStatus - Transaction returned.

------------------------------------------------------------------------------*/
   define input parameter pcSalesOrderNumber as character no-undo initial "".
   define output parameter pcTransStatus as character no-undo initial "".

   for each cctr_hist no-lock
      where cctr_domain = global_domain
        and cctr_nbr    = pcSalesOrderNumber
   by cctr_trnbr descending:
      pcTransStatus = cctr_status.
      leave.
   end.

END PROCEDURE. /* checkCCTransactionStatus */

PROCEDURE getCurrentInvoiceDetails:
/*------------------------------------------------------------------------------
  Purpose: Returns the invoice type for the invoice currently being processed.

  Parameters:  <output>


------------------------------------------------------------------------------*/
   define input  parameter pInvoiceNumber as character no-undo.
   define input  parameter pSONumber      as character no-undo.
   define output parameter pInvoiceType   as character no-undo.
   define output parameter pInvoiceTotal  as decimal   no-undo.
   

   for first tApiDinvoiceDIJE
      where tApiDinvoiceDIJE.tc_Rowid = pInvoiceNumber:
      assign pInvoiceType =  tApiDinvoiceDIJE.DInvoiceType.
   end.

   assign pInvoicetotal = getInvoiceTotal(pSONumber).
   
   
   
   
END PROCEDURE.

FUNCTION getCrossCompanyCode returns character (input pModule as character,
                                                input pType as character,
                                                input pAccountCode as character).

   define variable cCrossCompanyCode like en_mstr.en_entity no-undo.
   for first acdf_mstr where
      acdf_mstr.acdf_domain = global_domain and
      acdf_mstr.acdf_module = pModule and
      acdf_mstr.acdf_type = pType and
      acdf_mstr.acdf_acct = pAccountCode
   no-lock:
      cCrossCompanyCode = acdf_mstr.acdf_key1.
   end.

   return cCrossCompanyCode.

END FUNCTION.

/* Check whether this transaction use suspended tax */
FUNCTION getSuspendedTaxInfo returns logical (input pSuspTax as logical,
                                              input pEntity  as character).
   if pSuspTax
   then do:
      for first en_mstr
         where en_entity = pEntity
         and   en_domain = global_domain no-lock:
         if en_susp_tax    = "FIRSTPAY"
            or en_susp_tax = "LASTPAY"
            or en_susp_tax = "PROPORPAY"
         then
            return true.
      end.
   end.
   return false.
END FUNCTION.

{us/gl/glpstvat.i}
