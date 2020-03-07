/* xfsorp05.p  -  SALES ORDER PRINT                                           */
/* sosorp05.p  -  SALES ORDER PRINT                                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsorp05.p,v 1.2 2018/03/13 17:09:54 gbg Exp $: */
/* REVISION: 1.0      LAST MODIFIED: 05/13/86   BY: PML                       */
/* REVISION: 1.0      LAST MODIFIED: 08/29/86   BY: EMB *12*                  */
/* REVISION: 4.0     LAST EDIT: 12/30/87        BY: WUG *A137*                */
/*                                   10/06/86       pml *31*                  */
/*           2.0                     12/23/86       pml *A8*                  */
/* REVISION: 2.0      LAST MODIFIED: 07/17/87   BY: EMB *A23*                 */
/* REVISION: 2.1      LAST MODIFIED: 07/30/87   BY: WUG *A78*                 */
/* REVISION: 2.1      LAST MODIFIED: 10/20/87   BY: WUG *A94*                 */
/* REVISION: 4.0      LAST MODIFIED: 12/18/87   BY: pml *A113                 */
/* REVISION: 4.0      LAST MODIFIED: 01/11/88   BY: RL  *A136*                */
/* REVISION: 4.0      LAST MODIFIED: 02/09/88   BY: pml *A119*                */
/* REVISION: 4.0      LAST MODIFIED: 02/19/88   BY: WUG *A177*                */
/* REVISION: 4.0      LAST MODIFIED: 02/29/88   BY: WUG *A175*                */
/* REVISION: 4.0      LAST MODIFIED: 05/24/88   BY: flm *A251*                */
/* REVISION: 4.0      LAST MODIFIED: 12/02/88   BY: MLB *A547*                */
/* REVISION: 4.0      LAST MODIFIED: 01/11/89   BY: emb *A596*                */
/* REVISION: 5.0      LAST MODIFIED: 01/12/89   BY: MLB *A608*                */
/* REVISION: 5.0      LAST MODIFIED: 03/02/89   BY: MLB *B056*                */
/* REVISION: 5.0      LAST MODIFIED: 04/07/89   BY: WUG *B094*                */
/* REVISION: 5.0      LAST MODIFIED: 05/25/89   BY: MLB *B123*                */
/* REVISION: 5.0      LAST MODIFIED: 06/10/89   BY: MLB *B130*                */
/* REVISION: 4.0      LAST MODIFIED: 06/27/89   BY: MLB *A751*                */
/* REVISION: 5.0      LAST MODIFIED: 10/16/89   BY: MLB *B342,B344*           */
/* REVISION: 5.0      LAST MODIFIED: 11/22/89   BY: WUG *B402*                */
/* REVISION: 5.0      LAST MODIFIED: 02/12/90   BY: ftb *B564*                */
/* REVISION: 5.0      LAST MODIFIED: 03/15/90   BY: MLB *B615*                */
/* REVISION: 5.0      LAST MODIFIED: 03/30/90   BY: ftb *B642*                */
/* REVISION: 6.0      LAST MODIFIED: 11/12/90   BY: MLB *D200*                */
/* REVISION: 6.0      LAST MODIFIED: 12/13/90   BY: dld *D257*                */
/* REVISION: 6.0      LAST MODIFIED: 12/27/90   BY: MLB *D238*                */
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425*                */
/* REVISION: 7.0      LAST MODIFIED: 09/17/91   BY: MLV *F015*                */
/* REVISION: 7.0      LAST MODIFIED: 03/18/92   BY: TMD *F263*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 04/02/92   BY: dld *F322*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 04/08/92   BY: tmd *F367*   (rev only)   */
/* REVISION: 7.0      LAST MODIFIED: 04/06/92   BY: dld *F358*                */
/* REVISION: 7.0      LAST MODIFIED: 04/30/92   BY: tmd *F458*   (rev only)   */
/* REVISION: 7.3      LAST MODIFIED: 11/13/92   BY: tjs *G191*   (rev only)   */
/* REVISION: 7.3      LAST MODIFIED: 02/19/93   by: jms *G712*                */
/* REVISION: 7.3      LAST MODIFIED: 03/17/93   BY: afs *G820*   (rev only)   */
/* REVISION: 7.4      LAST MODIFIED: 07/20/93   BY: bcm *H032*   (rev only)   */
/* REVISION: 7.3      LAST MODIFIED: 10/18/94   BY: jzs *GN91*                */
/* REVISION: 7.4      LAST MODIFIED: 04/12/95   BY: jpm *H0CH*                */
/* REVISION: 8.5      LAST MODIFIED: 03/06/95   BY: nte *J042*                */
/* REVISION: 7.4      LAST MODIFIED: 05/15/95   BY: jym *G0MP*                */
/* REVISION: 7.4      LAST MODIFIED: 10/09/95   BY: jym *G0XY*                */
/* REVISION: 8.5      LAST MODIFIED: 04/26/96   BY: jpm *J0KK*                */
/* REVISION: 7.4      LAST MODIFIED: 02/05/98   BY: *H1JC* Jean Miller        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* EvdGevel           */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 7.3      LAST MODIFIED: 07/15/98   BY: *L03Y* Dariusz Sidel      */
/* REVISION: 8.6E     LAST MODIFIED: 07/14/98   BY: *L024* Steve Goeke        */
/* REVISION: 9.0      LAST MODIFIED: 11/23/98   BY: *J358* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 02/06/99   BY: *M06R* Doug Norton        */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 07/30/99   BY: *N01B* John Corda         */
/* REVISION: 9.1      LAST MODIFIED: 09/28/99   BY: *L0J4* Satish Chavan      */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 07/20/00   BY: *M0PQ* Falguni Dalal      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* Revision: 1.27    BY: Katie Hilbert           DATE: 04/01/01  ECO: *P002*  */
/* Revision: 1.28    BY: Dan Herman              DATE: 07/06/01  ECO: *P007*  */
/* Revision: 1.29    BY: Ashwini G.              DATE: 01/10/02  ECO: *L194*  */
/* Revision: 1.30    BY: Jean Miller             DATE: 05/13/02  ECO: *P05V*  */
/* Revision: 1.32    BY: Dorota Hohol            DATE: 02/25/03  ECO: *P0N6*  */
/* Revision: 1.34    BY: Paul Donnelly (SB)      DATE: 06/28/03  ECO: *Q00L*  */
/* Revision: 1.35    BY: SurenderSingh Nihalani  DATE: 02/25/05  ECO: *P343*  */
/* Revision: 1.37    BY: Jayesh Sawant           DATE: 06/30/06  ECO: *P4W6*  */
/* Revision: 1.38    BY: Prashant Menezes        DATE: 10/18/06  ECO: *P4ZB*  */
/* Revision: 1.40    BY: Jean Miller             DATE: 10/07/08  ECO: *R15M*  */
/* $Revision: 1.2 $ BY: Jean Miller             DATE: 11/23/09  ECO: *R1TW*  */
/* Revision: QAD2016    BY: sxh     DATE: 16/05/16  ECO: *grc338*  */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/mf/mfdtitle.i}
/**grc338 ADDED PORTION BEGINS**/
{us/xf/xfdefa.i "new"}        /*General FT vars */
{us/xf/xfso05v.i "new"} /*Global formtrap vars */
{us/xf/xfso05u.i "new"} /*user formtrap vars */
/**grc338 ADDED PORTION ENDS**/

define new shared variable cust  like so_cust.
define new shared variable cust1 like so_cust.
define new shared variable nbr  like so_nbr.
define new shared variable nbr1 like so_nbr.
define new shared variable ord  like so_ord_date.
define new shared variable ord1 like so_ord_date.
define new shared variable company as character format "x(38)" extent 6.
define new shared variable print_options like mfc_logical
   initial no label "Print Features and Options".
define new shared variable addr as character format "x(38)" extent 6.
define new shared variable lang like so_lang.
define new shared variable lang1 like so_lang.
define new shared variable print_trlr like mfc_logical initial no
   label "Print Sales Order Trailer".
define new shared variable bump_rev like mfc_logical initial true
   label "Increment Order Revision".
define new shared variable disc_det_key  like lngd_key1 initial "1".
define new shared variable disc_sum_key  like lngd_key1 initial "1".
define new shared variable print_line_charges like mfc_logical
   label "Print Additional Line Charges" initial no no-undo.
 
define new shared variable l_cr_ord_amt   as   decimal no-undo.
 
define variable disc_det like lngd_translation label "Discount Detail" no-undo.
define variable disc_sum like disc_det         label "Discount Summary" no-undo.
define variable comp_addr like soc_company no-undo.
define variable update_yn like mfc_logical initial yes label "Update" no-undo.
define variable unprintedSoOnly like mfc_logical initial yes label "Unprinted SOs Only" no-undo.
define variable form_code as character format "x(2)" label "Form Code" no-undo.
define variable run_file as character format "x(12)" no-undo.
define variable c-lngd-dataset like lngd_det.lngd_dataset
   initial "soprint.p" no-undo.
define variable report_width like mfc_integer. /*grc338*/
define variable l_status like mfc_logical no-undo.
define variable conf_so_only  like mfc_logical label "Confirmed SO's Only" no-undo.

{us/bbi/gpfilev.i} /* VARIABLE DEFINITIONS FOR gpfile.i */
 
/* DEFINE VARIABLES FOR VAT REG NO & COUNTRY CODE */
{us/gp/gpvtecdf.i &var="new shared"}
 
/* FACILITATE UPDATE FLAG AS REPORT INPUT CRITERIA, TO */
/* ELIMINATE USER INTERACTION AT THE END OF REPORT     */
 
form
   nbr                colon 20
   nbr1               label "To" colon 49 skip
   cust               colon 20
   cust1              label "To" colon 49 skip
   ord                colon 20
   ord1               label "To" colon 49 skip
   lang               colon 20
   lang1              label "To" colon 49 skip(1)
   print_options      colon 30 skip
   comp_addr          colon 30 skip
   form_code          colon 30 deblank skip
   print_trlr         colon 30
   disc_det           colon 30
   disc_sum           colon 30
   bump_rev           colon 30
   print_line_charges colon 30
   update_yn          colon 30 
   unprintedSoOnly    colon 30
   conf_so_only       colon 30 skip
with frame a width 80 side-labels.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
{us/cc/cclc.i} /* DETERMINE IF CONTAINER AND LINE CHARGES ARE ENABLED */
 
find first soc_ctrl where soc_ctrl.soc_domain = global_domain no-lock no-error.
comp_addr = soc_company.
 
find first lngd_det where lngd_dataset = c-lngd-dataset
   and lngd_field   = "det_disc_prnt"
   and lngd_lang    = global_user_lang
   and lngd_key1    = disc_det_key
no-lock no-error.
 
if available lngd_det then
   disc_det = lngd_translation.
else
   disc_det = "".
 
find first lngd_det where lngd_dataset = c-lngd-dataset
   and lngd_field   = "det_disc_prnt"
   and lngd_lang    = global_user_lang
   and lngd_key1    = disc_sum_key
no-lock no-error.
 
if available lngd_det then
   disc_sum = lngd_translation.
else
   disc_sum = "".
 
repeat:
 
   l_status = no.
 
   if nbr1 = hi_char then nbr1 = "".
   if cust1 = hi_char then cust1 = "".
   if lang1 = hi_char then lang1 = "".
/*grc338 if form_code = "" then form_code = "1". */
/*grc338*/ if form_code = "" then form_code = "9".

   display print_line_charges with frame a.
 
   assign company = "".
 
   update
      nbr nbr1
      cust cust1
      ord ord1
      lang lang1
      print_options
      comp_addr
      form_code
      print_trlr
      disc_det
      disc_sum
      bump_rev
      print_line_charges when (using_line_charges)
      update_yn
      unprintedSoOnly
      conf_so_only
   with frame a
   editing:
 
      if frame-field = "disc_det" then do:
         {us/mf/mfnp05.i lngd_det lngd_trans
            "lngd_dataset   = c-lngd-dataset
                  and lngd_field  = 'det_disc_prnt'
                  and lngd_lang   = global_user_lang"
            lngd_translation "disc_det" }
         if recno <> ? then
         display lngd_translation @ disc_det
         with frame a.
      end.
 
      else if frame-field = "disc_sum" then do:
         {us/mf/mfnp05.i lngd_det lngd_trans
            "lngd_dataset   = c-lngd-dataset
                  and lngd_field  = 'det_disc_prnt'
                  and lngd_lang   = global_user_lang"
            lngd_translation "disc_sum" }
         if recno <> ? then display lngd_translation @ disc_sum
         with frame a.
      end.
 
      else do:
         status input.
         readkey.
         apply lastkey.
      end.
 
   end.
 
   bcdparm = "".
   {us/mf/mfquoter.i nbr    }
   {us/mf/mfquoter.i nbr1   }
   {us/mf/mfquoter.i cust   }
   {us/mf/mfquoter.i cust1  }
   {us/mf/mfquoter.i ord    }
   {us/mf/mfquoter.i ord1   }
   {us/mf/mfquoter.i lang   }
   {us/mf/mfquoter.i lang1}
   {us/mf/mfquoter.i print_options}
   {us/mf/mfquoter.i comp_addr}
   {us/mf/mfquoter.i form_code}
   {us/mf/mfquoter.i print_trlr}
   {us/mf/mfquoter.i disc_det  }
   {us/mf/mfquoter.i disc_sum  }
   {us/mf/mfquoter.i bump_rev  }
   if using_line_charges
   then
      {us/mf/mfquoter.i print_line_charges}
   {us/mf/mfquoter.i update_yn }
 
   if nbr1 = "" then nbr1 = hi_char.
   if cust1 = "" then cust1 = hi_char.
   if lang1 = "" then lang1 = hi_char.
 
   /* Add this do loop so the converter wont create an 'on leave' */
   do:
 
      /* Validate discount print options */
      find first lngd_det where lngd_dataset = c-lngd-dataset
         and lngd_field       = "det_disc_prnt"
         and lngd_lang        = global_user_lang
         and lngd_translation = disc_det
      no-lock no-error.
      if not available lngd_det then do:
         /* INVALID OPTION */
         {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_det}
         {us/bbi/gprun.i ""gpmsgls1.p""
            "(6928, c-lngd-dataset, 'det_disc_prnt', global_user_lang )"}
         next-prompt disc_det with frame a.
         undo, retry.
      end.
 
      disc_det_key = lngd_key1.
 
      find first lngd_det where lngd_dataset     = c-lngd-dataset
         and lngd_field       = "det_disc_prnt"
         and lngd_lang        = global_user_lang
         and lngd_translation = disc_sum
      no-lock no-error.
      if not available lngd_det then do:
         /* INVALID OPTION */
         {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_det}
         {us/bbi/gprun.i ""gpmsgls1.p""
            "(6928, c-lngd-dataset, 'det_disc_prnt', global_user_lang )"}
         next-prompt disc_sum with frame a.
         undo, retry.
      end.
 
      disc_sum_key = lngd_key1.
 
      /* TO TRANSLATE, ADD THE LANGUAGE CODE IN THE LOOKUP BELOW*/
/*grc338 if lookup(form_code,"1") = 0 then do: */
/*grc338*/ if lookup(form_code,"1,9") = 0
/*grc338*/ then do:

         {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3} /* FORM CODE NOT INSTALLED */
         next-prompt form_code with frame a.
         undo, retry.
      end.
 
      if comp_addr <> "" then do:
 
         find ad_mstr where ad_mstr.ad_domain = global_domain
            and ad_addr = comp_addr
         no-lock no-error.
 
         if available ad_mstr then do:
 
            find ls_mstr where ls_mstr.ls_domain = global_domain
               and ls_addr = ad_addr
               and ls_type = "company"
            no-lock no-error.
 
            if not available ls_mstr then do:
               {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3} /* NOT A VALID COMPANY */
               next-prompt comp_addr with frame a.
               undo , retry.
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
 /*grc338*/  {us/xf/xfaddr.i company}
 
            /* FIND VAT REG NO & COUNTRY CODE */
         /*grc338   {us/gp/gpvtecrg.i} */
/*grc338*/  {us/xf/xfgetabn.i &abn=covatreg}

         end. /* if available ad_mstr */
         else do:
            {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3} /* NOT A VALID COMPANY */
            next-prompt comp_addr with frame a.
            undo , retry.
         end.
 
      end. /* if comp_addr <> "" */
 
   end.
 
/**grc338 COMMENTED PORTION BEGINS**
   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 80
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
**grc338 COMMENTED PORTION ENDS**/
 
/**grc338 ADDED PORTION BEGINS**/
   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer" &printWidth = report_width
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
   {us/xf/xfoutnul.i}
/**grc338 ADDED PORTION ENDS**/

   mainloop:
      do:
 
      if false then do:
         {us/bbi/gprun.i ""sorp0501.p""
            "(input update_yn,
              input print_line_charges,
              input unprintedSoOnly,
              input conf_so_only)"}
      end.
 
      /*RUN SELECTED FORMAT */
      {us/gp/gprfile.i}
 
/*grc338
      {us/bbi/gprun.i " ""sorp05"" + run_file + "".p"""
      */    {us/bbi/gprun.i " ""xfrp05"" + run_file + "".p"""
         "(input update_yn,
           input print_line_charges,
           input unprintedSoOnly,
           input conf_so_only)"}
 
   /*grc338   {us/bbi/mfreset.i} */
   {us/xf/xfoutnulc.i}

/*grc338*/ {us/bbi/mfreset.i "stream ft"}
 
      l_status = yes.
 
   end. /* mainloop: do */
 
   runok = l_status.
 
end. /* repeat */
