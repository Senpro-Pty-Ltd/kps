/* xxbkfli4.p - WORK ORDER OPERATION BACKFLUSH GET RECEIVE LIST FROM USER     */
/* wobkfli4.p - WORK ORDER OPERATION BACKFLUSH GET RECEIVE LIST FROM USER     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxbkfli4.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* REVISION: 9.1     LAST MODIFIED: 10/25/99   BY: *N002* B. Gates            */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane    */
/* REVISION: 9.1     LAST MODIFIED: 08/12/00   BY: *N0KC* myb                 */
/* REVISION: 9.1     LAST MODIFIED: 08/14/00   BY: *N0L3* Arul Victoria       */
/* Revision: 1.12      BY: Katie Hilbert       DATE: 04/01/01   ECO: *P008*   */
/* Revision: 1.13      BY: Falguni Dalal       DATE: 01/11/02   ECO: *N17Q*   */
/* Revision: 1.14      BY: Jean Miller         DATE: 05/22/02   ECO: *P074*   */
/* Revision: 1.16      BY: Ashish Maheshwari   DATE: 07/17/02   ECO: *N1GJ*   */
/* Revision: 1.17      BY: Anitha Gopal        DATE: 03/28/03   ECO: *P0PG*   */
/* Revision: 1.18      BY: Narathip W.         DATE: 04/30/03   ECO: *P0QN*   */
/* Revision: 1.20      BY: Paul Donnelly (SB)  DATE: 06/28/03   ECO: *Q00N*   */
/* Revision: 1.21      BY: Swati Sharma        DATE: 10/06/04   ECO: *P2N2*   */
/* Revision: 1.22      BY: Jean Miller         DATE: 01/10/06   ECO: *Q0PD*   */
/* Revision: 1.23      BY: Shilpa Kamath       DATE: 04/18/06   ECO: *R043*   */
/* Revision: 1.24      BY: Shilpa Kamath       DATE: 06/06/06   ECO: *R05V*   */
/* Revision: 1.25      BY: Niranjan Ranka      DATE: 07/05/06   ECO: *R073*   */
/* Revision: 1.26      BY: Niranjan Ranka      DATE: 08/08/06   ECO: *R07W*   */
/* Revision: 1.27      BY: Katie Hilbert       DATE: 05/02/08   ECO: *R0S9*   */
/* Revision: 1.28      BY: Namita Patil        DATE: 07/16/08   ECO: *P6XP*   */
/* Revision: 1.29      BY: Yizhou Mao          DATE: 12/17/08   ECO: *R18K*   */
/* Revision: 1.32      BY: Yizhou Mao          DATE: 03/17/09   ECO: *R1DT*   */
/* Revision: 1.34      BY: Ruchita Shinde      DATE: 07/03/09   ECO: *Q2SD*   */
/* Revision: 1.35      BY: Chandrakant Ingale  DATE: 07/15/09   ECO: *Q34Z*   */
/* $Revision: 1.2 $   BY: Zhijun Guan         DATE: 11/16/09   ECO: *R1V9*   */
/* CYB           MODIFIED: 03-MAR-2010            BY: psu *cy1018*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/*DERIVED FROM WOISRC02.P*/
{us/bbi/mfdeclre.i}
{us/px/pxphdef.i gpumxr}
{us/gp/gpuid.i}
{us/px/pxphdef.i ppitxr}
 
/* EXTERNAL LABEL INCLUDE */
{us/bbi/gplabel.i}
 
{us/px/pxmaint.i}
 
/* Include the temp-table definition for tt_abs_shipper */
{us/so/sospdef.i}
 
/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}
/* API dataset for transfer */
{us/wo/wodsbkfl.i "reference-only"}
 
{us/ca/caattr.i}
{us/ca/cattdef2.i}

{us/px/pxphdef.i caparaxr}
{us/px/pxphdef.i carcxr}
{us/px/pxphdef.i caatdxr}
{us/px/pxphdef.i captdxr2}
{us/px/pxphdef.i caisxr}

/* OUTPUT PARAMETER op_undo_all IS INITIALISED TO yes AND */
/* IS SET TO no ONLY IF ALL VALIDATIONS ARE SUCCESSFUL.   */
define input  parameter ip_wo_recid  as   recid       no-undo.
define input  parameter ip_effdate   as   date        no-undo.
define input  parameter ip_jp        like mfc_logical no-undo.
define input  parameter ip_qty_comp  as   decimal     no-undo.
define input  parameter ip_um        as   character   no-undo.
define input  parameter ip_conv      as   decimal     no-undo.
define input  parameter ip_lotserial as   character   no-undo.
define output parameter op_close_wo  like mfc_logical
                                label "Close" no-undo.
define output parameter op_rmks      like tr_rmks     no-undo.
define output parameter op_conv      as   decimal     no-undo.
define output parameter op_undo_all  like mfc_logical no-undo initial yes.
define input-output parameter table for tt_attr_pfvalue.
 
define variable reject_conv like um_conv     label "Conversion"   no-undo.
define variable reject_qty  like wo_rjct_chg label "Scrapped Qty" no-undo.
define variable reject_um   like pt_um                            no-undo.
 
define new shared variable total_lotserial_qty like sr_qty.
define new shared variable lotserial_qty       like sr_qty    no-undo.
define new shared variable site                like sr_site   no-undo.
define new shared variable location            like sr_loc    no-undo.
define new shared variable conv                like um_conv
                                        label "Conversion" no-undo.
define new shared variable lotserial           like sr_lotser no-undo.
define new shared variable lotref              like sr_ref
                                                format "x(8)" no-undo.
define new shared variable multi_entry         like mfc_logical
                                        label "Multi Entry" no-undo.
define new shared variable cline               as   character.
define new shared variable prev_status         like wo_status.
define new shared variable prev_release        like wo_rel_date.
define new shared variable prev_due            like wo_due_date.
define new shared variable prev_qty            like wo_qty_ord.
define new shared variable lotserial_control   as   character.
define new shared variable trans_um            like pt_um.
define new shared variable trans_conv          like sod_um_conv.
define new shared variable transtype           as   character initial "RCT-WO".
define new shared variable issue_or_receipt    as   character.
 
define variable chg_attr  like mfc_logical label "Chg Attributes" no-undo.
define variable tot_units like wo_qty_chg  label "Total Units" no-undo.
define variable open_ref  like wo_qty_ord  label "Open Qty" no-undo.
define variable um        like pt_um                             no-undo.
define variable lotnext   like wo_lot_next                       no-undo.
define variable newlot    like wo_lot_next                       no-undo.
define variable lotprcpt  like wo_lot_rcpt                       no-undo.
define variable trans_ok  like mfc_logical                       no-undo.
define variable ii        as   integer                           no-undo.
define variable almr      like alm_pgm                           no-undo.
define variable alm_recno as   recid                             no-undo.
define variable filename  as   character                         no-undo.
define variable i         as   integer                           no-undo.
define variable yn        like mfc_logical                       no-undo.
define variable srlot     like sr_lotser                         no-undo.
define variable l_pt_loc  as  character no-undo.
define variable l_pt_lot_ser as character no-undo.
define variable l_pt_auto_lot as character no-undo.
 
/* Global Shipping: Legal Document Variables */
define variable inv_mov        like sgid_inv_mov    no-undo.
define variable shipnbr        like abs_id          no-undo.
define variable c_ld_nbr       like lgd_nbr         no-undo.
define variable c_form_code    like df_form_code    no-undo.
define variable c_ld_form_code like df_ld_form_code no-undo.
define variable l_undo         as   logical         no-undo.
define variable o_trflow_flg   as   logical         no-undo.
define variable v_abs_recid    as   recid           no-undo.
 
define variable from_site      like pt_site         no-undo.
define variable from_loc       like pt_loc          no-undo.
define variable to_site        like pt_site         no-undo.
define variable to_loc         like pt_loc          no-undo.
 
define shared variable doc1   as character format "x(24)" label "Document".
define shared variable is-doc as character format "x(24)" label "Document".
define shared variable eff_date like glt_effdate.
 
issue_or_receipt = getTermLabel("RECEIPT",8).
 
define variable attrConformStatus as character format "x(14)" no-undo.

{us/gp/gpatrdef.i "shared"}

/*cy1018 BEGIN*/
define variable l_autoserial like mfc_logical        no-undo.
define variable l_errorst    like mfc_logical        no-undo.
define variable i_errornum   as   integer            no-undo.
define shared variable l_lotitm like mfc_logical       no-undo.
{us/gp/gpnbrgen.i}
/*cy1018 END*/


 
form
   wo_rmks        colon 15
   open_ref       colon 15
   pt_um          colon 35
   pt_lot_ser     colon 57 label "L/S"
   wo_batch       colon 15
   pt_auto_lot    colon 57
   lotserial_qty  colon 15
   site           colon 57
   um             colon 15
   location       colon 57
   conv           colon 15
   lotserial      colon 57
   reject_qty     colon 15
   lotref         colon 57
   reject_um      colon 15
   multi_entry    colon 57
   reject_conv    colon 15
   chg_attr       colon 57
   tot_units      colon 57
   is-doc         colon 15
   op_rmks        colon 57
   op_close_wo    colon 15
with frame a side-labels width 80
title color normal (getFrameTitle("WORK_ORDER_RECEIPTS",78)).
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
for first clc_ctrl
   where clc_ctrl.clc_domain = global_domain
no-lock:
end. /* FOR FIRST clc_ctrl */
 
if not available clc_ctrl
then do:
   {us/bbi/gprun.i ""gpclccrt.p""}
   for first clc_ctrl
      where clc_ctrl.clc_domain = global_domain no-lock:
   end. /* FOR FIRST clc_ctrl */
end. /* IF NOT AVAILABLE clc_ctrl */
 
for first wo_mstr
   where recid(wo_mstr) = ip_wo_recid
no-lock:
end. /* FOR FIRST wo_mstr */
 
for first pt_mstr
   where pt_mstr.pt_domain = global_domain
    and  pt_part = wo_part
no-lock:
end. /* FOR FIRST pt_mstr */

{us/px/pxrun.i &PROC  = 'clearGetFieldDefaultTempRecord' 
               &HANDLE=ph_ppitxr
               &PROGRAM = 'ppitxr.p'
               &PARAM = "(input  wo_part,
                          input  wo_site)"
               &NOAPPERROR = true
               &CATCHERROR = true
}

{us/px/pxrun.i &PROC  = 'getFieldDefault'
         &HANDLE=ph_ppitxr
         &PROGRAM = 'ppitxr.p'
         &PARAM = "( input  wo_part,
                     input  wo_site,
                     input ""pt_lot_ser"",
                     output l_pt_lot_ser)"
         &NOAPPERROR = true
         &CATCHERROR = true
}
{us/px/pxrun.i &PROC  = 'getFieldDefault'
         &HANDLE=ph_ppitxr
         &PROGRAM = 'ppitxr.p'
         &PARAM = "( input  wo_part,
                     input  wo_site,
                     input ""pt_auto_lot"",
                     output l_pt_auto_lot)"
         &NOAPPERROR = true
         &CATCHERROR = true
}
assign
   lotserial_control   = l_pt_lot_ser
   prev_status         = wo_status
   prev_release        = wo_rel_date
   prev_due            = wo_due_date
   prev_qty            = wo_qty_ord
   open_ref            = wo_qty_ord - wo_qty_comp - wo_qty_rjct
   global_part         = wo_part
   lotserial           = ip_lotserial
   lotserial_qty       = ip_qty_comp
   total_lotserial_qty = lotserial_qty
   um                  = ip_um
   conv                = ip_conv
   reject_um           = ip_um
   reject_conv         = ip_conv.
 
if  wo_joint_type <> ""
and wo_joint_type <> "5"
then
   cline = "RCT" + wo_part.
else
   cline = "".
 
/* For API Mode, get handle of API Controller and dataset */
{us/gp/gpapinit.i "dsWOOperationBackflush" "getRequestDataset"}
 
if c-application-mode <> "API" then do:
   display
      wo_rmks
      open_ref
      wo_batch
      pt_um
         logical (l_pt_auto_lot) @ pt_auto_lot
         with frame a.
end. /* if c-application-mode <> "API" */
 
/*COMPLIANCE GET NEXT LOT NUMBER ETC*/
assign
   lotnext   = ""
   newlot    = ""
   lotprcpt  = wo_lot_rcpt
   .
 
/* wo_lot_next HOLDS THE LOT NUMBER FOR A PARTICULAR WORK ORDER. WHEN THE */
/* PARENT ITEM IS LOT CONTROLLED AND LOT GROUP IS BLANK, wo_lot_next      */
/* SHOULD BE ASSIGNED THE WORK ORDER ID.                                  */
 
if logical(l_pt_auto_lot) = yes
and l_pt_lot_ser  = "L"
and pt_lot_grp  = " "
then
   if (wo_lot_next = "")
   then
      wo_lot_next = wo_lot.
 
if  (l_pt_lot_ser = "L")
and (not logical(l_pt_auto_lot)
      or (index("ER", wo_type) > 0))
then
   lotserial = wo_lot_next.
 
if (l_pt_lot_ser = "L"
   and logical(l_pt_auto_lot) = yes
   and pt_lot_grp <> "")
   and (index("ER",wo_type) = 0 )
then do:
   for first alm_mstr
      where alm_mstr.alm_domain = global_domain
       and  alm_lot_grp = pt_lot_grp
       and  alm_site    = wo_site
   no-lock:
   end. /* FOR FIRST alm_mstr */
 
   if not available alm_mstr
   then
      for first alm_mstr
         where alm_mstr.alm_domain = global_domain
          and  alm_lot_grp = pt_lot_grp
          and  alm_site    = ""
      no-lock:
      end. /* FOR FIRST alm_mstr */
 
      if not available alm_mstr
      then do:
         /* LOT FORMAT RECORD DOES NOT EXIST */
         {us/bbi/pxmsg.i &MSGNUM=2737 &ERRORLEVEL=3}
         return.
      end. /* IF NOT AVAILABLE alm_mstr */
      else do:
         if (search(alm_pgm) = ?)
         then do:
            assign
               ii   = index(alm_pgm,".p")
               almr = global_user_lang_dir + "/"
                      + substring(alm_pgm, 1, 2) + "/"
                      + substring(alm_pgm,1,ii - 1) + ".r"
            .
 
            if (search(almr)) = ?
            then do:
               /* AUTO LOT PROGRAM NOT FOUND */
               {us/bbi/pxmsg.i &MSGNUM=2732 &ERRORLEVEL=4 &MSGARG1=alm_pgm}
               return.
            end. /* IF (search(almr)) = ? */
         end. /* IF (search(alm_pgm) = ?) */
      end. /* ELSE DO OF IF NOT AVAILABLE alm_mstr */
 
      for first sr_wkfl
         where sr_wkfl.sr_domain = global_domain
          and  sr_userid = SessionUniqueID
          and  sr_lineid = cline
      no-lock:
         lotserial = sr_lotser.
      end. /* FOR FIRST sr_wkfl */
 
      if newlot = ""
      then do:
         assign
            alm_recno = recid(alm_mstr)
            filename  = "wo_mstr"
         .
 
         if false
         then do:
            {us/bbi/gprun.i ""gpauto01.p""
               "(input  alm_recno,
                 input  ip_wo_recid,
                 input  "filename",
                 output newlot,
                 output trans_ok)" }
         end. /* IF false */
 
         {us/bbi/gprun.i alm_pgm
            "(input  alm_recno,
              input  ip_wo_recid,
              input  "filename",
              output newlot,
              output trans_ok)"}
 
         if not trans_ok
         then
            return.
 
         lotserial = newlot.
         release alm_mstr.
 
      end. /* IF newlot = "" */
 
   end. /* IF NOT AVAILABLE alm_mstr */
 
  if c-application-mode <> "API" then do:
    display
      lotserial with frame a.
  end. /* if c-application-mode <> "API" */
 
   /* Get the record from the API controller */
   if c-application-mode = "API" then do:
      run getNextRecord in apiMethodHandle (input "ttWOReceipts").
      if return-value = {&RECORD-NOT-FOUND} then do:
         return.
      end.
   end. /* if c-application-mode = "API" */
 
   mainloop:
   do on error undo, retry with frame a:
 
      if c-application-mode = "API" and retry then
         undo mainloop, leave mainloop.
 
      for each sr_wkfl
         exclusive-lock
         where sr_wkfl.sr_domain = global_domain
          and  sr_userid = SessionUniqueID
          and  sr_lineid = cline:
         delete sr_wkfl.
      end. /* FOR EACH sr_wkfl */
 
      if c-application-mode <> "API" then
        status input.
 
      is-doc = doc1.
 
      if c-application-mode <> "API" then
        display is-doc with frame a.
 
      setd:
      repeat on endkey undo mainloop, leave mainloop:
 
        if c-application-mode = "API" and retry then
          undo mainloop, leave mainloop.
 
          assign
            site     = ""
            location = ""
            lotref   = ""
            i        = 0
         .
 
         for each sr_wkfl
            no-lock
            where sr_wkfl.sr_domain = global_domain
             and  sr_userid = SessionUniqueID
             and  sr_lineid = cline:
            i = i + 1.
            if i > 1
            then
               leave.
         end. /* FOR EACH sr_wkfl */
 
         if i = 0
         then do:
            assign
               site     = wo_site
               location = wo_loc.
 
            if location = "" then do:
               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &HANDLE=ph_ppitxr
                        &PARAM =  "(input  wo_part,
                                    input  wo_site,
                                    input ""pt_loc"",
                                    output location)"
                        &NOAPPERROR = true
                        &CATCHERROR = true
               }
            end.
         end. /* IF i = 0 */
         else if i = 1
         then do:
            for first sr_wkfl
               where sr_wkfl.sr_domain = global_domain
                and  sr_userid = SessionUniqueID
                and  sr_lineid = cline
            no-lock:
               assign
                  site          = sr_site
                  location      = sr_loc
                  lotserial     = sr_lotser
                  lotref        = sr_ref
                  lotserial_qty = sr_qty.
            end. /* FOR FIRST sr_wkfl */
         end. /* If i = 1 */
 
         /*INITIALIZE ATTRIBUTE VARIABLES WITH CURRENT SETTINGS*/
         assign
            chg_assay   = wo_assay
            chg_grade   = wo_grade
            chg_expire  = wo_expire
            chg_status  = wo_rctstat
            assay_actv  = yes
            grade_actv  = yes
            expire_actv = yes
            status_actv = yes
            resetattr   = no.
 
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
                        &CATCHERROR = true
               }
            end.
            if available pti_det and pti_rctwo_active = yes
            then
               chg_status = pti_rctwo_status.
            else
               if pt_rctwo_active = yes
               then
                  chg_status = pt_rctwo_status.
               else
                  assign
                     chg_status  = ""
                     status_actv = no.
         end. /* If wo_rctstat_active = no */

         /*cy1018 BEGIN*/  
         /*CHECK AUTOMATIC SERIAL LOGIC*/
         l_autoserial = no.
         l_lotitm     = no.

         if not available si_mstr then 
         do:
            for first si_mstr no-lock 
               where si_domain = global_domain
               and   si_site   = wo_site:
            end.
         end. /*if not available si_mstr then*/
         
         for first pti_det no-lock
             where pti_det.oid_pt_mstr = pt_mstr.oid_pt_mstr
             and   pti_det.oid_si_mstr = si_mstr.oid_si_mstr: 
         end.
         if available pti_det then
         do:
            if (pti_lot_ser = "S" or pti_lot_ser = "L") and pti_userl01 then
               l_autoserial = yes.   
             
            if pti_lot_ser = "L" then l_lotitm = yes.   
         end.
         else
         do:
            if (pt_lot_ser = "S" or pt_lot_ser = "L") and pt__log01 then
               l_autoserial = yes.   
               
            if pt_lot_ser = "L" then l_lotitm = yes.   
         end. 
         
         if l_autoserial and not can-find(first nr_mstr
                            where nr_domain  = global_domain
                            and   nr_dataset begins "wo_serial" 
                            and   nr_seqid = "serial"
                            and   nr_effdate <= today
                            and   (nr_exp_date = ? or nr_exp_date >=today)) then 
         do:
            {us/bbi/pxmsg.i &MSGNUM=2914 &ERRORLEVEL=3}
             undo , retry.
         end.      
        /*cy1018 END*/


 
        locloop:
         do on error undo, retry on endkey undo mainloop, leave mainloop:
 
             if c-application-mode = "API" and retry then
               undo mainloop, leave mainloop.
 
            if  logical(l_pt_auto_lot)
            and pt_lot_grp = ''
            then do:
               lotserial = wo_lot_next.
               if c-application-mode <> "API" then
                  display lotserial with frame a.
            end. /* IF pt_auto_lot ... */

            /*cy1018 BEGIN*/
            if l_autoserial then 
            do:
               run getnbr(input "serial",
                          input today,
                          output lotserial,
                          output l_errorst,
                          output i_errornum).  
               if l_errorst then 
               do:
                  {us/bbi/pxmsg.i &MSGNUM=i_errornum &ERRORLEVEL=3}
                  undo , leave locloop.
               end.    
               else
                 lotserial = lotserial + "-1".
            end.   
            /*cy1018 END*/



            {us/bbi/gprun.i ""gpbranch.p""
                   "(input 'calu037.p', input 'gplu164.p')"}
            {us/bbi/gprun.i ""gpbranch.p""
                   "(input 'calu038.p', input 'gplu159.p')"}
            {us/bbi/gprun.i ""gpbranch.p""
                   "(input 'calu039.p', input 'gplu163.p')"}
 
            if c-application-mode <> "API" then do:
               update
                  lotserial_qty
                  um
                  conv
                  reject_qty
                  reject_um
                  reject_conv
                  site
                  location
                  lotserial when (not logical(l_pt_auto_lot))
                  lotref    when (not logical(l_pt_auto_lot) or pt_lot_grp <> '')
                  multi_entry
                  chg_attr
               with frame a editing:
                  assign
                     global_site = input site
                     global_loc  = input location
                     global_lot  = input lotserial
                     global_ref  = input lotref.
 
                  readkey.
                  apply lastkey.
               end. /* UPDATE */
            end. /* if c-application-mode <> "API" */
            else do:
               assign
                  {us/mf/mfaidflt.i ttWOReceipts.lotserQty       lotserial_qty}
                  {us/mf/mfaidflt.i ttWOReceipts.um              um}
                  {us/mf/mfaidflt.i ttWOReceipts.conv            conv}
                  {us/mf/mfaidflt.i ttWOReceipts.rejectQty       reject_qty}
                  {us/mf/mfaidflt.i ttWOReceipts.rejectUm        reject_um}
                  {us/mf/mfaidflt.i ttWOReceipts.rejectConv      reject_conv}
                  {us/mf/mfaidflt.i ttWOReceipts.site            site}
                  {us/mf/mfaidflt.i ttWOReceipts.location        location}
                  {us/mf/mfaidflt.i ttWOReceipts.lotSerial       lotserial}
                  {us/mf/mfaidflt.i ttWOReceipts.lotRef          lotref}
                  {us/mf/mfaidflt.i ttWOReceipts.multiEntry      multi_entry}
                  {us/mf/mfaidflt.i ttWOReceipts.chgAttr         chg_attr}.
               assign
                  lotserial_qty:screen-value    =  string(ttWOReceipts.lotserQty)
                  um:screen-value               =  ttWOReceipts.um
                  conv:screen-value             =  string(ttWOReceipts.conv)
                  reject_qty:screen-value       =  string(ttWOReceipts.rejectQty)
                  reject_um:screen-value        =  ttWOReceipts.rejectUm
                  reject_conv:screen-value      =  string(ttWOReceipts.rejectConv)
                  site:screen-value             =  ttWOReceipts.site
                  location:screen-value         =  ttWOReceipts.location
                  lotserial:screen-value        =  ttWOReceipts.lotSerial when (not logical(l_pt_auto_lot))
                  lotref:screen-value           =  ttWOReceipts.lotRef    when (not logical(l_pt_auto_lot) or pt_lot_grp <> '')
                  multi_entry:screen-value      =  string(ttWOReceipts.multiEntry)
                  chg_attr:screen-value         =  string(ttWOReceipts.chgAttr).
               assign
                  lotserial_qty
                  um
                  conv
                  reject_qty
                  reject_um
                  reject_conv
                  site
                  location
                  lotserial when (not logical(l_pt_auto_lot))
                  lotref    when (not logical(l_pt_auto_lot) or pt_lot_grp <> '')
                  multi_entry
                  chg_attr.
            end.
 
 
            if lotserial_qty = ?
            then do:
               /* INVALID QUANTITY */
               if c-application-mode <> "API" then do:
                  {us/bbi/pxmsg.i &MSGNUM = 10028 &ERRORLEVEL = 3}
                  next-prompt lotserial_qty.
               end. /*if c-application-mode <> "API" */
               else do:
                  {us/bbi/pxmsg.i &MSGNUM=10028 &ERRORLEVEL=3 &FIELDNAME=""lotserQty""}
               end.
               undo, retry.
            end. /* IF lotserial_qty <> ? */
 
            /*RECEIPT UM HANDLING*/
            if  um = pt_um
            and not conv entered
            then do:
               conv = 1.
               if c-application-mode <> "API" then
                  display conv with frame a.
            end. /* IF um = pt_um ... */
 
            if um <> pt_um
            then do:
               if not conv entered
               then do:
                  {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                                 &HANDLE=ph_gpumxr
                                 &PARAM="(input wo_part,
                                          input pt_um,
                                          input um,
                                          output conv)"
                                 &NOAPPERROR=True
                                 &CATCHERROR=True}
 
                  if conv = ?
                  then do:
                     /*NO UNIT OF MEASURE CONVERSION EXISTS*/
                     {us/bbi/pxmsg.i &MSGNUM=33 &ERRORLEVEL=2}
                     conv = 1.
                  end. /* IF conv = ? */
                  if c-application-mode <> "API" then
                    display conv with frame a.
               end. /* IF NOT conv ENTERED */
            end. /* IF um <> pt_um */
 
            /*SCRAP UM HANDLING*/
 
            if  reject_um = pt_um
            and not reject_conv entered
            then do:
               reject_conv = 1.
               if c-application-mode <> "API" then
                  display reject_conv with frame a.
            end. /* IF reject_um = pt_um ... */
 
            if reject_um <> pt_um
            then do:
               if not reject_conv entered
               then do:
                  {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                                 &HANDLE=ph_gpumxr
                                 &PARAM="(input wo_part,
                                          input pt_um,
                                          input reject_um,
                                          output reject_conv)"
                                 &NOAPPERROR=True
                                 &CATCHERROR=True}
 
                  if reject_conv = ?
                  then do:
                     /*NO UNIT OF MEASURE CONVERSION EXISTS*/
                     {us/bbi/pxmsg.i &MSGNUM=33 &ERRORLEVEL=2}
                     reject_conv = 1.
                  end. /* IF reject_conv = ? */
 
                  if c-application-mode <> "API" then
                    display reject_conv with frame a.
               end. /* IF NOT reject_conv ENTERED */
            end. /* IF reject_um <> pt_um */
 
            /*IF SINGLE LOT PER WO RECEIPT THEN VERIFY IF IT IS GOOD */
            {us/px/pxrun.i &PROC  = 'getFieldDefault'
                     &HANDLE=ph_ppitxr
                     &PROGRAM = 'ppitxr.p'
                     &PARAM = "( input  wo_part,
                                 input  wo_site,
                                 input ""pt_lot_ser"",
                                 output l_pt_lot_ser)"
                     &NOAPPERROR = true
                     &CATCHERROR = true
            }
 
            if  (lotprcpt     =  yes)
            and (l_pt_lot_ser   =  "L")
            and (clc_lotlevel <> 0)
            then do:
               if can-find(first lot_mstr
                  where lot_mstr.lot_domain = global_domain
                    and lot_serial =lotserial
                    and lot_part   = wo_part
                    and lot_nbr    = wo_nbr
                    and lot_line   = wo_lot
                  no-lock)
               then do:
                  /*LOT IS IN USE*/
                  if c-application-mode <> "API" then do:
                     {us/bbi/pxmsg.i &MSGNUM=2759 &ERRORLEVEL=3}
                     next-prompt lotserial with frame a.
                  end. /* if c-application-mode <> "API" */
                  else do:
                     {us/bbi/pxmsg.i &MSGNUM=2759 &ERRORLEVEL=3 ""lotSerial""}
                  end.
                  undo, retry .
               end. /* IF CAN_FIND(FIRST lot_mstr ...  */
 
               if can-find(first lotw_wkfl
                  where lotw_wkfl.lotw_domain = global_domain
                    and lotw_lotser=  lotserial
                    and lotw_mfguser <> SessionUniqueID
                    and lotw_part    <> pt_part
                  no-lock)
               then do:
                  /*LOT IS IN USE*/
                  if c-application-mode <> "API" then do:
                    {us/bbi/pxmsg.i &MSGNUM=2759 &ERRORLEVEL=3}
                    next-prompt lotserial with frame a.
                  end. /* if c-application-mode <> "API" */
                  else do:
                     {us/bbi/pxmsg.i &MSGNUM=2759 &ERRORLEVEL=3 ""lotSerial""}
                  end. 
                  undo , retry .
               end. /* IF CAN-FIND(first lotw_wkfl ... */
            end. /* IF (lotprcpt = yes) */
 
            i = 0.
            for each sr_wkfl
               no-lock
                where sr_wkfl.sr_domain = global_domain
                 and  sr_userid = SessionUniqueID
                 and  sr_lineid = cline:
               i = i + 1.
               if i > 1
               then do:
                  multi_entry = yes.
                  leave.
               end. /* IF i > 1 */
            end. /* FOR EACH sr_wkfl */
 
            assign
               trans_um   = um
               trans_conv = conv
            .
 
            if multi_entry
            then do:
               if i >= 1
               then
                  assign
                     site     = ""
                     location = ""
                     lotref   = ""
                  .
               if (lotprcpt = yes)
               then
                  lotnext = lotserial.
 
               if c-application-mode = "API" then do:
                  run setCommonDataBuffer in apiMethodHandle (input "ttRecvMLEntry").
               end. /* if c-application-mode = "API" */
 
               {us/ca/cacratpr.i &eff_date_attr=eff_date}

               /* ADDED SIXTH INPUT PARAMETER AS NO */
               {us/bbi/gprun.i ""icsrup4.p""
                  "(input        wo_site,
                    input        wo_nbr,
                    input        wo_lot,
                    input-output lotnext,
                    input        lotprcpt,
                    input        no,
                    input table tt_attr_parameter by-reference,
                    input-output table tt_attr_pfvalue by-reference)"}

               if c-application-mode = "API" then do:
                  run setCommonDataBuffer in apiMethodHandle (input "").
               end. /* if c-application-mode = "API" */
 
 
            end. /* IF multi_entry */
            else do:
               if lotserial_qty <> 0
               then do:
                  {us/bbi/gprun.i ""icedit.p""
                     " (input  transtype,
                        input  site,
                        input  location,
                        input  global_part,
                        input  lotserial,
                        input  lotref,
                        input  (lotserial_qty * trans_conv),
                        input  trans_um,
                        input  wo_nbr,
                        input  wo_lot,
                        output yn )" }
 
                  if yn
                  then
                     undo locloop, retry.
               end. /* IF lotserial_qty <> 0 */
 
               if wo_site <> site
               then do:
                  if lotserial_qty <> 0
                  then do:
                     {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                              &HANDLE=ph_ppitxr
                              &PARAM =  "(input  global_part,
                                          input  wo_site,
                                          input ""pt_loc"",
                                          output l_pt_loc)"
                              &NOAPPERROR = true
                              &CATCHERROR = true
                     }
                     {us/bbi/gprun.i ""icedit4.p""
                        "(input ""RCT-WO"",
                          input wo_site,
                          input site,
                          input l_pt_loc,
                          input location,
                          input global_part,
                          input lotserial,
                          input lotref,
                          input lotserial_qty * trans_conv,
                          input trans_um,
                          input wo_nbr,
                          input wo_lot,
                          output yn)" }
 
                     if yn
                     then
                        undo locloop, retry.
                  end. /* IF LOTSERIAL_QTY <> 0 */
               end. /* IF wo_site <> site */
 
               total_lotserial_qty = 0.
 
               for each sr_wkfl
                  no-lock
                  where sr_wkfl.sr_domain = global_domain
                   and  sr_userid =SessionUniqueID
                   and  sr_lineid = cline:
                  total_lotserial_qty = total_lotserial_qty + sr_qty.
               end. /* FOR EACH sr_wkfl */
 
               for first sr_wkfl
                  where sr_wkfl.sr_domain = global_domain
                   and  sr_userid = SessionUniqueID
                   and  sr_lineid = cline
               exclusive-lock:
               end. /* FOR FIRST sr_wkfl */
 
               if lotserial_qty = 0
               then do:
                  if available sr_wkfl
                  then do:
                     total_lotserial_qty = total_lotserial_qty - sr_qty.
                     delete sr_wkfl.
                  end. /* IF AVAILABLE sr_wkfl */
               end. /* IF lotserial_qty = 0 */
               else do:
                  if available sr_wkfl
                  then
                     assign
                        total_lotserial_qty = total_lotserial_qty - sr_qty
                                              + lotserial_qty
                        sr_site             = site
                        sr_loc              = location
                        sr_lotser           = lotserial
                        sr_ref              = lotref
                        sr_qty              = lotserial_qty.
                  else do:
                     create sr_wkfl. sr_wkfl.sr_domain = global_domain.
                     assign
                        sr_userid           = SessionUniqueID
                        sr_lineid           = cline
                        sr_site             = site
                        sr_loc              = location
                        sr_lotser           = lotserial
                        sr_ref              = lotref
                        sr_qty              = lotserial_qty
                        total_lotserial_qty = total_lotserial_qty
                                            + lotserial_qty.
                     if recid(sr_wkfl) = -1
                     then .
                  end. /* ELSE DO OF IF AVAILABLE sr_wkfl */

                  {us/ca/cacratpr.i &eff_date_attr=eff_date}

                  {us/px/pxrun.i &PROC       = 'createAttrpfValueRCT'
                                 &PROGRAM    = 'carcxr.p'
                                 &HANDLE     = ph_carcxr
                                 &PARAM      = "(input sr_wkfl.oid_sr_wkfl,
                                                 input wo_part,
                                                 input sr_wkfl.sr_site,
                                                 input sr_wkfl.sr_loc,
                                                 input sr_wkfl.sr_lotser,
                                                 input sr_wkfl.sr_ref,
                                                 input 'RCT-WO',
                                                 input sr_wkfl.sr_qty,
                                                 input wo_lot,
                                                 input '0',
                                                 input table tt_attr_parameter by-reference,
                                                 input-output table tt_attr_pfvalue by-reference)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true
                  }

                  if sr_wkfl.sr_qty > 0 
                     and can-find (first tt_attr_pfvalue
                     where tt_attr_pfvalue.tt_oid_attrpf_mstr = sr_wkfl.oid_sr_wkfl) then
                  do:

                     {us/ca/cainipf.i sr_wkfl.oid_sr_wkfl
                                      wo_part
                                      site
                                      location
                                      lotserial
                                      lotref
                                      a
                                      locloop
                                      lotprcpt
                     }

                     for first tt_attr_pfvalue no-lock
                        where tt_attr_pfvalue.tt_oid_attrpf_mstr = sr_wkfl.oid_sr_wkfl
                        and   tt_attr_pfvalue.tt_attrpfd_ui_display:

                        hide frame a no-pause.
                        {us/bbi/gprun.i ""caatui.p""
                           "(input sr_wkfl.oid_sr_wkfl,
                             input wo_part,
                             input sr_wkfl.sr_site,
                             input sr_wkfl.sr_loc,
                             input sr_wkfl.sr_lotser,
                             input sr_wkfl.sr_ref,
                             input sr_wkfl.sr_qty,
                             input trans_um,
                             input transtype,
                             input-output table tt_attr_pfvalue by-reference)"}

                        view frame a.
                     end. /* for first tt_attr_pfvalue */

                  end. /* if can-find */

               end. /* ELSE DO OF IF lotserial_qty = 0 */
            end. /* ELSE DO OF IF multi_entry */
 
            /* Global Shipping - Get Form Code */
            find last wr_route
               where wr_domain = global_domain
               and   wr_nbr    = wo_nbr
               and   wr_lot    = wo_lot
            no-lock no-error.
 
            assign
               from_site = wo_site
               from_loc  = wr_wkctr
               to_site   = site
               to_loc    = location.
 
            if from_site = to_site and from_loc <> to_loc then do:
               assign
                  from_site = ""
                  to_site   = "".
 
               for first loc_mstr where loc_domain = global_domain
                  and loc_site = wo_site
                  and loc_loc  = wr_wkctr
                  no-lock:
                  from_site   = loc_phys_addr.
               end.
 
               for first loc_mstr where loc_domain = global_domain
                  and loc_site = site
                  and loc_loc  = location
                  no-lock:
                  to_site = loc_phys_addr.
               end.
            end.
 
            {us/bbi/gprun.i ""gpimfcmt.p"" "
               (input  from_site,
                input  wo_loc,
                input  to_site,
                input  location,
                input  'RCT-WO',
                output inv_mov,
                output c_form_code,
                output c_ld_form_code,
                output l_undo)"}
 
            if l_undo then undo, retry.
 
            /*SET AND UPDATE INVENTORY DETAIL ATTRIBUTES*/
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in apiMethodHandle (input "ttReceiptAttributes").
            end. /* if c-application-mode = "API" */
 
            {us/bbi/gprun.i ""worcat02.p""
               "(input        recid(wo_mstr),
                 input        chg_attr,
                 input        ip_effdate,
                 input-output chg_assay,
                 input-output chg_grade,
                 input-output chg_expire,
                 input-output chg_status,
                 input-output assay_actv,
                 input-output grade_actv,
                 input-output expire_actv,
                 input-output status_actv)"}
 
            if c-application-mode = "API" then do:
               run setCommonDataBuffer in apiMethodHandle (input "").
            end. /* if c-application-mode = "API" */
 
            /* Check Inventory Status Value */
            if (status_actv or
                chg_status <> "")
            and not can-find (is_mstr where is_domain = global_domain
                                      and   is_status = chg_status)
            then do:
                if c-application-mode <> "API" then
                  next-prompt chg_attr with frame a.
                undo locloop, retry.
            end. /* if (status_actv OR chg_status <> "") */
 
 
            /*TEST FOR ATTRIBUTE CONFLICTS*/
 
            for each sr_wkfl
               where sr_wkfl.sr_domain = global_domain
                and  sr_userid = SessionUniqueID
                and  sr_lineid = cline
            no-lock
            with frame a:
               {us/bbi/gprun.i ""worcat01.p""
                  "(input        recid(wo_mstr),
                    input        sr_site,
                    input        sr_loc,
                    input        sr_ref,
                    input        sr_lotser,
                    input        ip_effdate,
                    input        sr_qty,
                    input-output chg_assay,
                    input-output chg_grade,
                    input-output chg_expire,
                    input-output chg_status,
                    input-output assay_actv,
                    input-output grade_actv,
                    input-output expire_actv,
                    input-output status_actv,
                    output       trans_ok)"}
 
               if not trans_ok
               then do with frame a:
                  srlot = sr_lotser.
                  if sr_ref <> ""
                  then
                     srlot = srlot + "/" + sr_ref.
                  /*ATTRIBUTES DO NOT MATCH LD_DET*/
                  if c-application-mode <> "API" then do:
                     {us/bbi/pxmsg.i &MSGNUM=2742 &ERRORLEVEL=4 &MSGARG1=srlot}
                     next-prompt site.
                  end. /* if c-application-mode <> "API" */
                  else do:
                     {us/bbi/pxmsg.i &MSGNUM=2742 &ERRORLEVEL=4 &MSGARG1=srlot &FIELDNAME=""site""}
                  end.
                  undo locloop, retry.
               end. /* IF NOT trans_ok */
            end. /* FOR EACH sr_wkfl */
         end. /* LOCLOOP */
 
         tot_units = total_lotserial_qty * conv + reject_qty * reject_conv.
 
         if ((total_lotserial_qty * conv > 0)
         and (reject_qty * reject_conv   < 0))
         or ((total_lotserial_qty * conv < 0)
         and (reject_qty * reject_conv   > 0))
         then do:
            /*"QUANTITY" AND "SCRAPPED QTY" MUST HAVE SAME SIGN (+/-)*/
            {us/bbi/pxmsg.i &MSGNUM=502 &ERRORLEVEL=3}
            reject_qty = 0.
            undo , retry.
         end. /* IF ((total_lotserial_qty * conv > 0) ... */
 
         /* CHECK FOR lotserial_qty ENTERED */
         if  (wo_qty_ord > 0
         and (wo_qty_comp + (total_lotserial_qty * conv)) < 0)
          or (wo_qty_ord < 0
         and (wo_qty_comp + (total_lotserial_qty * conv)) >  0)
         then do:
            /*REVERSE RCPT MAY NOT EXCEED PREV RCPT*/
            {us/bbi/pxmsg.i &MSGNUM=556 &ERRORLEVEL=3}.
            undo, retry.
         end. /* IF (wo_qty_ord > 0 ...  */
 
         if  (wo_qty_ord > 0
         and (wo_qty_rjct + (reject_qty * reject_conv)) < 0)
          or (wo_qty_ord < 0
         and (wo_qty_rjct + (reject_qty * reject_conv)) > 0)
         then do:
            /*REVERSE SCRAP QUANTITY MAY NOT EXCEED PREVIOUS SCRAP QUANTITY*/
            {us/bbi/pxmsg.i &MSGNUM=1373 &ERRORLEVEL=3}
            reject_qty = 0.
            undo, retry.
         end. /* IF (wo_qty_ord > 0 ...  */
 
         if c-application-mode <> "API" then
            display tot_units with frame a.
 
         do on error undo, retry on endkey undo mainloop, retry mainloop:
 
            if c-application-mode = "API" and retry then
              undo mainloop, leave mainloop.
 
            if c-application-mode <> "API" then do:
               update
                  is-doc
                  op_rmks
                  op_close_wo
               with frame a.
            end. /* if c-application-mode <> "API" */
            else do:
               assign
                  {us/mf/mfaidflt.i ttWOReceipts.isDoc      is-doc}
                  {us/mf/mfaidflt.i ttWOReceipts.rmks       op_rmks}
                  {us/mf/mfaidflt.i ttWOReceipts.closeWo    op_close_wo}.
               assign
                  is-doc:screen-value      = ttWOReceipts.isDoc
                  op_rmks:screen-value     = ttWOReceipts.rmks
                  op_close_wo:screen-value = string(ttWOReceipts.closeWo).
               assign
                  is-doc
                  op_rmks
                  op_close_wo.
            end.
 
 
            /*MAKE SURE THAT ALL JOINT ORDERS USE THE SAME COST SETS*/
 
            if  op_close_wo
            and ip_jp
            then do:
               /* All JOINT WOs WILL CLOSE */
               {us/bbi/pxmsg.i &MSGNUM=6554 &ERRORLEVEL=2}
 
               {us/bbi/gprun.i ""woavgck1.p""
                  "(input  wo_nbr,
                    output yn)"}
               if yn
               then do:
                  /*COST SET ASSIGN INCOMPLETE*/
                  if c-application-mode <> "API" then do:
                     {us/bbi/pxmsg.i &MSGNUM=6553 &ERRORLEVEL=3}
                  end. /* if c-application-mode <> "API" */
                  else do:
                     {us/bbi/pxmsg.i &MSGNUM=6553 &ERRORLEVEL=3 &FIELDNAME=""closeWo""}
                  end.
                  op_close_wo = no.
                  if c-application-mode <> "API" then
                     next-prompt op_close_wo with frame a.
                  undo, retry.
               end. /* IF yn */
            end. /* IF op_close_wo ... */
            if {us/gp/gpisapi.i} then do:
               if c-application-mode <> "API" then do:
                  next-prompt lotserial_qty with frame a.   
                  update lotserial_qty with frame a.
               end. /* if c-application-mode <> "API" */
            end.    
         end. /* DO ON ERROR ... */
 
         do on endkey undo mainloop, retry mainloop:
 
            if c-application-mode = "API" and retry then
              undo mainloop, leave mainloop.
 
            /* Identify context for QXtend */
            {us/gp/gpcontxt.i
            &STACKFRAG = 'wobkfli4,wobkfl'
            &FRAME = 'yn' &CONTEXT = 'LOTSER'}
            yn = yes.
 
            if c-application-mode <> "API" then do:
              /* DISPLAY LOTSERIALS BEING RECEIVED ? */
              {us/bbi/pxmsg.i &MSGNUM=359 &ERRORLEVEL=1 &CONFIRM=yn
                &CONFIRM-TYPE='LOGICAL'}
              /* Clear context for QXtend */
              {us/gp/gpcontxt.i
              &STACKFRAG = 'wobkfli4,wobkfl'
              &FRAME = 'yn'}
            end. /* if c-application-mode <> "API" */
            else do:
              yn=no.
            end.
 
            if yn 
            then do:
 
               for each sr_wkfl
                  no-lock
                  where sr_wkfl.sr_domain = global_domain
                   and  sr_userid = SessionUniqueID
                   and  sr_lineid = cline
               with frame sr width 80:
                  /* SET EXTERNAL LABELS */
                  setFrameLabels(frame sr:handle).
                  display
                     sr_site
                     sr_loc
                     sr_lotser
                     sr_ref
                     sr_qty.

                  /* DISPLAY NON-CONFORMING STATUS IF ATTRIBUTE EXISTS */
                  if can-find(first tt_attr_pfvalue
                     where tt_attr_pfvalue.tt_oid_attrpf_mstr = oid_sr_wkfl)
                  then do:
                     if sr_qty > 0 then do:
                        /* Check RCT Result against attribute specification */
                        {us/px/pxrun.i &PROC      ='validateAttrSpec'
                                       &PROGRAM   ='caatdxr.p'
                                       &HANDLE    = ph_caatdxr
                                       &PARAM     ="(input sr_wkfl.oid_sr_wkfl,
                                                     input-output table tt_attr_pfvalue by-reference)"
                                       &NOAPPERROR=true
                                       &CATCHERROR=true
                        }
                     end.
                     else do:
                        {us/px/pxrun.i &PROC      ='validateAttrSpec'
                                       &PROGRAM   ='caisxr.p'
                                       &HANDLE    = ph_caisxr
                                       &PARAM     ="(input sr_wkfl.oid_sr_wkfl,
                                                     input-output table tt_attr_pfvalue by-reference)"
                                       &NOAPPERROR=true
                                       &CATCHERROR=true
                        }
                     end.

                     if can-find (first tt_attr_pfvalue
                                  where tt_attr_pfvalue.tt_oid_attrpf_mstr = sr_wkfl.oid_sr_wkfl
                                  and tt_attr_pfvalue.tt_attrpfd_validate_result = no)
                     then do:
                        attrConformStatus =  getTermLabel("NON-CONFORMING", 14).
                     end.
                     else do:
                        attrConformStatus = getTermLabel("CONFORMING", 14).
                     end.

                     display attrConformStatus no-label.
                  end.
               end. /* FOR EACH sr_wkfl */
            end. /* IF yn */
         end. /* DO ON ENDKEY ... */
 
         do on endkey undo mainloop, retry mainloop:
 
            if c-application-mode = "API" and retry then
              undo mainloop, retry mainloop.
 
            /* Identify context for QXtend */
            {us/gp/gpcontxt.i
            &STACKFRAG = 'wobkfli4,wobkfl'
            &FRAME = 'yn' &CONTEXT = 'RECTINFO'}
            yn = yes.
 
            if c-application-mode <> "API" then do:
              /* "IS ALL INFO CORRECT?" */
              {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=yn
                &CONFIRM-TYPE='LOGICAL'}
              /* Clear context for QXtend */
              {us/gp/gpcontxt.i
              &STACKFRAG = 'wobkfli4,wobkfl'
              &FRAME = 'yn'}
            end. /* if c-application-mode <> "API" */
 
 
            if yn then do:
               if c-application-mode <> "API" then
                  hide frame sr.
 
               /* Global Shipping */
               if inv_mov <> "" and inv_mov <> ? then do:
                  empty temp-table tt_abs_shipper no-error.
                  create tt_abs_shipper.
                  assign
                     tt_abs_shipper.tt_shipper_id        = ""
                     tt_abs_shipper.tt_shipper_parent_id = ""
                     tt_abs_shipper.tt_shipper_from      = from_site
                     tt_abs_shipper.tt_shipper_to        = to_site
                     tt_abs_shipper.tt_shipper_item      = ""
                     tt_abs_shipper.tt_shipper_qty       = 0
                     tt_abs_shipper.tt_shipper_inv_mov   = inv_mov
                     tt_abs_shipper.tt_shipper_date      = ip_effdate
                     tt_abs_shipper.tt_shipper_format    = "df"
                     tt_abs_shipper.tt_shipper_order_nbr = ""
                     tt_abs_shipper.tt_shipper_line      = "0"
                     tt_abs_shipper.tt_shipper_fob       = ""
                     tt_abs_shipper.tt_shipper_carr_ref  = ""
                     tt_abs_shipper.tt_shipper_tr_mode   = ""
                     tt_abs_shipper.tt_shipper_veh_ref   = ""
                     tt_abs_shipper.tt_shipper_lotser    = lotserial
                     tt_abs_shipper.tt_shipper_loc       = location
                     tt_abs_shipper.tt_shipper_wt_um     = um
                     tt_abs_shipper.tt_shipper_ref       = string(lotref)
                     tt_abs_shipper.tt_shipper_wt_um_conv = conv
                     tt_abs_shipper.tt_shipper_cmt_index = wo_cmtindx.
 
                  for each sr_wkfl
                     where sr_domain = global_domain
                       and sr_userid = SessionUniqueID
                       and sr_lineid = cline no-lock:
                     create tt_abs_shipper.
                     assign
                        tt_abs_shipper.tt_shipper_id        = "1"
                        tt_abs_shipper.tt_shipper_parent_id = ""
                        tt_abs_shipper.tt_shipper_from      = from_site
                        tt_abs_shipper.tt_shipper_to        = to_site
                        tt_abs_shipper.tt_shipper_item      = wo_part
                        tt_abs_shipper.tt_shipper_qty       = sr_qty
                        tt_abs_shipper.tt_shipper_inv_mov   = inv_mov
                        tt_abs_shipper.tt_shipper_date      = ip_effdate
                        tt_abs_shipper.tt_shipper_format    = "df"
                        tt_abs_shipper.tt_shipper_order_nbr = wo_nbr
                        tt_abs_shipper.tt_shipper_line      = "1"
                        tt_abs_shipper.tt_shipper_fob       = ""
                        tt_abs_shipper.tt_shipper_carr_ref  = ""
                        tt_abs_shipper.tt_shipper_tr_mode   = ""
                        tt_abs_shipper.tt_shipper_veh_ref   = ""
                        tt_abs_shipper.tt_shipper_lotser    = sr_lotser
                        tt_abs_shipper.tt_shipper_loc       = location
                        tt_abs_shipper.tt_shipper_wt_um     = um
                        tt_abs_shipper.tt_shipper_ref       = sr_ref
                        tt_abs_shipper.tt_shipper_wt_um_conv = conv.
                  end.
 
                  if recid(tt_abs_shipper) = -1 then .
 
                  /* Get shipper id and legal document nbr */
                  {us/bbi/gprun.i ""gpshpgen.p""
                     "(input-output table tt_abs_shipper,
                       input  inv_mov,
                       input  c_form_code,
                       input  c_ld_form_code,
                       output c_ld_nbr,
                       output shipnbr,
                       output v_abs_recid,
                       output l_undo,
                       output o_trflow_flg)"}
 
                  /* If transaction happens in same site, different
                     locations, set original site value to abs_site */
                  for first abs_mstr where recid(abs_mstr) = v_abs_recid
                  exclusive-lock:
                     assign
                        abs_site = site.
                  end.
 
                  /* Complement Salejob and remarks for legal document */
                  {us/bbi/gprun.i ""icshldm1.p""
                     "(input v_abs_recid,
                       input '',
                       input op_rmks)"}
 
                  /* If the transaction flow is not internal,
                     then print legal document*/
                  if o_trflow_flg = yes then do:
                     /* Save site(from/to) and location(from/to) values to lgd_mstr */
                     {us/gp/gprunp.i "soldxr" "p" "saveLegalSiteLoc"
                               "(input abs_id,
                                 input wo_site,
                                 input wr_wkctr,
                                 input site,
                                 input location)"}
 
                     /* Print Legal Document */
                     {us/bbi/gprun.i ""icldprt.p"" "(input v_abs_recid)"}
                  end.
               end. /* END - if inv_mov <> "" and inv_mov <> */
 
               leave setd.
            end. /* END - if yn then do */
 
         end. /* DO ON ENDKEY ... */
      end.  /*END - setd*/
 
      if conv <> 1
      then
         for each sr_wkfl
            exclusive-lock
            where sr_wkfl.sr_domain = global_domain
             and  sr_userid = SessionUniqueID
             and  sr_lineid = cline:
            sr_qty = sr_qty * conv.
         end. /* FOR EACH sr_wkfl */
      total_lotserial_qty = total_lotserial_qty * conv.
 
      assign
         wo_qty_chg  = total_lotserial_qty
         wo_doc_id   = is-doc
         wo_rjct_chg = reject_qty * reject_conv
         op_undo_all = no
      .
   end. /* MAINLOOP */
 
   /* Get the record from the API controller */
   if c-application-mode = "API" then do:
      run getNextRecord in apiMethodHandle (input "ttWOReceipts").
   end. /* if c-application-mode = "API" */
 
 
   if c-application-mode <> "API" then
    hide frame sr no-pause.
   op_conv = conv.
 
 
