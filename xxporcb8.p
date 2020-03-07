/* xxporcb8.p - Process a purchase order receipts line .                      */
/* poporcb8.p - Process a purchase order receipts line .                      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxporcb8.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/*                                                                            */
/* Process a purchase order receipts line .                                   */
/*                                                                            */
/* Revision: 1.2    BY: Zheng Huang      DATE: 07/12/00  ECO: *N0DK*          */
/* Revision: 1.3    BY: Mark Brown       DATE: 08/13/00  ECO: *N0KQ*          */
/* Revision: 1.4    BY: Mark Brown       DATE: 08/21/00  ECO: *N0LJ*          */
/* Revision: 1.5    BY: Jean Miller      DATE: 11/08/00  ECO: *N0TN*          */
/* Revision: 1.6    BY: Murali Ayyagari  DATE: 12/14/00  ECO: *N0V1*          */
/* Revision: 1.7    BY: Manish K.        DATE: 01/12/01  ECO: *N0VL*          */
/* Revision: 1.8    BY: Katie Hilbert    DATE: 04/01/01  ECO: *P002*          */
/* Revision: 1.9    BY: Irine Fernandes  DATE: 10/22/01  ECO: *M1N4*          */
/* Revision: 1.10   BY: Patrick Rowan    DATE: 04/17/02  ECO: *P043*          */
/* Revision: 1.11   BY: Jeff Wootton     DATE: 05/14/02  ECO: *P03G*          */
/* Revision: 1.12   BY: Dan Herman       DATE: 05/24/02  ECO: *P018*          */
/* Revision: 1.13   BY: Steve Nugent        DATE: 06/13/02  ECO: *P08K*       */
/* Revision: 1.14   BY: Mercy Chittilapilly DATE: 11/26/02  ECO: *M21D*       */
/* Revision: 1.15   BY: Nishit V            DATE: 01/10/02  ECO: *N23L*       */
/* Revision: 1.16   BY: Orawan S.           DATE: 05/28/03  ECO: *P0RG*       */
/* Revision: 1.18   BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00J*       */
/* Revision: 1.19   BY: Mamata Samant       DATE: 08/02/03  ECO: *P0X6*       */
/* Revision: 1.20   BY: Rajiv Ramaiah       DATE: 08/11/03  ECO: *P0ZK*       */
/* Revision: 1.21   BY: Dipesh Bector       DATE: 09/01/03  ECO: *P111*       */
/* Revision: 1.22   BY: Katie Hilbert       DATE: 09/02/03  ECO: *P123*       */
/* Revision: 1.23   BY: Shilpa Athalye      DATE: 12/16/03  ECO: *P1DY*       */
/* Revision: 1.24   BY: Preeti Sattur       DATE: 01/21/04  ECO: *Q05F*       */
/* Revision: 1.25   BY: Annapurna V.        DATE: 10/21/04  ECO: *P2QG*       */
/* Revision: 1.26        BY: Steve Nugent         DATE: 08/11/05  ECO: *P2PJ* */
/* Revision: 1.27        BY: Patrick Rowan        DATE: 04/27/07  ECO: *R0C6* */
/* Revision: 1.28        BY: Prashant Menezes     DATE: 09/11/08  ECO: *P6R3* */
/* CYB     LAST MODIFIED: 11-Jun-2010              BY: gbg *c1171*            */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* $Revision: 1.2 $     BY: Prashant Menezes     DATE: 09/11/08  ECO: *P6R3* */
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
/*                                                                            */
 
/* STANDARD INCLUDE FILES */
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
 
{us/bbi/gplabel.i}
{us/px/pxmaint.i}
{us/gp/gprunpdf.i "mcpl" "p"}
{us/po/porcdef.i}
 
/* Define Handles for the programs. */
{us/px/pxphdef.i popoxr}
{us/px/pxphdef.i porcxr1}
{us/px/pxphdef.i gpcmxr}
{us/px/pxphdef.i ictrxr}

/* End Define Handles for the programs. */
 
/* Dataset that contains serial IDs picked for PO */
{us/pa/papodspk.i}

{us/ca/cattdef2.i}

/* ========================================================================== */
/* ******************************* PARAMETERS  ****************************** */
/* ========================================================================== */
define  input parameter p_pod_recid    as recid             no-undo.
define  input parameter receivernbr    as character         no-undo.
define  input parameter ship_date      as date              no-undo.
define  input parameter shipnbr        as character         no-undo.
define  input parameter inv_mov        as character         no-undo.
define  input parameter i_shipto       like abs_shipto      no-undo.
define  input parameter ip_is_usage    like mfc_logical     no-undo.
define  input parameter ip_usage_qty   like tr_qty_req      no-undo.
define  input parameter ip_woiss_trnbr like tr_rmks         no-undo.
define  input parameter ip_round_acct  like ac_code         no-undo.
define  input parameter p_shipper_rec  like mfc_logical     no-undo.
define  input parameter p_int_ref_type like lacd_internal_ref_type no-undo.
define  input parameter p_abs_um       as   character       no-undo.
define  input parameter p_abs_um_conv  as   decimal         no-undo.
define  input parameter p_abs_um_qty   as   decimal         no-undo.
define  input parameter p_selectedReturnReceiver as character no-undo.
define  input parameter table for tt_attr_pfvalue.
define input-output parameter dataset for dsSerialPicked.
define input parameter p_shipnbr1      as   character       no-undo.
define output parameter op_rctpo_trnbr like tr_trnbr        no-undo.
define output parameter op_undo_lagit like mfc_logical        no-undo.

/* ========================================================================== */
/* ******************************* DEFINITIONS ****************************** */
/* ========================================================================== */
define new shared variable conv_to_stk_um  as   decimal.
define new shared variable cur_mthd        like cs_method.
define new shared variable cur_set         like cs_set.
define new shared variable curr_yn         as   logical.
define new shared variable glx_mthd        like cs_method.
define new shared variable glx_set         like cs_set.
define new shared variable msg-num         like tr_msg.
define new shared variable newbdn_ll       as   decimal.
define new shared variable newbdn_tl       as   decimal.
define new shared variable newcst          as   decimal.
define new shared variable newlbr_ll       as   decimal.
define new shared variable newlbr_tl       as   decimal.
define new shared variable newmtl_ll       as   decimal.
define new shared variable newmtl_tl       as   decimal.
define new shared variable newovh_ll       as   decimal.
define new shared variable newovh_tl       as   decimal.
define new shared variable newsub_ll       as   decimal.
define new shared variable newsub_tl       as   decimal.
define new shared variable nrecov_tax_avg  like tx2d_tottax  no-undo.
define new shared variable pod_entity      like si_entity.
define new shared variable pod_po_entity   like si_entity.
define new shared variable rct_site        like pod_site.
define new shared variable qty_chg         like tr_qty_loc.
define new shared variable qty_ord         like pod_qty_ord.
define new shared variable reavg_yn        as   logical.
define new shared variable sct_recno       as   recid.
define new shared variable s_base_amt      like base_amt      no-undo.
define new shared variable wr_recno        as   recid.
 
define     shared variable stdcst          like tr_price.
define     shared variable price           like tr_price.
define     shared variable project         like pvo_project.
define     shared variable undo_all        like mfc_logical no-undo.
define     shared variable mgmt_curr       like glt_curr no-undo.
/* KANBAN TRANSACTION NUMBER, SHARED FROM poporcm.p AND kbporcm.p */
define     shared variable kbtransnbr      as integer no-undo.
 
define     shared workfile posub
   field    posub_nbr       as   character
   field    posub_line      as   integer
   field    posub_qty       as   decimal
   field    posub_wolot     as   character
   field    posub_woop      as   integer
   field    posub_gl_amt    like glt_amt
   field    posub_cr_acct   as   character
   field    posub_cr_sub    as   character
   field    posub_cr_cc     as   character
   field    posub_effdate   as   date
   field    posub_site      like sr_site
   field    posub_loc       like sr_loc
   field    posub_lotser    like sr_lotser
   field    posub_ref       like sr_ref
   field    posub_move      as   logical.

define temp-table tt_inv_trans no-undo
   field tt_trnbr as int64
   field tt_ohamt as decimal
   field tt_acct  as character extent 8
   index tt_trnbr_indx tt_trnbr.
 
define buffer po_mstr for po_mstr.
 
define variable del-yn          like mfc_logical  no-undo.
define variable mc-error-number like msg_nbr      no-undo.
define variable nonrecov_tax    like tx2d_tottax  no-undo.
define variable i               as   integer      no-undo.
define variable tax_amt         like tx2d_tax_amt no-undo.
define variable rec_tax_amt     like tx2d_tax_amt no-undo.
define variable retain_tax_amt  like tx2d_tax_amt no-undo.
define variable curr_tax_amt    like tx2d_tax_amt no-undo.
define variable curr_rec_tax_amt     like tx2d_tax_amt no-undo.
define variable curr_retain_tax_amt  like tx2d_tax_amt no-undo.
define variable use-log-acctg        as   logical      no-undo.
define variable l_total_amt          as   decimal      no-undo.
define variable l_rcpt_amt           as   decimal      no-undo.
define variable l_gl_ref             as   character    no-undo.
define variable l_oidTrglDet         as   decimal      no-undo.

{us/po/pocnvars.i} /* Variables for Consignment Inventory */
/* VALIDATE IF LOGISTICS ACCOUNTING IS TURNED ON */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

empty temp-table tt_inv_trans.

/* DETERMINE IF SUPPLIER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ENABLE_SUPPLIER_CONSIGNMENT,
     input 11,
     input ADG,
     input SUPPLIER_CONSIGN_CTRL_TABLE,
     output using_supplier_consignment)"}

find pod_det 
   where recid (pod_Det) = p_pod_recid 
exclusive-lock no-error.

/* This read is necessary to prevent passing in the po_mstr buffer. */
{us/px/pxrun.i &PROC = 'processRead' &PROGRAM = 'popoxr.p'
   &HANDLE=ph_popoxr
   &PARAM = "(input pod_nbr,
              buffer po_mstr,
              input {&NO_LOCK_FLAG},
              input {&NO_WAIT_FLAG})"
   &CATCHERROR = true
   &NOAPPERROR = true}
 
if is-return = no
then do:
   {us/mf/mfpotr.i "DELETE" "RECEIPT" }
end. /* IF is-return = no */
 
/* Get item master information */
 
{us/px/pxrun.i &PROC = 'getItemConversionFactor' &PROGRAM = 'porcxr1.p'
   &HANDLE=ph_porcxr1
   &PARAM = "(input pod_part,
              input pod_rum,
              input pod_rum_conv,
              input pod_um_conv,
              output conv_to_stk_um)"
   &CATCHERROR = true
   &NOAPPERROR = true}
 
for first icc_ctrl
   where icc_ctrl.icc_domain = global_domain   
no-lock: end.
 
stdcst = 0.
 
/* VALUE FOR move IS NOW SET IN THE HEADER SCREEN */
for first pt_mstr
   where pt_domain = global_domain and pt_part = pod_part
no-lock: end.
 
if available pt_mstr then do:
 
   pt_recno = recid(pt_mstr).
 
   for first pl_mstr

      where pl_domain = global_domain
       and  pl_prod_line = pt_prod_line
   no-lock: end.
 
   if pod_type = "" then do:
      {us/gp/gpsct06.i &part=pt_part &site=pod_site &type=""GL"" }
      sct_recno = recid(sct_det).
   end.
   else
      sct_recno = ?.
 
   if ((not using_supplier_consignment) or
    (using_supplier_consignment and not pod_consignment) or
    (using_supplier_consignment and pod_consignment and ip_is_usage))
   then do:
      /* Determine costing method */
      {us/bbi/gprun.i ""csavg01.p""
         "(input  pt_part,
           input  pod_site,
           output glx_set,
           output glx_mthd,
           output cur_set,
           output cur_mthd)" }
   end. /*If not using supplier_consign*/
 
   curr_yn = yes.
 
   if can-find(wr_route where wr_domain = global_domain
               and wr_lot = wolot and wr_op = woop)
      or glx_mthd = "AVG" then curr_yn = no.
 
 
   if not pod_cst_up or (pod_type <> "" and pod_type <> "S") then
      cur_mthd = ?.
 
   /* Update current cost & post any GL discrepancy */
   /* Calculate amounts to average by cost category */
   if glx_mthd = "AVG" or
      cur_mthd = "AVG" or
      cur_mthd = "LAST"
   then do:
 
      base_amt = price.
      if po_curr <> base_curr
      then do:
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
            "(input  po_curr,
              input  base_curr,
              input  exch_rate,
              input  exch_rate2,
              input  base_amt,
              input  false, /* DO NOT ROUND */
              output base_amt,
              output mc-error-number)" }
      end.
 
      if  using_supplier_consignment and ip_is_usage
      then
         assign
            qty_chg   = ip_usage_qty
            transtype = "RCT-PO".
      else
         qty_chg = pod_qty_chg * conv_to_stk_um.
 
      if is-return then qty_chg = - qty_chg.
 
      assign
         nonrecov_tax   = 0
         nrecov_tax_avg = 0.
 
      /* Remove recoverable tax from cost basis */
      for each tx2d_det
            where
               tx2d_domain  = global_domain and
               tx2d_tr_type = tax_tr_type   and
               tx2d_ref     = receivernbr   and
               tx2d_nbr     = po_nbr        and
               tx2d_line    = pod_line
      no-lock:
 
         for first tx2_mstr
             where tx2_domain = global_domain
              and  tx2_tax_code = tx2d_tax_code
         no-lock: end.
 
         /* ACCRUE TAX AT RECEIPT ONLY WHEN DEALING WITH PURCHASE RECEIPTS */
         /* AND CONSIGNED MATERIAL USAGES (RCT-PO TRANSACTIONS). DO NOT    */
         /* ACCRUE TAX AT RECEIPT WHEN PHYSICALLY RECEIVING CONSIGNED      */
         /* MATERIAL (CN-RCT TRANSACTIONS).                                */
 
         if available tx2_mstr and
            /* PURCHASE RECEIPT */
            (tx2d_rcpt_tax_point) and
            (not using_supplier_consignment or not pod_consignment)
            or
            /* CONSIGNMENT USAGE */
            (using_supplier_consignment and
             pod_consignment            and
             tx2_usage_tax_point        and
             ip_is_usage)
         then do:
            /* Accrue tax at receipt */
            if not tx2d_tax_in then
               /* Tax not included in price */
               nonrecov_tax = nonrecov_tax
               /* Add all tax */
               + tx2d_cur_tax_amt
               /* Subtract recoverable tax */
               - tx2d_cur_recov_amt.
            else
               /* Tax included in price */
               nonrecov_tax = nonrecov_tax
               /* Subtract recoverable tax */
               - tx2d_cur_recov_amt.
         end. /* if (tx2d_rcpt_tax_point) and */
         else
         /* Accrue tax at voucher */
         if tx2d_tax_in then
            /* Tax included in price */
            nonrecov_tax = nonrecov_tax
            /* Subtract all tax */
            - tx2d_cur_tax_amt.
      end.  /* for each tx2d_det */
 
      assign
         base_amt = price + (nonrecov_tax / qty_chg)
         nrecov_tax_avg = nonrecov_tax / qty_chg.
 
      if po_curr <> base_curr
      then do:
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                        "(input  po_curr,
                          input  base_curr,
                          input  exch_rate,
                          input  exch_rate2,
                          input  base_amt,
                          input  false, /* DO NOT ROUND */
                          output base_amt,
                          output mc-error-number)" }
      end.
 
      for first sr_wkfl
         where sr_domain = global_domain
         and sr_userid = SessionUniqueID
         and sr_lineid = string(pod_line)
      no-lock:
         site = sr_site.
      end. /* FOR FIRST sr_wkfl */
 
      /* ADDED CALCULATION OF TAX FOR CONSIGNMENT INVENTORY */
      /* WHEN GL COSTING IS SET TO AVERAGE                  */
      if using_supplier_consignment and ip_is_usage then do:
 
         for first gl_ctrl
            where gl_domain = global_domain
         no-lock: end.
 
         {us/px/pxrun.i &PROC = 'processConsigntax' &PROGRAM = 'ictrxr.p'
                  &HANDLE = ph_ictrxr
                  &PARAM = "(input po_nbr,
                             input pod_line,
                             input pod_part,
                             input pod_site,
                             input qty_chg,
                             output tax_amt,
                             output retain_tax_amt,
                             output rec_tax_amt,
							 output curr_tax_amt,
                             output curr_retain_tax_amt,
                             output curr_rec_tax_amt)"
                  &CATCHERROR = true
                  &NOAPPERROR = true}
 
         /* IN THIS PROGRAM ONLY THE NON-RECOVERABLE TAX AMT IS REQUIRED. */
         /* THE RECOVERABLE TAX AMOUNT IS CONSIDERED IN pocnppv.p         */
         /* ROUND PER BASE CURRENCY ROUND METHOD */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output tax_amt,
              input gl_rnd_mthd,
              output mc-error-number)"}
 
          base_amt = price + (tax_amt / qty_chg).
 
      end. /* IF USING_SUPPLIER_CONSIGNMENT */
 
      s_base_amt = base_amt.
 
      /* csavg02.p  MOVED TO poporcb6.p FOR PO RETURNS OF INVENTORY ITEMS */
      /* FROM A SITE DIFFERENT FROM THE PO LINE SITE                      */
      if (not using_supplier_consignment) or
         (using_supplier_consignment and not pod_consignment) or
         (using_supplier_consignment and pod_consignment and ip_is_usage)
      then do:
 
         if pod_type                <> ""
         or site                    = pod_site
         or qty_chg                 >= 0
         or right-trim(po_fsm_type) <> ""
         then do:
 
            if use-log-acctg then do: /* Logistics Accounting Enabled */
            if pod_type = ""
            then do:
 
            {us/bbi/gprun.i ""cslavg02.p""
                        "(input  pt_part,
                          input  pod_site,
                          input  transtype,
                          input  kbtransnbr,
                          input  recid(pt_mstr),
                          input  po_nbr,
                          input  qty_chg,
                          input  ip_usage_qty,
                          input  base_amt,
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
            end. /* Logistics Accounting Enabled */
 
            else do: /* Logistics Accounting Disabled */
               if pod_type = "S" and curr_yn
               then do:
 
                  {us/bbi/gprun.i ""csavg02.p""
                        "(input  pt_part,
                          input  pod_site,
                          input  ""PO-SUB"",
                          input  kbtransnbr,
                          input  recid(pt_mstr),
                          input  po_nbr,
                          input  qty_chg,
                          input  ip_usage_qty,
                          input  base_amt,
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
 
               end. /* if pod_type = "S" and curr_yn */
               /* For non-subcontract we need to also get the cost */
               if pod_type = ""
               then do:
 
                  {us/bbi/gprun.i ""csavg02.p""
                               "(input  pt_part,
                                 input  pod_site,
                                 input  transtype,
                                 input  kbtransnbr,
                                 input  recid(pt_mstr),
                                 input  po_nbr,
                                 input  qty_chg,
                                 input  ip_usage_qty,
                                 input  base_amt,
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
               
 
            end. /* Logistics Accounting Disabled */

         end. /* IF pod_type <> "" ... */
 
      end. /* If not using_supplier_consignemnt */
 
   end. /*if glx_mthd = ...*/
 
end.  /*if available pt_mstr*/
else
   sct_recno = ?.
 
for first si_mstr
   where si_domain = global_domain
    and  si_site = pod_site
no-lock: end.
 
pod_entity = si_entity.


/*c1171* start added code */

   for first si_mstr
      fields( si_domain si_cur_set si_db si_entity si_git_acct
             si_git_sub si_git_cc si_gl_set si_site)
       where si_domain <> si_db
        and  si_site = pod_site
   no-lock: end.
   if available si_mstr then pod_entity = si_entity.
   for first si_mstr
      fields( si_domain si_cur_set si_db si_entity si_git_acct
             si_git_sub si_git_cc si_gl_set si_site)
       where si_domain = global_domain
        and  si_site = pod_site
   no-lock: end.
/*c1171* end   added code */


 
if pod_po_site <> "" then
   for first si_mstr
       where si_domain = global_domain
        and  si_site = pod_po_site
   no-lock: end.
 
assign
   pod_po_entity = si_entity
   project       = pod_project
   rct_site      = pod_site
   pod_recno     = recid(pod_det).
 
if undo_all then return.
 
assign
   pt_recno  = recid(pt_mstr)
   pod_recno = recid(pod_det)
   po_recno  = recid(po_mstr)
   wr_recno  = recid(wr_route).
 
/* Create tr_hist, post to different */
/* applicable GL accounts */
 
/*c1171*  {us/bbi/gprun.i ""poporcb6.p"" */
/*c1171*/ {us/bbi/gprun.i ""xxporcb6.p""
   "(input shipnbr,
     input ship_date,
     input inv_mov,
     input pod_consignment,
     input ip_is_usage,
     input ip_usage_qty,
     input ip_woiss_trnbr,
     input ip_round_acct,
     input p_int_ref_type,
     input p_selectedReturnReceiver,
     input table tt_attr_pfvalue by-reference,
     input-output dataset dsSerialPicked by-reference,
     input p_shipnbr1,
     output op_rctpo_trnbr,
     output op_undo_lagit,
     output table tt_inv_trans)" }
 
if undo_all then return.
 
if pod_qty_chg <> 0 then do:
 
   find rmd_det
      where rmd_domain = global_domain and
            rmd_nbr    = pod_nbr       and
            rmd_prefix = "V"           and
            rmd_line   = pod_line
   exclusive-lock no-error.
 
   /*******************************************/
   /* Update receive/ship date and qty in rma */
   /*******************************************/
   if available rmd_det then do:
      if rmd_type = "O" then
         rmd_qty_acp  = - (pod_qty_rcvd + pod_qty_chg).
      else
         rmd_qty_acp  =   pod_qty_rcvd + pod_qty_chg.
      if rmd_qty_acp <> 0 then
         rmd_cpl_date =   eff_date.
      else
         rmd_cpl_date = ?.
   end.
 
end.  /**********end pod_qty_chg*************/
 
pod_recno = recid(pod_det).
 
/* ADDED 4TH INPUT PARAMETER ip_is_usage */
{us/bbi/gprun.i ""poporcb2.p"" "(input ship_date,
                          input i_shipto,
                          input pod_consignment,
                          input ip_is_usage,
                          input p_shipper_rec,
                          input p_int_ref_type,
                          input p_abs_um,
                          input p_abs_um_conv,
                          input p_abs_um_qty)" }
 
/* Post the credit terms interest component of the item price */
/* to a statiscal acccount for the PO receipt.                */
{us/bbi/gprun.i ""poporcb4.p"" }

/* POST THE ROUNDING DIFFERENCE TO THE PPV / POR ACCOUNT */
if ((pod_taxable = yes 
    and not can-find (first tx2d_det
                        where tx2d_domain  = global_domain
                        and   tx2d_ref     = receivernbr 
                        and   tx2d_nbr     = pod_nbr
                        and   tx2d_line    = pod_line
                        and   tx2d_rcpt_tax_point = yes))
    or not pod_taxable) 
   and po_curr = base_curr
   and po_curr = mgmt_curr
   and not pod_consignment
   and pod_type = ""
   and glx_mthd = "STD"
then do:
   for first prh_hist
      where prh_domain   = global_domain
      and   prh_nbr      = pod_nbr
      and   prh_receiver = receivernbr
      and   prh_line     = pod_line
   no-lock:
      l_rcpt_amt = prh_rcvd * prh_curr_amt * prh_um_conv.
   end. /* FOR FIRST prh_hist */

   for first gl_ctrl
      where gl_domain = global_domain
   no-lock:
   end. /* FOR FIRST gl_ctrl */

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_rcpt_amt,
        input gl_rnd_mthd,
        output mc-error-number)"}

   l_total_amt = 0.
   for each tt_inv_trans
      break by tt_trnbr:    
      for each trgl_det
         where trgl_domain = global_domain
         and   trgl_trnbr  = tt_trnbr
         and   trgl_type   <> "MIRROR"
      no-lock:   
         if trgl_gl_ref begins "IC"
         then
            assign
               l_total_amt = l_total_amt + trgl_gl_amt
               l_gl_ref    = trgl_gl_ref.
      end. /* FOR EACH trgl_det */
      
      /* CONSIDER OVERHEAD AMOUNT WHEN ENTITIES MATCH                 */
      /* FOR NON-MATCHING ENTITIES, tt_ohamt HAS INTERCOMPANY POSTING */
      if pod_entity = pod_po_entity 
         and tt_ohamt <> 0
      then
         l_total_amt = l_total_amt - tt_ohamt.

      if last (tt_trnbr)
         and  (l_rcpt_amt - l_total_amt) <> 0
         and  l_gl_ref <> ""
      then do:
         for first tr_hist
            where tr_domain = global_domain
            and   tr_trnbr  = tt_trnbr
         no-lock:
            {us/px/pxrun.i &PROC  = 'createTrglDetRecord'
                   &PROGRAM='ictrxr.p'
                   &handle = ph_ictrxr
                   &PARAM = "(input tt_trnbr,
                              input ""RCT-PO"",
                              input tt_acct[1], /* DEBIT ACCT      */
                              input tt_acct[2], /* DEBIT SUB-ACCT  */
                              input tt_acct[3], /* DEBIT CC        */
                              input tt_acct[4], /* DEBIT PROJ      */
                              input tt_acct[5], /* CREDIT ACCT     */
                              input tt_acct[6], /* CREDIT SUB-ACCT */
                              input tt_acct[7], /* CREDIT CC       */
                              input tt_acct[8], /* CREDIT PROJ     */
                              input (l_rcpt_amt - l_total_amt),
                              input yes,        /* CREATE glt_det  */
                              input ""RCT-PO"", /* TRANS TYPE      */
                              input pod_nbr,    /* ORDER #         */
                              input pod_entity, /* ENTITY          */
                              input eff_date,   /* EFFECTIVE DATE  */
                              input icc_gl_sum, /* SUMMARIZE       */
                              input icc_mirror, /* AUDIT           */
                              input recid(tr_hist), 
                              input """",    /* INTER COMPANY REF# */
                              input """",    /* CURRENCY           */
                              input 0,       /* EXCHANGE RATE      */
                              input 0,       /* EXCHANGE RATE 2    */
                              input """",    /* EXCHANGE RATE TYPE */
                              input 0,       /* CURRENCY AMOUNT */
                              input-output l_gl_ref,
                              output l_oidTrglDet
                             )"
                   &NOAPPERROR=true
                   &CATCHERROR=true}
         end. /* FOR FIRST tr_hist */
      end. /* IF LAST (tt_trnbr) */
   end. /* FOR EACH tt_inv_trans */
end. /* IF NOT pod_taxable */
