/* xxfivpspr.p - INVOICE PRINT AFTER INVOICE POST                             */
/* xfivpspr.p - INVOICE PRINT AFTER INVOICE POST                              */
/* soivpspr.p - INVOICE PRINT AFTER INVOICE POST                              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxfivps01.p,v 1.2 2018/03/13 17:09:57 gbg Exp $: */
/* Revision: 1.1        BY: Katie Hilbert       DATE: 05/31/07   ECO: *R0C6*  */
/* Revision: 1.2        BY: Katie Hilbert       DATE: 07/23/08   ECO: *R0YS*  */
/* Revision: 1.3        BY: Yizhou Mao          DATE: 02/11/09   ECO: *R1BY*  */
/* Revision: 1.4        BY: Xiaolei Meng        DATE: 08/02/09   ECO: *R1N2*  */
/* $Revision: 1.2 $     BY: Jean Miller         DATE: 11/23/09   ECO: *R1TW*  */
/* Revision: QAD2016    BY: sxh                 DATE: 06/04/16  ECO: *grc338* */
/* CYB       LAST MODIFIED: 07-MAY-2013     BY: gbg *c1398*                   */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/mf/mfsprtdf.i}
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}

{us/so/soivpst.i "shared"}
{us/fs/fsdeclr.i new}

{us/et/etvar.i &new="new"}
{us/et/etrpvar.i &new="new"}

define new shared variable dom-proc            as    integer   no-undo.
define new shared variable update_invoice      like  mfc_logical label "Update Invoices".
define new shared variable dnbr                like  ih_nbr no-undo.
define new shared variable dnbr1               like  ih_nbr no-undo.
define new shared variable site1               like  ih_site.
define new shared variable inv_batch           like  ih_batch no-undo.
define new shared variable inv_batch1          like  ih_batch no-undo.
define new shared variable daybook             as    character no-undo.
define new shared variable daybook1            as    character no-undo.

define shared variable disc_det_key        like  lngd_key1.
define shared variable disc_sum_key        like  lngd_key1.
define shared variable msg                 like  msg_desc.
define shared variable prt_cor             like  mfc_logical.
define shared variable inv_date            like  so_inv_date.
define shared variable inv_date1           like  ih_inv_date.
define shared variable shipdate            like  so_ship_date.
define shared variable shipdate1           like  shipdate.
define shared variable lang                like  so_lang.
define shared variable lang1               like  lang.
define shared variable sls-psn             like so_slspsn[1] no-undo.
define shared variable sls-psn1            like so_slspsn[1] no-undo.
define shared variable form_code           as character format "x(2)" no-undo.
define shared variable ship                like  so_ship.
define shared variable ship1               like  so_ship.
define variable run_file                   as character format "x(12)" no-undo.
define variable prt_width                  as integer   no-undo.

/* Fiscal number definitions */
define new shared variable update_fnbr     like mfc_logical initial no no-undo.
define new shared variable fnbr_seq        like nr_seqid               no-undo.
define variable l_success as logical initial no no-undo.

/* DEFINE VARIABLES USED IN GPGLEF1.P (GL CALENDAR VALIDATION) */
{us/gp/gpglefv.i}
/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtepdf.i &var="shared"}
{us/gp/gpvtecdf.i &var="shared"}

/* Shared variables definitions */
{us/so/soprsets.i}

{us/xf/xfso10u.i} /*grc338*/
{us/xf/xfdefa.i} /*grc338*/
{us/xf/xfso10v.i} /*grc338*/

form
with frame a no-labels width 80.

assign
   update_invoice = true.

find first soc_ctrl where soc_ctrl.soc_domain = global_domain no-lock no-error.
if available soc_ctrl and soc_use_fnbr
then do:
   /* Set fiscal number sequence */
   {us/gp/gprunp.i "soldfnbr" "p" "setFiscalNbrSeq"
             "(input-output fnbr_seq,
               output       l_success)"}
   if not l_success then do:
      return.
   end.

   /* Set to yes to allow creating fiscal number xref record */
   assign
      update_fnbr    = yes.
end.

if report_framework then do:
   run resetSharedVars.
   {us/bbi/gprun.i ""soivrfrpt.p""}
   return.
end.

if form_code = "11"  or prt_cor then
   prt_width = 132.
else
   prt_width = 80.

/* OUTPUT DESTINATION SELECTION */
/*grc338 comment begin
{us/gp/gpselout.i &printType                = "printer"
            &printWidth               = prt_width
            &pagedFlag                = " "
            &stream                   = " "
            &appendToFile             = " "
            &streamedOutputToTerminal = " "
            &withBatchOption          = "yes"
            &displayStatementType     = 1
            &withCancelMessage        = "yes"
            &pageBottomMargin         = 6
            &withEmail                = "yes"
            &withWinprint             = "yes"
            &defineVariables          = "no"
            &device                   = "dev2"}
grc338 comment end*/
/*grc338 add begin*/
{us/gp/gpselout.i &printType                = "printer"
            &printWidth               = prt_width
            &pagedFlag                = " "
            &stream                   = "stream ft"
            &appendToFile             = " "
            &streamedOutputToTerminal = " "
            &withBatchOption          = "yes"
            &displayStatementType     = 1
            &withCancelMessage        = "yes"
            &pageBottomMargin         = 6
            &withEmail                = "yes"
            &withWinprint             = "yes"
            &defineVariables          = "no"
            &device                   = "dev2"}
/*grc338 add end*/

do transaction:
   if prt_cor then do:
      run resetSharedVars.

      /* PRINT INVOICE CORRECTIONS */
     /*grc338 {us/bbi/gprun.i ""socirp10.p""} */
     /*grc338*/ {us/bbi/gprun.i ""xfcirp10.p""}
   end.
   else do:
      {us/gp/gprfile.i}
      run resetSharedVars.

      /* PRINT INVOICES (SOIV1001) DEFAULT WHEN */
      /* FORM CODE IS '1'. FORM CODE '11' CAN   */
      /* CAN BE USED FOR BRAZILIAN PRINT        */
      /* NOTA FISCAL FORMAT                     */
      /*grc338      {us/bbi/gprun.i " ""soiv10"" + run_file + "".p"" "} */
/*c1398*    /*93sp12.1 */     {us/bbi/gprun.i " ""xfiv10"" + run_file + "".p"" "}  */
/*c1398*/   {us/bbi/gprun.i " ""xxxiv10"" + run_file + "".p"" "}  
   end.
end.

/*grc338 {us/bbi/mfreset.i} */
/*grc338*/ {us/bbi/mfreset.i "stream ft"}

PROCEDURE resetSharedVars:
/*---------------------------------------------------------------
    Purpose: Ensure that null variables have hi and low values.
 Parameters: <input>  - none
             <output> - none
      Notes:
---------------------------------------------------------------*/
   assign
      inv        = ""
      inv1       = hi_char
      inv_batch  = batch
      inv_batch1 = batch.

   if nbr1      = "" then nbr1      = hi_char.
   if inv_date  = ?  then inv_date  = low_date.
   if inv_date1 = ?  then inv_date1 = hi_date.
   if shipdate  = ?  then shipdate  = low_date.
   if shipdate1 = ?  then shipdate1 = hi_date.
   if site1     = "" then site1     = hi_char.
   if cust1     = "" then cust1     = hi_char.
   if bill1     = "" then bill1     = hi_char.
   if ship1     = "" then ship1     = hi_char.
   if lang1     = "" then lang1     = hi_char.
   if daybook1  = "" then daybook1  = hi_char.
   if sls-psn1  = "" then sls-psn1  = hi_char.

END PROCEDURE.
