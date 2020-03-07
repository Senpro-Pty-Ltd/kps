/* xxrqcfa.p    - REQUISITION APPROVAL - CHECK FOR FULL APPROVAL              */
/* rqcfa.p    - REQUISITION APPROVAL - CHECK FOR FULL APPROVAL                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqcfa.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* Revision: 8.6    LAST MODIFIED BY: 05/05/97  By: B. Gates          *J1Q2*  */
/* Revision: 8.5    LAST MODIFIED BY: 06/22/98  By: B. Gates          *J2QB*  */
/* Revision: 8.5    LAST MODIFIED BY: 02/08/99  By: Steve Nugent      *J396*  */
/* Revision: 9.1    LAST MODIFIED BY: 10/01/99  By: Jeff Wootton      *N014*  */
/* REVISION: 9.1    LAST MODIFIED: 08/12/00 BY: *N0KP* myb                    */
/* Revision: 1.9         BY: Paul Donnelly (SB)   DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.11        BY: Dinesh Dubey         DATE: 03/04/07  ECO: *R0C6* */
/* Revision: 1.12        BY: Jean Miller          DATE: 11/04/07  ECO: *P61C* */
/* Revision: 1.13        BY: Amar Gaikwad         DATE: 02/08/08  ECO: *P69P* */
/* Revision: 1.14        BY: Virendra Diwale      DATE: 01/19/09  ECO: *Q26K* */
/* $Revision: 1.2 $         BY: Mukesh Singh         DATE: 10/12/09  ECO: *Q2V8* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB    LAST MODIFIED: 18-AUG-2010    BY:  gbg *c1191*                    */
/* CYB    LAST MODIFIED: 09-FEB-2011    BY:  gbg *c1204*                    */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/*                                                                          */
/* -----  W A R N I N G  -----  W A R N I N G  -----  W A R N I N G  -----  */
/*                                                                          */
/*         THIS PROGRAM IS A BOLT-ON TO STANDARD PRODUCT MFG/PRO.           */
/* ANY CHANGES TO THIS PROGRAM MUST BE PLACED ON A SEPARATE ECO THAN        */
/* STANDARD PRODUCT CHANGES.  FAILURE TO DO THIS CAUSES THE BOLT-ON CODE TO */
/* BE COMBINED WITH STANDARD PRODUCT AND RESULTS IN PATCH DELIVERY FAILURES.*/
/*                                                                          */
/* -----  W A R N I N G  -----  W A R N I N G  -----  W A R N I N G  -----  */
/*                                                                          */

{us/bbi/mfdeclre.i}

define input parameter p_req_nbr like rqm_mstr.rqm_nbr no-undo.
define output parameter p_approvals_completed as logical no-undo.

{us/rq/rqalttd.i} /*APPROVER LIST TEMPTABLE DEFINITIONS*/
{us/rq/rqconst.i}

define variable any_denials as logical no-undo.
define variable approval_count as integer no-undo.
define variable messages as character no-undo.
define variable msglevels as character no-undo.
define variable valid_acct like mfc_logical.
/*q9006*/ def var prevdomain like dom_domain.
/*q9006*/ def var preventity as char.
/*q9006*/ def buffer b1dom for dom_mstr.
/*q9006*/ def buffer b2dom for dom_mstr.
/*q9006*/ def var vmessage as char.

{us/bbi/gprun.i ""rqpma.p""}
for first rqf_ctrl
   where rqf_ctrl.rqf_domain = global_domain
no-lock:
end. /*FOR FIRST rqf_ctrl*/

for first gl_ctrl
   where gl_ctrl.gl_domain = global_domain
no-lock:
end. /*FOR FIRST gl_ctrl*/

for first rqm_mstr
   where rqm_mstr.rqm_domain = global_domain
   and   rqm_nbr             = p_req_nbr
no-lock:
end. /*FOR FIRST rqm_mstr*/

p_approvals_completed = true.

/*CHECK THAT ALL REQUIRED APPROVALS AND REVIEWALS HAVE BEEN MADE*/
for each ttcal no-lock
   where ttcal_required:
   for first rqda_det
      where rqda_det.rqda_domain  = global_domain
      and   rqda_nbr              = p_req_nbr
      and   rqda_apr_userid       = ttcal_apr_userid
      and   rqda_action           = ACTION_APPROVE
   no-lock:
   end. /*FOR FIRST rqda_det*/
   if not available rqda_det then do:
      p_approvals_completed = false.
      return.
   end.

   if execname    = "rqrqmt.p"
      or execname = "rqrtmt.p"
   then
      for first rqm_mstr
         where rqm_domain    = global_domain
         and   rqm_nbr       = p_req_nbr
         and   rqm_open      = yes
         and   rqm_aprv_stat = "1"
      no-lock:
         p_approvals_completed = false.
         return.
      end. /*FOR FIRST rqm_mstr*/
end.

/*CHECK FOR ANY DENIALS*/
for each rqda_det
   where rqda_domain = global_domain
   and rqda_nbr = p_req_nbr
   and rqda_action = ACTION_DENY
no-lock:
   if can-find (ttcal
      where  ttcal_apr_userid  = rqda_apr_userid
      and ttcal_required = yes)
      then do:
         p_approvals_completed = false.
         return.
      end.
end.

if rqm_direct then do:

   /*CHECK NUMBER OF DIRECT APPROVALS*/
   if rqf_diraprs_req > 0 then do:

      for each rqd_det no-lock
         where rqd_domain = global_domain
           and rqd_nbr = rqm_nbr
           and rqd_status = LINE_STATUS_OPEN,
          each pt_mstr no-lock
         where pt_domain = global_domain
           and pt_part = rqd_part
      break by rqd_site by pt_prod_line:

         if last-of(pt_prod_line) then do:

            approval_count = 0.

            for each ttdal no-lock
               where ttdal_site      = rqd_site
                 and ttdal_prod_line = pt_prod_line
                 and ttdal_is_approver:

               for first rqda_det
                  where rqda_det.rqda_domain = global_domain
                  and   rqda_nbr             = p_req_nbr
                  and   rqda_apr_userid      = ttdal_apr_userid
                  and   rqda_action          = ACTION_APPROVE
               no-lock:
               end. /*FOR FIRST rqda_det*/
               if available rqda_det then do:
                  approval_count = approval_count + 1.
               end.
            end.

            if approval_count < rqf_diraprs_req then do:
               p_approvals_completed = false.
               return.
            end.
         end.
      end.
   end.
end.

else do:

   /*CHECK NUMBER OF HORIZONTAL APPROVALS*/
   if rqf_horaprs_req > 0
   then do:
      for each rqd_det no-lock
         where rqd_domain = global_domain
         and rqd_nbr = rqm_nbr
         and rqd_status = LINE_STATUS_OPEN
         and rqd_category > ""
      break by rqd_category:
         if last-of(rqd_category)
         then do:
            approval_count = 0.

            for each tthal no-lock
               where tthal_category = rqd_category
               and tthal_is_approver:
               for first rqda_det
                  where rqda_det.rqda_domain = global_domain
                  and   rqda_nbr             = p_req_nbr
                  and   rqda_apr_userid      = tthal_apr_userid
                  and   rqda_action          = ACTION_APPROVE
               no-lock:
               end. /*FOR FIRST rqda_det*/
               if available rqda_det
               then do:
                  approval_count = approval_count + 1.
               end. /* IF AVAILABLE rqda_det */
            end. /* FOR EACH tthal */

            if approval_count < rqf_horaprs_req
            then do:
               p_approvals_completed = false.
               return.
            end. /* IF approval_count < rqf_horaprs_req */
         end. /* IF LAST-OF(rqd_category) */
      end. /* FOR EACH rqd_det */
   end. /* IF rqf_horaprs_req > 0 */

   /*COUNT NUMBER OF JOB APPROVALS*/
   approval_count = 0.

   if rqm_job > "" then do:

      for each ttjal where ttjal_is_approver no-lock:

         /*NOTE WE JUST COUNT THE NUMBER OF JOB APPROVERS
         AS THE COUNT IS USED FOR THE NEXT STEP*/
         for first rqda_det
            where rqda_det.rqda_domain = global_domain
            and   rqda_nbr             = p_req_nbr
            and   rqda_apr_userid      = ttjal_apr_userid
            and   rqda_action          = ACTION_APPROVE
         no-lock:
         end. /*FOR FIRST rqda_det*/

         if available rqda_det then do:
            approval_count = approval_count + 1.
         end.
      end.
   end.

   /*CHECK NUMBER OF VERTICAL PLUS JOB APPROVALS*/
   if rqf_vrtaprs_req > 0 then do:

      /*NOTE WE DON'T RESET APPROVAL_COUNT BECAUSE JOB APPROVERS
        GET INCLUDED WITH VERTICAL APPROVERS*/
      for each ttval where ttval_is_approver no-lock:
         for first rqda_det
            where rqda_det.rqda_domain = global_domain
            and   rqda_nbr             = p_req_nbr
            and   rqda_apr_userid      = ttval_apr_userid
            and   rqda_action          = ACTION_APPROVE
         no-lock:
         end. /*FOR FIRST rqda_det*/
         if available rqda_det then do:
            approval_count = approval_count + 1.
         end.
      end.

      if approval_count < rqf_vrtaprs_req then do:
         p_approvals_completed = false.
         return.
      end.
   end.
end.

/*CHECK ACCOUNT NUMBERS*/
for each rqd_det
   where rqd_domain = global_domain
     and rqd_nbr = rqm_nbr
     and rqd_status = ""
no-lock:

/*q9006*/   prevdomain = global_domain.
/*q9006*/   preventity = current_entity.
/*q9006*/   find first b1dom no-lock 
/*q9006*/   where b1dom.dom_domain = global_domain
/*q9006*/   no-error.
/*q9006*/   if available b1dom and
/*q9006*/   b1dom.dom_user1 <> ? and
/*q9006*/   b1dom.dom_user1 <> "" and
/*q9006*/   can-find(first b2dom where b2dom.dom_domain = b1dom.dom_user1)
/*q9006*/   then global_domain = b1dom.dom_user1.
/*q9006*/   find first si_mstr no-lock
/*q9006*/   where si_site = rqd_site
/*q9006*/   and   si_domain <> si_db
/*q9006*/   no-error.
/*q9006*/   if available si_mstr
/*q9006*/   then do:
/*q9006*/     if available si_mstr
/*q9006*/     then do:
/*q9006*/        find first en_mstr no-lock
/*q9006*/        where en_entity = si_entity
/*q9006*/        no-error.
/*q9006*/        if available en_mstr 
/*q9006*/        then do:
/*q9006*/           global_domain = en_domain.
/*q9006*/           current_entity = en_entity.
/*q9006*/        end.
/*q9006*/     end.
/*q9006*/   end.

   /*GPGLVERO.P RETURNS A LIST OF MESSAGE NUMBERS.
     IF ANY ERROR-LEVEL THEN THE REQ WILL NOT ACHIEVE
     FINAL APPROVAL.*/
   {us/gp/gprunp.i "gpglvpl" "p" "initialize"}
   {us/gp/gprunp.i "gpglvpl" "p" "set_disp_msgs" "(input false)"}
   {us/gp/gprunp.i "gpglvpl" "p" "validate_fullcode"
          "(input rqd_acct,
          input rqm_sub,
          input rqm_cc,
          input rqd_project,
          input ""rqd_acct"",
          output valid_acct)"}

   {us/gp/gprunp.i "gpglvpl" "p" "get_msgs"
          "(output messages, output msglevels)"}

/*q9006*/      global_domain = prevdomain.
/*q9006*/      current_entity = preventity.

   if lookup("3",msglevels) > 0 then do:
/*C1204*      p_approvals_completed = false. */
      return.
   end.

   /*CHECK CATEGORIES*/
   if rqd_category > ""
   then do:
      for last rqcd_det
         where rqcd_det.rqcd_domain = global_domain
         and   rqcd_category        = rqd_category
         and   substring(rqcd_acct_from,1,8) + rqcd_sub_from
               <= substring(rqd_acct,1,8)    + rqm_sub
         and   substring(rqcd_acct_to,1,8)   + rqcd_sub_to
               >= substring(rqd_acct,1,8)    + rqm_sub
      no-lock:
      end. /*FOR LAST rqcd_det*/

      if not available rqcd_det
      then do:

         for last rqcd_det
            where rqcd_det.rqcd_domain = global_domain
            and rqcd_category          = rqd_category
            and rqcd_acct_from        <= rqd_acct
            and rqcd_acct_to          >= rqd_acct
            and rqcd_sub_from          = ""
            and rqcd_sub_to            = ""
         no-lock:
         end. /*FOR LAST rqcd_det*/
         if not available rqcd_det
         then do:
            p_approvals_completed = false.
            return.
         end. /* IF NOT AVAILABLE rqcd_det */

      end. /* if not available rqcd_det */

   end. /* IF rqd_category > "" */

end.
