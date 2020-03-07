/* sorp.i - Common function definitions for Invoice Print and Post            */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: sorp.i,v 1.1.1.1 2017/10/02 13:18:30 gbg Exp $: */
/*                                                                            */
/* Revision: 1.1      BY: Deirdre O'Brien   DATE: 07/20/07    ECO: *R0C6*     */
/* $Revision: 1.1.1.1 $   BY: Jean Miller       DATE: 06/19/08    ECO: *R0VG*     */
/* CYB           LAST MODIFIED: 2017-Jun-08   BY: gbg *C1369*                 */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
&SCOPED-DEFINE CREDIT "CREDITNOTE"
&SCOPED-DEFINE INVOICE "INVOICE"
&SCOPED-DEFINE CRED_CORR "CREDITNOTECORRECTION"
&SCOPED-DEFINE INV_CORR "INVOICECORRECTION"
 
&SCOPED-DEFINE DYB_DR_CREDIT "DEBTORCREDITNOTE"
&SCOPED-DEFINE DYB_DR_INVOICE "DEBTORINVOICE"
&SCOPED-DEFINE DYB_DR_CRED_CORR "DEBTORINVOICECORRECT"
&SCOPED-DEFINE DYB_DR_INV_CORR "DEBTORCREDITNOTECORRECT"
 
define variable hInvoiceTotal as handle no-undo.
 
define temp-table salesOrderNumbers no-undo
    field soNum        as character 
    field invNum       as character.
 
FUNCTION getOrderTotal returns decimal
   (  input pcSalesOrderNumber as character) in hInvoiceTotal.
 
run mfairunh.p
      (input 'mfinvtot.p',
       input '?',
       output hInvoiceTotal) no-error.
 
FUNCTION useGLCorrections2  returns logical private ():
/*--------------------------------------------------------------------------
   Purpose      : Checks in GL Control if GL Corrections are enabled
   Parameters   : <none>
   Returns      : true if valid false if invalid
   Notes        :
  ------------------------------------------------------------------------*/
   define variable lValid as logical initial false no-undo.
 
   for first glcor_ctrl
      where  glcor_domain  = global_domain
        and  glcor_so_corr = true
   no-lock:
      assign lValid = true.
   end.
 
   return lValid.
 
END FUNCTION.
 
FUNCTION getAdjustmentDaybook returns character
   (input pcDaybookSetCode as character):
/*--------------------------------------------------------------------------
   Purpose      : Retrieve the adjustment daybook for this daybook set
   Parameters   : daybook set code
   Returns      : the adjustment daybook
   Notes        :
  ------------------------------------------------------------------------*/
   define variable adjustmentDaybook as character no-undo initial "".
 
   for first dybs_mstr no-lock
      where dybs_mstr.dybs_domain = global_domain
        and dybs_mstr.dybs_code = pcDaybookSetCode:
      assign adjustmentDaybook = dybs_mstr.dybs_adjustment_dybk.
   end.
 
   return adjustmentDaybook.
END FUNCTION.
 
FUNCTION useCorrectionInvoices2 returns logical private ():
/*--------------------------------------------------------------------------
   Purpose      : Checks Sales Order Control if Correction invoices
                  are enabled.
   Parameters   : <none>
   Returns      : true if valid false if invalid
   Notes        :
  ------------------------------------------------------------------------*/
   define variable lValid as logical initial false no-undo.
 
   for first soc_ctrl
      where soc_domain = global_domain
   no-lock:
      assign lValid = soc_use_corr_inv.
   end.
 
   return lValid.
 
END FUNCTION.
 
FUNCTION getLineTotal returns decimal private
   ( input pcSoNbr  as character ):
/*--------------------------------------------------------------------------
   Purpose      : Return Sales Order Line Total
   Parameters   : <input>
                  pcSoNbr  - Used to find the Sales Order
   Returns      : Sales Order Line Total - decimal
   Notes        :
  ------------------------------------------------------------------------*/
   define variable dOrderTotal as decimal no-undo.
 
   for each sod_det
      where sod_domain = global_domain
        and sod_nbr    = pcSoNbr
        and sod_compl_stat = ""
   no-lock:
      dOrderTotal = dOrderTotal + (sod_price * sod_qty_ord).
   end.
 
   return dOrderTotal.
 
END FUNCTION.
 
FUNCTION getInvoiceTotal returns decimal private
   ( input pcSoNbr  as character ):
/*--------------------------------------------------------------------------
   Purpose      : Return Sales Order Line Total
   Parameters   : input pcSoNbr   - Finds the Sales Order
 
   Returns      : Sales Order Line Total - decimal
   Notes        :
  ------------------------------------------------------------------------*/
   define variable dOrderTotal as decimal no-undo.
 
   dOrderTotal = getOrderTotal(pcSoNbr).
 
   return dOrderTotal.
 
END FUNCTION.
 
FUNCTION getOriginalInvoiceNumber RETURNS CHARACTER PRIVATE
    ( input pcSalesOrderNumber as character ):
/*--------------------------------------------------------------------------
   Purpose      :
 
   Parameters   :
   Notes        :
  ------------------------------------------------------------------------*/
   define variable SONumber              as character initial "" no-undo.
   define variable OriginalInvoiceNumber as character initial "" no-undo.
 
   assign SONumber = pcSalesOrderNumber.
 
   repeat:
       /* Check for correction invoice */
      for first cil_mstr
          where cil_mstr.cil_domain = global_domain
            and cil_mstr.cil_cor_so_nbr = SONumber
      no-lock:
 
         assign
            OriginalInvoiceNumber = cil_mstr.cil_prev_inv
            SONumber = cil_mstr.cil_prev_so_nbr.
 
      end.  /* end for first cil_mstr */
 
      if not available cil_mstr
      then leave.
 
   end. /* end repeat */
 
   return OriginalInvoiceNumber.
 
END FUNCTION. /* end getOriginalInvoiceNumber*/
 
FUNCTION getInvoiceType RETURNS CHARACTER PRIVATE
    ( input salesOrderNumber as character,
      input orderTotal as decimal):
/*------------------------------------------------------------------------------
  Purpose:  Returns the type of a Financials Invoice based on the Daybook
    Notes:
------------------------------------------------------------------------------*/
   define variable pcInvoiceType             as character initial "" no-undo.
   define variable originalInvoiceNumber     as character initial "" no-undo.
   define variable useGLCorrections          as logical   initial false no-undo.
   define variable useCorrectionInvoices     as logical   initial false no-undo.
   define variable isNegativeOriginalInvoice as logical   initial false no-undo.
 
   useGLCorrections = useGLCorrections2().
   useCorrectionInvoices = useCorrectionInvoices2().
 
   /* Check to see if we are using Correction Invoices */
   if useCorrectionInvoices
   then do:
 
      originalInvoiceNumber = getOriginalInvoiceNumber(salesOrderNumber).
 
      if originalInvoiceNumber <> ""
      then
         /* Determine if the original invoice was negative */
         run isOriginalInvoiceNegative
           (input originalInvoiceNumber,
            output isNegativeOriginalInvoice).
   end.   /* end useCorrectionInvoices */
 
   if originalInvoiceNumber = "" and OrderTotal >= 0
   then do:
      /* Postive Invoice */
      assign pcInvoiceType = {&INVOICE}.
   end.
 
   else if originalinvoiceNumber = "" and OrderTotal < 0
   then do:
      /* Negative Invoice */
      if not(useCorrectionInvoices) and useGLCorrections then
         assign pcInvoiceType = {&INV_CORR}.
      else
         assign pcInvoiceType = {&CREDIT}.
   end.
 
   else if originalInvoiceNumber <> "" and OrderTotal >= 0
   then do:
      /* Positive Correction Invoice */
      if useGLCorrections and isNegativeOriginalInvoice then
         assign pcInvoiceType = {&CRED_CORR}.
      else
         assign pcInvoiceType = {&INVOICE}.
   end.
 
   else if originalInvoiceNumber <> "" and OrderTotal < 0
   then do:
      /* Negative Correction Invoice */
      if useGLCorrections and not(isNegativeOriginalInvoice) then
         assign pcInvoiceType = {&INV_CORR}.
      else
         assign pcInvoiceType = {&CREDIT}.
   end.
 
   if pcInvoiceType = "" then
      assign pcInvoiceType = {&INVOICE}.
 
   return pcInvoiceType.
 
END FUNCTION.
 
PROCEDURE getInvoiceComponents:
/*--------------------------------------------------------------------------
   Purpose      : This procedure takes the invoice number as the input and
                  breaks it out into the separate components that make it up
                  and returns these values
 
   Parameters   : input  pcInvoiceRef
                : output piYear
                  output pcDaybookCode
                  output piVoucherNum
   Notes        :
  ------------------------------------------------------------------------*/
   define input  parameter pcInvoiceRef  as character format "x(22)" no-undo.
   define output parameter piYear        as integer   format "9999"  no-undo.
   define output parameter pcDaybookCode as character format "x(8)"  no-undo.
   define output parameter piVoucherNum  as integer
                                                  format "999999999" no-undo.
 
   define variable iLength               as integer                  no-undo.
   define variable iStartInt             as integer                  no-undo.
   define variable iDaybookLength        as integer                  no-undo.
 
   /* INITIALIZE VALUES */
   assign
      piYear        = 0
      pcDaybookCode = ""
      piVoucherNum  = 0
      iLength        = length(pcInvoiceRef)
      iStartInt      = (iLength - 9) + 1 /* start pos' for voucher integer */
      iDaybookLength = iLength - 14.     /* 14 is length of constant strings */



/*c1369* start added code */
/* XS woa 15 Febr 2010 *********************************************/
/* 9DIGIT keep only the last 9 digits                             */
if length(pcInvoiceRef) = 9
then do:
     assign pcDaybookCode = substring(pcInvoiceRef,1,1)
	    piVoucherNum  = integer(pcInvoiceRef).
/* code removed as in 2009 >>>>>>
     find DInvoice where
          DInvoice.DInvoiceVoucher = piVoucherNum no-lock no-error.
     if available DInvoice
     then assign piYear = DInvoice.DInvoicePostingYear.
* code removed as in 2009 <<<<<<<<<<  */
end.
else 
   if length(pcInvoiceRef) > 8 then
   /* EXTRACT THE VARIOUS VALUES FROM THE INVOICE REFERENCE */
   assign
      piYear        = integer(substring(pcInvoiceRef,1,4))
      pcDaybookCode = substring(pcInvoiceRef,6,iDaybookLength)
      piVoucherNum  = integer(substring(pcInvoiceRef,iStartInt,9)).


/* XS woa 15 Febr 2010 *********************************************/
/*c1369* end   added code */
 
 /*debug >>>>>>
   if length(pcInvoiceRef) > 8 then
   /* EXTRACT THE VARIOUS VALUES FROM THE INVOICE REFERENCE */
   assign
      piYear        = integer(substring(pcInvoiceRef,1,4))
      pcDaybookCode = substring(pcInvoiceRef,6,iDaybookLength)
      piVoucherNum  = integer(substring(pcInvoiceRef,iStartInt,9)) no-error.
  *debug* <<<<<<<<<<<< */
END PROCEDURE.
 
PROCEDURE isOriginalInvoiceNegative:
/*--------------------------------------------------------------------------
   Purpose      : Determine if the Original Invoice is negative
   Parameters   : input  pcOriginalInvoiceNumber
                  output plNegative
   Notes        :
  ------------------------------------------------------------------------*/
   define  input parameter pcOriginalInvoiceNumber as character no-undo.
   define output parameter plNegative              as logical   no-undo.
 
   define variable OrigYear          as character no-undo.
   define variable OrigDayBookCode   as character no-undo.
   define variable OrigVoucherNumber as character no-undo.
 
   /* Find the invoice history record for the
    * invoice to determine if the
    * invoice was negative or postive
    */
   for first ih_hist
      where ih_hist.ih_domain = global_domain
        and ih_hist.ih_inv_nbr = pcOriginalInvoiceNumber
   no-lock:
        if ih_invoicetotal >= 0
        then
           assign plNegative = false.
        else
           assign plNegative = true.
   end.
 
END PROCEDURE.
 
PROCEDURE getInvoiceComponentsByNRM:
/*--------------------------------------------------------------------------
   Purpose      : User may modify seg format in Number Range Maintenance(NRM).
                  1. Change Year(Fisal) to Y/Y1/Y4, take 2013 for example:
                     Format	Meaning	Result
                     Y2     YY      13
                     Y      YYYY	  2013
                     Y1     Y	      3
                  2. Change Voucher(Int) to any value range
                  for example, 000001~500000, or 1000~9999
 
                  This procedure takes the daybook code and domain as the 
                  input, to get year and voucher number from nr_mstr table, 
                  which are make up the standard invoice number.
 
   Parameters   : input  pcOrgInvnbr
                  input  pcDaybook
                  input  pcDomain
                  input  eff_date
                  output piYear
                  output piVoucherNum
                  output pcInvNum
   Notes        :
  ------------------------------------------------------------------------*/
   define input  parameter pcOrgInvnbr   as character                no-undo.
   define input  parameter pcDaybook     as character format "x(8)"  no-undo.
   define input  parameter pcDomain      as character format "x(8)"  no-undo.
   define input  parameter eff_date      as date                     no-undo.
   define output parameter piYear        as integer   format "9999"  no-undo.
   define output parameter piVoucherNum  as integer
                                                  format "999999999" no-undo.
   define output parameter pcInvNum      as character                no-undo.
 
   define variable iCounter              as integer                  no-undo.
   define variable cNumRangeSegType      as character                no-undo.
   define variable cNumRangeSegVal       as character                no-undo.
   define variable cNumRangeSegFormat    as character                no-undo.
   define variable cSegType              as character                no-undo.
   define variable cSegValue             as character                no-undo.
   define variable cSegFormat            as character                no-undo.
   define variable iCurrentYear          as integer                  no-undo.
	 define variable iVoucherStartPos      as integer                  no-undo.
 
   assign
      piYear        = 0
      piVoucherNum  = 0
      iVoucherStartPos = 0.
 
   for first nr_mstr
      where nr_mstr.nr_domain = pcDomain
        and nr_mstr.nr_seqid  = pcDaybook
   no-lock:
 
      assign
         cNumRangeSegType    = nr_mstr.nr_seg_type
         cNumRangeSegVal     = nr_mstr.nr_seg_value
         cNumRangeSegFormat  = nr_mstr.nr_seg_format.
   end.
 
   /* Get GL year */
   for first glc_cal
         where glc_domain = pcDomain and
               glc_start <= eff_date and
               glc_end   >= eff_date
   no-lock:
      assign iCurrentYear = glc_cal.glc_year.
   end.
 
   do iCounter = 1 to num-entries(cNumRangeSegType):
      assign cSegType   = trim(entry(iCounter, cNumRangeSegType))
             cSegValue  = trim(entry(iCounter, cNumRangeSegVal))
             cSegFormat = trim(entry(iCounter, cNumRangeSegFormat)).
      case cSegType:      	
      	 /* Fixed Seperator or Daybook*/
      	 when "4" then
      	    iVoucherStartPos = iVoucherStartPos + length(cSegValue).
         /* Fiscal - Year */
         when "3"
         then do:
            if cSegFormat = "Y2" and length(cSegValue) = 2
            then assign piYear = truncate((iCurrentYear / 100 ),0) * 100 
                                                       + int(cSegValue).
            else if cSegFormat = "Y1" and length(cSegValue) = 1
            then assign piYear = truncate((iCurrentYear / 10 ),0) * 10 
                                                       + int(cSegValue).
            else assign piYear = int(cSegValue).
 
            iVoucherStartPos = iVoucherStartPos + length(string(cSegValue)).
         end.
 
			   /* Date - Year */
      	 when "2"
      	 then assign piYear = int(cSegValue)
      	     iVoucherStartPos = iVoucherStartPos + length(string(cSegValue)).
      	
         /* Int - Voucher */
         when "1"
         then do:                                   
            assign piVoucherNum = int(substring(pcOrgInvnbr,
                                                   iVoucherStartPos + 1,
                                                   length(cSegValue))) 
                                                   no-error.                	     
         end.
      end.   
   end.
 
   assign pcInvNum = string(piYear) + "/" + pcDaybook + 
                     string(piVoucherNum, "999999999"). 
END PROCEDURE.
 
PROCEDURE getHistInvoiceComponentsByNRM:
/*--------------------------------------------------------------------------
   Purpose      : This procedure takes the inv_nbr and domain as the 
                  input, to get year, daybook and voucher number from nr_mstr 
                  table, which are make up the standard invoice number.
 
   Parameters   : input  inv_nbr
                : input  cur_domain
                  output piYear
                  output piDaybook
                  output piVoucherNum
   Notes        :
  ------------------------------------------------------------------------*/
   define input  parameter inv_nbr       as character                no-undo.
   define input  parameter cur_domain    as character format "x(8)"  no-undo.
   define output parameter piYear        as integer   format "9999"  no-undo.
   define output parameter piDaybook     as character                no-undo.
   define output parameter piVoucherNum  as integer
                                                  format "999999999" no-undo.
 
   define variable eff_date              as date                     no-undo.
   define variable formatInvNbr          as character                no-undo.
 
   assign
      piYear        = 0
      piVoucherNum  = 0
      piDaybook     = "".
 
   for first ih_hist
       where ih_hist.ih_inv_nbr = inv_nbr 
         and ih_hist.ih_domain  = cur_domain
   no-lock:
      assign 
         piDaybook = ih_hist.ih_daybook
         eff_date  = ih_inv_date.
   end.
 
   run getInvoiceComponentsByNRM(input inv_nbr,
                                 input piDaybook,
                                 input cur_domain,
                                 input eff_date,
                                 output piYear,
                                 output piVoucherNum,
                                 output formatInvNbr). 
END PROCEDURE.
 
