/* xxscintr.p - COPY OF icintr.p FOR SCRAP INVENTORY TRANSACTIONS             */
/* icscintr.p - COPY OF icintr.p FOR SCRAP INVENTORY TRANSACTIONS             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxscintr.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
 
/* Revision: 1.3         BY: Hitendra PV          DATE: 07/20/06  ECO: *R07B* */
/* Revision: 1.4         BY: Katie Hilbert        DATE: 11/27/06  ECO: *R0BW* */
/* Revision: 1.5         BY: Alok Gupta           DATE: 12/14/06  ECO: *R0C8* */
/* Revision: 1.6         BY: Sameer Lodha         DATE: 04/13/07  ECO: *R0C6* */
/* Revision: 1.7         BY: Neil Curzon          DATE: 03/10/08  ECO: *R0P6* */
/* Revision: 1.8         BY: Jean Miller         DATE: 06/15/08  ECO: *R0V6* */
/* $Revision: 1.2 $  BY: Sandeep Rohila    DATE: 08/10/09  ECO: *Q35K* */
/* CYB    LAST MODIFIED: 31-MAY-2010    BY:  gbg *cy1016*                    */
/* CYB    LAST MODIFIED: 13-MAY-2011    BY:  gbg *c1214*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* THIS PROGRAM IS PART OF THE SCRAP TRANSACTION FUNCTIONALITY WHICH PROVIDES */
/* CAPABILITY TO SCRAP MATERIAL AT THE PART NUMBER LEVEL WITH DETAILS OF      */
/* QUANTITIES AND REASON CODES WITH A UNIQUE TRANSACTION (ISS-SCRP) CREATED   */
/* FOR SCRAP                                                                  */
 
/* Type of transaction:  "RCT-UNP" (unplanned receipts)                       */
/*                       "RCT-SOR" (s.o. returns)                             */
/*                       "RCT-RS"  (return to stock)                          */
/*                       "RCT-WO"  (unplanned receipts backward exploded)     */
/*                       "ISS-UNP" (unplanned isue)                           */
/*                       "ISS-RV"  (return to vendor)                         */
/*                       "ISS-PRV" (PO rtn to vendor)                         */
 
/* DISPLAY TITLE */
{us/mf/mfdtitle.i "3+ "}
{us/gp/gpuid.i}
 
{us/mf/mfaititl.i} /* SUPPRESS DISPLAY OF SCREEN TITLE IN API MODE */
 
{us/px/pxmaint.i}
{us/px/pxphdef.i ppitxr}
 
define new shared variable yn like mfc_logical.
define new shared variable part like tr_part.
define new shared variable um like pt_um no-undo.
define new shared variable conv like um_conv label "Conversion" no-undo.
define new shared variable ref like glt_ref.
define new shared variable eff_date like glt_effdate label "Effective".
define new shared variable trlot like tr_lot.
define new shared variable qty_loc like tr_qty_loc.
define new shared variable qty_loc_label as character format "x(12)".
define new shared variable issrct as character format "x(3)".
define new shared variable issuereceipt as character format "x(7)".
define new shared variable unit_cost like tr_price label "Unit Cost".
define new shared variable total_amt like tr_gl_amt label "Total Cost".
define new shared variable ordernbr like tr_nbr.
define new shared variable orderline like tr_line.
define new shared variable so_job like tr_so_job.
define new shared variable addr like tr_addr.
define new shared variable rmks like tr_rmks.
define new shared variable serial like tr_serial.
define new shared variable dr_acct like trgl_dr_acct.
define new shared variable dr_sub like trgl_dr_sub.
define new shared variable dr_cc like trgl_dr_cc.
define new shared variable cr_acct like trgl_cr_acct.
define new shared variable cr_sub like trgl_cr_sub.
define new shared variable cr_cc like trgl_cr_cc.
define new shared variable trqty like tr_qty_loc.
define new shared variable i as integer.
define new shared variable tot_units as character format "x(16)".
define new shared variable del-yn like mfc_logical initial no.
define new shared variable null_ch as character initial "".
define new shared variable reject_qty_label as character format "x(11)".
define new shared variable qty_reject like tr_qty_loc.
define new shared variable qty_iss_rcv like qty_loc.
define new shared variable pt_recid as recid.
define new shared variable project like wo_proj no-undo.
DEFINE NEW SHARED variable projectcr LIKE wo_proj no-undo.
define new shared variable multi_entry like mfc_logical label "Multi Entry"
   no-undo.
define new shared variable lotserial_control as character.
define new shared variable cline as character.
define new shared variable issue_or_receipt as character.
define new shared variable site like sr_site no-undo.
define new shared variable location like sr_loc no-undo.
define new shared variable lotserial like sr_lotser no-undo.
define new shared variable lotserial_qty like sr_qty no-undo.
define new shared variable total_lotserial_qty like sr_qty label "Total Qty".
define new shared variable trans_um like pt_um.
define new shared variable trans_conv like sod_um_conv.
define new shared variable lotref like sr_ref format "x(8)" no-undo.
define new shared variable tr_recno as recid.
 
define new shared variable l_rsncode like rsn_code no-undo.
define new shared variable l_multi_entry like mfc_logical
                                         label "Multi Reason" no-undo.
define new shared variable l_new         like mfc_logical no-undo.
 
define new shared variable rsn_codes    as   character   extent 10.
define new shared variable quantities   like wr_qty_comp extent 10.
 
define shared variable transtype as character format "x(7)" no-undo.
 
define variable undostat like mfc_logical no-undo.
define variable l_so_job like tr_so_job   no-undo.
define variable l_lotserqty like sr_qty   no-undo.
 
define variable lotum as character.
define variable dr_desc like ac_desc format "x(23)".
define variable cr_desc like ac_desc format "x(23)".
define variable dr_proj like wo_proj.
define variable cr_proj like wo_proj.
 
define variable valid_acct  like mfc_logical.
define variable undo-input  like mfc_logical.
define variable lotnext     like wo_lot_next .
define variable lotprcpt    like wo_lot_rcpt no-undo.
define variable error-found like mfc_logical.
define variable total_amt_fmt as character.
define variable shipnbr     like tr_ship_id no-undo.
define variable inv_mov     like tr_ship_inv_mov no-undo.
define variable ship_date   like tr_ship_date no-undo.
define variable gl-site     like in_site   no-undo.
define variable gl-set      like in_gl_set no-undo.
 
define variable dftPURAcct       like pl_pur_acct no-undo.
define variable dftPURSubAcct    like pl_pur_sub  no-undo.
define variable dftPURCostCenter like pl_pur_cc   no-undo.
define variable dftFLRAcct       like pl_flr_acct no-undo.
define variable dftFLRSubAcct    like pl_flr_sub  no-undo.
define variable dftFLRCostCenter like pl_flr_cc   no-undo.
define variable dftCOPAcct       like pl_cop_acct no-undo.
define variable dftCOPSubAcct    like pl_cop_sub  no-undo.
define variable dftCOPCostCenter like pl_cop_cc   no-undo.
 
define variable l_acct           like pl_pur_acct no-undo.
define variable l_sub            like pl_pur_sub  no-undo.
define variable l_cc             like pl_pur_cc   no-undo.
define variable l_empname        like ad_name     no-undo.

/*c1214*/ def new shared var v_user1        as char format "x(8)".
/*c1214*/ def new shared var v_user2        as char format "x(8)".
/*c1214a*/ def new shared var v_user3        as char format "x(65)".
 
/* CONSIGNMENT VARIABLES. */
{us/so/socnvars.i}
 
define variable consigned_line             like mfc_logical  no-undo.
 
/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}
/* INVENTORY CONTROL API TEMP-TABLE */
{us/ic/icicit01.i}
 
 
{us/gp/gpglefv.i}
{us/gp/gprunpdf.i "gpglvpl" "p"}
 
if c-application-mode = "API"
then do:
 
   /* GET HANDLE OF API CONTROLLER */
   {us/bbi/gprun.i ""gpaigh.p""
            "(output apiMethodHandle,
              output apiProgramName,
              output apiMethodName,
              output apiContextString)"}
 
   /* GET TRANSACTION DETAIL TEMP-TABLE */
   run getInventoryTransDet in apiMethodHandle
      (output table ttInventoryTransDet).
 
   /* GET TRANSACTION RECORD FROM TEMP-TABLE
    * (ONLY THE FIRST RECORD IS PROCESSED)
    */
   run getInventoryTransRecord in apiMethodHandle
      (buffer ttInventoryTrans).
   assign
      transtype   = ttInventoryTrans.transType.
 
end. /* IF c-application-mode = "API" */
 
 
/*d2101* start deleted code  >>>>>>>>>
form
   pt_part             colon 17
   pt_lot_ser          colon 57
   pt_um
   pt_desc1            colon 17
   pt_desc2            at 19    no-label
   lotserial_qty       colon 17
   l_rsncode           colon 45
   l_multi_entry       colon 71
   um                  colon 17
   site                colon 57
   conv                colon 17
   location            colon 57
   lotserial           colon 57
   lotref              colon 57
   multi_entry         colon 57
   unit_cost           colon 17
   total_lotserial_qty colon 57 format "->>>,>>>,>>9.9<<<<<<<<<"
   ordernbr            colon 17
   total_amt           colon 57
   orderline           colon 17
   l_so_job            colon 17
   addr                colon 17 l_empname colon 30 no-label
   rmks                colon 17
   eff_date            colon 17
   dr_acct             colon 17
   dr_sub              no-label
   dr_cc               no-label
   dr_proj             no-label
   dr_desc             no-label
   cr_acct             colon 17
   cr_sub              no-label
   cr_cc               no-label
   cr_proj             no-label
   cr_desc             no-label
with frame a side-labels width 80 .
*d2101* end   deleted code  <<<<<<<<<<<<<<< */
/*d2101* start added code >>>>   */
form
   pt_part             colon 17
   pt_lot_ser          colon 57
   pt_um
   pt_desc1            colon 17
   pt_desc2            at 19    no-label
   lotserial_qty       colon 17
   l_rsncode           colon 45
   l_multi_entry       colon 71
   um                  colon 17
   site                colon 57
   conv                colon 17
   location            colon 57
   lotserial           colon 57
   lotref              colon 57
   unit_cost           colon 17
   multi_entry         colon 57
   ordernbr            colon 17
   total_lotserial_qty colon 57 format "->>>,>>>,>>9.9<<<<<<<<<"
   orderline           colon 17
   total_amt           colon 57
   l_so_job            colon 17
   v_user1      colon 30 no-label
   addr                colon 17 l_empname colon 30 no-label
   rmks                colon 17
   v_user2      colon 30 no-label
   eff_date            colon 17
   v_user3      colon 10 no-label
   dr_acct             colon 17
   dr_sub              no-label
   dr_cc               no-label
   dr_proj             no-label
   dr_desc             no-label
   cr_acct             colon 17
   cr_sub              no-label
   cr_cc               no-label
   cr_proj             no-label
   cr_desc             no-label
with frame a side-labels width 80 attr-space.
/*d2101* end   added code <<<<<  */
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
if transtype = "ISS-RV"
then do:
 
   if can-find(first po_mstr
               where po_domain = global_domain
               and   po_nbr   >= "")
   then do:
 
      /* Use PO RTS Issue */
      {us/bbi/pxmsg.i &MSGNUM=350 &ERRORLEVEL=2}
      pause.
      leave.
 
   end. /* IF CAN-FIND ... */
end. /* IF transtype = "ISS-RV" */
 
issrct = substring(transtype,1,3).
 
if issrct = "RCT"
then
   issue_or_receipt = getTermLabel("RECEIPT",8).
else
   issue_or_receipt = getTermLabel("ISSUE",8).
 
assign
   lotnext = ""
   lotprcpt = no.
 
{us/bbi/gprun.i ""socrshc.p""}
for first shc_ctrl
   fields (shc_domain)
   where shc_domain = global_domain
no-lock.
end. /* FOR FIRST shc_ctrl */
 
mainloop:
repeat:
 
   assign
      lotserial_qty       = 1.00
      l_rsncode           = ""
      um                  = ""
      site                = ""
      location            = ""
      lotserial           = ""
      lotref              = ""
      unit_cost           = 0.00
      total_lotserial_qty = 0.00
      ordernbr            = ""
      total_amt           = 0.00
      orderline           = 0
      l_so_job            = ""
      addr                = ""
      rmks                = ""
      eff_date            = ?
      dr_acct             = ""
      dr_sub              = ""
      dr_cc               = ""
      dr_proj             = ""
      dr_desc             = ""
      cr_acct             = ""
      cr_sub              = ""
      cr_cc               = ""
      cr_proj             = ""
      cr_desc             = ""
      l_empname             = ""
      l_lotserqty         = 0.0.

/*c1214*/ v_user1 = "".
/*c1214*/ v_user2 = "".
/*c1214*/ v_user3 = "".
 
   display
      lotserial_qty
      l_rsncode
      um
      site
      location
      lotserial
      lotref
      unit_cost
      total_lotserial_qty
      ordernbr
      total_amt
      orderline
      l_so_job
      addr
      l_empname
      rmks
      eff_date
      dr_acct
      dr_sub
      dr_cc
      dr_proj
      dr_desc
      cr_acct
      cr_sub
      cr_cc
      cr_proj
      cr_desc
/*c1214*/ v_user1
/*c1214*/ v_user2
/*c1214*/ v_user3
   with frame a .
 
   /* DO NOT RETRY WHEN PROCESSING API REQUEST */
   if retry and c-application-mode = "API"
   then
      return error return-value.
 
   do transaction:
 
      for each sr_wkfl
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
      exclusive-lock:
         delete sr_wkfl.
      end. /* FOR EACH sr_wkfl */
 
      {us/bbi/gprun.i ""gplotwdl.p""}
 
   end. /* DO TRANSACTION */
 
   l_new = yes.
 
   /* DO NOT ACCESS UI WHEN PROCESSING API REQUEST */
   if c-application-mode <> "API"
   then
      prompt-for pt_part with frame a no-validate
   editing:
 
      /* FIND NEXT/PREVIOUS RECORD */
      {us/mf/mfnp.i pt_mstr pt_part  "pt_domain = global_domain and pt_part"
              pt_part pt_part pt_part}
 
      if recno <> ?
      then
         display
            pt_part
            pt_desc1
            pt_um
            pt_lot_ser
            pt_desc2
         with frame a.
 
   end. /* IF c-application-mode <> "API" */
 
   status input.
 
   /* DO NOT ACCESS UI WHEN PROCESSING API REQUEST */
   if c-application-mode = "API"
   then
      assign
         total_lotserial_qty = 0
         total_amt = 0.
   else
      display
         "" @ total_lotserial_qty
         "" @ total_amt
      with frame a.
 
   if c-application-mode = "API"
   then
      for first pt_mstr
         where  pt_domain = global_domain
         and    pt_part   = ttInventoryTrans.part
      no-lock.
      end. /* FOR FIRST pt_mstr */
   else
      for first pt_mstr
         where  pt_domain = global_domain
         and    pt_part   = input pt_part
      no-lock.
      end. /* FOR FIRST pt_mstr */
   if not available pt_mstr
   then do:
 
      /* Item is not available */
      {us/bbi/pxmsg.i &MSGNUM=16 &ERRORLEVEL=3}
      undo, retry.
   end. /* IF NOT AVAILABLE pt_mstr */
 
   assign
      pt_recid = recid(pt_mstr)
      um = pt_um
      conv = 1.
 
   if eff_date = ? then eff_date = today.
 
   for first pl_mstr
      fields(pl_domain pl_prod_line)
      where pl_domain    = global_domain
      and   pl_prod_line = pt_prod_line
   no-lock.
   end. /* FOR FIRST pl_mstr */
 
   do transaction:
      /* GET NEXT LOT */
      {us/mf/mfnxtsq.i  "wo_domain = global_domain and "
                  wo_mstr wo_lot woc_sq01 trlot}
   end. /* DO TRANSACTION */
 
   /* SET GLOBAL PART VARIABLE */
   assign
      global_part = pt_part
      part        = pt_part
      um          = pt_um
      conv        = 1.
 
   /* DO NOT ACCESS UI WHEN PROCESSING API REQUEST */
   if c-application-mode <> "API"
   then
      display
         pt_part
         pt_lot_ser
         pt_um
         pt_desc1
         pt_desc2
         um
         conv
      with frame a.
 
   assign
      total_lotserial_qty = 0
      lotserial_control = pt_lot_ser.
 
   setd:
   repeat on endkey undo mainloop, retry mainloop:
 
      assign
         site = ""
         location = ""
         lotserial = ""
         lotref = ""
         cline = ""
         global_part = pt_part
         i = 0
         multi_entry = no
         l_multi_entry = no.
 
      for each sr_wkfl
         fields(sr_domain sr_userid sr_lineid sr_site
                sr_loc    sr_rev    sr_ref    sr_lotser
                sr_qty    sr__qadc01)
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
         and   sr_lineid = cline
      no-lock:
 
         i = i + 1.
         if i > 1 then leave.
 
      end. /* FOR EACH sr_wkfl */
 
      if i = 0 and available pt_mstr
      then do:
         for first si_mstr 
            where si_domain = global_domain
            and   si_site   = pt_site
         no-lock: 
            {us/px/pxrun.i &PROC = 'readInventoryDetail' &PROGRAM = 'ppitxr.p'
                           &HANDLE     = ph_ppitxr
                           &PARAM      = "(input  pt_mstr.oid_pt_mstr,
                                           input  si_mstr.oid_si_mstr,
                                           buffer pti_det)"
                           &NOAPPERROR = true
                           &CATCHERROR = true
            }
         end. /* FOR FIRST si_mstr */
 
         assign
            site     = pt_site
            location = if available pti_det 
                       then 
                          pti_loc
                       else
                          pt_loc.
      end. /* IF i = 0 and .. */
 
      else
      if i = 1
      then do:
 
         for first sr_wkfl
            fields(sr_domain sr_lineid sr_loc  sr_lotser sr_qty
                   sr_ref    sr_rev    sr_site sr_userid sr__qadc01)
            where sr_domain = global_domain
            and   sr_userid = SessionUniqueID
            and   sr_lineid = cline
         no-lock.
         end. /* FOR FIRST sr_wkfl */
 
            assign
               site      = sr_site
               location  = sr_loc
               lotserial = sr_lotser
               lotref    = sr_ref.
 
      end. /* IF i = 1 */
 
      do on error undo, retry on endkey undo mainloop, retry mainloop:
 
         /* DO NOT RETRY WHEN PROCESSING API REQUEST */
         if retry and c-application-mode = "API"
            then return error return-value.
         /* DO NOT ACCESS UI WHEN PROCESSING API REQUEST */
         if c-application-mode = "API"
         then do:
           /*
            * SUM TOTAL QUANTITY FROM LOT/SERIAL DETAIL
            */
            ACCUM-LOOP:
            for each ttInventoryTransDet
            no-lock:
 
               accumulate ttInventoryTransDet.qty (count).
               if (Accum count ttInventoryTransDet.qty) > 1
               then do:
 
                  multi_entry = yes.
                  leave ACCUM-LOOP.
 
               end. /* IF (ACCUM ... */
            end. /* FOR EACH ttInventoryTransdet */
 
            find first ttInventoryTransDet
            no-lock no-error.
            if not available ttInventoryTransDet
            then do:
 
               /* INVALID DATA PASSED */
               {us/bbi/pxmsg.i &MSGNUM=1960 &ERRORLEVEL=4}
 
            end. /* IF NOT AVAILABLE ... */
            else
               assign
                  {us/mf/mfaiset.i lotserial_qty ttInventoryTransDet.qty}
                  {us/mf/mfaiset.i um ttInventoryTrans.um}
                  {us/mf/mfaiset.i conv ttInventoryTrans.conv}
                  {us/mf/mfaiset.i site ttInventoryTransDet.site}
                  {us/mf/mfaiset.i location ttInventoryTransDet.loc}
                  {us/mf/mfaiset.i lotserial ttInventoryTransDet.lotSer}
                  {us/mf/mfaiset.i lotref ttInventoryTransDet.ref}
                  {us/mf/mfaiset.i multi_entry yes} .
            /*
             * SET CURRENT POSITION TO FIRST RECORD FOR
             * SUB-PROGRAM ACCESS
             */
            run setInventoryTransDetRow
               in apiMethodHandle (input ?).
         end. /* IF c-application-mode = "API" */
 
         else /* IF c-application-mode <> "API" */
            update
               lotserial_qty
               l_rsncode
               l_multi_entry
               um
               conv
               site
               location
               lotserial
               lotref
               multi_entry
            with frame a
         editing:
            global_site = input site.
            global_loc = input location.
            global_lot = input lotserial.
            readkey.
            apply lastkey.
         end. /* EDITING */
 
         /* VALIDATE REASON CODE AGAINST VALUES EXISTING */
         /* IN rsn_ref WITH rsn_type AS "SCRAP" HERE IF  */
         /* NOT l_multi_entry AND NOT multi_entry        */
         if not l_multi_entry
            and not multi_entry
            and lotserial_qty <> 0
         then do:
 
            for first rsn_ref
               fields(rsn_domain rsn_type rsn_code)
               where rsn_domain = global_domain
               and   rsn_type   = "scrap"
               and   rsn_code   = l_rsncode
               no-lock:
            end. /* FOR FIRST rsn_ref */
 
            if not available rsn_ref
            then do:
 
               /* REASON CODE DOES NOT EXIST */
               {us/bbi/pxmsg.i &MSGNUM=534 &ERRORLEVEL=3}
               next-prompt
                  l_rsncode
               with frame a.
               undo, retry.
 
            end. /* IF NOT AVAILABLE rsn_ref  */
 
         end. /* IF NOT l_multi_entry */
 
         if um <> pt_um
         then do:
 
            if not conv entered
            then do:
 
               {us/bbi/gprun.i ""gpumcnv.p""
                  "(input um, input pt_um, input pt_part, output conv)"}
               if conv = ?
               then do:
 
                  {us/bbi/pxmsg.i &MSGNUM=33 &ERRORLEVEL=2}
                  /* NO UOM CONVERSION EXISTS */
                  conv = 1.
 
               end. /* IF conv = ? */
 
               /* DO NOT ACCESS UI WHEN PROCESSING API REQUEST */
               if c-application-mode <> "API"
               then
                  display conv with frame a.
 
            end. /* IF NOT CONV ENTERED */
         end. /* IF um <> pt_um */
 
         for first in_mstr
            fields(in_domain in_part in_site in_gl_set
                   in_gl_cost_site in_cur_set)
            where in_domain = global_domain
            and   in_part   = pt_part
            and   in_site   = site
         no-lock.
         end. /* FOR FIRST in_mstr */
 
         /* GPSCT03.I LOOKS FOR IN_MSTR AND GETS THE COST, IF */
         /* IT IS NOT AVAILABLE, VALUES OF 0.00 ARE RETURNED. */
         /* IF NOT AVAIABLE,IN_MSTR IS CREATED LATER IN THIS  */
         /* PROGRAM.                                          */
         /* WITH LINKED SITE COSTING,IF THE SELECTED ITEM AND */
         /* SITE ARE LINKED TO ANOTHER SITE,I.E.IF A LINKING  */
         /* RULE EXIST FOR SELECTED SITE, THEN IN_MSTR IS     */
         /* CREATED WITH THE LINK. (I.E. IN_GL_COST SITE =    */
         /* SOURCE SITE AND IN_GL_SET = SOURCE GL COST SET.)  */
         /* THEREFORE FOR LINKED SITES THE UNIT COST RETRIEVED*/
         /* HERE SHOULD BE THE COST AT THE SOURCE SITE .      */
         /* TO AVOID CHANGING THE IN_MSTR CREATION TIMING WE  */
         /* FIND THE SOURCE SITE AND GET THE COST AT THAT SITE*/
 
         gl-site = site.
 
         if not available in_mstr
         then do:
            /* SITE VALIDATION IS DONE LATER IN THE PROGRAM. WE */
            /* NEED TO MAKE SURE si_mstr is AVAILABLE BEFORE    */
            /* CALLING gpingl.p.                                */
            for first si_mstr
               where si_domain = global_domain
               and   si_site   = site
            no-lock:
            end. /* FOR FIRST si_mstr */
            if available si_mstr
            then
               {us/bbi/gprun.i ""gpingl.p""
                        "(input  site,
                          input  pt_part,
                          output gl-site,
                          output gl-set)"}
            for first in_mstr
               fields(in_domain in_part in_site in_gl_set
                      in_gl_cost_site in_cur_set)
               where in_domain = global_domain
               and   in_part   = pt_part
               and   in_site   = gl-site
            no-lock:
            end. /* FOR FIRST in_mstr */
 
         end. /* IF NOT AVAILABLE IN_MSTR */
 
         if    transtype = "ISS-RV"
            or transtype = "ISS-PRV"
         then do:
            {us/gp/gpsct03.i &cost=sct_mtl_tl}
         end. /* IF transtype = "ISS-RV" ... */
         else do:
            {us/gp/gpsct03.i &cost=sct_cst_tot}
         end. /* ELSE */
 
         unit_cost = glxcst.
 
         i = 0.
         for each sr_wkfl
            fields(sr_domain sr_userid sr_lineid sr_site
                   sr_loc    sr_lotser sr_rev    sr_ref
                   sr_qty    sr__qadc01)
            where sr_domain = global_domain
            and   sr_userid = SessionUniqueID
            and   sr_lineid = cline
         no-lock:
 
            i = i + 1.
            if i > 1
            then do:
               multi_entry = yes.
               leave.
 
            end. /* IF i > 1 */
         end. /* FOR EACH sr_wkfl */
 
         trans_um = um.
         trans_conv = conv.
 
         if multi_entry
         then do:
 
            if i >= 1
            then do:
 
               site      = "".
               location  = "".
               lotserial = "".
               lotref    = "".
 
            end. /* IF i >= 1 */
 
            /* ADDED SIXTH INPUT PARAMETER AS NO */
            {us/bbi/gprun.i ""icscsrup.p""
               "(input ?,
                 input """",
                 input """",
                 input-output lotnext,
                 input lotprcpt,
                 input no)"}
 
            lotserial_qty = total_lotserial_qty.
            display lotserial_qty with frame a.
 
         end. /* IF multi_entry */
 
         if l_multi_entry
            and not multi_entry
         then do:
 
            {us/bbi/gprun.i ""icedit.p""
               "(transtype,
                 site,
                 location,
                 part,
                 lotserial,
                 lotref,
                 lotserial_qty * trans_conv,
                 trans_um,
                 """",
                 """",
                 output undo-input)"}
 
            if undo-input
            then
               undo, retry.
 
            if lotserial_control = "S"
               or lotserial_control = "L"
            then do:
 
               l_multi_entry = no.
 
            end. /* IF lotserial_control  = "S" ... */
            else do:
 
            /* QUANTITY AND REASON CODE MULTIPLE ENTRY */
            {us/bbi/gprun.i ""icscrsn.p""
                     "(input ""scrap"",
                       input getFrameTitle(""SCRAP"",8),
                       output undostat,
                       output l_lotserqty)}
 
               total_lotserial_qty = l_lotserqty.
 
            display lotserial_qty total_lotserial_qty with frame a.
 
            if undostat
            then
               undo, retry.
 
            end. /* ELSE DO */
 
         end. /* IF l_multi_entry AND NOT multi_entry */
 
         if not l_multi_entry
            and not multi_entry
         then do:
 
            if lotserial_qty  = 0.00
            then do:
 
               /* SCRAP QUANITY CANNOT BE ZERO */
               {us/bbi/pxmsg.i &MSGNUM=7093 &ERRORLEVEL=3}
               next-prompt
                  lotserial_qty
               with frame a.
               undo , retry .
            end. /* IF lotserial_qty = 0.00 */
 
            {us/bbi/gprun.i ""icedit.p""
               "(transtype,
                 site,
                 location,
                 part,
                 lotserial,
                 lotref,
                 lotserial_qty * trans_conv,
                 trans_um,
                 """",
                 """",
                 output undo-input)"}
 
            if undo-input
            then
               undo, retry.
 
            for first sr_wkfl
               fields(sr_domain sr_lineid sr_loc sr_lotser
                      sr_qty    sr_ref    sr_rev sr_site
                      sr_userid sr__qadc01)
               where sr_domain = global_domain
               and   sr_userid = SessionUniqueID
               and   sr_lineid = cline
            no-lock.
            end. /* FOR FIRST sr_wkfl */
 
            if lotserial_qty = 0
            then do:
 
               if available sr_wkfl
               then do:
 
                  total_lotserial_qty = total_lotserial_qty - sr_qty.
                  delete sr_wkfl.
 
               end. /* IF AVAILABLE sr_wkfl */
            end. /* IF lotserial_qty = 0   */
 
            else do:
 
               if available sr_wkfl
               then do:
 
                  assign
                     total_lotserial_qty = total_lotserial_qty - sr_qty
                                           + lotserial_qty
                     sr_site             = site
                     sr_loc              = location
                     sr_lotser           = lotserial
                     sr_ref              = lotref
                     sr_qty              = lotserial_qty.
 
               end. /* IF AVAILABLE sr_wkfl */
 
               else do:
 
                  create sr_wkfl.
                  assign
                     sr_domain  = global_domain
                     sr_userid  = SessionUniqueID
                     sr_lineid  = cline
                     sr_site    = site
                     sr_loc     = location
                     sr_lotser  = lotserial
                     sr_ref     = lotref
                     sr_qty     = lotserial_qty
                     sr__qadc01 = l_rsncode.
 
                  if recid(sr_wkfl) = -1 then .
 
                  total_lotserial_qty = total_lotserial_qty + lotserial_qty.
 
               end. /* ELSE DO */
 
            end. /* ELSE DO */
 
         end. /* IF NOT l_multi_entry AND NOT multi_entry */
 
      end. /* yet to add comment */
 
 
      /* DO NOT ACCESS UI WHEN PROCESSING API REQUEST */
      if c-application-mode <> "API"
      then do:
 
         display
            total_lotserial_qty
            "" @ total_amt
         with frame a.
 
      end. /* IF c-application-mode <> "API" */
 
      unit_cost = unit_cost * conv.
 
      run getGLDefaults.
      run getPurchaseAccountDefaults.
 
      if issrct = "RCT"
      then do:
 
         assign
            dr_acct = ""
            dr_sub = ""
            dr_cc = ""
            dr_proj = ""
            dr_desc = "".
 
         if transtype = "RCT-SOR"
         then do:
 
            for first gl_ctrl
              fields(gl_domain gl_rtns_acct gl_rtns_sub gl_rtns_cc
                     gl_rnd_mthd)
              where gl_domain = global_domain
            no-lock.
            end. /* FOR FIRST gl_ctrl */
 
                assign
                   cr_acct = gl_rtns_acct
                   cr_sub  = gl_rtns_sub
                   cr_cc   = gl_rtns_cc.
 
         end. /* IF transtype = "RCT-SOR" */
 
         else
         if transtype = "RCT-UNP"
         then do:
            assign
               cr_acct = dftPURAcct
               cr_sub  = dftPURSubAcct
               cr_cc   = dftPURCostCenter.
         end. /* IF transtype = "RCT-UNP" */
 
         else
         if transtype = "RCT-RS"
         then do:
 
            for first ptp_det
               fields(ptp_domain ptp_part ptp_site ptp_iss_pol)
               where ptp_domain = global_domain
               and   ptp_part   = pt_part
               and   ptp_site   = in_site
            no-lock.
            end. /* FOR FIRST ptp_det */
 
            if ((available ptp_det
                  and ptp_iss_pol = no)
               or (not available ptp_det
                   and available pt_mstr
                   and pt_iss_pol = no))
            then do:
               assign
                  cr_acct = dftFLRAcct
                  cr_sub  = dftFLRSubAcct
                  cr_cc   = dftFLRCostCenter.
            end. /* IF ((AVAILABLE ptp_det ... */
 
            else do:
               assign
                  cr_acct = dftCOPAcct
                  cr_sub  = dftCOPSubAcct
                  cr_cc   = dftCOPCostCenter.
            end. /* ELSE */
 
         end. /* IF transtype = "RCT-RS" */
 
         for first ac_mstr
            fields(ac_domain ac_code ac_desc)
            where ac_domain = global_domain
            and   ac_code   = cr_acct
         no-lock.
         end. /* FOR FIRST ac_mstr */
 
         if available ac_mstr
         then
            cr_desc = ac_desc.
         else
            cr_desc = "".
      end.
 
      else
      if issrct = "ISS"
      then do:
 
         assign
            cr_acct = ""
            cr_sub = ""
            cr_cc = ""
            cr_proj = ""
            cr_desc = "".
 
         if    transtype = "ISS-RV"
            or transtype = "ISS-PRV"
         then do:
 
            assign
               dr_acct = dftPURAcct
               dr_sub  = dftPURSubAcct
               dr_cc   = dftPURCostCenter.
 
         end. /* IF issrct = "RCT" */
 
         else
         if transtype = "ISS-UNP"
         then do:
 
            for first ptp_det
               fields(ptp_domain ptp_part ptp_site ptp_iss_pol)
               where ptp_domain = global_domain
               and   ptp_part   = pt_part
               and   ptp_site   = in_site
            no-lock.
            end. /*FOR FIRST ptp_det */
 
            if ((available ptp_det
                 and ptp_iss_pol = no)
               or (not available ptp_det
                   and available pt_mstr
                   and pt_iss_pol = no))
            then do:
 
               assign
                  dr_acct = dftFLRAcct
                  dr_sub  = dftFLRSubAcct
                  dr_cc   = dftFLRCostCenter.
 
            end. /* if ((available ptp_det ... */
 
            else do:
 
               assign
                  dr_acct = dftCOPAcct
                  dr_sub  = dftCOPSubAcct
                  dr_cc   = dftCOPCostCenter.
            end. /* ELSE */
 
         end. /* else if transtype = "ISS-UNP" */
 
         /* FIND ACCOUNT CODES FOR TRANSACTION TYPE ISS-SCRP */
 
         if transtype = "ISS-SCRP"
         then do:
 
            /* CREDIT ACCOUNT */
            for first pld_det
               where pld_domain   = global_domain
               and   pld_prodline = pt_prod_line
               and   pld_site     = site
               and   pld_loc      = location
            no-lock:
            end. /* FOR FIRST pld_det */
 
            if not available pld_det
            then do:
               for first pld_det
                  where pld_domain   = global_domain
                  and   pld_prodline = pt_prod_line
                  and   pld_site     = site
                  and   pld_loc      = ""
               no-lock:
               end. /* FOR FIRST pld_det */
            end. /* IF NOT AVAILABLE pld_det */
 
            if available pld_det
            then do:
               assign
                  cr_acct = pld_inv_acct
                  cr_sub  = pld_inv_sub
                  cr_cc   = pld_inv_cc.
            end. /* IF AVAILABLE pld_det */
 
            else do:
               for first pl_mstr
                  fields(pl_domain pl_prod_line pl_inv_acct
                         pl_inv_sub pl_inv_cc)
                  where pl_domain    = global_domain
                  and   pl_prod_line = pt_prod_line
               no-lock:
               end. /* FOR FIRST pl_mstr */
               if available pl_mstr
               then do:
                  assign
                     cr_acct = pl_inv_acct
                     cr_sub  = pl_inv_sub
                     cr_cc   = pl_inv_cc.
               end. /* IF AVAILABLE pl_mstr */
            end. /* ELSE DO */
 
            /* DEBIT ACCOUNT */
            for first pld_det
               where pld_domain   = global_domain
               and   pld_prodline = pt_prod_line
               and   pld_site     = site
               and   pld_loc      = location
               no-lock:
            end. /* FOR FIRST pld_det */
 
            if not available pld_det
            then do:
               for first pld_det
                  where pld_domain   = global_domain
                  and   pld_prodline = pt_prod_line
                  and   pld_site     = site
                  and   pld_loc      = ""
               no-lock:
               end. /* FOR FIRST pld_det */
            end. /* IF NOT AVAILABLE pld_det */

            if available pld_det
            then do:
               assign
                  dr_acct = pld_scrpacct
                  dr_sub  = pld_scrp_sub
                  dr_cc   = pld_scrp_cc.
            end. /* IF AVAILABLE pld_det */
 
            else do:
               for first pl_mstr
                  fields(pl_domain pl_prod_line pl_scrp_acct
                         pl_scrp_sub pl_scrp_cc)
                  where pl_domain    = global_domain
                  and   pl_prod_line = pt_prod_line
               no-lock:
               end. /* FOR FIRST pl_mstr */
               if available pl_mstr
               then do:
                  assign
                     dr_acct = pl_scrp_acct
                     dr_sub  = pl_scrp_sub
                     dr_cc   = pl_scrp_cc.
               end. /* IF AVAILABLE pl_mstr */
            end. /* ELSE DO */

/*cy1016*/  find first xrac_det no-lock
/*cy1016*/  where xrac_domain = global_domain
/*cy1016*/  and   xrac_type = "SCRAP"
/*cy1016*/  and   xrac_code = l_rsncode
/*cy1016*/  no-error.
/*cy1016*/  if available xrac_det
/*cy1016*/  then do:
/*cy1016*/      assign
/*cy1016*/      dr_acct = xrac_acct
/*cy1016*/      dr_sub  = xrac_sub
/*cy1016*/      dr_cc   = xrac_cc
/*cy1016*/      dr_proj = xrac_project.
/*cy1016*/  end.
 
         end. /* IF transtype = "ISS-SCRP" */
 
         for first ac_mstr
            fields(ac_domain ac_code ac_desc)
            where ac_domain = global_domain
            and   ac_code   = dr_acct
         no-lock.
         end. /* FOR FIRST ac_mstr */
         if available ac_mstr
         then
            dr_desc = ac_desc.
         else
            dr_desc = "".
 
         for first ac_mstr
            fields(ac_domain ac_code ac_desc)
            where ac_domain = global_domain
            and   ac_code   = cr_acct
         no-lock.
         end. /* FOR FIRST ac_mstr */
         if available ac_mstr
         then
            cr_desc = ac_desc.
         else
            cr_desc = "".
 
      end.
 
      /* DO NOT ACCESS UI WHEN PROCESSING API REQUEST */
      if c-application-mode <> "API"
      then do:
         display
            dr_desc
            cr_desc
         with frame a.
      end. /* IF c-application-mode <> "API" */
 
      if eff_date = ?
      then
         eff_date = today.
 
      seta:
      do on endkey undo mainloop, retry mainloop on error undo, retry
      with frame a:
          /* DO NOT RETRY IF PROCESSING API REQUEST */
         if retry and c-application-mode = "API"
         then
            return error return-value.
 
         /*  IF THIS IS A BATCH RUN AND WE ARE DOING A RETRY, UNDO   */
         /*  AND LEAVE MAINLOOP (mfglef.i ERROR WAS INEFFECTIVE)     */
         {us/gp/gpcimex.i "mainloop"}
 
         if c-application-mode <> "API"
         then
            display unit_cost with frame a.
 
         if transtype = "RCT-UNP"
         then
            assign
               l_acct = cr_acct
               l_sub  = cr_sub
               l_cc   = cr_cc.
 
         else
         if transtype = "ISS-RV"
         or transtype = "ISS-PRV"
         then
            assign
               l_acct = dr_acct
               l_sub  = dr_sub
               l_cc   = dr_cc.
 
         if c-application-mode <> "API"
         then do:
            display
            unit_cost
         with frame a.
 
            display
               ordernbr
               orderline
               l_so_job
               addr
               l_empname
               rmks
               eff_date
               dr_acct
               dr_sub
               dr_cc
               dr_proj
               dr_desc
               cr_acct
               cr_sub
               cr_cc
               cr_proj
               cr_desc
/*c1214*/      v_user1
/*c1214*/      v_user2
/*c1214*/      v_user3
            with frame a.
 
            newloop:
            do on error undo, retry:
               update
                  ordernbr
                  orderline
                  l_so_job
                  addr
                  rmks
                  eff_date
                  dr_acct when (can-find
                               (first code_mstr
                                  where code_mstr.code_domain = global_domain
                                  and   code_fldname          = "iss-scrp"
                                  and   code_value            = global_userid))
                  dr_sub  when (can-find
                               (first code_mstr
                                  where code_mstr.code_domain = global_domain
                                  and   code_fldname          = "iss-scrp"
                                  and   code_value            = global_userid))
                  dr_cc   when (can-find
                               (first code_mstr
                                  where code_mstr.code_domain = global_domain
                                  and   code_fldname          = "iss-scrp"
                                  and   code_value            = global_userid))
                  dr_proj when (can-find
                               (first code_mstr
                                  where code_mstr.code_domain = global_domain
                                  and   code_fldname          = "iss-scrp"
                                  and   code_value            = global_userid))
                  cr_acct when (can-find
                               (first code_mstr
                                  where code_mstr.code_domain = global_domain
                                  and   code_fldname          = "iss-scrp"
                                  and   code_value            = global_userid))
                  cr_sub  when (can-find
                               (first code_mstr
                                  where code_mstr.code_domain = global_domain
                                  and   code_fldname          = "iss-scrp"
                                  and   code_value            = global_userid))
                  cr_cc   when (can-find
                               (first code_mstr
                                  where code_mstr.code_domain = global_domain
                                  and   code_fldname          = "iss-scrp"
                                  and   code_value            = global_userid))
                  cr_proj when (can-find
                               (first code_mstr
                                  where code_mstr.code_domain = global_domain
                                  and   code_fldname          = "iss-scrp"
                                  and   code_value            = global_userid))
/*c1214*/         v_user1
/*c1214*/         v_user2
/*c1214*/         v_user3
               with frame a.
 
               if addr <> ""
               then do:
                  for first emp_mstr
                     where emp_domain = global_domain
                     and   emp_addr = addr
                  no-lock:
                      l_empname = emp_name.
                  end. /* FOR FIRST emp_mstr */
 
                  if not available emp_mstr
                  then do:
                     /* INVALID EMPLOYEE */
                     {us/bbi/pxmsg.i &MSGNUM=4006 &ERRORLEVEL=3}
                     next-prompt
                        addr
                     with frame a.
                     undo newloop, retry newloop.
                   end. /* IF NOT AVAILABLE emp_mstr */
                   display l_empname with frame a.
               end.  /* if addr <> "" */
               else
                  display
                     "" @ l_empname
                  with frame a.
 
               so_job = l_so_job.
            end. /* newloop */
 
         end. /* IF c-application-mode <> "API" */
 
         else do: /* IF c-application-mode = "API" */
            assign
               {us/mf/mfaiset.i ordernbr  ttInventoryTrans.nbr}
               {us/mf/mfaiset.i orderline ttInventoryTrans.line}
               {us/mf/mfaiset.i so_job    ttInventoryTrans.soJob}
               {us/mf/mfaiset.i addr      ttInventoryTrans.addr}
               {us/mf/mfaiset.i rmks      ttInventoryTrans.rmks}
               {us/mf/mfaiset.i eff_date  ttInventoryTrans.effdate}.
            if issrct = "ISS" then
               assign
                  {us/mf/mfaiset.i dr_acct ttInventoryTrans.drAcct}
                  {us/mf/mfaiset.i dr_sub  ttInventoryTrans.drsub}
                  {us/mf/mfaiset.i dr_cc   ttInventoryTrans.drCc}
                  {us/mf/mfaiset.i project ttInventoryTrans.project}.
            else
               assign
                  {us/mf/mfaiset.i cr_acct   ttInventoryTrans.crAcct}
                  {us/mf/mfaiset.i cr_sub    ttInventoryTrans.crsub}
                  {us/mf/mfaiset.i cr_cc     ttInventoryTrans.crCc}
                  {us/mf/mfaiset.i projectcr ttInventoryTrans.project}.
         end.
 
         assign project = dr_proj
                projectcr = cr_proj.
 
         if addr <> " "
         then do:
 
            run getPurchaseAccountDefaults.
 
            if transtype = "RCT-UNP"
            then do:
               assign
                  cr_acct = if l_acct = cr_acct
                            then
                               dftPURAcct
                            else
                               cr_acct
                  cr_sub  = if l_sub = cr_sub
                            then
                               dftPURSubAcct
                            else
                               cr_sub
                  cr_cc   = if l_cc = cr_cc
                            then
                               dftPURCostCenter
                            else
                               cr_cc.
 
               if c-application-mode <> "API"
               then
                  display
                     cr_acct
                     cr_sub
                     cr_cc
                  with frame a.
            end.
 
            else
            if transtype = "ISS-RV"
            or transtype = "ISS-PRV"
            then do:
               assign
                  dr_acct = if l_acct = dr_acct
                            then
                               dftPURAcct
                            else
                               dr_acct
                  dr_sub  = if l_sub = dr_sub
                            then
                               dftPURSubAcct
                            else
                               dr_sub
                  dr_cc   = if l_cc = dr_cc
                            then
                               dftPURCostCenter
                            else
                               dr_cc.
               if c-application-mode <> "API"
               then
                  display
                     dr_acct
                     dr_sub
                     dr_cc
                  with frame a.
            end.
 
         end.
 
         /* CHECK EFFECTIVE DATE */
         for first  si_mstr
         where si_domain = global_domain
         and   si_site   = site
         no-lock.
         end. /* FOR FIRST si_mstr */
         {us/gp/gpglef1.i
            &module = ""IC""
            &entity = si_entity
            &date = eff_date
            &prompt = "eff_date"
            &frame = "a"
            &loop = "seta"}
 
         /*VALIDATE ACCOUNTS*/
         for first gl_ctrl
            fields(gl_domain gl_verify gl_rnd_mthd)
            where gl_domain = global_domain
         no-lock.
         end. /* FOR FIRST gl_ctrl */
 
         if gl_verify
         then do with frame a:
 
            if issrct = "ISS"
            then do:
 
               if c-application-mode = "API"
               or batchrun
               then do:
                  run verify-gl-accounts
                     (input dr_acct,
                      input dr_sub,
                      input dr_cc,
                      input project,
                      input "dr_acct",
                      output valid_acct).
 
                  if valid_acct = no
                  then do:
                     next-prompt dr_acct with frame a.
                     undo mainloop, retry.
                  end. /* IF valid_acct */
 
               end. /* IF c-application-mode */
 
               else do:
                  run verify-gl-accounts
                     (input dr_acct,
                      input dr_sub,
                      input dr_cc,
                      input project,
                      input "dr_acct",
                      output valid_acct).
 
                  if valid_acct = no
                  then do:
                     next-prompt dr_acct with frame a.
                     undo, retry.
                  end. /* IF valid_acct */
 
               end. /* ELSE DO */
 
            end. /* if issrct = "ISS" */
 
            else do:
 
               if c-application-mode = "API"
               or batchrun
               then do:
                  run verify-gl-accounts
                     (input cr_acct,
                     input cr_sub,
                     input cr_cc,
                     input projectcr,
                     input "cr_acct",
                     output valid_acct).
 
                  if valid_acct = no
                  then do:
                     next-prompt cr_acct with frame a.
                     undo mainloop, retry.
                  end.  /* IF valid_acct */
 
               end.
 
               else do:
                  run verify-gl-accounts
                     (input cr_acct,
                      input cr_sub,
                      input cr_cc,
                      input projectcr,
                      input "cr_acct",
                      output valid_acct).
                  if valid_acct = no
                  then do:
                     next-prompt cr_acct with frame a.
                     undo, retry.
                  end.
               end.
 
            end. /* if issrct <> "ISS" */
 
         end. /* if gl_verify */
 
      end.
 
      find ac_mstr
         where ac_mstr.ac_domain = global_domain
         and   ac_code = dr_acct
      no-lock  no-error.
      if available ac_mstr
      then
         dr_desc = ac_desc.
      else
         dr_desc = "".
 
      find ac_mstr
         where ac_mstr.ac_domain = global_domain
         and   ac_code = cr_acct
      no-lock no-error.
      if available ac_mstr
      then
         cr_desc = ac_desc.
      else
         cr_desc = "".
 
      if c-application-mode <> "API"
      then
         display
            dr_desc
            cr_desc
         with frame a.
 
      total_amt = unit_cost * total_lotserial_qty.
      {us/bbi/gprun.i ""gpcurrnd.p""
         "(input-output total_amt, input gl_rnd_mthd)"}
 
      total_amt_fmt = total_amt:format.
      {us/bbi/gprun.i ""gpcurfmt.p""
         "(input-output total_amt_fmt, input gl_rnd_mthd)"}
 
      total_amt:format = total_amt_fmt.
 
      if c-application-mode <> "API"
      then
         display total_amt with frame a.
 
      i = 0.
      for each sr_wkfl
         fields(sr_domain sr_userid sr_lineid sr_site
                sr_loc    sr_lotser sr_rev    sr_ref
                sr_qty    sr__qadc01)
         where sr_wkfl.sr_domain = global_domain
         and           sr_userid = SessionUniqueID
         and           sr_lineid = cline
      no-lock:
         i = i + 1.
         if i > 1
         then do:
            leave.
         end.
      end.
 
      if i > 1
      and c-application-mode <> "API"
      then do on endkey undo mainloop, retry mainloop:
 
         yn = yes.
         /* DISPLAY LOTSERIALS BEING RECEIVED? */
         {us/bbi/pxmsg.i &MSGNUM=359 &ERRORLEVEL=1 &CONFIRM=yn}
 
         if yn
         then do:
 
            hide frame a.
 
            form
               pt_part
            with frame b side-labels width 80.
 
            /* SET EXTERNAL LABELS */
            setFrameLabels(frame b:handle).
 
            display
               pt_part
            with frame b.
 
            for each sr_wkfl
              fields(sr_domain sr_userid sr_site
                     sr_loc sr_lotser sr_ref sr_qty sr__qadc01
                     sr_qty)
              where sr_wkfl.sr_domain = global_domain
              and           sr_userid = SessionUniqueID
            with frame f-a width 80:
 
               /* SET EXTERNAL LABELS */
               setFrameLabels(frame f-a:handle).
 
               display
                  sr_site
                  sr_loc
                  sr_lotser
                  sr_ref  format "x(8)" column-label "Ref"
                  sr_qty  format "->>>,>>>,>>9.9<<<<<<<<<"
                  sr__qadc01 format "x(8)" column-label "Reason Code".
 
               {us/gp/gpwait.i &INSIDELOOP=YES &FRAMENAME=f-a}
 
            end.
 
            {us/gp/gpwait.i &OUTSIDELOOP=YES}
 
         end.
 
      end.
 
      assign
         shipnbr = ""
         ship_date = ?
         inv_mov = "".
 
      /* Pop-up to collect shipment information */
      if transtype = "RCT-UNP" or
         transtype = "RCT-SOR" or
         transtype = "RCT-RS"
      then do:
 
         ship_date = eff_date.
 
         if shc_ship_rcpt
         then do:
            pause 0.
            {us/bbi/gprun.i ""icshup.p""
               "(input-output shipnbr,
                 input-output ship_date,
                 input-output inv_mov,
                 input transtype, yes,
                 input 10,
                 input 20)"}
         end. /* if shc_ship_rcpt */
 
      end. /* if transtype = "RCT-UNP" or ... */
 
      do on endkey undo mainloop, retry mainloop:
 
         /* CHECK TO SEE IF CONSIGNMENT IS ACTIVE */
         {us/bbi/gprun.i ""gpmfc01.p""
              "(input ENABLE_CUSTOMER_CONSIGNMENT,
                input 10,
                input ADG,
                input CUST_CONSIGN_CTRL_TABLE,
                output using_cust_consignment)"}
 
         if using_cust_consignment and
            ((transtype = "ISS-UNP"  and lotserial_qty < 0) or
             (transtype = "RCT-UNP"  and lotserial_qty > 0)) and
            ordernbr    <> "" and
            lotserial_qty <> 0
         then do:
 
            /*Check sales order to see if it is consigned and      */
            /* that the transfer item matches the sales order item*/
            run checkConsignedOrder
               (input ordernbr,
                input orderline,
                input pt_part,
                output consigned_line,
                output error-found).
 
            if error-found
            then do:
               /* MATCHING ORDER LINE ITEM FOR THIS PART NOT FOUND*/
               {us/bbi/pxmsg.i &MSGNUM=8285 &ERRORLEVEL=3}
                 next setd.
            end.
 
         end. /*if using_cust_consignment*/
 
         if using_cust_consignment and
            ((transtype = "ISS-UNP"  and lotserial_qty > 0) or
             (transtype = "RCT-UNP"  and lotserial_qty < 0)) and
            lotserial_qty <> 0
         then do:
 
            run checkConsignmentInventory
               (input ordernbr,
                input orderline,
                input site,
                input pt_part,
                input location,
                input lotserial,
                input lotref,
                input lotserial_qty * trans_conv,
                output error-found).
 
            if error-found
            then do:
               /* UNABLE TO ISSUE/RECEIVE CONSIGNED INVENTORY*/
               {us/bbi/pxmsg.i &MSGNUM=4937 &ERRORLEVEL=3}
               next setd.
            end.
 
         end. /*if using_cust_consignment*/
 
         yn = yes.
 
         if c-application-mode <> "API"
         then do:
            /* IS ALL INFO CORRECT? */
            {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=yn}
         end.
 
         /* ADDED SECTION TO DO FINAL ISSUE CHECK */
         if yn
         then do:
 
            release ld_det.
 
            {us/ic/icintr2.i "sr_userid = SessionUniqueID"
               transtype
               pt_part
               trans_um
               error-found
               """"}
 
            if error-found
            then do:
               /* UNABLE TO ISSUE OR RECEIVE FOR ITEM*/
               {us/bbi/pxmsg.i &MSGNUM=161 &ERRORLEVEL=3 &MSGARG1=part}
               next setd.
            end.
 
            leave setd.
 
         end.
         else
            l_new = no.
 
         if c-application-mode = "API"
         then
            leave setd.
      end.
 
   end. /*setd*/
 
   /* FOURTH PARAMETER IS KANBAN ID - NOT USED HERE SO PASS AS 0     */
/*cy1016* Start deleted code >>>>
   {us/bbi/gprun.i ""icsintra.p"" "(shipnbr, ship_date, inv_mov, 0, true)" } 
*cy1016* end deleted code <<<< */

/*cy1016*  starts added code >>>>> */
   {us/bbi/gprun.i ""xxsintra.p"" "(shipnbr, ship_date, inv_mov, 0, true)" }
/*cy1016*  end  added code <<<<< */
 
   if c-application-mode = "API"
   then
      leave.
 
   hide frame b.
 
   clear frame a .
end.
 
if c-application-mode = "API"
then
   return {&SUCCESS-RESULT}.
 
PROCEDURE verify-gl-accounts:
   /* THIS SUBROUTINE DETERMINES THE VALIDITY OF THE ACCOUNT, SUB-    */
   /* ACCOUNT, COST CENTER AND PROJECT  USING THE PERSISTENT          */
   /* PROCEDURES.                                                     */
   define input  parameter acct     like trgl_dr_acct no-undo.
   define input  parameter sub      like trgl_dr_sub no-undo.
   define input  parameter cc       like trgl_dr_cc   no-undo.
   define input  parameter proj     like wo_proj   no-undo.
   define input  parameter acctfldname like trgl_dr_acct no-undo.
   define output parameter glvalid  like mfc_logical initial true no-undo.
 
   /* INITIALIZE SETTINGS */
   {us/gp/gprunp.i "gpglvpl" "p" "initialize"}
 
   /* AP_ACCT/SUB/CC VALIDATION */
   {us/gp/gprunp.i "gpglvpl" "p" "validate_fullcode"
      "(input acct,
        input sub,
        input cc,
        input proj,
        input acctfldname,
        output glvalid)"}
 
END PROCEDURE. /* verify-gl-accounts */
 
PROCEDURE getGLDefaults:
   /* FIND DEFAULT FOR COST OF PRODUCTION ACCT */
 
   {us/bbi/gprun.i ""glactdft.p""
      "(input ""WO_COP_ACCT"",
        input pt_mstr.pt_prod_line,
        input if available in_mstr then in_mstr.in_site
                                   else site,
        input """",
        input """",
        input no,
        output dftCOPAcct,
        output dftCOPSubAcct,
        output dftCOPCostCenter)"}
 
   /* FIND DEFAULT FOR FLOOR STOCK ACCT */
   {us/bbi/gprun.i ""glactdft.p""
      "(input ""WO_FLR_ACCT"",
        input pt_mstr.pt_prod_line,
        input if available in_mstr then in_mstr.in_site
                                   else site,
        input """",
        input """",
        input no,
        output dftFLRAcct,
        output dftFLRSubAcct,
        output dftFLRCostCenter)"}
 
END PROCEDURE. /* getGLDefaults */
 
PROCEDURE getPurchaseAccountDefaults:
 
   /* Find default for purchases acct */
   for first vd_mstr
      fields( vd_domain vd_addr vd_type)
       where vd_mstr.vd_domain = global_domain and vd_addr = addr
   no-lock:
   end.
 
   {us/bbi/gprun.i ""glactdft.p""
      "(input ""PO_PUR_ACCT"",
        input pt_mstr.pt_prod_line,
        input if available in_mstr then in_mstr.in_site
                                   else site,
        input if available vd_mstr then vd_type
                                   else """",
        input """",
        input no,
        output dftPURAcct,
        output dftPURSubAcct,
        output dftPURCostCenter)"}
 
END PROCEDURE. /* getPurchaseAccountDefaults */
 
PROCEDURE checkConsignmentInventory:
 
   define input  parameter ip_ordernbr    as character no-undo.
   define input  parameter ip_orderline   as character no-undo.
   define input  parameter ip_site        like ld_site no-undo.
   define input  parameter ip_part        like ld_part no-undo.
   define input  parameter ip_location    like ld_loc  no-undo.
   define input  parameter ip_lotser      like ld_lot  no-undo.
   define input  parameter ip_ref         like ld_ref  no-undo.
   define input  parameter ip_tran_qty    as decimal   no-undo.
   define output parameter op_error      as logical   no-undo.
 
   define variable consigned_line        as logical   no-undo.
   define variable unconsigned_qty       as decimal   no-undo.
   define variable consigned_qty_oh      as decimal   no-undo.
   define variable location_qty          as decimal   no-undo.
   define variable procid                as character no-undo.
 
   /*IF A SALES ORDER WAS ENTERED, CHECK WHETHER IT IS FOR A   */
   /*CONSIGNED ITEM.                                           */
 
   if ip_ordernbr <> ""
   then do:
      run checkConsignedOrder
         (input ip_ordernbr,
          input ip_orderline,
          input ip_part,
          output consigned_line,
          output op_error).
      if consigned_line
      then
         op_error = yes.
      else
         op_error = no.
   end.
 
   if not op_error
   then do:
      /*IF CONSIGNED, FIND OUT HOW MUCH NON-CONSIGNED INVENTORY   */
      /*IS AT THE LOCATION. IF THERE IS NOT ENOUGH TO COVER THE   */
      /*QTY BEING ISSUED, THEN ERROR.                             */
 
      /*RETRIEVE THE TOTAL QTY ON-HAND FOR THE LOCATION */
      for first ld_det
         fields( ld_domain ld_qty_oh ld_cust_consign_qty
                 ld_part ld_site ld_loc ld_lot ld_ref)
         where ld_domain = global_domain
         and   ld_part   = ip_part
         and   ld_site   = ip_site
         and   ld_loc    = ip_location
         and   ld_lot    = ip_lotser
         and   ld_ref    = ip_ref
      no-lock:
         assign
             location_qty  = ld_qty_oh
             consigned_qty_oh = ld_cust_consign_qty.
 
      end. /*for first ld_det*/
 
      unconsigned_qty = location_qty - consigned_qty_oh.
 
      if (consigned_qty_oh <> 0) and
         ((ip_tran_qty > 0 and unconsigned_qty < ip_tran_qty) or
          (ip_tran_qty < 0 and unconsigned_qty < (ip_tran_qty * -1)))
      then
        op_error = yes.
 
   end.
 
END PROCEDURE. /*checkConsignmentInventory*/
 
PROCEDURE checkConsignedOrder:
   define input parameter ip_ordernbr    as character no-undo.
   define input parameter ip_orderline   as character no-undo.
   define input parameter ip_part        as character no-undo.
   define output parameter op_consigned  as logical   no-undo.
   define output parameter op_error      as logical   no-undo.
 
   op_consigned = no.
 
   {us/gp/gprunmo.i
      &program = "socnsod1.p"
      &module = "ACN"
      &param = """(input ip_ordernbr,
                   input ip_orderline,
                   output op_consigned,
                   output consign_loc,
                   output intrans_loc,
                   output max_aging_days,
                   output auto_replenish)"""}
 
   if op_consigned
   then do:
      if can-find(first sod_det
                     where sod_domain = global_domain
                     and   sod_nbr    = ordernbr
                     and   sod_line   = orderline
                     and   sod_part = ip_part
                     and   sod_compl_stat = "")
      then
         op_error = no.
      else
         op_error = yes.
   end. /* IF op_consigned */
 
END PROCEDURE. /*checkConsignedOrder*/
