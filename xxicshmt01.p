/* xxicshmt01.p - Multi-Transaction Shipper Maintenance                       */
/* icshmt.p - Multi-Transaction Shipper Maintenance                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxicshmt01.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/*                                                                            */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K04X* Steve Goeke        */
/* REVISION: 8.6      LAST MODIFIED: 04/09/97   BY: *K08N* Steve Goeke        */
/* REVISION: 8.6      LAST MODIFIED: 04/22/97   BY: *K0C5* Taek-Soo Chang     */
/* REVISION: 8.6      LAST MODIFIED: 09/26/97   BY: *K0K1* John Worden        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 11/10/98   BY: *K1Y6* Seema Varma        */
/* REVISION: 9.0      LAST MODIFIED: 03/10/99   BY: *M0B8* Hemanth Ebenezer   */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/25/99   BY: *N002* Bill Gates         */
/* REVISION: 9.1      LAST MODIFIED: 11/07/99   BY: *L0L4* Michael Amaladhas  */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KS* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/29/00   BY: *N0W6* Mudit Mehta        */
/* Revision: 1.16     BY: Ellen Borden            DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.17     BY: Katie Hilbert           DATE: 12/05/01  ECO: *P03C* */
/* Revision: 1.18     BY: Samir Bavkar            DATE: 08/15/02  ECO: *P09K* */
/* Revision: 1.19     BY: Ashish Maheshwari       DATE: 12/03/02  ECO: *N214* */
/* Revision: 1.20     BY: Kirti Desai             DATE: 04/16/03  ECO: *P0Q0* */
/* Revision: 1.22     BY: Paul Donnelly (SB)      DATE: 06/26/03  ECO: *Q00G* */
/* Revision: 1.23     BY: Patrick de Jong         DATE: 08/15/03  ECO: *Q028* */
/* Revision: 1.24     BY: Dan Herman              DATE: 10/28/04  ECO: *M1LL* */
/* Revision: 1.26     BY: Ed van de Gevel         DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.27     BY: Ed van de Gevel         DATE: 18/03/05  ECO: *R00F* */
/* Revision: 1.28     BY: Deirdre O'Brien         DATE: 09/07/05  ECO: *R01P* */
/* Revision: 1.29     BY: Ellen Borden            DATE: 12/01/05  ECO: *R000* */
/* Revision: 1.30     BY: Robin McCarthy          DATE: 06/30/06  ECO: *R04J* */
/* Revision: 1.31     BY: Prashant Parab          DATE: 10/04/06  ECO: *P58V* */
/* Revision: 1.32     BY: Antony Lejo.S           DATE: 07/16/07  ECO: *P5HM* */
/* Revision: 1.35     BY: Jean Miller             DATE: 09/13/07  ECO: *R0C6* */
/* Revision: 1.36     BY: Jean Miller             DATE: 11/07/07  ECO: *P637* */
/* Revision: 1.37     BY: Jean Miller             DATE: 11/13/07  ECO: *R0K4* */
/* Revision: 1.38     BY: Xavier Prat             DATE: 01/28/08  ECO: *R0M1* */
/* Revision: 1.39     BY: Ellen Borden            DATE: 02/01/08  ECO: *R059* */
/* Revision: 1.40     BY: Vijaykumar Patil        DATE: 05/27/08  ECO: *P6TM* */
/* Revision: 1.42     BY: Nan Zhang               DATE: 06/04/08  ECO: *R0JS* */
/* Revision: 1.50     BY: Miguel Alonso           DATE: 06/26/08  ECO: *R0NZ* */
/* Revision: 1.51     BY: Jean Miller             DATE: 08/13/08  ECO: *R118* */
/* Revision: 1.58     BY: Jiang Wan               DATE: 12/20/08  ECO: *R1BY* */
/* Revision: 1.60     BY: Yizhou Mao              DATE: 03/13/09  ECO: *R1DT* */
/* Revision: 1.61     BY: Prabu M                 DATE: 06/22/09  ECO: *Q31S* */
/* Revision: 1.63     BY: Prabu M                 DATE: 09/23/09  ECO: *Q3FW* */
/* Revision: 1.64     BY: Prabu M                 DATE: 11/06/09  ECO: *Q3LF* */
/* Revision: 1.66     BY: Prabu M                 DATE: 11/10/09  ECO: *Q3LP* */
/* Revision: 1.68     BY: Jiang Wan               DATE: 12/14/09  ECO: *R1V9* */
/* Revision: 1.69     BY: Jordan Fei              DATE: 01/28/10  ECO: *R1XF* */
/* Revision: 1.70     BY: Archana Kirtane         DATE: 04/01/10  ECO: *Q3ZG* */
/* $Revision: 1.2 $  BY: Xiaolei Meng            DATE: 04/26/10  ECO: *R22Q* */
/* CYB   LAST MODIFIED: 23-AUG-2011     BY: gbg *cy1024                       */
/* CYB   LAST MODIFIED: 23-AUG-2011     BY: gbg *cy1047                       */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}    /* EXTERNAL LABEL INCLUDE */
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/so/sottval.i}    /* COMMON TEMP-TABLES FOR ASN VALIDATION */
{us/so/sovalcon.i}   /* COMMON CONSTANTS FOR ASN VALIDATION */
{us/so/sovalprc.i}   /* COMMON PROCEDURES FOR ASN VALIDATION */
{us/gp/gpuid.i}
{us/ic/icshtxut.i}   /* Common procedures for inventory movment tax */

/* INPUT PARAMETERS */
define input parameter i_src_addr  like ad_addr no-undo.
define input parameter i_dest_addr like ad_addr no-undo.
define input parameter i_tr_type   like tr_type no-undo.
define input parameter i_eff_date  as   date    no-undo.
define input parameter i_l_exec    like mfc_logical no-undo.

/* OUTPUT PARAMETERS */
define output parameter o_recid as recid initial ? no-undo.
define output parameter o_trflow_flg   as logical  no-undo.

/* SHARED VARIABLES */
define shared variable global_recid as recid.

/* LOCAL VARIABLES */
define variable v_upd_addrs     as   logical      no-undo.
define variable v_shipgrp       like sg_grp       no-undo.
define variable v_invmov        like im_inv_mov   no-undo.
define variable v_save_shipfrom like abs_shipfrom no-undo.
define variable v_save_id       like abs_id       no-undo.
define variable v_save_shipto   like abs_shipto   no-undo.
define variable v_save_invmov   like im_inv_mov   no-undo.
define variable v_number        like abs_id       no-undo.
define variable v_addr          like ad_addr      no-undo.
define variable v_access        as   integer      no-undo.
define variable v_auth          as   logical      no-undo.
define variable v_fob           as   character    no-undo.
define variable v_shipvia       as   character    no-undo.
define variable v_cont          like mfc_logical  no-undo.
define variable v_err           as   logical      no-undo.
define variable v_errnum        as   integer      no-undo.
define variable v_deleted       as   logical      no-undo.
define variable use-log-acctg   as   logical      no-undo.
define variable lNewAbsMstr     as   logical      no-undo.
define variable dtShipDate      as   date         no-undo.
define variable lCorrect        as   logical      no-undo.
define variable lErrCondition   as   logical      no-undo.
define variable lWarnCondition  as   logical      no-undo.
define variable cShipStep       as   character    no-undo.
define variable lValidationDone as   logical      no-undo.
define variable lDispPrintFrame as   logical      no-undo.
define variable p_error         like mfc_logical initial no no-undo.
define buffer bAbsMstr for abs_mstr.
define variable l_undoflg       like mfc_logical  no-undo.
define variable vlApplyTax      as   logical      no-undo.
define variable l_default       as   logical      no-undo.
define variable l_rec           as   recid        no-undo.

/* Global Shipping: Legal Doc */
define variable i_err_num       as   integer      no-undo.
define variable v_imflow        like im_flow      no-undo.
define variable v_tr_type       like im_tr_type   no-undo.
define variable ld_max_lines    as   integer      no-undo.
define variable actual_lines    as   integer      no-undo.
define variable existing_lines  as   integer      no-undo.
define variable v_unconfirm_flg like mfc_logical initial no no-undo.

define new shared variable v_rtn_tr_flg as logical initial no no-undo.

/* CREDIT MANAGEMENT */
define variable hCreditLibrary    as handle        no-undo.
{us/mf/mfcredpl.i "hCreditLibrary"}
run initialiseCreditManagementLibrary ( input  hCreditLibrary,
                                        output hCreditLibrary).

define variable hBlockedTransactionLibrary as handle  no-undo.
define variable lBlockedTransactionError   as logical no-undo.
define variable lRestricted                as logical no-undo.

/* Blocked Transaction common library prototypes */
{us/mg/mgbltrpl.i "hBlockedTransactionLibrary"}

/* update restrictions module */
{us/up/updaterestriction.i}

define new shared variable h_wiplottrace_procs as handle no-undo.
define new shared variable h_wiplottrace_funcs as handle no-undo.

/* WAREHOUSING VARIABLES */
define variable LVShipper like abs_id no-undo.
define variable LVAbsID like abs_id no-undo.
define variable LVOpenTasks like mfc_logical   no-undo.
define variable LVContinue  like mfc_logical   no-undo.

define variable l_cons_ship like abs_cons_ship no-undo.
define variable l_processed as   logical no-undo.

define buffer sgad_buff for sgad_det.

{us/wl/wlfnc.i} /*FUNCTION FORWARD DECLARATIONS*/

if is_wiplottrace_enabled()
then do:
   {us/bbi/gprun.i ""wlpl.p"" "persistent set h_wiplottrace_procs"}
   {us/bbi/gprun.i ""wlfl.p"" "persistent set h_wiplottrace_funcs"}
end.

/* SHARED TEMP TABLES */
{us/ic/icshmtdf.i}
define variable v_inv_mov  like  im_inv_mov   no-undo.

if i_tr_type = "ISS-UNP" or i_tr_type = "RCT-UNP" then do transaction:
   find qad_wkfl where qad_wkfl.qad_domain = global_domain and
      qad_key1 = "INV_MOV_" + i_tr_type and
      qad_key2 = SessionUniqueID
   exclusive-lock no-error.
   if available qad_wkfl then do:
      assign v_inv_mov = qad_charfld[1].
      delete qad_wkfl.
   end.
   else
      assign v_inv_mov = "".
end.

{us/mf/mfaimfg.i} /* Common API constants and variables */
{us/ic/icshxt01.i} /* API shipper temp tables */

define variable absID       like abs_id.
define variable absShipFrom like abs_shipfrom.
define variable absShipTo   like abs_shipto.
define variable sgGrp       like sg_grp.
define variable sgInvMov    like sg_inv_mov.
define buffer b_abs_mstr for abs_mstr.

if c-application-mode = "API" then do:

   /* Get handle of API controller */
   {us/bbi/gprun.i ""gpaigh.p""
      "(output ApiMethodHandle,
        output ApiProgramName,
        output ApiMethodName,
        output ApiContextString)"}

   /* Get shipper temp-table */
   run getShipper in ApiMethodHandle
      (output table ttShipper).

   find first ttShipper no-error.

end. /* IF c-application-mode = "API" */

/* FRAMES */
form
   abs_shipfrom   colon 25 label "Ship-From"
   si_desc           at 37 no-label
   abs_id         colon 25 label "Number"
   skip(1)
   abs_shipto     colon 25 label "Ship-To/Dock"
   ad_name           at 37 no-label
   ad_line1          at 37 no-label
   sg_grp         colon 25
   sg_desc           at 37 no-label
   v_invmov       colon 25
   im_desc           at 37 no-label
with frame aship side-labels width 80
title color normal (getFrameTitle("SHIPPING_INFORMATION",29)).

/* SET EXTERNAL LABELS */
setFrameLabels(frame aship:handle).

/* DETERMINE IF LOGISTICS ACCOUNTING IS IN USE */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

/* TRIGGERS */
on entry of abs_shipfrom in frame aship do:
   run enterShipFrom.
end.  /* ON ENTRY OF abs_shipfrom */

on entry of abs_id in frame aship do:
   run enterAbsID.
end.  /* ON ENTRY OF abs_id */

on entry of abs_shipto in frame aship do:
   run enterShipTo.
end.  /* ON ENTRY OF abs_shipto */

on entry of v_invmov in frame aship do:
   run enterInvMov.
end.  /* ON ENTRY OF v_invmov */

on leave of abs_shipfrom in frame aship do:
   if c-application-mode <> "API"
      then
      absshipfrom = input abs_shipfrom .

   if v_save_shipfrom <> input abs_shipfrom
      then
      run ip_refresh_id.
end.  /* ON LEAVE OF abs_shipfrom */

on leave of abs_id in frame aship do:
   if (c-application-mode <> "API"
      and v_save_id       <> input abs_id)
      or (c-application-mode = "API"
      and v_save_id       <> absID)
      then
      run ip_refresh_id.
end.  /* ON LEAVE OF abs_id */

on leave of abs_shipto in frame aship do:
   if c-application-mode <> "API"
      then
      absshipto = input abs_shipto.

   if v_save_shipto <> input abs_shipto
      then
      run ip_refresh_grp.
end.  /* ON LEAVE OF abs_shipto */

on leave of v_invmov in frame aship do:
   if (c-application-mode <> "API"
      and v_save_invmov   <> input v_invmov)
      or (c-application-mode = "API"
      and v_save_invmov   <> sgInvMov)
      then
      run ip_refresh_invmov.
end.  /* ON LEAVE OF v_invmov */

/* VARIABLE DEFINITIONS FOR gpfile.i */
{us/bbi/gpfilev.i}

/*DETERMINE IF CONTAINER AND LINE CHARGES ARE ENABLED*/
{us/cc/cclc.i}

/* MAIN PROCEDURE BODY */
/* Read shipper control file */
{us/bbi/gprun.i ""socrshc.p""}

for first shc_ctrl where shc_ctrl.shc_domain = global_domain
no-lock: end.

main_blk:
repeat:

   if c-application-mode = "API" and retry then
      return error return-value.

   l_default = no.

   /* Allow update of addresses if SO or WO shipper */
   v_upd_addrs = (i_tr_type = "ISS-SO" or
                  i_tr_type = "ISS-WO" or
                  i_tr_type = "ISS-COR" or
                  i_tr_type = "ISS-MEMO")
              and i_eff_date = ?.
   /* CHECK WHETHER INITIAL DATA IS OK IF ADDRESSES AREN'T EDITABLE */
   if not v_upd_addrs
   then do:

      /* CHECK THAT ADDRESSES ARE DIFFERENT.  IF NOT THEN LEAVE. */
      if i_src_addr = i_dest_addr then
         leave main_blk.

      /* CHECK THAT BOTH ADDRESSES EXIST.  IF NOT THEN LEAVE. */
      if not
         (can-find (ad_mstr where ad_domain = global_domain and
                                  ad_addr = i_src_addr) and
          can-find (ad_mstr where ad_domain = global_domain and
                                  ad_addr = i_dest_addr))
      then
         leave main_blk.

      /* CHECK IF SHIPPING GROUP EXISTS.  IF NOT THEN LEAVE. */
      {us/bbi/gprun.i ""gpgetgrp.p""
         "(i_src_addr, i_dest_addr, output v_shipgrp)" }

      for first sg_mstr where sg_domain = global_domain
         and sg_grp = v_shipgrp
      no-lock: end.

      if not available sg_mstr then
         leave main_blk.

      /* CHECK THAT SHIPPING GROUP INCLUDES AT LEAST ONE VALID */
      /* INVENTORY MOVEMENT CODE.  IF NOT THEN LEAVE.          */
      for first sgid_det where sgid_domain = global_domain
         and sgid_grp = sg_grp
         and can-find (first im_mstr where im_domain = global_domain and
                                           im_inv_mov = sgid_inv_mov and
                                           im_tr_type = i_tr_type)
      no-lock: end.

      if not available sgid_det then
         leave main_blk.

   end.  /* IF NOT v_upd_addrs */

   /* LOOK FOR EXISTING SHIPPER THAT MATCHES TYPE, SOURCE, AND DEST */
   if c-application-mode <> "API" then
   for first abs_mstr where recid(abs_mstr) = global_recid
   no-lock: end.

   if available abs_mstr and
      abs_id begins "s" and
      substring(abs_status, 2, 1) <> "y" and
      ((abs_type = "s" and
      can-find (im_mstr where im_domain = global_domain
                         and (im_inv_mov = abs_inv_mov and
                              im_tr_type = i_tr_type))) or
         (abs_type = "s" and abs_inv_mov = "" and
             (i_tr_type = "ISS-SO" or i_tr_type = "ISS-COR"))  or
      (abs_type = "u" and i_tr_type = "ISS-WO")) and
      (v_upd_addrs or
      (abs_shipfrom = i_src_addr and abs_shipto = i_dest_addr))
   then do:

      if c-application-mode <> "API"
      then
         display
            abs_shipfrom
            substring(abs_id,2) when (execname <> "sosois.p" and execname <> "fsrmash.p") @ abs_id
            abs_shipto
         with frame aship.

      assign
         absShipFrom = abs_shipfrom
         absID       = substring(abs_id,2) when (execname <> "sosois.p" and execname <> "fsrmash.p")
         absShipTo   = abs_shipto.

      run ip_refresh_id.

   end.  /* IF AVAILABLE abs_mstr */

   /* DISPLAY INITIAL ADDRESS FIELDS */
   else do:

      if c-application-mode <> "API" then
      display
         i_src_addr  @ abs_shipfrom
         i_dest_addr @ abs_shipto
      with frame aship.
      assign
         absShipfrom = i_src_addr
         absShipTo   = i_dest_addr.
      run ip_refresh_shipfrom.
      run ip_refresh_grp.

   end.  /* ELSE */

   /* GET HEADER INFORMATION */
   input_blk:
   repeat with frame aship on endkey undo main_blk, leave main_blk:

      if c-application-mode = "API" and retry
         then return error return-value.

      if c-application-mode <> "API" then
         global_site = input abs_shipfrom.

      if c-application-mode = "API" and not available ttShipper
         then undo main_blk, leave main_blk.

      if c-application-mode = "API" then do:
         if v_upd_addrs then run enterShipFrom.
         run enterAbsID.
         if v_upd_addrs then run enterAbsShipTo.
         run enterInvMov.
      end.

      if c-application-mode <> "API" then
      prompt-for
         abs_shipfrom when (v_upd_addrs)
         abs_id
         abs_shipto   when (v_upd_addrs)
         v_invmov
         editing:

         /* SHIP FROM FIELD */
         if frame-field = "abs_shipfrom"
         then do:

            {us/mf/mfnp05.i
               abs_mstr
               abs_id
               " abs_mstr.abs_domain = global_domain
                 and abs_id  begins 's' or (execname <> 'rcshmt.p'
                 and ((v_upd_addrs or abs_shipto = input abs_shipto)
                 and (can-find ( im_mstr  where im_mstr.im_domain = global_domain
                           and ( im_inv_mov = abs_inv_mov
                           and   im_tr_type = i_tr_type))
                 or  (   abs_type    = 's'
                     and abs_inv_mov = ''
                     and i_tr_type   = 'ISS-SO')
                 or  abs_type = 'u')))"
               abs_shipfrom
               "input abs_shipfrom" }

            /* PROCESS NEXT/PREVIOUS SELECTION */
            if recno <> ?
            then do:
               /* DISPLAY NEXT/PREVIOUS SELECTION */
               display
                  abs_shipfrom
                  substring(abs_id,2) @ abs_id.
               run ip_refresh_id.
            end. /* IF recno <> ? */

         end.  /* IF frame-field = "abs_shipfrom" */

         /* SHIPPER NUMBER FIELD */
         else
         if frame-field = "abs_id"
         then do:

            {us/mf/mfnp05.i
               abs_mstr
               abs_id
               " abs_mstr.abs_domain = global_domain and
                 abs_shipfrom = input abs_shipfrom and
                 abs_id begins 's' and
                 (v_upd_addrs or abs_shipto = input abs_shipto) and
                 (can-find (im_mstr  where im_mstr.im_domain = global_domain
                 and (
                 im_inv_mov = abs_inv_mov and
                 im_tr_type = i_tr_type)) or
                 (abs_type = 's' and abs_inv_mov = ''
                 and (i_tr_type = 'ISS-SO' or i_tr_type = 'ISS-COR')) or
                 abs_type = 'u')"
               abs_id
               "('s' + input abs_id)" }

            /* PROCESS NEXT/PREVIOUS SELECTION */
            if recno <> ?
            then do:
               /* Display Next/Previous selection */
               display substring(abs_id,2) @ abs_id.
               run ip_refresh_id.
            end. /* IF recno <> ? */

         end.  /* IF frame-field = "abs_id" */

         if frame-field = "abs_shipto"
         then do:

            if i_tr_type = "ISS-WO"
            then do:

               {us/mf/mfnp.i
                  vd_mstr
                  abs_shipto
                  " vd_mstr.vd_domain = global_domain and vd_addr "
                  abs_shipto
                  vd_addr
                  vd_addr }

               /* PROCESS NEXT/PREVIOUS SELECTION */
               if recno <> ?
               then do:
                  /* DISPLAY NEXT/PREVIOUS SELECTION */
                  display vd_addr @ abs_shipto.
                  run ip_refresh_grp.
               end. /* IF recno <> ? */

            end.  /* IF i_tr_type = "ISS-WO" */

            else do:

               {us/mf/mfnp05.i
                  ad_mstr
                  ad_addr
                  " ad_mstr.ad_domain = global_domain and can-find
                    (ls_mstr  where ls_mstr.ls_domain = global_domain and (
                    ls_addr  = ad_addr and
                    (ls_type = 'customer' or
                    ls_type  = 'ship-to'  or
                    ls_type  = 'dock'))")
                  ad_addr
                  "input abs_shipto" }

               /* PROCESS NEXT/PREVIOUS SELECTION */
               if recno <> ?
               then do:
                  /* DISPLAY NEXT/PREVIOUS SELECTION */
                  display ad_addr @ abs_shipto.
                  run ip_refresh_grp.
               end. /* IF recno <> ? */

            end.  /* ELSE */

         end.  /* IF frame-field = "abs_shipto" */

         /* INVENTORY MOVEMENT CODE FIELD */
         else
         if frame-field = "v_invmov"
         then do:
            {us/mf/mfnp05.i
               im_mstr
               im_inv_mov
               " im_mstr.im_domain = global_domain and (im_tr_type  =
                 i_tr_type)"
               im_inv_mov
               "input v_invmov" }

            /* DISPLAY NEXT/PREVIOUS SELECTION */
            if recno <> ?
            then do:
               display im_inv_mov @ v_invmov.
               run ip_refresh_invmov.
            end.  /* IF recno <> ? */

         end.  /* ELSE IF frame-field = "v_invmov" */

      end.  /* EDITING */

      if (  execname = "sosois.p"
         or execname = "fsrmash.p" )
      then do:
         /* PROVIDE THE ERROR IF SHIPPER IS ALREADY EXISTS  */
         for first abs_mstr
            where abs_domain = global_domain
            and abs_id       = "s" + input abs_id
         no-lock:
         end. /* FOR FIRST abs_mstr THEN */
         if available abs_mstr
         then do:
            display
               "" @ abs_id
            with frame aship.
            /* SHIPPER EXISTs */
            {us/bbi/pxmsg.i &MSGNUM=1543 &ERRORLEVEL=4}
            next-prompt abs_id with frame aship.
            undo input_blk, retry input_blk.
         end. /* IF AVAILABLE abs_mstr THEN */
      end. /* IF EXECNAME = "sosois.p" */
      if i_l_exec = yes   
      then do:
         l_undoflg = no.
         run p-chk-qadwkfl(input input frame aship abs_shipfrom,
                           input "s",
                           input input frame aship abs_id,
                           input-output l_undoflg).
         if l_undoflg = yes
         then do:
            absID = "". 
            undo  input_blk, retry input_blk.
         end. /* IF l_undoflg = yes */

      end. /* IF i_l_exec = yes */

      if batchrun
         and c-application-mode <> "API"
      then do:
         assign
            absshipfrom = input abs_shipfrom
            absshipto   = input abs_shipto
            sgInvMov    = input v_invmov.
      end. /* IF batchrun */

      if batchrun 
      then
         /* INITIALIZE THE VARIABLES SET FROM CIM LOAD */
         run ip_refresh_grp.

      if c-application-mode = "API" then do:
         if v_upd_addrs
            and v_save_shipfrom <> absShipFrom
            then
            run ip_refresh_id.

         if v_save_id <> absID
            then
            run ip_refresh_id.

         if v_upd_addrs
            and v_save_shipto <> absShipTo
            then
            run ip_refresh_grp.

         if v_save_invmov <> sgInvMov
            then
            run ip_refresh_invmov.

      end.

      if c-application-mode <> "API" then do:
         assign
            absShipfrom = input abs_shipfrom
            absShipto   = input abs_shipto
            absId       = input abs_id
            sgInvMov    = input v_invmov.
      end.
      else do:
         if v_upd_addrs then do:
            assign
               {us/mf/mfaiset.i absShipfrom ttShipper.shipfrom}
               {us/mf/mfaiset.i absShipto   ttShipper.shipto}
               {us/mf/mfaiset.i absId       ttShipper.id}
               {us/mf/mfaiset.i sgInvMov    ttShipper.invMov}.
         end.
         else do:
            assign
               {us/mf/mfaiset.i absId    ttShipper.id}
               {us/mf/mfaiset.i sgInvMov ttShipper.invMov}.
         end.
      end.

      if is_wiplottrace_enabled()
         and i_tr_type = "ISS-WO"
      then do:
         if not(can-find(first wc_mstr
                         where wc_domain = global_domain
                         and   wc_wkctr  = absShipto))
         then do:
            /* WORK CENTER NOT DEFINED WITH THIS CODE: */
            {us/bbi/pxmsg.i &MSGNUM=739 &ERRORLEVEL=2 &MSGARG1=absShipto}
         end. /* IF NOT(CAN-FIND(FIRST wc_mstr */
      end. /* IF is_wiplottrace_enabled() */

      /* FIND SELECTED SHIPPER */
      for first abs_mstr
         where abs_domain = global_domain
           and abs_shipfrom = absShipFrom
           and abs_id       = "s" + absId
      no-lock: end.
      
      if available abs_mstr
      then do:

         if    execname = "reshmt.p"
         or    execname = "rcshmt.p"
         then do:
             run ip_update_ship_to
            (input frame aship abs_shipfrom,
             input frame aship abs_id).
         end. /* IF execname = "reshmt.p" */

      run ip_refresh_id.

      end. /* IF AVAILABLE abs_mstr */      
  
      /* Set Blocked Transaction Library running persistently */
      run mfairunh.p
         (input "mgbltrpl.p",
         input ?,
         output hBlockedTransactionLibrary).

      if available abs_mstr
      then do:

         /* Check for blocked customers if running from shipper maintenance */
         if execname = "rcshmt.p"
         then do:

            /*
            * Check to see if the shipper has any blocked transactions for
            * its customers
            */
            run checkShipperForBlockedTransactions in hBlockedTransactionLibrary
               (input abs_mstr.oid_abs_mstr,
                input abs_shipto,  /* don't need to check shipto again */
                input {&SO009},
                input true,        /* display message */
                output lBlockedTransactionError).

            /* If one of the customers is blocked then raise an error */
            if lBlockedTransactionError
            then do:
               undo input_blk, retry input_blk.
            end.

            /* Set the Update Restriction Library to run persistently */
            run mfairunh.p
               (input "mgurpl.p",
                input ?,
                output hUpdateRestrictedLibrary).

            /* Check to see if the shipper has any restricted sales orders */
            run checkShipperForRestrictions in hUpdateRestrictedLibrary
               (input  oid_abs_mstr,
                input  {&SOSHP},
                input  true,
                input  hBlockedTransactionLibrary,
                output lRestricted).

            /* If any of the sales orders are restricted then undo */
            if lRestricted
            then do:
               undo input_blk, retry input_blk.
            end.

            delete procedure hUpdateRestrictedLibrary.

         end.

         /* CHECK THERE ARE NO OPEN WAREHOUSE TRANSACTIONS FOR THIS DOCUMENT */
         if {us/wh/whgpwhon.i} and (i_tr_type = "ISS-SO" or i_tr_type = "ISS-COR")
         then do:

            for each TranD where TranD.Domain = global_domain
               and TranD.TrStatus <> "CANCEL"
               and TranD.TrType = "PICK-SO"
               and TranD.AbsShipFrom = abs_shipfrom
               and TranD.AbsID <> ""
            no-lock:

               assign
                  LVShipper = ""
                  LVAbsID = entry(1,TranD.AbsID).

               /* RETRIEVE PRE-SHIPPER/SHIPPER */
               {us/bbi/gprun.i ""whshpget.p"" "(input TranD.AbsShipFrom,
                  input LVAbsID,
                  output LVShipper)"}

               if LVShipper = abs_id then do:
                  LVOpenTasks = yes.
                  leave.
               end.
            end. /* FOR EACH TranD */

            if LVOpenTasks then do:

               if c-application-mode <> "API" then
                  LVContinue = false.
               else
                  LVContinue = true.
               /* OPEN WAREHOUSE TRANSACTIONS EXIST FOR THIS DOCUMENT. */
               /* CONTINUE? */
               {us/bbi/pxmsg.i &MSGNUM=10777 &ERRORLEVEL=2 &CONFIRM=LVContinue}
               if not LVContinue then do:
                  next-prompt abs_shipfrom.
                  undo input_blk, retry input_blk.
               end. /* IF NOT LVContinue */
            end.

            /* CHECK IF DOCUMENT HAS BEEN EXPORTED TO TMS THROUGH QAD  */
            /* WAREHOUSING INTERFACES.                                 */
            if substring(abs_status,10,1) = "y" then do:

               if c-application-mode <> "API" then
                  LVContinue = false.
               else
                  LVContinue = true.
               /* SHIPPER EXPORTED TO TRANSPORT MANAGEMENT SYSTEM. CONTINUE */
               {us/bbi/pxmsg.i &MSGNUM=10861 &ERRORLEVEL=2 &CONFIRM=LVContinue}
               if not LVContinue then do:
                  next-prompt abs_shipfrom.
                  undo input_blk, retry input_blk.
               end. /* IF NOT LVContinue */
            end.

         end. /* IF {us/wh/whgpwhon.i} AND ... */

         run ip_refresh_id.
      end.
      else do:

         /* Check for blocked customers if running from shipper maintenance */
         if execname = "rcshmt.p"
         then do:
            /* Check for blocked customer transactions on the ship-to*/
            if blockedCustomer(input absShipTo,
                               input {&SO009},
                               input true,
                               input "Ship-To Customer")
            then do:
               undo input_blk, retry input_blk.
            end.

         end. /* end of if running from shipper maintenance */

      end. /* else not available */

      /* Tidy up the persistent procedure now that we are finished */
      delete PROCEDURE hBlockedTransactionLibrary.

      /* VALIDATE ADDRESSES IF EDITABLE */
      if v_upd_addrs
      then do:

         /* VALIDATE SHIPFROM */
         if not can-find (si_mstr where si_domain = global_domain and
                                        si_site = absShipFrom)
         then do:
            /* SITE DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}
            next-prompt abs_shipfrom.
            undo input_blk, retry input_blk.
         end. /* IF NOT CAN-FIND */

         /* VALIDATE SHIPTO */
         if not can-find(ad_mstr where ad_domain = global_domain and
                                       ad_addr = absShipto)
         then do:
            /* ADDRESS DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=980 &ERRORLEVEL=3}
            next-prompt abs_shipto.
            undo input_blk, retry input_blk.
         end. /* IF NOT CAN-FIND */

         /* VALIDATE SHIPTO VENDOR IF WORK ORDER */
         if i_tr_type = "ISS-WO" and
            not can-find (vd_mstr where vd_domain = global_domain and
                                        vd_addr = absShipto)
         then do:
            /* NOT A VALID SUPPLIER */
            {us/bbi/pxmsg.i &MSGNUM=2 &ERRORLEVEL=3}
            next-prompt abs_shipto.
            undo input_blk, retry input_blk.
         end.  /* IF i_tr_type */

         /* VALIDATE SHIPTO CUSTOMER IF SALES ORDER */
         if i_tr_type = "ISS-SO" or i_tr_type = "ISS-COR"
         then do:

            for first ls_mstr where ls_mstr.ls_domain = global_domain
               and (ls_addr = absShipto
               and (ls_type = "customer"
                  or ls_type = "ship-to"
                  or ls_type = "dock"))
            no-lock: end.

            /* FOR FIRST ls_mstr */
            if not available ls_mstr
            then do:
               /* NOT A VALID CUSTOMER OR SHIP-TO */
               {us/bbi/pxmsg.i &MSGNUM=8129 &ERRORLEVEL=3}
               next-prompt abs_shipto.
               undo input_blk, retry input_blk.
            end.  /* IF NOT AVAILABLE */

            v_addr = absShipto.

            do while v_addr <> "":

               for first cm_mstr where cm_domain = global_domain
                  and cm_addr = v_addr
               no-lock: end.

               for ad_mstr where ad_domain = global_domain
                  and ad_addr = v_addr
               no-lock: end.

               if not available cm_mstr and
                  available ad_mstr
               then
                  v_addr = ad_ref.
               else
                  v_addr = "".
            end.  /* DO WHILE */

            if not available cm_mstr
            then do:
               /* NOT A VALID CUSTOMER OR SHIP-TO */
               {us/bbi/pxmsg.i &MSGNUM=8129 &ERRORLEVEL=3}
               next-prompt abs_shipto.
               undo input_blk, retry input_blk.
            end.  /* IF NOT AVAILABLE */
         end.  /* IF i_tr_type */

      end.  /* IF v_upd_addrs */

      /* CHECK USER'S ACCESS TO SHIPFROM SITE */
      {us/bbi/gprun.i ""gpsiver.p""
         "(input absShipfrom, ?, output v_access)"}

      if v_access = 0
      then do:
         /* USER DOES NOT HAVE ACCESS TO THIS SITE */
         {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
         next-prompt abs_shipfrom.
         undo input_blk, retry input_blk.
      end.  /* IF v_access */

      /* VALIDATE THAT INVENTORY MOVEMENT CODE CAN BE BLANK */
      if sgInvMov = ""
      then do:
         if not available abs_mstr and
            (shc_require_inv_mov or
            (i_tr_type <> "ISS-SO" and
             i_tr_type <> "ISS-WO" and
             i_tr_type <> "ISS-COR"))
         then do:
            /* INVENTORY MOVEMENT CODE MUST BE SPECIFIED */
            {us/bbi/pxmsg.i &MSGNUM=5981 &ERRORLEVEL=3}
            next-prompt v_invmov.
            undo input_blk, retry input_blk.
         end.  /* IF (shc_require_inv_mov */
      end.  /* IF input v_invmov */

      /* VAlIDATE NON-BLANK INVENTORY MOVEMENT CODE */
      else do:

         /* VALIDATE THAT INVENTORY MOVEMENT CODE EXISTS */
         if not can-find
            (im_mstr where im_domain = global_domain and
                           im_inv_mov = sgInvMov)
         then do:
            /* INVENTORY MOVEMENT CODE DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=5800 &ERRORLEVEL=3}
            next-prompt v_invmov.
            undo input_blk, retry input_blk.
         end.  /* IF NOT CAN-FIND */

         /* VALIDATE THAT INVENTORY MOVEMENT CODE IS CORRECT TYPE */
         if not can-find (im_mstr where im_domain = global_domain and
                                        im_inv_mov = sgInvMov and
                                        im_tr_type = i_tr_type)
         then do:
            /* INVENTORY MOVEMENT CODE WITH TRANSACTION TYPE # REQUIRED */
            {us/bbi/pxmsg.i &MSGNUM=5847 &ERRORLEVEL=3 &MSGARG1=i_tr_type}
            next-prompt abs_id.
            undo input_blk, retry input_blk.
         end.  /* IF NOT CAN-FIND */

         /* GET TRANSACTION FLOW AND TRANSACTION TYPE BY IMC */
         find first im_mstr where im_domain = global_domain
            and im_inv_mov = sgInvMov no-lock no-error.
         if available im_mstr then
         assign
            v_imflow  = im_flow
            v_tr_type = im_tr_type.

         /* NO GENERATION OF LEGAL DOCUMENT */
         if v_imflow = 0 then do:
            o_trflow_flg = no.
         end.
         /* GENERATING LEGAL DOCUMENT */
         else do:
            o_trflow_flg = yes.
            for each t_abs no-lock:
               /* VALIDATE IF THE PROCESS IS A RETURN PROCESS */
               if v_imflow = 1 and
                  (v_tr_type = "ISS-SO" or
                  v_tr_type = "ISS-TR" or
                  v_tr_type = "ISS-DO" or
                  v_tr_type = "ISS-UNP" or
                  v_tr_type = "ISS-WO" or
                  v_tr_type = "ISS-MEMO")
               then do:
                  v_rtn_tr_flg = yes.
                  /* RETURN PROCESS THE QUANTITY MUST BE NEGATIVE */
                  if t_abs_qty > 0 then do:
                     /* INVENTORY MOVEMENT CODE MISMATCHES WITH QUANTITY */
                     {us/bbi/pxmsg.i &MSGNUM=10338 &ERRORLEVEL=3}
                     next-prompt v_invmov.
                     undo input_blk, retry input_blk.
                  end.
               end.
            end.

            /* For PO Return */
            if v_imflow = 2 and
               (v_tr_type = "RCT-PO" or v_tr_type = "ISS-PRV"
                or v_tr_type = "RCT-UNP")
            then do:
               v_rtn_tr_flg = yes.
            end.
         end. /* if v_imflow <> 0 */

         /* VALIDATE SITE/INVENTORY MOVEMENT CODE SECURITY */
         {us/bbi/gprun.i ""gpsimver.p""
            "(input absShipfrom,
              input sgInvMov,
              output v_auth)" }

         if not v_auth
         then do:
            /* USER DOES NOT HAVE ACCESS TO THIS SITE/INV MOV CODE */
            {us/bbi/pxmsg.i &MSGNUM=5990 &ERRORLEVEL=3}
            next-prompt v_invmov.
            undo input_blk, retry input_blk.
         end.  /* IF NOT v_auth */

      end.  /* ELSE */

      vlApplyTax = WhetherApplyTax(sgInvMov).

      {us/gp/gprunp.i "soldxr" "p" "check_unconfirmship"
                "(output v_unconfirm_flg)"}

      if available abs_mstr
      then do:
         /* ERROR IF SELECTED SHIPPER HAS INCORRECT TYPE */
         if
            (if i_tr_type = "ISS-WO"
             then
                abs_type <> "s" and abs_type <> "u"
             else if i_tr_type = "ISS-DO"
             then
                abs_type <> "s" and abs_type <> "d"
             else
                abs_type <> "s")
         then do:
            /* SELECTED SHIPPER HAS INVALID TYPE */
            {us/bbi/pxmsg.i &MSGNUM=5814 &ERRORLEVEL=3}
            next-prompt abs_id.
            undo input_blk, retry input_blk.
         end.  /* IF (IF i_tr_type */

         /* ERROR IF SELECTED SHIPPER HAS DIFFERENT SHIP-TO */
         if abs_shipto <> i_dest_addr and not v_upd_addrs
         then do:
            /* SELECTED SHIPPER IS FOR SHIP-TO # */
            {us/bbi/pxmsg.i &MSGNUM=5812 &ERRORLEVEL=3 &MSGARG1=abs_shipto}
            next-prompt abs_id.
            undo input_blk, retry input_blk.
         end.  /* IF abs_shipto */

         /* ERROR IF CANCELED SHIPPER SELECTED AND ADDING LINES */
         if abs_canceled and can-find (first t_abs)
         then do:
            /* SHIPPER CANCELED */
            {us/bbi/pxmsg.i &MSGNUM=5885 &ERRORLEVEL=3}
            next-prompt abs_id.
            undo input_blk, retry input_blk.
         end.  /* IF abs_canceled */

         /* ERROR IF SELECTED SHIPPER HAS ALREADY INVOICED */
         if execname = "soivmt.p"
         then do:
            run ip_invoiced (output p_error).
            if p_error
            then do:
               /* SHIPPER ALREADY INVOICED */
               {us/bbi/pxmsg.i &MSGNUM=25310 &ERRORLEVEL=3 &MSGARG1=substring(abs_mstr.abs_id,2)}
               p_error = no.
               next-prompt abs_id.
               undo input_blk, retry input_blk.
            end. /* IF p_error */
         end. /* IF execname = "soivmt.p" */

         if not v_unconfirm_flg then do:

            if substring(abs_status,2,1) = "y" then
            do:
               /* CHECK WHETHER LEGAL DOCUMENT HAS BEEN ELECTRONICALLY PROCESSED */
               {us/gp/gprunp.i "soldxr" "p" "checkLDElecStatusForShipper"
				             "(input oid_abs_mstr, output l_processed)"}
      
               if l_processed then do:      
                  /* LEGAL DOCUMENT HAS BEEN ELECTRONICALLY */
                  {us/bbi/pxmsg.i &MSGNUM=12460 &ERRORLEVEL=3}
                  next-prompt abs_id.
                  undo input_blk, retry input_blk.
               end.
               /* Confirmed shipper can't be reused, if GTM is enabled */
               if vlApplyTax then
               do:
                  /* SHIPPER PREVIOUSLY CONFIRMED */
                  {us/bbi/pxmsg.i &MSGNUM=8146 &ERRORLEVEL=3}
                  next-prompt abs_id.
                  undo input_blk, retry input_blk.
               end. /* if vlApplyTax then */
               else
                  /* ONLY WARN IF SHIPPER PREVIOUSLY CONFIRMED */
                  if i_eff_date = ? then
                  do:
                     /* SHIPPER PREVIOUSLY CONFIRMED */
                     {us/bbi/pxmsg.i &MSGNUM=8146 &ERRORLEVEL=2}
                  end.  /* if i_eff_date = ? */
            end. /* if confirmed shipper */
         end.
         else do:
             if substring(abs_status, 2, 1) = "y" then
             do:
                /* SHIPPER PREVIOUSLY CONFIRMED */
                {us/bbi/pxmsg.i &MSGNUM=8146 &ERRORLEVEL=3}
                next-prompt abs_id.
                undo input_blk, retry input_blk.
             end. /* if substring(abs_status, 2, 1) = "y" */
         end.

         if i_l_exec = yes 
         then do:
            run p-create-qadwkfl (input abs_shipfrom,
                                  input abs_id).
         end. /* IF i_l_exec = YES */

         /* WARN IF ALREADY PRINTED */
         if substring(abs_status,1,1) = "y"
         then do:
            if c-application-mode <> "API" then
               v_cont = false.
            else v_cont = true.
            /* SHIPPER HAS ALREADY BEEN PRINTED.  CONTINUE? */
            {us/bbi/pxmsg.i &MSGNUM=5803 &ERRORLEVEL=2 &CONFIRM=v_cont}
            if not v_cont
               then undo input_blk, retry input_blk.
         end.  /* IF substring */

         /* WARN IF CONSOLIDATION PROHIBITED */
         if abs_cons_ship = "0"
         then do:
            if c-application-mode <> "API" then
               v_cont = false.
            else v_cont = true.
            /* SHIPPER PROHIBITS CONSOLIDATION.  CONTINUE? */
            {us/bbi/pxmsg.i &MSGNUM=5804 &ERRORLEVEL=2 &CONFIRM=v_cont}
            if not v_cont
               then undo input_blk, retry input_blk.
         end.  /* IF abs_cons_ship */

         /* WARN IF DIFFERENT EFFECTIVE DATE */
         if i_eff_date   <> ? and
            abs_eff_date <> ? and
            abs_eff_date <> i_eff_date
         then do:
            if c-application-mode <> "API" then
               v_cont = false.
            else v_cont = true.

            /* SHIPPER HAS EFFECTIVE DATE OF #.  CONTINUE? */
            {us/bbi/pxmsg.i &MSGNUM=5807 &ERRORLEVEL=2
               &MSGARG1=abs_eff_date
               &CONFIRM=v_cont}
            if not v_cont
               then undo input_blk, retry input_blk.
         end.  /* IF i_eff_date */

         /* WARN IF SHIPPER CANCELED */
         if abs_canceled
         then do:
            /* SHIPPER CANCELED */
            {us/bbi/pxmsg.i &MSGNUM=5885 &ERRORLEVEL=2}
         end.  /* IF abs_canceled */
      end.  /* IF available abs_mstr */

      /* WARN IF CUSTOMER ON CREDIT HOLD */
      if (i_tr_type = "ISS-SO" or i_tr_type = "ISS-COR") and
         available cm_mstr and
         isCustomerOnCreditHold(input cm_addr)
      then do:
         v_cont = false.
         /* CUSTOMER IS ON CREDIT HOLD.  CONTINUE? */
         {us/bbi/pxmsg.i &MSGNUM=5816 &ERRORLEVEL=2 &CONFIRM=v_cont}
         if not v_cont
            then undo input_blk, retry input_blk.
      end.  /* IF i_tr_type */

      /* DETERMINE IF SHIPPER/ASN RULES EXISTS AND WHAT USER FIELDS */
      /* AND SYSTEM FIELDS MUST BE VALIDATED ACCORDING TO THOSE     */
      /* RULES.                                                     */
      /* ONLY DO THIS FOR SHIPPERS CREATED VIA rcshmt.p.            */
      if execname = "rcshmt.p"
      then do:
         assign
            cShipStep  = {&TYPE_Shipper}
            dtShipDate = if available abs_mstr
                         then abs_shp_date
                         else today
            lNewAbsMstr = false.

         empty temp-table tt_validation_fields.

         run getFieldsToValidate
            (input absShipfrom,
             input absShipto,
             input cShipStep,
             input dtShipDate,
             output table tt_validation_fields).
      end. /* IF program-name = "rchsmt.p" */

      /* CREATE NEW SHIPPER.  KEEP THE TRANSACTION BLOCK SMALL TO */
      /* MINIMIZE THE TIME THAT NRM RECORDS WILL HAVE TO BE LOCKED. */
      if not available abs_mstr then
      check_blk:
      do:

         /* THE CONSOLIDATION FLAG IS "OPTIONAL" IF THERE IS NO INV MOV CODE SPECIFIED  */
         if sgInvMov = ""
         then
            l_cons_ship = "1".
         else do for sgad_buff:
            /*  DETERMINE CONSOLIDATION FLAG FROM THE sgad SETUP  */
            find sgad_det
               where sgad_det.sgad_domain = global_domain
               and   sgad_det.sgad_grp    = v_shipgrp
               and   sgad_det.sgad_is_src = yes
               and   sgad_det.sgad_addr   = abs_shipfrom
            no-lock no-error.

            if not available sgad_det
            then
               find sgad_det
                  where sgad_det.sgad_domain = global_domain
                  and   sgad_det.sgad_grp    = v_shipgrp
                  and   sgad_det.sgad_is_src = yes
                  and   sgad_det.sgad_addr   = ""
               no-lock no-error.

            find sgad_buff
               where sgad_buff.sgad_domain = global_domain
               and   sgad_grp              = v_shipgrp
               and   sgad_is_src           = no
               and   sgad_addr             = absShipto
            no-lock no-error.

            if not available sgad_buff
            then
               find sgad_buff
                  where sgad_buff.sgad_domain = global_domain
                  and   sgad_grp              = v_shipgrp
                  and   sgad_is_src           = no
                  and   sgad_addr             = ""
               no-lock no-error.

            if not available sgad_det or
               not available sgad_buff
            then
               l_cons_ship = "1".
            else do:    /*  IF BOTH sgad_det AND agad_buff ARE AVAILABLE  */
               /* 0=No, 2=Yes, 1=Optional */
               /*  IT IS 'NO' IS EITHER ADDRESS HAS IT AS 'NO','YES' IF EITHER HAVE IT AS 'YES' ELSE IT IS 'OPTIONAL' */

               if sgad_buff.sgad_cons_ship = "0" or
                  sgad_det.sgad_cons_ship  = "0"
               then
                  l_cons_ship = "0".
               else
                  if sgad_buff.sgad_cons_ship = "2" or
                     sgad_det.sgad_cons_ship  = "2"
                  then
                     assign
                        l_cons_ship = "2".
                  else
                     l_cons_ship = "1".
            end. /* ELSE DO IF BOTH sgad_det AND sgad_buff ARE AVAILABLE */
         end. /* ELSE DO FOR sgad_buff */

         /* CHECK IF ANOTHER EXISTING SHIPPER REQUIRES CONSOLIDATION */
         if l_cons_ship = "2"
         then do:
            for first abs_mstr
               where abs_domain                  = global_domain
               and abs_shipfrom                  = absShipfrom
               and abs_id                        begins "s"
               and abs_type                      = "s"
               and abs_shipto                    = absShipto
               and abs_inv_mov                   <> ""
               and abs_inv_mov                   = sgInvMov
               and not abs_canceled
               and substring(abs_status,1,1)     <> "y"
               and abs_cons_ship = "2"
               and (if i_eff_date = ?
                    then
                       substring(abs_status,2,1) <> "y"
                    else
                       abs_eff_date  = i_eff_date)
            no-lock:
            end. /* FOR FIRST abs_mstr */

            if available abs_mstr
            then do:
               v_cont = true.
               /* UNPRINTED SHIP # REQUIRES CONSOLIDATION. CoNSOLIDATE? */
               {us/bbi/pxmsg.i &MSGNUM=5806 &ERRORLEVEL=2 &MSGARG1=substring(abs_id,2) &CONFIRM=v_cont}
               if v_cont
               then do:
                  if c-application-mode <> "API"
                  then
                     display substring(abs_id,2) @ abs_id.
                  assign
                     absID = substring(abs_id,2).
                  run ip_refresh_id.
                  leave check_blk.
               end.  /* IF v_cont */
            end.  /* IF AVAILABLE abs_mstr */
         end. /* IF l_cons_ship = "2" THEN DO */
     
      end. /* check_blk */

  
      /* SHIPPER NUMBER CREATION USING NRM */
      if not available abs_mstr
      and    l_cons_ship <> "2" 
      then
      nrcreate_blk:
      do transaction:
       
         /* GET SHIPPING GROUP/INVENTORY MOVEMENT DETAILS */
         if sgInvMov <> ""
         then do:
            for first sgid_det
               where sgid_domain = global_domain
                 and sgid_grp     = sgGrp
                 and sgid_inv_mov = sgInvMov
            no-lock: end.
            if not available sgid_det
            then do:
               /* INVENTORY MOVEMENT CODE IS NOT VALID FOR SHIP GROUP # */
               {us/bbi/pxmsg.i &MSGNUM=5985 &ERRORLEVEL=3 &MSGARG1="input sg_grp"}
               next-prompt v_invmov.
               undo input_blk, retry input_blk.
            end.  /* IF NOT AVAILABLE sgid_det */
         end.  /* IF INPUT v_invmov */

         /* GENERATE/VALIDATE SHIPPER NUMBER USING NRM */
         v_number = absId.
         {us/bbi/gprun.i
            ""gpnrmgv.p""
            "(if sgInvMov <> """" then sgid_ship_nr_id
                                  else shc_ship_nr_id,
              input-output v_number,
              output v_err,
              output v_errnum)" }
         if v_err
         then do:
            {us/bbi/pxmsg.i &MSGNUM=v_errnum &ERRORLEVEL=3}
            next-prompt abs_id.
            undo input_blk, retry input_blk.
         end. /* IF v_err */

         if c-application-mode <> "API" then
            display v_number @ abs_id.

         absID = v_number.

      end. /* nrcreate_blk */

      /* ABS_MSTR RECORD CREATION */
      if not available abs_mstr 
      and    l_cons_ship <> "2"
      then
      createabs_blk:
      do transaction :
         
         /* ADDING NEW RECORD */
         {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}

         l_default = yes.

         create abs_mstr.
         abs_mstr.abs_domain = global_domain.

         assign
            abs_shipfrom = absShipfrom
            abs_id       = "s" + absId
            abs_type     = if (i_tr_type = "ISS-WO" and sgInvMov = "") or
                              (i_tr_type = "ISS-WO" and
                               program-name(2) matches "*reshmt*")
                           then "u"
                           else "s"
            abs_shipto   = absShipto
            abs_inv_mov  = sgInvMov
            abs_nr_id    = if sgInvMov <> "" then sgid_ship_nr_id
                           else shc_ship_nr_id
            abs_shp_date = today
            abs_qty      = 1.

         if recid(abs_mstr) = -1 then .

         /* FOR DELETION OF THE abs_mstr RECORD WHEN ERROR */
         /* "MAX LINE LIMIT HAS BEEN REACHED" IS DISPLAYED   */

         l_rec = recid(abs_mstr).
       
         if i_l_exec = yes 
         then do:
            run p-create-qadwkfl (input abs_shipfrom,
                                  input abs_id).
         end. /* IF i_l_exec = YES */
              

         lNewAbsMstr = true.
         if execname = "rcshmt.p"
         then do:
            /*CREATE HEADER LEVEL USER FIELD RECORDS */
            {us/bbi/gprun.i ""sosob1b.p""
                     "(input abs_id,
                       input abs_shipfrom,
                       input 1,
                       input table tt_validation_fields)"}
          end.

         /* FLAG AS CONFIRMED */
         if i_eff_date <> ?  then do:
            if v_unconfirm_flg then
               substring(abs_status,1,1) = "y".
            else
               substring(abs_status,2,1) = "y".

            abs_eff_date = i_eff_date.
         end.

         if i_tr_type = "ISS-MEMO" then
            abs_eff_date = today.

         /* GET THE SHIPPER CONSOLIDATION FLAG */
         {us/bbi/gprun.i ""icshfmt.p""
            "(recid(abs_mstr),
              input sgGrp,
              output abs_format)" }

         /* GET THE SHIPPER CONSOLIDATION FLAG */
         {us/bbi/gprun.i ""icshcon.p""
            "(input sgGrp,
              abs_shipfrom,
              abs_shipto,
              output abs_cons_ship)" }

         /* ADD CARRIER RECORDS */
         {us/bbi/gprun.i ""icshcar.p"" "(recid(abs_mstr))" }

         /* GET THE DEFAULT LANGUAGE */
         {us/bbi/gprun.i ""icshlng.p"" "(recid(abs_mstr), output abs_lang)" }

         /* GET THE FOB AND SHIPVIA DEFAULTS */
         {us/bbi/gprun.i ""icshfob.p""
            "(recid(abs_mstr), output v_fob, output v_shipvia)" }

         /* ASSIGN PACKED FIELDS */
         substring(abs__qad01,1,60) =
            string(v_shipvia,          "x(20)") +   /* shipvia */
            string(v_fob,              "x(20)") +   /* FOB */
            string(substring(abs_id,2),"x(20)").    /* carrier ref */

         do on error undo, return error return-value:
            /* UPDATE HEADER INFORMATION */
            {us/bbi/gprun.i ""icshhdr.p""
                     "(input recid(abs_mstr),
                       input lNewAbsMstr,
                       input table tt_validation_fields,
                       output v_deleted)"}
         end.
         if v_deleted
            then leave input_blk.

         {us/gp/gprunp.i "soldxr" "p" "getMaxLines"
                   "(input abs_format,
                     input abs_inv_mov,
                     output ld_max_lines)"}

         release abs_mstr.

      end.  /* createabs_blk */
      else do:
         lNewAbsMstr = false.
      end.

      
      if lNewAbsMstr 
      and ld_max_lines > 0 
      then do:
         run ShipperCount(output actual_lines).
         if actual_lines > ld_max_lines 
         then do:
            /* Max line limit has been reached */
            {us/bbi/pxmsg.i &MSGNUM=10654 &ERRORLEVEL=3 &PAUSEAFTER = TRUE}
            abs_id:screen-value = "".
            do transaction :
               run p-delabs(input l_rec).
            end. /*END TRANSACTION */

            undo input_blk, return return-value.
          end. /*IF actual_lines >ld_max_lines */
       end. /*IF lNewAbsMstr and ld_max_lines > 0 */


      /* EDIT THE NEW OR EXISTING RECORD IN A NEW TRANSACTION */
      /* BLOCK, TO PREVENT PROLONGED LOCKING OF NRM RECORDS   */
      do transaction:

         if c-application-mode = "API" and retry
            then return error return-value.

         /* RE-READ SHIPPER RECORD EXCLUSIVE-LOCK */
         find abs_mstr where abs_domain = global_domain and
            abs_shipfrom =       absShipfrom and
            abs_id       = "s" + absId
         exclusive-lock no-error.
         if not available abs_mstr
            then
            undo input_blk, retry input_blk.

         /* BUILD NEW LINE ITEMS FROM TEMP TABLE */
         if not abs_canceled
         then do:
            {us/bbi/gprun.i ""icshmt1b.p"" "(recid(abs_mstr))" }
         end.  /* IF NOT abs_canceled */

         if not lNewAbsMstr then
         do:
            do on error undo, return error return-value:
               /* UPDATE HEADER INFORMATION */
               {us/bbi/gprun.i ""icshhdr.p""
                        "(input recid(abs_mstr),
                          input lNewAbsMstr,
                          input table tt_validation_fields,
                          output v_deleted)"}
            end.
            if v_deleted
               then leave input_blk.

            /* LEGAL DOCUMNET MAX LINE CHECK */
            {us/gp/gprunp.i "soldxr" "p" "getMaxLines"
                      "(input abs_format,
                        input abs_inv_mov,
                        output ld_max_lines)"}
            if ld_max_lines > 0 then do:
               /* Caculate this time ship lines */
               run ShipperCount(output actual_lines).

               /* Caculate the existing ship lines */
               {us/gp/gprunp.i "soldxr" "p" "getActualLines"
                         "(input recid(abs_mstr),
                           output existing_lines)"}

               actual_lines = actual_lines + existing_lines.
               if actual_lines > ld_max_lines then do:
                  /* Max line limit has been reached */
                  {us/bbi/pxmsg.i &MSGNUM=10654 &ERRORLEVEL=3 &PAUSEAFTER = TRUE}
                  undo input_blk, return return-value.
               end.
            end.
         end. /* If not lNewAbsMstr */

         /* Header Tax frame */
         if vlApplyTax then
         do:
            {us/bbi/gprun.i ""icshtax.p""
                     "(input recid(abs_mstr),
                       input l_default)"}
         end. /* if vlApplyTax then */

         /*PROMPT FOR USER FIELDS IF THEY EXIST FOR THIS FIELD*/
         hide frame aship no-pause.
         {us/bbi/gprun.i ""rcswbuf.p""
                  "(input abs_id,
                    input abs_shipfrom,
                    input cShipStep,
                    input 6, /* FRAME SIZE */
                    input table tt_validation_fields)"}
         view frame aship.

         /* Line frame */
         if vlApplyTax or i_tr_type = "ISS-MEMO" then
         do:
            {us/bbi/gprun.i ""icshdmt.p""
                     "(input recid(abs_mstr))"}
         end. /* if vlApplyTax then */

         /* UPDATE LINE ITEM INFORMATION */
         if not abs_canceled and
            ((i_tr_type <> "ISS-SO" and
              i_tr_type <> "ISS-COR" and
              i_tr_type <> "ISS-WO") or
            substring(abs_status,2,1) <> "y")
         then do:
            {us/bbi/gprun.i ""icshdet.p""
                     "(input recid(abs_mstr),
                       input table tt_validation_fields)"}
         end.  /* IF NOT abs_canceled */

         /* IF LOGISTICS ACCOUNTING IS ENABLED AND IT IS A SO SHIPPER DISPLAY */
         /* THE LOGISTICS CHARGE DETAIL FRAME WHICH DISPLAYS THE DEFAULT      */
         /* LOGISTICS SUPPLIER FOR THIS SHIPPER WHICH CAN BE UPDATED IN       */
         /* THIS FRAME.                                                       */
         /* NOTE: LACD_DET RECORD IS CREATED/UPDATED IN RCSHMTA.P AND         */
         /*       RCSHMTB.P DURING SO SHIPPER MAINTENANCE.                    */
         if use-log-acctg
            and (i_tr_type = "ISS-SO")
            then do on error undo, retry:
            /* UPDATE LOGISTICS SUPPLIER */
            {us/bbi/gprun.i ""lacamts.p""
               "(input global_domain,
                 input '',
                 input substring(abs_id,2),
                 input '{&TYPE_SOShipper}',
                 input abs_shipfrom)"}.
            
         end.   /* IF use-log-acctg */

         do on error undo, return error return-value:
            /* UPDATE TRAILER INFORMATION */
            {us/bbi/gprun.i ""icshtrl.p""
                     "(input recid(abs_mstr),
                       input cShipStep,
                       input table tt_validation_fields)"}
         end.

         v_unconfirm_flg = if i_tr_type = "ISS-MEMO" then yes else v_unconfirm_flg.

         /* Confirm shipper */
         if vlApplyTax then do:
            if v_unconfirm_flg then
               substring(abs_status, 1, 1) = "y".
            else
               /* Set shipper confirmed */
               substring(abs_status, 2, 1) = "y".
         end.

         o_recid = recid(abs_mstr).
         release abs_mstr.
      end.  /* DO TRANSACTION */

      /* Tax calculation */
      if vlApplyTax then
      do:
         hide frame aship no-pause.
         /* Calculate and edit tax */
         {us/bbi/gprun.i ""icshedtx.p""
               "(input o_recid)"}
         view frame aship.
      end. /* if vlApplyTax then */

      /* PRINT SHIPPER */
      if c-application-mode <> "API" then
/*cy1024*      {us/bbi/gprun.i ""icshprt.p"" */
/*cy1024*/     {us/bbi/gprun.i ""xxicshprt.p""
               "(input o_recid,
                 input cShipStep,
                 input table tt_validation_fields,
                 input-output lValidationDone)" }

      for first bAbsMstr no-lock where
         recid(bAbsMstr) = o_recid:
      end.

      if available bAbsMstr then do:
         /* VALIDATE ANY USER FIELDS THAT WERE SET TO BE VALIDATED */
         /* AT THE END OF SHIPPER CREATE.                          */
         if not lValidationDone and
         can-find(first tt_validation_fields)
         then do:
            empty temp-table tt_validation_errors.
            run validateStoredFields
               (input bAbsMstr.abs_id,
                input bAbsMstr.abs_shipfrom,
                input cShipStep,
                input table tt_validation_fields,
                output table tt_validation_errors).

            /* RECORD VALIDATION MESSAGES */
            run recordValMessages
               (input table tt_validation_errors).

         end. /*IF NOT lValidationDone*/


         /* IF ANY DATA NEEDS TO BE CORRECTED DISPLAY A FRAME TO THE */
         /* USER FOR DATA CORRECTION.                                */
         run checkForValidationErrors
            (input bAbsMstr.abs_id,
             input bAbsMstr.abs_shipfrom,
             output lErrCondition,
             output lWarnCondition).

         if lErrCondition or
         lWarnCondition
         then do:

             hide frame aship no-pause.

             run correctShipData
                (input bAbsMstr.abs_id,
                 input bAbsMstr.abs_shipfrom,
                 input bAbsMstr.abs_shipto,
                 input table tt_validation_fields,
                 output lDispPrintFrame).

             if lDispPrintFrame
             then do:
/*cy1024*                {us/bbi/gprun.i ""icshprt.p"" */
/*cy1024*/               {us/bbi/gprun.i ""xxicshprt.p""
                         "(input o_recid,
                           input cShipStep,
                           input table tt_validation_fields,
                           input-output lValidationDone)" }
             end.
          end. /*IF lErrCondition*/
       end. /*IF AVAILABLE bAbsMstr*/

      global_recid = o_recid.

      leave input_blk.

   end.  /* input_blk */


   /* Global Shipping */
   find first abs_mstr
      where recid(abs_mstr) = global_recid
      no-lock no-error.

   if available abs_mstr then
   do:
      if o_trflow_flg = yes and not v_unconfirm_flg then do:
         do on error undo, return error return-value:

            /* Generate Legal Doc by Rct or Iss transaction */
            {us/bbi/gprun.i ""icshldmt.p""
                     "(input  global_recid,
                       input  v_rtn_tr_flg,
                       output i_err_num)"}

            if execname = "rcshmt.p" or execname = "reshmt.p" then do:
               find first lgd_mstr where lgd_domain = global_domain
                                     and lgd_shipper_id = abs_id
                                     and lgd_type = yes
               no-lock no-error.

               if available lgd_mstr then do:
                  /* Save site(from/to) and location(from/to) values to lgd_mstr */
                  {us/gp/gprunp.i "soldxr" "p" "saveLegalSiteLoc"
                            "(input abs_id,
                              input lgd_shipfrom,
                              input lgd_loc,
                              input lgd_ship,
                              input '')"}
               end.
            end.
         end.
      end.
   end.

   /* IF CALLER IS RCSHMT.P OR RESHMT.P, SHOULD HIDE THE COMPLEMENTARY DATA
      FRAME */
   if execname = "rcshmt.p" or execname = "reshmt.p" then do:
      hide all no-pause.
      view frame dtitle.
   end.

   if not v_upd_addrs
      then leave main_blk.

end.  /* main_blk */

/* CLEAR TEMP TABLE */
{us/bbi/gprun.i ""icshmt1c.p"" }

if c-application-mode <> "API" then
   hide frame aship no-pause.

if is_wiplottrace_enabled()
   then
   delete PROCEDURE h_wiplottrace_procs no-error.
if is_wiplottrace_enabled()
   then
   delete PROCEDURE h_wiplottrace_funcs no-error.

/* END OF MAIN PROCEDURE BODY */

/* INTERNAL PROCEDURES */

PROCEDURE ip_refresh_id:


   define buffer b_abs_mstr for abs_mstr.

   run ip_refresh_shipfrom.

   for first b_abs_mstr no-lock 
      where b_abs_mstr.abs_domain = global_domain
        and b_abs_mstr.abs_shipfrom = absShipfrom
        and b_abs_mstr.abs_id = "s" + absId with frame aship:

   if c-application-mode <> "API" then
      display abs_shipto  @ abs_mstr.abs_shipto.
   assign absShipTo = abs_shipto.
   end.  /* FOR FIRST b_abs_mstr */

   run ip_refresh_grp.

END PROCEDURE.  /* ip_refresh_id */

PROCEDURE ip_refresh_shipfrom:

   for first si_mstr
      fields( si_domain si_desc si_site)
      where si_domain = global_domain and
            si_site = absShipfrom
   no-lock: end.

   for first ad_mstr
      fields( ad_domain ad_addr ad_line1 ad_name ad_ref)
      where ad_domain = global_domain and
            ad_addr = absShipfrom
   no-lock: end.

   if c-application-mode <> "API" then
   display
      if available si_mstr
      then si_desc
      else if available ad_mstr
      then ad_name
      else "" @ si_desc
   with frame aship.

END PROCEDURE.  /* ip_refresh_shipfrom */

PROCEDURE ip_refresh_grp:

   define buffer b_abs_mstr for abs_mstr.

   {us/bbi/gprun.i ""gpgetgrp.p""
      "(input absShipfrom,
        input absShipto,
        output v_shipgrp)"}

   for first sg_mstr
      where sg_domain = global_domain and sg_grp = v_shipgrp
   no-lock: end.

   if c-application-mode <> "API" then
   display
      if available sg_mstr
      then sg_grp
      else "" @ sg_grp
      if available sg_mstr
      then sg_desc
      else "" @ sg_desc
   with frame aship.

   if available sg_mstr then
      sgGrp = sg_grp.
   else
      sgGrp = "".

   if c-application-mode <> "API"
   then do:
      if absShipfrom <> input frame aship abs_mstr.abs_shipfrom
         then
         absShipfrom = input frame aship abs_mstr.abs_shipfrom.
      if absId <> input frame aship abs_mstr.abs_id
         then
         absId = input frame aship abs_mstr.abs_id.
       if absShipto <> input frame aship abs_mstr.abs_shipto
      then
         absShipto = input frame aship abs_mstr.abs_shipto.
   end. /* IF c-application-mode <> "API" */
   
   if input frame aship v_invmov = "" and  v_inv_mov <> "" then do:
      find first sgid_det where sgid_domain = global_domain and
         sgid_grp     = input frame aship sg_grp and
         sgid_inv_mov = v_inv_mov
      no-lock no-error.

      if available sgid_det then do:
         display
            sgid_inv_mov @ v_invmov 
         with frame aship.
         
         assign sgInvMov = v_inv_mov.
      end.
      
      else
         display "" @ v_invmov 
         with frame aship.
   end.
   
   for first b_abs_mstr
      where b_abs_mstr.abs_domain = global_domain
        and b_abs_mstr.abs_shipfrom = absShipfrom
        and b_abs_mstr.abs_id = "s" + absId
   no-lock: end.

   if available b_abs_mstr
   then do:
      if  c-application-mode <> "API" 
      and b_abs_mstr.abs_inv_mov <> ""
       then do:
          display
             b_abs_mstr.abs_inv_mov @ v_invmov
          with frame aship.
          v_invmov = b_abs_mstr.abs_inv_mov.
       end. 
    end.

   else
   if sgInvMov = ""
   then do:
      for first sgid_det
         where sgid_domain = global_domain
           and sgid_grp     = sgGrp
           and sgid_default = true
           and can-find (first im_mstr
                         where im_domain = global_domain
                           and im_inv_mov = sgid_inv_mov
                           and im_tr_type = i_tr_type)
      no-lock: end.
      if c-application-mode <> "API" then
      display
         if available sgid_det
         then sgid_inv_mov
         else "" @ v_invmov
      with frame aship.

      if available sgid_det then
         assign sgInvMov = sgid_inv_mov.
      else
         assign sgInvMov = "".

   end.  /* ELSE */

   run ip_refresh_shipto.
   run ip_refresh_invmov.

END PROCEDURE.  /* ip_refresh_grp */

PROCEDURE ip_refresh_shipto:

   for first ad_mstr
      where ad_mstr.ad_domain = global_domain and
      ad_addr = absShipto
   no-lock: end.

   if c-application-mode <> "API" then
   display
      if available ad_mstr
      then ad_name
      else "" @ ad_name
      if available ad_mstr
      then ad_line1
      else "" @ ad_line1
   with frame aship.

END PROCEDURE.  /* ip_refresh_shipto */

PROCEDURE ip_refresh_invmov:

   for first im_mstr
      where im_domain = global_domain and
            im_inv_mov = sgInvMov
   no-lock: end.

   if c-application-mode <> "API" then
   display
      if available im_mstr
      then im_desc
      else "" @ im_desc
   with frame aship.

END PROCEDURE.  /* ip_refresh_invmov */

PROCEDURE enterShipFrom:
   if c-application-mode <> "API" then
      v_save_shipfrom = input frame aship abs_shipfrom.
   else
      v_save_shipfrom = absShipFrom.
END PROCEDURE.

PROCEDURE enterAbsID:
   if c-application-mode <> "API" then
      v_save_id = input frame aship abs_id.
   else
      v_save_id = absID.


end.

PROCEDURE enterShipTo:
   if c-application-mode <> "API" then
      v_save_shipto = input frame aship abs_shipto.
   else
      v_save_shipto = absShipTo.
end.

PROCEDURE enterInvMov:
   if c-application-mode <> "API" then
      v_save_invmov = input frame aship v_invmov.
   else
      v_save_invmov = sgInvMov.
end.

PROCEDURE ShipperCount:
   define output parameter i_count as integer.

   i_count = 0.
   for each t_abs no-lock:
      i_count = i_count + 1.
   end.
END PROCEDURE.

PROCEDURE ip_update_ship_to:
   define input parameter p_abs_shipfrom    like abs_shipfrom no-undo.
   define input parameter p_abs_id          like abs_id       no-undo.

   define buffer b_abs_mstr for abs_mstr.

   /* VALID SHIPTO */
   if can-find(ad_mstr
                  where ad_mstr.ad_domain = global_domain
                  and   ad_addr           = absShipto)
   then do:

      /* FIND SELECTED SHIPPER */
      for first  b_abs_mstr
          where  b_abs_mstr.abs_domain   = global_domain
             and b_abs_mstr.abs_shipfrom = absShipFrom
             and b_abs_mstr.abs_id       = "s" + absId
      exclusive-lock:

         if (NOT can-find ( first abs_mstr
                               where abs_mstr.abs_domain   = global_domain
                               and   abs_mstr.abs_shipfrom = p_abs_shipfrom
                               and   abs_mstr.abs_par_id   = "s" + p_abs_id)  )
         then do:
            assign b_abs_mstr.abs_shipto = absshipto.
         end. /*IF (NOT CAN-FIND*/
         else do:
           assign absShipTo = b_abs_mstr.abs_shipto.
         end. /*IF CAN-FIND*/

      end. /* FOR FIRST abs_mstr */

   end. /* IF CAN-FIND */

END PROCEDURE.  /* ip_update_ship_to */

PROCEDURE ip_invoiced:
   define output parameter p_error like mfc_logical no-undo.
   define buffer b_abs_mstr for abs_mstr.

   for first b_abs_mstr
      where b_abs_mstr.abs_domain   = global_domain
      and   b_abs_mstr.abs_shipfrom = absShipfrom
      and   b_abs_mstr.abs_par_id   = "s" + absId
   no-lock:
      if b_abs_mstr.abs_inv_nbr <> ""
      then
         p_error = yes.
   end. /* FOR FIRST b_abs_mstr */
END PROCEDURE.  /* ip_invoiced */

PROCEDURE p-chk-qadwkfl:
/*-----------------------------------------------------------------------
 Purpose: To check qad_wkfl record exist or not
 Parameters:
 Notes:
-------------------------------------------------------------------------*/
   define input parameter p_shipfrom like abs_shipfrom no-undo.
   define input parameter p_doctype  as   character    no-undo.
   define input parameter p_absid    like abs_id       no-undo.

   define input-output parameter  p_undoflg like mfc_logical no-undo.

   define buffer buf_abs_mstr for abs_mstr.
   define buffer buf_qad_wkfl for qad_wkfl.

   p_absid = p_doctype + p_absid.
   for first buf_abs_mstr
      where buf_abs_mstr.abs_domain   = global_domain
      and   buf_abs_mstr.abs_shipfrom = p_shipfrom
      and   buf_abs_mstr.abs_id       = p_absid
   no-lock:
      for first buf_qad_wkfl
         where buf_qad_wkfl.qad_domain   = global_domain
         and   buf_qad_wkfl.qad_key1     = "icshmt.p"
         and   buf_qad_wkfl.qad_key2     = p_shipfrom + "," + p_absid
      no-lock:
         if buf_qad_wkfl.qad_key4 <> SessionUniqueID
         then do:
            /* RECORD LOCKED BY ANOTHER USER.  TRY LATER # */
            {us/bbi/pxmsg.i &MSGNUM=7422 &ERRORLEVEL=3 }
            p_undoflg = yes.
         end. /* if buf_qad_wkfl.qad_key4 <> SessionUniqueID */
         return.
      end. /* FOR FIRST buf_qad_wkfl */
   end. /* FOR FIRST buf_abs_mstr */
END PROCEDURE. /* p-chk-qadwkfl */

PROCEDURE p-create-qadwkfl:
/*-----------------------------------------------------------------------
 Purpose: To create qad_wkfl record if does not exist.
 Parameters:
 Notes:
-------------------------------------------------------------------------*/
   define input parameter p_shipfrom like abs_shipfrom no-undo.
   define input parameter p_absid    like abs_id       no-undo.

   define buffer b_qad_wkfl for qad_wkfl.
   do transaction:

      for first b_qad_wkfl
         where b_qad_wkfl.qad_domain = global_domain
         and   b_qad_wkfl.qad_key1   = "icshmt.p"
         and   b_qad_wkfl.qad_key2   =  p_shipfrom + "," + p_absid
      no-lock:
      end. /* FOR FIRST b_qad_wkfl */
      if not available b_qad_wkfl
      then do:
         create b_qad_wkfl.
         assign
            b_qad_wkfl.qad_domain     = global_domain
            b_qad_wkfl.qad_key1       = "icshmt.p"
            b_qad_wkfl.qad_key2       =  p_shipfrom + "," + p_absid
            b_qad_wkfl.qad_key3       = "icshmt.p"
            b_qad_wkfl.qad_key4       = SessionUniqueID
            b_qad_wkfl.qad_charfld[1] = global_userid
            b_qad_wkfl.qad_charfld[2] = p_absid
            b_qad_wkfl.qad_charfld[3] = p_shipfrom
            b_qad_wkfl.qad_date[1]    = today
            b_qad_wkfl.qad_charfld[5] = string(time, "hh:mm:ss").

         if recid(b_qad_wkfl) = -1
         then
            .
      end. /* IF NOT AVAILABLE b_qad_wkfl */
   end. /* DO TRANSACTION */
END PROCEDURE. /* p-create-qadwkfl */

PROCEDURE p-delabs:

   define input parameter prec as recid no-undo.

   define buffer b_abs_mstr for abs_mstr.

   find b_abs_mstr 
      where recid(b_abs_mstr) = prec
   exclusive-lock no-error.

   if available b_abs_mstr
   then
      delete b_abs_mstr.

END PROCEDURE. /* p-delabs */


