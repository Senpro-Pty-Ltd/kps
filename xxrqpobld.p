/* xxrqpobld.p - Requisition Purchase Build Maintenance                     */
/* rqpobld.p - Requisition Purchase Build Maintenance                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqpobld.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
 
/* REVISION 8.5       LAST MODIFIED: 04/15/97  BY: *J1Q2* Patrick Rowan     */
/* REVISION 8.5       LAST MODIFIED: 10/28/97  BY: *J24N* Patrick Rowan     */
 
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98  BY: *L007* A. Rahane         */
/* REVISION: 8.6E     LAST MODIFIED: 03/31/98  BY: *J2G7* Samir Bavkar      */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98  BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98  BY: *J314* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KP* myb                */
/* Old ECO marker removed, but no ECO header exists *F0PN*                  */
/* Revision: 1.9.1.10      BY: Mugdha Tambe   DATE: 10/01/01 ECO: *P012*      */
/* Revision: 1.9.1.11  BY: Rajaneesh S. DATE: 08/29/02 ECO: *M1BY* */
/* Revision: 1.9.1.13  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.9.1.14  BY: Ashwini G.         DATE: 12/13/06 ECO: *P5J5* */
/* Revision: 1.9.1.15  BY: Dhananjay G        DATE: 02/27/08 ECO: *P6MJ* */
/* Revision: 1.9.1.17  BY: Rajat Kulshreshtha DATE: 06/02/09 ECO: *Q2YW* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB     LAST MODIFIED: 11-AUG-2011              BY: gbg *c1227*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1228*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/*!
 ----------------------------------------------------------------------------
 DESCRIPTION: Copy requisitions to a new or existing purchase order.
              Supports the multi-line Purchase Requisition Module of MFG/PRO.
 
 Notes:
 1) Valid requisitions must be approved and routed to the buyer.
 2) Valid requisition lines must contain open qty.
 3) Requisition lines marked out of tolerence can be put on a PO, and
    will be re-evaluated for out of tolerence during PO Maintenance.
 4) Valid purchase orders are open orders, not closed or cancelled.
 5) Purchase orders cannot be blanket orders.
 
============================================================================
!*/

using com.qad.eefin.bemployee.EmployeeAddressByEmpCoCode.

{us/mf/mfdtitle.i}
{us/gp/gpuid.i}
{us/gp/gprunpdf.i "mcpl" "p"}
 
/* VARIABLES */
define variable req_nbr               like rqm_mstr.rqm_nbr no-undo
   label "Requisition".
define variable req_nbr1              like rqm_mstr.rqm_nbr no-undo.
define variable supplier              like rqm_vend no-undo.
define variable supplier1             like rqm_vend no-undo.
define variable need_date             like rqd_need_date no-undo.
define variable need_date1            like rqd_need_date no-undo.
define variable part                  like rqd_part    no-undo.
define variable part1                 like rqd_part    no-undo.
define variable site                  like rqd_site    no-undo.
define variable buyer_id              like rqm_buyer   no-undo.
define variable job_name              like rqm_job     no-undo.
define variable ship                  like rqd_ship    no-undo.
define variable currency              like rqm_curr    no-undo.
define variable requester             like rqm_rqby_userid no-undo.
define variable open_qty              like rqd_req_qty no-undo.
define variable qty_um                like rqd_um      no-undo.
define variable l_subject             as   character   no-undo.
define variable l_reqlist             as   character   no-undo.
define variable l_emailsent           like mfc_logical no-undo.
define variable l_povend              like po_vend     no-undo.
define variable l_end                 as   character format "x(35)" no-undo.
/* LOGICALS */
define variable blank_suppliers       like mfc_logical no-undo
   label "Blank Suppliers Only".
define variable default_copy          like mfc_logical no-undo
   label "Default Copy".
define variable include_mrp_type      like mfc_logical no-undo
   label "Include MRP Items".
define variable include_mro_type      like mfc_logical no-undo
   label "Include MRO Items".
 
define variable l_override_remarks    like mfc_logical no-undo
   label "Override Remarks".
 
/* COUNTERS */
define variable rqpo_wrk_cntr         as integer no-undo.
define variable using_grs            like mfc_logical no-undo.
define variable rndmthd              like rnd_rnd_mthd no-undo.
define variable oldcurr              like po_curr     no-undo.
define variable mc-error-number      like msg_nbr     no-undo.
define variable pod_pur_cost_unit_fmt as character
   initial "->>>,>>>,>>9.99<<<" no-undo.
define variable pod_pur_cost_ext_fmt  as character    no-undo.
define variable l_pod_pur_cost_ext    as decimal      no-undo.
 
/*q9006* start added code */
def new shared var ss-site  like si_site.
def new shared var vdom               like dom_domain.
def new shared var vdom1              like dom_domain.
def new shared var prevdomain         like dom_domain.
def new shared var prevdomainx        like dom_domain.
def new shared var prevdb             as char.
/*q9006* end   added code */

/* CONSTANTS */
{us/rq/rqconst.i}
 
/* SHARED VARIABLES*/
{us/rq/rqpovars.i "NEW"}
 
define buffer del_qad_wkfl for qad_wkfl.
 
/*STREAMS*/
define stream mailNotice.
 
/* FRAME Z: SELECTION FORM */
form
   req_nbr             colon 20
   req_nbr1            colon 49 label "To"
   supplier            colon 20
   supplier1           colon 49 label "To"
   part                colon 20
   part1               colon 49 label "To"
   need_date           colon 20
   need_date1          colon 49 label "To"
/*q9006*/   vdom       colon 20 
/*q9006*/   vdom1      colon 49 label {us/t0/t001.i}
   skip(1)
   buyer_id            colon 36
   site                colon 36
   requester           colon 36
   job_name            colon 36
   ship                colon 36
   currency            colon 36
   blank_suppliers     colon 36
   include_mrp_type    colon 36
   include_mro_type    colon 36
   include_hcmmts      colon 36
   include_lcmmts      colon 36
   l_override_remarks  colon 36
   default_copy        colon 36
with frame z side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame z:handle). 
 
form
   pod_req_nbr
   pod_req_line column-label "Ln"
   pod_nbr
   pod_line
   pod_due_date
   pod_part
   pod_qty_ord
   pod_um
   l_povend label "Supplier"
with frame emailnotice width 80   down.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame emailnotice:handle).

{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'grs_installed',
     input '',
     input '',
     input '',
     output using_grs)"}

/*q9006*/ prevdomain = global_domain.
/*q9006*/ prevdb = global_db.
/*q9006*/      find dom_mstr no-lock
/*q9006*/      where dom_domain = global_domain
/*q9006*/      no-error.
/*q9006*/      global_domain = if dom_mstr.dom_user1 <> ?
/*q9006*/                      and dom_mstr.dom_user1 <> "" 
/*q9006*/                      then dom_mstr.dom_user1
/*q9006*/                      else global_domain.
/*q9006*/      global_db = global_domain.
/*q9006*/ prevdomainx = global_domain.
 

 
if not using_grs then do:
   /*GRS not enabled*/
   {us/bbi/pxmsg.i &MSGNUM=2122 &ERRORLEVEL=4}
   if not batchrun then pause.
   leave.
end. /* if not using_grs then do: */
 
assign
   include_hcmmts = yes
   include_lcmmts = yes
   l_override_remarks = yes
   default_copy = yes
   buyer_id  = global_userid
   include_mrp_type = yes
   include_mro_type = yes
   oldcurr = "".
 
mainloop:
repeat:
 
   for each qad_wkfl
      where qad_domain = global_domain
      and   qad_key3   = "rqpobld.p"  
      and   qad_key4   = SessionUniqueID
      and   qad_key5   = "GRS"
   exclusive-lock:
      delete qad_wkfl.
   end. /* FOR EACH qad_wkfl  */
 
   if req_nbr1 = hi_char then req_nbr1 = ''.
   if supplier1 = hi_char then supplier1 = ''.
   if part1 = hi_char then part1 = ''.
   if need_date = low_date then need_date = ?.
   if need_date1 = hi_date then need_date1 = ?.
/*q9006*/   if vdom1 = hi_char then vdom1 = ''.
 
   update
      req_nbr
      req_nbr1
      supplier
      supplier1
      part
      part1
      need_date
      need_date1
/*q9006*/ vdom
/*q9006*/ vdom1
      buyer_id
      site
      requester
      job_name
      ship
      currency
      blank_suppliers
      include_mrp_type
      include_mro_type
      include_hcmmts
      include_lcmmts
      l_override_remarks
      default_copy
   with frame z.
 
   if req_nbr1 = '' then req_nbr1 = hi_char.
   if supplier1 = '' then supplier1 = hi_char.
   if part1 = '' then part1 = hi_char.
   if need_date = ? then need_date = low_date.
   if need_date1 = ? then need_date1 = hi_date.
/*q9006*/   if vdom1 = '' then vdom1 = hi_char.
 
   /*  INITIALIZE  */
   assign
      rqpo_wrk_cntr = 0
      info_correct  = no
      return_code   = 0.
/*q9006*/ ss-site = site.
 
   /*  RETRIEVE RECORDS AND LOAD TEMP-TABLE */

/*q9006*/ global_domain = prevdomain.
/*q9006*/   {us/bbi/gprun.i ""xxrqpobldx.p""
      "(input false,
        input req_nbr,
        input req_nbr1,
        input supplier,
        input supplier1,
        input part,
        input part1,
        input need_date,
        input need_date1,
        input buyer_id,
        input site,
        input requester,
        input job_name,
        input ship,
        input currency,
        input blank_suppliers,
        input include_mrp_type,
        input include_mro_type,
        input default_copy)"}
/*q9006*/   global_domain = prevdomainx.
 
 
/*q9006*    {us/bbi/gprun.i ""rqpoblde.p"" */
/*q9006*/   {us/bbi/gprun.i ""xxrqpoblde.p""
      "(input req_nbr,
        input req_nbr1,
        input supplier,
        input supplier1,
        input part,
        input part1,
        input need_date,
        input need_date1,
        input buyer_id,
        input site,
        input requester,
        input job_name,
        input ship,
        input currency,
        input blank_suppliers,
        input include_mrp_type,
        input include_mro_type,
        input default_copy,
        output rqpo_wrk_cntr)"}
 
   if rqpo_wrk_cntr = 0 then do:
 
      {us/bbi/pxmsg.i &MSGNUM=1853 &ERRORLEVEL=3}
      /* NO REQUISITIONS AVAILABLE FOR PROCESSING */
 
   end. /* if rqpo_wrk_cntr = 0 then do: */
   else do:
      hide frame z.
      /* DISPLAY REQUISITIONS FROM THE WORK FILE */
      /* USING SCROLLING WINDOW          */
      {us/bbi/gprun.i ""rqpoblda.p""}
 
      if info_correct then do:
 
         rqloop:
         for each rqpo_wrk
            where rqpo_copy_to_po = yes
         exclusive-lock:
            for first qad_wkfl
               where qad_domain = global_domain
                 and qad_key1   = rqpo_nbr
                 and qad_key2   = string(rqpo_line)
                 and (qad_key3  = "rqpobld.p"
                  or  qad_key3  = "popomtr1.p")
                 and qad_key4   <> SessionUniqueID
                 and qad_key5   = "GRS"
            no-lock:
            end. /* FOR FIRST qad_wkfl ..*/
 
            if available qad_wkfl
            then do:
               /* CLEAN OUT STRANDED RECORDS CREATED IN OTHER SESSIONS */
               if not can-find(mon_mstr
                                  where mon_sid     = qad_key6
                                    and mon_product = "MFG/PRO")
               then do:
                  find del_qad_wkfl 
                     where recid(del_qad_wkfl) = recid(qad_wkfl)
                  exclusive-lock no-error.
                  if available del_qad_wkfl 
                  then
                     delete del_qad_wkfl.
               end. /* IF NOT CAN-FIND(mon_mstr) */
               else do:
                  rqpo_copy_to_po     = no.
 
                  /* REQUISTION # BEING PROCESSED IN ANOTHER SESSION BY # */
                  {us/bbi/pxmsg.i &MSGNUM=7639
                           &ERRORLEVEL=4
                           &MSGARG1= rqpo_nbr
                           &MSGARG2= qad_wkfl.qad_charfld[1]}.
                  if not batchrun
                  then do:
                     pause 5.
                     hide message no-pause.
                  end. /* IF NOT batchrun ..*/
                  next rqloop.
               end. /* ELSE DO */
            end. /* IF AVAILABLE qad_wkfl */
            else do :
 
               create qad_wkfl.
               assign
                  qad_wkfl.qad_domain     = global_domain
                  qad_wkfl.qad_key1       = rqpo_nbr
                  qad_wkfl.qad_key2       = string(rqpo_line)
                  qad_wkfl.qad_key3       = "rqpobld.p"
                  qad_wkfl.qad_key4       = SessionUniqueID
                  qad_wkfl.qad_key5       = "GRS"
                  qad_wkfl.qad_key6       = mfguser
                  qad_wkfl.qad_charfld[1] = global_userid.
 
               if recid(qad_wkfl) = -1
               then
               .
 
            end. /* ELSE DO */
         end.  /* FOR EACH rqpo .. */
 
         for each rqpo_wrk
            where rqpo_copy_to_po  = yes :
            open_qty = 0.
            {us/bbi/gprun.i ""rqoqty.p""
            "(input rqpo_nbr,
              input rqpo_line,
              output open_qty,
              output qty_um)"}
            if open_qty <> rqpo_net_qty
            then do:
               /* REQUISTION # Line # HAS BEEN MODIFIED. */
               {us/bbi/pxmsg.i &MSGNUM=10442  &ERRORLEVEL=2  &MSGARG1=rqpo_nbr
               &MSGARG2=rqpo_line}
               if not batchrun
               then do:
                  pause 5.
                  hide message no-pause.
               end. /* IF NOT batchrun  */
               delete rqpo_wrk.
            end. /* IF open_qty <> rqpo_net_qty */
         end. /* FOR EACH rqpo_wrk */
 
         /* ARE ANY OF THE WORK FILE ENTRIES MARKED "YES" */
         if can-find (first rqpo_wrk where rqpo_copy_to_po) then do:
            hide frame z.
 
            /* BUILD PO FROM REQUISITIONS MARKED "YES" */
/*c1227*    {us/bbi/gprun.i ""rqpobldb.p"" */
/*c1227*/   {us/bbi/gprun.i ""xxrqpobldb.p""
               "(input l_override_remarks)"}
            /* SIMILAR TO pomt.p */
  
            if return_code > 0 then do:
 
               {us/bbi/pxmsg.i &MSGNUM=return_code &ERRORLEVEL=1}
 
               /* WHEN OUTPUT IS TAKEN TO PAGE IN RQPOBLDB.P,LASTKEY VALUE  */
               /* IS RETAINED AS "F4".THIS GIVES ERROR WHILE DISPLAYING     */
               /* SUMMARY REPORT. HENCE THE FOLLOWING PAUSE STATEMENT ADDED */
 
               if not batchrun
                  and keyfunction(lastkey) = "end-error"
               then
                  pause.
 
               /* SEND E-MAIL NOTIFICATION , SUMMARY TO REQUESTER */
               assign
                  l_emailsent  = no
                  l_end        = getTermLabel("END_OF_REPORT",35).
 
               for each wkrqd_det
                  break by wkrqd_rqby_userid by wkrqd_nbr:
 
                  /* IF E-MAIL OPTION IS "N" THEN SKIP THIS RECORD FOR */
                  /* E-MAIL PROCESSING                                 */
                  if can-find(rqm_mstr  where rqm_mstr.rqm_domain =
                  global_domain and  rqm_nbr = wkrqd_nbr and
                                       rqm_email_opt = EMAIL_OPT_NO_EMAIL )
                  then next.
 
                  if first-of(wkrqd_rqby_userid)
                  then do:
                     output stream mailNotice to email.out Append.
                     l_reqlist = "".
                  end. /* IF FIRST-OF(wkrqd_rqby_userid) */
 
                  for first pod_det
                     where pod_det.pod_domain = global_domain 
                       and pod_req_nbr = wkrqd_nbr
                       and pod_req_line  = wkrqd_line
                       and pod_part      = wkrqd_part
                       and pod_due_date  = wkrqd_due_date
                  no-lock:
                  end. /* FOR FIRST pod_det */
 
                  for first po_mstr
                     where po_mstr.po_domain = global_domain 
                      and  po_nbr = pod_nbr
                  no-lock:
                  end. /* FOR FIRST po_mstr */
 
                  display stream mailNotice
                     pod_req_nbr
                     pod_req_line
                     pod_nbr
                     pod_line
                     pod_due_date
                     pod_part
                     pod_qty_ord
                     pod_um
                     po_vend @ l_povend
                  with frame emailnotice width 80 down.
                  down with frame emailnotice.
 
                  /* GET LIST OF REQUISITIONS FOR NOTIFICATION */
                  if l_reqlist = ""
                  then
                     l_reqlist = pod_req_nbr.
                  else if first-of(wkrqd_nbr)
                  then
                     l_reqlist = l_reqlist + "," +  pod_req_nbr.
 
                  if last-of(wkrqd_rqby_userid)
                  then do:
 
                     display stream mailNotice
                        l_end at 35
                        with frame em_end no-label width 80.
 
                     output stream mailNotice close.
 
                     /* SEND THE FOLLOWING MESSAGE # 4798 AS A SUBJECT IF A  */
                     /* PO IS CREATED USING MORE THAN 5 DIFFERENT            */
                     /* REQUISITIONS. OTHERWISE USE MESSAGE # 4782 WITH LIST */
                     /* OF REQUISITIONS AS A SUBJECT                         */
 
                     if length( l_reqlist ) > 44
                     then do :
                        /* MESSAGE #4798 - PO # WAS CREATED FROM  MULTIPLE
                                           REQUISITIONS  */
                        {us/bbi/pxmsg.i
                           &MSGNUM=4798
                           &MSGARG1=pod_nbr
                           &MSGBUFFER=l_subject }
                     end. /* IF LENGTH( l_reqlist) > 44 */
                     else do:
 
                        /* MESSAGE #4782 - PO # WAS CREATED FROM
                                           REQUISITION # */
                        {us/bbi/pxmsg.i
                           &MSGNUM=4782
                           &MSGARG1=pod_nbr
                           &MSGARG2=l_reqlist
                           &MSGBUFFER=l_subject }
 
                     end. /* ELSE DO: */
 
                     /* SENDING E-MAIL NOTIFICATION */
                     run send_email(
                        input l_subject ,
                        input wkrqd_rqby_userid ,
                        input "email.out" ) .
                     /* SEND E-MAIL NOTIFICATION TO ENDUSER IF E-MAIL OPTION */
                     /* IS "E" */
                     if wkrqd_end_userid <> ""
                        and wkrqd_end_userid <> wkrqd_rqby_userid
                        and wkrqd_email_opt = EMAIL_OPT_EXTENDED
                     then do:
                        run send_email(
                           input l_subject ,
                           input wkrqd_end_userid,
                           input "email.out" ) .
                     end. /* IF wkrqd_end_userid <> "" */
 
                     {us/bbi/gpfildel.i &filename=""email.out"" }
 
                     l_emailsent = yes.
                  end. /* if LAST-OF(wkrqd_rqby_userid) */
 
                  if last-of(wkrqd_nbr)
                     and can-find(rqm_mstr  where rqm_mstr.rqm_domain =
                     global_domain and  rqm_nbr = wkrqd_nbr
                                           and   rqm_open = no )
                  then do:
 
                     run displaySummary( input  pod_req_nbr ).
 
                     /* MESSAGE # 4783 - REQUISITION # IS COMPLETE    */
                     {us/bbi/pxmsg.i
                        &MSGNUM=4783
                        &MSGARG1=pod_req_nbr
                        &MSGBUFFER=l_subject }
 
                     /* SEND E-MAIL SUMMARY TO REQUESTER */
                     run send_email(
                        input l_subject,
                        input wkrqd_rqby_userid ,
                        input "summary.out" ) .
 
                     /* SEND E-MAIL SUMMARY TO ENDUSER IF E-MAIL OPTION */
                     /* IS "E"                                          */
                     if  wkrqd_email_opt  = EMAIL_OPT_EXTENDED
                     and wkrqd_end_userid  <> ""
                     and wkrqd_rqby_userid <> wkrqd_end_userid
                     then do:
                        run send_email(
                           input l_subject,
                           input wkrqd_end_userid,
                           input "summary.out" ) .
                     end. /* IF wkrqd__email_opt = EMAIL_OPT_EXTENDED */
 
                     {us/bbi/gpfildel.i &filename=""summary.out"" }
 
                     l_emailsent = yes.
 
                  end. /* IF LAST-OF(wkrqd_nbr) */
 
               end. /* FOR EACH wkrqd_det  */
 
               if l_emailsent
               then do:
                  /* MESSAGE # 1793 -  E-MAIL MESSAGE SENT. */
                  {us/bbi/pxmsg.i &MSGNUM=1793  &ERRORLEVEL=1 }
               end.  /* IF l_emailsent */
 
            end. /* IF return_code > 0 THEN DO: */
 
         end. /* IF CAN-FIND (FIRST rqpo_wrk WHERE rqpo_copy_to_po) THEN DO: */
         else do:
 
            {us/bbi/pxmsg.i &MSGNUM=1855 &ERRORLEVEL=1}
            /* NO REQUISITIONS SELECTED FOR ACTION */
 
         end.  /* IF CAN-FIND (FIRST rqpo_wrk) */
 
      end.  /* IF info_correct */
 
   end.  /* IF rqpo_wrk_cntr = 0 */
 
end.  /* REPEAT */


/*d2101* start added code >>>>   */
global_domain = prevdomain.
global_db = prevdb.
/*d2101* end   added code <<<<<  */

 
PROCEDURE send_email:
 
   define input parameter p_subject as character no-undo.
   define input parameter p_userid  as character no-undo.
   define input parameter p_out     as character no-undo.
 
   define variable email_return_code   as integer   no-undo.
   define variable email_return_userid as character no-undo.

   define variable EmployeeAddress   as EmployeeAddressByEmpCoCode no-undo.
   define variable hQADFinancialsLib as handle                     no-undo.
   define variable l_enduser_email   as character                  no-undo.
 
   if p_userid = "" then leave.
   if can-find (first usr_mstr 
      where usr_userid = p_userid)
   then do:
      {us/bbi/gprun.i ""mgemsend.p""
         "(input p_userid,
            input '',
            input p_subject,
            input p_out ,
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
               input p_out ,
               input '',
               input false,
               input ?,
               output email_return_code,
               output email_return_userid)"}
      end. /* FOR FIRST emp_mstr */
   end. /* IF NOT AVAILABLE usr_mstr */
 
   if email_return_code <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=email_return_code &ERRORLEVEL=2}
   end. /* IF email_return_code <> 0 THEN DO: */

   if valid-object(EmployeeAddress)
      and EmployeeAddress:Available = yes
   then do:
      delete object EmployeeAddress no-error.
   end. /* IF valid-object(EmployeeAddress) ... */
 
end. /* send_email */
 
PROCEDURE displaySummary:
 
   define input  parameter pReqNbr like rqm_mstr.rqm_nbr no-undo.
 
   define variable l_fld1 as character format "x(8)"  no-undo.
   define variable l_fld2 as character format "x(35)" no-undo.
 
   form
      l_fld1        at 1  column-label "Req Ln!PO Nbr"
      pod_site      at 10 column-label "Site!PO Line"
      pod_part      at 20 column-label "Item Number!Qty Ordered"
      po_vend       at 40 column-label "Supplier!UM"
      po_due_date   at 51 column-label "Due Date!Disc %"
      pod_pur_cost  at 60 column-label "Purchase Cost!Extended Cost"
   with frame eSum width 80 down.
 
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame eSum:handle).
 
   form
      pod_req_nbr
      pod_due_date
      pod_request
   with frame new1 side-labels width 80 down.
 
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame new1:handle).
 
   {us/bbi/gpfildel.i &filename=""summary.out"" }
 
   output to summary.out.
 
   for each rqd_det where rqd_det.rqd_domain = global_domain 
                    and   rqd_nbr  = pReqNbr
                    and   rqd_line >= 0
                    and   rqd_open = no no-lock,
      each pod_det where pod_det.pod_domain = global_domain 
                    and  pod_req_nbr  = pReqNbr
                    and  pod_req_line = rqd_line
                    and  pod_due_date = rqd_due_date
                    and  pod_part     = rqd_part no-lock,
      first po_mstr  
         where po_mstr.po_domain = global_domain 
          and  po_nbr = pod_nbr no-lock
      break by pod_req_line:
 
      if first( pod_req_line )
      then
         display
            pod_req_nbr
            pod_due_date
            pod_request
         with frame new1 side-labels width 80 down.
 
      display
         trim(string(pod_req_line)) @ l_fld1
         pod_site
         pod_part
         po_vend
         po_due_date
         pod_pur_cost
      with frame eSum width 80 down.
 
      pod_pur_cost:format in frame eSum = pod_pur_cost_unit_fmt.
      display
         pod_pur_cost
      with frame eSum.

      down 1 with frame eSum.
 
      if (oldcurr <> po_curr) or (oldcurr = "") then do:

         {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
            "(input  po_curr,
              output rndmthd,
              output mc-error-number)" }
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=4}
            pause.
            undo, next.
         end.
         oldcurr = po_curr.

         pod_pur_cost_ext_fmt = pod_pur_cost_unit_fmt.
         {us/bbi/gprun.i ""gpcurfmt.p""
            "(input-output pod_pur_cost_ext_fmt,
              input rndmthd)"}
         pod_pur_cost:format in frame eSum = pod_pur_cost_ext_fmt.
      end.

      l_pod_pur_cost_ext =
         if ((pod__qad02 = 0 or pod__qad02 = ?) and
             (pod__qad09 = 0 or pod__qad09 = ?)
            )
         then pod_qty_ord * pod_pur_cost  * (1 - (pod_disc_pct / 100))
         else pod_qty_ord * (pod__qad09 + pod__qad02 / 100000).

      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output l_pod_pur_cost_ext,
           input rndmthd,
           output mc-error-number)"}

      if mc-error-number <> 0 then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end.

      display
         po_nbr                 @ l_fld1
         trim(string(pod_line)) @ pod_site
         trim(string(pod_qty_ord,"->,>>>,>>9.9<<<<<" )) @ pod_part
         pod_um                 @ po_vend
         pod_disc_pct           @ po_due_date
         l_pod_pur_cost_ext     @ pod_pur_cost
      with frame eSum.
 
      down 2 with frame eSum.
 
      {us/mf/mfrpchk.i }
 
   end. /* FOR EACH pod_det */
 
   l_fld2 =  getTermLabel("END_OF_REPORT",35).
 
   display skip(1) l_fld2 at 35
   with frame r_end no-label width 80.
   output close.
 
end. /* PROCEDURE displaySummary */
