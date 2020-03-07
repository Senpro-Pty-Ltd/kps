/* xxrebkfl.p   - REPETITIVE   BACKFLUSH TRANSACTION                          */
/* rebkfl.p   - REPETITIVE   BACKFLUSH TRANSACTION                            */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrebkfl.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*                                                                            */
/* REVISION: 7.3      LAST MODIFIED: 10/31/94   BY: WUG *GN77*                */
/* REVISION: 7.3      LAST MODIFIED: 11/03/94   BY: WUG *GN98*                */
/* REVISION: 7.3      LAST MODIFIED: 12/16/94   BY: WUG *G09J*                */
/* REVISION: 7.3      LAST MODIFIED: 03/01/95   BY: WUG *G0G6*                */
/* REVISION: 7.3      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 8.5      LAST MODIFIED: 05/12/95   BY: pma *J04T*                */
/* REVISION: 7.3      LAST MODIFIED: 11/01/95   BY: ais *G0V9*                */
/* REVISION: 8.5      LAST MODIFIED: 11/14/95   BY: ktn *J095*                */
/* REVISION: 7.3      LAST MODIFIED: 01/23/96   BY: jym *G1G0*                */
/* REVISION: 8.5      LAST MODIFIED: 02/14/96   BY: jym *G1M9*                */
/* REVISION: 8.5      LAST MODIFIED: 01/18/96   BY: bholmes *J0FY*            */
/* REVISION: 8.5      LAST MODIFIED: 04/03/96   BY: jym *G1PZ*                */
/* REVISION: 8.5      LAST MODIFIED: 05/07/96   BY: jym *G1V4*                */
/* REVISION: 8.5      LAST MODIFIED: 05/16/96   BY: jym *G1VW*                */
/* REVISION: 8.6      LAST MODIFIED: 06/11/96   BY: ejh *K001*                */
/* REVISION: 8.5      LAST MODIFIED: 07/19/96   BY: gwm *J0ZB*                */
/* REVISION: 8.5      LAST MODIFIED: 07/02/96   BY: *G1Z7* Julie Milligan     */
/* REVISION: 8.5      LAST MODIFIED: 08/12/96   BY: *J141* Fred Yeadon        */
/* REVISION: 8.6      LAST MODIFIED: 12/31/96   BY: *H0Q8* Julie Milligan     */
/* REVISION: 8.6      LAST MODIFIED: 12/31/96   BY: *J1DK* Julie Milligan     */
/* REVISION: 8.6      LAST MODIFIED: 08/01/97   BY: *G2P0* Manmohan Pardesi   */
/* REVISION: 8.6      LAST MODIFIED: 08/13/97   BY: *G2LF* Murli Shastri      */
/* REVISION: 8.6      LAST MODIFIED: 09/16/97   BY: *H1F7* Felcy D'Souza      */
/* REVISION: 8.6      LAST MODIFIED: 10/28/97   BY: *G2Q3* Steve Nugent       */
/* REVISION: 8.6      LAST MODIFIED: 04/29/98   BY: *H1L0* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 08/17/98   BY: *H1J5* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 10/13/98   BY: *J323* G.Latha            */
/* REVISION: 8.6E     LAST MODIFIED: 11/23/98   BY: *J356* Thomas Fernandes   */
/* REVISION: 9.0      LAST MODIFIED: 12/17/98   BY: *J36Y* G.Latha            */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 09/04/99   BY: *J3KM* G.Latha            */
/* REVISION: 9.1      LAST MODIFIED: 10/25/99   BY: *N002* Bill Gates         */
/* REVISION: 9.1      LAST MODIFIED: 11/03/99   BY: *N050* Steve Nugent       */
/* REVISION: 9.1      LAST MODIFIED: 11/17/99   BY: *N04H* Vivek Gogte        */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 12/01/00   BY: *L0P5* Sathish Kumar      */
/* REVISION: 9.1      LAST MODIFIED: 09/28/00   BY: *N0VN* Mudit Mehta        */
/* Revision: 1.32     BY: Vandna Rohira           DATE: 04/09/01  ECO: *M14Y* */
/* Revision: 1.33     BY: Rajesh Thomas           DATE: 05/30/01  ECO: *M18V* */
/* Revision: 1.34     BY: Robin McCarthy          DATE: 10/01/01  ECO: *P025* */
/* Revision: 1.35     BY: Saurabh Chaturvedi      DATE: 10/10/01  ECO: *M1MV* */
/* Revision: 1.36     BY: Vandna Rohira           DATE: 12/20/01  ECO: *N173* */
/* Revision: 1.37     BY: Vivek Gogte             DATE: 01/14/02  ECO: *N17J* */
/* Revision: 1.38     BY: Nikita Joshi            DATE: 03/18/02  ECO: *N1DC* */
/* Revision: 1.39     BY: Vivek Gogte             DATE: 08/06/02  ECO: *N1QQ* */
/* Revision: 1.41     BY: Amit Chaturvedi         DATE: 09/30/02  ECO: *N1V0* */
/* Revision: 1.42     BY: Dorota Hohol            DATE: 02/25/03  ECO: *P0N6* */
/* Revision: 1.43     BY: Narathip Weerakitpanich DATE: 04/21/03  ECO: *P0Q9* */
/* Revision: 1.47     BY: Paul Donnelly (SB)      DATE: 06/28/03  ECO: *Q00K* */
/* Revision: 1.49     BY: Salil Pradhan           DATE: 01/14/04  ECO: *P1JR* */
/* Revision: 1.50     BY: Ken Casey               DATE: 02/19/04  ECO: *N2GM* */
/* Revision: 1.51     BY: Ed van de Gevel         DATE: 18/03/05  ECO: *R00F* */
/* Revision: 1.52     BY: Sukhad Kulkarni         DATE: 07/07/05  ECO: *P3S1* */
/* Revision: 1.54     BY: Amit Singh              DATE: 12/22/05  ECO: *P4CM* */
/* Revision: 1.55     BY: Jean Miller             DATE: 01/11/06  ECO: *Q0PD* */
/* Revision: 1.56     BY: Shilpa Kamath           DATE: 04/18/06  ECO: *R03V* */
/* Revision: 1.57     BY: Munira Savai            DATE: 05/08/06  ECO: *P4PN* */
/* Revision: 1.58     BY: Shilpa Kamath           DATE: 06/15/06  ECO: *R05X* */
/* Revision: 1.59     BY: Robin McCarthy          DATE: 06/30/06  ECO: *R04J* */
/* Revision: 1.60     BY: Amit Singh              DATE: 06/23/06  ECO: *P4RH* */
/* Revision: 1.61     BY: Niranjan Ranka          DATE: 07/05/06  ECO: *R073* */
/* Revision: 1.62     BY: Niranjan Ranka          DATE: 08/08/06  ECO: *R07W* */
/* Revision: 1.63     BY: Ambrose Almeida         DATE: 12/11/06  ECO: *P5HY* */
/* Revision: 1.64     BY: Ruma Bibra              DATE: 06/07/07  ECO: *P5YN* */
/* Revision: 1.65     BY: Ambrose Almeida         DATE: 03/06/08  ECO: *P6N7* */
/* Revision: 1.68     BY: Ambrose Almeida         DATE: 04/11/08  ECO: *P6QM* */
/* Revision: 1.69     BY: Nan Zhang               DATE: 04/21/08  ECO: *R0JS* */
/* Revision: 1.70     BY: Ambrose Almeida         DATE: 09/12/08  ECO: *Q1SZ* */
/* Revision: 1.71     BY: Yizhou Mao              DATE: 12/18/08  ECO: *R18K* */
/* Revision: 1.72     BY: Jiang Wan               DATE: 12/20/08  ECO: *R1BY* */
/* Revision: 1.73     BY: Winnie Ouyang           DATE: 03/02/09  ECO: *Q2HR* */
/* Revision: 1.74     BY: Jordan Fei              DATE: 03/02/09  ECO: *R1J1* */
/* $Revision: 1.2 $  BY: Jiang Wan               DATE: 09/10/09  ECO: *R1V9* */
/* CYB   LAST MODIFIED: 20-SEP-2013     BY: gbg *c1440*                       */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/mf/mfdtitle.i "3+ "}
{us/gp/gpuid.i}
 
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}
{us/px/pxmaint.i}
 
/* Include the temp-table definition for tt_abs_shipper */
{us/so/sospdef.i}
 
define buffer next_wr_route      for wr_route.
define buffer reject_to_wr_route for wr_route.
define buffer ptmstr             for pt_mstr.

define temp-table tt_po_lineqty no-undo
   field tt_part    like pt_part
   field tt_site    like pt_site
   field tt_loc     like pt_loc
   field tt_tpoline like pod_line
   field tt_qty     like mrp_qty
   index tt_index_part tt_part
         tt_site
         tt_loc.

define variable comp                 as character   no-undo.
define variable conv_qty_proc        as decimal     no-undo.
define variable conv_qty_move        as decimal     no-undo.
define variable conv_qty_rjct        as decimal     no-undo.
define variable conv_qty_scrap       as decimal     no-undo.
define variable cumwo_lot            as character   no-undo.
define variable date_change          as integer     no-undo.
define variable ophist_recid         as recid       no-undo.
define variable rejected           like mfc_logical no-undo.
define variable schedwo_lot          as character   no-undo.
define variable undo_stat          like mfc_logical no-undo.
define variable yn                 like mfc_logical no-undo.
define variable i                    as integer     no-undo.
define variable j                    as integer     no-undo.
define variable oplist               as character   no-undo.
define variable lotserials_req       as log         no-undo.
define variable bomcode              as character   no-undo.
define variable routecode            as character   no-undo.
define variable following_op_req_qty as decimal     no-undo.
define variable backflush_qty        as decimal     no-undo.
define variable std_run_hrs          as decimal     no-undo.
define variable msg_ct               as integer     no-undo.
define variable input_que_op_to_ck   as integer     no-undo.
define variable input_que_qty_chg    as decimal     no-undo.
define variable l_reject_to_wkctr  like wc_wkctr    no-undo.
define variable l_reject_to_mch    like wc_mch      no-undo.
define variable elapse               as decimal   format ">>>>>>>>.999" no-undo.
define variable trans_type           as character initial "BACKFLSH"    no-undo.
define variable l_next_op          like wr_op                           no-undo.
define variable inv_mov            like sgid_inv_mov                    no-undo.
define variable shipnbr            like abs_id          no-undo.
 
{us/re/retrform.i new}
define new shared variable rsn_codes          as character   extent 10.
define new shared variable quantities       like wr_qty_comp extent 10.
define new shared variable scrap_rsn_codes    as character   extent 10.
define new shared variable scrap_quantities like wr_qty_comp extent 10.
define new shared variable reject_rsn_codes   as character   extent 10.
define new shared variable reject_quantities
   like wr_qty_comp extent 10.
 
define variable   dont_zero_unissuable             as logical
   initial no                                                     no-undo.
define new shared variable wo_recno                as recid.
define new shared variable wr_recno                as recid.
define new shared variable lotserial             like sr_lotser   no-undo.
define            variable inv-issued              as logical     no-undo.
define variable   mfc-recid                        as recid       no-undo.
define variable v_lines_found       like mfc_logical no-undo.
define variable v_abs_recid         as recid         no-undo.
define variable site_from           as character     no-undo.
define variable loc_from            as character     no-undo.
define variable shipping-grp-allows like mfc_logical no-undo.
define variable shipgrp             like sgid_grp    no-undo.
 
define variable   trans-ok                       like mfc_logical no-undo
   initial no.
define variable   move_to_wkctr                  like wc_wkctr    no-undo.
define variable   move_to_mch                    like wc_mch      no-undo.
define variable   consider_output_qty            like mfc_logical no-undo.
define new shared variable h_wiplottrace_procs     as handle      no-undo.
define new shared variable h_wiplottrace_funcs     as handle      no-undo.
define variable   result_status                    as character   no-undo.
define variable l_pt_loc  as  character no-undo.
define variable l_pt_lot_ser as character no-undo.
define variable v_trflow_flg as logical no-undo.
 
/* Global Shipping: Legal Doc */
define variable from_site      like pt_site         no-undo.
define variable from_loc       like pt_loc          no-undo.
define variable to_site        like pt_site         no-undo.
define variable to_loc         like pt_loc          no-undo.
define variable recdoc         as character.
define variable issdoc         as character.
define variable wotdoc         as character.
 
{us/px/pxphdef.i ppitxr}
 
{us/wl/wlfnc.i} /*FUNCTION FORWARD DECLARATIONS*/
{us/wl/wlcon.i} /*CONSTANTS DEFINITIONS*/

empty temp-table tt_po_lineqty.

if is_wiplottrace_enabled()
then do:
   {us/bbi/gprun.i ""wlpl.p"" "persistent set h_wiplottrace_procs"}
   {us/bbi/gprun.i ""wlfl.p"" "persistent set h_wiplottrace_funcs"}
end.
 
/* DO NOT RUN PROGRAM UNLESS QAD_WKFL RECORDS HAVE */
/* BEEN CONVERTED SO THAT QAD_KEY2 HAS NEW FORMAT  */
if can-find(first qad_wkfl
    where qad_wkfl.qad_domain = global_domain and  qad_key1 = "rpm_mstr")
then do:
 
   {us/bbi/pxmsg.i &MSGNUM=5126 &ERRORLEVEL=3}
   message.
   message.
   leave.
end. /* if can-find(first qad_wkfl... */
 
/*DEFINE VARIABLES FOR CHANGE ATTRIBUTES FEATURE*/
{us/gp/gpatrdef.i "new shared"}
 
eff_date = today.
 
for first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock:
end. /* FOR FIRST gl_ctrl */
 
for first clc_ctrl where clc_ctrl.clc_domain = global_domain no-lock:
end. /* FOR FIRST clc_ctrl */
 
if not available clc_ctrl
then do:
   {us/bbi/gprun.i ""gpclccrt.p""}
   for first clc_ctrl where clc_ctrl.clc_domain = global_domain no-lock:
   end. /* FOR FIRST clc_ctrl */
end. /* IF NOT AVAILABLE clc_ctrl */
 
{us/bbi/gprun.i ""redflt.p""}
 
main:
repeat:
 
   /*GET EMP, EFFDATE, SHIFT, SITE, CONTROLTOTAL FROM USER*/
   {us/bbi/gprun.i ""retrin1.p""
      "(output undo_stat)"}
 
   assign
      issdoc = ""
      recdoc = ""
      wotdoc = is-doc.
 
   do transaction:
      find first usrw_wkfl exclusive-lock
         where usrw_wkfl.usrw_domain = global_domain
         and   usrw_key1 = "@@LOCAL-REPISSDOC@@"
         and   usrw_key2 = SessionUniqueID use-index usrw_index1 no-error.
      if available usrw_wkfl
      then
         delete usrw_wkfl.
   end.
 
   if undo_stat then
      undo, leave.
 
   {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}
 
   mainloop:
   repeat:
 
      /* TO RESET LOT/SERIAL AFTER COMPLETING THE TRANSACTION */
      /* WHEN AUTO LOT NUMBERS IS SET TO NO IN ITEM MASTER    */
      /* MAINTENANCE                                          */
      lotserial = "".
 
      /*GET ITEM, OP, LINE FROM USER*/
      {us/bbi/gprun.i ""retrin2.p""
         "(output undo_stat)"}
 
      if undo_stat then
         undo, leave.
 
      /*FIND DEFAULT BOM AND ROUTING CODES*/
      {us/bbi/gprun.i ""reoptr1b.p""
         "(input site,
           input line,
           input part,
           input op,
           input eff_date,
           output routing,
           output bom_code,
           output schedwo_lot)"}
 
      if schedwo_lot = "?"
      then do:
         /* Unexploded schedule with consumption period */
         {us/bbi/pxmsg.i &MSGNUM=325 &ERRORLEVEL=3}
         next-prompt part.
         undo, retry.
      end. /* IF schedwo_lot = "?" */
 
      /*GET BOM, ROUTING FROM USER*/
      {us/bbi/gprun.i ""retrin3.p""
         "(output undo_stat)"}
 
      if undo_stat then
         undo, leave.
 
      /*FIND CUM ORDER. */
      {us/bbi/gprun.i ""regetwo.p""
         "(input site,
           input part,
           input eff_date,
           input line,
           input routing,
           input bom_code,
           output cumwo_lot)"}
 
      /*VALIDATE THE OPERATION */
      {us/re/reopval.i
         &part    = part
         &routing = routing
         &op      = op
         &date    = eff_date
         &prompt  = op
         &frame   = "a"
         &leave   = ""no""
         &loop    = "mainloop"}
 
      /* CREATE IT IF IT DOESN'T EXIST*/
      if cumwo_lot = ?
      then do:
 
         {us/bbi/gprun.i ""recrtwo.p""
            "(input site,
              input part,
              input eff_date,
              input line,
              input routing,
              input bom_code,
              output cumwo_lot)"}
 
         if cumwo_lot = ? then
            next mainloop.
 
         display
            cumwo_lot @ wo_lot
         with frame a.
      end. /* IF cumwo_lot = ? */
 
      else do:
 
         display
            cumwo_lot @ wo_lot
         with frame a.
 
         for first wo_mstr where wo_mstr.wo_domain = global_domain
            and wo_lot = cumwo_lot
         no-lock: end.
 
         if wo_status = "c"
         then do:
            {us/bbi/pxmsg.i &MSGNUM=5101 &ERRORLEVEL=3}
            undo, retry.
         end. /* IF wo_status = "c" */
      end. /* ELSE DO */
 
      for first wr_route where wr_route.wr_domain = global_domain
         and wr_lot = cumwo_lot
         and wr_op    = op
      no-lock: end.
 
      if not available wr_route
      then do:
         /* OPERATION DOES NOT EXIST */
         {us/bbi/pxmsg.i &MSGNUM=106 &ERRORLEVEL=3}
         next-prompt op with frame a.
         undo, retry.
      end. /* IF NOT AVAILABLE wr_route */
 
      if is_wiplottrace_enabled()
      then do:
 
         l_next_op = next_operation(cumwo_lot, op).
 
         for first next_wr_route where  next_wr_route.wr_domain = global_domain
            and     next_wr_route.wr_lot    = cumwo_lot
            and     next_wr_route.wr_op     = l_next_op
         no-lock: end.
 
         if available next_wr_route
         then do:
            if (not next_wr_route.wr_milestone)
            then do:
               {us/bbi/pxmsg.i &MSGNUM=6937 &ERRORLEVEL=2}
            end. /* IF (not next_wr_route.wr_milestone) */
         end. /* IF AVAILABLE next_wr_rotue */
 
      end. /* IF is_wiplottrace_enabled() */
 
 
      if not wr_route.wr_milestone
      then do:
 
         if is_wiplottrace_enabled()
         then do:
 
            if prev_milestone_operation(cumwo_lot, op) <> ?
               or (prev_milestone_operation(cumwo_lot, op) = ?
                   and not wr_route.wr_milestone)
               and is_operation_queue_lot_controlled
               (cumwo_lot,
               prev_milestone_operation(cumwo_lot, op),
               OUTPUT_QUEUE)
            then do:
               /*WIP LOT TRACE IS ENABLED AND OPERATION IS A */
               /*NON-MILESTONE                               */
               {us/bbi/pxmsg.i &MSGNUM=8465 &ERRORLEVEL=3}
               undo, retry.
            end. /* IF pre_milestone_operation(cumwo_lot, .... */
 
         end. /* IF is_wiplottrace_enabled() */
 
         if not wr_route.wr_milestone
            and not is_wiplottrace_enabled()
         then
            /* OPERATION NOT A MILESTONE */
            {us/bbi/pxmsg.i &MSGNUM=560 &ERRORLEVEL=2}
 
      end. /* IF NOT wr_milestone */
 
      display wr_route.wr_desc with frame a.
 
      assign
         wkctr              = ""
         mch                = ""
         dept               = ""
         qty_proc           = 0
         um                 = ""
         conv               = 1
         qty_rjct           = 0
         rjct_rsn_code      = ""
         rejque_multi_entry = no
         to_op              = op
         qty_scrap          = 0
         scrap_rsn_code     = ""
         outque_multi_entry = no
         mod_issrc          = no
         start_run          = ""
         act_run_hrs        = 0
         stop_run           = ""
         earn_code          = ""
         rsn_codes          = ""
         quantities         = 0
         scrap_rsn_codes    = ""
         scrap_quantities   = 0
         reject_rsn_codes   = ""
         reject_quantities  = 0
         .
 
      {us/bbi/gprun.i ""resetmno.p""
         "(input cumwo_lot,
           input op,
           output move_next_op)"}
 
      assign
         wkctr = wr_route.wr_wkctr
         mch   = wr_route.wr_mch.
 
      for first wc_mstr where wc_mstr.wc_domain = global_domain
         and wc_wkctr = wkctr
           and wc_mch   = mch
      no-lock: end.
 
      dept = wc_dept.
      for first dpt_mstr where dpt_mstr.dpt_domain = global_domain
         and dpt_dept = wc_dept
      no-lock: end.
 
      for first wo_mstr where wo_mstr.wo_domain = global_domain
         and wo_lot = cumwo_lot
      no-lock: end.
 
      for first pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = wo_part
      no-lock: end.
 
      um = pt_um.
 
      for first ea_mstr where ea_mstr.ea_domain = global_domain
         and ea_type = "1"
      no-lock: end.
 
      if available ea_mstr then
         earn_code = ea_earn.
 
      display
         wkctr
         mch
         wc_desc
         dept
         dpt_desc          when (available dpt_mstr)
         ""                when (not available dpt_mstr) @ dpt_desc
         qty_proc
         um
         conv
         qty_rjct
         rjct_rsn_code
         rejque_multi_entry
         to_op
         qty_scrap
         scrap_rsn_code
         outque_multi_entry
         mod_issrc
         move_next_op
         start_run
         act_run_hrs
         stop_run
         earn_code
         ea_desc           when (available ea_mstr)
         ""                when (not available ea_mstr) @ ea_desc
      with frame bkfl1.
 
      if is_wiplottrace_enabled()
      then do:
         run init_bkfl_input_wip_lot_temptable in h_wiplottrace_procs.
         run init_bkfl_output_wip_lot_temptable in h_wiplottrace_procs.
         run init_bkfl_scrap_wip_lot_temptable in h_wiplottrace_procs.
         run init_bkfl_reject_wip_lot_temptable in h_wiplottrace_procs.
      end. /* if is_wiplottrace_enabled() */
 
      /* LOOPC ADDED TO BRING THE CURSOR CONTROL TO SECOND         */
      /* FRAME DURING UNDO,RETRY                                   */
      loopc:
      do with frame bkfl1 on error undo, retry:
 
         for first wr_route where wr_route.wr_domain = global_domain
            and    wr_route.wr_lot = cumwo_lot
            and    wr_route.wr_op  = op
         no-lock: end.
 
         for each sr_wkfl where sr_wkfl.sr_domain = global_domain
            and sr_userid = SessionUniqueID
         exclusive-lock:
            delete sr_wkfl.
         end. /* FOR EACH sr_wkfl */
 
         for each pk_det where pk_det.pk_domain = global_domain
            and pk_user = SessionUniqueID
         exclusive-lock:
            delete pk_det.
         end. /* FOR EACH pk_det */
 
         /*DELETE LOTW_WKFL*/
         {us/bbi/gprun.i ""gplotwdl.p""}
 
         {us/bbi/gprun.i ""rebkfli1.p""
            "(input cumwo_lot,
              input op,
              output undo_stat)"}
 
         if undo_stat then
            undo main, retry main.
 
         assign
            conv_qty_proc  = qty_proc * conv
            conv_qty_rjct  = qty_rjct * conv
            conv_qty_scrap = qty_scrap * conv
            conv_qty_move  = if move_next_op
                             then
                                 conv_qty_proc - conv_qty_rjct - conv_qty_scrap
                             else 0.
 
         /* IF QUANTITY PROCESSED AT THIS OPERATION IS NEGATIVE AND    */
         /* THE CUMULATIVE MOVE QUANTITY IS ZERO THEN IT IS NOT A VALID*/
         /* BACKFLUSH TRANSACTION. THE USER IS TRYING TO DO A NEGATIVE */
         /* RECEIPT BEFORE DOING ANY POSITIVE RECEIPT AT THIS OPERATION*/
         /* AND THAT IS NOT ALLOWED.                                   */
 
         /* UNCONDITIONALLY ALLOW REPORTING NEGATIVE QUANTITIES        */
 
         /*CHECK QUEUES IF WOULD GO NEGATIVE; IF SO ISSUE MESSAGES     */
 
         msg_ct = 0.
 
         /*DETERMINE INPUT QUE OP TO CHECK;
         COULD BE PRIOR NONMILESTONES*/
         {us/bbi/gprun.i ""reiqchg.p""
            "(input cumwo_lot,
              input op,
              input conv_qty_proc,
              output input_que_op_to_ck,
              output input_que_qty_chg)"}
 
         /*CHECK INPUT QUEUE*/
         {us/bbi/gprun.i ""rechkq.p""
            "(input cumwo_lot,
              input input_que_op_to_ck,
              input ""i"",
              input input_que_qty_chg,
              input-output msg_ct)"}
 
         /*CHECK OUTPUT QUEUE*/
         {us/bbi/gprun.i ""rechkq.p""
            "(input cumwo_lot,
              input op,
              input ""o"",
              input (conv_qty_proc - conv_qty_scrap
                    - conv_qty_rjct - conv_qty_move),
              input-output msg_ct)"}
 
         /*CHECK REJECT QUEUE*/
         {us/bbi/gprun.i ""rechkq.p""
            "(input cumwo_lot,
              input to_op,
              input ""r"",
              input conv_qty_rjct,
              input-output msg_ct)"}
 
         /*CHECK INPUT QUEUE NEXT OP IF MOVE*/
         if move_next_op
         then do:
 
            for first wr_route where wr_route.wr_domain = global_domain
               and    wr_route.wr_lot    = cumwo_lot
               and    wr_route.wr_op     > op
            no-lock:
               {us/bbi/gprun.i ""rechkq.p""
                  "(input cumwo_lot,
                    input wr_route.wr_op,
                    input ""i"",
                    input conv_qty_move,
                    input-output msg_ct)"}
            end.
 
         end. /* IF move_next_op */
 
         /*FORCE A PAUSE IF NECESSARY*/
         {us/bbi/gprun.i ""repause.p"" "(input msg_ct)"}
 
         /*BUILD DEFAULT COMPONENT PART ISSUE LIST*/
         {us/bbi/gprun.i ""recrtcl.p""
            "(input cumwo_lot,
              input op,
              input yes,
              input conv_qty_proc,
              input eff_date,
              input dont_zero_unissuable,
              input wkctr,
              input """",
              output rejected,
              output lotserials_req,
              input-output table tt_po_lineqty)"
         }
 
         if rejected then
            mod_issrc = yes.
 
         /*MODIFY COMPONENT PART ISSUE LIST*/
         if mod_issrc
         then do:
 
            hide frame bkfl1 no-pause.
            hide frame a no-pause.
 
            display
               site
               part
               op
               line
            with frame b side-labels width 80.
 
            {us/bbi/gprun.i ""reisslst.p""
               "(input cumwo_lot,
                 input part,
                 input site,
                 input eff_date,
                 input wkctr,
                 input conv_qty_proc,
                 output undo_stat)"}
 
            hide frame b no-pause.
 
            if undo_stat
            then do:
 
               view frame a.
               view frame bkfl1.
 
               /* RESTRICT PROCESS FOR BATCHRUN  */
               if batchrun
               then
                  undo main, leave main.
               else
                  undo, retry.
            end. /* IF undo_stat */
         end. /* IF mod_issrc */
 
         if is_wiplottrace_enabled() and
            is_operation_queue_lot_controlled(cumwo_lot, op, OUTPUT_QUEUE)
         then do:
 
            view frame a.
            view frame bkfl1.
 
            if is_operation_queue_lot_controlled(cumwo_lot, op, INPUT_QUEUE)
            then do:
 
               /* Identify context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = 'wlpl,wlui,wluibi,wlpl,rebkfl'
                  &FRAME = 'yn' &CONTEXT = 'INPUT'}
 
               if {us/gp/gpisapi.i}
               then
                  pause 0.
 
               run get_bkfl_input_wip_lots_from_user
                  in h_wiplottrace_procs
                  (input cumwo_lot,
                   input op,
                   input qty_proc,
                   input conv,
                   input um,
                   input site,
                   input wkctr,
                   input mch,
                   output undo_stat).
 
               /* Clear context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = 'wlpl,wlui,wluibi,wlpl,rebkfl'
                  &FRAME = 'yn'}
 
               if undo_stat then
                  undo, retry.
            end. /* IF is_operation_queue_lot_controlled ... */
 
            assign
               move_to_wkctr = wkctr
               move_to_mch   = mch.
 
            if not is_last_operation(cumwo_lot, op)
               and move_next_op
            then do:
 
               if {us/gp/gpisapi.i}
               then
                  pause 0.
 
               run get_destination_wkctr_mch_from_user in h_wiplottrace_procs
                  (input cumwo_lot,
                   input next_milestone_operation(cumwo_lot, op),
                   output move_to_wkctr,
                   output move_to_mch,
                   output undo_stat).
 
               if undo_stat then
                  undo, retry.
 
            end. /* IF NOT is_last_operation */
 
            if not (is_last_operation(cumwo_lot, op)
               and move_next_op)
            then do:
 
               /* Identify context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = 'wlpl,wlui,wluibo,wlpl,rebkfl'
                  &FRAME = 'yn' &CONTEXT = 'RECEIPT'}
 
               if {us/gp/gpisapi.i}
               then
                  pause 0.
 
               run get_bkfl_output_wip_lots_from_user in h_wiplottrace_procs
                  (input cumwo_lot,
                   input op,
                   input qty_proc,
                   input conv,
                   input um,
                   input move_next_op,
                   input site,
                   input wkctr,
                   input mch,
                   output undo_stat).
 
               /* Clear context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = 'wlpl,wlui,wluibo,wlpl,rebkfl'
                  &FRAME = 'yn'}
 
               if undo_stat
               then
                  undo, retry.
            end. /* IF NOT (islast_operation .. */
 
            if qty_rjct <> 0
            then do:
 
               if not is_operation_queue_lot_controlled(cumwo_lot,
                  to_op,
                  REJECT_QUEUE)
               then do:
 
                  {us/bbi/pxmsg.i &MSGNUM=8426 &ERRORLEVEL=3}
                  /*TO OPERATION MUST BE LOT CONTROLLED*/
                  undo, retry.
               end. /* IF NOT is_operation_queue_lot_controlled ... */
 
               do for reject_to_wr_route:
                  for first reject_to_wr_route
                      where reject_to_wr_route.wr_domain = global_domain
                        and wr_lot = cumwo_lot
                        and wr_op  = to_op
                  no-lock: end.
 
                  assign
                     l_reject_to_wkctr = wr_wkctr
                     l_reject_to_mch   = wr_mch.
               end. /* DO FOR reject_to_wr_route */
 
               /* Identify context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = 'wlpl,wlui,wluibr,wlpl,rebkfl'
                  &FRAME = 'yn' &CONTEXT = 'REJECT'}
 
               if {us/gp/gpisapi.i}
               then
                  pause 0.
 
               run get_bkfl_reject_wip_lots_from_user in h_wiplottrace_procs
                  (input cumwo_lot,
                   input op,
                   input qty_rjct,
                   input conv,
                   input um,
                   input to_op,
                   input site,
                   input l_reject_to_wkctr,
                   input l_reject_to_mch,
                   output undo_stat).
 
               /* Clear context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = 'wlpl,wlui,wluibr,wlpl,rebkfl'
                  &FRAME = 'yn'}
 
               if undo_stat
               then
                  undo, retry.
            end. /* IF qty_rjct <> 0 */
 
            if qty_scrap <> 0
            then do:
 
               /* Identify context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = 'wlpl,wlui,wluibs,wlpl,rebkfl'
                  &FRAME = 'yn' &CONTEXT = 'SCRAP'}
 
               if {us/gp/gpisapi.i}
               then
                  pause 0.
               run get_bkfl_scrap_wip_lots_from_user in h_wiplottrace_procs
                  (input cumwo_lot,
                   input op,
                   input qty_scrap,
                   input conv,
                   input um,
                   input site,
                   input wkctr,
                   input mch,
                   output undo_stat).
 
               /* Clear context for QXtend */
               {us/gp/gpcontxt.i
                  &STACKFRAG = 'wlpl,wlui,wluibs,wlpl,rebkfl'
                  &FRAME = 'yn'}
 
               if undo_stat
               then
                  undo, retry.
            end. /* IF qty_scrap <> 0 */
 
            if {us/gp/gpisapi.i}
               then
                  pause 0.
 
            run bkfl_check_output_scrap_reject in h_wiplottrace_procs
               (input cumwo_lot,
                input op,
                input move_next_op,
                input conv,
                input site,
                input wkctr,
                input mch,
                input move_to_wkctr,
                input move_to_mch,
                output undo_stat).
 
            if undo_stat
            then
               undo, retry.
 
            if move_next_op
               and is_last_operation(cumwo_lot, op)
            then do:
 
               assign
                  mod_issrc = true
                  lotserial = ''.
 
               run bkfl_create_receive_sr_wkfl in h_wiplottrace_procs
                  (cumwo_lot, conv_qty_move).
            end. /* IF move_next_op */
         end.  /* IF is_wiplottrace_enabled() .. */
 
         /*FORCE MODIFY FINISHED PART RECEIVE LIST IF ANY COMPONENTS
         L/S CONTROLLED, OR IF FOR SOME REASON THEY ARE NOT ISSUABLE*/
         if move_next_op
            and conv_qty_move <> 0
         then do:
 
            for first wr_route where wr_route.wr_domain = global_domain
               and wr_route.wr_lot    = cumwo_lot
               and wr_route.wr_op     > op
            no-lock: end.
 
            if not available wr_route
            then do:
 
               for first wo_mstr where wo_mstr.wo_domain = global_domain
                  and wo_lot = cumwo_lot
               no-lock: end.
 
               for first pt_mstr where pt_mstr.pt_domain = global_domain
                  and pt_part = wo_part
               no-lock: end.
 
               rejected = no.
 
               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &HANDLE=ph_ppitxr
                        &PARAM = "( input  wo_part,
                                    input  pt_site,
                                    input ""pt_lot_ser"",
                                    output l_pt_lot_ser)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
 
               if index("LS",l_pt_lot_ser) = 0
               then do:
                  {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                           &HANDLE=ph_ppitxr
                           &PARAM =  "(input  wo_part,
                                       input  pt_site,
                                       input ""pt_loc"",
                                       output l_pt_loc)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
 
                  /*ADDED BLANKS FOR TRNBR AND TRLINE*/
                  {us/bbi/gprun.i ""icedit2.p""
                     "(input ""RCT-WO"",
                       input if wo_site > """" then wo_site
                             else pt_site,
                       input if wo_loc > """" then wo_loc
                             else l_pt_loc,
                       input wo_part,
                       input """",
                       input """",
                       input conv_qty_move,
                       input pt_um,
                       input """",
                       input """",
                       output rejected)"}
               end. /* IF INDEX("LS,l_pt_lot_ser) = 0 */
 
               if index("LS",l_pt_lot_ser) > 0
                  or mod_issrc
                  or rejected
               then do:
 
                  hide frame bkfl1 no-pause.
                  hide frame a no-pause.
 
                  display
                     site
                     part
                     op
                     line
                  with frame b side-labels width 80.
 
                  issdoc = is-doc.
 
                  /* Identify context for QXtend */
                  {us/gp/gpcontxt.i
                     &STACKFRAG = 'rercvlst,rebkfl'
                     &FRAME = 'yn'
                     &CONTEXT = 'RECEIPTDATA'}
 
                  /*MODIFY FINISHED PART RECEIVE LIST*/
                  {us/bbi/gprun.i ""rercvlst.p""
                     "(input cumwo_lot,
                       input conv_qty_move,
                       output undo_stat)"}
 
                  /* Clear context for QXtend */
                  {us/gp/gpcontxt.i
                     &STACKFRAG = 'rercvlst,rebkfl'
                     &FRAME = 'yn'}
 
                  recdoc = is-doc.
                  is-doc = issdoc.
                  hide frame b no-pause.
 
                  if undo_stat
                  then do:
 
                     view frame a.
                     view frame bkfl1.
                     if batchrun
                     then
                        undo main, leave main.
                     else
                        undo, retry.
                  end. /* IF undo_stat */
               end. /* IF INDEX("LS,l_pt_lot_ser) <> 0 ... */
 
               else do:
                  do transaction:
 
                     create sr_wkfl.
                     assign
                        sr_wkfl.sr_domain = global_domain
                        sr_userid = SessionUniqueID
                        sr_lineid = "+" + wo_part
                        sr_site   = wo_site
                        sr_loc    = wo_loc
                        sr_qty    = conv_qty_move.
 
                        {us/px/pxrun.i &PROC  = 'getFieldDefault'
                                 &PROGRAM = 'ppitxr.p'
                                 &HANDLE=ph_ppitxr
                                 &PARAM =  "(input  wo_part,
                                             input  sr_site,
                                             input ""pt_loc"",
                                             output sr_loc)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true}
 
                     /* MOVED RESTRICTED TRANSACTION VALIDATION FROM */
                     /* icedit FILES TO worcat01.p FOR "RCT-WO"      */
                     /* TRANSACTIONS.WHEN LOT/SERIAL  = "" IN ITEM   */
                     /* MASTER MAINTENANCE,ITEM WILL NOW BE RECEIVED */
                     /* WITH THE RESPECTIVE VALID STATUS             */
                     /* CHANGE ATTRIBUTES.INITIALIZE ATTRIBUTE */
                     /* VARIABLES WITH CURRENT SETTINGS        */
                     assign
                        chg_assay   = wo_assay
                        chg_grade   = wo_grade
                        chg_expire  = wo_expire
                        chg_status  = wo_rctstat
                        assay_actv  = yes
                        grade_actv  = yes
                        expire_actv = yes
                        status_actv = yes.
 
                     if wo_rctstat_active = no
                     then do:
 
                        for first si_mstr where si_domain = global_domain
                                          and   si_site   = wo_site
                        no-lock: end.
                        if available pt_mstr and available si_mstr then do:
                           {us/px/pxrun.i &PROC  = 'readInventoryDetail'
                                    &PROGRAM = 'ppitxr.p'
                                    &HANDLE=ph_ppitxr
                                    &PARAM = "(input  pt_mstr.oid_pt_mstr,
                                               input  si_mstr.oid_si_mstr,
                                               buffer pti_det)"
                                    &NOAPPERROR = true
                                    &CATCHERROR = true}
                        end.
 
                        if available pti_det and pti_rctwo_active = yes
                        then
                           chg_status = pti_rctwo_status.
                        else
                        if available pt_mstr
                           and pt_rctwo_active
                        then
                           chg_status = pt_rctwo_status.
                        else
                           assign
                              chg_status  = ""
                              status_actv = no.
                     end. /* IF wo_rctstat_active = NO */
 
                     /* TO CHECK WHETHER "RCT-WO" IS RESTRICTED */
                     /* FOR RECEIVING INVENTORY STATUS.ALSO TO  */
                     /* CHECK FOR STATUS CONFLICT MESSAGE       */
                     {us/bbi/gprun.i ""worcat01.p""
                        "(input recid(wo_mstr),
                          input sr_site,
                          input sr_loc,
                          input sr_ref,
                          input sr_lotser,
                          input eff_date,
                          input sr_qty,
                          input-output chg_assay,
                          input-output chg_grade,
                          input-output chg_expire,
                          input-output chg_status,
                          input-output assay_actv,
                          input-output grade_actv,
                          input-output expire_actv,
                          input-output status_actv,
                          output trans-ok)"}
 
                     if not trans-ok
                     then do:
                        view frame a.
                        view frame bkfl1.
                       if batchrun
                       then
                          undo main, leave main.
                       else
                       do:
                          next-prompt qty_proc.
                          undo loopc,retry loopc.
                       end. /* ELSE DO:*/
                     end. /* IF NOT trans-ok */
 
                  end. /* DO TRANSACTION */
               end. /* ELSE DO */
            end. /* IF NOT AVAILABLE wr_route */
         end. /* IF move_next_op AND ... */
 
         if is_wiplottrace_enabled() and
            is_operation_queue_lot_controlled(cumwo_lot, op, OUTPUT_QUEUE)
         then do:
 
            if is_last_operation(cumwo_lot, op)
               and move_next_op
            then do:
 
               /*IN THIS CASE WE DIDN'T GET OUTPUT WIP LOTS        */
               /*FROM THE USER; WE USE THE LOTSER'S ENTERED        */
               /*IN SR_WKFL FOR THE FINISHED MATERIAL INSTEAD.     */
               /*THE BACKFLUSH SUBROUTINE REBKFLA.P WILL BACKFLUSH */
               /*THIS LIST INTO WIP, THEN RECEIVE.P WILL MOVE      */
               /*IN TO FINISHED GOODS INVENTORY.                   */
 
               run init_bkfl_output_wip_lot_temptable
                  in h_wiplottrace_procs.
 
               for each sr_wkfl no-lock
                      where sr_wkfl.sr_domain = global_domain and  sr_userid =
                      SessionUniqueID and sr_lineid = "+" + part
                     break by sr_lotser by sr_ref:
                  accumulate sr_qty (sub-total by sr_ref).
 
                  if last-of(sr_ref)
                  then
                     run create_bkfl_output_wip_lot_temptable
                        in h_wiplottrace_procs
                        (input sr_lotser,
                        input sr_ref,
                        (accum sub-total by sr_ref sr_qty) / conv).
               end. /* FOR EACH sr_wkfl */
            end. /* IF is_last_operation */
 
            /*CHECK FOR COMBINED LOTS - INPUT WIP AND COMPONENTS */
            /*TO A PARTICULAR OUTPUT WIP LOT                     */
 
            run bkfl_check_for_combined_lots in h_wiplottrace_procs
               (input cumwo_lot,
                input op,
                input conv,
                output result_status).
 
            if result_status = FAILED_EDIT
            then do:
 
               view frame a.
               view frame bkfl1.
 
               if batchrun
               then
                  undo main, leave main.
               else
                  undo, retry.
            end. /* IF result_status = FAILED_EDIT */
 
            /*CHECK FOR SPLIT LOTS - OUTPUT WIP AND COMPONENTS */
            /*TO A PARTICULAR INPUT WIP LOT                    */
 
            consider_output_qty = yes.
 
            run bkfl_check_for_split_lots in h_wiplottrace_procs
               (input cumwo_lot,
               input op,
               input conv,
               input consider_output_qty,
               output result_status).
 
            if result_status = FAILED_EDIT
            then do:
 
               view frame a.
               view frame bkfl1.
 
               if batchrun
               then
                  undo main, leave main.
               else
                  undo, retry.
            end. /* IF result_status = FAILED_EDIT */
 
         end. /* IF is_wiplottrace_enabled() AND ... */
 
         for first wo_mstr where wo_mstr.wo_domain = global_domain
            and wo_lot = cumwo_lot
         no-lock: end.
 
         wo_recno = recid(wo_mstr).
 
         for first wr_route where wr_route.wr_domain = global_domain
            and wr_route.wr_lot    = cumwo_lot
            and wr_route.wr_op     = op
         no-lock: end.
 
         wr_recno = recid(wr_route).
 
         /* PATCH N1V0 HAS ENABLED CIM LOAD */
         {us/mp/mpwindow.i
            wo_part
            op
            "if wo_routing = """" then wr_route.wr_part else wo_routing"
            eff_date}
 
         view frame a.
         view frame bkfl1.
 
         yn = yes.
         {us/bbi/pxmsg.i &MSGNUM=32 &ERRORLEVEL=1 &CONFIRM=yn}
 
         if batchrun
         then do:
            if yn <> yes
            then
               undo, leave.
         end. /* IF batchrun */
         else
            if yn <> yes
            then
               undo, retry.
 
         /* TO CHECK THE CUMULATIVE ORDER IS NOT CLOSED */
         /* DURING USER INTERFACE                       */
         if can-find(wo_mstr where wo_mstr.wo_domain = global_domain
                     and wo_lot    = cumwo_lot
                     and wo_status  = "C")
         then do:
            /* CUM ORDER IS CLOSED */
            {us/bbi/pxmsg.i &MSGNUM=5101 &ERRORLEVEL=3}
            undo main, retry main.
         end. /*  IF CAN-FIND(wo_mstr ... */
 
         /* TO CHECK THE CUMULATIVE ORDER IS NOT EXPIRED */
         /* DURING USER INTERFACE                        */
         if not can-find(wo_mstr where wo_mstr.wo_domain = global_domain
                         and wo_lot   = cumwo_lot
                         and (eff_date >= wo_rel_date or wo_rel_date = ?)
                         and (eff_date <= wo_due_date or wo_due_date = ?))
         then do:
            /* CUM ORDER HAS EXPIRED */
            {us/bbi/pxmsg.i &MSGNUM=5124 &ERRORLEVEL=3}
            undo main, retry main.
         end. /* IF NOT CAN-FIND(wo_mstr) */
 
         if yn = yes then do:
 
            hide frame a     no-pause.
            hide frame bkfl1 no-pause.
            view frame b.
 
            assign site_from = "".
 
            find first sr_wkfl where sr_wkfl.sr_domain = global_domain
               and sr_userid = SessionUniqueID
               and sr_lineid begins "-"
            no-lock no-error.
 
            if available sr_wkfl then do:
 
               assign
                  site_from = sr_wkfl.sr_site.
                  loc_from  = sr_wkfl.sr_loc.
 
               {us/ic/icshmtdf.i "new"}
               {us/bbi/gprun.i ""icshmt1c.p""}
 
               assign v_lines_found = no.
 
               for each sr_wkfl where sr_wkfl.sr_domain = global_domain
                  and   sr_userid = SessionUniqueID
                  and sr_lineid begins "-"
               no-lock:
 
                  find pt_mstr where pt_mstr.pt_domain = global_domain
                     and   pt_part = trim(substring(sr_lineid,2,18))
                  no-lock no-error.
 
                  assign
                     from_site = site_from
                     from_loc  = loc_from
                     to_site   = site
                     to_loc    = wkctr.
 
                  if from_site = to_site and from_loc <> to_loc then do:
 
                     assign
                        from_site = ""
                        to_site   = "".
 
                     for first loc_mstr where loc_domain = global_domain
                        and loc_site = site_from
                        and loc_loc  = loc_from
                     no-lock:
                        from_site = loc_phys_addr.
                     end.
 
                     for first loc_mstr where loc_domain = global_domain
                        and loc_site = site
                        and loc_loc  = wkctr
                     no-lock:
                        to_site   = loc_phys_addr.
                    end.
 
                  end.
 
                  {us/bbi/gprun.i ""icshmt1a.p""
                     "("""",
                       """",
                       substring(sr_lineid,2,18),
                       sr_lotser,
                       sr_ref,
                       sr_site,
                       sr_loc,
                       sr_qty,
                       if available pt_mstr then pt_um else """",
                       1,
                       if available pt_mstr then pt_net_wt * sr_qty else 0,
                       if available pt_mstr then pt_net_wt_um else """",
                       if available pt_mstr then pt_size * sr_qty else 0,
                       if available pt_mstr then pt_size_um else """" )" }
 
                  assign v_lines_found = yes.
               end. /*for loop*/
 
               if v_lines_found then do:
 
                  {us/bbi/gprun.i ""icshmt.p""
                     "(from_site,
                       to_site,
                       ""ISS-WO"",
                       eff_date,
                       ""no"",
                       output v_abs_recid,
                       output v_trflow_flg)" }
 
                  find first abs_mstr where recid(abs_mstr) = v_abs_recid
                  no-lock no-error.
 
                  do transaction:
 
                     if available abs_mstr then do:
                        /* If the transaction flow is not internal,
                           then print legal document*/
                        if v_trflow_flg = yes then do:
                           /* Global Shipping: assign Legal Doc nbr */
                           {us/bbi/gprun.i ""gpldnbr.p"" "(recid(abs_mstr))"}
 
                           /* Save site(from/to) and location(from/to) values to lgd_mstr */
                           {us/gp/gprunp.i "soldxr" "p" "saveLegalSiteLoc"
                                     "(input abs_id,
                                       input site_from,
                                       input loc_from,
                                       input site,
                                       input wkctr)"}
 
                           {us/bbi/gprun.i ""icldprt.p"" "(recid(abs_mstr))"}
                        end.
                     end.
 
                     find qad_wkfl where qad_domain = global_domain
                        and   qad_key1 = "ABS_ID"
                        and   qad_key2 = SessionUniqueID
                     exclusive-lock no-error.
 
                     if not available qad_wkfl then do:
                        create qad_wkfl.
                        assign
                           qad_domain = global_domain
                           qad_key1 = "ABS_ID"
                           qad_key2 = SessionUniqueID.
                        if recid(qad_wkfl) = -1 then.
                     end.
 
                     assign
                        qad_intfld[1] = integer(v_abs_recid).
                  end.
 
               end.
 
            end.
 
            hide frame b no-pause.
            view frame a.
 
         end.
 
         /* NOW THAT WE HAVE LAST INPUT FROM USER, RECHECK INVENTORY*/
         {us/bbi/gprun.i ""reoptr1f.p""
            "(input """",
              output inv-issued)"}
 
         if inv-issued
         then
            undo, retry.
      end. /* DO WITH FRAME bkfl1 */
 
      /*************************************/
      /*  GOT ALL DATA AND VALIDATED IT,   */
      /*  NOW WE CAN DO SOMETHING WITH IT  */
      /*************************************/
 
      do transaction:
         /*NO TRANSACTION SHOULD BE PENDING HERE*/
         {us/bbi/gprun.i ""gpistran.p""
            "(input 1,
              input """")"}
 
         /*CREATE OP_HIST RECORD*/
         {us/bbi/gprun.i ""reophist.p""
            "(input trans_type,
              input cumwo_lot,
              input op,
              input emp,
              input wkctr,
              input mch,
              input dept,
              input shift,
              input eff_date,
              output ophist_recid)"}
 
         /* ASSIGN DOCUMENT TO OP_DOC_ID */
         {us/bbi/gprun.i ""gpopdoc.p""
            "(input wotdoc,
              input ophist_recid)"}
 
         if issdoc <> "" then
            is-doc = issdoc.
 
         find first usrw_wkfl exclusive-lock
            where usrw_wkfl.usrw_domain = global_domain
            and   usrw_key1 = "@@LOCAL-REPISSDOC@@"
            and   usrw_key2 = SessionUniqueID use-index usrw_index1 no-error.
         if available usrw_wkfl then delete usrw_wkfl.
 
         /* CREATE USRW_WKFL TO KEEP DOCUMENT */
         find first usrw_wkfl exclusive-lock
            where usrw_wkfl.usrw_domain = global_domain
            and   usrw_key1 = "@@LOCAL-REPISSDOC@@"
            and   usrw_key2 = SessionUniqueID use-index usrw_index1 no-error.
         if not available usrw_wkfl then do:
            create usrw_wkfl.
            assign
               usrw_wkfl.usrw_domain = global_domain
               usrw_key1 = "@@LOCAL-REPISSDOC@@"
               usrw_key2 = SessionUniqueID
               usrw_charfld[1] = is-doc.
               if recid(usrw_wkfl) = -1 then .
         end.
 
         /*ISSUE COMPONENTS*/
         {us/bbi/gprun.i ""rebkflis.p""
            "(input cumwo_lot,
              input eff_date,
              input ophist_recid)"}
 
         is-doc = wotdoc.
 
         find first usrw_wkfl exclusive-lock
            where usrw_wkfl.usrw_domain = global_domain
            and   usrw_key1 = "@@LOCAL-REPISSDOC@@"
            and   usrw_key2 = SessionUniqueID use-index usrw_index1 no-error.
         if available usrw_wkfl then delete usrw_wkfl.
 
         /* CREATE USRW_WKFL TO KEEP DOCUMENT */
         find first usrw_wkfl exclusive-lock
            where usrw_wkfl.usrw_domain = global_domain
            and   usrw_key1 = "@@LOCAL-REPISSDOC@@"
            and   usrw_key2 = SessionUniqueID use-index usrw_index1 no-error.
         if not available usrw_wkfl then do:
            create usrw_wkfl.
            assign
               usrw_wkfl.usrw_domain = global_domain
               usrw_key1 = "@@LOCAL-REPISSDOC@@"
               usrw_key2 = SessionUniqueID
               usrw_charfld[1] = is-doc.
               if recid(usrw_wkfl) = -1 then .
         end.
 
         /*REGISTER QTY PROCESSED FOR NONMILESTONES*/
         {us/bbi/gprun.i ""rebkflnm.p""
            "(input cumwo_lot,
              input op,
              input eff_date,
              input shift,
              input trans_type,
              input conv_qty_proc)"}
 
         /* REUPOPST.P IS INCLUDED TO FIND THE ALTERNATE WORK CENTER    */
         /* RUN RATE WHEN THE WORK CENTER OR MACHINE DEFINED DURING     */
         /* BACKFLUSH IS DIFFERENT FROM THE ONE DEFINED IN WORK ORDER   */
         /* ROUTING AND TO POPULATE OP_STD_RUN WITH THE CORRECT VALUE.  */
         /* IF THE RATE SET UP IN WORK CENTER/ROUTING(wcr_rate) IS ZERO,*/
         /* THE STANDARD RUN TIME IN THE OPERATION HISTORY(op_std_run)IS*/
         /* NOT CHANGED EVEN IF ALTERNATE WORK CENTER OR MACHINE IS USED*/
         /* FOR REPORTING.                                              */
 
         if (input wkctr <> wr_route.wr_wkctr
            or input mch <> wr_route.wr_mch) then
         do:
            {us/bbi/gprun.i ""reupopst.p"" "(input ophist_recid)"}
         end. /*END OF IF INPUT(INPUT WKCTR */
 
         /*LABOR AND BURDEN TRANSACTIONS*/
         std_run_hrs = 0.
 
         for first wr_route where wr_route.wr_domain = global_domain
            and wr_route.wr_lot    = cumwo_lot
            and wr_route.wr_op     = op
         no-lock: end.
 
         if wr_route.wr_auto_lbr then
            std_run_hrs = conv_qty_proc * wr_route.wr_run.
 
         {us/bbi/gprun.i ""relbra.p""
            "(input cumwo_lot,
              input op,
              input wkctr,
              input mch,
              input dept,
              input (act_run_hrs + std_run_hrs),
              input eff_date,
              input earn_code,
              input emp,
              input true,
              input ophist_recid)"}
 
         /*REGISTER QTY PROCESSED (REDUCE INQUE, INCREASE OUTQUE)*/
         {us/bbi/gprun.i ""rebkfla.p""
            "(input cumwo_lot,
              input op,
              input ophist_recid,
              input conv_qty_proc)"}
 
         /*BACKFLUSH LIST OF INPUT WIP LOTS AND OUTPUT WIP LOTS. */
         /*NOTE THAT THIS HAS TO BE DONE IN THE SAME TRANSACTION */
         /*AS REBKFLA.P.                                         */
 
         if is_wiplottrace_enabled() and
            is_operation_queue_lot_controlled(cumwo_lot, op, OUTPUT_QUEUE)
         then do:
 
            for first op_hist where recid(op_hist) = ophist_recid
            no-lock: end.
 
            run bkfl_backflush_wip_lots in h_wiplottrace_procs
               (input op_trnbr,
                input wr_route.wr_lot,
                input wr_route.wr_op,
                input conv,
                input site,
                input wkctr,
                input mch).
         end. /* IF is_wiplottrace_enabled() AND .. */
 
         /*MOVE TO NEXT OP IF WE NEED TO*/
         if move_next_op
         then do:
 
            for first wr_route where wr_route.wr_domain = global_domain
               and wr_route.wr_lot    = cumwo_lot
               and wr_route.wr_op     > op
            no-lock: end.
 
            if available wr_route
            then do:
 
               {us/bbi/gprun.i ""removea.p""
                  "(input cumwo_lot,
                    input op,
                    input eff_date,
                    input ophist_recid,
                    input conv_qty_move)"}
 
               /*MOVE LIST OF INPUT WIP LOTS AND OUTPUT WIP LOTS*/
 
               if is_wiplottrace_enabled() and
                  is_operation_queue_lot_controlled(cumwo_lot, op, OUTPUT_QUEUE)
               then
                  run bkfl_move_wip_lots in h_wiplottrace_procs
                     (input op_wo_lot,
                      input op_wo_op,
                      input conv,
                      input site,
                      input wkctr,
                      input mch,
                      input move_to_wkctr,
                      input move_to_mch).
            end. /* IF is_wiplottrace_enabled() AND .. */
 
            else do:
 
               if recdoc <> "" then is-doc = recdoc.
 
               find first usrw_wkfl exclusive-lock
                  where usrw_wkfl.usrw_domain = global_domain
                  and   usrw_key1 = "@@LOCAL-REPISSDOC@@"
                  and   usrw_key2 = SessionUniqueID use-index usrw_index1 no-error.
               if available usrw_wkfl then delete usrw_wkfl.
 
               /* CREATE USRW_WKFL TO KEEP DOCUMENT */
               find first usrw_wkfl exclusive-lock
                  where usrw_wkfl.usrw_domain = global_domain
                  and   usrw_key1 = "@@LOCAL-REPISSDOC@@"
                  and   usrw_key2 = SessionUniqueID use-index usrw_index1 no-error.
               if not available usrw_wkfl then do:
                  create usrw_wkfl.
                  assign
                     usrw_wkfl.usrw_domain = global_domain
                     usrw_key1 = "@@LOCAL-REPISSDOC@@"
                     usrw_key2 = SessionUniqueID
                     usrw_charfld[1] = is-doc.
                     if recid(usrw_wkfl) = -1 then .
               end.
 
               /*RECEIVE COMPLETED MATERIAL.                            */
               /*THIS SUBPROGRAM PICKS UP INPUT FROM SR_WKFL            */
               {us/bbi/gprun.i ""receive.p""
                  "(input cumwo_lot,
                    input eff_date,
                    input ophist_recid)"}
 
               {us/bbi/gprun.i ""gplotwdl.p""}
 
               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &HANDLE=ph_ppitxr
                        &PARAM = "( input  wo_part,
                                    input  site,
                                    input ""pt_lot_ser"",
                                    output l_pt_lot_ser)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
 
               if clc_lotlevel <> 0
                  and l_pt_lot_ser = "L"
               then do:
                  find wo_mstr where wo_mstr.wo_domain = global_domain
                     and wo_lot = cumwo_lot
                  exclusive-lock.
                  if available wo_mstr
                     and not wo_lot_rcpt
                  then
                     wo_lot_next = "".
               end. /* IF clc_lotlevel <> 0 */
            end. /* ELSE DO */
         end. /* IF move_next_op */
 
         if is_wiplottrace_enabled() and
            is_operation_queue_lot_controlled(cumwo_lot, op, OUTPUT_QUEUE)
         then do:
 
            if qty_rjct <> 0
            then
               run bkfl_reject_wip_lots in h_wiplottrace_procs
                  (input ophist_recid,
                   input conv,
                   input to_op,
                   input l_reject_to_wkctr,
                   input l_reject_to_mch).
 
            if qty_scrap <> 0
            then
               run bkfl_scrap_wip_lots in h_wiplottrace_procs
                  (input ophist_recid,
                   input conv).
         end. /* IF is_wiplottrace_enabled() AND .. */
         else do:
            /*PROCESS SCRAP QUANTITIES*/
            if outque_multi_entry
            then do:
 
               do i = 1 to 10:
                  if scrap_quantities[i] <> 0
                  then do:
 
                     conv_qty_scrap = scrap_quantities[i] * conv.
 
                     {us/bbi/gprun.i ""reophist.p""
                        "(input trans_type,
                          input cumwo_lot,
                          input op,
                          input emp,
                          input wkctr,
                          input mch,
                          input dept,
                          input shift,
                          input eff_date,
                          output ophist_recid)"}
 
                     /* ASSIGN DOCUMENT TO OP_DOC_ID */
                     {us/bbi/gprun.i ""gpopdoc.p""
                        "(input wotdoc,
                          input ophist_recid)"}
 
                     {us/bbi/gprun.i ""rescrapa.p""
                        "(input cumwo_lot,
                          input op,
                          input conv_qty_scrap,
                          input scrap_rsn_codes[i],
                          input yes,
                          input emp,
                          input ophist_recid)"}
                  end. /* IF scrap_quantities[i] <> 0 */
               end. /* DO i = 1 TO 10: */
            end. /* IF outque_multi_entry */
            else
            if conv_qty_scrap <> 0
            then do:
 
               {us/bbi/gprun.i ""rescrapa.p""
                  "(input cumwo_lot,
                    input op,
                    input conv_qty_scrap,
                    input scrap_rsn_code,
                    input yes,
                    input emp,
                    input ophist_recid)"}
            end. /* ELSE IF conv_qty_scrap */
 
            /*PROCESS REJECT QUANTITIES*/
            {us/bbi/gprun.i ""rejectb.p""
               "(input cumwo_lot,
                 input op,
                 input to_op,
                 input emp,
                 input shift,
                 input eff_date,
                 input conv_qty_rjct,
                 input trans_type)"}
 
            if rejque_multi_entry
            then do:
 
               do i = 1 to 10:
                  if reject_quantities[i] <> 0
                  then do:
 
                     conv_qty_rjct = reject_quantities[i] * conv.
 
                     {us/bbi/gprun.i ""reophist.p""
                        "(input trans_type,
                          input cumwo_lot,
                          input to_op,
                          input emp,
                          input wkctr,
                          input mch,
                          input dept,
                          input shift,
                          input eff_date,
                          output ophist_recid)"}
 
                     /* ASSIGN DOCUMENT TO OP_DOC_ID */
                     {us/bbi/gprun.i ""gpopdoc.p""
                        "(input wotdoc,
                          input ophist_recid)"}
 
                     {us/bbi/gprun.i ""rejecta.p""
                        "(input cumwo_lot,
                          input to_op,
                          input op,
                          input reject_rsn_codes[i],
                          input ophist_recid,
                          input conv_qty_rjct)"}
                  end. /* IF reject_quantities[i] <> 0 */
               end. /* DO i = 1 TO 10 */
            end. /* IF rejque_multi_entry */
            else
            if conv_qty_rjct <> 0
            then do:
 
               {us/bbi/gprun.i ""reophist.p""
                  "(input trans_type,
                    input cumwo_lot,
                    input to_op,
                    input emp,
                    input wkctr,
                    input mch,
                    input dept,
                    input shift,
                    input eff_date,
                    output ophist_recid)"}
 
               /* ASSIGN DOCUMENT TO OP_DOC_ID */
               {us/bbi/gprun.i ""gpopdoc.p""
                  "(input is-doc,
                    input ophist_recid)"}
 
               {us/bbi/gprun.i ""rejecta.p""
                  "(input cumwo_lot,
                    input to_op,
                    input op,
                    input rjct_rsn_code,
                    input ophist_recid,
                    input conv_qty_rjct)"}
            end. /* ELSE IF conv_qty_rjct <> 0 */
         end. /* ELSE DO */
 
         global_addr = string(ophist_recid).
         {us/bbi/gprun.i ""reintchk.p""
            "(input cumwo_lot)"}
 
      end. /* DO TRANSACTION: */

/*c1440*/ if search("us/xx/xxciml01.r") <> ?
/*c1440*/ then do:
/*c1440*/    {us/bbi/gprun.i ""xxciml01.p""}
/*c1440*/ end.
 
      {us/gp/gprunp.i "soldxr" "p" "updateLegalNumToUnpostedGLEx"}
 
   end. /* MAINLOOP: */
end. /* MAIN */
 
if is_wiplottrace_enabled()
then
   delete PROCEDURE h_wiplottrace_procs no-error.
if is_wiplottrace_enabled()
then
   delete PROCEDURE h_wiplottrace_funcs no-error.
