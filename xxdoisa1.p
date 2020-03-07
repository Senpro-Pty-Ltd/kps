/* dsdoisa1.p - DISTRIBUTION ORDER ISSUE SUBROUTINE RECEIPT AT GIT SITE       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdoisa1.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/*                                                                            */
/* NOTES:   1. Set in_level to a value of 99999 when in_mstr is created or    */
/*             when any structure or network changes are made that affect     */
/*             the low level codes.                                           */
/*          2. The in_levels are recalculated when MRP is run or can be       */
/*             resolved by running the mrllup.p utility program.              */
/*                                                                            */
/* REVISION: 6.0      LAST MODIFIED: 10/03/91   BY: alb *D887*                */
/* REVISION: 7.0      LAST MODIFIED: 01/27/92   BY: emb                       */
/* REVISION: 7.0      LAST MODIFIED: 03/31/92   BY: emb *F225*                */
/* REVISION: 7.0      LAST MODIFIED: 06/02/92   BY: emb *F611*                */
/* REVISION: 7.0      LAST MODIFIED: 07/09/92   BY: pma *F748*                */
/* REVISION: 7.0      LAST MODIFIED: 07/13/92   BY: emb *F810*                */
/* REVISION: 7.3      LAST MODIFIED: 09/27/93   BY: jcd *G247*                */
/* REVISION: 7.3      LAST MODIFIED: 12/01/93   BY: pma *F003*                */
/* REVISION: 7.3      LAST MODIFIED: 02/15/94   BY: pxd *FL60*                */
/* REVISION: 7.3      LAST MODIFIED: 02/16/94   BY: qzl *FL85*                */
/* REVISION: 7.3      LAST MODIFIED: 04/18/94   BY: qzl *GJ45*                */
/* REVISION: 7.4      LAST MODIFIED: 08/09/94   BY: qzl *H472*                */
/* REVISION: 7.3      LAST MODIFIED: 09/06/94   BY: ais *FP87*                */
/* REVISION: 7.3      LAST MODIFIED: 04/19/94   BY: qzl *GJ45*                */
/* REVISION: 7.3      LAST MODIFIED: 10/19/94   BY: qzl *FS60*                */
/* REVISION  7.4      LAST MODIFIED: 10/29/94   BY: bcm *GN73*                */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.4      LAST MODIFIED: 04/10/95   BY: pxd *F0PZ*                */
/* REVISION: 7.4      LAST MODIFIED: 10/24/96   BY: *H0NH* Julie Milligan     */
/* REVISION: 8.6      LAST MODIFIED: 03/25/97   BY: *K04X* Steve Goeke        */
/* REVISION: 8.6      LAST MODIFIED: 03/05/97   BY: *H0S5* Julie Milligan     */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 08/05/98   BY: *J2RN* Thomas Fernandes   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Vijaya Pakala      */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00   BY: *N0KK* Jacolyn Neder      */
/* REVISION: 9.1      LAST MODIFIED: 09/07/00   BY: *N0MX* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 11/06/00   BY: *N0TN* Jean Miller        */
/* Revision: 1.10.1.8      BY: Niranjan R.        DATE: 07/16/01  ECO: *P00L* */
/* Revision: 1.10.1.9      BY: Robin McCarthy     DATE: 07/31/01  ECO: *P009* */
/* Revision: 1.10.1.10     BY: Patrick Rowan      DATE: 06/27/02  ECO: *P091* */
/* Revision: 1.10.1.12     BY: Paul Donnelly (SB) DATE: 06/26/03  ECO: *Q00B* */
/* Revision: 1.10.1.13     BY: Rajinder Kamra     DATE: 05/05/03  ECO: *Q003* */
/* Revision: 1.10.1.14     BY: Saurabh Chaturvedi DATE: 10/13/03  ECO: *P163* */
/* Revision: 1.10.1.15     BY: Jean Miller        DATE: 01/07/04  ECO: *Q04Y* */
/* Revision: 1.10.1.16     BY: Shilpa Kamath      DATE: 03/09/06  ECO: *R03V* */
/* Revision: 1.10.1.17     BY: Anil Sudhakaran    DATE: 01/17/07  ECO: *R0C6* */
/* $Revision: 1.2 $    BY: Mochesh Chandran   DATE: 11/07/07  ECO: *R0JW* */
/* CYB    LAST MODIFIED: 02-JUN-2010    BY:  gbg *cy1005*                    */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                    LAST MODIFIED: 05-Sep-2013 BY: gbg *c1433* Q1036168 */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}   /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
 
define input parameter nbr like dsd_nbr.
define input parameter req-nbr like dsd_req_nbr.
define input parameter part    like dsd_part.
define input parameter from_site like dsd_shipsite.
define input parameter to_site like dsd_site.
define input parameter git_site  like dsd_site.
define input parameter project like dsd_project.
define input parameter ldexpire like ld_expire.
define input parameter ldgrade  like ld_grade.
define input parameter ldassay  like ld_assay.
define input parameter ldstatus like ld_status no-undo.
define input parameter from_ld_exists like mfc_logical no-undo.
define input parameter i_abs_recid    as   recid       no-undo.
define input parameter consigned_qty like sr_qty no-undo.
define input parameter pIntercoRef like glt_interco_ref no-undo.
define output parameter undo-input like mfc_logical.
 
define new shared variable pacct like pl_inv_acct.
define new shared variable psub  like pl_inv_sub.
define new shared variable pacc  like pl_inv_cc.
define new shared variable transtype as character format "x(7)".
 
define shared variable rec_site like dss_rec_site.
define shared variable eff_date like tr_date.
define shared variable expect_date like dsd_due_date.
define shared variable bol like dss_bol.
define shared variable trans_id like dsd_trans_id.
/*cy1005*  define shared variable site like sr_site no-undo. */
/*cy1005*/ define shared variable site as char label "Site"  no-undo.
define shared variable location like sr_loc no-undo.
define shared variable lotserial like sr_lotser no-undo.
define shared variable lotref like sr_ref no-undo.
define shared variable trqty like tr_qty_chg.
define shared variable from_db as character.
define shared variable from_cost like sct_cst_tot.
define shared variable to_entity like si_entity.
define shared variable to_db as character.
define shared variable to_cost like sct_cst_tot.
define shared variable glx_mthd like cs_method.
define shared variable glx_set like cs_set.
define shared variable cur_mthd like cs_method.
define shared variable cur_set like cs_set.
 
define variable trgl_recno as recid.
define variable git_entity like si_entity.
define variable qty_left like tr_qty_chg.
define variable ref like glt_ref.
define variable dr_acct like trgl_dr_acct.
define variable dr_sub  like trgl_dr_sub.
define variable dr_cc like trgl_dr_cc.
define variable from_entity like en_entity.
define variable gl_amt like glt_amt.
define variable original_db as character.
define variable git_db as character.
define variable err-flag as integer.
define variable glcost like sct_cst_tot.
define variable intermediate_acct like trgl_dr_acct.
define variable intermediate_sub  like trgl_dr_sub.
define variable intermediate_cc like trgl_dr_cc.
define variable xfer_acct like trgl_dr_acct.
define variable xfer_sub  like trgl_dr_sub.
define variable xfer_cc   like trgl_dr_cc.
define variable dingbat_acct as character initial "########".
define variable dingbat_sub  as character initial "%%%%%%%%".
define variable dingbat_cc as character initial "@@@@".
define variable dcol as character initial "::".
define variable l_total_ship as decimal no-undo.
 
 
undo-input = true.
 
do transaction:
 
   find dsd_det where dsd_domain = global_domain
      and dsd_req_nbr = req-nbr
      and dsd_site = to_site
      and dsd_shipsite = from_site
      and dsd_part = part
      and dsd_nbr = nbr
   exclusive-lock no-error.
 
   if not available dsd_det then
   find dsd_det where dsd_domain = global_domain
      and dsd_req_nbr = req-nbr
      and dsd_site = to_site
      and dsd_shipsite = from_site
      and dsd_part = part
      and dsd_nbr = ""
   exclusive-lock no-error.
 
   if not available dsd_det then do on error undo, leave:
 
      find dsd_det where dsd_domain = global_domain
         and dsd_req_nbr = req-nbr
         and dsd_site = to_site
         and dsd_shipsite = from_site
      no-lock no-error.
 
      if available dsd_det then do:
         if dsd_part <> part then do:
            /* REQUISITION NUMBER ALREADY EXISTS */
            {us/bbi/pxmsg.i &MSGNUM=360 &ERRORLEVEL=4 &MSGARG1="""for item"""
                                               &MSGARG2=dsd_part}
            leave.
         end.
         if dsd_nbr <> nbr then do:
            /* REQUISITION ALREADY ATTACHED TO DISTRIBUTION ORDER */
            {us/bbi/pxmsg.i &MSGNUM=1610 &ERRORLEVEL=4  &MSGARG1=dsd_nbr}
            leave.
         end.
      end.
 
      create dsd_det.
      assign
         dsd_domain = global_domain
         dsd_site     = to_site
         dsd_shipsite = from_site
         dsd_req_nbr  = req-nbr
         dsd_part     = part
         dsd_qty_conf = trqty
         dsd_due_date = expect_date
         dsd_trans_id = trans_id
         dsd_status   = "R"
         dsd_git_site = git_site
         dsd_project  = project
         dsd_nbr      = nbr.
 
      find pt_mstr where pt_domain = global_domain and
                         pt_part = dsd_part
      no-lock no-error.
 
      if available pt_mstr then do:
         {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                  &PARAM = "(input  dsd_part,
                             input  dsd_site,
                             input ""pt_loc"",
                             output dsd_loc)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
         }
      end.
 
      find in_mstr where in_domain = global_domain
                     and in_part = dsd_part
                     and in_site = dsd_site
      no-lock no-error.
 
      if available in_mstr and in_loc <> "" then
         dsd_loc = in_loc.
 
      run set_git_acct
         (input  recid(dsd_det),
          output pacct,
          output psub,
          output pacc).
 
      /* UPDATE MRP FILES */
      {us/mf/mfmrw.i "dsd_det" dsd_part dsd_req_nbr dsd_site
         dsd_shipsite dsd_shipdate dsd_due_date dsd_qty_conf
         "SUPPLY" INTERSITE_ORDER dsd_site}
 
   end.
 
   if available dsd_det then do:
 
      original_db = global_db.
 
      find si_mstr where si_domain = global_domain and
                         si_site = git_site
      no-lock no-error.
 
      if si_db <> global_db then do:
         /* SWITCH TO THE GOODS IN TRANSITE SITE'S DOMAIN */
         {us/bbi/gprun.i ""gpmdas.p"" "(input si_db, output err-flag)"}
         if err-flag <> 0 then do:
            /* DOMAIN # IS NOT AVAILABLE */
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=si_db}
            undo, return.
         end.
      end.
 
/*cy1005*  {us/bbi/gprun.i ""dsdoisaa.p"" */
/*cy1005*/ {us/bbi/gprun.i ""xxdoisaa.p""
               "(input from_site,
                 input git_site,
                 input to_site,
                 input pacct,
                 input psub,
                 input pacc,
                 input trans_id,
                 input git_entity,
                 input part,
                 input project,
                 input trqty,
                 input nbr,
                 input lotref,
                 input lotserial,
                 input req-nbr,
                 input dsd_qty_ord,
                 input dsd_qty_rcvd,
                 input dsd_transit,
                 input ldexpire,
                 input ldgrade,
                 input ldassay,
                 input ldstatus,
                 input from_ld_exists,
                 input i_abs_recid,
                 input consigned_qty,
                 input dsd_po_nbr,
                 input pIntercoRef)"}
 
      if original_db <> global_db then do:
         /* SWITCH BACK TO THE ORIGINAL DOMAIN */
         {us/bbi/gprun.i ""gpmdas.p"" "(input original_db, output err-flag)"}
         if err-flag <> 0 then do:
            /* DOMAIN # IS NOT AVAILABLE */
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=original_db}
            undo, return.
         end.
      end.
 
      /* UPDATE DISTRIBUTION ORDER ALLOCATION */
      assign
         dsd_shipdate = eff_date
         dsd_qty_ship = dsd_qty_ship + trqty
         dsd_transit = dsd_transit + trqty.
 
      /* RECEIPT DEFAULTS */
      find first qad_wkfl where
         qad_domain = global_domain and
         qad_key1 = "dsd_det" + dcol + dsd_req_nbr
                              + dcol + dsd_site
                              + dcol + dsd_shipsite
         and
         qad_key2 = dsd_nbr + dcol
                            + string(year(eff_date),"9999")
                            + string(month(eff_date),"99")
                            + string(day(eff_date),"99")
                            + dcol + dsd_trans_id
                            + dcol + lotserial
                            + dcol + lotref
      exclusive-lock no-error.
 
      if not available qad_wkfl
      then do:
         create qad_wkfl.
         assign
            qad_domain = global_domain
            qad_key1 = "dsd_det"
                        + dcol + dsd_req_nbr
                        + dcol + dsd_site
                        + dcol + dsd_shipsite
            qad_key2 = dsd_nbr + dcol
                        + string(year(eff_date),"9999")
                        + string(month(eff_date),"99")
                        + string(day(eff_date),"99")
                        + dcol + dsd_trans_id
                        + dcol + lotserial
                        + dcol + lotref.
      end.
 
      assign
         qad_charfld[1] = dsd_part
         qad_charfld[2] = git_site
         qad_charfld[3] = dsd_trans_id
         qad_charfld[4] = lotserial
         qad_charfld[5] = lotref
         qad_charfld[6] = bol
         qad_datefld[1] = eff_date
         qad_datefld[2] = expect_date
         qad_decfld[1] = qad_decfld[1] + trqty.
 
      l_total_ship = 0.
 
      for each qad_wkfl
         where qad_wkfl.qad_domain     = global_domain
         and   qad_wkfl.qad_key1       = "dsd_det" + dcol + dsd_req_nbr
                                               + dcol + dsd_site
                                               + dcol + dsd_shipsite
         and   qad_wkfl.qad_key2 begins  dsd_nbr + dcol
         and   qad_wkfl.qad_charfld[1] = dsd_part
         and   qad_wkfl.qad_charfld[3] = dsd_trans_id
         and   qad_wkfl.qad_charfld[4] = lotserial
         and   qad_wkfl.qad_charfld[5] = lotref
      no-lock:
         l_total_ship = l_total_ship + qad_decfld[1].
      end. /* FOR EACH qad_wkfl */
 
/*Q1036168*       if l_total_ship <= 0 */
/*Q1036168*/ if l_total_ship = 0
      then do:
         for each qad_wkfl 
            where qad_domain   = global_domain
            and   qad_key1     = "dsd_det" + dcol + dsd_req_nbr
                                         + dcol + dsd_site
                                         + dcol + dsd_shipsite
            and qad_key2 begins  dsd_nbr + dcol
            and qad_charfld[1] = dsd_part
            and qad_charfld[3] = dsd_trans_id
            and qad_charfld[4] = lotserial
            and qad_charfld[5] = lotref
         exclusive-lock:
            delete qad_wkfl.
         end. /* FOR EACH qad_wkfl */
      end. /* IF l_total_ship <= 0 */ 
   end.
 
   undo-input = false.
end.
 
/*************************************************************************/
 
PROCEDURE set_git_acct:
 
   define input  parameter dsd_recno as   recid        no-undo.
   define output parameter pacct     like pl_inv_acct  no-undo.
   define output parameter psub      like pl_inv_sub   no-undo.
   define output parameter pacc      like pl_inv_cc    no-undo.
 
   define variable git_acct  like si_git_acct  no-undo.
   define variable git_sub   like si_git_sub   no-undo.
   define variable git_cc    like si_git_cc    no-undo.
 
   find first dsd_det where recid(dsd_det) = dsd_recno
      exclusive-lock.
 
   for first pt_mstr
      where pt_domain = global_domain and
            pt_part = dsd_part
   no-lock: end.
 
   if available pt_mstr then do:
 
      for first pld_det
         where pld_domain = global_domain
           and pld_prodline = pt_prod_line
           and pld_site       = dsd_site
           and pld_loc        = dsd_trans_id
      no-lock: end.
 
      if available pld_det and pld_inv_acct <> "" then
         assign
            git_acct = pld_inv_acct
            git_sub  = pld_inv_sub
            git_cc   = pld_inv_cc.
      else do:
 
         for first pld_det
             where pld_domain = global_domain
               and pld_prodline = pt_prod_line
               and pld_site     = dsd_site
               and pld_loc      = ""
         no-lock: end.
 
         if available pld_det and pld_inv_acct <> "" then
            assign
               git_acct = pld_inv_acct
               git_sub  = pld_inv_sub
               git_cc   = pld_inv_cc.
         else do:
            for first pl_mstr
               where pl_domain = global_domain and
                     pl_prod_line = pt_prod_line
            no-lock: end.
            if available pl_mstr and pl_inv_acct <> "" then
               assign
                  git_acct = pl_inv_acct
                  git_sub  = pl_inv_sub
                  git_cc   = pl_inv_cc.
            else do:
               for first si_mstr
                  where si_domain = global_domain and
                        si_site = dsd_site
               no-lock: end.
               if available si_mstr and si_git_acct <> "" then
                  assign
                     git_acct = si_git_acct
                     git_sub  = si_git_sub
                     git_cc   = si_git_cc.
               else do:
                  for first gl_ctrl
                     where gl_domain = global_domain
                  no-lock: end.
                  if available gl_ctrl then
                     assign
                        git_acct = gl_inv_acct
                        git_sub  = gl_inv_sub
                        git_cc   = gl_inv_cc.
               end. /* else of if available si_mstr */
 
            end. /* else of if available pl_mstr */
 
         end. /* else of if avalilable pld_det */
 
      end. /* else of if available pld_det */
 
   end. /* IF available pt_mstr */
 
   assign
      dsd_git_acct = git_acct
      dsd_git_sub  = git_sub
      dsd_git_cc   = git_cc
      pacct        = git_acct
      psub         = git_sub
      pacc         = git_cc.
 
   for first ds_det
      where ds_domain = global_domain
        and ds_req_nbr  = dsd_req_nbr
        and ds_site     = dsd_site
        and ds_shipsite = dsd_shipsite
   exclusive-lock: end.
 
   if available ds_det then
      assign
         ds_git_acct = git_acct
         ds_git_sub  = git_sub
         ds_git_cc   = git_cc.
 
END PROCEDURE. /* procedure set_git_acct */
