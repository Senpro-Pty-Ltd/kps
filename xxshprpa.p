/* xxshprpa.p - SHIPMENT PERFORMANCE REPORT BY SITE, CUST, SHIPTO, ITEM */
/* soshprpa.p - SHIPMENT PERFORMANCE REPORT BY SITE, CUST, SHIPTO, ITEM */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxshprpa.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* $Revision: 1.2 $         */
/*                                                                      */
/* Subprogram to the Shipment Performance Report. This subprogram       */
/* displays shipment performance data by site, customer, ship-to and    */
/* item.                                                                */
/*                                                                      */
/* Revision: 1.18      BY: Steve Nugent         DATE: 10/15/01  ECO: *P003* */
/* Revision: 1.20      BY: Paul Donnelly (SB)   DATE: 06/28/03  ECO: *Q00L* */
/* $Revision: 1.2 $   BY: Jean Miller          DATE: 05/04/07  ECO: *R0C6* */
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
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}

define input parameter cust_source like shp_customer_source no-undo.
define input parameter cust like shp_cust no-undo.
define input parameter cust1 like shp_cust no-undo.
define input parameter shipto like shp_shipto no-undo.
define input parameter shipto1 like shp_shipto no-undo.
define input parameter site like shp_shipfrom no-undo.
define input parameter site1 like shp_shipfrom no-undo.
define input parameter order like shp_nbr no-undo.
define input parameter order1 like shp_nbr no-undo.
define input parameter part like shp_part no-undo.
define input parameter part1 like shp_part no-undo.
define input parameter cpart like shp_cust_part no-undo.
define input parameter cpart1 like shp_cust_part no-undo.
define input parameter shipdate like shp_ship_date no-undo.
define input parameter shipdate1 like shp_ship_date no-undo.
define input parameter ordclass like shp_order_category no-undo.
define input parameter ordclass1 like shp_order_category no-undo.
define input parameter perf_date as character no-undo.
define input parameter exceptions_only like mfc_logical no-undo.
define input parameter include_amt like mfc_logical no-undo.
define input parameter include_cmmt like mfc_logical no-undo.
define input parameter report_detail like mfc_logical no-undo.
define input parameter report_um like um_um no-undo.

/* COMMON SHIPMENT PERFORMANCE REPORT VARIABLES */
{us/so/soshpvar.i}

/*cy1044* start added code */
def var vShp_open_qty  like shp_open_qty.
def var vShp_ext_price  like shp_ext_price.
/*cy1044* end   added code */

/* COMMON SHIPMENT PERFORMANCE REPORT TEMP-TABLES */
{us/so/soshptt.i}

/* COMMON SHIPMENT PERFORMANCE REPORT FORMS */
{us/so/soshpfrm.i}


/* FORM SITE */
form
   space(1)
   shp_shipfrom         colon 17
   site_desc            colon 39 no-label skip
   space(1)
   shp_cust             colon 17
   cust_name            colon 39 no-label
   cust_type            colon 81
   cust_class           colon 95
   shp_order_category   colon 115 skip
   space(1)
   shp_shipto           colon 17 skip
   space(1)
   shp_part             colon 17
   item_desc            at 39 no-label
   shp_cust_part        colon 81
   skip(1)
with frame ship_header side-labels width 132 attr-space.

/* SET EXTERNAL LABELS */
setFrameLabels(frame ship_header:handle).

/* GET GL CONTROL FILE FOR CURRENCY CALCULATIONS */
for first gl_ctrl  where gl_ctrl.gl_domain = global_domain no-lock:
end.

for each shp_hist no-lock
   where shp_domain = global_domain and
       ((shp_customer_source = cust_source_code  or
    cust_source_code = "")                        and
   shp_cust >= cust and shp_cust <= cust1             and
   shp_shipto >= shipto and shp_shipto <= shipto1     and
   shp_shipfrom >= site and shp_shipfrom <= site1             and
   shp_nbr >= order and shp_nbr <= order1             and
   shp_part >= part and shp_part <= part1             and
   shp_cust_part >= cpart and shp_cust_part <= cpart1 and
   shp_ship_date >= shipdate and shp_ship_date <= shipdate1
   and shp_order_category >= ordclass
   and shp_order_category <= ordclass1                     and
   shp_cust_part >= cpart and shp_cust_part <= cpart1 and
   shp_include ) :

   {us/bbi/gprun.i ""soshprpd.p""
            "(input recid(shp_hist),
              output exception_yn,
              output date_status_code,
              output time_status,
              output qty_status,
               output performance_date)"}

   if exceptions_only and exception_yn = no then next.

   create tt_ship_info.

   assign
      tt_ship_site = shp_shipfrom
      tt_ship_cust = shp_cust
      tt_ship_shipto = shp_shipto
      tt_ship_item = shp_part
      tt_ship_um = shp_ship_um
      tt_ship_tran_id = shp_tran_id
      tt_ship_time_code = date_status_code
      tt_ship_time_desc = time_status
      tt_ship_qty_desc = qty_status
      tt_ship_currency = shp_currency
      tt_ship_date = shp_ship_date
      tt_ship_perf_date = performance_date
      tt_ship_amt = shp_ship_price.

end. /* FOR EACH shp_hist */

for each tt_ship_info
   break by tt_ship_site
         by tt_ship_cust
         by tt_ship_shipto
         by tt_ship_item
         by tt_ship_um
         by tt_ship_currency:

   assign
      conv_qty_shipped = 0
      conv_factor = 1
      conv_ship_amt = 0
      error1 = ""
      error2 = ""
      error3 = ""
      error4 = "".

   for first shp_hist where shp_domain = global_domain and
      shp_tran_id = tt_ship_tran_id
   no-lock: end.

   /* GET UM CONVERSION FOR ITEM TOTALS BASED ON    */
   /* THE UM OF THE ITEM IN THE ITEM MASTER RECORD. */
   for first pt_mstr where pt_domain = global_domain and
      pt_part = shp_part
   no-lock: end.

   if available pt_mstr and
      pt_um <> shp_ship_um then do:

      {us/bbi/gprun.i ""gpumcnv.p""
            "(input tt_ship_um,
              input pt_um,
              input pt_part,
              output conv_factor)"}

      if conv_factor = ? then do:
         run message_display
            (input 33,
             input 3,
             input pt_um,
             input tt_ship_um,
             output error1).
         message_ct = message_ct + 1.
      end.
      else
         conv_qty_shipped = shp_ship_qty * conv_factor.
   end. /* IF AVAILABLE pt_mstr */
   else
      assign
         conv_qty_shipped = shp_ship_qty
         conv_factor = shp_ship_um_conv.

   /* GET UM CONVERSION FOR SITE AND CUSTOMER TOTALS */
   /* BASED ON THE REPORT UM OF MEASURE.             */
   if report_um <> "" then do:
      if tt_ship_um <> report_um then do:

         {us/bbi/gprun.i ""gpumcnv.p""
              "(input tt_ship_um,
                input report_um,
                input tt_ship_item,
                output conv_factor)"}

         if conv_factor = ? then do:
            run message_display
               (input 33,
                input 3,
                input report_um,
                input tt_ship_um,
                output error2).
            message_ct = message_ct + 1.
         end.
         else
            report_qty_shipped = shp_ship_qty * conv_factor.
      end. /* IF tt_ship_um <> report_um */
      else
         report_qty_shipped = shp_ship_qty.
   end. /* IF report_um <> "" */
   else
      assign
         report_qty_shipped = conv_qty_shipped
         report_um = if available pt_mstr then pt_um
                      else shp_ship_um.

   /* GET EXCHANGE RATES FOR CURRENCY CONVERSIONS */
   if tt_ship_currency <> gl_base_curr then do:

      {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
            "(input tt_ship_currency,
              input gl_base_curr,
              input """",
              input tt_ship_date,
              output ex_rate1,
              output ex_rate2,
              output mc-error-number)"}.

      if mc-error-number <> 0 then do:
         run message_display
            (input mc-error-number,
             input 2,
             input "",
             input "",
             output error3).
         message_ct = message_ct + 1.
      end.

      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
            "(input tt_ship_currency,
              input gl_base_curr,
              input ex_rate1,
              input ex_rate2,
              input tt_ship_amt ,
              input false,
              output conv_ship_amt,
              output mc-error-number)"}.

      if mc-error-number <> 0 then do:
         run message_display
            (input mc-error-number,
             input 2,
             input "",
             input "",
             output error4).
         message_ct = message_ct + 1.
      end.
   end. /* IF tt_ship_currency <> gl_base_curr */
   else
      conv_ship_amt = tt_ship_amt.

   /* GET SITE DESCRIPTION */
   for first si_mstr where si_domain = global_domain and
      si_site = shp_shipfrom
   no-lock: end.

   if available si_mstr then
      site_desc = si_desc.
   else
      site_desc = "".

   /* GET CUSTOMER NAME */
   for first ad_mstr where ad_domain = global_domain and
      ad_addr = shp_cust
   no-lock: end.

   if available ad_mstr then
      cust_name = ad_sort.
   else
      cust_name = "".

   for first cm_mstr where cm_domain = global_domain and
      cm_addr = shp_cust
   no-lock: end.

   if available cm_mstr then
      assign
         cust_class = cm_class
         cust_type = cm_type.
   else
      assign
         cust_class = ""
         cust_type = "".

   /* GET ITEM DESCIRPTION */
   for first pt_mstr where pt_domain = global_domain and
      pt_part = shp_part
   no-lock: end.

   if available pt_mstr then
      item_desc = pt_desc1.
   else
      item_desc = "".


   /* DISPLAY DETAIL */
   if first-of(tt_ship_site) then do:

      page.

      display
         shp_shipfrom
         site_desc
         shp_cust
         cust_name
         cust_type
         cust_class
         shp_order_category
         shp_shipto
         shp_part
         item_desc
         shp_cust_part
      with frame ship_header.

      empty temp-table tt_site_totals.

   end.

   for first tt_site_totals where
      tt_site_status = tt_ship_time_desc no-lock:
   end.

   if available tt_site_totals then do:
      assign
         tt_site_curr_totals = tt_site_curr_totals +
                                  conv_ship_amt
         tt_site_item_totals = tt_site_item_totals +
                                  report_qty_shipped
         tt_site_ship_totals = tt_site_ship_totals + 1.
   end.

   else do:
      create tt_site_totals.
      assign
         tt_site_status = tt_ship_time_desc
         tt_site_curr_totals = conv_ship_amt
         tt_site_item_totals = report_qty_shipped
         tt_site_ship_totals = 1
         tt_site_shipto = shp_shipto
         tt_site_site = shp_shipfrom.
   end.

   if first-of(tt_ship_cust) then do:
      display
         shp_shipfrom
         site_desc
         shp_cust
         cust_name
         cust_type
         cust_class
         shp_shipto
         shp_part
         item_desc
         shp_cust_part
      with frame ship_header.

      empty temp-table tt_cust_totals.

   end.

   for first tt_cust_totals where
      tt_cust_status = tt_ship_time_desc no-lock:
   end.

   if available tt_cust_totals then do:
      assign
         tt_cust_curr_totals = tt_cust_curr_totals +
                                  conv_ship_amt
         tt_cust_item_totals = tt_cust_item_totals +
                                  report_qty_shipped
         tt_cust_ship_totals = tt_cust_ship_totals + 1.
   end.

   else do:
      create tt_cust_totals.
      assign
         tt_cust_status = tt_ship_time_desc
         tt_cust_curr_totals = conv_ship_amt
         tt_cust_item_totals = report_qty_shipped
         tt_cust_ship_totals = 1
         tt_cust_shipto = shp_shipto
         tt_cust_cust = shp_cust.
   end.

   if first-of(tt_ship_shipto) then
      display
         shp_shipfrom
         site_desc
         shp_cust
         cust_name
         cust_type
         cust_class
         shp_shipto
         shp_part
         item_desc
         shp_cust_part
      with frame ship_header.

   if first-of(tt_ship_item) then do:
      display
         shp_shipfrom
         site_desc
         shp_cust
         cust_name
         cust_type
         cust_class
         shp_shipto
         shp_part
         item_desc
         shp_cust_part
      with frame ship_header.

      empty temp-table tt_item_totals.

   end.

   /* DISPLAY UM HEADER */
   if first-of(tt_ship_um) then do:
      if report_detail then
         display
            tt_ship_um
         with frame um.
   end. /* IF FIRST-OF(tt_ship_um) */

   /* DISPLAY UNIT OF MEASURE ERRORS IF ANY */
   if error1 <> "" then display error1 with frame errors.
   if error2 <> "" then display error2 with frame errors.

   /* COLLECT ITEM TOTALS */
   for first tt_item_totals where
      tt_item_status = tt_ship_time_desc
   no-lock: end.

   if available tt_item_totals then do:
      assign
         tt_item_curr_amts   = tt_item_curr_amts +
                                  conv_ship_amt
         tt_item_count       = tt_item_count +
                                  conv_qty_shipped
         tt_item_ship_count  = tt_item_ship_count + 1.
   end.

   else do:
      create tt_item_totals.
      assign
         tt_item_status = tt_ship_time_desc
         tt_item_count = conv_qty_shipped
         tt_item_curr_amts = conv_ship_amt
         tt_item_ship_count = 1
         tt_item_shipto = shp_shipto
         tt_item_item = shp_part.
   end.

   /* COLLECT CURRENCY/UM TOTALS */
   if first-of(tt_ship_currency)
   then do:
      empty temp-table tt_um_curr_totals.
   end.

   for first tt_um_curr_totals no-lock where
      tt_shipping_um   = shp_ship_um    and
      tt_shipping_curr = shp_currency:
   end.

   if available tt_um_curr_totals then do:
      assign
         tt_ship_curr_amt = tt_ship_curr_amt + shp_ship_price
         tt_base_curr_amt = tt_base_curr_amt + conv_ship_amt
         tt_shipping_qty = tt_shipping_qty + shp_ship_qty
         tt_inventory_qty = tt_inventory_qty + conv_qty_shipped.
   end. /* IF AVAILABLE tt_um_curr_totals */

   else do:
      create tt_um_curr_totals.
      assign
         tt_shipping_um = shp_ship_um
         tt_shipping_curr = shp_currency
         tt_base_curr = gl_base_curr
         tt_ship_curr_amt = shp_ship_price
         tt_base_curr_amt = conv_ship_amt
         tt_shipping_qty = shp_ship_qty
         tt_inventory_qty = conv_qty_shipped.

      /* FIND INVENTORY UM */
      for first pt_mstr where pt_domain = global_domain and
         pt_part = shp_part
      no-lock: end.

      if available pt_mstr then
         tt_inventory_um = pt_um.
      else
         tt_inventory_um = shp_ship_um.

   end. /* ELSE DO */

   if report_detail then do:

      for first shpd_hist where shpd_domain = global_domain and
         shpd_tran_id = shp_tran_id and
         shpd_measurement_type = 1
      no-lock: end.

      if available shpd_hist then
         time_reason_code = shpd_rsn_code.
      else
         time_reason_code = "".

      for first shpd_hist where shpd_domain = global_domain and
         shpd_tran_id = shp_tran_id and
         shpd_measurement_type = 2
      no-lock: end.

      if available shpd_hist then
         assign
            qty_reason_code = shpd_rsn_code
            qty_pct = shp_qty_pct.

      else
         assign
            qty_reason_code = ""
            qty_pct = 0.

/*cy1044* start added code */
      vShp_open_qty = if cust_source = "SO"  then
                         shp_open_qty /*debug* + shp_ship_qty */
                      else shp_open_qty.
      vShp_ext_price = if cust_source = "SO" then
                         /*debug shp_ship_price + */ shp_ext_price
                      else shp_ext_price.

      if available shpd_hist then
         assign
            qty_reason_code = shpd_rsn_code.
      else
         assign
            qty_reason_code = "".
      qty_pct = if cust_source = "SO" then
                      /*debug* ((shp_ship_qty / (shp_ship_qty + shp_open_qty)) * 100)  
		            - 100 */ shp_qty_pct
		else shp_qty_pct.

/*cy1044*  end added code  */

      display
         shp_tran_id
         shp_nbr
         shp_rel_id
         tt_ship_perf_date
         shp_open_qty
/*cy1044*/ vshp_open_qty @ shp_open_qty
         (if include_amt then shp_ext_price else 0) @ shp_ext_price
/*cy1044*/ (if include_amt then vshp_ext_price else 0) @ shp_ext_price
         tt_ship_time_desc
         time_reason_code
         qty_pct
      with frame detail.

      down 1 with frame detail.

      display
         (if shp_customer_source = "1"
              then string(shp_line)
              else shp_do_req) @ shp_nbr
         shp_abs_id @ shp_rel_id
         shp_ship_qty @ shp_open_qty
         (if include_amt then shp_ship_price else 0) @ shp_ext_price
         shp_ship_date @ tt_ship_perf_date
         tt_ship_qty_desc @ tt_ship_time_desc
         qty_reason_code @ time_reason_code
      with frame detail.
      down 2 with frame detail.

      /* PRINT COMMENTS IF USER SPECIFIES */
      if shp_cmtindx <> 0 and include_cmmt then do:
         {us/gp/gpcmtprt.i &type=RP
                     &id=shp_cmtindx
                     &pos=12
                     &command="down 1."}
         down 1 with frame detail.
      end. /* IF shp_cmtindx <> 0 ... */

   end. /* IF report_detail */

   /* DISPLAY TOTALS BY UM AND CURRENCY */
   if last-of(tt_ship_currency)
   then do:

      /* INITIALIZE VARIABLES */
      assign
         total_ship_curr_amt = 0
         total_base_curr_amt = 0.

      for first tt_um_curr_totals no-lock:
      end.

      if available tt_um_curr_totals then do:
         um_curr_totals_label = (getTermLabel("UOM",10)) + ": "
                                + tt_shipping_um + "  " +
                                (getTermlabel("CURRENCY",15)) + ": "
                                + tt_shipping_curr.

         display
            um_curr_totals_label
         with frame um_curr_frame.
      end. /* IF AVAILABLE tt_um_curr_totals */

      for each tt_um_curr_totals no-lock
      break by tt_shipping_um
            by tt_shipping_curr:

         assign
            total_ship_curr_amt = total_ship_curr_amt + tt_ship_curr_amt
            total_base_curr_amt = total_base_curr_amt + tt_base_curr_amt.

         display
            tt_shipping_um
            tt_shipping_qty
            total_ship_curr_amt
            tt_shipping_curr
            tt_inventory_um
            tt_inventory_qty
            total_base_curr_amt
            tt_base_curr
         with frame um_curr_totals.

         /* DISPLAY CURRENCY CONVERSION ERRORS IF ANY */
         if error3 <> "" then display error3 with frame errors.
         if error4 <> "" then display error4 with frame errors.

      end. /* FOR EACH tt_um_curr_totals */

   end. /* IF LAST-OF ship_um, ship_currency */

   /* DISPLAY TOTALS BY ITEM */
   if last-of(tt_ship_item) then do:

      /* INITIALIZE VARIABLES */
      assign
         total_item_count = 0
         total_curr_amts = 0
         total_ship_count = 0.

      for first pt_mstr where pt_domain = global_domain and
         pt_part = tt_ship_item
      no-lock: end.

      if available pt_mstr then
         status_item_um = pt_um.
      else
         status_item_um = shp_ship_um.

      for first tt_item_totals no-lock:
      end.

      if available tt_item_totals then do:
         totals_label1 = (getTermLabel("ITEM_TOTALS",35)) + ": "
                         + tt_item_item.

         display
            totals_label1
         with frame totals1.
      end.

      for each tt_item_totals no-lock:
         total_item_count  = total_item_count + tt_item_count.
         total_curr_amts   = total_curr_amts + tt_item_curr_amts.
         total_ship_count = total_ship_count + tt_item_ship_count.
      end. /* FOR EACH tt_item_totals */

      for each tt_item_totals no-lock
      break by tt_item_status:

         assign
            status_curr_pct  = if tt_item_curr_amts > 0 then
                                    (tt_item_curr_amts /
                                     total_curr_amts) * 100
                                  else 0
            status_item_pct  = if tt_item_count > 0 then
                                     (tt_item_count /
                                      total_item_count) * 100
                                  else 0
            status_ship_pct = if tt_item_ship_count > 0 then
                                    (tt_item_ship_count /
                                     total_ship_count) * 100
                                  else 0.

         display
            tt_item_status
            (if include_amt then tt_item_curr_amts else 0) @ tt_item_curr_amts
            (if include_amt then status_curr_pct else 0) @ status_curr_pct
            tt_item_count
            status_item_um
            status_item_pct
            tt_item_ship_count
            status_ship_pct
         with frame status_det.

         down with frame status_det.

      end. /* FOR EACH tt_item_totals */

      display
         (getTermlabel("TOTALS",24)) @ tt_item_status
         (if include_amt then total_curr_amts else 0) @ tt_item_curr_amts
         (if include_amt then total_pct else 0) @ status_curr_pct
         total_item_count @ tt_item_count
         status_item_um @ status_item_um
         total_pct @ status_item_pct
         total_ship_count @ tt_item_ship_count
         total_pct @ status_ship_pct
      with frame status_det.
      down 2 with frame status_det.

   end. /* IF LAST-OF(tt_ship_item) */

   /* DISPLAY TOTALS BY CUSTOMER */

   if last-of(tt_ship_cust) then do:

          /* INITIALIZE VARIABLES */
      assign
         total_item_count = 0
         total_curr_amts = 0
         total_ship_count = 0
         status_item_um = report_um.


      for first tt_cust_totals no-lock:
      end.

      if available tt_cust_totals then do:
         totals_label2 = (getTermlabel("CUSTOMER_TOTALS",35)) + ":  "
                         + tt_cust_cust.

         display
            totals_label2
         with frame totals2.
      end.

      for each tt_cust_totals no-lock:
         total_item_count  = total_item_count + tt_cust_item_totals.
         total_curr_amts   = total_curr_amts + tt_cust_curr_totals.
         total_ship_count =  total_ship_count + tt_cust_ship_totals.
      end. /* FOR EACH tt_item_totals */

      for each tt_cust_totals no-lock
         break by tt_cust_status:

         assign
            status_curr_pct  = if tt_cust_curr_totals > 0 then
                                  (tt_cust_curr_totals /
                                   total_curr_amts) * 100
                                else 0
            status_item_pct  = if tt_cust_item_totals > 0 then
                                  (tt_cust_item_totals /
                                   total_item_count) * 100
                                else 0
            status_ship_pct = if tt_cust_ship_totals > 0 then
                                  (tt_cust_ship_totals /
                                   total_ship_count) * 100
                                else 0.

         display
            tt_cust_status
            (if include_amt then tt_cust_curr_totals else 0)
               @ tt_cust_curr_totals
            (if include_amt then status_curr_pct else 0) @ status_curr_pct
            tt_cust_item_totals
            status_item_um
            status_item_pct
            tt_cust_ship_totals
            status_ship_pct
         with frame status_det2.
         down with frame status_det2.

      end. /* FOR EACH tt_cust_totals */

      display
         (getTermLabel("TOTALS",24)) @ tt_cust_status
         (if include_amt then total_curr_amts else 0) @
                tt_cust_curr_totals
         (if include_amt then total_pct else 0) @ status_curr_pct
         total_item_count @ tt_cust_item_totals
         status_item_um @ status_item_um
         total_pct @ status_item_pct
         total_ship_count @ tt_cust_ship_totals
         total_pct @ status_ship_pct
      with frame status_det2.
      down 2 with frame status_det2.

   end. /* IF LAST-OF(tt_ship_cust) */

   /* DISPLAY TOTALS FOR SITE */
   if last-of(tt_ship_site) then do:

      /* INITIALIZE VARIABLES */
      assign
         total_item_count = 0
         total_curr_amts = 0
         total_ship_count = 0
         status_item_um = report_um.

      for first tt_site_totals no-lock:
      end.

      if available tt_site_totals then do:
         totals_label3 = (getTermlabel("SITE_TOTALS",35)) + ":  "
                         + tt_site_site.

         display
            totals_label3
         with frame totals3.
      end.

      for each tt_site_totals no-lock:
         total_item_count  = total_item_count + tt_site_item_totals.
         total_curr_amts   = total_curr_amts + tt_site_curr_totals.
         total_ship_count = total_ship_count + tt_site_ship_totals.
      end. /* FOR EACH tt_site_totals */

      for each tt_site_totals no-lock
         break by tt_site_status:

         assign
            status_curr_pct  = if tt_site_curr_totals > 0 then
                                  (tt_site_curr_totals /
                                   total_curr_amts) * 100
                                else 0
            status_item_pct  = if tt_site_item_totals > 0 then
                                  (tt_site_item_totals /
                                   total_item_count) * 100
                                else 0
            status_ship_pct = if tt_site_ship_totals > 0 then
                                  (tt_site_ship_totals /
                                   total_ship_count) * 100
                                else 0.

         display
            tt_site_status
            (if include_amt then tt_site_curr_totals else 0)
                   @ tt_site_curr_totals
            (if include_amt then status_curr_pct else 0) @ status_curr_pct
            tt_site_item_totals
            status_item_um
            status_item_pct
            tt_site_ship_totals
            status_ship_pct
         with frame status_det3.
         down with frame status_det3.

      end. /* FOR EACH tt_site_totals */

      display
         (getTermLabel("TOTALS",24)) @ tt_site_status
         (if include_amt then total_curr_amts else 0) @
            tt_site_curr_totals
         (if include_amt then total_pct else 0) @ status_curr_pct
         total_item_count @ tt_site_item_totals
         status_item_um @ status_item_um
         total_pct @ status_item_pct
         total_ship_count @ tt_site_ship_totals
         total_pct @ status_ship_pct
      with frame status_det3.

      down 2 with frame status_det3.

   end. /* IF LAST-OF(tt_ship_site) */

   {us/mf/mfrpchk.i}

end. /* for each tt_ship_info */

/* INTERNAL PROCEDURE */

PROCEDURE message_display:
   define input parameter message_nbr like msg_nbr no-undo.
   define input parameter message_level as integer no-undo.
   define input parameter inv_prt_um like um_um no-undo.
   define input parameter ship_um like um_um no-undo.
   define output parameter error_msg as character format "x(80)" no-undo.

   {us/bbi/pxmsg.i &MSGNUM=message_nbr &ERRORLEVEL=message_level
      &MSGARG1=inv_prt_um
      &MSGARG2=ship_um
      &MSGBUFFER=error_msg}

END PROCEDURE.
