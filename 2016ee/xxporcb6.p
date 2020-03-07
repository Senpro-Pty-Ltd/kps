/* xxporcb6.p - PURCHASE ORDER RECEIPT W/ SERIAL NUMBER CONTROL               */
/* poporcb6.p - PURCHASE ORDER RECEIPT W/ SERIAL NUMBER CONTROL               */
 /* Copyright 1986 QAD Inc. All rights reserved.                            */
/* $Id: xxporcb6.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* REVISION: 7.4      LAST MODIFIED: 03/25/94   BY: dpm *FM94*                */
/* REVISION: 7.4      LAST MODIFIED: 04/12/94   BY: bcm *H336*                */
/* REVISION: 7.4      LAST MODIFIED: 08/01/94   BY: dpm *H466*                */
/* REVISION: 7.4      LAST MODIFIED: 09/26/94   BY: bcm *H539*                */
/* REVISION: 7.4      LAST MODIFIED: 10/31/94   BY: ame *GN82*                */
/* REVISION: 8.5      LAST MODIFIED: 10/31/94   BY: taf *J038*                */
/* REVISION: 7.4      LAST MODIFIED: 11/17/94   BY: bcm *GO37*                */
/* REVISION: 7.4      LAST MODIFIED: 02/16/95   BY: jxz *F0JC*                */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.4      LAST MODIFIED: 10/09/95   BY: ais *G0YP*                */
/* REVISION: 7.4      LAST MODIFIED: 11/09/95   BY: jym *G1BR*                */
/* REVISION: 8.5      LAST MODIFIED: 10/09/95   BY: taf *J053*                */
/* REVISION: 7.4      LAST MODIFIED: 01/09/96   BY: emb *G1GX*                */
/* REVISION: 7.4      LAST MODIFIED: 01/09/96   BY: ais *G1JL*                */
/* REVISION: 8.5      LAST MODIFIED: 02/15/96   BY: tjs *J0CZ*                */
/* REVISION: 8.6      LAST MODIFIED: 09/03/96   BY: jzw *K008*                */
/* REVISION: 8.6      LAST MODIFIED: 10/18/96   BY: *K003* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 11/25/96   BY: *K01X* Jeff Wootton       */
/* REVISION: 8.6      LAST MODIFIED: 01/08/97   BY: *H0QF* Sue Poland         */
/* REVISION: 8.6      LAST MODIFIED: 03/05/97   BY: *H0SW* Robin McCarthy     */
/* REVISION: 8.6      LAST MODIFIED: 04/18/97   BY: *H0Y5* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 04/24/97   BY: *H0YF* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 02/09/98   BY: *H1JJ* Sandesh Mahagaokar */
/* REVISION: 8.6E     LAST MODIFIED: 04/21/98   BY: *H1KV* Samir Bavkar       */
/* REVISION: 8.6E     LAST MODIFIED: 06/17/98   BY: *L020* Charles Yen        */
/* REVISION: 8.6E     LAST MODIFIED: 08/18/98   BY: *J2WM* Aruna Patil        */
/* REVISION: 8.6E     LAST MODIFIED: 09/30/98   BY: *H1NB* Seema Varma        */
/* REVISION: 8.6E     LAST MODIFIED: 11/02/98   BY: *H1N8* Felcy D'Souza      */
/* REVISION: 9.0      LAST MODIFIED: 04/16/99   BY: *J2DG* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 06/30/99   BY: *J3HK* Kedar Deherkar     */
/* REVISION: 9.0      LAST MODIFIED: 09/03/99   BY: *K22C* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* PATTI GAULTNEY     */
/* REVISION: 9.1      LAST MODIFIED: 10/25/99   BY: *M0F5* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 11/17/99   BY: *N04H* Vivek Gogte        */
/* REVISION: 9.1      LAST MODIFIED: 01/11/00   BY: *J3N7* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Thelma Stronge     */
/* REVISION: 9.1      LAST MODIFIED: 04/11/00   BY: *N090* Luke Pokic         */
/* REVISION: 9.1      LAST MODIFIED: 06/08/00   BY: *M0ND* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 10/04/00   BY: *M0SQ* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 10/12/00   BY: *N0H2* Vivek Gogte        */
/* REVISION: 9.1      LAST MODIFIED: 10/06/00   BY: *N0WT* Mudit Mehta        */
/* Revision: 1.38     BY: Katie Hilbert            DATE: 04/01/01 ECO: *P002* */
/* Revision: 1.39     BY: Nikita Joshi             DATE: 04/20/01 ECO: *L17B* */
/* Revision: 1.40     BY: Niranjan Ranka           DATE: 07/12/01 ECO: *P00L* */
/* Revision: 1.41     BY: Irine Fernandes          DATE: 10/22/01 ECO: *M1N4* */
/* Revision: 1.43     BY: Dipesh Bector            DATE: 12/22/01 ECO: *M1S7* */
/* Revision: 1.44     BY: Kirti Desai              DATE: 02/22/02 ECO: *N19Y* */
/* Revision: 1.46     BY: Patrick Rowan            DATE: 04/17/02 ECO: *P043* */
/* Revision: 1.47     BY: Paul Donnelly            DATE: 01/27/02 ECO: *N16J* */
/* Revision: 1.48     BY: Paul Donnelly            DATE: 05/20/02 ECO: *M1YR* */
/* Revision: 1.49     BY: Jeff Wootton             DATE: 05/20/02 ECO: *P03G* */
/* Revision: 1.50     BY: Dan Herman               DATE: 05/24/02 ECO: *P018* */
/* Revision: 1.53     BY: Luke Pokic               DATE: 05/24/02 ECO: *P03Z* */
/* Revision: 1.54     BY: Steve Nugent             DATE: 06/10/02 ECO: *P07Y* */
/* Revision: 1.55     BY: Steve Nugent             DATE: 06/13/02 ECO: *P08K* */
/* Revision: 1.56     BY: Rajiv Ramaiah            DATE: 06/23/02 ECO: *N1KB* */
/* Revision: 1.57     BY: Tiziana Giustozzi        DATE: 07/07/02 ECO: *P0B5* */
/* Revision: 1.58     BY: Robin McCarthy           DATE: 07/15/02 ECO: *P0BJ* */
/* Revision: 1.59     BY: Tiziana Giustozzi        DATE: 07/17/02 ECO: *P0BG* */
/* Revision: 1.60     BY: Tiziana Giustozzi        DATE: 08/06/02 ECO: *P0CW* */
/* Revision: 1.65     BY: Tiziana Giustozzi        DATE: 08/26/02 ECO: *P0GV* */
/* Revision: 1.66     BY: Ashish Maheshwari        DATE: 09/09/02 ECO: *N1SN* */
/* Revision: 1.68     BY: Pawel Grzybowski         DATE: 03/27/03 ECO: *P0NT* */
/* Revision: 1.69     BY: Orawan S.                DATE: 05/26/03 ECO: *P0RG* */
/* Revision: 1.72     BY: Paul Donnelly (SB)       DATE: 06/28/03 ECO: *Q00J* */
/* Revision: 1.73     BY: Gnanasekar               DATE: 08/01/03 ECO: *P0WB* */
/* Revision: 1.74     BY: Sunil Fegade             DATE: 08/13/03 ECO: *P0X7* */
/* Revision: 1.75     BY: Dipesh Bector            DATE: 09/01/03 ECO: *P111* */
/* Revision: 1.76     BY: Vivek Gogte              DATE: 12/08/03 ECO: *P1D0* */
/* Revision: 1.77     BY: Preeti Sattur            DATE: 05/03/04 ECO: *P1ZZ* */
/* Revision: 1.80     BY: Russ Witt                DATE: 06/21/04 ECO: *P1CZ* */
/* Revision: 1.81     BY: Mercy Chittilapilly      DATE: 01/16/04 ECO: *P1K4* */
/* Revision: 1.82     BY: Shivganesh Hegde         DATE: 09/01/04 ECO: *Q0CN* */
/* Revision: 1.83     BY: Julie Milligan           DATE: 09/29/04 ECO: *P282* */
/* Revision: 1.84     BY: Somesh Jeswani           DATE: 10/13/04 ECO: *P2PK* */
/* Revision: 1.85     BY: Dayanand Jethwa          DATE: 11/04/04 ECO: *P2SS* */
/* Revision: 1.90     BY: Ed van de Gevel          DATE: 02/28/05 ECO: *R00B* */
/* Revision: 1.91     BY: Sachin Deshmukh          DATE: 04/05/05 ECO: *P2TJ* */
/* Revision: 1.92     BY: Anitha Gopal             DATE: 07/07/05 ECO: *P3RL* */
/* Revision: 1.93     BY: Tejasvi Kulkarni         DATE: 08/12/05 ECO: *P3TD* */
/* Revision: 1.94     BY: Steve Nugent             DATE: 09/07/05 ECO: *P2PJ* */
/* Revision: 1.95     BY: Steve Nugent             DATE: 09/07/05 ECO: *P2PJ* */
/* Revision: 1.96     BY: Sachin Deshmukh          DATE: 11/03/05 ECO: *P44Y* */
/* Revision: 1.97     BY: Ellen Borden             DATE: 12/01/05 ECO: *R000* */
/* Revision: 1.98     BY: Mochesh Chandran         DATE: 08/25/06 ECO: *P53F* */
/* Revision: 1.99     BY: Sarita Gonsalves         DATE: 07/11/07 ECO: *P5WZ* */
/* Revision: 1.102    BY: Jean Miller              DATE: 09/12/07 ECO: *R0C5* */
/* Revision: 1.104    BY: Jean Miller              DATE: 09/24/07 ECO: *R0C6* */
/* Revision: 1.107    BY: Ruma Bibra               DATE: 01/04/08 ECO: *P62S* */
/* Revision: 1.108    BY: Jean Miller              DATE: 06/24/08 ECO: *R0VH* */
/* Revision: 1.109    BY: Jean Miller              DATE: 07/08/08 ECO: *P6SC* */
/* Revision: 1.111    BY: Ravi Swami               DATE: 03/31/09 ECO: *R1G1* */
/* Revision: 1.112    BY: Neil Curzon              DATE: 06/16/09 ECO: *R1KH* */
/* Revision: 1.115    BY: Neil Curzon              DATE: 09/01/09 ECO: *R1NG* */
/* Revision: 1.116    BY: Antony LejoS             DATE: 01/06/10 ECO: *R1V2* */
/* Revision: 1.118    BY: Devna Sahai              DATE: 01/15/10 ECO: *R1TH* */
/* Revision: 1.119    BY: Pushpalatha K            DATE: 10/28/09 ECO: *R22T* */
/* CYB     LAST MODIFIED: 11-Jun-2010              BY: gbg *c1171*            */
/* CYB     LAST MODIFIED: 29-Jun-2010              BY: gbg *c1180*            */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB     LAST MODIFIED: 13 Jul 2011       BY: nac *Q9026-CR03 FIN-4595*     */
/* $Revision: 1.2 $   BY: Neil Curzon        DATE: 04/12/11 FIN-4595   */
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
{us/gp/gpuid.i}
{us/po/porcdef.i}
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/kb/kbconst.i}
/*TO ASSIGN OID*/
{us/gp/gpoidfcn.i}
 
/* Dataset that contains serial IDs picked for PO */
{us/pa/papodspk.i}

{us/ca/caattr.i}
{us/ca/cattdef.i}
{us/ca/cattdef2.i}
{us/px/pxphdef.i caicxr}
{us/px/pxphdef.i caparaxr}
{us/px/pxphdef.i caisxr}
{us/px/pxphdef.i cahistxr}

define temp-table tt_inv_trans no-undo
   field tt_trnbr as int64
   field tt_ohamt as decimal
   field tt_acct  as character extent 8
   index tt_trnbr_indx tt_trnbr.

define input parameter shipnbr        like tr_ship_id      no-undo.
define input parameter ship_date      like tr_ship_date    no-undo.
define input parameter inv_mov        like tr_ship_inv_mov no-undo.
define input parameter ip_consign_flag like mfc_logical no-undo.
define input parameter ip_is_usage     like mfc_logical no-undo.
define input parameter ip_usage_qty    as decimal       no-undo.
define input parameter ip_woiss_nbr    like tr_rmks     no-undo.
define input parameter ip_round_acct   like ac_code     no-undo.
define input parameter p_int_ref_type  like lacd_internal_ref_type no-undo.
define input parameter p_selectedReturnReceiver as character no-undo.
define input parameter table for tt_attr_pfvalue.
define input-output parameter dataset for dsSerialPicked.
define input parameter p_shipnbr1      like tr_ship_id  no-undo.
define output parameter op_rctpo_trnbr like tr_trnbr    no-undo.
define output parameter op_undo_lagit like mfc_logical        no-undo.
define output parameter table for tt_inv_trans.


/*c1171*/ def var prevdomain like dom_domain.


/* INTER-COMPANY ACCOUNT PROCEDURES */
{us/px/pxpgmmgr.i}
 
define shared variable rndmthd         like rnd_rnd_mthd.
define variable glamt as decimal             no-undo.
define variable docamt as decimal            no-undo.
define variable l_ro_routing like ro_routing no-undo.
 
define new shared variable totl_qty_this_rcpt like pod_qty_chg no-undo.
define new shared variable last_sr_wkfl as logical no-undo.
define new shared variable accum_taxamt like tx2d_tottax no-undo.
 
define shared variable lInventIsFallBack      as logical no-undo.
define shared variable lStatIsFallBack        as logical no-undo.
define shared variable mgmt_curr              like glt_curr no-undo.
define shared variable trqty           like tr_qty_chg.
define shared variable qty_ord         like pod_qty_ord.
define shared variable stdcst          like tr_price.
define shared variable old_status      like pod_status.
define shared variable receivernbr     like prh_receiver.
define shared variable lotser          like sod_serial.
define shared variable conv_to_stk_um  as decimal.
define shared variable gl_amt          like trgl_gl_amt extent 7.
define shared variable gl_mgmt_curr_amt like glt_mgmt_curr_amt extent 7.
define shared variable dr_acct         like trgl_dr_acct extent 7.
define shared variable dr_sub          like trgl_dr_sub extent 7.
define shared variable dr_cc           like trgl_dr_cc extent 7.
define shared variable dr_proj         like trgl_dr_proj extent 7.
define shared variable cr_acct         like trgl_cr_acct extent 7.
define shared variable cr_sub          like trgl_cr_sub extent 7.
define shared variable cr_cc           like trgl_cr_cc extent 7.
define shared variable cr_proj         like trgl_cr_proj extent 7.
define shared variable price           like tr_price.
define shared variable qty_oh          like in_qty_oh.
define shared variable openqty         like mrp_qty.
define shared variable rcv_type        like poc_rcv_type.
define shared variable wr_recno        as recid.
define        variable i               as integer no-undo.
define shared variable entity          like si_entity extent 7.
define shared variable pod_entity      like si_entity.
define shared variable pod_po_entity   like si_entity.
define shared variable project         like pvo_project.
define shared variable sct_recno       as recid.
define shared variable rct_site        like pod_site.
define buffer poddet for pod_det.
define shared variable yes_char        as character format "x(1)".
define shared variable undo_all        like mfc_logical no-undo.
define shared variable newmtl_tl       as decimal.
define shared variable newlbr_tl       as decimal.
define shared variable newbdn_tl       as decimal.
define shared variable newovh_tl       as decimal.
define shared variable newsub_tl       as decimal.
define shared variable newmtl_ll       as decimal.
define shared variable newlbr_ll       as decimal.
define shared variable newbdn_ll       as decimal.
define shared variable newovh_ll       as decimal.
define shared variable newsub_ll       as decimal.
define shared variable newcst          as decimal.
define shared variable glx_mthd        like cs_method.
define shared variable reavg_yn        as logical.
define        variable line_tax        like trgl_gl_amt   no-undo.
define        variable type_tax        like trgl_gl_amt   no-undo.
define        variable accum_type_tax  like type_tax      no-undo.
define shared variable crtint_amt      like trgl_gl_amt.
 
define new shared variable srvendlot   like tr_vend_lot   no-undo.
define shared variable msg-nbr         like tr_msg.
define        variable l_ppv_amt         like trgl_gl_amt no-undo.
define shared variable nrecov_tax_avg  like tx2d_tottax   no-undo.
define variable l_extbase_amt          like trgl_gl_amt   no-undo.
define shared variable s_base_amt      like base_amt      no-undo.
define shared variable cur_mthd        like cs_method.
define shared variable cur_set         like cs_set.
define shared variable glx_set         like cs_set.
define shared variable msg-num         like tr_msg.
define variable invntry-trnbr          like trgl_trnbr    no-undo.
define variable l_glxcst               like glxcst        no-undo.
define variable mc-error-number        like msg_nbr       no-undo.
define variable l_base_amt             like base_amt      no-undo.
define variable l_sct_cst_tot          like sct_cst_tot   no-undo.
define variable l_newcst               like sct_cst_tot   no-undo.
define variable l_newovh_tl            like sct_ovh_tl    no-undo.
define variable l_total_cost           like sct_cst_tot   no-undo.
define variable l_mgmt_total_cost      like sct_cst_tot   no-undo.
define variable dftRCPTAcct            like pl_rcpt_acct  no-undo.
define variable dftRCPTSubAcct         like pl_rcpt_sub   no-undo.
define variable dftRCPTCostCenter      like pl_rcpt_cc    no-undo.
define variable dftPPVAcct             like pl_ppv_acct   no-undo.
define variable dftPPVSubAcct          like pl_ppv_sub    no-undo.
define variable dftPPVCostCenter       like pl_ppv_cc     no-undo.
define variable dftCOPAcct             like pl_cop_acct   no-undo.
define variable dftCOPSubAcct          like pl_cop_sub    no-undo.
define variable dftCOPCostCenter       like pl_cop_cc     no-undo.
define variable dftWIPAcct             like pl_cop_acct   no-undo.
define variable dftWIPSubAcct          like pl_cop_sub    no-undo.
define variable dftWIPCostCenter       like pl_cop_cc     no-undo.
define variable dftSVRRAcct            like pl_cop_acct   no-undo.
define variable dftSVRRSubAcct         like pl_cop_sub    no-undo.
define variable dftSVRRCostCenter      like pl_cop_cc     no-undo.
define variable dftOVHAcct             like pl_ovh_acct   no-undo.
define variable dftOVHSubAcct          like pl_ovh_sub    no-undo.
define variable dftOVHCostCenter       like pl_ovh_cc     no-undo.
define variable l_assay                like tr_assay      no-undo.
define variable l_expire               like tr_expire     no-undo.
define variable l_glcost               like sct_cst_tot   no-undo.
define variable l_grade                like tr_grade      no-undo.
define variable use-log-acctg          as   logical       no-undo.
define variable conversion_factor      as   decimal       no-undo.
define variable dummy-cost             as   decimal       no-undo.
define variable l_excrv_amt            like trgl_gl_amt   no-undo.
define variable round_acct             like acdf_acct     no-undo.
define variable round_sub              like acdf_sub      no-undo.
define variable round_cc               like acdf_cc       no-undo.
define variable round_proj             like glt_project   no-undo.
define variable round_desc             like ac_desc       no-undo.
define variable useWIPAcct             as   logical       no-undo.
define variable l_count                as   integer initial 0 no-undo.
define variable cx0429_site            as   character     no-undo.
define variable l_location1            like sr_loc        no-undo.
define variable cIntercoRef like glt_interco_ref no-undo.
define variable cInitialIntercoRef like glt_interco_ref no-undo.
define variable mgmt_curr_ex_rate1     as decimal         no-undo.
define variable mgmt_curr_ex_rate2     as decimal         no-undo.
 
define variable mgmtglamt              like glt_amt no-undo.
 
define variable l_mgmt_ppv_amt         like glt_amt no-undo.
define variable l_mgmt_base_amt        like glt_amt no-undo.
define variable l_mgmt_extbase_amt     like glt_amt no-undo.
define variable l_mgmt_excrv_amt       like glt_amt no-undo.
define variable mgmt_acct_ex_rate1     as decimal         no-undo.
define variable mgmt_acct_ex_rate2     as decimal         no-undo.
define variable mgmt_line_tax          like glt_amt     no-undo.
define variable l_git-stat             as   logical     no-undo.
define variable l_lagit                as   logical     no-undo.
 
define variable lStatCurrError  as logical no-undo.
define variable iStatErrorMsg   as integer no-undo.
define variable l_sub_inv_total as decimal no-undo.

define variable l_prev_line like pod_line no-undo init 0.
define new shared variable l_same_lot as logical no-undo.


{us/gp/gprunpdf.i "gpscpl" "p"}
define variable iss_trnbr       like tr_trnbr   no-undo.
define variable rct_trnbr       like tr_trnbr   no-undo.
define variable l_sessionuniqueid like SessionUniqueID no-undo.

/* KANBAN TRANSACTION NUMBER, SHARED FROM poporcm.p AND kbporcm.p */
define shared variable kbtransnbr as integer no-undo.

define shared workfile posub
   field    posub_nbr       as character
   field    posub_line      as integer
   field    posub_qty       as decimal
   field    posub_wolot     as character
   field    posub_woop      as integer
   field    posub_gl_amt    like glt_amt
   field    posub_cr_acct   as character
   field    posub_cr_sub    as character
   field    posub_cr_cc     as character
   field    posub_effdate   as date
   field    posub_site      like sr_site
   field    posub_loc       like sr_loc
   field    posub_lotser    like sr_lotser
   field    posub_ref       like sr_ref
   field    posub_move      as logical.
 
{us/po/pocnvars.i}
assign cInitialIntercoRef = string(nextOidValue()).

/* DETERMINE IF SUPPLIER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ENABLE_SUPPLIER_CONSIGNMENT,
     input 11,
     input ADG,
     input SUPPLIER_CONSIGN_CTRL_TABLE,
     output using_supplier_consignment)"}
 
/* VALIDATE IF LOGISTICS ACCOUNTING IS TURNED ON */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}
 
/* DOWN GRADED TO A NO-LOCK SEE NO REASON FOR SHARE-LOCK */
 
for first pod_det where pod_recno = recid(pod_det)
no-lock: end.
 
for first po_mstr where po_domain = global_domain and po_nbr = pod_nbr
no-lock: end. /* FOR FIRST PO_MSTR */
 
for first pt_mstr where pt_recno  = recid(pt_mstr)
no-lock: end. /*FOR FIRST PT_MSTR */
 
for first sct_det where sct_recno = recid(sct_det)
no-lock: end. /*FOR FIRST SCT_DET */
 
for first gl_ctrl where gl_domain = global_domain
no-lock: end. /* FOR FIRST Gl_CTRL */
 
for first icc_ctrl where icc_domain = global_domain
no-lock: end. /* FOR FIRST ICC_CTRL */
 
if not available icc_ctrl then
   return.
 
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
	assign 
      undo_all = true
      op_undo_lagit = true.
	return.
end.
 
assign
   last_sr_wkfl       = no
   accum_type_tax     = 0
   accum_taxamt       = 0
   totl_qty_this_rcpt = 0
   l_count            = 0
   l_sessionuniqueID  = "".

totl_qty_this_rcpt = if is-return then (- pod_qty_chg) else pod_qty_chg.

if ip_is_usage
then
   l_sessionuniqueID = sessionUniqueID + "cons".
else
   l_sessionuniqueID = sessionUniqueID.

find sr_wkfl
   where sr_domain = global_domain
   and   sr_userid = l_sessionuniqueid
   and   sr_lineid = string (pod_line)
no-lock no-error.

if available sr_wkfl
then
   l_count = l_count + 1.

srloop:
for each sr_wkfl
   where sr_domain = global_domain 
   and   sr_userid = l_SessionUniqueID
   and   sr_lineid = string(pod_line)
no-lock
break by sr_userid:
 
   if last(sr_userid)
      and l_count = 1
   then
      last_sr_wkfl = yes.
 
   /* DURING EMT, WHEN CONFIRMING THE PO SHIPPER IMPORTED FROM    */
   /* SBU AT THE PBU, RETREIVING THE QUANTITY IN INVENTORY UM FOR */
   /* ORDER IN ALTERNATE UM TO AVOID ROUNDING ERRORS IN LD_DET    */
   if p_int_ref_type = {&TYPE_POShipper}
   then do:
      trqty = decimal(sr__qadc01).
   end. /* IF p_int_ref_type = {&TYPE_POShipper} */       
   else do:
      if is-return
      then do:
         trqty = (- sr_qty) * conv_to_stk_um.
      end.
      else do:
         trqty = sr_qty * conv_to_stk_um.
      end.
   end. /* ELSE DO */

   /* IDENTIFY IF SINGLE RECEIPT HAS MULTIPLE LOTS AND SET 
      l_same_lot TO TRUE AFTER THE FIRST LOT IS PROCESSED  */
   if l_prev_line <> pod_line 
   then 
      assign l_same_lot = false
         l_prev_line  = pod_line.
   else
   l_same_lot = true.

 
   assign
      l_assay    = 0
      l_expire   = ?
      l_glcost   = 0
      l_grade    = ""
      site       = sr_site
      location   = sr_loc
      lotser     = sr_lotser
      lotref     = sr_ref
      srvendlot  = sr_vend_lot
      l_base_amt = price
      base_amt   = price.
 
   if pod_site <> sr_site
   then
      l_location1 = pod_loc.
   else
      l_location1 = location.
 
   do i = 1 to 6:
      assign
         dr_acct[i] = ""
         dr_sub[i]  = ""
         dr_cc[i]   = ""
         dr_proj[i] = ""
         cr_acct[i] = ""
         cr_sub[i]  = ""
         cr_cc[i]   = ""
         cr_proj[i] = ""
         entity[i]  = ""
         gl_amt[i]  = 0
         gl_mgmt_curr_amt[i] = 0.
   end.
   line_tax = 0.
 
   if using_supplier_consignment and ip_is_usage then
      trqty = ip_usage_qty.
 
   /* IN ORDER TO ENSURE ACCURATE CALCULATIONS, IF AMOUNT BEING  */
   /* MULTIPLIED IS STORED IN DOCUMENT CURRENCY THEN CALCULATE   */
   /* IN DOCUMENT CURRENCY THEN PERFORM CONVERSION AND ROUND PER */
   /* BASE CURRENCY. */
 
   /* BASE_AMT IS IN DOCUMENT CURRENCY */
   /* CALCULATE GLAMT BASED UNIT PRICE AND TRQTY */
   glamt = (base_amt + if (pod_type = "S" and
                           glx_mthd = "AVG")
                       then
                          nrecov_tax_avg
                       else 0) * trqty.
   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output glamt,
        input rndmthd,
        output mc-error-number)"}
 
   docamt = glamt.   /* SAVE IN DOC CURRENCY */
   assign mgmtglamt = glamt.
   /* IF NECESSARY CONVERT GLAMT TO BASE */
   if po_curr <> base_curr 
   then do:
      /* CONVERT GLAMT TO BASE */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
         "(input po_curr,
           input base_curr,
           input exch_rate,
           input exch_rate2,
           input glamt,
           input true, /* DO ROUND */
           output glamt,
           output mc-error-number)"}.
      if mc-error-number <> 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end.
   end.
 
   if po_curr <> mgmt_curr then do:
         assign mgmtglamt = glamt.
         /* CONVERT BASE AMOUNT TO MANAGEMENT CURRENCY AMOUNT */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
          "(input  base_curr,
            input  mgmt_curr,
            input  mgmt_acct_ex_rate1,
            input  mgmt_acct_ex_rate2,
            input  mgmtglamt,
            input  true, /* DO ROUND */
            output mgmtglamt,
            output mc-error-number)"}
         if mc-error-number <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end. /* IF mc-error-number <> 0 */
    end.
 
 
   /* BASE_AMT IS THE UNIT PRICE */
   /* IF NECESSARY CONVERT BASE_AMT TO BASE CURRENCY */
   if po_curr <> base_curr
   then do:
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
         "(input po_curr,
           input base_curr,
           input exch_rate,
           input exch_rate2,
           input base_amt,
           input false, /* DO NOT ROUND */
           output base_amt,
           output mc-error-number)"}.
   end.
 
   if available pt_mstr then do:
      find pl_mstr
         where pl_domain    = global_domain
         and   pl_prod_line = pt_prod_line
      no-lock no-error.
   end.
 
   /*NEED THE VENDOR TYPE*/
   for first vd_mstr where vd_domain = global_domain
      and vd_addr   = po_vend
   no-lock: end.
 
   if not available pod_det then do:
      /*FIND THE FIRST POD LINE TO KEEP COMPILER HAPPY*/
      for first pod_det where pod_domain = global_domain
         and pod_nbr    = po_nbr
      no-lock: end.
      /*BUT -DO NOT USE IT! USE HEADER SITE INSTEAD*/
      cx0429_site = po_site.
   end.
   else
      /*IF pod_det WAS AVAILABLE THEN USE IT */
      cx0429_site = pod_site.
 
   {us/po/poporct.i &vendor=po_vend
      &plline=pl_prod_line
      &site=cx0429_site
      &vdtype=vd_type }
 
   run tax_loop
      (input last_sr_wkfl,
       input tax_tr_type,
       input receivernbr,
       input po_nbr,
       input pod_line,
       input using_supplier_consignment,
       input ip_consign_flag,
       input ip_is_usage,
       input totl_qty_this_rcpt,
       input trqty,
       input base_curr,
       input po_curr,
       input exch_rate,
       input exch_rate2,
       input pod_type,
       input gl_rnd_mthd,
       input-output accum_type_tax,
       input-output type_tax,
       input-output line_tax,
	   input-output mgmt_line_tax).
 
   /* CONVERT TAX AMOUNT FROM BASE TO MANAGEMENT CURRENCY */
   if po_curr <> mgmt_curr then do:
 
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
       "(input  base_curr,
         input  mgmt_curr,
         input  mgmt_acct_ex_rate1,
         input  mgmt_acct_ex_rate2,
         input  line_tax,
         input  true, /* DO ROUND */
         output mgmt_line_tax,
         output mc-error-number)"}
      if mc-error-number <> 0
         then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */
   end.
 
   /*INVENTORY ITEM RECEIPTS*/
   if available pt_mstr
      and pod_type = ""
   then do:
      for first pl_mstr where pl_domain = global_domain and
               pl_prod_line = pt_prod_line
      no-lock: end.
 
      /* Determine supplier type needed to get default gl account info */
      run getGLDefaults.
      assign
         dr_acct[1]    = pl_inv_acct
         dr_sub[1]     = pl_inv_sub
         dr_cc[1]      = pl_inv_cc
         dr_proj[1]    = pod_proj
         cr_acct[1]    = dftRCPTAcct
         cr_sub[1]     = dftRCPTSubAcct
         cr_cc[1]      = dftRCPTCostCenter
         cr_proj[1]    = pod_proj
         entity[1]     = pod_entity
         gl_amt[1]     = trqty * (sct_cst_tot - sct_ovh_tl).

      /* CONVERT INVENTORY AMOUNT FROM BASE TO MANAGEMENT CURRENCY */
		{us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
		 "(input  base_curr,
		   input  mgmt_curr,
		   input  mgmt_curr_ex_rate1,
		   input  mgmt_curr_ex_rate2,
		   input  gl_amt[1],
		   input  true, /* DO ROUND */
		   output gl_mgmt_curr_amt[1],
		   output mc-error-number)"}
		if mc-error-number <> 0
		   then do:
			  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
		end. /* IF mc-error-number <> 0 */

         l_sct_cst_tot = sct_cst_tot.
 
      if use-log-acctg
         and po_tot_terms_code <> ""
      then do:
 
         run p-calc-charge
            (input-output l_sct_cst_tot,
            input        po_vend,
            input-output gl_amt[1]).
 
		{us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
		 "(input  base_curr,
		   input  mgmt_curr,
		   input  mgmt_curr_ex_rate1,
		   input  mgmt_curr_ex_rate2,
		   input  gl_amt[1],
		   input  true, /* DO ROUND */
		   output gl_mgmt_curr_amt[1],
		   output mc-error-number)"}
		if mc-error-number <> 0
		   then do:
			  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
		end. /* IF mc-error-number <> 0 */
			
      end. /*IF use-log-aactg */
 
      l_ppv_amt = trqty * (l_sct_cst_tot - sct_ovh_tl).
 
      /* OBTAIN DEFAULT UNIT PRICE (l_total_cost) IN PO CURRENCY */
      run p-costconv
         (input l_sct_cst_tot,
          input sct_ovh_tl,
          output l_total_cost,
          input-output gl_amt[1]).

      /* CALCULATING GL_AMT FOR ATO/KIT ITEMS FOR AN EMT PO */
      /* TO REFLECT ENTIRE CONFIGURATION COST               */
      if po_is_btb and
         pt_pm_code = "c" then
      do:
         run p-price-configuration.
         gl_amt[1] = gl_amt[1] + l_glxcst.
      end. /* IF PO_IS_BTB AND PT_PM_CODE = "C" */
 
      /* ROUND PER BASE CURRENCY ROUND METHOD */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output gl_amt[1],
           input        gl_rnd_mthd,
           output       mc-error-number)"}
      /* CONVERT GL AMOUNT FROM BASE TO MANAGEMENT CURRENCY */
      if base_curr <> mgmt_curr
      then do:
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
          "(input  base_curr,
            input  mgmt_curr,
            input  mgmt_curr_ex_rate1,
            input  mgmt_curr_ex_rate2,
            input  gl_amt[1],
            input  true, /* DO ROUND */
            output gl_mgmt_curr_amt[1],
            output mc-error-number)"}
         if mc-error-number <> 0
         then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end. /* IF mc-error-number <> 0 */
      end. 
 
      run getProductLineDetailInfo.
 
      if available pld_det then
      assign
         dr_acct[1] = pld_inv_acct
         dr_sub[1]  = pld_inv_sub
         dr_cc[1]   = pld_inv_cc.
 
      if using_supplier_consignment and ip_consign_flag and
	  ip_is_usage = no then do:
         {us/gp/gprunmo.i &module  = "ACN" &program = ""pocnacct.p""
            &param   = """(input pod_part,
              input pod_site,
              input po_vend,
              output dr_acct[1],
              output dr_sub[1],
              output dr_cc[1],
              output cr_acct[1],
              output cr_sub[1],
              output cr_cc[1])"""}
		 
		 assign gl_amt[1]  = base_amt * trqty
				gl_mgmt_curr_amt[1] = 0.
				
         /* ROUND PER BASE CURRENCY ROUND METHOD */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output gl_amt[1],
              input        gl_rnd_mthd,
              output       mc-error-number)"}
 
      end. /*If using supplier consignment*/
 
      /*OVERHEAD RECEIPT*/
      if not(using_supplier_consignment
         and ip_consign_flag
         and ip_is_usage = no)
      then do:
	  
         assign
            dr_acct[2] = pl_inv_acct
            dr_sub[2]  = pl_inv_sub
            dr_cc[2]   = pl_inv_cc
            dr_proj[2] = pod_proj
            cr_acct[2] = dftOVHAcct
            cr_sub[2]  = dftOVHSubAcct
            cr_cc[2]   = dftOVHCostCenter
            cr_proj[2] = pod_proj
            entity[2]  = pod_entity
            gl_amt[2]  = trqty * sct_ovh_tl.
         /* CONVERT OVERHEAD AMOUNT FROM BASE TO MANAGEMENT CURRENCY */
 
		{us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
		 "(input  base_curr,
		   input  mgmt_curr,
		   input  mgmt_curr_ex_rate1,
		   input  mgmt_curr_ex_rate2,
		   input  gl_amt[2],
		   input  true, /* DO ROUND */
		   output gl_mgmt_curr_amt[2],
		   output mc-error-number)"}
		if mc-error-number <> 0
		   then do:
			  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
		end. /* IF mc-error-number <> 0 */
 
 
      end. /* IF NOT(USING_SUPPLIER_CONSIGNMENT AND IP_CONSIGN_FLAG AND ..... */
 
      if use-log-acctg and po_tot_terms_code <> ""
      then do:
	  
         if not(    using_supplier_consignment
                and ip_consign_flag
                and ip_is_usage = no)
         then do:
		 
            {us/gp/gprunmo.i &module = "LA"
                       &program = "lapoohc.p"
                       &param  = """(input sct_ovh_tl,
                       input po_nbr,
                       input po_vend,
                       input pod_part,
                       input pod_site,
                       output gl_amt[2])"""}
 
            gl_amt[2] = trqty * gl_amt[2].
         end.
         else
            gl_amt[2] = 0.
			
		{us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
		 "(input  base_curr,
		   input  mgmt_curr,
		   input  mgmt_curr_ex_rate1,
		   input  mgmt_curr_ex_rate2,
		   input  gl_amt[2],
		   input  true, /* DO ROUND */
		   output gl_mgmt_curr_amt[2],
		   output mc-error-number)"}
		if mc-error-number <> 0
		   then do:
			  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
		end. /* IF mc-error-number <> 0 */
			
      end.
 
      /* ROUND PER BASE CURRENCY ROUND METHOD */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output gl_amt[2],
           input gl_rnd_mthd,
           output mc-error-number)"}
 
      if available pld_det then
      assign
         dr_acct[2] = pld_inv_acct
         dr_sub[2]  = pld_inv_sub
         dr_cc[2]   = pld_inv_cc.
 
      /* l_total_cost   :  THE DEFAULT UNIT PRICE IN PO MAINTENANCE      */
      /* l_base_amt     :  PO PRICE                                      */
      /* l_extbase_amt  :  TOTAL EXTENDED AMOUNT                         */
      /* l_excrv_amt    :  EXCHANGE ROUNDING VARIANCE                    */
      /* l_ppv_amt      :  PURCHASE PRICE VARIANCE                       */
 
      /* PURCHASE PRICE VARIANCE WILL EXIST IF THERE IS ANY DIFFERENCE   */
      /* BETWEEN l_total_cost AND l_base_amt OR PO IS CREATED WITH       */
      /* NON-RECOVERABLE TAX ACCRUED AT RECEIPT.                         */
      /* EXCHANGE ROUNDING WILL EXIST WHEN l_total_cost IS EQUAL TO      */
      /* l_base_amt AND IF THERE IS VARIANCE DUE TO CURRENCY CONVERSION  */
      /* OR EXCHANGE RATE DIFFERENCE BETWEEN PO AND RECEIPT.             */
 
      /* 1. CALCULATE THE PURCHASE PRICE VARIANCE USING UNROUNDED        */
      /*    GL MATERIAL COST AND THE PO PRICE USING FORMULA:             */
      /*    (a) WHEN LOGISTICS ACCOUNTING = No.                          */
      /*    [(Total GL Cost - Overhead cost) * Qty] - [PO Cost * Qty].   */
      /*    (b) WHEN LOGISTICS ACCOUNTING = Yes.                         */
      /*    [(Total GL Cost - Overhead Cost - Logistics Charges  * Qty]  */
      /*      - [PO Cost * Qty].                                         */
      /* 2. WHEN DEFAULT PO COST <> PO COST, AND COSTING ENV IS NOT      */
      /*    AVERAGE CALCULATE PPV USING THE FORMULA:                     */
      /*    gl_amt[3] = l_ppv_amt + line_tax.                            */
      /* 3. WHEN DEFAULT PO COST = PO COST CALCULATE THE EXCHANGE        */
      /*    ROUNDING VARIANCE USING THE FORMULA:                         */
      /*    gl_amt[5] = l_excrv_amt.                                     */
 
      if pt_pm_code = "c"
         and po_is_btb
         then
         l_ppv_amt = l_ppv_amt + l_glxcst.
 
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output l_ppv_amt,
           input        gl_rnd_mthd,
           output       mc-error-number)"}
 
      l_extbase_amt = trqty * l_base_amt.
 
	  assign l_mgmt_extbase_amt = l_extbase_amt
	         l_mgmt_base_amt    = l_base_amt.
	  
      run p-poconv
         (input-output l_extbase_amt).
 
      if po_curr <> mgmt_curr then do:
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
          "(input  base_curr,
            input  mgmt_curr,
            input  mgmt_acct_ex_rate1,
            input  mgmt_acct_ex_rate2,
            input  l_extbase_amt,
            input  true, /* DO ROUND */
            output l_mgmt_extbase_amt,
            output mc-error-number)"}
 
         if mc-error-number <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end. /* IF mc-error-number <> 0 */

         /* CONVERT PO PRICE TO STAT */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
          "(input  base_curr,
            input  mgmt_curr,
            input  mgmt_acct_ex_rate1,
            input  mgmt_acct_ex_rate2,
            input  l_base_amt,
            input  false, /* DO ROUND */
            output l_mgmt_base_amt,
            output mc-error-number)"}
         if mc-error-number <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end. /* IF mc-error-number <> 0 */
 
      end. /* if po_curr <> mgmt_curr then do */
	  
 
 
      /* CONVERT BASE AMOUNT TO MANAGEMENT CURRENCY AMOUNT */
	 {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
	  "(input  base_curr,
		input  mgmt_curr,
		input  mgmt_curr_ex_rate1,
		input  mgmt_curr_ex_rate2,
		input  l_ppv_amt,
		input  true, /* DO ROUND */
		output l_mgmt_ppv_amt,
		output mc-error-number)"}
	 if mc-error-number <> 0
		then do:
		   {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
	 end. /* IF mc-error-number <> 0 */
 
      assign
         l_ppv_amt   = l_extbase_amt - l_ppv_amt
         l_excrv_amt = l_ppv_amt
         l_mgmt_ppv_amt = l_mgmt_extbase_amt - l_mgmt_ppv_amt
         l_mgmt_excrv_amt = l_mgmt_ppv_amt.
 
      if l_total_cost = l_base_amt
         then
         l_ppv_amt   = 0.
      else
         l_excrv_amt = 0.
 
      /* CONVERT INVENTORY AMOUNT FROM BASE TO MANAGEMENT CURRENCY */
	 {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
	  "(input  base_curr,
		input  mgmt_curr,
		input  mgmt_curr_ex_rate1,
		input  mgmt_curr_ex_rate2,
		input  l_total_cost,
		input  false, /* DO ROUND */
		output l_mgmt_total_cost,
		output mc-error-number)"}
	 if mc-error-number <> 0
		then do:
			{us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
	 end. /* IF mc-error-number <> 0 */
 
 
      if l_mgmt_total_cost = l_mgmt_base_amt then
         l_mgmt_ppv_amt = 0.
      else
         l_mgmt_excrv_amt = 0.
 
      if (using_supplier_consignment
         and ip_consign_flag)
         then
      assign
         l_excrv_amt = 0
         l_ppv_amt   = 0
		 l_mgmt_ppv_amt = 0		 l_mgmt_excrv_amt = 0  . 
		 
      /*PPV RECEIPT*/
      assign
         dr_acct[3] = dftPPVAcct
         dr_sub[3]  = dftPPVSubAcct
         dr_cc[3]   = dftPPVCostCenter
         dr_proj[3] = pod_proj
         cr_acct[3] = dftRCPTAcct
         cr_sub[3]  = dftRCPTSubAcct
         cr_cc[3]   = dftRCPTCostCenter
         cr_proj[3] = pod_proj
         entity[3]  = pod_entity
         gl_amt[3]  = line_tax + l_ppv_amt
         gl_mgmt_curr_amt[3] = mgmt_line_tax + l_mgmt_ppv_amt.

      if     can-find(first icc_ctrl no-lock
                      where icc_domain  = global_domain
                      and   icc_gl_tran = no )
         and can-find(first pcsc_ctrl no-lock
                      where pcsc_domain = global_domain
                      and   pcsc_enable = yes )
     then
        assign
           gl_amt[1]           = gl_amt[1]  + gl_amt[3] 
           gl_mgmt_curr_amt[1] = gl_mgmt_curr_amt[1] + gl_mgmt_curr_amt[3] 
           gl_amt[3]           = 0
           gl_mgmt_curr_amt[3] = 0
           l_excrv_amt         = 0
           l_ppv_amt           = 0
           l_mgmt_ppv_amt      = 0
           l_mgmt_excrv_amt    = 0. 
		 
      /* ADDED THE BELOW CODE SO AS TO AVOID CREATION */
      /* OF TAX GL ENTRY FOR A CONSIGN PO AT THE TIME */
      /* OF PO RECEIPT */
 
      if using_supplier_consignment
         and ip_consign_flag
         and not ip_is_usage
         then
         assign gl_amt[3]           = 0
		        gl_mgmt_curr_amt[3] = 0.
      /* ROUND PER BASE CURRENCY ROUND METHOD */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output gl_amt[3],
           input gl_rnd_mthd,
           output mc-error-number)"}
 
      if (not using_supplier_consignment) or
         (using_supplier_consignment and not ip_consign_flag) or
         (using_supplier_consignment and ip_consign_flag and ip_is_usage)
      then do:
         if pod_entity <> pod_po_entity
         then do:
            /*INTERCOMPANY POSTING - INTERCO ACCT*/
 
            /* GET THE INTER-COMPANY ACCOUNT */
/*c1171*/   prevdomain = global_domain.
/*c1171*/   find first en_mstr no-lock
/*c1171*/   where en_entity = pod_entity
/*c1171*/   no-error.
/*c1171*/   if available en_mstr then global_domain = en_domain.
            {us/gl/glenacex.i &entity=pod_po_entity
               &type='"CR"'
               &module='"IC"'
               &acct=cr_acct[4]
               &sub=cr_sub[4]
               &cc=cr_cc[4] }
/*c1171*/ global_domain = prevdomain.
 
            assign
               dr_acct[4] = dftRCPTAcct
               dr_sub[4]  = dftRCPTSubAcct
               dr_cc[4]   = dftRCPTCostCenter
               dr_proj[4] = pod_proj
               cr_proj[4] = pod_proj
               entity[4]  = pod_entity
               gl_amt[4]  = glamt + line_tax
               cIntercoRef = cInitialIntercoRef
               gl_mgmt_curr_amt[4] = mgmtglamt + mgmt_line_tax.
 
/*c1171*    {us/gl/glenacex.i &entity=pod_entity */
/*c1171*/   {us/gl/glenacex.i &entity=pod_po_entity
               &type='"DR"'
               &module='"IC"'
               &acct=dr_acct[6]
               &sub=dr_sub[6]
               &cc=dr_cc[6] }
 
            /*INTERCOMPANY POSTING - PO RECEIPTS ACCT*/
            assign
               dr_proj[6] = pod_proj
               cr_acct[6] = dftRCPTAcct
               cr_sub[6]  = dftRCPTSubAcct
               cr_cc[6]   = dftRCPTCostCenter
               cr_proj[6] = pod_proj
               entity[6]  = pod_po_entity
               gl_amt[6]  = glamt + line_tax
               cIntercoRef = cInitialIntercoRef
               gl_mgmt_curr_amt[6] = mgmtglamt + mgmt_line_tax.
 
         end. /* If pod_entity <> pod_po_entity */
      end. /* If (not using_supplier_consignment) or */
 
      /* IN STANDARD GL COST ENVIRONMENT, FOR NON-BASE CURRENCY THE  */
      /* GL AMOUNT FOR INVENTORY ACCOUNT IS UPDATED CORRECTLY BASED  */
      /* ON THE (TOTAL COST - OVERHEAD COST) & QTY RECEIVED FOR AN   */
      /* ITEM. ALSO, THE ROUNDING DIFFERENCES BETWEEN THE INVENTORY  */
      /* ACCOUNT AND PO RECEIPT ACCOUNT ARE POSTED TO EXCHANGE       */
      /* ROUNDING ACCOUNT.                                           */
 
      if glx_mthd        =  "STD"
         and po_curr     <> base_curr
         and l_excrv_amt <> 0
      then do:
 
         assign
            dr_acct[5] = ip_round_acct
            dr_sub[5]  = ""
            dr_cc[5]   = ""
            dr_proj[5] = ""
            cr_acct[5] = dftRCPTAcct
            cr_sub[5]  = dftRCPTSubAcct
            cr_cc[5]   = dftRCPTCostCenter
            cr_proj[5] = pod_proj
            entity[5]  = pod_entity
            gl_amt[5]  = l_excrv_amt
            gl_mgmt_curr_amt[5] = l_mgmt_excrv_amt.
 
      end. /* IF glx_mthd = "STD" ... */
      /* PO RETURNS AND NEGATIVE PO RECEIPTS UPDATE THE AVERAGE GL   */
      /* COST INCORRECTLY WHEN THE RETURN IS FROM A SITE DIFFERENT   */
      /* FROM THE PO LINE SITE.                                      */
      /* THE QOH AND CURRENT GL COST ARE INCORRECT, IF THE RETURN    */
      /* TRANSACTION IS PRIOR TO THE TRANSFER. TO CORRECT THIS,      */
      /* THE SEQUENCE OF TRANSFER TRANSACTION (ISS-TR & RCT-TR) AND  */
      /* RECEIPT TRANSACTION (RCT-PO/ISS-PRV) ARE NOW EXCHANGED      */
 
      /* icxfer1.p IS MOVED FROM POPORCC.P TO POPORCB6.P FOR         */
      /* NEGATIVE RECEIPT OF INVENTORY ITEMS                         */
      if  pod_type                = ""
         and site                    <> rct_site
         and trqty                   < 0
         and right-trim(po_fsm_type) = ""
      then do:
         assign
            global_part = pod_part
            global_addr = po_vend.
 
         if available pt_mstr
         then do:
            for first ld_det where ld_det.ld_domain = global_domain
               and ld_site = site
               and ld_loc  = location
               and ld_part = pt_part
               and ld_lot  = lotser
               and ld_ref  = lotref
            no-lock:
               assign
                  l_assay  = ld_assay
                  l_grade  = ld_grade
                  l_expire = ld_expire.
            end. /* FOR FIRST ld_det */
 
         end. /* IF AVAILABLE pt_mstr */

         {us/ca/cacratpr.i &eff_date_attr=eff_date}

         /* Prepare the data for the transfer. */
         {us/px/pxrun.i &PROC='prepareData4TemporaryTransfer'
                        &PROGRAM='caicxr.p'
                        &HANDLE=ph_caicxr
                        &PARAM="(input {&AUTO_TRANSFER_PARENT_OID_RCT},
                                 input pod_part,
                                 input site,
                                 input location,
                                 input lotser,
                                 input lotref,
                                 input rct_site,
                                 input pod_loc,
                                 input lotser,
                                 input lotref,
                                 input table tt_attr_parameter by-reference,
                                 input-output table tt_attr_pfvalue by-reference,
                                 input-output table tt_attrdh_hist by-reference)"
                        &NOAPPERROR=true
                        &CATCHERROR=true
         }

         {us/bbi/gprun.i ""icxfer1.p"" "(input receivernbr,
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
              input pod_loc,
              input site,
              input location,
              input no,
              input """",
              input ?,
              input """",
              input kbtransnbr,
              output l_glcost,
              output iss_trnbr,
              output rct_trnbr,
              input-output l_assay,
              input-output l_grade,
              input-output l_expire)" }
 
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

         if glx_mthd = "AVG"
            or cur_mthd = "AVG"
            or cur_mthd = "LAST"
         then do:
            if use-log-acctg
	    then do:
               /* ADDED 8th INPUT PARAMETER AS RECEIVING */
               /* SITES CONSIGNMENT INVENTORY USAGE      */
 
               {us/bbi/gprun.i ""cslavg02.p""
               "(input  pt_part,
                 input  pod_site,
                 input  transtype,
                 input  kbtransnbr,
                 input  recid(pt_mstr),
                 input  po_nbr,
                 input  trqty,
                 input  ip_usage_qty,
                 input  s_base_amt,
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
                 output msg-num)" }
            end.
	    else do:
	       /* ADDED 8th INPUT PARAMETER AS RECEIVING */
               /* SITES CONSIGNMENT INVENTORY USAGE      */
 
               {us/bbi/gprun.i ""csavg02.p""
               "(input  pt_part,
                 input  pod_site,
                 input  transtype,
                 input  kbtransnbr,
                 input  recid(pt_mstr),
                 input  po_nbr,
                 input  trqty,
                 input  ip_usage_qty,
                 input  s_base_amt,
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
                 output msg-num)" }
	    end.
         end. /* IF glx_mthd = "AVG".... */
 
      end. /* IF pod_type = "" AND site <> rct_site  */
      
      if use-log-acctg
      then do:
         /*RE-CALCULATE AVERAGE COST*/
         if glx_mthd = "AVG"
         or cur_mthd = "AVG"
         or (glx_mthd = "STD" and cur_mthd = "LAST")
         then do:
            if glx_mthd = "STD" and cur_mthd = "LAST" then reavg_yn = yes.
            if reavg_yn then do:
               /* ADDED 3rd INPUT PARAMETER AS RECEIVING */
               /* SITES CONSIGNMENT INVENTORY USAGE      */
               /* DO NOT RECALCULATE COST WHEN THE PO-SHIPPER ALREADY RECEIVED IN TRANSIT
                  AND PO RECEIPT IS DONE TO MOVE ITEM TO INVENTORY FROM IN TRANSIT */
               if l_git-stat = false
               then
                  {us/bbi/gprun.i ""cslavg03.p"" "(input recid(sct_det),
                     input trqty,
                     input ip_usage_qty,
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
                     input shipnbr,
                     input po_vend,
                     input oid_po_mstr,
                     input oid_pod_det,
                     input 'PO',
                     input glx_set,
                     input glx_mthd,
                     input cur_set,
                     input cur_mthd,
                     input pt_part,
                     input pod_site)"
               }
            end.
	    assign
            l_newcst    = newcst
            l_newovh_tl = newovh_tl.
            if glx_mthd = "AVG" 
	    then do:
               run p-costconv (input l_newcst,
	            input l_newovh_tl,
	            output l_total_cost,
	            input-output gl_amt[1]).
 
               assign gl_mgmt_curr_amt[1] = gl_amt[1].
			
	       run p-poconv(input-output gl_amt[1]).	
 
	       if po_curr <> mgmt_curr
	       then do:
	          {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
				 "(input  base_curr,
				   input  mgmt_curr,
				   input  mgmt_curr_ex_rate1,
				   input  mgmt_curr_ex_rate2,
				   input  gl_amt[1],
				   input  true, /* DO ROUND */
				   output gl_mgmt_curr_amt[1],
				   output mc-error-number)"}
		  if mc-error-number <> 0
		  then do:
		     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
		  end. /* IF mc-error-number <> 0 */
	       end.
	       assign gl_amt[2]  = trqty * newovh_tl.
	       /* ROUND PER BASE CURR ROUND METHOD */
	       {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
	            "(input-output gl_amt[2],
	              input gl_rnd_mthd,
	              output mc-error-number)"}
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
			 "(input  base_curr,
			   input  mgmt_curr,
			   input  mgmt_curr_ex_rate1,
			   input  mgmt_curr_ex_rate2,
			   input  gl_amt[2],
			   input  true, /* DO ROUND */
			   output gl_mgmt_curr_amt[2],
			   output mc-error-number)"}
               if mc-error-number <> 0
	       then do:
		  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
	       end. /* IF mc-error-number <> 0 */
               /* INITIALISE gl_amt[3] TO ZERO SINCE PPV SHOULD NOT BE   */
	       /* GENERATED AND POSTED IN AN AVERAGE COSTING ENVIRONMENT */
	       assign gl_amt[3]  = 0
	              gl_mgmt_curr_amt[3] = 0.
            end. /* if glx_mthd = "AVG" then  do: */
         end.
      end. /* if use-log-acctg */  
      else do:
         /*RE-CALCULATE AVERAGE COST*/
         if glx_mthd = "AVG" 
	       then do:
	  
            /* ADDED 3rd INPUT PARAMETER AS RECEIVING */
            /* SITES CONSIGNMENT INVENTORY USAGE      */

           if reavg_yn 
           then do: 
            {us/bbi/gprun.i ""csavg03.p""
               "(input recid(sct_det),
                 input trqty,
                 input ip_usage_qty,
                 input newmtl_tl,
                 input newlbr_tl,
                 input newbdn_tl,
                 input newovh_tl,
                 input newsub_tl,
                 input newmtl_ll,
                 input newlbr_ll,
                 input newbdn_ll,
                 input newovh_ll,
                 input newsub_ll)"
            }
            
            assign
               l_newcst    = newcst
               l_newovh_tl = newovh_tl.
         
            run p-costconv (input l_newcst,
	            input l_newovh_tl,
	            output l_total_cost,
	            input-output gl_amt[1]).

	        end.    
 
            assign gl_mgmt_curr_amt[1] = gl_amt[1].
			
            run p-poconv(input-output gl_amt[1]).	
 
            if po_curr <> mgmt_curr
            then do:
                {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
				           "(input  base_curr,
				             input  mgmt_curr,
				             input  mgmt_curr_ex_rate1,
				             input  mgmt_curr_ex_rate2,
				             input  gl_amt[1],
				             input  true, /* DO ROUND */
				             output gl_mgmt_curr_amt[1],
				             output mc-error-number)"}
               if mc-error-number <> 0
	             then do:
		              {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
	             end. /* IF mc-error-number <> 0 */
	          end.
 
	          assign gl_amt[2]  = trqty * newovh_tl.

            /* ROUND PER BASE CURR ROUND METHOD */
	          {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
	             "(input-output gl_amt[2],
	               input gl_rnd_mthd,
	               output mc-error-number)"}
 
	          {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
			         "(input  base_curr,
			           input  mgmt_curr,
			           input  mgmt_curr_ex_rate1,
			           input  mgmt_curr_ex_rate2,
			           input  gl_amt[2],
			           input  true, /* DO ROUND */
			           output gl_mgmt_curr_amt[2],
			           output mc-error-number)"}
	          if mc-error-number <> 0
	          then do:
	             {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
	          end. /* IF mc-error-number <> 0 */
 
			  
	          /* INITIALISE gl_amt[3] TO ZERO SINCE PPV SHOULD NOT BE   */
	          /* GENERATED AND POSTED IN AN AVERAGE COSTING ENVIRONMENT */
	          assign
               gl_amt[3]  = 0
	             gl_mgmt_curr_amt[3] = 0.

         end. /*  if glx_mthd = "AVG" */

      end.  /* Not use-log-acctg */    

   end. /*if pod_type = ""*/
 
   /*SUBCONTRACT RECEIPTS*/
   else if available pt_mstr and pod_type = "S" then do:
 
      for first pl_mstr where pl_mstr.pl_domain = global_domain
         and  pl_prod_line = pt_prod_line
      no-lock: end.
 
      /* Determine supplier type needed to get default gl account info */
      run getGLDefaults.
 
      run checkForKanbanWIPSupermarket.
 
      assign
         dr_proj[1] = pod_proj
         cr_acct[1] = dftRCPTAcct
         cr_sub[1]  = dftRCPTSubAcct
         cr_cc[1]   = dftRCPTCostCenter
         cr_proj[1] = pod_proj
         entity[1]  = pod_entity
         gl_amt[1]  = glamt
		 l_sub_inv_total = glamt
		 gl_mgmt_curr_amt[1] = mgmtglamt.
		
		/* NOTE: for sub-contract orders, allows calculate the invoice total from the base value. */
		/* This has to be done even if the po_curr = mgmt_curr.                                   */
		{us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
		 "(input  base_curr,
		   input  mgmt_curr,
		   input  mgmt_curr_ex_rate1,
		   input  mgmt_curr_ex_rate2,
		   input  l_sub_inv_total,
		   input  true, /* DO ROUND */
		   output l_sub_inv_total,
		   output mc-error-number)"}
		if mc-error-number <> 0
		   then do:
			  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
		end. /* IF mc-error-number <> 0 */
		
		assign gl_mgmt_curr_amt[3] = gl_mgmt_curr_amt[1] - l_sub_inv_total.
 
      run setDebitAccounts.
 
      /* GLAMT WAS CALCULATED AND CONVERTED IN THE */
      /* BEGINNING, NO NEED TO RECALCULATE. */
 
      assign
         wolot = pod_wo_lot
         woop  = pod_op.
 
      if can-find(first wr_route where wr_route.wr_domain = global_domain
                  and wr_lot = wolot
                  and wr_op = woop)
      then do:
         for first wo_mstr where wo_mstr.wo_domain = global_domain
            and  wo_lot = wolot
         no-lock: end.
 
         find wr_route where wr_route.wr_domain = global_domain
            and wr_lot = wolot
            and wr_op = woop
         exclusive-lock no-error.
 
         wr_recno = recid(wr_route).
 
         /* WHEN wo_type = 'c' and wo_nbr = "" AND         */
         /* wo_status = "r" THEN THIS WORK ORDER           */
         /* WAS CREATED BY THE ADVANCED REPETETIVE MODULE. */
         /* THE COSTING WILL BE DONE LATER IN removea.p    */
         /* WHICH HAS THE WORKFILE                         */
         if available wo_mstr
         then do:
            if index ("FPC",wo_status) = 0 then do:
               if wo_type = "c" and wo_nbr = ""
                  and wo_status = "r" then do:
                  create posub.
                  assign
                     posub_nbr     = po_nbr
                     posub_line    = pod_line
                     posub_qty     = trqty
                     posub_wolot   = pod_wo_lot
                     posub_woop    = pod_op
                     posub_gl_amt  = gl_amt[1]
                     posub_cr_acct = dr_acct[1]
                     posub_cr_sub  = dr_sub[1]
                     posub_cr_cc   = dr_cc[1]
                     posub_effdate = eff_date
                     posub_site    = site
                     posub_loc     = location
                     posub_lotser  = lotser
                     posub_ref     = lotref
                     posub_move    = move.
 
                  for first ro_det where ro_det.ro_domain = global_domain
                     and ro_routing = (if wo_routing <> "" then
                                          wo_routing
                                       else
                                          wo_part )
                     and ro_op = woop
                  no-lock: end.
 
                  /* REPLACED ro_sub_cost WITH wr_sub_cost AS THE */
                  /* LATTER BEING FREEZED COST WOULD BE USED FOR  */
                  /* CALCULATING SUBCONTRACT RATE VARIANCE        */
                  stdcst = wr_sub_cost.
                  if available ro_det then
                     posub_move = ro_mv_nxt_op.
                  else
                     posub_move = wr_mv_nxt_op.
               end.
 
               else do:
                  /* IF KBTRANSNBR = 0, THEN THIS WAS NOT CALLED   */
                  /* FROM THE KANBAN SYSTEM.  WHEN CALLED FROM THE */
                  /* KANBAN SYSTEM, DO NOT RUN PORCSUB.P AS THE    */
                  /* SUBCONTRACT OPERATION HISTORY IS TRACKED      */
                  /* IN THE KANBAN TRANSACTION RECEIPT PROGRAM. */
                  if kbtransnbr = 0 then do:
                     {us/bbi/gprun.i ""porcsub.p""
                        "(input pod_nbr,
                          input pod_line
                        )"}
                  end.
               end.
 
            end.
 
         end. /* IF AVAILABLE wo_mstr */
 
      end.
 
      else do:
 
         l_ro_routing = "".
 
         for first ptp_det where ptp_det.ptp_domain = global_domain
            and ptp_part = pod_part
            and ptp_site = pod_site
         no-lock: end.
 
         if available ptp_det then do:
            if ptp_routing <> ""
               then
               l_ro_routing = ptp_routing.
            else
               l_ro_routing = pod_part.
         end.
         else do:
            for first pt_mstr where pt_mstr.pt_domain = global_domain
               and pt_part = pod_part
            no-lock: end.
            if available pt_mstr then do:
               if pt_routing <> "" then
                  l_ro_routing = pt_routing.
               else
                  l_ro_routing = pod_part.
            end.
         end. /* not available ptp_det */
 
         for first ro_det where ro_det.ro_domain = global_domain
            and ro_routing = l_ro_routing
            and ro_op = woop
         no-lock: end.
         if available ro_det
         then
            stdcst = ro_sub_cost.
         else
            stdcst = 0.
      end. /* IF WORKORDER IS NOT AVAILABLE */
 
      /*PPV RECEIPT*/
	  if available pt_mstr and pod_type = "S"
	  then do:
	  
		assign 
		     cr_acct[3] = dftCOPAcct
			 cr_sub[3]  = dftCOPSubAcct
			 cr_cc[3]   = dftCOPCostCenter
			 cr_proj[3] = pod_proj
			 entity[3]  = pod_entity
			 dr_proj[3] = pod_proj
			 dr_acct[3] = dftSVRRAcct
			 dr_sub[3]  = dftSVRRSubAcct
			 dr_cc[3]   = dftSVRRCostCenter.
			 
		assign 
		     cr_acct[7] = dftRCPTAcct
			 cr_sub[7]  = dftRCPTSubAcct
			 cr_cc[7]   = dftRCPTCostCenter
			 cr_proj[7] = pod_proj
			 entity[7]  = pod_entity
			 dr_proj[7] = pod_proj
			 dr_acct[7] = dftSVRRAcct
			 dr_sub[7]  = dftSVRRSubAcct
			 dr_cc[7]   = dftSVRRCostCenter
			 gl_amt[7]  = 0
			 gl_mgmt_curr_amt[7] = 0.
			 
	  end.
	  else do:
		  assign
			 dr_acct[3] = dftPPVAcct
			 dr_sub[3]  = dftPPVSubAcct
			 dr_cc[3]   = dftPPVCostCenter
			 dr_proj[3] = pod_proj
			 cr_acct[3] = dftRCPTAcct
			 cr_sub[3]  = dftRCPTSubAcct
			 cr_cc[3]   = dftRCPTCostCenter
			 cr_proj[3] = pod_proj
			 entity[3]  = pod_entity.
	  end.
 
      /* IN AVERAGE COSTING ENVIRONMENT THERE SHOULD NOT BE ANY */
      /* PPV GENERATED AND POSTED. HENCE gl_amt[3] WHICH HOLDS  */
      /* TAX AMOUNT IS INITIALISED TO ZERO.                     */
	  if available pt_mstr and pod_type = "S"
	  then do:
	    if glx_mthd = "AVG"
		then
			assign
			 gl_amt[7]  = 0
			 gl_mgmt_curr_amt[7] = 0. 
		else
			assign gl_amt[7] = line_tax
		       gl_mgmt_curr_amt[7] = mgmt_line_tax.
	  end.
	  else do:
		  if glx_mthd = "AVG"
			 then
			 gl_amt[3]  = 0.
		  else
			 gl_amt[3]  = line_tax.
	  end.
 
      if entity[1] <> pod_po_entity 
      then do:
         /*INTERCOMPANY POSTING - INTERCO ACCT*/
         {us/gl/glenacex.i &entity=pod_po_entity
            &type='"CR"'
            &module='"IC"'
            &acct=cr_acct[2]
            &sub=cr_sub[2]
            &cc=cr_cc[2] }
 
         assign
            dr_acct[2] = dftRCPTAcct
            dr_sub[2]  = dftRCPTSubAcct
            dr_cc[2]   = dftRCPTCostCenter
            dr_proj[2] = project
            cr_proj[2] = project
            entity[2]  = entity[1]
            gl_amt[2]  = glamt
            cIntercoRef = cInitialIntercoRef
            gl_mgmt_curr_amt[2] = mgmtglamt.
 
         /*INTERCOMPANY POSTING - PO RECEIPTS ACCT*/
         {us/gl/glenacex.i &entity=entity[1]
            &type='"DR"'
            &module='"IC"'
            &acct=dr_acct[6]
            &sub=dr_sub[6]
            &cc=dr_cc[6] }
 
         assign
            dr_proj[6] = project
            cr_acct[6] = dftRCPTAcct
            cr_sub[6]  = dftRCPTSubAcct
            cr_cc[6]   = dftRCPTCostCenter
            cr_proj[6] = project
            entity[6]  = pod_po_entity
            gl_amt[6]  = glamt
            cIntercoRef = cInitialIntercoRef
            gl_mgmt_curr_amt[6] = mgmtglamt.
      end.
   end. /*if pod_type = "S"*/
 
   /*MEMO ITEM RECEIPTS*/
   else do:
      assign
         dr_acct[1] = pod_acct
         dr_sub[1]  = pod_sub
         dr_cc[1]   = pod_cc
         dr_proj[1] = pod_proj
         cr_acct[1] = rcptx_acct
         cr_sub[1]  = rcptx_sub
         cr_cc[1]   = rcptx_cc
         cr_proj[1] = pod_proj
         entity[1]  = pod_entity
         gl_amt[1]  = glamt
         gl_mgmt_curr_amt[1] = mgmtglamt.
      /* GLAMT WAS CALCULATED AND CONVERTED IN THE */
      /* BEGINNING, NO NEED TO RECALCULATE. */
 
      /* COMPONENTS ALREADY ROUNDED */
      assign gl_amt[1] = gl_amt[1] + line_tax.
	         gl_mgmt_curr_amt[1] = gl_mgmt_curr_amt[1] + mgmt_line_tax.
 
      if pod_entity <> pod_po_entity 
      then do:
         /*INTERCOMPANY POSTING - INTERCO ACCT*/
         {us/gl/glenacex.i &entity=pod_po_entity
            &type='"CR"'
            &module='"IC"'
            &acct=cr_acct[2]
            &sub=cr_sub[2]
            &cc=cr_cc[2] }
 
         assign
            dr_acct[2] = gl_rcptx_acct
            dr_sub[2]  = gl_rcptx_sub
            dr_cc[2]   = gl_rcptx_cc
            dr_proj[2] = pod_proj
            cr_proj[2] = pod_proj
            entity[2]  = pod_entity
            gl_amt[2]  = glamt + line_tax
            cIntercoRef = cInitialIntercoRef
            gl_mgmt_curr_amt[2] = mgmtglamt + mgmt_line_tax.
 
         /*INTERCOMPANY POSTING - PO RECEIPTS ACCT*/
/*c1307*          {us/gl/glenacex.i &entity=pod_entity */
/*c1307*/         {us/gl/glenacex.i &entity=pod_po_entity
            &type='"DR"'
            &module='"IC"'
            &acct=dr_acct[6]
            &sub=dr_sub[6]
            &cc=dr_cc[6] }
 
         assign
            dr_proj[6] = pod_proj
            cr_acct[6] = gl_rcptx_acct
            cr_sub[6]  = gl_rcptx_sub
            cr_cc[6]   = gl_rcptx_cc
            cr_proj[6] = pod_proj
            entity[6]  = pod_po_entity
            gl_amt[6]  = glamt + line_tax
            cIntercoRef = cInitialIntercoRef
            gl_mgmt_curr_amt[6] = mgmtglamt + mgmt_line_tax.
 
      end.
   end. /*else do (memo items)*/
 
   /* CREATE TRAN HISTORY RECORD FOR EACH LOT/SERIAL/PART */
   assign
      pt_recno  = recid(pt_mstr)
      pod_recno = recid(pod_det)
      po_recno  = recid(po_mstr)
      wr_recno  = recid(wr_route).
 
/*c1171*    {us/bbi/gprun.i ""poporcc.p"" */
/*c1171*/   {us/bbi/gprun.i ""xxporcc.p""
      "(input shipnbr,
        input ship_date,
        input inv_mov,
        input ip_consign_flag,
        input ip_is_usage,
        input ip_usage_qty,
        input ip_woiss_nbr,
        input cIntercoRef,
        input mgmt_curr,
        input mgmt_curr_ex_rate1,
        input mgmt_curr_ex_rate2,
        input 'INV',
        input p_int_ref_type,
        input oid_sr_wkfl,
        input p_selectedReturnReceiver,
        input table tt_attr_pfvalue by-reference,
        input-output dataset dsSerialPicked by-reference,
        input p_shipnbr1,
        output invntry-trnbr)"}
 
   if undo_all then return.
		
   op_rctpo_trnbr = invntry-trnbr.
 
   for first tt_inv_trans
      where tt_trnbr = invntry-trnbr:
   end. /* FOR FIRST tt_inv_trans */
   if not available tt_inv_trans
   then do:
      create tt_inv_trans.
      assign
         tt_trnbr = invntry-trnbr
         tt_ohamt = gl_amt[2]
         tt_acct[1] = dr_acct[3]
         tt_acct[2] = dr_sub[3]
         tt_acct[3] = dr_cc[3]
         tt_acct[4] = dr_proj[3]
         tt_acct[5] = cr_acct[3]
         tt_acct[6] = cr_sub[3]
         tt_acct[7] = cr_cc[3]
         tt_acct[8] = cr_proj[3].
   end. /* IF NOT AVAILABLE tt_inv_trans */

   if (pod_rma_type = "I"   or
      pod_rma_type = "O")
   then do:
      {us/bbi/gprun.i ""fsrtvtrn.p""}
      if undo_all then return .
   end.
 
end.  /* for each sr_wkfl */
 
run deleteWorkfile (input pod_line,
   input ip_is_usage).
 
if pod_qty_chg <> 0 then do:
 
   for first rmd_det
      where rmd_det.rmd_domain = global_domain and  rmd_nbr    = pod_nbr
      and   rmd_prefix = "V"
      and   rmd_line   = pod_line exclusive-lock:
   end. /* FOR FIRST RMD_DET */
   /*******************************************/
   /* Update receive/ship date and qty in rma */
   /*******************************************/
   if  available rmd_det
   then do:
      if  rmd_type = "O"
         then
         rmd_qty_acp  = - (pod_qty_rcvd + pod_qty_chg).
      else
         rmd_qty_acp  =   pod_qty_rcvd + pod_qty_chg.
      if rmd_qty_acp <> 0
         then
         rmd_cpl_date =   eff_date.
      else
         rmd_cpl_date = ?.
   end.
end. /**********end pod_qty_chg*************/
 
/* PROCEDURE TO OBTAIN COST OF COMPONENT ITEMS FOR AN EMT PO */
 
PROCEDURE p-price-configuration:
 
   define variable l_qty_req like sob_qty_req no-undo.
 
   l_glxcst = 0.
   for first sod_det where sod_det.sod_domain = global_domain
      and sod_nbr = po_mstr.po_so_nbr
      and sod_line = pod_det.pod_sod_line
      and sod_compl_stat = ""
   no-lock: end.
 
   if available sod_det then do:
      for each sob_det where sob_det.sob_domain = global_domain
         and sob_nbr  = sod_nbr
         and sob_line = sod_line
      no-lock
      break by sob_part:
 
         if first-of(sob_part) then
            l_qty_req = 0.
 
         if substring(sob_serial,15,1) = "o" then
            l_qty_req = l_qty_req + sob_qty_req.
 
         if last-of(sob_part) and
            l_qty_req <> 0
         then do:
            {us/bbi/gprun.i ""gpsct05.p""
               "(input sob_part, sob_site, input 1,
                 output glxcst, output curcst)"}
            assign
               glxcst = glxcst * (sob_qty_req / sod_qty_ord)
               l_glxcst = l_glxcst + glxcst.
         end. /* IF LAST-OF (SOB_PART) ... */
 
      end. /* FOR EACH SOB_DET */
 
      l_glxcst = l_glxcst * absolute(trqty).
 
   end. /* IF AVAILABLE SOD_DET */
 
end. /* PROCEDURE P-PRICE-CONFIGURATION */
 
/* PROCEDURE p-poconv TO ROUND AMOUNT ACCORDING TO PO CURRENCY */
/* AND CONVERT IT TO BASE CURRENCY                             */
 
PROCEDURE p-poconv:
 
   define input-output parameter  l_tmpamt like trgl_gl_amt no-undo.
   /* ROUND PER PO CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_tmpamt,
        input rndmthd,
        output mc-error-number)"}
 
   if po_mstr.po_curr <> base_curr
   then do:
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
         "(input  po_mstr.po_curr,
           input  base_curr,
           input  exch_rate,
           input  exch_rate2,
           input  l_tmpamt,
           input  true, /* DO ROUND */
           output l_tmpamt,
           output mc-error-number)"}
      if mc-error-number <> 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */
   end. /* IF po_curr <> base_curr */
END PROCEDURE. /* PROCEDURE p-poconv */
 
/* PROCEDURE p-costconv TO CONVERT COST TO PO CURRENCY AND   */
/* ASSIGN THE DISPLAYED COST BACK TO MAKE IT IN SYNC         */
/* WITH VOUCHER MAINTENANCE PROGRAM                          */
 
PROCEDURE p-costconv:
 
   define input        parameter l_sct_cst_tot like sct_cst_tot  no-undo.
   define input        parameter l_sct_ovh_tl  like sct_ovh_tl   no-undo.
   define output       parameter p_total_cost  like l_total_cost no-undo.
   define input-output parameter p_gl_amt      like gl_amt[1]    no-undo.
 
   if po_mstr.po_curr <> base_curr
   then do:
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
         "(input  base_curr,
           input  po_mstr.po_curr,
           input  exch_rate2,
           input  exch_rate,
           input  l_sct_cst_tot,
           input  false, /* DO NOT ROUND */
           output l_sct_cst_tot,
           output mc-error-number)"}
      if mc-error-number <> 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */
 
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
         "(input  base_curr,
           input  po_mstr.po_curr,
           input  exch_rate2,
           input  exch_rate,
           input  l_sct_ovh_tl,
           input  false, /* DO NOT ROUND */
           output l_sct_ovh_tl,
           output mc-error-number)"}
      if mc-error-number <> 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */
   end. /* IF po_curr <> base_curr */
 
   assign
      p_total_cost = l_sct_cst_tot - l_sct_ovh_tl
      p_total_cost = round(p_total_cost,5).
 
   if glx_mthd = "AVG"
   then
      p_gl_amt = trqty * (l_sct_cst_tot - l_sct_ovh_tl).
 
END PROCEDURE. /* PROCEDURE p-costconv */
 
PROCEDURE getGLDefaults:
 
   for first vd_mstr where vd_mstr.vd_domain = global_domain
      and  vd_addr = po_mstr.po_vend
   no-lock: end.
 
   if dftRCPTAcct = "" and dftRCPTSubAcct = "" and dftRCPTCostCenter = ""
   then do:
      {us/bbi/gprun.i ""glactdft.p""
         "(input ""PO_RCPT_ACCT"",
           input pt_mstr.pt_prod_line,
           input pod_det.pod_site,
           input if available vd_mstr then
           vd_type else """",
           input """",
           input no,
           output dftRCPTAcct,
           output dftRCPTSubAcct,
           output dftRCPTCostCenter)"}
   end.
 
   {us/bbi/gprun.i ""glactdft.p""
      "(input ""PO_PPV_ACCT"",
        input pt_mstr.pt_prod_line,
        input pod_det.pod_site,
        input if available vd_mstr then
        vd_type else """",
        input """",
        input no,
        output dftPPVAcct,
        output dftPPVSubAcct,
        output dftPPVCostCenter)"}
 
   {us/bbi/gprun.i ""glactdft.p""
      "(input ""PO_OVH_ACCT"",
        input pt_mstr.pt_prod_line,
        input pod_det.pod_site,
        input if available vd_mstr then
        vd_type else """",
        input """",
        input no,
        output dftOVHAcct,
        output dftOVHSubAcct,
        output dftOVHCostCenter)"}
 
   {us/bbi/gprun.i ""glactdft.p""
      "(input ""WO_COP_ACCT"",
        input pt_mstr.pt_prod_line,
        input pod_det.pod_site,
        input """",
        input """",
        input no,
        output dftCOPAcct,
        output dftCOPSubAcct,
        output dftCOPCostCenter)"}
 
   {us/bbi/gprun.i ""glactdft.p""
      "(input ""WO_WIP_ACCT"",
        input pt_mstr.pt_prod_line,
        input pod_det.pod_site,
        input """",
        input """",
        input no,
        output dftWIPAcct,
        output dftWIPSubAcct,
        output dftWIPCostCenter)"}
 
   {us/bbi/gprun.i ""glactdft.p""
      "(input ""WO_SVRR_ACCT"",
        input pt_mstr.pt_prod_line,
        input pod_det.pod_site,
        input """",
        input """",
        input no,
        output dftSVRRAcct,
        output dftSVRRSubAcct,
        output dftSVRRCostCenter)"}
		
END PROCEDURE.
 
PROCEDURE p-calc-charge:
 
   define input-output parameter cost-total  like sct_cst_tot no-undo.
   define input        parameter ip_po_vend  like po_vend     no-undo.
   define input-output parameter calc-amt    as decimal       no-undo.

   for each lacd_det where lacd_det.lacd_domain = global_domain
      and lacd_det.lacd_internal_ref = po_mstr.po_nbr
      and lacd_det.lacd_shipfrom     = ip_po_vend
      and lacd_det.lacd_internal_ref_type = {&TYPE_PO}
   no-lock:
 
      for first in_mstr where in_mstr.in_domain = global_domain
         and in_part = pod_det.pod_part
         and in_site = pod_det.pod_site
      no-lock: end.
 
      if not available in_mstr then next.
 
      for first sc_mstr where sc_mstr.sc_domain = global_domain
         and sc_sim      = (if in_gl_set <> "" then
                               in_gl_set
                            else
                               icc_ctrl.icc_gl_set)
         and sc_element  = lacd_element
         and sc_category = "1"
      no-lock: end.
 
      if not available sc_mstr then next.
 
      for first spt_det where spt_det.spt_domain = global_domain
         and spt_site = in_gl_cost_site
         and spt_sim = sc_sim
         and spt_part = pod_part
         and spt_element = lacd_element
      no-lock: end.
 
      if not available spt_det then next.
 
      cost-total = cost-total - spt_cst_tl.

      if glx_mthd <> "AVG" then
         calc-amt  = calc-amt - (trqty * spt_cst_tl).
   end. /* for each lacd_mstr */
 
END PROCEDURE.
 
PROCEDURE checkForKanbanWIPSupermarket:
   /* CHECK FOR PO RECEIPT GENERATED BY KANBAN TRANSACTION    */
   /* AND IF THE KANBAN SUPERMARKET IS A WIP INVENTORY TYPE.   */
   useWIPAcct = no.
 
   if kbtransnbr <> 0 then do:
      for first kbtr_hist where kbtr_domain = global_domain
         and kbtr_trans_nbr = kbtransnbr
      no-lock,
         first knbsm_mstr where knbsm_domain = global_domain
         and knbsm_site = kbtr_supermarket_site
         and knbsm_supermarket_id = kbtr_supermarket_id
      no-lock:
         if knbsm_inv_loc_type = {&KB-SUPERMARKETTYPE-RIP}
            then useWIPAcct = yes.
      end.  /* for first kbtr_hist */
 
   end.  /* if kbtransnbr <> 0  */
 
END PROCEDURE.  /*  checkForKanbanWIPSupermarket */
 
PROCEDURE setDebitAccounts:
 
   if useWIPAcct = no then
   assign
      dr_acct[1] = dftCOPAcct
      dr_sub[1]  = dftCOPSubAcct
      dr_cc[1]   = dftCOPCostCenter.
   else
   assign
      dr_acct[1] = dftWIPAcct
      dr_sub[1]  = dftWIPSubAcct
      dr_cc[1]   = dftWIPCostCenter.
 
END PROCEDURE.  /*  setDebitAccounts */
 
PROCEDURE getProductLineDetailInfo:
 
   if use-log-acctg
   then do:
      /* CHECK IF THIS IS LOGISTICS ACCOUNTING PO SHIPPER GIT RECEIPT PROGRAM */
      {us/bbi/gprun.i ""gpckpprg.p"" "(input 'lagitrc', output l_lagit)"}
      if not l_lagit
      then do:
         /* POSHIVMT IS ALSO MOVING TO TRANSIT */
         {us/bbi/gprun.i ""gpckpprg.p"" "(input 'poshivmt', output l_lagit)"}
      end. /* IF NOT l_lagit */
   end. /* IF use-log-acctg */
 
   /* DETERMINE IF SHIPPER IS IN TRANSIT */
   if use-log-acctg
   then do:
      {us/gp/gprunmo.i &module = "LA" &program = ""lagit.p""
                 &param = """(output l_git-stat)"""}
   end. /* IF use-log-acctg */
 
   /* IF THIS IS LOGISTICS ACCOUNTING PO SHIPPER GIT RECEIPT PROGRAM */
   /* FIND GOODS IN TRANSFER LOCATION */
 
   if l_lagit
   or (l_git-stat and use-log-acctg)
   then do:
      for first si_mstr
      where si_domain = global_domain
         and si_site  = pod_det.pod_site
      no-lock:
         l_location1 = si_git_location.
      end. /* FOR FIRST si_mstr */
   end. /* IF  l_lagit OR */
 
   for first pld_det where pld_det.pld_domain = global_domain
      and pld_prodline = pt_mstr.pt_prod_line
      and pld_site     = pod_det.pod_site
      and pld_loc      = l_location1
   no-lock: end. /* FOR FIRST PLD_DET */
 
   if not available pld_det then do:
 
      for first pld_det where pld_det.pld_domain = global_domain
         and pld_prodline = pt_prod_line
         and pld_site     = pod_site
         and pld_loc      = ""
      no-lock: end.
 
      if not available pld_det then do:
         for first pld_det where pld_det.pld_domain = global_domain
            and pld_prodline = pt_prod_line
            and pld_site     = ""
            and pld_loc      = ""
         no-lock: end.
      end.
 
   end.
 
END PROCEDURE.  /*  getProductLineDetailInfo */
 
PROCEDURE deleteWorkfile:
   define input parameter p_podline  like pod_line    no-undo.
   define input parameter p_is_usage like mfc_logical no-undo.
   define buffer sr_wkfl             for  sr_wkfl.
   define buffer b_srwkfl            for  sr_wkfl.
   define variable l_sess_unique_id like SessionUniqueID no-undo.

   l_sess_unique_id = "".

   if p_is_usage
   then
      l_sess_unique_id = sessionUniqueID + "cons".
   else
      l_sess_unique_id = sessionUniqueID.
	 

   for each sr_wkfl 
      where sr_wkfl.sr_domain = global_domain
      and   sr_wkfl.sr_userid = l_sess_unique_id
      and   sr_lineid         = string(p_podline)
   no-lock:
 
      find b_srwkfl where recid(b_srwkfl) = recid(sr_wkfl)
      exclusive-lock no-error.
 
      delete b_srwkfl.
 
   end. /* FOR EACH sr_wkfl */
 
END PROCEDURE. /* deleteWorkfile */
 
PROCEDURE tax_loop:
   define input parameter  p_last_sr_wkfl  like mfc_logical  no-undo.
   define input parameter  p_tax_tr_type   like tax_tr_type  no-undo.
   define input parameter  p_receivernbr   like prh_receiver no-undo.
   define input parameter  p_po_nbr        like po_nbr       no-undo.
   define input parameter  p_pod_line      like pod_line     no-undo.
   define input parameter  p_using_supplier_consignment like mfc_logical  no-undo.
   define input parameter  p_consign_flag  like mfc_logical  no-undo.
   define input parameter  p_is_usage      like mfc_logical  no-undo.
   define input parameter  p_totl_qty_this_rcpt like pod_qty_chg no-undo.
   define input parameter  p_trqty         like tr_qty_chg   no-undo.
   define input parameter  p_base_curr     like po_curr      no-undo.
   define input parameter  p_po_curr       like po_curr      no-undo.
   define input parameter  p_exch_rate     like exch_rate    no-undo.
   define input parameter  p_exch_rate2    like exch_rate    no-undo.
   define input parameter  p_pod_type      like pod_type     no-undo.
   define input parameter  p_gl_rnd_mthd   like pod_type     no-undo.
 
   define input-output parameter p_accum_type_tax like type_tax no-undo.
   define input-output parameter p_type_tax like trgl_gl_amt   no-undo.
   define input-output parameter p_line_tax like trgl_gl_amt   no-undo.
   define input-output parameter p_mgmt_line_tax like trgl_gl_amt no-undo.
 
   assign
      p_type_tax = 0
      p_line_tax = 0.
 
   for each tx2d_det where tx2d_det.tx2d_domain = global_domain
         and tx2d_tr_type         = p_tax_tr_type
         and tx2d_ref             = p_receivernbr
         and tx2d_nbr             = p_po_nbr
         and tx2d_line            = p_pod_line
   no-lock
   break by tx2d_line
         by tx2d_tax_code:
 
      if first-of(tx2d_tax_code)
      then
         p_accum_type_tax = 0.
 
      for first tx2_mstr where tx2_mstr.tx2_domain = global_domain
         and tx2_tax_code = tx2d_tax_code
      no-lock: end.
 
      if (tx2d_rcpt_tax_point and p_pod_type = "M") /* ACCRUE @ RECEIPT */
      or
         (       p_pod_type <>  "M"
         and  (      (tx2d_rcpt_tax_point)
         and  (  (not p_using_supplier_consignment or
         not p_consign_flag)
         )
         or
         /* ACCRUE @ USAGE */
         (p_using_supplier_consignment  and
         p_consign_flag                and
         tx2_usage_tax_point           and
         p_is_usage)
         )
         )
 
      then do:
 
         /* ACCRUE TAX AT RECEIPT */
         /* TAX INCLUDED = NO */
         if not tx2d_tax_in
         then do:
 
            /* ACCUMULATE TAXES FOR MULTIPLE TAX TYPES */
            if p_last_sr_wkfl then
               p_type_tax = p_type_tax + tx2d_cur_tax_amt - tx2d_cur_recov_amt.
            else
               p_type_tax = p_type_tax * (p_totl_qty_this_rcpt / p_trqty) +
                  (tx2d_cur_tax_amt - tx2d_cur_recov_amt).
 
            /* TO PREVENT ROUNDING ERRORS, THE LAST MULTI-ENTRY
               TRANSACTION WILL PLUG THE REMAINING TAX THAT HAS
               NOT BEEN ASSIGNED TO OTHER TRANSACTIONS. */
            if p_last_sr_wkfl
            then do:
               if p_type_tax <> 0 and
                  last-of(tx2d_line)
               then
                  p_type_tax = p_type_tax - p_accum_type_tax.
            end. /* IF p_last_sr_wkfl */
 
            else
            if p_totl_qty_this_rcpt <> 0
            then do:
 
               p_type_tax = p_type_tax * (p_trqty / p_totl_qty_this_rcpt).
 
               /* ROUND PER BASE CURRENCY ROUND METHOD */
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                  "(input-output p_type_tax,
                    input p_gl_rnd_mthd,
                    output mc-error-number)"}
            end. /* IF p_totl_qty_this_rcpt <> 0 */
 
         end. /* IF NOT tx2d_tax_in */
 
         else do:
 
            /* TAX INCLUDED = YES */
            /* ADDED p_type_tax = p_type_tax - tx2d_cur_recov_amt INSTEAD  */
            /* OF p_type_tax = - tx2d_cur_recov_amt TO PREVENT p_type_tax  */
            /* TO BE OVER-WRITTEN WHEN TWO TAX CODES ARE USED AND      */
            /* INCLUDED TAX CODE IS AFTER NON-INCLUDED TAX CODE IN THE */
            /* ASCENDING ORDER.                                        */
 
            p_type_tax = p_type_tax - tx2d_cur_recov_amt.
 
            /* TO PREVENT ROUNDING ERRORS, THE LAST MULTI-ENTRY
               TRANSACTION WILL PLUG THE REMAINING TAX THAT HAS
               NOT BEEN ASSIGNED TO OTHER TRANSACTIONS. */
 
            if p_last_sr_wkfl
            then do:
 
               if p_type_tax <> 0 then
                  p_type_tax = p_type_tax - p_accum_type_tax.
 
               else
               if p_totl_qty_this_rcpt <> 0
               then do:
 
                  p_type_tax = p_type_tax * (p_trqty / p_totl_qty_this_rcpt).
 
                  /* ROUND PER BASE CURRENCY ROUND METHOD */
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                     "(input-output p_type_tax,
                       input p_gl_rnd_mthd,
                       output mc-error-number)"}
 
               end. /* IF p_totl_qty_this_rcpt <> 0 */
 
            end. /* IF p_last_sr_wkfl */
 
            else
            if p_totl_qty_this_rcpt <> 0
            then do:
 
               p_type_tax = p_type_tax * (p_trqty / p_totl_qty_this_rcpt).
 
               /* ROUND PER BASE CURRENCY ROUND METHOD */
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                  "(input-output p_type_tax,
                    input p_gl_rnd_mthd,
                    output mc-error-number)"}
 
            end. /* IF p_totl_qty_this_rcpt <> 0 */
 
         end. /* ELSE DO */
 
      end. /* IF (tx2d_rcpt_tax_point) */
 
      else
      /* ACCRUE TAX AT VOUCHER */
      if tx2d_tax_in
      then do:
 
         /* TAX INCLUDED = YES */
         /* TO PREVENT ROUNDING ERRORS, THE LAST MULTI-ENTRY
            TRANSACTION WILL PLUG THE REMAINING TAX THAT HAS
            NOT BEEN ASSIGNED TO OTHER TRANSACTIONS. */
         if p_last_sr_wkfl
         then do:
 
            /* p_type_tax should accumulate tax for each tax type.   */
            p_type_tax = p_type_tax - tx2d_cur_tax_amt.

            if p_type_tax <> 0 then
               p_type_tax = p_type_tax - p_accum_type_tax.
 
            else
            if p_totl_qty_this_rcpt <> 0
            then do:
 
               p_type_tax = p_type_tax * (p_trqty / p_totl_qty_this_rcpt).
 
               /* ROUND PER BASE CURRENCY ROUND METHOD */
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                  "(input-output p_type_tax,
                    input p_gl_rnd_mthd,
                    output mc-error-number)"}
 
            end. /* IF p_totl_qty_this_rcpt <> 0 */
 
         end. /* IF p_last_sr_wkfl */
 
         else
         if p_totl_qty_this_rcpt <> 0
         then do:

            /* p_type_tax should accumulate tax for each tax type.   */
            /* For multi-entry, get the tax amt for each transaction */
            /* and add it to the previous amt.                       */
            p_type_tax = p_type_tax - 
                   (tx2d_cur_tax_amt * (p_trqty / p_totl_qty_this_rcpt)).
 
            /* ROUND PER BASE CURRENCY ROUND METHOD */
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
               "(input-output p_type_tax,
                 input p_gl_rnd_mthd,
                 output mc-error-number)"}
 
         end. /* IF p_totl_qty_this_rcpt <> 0  */
 
      end. /* IF tx2d_tax_in */
 
      /* FOR MULTIPLE TAX TYPES, POPULATE p_accum_type_tax */
      /* AT LAST TAX TYPE */
      if last-of(tx2d_line)
      then do:
 
         p_accum_type_tax = p_accum_type_tax + p_type_tax.
         assign p_mgmt_line_tax = p_mgmt_line_tax + p_type_tax.
         if p_base_curr <> p_po_curr
         then do:
 
            /* CONVERT TYPE_TAX TO BASE CURRENCY */
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
               "(input p_po_curr,
                 input p_base_curr,
                 input p_exch_rate,
                 input p_exch_rate2,
                 input p_type_tax,
                 input true, /* DO ROUND */
                 output p_type_tax,
                 output mc-error-number)"}.
 
            if mc-error-number <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end. /* IF mc-error-number <> 0 */
 
         end. /* IF p_base_curr <> p_po_curr  */
 
         p_line_tax = p_line_tax + p_type_tax.
 
      end. /* IF LAST-OF(tx2d_line)  */
 
   end. /* FOR EACH tx2d_det */
 
END PROCEDURE. /* TAX LOOP */
