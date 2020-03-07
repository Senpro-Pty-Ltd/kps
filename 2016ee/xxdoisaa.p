/* xxdoisaa.p - DISTRIBUTION ORDER ISSUE SUBROUTINE RECEIPT AT GIT SITE       */
/* dsdoisaa.p - DISTRIBUTION ORDER ISSUE SUBROUTINE RECEIPT AT GIT SITE       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdoisaa.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/*                                                                            */
/* This program created to handle multi-database DO GIT site receipt          */
/*                                                                            */
/* REVISION: 7.2      LAST MODIFIED: 02/16/94  BY: qzl    *FL85*              */
/* REVISION: 7.4      LAST MODIFIED: 08/09/94  BY: qzl    *H472*              */
/* REVISION: 7.2      LAST MODIFIED: 09/06/94  BY: ais    *FP87*              */
/* REVISION: 7.2      LAST MODIFIED: 10/06/94  BY: ais    *FR66*              */
/* REVISION: 7.2      LAST MODIFIED: 10/27/94  BY: qzl    *FS60*              */
/* REVISION: 7.4      LAST MODIFIED: 10/29/94  BY: bcm    *GN73*              */
/* REVISION: 7.4      LAST MODIFIED: 12/25/94  BY: ais    *F0BP*              */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95  BY: dzn    *F0PN*              */
/* REVISION: 7.4      LAST MODIFIED: 04/11/95  BY: pxd    *F0PZ*              */
/* REVISION: 7.4      LAST MODIFIED: 06/23/95  BY: emb    *F0SW*              */
/* REVISION: 8.5      LAST MODIFIED: 09/22/95  BY: sxb    *J053*              */
/* REVISION: 7.4      LAST MODIFIED: 01/16/96  BY: ame    *G1K4*              */
/* REVISION: 8.5      LAST MODIFIED: 12/10/96  BY: *J1BS* Julie Milligan      */
/* REVISION: 8.5      LAST MODIFIED: 12/14/96  BY: *H0NH* Julie Milligan      */
/* REVISION: 8.6      LAST MODIFIED: 03/25/97  BY: *K04X* Steve Goeke         */
/* REVISION: 8.6      LAST MODIFIED: 03/05/97  BY: *H0S5* Julie Milligan      */
/* REVISION: 8.6      LAST MODIFIED: 07/07/97  BY: *J1PS* Felcy D'Souza       */
/* REVISION: 8.6      LAST MODIFIED: 01/09/98  BY: *H1J1* Thomas Fernandes    */
/* REVISION: 8.6E     LAST MODIFIED: 05/11/98  BY: *J2LG* Dana Tunstall       */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98  BY: *L00Y* Jeff Wootton        */
/* REVISION: 8.6E     LAST MODIFIED: 06/29/98  BY: *L034* Markus Barone       */
/* REVISION: 8.6E     LAST MODIFIED: 07/08/98  BY: *L01D* Brenda Milton       */
/* REVISION: 8.6E     LAST MODIFIED: 08/12/98  BY: *J2SW* Dana Tunstall       */
/* REVISION: 8.6E     LAST MODIFIED: 08/10/98  BY: *J2RN* Thomas Fernandes    */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99  BY: *N014* Vijaya Pakala       */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00  BY: *N0KK* Jacolyn Neder       */
/* REVISION: 9.1      LAST MODIFIED: 09/18/00  BY: *N0W6* Mudit Mehta         */
/* Revision: 1.24.1.6        BY: Niranjan R.     DATE: 07/11/01 ECO: *P00L*   */
/* Revision: 1.24.1.7        BY: Robin McCarthy  DATE: 07/31/01 ECO: *P009*   */
/* Revision: 1.24.1.8        BY: Paul Donnelly   DATE: 12/13/01 ECO: *N16J*   */
/* Revision: 1.24.1.11       BY: Jeff Wootton    DATE: 05/14/02 ECO: *P03G*   */
/* Revision: 1.24.1.12       BY: Kirti Desai     DATE: 05/31/02 ECO: *N1JJ*   */
/* Revision: 1.24.1.13       BY: Patrick Rowan   DATE: 06/27/02 ECO: *P091*   */
/* Revision: 1.24.1.15       BY: Paul Donnelly   DATE: 06/26/03 ECO: *Q00B*   */
/* Revision: 1.24.1.16       BY: Dipesh Bector   DATE: 09/01/03 ECO: *P111*   */
/* Revision: 1.24.1.18       BY: Manish Dani     DATE: 03/12/04 ECO: *P1SW*   */
/* Revision: 1.24.1.19       BY: Bhavik Rathod   DATE: 01/24/05 ECO: *P34Y*   */
/* Revision: 1.24.1.20       BY: Karel Groos     DATE: 02/28/05 ECO: *R009*   */
/* Revision: 1.24.1.21       BY: Ed van de Gevel DATE: 03/11/05 ECO: *R00L*   */
/* Revision: 1.24.1.22       BY: Niranjan Ranka  DATE: 07/05/06 ECO: *R073*   */
/* Revision: 1.24.1.23       BY: Anil Sudhakaran DATE: 01/19/07 ECO: *R0C6*   */
/* Revision: 1.24.1.25       BY: Sandeep Panchal DATE: 03/18/08 ECO: *P6K9*   */
/* Revision: 1.24.1.26       BY: Steve Nugent DATE: 02/25/09 ECO: *R1D1*   */
/* Revision: 1.24.1.27       BY: Ambrose A A  DATE: 07/10/09 ECO: *Q322*   */
/* Revision: 1.24.1.29     BY: Ravi Swmai  DATE: 01/15/10 ECO: *Q3RH*   */
/* Revision: 1.24.1.29    BY: Huaping Luo     DATE: 03/10/10 ECO: *R21W*   */
/* $Revision: 1.2 $   BY: Huaping Luo     DATE: 03/10/10 ECO: *R237*   */
/* CYB    LAST MODIFIED: 02-JUN-2010    BY:  gbg *cy1005*                    */
/* CYB    LAST MODIFIED: 27-JUL-2012    BY:  gbg *c1317*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 08-FEB-2013    BY:  gbg *c1362*                     */
/* CYB    LAST MODIFIED: 18-APR-2013    BY:  gbg *c1383* Q1004390            */
/* CYB    Q1004390*   QAD Patch retrofitted in c1383                         */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}

define input parameter from_site      like dsd_shipsite no-undo.
define input parameter git_site       like dsd_git_site no-undo.
define input parameter to_site        like dsd_site     no-undo.
define input parameter dsdgitacct     like dsd_git_acct no-undo.
define input parameter dsdgitsub      like dsd_git_sub  no-undo.
define input parameter dsdgitcc       like dsd_git_cc   no-undo.
define input parameter trans_id       like dsd_trans_id no-undo.
define input parameter git_entity     like si_entity    no-undo.
define input parameter part           like dsd_part     no-undo.
define input parameter project        like dsd_project  no-undo.
define input parameter trqty          like tr_qty_chg   no-undo.
define input parameter nbr            like dsd_nbr      no-undo.
define input parameter lotref         like sr_ref       no-undo.
define input parameter lotserial      like sr_lotser    no-undo.
define input parameter req-nbr        like dsd_req_nbr  no-undo.
define input parameter dsdqtyord      like dsd_qty_ord  no-undo.
define input parameter dsdqtyrcvd     like dsd_qty_rcvd no-undo.
define input parameter dsdtransit     like dsd_transit  no-undo.
define input parameter ldexpire       like ld_expire    no-undo.
define input parameter ldgrade        like ld_grade     no-undo.
define input parameter ldassay        like ld_assay     no-undo.
define input parameter ldstatus       like ld_status    no-undo.
define input parameter from_ld_exists like mfc_logical  no-undo.
define input parameter i_abs_recid    as   recid        no-undo.
define input parameter consigned_qty  like sr_qty       no-undo.
define input parameter dsd_ponbr      like dsd_po_nbr   no-undo.
define input parameter pIntercoRef    like glt_interco_ref no-undo.

define variable vcProdLine           like pt_prod_line  no-undo.
define variable vcCmType             like cm_type       no-undo.
define variable vcFreightDesc        as   character     no-undo.
define variable vcInternalRef        like lacd_internal_ref no-undo.
define variable use-log-acctg as logical no-undo.
define variable vcExpAcct           like glt_acct  no-undo.
define variable vcExpSub            like glt_sub   no-undo.
define variable vcExpCc             like glt_cc    no-undo.
define variable vcDssNbr            as char        no-undo.
define variable vcLogCreation       like mfc_logical no-undo.
define variable vcTt_amt            like pvod_accrued_amt no-undo.
define variable vcNegShipID         like  tr_ship_id  no-undo.
define buffer btr_hist for tr_hist .
/* INTER-COMPANY ACCOUNT PROCEDURES */
{us/px/pxpgmmgr.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i ictrxr}
{us/px/pxphdef.i ppprxr}
{us/la/lafrttmp.i}   /* LOGISTICS ACCOUNTING FREIGHT TEMP-TABLE */
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/bbi/gplabel.i}

define new shared variable reavg_yn as logical.

define shared variable from_db       as   character.
define shared variable from_cost     like sct_cst_tot.
define shared variable to_entity     like si_entity.
define shared variable to_db         as   character.
define shared variable to_cost       like sct_cst_tot.
/*cy1005*  define shared variable site          like sr_site no-undo. */
/*cy1005*/ define shared variable site      as char label "Site" no-undo.
define shared variable location      like sr_loc no-undo.
define shared variable eff_date      like tr_date.
define shared variable from_curr     like exr_curr1.
define shared variable exch_rate     like exr_rate.
define shared variable exch_rate2    like exr_rate2.
define shared variable exch_ratetype like exr_ratetype no-undo.
define shared variable exch_exru_seq like exru_seq no-undo.
define shared variable sctsim        like sct_site.
define shared variable sctbdn_ll     like sct_bdn_ll.
define shared variable sctbdn_tl     like sct_bdn_tl.
define shared variable sctlbr_ll     like sct_lbr_ll.
define shared variable sctlbr_tl     like sct_lbr_tl.
define shared variable sctmtl_ll     like sct_mtl_ll.
define shared variable sctmtl_tl     like sct_mtl_tl.
define shared variable sctovh_ll     like sct_ovh_ll.
define shared variable sctovh_tl     like sct_ovh_tl.
define shared variable sctsub_ll     like sct_sub_ll.
define shared variable sctsub_tl     like sct_sub_tl.
define shared variable glx_mthd      like cs_method.
define shared variable glx_set       like cs_set.
define shared variable cur_mthd      like cs_method.
define shared variable cur_set       like cs_set.
define shared variable cancel_bo     as   logical no-undo.
define shared variable dss_recno     as recid.

define variable dr_acct           like trgl_dr_acct                 no-undo.
define variable dr_sub            like trgl_dr_sub                  no-undo.
define variable dr_cc             like trgl_dr_cc                   no-undo.
define variable intermediate_acct like trgl_dr_acct                 no-undo.
define variable intermediate_sub  like trgl_dr_sub                  no-undo.
define variable intermediate_cc   like trgl_dr_cc                   no-undo.
define variable xfer_acct         like trgl_dr_acct                 no-undo.
define variable xfer_sub          like trgl_dr_sub                  no-undo.
define variable xfer_cc           like trgl_dr_cc                   no-undo.
define variable from_entity       like en_entity                    no-undo.
define variable dingbat_acct      as   character initial "########" no-undo.
define variable dingbat_sub       as   character initial "%%%%%%%%" no-undo.
define variable dingbat_cc        as   character initial "@@@@"     no-undo.
define variable original_db       as   character                    no-undo.
define variable sct_recno         as   recid                        no-undo.
define variable ref               like glt_ref                      no-undo.
define variable trgl_recno        as   recid                        no-undo.
define variable newmtl_tl         as   decimal                      no-undo.
define variable newlbr_tl         as   decimal                      no-undo.
define variable newbdn_tl         as   decimal                      no-undo.
define variable newovh_tl         as   decimal                      no-undo.
define variable newsub_tl         as   decimal                      no-undo.
define variable newmtl_ll         as   decimal                      no-undo.
define variable newlbr_ll         as   decimal                      no-undo.
define variable newbdn_ll         as   decimal                      no-undo.
define variable newovh_ll         as   decimal                      no-undo.
define variable newsub_ll         as   decimal                      no-undo.
define variable newcst            as   decimal                      no-undo.
define variable msgref            like tr_msg                       no-undo.
define variable gl_tmp_amt        as   decimal                      no-undo.
define variable trans-ok          like mfc_logical                  no-undo.
define variable v_shipnbr         like tr_ship_id                   no-undo.
define variable v_shipdate        like tr_ship_date                 no-undo.
define variable v_invmov          like tr_ship_inv_mov              no-undo.
define variable inrecno           as   recid                        no-undo.
define variable mc-error-number   like msg_nbr                      no-undo.
define variable new_ld            like mfc_logical                  no-undo.
define variable dftVendor         like vd_addr                      no-undo.
define variable procid            as character                      no-undo.
define variable dummy_qty         like sr_qty                       no-undo.
define buffer b1tr_hist  for tr_hist.
define variable vTotNegQty  like tr_qty_loc no-undo.

define variable mgmt_amt               like gl_tmp_amt      no-undo.
define variable mgmt_acct_ex_rate1     as decimal       no-undo.
define variable mgmt_acct_ex_rate2     as decimal       no-undo.
define variable l_mgmt_curr_ex_rate1   as decimal       no-undo.
define variable l_mgmt_curr_ex_rate2   as decimal       no-undo.
define shared variable mgmt_curr              like glt_curr no-undo.
define variable mgmt_rate_type         as character no-undo.
define shared variable lInventIsFallBack      as logical no-undo.
define shared variable lStatIsFallBack        as logical no-undo.
define variable lStatCurrError  as logical no-undo.
define variable iStatErrorMsg   as integer no-undo.

{us/gp/gprunpdf.i "gpscpl" "p"}


/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

/* trgl_det account variables */
{us/ic/icglacct.i}

{us/gp/gprunp.i "gpscpl" "p" "getStatCurrWithInventory"
                "(input  mgmt_curr,
                  input  lInventIsFallBack,
                  input  lStatIsFallBack,
                  input  eff_date,
                  input  glx_mthd,
                  output mgmt_acct_ex_rate1,
                  output mgmt_acct_ex_rate2,
                  output l_mgmt_curr_ex_rate1,
                  output l_mgmt_curr_ex_rate2,
                  output lStatCurrError,
                  output iStatErrorMsg)"}

  if lStatCurrError = true then do:
    {us/bbi/pxmsg.i &MSGNUM=iStatErrorMsg &ERRORLEVEL=4}
    return.
  end.

/* GET ASSOCIATED SHIPPER */
for first abs_mstr
   where recid(abs_mstr) = i_abs_recid
   no-lock:
end. /* FOR FIRST abs_mstr */

if available abs_mstr
then
   assign
      v_shipnbr  = substring(abs_id,2)
      v_shipdate = abs_shp_date
      v_invmov   = abs_inv_mov.
else
   assign
      v_shipnbr  = ""
      v_shipdate = ?
      v_invmov   = "".

if lotserial <> ""
then do:

   for first clc_ctrl
      where clc_ctrl.clc_domain = global_domain no-lock:
   end. /* FOR FIRST clc_ctrl */

   if available clc_ctrl
   and clc_active
   and clc_lotlevel <> 0
   then do:

      /* ADD RECORD TO LOT_MSTR */
      {us/bbi/gprun.i ""gpiclt.p"" "(input  part,
                              input  lotserial,
                              input  """",
                              input  """",
                              output trans-ok)"
      }

      if not trans-ok
      then do:
         /* CURRENT TRANSACTION REJECTED - CONTINUE WITH NEXT TRANSACTION */
         {us/bbi/pxmsg.i &MSGNUM = 2740 &ERRORLEVEL = 4 }
         leave.
      end. /* IF NOT trans-ok */

   end. /* IF AVAIL clc_ctrl AND clc_active AND clc_lotlevel <> 0 */
end. /* IF lotserial <> "" */

for first icc_ctrl
    where icc_ctrl.icc_domain = global_domain no-lock:
end. /* FOR FIRST icc_ctrl */

for first gl_ctrl
    where gl_ctrl.gl_domain = global_domain no-lock:
end. /* FOR FIRST gl_ctrl */

for first si_mstr
    where si_mstr.si_domain = global_domain and  si_site = from_site
   no-lock:
end. /* FOR FIRST si_mstr */

assign
   from_db           = si_db
   from_site         = si_site
   from_entity       = si_entity
   to_cost           = 0
   intermediate_acct = dingbat_acct
   intermediate_sub  = dingbat_sub
   intermediate_cc   = dingbat_cc.

for first si_mstr
    where si_mstr.si_domain = global_domain and  si_site = git_site
   no-lock:
end. /* FOR FIRST si_mstr */

/* Get transfer variance account/subaccount/cost center */
   for first pt_mstr
                     where pt_mstr.pt_domain = global_domain
                       and pt_part = part
                     no-lock:
      {us/px/pxrun.i &PROGRAM='glacdfpl.p'
               &PROC='GetDefaultAcct'
               &PARAM="( input '',
                         input 'XFER_ACCT',
                         input pt_prod_line,
                         input si_site,
                         input '',
                         input '',
                         input '',
                         input '',
                         output xfer_acct,
                         output xfer_sub,
                         output xfer_cc)"
               &CATCHERROR=true
               &NOAPPERROR=true
      }
   end.

   if not available pt_mstr or return-value <> {&SUCCESS-RESULT} then
      assign xfer_acct = si_xfer_acct
             xfer_sub  = si_xfer_sub
             xfer_cc   = si_xfer_cc.
assign
   to_db      = si_db
   to_site    = si_site
   git_entity = si_entity
   to_entity  = si_entity.

/* GET TOTAL GL COST */
{us/gp/gpsct06.i &part=part &site=to_site &type=""GL"" }
if available sct_det
then
   to_cost = sct_cst_tot.

for first pt_mstr
    where pt_mstr.pt_domain = global_domain and  pt_part = part
   no-lock:
end. /* FOR FIRST pt_mstr */

if available pt_mstr
then do:

   for first pld_det
       where pld_det.pld_domain = global_domain and  pld_prodline = pt_prod_line
      and pld_site       = to_site
      and pld_loc        = trans_id
      no-lock:
   end. /* FOR FIRST pld_det */

   if not available pld_det
   then
      for first pld_det
          where pld_det.pld_domain = global_domain and  pld_prodline =
          pt_prod_line
         and pld_site       = to_site
         and pld_loc        = ""
         no-lock:
      end. /* FOR FIRST pld_det */

   if available pld_det
   then
      assign
         dsdgitacct = pld_inv_acct
         dsdgitsub  = pld_inv_sub
         dsdgitcc   = pld_inv_cc.
   else do:
      for first pl_mstr
          where pl_mstr.pl_domain = global_domain and  pl_prod_line =
          pt_prod_line
         no-lock:
      end. /* FOR FIRST pl_mstr */

      if available pl_mstr
      then
         assign
            dsdgitacct = pl_inv_acct
            dsdgitsub  = pl_inv_sub
            dsdgitcc   = pl_inv_cc.
      else do:
         for first si_mstr
                where si_mstr.si_domain = global_domain and  si_site = to_site
                no-lock:
         end. /* FOR FIRST si_mstr */

         if available si_mstr
         and si_git_acct <> ""
         then
            assign
               dsdgitacct = si_git_acct
               dsdgitsub  = si_git_sub
               dsdgitcc   = si_git_cc.
         else do:
            if available gl_ctrl
            then
               assign
                  dsdgitacct = gl_inv_acct
                  dsdgitsub  = gl_inv_sub
                  dsdgitcc   = gl_inv_cc.
         end. /* ELSE DO */
      end. /* ELSE DO */
   end. /* ELSE DO */
end.  /* IF AVAILABLE pt_mstr */

if  from_site = to_site
and from_db   = to_db
then do:

   to_cost = from_cost.

   if icc_xclr_acct = ""
   then do:

      if available pt_mstr
      then do:
         {us/px/pxgetph.i ppprxr}
         if ({us/px/pxfunct.i &FUNCTION = 'IsValidProductLine' 
                              &PROGRAM = 'ppprxr.p'
                              &HANDLE = ph_ppprxr
                              &PARAM = "(pt_prod_line)"})
         then do:

            dftVendor = "".

            /* IF PO EXIST THEN GET VENDOR FROM THERE */
            if dsd_ponbr <> ""
            then do:
               for first po_mstr
                  where po_mstr.po_domain = global_domain and  po_nbr = dsd_ponbr
               no-lock:
                  dftVendor    = po_vend.
               end. /* FOR FIRST po_mstr */
            end. /* IF dss_po_nbr */

            for first vd_mstr
               where vd_mstr.vd_domain = global_domain and  vd_addr = dftVendor
            no-lock:
            end. /* FOR FIRST vd_mstr */

            /* GET PURCHASES EXPENSE ACCT FOR PRODUCT LINE */
            {us/bbi/gprun.i ""glactdft.p"" "(input  ""PO_PUR_ACCT"",
                                   input  pt_prod_line,
                                   input  to_site,
                                   input  if available vd_mstr
                                          then
                                             vd_type
                                          else
                                             """",
                                   input  """",
                                   input  no,
                                   output xfer_acct,
                                   output xfer_sub,
                                   output xfer_cc)"}
            assign
               intermediate_acct = xfer_acct
               intermediate_sub  = xfer_sub
               intermediate_cc   = xfer_cc.

         end. /* IF IsValidProductLine */
      end.
   end.  /* IF icc_xclr_acct = "" */
   else do:               /* USE NEW TRANSFER CLEARING ACCT */
      if available icc_ctrl
      then
         assign
            xfer_acct         = icc_xclr_acct
            xfer_sub          = icc_xclr_sub
            xfer_cc           = icc_xclr_cc
            intermediate_acct = icc_xclr_acct
            intermediate_sub  = icc_xclr_sub
            intermediate_cc   = icc_xclr_cc.
   end.  /* ELSE DO */
end.  /* IF from_site = to_site ... */
else do:

   /*IF THE ENTITIES ARE THE SAME,  USE THE CLEARING ACCT;   */
   /*IF THE ENTITIES ARE DIFFERENT, USE THE INTERCOMPANY ACCT*/
   if from_entity = to_entity
      and from_db = to_db
   then do:
      assign
         intermediate_acct = icc_xclr_acct
         intermediate_sub  = icc_xclr_sub
         intermediate_cc   = icc_xclr_cc
         trmsg             = 5232.  /* ISSUE SITE DIFFERS FROM RECEIVING SITE */
   end. /* IF from_entity = to_entity ...  */
   else do:
      {us/gl/glenacex.i &entity=to_entity
                  &type='"CR"'
                  &module='"IC"'
                  &acct=intermediate_acct
                  &sub=intermediate_sub
                  &cc=intermediate_cc }

      trmsg = 5242.
         /* ISSUE SITE ENTITY DIFFERS FROM RECEIVING SITE ENTITY */
   end. /* ELSE DO */
   if intermediate_acct = ""
   then
      assign
         intermediate_acct = dingbat_acct
         intermediate_sub  = dingbat_sub
         intermediate_cc   = dingbat_cc.
end.  /* ELSE DO */

/* CST-TR TRANSACTION CREATE trgl_det ENTRIES BY DEBITING EITHER  */
/* INVENTORY CLEARING ACCT (intermediate_acct = icc_xlcr_acct)    */
/* OR INTER COMPANY ACCT (intermediate_acct = icc_ico_acct) AND   */
/* CREDITING TRANSFER VARIANCE ACCT (xfer_acct = si_xfer_acct) OF */
/* THE RECEIVING/GIT SITE. THE FOLLOWING SECTION OF CODE IS       */
/* COMMENTED AS IT ASSIGNS xfer_acct = icc_xlcr_acct/icc_ico_acct */
/* WHEN GL COSTING METHOD IS AVERAGE CAUSING TO DEBIT AND CREDIT  */
/* THE SAME ACCOUNT (icc_xlcr_acct/ icc_ico_acct) WHILE CREATING  */
/* CST-TR TRANSACTION.                                            */

assign
   dr_acct = dsdgitacct
   dr_sub  = dsdgitsub
   dr_cc   = dsdgitcc.

for first si_mstr
    where si_mstr.si_domain = global_domain and  si_site = git_site
   no-lock:
end. /* FOR FIRST si_mstr */

/* GPINCR.P ROUTINE IS USED TO CREATE IN_MSTR RECORD */
{us/bbi/gprun.i ""gpincr.p""
         "(input  no,
           input  part,
           input  git_site,
           input  if available si_mstr
                  then
                     si_gl_set
                  else
                     """",
           input  if available si_mstr
                  then
                     si_cur_set
                  else
                     """",
           input  if available pt_mstr
                  then
                     pt_abc
                  else
                     """",
           input  if available pt_mstr
                  then
                     pt_avg_int
                  else
                     0,
           input  if available pt_mstr
                  then
                     pt_cyc_int
                  else
                     0,
           input  if available pt_mstr
                  then
                     pt_rctpo_status
                  else
                     """",
           input  if available pt_mstr
                  then
                     pt_rctpo_active
                  else
                     no,
           input  if available pt_mstr
                  then
                     pt_rctwo_status
                  else
                     """",
           input  if available pt_mstr
                  then
                     pt_rctwo_active
                  else
                     no,
           output inrecno)"}

for first in_mstr
   where recid(in_mstr) = inrecno
   no-lock:
end. /* FOR FIRST in_mstr */


for first ptp_det
    where ptp_det.ptp_domain = global_domain and  ptp_part = in_part
   and ptp_site   = in_site
   no-lock:
end. /* FOR FIRST ptp_det */

assign
   site     = to_site
   location = trans_id.

/*SECTION TO CALCULATE NEW AVERAGE COST*/
/*UPDATE CURRENT COST & POST ANY GL DISCREPANCY*/
if (glx_mthd = "AVG"
or  cur_mthd = "AVG"
or  cur_mthd = "LAST")
and from_site <> to_site
then do:

   /* CREATE FROM COSTS FROM DSDOISA (FROM DATABASE)     */
   for first sct_det
       where sct_det.sct_domain = global_domain and  sct_part = part
      and   sct_site = mfguser + "dsdoisaa.p"
      and   sct_sim  = sctsim
      exclusive-lock: 
   end.

   if not available sct_det
   then do:
      create sct_det. sct_det.sct_domain = global_domain.
      assign
         sct_site = mfguser + "dsdoisaa.p"
         sct_part = part
         sct_sim  = sctsim.

      if recid(sct_det) = -1 then .

   end. /* IF NOT AVAILABLE sct_det */

   assign
      sct_bdn_ll = sctbdn_ll
      sct_bdn_tl = sctbdn_tl
      sct_lbr_ll = sctlbr_ll
      sct_lbr_tl = sctlbr_tl
      sct_mtl_ll = sctmtl_ll
      sct_mtl_tl = sctmtl_tl
      sct_ovh_ll = sctovh_ll
      sct_ovh_tl = sctovh_tl
      sct_sub_ll = sctsub_ll
      sct_sub_tl = sctsub_tl
      sct_recno  = recid(sct_det).
      
   if use-log-acctg then do:
   /* ADDED 8th INPUT PARAMETER AS RECEIVING */
   /* SITES CONSIGNMENT INVENTORY USAGE      */
   
   /* UPDATE CURRENT COST & GL DISCREPANCY FOR AVG COST */
   {us/bbi/gprun.i ""cslavg02.p""
            "(input part,
              input  to_site,
              input  ""ISS-TR"",
              input  0,
              input  sct_recno,
              input  req-nbr,
              input  trqty,
              input  0,
              input  from_cost,
              input  glx_set,
              input  glx_mthd,
              input  cur_set,
              input  cur_mthd,
              output newmtl_tl,
              output newlbr_tl,
              output newbdn_tl,
              output newovh_tl,
              output newsub_tl,
              output newmtl_ll,
              output newlbr_ll,
              output newbdn_ll,
              output newovh_ll,
              output newsub_ll,
              output newcst,
              output reavg_yn,
              output msgref)"}
   end. /* if use-log-acctg then */
   else do:
       {us/bbi/gprun.i ""csavg02.p""
            "(input part,
              input  to_site,
              input  ""ISS-TR"",
              input  0,
              input  sct_recno,
              input  req-nbr,
              input  trqty,
              input  0,
              input  from_cost,
              input  glx_set,
              input  glx_mthd,
              input  cur_set,
              input  cur_mthd,
              output newmtl_tl,
              output newlbr_tl,
              output newbdn_tl,
              output newovh_tl,
              output newsub_tl,
              output newmtl_ll,
              output newlbr_ll,
              output newbdn_ll,
              output newovh_ll,
              output newsub_ll,
              output newcst,
              output reavg_yn,
              output msgref)"}
   end.
   
   for first sct_det
      exclusive-lock
      where recid(sct_det) = sct_recno:   
      delete sct_det.
   end.
end.  /* IF AVG OR LAST */

if use-log-acctg then do:

   /* CALCULATE NEW AVERAGE COST */
   if  (glx_mthd = "AVG"
   or cur_mthd = "AVG")
   and reavg_yn
   then do:
      {us/gp/gpsct01.i &set=glx_set &part=part &site=to_site}

      /* ADDED 3rd INPUT PARAMETER AS RECEIVING */
      /* SITES CONSIGNMENT INVENTORY USAGE      */

      for first dss_mstr
         where recid(dss_mstr) = dss_recno
      no-lock: 
         for first ds_det
            where ds_domain    = dss_domain
            and   ds_shipsite  = from_site
            and   ds_req_nbr   = req-nbr
            and   ds_site      = git_site
         no-lock:
         end. /* FOR FIRST ds_det */
      end. /* FOR FIRST dss_mstr */
      if v_shipnbr <>  "" then  vcInternalRef = v_shipnbr.
      else  vcInternalRef = dss_nbr.
     
      {us/bbi/gprun.i ""cslavg03.p""
            "(input recid(sct_det),
              input trqty,
              input 0,
              input newmtl_tl,
              input newlbr_tl,
              input newbdn_tl,
              input newovh_tl,
              input newsub_tl,
              input newmtl_ll,
              input newlbr_ll,
              input newbdn_ll,
              input newovh_ll,
              input newsub_ll,
              input vcInternalRef,
              input from_site,
              input oid_dss_mstr,
              input oid_ds_det,
              input  'DO',
              input glx_set,
              input glx_mthd,
              input cur_set,
              input cur_mthd,
              input part,
              input to_site)"}
   end. /* if  (glx_mthd = "AVG" */

end.  /* LOGISTICS ACCOUNTING ENABLED */
else do: /* LOGISTICS ACCOUNTING NOT ENABLED */

   if glx_mthd = "AVG" and reavg_yn  then do:

        {us/gp/gpsct01.i &set=glx_set &part=part &site=to_site}

        {us/bbi/gprun.i ""csavg03.p""
            "(input recid(sct_det),
              input trqty,
              input 0,
              input newmtl_tl,
              input newlbr_tl,
              input newbdn_tl,
              input newovh_tl,
              input newsub_tl,
              input newmtl_ll,
              input newlbr_ll,
              input newbdn_ll,
              input newovh_ll,
              input newsub_ll)"}
   end. /* IF glx_mthd = "AVG" and reavg_yn */

end.  /* LOGISTICS ACCOUNTING NOT ENABLED */

/* THE trgl_det AND tr_hist RECORDS CREATED BY us/ic/ictrans.i SHOULD         */
/* USE RE-AVERAGED UNIT COST AT THE RECEIVING SITE INSTEAD OF           */
/* SUPPLY SITE COST.                                                    */

if glx_mthd = "AVG"
then do:
   if not reavg_yn
   then do:
      /* GET TOTAL GL COST */
      {us/gp/gpsct06.i &part=part &site=to_site &type=""GL"" }
   end. /* IF NOT reavg_yn */
   to_cost = sct_cst_tot.
/*   to_cost = newcst.  This was the old value*/
end. /* IF glx_mthd = "AVG" */

/*TRANSFER CLEARING --> TRANSFER VARIANCE*/
/* CST-TR TRANSACTIONS ARE CREATED IMMATERIAL OF COSTING METHOD */
if from_site <> to_site
then do:

   /* ROUND TO BASE CURRENCY PRECISION */
   gl_tmp_amt   = (from_cost * trqty).

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
             "(input-output gl_tmp_amt,
               input        gl_rnd_mthd,
               output       mc-error-number)"}

   if mc-error-number <> 0
   then do:
      {us/bbi/pxmsg.i &MSGNUM = mc-error-number &ERRORLEVEL = 3}
   end. /* IF mc-error-number <> 0 */

   /* CONVERT BASE AMOUNT TO MANAGEMENT CURRENCY AMOUNT */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                 "(input  base_curr,
                   input  mgmt_curr,
                   input  l_mgmt_curr_ex_rate1,
                   input  l_mgmt_curr_ex_rate2,
                   input  gl_tmp_amt,
                   input  true, /* DO ROUND */
                   output mgmt_amt,
                   output mc-error-number)"}
   if mc-error-number <> 0
      then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end. /* IF mc-error-number <> 0 */

{us/px/pxrun.i &PROC  = 'createTrglDetRecord'
    &PROGRAM='ictrxr.p'
    &handle = ph_ictrxr
    &PARAM = "(input 10000000000,
               input ""CST-TR"",
               input xfer_acct,
               input xfer_sub,
               input xfer_cc,
               input project,
               input intermediate_acct,
               input intermediate_sub,
               input intermediate_cc,
               input project,
               input gl_tmp_amt,

               input yes, /*create glt_det */
               input ""CST-TR"",
               input nbr, /* order #*/
               input to_entity, /* entity */
               input eff_date, /* effective date */
               input icc_gl_sum, /* summarize */
               input icc_mirror, /* audit */
               input ?, /* recid(tr_hist) */
               input pIntercoRef, /* inter company ref# */
               input mgmt_curr, /* currency */
               input l_mgmt_curr_ex_rate1,    /* exchange rate */
               input l_mgmt_curr_ex_rate2,    /* exchange rate 2 */
               input mgmt_rate_type, /* exchange rate type */
               input mgmt_amt,    /* currency amount */
               input-output ref,

               output oidTrglDet
               )"
          &NOAPPERROR=true
          &CATCHERROR=true}
    for first trgl_det no-lock where
       trgl_det.oid_trgl_det = oidTrglDet:
       assign trgl_recno = recid(trgl_det).            
    end.


end.  /* IF NOT AVG */

new_ld = no.
for first ld_det
    where ld_det.ld_domain = global_domain and  ld_site = site
   and   ld_loc  = location
   and   ld_part = part
   and   ld_lot  = lotserial
   and   ld_ref  = lotref
   exclusive-lock:
end.

if not available ld_det
or (available ld_det
and ld_qty_oh = 0)
then
   new_ld = yes.

if new_ld
and from_ld_exists
then do:

   if not available ld_det
   then do:

      create ld_det. ld_det.ld_domain = global_domain.
      assign
         ld_site = site
         ld_loc  = location
         ld_part = part
         ld_lot  = lotserial
         ld_ref  = lotref.

      if recid(ld_det) = -1 then .

   end. /* IF NOT AVAILABLE ld_det */

   assign
      ld_expire = ldexpire
      ld_grade  = ldgrade
      ld_assay  = ldassay.

   for first loc_mstr
       where loc_mstr.loc_domain = global_domain and  loc_site = site
      and   loc_loc  = location
   no-lock:
   end. /* FOR FIRST loc_mstr */

   if available loc_mstr
   then
      ld_status = loc_status.
   else do:
      {us/gp/gpextget.i &OWNER      = 'DM'
                  &TABLENAME  = 'drp_ctrl'
                  &REFERENCE  = 'DRP_Status'
                  &KEY1       = global_domain
                  &CHAR1      = ld_status}
   end. /* ELSE DO */
end. /* IF new_ld AND from_ld_exists */

if glx_mthd = "AVG"
then do:
from_cost = newmtl_tl + newlbr_tl + newbdn_tl + newovh_tl + newsub_tl +
            newmtl_ll + newlbr_ll + newbdn_ll + newovh_ll + newsub_ll.
{us/ic/ictrans.i
   &addrid=from_site
   &bdnstd=0
   &cracct=xfer_acct
   &crsub=xfer_sub
   &crcc=xfer_cc
   &crproj=project
   &curr=from_curr
   &dracct=dr_acct
   &drsub=dr_sub
   &drcc=dr_cc
   &drproj=project
   &effdate=eff_date
   &exrate=exch_rate
   &exrate2=exch_rate2
   &exratetype=exch_ratetype
   &exruseq=exch_exru_seq
   &glamt="(from_cost) * trqty"
   &lbrstd=0
   &line=0
   &location=trans_id
   &lotnumber=req-nbr
   &lotref=lotref
   &lotserial=lotserial
   &mtlstd=0
   &ordernbr=nbr
   &ovhstd=0
   &part=part
   &perfdate=?
   &price = from_cost
   &quantityreq="dsdqtyord - dsdqtyrcvd - dsdtransit"
   &quantityshort="if cancel_bo
                   then
                      0
                   else
                      (dsdqtyord - dsdqtyrcvd - dsdtransit - trqty)"
   &quantity=trqty
   &revision=""""
   &rmks=""""
   &shiptype=""""
   &site=to_site
   &slspsn1=""""
   &slspsn2=""""
   &sojob=""""
   &substd=0
   &transtype=""RCT-GIT""
   &msg=0
   &ref_site=from_site
   &shipnbr=v_shipnbr
   &shipdate=v_shipdate
   &invmov=v_invmov
   &mgmt_curr=""""
   &mgmt_curr_amt=0
   &mgmt_curr_ex_rate=0
   &mgmt_curr_ex_rate2=0
   &mgmt_curr_ex_ratetype=""""}


assign tr_price   = from_cost.
end.
else do:
   /* CREATE INVENTORY TRANSACTION RECORD */
   {us/ic/ictrans.i
      &addrid=from_site
      &bdnstd=0
      &cracct=xfer_acct
      &crsub=xfer_sub
      &crcc=xfer_cc
      &crproj=project
      &curr=from_curr
      &dracct=dr_acct
      &drsub=dr_sub
      &drcc=dr_cc
      &drproj=project
      &effdate=eff_date
      &exrate=exch_rate
      &exrate2=exch_rate2
      &exratetype=exch_ratetype
      &exruseq=exch_exru_seq
      &glamt="to_cost * trqty"
      &lbrstd=0
      &line=0
      &location=trans_id
      &lotnumber=req-nbr
      &lotref=lotref
      &lotserial=lotserial
      &mtlstd=0
      &ordernbr=nbr
      &ovhstd=0
      &part=part
      &perfdate=?
      &price= from_cost /* to_cost old value */
      &quantityreq="dsdqtyord - dsdqtyrcvd - dsdtransit"
      &quantityshort="if cancel_bo
                      then
                         0
                      else
                         (dsdqtyord - dsdqtyrcvd - dsdtransit - trqty)"
      &quantity=trqty
      &revision=""""
      &rmks=""""
      &shiptype=""""
      &site=to_site
      &slspsn1=""""
      &slspsn2=""""
      &sojob=""""
      &substd=0
      &transtype=""RCT-GIT""
      &msg=0
      &ref_site=from_site
      &shipnbr=v_shipnbr
      &shipdate=v_shipdate
      &invmov=v_invmov
   &mgmt_curr=""""
   &mgmt_curr_amt=0
   &mgmt_curr_ex_rate=0
   &mgmt_curr_ex_rate2=0
   &mgmt_curr_ex_ratetype=""""}

end. /* IF trqty <> 0 */

if glx_mthd    = "AVG"
and from_site <> to_site and available trgl_det
then
   trgl_type = "RCT-AVG".

if trgl_recno <> ?
   and available tr_hist
then do:
   for each trgl_det
      exclusive-lock
       where trgl_det.trgl_domain = global_domain 
         and  trgl_trnbr = 10000000000 + int64(trgl_recno):

      trgl_trnbr = tr_trnbr.

      for first glt_det
          where glt_det.glt_domain = global_domain and  glt_ref = trgl_gl_ref
         and glt_rflag = false
         and glt_line = trgl_dr_line
         exclusive-lock:
         glt_doc = string(tr_trnbr).
      end.

      for first glt_det
          where glt_det.glt_domain = global_domain and  glt_ref = trgl_gl_ref
         and glt_rflag = false
         and glt_line = trgl_cr_line
         exclusive-lock:
        glt_doc = string(tr_trnbr).
     end.
   end.  /* FOR EACH trgl_det */
end. /* IF trgl_recno <> ? */

if use-log-acctg and glx_mthd = "AVG" 
then do:
   for first dss_mstr 
      where recid(dss_mstr) = dss_recno
   no-lock: 
   end. /* FOR FIRST dss_mstr */
   if avail dss_mstr 
   then
      for first ds_det 
         where ds_domain    = dss_domain
         and   ds_shipsite  = from_site
         and   ds_req_nbr   = req-nbr
         and   ds_site      = git_site
      no-lock:
      end. /* FOR FIRST ds_det */
      if avail ds_det
      then
      for first ft_mstr 
         where ft_domain = dss_domain
         and   ft_terms  = dss_fr_terms
      no-lock:
      if ft_accrual_level = {&LEVEL_Line}
      or ft_accrual_level = {&LEVEL_Shipment}
      then do:

          if v_shipnbr = "" then vcDssNbr = dss_nbr.
          else vcDssNbr = v_shipnbr.

          if v_shipnbr  = "" then  do:
               for first tt-frcalc where tt_order = ds_nbr
                  and tt_lc_charge = ft_lc_charge
                  and tt_order_line = ds_line
                  and tt_shipfrom = ds_shipsite
                  exclusive-lock:
               end.
          end.
          else do:

             for first tt-frcalc where (tt_order =  v_shipnbr or tt_order = ds_nbr)
               and tt_shipfrom = ds_shipsite
               and tt_order_line = ds_line
               and tt_lc_charge = ft_lc_charge
               and tt_dss_nbr  = dss_nbr
               and tt_req_nbr = ds_req_nbr
             exclusive-lock:
             end.
          end.

          if available tt-frcalc then
          do:
            /* if qty was -ve - we need to find the price from last rcpt */
         for last tr_hist where tr_domain = global_domain and
            tr_hist.tr_ship_id = v_shipnbr and
            tr_hist.tr_nbr = dss_nbr and
            tr_hist.tr_part = ds_part and
            tr_hist.tr_type = "RCT-GIT" no-lock: 
         end.
         if available tr_hist and tr_hist.tr_qty_loc < 0 then do:

               tt_order = ds_nbr.
               for last btr_hist where
                  btr_hist.tr_domain = global_domain and
                  btr_hist.tr_type = "RCT-GIT" and
                  btr_hist.tr_par = ds_part and
                  btr_hist.tr_nbr = dss_nbr and btr_hist.tr_qty_loc  > 0
                  no-lock:
               end.
               if available btr_hist then do:
                  vTotNegQty  = 0.
                  for each b1tr_hist where
                         b1tr_hist.tr_domain = global_domain
                     and b1tr_hist.tr_ship_id = btr_hist.tr_ship_id
                     and b1tr_hist.tr_part = ds_part
                     and b1tr_hist.tr_qty_loc  > 0 no-lock :
                  vTotNegQty = vTotNegQty + b1tr_hist.tr_qty_loc.
                  end.
               for first lacd_det where
                    lacd_domain = global_domain and
                    lacd_internal_ref = btr_hist.tr_ship_id and
                    lacd_shipfrom = ds_shipsite and
                    lacd_lc_charge = ft_lc_charge and
                    lacd_internal_ref_type    = "06" no-lock:
               end.
               if available lacd_det then
               for first lacod_det where
                    lacod_det.oid_lacd_det   = lacd_det.oid_lacd_det and
                    lacod_det.oid_order_line = oid_ds_det
                  no-lock:
               end.
               if available lacod_det then
                  vctt_amt =  lacod_lc_amt / vtotnegqty * tr_hist.tr_qty_loc.
               end.
            end. /* trqty < 0 */
            else
             vctt_amt = tt_amt *
               (tt-frcalc.tt_ex_rate2 / tt-frcalc.tt_ex_rate).

             if tt-frcalc.tt_part <> "" then
             for first pt_mstr where pt_domain = global_domain and
                              pt_part = tt-frcalc.tt_part
             no-lock:
                vcProdLine = pt_prod_line.
             end.

             /* GET CUSTOMER TYPE */
             for first cm_mstr where cm_domain = global_domain and
                       cm_addr = tt-frcalc.tt_shipto
             no-lock:
                vcCmType = cm_type.
             end.

             {us/bbi/gprun.i ""laglacct.p""
                      "(input '{&TYPE_DO}',
                        input ""EXPENSE"",
                        input tt-frcalc.tt_lc_charge,
                        input vcProdLine,
                        input tt-frcalc.tt_shipfrom,
                        input vcCmType,
                        input tt-frcalc.tt_channel,
                        output vcExpAcct,
                        output vcExpSub,
                        output vcExpCc)"}


             assign vcLogCreation = true.
            /* IF MULTIENTRY*/
            assign gl_tmp_amt    = vctt_Amt.
            if tr_hist.tr_qty_loc > 0 then do:
               if trqty <> ds_qty_chg then
               assign
                  gl_tmp_amt = ((vctt_amt / ds_qty_chg) * trqty)  .
               else
                  assign gl_tmp_amt    = vctt_Amt.
            end.
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                            "(input-output gl_tmp_amt,
                            input        gl_rnd_mthd,
                            output       mc-error-number)"}

            if mc-error-number <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM = mc-error-number &ERRORLEVEL = 3}
            end. /* IF mc-error-number <> 0 */

            /* CONVERT BASE AMOUNT TO MANAGEMENT CURRENCY AMOUNT */
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                          "(input  base_curr,
                            input  mgmt_curr,
                            input  l_mgmt_curr_ex_rate1,
                            input  l_mgmt_curr_ex_rate2,
                            input  gl_tmp_amt,
                            input  true, /* DO ROUND */
                            output mgmt_amt,
                            output mc-error-number)"}
            if mc-error-number <> 0
               then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end. /* IF mc-error-number <> 0 */

    {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
    &PROGRAM='ictrxr.p'
    &handle = ph_ictrxr
    &PARAM = "(input 100000000,
               input ""CST-TR"",
               input xfer_acct,
               input xfer_sub,
               input xfer_cc,
               input project,
               input vcExpAcct,
               input vcExpSub,
               input vcExpCc,
               input project,
               input gl_tmp_amt,

               input yes, /*create glt_det */
               input ""CST-TR"",
               input nbr, /* order #*/
               input to_entity, /* entity */
               input eff_date, /* effective date */
               input icc_gl_sum, /* summarize */
               input icc_mirror, /* audit */
               input ?, /* recid(tr_hist) */
               input pIntercoRef, /* inter company ref# */
               input mgmt_curr, /* currency */
               input l_mgmt_curr_ex_rate1,    /* exchange rate */
               input l_mgmt_curr_ex_rate2,    /* exchange rate 2 */
               input mgmt_rate_type, /* exchange rate type */
               input mgmt_amt,    /* currency amount */
               input-output ref,

               output oidTrglDet
               )"
          &NOAPPERROR=true
          &CATCHERROR=true}
    for first trgl_det no-lock where
       trgl_det.oid_trgl_det = oidTrglDet:
    end.
    if available trgl_det then
       assign trgl_recno = recid(trgl_det).

                  vcFreightDesc = caps(getTermLabel("FREIGHT_ACCRUAL",15)) + " "
                                + tt-frcalc.tt_order.

                   vctt_Amt = gl_tmp_amt  .
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                            "(input-output vcTt_amt,
                             input        gl_rnd_mthd,
                             output       mc-error-number)"}

                  if mc-error-number <> 0
                  then do:
                     {us/bbi/pxmsg.i &MSGNUM = mc-error-number &ERRORLEVEL = 3}
                  end. /* IF mc-error-number <> 0 */

                  /* CREATE trgl_det AND glt_det RECORDS ON INVENTORY DOMAIN */
                  {us/bbi/gprun.i ""lafrtrgl.p""
                           "(input 10000000000 + int64(trgl_recno),
                             input dr_acct,
                             input dr_sub,
                             input dr_cc,
                             input project,
                             input xfer_acct,
                             input xfer_sub,
                             input xfer_cc,
                             input """",
                             input ""RCT-AVG"",
                             input vcTt_amt,
                             input vcFreightDesc,
                             input eff_date,
                             input to_entity,
                             input base_curr,
                             input 1,
                             input 1,
                             input '')"}
         end. /*if avail tt-frcalc */
      end.   /* if ft_accrual_level */
   end.   /* for first ft_mstr */
   if glx_mthd    = "AVG" and from_site <> to_site
   then
      if vcLogCreation and trgl_recno <> ?
      then do:
         for each trgl_det  exclusive-lock
             where trgl_det.trgl_domain = global_domain
             and trgl_trnbr = 10000000000 + int64(trgl_recno):

            trgl_trnbr = tr_trnbr.

            for first glt_det
               where glt_det.glt_domain = global_domain
               and  glt_ref = trgl_gl_ref
               and glt_rflag = false
               and glt_line = trgl_dr_line
               exclusive-lock:
            end.  
            if available glt_det
            then
               glt_doc = string(tr_trnbr).

            for first glt_det
               where glt_det.glt_domain = global_domain
               and  glt_ref = trgl_gl_ref
               and glt_rflag = false
               and glt_line = trgl_cr_line
               exclusive-lock:
            end.

            if available glt_det
            then
               glt_doc = string(tr_trnbr).
         end.  /* FOR EACH trgl_det */
      end. /* IF trgl_recno <> ? */
end.  /* if use-log-acctg */

/* UPDATE SUPPLIER CONSIGNMENT QUANTITIES */
if available pt_mstr and consigned_qty <> 0 then do:
   procid = "update".
   {us/gp/gprunmo.i &program = "pocnin.p" &module = "ACN"
              &param = """(input procid,
                           input site,
                           input part,
                           input consigned_qty,
                           output dummy_qty)"""}

   {us/gp/gprunmo.i &program = "pocnld.p" &module = "ACN"
              &param = """(input procid,
                           input site,
                           input part,
                           input location,
                           input lotserial,
                           input lotref,
                           input consigned_qty,
                           output dummy_qty)"""}
end.  /* if available pt_mstr and consigned_qty <> 0 */
