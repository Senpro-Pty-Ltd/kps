/* xfworl1.p - SINGLE WO RELEASE / PRINT WORK ORDER DRIVER                    */
/* woworl1.p - SINGLE WO RELEASE / PRINT WORK ORDER DRIVER                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfworl1.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* REVISION: 8.5     LAST MODIFIED: 02/03/95    BY: tjs *J027*                */
/* REVISION: 8.5     LAST MODIFIED: 06/11/96    BY: *G1XY*  Russ Witt         */
/* REVISION: 8.5     LAST MODIFIED: 07/09/96    BY: *J0YB*  Kieu Nguyen       */
/* REVISION: 8.5     LAST MODIFIED: 02/04/97    BY: *J1GW* Julie Milligan     */
/* REVISION: 8.5     LAST MODIFIED: 06/04/97    BY: *J1SM* Manmohan K.Pardesi */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 05/10/00   BY: *N091* Vandna Rohira      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KC* Mark Brown         */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.10       BY: Katie Hilbert       DATE: 04/05/01  ECO: *P008*   */
/* Revision: 1.11       BY: Jean Miller         DATE: 12/17/01  ECO: *P03Q*   */
/* Revision: 1.12       BY: Rajaneesh S.        DATE: 02/07/02  ECO: *N191*   */
/* Revision: 1.13       BY: Vivek Gogte         DATE: 01/28/03  ECO: *N25C*   */
/* Revision: 1.15       BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00N*   */
/* Revision: 1.16       BY: Deepak Rao          DATE: 08/02/03  ECO: *P0VT*   */
/* Revision: 1.17        BY: Namita Patil        DATE: 07/24/08  ECO: *P6Y3*   */
/* $Revision: 1.2 $   BY: Steve Nugent        DATE: 07/15/10  ECO: *Q2W2*   */
/* Revision: QAD2014      BY: Amol Dudvadkar    DATE: 03/16/15  ECO: *grc338  */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/*V8:ConvertMode=Report                                                       */

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
/*eB3sp5*/   {us/xf/xfworlu.i}
/*eB3sp5*/   {us/xf/xfdefa.i}

/* ********** Begin Translatable Strings Definitions ********* */

&SCOPED-DEFINE woworl1_p_3 "Print Co/By-Products"
/* MaxLen: Comment: */

/* ********** End Translatable Strings Definitions ********* */

define new shared variable any_issued like mfc_logical.
define new shared variable any_feedbk like mfc_logical.
define new shared variable picklistprinted like mfc_logical.
define new shared variable routingprinted like mfc_logical.
define new shared variable jpprinted like mfc_logical.
define new shared variable prev_site like wo_site.
define new shared variable joint_type like wo_joint_type.
define new shared variable del-joint like mfc_logical initial no.
define new shared variable no_msg like mfc_logical initial no.
define new shared variable err_msg as integer.
define new shared variable undo_all like mfc_logical no-undo.
define new shared variable joint_dates like mfc_logical.
define new shared variable joint_qtys  like mfc_logical.

define shared variable prd_recno as recid.
define shared variable critical-part like wod_part no-undo.
define shared variable wo_qty like wo_qty_ord.
define shared variable move like woc_move.
define shared variable comp like ps_comp.
define shared variable qty like wo_qty_ord.
define shared variable eff_date as date.
define shared variable wo_recno as recid.
define shared variable leadtime like pt_mfg_lead.
define shared variable prev_status like wo_status.
define shared variable print_pick like mfc_logical
   label "Print Picklist" initial yes.
define shared variable print_rte like mfc_logical
   label "Print Routing" initial yes.
define shared variable print_jp  like mfc_logical
   label "Print Co/By-Products" initial yes.

define shared variable upd_rel_date like mfc_logical
   label "Update Release Date" initial false no-undo.
define variable wrlot like wr_lot.
define variable wrnbr like wo_nbr.
define variable l_msgdesc like msg_desc no-undo.

{us/mf/mfworlb1.i &row="7"}

/* CREATE PAGE TITLE BLOCK */
{us/bbi/mfphead2.i}
eff_date = today.

printset:
do transaction on error undo, leave:

   find first wo_mstr
      where recid(wo_mstr) = wo_recno
      exclusive-lock
   no-wait no-error.

   if locked wo_mstr
   then do:
      /* ERROR: RECORD LOCKED BY ANOTHER USER.  TRY LATER. */
      {us/bbi/pxmsg.i &MSGNUM=7422 &ERRORLEVEL=4 &MSGBUFFER=l_msgdesc}
      put unformatted l_msgdesc skip.
      leave.
   end. /* IF LOCKED wo_mstr */


   if wo_rel_date <> today and
      wo_status <> "R"     and
      upd_rel_date = true
   then
      assign
         wo_shift = ""
         wo_seq = 0
         wo_rel_date = today.

   if index("PFBEA",wo_status) <> 0 then do:
      wo_status = "R".

      /* Export WO/Serial Info to Qxtend Outbound */
      {us/bbi/gprun.i ""pawobkex.p"" "(input wo_lot)"}
   end.

   if wo_qty_ord >= 0 then
      qty = max (wo_qty_ord - wo_qty_comp - wo_qty_rjct, 0).
   else
      qty = min (wo_qty_ord - wo_qty_comp - wo_qty_rjct, 0).
   wo_qty = qty.
   assign
      prev_site = wo_site
      undo_all = no.

   if wo_joint_type <> "" and
      (index("PBFC",prev_status) > 0)  then do:
      /* CREATE/RE-ESTABLISH ITS EFFECTIVE JOINT WOS. */
      {us/bbi/gprun.i ""wowomtf.p""}
      find wo_mstr no-lock where recid(wo_mstr) = wo_recno.
      if undo_all then undo, retry.
   end.

   /* UPDATE OTHER CO/BY WO STATUS */
   else
   if wo_joint_type <> "" and (index("EA",prev_status) > 0)
      then do:
         assign
            joint_dates = no
            joint_qtys = no
            any_issued = no
            any_feedbk = no.
         {us/bbi/gprun.i ""wowomti.p""}
         find wo_mstr no-lock where recid(wo_mstr) = wo_recno.
         if undo_all then undo, retry.
      end.

   joint_type = wo_joint_type.
   {us/bbi/gprun.i ""wowomta.p""}

   assign
      picklistprinted = no
      routingprinted = no
      jpprinted = no.

   if undo_all = no then do:
      if print_jp and
         jp_1st_last_doc and wo_joint_type <> "" then do:
         /* PRINT JOINT PRODUCTS EXPECTED RECEIPTS */
         assign
            page_counter = page-number - 1
            wo_recno = recid(wo_mstr).
/*grc338   {us/bbi/gprun.i ""woworlf.p"" } */
/*eB3sp5*/   {us/bbi/gprun.i ""xfworlf.p"" }
      end.
      if print_pick then do:
         assign
            page_counter = page-number - 1
            wo_recno = recid(wo_mstr).
/*grc338     {us/bbi/gprun.i ""woworlb.p"" } */
/*eB3sp5 */ {us/bbi/gprun.i ""xfworlb.p"" }
      end.
      if print_rte then do:
         assign
            page_counter = page-number - 1
            wo_recno = recid(wo_mstr).
/*grc338 {us/bbi/gprun.i ""woworld.p"" } */
/*eB3sp5*/ {us/bbi/gprun.i ""xfworld.p"" }
      end.
      if print_jp and
         not jp_1st_last_doc and wo_joint_type <> "" then do:
         /* PRINT JOINT PRODUCTS EXPECTED RECEIPTS */
         assign
            page_counter = page-number - 1
            wo_recno = recid(wo_mstr).
/*grc338   {us/bbi/gprun.i ""woworlf.p"" } */
/*eB3sp5**/ {us/bbi/gprun.i ""xfworlf.p"" }
      end.
   end.

   if (print_pick and not picklistprinted)
   or (print_rte and not routingprinted)
    or undo_all = yes
   then do:
      page.
      if undo_all then do:
         /* KEY ITEM NOT AVAILABLE, WORK ORDER NOT RELEASED  */
         {us/bbi/pxmsg.i &MSGNUM=4984 &ERRORLEVEL=2 &MSGARG1=wo_nbr}
         {us/bbi/pxmsg.i &MSGNUM=989  &ERRORLEVEL=1 &MSGARG1=critical-part}
         if not batchrun then pause.
         wo_status = prev_status.
      end.
      if (print_pick and not picklistprinted) then
      do:
         /* ***NO PICKLIST WAS PRINTED FOR WORK ORDER */
         {us/bbi/pxmsg.i &MSGNUM=3773 &ERRORLEVEL=1 &MSGBUFFER=l_msgdesc
                  &MSGARG1=wo_nbr}
         put unformatted
            l_msgdesc skip.
/*eB3sp5 */ {us/xf/xfworl1ms.i}
      end. /* IF (PRINT_PICK AND NOT PICKLISTPRINTED) THEN */

      if (print_rte and not routingprinted) then
      do:
         /* ***NO ROUTING WAS PRINTED FOR WORK ORDER */
         {us/bbi/pxmsg.i &MSGNUM=3803 &ERRORLEVEL=1 &MSGBUFFER=l_msgdesc
                  &MSGARG1=wo_nbr}
         put unformatted
            l_msgdesc skip.
/*eB3sp5 */ {us/xf/xfworl1ms.i}
      end. /* IF (PRINT_RTE AND NOT ROUTINGPRINTED) THEN */

      page.
   end.
   /*eB3sp5*/ {us/xf/xfworl1m9.i}

   if undo_all = no then do:

      if routingprinted
      then wo_order_sheet_printed = true.

      if routingprinted or picklistprinted
      then wo_selected_for_print = false.

      if wo_status <> "R" then do:
         wo_status = "R".

         /* Export WO/Serial Info to Qxtend Outbound */
         {us/bbi/gprun.i ""pawobkex.p"" "(input wo_lot)"}
      end.

      if move then do:
         move = no.
         find first wr_route  where wr_route.wr_domain = global_domain and
         wr_lot = wo_lot
            and wr_nbr = wo_nbr no-error.
         if available wr_route and wr_status = ""
         then do:
            wrlot = wr_lot.
            {us/mf/mfopmv.i wr_qty_ord "no"}
         end.
         move = yes.
      end.

      for first pt_mstr
         where pt_domain = global_domain
         and   pt_part   = wo_part
      no-lock:
         for first clc_ctrl
            where clc_domain = global_domain
         no-lock:
         end. /* FOR FIRST clc_ctrl */

         if not available clc_ctrl
         then do:
            {us/bbi/gprun.i ""gpclccrt.p""}
            for first clc_ctrl
               where clc_domain = global_domain
            no-lock:
            end. /* FOR FIRST clc_ctrl */
         end. /* IF NOT AVAILABLE clc_ctrl  */

         /* ATTRIBUTES DATA */
         if available clc_ctrl
            and (lookup(wo_status,"P,B,C,") = 0)
         then do:
            if pt_auto_lot = yes
               and pt_lot_ser = "L"
               and pt_lot_grp = ""
            then do:
               if wo_lot_next = ""
               then
                  wo_lot_next =   wo_lot.
               wo_lot_rcpt = no.
            end. /* IF pt_auto_lot    = yes */

            if (wo_type = "E"
                or wo_type = "R")
            then
               wo_lot_rcpt = no.

            if wo_type <> "w"
            then do:
               if wo_lot_rcpt
               then
                  wo_lot_next = "".
            end. /* IF wo_type <> "w" */
         end. /* IF AVAILABLE clc_ctrl */
      end. /* FOR FIRST pt_mstr */
   end. /* IF undo_all */

   if undo_all then do:
      undo printset, leave.
   end.

end.
