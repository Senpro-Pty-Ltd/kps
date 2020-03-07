/* xxporcc.p - PURCHASE ORDER RECEIPT CREATE TR-HIST                          */
/* poporcc.p - PURCHASE ORDER RECEIPT CREATE TR-HIST                          */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxporcc.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* REVISION: 6.0      LAST MODIFIED: 10/27/90   BY: pml *D146*                */
/* REVISION: 6.0      LAST MODIFIED: 03/18/91   BY: WUG *D472*                */
/* REVISION: 6.0      LAST MODIFIED: 04/11/91   BY: RAM *D518*                */
/* REVISION: 6.0      LAST MODIFIED: 05/08/91   BY: MLV *D622*                */
/* REVISION: 6.0      LAST MODIFIED: 07/16/91   BY: RAM *D777*                */
/* REVISION: 6.0      LAST MODIFIED: 11/11/91   BY: WUG *D887*                */
/* REVISION: 7.0      LAST MODIFIED: 11/19/91   BY: pma *F003*                */
/* REVISION: 7.0      LAST MODIFIED: 01/31/92   BY: RAM *F126*                */
/* REVISION: 7.0      LAST MODIFIED: 02/12/92   BY: pma *F190*                */
/* REVISION: 7.0      LAST MODIFIED: 03/02/92   BY: pma *F085*                */
/* REVISION: 7.0      LAST MODIFIED: 04/14/92   BY: pma *F392*                */
/* REVISION: 7.0      LAST MODIFIED: 07/09/92   BY: pma *F748*                */
/* REVISION: 7.3      LAST MODIFIED: 09/27/92   BY: jcd *G247*                */
/* REVISION: 7.3      LAST MODIFIED: 12/18/92   BY: tjs *G460*                */
/* REVISION: 7.4      LAST MODIFIED: 09/01/93   BY: dpm *H075*                */
/* REVISION: 7.4      LAST MODIFIED: 11/04/93   BY: bcm *H210*                */
/* REVISION: 7.4      LAST MODIFIED: 09/11/94   BY: rmh *GM16*                */
/* REVISION: 7.4      LAST MODIFIED: 09/26/94   BY: bcm *H539*                */
/* REVISION: 7.4      LAST MODIFIED: 10/10/94   BY: cdt *FS26*                */
/* REVISION: 7.4      LAST MODIFIED: 10/29/94   BY: bcm *GN73*                */
/* REVISION: 7.4      LAST MODIFIED: 10/31/94   BY: ame *GN82*                */
/* REVISION: 8.5      LAST MODIFIED: 11/08/94   BY: taf *J038*                */
/* REVISION: 7.4      LAST MODIFIED: 11/17/94   BY: bcm *GO37*                */
/* REVISION: 8.5      LAST MODIFIED: 12/14/94   BY: ktn *J041*                */
/* REVISION: 8.5      LAST MODIFIED: 01/05/95   BY: pma *J040*                */
/* REVISION: 7.4      LAST MODIFIED: 02/16/95   BY: jxz *F0JC*                */
/* REVISION: 8.5      LAST MODIFIED: 03/06/95   BY: dpm *J044*                */
/* REVISION: 8.5      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 8.5      LAST MODIFIED: 07/05/95   BY: sxb *J04D*                */
/* REVISION: 8.5      LAST MODIFIED: 09/09/95   BY: kxn *J07T*                */
/* REVISION: 7.4      LAST MODIFIED: 09/14/95   BY: jzw *H0FX*                */
/* REVISION: 7.4      LAST MODIFIED: 11/02/95   BY: jym *F0TC*                */
/* REVISION: 8.5      LAST MODIFIED: 10/09/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 01/16/96   BY: ame *G1K4*                */
/* REVISION: 8.5      LAST MODIFIED: 05/24/96   BY: pmf *H0L8*                */
/* REVISION: 8.5      LAST MODIFIED: 06/05/96   BY: rxm *G1XG*                */
/* REVISION: 8.6      LAST MODIFIED: 09/03/96   BY: jzw *K008*                */
/* REVISION: 8.6      LAST MODIFIED: 10/01/96   BY: *G2GF* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 10/18/96   BY: *K003* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 11/25/96   BY: *K01X* Jeff Wootton       */
/* REVISION: 8.6      LAST MODIFIED: 03/05/97   BY: *H0SW* Robin McCarthy     */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K04X* Steve Goeke        */
/* REVISION: 8.6E     LAST MODIFIED: 03/20/98   BY: *J2F0* Niranjan Ranka     */
/* REVISION: 8.6E     LAST MODIFIED: 04/01/98   BY: *J2HH* Alllen Licha       */
/* REVISION: 8.6E     LAST MODIFIED: 06/29/98   BY: *L034* Markus Barone      */
/* REVISION: 8.6E     LAST MODIFIED: 07/02/98   BY: *L020* Charles Yen        */
/* REVISION: 8.6E     LAST MODIFIED: 08/19/98   BY: *L06C* Brenda Milton      */
/* REVISION: 8.6E     LAST MODIFIED: 08/18/98   BY: *J2WM* Aruna Patil        */
/* REVISION: 8.6E     LAST MODIFIED: 08/28/98   BY: *J2XY* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 04/16/99   BY: *J2DG* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 05/15/99   BY: *J39K* Sanjeev Assudani   */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* PATTI GAULTNEY     */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Thelma Stronge     */
/* REVISION: 9.1      LAST MODIFIED: 06/08/00   BY: *M0ND* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KQ* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 10/04/00   BY: *M0SQ* Santosh Rao        */
/* Revision: 1.34      BY: Rajesh Kini           DATE: 11/07/00   ECO: *J3QF* */
/* Revision: 1.35      BY: Mudit Mehta           DATE: 09/29/00   ECO: *N0W9* */
/* Revision: 1.39      BY: Katie Hilbert         DATE: 04/01/01   ECO: *P002* */
/* Revision: 1.40      BY: Rajaneesh Sarangi     DATE: 04/06/01   ECO: *M13R* */
/* Revision: 1.41      BY: Irine Fernandes       DATE: 10/22/01   ECO: *M1N4* */
/* Revision: 1.42      BY: Rajaneesh Sarangi     DATE: 11/08/01   ECO: *M1PL* */
/* Revision: 1.45      BY: Jean Miller           DATE: 12/10/01   ECO: *P03H* */
/* Revision: 1.46      BY: Saurabh Chaturvedi    DATE: 01/12/02   ECO: *M1T5* */
/* Revision: 1.47      BY: Ellen Borden          DATE: 11/30/01   ECO: *P00G* */
/* Revision: 1.48      BY: Jeff Wootton          DATE: 05/14/02   ECO: *P03G* */
/* Revision: 1.49      BY: Steve Nugent          DATE: 05/24/02   ECO: *P018* */
/* Revision: 1.53      BY: Luke Pokic            DATE: 05/24/02   ECO: *P03Z* */
/* Revision: 1.54      BY: Steve Nugent          DATE: 06/10/02   ECO: *P07Y* */
/* Revision: 1.55      BY: Luke Pokic            DATE: 06/14/02   ECO: *P08L* */
/* Revision: 1.56      BY: Luke Pokic            DATE: 06/19/02   ECO: *P099* */
/* Revision: 1.57      BY: Robin McCarthy        DATE: 07/15/02   ECO: *P0BJ* */
/* Revision: 1.58      BY: Tiziana Giustozzi     DATE: 07/17/02   ECO: *P0BG* */
/* Revision: 1.63      BY: Patrick Rowan         DATE: 08/01/02   ECO: *P0C8* */
/* Revision: 1.64      BY: Tiziana Giustozzi     DATE: 08/06/02   ECO: *P0CW* */
/* Revision: 1.65      BY: Steve Nugent          DATE: 08/10/02   ECO: *P0DT* */
/* Revision: 1.66      BY: Tiziana Giustozzi     DATE: 09/11/02   ECO: *P0DR* */
/* Revision: 1.70      BY: Tiziana Giustozzi     DATE: 11/26/02   ECO: *P0KV* */
/* Revision: 1.72      BY: Pawel Grzybowski      DATE: 03/27/03   ECO: *P0NT* */
/* Revision: 1.73      BY: Gnanasekar            DATE: 05/08/03   ECO: *N2DL* */
/* Revision: 1.74      BY: Orawan Songmoungsuk   DATE: 05/26/03   ECO: *P0RG* */
/* Revision: 1.76      BY: Paul Donnelly (SB)    DATE: 06/28/03   ECO: *Q00J* */
/* Revision: 1.77      BY: Gnanasekar            DATE: 08/01/03   ECO: *N2HX* */
/* Revision: 1.78      BY: Gnanasekar            DATE: 08/04/03   ECO: *N2JL* */
/* Revision: 1.79      BY: Katie Hilbert         DATE: 08/22/03   ECO: *P10H* */
/* Revision: 1.80      BY: Robin McCarthy        DATE: 04/19/04   ECO: *P15V* */
/* Revision: 1.81      BY: Russ Witt             DATE: 06/21/04   ECO: *P1CZ* */
/* Revision: 1.82      BY: Sushant Pradhan       DATE: 07/26/04   ECO: *P2C9* */
/* Revision: 1.83      BY: Salil Pradhan         DATE: 08/03/04   ECO: *P2D3* */
/* Revision: 1.84      BY: Abhishek Jha          DATE: 08/23/04   ECO: *P2DN* */
/* Revision: 1.85      BY: Shoma Salgaonkar      DATE: 08/25/04   ECO: *Q0CJ* */
/* Revision: 1.86      BY: Swati Sharma          DATE: 09/30/04   ECO: *P2M1* */
/* Revision: 1.87      BY: Ed van de Gevel       DATE: 03/07/05   ECO: *R00K*/
/* Revision: 1.88      BY: Anitha Gopal          DATE: 07/07/05   ECO: *P3RL*/
/* Revision: 1.92      BY: Steve Nugent          DATE: 09/07/05   ECO: *P2PJ* */
/* Revision: 1.92      BY: Shilpa Kamath         DATE: 04/18/06   ECO: *R03V* */
/* Revision: 1.93      BY: Changlin Zeng         DATE: 05/07/06   ECO: *R045* */
/* Revision: 1.94      BY: Changlin Zeng         DATE: 09/21/06   ECO: *R094* */
/* Revision: 1.95      BY: Ambrose Almeida       DATE: 10/04/06   ECO: *R09H* */
/* Revision: 1.96      BY: Pat Rowan             DATE: 04/26/07   ECO: *R0C6* */
/* Revision: 1.98      BY: Ruma Bibra            DATE: 11/02/07   ECO: *P62N* */
/* Revision: 1.100     BY: Deepak Keni           DATE: 11/30/07   ECO: *P6JD* */
/* Revision: 1.104     BY: Jean Miller           DATE: 06/15/08   ECO: *R0V6* */
/* Revision: 1.105     BY: Neil Curzon           DATE: 06/09/09   ECO: *R1KH* */
/* Revision: 1.106     BY: Chandrakant Ingale    DATE: 12/09/09   ECO: *Q3NF* */
/* Revision: 1.107     BY: Antony LejoS          DATE: 01/06/10   ECO: *R1V2* */
/* Revision: 1.108     BY: Rajat Kulshreshtha    DATE: 06/02/10   ECO: *Q43X* */
/* Revision: 1.111    BY: Yiqing Chen          DATE: 04/28/10   ECO: *R22Q* */
/* Revision: 1.112    BY: Huaping Luo      DATE: 06/10/10 ECO: *R21W*  */
/* Revision: 1.117    BY: Ellen Borden      DATE: 08/05/10 ECO: *R24L*  */
/* Revision: 1.118    BY: Huaping Luo      DATE: 08/16/10 ECO: *R251*  */
/* CYB     LAST MODIFIED: 11-Jun-2010              BY: gbg *c1171*            */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB     LAST MODIFIED: 13 Jul 2011       BY: nac *Q9026-CR03 FIN-4595*     */
/* $Revision: 1.2 $ BY: Neil Curzon        DATE: 03/21/11  FIN-4595     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
{us/bbi/mfdeclre.i}

{us/po/porcdef.i}
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/px/pxmaint.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
/*TO ASSIGN OID*/
{us/gp/gpoidfcn.i}

{us/pa/paconst.i}

{us/px/pxphdef.i ictrxr}
{us/px/pxphdef.i papaisxr}
{us/px/pxphdef.i pashphxr}

/* Dataset that contains serial IDs picked for PO */
{us/pa/papodspk.i}

{us/ca/caattr.i}
{us/ca/cattdef.i}
{us/ca/cattdef2.i}
{us/px/pxphdef.i captdxr2}
{us/px/pxphdef.i caicxr}
{us/px/pxphdef.i caparaxr}
{us/px/pxphdef.i cahistxr}
{us/px/pxphdef.i caatdxr}
{us/px/pxphdef.i caisxr}

define input parameter shipnbr         like tr_ship_id      no-undo.
define input parameter ship_date       like tr_ship_date    no-undo.
define input parameter inv_mov         like tr_ship_inv_mov no-undo.
define input parameter ip_consign_flag like mfc_logical     no-undo.
define input parameter ip_is_usage     like mfc_logical     no-undo.
define input parameter ip_usage_qty    as decimal           no-undo.
define input parameter ip_rmks         like tr_rmks         no-undo.
define input parameter pIntercoRef     like glt_interco_ref no-undo.
define input parameter pMgmtCurr       like glt_curr        no-undo.
define input parameter pMgmtExRate     like glt_mgmt_ex_rate no-undo.
define input parameter pMgmtExRate2    like glt_mgmt_ex_rate2 no-undo.
define input parameter pMgmtExRateType like glt_mgmt_ex_ratetype no-undo.
define input parameter p_int_ref_type  like lacd_internal_ref_type no-undo.
define input parameter oidParent       like sr_wkfl.oid_sr_wkfl no-undo.
define input parameter p_selectedReturnReceiver as character no-undo.
define input parameter table for tt_attr_pfvalue.
define input-output parameter dataset for dsSerialPicked.
define input parameter p_shipnbr1      like tr_ship_id      no-undo.
define output parameter invntry-trnbr  like tr_trnbr        no-undo.

/* NEW SHARED VARIABLES, BUFFERS AND FRAMES */
define new shared variable podnbr      like pod_nbr.
define new shared variable same-ref    like mfc_logical.
define new shared variable tr_recno    as recid.
define new shared variable podline     like pod_line.
define new shared variable amount      like spt_cst_tl.

/* SHARED VARIABLES, BUFFERS AND FRAMES */
define shared variable mgmt_curr              like glt_curr no-undo.
define shared variable lInventIsFallBack      as logical no-undo.
define shared variable lStatIsFallBack        as logical no-undo.
define     shared variable accum_taxamt like tx2d_tottax no-undo.
define     shared variable cr_acct     like trgl_cr_acct extent 7.
define     shared variable cr_sub      like trgl_cr_sub extent 7.
define     shared variable cr_cc       like trgl_cr_cc extent 7.
define     shared variable cr_proj     like trgl_cr_proj extent 7.
define     shared variable dr_acct     like trgl_dr_acct extent 7.
define     shared variable dr_sub      like trgl_dr_sub extent 7.
define     shared variable dr_cc       like trgl_dr_cc extent 7.
define     shared variable dr_proj     like trgl_dr_proj extent 7.
define     shared variable entity      like si_entity extent 7.
define     shared variable gl_mgmt_curr_amt like trgl_gl_amt extent 7.
define     shared variable gl_amt      like trgl_gl_amt extent 7.
define     shared variable glx_mthd    like cs_method.
define     shared variable last_sr_wkfl as logical no-undo.
define     shared variable lotser      like sod_serial.
define     shared variable srvendlot   like tr_vend_lot no-undo.
define     shared variable msg-num     like tr_msg.
define     shared variable receivernbr like prh_receiver.
define     shared variable price       like tr_price.
define     shared variable rct_site    like pod_site.
define     shared variable qty_oh      like in_qty_oh.
define     shared variable sct_recno   as recid.
define     shared variable totl_qty_this_rcpt like pod_qty_chg no-undo.
define     shared variable trqty       like tr_qty_chg.
define     shared variable vr_amt      like glt_amt.
define     shared variable vr_acct     like pod_acct.
define     shared variable vr_sub      like pod_sub.
define     shared variable vr_cc       like pod_cc.
define     shared variable vr_proj     like vod_project.
define     shared variable wr_recno    as recid.
/* KANBAN TRANSACTION NUMBER, SHARED FROM poporcm.p AND kbporcm.p */
define     shared variable kbtransnbr      as integer no-undo.
define     shared variable la-trans-nbr    like tr_hist.tr_trnbr no-undo.
define     shared variable pod_entity      like si_entity.
define     shared variable pod_po_entity   like si_entity.
define     shared variable undo_all        like mfc_logical no-undo.

/* LOCAL VARIABLES, BUFFERS AND FRAMES */
define variable assay          like tr_assay    no-undo.
define variable expire         like tr_expire   no-undo.
define variable glcost         like sct_cst_tot no-undo.
define variable grade          like tr_grade    no-undo.
define variable i              as integer       no-undo.
define variable icx_acct       like wo_acct     no-undo.
define variable icx_sub        like wo_sub      no-undo.
define variable icx_cc         like wo_cc       no-undo.
define variable rct_cr_acct    like wo_acct     no-undo.
define variable rct_cr_sub     like wo_sub      no-undo.
define variable rct_cr_cc      like wo_cc       no-undo.
define variable tax_recov      like tx2d_tottax no-undo.
define variable to_entity      like en_entity   no-undo.
define variable trans-ok       like mfc_logical no-undo.
define variable ponbr          like pod_nbr     no-undo.
define variable poline         like pod_line    no-undo.
define variable gl_tmp_amt     as decimal       no-undo.
define variable mc-error-number like msg_nbr    no-undo.
define variable tmp-price       like tr_price   no-undo.
define variable l_glxcst        like glxcst     no-undo.
define variable iss_trnbr       like tr_trnbr   no-undo.
define variable rct_trnbr       like tr_trnbr   no-undo.

define variable l_inv_acct     like trgl_dr_acct no-undo.
define variable l_inv_sub      like trgl_dr_sub  no-undo.
define variable l_inv_cc       like trgl_dr_cc   no-undo.
define variable l_wip_acct     like trgl_cr_acct no-undo.
define variable l_wip_sub      like trgl_cr_sub  no-undo.
define variable l_wip_cc       like trgl_cr_cc   no-undo.
define variable l_wvar_acct    like trgl_cr_acct no-undo.
define variable l_wvar_sub     like trgl_cr_sub  no-undo.
define variable l_wvar_cc      like trgl_cr_cc   no-undo.
define variable l_proj         like trgl_cr_proj no-undo.
define variable rndmthd        like rnd_rnd_mthd no-undo.
define variable l_gl_amt       like trgl_gl_amt  no-undo.
define variable l_ord_nbr      like tr_nbr       no-undo.
define variable l_offset_acct  like trgl_dr_acct no-undo.
define variable l_offset_sub   like trgl_dr_sub  no-undo.
define variable l_offset_cc    like trgl_dr_cc   no-undo.

/* LOGISTICS ACCOUNTING VARIABLES */
define variable use-log-acctg  as logical       no-undo.
define variable la-acct        as character     no-undo.
define variable la-sub         as character     no-undo.
define variable la-cc          as character     no-undo.
define variable la-var-acct    as character     no-undo.
define variable la-var-sub     as character     no-undo.
define variable la-var-cc      as character     no-undo.
define variable la-po_acct     as character     no-undo.
define variable la-po_sub      as character     no-undo.
define variable la-po_cc       as character     no-undo.
define variable account-po     as character     no-undo.
define variable account-type   as character     no-undo.
define variable ico-acct       as character     no-undo.
define variable ico-sub        as character     no-undo.
define variable ico-cc         as character     no-undo.
define variable podsite        like pod_site    no-undo.
define variable charge         like lc_charge   no-undo.
define variable povend         like po_vend     no-undo.
define variable type-po        as character format "x(2)" no-undo.
define variable prod-line      as character     no-undo.
define variable supp-type      as character     no-undo.
define variable lagit          like mfc_logical no-undo.
define variable git-loc        like pod_loc     no-undo.
define variable git-stat like mfc_logical no-undo.
define variable l_pt_loc  as  character no-undo.
define variable l_prh_site like pod_site no-undo.

define variable v_int_ref_type as  character    no-undo.
define variable v_int_ref      as  character    no-undo.
define variable v_qty_rcv      like prh_rcvd    no-undo.
define variable v_prh_receiver like prh_receiver  no-undo .
define variable v_pvod_amt     like pvod_accrued_amt no-undo.
define variable trglAmount like trgl_gl_amt no-undo.
define variable trgl_invt_amount like trgl_gl_amt no-undo.
define variable trgl_stat_amount like trgl_gl_amt no-undo.
define variable trgl_ppv_amount like trgl_gl_amt no-undo.
define variable trGlType   as character     no-undo.
define variable glRef      like glt_ref     no-undo.

define variable clatranstype as character no-undo initial 'RCT-LA'.
define variable dParentOid as decimal no-undo. 

define variable mgmt_curr_ex_rate1     as decimal         no-undo.
define variable mgmt_curr_ex_rate2     as decimal         no-undo.
define variable mgmt_acct_ex_rate1     as decimal         no-undo.
define variable mgmt_acct_ex_rate2     as decimal         no-undo.
define variable lStatCurrError  as logical no-undo.
define variable iStatErrorMsg   as integer no-undo.
define variable trans_nbr like tr_hist.tr_trnbr no-undo.
define variable l_ldnotavail           like mfc_logical   no-undo.

/* CONSIGNMENT VARIABLES */
define variable io_usage_tax_point like mfc_logical no-undo.
define variable consignment        like mfc_logical no-undo.

/*c1171*/ def var prevdomain as char.



/* INTERCOMPANY REFERENCE VARIABLE */
define variable cIntercoRef like glt_interco_ref no-undo.
define variable cInitialIntercoRef like glt_interco_ref no-undo.
define variable isPvoAvail like mfc_logical no-undo. 
define new shared variable lapoAmt    as   decimal     no-undo.

define shared variable l_same_lot as logical no-undo.

{us/gp/gprunpdf.i "gpscpl" "p"}

define buffer blacd_det for lacd_det.
define buffer blacod_det for lacod_det.
{us/po/pocnvars.i}

/* trgl_det account variables */
{us/ic/icglacct.i}
define workfile taxdetail
   field taxacct   like gl_ap_acct
   field taxsub    like gl_ap_sub
   field taxcc     like gl_ap_cc
   field taxamt    like tx2d_tottax.

/*WORKFILE FOR POD RECEIPT ATTRIBUTES*/
define shared workfile attr_wkfl no-undo
   field chg_line   like sr_lineid
   field chg_assay  like tr_assay
   field chg_grade  like tr_grade
   field chg_expire like tr_expire
   field chg_status like tr_status
   field assay_actv as logical
   field grade_actv as logical
   field expire_actv as logical
   field status_actv as logical.

define new shared variable impexp like mfc_logical no-undo initial no.
subscribe to "checkAttributeValuesEntered" anywhere.

assign cInitialIntercoRef = string(nextOidValue()).

{us/gp/gprunp.i "gpscpl" "p" "getStatCurrWithInventory"
    "(input mgmt_curr,
      input lInventIsFallBack,
      input lStatIsFallBack,
      input eff_date,
      input glx_mthd,
      output mgmt_acct_ex_rate1,
      output mgmt_acct_ex_rate2,
      output mgmt_curr_ex_rate1,
      output mgmt_curr_ex_rate2,
      output lStatCurrError,
      output iStatErrorMsg)"}

if lStatCurrError = true then do:
    {us/bbi/pxmsg.i &MSGNUM=iStatErrorMsg &ERRORLEVEL=4}
    assign undo_all = true.
    return.
end.



/*c1171*/ prevdomain = global_domain.
/* VALIDATE IF LOGISTICS ACCOUNTING IS TURNED ON */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

if use-log-acctg then do:
   /* CHECK IF THIS IS LOGISTICS ACCOUNTING PO SHIPPER GIT RECEIPT PROGRAM */
   {us/bbi/gprun.i ""gpckpprg.p"" "(input 'lagitrc', output lagit)"}
   if not lagit then do:
      /* POSHIVMT IS ALSO MOVING TO TRANSIT */
      {us/bbi/gprun.i ""gpckpprg.p"" "(input 'poshivmt', output lagit)"}
   end.
end.

/* DETERMINE IF SHIPPER IS IN TRANSIT */
if use-log-acctg then do:
   {us/gp/gprunmo.i &module = "LA" &program = ""lagit.p""
              &param = """(output git-stat)"""}
end.

/* CHECK TO SEE IF CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
         "(input ENABLE_SUPPLIER_CONSIGNMENT,
           input 11,
           input ADG,
           input SUPPLIER_CONSIGN_CTRL_TABLE,
           output using_supplier_consignment)"}

for first poc_ctrl no-lock
   where poc_domain = global_domain:
end.

for first po_mstr where recid(po_mstr) = po_recno
no-lock: end.

for first pod_det where recid(pod_det) = pod_recno
no-lock:

   /* IF THIS IS LOGISTICS ACCOUNTING PO SHIPPER GIT RECEIPT PROGRAM */
   /* FIND GOODS IN TRANSFER LOCATION */
   if lagit or (git-stat and use-log-acctg) then do:
      git-loc = location.
      for first si_mstr where si_domain = global_domain
         and si_site = pod_site
      no-lock:
         git-loc = si_git_location.
      end.
   end.

end.

for first pt_mstr where recid(pt_mstr) = pt_recno
no-lock: end.

for first wr_route where recid(wr_route) = wr_recno
no-lock: end.

for first sct_det where recid(sct_det) = sct_recno
no-lock: end.

if kbtransnbr <> 0 then do:
   for first kbtr_hist where kbtr_domain = global_domain
      and kbtr_trans_nbr = kbtransnbr
   no-lock: end.
end.  /* if kbtransnbr <> 0 then do */

for first gl_ctrl where gl_domain = global_domain
no-lock: end.

for first icc_ctrl where icc_domain = global_domain
no-lock: end.

for first clc_ctrl where clc_domain = global_domain
no-lock: end.

if not available clc_ctrl then do:
   {us/bbi/gprun.i ""gpclccrt.p""}
   find first clc_ctrl where clc_domain = global_domain no-lock.
end.
if available icc_ctrl then
   same-ref = icc_gl_sum.

/* PONBR AND POLINE NOW ASSIGNED WITH POD_NBR AND POD_LINE        */
/* IRRESPECTIVE OF TYPE OF PURCHASE ORDER                         */
assign
   ponbr  = pod_nbr
   poline = pod_line.

if using_supplier_consignment and ip_consign_flag and
   ip_is_usage = no
then
   assign
      ip_rmks = getTermLabel("CONSIGNED",10)
      consignment = yes
      transtype = "CN-RCT".
else if using_supplier_consignment and ip_is_usage then
   assign
      consignment = no
      transtype = "RCT-PO".
else do:
   assign
      ip_rmks = ""
      consignment = no.
   if available kbtr_hist then ip_rmks = string(kbtr_id).

   /* Need to reset transtype to its default value after a PO consigned */
   /* line has been processed and before a non-consigned PO line is.    */
   /* Otherwise the non-consigned line willI will have a transtype of CN-RCT. */
   /* Transtype defaults to RCT-PO for a receipt - poporcm.p & rsporc.p */
   /* Transtype defaults to ISS-PRV for returns - porvism.p             */
   if transtype = "CN-RCT" then do:
      i = 1.

      do while program-name(i) <> ?:
         if index(program-name(i),"poporcm.") > 0
            or index(program-name(i),"rsporc.") > 0
         then do:
            transtype = "RCT-PO".
            leave.
         end.
         if index(program-name(i),"porvism.") > 0
            or index(program-name(i),"paporvpk.") > 0
         then do:
            transtype = "ISS-PRV".
            leave.
         end.

         i = i + 1.
      end.
   end.
end.

/* Only RTS's that are issuing inventory should create a */
/* PO receipt tr_hist.                                   */
if pod_fsm_type = "RTS-ISS" or
   pod_fsm_type = "RTS-RCT"
then do:

   for first rmd_det where rmd_domain  = global_domain
      and rmd_nbr     = pod_nbr
      and rmd_prefix  = "V"
      and rmd_line    = pod_line
   no-lock: end.

end.

if available pt_mstr then do:

   for first ld_det where ld_domain = global_domain
      and ld_site   = site
      and ld_loc    = location
      and ld_part   = pt_part
      and ld_lot    = lotser
      and ld_ref    = lotref
   no-lock: end.

   if available ld_det then
      assign
         assay  = ld_assay
         grade  = ld_grade
         expire = ld_expire.
end.

ref = "".

if (clc_lotlevel <> 0) and (lotser <> "") and (pod_type = "" or pod_type = "R")
then do:

   {us/bbi/gprun.i ""gpiclt.p""
            "(input pod_part,
              input lotser,
              input ponbr,
              input string(poline),
              output trans-ok )"}

   if not trans-ok then do:
      /* CURRENT TRANSACTION REJECTED- CONTINUE WITH NEXT TRANSACTION */
      {us/bbi/pxmsg.i &MSGNUM=2740 &ERRORLEVEL=4}
      undo, leave.
   end. /* IF NOT TRANS-OK THEN DO: */

end. /* IF CLC_LOTLEV <> 0 ... */

/*PRESET TMP-PRICE VALUE FOR THE FOLLOWING INCLUDE FILE*/
if po_curr = base_curr  or
   ip_is_usage
then
   tmp-price = price.
else do:
   tmp-price = price.
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
      "(input po_curr,
       input base_curr,
       input exch_rate,
       input exch_rate2,
       input tmp-price,
       input false, /* DO NOT ROUND */
       output tmp-price,
       output mc-error-number)"}
end.

/* DO NOT CREATE A RCT-PO INVENTORY TRANSACTION WHEN GOODS ARE IN TRANSIT */
/* AND YOU ARE RECEIVING THE GOODS INTO THE RECEIPT (FINAL) SITE/LOCATION */
if (transtype = "RCT-PO"
    and not git-stat)
   or (transtype    = "ISS-PRV"
       or transtype = "CN-RCT")
then do:

   l_ldnotavail = no.
   if pod_fsm_type = "RTS-ISS"
   then do:
      if not can-find(first ld_det
                         where ld_domain = global_domain
                         and   ld_site   = rct_site
                         and   ld_loc    = (if lagit
                                            then
                                               git-loc
                                            else if pod_type = "M"
                                            then
                                               pod_loc
                                            else if rct_site <> site
                                            then
                                               pod_loc
                                            else
                                               location)
                         and   ld_part   = pod_part
                         and   ld_lot    = lotser
                         and   ld_ref    = lotref)
      then
         l_ldnotavail = yes.
   end. /* IF pod_fsm_type = "RTS-ISS" */

   {us/px/pxrun.i &PROC='updateInvToTTattrpfvalue'
                  &PROGRAM='captdxr2.p'
                  &HANDLE=ph_captdxr2
                  &PARAM="(input-output table tt_attr_pfvalue by-reference,
                           input oidParent,
                           input pod_part,
                           input rct_site,
                           input (if lagit then git-loc else
                                  if pod_type = ""M"" then pod_loc else
                                  if rct_site <> site
                                  then
                                     pod_loc
                                  else
                                     location),
                           input lotser,
                           input lotref)"
                  &NOAPPERROR=true
                  &CATCHERROR=true
   }

   if trqty > 0 and is-return = no then do:
      /* Check Receipt Result against attribute specification */
      {us/px/pxrun.i &PROC      ='validateAttrSpec'
                     &PROGRAM   ='caatdxr.p'
                     &HANDLE    = ph_caatdxr
                     &PARAM     ="(input oidParent,
                                 input-output table tt_attr_pfvalue by-reference)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
      }
      /* Update the attributes are saved into inventory during receipt. */
      {us/px/pxrun.i &PROC       = 'updateAttrPfValueRCTSkipSave'
                     &PROGRAM    = 'caatdxr.p'
                     &HANDLE     = ph_caatdxr
                     &PARAM      = "(input oidParent,
                                     input-output table tt_attr_pfvalue by-reference)"
                     &NOAPPERROR = true
                     &CATCHERROR = true
      }
   end.
   else do:
      /* Check negative receipt or return Result */
      {us/px/pxrun.i &PROC      ='validateAttrSpec'
                     &PROGRAM   = 'caisxr.p'
                     &HANDLE    = ph_caisxr
                     &PARAM     ="(input oidParent,
                                 input-output table tt_attr_pfvalue by-reference)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
      }
      /* Update the attributes are saved into inventory during negative receipt
       * or return. */
      {us/px/pxrun.i &PROC       = 'updateAttrPfValueISSSkipSave'
                     &PROGRAM    = 'caisxr.p'
                     &HANDLE     = ph_caisxr
                     &PARAM      = "(input oidParent,
                                     input-output table tt_attr_pfvalue by-reference)"
                     &NOAPPERROR = true
                     &CATCHERROR = true
      }
   end.

   /* Save the attribute value to temp-table tt_attrdh_hist */
   {us/px/pxrun.i &PROC='RecordAttrHistInitial'
                  &PROGRAM='cahistxr.p'
                  &HANDLE=ph_cahistxr
                  &PARAM="(input oidParent,
                           input no,
                           input table tt_attr_pfvalue by-reference,
                           input-output table tt_attrdh_hist by-reference)"
                  &NOAPPERROR=true
                  &CATCHERROR=true
   }

{us/ic/ictrans.i
   &addrid=po_vend
   &bdnstd=0
   &cracct=cr_acct[1]
   &crsub=cr_sub[1]
   &crcc=cr_cc[1]
   &crproj=cr_proj[1]
   &curr=po_curr
   &dracct=dr_acct[1]
   &drsub=dr_sub[1]
   &drcc=dr_cc[1]
   &drproj=dr_proj[1]
   &effdate=eff_date
   &exrate=exch_rate
   &exrate2=exch_rate2
   &exratetype=exch_ratetype
   &exruseq=exch_exru_seq
   &glamt=0
   &kbtrans=kbtransnbr
   &lbrstd=0
   &line=pod_line
   &location="(if lagit then git-loc else
               if pod_type = ""M"" then pod_loc else
               if rct_site <> site
               then
                  pod_loc
               else
                  location)"
   &lotnumber=receivernbr
   &lotref=lotref
   &lotserial=lotser
   &mtlstd=0
   &ordernbr=pod_nbr
   &ovhstd=0
   &part=pod_part
   &perfdate=pod_per_date
   &price=tmp-price
   &quantityreq="if is-return then
                 ((pod_qty_rcvd - pod_qty_rtnd) * pod_um_conv) else if
                  (using_supplier_consignment and ip_consign_flag
                                              and ip_is_usage)
                   then (ip_usage_qty)
                   else ((pod_qty_ord - pod_qty_rcvd) * pod_um_conv)"
   &quantityshort="if is-return then 0 else (pod_bo_chg * pod_um_conv)"
   &quantity="if using_supplier_consignment and ip_consign_flag
                                            and ip_is_usage
                   then ip_usage_qty
                   else trqty"
   &revision=pod_rev
   &rmks=ip_rmks
   &shiptype=pod_type
   &shipnbr=p_shipnbr1
   &shipdate=ship_date
   &invmov=inv_mov
   &site=rct_site
   &slspsn1=""""
   &slspsn2=""""
   &sojob=pod_so_job
   &substd=0
   &transtype=transtype
   &msg="if is-return then 0 else msg-num"
   &ref_site=tr_site
   &wodop=pod_op
            &mgmt_curr=""""
            &mgmt_curr_amt=0
            &mgmt_curr_ex_rate=0
            &mgmt_curr_ex_rate2=0
            &mgmt_curr_ex_ratetype=""""}


   /* STORING RECID(tr_hist) IN tr_recno BEFORE CALL TO porcat03.p */
   assign
      tr_vend_lot   = srvendlot
      invntry-trnbr = tr_trnbr
      tr_recno      = recid(tr_hist).

   /* Save the attribute value in transaction */
   {us/px/pxrun.i &PROC       = 'saveInvAttrValue'
                  &PROGRAM    = 'caatdxr.p'
                  &HANDLE     = ph_caatdxr
                  &PARAM      = "(input oidParent,
                                  input pod_det.oid_pod_det,
                                  input table tt_attr_pfvalue by-reference)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
   }

   /* Save the new attribute value to DB as history. */
   {us/px/pxrun.i &PROC='RecordAttrHistChanged'
                  &PROGRAM='cahistxr.p'
                  &HANDLE=ph_cahistxr
                  &PARAM="(input oidParent,
                           input oidParent,
                           input invntry-trnbr,
                           input yes,
                           input table tt_attr_pfvalue by-reference,
                           input-output table tt_attrdh_hist by-reference)"
                  &NOAPPERROR=true
                  &CATCHERROR=true
   }

   tr_hist.oid_lgd_mstr = lgdkey.
   if tr_hist.tr_doc_id = "" then
      for first lgd_mstr no-lock where
         lgd_mstr.oid_lgd_mstr = lgdkey:
         tr_hist.tr_doc_id = lgd_mstr.lgd_nbr.    
   end.

   if pod_type = ""
      and (pod_fsm_type <> "RTS-ISS"
             or l_ldnotavail = yes)
   then do:

      for first attr_wkfl
         where chg_line = string(pod_line)
      no-lock:

         if using_supplier_consignment
            and ip_is_usage
         then
            assign
               chg_assay = assay
               chg_grade = grade
               chg_expire = expire.

         /* UPDATE INVENTORY ATTRIBUTES IN tr_hist AND ld_det FOR RCT-PO */
         {us/bbi/gprun.i ""porcat03.p""
                  "(input        tr_recno,
                    input        tr_recno,
                    input        pod_part,
                    input        eff_date,
                    input-output chg_assay,
                    input-output chg_grade,
                    input-output chg_expire,
                    input-output chg_status,
                    input        assay_actv,
                    input        grade_actv,
                    input        expire_actv,
                    input        status_actv)"}

         if assay_actv then
            assay = chg_assay.

         if grade_actv then
            grade = chg_grade.

         if expire_actv then
            expire = chg_expire.

      end. /* FOR FIRST attr_wkfl */
   end. /* IF pod_type = "" */

/* CALCULATING MATERIAL COST FOR ATO/KIT ITEMS FOR AN EMT PO */
/* TO REFLECT ENTIRE CONFIGURATION COST                      */
if po_is_btb and
   can-find (first pt_mstr where pt_domain  = global_domain and
                                 pt_part    = pod_part      and
                                 pt_pm_code = "c")
then do:
   run p-price-configuration.
   tr_mtl_std = tr_mtl_std + l_glxcst.
end. /* IF PO_IS_BTB AND ... */

assign
   tr_vend_lot = srvendlot
   invntry-trnbr = tr_trnbr
   tr_recno = recid(tr_hist).

/* Update serial history. */
if (transtype = "ISS-PRV" or transtype = "CN-RCT") and 
   can-find(first ttPickedPOLine where 
      ttPickedPOLine.poNbr =  pod_nbr and
      ttPickedPOLine.poLine = pod_line  )
then do:

   for each ttPickedPOLine no-lock
      where ttPickedPOLine.poNbr = tr_hist.tr_nbr
      and ttPickedPOLine.poLine = tr_hist.tr_line ,
      first ser_mstr exclusive-lock where ser_mstr.ser_domain = global_domain
         and ser_mstr.ser_serial_id = ttPickedPOLine.serialId:
      ser_mstr.ser_stage = {&SER-STAGE-CONSUMED}.
   end.

   {us/px/pxrun.i &PROC = 'createShippingHistoryForPOReturn'
                  &PROGRAM='pashphxr.p'
                  &HANDLE = ph_pashphxr
                  &PARAM = "(input pod_nbr,
                             input pod_line,
                             input-output dataset dsSerialPicked by-reference)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}

   {us/px/pxrun.i &PROC       = 'createSerhHistForPOReturnByPack'
                  &PROGRAM    = 'papaisxr.p'
                  &HANDLE     = ph_papaisxr
                  &PARAM = "(
                             input  tr_hist.oid_tr_hist,
                             input-output dataset dsSerialPicked by-reference
                             )"
                  &NOAPPERROR = true
                  &CATCHERROR = true
   }
end.

/* IF CONSIGNMENT IS BEING USED THEN CREATE A CONSIGNMENT */
/* CROSS-REFERENCE RECORD FOR THE RECEIPT.                */
l_prh_site = site.
if using_supplier_consignment and consignment then do:
   {us/gp/gprunmo.i &module = "ACN" &program = ""pocnix01.p""
              &param  = """(input pod_nbr,
                            input pod_line,
                            input eff_date,
                            input receivernbr,
                            input rct_site,
                            input trqty,
                            input trqty,
                            input price,
                            input tr_trnbr,
                            input location,
                            input lotser,
                            input lotref,
                            input is-return,
                            input l_prh_site,
                            input p_selectedReturnReceiver)"""}
end.

/* ld_det SHOULD NOT BE DELETED WHEN SUPPLIER */
/* CONSIGNMENT FUNCTIONALITY IS ACTIVE AND    */
/* SUPPLIER CONSIGNED QUANTITY IS NOT ZERO    */
for first cns_ctrl where cns_domain = global_domain
no-lock: end.

if available cns_ctrl
then do :
   for first loc_mstr where loc_mstr.loc_domain = global_domain
      and loc_site = rct_site
      and loc_loc = (if pod_type = "M" then
                        pod_loc
                     else if rct_site <> site then
                        pod_loc
                     else
                        location)
   no-lock: end.

   if available loc_mstr
      and available ld_det
      and loc_perm             = no
      and cns_active           = yes
      and ld_qty_oh            = 0
      and ld_qty_all           = 0
      and ld_qty_frz           = 0
      and ld_supp_consign_qty  = 0
   then do:
      find current ld_det exclusive-lock.
      delete ld_det.
   end. /* IF AVAILABLE loc_mstr */
end. /* IF AVAILABLE cns_ctrl */

/* IF THE INTRASTAT BOLT-ON IS INSTALLED, CREATE AN
 * IMPORT/EXPORT HISTORY RECORD (ieh_hist) FOR THE tr_hist
 * RECORD (IF NECESSARY).
 */

/* FIND IMPORT EXPORT CONTROL FILE */
for first iec_ctrl where iec_domain = global_domain
no-lock: end.

/* CREATE THE INTRASTAT HISTORY RECORD DURING THE NORMAL RECEIPT AND */
/* THE CONSIGNED RECEIPT.  WHEN poporcc.p IS CALLED DURING CONSIGNED */
/* USAGE, THEN SKIP THIS STEP THAT CREATES THE INTRASTAT HISTORY.    */
if ip_is_usage = no then
   if available iec_ctrl and iec_use_instat then do:
      if available tr_hist then do:
         {us/bbi/gprun.i ""iehistpo.p"" "(input tr_recno)"}
      end.
   end.

/* WHEN COSTING METHOD IS AVERAGE, THE TRANSACTION TYPE */
/* OF THE FIRST GL TRANSACTION WILL ALWAYS BE 'RCT-AVG' */
if available trgl_det
then do:
   if pod_type = ""
      and glx_mthd = "AVG"
   then
      trgl_type = (if using_supplier_consignment
                      and ip_consign_flag
                      and ip_is_usage = no
                   then
                      transtype
                   else
                      "RCT-AVG").
end. /* IF AVAILABLE trgl_det */

do i = 1 to 7:
   if (gl_amt[i] <> 0 or ((transtype = "RCT-PO" or
                           transtype = "CN-RCT" or
                           transtype = "ISS-PRV") and
                          gl_mgmt_curr_amt[i] <> 0)) 
   then do:

/*c1171*/   find first en_mstr no-lock
/*c1171*/   where en_entity = entity[i]
/*c1171*/   no-error.
/*c1171*/   if available en_mstr then global_domain = en_domain.

      if i <> 1 then do:

          {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
                &PROGRAM='ictrxr.p'
                &handle = ph_ictrxr
                &PARAM = "(input tr_trnbr,
                           input trGlType,
                           input dr_acct[i],
                           input dr_sub[i],
                           input dr_cc[i],
                           input dr_proj[i],
                           input cr_acct[i],
                           input cr_sub[i],
                           input cr_cc[i],
                           input cr_proj[i],
                           input gl_amt[i],
                           input no, /*create glt_det */
                           input """", /* trans type */
                           input """", /* order #*/
                           input """", /* entity */
                           input ?, /* effective date */
                           input no, /* summarize */
                           input no, /* audit */
                           input ?, /*tr_hist recid*/
                           input """", /* inter company ref# */
                           input """", /* currency */
                           input 0,    /* exchange rate */
                           input 0,    /* exchange rate 2 */
                           input """", /* exchange rate type */
                           input 0,   /* currency amount */
                           input-output glref,
                           output oidTrglDet
                          )"
                &NOAPPERROR=true
                &CATCHERROR=true}

             find first trgl_det exclusive-lock where
                  trgl_det.oid_trgl_det = oidTrglDet
             no-error.

      end. /* if i <> 1 then do */

      if available trgl_det 
      then do:
         trgl_gl_amt  = gl_amt[i].

         if pod_type = "" and glx_mthd = "AVG"
            and (i = 1 or i = 2)
         then
            trgl_type = (if using_supplier_consignment and
                         ip_consign_flag and ip_is_usage = no
                          then  transtype
                          else "RCT-AVG").
         else
            trgl_type = transtype.

         /* Create only the GLT_DET record */

/*c1171x* gbg cCode reinstated 23-07-2011 */
/*c1171*/  if i = 2 then do:
/*c1171*/   find first en_mstr no-lock
/*c1171*/   where en_entity = pod_entity
/*c1171*/   no-error.
/*c1171*/   if available en_mstr
/*c1171*/   then do:
/*c1171*/      find first gl no-lock
/*c1171*/      where gldescr begins en_domain
/*c1171*/      and index(gldescr, "cross coy") <> 0
/*c1171*/      no-error.
/*c1171*/      if available gl
/*c1171*/      then do:
/*c1171*/        trgl_cr_acct = glcode.
/*c1171*/      end.
/*c1171*/   end.
/*c1171*/  end.
/*c1171*/  if i = 6 then do:
/*c1171*/   find first en_mstr no-lock
/*c1171*/   where en_entity = pod_po_entity
/*c1171*/   no-error.
/*c1171*/   if available en_mstr
/*c1171*/   then do:
/*c1171*/      find first gl no-lock
/*c1171*/      where gldescr begins en_domain
/*c1171*/      and index(gldescr, "cross coy") <> 0
/*c1171*/      no-error.
/*c1171*/      if available gl
/*c1171*/      then do:
/*c1171*/        trgl_dr_acct = glcode.
/*c1171*/      end.
/*c1171*/   end.
/*c1171*/  end.
/*c1171x*/
        {us/px/pxrun.i &PROC  = 'createGltDetRecord'
              &PROGRAM='ictrxr.p'
              &handle = ph_ictrxr
              &PARAM =  "(input gl_amt[i],
                          input trgl_type,
                          input pod_nbr,
                          input trgl_dr_acct,
                          input trgl_dr_sub,
                          input trgl_dr_cc,
                          input trgl_dr_proj,
                          input trgl_cr_acct,
                          input trgl_cr_sub,
                          input trgl_cr_cc,
                          input trgl_cr_proj,
                          input entity[i],
                          input eff_date,
                          input same-ref,
                          input icc_mirror,
                          input recid(trgl_det),
                          input recid(tr_hist),
                          input pIntercoRef,
                          input pMgmtCurr,
                          input pMgmtExRate,
                          input pMgmtExRate2,
                          input pMgmtExRateType,
                          input gl_mgmt_curr_amt[i],
                          input-output ref)"
                &NOAPPERROR=true
                &CATCHERROR=true}

/*c1171*/  global_domain = prevdomain.

      end. /* if available trgl_det then do */

   end. /* if (gl_amt[i] <> 0 */

end. /* do i = 1 to 7: */

/* CREATE RCT-CNFG AND RCT-WOVAR TRANSACTIONS */
/* ONLY FOR AN EMT PO CREATED WITH A KIT ITEM */
if po_is_btb
   and can-find (first pt_mstr
                 where pt_domain  = global_domain
                 and   pt_part    = pod_part
                 and   pt_pm_code = "c")
   and can-find (first sod_det
                 where sod_domain = global_domain
                 and sod_nbr      = po_so_nbr
                 and sod_line     = pod_sod_line
                 and sod_cfg_type = "2"
                 and sod_part     = pod_part
                 and sod_fa_nbr   = "")
then do:

   {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
             "(input  po_curr,
               output rndmthd,
               output mc-error-number)"}
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
   end. /* IF mc-error-number <> 0 */

   for first si_mstr where si_domain = global_domain
      and si_site = pod_site
   no-lock: end.

   if available si_mstr then
      pod_entity = si_entity.

   for first pl_mstr where pl_domain = global_domain
      and pl_prod_line = pt_prod_line
   no-lock: end.

   if available pl_mstr then
      for first pld_det where pld_domain    = global_domain
         and pld_prodline  = pl_prod_line
         and pld_site      = pod_site
         and pld_loc       = location
      no-lock: end.

   if not available pld_det then do:
      for first pld_det where pld_domain = global_domain
         and pld_prodline  = pl_prod_line
         and pld_site      = pod_site
         and trim(pld_loc) = ""
      no-lock: end.
   end. /* IF NOT AVAILABLE pld_det */

   if available pld_det then
      assign
         l_inv_acct = pld_inv_acct
         l_inv_sub  = pld_inv_sub
         l_inv_cc   = pld_inv_cc.
   else if available pl_mstr then
      assign
         l_inv_acct = pl_inv_acct
         l_inv_sub  = pl_inv_sub
         l_inv_cc   = pl_inv_cc.
   else
      assign
         l_inv_acct = gl_inv_acct
         l_inv_sub  = gl_inv_sub
         l_inv_cc   = gl_inv_cc.

   /* DETERMINE DEFAULT WIP ACCOUNT */
   {us/bbi/gprun.i ""glactdft.p""
            "(input  ""WO_WIP_ACCT"",
              input  pt_prod_line,
              input  pod_site,
              input  """",
              input  """",
              input  yes,
              output l_wip_acct,
              output l_wip_sub,
              output l_wip_cc)"}

   assign
      l_proj    = pod_project
      l_ord_nbr = pod_nbr + "." + string(pod_line).

   /* l_glxcst GIVES THE ENTIRE CONFIGURATION COST WHICH IS */
   /* CALCULATED IN THE PROCEDURE p-price-configuration     */
   l_gl_amt = l_glxcst * trqty.

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
             "(input-output l_gl_amt,
               input        rndmthd,
               output       mc-error-number)"}
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end. /* IF mc-error-number */

   /* CREATE INVENTORY TRANSACTION GENERL LEDGER CROSS-REFERENCE RECORD */
   /* OF TYPE RCT-CNFG BY DEBITING THE WIP ACCOUNT AND CREDITING THE    */
   /* INVENTORY ACCOUNT                                                 */
   {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
              &PROGRAM='ictrxr.p'
              &handle = ph_ictrxr
              &PARAM = "(input tr_trnbr,
                         input ""RCT-CNFG"",
                         input l_wip_acct,
                         input l_wip_sub,
                         input l_wip_cc,
                         input l_proj,
                         input l_inv_acct,
                         input l_inv_sub,
                         input l_inv_cc,
                         input l_proj,
                         input l_gl_amt,
                         input yes, /*create glt_det */
                         input ""RCT-CNFG"",
                         input l_ord_nbr, /* order #*/
                         input pod_entity, /* entity */
                         input eff_date, /* effective date */
                         input same-ref, /* summarize */
                         input icc_mirror, /* audit */
                         input recid(tr_hist),
                         input """", /* inter company ref# */
                         input """", /* currency */
                         input 0,    /* exchange rate */
                         input 0,    /* exchange rate 2 */
                         input """", /* exchange rate type */
                         input 0,   /* currency amount */
                         input-output ref,
                         output oidTrglDet
                        )"
              &NOAPPERROR=true
              &CATCHERROR=true}



   /* MATERIAL, LABOR, BURDEN, OVERHEAD AND SUBCONTRACT  */
   /* COSTS ASSOCIATED TO THE KIT PARENT ARE ACCUMULATED */
   /* AND POSTED TO RCT-WOVAR TRANSACTION                */
   if (sct_lbr_tl <> 0
       or sct_bdn_tl <> 0
       or sct_ovh_tl <> 0
       or sct_sub_tl <> 0
       or sct_mtl_tl <> 0)
   then do:
      l_gl_amt = trqty *
                 (sct_lbr_tl
                  + sct_bdn_tl
                  + sct_ovh_tl
                  + sct_sub_tl
                  + sct_mtl_tl).

      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                "(input-output l_gl_amt,
                  input        rndmthd,
                  output       mc-error-number)"}
      if mc-error-number <> 0 then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */

      /* DETERMINE DEFAULT METHOD VARIANCE ACCOUNT */
      {us/bbi/gprun.i ""glactdft.p""
               "(input ""WO_WVAR_ACCT"",
                 input pt_prod_line,
                 input pod_site,
                 input """",
                 input """",
                 input no,
                 output l_wvar_acct,
                 output l_wvar_sub,
                 output l_wvar_cc)"}

      /* CREATE INVENTORY TRANSACTION GENERAL LEDGER CROSS-REFERENCE */
      /* RECORD OF TYPE RCT-WOVAR BY DEBITING THE METHOD VARIANCE    */
      /* ACCOUNT AND CREDITING THE WIP ACCOUNT                       */
    {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
              &PROGRAM='ictrxr.p'
              &handle = ph_ictrxr
              &PARAM = "(input tr_trnbr,
                         input ""RCT-WOVAR"",
                         input l_wvar_acct,
                         input l_wvar_sub,
                         input l_wvar_cc,
                         input l_proj,
                         input l_wip_acct,
                         input l_wip_sub,
                         input l_wip_cc,
                         input l_proj,
                         input l_gl_amt,
                         input yes, /*create glt_det */
                         input ""WIP-ADJ"",
                         input l_ord_nbr, /* order #*/
                         input pod_entity, /* entity */
                         input eff_date, /* effective date */
                         input same-ref, /* summarize */
                         input icc_mirror, /* audit */
                         input recid(tr_hist),
                         input """", /* inter company ref# */
                         input """", /* currency */
                         input 0,    /* exchange rate */
                         input 0,    /* exchange rate 2 */
                         input """", /* exchange rate type */
                         input 0,   /* currency amount */
                         input-output ref,
                         output oidTrglDet
                        )"
              &NOAPPERROR=true
              &CATCHERROR=true}


   end. /* IF sct_lbr_tl <> 0 */

end. /* IF po_is_btb */

/* CREATED TWO NEW ROUTINES, poporcc2.p & poporcc3.p  */
/* TO BE CALLED DURING RECEIVING, RETURNS, AND  */
/* VOUCHER MAINTENANCE.   */
/* THIS IS TO SUPPORT THE SUPPLIER CONSIGNMENT  */
/* SEPARATION OF RECEIVING AND VOUCHERING. */
if using_supplier_consignment
   and ip_consign_flag
   and ip_is_usage
then
   totl_qty_this_rcpt = ip_usage_qty.

/* CREATE TRGL_DET FOR NON-RECOVERABLE TAXES */
{us/bbi/gprun.i ""poporcc2.p""
         "(input receivernbr,
           input po_nbr,
           input pod_line,
           input last_sr_wkfl,
           input accum_taxamt,
           input totl_qty_this_rcpt,
           input dr_proj[1],
           input cr_acct[1],
           input cr_sub[1],
           input cr_cc[1],
           input cr_proj[1],
           input tr_trnbr,
           input trqty,
           input po_curr,
           input entity[1],
           input same-ref,
           input using_supplier_consignment,
           input ip_consign_flag,
           input ip_is_usage)"}

if undo_all then return.
       
/* CREATE TRGL_DET FOR RETAINED TAXES */
{us/bbi/gprun.i ""poporcc3.p""
         "(input receivernbr,
           input po_nbr,
           input pod_line,
           input last_sr_wkfl,
           input accum_taxamt,
           input totl_qty_this_rcpt,
           input dr_proj[1],
           input cr_acct[1],
           input cr_sub[1],
           input cr_cc[1],
           input cr_proj[1],
           input tr_trnbr,
           input trqty,
           input po_curr,
           input entity[1],
           input same-ref,
           input using_supplier_consignment,
           input ip_consign_flag,
           input ip_is_usage)"}

if undo_all then return.

/* CREATE LOGISTICS ACCOUNTING CHARGES */
if use-log-acctg
   and po_tot_terms_code <> ""
   and pod_type = " "
then do:

   if available pt_mstr
   then
      prod-line = pt_prod_line.
   else
      prod-line = "".

   type-po = {&TYPE_PO}.

   for first vd_mstr
      where   vd_domain = global_domain
      and     vd_addr   = po_vend
   no-lock:
      supp-type = vd_type.
   end.

   if p_int_ref_type  = {&TYPE_Return}
   or (p_int_ref_type = {&TYPE_PO} and trqty < 0)
   or (p_int_ref_type = {&TYPE_POShipper} and trqty < 0)
   then do:
      run getLastReceiver(input po_nbr, 
                          input pod_line,
                          input -1,   /*get the last receiver where the qty >= 0*/
                          input-output dParentOid).
      for first prh_hist no-lock where 
         prh_domain = global_domain and
         oid_prh_hist = dParentOid:
      end.

      if avail prh_hist then
      do:

         if not can-find (abs_mstr
                        where abs_domain    = prh_domain
                          and abs_shipfrom  = prh_vend
                          and substring(abs_id,2,20) = prh_ps_nbr)
         then
            assign v_int_ref_type = {&TYPE_PO}
                   v_int_ref      = po_nbr.
         else
            assign v_int_ref_type = {&TYPE_POShipper}
                   v_int_ref      = prh_ps_nbr.

         for first abs_mstr
         where abs_domain = prh_domain 
           and abs_shipfrom = prh_vend
           and substring(abs_par_id,2,20) = prh_ps_nbr
           and abs_order = prh_nbr
           and integer(abs_line) = prh_line no-lock:
         end.

         if available abs_mstr
         then
            v_qty_rcv  = prh_rcvd * decimal(abs__qad03).
         else
            v_qty_rcv  = prh_rcvd * prh_um_conv.
        
         v_prh_receiver = prh_receiver.
      end.
      else do:
         assign v_int_ref_type = {&TYPE_PO}
                v_int_ref      = po_nbr.
      end.

   end.
   else
   if p_int_ref_type = {&TYPE_PO} then
      assign v_int_ref_type = {&TYPE_PO}
             v_int_ref      = po_nbr.
   else
      assign v_int_ref_type = {&TYPE_POShipper}
             v_int_ref      = ps_nbr.

   for each lacd_det
      where lacd_det.lacd_domain            = global_domain
      and   lacd_det.lacd_internal_ref      = v_int_ref
      and   lacd_det.lacd_shipfrom          = po_vend
      and   lacd_det.lacd_internal_ref_type = v_int_ref_type
   exclusive-lock:
       v_pvod_amt = 0.
      if  trqty < 0 and p_int_ref_type <> {&TYPE_PO} then  do:
         for first blacd_det exclusive-lock 
            where blacd_det.lacd_domain = global_domain 
              and blacd_det.lacd_internal_ref = po_nbr 
              and blacd_det.lacd_shipfrom          = po_vend
              and blacd_det.lacd_lc_charge = lacd_det.lacd_lc_charge
              and blacd_det.lacd_internal_ref_type = {&TYPE_PO}:
            assign blacd_det.lacd_lc_amt = 0.
         end.    
      end.

      if is-return then
         account-type = "EXPENSE".
      else
         account-type = "ACCRUAL".

      if using_supplier_consignment
         and ip_consign_flag
         and ip_is_usage
      then do:
         {us/gp/gprunmo.i &module  = "ACN" &program = ""pocnacct.p""
                    &param   = """(input pod_part,
                                  input pod_site,
                                  input po_vend,
                                  output la-acct,
                                  output la-sub,
                                  output la-cc,
                                  output l_offset_acct,
                                  output l_offset_sub,
                                  output l_offset_cc)"""}
      end. /* IF using_supplier_consignment ... */
      else do:

         /* RETRIEVE ACCRUAL OR EXPENSE ACCOUNT */
         {us/gp/gprunmo.i &module = "LA" &program = ""laglacct.p""
                    &param  = """(input type-po,
                                   input account-type,
                                   input lacd_det.lacd_lc_charge,
                                   input prod-line,
                                   input pod_site,
                                   input supp-type,
                                   input '',
                                   output la-acct,
                                   output la-sub,
                                   output la-cc)"""}

         /* When using Legal document, retrieve suspense account 
            for creating the trgl for logistics charge
         */
         if poc_fiscal_confirm then do:
            {us/gp/gprunmo.i &module = "LA" &program = ""laglacct.p""
                       &param  = """(input type-po,
                                      input 'SUSPENSE',
                                      input lacd_det.lacd_lc_charge,
                                      input prod-line,
                                      input pod_site,
                                      input supp-type,
                                      input '',
                                      output la-acct,
                                      output la-sub,
                                      output la-cc)"""}
         end.
         /* RETRIEVE PO PRICE VARIANCE ACCOUNT */
         assign account-po = "POPRICEVAR".
         {us/gp/gprunmo.i &module = "LA" &program = ""laglacct.p""
                    &param  = """(input type-po,
                                   input account-po,
                                   input lacd_det.lacd_lc_charge,
                                   input prod-line,
                                   input pod_site,
                                   input supp-type,
                                   input '',
                                   output la-po_acct,
                                   output la-po_sub,
                                   output la-po_cc)"""}
      end. /* ELSE DO */

      for first in_mstr
         where   in_domain = global_domain
         and     in_part = pod_part
         and     in_site = pod_site
      no-lock: end.

      if not available in_mstr then
         next.
 
       dParentOid = pod_det.oid_pod_det. 

       if lacd_type <> "Bulk" and v_int_ref_type = {&TYPE_PO}
       then do:
          if trqty < 0
          then
             run getLastReceiver(input po_nbr, 
                                 input pod_line,
                                 input 0, /*get the last receiver where the qty > 0*/
                                 input-output dParentOid).
       end.
       for first lacod_det where 
             lacod_det.oid_order_line = dParentOid 
             and lacod_det.oid_lacd_det = lacd_det.oid_lacd_det no-lock:
       end.
       
       if not avail lacod_det then
         next.

      for first spt_det
         where   spt_domain = global_domain
         and     spt_site   = in_gl_cost_site
         and    spt_sim = (if in_gl_set <> "" then in_gl_set else icc_gl_set)
         and     spt_part   = pod_part
         and     spt_element = lacd_det.lacd_element
         no-lock: end.

      if not available spt_det then do:
         create spt_det.
         assign spt_domain = global_domain
                spt_site = in_gl_cost_site
                spt_sim = (if in_gl_set <> "" then in_gl_set else icc_gl_set)
                spt_part = pod_part
                spt_element = lacd_det.lacd_element
                spt_pct_ll = 1.01.
      end. /* IF NOT AVAIL SPT_DET */

      if  transtype = "ISS-PRV"
      or (transtype = "RCT-PO" and trqty < 0)
      then do:

         if glx_mthd = "AVG" then do:
            isPvoAvail = no. 

             for each pvo_mstr no-lock
                where pvo_mstr.pvo_domain            = global_domain
                  and pvo_mstr.pvo_order             =   pod_nbr
                  and pvo_mstr.pvo_internal_ref      = (if v_int_ref_type = {&TYPE_POShipper} then v_int_ref else v_prh_receiver) 
                  and pvo_mstr.pvo_line              = 0 
                  and pvo_mstr.pvo_order_type        = {&TYPE_PO}                 
                  and pvo_mstr.pvo_internal_ref_type = (if v_int_ref_type = {&TYPE_POShipper} then {&TYPE_POShipper} else {&TYPE_POReceiver}) 
                  and pvo_mstr.pvo_lc_charge = lacd_det.lacd_lc_charge,
               each pvod_det no-lock 
               where pvod_domain     = global_domain 
                 and pvod_id         = pvo_id
                 and pvod_order_line = pod_line
                 and pvod_internal_ref_type = {&TYPE_POReceiver}
                 and pvod_internal_ref = v_prh_receiver:
                  v_pvod_amt = v_pvod_amt +
                              (pvod_accrued_amt *
                              (pvod_ex_rate2 / pvod_ex_rate)).
                  isPvoAvail = yes. 
             end.
             v_pvod_amt =  ((v_pvod_amt / v_qty_rcv) * trqty) .

             if isPvoAvail = no and (v_qty_rcv = 0 or trqty < 0) then do:
                if lacd_det.lacd_apportion_method = {&TYPE_PO} then do:
                  assign v_pvod_amt = lacod_det.lacod_lc_amt.
                end.
                else do:
                  assign v_pvod_amt = - lacod_det.lacod_lc_amt.
                end.
             end.
                

         end. /*glx_mthd = "AVG" */
         else
         if glx_mthd = "STD" then do:
            if avail spt_det and (trqty * spt_cst_tl) <> 0 then
               assign v_pvod_amt = trqty * spt_cst_tl.
            lapoAmt = - lacod_det.lacod_lc_amt. 
         end.

         mc-error-number = 0.
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                   "(input-output v_pvod_amt,
                     input        gl_rnd_mthd,
               output mc-error-number)"}

            if mc-error-number <> 0
               then do:
             {us/bbi/pxmsg.i &MSGNUM = mc-error-number &ERRORLEVEL = 3}
            end. /* IF mc-error-number <> 0 */

         if (transtype  = "RCT-PO" and trqty < 0) then do:
            for first blacod_det where
                 blacod_det.oid_order_line = dParentOid and
                 blacod_det.oid_lacd_det   = blacd_det.oid_lacd_det
           exclusive-lock:
              assign
                 blacod_det.lacod_lc_amt = v_pvod_amt
                 blacd_det.lacd_lc_amt =
                 blacd_det.lacd_lc_amt  + blacod_det.lacod_lc_amt.
           end.
         end.
         
      end. /*transtype = "ISS-PRV" */
      else
      do:

         if glx_mthd = "STD" then
         do:
            if avail spt_det then
               assign  v_pvod_amt = trqty * spt_cst_tl.
         end.
         else
         if glx_mthd = "AVG" then
         do:
             /* IF MULTIENTRY */
             if trqty <> pod_qty_chg then
                assign v_pvod_amt = (lacod_det.lacod_lc_amt * trqty) /
                                    pod_qty_chg.
             else
                assign v_pvod_amt = lacod_det.lacod_lc_amt.
         end.
      end.

      if v_pvod_amt <> 0 then
      do:
         trglAmount = v_pvod_amt.
         /* Convert the logistics charge amount using the inventory rate */
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                     "(input  base_curr,
                       input  mgmt_curr,
                       input  mgmt_curr_ex_rate1,
                       input  mgmt_curr_ex_rate2,
                       input  trglAmount,
                       input  true, /* DO ROUND */
                       output trgl_invt_amount,
                       output mc-error-number)"}
               if mc-error-number <> 0
               then do:
                    {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
               end. /* IF mc-error-number <> 0 */
         
         if trgltype = "" then  trgltype = transtype.
         if pod_type = ""
           and glx_mthd = "AVG"
         then
           trgltype = (if using_supplier_consignment
                           and ip_consign_flag
                           and ip_is_usage = no
                        then
                           transtype
                        else
                           "RCT-AVG").

         mc-error-number = 0.
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                      "(input-output trglAmount,
                        input gl_rnd_mthd,
                        output mc-error-number)"}
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end. /* IF mc-error-number <> 0 */

         /* Since we are linking Legal docs and Logistics Accounting *
          * We would create gl transactions during confirmation of   *
          * Fiscal receiving                                         */
          
            {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
                 &PROGRAM='ictrxr.p'
                 &handle = ph_ictrxr
                 &PARAM = "(input tr_trnbr,
                            input clatranstype,
                            input dr_acct[1],
                            input dr_sub[1],
                            input dr_cc[1],
                            input dr_proj[1],
                            input la-acct,
                            input la-sub,
                            input la-cc,
                            input pod_project,
                            input trglAmount,
                            input no, /*create glt_det */
                            input clatranstype,
                            input pod_nbr, /* order #*/
                            input entity[1], /* entity */
                            input eff_date, /* effective date */
                            input same-ref, /* summarize */
                            input icc_mirror, /* audit */
                            input recid(tr_hist),
                            input """", /* inter company ref# */
                            input """", /* currency */
                            input 0,    /* exchange rate */
                            input 0,    /* exchange rate 2 */
                            input """", /* exchange rate type */
                            input 0,   /* currency amount */
                            input-output ref, /* glt_ref */
                            output oidTrglDet
                           )"
                 &NOAPPERROR=true
                 &CATCHERROR=true}
   
            for first trgl_det exclusive-lock 
               where trgl_det.oid_trgl_det = oidTrglDet:
            end.   
   
            assign la-trans-nbr = tr_trnbr.
   
            if available trgl_det then do:
   
               assign trgl_type    = clatranstype
                            recno        = recid(trgl_det)
                              trgl__qadc01 = lacd_det.lacd_lc_charge. 
   
               /* Create only the GLT_DET record */
               {us/px/pxrun.i &PROC  = 'createGltDetRecord'
                              &PROGRAM='ictrxr.p'
                              &handle = ph_ictrxr
                              &PARAM =  "(input trglAmount,
                                          input trgl_type,
                                          input pod_nbr,
                                          input trgl_dr_acct,
                                          input trgl_dr_sub,
                                          input trgl_dr_cc,
                                          input trgl_dr_proj,
                                          input trgl_cr_acct,
                                          input trgl_cr_sub,
                                          input trgl_cr_cc,
                                          input trgl_cr_proj,
                                          input entity[1],
                                          input eff_date,
                                          input same-ref,
                                          input icc_mirror,
                                          input recid(trgl_det),
                                          input recid(tr_hist),
                                          input pIntercoRef,
                                          input pMgmtCurr,
                                          input pMgmtExRate,
                                          input pMgmtExRate2,
                                          input pMgmtExRateType,
                                          input trgl_invt_amount,
                                          input-output ref)"
                              &NOAPPERROR=true
                              &CATCHERROR=true}           
             end. /* if available trgl_det then do */
     
         
      end. /* if v_pvod_amt <> 0 */

      v_pvod_amt = 0.
      if glx_mthd = "STD"  then
      do:
         /* We are going to work on PPV on Logistics charge */
         if transtype = "ISS-PRV"
           or (transtype = "RCT-PO" and trqty < 0)
             then do: 
             isPvoAvail = no. 
             for each pvo_mstr no-lock
                where pvo_mstr.pvo_domain            = global_domain
                  and pvo_mstr.pvo_order             =   pod_nbr
                  and pvo_mstr.pvo_internal_ref      =  (if v_int_ref_type = {&TYPE_POShipper} then v_int_ref else v_prh_receiver)
                  and pvo_mstr.pvo_line              =  0
                  and pvo_mstr.pvo_order_type        = {&TYPE_PO}                 
                  and pvo_mstr.pvo_internal_ref_type = (if v_int_ref_type = {&TYPE_POShipper} then {&TYPE_POShipper} else {&TYPE_POReceiver})
                  and pvo_mstr.pvo_lc_charge = lacd_det.lacd_lc_charge,
               each pvod_det no-lock 
               where pvod_domain     = global_domain 
                 and pvod_id         = pvo_id
                 and pvod_order_line = pod_line
                 and pvod_internal_ref_type = {&TYPE_POReceiver}
                 and pvod_internal_ref= v_prh_receiver:

               isPvoAvail = yes. 
               assign v_pvod_amt = v_pvod_amt +
                                     (pvod_accrued_amt *
                                     (pvod_ex_rate2 / pvod_ex_rate)).
            end. /* for each pvod_amt */

            if isPvoAvail = no and (v_qty_rcv = 0 or trqty < 0) then do: 
                assign v_pvod_amt = lacod_det.lacod_lc_amt.
            end.

            mc-error-number = 0.
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                      "(input-output v_pvod_amt,
                        input        gl_rnd_mthd,
                        output       mc-error-number)"}

            if mc-error-number <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM = mc-error-number &ERRORLEVEL = 3}
            end. /* IF mc-error-number <> 0 */

            if v_qty_rcv <> 0 then do: 
                if avail spt_det
                then
                  assign v_pvod_amt =((v_pvod_amt / v_qty_rcv) * trqty) -
                                       (trqty * spt_cst_tl).
                else
                  assign v_pvod_amt =((v_pvod_amt / v_qty_rcv) * trqty).
            end.
            else do:
               if avail spt_det then do:
                  /* LA Apportion = 01 */
                  if (lapoAmt + (trqty * spt_cst_tl)) <> 0 then do:
                     assign v_pvod_amt = lapoAmt - (trqty * spt_cst_tl).
                  end.
                  else do:
                     assign v_pvod_amt = 0.
                  end.
               end.
            end.

         end. /* transtype*/
         else do:
            v_pvod_amt = 0.

            if avail spt_det then
            do:
               /* MULTI ENTRY OR USED ALTERNATE UM */
               if trqty <> pod_qty_chg 
               then do:
                  if lacd_det.lacd_type = "UNIT"
                  then
                     /* FORMULA FOR UNIT */
                     v_pvod_amt = (((trqty * lacod_det.lacod_lc_amt) / 
                                    pod_qty_chg) - (trqty * spt_cst_tl)).

                  if lacd_det.lacd_type = "BULK"
                  then do:
                     /* WHEN MUTIENTRY, FOR FIRST TIME RECEIPT, IF FIRST LOT 
                        ALREADY PROCESSED, THEN VARAINCE CONSIDERING ENTIRE 
                        CHARGE IS ALREADY PASSED, HENCE DO NOT CONSIDER 
                        lacod_det.lacod_lc_amt FOR SUCCESSIVE LOTS*/
                     if l_same_lot 
                     then 
                        v_pvod_amt = - (trqty * spt_cst_tl).

                     /* PROCESSING FIRST LOT OR PROCESSING SUCCESSIVE RECEIVER. */
                     /* IF LOGISTICS CHARGE WAS NOT MODIFIED IN PO THEN,        */ 
                     /* FOR SUCESSIVE RECEIVERS lacod_det.lacod_lc_amt IS       */
                     /* ALREADY SET TO 0                                        */
                     else 
                        v_pvod_amt = ((lacod_det.lacod_lc_amt) -
                                      (trqty * spt_cst_tl)).
                  end. /* IF lacd_det.lacd_type = "BULK" */
               end.   /* IF trqty <> pod_qty_chg */
               else
                  v_pvod_amt = ((lacod_det.lacod_lc_amt) -
                                (trqty * spt_cst_tl)).
            end.  /* IF AVAIL spt_det */
            else do:
               if lacod_det.lacod_lc_amt = 0 then v_pvod_amt = 0.
               else v_pvod_amt = lacod_Det.lacod_lc_amt.
            end.
         end.
         trglAmount = v_pvod_amt.
         if v_pvod_amt <> 0 then
         do:
            mc-error-number = 0.
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                            "(input-output trglAmount,
                              input        gl_rnd_mthd,
                              output       mc-error-number)"}
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end. /* IF mc-error-number <> 0 */

            /* Convert the logistics charge amount using the inventory rate */
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                     "(input  base_curr,
                       input  mgmt_curr,
                       input  mgmt_curr_ex_rate1,
                       input  mgmt_curr_ex_rate2,
                       input  trglAmount,
                       input  true, /* DO ROUND */
                       output trgl_invt_amount,
                       output mc-error-number)"}
                                
               
            if mc-error-number <> 0
               then do:
                {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end. /* IF mc-error-number <> 0 */
            /* Since we are linking Legal docs and Logistics Accounting *
             * We would create gl transactions during confirmation of   *
             * Fiscal receiving                                         */

            /* PPV would not be calculated when fiscal confirmation is yes,
             * values are added to inventory accounts from the standard cost
             * to keep operational cost valuation reports and trial balance
             * in sync
             */
            if poc_ctrl.poc_fiscal_confirm = no
            then do:  
               {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
                     &PROGRAM='ictrxr.p'
                     &handle = ph_ictrxr
                     &PARAM = "(input tr_trnbr,
                                input clatranstype,
                                input la-po_acct,
                                input la-po_sub,
                                input la-po_cc,
                                input pod_project,
                                input la-acct,
                                input la-sub,
                                input la-cc,
                                input pod_project,
                                input trglAmount,
                                input no, /*create glt_det */
                                input clatranstype,
                                input pod_nbr, /* order #*/
                                input entity[1], /* entity */
                                input eff_date, /* effective date */
                                input same-ref, /* summarize */
                                input icc_mirror, /* audit */
                                input recid(tr_hist),
                                input """", /* inter company ref# */
                                input """", /* currency */
                                input 0,    /* exchange rate */
                                input 0,    /* exchange rate 2 */
                                input """", /* exchange rate type */
                                input 0,   /* currency amount */
                                input-output ref, /* glt_ref */
                                output oidTrglDet
                                )"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
                       
               for first trgl_det exclusive-lock where
                  trgl_det.oid_trgl_det = oidTrglDet:
               end.
   
               if available trgl_det 
               then do:
   
                  assign trgl_type = clatranstype
                         recno = recid(trgl_det)
                         trgl__qadc01 = lacd_det.lacd_lc_charge. 
                  /* Create only the GLT_DET record */
                  {us/px/pxrun.i &PROC  = 'createGltDetRecord'
                                 &PROGRAM='ictrxr.p'
                                 &handle = ph_ictrxr
                                 &PARAM =  "(input trglAmount,
                                             input trgl_type,
                                             input pod_nbr,
                                             input trgl_dr_acct,
                                             input trgl_dr_sub,
                                             input trgl_dr_cc,
                                             input trgl_dr_proj,
                                             input trgl_cr_acct,
                                             input trgl_cr_sub,
                                             input trgl_cr_cc,
                                             input trgl_cr_proj,
                                             input entity[1],
                                             input eff_date,
                                             input same-ref,
                                             input icc_mirror,
                                             input recid(trgl_det),
                                             input recid(tr_hist),
                                             input pIntercoRef,
                                             input pMgmtCurr,
                                             input pMgmtExRate,
                                             input pMgmtExRate2,
                                             input pMgmtExRateType,
                                             input trgl_invt_amount,
                                             input-output ref)"
                                   &NOAPPERROR=true
                                   &CATCHERROR=true}        
                   
               end. /* if available trgl_det then do */   
            end. /* if poc_ctrl.poc_fiscal_confirm = no */
         end.
      end.    /*if glx_mthd = "STD" */
      
         if pod_entity <> pod_po_entity
         then do:

            /* RETRIEVE INTER-COMPANY ACCOUNT IN INVENTORY DATABASE*/
            {us/gp/gprunmo.i &module  = "LA" &program = ""laglacct.p""
                       &param = """(input type-po,
                                    input 'ICO-CR',
                                    input pod_entity,
                                    input '',
                                    input '',
                                    input '',
                                    input '',
                                    output ico-acct,
                                    output ico-sub,
                                    output ico-cc)"""}

            cIntercoRef = cInitialIntercoRef.

           v_pvod_amt = 0.

           if  transtype = "ISS-PRV"
           or (transtype = "RCT-PO" and trqty < 0)
           then do:
              if glx_mthd = "AVG" then do:
                 isPvoAvail = no. 
                 for each pvo_mstr no-lock
                    where pvo_mstr.pvo_domain            = global_domain
                    and pvo_mstr.pvo_order             =   pod_nbr
                    and pvo_mstr.pvo_internal_ref       =  (if v_int_ref_type = {&TYPE_POShipper} then v_int_ref else v_prh_receiver) 
                    and pvo_mstr.pvo_line              = 0 
                    and pvo_mstr.pvo_order_type        = {&TYPE_PO}                 
                    and pvo_mstr.pvo_internal_ref_type = (if v_int_ref_type = {&TYPE_POShipper} then {&TYPE_POShipper} else {&TYPE_POReceiver})
                    and pvo_mstr.pvo_lc_charge = lacd_det.lacd_lc_charge,
                    each pvod_det no-lock 
                    where pvod_domain     = global_domain 
                      and pvod_id         = pvo_id
                      and pvod_order_line = pod_line
                      and pvod_internal_ref_type = {&TYPE_POReceiver}
                      and pvod_internal_ref= v_prh_receiver:
                     v_pvod_amt = v_pvod_amt +
                                 (pvod_accrued_amt *
                                 (pvod_ex_rate2 / pvod_ex_rate)).
                     isPvoAvail = yes . 

                 end.

                if isPvoAvail = no and (v_qty_rcv = 0 or trqty < 0) then do:
                   assign v_pvod_amt = lacod_det.lacod_lc_amt.
                end.


              end. /*glx_mthd = "AVG" */
              else
              if glx_mthd = "STD" then do:
                 if avail spt_det and (trqty * spt_cst_tl) <> 0 then
                 assign v_pvod_amt = trqty * spt_cst_tl.
              end.

              mc-error-number = 0.
              {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                   "(input-output v_pvod_amt,
                     input        gl_rnd_mthd,
                     output       mc-error-number)"}

              if mc-error-number <> 0
              then do:
                 {us/bbi/pxmsg.i &MSGNUM = mc-error-number &ERRORLEVEL = 3}
              end. /* IF mc-error-number <> 0 */
           end. /*transtype = "ISS-PRV" */
           else
           do:
              if glx_mthd = "STD" then
              do:
                 if avail spt_det then
                    assign  v_pvod_amt = trqty * spt_cst_tl.
              end.
              else
              if glx_mthd = "AVG" then
              do:
                 /* IF MULTIENTRY */
                 if trqty <> pod_qty_chg then
                   assign v_pvod_amt = (lacod_Det.lacod_lc_amt * trqty) /
                                       pod_qty_chg.
                 else
                   assign v_pvod_amt = lacod_det.lacod_lc_amt.
              end.
           end.

           if v_pvod_amt <> 0 then
           do:

            assign trgl_gl_amt = v_pvod_amt.
               /* ROUND PER BASE CURRENCY ROUND METHOD */
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                         "(input-output trglAmount,
                           input gl_rnd_mthd,
                           output mc-error-number)"}
              /* Since we are linking Legal docs and Logistics Accounting *
              * We would create gl transactions during confirmation of   *
              * Fiscal receiving                                         */
 
              if poc_ctrl.poc_fiscal_confirm = no
              then do:  
                 {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
                   &PROGRAM='ictrxr.p'
                   &handle = ph_ictrxr
                   &PARAM = "(input tr_trnbr,
                              input clatranstype,
                              input la-acct,
                              input la-sub,
                              input la-cc,
                              input dr_proj[6],
                              input ico-acct,
                              input ico-sub,
                              input ico-cc,
                              input pod_project,
                              input trglAmount,
                              input yes, /*create glt_det */
                              input clatranstype,
                              input podnbr, /* order #*/
                              input pod_entity, /* entity */
                              input eff_date, /* effective date */
                              input same-ref, /* summarize */
                              input icc_mirror, /* audit */
                              input recid(tr_hist),
                              input cIntercoRef, /* inter company ref# */
                              input pMgmtCurr, /* currency */
                              input pMgmtExRate,    /* exchange rate */
                              input pMgmtExRate2,    /* exchange rate 2 */
                              input pMgmtExRateType, /* exchange rate type */
                              input gl_mgmt_curr_amt[6],   /* currency amount */
                              input-output ref,
                              output oidTrglDet
                             )"
                   &NOAPPERROR=true
                   &CATCHERROR=true}
   
                 for first trgl_det exclusive-lock where
                    trgl_det.oid_trgl_det = oidTrglDet:
                 end.
   
                 if available trgl_det then
                    assign  recno = recid(trgl_det)
                            trgl__qadc01 = lacd_det.lacd_lc_charge.
   
   
                 assign
                    amount  = trglAmount
                    charge  = lacd_det.lacd_lc_charge
                    podsite = pod_site.
              end. /* if poc_ctrl.poc_fiscal_confirm ... */
           end. /*if v_pvod_amt <> 0*/

           v_pvod_amt = 0.
           if glx_mthd = "STD"  then
           do:

              if  transtype = "ISS-PRV"
              or (transtype = "RCT-PO" and trqty < 0)
              then do:
                 isPvoAvail = no. 
                 for each pvo_mstr no-lock
                    where pvo_mstr.pvo_domain          = global_domain
                    and pvo_mstr.pvo_order             =  pod_nbr
                    and pvo_mstr.pvo_internal_ref      = (if v_int_ref_type = {&TYPE_POShipper} then v_int_ref else v_prh_receiver) 
                    and pvo_mstr.pvo_line              =  0 
                    and pvo_mstr.pvo_order_type        = {&TYPE_PO}                 
                    and pvo_mstr.pvo_internal_ref_type = (if v_int_ref_type = {&TYPE_POShipper} then {&TYPE_POShipper} else {&TYPE_POReceiver}) 
                    and pvo_mstr.pvo_lc_charge = lacd_det.lacd_lc_charge,
                    each pvod_det no-lock 
                    where pvod_domain     = global_domain 
                      and pvod_id         = pvo_id
                      and pvod_order_line = pod_line
                      and pvod_internal_ref_type = {&TYPE_POReceiver}
                      and pvod_internal_ref= v_prh_receiver:
                        assign v_pvod_amt = v_pvod_amt +
                                     (pvod_accrued_amt *
                                     (pvod_ex_rate2 / pvod_ex_rate)).
                     isPvoAvail = yes. 
                 end. /* for each pvod_amt */

                if isPvoAvail = no and (v_qty_rcv = 0 or trqty < 0) then do: 
                   assign v_pvod_amt = lacod_det.lacod_lc_amt.
                end.

                 mc-error-number = 0.
                 {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                      "(input-output v_pvod_amt,
                        input        gl_rnd_mthd,
                        output       mc-error-number)"}

                 if mc-error-number <> 0
                 then do:
                    {us/bbi/pxmsg.i &MSGNUM = mc-error-number &ERRORLEVEL = 3}
                 end. /* IF mc-error-number <> 0 */

                 if v_qty_rcv <> 0 then do:  
                     if avail spt_det
                     then
                        assign v_pvod_amt =((v_pvod_amt / v_qty_rcv) * trqty) -
                                       (trqty * spt_cst_tl).
                     else
                        assign v_pvod_amt =((v_pvod_amt / v_qty_rcv) * trqty).

                 end.
                 else do:
                    if avail spt_det then do:
                       /* LA Apportion = 01 */
                       if (lapoAmt + (trqty * spt_cst_tl)) <> 0 then do:
                          assign v_pvod_amt = lapoAmt - (trqty * spt_cst_tl).
                       end.
                       else do:
                          assign v_pvod_amt = 0.
                       end.
                    end.
                 end.

              end. /* transtype*/
              else do:
                 v_pvod_amt = 0.
                 if avail spt_det 
                 then do: 
                    assign
                       v_pvod_amt = ((lacod_det.lacod_lc_amt) -
                                     (trqty * spt_cst_tl)).
                 end.
                 else do:
                    if lacod_Det.lacod_lc_amt = 0 then v_pvod_amt = 0.
                    else v_pvod_amt = lacod_det.lacod_lc_amt.
                 end.
              end.

              trglAmount = v_pvod_amt.
              /* ROUND PER BASE CURRENCY ROUND METHOD */
              {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                   "(input-output trglAmount, 
                     input gl_rnd_mthd,
                     output mc-error-number)"}
                     
              if v_pvod_amt <> 0 then
              do:
                 /* Since we are linking Legal docs and Logistics Accounting *
                  * We would create gl transactions during confirmation of   *
                  * Fiscal receiving                                         */
                   
                 if poc_ctrl.poc_fiscal_confirm = no
                 then do:    
                    {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
                      &PROGRAM='ictrxr.p'
                      &handle = ph_ictrxr
                      &PARAM = "(input tr_trnbr,
                                 input clatranstype,
                                 input la-acct,
                                 input la-sub,
                                 input la-cc,
                                 input dr_proj[6],
                                 input ico-acct,
                                 input ico-sub,
                                 input ico-cc,
                                 input pod_project,
                                 input trglAmount,
                                 input yes, /*create glt_det */
                                 input clatranstype,
                                 input podnbr, /* order #*/
                                 input pod_entity, /* entity */
                                 input eff_date, /* effective date */
                                 input same-ref, /* summarize */
                                 input icc_mirror, /* audit */
                                 input recid(tr_hist),
                                 input cIntercoRef, /* inter company ref# */
                                 input pMgmtCurr, /* currency */
                                 input pMgmtExRate,    /* exchange rate */
                                 input pMgmtExRate2,    /* exchange rate 2 */
                                 input pMgmtExRateType, /* exchange rate type */
                                 input gl_mgmt_curr_amt[6],   /* currency amount */
                                 input-output ref,
                                 output oidTrglDet
                                )"
                      &NOAPPERROR=true
                      &CATCHERROR=true}
                     
                    for first trgl_det exclusive-lock where
                        trgl_det.oid_trgl_det = oidTrglDet:
                    end.
   
                    if available trgl_det then
                        assign  recno = recid(trgl_det)
                                trgl__qadc01 = lacd_det.lacd_lc_charge. 
   
                 end. /* if poc_ctrl.poc_fiscal_confirm ..... */
              end. 
           end.    /*if glx_mthd = "STD" */

           /* Since we are linking Legal docs and Logistics Accounting *
            * We would create gl transactions during confirmation of   *
            * Fiscal receiving                                         */
                     
           if trglAmount <> 0 and poc_ctrl.poc_fiscal_confirm = no then do:
           
               /* RETRIEVE INTER-COMPANY ACCOUNT IN ORDER DATABASE*/
              {us/gp/gprunmo.i &module = "LA" &program = ""laglacct.p""
                               &param  = """(input type-po,
                                             input 'ICO-DR',
                                             input pod_po_entity,
                                             input '',
                                             input '',
                                             input '',
                                             input '',
                                             output ico-acct,
                                             output ico-sub,
                                             output ico-cc)"""}

              cIntercoRef = cInitialIntercoRef.
           
              /* RETRIEVE ACCRUAL OR EXPENSE ACCOUNT IN ORDER DATABASE*/
              {us/gp/gprunmo.i &module = "LA" &program = ""laglacct.p""
                               &param  = """(input type-po,
                                             input account-type,
                                             input charge,
                                             input prod-line,
                                             input podsite,
                                             input supp-type,
                                             input '',
                                             output la-acct,
                                             output la-sub,
                                             output la-cc)"""}
           
                 {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
                                &PROGRAM='ictrxr.p'
                                &handle = ph_ictrxr
                                &PARAM = "(input tr_trnbr,
                                           input clatranstype,
                                           input ico-acct,
                                           input ico-sub,
                                           input ico-cc,
                                           input dr_proj[6],
                                           input la-acct,
                                           input la-sub,
                                           input la-cc,
                                           input pod_project,
                                           input trglAmount,
                                           input yes, /*create glt_det */
                                           input clatranstype,
                                           input podnbr, /* order #*/
                                           input pod_po_entity, /* entity */
                                           input eff_date, /* effective date */
                                           input same-ref, /* summarize */
                                           input icc_mirror, /* audit */
                                           input recid(tr_hist),
                                           input cIntercoRef, /* inter company ref# */
                                           input pMgmtCurr, /* currency */
                                           input pMgmtExRate,    /* exchange rate */
                                           input pMgmtExRate2,    /* exchange rate 2 */
                                           input pMgmtExRateType, /* exchange rate type */
                                           input gl_mgmt_curr_amt[6],   /* currency amount */
                                           input-output ref,
                                           output oidTrglDet
                                           )"
                                &NOAPPERROR=true
                                &CATCHERROR=true}
                  
              for first trgl_det exclusive-lock where
                 trgl_det.oid_trgl_det = oidTrglDet:
                 assign
                    recno = recid(trgl_det)
                    trgl__qadc01 = lacd_det.lacd_lc_charge.    
              end.
              trglAmount = 0.
              
           end. /*if trglAmount <> 0 then do:*/
      end. /*if pod_entity <> pod_po_entity**/

   end. /* for each lacd_det */

end. /* if use-log-acctg */

end. /*if transtype = "RCT-PO" and not git-stat*/

/*TRANSFER INVENTORY ITEMS FROM THE POD SITE TO THE INPUT SITE*/
/*NOTE: AS OF 7.4 I DON'T THINK THAT HIS CAN HAPPEN - PMA     */
/* DO NOT TRANSFER FOR LOGISTICS ACCOUNTING PO SHIPPER GIT RECEIPT PROGRAM */
if not lagit then
if pod_type = ""
   and site <> rct_site
   or (use-log-acctg 
       and git-stat)
then do:

   assign
      global_part = pod_part
      global_addr = po_vend.

   /* IF GOODS IN TRANSIT THEN SI_GIT_LOCATION NEEDS TO BE PASSED */
   /* AS THE FROM LOCATION INTO ICXFER.P AND ICXFER1.P            */
   if git-stat then
      git-loc = si_git_location.
   else
      git-loc = pod_loc.

   /* SINCE THE PROGRAM ICXFER.P DOES NOT ACCEPT THE PO LINE      */
   /* NUMBER AS A PARAMETER, THE TR_HIST FOR THE ISS-TR AND       */
   /* RCT-TR TRANSACTIONS GET CREATED WITH TR_LINE AS 0. THIS     */
   /* CAUSES PROBLEMS WHILE PRINTING PO RECEIVER SINCE THE        */
   /* LOT-SERIAL/LOCATION DETAILS ARE OBTAINED FROM THE TR_HIST   */
   /* HENCE ICXFER1.P HAS BEEN CREATED WHICH IS A CLONE OF        */
   /* ICXFER.P ACCEPTING THE POD_LINE ALSO AS INPUT. THE PO       */
   /* RECEIPT FUNCTIONS WILL USE ICXFER1.P INSTEAD OF ICXFER.P TO */
   /* CREATE ISS-TR AND RCT-TR TRANSACTIONS. OTHER PROGRAMS       */
   /* WILL CONTINUE TO USE ICXFER.P                               */
   if trqty >= 0
      and (right-trim(po_fsm_type) = ""
      or   right-trim(po_fsm_type) = "RTS")
   then do:

      {us/ca/cacratpr.i &eff_date_attr=eff_date}

      /* Prepare the data for the transfer. */
      {us/px/pxrun.i &PROC='prepareData4TemporaryTransfer'
                     &PROGRAM='caicxr.p'
                     &HANDLE=ph_caicxr
                     &PARAM="(input {&AUTO_TRANSFER_PARENT_OID_RCT},
                              input pod_part,
                              input rct_site,
                              input git-loc,
                              input lotser,
                              input lotref,
                              input site,
                              input location,
                              input lotser,
                              input lotref,
                              input table tt_attr_parameter by-reference,
                              input-output table tt_attr_pfvalue by-reference,
                              input-output table tt_attrdh_hist by-reference)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
      }

      {us/bbi/gprun.i ""icxfer1z.p""
               "(input receivernbr,
                 input lotser,
                 input lotref,
                 input lotref,
                 input trqty,
                 input pod_nbr,
                 input pod_line,
                 input pod_so_job,
                 input """",
                 input cr_proj[1],
                 input eff_date,
                 input rct_site,
                 input git-loc,
                 input site,
                 input location,
                 input no,
                 input """",
                 input ?,
                 input """",
                 input kbtransnbr,
                 output glcost,
                 output iss_trnbr,
                 output rct_trnbr,
                 input-output assay,
                 input-output grade,
                 input-output expire)"}

      {us/px/pxrun.i &PROC='saveInvAttrValue4InvTransfer'
                     &PROGRAM='caicxr.p'
                     &HANDLE=ph_caicxr
                     &PARAM="(input {&AUTO_TRANSFER_PARENT_OID_RCT},
                              input-output table tt_attr_pfvalue by-reference)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
      }

      /* Save the new attribute value to DB as history for issue and receipt side. */
      {us/px/pxrun.i &PROC='recordAttrHistChanged4InvTransfer'
                     &PROGRAM='cahistxr.p'
                     &HANDLE=ph_cahistxr
                     &PARAM="(input {&AUTO_TRANSFER_PARENT_OID_ISS},
                              input {&AUTO_TRANSFER_PARENT_OID_RCT},
                              input iss_trnbr,
                              input rct_trnbr,
                              input yes,
                              input table tt_attr_pfvalue by-reference,
                              input-output table tt_attrdh_hist by-reference)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
      }

   end. /* IF trqty >= 0 AND RIGHT-TRIM(po_fsm_type) = ""  */

   else
   if right-trim(po_fsm_type) <> "" then do:
      {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
               &PARAM = "(input  global_part,
                         input  rct_site,
                         input ""pt_loc"",
                         output l_pt_loc)"
               &NOAPPERROR = true
               &CATCHERROR = true}

      {us/bbi/gprun.i ""icxferz.p""
               "(input receivernbr,
                 input lotser,
                 input lotref,
                 input lotref,
                 input trqty,
                 input pod_nbr,
                 input pod_so_job,
                 input """",
                 input cr_proj[1],
                 input eff_date,
                 input rct_site,
                 input git-loc,
                 input site,
                 input location,
                 input no,
                 input """",
                 input ?,
                 input """",
                 input kbtransnbr,
                 input srvendlot,
                 output glcost,
                 output iss_trnbr,
                 output rct_trnbr,
                 output trans_nbr,
                 input-output assay,
                 input-output grade,
                 input-output expire)"}
   end. /* IF RIGHT-TRIM(po_fsm_type> <>  ""  */

   for first tr_hist
      where   tr_domain = global_domain
      and     tr_trnbr  = trans_nbr
   no-lock: end.

end. /* IF POD_TYPE = "" AND SITE <> RCT_SITE */

/*CHANGE ATTRIBUTES*/
if available tr_hist then do:

   find first attr_wkfl where chg_line = string(pod_line) exclusive-lock no-error.

   if available attr_wkfl
      and pod_type = ""
      and (pod_fsm_type <> "RTS-ISS"
             or l_ldnotavail = yes)
   then do:
      {us/bbi/gprun.i ""porcat03.p""
               "(input recid(tr_hist),
                 input tr_recno,
                 input pod_part,
                 input eff_date,
                 input-output chg_assay,
                 input-output chg_grade,
                 input-output chg_expire,
                 input-output chg_status,
                 input assay_actv,
                 input grade_actv,
                 input expire_actv,
                 input status_actv)"}
   end.

end.

unsubscribe to "checkAttributeValuesEntered".

PROCEDURE p-price-configuration:
/* OBTAIN COST OF COMPONENT ITEMS FOR AN EMT PO */
   define variable l_qty_req like sob_qty_req no-undo.

   l_glxcst = 0.

   for first sod_det where sod_domain = global_domain
      and sod_nbr    = po_mstr.po_so_nbr
      and sod_line   = pod_det.pod_sod_line
      and sod_compl_stat = ""
   no-lock:

      for each sob_det where sob_domain = global_domain
         and sob_nbr    = sod_nbr
         and sob_line   = sod_line
      no-lock break by sob_part:

         if first-of(sob_part) then
            l_qty_req = 0.

         if substring(sob_serial,15,1) = "o" then
            l_qty_req = l_qty_req + sob_qty_req.

         if last-of(sob_part) and
            l_qty_req <> 0
         then do:
            {us/bbi/gprun.i ""gpsct05.p""
                     "(input sob_part,
                       input sob_site,
                       input 1,
                       output glxcst,
                       output curcst)"}

            assign
               glxcst = glxcst * (sob_qty_req / sod_qty_ord)
               l_glxcst = l_glxcst + glxcst.
         end. /* IF LAST-OF (SOB_PART) ... */

      end. /* FOR EACH SOB_DET */

   end. /* FOR FIRST SOD_DET */

END PROCEDURE.

PROCEDURE getLastReceiver:
   /*Find the last receiver for the PO and line.*/
   
   define input parameter PoNbr like po_nbr no-undo.
   define input parameter PodLine like pod_line no-undo.
   define input parameter greaterThanQty as integer no-undo.
   define input-output parameter ParentOid as decimal no-undo. 
   
   define variable receivernbr like prh_receiver no-undo.
   
   define buffer prh_hist for prh_hist.
     
   for last prh_hist no-lock where 
      prh_domain = global_domain and
      prh_nbr = PoNbr and 
      prh_line = PodLine and
      prh_rcvd > greaterThanQty and
      prh_rcp_date <> ? 
      use-index prh_rcp_date:
      ParentOid = oid_prh_hist. 
   end.

END PROCEDURE.          

/*-----------------------------------------------------------------------
Purpose: To check if the Attribute values are entered during Receipts.
Parameters:   <None>
Notes:
-----------------------------------------------------------------------*/
PROCEDURE checkAttributeValuesEntered:
   define output parameter p_disp_msg as logical no-undo.

   for each tt_attr_pfvalue
      where tt_oid_attrpf_mstr           = oidParent
      and   tt_attrpfd_inv_update_level <> {&INVENTORY_UPDATE_ITEM}
   no-lock:
      if tt_attrpfd_req
         and tt_attrpfd_value_entered
      then
         p_disp_msg = no.
      else if not tt_attrpfd_req
      then
         p_disp_msg = no.
      else do:
         p_disp_msg = yes.
         leave.
      end. /* ELSE DO */
   end. /* FOR EACH tt_attr_pfvalue */

END PROCEDURE.
