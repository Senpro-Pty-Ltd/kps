/* xxrqrqmt0.p   - REQUISITION MAINTENANCE                                    */
/* rqrqmt0.p   - REQUISITION MAINTENANCE                                      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqrqmt0.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* Revision: 8.5    LAST MODIFIED: 04/22/97  BY: *J1Q2* Bill Gates            */
/* REVISION: 8.5    LAST MODIFIED: 10/24/97  BY: *J24N* Patrick Rowan         */
/* REVISION: 8.6E   LAST MODIFIED: 02/23/98  BY: *L007* Annasaheb Rahane      */
/* REVISION: 8.6E   LAST MODIFIED: 03/31/98  BY: *J2G7* Samir Bavkar          */
/* REVISION: 8.6E   LAST MODIFIED: 05/20/98  BY: *K1Q4* Alfred Tan            */
/* REVISION: 8.6E   LAST MODIFIED: 03/18/98  BY: *J2GM* Bill Gates            */
/* REVISION: 8.6E   LAST MODIFIED: 07/21/98  BY: *L040* Brenda Milton         */
/* REVISION: 8.6E   LAST MODIFIED: 08/13/98  BY: *K1QS* Dana Tunstall         */
/* REVISION: 8.6E   LAST MODIFIED: 09/09/99  BY: *J39R* Reetu Kapoor          */
/* REVISION: 9.1    LAST MODIFIED: 03/24/00  BY: *N08T* Annasaheb Rahane      */
/* REVISION: 9.1    LAST MODIFIED: 07/22/00  BY: *M0Q8* Manish Kulkarni       */
/* REVISION: 9.1    LAST MODIFIED: 08/12/00  BY: *N0KP* Mark Brown            */
/* Revision: 1.18.1.5      BY: Murali Ayyagari    DATE: 10/30/01  ECO: *N15H* */
/* Revision: 1.18.1.7      BY: Falguni Dalal      DATE: 11/19/01  ECO: *P02Y* */
/* Revision: 1.18.1.10     BY: Anitha Gopal       DATE: 12/21/01  ECO: *N174* */
/* Revision: 1.18.1.11     BY: Jose Alex          DATE: 05/21/02  ECO: *N1JK* */
/* Revision: 1.18.1.12     BY: Mark Christian     DATE: 05/30/02  ECO: *N1K7* */
/* Revision: 1.18.1.13     BY: Rajaneesh Sarangi  DATE: 08/29/02  ECO: *M1BY* */
/* Revision: 1.18.1.14     BY: Dan Herman         DATE: 12/30/02  ECO: *N236* */
/* Revision: 1.18.1.15     BY: Dan Herman         DATE: 01/14/03  ECO: *N245* */
/* Revision: 1.18.1.16     BY: Vivek Gogte        DATE: 02/27/03  ECO: *P0N8* */
/* Revision: 1.18.1.18     BY: Geeta Kotian       DATE: 03/28/03  ECO: *N2BS* */
/* Revision: 1.18.1.20     BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.18.1.21     BY: Rajinder Kamra     DATE: 06/23/03  ECO  *Q003* */
/* Revision: 1.18.1.25     BY: Katie Hilbert      DATE: 01/08/04  ECO: *P1J4* */
/* Revision: 1.18.1.26     BY: Ken Casey          DATE: 02/19/04  ECO: *N2GM* */
/* Revision: 1.18.1.27.1.1 BY: Shivganesh Hegde   DATE: 02/14/05  ECO: *P382* */
/* Revision: 1.18.1.28     BY: Andrew Dedman      DATE: 08/18/05  ECO: *R01P* */
/* Revision: 1.18.1.29     BY: Abbas Hirkani      DATE: 10/27/05  ECO: *P46M* */
/* Revision: 1.18.1.30     BY: Robin McCarthy     DATE: 05/31/06  ECO: *R02F* */
/* Revision: 1.18.1.33     BY: Amit Kumar         DATE: 07/24/06  ECO: *P4XX* */
/* Revision: 1.18.1.34     BY: Jayesh Sawant      DATE: 07/31/06  ECO: *P4Y1* */
/* Revision: 1.18.1.35     BY: Jayesh Sawant      DATE: 08/23/06  ECO: *Q0XV* */
/* Revision: 1.18.1.38     BY: Jean Miller        DATE: 02/23/07  ECO: *R0C6* */
/* Revision: 1.18.1.40     BY: Prajakta Patil     DATE: 01/10/08  ECO: *P63D* */
/* Revision: 1.18.1.41     BY: Robin McCarthy     DATE: 01/11/08  ECO: *R08C* */
/* Revision: 1.18.1.42     BY: Ashim Mishra       DATE: 01/28/08  ECO: *P6KQ* */
/* Revision: 1.18.1.47     BY: Ambrose Almeida    DATE: 04/03/09  ECO: *Q2ML* */
/* Revision: 1.18.1.48     BY: Ambrose Almeida    DATE: 04/28/09  ECO: *Q2SW* */
/* Revision: 1.18.1.49     BY: Ruchita Shinde     DATE: 05/11/09  ECO: *Q2VP* */
/* Revision: 1.18.1.50     BY: Neil Curzon        DATE: 05/01/09  ECO: *R1HB* */
/* Revision: 1.18.1.51     BY: Chandrakant Ingale DATE: 08/06/09  ECO: *Q36R* */
/* Revision: 1.18.1.52     BY: Prajakta Patil     DATE: 09/27/09  ECO: *Q3B8* */
/* Revision: 1.18.1.53     BY: Ashim Mishra       DATE: 09/30/09  ECO: *Q2Y2* */
/* Revision: 1.18.1.54     BY: Rajat Kulshreshtha DATE: 01/28/10  ECO: *Q3R1* */
/* Revision: 1.18.1.55     BY: Ravi Swami         DATE: 03/12/10  ECO: *Q3TQ* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                   LAST MODIFIED: 23-MAR-2015 BY: nac *d3032*   */
/* CYB                   LAST MODIFIED: 2016-SEP-27 BY: gbg *d3032a*  */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* NOTE: CHANGES MADE TO THIS PROGRAM MAY NEED TO BE MADE TO
 * REQUISITION DETAIL INQUIRY AND/OR REQUISITION MAINTENANCE
 * AND/OR REQUISITION REPORT. */
 
using com.qad.qra.config.QraConfig.

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/rq/rqconst.i}
{us/pp/ppprlst.i}   /* PRICE LIST CONSTANTS */
{us/px/pxmaint.i}
{us/px/pxphdef.i gpumxr}
{us/px/pxphdef.i gpcmxr}
{us/px/pxphdef.i gplngxr}
{us/px/pxphdef.i rqgrsxr}
{us/gp/gpdecchr.i}
{us/rq/rqalttd.i new} /*APPROVER LIST TEMPTABLE DEFINITIONS*/
 
define new shared variable cmtindx          as   integer.
define new shared variable userid_modifying as   character        no-undo.
 
define variable mc-error-number             like msg_nbr          no-undo.
define variable continue                    as   logical          no-undo.
define variable del-yn                      like mfc_logical      no-undo.
define variable line                        as   integer          no-undo.
define variable new_req                     as   logical          no-undo.
define variable oldcurr                     like rqm_curr.
define variable get_rqmnbr                  like rqm_mstr.rqm_nbr no-undo.
define variable rqmnbr                      like rqm_mstr.rqm_nbr.
define variable email_opt_valid             as   logical          no-undo.
define variable email_sent_to               as   character        no-undo.
define variable approve_or_route            like mfc_logical      no-undo.
define variable i                           as   integer          no-undo.
define variable hdr_cmmts                   like COMMENTS         no-undo.
define variable poc_pt_req                  as   logical          no-undo.
define variable prev_status                 like rqm_status       no-undo.
define variable prev_sub                    like rqm_sub          no-undo.
define variable prev_cc                     like rqm_cc           no-undo.
define variable prev_entity                 like rqm_entity       no-undo.
define variable prev_job                    like rqm_job          no-undo.
define variable prev_site                   like rqm_site         no-undo.
define variable route_to                    like rqm_rtto_userid  no-undo.
define variable yn                          like mfc_logical      no-undo.
define variable temp_rate                   as   decimal          no-undo.
define variable temp_rate2                  as   decimal          no-undo.
define variable temp_ratetype               like exr_ratetype     no-undo.
define variable total_frame_hdl             as   handle           no-undo.
define variable l_prev_list                 like rqm_pr_list      no-undo.
define variable l_prev_list2                like rqm_pr_list2     no-undo.
define variable l_cur_cost                  as   decimal          no-undo.
define variable l_base_cost                 like rqd_pur_cost     no-undo.
define variable l_vendor                    like rqm_vend         no-undo.
define variable l_got_vendor_item_data      like mfc_logical      no-undo.
define variable l_vendor_q_qty              like vp_q_qty         no-undo.
define variable l_vendor_q_um               like vp_um            no-undo.
define variable l_vendor_q_curr             like vp_curr          no-undo.
define variable l_vendor_part               like rqd_vpart        no-undo.
define variable l_vendor_price              like vp_q_price       no-undo.
define variable l_mfgr                      like vp_mfgr          no-undo.
define variable l_mfgr_part                 like vp_mfgr_part     no-undo.
define variable l_conversion_factor         as   decimal          no-undo.
define variable l_got_vendor_price          like mfc_logical      no-undo.
define variable l_req_qty                   like rqd_req_qty      no-undo.
define variable l_net_price                 like pc_min_price     no-undo.
define variable l_lineffdate                like rqm_due_date     no-undo.
define variable l_minprice                  like pc_min_price     no-undo.
define variable l_maxprice                  like pc_min_price     no-undo.
define variable l_pc_recno                  as   recid            no-undo.
define variable l_ext_cost                  like rqd_pur_cost     no-undo.
define variable l_max_ext_cost              like rqd_max_cost     no-undo.
define variable l_prev_ext_cost             like rqd_pur_cost     no-undo.
define variable l_prev_max_ext_cost         like rqd_max_cost     no-undo.
define variable l_prev_vend                 like rqm_vend         no-undo.
define variable using_grs                   like mfc_logical      no-undo.
define variable l_net_price1                like pc_min_price     no-undo.
define variable l_ext_cost1                 like rqd_pur_cost     no-undo.
define variable l_max_ext_cost1             like rqd_pur_cost     no-undo.
define variable rndmthd                     like rnd_rnd_mthd     no-undo.
define variable hBlockedTransactionlibrary  as   handle           no-undo.
define variable l_stat_open                 as   logical          no-undo.
 
define variable daybookSetBySiteInstalled like mfc_logical no-undo.
define variable hDaybooksetValidation as handle    no-undo.
define variable iErrorNumber          as integer   no-undo.
define variable daybookDate           as date      no-undo.
define variable cErrorArgs            as character no-undo.
define variable prohibit_changes      like mfc_logical      no-undo.																			  
define variable requisitionNumber     as character no-undo.
define variable siteEntity            as character no-undo.
define variable errorLevel            as integer   no-undo.
define variable hQADFinancialsLib     as handle   no-undo. 
{proxy/bcoavalidation/apivalcoarestrictionindomaindef.i}
/* DAYBOOKSET VALIDATION LIBRARY PROTOTYPES */
{us/dy/dybvalpl.i hDaybooksetValidation}



/*c1171*/ def buffer b1dom for dom_mstr.
/*c1171*/ def buffer b2dom for dom_mstr.
 
/* INITIALIZE PERSISTENT PROCEDURES */
run mfairunh.p
   (input "dybvalpl.p",
    input ?,
    output hDaybooksetValidation).
 
run setvalidMode in hDaybooksetValidation
               (input  true).
 
form
   rqm_mstr.rqm_nbr  colon 14
   rqm_vend          colon 36
   rqm_ship          colon 60
with frame a side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
form
   rqm_req_date        colon 14
   rqm_sub             colon 36
   rqm_curr            colon 60
   rqm_lang            colon 72
   rqm_need_date       colon 14
   rqm_cc              colon 36
   rqm_direct          colon 60
   rqm_due_date        colon 14
   rqm_site            colon 36
   email_opt_entry     colon 60
   rqm_eby_userid      colon 14
   rqm_daybookset      colon 36
   rqm_entity          colon 55
   rqm_rqby_userid     colon 14
   rqm_job             colon 36
   rqm_status          colon 60
   rqm_end_userid      colon 14
   rqm_project         colon 36
   hdr_cmmts           colon 60
   rqm_reason          colon 14
   rqm_aprv_stat       colon 60
   rqm_rmks            colon 14
with frame b side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).
 
form
   rqm_disc_pct    colon 14
   rqm_pr_list2    colon 36
   rqm_pr_list     colon 68
with frame c side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame c:handle).
 
{us/mf/mfadform.i "vend" 1 SUPPLIER}
{us/mf/mfadform.i "ship_to" 41 SHIP_TO}
 
{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'grs_installed',
     input '',
     input '',
     input '',
     output using_grs)"}
 
if not using_grs then do:
   /*GRS not enabled*/
   run p_ip_msg (input 2122, input 4).
   pause.
   leave.
end.
 
find first gl_ctrl where gl_domain = global_domain no-lock.
find first poc_ctrl where poc_domain = global_domain no-lock.
find first mfc_ctrl
   where mfc_domain = global_domain
   and  mfc_field = "poc_pt_req"
no-lock no-error.
 
daybookSetBySiteInstalled = poc_dybkset_by_site.
 
if available mfc_ctrl then poc_pt_req = mfc_logical.
 
{us/bbi/gprun.i ""rqpma.p""}
find first rqf_ctrl where rqf_domain = global_domain no-lock.
view frame dtitle.
 
if available rqf_ctrl then
    prohibit_changes = rqf_ctrl.rqf_prohibit.
 
/*GET MOST RECENTLY ACCESSED REQ NUMBER AND DISPLAY*/
{us/bbi/gprun.i ""rqidf.p""
         "(input 'get',
           input 'reqnbr',
           input-output get_rqmnbr)"}
 
display
   get_rqmnbr @ rqm_mstr.rqm_nbr
with frame a.
 
mainloop:
repeat:
   view frame a.
   view frame vend.
   view frame ship_to.
   view frame b.
 
   userid_modifying = global_userid.
 
   /* GET DISCOUNT TABLE SETTING */
   {us/po/popcdisc.i}
 
   display
      approval_stat_desc @ rqm_aprv_stat
   with frame b.
 
   run get_rqm_nbr(output continue).
   if not continue then leave.
 
   /*BLANK REQ NBR ENTERED, CREATE A NEW ONE FROM CONTROL FILE*/
   if input frame a rqm_mstr.rqm_nbr = ""
   then do:
      run get_nxt_rqm_nbr(output rqmnbr).
 
      display rqmnbr @ rqm_mstr.rqm_nbr with frame a.
   end. /*  if input frame a rqm_mstr.rqm_nbr = "" */
   else do:
      find rqm_mstr using frame a rqm_nbr
         where rqm_mstr.rqm_domain = global_domain
      no-lock no-error.
 
      if available rqm_mstr then do:
         if rqm_rtdto_purch then
            /*REQUISITION ROUTED TO PURCHASING*/
            run p_ip_msg (input 2106, input 2).
 
         /* CHECK USER WHO IS MODIFYING THIS REQ.  MUST BE EITHER:
          * A) THE ORIGINAL ENTERER
          * B) THE REQUESTER
          * C) THE CURRENT ROUTE-TO USER */
 
         if index(program-name(2),"rqapmt.") > 0
            and input frame a rqm_nbr = get_rqmnbr
         then do:
            /* SPECIAL CASE: IF THIS PROGRAM IS CALLED BY RQAPMT.P,
            * THEN RQAPMT.P PROVIDES A USERID (THE "APPROVER").
            * THIS ID IS USED INSTEAD OF GLOBAL_USERID FOR THE ABOVE
            * CHECKS, IF ATTEMPTING TO MODIFY THE REQ REFERENCED BY
            * RQAPMT.P.  THIS ALLOWS ALTERNATES DEFINED FOR THE
            * APPROVER TO MODIFY REQUISITIONS. */
 
            {us/bbi/gprun.i ""rqidf.p""
                     "(input 'get',
                       input 'approver',
                       input-output userid_modifying)"}
         end.
 
         /* If the approval process started for this req
          * don't allow editing */
         if prohibit_changes
            and userid_modifying <> rqm_buyer
            and can-find (first rqda_det
            where rqda_domain = global_domain
            and   rqda_nbr = frame a rqm_nbr
            and   rqda_action = ACTION_APPROVE)
          then do:
             /*Cannot Edit. Approvals Exist For This Requisition*/
             run p_ip_msg (input 5873, input 3).
             undo, retry.
         end. /* if prohibit_changes */
 
         if not
            (userid_modifying = rqm_eby_userid
            or
            userid_modifying = rqm_rqby_userid
            or
            userid_modifying = rqm_rtto_userid)
         then do:
            /*YOU MUST BE THE ENTERER, REQUESTOR, OR CURRENT ROUTE TO*/
            run p_ip_msg (input 2113, input 3).
            undo, retry.
         end.
 
         /* DOES NOT ALLOW BUYER TO MODIFY A PARTIALLY APPROVED REQUISITION */
         /* WHEN THE REQUISITION IS NOT ROUTED TO BUYER AND BUYER CODE IS   */
         /* SAME AS EITHER ENTERER CODE OR REQUESTOR CODE                   */
         if prohibit_changes
            and can-find (first rqda_det
                   where rqda_domain = global_domain
                   and   rqda_nbr    = frame a rqm_nbr
                   and   rqda_action = ACTION_APPROVE)
            and not (      userid_modifying = rqm_buyer
                       and userid_modifying = rqm_rtto_userid
                    )
         then do:
            /* YOU MUST BE THE CURRENT ROUTE-TO */
            run p_ip_msg (input 11207, input 3).
            undo, retry.
         end. /* if prohibit_changes */
 
         if not can-find(first rqh_hist
            where rqh_domain = global_domain
            and   rqh_nbr    = frame a rqm_nbr
            and   rqh_action = ACTION_CREATE_REQ)
         then do:
 
            /* WRITE HISTORY RECORD */
            action_entry = ACTION_CREATE_REQ.
            {us/bbi/gprun.i ""rqwrthst.p""
               "(input rqm_nbr,
                 input 0,
                 input action_entry,
                 input userid_modifying,
                 input '',
                 input email_sent_to)"}
 
            /* CHECK AND SET THE OPEN AND APRV STATUS INDICATORS */
            {us/bbi/gprun.i ""rqsetopn.p"" "(input rqm_nbr)"}
 
         end. /* IF NOT CAN-FIND(FIRST rqh_hist */
 
      end.  /* if available rqm_mstr */
   end.  /* else do */
 
   find first rqf_ctrl where rqf_domain = global_domain no-lock.
 
   do transaction:
      assign
         prev_sub        = ""
         prev_cc         = ""
         prev_entity     = ""
         prev_job        = ""
         prev_site       = ""
         l_prev_vend     = ""
         l_ext_cost1     = 0
         l_max_ext_cost1 = 0.
 
      find rqm_mstr using frame a rqm_nbr
         where rqm_domain = global_domain
      exclusive-lock no-error.
 
      if available rqm_mstr then do:
         new_req = no.
 
         /*MODIFYING EXISTING RECORD*/
         run p_ip_msg (input 10, input 1).
 
         assign
            hdr_cmmts   = rqm_cmtindx <> 0
            prev_sub    = rqm_sub
            prev_cc     = rqm_cc
            prev_entity = rqm_entity
            prev_job    = rqm_job
            prev_site   = rqm_site
            l_prev_vend = rqm_vend.
      end.
      else do:
         new_req = yes.
 
         clear frame vend.
         clear frame ship_to.
         clear frame b.
 
         /*ADDING NEW RECORD*/
         run p_ip_msg (input 1, input 1).
 
         create rqm_mstr.
         assign
            rqm_domain      = global_domain
            rqm_curr        = base_curr
            rqm_direct      = false
            rqm_due_date    = today
            rqm_email_opt   = rqf_email_opt
            rqm_ent_date    = today
            rqm_eby_userid  = global_userid
            rqm_entity      = gl_entity
            rqm_ex_rate     = 1
            rqm_ex_rate2    = 1
            rqm_exru_seq    = 0
            rqm_ex_ratetype = ""
            rqm_nbr         = input frame a rqm_nbr
            rqm_need_date   = today
            rqm_pent_userid = ?
            rqm_req_date    = today
            rqm_rqby_userid = global_userid
            rqm_rtto_userid = global_userid
            rqm_aprv_stat   = APPROVAL_STATUS_UNAPPROVED
            rqm_ship        = poc_ship
            rqm_status      = ""
            rqm_cls_date    = ?
/*q9006*/   rqm__dec01      = 900
            rqm_print       = true.
 
         if recid(rqm_mstr) = -1 then.
      end.  /* else do */
 
      assign
         l_prev_list  = rqm_pr_list
         l_prev_list2 = rqm_pr_list2.
 
      run display_req(input recid(rqm_mstr), input true).
 
      do on error undo, retry:
 
         oldcurr = rqm_curr.
 
         set rqm_vend with frame a
         editing:
            {us/mf/mfnp.i
               vd_mstr rqm_vend  " vd_mstr.vd_domain = global_domain and
               vd_addr "  rqm_vend vd_addr vd_addr}
 
            if recno <> ? then do:
               display
                  vd_addr @ rqm_vend
               with frame a.
 
               {us/mf/mfaddisp.i "input rqm_vend" vend}
            end.
         end.  /* set with editing */
 
         if rqm_vend > "" then do:
            find vd_mstr
               where vd_domain = global_domain
               and   vd_addr = rqm_vend
            no-lock no-error.
 
            if not available vd_mstr then do:
               /*NOT A VALID SUPPLIER*/
               run p_ip_msg (input 2, input 3).
               undo, retry.
            end.
 
           /* start blocked transaction library to run persistently */
            run mfairunh.p
               (input "mgbltrpl.p",
                input  ?,
                output hBlockedTransactionlibrary).
 
            {us/mg/mgbltrpl.i "hBlockedTransactionlibrary"}
 
            /* Check to see if Supplier has any blocked transactions */
            if blockedSupplier(input rqm_vend,
                               input {&PO001},
                               input true,
                               input "Supplier")
            then do:
               undo, retry.
            end.
 
            delete procedure hBlockedTransactionlibrary.
 
            if new_req then do:
               assign
                  rqm_site = vd_site
                  rqm_curr = vd_curr
                  rqm_lang = vd_lang
                  rqm_rmks = vd_rmks
                  rqm_buyer = vd_buyer
                  rqm_disc_pct = vd_disc_pct
                  rqm_pr_list = vd_pr_list
                  rqm_pr_list2 = vd_pr_list2.

/*d2101* start added code >>>>   */
              find first b1dom no-lock
              where b1dom.dom_domain = global_domain
              no-error.
              if available b1dom
              then do:
                find first b2dom no-lock
                where b2dom.dom_domain =b1dom.dom_user1
                no-error.
                if available b2dom 
                and can-find(first si_mstr where si_site = b2dom.dom_user2)
                then rqm_site = b2dom.dom_user2.
              end.
/*d2101* end   added code <<<<<  */
 
               display
                  rqm_curr
                  rqm_lang
                  rqm_rmks
               with frame b.
            end.  /* if new_req */
            else do:
               if vd_curr <> rqm_curr then do:
                  /*SUPPLIER CURRENCY IS*/
                  {us/bbi/pxmsg.i &MSGNUM=2108 &ERRORLEVEL=2 &MSGARG1=vd_curr}
               end.
 
                if l_prev_vend = "" then do:
                   assign
                      rqm_lang     = vd_lang
                      rqm_buyer    = vd_buyer
                      rqm_pr_list  = vd_pr_list
                      rqm_pr_list2 = vd_pr_list2
                      rqm_rmks     = if rqm_rmks = ""
                                     then
                                        vd_rmks
                                     else
                                        rqm_rmks
                      rqm_disc_pct = vd_disc_pct.
 
                   display
                      rqm_lang
                      rqm_rmks
                   with frame b.
                end. /* IF l_prev_vend = "" */
            end.
         end.  /* if rqm_vend > "" */
      end.  /* do on error undo, retry */
 
      {us/mf/mfaddisp.i rqm_vend vend}
 
      do on error undo, retry:
         set
            rqm_ship
         with frame a
         editing:
            {us/mf/mfnp.i
               ad_mstr rqm_ship  " ad_domain = global_domain and ad_addr "
               rqm_ship ad_addr ad_addr}
 
            if recno <> ? then do:
               display
                  ad_addr @ rqm_ship
               with frame a.
 
               {us/mf/mfaddisp.i "input rqm_ship" ship_to}
            end.
         end.  /* set with editing */
 
         {us/mf/mfaddisp.i rqm_ship ship_to}
 
         if rqm_ship > ""
            and not available ad_mstr
         then do:
            /*NOT A VALID CHOICE*/
            run p_ip_msg (input 13, input 3).
            undo, retry.
         end.
      end.  /* do on error undo, retry */
 
      if execname <> "rqapmt.p"
      then do:
         ststatus = stline[2].
         status input ststatus.
      end. /* IF execname <> "rqrqmt.p" */
      prev_status = rqm_status.
 
      if rqm_daybookset = ""
      then do:
         if daybookSetBySiteInstalled
         then do:
            if rqm_vend <> ""
            then do:
               for first vd_mstr
                  where vd_domain = global_domain
                  and   vd_addr   = rqm_vend
               no-lock:
                  if can-find(first dybs_mstr
                                 where dybs_domain = global_domain
                                 and   dybs_code   = vd_daybookset
                                 and   dybs_site   = rqm_site)
                  then
                     rqm_daybookset = vd_daybookset.
               end. /* FOR FIRST vd_mstr */
            end. /* IF rqm_vend <> "" */
 
            if rqm_daybookset = ""
            then do:
               for first dybs_mstr
                  where dybs_domain = global_domain
                  and   dybs_type   = '2'
                  and   dybs_site   = rqm_site
               no-lock:
                  rqm_daybookset = dybs_code.
               end. /* FOR FIRST dybs_mstr */
            end. /* IF rqm_daybookset = "" */
 
            if rqm_daybookset = ""
            then do:
               for first dybs_mstr
                  where dybs_domain = global_domain
                  and dybs_type     = '2'
                  and dybs_site     = ''
               no-lock:
                  rqm_daybookset = dybs_code.
               end. /* FOR FIRST dybs_mstr */
            end. /* IF rqm_daybookset = "" */
 
            if rqm_daybookset = ""
            then
               rqm_daybookset = getDefaultDaybookSetBySite( input rqm_vend).
         end. /* IF daybookSetBySiteInstalled */
         else
            rqm_daybookset = getDefaultDaybookSetBySite( input rqm_vend).
      end. /* IF rqm_daybookset = "" */
 
      display
         rqm_req_date
         rqm_need_date
         rqm_due_date
         rqm_rqby_userid
         rqm_end_userid
         rqm_reason
         rqm_rmks
         rqm_sub
         rqm_cc
         rqm_site
         rqm_daybookset
         rqm_job
         rqm_project
         rqm_curr
         rqm_lang
         rqm_direct
         email_opt_entry
         rqm_entity
         rqm_status
         hdr_cmmts
      with frame b.
 
      setb:
      do on error undo, retry:
         if execname <> "rqapmt.p"
         then
            set
               rqm_req_date
               rqm_need_date
               rqm_due_date
               rqm_rqby_userid
               rqm_end_userid
               rqm_reason
               rqm_rmks
               rqm_sub
               rqm_cc
               rqm_site
               rqm_daybookset
               rqm_job
               rqm_project
               rqm_curr    when (new_req)
               rqm_lang    when (new_req)
               rqm_direct  when (new_req)
               email_opt_entry
               rqm_entity
               rqm_status
               hdr_cmmts
               go-on (F5 "CTRL-D")
            with frame b.
         else
            set
               rqm_req_date
               rqm_need_date
               rqm_due_date
               rqm_rqby_userid
               rqm_end_userid
               rqm_reason
               rqm_rmks
               rqm_sub
               rqm_cc
               rqm_site
               rqm_daybookset
               rqm_job
               rqm_project
               rqm_curr    when (new_req)
               rqm_lang    when (new_req)
               rqm_direct  when (new_req)
               email_opt_entry
               rqm_entity
               rqm_status
               hdr_cmmts
            with frame b.
 
         if not new_req
            and (rqm_sub <> prev_sub
               or rqm_cc <> prev_cc)
         then
            /* CHANGING SUBACCT/CC MAY CAUSE INVALID ACCOUNT COMBINATION */
            {us/bbi/pxmsg.i &MSGNUM = 11016 &ERRORLEVEL = 2}
 
         if      (execname <> "rqapmt.p")
            and  (lastkey  = keycode("F5")
               or lastkey  = keycode("CTRL-D"))
         then do:
            find first rqpo_ref
               where rqpo_domain  = global_domain
               and   rqpo_req_nbr = rqm_nbr
            no-lock no-error.
 
            if available rqpo_ref then do:
               /*CAN'T DELETE REQUISITION, REFERENCED BY POS*/
               run p_ip_msg (input 2081, input 3).
               undo, retry.
            end.
 
            del-yn = yes.
 
            /*PLEASE CONFIRM DELETE*/
            {us/bbi/pxmsg.i &MSGNUM=11 &ERRORLEVEL=1 &CONFIRM=del-yn}
 
            if not del-yn then undo, retry.
            line = 0.
 
            for each rqd_det
               where rqd_domain = global_domain
               and   rqd_nbr = rqm_nbr
            exclusive-lock:
               {us/px/pxrun.i &PROC  = 'deleteAllTransactionComments' &PROGRAM = 'gpcmxr.p'
                              &HANDLE=ph_gpcmxr
                              &PARAM="(rqd_cmtindx)"
                              &NOAPPERROR=True
                              &CATCHERROR=True}
 
               /*DELETE ANY MRP DETAIL RECORDS*/
               for each mrp_det
                  where mrp_domain = global_domain
                  and   mrp_dataset = "req_det"
                  and   mrp_nbr = rqd_nbr
                  and   mrp_line = string(rqd_line)
               exclusive-lock:
                  {us/in/inmrp.i &part=mrp_det.mrp_part &site=mrp_det.mrp_site}
 
                  delete mrp_det.
               end.
 
               delete rqd_det.
               line = line + 1.
            end.  /* for each rqd_det */
 
            /* LINE ITEM RECORD(S) DELETED  */
            {us/bbi/pxmsg.i &MSGNUM=24 &ERRORLEVEL=1 &MSGARG1=line}
            hide message.
 
            {us/px/pxrun.i &PROC  = 'deleteAllTransactionComments' &PROGRAM = 'gpcmxr.p'
                           &HANDLE=ph_gpcmxr
                           &PARAM="(rqm_cmtindx)"
                           &NOAPPERROR=True
                           &CATCHERROR=True}
 
            clear frame a.
            clear frame b.
 
            /*SEND EMAILS*/
            email_sent_to = "".
 
            if not new_req then do:
/*c1267*       {us/bbi/gprun.i ""rqemsend.p"" */
/*c1267*/      {us/bbi/gprun.i ""xxrqemsend.p""
                        "(input  recid(rqm_mstr),
                          input  ACTION_DELETE_REQ,
                          output email_sent_to)"}
            end.
 
            /* WRITE HISTORY RECORD */
            {us/bbi/gprun.i ""rqwrthst.p""
                     "(input rqm_nbr,
                       input 0,
                       input ACTION_DELETE_REQ,
                       input userid_modifying,
                       input '',
                       input email_sent_to)"}
 
            for each rqda_det
               where rqda_domain = global_domain
               and   rqda_nbr    = rqm_nbr
            exclusive-lock:
               delete rqda_det.
            end.
 
            requisitionNumber = rqm_mstr.rqm_nbr. 
            
            delete rqm_mstr.
 
            /* DELETE QRA REQUISITION APPROVAL RECORD */
            if QraConfig:IsModuleAvailable ("qad.requisition")
            then do:
               {us/px/pxrun.i &PROC='deleteRequisitionApproval'
                              &PROGRAM='rqqraxr.p'
                              &PARAM="(input global_domain, 
                                       input requisitionNumber)"
                              &NOAPPERROR=true
                              &CATCHERROR=true}
            end.                
          
            next mainloop.
         end.  /* if F5 or CTRL-D */
 
         if rqm_req_date = ? then do:
            /* INVALID DATE */
            run p_ip_msg (input 27, input 3).
            if not batchrun
            then do:
               next-prompt rqm_req_date with frame b.
               undo, retry.
            end. /* IF NOT BATCHRUN */
            else
               undo mainloop, leave mainloop.
         end.
 
         if rqm_need_date = ? then do:
            /* INVALID DATE */
            run p_ip_msg (input 27, input 3).
            if not batchrun
            then do:
               next-prompt rqm_need_date with frame b.
               undo, retry.
            end. /* IF NOT BATCHRUN */
            else
               undo mainloop, leave mainloop.
         end.
 
         if rqm_due_date = ? then do:
            /* INVALID DATE */
            run p_ip_msg (input 27, input 3).
            if not batchrun
            then do:
               next-prompt rqm_due_date with frame b.
               undo, retry.
            end. /* IF NOT BATCHRUN */
            else
               undo mainloop, leave mainloop.
         end.

         if new_req then do:
            if rqm_req_date < today then do:
               /* Requisition date cannot be before today */
               {us/bbi/pxmsg.i &MSGNUM=1949 &ERRORLEVEL=3
                        &MSGARG1="getTermLabel('REQUISITION',15)"}
               if not batchrun
               then do:
                  next-prompt rqm_req_date with frame b.
                  undo, retry.
               end. /* IF NOT BATCHRUN */
               else
                  undo mainloop, leave mainloop.
            end.
 
            if rqm_need_date < today then do:
               /* Need date cannot be before today */
               {us/bbi/pxmsg.i &MSGNUM=1949 &ERRORLEVEL=3
                        &MSGARG1="getTermLabel('NEED',6)"}
               if not batchrun
               then do:
                  next-prompt rqm_need_date with frame b.
                  undo, retry.
               end. /* IF NOT BATCHRUN */
               else
                  undo mainloop, leave mainloop.
            end.
 
            if rqm_due_date < today then do:
               /* Due date cannot be before today */
               {us/bbi/pxmsg.i &MSGNUM=1949 &ERRORLEVEL=3
                        &MSGARG1="getTermLabel('DUE',5)"}
               if not batchrun
               then do:
                  next-prompt rqm_due_date with frame b.
                  undo, retry.
               end. /* IF NOT BATCHRUN */
               else
                  undo mainloop, leave mainloop.
            end.
         end.  /* if new_req */
         else do:
            if rqm_req_date  <  rqm_ent_date
            then do:
               /* REQUISITION DATE CANNOT BE BEFORE REQUISITION CREATE DATE */
               {us/bbi/pxmsg.i &MSGNUM=20060 &ERRORLEVEL=3}
               next-prompt
                  rqm_req_date
               with frame b.
               if not batchrun
               then
                  undo, retry.
               else
                  undo mainloop, leave mainloop.
            end. /* IF rqm_req_date  <  rqm_ent_date */
         end. /* IF NOT new_req */
 
         daybookDate = today.
         if rqm_due_date <> ? and rqm_due_date > today then
            daybookDate = rqm_due_date.
 
         if daybookSetBySiteInstalled
         then do:
            /* VALIDATE DAYBOOK SET BY SITE */
            run validateDaybookSet in hDaybookSetValidation
               ( input  rqm_daybookset,
                 input  rqm_site,
                 input  daybookDate,
                 output iErrorNumber,
                 output cErrorArgs).
 
            if iErrorNumber > 0
            then do:
               run displayPxMsg in hDaybooksetValidation
                  (input iErrorNumber, input 3, input cErrorArgs).
               next-prompt rqm_daybookset with frame b.
               undo, retry.
           end.
         end.
         else do:
            /* IS IT A ACTIVE DAYBOOKSET CODE? */
            run validateDaybookSet in hDaybooksetValidation
               ( input  rqm_daybookset,
                 input  "",
                 input  daybookDate,
                 output iErrorNumber,
                 output cErrorArgs).
 
            if iErrorNumber > 0
            then do:
               run displayPxMsg in hDaybooksetValidation
                  ( input iErrorNumber, input 3, input cErrorArgs).
               next-prompt rqm_daybookset with frame b.
               undo, retry.
            end.
         end.
 
         if not can-find
            (usr_mstr where usr_userid = rqm_rqby_userid)
         then do:
            /* UNAVAILABLE USER */
            run p_ip_msg (input 2054, input 3).
            next-prompt rqm_rqby_userid with frame b.
            undo, retry.
         end.
 
         /* Validate if user is active for selection */
         if can-find(first usr_mstr
            where usr_userid = rqm_rqby_userid and not usr_active)
         then do:
            /* User is not active for selection */
            run p_ip_msg (input 10163, input 3).
            next-prompt rqm_rqby_userid with frame b.
            undo, retry.
         end.
 
/*c1603* start deleted code >>>>>>>>
         if not can-find
            (first emp_mstr where emp_domain = rqm_domain
                      and         emp_addr   = rqm_end_userid)
         then do:
            /* EMPLOYEE NUMBER DOES NOT EXIST */
            run p_ip_msg (input 520, input 3).
            next-prompt rqm_end_userid with frame b.
            undo, retry.
         end. /* IF NOT CAN-FIND emp_mstr */
 
         /* VALIDATE THAT EMPLOYEE IS ACTIVE */
         if can-find(first emp_mstr
            where emp_domain = rqm_domain
            and   emp_addr   = rqm_end_userid
            and not emp_active)
         then do:
            /* EMPLOYEE IS NOT ACTIVE */
            run p_ip_msg (input 7051, input 3).
            next-prompt rqm_end_userid with frame b.
            undo, retry.
         end. /* IF CAN-FIND(FIRST emp_mstr ... */
**c1603* end   deleted code <<<<<<< */
 
         if gl_verify then do:
            if rqm_sub > "" then do:
               if not can-find(sb_mstr
                  where sb_domain = global_domain
                  and   sb_sub = rqm_sub)
               then do:
                  /* INVALID SUBACCOUNT CODE */
                  run p_ip_msg (input 3131, input 3).
                  next-prompt rqm_sub with frame b.
                  undo, retry.
               end.
            end.
 
            if rqm_cc > "" then do:
               if not can-find(cc_mstr
                                  where cc_domain = global_domain
                                  and   cc_ctr    = rqm_cc
                                  and   cc_active)
               then do:
                  /* INVALID COST CENTER */
                  run p_ip_msg (input 3057, input 3).
                  next-prompt rqm_cc with frame b.
                  undo, retry.
               end. /* IF NOT CAN-FIND cc_mstr */
            end. /* IF rqm_cc > "" */
         end.  /* if gl_verify */
         assign siteEntity = "".
         if rqm_site > "" then do:
            if not can-find(si_mstr
               where si_domain = global_domain
               and   si_site   = rqm_site)
            then do:
               /* SITE DOES NOT EXIST */
               run p_ip_msg (input 708, input 3).
               next-prompt rqm_site with frame b.
               undo, retry.
            end.
 
            find si_mstr
               where si_domain = global_domain
               and   si_site = rqm_site
            no-lock no-error.
 
 /*cy1011* start deleted code >>>>>>>>
            if si_db <> global_db then do:
               /* SITE IS NOT ASSIGNED TO THIS DOMAIN */
               run p_ip_msg (input 6251, input 3).
               next-prompt rqm_site with frame b.
               undo, retry.
            end.
            
            /* VALIDATE USER ACCESS RIGHTS TO THIS SITE  */
            {us/bbi/gprun.i ""gpsiver.p""
                     "(input  rqm_site,
                       input  ?,
                       output return_int)"}
 
            if return_int = 0 
            then do:
               /* USER DOES NOT HAVE ACCESS TO THIS SITE */
               run p_ip_msg (input 725, input 3).
               next-prompt rqm_site with frame b.
               undo, retry.
            end. /* IF return_int = 0 */
 
            /* CHANGED MESSAGE FROM ERROR TO WARNING SO THAT        */
            /* MULTI-ENTITY IS ALLOWED WHILE REQUISITION GENERATION */
            if si_entity <> rqm_entity then do:
               /* SITE ENTITY DOES NOT MATCH REQUISITION ENTITY */
               run p_ip_msg (input 2107, input 2).
            end.
            assign siteEntity = si_entity.
 *cy1011* end deleted code <<<<<<<< */
         end.  /* if rqm_site > "" */
         /* Validate cost centre is allowed in the entity. */
         if rqm_cc > "" then do:
            assign
               icGLCode         = ""
               icDivisionCode   = ""
               icCostCentreCode = rqm_cc
               icProjectCode    = ""
               icDomainCode     = global_domain
               icCompanyCode    = siteEntity.
            {proxy/bcoavalidation/apivalcoarestrictionindomainrun.i}
            if oiReturnStatus <> 0 then
            do:
               if oiReturnStatus > 0 then errorLevel = 2.
               else errorLevel = 3.
               /* Start qflib.p - QAD Financials Library running persistently */
               run mfairunh.p
                 (input 'qflib.p',
                  input '?',
                  output hQADFinancialsLib) no-error.
               run processErrors in hQADFinancialsLib
               (input table tFcMessages,
                input errorLevel) no-error.
               if errorLevel = 3 then
               do:
                  next-prompt rqm_cc with frame b.
                  undo, retry.
               end.
            end.
         end.
/*d2101* start deleted code >>>>>>>>
         if not can-find(en_mstr
            where en_domain   = global_domain
            and   en_entity   = rqm_entity)
            and   rqm_entity <> gl_entity
         then do:
            /* INVALID ENTITY */
            run p_ip_msg (input 3061, input 3).
            next-prompt rqm_entity with frame b.
            undo, retry.
         end.
*d2101* end deleted code <<<<<<<< */
 
         {us/gp/gprunp.i "mcpl" "p" "mc-chk-valid-curr"
                   "(input  input rqm_curr,
                     output mc-error-number)"}
 
         if mc-error-number <> 0
         then do:
            run p_ip_msg (input mc-error-number, input 3).
            if not batchrun
            then do:
               next-prompt rqm_curr with frame b.
               undo, retry.
            end. /* IF NOT BATCHRUN */
            else
               undo mainloop, leave mainloop.
         end. /* IF mc-error-number <> 0 */
 
         if rqm_curr <> rqf_appr_curr then do:
 
            {us/bbi/gprun.i ""rqexrt.p""
                     "(input  rqm_curr,
                       input  rqf_appr_curr,
                       input  temp_ratetype,
                       output temp_rate,
                       output temp_rate2,
                       output mc-error-number)"}
 
            if mc-error-number <> 0 
            then do:
               /* NO EXCHANGE RATE FOR APPROVAL CURRENCY */
               run p_ip_msg (input 2087, input 3).
               if batchrun
               then
                  undo mainloop, leave mainloop.
               else
                  undo, retry.
            end. /* IF mc-error-number <> 0 */
         end.
 
         if new_req and rqm_curr <> base_curr then do:
            /* CREATE EXCHANGE RATE USAGE RECORDS */
            {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
                      "(input  rqm_curr,
                        input  base_curr,
                        input  rqm_ex_ratetype,
                        input  rqm_req_date,
                        output rqm_ex_rate,
                        output rqm_ex_rate2,
                        output mc-error-number)"}
 
            if mc-error-number <> 0
            then do:
               run p_ip_msg (input mc-error-number, input 3).
               if batchrun
               then
                  undo mainloop, leave mainloop.
               else
                  undo, retry.
            end. /* IF mc-error-number <> 0 */
         end.
 
    if rqm_vend > ""
       and new_req
    then do:
       /* INVALILD LANGUAGE */
       {us/px/pxrun.i &PROC = 'validateLanguageCode'
                &PROGRAM = 'gplngxr.p'
                &HANDLE=ph_gplngxr
                &PARAM = "(input 'rqm_lang',
                           input rqm_Lang,
                           input yes,
                           input '')"
                &NOAPPERROR=true
                &CATCHERROR=true}
      if return-value <> {&SUCCESS-RESULT}
      then do:
         if c-application-mode <> "API"
         then do:
            next-prompt rqm_lang with frame b no-validate.
            undo setb, retry setb.
         end.  /* IF c-application-mode = "API"*/
         else
            undo, return error.
      end.  /* if return-value <> {&SUCCESS-RESULT} then do: */
 
    end.   /* IF rqm_vend > ""  */
 
 
         if rqm_job > ""
            and not can-find(first rqj_mstr
            where rqj_domain = global_domain
            and   rqj_job = rqm_job)
         then do:
            /* INVALID JOB */
            run p_ip_msg (input 2066, input 3).
            next-prompt rqm_job with frame b.
            undo, retry.
         end.
 
         if rqm_job > ""     and
            can-find (first rqj_mstr
            where rqj_domain  = global_domain
            and   rqj_job     = rqm_job
            and ((rqj_start  <> ?
            and   rqj_start   > today)
            or   (rqj_end    <> ?
            and   rqj_end    < today)))
         then do:
            /* INVALID JOB EFFECTIVE DATE RANGE */
            run p_ip_msg (input 6899, input 3).
            if not batchrun
            then do:
               next-prompt rqm_job with frame b.
               undo, retry.
            end. /* IF NOT BATCHRUN */
            else
               undo mainloop, leave mainloop.
         end.
 
         do with frame b:
            if not ({gpglproj.v rqm_project}) then do:
               /* INVALID PROJECT */
               run p_ip_msg (input 3128, input 3).
               next-prompt rqm_project with frame b.
               undo, retry.
            end.
         end.

/*d3032>>*  start added code >>>>>> */
         find first Domains where Domains.DomainCode = global_domain
	 no-lock no-error.
	 find first DomainSharedSet 
	     where DomainSharedSet.Domain_ID = Domains.Domain_ID
	     no-lock no-error.
         if available DomainSharedSet then do:


            if can-find(first GL
	                where GL.SharedSet_ID = DomainSharedSet.SharedSet_ID
			and GL.GLcode = rqm_acct
			and GL.GLAnalysisLimitation = "BOTHREQUIRED"
			and rqm_cc = ""
			and rqm_project = "")
            or can-find(first GL
	                where GL.SharedSet_ID = DomainSharedSet.SharedSet_ID
			and GL.GLcode = rqm_acct
			and GL.GLisCostCentreAccount
			and rqm_cc = "")
            then do:
               /* COST CENTER OR PROJECT OR BOTH ARE REQUIRED */
               run p_ip_msg (input 1729, input 3).
               next-prompt rqm_project with frame b.
               undo, retry.
	    end.
	 end.
/*d3032<<* end added code   <<<<<<<<  */




         if rqm_status = "c"
         then
            rqm_cls_date = today.
         else if rqm_status = ""
         then
            rqm_cls_date = ?.
 
         if rqm_status <> ""
            and rqm_status <> "x"
            and rqm_status <> "c"
         then do:
            /* INVALID STATUS */
            run p_ip_msg (input 19, input 3).
            next-prompt rqm_status with frame b.
            undo, retry.
         end.
 
         if prev_status = ""
            and rqm_status = "x"
         then do:
            find first rqpo_ref
               where rqpo_domain = global_domain
               and rqpo_req_nbr  = rqm_nbr
            no-lock no-error.
 
            if available rqpo_ref then do:
               /* CAN'T CANCEL REQUISITION, REFERENCED BY POS */
               run p_ip_msg (input 2079, input 3).
               next-prompt rqm_status with frame b.
               undo, retry.
            end.
         end.
 
         {us/gp/gplngv.i
            &file=""rqf_ctrl""
            &field=""rqf_email_opt""
            &mnemonic=email_opt_entry
            &isvalid=email_opt_valid}
 
         if not email_opt_valid then do:
            /* NOT A VALID EMAIL OPTION */
            run p_ip_msg (input 2092, input 3).
            next-prompt email_opt_entry with frame b.
            undo, retry.
         end.
 
         /* CAN'T USE EMAIL IF CONTROL FILE OPTION SAYS NO EMAIL */
         if rqf_email_opt = EMAIL_OPT_NO_EMAIL then do:
            {us/gp/gplnga2n.i
               &file=""rqf_ctrl""
               &field=""rqf_email_opt""
               &code=rqm_email_opt
               &mnemonic=email_opt_entry
               &label=email_opt_desc}
 
            if rqm_email_opt <> EMAIL_OPT_NO_EMAIL then do:
               /* NOT A VALID EMAIL OPTION */
               run p_ip_msg (input 2092, input 3).
               next-prompt email_opt_entry with frame b.
               undo, retry.
            end.
         end.
      end.
 
      /* GET DISC%, PRICE TABLE CODE, DISC TABLE CODE FROM USER */
      hide frame b no-pause.
 
      /* GET DEFAULT PRICE AND DISCOUNT LISTS */
      for first vd_mstr
         where vd_domain = global_domain
         and   vd_addr   = rqm_vend
      no-lock: end.
 
      if available vd_mstr
         and new_req
      then
         assign
            rqm_pr_list  = vd_pr_list
            rqm_pr_list2 = vd_pr_list2.
 
      display
         rqm_disc_pct
         rqm_pr_list2
         rqm_pr_list
      with frame c.
 
      setpriceinfo:
      do on error undo, retry:
         set
            rqm_disc_pct
            rqm_pr_list2
            rqm_pr_list
         with frame c.
 
         /* CHECK PRICE LIST */
         {us/ad/adprclst.i
            &price-list     = "rqm_pr_list2"
            &curr           = "rqm_curr"
            &list-class     = {&SUPPLIER-CLASSIFICATION}
            &price-list-req = "poc_pt_req"
            &undo-label     = "setpriceinfo"
            &with-frame     = "with frame c"
            &disp-msg       = "yes"
            &warning        = "yes"}
 
         /*CHECK DISCOUNT LIST*/
         {us/ad/addsclst.i
            &disc-list      = "rqm_pr_list"
            &curr           = "rqm_curr"
            &list-class     = {&SUPPLIER-CLASSIFICATION}
            &disc-list-req  = "disc_tbl_req"
            &undo-label     = "setpriceinfo"
            &with-frame     = "with frame c"
            &disp-msg       = "yes"
            &warning        = "yes"}
      end.
 
      /* USER CHANGING STATUS FROM CANCELLED TO OPEN */
      /* OR USER CHANGING STATUS FROM CLOSED TO OPEN */
      if (prev_status = "x"
         or  prev_status = "c")
         and rqm_status = ""
      then do:
         yn = no.
         /* DO YOU WISH TO REOPEN ALL REQUISITION LINE ITEMS? */
         {us/bbi/pxmsg.i &MSGNUM=2084 &ERRORLEVEL=1 &CONFIRM=yn}
 
         if yn then do:
            run reopen_all_line_records
               (input recid(rqm_mstr),
                input rndmthd,
                input mc-error-number).
         end.
      end.
 
      /* USER CHANGING STATUS FROM OPEN TO CANCELLED */
      if prev_status = "" and rqm_status = "x" then do:
         run cancel_requisition(input recid(rqm_mstr)).
      end.
 
      /** USER CHANGING STATUS FROM OPEN TO CLOSED **/
      if prev_status = ""
         and rqm_status = "c"
      then do:
         run close_requisition(input recid(rqm_mstr)).
      end.
 
      if not new_req
         and (rqm_pr_list  <> l_prev_list
         or   rqm_pr_list2 <> l_prev_list2)
      then do:
         /* RECALCULATE ITEM PRICE AND COST */
         {us/bbi/pxmsg.i &MSGNUM=640 &ERRORLEVEL=1 &CONFIRM=yn &CONFIRM-TYPE='LOGICAL'}
 
         if yn then
            run recalc_price_cost
               (buffer rqm_mstr,
                input rndmthd,
                input mc-error-number).
      end.
 
      /* GET EMAIL OPTION INTERNAL VALUE */
      {us/gp/gplnga2n.i
         &file=""rqf_ctrl""
         &field=""rqf_email_opt""
         &code=rqm_email_opt
         &mnemonic=email_opt_entry
         &label=email_opt_desc}
 
      /* COMMENTS */
      assign
         global_type = ""
         global_lang = rqm_lang.
 
      if hdr_cmmts then do:
         hide frame c no-pause.
         hide frame b no-pause.
         hide frame vend no-pause.
         hide frame ship_to no-pause.
         hide frame a no-pause.
 
         assign
            global_ref = rqm_vend
            cmtindx = rqm_cmtindx.
 
         {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""po_mstr"")"}
 
         rqm_cmtindx = cmtindx.
      end.
   end. /* do transaction */
 
   /* LINE ITEM DATA ENTRY */
 
   hide frame c no-pause.
   hide frame b no-pause.
   hide frame vend no-pause.
   hide frame ship_to no-pause.
   hide frame a no-pause.
 
   /* Identify context for QXtend */
   {us/gp/gpcontxt.i
      &STACKFRAG = 'rqrqmta,rqrqmt0,rqrqmt'
      &FRAME = 'price-list-failed' &CONTEXT = 'LINE'}
 
   /* Identify context for QXtend */
   {us/gp/gpcontxt.i
      &STACKFRAG = 'rqrqmta,rqrqmt0,rqrqmt'
      &FRAME = 'disc-list-failed' &CONTEXT = 'LINE'}
 
/*q9006*   {us/bbi/gprun.i ""rqrqmta.p"" */
/*q9006*/  {us/bbi/gprun.i ""xxrqrqmta.p""
            "(input  recid(rqm_mstr),
              input  new_req,
              output l_stat_open)"}
 
   /* Clear context for QXtend */
   {us/gp/gpcontxt.i
      &STACKFRAG = 'rqrqmta,rqrqmt0,rqrqmt'
      &FRAME = 'price-list-failed'}
 
   /* Clear context for QXtend */
   {us/gp/gpcontxt.i
      &STACKFRAG = 'rqrqmta,rqrqmt0,rqrqmt'
      &FRAME = 'disc-list-failed'}
 
   view frame a.
 
   /* SEND EMAILS */
   email_sent_to = "".
 
   if not new_req then do:
      {us/bbi/gprun.i ""rqemsend.p""
               "(input  recid(rqm_mstr),
                 input  ACTION_MODIFY_REQ,
                 output email_sent_to)"}
   end.
 
   /* WRITE HISTORY RECORD */
   if new_req then
      action_entry = ACTION_CREATE_REQ.
   else
      action_entry = ACTION_MODIFY_REQ.
 
   {us/bbi/gprun.i ""rqwrthst.p""
            "(input rqm_nbr,
              input 0,
              input action_entry,
              input userid_modifying,
              input '',
              input email_sent_to)"}
 
   /* CHECK AND SET THE OPEN AND APRV STATUS INDICATORS */
   if not l_stat_open then
      {us/bbi/gprun.i ""rqsetopn.p"" "(input rqm_nbr)"}
 
   /* SAVE ACCESSED REQ NUMBER FOR OTHER PGMS TO USE */
   get_rqmnbr = rqm_nbr.
 
   {us/bbi/gprun.i ""rqidf.p""
            "(input 'put',
              input 'reqnbr',
              input-output get_rqmnbr)"}
 
   /* IF RQAPMT.P OR RQRTMT.P IS A CALLING PROGRAM
    * (EITHER DIRECT OR THIS CALLED FROM AN FKEY)
    * JUST DISPLAY TOTALS, OTHERWISE ASK THE
    * USER IF TO INVOKE RQAPMT.P */
 
   i = 1.
 
   do while program-name(i) <> ?:
      if index(program-name(i),"rqapmt.") > 0 or
         index(program-name(i),"rqrtmt.") > 0
         then leave.
 
      i = i + 1.
   end.
 
   {us/bbi/gprun.i ""rqtotdsp.p""
            "(input  recid(rqm_mstr),
              output total_frame_hdl)"}
 
   if program-name(i) <> ? then do:
      do on endkey undo, leave:
         pause.
      end.
   end.
 
   if program-name(i) = ? then do:
      approve_or_route = false.
 
      do on endkey undo, leave:
         /* ROUTE THIS REQUISITION? */
         {us/bbi/pxmsg.i &MSGNUM=2083 &ERRORLEVEL=1 &CONFIRM=approve_or_route}
      end.
 
      if approve_or_route then do:
         /* ENSURE THE VALID PRICE LIST/ DISCOUNT TABLE */
         {us/px/pxrun.i &PROC='validatePriceListTable'
                  &PROGRAM='rqgrsxr.p'
                  &HANDLE=ph_rqgrsxr
                  &PARAM="(buffer rqm_mstr,
                           input poc_pt_req,
                           input poc_ctrl.poc_pl_req)"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
 
         if return-value <> {&SUCCESS-RESULT}
         then do:
            if valid-handle(total_frame_hdl)
            then
               total_frame_hdl:hidden = true.
 
            hide frame c no-pause.
            hide frame b no-pause.
            hide frame vend no-pause.
            hide frame ship_to no-pause.
            hide frame a no-pause.
 
            if not batchrun
            then
               undo mainloop, retry mainloop.
            else
               undo mainloop, leave mainloop.
         end.  /* IF return-value <> {&SUCCESS-RESULT} THEN DO: */
 
         /* SAVE CURRENT ROUTE-TO FOR RQRTMT.P */
         route_to = rqm_rtto_userid.
 
         {us/bbi/gprun.i ""rqidf.p""
                  "(input 'put',
                    input 'approver',
                    input-output route_to)"}
 
         {us/bbi/gprun.i ""rqrtmt0.p""}
      end.
   end.
 
   /* THE FOLLOWING IS BECAUSE THE TOTAL FRAME IS STILL
    * VISIBLE AFTER RETURNING FROM RQTOTDSP.P */
 
   if valid-handle(total_frame_hdl) then
      total_frame_hdl:hidden = true.
 
   hide frame c no-pause.
   hide frame b no-pause.
   hide frame vend no-pause.
   hide frame ship_to no-pause.
   hide frame a no-pause.
 
   /* UPDATE APPROVAL_STAT_DESC WITH FINAL VALUE OF RQM_APRV_STAT */
   {us/gp/gplngn2a.i
      &file     = ""rqm_mstr""
      &field    = ""rqm_aprv_stat""
      &code     = rqm_aprv_stat
      &mnemonic = approval_stat_entry
      &label    = approval_stat_desc}
 
      /* Call QRA method that checks if a record exists in RequisitionApproval.
         If it does, it updates the record, if it does not, it creates the record */
      if QraConfig:IsModuleAvailable ("qad.requisition")
      then do:
         {us/px/pxrun.i &PROC='submitRequisitionApproval'
                        &PROGRAM='rqqraxr.p'
                        &PARAM="(input recid(rqm_mstr))"
                        &NOAPPERROR=true
                        &CATCHERROR=true} 
      end.
                        
   release rqm_mstr.
end. /* mainloop: repeat */
 
/* Reset the validation mode to AR in case the procedure library */
/* is still in memory when another user runs a program requiring */
/* AR validation.                                                */
run setvalidMode in hDaybooksetValidation
               (input  false).
 
delete procedure hDaybooksetValidation no-error.
 
if valid-handle(total_frame_hdl) then
   total_frame_hdl:hidden = true.
 
hide frame c no-pause.
hide frame b no-pause.
hide frame vend no-pause.
hide frame ship_to no-pause.
hide frame a no-pause.
 
/******************************************************/
/******************************************************/
/**                 PROCEDURES                       **/
/******************************************************/
/******************************************************/
 
PROCEDURE cancel_requisition:
   define input parameter p_rqm_recid as recid no-undo.
   define buffer rqm_mstr for rqm_mstr.
   define buffer rqd_det  for rqd_det.
 
   find rqm_mstr where recid(rqm_mstr) = p_rqm_recid exclusive-lock.
   assign
      rqm_total     = 0
      rqm_max_total = 0.
 
   for each rqd_det
       where rqd_domain = global_domain
       and  rqd_nbr     = rqm_nbr
   exclusive-lock:
      rqd_status = "x".
 
      /* UPDATE MRP */
      {us/bbi/gprun.i ""rqmrw.p""
               "(input rqd_nbr,
                 input rqd_line)"}
   end.
 
   /* REQUISITION CANCELLED */
   run p_ip_msg (input 2098, input 3).
 
END PROCEDURE.
 
PROCEDURE reopen_all_line_records:
   define input parameter p_rqm_recid   as   recid           no-undo.
   define input parameter p_rndmthd     like rnd_rnd_mthd    no-undo.
   define input parameter p_mc_error_no like msg_nbr         no-undo.
 
   define variable        l_extcost     like l_ext_cost1     no-undo.
   define variable        l_maxextcost  like l_max_ext_cost1 no-undo.
   define buffer rqm_mstr for rqm_mstr.
   define buffer rqd_det  for rqd_det.
 
   find rqm_mstr where recid(rqm_mstr) = p_rqm_recid exclusive-lock.
 
   /* GET ROUNDING METHOD FROM CURRENCY MASTER */
   {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
             "(input  rqm_curr,
               output p_rndmthd,
               output p_mc_error_no)"}
 
   if p_mc_error_no <> 0 then
      {us/bbi/pxmsg.i &MSGNUM=3088 &ERRORLEVEL=2}
 
    for each rqd_det
       where rqd_domain = global_domain
       and   rqd_nbr    = rqm_nbr
   exclusive-lock:
      rqd_status = "".
 
      /* UPDATE MRP */
      run p_calc_netprice(buffer rqd_det).
 
      {us/bbi/gprun.i ""rqmrw.p""
               "(input rqd_nbr,
                 input rqd_line)"}
 
      assign
          l_extcost = (if rqd_pur_cost <> 0 then
                          rqd_req_qty * rqd_pur_cost
                          * (1 - (- (l_net_price1
                          - rqd_pur_cost)
                          / (rqd_pur_cost / 100)) / 100)
                       else
                          0)
         l_maxextcost =  (rqd_req_qty * rqd_max_cost).
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output l_extcost,
                 input p_rndmthd)"}
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output l_maxextcost,
                 input p_rndmthd)"}
 
      assign
         l_ext_cost1     = l_ext_cost1     + l_extcost
         l_max_ext_cost1 = l_max_ext_cost1 + l_maxextcost.
 
   end.
 
   assign
      rqm_total     = l_ext_cost1
      rqm_max_total = l_max_ext_cost1.
 
   /* REQUISITION REOPENED */
   run p_ip_msg (input 2104, input 1).
 
END PROCEDURE.
 
PROCEDURE get_rqm_nbr:
   define output parameter p_continue as logical no-undo.
 
   p_continue = false.
 
   do on endkey undo, leave:
      prompt-for
         rqm_mstr.rqm_nbr
      with frame a
      editing:
         {us/mf/mfnp.i rqm_mstr rqm_nbr  " rqm_mstr.rqm_domain = global_domain and
          rqm_nbr "  rqm_nbr rqm_nbr rqm_nbr}
 
         if recno <> ? then do:
            run display_req(input recno, input false).
         end.
      end.
 
      p_continue = true.
   end.
END PROCEDURE.
 
PROCEDURE display_req:
   define input parameter p_rqm_recid as recid no-undo.
   define input parameter p_exclusive_lock as logical no-undo.
 
   define buffer rqf_ctrl for rqf_ctrl.
 
   find first rqf_ctrl where rqf_domain = global_domain no-lock.
 
   if p_exclusive_lock then
      find rqm_mstr where recid(rqm_mstr) = p_rqm_recid exclusive-lock.
   else
      find rqm_mstr where recid(rqm_mstr) = p_rqm_recid no-lock.
 
   if new_req then
      hdr_cmmts = rqf_hcmmts.
   else
      hdr_cmmts = rqm_cmtindx <> 0.
 
   display
      rqm_nbr
      rqm_vend
      rqm_ship
   with frame a.
 
   {us/mf/mfaddisp.i rqm_vend vend}
   {us/mf/mfaddisp.i rqm_ship ship_to}
 
   {us/gp/gplngn2a.i
      &file=""rqf_ctrl""
      &field=""rqf_email_opt""
      &code=rqm_email_opt
      &mnemonic=email_opt_entry
      &label=email_opt_desc}
 
   {us/gp/gplngn2a.i
      &file=""rqm_mstr""
      &field=""rqm_aprv_stat""
      &code=rqm_aprv_stat
      &mnemonic=approval_stat_entry
      &label=approval_stat_desc}
 
   display
      rqm_req_date
      rqm_need_date
      rqm_due_date
      rqm_eby_userid
      rqm_rqby_userid
      rqm_end_userid
      rqm_reason
      rqm_rmks
      rqm_sub
      rqm_cc
      rqm_site
      rqm_daybookset
      rqm_entity
      rqm_job
      rqm_project
      rqm_curr
      rqm_lang
      rqm_direct
      email_opt_entry
      rqm_status
      hdr_cmmts
      approval_stat_desc @ rqm_aprv_stat
   with frame b.
 
END PROCEDURE.
 
PROCEDURE close_requisition:
/* TO CLOSE A REQUISITION */
 
   define input parameter p_rqm_recid as recid no-undo.
   define buffer rqm_mstr for rqm_mstr.
   define buffer rqd_det  for rqd_det.
 
   find rqm_mstr
      where recid(rqm_mstr) = p_rqm_recid
   exclusive-lock no-error.
 
      rqm_cls_date  = today.
 
   for each rqd_det
      where rqd_domain = global_domain
      and   rqd_nbr    = rqm_nbr
      and   rqd_status = ""
   exclusive-lock:
      rqd_status = "c".
 
      /*UPDATE MRP*/
      {us/bbi/gprun.i ""rqmrw.p""
               "(input rqd_nbr,
                 input rqd_line)"}
 
   end. /* FOR EACH RQD_DET */
 
   /* REQUISITION IS CLOSED */
   run p_ip_msg (input 3325, input 1).
 
END PROCEDURE. /* PROCEDURE CLOSE_REQUISITION */
 
PROCEDURE retrieve_vendor_item_data:
   define input  parameter p_vendor               like rqm_vend     no-undo.
   define input  parameter p_part                 like rqd_part     no-undo.
   define output parameter p_got_vendor_item_data like mfc_logical  no-undo.
   define output parameter p_q_qty                like rqd_req_qty  no-undo.
   define output parameter p_q_um                 like rqd_um       no-undo.
   define output parameter p_curr                 like rqm_curr     no-undo.
   define output parameter p_vpart                like rqd_vpart    no-undo.
   define output parameter p_q_price              like rqd_pur_cost no-undo.
   define output parameter p_mfgr                 like vp_mfgr      no-undo.
   define output parameter p_mfgr_part            like vp_mfgr_part no-undo.
 
   p_got_vendor_item_data = false.
 
   for each vp_mstr
      where vp_domain = global_domain
      and   vp_part   = p_part
      and   vp_vend   = p_vendor
   no-lock
   break by vp_q_date descending:
 
      if first(vp_q_date) then do:
         assign
            p_q_qty                = vp_q_qty
            p_q_um                 = vp_um
            p_curr                 = vp_curr
            p_vpart                = vp_vend_part
            p_q_price              = vp_q_price
            p_mfgr                 = vp_mfgr
            p_mfgr_part            = vp_mfgr_part
            p_got_vendor_item_data = true.
 
         leave.
      end.
   end. /* FOR EACH vp_mstr */
 
END PROCEDURE. /* RETRIEVE_VENDOR_ITEM_DATA */
 
PROCEDURE p_ip_msg:
   define input parameter l_num  as integer no-undo.
   define input parameter l_stat as integer no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=l_num &ERRORLEVEL=l_stat}
 
END PROCEDURE. /* P_IP_MSG */
 
PROCEDURE recalc_price_cost:
   define       parameter  buffer rqm_mstr for  rqm_mstr.
   define input parameter  p_rndmthd       like rnd_rnd_mthd no-undo.
   define input parameter  p_mc_error_no   like msg_nbr      no-undo.
   define variable         l_count         as   integer      no-undo.
 
   define buffer rqd_det  for rqd_det.
 
   /* THE REQUISITION STATUS SHOULD BE CHANGED TO UNAPPROVED */
   /* IF COSTS ARE RECALCULATED.                             */
   if (rqm_status = "x"
      or  rqm_status = "c")
   then
      run reopen_all_line_records
         (input recid(rqm_mstr),
          input rndmthd,
          input mc-error-number).
 
   loop-rqd-det:
   for each rqd_det
      where rqd_domain    = global_domain
      and  (rqd_vend      =  rqm_vend
      and   rqd_nbr       =  rqm_nbr
      and   rqd_type     <> "M"
      and  (rqd_pr_list  <> rqm_pr_list
      or    rqd_pr_list2 <> rqm_pr_list2))
   exclusive-lock:
 
      assign
         l_prev_ext_cost     = rqd_req_qty * rqd_pur_cost
                             * (1 - (rqd_disc_pct / 100))
         l_prev_max_ext_cost = rqd_req_qty * rqd_max_cost
         rqd_pr_list         = rqm_pr_list
         rqd_pr_list2        = rqm_pr_list2.
 
      for first pt_mstr
          where pt_domain = global_domain
          and   pt_part = rqd_part
         no-lock: end.
 
      if available pt_mstr then do:
 
         /* INITIAL DEFAULT FOR PRICE */
         assign
            l_vendor_part      = ""
            l_mfgr             = ""
            l_mfgr_part        = ""
            l_vendor           = rqd_vend
            l_got_vendor_price = false.
 
         /* FIND STANDARD COST AND GL COST */
         {us/bbi/gprun.i ""gpsct05.p""
                  "(input  rqd_part,
                    input  rqd_site,
                    input  2,
                    output glxcst,
                    output l_cur_cost)"}
 
         l_base_cost = glxcst * rqd_um_conv.
 
         if l_vendor > "" then do:
            /* RETRIEVE VENDOR ITEM DATA */
            run retrieve_vendor_item_data
               (input  rqd_vend,
                input  rqd_part,
                output l_got_vendor_item_data,
                output l_vendor_q_qty,
                output l_vendor_q_um,
                output l_vendor_q_curr,
                output l_vendor_part,
                output l_vendor_price,
                output l_mfgr,
                output l_mfgr_part).
 
            if l_got_vendor_item_data
               and l_vendor_price <> 0
            then do:
               if (l_vendor_q_curr = rqm_curr
                  or  l_vendor_q_curr = "")
               then do:
 
                  /* CONVERT PRICE PER UM CONVERSION */
                  if l_vendor_q_um = rqd_um then
                     l_conversion_factor = 1.
                  else do:
                     {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                                    &HANDLE=ph_gpumxr
                                    &PARAM="(input rqd_part,
                                             input rqd_um,
                                             input l_vendor_q_um,
                                             output l_conversion_factor)"
                                    &NOAPPERROR=True
                                    &CATCHERROR=True}
                  end.
 
                  if l_conversion_factor = ? then do:
                     /* NO UM CONVERSION EXISTS FOR SUPPLIER ITEM */
                     {us/bbi/pxmsg.i &MSGNUM  = 2086  &ERRORLEVEL = 2
                              &MSGARG1 = l_vendor_part}
                  end.
 
                  /* ONLY CONVERT TO THE VENDOR ITEM */
                  /* PRICE IF THE UM MATCHES AND THE */
                  /* RQ QTY IS >= THAN THE QUOTE QTY */
                  if l_vendor_q_um = rqd_um then do:
                     if rqd_req_qty >= l_vendor_q_qty then
                        assign
                           rqd_pur_cost =
                              l_vendor_price / l_conversion_factor
                           l_got_vendor_price = true.
                  end.
                  else do:
                     l_req_qty = rqd_req_qty / l_conversion_factor.
 
                     if l_req_qty >= l_vendor_q_qty then
                        assign
                           rqd_pur_cost =
                              l_vendor_price / l_conversion_factor
                           l_got_vendor_price = true.
 
                  end.
               end.  /* IF l_vendor_q_curr = rqm_curr or "" */
               else do:
                  /* SUPPLIER ITEM NOT FOR SAME CURRENCY */
                  {us/bbi/pxmsg.i  &MSGNUM  = 2109  &ERRORLEVEL = 2
                            &MSGARG1 = l_vendor_q_curr}
               end.
            end. /* IF l_got_vendor_item_data AND l_vendor_price <> 0   */
         end. /* IF l_vendor > "" */
 
         /* DIDN'T FIND A VENDOR PART PRICE, USE STD COST */
         if not l_got_vendor_price then do:
 
            /* CONVERT FROM BASE TO FOREIGN CURRENCY */
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                      "(input  base_curr,
                        input  rqm_curr,
                        input  rqm_ex_rate2,
                        input  rqm_ex_rate,
                        input  glxcst,
                        input  false, /* DO NOT ROUND */
                        output rqd_pur_cost,
                        output mc-error-number)"}
 
            /* CONVERT PRICE PER UM CONVERSION */
            if pt_um = rqd_um then
               l_conversion_factor = 1.
            else do:
               {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                              &HANDLE=ph_gpumxr
                              &PARAM="(input rqd_part,
                                       input pt_um,
                                       input rqd_um,
                                       output l_conversion_factor)"
                              &NOAPPERROR=True
                              &CATCHERROR=True}
            end.
 
            if l_conversion_factor = ? then do:
               /* NO UM CONVERSION EXISTS */
               {us/bbi/pxmsg.i  &MSGNUM  = 33 &ERRORLEVEL = 2
                         &MSGARG1 = rqd_um}
            end.
            else
               rqd_pur_cost = rqd_pur_cost * l_conversion_factor.
 
         end. /* IF NOT l_got_vendor_price */
      end.  /* IF AVAILABLE pt_mstr */
      else
         /*RESET COST FIELDS*/
         rqd_pur_cost = 0.
 
      /* INITIAL DEFAULT FOR DISCOUNT */
      assign
         rqd_disc_pct = rqm_disc_pct
         /* GET PRICE FROM PRICE TABLES IF THERE IS ONE */
         l_net_price  = rqd_pur_cost * (1 - rqd_disc_pct / 100)
         l_lineffdate = rqd_due_date.
 
      if l_lineffdate = ? then
         l_lineffdate = if rqm_req_date <> ? then rqm_req_date else today.
 
      if rqd_pr_list2 <> "" then do:
         l_net_price = ?.
 
         {us/bbi/gprun.i ""gppclst.p""
                  "(input        rqd_pr_list2,
                    input        rqd_part,
                    input        rqd_um,
                    input        rqd_um_conv,
                    input        l_lineffdate,
                    input        rqm_curr,
                    input        {&SUPPLIER-CLASSIFICATION},
                    input        true,
                    input        poc_pt_req,
                    input-output rqd_pur_cost,
                    input-output l_net_price,
                    output       l_minprice,
                    output       l_maxprice,
                    output       l_pc_recno)"}
 
         if l_net_price <> ? then
            l_net_price = l_net_price * (1 - rqd_disc_pct / 100).
      end.
 
      if poc_pt_req
         and (rqd_pr_list2 = ""
         or l_pc_recno   = 0)
      then do:
 
         /* DISPLAY ERROR IF IT IS INVENTORY ITEM */
         if can-find (pt_mstr
            where pt_domain = global_domain and pt_part = rqd_part)
         then do:
            /* REQUIRED PRICE TABLE FOR ITEM # IN UM # NOT FOUND */
            {us/bbi/pxmsg.i &MSGNUM  = 6231  &ERRORLEVEL = 3
                     &MSGARG1 = rqd_part
                     &MSGARG2 = rqd_um}
 
            undo loop-rqd-det, next loop-rqd-det.
         end.
 
         /* DISPLAY WARNING IF IT IS MEMO ITEM */
         else do:
 
            /* REQUIRED PRICE TABLE FOR ITEM # IN UM # NOT FOUND */
            {us/bbi/pxmsg.i &MSGNUM  = 6231  &ERRORLEVEL = 2
                     &MSGARG1 = rqd_part
                     &MSGARG2 = rqd_um}
 
         end.
      end. /* IF poc_pt_req ... */
 
      /* GET DISCOUNT FROM DISCOUNT TABLES IF THERE IS ONE */
      if rqd_pr_list <> "" then do:
         {us/bbi/gprun.i ""gppccal.p""
                  "(input        rqd_part,
                    input        rqd_req_qty,
                    input        rqd_um,
                    input        rqd_um_conv,
                    input        rqm_curr,
                    input        {&SUPPLIER-CLASSIFICATION},
                    input        rqd_pr_list,
                    input        l_lineffdate,
                    input        rqd_pur_cost,
                    input        disc_tbl_req,
                    input        rqm_disc_pct,
                    input-output rqd_pur_cost,
                    output       rqd_disc_pct,
                    input-output l_net_price,
                    output       l_pc_recno)"}
      end.
 
      if disc_tbl_req
         and (rqd_pr_list = ""
         or l_pc_recno  = 0)
      then do:
 
         /* DISPLAY ERROR IF IT IS INVENTORY ITEM */
         if can-find (pt_mstr
            where pt_domain = global_domain and pt_part = rqd_part)
         then do:
 
            /* REQUIRED DISCOUNT TABLE FOR ITEM # IN */
            /* UM # NOT FOUND                        */
            {us/bbi/pxmsg.i  &MSGNUM  = 982  &ERRORLEVEL = 3
                      &MSGARG1 = rqd_part
                      &MSGARG2 = rqd_um}
 
            undo loop-rqd-det, next loop-rqd-det.
         end.
 
         /* DISPLAY WARNING IF IT IS MEMO ITEM */
         else do:
 
            /* REQUIRED DISCOUNT TABLE FOR ITEM # IN UM # NOT FOUND */
            {us/bbi/pxmsg.i  &MSGNUM  = 982  &ERRORLEVEL = 2
                      &MSGARG1 = rqd_part
                      &MSGARG2 = rqd_um}
 
         end.
      end. /* IF disc_tbl_req ... */
 
      /* UNIT COST IS SET TO NET PRICE WHEN THERE IS NO       */
      /* STANDARD COST ON THE ITEM BUT THE REQ. REFERS        */
      /* TO A PRICE TABLE OR DISCOUNT TABLE.  THE DISC% IS    */
      /* RETURNED AS 0.00 SINCE IT IS BASED ON THE UNIT COST. */
      /* THE NET PRICE IS PASSED BACK FROM THE SUB-PROGRAMS   */
      /* AND PLUGGED INTO THE UNIT COST FIELD TO SHOW THE     */
      /* DISCOUNTED PRICE.                                    */
 
      l_count = 0.
      /*BUILD APPROVER LIST*/
      {us/bbi/gprun.i ""rqbal.p"" "(input recid(rqm_mstr))"}
      /*CHECK FOR PRODUCT LINE APPROVERS*/
      for each ttdal no-lock
         break by ttdal_site
               by ttdal_prod_line
               by ttdal_apr_userid:
         for first rqda_det
            where rqda_det.rqda_domain = global_domain
            and   rqda_nbr             = rqm_nbr
            and   rqda_apr_userid      = ttdal_apr_userid
         no-lock:
         end. /* FOR FIRST rqda_det */
         if available rqda_det
         then do:
            l_count = l_count + 1.
         end. /*IF AVAILABLE rqda_det */
      end. /* FOR EACH ttdal */
      /*CHECK FOR VERTICAL APPROVERS*/
      for each ttval
      no-lock:
         for first rqda_det
            where rqda_det.rqda_domain = global_domain
            and   rqda_nbr             = rqm_nbr
            and   rqda_apr_userid = ttval_apr_userid
         no-lock:
         end. /* FOR FIRST rqda_det */
         if available rqda_det
         then do:
            l_count = l_count + 1.
         end. /*IF AVAILABLE rqda_det */
      end. /* FOR EACH ttval */
      /*CHECK FOR JOB APPROVERS*/
      for each ttjal
      no-lock:
         for first rqda_det
            where rqda_det.rqda_domain = global_domain
            and   rqda_nbr             = rqm_nbr
            and   rqda_apr_userid      = ttjal_apr_userid
         no-lock:
         end. /* FOR FIRST rqda_det */
         if available rqda_det
         then do:
            l_count = l_count + 1.
         end. /*IF AVAILABLE rqda_det */
      end. /* FOR EACH ttjal */
      /*CHECK FOR HORIZONTAL APPROVERS*/
      for each tthal no-lock
         break by tthal_category
               by tthal_apr_userid:
         for first rqda_det
            where rqda_det.rqda_domain = global_domain
            and   rqda_nbr             = rqm_nbr
            and   rqda_apr_userid      = tthal_apr_userid
         no-lock:
         end. /* FOR FIRST rqda_det */
         if available rqda_det
         then do:
            l_count = l_count + 1.
         end. /*IF AVAILABLE rqda_det */
      end. /* FOR EACH tthal */
 
      if rqd_pur_cost = 0 and
         l_net_price <> ?
      then
         rqd_pur_cost = l_net_price.
 
      assign
         rqd_max_cost   = if rqd_disc_pct < 0 then
                             rqd_pur_cost * (1 - rqd_disc_pct / 100)
                          else
                             rqd_pur_cost
         /* UPDATE REQUISITION TOTALS AND STATUS */
         l_ext_cost     = rqd_req_qty * rqd_pur_cost
                        * (1 - (rqd_disc_pct / 100))
         l_max_ext_cost = rqd_req_qty * rqd_max_cost.
 
      if l_count <> 0
      then
         /* SET LINE STATUS */
         rqd_aprv_stat  = APPROVAL_STATUS_UNAPPROVED.
 
      /* GET ROUNDING METHOD FROM CURRENCY MASTER */
      {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
                "(input rqm_curr,
                  output p_rndmthd,
                  output p_mc_error_no)"}
 
      if p_mc_error_no <> 0 then
         {us/bbi/pxmsg.i &MSGNUM=3088  &ERRORLEVEL=2}
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output l_ext_cost,
                 input p_rndmthd)"}
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output l_prev_ext_cost,
                 input p_rndmthd)"}
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output l_max_ext_cost,
                 input p_rndmthd)"}
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output l_prev_max_ext_cost,
                 input p_rndmthd)"}
 
      assign
         rqm_total      = rqm_total + l_ext_cost - l_prev_ext_cost
         rqm_max_total  = rqm_max_total + l_max_ext_cost
                        - l_prev_max_ext_cost
         action_entry   = ACTION_MODIFY_REQ_LINE
         rqm_status     = ""
         rqm_cls_date   = ?.
 
      if l_count <> 0
      then
         rqm_aprv_stat  = APPROVAL_STATUS_UNAPPROVED.
 
      /* WRITE HISTORY RECORD */
      {us/bbi/gprun.i ""rqwrthst.p""
               "(input rqm_nbr,
                 input rqd_line,
                 input action_entry,
                 input userid_modifying,
                 input '',
                 input '')"}
 
   end. /* FOR EACH rqd_det */
 
END PROCEDURE. /* RECALC_PRICE_COST */
 
PROCEDURE p_calc_netprice:
   /* TO CALCULATE THE NET PRICE FOR REQUISITION LINE */
   define parameter buffer rqddet for rqd_det.
 
   if available rqddet then do:
      if rqddet.rqd__qadc01 <> "" then
         l_net_price1 = getDecFromChar(rqddet.rqd__qadc01).
      else
         l_net_price1 = rqddet.rqd_pur_cost
                      * (1 - rqddet.rqd_disc_pct / 100).
   end.
   else
      l_net_price1 = 0.
 
END. /* PROCEDURE p_calc_netprice */
 
/*BLANK REQ NBR ENTERED, CREATE A NEW ONE FROM CONTROL FILE*/
PROCEDURE get_nxt_rqm_nbr:
   define output parameter op_rqmnbr like rqm_mstr.rqm_nbr no-undo.
 
   define buffer rqf_ctrl for rqf_ctrl.
   define buffer rqm_mstr for rqm_mstr.
 
   op_rqmnbr = "".
 
   for first rqf_ctrl
      where rqf_domain = global_domain
   exclusive-lock
   transaction
   on error undo, leave on endkey undo, return
   :
 
      if length(rqf_pre) + length(string(rqf_nbr)) > 8
      then
         rqf_nbr = 1.
 
      op_rqmnbr = rqf_pre + string(rqf_nbr).
 
      do while can-find(first rqm_mstr
                           where rqm_domain = global_domain
                           and   rqm_nbr    = op_rqmnbr)
      :
         rqf_nbr = rqf_nbr + 1.
 
         if length(rqf_pre) + length(string(rqf_nbr)) > 8
         then
            rqf_nbr = 1.
 
         op_rqmnbr = rqf_pre + string(rqf_nbr).
 
      end.
 
      rqf_nbr = rqf_nbr + 1.
 
      if length(rqf_pre) + length(string(rqf_nbr)) > 8
      then
         rqf_nbr = 1.
 
      release rqf_ctrl.
 
   end. /* FOR FIRST rqf_ctrl */
 
END. /* PROCEDURE get_nxt_rqm_nbr */
