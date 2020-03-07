/* xxpiwiiq.p - Price List "What-If" Inquiry                                 */
/* sopiwiiq.p - Price List "What-If" Inquiry                                 */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxpiwiiq.p,v 1.3 2018/09/11 20:30:48 gbg Exp $: */
/*                                                                           */
/* Price List "What-If" Inquiry - gives pricing information for given        */
/*    item, customer, site, effective date, quantity, etc.; can show all     */
/*    price lists considered.                                                */
/*                                                                           */
/* This program has the following limitations:                               */
/*    Terms interest calculations are ignored;                               */
/*    Terms and Freight discounts are simply reported;                       */
/*    Configurations are not considered (Configured items are priced as      */
/*       the parent item only);                                              */
/*    Ordering site (assumes pt_site for costs; this is mainly important     */
/*       for mark-up price lists);                                           */
/*                                                                           */
/* REVISION: 8.5      LAST MODIFIED: 01/16/94   BY: jlf *J042*               */
/* REVISION: 8.5      LAST MODIFIED: 04/02/96   BY: jpm *J0GX*               */
/* REVISION: 8.5      LAST MODIFIED: 04/13/96   BY: DAH *J0HR*               */
/* REVISION: 8.5      LAST MODIFIED: 05/23/96   BY: ajw *J0NT*               */
/* REVISION: 8.5      LAST MODIFIED: 06/04/96   BY: ajw *J0QT*               */
/* REVISION: 8.5      LAST MODIFIED: 06/07/96   BY: DAH *J0N2*               */
/* REVISION: 8.5      LAST MODIFIED: 06/24/96   BY: ajw *J0SZ*               */
/* REVISION: 8.5      LAST MODIFIED: 07/05/96   BY: DAH *J0XR*               */
/* REVISION: 8.5      LAST MODIFIED: 07/12/96   BY: ajw *J0Y5*               */
/* REVISION: 8.5      LAST MODIFIED: 07/16/96   BY: ajw *J0Z6*               */
/* REVISION: 8.5      LAST MODIFIED: 07/19/96   BY: *J0ZW* Dennis Henson     */
/* REVISION: 8.5      LAST MODIFIED: 07/31/96   BY: *J12Q* Andy Wasilczuk    */
/* REVISION: 8.5      LAST MODIFIED: 04/08/97   BY: *J1N4* Aruna Patil       */
/* REVISION: 8.5      LAST MODIFIED: 09/19/97   BY: *J20X* Ajit Deodhar      */
/* REVISION: 8.6      LAST MODIFIED: 10/27/97   BY: *K166* Ashok Swaminathan */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane         */
/* REVISION: 8.6E     LAST MODIFIED: 04/02/98   BY: *J2HQ* Niranjan R.       */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton      */
/* REVISION: 8.6E     LAST MODIFIED: 06/01/98   BY: *J2JJ* Niranjan R.       */
/* REVISION: 8.6E     LAST MODIFIED: 07/21/98   BY: *J2SB* Dana Tunstall     */
/* REVISION: 8.6E     LAST MODIFIED: 08/04/98   BY: *L028* Steve Goeke       */
/* REVISION: 9.0      LAST MODIFIED: 11/24/98   BY: *M017* Luke Pokic        */
/* REVISION: 9.0      LAST MODIFIED: 12/08/98   BY: *M029* Luke Pokic        */
/* REVISION: 9.0      LAST MODIFIED: 12/15/98   BY: *M02W* Luke Pokic        */
/* REVISION: 9.0      LAST MODIFIED: 01/27/99   BY: *M06L* Luke Pokic        */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan        */
/* REVISION: 9.0      LAST MODIFIED: 02/12/99   BY: *M0HT* Paul Coote        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 02/10/00   BY: *N06R* Steve Goeke       */
/* REVISION: 9.1      LAST MODIFIED: 06/07/00   BY: *M0N8* Abhijeet Thakur   */
/* REVISION: 9.1      LAST MODIFIED: 08/23/00   BY: *N0ND* Mark Brown        */
/* Revision: 1.36     BY: John Pison            DATE: 02/13/02  ECO: *N18T* */
/* Revision: 1.38     BY: Paul Donnelly (SB)    DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.39     BY: Jyoti Thatte          DATE: 09/15/03  ECO: *P106*  */
/* Revision: 1.40     BY: Paul Green            DATE: 11/21/03  ECO: *P1B1* */
/* Revision: 1.41     BY: Kunal Pandya          DATE: 12/01/08  ECO: *Q1TY* */
/* Revision: 1.42     BY: Rinku Keswani         DATE: 03/29/10  ECO: *Q3XY*/
/* CYB    LAST MODIFIED: 12-AUG-2010    BY:  gbg *cy1026*                    */
/* CYB    LAST MODIFIED: 30-JUN-2011    BY:  gbg *cy1026a*                   */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/* CYB        LAST MODIFIED: 11-Sep-2018  BY: gbg *k10017* T1117*        */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* Display title */
{us/mf/mfdtitle.i}

define new shared variable err_stat      as integer.
define new shared variable new_site      like pt_site.
define new shared variable so_db         like dc_name.

define            variable amt_type      like pi_amt_type
                                         format "x(12)"
                                         column-label "Amt!Type".
define            variable comb_type     like pi_comb_type
                                         format "x(4)"
                                         column-label "Comb!Type".
define            variable cum_qty       as decimal
                                         format "->>>>>>,>>9.99<<<"
                                         label "Accum Qty".
define            variable curr_input    like pi_curr.
define            variable cust          like cm_addr.
define            variable ord_qty       as decimal
                                         format "->>>>>>,>>9.99<<<"
                                         label "Ord Qty".
define            variable price_date    like pi_mod_date
                                         label "Effective".
define            variable part          like pt_part.
define            variable um_input      like pi_um.
define            variable discount      as decimal label "Discount"
                                         format "->>>9.9<<<".
define            variable ext_list      like sod_list_pr
/*cy1026*/                               label "Accum Amt".
define            variable ext_price     like pih_amt
                                         label "Ext Amount".
define            variable qty_type      like pih_qty_type
                                         format "x(3)".
define            variable mc-error-number like msg_nbr       no-undo.
define            variable v_success       like mfc_logical   no-undo.
define            variable best_list_price like sod_list_pr   no-undo.
define            variable manual_list     like so_pr_list    no-undo.
define            variable best_net_price  like sod_price     no-undo
                                           label "Net Price".
define            variable only_selected   like mfc_logical   no-undo
                                           initial yes.
define            variable rndmthd         like rnd_rnd_mthd  no-undo.
define            variable l-amt-fmt       as character       no-undo.
define            variable l-amt-fmt-old   as character       no-undo.

{us/so/sopiwiq1.i new }  /* Shared workfile for price list retrieval */

/*c1603* start deleted code >>>>>>>>
form
   cust           colon 15
   price_date     colon 50
   new_site       colon 15
   curr_input     colon 50
   part           colon 15
   cum_qty        colon 50
   ord_qty        colon 15 um_input  /* No-label */
   ext_list       colon 50 label "Accum Amt"
   manual_list    colon 15 label "Manual"
   only_selected  colon 50 label "Show Only Selected"
with frame a side-labels width 80.
**c1603* end   deleted code <<<<<<< */

/*CY1026>>*/
form
   cust           colon 15
   cm_sort        colon 30 no-label
   new_site       colon 15
   part           colon 15
   pt_desc1       colon 30 no-label
   ord_qty        colon 15 
   pt_desc2       colon 30 no-label
   manual_list    colon 15 label "Manual"
   price_date     colon 50
   curr_input     colon 50
   cum_qty        colon 50
/*cy1026a*/   um_input       colon 24
   only_selected  colon 50 label "Show Only Selected"
with frame a side-labels width 80.
/*CY1026<<*/

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
/*c1603* start deleted code >>>>>>>>
   best_list_price colon 15
   discount        colon 50
**c1603* end   deleted code <<<<<<< */
   best_net_price  colon 15
   ext_price       colon 50
with frame b width 80 side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).


/*k10017* start added code */
def var dmessage as char format "x(40)".
form
   skip(2)
   dmessage        colon 15 no-label
with frame d width 80 no-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).
/*k10017* end added code */

assign
   price_date = today
   curr_input = base_curr
   l-amt-fmt-old = ext_price:format in frame b.

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.

mainloop:
repeat:

/*d2101* start added code >>>>   */
   update
      cust new_site part ord_qty 
      manual_list price_date curr_input cum_qty 
      um_input
      only_selected
   with frame a.
/*d2101* end   added code <<<<<  */


/*c1603* start deleted code >>>>>>>>
   update
      cust new_site part ord_qty um_input
      manual_list price_date curr_input cum_qty ext_list
      only_selected
   with frame a.
**c1603* end   deleted code <<<<<<< */

   /* Display warning if customer is not found */
   find cm_mstr  where cm_mstr.cm_domain = global_domain and  cm_addr = cust
   no-lock no-error.
   if not available cm_mstr then do:
      {us/bbi/pxmsg.i &MSGNUM=7220 &ERRORLEVEL=2}
      do on endkey undo, leave:
         pause.
      end.
   end.  /* If not available cm_mstr then do: */
   else if new_site = "" then do:
      new_site = cm_site.
      display new_site with frame a.
   end.  /* Else if new_site = "" then do: */



/*CY1026>>*/
      if available cm_mstr then 
         display cm_sort with frame a.
/*CY1026<<*/

   /* Set defaults for fields that were not entered */

   /* UM, site defaults */

   find pt_mstr  where pt_mstr.pt_domain = global_domain and  pt_part = part
   no-lock no-error.
   if available pt_mstr then do:

      /* UM defaults to pt_um */
      if um_input = "" then do:
         um_input = pt_um.
         display um_input with frame a.
      end.  /* If um_input = "" then do: */

      if new_site = "" then do:
         new_site = pt_site.
         display new_site with frame a.
      end.  /* If new_site = "" then do: */

      /* Warn users that we aren't considering configured options */
      if pt_pm_code = "C" then do:
         /* Pricing info does not include options */
         {us/bbi/pxmsg.i &MSGNUM=6919 &ERRORLEVEL=2}
      end.  /* If pt_pm_code = "C" then do: */

/*CY1026>>*/
         display pt_desc1 pt_desc2 with frame a.
/*CY1026<<*/



   end.  /* If available pt_mstr then do: */
   else do:
      /* Display warning if item not found */
      {us/bbi/pxmsg.i &MSGNUM=16 &ERRORLEVEL=2}
      do on endkey undo, leave:
         pause.
      end.
   end.  /* Else do: */

   if new_site <> "" then do:

      /* Validate site */
      if not can-find(si_mstr  where si_mstr.si_domain = global_domain and
      si_site = new_site) then do:
         {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=2}  /* Site does not exist */
         do on endkey undo, leave:
            pause.
         end.
      end.  /* If not can-find(si_mstr where si_site = new_site) then do: */

   end.  /* If new_site <> "" then do: */

   /* Currency defaults to base */
   if curr_input = "" then do:
      curr_input = base_curr.
      display curr_input with frame a.
   end.  /* If curr_input = "" then do: */

   /* Check whether currency is valid */
   {us/gp/gprunp.i "mcpl" "p" "mc-chk-valid-curr"
      "(input  curr_input,
        output mc-error-number)" }

   /* Display warning if currency is invalid */
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      do on endkey undo, leave:
         pause.
      end.
   end.  /* If mc-error-number <> 0 then do: */

   if curr_input = gl_base_curr then
      rndmthd = gl_rnd_mthd.
   else do:
      /* GET ROUNDING METHOD FROM CURRENCY MASTER */
      {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
                "(input curr_input,
                  output rndmthd,
                  output mc-error-number)"}

      if mc-error-number <> 0 then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=4}
         pause.
         next.
      end.
   end.

   find rnd_mstr where rnd_rnd_mthd = rndmthd no-lock no-error.
   if not available rnd_mstr then do:
      /* ROUND METHOD RECORD NOT FOUND */
      {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=4}
      pause.
      next.
   end.

   l-amt-fmt = l-amt-fmt-old.
   {us/bbi/gprun.i ""gpcurfmt.p""
      "(input-output l-amt-fmt,
        input rndmthd)"}
   ext_price:format in frame b = l-amt-fmt.

   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "terminal"
               &printWidth = 80
               &pagedFlag = " "
               &stream = " "
               &appendToFile = " "
               &streamedOutputToTerminal = " "
               &withBatchOption = "no"
               &displayStatementType = 1
               &withCancelMessage = "yes"
               &pageBottomMargin = 6
               &withEmail = "yes"
               &withWinprint = "yes"
               &defineVariables = "yes"}


/*k10017* start added code ***/
pause 0 before-hide.
hide frame d.
if can-find(first debtor
            where debtorcode = cust
	    and   debtor.customcombo6 = "unpriced")
then do:
     display
     "Contact Head Office for Pricing" @ dmessage
     with frame d.
end.
else do:
/*k10017* end added code   ***/


   /* Cumulative qty defaults to ordered qty */
   if not cum_qty entered then do:
      cum_qty = ord_qty.
      display cum_qty with frame a.
   end.  /* If not cum_qty entered then do: */

/*c1603* start deleted code >>>>>>>>
   {us/bbi/gprun.i ""sopiwiq1.p""
      "(input  cust,
        input  price_date,
        input  new_site,
        input  curr_input,
        input  part,
        input  ord_qty,
        input  cum_qty,
        input  um_input,
        input  manual_list,
        input  if ext_list:modified
               then
                  ext_list
               else
                  0,
        input  only_selected,
        output best_list_price,
        output discount,
        output best_net_price,
        output ext_price,
        output v_success)" }
**c1603* end   deleted code <<<<<<< */
/*c1603* start added code >>>>>> */
   {us/bbi/gprun.i ""sopiwiq1.p""
      "(input  cust,
        input  price_date,
        input  new_site,
        input  curr_input,
        input  part,
        input  ord_qty,
        input  cum_qty,
        input  um_input,
        input  manual_list,
        input  ext_list,
        input  only_selected,
        output best_list_price,
        output discount,
        output best_net_price,
        output ext_price,
        output v_success)" }
/*c1603* end   added code <<<<<< */

/*c1603* start deleted code >>>>>>>>
   if not ext_list entered
   then
**c1603* end   deleted code <<<<<<< */
      ext_list = ord_qty * best_list_price.

/*c1603* start deleted code >>>>>>>>
   display
      ext_list
   with frame a.
**c1603* end   deleted code <<<<<<< */

   display
/*c1603* start deleted code >>>>>>>>
      best_list_price
      discount
**c1603* end   deleted code <<<<<<< */
      best_net_price
      ext_price
   with frame b.

   hide frame c.
/*c1603* start deleted code >>>>>>>>
   for each wkpi2_wkfl
      by wkpi2_amt_type
      by wkpi2_comb_type
      by wkpi2_comb_type
   with frame c width 80:

      /* SET EXTERNAL LABELS */
      setFrameLabels(frame c:handle).

      find first lngd_det
         where   lngd_dataset = "pi_mstr"
         and     lngd_field   = "pi_amt_type"
         and     lngd_lang    = global_user_lang
         and     lngd_key1    = wkpi2_amt_type
      no-lock.
      if lngd_mnemonic <> ""
      then
         amt_type = lngd_mnemonic.
      else
         amt_type = lngd_translation.
      find first lngd_det
         where   lngd_dataset = "pi_mstr"
         and     lngd_field   = "pi_comb_type"
         and     lngd_lang    = global_user_lang
         and     lngd_key1    = wkpi2_comb_type
      no-lock.
      if lngd_mnemonic <> ""
      then
         comb_type = lngd_mnemonic.
      else
         comb_type = lngd_translation.

      find first lngd_det
         where lngd_dataset = "pi_mstr"
         and   lngd_field   = "pi_qty_type"
         and   lngd_lang    = global_user_lang
         and   lngd_key1    = wkpi2_qty_type
      no-lock.
      if lngd_mnemonic <> ""
      then
         qty_type = lngd_mnemonic.
      else
         qty_type = lngd_translation.

      if lookup(wkpi2_amt_type,"1,2,3,4,8,9") <> 0
      then
         display
            wkpi2_selected column-label "Sel"
            wkpi2_list
            amt_type
            comb_type
            wkpi2_break_cat format "x(12)"
            wkpi2_pid_qty column-label "Break!Qty/Amt"
            qty_type no-labels
            wkpi2_amt
            .
      else
      display
         wkpi2_selected @ wkpi2_selected
         wkpi2_list @ wkpi2_list
         amt_type @ amt_type
         comb_type @ comb_type
         wkpi2_break_cat @ wkpi2_break_cat
         wkpi2_pid_qty @ wkpi2_pid_qty
         qty_type @ qty_type
         wkpi2_promo @ wkpi2_amt
         .
   end.  /* For each wkpi2_wkfl by wkpi2_amt_type by wkpi2_comb_type */
**c1603* end   deleted code <<<<<<< */



/*k10017* start added code */
end.   /* not can-find(first debtor) */
/*k10017* end added code   ***/


   {us/bbi/mfreset.i}
   {us/bbi/pxmsg.i &MSGNUM=8 &ERRORLEVEL=1}

end.  /* Repeat: */
