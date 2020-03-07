/* xxrqrtmt0.p - REQUISITION REROUTE                                          */
/* rqrtmt0.p - REQUISITION REROUTE                                            */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrtmt0.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*                                                                            */
/* This is a subprogram to handle the re-routing of a requisition based on    */
/* out of tollerance limits                                                   */
/*                                                                            */
/* REVISION: 8.5    LAST MODIFIED: 05/05/97       BY: *J1Q2* B. Gates         */
/* REVISION: 8.5    LAST MODIFIED: 10/22/97       BY: *J243* B. Gates         */
/* REVISION: 8.6E   LAST MODIFIED: 02/23/98       BY: *L007* A. Rahane        */
/* REVISION: 8.5    LAST MODIFIED: 03/13/98       BY: *J2GM* B. Gates         */
/* REVISION: 8.6E   LAST MODIFIED: 10/04/98       BY: *J314* Alfred Tan       */
/* REVISION: 8.6E   LAST MODIFIED: 01/13/99       BY: *J38J* Steve Nugent     */
/* REVISION: 9.1    LAST MODIFIED: 03/24/00       BY: *N08T* Annasaheb Rahane */
/* Revision: 1.17     BY: Bill Pedersen           DATE: 04/25/00  ECO: *N059* */
/* Revision: 1.18     BY: Hualin Zhong            DATE: 08/15/00  ECO: *N0LC* */
/* Revision: 1.19     BY: Zheng Huang             DATE: 10/12/00  ECO: *N0S0* */
/* Revision: 1.20     BY: Sandeep P.              DATE: 05/22/01  ECO: *N0Z0* */
/* Revision: 1.21     BY: Jean Miller             DATE: 03/04/02  ECO: *N1BS* */
/* Revision: 1.25     BY: Jean Miller             DATE: 03/06/02  ECO: *N1BW* */
/* Revision: 1.29     BY: Paul Donnelly (SB)      DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.31      BY: Ken Casey              DATE: 02/19/04  ECO: *N2GM* */
/* Revision: 1.31      BY: Matthew Lee            DATE: 11/05/04  ECO: *P2SB* */
/* Revision: 1.32      BY: Shoma Salgaonkar       DATE: 01/07/05  ECO: *Q0GD* */
/* Revision: 1.33      BY: Max Iles               DATE: 09/12/06  ECO: *P53S* */
/* Revision: 1.34      BY: Meng Ge                DATE: 04/11/07  ECO: *R0C6* */
/* Revision: 1.35      BY: Prajakta Patil         DATE: 01/14/08  ECO: *P6JG* */
/* Revision: 1.36      BY: Virendra Diwale        DATE: 01/19/09  ECO: *Q26K* */
/* Revision: 1.37      BY: Dipanshu Talwar        DATE: 03/19/09  ECO: *P6YR* */
/* Revision: 1.38      BY: Chandrakant Ingale     DATE: 08/06/09  ECO: *Q36R* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB    LAST MODIFIED: 03-FEB-2012    BY:  gbg *c1276*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/px/pxmaint.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

/* REQUISITION SYSTEM GLOBAL CONSTANTS */
{us/rq/rqconst.i}

/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}

/* Requisition Route API dataset definition */
{us/rq/rqrtds.i "reference-only"}

/* NEW SHARED VARIABLES */
define new shared variable approver    like rqa_apr no-undo.
define new shared variable action_type like action_entry.
define new shared variable cmtindx     as integer.

/* LOCAL VARIABLES */
define variable all_info_correct      like mfc_logical no-undo.
define variable approval_comments     like mfc_logical
   label "Maintain Aprvl Comments" no-undo.
define variable route_reqnbr          like rqm_mstr.rqm_nbr.
define variable route_to_apr          like rqm_rtto_userid no-undo.
define variable route_to_buyer        like po_buyer        no-undo.
define variable route_to_purchasing   like mfc_logical     no-undo.
define variable route_to_userid       like rqm_rtto_userid no-undo.
define variable current_route_to      as character label "Currently Routed To".
define variable date_time             as character no-undo.
define variable email_sent_to         as character no-undo.
define variable messages              as character no-undo.
define variable msglevels             as character no-undo.
define variable reverse               as logical   no-undo.
define variable alternate_ok          as logical   no-undo.
define variable approvals_completed   as logical   no-undo.
define variable update_initial_fields as logical   no-undo initial true.
define variable continue              as logical   no-undo.

define variable exit_program as logical   no-undo initial true.

define variable l_rqm_recno as recid no-undo.
define variable l_action_entry_lbl as character format "x(30)" no-undo.
define variable other-browse       as character no-undo.
define variable l_count as integer initial 0.
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

/* APPROVER LIST TEMPTABLE DEFINITIONS */
{us/rq/rqalttd.i new}

form
   action_entry         colon 30 format "x(1)"
   l_action_entry_lbl   no-label
   current_route_to     colon 30
   usr_name             no-labels
   route_reqnbr         colon 30
   skip(1)
   approval_comments    colon 30
   route_to_apr         colon 30
   route_to_buyer       colon 50
with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
if c-application-mode <> "API" then do:
   setFrameLabels(frame a:handle).

   l_action_entry_lbl:screen-value in frame a =
      "1=" + getTermLabel("ROUTE_TO",12) +
      " 2=" + getTermLabel("REVERSE_ROUTE_TO",21).
end. /* if c-application-mode <> "API" */

if c-application-mode = "API" then do on error undo, return:

   /* Get handle of API Controller */
   {us/bbi/gprun.i ""gpaigach.p"" "(output ApiMethodHandle)"}

   if not valid-handle(ApiMethodHandle) then do:
      /* API Error */
      {us/bbi/pxmsg.i &MSGNUM=10461 &ERRORLEVEL=4}
      return error.
   end.

   /* Get the Requisition Route API dataset from the controller */
   run getDataset in ApiMethodHandle (input "dsRequisitionRoute",
                                      output dataset dsRequisitionRoute bind).

end.  /* If c-application-mode = "API" */

/* SET THE INDICATOR THAT CONTROLS IF INITIAL FIELDS ARE UPDATED.      */
/* THESE FIELDS ARE UPDATED ONLY WHEN THIS PROGRAM IS INVOKED          */
/* FROM THE MENU DRIVER PROGRAM RQRTMT.P.  OTHERWISE THEY              */
/* JUST DEFAULT.  IF THE EDIT CHECKS ON THE INITIAL UPDATE DON'T PASS, */
/* THEN THIS FLAG IS TURNED ON AND WE GO UPDATE THE FIELDS.            */

update_initial_fields = index(program-name(2),"rqrtmt.") > 0.
exit_program = index(program-name(2),"popomtrc.") > 0.

action_entry = "1".
if c-application-mode <> "API" then
   display action_entry approval_comments with frame a.

/* GET MOST RECENTLY ACCESSED REQ NUMBER AND DISPLAY */

{us/bbi/gprun.i ""rqidf.p""
   "(input 'get',
     input 'reqnbr',
     input-output route_reqnbr)"}

if c-application-mode <> "API" then
   display route_reqnbr with frame a.

/* GET MOST RECENTLY ACCESSED APPROVER AND DISPLAY IN CURRENT ROUTE-TO */
{us/bbi/gprun.i ""rqidf.p""
   "(input 'get',
     input 'approver',
     input-output current_route_to)"}

if current_route_to = "" then current_route_to = global_userid.

if c-application-mode <> "API" then
   display current_route_to with frame a.

mainloop:
repeat on endkey undo, leave:
   if c-application-mode = "API" and retry then 
      leave.

   /* Get the Requisition Route record from the API controller */
   if c-application-mode = "API" then do:
      run getNextRecord in ApiMethodHandle (input "ttRequisitionRoute").
      if return-value = {&RECORD-NOT-FOUND} then
         leave mainloop.
         
   end. /* if c-application-mode = "API" */
      
   route_to_purchasing = false.

   block_1:
   do on error undo, retry on endkey
      undo mainloop, leave mainloop:
         
      if c-application-mode = "API" and retry then
         undo mainloop, retry mainloop.

      if update_initial_fields then do:
         if c-application-mode <> "API" then
            set action_entry with frame a.
         else
            action_entry = ttRequisitionRoute.Action.
      end.

      action_type = "2" + action_entry.

      if action_type <> ACTION_ROUTE
         and action_type <> ACTION_ROUTE_REVERSE
      then do:
         /* MESSAGE #2052 - INVALID ACTION */
         {us/bbi/pxmsg.i &MSGNUM=2052 &ERRORLEVEL={&APP-ERROR-RESULT}}
         update_initial_fields = true.
         undo, retry.
      end.

      /* Determine which lookup to run */
      if action_type = ACTION_ROUTE then
         other-browse = "".
      else
         other-browse = "gplu531.p".
      {us/bbi/gprun.i ""gpbranch.p""
         "(input 'rqlu012.p', input other-browse)"}

   do on error undo, retry
      on endkey undo mainloop, retry mainloop:
         
      if c-application-mode = "API" and retry then
         undo mainloop, retry mainloop.
         
      if update_initial_fields then do:
         if c-application-mode <> "API" then do:
            set current_route_to
            with frame a
               editing:
               {us/mf/mfnp.i usr_mstr current_route_to usr_userid current_route_to usr_userid
                  usr_userid }
               if recno <> ? then do:
                  display usr_userid @ current_route_to usr_name
                  with frame a.
               end.
            end.
         end. /* if c-application-mode <> "API" */
         else do:
            {us/mf/mfaidflt.i ttRequisitionRoute.CurrentRouteTo current_route_to}.
            current_route_to = ttRequisitionRoute.CurrentRouteTo.
         end. /* c-application-mode = "API" */
      end.

      {us/px/pxrun.i &PROC='processRead'
               &PROGRAM='gpurxr.p'
               &PARAM="(input current_route_to,
                        buffer usr_mstr,
                        input no,
                        input no)"
               &NOAPPERROR=true &CATCHERROR=true}

      if return-value <> {&SUCCESS-RESULT} then do:
         /* MESSAGE #5605 - USER ID DOES NOT EXIST */
         {us/bbi/pxmsg.i &MSGNUM=5605 &ERRORLEVEL={&APP-ERROR-RESULT}}
         update_initial_fields = true.
         undo, retry.
      end.

      /* Validate if user is active for selection */
      if can-find(first usr_mstr
         where usr_userid = current_route_to and not usr_active)
      then do:
         /* User is not active for selection */
         {us/bbi/pxmsg.i &MSGNUM=10163 &ERRORLEVEL=3}
         update_initial_fields = true.
         undo, retry.
      end.

      if c-application-mode <> "API" then
         display usr_name with frame a.
      approver = current_route_to.
   end.

   /* PASS CURRENT ROUTE-TO VALUE TO LOOKUP BROWSE */
   {us/gp/gpbrparm.i &browse=rqlu012.p &parm=c-brparm1 &val=current_route_to}

   do on error undo, retry
      on endkey undo mainloop, retry mainloop:

      if c-application-mode = "API" and retry then
         undo mainloop, retry mainloop.
         
      if update_initial_fields then do:
         if c-application-mode <> "API" then do:
            set route_reqnbr
            with frame a
               editing:
               if action_type = ACTION_ROUTE_REVERSE then do:
                  /* LOOK AT ALL REQS */
                  {us/mf/mfnp05.i rqm_mstr
                            rqm_nbr
                            " rqm_mstr.rqm_domain = global_domain and yes"
                            rqm_nbr
                            "input frame a route_reqnbr"}
               end.
               else do:
                  /* LOOK AT REQS ROUTED TO THIS APPR */
                  {us/mf/mfnp05.i rqm_mstr
                            rqm_rtto
                            " rqm_mstr.rqm_domain = global_domain and
                            rqm_rtto_userid  = current_route_to and rqm_open"
                            rqm_nbr
                            "input frame a route_reqnbr"}
               end.

               if recno <> ? then do:
                  display rqm_nbr @ route_reqnbr with frame a.
               end.
            end.
         end. /* if c-application-mode <> "API" */
         else do:
            route_reqnbr = ttRequisitionRoute.RequisitionNumber.
         end. /* c-application-mode = "API" */
      end.

      /* ENSURE THE REQUISITION EXISTS */
      {us/px/pxrun.i &PROC='processread'
               &PROGRAM='rqgrsxr.p'
               &PARAM="(input route_reqnbr,
                        buffer rqm_mstr,
                        input {&LOCK_FLAG},
                        input {&NO_WAIT_FLAG})"
               &NOAPPERROR=true
               &CATCHERROR=true}

      l_rqm_recno = recid(rqm_mstr).

      if return-value <> {&SUCCESS-RESULT} then do:
         /*REQUISITION DOES NOT EXIST*/
         {us/bbi/pxmsg.i &MSGNUM=193 &ERRORLEVEL={&APP-ERROR-RESULT}}
         update_initial_fields = true.
         undo, retry.
      end.

      /*ENSURE REQ IS OPEN*/
      {us/px/pxrun.i &PROC='validateReqIsOpen'
               &PROGRAM='rqgrsxr.p'
               &PARAM="(input rqm_nbr)"
               &NOAPPERROR=true
               &CATCHERROR=true}

      if return-value <> {&SUCCESS-RESULT} then do:
         if update_initial_fields = yes
         then
            undo, retry.
         else
            undo mainloop, leave mainloop.
      end.

      /* ENSURE THAT FOR THE ACTION SELECTED AND WHAT THE USER
         ENTERS IN "CURRENTLY ROUTED TO", IS VALID FOR THE REQ SELECTED*/
      {us/px/pxrun.i &PROC='validateCurrentlyRoutedTo'
               &PROGRAM='rqgrsxr.p'
               &PARAM="(input rqm_nbr,
                        input global_userid,
                        input action_type,
                        input current_route_to)"
               &NOAPPERROR=true
               &CATCHERROR=true}

      if return-value <> {&SUCCESS-RESULT} then do:
         if exit_program then return error.
         update_initial_fields = index(program-name(2),"rqrtmt.") > 0.
         if update_initial_fields = no
         then
            undo mainloop, leave mainloop.
         else
            undo, retry.
      end.

      /* BUILD APPROVER LIST.  THIS INCLUDES THE TEMPTABLE "ttcal" WHICH
         IS USED BY THE LOOKUP PROGRAM (SWAL.P) FOR THE FIELD route_to_apr.*/
      {us/bbi/gprun.i ""rqbal.p"" "(input recid(rqm_mstr))"}

      if action_type = ACTION_ROUTE then do:
         {us/px/pxrun.i &PROC='validateAlternateApprover'
                  &PROGRAM='rqgrsxr.p'
                  &PARAM="(input rqm_nbr,
                           input current_route_to,
                           input global_userid)"
                  &NOAPPERROR=true &CATCHERROR=true}

         if return-value <> {&SUCCESS-RESULT} then do:
            if update_initial_fields = yes
            then
               undo, retry.
            else
               undo mainloop, leave mainloop.
         end.
      end.
   end.

      if not available rqm_mstr
         and l_rqm_recno <> ?
      then
         find rqm_mstr
            where recid(rqm_mstr) = l_rqm_recno
         exclusive-lock no-error.

      l_rqm_recno = ?.

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

      /* ENTER APPROVAL COMMENTS IF REQUESTED */
      if c-application-mode <> "API" then
         set approval_comments with frame a.
      else
         approval_comments = true.      

      if approval_comments then do:

         /* Let the API controller know the name of the transaction */
         /* comments buffer.                                        */
         if c-application-mode = "API" then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "ttRequisitionRouteComment").
         end. /* c-application-mode = "API" */

         assign
            global_ref = rqm_vend
            cmtindx = rqm_apr_cmtindx.

         /* Identify context for QXtend */
         {us/gp/gpcontxt.i
            &STACKFRAG = 'gpcmmt01,rqrtmt0,rqrqmt0,rqrqmt'
            &FRAME = 'cmmt01' &CONTEXT = 'APPROVAL'}

         {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""rqm_mstr"")"}
         rqm_apr_cmtindx = cmtindx.

         /* Clear context for QXtend */
         {us/gp/gpcontxt.i
            &STACKFRAG = 'gpcmmt01,rqrtmt0,rqrqmt0,rqrqmt'
            &FRAME = 'cmmt01'}

         if c-application-mode = "API" then do:
            run setCommonDataBuffer in ApiMethodHandle
               (input "").
         end. /* c-application-mode = "API" */

      end.
   end. /* End of block_1 */

   /* Clear out any stranded qad_wkfl from previous sessions*/
   for each qad_wkfl
      where qad_domain = global_domain
      and   qad_key3   = SessionUniqueID
      and   qad_key4   = "rqrtmt0.p"
   exclusive-lock:
      delete qad_wkfl.
   end.
   l_count = 0.

   /* Now copy the Approval List created by rqbal.p into qad_wkfl  */
   /* so that the a Lookup Browse can be defined to query this info */
   for each ttcal:
      for first usr_mstr where usr_userid = ttcal_apr_userid
      no-lock: end.
      l_count = l_count + 1.

      for first qad_wkfl
         where qad_domain = global_domain
         and   qad_key1   = SessionUniqueID
         and   qad_key2   = string(l_count)
      exclusive-lock:
      end. /* FOR FIRST qad_wkfl */

      if not available qad_wkfl
      then do:
         create qad_wkfl.
         assign
            qad_domain = global_domain
            qad_key1 = SessionUniqueID
            qad_key2 = string(l_count).
      end. /* IF NOT AVAILABLE qad_wkfl */

      if ttcal_apr_action = ACTION_APPROVE
      then assign qad_charfld[3] = getTermLabel("APPROVED", 10).
      else if ttcal_apr_action = ACTION_DENY
      then assign qad_charfld[3] = getTermLabel("DENY", 10).
      else assign qad_charfld[3] = " ".

      assign
         qad_key3 = SessionUniqueID
         qad_key4 = "rqrtmt0.p"
         qad_charfld[1] = ttcal_apr_userid
         qad_charfld[2] = if available usr_mstr then usr_name
                          else "    "
         qad_logfld[1] = ttcal_is_approver
         qad_logfld[2] = ttcal_is_reviewer
         qad_logfld[3] = ttcal_required
         qad_datefld[1] = ttcal_apr_date
         qad_charfld[4] = if ttcal_apr_date <> ? then
                          string(ttcal_apr_time, 'HH:MM:SS')
                          else "        ".
   end.

   block_2:
   do transaction:

   /*GET MOST RECENTLY SAVED ROUTE-TO AND DISPLAY.  THIS COMES ONLY
   FROM PO MAINT (WHEN AN OUT OF TOLERANCE REQ IS ROUTED BACK).*/
   {us/bbi/gprun.i ""rqidf.p""
      "(input 'get', input 'route to', input-output route_to_apr)"}

   route_to_buyer = rqm_buyer.

   if c-application-mode <> "API" then do:
      display
         route_to_apr
         route_to_buyer
      with frame a.
   end. /* c-application-mode <> "API" */
   else do:
      assign
         {us/mf/mfaidflt.i ttRequisitionRoute.RouteTo route_to_apr}
         {us/mf/mfaidflt.i ttRequisitionRoute.Buyer   route_to_buyer}.
   end. /* c-application-mode = "API" */
   
   if action_type = ACTION_ROUTE then do:
      /* UPDATE THE REQUISITION APPROVAL STATUS */
      /* CHECK FOR FINAL APPROVAL               */
      {us/bbi/gprun.i ""rqcfa.p""
         "(input rqm_nbr, output approvals_completed)"}

      /*IF FULLY APPROVED ASK WHERE TO ROUTE IT TO (APPROVER OR BUYER)*/
      if not rqm_rtdto_purch
         and approvals_completed
      then do:
         route_to_purchasing = true.

         if c-application-mode = "API" then
            assign
               {us/mf/mfaidflt.i ttRequisitionRoute.RouteToPurchasing route_to_purchasing}.
               
         /*APPROVALS HAVE BEEN COMPLETED, ROUTE TO PURCHASING?*/
         if c-application-mode <> "API" then do:
            {us/bbi/pxmsg.i
               &MSGNUM=2075
               &ERRORLEVEL={&INFORMATION-RESULT}
                     &CONFIRM=route_to_purchasing}
         end. /* if c-application-mode <> "API" */
         else
            route_to_purchasing = ttRequisitionRoute.RouteToPurchasing.
      end.

      if rqm_rtdto_purch then do:
         route_to_purchasing = false.

         if c-application-mode = "API" then
            assign
               {us/mf/mfaidflt.i ttRequisitionRoute.RouteToPurchasing route_to_purchasing}.

         /*ROUTE TO ANOTHER BUYER?*/
         if c-application-mode <> "API" then do:
            {us/bbi/pxmsg.i
               &MSGNUM=2232
               &ERRORLEVEL={&INFORMATION-RESULT}
                     &CONFIRM=route_to_purchasing}
         end. /* if c-application-mode <> "API" */
         else
            route_to_purchasing = ttRequisitionRoute.RouteToPurchasing.
      end.

      /* GET ROUTE TO AND BUYER */
      do on error undo, retry:
         if c-application-mode = "API" and retry then
            undo mainloop, retry mainloop.
            
         if c-application-mode <> "API" then do:
            set
               route_to_apr when (not route_to_purchasing)
               route_to_buyer
               with frame a
            editing:
               if frame-field = "route_to_apr" then do:
                  {us/mf/mfnp.i ttcal route_to_apr
                          ttcal_apr_userid route_to_apr
                          ttcal_apr_userid ttcal_apr}

                  if recno <> ? then do:
                     display ttcal_apr_userid @ route_to_apr
                     with frame a.
                  end.
               end.
               else
                  if frame-field = "route_to_buyer" then do:
                  {us/mf/mfnp05.i
                     rqr_mstr
                     rqr_role
                     " rqr_mstr.rqr_domain = global_domain and rqr_role  = BUYER"
                     rqr_userid
                     "input frame a route_to_buyer"}

                  if recno <> ? then do:
                     display rqr_userid @ route_to_buyer
                     with frame a.
                  end.
               end.
            end.
         end. /* c-application-mode <> "API" */
         else do:
            if not route_to_purchasing then
               route_to_apr = ttRequisitionRoute.RouteTo.
            route_to_buyer = ttRequisitionRoute.Buyer.
         end. /* c-application-mode = "API" */
         
         /*VALIDATE THE ROUTE-TO APPROVER*/
         if not route_to_purchasing then do:
            {us/px/pxrun.i &PROC='validateRouteToUser'
                     &PROGRAM='rqgrsxr.p'
                     &PARAM="(input rqm_nbr, input route_to_apr)"
                     &NOAPPERROR=true
                     &CATCHERROR=true}

            if return-value <> {&SUCCESS-RESULT} and
               return-value <> {&WARNING-RESULT} then do:
               if c-application-mode <> "API" then
                  next-prompt route_to_apr with frame a.
               undo, retry.
            end.
         end.

         /*VALIDATE THE ROUTE-TO BUYER*/
         if route_to_buyer > "" or route_to_purchasing then do:
            {us/px/pxrun.i &PROC='validateBuyer'
                     &PROGRAM='rqgrsxr.p'
                     &PARAM="(input route_to_buyer)"
                     &NOAPPERROR=true
                     &CATCHERROR=true}

            if return-value <> {&SUCCESS-RESULT} then do:
               if c-application-mode <> "API" then
                  next-prompt route_to_buyer with frame a.
               undo, retry.
            end.
         end.

      end.
   end.

   all_info_correct = true.
   
   if c-application-mode <> "API" then do:
      /*IS ALL INFORMATION CORRECT? */
      {us/bbi/pxmsg.i &MSGNUM=12
               &ERRORLEVEL={&INFORMATION-RESULT}
               &CONFIRM=all_info_correct}
   end. /* c-application-mode <> "API" */
   
   if not all_info_correct then undo, retry.

   /* UPDATE REQUISITION */

   if action_type = ACTION_ROUTE then do: /* ACTION = 1 (ROUTE TO) */
      /* IF ALL APPROVERS HAVE APPROVED AND THE USER SAID OK
         TO ROUTE TO PURCHASING, THEN MARK THE REQ APPROVED*/

      if not rqm_rtdto_purch and route_to_purchasing then do:
         {us/px/pxrun.i &PROC='setRequisitionStatusToApproved'
                  &PROGRAM='rqgrsxr.p'
                  &PARAM="(input rqm_nbr)"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
      end.

      /*RECORD THE ROUTE-TO (APPROVER OR BUYER) IN THE REQ*/
      route_to_userid = if route_to_purchasing then
                           route_to_buyer
                        else route_to_apr.

      {us/px/pxrun.i &PROC='routeRequisitionTo'
               &PROGRAM='rqgrsxr.p'
               &PARAM="(input rqm_nbr, input route_to_purchasing,
                        input global_userid,  input route_to_userid)"
               &NOAPPERROR=true
               &CATCHERROR=true}
   end.
   else do: /* ACTION = 2 (REVERSE ROUTE TO) */
      {us/px/pxrun.i &PROC='reverseRouteRequisitionTo'
               &PROGRAM='rqgrsxr.p'
               &PARAM="(input rqm_nbr)"
               &NOAPPERROR=true
               &CATCHERROR=true}
   end.

   /*ASSIGN BUYER*/
   {us/px/pxrun.i &PROC='setRequisitionBuyer'
            &PROGRAM='rqgrsxr.p'
            &PARAM="(input rqm_nbr,
                     input route_to_buyer)"
            &NOAPPERROR=true
            &CATCHERROR=true}

   /*SEND EMAILS*/
/*c1267*    {us/bbi/gprun.i ""rqemsend.p"" */
/*c1267*/   {us/bbi/gprun.i ""xxrqemsend.p""
      "(input recid(rqm_mstr),
        input action_type,
        output email_sent_to)"}

   /*WRITE HISTORY RECORD*/

   {us/bbi/gprun.i ""rqwrthst.p""
      "(input rqm_nbr,
        input 0,
        input action_type,
        input current_route_to,
        input rqm_rtto_userid,
        input email_sent_to)"}

   /* BLANK OUT ANY SAVED ROUTE-TO */

   route_to_apr = "".

   {us/bbi/gprun.i ""rqidf.p""
      "(input 'put',
        input 'route to',
        input-output route_to_apr)"}

   if not update_initial_fields then leave.
   end. /* End of block_2 */
end.

/*Clean up qad_wkfl that was created for the Approver Lookup Browse */
for each qad_wkfl
   where qad_domain = global_domain
   and   qad_key3   = SessionUniqueID
   and   qad_key4   = "rqrtmt0.p"
exclusive-lock:
   delete qad_wkfl.
end.
if c-application-mode <> "API" then
   hide frame a no-pause.

/* Since we are only ever getting 1 record, make sure we close the query */
/* otherwise there will be incorrect behaviour next time this dataset is used */
if c-application-mode = "API" then do:
   run closeQuery in ApiMethodHandle (input "ttRequisitionRoute").
end. /* c-application-mode = "API" */
