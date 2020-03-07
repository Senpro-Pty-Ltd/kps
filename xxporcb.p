/* xxporcb.p - PURCHASE ORDER RECEIPT W/ SERIAL NUMBER CONTROL                */
/* poporcb.p - PURCHASE ORDER RECEIPT W/ SERIAL NUMBER CONTROL                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxporcb.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */

/* REVISION: 7.0      LAST MODIFIED: 11/19/91   BY: pma *F003*                */
/* REVISION: 7.0      LAST MODIFIED: 12/09/91   BY: RAM *F070*                */
/* REVISION: 7.0      LAST MODIFIED: 01/02/92   BY: WUG *F034*                */
/* REVISION: 7.0      LAST MODIFIED: 01/31/92   BY: RAM *F126*                */
/* REVISION: 7.0      LAST MODIFIED: 02/05/92   BY: RAM *F170*                */
/* REVISION: 7.0      LAST MODIFIED: 02/06/92   BY: RAM *F177*                */
/* REVISION: 7.0      LAST MODIFIED: 02/10/92   BY: MLV *F164*                */
/* REVISION: 7.0      LAST MODIFIED: 02/14/92   BY: SAS *F211*                */
/* REVISION: 7.0      LAST MODIFIED: 02/24/92   BY: sas *F211*                */
/* REVISION: 7.0      LAST MODIFIED: 02/24/92   BY: pma *F085*                */
/* REVISION: 7.0      LAST MODIFIED: 03/09/92   BY: pma *F086*                */
/* REVISION: 7.0      LAST MODIFIED: 07/30/92   BY: ram *F819*                */
/* REVISION: 7.3      LAST MODIFIED: 09/29/92   BY: tjs *G028*                */
/* REVISION: 7.3      LAST MODIFIED: 11/10/92   BY: pma *G304*                */
/* REVISION: 7.3      LAST MODIFIED: 02/11/93   BY: tjs *G675*                */
/* REVISION: 7.3      LAST MODIFIED: 04/30/93   BY: WUG *GA61*                */
/* REVISION: 7.3      LAST MODIFIED: 05/21/93   BY: kgs *GB26*                */
/* REVISION: 7.3      LAST MODIFIED: 07/07/93   BY: afs *GD28*                */
/* REVISION: 7.3      LAST MODIFIED: 07/08/93   BY: cdt *GD29*                */
/* REVISION: 7.4      LAST MODIFIED: 10/23/93   BY: cdt *H184*                */
/* REVISION: 7.4      LAST MODIFIED: 11/04/93   BY: bcm *H210*                */
/* REVISION: 7.4      LAST MODIFIED: 11/12/93   BY: afs *H219*                */
/* REVISION: 7.4      LAST MODIFIED: 11/16/93   BY: afs *H227*                */
/* REVISION: 7.4      LAST MODIFIED: 03/22/94   BY: dpm *FM94*                */
/* REVISION: 7.4      LAST MODIFIED: 04/08/94   BY: dpm *H074*                */
/* REVISION: 7.4      LAST MODIFIED: 05/04/94   BY: bcm *H365*                */
/* REVISION: 7.4      LAST MODIFIED: 04/15/94   BY: dpm *FN24*                */
/* REVISION: 7.4      LAST MODIFIED: 08/08/94   BY: cdt *FP92*                */
/* REVISION: 7.4      LAST MODIFIED: 09/09/94   BY: bcm *H511*                */
/* REVISION: 8.5      LAST MODIFIED: 10/31/94   BY: taf *J038*                */
/* REVISION: 7.4      LAST MODIFIED: 11/10/94   BY: bcm *GO37*                */
/* REVISION: 7.4      LAST MODIFIED: 12/07/94   BY: bcm *H618*                */
/* REVISION: 7.4      LAST MODIFIED: 02/16/95   BY: jxz *F0JC*                */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.4      LAST MODIFIED: 07/19/95   BY: rxm *G0QG*                */
/* REVISION: 7.4      LAST MODIFIED: 09/12/95   BY: ais *F0V7*                */
/* REVISION: 8.5      LAST MODIFIED: 10/13/95   BY: taf *J053*                */
/* REVISION: 7.4      LAST MODIFIED: 02/08/96   BY: emb *G1MS*                */
/* REVISION: 8.5      LAST MODIFIED: 02/06/96   BY: *J0CV* Robert Wachowicz   */
/* REVISION: 8.5      LAST MODIFIED: 03/25/96   BY: *G1QK* Arthur Schain      */
/* REVISION: 8.5      LAST MODIFIED: 04/15/96   BY: *H0K5* Robin McCarthy     */
/* REVISION: 8.5      LAST MODIFIED: 05/02/96   BY: *H0KT* Robin McCarthy     */
/* REVISION: 8.6      LAST MODIFIED: 09/03/96   BY: *K008* Jeff Wootton       */
/* REVISION: 8.6      LAST MODIFIED: 09/04/96   BY: *H0MK* Sanjay D. Patil    */
/* REVISION: 8.6      LAST MODIFIED: 10/11/96   BY: *G2FT* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 10/18/96   BY: *K003* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 11/25/96   BY: *K01X* Jeff Wootton       */
/* REVISION: 8.6      LAST MODIFIED: 01/08/97   BY: *H0QF* Sue Poland         */
/* REVISION: 8.6      LAST MODIFIED: 02/20/97   BY: *H0SL* Jim Williams       */
/* REVISION: 8.6      LAST MODIFIED: 06/18/97   BY: *H19L* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 07/04/97   BY: *H0ZX* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 08/22/97   BY: *H1C4* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 02/13/98   BY: *H1JM* Nirav Parikh       */
/* REVISION: 8.6E     LAST MODIFIED: 06/17/98   BY: *L020* Charles Yen        */
/* REVISION: 8.6E     LAST MODIFIED: 08/19/98   BY: *L062* Steve Nugent       */
/* REVISION: 8.6E     LAST MODIFIED: 08/20/98   BY: *J2WP* Irine D'mello      */
/* REVISION: 8.6E     LAST MODIFIED: 12/01/98   BY: *L0CN* Steve Goeke        */
/* REVISION: 8.6E     LAST MODIFIED: 12/04/98   BY: *H1N8* Felcy D'Souza      */
/* REVISION: 9.0      LAST MODIFIED: 12/15/98   BY: *J34F* Vijaya Pakala      */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 03/22/99   BY: *J37F* Poonam Bahl        */
/* REVISION: 9.0      LAST MODIFIED: 03/26/99   BY: *L0DM* Kedar Deherkar     */
/* REVISION: 9.0      LAST MODIFIED: 04/16/99   BY: *J2DG* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 07/21/99   BY: *J3JP* Prashanth Narayan  */
/* REVISION: 9.0      LAST MODIFIED: 09/03/99   BY: *K22C* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* PATTI GAULTNEY     */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* Revision: 1.39       BY: Jack Rief             DATE: 07/20/00  ECO: *N0DK* */
/* Revision: 1.40       BY: Mark Brown            DATE: 08/13/00  ECO: *N0KQ* */
/* Revision: 1.41       BY: Markus Barone         DATE: 07/20/00  ECO: *N0R3* */
/* Revision: 1.42       BY: Murali Ayyagari       DATE: 11/06/00  ECO: *N0V1* */
/* Revision: 1.43       BY: Manish Kulkarni       DATE: 01/12/01  ECO: *N0VL* */
/* Revision: 1.44       BY: Katie Hilbert         DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.45       BY: Jean Miller           DATE: 06/20/01  ECO: *M11Z* */
/* Revision: 1.46       BY: Vivek Dsilva          DATE: 03/18/02  ECO: *N1D0* */
/* Revision: 1.48       BY: Patrick Rowan         DATE: 04/17/02  ECO: *P043* */
/* Revision: 1.49       BY: Ellen Borden          DATE: 05/24/02  ECO: *P018* */
/* Revision: 1.50       BY: Luke Pokic            DATE: 05/24/02  ECO: *P03Z* */
/* Revision: 1.51       BY: Jean Miller           DATE: 06/07/02  ECO: *P080* */
/* Revision: 1.52       BY: Steve Nugent          DATE: 06/13/02  ECO: *P08K* */
/* Revision: 1.53       BY: Luke Pokic            DATE: 06/19/02  ECO: *P099* */
/* Revision: 1.54       BY: Robin McCarthy        DATE: 07/15/02  ECO: *P0BJ* */
/* Revision: 1.56       BY: Pawel Grzybowski      DATE: 03/27/03  ECO: *P0NT* */
/* Revision: 1.58       BY: Paul Donnelly (SB)    DATE: 06/28/03  ECO: *Q00J* */
/* Revision: 1.59       BY: Reena Ambavi          DATE: 08/18/03  ECO: *P0ZQ* */
/* Revision: 1.60       BY: Veena Lad             DATE: 06/03/04  ECO: *P24K* */
/* Revision: 1.61       BY: Paul Dreslinski       DATE: 10/30/04  ECO: *M1M3* */
/* Revision: 1.66       BY: Robin McCarthy        DATE: 08/19/05  ECO: *P2PJ* */
/* Revision: 1.67       BY: Julie Milligan        DATE: 09/07/05  ECO: *P37P* */
/* Revision: 1.1.1.3    BY: Changlin Zeng         DATE: 04/26/06  ECO: *R045* */
/* Revision: 1.69       BY: Anil Sudhakaran       DATE: 04/30/07  ECO: *R0C6* */
/* Revision: 1.70       BY: Katie Hilbert         DATE: 03/27/08  ECO: *R0Q2* */
/* Revision: 1.71       BY: Prashant Menezes      DATE: 09/11/08  ECO: *P6R3* */
/* Revision: 1.72       BY: Katie Hilbert         DATE: 06/29/10  ECO: *R21M* */
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

/*! * poporcb.p - PERFORM PO RECEIPT & RETURN TRANSACTIONS & POSTINGS
    *             CALLED BY poporcm.p, porvism.p
    *             CALLED BY ictrancn.p (Issue of Consigned PO Material)
*/

/* The values contained in pod_det in poporcb.p are the values
   *before* the receipt update has taken place.  When entering
   poporcb5.p, the pod_det record contains the values *after* the
   receipt update has taken place.
*/
using com.qad.eefin.bgl.GLByGLTypeGLSystemType.
using com.qad.eefin.bdomain.DomainForOperationalInfo.
using com.qad.eefin.bexchangeratetype.ExchangeRateTypeByTypeCode.
using com.qad.eefin.bcurrency.SelectCurrency.

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}    /* EXTERNAL LABEL INCLUDE */
{us/gp/gpuid.i}
{us/px/pxmaint.i}
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */

/* Define Handles for the programs. */
{us/px/pxphdef.i porcxr}
{us/px/pxphdef.i porcxr1}
/* End Define Handles for the programs. */

/* Define Data Object Variables */
define variable GeneralLedger    as GLByGLTypeGLSystemType     no-undo.
define variable DomainInfo       as DomainForOperationalInfo   no-undo.
define variable ExchangeRateType as ExchangeRateTypeByTypeCode no-undo.
define variable StatCurrency     as SelectCurrency             no-undo.

/* Dataset that contains serial IDs picked for PO */
{us/pa/papodspk.i}

{us/ca/cattdef2.i}

define temp-table tt_POReceiver no-undo
   field tt_rcv_pod_line as integer
   field tt_sel_receiver as character
   index tt_idx1 as primary tt_rcv_pod_line.

/* PARAMETERS */
define input parameter shipnbr         like tr_ship_id      no-undo.
define input parameter ship_date       like prh_ship_date   no-undo.
define input parameter inv_mov         like tr_ship_inv_mov no-undo.
define input parameter i_shipto        like abs_shipto      no-undo.
define input parameter auto_receipt    like mfc_logical     no-undo.
define input parameter ip_is_usage     like mfc_logical     no-undo.
define input parameter ip_usage_qty    like tr_qty_req      no-undo.
define input parameter ip_usage_price  as decimal           no-undo.
define input parameter ip_woiss_trnbr  like tr_rmks         no-undo.
define input parameter p_pod_line      like pod_line        no-undo.
define input parameter p_int_ref_type  like lacd_internal_ref_type no-undo.
define input parameter table for tt_POReceiver.
define input parameter table for tt_attr_pfvalue.
define input-output parameter dataset for dsSerialPicked.
define input parameter p_shipnbr1      like tr_ship_id      no-undo.
define output parameter op_rctpo_trnbr like tr_trnbr        no-undo.
define output parameter op_undo_lagit like mfc_logical        no-undo.

/* SHARED VARIABLES, BUFFERS AND FRAMES */
define new shared variable cr_acct         like trgl_cr_acct extent 7.
define new shared variable cr_sub          like trgl_cr_sub extent 7.
define new shared variable cr_cc           like trgl_cr_cc extent 7.
define new shared variable cr_proj         like trgl_cr_proj extent 7.
define new shared variable crtint_amt      like trgl_gl_amt.
define new shared variable dr_acct         like trgl_dr_acct extent 7.
define new shared variable dr_sub          like trgl_dr_sub extent 7.
define new shared variable dr_cc           like trgl_dr_cc extent 7.
define new shared variable dr_proj         like trgl_dr_proj extent 7.
define new shared variable entity          like si_entity extent 7.
define new shared variable gl_amt          like trgl_gl_amt extent 7.
define new shared variable gl_mgmt_curr_amt like glt_det.glt_mgmt_curr_amt extent 7.

define new shared variable lotser          like sod_serial.
define new shared variable old_status      like pod_status.
define new shared variable openqty         like mrp_qty.
define new shared variable price           like tr_price.
define new shared variable project         like pvo_project.
define new shared variable qty_oh          like in_qty_oh.
define new shared variable rcv_type        like poc_rcv_type.
define new shared variable stdcst          like tr_price.
define new shared variable trqty           like tr_qty_chg.
define new shared variable yes_char        as  character format "x(1)".
define new shared variable trnbr           like op_trnbr.
define new shared variable tax_recno       as   recid.
define new shared variable undo_all        like mfc_logical no-undo.
define new shared variable l_next_line     like pod_line no-undo.
{us/gp/gpscdef.i}

define new shared workfile posub
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
   field    posub_move      as   logical
   .

define new shared variable la-trans-nbr   like tr_hist.tr_trnbr no-undo.
define new shared variable first-la-receiver as character no-undo.

/* SHARED VARIABLES, BUFFERS AND FRAMES */
define     shared variable rndmthd         like rnd_rnd_mthd.
define     shared variable vendlot         like tr_vend_lot no-undo.
define     shared variable qopen           like pod_qty_rcvd.
define     shared variable receipt_date    like prh_rcp_date no-undo.
define     shared variable receivernbr     like prh_receiver.
define     shared variable fiscal_rec      as   logical initial false.
define     shared workfile tax_wkfl
   field tax_nbr         like pod_nbr
   field tax_line        like pod_line
   field tax_env         like pod_tax_env
   field tax_usage       like pod_tax_usage
   field tax_taxc        like pod_taxc
   field tax_in          like pod_tax_in
   field tax_taxable     like pod_taxable
   field tax_price       like prh_pur_cost.

/* KANBAN TRANSACTION NUMBER, SHARED FROM poporcm.p AND kbporcm.p */
define shared variable kbtransnbr as integer no-undo.

{us/po/porcdef.i}

/* LOCAL VARIABLES, BUFFERS AND FRAMES */

define variable tax_lines       like tx2d_line initial 0 no-undo.
define variable poc_seq_rcv     like mfc_logical initial yes no-undo.
define variable l_last_receiver like prh_receiver no-undo.
define variable comb_exch_rate  like exr_rate     no-undo.
define variable comb_exch_rate2 like exr_rate2    no-undo.
define variable first-la-po-nbr as character no-undo.
define variable use-log-acctg   as logical   no-undo.
define variable git-stat        like mfc_logical no-undo.
define variable cRoundingDifferencesAccount as character no-undo.
define variable l_abs_um_conv      as   decimal   no-undo.
define variable l_abs_um           as   character no-undo.
define variable l_total_abs_um_qty as   decimal   no-undo.
define variable l_ori_price        as   decimal   no-undo.
define variable l_total_abs_qty    as   decimal   no-undo.
define variable l_selectedReceiver as   character no-undo.
define variable l_undo            as logical no-undo.
define variable l_um_conv         as decimal no-undo.
define variable l_use_pod_um_conv as logical no-undo.
define variable l_conv            as decimal no-undo.

define buffer   b_srwkfl           for  sr_wkfl.
define buffer   b_absmstr          for  abs_mstr.

{us/po/pocnvars.i} /* Variables for Consignment Inventory */
/* DETERMINE IF SUPPLIER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ENABLE_SUPPLIER_CONSIGNMENT,
     input 11,
     input ADG,
     input SUPPLIER_CONSIGN_CTRL_TABLE,
     output using_supplier_consignment)"}

&if defined(gpfieldv) = 0 &then
   &global-define gpfieldv
   {us/bbi/gpfieldv.i}
&endif

{us/bbi/gpfield.i &field_name='"mfc_logical"'}

/* VALIDATE IF LOGISTICS ACCOUNTING IS TURNED ON */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

/* DETERMINE IF SHIPPER IS IN TRANSIT */
if use-log-acctg then do:
   {us/gp/gprunmo.i &module = "LA" &program = ""lagit.p""
              &param = """(output git-stat)"""}
end.

yes_char = getTermLabel("YES",1).

if field_found then yes_char = substring(field_format,1,1).

form prh_hist with frame hf_prh_hist.

find po_mstr where recid(po_mstr) = po_recno exclusive-lock.

if use-log-acctg then do:

   la-trans-nbr = 0.

   /* MEMORIZE LAST RECEIVER RECEIVED FOR THIS PURCHASE ORDER */
   for last pvo_mstr
      where pvo_mstr.pvo_domain = global_domain
       and  pvo_order_type = {&TYPE_PO}
       and  pvo_order = po_nbr
       and  pvo_internal_ref_type = {&TYPE_POReceiver}
   no-lock use-index pvo_order:

      if first-la-receiver = "" or first-la-po-nbr <> po_nbr then
         first-la-receiver = pvo_internal_ref.

   end.

   if first-la-po-nbr = "" or first-la-po-nbr <> po_nbr then
      first-la-po-nbr = po_nbr.

end.

{us/px/pxrun.i &PROC = 'getReceiverPolicy' &PROGRAM = 'porcxr.p'
         &HANDLE = ph_porcxr
         &PARAM = "(output rcv_type,
                    output poc_seq_rcv)"
         &CATCHERROR = true
         &NOAPPERROR = true}

/* If fiscal receiving then by pass poporcx.p */
if receivernbr > "" and not git-stat and
   fiscal_rec = no and rcv_type <> 2
then do:
   tax_lines = 0.
   do on error undo, return error return-value:
     {us/bbi/gprun.i ""poporcx.p"" "( input tax_lines,
                                      input shipnbr,
                                      input p_int_ref_type)" }
   end.
end.

crtint_amt = 0.

/* Generate receiver number for receiver type = 0 or receiver type = 1  */
/* when sequential receiver not required */
if (rcv_type <> 2 
   and receivernbr = "" 
   and not poc_seq_rcv)
then do:
   if not git-stat
   then
      run getNextReceiverNbr (output receivernbr).

   if fiscal_rec = no then do:
      tax_lines = 0.
      do on error undo, return error return-value:
         {us/bbi/gprun.i ""poporcx.p"" "( input tax_lines,
                                          input shipnbr,
                                          input p_int_ref_type)" }
      end.
   end. /* if fiscal_rec = no */
end. /* End of transaction  */


run getRoundingDifferencesAccount (output cRoundingDifferencesAccount).

{us/gp/gpscproxy.i}
	
podloop:

for each pod_det no-lock
   where pod_det.pod_domain = global_domain
   and ( pod_nbr = po_nbr
   and ((is-return and pod_qty_chg <> 0) or ((not is-return)
   and  pod_status <> "c"
   and (pod_status <> "x" or (pod_status = "x" and git-stat))
   and (pod_qty_chg <> 0 or pod_bo_chg = 0)
   and ((not porec and pod_rma_type <> "I" and pod_rma_type <> "") or
        (porec and pod_rma_type <> "O"))
   and ((shipper_rec and pod_qty_chg <> 0 ) or not shipper_rec)
   and ((pod_sched and pod_qty_chg <> 0 ) or not pod_sched)) or
         using_supplier_consignment and ip_is_usage
   and (p_pod_line    = pod_line
        or p_pod_line = 0)))
break by pod_part:
   /* Include RTS logic in for each statement. So first-of  */

   /* If fiscal receiving or shipper confirm has not received the  */
   /*  pod_det then skip */
   if shipper_rec and  pod_qty_chg = 0 then next podloop.

   /* VALIDATE IF INVENTORY STOCK IS AVAILABLE FOR THE PO LINE */
   if not pod_consignment
      and pod_fsm_type = ""
      and pod_type     = ""
      and not shipper_rec
      and not (transtype = "RCT-PO"  and pod_qty_chg > 0)
      and not (transtype = "ISS-PRV" and pod_qty_chg < 0)
   then do: 
      for each b_srwkfl
         where b_srwkfl.sr_domain = global_domain
         and   b_srwkfl.sr_userid = SessionUniqueID
         and   b_srwkfl.sr_lineid = string(pod_line)
      no-lock:
         for first pt_mstr
            where pt_domain = global_domain
            and   pt_part   = pod_part
         no-lock:

            l_undo = no.
            {us/px/pxrun.i &PROC='getUMConversionToPOLine'
                     &PROGRAM='porcxr1.p'
                     &PARAM="(input  pod_rum,
                              buffer pod_det,
                              output l_um_conv,
                              output l_use_pod_um_conv)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
            }

            {us/px/pxrun.i &PROC='getReceiptUMConversion'
                     &PROGRAM='porcxr1.p'
                     &PARAM="(input pod_rum,
                              input l_um_conv,
                              buffer pt_mstr,
                              buffer pod_det,
                              output l_conv)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
            }

            {us/bbi/gprun.i ""icedit.p""
                      "(input transtype,
                        input b_srwkfl.sr_site,
                        input b_srwkfl.sr_loc,
                        input pod_part,
                        input b_srwkfl.sr_lotser,
                        input b_srwkfl.sr_ref,
                        input b_srwkfl.sr_qty * l_conv,
                        input pod_rum,
                        input pod_nbr,
                        input (if (b_srwkfl.sr_qty * l_conv) >= 0
                               then
                                  string(pod_line)
                               else
                                  """"),
                        output l_undo)" }
         end. /* FOR FIRST pt_mstr */
         if l_undo
         then do:
            /* UNABLE TO ISSUE OR RECEIVE <ITEM> <PO> <PO LINE> */
            {us/bbi/pxmsg.i &MSGNUM=1790 &ERRORLEVEL=1 &MSGARG1=pod_part
                            &MSGARG2=pod_nbr
                            &MSGARG3=pod_line}
            next podloop.
         end. /* IF l_undo */
      end. /* FOR EACH b_srwkfl */
   end. /* IF NOT pod_consignment */

   for first si_mstr
       where si_mstr.si_domain = global_domain
        and  si_site = pod_site
   no-lock: end.

   if available si_mstr and si_db = global_db then do:

      /* IF THIS IS A USAGE TRANSACTION, THEN DO NOT RECALC */
      /* THE UNIT COST. IT HAS BEEN CALCULATED ALREADY IN   */
      /* ictrancn.p AND STORED IN SHARED VARIABLE price.    */
      /* USAGE TRANSACTIONS ARE CREATED AS PART OF THE      */
      /* SUPPLIER CONSIGNMENT MODULE.                       */

      if ip_is_usage
      then
         price = ip_usage_price.
      else do:
         {us/px/pxrun.i &PROC = 'calculateUnitCost' &PROGRAM = 'porcxr1.p'
                  &HANDLE=ph_porcxr1
                  &PARAM="(buffer pod_det,
                           output price)"
                  &CATCHERROR = true
                  &NOAPPERROR = true}
         assign
            l_abs_um      = pod_um
            l_abs_um_conv = pod_um_conv.

         if shipper_rec
         then do:
            assign
               l_total_abs_qty    = 0
               l_total_abs_um_qty = 0
               l_ori_price        = price * pod_um_conv.               

            for each b_absmstr
               where b_absmstr.abs_domain                 = global_domain
               and   b_absmstr.abs_order                  = pod_nbr
               and   int(b_absmstr.abs_line)              = pod_line
               and   b_absmstr.abs_shipfrom               = po_vend
               and   substring(b_absmstr.abs_par_id,2,20) = shipnbr
            no-lock:
               l_total_abs_qty    = l_total_abs_qty
                  + (b_absmstr.abs_qty - b_absmstr.abs_ship_qty).
               if decimal(b_absmstr.abs__qad03) <> 0
               then
                  assign
                     l_abs_um           = if b_absmstr.abs__qad02 <> pod_um
                                          then
                                             b_absmstr.abs__qad02
                                          else
                                             l_abs_um
                     l_total_abs_um_qty = l_total_abs_um_qty
                        + ( (b_absmstr.abs_qty - b_absmstr.abs_ship_qty)
                             / decimal(b_absmstr.abs__qad03) ).
            end. /* FOR EACH b_absmstr */

            if l_total_abs_um_qty <> 0
            then             
               l_abs_um_conv = l_total_abs_qty / l_total_abs_um_qty.
            if l_abs_um_conv <> 0
            then
               price = l_ori_price / l_abs_um_conv.        
         end. /* IF shipper_rec */
      end. /* ELSE DO */
 
      /* tax_wkfl RECORDS ARE NOT CREATED FOR CONSIGNMENT USAGES */
      find first tax_wkfl where tax_nbr  = pod_nbr and
                                tax_line = pod_line
      no-lock no-error.

      if available tax_wkfl then
         price = tax_price / pod_um_conv.

      old_status = pod_status.

      if use-log-acctg 
         and git-stat 
      then do:
         for first prh_hist
            where prh_domain  = global_domain
            and   prh_vend    = po_vend
            and   prh_ps_nbr  = shipnbr
            and   prh_part    = pod_part
            and   prh_nbr     = pod_nbr
            and   prh_line    = pod_line
         no-lock:
            receivernbr = prh_receiver.
         end. /* FOR FIRST prh_hist */
      end. /* IF use-log-acctg AND git-stat */

      if (first-of(pod_part) and rcv_type = 2 and receivernbr = " ") or
         (rcv_type <> 2 and receivernbr = "" and poc_seq_rcv)
      then do:
         run getNextReceiverNbr (output receivernbr).
         if rcv_type <> 2 and fiscal_rec = no and
            poc_seq_rcv
         then do:
            tax_lines = 0.
            do on error undo, return error return-value:
               {us/bbi/gprun.i ""poporcx.p"" "( input tax_lines,
                                                input shipnbr,
                                                input p_int_ref_type)" }
            end.
         end.

      end.

      if rcv_type = 2 and fiscal_rec = no and not git-stat then do:
         tax_lines = pod_line.
         do on error undo, return error return-value:
            {us/bbi/gprun.i ""poporcx.p"" "( input tax_lines,
                                             input shipnbr,
                                             input p_int_ref_type)" }
         end.
      end.
      
      l_selectedReceiver = ?.

      for first tt_POReceiver
         where tt_rcv_pod_line = pod_line
      no-lock:
      end. /* FOR FIRST tt_POReceiver */
      if available tt_POReceiver
      then
         l_selectedReceiver = tt_sel_receiver.

/*c1171*       {us/bbi/gprun.i ""poporcb8.p"" */
/*c1171*/      {us/bbi/gprun.i ""xxporcb8.p""
         "(input recid(pod_det),
           input receivernbr,
           input ship_date,
           input shipnbr,
           input inv_mov,
           input i_shipto,
           input ip_is_usage,
           input ip_usage_qty,
           input ip_woiss_trnbr,
           input cRoundingDifferencesAccount,
           input shipper_rec,
           input p_int_ref_type,
           input l_abs_um,
           input l_abs_um_conv,
           input l_total_abs_um_qty,
           input l_selectedReceiver,
           input table tt_attr_pfvalue by-reference,
           input-output dataset dsSerialPicked by-reference,
           input p_shipnbr1,
           output op_rctpo_trnbr,
           output op_undo_lagit)"}

      pause 0.

      if undo_all then undo podloop, next podloop.
   end.  /* if available si_mstr and si_db = global_db */
   
   if last-of(pod_part) 
      and rcv_type = 2
      and not git-stat
   then
      assign
         l_last_receiver = receivernbr
         receivernbr     = "".

end.  /* for each pod_det */

for first poc_ctrl no-lock
   where poc_domain = global_domain:
end.

/* Copy tax to LD */
if poc_fiscal_confirm and issueld = yes
then do:
   {us/bbi/gprun.i ""poldtxcp.p"" "(input lgdkey)"}
end.

if rcv_type = 2 then
   receivernbr = l_last_receiver.
if ip_is_usage = no then do:
   /* Post the credit terms interest component of the item price */
   /* to a statiscal acccount for the PO receipt.                */
   {us/px/pxrun.i &PROC = 'closePOIfNeeded' &PROGRAM = 'porcxr.p'
            &HANDLE=ph_porcxr
            &PARAM = "(input  po_nbr)"
            &CATCHERROR = true
            &NOAPPERROR = true}
end. /* If ip_is_usage = no then do: */

/* IF KBTRANSNBR = 0, THEN THIS WAS NOT CALLED FROM THE KANBAN */
/* SYSTEM.  WHEN CALLED FROM THE KANBAN SYSTEM, DO NOT RUN     */
/* PORCSUBR.P AS THE SUBCONTRACT OPERATION HISTORY IS TRACKED  */
/* IN THE KANBAN TRANSACTION RECEIPT PROGRAM.                  */
if not auto_receipt and kbtransnbr = 0 then do:
   {us/bbi/gprun.i ""porcsubr.p"" }
end.

PROCEDURE getRoundingDifferencesAccount:

   define output parameter ocRoundingDifferencesAcct as character no-undo.

   do on error undo, throw:   
      /* Parameters: GLTypeCode, GLSystemTypeCode, DomainCode */
      GeneralLedger = new GLByGLTypeGLSystemType("SYSTEM","ROUND",global_domain).   
      catch anError as Progress.Lang.Error:        
         /* Start qflib.p - QAD Financials Library running persistently */
         run mfairunh.p
            (input 'qflib.p',
             input '?',
             output hQADFinancialsLib) no-error.
         run processExceptions in hQADFinancialsLib (input anError).  
         return.      
      end catch. 
   end. 
   if GeneralLedger:Available then do:
      ocRoundingDifferencesAcct = GeneralLedger:GLCode.
      delete object GeneralLedger.
   end.

END PROCEDURE.

PROCEDURE getNextReceiverNbr:
   define output parameter oReceiverNbr like prh_receiver no-undo.
   define buffer poc_ctrl for poc_ctrl.

   {us/mf/mfnctrlc.i "poc_ctrl.poc_domain = global_domain" "poc_ctrl.poc_domain"
   "prh_hist.prh_domain = global_domain"
      poc_ctrl
      poc_rcv_pre
      poc_rcv_nbr
      prh_hist
      prh_receiver
      oReceiverNbr}
END PROCEDURE.
