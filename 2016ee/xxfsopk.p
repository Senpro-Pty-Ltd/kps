/* xxfsopk.p - PACKING LIST PRINT                                             */
/* xfsopk.p - PACKING LIST PRINT                                              */
/* sosopk.p - PACKING LIST PRINT                                              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxfsopk.p,v 1.2 2018/03/13 17:09:57 gbg Exp $: */
/* REVISION: 1.0      LAST MODIFIED: 10/02/86   BY: PML *26*                  */
/* REVISION: 6.0      LAST MODIFIED: 03/14/90   BY: FTB *D004*                */
/* REVISION: 6.0      LAST MODIFIED: 04/10/90   BY: ftb *Dftb* added site     */
/* REVISION: 6.0      LAST MODIFIED: 10/22/90   BY: pml *D127*                */
/* REVISION: 6.0      LAST MODIFIED: 11/12/90   BY: MLB *D200*                */
/* REVISION: 6.0      LAST MODIFIED: 01/10/91   BY: WUG *D294*                */
/* REVISION: 6.0      LAST MODIFIED: 01/30/91   BY: afs *D323*(rev only)      */
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425*(rev only)      */
/* REVISION: 6.0      LAST MODIFIED: 04/29/91   BY: afs *D597*(rev only)      */
/* REVISION: 6.0      LAST MODIFIED: 07/13/91   BY: afs *D768*(rev only)      */
/* REVISION: 6.0      LAST MODIFIED: 09/19/91   BY: afs *F040*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 02/07/92   BY: afs *F180*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 03/26/92   BY: dld *F322*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 04/28/92   BY: tjs *F444*                */
/* REVISION: 7.0      LAST MODIFIED: 06/05/92   BY: tjs *F504*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 09/24/92   BY: tjs *G087*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 01/06/92   BY: afs *G511*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 09/09/93   BY: afs *GF01*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 12/22/93   BY: WUG *GI32*                */
/* REVISION: 8.5      LAST MODIFIED: 12/22/94   BY: mwd *J034*                */
/* REVISION: 7.3      LAST MODIFIED: 03/07/95   by: srk *G0GN*                */
/* REVISION: 7.3      LAST MODIFIED: 06/09/95   by: rxm *G0PS*                */
/* REVISION: 8.5      LAST MODIFIED: 04/26/96   by: JPM *J0KK*                */
/* REVISION: 8.5      LAST MODIFIED: 06/20/96   by: taf *J0VG*                */
/* REVISION: 7.4      LAST MODIFIED: 02/05/98   BY: *H1JC* Jean Miller        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 08/23/99   BY: *N01B* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *M0QW* Falguni Dalal      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.11.1.6   BY: Kirti Desai           DATE: 05/22/01  ECO: *N0Y4* */
/* Revision: 1.11.1.7   BY: Jean Miller           DATE: 05/14/02  ECO: *P05V* */
/* Revision: 1.11.1.9   BY: Paul Donnelly (SB)    DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.11.1.10 BY: SurenderSingh Nihalani DATE: 10/12/04  ECO: *P2PB* */
/* Revision: 1.11.1.13    BY: Ajay Nair           DATE: 07/30/05  ECO: *P3W6* */
/* $Revision: 1.2 $ BY: Jean Miller         DATE: 12/03/08  ECO: *R15M* */
/* Revision: eb3sp5  BY: Shridhar M         DATE: 02/11/10  ECO: *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong    DATE: 24/10/12  ECO: *93sp12.1  */
/* CYB    LAST MODIFIED: 2015-SEP-11      BY: gbg *D3243*                     */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "3+ "}

/*d3243* start added code >>>>>>> */
 {us/xx/xx3243.i NEW }
/*d3243* end   added code >>>>>>> */


    /**eb3sp5 ADDED PORTION BEGINS**/
 {us/xf/xfdefa.i  "new"} /*global FT Vars */
 {us/xf/xfsopku.i "new"} /*FT User vars*/
 {us/xf/xfsopkv.i "new"} /*FT Vars */
/**eb3sp5 ADDED PORTION ENDS**/

define new shared variable due_date like sod_due_date.
define new shared variable due_date1 like sod_due_date.
define new shared variable nbr      like so_nbr.
define new shared variable nbr1     like so_nbr.
define new shared variable site     like sod_site.
define new shared variable site1    like sod_site.
define new shared variable all_only like mfc_logical initial yes
   label "Print Only Lines to Pick".

define new shared variable print_options like mfc_logical initial no
   label "Print Features and Options".
define new shared variable addr as character format "x(38)" extent 6.
define new shared variable include_partial like mfc_logical
   label "Override Partial OK Flag".
define new shared variable company as character format "x(38)" extent 6.
define new shared variable lang like so_lang.
define new shared variable lang1 like lang.
define new shared variable print_neg like mfc_logical
   label "Print Negative Quantities".

/* MADE AS NO-UNDO, SO THAT WHEN THE REPORT IS RUN IN SIMULATION   */
/* MODE AND THE PACKLIST IS ALREADY PRINTED, THEN THE ERROR        */
/* MESSAGE SHOULD BE CORRECTLY ISSUED. THIS SHOULD BE NO-UNDO      */
/* BECAUSE IN SIMULATION MODE, THE TRANSACTION WILL BE UNDONE, BUT */
/* THE VALUE OF PACK_LIST_EXISTS HAS TO BE RETAINED                */
define new shared variable pack_list_exists as logical no-undo.
define new shared variable picked_site like sod_site.
define new shared variable ship like so_ship.
define new shared variable ship1 like so_ship.

define variable l_disp_ch1 as character format "x(70)" no-undo.
define variable l_msg      like msg_mstr.msg_desc      no-undo.
define variable update_yn  like mfc_logical initial yes label "Update" no-undo.
define variable comp_addr  like ad_addr label "Company Address" no-undo.
define variable form_code  as character format "x(2)" label "Form Code" no-undo.
define variable run_file   as character format "x(12)" no-undo.

{us/so/sotmpdef.i new}

/* FACILITATE UPDATE FLAG AS REPORT INPUT CRITERIA, TO      */
/* ELIMINATE USER INTERACTION AT THE END OF THE REPORT      */
form
   due_date         colon 15
   due_date1        colon 49 label "To" skip
   nbr              colon 15
   nbr1             colon 49 label "To" skip
   ship             colon 15
   ship1            colon 49 label "To" skip
   lang             colon 15
   lang1            colon 49 label "To"
   site             colon 15
   site1            colon 49 label "To" skip(1)
   comp_addr        colon 35
   all_only         colon 35
   include_partial  colon 35
   print_options    colon 35 skip
   print_neg        colon 35 skip
   form_code        colon 35 deblank
   update_yn        colon 35 skip(1)
   l_disp_ch1 no-label at 5
   skip (1)
with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
/*eb3sp5*/  find first gl_ctrl no-lock.

/* Only orders with an action status of blank will print */
{us/bbi/pxmsg.i &MSGNUM=4648 &ERRORLEVEL=1 &MSGBUFFER=l_msg}

l_disp_ch1:screen-value = getTermLabel("NOTE",8) + ":" + l_msg.

for each t_all_data exclusive-lock:
   delete t_all_data.
end. /* FOR EACH t_all_data */

find first soc_ctrl  where soc_ctrl.soc_domain = global_domain no-lock no-error.
if available soc_ctrl then
   all_only = soc_pick.
include_partial = no.

if comp_addr = "" then do:
   if available soc_ctrl then comp_addr = soc_comp.
end.

/*eb3sp5 if form_code = "" then form_code = "1".*/
/*eb3sp5  */  if form_code = "" then form_code = "9".

display
   due_date due_date1
   nbr nbr1
   ship ship1
   lang lang1
   site site1
   comp_addr
   all_only
   include_partial
   print_options
   print_neg
   form_code
   update_yn
with frame a.

mainloop:
repeat:

   do transaction:

      if comp_addr = "" then do:
         if available soc_ctrl then comp_addr = soc_comp.
      end.

      if nbr1 = hi_char then nbr1 = "".
      /*eb3sp5if form_code = "" then form_code = "1".*/
      /*eb3sp5*/ if form_code = "" then form_code = "9".
      if site1 = hi_char then site1 = "".
      if due_date = low_date then due_date = ?.
      if due_date1 = hi_date then due_date1 = ?.
      if ship1 = hi_char then ship1 = "".
      if lang1 = hi_char then lang1 = "".

      set
         due_date due_date1
         nbr nbr1
         ship ship1
         lang lang1
         site site1
         comp_addr
         all_only
         include_partial
         print_options
         print_neg
/*d3243*         form_code */
         update_yn
      with frame a.

      bcdparm = "".
      {us/mf/mfquoter.i due_date}
      {us/mf/mfquoter.i due_date1}
      {us/mf/mfquoter.i nbr    }
      {us/mf/mfquoter.i nbr1   }
      {us/mf/mfquoter.i ship }
      {us/mf/mfquoter.i ship1}
      {us/mf/mfquoter.i lang}
      {us/mf/mfquoter.i lang1}
      {us/mf/mfquoter.i site}
      {us/mf/mfquoter.i site1}
      {us/mf/mfquoter.i comp_addr}
      {us/mf/mfquoter.i all_only}
      {us/mf/mfquoter.i include_partial}
      {us/mf/mfquoter.i print_options}
      {us/mf/mfquoter.i print_neg}
/*d3243*      {us/mf/mfquoter.i form_code} */
      {us/mf/mfquoter.i update_yn}

      if nbr1 = "" then nbr1 = hi_char.
      if ship1 = "" then ship1 = hi_char.
      if site1 = "" then site1 = hi_char.
      if due_date = ? then due_date = low_date.
      if due_date1 = ? then due_date1 = hi_date.
      if lang1 = "" then lang1 = hi_char.

      company = "".

     /*eb3sp5 if lookup(form_code,"1") = 0 then do:*/
     /*eb3sp5*/ if lookup(form_code,"1,9") = 0 then do:
         /* Form code not installed */
         {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3}
         next-prompt form_code with frame a.
         undo, retry.
      end.

      if not batchrun then do:
         {us/bbi/gprun.i ""gpsirvr.p""
            "(input site, input site1, output return_int)"}
         if return_int = 0 then do:
            next-prompt site with frame a.
            undo mainloop, retry mainloop.
         end.
      end.

      find ad_mstr  where ad_mstr.ad_domain = global_domain and  ad_addr =
      comp_addr no-lock no-error.
      if available ad_mstr then do:

         find ls_mstr  where ls_mstr.ls_domain = global_domain and  ls_addr =
         ad_addr and ls_type = "company"
         no-lock no-error.

         if not available ls_mstr and comp_addr <> "" then do:
            {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
            /* NOT A VALID COMPANY */
            next-prompt comp_addr with frame a.
            undo , retry.
         end.

         if available ls_mstr then do:

            /* Assign addr and format address */
            {us/mf/mfadfmt.i}

            assign
               company[1] = addr[1]
               company[2] = addr[2]
               company[3] = addr[3]
               company[4] = addr[4]
               company[5] = addr[5]
               company[6] = addr[6].
            /*eb3sp5*/ {us/xf/xfaddr.i "company"}
            /*eb3sp5*/ {us/xf/xfgetabn.i &abn=abn}
         end.
        /*eb3sp5*/   else  abn = "".

      end. /* if available ad_mstr */

      else do:
         if comp_addr <> ""
         then do:
            /* NOT A VALID COMPANY */
            {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
            next-prompt comp_addr with frame a.
            undo, retry.
         end. /* IF comp_addr <> "" */
      end. /* IF NOT AVAILABLE ad_mstr */

   end. /* DO TRANSACTION */

/*d3243* start added code >>>>>>> */
  /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 80
               &pagedFlag = " "
               &stream = "stream cyb"
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
   output stream ft to value("~/tmp~/xxf" + mfguser).
   /* {us/xf/xfoutnul.i "stream ft"} */

/*d3243* end   added code >>>>>>> */

/*d3243* start deleted cde >>>>>>
*    /* OUTPUT DESTINATION SELECTION */
*    /**eb3sp5 COMMENTED PORTION BEGINS**
*    {us/gp/gpselout.i &printType = "printer"
*                &printWidth = 80
*                &pagedFlag = " "
*                &stream = " "
*                &appendToFile = " "
*                &streamedOutputToTerminal = " "
*                &withBatchOption = "yes"
*                &displayStatementType = 1
*                &withCancelMessage = "yes"
*                &pageBottomMargin = 6
*                &withEmail = "yes"
*                &withWinprint = "yes"
*                &defineVariables = "yes"}
*   **eb3sp5 COMMENTED PORTION ENDS**/
*   /**eb3sp5 ADDED PORTION BEGINS**/
*   /* OUTPUT DESTINATION SELECTION */
*    {us/gp/gpselout.i &printType = "printer"
*                &printWidth = 80
*                &pagedFlag = " "
*                &stream = "stream ft"
*                &appendToFile = " "
*                &streamedOutputToTerminal = " "
*                &withBatchOption = "yes"
*                &displayStatementType = 1
*                &withCancelMessage = "yes"
*                &pageBottomMargin = 6
*                &withEmail = "yes"
*                &withWinprint = "yes"
*                &defineVariables = "yes"}
*                
*                   {us/xf/xfoutnul.i}
*   /**eb3sp5 ADDED PORTION ENDS**/
*d3243* end deleted code >>>>>> */

   if not update_yn then do:
      /* FACILITATING ROLLING BACK OF TRANSACTIONS BEFORE EXECUTING */
      /* THE REPORT AND LOCKING ANY RECORDS                         */
      mainprt:
      do transaction on error undo , leave on endkey undo , leave:

         run p_packlist.

         /* UNDOING CHANGES TO THE DATABASE IN SIMULATION MODE */
         undo mainprt, leave mainprt.

      end. /* DO TRANSACTION */
   end. /* IF NOT UPDATE_YN */

   else do:
      /* DISALLOWING ROLLBACK OF RECORDS MODIFIED DURING THE REPORT */
      /* WHEN UPDATE INPUT CRITERIA IS YES                          */
      run p_packlist.
   end. /* UPDATE_YN = YES */

   /*93sp12.1 {us/bbi/mfreset.i} */
   /*eb3sp5*/ {us/bbi/mfreset.i "stream ft"}
   /*eb3sp5*/  output close.
/*d3243* start added code >>>>>>> */
   {us/bbi/mfreset.i "stream cyb"}
   unix silent value("rm ~/tmp~/xxf" + mfguser).
/*d3243* end   added code >>>>>>> */

   if not batchrun then do:
      if pack_list_exists then do:
         /* PACKLIST LIST ALREADY PRINTED AT SITE */
         {us/bbi/pxmsg.i &MSGNUM=659 &ERRORLEVEL=3 &MSGARG1=picked_site}
      end.
   end. /* IF NOT BATCHRUN */

end. /* repeat */

PROCEDURE p_packlist:
   /*RUN SELECTED FORMAT */
   {us/gp/gprfile.i}

   if false then do:
      {us/bbi/gprun.i ""sopk01.p""}
      {us/bbi/gprun.i ""xfpk09.p""}
      {us/bbi/gprun.i ""xxfpk09.p""}   /*d3243*/
   end.

/*d3243* start added code */
   {us/bbi/gprun.i ""xxfpk09.p"" "(input update_yn)"}
/*d3243* end   added code */


/*d3243* start deleted code >>>>>>>
*    /*93sp12.1
*   {us/bbi/gprun.i """sopk"" + run_file + "".p""" "(input update_yn)"}  */
*   /*eb3sp5*/ {us/bbi/gprun.i 
*               """xfpk"" + run_file + "".p""" "(input update_yn)"}
*d3243* end deleted code <<<<<<<<<<<<<< */

END PROCEDURE.

define stream logit.
procedure logit.
def input parameter iptxt as char.
def var logname as char.
logname = entry(num-entries(program-name(1), "~/"), program-name(1), "~/").
logname = entry(1, logname, "~.").
   output stream logit to value("/tmp/" + trim(logname) + ".log") append.
   put stream logit unformatted
   string(program-name(2)) + "|" +
   string(today) + "|" +
   string(time, "HH:MM:SS") + "|" +
   global_userid + "|" +
   iptxt.
   if program-name(3) <> ? then
   put stream logit unformatted
   "|" + string(program-name(3)).
   if program-name(4) <> ? then
   put stream logit unformatted
   "|" + string(program-name(4)).
   put stream logit unformatted
   skip.
   output stream logit close.
   unix value("chmod 666 ~/tmp~/" + trim(logname) + ".log 2~>~/dev~/null").
end.  /* procedure logit */

