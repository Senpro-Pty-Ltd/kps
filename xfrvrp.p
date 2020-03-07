/* xfrvrp.p - PURCHASE ORDER RETURN TO VENDOR PRINT                     */
/* porvrp.p - PURCHASE ORDER RETURN TO VENDOR PRINT                     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrvrp.p,v 1.2 2018/03/13 17:09:37 gbg Exp $: */

/* REVISION: 6.0     LAST MODIFIED: 08/10/90    BY: RAM *D030*          */
/* REVISION: 6.0     LAST MODIFIED: 09/18/90    BY: MLB *D055*          */
/* REVISION: 6.0     LAST MODIFIED: 11/02/90    BY: PML *D171*          */
/* REVISION: 6.0     LAST MODIFIED: 11/14/90    BY: MLB *D200*          */
/* REVISION: 6.0     LAST MODIFIED: 10/03/91    BY: RAM *D890*          */
/* REVISION: 6.0     LAST MODIFIED: 01/07/92    BY: RAM *D979*          */
/* REVISION: 7.0     LAST MODIFIED: 02/03/92    BY: RAM *F144*          */
/* REVISION: 7.3     LAST MODIFIED: 09/29/92    BY: tjs *G088*(rev only)*/
/* REVISION: 7.3     LAST MODIFIED: 04/09/93    BY: afs *G926*          */
/*                                  09/10/94    BY: bcm *GM03*          */
/*                                  11/18/94    BY: bcm *GO37*          */
/* REVISION: 7.4     LAST MODIFIED: 01/18/96    BY: rxm *H0J4*          */
/* REVISION: 8.5     LAST MODIFIED: 04/26/96    BY: jpm *H0KS*          */
/* REVISION: 7.4     LAST MODIFIED: 02/25/97    BY: *H0ST* Aruna Patil  */
/* REVISION: 8.6E    LAST MODIFIED: 02/23/98    BY: *L007* A. Rahane    */
/* REVISION: 8.6E    LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E    LAST MODIFIED: 10/04/98    BY: *J314* Alfred Tan   */
/* REVISION: 9.0     LAST MODIFIED: 02/06/99    BY: *M06R* Doug Norton  */
/* REVISION: 9.0     LAST MODIFIED: 03/13/99    BY: *M0BD* Alfred Tan   */
/* REVISION: 9.1     LAST MODIFIED: 07/29/99    BY: *N01B* John Corda   */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1     LAST MODIFIED: 08/13/00    BY: *N0KQ* myb          */
/* Old ECO marker removed, but no ECO header exists *F0PN*              */
/* Revision: 1.18     BY: Katie Hilbert  DATE: 04/01/01 ECO: *P002*  */
/* $Revision: 1.2 $     BY: Mukesh Singh   DATE: 03/12/09 ECO: *P61X*  */
/* Revision: QAD2014  BY: Amol Dudvadkar    DATE: 03/16/15 ECO: *grc338*      */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i}
/*grc338*/   {us/xf/xfdefa.i "new"}

define new shared variable nbr         like prh_nbr.
define new shared variable nbr1        like prh_nbr.
define new shared variable vend        like prh_vend.
define new shared variable vend1       like prh_vend.
define new shared variable buyer       like prh_buyer.
define new shared variable buyer1      like prh_buyer.
define new shared variable rcp_date    like prh_rcp_date
   label "Return Date".
define new shared variable rcp_date1   like prh_rcp_date.
define new shared variable new_only    like mfc_logical  initial yes
   label "Unprinted RTV's Only".
define new shared variable print_bill  like mfc_logical  initial yes
   label "Print Bill-To Address".
define new shared variable print_lotserials like mfc_logical initial no
   label  "Print Lot/Serial Numbers Shipped".
define            variable form_code   as character
   format "x(2)"  label "Form Code".
define new shared variable msg         as character
   format "x(60)" label "Message".
define            variable run_file    as character
   format "x(12)".

define variable update_yn like mfc_logical initial yes
   label "Update" no-undo.

define new shared variable print_trlr like mfc_logical initial no
   label "Print Receipt Trailer".

define new shared variable l_include_retain like mfc_logical initial yes no-undo.

/* FACILITATE UPDATE FLAG AS REPORT INPUT CRITERIA, TO */
/* ELIMINATE USER INTERACTION AT THE END OF REPORT     */

form
   nbr              colon 15
   nbr1             colon 49 label "To"
   vend             colon 15
   vend1            colon 49 label "To"
   buyer            colon 15
   buyer1           colon 49 label "To"
   rcp_date         colon 15
   rcp_date1        colon 49 label "To" skip(1)
   new_only         colon 35
   print_bill       colon 35
   print_lotserials colon 35
   print_trlr       colon 35
   l_include_retain colon 35
   form_code        colon 35 deblank
   update_yn        colon 35                skip
   space(1)
   msg
with frame a width 80 side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

repeat:

   if nbr1 = hi_char       then nbr1 = "".
   if vend1 = hi_char      then vend1 = "".
   if buyer1 = hi_char     then buyer1 = "".
   if rcp_date = low_date  then rcp_date = ?.
   if rcp_date1 = hi_date  then rcp_date1 = ?.
/*grc338 if form_code = ""  then form_code = "1". */
/*grc338*/ if form_code = "" then form_code = "9".

   update
      nbr         nbr1
      vend        vend1
      buyer       buyer1
      rcp_date    rcp_date1
      new_only
      print_bill
      print_lotserials
      print_trlr
      l_include_retain
      form_code
      update_yn
      msg
   with frame a.

/*e3sp5 if lookup(form_code,"1") = 0 */
/*grc338*/ if lookup(form_code,"1,9") = 0
   then do:
      {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3}
      next-prompt form_code with frame a.
      undo, retry.
   end.

   bcdparm = "".
   {us/mf/mfquoter.i nbr             }
   {us/mf/mfquoter.i nbr1            }
   {us/mf/mfquoter.i vend            }
   {us/mf/mfquoter.i vend1           }
   {us/mf/mfquoter.i buyer           }
   {us/mf/mfquoter.i buyer1          }
   {us/mf/mfquoter.i rcp_date        }
   {us/mf/mfquoter.i rcp_date1       }
   {us/mf/mfquoter.i new_only        }
   {us/mf/mfquoter.i print_bill      }
   {us/mf/mfquoter.i print_lotserials}
   {us/mf/mfquoter.i print_trlr      }
   {us/mf/mfquoter.i l_include_retain}
   {us/mf/mfquoter.i form_code       }
   {us/mf/mfquoter.i update_yn       }
   {us/mf/mfquoter.i msg             }

   if nbr1 = ""      then nbr1 = hi_char.
   if vend1 = ""     then vend1 = hi_char.
   if buyer1 = ""    then buyer1 = hi_char.
   if rcp_date = ?   then rcp_date = low_date.
   if rcp_date1 = ?  then rcp_date1 = hi_date.

   /* SELECT PRINTER */
   /* OUTPUT DESTINATION SELECTION */

   /*grc338* Start Commenting
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
    *grc338* End Commenting */
   /*grc338 add begin*/
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 80
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
   {us/xf/xfoutnul.i} /*grc338*/

   mainloop:
   do transaction on error undo, leave on endkey undo, leave:

      /*RUN SELECTED FORMAT */
      {us/gp/gprfile.i}

      if false then do:
         {us/bbi/gprun.i ""porvrp01.p"" "(input update_yn)"}
      end.

      /*grc338
      {us/bbi/gprun.i """porvrp"" + run_file + "".p""" "(input update_yn)"} */
      {us/bbi/gprun.i """xfrvrp"" + run_file + "".p""" "(input update_yn)"} /*grc338*/

    /*grc338  {us/bbi/mfreset.i} */
/*grc338*/  {us/bbi/mfreset.i "stream ft"}

      /* OBSOLETED MESSAGE 378 AND MOVED USER INTERACTION */
      /* TO REPORT INPUT CRITERIA.                        */
      if not update_yn then
         undo mainloop, leave mainloop.

   end. /* mainloop */
end.
