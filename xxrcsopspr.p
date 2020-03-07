/* xxrcsopspr.p - INVOICE PRINT AFTER INVOICE POST  - from shipper routines     */
/* rcsopspr.p - INVOICE PRINT AFTER INVOICE POST  - from shipper routines     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrcsopspr.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* Revision: 1.1      BY: Katie Hilbert         DATE: 07/17/07   ECO: *R0C6*  */
/* Revision: 1.2      BY: Yizhou Mao            DATE: 02/11/09   ECO: *R1BY*  */
/* Revision: 1.3      BY: Xiaolei Meng          DATE: 08/02/09   ECO: *R1N2*  */
/* $Revision: 1.2 $   BY: Katie Hilbert         DATE: 02/20/10   ECO: *R1YB*  */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 30-MAY-2013    BY:  gbg *c1415*                     */
/* CYB    LAST MODIFIED: 2015-01-07     BY:  gbg *c1512*                     */
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
{us/fs/fsdeclr.i new}
define new shared stream ft.
/*c1603* start added code */
{us/xf/xfso10u.i "new"} /*eb3sp5*/
{us/xf/xfdefa.i} /*eb3sp5*/
{us/xf/xfso10v.i "new"} /*eb3sp5*/
/*c1603* end added code */
/*d2101*/ {us/xx/xxauis2.i}
/*cy1002c*/ def new shared var outboth        as logical initial yes
/*cy1002c*/                                   label "Output All".
/*cy1002c*/ def new shared var outtype        as logical
/*cy1002c*/                                   format "Email/Print"
/*cy1002c*/                                   label "Output Type".
/*c1415* start added code */
def shared var gvproofofdelivery like mfc_logical
                              label "Proof of Delivery".
lvproofofdelivery = gvproofofdelivery.
/*c1415* end   added code */

define new shared variable site             like ih_site.
define new shared variable site1            like ih_site.
define new shared variable oldcurr          like ih_curr.
define new shared variable dom-proc         as integer no-undo.
define new shared variable update_invoice   like mfc_logical label "Update Invoices".
define new shared variable first_line       like mfc_logical.
define new shared variable ih_recno         as recid.
define new shared variable billto           as character
                                            format "x(38)" extent 6.
define new shared variable soldto           as character
                                            format "x(38)" extent 6.
define new shared variable termsdesc        as character format "x(40)" label "Description" no-undo.
define new shared variable base_rpt         as character.
define new shared variable override_print_hist like mfc_logical
                                            label "Override Print Invoice".
define new shared variable hdr_po           as character format "X(38)".
define new shared variable resale           like cm_resale.
define new shared variable reprint          like mfc_logical.
define new shared variable daybook          as character no-undo.
define new shared variable daybook1         as character no-undo.
define new shared variable inv_batch        like ih_batch no-undo.
define new shared variable inv_batch1       like ih_batch no-undo.

define shared variable msg                 like msg_desc.
define shared variable prt_cor             like mfc_logical.
define shared variable nbr1                like so_nbr.
define shared variable inv                 like so_inv_nbr.
define shared variable inv1                like so_inv_nbr.
define shared variable cust                like ih_cust.
define shared variable cust1               like ih_cust.
define shared variable bill                like ih_bill.
define shared variable bill1               like ih_bill.
define shared variable ship                like so_ship.
define shared variable ship1               like so_ship.
define shared variable inv_date            like so_inv_date.
define shared variable inv_date1           like ih_inv_date.
define shared variable shipdate            like so_ship_date.
define shared variable shipdate1           like shipdate.
define shared variable lang                like so_lang.
define shared variable lang1               like lang.
define shared variable sls-psn             like so_slspsn[1] no-undo.
define shared variable sls-psn1            like so_slspsn[1] no-undo.
define shared variable form_code           as character no-undo.
define shared variable batch               like ar_batch.
define shared variable first_batch         like ar_batch.
define shared variable report_framework    like mfc_logical initial no no-undo.
define shared variable comp_addr           like soc_company.
define variable run_file                   as character format "x(12)" no-undo.
define variable l_prt_width                as integer no-undo.

/* Fiscal number definitions */
define new shared variable update_fnbr     like mfc_logical initial no no-undo.
define new shared variable fnbr_seq        like nr_seqid               no-undo.
define variable l_success as logical initial no no-undo.

/* DEFINE VARIABLES USED IN GPGLEF1.P (GL CALENDAR VALIDATION) */
{us/gp/gpglefv.i}
/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtecdf.i &var="new shared"}
{us/gp/gpvtepdf.i &var="new shared"}

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

   /* set to yes to allow creating fiscal number xref record */
   assign
      update_fnbr    = yes.
end.

if form_code = "11" 
then
   l_prt_width = 132.
else
   l_prt_width = 80.

/* Show print setings frame */
{us/so/soprstfr.i &New="new"
            &ShowFrame=no
            &ParentFrame=a
            &PrintTax="not prt_cor"
            &PrintWidth=l_prt_width}

if report_framework then do:
   run resetSharedVars.
   {us/bbi/gprun.i ""soivrfrpt.p""}
   return.
end.

/* OUTPUT DESTINATION SELECTION */
{us/gp/gpselout.i &printType          = "printer"
            &printWidth               = l_prt_width
            &pagedFlag                = " "
            &stream                   = "stream ft"
            &appendToFile             = " "
            &streamedOutputToTerminal = " "
            &withBatchOption          = "no"
            &displayStatementType     = 1
            &withCancelMessage        = "yes"
            &pageBottomMargin         = 6
            &withEmail                = "yes"
            &withWinprint             = "yes"
            &defineVariables          = "no"
            &device                   = invprinter}

do transaction:
   if prt_cor then do:
      run resetSharedVars.

      /* PRINT INVOICE CORRECTIONS */
      {us/bbi/gprun.i ""socirp10.p""}
   end.
   else do:
      {us/gp/gprfile.i}
      run resetSharedVars.
 
      if comp_addr <> ""
      then do:
         for first ad_mstr
            where ad_domain = global_domain
            and   ad_addr   = comp_addr
         no-lock:
            {us/gp/gpvtecrg.i} 
         end. /* FOR FIRST ad_mstr... */
      end. /* IF comp_addr <> "" */

      /* PRINT INVOICES (SOIV1001) DEFAULT WHEN */
      /* FORM CODE IS '1'. FORM CODE '11' CAN   */
      /* CAN BE USED FOR BRAZILIAN PRINT        */
      /* NOTA FISCAL FORMAT                     */
/*      {us/bbi/gprun.i " ""soiv10"" + run_file + "".p"" "} */
/*cy1045* /*eb3sp5*   {us/bbi/gprun.i " ""xfiv10"" + run_file + "".p"" "} */ */
/*cy1045* /*eb3sp5*   {us/bbi/gprun.i " ""xxfiv10"" + run_file + "".p"" "} */ */
/*c1512* /*cy1045*/ {us/bbi/gprun.i " ""xxiv10"" + run_file + "".p"" "}  */
/*c1512*/ {us/bbi/gprun.i " ""xxiv10"" + run_file + "".p"" "} 
   end.
end.

{us/bbi/mfreset.i}

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

   if first_batch <> "" then inv_batch = first_batch.
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
