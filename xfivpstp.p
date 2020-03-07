/* xfivpstp.p  -  PRINT INVOICE SELECTION PROGRAM                             */
/* soivpstp.p  -  PRINT INVOICE SELECTION PROGRAM                             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivpstp.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* Revision: 1.1          BY: Arun Kumar          DATE: 07/18/07  ECO: *R0C6* */
/* Revision: 1.2          BY: Jean Miller         DATE: 10/07/08  ECO: *R15M* */
/* Revision: 1.3          BY: Xiaolei Meng        DATE: 07/31/09  ECO: *R1N2* */
/* Revision: 1.4          BY: Laxmikant Bondre    DATE: 10/14/09  ECO: *R1SF* */
/* $Revision: 1.2 $          BY: Anish Mandalia      DATE: 05/27/10  ECO: *R20T* */
/* Revision: QAD2016      BY: sxh     DATE: 06/04/16 ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
 
/* THIS PROGRAM IS CALLED BY INVOICE POST WHEN THE USER OPTS TO POST AND      */
/* PRINT INVOICES. HENCE THIS PROGRAM IS ONLY CALLED WHEN PRINT INVOICES IS   */
/* SET TO YES. IT IS USED TO EXTRACT PRINT INVOICE SELECTION PARAMETERS VIA   */
/* THE DEFINE FORM. ONCE THE UPDATE IS COMPLETED, THE SELECTION PARAMETERS ARE*/
/* COPIED TO THE OUTPUT TEMP-TABLE. THIS IS THEN USED BY INVOICE POST TO CALL */
/* THE INVOICE PRINT SUB ROUTINES.                                            */
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* DISPLAY TITLE */
{us/mf/mfdtitle.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i adctxr}
 
/* TEMP TABLE DEFINITION FOR ttInvoicePrint */
{us/tt/ttinvprt.i}
 
define output parameter table for ttInvoicePrint.
 
define shared variable inv_date             like so_inv_date.
define shared variable prt_cor              like mfc_logical.
 
define variable call-detail         like mfc_logical label "Print Call Invoice Detail" initial no.
define variable first_line          like mfc_logical no-undo .
define variable inv_only            like mfc_logical initial no no-undo.
define variable override_print_hist like mfc_logical label "Override Print Invoice"                      no-undo.
define variable print_lotserials    like mfc_logical initial no label "Print Lot/Serial Numbers Shipped" no-undo.
define variable print_options       like mfc_logical initial no label "Print Features and Options"                   no-undo.
define variable report_framework    like mfc_logical initial no no-undo.
define variable update_invoice      like mfc_logical no-undo.
define variable has_rf_report       like mfc_logical no-undo initial no.
 
define variable comp_addr           like soc_company no-undo.
define variable disc_det            like lngd_translation label "Discount Detail".
define variable disc_det_key        like lngd_key1 initial "1".
define variable disc_sum            like disc_det         label "Discount Summary".
define variable disc_sum_key        like lngd_key1 initial "1".
define variable msg                 like msg_desc    no-undo.
 
define variable addr                as character format "x(38)" extent 6 no-undo.
define variable base_rpt            as character                     no-undo.
define variable company             as character format "x(38)" extent 6 no-undo.
define variable form_code           as character format "x(2)" label "Form Code" no-undo.
define variable prog_name           as character                     no-undo.
define variable program_name        as character initial 'soprint.p' no-undo.
define variable pages               as integer   no-undo.
define variable ih_recno            as recid     no-undo.
 
/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtegl.i}
{us/gp/gpvtecdf.i &var="shared"}
{us/gp/gpvtepdf.i &var="shared"}
 
/* Determine whether API enabled version of RF is installed and whether converted report has been loaded */
assign has_rf_report = (({us/bbi/gpiswrap.i}) and (search("com/qad/shell/report/BatchServiceNextId.p") <> ?) and
  (can-find(first rptres_mstr where rptres_code = "QAD_InvoicePrintReprint"))).

find first soc_ctrl where soc_domain = global_domain
no-lock no-error.
 
form
   inv_date            colon 35
   comp_addr           colon 35
   print_lotserials    colon 35
   print_options       colon 35
   override_print_hist colon 35
   disc_det            colon 35
   disc_sum            colon 35
   form_code           colon 35 deblank skip
   inv_only            colon 35
   call-detail         colon 35
   report_framework    colon 35 skip(1)
   msg
   skip(1)
with frame a side-labels width 80.
report_framework:hidden in frame a = (has_rf_report = no).
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
assign
   update_invoice = yes
   inv_date       = today.
 
create ttInvoicePrint.
 
find first lngd_det
   where lngd_dataset = program_name
     and lngd_field   = "det_disc_prnt"
     and lngd_lang    = global_user_lang
     and lngd_key1    = disc_det_key
no-lock no-error.
 
if available lngd_det then
   disc_det = lngd_translation.
else
   disc_det = "".
 
find first lngd_det
   where lngd_dataset = program_name
     and lngd_field   = "det_disc_prnt"
     and lngd_lang    = global_user_lang
     and lngd_key1    = disc_sum_key
no-lock no-error.
 
if available lngd_det then
   disc_sum = lngd_translation.
else
   disc_sum = "".
 
if form_code = "" then
   /* form_code = "1". */ /*grc338*/
   form_code = "9". /*grc338*/
 
if available soc_ctrl
then do:
   if comp_addr = "" 
   then 
      comp_addr = soc_comp.

   inv_only  = soc_ln_inv.
end. /* IF AVAILABLE soc_ctrl */

view frame a.
 
update
   inv_date
   comp_addr
   print_lotserials
   print_options
   override_print_hist
   disc_det
   disc_sum
   form_code
   inv_only
   call-detail
   report_framework when(has_rf_report)
   msg
with frame a
editing:
   if frame-field = "disc_det"
   then do:
      {us/mf/mfnp05.i lngd_det lngd_trans
         "     lngd_dataset = program_name
           and lngd_field   = 'det_disc_prnt'
           and lngd_lang    = global_user_lang"
         lngd_translation "input disc_det" }
      if recno <> ? then
         display lngd_translation @ disc_det
         with frame a.
   end.
   else if frame-field = "disc_sum"
   then do:
      {us/mf/mfnp05.i lngd_det lngd_trans
         "    lngd_dataset = program_name
           and lngd_field   = 'det_disc_prnt'
           and lngd_lang    = global_user_lang"
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
 
/* Validate discount print options */
find first lngd_det
   where lngd_dataset     = program_name
     and lngd_field       = "det_disc_prnt"
     and lngd_lang        = global_user_lang
     and lngd_translation = input disc_det
no-lock no-error.
 
if not available lngd_det
then do:
   /* Invalid Option */
   {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_det}
   {us/bbi/gprun.i ""gpmsgls1.p""
      "(6928, program_name, 'det_disc_prnt', global_user_lang )"}
   next-prompt disc_det with frame a.
   undo, retry.
end.
 
disc_det_key = lngd_key1.
 
find first lngd_det
   where lngd_dataset     = program_name
     and lngd_field       = "det_disc_prnt"
     and lngd_lang        = global_user_lang
     and lngd_translation = input disc_sum
no-lock no-error.
 
if not available lngd_det
then do:
   /* Invalid Option */
   {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_sum}
   {us/bbi/gprun.i ""gpmsgls1.p""
      "(6928, program_name, 'det_disc_prnt', global_user_lang )"}
   next-prompt disc_sum with frame a.
   undo, retry.
end.
 
assign
   disc_sum_key = lngd_key1
   bcdparm      = bcdparm + chr(10).
 
{us/mf/mfquoter.i inv_date}
{us/mf/mfquoter.i comp_addr}
{us/mf/mfquoter.i print_lotserials}
{us/mf/mfquoter.i print_options}
{us/mf/mfquoter.i override_print_hist}
{us/mf/mfquoter.i disc_det  }
{us/mf/mfquoter.i disc_sum  }
{us/mf/mfquoter.i form_code}
{us/mf/mfquoter.i inv_only}
{us/mf/mfquoter.i call-detail}
{us/mf/mfquoter.i msg}
 
if comp_addr <> ""
then do:
 
   find ad_mstr where ad_mstr.ad_domain = global_domain
        and ad_addr = comp_addr
   no-lock no-wait no-error.
 
   if available ad_mstr
   then do:
 
      if not can-find(ls_mstr where ls_domain = global_domain
           and ls_addr = ad_addr
           and ls_type = "company")
      then do:
         /*  Address must be for a company */
         {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
         next-prompt comp_addr.
         undo, retry.
      end.
  
      for first ttInvoicePrint:
         assign
            ttInvoicePrint.cAddr[1] = ad_name
            ttInvoicePrint.cAddr[2] = ad_line1
            ttInvoicePrint.cAddr[3] = ad_line2
            ttInvoicePrint.cAddr[4] = ad_line3.
 
         {us/px/pxrun.i &PROC  = 'getCountryDescription'
            &PROGRAM = 'adctxr.p'
            &HANDLE = ph_adctxr
            &PARAM = "(input ad_ctry,
                       output ttInvoicePrint.cAddr[6])"
            &NOAPPERROR = true
            &CATCHERROR = true}
 
         {us/mf/mfcsz.i ttInvoicePrint.cAddr[5] ad_city ad_state ad_zip}.
 
         {us/bbi/gprun.i ""gpaddr.p"" }
 
      end.
 
      for first ttInvoicePrint:
         assign
            ttInvoicePrint.cCompany[1] = ttInvoicePrint.caddr[1]
            ttInvoicePrint.cCompany[2] = ttInvoicePrint.caddr[2]
            ttInvoicePrint.cCompany[3] = ttInvoicePrint.caddr[3]
            ttInvoicePrint.cCompany[4] = ttInvoicePrint.caddr[4]
            ttInvoicePrint.cCompany[5] = ttInvoicePrint.caddr[5]
            ttInvoicePrint.cCompany[6] = ttInvoicePrint.caddr[6].
 
         /* FIND VAT REG. NO & COUNTRY CODE */
         {us/gp/gpvtecrg.i}
      end.
   end.
   else do:
      {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
      /*  Address must be for a company */
      next-prompt comp_addr.
      undo, retry.
   end.
end.
 
/* Show print setings frame */
{us/so/soprstfr.i &ShowFrame=yes
            &ParentFrame=a
            &PrintTax="not prt_cor"
            &PrintWidth=0}
 
run mapSharedVariablesToTempTable.
 
PROCEDURE mapSharedVariablesToTempTable:
/*---------------------------------------------------------------
    Purpose: Populates the ttInvoicePrint with
             selection parameters
 Parameters: <input>
             <output>
      Notes:
---------------------------------------------------------------*/
 
   find first ttInvoicePrint.
   if not available(ttInvoicePrint)
   then do:
      create ttInvoicePrint.
   end.
 
   for first ttInvoicePrint:
      assign
         ttInvoicePrint.lPrint_lotserials    = print_lotserials
         ttInvoicePrint.lPrint_options       = print_options
         ttInvoicePrint.lOverride_print_hist = override_print_hist
         ttInvoicePrint.cComp_addr           = comp_addr
         ttInvoicePrint.cDisc_det            = disc_det
         ttInvoicePrint.cDisc_sum            = disc_sum
         ttInvoicePrint.cForm_code           = form_code
         ttInvoicePrint.lInv_only            = inv_only
         ttInvoicePrint.lCall-detail         = call-detail
         ttInvoicePrint.lUpdate_invoice      = yes
         ttInvoicePrint.cProg_name           = prog_name
         ttInvoicePrint.cMsg                 = msg
         ttInvoicePrint.lFirst_line          = first_line
         ttInvoicePrint.iPages               = pages
         ttInvoicePrint.rIh_recno            = ih_recno
         ttInvoicePrint.lReport_Framework    = report_framework
         .
   end.
END PROCEDURE.
