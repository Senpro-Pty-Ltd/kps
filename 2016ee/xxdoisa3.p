/* xxdoisa3.p - DISTRIBUTION ORDER ISSUE SUBROUTINE                           */
/* dsdoisa3.p - DISTRIBUTION ORDER ISSUE SUBROUTINE                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdoisa3.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 10/06/94  BY: pxd *FR90*                 */
/* REVISION: 7.3      LAST MODIFIED: 10/06/94  BY: ais *FR66*                 */
/* REVISION: 7.3      LAST MODIFIED: 10/10/94  BY: pxd *FR07*                 */
/* REVISION: 7.3      LAST MODIFIED: 10/19/94  BY: qzl *FS60*                 */
/* REVISION: 7.2      LAST MODIFIED: 01/23/95  BY: ais *F0G0*                 */
/* REVISION: 7.2      LAST MODIFIED: 03/29/95  BY: dzn *F0PN*                 */
/* REVISION: 7.2      LAST MODIFIED: 05/30/95  BY: emb *F0SD*                 */
/* REVISION: 7.3      LAST MODIFIED: 07/03/95  BY: emb *F0T4*                 */
/* REVISION: 8.5      LAST MODIFIED: 09/21/95  BY: sxb *J053*                 */
/* REVISION: 7.2      LAST MODIFIED: 11/17/95  BY: qzl *F0W7*                 */
/* REVISION: 8.5      LAST MODIFIED: 12/26/96  BY: *H0NH* Julie Milligan      */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97  BY: *K04X* Steve Goeke         */
/* REVISION: 8.6      LAST MODIFIED: 03/05/97  BY: *H0S5* Julie Milligan      */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98  BY: *L007* Annasaheb Rahane    */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98  BY: *L00Y* Jeff Wootton        */
/* REVISION: 8.6E     LAST MODIFIED: 06/01/98  BY: *L01D* Brenda Milton       */
/* REVISION: 8.6E     LAST MODIFIED: 10/06/98  BY: *J316* G.Latha             */
/* REVISION: 8.6E     LAST MODIFIED: 02/27/99  BY: *J3B5* G.Latha             */
/* REVISION: 9.1      LAST MODIFIED: 05/07/99  BY: *J3D2* G.Latha             */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99  BY: *N014* Vijaya Pakala       */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00  BY: *N0KK* Jacolyn Neder       */
/* REVISION: 9.1      LAST MODIFIED: 09/07/00  BY: *N0MX* Jean Miller         */
/* REVISION: 9.1      LAST MODIFIED: 11/06/00  BY: *N0TN* Jean Miller         */
/* REVISION: 9.1      LAST MODIFIED: 08/04/00  BY: *N0W6* BalbeerS Rajput     */
/* Revision: 1.13.1.9      BY: Vivek Gogte        DATE: 03/29/01  ECO: *M10G* */
/* Revision: 1.13.1.10     BY: Samir Bavkar       DATE: 07/31/01  ECO: *P009* */
/* Revision: 1.13.1.11     BY: Steve Nugent       DATE: 10/15/01  ECO: *P004* */
/* Revision: 1.13.1.12     BY: Sathish Kumar      DATE: 10/28/01  ECO: *M1NV* */
/* Revision: 1.13.1.13     BY: Ellen Borden       DATE: 06/07/01  ECO: *P00G* */
/* Revision: 1.13.1.16     BY: Ellen Borden       DATE: 04/15/02  ECO: *P05S* */
/* Revision: 1.13.1.17     BY: Jeff Wootton       DATE: 05/14/02  ECO: *P03G* */
/* Revision: 1.13.1.21     BY: Patrick Rowan      DATE: 05/24/02  ECO: *P018* */
/* Revision: 1.13.1.23     BY: Robin McCarthy     DATE: 06/12/02  ECO: *P042* */
/* Revision: 1.13.1.24     BY: Vandna Rohira      DATE: 06/05/02  ECO: *M1Z8* */
/* Revision: 1.13.1.25     BY: Patrick Rowan      DATE: 06/27/02  ECO: *P091* */
/* Revision: 1.13.1.28     BY: Robin McCarthy     DATE: 07/03/02  ECO: *P08Q* */
/* Revision: 1.13.1.29     BY: Robin McCarthy     DATE: 07/15/02  ECO: *P0BJ* */
/* Revision: 1.13.1.30     BY: Samir Bavkar       DATE: 08/18/02  ECO: *P0FS* */
/* Revision: 1.13.1.32     BY: Paul Donnelly (SB) DATE: 06/26/03  ECO: *Q00B* */
/* Revision: 1.13.1.33     BY: Rajinder Kamra     DATE: 05/05/03  ECO: *Q003* */
/* Revision: 1.13.1.36     BY: Saurabh Chaturvedi DATE: 10/13/03  ECO: *P163* */
/* Revision: 1.13.1.37     BY: Ashwini Ghaisas    DATE: 01/23/04  ECO: *Q05F* */
/* Revision: 1.13.1.38     BY: Jean Miller        DATE: 02/07/04  ECO: *Q04Y* */
/* Revision: 1.13.1.39     BY: Vandna Rohira      DATE: 04/19/04  ECO: *Q073* */
/* Revision: 1.13.1.40     BY: Shoma Salgaonkar   DATE: 08/25/04  ECO: *Q0CJ* */
/* Revision: 1.13.1.41     BY: Ed van de Gevel    DATE: 03/07/05  ECO: *R00K* */
/* Revision: 1.13.1.42     BY: Tejasvi Kulkarni   DATE: 05/02/05  ECO: *P3JX* */
/* Revision: 1.13.1.43     BY: Steve Nugent       DATE: 05/12/05  ECO: *P3KV* */
/* Revision: 1.13.1.45     BY: Priya Idnani       DATE: 09/28/05  ECO: *Q0LY* */
/* Revision: 1.13.1.46     BY: Jean Miller        DATE: 01/10/06  ECO: *Q0PD*  */
/* Revision: 1.13.1.47     BY: Shilpa Kamath      DATE: 04/09/06  ECO: *R03V* */
/* Revision: 1.13.1.48     BY: Anil Sudhakaran    DATE: 01/17/07  ECO: *R0C6* */
/* Revision: 1.13.1.49     BY: Ruma Bibra         DATE: 03/18/08  ECO: *P6NY* */
/* Revision: 1.13.1.50     BY: Rajalaxmi Ganji    DATE: 04/22/08  ECO: *P6Q7* */
/* Revision: 1.13.1.51     BY: Sandeep Panchal    DATE: 06/16/08  ECO: *P6SR* */
/* Revision: 1.13.1.52     BY: Sandeep Panchal    DATE: 08/22/08  ECO: *P6ZP* */
/* Revision: 1.13.1.53     BY: Ambrose Almeida    DATE: 07/10/09  ECO: *Q322* */
/* Revision: 1.13.1.54   BY: Xiaolei Meng        DATE: 05/26/10  ECO: *R22Q* */
/* Revision: 1.10.2.21 $  BY: Huaping Luo        DATE: 03/16/10 ECO: *R21W*  */
/* CYB    LAST MODIFIED: 02-JUN-2010    BY:  gbg *cy1005*                    */
/* CYB    LAST MODIFIED: 27-JUL-2012    BY:  gbg *c1317*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 08-FEB-2013    BY:  gbg *c1362*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i}   /* EXTERNAL LABEL INCLUDE */
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/px/pxmaint.i}
{us/px/pxphdef.i ictrxr}
 
 
define input parameter i_abs_recid    as   recid       no-undo.
define input parameter pIntercoRef    like glt_interco_ref no-undo.
define input parameter p_site         as   character       no-undo.
 
/*cy1005*  define shared variable site like sr_site no-undo. */
/*cy1005*/ define shared variable site as char label "Site" no-undo.

define shared variable location like sr_loc no-undo.
define shared variable lotserial like sr_lotser no-undo.
define shared variable lotref like sr_ref no-undo.
define shared variable trqty like tr_qty_chg.
define shared variable gl_amt like glt_amt.
define shared variable transtype as character format "x(7)".
define shared variable eff_date like tr_date.
define shared variable glcost like sct_cst_tot.
define shared variable rec_site like dss_rec_site.
define shared variable intermediate_acct like trgl_dr_acct.
define shared variable intermediate_sub like trgl_dr_sub.
define shared variable intermediate_cc like trgl_dr_cc.
define shared variable undo-input like mfc_logical.
define shared variable ds_recno as recid.
define shared variable dss_recno as recid.
define shared variable sct_recno as recid.
define shared variable open_ref like mrp_qty.
define shared variable cancel_bo as logical no-undo.
define shared variable this_qty_ship like ds_qty_ship no-undo.
define shared variable this_qty_det_all like ds_qty_all no-undo.
 
define variable assay like tr_assay no-undo.
define variable grade like tr_grade no-undo.
define variable expire like tr_expire no-undo.
define variable original_db as character no-undo.
define variable err-flag as integer no-undo.
define variable ref like glt_ref no-undo.
define variable ldexpire like ld_expire no-undo.
define variable ldgrade  like ld_grade no-undo.
define variable ldassay  like ld_assay no-undo.
define variable ldstatus like ld_status no-undo.
define variable from_ld_exists like mfc_logical no-undo.
define variable dblcol as character initial "::" no-undo.
define variable gl_tmp_amt as decimal no-undo.
define variable v_shipnbr  like tr_ship_id      no-undo.
define variable v_shipdate like tr_ship_date    no-undo.
define variable v_invmov   like tr_ship_inv_mov no-undo.
define variable mc-error-number like msg_nbr no-undo.
define variable l_prev_ds_status like ds_status no-undo.
define variable l_prev_ds_qty like ds_qty_conf no-undo.
define variable using_shipment_perf like mfc_logical no-undo.
define variable iss_trnbr like tr_trnbr no-undo.
define variable rct_trnbr like tr_trnbr no-undo.
define variable consigned_qty like sr_qty no-undo.
define variable use-log-acctg as logical no-undo.
define variable l_pt_loc  as  character no-undo.
define variable o_negflg as  logical no-undo.
 
define variable vcDssNbr as character no-undo.
define new shared temp-table t_shp_hist
   field t_domain   like shp_domain
   field t_shipfrom like shp_shipfrom
   field t_nbr      like shp_nbr
   field t_doreq    like shp_do_req
   field t_part     like shp_part.
 
/* trgl_det account variables */
{us/ic/icglacct.i}
 
/* CONSIGNMENT INVENTORY VARIABLES */
{us/po/pocnvars.i}
define variable xfer_without_ownership_change as logical initial false no-undo.
 
define new shared variable impexp      like mfc_logical no-undo.
define            variable imp-okay    as   logical     no-undo.
define            variable impexp_edit like mfc_logical no-undo.
define            variable upd_okay    like mfc_logical no-undo.
define variable l_alt_um like ld_alt_um no-undo.

define buffer dsdet for ds_det.
 
/* DETERMINE IF SUPPLIER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
         "(input ENABLE_SUPPLIER_CONSIGNMENT,
           input 11,
           input ADG,
           input SUPPLIER_CONSIGN_CTRL_TABLE,
           output using_supplier_consignment)"}
 
{us/la/lafrttmp.i}   /* LOGISTICS ACCOUNTING FREIGHT TEMP-TABLE */
 
/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}
 
for first gl_ctrl where gl_domain = global_domain no-lock: end.
for first ds_det no-lock where recid(ds_det) = ds_recno: end.
for first icc_ctrl  where icc_domain = global_domain no-lock: end.
for first dss_mstr no-lock where recid(dss_mstr) = dss_recno: end.
 
l_prev_ds_status = ds_status.
run get_ds_open_qty (buffer ds_det,
                     output l_prev_ds_qty).
 
/* GET ASSOCIATED SHIPPER */
find abs_mstr no-lock where recid(abs_mstr) = i_abs_recid no-error.
if available abs_mstr then
   assign
      v_shipnbr  = substring(abs_id, 2)
      v_shipdate = abs_shp_date
      v_invmov   = abs_inv_mov.
else
   assign
      v_shipnbr  = ""
      v_shipdate = ?
      v_invmov   = "".
 
empty temp-table t_shp_hist.
 
sr_wkfl-loop:
for each sr_wkfl exclusive-lock
   where sr_domain = global_domain
     and sr_userid = SessionUniqueID
     and sr_lineid = ds_part + dblcol + ds_req_nbr + dblcol + ds_shipsite
by sr_userid by sr_lineid
 
   /* Make an attempt to issue the items in the order specified
   * in the icc_ctrl file (works well for location or lot either
   * ascending or descending because sr_wkfl contains the location
   * and lot/serial fields). For expiration date or creation date
   * we need to rely on the hopeful expectation that lad_det record
   * allocations were created in the proper sequence and that sr_wkfl
   * records were created from lad_det records read in the proper
   * order, ie., use the recid sequence of sr_wkfl.  This will not
   * work if all allocations were not created at the same time or
   * were not created using the automatic pick logic routines. */
 
   by sr_site
   by (if icc_pk_ord = 1 and icc_ascend then sr_loc
   else if icc_pk_ord = 2 and icc_ascend then sr_lotser
   else sr_site)
   by (if icc_pk_ord = 1 and not icc_ascend then sr_loc
   else if icc_pk_ord = 2 and not icc_ascend then sr_lot
   else sr_userid) descending
   by recid(sr_wkfl):
 
   assign
      site = sr_site
      location = sr_loc
      lotserial = sr_lotser
      lotref = sr_ref
      trqty = sr_qty.
 
   /* ITEMS THAT ARE NOT ISSUED FROM THE DO SITE, MUST BE FIRST
      TRANSFERRED TO THE DO SITE BEFORE THEY CAN BE ISSUED TO THE
      DISTRIBUTION ORDER */
   assign
      glxcst = 0
      gl_amt = 0
      global_part = ds_part
      global_addr = ""
      transtype = "ISS-TR".
 
   find pt_mstr where pt_domain = global_domain and
                      pt_part = ds_part
   no-lock no-error.
 
   find pl_mstr where pl_domain = global_domain and
                      pl_prod_line = pt_prod_line
   no-lock no-error.
 
   if available pl_mstr then
      find pld_det where pld_domain = global_domain and
                         pld_prodline = pl_prod_line and
                         pld_site = ds_shipsite
      no-lock no-error.
 
   if sr_qty < 0 then do:
      /* IF SR_QTY < 0, THEN FROM EXPIRE,ASSAY,GRADE,STATUS     */
      /* MAY COME FROM RECEIVING DOMAIN AND NOT FROM ISSUE DB */
      original_db = global_db.
 
      find si_mstr where si_domain = global_domain and
                         si_site = ds_site
      no-lock no-error.
 
      if si_db <> global_db then do:
         /* SWITCH TO THE RECEIVING SITE */
         {us/bbi/gprun.i ""gpmdas.p"" "(input si_db, output err-flag)"}
         if err-flag <> 0 then do:
            /* DOMAIN # IS NOT AVAILABLE */
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=si_db}
            undo sr_wkfl-loop, next sr_wkfl-loop.
         end.
      end.  /* IF si_db <> global_db */
 
   end. /* sr_qty < 0 */
 
   {us/bbi/gprun.i ""dsdorcb.p""
            "(input site,
              input location,
              input ds_part,
              input lotserial,
              input lotref,
              input sr_qty,
              input ds_site,
              input ds_trans_id,
              input ""ISS-DO"",
              output ldexpire,
              output ldgrade,
              output ldassay,
              output ldstatus,
              output from_ld_exists)"}
 
   if sr_qty < 0 then do:
      if original_db <> global_db then do:
         /* SWITCH BACK TO THE ORIGINAL DOMAIN  */
         {us/bbi/gprun.i ""gpmdas.p"" "(input original_db, output err-flag)"}
         if err-flag <> 0 then do:
            /* DOMAIN # IS NOT AVAILABLE */
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=si_db}
            undo sr_wkfl-loop, next sr_wkfl-loop.
         end.
      end.  /* IF original_db <> global_db */
   end.  /* IF sr_qty < 0 */
 
   if available pt_mstr then do:
 
      if site <> ds_shipsite then do:
         {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                  &PARAM = "(input  ds_part,
                             input  ds_shipsite,
                             input ""pt_loc"",
                             output l_pt_loc)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
         }
 
         {us/bbi/gprun.i ""icxfer.p""
                  "(input ds_req_nbr,
                    input lotserial,
                    input lotref,
                    input lotref,
                    input trqty,
                    input ds_nbr,
                    input ds_so_nbr,
                    input """",
                    input ds_project,
                    input eff_date,
                    input site,
                    input location,
                    input ds_shipsite,
                    input l_pt_loc,
                    input no,
                    input """",
                    input ?,
                    input """",
                    input 0,
                    input """",
                    output glcost,
                    output iss_trnbr,
                    output rct_trnbr,
                    input-output assay,
                    input-output grade,
                    input-output expire)"}
 
         glxcst = glcost.
      end.  /* IF site <> ds_shipsite */
      else do:
         find in_mstr where in_domain = global_domain and
                            in_part = pt_part and
                            in_site = site
         no-lock no-error.
         /* GET THE TOTAL GL COST */
         {us/gp/gpsct03.i &cost=sct_cst_tot}
      end.  /* ELSE DO */
 
      gl_amt = trqty * glxcst.
 
      /* ROUND gl_amt TO BASE CURRENCY PRECISION */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                "(input-output gl_amt,
                  input gl_rnd_mthd,
                  output mc-error-number)"}
 
      if mc-error-number <> 0 then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
      end.
 
   end.  /* IF AVAILABLE pt_mstr */
 
   transtype = "ISS-DO".
 
   if from_ld_exists then do:
      {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                  &PARAM = "(input  ds_part,
                             input  ds_shipsite,
                             input ""pt_loc"",
                             output l_pt_loc)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
      }
 
      find ld_det where ld_domain = global_domain and
      ld_site = ds_shipsite and
         ld_loc = (if site <> ds_shipsite then l_pt_loc else location) and
         ld_part = ds_part and
         ld_lot = lotserial and
         ld_ref =  lotref
      exclusive-lock no-error.
 
      if not available ld_det then do:
 
         create ld_det.
         assign
            ld_domain = global_domain
            ld_site = ds_shipsite
            ld_loc = if site <> ds_shipsite then l_pt_loc else location
            ld_part = ds_part
            ld_lot = lotserial
            ld_ref = lotref.
 
         find loc_mstr where loc_domain = global_domain and
                             loc_site = site  and
                             loc_loc = location
         no-lock no-error.
         if available loc_mstr then
            ld_status = loc_status.
         else do:
            find si_mstr where si_domain = global_domain and
                               si_site = site
            no-lock no-error.
            if available si_mstr then
               ld_status = si_status.
         end.
      end. /* not available ld_det */
 
      assign
         ld_expire = ldexpire
         ld_grade = ldgrade
         ld_assay = ldassay.
 
   end. /* from_ld_exists */
 
   {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
            &PARAM = "(input  ds_part,
                      input  ds_shipsite,
                      input ""pt_loc"",
                      output l_pt_loc)"
            &NOAPPERROR = true
            &CATCHERROR = true
   }

   l_alt_um = "".

   if trqty <> 0
   then do:

      if     {us/wh/whgpwhon.i}
      then do:
         if      available ld_det 
            and ld_alt_um <> ""
         then
            l_alt_um = ld_alt_um.
      end. /* IF {us/wh/whgpwhon.i} */

      /* CREATE INVENTORY TRANSACTION */
      {us/ic/ictrans.i
         &addrid=ds_site
         &bdnstd=0
         &cracct="if available pt_mstr then
                     if available pld_det then pld_inv_acct
                     else pl_inv_acct
                  else """""
         &crsub="if available pt_mstr then
                    if available pld_det then pld_inv_sub
                    else pl_inv_sub
                 else """""
         &crcc="if available pt_mstr then
                   if available pld_det then pld_inv_cc
                   else pl_inv_cc
                else """""
         &crproj="if available pt_mstr then ds_project else """""
         &curr=""""
         &dracct=intermediate_acct
         &drsub=intermediate_sub
         &drcc=intermediate_cc
         &drproj="if available pt_mstr then ds_project else """""
         &effdate=eff_date
         &exrate=0
         &exrate2=0
         &exratetype=""""
         &exruseq=0
         &glamt=gl_amt
         &lbrstd=0
         &line=ds_line
         &location="(if site <> ds_shipsite then l_pt_loc else location)"
         &lotnumber=ds_req_nbr
         &lotref=lotref
         &lotserial=lotserial
         &mtlstd=0
         &ordernbr=ds_nbr
         &ovhstd=0
         &part=ds_part
         &perfdate=?
         &price=glxcst
         &quantityreq="ds_qty_conf - ds_qty_ship"
         &quantityshort="if cancel_bo then 0
                         else (ds_qty_conf - ds_qty_ship - ds_qty_chg)"
         &quantity="- trqty"
         &revision=""""
         &rmks=""""
         &shiptype=""""
         &site=ds_shipsite
         &slspsn1=""""
         &slspsn2=""""
         &sojob=ds_so_nbr
         &substd=0
         &transtype=transtype
         &msg=0
         &ref_site=ds_git_site
         &shipnbr=v_shipnbr
         &shipdate=v_shipdate
         &invmov=v_invmov
         &intercoref=pIntercoRef
         &mgmt_curr=""""
         &mgmt_curr_amt=0
         &mgmt_curr_ex_rate=0
         &mgmt_curr_ex_rate2=0
         &mgmt_curr_ex_ratetype=""""}
 
     {us/gp/gprunp.i "soldxr" "p" "getneglflg"
               "(output o_negflg)"}      

      /* Tax posting */
      if o_negflg = no or /* confirm_mode = yes */
        (o_negflg = yes and /* confirm_mode = no */
         not can-find(first lgd_mstr 
                            where lgd_domain = global_domain
                              and lgd_shipper_id = abs_mstr.abs_id 
                              and lgd_nbr = "")) then
         {us/bbi/gprun.i ""icgltax.p""
                  "(input tr_hist.tr_trnbr,
                    input i_abs_recid)"}
   end. /* IF trqty <> 0 */
 
   if use-log-acctg and (available tr_hist) then do:
 
      /* IF LOGISTICS ACCOUNTING IS ENABLED, STORE THE INVENTORY TRANSACTION */
      /* NUMBER FOR USE WHEN CREATING TRGL_DET FOR THE FREIGHT ACCRUAL       */
      for first ft_mstr where ft_domain = global_domain and
                              ft_terms  = dss_fr_terms
      no-lock:
 
         if ft_accrual_level = {&LEVEL_Line}
            or ft_accrual_level = {&LEVEL_Shipment}
         then do:
 
         if v_shipnbr  = "" then  do:
            for first tt-frcalc where tt_order = ds_nbr
               and tt_shipfrom = ds_shipsite
               and tt_order_line = ds_line
               and tt_lc_charge = ft_lc_charge
            exclusive-lock :
            end.
        end.
        else do:
           for first tt-frcalc where tt_order = v_shipnbr
               and tt_shipfrom = ds_shipsite
               and tt_order_line = ds_line
               and tt_lc_charge = ft_lc_charge
               and tt_dss_nbr = ds_nbr
               and tt_req_nbr = ds_req_nbr
           exclusive-lock :
           end.
        end.
 
            if available tt-frcalc then
               tt_trans_nbr = tr_trnbr.
 
         end.   /* if ft_accrual_level */
 
      end.   /* for first ft_mstr */
 
   end.  /* if use-log-acctg */
 
   /* TRANSFER CONSIGNMENT RECEIPT RECORDS */
   /* WHEN MOVING TO/FROM INSPECTION.      */
   if using_supplier_consignment
      and available pt_mstr
      and available tr_hist
   then do:
      {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
               &PARAM = "(input  ds_part,
                          input  ds_shipsite,
                          input ""pt_loc"",
                          output l_pt_loc)"
               &NOAPPERROR = true
               &CATCHERROR = true
      }
      {us/gp/gprunmo.i &module = "ACN" &program = "icxfercn.p"
         &param = """(input tr_trnbr,
                      input ds_nbr,
                      input ds_so_nbr,
                      input ds_part,
                      input pt_um,
                      input lotserial,
                      input lotref,
                      input lotref,
                      input trqty,
                      input ds_shipsite,
                      input (if site <> ds_shipsite
                               then l_pt_loc
                               else location),
                      input ds_git_site,
                      input ds_trans_id,
                      input eff_date,
                      output xfer_without_ownership_change,
                      output consigned_qty)"""}
   end.  /* if using_supplier_consignment */
 
   /* FIND IMPORT EXPORT CONTROL FILE */
   for first iec_ctrl
      where iec_ctrl.iec_domain = global_domain
   no-lock:
      if iec_use_instat then do:
         /* CREATE IMPORT EXPORT HISTORY RECORD */
         {us/bbi/gprun.i ""iehistdo.p"" "(input recid(tr_hist), input ds_nbr)"}
      end.
   end.
 
   /* DETERMINE IF CAPTURING SHIPMENT PERFORMANCE */
   for first mfc_ctrl where
         mfc_domain = global_domain and
         mfc_field = "enable_shipment_perf"    and
         mfc_module = "ADG"                    and
         mfc_logical = yes
   no-lock: end.
   if available mfc_ctrl then
      using_shipment_perf = yes.
 
   /* CAPTURE SHIPMENT PERFORMANCE IF ENABLED FOR DRP */
   if using_shipment_perf then do:
      {us/gp/gprunmo.i &module="ASR" &program= ""dsshpds.p""
         &param= """(input recid(ds_det))"""}
   end. /* IF using_shipment_perf */
 
   original_db = global_db.
   find si_mstr where si_domain = global_domain and
                      si_site = ds_site
   no-lock no-error.
 
   if si_db <> global_db then do:
      /* SWITCH TO THE RECEIVING SITE */
      {us/bbi/gprun.i ""gpmdas.p"" "(input si_db, output err-flag)"}
      if err-flag <> 0 then do:
         /* DOMAIN # IS NOT AVAILABLE */
         {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=si_db}
         undo sr_wkfl-loop, next sr_wkfl-loop.
      end.
   end.  /* IF si_db <> global_db */
 
/*cy1005*  {us/bbi/gprun.i ""dsdoisa1.p"" */
/*cy1005*/ {us/bbi/gprun.i ""xxdoisa1.p""
            "(input ds_nbr,
              input ds_req_nbr,
              input ds_part,
              input ds_shipsite,
              input ds_site,
              input ds_git_site,
              input ds_project,
              input ldexpire,
              input ldgrade,
              input ldassay,
              input ldstatus,
              input from_ld_exists,
              input i_abs_recid,
              input consigned_qty,
              input pIntercoRef,
              output undo-input)"}
 
   if     {us/wh/whgpwhon.i}
   then do:
      if l_alt_um <> ""
      then do:
         for first ld_det
            where ld_domain = global_domain
            and   ld_site   = ds_site
            and   ld_loc    = ds_trans_id
            and   ld_part   = ds_part
            and   ld_lot    = lotserial
            and   ld_ref    = lotref
         exclusive-lock:
            ld_alt_um = l_alt_um.
         end. /* FOR FIRST ld_det */
      end. /* IF l_alt_um <> "" */
   end. /* IF {us/wh/whgpwhon.i} */
 
   if original_db <> global_db then do:
      /* SWITCH BACK TO THE ORIGINAL DOMAIN */
      {us/bbi/gprun.i ""gpmdas.p"" "(input original_db, output err-flag)"}
      if err-flag <> 0 then do:
         /* DOMAIN # IS NOT AVAILABLE */
         {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=original_db}
         undo sr_wkfl-loop, next sr_wkfl-loop.
      end.
   end.  /* IF original_db <> global_db */
 
   if undo-input then
      undo sr_wkfl-loop, next sr_wkfl-loop.
 
   find dsdet where recid(dsdet) = recid(ds_det)
      exclusive-lock no-error.
   if available dsdet then do:
      assign
         dsdet.ds_qty_ship = dsdet.ds_qty_ship + sr_qty
         this_qty_ship = this_qty_ship + sr_qty.
 
   end. /* IF AVAILABLE dsdet */
 
   find lad_det
      where lad_domain = global_domain
      and lad_dataset  = "ds_det"
      and lad_nbr      = ds_req_nbr
      and lad_line     = ds_site
      and lad_part     = ds_part
      and lad_site     = (if sr_qty < 0
                            and p_site <> ""
                         then
                            p_site
                         else
                            sr_site)
      and lad_loc      = sr_loc
      and lad_lot      = sr_lotser
      and lad_ref      = sr_ref
   exclusive-lock no-error.
 
   if available lad_det then do:
      assign
         ds_qty_all   = ds_qty_all + lad_qty_pick
         ds_qty_pick  = ds_qty_pick - sr_qty
         lad_qty_all  = lad_qty_all + lad_qty_pick
         lad_qty_pick = 0.
 
      find ld_det where ld_domain = global_domain
         and ld_site = lad_site
         and ld_loc = lad_loc
         and ld_part = lad_part
         and ld_lot = lad_lot
         and ld_ref = lad_ref
      exclusive-lock no-error.
 
      if available ld_det then
         if cancel_bo then
            ld_qty_all = ld_qty_all - lad_qty_all.
         else
            ld_qty_all = ld_qty_all - min(lad_qty_all, sr_qty).
 
      /* Delete ld_det (was gplddet.i */
      if available ld_det
         and ld_qty_oh = 0
         and ld_qty_all = 0
         and ld_qty_frz = 0
         and not can-find(first tag_mstr where
                                tag_domain = global_domain
                            and tag_site = lad_site
                            and tag_loc = lad_loc
                            and tag_part = lad_part
                            and tag_serial = lad_lot
                            and tag_ref = lad_ref)
      then do:
 
         find loc_mstr where loc_domain = global_domain
            and loc_loc = lad_loc
            and loc_site = lad_site
         no-lock no-error.
 
         if available loc_mstr and loc_perm = no
            then delete ld_det.
      end.
 
      find in_mstr where
         in_domain = global_domain and
         in_part = lad_part and
         in_site = lad_site
      exclusive-lock no-error.
      if available in_mstr then do:
         if cancel_bo then
            in_qty_all = in_qty_all - lad_qty_all.
         else
            in_qty_all = in_qty_all - min(lad_qty_all,sr_qty).
      end.
 
      if cancel_bo then
         assign
            ds_qty_all  = 0
            lad_qty_all = 0.
      else
         assign
            ds_qty_all       = max(ds_qty_all - sr_qty,0)
            this_qty_det_all = this_qty_det_all + min(lad_qty_all,sr_qty)
            lad_qty_all      = if sr_qty < 0
                               then
                                  lad_qty_all - sr_qty
                               else
                                  max(lad_qty_all - sr_qty,0).
 
      if lad_qty_all = 0 then
         delete lad_det.
   end.
 
   delete sr_wkfl.
 
end.  /* SR_WKFL-LOOP */
 
/* UPDATE BUFFER FOR ds_det WHEN CANCEL BACKORDER IS YES */
if cancel_bo then
   run cancel_bo_update
       (input recid(ds_det)).
 
/* MRP WORKFILE */
if ds_qty_ord >= 0 then
   open_ref = max(ds_qty_conf - max(ds_qty_ship, 0), 0).
else
   open_ref = min(ds_qty_conf - min(ds_qty_ship, 0), 0).
 
if ds_status = "C" then
   open_ref = 0.
 
 
/* UPDATE mrp_det RECORDS PROPERLY */
{us/mf/mfmrw.i
   "ds_det"
   ds_part
   ds_req_nbr
   ds_shipsite
   ds_site
   ?
   ds_shipdate
   open_ref
   "DEMAND"
   INTERSITE_DEMAND
   ds_shipsite}
 
/* UPDATE in_qty_req */
run update_in_qty_req
  (input l_prev_ds_status,
   input l_prev_ds_qty,
   input ds_status,
   input open_ref,
   input ds_part,
   input ds_shipsite).
 
/* END ADD */
 
/* INCLUDE FILE CONTAINING COMMON PROCEDURES FOR DRP            */
{us/ds/dsopnqty.i}
/*----------------------------------------------------------------------------*/
PROCEDURE cancel_bo_update :
/*_____________________________________________________________________________
Comments :
   /* WHEN THE USER ELECTS TO CANCEL THE B/O QTY, CONFIRMED QTY IS*/
   /* ASSIGNED TO THE SHIPPED QTY. THIS REDUCES THE CONFIRMED QTY */
   /* BY THE REMAINING UNSHIPPED QUANTITY.                        */
 
   /* IF THE ORDER IS OVER-SHIPPED(DS_QTY_SHIP > DS_QTY_CONF)     */
   /* THE CANCEL_BO FLAG WILL NOT CHANGE THE CONFIRM QTY          */
 
   /* IF THE ORDER IS OVER-SHIPPED(DSD_QTY_SHIP > DSD_QTY_CONF)    */
   /* THE CANCEL_BO FLAG WILL NOT CHANGE THE CONFIRM QTY           */
 
Parameters:
 
------------------------------------------------------------------------------*/
 
   define buffer dsdet for ds_det.
   define input parameter dsrecid as recid          no-undo.
 
   define variable prev_dsd_qty like dsd_qty_conf   no-undo.
   define variable mrptype      like mrp_type       no-undo.
   define variable open_ref     like mrp_qty        no-undo.
 
   define variable l_site       like ds_site        no-undo.
   define variable l_ds_nbr     like ds_nbr         no-undo.
   define variable l_ds_req_nbr like ds_req_nbr     no-undo.
   define variable l_ship_site  like ds_shipsite    no-undo.
 
   assign
      l_ds_nbr     = ""
      l_ds_req_nbr = ""
      l_site       = ""
      l_ship_site  = "".
 
   for first dsdet where recid(dsdet) = dsrecid
   exclusive-lock:
      if dsdet.ds_qty_ord >= 0
      then do:
         if dsdet.ds_qty_conf > dsdet.ds_qty_ship then
            dsdet.ds_qty_conf = dsdet.ds_qty_ship.
      end. /* IF ds_qty_ord >= 0 */
      else do:
         if dsdet.ds_qty_conf < dsdet.ds_qty_ship then
            dsdet.ds_qty_conf = dsdet.ds_qty_ship.
      end. /* ELSE DO */
 
      assign
         l_ds_nbr     = dsdet.ds_nbr
         l_ds_req_nbr = dsdet.ds_req_nbr
         l_site       = dsdet.ds_site
         l_ship_site  = dsdet.ds_shipsite.
 
   end. /* FOR FIRST dsdet */
 
   original_db = global_db.
 
   for first si_mstr
      where si_domain = global_domain
      and   si_site   = l_site
   no-lock:
   end. /* FOR FIRST si_mstr */
 
   if available si_mstr
      and  si_db <> global_db
   then do:
 
      /* SWITCH TO THE RECEIVING SITE */
      {us/bbi/gprun.i ""gpmdas.p""
               "(input si_db,
                 output err-flag)"}
 
      if err-flag <> 0
      then do:
 
         /* DOMAIN # IS NOT AVAILABLE */
         {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=si_db}
         undo, leave.
 
      end. /* IF err-flag <> 0 */
   end.  /* IF si_db <> global_db */
 
   /* DISTRIBUTION ORDER ISSUE SUBROUTINE dsd_det UPDATE */
   {us/bbi/gprun.i ""dsdoisa5.p""
            "(input l_site,
              input l_ds_req_nbr,
              input l_ship_site,
              input l_ds_nbr)"}
 
   if original_db <> global_db
   then do:
 
      /* SWITCH BACK TO THE ORIGINAL DOMAIN  */
      {us/bbi/gprun.i ""gpmdas.p""
               "(input original_db,
                 output err-flag)"}
 
      if err-flag <> 0
      then do:
 
         /* DOMAIN # IS NOT AVAILABLE */
         {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=si_db}
         undo , leave.
 
      end. /* IF err-flag <> 0 */
   end.  /* IF original_db <> global_db */
 
END PROCEDURE.
 
/*----------------------------------------------------------------------------*/
