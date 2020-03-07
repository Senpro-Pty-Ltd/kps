/* xfrp0309.p - PURCHASE ORDER PRINT MAIN SUBROUTINE                          */
/* porp0301.p - PURCHASE ORDER PRINT MAIN SUBROUTINE                          */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrp0309.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/*                                                                            */
/* Old ECO marker removed, but no ECO header exists *U.S.*                    */
/* REVISION: 5.0     LAST MODIFIED: 03/28/90    BY: MLB *B615*                */
/* REVISION: 6.0     LAST MODIFIED: 05/24/90    BY: WUG *D002*                */
/* REVISION: 6.0     LAST MODIFIED: 06/14/90    BY: RAM *D030*                */
/* REVISION: 6.0     LAST MODIFIED: 07/05/90    BY: WUG *D043*                */
/* REVISION: 6.0     LAST MODIFIED: 08/17/90    BY: SVG *D058*                */
/* REVISION: 6.0     LAST MODIFIED: 01/03/91    BY: MLB *D238*                */
/* REVISION: 6.0     LAST MODIFIED: 01/18/91    BY: RAM *D306*                */
/* REVISION: 6.0     LAST MODIFIED: 08/14/91    BY: RAM *D828*                */
/* REVISION: 6.0     LAST MODIFIED: 11/05/91    BY: RAM *D913*                */
/* REVISION: 7.3     LAST MODIFIED: 02/22/93    by: jms *G712*                */
/* REVISION: 7.3     LAST MODIFIED: 04/09/93    BY: afs *G926*                */
/* REVISION: 7.4     LAST MODIFIED: 07/20/93    BY: bcm *H033*                */
/* REVISION: 7.4     LAST MODIFIED: 01/28/94    BY: dpm *FL36*                */
/* REVISION: 7.4     LAST MODIFIED: 04/11/94    BY: bcm *H334*                */
/* REVISION: 7.4     LAST MODIFIED: 06/17/94    BY: bcm *H382*                */
/* REVISION: 7.4     LAST MODIFIED: 07/25/94    BY: dpm *FP50*                */
/* REVISION: 7.4     LAST MODIFIED: 09/20/94    BY: jpm *GM74*                */
/* REVISION: 7.4     LAST MODIFIED: 03/29/95    BY: dzn *F0PN*                */
/* REVISION: 7.4     LAST MODIFIED: 10/11/95    BY: jym *G0Z4*                */
/* REVISION: 8.5     LAST MODIFIED: 10/03/95    BY: taf *J053*                */
/* REVISION: 8.5     LAST MODIFIED: 02/14/96    BY: rxm *H0JJ*                */
/* REVISION: 8.5     LAST MODIFIED: 07/18/96    BY: taf *J0ZS*                */
/* REVISION: 8.6     LAST MODIFIED: 10/22/96    BY: *K004* Nadine Catry       */
/* REVISION: 8.6     LAST MODIFIED: 11/21/96    BY: *K022* Tejas Modi         */
/* REVISION: 8.6     LAST MODIFIED: 04/02/97    BY: *K073* Kieu Nguyen        */
/* REVISION: 8.6     LAST MODIFIED: 04/08/97    BY: *J1MJ* Ajit Deodhar       */
/* REVISION: 8.6     LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E    LAST MODIFIED: 06/16/98    BY: *L020* Charles Yen        */
/* REVISION: 9.1     LAST MODIFIED: 07/28/99    BY: *N01B* John Corda         */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1     LAST MODIFIED: 08/13/00    BY: *N0KQ* Mark Brown         */
/* Revision: 1.11.2.7     BY: Katie Hilbert        DATE: 04/01/01 ECO: *P002* */
/* Revision: 1.11.2.9     BY: Rajiv Ramaiah        DATE: 10/23/02 ECO: *N1XW* */
/* Revision: 1.11.2.10    BY: Narathip W.          DATE: 05/06/03 ECO: *P0R9* */
/* Revision: 1.11.2.12    BY: Paul Donnelly (SB)   DATE: 06/28/03 ECO: *Q00J* */
/* Revision: 1.11.2.13    BY: Laxmikant Bondre     DATE: 07/22/04 ECO: *P2BX* */
/* Revision: 1.11.2.14    BY: Jignesh Rachh        DATE: 05/18/05 ECO: *P3LS* */
/* Revision: 1.11.2.15    BY: Andrew Dedman        DATE: 08/22/05 ECO: *R01P* */
/* Revision: 1.11.2.17    BY: Ellen Borden         DATE: 01/17/06 ECO: *R008* */
/* Revision: 1.11.2.18     BY: Changlin Zeng       DATE: 05/16/06 ECO: *R045* */
/* Revision: 1.11.2.24     BY: Robin McCarthy      DATE: 05/31/06 ECO: *R02F* */
/* Revision: 1.11.2.25     BY: Nivedita Banerjee   DATE: 06/25/06 ECO: *R06L* */
/* Revision: 1.11.2.26     BY: Jean Miller         DATE: 09/24/07 ECO: *R0C5* */
/* Revision: 1.11.2.28     BY: Deirdre O'Brien    DATE: 10/03/07  ECO: *R0C6* */
/* Revision: 1.11.2.29     BY: Dinesh Dubey       DATE: 07/07/08  ECO: *R0W3* */
/* Revision: 1.11.2.31     BY: Jean Miller        DATE: 12/02/08  ECO: *R15M* */
/* Revision: QAD2016       BY: sxh   DATE: 09/04/16  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
 
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
{us/px/pxphdef.i adcrxr}
{us/xf/xfdefa.i} /*grc338*/
{us/xf/xfpo03u.i} /*grc338*/
{us/xf/xfpo03v.i} /*grc338*/

/* PARAMETER TO FACILITATE DISPLAY OF "SIMULATION" */
/* TEXT IN REPORT HEADER                           */
define input parameter update_yn like mfc_logical no-undo.
 
define new shared variable convertmode as character no-undo.
define new shared variable rndmthd like rnd_rnd_mthd.
define new shared variable po_recno as recid.
define new shared variable pages as integer.
define new shared variable billto as character
   format "x(38)" extent 6.
define new shared variable vendor as character
   format "x(38)" extent 6.
define new shared variable shipto as character
   format "x(38)" extent 6.
define new shared variable poship like po_ship.
define new shared variable duplicate as character
   format "x(11)" label "".
define new shared variable vend_phone like ad_phone.
define new shared variable vend_fax like ad_fax.
define new shared variable termsdesc as character format "x(40)" label "Description" no-undo.
define new shared variable addr as character format "x(38)" extent 6.
define new shared variable vdattnlbl as character format "x(16)".
define new shared variable vdattn like ad_attn.
define new shared variable maint     like mfc_logical.
 
define new shared frame c.
define new shared frame phead1.
define new shared frame d.
 
define shared variable ord_date like po_ord_date.
define shared variable ord_date1 like po_ord_date.
define shared variable nbr like po_nbr.
define shared variable nbr1 like po_nbr.
define shared variable vend like po_vend.
define shared variable vend1 like po_vend.
define shared variable buyer like po_buyer.
define shared variable buyer1 like po_buyer.
define shared variable msg as character format "X(60)".
define shared variable print_bill like mfc_logical.
define shared variable lang like so_lang.
define shared variable lang1 like lang.
define shared variable open_only like mfc_logical.
define shared variable sort_by_site like poc_sort_by.
define shared variable new_only like mfc_logical.
define shared variable include_sched like mfc_logical.
define shared variable incl_b2b_po like mfc_logical.
define shared variable print_options like mfc_logical.
define shared variable use-log-acctg as logical no-undo.
 
define shared variable printAttributeProfile like mfc_logical no-undo.
define shared variable groupAttributesByCategory like mfc_logical no-undo.
define shared variable printItemLevelAttributes like mfc_logical no-undo.
 
define variable old_po_nbr like po_nbr no-undo.
define variable location like pt_loc no-undo.
define variable i as integer no-undo.
define variable dup-lbl as character format "x(10)" no-undo.
define variable prepaid-lbl as character format "x(17)" no-undo.
define variable signature-lbl as character format "x(34)" no-undo.
define variable by-lbl as character format "x(3)" no-undo.
define variable ext_cost like pod_pur_cost format "(z,zzz,zzz,zz9.99)" no-undo.
define variable desc1 like pod_desc no-undo.
define variable desc2 like pt_desc2 no-undo.
define variable qty_open like pod_qty_ord format "->>>>>>9.9<<<<<<" no-undo.
define variable det_lines as integer no-undo.
define variable tax_flag as character format "x(1)" no-undo.
define variable mfgr like vp_mfgr no-undo.
define variable mfgr_part like vp_mfgr_part no-undo.
define variable y-lbl as character format "x(1)" no-undo.
define variable n-lbl as character format "x(1)" no-undo.
define variable rev-lbl as character format "x(10)" no-undo.
define variable vpart-lbl as character format "x(15)" no-undo.
define variable manuf-lbl as character format "x(14)" no-undo.
define variable part-lbl as character format "x(6)" no-undo.
define variable site-lbl as character format "x(6)" no-undo.
define variable disc-lbl as character format "x(5)" no-undo.
define variable discdesc as character format "x(14)" no-undo.
define variable type-lbl as character format "x(6)" no-undo.
define variable typedesc as character format "x(11)" no-undo.
define variable cont-lbl as character format "x(12)" no-undo.
define variable vd-attn-lbl as character format "x(16)" no-undo.
define variable item-rev-lbl as character format "x(15)" no-undo.
define variable item-rev-date-lbl as character format "x(20)" no-undo.
define variable nullstring as character initial "" format "x(1)" no-undo.
define variable new_po like mfc_logical initial no no-undo.
define variable lot-lbl as character format "x(43)" no-undo.
define variable starteff-lbl as character format "x(20)" no-undo.
define variable endeff-lbl as character format "x(18)" no-undo.
define variable oldcurr like po_curr no-undo.
define variable ext_cost_fmt as character no-undo.
define variable ext_cost_old as character no-undo.
define variable prepaiddesc as character format "x(40)" no-undo.
define variable signatureline as character format "x(30)" no-undo.
define variable disp_trail like mfc_logical no-undo.
define variable mc-error-number like msg_nbr no-undo.
define variable l_tx_misc1    like ad_misc1_id  no-undo.
define variable l_tx_misc2    like ad_misc2_id  no-undo.
define variable l_tx_misc3    like ad_misc3_id  no-undo.
define variable l_print_taxid like mfc_logical  no-undo.
define variable l_po_locked   like mfc_logical  no-undo.
define variable l_rndmthd     like rnd_rnd_mthd no-undo.
define variable hBlockedTransactionlibrary as handle no-undo.
define variable h_format as handle no-undo.
 
signatureline = fill("_",30).
 
form
   prepaiddesc
   skip(1)
   by-lbl to 47
   signatureline to 78
   signature-lbl to 78
with frame potrail1 no-labels no-box width 80.
 
/* DEFINE VARIABLES FOR CURRENCY DEPENDENT FORMATS */
{us/po/pocurvar.i "NEW"}
{us/tx/txcurvar.i "NEW"}
/* DEFINE SHARED PO TRAILER VARIABLES */
/*grc338 {us/po/potrldef.i "new"} */
{us/xf/xftrldef.i "new"} /*grc338*/
/*grc338 {us/po/po03d01.i}   /* DEFINE FRAME C*/ */
 
/* DEFINE TRAILER VARS AS NEW, SO THAT CORRECT _OLD FORMATS */
/*grc338 comment begin
assign
   nontax_old         = nontaxable_amt:format
   taxable_old        = taxable_amt:format
   lines_tot_old      = lines_total:format
   tax_tot_old        = tax_total:format
   order_amt_old      = order_amt:format
   ext_cost_old       = ext_cost:format
   prepaid_old        = "->,>>>,>>>,>>9.99".
oldcurr = "".
grc338 comment end*/
/* SET LABEL VARIABLES */
{us/po/po03b01.i}
 
/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtepdf.i &var="new shared"}
 
convertmode = "REPORT".
 
disp_trail = true.
 
find first gl_ctrl where gl_domain = global_domain no-lock.
 
for first qad_wkfl
   where qad_domain = global_domain
   and   qad_key1 = "popopm.p"
   and   qad_key2 = "l_gst_pst"
no-lock:
   l_print_taxid = qad_logfld[1].
end.
 
/* start blocked transaction library to run persistently */
run mfairunh.p
   (input "mgbltrpl.p",
    input  ?,
    output hBlockedTransactionlibrary).
 
{us/mg/mgbltrpl.i "hBlockedTransactionlibrary"}
 
{us/bbi/gprun.i ""gpctryfmt.p"" "persistent set h_format"}
 
pages = 0.
old_po_nbr = ?.
 
for each po_mstr  where po_mstr.po_domain = global_domain and (  (po_nbr >=
nbr) and (po_nbr <= nbr1)
      and (po_vend >= vend) and (po_vend <= vend1)
      and (po_buyer >= buyer and po_buyer <= buyer1)
      and (po_print or not new_only)
      and (po_ord_date >= ord_date) and (po_ord_date <= ord_date1)
      and (po_lang >= lang and po_lang <= lang1)
      and (po_stat = "" or not open_only)
      and (not po_sched or include_sched)
      and (not po_is_btb or incl_b2b_po)
      and po_type <> "B"      )
no-lock by po_nbr:
 
   if blockedSupplier(input po_vend,
                      input {&PO010},
                      input false,
                      input "") then next.
 
   /*Exclude scheduled orders that are closed*/
   /*if only open orders are to be printed   */
   if include_sched and po_sched and open_only then
      if po_eff_to <> ? and po_eff_to < today then
         next.
 
 
   if old_po_nbr <> ? then
      pages = page-number.
 
   old_po_nbr = po_nbr.
 
   if po_is_btb then do:
      find vd_mstr  where vd_mstr.vd_domain = global_domain and  vd_addr =
      po_vend no-lock no-error.
      if available vd_mstr
         and not vd_rcv_held_so
         and po_so_hold
      then
         next.
   end.
 
   run check_locked(output l_po_locked).
   if l_po_locked then
      next.
 
   mainloop:
   do transaction on error undo, leave on endkey undo, leave:
 
      /* DETERMINE CURRENCY DISPLAY AMERICAN OR EUROPEAN  */
      find ad_mstr where ad_domain = global_domain and ad_addr = po_vend
      no-lock no-wait no-error.
      if available ad_mstr then do:
         for first vd_mstr
            where vd_domain = global_domain
            and   vd_addr   = po_vend
         no-lock.
         end.
         /* Set formatting to PO vendor's country's locale */
         run setFormatForCountryCode in h_format(input vd_lang, input ad_mstr.ad_ctry).
      end.
      else do:
         for first usr_mstr
            where usr_userid = global_userid
         no-lock:
         end.
         /* Default formatting to user's locale */
         run setFormatForCountryCode in h_format(input global_user_lang, input usr_ctry_code).
      end.
 
      if not update_yn then
         rndmthd = l_rndmthd.
 
      if (oldcurr <> po_curr) or (oldcurr = "") then do:
 
         if po_curr = gl_base_curr then
            rndmthd = gl_rnd_mthd.
         else do:
            /* GET ROUNDING METHOD FROM CURRENCY MASTER */
            {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
                      "(input po_curr,
                        output rndmthd,
                        output mc-error-number)"}
             if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=4}
               if c-application-mode <> "WEB" then
               pause.
               next.
            end.
         end.
 
         find rnd_mstr where rnd_rnd_mthd = rndmthd no-lock no-error.
         if not available rnd_mstr then do:
            /* ROUND METHOD RECORD NOT FOUND */
            {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=4}
            next.
         end.
 
         /* SET THE CURRENCY DEPENDENT FORMAT FOR EXT_COST */
         ext_cost_fmt = ext_cost_old.
         {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output ext_cost_fmt,
                                   input rndmthd)"}
         /*grc338 comment begin
         ext_cost:format = ext_cost_fmt.
         {us/po/pocurfmt.i}
         grc338 comment end*/
         assign
            oldcurr   = po_curr
            l_rndmthd = rndmthd.
 
      end.
 
      {us/px/pxrun.i &PROC='getTermsDescription' &PROGRAM='adcrxr.p'
         &HANDLE=ph_adcrxr
         &PARAM="(input po_cr_terms,
                  output termsdesc)"}
 
      duplicate = "".
      if po_print = no then duplicate = dup-lbl.
 
      find ad_mstr
         where ad_mstr.ad_domain = global_domain
         and   ad_addr           = po_bill
      no-lock no-wait no-error.
 
      update billto = "".
 
      if available ad_mstr and print_bill then do:
 
         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
 
         assign
            billto[1] = addr[1]
            billto[2] = addr[2]
            billto[3] = addr[3]
            billto[4] = addr[4]
            billto[5] = addr[5]
            billto[6] = addr[6].
         {us/xf/xfaddr.i "billto"} /*grc338*/
         if l_print_taxid then
            assign
               l_tx_misc1 = ad_misc1_id
               l_tx_misc2 = ad_misc2_id
               l_tx_misc3 = ad_misc3_id.
      end.
 
      assign
         vendor = ""
         vdattnlbl = ""
         vdattn = "".
 
      find ad_mstr
         where ad_mstr.ad_domain = global_domain
         and   ad_addr           = po_vend
      no-lock no-wait no-error.
 
      if available ad_mstr then do:
 
         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
 
         assign
            vend_phone = ad_phone
            vend_fax = ad_fax.
 
         assign
            vendor[1] = addr[1]
            vendor[2] = addr[2]
            vendor[3] = addr[3]
            vendor[4] = addr[4]
            vendor[5] = addr[5]
            vendor[6] = addr[6].
         {us/xf/xfaddr.i "vendor"} /*grc338*/
         if ad_attn <> "" then
            assign
               vdattnlbl = vd-attn-lbl
         vdattn = ad_attn.
      end.
      /*grc338 add begin*/
      update shipto = "".
      for first ad_mstr no-lock
         where ad_domain = global_domain
           and ad_addr   = po_ship :
         assign
            shipto[1] = ad_name
            shipto[2] = ad_line1
            shipto[3] = ad_line2
            shipto[4] = ad_line3
            shipto[5] = ""
            shipto[6] = ad_country
            shipto_city = ad_city
            shipto_state = ad_state
            shipto_zip = ad_zip.
      end. /*for first ad_mstr*/
      /*grc338 add end*/

      /*grc338 {us/po/po03a01.i} */

      po_recno = recid(po_mstr).
 
      /* Print Order Detail */
      if sort_by_site then do:
/*grc338
         {us/bbi/gprun.i ""porp3a01.p"" "(input update_yn)"} */
	 {us/bbi/gprun.i ""xfrp3a01.p"" "(input update_yn)"}  /*grc338*/
      end.
      else do:
/*grc338
         {us/bbi/gprun.i ""porp3b01.p"" "(input update_yn)"} */
         {us/bbi/gprun.i ""xfrp3b01.p"" "(input update_yn)"}  /*grc338*/
      end.
 
      /* TRAILER */
      maint = no.
      undo_trl2 = true.

      /*grc338 {us/bbi/gprun.i ""pomttrl2.p""} */
    /*grc338*/ {us/bbi/gprun.i ""xfmttrl2.p""}
      if undo_trl2 then undo, leave.
 
      /* ADDED THE ASSIGN PREPAID DISPLAY FIELD            */
      if po_prepaid <> 0 then
         prepaiddesc = prepaid-lbl + " " + string(po_prepaid, prepaid_fmt).
      else
         prepaiddesc = "".
 
      display
         prepaiddesc
         by-lbl
         signatureline
         signature-lbl
      with frame potrail1.
 
      {us/bbi/gprun.i ""poporp3a.p""}
 
      if not update_yn then
         undo mainloop, leave mainloop.
   end. /* DO TRANSACTION */
end.
 
delete procedure hBlockedTransactionlibrary no-error.
 
 
/* SET SESSION PARAMETER BACK BEFORE ENDING */
run resetFormat in h_format.
delete procedure h_format no-error.
 
PROCEDURE check_locked:
   /* CHECK IF po_mstr OR pod_det IS LOCKED. */
   define output parameter p_po_locked as logical no-undo initial no.
 
   define variable l_po_recid as recid no-undo.
   define variable l_first    as logical no-undo.
 
   define buffer po_mstr for po_mstr.
   define buffer pod_det for pod_det.
 
   l_po_recid = recid(po_mstr).
   do transaction on error undo, leave on endkey undo, leave:
      find first po_mstr
         where recid(po_mstr) = l_po_recid
      exclusive-lock no-wait no-error.
 
      if locked po_mstr then
         p_po_locked = yes.
      else do:
         l_first = yes.
 
         repeat:
            if l_first = yes then do:
               find first pod_det
                  where pod_domain = global_domain
                  and   pod_nbr    = po_nbr
                  exclusive-lock no-wait no-error.
               l_first = no.
            end.
            else
               find next pod_det
                  where pod_domain = global_domain
                  and   pod_nbr    = po_nbr
               exclusive-lock no-wait no-error.
 
            if not available pod_det
               and not locked pod_det
            then
               leave.
            else
               if locked pod_det then do:
                   p_po_locked = yes.
                   leave.
               end.
               else
                  if available pod_det then
                     release pod_det.
         end. /* REPEAT */
      end. /* ELSE DO */
      release po_mstr.
   end. /* DO TRANSACTION */
 
   for first po_mstr where recid(po_mstr) = l_po_recid
   no-lock: end.
 
END PROCEDURE. /* procedure check_locked */
