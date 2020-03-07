/* xxsteml.p  -  STATEMENT EMAILING FUNCTION                                  */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* CYB       LAST MODIFIED: 21-Sep-2010     BY: nac *cy99*                    */
/* CYB       LAST MODIFIED: 07-NOV-2011     BY: gbg *c1255*                   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 30-APR-2013     BY: gbg *c1395*                   */
/* CYB       LAST MODIFIED: 19-DEC-2013     BY: gbg *c1452*                   */
/******************************************************************************/

{us/mf/mfdtitle.i "x1 "}   /* TITLE AND DEFINED VARIABLES */
{us/px/pxsevcon.i}         /* SEVERITY PREPROCESSOR INCLUDE FILE */

define variable vcMessage as character no-undo.
define variable viReturn  as integer   no-undo.

define variable vcCustomer      as character no-undo.
define variable vcMailTo        as character no-undo.
define variable vcMailCC        as character format "x(40)" no-undo.
define variable vcEntity        as character format "x(24)" no-undo.
define variable vcPrinter       as character format "x(20)" no-undo.
define variable vcCodeSet       as character format "x(20)" no-undo.
define variable vcStatementDate     as date      no-undo.
define variable vtStartDate     as date      no-undo.
define variable viStartTime     as integer   no-undo.
define variable viNumIterations as integer   no-undo.
define variable vcFrequency     as character no-undo.
define variable load_sched      as logical   no-undo.
define variable thrs            as integer   no-undo.
define variable tmin            as integer   no-undo.

/*c1255*/ def var vDebtor       like Debtor.DebtorCode.
/*c1255*/ def var vDebtor1      like Debtor.DebtorCode label "to".
/*c1255*/ def var veMailOnly    as logical label "eMail Only".

{ proxy/breportrequestdef.i }

find AddressType where
     AddressType.AddressTypeCode = "HEADOFFICE"
     no-lock no-error.

if not available AddressType
then do:
    message "Address Type HEADOFFICE not found, unable to continue.".
    return.
end.

/*c1255*/ veMailOnly = yes.

mainloop:
repeat:
    assign load_sched = no.
/*c1255*/ if vDebtor1 = hi_char then vDebtor1 = "".

    update vtStartDate label "Run Date" colon 25 skip
           thrs colon 25 format "99" label "Time" ":" tmin format "99" no-label skip(1)
/*c1255*           load_sched label "Continue" colon 25 skip(1) */

/*c1255*/  vDebtor  colon 25    vDebtor1 colon 45
           vcEntity label "Entity" colon 25
           vcMailcc label "CC Address" colon 25
	   vcPrinter label "Printer" colon 25
	   vcCodeSet label "Shared Set" colon 25
	   vcStatementDate label "Statement Date" colon 25
/*c1255*/  veMailOnly  colon 25
    with frame a side-labels centered.

/*c1255*/ if vDebtor1 = "" then vDebtor1 = hi_char.

    if thrs > 23 or tmin > 59 or thrs < 0 or tmin < 0
    then do:
        message "Invalid time (HH:MM)".
        next mainloop.
    end.
   if not can-find(first code_mstr 
                                     where code_fldname = "vcEntity"
                                     and   code_value   = vcEntity) then
   do:
      /* Value must exist in GENERALIZED CODES  */
      {us/bbi/pxmsg.i &MSGNUM=716 &ERRORLEVEL={&APP-ERROR-RESULT}}
      next-prompt vcEntity with frame a.
      next mainloop.
   end. 
   
   if not can-find(first code_mstr 
                                     where code_fldname = "vcCodeSet"
                                     and   code_value   = vcCodeSet) then
   do:
      /* Value must exist in GENERALIZED CODES  */
      {us/bbi/pxmsg.i &MSGNUM=716 &ERRORLEVEL={&APP-ERROR-RESULT}}
      next-prompt vcCodeSet with frame a.
       next mainloop.
   end. 
   

    /* Give these variable a value here !! */
    assign 
/*
           vcMailCC        = ""    /* The email address of someone at your*/
                                   /* company so you can verify the mails are*/
   				   /* actually being sent */
           vcEntity        = "$Entity"    /* The entity you want to use on the*/
                                          /* filter of the report. You can*/
					  /* specify more than 1 entity by */
					  /* separating the entity codes with*/
					  /* a comma. If you want to use the*/
					  /* entity you login to, specify */
					  /* $Entity as the only value */
 */
           viStartTime     = thrs * 3600 + tmin * 60 
	                                  /* The time the report needs to run*/
					  /* for the first time */
 	   viNumIterations = 1            /* How many times does the report*/
	                                  /* need to run */
           vcFrequency     = "D"          /* D = Daily, M = Monthly, */
	                                  /* W = Weekly, Y = Yearly */
           .

/*c1255*/ DebtorLoop:
    for each Debtor where 
/*c1255*/    Debtor.DebtorCode >= vDebtor and Debtor.DebtorCode <= vDebtor1 and
             Debtor.DebtorIsPrintStatement = true and
             can-find(first DBalance of Debtor where DBalance.DBalanceLC <> 0)
	     and can-find(first SharedSet 
	                  where SharedSet.SharedSet_ID = Debtor.SharedSet_ID 
  	                  and   SharedSet.SharedSetTypeCode = "DEBTOR"
	                  and   SharedSet.SharedSetCode = vcCodeSet)
             no-lock:


        assign vcCustomer = Debtor.DebtorCode.

        for first BusinessRelation of Debtor no-lock,
        first Address of BusinessRelation where Address.AddressType_ID = 
	            AddressType.AddressType_ID no-lock:
            assign vcMailTo = Address.AddressEmail.
/*c1255*/   if veMailOnly and vcMailTo = "" then next Debtorloop.
        end.

        dataset BReportRequest:empty-dataset().

        create tRptRequest.
        assign tRptRequest.RptRequestName             = "Statement: " + vcCustomer + " - " +  string(vtStartDate)
               tRptRequest.RptRequestDescription      = "Generated report request for Statement of account for customer " + vcCustomer
               tRptRequest.RptRequestType             = "R"
               tRptRequest.RptRequestRptFileName      = "BDebtorReport.DebtorAccountState.rpt"
               tRptRequest.RptRequestRemoteLogic      = true
               tRptRequest.RptRequestNeedsCBF         = false
               tRptRequest.RptRequestDateFormat       = "dmy"
               tRptRequest.RptRequestDateSeparator    = "/"
               tRptRequest.RptRequestTimeFormat       = "HMS"
               tRptRequest.RptRequestTimeSeparator    = ":"
               tRptRequest.RptRequestDecimalPoint     = "."
               tRptRequest.RptRequestTCDecimals       = 2
               tRptRequest.RptRequestFilterPrintMode  = 2
               tRptRequest.RptRequestPagebreakMode    = false
               tRptRequest.RptRequestUseAltShading    = false
               tRptRequest.RptRequestSaveFolder       = "C:~\temp"
               tRptRequest.RptRequestSaveFileName     = "CYBStatement_" + vcCustomer
               tRptRequest.RptRequestMailSubject      = "Monthly Statement of Account <" + vcCustomer + ">"
               tRptRequest.RptRequestMailBody         = "Thank you for your business with Century Yuasa Batteries"
               tRptRequest.RptRequestMailTo           = vcMailTo
               tRptRequest.RptRequestMailCC           = vcMailCC
               tRptRequest.RptRequestMailBCC          = ""
               tRptRequest.RptRequestOutputFormat     = "PDF"
               tRptRequest.tcRptPrinterName           = ""
               tRptRequest.tcLngCode                  = "US"
               tRptRequest.tcBusActivityCode          = "DebtorAccountState"
               tRptRequest.tcBusComponentCode         = "BDebtorReport"
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

        if vcMailTo = "" then 
	   assign tRptRequest.RptRequestMailSubject      = ""
                  tRptRequest.RptRequestMailBody         = ""
                  tRptRequest.RptRequestMailTo           = ""
                  tRptRequest.RptRequestMailCC           = ""
                  tRptRequest.RptRequestMailBCC          = ""
                  tRptRequest.RptRequestOutputFormat     = ""
                  tRptRequest.tcRptPrinterName           = vcPrinter.

        create tRptRequestFilter.
        assign tRptRequestFilter.RptRequestFilterBusField  = "Company_cando"
               tRptRequestFilter.RptRequestFilterSequence  = 0
               tRptRequestFilter.RptRequestFilterOperator  = "can-do"
               tRptRequestFilter.RptRequestFilterIniValue1 = vcEntity
               tRptRequestFilter.RptRequestFilterIsRange   = false
               tRptRequestFilter.RptRequestFilterIsMand    = false
               tRptRequestFilter.RptRequestFilterIsVisible = true
               tRptRequestFilter.RptRequestFilterDataType  = "c"
               tRptRequestFilter.tc_Rowid                  = "-10"
               tRptRequestFilter.tc_ParentRowid            = "-1"
               tRptRequestFilter.tc_Status                 = "N".

/*c1255*  start deleted code >>>>>>>>>>>>
*c1395*/
        create tRptRequestFilter.
        assign tRptRequestFilter.RptRequestFilterBusField  = "DebtorCode_cando"
               tRptRequestFilter.RptRequestFilterSequence  = 1
               tRptRequestFilter.RptRequestFilterOperator  = "can-do"
               tRptRequestFilter.RptRequestFilterIniValue1 = vcCustomer
               tRptRequestFilter.RptRequestFilterIsRange   = false
               tRptRequestFilter.RptRequestFilterIsMand    = false
               tRptRequestFilter.RptRequestFilterIsVisible = true
               tRptRequestFilter.RptRequestFilterDataType  = "c"
               tRptRequestFilter.tc_Rowid                  = "-11"
               tRptRequestFilter.tc_ParentRowid            = "-1"
               tRptRequestFilter.tc_Status                 = "N".
/*c1395*
*c1255*  end   deleted code <<<<<<<<<<<< */

/*c1395*  start deleted code >>>>
/*c1255* start added code */
        create tRptRequestFilter.
        assign tRptRequestFilter.RptRequestFilterBusField  = "DebtorCode"
               tRptRequestFilter.RptRequestFilterSequence  = 1
               tRptRequestFilter.RptRequestFilterOperator  = "range"
               tRptRequestFilter.RptRequestFilterIniValue1 = VDebtor
               tRptRequestFilter.RptRequestFilterIniValue2 = VDebtor1
               tRptRequestFilter.RptRequestFilterIsRange   = true
               tRptRequestFilter.RptRequestFilterIsMand    = false
               tRptRequestFilter.RptRequestFilterIsVisible = true
               tRptRequestFilter.RptRequestFilterDataType  = "c"
               tRptRequestFilter.tc_Rowid                  = "-11"
               tRptRequestFilter.tc_ParentRowid            = "-1"
               tRptRequestFilter.tc_Status                 = "N".
/*c1255* end   added code */
*c1395* <<<<<<<< */

        create tRptRequestFilter.
        assign tRptRequestFilter.RptRequestFilterBusField  = "StatementDate"
               tRptRequestFilter.RptRequestFilterSequence  = 2
               tRptRequestFilter.RptRequestFilterOperator  = "="
               tRptRequestFilter.RptRequestFilterIniValue1 = 
	          string(year(vcStatementDate),"9999") +
	          string(month(vcStatementDate),"99") +
	          string(day(vcStatementDate),"99") 
               tRptRequestFilter.RptRequestFilterIsRange   = false
               tRptRequestFilter.RptRequestFilterIsMand    = false
               tRptRequestFilter.RptRequestFilterIsVisible = true
               tRptRequestFilter.RptRequestFilterDataType  = "t"
               tRptRequestFilter.tc_Rowid                  = "-12"
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

        run proxy/breportrequest.p persistent set vhProxyComponent.

        /* Param 1 - Company code if not the default specified in env.p */
        run ApiReplicate in vhProxyComponent (
            "", 
            input dataset BReportRequest,
            input "",
            output dataset tFcMessages,
            output viReturn).

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
    end. /* for each Debtor */
end. /* REPEAT */

run proxy/stopcbsession.p (output dataset tFcMessages, output viReturn).

if viReturn <> 0
then message vcMessage.



/* xxlog.i    - Include to add logging to debug programs                     */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 17-DEC-2013    BY:  gbg *c1450*                     */
/*---------------------------------------------------------------------------*/


def stream xlog.
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
