/* xxauis01.p  - Shipper auto create - main processing program                */
/* rcauis01.p  - Shipper auto create - main processing program                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxauis01.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/*                                                                            */
/* Description: This program contains most of the processing done in          */
/* rcsois1.p. Some code has been cloned and the remainder restructured for    */
/* better flow and readability. Because it relies on old existing             */
/* programs to do the processing, this program has to depend on shared        */
/* variables.                                                                 */
/*                                                                            */
/* REVISION: 9.1            CREATED: 04/01/00   BY: *N0B5* Vinay Nayak-Sujir  */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KP* Mark Brown         */
/* Revision: 1.3      BY: Katie Hilbert         DATE: 04/01/01   ECO: *P002*  */
/* Revision: 1.4      BY: Rajaneesh Sarangi     DATE: 06/29/01   ECO: *M1CP*  */
/* Revision: 1.6      BY: Dan Herman            DATE: 02/06/02   ECO: *P00G*  */
/* Revision: 1.8      BY: Amit Chaturvedi       DATE: 04/23/02   ECO: *N1H3*  */
/* Revision: 1.9      BY: Jean Miller           DATE: 05/23/02   ECO: *P074*  */
/* Revision: 1.10     BY: Sandeep Parab         DATE: 06/04/02   ECO: *M1XH*  */
/* Revision: 1.11     BY: Sandeep Parab         DATE: 06/20/02   ECO: *P09G*  */
/* Revision: 1.12     BY: Robin McCarthy        DATE: 07/02/02   ECO: *P0B2*  */
/* Revision: 1.13     BY: Samir Bavkar          DATE: 07/07/02   ECO: *P0B0*  */
/* Revision: 1.14     BY: Robin McCarthy        DATE: 07/15/02   ECO: *P0BJ*  */
/* Revision: 1.15     BY: Samir Bavkar          DATE: 08/15/02   ECO: *P09K*  */
/* Revision: 1.16     BY: Samir Bavkar          DATE: 08/18/02   ECO: *P0FS*  */
/* Revision: 1.17     BY: Manjusha Inglay       DATE: 08/27/02   ECO: *N1S3*  */
/* Revision: 1.18     BY: Manisha Sawant        DATE: 09/23/02   ECO: *N1QH*  */
/* Revision: 1.19     BY: Rajiv Ramaiah         DATE: 01/13/03   ECO: *N23Z*  */
/* Revision: 1.21     BY: Robin McCarthy        DATE: 02/28/03   ECO: *P0M9*  */
/* Revision: 1.23     BY: Paul Donnelly (SB)    DATE: 06/28/03   ECO: *Q00K*  */
/* Revision: 1.24     BY: Rajinder Kamra        DATE: 05/05/03   ECO: *Q003*  */
/* Revision: 1.25     BY: Deepak Rao            DATE: 08/20/03   ECO: *N2K3*  */
/* Revision: 1.26     BY: Deepak Rao            DATE: 09/08/03   ECO: *N2KM*  */
/* Revision: 1.27     BY: Vinay Soman           DATE: 10/22/03   ECO: *N2M1*  */
/* Revision: 1.28     BY: Vinay Soman           DATE: 10/27/03   ECO: *N2M8*  */
/* Revision: 1.29     BY: Ed van de Gevel       DATE: 12/24/03   ECO: *Q04S*  */
/* Revision: 1.30     BY: Abhishek Jha          DATE: 07/23/04   ECO: *P2B9*  */
/* Revision: 1.31     BY: Shivaganesh Hegde     DATE: 08/03/04   ECO: *P26L*  */
/* Revision: 1.32     BY: Shivaganesh Hegde     DATE: 09/22/04   ECO: *P2LM*  */
/* Revision: 1.33     BY: Sushant Pradhan       DATE: 12/17/04   ECO: *P2Z7*  */
/* Revision: 1.34     BY: Ed van de Gevel       DATE: 03/07/05   ECO: *R00K*  */
/* Revision: 1.35     BY: Preeti Sattur         DATE: 03/17/05   ECO: *P3CL*  */
/* Revision: 1.36     BY: Preeti Sattur         DATE: 03/28/05   ECO: *P3DD*  */
/* Revision: 1.37     BY: Priya Idnani          DATE: 04/18/05   ECO: *P3GW*  */
/* Revision: 1.38     BY: Somesh Jeswani        DATE: 08/23/05   ECO: *P3YQ*  */
/* Revision: 1.40     BY: Steve Nugent          DATE: 10/03/05   ECO: *R027*  */
/* Revision: 1.41     BY: Dan Herman            DATE: 03/21/06   ECO: *R001*  */
/* Revision: 1.42     BY: Munira Savai          DATE: 04/24/06   ECO: *P4N7*  */
/* Revision: 1.43     BY: Sumit Karunakaran     DATE: 07/18/07   ECO: *P5HV*  */
/* Revision: 1.44     BY: Jean Miller           DATE: 09/13/07   ECO: *R0C6*  */
/* Revision: 1.46     BY: Arun Nair             DATE: 07/12/07   ECO: *R08C*  */
/* Revision: 1.49     BY: Steve Nugent          DATE: 01/30/08   ECO: *R059*  */
/* Revision: 1.50     BY: Neil Curzon           DATE: 03/17/08   ECO: *R0P6*  */
/* Revision: 1.51     BY: Vivek Kamath          DATE: 04/22/08   ECO: *P4LG*  */
/* Revision: 1.52     BY: Jean Miller           DATE: 06/15/08   ECO: *R0V6*  */
/* Revision: 1.54     BY: Jean Miller           DATE: 06/22/08   ECO: *R0VH*  */
/* Revision: 1.55     BY: Jean Miller           DATE: 07/08/08   ECO: *Q1C3*  */
/* Revision: 1.56     BY: Katie Hilbert         DATE: 11/07/08   ECO: *R175*  */
/* Revision: 1.57     BY: Kunal Pandya          DATE: 01/05/09   ECO: *Q20C*  */
/* Revision: 1.58     BY: Jiang Wan             DATE: 03/02/09   ECO: *R1BY*  */
/* Revision: 1.59     BY: Xavier Prat           DATE: 07/10/09   ECO: *R1M2*  */
/* Revision: 1.60     BY: Jean Miller           DATE: 09/04/09   ECO: *Q3C7*  */
/* Revision: 1.61     BY: Jean Miller           DATE: 09/24/09   ECO: *P69Z*  */
/* Revision: 1.62     BY: Katie Hilbert         DATE: 02/20/10   ECO: *R1YB*  */
/* Revision: 1.63     BY: Jordan Fei            DATE: 03/05/10   ECO: *R22Q*  */
/* Revision: 1.64     BY: Jordan Fei            DATE: 08/10/10   ECO: *R24T*  */
/* CYB                    BY: gbg            DATE: 09-JUL-2010 ECO: *c1184*  */
/* CYB    LAST MODIFIED: 27-JUL-2011    BY:  nac *c1226*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 09-AUG-2013    BY:  gbg *c1432*                     */
/* CYB   LAST MODIFIED: 22-JAN-2014    BY: gbg *c1454* Retrofit Q1066540      */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/* Revision: QAD2016    BY: nac      DATE: 27Nov17   ECO: *d4081-877* */
/*                                                    patch: Q1338820 */
/* CYB LAST MODIFIED: 2018-JAN-18      BY: gbg D4081                          */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
using com.qad.eefin.bdomain.DomainForOperationalInfo.
using com.qad.eefin.bexchangeratetype.ExchangeRateTypeByTypeCode.
using com.qad.eefin.bcurrency.SelectCurrency.

{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i}
{us/pp/ppprlst.i}   /* PRICE LIST CONSTANTS */
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}
{us/so/sottval.i}  /* COMMON TEMP-TABLES FOR SHIPPER/ASN VALIDATION */
{us/so/sovalcon.i} /* COMMON CONSTANTS FOR SHIPPER/ASN VALIDATION */
{us/so/sovalprc.i} /* COMMON PROCEDURES FOR SHIPPER/ASN VALIDATION */
{us/gp/gpldcons.i} /* CONSTANTS FOR LEGAL DOCUMENT */
{us/px/pxmaint.i}
{us/px/pxphdef.i sosodxr}
{us/fs/fsdeclr.i new}
{us/mf/mfsprtdf.i new}
{us/so/soivtot1.i new}  /* Define variables for invoice totals. */
{us/rc/rcsois.i new}
{us/tx/txmethod.i}

{proxy/datasets/tfcmessages.i } /* Q1338820 */

/*c1603* start added code >>>>>>> */
/*cy1045*/ {us/xf/xfso10u.i "new"} /*eb3sp5*/
/*cy1045*/ {us/xf/xfso10v.i "new"} /*eb3sp5*/
/*c1603* end added code  <<<<<<< */

define input  parameter  shipfrom             like abs_shipfrom no-undo.
define input  parameter  absid                like abs_id       no-undo.
define input  parameter  ship_date            as date           no-undo.
define input  parameter  effective_date       as date           no-undo.
define input  parameter  post_inv             like mfc_logical  no-undo.
define input  parameter  consol_inv           like mfc_logical  no-undo.
define input  parameter  err_file             as character      no-undo.
define input  parameter  junk_file            as character      no-undo.
define input  parameter  plUpdateDbkSet       as logical        no-undo.
define input  parameter  pcDaybookSet         as character      no-undo.
define input  parameter  pPostFile            as character      no-undo.
define input  parameter  p_prtInstBase        like mfc_logical  no-undo.
define output parameter  shipper_processed_ok like mfc_logical  no-undo.
define output parameter  table                for ttisb.


/*cy1045*/ define shared variable print_inv like mfc_logical .
/*Q9021*/
define shared variable cyb_van like so_shipvia label "Van" no-undo.
define shared variable cyb_van1 like so_shipvia. 
/*Q9021*/
/*cy1045*/ {us/xf/xfdefa.i "NEW"}
/*cy1021*/ {us/xx/xxauis2.i}


 
define new shared variable rndmthd like rnd_rnd_mthd.
define new shared variable abs_carr_ref as character.
define new shared variable abs_fob like so_fob.
define new shared variable abs_recid as recid.
define new shared variable abs_shipvia like so_shipvia.
define new shared variable accum_wip like tr_gl_amt.
define new shared variable already_posted like glt_amt.
define new shared variable auto_post like mfc_logical.
define new shared variable base_amt like ar_amt.
define new shared variable batch like ar_batch.
define new shared variable first_batch like ar_batch.
define new shared variable batch_tot like glt_amt.
define new shared variable bill like so_bill.
define new shared variable bill1 like so_bill.
define new shared variable change_db like mfc_logical.
define new shared variable consolidate like mfc_logical.
define new shared variable cr_acct like trgl_cr_acct.
define new shared variable cr_amt as decimal format "->>>,>>>,>>>.99".
define new shared variable cr_cc like trgl_cr_cc.
define new shared variable cr_proj like trgl_cr_proj.
define new shared variable cr_sub  like trgl_cr_sub.
define new shared variable curr_amt like glt_amt.
define new shared variable cust like so_cust.
define new shared variable cust1 like so_cust.
define new shared variable ship  like so_ship. 
define new shared variable ship1 like so_ship. 
define new shared variable desc1 like pt_desc1 format "x(49)".
define new shared variable dr_acct like trgl_dr_acct.
define new shared variable dr_amt as decimal format "->>>,>>>,>>>.99".
define new shared variable dr_cc like trgl_dr_cc.
define new shared variable dr_sub like trgl_dr_sub.
define new shared variable eff_date like glt_effdate.
define new shared variable exch_rate like exr_rate.
define new shared variable exch_rate2 like exr_rate2.
define new shared variable exch_ratetype like exr_ratetype.
define new shared variable exch_exru_seq like exru_seq.
define new shared variable ext_cost like sod_price.
define new shared variable ext_disc as decimal decimals 2.
define new shared variable gr_margin like sod_price
   format "->>>>,>>9.99".
define new shared variable ext_gr_margin like gr_margin.
define new shared variable base_margin like ext_gr_margin.
define new shared variable ext_list like sod_list_pr decimals 2.
define new shared variable ext_price as decimal
   decimals 2 format "->>>>,>>>,>>9.99".
define new shared variable base_price like ext_price.
define new shared variable freight_ok like mfc_logical.
define new shared variable gl_amt like sod_fr_chg.
define new shared variable gl_sum like mfc_logical initial yes.
define new shared variable inv like ar_nbr.
define new shared variable inv1 like ar_nbr label "To".
define new shared variable inv_only like mfc_logical initial yes.
define new shared variable loc like pt_loc.
define new shared variable lotserial_total like tr_qty_chg.
define new shared variable name like ad_name.
define new shared variable nbr like tr_nbr.
define new shared variable net_price like sod_price.
define new shared variable net_list like sod_list_pr.
define new shared variable old_ft_type as character.
define new shared variable ord-db-cmtype like cm_type no-undo.
define new shared variable order_ct as integer.
define new shared variable order_nbrs as character extent 30.
define new shared variable order_nbr_list as character no-undo.
define new shared variable part as character format "x(18)".
define new shared variable post like mfc_logical.
define new shared variable post_entity like ar_entity.
define new shared variable print_lotserials like mfc_logical.
define new shared variable project like wo_project no-undo.
define new shared variable que-doc as logical.
define new shared variable qty as decimal.
define new shared variable qty_all like sod_qty_all.
define new shared variable qty_pick like sod_qty_pick.
define new shared variable qty_bo like sod_bo_chg.
define new shared variable qty_chg like sod_qty_chg.
define new shared variable qty_cum_ship like sod_qty_ship.
define new shared variable qty_inv like sod_qty_inv.
define new shared variable qty_iss_rcv like tr_qty_loc.
define new shared variable qty_left like tr_qty_chg.
define new shared variable qty_open like sod_qty_ord.
define new shared variable qty_ord like sod_qty_ord.
define new shared variable qty_req like in_qty_req.
define new shared variable qty_ship like sod_qty_ship.
define new shared variable ref like glt_ref.
define new shared variable rejected like mfc_logical no-undo.
define new shared variable rmks like tr_rmks.
define new shared variable sct_recid as recid.
define new shared variable sct_recno as recid.
define new shared variable ship_db like global_db.
define new shared variable ship_dt like so_ship_date.
define new shared variable ship_line like sod_line.
define new shared variable ship_site as character.
define new shared variable ship_so like so_nbr.
define new shared variable should_be_posted like glt_amt.
define new shared variable so_db like global_db.
define new shared variable so_job like tr_so_job.
define new shared variable so_hist like soc_so_hist.
define new shared variable so_mstr_recid as recid.
define new shared variable so_recno as recid.
define new shared variable sod_entity like en_entity.
define new shared variable sod_recno as recid.
define new shared variable std_cost like sod_std_cost.
define new shared variable tax_recno as recid.
define new shared variable tot_curr_amt like glt_amt.
define new shared variable tot_ext_cost like sod_price.
define new shared variable tot_line_disc as decimal decimals 2.
define new shared variable tr_recno as recid.
define new shared variable transtype as character format "x(7)".
define new shared variable trgl_recno as recid.
define new shared variable trlot like tr_lot.
define new shared variable trqty like tr_qty_chg.
define new shared variable unit_cost like tr_price.
define new shared variable undo_all like mfc_logical no-undo.
define new shared variable wip_entity like si_entity.
define new shared workfile work_sr_wkfl like sr_wkfl.
define new shared variable yn like mfc_logical.
define new shared variable critical-part like wod_part no-undo.
define new shared variable prog_name as character initial "rcauis.p"
   no-undo.
define new shared variable confirm_mode like mfc_logical no-undo.
define new shared variable auto_inv     like mfc_logical.
define new shared variable l_undo       like mfc_logical no-undo.
define new shared variable report_framework like mfc_logical initial no no-undo.
define new shared variable comp_addr        like soc_company. 

define shared variable global_recid as recid.
define variable c_ld_form_code like df_ld_form_code no-undo.
define variable c_seq_id       like lgdnr_seq_id    no-undo.
define variable l_elec         like lgdnr_elec      no-undo.
define variable abs_trans_mode as character.
define variable abs_veh_ref as character.
define variable first_so_bill like so_bill.
define variable first_so_cust like so_cust.
define variable first_so_curr like so_curr.
define variable first_so_cr_terms like so_cr_terms.
define variable first_so_slspsn like so_slspsn.
define variable first_so_trl1_cd like so_trl1_cd.
define variable first_so_trl2_cd like so_trl2_cd.
define variable first_so_trl3_cd like so_trl3_cd.
define variable first_so_entity like si_entity no-undo.
define variable l_first_so_nbr like so_nbr no-undo.
 
define variable msg_text as character.
define variable shipqty as decimal no-undo.
define variable txcalcref as character.
define variable l_consolidate_ok like mfc_logical no-undo.
define variable oldcurr like so_curr.
define variable errorst like mfc_logical no-undo.
define variable errornum as integer no-undo.
define variable l_disc_pct1 as decimal no-undo.
define variable l_net_price as decimal no-undo.
define variable l_list_price as decimal no-undo.
define variable l_rec_no as recid no-undo.
define variable change-queued as logical no-undo.
define variable l_flag like mfc_logical no-undo.
define variable undo_stat like mfc_logical no-undo.
define variable validation_ok like mfc_logical no-undo.
define variable continue_process like mfc_logical no-undo.
define variable use-log-acctg         as logical no-undo.
define variable first_so_site         like  so_site      no-undo.
define variable first_so_ex_rate      like  so_ex_rate   no-undo.
define variable first_so_ex_rate2     like  so_ex_rate2  no-undo.
define variable first_so_exru_seq     like  so_exru_seq  no-undo.
define variable tot_freight_gl_amt    like sod_fr_chg. /* NOT NO-UNDO */
define variable l_wo_reject           like mfc_logical   no-undo.
define variable l_so_to_inv           like so_to_inv     no-undo.
define variable formcode_flg          as logical         no-undo.
define variable using_consign         as logical         no-undo.
define variable mapping_simul         as logical         no-undo.
define variable shipping_tax          as character       no-undo.
define variable c_tax_list            as character       no-undo.
define variable i_consign_num         as integer         no-undo.
define variable dExcessQty            as decimal         no-undo.
define variable l_vertex              like mfc_logical   no-undo.
define variable l_ordertotal          as decimal         no-undo.
define variable l_before_ordertotal   as decimal         no-undo.
define variable l_is_mutiple_so       like mfc_logical initial no   no-undo.
define variable DomainInfo            as DomainForOperationalInfo   no-undo.
define variable ExchangeRateType      as ExchangeRateTypeByTypeCode no-undo.
define variable StatCurrency          as SelectCurrency             no-undo.
define variable l_disperr             as logical no-undo.
define variable l_brazil_ld           as logical no-undo.
define variable temp_so_ship        like so_ship           no-undo.
define variable temp_so_qadc01      like so__qadc01        no-undo.
define variable temp_fob            like so_fob extent 30.
define variable temp_shipvia        like so_shipvia extent 30.
define variable temp_fob_list       as character           no-undo.
define variable temp_shipvia_list   as character           no-undo.
define variable l_traddr            like tr_addr           no-undo.
define variable l_qty_iss_rcv       like tr_qty_loc        no-undo.
define variable l_error             as logical       no-undo.
define variable l_errlevel            like umsg_level    no-undo.
define variable l_absr_qty            like absr_qty      no-undo. 
define variable l_ship_reject         like mfc_logical   no-undo.

/*Q1338820 added below*/
define variable finTransCommitted     as logical no-undo.
define variable finAPIError           as integer no-undo.
define variable hQADFinInvPostLib as handle no-undo.
/*Q1338820 added*/

/* CREDIT MANAGEMENT */
define variable hCreditLibrary    as handle        no-undo.
define variable iReturnStatus     as integer       no-undo.
{us/mf/mfcredpl.i "hCreditLibrary"}
run initialiseCreditManagementLibrary ( input  hCreditLibrary,
                                        output hCreditLibrary).
define stream abs.
define variable lValErrors as logical no-undo.
define variable lValWarns as logical no-undo.
 
define temp-table tt_sod_det no-undo
   field tt_sod_nbr  like sod_nbr
   field tt_sod_line like sod_line
   field tt_pr_found as logical
   index i_sodnbr tt_sod_nbr.
 
define new shared temp-table work_ldd no-undo
   field work_ldd_id like abs_id
   index work_ldd_id work_ldd_id .
  
define temp-table tt_somstr no-undo
   field tt_sonbr   like so_nbr
   field tt_sotoinv like mfc_logical initial no
   index sonbr is primary unique
   tt_sonbr.

define temp-table temp_somstr
   field temp_so_nbr like so_nbr
   field temp_so_inv_nbr like so_inv_nbr
   field temp_so_inv_date like so_inv_date
index temp_so_nbr temp_so_nbr ascending.
 
define new shared temp-table IntraStat field  StatID as recid.
 
FUNCTION isSimulMismatched returns logical(
   input p_shipfrom as character,
   input p_shipto   as character) forward.
 
{us/gp/gpscdef.i}
{us/rc/rcwabsdf.i new}
{us/et/etvar.i &new="new"}
{us/et/etdcrvar.i "new"}
{us/et/etrpvar.i &new="new"}
{us/et/etsotrla.i "new"}
{us/gp/gpglefdf.i}
{us/tx/txcalvar.i}
{us/rc/rcsois1.i new}

{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/bbi/gpfilev.i}    /* VARIABLE DEFINATIONS FOR gpfile.i */
 
/* CONSIGNMENT VARIABLES */
{us/so/socnvars.i}
 
/* FREIGHT ACCRUAL TEMP TABLE DEFINITION */
{us/la/lafrttmp.i "new"}
 
pause 0 before-hide.
 
/* DETERMINE IF CUSTOMER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ENABLE_CUSTOMER_CONSIGNMENT,
     input 10,
     input ADG,
     input CUST_CONSIGN_CTRL_TABLE,
     output using_cust_consignment)"}
 
/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}
 
/* CHECK FOR ENABLEMENT OF CONTAINER AND LINE CHARGES */
{us/cc/cclc.i}

subscribe to "p_giveErrorMsgForTaxLD" anywhere.
 
for first shc_ctrl where shc_domain = global_domain
no-lock: end.
 
/* Set the values of the shared vars. Since this routine re-uses
   a lot of processing, the existing shared vars have to get correctly
   updated. Besides other initialization */
assign
   ship_dt       = ship_date
   eff_date      = effective_date
   auto_post     = post_inv
   consolidate   = consol_inv
   confirm_mode  = yes
   oldcurr       = ""
   validation_ok = no
   shipper_processed_ok = no.
 
run del-qad-wkfl.
 
for each work_abs_mstr exclusive-lock:
   delete work_abs_mstr.
end.
 
for each work_ldd exclusive-lock:
   delete work_ldd.
end. /* FOR EACH work_ldd */
 
output to value (err_file).
{us/gp/gpscproxy.i}
mainblk:
do transaction:
 
   for first abs_mstr where abs_domain = global_domain and
      abs_id = absid and
      abs_shipfrom = shipfrom
   no-lock: end.
 
   if not available abs_mstr then do:
      /* Shipper/Preshipper does not exist */
      run ip_msg (input 8147,input 3).
      undo mainblk, leave mainblk.
   end.
 
   abs_recid = recid(abs_mstr).

   /* CHECK IF BRAZIL LEGAL DOCUMENT FUNCTIONALITY IS ENABLED */
   l_brazil_ld = no.
   /* GET LEGAL DOCUMENT FORM CODE */
   {us/gp/gprunp.i "soldxr" "p" "isBrazilStyleLD"
             "(input  abs_mstr.abs_shipfrom,
               input  abs_mstr.abs_id,
               output l_brazil_ld)"}
 
   /* Explode shipper to get order detail. This creates
      a copy of the shipper and its child records in work_abs_mstr */
   {us/bbi/gprun.i ""rcsoisa.p"" "(input abs_recid)"}


/*debug******
   if not can-find(first work_abs_mstr
                      where work_abs_mstr.abs_order <> "")
   then do:
      /* SALES ORDER DOES NOT EXIST  */
      run ip_msg (input 609,
                  input 3).
      undo mainblk,leave mainblk.
   end. /* IF NOT CAN-FIND(FIRST work_abs_mstr */
*debug*/
   /* ADDED THE BLOCK TO CHECK WHETHER THE SALES ORDER IS */
   /* ATTACHED TO THE SHIPPER LINE ITEM. IF THE SO IS NOT */
   /* ATTACHED, THE SHIPPER WILL NOT GET CONFIRMED AND    */
   /* THE DETAILS WILL BE PRINTED IN 'shipper.err' FILE  */
   if can-find(first work_abs_mstr
                  where (work_abs_mstr.abs_id begins "ic"
                      or work_abs_mstr.abs_id begins "is")
                  and   work_abs_mstr.abs_order = ""
                  and   work_abs_mstr.abs_line  = "")
   then do:
      run abs_audit.
      undo, retry.
   end. /* IF CAN-FIND */
 
   /* ADD CONSIGNMENT DATA TO work_abs_mstr */
   if using_cust_consignment then do:
      {us/gp/gprunmo.i &module = "ACN" &program = "rcsoisa2.p"}
   end.  /* if using_cust_consignment */
 
   /* Validate contents of the shipper */
   run ip_val_shipper_details
      (input abs_recid,
      output validation_ok).
   if validation_ok = false then
      undo mainblk, leave mainblk.
 
   if confirm_mode and substring(abs_status,1,1) <> "y" then
   /* Shipper not printed */
   run ip_msg (input 8147,input 2).
 
   assign
      abs_shipvia    = substring(abs__qad01,1,20)
      abs_fob        = substring(abs__qad01,21,20)
      abs_carr_ref   = substring(abs__qad01,41,20)
      abs_trans_mode = substring(abs__qad01,61,20)
      abs_veh_ref    = substring(abs__qad01,81,20).
 
   if abs_mstr.abs_id begins "p" then do:
      continue_process = no.
      run ip_gen_shipper_num
         (input abs_recid,
         output continue_process).
      if not continue_process then
         undo mainblk, leave mainblk.
   end.
 
   /* Check for unpegged shipper lines */
   {us/bbi/gprun.i ""rcsois4a.p""
      "(input abs_recid,
        output yn)"}
   if yn then undo mainblk, leave mainblk.
 
   /* Validates that there is adequate inventory available to ship all
   lines with same site, loc & part if over-issue not allowed */
   {us/bbi/gprun.i ""rcsoisg.p""}
   if rejected then undo mainblk, leave mainblk.
 
   assign
      tot_freight_gl_amt = 0
      order_ct = 0.
 
   /* CHECK IF WORK ORDER IS RELEASED OR ALLOCATED */
   /* FOR ATO CONFIGURED ITEMS                     */
   for each work_abs_mstr where work_abs_mstr.abs_order <> ""
   no-lock:
 
      for first sod_det where sod_domain =  global_domain
         and sod_nbr    =  abs_order
         and sod_line   =  integer(abs_line)
         and sod_compl_stat = ""
      no-lock:

         /* SAVE THE ORDER TOTAL, THIS COULD BE A NEW ORDER OR AN EXISTING ORDER,*/
         /* STORE THIS VALUE, IT IS USED AS A BEFORE VALUE */
         /* addSalesOrderTotal CREATES TEMP-TABLE WHICH STORES THE ORDER TOTAL */
         if sod_sched 
         then
            run addSalesOrderTotal in hCreditLibrary
                     ( input sod_nbr,
                       input getOrderTotal( input sod_nbr)).
 
      l_wo_reject = no.
 
      if sod_lot <> ""
      then do:
 
         for first wo_mstr
            where wo_domain = global_domain
            and wo_lot    = sod_lot
         no-lock:
         end. /* FOR FIRST wo_mstr */
 
         if available wo_mstr
            and lookup(wo_status, "A,R,C") = 0
         then
            l_wo_reject = yes.
 
      end. /* IF sod_lot <> "" */
 
      else do:
 
         if sod_fa_nbr <> ""
         then do:
 
            for first wo_mstr
               where wo_domain = global_domain
                 and wo_nbr    = sod_fa_nbr
                 and lookup(wo_status, "A,R,C") = 0
            no-lock:
            end. /* FOR FIRST wo_mstr */
 
            if available wo_mstr
            then
               l_wo_reject = yes.
 
         end. /* IF sod_fa_nbr <> "" */
 
      end. /* ELSE */
 
      if l_wo_reject = yes
      then do:
 
         /* WORK ORDER ID IS CLOSED, PLANNED OR */
         /* FIRM PLANNED                        */
         {us/bbi/pxmsg.i &MSGNUM=523 &ERRORLEVEL=4
            &MSGARG1= "'-' + wo_nbr" }
 
         shipper_processed_ok = no.
         undo mainblk, leave mainblk.
 
      end. /* IF l_wo_reject */
 
   end. /* FOR FIRST sod_det */
 
end. /* FOR EACH work_abs_mstr */
 
/* VALIDATE SHIPPER DATA AND REPORT ERRORS.    */
/* IF ERRORS EXIST, DO NOT ALLOW THE CONFIRM.  */
/* FIRST VALIDATE FIELDS SETUP TO BE VALIDATED */
/* SPECIFICALLY AT CONFIRM TIME.               */
lValErrors = false.
run validateFieldsAtConfirm
   (input abs_shipfrom,
    input abs_shipto,
    input abs_shp_date,
    input abs_id,
    input {&TYPE_Confirm}).
 
/* IF HARD VALIDATION ERRORS HAVE OCCURED PREVENT THE SHIPPER */
/* FROM BEING CONFIRMED.                                      */
run checkForValidationErrors
   (input abs_id,
    input abs_shipfrom,
    output lValErrors,
    output lValWarns).
 
if lValErrors = true
then do:
   {us/bbi/pxmsg.i &MSGNUM=8905 &ERRORLEVEL=4}
   leave.
end.
 
/* NOW VALIDATE ALL FIELDS ON THE SHIPPER */
run validateFieldsAtConfirm
   (input abs_shipfrom,
    input abs_shipto,
    input abs_shp_date,
    input abs_id,
    input {&TYPE_Shipper}).
 
/* IF HARD VALIDATIONS ERRORS HAVE OCCURED PREVENT THE SHIPPER */
/* FROM BEING CONFIRMED.                                       */
run checkForValidationErrors
   (input abs_id,
    input abs_shipfrom,
    output lValErrors,
    output lValWarns).
 
if lValErrors = true
then do:
   {us/bbi/pxmsg.i &MSGNUM=8905 &ERRORLEVEL=4}
   leave.
end.
 
if isSimulMismatched(input abs_mstr.abs_shipfrom,
                     input abs_mstr.abs_shipto)
then do:
   /* Mismatch with pending invoice - cannot consolidate */
   run ip_msg(input 1046, input 3).
   leave.
end.
 
for each work_abs_mstr no-lock,
    each sod_det where sod_domain = global_domain
       and sod_nbr = abs_order
       and sod_line = integer(abs_line)
       and sod_compl_stat = ""
exclusive-lock
break by sod_nbr by sod_line:
 
   if first(sod_nbr) then
      for first so_mstr where so_domain = global_domain
         and so_nbr = sod_nbr
         and so_compl_stat = ""
      exclusive-lock: end.


 
   if available(so_mstr) 
/*c1184*/   and   (so_shipvia < cyb_van or so_shipvia > cyb_van1)
   and plUpdateDbkSet then
      so_daybookset = pcDaybookSet.
 
   if (oldcurr <> so_curr) or (oldcurr = "") then do:
 
      {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
         "(input so_curr,
           output rndmthd,
           output mc-error-number)"}
 
      if mc-error-number <> 0 then do:
         run ip_msg (input mc-error-number,input 3).
         undo mainblk, leave mainblk.
      end.
 
      oldcurr = so_curr.
   end.
 
   if first(sod_nbr) then do:
 
      assign
         l_first_so_nbr     = so_nbr
         first_so_bill      = so_bill
         first_so_cust      = so_cust
         first_so_curr      = so_curr
         first_so_cr_terms  = so_cr_terms
         first_so_trl1_cd   = so_trl1_cd
         first_so_trl2_cd   = so_trl2_cd
         first_so_trl3_cd   = so_trl3_cd
         first_so_slspsn[1] = so_slspsn[1]
         first_so_slspsn[2] = so_slspsn[2]
         first_so_slspsn[3] = so_slspsn[3]
         first_so_slspsn[4] = so_slspsn[4]
         first_so_site      = so_site
         first_so_ex_rate   = so_ex_rate
         first_so_ex_rate2  = so_ex_rate2
         first_so_exru_seq  = so_exru_seq.
 
      for first si_mstr
         where si_domain = global_domain and
               si_site = so_site
      no-lock: end.
 
      first_so_entity = if available si_mstr then
                           si_entity
                        else "".
 
      {us/bbi/gprun.i ""gpcust.p""
         "(input  so_nbr,
           output ord-db-cmtype)"}
 
   end. /* if first(sod_nbr)  */
   else 
      l_is_mutiple_so = yes.
 
   shipqty = (if confirm_mode then
                 (work_abs_mstr.abs_qty - work_abs_mstr.abs_ship_qty)
              else
                 (work_abs_mstr.abs_qty)) * decimal(work_abs_mstr.abs__qad03).
 
   if abs_item = sod_part then
      accumulate shipqty (sub-total by sod_line).
 
/*c1432* start added code */
   create ttLinesProcessed.
   assign
   ttLineOrder = sod_nbr
   ttLineNumber = sod_line.
/*c1432* end   added code */




   if first-of(sod_nbr) then do:
/*cy1021*/ create ttOrdersProcessed.
/*cy1021*/ ttOrderNo = sod_nbr.
      l_so_to_inv = no.
      order_ct = order_ct + 1.
 
      if order_ct <= 30 then
         order_nbrs[order_ct] = sod_nbr.
      else
         order_nbr_list = order_nbr_list + sod_nbr + ",".
 
      if consolidate then do:
         msg_text = "".
 
         {us/bbi/gprun.i ""soconso.p""
            "(input 2,
              input  l_first_so_nbr ,
              input  so_nbr ,
              output l_consolidate_ok,
              output msg_text)"}
 
         if msg_text > "" then do:
            /* Mismatch with pending invoice - cannot consolidate */
            {us/bbi/pxmsg.i &MSGNUM=1046 &ERRORLEVEL=3 &MSGARG1=msg_text}
            undo mainblk, leave mainblk.
         end.
 
      end. /* if consolidate  */
 
      if use-log-acctg then do:
 
         msg_text = "".
 
         run validateSOForLogisticsAccounting
            (input l_first_so_nbr,
            input so_nbr,
            output msg_text).
 
         if msg_text > "" then do:
            /* ALL ATTACHED ORDERS MUST HAVE SAME # */
            {us/bbi/pxmsg.i &MSGNUM=5588 &ERRORLEVEL=3 &MSGARG1=msg_text}
            undo mainblk, leave mainblk.
         end.
 
      end. /* IF USE-LOG-ACCTG */
 
      if so_fix_rate then
      assign
         exch_rate = so_ex_rate
         exch_rate2 = so_ex_rate2
         exch_ratetype = so_ex_ratetype
         exch_exru_seq = so_exru_seq.
 
      else do:
         {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
            "(input  so_curr,
              input  base_curr,
              input  so_ex_ratetype,
              input  eff_date,
              output exch_rate,
              output exch_rate2,
              output mc-error-number)" }
 
         if mc-error-number <> 0 then do:
            run ip_msg (input mc-error-number,input 3).
            undo mainblk, leave mainblk.
         end.
 
         assign
            exch_ratetype = so_ex_ratetype
            exch_exru_seq = 0.
      end. /* else  (if so_fix_rate) */
 
      for first so_mstr where so_domain = global_domain
         and so_nbr = sod_nbr
         and so_compl_stat = ""
      exclusive-lock:
         assign
            so_ship_date = ship_dt
            so_tax_date = ship_dt.
 
      end.
 
   end. /* if first-of(sod_nbr)  */
 
   if last-of(sod_line) then do:
 
      if change_db then do:
         run ip_alias (input ship_db,output l_flag).
         if l_flag then undo mainblk, leave mainblk.
      end.
 
      {us/bbi/gprun.i ""gpsct05.p""
         "(input sod_part,
           input sod_site,
           input 1,
           output glxcst,
           output curcst)"}
 
      if change_db then do:
         run ip_alias (input so_db,output l_flag).
         if l_flag then undo mainblk, leave mainblk.
      end.
 
      if sod_type <> "M"
         then
         sod_std_cost = glxcst * sod_um_conv.
 
      if sod_sched then do:
 
         /*CHECK IF ORDER LINE IS EFFECTIVE*/
         if sod_start_eff[1] > today or
            sod_end_eff[1] < today then do:
 
            /* SCHEDULED ORDER LINE NOT EFFECTIVE */
            {us/bbi/pxmsg.i &MSGNUM=10358 &ERRORLEVEL=2}
         end. /*if sod_start_eff[1] < today or */
 
         /*CHECK IF END EFFECTIVE QTY HAS BEEN EXCEEDED*/
         if sod_cum_qty[3] > 0 then do:
            dExcessQty = 0.
            {us/px/pxrun.i &PROC='calculateEndEffectiveQtyExcess'
               &PROGRAM='sosodxr.p'
               &HANDLE=ph_sosodxr
               &PARAM="(input sod_nbr,
                        input sod_line,
                        input 0,
                        input sod_cum_qty[3],
                        input so_cum_acct,
                        output dExcessQty)"
               &NOAPPERROR=True
               &CATCHERROR=True}
 
            if valid-handle(ph_sosodxr) then
               delete object ph_sosodxr.
            ph_sosodxr = ?.
 
            if dExcessQty > 0 then do:
               /* ORDER LINE END EFFECTIVE QTY EXCEEDED BY #*/
               {us/bbi/pxmsg.i &MSGNUM=10342 &ERRORLEVEL=2 &MSGARG1=dExcessQty}
            end. /* if dExcessQty > 0 then do: */
         end. /* if sod_cum_qty[3]*/
 
         for first pt_mstr
            where pt_domain = global_domain
              and pt_part   = sod_part
         no-lock: end.
 
         for first soc_ctrl where soc_domain = global_domain
         no-lock: end.
 
         assign
            l_disc_pct1 = 0
            l_net_price = ?
            l_rec_no = ?
            l_list_price = 0.
 
         if available pt_mstr then do:
 
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
               "(input  base_curr,
                 input  so_curr,
                 input  exch_rate2,
                 input  exch_rate,
                 input  pt_price * sod_um_conv,
                 input  false,
                 output l_list_price,
                 output mc-error-number)"}.
 
            if mc-error-number <> 0 then do:
               run ip_msg (input mc-error-number,input 3).
               undo mainblk, leave mainblk.
            end.
 
         end. /* if available pt_mstr  */
 
         /* CALCULATE PRICE */
         {us/bbi/gprun.i ""gppccal.p""
            "(input  sod_part,
              input (accum sub-total by sod_line shipqty) / sod_um_conv,
              input sod_um,
              input sod_um_conv,
              input so_curr,
              input '{&CUSTOMER-CLASSIFICATION}',
              input sod_pr_list ,
              input eff_date,
              input (sod_std_cost * so_ex_rate),
              input soc_pl_req,
              0.0,
              input-output  l_list_price,
              output        l_disc_pct1,
              input-output  l_net_price,
              output        l_rec_no)"}
 
         create tt_sod_det.
 
         assign
            tt_sod_nbr  = sod_nbr
            tt_sod_line = sod_line
            tt_pr_found = if l_rec_no = 0
                          then
                             false
                          else
                             true.
 
         if l_net_price <> ? then sod_price = l_net_price.
 
         if pt_price = 0 then
            sod_list_pr = sod_price.
 
      end. /* if sod_sched  */
 
      sod_qty_chg = (accum sub-total by sod_line shipqty) / sod_um_conv.
 
      if can-find(iec_ctrl where iec_domain = global_domain and
                                 iec_use_instat = yes)
      then do:
         /* CREATE IMPORT EXPORT HISTORY RECORD */
         {us/bbi/gprun.i ""iehistso.p""
            "(buffer sod_det,
              input sod_qty_chg,
              input substring(abs_mstr.abs_id,2),
              input 0,
              input eff_date,
              input ""SHIP"")"}
      end.
 
   end. /* if last-of(sod_line)  */
 
   if last-of(sod_nbr) then do:
 
      gl_amt = 0.
 
      if so_fr_terms <> "" then do:
 
         for first ft_mstr
            where ft_domain = global_domain
              and ft_terms = so_fr_terms
         no-lock:
            old_ft_type = ft_type.
         end.
 
         so_mstr_recid = recid(so_mstr).
 
         output close.
         output to value(junk_file).
 
         /* FREIGHT CHARGE AND WEIGHT CALC FOR SHIPMENTS */
         {us/bbi/gprun.i ""sofrcals.p""
            "(input table tt_sod_det,
              input substring(absid,2))"}
 
         for each tt_sod_det exclusive-lock:
            delete tt_sod_det.
         end. /* FOR EACH sod_det */
 
         output close.
         output to value (err_file) append.
 
         if not freight_ok then
         /* Freight error detected */
         run ip_msg (input 669,input 2).
 
      end. /* if so_fr_terms <> ""  */
 
      /* Manual update of trailer data is normally done at this
      point but because this program processes in batch, the
      invocation to rcsoistr.p has been excluded */
 
      /* WHEN POSTING FREIGHT WITH LOGISTICS ACCOUNTING WE NEED THE    */
      /* TRANSACTION NUMBER(tr_trnbr)FOR THE "ISS-SO" TRANSACTION.     */
      /* THIS NUMBER IS USED TO RELATE THE TRGL_DET RECORDS CREATED IN */
      /* LAFRPST.P TO "ISS-SO" TRANSACTION(TR_HIST) RECORD.            */
      /* THERFORE THE FREIGHT ACCRUAL POSTING FOR LOGISTICS ACCOUNTING */
      /* IS DONE AFTER SHIPMENTS ARE PROCESSED (I.E. AFTER RCSOIS1A.P  */
      /* IS CALLED).                                                   */

      if available so_mstr
      then
         for first ft_mstr
            where ft_domain = global_domain
              and ft_terms  = so_fr_terms
         no-lock:
         end.
 
      /* POST FREIGHT ACCRUALS */
      if gl_amt <> 0 
         and ((not use-log-acctg) 
                  or (use-log-acctg 
                     and available ft_mstr 
                     and ft_type  = "3" 
                            and ft_lc_charge = ""))
      then do:
         so_mstr_recid = recid(so_mstr).
         {us/bbi/gprun.i ""sofrpst.p"" "(input eff_date)"}
      end. /* IF GL_AMT <> 0 */
 
      tot_freight_gl_amt = tot_freight_gl_amt + gl_amt.
 
   end. /* if last-of(sod_nbr)  */
 
   /* CHECK FOR SALES ORDER HAVING ALL CONSIGNED LINES AND NO       */
   /* TRAILER AMOUNTS AND SET so_to_inv = NO FOR SUCH SALES ORDERS. */
   run  p_set-so-to-invoice (input work_abs_mstr.abs_order,
      input work_abs_mstr.abs_line,
      input work_abs_mstr.abs_qty,
      input work_abs_mstr.abs_consigned_return,
      input-output l_so_to_inv).
 
end. /* for each work_abs_mstr  */
 
if using_container_charges
then do:
   /* CREATE THE SALES ORDER DETAIL CONTAINER CHARGE RECORDS */
   {us/gp/gprunmo.i
      &module  = "ACL"
      &program = ""rcsoiscd.p""
      &param   = """(input abs_shipfrom,
                     input abs_shipto,
                     input ship_dt,
                     input eff_date,
                     input abs_recid,
                     input confirm_mode,
                     input auto_post,
                     input no)"""}
end. /* IF using_container_charges */
 
for each tt_somstr:
   for first so_mstr where so_domain = global_domain
      and so_nbr = tt_sonbr
      and so_compl_stat = ""
   exclusive-lock:
      so_to_inv = tt_sotoinv.
   end. /* FOR FIRST so_mstr */
end. /* FOR EACH tt_somstr */
 
/* Check the shipper is a consignment simultaneous shipper or not */
assign
   using_consign = no
   mapping_simul = no.
if using_cust_consignment then do:
   {us/gp/gprunp.i "soldxr" "p" "isUsingConsign"
             "(input abs_mstr.abs_id,
               input abs_mstr.abs_shipfrom,
               input-output using_consign)"}
   if using_consign then do:
      for first lgd_mstr where lgd_domain = global_domain
         and lgd_type   = yes
         and lgd_status <> {&LD_CANCELLED}
         and lgd_shipper_id = abs_mstr.abs_id no-lock,
         first so_mstr where so_domain = global_domain
         and so_nbr = lgd_order
         and so_compl_stat = ""
      no-lock:
         {us/gp/gprunp.i "soldxr" "p" "checkSimultaneus"
                   "(input abs_mstr.abs_shipto,
                     input abs_mstr.abs_shipfrom,
                     input so_tax_usage,
                     input lgd_order,
                     input 'SO',
                     input yes,
                     output mapping_simul)"}
         if mapping_simul then
            {us/gp/gprunp.i "soldxr" "p" "getShippingTaxUsage"
             "(input abs_mstr.abs_shipto,
               input abs_mstr.abs_shipfrom,
               input so_tax_usage,
               input lgd_order,
               input 'SO',
               input yes,
               output shipping_tax)"}
      end.
   end. /* if using_consign */
end. /* if using_cust_consignment */
 
if mapping_simul then do:
   /* Protect the scene of origin tax usage of consign sod_line */
   c_tax_list  = "".
   for each work_abs_mstr
   no-lock,
   first sod_det
      where sod_domain = global_domain
      and sod_nbr  = abs_order
      and sod_line = integer(abs_line)
      and sod_compl_stat = ""
   exclusive-lock:
      if sod_consignment then do:
         c_tax_list = if c_tax_list = "" then sod_tax_usage
            else c_tax_list + "," + sod_tax_usage.
         sod_tax_usage = shipping_tax.
      end.
   end.
end. /* if mapping_simul */

/* CHECK IF THE TAX INFORMATION IS COMPLETE FOR BRAZIL LD */
if l_brazil_ld
   and can-find (first lgd_mstr
                    where lgd_domain     = global_domain
                    and   lgd_shipper_id = abs_mstr.abs_id
                    and   lgd_shipfrom   = abs_mstr.abs_shipfrom)
then 
   l_disperr = yes.
else
   l_disperr = no.
 
txcalcref = string(abs_mstr.abs_shipfrom,"x(8)") + abs_mstr.abs_id.
 
{us/bbi/gprun.i ""txcalc.p""
   "(input ""14"",
     input txcalcref,
     input '*',
     input 0     ,
     input no ,
     output result-status)"}

if result-status = 11415
then do:
   /* TAX DATA IS INCOMPLETE. TAX DETAIL WAS NOT CREATED */
   run ip_msg (input 11415, input 4).
   undo mainblk, leave mainblk.
end. /* IF l_tax_status = no */

l_vertex = no.
for first tx2d_det
   where tx2d_det.tx2d_domain = global_domain
   and   tx2d_ref             = sod_nbr
   and   tx2d_tr_type         = "11"
   and   (tx2d_tax_type = "vq-00"
    or    tx2d_tax_type = "vq-10"
    or    tx2d_tax_type = "vq-20"
    or    tx2d_tax_type = "vq-30"
    or    tx2d_tax_type = "vq-40"
    or    tx2d_tax_type = "vq-50"
    or    tx2d_tax_type = "vq-60"
    or    tx2d_tax_type = "vq-70")
no-lock:
   if can-find(tx2_mstr where tx2_domain   = global_domain
                          and tx2_tax_code = tx2d_tax_code
                          and lookup( tx2_method, {&TAXMETHODGROUP_VERTEX}) <> 0)
   then
      l_vertex = yes.
end. /*FOR FIRST tx2d_det */


for each work_abs_mstr no-lock ,
    each sod_det exclusive-lock where sod_domain = global_domain
       and sod_nbr = abs_order
       and sod_line = integer(abs_line)
       and sod_compl_stat = "" ,
    each so_mstr exclusive-lock where so_domain = global_domain
       and so_nbr = sod_nbr
       and so_compl_stat = ""
break by sod_nbr by sod_line:

   if l_disperr
      and not can-find(first tx2d_det
                        where tx2d_domain  = global_domain
                        and   tx2d_ref     = txcalcref
                        and   tx2d_nbr     = work_abs_mstr.abs_order
                        and  (tx2d_line    = integer(work_abs_mstr.abs_line)
                           or tx2d_line    = 0)
                        and   tx2d_tr_type = "14")
   then do:
      /* TAX DATA IS INCOMPLETE. TAX DETAIL WAS NOT CREATED */
      run ip_msg (input 11415, input 4).
      undo mainblk, leave mainblk.
   end. /* IF l_tax_status = no */

   if l_vertex
   then do:
      {us/tx/txvqst.i "sod_nbr" 0}
   end. /*IF l_vertex */
   else do:
      {us/tx/txvqst.i "sod_line" "sod_line"}
   end. /*IF NOT l_vertex */

   if last-of(sod_nbr)
   then do:
      for first tx2d_det
         where tx2d_det.tx2d_domain = global_domain
         and   tx2d_ref             = txcalcref
         and   tx2d_tr_type         = "14"
         and   tx2d_nbr             = sod_nbr
         and   tx2d_line            = 0
      no-lock: 
      end. /* FOR FIRST tx2d_det */

      if available tx2d_det
      then do:
         {us/bbi/gprun.i ""txcalc.p""
            "(input  '13',
              input  sod_nbr,
              input  '',
              input  0,
              input  no,
              output result-status)"}
      end.  /*  IF AVAILABLE tx2d_det  */

   end. /* IF LAST-OF(sod_nbr) */ 

end. /* for each work_abs_mstr */

/* UPDATE SALES ORDER BALANCE FOR SCHEDULE ORDER */
if available so_mstr 
   and so_sched 
then do:
   for each tt_somstr
   no-lock:
      for first so_mstr
         where so_domain = global_domain
         and   so_nbr    = tt_sonbr
      no-lock:
      end. /* FOR FIRST so_mstr */

      if available so_mstr
      then do:
         for first cm_mstr
            where cm_domain  = global_domain
            and   cm_addr    = so_bill
         no-lock:
         end. /* FOR FIRST cm_mstr */
         if available cm_mstr
         then do:
            /* IF BASE CURRENCY AND CUSTOMER CURRENCY ARE SAME  */
            /* AND SALES ORDER IN FOREIGN CURRENCY AND          */
            /* SO_FXIED_RATE = YES THEN UPDATE DEBTOR BALANCE   */
            /* BASED ON USER ENTERED EXCHANGE RATE              */
            if (base_curr      =  cm_curr 
               and base_curr   <> so_curr) 
               and so_fix_rate = yes
            then do:
               assign
                  l_ordertotal        = getOrderTotal (input so_nbr)
                  l_before_ordertotal = getBeforeOrderTotal(input so_nbr).

               /* CONVERT THE ORDER TOTAL */
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input so_curr,
                    input base_curr,
                    input so_ex_rate,
                    input so_ex_rate2,
                    input l_ordertotal,
                    input false,
                    output l_ordertotal,
                    output mc-error-number)"}

               if mc-error-number <> 0 
               then
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}

               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input so_curr,
                    input base_curr,
                    input so_ex_rate,
                    input so_ex_rate2,
                    input l_before_ordertotal,
                    input false,
                    output l_before_ordertotal,
                    output mc-error-number)"}

               if mc-error-number <> 0 
               then
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}

               if (l_before_ordertotal - l_ordertotal) <> 0 
               then
                  /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
                  run updateOpenOrderTotal in hCreditLibrary
                     ( input  so_bill,
                       input  l_before_ordertotal,
                       input  l_OrderTotal,
                       input  cm_curr,
                       output iReturnStatus).
            end. /* IF base_curr =  cm_curr ... */
            else
               /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
               run updateOpenOrderTotal in hCreditLibrary
                  ( input  so_bill,
                    input  getBeforeOrderTotal(input so_nbr),
                    input  getOrderTotal      (input so_nbr),
                    input  so_curr,
                    output iReturnStatus).

            /* CLEAR qad_wkfl AFTER UPDATE */
            run clearSOTotals in hCreditLibrary ( input  so_nbr).
         end. /* IF AVAILABLE cm_mstr */
      end. /* IF AVAILABLE so_mstr */

   end. /* FOR EACH tt_somstr */
end. /* IF AVAILABLE so_mstr */
 
if mapping_simul then do:
   /* Restore the origin tax usage of consign sod_line */
   i_consign_num = 1.
   for each work_abs_mstr
   no-lock,
   first sod_det
      where sod_domain = global_domain
      and sod_nbr  = abs_order
      and sod_line = integer(abs_line)
      and sod_compl_stat = ""
   exclusive-lock:
      if sod_consignment then do:
         if num-entries(c_tax_list) >= 1 then
            sod_tax_usage = entry(i_consign_num,c_tax_list).
         i_consign_num = i_consign_num + 1.
      end.
   end.
end. /* if mapping_simul */
 
/* Generate lot # from a sequence */
run ip_gen_trlot
   (output continue_process).
if not continue_process then
   undo mainblk, leave mainblk.
   
/* Don't call gpldnbr.p here to prevent pop up IMC selection
               frame. */
/* Get legal document form code */
{us/gp/gprunp.i "soldxr" "p" "getFormCodeByShipper"
   "(input  shipfrom,
     input  absid,
     output c_ld_form_code)"}
 
 
for each lgdnr_det where lgdnr_domain = global_domain
                  and lgdnr_form_code = c_ld_form_code
                  and lgdnr_addr      = shipfrom
                  and lgdnr_move      = no /* Issuing */
no-lock:
   /* Find the default Seq ID by form code, address, move */
   if lgdnr_default = yes then
   do:
      assign c_seq_id = lgdnr_seq_id
             l_elec   = lgdnr_elec.
      leave.
   end.
   /* Use the first record as the default */
   else if c_seq_id = "" then
       assign c_seq_id = lgdnr_seq_id
              l_elec   = lgdnr_elec.
end.
 
if c_seq_id <> "" or c_seq_id <> ? then do:
       {us/bbi/gprun.i ""soldnbr.p"" "(recid(abs_mstr), c_seq_id, l_elec, """",?)"}
end.


/* The real core of the processing is here. Inside this
   procedure, inventory is relieved, accounts affected, etc*/

/*cy1045*  {us/bbi/gprun.i ""rcsois1a.p"" */
/*cy1045*/ {us/bbi/gprun.i ""xxrcsois1a.p""
   "(input ""so_shipper_confirm"",
     input using_cust_consignment,
     input no,
     input no,
     output undo_stat,
     input-output table temp_somstr,
     input-output temp_so_ship,
     input-output temp_so_qadc01,
     input-output temp_fob,
     input-output temp_shipvia,
     input-output temp_fob_list,
     input-output temp_shipvia_list,
     input-output l_traddr,
     input-output l_qty_iss_rcv)" }

/* Q1338820 >> 	 
 * /*c1603* {us/bbi/gprun.i ""rcsois1e.p"" */
 * /*c1603*/ {us/bbi/gprun.i ""xxrcsois1e.p""
 *   "(input table tt_somstr,              
 *     input pPostFile,     /* FILE NAME TO SAVE INVOICE POSTING ERRORS */
 *     input p_prtInstBase, /* PRINT INSTALL BASE REPORT */
 *     input table temp_somstr,
 *     input temp_so_ship,
 *     input temp_so_qadc01,
 *     input temp_fob,
 *     input temp_shipvia,
 *     input temp_fob_list,
 *     input temp_shipvia_list,
 *     input l_traddr,
 *     input l_qty_iss_rcv,
 *     output undo_stat,
 *     output table ttisb)" }
 *    Q1338820 <<*/ 

/*Q1338820 added begin*/
do transaction:
   assign finTransCommitted = false.

   /*
   * Start financial automatic transaction so that if
   * any errors occur within shipper confirm/unconfirm
   * then financial transaction can also be rolled back
   * along with operational DB transactions.
   */
   if(auto_post) then do:
     /* start the financial transaction */
     run proxy/starttransaction.p (output dataset tFcMEssages,
                                   output finAPIError).
     if finAPIError < 0
     then do: 
       /* Start qflib.p - QAD Financials Library running persistently */
        run mfairunh.p
          (input  'qflib.p',
           input  '?',
           output hQADFinInvPostLib) no-error.
        run processErrors in hQADFinInvPostLib
          (input table tFcMessages,
           input 3).
        undo, leave.      
     end.
   end. /* if(auto_post) */
/*cy   {us/bbi/gprun.i ""rcsois1e.p"" */
/*cy*/ {us/bbi/gprun.i ""xxrcsois1e.p""
     "(input table tt_somstr,              
       input pPostFile,     /* FILE NAME TO SAVE INVOICE POSTING ERRORS */
       input p_prtInstBase, /* PRINT INSTALL BASE REPORT */
       input table temp_somstr,
       input temp_so_ship,
       input temp_so_qadc01,
       input temp_fob,
       input temp_shipvia,
       input temp_fob_list,
       input temp_shipvia_list,
       input l_traddr,
       input l_qty_iss_rcv,
       output undo_stat,
       output table ttisb)" }

     /*
      * Commit financial automatic transaction so that if
      * any errors occur within shipper confirm/unconfirm
      * then financial transaction can also be rolled back
      * along with operational DB transactions.
      */

      if(auto_post) then do:

         if available sod_det 
         then
            release sod_det.

         if available abs_mstr 
         then
            release abs_mstr.

         if available so_mstr 
         then
            release so_mstr.            
            
          run proxy/committransaction.p (output dataset tFcMEssages,
                                           output finAPIError).
          if finAPIError < 0
            then do:
             /* Start qflib.p - QAD Financials Library running persistently */
               run mfairunh.p
                (input  'qflib.p',
                 input  '?',
                 output hQADFinInvPostLib) no-error.
               run processErrors in hQADFinInvPostLib
                (input table tFcMessages,
                 input 3).
               undo, leave.
          end.
          else
              assign finTransCommitted = true.
      end. /* if(auto_post) */
      finally:
         /*
          * Rollback financial automatic transaction for
          * any errors that occur within shipper confirm/unconfirm
          * so that financial transactions are properly synchronized
          * with the operational DB transactions.
          */
         if auto_post
            and not finTransCommitted 
         then do:
         
            /* INVOICE NOT CREATED. */
            /* USE INVOICE POST AND PRINT TO CREATE IT */ 
            {us/bbi/pxmsg.i &MSGNUM=14434 &ERRORLEVEL=2}

            /* ===================================================== */
            /* End the Financial transaction on the FIN Appserver    */
            /* ===================================================== */
            run proxy/rollbacktransaction.p (output dataset tFcMEssages,
                                             output finAPIError).
            if c-application-mode <> "API"
            then do:
               undo mainblk, leave mainblk.
            end.
         end. /* IF auto_post */
      end. /* FINALLY */

end. /* do transaction */
/*Q1338820 added end*/

/*c1603*/  if auto_post and auto_inv
/*c1603*/  then do:
/*cy1045*/   {us/bbi/gprun.i ""xxrcsopspr.p""}
/*c1603*/  end.
 
for each tt_somstr exclusive-lock:
   delete tt_somstr.
end. /* FOR EACH tt_somstr */
 
if l_undo
then do:
   if not batchrun
   then
      pause.
   undo mainblk, leave mainblk.
end. /* IF l_undo */
 
if undo_stat then
   undo mainblk, leave mainblk.
 
/* FREIGHT POSTING WITH LOGISTICS ACCOUNTING DISABLED ARE HANDLED */
/* ABOVE BY SOFRPST.P                                             */
 
/* POST FREIGHT ACCRUALS WITH LOGISTICS ACCOUNTING ENABLED    */
if use-log-acctg and tot_freight_gl_amt <> 0 then do:
 
   /* IF LOGISTICS ACCOUNTING IS ENABLED THEN CREATE PENDING VOUCHER */
   /* MASTER AND DETAIL RECORDS AND POST THE FREIGHT TO THE GL.      */
   {us/gp/gprunmo.i &module  = "LA" &program = "lafrpst.p"
      &param   = """(input '{&TYPE_SOShipper}',
        input substring(abs_mstr.abs_id,2),
        input if l_is_mutiple_so then '' else l_first_so_nbr, /*EXT-RF*/
        input abs_mstr.abs_shp_date,
        input eff_date,
        input abs_mstr.abs_shipto,   /* SHIP-TO */
        input '{&TYPE_SO}',
        input first_so_curr,
        input first_so_ex_rate,
        input first_so_ex_rate2,
        input ' ',  /* BLANK PVO_EX_RATETYPE */
        input first_so_exru_seq,
        input first_so_cust)"""}
 
end. /* IF USE-LOG-ACCTG AND ... */
 
global_recid = abs_recid.
release sod_det.
 
/* If the control reaches here, this shipper should have
passed all validation and processing routines
correctly. So this shipper is processed okay */
shipper_processed_ok = yes.
 
end. /* mainblk */
 
output close.
pause before-hide.
 
/*Q1338820 added below*/
/* Clean up invoice post procedure */
if valid-handle(hQADFinInvPostLib)
then delete procedure hQADFinInvPostLib. 
/*Q1338820 added */

{us/gp/gpnbrgen.i}
{us/gp/gpnrseq.i}
 
run del-qad-wkfl.

unsubscribe to "p_giveErrorMsgForTaxLD".
 
PROCEDURE p-shipreq-update:
/*-----------------------------------------------------------------
PURPOSE   : Transfers the pegged ship line quantity from pre-shipper
to newly created shipper
PARAMETERS:
Shipfrom - shipfrom site of shipper
absid    - Preshipper ID
shipnbr  - Newly created shipper ID
NOTES:
-----------------------------------------------------------------*/
   define input parameter shipfrom like abs_shipfrom no-undo.
   define input parameter absid like abs_id no-undo.
   define input parameter shipnbr like abs_id no-undo.
 
   define buffer absr_det for absr_det.
 
   for each absr_det where absr_domain = global_domain and
         absr_shipfrom = shipfrom and
         absr_ship_id = absid
   exclusive-lock:
      assign
         absr_id = right-trim(substring (absr_id,1,1)) +
                   shipnbr +
                   right-trim(substring(absr_id,length (abs_mstr.abs_id) + 2))
         absr_ship_id = shipnbr.
   end.
 
END PROCEDURE.  /* p-shipreq-update */
 
PROCEDURE del-qad-wkfl:
/*-----------------------------------------------------------------
PURPOSE   : Delete "semaphore" information maintained in qad_wkfl
to indicate processing of sales order on the shipper.
PARAMETERS:  <none>
NOTES:
-----------------------------------------------------------------*/
 
   define buffer qad_wkfl for qad_wkfl.
 
   for each qad_wkfl where qad_domain = global_domain and
         qad_key3 = "rcsois.p" and
         qad_key4 = SessionUniqueID
   exclusive-lock:
      delete qad_wkfl.
   end.
 
END PROCEDURE. /* del-qad-wkfl */
 
PROCEDURE p_glcalval:
/*-----------------------------------------------------------------
PURPOSE   : Verifies open GL period for site/entity of each line item
PARAMETERS:
output l_flag - error condition, if "true"
NOTES:
-----------------------------------------------------------------*/
   define output parameter l_flag like mfc_logical no-undo.
 
   define buffer work_abs_mstr for work_abs_mstr.
   define buffer si_mstr       for si_mstr.
 
   for each work_abs_mstr where
         work_abs_mstr.abs_qty <> work_abs_mstr.abs_ship_qty and
         (work_abs_mstr.abs_id begins "i" or
         work_abs_mstr.abs_id begins "c")
   no-lock:
 
      for first si_mstr
         where si_domain = global_domain
           and si_site = work_abs_mstr.abs_site
      no-lock: end.
 
      /* Check GL effective date */
      if available si_mstr then do:
 
         {us/gp/gpglef01.i ""IC"" si_entity eff_date}
 
         if gpglef > 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=gpglef &ERRORLEVEL=4 &MSGARG1=si_entity}
            l_flag = yes.
            return.
         end.
 
         else do:
            {us/gp/gpglef01.i ""SO"" si_entity eff_date}
 
            if gpglef > 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=gpglef &ERRORLEVEL=4 &MSGARG1=si_entity}
               l_flag = yes.
               return.
            end.
 
         end.
 
      end. /* if available si_mstr */
 
   end. /* for each work_abs_mstr */
 
END PROCEDURE. /* p_glcalval */
 
PROCEDURE ip_msg:
/*-----------------------------------------------------------------
PURPOSE   : Message processing routine
PARAMETERS:
input l_num - error #
input l_stat - severity of error, 1-info, 2-warn, 3&4-error
NOTES:
-----------------------------------------------------------------*/
   define input parameter i_num as integer no-undo.
   define input parameter i_stat as integer no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=i_num &ERRORLEVEL=i_stat}
 
   if i_stat = 3 or i_stat = 4 then
      shipper_processed_ok = no.
 
END PROCEDURE. /* ip_msg */
 
PROCEDURE ip_alias:
/*-----------------------------------------------------------------
PURPOSE   : Message processing routine
PARAMETERS:
input i_db - database name
input o_err_flag - error flag
NOTES:
-----------------------------------------------------------------*/
   define input parameter i_db like global_db no-undo.
   define output parameter o_err_flag like mfc_logical no-undo.
 
   define variable v_err_num as integer no-undo.
 
   {us/bbi/gprun.i ""gpalias3.p"" "(i_db, output v_err_num)" }
   o_err_flag = v_err_num = 2 or v_err_num = 3.
 
   if o_err_flag then do:
      /* Domain # is not available */
      {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=i_db}
   end.
 
END PROCEDURE. /* ip_alias */
 
PROCEDURE ip_val_shipper_details:
/*-----------------------------------------------------------------
PURPOSE : Does a variety of validations including:
            Sales order exists
            Sales order not on hold
            For EMT order, no change is pending against the order
            Check if shipment against any sales order on this shipper
            is being confirmed in a parallel process. If not, use a
            semaphore mechanism to prevent anyone from grabbing the
            sales order.
PARAMETERS:
output validation_ok - Flag is false for
"Fatal failure, discontinue processing"
NOTES:
-----------------------------------------------------------------*/
   define input parameter abs_recid as recid no-undo.
   define output parameter validation_ok like mfc_logical no-undo.
 
   define buffer b_abs_mstr    for abs_mstr.
   define buffer work_abs_mstr for work_abs_mstr.
   define buffer qad_wkfl      for qad_wkfl.
   define buffer sod_det       for sod_det.
   define buffer cmf_mstr      for cmf_mstr.
   define buffer cmd_det       for cmd_det.
   define buffer cm_mstr       for cm_mstr.
 
   /* Valid has failed unless the entire procedure is successfully complete */
   validation_ok = false.
 
   procblk:
   do:
      /* Use the qad_wkfl to keep track of the sales orders being    */
      /* confirmed so that shippers related to the same order are not*/
      /* simultaneously confirmed.                                   */
      do transaction:
 
         l_error = no.
         for first b_abs_mstr
            where recid(b_abs_mstr) = abs_recid
         no-lock:
            run p-chk-qadwkfl (input b_abs_mstr.abs_shipfrom,
                               input b_abs_mstr.abs_id).
            if l_error = yes
            then
               leave procblk.
         end. /* FOR FIRST b_abs_mstr */

         for each work_abs_mstr no-lock where
               work_abs_mstr.abs_order <> "":
 
            for first qad_wkfl where qad_domain = global_domain and
               qad_key1 = "rcsois.p" and
               qad_key2 = work_abs_mstr.abs_order
            no-lock: end.
 
            if available qad_wkfl
               and qad_wkfl.qad_key4 <> SessionUniqueID
            then do:
               /* SALES ORDER # IS BEING CONFIRMED BY USER # */
               {us/bbi/pxmsg.i &MSGNUM=2262 &ERRORLEVEL=3
                  &MSGARG1=qad_key2
                  &MSGARG2=qad_charfld[1]}
               leave procblk.
            end.
 
            else if not available qad_wkfl then do:
               create qad_wkfl.
               assign
                  qad_domain     = global_domain
                  qad_key1       = "rcsois.p"
                  qad_key2       = work_abs_mstr.abs_order
                  qad_key3       = "rcsois.p"
                  qad_key4       = SessionUniqueID
                  qad_charfld[1] = global_userid
                  qad_charfld[2] = work_abs_mstr.abs_par_id
                  qad_charfld[3] = work_abs_mstr.abs_shipfrom
                  qad_date[1]    = today
                  qad_charfld[5] = string(time,"hh:mm:ss").
 
               if recid(qad_wkfl) = -1 then.
            end.
 
         end.
 
      end. /* do transaction */
 
      for each work_abs_mstr exclusive-lock:
         work_abs_mstr.abs_ship_qty = 0.
      end.
 
      que-doc = no.
 
      /*Exit if there is any pending change for btb order */
      for each work_abs_mstr no-lock
      break by work_abs_mstr.abs_order:
 
         if first-of (work_abs_mstr.abs_order) and
            work_abs_mstr.abs_order <> ""
         then do:
 
            for first so_mstr where so_domain = global_domain and
               so_nbr = abs_order and
               so_compl_stat = ""
            no-lock: end.
 
            for first sod_det where sod_domain = global_domain and
               sod_nbr = abs_order and
               sod_line = integer(abs_line) and
               sod_compl_stat = ""
            no-lock: end.
 
            if available so_mstr and available sod_det
            then do:
 
               if not so_secondary then
                  for first cmf_mstr where cmf_domain = global_domain
                  and (cmf_doc_type = "PO" and
                       cmf_doc_ref = sod_btb_po and
                      (cmf_status = "1" or cmf_status = "2" or
                       cmf_status = "3"))
                  no-lock: end.
 
               else do:
 
                   for first cmf_mstr where cmf_domain = global_domain
                      and cmf_doc_type = "SO"
                      and cmf_doc_ref = so_nbr
                      and cmf_status = "1"
                   no-lock: end.
 
                   if available cmf_mstr then
                   for first cmd_det where cmd_domain = global_domain
                      and (cmd_trans_nbr = cmf_trans_nbr and
                           cmd_key_val = so_nbr + "," + string(sod_line) and
                          (cmd_field = "sod_due_date" or cmd_field = "sod_qty_ord"))
                   no-lock: end.
 
                   if available cmd_det then change-queued = yes.
 
                end.
 
            end. /* if available so_mstr and available sod_det */
 
            if (not so_secondary and available cmf_mstr) or
               (so_secondary and change-queued)
            then do:
               /* CHANGE ON BTB SO WITH PENDING CHANGE IS NOT ALLOWED */
               run ip_msg (input 2834,input 3).
               leave procblk.
            end. /* if (not so_secondary and avail cmf_mstr) */
 
/*debug* message "xso_sec". pause. */
            if available so_mstr and
               so_secondary and
               not que-doc
            then
               que-doc = yes.

      end. /* if first-of (work_abs_mstr.abs_order) */
 
   end. /* for each work_abs_mstr */
 
   run p_glcalval (output l_flag).
   if l_flag then
      leave procblk.
 
   /* Warn if there is any sales orders on the shipper that has
      its action status non-blank */
   for each work_abs_mstr no-lock where
         abs_order <> "" and
         abs_line <> ""
   break by abs_shipfrom by abs_order:
 
      if first-of (abs_order) then do:
 
         for first so_mstr where so_domain = global_domain
            and so_nbr = abs_order
         no-lock: end.
 
         if available so_mstr then do:
 
            for first cm_mstr where cm_domain = global_domain
               and cm_addr = so_bill
            no-lock: end.
 
            if available cm_mstr and
               isCustomerOnCreditHold(input cm_mstr.cm_addr)
            then . /* MESSAGE IS GIVEN IN validCustomerCreditLimit() */
 
            if so_stat <> "" then do:
               /* SALES ORDER STATUS NOT BLANK */
               {us/bbi/pxmsg.i &MSGNUM=623 &ERRORLEVEL=2 &MSGARG1=so_stat}
            end.
 
            if so_compl_stat <> "" then do:
               /* Sales Order is closed */
               run ip_msg (input 8024, input 3).
               leave procblk.
            end.
 
         end. /* if available so_mstr */
 
         else do:
            /* SALES ORDER DOES NOT EXIST  */
            run ip_msg (input 609,input 3).
            leave procblk.
         end.
 
      end. /* if first-of (abs_order) */
 
      if not can-find(sod_det where sod_domain = global_domain and
                                    sod_nbr = abs_order and
                                    sod_line = integer (abs_line))
      then do:
         /* SALES ORDER LINE DOES NOT EXIST  */
         run ip_msg (input 764,input 3).
         leave procblk.
      end.
 
      if can-find(sod_det where sod_domain = global_domain and
                                sod_nbr = abs_order and
                                sod_line = integer (abs_line) and
                                sod_compl_stat <> "")
      then do:
         /* SALES ORDER LINE IS CLOSED  */
         run ip_msg (input 8025, input 3).
         leave procblk.
      end.
      
      if so__qadc03 = "yes"                          
         and not(so_cum_acct)
         and not(l_ship_reject)
      then do:
         l_absr_qty = 0.                                             
         for each absr_det                   
            where absr_domain   = global_domain
            and   absr_shipfrom = abs_shipfrom
            and   absr_id       = abs_id
         no-lock :
            l_absr_qty = l_absr_qty + absr_qty.
         end. /* FOR EACH absr_det */                    
         if l_absr_qty <> abs_qty
         then do:
            msg_text = "".       
            /* QUANTITY PEGGED NOT EQUAL TO SHIPPED FOR SHIPPER */                                                                            
            {us/bbi/gprun.i ""gpcfmsg.p"" "(input 20068,           
                                            input 0,              
                                            input program-name(1),
                                            input so_site,        
                                            input so_ship,        
                                            input msg_text,        
                                            input yes,           
                                            output l_errlevel)"}  
            l_ship_reject = yes.                                                                                          
            if l_errlevel > 2 
            then do:
               shipper_processed_ok = no.
               leave procblk.
            end. /* IF l_errlevel */                      
         end. /* IF  absr_qty <> abs_qty */                   
      end.  /* IF so__qadc03 */  
 
   end. /* for each work_abs_mstr */
 
   /* If the validation has passed all tests so far, it
      has passed this routine. So give it the "stamp of approval */
   validation_ok = true.
 
end. /* procblk */
 
END PROCEDURE.  /* ip_val_shipper_details */
 
PROCEDURE ip_gen_shipper_num:
/*--------------------------------------------------------------------------
PURPOSE : Generate a shipper number. Use this procedure when the
          original structure is a pre-shipper.
PARAMETERS:
          input absrecid - recid of abs_mstr record
          output continue_process - logical tells whether to continue processing
NOTES:
---------------------------------------------------------------------------*/
   define input parameter absrecid as recid no-undo.
   define output parameter continue_process like mfc_logical no-undo.
 
   define variable shipnbr like abs_mstr.abs_id no-undo.
   define variable shipgrp like sg_grp no-undo.
   define variable nrseq like shc_ship_nr_id no-undo.
   define variable is_internal like mfc_logical no-undo.
   define variable LVTaskFound as logical no-undo.
   define variable i_err_num as integer no-undo.

   define buffer b_abs_mstr for abs_mstr.
   define buffer shc_ctrl   for shc_ctrl.
   define buffer sgid_det   for sgid_det.
 
   procblk:
   do for b_abs_mstr:
 
      continue_process = no.
 
      for first shc_ctrl where shc_domain = global_domain
      no-lock: end.
 
      for first b_abs_mstr where recid(b_abs_mstr) = absrecid
      no-lock: end.
 
      /* WHEN WMS IS ACTIVE CHECK IF AIM TASKS LINKED TO IT, IF SO */
      /* CONVERSION IS NOT ALLOWED.                                */
      if {us/wh/whgpwhon.i} then do:
 
         {us/bbi/gprun.i ""whgpchsh.p"" "(input abs_shipfrom,
            input abs_id,
            input '',
            output LVTaskFound)"}
 
         if LVTaskFound then do:
 
            /* CONVERSION NOT ALLOWED. WAREHOUSE TRANSACTIONS EXIST */
            run ip_msg (input 10876, input 3).
            leave procblk.
         end.
      end. /* IF {us/wh/whgpwhon.i} */
 
      {us/bbi/gprun.i ""gpgetgrp.p""
         "(input  abs_shipfrom,
           input  abs_shipto,
           output shipgrp)"}
 
      nrseq = shc_ctrl.shc_ship_nr_id.
 
      if shipgrp <> ? then do:
 
         for first sgid_det where sgid_det.sgid_domain = global_domain
            and sgid_grp = shipgrp
            and sgid_inv_mov = abs_inv_mov
         no-lock:
            nrseq = sgid_ship_nr_id.
         end.
 
      end.
 
      run chk_internal
         (input nrseq,
          output is_internal,
          output errorst,
          output errornum).
 
      if errorst then do:
         run ip_msg (input errornum,input 3).
         leave procblk.
      end.
 
      if is_internal then do:
         run getnbr
            (input nrseq,
             input today,
             output shipnbr,
             output errorst,
             output errornum).
 
         if errorst then do:
            run ip_msg (input errornum,input 3).
            leave procblk.
         end.
 
      end.
 
      else do:
         /* Auto Confirm needs internal sequence for pre-shipper */
         run ip_msg (input 8590,input 3).
         leave procblk.
      end.
 
      shipnbr = "s" + shipnbr.
 
      run p-shipreq-update
         (input abs_shipfrom,
         input abs_id,
         input shipnbr).
 
      for first b_abs_mstr where recid(b_abs_mstr) = absrecid
      exclusive-lock: end.
 
      assign
         abs_preship_id = abs_id
         abs_preship_nr_id = abs_nr_id
         abs_nr_id = nrseq.
 
      /* Propogate number change thru abs_mstr */
      {us/bbi/gprun.i ""rcsoisa1.p""
         "(abs_shipfrom,
           abs_id,
           shipnbr)"}
 
      /* Propogate number change thru shipper structure */
      {us/bbi/gprun.i ""icshchg.p""
         "(absrecid, shipnbr)" }
 
      if right-trim(substring (abs_preship_id,2,20)) =
         right-trim(substring (abs__qad01,41,20)) then
      assign
         overlay(abs__qad01,41,20) = substring(abs_id,2,20)
         abs_carr_ref = substring(abs__qad01,41,20).
 
      if use-log-acctg then do:
         run changeShipperNumberInLogAcctDetail
            (input {&TYPE_SOPreShipper},
             input substring(abs_mstr.abs_preship_id,2),
             input abs_mstr.abs_shipfrom,
             input {&TYPE_SOShipper},
             input substring(abs_mstr.abs_id,2),
             input abs_mstr.abs_shipfrom).
      end. /* IF USE-LOG-ACCTG */

      {us/bbi/gprun.i ""icshld.p""
               "(input  recid(abs_mstr),
                 input  no,
                 input  yes,
                 output i_err_num)"}

      /* If the processing has got this far, everything went well */
      continue_process = yes.

   end. /* procblk */
 
END PROCEDURE.  /* ip_gen_shipper_num */
 
PROCEDURE ip_gen_trlot:
/*--------------------------------------------------------------------------
PURPOSE : Generate a lot#
PARAMETERS:
output continue_process - logical tells whether to continue processing
NOTES:
--------------------------------------------------------------------------*/
   define output parameter continue_process like mfc_logical no-undo.
 
   define variable err_flag like mfc_logical no-undo.
 
   continue_process = no.
 
   procblk:
   do:
      if change_db then do:
         run ip_alias (input ship_db,output err_flag).
         if err_flag then leave procblk.
      end.
 
      {us/bbi/gprun.i ""gpnxtsq.p"" "(output trlot)" }
 
      if change_db then do:
         run ip_alias (input so_db,output err_flag).
         if err_flag then leave procblk.
      end.
 
      continue_process = yes.
 
   end. /* procblk */
 
END PROCEDURE.  /* ip_gen_trlot */
 
/* INTERNAL PROCEDURES changeShipperNumberInLogAcctDetail AND          */
/*   validateSOForLogisticsAccounting ARE DEFINED IN larcsois.i        */
{us/rc/rcsoisla.i}
/* SETTING READY TO INVOICE FLAG FOR SALES ORDERS */
{us/so/sotoinv.i}
 
PROCEDURE abs_audit:
   define variable l_msg as character format "x(80)" no-undo.
 
   /* SHIPPER NOT CONFIRMED. PLEASE CHECK 'shipper.err' FOR DETAILS. */
   {us/bbi/pxmsg.i &MSGNUM=7640 &ERRORLEVEL=2}
 
   /* NO MATCHING SALES ORDER/LINE FOR FOLLOWING ITEMS IN SHIPPER # */
   {us/bbi/pxmsg.i &MSGNUM=7642 &ERRORLEVEL=1
            &MSGARG1=substring(abs_mstr.abs_id,2,20)
            &MSGBUFFER=l_msg}.
 
   output stream abs to "shipper.err" append.
 
      put stream abs l_msg.
 
      for each work_abs_mstr
         where work_abs_mstr.abs_id begins "ic"
            or work_abs_mstr.abs_id begins "is"
      no-lock:
         display stream abs
            work_abs_mstr.abs_item
            work_abs_mstr.abs_qty
            work_abs_mstr.abs_site
            work_abs_mstr.abs_loc
            work_abs_mstr.abs_lotser
            work_abs_mstr.abs_ref.
      end. /* FOR EACH work_abs_mstr */
 
   output stream abs close.
 
END PROCEDURE. /* END abs_audit */

PROCEDURE p_giveErrorMsgForTaxLD:
define output parameter l_err as logical no-undo.

   l_err = l_disperr.

END PROCEDURE. /* p_getErrorMsgForTaxLD */
 
FUNCTION isSimulMismatched returns logical(
   input p_shipfrom as character,
   input p_shipto   as character):
 
   define variable c_last_shipto      as character   no-undo.
   define variable l_last_simul       as logical     no-undo.
   define variable c_shipto           as character   no-undo.
   define variable l_simul            as logical     no-undo.
   define variable l_first_order      as logical     no-undo.
 
   l_first_order = yes.
 
   for each work_abs_mstr no-lock,
      each sod_det where sod_domain = global_domain
      and sod_nbr = abs_order
      and sod_line = integer(abs_line)
      and sod_compl_stat = "" no-lock
   break by sod_nbr:
      if first-of(sod_nbr) then do:
         for first so_mstr where so_domain = global_domain
            and so_nbr = sod_nbr
            and so_compl_stat = "" no-lock:
         end.
 
         assign
            l_simul  = no
            c_shipto = "".
 
         for first lgdtx_det where lgdtx_domain = global_domain
            and lgdtx_type = 'SO'
            and lgdtx_so_tax_usage = so_tax_usage
            and lgdtx_shipfrom = p_shipfrom
            and lgdtx_shipto = p_shipto
            and lgdtx_so_nbr = sod_nbr
            and lgdtx_consign = no
         no-lock:
            assign
               l_simul  = yes
               c_shipto = lgdtx_soldto.
         end.
 
         if not available lgdtx_det then do:
            for first lgdtx_det where lgdtx_domain = global_domain
               and lgdtx_type = 'SO'
               and lgdtx_so_tax_usage = so_tax_usage
               and lgdtx_shipfrom = p_shipfrom
               and lgdtx_shipto = p_shipto
               and (lgdtx_so_nbr = "" or lgdtx_so_nbr = ?)
               and lgdtx_consign = no
            no-lock:
               assign
                  l_simul  = yes
                  c_shipto = lgdtx_soldto.
            end.
         end.
 
         if not l_first_order then do:
            if l_simul <> l_last_simul or
               (l_simul and c_shipto <> c_last_shipto) then
               return yes.
         end.
         else
            l_first_order = no.
 
         assign
            l_last_simul  = l_simul
            c_last_shipto = c_shipto.
      end. /* if first-of(sod_nbr) then */
   end.
 
   return no.
END.

PROCEDURE p-chk-qadwkfl:
/*-----------------------------------------------------------------------
 Purpose: To check if the Shipper is locked by another user
 Parameters:   <None>
 Notes:
-------------------------------------------------------------------------*/
   define input parameter p_shipfrom  as   character    no-undo.
   define input parameter p_absid     as   character    no-undo.

   define buffer buf_abs_mstr for abs_mstr.

   for first buf_abs_mstr
      where buf_abs_mstr.abs_domain   = global_domain
      and   buf_abs_mstr.abs_shipfrom = p_shipfrom
      and   buf_abs_mstr.abs_id       = p_absid
   no-lock:
      for first qad_wkfl
         where qad_domain = global_domain
         and   qad_key1   = "rcshwb.p"
         and   qad_key2   = p_shipfrom + "," + p_absid
      no-lock:
         if qad_wkfl.qad_key4 <> SessionUniqueID
         then do:
            /* RECORD LOCKED BY ANOTHER USER.  TRY LATER # */
            {us/bbi/pxmsg.i &MSGNUM=7422 &ERRORLEVEL=4}
            l_error = yes.
         end.  /* IF qad_wkfl.qad_key4 = SessionUniqueID */
         return.
      end. /* FOR FIRST qad_wkfl */
   end. /* FOR FIRST buf_abs_mstr */
END PROCEDURE.

define stream logit.
procedure logit.
def input parameter iptxt as char.
def var logname as char.
logname = entry(num-entries(program-name(1), "~/"), program-name(1), "~/").
logname = entry(1, logname, "~.").
   output stream logit to value("/tmp/" + trim(logname) + ".log") append.
   put stream logit unformatted
   string(program-name(2)) + "|" +
   string(today) + "|" +
   string(time, "HH:MM:SS") + "|" +
   global_userid + "|" +
   iptxt.
   if program-name(3) <> ? then
   put stream logit unformatted
   "|" + string(program-name(3)).
   if program-name(4) <> ? then
   put stream logit unformatted
   "|" + string(program-name(4)).
   put stream logit unformatted
   skip.
   output stream logit close.
   unix value("chmod 666 ~/tmp~/" + trim(logname) + ".log 2~>~/dev~/null").
end.  /* procedure logit */
