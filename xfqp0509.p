/* xfqp0509.p  -  QUOTE PRINT MAIN BODY                                       */
/* sqrp0501.p  -  QUOTE PRINT MAIN BODY                                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfqp0509.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 7.0      LAST MODIFIED: 03/20/92   BY: tjs *F300**/
/* REVISION: 7.0      LAST MODIFIED: 03/27/92   BY: dld *F326**/
/* REVISION: 7.0      LAST MODIFIED: 04/07/92   BY: dld *F358**/
/* REVISION: 7.3      LAST MODIFIED: 11/19/92   BY: tjs *G191**/
/* REVISION: 7.3      LAST MODIFIED: 02/02/93   BY: tjs *G620**/
/* REVISION: 7.4      LAST MODIFIED: 07/20/93   BY: bcm *H030**/
/* REVISION: 7.4      LAST MODIFIED: 08/02/93   BY: tjs *H053**/
/* REVISION: 7.4      LAST MODIFIED: 01/05/94   BY: dpm *FL18**/
/* REVISION: 7.4      LAST MODIFIED: 06/22/94   BY: WUG *GK60**/
/* REVISION: 7.4      LAST MODIFIED: 04/27/95   BY: rxm *F0PD**/
/* REVISION: 8.5      LAST MODIFIED: 02/24/95   BY: nte *J042**/
/* REVISION: 8.5      LAST MODIFIED: 10/05/95   BY: srk *J08B**/
/* REVISION: 8.5      LAST MODIFIED: 06/20/95   BY: taf *J053**/
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: DAH *J0T0**/
/* REVISION: 8.5      LAST MODIFIED: 07/17/96   BY: taf *J0ZH**/
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/15/98   BY: *L00L* Adam Harris        */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/11/98   BY: *L02K* Russ Witt          */
/* REVISION: 8.6E     LAST MODIFIED: 10/01/98   BY: *L09Z* Markus Barone      */
/* REVISION: 8.6E     LAST MODIFIED: 02/01/99   BY: *L0D5* Robin McCarthy     */
/* REVISION: 9.1      LAST MODIFIED: 07/23/99   BY: *N01B* John Corda         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 11/07/00   BY: *L15K* Kaustubh K         */
/* REVISION: 9.1      LAST MODIFIED: 11/20/00   BY: *N0TW* Jean Miller        */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.13.1.6      BY: Katie Hilbert      DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.13.1.8      BY: Jean Miller        DATE: 04/23/02  ECO: *P05M* */
/* Revision: 1.13.1.10     BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00M* */
/* Revision: 1.13.1.12     BY: Tiziana Giustozzi  DATE: 08/22/05  ECO: *R01P* */
/* Revision: 1.13.1.12     BY: Brian Wintz        DATE: 01/30/07  ECO: *R0C6* */
/* Revision: 1.13.1.13     BY: Dinesh Dubey       DATE: 07/07/08  ECO: *R0W3* */
/* Revision: 1.13.1.15     BY: Jean Miller        DATE: 10/07/08  ECO: *R15M* */
/* Revision: 1.13.1.16     BY: Jean Miller        DATE: 11/22/09  ECO: *R1TW* */
/* Revision: QAD2014      BY: Amol Dudvadkar    DATE: 03/16/15  ECO: *grc338* */
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
/**grc338 ADDED PORTION BEGINS**/
{us/xf/xfdefa.i}
{us/xf/xfqorp09v.i}
{us/xf/xftxtots.i}
/**grc338 ADDED PORTION ENDS**/

/* PARAMETER TO FACILITATE DISPLAY OF "SIMULATION" */
/* TEXT IN REPORT HEADER                           */
define input parameter update_yn like mfc_logical no-undo.

define new shared variable tax_date like qo_tax_date.
define new shared variable rndmthd  like gl_rnd_mthd.
define new shared variable qo_recno as recid.
define new shared variable disc_prnt_label as character format "x(8)".

define shared variable cust  like qo_cust.
define shared variable cust1 like qo_cust.
define shared variable nbr   like qo_nbr.
define shared variable nbr1  like qo_nbr.
define shared variable ord   like qo_ord_date.
define shared variable ord1  like qo_ord_date.
define shared variable lang  like qo_lang.
define shared variable lang1 like qo_lang.

define shared variable company as character format "X(38)" extent 6.
define shared variable print_options as logical initial no
   label "Print Features and Options".
define shared variable addr as character format "x(38)" extent 6.
define shared variable print_trlr like mfc_logical initial no
   label "Print Quote Trailer".

define variable oldcurr       like qo_curr no-undo.
define variable ext_price_fmt as character no-undo.
define variable ext_price_old as character no-undo.
define variable prepaid_fmt   as character no-undo.
define variable prepaid_old   as character no-undo.
define variable qty_open      like qod_qty_rel format "->>>>>>9.9<<<<<"
   label "Qty Open" no-undo.
define variable ext_price     like qod_price label "Ext Price"
   format "->>>,>>>,>>9.99" no-undo.

define variable desc1       like pt_desc1 no-undo.
define variable desc2       like pt_desc2 no-undo.
define variable pages       as integer no-undo.
define variable billto      as character format "x(38)" extent 6.
define variable shipto      as character format "x(38)" extent 6.
define variable ext_price_total like ext_price no-undo.
define variable termsdesc   as character format "x(40)" label "Description" no-undo.
define variable billattn    like ad_attn no-undo.
define variable shipattn    like ad_attn no-undo.
define variable billphn     like ad_phone no-undo.
define variable shipphn     like ad_phone no-undo.
define variable first_line  like mfc_logical no-undo.
define variable prepaid-lbl as character format "x(12)" no-undo.
define variable total-lbl   as character format "x(12)" no-undo.
define variable resale      like cm_resale format "x(20)" no-undo.
define variable cont_lbl    as character format "x(10)" no-undo.
define variable order       as character no-undo.
define variable pm_code     like pt_pm_code no-undo.
define variable h_format         as handle no-undo.
define variable hdl_disc_lbl     as handle.
define variable hdl_sum_disc_lbl as handle.

define variable hBlockedTransactionlibrary as handle no-undo.

{us/mg/mgbltrpl.i "hBlockedTransactionlibrary"}
{us/bbi/gprun.i ""gpctryfmt.p"" "persistent set h_format"}

define buffer ship for ad_mstr.

define new shared frame c.

cont_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
                       input "CONTINUE",
                       input 10,
                       input '*').

/* Shared workfile for summary discounts */
{us/so/sodiscwk.i &new="new"}

{us/et/etvar.i}
{us/et/etrpvar.i &new="new"}

{us/mf/mfsqtrla.i "NEW"}

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.

/* INCLUDE FILE FOR FRAME C */
{us/sq/sq05f01.i}

form
   prepaid-lbl at 2
   qo_prepaid
with frame prepd width 80 no-labels.

form
   space(46)
   total-lbl
   space(4)
   ext_price_total
with frame no_trailer down width 80 no-labels no-box.

hdl_disc_lbl     = prnt_disc_amt:handle in frame disc_print.
hdl_sum_disc_lbl = prnt_sum_disc_amt:handle in frame disc_sum_print.

/* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
assign
   nontax_old    = nontaxable_amt:format
   taxable_old   = taxable_amt:format
   line_tot_old  = line_total:format
   disc_old      = disc_amt:format
   trl_amt_old   = qo_trl1_amt:format
   tax_amt_old   = tax_amt:format
   ord_amt_old   = ord_amt:format
   prepaid_old   = qo_prepaid:format
   ext_price_old = ext_price:format.

oldcurr = "".

/* Set Blocked Transaction Library running persistently */
run mfairunh.p
   (input "mgbltrpl.p",
    input  ?,
    output hBlockedTransactionlibrary).

pages = 0.
for each qo_mstr where qo_mstr.qo_domain = global_domain and
   (qo_nbr >= nbr   and qo_nbr <= nbr1)   and
   (qo_cust >= cust and qo_cust <= cust1) and
   (qo_print_qo = yes)                    and
   (qo_ord_date >= ord or ord = ?)        and
   (qo_ord_date <= ord1 or ord1 = ?)      and
   (qo_lang >= lang and qo_lang <= lang1)
no-lock by qo_nbr with frame b no-box:

   /* Check to see if Customer has any blocked transactions */
   if blockedCustomer(input qo_cust,
                      input {&SO016},
                      input false,
                      input "") or

      blockedCustomer(input qo_bill,
                      input {&SO016},
                      input false,
                      input "") or

      blockedCustomer(input qo_ship,
                      input {&SO016},
                      input false,
                      input "")
   then next.

   assign
      first_line = yes
      termsdesc = "".

   {us/px/pxrun.i &PROC='getTermsDescription' &PROGRAM='adcrxr.p'
      &HANDLE=ph_adcrxr
      &PARAM="(input qo_cr_terms,
               output termsdesc)"}

   if (oldcurr <> qo_curr) or (oldcurr = "") then do:

      if qo_curr = gl_base_curr then
         rndmthd = gl_rnd_mthd.
      else do:
         /* GET ROUNDING METHOD FROM CURRENCY MASTER */
         {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
            "(input qo_curr,
              output rndmthd,
              output mc-error-number)"}
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=4}
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

      {us/sq/sqcurfmt.i}

      prepaid_fmt = prepaid_old.
      {us/bbi/gprun.i ""gpcurfmt.p""
         "(input-output prepaid_fmt,
           input rndmthd)"}

      ext_price_fmt = ext_price_old.
      {us/bbi/gprun.i ""gpcurfmt.p""
         "(input-output ext_price_fmt,
           input rndmthd)"}

      assign
         oldcurr = qo_curr.

   end. /*IF (OLDCURR <> QO_CURR) */

   qo_recno = recid(qo_mstr).

   assign
      billto = ""
      shipto = "".

   find ad_mstr where ad_mstr.ad_domain = global_domain
      and ad_addr = qo_cust
   no-lock no-wait no-error.

   if available ad_mstr then do:

      /* Assign values to addr and format */
      {us/mf/mfadfmt.i}

      assign
         billto[1] = addr[1]
         billto[2] = addr[2]
         billto[3] = addr[3]
         billto[4] = addr[4]
         billto[5] = addr[5]
         billto[6] = addr[6]
         billattn  = ad_attn
         billphn   = ad_phone.
/*grc338*/ {us/xf/xfaddr.i "billto"}

      for first cm_mstr where cm_domain = global_domain
         and cm_addr   = qo_cust
      no-lock: end.

      /* Format to customer's country */
      run setFormatForCountryCode in h_format
         (input cm_lang,
          input ad_mstr.ad_ctry).
   end.

   else do:

      for first usr_mstr where usr_userid = global_userid
      no-lock: end.

      /* Default format to user's locale */
      run setFormatForCountryCode in h_format
         (input global_user_lang,
          input usr_ctry_code).
   end.

   find ad_mstr where ad_mstr.ad_domain = global_domain
      and ad_addr = qo_ship
   no-lock no-wait no-error.

   if available ad_mstr then do:

      /* Assign values to addr and format */
      {us/mf/mfadfmt.i}

      assign
         shipto[1] = addr[1]
         shipto[2] = addr[2]
         shipto[3] = addr[3]
         shipto[4] = addr[4]
         shipto[5] = addr[5]
         shipto[6] = addr[6]
         shipattn  = ad_attn
         shipphn   = ad_phone.
/*grc338*/  {us/xf/xfaddr.i "shipto"}
   end.

   resale = "".

   find cm_mstr where cm_mstr.cm_domain = global_domain
      and cm_addr = qo_cust
   no-error.
   if available cm_mstr then
      resale = cm_resale.

   {us/sq/sq05a01.i} /* Heading addr frame. Like so05a01.i */
   {us/sq/sq05c01.i} /* Rest of heading frame. Like so05c01.i */

   hide frame phead1.
   view frame phead1.

   pages = page-number - 1.

   hide frame phead2.

   display
      qo_cust
      qo_ship
      billto[1] shipto[1] billto[2] shipto[2]
      billto[3] shipto[3] billto[4] shipto[4]
      billto[5] shipto[5] billto[6] shipto[6]
   with frame phead2.

   display
      billattn
      shipattn
      billphn
      shipphn
      qo_slspsn[1] qo_slspsn[2]
      qo_slspsn[3] qo_slspsn[4]
      qo_po
      qo_cr_terms
      qo_shipvia
      termsdesc
      qo_fob
      resale
      qo_rmks
   with frame phead3.

   hide frame phead3.

   if print_trlr then view frame continue.

   /* Print Comments */
   {us/gp/gpcmtprt.i &type=QO &id=qo_cmtindx &pos=3}

   put skip(1).
/*grc338*/ {us/xf/xfqp09m0.i}

   /*Establish the label for the display of discounts*/
   if disc_det_key <> "1" then do:
      find first lngd_det where lngd_dataset begins "soprint"
         and lngd_field = "det_disc_prnt"
         and lngd_lang  = global_user_lang
         and lngd_key1  = disc_det_key
      no-lock no-error.
      if available lngd_det then
         disc_prnt_label = lngd_translation.
   end.

   /*  GET QUOTE DETAIL  */
   assign
      ext_price_total    = 0.

   for each qod_det where qod_det.qod_domain = global_domain
      and qod_nbr = qo_nbr
   no-lock by qod_nbr by qod_line:

      assign
         desc1 = qod_desc
         desc2 = ""
         ext_price = qod_rel_chg * qod_price.

      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output ext_price,
           input rndmthd,
           output mc-error-number)"}

      /* ADDING ROUNDED AMOUNTS, NO NEED TO ROUND */
      ext_price_total = ext_price_total + ext_price.

      find pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = qod_part
      no-lock no-wait no-error.
      if available pt_mstr and desc1 = "" then
         assign
            desc1 = pt_desc1
            desc2 = pt_desc2.

      first_line = no.
      if page-size - line-counter < 3 then page.

      ext_price:format = ext_price_fmt.

      /* Display Line */
      {us/sq/sq05b01.i}

      if page-size - line-counter < 1 then do:
         page.
         {us/sq/sq05e01.i}
      end.

      put desc1 at 5.

      if desc2 > "" then do:
         if page-size - line-counter < 1 then do:
            page.
            {us/sq/sq05e01.i}
         end.
         put desc2 at 5.
      end.
/*grc338*/ {us/xf/xfqp09mb.i}

      /* PRINT OPTIONS AND FEATURES */
      if print_options then
      if can-find(first sob_det where sob_det.sob_domain = global_domain and
                        sob_nbr = "qod_det" + qo_nbr and
                        sob_line = qod_line)
      then do:

         /*Print discounts for parent item*/
/**grc338 COMMENTED PORTION BEGINS**
         {us/so/sopiprn1.i &doctype="2" &nbr=qod_nbr &line=qod_line
            &part=qod_part
            &parent="""" &feature="""" &opt=""""
            &qty=qod_rel_chg &list_price=qod_list_pr
            &net_price=qod_price
            &confg_disc="no"
            &command="~{us/sq/sq05e01.i~}"}
**grc338 COMMENTED PORTION ENDS**/
/**grc338 ADDED PORTION BEGINS**/
{us/xf/xfpiprn1.i &doctype="2" &nbr=qod_nbr &line=qod_line
            &part=qod_part
            &parent="""" &feature="""" &opt=""""
            &qty=qod_rel_chg &list_price=qod_list_pr
            &net_price=qod_price
            &confg_disc="no"
            &command="~{sq05e01.i~}"}
/**grc338 ADDED PORTION ENDS**/

         /* NEW STYLE sob_det RECORDS CONTAIN A
            SYMBOLIC REFERENCE IDENTIFIED BY BYTES 11-14 IN sob_serial
            sob_det RECORDS ARE USED FOR NEW STYLE QUOTES BY
            PREFIXING qo_nbr WITH "qod_det" INSTEAD OF USING qob_det.
            NEW STYLE sob_det RECORDS ARE FOR SALES QUOTES CREATED
            SINCE PATCH GK60.
         */
         order = "qod_det" + qo_nbr.
/**grc338 COMMENTED PORTION BEGINS**
         {us/bbi/gprun.i ""sqrp5a01.p""
            "(input """",
              input 0,
              input order,
              input qod_line)"}
**grc338 COMMENTED PORTION ENDS**/
/**grc338 ADDED PORTION BEGINS**/
 {us/bbi/gprun.i ""xfsq5a09.p""
            "(input """",
              input 0,
              input order,
              input qod_line)"}

/**grc338 ADDED PORTION ENDS**/
      end.

      /* Test for configured parent without components */
      if available pt_mstr then do:

         pm_code = pt_pm_code.

         find ptp_det where ptp_det.ptp_domain = global_domain
            and ptp_part = qod_part
            and ptp_site = qod_site
         no-lock no-error.

         if available ptp_det then
            pm_code = ptp_pm_code.

         if pm_code = "C" and
            not can-find(first sob_det where sob_domain = global_domain
                         and sob_nbr  = "qod_det" + qod_nbr
                         and sob_line = qod_line)
         then do:
/**grc338 COMMENTED PORTION BEGINS**
            {us/so/sopiprn1.i &doctype="2" &nbr=qod_nbr &line=qod_line
               &part=qod_part
               &parent="""" &feature="""" &opt=""""
               &qty=qod_rel_chg &list_price=qod_list_pr
               &net_price=qod_price
               &confg_disc="no"
               &command="~{us/sq/sq05e01.i~}"}
**grc338 COMMENTED PORTION ENDS**/
/**grc338 ADDED PORTION BEGINS**/
 {us/xf/xfpiprn1.i &doctype="2" &nbr=qod_nbr &line=qod_line
               &part=qod_part
               &parent="""" &feature="""" &opt=""""
               &qty=qod_rel_chg &list_price=qod_list_pr
               &net_price=qod_price
               &confg_disc="no"
               &command="~{sq05e01.i~}"}

/**grc338 ADDED PORTION ENDS**/
         end.
      end.

      /*Print global discounts for item/configuration*/
/**grc338 COMMENTED PORTION BEGINS**
      {us/so/sopiprn1.i &doctype="2" &nbr=qod_nbr &line=qod_line
         &part=qod_part
         &parent="""" &feature="""" &opt=""""
         &qty=qod_rel_chg &list_price=qod_list_pr
         &net_price=qod_price
         &confg_disc="yes"
         &command="~{us/sq/sq05e01.i~}"}

      {us/gp/gpcmtprt.i &type=QO &id=qod_cmtindx &pos=5
         &command="~{us/sq/sq05e01.i~}"}
**grc338 COMMENTED PORTION ENDS**/
/**grc338 ADDED PORTION BEGINS**/
      {us/xf/xfpiprn1.i &doctype="2"
                  &nbr=qod_nbr
                  &line=qod_line
                  &part=qod_part
                  &parent=""""
                  &feature=""""
                  &opt=""""
                  &qty=qod_rel_chg
                  &list_price=qod_list_pr
                  &net_price=qod_price
                  &confg_disc="yes"
       }
       {us/xf/xfcmtprt.i &type=QO
                   &id=qod_cmtindx &rectype=E}
/**grc338 ADDED PORTION ENDS**/

      {us/mf/mfrpchk.i}

   end. /* for each qod_det */

   /*Establish the label for the display of discounts*/
   if disc_sum_key <> "1" and
      disc_sum_key <> disc_det_key
   then do:
      find first lngd_det where lngd_dataset begins "soprint"
         and lngd_field   = "det_disc_prnt"
         and lngd_lang    = global_user_lang
         and lngd_key1    = disc_sum_key
      no-lock no-error.
      if available lngd_det then
         disc_prnt_label = lngd_translation.
      else
         disc_prnt_label = "".
   end.

   /*Print discount summary, delete disc wkfl records*/
  /*grc338 {us/so/sopiprn2.i} */
/*grc338*/ {us/xf/xfpiprn2.i}

   hide frame continue.

   /* Print Trailer */
   if print_trlr then do:
      put skip.
/**grc338 COMMENTED PORTION BEGINS**
      {us/bbi/gprun.i ""sqtr0501.p""}
      qo_prepaid:format = prepaid_fmt.
      if qo_prepaid <> 0 then
         display prepaid-lbl qo_prepaid with frame prepd.
**grc338 COMMENTED PORTION ENDS**/
/*grc338*/ /*PRINT TRAILER*/
/*grc338*/ {us/bbi/gprun.i ""xftr0501.p""}

   end.

   else do:
  
      if page-size - line-counter < 2 then page.

      underline ext_price_total with frame no_trailer.
      
      ext_price_total:format = ext_price_fmt.
        
      down 1 with frame no_trailer.

      display
         total-lbl
         ext_price_total
      with frame no_trailer.
/*grc338*/ {us/xf/xfqp09m5.i}

   end.

   {us/bbi/gprun.i ""sqqorp5a.p""}
   page.

end.

delete procedure hBlockedTransactionlibrary.
run resetFormat in h_format.
delete procedure h_format no-error.
