/* xxwobkfl.p   - WORK ORDER OPERATION BACKFLUSH                              */
/* wobkfl.p   - WORK ORDER OPERATION BACKFLUSH                                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxwobkfl.p,v 1.2 2018/03/13 17:10:02 gbg Exp $: */
/*                                                                            */
/* REVISION: 9.1      LAST MODIFIED: 10/25/99   BY: *N002* Bill Gates         */
/* REVISION: 9.1      LAST MODIFIED: 02/23/00   BY: *M0JN* Kirti Desai        */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* David Morris       */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KC* Mark Brown         */
/* Revision: 1.19      BY: Katie Hilbert           DATE: 04/01/01 ECO: *P008* */
/* Revision: 1.20      BY: Rajesh Thomas           DATE: 05/30/01 ECO: *M18V* */
/* Revision: 1.21      BY: Niranjan Ranka          DATE: 07/13/01 ECO: *P00L* */
/* Revision: 1.23      BY: Vivek Gogte             DATE: 12/31/01 ECO: *N17D* */
/* Revision: 1.24      BY: Jean Miller             DATE: 05/17/02 ECO: *P05V* */
/* Revision: 1.25      BY: Inna Fox                DATE: 06/13/02 ECO: *P04Z* */
/* Revision: 1.26      BY: Niranjan Ranka          DATE: 06/14/02 ECO: *P08N* */
/* Revision: 1.28      BY: Niranjan Ranka          DATE: 06/25/02 ECO: *P09L* */
/* Revision: 1.29      BY: Vivek Gogte             DATE: 08/06/02 ECO: *N1QQ* */
/* Revision: 1.30      BY: Kirti Desai             DATE: 01/23/03 ECO: *N241* */
/* Revision: 1.31      BY: Narathip W.             DATE: 04/30/03 ECO: *P0QN* */
/* Revision: 1.33      BY: Paul Donnelly (SB)      DATE: 06/28/03 ECO: *Q00N* */
/* Revision: 1.34      BY: Jean Miller             DATE: 01/10/06 ECO: *Q0PD* */
/* Revision: 1.35      BY: Shilpa Kamath           DATE: 06/06/06 ECO: *R05V* */
/* Revision: 1.36      BY: Ruma Bibra              DATE: 06/16/06 ECO: *P4TP* */
/* Revision: 1.37      BY: Robin McCarthy          DATE: 06/30/06 ECO: *R04J* */
/* Revision: 1.40      BY: Amit Singh              DATE: 06/23/06 ECO: *P4RH* */
/* Revision: 1.41      BY: Munira Savai            DATE: 02/16/07 ECO: *P5KM* */
/* Revision: 1.42      BY: Yizhou Mao              DATE: 12/16/08 ECO: *R18K* */
/* CYB           MODIFIED: 03-MAR-2010            BY: psu *cy1018*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB     DATE: 2015-JUL-10      BY: gbg  *d3205*                    */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/* DEFINE HANDLE FOR THE PROGRAM. */
 
{us/mf/mfdtitle.i "x3 "}
{us/mf/mfaititl.i} /* SUPPRESS DISPLAY OF SCREEN TITLE IN API MODE */
{us/gp/gpuid.i}
{us/px/pxmaint.i}
 
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}
{us/gp/gpatrdef.i "new shared"}
{us/px/pxphdef.i ppitxr}
{us/px/pxphdef.i pafunc}
 
{us/ca/cattdef2.i}
 
/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}
/* API dataset for transfer */
{us/wo/wodsbkfl.i "reference-only"}
 
define new shared variable cline as character.
define new shared variable eff_date like glt_effdate.
define new shared variable location like sr_loc no-undo.
define new shared variable lotnext like wo_lot_next .
define new shared variable lotprcpt like wo_lot_rcpt no-undo.
define new shared variable lotref like sr_ref format "x(8)" no-undo.
define new shared variable lotserial like sr_lotser no-undo.
define new shared variable lotserial_control as character.
define new shared variable lotserial_qty like sr_qty no-undo.
define new shared variable multi_entry like mfc_logical no-undo.
define new shared variable part like wod_part.
define new shared variable site like sr_site no-undo.
define new shared variable total_lotserial_qty like wod_qty_chg.
define new shared variable trans_conv like sod_um_conv.
define new shared variable trans_um like pt_um.
define new shared variable transtype as character.
define new shared variable wo_recno as recid.
define new shared variable wod_recno as recid.
define new shared variable wopart_wip_acct like pl_wip_acct.
define new shared variable wopart_wip_sub like pl_wip_sub.
define new shared variable wopart_wip_cc like pl_wip_cc.
define new shared variable optrnbr like op_trnbr no-undo.
define new shared variable ophist_recid as recid no-undo.
define new shared variable critical_flg like mfc_logical no-undo.
 
/*OTHER VARIABLES NEEDED BY SFOPTRC1.P:*/
define new shared variable pay_rate like emp_pay_rate.
define new shared variable ref like glt_ref.
define new shared variable op_recno as recid.
define new shared variable wr_recno as recid.
define new shared variable wc_recno as recid.
define new shared variable sf_cr_acct like dpt_lbr_acct.
define new shared variable sf_dr_acct like dpt_lbr_acct.
define new shared variable sf_cr_sub like dpt_lbr_sub.
define new shared variable sf_dr_sub like dpt_lbr_sub.
define new shared variable sf_cr_cc like dpt_lbr_cc.
define new shared variable sf_dr_cc like dpt_lbr_cc.
define new shared variable sf_gl_amt like glt_amt.
define new shared variable opgltype like opgl_type.
define new shared variable gldetail like mfc_logical no-undo.
define new shared variable gltrans like mfc_logical no-undo.
 
/*OTHER VARIABLES NEEDED BY WOJPRC.P*/
define new shared variable any_feedbk like mfc_logical.
define new shared variable any_issued like mfc_logical.
define new shared variable back_qty like sr_qty.
define new shared variable base like mfc_logical.
define new shared variable base_id like wo_base_id.
define new shared variable chg_attr like mfc_logical no-undo.
define new shared variable close_wo like mfc_logical.
define new shared variable comp like ps_comp.
define new shared variable conv like um_conv no-undo.
define new shared variable del-yn like mfc_logical.
define new shared variable deliv like wod_deliver.
define new shared variable fas_wo_rec like fac_wo_rec.
define new shared variable i as integer.
define new shared variable issue_or_receipt as character.
define new shared variable jp like mfc_logical.
define new shared variable leadtime like pt_mfg_lead.
define new shared variable lot like ld_lot.
define new shared variable msg-counter as integer no-undo.
define new shared variable nbr like wo_nbr.
define new shared variable open_ref like wo_qty_ord.
define new shared variable prev_due like wo_due_date.
define new shared variable prev_qty like wo_qty_ord.
define new shared variable prev_release like wo_rel_date.
define new shared variable prev_site like wo_site.
define new shared variable prev_status like wo_status.
define new shared variable qty like wo_qty_ord.
define new shared variable recpt-bkfl like mfc_logical.
define new shared variable recv like mfc_logical.
define new shared variable reject_conv like conv no-undo.
define new shared variable reject_qty like wo_rjct_chg no-undo.
define new shared variable reject_um like pt_um no-undo.
define new shared variable rmks like tr_rmks.
define new shared variable serial like tr_serial.
define new shared variable tot_units like wo_qty_chg.
define new shared variable um like pt_um no-undo.
define new shared variable undo_all like mfc_logical no-undo.
define new shared variable undo_jp like mfc_logical.
define new shared variable undo_setd like mfc_logical no-undo.
define new shared variable yn like mfc_logical.
 
/*OTHER VARIABLES NEEDED BY SFOPCLSE.P*/
define new shared variable complot like op_wo_lot.
define new shared variable compop like op_wo_op.
define new shared variable wo_recid as recid.
define new shared variable comment like op_comment.
define new shared variable qty_comp like wr_qty_comp.
 
define variable act_downtime as decimal no-undo.
define variable act_run like op_act_run no-undo.
define variable act_setup like op_act_setup no-undo.
define variable base_nbr like wo_nbr no-undo.
define variable base_wo_recid as recid no-undo.
define variable earn like op_earn no-undo.
define variable entered_id like wo_lot no-undo.
define variable entered_wo_recid as recid no-undo.
define variable lbr_rate like wc_lbr_rate no-undo.
define variable move_next_op like mfc_logical no-undo.
define variable op_complete like mfc_logical initial true no-undo.
define variable op_recid as recid no-undo.
define variable prev_ops_complete like mfc_logical no-undo.
define variable reason like rsn_code no-undo.
define variable base_qty_ord like wo_qty_ord no-undo.
define variable base_um like pt_um no-undo.
define variable dept like wc_dept no-undo.
define variable emp like op_emp no-undo.
define variable l_conv like um_conv no-undo.
define variable l_um like pt_um no-undo.
define variable mch like wr_mch no-undo.
define variable op like wr_op no-undo.
define variable parent_lot like wo_lot no-undo.
define variable project like op_project no-undo.
define variable receive_conv as decimal no-undo.
define variable shift like op_shift no-undo.
define variable temp_conv as decimal no-undo.
define variable temp_qty as decimal no-undo.
define variable time_ind like mfc_logical no-undo.
define variable total_qty_rcv like sr_qty no-undo.
define variable unconv_qty_comp as decimal no-undo.
define variable conv_qty_comp as decimal no-undo.
define variable undo-input like mfc_logical no-undo.
define variable undo_stat like mfc_logical no-undo.
define variable wkctr like wr_wkctr no-undo.
define variable consider_output_qty like mfc_logical no-undo.
define variable dummy_gl_amt like tr_gl_amt no-undo.
define variable l_isPickFlag  like mfc_logical initial no no-undo.
 
define buffer ptmstr for pt_mstr.
 
define new shared variable h_wiplottrace_procs as handle no-undo.
define new shared variable h_wiplottrace_funcs as handle no-undo.
define variable result_status as character no-undo.
define variable move_to_wkctr like wc_wkctr no-undo.
define variable move_to_mch like wc_mch no-undo.
define variable wip_lotserial as character no-undo.
define variable l_pt_lot_ser as character no-undo.
define variable lastOp as integer no-undo.
define variable isSerialized as logical no-undo.
define variable l_qty_wip    as decimal   no-undo.
 
define new shared variable doc1   as character format "x(24)" label "Document".
define new shared variable is-doc as character format "x(24)".
define new shared variable is-down-doc as character format "x(24)".

/*cy1018 BEGIN*/
define variable l_prtlbl like mfc_logical                  no-undo.
define variable l_lblno  as   integer     format ">>9"     no-undo.
define new shared variable l_lotitm like mfc_logical       no-undo.
 
{us/xf/xfdefa.i  "new"}    /*global FT Vars */
   
form
   l_prtlbl   colon 22 label "Print Receipt Labels"
   l_lblno    colon 22 label "Number of Copies"
   skip(1)
with frame a row 10 side-labels width 80.
/*cy1018 END*/   
 
{us/wl/wlfnc.i} /*FUNCTION FORWARD DECLARATIONS*/
{us/wl/wlcon.i} /*CONSTANTS DEFINITIONS*/
 
if is_wiplottrace_enabled() then do:
   {us/bbi/gprun.i ""wlpl.p"" "persistent set h_wiplottrace_procs"}
   {us/bbi/gprun.i ""wlfl.p"" "persistent set h_wiplottrace_funcs"}
end.
 
form
   wo_nbr         colon 16
   wo_lot         colon 42
   wo_status      colon 75 label "WO Status"
   wo_part        colon 16
   pt_desc1       at 40 no-label
   wr_op          colon 16
   wr_desc        at 40 no-label
   wr_status      colon 75 label "Op Status"
   doc1           colon 16
with frame wo_op side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame wo_op:handle).
 
empty temp-table tt_attr_pfvalue.
 
/* THIS TRIGGER IS USED TO GENERATE THE PROPER  "RECEIVED   */
/* QTYS"  FOR  JOINT  PRODUCTS  RECEIPTS.   NORMALLY  A J-P */
/* RECEIPT DEFAULTS TO THE QTY OPEN.  THIS SETS IT TO  WHAT */
/* IS EXPECTED PER THIS TRANSACTION'S QTY COMPLETED.        */
 
on write of qad_wkfl new new_qad
do:
   if new_qad.qad_key1 = SessionUniqueID + 'wojprc.p'
      and new_qad.qad_decfld[15] = 0
   then do:
 
      for first ptmstr
          where ptmstr.pt_domain = global_domain and  pt_part = qad_charfld[1]
         no-lock:
      end. /* FOR FIRST ptmstr */
 
      assign
         temp_qty               = (qty_comp * new_qad.qad_decfld[2])
                                   / base_qty_ord
         new_qad.qad_decfld[3]  = temp_qty
         new_qad.qad_decfld[5]  = temp_qty
         new_qad.qad_decfld[6]  = temp_qty
         new_qad.qad_decfld[8]  = temp_qty
         new_qad.qad_decfld[15] = 1.
      {us/px/pxrun.i &PROC  = 'getFieldDefault'
               &HANDLE=ph_ppitxr
               &PROGRAM = 'ppitxr.p'
               &PARAM = "( input  qad_charfld[1],
                           input  pt_site,
                           input ""pt_lot_ser"",
                           output l_pt_lot_ser)"
               &NOAPPERROR = true
               &CATCHERROR = true
      }
 
      if l_pt_lot_ser <> ""
      then
         new_qad.qad_decfld[6] = 0.
   end. /* IF new_qad.qad_key1 = SessionUniqueID + 'wojprc.p' */
end. /* ON WRITE OF qad_wkfl NEW new_qad */
 
for first fac_ctrl
    where fac_ctrl.fac_domain = global_domain no-lock:
   fas_wo_rec = fac_wo_rec.
end. /* FOR FIRST fac_ctrl */
 
for first opc_ctrl
    where opc_ctrl.opc_domain = global_domain no-lock:
   assign
      time_ind     = opc_time_ind = "D"
      move_next_op = opc_move.
end. /* FOR FIRST opc_ctrl */
 
eff_date = today.
 
/* For API Mode, get handle of API Controller and dataset */
{us/gp/gpapinit.i "dsWOOperationBackflush" "getRequestDataset"}
 
mainloop:
repeat:
/*cy1018*/ hide frame a no-pause.
   /*INITIALIZE WIP LOT TEMPTABLES*/
 
   if is_wiplottrace_enabled()
   then do:
      run init_bkfl_input_wip_lot_temptable in h_wiplottrace_procs.
      run init_bkfl_output_wip_lot_temptable in h_wiplottrace_procs.
      run init_bkfl_scrap_wip_lot_temptable in h_wiplottrace_procs.
      run init_bkfl_reject_wip_lot_temptable in h_wiplottrace_procs.
   end. /* IF is_wiplottrace_enabled() */
 
   if available wo_mstr 
   then 
      release wo_mstr.
 
   /*GET WORK ORDER NBR/ID FROM USER*/
 
   if c-application-mode <> "API" then do:
      run get_workorder
         (output undo_stat).
 
      if undo_stat
      then
         undo, leave.
 
   end. /* if c-application-mode <> "API" */
   else do:
      run getNextRecord in apiMethodHandle (input "ttWorkOrder").
      if return-value = {&RECORD-NOT-FOUND} then do:
         leave mainloop.
      end.
      assign
         {us/mf/mfaidflt.i ttWorkOrder.woNbr wo_nbr:screen-value}
         {us/mf/mfaidflt.i ttWorkOrder.woLot wo_lot:screen-value}
         wo_nbr:screen-value = ttWorkOrder.woNbr
         wo_lot:screen-value = ttWorkOrder.woLot.
   end.
 
   if wo_nbr:MODIFIED = true and
      wo_lot:MODIFIED = true
   then do:
      if input wo_nbr <> "" and
         input wo_lot <> ""
      then 
         for first wo_mstr
            use-index wo_lot
            using wo_lot and wo_nbr
            where wo_mstr.wo_domain = global_domain
            no-lock:
         end. /* FOR FIRST wo_mstr */
      else
      if input wo_nbr <> ""
      then
         for first wo_mstr
            use-index wo_nbr
            using  wo_nbr
            where wo_mstr.wo_domain = global_domain
            no-lock:
         end. /* FOR FIRST wo_mstr */
      if input wo_lot <> ""
      then
         for first wo_mstr
            use-index wo_lot
            using  wo_lot
            where wo_mstr.wo_domain = global_domain
            no-lock:
         end. /* FOR FIRST wo_mstr */
   end. /* IF wo_nbr:MODIFIED     = true */
 
   if wo_nbr:MODIFIED = false and
      wo_lot:MODIFIED = true 
   then do:
      if input wo_lot <> ""
      then
         for first wo_mstr
           use-index wo_lot
           using  wo_lot
           where wo_mstr.wo_domain = global_domain
           no-lock:
         end. /* FOR FIRST wo_mstr */
      else
         for first wo_mstr
            use-index wo_nbr
            using  wo_nbr
            where wo_mstr.wo_domain = global_domain
            no-lock:
         end. /* FOR FIRST wo_mstr */
   end. /* IF wo_nbr:MODIFIED    = false */
 
   if wo_nbr:MODIFIED = true and
       wo_lot:MODIFIED = false
   then do:
      if input wo_nbr <> ""
      then
         for first wo_mstr
            use-index wo_nbr
            using  wo_nbr
            where wo_mstr.wo_domain = global_domain
            no-lock:
         end. /* FOR FIRST wo_mstr */
      else
         for first wo_mstr 
            use-index wo_lot
            using   wo_lot
            where wo_mstr.wo_domain = global_domain
            no-lock:
         end.
   end. /* ELSE IF wo_nbr:MODIFIED    = true */
 
   if wo_nbr:MODIFIED = false and
      wo_lot:MODIFIED = false
   then do:
      for first wo_mstr
         use-index wo_lot
         using  wo_lot and wo_nbr
         where wo_mstr.wo_domain = global_domain
         no-lock:
      end. /* FOR FIRST wo_mstr */
    end. /* IF wo_nbr:MODIFIED    = false */ 
 
   if not available wo_mstr
   then do:
      if input wo_lot <> ""
      then
         for first wo_mstr
            use-index wo_lot
            using  wo_lot
            where wo_mstr.wo_domain = global_domain
            no-lock:
         end. /* For FIRST wo_mstr */
   end.
 
   if available wo_mstr
   then do:
      if c-application-mode <> "API" then do:
         display
            wo_nbr
            wo_lot
         with frame wo_op.
      end. /*if c-application-mode <> "API" */
 
      /*WO VALIDATIONS*/
      run validate_workorder
         (input input frame wo_op wo_nbr,
          input input frame wo_op wo_lot,
          output entered_id,
          output undo_stat).
 
      if undo_stat
      then
         undo, retry.
   end. /* IF AVAIlABLE wo_mstr */
   else do:
      /* WORK ORDER/ID DOES NOT EXIST*/
      {us/bbi/pxmsg.i &MSGNUM=510 &ERRORLEVEL=3}
      undo, retry.
   end.
 
   assign
      entered_wo_recid = recid(wo_mstr)
      base_id          = wo_lot
      base_wo_recid    = recid(wo_mstr)
      base_nbr         = wo_nbr
      jp               = no.
 
   if wo_joint_type <> ""
   then do:
 
      jp = yes.
 
      if wo_joint_type = "5"
      then
         base = yes.
      else do:
         assign
            base       = no
            base_id    = wo_base_id
            parent_lot = wo_base_id.
 
         for first wo_mstr
             where wo_mstr.wo_domain = global_domain and  wo_lot = base_id
            no-lock:
         end. /* FOR FIRST wo_mstr */
 
         if not available wo_mstr
         then do:
            /*BASE PROCESS WORK ORDER NOT AVAILABLE*/
            {us/bbi/pxmsg.i &MSGNUM=6530 &ERRORLEVEL=1}
            undo , retry.
         end. /* IF NOT AVAILABLE wo_mstr */
 
         base_wo_recid = recid(wo_mstr).
         /* BASE PROCESS ID */
         {us/bbi/pxmsg.i &MSGNUM=8463 &ERRORLEVEL=1 &MSGARG1=base_id}
 
      end. /* ELSE DO */
 
   end. /* IF wo_joint_type <> "" */
 
   for first wo_mstr
       where wo_mstr.wo_domain = global_domain and  wo_lot = base_id
      no-lock:
   end. /* FOR FIRST wo_mstr */
 
   for first pt_mstr
       where pt_mstr.pt_domain = global_domain and  pt_part = wo_part
      no-lock:
   end. /* FOR FIRST pt_mstr */
 
   assign
      base_um      = pt_um
      base_qty_ord = wo_qty_ord.
 
   /*DISPLAY WORK ORDER STUFF*/
 
   find wo_mstr where recid(wo_mstr) = entered_wo_recid.
 
   for first pt_mstr
       where pt_mstr.pt_domain = global_domain and  pt_part = wo_part
      no-lock:
   end. /* FOR FIRST pt_mstr */
 
   if c-application-mode <> "API" then do:
      display
         wo_nbr
         wo_lot
         wo_part
         wo_status
         pt_desc1
      with frame wo_op.
   end. /* if c-application-mode <> "API" */
 
   /*DETERMINE WIP ACCT TO USE*/
 
   assign
      wopart_wip_acct = wo_acct
      wopart_wip_sub  = wo_sub
      wopart_wip_cc   = wo_cc
      wo_recno        = recid(wo_mstr).
 
   if wopart_wip_acct = ""
   then do:
      {us/bbi/gprun.i ""glactdft.p"" "(input ""WO_WIP_ACCT"",
                                input pt_prod_line,
                                input wo_site,
                                input """",
                                input """",
                                input no,
                                output wopart_wip_acct,
                                output wopart_wip_sub,
                                output wopart_wip_cc)"}
   end. /* IF wopart_wip_acct = "" */
 
   /*GET OPERATION FROM USER*/
   do on error undo, retry:
 
      if c-application-mode = "API" and retry then
         undo mainloop, next mainloop.
 
      if c-application-mode <> "API" then do:
         prompt-for
            wr_op
            doc1
         with frame wo_op
         editing:
            {us/mf/mfnp05.i wr_route wr_lot " wr_route.wr_domain = global_domain and
            wr_lot  = base_id"
               wr_op "input wr_op"}
 
            if recno <> ?
            then
               display
                  wr_op
                  wr_desc
                  wr_status
               with frame wo_op.
         end. /* EDITING */
      end. /* if c-application-mode <> "API" */
      else do:
         assign
            {us/mf/mfaidflt.i ttWorkOrder.wrOp integer(wr_op:screen-value)}
            {us/mf/mfaidflt.i ttWorkOrder.doc1 doc1}
            wr_op:screen-value = string(ttWorkOrder.wrOp)
            doc1:screen-value  = ttWorkOrder.doc1.
      end.
 
      for first wr_route
          where wr_route.wr_domain = global_domain and  wr_lot = base_id
         and wr_op = input wr_op
         no-lock:
      end. /* FOR FIRST wr_route */
 
      if not available wr_route
      then do:
         /*OPERATION DOES NOT EXIST*/
         if c-application-mode = "API" then do:
            {us/bbi/pxmsg.i &MSGNUM=106 &ERRORLEVEL=3 &FIELDNAME=""wrOp""}
         end. /* if c-application-mode = "API" */
         else do:
            {us/bbi/pxmsg.i &MSGNUM=106 &ERRORLEVEL=3}
            next-prompt wr_op with frame wo_op.
         end.
         undo, retry.
      end. /* IF NOT AVAILABLE wr_route */
      run getLastOperation(input wo_nbr, input wo_lot, output lastOp).
 
      if wr_op = lastOp then do:
        {us/px/pxrun.i &PROC='isItemSerialized'
               &PROGRAM='pafunc.p'
               &HANDLE = ph_pafunc
               &PARAM = "(input wr_part,
                          output isSerialized)"
               &NOAPPERROR = true
               &CATCHERROR = true}
         if isSerialized then do:
            /* Serialized Item is not allowed */
            {us/bbi/pxmsg.i &MSGNUM=13694 &ERRORLEVEL=3}
            if c-application-mode <> "API" then do:
               next-prompt wr_route.wr_op with frame wo_op.
            end.
            undo, retry.
         end.
      end.
 
      if c-application-mode <> "API" then do:
         display
            wr_op
            wr_desc
            wr_status
         with frame wo_op.
      end. /* if c-application-mode <> "API" */
 
      if wr_status = "C"
      then do:
         /* OPERATION CLOSED */
         {us/bbi/pxmsg.i &MSGNUM=524 &ERRORLEVEL=3}
         undo, retry.
      end. /* IF wr_status = "C" */
 
      op = input wr_op.
   end. /* DO ON ERROR UNDO, retry */
 
   assign doc1.
 
   for first wo_mstr
       where wo_mstr.wo_domain = global_domain and  wo_lot = base_id
      no-lock:
   end. /* FOR FIRST wo_mstr */
 
   assign
      wkctr             = wr_wkctr
      mch               = wr_mch
      dept              = ""
      project           = wo_project
      comment           = ""
      op_complete       = false
      prev_ops_complete = true
      move_next_op      = true
      l_um              = pt_um
      l_conv            = 1.
 
   for first wc_mstr
       where wc_mstr.wc_domain = global_domain and  wc_wkctr = wr_wkctr
        and wc_mch = wr_mch
      no-lock:
      dept = wc_dept.
   end. /* FOR FIRST wc_mstr */
 
   qty_comp =
   min((wr_qty_move - wr_qty_comp - wr_sub_comp - wr_qty_rjct), wr_qty_wip).
 
   if qty_comp <= 0 then
      qty_comp = wr_qty_wip.
 
   if qty_comp <= 0 then
      qty_comp = wr_qty_move - wr_qty_comp - wr_sub_comp - wr_qty_rjct.
 
   if qty_comp <= 0  then
      qty_comp = wr_qty_ord - wr_qty_comp - wr_sub_comp - wr_qty_rjct.
      unconv_qty_comp = qty_comp.
 
   do on error undo, retry:
 
      if c-application-mode = "API" and retry then
         undo mainloop, next mainloop.
 
      for first wo_mstr
          where wo_mstr.wo_domain = global_domain and  wo_lot = base_id
         no-lock:
      end. /* FOR FIRST wo_mstr */
 
      for first si_mstr
          where si_mstr.si_domain = global_domain and  si_site = wo_site
         no-lock:
      end. /* FOR FIRST si_mstr */
 
      qty_comp = unconv_qty_comp.
 
      /*GET EFFDATE ETC FROM USER*/
      {us/bbi/gprun.i ""wobkfli2.p""
         "(input si_entity,
           input wo_part,
           input-output eff_date,
           input-output shift,
           input-output emp,
           input-output wkctr,
           input-output mch,
           input-output dept,
           input-output project,
           input-output comment,
           input-output qty_comp,
           input-output l_um,
           input-output l_conv,
           input-output op_complete,
           input-output prev_ops_complete,
           input-output move_next_op,
           output undo-input)"}
 
      if undo-input
      then
         undo mainloop, retry mainloop.
 
      assign
         unconv_qty_comp = qty_comp
         conv_qty_comp   = qty_comp * l_conv
         qty_comp        = conv_qty_comp.
 
      /*GET LABOR AND DOWNTIME HOURS FROM USER*/
      {us/bbi/gprun.i ""wobkfli3.p""
         "(input emp,
           input wc_lbr_rate,
           input-output time_ind,
           output earn,
           output act_setup,
           output act_run,
           output act_downtime,
           output reason,
           output undo-input)"}
 
      if undo-input
      then
         undo, retry.
 
      if c-application-mode = "API" then do:
         run setCommonDataBuffer in ApiMethodHandle
            (input "ttSpecificationTests").
      end. /* c-application-mode = "API" */
 
      /* CHECK FOR MASTER SPECIFICATION */
      {us/mp/mpwindow.i wr_part wr_op
         "if wo_routing = """" then wr_part else wo_routing"
          eff_date}
 
      if c-application-mode = "API" then do:
         run setCommonDataBuffer in ApiMethodHandle
             (input "").
      end. /* c-application-mode = "API" */
 
      /*LOCK THE WO*/
      {us/gp/gplock.i &domain="wo_mstr.wo_domain = global_domain and "
         &file-name=wo_mstr
         &find-criteria="recid(wo_mstr) = base_wo_recid"
         &exit-allowed=yes
         &record-id=recno}
 
      /*BUILD THE DEFAULT COMPONENT BACKFLUSH LIST*/
      {us/bbi/gprun.i ""wobkfld.p""
         "(input base_wo_recid,
           input op,
           input conv_qty_comp,
           output undo-input,
           input-output table tt_attr_pfvalue by-reference)"}
 
      if undo-input
      then
         undo, retry.
 
      {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}
 
      /*GET BACKFLUSH LIST MODIFICATIONS FROM USER*/
      part = "".
 
      if c-application-mode = "API" then do:
         run setCommonDataBuffer in apiMethodHandle (input "ttWOCompInfo").
      end. /* if c-application-mode = "API" */
 
      {us/bbi/gprun.i ""wowoisc.p""
         "(input  op,
           input  ""BACKFLUSH"", /* PASSING CONTEXT FOR QXTEND */
           output undo-input,
           output l_isPickFlag,
           input-output table tt_attr_pfvalue by-reference)"}
 
      if c-application-mode = "API" then do:
         run setCommonDataBuffer in apiMethodHandle (input "").
      end. /*if c-application-mode = "API" */
 
      if undo-input
      then
         undo, retry.
 
      /*GET INPUT AND OUTPUT WIP LOTS*/
      if is_wiplottrace_enabled()
         and is_operation_queue_lot_controlled(base_id, op, OUTPUT_QUEUE)
      then do:
 
         if is_operation_queue_lot_controlled(base_id, op, INPUT_QUEUE)
         then do:
            /* Identify context for QXtend */
            {us/gp/gpcontxt.i
            &STACKFRAG = 'wlpl,wlui,wluibi,wlpl,wobkfl'
            &FRAME = 'yn' &CONTEXT = 'INFO2'}
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in apiMethodHandle (input
                  "ttWIPLotInputIssue").
            end. /* c-application-mode = "API" */
 
            run get_wobkfl_input_wip_lots_from_user in h_wiplottrace_procs
               (input base_id,
                input op,
                input unconv_qty_comp ,
                input l_conv,
                input l_um,
                input wo_site,
                input wkctr,
                input mch,
                output undo_stat).
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in apiMethodHandle (input
                  "").
            end. /* c-application-mode = "API" */
 
            /* Clear context for QXtend */
            {us/gp/gpcontxt.i
            &STACKFRAG = 'wlpl,wlui,wluibi,wlpl,wobkfl'
            &FRAME = 'yn'}
 
            if undo_stat
            then
               undo, retry.
         end. /* IF is_operation_queue_lot_controlled(base_id, op, ... */
 
         assign
            move_to_wkctr = wkctr
            move_to_mch   = mch.
 
         if not is_last_operation(base_id, op) and move_next_op
         then do:
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in ApiMethodHandle
                  (input "ttWIPLotWorkCenterMachine").
            end. /* c-application-mode = "API" */
 
            run get_destination_wkctr_mch_from_user in h_wiplottrace_procs
               (input base_id,
                input next_operation(base_id, op),
                output move_to_wkctr,
                output move_to_mch,
                output undo_stat).
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in ApiMethodHandle
                  (input "").
            end. /* c-application-mode = "API" */
 
            if undo_stat
            then
               undo, retry.
         end. /* IF NOT is_last_operation(base_id, op) and move_next_op */
 
         if not (is_last_operation(base_id, op) and move_next_op)
         then do:
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in ApiMethodHandle
                  (input "ttWIPLotOutputReceipt").
            end. /* c-application-mode = "API" */
 
            run get_wobkfl_output_wip_lots_from_user
               in h_wiplottrace_procs
               (input base_id,
                input op,
                input unconv_qty_comp,
                input l_conv,
                input l_um,
                input move_next_op,
                input wo_site,
                input wkctr,
                input mch,
                output undo_stat).
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in ApiMethodHandle
                  (input "").
            end. /* c-application-mode = "API" */
 
            if undo_stat
            then
               undo, retry.
 
         end. /* IF NOT (is_last_operation(base_id, op) and move_next_op) */
 
      end. /* IF is_wiplottrace_enabled() */
 
      /* IF MOVE NEXT OP AND LAST OPERATION       */
      /* GET RECEIVE LIST MODIFICATIONS FROM USER */
      wip_lotserial = ''.
 
      if is_wiplottrace_enabled()
         and is_operation_queue_lot_controlled(base_id, op, OUTPUT_QUEUE)
      then do:
         /*GET THE INPUT WIP LOT ENTERED IF ONLY ONE WAS ENTERED*/
         run wobkfl_get_input_wip_lot in h_wiplottrace_procs
            (output wip_lotserial).
      end. /* IF is_wiplottrace_enabled() */
 
      if move_next_op
         and not can-find
         (first wr_route  where wr_route.wr_domain = global_domain and  wr_lot
         = base_id and wr_op > op)
      then do:
 
         if jp
         and entered_id = base_id
         then do:
 
            assign
               prev_status  = wo_status
               prev_release = wo_rel_date
               prev_due     = wo_due_date
               prev_qty     = wo_qty_ord
               prev_site    = wo_site
               recv         = true.
 
            if c-application-mode <> "API" then do:
               hide frame wo_op no-pause.
            end. /* c-application-mode <> "API" */
 
            undo_setd = true.
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in apiMethodHandle (input
               "ttWOJointProductTail").
            end. /* if c-application-mode = "API" */
 
            {us/bbi/gprun.i ""wojprc.p""
               "(input wo_nbr,
                 input-output table tt_attr_pfvalue by-reference)"}.
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in apiMethodHandle (input "").
            end. /* if c-application-mode = "API" */
 
            receive_conv = 1.
 
            if c-application-mode <> "API" then do:               
               hide all no-pause.
 
               view frame dtitle.
               view frame wo_op.
            end. /* if c-application-mode <> "API" */
 
            if undo_setd
            then
               undo, retry.
 
         end. /* IF jp */
 
         else do:
 
            if jp
            then do:
 
               for first wo_mstr
                   where wo_mstr.wo_domain = global_domain and  wo_lot =
                   entered_id
                  no-lock:
               end. /* FOR FIRST wo_mstr */
 
               for first pt_mstr
                   where pt_mstr.pt_domain = global_domain and  pt_part =
                   wo_part
                  no-lock:
               end. /* FOR FIRST pt_mstr */
 
               assign
                  l_um            = pt_um
                  l_conv          = 1
                  unconv_qty_comp = (qty_comp * wo_qty_ord) / base_qty_ord.
 
            end. /* IF jp */
 
/*cy1018*   {us/bbi/gprun.i ""wobkfli4.p"" */
/*cy1018*/  {us/bbi/gprun.i ""xxbkfli4.p""
               "(input recid(wo_mstr),
                 input eff_date,
                 input jp,
                 input unconv_qty_comp,
                 input l_um,
                 input l_conv,
                 input wip_lotserial,
                 output close_wo,
                 output rmks,
                 output receive_conv,
                 output undo-input,
                 input-output table tt_attr_pfvalue by-reference)"}
 
            if undo-input
            then
               undo, retry.
         end. /* ELSE DO */
      end. /* IF move_next_op */
 
      /*WIP LOT TRACE CHECKING ETC*/
 
      if is_wiplottrace_enabled()
         and is_operation_queue_lot_controlled(base_id, op, OUTPUT_QUEUE)
      then do:
 
         if is_last_operation(base_id, op) and move_next_op
         then do:
 
            /* IN THIS CASE WE DIDN'T GET  OUTPUT  WIP  LOTS   */
            /* FROM  THE  USER; WE USE THE LOTSER'S ENTERED IN */
            /* sr_wkfl FOR THE FINISHED  MATERIAL  INSTEAD  TO */
            /* CREATE  OUTPUT  WIP  LOTS.   THEN THE INPUT-TO- */
            /* OUTPUT WIP LOTS ARE  BACKFLUSHED,  THEN  OUTPUT */
            /* WIP LOT- TO-FG LOTS ARE BACKFLUSHED.            */
            run init_bkfl_output_wip_lot_temptable
               in h_wiplottrace_procs.
 
            if jp
            then do:
 
               /* FOR   JOINT   PRODUCTS   WE   GATHER   THE LOTNUMBERS     */
               /* ENTERED FOR ALL THE COBYPRODUCTS AND USE FOR THE          */
               /* OUTPUT WIP  LOTS.   WE  THEN APPORTION   THE   QTY        */
               /* PRODUCED PER THE PROPORTION OF THE PARTICULAR FINISHED    */
               /* LOT TO THE  TOTAL  QUANTITY  TO  RECEIVE ACROSS ALL       */
               /* COBYPRODUCTS.   THIS  IS  JUST  A   STRAIGHT ARITHMETIC   */
               /* APPORTIONMENT WITHOUT CONSIDERATION FOR SOME OF THE FINER */
               /* POINTS, SUCH  AS APPORTIONING BASED ON COST, WEIGHT, ETC. */
               total_qty_rcv = 0.
 
               for each wo_mstr
                  no-lock
                   where wo_mstr.wo_domain = global_domain and  wo_nbr =
                   base_nbr and
                  wo_joint_type <> "" and
                  recid(wo_mstr) <> base_wo_recid,
                  each sr_wkfl
                    no-lock
                      where sr_wkfl.sr_domain = global_domain and  sr_userid =
                      SessionUniqueID
                     and sr_lineid = "RCT" + wo_part:
                  total_qty_rcv = total_qty_rcv + sr_qty.
               end. /* FOR EACH wo_mstr */
 
               for each wo_mstr
                  no-lock
                   where wo_mstr.wo_domain = global_domain and  wo_nbr =
                   base_nbr and
                        wo_joint_type <> "" and
                  recid(wo_mstr) <> base_wo_recid,
                  each sr_wkfl
                  no-lock
                   where sr_wkfl.sr_domain = global_domain and  sr_userid =
                   SessionUniqueID
                    and sr_lineid = "RCT" + wo_part
               break by sr_lotser by sr_ref:
 
                  if total_qty_rcv = 0
                  then
                     temp_qty = 0.
                  else
                     temp_qty =
                     (unconv_qty_comp * sr_qty) / total_qty_rcv.
 
                  accumulate temp_qty (sub-total by sr_ref).
 
                  if last-of(sr_ref)
                  then do:
                     run create_bkfl_output_wip_lot_temptable
                        in h_wiplottrace_procs
                        (input sr_lotser,
                         input sr_ref,
                        (accum sub-total by sr_ref temp_qty)).
                  end. /* IF LAST-OF(sr_ref) */
 
               end. /* FOR EACH wo_mstr */
 
            end. /* IF jp */
 
            else do:
 
               for each sr_wkfl
                  no-lock
                   where sr_wkfl.sr_domain = global_domain and  sr_userid =
                   SessionUniqueID
                  and sr_lineid = ""
                  break by sr_lotser by sr_ref:
                  accumulate sr_qty (sub-total by sr_ref).
 
                  if last-of(sr_ref)
                  then do:
                     run create_bkfl_output_wip_lot_temptable
                        in h_wiplottrace_procs
                        (input sr_lotser,
                         input sr_ref,
                        (accum sub-total by sr_ref sr_qty) / receive_conv).
                  end. /* IF LAST-OF(sr_ref) */
               end. /* FOR EACH sr_wkfl */
            end. /* ELSE DO */
         end. /* IF is_last_operation(base_id, op) */
 
         /* CHECK FOR COMINGLED LOTS - INPUT WIP AND COMPONENTS */
         /* TO A PARTICULAR OUTPUT WIP LOT                      */
         run bkfl_check_for_combined_lots in h_wiplottrace_procs
            (input base_id,
             input op,
             input l_conv,
             output result_status).
 
         if result_status = FAILED_EDIT
         then do:
            if batchrun
            then
               undo, leave.
            else
               undo, retry.
         end. /* IF result_status = FAILED_EDIT */
 
         /* CHECK FOR SPLIT LOTS - OUTPUT WIP AND COMPONENTS */
         /* TO A PARTICULAR INPUT WIP LOT                    */
         consider_output_qty = yes.
 
         run bkfl_check_for_split_lots in h_wiplottrace_procs
            (input base_id,
             input op,
             input l_conv,
             input consider_output_qty,
             output result_status).
 
         if result_status = FAILED_EDIT
         then do:
            if batchrun
            then
               undo, leave.
            else
               undo, retry.
         end. /* IF result_status = FAILED_EDIT */
 
      end. /* IF is_wiplottrace_enabled() */
 
      /*GET CONFIRMATION FROM USER*/
      /* Identify context for QXtend */
         {us/gp/gpcontxt.i
            &STACKFRAG = 'wobkfl'
            &FRAME = 'yn' &CONTEXT = 'CONFIRM'}
      yn = true.
      {us/bbi/pxmsg.i &MSGNUM=32 &ERRORLEVEL=1 &CONFIRM=yn
         &CONFIRM-TYPE='LOGICAL'}
      /* Clear context for QXtend */
         {us/gp/gpcontxt.i
            &STACKFRAG = 'wobkfl'
            &FRAME = 'yn'}
      if not yn
      then
         undo, retry.
 
   end. /* DO ON ERROR UNDO, RETRY */
 
   /* RECHECK INVENTORY TO VERIFY ALL IS STILL OK */
   run validate_issue(input  wo_lot,
                      output undo_stat).
   if undo_stat
   then do:
      if batchrun
      then
         undo mainloop, leave mainloop.
      else
         undo mainloop, retry mainloop.
   end. /* IF undo_stat */
 
   /**************************************/
   /*GOT ALL INPUT FROM USER, NOW PROCESS*/
   /**************************************/
 
   /*NO TRANSACTION SHOULD BE PENDING HERE*/
   {us/bbi/gprun.i ""gpistran.p"" "(input 1, input """")"}
 
   is-doc = doc1.
 
   /*CREATE AN OP_HIST RECORD*/
   {us/bbi/gprun.i ""reophist.p""
      "(input  'WO-BKFL',
        input  base_id,
        input  op,
        input  emp,
        input  wkctr,
        input  mch,
        input  dept,
        input  shift,
        input  eff_date,
        input  0,
        output op_recid)"}
 
   /* ASSIGN DOCUMENT TO OP_DOC_ID */
   {us/bbi/gprun.i ""gpopdoc.p""
      "(input is-doc,
        input op_recid)"}
 
   ophist_recid = op_recid.
 
   /*UPDATE THE OP_HIST RECORD AND POST LABOR*/
   do transaction:
 
      /*WO ROUTING RECORD UPDATES*/
      for first wr_route
          where wr_route.wr_domain = global_domain and  wr_lot = base_id
            and wr_op = op
         exclusive-lock:
      end. /* FOR FIRST wr_route */
 
      assign
         wr_qty_comp  = wr_qty_comp + conv_qty_comp
         wr_act_setup = wr_act_setup + act_setup
         wr_act_run   = wr_act_run + act_run.
 
     /* CLEAR WIP OF PREVIOUS OPERATIONS */
      if prev_ops_complete
      then do:
         run clearWIPQty (input wr_nbr, 
                          input wr_lot, 
                          input wr_op, 
                          output l_qty_wip).
 
         wr_qty_wip = wr_qty_wip + l_qty_wip.
      end. /* IF prev_ops_complete */
 
      if op_complete
      then
         wr_status = "C".
      else do:
         if wr_act_run > 0
         then
            wr_status = "R".
         else if wr_act_setup > 0
         then
            wr_status = "S".
         else
            wr_status = "Q".
      end. /* ELSE DO */
 
      /*UPDATE OP_HIST*/
      for first op_hist
         where recid(op_hist) = op_recid
         exclusive-lock:
      end. /* FOR FIRST op_hist */
 
      assign
         op_wo_nbr    = wo_nbr
         op_act_setup = act_setup
         op_act_run   = act_run
         op_earn      = earn
         op_project   = project
         op_std_run   = wr_run
         op_std_setup = 0
         op_qty_comp  = conv_qty_comp
         op_comment   = comment.
      /*POST LABOR*/
      for first wc_mstr
          where wc_mstr.wc_domain = global_domain and  wc_wkctr = wr_wkctr
         and wc_mch = wr_mch
         no-lock:
      end. /* FOR FIRST wc_mstr */
 
      pay_rate = wc_lbr_rate.
 
      for first emp_mstr
          where emp_mstr.emp_domain = global_domain and  emp_addr = emp
         no-lock:
      end. /* FOR FIRST emp_mstr */
 
      if emp_pay_type = "HR"
      and emp_pay_rate <> 0
      then do:
         pay_rate = emp_pay_rate.
         if earn <> ""
         then do:
            for first ea_mstr
                where ea_mstr.ea_domain = global_domain and  ea_earn = earn
               no-lock:
            end. /* FOR FIRST ea_mstr */
 
            if available ea_mstr
            then
               pay_rate = pay_rate * ea_rate.
         end. /* IF earn <> "" */
      end. /* IF emp_pay_type = "HR" */
 
      assign
         op_recno = op_recid
         wr_recno = recid(wr_route)
         wc_recno = recid(wc_mstr).
 
      {us/bbi/gprun.i ""sfoptrc1.p""}
 
      /*CLOSE PREVIOUS OPERATIONS IF USER SAID TO*/
      if prev_ops_complete
      then do:
 
         complot = base_id.
 
         for last wr_route
             where wr_route.wr_domain = global_domain and  wr_lot = base_id
            and wr_op < op
            no-lock:
            assign
               compop    = wr_op
               transtype = "OP-CLOSE"
               wo_recid  = recid(wo_mstr).
 
            /* CREATE USRW_WKFL TO KEEP DOCUMENT */
            create usrw_wkfl.
            assign
               usrw_wkfl.usrw_domain = global_domain
               usrw_key1 = "#@#" + global_userid + SessionUniqueID
               usrw_key2 = is-doc.
 
            if recid(usrw_wkfl) = -1 then .
 
            {us/bbi/gprun.i ""sfopclse.p""}
         end. /* FOR LAST wr_route */
 
      end. /* IF prev_ops_complete */
 
      /*BACKFLUSH INPUT WIP LOTS AND PRODUCE OUTPUT WIP LOTS*/
      if is_wiplottrace_enabled()
         and is_operation_queue_lot_controlled(base_id, op, OUTPUT_QUEUE)
      then do:
         run bkfl_backflush_wip_lots in h_wiplottrace_procs
            (input op_trnbr, input base_id, input op, input l_conv,
             input wo_site, input op_wkctr, input op_mch).
      end. /* IF is_wiplottrace_enabled() */
   end. /* DO TRANSACTION */
 
   /*ISSUE COMPONENTS*/
   assign
      ophist_recid = op_recid
      wo_recno     = base_wo_recid.
 
   /* ADDED THIRD INPUT AND FOURTH OUTPUT PARAMETER. THESE TWO PARAMETER */
   /* WILL BE USED BY FLOW. INPUT PARAMETER IS LOT ID. OTHER THAN */
   /* FLOW IT WILL BE BLANK OUTPUT PARAMETER IS ACCUMLATED        */
   /* TRANSACTION AMOUNT. OTHER THAN FLOW IT WILL BE ALWAYS O     */
   {us/bbi/gprun.i ""wowoisa.p"" "(input no,
                            input op_recid,
                            input  """",
                            input table tt_attr_pfvalue by-reference,
                            input l_isPickFlag,
                            output dummy_gl_amt
                           )"}
 
   assign
      is-doc      = doc1
      is-down-doc = doc1.
 
   /*IF MOVE NEXT OP AND NOT LAST OPERATION, PERFORM MOVE*/
   if can-find (first wr_route
                 where wr_route.wr_domain = global_domain and  wr_lot =  base_id
                  and wr_op  >= op)
      and move_next_op
   then do transaction:
 
      {us/bbi/gprun.i ""wobkflb.p""
         "(input recid(wo_mstr),
           input op,
           input conv_qty_comp,
           input eff_date)"}
 
      /*MOVE OUTPUT WIP LOTS TO INPUT QUEUE OF NEXT OPERATION*/
      if is_wiplottrace_enabled()
         and is_operation_queue_lot_controlled(base_id, op, OUTPUT_QUEUE)
         and can-find (first wr_route
                        where wr_route.wr_domain = global_domain and  wr_lot =
                        base_id
                         and wr_op  > op)
      then do:
         run bkfl_move_wip_lots in h_wiplottrace_procs
            (input op_wo_lot, input op_wo_op, input l_conv,
             input op_site, input op_wkctr, input op_mch,
             input move_to_wkctr, input move_to_mch).
      end. /* IF is_wiplottrace_enabled() */
 
   end. /* IF CAN-FIND (FIRST wr_route */
 
   /*IF MOVE NEXT OP AND IS LAST OPERATION, PERFORM RECEIPT*/
   if not can-find
      (first wr_route  where wr_route.wr_domain = global_domain and  wr_lot =
      base_id and wr_op > op)
      and move_next_op
   then do:
      /* ADDED SECOND INPUT PARAMETER entered_wo_recid */
      {us/bbi/gprun.i ""wobkfla.p""
         "(input base_wo_recid,
           input entered_wo_recid,
           input eff_date,
           input close_wo,
           input rmks,
           input jp,
           input lotserial,
           input op_recid,
           input conv_qty_comp,
           input-output table tt_attr_pfvalue by-reference)"}
   end. /* IF NOT CAN-FIND */
 
   /*POST DOWNTIME*/
   if act_downtime <> 0
   then do:
      {us/bbi/gprun.i ""wobkflc.p""
         "(input base_id,
           input op,
           input emp,
           input earn,
           input shift,
           input wkctr,
           input mch,
           input dept,
           input reason,
           input eff_date,
           input act_downtime,
           input project)"}
   end. /* IF act_downtime <> 0 */


   /*cy1018 BEGIN*/
   assign 
      l_prtlbl = yes
      l_lblno  = 1.
   
   /*remove this if no labels need to be activated only for lot items*/
   l_lotitm = yes.
   
   update 
      l_prtlbl
      l_lblno when l_lotitm
   with frame a.
   
   if not l_prtlbl then 
      next mainloop.
             
   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 80
               &pagedFlag = "nopage"
               &stream = "stream ft"
               &appendToFile = " "
               &streamedOutputToTerminal = " "
               &withBatchOption = "yes"
               &displayStatementType = 1
               &withCancelMessage = "yes"
               &pageBottomMargin = 6
               &withEmail = "yes"
               &withWinprint = "yes"
               &defineVariables = "yes"}
   
   {us/xf/xfoutnul.i}     
   for each tr_hist no-lock 
      where tr_domain   = global_domain
      and   tr_nbr      = wo_nbr
      and   tr_lot      = wo_lot
      and   tr_type     = "RCT-WO"
      and   tr_part     = wo_part,
      first pt_mstr no-lock
      where pt_domain   = global_domain
      and   pt_part     = tr_part
      break by tr_part by tr_trnbr /*by int(entry(2,tr_serial,"-"))*/:
     {us/xx/xxwolbl.i}
   end. /*for each tr_hist no-lock*/ 
   {us/bbi/mfreset.i "stream ft"}
   /*cy1018 END*/


 
   {us/gp/gprunp.i "soldxr" "p" "updateLegalNumToUnpostedGLEx"}
end. /* REPEAT */
 
if is_wiplottrace_enabled()
then
   delete PROCEDURE h_wiplottrace_procs no-error.
if is_wiplottrace_enabled()
then
   delete PROCEDURE h_wiplottrace_funcs no-error.
 
PROCEDURE validate_workorder:
   define input parameter ip_wo_nbr like wo_lot no-undo.
   define input parameter ip_wo_lot like wo_lot no-undo.
   define output parameter op_wo_lot like wo_lot no-undo.
   define output parameter op_undo_stat like mfc_logical no-undo.
 
   define variable return_int as integer no-undo.
 
   if ip_wo_lot <> ""
   then do:
 
      for first wo_mstr
          where wo_mstr.wo_domain = global_domain and  wo_lot = ip_wo_lot
         no-lock:
      end. /* FOR FIRST wo_mstr */
 
      if not available wo_mstr
      then do:
         /*WORK ORDER/ID DOES NOT EXIST*/
         {us/bbi/pxmsg.i &MSGNUM=510 &ERRORLEVEL=3}
         op_undo_stat = true.
         leave.
      end. /* IF NOT AVAILABLE wo_mstr */
 
   end. /* IF ip_wo_lot <> "" */
 
   else do:
 
      for first wo_mstr
          where wo_mstr.wo_domain = global_domain and  wo_nbr = ip_wo_nbr
         no-lock:
      end. /* FOR FIRST wo_mstr */
 
      if not available wo_mstr
      then do:
         /*WORK ORDER NUMBER DOES NOT EXIST*/
         {us/bbi/pxmsg.i &MSGNUM=503 &ERRORLEVEL=3}
         op_undo_stat = true.
         leave.
      end. /* IF NOT AVAILABLE wo_mstr */
 
   end. /* ELSE DO */
 
   if wo_status <> "R"
   then do:
      /*WORK ORDER ID IS CLOSED, PLANNED, OR FIRM PLANNED*/
      {us/bbi/pxmsg.i &MSGNUM=523 &ERRORLEVEL=3}
      op_undo_stat = true.
      leave.
   end. /* IF wo_status <> "R" */
 
   if wo_fsm_type = "FSM-RO"
   then do:
      /*CONTROLLED BY SERVICE/SUPPORT MODULE*/
      {us/bbi/pxmsg.i &MSGNUM=7492 &ERRORLEVEL=3}
      op_undo_stat = true.
      leave.
   end. /* IF wo_fsm_type = "FSM-RO" */
 
   if wo_type = "c"
   and wo_nbr = ""
   then do:
      /*WORK ORDER TYPE IS CUMULATIVE*/
      {us/bbi/pxmsg.i &MSGNUM=5123 &ERRORLEVEL=3}
      op_undo_stat = true.
      leave.
   end. /* IF wo_type = "c" */
 
   if wo_type = "F"
   and fas_wo_rec = false
   then do:
      /* WORK ORDER RECEIPT NOT ALLOWED FOR FINAL ASSY ORDERS */
      {us/bbi/pxmsg.i &MSGNUM=8553 &ERRORLEVEL=3}
      op_undo_stat = true.
      leave.
   end. /* IF wo_type = "F" */
 
   if wo_type = "w"
   then do:
      /* WORD ORDER TYPE IS FLOW */
      {us/bbi/pxmsg.i &MSGNUM=5285 &ERRORLEVEL=3}
      op_undo_stat = true.
      leave.
   end. /* IF wo_type = "w" */
 
   {us/bbi/gprun.i ""gpsiver.p""
      "(input wo_site,
        input ?,
        output return_int)"}
 
   if return_int = 0
   then do:
      /*USER DOES NOT HAVE ACCESS TO SITE:*/
      {us/bbi/pxmsg.i &MSGNUM=2710 &ERRORLEVEL=3 &MSGARG1=wo_site}
      op_undo_stat = true.
      leave.
   end. /* IF return_int = 0 */
 
   op_wo_lot = wo_lot.
 
END PROCEDURE. /* validate_workorder */
 
PROCEDURE get_workorder:
 
   define output parameter op_undo_stat like mfc_logical no-undo.
 
   op_undo_stat = true.
 
   do on endkey undo, leave:
 
      prompt-for
         wo_nbr
         wo_lot
         with frame wo_op
      editing:
 
         if frame-field = "wo_nbr"
         then do:
            {us/mf/mfnp.i wo_mstr wo_nbr  " wo_mstr.wo_domain = global_domain and
            wo_nbr "  wo_nbr wo_nbr wo_nbr}
 
            if recno <> ?
            then do:
               for first pt_mstr
                   where pt_mstr.pt_domain = global_domain 
                    and  pt_part = wo_part
                  no-lock:
               end. /* FOR FIRST pt_mstr */
               if not available pt_mstr
               then
                  /* A PART NUMBER ONLY EXISTS */
                  /* FOR SUBASSEMBLIES.        */
                  display
                     wo_nbr
                     wo_lot
                     wo_part
                     wo_status
                     "" @ pt_desc1
                  with frame wo_op.
               else
                  display
                     wo_nbr
                     wo_lot
                     wo_part
                     wo_status
                     pt_desc1
                  with frame wo_op.
            end. /* IF recno <> ? */
         end. /* IF FRAME-FIELD = "wo_nbr" */
         else
            if frame-field = "wo_lot"
            then do:
               {us/mf/mfnp.i wo_mstr wo_lot  " wo_mstr.wo_domain = global_domain and
               wo_lot "  wo_lot wo_lot wo_lot}
 
               if recno <> ?
               then do:
                  for first pt_mstr
                      where pt_mstr.pt_domain = global_domain 
                       and  pt_part = wo_part
                     no-lock:
                  end. /* FOR FIRST pt_mstr */
                  if not available pt_mstr
                  then
                     /* A PART NUMBER ONLY EXISTS */
                     /* FOR SUBASSEMBLIES.        */
                     display
                        wo_nbr
                        wo_lot
                        wo_part
                        wo_status
                        "" @ pt_desc1
                     with frame wo_op.
                  else
                     display
                        wo_nbr
                        wo_lot
                        wo_part
                        wo_status
                        pt_desc1
                     with frame wo_op.
               end. /* IF recno <> ? */
            end. /* IF FRAME-FIELD = "wo_lot" */
         else do:
            status input.
            readkey.
            apply lastkey.
         end. /* ELSE DO */
      end. /* EDITING */
 
      op_undo_stat = false.
   end. /* DO ON ENDKEY UNDO, LEAVE */
 
END PROCEDURE. /* get_workorder */
 
/* TO VALIDATE INVENTORY STILL EXIST FOR COMPONENT ISSUE */
PROCEDURE validate_issue:
   define input  parameter i_wo_lot    like wo_lot    no-undo.
   define output parameter o_undo_stat like undo_stat no-undo.
 
   define variable l_um like pt_um.
 
   for each wod_det
      where wod_domain = global_domain
      and   wod_lot    = i_wo_lot
   no-lock,
   each sr_wkfl
      where sr_domain  = global_domain
      and   sr_userid  = SessionUniqueID
      and   sr_lineid  = string(wod_part,"x(18)") + string(wod_op)
      and   sr_qty    <> 0.00
   no-lock:
 
      l_um = "".
      for first pt_mstr
         where pt_domain = global_domain
         and   pt_part   = wod_part
      no-lock:
         l_um = pt_mstr.pt_um.
      end. /* FOR FIRST pt_mstr */
 
      {us/bbi/gprun.i ""icedit2.p""
               "( ""ISS-WO"",
                 sr_site,
                 sr_loc,
                 wod_part,
                 sr_lotser,
                 sr_ref,
                 sr_qty,
                 l_um,
                 """",
                 """",
                 output o_undo_stat)"}
 
      if o_undo_stat
      then do:
         /* UNABLE TO ISSUE OR RECEIVE FOR ITEM */
         {us/bbi/pxmsg.i &MSGNUM=161 &ERRORLEVEL=4
                         &MSGARG1=wod_part}
         leave.
      end. /* IF o_undo_stat */
 
   end. /* FOR EACH wod_det */
 
END PROCEDURE. /* validate_issue */
 
procedure getLastOperation:
   define input parameter ip_nbr as character no-undo.
   define input parameter ip_lot as character no-undo.
   define output parameter op_op as integer no-undo initial ?.
 
   define buffer wrroute for wr_route.
 
   for last wrroute no-lock
      where wrroute.wr_domain = global_domain
         and wrroute.wr_nbr = ip_nbr
         and wrroute.wr_lot = ip_lot
   break by wrroute.wr_op:
      op_op = wrroute.wr_op.
   end.
end procedure.
 
PROCEDURE clearWIPQty :
/*------------------------------------------------------------------------------
Purpose:      CLEAR WIP OF PREVIOUS OPERATIONS
Exceptions:    None
Conditions:
Notes:
History:
------------------------------------------------------------------------------*/
   define input  parameter p_wrnbr      as character  no-undo.
   define input  parameter p_wrlot      as character  no-undo.
   define input  parameter p_wrop       as integer    no-undo.
   define output parameter p_qty_wip    as decimal    no-undo.
 
   define buffer bwr_route       for wr_route.
 
   p_qty_wip = 0.
   for each bwr_route 
      where bwr_route.wr_domain   = global_domain
        and bwr_route.wr_nbr      = p_wrnbr
        and bwr_route.wr_lot      = p_wrlot
        and bwr_route.wr_op       < p_wrop
        and bwr_route.wr_status  <> "C"
        and bwr_route.wr_qty_wip <> 0
   exclusive-lock break by bwr_route.wr_op:
      assign
         p_qty_wip            = p_qty_wip + bwr_route.wr_qty_wip
         bwr_route.wr_qty_wip = 0.
   end. /* FOR EACH wr_route  */
 
 
END PROCEDURE.
