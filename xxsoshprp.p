/* xxsoshprp.p - SHIPMENT PERFORMANCE REPORT                              */
/* soshprp.p - SHIPMENT PERFORMANCE REPORT                              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoshprp.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/* $Revision: 1.2 $                */
/*                                                                      */
/* This program reports all Shipment Performance activity for the given */
/* selection criteria.                                                  */
/*                                                                      */
/* Revision: 1.45  BY: Steve Nugent       DATE: 10/15/01  ECO: *P003* */
/* Revision: 1.47  BY: Steve Nugent       DATE: 08/09/02  ECO: *P0D6* */
/* Revision: 1.48  BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.50  BY: Paul Donnelly (SB) DATE: 09/26/03  ECO: *Q03V* */
/* $Revision: 1.2 $  BY: Somesh Jeswani     DATE: 05/17/04  ECO: *P21Y* */
/* CENTURY YUASA      LAST MODIFIED: 18-AUG-2011 BY: gbg *cy1044*          */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 02-FEB-2012    BY:  gbg *c1275*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/*                                                                      */
/*V8:ConvertMode=Report                                                 */
/************************************************************************/

/*                                                                          */
/* -----  W A R N I N G  -----  W A R N I N G  -----  W A R N I N G  -----  */
/*                                                                          */
/*         THIS PROGRAM IS A BOLT-ON TO STANDARD PRODUCT MFG/PRO.           */
/* ANY CHANGES TO THIS PROGRAM MUST BE PLACED ON A SEPARATE ECO THAN        */
/* STANDARD PRODUCT CHANGES.  FAILURE TO DO THIS CAUSES THE BOLT-ON CODE TO */
/* BE COMBINED WITH STANDARD PRODUCT AND RESULTS IN PATCH DELIVERY FAILURES.*/
/*                                                                          */
/* -----  W A R N I N G  -----  W A R N I N G  -----  W A R N I N G  -----  */
/*                                                                          */
{us/mf/mfdtitle.i}

define variable site like shp_shipfrom no-undo.
define variable site1 like shp_shipfrom no-undo.
define variable shipto like shp_shipto no-undo.
define variable shipto1 like shp_shipto no-undo.
define variable order like shp_nbr no-undo.
define variable order1 like shp_nbr no-undo.
define variable part like shp_part no-undo.
define variable part1 like shp_part no-undo.
define variable cpart like shp_cust_part no-undo.
define variable cpart1 like shp_cust_part no-undo.
define variable shipdate like shp_ship_date no-undo.
define variable shipdate1 like shp_ship_date no-undo.
define variable cust like shp_cust no-undo.
define variable cust1 like shp_cust no-undo.
define variable ordclass like shp_order_category no-undo.
define variable ordclass1 like shp_order_category no-undo.
define variable perf_date as character no-undo.
define variable include_amt like mfc_logical initial true no-undo.
define variable include_cmmt like mfc_logical no-undo.
define variable exceptions_only like mfc_logical no-undo.
define variable sortoption as integer initial 1 format "9" no-undo.
define variable report_detail like mfc_logical
   format "Detail/Summary" no-undo.
define variable sortoption_site as character format "x(52)" no-undo.
define variable sortoption_cust as character format "x(52)" no-undo.
define variable sortoption_rsn as character format "x(52)" no-undo.
define variable date_type as character no-undo.
define variable date_type_label as character no-undo.
define variable date_type_valid like mfc_logical no-undo.

define variable cust_source like shp_customer_source no-undo.
define variable cust_source_label like shp_customer_source no-undo.
define variable cust_source_valid like mfc_logical no-undo.
define variable message_desc like msg_desc no-undo.
define variable report_um like um_um no-undo.

/* SHARED VARIABLES */
define new shared variable date_type_code like lngd_key1 no-undo.
define new shared variable cust_source_code like shp_customer_source no-undo.

/* SELECTION FORM A */

form
   cust_source  colon 22
   cust         colon 22
   cust1        colon 50 label {us/t0/t001.i}
   shipto       colon 22
   shipto1      colon 50 label {us/t0/t001.i}
   site         colon 22
   site1        colon 50 label {us/t0/t001.i}
   order        colon 22
   order1       colon 50 label {us/t0/t001.i}
   part         colon 22
   part1        colon 50 label {us/t0/t001.i}
   cpart        colon 22 view-as fill-in size 20 by 1
   cpart1       colon 50 label {us/t0/t001.i} view-as fill-in size 20 by 1
   shipdate     colon 22
   shipdate1    colon 50 label {us/t0/t001.i}
   ordclass     colon 22
   ordclass1    colon 50 label {us/t0/t001.i}
   perf_date         colon 22 label "Report Date Type"
   exceptions_only   colon 63 label "Exceptions Only"
   include_amt       colon 22 label "Show Amounts"
   include_cmmt      colon 63 label "Print Comments"
   report_detail     colon 22 label "Report Detail"
   report_um         colon 63 label "Report UM"
   sortoption        colon 22 label "Sort Option"
   sortoption_site   at    16 no-label
   sortoption_cust   at    16 no-label
   sortoption_rsn    at    16 no-label
with frame a side-labels width 80 attr-space.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

for first shpc_ctrl  where shpc_ctrl.shpc_domain = global_domain no-lock:
   date_type_code = string(shpc_meas_subtype).
end.

{us/gp/gplngn2a.i
   &file = ""shpc_ctrl""
   &field = ""shpc_meas_subtype""
   &code = date_type_code
   &mnemonic = date_type
   &label = date_type_label}

perf_date = date_type.

{us/wb/wbrp01.i}

repeat:
   if site1 = hi_char then site1 = "".
   if shipto1 = hi_char then shipto1 = "".
   if cust1 = hi_char then cust1 = "".
   if order1 = hi_char then order1 = "".
   if part1 = hi_char then part1 = "".
   if cpart1 = hi_char then cpart1 = "".
   if shipdate = low_date then shipdate = ?.
   if shipdate1 = hi_date then shipdate1 = ?.
   if ordclass1 = hi_char then ordclass1 = "".

   message_desc = "".

   /* GET SORT OPTION DESCRIPTIONS FROM msg_mstr TABLE */

   run get_msg_desc
      (input global_user_lang,
      input 8558,
      output message_desc).
   assign
      sortoption_site = message_desc
      message_desc = "".

   run get_msg_desc
      (input global_user_lang,
      input 8559,
      output message_desc).
   assign
      sortoption_cust = message_desc
      message_desc = "".

   run get_msg_desc
      (input global_user_lang,
      input 8560,
      output message_desc).
   assign
      sortoption_rsn = message_desc
      message_desc = "".

   display
      cust_source
      cust
      cust1
      shipto
      shipto1
      site
      site1
      order
      order1
      part
      part1
      cpart
      cpart1
      shipdate
      shipdate1
      ordclass
      ordclass1
      perf_date
      exceptions_only
      include_amt
      include_cmmt
      report_detail
      report_um
      sortoption
      sortoption_site
      sortoption_cust
      sortoption_rsn
   with frame a.

   loop1:
   do on error undo, retry:
      if c-application-mode <> "WEB" then do:
         update
            cust_source
         with frame a.

         if cust_source = "DO" then do:
            {us/bbi/gprun.i ""gpbranch.p""
                     "(input 'gplu011.p', input 'gplu348.p')"}

            {us/bbi/gprun.i ""gpbranch.p""
                     "(input 'gplu239.p', input 'dslu005.p')"}

            {us/bbi/gprun.i ""gpbranch.p""
                     "(input 'gplu317.p', input 'gplu348.p')"}
         end.
         else do:
            {us/bbi/gprun.i ""gpbranch.p""
                     "(input 'gplu011.p', input '')"}

            {us/bbi/gprun.i ""gpbranch.p""
                     "(input 'gplu239.p', input '')"}

            {us/bbi/gprun.i ""gpbranch.p""
                     "(input 'gplu317.p', input '')"}
         end.
      end. /* IF c-mode-application <> "WEB" */

      loop2:
      do on error undo, retry:
        if c-application-mode <> "WEB" then do:

         set
            cust
            cust1
            shipto
            shipto1
            site
            site1
            order
            order1
            part
            part1
            cpart
            cpart1
            shipdate
            shipdate1
            ordclass
            ordclass1
            perf_date
            exceptions_only
            include_amt
            include_cmmt
            report_detail
            report_um
            sortoption
         with frame a.
       end. /* IF c-application-mode <> "WEB" */
         {us/wb/wbrp06.i &command = update
                   &fields = "cust_source cust cust1 shipto shipto1
                       site site1 order order1 part part1
                       cpart cpart1 shipdate shipdate1
                       ordclass ordclass1 perf_date
                       exceptions_only include_amt
                       include_cmmt report_detail
                       report_um sortoption"
                   &frm = "a"}

         /* VALIDATE CUSTOMER SOURCE FIELD */

         if cust_source = "" then cust_source_code = "".
         else do:
            {us/gp/gplngv.i
               &file = ""shp_hist""
               &field = ""shp_customer_source""
               &mnemonic = "cust_source"
               &isvalid = cust_source_valid}

            if not cust_source_valid then do:
               /* INVALID CUSTOMER SOURCE */
               {us/bbi/pxmsg.i &MSGNUM=8479 &ERRORLEVEL=3}
               next-prompt cust_source with frame a.
               undo loop1, retry loop1.
            end.

            {us/gp/gplnga2n.i
               &file = ""shp_hist""
               &field = ""shp_customer_source""
               &code = cust_source_code
               &mnemonic = "cust_source"
               &label = cust_source_label}
         end. /* ELSE DO */

         /* VALIDATE REPORT DATE TYPE FIELD */

         if perf_date = "" then do:
            /* BLANK NOT ALLOWED */
            {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3}
            next-prompt perf_date with frame a.
            undo loop2, retry loop2.
         end.
         else do:
            {us/gp/gplngv.i
               &file = ""shpc_ctrl""
               &field = ""shpc_meas_subtype""
               &mnemonic = "perf_date"
               &isvalid = date_type_valid}

            if not date_type_valid then do:
               /* INVALID DATE TYPE */
               {us/bbi/pxmsg.i &MSGNUM=8473 &ERRORLEVEL=3}
               next-prompt perf_date with frame a.
               undo loop2, retry loop2.
            end. /* IF NOT date_type_valid */
         end. /* ELSE DO */

         /* VALIDATE REPORT UM FIELD */

         if report_um <> "" then do:
            for first um_mstr no-lock where
               um_mstr.um_domain = global_domain and (
               um_um             = report_um     or
               um_alt_um         = report_um ) :
            end.
            if not available um_mstr then do:
               /* INVALID UNIT OF MEASURE */
               {us/bbi/pxmsg.i &MSGNUM=1019 &ERRORLEVEL=3}
               next-prompt report_um with frame a.
               undo loop2, retry loop2.
            end. /* IF NOT AVAILABLE um_mstr */
         end. /* IF report_um <> "" */

         /* VALIDATE SORT OPTION FIELD */
         if sortoption <> 1  and
            sortoption <> 2  and
            sortoption <> 3  then do:
            /* INVALID SORT OPTION */
            {us/bbi/pxmsg.i &MSGNUM=2313 &ERRORLEVEL=3}
            next-prompt sortoption with frame a.
            undo loop2, retry loop2.
         end.
      end. /* LOOP2 */
   end. /* LOOP1 */

   if (c-application-mode <> "WEB") or
      (c-application-mode = "WEB" and
      (c-web-request begins "DATA")) then do:

      bcdparm = "".
      {us/mf/mfquoter.i cust_source}
      {us/mf/mfquoter.i cust}
      {us/mf/mfquoter.i cust1}
      {us/mf/mfquoter.i shipto}
      {us/mf/mfquoter.i shipto1}
      {us/mf/mfquoter.i site}
      {us/mf/mfquoter.i site1}
      {us/mf/mfquoter.i order}
      {us/mf/mfquoter.i order1}
      {us/mf/mfquoter.i part}
      {us/mf/mfquoter.i part1}
      {us/mf/mfquoter.i cpart}
      {us/mf/mfquoter.i cpart1}
      {us/mf/mfquoter.i shipdate}
      {us/mf/mfquoter.i shipdate1}
      {us/mf/mfquoter.i ordclass}
      {us/mf/mfquoter.i ordclass1}
      {us/mf/mfquoter.i perf_date}
      {us/mf/mfquoter.i exceptions_only}
      {us/mf/mfquoter.i include_amt}
      {us/mf/mfquoter.i include_cmmt}
      {us/mf/mfquoter.i report_detail}
      {us/mf/mfquoter.i report_um}
      {us/mf/mfquoter.i sortoption}

      if site1 = "" then site1 = hi_char.
      if shipto1 = "" then shipto1 = hi_char.
      if cust1 = "" then cust1 = hi_char.
      if order1 = "" then order1 = hi_char.
      if part1 = "" then part1 = hi_char.
      if cpart1 = "" then cpart1 = hi_char.
      if shipdate = ? then shipdate = low_date.
      if shipdate1 = ? then shipdate1 = hi_date.
      if ordclass1 = "" then ordclass1 = hi_char.

   end. /* if c-application-mode ... */

   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 132
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
   {us/bbi/mfphead.i}

   {us/gp/gplnga2n.i
      &file = ""shpc_ctrl""
      &field = ""shpc_meas_subtype""
      &code = date_type_code
      &mnemonic = "perf_date"
      &label = date_type_label}

   if sortoption = 1 then do:
/*cy1044*      {us/bbi/gprun.i ""soshprpa.p"" */
/*cy1044*/     {us/bbi/gprun.i ""xxshprpa.p""
         "(input cust_source,
           input cust,
           input cust1,
           input shipto,
           input shipto1,
           input site,
           input site1,
           input order,
           input order1,
           input part,
           input part1,
           input cpart,
           input cpart1,
           input shipdate,
           input shipdate1,
           input ordclass,
           input ordclass1,
           input perf_date,
           input exceptions_only,
           input include_amt,
           input include_cmmt,
           input report_detail,
           input report_um)"}
   end.

   if sortoption = 2 then do:
/*cy1044*      {us/bbi/gprun.i ""soshprpb.p"" */
/*cy1044*/     {us/bbi/gprun.i ""xxshprpb.p""
         "(input cust_source,
           input cust,
           input cust1,
           input shipto,
           input shipto1,
           input site,
           input site1,
           input order,
           input order1,
           input part,
           input part1,
           input cpart,
           input cpart1,
           input shipdate,
           input shipdate1,
           input ordclass,
           input ordclass1,
           input perf_date,
           input exceptions_only,
           input include_amt,
           input include_cmmt,
           input report_detail,
           input report_um)"}
   end.

   if sortoption = 3 then do:
/*cy1044*      {us/bbi/gprun.i ""soshprpc.p"" */
/*cy1044*/     {us/bbi/gprun.i ""xxshprpc.p""
         "(input cust_source,
           input cust,
           input cust1,
           input shipto,
           input shipto1,
           input site,
           input site1,
           input order,
           input order1,
           input part,
           input part1,
           input cpart,
           input cpart1,
           input shipdate,
           input shipdate1,
           input ordclass,
           input ordclass1,
           input perf_date,
           input exceptions_only,
           input include_amt,
           input include_cmmt,
           input report_detail,
           input report_um)"}
   end.

   {us/mf/mfrtrail.i}

end. /* repeat */

{us/wb/wbrp04.i &frame-spec = a}

/* INTERNAL PROCEDURE */

PROCEDURE get_msg_desc:
   define input parameter lang like msg_lang no-undo.
   define input parameter message_nbr like msg_nbr no-undo.
   define output parameter message_desc like msg_desc no-undo.

   for first msg_mstr no-lock where
         msg_lang = lang        and
         msg_nbr  = message_nbr:
   end.
   if available msg_mstr then
      message_desc = msg_desc.
   else
      message_desc = "".

END PROCEDURE.
