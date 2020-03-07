/* xfqorp09.p  -  SALES QUOTE PRINT SET-UP                               */
/* sqqorp05.p  -  SALES QUOTE PRINT SET-UP                                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfqorp09.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 7.0      LAST MODIFIED: 03/20/92   BY: tjs *F300* rewrite        */
/* REVISION: 7.0      LAST MODIFIED: 03/26/92   BY: tmd *F324* (rev only)     */
/* REVISION: 7.0      LAST MODIFIED: 03/27/92   BY: dld *F326* (rev only)     */
/* REVISION: 7.0      LAST MODIFIED: 04/08/92   BY: tmd *F367* (rev only)     */
/* REVISION: 7.0      LAST MODIFIED: 04/07/92   BY: dld *F358**/
/* REVISION: 7.3      LAST MODIFIED: 09/24/92   BY: tjs *G085* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 10/13/92   BY: tjs *G178* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 11/16/92   BY: tjs *G191* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 12/14/92   BY: afs *G444* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 12/15/92   BY: afs *G447* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 02/02/93   BY: tjs *G620* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 03/17/93   BY: bcm *G832* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 03/17/93   BY: afs *G820* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 03/19/93   BY: tjs *G847* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 05/18/93   BY: afs *GB14**/
/* REVISION: 7.4      LAST MODIFIED: 07/14/93   BY: bcm *H030* (rev only)     */
/* REVISION: 7.4      LAST MODIFIED: 08/02/93   BY: bcm *H053* (rev only)     */
/* REVISION: 7.3      LAST MODIFIED: 10/18/94   BY: jzs *GN91*                */
/* REVISION: 7.3      LAST MODIFIED: 04/12/95   BY: jpm *H0CH*                */
/* REVISION: 8.5      LAST MODIFIED: 03/06/95   BY: nte *J042*                */
/* REVISION: 7.4      LAST MODIFIED: 10/09/95   BY: jym *G0YN*                */
/* REVISION: 8.5      LAST MODIFIED: 04/26/96   BY: jpm *J0KK*                */
/* REVISION: 7.4      LAST MODIFIED: 02/05/98   BY: *H1JC* Jean Miller        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/15/98   BY: *L00L* Adam Harris        */
/* REVISION: 8.6E     LAST MODIFIED: 05/13/98   BY: *J2DD* Kawal Batra        */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 07/30/98   BY: *L051* Dariusz Sidel      */
/* REVISION: 8.6E     LAST MODIFIED: 08/18/98   BY: *L065* Robin McCarthy     */
/* REVISION: 9.1      LAST MODIFIED: 07/23/99   BY: *N01B* John Corda         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/09/00   BY: *M0QW* Falguni Dalal      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* Revision: 1.16.1.5      BY: Katie Hilbert      DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.16.1.6      BY: Jean Miller        DATE: 05/15/02  ECO: *P05V* */
/* Revision: 1.16.1.8      BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00M* */
/* Revision: 1.16.1.10     BY: Jean Miller        DATE: 10/07/08  ECO: *R15M* */
/* $Revision: 1.2 $  BY: Jean Miller        DATE: 11/23/09  ECO: *R1TW* */
/* Revision: QAD2014      BY: Amol Dudvadkar    DATE: 03/16/15  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/mf/mfdtitle.i}
/**grc338 ADDED PORTION BEGINS**/
 {us/xf/xfdefa.i "new"}
 {us/xf/xfqorp09v.i "new"}
/**grc338 ADDED PORTION ENDS**/

define new shared variable cust    like qo_cust.
define new shared variable cust1   like qo_cust.
define new shared variable nbr     like qo_nbr.
define new shared variable nbr1    like qo_nbr.
define new shared variable ord     like qo_ord_date.
define new shared variable ord1    like qo_ord_date.
define new shared variable company as character format "x(38)" extent 6.

define new shared variable print_options like mfc_logical initial no
   label "Print Features and Options".
define new shared variable addr as character format "x(38)" extent 6.
define new shared variable lang  like qo_lang.
define new shared variable lang1 like qo_lang.
define new shared variable print_trlr like mfc_logical initial no
   label "Print Quote Trailer".
define new shared variable bump_rev like mfc_logical initial true
   label "Increment Quote Revision".
define new shared variable disc_det_key  like lngd_key1 initial "1".
define new shared variable disc_sum_key  like lngd_key1 initial "1".

define variable comp_addr like qoc_company no-undo.
define variable update_yn like mfc_logical initial yes label "Update" no-undo.
define variable form_code as character format "x(2)"   label "Form Code" no-undo.
define variable run_file as character format "x(12)" no-undo.
define variable disc_det like lngd_translation
   label "Discount Detail" no-undo.
define variable disc_sum like disc_det label "Discount Summary" no-undo.
define variable c-lngd-dataset like lngd_det.lngd_dataset
   initial "soprint.p" no-undo.

{us/et/etvar.i &new="new"}

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock no-error.

/* FACILITATE UPDATE FLAG AS REPORT INPUT CRITERIA, TO */
/* ELIMINATE USER INTERACTION AT THE END OF REPORT     */

form
   nbr            colon 20
   nbr1           label "To" colon 49 skip
   cust           colon 20
   cust1          label "To" colon 49 skip
   ord            colon 20
   ord1           label "To" colon 49 skip
   lang           colon 20
   lang1          label "To" colon 49 skip(1)
   print_options  colon 30 skip
   comp_addr      colon 30 skip
   form_code      colon 30 deblank skip
   print_trlr     colon 30
   disc_det       colon 30
   disc_sum       colon 30
   bump_rev       colon 30
   update_yn      colon 30 skip
with frame a width 80 side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

find first qoc_ctrl where qoc_ctrl.qoc_domain = global_domain no-lock.
comp_addr = qoc_company.

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

   if nbr1 = hi_char then nbr1 = "".
   if cust1 = hi_char then cust1 = "".
   if lang1 = hi_char then lang1 = "".
/*grc338 if form_code = "" then form_code = "1". */
/*grc338*/ if form_code = "" then form_code = "9".

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
      update_yn
   with frame a
   editing:

      if frame-field = "disc_det" then do:
         {us/mf/mfnp05.i lngd_det lngd_trans
            "lngd_dataset   = c-lngd-dataset
                  and lngd_field  = 'det_disc_prnt'
                  and lngd_lang   = global_user_lang"
            lngd_translation "input disc_det" }
         if recno <> ? then
         display lngd_translation @ disc_det
         with frame a.
      end.

      else if frame-field = "disc_sum" then do:
         {us/mf/mfnp05.i lngd_det lngd_trans
            "lngd_dataset   = c-lngd-dataset
                  and lngd_field  = 'det_disc_prnt'
                  and lngd_lang   = global_user_lang"
            lngd_translation "input disc_sum" }
         if recno <> ? then display lngd_translation @ disc_sum
         with frame a.
      end.

      else do:
         status input.
         readkey.
         apply lastkey.
      end.

   end.

   /* MOVED VALIDATION OF DISCOUNT PRINT OPTIONS BELOW BCDPARM */
   run mfquoter.

   if nbr1 = "" then nbr1 = hi_char.
   if cust1 = "" then cust1 = hi_char.
   if lang1 = "" then lang1 = hi_char.

   /* Add this do loop so the converter wont create an 'on leave' */
   do:

      /* Validate discount print options */
      find first lngd_det where
             lngd_dataset     = c-lngd-dataset
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
         {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_sum}
         {us/bbi/gprun.i ""gpmsgls1.p""
            "(6928, c-lngd-dataset, 'det_disc_prnt', global_user_lang )"}
         next-prompt disc_sum with frame a.
         undo, retry.
      end.

      disc_sum_key = lngd_key1.

      /* TO TRANSLATE, ADD THE LANGUAGE CODE IN THE LOOKUP BELOW*/
/*grc338 if lookup(form_code,"1") = 0 */
/*grc338*/ if lookup(form_code,"1,9") = 0
         then do:
         {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3} /* FORM CODE NOT INSTALLED */
         next-prompt form_code with frame a.
         undo, retry.
      end.

      if comp_addr <> "" then do:

         find ad_mstr where ad_mstr.ad_domain = global_domain
            and ad_addr = comp_addr
         no-lock no-error.

         if available ad_mstr then do:

            if not available gl_ctrl then
               find first gl_ctrl where gl_ctrl.gl_domain = global_domain
               no-lock no-error.

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
 /*grc338*/  {us/xf/xfaddr.i "company"}
         end. /* if available ad_mstr */

         else do:
            /* Not a valid company */
            {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
            next-prompt comp_addr with frame a.
            undo , retry.
         end.

      end. /* if comp_addr <> "" */

   end.

   /* SELECT PRINTER */
/**grc338 COMMENTED PORTION BEGINS *
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
*grc338 COMMENTED PORTION ENDED**/
/**grc338 ADDED PORTION BEGINS**/
   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 80
               &pagedFlag  = " "
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
   do transaction:

      if false then do:
         {us/bbi/gprun.i ""sqrp0501.p"" "(input update_yn)"}
      end.

      /*RUN SELECTED FORMAT */
      {us/gp/gprfile.i}
 /*grc338
      {us/bbi/gprun.i " ""sqrp05"" + run_file + "".p""" "(input update_yn)"}
  */  {us/bbi/gprun.i " ""xfqp05"" + run_file + "".p""" "(input update_yn)"}
     /* grc338 {us/bbi/mfreset.i} */
/*grc338*/ {us/bbi/mfreset.i "stream ft"}
/*grc338*/ output close.

      /* OBSOLETED MESSAGE 650 AND MOVED USER INTERACTION */
      /* TO REPORT INPUT CRITERIA.                        */
      if not update_yn then
         undo mainloop, leave mainloop.

   end. /* mainloop: do transaction */

end. /* repeat */

PROCEDURE mfquoter:

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
   {us/mf/mfquoter.i update_yn }

END PROCEDURE.
