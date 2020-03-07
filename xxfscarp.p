/* xxfscarp.p  -  CALL PRINT                                                  */
/* fscarp.p  -  CALL PRINT                                                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxfscarp.p,v 1.2 2018/03/13 17:09:57 gbg Exp $: */
/* $Revision: 1.2 $                                                       */
/*V8:ConvertMode=Report                                                       */
/*  REVISION: 7.0      LAST MODIFIED: 04/10/92   BY: sas *F448**/
/*  REVISION: 7.0      LAST MODIFIED: 05/14/92   BY: sas *F452**/
/*  REVISION: 7.3      LAST MODIFIED: 01/04/93   BY: sas *G458**/
/*  REVISION: 7.3      LAST MODIFIED: 01/24/93   BY: sas *G547**/
/*  REVISION: 7.3      LAST MODIFIED: 14/07/94   BY: gcs *FO05**/
/*  REVISION: 7.3      LAST MODIFIED: 07/22/94   BY: gcs *GK88**/
/*  REVISION: 7.5      LAST MODIFIED: 08/19/94   BY: cdt *J04C**/
/*  REVISION: 7.3      LAST MODIFIED: 10/04/94   BY: smp *FS07**/
/*  REVISION: 7.3      LAST MODIFIED: 10/04/94   BY: smp *GN35**/
/*  REVISION: 7.3      LAST MODIFIED: 10/17/94   BY: ljm *GN36**/
/*  REVISION: 7.3      LAST MODIFIED: 12/29/94   BY: smp *G0B6**/
/*  REVISION: 8.5      LAST MODIFIED: 04/10/95   BY: *J04C* Sue Poland        */
/*  REVISION: 8.5      LAST MODIFIED: 02/21/96   BY: *J04C* Markus Barone     */
/*  REVISION: 8.6      LAST MODIFIED: 10/22/97   BY: ays *K14T*               */
/*  REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/*  REVISION: 9.1      LAST MODIFIED: 08/14/00   BY: *N0L0* Jacolyn Neder     */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.7.1.4       BY: Jean Miller       DATE: 04/25/02  ECO: *P06H*  */
/* Revision: 1.7.1.5       BY: Jean Miller       DATE: 02/27/04  ECO: *Q067*  */
/* $Revision: 1.2 $    BY: Tony Brooks       DATE: 07/11/10  ECO: *R230*  */
/* CYB    LAST MODIFIED: 23-Sep-2010    BY:  nac *cy1028*                    */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/mf/mfdtitle.i "3+ "}

define new shared variable eventdate      like ca_evt_date.
define new shared variable eventtime      as   character format "xx:xx".
define new shared variable statusdate     like ca_nxt_date.
define new shared variable statustime     as   character format "xx:xx".
define     shared variable window_recid   as   recid.

define variable contract       like ca_contract no-undo.
define variable del-yn         like mfc_logical no-undo.
define variable name           like ad_name no-undo.
define variable no-check       like mfc_logical no-undo.
define variable enduser        as   character initial "enduser" no-undo.
define variable multi          like mfc_logical no-undo.

define variable cmtindx        like cmt_indx no-undo.
define variable eunbr          like eu_addr no-undo.
define variable eunbr1         like eu_addr no-undo.
define variable cmnbr          like cm_addr no-undo.
define variable part           like isb_part no-undo.
define variable part1          like isb_part no-undo.
define variable part2          like isb_part no-undo.
define variable serial         like ca_serial no-undo.
define variable serial1        like ca_serial no-undo.
define variable serial2        like ca_serial no-undo.
define variable wtype1         like ca_int_type no-undo.
define variable wtype2         like ca_int_type no-undo.
define variable type1          like ca_type no-undo.
define variable type2          like ca_type no-undo.
define variable engarea        like ca_eng_area no-undo.
define variable engarea1       like ca_eng_area no-undo.
define variable status1        like ca_status no-undo.
define variable status2        like ca_status no-undo.
define variable assign1        like ca_assign no-undo.
define variable assign2        like ca_assign no-undo.
define variable ref            like isb_ref no-undo.
define variable callid         like ca_nbr no-undo.
define variable callid1        like ca_nbr no-undo.
define variable call_date      like ca_opn_date no-undo.
define variable call_date1     like ca_opn_date no-undo.
define variable isbpart1       like mfc_logical no-undo.
define variable unassign       like mfc_logical no-undo.

define variable sanbr          like sa_nbr no-undo.
define variable sanbr1         like sa_nbr no-undo.
define variable part_desc      like pt_desc1 no-undo.
define variable cacmmts        like svc_cmmts no-undo.
define variable con_type       as   character format "x(8)" no-undo.
define variable con_desc       as   character format "x(24)" no-undo.
define variable warranty       like mfc_logical no-undo.
define variable pages          as   integer no-undo.
define variable start_date     like sa_st_date no-undo.
define variable end_date       like sa_st_date no-undo.
define variable svdesc         like sv_desc no-undo.
define variable skipit         like mfc_logical no-undo.
define variable category       like ca_category initial "0" no-undo.
define variable include-bom    like mfc_logical
   initial no no-undo label "Print BOM/Routing".
define variable tzvalue        as   integer no-undo.
define variable l-timezone     like tzo_label no-undo.
define variable tzlabel        as   character format "x(11)" no-undo.
define variable undo-all       like mfc_logical no-undo.
define variable eutz           like tzo_label no-undo.
define variable open-date      like ca_opn_date no-undo.
define variable open-time      as   character no-undo.
define variable print-ok       as   logical no-undo.

define temp-table l_wkfl no-undo
   field l_wkfl_nbr like ca_nbr.

define new shared stream   prt2.

/*cy1028>>*/
define variable bill1          like ca_bill no-undo.
define variable bill2          like ca_bill no-undo.

{us/xf/xfso10u.i "new"} /*eb3sp5*/
{us/xf/xfdefa.i "new"} /*eb3sp5*/
{us/xf/xfso10v.i "new"} /*eb3sp5*/
/*cy1028<<*/

tzlabel = getTermLabel("REPORT_TIME_ZONE",10) + ":".

/* DISPLAY SELECTION FORM */
form
   assign1            colon 21
   assign2            colon 53   label "To"
   callid             colon 21
   callid1            colon 53   label "To"
   call_date          colon 21   label "Nxt Date"
   call_date1         colon 53   label "To"
   serial1            colon 21
   serial2            colon 53   label "To"
   part1              colon 21
   part2              colon 53   label "To"
/*cy1028>>*/
   bill1              colon 21
   bill2              colon 53   label "To"
/*cy1028<<*/
   eunbr              colon 21
   eunbr1             colon 53   label "To"
   sanbr              colon 21   label "Contract"
   sanbr1             colon 53   label "To"
   skip(1)
   unassign           colon 21   label "Unassigned Only"
   include-bom        colon 21
   tzlabel                       no-label
   l-timezone                    no-label
   skip
with frame a title color normal (getFrameTitle("USER_SELECTION",21))
side-labels width 80 attr-space.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

if not can-find(first svc_ctrl where svc_domain = global_domain )
then do on error undo, leave:
   {us/bbi/gprun.i ""fssvc.p""}
end.  /* svc_ctrl */
find first svc_ctrl where svc_domain = global_domain no-lock no-error.
cacmmts = svc_cmmts.

if not can-find(first sac_ctrl where sac_domain = global_domain )
then do on error undo, leave:
   create sac_ctrl.
   sac_ctrl.sac_domain = global_domain.
   if recid(sac_ctrl) = -1 then.
   release sac_ctrl.
end.  /* sac_ctrl */

find first sac_ctrl where sac_domain = global_domain no-lock no-error.
no-check = yes.

/* DISPLAY */
mainloop:
repeat on endkey undo, leave:

   if serial2 = hi_char then
      serial2 = "".

   if eunbr1 = hi_char then
      eunbr1 = "".

   if part2 = hi_char then
      part2 = "".

/*cy1028>>*/
   if bill2 = hi_char then
      bill2 = "".
/*cy1028<<*/

   if callid1 = hi_char then
      callid1 = "".

   if sanbr1 = hi_char then
      sanbr1 = "".

   if wtype2  = hi_char then
      wtype2  = "".

   if type2  = hi_char then
      type2  = "".

   if status2 = hi_char then
      status2 = "".

   if engarea1  = hi_char then
      engarea1  = "".

   if assign2  = hi_char then
      assign2  = "".

   if call_date  = low_date then
      call_date  = ?.

   if call_date1 = hi_date or call_date = low_date then
      call_date1 = ?.

   /* ADD THE DISPLAY TIME ZONE TO THE SELECTION FRAME IF ENABLED */
   if svc_multi_time_zones then do:
      assign
         tzlabel:column  = sanbr1:column - /*V8-*/ 11 /*V8+*/  /*V8! 8.7 */
         l-timezone:column = sanbr1:column.

      display
         tzlabel
      with frame a.
   end.  /* if svc_multi_time_zones */

   update
      assign1
      assign2
      callid
      callid1
      call_date
      call_date1
      serial1
      serial2
      part1
      part2
/*cy1028>>*/
      bill1
      bill2
/*cy1028<<*/
      eunbr
      eunbr1
      sanbr
      sanbr1
      unassign
      include-bom
      l-timezone      when (svc_multi_time_zones and batchrun)
   with frame a.
   /* PROMPT THE USER FOR A DISPLAY TIME ZONE **/

   if svc_multi_time_zones and
      not batchrun
   then do:

      /* ALLOW USER TO CHOOSE A TIME ZONE FROM A SELECTION LIST */
      {us/bbi/gprun.i ""fstzsel.p""
         "(input  (frame-row(a) + 3),
           input  yes,
           input  yes,
           output tzvalue,
           output l-timezone,
           output undo-all)"}
      if undo-all then
         undo mainloop, retry mainloop.

      /* DISPLAY EITHER THE TIME ZONE CHOSEN OR THE LABELS BELOW */
      /* IF THE TIME ZONE CAN VARY FROM CALL TO CALL.            */
      if tzvalue = 1 then
         l-timezone = getTermLabel("END_USER",8).
      else
      if tzvalue = 2 then
         l-timezone = getTermLabel("ENGINEER",8).

      display
         l-timezone
      with frame a.

   end.  /* if svc_multi_time_zones */

   bcdparm = "".
   {us/mf/mfquoter.i   assign1   }
   {us/mf/mfquoter.i   assign2   }
   {us/mf/mfquoter.i   callid    }
   {us/mf/mfquoter.i   callid1   }
   {us/mf/mfquoter.i   call_date }
   {us/mf/mfquoter.i   call_date1}
   {us/mf/mfquoter.i   serial1   }
   {us/mf/mfquoter.i   serial2   }
   {us/mf/mfquoter.i   part1     }
   {us/mf/mfquoter.i   part2     }
/*cy1028>>*/
   {us/mf/mfquoter.i   bill1     }
   {us/mf/mfquoter.i   bill2     }
/*cy1028<<*/
   {us/mf/mfquoter.i   eunbr     }
   {us/mf/mfquoter.i   eunbr1    }
   {us/mf/mfquoter.i   sanbr     }
   {us/mf/mfquoter.i   sanbr1    }
   {us/mf/mfquoter.i   unassign  }
   {us/mf/mfquoter.i   include-bom}
   {us/mf/mfquoter.i   l-timezone  }

   /* OUTPUT DESTINATION SELECTION */
/*d2101* start added code >>>>   */
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
/*d2101* end   added code <<<<<  */
/*d2101* start deleted code  >>>>>>>>>>>>>>>>
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
*d2101* end   deleted code  <<<<<<<<<<<<<<< */

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
   {us/bbi/mfphead2.i}
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

   if serial2 = "" then
      serial2 = hi_char.

   if eunbr1 = "" then
      eunbr1 = hi_char.

   if wtype2  = "" then
      wtype2  = hi_char.

   if type2  = "" then
      type2  = hi_char.

   if status2 = "" then
      status2 = hi_char.

   if engarea1   = "" then
      engarea1  = hi_char.

   if assign2   = "" then
      assign2   = hi_char.

   if part2 = "" then
      part2 = hi_char.

/*cy1028>>*/
   if bill2 = "" then
      bill2 = hi_char.
/*cy1028<<*/

   if callid1 = "" then
      callid1 = hi_char.

   if sanbr1 = "" then
      sanbr1 = hi_char.

   if call_date  = ? then
      call_date  = low_date.

   if call_date1 = ? then
      call_date1 = hi_date.

   if svc_multi_time_zones and
      batchrun then
      /* TZVALUE INDICATES DISPLAY TIME ZONE          */
      /* 1 = USE CALL'S EU TZ; 2 = USE CALL'S ENG TZ; */
      /* 3 = USE SELECTED TIME ZONE                   */
      CASE l-timezone:
         when getTermLabel("END_USER",8) then
            tzvalue = 1.
         when getTermLabel("ENGINEER",8) then
            tzvalue = 2.
         otherwise
            tzvalue = 3.
      end.  /* case */

   /* FIND FIRST RECORD FOR PROCESSING - ESTABLISH INITIAL DATABASE POSITION */
   if eunbr > " " or eunbr1 < hi_char then
      find first  ca_mstr
         where ca_domain = global_domain
           and ca_category = category
           and ca_eu_nbr  >= eunbr
           and ca_eu_nbr  <= eunbr1
           and ca_nbr     >= callid
           and ca_nbr     <= callid1
      use-index ca_eu_nbr no-lock no-error.
   else if callid > " " or callid1 < hi_char then
      find first  ca_mstr
         where ca_domain = global_domain
           and ca_category = category
           and ca_nbr     >= callid
           and ca_nbr     <= callid1
      use-index ca_nbr no-lock no-error.
   else if assign1 > " " or assign2 < hi_char then
      find first  ca_mstr
         where ca_domain = global_domain
           and ca_category = category
           and ca_assign  >= assign1
           and ca_assign  <= assign2
      use-index ca_assign no-lock no-error.
   else if call_date > ? or call_date1 < hi_date then
      find first  ca_mstr
         where ca_domain = global_domain
           and ca_category  = category
           and ca_nxt_date >= call_date
           and ca_nxt_date <= call_date1
      use-index ca_nxt_date no-lock no-error.

   else if part1 > " " or part2 < hi_char then do:

      for first itm_det
         fields(itm_domain itm_part itm_nbr itm_serial itm_line
                itm_prefix itm_type itm_sa_nbr)
          where itm_domain = global_domain
            and itm_part >= part1
            and itm_part <= part2
      use-index itm_part
      no-lock: end.

      if available itm_det then
         for first ca_mstr
            fields(ca_domain ca_assign ca_category ca_contract
                   ca_eu_date ca_eu_nbr ca_eu_time ca_nbr
                   ca_nxt_date ca_part ca_nxt_time
                   ca_opn_date ca_opn_time ca_serial)
             where ca_domain = global_domain
               and ca_category = category
               and ca_nbr = itm_nbr
         use-index ca_nbr
         no-lock: end.

   end. /* if part1 > " " or part2 < hi_char */

   else if serial1 > " " or serial2 < hi_char then do:

      for first itm_det
         fields(itm_domain itm_part itm_nbr itm_serial itm_line
                itm_prefix itm_type itm_sa_nbr)
          where itm_domain = global_domain
            and itm_prefix = "CA"
            and itm_type   = ""
            and itm_serial >= serial1
            and itm_serial <= serial2
      use-index itm_serial
      no-lock: end.

      if available itm_det then
         for first ca_mstr
            fields(ca_domain ca_assign ca_category ca_contract
                   ca_eu_date ca_eu_nbr ca_eu_time ca_nbr
                   ca_nxt_date ca_part ca_nxt_time
                   ca_opn_date ca_opn_time ca_serial)
             where ca_domain = global_domain
               and ca_category = category
               and ca_nbr      = itm_nbr
         use-index ca_nbr
         no-lock: end.

   end. /* if serial1 > " " or serial2 < hi_char */

   else if sanbr > " " or sanbr1 < hi_char then
      find first ca_mstr
         where ca_domain = global_domain
           and ca_contract >= sanbr
           and ca_contract <= sanbr1
           and ca_category = category
      use-index ca_contract no-lock no-error.

/*cy1028>>*/
   else if bill1 > " " or bill2 < hi_char then do:
         for first ca_mstr
            fields(ca_domain ca_assign ca_category ca_contract
                   ca_eu_date ca_eu_nbr ca_eu_time ca_nbr
                   ca_nxt_date ca_part ca_nxt_time
                   ca_opn_date ca_opn_time ca_serial)
             where ca_domain = global_domain
               and ca_category = category
               and ca_bill >= bill1 
	       and ca_bill <= bill2
         use-index ca_nbr
         no-lock: end.
   end. /*if bill1> " " or bill2 < hi_char */
/*cy1028<<*/

   else
      find first ca_mstr
         where ca_domain = global_domain
           and ca_category = category
      use-index ca_nbr no-lock no-error.

   do while available ca_mstr:

      {us/mf/mfrpchk.i}

      /* FIND l_wkfl RECORD TO VERIFY WHETHER THIS CALL HAS BEEN */
      /* PRINTED PREVIOUSLY. IF l_wkfl RECORD IS NOT CREATED,    */
      /* CREATE A NEW l_wkfl RECORD FOR THIS CALL AND CALL       */
      for first l_wkfl where  l_wkfl_nbr = ca_nbr
      no-lock: end.

      if not available l_wkfl
      then do:

         create l_wkfl.
         assign
            l_wkfl_nbr = ca_nbr.

         if recid(l_wkfl) = -1 then.

         run p-check-in-range (output print-ok).

         if print-ok then do:

            /* LEAVE EVENT DATE/TIME BLANK TO CONVERT IN FSCAIV02.P */
            assign
               eventdate  = ?
               eventtime  = "".

            /* PRINT THE CALL */
/*cy1028*   {us/bbi/gprun.i ""fscaiv02.p"" */
/*cy1028*/  {us/bbi/gprun.i ""xxfscaiv02.p""
               "(input recid(ca_mstr),
                 input include-bom,
                 input open-date,
                 input l-timezone)"}

         end.    /* if print-ok */

      end. /* IF NOT AVAILABLE wkfl */

      /* FIND NEXT RECORD FOR PRINTING */
      if eunbr > " " or eunbr1 < hi_char then
         find next ca_mstr
            where ca_domain = global_domain
              and ca_category = category
              and ca_eu_nbr  >= eunbr
              and ca_eu_nbr  <= eunbr1
              and ca_nbr     >= callid
              and ca_nbr     <= callid1
         use-index ca_eu_nbr no-lock no-error.
      else if callid > " " or callid1 < hi_char then
         find next ca_mstr
            where ca_domain = global_domain
              and ca_category = category
              and ca_nbr     >= callid
              and ca_nbr     <= callid1
         use-index ca_nbr no-lock no-error.
      else if assign1 > " " or assign2 < hi_char then
         find next ca_mstr
            where ca_domain = global_domain
              and ca_category = category
              and ca_assign  >= assign1
              and ca_assign  <= assign2
         use-index ca_assign no-lock no-error.
      else if call_date > ? or call_date1 < hi_date then
         find next ca_mstr
            where ca_domain = global_domain
              and ca_category  =  category
              and ca_nxt_date >= call_date
              and ca_nxt_date <= call_date1
         use-index ca_nxt_date no-lock no-error.

      else if part1 > " " or part2 < hi_char then do:

         find next itm_det
            where itm_domain = global_domain
              and itm_part >= part1
              and itm_part <= part2
         use-index itm_part
         no-lock no-error.

         for first ca_mstr
            fields(ca_domain ca_assign ca_category ca_contract
                   ca_eu_date ca_eu_nbr ca_eu_time ca_nbr
                   ca_nxt_date ca_part ca_nxt_time
                   ca_opn_date ca_opn_time ca_serial)
             where ca_domain = global_domain
               and ca_category = category
               and ca_nbr = itm_nbr
         use-index ca_nbr
         no-lock: end.

      end. /* IF PART1 > " " OR PART2 < HI_CHAR */

      else if serial1 > " " or serial2 < hi_char then do:

         find next itm_det
            where itm_det.itm_domain = global_domain
              and itm_det.itm_prefix = "CA"
              and itm_det.itm_type = ""
              and itm_det.itm_serial >= serial1
              and itm_det.itm_serial <= serial2
         use-index itm_serial
         no-lock no-error.

         for first ca_mstr
            fields(ca_domain ca_assign ca_category ca_contract
                   ca_eu_date ca_eu_nbr ca_eu_time ca_nbr
                   ca_nxt_date ca_part ca_nxt_time
                   ca_opn_date ca_opn_time ca_serial)
             where ca_domain = global_domain
               and ca_category = category
               and ca_nbr = itm_nbr
         use-index ca_nbr
         no-lock: end.

      end. /* IF SERIAL1 > " " OR SERIAL2 < HI_CHAR */

      else if sanbr > " " or sanbr1 < hi_char then
         find next ca_mstr
            where ca_domain = global_domain
              and ca_contract >= sanbr
              and ca_contract <= sanbr1
              and ca_category = category
         use-index ca_contract no-lock no-error.

      else
         find next ca_mstr
            where ca_domain = global_domain
              and ca_category = category
         use-index ca_nbr no-lock no-error.

   end.  /* do while available */

   for each l_wkfl exclusive-lock:
      delete l_wkfl.
   end.

/*cy1028*   {us/mf/mfrtrail.i} */
/*cy1028*/  {us/bbi/mfreset.i "stream ft"}

end.  /* mainloop repeat */

/* PROC P-GET-TZ-DATE TO GET DISPLAY TZ & CONVERT CALL DATE */
{us/fs/fstzdate.i}

PROCEDURE p-check-in-range:

   define output parameter print-ok as logical.

   print-ok = no.

   if (unassign and ca_mstr.ca_assign <> "")
      or ca_category <> category
      or ca_nbr      < callid
      or ca_nbr      > callid1
      or ca_assign   < assign1
      or ca_assign   > assign2
      or ca_eu_nbr   < eunbr
      or ca_eu_nbr   > eunbr1
/*cy1028>>*/
      or ca_bill     < bill1
      or ca_bill     > bill2
/*cy1028<<*/
      or not can-find(first itm_det where
         (itm_domain = global_domain
      and itm_nbr     = ca_nbr
      and itm_part   >= part1
      and itm_part   <= part2
      and itm_serial >= serial1
      and itm_serial <= serial2
      and itm_sa_nbr >= sanbr
      and itm_sa_nbr <= sanbr1))
      then .
   else do:

      /* GET DISPLAY TIME ZONE & CONVERT CALL OPEN DATE/TIME */
      run p-get-tz-date
         (input  ca_opn_date,
          input  ca_opn_time,
          input  yes,               /* ACTIVE CALL     */
          input  recid(ca_mstr),
          input  yes,               /* CHECK OPEN DATE */
          output open-date,
          output open-time).

      /* CONVERT CALL NEXT STATUS DATE/TIME TO DISPLAY TIME ZONE */
      if svc_ctrl.svc_multi_time_zones   and
         l-timezone <> ""         and
         l-timezone <> global_timezone
      then do:
         {us/bbi/gprun.i ""fstzcon.p""
            "(input  ca_nxt_date,
              input  ca_nxt_time,
              input  global_timezone,
              input  l-timezone,
              output statusdate,
              output statustime,
              output undo-all)"}
      end.  /* if svc_multi_time_zones... */
      else
         assign
            statusdate = ca_nxt_date
            statustime = ca_nxt_time.

      /* CHECK IF CONVERTED NEXT STATUS DATE IS WITHIN PARAMETER RANGE */
      if statusdate < call_date  or
         statusdate > call_date1
         then .
      else print-ok = yes.

   end.    /* else, passed first wave of checks, do */

END PROCEDURE.
