/* xxrqpobldb.p - Requisition To Purchase Order Build Sub-Program             */
/* rqpobldb.p - Requisition To Purchase Order Build Sub-Program               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqpobldb.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*                                                                            */
/* REVISION: 8.5      LAST MODIFIED: 03/29/95   BY: *F0PN* Doug Norton        */
/* REVISION: 8.5      LAST MODIFIED: 04/15/97   BY: *J1Q2* Patrick Rowan      */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/11/98   BY: *L040* Brenda Milton      */
/* REVISION: 8.6E     LAST MODIFIED: 07/05/99   BY: *J3HN* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 08/02/99   BY: *N014* Robin McCarthy     */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 09/04/00   BY: *N0RC* Mark Brown         */
/* Revision: 1.5.1.5     BY: Katie Hilbert         DATE: 04/01/01 ECO: *P002* */
/* Revision: 1.5.1.6     BY: Tiziana Giustozzi     DATE: 07/03/01 ECO: *N104* */
/* Revision: 1.5.1.7     BY: Steve Nugent          DATE: 05/24/02 ECO: *P018* */
/* Revision: 1.5.1.8     BY: Dan herman            DATE: 06/06/02 ECO: *P07Y* */
/* Revision: 1.5.1.11    BY: Tiziana Giustozzi     DATE: 07/24/02 ECO: *P09N* */
/* Revision: 1.5.1.13    BY: Paul Donnelly (SB)    DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.5.1.14    BY: Rajinder Kamra        DATE: 05/12/03 ECO: *Q003* */
/* Revision: 1.5.1.16    BY: Shoma Salgaonkar      DATE: 03/03/04 ECO: *P1RD* */
/* Revision: 1.5.1.17    BY: Abhishek Jha          DATE: 04/23/04 ECO: *P1YG* */
/* Revision: 1.5.1.19    BY: Robin McCarthy        DATE: 08/11/05 ECO: *P2PJ* */
/* Revision: 1.5.1.20    BY: Andrew Dedman         DATE: 10/13/05 ECO: *R01P* */
/* Revision: 1.5.1.21    BY: Priya Idnani          DATE: 10/24/05 ECO: *P44H* */
/* Revision: 1.5.1.24    BY: Shilpa Kamath         DATE: 01/16/06 ECO: *R036* */
/* Revision: 1.5.1.25    BY: Robin McCarthy        DATE: 01/16/06 ECO: *P4JX* */
/* Revision: 1.5.1.26    BY: Ken Casey             DATE: 04/11/07 ECO: *R0C6* */
/* Revision: 1.5.1.27    BY: Neil Curzon           DATE: 04/30/09 ECO: *R1HB* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB     LAST MODIFIED: 11-Jun-2010              BY: gbg *c1171*            */
/* CYB     LAST MODIFIED: 14-FEB-2011              BY: gbg *c1206*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*CYB  LAST MODIFIED: 2014-FEB-14     BY: gbg *c1456*                   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*!
 * ----------------------------------------------------------------------------
 * DESCRIPTION: Display front-end screen before copy-to-po process.
 *              Supports the multi-line Purchase Requisition Module of MFG/PRO.
 *
 * Notes:
 * 1) A temp-table is used to hold the requisition lines.  All lines that are
 *    to be copied to the new PO have been flagged.  This program calls the
 *    routine that performs the copy function.
 * 2) This program is a clone of pomt.p, release 85 upto and including
 *    patch J1RQ.
 * The code has been stripped of obsolete code.
 * ============================================================================
!*/

{us/bbi/mfdeclre.i }
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}

/* DEFINE HANDLE FOR PROGRAM */
{us/px/pxphdef.i ieiexr}
{us/px/pxphdef.i adcrxr}

{us/po/pocurvar.i "NEW"}
{us/tx/txcurvar.i "NEW"}
{us/po/potrldef.i "NEW"}
{us/tx/txcalvar.i}

{us/gp/gpnbrgen.i}  /* INCLUDE 'getnbr' */
{us/gp/gpnrseq.i}   /* INCLUDE 'chk_internal' */

/* PARAMETERS */
define input parameter p_override_remarks like mfc_logical no-undo.

/* POPOMT.P VARIABLES*/
define new shared variable blanket like mfc_logical initial 'no'.

/*c1456* start added code */
   define var vtrig as logical.
   define var vMessageTrig as char.
/*c1456* end   added code */

/* POMT.P VARIABLES*/
define new shared variable rndmthd like rnd_rnd_mthd.
define new shared variable oldcurr like po_curr.
define new shared variable line like pod_line.
define new shared variable due_date like pod_due_date.
define new shared variable del-yn like mfc_logical.
define new shared variable qty_ord like pod_qty_ord.
define new shared variable so_job like pod_so_job.
define new shared variable sngl_ln like poc_ln_fmt.
define new shared variable disc like pod_disc label "Ln Disc".
define new shared variable po_recno as recid.
define new shared variable vd_recno as recid.
define new shared variable yn like mfc_logical initial yes.
define new shared variable ponbr like po_nbr.
define new shared variable old_po_stat like po_stat.
define new shared variable line_opened as logical.
define new shared variable old_rev like po_rev.
define new shared variable pocmmts like mfc_logical
   label "Comments".
define new shared variable cmtindx as integer.
define new shared variable base_amt like pod_pur_cost.
define new shared variable comment_type like po_lang.
define new shared variable new_po like mfc_logical.
define new shared variable continue like mfc_logical no-undo.

define new shared frame b.
define new shared frame vend.
define new shared frame ship_to.
define new shared frame bill_to.
define new shared variable tax_recno as recid.
define new shared variable pocrt_int like pod_crt_int.
define new shared variable impexp      like mfc_logical no-undo.

define variable old_vend like po_vend.
define variable old_ship like po_ship.
define variable zone_to    like txe_zone_to.
define variable zone_from  like txe_zone_from.

define variable impexp_edit like mfc_logical no-undo.
define variable upd_okay    like mfc_logical no-undo.
define variable mc-error-number like msg_nbr no-undo.
define variable l_tax_tr_type like tx2d_tr_type initial "20" no-undo.
define variable l_tax_nbr     like tx2d_nbr     initial ""   no-undo.
define variable l_tax_lines   like tx2d_line    initial 0    no-undo.

/* LOGICALS */
define variable blank_suppliers        like mfc_logical            no-undo
   label "Blank Suppliers Only".
define variable default_copy           like mfc_logical            no-undo
   label "Default Copy".
define variable c-supplier-consignment as character                no-undo.
define variable use-log-acctg          as logical                  no-undo.
define variable ref-type               like lacd_internal_ref_type no-undo.
define variable l_taxflag              like mfc_logical            no-undo.
define variable hBlockedTransactionlibrary as handle               no-undo.

/* COUNTERS */
define variable rqcd_det_cntr as integer no-undo.

/*c1206a*  start added code */
def var childdomain as char.
def var parentdomain as char.
/*c1206a*  end   added code */

/* SHARED VARIABLES*/
{us/rq/rqpovars.i}
{us/ap/apconsdf.i}

{us/po/pocnvars.i} /* Variables for consignment inventory */
{us/po/pocnpo.i}  /* Consignment procedures and frames */

/* USE SEQ ID TO GENERATE PO NBR */
define variable l_errorst    as   logical            no-undo.
define variable l_ponrm      as   character          no-undo.
define variable l_errornum   as   integer            no-undo.
define variable l_use_nrmseq as   logical initial no no-undo.
define variable l_internal   as   logical            no-undo.
 
define temp-table tt_nrm no-undo
   field tt_dataset as character
   field tt_seqid   as character
   field tt_nbrtype as character
index idx_seqid_pk is unique primary tt_seqid.

/*  FRAME A: SELECTION FORM */
form
   space(1)
   po_nbr label "Order"
   po_vend
   po_ship
   po_bill
   with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
   po_ord_date    colon 14
   po_pr_list2    colon 35
   po_confirm     colon 58
   impexp         colon 73 label "Imp/Exp"
   po_due_date    colon 14
   po_pr_list     colon 35
   po_curr        colon 58 po_lang
   po_buyer       colon 14
   disc           colon 35
   po_taxable     colon 58
   po_taxc                 no-label
   po_tax_date    to    77 no-label
   po_bill        colon 14
   po_site        colon 35
   po_fix_pr      colon 58
   po_consignment     colon 73 label "Consign"
   so_job         colon 14
   po_daybookset  colon 35
   po_cr_terms    colon 58
   po_crt_int     no-label
   po_contract    colon 14
   po_project     colon 42
   po_user_id     colon 68
   po_contact     colon 14
   po_req_id      colon 58
   po_rmks        colon 14
   pocmmts        colon 68
with frame b side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).
{us/mf/mfadform.i "vend" 1 SUPPLIER}
{us/mf/mfadform.i "ship_to" 41 SHIP_TO}
{us/mf/mfadform.i "bill_to" 41 BILL_TO}

 
form
   tt_seqid label "Sequence ID"
with frame frame_seqid side-labels overlay row 2 columns 12.
 
setFrameLabels(frame frame_seqid:handle).

run initialize-variables.

/*c1206*/ def var defship as char.
/*c1206*/ defship = ?.

/*c1206a*/ childdomain = global_domain.
/*c1206a*/ parentdomain = global_domain.
/*c1206*/ def buffer b1dom for dom_mstr.
/*c1206*/ def buffer b2dom for dom_mstr.
/*c1206*/ find first b1dom no-lock
/*c1206*/ where b1dom.dom_domain = global_domain
/*c1206*/ no-error.
/*c1206*/ if available b1dom
/*c1206*/ then do:
/*c1206*/     find first b2dom no-lock
/*c1206*/     where b2dom.dom_domain =b1dom.dom_user1
/*c1206*/     no-error.
/*c1206*/     if available b2dom 
/*c1206*/     then do:
/*c1206a*/         childdomain = b1dom.dom_user1.
/*c1206*/          find first poc_ctrl
/*c1206*/          where poc_domain = b1dom.dom_user1 no-lock.
/*c1206*/          if available poc_ctrl then defship = poc_ship.
/*c1206*/     end.
/*c1206*/ end.
/*c1206*/


/* start blocked transaction library to run persistently */
run mfairunh.p
   (input "mgbltrpl.p",
    input  ?,
    output hBlockedTransactionlibrary).

{us/mg/mgbltrpl.i "hBlockedTransactionlibrary"}

/* DETERMINE IF SUPPLIER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ENABLE_SUPPLIER_CONSIGNMENT,
      input 11,
      input ADG,
      input SUPPLIER_CONSIGN_CTRL_TABLE,
      output using_supplier_consignment)"}

c-supplier-consignment = getTermLabel("SUPPLIER_CONSIGNEMT", 30).

/* VALIDATE IF LOGISTICS ACCOUNTING IS TURNED ON */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

mainloop:
repeat on endkey undo, leave:

   assign
      so_job       = ""
      disc         = 0
      comment_type = global_type.

   for each rqpo_wrk
   where    rqpo_copy_to_po
   no-lock:
      for first rqd_det
      where rqd_domain = global_domain
      and   rqd_nbr    = rqpo_nbr
      and   rqd_line   = rqpo_line
      no-lock:
         if rqd_pur_cost = ?
         then do:
            /* REQUISTION UNIT COST IS QUESTION MARK FOR #. PLEASE MODIFY */
            {us/bbi/pxmsg.i &MSGNUM=20004 &ERRORLEVEL=4 &MSGARG1= rqd_nbr}
            if not batchrun
            then
               undo mainloop, retry .
            else
               undo mainloop, return error .
         end. /*IF rqd_pur_cost = ? */
      end. /*FOR FIRST rqd_det*/
   end. /*FOR EACH rqpo_wrk */

   assign
      /* CHECK IS ANY NRM SEQUENCES DEFINED FOR NUMBERING */
      l_use_nrmseq = can-find(first nr_mstr
                                where nr_domain       = global_domain
                                and   nr_dataset begins "po_nbr."
                                and   nr_effdate     <= today
                                and  (nr_exp_date     = ?
                                      or nr_exp_date >=today))

      l_ponrm = "".
   
   /* TRANSACTION TO GET PURCHASE ORDER */
   do transaction on error undo, retry:

      view frame a.
      view frame vend.
      hide frame bill_to no-pause.
      view frame ship_to.

      prompt-for po_nbr with frame a
         editing:

         /* Allow last PO number refresh */
         if keyfunction(lastkey) = "RECALL" or lastkey = 307
            then display ponbr @ po_nbr with frame a.

         /* FIND NEXT/PREVIOUS RECORD */
         /* Do not scroll thru RTS for PO or PO for RTS */
         {us/mf/mfnp06.i
            po_mstr
            po_nbr
            " po_mstr.po_domain = global_domain and po_type  <> ""B"" and
            po_fsm_type = """""
            po_nbr
            "input po_nbr"
            yes
            yes }

         /* WHEN THE PURCHASE ORDER IS FOUND, THEN DISPLAY */
         if recno <> ? then do:
            assign
               disc = po_disc_pct
               pocrt_int = 0.

            /* CREDIT TERMS */
            {us/px/pxrun.i &PROC='getCreditTermsInterest' &PROGRAM='adcrxr.p'
               &HANDLE=ph_adcrxr
               &PARAM="(input po_cr_terms,
                        output pocrt_int)"}

            {us/mf/mfaddisp.i po_vend vend}
            {us/mf/mfaddisp.i po_ship ship_to}

            display
               po_nbr
               po_vend
               po_ship
            with frame a.

         end.  /* IF RECNO <> ? */

      end. /* PROMPT-FOR...EDITING */

      find po_mstr where po_domain = global_domain and
         po_nbr = input po_nbr
      no-lock no-error.

      if available po_mstr then do:

         if po_fsm_type <> "" then do:
            /* CAN NOT PROCESS RTS ORDERS WITH PO PROGRAMS. */
            {us/bbi/pxmsg.i &MSGNUM=7364 &ERRORLEVEL=3}
            next-prompt po_nbr with frame a.
            undo, retry.
         end.  /* if po_fsm_type <> "" */

         if po_stat = "c" then do:
            {us/bbi/pxmsg.i &MSGNUM=326 &ERRORLEVEL=3}  /* PURCHASE ORDER CLOSED */
            next-prompt po_nbr with frame a.
            undo, retry.
         end.

         if po_stat = "x" then do:
            {us/bbi/pxmsg.i &MSGNUM=395 &ERRORLEVEL=3}  /* PURCHASE ORDER CANCELLED */
            next-prompt po_nbr with frame a.
            undo, retry.
         end.

         if blockedSupplier(input po_vend,
                            input {&PO002},
                            input true,
                            input "Supplier")
         then do:
            undo, retry.
         end.

         find first pod_det where pod_domain = global_domain and
            pod_nbr = po_nbr
         no-lock no-error.

         if po_type = "B" then do:
            {us/bbi/pxmsg.i &MSGNUM=385 &ERRORLEVEL=3}  /* BLANKET ORDER NOT ALLOWED */
            next-prompt po_nbr with frame a.
            undo, retry.
         end.

         if po_sched then do:
            /* ORDER WAS CREATED BY SCHEDULED ORDER MAINTENANCE */
            {us/bbi/pxmsg.i &MSGNUM=8210 &ERRORLEVEL=3}
            next-prompt po_nbr with frame a.
            undo, retry.
         end.

         /* VERIFY ACCESS TO SITE DATA */
         {us/bbi/gprun.i ""gpsiver.p""
                  "(input po_site, input ?, output return_int)"}
         if return_int = 0 then do:
            /* USER DOES NOT HAVE ACCESS TO SITE */
            {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
            next-prompt po_nbr with frame a.
            undo, retry.
         end.

      end.  /* if available po_mstr */

      if input po_nbr <> "" then ponbr = input po_nbr.

      /* GET NEXT GENERATED PO NUMBER FROM CONTROL FILE */
      if input po_nbr = ""
      then do:

         /* IDENTIFY PO TYPE USING NRM */
         if l_use_nrmseq
         then do:
 
            /* FILL TEMP TABLE FOR DISPLAY */
            empty temp-table tt_nrm no-error.
 
            for each nr_mstr
               where nr_domain      = global_domain
               and nr_dataset begins "po_nbr."
               and nr_effdate      <= today
               and (nr_exp_date     = ? 
                    or nr_exp_date >= today)
            no-lock:
 
               if can-find (first lngd_det
                            where lngd_dataset = "po_seq_id"
                            and   lngd_field   = "seq_type"
                            and   lngd_lang    = global_user_lang
                            and   lngd_key2    = substring(nr_dataset,8))
               then do:
 
                  create tt_nrm.
                  assign
                     tt_dataset = nr_dataset
                     tt_seqid   = nr_seqid
                     tt_nbrtype = substring(nr_dataset,8).

                  if recid(tt_nrm) = -1 then.
 
               end. /* IF CAN-FIND (FIRST lngd_det */
 
            end. /* FOR EACH nr_mstr */
 
            /* DISPLAY EMPTY AS DEFAULT SEQ ID */
            display
               "" @ tt_seqid
            with frame frame_seqid.
 
         end. /* IF use_nrmseq */
 
         /* SET THE SEQ ID AND RETURN THE VALUE */
         settype:
         do on error undo, retry
            on endkey undo mainloop, retry mainloop:
 
            if l_use_nrmseq
            then do:

               prompt-for tt_seqid 
                  with frame frame_seqid
               editing:

                  {us/mf/mfnp05.i tt_nrm idx_seqid_pk
                     " true "
                     tt_seqid
                     " input tt_seqid"}

                  if recno <> ?
                  then do:
                     display
                        tt_seqid
                     with frame frame_seqid.
                  end. /* IF recno <> ? */
               end. /* EDITING */ 

               for first tt_nrm
                  where tt_seqid = input tt_seqid
               no-lock:
               end. /* FOR FIRST tt_nrm */

               if not available tt_nrm 
                  and input tt_seqid <> ""
               then do:
                  /* INVALID SEQUENCE */
                  {us/bbi/pxmsg.i &MSGNUM=2818 &ERRORLEVEL=3}
                  next-prompt tt_seqid.
                  undo settype, retry.
               end. /* IF NOT AVAILABLE tt_nrm */

               if available tt_nrm
                  and tt_seqid <> ""
               then
                  l_ponrm = tt_nbrtype.

            end. /* if l_use_nrmseq */
 
            GetPoNbr:
            repeat:
               assign
                  l_internal = no
                  l_errorst  = no
                  ponbr      = "".
               if available tt_nrm 
                  and tt_seqid <> ""
                  and l_use_nrmseq
               then do: 
                  /* CHECK WHETHER GIVEN SEQUENCE IS INTERNAL */
                  run chk_internal
                     (input  tt_seqid,
                      output l_internal,
                      output l_errorst,
                      output l_errornum).

                  if l_internal
                     and not l_errorst
                  then
                     run getnbr
                         (input tt_seqid,
                          input today,
                          output ponbr,
                          output l_errorst,
                          output l_errornum). 
               end. /* IF AVAILABLE tt_nrm */
 
               else do:
                  {us/mf/mfnctrlc.i "poc_ctrl.poc_domain = global_domain"
                  "poc_ctrl.poc_domain" "po_mstr.po_domain = global_domain"
                     poc_ctrl
                     poc_po_pre
                     poc_po_nbr
                     po_mstr
                     po_nbr
                     ponbr}
               end. /* ELSE DO */
 
               if not can-find(first po_mstr
                                  where po_domain = global_domain
                                  and   po_nbr    = ponbr)
               then
                  leave GetPoNbr.
 
            end. /* GetPoNbr */
            
            /* DISPLAY ERROR IF PO NUM USING SEQUENCE NOT GENERATED */
            if l_errorst
            then do:
               {us/bbi/pxmsg.i &MSGNUM=l_errornum &ERRORLEVEL=3}
               undo, retry settype. 
            end. /* IF l_errorst */
 
            /* PO NUMBER LENGTH IS 8 */
            if length(ponbr) > 8
            then do:
               /* LENGTH OF PURCHASE ORDER NUMBER */
               /* MAY NOT EXCEED 8 CHARACTERS     */
               {us/bbi/pxmsg.i &MSGNUM=14466 &ERRORLEVEL=3}
               undo, retry settype.
            end. /* IF LENGTH(ponbr) > 8 */
         end. /* SETTYPE */ 
      end. /* IF INPUT po_nbr = "" */
   end.  /* TRANSACTION TO GET PURCHASE ORDER */

   /* TRANSACTION TO GET SUPPLIER & SHIP-TO */
   do transaction on error undo, retry with frame a:

      find first poc_ctrl where poc_domain = global_domain no-lock.

      if not available poc_ctrl then do:
         create poc_ctrl.
         poc_ctrl.poc_domain = global_domain.
      end.

      pocmmts = poc_hcmmts.

      find po_mstr where po_domain = global_domain and po_nbr = ponbr
      exclusive-lock no-error.

      if not available po_mstr then do:

         clear frame vend.
         clear frame ship_to.
         clear frame bill_to.

         new_po = yes.

         {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}
         create po_mstr.
         po_mstr.po_domain = global_domain.

         run initialize_po_mstr.

         po_bill = poc_bill.
         {us/mf/mfaddisp.i po_bill bill_to}
         hide frame bill_to no-pause.

         /* POPULATE SCREEN WITH REQUISITION DATA */
         find first rqpo_wrk where rqpo_copy_to_po no-lock no-error.
         if available(rqpo_wrk) then do:

            rqpo_recno = recid(rqpo_wrk).

            /* OBTAIN SHIP-TO FROM 1ST REQUISITION LINE SELECTED */
            po_ship = rqpo_ship.
/*c1206*/   if defship <> ? then po_ship = defship.
/*c1206*/   po_ship = if available poc_ctrl then poc_ship else
                      if defship <> ? then defship else
		      rqpo_ship.
/*c1206a*/  if available poc_ctrl then po_ship = poc_ship.
/*c1206a*/  if defship  <> ? then po_ship = defship.
/*c1206a*/  if rqpo_ship <> ? and rqpo_ship <> "" then po_ship = rqpo_ship.
            {us/mf/mfaddisp.i po_ship ship_to}

            /* OBTAIN SUPPLIER FROM 1ST REQUISITION LINE SELECTED */
            po_vend = rqpo_supplier.
            {us/mf/mfaddisp.i po_vend vend}

         end.  /* if available(rqpo_wrk) */

      end.  /* IF NOT AVAILABLE PO_MSTR */

      else do:

         /* I.E. IF PO_MSTR WAS AVAILABLE */
         pocrt_int = 0.
         {us/px/pxrun.i &PROC='getCreditTermsInterest' &PROGRAM='adcrxr.p'
            &HANDLE=ph_adcrxr
            &PARAM="(input po_cr_terms,
                     output pocrt_int)"}

         new_po = no.
         {us/bbi/pxmsg.i &MSGNUM=10 &ERRORLEVEL=1}
         {us/mf/mfaddisp.i po_bill bill_to}

         hide frame bill_to no-pause.
         {us/mf/mfaddisp.i po_vend vend}
         {us/mf/mfaddisp.i po_ship ship_to}

         disc = po_disc_pct.

         if available pod_det then
            so_job = pod_so_job.

      end.  /* (IF PO_MSTR WAS AVAILABLE)  */

      recno = recid(po_mstr).

      display
         po_nbr
         po_vend
         po_ship
         po_bill
      with frame a.

      assign
         old_vend = po_vend
         old_ship = po_ship.

      addrblk:
      do on error undo, leave:

         if new_po then do:

            vendblk:
            do on error undo, retry:

               prompt-for po_mstr.po_vend with frame a
               editing:
                  /* FIND NEXT/PREVIOUS  RECORD */
                  {us/mf/mfnp.i vd_mstr po_vend  " vd_domain = global_domain and
                  vd_addr "
                     po_vend vd_addr vd_addr}

                  if recno <> ? then do:
                      po_vend = vd_addr.
                      display po_vend with frame a.
                      find ad_mstr where ad_domain = global_domain and
                         ad_addr = vd_addr
                      no-lock.
                      {us/mf/mfaddisp.i po_vend vend}
                  end.

               end.  /* prompt-for po_mstr.po_vend */

               {us/mf/mfaddisp.i "input po_vend" vend}

               find vd_mstr where vd_domain = global_domain and
                  vd_addr = input po_vend
               no-lock no-error.

               if not available ad_mstr or
                  not available vd_mstr
               then do:
                  {us/bbi/pxmsg.i &MSGNUM=2 &ERRORLEVEL=3}  /* NOT A VALID SUPPLIER */
                  next-prompt po_vend with frame a.
                  undo, retry.
               end.

               if blockedSupplier
                  (input (input po_vend),
                   input {&PO002},
                   input true,
                   input "Supplier")
               then do:
                  undo vendblk, retry vendblk.
               end.

            end. /* VENDBLK */

         end.  /* if new_po */

         else do:
            find vd_mstr where vd_domain = global_domain and
               vd_addr = po_vend
            no-lock.
         end.  /* if NOT new_po */

        /* INVOICE METHOD */
         if new_po then do:
            assign
               po_tax_in   = if available vd_mstr then vd_tax_in
                             else ad_tax_in
               po_inv_mthd = ad_po_mthd.

            if po_inv_mthd = "n" or po_inv_mthd = "e" then
               po_print = no.
         end.

         assign
            po_vend  = input po_vend
            vd_recno = recid(vd_mstr).


         /* IF USING SUPPLIER CONSIGNMENT THEN INITIALIZE */
         /* CONSIGNMENT FIELDS.   */
         if using_supplier_consignment then do:
            run initializeSuppConsignFields
               (input po_vend,
                output po_consignment,
                output po_max_aging_days,
                output po_consign_cost_point).

            if return-value <> {&SUCCESS-RESULT}
            then do:
               if return-value = "3388" then do:
                  {us/bbi/pxmsg.i &MSGNUM=return-value &ERRORLEVEL=3
                           &MSGARG1= c-supplier-consignment}
               end.
               else do:
                  {us/bbi/pxmsg.i &MSGNUM=return-value &ERRORLEVEL=2}
               end.
               next-prompt po_vend with frame a.
               undo, retry.
            end. /* if return-value <> */
         end. /* IF using_supplier_consignment */

         hide frame bill_to no-pause.
         view frame ship_to.

/*c1206a*/  global_domain = childdomain.
         shipblk:
         do on error undo, retry
            on endkey undo mainloop, retry mainloop:

            prompt-for po_mstr.po_ship with frame a
            editing:

               /* FIND NEXT/PREVIOUS  RECORD */
               {us/mf/mfnp.i ad_mstr po_ship  " ad_domain = global_domain and
               ad_addr "  po_ship ad_addr ad_addr}

               if recno <> ? then do:
                  po_ship = ad_addr.
                  display po_ship with frame a.
                  {us/mf/mfaddisp.i po_ship ship_to}
               end.
            end.

            if input po_ship = "" then do:
               {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3}
               undo, retry.
            end.

            assign po_ship = input po_ship.
            {us/mf/mfaddisp.i po_ship ship_to}

            if not available ad_mstr then do:
               {us/bbi/pxmsg.i &MSGNUM=13 &ERRORLEVEL=3}
               next-prompt po_ship with frame a.
               undo, retry.
            end.

         end. /* shipblk */
/*c1206a*/  global_domain = parentdomain.

         hide frame ship_to no-pause.
         view frame bill_to.

         billblk:
         do on error undo, retry
            on endkey undo mainloop, retry mainloop:

            prompt-for po_mstr.po_bill with frame a
            editing:

               /* FIND NEXT/PREVIOUS  RECORD */
               {us/mf/mfnp.i ad_mstr po_bill  " ad_domain = global_domain and
               ad_addr "  po_bill ad_addr ad_addr}

               if recno <> ? then do:
                  po_bill = ad_addr.
                  display po_bill with frame a.
                  {us/mf/mfaddisp.i po_bill bill_to}
               end.

            end.

            if input frame a po_bill = "" then do:
               {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3}
               undo, retry.
            end.

            assign po_bill = input frame a po_bill.

            {us/mf/mfaddisp.i po_bill bill_to}

            if not available ad_mstr then do:
               {us/bbi/pxmsg.i &MSGNUM=13 &ERRORLEVEL=3}
               next-prompt po_bill with frame a.
               undo, retry.
            end.
         end. /* billblk */

      end. /*addrblk */

      /* SET GLOBAL REFERENCE VARIABLE FOR COMMENTS TO VENDOR */
      global_ref = po_vend.

      /* INITIALIZE */
      po_recno = recid(po_mstr).
      continue = yes.
      pause 0.

      /* POPULATE PO HEADER ONLY WHEN NEW */
      if new_po
      then do:
         l_taxflag = no.
         {us/bbi/gprun.i ""rqpobldc.p""
                  "(input-output l_taxflag,
                    input p_override_remarks)"
         }  /* SIMILAR TO popomtb.p */
         if l_taxflag = no
         then
            undo mainloop, retry mainloop.
      end.  /* POPULATE PO HEADER */

      /* DETERMINE ROUNDING METHOD FROM DOCUMENT CURRENCY OR BASE */
      if not new_po then do:
         /* NEED TO DETERMINE ROUNDING METHOD FOR LATER PROCESSING */
         /* GET ROUNDING METHOD FROM CURRENCY MASTER */
         {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
            "(input po_curr,
              output rndmthd,
              output mc-error-number)"}
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
            pause 0.
            continue = no.
         end.
      end.  /* DETERMINE ROUNDING METHOD */

      if continue = no then
         undo mainloop, retry.

      /* EVALUATED RECEIPT SETTLEMENT (ERS) */
      find first poc_ctrl where poc_domain = global_domain no-lock no-error.

      if available poc_ctrl and poc_ers_proc then do: /*ERS ON*/

         form
            po_ers_opt label "ERS Option" colon 22
            skip
            po_pr_lst_tp label "ERS Price List Option" colon 22
         with frame ers overlay side-labels centered
            row(frame-row(a) + 11)
            width 30.

         /* SET EXTERNAL LABELS */
         setFrameLabels(frame ers:handle).

         /*POC ERS IS ON AND ERS OPTION IS ON*/
         if new_po then
            po_ers_opt = poc_ers_opt.

         /*UPDATE ERS FIELDS*/
         display
            po_ers_opt
            po_pr_lst_tp
         with frame ers.

         ers-loop:
         do with frame ers on error undo, retry:
            set po_ers_opt po_pr_lst_tp.

            /*VALIDATE ERS OPTION*/
            if not ({gppoers.v po_ers_opt}) then do:
               {us/bbi/pxmsg.i &MSGNUM=2303 &ERRORLEVEL=3}    /* INVALID ERS OPTION */
               next-prompt po_ers_opt.
               undo, retry ers-loop.
            end.
         end. /*DO WITH FRAME ERS*/

         hide frame ers.

      end. /*AVAILABLE POC_CTRL*/

      if using_supplier_consignment then do:

         run setPoConsigned
            (input-output po_consignment,
             input        po_nbr,
             input        line).

         if keyfunction(lastkey) = "END-ERROR" then do:
            hide frame consign.
            undo, retry.
         end.

         hide frame consign.

         /* UPDATE AGING DAYS AND PO COST POINT */
         if po_consignment then do:
            run setAgingDays
               (input-output po_max_aging_days,
                input-output po_consign_cost_point,
                input yes).

            if keyfunction(lastkey) = "END-ERROR" then do:
               hide frame aging.
               undo, retry.
            end.

            hide frame aging.
         end.
         else
            /* IF NOT A CONSIGNED PO, THEN RESET COST POINT TO BLANK */
            /* (DEFAULTING OF CONSIGNMENT FIELDS OCCURS BEFORE USER  */
            /* HAS UPDATED THE CONSIGNMENT FLAG.)                    */
            po_consign_cost_point = "".

      end. /* if using_supplier_consignment then do */

      if (oldcurr <> po_curr) or oldcurr = "" then do:
         /* SET CURRENCY DEPENDENT FORMATS */
         {us/po/pocurfmt.i}
         oldcurr = po_curr.
      end.

      /* USE SHIP-TO INFO FOR TAX RATE PERCENTAGES */
      if po_tax_date <> ? then
         tax_date = po_tax_date.
      else
      if po_due_date <> ? then
         tax_date = po_due_date.
      else
         tax_date = po_ord_date.

      /* FIND LAST LINE */
      line = 0.
      find last pod_det no-lock
          where pod_domain = global_domain and pod_nbr = po_nbr
      use-index pod_nbrln no-error.
      if available pod_det then line = pod_line.

      po_recno = recid(po_mstr).

   end.  /* TRANSACTION  TO GET SUPPLIER & SHIP-TO */

   {us/mf/mfselprt.i "printer" 132 }
   {us/bbi/mfphead.i }

   /* POPULATE PO LINE ITEMS */
/*c1171x* {us/bbi/gprun.i ""rqpobldd.p"" "(input using_supplier_consignment)"} */
/*c1171x*/ {us/bbi/gprun.i ""xxrqpobldd.p"" "(input using_supplier_consignment)"}

   /* CALCULATING TAX FOR GTM ENVIRONMENT */
   {us/bbi/gprun.i ""txcalc.p"" "(input l_tax_tr_type,
                           input po_nbr,
                           input l_tax_nbr,
                           input l_tax_lines,
                           input no,
                           output result-status)"}

   if use-log-acctg and po_tot_terms_code <> "" then
   for each pod_det where pod_domain = global_domain and pod_nbr = po_nbr
   no-lock:

      ref-type = {&TYPE_PO}.

      {us/gp/gprunmo.i &program=""lapotax.p""
                 &module="LA"
                 &param="""(input ref-type,
                            input pod_nbr,
                            input l_tax_nbr,
                            input pod_line,
                            input pod_qty_ord)"""}

      end.

   /*  REPORT TRAILER  */
   {us/mf/mfrtrail.i }

/*c1456* start added code */
   vtrig = no.
   for first pod_det no-lock
   where pod_domain = po_mstr.po_domain
   and   pod_nbr = po_mstr.po_nbr:
         vtrig = yes.
   end.

   for each pod_det no-lock
   where pod_domain = po_mstr.po_domain
   and   pod_nbr = po_mstr.po_nbr,
   first gl no-lock
   where glcode = pod_acc
   and   customcombo1 <> "auto receipted":
      vtrig = no.
   end.
   if vtrig
   then do:
       vMessageTrig = "This PO will be receipted automatically".
       {us/bbi/pxmsg.i &MSGTEXT=vMessageTrig  &ERRORLEVEL=1}
   end.

/*c1456* start added code */

   /* IMPORT EXPORT UPDATE */
   if impexp
   then do:
      {us/px/pxrun.i &PROC='import-export-update'}
   end. /* IF impexp */

   /* CLEAN UP FRAMES DISPLAYED */
   if not impexp_edit
   then do:
      hide all no-pause.
      if c-application-mode <> "API"
      then
         run viewDtitle.
   end. /* IF NOT impexp_edit */

/*c1438*/ do transaction:
/*c1438*/ find current po_mstr exclusive-lock no-error.
/*c1438*/ if available po_mstr
          then do:
	    substring(po__chr09, 100, 1) = "x".
          end.
/*c1438*/ end.
   release po_mstr no-error.

   return_code = 1107.
   leave.

end.  /* REPEAT: MAINLOOP */

hide frame a.
hide frame vend.
hide frame ship_to.

delete procedure hBlockedTransactionlibrary.

/*  INITIALIZE-VARIABLES PROCEDURE  */
PROCEDURE initialize-variables:
   assign
      nontax_old         = nontaxable_amt:format in frame potot
      taxable_old        = taxable_amt:format
      lines_tot_old      = lines_total:format
      tax_tot_old        = tax_total:format
      order_amt_old      = order_amt:format
      prepaid_old        = po_prepaid:format in frame pomtd
      oldcurr = "".

END PROCEDURE.

/*  INITIALIZE PO_MSTR PROCEDURE  */
PROCEDURE initialize_po_mstr:
   assign
      po_mstr.po_ers_opt = "1"
      po_nbr             = ponbr
      po_nrm             = l_ponrm
      po_ord_date        = today
      po_due_date        = today
      po_tax_date        = ?
      po_ship            = poc_ctrl.poc_ship
      po_bill            = poc_bill
      po_confirm         = yes
      disc               = 0
      po_user_id         = global_userid
      po_fst_id          = poc_fst_id /*(GST exempt id for company)*/
      po_pst_id          = poc_pst_id.
   if recid(po_mstr) = -1 then .

END PROCEDURE.

PROCEDURE import-export-update:
/*------------------------------------------------------------------------------
  Purpose: To create and maintain intrastat detail records.
  Notes:
  History:
------------------------------------------------------------------------------*/
   assign
      impexp_edit = no
      upd_okay    = no.

   /* CREATE THE IMPORT/EXPORT RECORD */
   {us/px/pxrun.i &PROC='createIntrastatDetails'
            &PROGRAM='ieiexr.p'
            &HANDLE=ph_ieiexr
            &PARAM="(input '2',
                     input po_mstr.po_nbr)"}

   if not batchrun
   then do:

      /* VIEW/EDIT IMPORT-EXPORT DATA ? */
      {us/bbi/pxmsg.i &MSGNUM=271 &ERRORLEVEL={&INFORMATION-RESULT}
         &CONFIRM=impexp_edit}

      if impexp_edit
      then do:

         hide all.
         if c-application-mode <> "API"
         then do:
            run viewDtitle.
            view frame a.
         end. /* IF c-application-mode <> "API" */

         /* MAINTAIN IMPORT/EXPORT RECORD */
         {us/bbi/gprun.i ""iedmta.p""
            "(input ""2"",
              input po_mstr.po_nbr,
              input-output upd_okay )" }

      end. /* IF impexp_edit */

   end. /* IF NOT batchrun */

END PROCEDURE. /* import-export-update */


/*Use frame handles to find the "dtitle" frame and make it visible*/
PROCEDURE viewDtitle:
   define variable h as handle no-undo.

   h = current-window:first-child.
   do while valid-handle(h):
      if can-query(h,"name") and
         h:name = "dtitle" then do:
         h:visible = true.
         leave.
      end.
      h = h:next-sibling.
   end.
END PROCEDURE. /*viewDtitle*/
