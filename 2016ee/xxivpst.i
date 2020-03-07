/* xxivpst.i - POST INVOICES TO AR AND GL REPORT                              */
/* soivpst.i - POST INVOICES TO AR AND GL REPORT                              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxivpst.i,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/*V8:ConvertMode=Maintenance                                                  */
/* REVISION: 7.0      LAST MODIFIED: 11/21/91   BY: sas  F017*/
/* REVISION: 7.0      LAST MODIFIED: 06/19/92   BY: tmd *F458*/
/* REVISION: 7.3      LAST MODIFIED: 09/04/92   BY: afs *G047*                */
/* REVISION: 7.3      LAST MODIFIED: 10/23/92   BY: afs *G230*                */
/* REVISION: 7.3      LAST MODIFIED: 07/12/93   BY: dpm *GD33*                */
/* REVISION: 7.3      LAST MODIFIED: 09/18/94   BY: dpm *FR54*                */
/* REVISION: 7.3      LAST MODIFIED: 03/13/95   BY: jxz *F0M3*                */
/* REVISION: 8.5      LAST MODIFIED: 01/31/96   BY: taf *J053*                */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* Old ECO marker removed, but no ECO header exists *F029*                    */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* REVISION: 8.6E     LAST MODIFIED: 07/05/98   BY: *L024* Sami Kureishy      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb                */
/* REVISION: 9.1      LAST MODIFIED: 10/16/00   BY: *N0W8* Mudit Mehta        */
/* Revision: 1.10.2.7  BY: Ed van de Gevel      DATE: 03/03/05  ECO: *R00G*   */
/* $Revision: 1.2 $    BY: Arun Kumar           DATE: 01/29/07  ECO: *R0C6*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */

define {1} variable gl_sum           like mfc_logical  initial yes
           format "Consolidated/Detail".
define {1} variable ref              like   glt_ref.
define {1} variable ext_price        as decimal format "->>>>,>>>,>>9.99"
           label "Ext Price".
define {1} variable so_recno         as recid.
define {1} variable sod_recno        as recid.
define {1} variable eff_date         like ar_effdate.
define {1} variable undo_all         like mfc_logical no-undo.
define {1} variable batch            like ar_batch.
define {1} variable nbr              like so_nbr
           label "Sales Order".
define {1} variable nbr1             like so_nbr
           label "To".
define {1} variable inv              like so_inv_nbr
           label "Invoice".
define {1} variable inv1             like so_inv_nbr
           label "To".
define {1} variable name             like ad_name.
define {1} variable qty_open         like sod_qty_ord.
define {1} variable gr_margin        like sod_price format "->>>>,>>9.99"
           label "Unit Margin".
define {1} variable ext_gr_margin    like gr_margin
           label "Ext Margin".
define {1} variable desc1            like pt_desc1 format "x(49)".
define {1} variable inv_only         like mfc_logical initial yes.
define {1} variable update_post      like mfc_logical initial yes.
define {1} variable qty_bo           like sod_qty_ord
           label "Backorder".
define {1} variable dr_amt           as decimal format "->>>,>>>,>>>.99"
           label "Debit Amount".
define {1} variable cr_amt           as decimal format "->>>,>>>,>>>.99"
           label "Credit Amount".
define {1} variable base_amt         like ar_amt.
define {1} variable exch_rate        like exr_rate.
define {1} variable exch_rate2       like exr_rate2.
define {1} variable exch_ratetype    like exr_ratetype.
define {1} variable exch_exru_seq    like exru_seq.
define {1} variable base_price       like ext_price.
define {1} variable base_margin      like ext_gr_margin.
define {1} variable ext_list         like sod_list_pr.
define {1} variable ext_disc         as decimal.
define {1} variable ext_cost         like sod_price.
define {1} variable tot_ext_cost     like sod_price.
define {1} variable post             like mfc_logical.
define {1} variable print_lotserials like mfc_logical
           label "Print Lot/Serial Numbers Shipped".
define {1} variable lotserial_total  like tr_qty_chg.
define {1} variable tot_line_disc    as decimal.
define {1} variable curr_amt         like glt_amt.
define {1} variable tot_curr_amt     like glt_amt.
define {1} variable already_posted   like glt_amt.
define {1} variable should_be_posted like glt_amt.
define {1} variable net_price        like sod_price.
define {1} variable net_list         like sod_list_pr.
define {1} variable post_entity      like ar_entity.
define {1} variable tax_recno        as recid.
define {1} variable cust             like so_cust.
define {1} variable cust1            like so_cust.
define {1} variable bill             like so_bill.
define {1} variable bill1            like so_bill.
define {1} variable daybookset       like dybs_code.
define {1} variable daybookset1      like dybs_code.
define {1} variable ldnbr            like lgd_nbr.
define {1} variable ldnbr1           like lgd_nbr.
define {1} variable ldshipfrom       like lgd_shipfrom.
define {1} variable ldshipfrom1      like lgd_shipfrom.
define {1} variable batch_tot        like glt_amt.
define {1} variable inccor           like mfc_logical
           label "Correction Invoices" initial no.
define {1} variable s_eff_error      as integer format "9" no-undo
           label "On Effective Date Error" initial 1.
define {1} variable daybook_code like dy_dy_code.
define {1} variable invoice_type as character.
define {1} variable report_framework like mfc_logical.


/*c1603* start added code >>>>> */
define {1} variable ship             like so_ship.
define {1} variable ship1            like so_ship.
/*cy1002h*/ def var operr as int.
/*cy1002*/ def {1} var shipvia     like ih_shipvia.
/*cy1002*/ def {1} var shipvia1    like ih_shipvia.
/*cy1002c*/ def {1} var outboth        as logical initial yes
/*cy1002c*/                                   label "Output All".
/*cy1002c*/ def {1} var outtype        as logical
/*cy1002c*/                                   format "Email/Print"
/*cy1002c*/                                   label "Output Type".
/*c1603* end added code <<<<<   */
