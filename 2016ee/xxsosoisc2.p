/* xxsosoisc2.p - SALES ORDER SHIPMENT TRAILER                                */
/* sosoisc2.p - SALES ORDER SHIPMENT TRAILER                                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsosoisc2.p,v 1.2 2018/03/13 17:10:01 gbg Exp $: */
/*                                                                            */
/* REVISION: 7.2            CREATED: 03/16/92   BY: tjs *F247*                */
/* REVISION: 7.2      LAST MODIFIED: 04/23/92   BY: sas *F379*                */
/* REVISION: 7.4      LAST MODIFIED: 09/21/93   BY: bcm *H127*                */
/* REVISION: 7.4      LAST MODIFIED: 09/10/94   BY: dpm *FQ97*                */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.4      LAST MODIFIED: 03/31/95   BY: jxz *G0K1*                */
/* REVISION: 7.4      LAST MODIFIED: 06/06/95   BY: jym *G0ND*                */
/* REVISION: 8.5      LAST MODIFIED: 10/05/95   BY: taf *J053*                */
/* REVISION: 7.4      LAST MODIFIED: 12/27/95   BY: ais *G1HG*                */
/* REVISION: 8.5      LAST MODIFIED: 09/26/97   BY: *J21S* Niranjan Ranka     */
/* REVISION: 8.5      LAST MODIFIED: 12/30/97   BY: *J281* Manish Kulkarni    */
/* REVISION: 8.6      LAST MODIFIED: 11/07/97   BY: *K15N* Jim Williams       */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 07/13/98   BY: *J2MD* A. Philips         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 07/06/00   BY: *L116* Rajesh Kini        */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 01/24/01   BY: *M10S* Rajaneesh Sarangi  */
/* REVISION: 9.1      LAST MODIFIED: 10/13/00   BY: *N0WB* Mudit Mehta        */
/* Revision: 1.12.2.7      BY: Katie Hilbert      DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.12.2.8      BY: Vandna Rohira      DATE: 04/28/03  ECO: *N1YL* */
/* Revision: 1.12.2.9      BY: Narathip W.        DATE: 05/21/03  ECO: *P0S8* */
/* Revision: 1.12.2.11     BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.12.2.12     BY: Rajinder Kamra     DATE: 06/23/03  ECO: *Q003* */
/* Revision: 1.12.2.13     BY: Jean Miller        DATE: 06/23/03  ECO: *Q06C* */
/* Revision: 1.12.2.14     BY: Shivganesh Hegde   DATE: 09/22/04  ECO: *P2LM* */
/* Revision: 1.12.2.15     BY: Vinod Kumar        DATE: 12/10/04  ECO: *P2TK* */
/* Revision: 1.12.2.17     BY: Ed van de Gevel    DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.12.2.19     BY: Robin McCarthy     DATE: 12/01/05  ECO: *P470* */
/* Revision: 1.12.2.20     BY: Ed van de Gevel    DATE: 01/30/06  ECO: *P4GS* */
/* Revision: 1.12.2.21     BY: Mochesh Chandran   DATE: 09/27/06  ECO: *P57Q* */
/* Revision: 1.12.2.22     BY: Nan Zhang          DATE: 07/03/07  ECO: *R0C6* */
/* Revision: 1.12.2.23     BY: Iram Momin         DATE: 01/29/08  ECO: *Q1BJ* */
/* Revision: 1.12.2.25     BY: Jordan Fei         DATE: 09/28/09  ECO: *R1V9* */
/* Revision: 1.12.2.27     BY: Jordan Fei         DATE: 01/08/10  ECO: *R1W5* */
/* Revision: 1.12.2.28     BY: Jordan Fei         DATE: 02/03/10  ECO: *R1XF* */
/* Revision: 1.12.2.29     BY: Miguel Alonso      DATE: 05/07/10  ECO: *R204* */
/* $Revision: 1.2 $     BY: Miguel Alonso     DATE: 07/15/10 ECO: *R22G* */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 22-FEB-2013    BY:  gbg *c1367*                      */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
 
/* DISPLAY TITLE */
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
 
define input  parameter p_corr_inv like mfc_logical no-undo.
 
define new shared variable so_recno as recid.
 
define shared variable so_mstr_recid as recid.
define shared variable undo-all like mfc_logical no-undo.
define shared variable eff_date like glt_effdate.
define shared variable undo_isc1 like mfc_logical.
define shared variable so_db   like dc_name.
define shared variable ship_db like dc_name.
define shared variable global_recid as recid.
 
define variable sonbr     like so_nbr no-undo.
define variable ship_via  like so_shipvia no-undo.
define variable ship_date like so_ship_date no-undo.
define variable bol       like so_bol no-undo.
define variable rmks      like so_rmks no-undo.
define variable inv_nbr   like so_inv_nbr no-undo.
define variable to_inv    like so_to_inv no-undo.
define variable err_flag  as integer no-undo.
define variable w-accept  like mfc_logical no-undo.
define variable l_consolidate_ok as logical   no-undo.
define variable l_msg_text       as character no-undo.
define variable l_inv_nbr        like so_inv_nbr no-undo.
define variable hDaybooksetValidation as handle    no-undo.
define variable iErrorNumber          as integer   no-undo.
define variable cErrorArgs            as character no-undo.
 
/* Global shipping */
define variable v_trflow_flg    as   logical         no-undo.
define variable v_lines_found   like mfc_logical     no-undo.
define variable v_abs_recid     as   recid initial ? no-undo.
define variable temp_loc        as   character       no-undo.
define variable temp_site         as character     no-undo.
define variable c_shgroup       as   character       no-undo.
define variable c_src_addr      as   character       no-undo.
define variable c_dest_addr     as   character       no-undo.
define variable c_trans_type    as   character              no-undo.
define variable l_allow_confirm   as logical      no-undo.
define variable l_conso_tax_zone  as logical      no-undo.
define variable l_check_ship_pending       as logical no-undo.
define variable c_sep_shp_periods as character    no-undo.
define variable c_dummy           as character    no-undo.
define variable c_tax_zone_from   as character    no-undo.
define variable d_start_date      as date         no-undo.
define variable d_end_date        as date         no-undo.

{us/ic/icshmtdf.i "new"} /*SHIPPER TEMP TABLE */
{us/px/pxpgmmgr.i}
{us/px/pxphdef.i soldxr}
 
/* PROGRAM X-REFERENCE FUNCTIONS */
{us/wh/whexecfn.i}
 
define temp-table t_sod_qty no-undo
   field t_line    like sod_line
   field t_qty_chg like sod_qty_chg
   field t_um_conv like sod_um_conv.
 
define buffer somstr for so_mstr.
define buffer simstr for si_mstr.
define shared frame f.
define shared frame sotot.
 
/* DAYBOOKSET VALIDATION LIBRARY PROTOTYPES */
{us/dy/dybvalpl.i hDaybooksetValidation}
 
/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}
 
/* ASN API TEMP-TABLE */
{us/so/soshxt01.i}
 
{us/so/sosois1.i}
{us/mf/mfsotrla.i}
 
/* INITIALIZE PERSISTENT PROCEDURES */
run mfairunh.p
   (input "dybvalpl.p",
    input ?,
    output hDaybooksetValidation).
 
if c-application-mode = "API" then do:
 
   /*
   * GET HANDLE OF API CONTROLLER
   */
   {us/bbi/gprun.i ""gpaigh.p""
      "( output apiMethodHandle,
         output apiProgramName,
         output apiMethodName,
         output apiContextString)"}
 
   /*
   * GET SO SHIPMENT HDR TEMP-TABLE
   */
   run getSoShipHdrRecord in apiMethodHandle
      (buffer ttSoShipHdr).
 
end. /* IF C-APPLICATION-MODE = "API" */
 

do transaction: 
   for first txc_ctrl where txc_domain = global_domain
   no-lock: end.
    
   assign
      maint = yes
      undo-all = yes.
    
   find so_mstr where recid(so_mstr) = so_mstr_recid exclusive-lock.
    
   so_recno = recid(so_mstr).
    
   form
      so_shipvia     colon 15
      so_daybookset  colon 55
      so_ship_date   colon 15
      so_to_inv      colon 55 skip
      so_bol         colon 15
      so_rmks        colon 15
   with frame f side-labels width 80.
    
   if c-application-mode <> "API" then
      /* SET EXTERNAL LABELS */
      setFrameLabels(frame f:handle).
    
   assign
      sonbr     = ""
      ship_via  = ""
      ship_date = ?
      bol       = ""
      rmks      = ""
      inv_nbr   = ""
      to_inv    = no
/*cy1021*/ to_inv = yes
      l_inv_nbr = so_mstr.so_inv_nbr.
    
   for first cil_mstr
      where cil_mstr.cil_domain = global_domain
      and   cil_mstr.cil_cor_so_nbr = so_nbr
   exclusive-lock:
      if so_ship_date = ? then
         so_ship_date = today.
      so_to_inv = yes.
    
      display
         so_to_inv
         so_ship_date
      with frame f.
   end.

   settrl:
   do on error undo, retry:
      if c-application-mode = "API" and retry
         then return error return-value.
    
      if c-application-mode <> "API" then do:
         if txc__qad03 then
            display
               l_nontaxable_lbl
               nontaxable_amt
               l_taxable_lbl
               taxable_amt
               with frame sotot.
         else
            display
               "" @ l_nontaxable_lbl
               "" @ nontaxable_amt
               "" @ l_taxable_lbl
               "" @ taxable_amt
               with frame sotot.
    
         display
            so_curr
            line_total
            so_disc_pct
            disc_amt
            tax_date
            user_desc[1]  so_trl1_cd  so_trl1_amt
            user_desc[2]  so_trl2_cd  so_trl2_amt
            user_desc[3]  so_trl3_cd  so_trl3_amt
            tax_amt
            ord_amt
            tax_edit
         with frame sotot.
    
         /* DEFAULT DAYBOOKSET BY SITE */
         if so_daybookset = ""
         then do:
            assign
               so_daybookset = getDefaultDaybookSetBySite( input so_bill).
         end.
    
         display so_daybookset with frame f.
    
         set
            so_shipvia
            so_ship_date
            so_bol
            so_rmks
            so_daybookset
            so_to_inv when not available cil_mstr
         with frame f.
    
         /* VALIDATE DAYBOOK SET BY SITE */
         run validateDaybookSet in hDaybookSetValidation
            ( input  so_daybookset,
              input  so_site,
              input  eff_date,
              output iErrorNumber,
              output cErrorArgs).
    
         if iErrorNumber > 0
         then do:
            run displayPxMsg in hDaybooksetValidation
               ( input iErrorNumber, input 3, input cErrorArgs).
            next-prompt so_daybookset with frame f.
            undo, retry.
         end.
    
      end. /* IF C-APPLICATION-MODE <> "API" THEN */
      else
         assign
            {us/mf/mfaiset.i so_daybookset ttSoShipHdr.ed_so_daybookset}
            {us/mf/mfaiset.i so_shipvia ttSoShipHdr.ed_so_shipvia}
            {us/mf/mfaiset.i so_ship_date ttSoShipHdr.ed_so_shp_date}
            {us/mf/mfaiset.i so_bol ttSoShipHdr.ed_so_bol}
            {us/mf/mfaiset.i so_rmks ttSoShipHdr.ed_remarks}
            {us/mf/mfaiset.i so_to_inv  ttSoShipHdr.ed_ready_to_inv}.
    
      w-accept = no.
    
      if can-find(mfc_ctrl where mfc_domain = global_domain and
                                 mfc_module = "SO" and
                                 mfc_seq = 170) and
      c-application-mode <> "API" then do while not w-accept:
    
         /* Please confirm update */
         {us/bbi/pxmsg.i &MSGNUM=32 &ERRORLEVEL=1 &CONFIRM=w-accept}
    
         if w-accept then leave.
    
         set
            so_shipvia
            so_ship_date
            so_bol
            so_rmks
            so_daybookset
            so_to_inv
         with frame f.
    
      end. /* multiple bol set */
    
    
      /* COPY THESE VALUE INTO REMOTE DOMAIN IF NECESSARY */
      if ship_db <> so_db then do:
         {us/bbi/gprun.i ""gpmdas.p"" "(input ship_db, output err_flag)" }
         if err_flag = 2 or err_flag = 3 then do:
            /* DOMAIN # IS NOT AVAILABLE*/
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=ship_db}
            if c-application-mode <> "API" then
               pause.
            undo settrl, retry.
         end.
      end.
    
      if so_ship_date = ?
      then
         so_ship_date = today.
    
      assign
         sonbr     = so_nbr
         ship_via  = so_shipvia
         ship_date = so_ship_date
         bol       = so_bol
         rmks      = so_rmks
         to_inv    = so_to_inv.
    
      /* UPDATING SO TRAILER INFO AT REMOTE SITE */
      {us/bbi/gprun.i ""sosoisc3.p""
               "(input sonbr,
                 input ship_via,
                 input ship_date,
                 input bol,
                 input rmks,
                 input inv_nbr,
                 input to_inv)"}
    
      if ship_db <> so_db then do:
         {us/bbi/gprun.i ""gpmdas.p"" "(input so_db, output err_flag)" }
         if err_flag = 2 or err_flag = 3 then do:
            /* DOMAIN # IS NOT AVAILABLE*/
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=so_db}
            if c-application-mode <> "API" then
               pause.
            undo settrl, retry.
         end.
      end.
    
      hide frame f no-pause.
   end. /*settrl*/ 
end. /* do transaction */

shipping_block:
do on error undo, retry:
   empty temp-table t_sod_qty.
 
   /* QAD WAREHOUSING MODULE: USING RADIO FREQUENCY DEVICES, SYSTEM MUST SKIP */
   /* SHIPPING GROUP MODULE AS THIS INFORMATION IS NOT ENTERED BY USERS IN    */
   /* THE WAREHOUSE.                                                          */
   if not isProgInStack("whexexs.p") and
      not isProgInStack("whexprc.p")
   then do:
 
      for each sod_det
         where sod_domain = global_domain
         and   sod_nbr = so_mstr.so_nbr
         and   sod_compl_stat = ""
      no-lock:
         if so_to_inv = yes then do:
            /* Get the settings */ 
            {us/gp/gprunp.i "soldxr" "p" "needConsolidateInvoiceByVariousShipFroms"
                  "(output l_conso_tax_zone)"}
            {us/gp/gprunp.i "soldxr" "p" "needToCheckPending"
                  "(output l_check_ship_pending)"}
            {us/gp/gprunp.i "soldxr" "p" "getSeparateShipmentPeriodInfo"
                  "(output c_sep_shp_periods)"}
            {us/gp/gprunp.i "soldxr" "p" "getPeriodDatesForPendingInvoice"
                  "(input eff_date,
                    input c_sep_shp_periods,
                    output c_dummy,
                    output d_start_date,
                    output d_end_date)"}
            /* Get the ship-from tax zone */
            {us/gp/gprunp.i "soldxr" "p" "getIssuingTaxData"
                  "(input sod_site,
                    input '',
                    output c_dummy,
                    output c_dummy,
                    output c_dummy,
                    output c_dummy,
                    output c_dummy,
                    output c_tax_zone_from,
                    output c_dummy)"}
            /* Check the pending invoice and ship-from tax zone */
            {us/gp/gprunp.i "soldxr" "p" "checkPeriodAndShipfromByOrder"
                  "(input so_nbr,
                    input '',
                    input l_check_ship_pending,
                    input c_sep_shp_periods,
                    input d_start_date,
                    input d_end_date,
                    input l_conso_tax_zone,
                    input c_tax_zone_from,
                    output l_allow_confirm)"}
            if l_allow_confirm = no then do:
               /* Failed to confirm shipper(s), post any pending invoice first */
               {us/bbi/pxmsg.i &MSGNUM=10653 &ERRORLEVEL=3}
               undo shipping_block, retry.
            end.
         end.

         create t_sod_qty.
         assign
            t_sod_qty.t_line    = sod_line
            t_sod_qty.t_qty_chg = sod_qty_chg
            t_sod_qty.t_um_conv = sod_um_conv.
      end.

      if p_corr_inv and so_site <> so_ship then
         run p_shipper.
      else
         run p_dispatchNoteShipper.

      /* CHECK IF SHIPPING GROUP AND IMC EXIST TO DECIDE RETRY OR NOT. */
      {us/bbi/gprun.i ""gpgetgrp.p""
         "(c_src_addr, c_dest_addr, output c_shgroup)" }
 
      for first sg_mstr where sg_domain = global_domain
         and sg_grp = c_shgroup
      no-lock: end.
 
      for first sgid_det where sgid_domain = global_domain
         and sgid_grp = c_shgroup
         and can-find (first im_mstr where im_domain = global_domain and
                                              im_inv_mov = sgid_inv_mov and
                                              im_tr_type = c_trans_type)
      no-lock: end.
 
      /* Check whether the shipper created unsuccessfully beacuse of
         max line limitation. If it failed because of max line, then
         undo and retry */
      if     c_src_addr <> c_dest_addr 
         and can-find (ad_mstr 
                          where ad_domain = global_domain 
                          and   ad_addr   = c_src_addr) 
         and can-find (ad_mstr 
                          where ad_domain = global_domain 
                          and   ad_addr   = c_dest_addr) 
         and available sg_mstr 
         and available sgid_det 
         and v_abs_recid = ? 
         and keyfunction(lastkey) <> "END-ERROR"
      then do:
         undo shipping_block, retry.
      end.
   end.
end. /* end of shipping_block */ 

/* SET PICK LIST REQUIRED TO YES */
assign
   undo-all = no
   undo_isc1 = false.
 
 
PROCEDURE p_shipper:
   define buffer soddet for sod_det.
   define buffer qad_wkfl for qad_wkfl.
   define buffer tr_hist for tr_hist.

   define variable t_qty       like sod_qty_ord no-undo.
   define variable t_line_list as character     no-undo.
   define variable t_new_list  as character     no-undo.
   define variable t_org_qty   like t_qty       no-undo.
   define variable t_rev_qty   like t_qty       no-undo.
 
   for first qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID
   exclusive-lock:
      qad_logfld[1] = no.
   end.
   if not can-find (qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID)
   then do transaction:
      create qad_wkfl.
      assign
         qad_domain = global_domain
         qad_key1 = "SHIPPER"
         qad_key2 = SessionUniqueID
         qad_logfld[1] = no.
   end.

   {us/bbi/gprun.i ""icshmt1c.p""}
 
   assign
      v_lines_found = no
      t_line_list   = ""
      t_new_list    = "".
 
   /*CREATE SHIPPER FIRST*/
   for each sod_det where sod_det.sod_domain = global_domain and
                          sod_det.sod_nbr = so_mstr.so_nbr and
                          sod_det.sod_compl_stat = ""
   no-lock:
      t_qty = 0.
      if can-do(t_line_list, string(sod_det.sod_line)) then next.
 
      /* BYPASS REVERSAL LINE */
      find first cild_det where cild_domain = global_domain
                            and cild_cor_inv  = cil_mstr.cil_cor_inv
                            and cild_cor_so_nbr  = cil_mstr.cil_cor_so_nbr
                            and cild_cor_line = sod_det.sod_line
                            and cild_line_type = "R"
      no-lock no-error.
 
      if not available cild_det then next.
 
      /* FIND REVERSE IN SODDET FOR ADDING QUANTITY USE */
      find first soddet where soddet.sod_domain = global_domain
                          and soddet.sod_nbr  = so_nbr
                          and soddet.sod_line = cild_prev_line
                          and soddet.sod_compl_stat = ""
      no-lock no-error.
 
      if not available soddet then next.
      assign
         t_org_qty = 0
         t_rev_qty = 0.
      find first t_sod_qty where t_sod_qty.t_line = sod_det.sod_line
         no-lock no-error.
      if available t_sod_qty then t_org_qty = t_qty_chg.
 
      find first t_sod_qty where t_sod_qty.t_line = soddet.sod_line
         no-lock no-error.
      if available t_sod_qty then
         t_rev_qty = t_qty_chg * t_um_conv  / sod_det.sod_um_conv.
 
      if soddet.sod_part = sod_det.sod_part then
         t_qty =  t_org_qty + t_rev_qty.
      else t_qty =  t_org_qty.
 
      if t_qty <= 0 then next.
 
      t_line_list = t_line_list + ( if t_line_list = "" then ""
                                    else "," ) +  string(sod_det.sod_line).
 
      if soddet.sod_part = sod_det.sod_part then
         t_line_list = t_line_list + ( if t_line_list = "" then ""
                                       else "," ) +  string(soddet.sod_line).
 
      find pt_mstr where pt_domain = global_domain and
         pt_part = sod_det.sod_part
      no-lock no-error.
 
      for each sr_wkfl
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
         and  (sr_lineid = string(sod_det.sod_line)
            or sr_lineid = string(soddet.sod_line))
      no-lock
      break by sr_domain
            by sr_site
            by sr_loc
            by sr_lotser
            by sr_ref:
         accumulate sr_qty (total by sr_ref).
 
         if last-of(sr_ref)
            and (accum total by sr_ref sr_qty) <> 0
         then do:
            /* ADD TO SHIPPER LINE ITEM TEMP TABLE */
            {us/bbi/gprun.i
               ""icshmt1a.p""
               "(sod_det.sod_nbr,
                 sod_det.sod_line,
                 sod_det.sod_part,
                 sr_lotser,
                 sr_ref,
                 sr_site,
                 sr_loc,
                 accum total by sr_ref sr_qty,
                 sod_det.sod_um,
                 sod_det.sod_um_conv,
                 if avail pt_mstr then
                 pt_net_wt * (accum total by sr_ref sr_qty) * sod_det.sod_um_conv
                 else 0,
                 if avail pt_mstr then
                 pt_net_wt_um
                 else """",
                 if avail pt_mstr then
                 pt_size * (accum total by sr_ref sr_qty)
                 else 0,
                 if avail pt_mstr then
                 pt_size_um
                 else """" )" }
 
            assign v_lines_found = true.
         end. /* IF last-of(sr_ref) and ... */
      end. /* FOR EACH sr_wkfl */
   end.
 
   if v_lines_found
   then do:
      do on stop undo, leave:
         /*HIDE FRAME SHIP-DATE.*/
/*c1367*          {us/bbi/gprun.i ""icshmt.p"" */
/*c1367*/         {us/bbi/gprun.i ""xxicshmt.p""
            "(so_site,
              so_ship,
              ""ISS-COR"",
              eff_date,
              ""yes"",
              output v_abs_recid,
              output v_trflow_flg)" }
      end. /* DO ON STOP UNDO, LEAVE */
      assign
         c_src_addr   = so_site
         c_dest_addr  = so_ship
         c_trans_type = "ISS-COR".
      run p_del_abs.
      find abs_mstr where recid(abs_mstr) = v_abs_recid no-lock no-error.
      if available abs_mstr then do:
         for each tr_hist  
            where tr_hist.tr_domain = global_domain 
             and  tr_nbr  = so_nbr 
             and  tr_date = today       
             and  tr_type = "ISS-COR" and
            can-do(t_line_list, string(tr_line)) and
            tr_ship_id = ""
/*c1241*/ use-index tr_nbr_eff
         exclusive-lock:
            assign
               tr_ship_id       = substring(abs_id,2)
               tr_ship_inv_mov  = abs_inv_mov
               tr_ship_date     = abs_shp_date.
         end.
      end.
   end.
 
   /*CREATE BACK SHIPPER NOW */
   for first qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID
   exclusive-lock:
      qad_logfld[1] = yes.
   end.
 
   /* CLEAR SHIPPER LINE ITEM TEMP TABLE */
   {us/bbi/gprun.i ""icshmt1c.p""}
 
   assign v_lines_found = no.
 
   for each sod_det where sod_det.sod_domain = global_domain
      and sod_det.sod_nbr = so_mstr.so_nbr
      and sod_det.sod_compl_stat = ""
      and can-do(t_line_list, string(sod_det.sod_line)) = false
   no-lock:
      t_qty = 0.
      /* BYPASS REVERSAL LINE */
      if can-do(t_new_list, string(sod_det.sod_line)) then next.
 
      /* BYPASS REVERSAL LINE */
      find first cild_det where cild_domain = global_domain
                          and  cild_cor_inv  = cil_mstr.cil_cor_inv
                          and  cild_cor_so_nbr  = cil_mstr.cil_cor_so_nbr
                          and  cild_cor_line = sod_det.sod_line
                          and  cild_line_type = "R"
      no-lock no-error.
 
      if not available cild_det then
      find first cild_det where cild_domain = global_domain
                          and  cild_cor_inv  = cil_mstr.cil_cor_inv
                          and  cild_cor_so_nbr  = cil_mstr.cil_cor_so_nbr
                          and  cild_prev_line  = sod_det.sod_line
                          and  cild_line_type = "R"
      no-lock no-error.
 
      /* FIND REVERSE IN SODDET FOR ADDING QUANTITY USE */
      find first soddet where
             soddet.sod_domain = global_domain
         and soddet.sod_nbr  = so_nbr
         and soddet.sod_compl_stat = ""
         and soddet.sod_line = (if cild_cor_line = sod_det.sod_line then
                                   cild_prev_line
                                else
                                   cild_cor_line)
      no-lock no-error.
 
      if not available soddet then next.
 
      assign
         t_org_qty = 0
         t_rev_qty = 0.
 
      find first t_sod_qty where t_sod_qty.t_line = sod_det.sod_line
      no-lock no-error.
 
      if available t_sod_qty then t_org_qty = t_qty_chg.
 
      if soddet.sod_part = sod_det.sod_part then do:
         find first t_sod_qty where t_sod_qty.t_line = soddet.sod_line
         no-lock no-error.
         if available t_sod_qty then
            t_rev_qty = t_qty_chg * t_um_conv  / sod_det.sod_um_conv.
         t_qty =  t_org_qty + t_rev_qty.
      end.
      else
         t_qty =  t_org_qty.
 
      if t_qty >= 0 then next.
 
      find pt_mstr where pt_domain = global_domain and
         pt_part = soddet.sod_part
      no-lock no-error.
 
      t_new_list = t_new_list + ( if t_new_list = "" then ""
                                  else "," ) +  string(sod_det.sod_line).
 
      if soddet.sod_part = sod_det.sod_part then
        t_new_list =  t_new_list + ( if t_new_list = "" then ""
                                     else "," ) +  string(soddet.sod_line).
 
      for each sr_wkfl
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
         and  (sr_lineid = string(sod_det.sod_line)
            or sr_lineid = string(soddet.sod_line))
      no-lock
      break by sr_domain
            by sr_site
            by sr_loc
            by sr_lotser
            by sr_ref:
         accumulate sr_qty (total by sr_ref).
 
         if last-of(sr_ref)
            and (accum total by sr_ref sr_qty) <> 0
         then do:
            /* ADD TO SHIPPER LINE ITEM TEMP TABLE */
            {us/bbi/gprun.i ""icshmt1a.p""
               "(sod_det.sod_nbr,
                 sod_det.sod_line,
                 sod_det.sod_part,
                 sr_lotser,
                 sr_ref,
                 sr_site,
                 sr_loc,
                 accum total by sr_ref sr_qty,
                 sod_det.sod_um,
                 sod_det.sod_um_conv,
                 if avail pt_mstr then
                 pt_net_wt * (accum total by sr_ref sr_qty) * sod_det.sod_um_conv
                 else 0,
                 if avail pt_mstr then
                 pt_net_wt_um
                 else """",
                 if avail pt_mstr then
                 pt_size * (accum total by sr_ref sr_qty)
                 else 0,
                 if avail pt_mstr then
                 pt_size_um
                 else """" )" }
 
            assign v_lines_found = true.
         end. /* IF last-of(sr_ref) and ... */
      end. /* FOR EACH sr_wkfl */
   end.
 
   if v_lines_found
   then do:
      do on stop undo, leave:
         /*HIDE FRAME SHIP-DATE.*/
/*c1367*          {us/bbi/gprun.i ""icshmt.p"" */
/*c1367*/         {us/bbi/gprun.i ""xxicshmt.p""
            "(so_site,
              so_ship,
              ""ISS-COR"",
              eff_date,
              ""yes"",
              output v_abs_recid,
              output v_trflow_flg)" }
      end. /* DO ON STOP UNDO, LEAVE */
      assign
         c_src_addr   = so_site
         c_dest_addr  = so_ship
         c_trans_type = "ISS-COR".
      run p_del_abs.
      find abs_mstr where recid(abs_mstr) = v_abs_recid no-lock no-error.
 
      if available abs_mstr then do:
         for each tr_hist where tr_domain = global_domain and
                                tr_nbr  = so_nbr    and
                                tr_date = today     and
                                tr_type = "ISS-COR" and
            can-do(t_new_list, string(tr_line))     and
                                tr_ship_id = ""
/*c1241*/ use-index tr_nbr_eff
         exclusive-lock:
            assign
               tr_ship_id       = substring(abs_id,2)
               tr_ship_inv_mov  = abs_inv_mov
               tr_ship_date     = abs_shp_date.
         end.
      end.
 
   end.
 
   for first qad_wkfl where qad_wkfl.qad_domain = global_domain and
      qad_key1 = "SHIPPER" and
      qad_key2 = SessionUniqueID
   exclusive-lock:
      delete qad_wkfl.
   end.
 
END PROCEDURE.
 
PROCEDURE p_dispatchNoteShipper:
 
   define buffer soddet for sod_det.
   define buffer qad_wkfl for qad_wkfl.
   define buffer tr_hist for tr_hist.

   define variable t_qty       like sod_qty_ord no-undo.
   define variable t_line_list as character     no-undo.
   define variable t_new_list  as character     no-undo.
 
   for first qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID
   exclusive-lock:
      qad_logfld[1] = no.
   end.
   if not can-find (qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID)
   then do transaction:
      create qad_wkfl.
      assign
         qad_domain = global_domain
         qad_key1 = "SHIPPER"
         qad_key2 = SessionUniqueID
         qad_logfld[1] = no.
   end.
  
   {us/bbi/gprun.i ""icshmt1c.p""}
 
   assign
      v_lines_found = no
      t_line_list   = ""
      t_new_list    = "".
 
   /*CREATE SHIPPER FIRST*/
   for each sod_det where sod_det.sod_domain = global_domain
                      and sod_det.sod_nbr = so_mstr.so_nbr
                      and sod_det.sod_compl_stat = ""
   no-lock:
      t_qty = 0.
      if can-do(t_line_list, string(sod_det.sod_line)) then next.
 
      find first t_sod_qty where t_sod_qty.t_line = sod_det.sod_line
      no-lock no-error.
 
      if available t_sod_qty then t_qty = t_qty_chg.
 
      if t_qty <= 0 then next.
 
      t_line_list = t_line_list + ( if t_line_list = "" then ""
                                    else "," ) +  string(sod_det.sod_line).
 
      find pt_mstr where pt_domain = global_domain and
         pt_part = sod_det.sod_part
      no-lock no-error.
 
      temp_loc = sod_det.sod_loc.
 
      for each sr_wkfl
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
         and   sr_lineid = string(sod_det.sod_line)
      no-lock:
         /* ADD TO SHIPPER LINE ITEM TEMP TABLE */
         {us/bbi/gprun.i ""icshmt1a.p""
            "(sod_det.sod_nbr,
              sod_det.sod_line,
              sod_det.sod_part,
              sr_lotser,
              sr_ref,
              sr_site,
              sr_loc,
              sr_qty,
              sod_det.sod_um,
              sod_det.sod_um_conv,
              if avail pt_mstr then
              pt_net_wt * sr_qty * sod_det.sod_um_conv
              else 0,
              if avail pt_mstr then
              pt_net_wt_um
              else """",
              if avail pt_mstr then
              pt_size * sr_qty
              else 0,
              if avail pt_mstr then
              pt_size_um
              else """" )" }
 
         assign v_lines_found = true.
      end. /* FOR EACH sr_wkfl */
   end.
 
   if v_lines_found then do:
 
      /* Global Shipping */
      if sorec = fsrmarec then do:
 
         find rma_mstr where rma_domain = global_domain
            and rma_nbr = so_mstr.so_nbr
            and rma_prefix = "C"
         no-lock no-error.
 
         if available rma_mstr
         then do:
            do on stop undo,leave:
/*c1367*                {us/bbi/gprun.i ""icshmt.p"" */
/*c1367*/               {us/bbi/gprun.i ""xxicshmt.p""
                  "(rma_site_rec,
                    so_ship,
                    ""ISS-SO"",
                    eff_date,
                    ""yes"",
                    output v_abs_recid,
                    output v_trflow_flg)" }
            end. /* DO ON STOP UNDO, LEAVE */
            assign
               c_src_addr   = rma_site_rec
               c_dest_addr  = so_ship
               c_trans_type = "ISS-SO".
            run p_del_abs.
         end.
      end.
 
      else if sorec = fsrmaship then do:
 
         find rma_mstr where rma_domain = global_domain
            and rma_nbr = so_mstr.so_nbr
            and rma_prefix = "C"
         no-lock no-error.
 
         if available rma_mstr
         then do:
            do on stop undo,leave:
/*c1367*                {us/bbi/gprun.i ""icshmt.p"" */
/*c1367*/               {us/bbi/gprun.i ""xxicshmt.p""
                  "(rma_site_iss,
                    so_ship,
                    ""ISS-SO"",
                    eff_date,
                    ""yes"",
                    output v_abs_recid,
                    output v_trflow_flg)" }           
            end. /* DO ON STOP UNDO, LEAVE */
            assign
               c_src_addr   = rma_site_iss
               c_dest_addr  = so_ship
               c_trans_type = "ISS-SO".
            run p_del_abs. 
         end.
      end.
 
      else do:
         do on stop undo,leave:
/*c1367*             {us/bbi/gprun.i ""icshmt.p"" */
/*c1367*/            {us/bbi/gprun.i ""xxicshmt.p""
            "(so_site,
              so_ship,
              ""ISS-SO"",
              eff_date,
              ""yes"",
              output v_abs_recid,
              output v_trflow_flg)" }      
         end. /* DO ON STOP UNDO ,LEAVE */
         assign
            c_src_addr   = so_site
            c_dest_addr  = so_ship
            c_trans_type = "ISS-SO".
         run p_del_abs.
      end.
 
      find abs_mstr where recid(abs_mstr) = v_abs_recid no-lock no-error.
 
      if available abs_mstr then do:
 
         for each tr_hist
            where tr_hist.tr_domain = global_domain
             and  tr_nbr  = so_nbr and
                  tr_date = today  and
                  tr_type = "ISS-SO" and
                  can-do(t_line_list, string(tr_line)) and
                  tr_ship_id = ""
/*c1241*/ use-index tr_nbr_eff
         exclusive-lock:
            assign
               tr_ship_id       = substring(abs_id,2)
               tr_ship_inv_mov  = abs_inv_mov
               tr_ship_date     = abs_shp_date.
         end.
 
         /* If the transaction flow is not internal,
            then print legal document*/
         if v_trflow_flg = yes then do:
            /* Global Shipping: assign Legal Doc nbr */
            {us/bbi/gprun.i ""gpldnbr.p"" "(recid(abs_mstr))"}
 
            if sorec = fsrmarec then do:
               temp_site = rma_site_rec.
            end.
            else if sorec = fsrmaship then do:
               temp_site = rma_site_iss.
            end.
            else do:
               temp_site = so_site.
            end.
 
            /* COLLECT INFO FOR THE LEGAL DOCUMENT */
            {us/px/pxrun.i &PROC       = 'saveLegalSiteLoc'
                     &PROGRAM    = 'soldxr.p'
                     &HANDLE     = ph_soldxr
                     &PARAM      = "(input abs_id,
                                     input temp_site,
                                     input temp_loc,
                                     input so_ship,
                                     input """")"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
 
            if sorec = fsrmarec or sorec = fsrmaship then do:
               {us/bbi/gprun.i ""gpldcmt.p"" "(recid(abs_mstr),'RMA')"}
            end.
 
            {us/bbi/gprun.i ""icldprt.p"" "(recid(abs_mstr))"}
         end.
      end.
 
   end.
 
   /*CREATE BACK SHIPPER NOW */
   for first qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID
   exclusive-lock:
      qad_logfld[1] = yes.
   end.

   /* CLEAR SHIPPER LINE ITEM TEMP TABLE */
   {us/bbi/gprun.i ""icshmt1c.p""}
 
   assign v_lines_found = no.
 
   for each sod_det no-lock where sod_det.sod_domain = global_domain
                              and sod_det.sod_nbr = so_mstr.so_nbr
                              and sod_det.sod_compl_stat = ""
      and can-do(t_line_list, string(sod_det.sod_line)) = false:
      t_qty = 0.
      if can-do(t_new_list, string(sod_det.sod_line)) then next.
 
      find first t_sod_qty where t_sod_qty.t_line = sod_det.sod_line
      no-lock no-error.
 
      if available t_sod_qty then t_qty = t_qty_chg.
 
      if t_qty >= 0 then next.
 
      t_new_list = t_new_list + ( if t_new_list = "" then ""
                                  else "," ) +  string(sod_det.sod_line).
 
      temp_loc = sod_det.sod_loc.
 
      for each sr_wkfl
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
         and   sr_lineid = string(sod_det.sod_line)
      no-lock:
         /* ADD TO SHIPPER LINE ITEM TEMP TABLE */
         {us/bbi/gprun.i ""icshmt1a.p""
            "(sod_det.sod_nbr,
              sod_det.sod_line,
              sod_det.sod_part,
              sr_lotser,
              sr_ref,
              sr_site,
              sr_loc,
              sr_qty,
              sod_det.sod_um,
              sod_det.sod_um_conv,
              if avail pt_mstr then
              pt_net_wt * sr_qty * sod_det.sod_um_conv
              else 0,
              if avail pt_mstr then
              pt_net_wt_um
              else """",
              if avail pt_mstr then
              pt_size * sr_qty
              else 0,
              if avail pt_mstr then
              pt_size_um
              else """" )" }
 
         assign
            v_lines_found = true.
      end. /* FOR EACH sr_wkfl */
   end.
 
   if v_lines_found then do:
 
      /* Global Shipping */
      if sorec = fsrmarec then do:
 
         find rma_mstr where rma_domain = global_domain
            and rma_nbr = so_mstr.so_nbr
            and rma_prefix = "C"
         no-lock no-error.
 
         if available rma_mstr
         then do:
            do on stop undo,leave:
/*c1367*                {us/bbi/gprun.i ""icshmt.p"" */
/*c1367*/               {us/bbi/gprun.i ""xxicshmt.p""
                  "(rma_site_rec,
                    so_ship,
                    ""ISS-SO"",
                    eff_date,
                    ""yes"",
                    output v_abs_recid,
                    output v_trflow_flg)" }
            end. /* DO ON STOP UNDO, LEAVE */
            assign
               c_src_addr   = rma_site_rec
               c_dest_addr  = so_ship
               c_trans_type = "ISS-SO".
            run p_del_abs.
         end.
      end.
 
      else if sorec = fsrmaship then do:
 
         find rma_mstr where rma_domain = global_domain
            and rma_nbr = so_mstr.so_nbr
            and rma_prefix = "C"
         no-lock no-error.
 
         if available rma_mstr
         then do:
            do on stop undo,leave:
/*c1367*                {us/bbi/gprun.i ""icshmt.p"" */
/*c1367*/               {us/bbi/gprun.i ""xxicshmt.p""
                  "(rma_site_iss,
                    so_ship,
                    ""ISS-SO"",
                    eff_date,
                    ""yes"",
                    output v_abs_recid,
                    output v_trflow_flg)" }
            end. /* DO ON STOP UNDO, LEAVE */
            assign
               c_src_addr   = rma_site_iss
               c_dest_addr  = so_ship
               c_trans_type = "ISS-SO".
            run p_del_abs.
         end.
      end.
 
      else do:
         do on stop undo,leave:
/*c1367*             {us/bbi/gprun.i ""icshmt.p"" */
/*c1367*/            {us/bbi/gprun.i ""xxicshmt.p""
               "(so_site,
                 so_ship,
                 ""ISS-SO"",
                 eff_date,
                 ""yes"",
                 output v_abs_recid,
                 output v_trflow_flg)" }
         end. /* DO ON STOP UNDO, LEAVE */
         assign
            c_src_addr   = so_site
            c_dest_addr  = so_ship
            c_trans_type = "ISS-SO".
         run p_del_abs.
      end.
 
      find abs_mstr where recid(abs_mstr) = v_abs_recid no-lock no-error.
 
      if available abs_mstr then do:
         for each tr_hist
            where tr_domain  = global_domain
            and   tr_nbr     = so_nbr
            and   tr_date    = today
            and   tr_type    = "ISS-SO"
            and   tr_ship_id = ""
            and   can-do(t_new_list, string(tr_line))
         exclusive-lock:
            assign
               tr_ship_id       = substring(abs_id,2)
               tr_ship_inv_mov  = abs_inv_mov
               tr_ship_date     = abs_shp_date.
         end.
 
         /* If the transaction flow is not internal,
            then print legal document*/
         if v_trflow_flg = yes then do:
            /* For ISS transactions, if quantity < 0, legal doc nbr
               will be assinged in icshldmt.p */
            for first lgdd_det
               where lgdd_domain     =  global_domain
               and   lgdd_shipper_id =  abs_id
               and   lgdd_qty_item   >= 0
            no-lock:
 
               /* Global Shipping: assign Legal Doc nbr */
               {us/bbi/gprun.i ""gpldnbr.p"" "(recid(abs_mstr))"}
 
            end.
 
            if sorec = fsrmarec then do:
               temp_site = rma_site_rec.
            end.
            else if sorec = fsrmaship then do:
               temp_site = rma_site_iss.
            end.
            else do:
               temp_site = so_site.
            end.
 
            /* COLLECT INFO FOR THE LEGAL DOCUMENT */
            {us/px/pxrun.i &PROC       = 'saveLegalSiteLoc'
                     &PROGRAM    = 'soldxr.p'
                     &HANDLE     = ph_soldxr
                     &PARAM      = "(input abs_id,
                                     input so_site,
                                     input temp_loc,
                                     input so_ship,
                                     input """")"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
 
            if sorec = fsrmarec or sorec = fsrmaship then do:
               {us/bbi/gprun.i ""gpldcmt.p"" "(recid(abs_mstr),'RMA')"}
            end.
 
            {us/bbi/gprun.i ""icldprt.p"" "(recid(abs_mstr))"}
         end.
      end.
 
   end.
 
   for first qad_wkfl where qad_wkfl.qad_domain = global_domain and
      qad_key1 = "SHIPPER" and
      qad_key2 = SessionUniqueID
   exclusive-lock:
      delete qad_wkfl.
   end.
 
END PROCEDURE.

PROCEDURE p_del_abs:
/*----------------------------------------------------------------------------
 Purpose:    To delete parent abs_mstr record if child record does not exist
             when there is an abrupt exit from the Shipper trailer frame, since 
             only the parent abs_mstr record is retained and not the child
             record, also to delete qad_wkfl which gets created for icshmt.p.
 Parameters:
 Notes:
-----------------------------------------------------------------------------*/

   define buffer bAbsMstr for abs_mstr.
   define buffer abs_mstr for abs_mstr.
   define buffer qad_wkfl for qad_wkfl.

   for first qad_wkfl
      where qad_domain = global_domain
      and   qad_key1   = "icshmt.p"
      and   qad_key4   = SessionUniqueID 
   no-lock:
      if global_recid = ?
      then do:
         find first bAbsMstr
            where bAbsMstr.abs_domain   = global_domain
            and   bAbsMstr.abs_shipfrom = qad_charfld[3]
            and   bAbsMstr.abs_id       = qad_charfld[2] 
         exclusive-lock no-error.
         if available bAbsMstr
         then do:
            if not can-find(first abs_mstr
               where abs_mstr.abs_domain   = global_domain
               and   abs_mstr.abs_shipfrom = bAbsMstr.abs_shipfrom
               and   abs_mstr.abs_par_id   = bAbsMstr.abs_id)
            then 
               delete bAbsMstr.
         end. /* IF AVAILABLE bAbsmstr */
      end. /* IF GLOBAL_RECID = ? */
      find current qad_wkfl exclusive-lock no-error.
      if available qad_wkfl
      then
         delete qad_wkfl.
   end. /*  FOR FIRST qad_wkfl */


END PROCEDURE.
