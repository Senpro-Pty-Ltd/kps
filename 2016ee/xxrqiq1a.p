/* rqrqiq1a.p  - REQUISITION DETAIL INQUIRY - DISPLAY HEADER                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqiq1a.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*                                                                            */
/* NOTE: CHANGES MADE TO THIS PROGRAM MAY NEED TO BE MADE TO                  */
/* REQUISITION DETAIL INQUIRY AND/OR REQUISITION MAINTENANCE                  */
/* AND/OR REQUSITION REPORT.                                                  */
/*                                                                            */
/* Revision: 8.6    LAST MODIFIED BY: 05/05/97  By: B. Gates          *J1Q2*  */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KP* myb                  */
/* Revision: 1.6.1.3     BY: Tiziana Giustozzi    DATE: 07/03/01  ECO: *N104* */
/* Revision: 1.6.1.4     BY: Vinod Nair           DATE: 02/27/03  ECO: *N28F* */
/* Revision: 1.6.1.6     BY: Paul Donnelly (SB)   DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.6.1.7    BY: Rake Gui             DATE: 12/19/05  ECO: *Q0NK* */
/* Revision: 1.6.1.12       BY: Sameer Lodha         DATE: 03/05/07  ECO: *R0C6* */
/* Revision: 1.6.1.15       BY: Amresh A Das         DATE: 06/03/09  ECO: *Q2X7* */
/* Revision: 1.6.1.16       BY: Amresh A Das         DATE: 07/13/09 ECO: *Q328* */
/* Revision: 1.5       BY: Neil Curzon          DATE: 04/30/09  ECO: *R1HB* */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1227*                     */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1228*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
/*                                                                            */
/*V8:ConvertMode=Maintenance                                                  */
/*                                                                            */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

{us/rq/rqconst.i}

define variable continue as logical no-undo.
define variable del-yn like mfc_logical no-undo.
define variable line as integer no-undo.
define variable new_req as logical no-undo.
define variable oldcurr like rqm_curr.
define variable rqmnbr like rqm_mstr.rqm_nbr.
define variable email_opt_valid as logical no-undo.
define variable hdr_cmmts like COMMENTS no-undo.
define variable view_cmmts like mfc_logical no-undo.
define new shared variable cmtindx as integer.
define variable total_frame_hdl as handle no-undo.

form
   rqm_mstr.rqm_nbr     colon 14
   rqm_vend        colon 36
   rqm_ship        colon 60
with frame a attr-space side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
   rqm_req_date        colon 14
   rqm_sub             colon 36
   rqm_curr            colon 60
   rqm_need_date       colon 14
   rqm_cc              colon 36
   rqm_lang            colon 60
   rqm_due_date        colon 14
   rqm_site            colon 36
   rqm_direct          colon 60
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
   email_opt_entry     colon 14
   rqm_rmks            colon 36
with frame b attr-space side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

form
   rqm_disc_pct    colon 17
   rqm_pr_list2    colon 43
   rqm_pr_list     colon 68
with frame c attr-space side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame c:handle).

{us/mf/mfadform.i "vend" 1 SUPPLIER}
{us/mf/mfadform.i "ship_to" 41 SHIP_TO}

find first gl_ctrl  where gl_ctrl.gl_domain = global_domain no-lock.
find first poc_ctrl  where poc_ctrl.poc_domain = global_domain no-lock.
{us/bbi/gprun.i ""rqpma.p""}
find first rqf_ctrl  where rqf_ctrl.rqf_domain = global_domain no-lock.

view frame dtitle.

/*GET MOST RECENTLY ACCESSED REQ NUMBER AND DISPLAY*/

{us/bbi/gprun.i ""rqidf.p""
   "(input 'get', input 'reqnbr', input-output rqmnbr)"}

display rqmnbr @ rqm_mstr.rqm_nbr with frame a.

mainloop:
repeat:
   view frame a.
   view frame vend.
   view frame ship_to.
   view frame b.

   do on error undo, retry:
      prompt-for rqm_mstr.rqm_nbr with frame a
      editing:
         {us/mf/mfnp.i rqm_mstr rqm_nbr  " rqm_mstr.rqm_domain = global_domain and
         rqm_nbr "  rqm_nbr rqm_nbr rqm_nbr}

         if recno <> ? then do:
            run display_req(input recno, input false).
         end.
      end.

      find rqm_mstr  where rqm_mstr.rqm_domain = global_domain and  rqm_nbr =
      input frame a rqm_nbr
         no-lock no-error.

      if not available rqm_mstr then do:
         {us/bbi/pxmsg.i &MSGNUM=193 &ERRORLEVEL=3} /*REQUISITION DOES NOT EXIST*/
         undo, retry.
      end.
   end.

   /*PUT MOST RECENTLY ACCESSED REQ NUMBER*/

   rqmnbr = rqm_nbr.

   {us/bbi/gprun.i ""rqidf.p""
      "(input 'put', input 'reqnbr', input-output rqmnbr)"}

   run display_req(input recid(rqm_mstr), input false).

   /* Explicitly making the NETUI screen wait when the records are been selected with the down/up arrow.*/
   if {us/bbi/gpiswrap.i}
   then
      {us/gp/gpwait.i}


   if keyfunction(lastkey) = "END-ERROR" then
      undo, retry mainloop.

   hide frame b.

   display
      rqm_disc_pct
      rqm_pr_list2
      rqm_pr_list
   with frame c.

   {us/gp/gpwait.i}

   if keyfunction(lastkey) = "END-ERROR" then
      undo, retry mainloop.

   if rqm_cmtindx <> 0 then do:
      view_cmmts = false.
      {us/bbi/pxmsg.i &MSGNUM=2082
               &ERRORLEVEL=1
               &CONFIRM=view_cmmts
               &CONFIRM-TYPE='LOGICAL'
      }

      /*Comments exist. Display?*/

      if view_cmmts then do:
         hide frame c no-pause.
         hide frame b no-pause.
         hide frame vend no-pause.
         hide frame ship_to no-pause.
         hide frame a no-pause.
         cmtindx = rqm_cmtindx.
         {us/bbi/gprun.i ""gpcmmt04.p"" "(input '')"}
         view frame a.
      end.
      else do:
         hide frame c no-pause.
         hide frame b no-pause.
         hide frame vend no-pause.
         hide frame ship_to no-pause.
      end.
   end.
   else do:
      hide frame c.
   end.

   hide frame vend no-pause.
   hide frame ship_to no-pause.

/*c1227*   {us/bbi/gprun.i ""rqrqiq1b.p"" "(input recid(rqm_mstr))"} */
/*c1227*/  {us/bbi/gprun.i ""xxrqiq1b.p"" "(input recid(rqm_mstr))"}

   /*DISPLAY TOTALS*/

   {us/bbi/gprun.i ""rqtotdsp.p""
      "(input recid(rqm_mstr), output total_frame_hdl)"}

   do on endkey undo, leave:
   /* Removing the pause and replacing it with us/gp/gpwait.i as it will disrupt the NETUI displays. */
   if not {us/bbi/gpiswrap.i}
   then
      pause.
   end.

   /*THE FOLLOWING IS BECAUSE THE TOTAL FRAME IS STILL
   VISIBLE AFTER RETURNING FROM RQTOTDSP.P*/

   if valid-handle(total_frame_hdl)
      then total_frame_hdl:hidden = true.

   view frame vend.
   view frame ship_to.
   view frame b.
end.

hide frame b no-pause.
hide frame vend no-pause.
hide frame ship_to no-pause.
hide frame a no-pause.

/******************************************************/
/******************************************************/

/**                 PROCEDURES                       **/
/**                                                  **/
/******************************************************/
/******************************************************/

PROCEDURE display_req:
   define input parameter p_rqm_recid as recid no-undo.
   define input parameter p_exclusive_lock as logical no-undo.

   if p_exclusive_lock then
      find rqm_mstr where recid(rqm_mstr) = p_rqm_recid exclusive-lock.
   else
      find rqm_mstr where recid(rqm_mstr) = p_rqm_recid no-lock.

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
      rqm_sub
      rqm_curr
      rqm_need_date
      rqm_cc
      rqm_lang
      rqm_due_date
      rqm_site
      rqm_daybookset
      rqm_direct
      rqm_eby_userid
      rqm_entity
      email_opt_entry
      rqm_rqby_userid
      rqm_job
      rqm_status
      rqm_end_userid
      rqm_project
      hdr_cmmts
      rqm_reason
      approval_stat_desc @ rqm_aprv_stat
      rqm_rmks
   with frame b.

END PROCEDURE.
