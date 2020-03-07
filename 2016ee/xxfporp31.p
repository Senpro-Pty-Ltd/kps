/* xxfporp03.p - PURCHASE ORDER PRINT AND UPDATE                         */
/* poporp03.p - PURCHASE ORDER PRINT AND UPDATE                         */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxfporp31.p,v 1.2 2018/03/13 17:09:57 gbg Exp $: */
/* REVISION: 1.0    LAST MODIFIED: 08/30/86     BY: PML *15*            */
/* REVISION: 1.0    LAST MODIFIED: 09/02/86     BY: EMB *12*            */
/* REVISION: 2.0    LAST MODIFIED: 12/23/86     BY: PML *A8*            */
/* REVISION: 2.0    LAST MODIFIED: 01/29/87     BY: EMB *A23*           */
/* REVISION: 2.1    LAST MODIFIED: 09/09/87     BY: WUG *A94*           */
/* REVISION: 4.0    LAST MODIFIED: 12/18/87     BY: PML *A113           */
/* REVISION: 4.0    LAST MODIFIED: 02/01/88     BY: FLM *A108           */
/* REVISION: 4.0    LAST MODIFIED: 12/30/87     BY: WUG *A137*          */
/* REVISION: 4.0    LAST MODIFIED: 01/29/88     BY: PML *A119*          */
/* REVISION: 4.0    LAST MODIFIED: 02/22/88     BY: WUG *A177*          */
/* REVISION: 4.0    LAST MODIFIED: 02/29/88     BY: WUG *A175*          */
/* REVISION: 4.0    LAST MODIFIED: 06/14/88     BY: FLM *A268*          */
/* REVISION: 4.0    LAST MODIFIED: 08/24/88     BY: FLM *A406*          */
/* REVISION: 4.0    LAST MODIFIED: 09/08/88     BY: FLM *A430*          */
/* REVISION: 4.0    LAST MODIFIED: 02/09/89     BY: FLM *A641*          */
/* REVISION: 4.0    LAST MODIFIED: 02/22/89     BY: WUG *A657*          */
/* REVISION: 5.0    LAST MODIFIED: 03/14/89     BY: MLB *B056*          */
/* REVISION: 5.0    LAST MODIFIED: 04/07/89     BY: WUG *B094*          */
/* REVISION: 4.0    LAST MODIFIED: 05/05/89     BY: MLB *A730*          */
/* REVISION: 5.0    LAST MODIFIED: 06/08/89     BY: MLB *B130*          */
/* REVISION: 5.0    LAST MODIFIED: 07/25/89     BY: WUG *B198*          */
/* REVISION: 5.0    LAST MODIFIED: 10/27/89     BY: MLB *B324*          */
/* REVISION: 5.0    LAST MODIFIED: 02/13/90     BY: FTB *B565*          */
/* REVISION: 5.0    LAST MODIFIED: 03/13/90     BY: MLB *B586*          */
/* REVISION: 5.0    LAST MODIFIED: 03/28/90     BY: MLB *B615*          */
/* REVISION: 6.0    LAST MODIFIED: 06/14/90     BY: RAM *D030*          */
/* REVISION: 6.0    LAST MODIFIED: 09/18/90     BY: MLB *D055*          */
/* REVISION: 6.0    LAST MODIFIED: 11/12/90     BY: MLB *D200*          */
/* REVISION: 6.0    LAST MODIFIED: 08/14/91     BY: RAM *D828*          */
/* REVISION: 6.0    LAST MODIFIED: 09/26/91     BY: RAM *D881*          */
/* REVISION: 6.0    LAST MODIFIED: 11/05/91     BY: RAM *D913*          */
/* REVISION: 7.3    LAST MODIFIED: 02/22/93     by: jms *G712*(rev only)*/
/* REVISION: 7.4    LAST MODIFIED: 07/20/93     by: bcm *H033*(rev only)*/
/* REVISION: 7.4    LAST MODIFIED: 07/25/94     BY: dpm *FP50*          */
/*                                 09/10/94     BY: bcm *GM03*          */
/* REVISION: 8.5    LAST MODIFIED: 04/26/96     BY: jpm *H0KS*          */
/* REVISION: 8.6    LAST MODIFIED: 11/21/96     BY: *K022* Tejas Modi   */
/* REVISION: 8.6    LAST MODIFIED: 04/03/97     BY: *K09K* Arul Victoria */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan    */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan    */
/* REVISION: 9.1      LAST MODIFIED: 07/28/99   BY: *N01B* John Corda    */
/* REVISION: 9.1      LAST MODIFIED: 03/02/00   BY: *L0SH* Santosh Rao   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00 BY: *N0KQ* myb              */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.8.1.6     BY: Dorota Hohol        DATE: 02/25/03  ECO: *P0N6*  */
/* Revision: 1.8.1.7     BY: Narathip W.         DATE: 05/06/03  ECO: *P0R9*  */
/* Revision: 1.8.1.9     BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00J*  */
/* Revision: 1.8.1.10    BY: Orawan S.           DATE: 10/08/03  ECO: *P13T*  */
/* Revision: 1.8.1.11    BY: Shivanand H         DATE: 04/27/04  ECO: *P1Z2*  */
/* Revision: 1.8.1.12    BY: Laxmikant B         DATE: 07/22/04  ECO: *P2BX*  */
/* Revision: 1.8.1.13    BY: Ellen Borden     DATE: 01/17/06  ECO: *R008*  */
/* Revision: 1.8.1.15    BY: Changlin Zeng    DATE: 04/26/06  ECO: *R045**/
/* Revision: 1.8.1.16       BY: Kalpita Amkar    DATE: 07/24/06  ECO: *R07L**/
/* $Revision: 1.2 $    BY: Jean Miller      DATE: 02/15/07  ECO: *R0C6**/
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/*V8:ConvertMode=Report                                          */

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "1+ "}

define new shared variable ord_date like po_ord_date.
define new shared variable ord_date1 like po_ord_date.
define new shared variable nbr like po_nbr.
define new shared variable nbr1 like po_nbr.
define new shared variable vend like po_vend.
define new shared variable vend1 like po_vend.
define new shared variable buyer like po_buyer.
define new shared variable buyer1 like po_buyer.
define new shared variable msg as character format "X(60)".
define new shared variable lang like so_lang.
define new shared variable lang1 like lang.
define variable form_code as character format "x(2)"
   label "Form Code".
define variable run_file as character format "X(12)".

define variable update_yn like mfc_logical initial yes
   label "Update" no-undo.

define variable l_runok as logical no-undo.

define new shared variable print_bill like mfc_logical initial yes.
define new shared variable new_only like mfc_logical initial yes.
define new shared variable open_only like mfc_logical initial yes.
define new shared variable sort_by_site like poc_sort_by.
define new shared variable include_sched like mfc_logical.
define new shared variable incl_b2b_po like mfc_logical.
define new shared variable print_options like mfc_logical.
define new shared variable print_wo_comments like mfc_logical no-undo.
define new shared variable l_include_retain like mfc_logical
   initial yes no-undo.

define new shared variable use-log-acctg as logical no-undo.

/* VALIDATE IF LOGISTICS ACCOUNTING IS TURNED ON */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

find first gl_ctrl where gl_domain = global_domain no-lock.
find first poc_ctrl where poc_domain = global_domain no-lock.
sort_by_site = poc_sort_by.

/* FACILITATE UPDATE FLAG AS REPORT INPUT CRITERIA, TO */
/* ELIMINATE USER INTERACTION AT THE END OF REPORT     */
form
   nbr               colon 15
   nbr1              label "To" colon 49
   vend              colon 15
   vend1             label "To" colon 49
   buyer             colon 15
   buyer1            label "To" colon 49
   ord_date          colon 15
   ord_date1         label "To" colon 49 skip
   lang              colon 15
   lang1             label "To" colon 49 skip(1)
   open_only         colon 25 label "Open PO's Only"
   print_options     colon 60 label "Print Features and Options"
   print_wo_comments colon 60
   new_only          colon 25 label "Unprinted PO's Only"
   l_include_retain  colon 60 label "Include Retained Taxes"
   include_sched     colon 25 label "Include Schedule Orders"
   sort_by_site      colon 60
   print_bill        colon 25 label "Print Bill-To Address"
   form_code         colon 60 deblank
   incl_b2b_po       colon 25 label "Include EMT Orders"
   update_yn         colon 60 skip(1)
   space(1)
   msg            label "Message" skip(1)
with frame a width 80 attr-space side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

repeat:

   if nbr1 = hi_char then nbr1 = "".
   if vend1 = hi_char then vend1 = "".
   if buyer1 = hi_char then buyer1 = "".
   if ord_date = low_date then ord_date = ?.
   if ord_date1 = hi_date then ord_date1 = ?.
   if lang1 = hi_char then lang1 = "".
   if form_code = "" then form_code = "1".

   update
      nbr nbr1
      vend vend1
      buyer buyer1
      ord_date ord_date1
      lang lang1
      open_only new_only include_sched print_bill
      incl_b2b_po print_options print_wo_comments
      l_include_retain
      sort_by_site
      form_code
      update_yn
      msg
   with frame a.

   if lookup(form_code,"1") = 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3}
      next-prompt form_code with frame a.
      undo, retry.
   end.

   bcdparm = "".

   {us/mf/mfquoter.i nbr    }
   {us/mf/mfquoter.i nbr1   }
   {us/mf/mfquoter.i vend   }
   {us/mf/mfquoter.i vend1  }
   {us/mf/mfquoter.i buyer  }
   {us/mf/mfquoter.i buyer1 }
   {us/mf/mfquoter.i ord_date}
   {us/mf/mfquoter.i ord_date1}
   {us/mf/mfquoter.i lang}
   {us/mf/mfquoter.i lang1}
   {us/mf/mfquoter.i open_only}
   {us/mf/mfquoter.i new_only}
   {us/mf/mfquoter.i include_sched}
   {us/mf/mfquoter.i print_bill}
   {us/mf/mfquoter.i incl_b2b_po}
   {us/mf/mfquoter.i print_options}
   {us/mf/mfquoter.i print_wo_comments}
   {us/mf/mfquoter.i l_include_retain}
   {us/mf/mfquoter.i sort_by_site}
   {us/mf/mfquoter.i form_code}
   {us/mf/mfquoter.i update_yn}
   {us/mf/mfquoter.i msg    }

   if nbr1 = "" then nbr1 = hi_char.
   if vend1 = "" then vend1 = hi_char.
   if buyer1 = "" then buyer1 = hi_char.
   if ord_date = ? then ord_date = low_date.
   if ord_date1 = ? then ord_date1 = hi_date.
   if lang1 = "" then lang1 = hi_char.

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

   /* RUN SELECTED FORMAT */
   {us/gp/gprfile.i}

   if false then do:
      {us/bbi/gprun.i ""porp0301.p"" "(input update_yn)"}
   end.

   {us/bbi/gprun.i  """porp03"" + run_file + "".p""" "(input update_yn)"}

   {us/bbi/mfreset.i}

   if batchrun
   then
      l_runok = runok.

   /* OBSOLETED MESSAGE 306 AND MOVED USER INTERACTION */
   /* TO REPORT INPUT CRITERIA.                        */

   if batchrun
   then
      runok = l_runok.

end.
