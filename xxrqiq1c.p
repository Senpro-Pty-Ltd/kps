/* xxrqiq1c.p - REQUISITION DETAIL INQUIRY - DISPLAY LINE DETAIL              */
/* rqrqiq1c.p - REQUISITION DETAIL INQUIRY - DISPLAY LINE DETAIL              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqiq1c.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*                                                                            */
/* NOTE: CHANGES MADE TO THIS PROGRAM MAY NEED TO BE MADE TO                  */
/* REQUISITION DETAIL INQUIRY AND/OR REQUISITION MAINTENANCE                  */
/* AND/OR REQUSITION REPORT.                                                  */
/*                                                                            */
/* Revision: 8.5    LAST MODIFIED BY: 05/05/97  By: B. Gates          *J1Q2*  */
/* Revision: 8.5    LAST MODIFIED BY: 10/31/97  By: Patrick Rowan     *J243*  */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* Revision: 8.5    LAST MODIFIED BY: 06/22/98  By: B. Gates          *J2QB*  */
/* Revision: 8.5    LAST MODIFIED BY: 08/12/98  By: Patrick Rowan     *J2W4*  */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Brian Compton      */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KP* myb                  */
/* Revision: 1.9.1.4      BY: Tiziana Giustozzi   DATE: 07/03/01  ECO: *N104* */
/* Revision: 1.9.1.6      BY: Anitha Gopal        DATE: 12/21/01  ECO: *N174* */
/* Revision: 1.9.1.7      BY: Manisha Sawant      DATE: 12/05/02  ECO: *N219* */
/* Revision: 1.9.1.8      BY: Vinod Nair          DATE: 02/27/03  ECO: *N28F* */
/* Revision: 1.9.1.10     BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.9.1.12     BY: Jean Miller         DATE: 10/07/08  ECO: *R15M* */
/* Revision: 1.9.1.18     BY: Avishek Chakraborty DATE: 24/06/09  ECO: *R1KV* */
/* Revision: 1.9.1.19      BY: Amresh A Das       DATE: 07/13/09  ECO: *Q328* */
/* $Revision: 1.2 $ BY: Prajakta Patil       DATE: 09/25/09  ECO: *Q3B8* */
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

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

define input parameter p_rqd_recid as recid no-undo.

{us/rq/rqconst.i}
{us/gp/gpdecchr.i}

define variable rqd_recid as recid no-undo.
define variable rqm_recid as recid no-undo.
define variable tot_qty_ord like pod_qty_ord no-undo.
define variable st_qty like pod_qty_ord label "Stock Um Qty" no-undo.
define variable ext_cost like rqd_pur_cost label "Ext Cost" no-undo.
define variable max_ext_cost like rqd_max_cost label "Max Ext Cost" no-undo.
define variable line_cmmts like COMMENTS no-undo.
define variable mfgr like vp_mfgr no-undo.
define variable mfgr_part like vp_mfgr_part no-undo.
define variable desc1 like pt_desc1 no-undo.
define variable desc2 like pt_desc1 no-undo.
define variable view_cmmts like mfc_logical no-undo.
define variable vend_row as integer no-undo.
define new shared variable cmtindx like cmt_indx.

define variable rndmthd like rnd_rnd_mthd no-undo.
define variable mc-error-number like msg_nbr no-undo.

form
   rqd_line
   rqd_site
   rqd_part
   rqd_vend
   rqd_req_qty
   rqd_um
   rqd_pur_cost        format ">>>>>>>>9.99<<<"
   rqd_disc_pct
with frame b 1 down width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

form
   rqd_due_date        colon 15
   rqd_lot_rcpt        colon 36
   rqd_um_conv         colon 60
   rqd_need_date       colon 15
   rqd_rev             colon 36 label "Revision"
   st_qty              colon 60
   rqd_type            colon 15
   rqd_pr_list2        colon 36
   tot_qty_ord         colon 60
   rqd_category        colon 15
   rqd_pr_list         colon 36
   rqd_max_cost        colon 60
   rqd_acct            colon 15
   rqm_sub             no-label
   rqm_cc              no-label
   ext_cost            colon 60
   rqd_project         colon 15
   max_ext_cost        colon 60
   rqd_vpart           colon 15 label "Supplier Item"
   rqd_status          colon 60
   mfgr                colon 15
   mfgr_part           no-label
   line_cmmts          colon 60
   desc1               colon 15
   rqd_aprv_stat       colon 60
   desc2               at 17 no-label
with frame c side-labels 1 down width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame c:handle).

form
   space(1)
   ad_name              no-label
   skip space(1)
   ad_line1             no-label
   skip space(1)
   ad_line2             no-label
   skip space(1)
   ad_city              no-label
   ad_state             no-label
   ad_zip               no-label
   skip space(1)
   ctry_country         no-label
   skip(1)
   space(1)
   rqd_pr_list2
   rqd_pr_list
with overlay frame vend centered row vend_row side-labels
title color normal (getFrameTitle("SUPPLIER",13)) width 40.

/* SET EXTERNAL LABELS */
setFrameLabels(frame vend:handle).

{us/gp/gpwait.i &GPWAIT_INIT}

find rqd_det where recid(rqd_det) = p_rqd_recid no-lock.
find rqm_mstr where rqm_mstr.rqm_domain = global_domain
   and rqm_nbr = rqd_nbr
no-lock no-error.

assign
   rqd_recid = p_rqd_recid
   rqm_recid = recid(rqm_mstr).

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.

/* SET CURRENCY DISPLAY FORMATS */

if rqm_curr = gl_base_curr then do:
   rndmthd = gl_rnd_mthd.
end.
else do:
   rndmthd = ?.
   /* GET ROUNDING METHOD FROM CURRENCY MASTER */
   {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
      "(input rqm_curr,
                output rndmthd,
                output mc-error-number)"}
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.
end.

display
   rqd_line
   rqd_site
   rqd_part
   rqd_vend
   rqd_req_qty
   rqd_um
   rqd_pur_cost
   rqd_disc_pct
with frame b.

run display_line_frame_c.
run display_supplier(input rqd_vend).

display
   rqd_pr_list2
   rqd_pr_list
with frame vend.

do on endkey undo, leave:
   /* When the UI is NETUI then hide the frame with no-pause.*/
   if not {us/bbi/gpiswrap.i}
   then
      hide frame vend.
   else
      hide frame vend no-pause.
end.

if rqd_cmtindx <> 0 then do on endkey undo, leave:
   view_cmmts = false.
   {us/bbi/pxmsg.i &MSGNUM=2082 &ERRORLEVEL=1
            &CONFIRM=view_cmmts
            &CONFIRM-TYPE='LOGICAL'}

   /*COMMENTS EXIST. DISPLAY?*/
   if view_cmmts then do:
      hide frame c no-pause.
      hide frame b no-pause.
      cmtindx = rqd_cmtindx.
      {us/bbi/gprun.i ""gpcmmt04.p"" "(input '')"}
      view frame b.
      view frame c.
   end.

end.

/* Adding an explicit wait for the NETUI so the frames  are adjusted appropriately.*/
do on endkey undo, leave:
   {us/gp/gpwait.i &INCLUDEPAUSE}

end.

hide frame c no-pause.
hide frame b no-pause.

/******************************************************/
/******************************************************/

/**                 PROCEDURES                       **/
/**                                                  **/
/******************************************************/
/******************************************************/

PROCEDURE display_line_frame_c:

   find rqd_det where recid(rqd_det) = rqd_recid no-lock.
   find rqm_mstr where recid(rqm_mstr) = rqm_recid no-lock.

   assign
      line_cmmts = rqd_cmtindx <> 0
      desc1 = getTermLabel("ITEM_NOT_IN_INVENTORY",30)
      desc2 = ""
      st_qty = 0.

   find pt_mstr where pt_mstr.pt_domain = global_domain
      and pt_part = rqd_part
   no-lock no-error.

   if available pt_mstr then
      assign
         desc1 = pt_desc1
         desc2 = pt_desc2.
   else
   if rqd_desc <> "" then
      assign
         desc1 = rqd_desc
         desc2 = "".

   assign
      global_part = rqd_part
      st_qty = rqd_req_qty * rqd_um_conv.

   /*CALCULATE QTY ALREADY ORDERED ON PO'S*/
   tot_qty_ord = 0.
   for each rqpo_ref where rqpo_ref.rqpo_domain = global_domain
      and rqpo_req_nbr = rqd_nbr
      and rqpo_req_line = rqd_line
   no-lock:
      tot_qty_ord = tot_qty_ord + rqpo_qty_ord.
   end.

   /*GET MFGR, MFGR PART FROM VP_MSTR*/
   mfgr = "".
   mfgr_part = "".

   if rqd_vpart <> "" then do:
      find first vp_mstr where vp_mstr.vp_domain = global_domain
         and vp_part = rqd_part
         and vp_vend_part = rqd_vpart
         and vp_vend = rqd_vend
      no-lock no-error.

      if available vp_mstr then do:
         mfgr = vp_mfgr.
         mfgr_part = vp_mfgr_part.
      end.
   end.

   /*GET TEXT OF APPROVAL STATUS*/
   {us/gp/gplngn2a.i
      &file=""rqm_mstr""
      &field=""rqm_aprv_stat""
      &code=rqd_aprv_stat
      &mnemonic=approval_stat_entry
      &label=approval_stat_desc}

   display
      rqd_due_date
      rqd_need_date
      rqd_type
      rqd_category
      rqd_acct
      rqm_sub

      rqm_cc
/*c1227*/ rqd__chr01   @ rqm_sub
/*c1227*/ rqd_cc   @ rqm_cc
      rqd_project
      rqd_vpart
      mfgr
      mfgr_part
      desc1
      desc2

      rqd_lot_rcpt
      rqd_rev
      rqd_pr_list2
      rqd_pr_list

      rqd_um_conv
      st_qty
      tot_qty_ord
      rqd_max_cost
      rqd_status
      line_cmmts
      approval_stat_desc @ rqd_aprv_stat

   with frame c.

   run display_ext_cost.
   run display_max_ext_cost.

END PROCEDURE.

PROCEDURE display_ext_cost:

   define variable l_netprice like pc_min_price no-undo.

   find rqd_det where recid(rqd_det) = rqd_recid no-lock.

   /* EXTENDED COST (ext_cost) WILL NOW BE CALCULATED */
   /* USING l_netprice AND UNIT COST (rqd_pur_cost)   */
   /* INSTEAD OF DISC% (rqd_disc_pct)                 */

   if available rqd_det then
      assign
         l_netprice = getDecFromChar(rqd__qadc01)
         ext_cost   = if rqd_pur_cost <> 0
                      then
                         rqd_req_qty * rqd_pur_cost
                            * (1 - (- (l_netprice - rqd_pur_cost)
                                    / (rqd_pur_cost / 100)) / 100)
                      else
                         0.

   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output ext_cost,
        input rndmthd,
        output mc-error-number)"}
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.

   display ext_cost with frame c.
END PROCEDURE.

PROCEDURE display_max_ext_cost:
   find rqd_det where recid(rqd_det) = rqd_recid no-lock.

   max_ext_cost = rqd_req_qty * rqd_max_cost.

   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output max_ext_cost,
        input rndmthd,
        output mc-error-number)"}
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.

   display max_ext_cost with frame c.
END PROCEDURE.

PROCEDURE display_supplier:
   define input parameter p_vend like rqd_vend no-undo.

   pause 0 .
   find ad_mstr where ad_mstr.ad_domain = global_domain
      and ad_addr = p_vend
   no-lock no-error.

   vend_row = frame-row(c) + 1.

   find first ctry_mstr where ctry_ctry_code = ad_ctry
   no-lock no-error.

   if available ad_mstr then do:
      display
         ad_name
         ad_line1
         ad_line2
         ad_city
         ad_state
         ad_zip
         ctry_ctry when (available(ctry_mstr))
      with frame vend.

      {us/gp/gpwait.i}

   end.
   else do:
      display
         "" @ ad_name
         "" @ ad_line1
         "" @ ad_line2
         "" @ ad_city
         "" @ ad_state
         "" @ ad_zip
         "" @ ctry_country
      with frame vend.

      {us/gp/gpwait.i}

   end.


END PROCEDURE.
