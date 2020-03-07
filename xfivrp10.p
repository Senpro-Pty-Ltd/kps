/* xfivrp10.p  -  INVOICE PRINT/REPRINT                                       */
/* soivrp10.p  -  INVOICE PRINT/REPRINT                                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivrp10.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 5.0      LAST MODIFIED: 01/05/90   BY: ftb *B511*                */
/* REVISION: 6.0      LAST MODIFIED: 04/16/90   BY: ftb *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 07/05/90   BY: WUG *D043*                */
/* REVISION: 6.0      LAST MODIFIED: 08/15/90   BY: ftb *B773*                */
/* REVISION: 6.0      LAST MODIFIED: 09/18/90   BY: MLB *D055*                */
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425*                */
/* REVISION: 6.0      LAST MODIFIED: 04/10/91   BY: MLV *D506    (rev only)   */
/* REVISION: 6.0      LAST MODIFIED: 05/09/91   BY: MLV *D617*                */
/* REVISION: 7.0      LAST MODIFIED: 10/21/91   BY: afs *D903*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 02/13/92   BY: tjs *F191*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 03/04/92   BY: tjs *F247*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 03/20/92   BY: TMD *F263*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 03/04/92   BY: tjs *F320*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 03/27/92   BY: dld *F322*                */
/* REVISION: 7.0      LAST MODIFIED: 04/02/92   BY: afs *F348*                */
/* REVISION: 7.0      LAST MODIFIED: 04/08/92   BY: tmd *F367*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 06/19/92   BY: tmd *F458*   (rev only)   */
/* REVISION: 7.3      LAST MODIFIED: 09/04/92   BY: afs *G047*                */
/* REVISION: 7.3      LAST MODIFIED: 02/19/93   by: jms *G712*                */
/* REVISION: 7.3      LAST MODIFIED: 03/11/93   BY: afs *G805*                */
/* REVISION: 7.3      LAST MODIFIED: 03/17/93   BY: afs *G820*   (rev only)   */
/* REVISION: 7.3      LAST MODIFIED: 04/29/93   BY: bcm *GA56*   (rev only)   */
/* REVISION: 7.3      LAST MODIFIED: 05/13/93   BY: kgs *GA93*                */
/* REVISION: 7.3      LAST MODIFIED: 06/11/93   BY: WUG *GB74*                */
/* REVISION: 7.4      LAST MODIFIED: 08/19/93   BY: pcd *H009*                */
/* REVISION: 7.4      LAST MODIFIED: 10/28/93   BY: cdt *H197*                */
/* REVISION: 7.4      LAST MODIFIED: 05/19/94   BY: afs *FO31*                */
/* REVISION: 7.4      LAST MODIFIED: 06/02/94   BY: dpm *GK02*                */
/* REVISION: 7.3      LAST MODIFIED: 09/08/94   BY: dpm *FQ87*                */
/* REVISION: 7.4      LAST MODIFIED: 09/10/94   BY: bcm *GM05*                */
/* REVISION: 7.4      LAST MODIFIED: 10/18/94   BY: jzs *GN91*                */
/* REVISION: 8.5      LAST MODIFIED: 03/31/95   BY: nte *J042*                */
/* REVISION: 8.5      LAST MODIFIED  05/10/95   BY: jym *G0MF*                */
/* REVISION: 8.5      LAST MODIFIED: 07/26/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 01/08/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/22/96   BY: bxw *J0JY*                */
/* REVISION: 8.5      LAST MODIFIED: 10/21/96   BY: *J15C* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 10/20/97   BY: *H1F8* Nirav Parikh       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* EvdGevel           */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 07/14/98   BY: *L024* Steve Goeke        */
/* REVISION: 9.1      LAST MODIFIED: 06/01/99   BY: *K20C* Chris Green        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 06/28/00   BY: *N0DM* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb                */
/* REVISION: 9.1      LAST MODIFIED: 10/13/00   BY: *N0W8* Mudit Mehta        */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.19.1.11     BY: Katie Hilbert     DATE: 04/01/01  ECO: *P002*  */
/* Revision: 1.19.1.12     BY: Manisha Sawant    DATE: 05/08/01  ECO: *N0YD*  */
/* Revision: 1.19.1.13     BY: Jean Miller       DATE: 05/14/02  ECO: *P05V*  */
/* Revision: 1.19.1.14     BY: Dorota Hohol      DATE: 02/25/03  ECO: *P0N6*  */
/* Revision: 1.19.1.15     BY: Narathip W.       DATE: 05/13/03  ECO: *P0RT*  */
/* Revision: 1.19.1.17     BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L*  */
/* Revision: 1.19.1.19     BY: Ed van de Gevel   DATE: 03/01/05  ECO: *R00G*  */
/* Revision: 1.19.1.20     BY: Ed van de Gevel   DATE: 07/01/05  ECO: *R01H*  */
/* Revision: 1.19.1.22     BY: Tom Kennedy       DATE: 06/08/06  ECO: *Q0LK*  */
/* Revision: 1.19.1.23     BY: Katie Hilbert     DATE: 05/31/07  ECO: *R0C6*  */
/* Revision: 1.19.1.25     BY: Jean Miller       DATE: 10/07/08  ECO: *R15M*  */
/* Revision: 1.19.1.26     BY: Yizhou Mao        DATE: 02/11/09  ECO: *R1BY*  */
/* Revision: 1.19.1.27     BY: Xiaolei Meng      DATE: 07/31/09  ECO: *R1N2*  */
/* $Revision: 1.2 $  BY: Jean Miller       DATE: 11/23/09  ECO: *R1TW*  */
/* Revision: QAD2016       BY: sxh    DATE: 0/04/16 ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* DISPLAY TITLE */
{us/mf/mfdtitle.i}
 
define new shared variable rndmthd             like rnd_rnd_mthd.
define new shared variable oldcurr             like ih_curr.
define new shared variable due_date            like idh_due_date.
define new shared variable due_date1           like idh_due_date.
define new shared variable inv                 like idh_inv_nbr.
define new shared variable inv1                like idh_inv_nbr.
define new shared variable dnbr                like ih_nbr no-undo.
define new shared variable dnbr1               like ih_nbr no-undo.
define new shared variable dom-proc            as integer no-undo.
define new shared variable nbr                 like ih_nbr.
define new shared variable nbr1                like ih_nbr.
define new shared variable site                like ih_site.
define new shared variable site1               like ih_site.
define new shared variable print_lotserials    like mfc_logical initial no
                                               label "Print Lot/Serial Numbers Shipped".
define new shared variable first_line          like mfc_logical.
define new shared variable pages               as integer.
define new shared variable comp_addr           like soc_company.
define new shared variable msg                 like msg_desc.
define new shared variable inv_date            like ih_inv_date.
define new shared variable inv_date1           like ih_inv_date.
define new shared variable ih_recno            as recid.
define new shared variable company             as character format "x(38)" extent 6.
define new shared variable billto              as character format "x(38)" extent 6.
define new shared variable soldto              as character format "x(38)" extent 6.
define new shared variable termsdesc           as character format "x(40)" label "Description" no-undo.
define new shared variable shipdate            like ih_ship_date.
define new shared variable shipdate1           like shipdate.
define new shared variable addr                as character format "x(38)" extent 6.
define new shared variable print_options       like mfc_logical initial no
                                               label "Print Features and Options".
define new shared variable override_print_hist like mfc_logical
                                               label "Override Print Invoice".
define new shared variable hdr_po as character format "x(38)".
define new shared variable cust                like ih_cust label "Sold-To".
define new shared variable cust1               like ih_cust.
define new shared variable bill                like ih_bill.
define new shared variable bill1               like ih_bill.
define new shared variable ship                like so_ship.
define new shared variable ship1               like so_ship.
define new shared variable resale              like cm_resale.
define new shared variable base_rpt            as character.
define new shared variable incinv              like mfc_logical initial yes
                                               label "Incl Invoices".
define new shared variable incmemo             like mfc_logical initial yes
                                               label "Incl Credit Invoices".
define new shared variable disc_det_key        like lngd_key1 initial "1".
define new shared variable disc_sum_key        like lngd_key1 initial "1".
define new shared variable call-detail         like mfc_logical initial no
                                               label "Print Call Invoice Detail".
define new shared variable dom-ord             like so_nbr no-undo.
define new shared variable dom-ord1            like so_nbr no-undo.
define new shared variable prt_cor             like mfc_logical
                                               label "Correction Invoices" initial no.
define new shared variable slspsn              as character.
define new shared variable slspsn1             as character.
define new shared variable reprint             like mfc_logical.
define new shared variable update_invoice      like mfc_logical.
define new shared variable lang                like so_lang.
define new shared variable lang1               like lang.
define new shared variable sls-psn             like so_slspsn[1] no-undo.
define new shared variable sls-psn1            like so_slspsn[1] no-undo.
define new shared variable daybook             as character no-undo.
define new shared variable daybook1            as character no-undo.
define new shared variable inv_batch           like ih_batch no-undo.
define new shared variable inv_batch1          like ih_batch no-undo.
define new shared variable update_fnbr         like mfc_logical no-undo.
define new shared variable fnbr_seq            like nr_seqid no-undo.
 
define new shared variable inv_only like mfc_logical initial no.
 
{us/et/etvar.i &new="new"}
 
{us/so/soivtot1.i "NEW" }  /* Define variables for invoice totals. */
 
{us/xf/xfdefa.i "NEW"}  /*grc338*/
{us/xf/xfiv10v.i "NEW"} /*grc338*/
{us/xf/xfiv10u.i "NEW"} /*grc338*/
/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtegl.i}
{us/gp/gpvtecdf.i &var="new shared"}
{us/gp/gpvtepdf.i &var="new shared"}
 
define variable disc_det      like lngd_translation label "Discount Detail".
define variable disc_sum      like disc_det         label "Discount Summary".
 
define new shared frame phead1.
 
define variable form_code    as character format "x(2)" label "Form Code" no-undo.
define variable run_file     as character format "x(12)" no-undo.
define variable prt_width    as integer no-undo.
define variable program_name as character initial 'soprint.p' no-undo.
define variable l_label      as character no-undo.
define variable dom-module   as logical initial no no-undo.
 
define variable upd_fnbr     like mfc_logical label "Update Fiscal Number" no-undo.
define variable l_success    as logical initial no no-undo.
 
l_label = getTermLabel("D_U_P_L_I_C_A_T_E",35).
 
find first soc_ctrl no-lock where soc_domain = global_domain no-error.
 
form
   dom-ord             colon 15
   dom-ord1            label "To"       colon 43 skip
   inv                 colon 15
   inv1                label "To"       colon 43 skip
   nbr                 colon 15
   nbr1                label "To"       colon 43 skip
   shipdate            colon 15
   shipdate1           label "To"       colon 43 skip
   site                colon 15
   site1               label "To"       colon 43 skip
   cust                colon 15
   cust1               label "To"       colon 43 skip
   bill                colon 15
   bill1               label "To"       colon 43 skip
   ship                colon 15
   ship1               label "To"       colon 43 skip
   inv_date            colon 15
   inv_date1           label "To"       colon 43 skip
   daybook             colon 15
   daybook1            label "To"       colon 43 skip
   inv_batch           colon 15
   inv_batch1          label "To"       colon 43 skip
   reprint colon 15 comp_addr  colon 43  form_code  colon 65 skip
   incinv  colon 18 incmemo    colon 43  override_print_hist colon 73 skip 
   disc_det format "x(8)" colon 33 inv_only         colon 73 skip
   disc_sum format "x(8)" colon 33 prt_cor          colon 73 skip
   print_lotserials       colon 33 call-detail      colon 73 skip
   print_options          colon 33 upd_fnbr         colon 73 skip
   msg            skip
with frame a side-labels width 80.
prt_cor:hidden in frame a = (soc_use_corr_inv = no).
upd_fnbr:hidden in frame a = (soc_use_fnbr = no).
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
find first lngd_det
   where lngd_dataset = program_name
     and lngd_field   = "det_disc_prnt"
     and lngd_lang    = global_user_lang
     and lngd_key1    = disc_det_key
no-lock no-error.
if available lngd_det then
   disc_det = lngd_translation.
else
   disc_det = "".
 
find first lngd_det
   where lngd_dataset = program_name
     and lngd_field   = "det_disc_prnt"
     and lngd_lang    = global_user_lang
     and lngd_key1    = disc_sum_key
no-lock no-error.
if available lngd_det then
   disc_sum = lngd_translation.
else
   disc_sum = "".
 
repeat:
   pause 0.
   assign
      oldcurr        = ""
      update_invoice = yes
      update_fnbr    = no.
 
   if inv1        = hi_char  then inv1        = "".
   if dom-ord1    = hi_char  then dom-ord1    = "".
   if nbr1        = hi_char  then nbr1        = "".
   if inv_date    = low_date then inv_date    = ?.
   if inv_date1   = hi_date  then inv_date1   = ?.
   if shipdate    = low_date then shipdate    = ?.
   if shipdate1   = hi_date  then shipdate1   = ?.
   if site1       = hi_char  then site1       = "".
   if cust1       = hi_char  then cust1       = "".
   if bill1       = hi_char  then bill1       = "".
   if ship1       = hi_char  then ship1       = "".
   if daybook1    = hi_char  then daybook1    = "".
   if inv_batch1  = hi_char  then inv_batch1  = "".
   /* if form_code   = ""       then form_code   = "1". */ /*grc338*/
   if form_code   = ""       then form_code   = "9". /*grc338*/

   if available soc_ctrl
   then do:
      if comp_addr = "" 
      then 
         comp_addr = soc_comp.

      inv_only  = soc_ln_inv.
   end. /* IF AVAILABLE soc_ctrl */
 
   if can-find (first so_mstr
      where so_domain = global_domain
       and  so_app_owner = "DOM")
   then dom-module = yes.
 
   if dom-module = no
   then hide dom-ord dom-ord1 in frame a.
 
   assign
      dom-ord  = ""
      dom-ord1 = "".
 
   if dom-module = yes
   then
      assign
         nbr      = ""
         nbr1     = "".

   update
      dom-ord  when (dom-module = yes)
      dom-ord1 when (dom-module = yes)
      inv inv1
      nbr nbr1
      shipdate shipdate1
      site site1
      cust cust1
      bill bill1
      ship ship1
      inv_date inv_date1
      daybook daybook1
      inv_batch inv_batch1
      reprint
      comp_addr
      form_code
      incinv
      incmemo
      override_print_hist
      disc_det
      disc_sum
      upd_fnbr when (soc_use_fnbr)
      print_lotserials
      print_options
      inv_only
      prt_cor when (soc_use_corr_inv)
      call-detail
      msg
   with frame a
   editing:
 
      if frame-field = "disc_det" then do:
         {us/mf/mfnp05.i lngd_det lngd_trans
            "    lngd_dataset = program_name
             and lngd_field   = 'det_disc_prnt'
             and lngd_lang    = global_user_lang"
            lngd_translation "input disc_det" }
         if recno <> ? then
         display lngd_translation @ disc_det
         with frame a.
      end.
 
      else if frame-field = "disc_sum" then do:
         {us/mf/mfnp05.i lngd_det lngd_trans
            "    lngd_dataset = program_name
             and lngd_field   = 'det_disc_prnt'
             and lngd_lang    = global_user_lang"
            lngd_translation "input disc_sum" }
         if recno <> ? then display lngd_translation @ disc_sum
         with frame a.
      end.
      else if frame-field = "reprint" then do:
         status input.
         readkey.
         if input reprint then
            msg = fill(" ", integer((52 - length(l_label)) / 2)) +
                  "* * * " + l_label + " * * *".
         else msg = "".
         display msg with frame a.
         apply lastkey.
      end.
      else do:
         status input.
         readkey.
         apply lastkey.
      end.
 
   end.
 
   /* IF USER ENTERS DOM ORDER RANGE AND NO DOMAIN ORDER RANGE  */
   /* THEN SET VAR'S nbr AND nbr1 TO THE RANGE OF THE DOM ORDER */
   if (dom-ord entered or dom-ord1 entered) and
      (nbr not entered and nbr1 not entered)
   then do:
      assign
         dom-proc = 1
         dnbr  = hi_char
         dnbr1 = ""
         nbr   = hi_char
         nbr1  = "".
      for each ecx_ref
         where ecx_domain = global_domain and
               ecx_ext_ref >= dom-ord and
               ecx_ext_ref <= dom-ord1
      no-lock:
         if ecx_nbr < nbr
            then nbr = ecx_nbr.
         if ecx_nbr > nbr1
            then nbr1 = ecx_nbr.
         if ecx_nbr < dnbr
            then dnbr = ecx_nbr.
         if ecx_nbr > dnbr1
            then dnbr1 = ecx_nbr.
      end.
   end. /* dom-ord entered */
 
   /* IF USER ENTERS DOMAIN ORDER AND NO DOM ORDER RANGE             */
   /* THEN SET VAR'S dnbr AND dnbr1 TO THE RANGE OF THE DOMAIN ORDER */
 
   else do:
      if (nbr entered or nbr1 entered) and
        (dom-ord not entered and dom-ord1 not entered)
      then do:
         assign
            dom-proc = 2
            dnbr = nbr
            dnbr1 = nbr1.
      end.
   end.
 
   /* IF USER ENTERS BOTH DOMAIN AND DOM ORDER RANGES THEN  */
   /* SET VAR's dnbr AND dnbr1 ONLY                         */
 
   if (dom-ord entered or dom-ord1 entered) and
      (nbr entered or nbr1 entered)
   then do:
      assign
           dom-proc = 3
           dnbr = hi_char
           dnbr1 = "".
      for each ecx_ref
         where ecx_domain = global_domain and
               ecx_ext_ref >= dom-ord and
               ecx_ext_ref <= dom-ord1
      no-lock:
         if ecx_nbr < dnbr
            then dnbr = ecx_nbr.
         if ecx_nbr > dnbr1
            then dnbr1 = ecx_nbr.
      end.
   end.
 
   /* Validate discount print options */
   find first lngd_det
      where lngd_dataset     = program_name
        and lngd_field       = "det_disc_prnt"
        and lngd_lang        = global_user_lang
        and lngd_translation = input disc_det
   no-lock no-error.
   if not available lngd_det then do:
      /* Invalid Option */
      {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_det}
      {us/bbi/gprun.i ""gpmsgls1.p""
          "(6928, program_name, 'det_disc_prnt', global_user_lang )"}
      next-prompt disc_det with frame a.
      undo, retry.
   end.
   disc_det_key = lngd_key1.
 
   find first lngd_det
      where lngd_dataset     = program_name
        and lngd_field       = "det_disc_prnt"
        and lngd_lang        = global_user_lang
        and lngd_translation = input disc_sum
   no-lock no-error.
   if not available lngd_det then do:
      /* Invalid Option */
      {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_sum}
      {us/bbi/gprun.i ""gpmsgls1.p""
         "(6928, program_name, 'det_disc_prnt', global_user_lang )"}
      next-prompt disc_sum with frame a.
      undo, retry.
   end.
   disc_sum_key = lngd_key1.
 
   if not incinv and not incmemo then do:
      /* Selection criteria results in no data to report */
      {us/bbi/pxmsg.i &MSGNUM=1614 &ERRORLEVEL=3}
      next-prompt incinv with frame a.
      undo, retry.
   end.
 
   bcdparm = "".
   if dom-module = yes then do:
      {us/mf/mfquoter.i dom-ord}
      {us/mf/mfquoter.i dom-ord1}
   end.
   {us/bbi/gprun.i ""gpquote.p""
      "(input-output bcdparm, 20,
         inv, inv1,
         nbr, nbr1,
         string(shipdate), string(shipdate1),
         site, site1,
         cust, cust1,
         bill, bill1,
         string(inv_date), string(inv_date1),
         daybook, daybook1,
         inv_batch, inv_batch1,
         string(reprint),
         comp_addr)"}
   {us/mf/mfquoter.i ship}
   {us/mf/mfquoter.i ship1}
   {us/mf/mfquoter.i form_code}
   {us/mf/mfquoter.i incinv}
   {us/mf/mfquoter.i incmemo}
   {us/mf/mfquoter.i override_print_hist}
   {us/mf/mfquoter.i disc_det}
   {us/mf/mfquoter.i disc_sum}
   {us/mf/mfquoter.i print_lotserials}
   {us/mf/mfquoter.i print_options}
   {us/mf/mfquoter.i inv_only}
   if soc_use_corr_in then do:
      {us/mf/mfquoter.i prt_cor}
   end.
   {us/mf/mfquoter.i call-detail}
   if soc_use_fnbr then do:
      {us/mf/mfquoter.i upd_fnbr}
   end.
   {us/mf/mfquoter.i msg}
 
   {us/gp/gprfile.i}
 
   if form_code <> "09"                            /*grc338*/
   and form_code <> "9"                            /*grc338*/
   then do :                                       /*grc338*/
   if search (global_user_lang_dir + "so/soiv10" + run_file + ".r") = ? and
      search (global_user_lang_dir + "so/soiv10" + run_file + ".p") = ?
   then do:
      /* FORM CODE NOT INSTALLED */
      {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3}
      pause 5.
      next-prompt form_code with frame a.
      undo, retry.
   end. /* IF SEARCH */
   end. /*if form_code <> "09"*/                   /*grc338*/
   else do :                                       /*grc338*/
      if search (global_user_lang_dir + "xf/xfiv10" + run_file + ".r") = ? and /*grc338*/
         search (global_user_lang_dir + "xf/xfiv10" + run_file + ".p") = ?     /*grc338*/
      then do:                                     /*grc338*/
         /* FORM CODE NOT INSTALLED */             /*grc338*/
         {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3}       /*grc338*/ 
         pause 5.                                  /*grc338*/
         next-prompt form_code with frame a.       /*grc338*/
         undo, retry.                              /*grc338*/
      end. /*if search*/                           /*grc338*/
   end. /*else*/                                   /*grc338*/

   if comp_addr <> "" then do:
 
      find ad_mstr
         where ad_domain = global_domain
          and  ad_addr = comp_addr
      no-lock no-wait no-error.
 
      if available ad_mstr then do:
 
         if not can-find(ls_mstr where ls_domain = global_domain and
                                       ls_addr = ad_addr and
                                       ls_type = "company")
         then do:
            /* Address must be for a company */
            {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
            next-prompt comp_addr.
            undo, retry.
         end.
 
         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
 
         assign
            company[1] = addr[1]
            company[2] = addr[2]
            company[3] = addr[3]
            company[4] = addr[4]
            company[5] = addr[5]
            company[6] = addr[6].
 
         /* FIND VAT REG. NO & COUNTRY CODE */
         {us/gp/gpvtecrg.i}
 
      end.
 
      else do:
         /* Address must be for a company */
         {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
         next-prompt comp_addr.
         undo, retry.
      end.
 
   end.
 
   if (prt_cor and upd_fnbr) or
      (not prt_cor and not (reprint and not upd_fnbr))
   then do:
      /* Set fiscal number sequence */
      {us/gp/gprunp.i "soldfnbr" "p" "setFiscalNbrSeq"
         "(input-output fnbr_seq,
           output       l_success)"}
      if not l_success then do:
         undo, retry.
      end.
 
      /* set to yes to allow creating fiscal number xref record */
      assign
         update_fnbr = yes.
   end.
 
   if form_code = "11" or prt_cor then
      prt_width = 132.
   else
      prt_width = 80.
 
   /* Show print setings frame */
   {us/so/soprstfr.i &New="new"
               &ShowFrame=yes
               &ParentFrame=a
               &PrintTax="not prt_cor"
               &PrintWidth=prt_width}
 
   /* OUTPUT DESTINATION SELECTION */
   /*grc338 comment begin
   {us/gp/gpseout2.i &printType = "printer" &printWidth = prt_width
               &pagedFlag = " "
               &stream = " "
               &appendToFile = " "
               &streamedOutputToTerminal = " "
               &withBatchOption = "yes"
               &displayStatementType = 1
               &withCancelMessage = "yes"
               &pageBottomMargin = 6
               &withEmail = "yes"
               &withWinprint = "yes"
               &defineVariables = "yes"}
   grc338 comment end*/
   /*grc338 add begin*/
   {us/gp/gpseout2.i &printType = "printer" &printWidth = prt_width
               &pagedFlag = " "
               &stream = "stream ft"
               &appendToFile = " "
               &streamedOutputToTerminal = " "
               &withBatchOption = "yes"
               &displayStatementType = 1
               &withCancelMessage = "yes"
               &pageBottomMargin = 6
               &withEmail = "yes"
               &withWinprint = "yes"
               &defineVariables = "yes"}
   /*grc338 add end*/

   mainloop:
   do transaction on error undo, leave on endkey undo, leave:
 
      pages = 0.
 
      if dom-ord1    = "" then dom-ord1    = hi_char.
      if nbr1        = "" then nbr1        = hi_char.
      if dnbr1       = "" then dnbr1       = hi_char.
      if inv1        = "" then inv1        = hi_char.
      if inv_date    = ?  then inv_date    = low_date.
      if inv_date1   = ?  then inv_date1   = hi_date.
      if shipdate    = ?  then shipdate    = low_date.
      if shipdate1   = ?  then shipdate1   = hi_date.
      if inv1        = "" then inv1        = hi_char.
      if site1       = "" then site1       = hi_char.
      if cust1       = "" then cust1       = hi_char.
      if bill1       = "" then bill1       = hi_char.
      if ship1       = "" then ship1       = hi_char.
      if lang1       = "" then lang1       = hi_char.
      if sls-psn1    = "" then sls-psn1    = hi_char.
      if daybook1    = "" then daybook1    = hi_char.
      if inv_batch1  = "" then inv_batch1  = hi_char.
 
      /* DUMMY RUNS FOR BOMS ETC. */
      if false then do:
         {us/bbi/gprun.i ""soiv1001.p""}
         {us/bbi/gprun.i ""soiv1011.p""}
      end. /* IF FALSE  */
 
      if prt_cor then do:
         if form_code <> "09"                            /*grc338*/
         and form_code <> "9"                            /*grc338*/
         then do :                                       /*grc338*/
         {us/bbi/gprun.i ""socirp10.p""}
         end. /*if form_code <> "09"*/                   /*grc338*/
         else do :                                       /*grc338*/
            {us/bbi/gprun.i ""xfcirp10.p""}              /*grc338*/
         end. /*else*/                                   /*grc338*/
      end.
      else do:
 
         /* RUN SELECTED FORMAT */
         if form_code <> "09"                            /*grc338*/
         and form_code <> "9"                            /*grc338*/
         then do :                                       /*grc338*/
         {us/bbi/gprun.i " ""soiv10"" + run_file + "".p"" "}
         end. /*if form_code <> "09"*/                   /*grc338*/
         else do :                                       /*grc338*/
            {us/bbi/gprun.i " ""xfiv10"" + run_file + "".p"" "} /*grc338*/
         end. /*else*/                                   /*grc338*/
      end.
 
     /* grc338 {us/bbi/mfreset.i} */
      /* grc338*/  {us/bbi/mfreset.i "stream ft"}
 
   end.  /* mainloop */
 
end.
