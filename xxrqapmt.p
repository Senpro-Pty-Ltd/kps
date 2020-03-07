/* xxrqapmt.p   - REQUISITION APPROVAL                                        */
/* rqapmt.p   - REQUISITION APPROVAL                                          */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqapmt.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* Revision: 8.6    LAST MODIFIED BY: 05/05/97  By: B. Gates          *J1Q2*  */
/* REVISION: 8.6E   LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane            */
/* REVISION: 8.6E   LAST MODIFIED: 03/13/98   BY: B. Gates *J2GM*             */
/* REVISION: 8.6E   LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan           */
/* REVISION: 8.6E   LAST MODIFIED: 06/11/98   BY: *L040* Charles Yen          */
/* REVISION: 8.5    LAST MODIFIED: 09/13/98   BY: *J301* Patrick Rowan        */
/* REVISION: 8.6E   LAST MODIFIED: 01/13/99   BY: *J38J* Steve Nugent         */
/* REVISION: 8.6E   LAST MODIFIED: 09/09/99   BY: *J39R* Reetu Kapoor         */
/* REVISION: 9.1    LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane     */
/* REVISION: 9.1    LAST MODIFIED: 08/12/00   BY: *N0KP* Mark Brown           */
/* Revision: 1.13.1.4       BY: Indu Arora        DATE: 06/07/01  ECO: *N0YZ* */
/* Revision: 1.13.1.5       BY: Jean Miller       DATE: 03/04/02  ECO: *N1BS* */
/* Revision: 1.13.1.7       BY: Jean Miller       DATE: 03/06/02  ECO: *N1BW* */
/* Revision: 1.13.1.8       BY: Dan Herman        DATE: 12/30/02  ECO: *N236* */
/* Revision: 1.13.1.9       BY: Dan Herman        DATE: 01/14/03  ECO: *N245* */
/* Revision: 1.13.1.10      BY: Subramanian Iyer  DATE: 01/22/03  ECO: *N24V* */
/* Revision: 1.13.1.12      BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00K* */
/* Revision: 1.13.1.14      BY: Manish Dani       DATE: 02/19/04  ECO: *P1PK* */
/* Revision: 1.13.1.15      BY: Prashant Parab    DATE: 04/23/04  ECO: *P1YR* */
/* Revision: 1.13.1.16      BY: Nishit V          DATE: 04/29/04  ECO: *P1ZB* */
/* Revision: 1.13.1.17      BY: Shoma Salgaonkar  DATE: 04/05/05  ECO: *P3FV* */
/* Revision: 1.13.1.18      BY: Deirdre O'Brien   DATE: 08/10/05  ECO: *P3XM* */
/* Revision: 1.1.1.3        BY: Geeta Kotian      DATE: 12/13/05  ECO: *P4BP* */
/* Revision: 1.13.1.21      BY: Meng Ge           DATE: 03/27/07  ECO: *R0C6* */
/* Revision: 1.13.1.27      BY: Abhijit Gupta     DATE: 02/18/08  ECO: *P6J5* */
/* Revision: 1.13.1.28      BY: Vivek Kamath      DATE: 02/20/08  ECO: *P6LR* */
/* Revision: 1.13.1.29      BY: Vivek Kamath      DATE: 03/07/08  ECO: *P6N4* */
/* Revision: 1.13.1.30      BY: Devna Sahai       DATE: 05/19/08  ECO: *Q1JN* */
/* Revision: 1.13.1.31      BY: Chandrakant Ingale DATE: 08/06/09  ECO: *Q36R* */
/* Revision: 1.13.1.32      BY: Ravi Swami         DATE: 11/26/09  ECO: *Q3N2* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1227*                     */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1228*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/mf/mfdtitle.i "4+ "}
{us/px/pxmaint.i}
{us/rq/rqconst.i}

/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}

/* Requisition Approval API dataset definition */
{us/rq/rqapds.i "reference-only"}

define new shared variable approver like rqa_apr no-undo.
define new shared variable what_to_view as logical
   label "View Queue/Dispositioned" format "Queue/Dispositioned"
   initial true no-undo.
define new shared variable cmtindx as integer.
define variable approvals_completed as logical no-undo.
define variable reqnbr    like rqm_mstr.rqm_nbr.
define variable continue  as logical no-undo.
define variable route_req like mfc_logical no-undo.
define variable alternate_ok as logical no-undo.
define variable all_info_correct like mfc_logical no-undo.

define variable QUEUE as logical initial true no-undo.
define variable DISPOSITIONED as logical initial false no-undo.
define variable APPROVED as logical initial false no-undo.

define variable view_requisition like mfc_logical
   label "View Requisition" no-undo.
define variable modify_requisition like mfc_logical
   label "Modify Requistion" no-undo.
define variable approval_comments like mfc_logical
   label "Maintain Aprvl Comments" no-undo.
define variable date_time as character no-undo.
define variable exchg_rate as decimal no-undo.
define variable exchg_rate2 as decimal no-undo.
define variable exch-error-number like msg_nbr no-undo.
define variable l_option as character format "x(36)".
define variable other-browse as character no-undo.
define variable reset_on_denial like mfc_logical no-undo.
define variable rqdarecno as recid no-undo.
define variable ttcalrecno as recid no-undo.
define variable l_email_sent_to as character no-undo.

define variable l_prod_line_total as decimal no-undo.
define variable l_category_total  as decimal no-undo.
define variable l_req_max_total   as decimal no-undo.
define variable mc-error-number like msg_nbr no-undo.
define variable l_error     like mfc_logical no-undo.
define variable l_poc_pt_req like poc_pt_req no-undo.

for first poc_ctrl
   where poc_domain = global_domain
no-lock:
   l_poc_pt_req = poc_pt_req.
end. /* FOR FIRST poc_ctrl */

for first mfc_ctrl
   where mfc_domain = global_domain
     and  mfc_field = "poc_pt_req"
no-lock :
   l_poc_pt_req = mfc_logical.
end. /* FOR FIRST mfc_ctrl */

{us/rq/rqalttd.i new} /*APPROVER LIST TEMPTABLE DEFINITIONS*/

/* In .NetUI, there is duplication of DB field names with same frame name.
   This is avoided by renaming the current frame name from "a" to "frm".
   The second frame "a" is in rqrtmt0.p procedure. */

form
   what_to_view            colon 30
   approver                colon 30
   usr_name                no-label
   reqnbr                  colon 30
   skip(1)
   view_requisition        colon 30
   modify_requisition      colon 30
   approval_comments       colon 30
   action_entry            colon 30 format "x(1)"
   l_option                no-label
with frame frm side-labels width 80.

/* SET EXTERNAL LABELS */
if c-application-mode <> "API" then do:
   setFrameLabels(frame frm:handle).

   l_option:screen-value in frame frm =
       "1=" + getTermLabel("APPROVE",10) +
       " 2=" + getTermLabel("DENY",8) +
       " 3=" + getTermLabel("REVERSE",10).
end. /* if c-application-mode <> "API" */

if c-application-mode = "API" then do on error undo, return:

   /* Get handle of API Controller */
   {us/bbi/gprun.i ""gpaigach.p"" "(output ApiMethodHandle)"}

   if not valid-handle(ApiMethodHandle) then do:
      /* API Error */
      {us/bbi/pxmsg.i &MSGNUM=10461 &ERRORLEVEL=4}
      return.
   end.

   /* Get the Item API dataset from the controller */
   run getRequestDataset in ApiMethodHandle (output dataset dsRequisitionApproval bind).

end.  /* If c-application-mode = "API" */

find first gl_ctrl where gl_domain = global_domain no-lock.

find first rqf_ctrl where rqf_domain = global_domain no-lock.

if available rqf_ctrl then
   reset_on_denial  = if rqf__qadc02 = "yes" then yes
                      else no.


/*GET MOST RECENTLY ACCESSED REQ NUMBER AND DISPLAY*/
{us/bbi/gprun.i ""rqidf.p""
   "(input 'get', input 'reqnbr', input-output reqnbr)"}

if c-application-mode <> "API" then
   display reqnbr with frame frm.

/* GET MOST RECENTLY ACCESSED APPROVER AND DISPLAY*/
/* approver IS THE LOGIN ID OF THE CURRENT USER */
approver = global_userid.
if c-application-mode <> "API" then
   display approver with frame frm.

mainloop:
repeat:

   if c-application-mode = "API" and retry then
      leave mainloop.
      
   do transaction:
      
      if c-application-mode = "API" and retry then
         leave mainloop.
         
      if c-application-mode <> "API" then
         update what_to_view with frame frm.

      /* Determine which lookup to run */
      if what_to_view then
         other-browse = "".
      else
         other-browse = "rqlu013.p".
      {us/bbi/gprun.i ""gpbranch.p""
         "(input 'rqlu012.p', input other-browse)"}

      /* Get the Requisition Approval record from the API controller */
      if c-application-mode = "API" then do:
         run getNextRecord in ApiMethodHandle (input "ttRequisitionApproval").
         if return-value = {&RECORD-NOT-FOUND} then
            leave mainloop.
      end. /* if c-application-mode = "API" */

      do on error undo, retry:
         if c-application-mode = "API" and retry then
            undo mainloop, leave mainloop.
         
         if c-application-mode <> "API" then do:   
            set approver with frame frm
            editing:
               {us/mf/mfnp.i usr_mstr approver usr_userid approver usr_userid
                  usr_userid }
               if recno <> ? then do:
                  display
                     usr_userid @ approver
                     usr_name
                  with frame frm.
               end.
            end.
         end. /* if c-application-mode <> "API" */
         else do:
            assign
               {us/mf/mfaidflt.i ttRequisitionApproval.Approver approver}   
               approver = ttRequisitionApproval.Approver.
         end. /* c-application-mode = "API" */
         
         find usr_mstr where usr_userid = approver no-lock no-error.

         if not available usr_mstr then do:
            /*USER ID DOES NOT EXIST*/
            {us/bbi/pxmsg.i &MSGNUM=5065 &ERRORLEVEL=3}
            undo, retry.
         end.
         else if not usr_active then do:
            /* User is not active for selection */
            {us/bbi/pxmsg.i &MSGNUM=10163 &ERRORLEVEL=3}
            undo, retry.
         end.

         if c-application-mode <> "API" then
            display usr_name with frame frm.
      end.

      /*PASS APPROVER VALUE TO LOOKUP BROWSES*/
      {us/gp/gpbrparm.i &browse=rqlu012.p &parm=c-brparm1 &val=approver}
      {us/gp/gpbrparm.i &browse=rqlu013.p &parm=c-brparm1 &val=approver}

      do on error undo, retry:
         
         if c-application-mode = "API" and retry then
            undo mainloop, leave mainloop.
         
         if c-application-mode <> "API" then do:   
            set reqnbr with frame frm editing:
               if what_to_view = DISPOSITIONED then do:
                  /*LOOK AT THE APPROVER DETAIL FILE FOR EXT'G
                    APPROVALS/DENIALS*/
                  {us/mf/mfnp05.i rqda_det
                     rqda_apr_userid
                     " rqda_det.rqda_domain = global_domain and rqda_apr_userid  =
                     approver"
                     rqda_nbr
                     "input frame frm reqnbr"}

                  if recno <> ? then
                     display rqda_nbr @ reqnbr with frame frm.

               end. /* if what_to_view = DISPOSITIONED */

               else do:
                  /*LOOK AT REQS ROUTED TO THIS APPROVER*/
                  {us/mf/mfnp05.i rqm_mstr
                     rqm_rtto
                     " rqm_mstr.rqm_domain = global_domain and rqm_rtto_userid  =
                     approver and rqm_open"
                     rqm_nbr
                     "input frame frm reqnbr"}

                  if recno <> ? then
                     display rqm_nbr @ reqnbr with frame frm.

               end.

            end.
         end. /* if c-application-mode <> "API" */
         else do:
            assign
               reqnbr = ttRequisitionApproval.RequisitionNumber.
         end. /* c-application-mode = "API" */
         
         find rqm_mstr where rqm_domain = global_domain and rqm_nbr = reqnbr
         exclusive-lock no-error.

         if not available rqm_mstr then do:
            /* REQUISITION DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=193 &ERRORLEVEL=3}
            undo, retry.
         end.

         if rqm_status <> LINE_STATUS_OPEN then do:

            if rqm_status = LINE_STATUS_CLOSED
            then do:
               /* REQUISITION IS CLOSED */
               {us/bbi/pxmsg.i &MSGNUM=3325 &ERRORLEVEL=3}
               undo, retry.
            end.

            else do:
               /* REQUISITION IS CANCELLED */
               {us/bbi/pxmsg.i &MSGNUM=2118 &ERRORLEVEL=3}
               undo, retry.
            end.

         end.

         if rqm_rtdto_purch then do:
            /*REQUISITION ROUTED TO PURCHASING*/
            {us/bbi/pxmsg.i &MSGNUM=2106 &ERRORLEVEL=2}
         end.

         /*ENSURE CURRENT EXCHANGE RATE TO APPROVAL CURRENCY*/
         find first rqf_ctrl where rqf_domain = global_domain no-lock.

         {us/bbi/gprun.i ""rqexrt.p""
            "(input rqm_curr,
              input rqf_appr_curr,
              input rqm_ex_ratetype,
              output exchg_rate,
              output exchg_rate2,
              output exch-error-number)"}

         if exch-error-number <> 0 then do:
            /*NO EXCHANGE RATE FOR APPROVAL CURRENCY*/
            {us/bbi/pxmsg.i &MSGNUM=2087 &ERRORLEVEL=3}
            undo, retry.
         end.

         if approver <> rqm_rtto_userid then do:
            /*REQUISITION CURRENTLY ROUTED TO*/
            {us/bbi/pxmsg.i &MSGNUM=2094 &ERRORLEVEL=2 &MSGARG1=rqm_rtto_userid}
         end.

      end.

      /*SAVE ACCESSED REQ NUMBER FOR OTHER PGMS TO USE*/
      {us/bbi/gprun.i ""rqidf.p""
         "(input 'put', input 'reqnbr', input-output reqnbr)"}

      /*SAVE APPROVER ID FOR OTHER PGMS TO USE*/
      {us/bbi/gprun.i ""rqidf.p""
         "(input 'put', input 'approver', input-output approver)"}

      if c-application-mode <> "API" then do:
         display
            view_requisition
            modify_requisition
            approval_comments
         with frame frm.

         if what_to_view = QUEUE then
            display "1" @ action_entry with frame frm.
         else
            display "3" @ action_entry with frame frm.

         hide message no-pause.
      end. /* if c-application-mode <> "API" */
      
      /*BUILDING APPROVER LIST...*/.
      {us/bbi/pxmsg.i &MSGNUM=2078 &ERRORLEVEL=1}
      {us/bbi/gprun.i ""rqbal.p"" "(input recid(rqm_mstr))"}
      if c-application-mode <> "API" then
         hide message no-pause.

      if approver <> rqm_rtto_userid then do:
         /*REQUISITION CURRENTLY ROUTED TO*/
         {us/bbi/pxmsg.i &MSGNUM=2094 &ERRORLEVEL=2 &MSGARG1=rqm_rtto_userid}
      end.

      /*VIEW REQUISITION DETAIL IF REQUESTED */
      if c-application-mode <> "API" then do:
         set view_requisition with frame frm.

         if view_requisition then do:
            hide frame frm no-pause.
/*c1227*            {us/bbi/gprun.i ""rqrqiq1a.p""} */
/*c1227*/   {us/bbi/gprun.i ""xxrqiq1a.p""}
            view frame frm.
         end.
      end. /* if c-application-mode <> "API" */
      
      /*MODIFY REQUISITION IF REQUESTED*/
      if c-application-mode <> "API" then 
      do on error undo, retry:

         set modify_requisition with frame frm.

         if modify_requisition and global_userid <> approver then do:
            {us/bbi/gprun.i ""rqckalt.p""
               "(input approver, input global_userid,
                 output alternate_ok)"}

            if not alternate_ok then do:
               for each rqa_mstr where rqa_domain = global_domain and
                  rqa_apr = approver
               no-lock:
                  if global_userid = rqa_alt_apr[1] or
                     global_userid = rqa_alt_apr[2] or
                     global_userid = rqa_admin_apr
                  then
                     alternate_ok = true.
               end. /* for each rqa_mstr */
            end. /* if not alternate_ok */

            if not alternate_ok then do:
               /*YOU ARE NOT AN ALTERNATE FOR THIS APPROVER*/
               {us/bbi/pxmsg.i &MSGNUM=2073 &ERRORLEVEL=3}
               undo, retry.
            end.
         end.
      end.

      /* Requisition Approval API does not support modifying an existing requisition */
      if modify_requisition and c-application-mode <> "API" then do:

         l_error = no.

         hide frame frm no-pause.
         {us/bbi/gprun.i ""rqrqmt0.p""}
         view frame frm.

         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
            "(input rqm_curr,
              input rqf_appr_curr,
              input exchg_rate,
              input exchg_rate2,
              input rqm_max_total,
              input false, /* DO NOT ROUND */
              output l_req_max_total,
              output mc-error-number)"}

         if rqm_direct
         then do:

            for each rqd_det
               fields (rqd_aprv_stat rqd_category rqd_domain
                       rqd_max_cost  rqd_nbr      rqd_part
                       rqd_req_qty   rqd_site     rqd_status)
               where rqd_domain = global_domain
               and   rqd_nbr    = rqm_nbr
               and   rqd_status = LINE_STATUS_OPEN
            no-lock,
                each pt_mstr
               fields (pt_domain pt_part pt_prod_line)
               where pt_domain = global_domain
               and   pt_part   = rqd_part
            no-lock
               break by rqd_site
                     by pt_prod_line:

               if first-of(pt_prod_line)
               then
                  l_prod_line_total = 0.

               l_prod_line_total = l_prod_line_total
                                 + (rqd_req_qty * rqd_max_cost).

               if last-of(pt_prod_line)
               then do:

                  /* OBTAINING PRODUCT LINE TOTAL IN APPROVAL CURRENCY */
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                     "(input rqm_curr,
                       input rqf_appr_curr,
                       input exchg_rate,
                       input exchg_rate2,
                       input l_prod_line_total,
                       input false, /* DO NOT ROUND */
                       output l_prod_line_total,
                       output mc-error-number)"}

                  for first rqa_mstr
                     where rqa_domain          = global_domain
                     and   rqa_apr             = approver
                     and   rqa_type            = DIRECT
                     and   rqa_apr_req         = yes
                     and   rqa_site            = rqd_site
                     and   rqa_prod_line       = pt_prod_line
                     and   rqa_entity          = ""
                     and   rqa_job             = ""
                     and   rqa_category        = ""
                     and   rqa_sub_from       <= rqm_sub
                     and   (rqa_sub_to        >= rqm_sub
                           or rqa_sub_to       = "")
                     and   rqa_cc_from        <= rqm_cc
                     and   (rqa_cc_to         >= rqm_cc
                           or rqa_cc_to        = "")
                     and   (rqa_start         <= today
                           or rqa_start        = ?)
                     and   (rqa_end           >= today
                           or rqa_end          = ?)
                  no-lock:

                     find first rql_mstr
                        where rql_domain = global_domain
                        and   rql_level  = rqa_apr_level
                        and   rql_amt    >= l_prod_line_total
                     no-lock no-error.
                     if not available rql_mstr
                     then
                        l_error = true.
                     else
                        l_error = false.
                  end. /* FOR FIRST rqa_mstr */
               end. /* IF LAST-OF(pt_prod_line) */
            end. /* FOR EACH rqd_det */

            if l_error
            then do:
               /* REQUISITION AMOUNT EXCEEDED APPROVAL */
               /* LIMIT. APPROVAL DENIED */
               {us/bbi/pxmsg.i &MSGNUM=6936 &ERRORLEVEL=4}
               undo, retry.
            end. /* IF l_error */
         end. /* IF rqm_direct THEN DO */

         else do:

            for each rqd_det
               fields (rqd_aprv_stat rqd_category rqd_domain
                       rqd_max_cost  rqd_nbr      rqd_part
                       rqd_req_qty   rqd_site     rqd_status)
               where rqd_domain   = global_domain
               and   rqd_nbr      = rqm_nbr
               and   rqd_status   = LINE_STATUS_OPEN
               and   rqd_category > ""
            no-lock
            break by rqd_category:

               if first-of(rqd_category)
               then
                  l_category_total = 0.

               l_category_total = l_category_total
                                + (rqd_req_qty * rqd_max_cost).

               if last-of(rqd_category)
               then do:

                  /* OBTAINING CATEGORY TOTAL IN APPROVAL CURRENCY */
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                     "(input rqm_curr,
                       input rqf_appr_curr,
                       input exchg_rate,
                       input exchg_rate2,
                       input l_category_total,
                       input false, /* DO NOT ROUND */
                       output l_category_total,
                       output mc-error-number)"}

                  for first rqa_mstr
                     where rqa_domain          = global_domain
                     and   rqa_apr             = approver
                     and   rqa_type            = HORIZONTAL
                     and   rqa_apr_req         = yes
                     and   (rqa_entity         = rqm_entity
                           or rqa_entity       = "")
                     and   rqa_job             = ""
                     and   rqa_category        = rqd_category
                     and   rqa_sub_from       <= rqm_sub
                     and   (rqa_sub_to        >= rqm_sub
                           or rqa_sub_to       = "")
                     and   rqa_cc_from        <= rqm_cc
                     and   (rqa_cc_to         >= rqm_cc
                           or rqa_cc_to        = "")
                     and   (rqa_start         <= today
                           or rqa_start        = ?)
                     and   (rqa_end           >= today
                           or rqa_end          = ?)
                  no-lock:

                     find first rql_mstr
                        where rql_domain = global_domain
                        and   rql_level  = rqa_apr_level
                        and   rql_amt    >= l_category_total
                     no-lock no-error.

                     if not available rql_mstr
                     then
                        l_error = true.
                     else
                        l_error = false.
                  end. /* FOR FIRST rqa_mstr */
               end. /* IF LAST-OF(rqd_category) */
            end. /* FOR EACH rqd_det */

            if not l_error
            then do:

               if rqm_job > ""
               then do:
                  for first rqa_mstr
                     where rqa_domain          = global_domain
                     and   rqa_apr             = approver
                     and   rqa_type            = JOB
                     and   rqa_apr_req         = yes
                     and   rqa_site            = ""
                     and   rqa_prod_line       = ""
                     and   (rqa_entity         = rqm_entity
                           or rqa_entity       = "")
                     and   rqa_job             = rqm_job
                     and   rqa_category        = ""
                     and   rqa_sub_from       <= rqm_sub
                     and   (rqa_sub_to        >= rqm_sub
                           or rqa_sub_to       = "")
                     and   rqa_cc_from        <= rqm_cc
                     and   (rqa_cc_to         >= rqm_cc
                           or rqa_cc_to        = "")
                     and   (rqa_start         <= today
                           or rqa_start        = ?)
                     and   (rqa_end           >= today
                           or rqa_end          = ?)
                  no-lock:

                     find first rql_mstr
                        where rql_domain = global_domain
                        and   rql_level  = rqa_apr_level
                        and   rql_amt    >= l_req_max_total
                     no-lock no-error.

                     if not available rql_mstr
                     then
                        l_error = true.
                     else
                        l_error = false.
                  end. /* FOR FIRST rqa_mstr */
               end. /* IF rqm_job > "" */
            end. /* IF l_error THEN DO */

            if not l_error
            then do:

               for first rqa_mstr
                  where rqa_domain    = global_domain
                  and   rqa_apr       = approver
                  and   rqa_type      = vertical
                  and   rqa_apr_req   = yes
                  and   rqa_site      = ""
                  and   rqa_prod_line = ""
                  and   (rqa_entity   = rqm_entity
                        or rqa_entity = "")
                  and   rqa_job       = ""
                  and   rqa_category  = ""
                  and   rqa_sub_from  <= rqm_sub
                  and   (rqa_sub_to   >= rqm_sub
                        or rqa_sub_to = "")
                  and   rqa_cc_from   <= rqm_cc
                  and   (rqa_cc_to    >= rqm_cc
                        or rqa_cc_to  = "")
                  and   (rqa_start    <= today
                        or rqa_start  = ?)
                  and   (rqa_end      >= today
                        or rqa_end    = ?)
               no-lock:

                  find first rql_mstr
                      where rql_domain = global_domain
                      and   rql_level  = rqa_apr_level
                      and   rql_amt    >= l_req_max_total
                 no-lock no-error.

                 if not available rql_mstr
                 then
                    l_error = true.
                 else
                    l_error = false.
               end. /* FOR FIRST rqa_mstr */
            end. /* IF l_error THEN DO */

            if l_error
            then do:
               /* REQUISITION AMOUNT EXCEEDED APPROVAL */
               /* LIMIT. APPROVAL DENIED */
               {us/bbi/pxmsg.i &MSGNUM=6936 &ERRORLEVEL=4}
               undo, retry.
            end. /* IF l_error THEN DO */
         end. /* ELSE DO */

      end.

      /*ENTER APPROVAL COMMENTS IF REQUESTED*/
      if c-application-mode <> "API" then
         set approval_comments with frame frm.
      else
         approval_comments = true.
         
      if approval_comments then do:
         /* Let the API controller know the name of the transaction */
         /* comments buffer.                                        */
         if c-application-mode = "API" then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "ttRequisitionApprovalComment").
         end. /* c-application-mode = "API" */

         assign
            global_ref = rqm_vend
            cmtindx = rqm_apr_cmtindx.
         {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""rqm_mstr"")"}
         rqm_apr_cmtindx = cmtindx.
         
         if c-application-mode = "API" then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "").
         end. /* c-application-mode = "API" */
      end.

      /*GET THE DESIRED ACTION*/
      do on error undo, retry:
         if c-application-mode = "API" and retry then
            undo mainloop, leave mainloop.
         
         if c-application-mode <> "API" then   
            set action_entry with frame frm.
         else
            action_entry = ttRequisitionApproval.Action.
            
         if action_entry <> ACTION_APPROVE
            and action_entry <> ACTION_DENY
            and action_entry <> ACTION_REVERSE
         then do:
            /* Invalid Action */
            {us/bbi/pxmsg.i &MSGNUM=2052 &ERRORLEVEL=3}
            undo, retry.
         end.

         /* CHECK ALL THE TEMP TABLES TO SEE IF APPROVER EXISTS */
         if not (    (can-find(first ttcal
                               where ttcal_apr_userid = approver))
                  or
                     (can-find(first tthal
                               where tthal_apr_userid = approver))
                  or
                     (can-find(first ttval
                               where ttval_apr_userid = approver))
                  or
                     (can-find(first ttdal
                               where ttdal_apr_userid = approver))
                  or
                     (can-find(first ttjal
                               where ttjal_apr_userid = approver))
                  or
                     ( can-find(first ttalt
                                where ttalt_apr_userid = approver
                                or    ttalt_alt_userid = approver)) )

         then do:

            /* You must be the enterer, requestor, or current route-to */
            {us/bbi/pxmsg.i &MSGNUM=2113 &ERRORLEVEL=3}
            undo mainloop, retry mainloop.

         end. /* IF NOT CAN-FIND(first ttalt... */

      end. /* DO ON ERROR UNDO, RETRY */

      /*WARN IF THE APPROVER ALREADY APPROVED/DENIED*/
      if action_entry = ACTION_APPROVE
      or action_entry = ACTION_DENY
      then do:

         find rqda_det where rqda_domain = global_domain
            and rqda_nbr = rqm_nbr
            and rqda_apr_userid = approver
         no-lock no-error.

         if available rqda_det then do:
            date_time = string(rqda_date) + " " +
                        string(rqda_time,"HH:MM:SS").

            if rqda_action = ACTION_APPROVE then do:
               /*YOU APPROVED THIS REQUISITION...*/
               {us/bbi/pxmsg.i &MSGNUM=2071 &ERRORLEVEL=2 &MSGARG1=date_time}
            end.
            else do:
               /*YOU DENIED THIS REQUISITION...*/
               {us/bbi/pxmsg.i &MSGNUM=2072 &ERRORLEVEL=2 &MSGARG1=date_time}
            end.
         end.
      end.

      /*CHECKS FOR ALTERNATE/ADMIN APPROVERS.  THE 3RD REQUIREMENT
        IS BECAUSE THE ENTERER IS ALWAYS AN ALTERNATE FOR THE
        REQUESTER.*/

      if      (action_entry  = ACTION_APPROVE
      or       action_entry  = ACTION_DENY
      or       action_entry  = ACTION_REVERSE)
      and      global_userid <> approver
      and not (global_userid = rqm_eby_userid
      and      approver      = rqm_rqby_userid)
      then do:

         {us/bbi/gprun.i ""rqckalt.p""
            "(input approver, input global_userid, output alternate_ok)"}

         if not alternate_ok
         then do:
            for each rqa_mstr
               where rqa_domain = global_domain
               and   rqa_apr    = approver
            no-lock:
               if global_userid = rqa_alt_apr[1]
               or global_userid = rqa_alt_apr[2]
               or global_userid = rqa_admin_apr
               or global_userid = rqm_rtto_userid
               then
                  alternate_ok = true.
               else
                  alternate_ok = false.
            end. /* for each rqa_mstr */
         end. /* if not alternate_ok */

         if not alternate_ok
         then do:
            /*YOU ARE NOT AN ALTERNATE FOR THIS APPROVER*/
            {us/bbi/pxmsg.i &MSGNUM=2073 &ERRORLEVEL=3}
            undo, retry.
         end. /* IF NOT alternate_ok */
      end. /* IF (action_entry */



      /*CHECKS REVERSALS*/
      if action_entry = ACTION_REVERSE then do:

         find rqda_det where rqda_domain = global_domain
                         and rqda_nbr = rqm_nbr
                         and rqda_apr_userid = approver
         no-lock no-error.

         if not available rqda_det
         then do:
            if approver = global_userid
            then do:
               /*YOU HAVE NOT APPROVED/DENIED THIS REQUISITION */
               {us/bbi/pxmsg.i &MSGNUM=2067 &ERRORLEVEL=3}
               undo, retry.
            end. /* IF approver = */
            else do:
                /*YOU DID NOT ENTER THE APPROVAL/DENIAL FOR THIS APPROVER*/
               {us/bbi/pxmsg.i &MSGNUM=2068 &ERRORLEVEL=3}
               undo, retry.
            end. /* ELSE DO */
         end. /* IF NOT AVAILABLE rqda_det */
      end.


      if action_entry = "1"
      then do:
         /* ENSURE THE VALID PRICE LIST/ DISCOUNT TABLE */
         {us/px/pxrun.i &PROC='validatePriceListTable'
                  &PROGRAM='rqgrsxr.p'
                  &PARAM="(buffer rqm_mstr,
                           input l_poc_pt_req,
                           input poc_ctrl.poc_pl_req)"
                  &NOAPPERROR=true
                  &CATCHERROR=true}

         if return-value <> {&SUCCESS-RESULT}
         then do:
            if not batchrun
            then
               undo mainloop, retry mainloop.
            else
               undo mainloop, leave mainloop.
         end. /* IF RETURN-VALUE <> {&SUCCESS-RESULT}*/
      end. /* IF action_entry = "1"  */

      /*ASK IF OK TO DO IT*/
      all_info_correct = true.
      /* Is all information correct */
      if c-application-mode <> "API" then do:
         {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=all_info_correct}
      end. /* if c-application-mode <> "API" */
      if not all_info_correct then undo, leave.

      /*LET'S DO IT*/
      if action_entry = ACTION_APPROVE
      or action_entry = ACTION_DENY
      then do:

         /*CREATE APPROVAL RECORD IF NECESSARY AND MARK WITH APPROVE
           OR DENY*/
         find rqda_det where rqda_domain = global_domain
            and rqda_nbr = rqm_nbr
            and rqda_apr_userid = approver
         exclusive-lock no-error.

         if not available rqda_det then do:
            create rqda_det.
            assign
               rqda_domain = global_domain
               rqda_nbr = rqm_nbr
               rqda_apr_userid = approver.
         end.

         assign
            rqda_action = action_entry
            rqda_date = today
            rqda_time = time.

         /* Force the new record out to the DB.  This needs to be after the
          * rqda_action field is assigned.  Otherwise a find in rqcfa.p
          * will fail in Oracle
          */
         if recid(rqda_det) = -1 then.

         /* Force any updates to the record out to the DB. This will enable
          * a find in rqcfa.p  to work in Oracle
          */
         validate rqda_det no-error.

         /*MARK THE COMBINED APPROVER LIST RECORD WITH
           APPROVAL STATUS*/

         find ttcal where ttcal_apr_userid = approver no-lock no-error.

         if not available ttcal then do:
            create ttcal.
            assign
               ttcal_apr_userid = rqda_apr_userid
               ttcal_required = false.
         end.

         assign
            ttcal_apr_date = rqda_date
            ttcal_apr_time = rqda_time
            ttcal_apr_action = rqda_action.

         if reset_on_denial
        and action_entry = ACTION_DENY
         then do:

            assign
               rqdarecno  = recid(rqda_det)
               ttcalrecno = recid(ttcal).

            /* RESET ALL DETAIL RECORDS, HEADER AND APPROVER RECORDS TO DENY */
            for each rqd_det
               where rqd_domain = global_domain
               and   rqd_nbr    = rqm_nbr
            exclusive-lock:
               rqd_aprv_stat = APPROVAL_STATUS_UNAPPROVED.
            end. /* FOR EACH rqd_det */

            assign
               rqm_rtto_userid = if rqm_rqby_userid = ""
                                 then
                                    rqm_eby_userid
                                 else
                                    rqm_rqby_userid
               rqm_aprv_stat   = APPROVAL_STATUS_UNAPPROVED.

            for each rqda_det
               where rqda_domain = global_domain
               and   rqda_nbr    = rqm_nbr
               and   rqda_action = ACTION_APPROVE
            exclusive-lock:
               if recid(rqda_det) <> rqdarecno then delete rqda_det.
            end. /* FOR EACH rqda_det */

            /* GO BACK TO THE ORIGINAL RECORD */
            for first rqda_det
               where recid(rqda_det) = rqdarecno
            exclusive-lock:
               assign
                  rqda_action = ACTION_DENY
                  rqda_date   = today
                  rqda_time   = time.

               /* Force the record UPDATE out to the DB.  This will enable
                * a find later in the code to work in Oracle.
                */
               validate rqda_det no-error.
            end. /* FOR FIRST rqda_det */

            /* RESET ALL APPROVALS IN TEMP TABLE */
            for each ttcal
               where ttcal_apr_action = ACTION_APPROVE
            exclusive-lock:
               if recid(ttcal) <> ttcalrecno
               then
                  delete ttcal.
            end. /* FOR EACH ttcal */

            /* GO BACK TO THE ORIGINAL RECORD */
            for first ttcal
               where recid(ttcal) = ttcalrecno
            exclusive-lock:
               assign
                  ttcal_apr_date   = rqda_date
                  ttcal_apr_time   = rqda_time
                  ttcal_apr_action = rqda_action.
            end. /* FOR FIRST ttcal */

         end. /* If reset_on_denial */

     if action_entry = ACTION_DENY
     then do:

        /* SENT REQUESTOR AND REQUISITION DETAILS TO rqemsend.p TO */
        /* BE ABLE TO SEND EMAIL IN CASE REQUISITION IS DENIED.    */
        l_email_sent_to = "".
        {us/bbi/gprun.i ""rqemsend.p""
           "(input  recid(rqm_mstr),
             input  ACTION_DENY,
         output l_email_sent_to)"}

     end. /* IF action_entry = ACTION_DENY  */

         /* UPDATE THE REQUISITION APPROVAL STATUS */
/*q9006* {us/bbi/gprun.i ""rqcfa.p"" */
/*q9006*/ {us/bbi/gprun.i ""xxrqcfa.p""
            "(input rqm_nbr, output approvals_completed)"}

         if approvals_completed then do:
            for each rqd_det
               where rqd_domain = global_domain
                 and rqd_nbr = rqm_nbr
            exclusive-lock:
               rqd_aprv_stat = APPROVAL_STATUS_APPROVED.
            end.

            rqm_aprv_stat = APPROVAL_STATUS_APPROVED.
         end.

         /*WRITE HISTORY RECORD*/
         {us/bbi/gprun.i ""rqwrthst.p""
            "(input rqm_nbr,
              input 0,
              input action_entry,
              input approver,
              input '',
              input '')"}
      end.

      else
      if action_entry = ACTION_REVERSE then do:

         /*FOR REVERSAL WE SIMPLY DELETE THE APPROVAL RECORD*/
         find rqda_det where
              rqda_domain = global_domain and
              rqda_nbr = rqm_nbr and
              rqda_apr_userid = approver
         exclusive-lock no-error.

         if available rqda_det then delete rqda_det.

         /*WRITE HISTORY RECORD*/
         {us/bbi/gprun.i ""rqwrthst.p""
            "(input rqm_nbr,
              input 0,
              input action_entry,
              input approver,
              input '',
              input '')"}
      end.

   end. /*transaction*/

   /*GET NEXT ROUTE-TO*/
   if all_info_correct then do:

      route_req = rqm_rtto_userid = approver.

      /* Route this Requisition */
      if c-application-mode <> "API" then do:
         {us/bbi/pxmsg.i &MSGNUM=2083 &ERRORLEVEL=1 &CONFIRM=route_req}
      end.
      else
         route_req = true.
         
      if route_req then do:
         /* Let the API controller know the name of the requistion route buffer */
         if c-application-mode = "API" then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "ttRequisitionApprovalRoute").
         end. /* c-application-mode = "API" */
         
/*q9006* {us/bbi/gprun.i ""rqrtmt0.p""} */
/*q9006*/  {us/bbi/gprun.i ""xxrqrtmt0.p""}

         if c-application-mode = "API" then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "").
         end. /* c-application-mode = "API" */

      end.

   end.  /*END - if all_info_correct */

end.

if c-application-mode <> "API" then
   hide frame frm no-pause.
