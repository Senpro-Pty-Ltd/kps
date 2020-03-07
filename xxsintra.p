/* xxsintra.p - COPY OF COMMON PROGRAM FOR MISC INVTY TRANSACTIONS CONTD     */
/* icsintra.p - COPY OF COMMON PROGRAM FOR MISC INVTY TRANSACTIONS CONTD     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsintra.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* Revision: 1.2          BY: Hitendra PV       DATE: 07/20/06 ECO: *R07B*    */
/* Revision: 1.3          BY: Hitendra PV       DATE: 09/27/07 ECO: *R0C6*    */
/* Revision: 1.4          BY: Neil Curzon       DATE: 03/10/08 ECO: *R0P6*    */
/* Revision: 1.7          BY: Nan Zhang         DATE: 02/19/08 ECO: *R0JS*    */
/* Revision: 1.8        BY: Jiang Wan         DATE: 12/20/08 ECO: *R1BY*    */
/* $Revision: 1.2 $   BY: Huaping Luo     DATE: 03/10/10 ECO: *R21W*   */
/* CYB    LAST MODIFIED: 31-MAY-2010    BY:  gbg *cy1016*                    */
/* CYB    LAST MODIFIED: 13-MAY-2011    BY:  gbg *c1214*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
 
/* THIS PROGRAM IS PART OF THE SCRAP TRANSACTION FUNCTIONALITY WHICH PROVIDES */
/* CAPABILITY TO SCRAP MATERIAL AT THE PART NUMBER LEVEL WITH DETAILS OF      */
/* QUANTITIES AND REASON CODES WITH A UNIQUE TRANSACTION (ISS-SCRP) CREATED   */
/* FOR SCRAP                                                                  */
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
{us/px/pxphdef.i ictrxr}
 
define input parameter shipnbr    like tr_ship_id      no-undo.
define input parameter ship_date  like tr_ship_date    no-undo.
define input parameter inv_mov    like tr_ship_inv_mov no-undo.
define input parameter kbtransnbr as   integer         no-undo.
define input parameter i_addship  as   logical         no-undo.
 
define new shared variable  ec_ok as logical.
 
define shared variable transtype as character format "x(7)" no-undo.
define shared variable ref like glt_ref.
define shared variable issrct as character format "x(3)".
define shared variable um like pt_um no-undo.
define shared variable conv like um_conv label "Conversion" no-undo.
define shared variable eff_date like glt_effdate
   label "Effective".
define shared variable trlot like tr_lot.
define shared variable unit_cost like tr_price label "Unit Cost".
define shared variable ordernbr like tr_nbr.
define shared variable orderline like tr_line.
define shared variable so_job like tr_so_job.
define shared variable addr like tr_addr.
define shared variable rmks like tr_rmks.
define shared variable dr_acct like trgl_dr_acct.
define shared variable dr_sub like trgl_dr_sub.
define shared variable dr_cc like trgl_dr_cc.
define shared variable cr_acct like trgl_cr_acct.
define shared variable cr_sub like trgl_cr_sub.
define shared variable cr_cc like trgl_cr_cc.
define shared variable project like wo_proj no-undo.
define shared variable projectcr like wo_proj no-undo.
define shared variable lotserial_qty like sr_qty no-undo.
define shared variable site like sr_site no-undo.
define shared variable part like tr_part.
define shared variable tr_recno as recid.
 
define variable l_trans-ok like mfc_logical no-undo.
define variable l_wonbr like lot_nbr        no-undo.
define variable l_woline like lot_line      no-undo.
define variable l_gl_tmp_amt as decimal     no-undo.
define variable l_v_abs_recid as recid      no-undo.
define variable cons-proj like wo_proj                no-undo.

/* trgl_det account variables */
{us/ic/icglacct.i}
/* CONSIGNMENT VARIABLES. */
{us/so/socnvars.i}
define variable consign_inv_acct as character         no-undo.
define variable consign_inv_sub as character          no-undo.
define variable consign_inv_cc as character           no-undo.
define variable consign_intrans_acct as character     no-undo.
define variable consign_intrans_sub as character      no-undo.
define variable consign_intrans_cc as character       no-undo.
define variable consign_offset_acct as character      no-undo.
define variable consign_offset_sub as character       no-undo.
define variable consign_offset_cc as character        no-undo.
define variable glcost as decimal                     no-undo.
define variable assay  as character                   no-undo.
define variable grade  as character                   no-undo.
define variable expire as date                        no-undo.
define variable io_first_time as logical initial yes  no-undo.
define variable hold_trnbr like tr_trnbr              no-undo.
define variable l_rmks as character                   no-undo.
define variable io_batch like cnsu_batch              no-undo.
define variable using_supplier_consignment as logical no-undo.
define variable v_trflow_flg       as   logical       no-undo.

/*c1214*/ def shared var v_user1        as char format "x(8)".
/*c1214*/ def shared var v_user2        as char format "x(8)".
/*c1214*/ def shared var v_user3        as char format "x(30)".
 
/* SHARED TEMP-TABLES */
{us/ic/icshmtdf.i "new"}
 
l_rmks = getTermLabel("CONSIGNED",12).
 
for first gl_ctrl where gl_domain = global_domain
no-lock: end.
 
for first clc_ctrl where clc_domain = global_domain
no-lock: end.
 
if not available clc_ctrl
then do:
   {us/bbi/gprun.i ""gpclccrt.p""}
   for first clc_ctrl where clc_domain = global_domain
   no-lock: end.
end. /* IF NOT AVAILABLE clc_ctrl */
 
/* CHECK TO SEE IF CUSTOMER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
         "(input ENABLE_CUSTOMER_CONSIGNMENT,
           input 10,
           input ADG,
           input CUST_CONSIGN_CTRL_TABLE,
           output using_cust_consignment)"}
 
/* DETERMINE IF SUPPLIER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
         "(input 'enable_supplier_consignment',
           input 11,
           input ADG,
           input 'cns_ctrl',
           output using_supplier_consignment)"}
 
/* Read item record */
for first pt_mstr where pt_domain = global_domain
   and pt_part   = part
no-lock: end.
 
/* Clear shipper line item temp table */
if i_addship
then do:
   {us/bbi/gprun.i  ""icshmt1c.p""}
end. /* IF i_addship */
 
for each sr_wkfl where sr_domain = global_domain
   and sr_userid = SessionUniqueID
exclusive-lock:
 
   assign
      lotserial_qty = sr_qty * conv
      l_wonbr  = ""
      l_woline = "".
 
   if issrct = "ISS" then
      lotserial_qty = - lotserial_qty.
 
   if (transtype = "RCT-PO"
   or  transtype = "RCT-WO")
   then
      assign
         l_wonbr  = ordernbr
         l_woline = sr_lineid.
 
   /* ADD RECORD TO LOT MASTER */
   if  (clc_lotlevel <> 0)
   and (sr_lotser <> "")
   then do:
      {us/bbi/gprun.i ""gpiclt.p""
               "(input part,
                 input sr_lotser,
                 input l_wonbr,
                 input l_woline,
                 output l_trans-ok)"}
 
      if not l_trans-ok
      then do:
         /* CURRENT TRANSACTION REJECTED - */
         {us/bbi/pxmsg.i &MSGNUM=2740 &ERRORLEVEL=4}
         delete sr_wkfl.
         next.               /* CONTINUE WITH NEXT TRANSACTION */
      end. /* IF NOT l_trans-ok */
 
   end. /* IF (CLC_LOTLEV <> 0) */
 
   /* Add to shipper line item temp table */
   if i_addship
   then do:
      {us/bbi/gprun.i ""icshmt1a.p""
               "(input """",
                 input """",
                 input part,
                 input sr_lotser,
                 input sr_ref,
                 input sr_site,
                 input sr_loc,
                 input sr_qty,
                 input um,
                 input conv,
                 input if available pt_mstr then pt_net_wt * sr_qty * conv
                       else 0,
                 input if available pt_mstr then pt_net_wt_um
                       else """",
                 input if available pt_mstr then pt_size * sr_qty * conv
                       else 0,
                 input if available pt_mstr then pt_size_um
                       else """" )"}
 
   end.  /* if i_addship */
 
end.  /* for each sr_wkfl */
 
/* Create or add to shipper */
if i_addship
then do:
 
   {us/bbi/gprun.i ""icshmt.p""
            "(input site,
              input addr,
              input transtype,
              input eff_date,
              ""no"",
              output l_v_abs_recid,
              output v_trflow_flg)" }
 
   /* Get associated shipper */
   find abs_mstr where recid(abs_mstr) = l_v_abs_recid
   no-lock no-error.
 
   if available abs_mstr
   then do:
 
      assign
         shipnbr   = substring(abs_id,2)
         ship_date = abs_shp_date
         inv_mov   = abs_inv_mov.
 
      /* If the transaction flow is not internal,
         then print legal document */
      if v_trflow_flg = yes then do:
         /* Global Shipping */
         {us/bbi/gprun.i ""gpldnbr.p"" "(recid(abs_mstr))"}
         {us/bbi/gprun.i ""icldprt.p"" "(recid(abs_mstr))"}
      end.
   end.
 
end.  /* IF i_addship */
 
for each sr_wkfl where sr_domain = global_domain
   and   sr_userid = SessionUniqueID
no-lock:
 
   lotserial_qty = sr_qty * conv.
 
   if issrct = "ISS" then
      lotserial_qty = - lotserial_qty.
 
/*cy1016*/ if transtype = "iss-scrp"
/*cy1016*/ then do:
/*cy1016*/   find first xrac_det no-lock
/*cy1016*/   where xrac_domain = global_domain
/*cy1016*/   and   xrac_type = "scrap"
/*cy1016*/   and   xrac_site = sr_site
/*cy1016*/   and   xrac_code = sr__qadc01
/*cy1016*/   no-error.
/*cy1016*/   if available xrac_det
/*cy1016*/   then do:
/*cy1016*/     assign
/*cy1016*/     dr_acct = xrac_acct
/*cy1016*/     dr_sub = xrac_sub
/*cy1016*/     dr_cc  = xrac_cc.
/*cy1016*/   end.
/*cy1016*/ end.

   /* TO STORE THE REASON CODE IN tr_rsn_code IN THE tr_hist TABLE */
   /* PASS IT AS &rsncode HERE TO THE NEW PROGRAM us/ic/icstrans.i       */
   {us/ic/icstrans.i
      &addrid=addr
      &bdnstd=0
      &cracct="
        if issrct    = ""RCT""
        or transtype = ""ISS-SCRP""
        then
           cr_acct
        else
           if available pld_det
           then
              pld_inv_acct
           else
              pl_inv_acct"
      &crsub="if issrct = ""RCT"" or transtype = ""ISS-SCRP""
      then
         cr_sub
              else
                 if available pld_det
                 then
                    pld_inv_sub
                 else
                    pl_inv_sub"
      &crcc="if issrct = ""RCT"" or transtype = ""ISS-SCRP"" then cr_cc
             else
                if available pld_det
                then
                   pld_inv_cc
                else
                   pl_inv_cc"
      &crproj=projectcr
      &curr=""""
      &dracct="if issrct = ""ISS""
      then
         dr_acct
      else
      if available pld_det
      then
         pld_inv_acct
      else
         pl_inv_acct"
      &drsub="if issrct = ""ISS""
      then
         dr_sub
              else
                 if available pld_det
                 then
                    pld_inv_sub
                 else
                    pl_inv_sub"
      &drcc="if issrct = ""ISS""
      then
         dr_cc
             else
                if available pld_det
                then
                   pld_inv_cc
                else
                   pl_inv_cc"
      &drproj=project
      &effdate=eff_date
      &exrate=0
      &exrate2=0
      &exratetype=""""
      &exruseq=0
      &glamt="if available sct_det then sct_cst_tot * sr_qty * conv
              else 0"
      &kbtrans=kbtransnbr
      &lbrstd=0
      &line=orderline
      &location=sr_loc
      &lotnumber=trlot
      &lotref=sr_ref
      &lotserial=sr_lotser
      &mtlstd=0
      &ordernbr=ordernbr
      &ovhstd=0
      &part=part
      &perfdate=?
      &price="if available sct_det then sct_cst_tot
              else 0"
      &quantityreq=0
      &quantityshort=0
      &quantity=lotserial_qty
      &revision=""""
      &rmks=rmks
      &shiptype=""""
      &shipnbr=shipnbr
      &shipdate=ship_date
      &invmov=inv_mov
      &site=sr_site
      &slspsn1=""""
      &slspsn2=""""
      &sojob=so_job
      &substd=0
      &transtype=transtype
      &msg=0
      &ref_site=tr_site
      &rsncode=sr__qadc01}
 
   tr_recno = recid(tr_hist).

/*c1214*/  do transaction:
/*c1214*/     find current tr_hist exclusive-lock no-error.
/*c1214*/     if available tr_hist
/*c1214*/     then do:
/*c1214*/         tr_user1 = v_user1.
/*c1214*/         tr_user2 = v_user2.
/*c1214*/         tr__chr01 = v_user3.
/*c1214*/         release tr_hist.
/*c1214*/     end.
/*c1214*/  end.
 
   if using_cust_consignment
      and
      ((transtype = "RCT-UNP" and lotserial_qty > 0)
         or
      (transtype = "ISS-UNP" and lotserial_qty < 0))
   then do:
      consign_flag = no.
      {us/gp/gprunmo.i &program = "socnsod1.p" &module = "ACN"
                 &param = """(input ordernbr,
                              input orderline,
                              output consign_flag,
                              output consign_loc,
                              output intrans_loc,
                              output max_aging_days,
                              output auto_replenish)"""}
 
      if consign_flag
      then do:
 
         /* DETERMINE CONSIGNMENT ACCOUNTS */
         if consign_inv_acct = ""
         then do:
            {us/gp/gprunmo.i &program = "socnacct.p" &module = "ACN"
                       &param = """(input part,
                                    input site,
                                    input sr_loc,
                                    output consign_inv_acct,
                                    output consign_inv_sub,
                                    output consign_inv_cc,
                                    output consign_intrans_acct,
                                    output consign_intrans_sub,
                                    output consign_intrans_cc,
                                    output consign_offset_acct,
                                    output consign_offset_sub,
                                    output consign_offset_cc)"""}
         end. /* IF consign_inv_acct = "" */
 
         /*UPDATE THE RCT-UNP/ISS-UNP REMARK WITH "CONSIGNED"*/
         hold_trnbr = tr_hist.tr_trnbr.
 
         if rmks = "" then
            for first tr_hist where tr_hist.tr_domain = global_domain
                and tr_hist.tr_trnbr = hold_trnbr
            exclusive-lock:
               tr_rmks = l_rmks.
            end. /* FOR FIRST tr_hist */
 
        /* cons-proj is set according to value of issrct */
        if issrct = "ISS" then
           cons-proj = project.
        else
           cons-proj = projectcr.
 
         /* CREATE CN-SHIP TRANSACTION */
         /* PASS IN THE RCT_TRNBR TO ICXFER3, TO BE USED FOR REMARKS*/
         {us/gp/gprunmo.i &program = "icxfer3.p" &module = "ACN"
                    &param = """(input trlot,
                                 input sr_lotser,
                                 input sr_ref,
                                 input sr_ref,
                                 input -1 * lotserial_qty,
                                 input ordernbr,
                                 input ordernbr,
                                 input orderline,
                                 input "''",
                                 input cons-proj,
                                 input eff_date,
                                 input sr_site,
                                 input sr_loc,
                                 input sr_site,
                                 input sr_loc,
                                 input no,
                                 input "''",
                                 input eff_date,
                                 input inv_mov,
                                 input (if sr_loc = intrans_loc
                                        then
                                           consign_intrans_acct
                                        else
                                           consign_inv_acct),
                                 input (if sr_loc = intrans_loc
                                        then
                                           consign_intrans_sub
                                        else
                                           consign_inv_sub),
                                 input (if sr_loc = intrans_loc
                                        then
                                           consign_intrans_cc
                                        else
                                           consign_inv_cc),
                                 input consign_offset_acct,
                                 input consign_offset_sub,
                                 input consign_offset_cc,
                                 input base_curr,
                                 input (if available sct_det
                                        then
                                           sct_cst_tot
                                        else
                                           0),
                                 input 0,
                                 output glcost,
                                 input-output hold_trnbr,
                                 input-output assay,
                                 input-output grade,
                                 input-output expire)"""}
 
          /* CREATE CONSIGNMENT SHIPMENT-INVENTORY X-REF */
 
          /* PARAMETER io_first_time  gets passed  in as YES initially    */
          /* to & socncix.p. When io_first_time is YES, then socncix.p    */
          /* will create a new cross ref rec.  Once io_first_time    is   */
          /* NO, socncix.p will try to reuse the same cross refernce rec  */
          /* if all other key information is the same.                    */
 
         {us/gp/gprunmo.i &program = "socncix.p" &module = "ACN"
                    &param = """(input ordernbr,
                                 input orderline,
                                 input sr_site,
                                 input eff_date,
                                 input lotserial_qty,
                                 input um,
                                 input "''",
                                 input hold_trnbr,
                                 input sr_loc,
                                 input sr_lotser,
                                 input sr_ref,
                                 input "''",
                                 input so_job,
                                 input "''",
                                 input "''",
                                 input "''",
                                 input "''",
                                 input "''",
                                 input true,
                                 input-output io_first_time)"""}
 
      end. /* if consign_flag*/
   end. /*if using_cust_consignment*/
 
   if   using_supplier_consignment
   and (transtype = "RCT-UNP"
   or   transtype = "ISS-UNP"
   or   transtype = "ISS-SCRP")
   then do:
 
      /* STD TRANSACTION QTY IS PROCESSED AS -lotserial_qty SO IT IS TREATED */
      /* AS A POSITIVE QTY IN ictrancn.p, IMPLYING lotserial_qty IS NEGATIVE */
      /* TO START WITH.  THEREFORE, IF lotserialqty > 0, IT IS A REVERSAL.   */
      {us/gp/gprunmo.i &program = ""pocnsix4.p"" &module = "ACN"
                 &param   =  """(input part,
                                 input sr_site,
                                 input sr_loc,
                                 input right-trim(substring(sr_lotser,1,18)),
                                 input sr_ref,
                                 input (if lotserial_qty > 0 then true
                                        else false),
                                 output consign_flag)"""}
 
      if consign_flag
      then do:
 
         /*UPDATE THE RCT-UNP/ISS-UNP REMARK WITH "CONSIGNED"*/
         hold_trnbr = tr_hist.tr_trnbr.
 
         if rmks = "" then
            for first tr_hist where tr_hist.tr_domain = global_domain
               and tr_hist.tr_trnbr = hold_trnbr
            exclusive-lock:
               tr_rmks = l_rmks.
            end. /* FOR FIRST tr_hist */
 
         {us/gp/gprunmo.i &program = ""ictrancn.p"" &module  = "ACN"
                    &param   = """(input ordernbr,
                                   input '',
                                   input 0,
                                   input tr_so_job,
                                   input - lotserial_qty,
                                   input sr_lotser,
                                   input part,
                                   input sr_site,
                                   input sr_loc,
                                   input sr_ref,
                                   input eff_date,
                                   input tr_trnbr,
                                   input false,
                                   input-output io_batch)"""}
 
      end. /* IF consign_flag */
   end. /*if using_supplier_consignment*/
end. /* FOR EACH sr_wkfl */
 
do transaction:
   for each sr_wkfl where sr_domain = global_domain
      and   sr_userid = SessionUniqueID
   exclusive-lock:
      delete sr_wkfl.
   end. /* FOR EACH sr_wkfl */
 
end. /* DO TRANSACTION */
