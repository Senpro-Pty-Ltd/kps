/* xxrqpobldc.p - Requisition To PO -- Order Header subroutine                */
/* rqpobldc.p - Requisition To PO -- Order Header subroutine                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqpobldc.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*                                                                            */
/* REVISION: 8.5      LAST MODIFIED: 03/29/95   BY: *F0PN* Doug Norton        */
/* REVISION: 8.5      LAST MODIFIED: 04/15/97   BY: *J1Q2* Patrick Rowan      */
/* REVISION: 8.5      LAST MODIFIED: 01/07/97   BY: *J29D* Jim Josey          */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/11/98   BY: *L040* Brenda Milton      */
/* REVISION: 9.1      LAST MODIFIED: 07/07/99   BY: *N00Y* Jyoti Thatte       */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Brian Compton      */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 09/04/00   BY: *N0RC* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 02/27/01   BY: *M12K* Rajesh Thomas      */
/* Revision: 1.5.1.6     BY: Katie Hilbert       DATE: 04/01/01  ECO: *P002*  */
/* Revision: 1.5.1.7     BY: Luke Pokic          DATE: 05/24/02  ECO: *P03Z*  */
/* Revision: 1.5.1.8     BY: Jean Miller         DATE: 06/06/02  ECO: *P080*  */
/* Revision: 1.5.1.9     BY: Robin McCarthy      DATE: 07/15/02  ECO: *P0BJ*  */
/* Revision: 1.5.1.10    BY: Ed van de Gevel     DATE: 02/24/03  ECO: *P0M7*  */
/* Revision: 1.5.1.12    BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L*  */
/* Revision: 1.5.1.13    BY: Katie Hilbert       DATE: 11/20/03  ECO: *N2N5*  */
/* Revision: 1.5.1.14    BY: Abhishek Jha        DATE: 04/23/04  ECO: *P1YG*  */
/* Revision: 1.5.1.15    BY: Changlin Zeng       DATE: 04/26/06  ECO: *R045*  */
/* Revision: 1.5.1.16    BY: Deirdre O'Brien     DATE: 07/11/07  ECO: *R0C6*  */
/* Revision: 1.5.1.17    BY: Vivek Kamath        DATE: 01/29/08  ECO: *Q1GG*  */
/* Revision: 1.5.1.19    BY: Ambrose Almeida     DATE: 09/08/08  ECO: *R13J*  */
/* Revision: 1.5.1.20    BY: Trupti Khairnar     DATE: 12/03/08  ECO: *Q215*  */
/* $Revision: 1.2 $ BY: Neil Curzon         DATE: 04/30/09  ECO: *R1HB*  */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*!
 ----------------------------------------------------------------------------
 DESCRIPTION: Populates purchase order header information.
              Supports the multi-line Purchase Requisition Module of MFG/PRO.

 Notes:
 1) Similar to popomtb.p; including ECO H0ND.
 2) This program is only called when the purchase order is being created.
============================================================================
!*/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}   /* EXTERNAL LABEL INCLUDE */
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/px/pxmaint.i}
{us/tx/txusgdef.i}   /* PRE-PROCESSOR CONSTANTS FOR I19 */

/* VARIABLES */
define variable i               as   integer                 no-undo.
define variable mc-error-number like msg_nbr                 no-undo.
define variable use-log-acctg   as   logical   no-undo.
define variable type-po         as   character format "x(2)" no-undo.
define variable con-yn          like mfc_logical.
define variable poc_pt_req      like mfc_logical.
define variable imp-okay        like mfc_logical             no-undo.
define variable use-category    as   character               no-undo.
define variable transit         like delt_transit            no-undo.
define variable is-valid        as   logical                 no-undo.
/*q9006*/ def shared var ss-site like si_site.

/* CONSTANTS */
{us/rq/rqconst.i}

/* SHARED VARIABLES */
{us/rq/rqpovars.i}

/* POPOMTB.P VARIABLES */
define new shared variable tax_nbr     like tx2d_nbr initial "".
define new shared variable tax_tr_type like tx2d_tr_type initial "20".
define new shared variable undo_all    like mfc_logical.

define shared variable rndmthd     like rnd_rnd_mthd.
define shared variable line        like pod_line.
define shared variable due_date    like pod_due_date.
define shared variable del-yn      like mfc_logical.
define shared variable qty_ord     like pod_qty_ord.
define shared variable so_job      like pod_so_job.
define shared variable disc        like pod_disc label "Ln Disc".
define shared variable po_recno    as recid.
define shared variable ponbr       like po_nbr.
define shared variable old_po_stat like po_stat.
define shared variable line_opened as logical.
define shared variable old_rev     like po_rev.
define shared variable pocmmts     like mfc_logical label "Comments".
define shared variable new_po      like mfc_logical.
define shared variable new_db      like si_db.
define shared variable old_db      like si_db.
define shared variable new_site    like si_site.
define shared variable old_site    like si_site.
define shared variable continue    like mfc_logical no-undo.
define shared variable pocrt_int   like pod_crt_int.
define shared variable impexp      like mfc_logical no-undo.

define shared frame b.
define shared frame vend.
define shared frame ship_to.

/* PARAMETERS */
define input-output parameter p_l_taxflag like mfc_logical no-undo.
define input parameter p_override_remarks like mfc_logical no-undo.

{us/gp/gptxcdec.i}  /* DECLARATIONS FOR gptxcval.i */
{us/po/popomt02.i}  /* Shared frames a and b */

/* TAX MANAGEMENT FORM */
form
   po_tax_usage colon 25
   po_tax_env   colon 25
   space(1)
   po_taxc      colon 25
   po_taxable   colon 25
   po_tax_in    colon 25
with frame set_tax row 8 centered overlay side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame set_tax:handle).

form
   impexp colon 15 label "Imp/Exp"
with frame set_impexp row 14 centered overlay side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame set_impexp:handle).

{us/mf/mfadform.i "vend" 1 SUPPLIER}
{us/mf/mfadform.i "ship_to" 41 SHIP_TO}

/* VALIDATE IF LOGISTICS ACCOUNTING IS TURNED ON */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

find rqpo_wrk exclusive-lock where recid(rqpo_wrk) = rqpo_recno.
find po_mstr exclusive-lock where recid(po_mstr) = po_recno.

find vd_mstr where vd_domain = global_domain and vd_addr = po_vend
no-lock no-error.

find first poc_ctrl where poc_domain = global_domain no-lock.
find first iec_ctrl where iec_domain = global_domain no-lock no-error.

/* COPY REQUISITION FROM REMOTE DB TO TEMP-TABLE */
/*d2101* start deleted code  >>>>>>>>>
{us/bbi/gprun.i ""rqpobldf.p""
   "(input true,
     input rqpo_site)"}
*d2101* end   deleted code  <<<<<<<<<<<<<<< */

/*q9006* start added code */
{us/bbi/gprun.i ""rqpobldf.p""
   "(input true,
     input ss-site)"}
/*q9006* end added code */

find first wkrqm_mstr where wkrqm_nbr = rqpo_nbr exclusive-lock no-error.

/* IF SUPPLIER = SUPPLIER ON THE REQUISITION */
if po_vend = rqpo_supplier then do:

   /* USE REQUISITION INFO FOR DEFAULT */
   assign
      po_disc_pct   = wkrqm_disc_pct
      po_rmks       = wkrqm_rmks
      po_curr       = wkrqm_curr
      po_pr_list    = wkrqm_pr_list
      po_pr_list2   = wkrqm_pr_list2
      po_fix_rate   = wkrqm_fix_rate
      po_lang       = if wkrqm_lang = "" then vd_lang else wkrqm_lang.

   /* IS TERMINAL OPERATOR A BUYER? */
   if can-find (rqr_mstr where
      rqr_domain = global_domain and
      rqr_userid = global_userid and
      rqr_role   = BUYER)
   then
      po_buyer   = global_userid.
   else
      po_buyer   = wkrqm_buyer.
end.  /* if po_vend = rqpo_vend */

else do:
   /* USE VENDOR INFO FOR DEFAULT */
   assign
      po_disc_pct   = vd_disc_pct
      po_rmks       = if p_override_remarks 
                      then
                         vd_rmks
                      else
                         wkrqm_rmks
      po_curr       = vd_curr
      po_pr_list    = vd_pr_list
      po_pr_list2   = vd_pr_list2
      po_lang       = vd_lang.

   /* IS TERMINAL OPERATOR A BUYER? */
   if can-find (rqr_mstr where
      rqr_domain = global_domain and
      rqr_userid = global_userid and
      rqr_role   = BUYER)
   then
      po_buyer   = global_userid.
   else
      po_buyer   = vd_buyer.
end.  /* if po_vend <> rqpo_vend */

/* USE VENDOR INFO TO INITIALIZE FIELDS NOT FOUND ON REQUISITION */
assign
   po_cr_terms       = vd_cr_terms
   po_contact        = vd_pur_cntct
   po_shipvia        = vd_shipvia
   po_taxable        = vd_taxable
   po_tot_terms_code = vd_tot_terms_code
   po_fix_pr         = vd_fix_pr.

/* OBTAIN INTEREST % FROM CREDIT TERMS MASTER */
if po_cr_terms <> "" then do:
   find first ct_mstr where ct_domain = global_domain
      and ct_code = po_cr_terms
   no-lock no-error.
   if available ct_mstr then
      pocrt_int = ct_terms_int.
end.

/* LOAD DEFAULT TAX CLASS AND USAGE */
if available vd_mstr then
   assign
      po_taxable   = vd_taxable
      po_tax_usage = vd_tax_usage
      po_taxc      = vd_taxc
      po_tax_in    = vd_tax_in.

impexp = no.

/* SET THE DEFAULT VALUE BASED ON IEC_CTRL FILE */
if available iec_ctrl and iec_impexp = yes then impexp = yes.

assign
   po_due_date   = wkrqm_due_date
   so_job        = wkrqm_job
   po_site       = wkrqm_site
   po_daybookset = wkrqm_daybookset
   po_project    = wkrqm_project
   po_req_id     = wkrqm_rqby_userid.

/* SITE VALIDATION */
{us/bbi/gprun.i ""gpsiver.p""
         "(po_site, input ?, output return_int)"}
if return_int = 0 then do:
   /* USER DOES NOT HAVE ACCESS TO THIS SITE */
   {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3 }
   continue = no.
end.

/* EXCHANGE RATE VALIDATION */
undo_all = yes.
po_recno = recid(po_mstr).
{us/bbi/gprun.i ""rqpomtb1.p""}
if undo_all then
   continue = no.

/* DETERMINE ROUNDING METHOD FROM DOCUMENT CURRENCY OR BASE    */

/* GET ROUNDING METHOD FROM CURRENCY MASTER */
{us/gp/gprunp.i "mcpl"
          "p"
          "mc-get-rnd-mthd"
          "(input po_curr, output rndmthd, output mc-error-number)"}
if mc-error-number <> 0 then do:
   {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3 }
   pause 0.
   continue = no.
end.

po_pst = no.

ststatus = stline[1].
status input ststatus.

set_tax:
do on error undo, retry on endkey undo set_tax, leave:

   if po_tax_env = ""
   then do:
      {us/px/pxrun.i &PROC='getTaxEnvironment' &PROGRAM='popoxr.p'
               &PARAM="(input  po_vend,
                        input  po_site,
                        input  po_ship,
                        input  po_taxc,
                        output po_tax_env)"}
   end. /* IF po_tax_env = "" */

   update
      po_tax_usage
      po_tax_env
      po_taxc
      po_taxable
      po_tax_in
   with frame set_tax.

   p_l_taxflag = yes.

   /* VALIDATE TAX USAGE */
   {us/px/pxrun.i &PROC       = 'validateTaxUsage' &PROGRAM='txenvxr.p'
                  &PARAM      = "(input po_tax_usage)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}

   if return-value <> {&SUCCESS-RESULT} then do:
      next-prompt po_tax_usage with frame set_tax.
      undo, retry  set_tax.
   end.

   /* VALIDATE TAX ENVIRONMENT */
   {us/px/pxrun.i &PROC       = 'validateTaxEnvironment' &PROGRAM='txenvxr.p'
                  &PARAM      = "(input po_tax_env)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}

   if return-value <> {&SUCCESS-RESULT} then do:
      next-prompt po_tax_env with frame set_tax.
      undo, retry set_tax.
   end.

   /* I19 Tax Usage Validation */
   {us/bbi/gprun.i ""txusgval.p""
      "(input  "{&TU_PO_MSTR}",
        input  oid_po_mstr,
        input  po_tax_usage,
        output is-valid)"}

   if not is-valid then do:
      next-prompt po_tax_usage with frame set_tax.
      undo, retry set_tax.
   end.
end.  /* SET_TAX */

hide frame set_tax.

if p_l_taxflag = no then
   undo, leave.

/* UPDATE ORDER HEADER TERMS INTEREST PERCENTAGE */
if pocrt_int <> 0 and po_cr_terms <> "" then do:

   find ct_mstr where ct_domain = global_domain
                  and ct_code = po_cr_terms
   no-lock no-error.

   if available ct_mstr and pocrt_int <> 0 then do:

      if pocrt_int <> ct_terms_int then do:

         /* Entered terms interest # does not match ct interest # */
         {us/bbi/pxmsg.i &MSGNUM=6212 &ERRORLEVEL=2
                  &MSGARG1=pocrt_int
                  &MSGARG2=ct_terms_int}
         con-yn = yes.

         /* Do you wish to continue? */
         {us/bbi/pxmsg.i &MSGNUM=7734 &ERRORLEVEL=2 &CONFIRM=con-yn}
         if not con-yn then do:
            next-prompt pocrt_int.
            undo, retry.
         end.

      end.

   end.

end.

/* VALIDATE IF LOGISTICS ACCOUNTING IS TURNED ON */
{us/bbi/gprun.i ""lactrl.p""
         "(output use-log-acctg)"}

if use-log-acctg
then do:

   for first tot_mstr
      fields (tot_domain tot_terms_code tot_transport_resp)
      where tot_domain = global_domain
        and tot_terms_code = po_tot_terms_code
   no-lock: end.

   if available tot_mstr and
      tot_transport_resp = "02" or po_site = ""
   then
      po_translt_days = 0.

   else do:

      for first ad_mstr where ad_domain = global_domain
         and ad_addr = po_vend
      no-lock: end.

      if not available ad_mstr then leave.

      use-category = "01".
      {us/bbi/gprun.i ""addelt.p""
         "(input po_site,
           input ad_ctry,
           input ad_state,
           input ad_city,
           input use-category,
           output transit)"}

      if transit <> 0 then
          po_translt_days = transit.
      else
         po_translt_days = 0.

   end.

   type-po = {&TYPE_PO}.

   {us/gp/gprunmo.i &module = "LA"
              &program = "laisupp.p"
              &param  = """(input po_nbr,
                           input type-po,
                           input po_vend,
                           input no)"""}

end.

if impexp
then do:
   /* CHECK IF COUNTRIES OF PURCHASING SITE AND SUPPLIER ARE EC MEMBERS */
   {us/bbi/gprun.i ""ieckcty2.p""
      "(input  po_vend,
        input  po_ship,
        input  '2',
        output impexp)"}
   update
      impexp
   with frame set_impexp.
   hide frame set_impexp.
end. /* IF impexp THEN DO ... */

if impexp then do:
   hide frame b.
   imp-okay = no.
   {us/bbi/gprun.i ""iemstrcr.p""
            "(input ""2"",
            input po_nbr,
            input recid(po_mstr),
            input-output imp-okay )"}
   if imp-okay = no then
      continue = no.
end.

/* COPY REQ HEADER COMMENTS, IF THEY EXIST & ARE FLAGGED */
if include_hcmmts and wkrqm_cmtindx <> 0 then do:

   /* INITIALIZE COUNTER */
   i = -1.

   /* COPY COMMENTS FROM WORKFILE */
   for each wkcmt_det
      where wkcmt_det.wkcmt_indx = wkrqm_cmtindx
   no-lock:

      create cmt_det.
      cmt_det.cmt_domain = global_domain.
      if i = -1 then do:
         assign cmt_det.cmt_seq = wkcmt_det.wkcmt_seq.
         {us/mf/mfrnseq.i cmt_det
                    cmt_det.cmt_indx
                    cmt_sq01}
         po_cmtindx = cmt_det.cmt_indx.
      end.

      assign
         cmt_det.cmt_indx  = po_cmtindx
         cmt_det.cmt_seq   = wkcmt_det.wkcmt_seq
         cmt_det.cmt_ref   = wkcmt_det.wkcmt_ref
         cmt_det.cmt_type  = wkcmt_det.wkcmt_type
         cmt_det.cmt_print = wkcmt_det.wkcmt_print
         cmt_det.cmt_lang  = wkcmt_det.wkcmt_lang .

      do i = 1 to 15:
         cmt_det.cmt_cmmt[i] = wkcmt_det.wkcmt_cmmt[i].
      end.

      i = 1.

   end.  /* for each cmt_det where cmt_indx = wkrqm_cmtindx */

end.  /* if wkrqm_cmtindx <> 0 */
else
   po_cmtindx = 0.

/* WRITE HISTORY RECORD IN DB OF REQUISITION */
assign
   old_db   = global_db
   new_site = po_site.

if po_site <> "" then do:
   {us/bbi/gprun.i ""gpalias.p""}
end.

{us/bbi/gprun.i ""rqwrthst.p""
         "(input rqpo_nbr,
         input 0,
         input ACTION_CREATE_PO,
         input global_userid,
         input '',
         input '')"}

new_db = old_db.
{us/bbi/gprun.i ""gpaliasd.p""}

/* RETURN */
