/* xxdoap.p - COMPUTER PLANNED DISTRIBUTION ORDER APPROVAL              */
/* drdoap.p - COMPUTER PLANNED DISTRIBUTION ORDER APPROVAL              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdoap.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/*F0PN*/ /*V8:ConvertMode=Maintenance                                   */
/*K1Q4*/ /*V8:RunMode=Character,Windows                                 */
/* REVISION: 7.0      LAST EDIT: 03/06/92   MODIFIED BY: emb *F225**/
/* REVISION: 7.3      LAST EDIT: 01/06/93   MODIFIED BY: emb *G508**/
/* REVISION: 7.3      LAST EDIT: 11/07/94   MODIFIED BY: ljm *GO15**/
/* REVISION: 8.5      LAST EDIT: 01/03/95   MODIFIED BY: mwd *J034**/
/* REVISION: 8.5   LAST MODIFIED: 10/13/97  BY: *G2PT*  Felcy D'Souza  */


/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane     */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan    */
/* REVISION: 8.6E     LAST MODIFIED: 07/10/98   BY: *J2QS* Samir Bavkar  */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan    */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00 BY: *N0KK* jyn              */
/* $Revision: 1.2 $ BY: Paul Donnelly (SB) DATE: 06/26/03 ECO: *Q00B* */
/* CYB                    BY: nac                DATE: 25 May 10 ECO: *Q9021* */
/* CYB                    BY: nac             DATE: 26 May 10 ECO: *cy1010* */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/


         /* DISPLAY TITLE */
         {us/mf/mfdtitle.i "2+ "} /*G508*/

/* ********** Begin Translatable Strings Definitions ********* */

&SCOPED-DEFINE drdoap_p_1 "Default Approve"
/* MaxLen: Comment: */

&SCOPED-DEFINE drdoap_p_2 "Include Phantoms"
/* MaxLen: Comment: */

/* ********** End Translatable Strings Definitions ********* */

         define new shared variable release_all like mfc_logical
     label {&drdoap_p_1}.
         define new shared variable numlines as integer initial 10.
         define variable show_phantom like mfc_logical label {&drdoap_p_2}.
         define variable buyer like pt_buyer.
         define variable nbr like dsr_req_nbr.
         define variable part like mrp_part.
         define variable part2 like mrp_part.
         define variable due_date like mrp_due_date.
         define variable due_date2 like mrp_due_date.
         define variable dwn as integer.
         define new shared variable mindwn as integer.
         define new shared variable maxdwn as integer.
         define new shared variable dsrrecno as recid extent 10 no-undo.
         define variable yn like mfc_logical.

         define new shared variable site like si_site.
         define new shared variable site2 like si_site.

         /* INPUT OPTION FORM */
         form
         part     colon 15       part2 label {us/t0/t001.i} colon 45
         site     colon 15       site2 label {us/t0/t001.i} colon 45
         due_date colon 15   due_date2 label {us/t0/t001.i} colon 45 skip(1)
         release_all    colon 36
         buyer          colon 36
         show_phantom   colon 36
         with frame a side-labels width 80 attr-space.

         /* SET EXTERNAL LABELS */
         setFrameLabels(frame a:handle).

         release_all = yes.
         site = global_site.
         site2 = global_site.

         main-loop:
         repeat:
            dsrrecno = ?.
            dwn = 0.
            mindwn = 1.
            maxdwn = 0.

            ststatus = stline[1].
            status input ststatus.

            if part2 = hi_char then part2 = "".
            if site2 = hi_char then site2 = "".
            if  due_date = low_date then due_date = ?.
            if due_date2 = hi_date  then due_date2 = ?.

            update part part2
            site site2
            due_date due_date2
            release_all
            buyer show_phantom
            with frame a editing:

               if frame-field = "part" then do:

                   /* FIND NEXT/PREVIOUS RECORD */
                   {us/mf/mfnp.i dsr_mstr part  " dsr_mstr.dsr_domain = global_domain
                   and dsr_part "  part dsr_part dsr_part}

                   if recno <> ? then do:
                      part = dsr_part.
                      display part with frame a.
                      recno = ?.
                   end.
               end.
               else if frame-field = "part2" then do:

                   /* FIND NEXT/PREVIOUS RECORD */
                   {us/mf/mfnp.i dsr_mstr part2  " dsr_mstr.dsr_domain =
                   global_domain and dsr_part "  part2 dsr_part dsr_part}

                   if recno <> ? then do:
                      part2 = dsr_part.
                      display part2 with frame a.
                      recno = ?.
                   end.
               end.
               else if frame-field = "site" then do:

                   /* FIND NEXT/PREVIOUS RECORD */
                   {us/mf/mfnp.i si_mstr site  " si_mstr.si_domain = global_domain
                   and si_site "  site si_site si_site}

                   if recno <> ? then display si_site @ site with frame a.
               end.
               else if frame-field = "site2" then do:

                   /* FIND NEXT/PREVIOUS RECORD */
                   {us/mf/mfnp.i si_mstr site2  " si_mstr.si_domain = global_domain
                   and si_site "  site2 si_site si_site}

                   if recno <> ? then display si_site @ site2 with frame a.
               end.
               else do:
                   ststatus = stline[3].
                   status input ststatus.
                   readkey.
                   apply lastkey.
               end.
            end.
            status input "".

            if part2 = "" then part2 = hi_char.
            if site2 = "" then site2 = hi_char.
            if  due_date = ? then  due_date = low_date.
            if due_date2 = ? then due_date2 = hi_date.

/*J034*/    {us/bbi/gprun.i ""gpsirvr.p""
         "(input site, input site2, output return_int)"}
/*J034*/    if return_int = 0 then do:
/*J034*/       next-prompt site with frame a.
/*J034*/       undo main-loop, retry main-loop.
/*J034*/    end.

/*G2PT* BEGIN OF COMMENTED CODE.                                            */
/*      FOLLOWING CODE IS COMMENTED AND RESTRUCTURED BELOW SINCE THIS LOGIC */
/*      SEARCHES THROUGH THE WORK ORDER TABLE FOR ORDERS WITH PLANNED       */
/*      STATUS AND THEN VALIDATES THE BUYER/PLANNER FOR THAT ITEM TO CHECK  */
/*      WHETHER IT MATCHES WITH THAT OF SELECTION CRITERIA. THIS RESULTS IN */
/*      A LONG PROCESS OF READING AND DISPLAY OF THE APPROPRIATE RECORDS.   */
/*G2PT**   find first dsr_mstr where (dsr_part >= part and dsr_part <= part2)
 *    and (dsr_site >= site and dsr_site <= site2)
 *    and (dsr_due_date >= due_date and dsr_due_date <= due_date2)
 *  and dsr_status = "P"
 *  no-lock use-index dsr_part no-error.
 *
 *   repeat:
 *
 *     if not available dsr_mstr then leave.
 * /*GO15*/ /*V8! hide frame a. */
 *    find pt_mstr where pt_part = dsr_part no-lock no-error.
 *
 *    find ptp_det no-lock where ptp_part = dsr_part
 *    and ptp_site = dsr_site no-error.
 *
 *    if (available ptp_det
 *    and (ptp_phantom = no or show_phantom = yes)
 *    and (ptp_buyer = buyer or buyer = ""))
 *    or (not available ptp_det and available pt_mstr
 *    and (pt_phantom = no or show_phantom = yes)
 *    and (pt_buyer = buyer or buyer = "")) then do:
 *
 *     dwn = dwn + 1.
 *     maxdwn = maxdwn + 1.
 *     dsrrecno[dwn] = recid(dsr_mstr).
 *     if dwn = numlines then do:
 *        {us/bbi/gprun.i ""drdoapa.p""}
 *        if dsrrecno[1] = ? then do:
 *           dsrrecno = ?.
 *           dwn = 0.
 *           undo main-loop, next main-loop.
 *        end.
 *        find dsr_mstr where recid(dsr_mstr) = dsrrecno[numlines]
 *        no-lock no-error.
 *        dsrrecno = ?.
 *        dwn = 0.
 *        mindwn = maxdwn + 1.
 *     end.
 *      end.
 *
 *      find next dsr_mstr where (dsr_part >= part and dsr_part <= part2)
 *      and (dsr_site >= site and dsr_site <= site2)
 *      and (dsr_due_date >= due_date and dsr_due_date <= due_date2)
 *      and dsr_status = "P"
 *      no-lock use-index dsr_part no-error.
 *
 *   end.
 *G2PT* END OF COMMENTED CODE                                             */

/*G2PT*      BEGIN OF ADDED CODE */
/*           BELOW CODE STARTS WITH THE PT_MSTR AND IN_MSTR TABLES,         */
/*           SELECTING THE RECORDS WITHIN THE SELECTION CRITERIA OF ITEM    */
/*           AND SITE FOR WHICH ISR's EXISTS. THEN A CHECK IS MADE FOR      */
/*           PHANTOM, BUYER/PLANNER VALUES BEFORE SEARCHING FOR ISR's WITH  */
/*           A PLANNED STATUS CODE. THIS IS SIGNIFICANTLY  FASTER WHEN THERE*/
/*           ARE LARGE NUMBER OF ISR's AND WHEN BUYER/PLANNER FIELD IS      */
/*           ENTERED IN THE SELECTION CRITERIA.                             */

         for each pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
         (pt_part >= part
                        and  pt_part <= part2),
             each in_mstr no-lock  where in_mstr.in_domain = global_domain and
              in_part  = pt_part
                                    and (in_site >= site
                        and  in_site <= site2)
             and can-find (first dsr_mstr  where dsr_mstr.dsr_domain =
             global_domain and  dsr_part = in_part
                                            and dsr_site = in_site):

              find ptp_det no-lock  where ptp_det.ptp_domain = global_domain
              and  ptp_part = in_part
                                     and ptp_site = in_site no-error.

              if (available ptp_det
                  and (ptp_phantom = no    or show_phantom   = yes)
                  and (ptp_buyer   = buyer or buyer          = "" ))
                 or
             (not available ptp_det
                  and (pt_phantom  = no    or show_phantom   = yes)
                  and (pt_buyer    = buyer or buyer          = "" )) then
              do:

                  for each dsr_mstr no-lock  where dsr_mstr.dsr_domain =
                  global_domain and  dsr_part      = in_part
                                              and dsr_site      = in_site
                                              and dsr_due_date >= due_date
                                              and dsr_due_date <= due_date2
                                              and dsr_status    = "P"
                                              use-index dsr_part:

                      dwn = dwn + 1.
                      maxdwn = maxdwn + 1.
                      dsrrecno[dwn] = recid(dsr_mstr).

/*J2QS*/             /* RESTRICTING maxdwn TO 999 AND REASSIGNING dwn TO 0 */
/*J2QS*/             /* SO THAT DETAIL LINES TO APPROVE WOULD START FROM   */
/*J2QS*/             /* 1 - 999 FOR THE NEXT SET OF LINES ABOVE 999        */
/*J2QS**             if dwn = numlines then */

/*J2QS*/             if dwn = numlines or maxdwn = 999  then
                     do:

/*q9021*                        {us/bbi/gprun.i ""drdoapa.p""} */
/*q9021*/                       {us/bbi/gprun.i ""xxdoapa.p""}

/*J2QS*/                if maxdwn = 999 then
/*J2QS*/                do:
/*J2QS*/                   assign
/*J2QS*/                      mindwn = 1
/*J2QS*/                      maxdwn = 0.
/*J2QS*/                end. /* IF maxdwn = 999 */

                       if dsrrecno[1] = ? then
                       do:
                          dsrrecno = ?.
                          dwn = 0.
                          undo main-loop, next main-loop.
                       end.

                       dsrrecno = ?.
                       dwn = 0.
                       mindwn = maxdwn + 1.
                    end. /* IF DWN = NUMLINES */

                end. /* FOR EACH DSR_MSTR */
              end. /* IF AVAILABLE PTP_DET */
             end. /* FOR EACH PT_MSTR */

/*G2PT*      END OF ADDED CODE */

            if dwn <> 0 then do:
/*q9021*               {us/bbi/gprun.i ""drdoapa.p""} */
/*q9021*/              {us/bbi/gprun.i ""xxdoapa.p""}
               if dsrrecno[1] = ? then undo main-loop, next main-loop.
            end.
            else do:
          /* NO MORE PLANNED DISTRIBUTION ORDERS FOR CRITERIA".*/
              {us/bbi/mfmsg.i 501 1}
            end.
         end.
