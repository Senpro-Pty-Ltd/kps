/* xxrqemsend.p - REQUISITION SEND EMAILS                                       */
/* rqemsend.p - REQUISITION SEND EMAILS                                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqemsend.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* Revision: 8.6    LAST MODIFIED BY: 07/03/97  By: B. Gates          *J1Q2*  */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane     */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KP* myb                  */
/* Revision: 1.7      BY: Tiziana Giustozzi   DATE: 07/03/01 ECO: *N104*      */
/* Revision: 1.10     BY: Andrea Suchankova   DATE: 10/17/02 ECO: *N13P*      */
/* Revision: 1.12     BY: Paul Donnelly (SB)  DATE: 06/28/03 ECO: *Q00L*      */
/* Revision: 1.13     BY: Ed van de Gevel     DATE: 07/08/03 ECO: *Q003*      */
/* Revision: 1.14     BY: Shoma Salgaonkar    DATE: 04/05/05 ECO: *P3FV*      */
/* CYB          LAST MODIFIED: 16-DEC-2011   BY: gbg *c1267*                  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

using com.qad.eefin.bemployee.EmployeeAddressByEmpCoCode.

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */


define input parameter p_rqm_recid as recid no-undo.
define input parameter p_action like rqh_action no-undo.
define output parameter p_email_sent_to as character no-undo.

{us/rq/rqconst.i}

define variable approval_needed_subject as character format "x(35)" no-undo.
define variable ready_for_purchasing_subject as character format "x(35)"
   no-undo.
define variable no_action_subject as character format "x(35)" no-undo.
define variable subject as character format "x(24)" no-undo.
define variable dummychar as character no-undo.
define variable output_filename as character no-undo.
define variable total_frame_hdl as handle no-undo.
define variable i as integer no-undo.
define variable line_count as integer no-undo.
define variable temp_comment_line like cmt_cmmt no-undo.
define variable comment_line like cmt_cmmt no-undo.
define variable email_already_sent_to as character no-undo.
define variable l_denied_subject as character format "x(35)" no-undo.

/*c1267*/ define variable vSite   like si_site.
/*c1267*/ define variable vSiteDesc like si_desc.

/*
if c-application-mode = "API" then
do:
   /* GRS email will not be sent - Not supported in API MODE */
   {us/bbi/pxmsg.i &MSGNUM = 2734 &ERRORLEVEL = 2}
   return.
end.
*/

assign
   approval_needed_subject      = getTermLabel("GRS_APPROVAL_NEEDED",35)
   ready_for_purchasing_subject = getTermLabel("GRS_READY_FOR_PURCHASING",35)
   no_action_subject            = getTermLabel("GRS_NO_ACTION_REQUIRED",35)
   l_denied_subject             = getTermLabel("GRS_REQ_DENY",35).

form
   action_desc     colon 14
   rqm_mstr.rqm_nbr     colon 14
/*c1267*/ vSite        colon 14
/*c1267*/ vSiteDesc    no-label
   rqm_req_date        colon 14
   rqm_need_date       colon 14
   rqm_due_date        colon 14
   rqm_rqby_userid     colon 14
   rqm_eby_userid      colon 14
   rqm_end_userid      colon 14
   rqm_rtto_userid colon 14
   rqm_reason          colon 14
   rqm_rmks            colon 14
   rqm_aprv_stat   colon 14
   si_db       colon 14
with frame b side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

form
   comment_line[01]    at 1
   comment_line[02]    at 1
   comment_line[03]    at 1
   comment_line[04]    at 1
   comment_line[05]    at 1
   comment_line[06]    at 1
   comment_line[07]    at 1
   comment_line[08]    at 1
   comment_line[09]    at 1
   comment_line[10]    at 1
   comment_line[11]    at 1
   comment_line[12]    at 1
   comment_line[13]    at 1
   comment_line[14]    at 1
   comment_line[15]    at 1
with frame aprcmmts no-labels width 80
   title color normal (getFrameTitle("APPROVAL_COMMENTS",25)).

for first rqm_mstr where recid(rqm_mstr) = p_rqm_recid no-lock:
end.
p_email_sent_to = "".
if rqm_email_opt = EMAIL_OPT_NO_EMAIL then leave.

/*c1267* start added code */
find first si_mstr no-lock
where si_domain = global_domain
and   si_site = rqm_site
no-error.
vSite = rqm_site.
vSiteDesc = "Site not found".
if available si_mstr
then do:
  vSiteDesc = si_desc.
end.
/*c1267* end   added code */

/***********************/
/*BUILD EMAIL TEXT BODY*/
/***********************/

/*GET ACTION DESCRIPTION*/

{us/gp/gplngn2a.i
   &file=""rqh_hist""
   &field=""rqh_action""
   &code=p_action
   &mnemonic=dummychar
   &label=action_desc}

/*GET APPROVAL STATUS DESCRIPTION*/

{us/gp/gplngn2a.i
   &file=""rqm_mstr""
   &field=""rqm_aprv_stat""
   &code=rqm_aprv_stat
   &mnemonic=approval_stat_entry
   &label=approval_stat_desc}

/*DISPLAY DATA TO THE OUTPUT FILE*/

output_filename = mfguser + ".rqe".
output to value(output_filename).

display
   action_desc
   rqm_nbr
/*c1267*/ vSite vSiteDesc
   rqm_req_date
   rqm_need_date
   rqm_due_date
   rqm_rqby_userid
   rqm_eby_userid
   rqm_end_userid
   rqm_rtto_userid
   rqm_reason
   rqm_rmks
   approval_stat_desc @ rqm_aprv_stat
   global_db          @ si_db
with frame b.

/*...REQ TOTALS*/

{us/bbi/gprun.i ""rqtotds2.p""
   "(input recid(rqm_mstr), output total_frame_hdl)"}

/*...COMMENTS:  GET LAST 15 LINES*/

commentloop:
for each cmt_det no-lock  where cmt_det.cmt_domain = global_domain and
cmt_indx = rqm_apr_cmtindx
      by cmt_indx descending by cmt_seq descending:
   do i = 15 to 1 by -1:
      if cmt_cmmt[i] <> "" and line_count < 15 then do:
         line_count = line_count + 1.
         temp_comment_line[line_count] = cmt_cmmt[i].
      end.

      if line_count >= 15 then leave commentloop.
   end.
end.

/*...COMMENTS:  REVERSE ORDER*/

do i = 1 to line_count:
   comment_line[i] = temp_comment_line[line_count - i + 1].
end.

/*...COMMENTS:  DISPLAY*/

display
   comment_line[01]
   comment_line[02]
   comment_line[03]
   comment_line[04]
   comment_line[05]
   comment_line[06]
   comment_line[07]
   comment_line[08]
   comment_line[09]
   comment_line[10]
   comment_line[11]
   comment_line[12]
   comment_line[13]
   comment_line[14]
   comment_line[15]
with frame aprcmmts.

output close.

if p_action = ACTION_ROUTE then do:
   /*SEND EMAIL TO ROUTE-TO*/

   if rqm_rtdto_purch then
      subject = ready_for_purchasing_subject + " " + rqm_nbr.
   else
      subject = approval_needed_subject + " " + rqm_nbr.

   run send_email(input subject, input rqm_rtto_userid).

   if rqm_email_opt = EMAIL_OPT_EXTENDED then do:
      /*SEND EMAIL TO REQUESTER AND END USER*/

      subject = no_action_subject + " " + rqm_nbr.
      run send_email(input subject, input rqm_rqby_userid).
      run send_email(input subject, input rqm_end_userid).
   end.
end.
else
   if p_action = ACTION_ROUTE_REVERSE then do:
   /*SEND EMAIL TO ROUTE-TO*/

   subject = no_action_subject + " " + rqm_nbr.
   run send_email(input subject, input rqm_rtto_userid).

   if rqm_email_opt = EMAIL_OPT_EXTENDED then do:
      /*SEND EMAIL TO REQUESTER AND END USER*/

      subject = no_action_subject + " " + rqm_nbr.
      run send_email(input subject, input rqm_rqby_userid).
      run send_email(input subject, input rqm_end_userid).
   end.
end.
else
if p_action = ACTION_MODIFY_REQ
   or p_action = ACTION_DELETE_REQ
then do:
   /*SEND EMAIL TO ROUTE-TO*/

   subject = no_action_subject + " " + rqm_nbr.
   run send_email(input subject, input rqm_rtto_userid).

   if rqm_email_opt = EMAIL_OPT_EXTENDED then do:
      /*SEND EMAIL TO REQUESTER AND END USER*/

      subject = no_action_subject + " " + rqm_nbr.
      run send_email(input subject, input rqm_rqby_userid).
      run send_email(input subject, input rqm_end_userid).
   end.
end.
else
   if p_action = ACTION_MARK_OOT then do:
   /*SEND EMAIL TO REQUESTER AND END USER*/

   subject = no_action_subject + " " + rqm_nbr.
   run send_email(input subject, input rqm_rqby_userid).
   run send_email(input subject, input rqm_end_userid).
end.

/* SEND EMAIL TO:                                                            */
/* 1) REQUESTOR IF REQUISITION IS DENIED AND EMAIL OPTION IS REGULAR;        */
/* 2) REQUESTOR & USER IF REQUISITION IS DENIED AND EMAIL OPTION IS EXTENDED */
else
   if p_action = ACTION_DENY
   then do:
      subject  = l_denied_subject + " " + rqm_nbr.
      run send_email (input subject,
                      input rqm_rqby_userid).
      if rqm_email_opt = EMAIL_OPT_EXTENDED
      then
         run send_email (input subject,
                         input rqm_end_userid).
   end. /* IF p_action = ACTION_DENY */

p_email_sent_to = email_already_sent_to.
os-delete value(output_filename).

/******************************************************/
/******************************************************/

/**                 PROCEDURES                       **/
/**                                                  **/
/******************************************************/
/******************************************************/

PROCEDURE send_email:
   define input parameter p_subject as character no-undo.
   define input parameter p_userid as character no-undo.

   define variable email_return_code as integer no-undo.
   define variable email_return_userid as character no-undo.

   define variable EmployeeAddress   as EmployeeAddressByEmpCoCode no-undo.
   define variable hQADFinancialsLib as handle                     no-undo.
   define variable l_enduser_email   as character                  no-undo.

   if p_userid = "" then leave.
   if lookup(p_userid,email_already_sent_to) > 0 then leave.

   if can-find (first usr_mstr 
      where usr_userid = p_userid)
   then do:
      {us/bbi/gprun.i ""mgemsend.p""
         "(input p_userid,
           input '',
           input p_subject,
           input output_filename,
           input '',
           input false,
           input ?,
           output email_return_code,
           output email_return_userid)"}
   end. /* IF AVAILABLE usr_mstr */
   else do:
      for first emp_mstr
         where emp_domain = global_domain
         and   emp_addr   = p_userid
      no-lock:
         /* Run the data object class to return the employee address info    */
         /* Input Parameters: EmployeeCode,AddressType,CompanyCode,CompanyId */
         do on error undo, throw:
            EmployeeAddress = new EmployeeAddressByEmpCoCode(emp_addr,
                                                             "HEADOFFICE",
                                                             emp_entity,
                                                             ?).
            catch anError as Progress.Lang.Error:
               /* Start qflib.p - QAD Financials Library running persistently */
               run mfairunh.p
               (input 'qflib.p',
                input '?',
                output hQADFinancialsLib) no-error.
               run processExceptions in hQADFinancialsLib (input anError).
            end catch.
         end. /* DO ON ERROR UNDO, THROW */
         if EmployeeAddress:Available
         then
           l_enduser_email = EmployeeAddress:AddressEMail.

         {us/bbi/gprun.i ""mgemsend.p""
            "(input p_userid,
              input l_enduser_email,
              input p_subject,
              input output_filename,
              input '',
              input false,
              input ?,
              output email_return_code,
              output email_return_userid)"}
      end. /* FOR FIRST emp_mstr */
   end. /* IF NOT AVAILABLE usr_mstr */

   if email_return_code <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=email_return_code &ERRORLEVEL=2}
   end.

   if email_already_sent_to > "" then
      email_already_sent_to = email_already_sent_to + ",".

   email_already_sent_to = email_already_sent_to + p_userid.

   if valid-object(EmployeeAddress)
      and EmployeeAddress:Available = yes
   then do:
      delete object EmployeeAddress no-error.
   end. /* IF valid-object(EmployeeAddress) ... */
end.
