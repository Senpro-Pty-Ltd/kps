/* xxsosomtc.p - SALES ORDER MAINTENANCE TRAILER SECTION                  */
/* sosomtc.p - SALES ORDER MAINTENANCE TRAILER SECTION                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsosomtc.p,v 1.2 2018/03/13 17:10:01 gbg Exp $: */
/* REVISION: 6.0      LAST MODIFIED: 08/08/90   BY: MLB *D055**/
/* REVISION: 6.0      LAST MODIFIED: 08/29/90   BY: pml *D063**/
/* REVISION: 6.0      LAST MODIFIED: 10/29/90   BY: MLB *D148**/
/* REVISION: 6.0      LAST MODIFIED: 11/14/90   BY: MLB *D208**/
/* REVISION: 6.0      LAST MODIFIED: 12/11/90   BY: MLB *D238**/
/* REVISION: 6.0      LAST MODIFIED: 04/09/91   BY: bjb *D625**/
/* REVISION: 6.0      LAST MODIFIED: 04/26/91   BY: MLV *D559**/
/* REVISION: 7.0      LAST MODIFIED: 09/17/91   BY: MLV *F015**/
/* REVISION: 7.0      LAST MODIFIED: 10/14/91   BY: dgh *D892**/
/* REVISION: 7.0      LAST MODIFIED: 11/14/91   BY: pma *F003**/
/* REVISION: 7.0      LAST MODIFIED: 03/17/92   BY: tjs *F273**/
/* REVISION: 7.0      LAST MODIFIED: 04/06/92   BY: dld *F358**/
/* REVISION: 7.0      LAST MODIFIED: 04/22/92   BY: tjs *F421**/
/* REVISION: 7.0      LAST MODIFIED: 05/28/92   By: jcd *F402**/
/* REVISION: 7.0      LAST MODIFIED: 06/26/92   BY: afs *F676**/
/* REVISION: 7.0      LAST MODIFIED: 06/19/92   BY: tmd *F458**/
/* REVISION: 7.0      LAST MODIFIED: 08/04/92   BY: tjs *F765**/
/* REVISION: 7.3      LAST MODIFIED: 09/16/92   BY: tjs *G035**/
/* REVISION: 7.3      LAST MODIFIED: 10/06/92   BY: mpp *G013**/
/* REVISION: 7.3      LAST MODIFIED: 02/04/92   BY: bcm *G415**/
/* REVISION: 7.3      LAST MODIFIED: 03/18/93   BY: tjs *G588**/
/* REVISION: 7.3      LAST MODIFIED: 02/18/93   BY: afs *G692**/
/* REVISION: 7.3      LAST MODIFIED: 03/22/93   BY: tjs *G858**/
/* REVISION: 7.4      LAST MODIFIED: 09/22/93   BY: pcd *H008**/
/* REVISION: 7.4      LAST MODIFIED: 07/01/93   BY: bcm *H002**/
/* REVISION: 7.4      LAST MODIFIED: 08/23/93   BY: cdt *H049**/
/* REVISION: 7.4      LAST MODIFIED: 10/26/93   BY: tjs *H188**/
/* REVISION: 7.4      LAST MODIFIED: 02/16/94   BY: afs *H281**/
/* REVISION: 7.4      LAST MODIFIED: 06/17/94   BY: qzl *H391**/
/* REVISION: 7.4      LAST MODIFIED: 06/20/94   BY: afs *GK32**/
/* REVISION: 7.4      LAST MODIFIED: 08/25/94   BY: dpm *FQ25**/
/* REVISION: 7.4      LAST MODIFIED: 10/21/94   BY: rmh *FQ08**/
/* REVISION: 7.3      LAST MODIFIED: 03/16/95   BY: WUG *G0CW**/
/* REVISION: 8.5      LAST MODIFIED: 03/15/95   BY: DAH *J042**/
/* REVISION: 7.4      LAST MODIFIED: 10/12/95   BY: jym *G0YX**/
/* REVISION: 7.4      LAST MODIFIED: 10/20/95   BY: jym *G0XY**/
/* REVISION: 8.5      LAST MODIFIED: 07/12/95   BY: TAF *J053**/
/* REVISION: 8.5      LAST MODIFIED: 02/27/96   BY: *J04C* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 06/10/96   BY: *J0RX* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 08/02/96   BY: *J12Q Andy Wasilczuk      */
/* REVISION: 8.5      LAST MODIFIED: 08/06/96   BY: *G1ZR suresh Nayak        */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Elke Van Maele     */
/* REVISION: 8.6      LAST MODIFIED: 05/07/97   BY: *J1P5* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 11/14/97   BY: *H1GN* Seema Varma        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* EvdGevel           */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L024* Sami Kureishy      */
/* REVISION: 8.6E     LAST MODIFIED: 02/16/99   BY: *J3B4* Madhavi Pradhan    */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Patti Gaultney     */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 04/25/00   BY: *N0CG* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 07/06/00   BY: *N0F4* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *FT54*                    */
/* Old ECO marker removed, but no ECO header exists *G1ZR*                    */
/* Old ECO marker removed, but no ECO header exists *J12Q*                    */
/* Revision: 1.23        BY: Katie Hilbert        DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.24        BY: Nikita Joshi         DATE: 06/19/01  ECO: *M1BP* */
/* Revision: 1.26        BY: Ellen Borden         DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.27        BY: Jean Miller          DATE: 08/09/01  ECO: *M11Z* */
/* Revision: 1.29        BY: B. Gates             DATE: 03/04/02  ECO: *N1BT* */
/* Revision: 1.33        BY: Paul Donnelly (SB)   DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.34        BY: Ed van de Gevel      DATE: 12/24/03  ECO: *P0SV* */
/* Revision: 1.36        BY: Ed van de Gevel      DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.37        BY: Arun Kumar           DATE: 02/07/07  ECO: *R0C6* */
/* Revision: 1.38        BY: Dilip Manawat        DATE: 05/23/08  ECO: *R0TM* */
/* Revision: 1.39        BY: Jean Miller          DATE: 06/15/08  ECO: *R0TC* */
/* $Revision: 1.2 $     BY: Jean Miller          DATE: 07/10/08  ECO: *R0WK* */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB    LAST MODIFIED: 27-Sep-2010    BY:  gbg *q9021*cy1022a*             */
/* CYB    LAST MODIFIED: 22 Sep 2010    BY:  nac *q9021*C1197c*              */
/* CYB    LAST MODIFIED: 22 Sep 2011    BY:  gbg *c1244*                     */
/* CYB    LAST MODIFIED: 23-MAR-2012    BY:  gbg *c1286*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 29-APR-2013    BY:  gbg *c1394*                     */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */


/* PASSED PARAMETERS
this-is-ssm      -   SPECIFIES WHETHER ORDER IS SO OR SSM ORDER
*/

define input parameter this-is-ssm as logical no-undo.

define new shared variable convertmode as character no-undo initial "MAINT".
define new shared variable due_date_range like mfc_logical initial no.
define new shared variable date_range     like sod_due_date.
define new shared variable date_range1    like sod_due_date.

define new shared variable undo_mtc2           like mfc_logical.
define new shared variable undo_mtc3           like mfc_logical.
define new shared variable undo_trl2           like mfc_logical.
define new shared variable undo_mainblk        like mfc_logical no-undo.

define shared variable rndmthd like rnd_rnd_mthd.
define shared variable cr_terms_changed like mfc_logical no-undo.
define shared variable so_recno as recid.
define shared variable cm_recno as recid.
define shared variable new_order like mfc_logical.
define shared variable sotax_trl like tax_trl.
define shared variable base_amt like ar_amt.
define shared variable balance_fmt as character.
define shared variable limit_fmt as character.
define shared variable prepaid_fmt as character no-undo.
define shared variable calc_fr    like mfc_logical.
define shared variable disp_fr    like mfc_logical.
define shared variable freight_ok like mfc_logical.
/*cy1197c*/ define shared variable cyb_so_type as char no-undo.

define variable newqty   like sod_fr_chg  no-undo.
define variable reveqty  like mfc_logical no-undo.
define variable nqty     like sod_fr_chg  no-undo.
define variable must_skip as logical       no-undo.

define variable totalorder as decimal no-undo.

define variable hCreditManagementLib  as handle  no-undo.
define variable iReturnStatus         as integer no-undo.

/*cy1020* start added code */
def var vMessage as char.
def var vErrNbr   as int.
def var vErrMsg   as char.
def var ok2ship   as log.
/*c1244*/ def var delyn like mfc_logical.
/*cy1020* end   added code */

/* EMT SPECIFIC VARIABLES */
define variable mc-error-number like msg_nbr no-undo.

/* EMT Shared workfiles and variables */
{us/so/sobtbvar.i}

define shared frame d.
define shared frame sotot.

{us/et/etdcrvar.i "new"}
{us/et/etsotrla.i}

/* CREDIT MANAGEMENT ROUTINE */
{us/mf/mfcredpl.i hCreditManagementLib}

run initialiseCreditManagementLibrary
   ( input  hCreditManagementLib,
     output hCreditManagementLib).

find so_mstr where recid(so_mstr) = so_recno.

for first cm_mstr where recid(cm_mstr) = cm_recno
no-lock: end.

for first soc_ctrl where soc_ctrl.soc_domain = global_domain
no-lock: end.

/* Define shared frame d */
{us/so/sosomt01.i}

maint = yes.

do transaction on error undo, retry:

   status input.

   /* INITIALIZE TRAILER VARIABLES */
   assign
      nontaxable_amt = 0
      taxable_amt    = 0
      line_total     = 0
      disc_amt       = 0
      tax_amt        = 0
      base_amt       = 0
      ord_amt        = 0
      user_desc      = ""
      tax_date       = ?
      container_charge_total = 0
      line_charge_total = 0.

   {us/so/sototdsp.i}

   so_prepaid:format = prepaid_fmt.

   print_ih = (substring(so_inv_mthd,1,1) = "b" or
               substring(so_inv_mthd,1,1) = "p" or
               substring(so_inv_mthd,1,1) = "").
   edi_ih   = (substring(so_inv_mthd,1,1) = "b" or
               substring(so_inv_mthd,1,1) = "e").
   edi_ack  = substring(so_inv_mthd,3,1) = "e".

   if new_order then
      so_print_pl = yes.

   display
      so_cr_init
      so_cr_card
      so_stat
      so_shipvia
      so_bol
      so_fob
      so_rev
      so_print_so
      so_print_pl
      so_partial
      so_prepaid
      print_ih
      edi_ih
      edi_ack
   with frame d.

   /* THE ROUTINE MFSOTRL.I TAKES SOD_QTY_ORD - SOD_QTY_CHG AND USES THAT
    * QUANTITY * THE PRICE TO GET THE ORDER TOTAL (THIS WAY YOU SEE THE
    * DOLLAR AMOUNT FOR THE QUANTITY OPEN ONLY.)  IF THAT CALCULATION IS
    * NEGATIVE, THEN THE VARIABLE invcrdt = "**C R E D I T**".  THE WORD
    * CREDIT CAN BE MISLEADING IN THE CASE WHERE A SALES ORDER WAS OVER
    * SHIPPED.  THIS CODE INSURES THAT THE WORD CREDIT WILL ONLY APEAR IF
    * THE SALES ORDER WAS ORIGINALLY A CREDIT.                    */
   if invcrdt = "**" + getTermLabel("C_R_E_D_I_T",11) + "**" then do:

      totalorder = 0.

      for each sod_det where sod_det.sod_domain = global_domain
         and sod_nbr = so_nbr
         and sod_compl_stat = ""
      no-lock:
         totalorder = totalorder + (sod_qty_ord * sod_price).
      end. /* for each sod_det */

      if totalorder >= 0 then assign
         invcrdt = "".

   end. /* invcrdt = "**C R E D I T**" */

   /*DISPLAY TRAILER*/
   {us/so/sototdsp.i}

   if {us/bbi/gpiswrap.i} then pause 0 before-hide.

   nqty = 0.
   for each sod_det where sod_det.sod_domain = global_domain
      and sod_nbr = so_nbr
      and sod_compl_stat = ""
   no-lock:
      find first cil_mstr where cil_mstr.cil_domain = global_domain
         and cil_cor_so_nbr = sod_nbr
      no-lock no-error.
      if available cil_mstr then
         find first cild_det where cild_det.cild_domain = global_domain
            and cild_cor_inv = cil_cor_inv
            and cild_cor_so_nbr = cil_cor_so_nbr
            and cild_prev_line  = sod_line
            and cild_line_type  = "R"
         no-lock no-error.
      if available cild_det then assign
         reveqty = yes
         newqty = (sod_qty_ord * sod_fr_wt)
         nqty   = nqty + newqty.
   end.

   /* DISPLAY FREIGHT WEIGHTS */
   if so_fr_list <> "" then do:
      if calc_fr then do:
         if not freight_ok then do:
            /* Freight error detected */
            {us/bbi/pxmsg.i &MSGNUM=669 &ERRORLEVEL=2}
            if not (batchrun or {us/bbi/gpiswrap.i}) then pause.
         end.
         if disp_fr then do:
            if reveqty = yes then
               /* Freight Weight = */
               {us/bbi/pxmsg.i &MSGNUM=698 &ERRORLEVEL=1
                  &MSGARG1=nqty
                  &MSGARG2=so_weight_um}
            else
               /* Freight Weight = */
               {us/bbi/pxmsg.i &MSGNUM=698 &ERRORLEVEL=1
                  &MSGARG1=so_weight
                  &MSGARG2=so_weight_um}
         end.
      end.
   end.

   /* BACK OUT TRAILER ITEMS FROM TAXABLE/NONTAXABLE VARIABLES */
   {us/bbi/gprun.i ""sotrltx2.p""}

   /* CHECK CREDIT LIMIT */
   /* IF THE BILL-TO CUSTOMER'S OUTSTANDING BALANCE IS ALREADY ABOVE   */
   /* HIS CREDIT LIMIT, THEN THE ORDER WILL HAVE BEEN PUT ON HOLD IN   */
   /* THE HEADER.  WE CHECK NOW BECAUSE THE SUBTOTAL OF THE ORDER MAY  */
   /* HAVE PUT THE CUSTOMER OVER HIS CREDIT LIMIT AND THE USER MIGHT   */
   /* F4 OUT OF THE TRAILER SCREEN, BYPASSING THE CHECK DONE AFTER     */
   /* THE TRAILER AMOUNTS HAVE BEEN ENTERED.  IT HARDLY SEEMS WORTH    */
   /* MENTIONING THAT THE CUSTOMER'S BALANCE PLUS THIS ORDER MIGHT BE  */
   /* ABOVE HIS CREDIT LIMIT NOW, BUT JUDICIOUS USE OF ORDER DISCOUNTS */
   /* AND NEGATIVE TRAILER AMOUNTS MIGHT BRING THE TOTAL BACK DOWN     */
   /* BELOW THE CREDIT LIMIT.  BETTER SAFE THAN SORRY.                 */
   /* NOTE THAT WE DON'T BOTHER CHECKING IF WE'RE NOT GOING TO PUT THE */
   /* ORDER ON HOLD, SINCE THIS COULD JUST PRODUCE A LOT OF MESSAGES   */
   /* THAT THE USER IS PROBABLY IGNORING ANYWAY.                       */
   if so_stat = "" and soc_cr_hold then do:

      base_amt = ord_amt.

      if so_curr <> base_curr then do:
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
            "(input so_curr,
              input base_curr,
              input so_ex_rate,
              input so_ex_rate2,
              input base_amt,
              input true,
              output base_amt,
              output mc-error-number)"}.
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.
      end.

   end.

end.

undo_mtc3 = true.
{us/bbi/gprun.i ""sosomtc3.p""}

if not undo_mtc3 then do:
   if undo_mainblk then leave.
   undo_mtc2 = true.
   {us/bbi/gprun.i ""sosomtc2.p""}
   if undo_mtc2 then undo, retry.
end.

/*cy1020*  start added code */
if not undo_mtc3
and not undo_mtc2
then do:
  {us/bbi/gprun.i ""xxstkavail.p"" "(so_nbr, output ok2ship)"}
  if ok2ship
  then do:
     {us/bbi/gprun.i ""xxcimsoi.p"" 
           "(so_nbr,
	     output vERRNbr,
	     output vERRMsg)"}
/*c1394* /*c1286*/ so_to_inv = yes.   */
/*c1394*/  {us/bbi/gprun.i ""xxtoinv.p"" "(recid(so_mstr))"}
     if vErrNbr > 0
     then do:
       do transaction:
       find first msg_mstr exclusive-lock
       where msg_lang = global_user_lang
       and   msg_nbr = 90000
       no-error.
       if not available msg_mstr then do:
          create msg_mstr.
          assign
          msg_lang = global_user_lang
          msg_nbr = 90000.
       end.
       msg_desc = vErrMsg + ". Continue yn".
       release msg_mstr.
       end.
       delyn = no.
       do while delyn = no:
       {us/bbi/pxmsg.i &MSGNUM=90000 &ERRORLEVEL=2 &CONFIRM=delyn}
       end.
       vMessage = vErrMsg.
       {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=2}
       pause.
     end.
  end.
end.  /* not undo mtc3 ... */
/*cy1020*  end   added code */

/* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
run updateOpenOrderTotal in hCreditManagementLib
   ( input  so_bill,
     input  getBeforeOrderTotal(input so_nbr),
     input  getOrderTotal      (input so_nbr),
     input  so_curr,
     output iReturnStatus).
/* CLEAR qad_wkfl AFTER UPDATE */
run clearSOTotals in hCreditManagementLib ( input  so_nbr).

/* HIDE THE TRAILER FRAMES ONLY FOR ORDERS OF TYPE "SSM" */
if this-is-ssm then do:
   hide frame sotot   no-pause.
   hide frame d       no-pause.
end.
