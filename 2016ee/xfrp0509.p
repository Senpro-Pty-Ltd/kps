/* xfrp0509.p  -  SALES ORDER PRINT                                           */
/* sorp0501.p  -  SALES ORDER PRINT                                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrp0509.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 5.0      LAST MODIFIED: 03/15/90   BY: MLB *B615**/
/* REVISION: 5.0      LAST MODIFIED: 03/30/90   BY: ftb *B642**/
/* REVISION: 5.0      LAST MODIFIED: 06/21/90   BY: MLB *B711**/
/* REVISION: 6.0      LAST MODIFIED: 07/05/90   BY: WUG *D043**/
/* REVISION: 6.0      LAST MODIFIED: 08/20/90   BY; MLB *B755**/
/* REVISION: 6.0      LAST MODIFIED: 12/13/90   BY: dld *D257**/
/* REVISION: 6.0      LAST MODIFIED: 12/27/90   BY: MLB *D238**/
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425**/
/* REVISION: 6.0      LAST MODIFIED: 12/16/91   BY: MLV *D962**/
/* REVISION: 7.0      LAST MODIFIED: 04/02/92   BY: dld *F322**/
/* REVISION: 7.0      LAST MODIFIED: 04/09/92   BY: emb *F369**/
/* REVISION: 7.0      LAST MODIFIED: 04/10/92   BY: dld *F358**/
/* REVISION: 7.2      LAST MODIFIED: 11/13/92   BY: tjs *G191**/
/* REVISION: 7.3      LAST MODIFIED: 12/02/92   BY: WUG *G383**/
/* REVISION: 7.3      LAST MODIFIED: 02/19/93   by: jms *G712**/
/* REVISION: 7.4      LAST MODIFIED: 07/20/93   by: bcm *H032**/
/* REVISION: 7.2      LAST MODIFIED: 01/05/94   by: dpm *FL18**/
/* REVISION: 7.3      LAST MODIFIED: 06/22/94   BY: WUG *GK60**/
/* REVISION: 7.2      LAST MODIFIED: 02/25/95   BY: aep *F0KF**/
/* REVISION: 7.4      LAST MODIFIED: 03/27/95   BY: kjm *F0NZ**/
/* REVISION: 7.4      LAST MODIFIED: 04/27/95   BY: rxm *F0PD**/
/* REVISION: 8.5      LAST MODIFIED: 02/24/95   BY: NTE *J042**/
/* REVISION: 8.5      LAST MODIFIED: 10/05/95   BY: srk *J08B**/
/* REVISION: 8.5      LAST MODIFIED: 07/13/95   BY: taf *J053**/
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: DAH *J0T0**/
/* REVISION: 8.5      LAST MODIFIED: 07/19/96   BY: taf *J0ZZ**/
/* REVISION: 8.5      LAST MODIFIED: 09/16/96   BY: *G2FH* Aruna Patil        */
/* REVISION: 8.5      LAST MODIFIED: 08/25/97   BY: *J1YJ* Aruna Patil        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* EvdGevel           */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 07/05/98   BY: *L024* Sami Kureishy      */
/* REVISION: 8.6E     LAST MODIFIED: 08/18/98   BY: *L064* Russ Witt          */
/* REVISION: 9.0      LAST MODIFIED: 11/16/98   BY: *J34M* Manish K.          */
/* REVISION: 9.0      LAST MODIFIED: 02/01/99   BY: *L0D5* Robin McCarthy     */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 08/14/99   BY: *N01Q* Michael Amaladhas  */
/* REVISION: 9.1      LAST MODIFIED: 07/30/99   BY: *N01B* John Corda         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/23/00   BY: *N0ND* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/13/00   BY: *N0RW* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 11/07/00   BY: *L15K* Kaustubh K         */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.27         BY: Katie Hilbert       DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.28         BY: Ellen Borden        DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.29         BY: Jean Miller         DATE: 12/05/01  ECO: *P039* */
/* Revision: 1.31         BY: Patrick Rowan       DATE: 03/15/01  ECO: *P00G* */
/* Revision: 1.34         BY: Jean Miller         DATE: 04/23/02  ECO: *P05M* */
/* Revision: 1.35         BY: Kedar Deherkar      DATE: 05/27/03  ECO: *N2G0* */
/* Revision: 1.37.1.1     BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.38         BY: Andrew Dedman       DATE: 08/22/05  ECO: *R01P* */
/* Revision: 1.39         BY: Prashant Menezes    DATE: 10/18/06  ECO: *P4ZB* */
/* Revision: 1.40         BY: Brian Wintz         DATE: 02/06/07  ECO: *R0C6* */
/* Revision: 1.41         BY: Jean Miller         DATE: 11/06/07  ECO: *P5X9* */
/* Revision: 1.42         BY: Jean Miller         DATE: 06/19/08  ECO: *R0VG* */
/* Revision: 1.44         BY: Dinesh Dubey        DATE: 07/07/08  ECO: *R0W3* */
/* Revision: 1.45         BY: Deepak Keni         DATE: 07/25/08  ECO: *P6Y9* */
/* Revision: 1.47         BY: Deepak Keni         DATE: 11/19/08  ECO: *R15M* */
/* Revision: 1.48         BY: Narayanaswami.K     DATE: 01/09/09  ECO: *Q1DS* */
/* Revision: 1.49         BY: Dilip Manawat       DATE: 10/03/08  ECO: *R15K* */
/* Revision: 1.50         BY: Sundeep Kalla       DATE: 05/27/09  ECO: *R1K4* */
/* Revision: 1.51         BY: Jean Miller         DATE: 11/23/09  ECO: *R1TW* */
/* Revision: QAD2016      BY: sxh    DATE: 09/04/16  ECO: *grc338* */
/* Revision: QAD2016      BY: sxh    DATE: 26/10/16  ECO: *grc338-1* */

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
{us/xf/xfso05u.i}
{us/xf/xftxtots.i}
{us/xf/xfdefa.i}
{us/xf/xfso05v.i}
/**grc338 ADDED PORTION BEGINS**/

/* PARAMETER TO FACILITATE DISPLAY OF "SIMULATION" */
/* TEXT IN REPORT HEADER                           */
define input parameter update_yn like mfc_logical no-undo.
define input parameter print_line_charges like mfc_logical no-undo.
define input parameter unprintedSoOnly    like mfc_logical  no-undo.
define input parameter p_conf_so_only     as logical        no-undo.

define new shared variable rndmthd like rnd_rnd_mthd.
define new shared variable so_recno as recid.
define new shared variable disc_prnt_label as character format "x(8)".

define shared variable cust like so_cust.
define shared variable cust1 like so_cust.
define shared variable nbr like so_nbr.
define shared variable nbr1 like so_nbr.
define shared variable ord like so_ord_date.
define shared variable ord1 like so_ord_date.
define shared variable company as character format "X(38)" extent 6.
define shared variable print_options as logical initial no label
   "Print Features and Options".
define shared variable addr as character format "x(38)" extent 6.
define shared variable lang like so_lang.
define shared variable lang1 like so_lang.
define shared variable print_trlr like mfc_logical initial no
   label "Print Sales Order Trailer".

define variable qty_open like sod_qty_ord format "->>>>>>9.9<<<<<"
   label "Qty Open".
define variable ext_price like sod_price label "Ext Price"
   format "->>>,>>>,>>9.99".
define variable desc1 like pt_desc1.
define variable desc2 like pt_desc2.
define variable pages as integer.
/*grc338 define variable billto as character format "x(38)" extent 6. */
/*grc338 define variable shipto as character format "x(38)" extent 6. */
define variable ext_price_total like ext_price.
define variable termsdesc as character format "x(40)" label "Description" no-undo.
define variable billattn like ad_attn.
define variable shipattn like ad_attn.
define variable billphn like ad_phone.
define variable shipphn like ad_phone.
define variable first_line as logical.
define variable prepaid-lbl as character format "x(12)".
define variable total-lbl as character format "x(12)".
define variable resale like cm_resale format "x(20)".
define variable so_printso like mfc_logical.
define variable cont_lbl as character format "x(10)" no-undo.
define variable h_format as handle no-undo.
define variable ext_price_fmt as character no-undo.
define variable ext_price_old as character no-undo.
define variable prepaid_fmt as character no-undo.
define variable prepaid_old as character no-undo.
define variable oldcurr like so_curr no-undo.
define variable hdl_disc_lbl as handle.
define variable hdl_sum_disc_lbl as handle.
define variable pm_code like pt_pm_code.
define variable net_price like sod_price .
define variable ext_line_charge as decimal initial 0
                 format "->>>>>>>>>>9.99" no-undo.
define variable c-add-line-charges as character format "x(32)" no-undo.
define variable hBlockedTransactionlibrary as handle no-undo.

define variable ext_line_fmt    as character no-undo.
define variable lcovatreglbl    as character format "x(12)" no-undo.
define variable lcovatreg       as character format "x(16)" no-undo.

/* CONSIGNMENT VARIABLES */
{us/so/socnvars.i}

define buffer ship for ad_mstr.
define buffer somstr for so_mstr.
define new shared frame c.

cont_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
                             input "CONTINUE", input 10, input '*').

/* Shared workfile for summary discounts */
{us/so/sodiscwk.i &new="new"}

{us/et/etvar.i}
{us/et/etrpvar.i &new="new"}
/*grc338 {us/et/etsotrla.i "NEW"} */
/*grc338*/ {us/xf/xfsotrla.i "NEW"}

{us/mg/mgbltrpl.i "hBlockedTransactionlibrary"}

/* VARIABLE DEFINITIONS FOR gpfile.i */
{us/bbi/gpfilev.i}

form
   space(46)
   total-lbl
   space(4)
   ext_price_total
with frame no_trailer down width 80 no-labels no-box.

hdl_disc_lbl     = prnt_disc_amt:handle in frame disc_print.
hdl_sum_disc_lbl = prnt_sum_disc_amt:handle in frame disc_sum_print.

/* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
/**grc338 COMMENTED PORTION BEGINS**
assign
   nontax_old      = nontaxable_amt:format
   taxable_old     = taxable_amt:format
   line_tot_old    = line_total:format
   disc_old        = disc_amt:format
   trl_amt_old     = so_trl1_amt:format
   tax_amt_old     = tax_amt:format
   ord_amt_old     = ord_amt:format
   container_old   = container_charge_total:format
   line_charge_old = line_charge_total:format.
**grc338 COMMENTED PORTION ENDS**/

form
   prepaid-lbl at 2
   so_prepaid
with frame prepd width 80 no-labels.

{us/bbi/gprun.i ""gpctryfmt.p"" "persistent set h_format"}

{us/so/so05f01.i}               /* INCLUDE FILE FOR FRAME C */

/* SET PREPAID OLD TO PREPAID:FORMAT AND EXT_PRICE:FORMAT */
assign
   prepaid_old = so_prepaid:format
   ext_price_old = ext_price:format.

/* DEFINE THE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtecdf.i &var="shared"}
{us/gp/gpvtepdf.i &var=" "}

/*DETERMINE IF CONTAINER AND LINE CHARGES ARE ENABLED*/
{us/cc/cclc.i}

/* DETERMINE IF CUSTOMER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ENABLE_CUSTOMER_CONSIGNMENT,
     input 10,
     input ADG,
     input CUST_CONSIGN_CTRL_TABLE,
     output using_cust_consignment)"}

assign
   c-add-line-charges = "*** " + getTermLabel("ADDITIONAL_LINE_CHARGES",24)
                        + " ***"
   container_charge_total = 0
   line_charge_total = 0
   ext_line_charge = 0
   pages = 0.

/* start blocked transaction library to run persistently */
run mfairunh.p
   (input "mgbltrpl.p",
    input  ?,
    output hBlockedTransactionlibrary).

assign lcovatreglbl = covatreglbl
       lcovatreg    = covatreg.

for each so_mstr  where so_mstr.so_domain = global_domain
   and (so_nbr >= nbr and so_nbr <= nbr1 )
   and (so_cust >= cust and so_cust <= cust1)
   and (so_ord_date >= ord or ord = ?)
   and (so_ord_date <= ord1 or ord1 = ?)
   and (so_lang >= lang and so_lang <= lang1)
   and not so_sched
   and so_fsm_type = ""
   and so_compl_stat = ""
no-lock by so_nbr with frame b no-box:

   /* If so has been printed and only print unprinted so then skip thie one*/
   if not so_print_so and unprintedSoOnly then next.

   /* Check to see if Customer has any blocked transactions */
   if blockedCustomer(input so_cust,
                      input {&SO002},
                      input false,
                      input "") or

      blockedCustomer(input so_bill,
                      input {&SO002},
                      input false,
                      input "") or

      blockedCustomer(input so_ship,
                      input {&SO002},
                      input false,
                      input "")
   then next.

   if p_conf_so_only
   then do:
      if can-find(first sod_det
                     where sod_domain  = global_domain
                     and   sod_nbr     = so_nbr
                     and   sod_confirm = no)
      then
         next.
   end. /* IF p_conf_so_only */

   assign
      so_recno = recid(so_mstr).

   /* DO LOOP ADDED TO SKIP LOCKED SO_MSTR RECORDS */

   if update_yn = yes
   then do:

      do transaction on error undo , leave on endkey undo , leave:
         do for somstr:

            find somstr where so_recno = recid(somstr)
            exclusive-lock no-wait no-error.

            if (available somstr and not locked somstr) then
               so_printso = yes.
            else
               so_printso = no.

         end.

         if so_printso = no then next.
      end.

   end.

   do transaction:

      if (oldcurr <> so_curr) or (oldcurr = "") then do:
         /*** GET ROUNDING METHOD FROM CURRENCY MASTER **/
         {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
            "(input so_curr,
              output rndmthd,
              output mc-error-number)"}
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.

         /* DETERMINE CURRENCY DISPLAY AMERICAN OR EUROPEAN  */
         find rnd_mstr where rnd_rnd_mthd = rndmthd no-lock no-error.
         if not available rnd_mstr then do:
            /* ROUND METHOD RECORD NOT FOUND */
            {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=4}
            next.
         end.

         prepaid_fmt = prepaid_old.
         {us/bbi/gprun.i ""gpcurfmt.p""
            "(input-output prepaid_fmt,
              input rndmthd)"}

         /* SETUP THE FORMAT FOR DISPLAING EXT_PRICE_TOTAL - USE GPCURFMT.P */
         ext_price_fmt = ext_price_old.
         {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output ext_price_fmt,
                                   input rndmthd)"}

         {us/so/socurfmt.i} /* SET UP TRAILER FORMATS */

         assign oldcurr = so_curr.

      end. /* IF (OLDCURR <> SO_CURR) */

      assign
         first_line = yes
         termsdesc  = "".

      {us/px/pxrun.i &PROC='getTermsDescription' &PROGRAM='adcrxr.p'
         &HANDLE=ph_adcrxr
         &PARAM="(input so_cr_terms,
                  output termsdesc)"}

      so_recno = recid(so_mstr).

      /* ASSIGN COMPANY VAT REG */
      assign covatreglbl = lcovatreglbl
             covatreg    = lcovatreg.

      /*CHECK IF SITE COMPANY ADDRESS HAS A STATE TAX ID */
      for first ad_mstr 
         where ad_domain = global_domain 
           and ad_addr   = so_site 
      no-lock:
         if     ad_pst_id <> "":U 
            and ad_pst_id <> ? 
            and can-find (first ls_mstr 
                             where ls_domain = global_domain
                               and ls_addr   = ad_addr
                               and ls_type   = "company")
         then do:
            /* FIND VAT REG. NO & COUNTRY CODE */
            {us/gp/gpvtecrg.i}
         end.   /* IF     ad_pst_id */
      end.   /* FOR FIRST ad_mstr  */

      assign
         billto = ""
         shipto = "".

      /*grc338-1 add begin*/
      assign
         billto_city  = ""
         billto_state = ""
         billto_zip   = ""
         billto_attn  = ""
         billto_fax   = ""
         billto_phn   = "".
      /*grc338-1 add end*/


      find ad_mstr where ad_domain = global_domain and /*grc338 ad_addr = so_cust*/
/*grc338*/ ad_addr = so_bill
      no-lock no-wait no-error.

      if available ad_mstr then do:

         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
/*grc338*/ addr[5] = "".

/*grc338-1
         assign
            billto[1] = addr[1]
            billto[2] = addr[2]
            billto[3] = addr[3]
            billto[4] = addr[4]
            billto[5] = addr[5]
            billto[6] = addr[6]
*/

/* grc-1 */
         {us/mf/mfcsz.i billto[5] ad_city ad_state ad_zip}
         assign
            billto[1] = ad_mstr.ad_name
            billto[2] = ad_line1
            billto[3] = ad_line2
            billto[4] = ad_line3
            billto[6] = ad_country
            billto_attn = ad_attn
            billto_phn = ad_phone
            billto_city = ad_city
            billto_state = ad_state
            billto_fax   = ad_fax
            billto_zip = ad_zip.
/**grc338-1 */

         for first cm_mstr where cm_domain = global_domain
            and cm_addr = so_cust
         no-lock: end.

         /* Format to customer's country */
         run setFormatForCountryCode in h_format
            (input cm_lang, input ad_mstr.ad_ctry).

      end.

      /* Default format to User's Locale */
      else do:
         for first usr_mstr where usr_userid = global_userid
         no-lock: end.
         run setFormatForCountryCode in h_format
            (input global_user_lang, input usr_ctry_code).
      end.

      find ad_mstr where ad_domain = global_domain and ad_addr = so_ship
      no-lock no-wait no-error.

     /*grc338-1*/
        assign
            shipto_attn = ""
            shipto_phn = ""
            shipto_city = ""
            shipto_state = ""
            shipto_fax = ""
            shipto_zip = "".
     /*grc338-1*/


      if available ad_mstr then do:

         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}

/*grc338*/ addr[5] = "".

         {us/mf/mfcsz.i shipto[5] ad_city ad_state ad_zip}
         assign
/* grc338-1
            shipto[1] = addr[1]
            shipto[2] = addr[2]
            shipto[3] = addr[3]
            shipto[4] = addr[4]
            shipto[5] = addr[5]
            shipto[6] = addr[6]
*/
            shipto[1] = ad_name
            shipto[2] = ad_line1
            shipto[3] = ad_line2
            shipto[4] = ad_line3
            shipto[6] = ad_country

/**grc338 COMMENTED PORTION BEGINS**
            shipattn = ad_attn
            shipphn = ad_phone.
**grc338 COMMENTED PORTION ENDS**/

/**grc338 ADDED PORTION BEGINS**/
            shipto_attn = ad_attn
            shipto_phn = ad_phone
            shipto_city = ad_city
            shipto_state = ad_state
            shipto_fax = ad_fax /*grc338-1*/
            shipto_zip = ad_zip.

/**grc338 ADDED PORTION ENDS**/
      end.
/**grc338 ADDED PORTION BEGINS**/
      for first ad_mstr
         where ad_domain = global_domain
         and   ad_addr = so_cust
         no-lock:
      end.  /* FOR FIRST ad_mstr */
      if available ad_mstr
      then do:
         assign
            soldto[1] = ad_name
            soldto[2] = ad_line1
            soldto[3] = ad_line2
            soldto[4] = ad_line3
            soldto[5] = ""
            soldto[6] = ad_country
            soldto_city = ad_city
            soldto_state = ad_state
            soldto_zip = ad_zip
            soldto_fax = ad_fax.
      end.  /* IF AVAILABLE ad_mstr */
/**grc338 ADDED PORTION ENDS**/

      /* GET VAT REG NO AND COUNTRY CODE FOR SHIP-TO */
      find ad_mstr where ad_domain = global_domain
         and ad_addr = so_ship
      no-lock no-wait no-error.

      if available ad_mstr
      then do:
         vatreg1 = "".
         for first cm_mstr
           where cm_domain = global_domain
           and   cm_addr   = so_cust
         no-lock:
         end.
         if available cm_mstr
         then
           vatreg1 = if  so_cust <> so_ship
                     then substring(ad_pst_id,1,15)
                     else substring(cm_pst_id,1,15).

         if ad_pst_id = "" then do:
            find ad_mstr where ad_domain = global_domain
               and ad_addr = so_bill
            no-lock no-wait no-error.
            if available ad_mstr then do:
               {us/gp/gpvteprg.i}
            end.
         end.
         else do:
            {us/gp/gpvteprg.i}
         end.
      end.

      resale = "".

      find cm_mstr where cm_mstr.cm_domain = global_domain
         and cm_addr = so_cust
      no-lock no-error.
      if available cm_mstr then
         resale = cm_resale.
/**grc338 COMMENTED PORTION BEGINS**

      {us/so/so05a01.i}
      {us/so/so05c01.i}

      hide frame phead1.
      view frame phead1.

      pages = page-number - 1.

      hide frame phead2.

      do with frame phead2:
         /* SET EXTERNAL LABELS */
         setFrameLabels(frame phead2:handle).
         display
            so_cust
            so_ship
            billto[1] shipto[1]
            billto[2] shipto[2]
            billto[3] shipto[3]
            billto[4] shipto[4]
            billto[5] shipto[5]
            billto[6] shipto[6]
         with frame phead2.
      end. /* do with */

      /* DISPLAY VAT REG NO & COUNTRY CODE */
      put
         covatreglbl to 15 space(1)
         covatreg
         vatreglbl   to 59 space(1)
         vatreg
         skip.

      do:
         /* SET EXTERNAL LABELS */
         setFrameLabels(frame phead3:handle).
         display
            billattn shipattn
            billphn shipphn
            so_slspsn[1]
            so_slspsn[2]
            so_slspsn[3]
            so_slspsn[4]
            so_po
            so_cr_terms
            so_shipvia
            termsdesc
            so_fob
            resale
            so_rmks
         with frame phead3.
         hide frame phead3.
      end.

      if print_trlr then
         view frame continue.
**grc338 COMMENTED PORTION ENDS**/
/*grc338*/ {us/xf/xfrp0509m0.i}

    /*grc338  {us/gp/gpcmtprt.i &type=SO &id=so_cmtindx &pos=3} */
/*grc338*/ {us/xf/xfcmtprt.i &type=SO &rectype=A &id=so_cmtindx &usercode="us/xf/xfso05ua.i"}

/*grc338 put skip(1). */

      /*Establish the label for the display of discounts*/
      if disc_det_key <> "1" then do:
         find first lngd_det where lngd_dataset begins "soprint"
            and lngd_field   = "det_disc_prnt"
            and lngd_lang    = global_user_lang
            and lngd_key1    = disc_det_key
         no-lock no-error.
         if available lngd_det then
            disc_prnt_label = lngd_translation.
      end.

      /* GET ORDER DETAIL*/
      assign
         ext_price_total = 0.

      for each sod_det where sod_domain = global_domain
         and sod_nbr = so_nbr
         and not sod_sched
         and sod_compl_stat = ""
      no-lock by sod_nbr by sod_line:

         assign
            desc1 = sod_desc
            desc2 = ""
            net_price = sod_price
            qty_open = sod_qty_ord - sod_qty_ship
            ext_price = qty_open * net_price.

         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output ext_price,
              input rndmthd,
              output mc-error-number)"}

         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.

         ext_price_total = ext_price_total + ext_price.

         desc1 = sod_desc.
         find pt_mstr where pt_domain = global_domain and pt_part = sod_part
         no-lock no-wait no-error.

         if available pt_mstr then do:

            if desc1 = "" then
            assign
               desc1 = pt_desc1
               desc2 = pt_desc2.
         end.

         first_line = no.
/**grc338 COMMENTED PORTION BEGINS**
         if page-size - line-counter < 3 then page.

         ext_price:format = ext_price_fmt.
         {us/so/so05b01.i} /*Display Line*/

         if page-size - line-counter < 1 then do:
            page.
            {us/so/so05e01.i}
         end.
         put desc1 at 5 skip.

         if desc2 > "" then do:
            if page-size - line-counter < 1 then do:
               page.
               {us/so/so05e01.i}
            end.
            put desc2 at 5 skip.
         end.
**grc338 COMMENTED PORTION ENDS**/

/*grc338*/ {us/xf/xfrp0509mb.i}
         if using_cust_consignment then do:
            consign_flag = no.
            {us/gp/gprunmo.i
               &program = "socnsod1.p"
               &module = "ACN"
               &param = """(input so_nbr,
                            input sod_line,
                            output consign_flag,
                            output consign_loc,
                            output intrans_loc,
                            output max_aging_days,
                            output auto_replenish)"""}
/**grc338 COMMENTED PORTION BEGINS**
            if consign_flag then do:
               if page-size - line-counter < 1 then do:
                  page.
                  {us/so/so05e01.i}
               end.
               put "Contract: Consignment Inventory" at 5 skip.
            end.
**grc338 COMMENTED PORTION ENDS**/
         end.  /* if using_cust_consignment */

         if using_line_charges and print_line_charges then do:

            line_charge_total = 0.

            for each sodlc_det where sodlc_domain = global_domain and
               sodlc_order = sod_nbr and
               sodlc_ord_line = sod_line
            no-lock break by sodlc_order:

               if sodlc_one_time and sodlc_times_charged > 0 then
                  next.
               else do:
                  ext_line_charge = sodlc_ext_price.

                  /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                     "(input-output ext_line_charge,
                       input rndmthd,
                       output mc-error-number)"}
                  if mc-error-number <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                  end.

                  assign
                     line_charge_total = line_charge_total + ext_line_charge
                     ext_price_total = ext_price_total + ext_line_charge
                     line_total = line_total + ext_line_charge.

                  for first trl_mstr where trl_mstr.trl_domain = global_domain
                     and trl_code = sodlc_trl_code
                  no-lock: end.

                  if available trl_mstr then do:
                     if trl_taxable then
                         taxable_amt = taxable_amt + ext_line_charge.
                     else
                         nontaxable_amt = nontaxable_amt + ext_line_charge.
                  end. /*IF AVAILABLE TRL_MSTR*/
/**grc338 COMMENTED PORTION BEGINS**
                  if page-size - line-count < 1 then do:
                     page.
                     {us/so/so05e01.i}
                  end.

                  if first-of(sodlc_order) then do:
                     put c-add-line-charges at 19 skip.
                  end. /* IF FIRST-OF(SODLC_ORDER)*/
       
                  ext_line_fmt = "->>>>>>>>>>9.99".
                  {us/bbi/gprun.i ""gpcurfmt.p""
                     "(input-output ext_line_fmt,
                     input rndmthd)"}
                     
                  if last-of(sodlc_order) then do:
                     put trl_desc          at 15.
                     put unformatted 
                        string(ext_line_charge,ext_line_fmt)   to 59
                        string(line_charge_total,ext_line_fmt) to 77.
                     put skip(1).
                  end. /* IF LAST-OF*/

                  else do:
                     put trl_desc          at 15.
                     put unformatted
                     string(ext_line_charge,ext_line_fmt)   to 59
                     skip.
                  end. /*ELSE DO*/
**grc338 COMMENTED PORTION ENDS**/
/*grc338*/ {us/xf/xfrp0509mw.i}

               end. /*ELSE DO*/

            end. /* FOR EACH SODLC_DET*/

         end. /*IF USING_LINE_CHARGES*/

         /********************************************
          sob_serial subfield positions:
          1-4     operation number (old - now 0's)
          5-10    scrap percent
          11-14   id number of this record
          15-15   structure code
          16-16   "y" (indicates "new" format sob_det record)
          17-34   original qty per parent
          35-35   original mandatory indicator (y/n)
          36-36   original default indicator (y/n)
          37-39   leadtime offset
          40-40   price manually updated (y/n)
          41-46   operation number (new - 6 digits)
         *******************************************/

         if print_options and
            can-find(first sob_det where sob_domain = global_domain
                                     and sob_nbr = so_nbr
                                     and sob_line = sod_line)
         then do:

            /*ADDED TILDE BEFORE CURLY BRACES SO FILE WOULD COMPILE*/
            /* Print discounts for parent item */
/**grc338 COMMENTED PORTION BEGINS**
            {us/so/sopiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
               &part=sod_part
               &parent="""" &feature="""" &opt=""""
               &qty=qty_open &list_price=sod_list_pr
               &net_price=sod_price
               &confg_disc="no"
               &command="~{us/so/so05e01.i~}"}
**grc338 COMMENTED PORTION ENDS**/
/**grc338 ADDED PORTION BEGINS**/
            {us/xf/xfpiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
               &part=sod_part
               &parent="""" &feature="""" &opt=""""
               &qty=qty_open &list_price=sod_list_pr
               &net_price=sod_price
               &confg_disc="no"
            }
/**grc338 ADDED PORTION ENDS**/

            find first sob_det where sob_domain = global_domain
               and sob_nbr = sod_nbr
               and sob_line = sod_line
            no-lock no-error.

            /* NEW STYLE sob_det CONTAIN A
               SYMBOLIC REFERENCE IDENTIFIED BY BYTES 11-14 IN sob_serial.
            */
/**grc338 COMMENTED PORTION BEGINS**
            {us/bbi/gprun.i ""sorp5a01.p""
               "(input """", input 0,
                 input sod_nbr, input sod_line)"}
**grc338 COMMENTED PORTION ENDS**/

/**grc338 ADDED PORTION BEGINS**/
            {us/bbi/gprun.i ""xfrp5a09.p""
                        "(input """", input 0,
                          input sod_nbr, input sod_line)"}
/**grc338 ADDED PORTION ENDS**/

         end.

         /*ADDED TILDE BEFORE CURLY BRACES SO FILE WOULD COMPILE*/
         /* Test for configured parent without components */
         if available pt_mstr then do:

            pm_code = pt_pm_code.

            find ptp_det where ptp_domain = global_domain
               and ptp_part = sod_part
               and ptp_site = sod_site
            no-lock no-error.
            if available ptp_det then
               pm_code = ptp_pm_code.
            if pm_code = "C" and
               not can-find(first sob_det where
                            sob_domain = global_domain
                        and sob_nbr  = sod_nbr
                        and sob_line = sod_line)
            then do:
/**grc338 COMMENTED PORTION BEGINS**
               {us/so/sopiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
                  &part=sod_part
                  &parent="""" &feature="""" &opt=""""
                  &qty=qty_open &list_price=sod_list_pr
                  &net_price=sod_price
                  &confg_disc="no"
                  &command="~{us/so/so05e01.i~}"}
**grc338 COMMENTED PORTION ENDS**/
/**grc338 ADDED PORTION BEGINS**/
               {us/xf/xfpiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
                  &part=sod_part
                  &parent="""" &feature="""" &opt=""""
                  &qty=qty_open &list_price=sod_list_pr
                  &net_price=sod_price
                  &confg_disc="no"
                  &usercode="us/xf/xfso05uq.i"
                               }
/**grc338 ADDED PORTION ENDS**/

            end.
         end.

         if     disc_det_key <> "1"
            or  disc_sum_key <> "1"
         then do:
/**grc338 COMMENTED PORTION BEGINS**
            /* Print global discounts for item/configuration */
            {us/so/sopiprn1.i &doctype    = "1"
                        &nbr        = sod_nbr
                        &line       = sod_line
                        &part       = sod_part
                        &parent     = """"
                        &feature    = """"
                        &opt        = """"
                        &qty        = qty_open
                        &list_price = sod_list_pr
                        &net_price  = sod_price
                        &confg_disc = "yes"
                        &command    = "~{us/so/so05e01.i~}"}
**grc338 COMMENTED PORTION ENDS**/

/**grc338 ADDED PORTION BEGINS**/
            {us/xf/xfpiprn1.i &doctype="1"
                        &nbr=sod_nbr
                        &line=sod_line
                        &part=sod_part
                        &parent=""""
                        &feature=""""
                        &opt=""""
                        &qty=qty_open
                        &list_price=sod_list_pr
                        &net_price=sod_price
                        &confg_disc="yes"
                        &usercode="us/xf/xfso05uq.i"
                }
/**grc338 ADDED PORTION ENDS**/

         end. /* IF disc_det_key <> "1" and disc_sum_key <> "1" */

         /*ADDED TILDE BEFORE CURLY BRACES SO FILE WOULD COMPILE*/
        /*grc338 {us/gp/gpcmtprt.i &type=SO &id=sod_cmtindx &pos=5
            &command="~{us/so/so05e01.i~}"} */
/*grc338*/ {us/xf/xfcmtprt.i &type=SO
                       &rectype=D
                       &id=sod_cmtindx
                       &usercode="us/xf/xfso05ud.i"}

         {us/mf/mfrpchk.i}

      end. /* for each sod_det */

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

      /* Print discount summary, delete disc wkfl records */
    /*grc338  {us/so/sopiprn2.i} */
/*grc338*/ {us/xf/xfpiprn2.i &usercode="us/xf/xfso05ur.i"}

      hide frame continue.

      if print_trlr then do:
  
         /*PRINT TRAILER*/
       /*grc338  {us/bbi/gprun.i ""sotr0501.p""} */
/*grc338*/ {us/bbi/gprun.i ""xftr0509.p""}

         if so_prepaid <> 0
         then do with frame prepd:
            so_prepaid:format = prepaid_fmt.
            display prepaid-lbl so_prepaid with frame prepd.
         end.
      end.

      else do:

         if page-size - line-counter < 2 then page.
         underline ext_price_total with frame no_trailer.
         ext_price_total:format in frame no_trailer = ext_price_fmt.

         down 1 with frame no_trailer.
         display
            total-lbl
            ext_price_total
         with frame no_trailer.

      end.

      if update_yn
      then do:
         {us/bbi/gprun.i ""sosorp5a.p""}
      end. /* if update_yn */

/*grc338 page. */

   end.

end.

delete procedure hBlockedTransactionlibrary no-error.
run resetFormat in h_format.
delete procedure h_format no-error.
