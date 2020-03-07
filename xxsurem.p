/* xxsurem.p - Supplier Remittance eMail                                    */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 19-DEC-2013     BY: gbg *c1452*                   */
/* CYB       LAST MODIFIED: 03-JUL-2014     BY: gbg *c1473*                   */
/*---------------------------------------------------------------------------*/

{us/mf/mfdtitle.i x1}
{us/px/pxsevcon.i}

define temp-table tSupplier no-undo
    field tiSupplierId   as integer
    field tcSupplierCode as character
    field tcEmailAddress as character
    index prim is primary unique
        tiSupplierId.

define variable vcMessage as character no-undo.
define variable viReturn  as integer   no-undo.

define variable vcMailCC        as character no-undo.
define variable vtStartDate     as date      no-undo.
define variable viStartTime     as integer   no-undo.
define variable viNumIterations as integer   no-undo.
define variable vcFrequency     as character no-undo.
define variable load_sched      as logical   no-undo.
define variable thrs            as integer   no-undo.
define variable tmin            as integer   no-undo.
define variable vcFromCode      as character no-undo.
define variable vcToCode        as character no-undo.
define variable vtFromDate      as date      no-undo.
define variable vtTillDate      as date      no-undo.
define variable vcCreditorCode  as char.

{ proxy/breportrequestdef.i }

find AddressType where
     AddressType.AddressTypeCode = "HEADOFFICE"
     no-lock no-error.

if not available AddressType
then do:
    message "Address Type HEADOFFICE not found, unable to continue.".
    return.
end.

mainloop:
repeat:
    assign load_sched = no.

    update vcFromCode format "x(20)" label "Payment Selection Code" "to" vcToCode format "x(20)" no-label skip
           vtFromDate label "Execution Date" "till" vtTillDate no-label skip
           vtStartDate label "Run Date" skip
           thrs format "99" label "Time" ":" tmin format "99" no-label skip(1)
           load_sched label "Continue"
           with frame a side-labels.

    if thrs > 23 or tmin > 59 or thrs < 0 or tmin < 0
    then do:
        message "Invalid time (HH:MM)".
        next mainloop.
    end.

    /* Get Suppliers for entered selection */
    empty temp-table tSupplier.

    for each PaySel where
             PaySel.PaySelStatus = "TRANSFERRED"     and
             PaySel.PaySelCode  >=  vcFromCode       and
             PaySel.PaySelCode  <= (if vcToCode = ""
                                    then chr(255)
                                    else vcToCode)   and
             PaySel.PaySelDate  >= (if vtFromDate = ?
                                    then date(1, 1, 1)
                                    else vtFromDate) and
             PaySel.PaySelDate  <= (if vtTillDate = ?
                                    then date(12, 31, 9999)
                                    else vtTillDate)
             no-lock,
        each PaySelLine where
             PaySelLine.PaySel_ID = PaySel.PaySel_ID
             no-lock,
        first CInvoice where
              CInvoice.CInvoice_ID = PaySelLine.PaySelLineParentObject_ID
              no-lock
        break by CInvoice.Creditor_ID:
        if first-of(CInvoice.Creditor_ID) and
           not can-find(tSupplier where
                        tSupplier.tiSupplierId = CInvoice.Creditor_ID)
        then do:
            find Creditor of
                 CInvoice where
                 Creditor.CreditorIsSendRemittance = true
                 no-lock no-error.
            vcCreditorCode = "".
            if available Creditor
            then do:
                create tSupplier.

                assign tSupplier.tiSupplierId   = CInvoice.Creditor_ID
                       tSupplier.tcSupplierCode = Creditor.CreditorCode.
                       vcCreditorCode = Creditor.CreditorCode.
/*c1473* start added code */
                    assign tSupplier.tcEmailAddress = Creditor.CustomLong0.
                 
/*c1473* end   added code */
/*c1473* start deleted code >>>
                for first BusinessRelation of Creditor no-lock,
                    first Address of BusinessRelation 
		    where Address.AddressType_ID = AddressType.AddressType_ID 
		    no-lock:
                    assign tSupplier.tcEmailAddress = Address.AddressEmail.
                end.
**c1473* end   deleted code <<< */
            end.
        end.
    end.

    /* Give these variable a value here !! */
    assign vcMailCC        = "AccountsPayable@cyb.com.au"   /* The email address of someone at your company
                                                        so you can verify the mails are actually being sent */
           viStartTime     = thrs * 3600 + tmin * 60 /* The time the report needs to run for the first time */
           viNumIterations = 1                       /* How many times does the report need to run */
           vcFrequency     = "D"                     /* D = Daily, M = Monthly, W = Weekly, Y = Yearly */
           .

    for each tSupplier:
        dataset BReportRequest:empty-dataset().

        create tRptRequest.
        assign tRptRequest.RptRequestName             = "Remittance: " + tSupplier.tcSupplierCode + " - " +  string(vtStartDate)
               tRptRequest.RptRequestDescription      = "Generated report request for Remittance for supplier " + tSupplier.tcSupplierCode
               tRptRequest.RptRequestType             = "R"
               tRptRequest.RptRequestRptFileName      = "BPaymentSelectionReport.Remittance.rpt"
               tRptRequest.RptRequestRemoteLogic      = true
               tRptRequest.RptRequestNeedsCBF         = false
               tRptRequest.RptRequestDateFormat       = "mdy"
               tRptRequest.RptRequestDateSeparator    = "/"
               tRptRequest.RptRequestTimeFormat       = "HMS"
               tRptRequest.RptRequestTimeSeparator    = ":"
               tRptRequest.RptRequestDecimalPoint     = "."
               tRptRequest.RptRequestTCDecimals       = 2
               tRptRequest.RptRequestFilterPrintMode  = 2
               tRptRequest.RptRequestPagebreakMode    = false
               tRptRequest.RptRequestUseAltShading    = false
               tRptRequest.RptRequestSaveFolder       = "C:~\temp"
               tRptRequest.RptRequestSaveFileName     = "Remittance_" + tSupplier.tcSupplierCode
               tRptRequest.RptRequestMailSubject      = "Remittance <" + tSupplier.tcSupplierCode + ">"
               tRptRequest.RptRequestMailBody         = "Please find attached your remittance advice.  If you have any queries please contact AccountsPayable@cyb.com.au."
               tRptRequest.RptRequestMailTo           = tSupplier.tcEmailAddress
               tRptRequest.RptRequestMailCC           = vcMailCC
               tRptRequest.RptRequestMailBCC          = ""
               tRptRequest.RptRequestOutputFormat     = "PDF"
               tRptRequest.tcRptPrinterName           = ""
               tRptRequest.tcLngCode                  = "US"
               tRptRequest.tcBusActivityCode          = "Remittance"
               tRptRequest.tcBusComponentCode         = "BPaymentSelectionReport"
               tRptRequest.tcUsrLogin                 = "mfg"
               tRptRequest.ttRequestRequiredStartDate = ?
               tRptRequest.tiRequestRequiredStartTime = 0
               tRptRequest.tcRequestStatus            = ""
               tRptRequest.ttRequestStartDate         = ?
               tRptRequest.tiRequestStartTime         = 0
               tRptRequest.ttRequestEndDate           = ?
               tRptRequest.tiRequestEndTime           = 0
               tRptRequest.tc_Rowid                   = "-1" 
               tRptRequest.tc_Status                  = "N".

        create tRptRequestFilter.
        assign tRptRequestFilter.RptRequestFilterBusField  = "PaySelCode_RANGE"
               tRptRequestFilter.RptRequestFilterSequence  = 0
               tRptRequestFilter.RptRequestFilterOperator  = "range"
               tRptRequestFilter.RptRequestFilterIniValue1 = vcFromCode
               tRptRequestFilter.RptRequestFilterIniValue2 = vcToCode
               tRptRequestFilter.RptRequestFilterIsRange   = true
               tRptRequestFilter.RptRequestFilterIsMand    = false
               tRptRequestFilter.RptRequestFilterIsVisible = true
               tRptRequestFilter.RptRequestFilterDataType  = "c"
               tRptRequestFilter.tc_Rowid                  = "-10"
               tRptRequestFilter.tc_ParentRowid            = "-1"
               tRptRequestFilter.tc_Status                 = "N".

        create tRptRequestFilter.
        assign tRptRequestFilter.RptRequestFilterBusField  = "CreditorCode_CANDO"
               tRptRequestFilter.RptRequestFilterSequence  = 1
               tRptRequestFilter.RptRequestFilterOperator  = "can-do"
               tRptRequestFilter.RptRequestFilterIniValue1 = tSupplier.tcSupplierCode
               tRptRequestFilter.RptRequestFilterIsRange   = false
               tRptRequestFilter.RptRequestFilterIsMand    = false
               tRptRequestFilter.RptRequestFilterIsVisible = true
               tRptRequestFilter.RptRequestFilterDataType  = "c"
               tRptRequestFilter.tc_Rowid                  = "-11"
               tRptRequestFilter.tc_ParentRowid            = "-1"
               tRptRequestFilter.tc_Status                 = "N".

        create tRptRequestFilter.
        assign tRptRequestFilter.RptRequestFilterBusField  = "ExecutionDate_RANGE"
               tRptRequestFilter.RptRequestFilterSequence  = 2
               tRptRequestFilter.RptRequestFilterOperator  = "range"
               tRptRequestFilter.RptRequestFilterIniValue1 = if vtFromDate = ?
                                                             then ?
                                                             else string(year(vtFromDate), "9999") + string(month(vtFromDate), "99") + string(day(vtFromDate), "99")
               tRptRequestFilter.RptRequestFilterIniValue2 = if vtTillDate = ?
                                                             then ?
                                                             else string(year(vtTillDate), "9999") + string(month(vtTillDate), "99") + string(day(vtTillDate), "99")
               tRptRequestFilter.RptRequestFilterIsRange   = true
               tRptRequestFilter.RptRequestFilterIsMand    = false
               tRptRequestFilter.RptRequestFilterIsVisible = true
               tRptRequestFilter.RptRequestFilterDataType  = "t"
               tRptRequestFilter.tc_Rowid                  = "-12"
               tRptRequestFilter.tc_ParentRowid            = "-1"
               tRptRequestFilter.tc_Status                 = "N".

        create tRptRequestFilter.
        assign tRptRequestFilter.RptRequestFilterBusField  = "SendRemittance"
               tRptRequestFilter.RptRequestFilterSequence  = 3
               tRptRequestFilter.RptRequestFilterOperator  = "="
               tRptRequestFilter.RptRequestFilterIniValue1 = string(true)
               tRptRequestFilter.RptRequestFilterIsRange   = false
               tRptRequestFilter.RptRequestFilterIsMand    = false
               tRptRequestFilter.RptRequestFilterIsVisible = true
               tRptRequestFilter.RptRequestFilterDataType  = "l"
               tRptRequestFilter.tc_Rowid                  = "-13"
               tRptRequestFilter.tc_ParentRowid            = "-1"
               tRptRequestFilter.tc_Status                 = "N".

        create tReportSchedule.
        assign tReportSchedule.tcScheduleName          = tRptRequest.RptRequestName
               tReportSchedule.tcScheduleDescription   = tRptRequest.RptRequestDescription
               tReportSchedule.ttScheduleStartDate     = vtStartDate
               tReportSchedule.tiScheduleStartTime     = viStartTime
               tReportSchedule.tiScheduleNumIterations = viNumIterations
               tReportSchedule.tcScheduleFrequency     = vcFrequency
               tReportSchedule.tc_Rowid                = "-1"
               tReportSchedule.tc_Status               = "N".

run logit("Load Proxy Procedures").
        run proxy/breportrequest.p persistent set vhProxyComponent.
run logit("Load Proxy Procedures Done").

run logit("ApiReplicate").
        run ApiReplicate in vhProxyComponent (
            "", /* Company code if not the default specified in env.p */
            input dataset BReportRequest,
            input "",
            output dataset tFcMessages,
            output viReturn).
run logit("ApiReplicateDone").

        delete procedure vhProxyComponent.

        if viReturn <> 0
        then do:
            assign vcMessage = "An error occurred " + chr(10).

            for each tFcMessages:
                 display tFcMessages.tcFcMessage format "x(50)" with frame x down.
                 assign vcMessage = vcMessage + chr(10) + tFcMessages.tcFcMessage.
            end.
        end.
        else assign vcMessage = "The report request was created correctly".
    end. /* for each tSupplier */
end. /* REPEAT */

run logit("StopSession").
run proxy/stopcbsession.p (output dataset tFcMessages, output viReturn).
run logit("Done").

if viReturn <> 0
then message vcMessage.



def stream xlog.
/* xxlog.i    - Include to add logging to debug programs                     */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 17-DEC-2013    BY:  gbg *c1450*                     */
/*---------------------------------------------------------------------------*/


procedure logit.
define input parameter ipmsg as char.

if true or can-find(first code_mstr
            where code_domain = global_domain
	    and   code_fldname = "debug"
	    and   code_value begins "xxeml")
then do:
   output stream xlog to 
             value("/home/mfg/xxeml.log")
	     append.
	  
      put stream xlog unformatted
          string(today) "|"
          program-name(2) "|"
          program-name(3) "|"
          global_userid "|"
          string(time, "HH:MM:SS") "|"
          ipmsg
          skip.

   output stream xlog close.
end.
end.  /* proceddure logit */
