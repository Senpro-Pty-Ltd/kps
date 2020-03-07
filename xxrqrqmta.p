/* rqrqmta.p  - REQUISITION MAINTENANCE - LINES                               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqrqmta.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*                                                                            */
/* Revision: 8.6      LAST MODIFIED: 04/22/97   By: *J1Q2* Bill Gates         */
/* Revision: 8.5      LAST MODIFIED: 10/30/97   By: *J243* Patrick Rowan      */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/22/98   BY: *J2QB* Bill Gates         */
/* REVISION: 8.6E     LAST MODIFIED: 07/18/98   BY: *L040* Brenda Milton      */
/* REVISION: 8.6E     LAST MODIFIED: 07/18/98   BY: *K1QS* Dana Tunstall      */
/* REVISION: 8.5      LAST MODIFIED: 08/12/98   BY: *J2W4* Patrick Rowan      */
/* REVISION: 8.5      LAST MODIFIED: 09/17/98   BY: *J2VX* Patrick Rowan      */
/* Revision: 8.5      LAST MODIFIED: 09/21/98   By: *J300* Patrick Rowan      */
/* Revision: 8.5      LAST MODIFIED: 09/28/98   By: *J30R* Patrick Rowan      */
/* Revision: 8.6E     LAST MODIFIED: 02/01/99   By: *J396* Steve Nugent       */
/* Revision: 9.1      LAST MODIFIED: 05/18/99   BY: *J3FW* Sachin Shinde      */
/* Revision: 9.1      LAST MODIFIED: 07/08/99   BY: *J3HV* Poonam Bahl        */
/* Revision: 9.1      LAST MODIFIED: 10/01/99   By: *N014* Murali Ayyagari    */
/* Revision: 9.1      LAST MODIFIED: 10/07/99   BY: *J39R* Reetu Kapoor       */
/* Revision: 9.1      LAST MODIFIED: 01/28/00   BY: *K253* Sandeep Rao        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 07/17/00   BY: *M0PY* Kaustubh Kulkarni  */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KP* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 10/06/00   BY: *M0TH* Abhijeet Thakur    */
/* Revision: 9.1      LAST MODIFIED: 12/13/00   BY: *L16L* Rajaneesh Sarangi  */
/* Revision: 1.37         BY: Patrick Rowan       DATE: 01/04/01  ECO: *J3QK* */
/* Revision: 1.39         BY: Niranjan Ranka      DATE: 04/10/01  ECO: *P00L* */
/* Revision: 1.41         BY: Nikita Joshi        DATE: 08/03/01  ECO: *M1DQ* */
/* Revision: 1.43         BY: Vivek Dsilva        DATE: 10/10/01  ECO: *N144* */
/* Revision: 1.44         BY: Falguni Dalal       DATE: 11/28/01  ECO: *P02Y* */
/* Revision: 1.47         BY: Anitha Gopal        DATE: 12/21/01  ECO: *N174* */
/* Revision: 1.48         BY: Samir Bavkar        DATE: 04/05/02  ECO: *P000* */
/* Revision: 1.50         BY: Jean Miller         DATE: 05/15/02  ECO: *P05V* */
/* Revision: 1.51         BY: Mark Christian      DATE: 05/30/02  ECO: *N1K7* */
/* Revision: 1.52         BY: Manisha Sawant      DATE: 12/05/02  ECO: *N219* */
/* Revision: 1.53         BY: Vinod Nair          DATE: 01/17/03  ECO: *N24C* */
/* Revision: 1.54         BY: Vivek Gogte         DATE: 02/27/03  ECO: *P0N8* */
/* Revision: 1.55         BY: Geeta Kotian        DATE: 04/03/03  ECO: *N2BS* */
/* Revision: 1.57         BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.58         BY: Rajinder Kamra      DATE: 06/23/03  ECO: *Q003* */
/* Revision: 1.59         BY: Veena Lad           DATE: 01/21/04  ECO: *P1K8* */
/* Revision: 1.61         BY: Veena Lad           DATE: 07/19/04  ECO: *P2B6* */
/* Revision: 1.62         BY: Shivganesh Hegde    DATE: 02/14/05  ECO: *P382* */
/* Revision: 1.64         BY: Bharath Kumar       DATE: 05/25/05  ECO: *P3M9* */
/* Revision: 1.65         BY: Niranjan Ranka      DATE: 06/13/05  ECO: *R01B* */
/* Revision: 1.66         BY: Tejasvi Kulkarni    DATE: 07/12/05  ECO: *P3T1* */
/* Revision: 1.67         BY: Shivaraman V.       DATE: 08/18/05  ECO: *P3YM* */
/* Revision: 1.68         BY: Andrew              DATE: 08/22/05  ECO: *R01P* */
/* Revision: 1.69.1.1     BY: Somesh Jeswani      DATE: 11/28/05  ECO: *P49H* */
/* Revision: 1.69.1.5     BY: Shilpa Kamath       DATE: 1/10/06   ECO: *R036* */
/* Revision: 1.74         BY: Shilpa Kamath       DATE: 04/04/06  ECO: *R03R* */
/* Revision: 1.76         BY: Robin McCarthy      DATE: 05/31/06  ECO: *R02F* */
/* Revision: 1.77         BY: Shilpa Kamath       DATE: 06/15/06  ECO: *R05W* */
/* Revision: 1.78         BY: Amit Kumar          DATE: 07/24/06  ECO: *P4XX* */
/* Revision: 1.79         BY: Jayesh Sawant       DATE: 07/31/06  ECO: *P4Y1* */
/* Revision: 1.80         BY: Amandeep Saini      DATE: 07/11/06  ECO: *P5VQ* */
/* Revision: 1.81         BY: Sumit Karunakaran   DATE: 07/19/07  ECO: *P5K9* */
/* Revision: 1.84         BY: Katie Hilbert       DATE: 07/28/07  ECO: *R0C6* */
/* Revision: 1.85         BY: Prajakta Patil      DATE: 01/07/08  ECO: *P63D* */
/* Revision: 1.86         BY: Robin McCarthy      DATE: 01/14/08  ECO: *R08C* */
/* Revision: 1.87         BY: Amar Gaikwad        DATE: 02/08/08  ECO: *P69P* */
/* Revision: 1.88         BY: Iram Momin          DATE: 03/10/08  ECO: *P6MT* */
/* Revision: 1.94         BY: Anurag Jha          DATE: 07/11/08  ECO: *R0R0* */
/* Revision: 1.95         BY: Julie Milligan      DATE: 08/27/08  ECO: *R12P* */
/* Revision: 1.96         BY: Jean Miller         DATE: 10/27/08  ECO: *R15M* */
/* Revision: 1.97         BY: Mukesh Singh        DATE: 12/11/08  ECO: *Q21K* */
/* Revision: 1.98         BY: Mallika Poojary     DATE: 02/23/09  ECO: *P64B* */
/* Revision: 1.99         BY: Mukesh Singh        DATE: 05/06/09  ECO: *Q2MD* */
/* Revision: 1.100        BY: Nafees Khan         DATE: 05/11/09  ECO: *Q2MR* */
/* Revision: 1.101        BY: Prajakta Patil      DATE: 09/25/09  ECO: *Q3B8* */
/* Revision: 1.104        BY: Prabu               DATE: 10/28/09  ECO: *R1T2* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB     LAST MODIFIED: 11-Jun-2010              BY: gbg *c1171*            */
/* CYB     LAST MODIFIED: 29-JUL-2010              BY: gbg *c1185*            */
/*         Force this version of requisition maintenance into single line     */
/*         Mode all the time and do not allow change to multi line            */
/* CYB     LAST MODIFIED: 12-OCT-2010              BY: gbg *c1199*            */
/*         Implement different cost centre/sub-account per requisition line   */
/* CYB     LAST MODIFIED: 08-JAN-2011              BY: gbg *c1203*            */
/*         Implement different cost centre/sub-account per requisition line   */
/*         Take out setting of header Cost Centre                             */
/* CYB     LAST MODIFIED: 14-FEB-2011              BY: gbg *c1207*            */
/*         Set default site for requisition line                              */
/* CYB     LAST MODIFIED: 14-FEB-2011              BY: gbg *c1208*            */
/* CYB     LAST MODIFIED: 14-FEB-2011              BY: gbg *c1209*            */
/* CYB     LAST MODIFIED: 24-MAR-2011              BY: gbg *c1211*            */
/* CYB     LAST MODIFIED: 24-MAR-2011              BY: gbg *c1212*            */
/* CYB     LAST MODIFIED: 11-AUG-2011              BY: gbg *c1227*            */
/*         C1227 undoes c1212 due to misunderstanding in requirements         */
/*         c1212 should have prevented editing of site on line 1              */
/*         It was implemented as ONLY allow edit of site on line 1            */
/*         For now we have simply eliminated this code and allow site         */
/*         to be edited on all lines                                          */
/*                                                                            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1228*                     */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB    LAST MODIFIED: 19-AUG-2011    BY:  gbg *c1231*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 30-NOV-2013 BY: gbg *c1446*   */
/* CYB                   LAST MODIFIED: 23-MAR-2015 BY: nac *d3032*   */
/* CYB                   LAST MODIFIED: 2016-SEP-27 BY: gbg *d3032a*  */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
 
/* NOTE: CHANGES MADE TO THIS PROGRAM MAY NEED TO BE MADE TO
 * REQUISITION DETAIL INQUIRY AND/OR REQUISITION MAINTENANCE
 * AND/OR REQUISITION REPORT.*/
 
/* MAX UNIT COST (rqd_max_cost) AND EXT COST (ext_cost) WILL NOW BE */
/* CALCULATED USING net_price AND UNIT COST (rqd_pur_cost) INSTEAD  */
/* OF DISC% (rqd_disc_pct)                                          */
 
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/pp/ppprlst.i} /* PRICE LIST CONSTANTS */
{us/px/pxmaint.i}
{us/px/pxphdef.i gpcmxr}
{us/px/pxphdef.i gpcodxr}
{us/px/pxphdef.i gpumxr}
{us/px/pxphdef.i ppitxr}
{us/px/pxphdef.i ppprxr}
{us/gp/gpdecchr.i}
 
{proxy/bcreditor/apigetpurchaseaccountdatadef.i}
 
define input parameter p_rqm_recid as recid no-undo.
define input  parameter p_new_req     as logical no-undo.
define output parameter p_line_opened as logical no-undo.
 
{us/rq/rqconst.i}
{us/rq/rqalttd.i new} /*APPROVER LIST TEMPTABLE DEFINITIONS*/
 
define shared variable cmtindx as integer.
define shared variable userid_modifying as character no-undo.
 
define variable clines               as integer initial ? no-undo.
define variable continue             as logical no-undo.
define variable conversion_factor    as decimal no-undo.
define variable cur_cost             as decimal no-undo.
define variable del-yn               like mfc_logical no-undo.
define variable desc1                like pt_desc1 no-undo.
define variable desc2                like pt_desc1 no-undo.
define variable ext_cost             like rqd_pur_cost
                                     label "Ext Cost" no-undo.
define variable got_vendor_price     as logical no-undo.
define variable i                    as integer no-undo.
define variable line                 like rqd_line no-undo.
define variable line_cmmts           like comments no-undo.
define variable max_ext_cost         like rqd_max_cost
                                     label "Max Ext Cost" no-undo.
define variable mfgr                 like vp_mfgr no-undo.
define variable mfgr_part            like vp_mfgr_part no-undo.
define variable messages             as character no-undo.
define variable msglevels            as character no-undo.
define variable msgnbr               as integer no-undo.
define variable new_rqd              like mfc_logical no-undo.
define variable not_in_inventory_msg as character no-undo.
define variable poc_pt_req           as logical no-undo.
define variable prev_category        like rqd_category no-undo.
define variable prev_ext_cost        like ext_cost no-undo.
define variable prev_item            like rqd_part no-undo.
define variable prev_max_ext_cost    like ext_cost no-undo.
define variable prev_qty             like rqd_req_qty no-undo.
define variable prev_site            like rqd_site no-undo.
define variable prev_status          like rqd_status no-undo.
define variable prev_um              like rqd_um no-undo.
define variable pur_cost             as decimal no-undo.
define variable prev_pur_cost        like rqd_pur_cost no-undo.
define variable qty_open             like rqd_req_qty no-undo.
define variable requm                like rqd_um no-undo.
define variable display_um           like rqd_um no-undo.
define variable base_cost            like rqd_pur_cost no-undo.
define variable rqd_recid            as recid no-undo.
define variable rqm_recid            as recid no-undo.
define variable sngl_ln              like rqf_ln_fmt.
define variable st_qty               like pod_qty_ord
                                     label "Stock Um Qty" no-undo.
define variable tot_qty_ord          like pod_qty_ord no-undo.
define variable serial_controlled    as logical no-undo.
define variable valid_acct           like mfc_logical no-undo.
define variable vendor               like rqm_vend no-undo.
define variable vendor_part          like rqd_vpart no-undo.
define variable vendor_price         like vp_q_price no-undo.
define variable vendor_q_curr        like vp_curr no-undo.
define variable vendor_q_qty         like vp_q_qty no-undo.
define variable vendor_q_um          like vp_um no-undo.
define variable yn                   like mfc_logical no-undo.
define variable rndmthd              like rnd_rnd_mthd no-undo.
define variable formatstring         as character no-undo.
define variable warning              like mfc_logical initial no no-undo.
define variable net_price            like pc_min_price no-undo.
define variable new_net_price        like pc_min_price no-undo.
define variable lineffdate           like rqm_due_date no-undo.
define variable minprice             like pc_min_price no-undo.
define variable maxprice             like pc_min_price.
define variable pc_recno             as recid no-undo.
define variable minmaxerr            as logical no-undo.
define variable got_vendor_item_data as logical no-undo.
define variable vend_row             as integer no-undo.
define variable disc_pct             like rqd_disc_pct no-undo.
define variable mc-error-number      like msg_nbr      no-undo.
define variable l_rqd_cost           like rqd_pur_cost no-undo.
define variable l_flag               like mfc_logical initial yes no-undo.
define variable l_count              as   logical                 no-undo.
define variable l_prev_due_date      like rqd_due_date no-undo.
define variable siteEntity           as character      no-undo.
define variable l_netprice_int       as   integer      no-undo.
define variable l_netprice_frac      as   integer      no-undo.
 
/* REQ_UM TO SEE IF QTY CONVERSION SHOULD BE DONE          */
define variable st_um          like rqd_um no-undo.
define variable req_qty        like rqd_req_qty no-undo.
define variable l_actual_disc  as decimal                no-undo.
define variable l_min_disc     as decimal initial -99.99 no-undo.
define variable l_max_disc     as decimal initial 999.99 no-undo.
define variable l_display_disc as decimal                no-undo.
define variable prev_vend      like rqd_vend no-undo.
define variable dummy_sub      like pod_sub no-undo.
define variable dummy_cc       like pod_cc  no-undo.
define variable l_prev_vend    like rqd_vend no-undo.
define variable l_prev_list    like rqd_pr_list          no-undo.
define variable l_prev_list2   like rqd_pr_list2         no-undo.
define variable l_rqd_disc_pct like rqd_disc_pct         no-undo.
define variable gl-site        like in_site              no-undo.
define variable gl-set         like in_gl_set            no-undo.
define variable msg-arg        as character format "x(16)" no-undo.
define variable l_cost_chg     like rqd_pur_cost           no-undo.
define variable hBlockedTransactionlibrary as handle     no-undo.
define variable l_pt_memo_type as  character no-undo.
define variable l_pt_lot_ser   as character no-undo.
 
 
define buffer b_rqd_det for rqd_det.

/*q9006*/ def var vmessage as char.
/*q9006*/ def var prevdomain as char.
/*q9006*/ def var preventity as char.
/*q9006*/ def buffer b1dom for dom_mstr.
/*q9006*/ def buffer b2dom for dom_mstr.
/*c1207*/ def var defrqdsite as char.
/*c1209*/ def var cprevdomain as char.
 
not_in_inventory_msg = getTermLabel("ITEM_NOT_IN_INVENTORY",30).
 
form
   rqm_mstr.rqm_nbr
   rqm_vend
   sngl_ln             colon 70
with frame a side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
form
   line
   rqd_site
   rqd_part
   rqd_vend
   rqd_req_qty
   rqd_um
   rqd_pur_cost        format ">>>>>>>>9.99<<<"
   rqd_disc_pct
with frame b clines down width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).
 
/* Colon 63 needed to accomodate Item Rev Date label but */
/* rqd_aprv_stat must remain at colon 60 to fit in frame */
form
   rqd_due_date        colon 15
   rqd_lot_rcpt        colon 39
   rqd_um_conv         colon 63
   rqd_need_date       colon 15
   rqd_rev             colon 39
   st_qty              colon 63
   rqd_type            colon 15
   rqd_item_rev_date   colon 39
   tot_qty_ord         colon 63
   rqd_category        colon 15
   rqd_max_cost        colon 63
   rqd_acct            colon 15
/*c1199*/  rqd__chr01          no-label 
/*c1199*/  rqd_cc              no-label 
/*c1199*   rqm_sub             no-label */
/*c1199*   rqm_cc              no-label */
   rqd_project         no-label
   ext_cost            colon 63
   max_ext_cost        colon 63
   rqd_vpart           colon 15 label "Supplier Item"
   rqd_status          colon 63
   mfgr                colon 15
   mfgr_part           no-label
   line_cmmts          colon 63
   desc1               colon 15
   rqd_aprv_stat       colon 60
   desc2               at 17 no-label
with frame c side-labels 1 down width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame c:handle).
 
rqd_item_rev_date:label = getTermLabel("ITEM_REVISION_DATE", 13).
 
form
   space(1)
   ad_name              no-label
   skip space(1)
   ad_line1             no-label
   skip space(1)
   ad_line2             no-label
   skip space(1)
   ad_city              no-label
   ad_state             no-label
   ad_zip               no-label
   skip space(1)
   ctry_country         no-label
   skip(1)
   space(1)
   rqd_pr_list2
   rqd_pr_list
with overlay frame vend centered row vend_row side-labels
title color normal (getFrameTitle("SUPPLIER",13)) width 40.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame vend:handle).
 
form
    rqd_due_date  colon 10
    space(2)
with frame line_popup overlay side-labels row 12 column 25.
 
 /* SET EXTERNAL LABELS */
 setFrameLabels(frame line_popup:handle).
 
rqm_recid = p_rqm_recid.
 
find first rqf_ctrl where rqf_ctrl.rqf_domain = global_domain no-lock.
find first poc_ctrl where poc_ctrl.poc_domain = global_domain no-lock.
 
find first mfc_ctrl where mfc_ctrl.mfc_domain = global_domain
   and mfc_field = "poc_pt_req"
no-lock no-error.
 
if available mfc_ctrl then
   poc_pt_req = mfc_logical.
 
sngl_ln = rqf_ln_fmt.
/*c1185*/ sngl_ln = yes.
 
find rqm_mstr where recid(rqm_mstr) = p_rqm_recid no-lock.
if p_new_req then
   p_line_opened = no.
else
   p_line_opened = yes.
 
find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.
 
/* Start blocked transaction library to run persistently */
run mfairunh.p
   (input "mgbltrpl.p",
    input  ?,
    output hBlockedTransactionlibrary).
 
{us/mg/mgbltrpl.i "hBlockedTransactionlibrary"}
 
/* SET CURRENCY DISPLAY FORMATS */
if rqm_curr = gl_base_curr then do:
   rndmthd = gl_rnd_mthd.
end.
 
else do:
   rndmthd = ?.
 
   /* GET ROUNDING METHOD FROM CURRENCY MASTER */
   {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
      "(input rqm_curr,
        output rndmthd,
        output mc-error-number)"}
   if mc-error-number <> 0 then do:
      run p_ip_msg (input mc-error-number, input 2).
   end.
end.
 
formatstring = ext_cost:format in frame c.
 
{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output formatstring, input rndmthd)"}
 
ext_cost:format in frame c = formatstring.
 
formatstring = max_ext_cost:format in frame c.
 
{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output formatstring, input rndmthd)"}
 
max_ext_cost:format in frame c = formatstring.
 
display
   rqm_nbr
   rqm_vend
   sngl_ln
with frame a.
 
line = 1.
find last rqd_det
   where rqd_det.rqd_domain = global_domain
      and rqd_nbr = rqm_nbr
no-lock no-error.
if available rqd_det then line = rqd_line + 1.
 
mainloop:
repeat:
 
   if sngl_ln then
      clines = 1.
   else
      clines = ?.
 
   /* GET DISCOUNT TABLE SETTING */
   {us/po/popcdisc.i}
 
   view frame b.
   if sngl_ln then view frame c.
 
   lineloop:
   repeat transaction:
 
      assign
         minprice = 0
         maxprice = 0.
 
      /* RESET "PREVIOUS" VALUE VARS */
      assign
         prev_item         = ""
         prev_site         = ""
         prev_vend         = ""
         prev_category     = ""
         prev_ext_cost     = 0
         prev_max_ext_cost = 0
         prev_qty          = 0
         prev_status       = ""
         prev_um           = ""
         l_prev_vend       = ""
         l_prev_list       = ""
         l_prev_list2      = "".
 
      /* INITIALIZE SINGLE-LINE FRAME */
      find rqd_det
         where rqd_det.rqd_domain = global_domain
           and rqd_nbr = rqm_nbr
           and rqd_line = line
      no-lock no-error.
 
      if available rqd_det then do:
         line_cmmts = rqd_cmtindx <> 0.
         rqd_recid = recid(rqd_det).
         run display_line_frame_b.
         if sngl_ln then do:
            run display_line_frame_c.
         end.
      end.
 
      else do:
         line_cmmts = rqf_lcmmts.
         run initialize_frame_b.
         if sngl_ln then run initialize_frame_c.
      end.
 
      /* GET LINE NUMBER FROM USER */
      display line with frame b.
 
      do on error undo, retry:
 
         set
            line
         with frame b
         editing:
            {us/mf/mfnp01.i rqd_det line rqd_line rqm_nbr  " rqd_det.rqd_domain =
            global_domain and rqd_nbr "  rqd_nbr}
            if recno <> ? then do:
 
               run p_calc_netprice(buffer rqd_det).
 
               rqd_recid = recid(rqd_det).
               run display_line_frame_b.
 
               if sngl_ln then do:
                  run display_line_frame_c.
               end.
            end.
         end.
 
         if line < 1 then do:
            run p_ip_msg (input 317, input 1).
            /* ZERO NOT ALLOWED */
            undo, retry.
         end.
 
         find first rqpo_ref
             where rqpo_ref.rqpo_domain = global_domain
               and rqpo_req_nbr = rqm_nbr
               and rqpo_req_line = line
         no-lock no-error.
 
         if available rqpo_ref then do:
            /* REQUISITION LINE REFERENCED BY PO */
            run display_message
               (input 2102,
                input 2,
                input rqpo_po_nbr + ' ' + string(rqpo_po_line),
                input "").
         end.
      end.
 
      /* FIND RECORD OR CREATE */
      find rqd_det
         where rqd_det.rqd_domain = global_domain
           and rqd_nbr = rqm_nbr
           and rqd_line = line
      exclusive-lock no-error.
 
      if available rqd_det then do:
 
         run p_calc_netprice(buffer rqd_det).
 
         rqd_recid = recid(rqd_det).
         run display_line_frame_b.
 
         if sngl_ln then do:
            run display_line_frame_c.
         end.
 
         new_rqd = false.
         global_part = rqd_part.
 
         /*ASSIGN PREVIOUS VALUES NO MATTER IF CLOSED */
         if rqd_status  <> "x"
         then do:
            assign
               l_rqd_cost        = rqd_pur_cost
               prev_ext_cost     = rqd_req_qty * (l_netprice_int + l_netprice_frac / 100000)
               prev_max_ext_cost = rqd_req_qty * rqd_max_cost.
         end. /*IF rqd_status  <> "x"*/
 
         if (rqd_aprv_stat = APPROVAL_STATUS_APPROVED
            or rqd_aprv_stat = APPROVAL_STATUS_OOT)
         then do:
            run p_ip_msg (input 2116, input 2).
            /* APPROVED/OOT STATUS WILL BE CHANGED TO UNAPPROVED */
         end.
 
         assign
            prev_category   = rqd_category
            prev_item       = rqd_part
            prev_qty        = rqd_req_qty
            prev_site       = rqd_site
            prev_status     = rqd_status
            prev_um         = rqd_um
            prev_pur_cost   = rqd_pur_cost
            l_prev_due_date = rqd_due_date
            /* STOCKING UM IS INITIALIZED TO THE REQ_UM AND WILL */
            /* BE UPDATED TO THE PT_UM IF THE PART IS A pt_mstr except
            PT_domain.  */
            st_um           = rqd_um
            l_prev_vend     = rqd_vend
            l_prev_list     = rqd_pr_list
            l_prev_list2    = rqd_pr_list2.
 
      end.
 
      else do:
 
         if rqm_status = "x" then do:
 
            yn = no.
            /* ADDING NEW LINE TO CANCELLED REQUISITION - REOPEN? */
            run p-message-question
               (input 2077,
                input 1,
                input-output yn).
 
            if not yn then undo, retry.
 
            find rqm_mstr where recid(rqm_mstr) = p_rqm_recid
            exclusive-lock.
 
            assign
               rqm_status = ""
               rqm_cls_date = ?.
         end.
 
         /* WHEN A NEW LINE IS ADDED TO A CLOSED REQ */
         /* OPENING THE REQ AGAIN                    */
         if rqm_status = "c" then do:
 
            yn = no.
            /*ADDING NEW LINE TO CLOSED REQUISITION - REOPEN?*/
            run p-message-question
               (input 3299,
                input 1,
                input-output yn).
            if not yn then undo, retry.
 
            if yn then do:
               run p_open_req (input recid(rqm_mstr)).
            end. /* IF YN THEN */
 
         end. /* IF RQM_STATUS = "C" */
 
         run p_ip_msg (input 1, input 1).

/*c1207*/   defrqdsite = rqm_site.
/*c1207*/   find first b1dom no-lock 
/*c1207*/   where b1dom.dom_domain = global_domain
/*c1207*/   no-error.
/*c1207*/   if available b1dom
/*c1207*/   and can-find(first si_mstr where si_site = b1dom.dom_user2)
/*c1207*/   then do:
/*c1207*/       defrqdsite = b1dom.dom_user2.
/*c1207*/   end.
 
         /* ADDING NEW RECORD */
         create rqd_det.
         assign
            rqd_domain    = global_domain
            rqd_aprv_stat = APPROVAL_STATUS_UNAPPROVED
            rqd_disc_pct  = rqm_disc_pct
            rqd_due_date  = rqm_due_date
            rqd_line      = line
            rqd_nbr       = rqm_nbr
            rqd_need_date = rqm_need_date
            rqd_pr_list   = rqm_pr_list
            rqd_pr_list2  = rqm_pr_list2
            rqd_project   = rqm_project
            rqd_site      = rqm_site
/*c1207*/   rqd_site      = defrqdsite
/*c1231*/   rqd_cc        = rqm_cc  
            rqd_um        = ""
            rqd_um_conv   = 1
            rqd_vend      = rqm_vend.
 
         if recid(rqd_det) = -1 then.
 
         /* THE FOLLOWING IS JUST TO TRICK FOLLOWING CODE
          * INTO THINKING THERE ARE COMMENTS SO AS TO PROPERLY
          * DISPLAY THE LINE_CMMTS VARIABLE */
         if rqf_lcmmts then rqd_cmtindx = -1.
         assign
            new_rqd = true
            rqd_recid = recid(rqd_det)
            p_line_opened = no.
         run display_line_frame_b.
 
         if sngl_ln then do:
            run display_line_frame_c.
         end.
 
      end.
 
      line_cmmts = rqd_cmtindx <> 0.
 
/*cy1011* start deleted code >>>>>>>>
      /* GET SITE FROM USER */
      run get_site.
*cy1011* end deleted code <<<<<<<< */

/*c9999* start added code >>>>>> */
      if rqd_line <> 1 then run get_site.
      else continue = yes.
/*c9999* end added code <<<<<< */


      if not continue then undo, retry.
 
      /* GET ITEM FROM USER */
      run get_item.
      if not continue then undo, retry.
      global_part = rqd_part.
 
      if sngl_ln then do:
 
         /* DISPLAY SUPPLIER IF THERE IS ONE */
         run display_supplier(input rqd_vend).
 
         /* DISPLAY PRICE AND DISCOUNT LISTS */
         display
            rqd_pr_list2
            rqd_pr_list
         with frame vend.
 
      end.
 
      /* GET SUPPLIER FROM USER */
      run get_supplier.
 
      if not continue then do:
         hide frame vend no-pause.
         undo, retry.
      end.
 
      /* SEE IF PURCHASES ACCOUNT NEEDS TO BE RE-DEFAULTED BECAUSE */
      /* SITE OR VENDOR HAS CHANGED  (EXISTING  REQS ONLY)         */
      run getPurchaseAcctDefault.
 
      /* GET DEFAULT PRICE AND DISCOUNT LISTS */
      find vd_mstr
         where vd_mstr.vd_domain = global_domain
            and vd_addr = rqd_vend
      no-lock no-error.
 
      if available vd_mstr and new_rqd
      then do:
         assign
            rqd_pr_list  = if rqd_pr_list = ""
                           then
                              vd_pr_list
                           else
                              rqd_pr_list
            rqd_pr_list2 = if rqd_pr_list2 = ""
                           then
                              vd_pr_list2
                           else
                              rqd_pr_list2.
 
         if rqm_vend <> rqd_vend
         then do:
            rqd_disc_pct = vd_disc_pct.
            display rqd_disc_pct with frame b.
         end. /* IF rqm_vend <> rqd_vend */
      end. /* IF AVAILABLE vd_mstr */
      /* GET PRICE AND DISCOUNT LISTS FROM USER */
      if sngl_ln
      then do:
 
         display
            rqd_pr_list2
            rqd_pr_list
         with frame vend.
 
         setpriceinfo:
         do on error undo, retry:
 
            set
               rqd_pr_list2
               rqd_pr_list
            with frame vend.
 
            /* CHECK PRICE LIST */
            {us/ad/adprclst.i
               &price-list     = "rqd_pr_list2"
               &curr           = "rqm_curr"
               &list-class     = {&SUPPLIER-CLASSIFICATION}
               &price-list-req = "poc_pt_req"
               &undo-label     = "setpriceinfo"
               &with-frame     = "with frame vend"
               &disp-msg       = "yes"
               &warning        = "yes"}
 
            /*CHECK DISCOUNT LIST*/
            {us/ad/addsclst.i
               &disc-list      = "rqd_pr_list"
               &curr           = "rqm_curr"
               &list-class     = {&SUPPLIER-CLASSIFICATION}
               &disc-list-req  = "disc_tbl_req"
               &undo-label     = "setpriceinfo"
               &with-frame     = "with frame vend"
               &disp-msg       = "yes"
               &warning        = "yes"}
         end.
 
         hide frame vend no-pause.
 
      end.
 
      if new_rqd
      or rqd_part <> prev_item
      then do:
 
     /* GET DEFAULT ACCT */
         rqd_acct = gl_pur_acct.
/*c1199*/ rqd__chr01 = gl_pur_sub.
/*c1231*/ rqd_cc     = rqm_cc.
 
         /* Retrieve default purchase account info from Financials */
         assign vcProxyCompanyCode = current_entity
                icCreditorCode     = rqd_vend.
 
         {proxy/bcreditor/apigetpurchaseaccountdatarun.i}
 
         if ocPurchaseGLCode <> ""
         then
            rqd_acct = ocPurchaseGLCode.
/*c1199*/  rqd__chr01 = ocPurchaseDivisionCode.
 
         /* DEFAULT CATEGORY */
         run get_default_category
            (input rqm_direct,
             input rqd_acct,
             input rqm_sub,
             output rqd_category).
 
         /* GET DATA IF THERE IS AN ITEM MASTER RECORD */
         find pt_mstr
            where pt_mstr.pt_domain = global_domain
              and pt_part = rqd_part
         no-lock no-error.
 
         if available pt_mstr then do:
            /* INITIALIZE RECORD */
            assign
               rqd_desc     = pt_desc1
               rqd_rev      = pt_rev
               rqd_insp_rqd = pt_insp_rqd
               rqd_um       = pt_um
               vendor_part  = ""
               mfgr         = ""
               mfgr_part    = "".
 
            {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                     &HANDLE = ph_ppitxr
                     &PARAM = "(input  rqd_part,
                                input  rqd_site,
                                input ""pt_loc"",
                                output rqd_loc)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
 
            {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                     &HANDLE = ph_ppitxr
                     &PARAM = "(input  rqd_part,
                                input  rqd_site,
                                input ""pt_memo_type"",
                                output l_pt_memo_type)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
 
            rqd_type = l_pt_memo_type .
 
            if l_pt_memo_type <> "" then do:
               /* TYPE SET TO (M)EMO */
               {us/bbi/pxmsg.i &MSGNUM=25 &ERRORLEVEL={&WARNING-RESULT}}
            end.
 
            for first clc_ctrl
               where clc_ctrl.clc_domain = global_domain
            no-lock: end.
 
            {us/px/pxrun.i &PROC  = 'getFieldDefault'
                     &PROGRAM = 'ppitxr.p'
                     &HANDLE = ph_ppitxr
                     &PARAM = "( input  pt_part,
                                 input  rqd_site,
                                 input ""pt_lot_ser"",
                                 output l_pt_lot_ser)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
 
            if (available clc_ctrl
               and clc_active     = yes
               and clc_polot_rcpt = yes)
               or  l_pt_lot_ser     = "s"
            then
               rqd_lot_rcpt = yes.
 
            /* GET FIELD VALS FROM PTP_DET */
            find ptp_det where ptp_det.ptp_domain = global_domain
                           and ptp_part = pt_part
                           and ptp_site = rqd_site
            no-lock no-error.
 
            if available ptp_det then do:
               assign
                  rqd_rev = ptp_rev
                  rqd_insp_rqd = ptp_ins_rqd.
            end.
 
            if (available ptp_det and ptp_ins_rqd) or
               (not available ptp_det and pt_insp_rqd)
            then do:
               {us/px/pxrun.i &PROC  = 'getDefaultInspectionLocation'
                        &PROGRAM = 'ppitxr.p'
                        &HANDLE = ph_ppitxr
                        &PARAM =  "(input  pt_part,
                                    input  rqd_site,
                                    output rqd_loc)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
            end.
 
            /* GET FIELD VALS FROM PL_MSTR */
            {us/px/pxgetph.i ppprxr}
            if ({us/px/pxfunct.i &FUNCTION = 'IsValidProductLine' 
                        &PROGRAM = 'ppprxr.p'
                        &HANDLE = ph_ppprxr
                        &PARAM = "(pt_prod_line)"})
            then do:
               find vd_mstr
                  where vd_mstr.vd_domain = global_domain
                    and vd_addr = rqd_vend
               no-lock no-error.
 
               /* Determine if default gl accounts exists */
               {us/bbi/gprun.i ""glactdft.p""
                        "(input  ""PO_PUR_ACCT"",
                          input  pt_prod_line,
                          input  rqd_site,
                          input  if available vd_mstr then vd_type else """",
                          input  """",
                          input  no,
                          output rqd_acct,
                          output dummy_sub,
                          output dummy_cc)"}
            end.
 
            /* DEFAULT CATEGORY */
            run get_default_category
               (input  rqm_direct,
                input  rqd_acct,
                input  rqm_sub,
                output rqd_category).
 
            /* GET SUPPLIER ITEM */
            vendor = rqd_vend.
            if rqd_vend = "" then vendor = rqm_vend.
 
            run retrieve_vendor_item_data
               (input vendor,
                input rqd_part,
                output got_vendor_item_data,
                output vendor_q_qty,
                output vendor_q_um,
                output vendor_q_curr,
                output vendor_part,
                output vendor_price,
                output mfgr,
                output mfgr_part).
 
            if got_vendor_item_data then
               rqd_vpart = vendor_part.
            else
               rqd_vpart = "".
 
            /* DISPLAY STUFF */
            display
               rqd_um
               rqd_pur_cost
            with frame b.
 
            if sngl_ln
            then do:
/*c1199*/  rqd__chr01 = dummy_sub.
               display
                  rqd_vpart
                  mfgr
                  mfgr_part
                  rqd_um_conv
                  pt_desc1 @ desc1
                  pt_desc2 @ desc2
                  rqd_category
                  rqd_acct
/*c1199*/         rqd__chr01
/*c1199*/         rqd_cc 
/*c1199*                  rqm_sub */
/*c1199*                  rqm_cc */
                  rqd_project
                  l_pt_memo_type @ rqd_type
               with frame c.
            end.
 
         end. /*IF AVAILABLE PT_MSTR*/
 
         else do:
 
            if sngl_ln then do:
               display not_in_inventory_msg @ desc1 with frame c.
            end.
 
            assign
               rqd_vpart = ""
               mfgr = ""
               mfgr_part = ""
               rqd_desc = not_in_inventory_msg
               rqd_type = "M".
 
            run p_ip_msg (input 25, input 2).
            /* TYPE SET TO (M)EMO */
            if sngl_ln then do:
               display
                  rqd_type
                  rqd_vpart
                  mfgr
                  mfgr_part
                  rqd_category
                  rqd_acct
/*c1199*/                 rqd__chr01
/*c1199*/                 rqd_cc
/*c1199*                  rqm_sub */
/*c1199*                  rqm_cc */
                  rqd_project
               with frame c.
            end.
 
         end.
      end.  /* if new_rqd or rqd_part <> prev_item */
 
      else do:
 
         if not new_rqd and
            rqd_vend <> l_prev_vend
         then do:
 
            assign
               vendor    = if rqd_vend = "" then rqm_vend else rqd_vend
               rqd_vpart = ""
               mfgr      = ""
               mfgr_part = "".
 
            for each vp_mstr
               where vp_mstr.vp_domain = global_domain
                and  vp_part = rqd_part
                and  vp_vend = vendor
            no-lock
            break by vp_q_date descending:
 
               if first(vp_q_date) then
                  assign
                     rqd_vpart    = vp_vend_part
                     mfgr         = vp_mfgr
                     mfgr_part    = vp_mfgr_part.
 
            end. /* FOR EACH vp_mstr */
 
            if sngl_ln then
               display
                  rqd_vpart
                  mfgr
                  mfgr_part
               with frame c.
 
         end. /* IF NOT new_rqd AND rqd_vend <>  _prev_vend */
      end. /* ELSE DO */
 
      /*** GET DEPENDENT DATA ETC ***/
      del-yn = false.
 
      if execname <> "rqapmt.p"
      then do:
         ststatus = stline[2].
         status input ststatus.
      end. /* IF EXECNAME <> "rqapmt.p" */
 
      /* GET REQ QTY AND UM FROM USER */
      do on error undo, retry:
         if execname <> "rqapmt.p"
         then
            set
               rqd_req_qty
               rqd_um
               go-on(CTRL-D F5)
            with frame b.
         else
            set
               rqd_req_qty
               rqd_um
            with frame b.
 
         if     ( execname <> "rqapmt.p")
            and ( lastkey  = keycode("f5")
               or lastkey  = keycode("ctrl-d"))
         then do:
            find first rqpo_ref
               where rqpo_ref.rqpo_domain = global_domain
                 and rqpo_req_nbr = rqd_nbr
                 and rqpo_req_line = rqd_line
            no-lock no-error.
 
            if available rqpo_ref then do:
               /* CAN'T DELETE REQUISITION, REFERENCED BY POS */
               run p_ip_msg (input 2081, input 3).
               undo, retry.
            end.
 
            del-yn = true.
            /* PLEASE CONFIRM DELETE */
            run p-message-question
               (input 11,
                input 1,
                input-output del-yn).
 
            if del-yn then do:
 
               /* WRITE HISTORY RECORD */
               {us/bbi/gprun.i ""rqwrthst.p""
                  "(input rqm_nbr,
                    input rqd_line,
                    input ACTION_DELETE_REQ_LINE,
                    input userid_modifying,
                    input '',
                    input '')"}
 
               /* DELETE COMMENTS */
               line = rqd_line + 1.
 
               {us/px/pxrun.i &PROC  = 'deleteAllTransactionComments' &PROGRAM = 'gpcmxr.p'
                              &HANDLE=ph_gpcmxr
                              &PARAM="(rqd_cmtindx)"
                              &NOAPPERROR=True
                              &CATCHERROR=True}
 
               /* DELETE ANY MRP DETAIL RECORDS */
               for each mrp_det
                   where mrp_det.mrp_domain = global_domain
                     and  mrp_dataset = "req_det"
                     and mrp_nbr = rqd_nbr
                     and mrp_line = string(rqd_line)
               exclusive-lock:
                  {us/in/inmrp.i &part=mrp_det.mrp_part &site=mrp_det.mrp_site}
                  delete mrp_det.
               end.
 
               /* DELETE THE LINE RECORD */
               delete rqd_det.
 
               find rqm_mstr where recid(rqm_mstr) = p_rqm_recid
               exclusive-lock.
 
               {us/bbi/gprun.i ""gpcurrnd.p"" "(input-output prev_ext_cost,
                                         input rndmthd)"}
 
               {us/bbi/gprun.i ""gpcurrnd.p"" "(input-output prev_max_ext_cost,
                                         input rndmthd)"}
 
               assign
                  rqm_total = rqm_total - prev_ext_cost
                  rqm_max_total = rqm_max_total - prev_max_ext_cost.
 
               clear frame b.
               if sngl_ln then clear frame c.
               next lineloop.
 
            end.
 
            else undo, retry.
 
         end. /* lastkey = ctrl-d .... */
 
         if rqd_req_qty = 0 then do:
            run p_ip_msg (input 317, input 3).
            /* ZERO NOT ALLOWED */
            undo, retry.
         end.
 
         /* VALIDATES REQUISTION LINE UNIT OF MEASURE */
         {us/px/pxrun.i &PROC       = 'validatePOLineUM' &PROGRAM    = 'popoxr1.p'
                  &PARAM      = "(input rqd_um)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}
 
         if return-value <> {&SUCCESS-RESULT} then do:
            next-prompt rqd_um with frame b.
            undo, retry .
         end.
 
         /* NEEDS TO BE A UM CONVERSION TO STK UM */
         find pt_mstr
            where pt_mstr.pt_domain = global_domain
             and  pt_part = rqd_part
         no-lock no-error.
 
         if available pt_mstr then do:
 
            if rqd_um <> pt_um then do:
               {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                              &HANDLE=ph_gpumxr
                              &PARAM="(input pt_part,
                                       input pt_um,
                                       input rqd_um,
                                       output conversion_factor)"
                              &NOAPPERROR=True
                              &CATCHERROR=True}
 
               if conversion_factor = ? then do:
                  /* NO UNIT OF MEASURE CONVERSION EXISTS */
                  run display_message
                     (input 33,
                      input 2,
                      input pt_um,
                      input "").
               end.
            end.
         end. /* if available pt_mstr */
 
         /* CHANGING UM NOT ALLOWED IF REFERENCED BY A PO */
         if not new_rqd and rqd_um <> prev_um then do:
            find first rqpo_ref
                where rqpo_ref.rqpo_domain = global_domain
                  and rqpo_req_nbr = rqd_nbr
                  and rqpo_req_line = rqd_line
            no-lock no-error.
 
            if available rqpo_ref then do:
               run p_ip_msg (input 2114, input 3).
               /* REQUISITION LINE REFERENCED BY PO, CHANGE NOT ALLOWED */
               next-prompt rqd_um with frame b.
               undo, retry.
            end.
         end.
 
         /* CHANGING (REDUCING) QTY MUST NOT CAUSE A NEGATIVE OPEN QTY */
         {us/bbi/gprun.i ""rqoqty.p""
                  "(input  rqd_nbr,
                    input  rqd_line,
                    output qty_open,
                    output requm)"}
 
         if qty_open < 0 then do:
            run p_ip_msg (input 2093, input 3).
            /* QTY ON PURCHASE ORDERS EXCEEDS REQUISITION LINE QTY */
            undo, retry.
         end.
 
         /* GET SUPPLIER ITEM UM AND COMPARE TO REQ UM */
         vendor = rqd_vend.
         if rqd_vend = "" then vendor = rqm_vend.
 
         run retrieve_vendor_item_data
            (input  vendor,
             input  rqd_part,
             output got_vendor_item_data,
             output vendor_q_qty,
             output vendor_q_um,
             output vendor_q_curr,
             output vendor_part,
             output vendor_price,
             output mfgr,
             output mfgr_part).
 
         if got_vendor_item_data and vendor_q_um <> rqd_um then do:
            /* UM NOT THE SAME AS FOR VENDOR PART */
            run display_message
               (input 304,
                input 2,
                input vendor_q_um,
                input "").
         end.
 
      end.
 
      /* DETERMINE UM CONVERSION FACTOR */
      find pt_mstr
         where pt_mstr.pt_domain = global_domain
           and pt_part = rqd_part
      no-lock no-error.
 
      if available pt_mstr then do:
 
         if pt_um = rqd_um then do:
            conversion_factor = 1.
         end.
         else do:
            {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                           &HANDLE=ph_gpumxr
                           &PARAM="(input rqd_part,
                                    input pt_um,
                                    input rqd_um,
                                    output conversion_factor)"
                           &NOAPPERROR=True
                           &CATCHERROR=True}
         end.
 
         if conversion_factor = ? then do:
 
            run p_ip_msg (input 33, input 2).
            /* NO UNIT OF MEASURE CONVERSION EXISTS */
         end.
         else do:
            rqd_um_conv = conversion_factor.
         end.
 
      end.
 
      if sngl_ln then do:
         display rqd_um_conv with frame c.
         run display_st_qty.
      end.
    
      if sngl_ln
         and rqf_pc_line
      then do on error undo, retry :
         pause 0.
         if c-application-mode <> "API"
         then do:
            update
               rqd_due_date
            with frame line_popup.
            if rqd_due_date = ?
            then do:
               /* INVALID DATE */
               {us/bbi/pxmsg.i &MSGNUM = 27 &ERRORLEVEL=3 &PAUSEAFTER}
               undo, retry.
            end.
            display rqd_due_date with frame c.
            hide frame line_popup no-pause.
         end. /* IF c-application-mode <> "API" */
      end. /* DO ON ERROR UNDO, RETRY */
 
      /* CALCULATE PRICE NOW THAT WE KNOW QTY */
      /* ALSO CALCULATE NEW PRICE WHEN PART HAS CHANGED */
      if new_rqd
         or (rqd_part     <> prev_item
         or  rqd_req_qty  <> prev_qty
         or  rqd_um       <> prev_um
         or  rqd_vend     <> l_prev_vend
         or  rqd_pr_list  <> l_prev_list
         or  rqd_pr_list2 <> l_prev_list2
         or  rqd_due_date <> l_prev_due_date)
      then do:
 
         /* WHEN THE REQ QTY IS CHANGED FOR A REQ LINE */
         /* HAVING STATUS CLOSED OR CANCELLED          */
         if not new_rqd and
            (rqd_part   <> prev_item             or
            rqd_req_qty <> prev_qty              or
            rqd_um      <> prev_um)              and
            (rqm_status = "c" or rqm_status = "x" or
            rqd_status = "c" or rqd_status = "x")
         then do:
 
            yn = no.
            /* REQ AND/OR REQ LINE CLOSED OR CANCELLED - REOPEN? */
            run p-message-question
               (input 3327,
                input 1,
                input-output yn).
            if not yn then undo,retry.
 
            if yn then do:
               assign
                  rqm_status   = ""
                  rqm_cls_date = ?
                  rqm_open     = true
                  rqd_status   = ""
                  rqd_open     = true
                  prev_status  = rqd_status.
            end. /* IF YN THEN */
         end. /* IF NOT NEW_RQD and (RQD_PART ... */
 
         if not new_rqd and
            rqd_type <> "M" and        /* NOT A MEMO ITEM */
            available pt_mstr and
            (rqd_um <> prev_um or rqd_part <> prev_item)
         then do:
 
            yn = true.
            run p-message-question
               (input 372,
                input 1,
                input-output yn).
 
            /* CONVERT QTY FROM STOCK TO PURCHASE UNITS */
            if yn = true then do:
               {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                              &HANDLE=ph_gpumxr
                              &PARAM="(input rqd_part,
                                       input prev_um,
                                       input rqd_um,
                                       output conversion_factor)"
                              &NOAPPERROR=True
                              &CATCHERROR=True}
 
               if conversion_factor = ? then do:
                  run p_ip_msg (input 33, input 2).
                  /* NO UNIT OF MEASURE CONVERSION EXISTS */
               end.
               else do:
                  rqd_um_conv = conversion_factor.
               end.
 
               rqd_req_qty = rqd_req_qty / rqd_um_conv.
 
               display
                  rqd_req_qty
               with frame b.
 
               if sngl_ln then do:
                  if rqd_um = pt_um then
                     rqd_um_conv = 1.
                  display rqd_um_conv with frame c.
 
                  run display_st_qty.
               end.
            end. /* if yn = true */
         end. /* if not new _rqd */
 
         if not new_rqd and rqd_type <> "M" then do:
            yn = true.
            /* RECALCULATE ITEM PRICE AND COST */
            run p-message-question
               (input 640,
                input 1,
                input-output yn).
         end.
 
         if yn or new_rqd then do:
 
            find pt_mstr
               where pt_mstr.pt_domain = global_domain
                 and pt_part = rqd_part
            no-lock no-error.
 
            if available pt_mstr then do:
 
               /** INITIAL DEFAULT FOR PRICE **/
               assign
                  vendor_part = ""
                  mfgr = ""
                  mfgr_part = ""
                  vendor = rqd_vend.
 
               if rqd_vend = "" then vendor = rqm_vend.
               got_vendor_price = false.
 
               /* GPSCT05.P LOOKS FOR IN_MSTR AND GETS THE COST, IF */
               /* IT IS NOT AVAILABLE, VALUES OF 0.00 ARE RETURNED. */
               /* IF NOT AVAIABLE IN_MSTR IS CREATED LATER IN THIS  */
               /* PROGRAM.                                          */
               /* WITH LINKED SITE COSTING, IF THE SELECTED ITEM AND*/
               /* SITE ARE LINKED TO ANOTHER SITE, I.E. IF A LINKING*/
               /* RULE EXIST FOR SELECTED SITE, THEN IN_MSTR IS     */
               /* CREATED WITH THE LINK. (I.E. IN_GL_COST_SITE =    */
               /* SOURCE SITE AND IN_GL_SET = SOURCE GL COST SET.)  */
               /* THEREFORE FOR LINKED SITES THE UNIT COST RETRIEVED*/
               /* HERE SHOULD BE THE COST AT THE SOURCE SITE.       */
               /* TO AVOID CHANGING THE IN_MSTR CREATION TIMING WE  */
               /* FIND THE SOURCE SITE AND GET THE COST AT THAT SITE*/
 
               gl-site = rqd_site.
 
               for first in_mstr
                  where in_mstr.in_domain = global_domain
                    and in_part = pt_part
                    and in_site = rqd_site
               no-lock: end.
 
               if not available in_mstr then
                  {us/bbi/gprun.i ""gpingl.p""
                           "(input  rqd_site,
                             input  pt_part,
                             output gl-site,
                             output gl-set)"}
 
               /* THIS CALL IS MOVED FROM BELOW SO STD. COST IS    */
               /* FOUND ALL THE TIME AND IS AVAILABLE FOR DISPLAY. */
               /* USE glxcst TO HOLD GL COST   */
               {us/bbi/gprun.i ""gpsct05.p""
                        "(input  rqd_part,
                          input  gl-site,
                          input  2,
                          output glxcst,
                          output cur_cost)"}
 
               base_cost = glxcst * rqd_um_conv.
 
               if vendor > "" then do:
 
                  /* GET FIELD VALS FROM VP_MSTR */
                  run retrieve_vendor_item_data
                     (input  vendor,
                      input  rqd_part,
                      output got_vendor_item_data,
                      output vendor_q_qty,
                      output vendor_q_um,
                      output vendor_q_curr,
                      output vendor_part,
                      output vendor_price,
                      output mfgr,
                      output mfgr_part).
 
                  if got_vendor_item_data and vendor_price <> 0
                  then do:
 
                     if (vendor_q_curr = rqm_curr
                        or vendor_q_curr = "")
                     then do:
                        /* CONVERT PRICE PER UM CONVERSION */
                        if vendor_q_um = rqd_um then do:
                           conversion_factor = 1.
                        end.
                        else do:
                           {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                                          &HANDLE=ph_gpumxr
                                          &PARAM="(input rqd_part,
                                                   input rqd_um,
                                                   input vendor_q_um,
                                                   output conversion_factor)"
                                          &NOAPPERROR=True
                                          &CATCHERROR=True}
                        end.
 
                        if conversion_factor = ? then do:
                           /* NO UM CONVERSION EXISTS FOR SUPPLIER ITEM */
                           run display_message
                              (input 2086,
                               input 2,
                               input vendor_part,
                               input "").
                        end.
 
                        /* ONLY CONVERT TO THE VENDOR ITEM */
                        /* PRICE IF THE UM MATCHES AND THE */
                        /* RQ QTY IS >= THAN THE QUOTE QTY */
                        if vendor_q_um = rqd_um then do:
                           if rqd_req_qty >= vendor_q_qty then do:
                              rqd_pur_cost =
                                 vendor_price / conversion_factor.
 
                              run p_calc_netprice(buffer rqd_det).
 
                              assign
                                 rqd_max_cost =
                                    if rqd_disc_pct < 0 then
                                                   rqd_pur_cost *
                                          (1 - (- (net_price - rqd_pur_cost)
                                                / (rqd_pur_cost / 100))
                                           / 100)
                                    else
                                       rqd_pur_cost
 
                                 got_vendor_price = true.
                           end.
                        end.
                        else do:
                           req_qty = rqd_req_qty / conversion_factor.
 
                           if req_qty >= vendor_q_qty then do:
                              rqd_pur_cost = vendor_price / conversion_factor.
 
                              run p_calc_netprice(buffer rqd_det).
 
                              assign
                                 rqd_max_cost =
                                    if rqd_disc_pct < 0 then
                                       rqd_pur_cost *
                                          (1 - (- (net_price - rqd_pur_cost)
                                                / (rqd_pur_cost
                                                   / 100))
                                           / 100)
                                    else
                                       rqd_pur_cost
 
                                 got_vendor_price = true.
                           end.
                        end. /* else do: */
                     end.  /* if vendor_q_curr = rqm_curr or "" */
                     else do:
                        /* SUPPLIER ITEM NOT FOR SAME CURRENCY */
                        run display_message
                           (input 2109,
                            input 2,
                            input vendor_q_curr,
                            input "").
                     end.
                  end.
               end.
 
               if not got_vendor_price then do:
                  /* DIDN'T FIND A VENDOR PART PRICE, USE STD COST */
                  /* CONVERT FROM BASE TO FOREIGN CURRENCY */
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                            "(input  base_curr,
                              input  rqm_curr,
                              input  rqm_ex_rate2,
                              input  rqm_ex_rate,
                              input  glxcst,
                              input  false, /* DO NOT ROUND */
                              output rqd_pur_cost,
                              output mc-error-number)"}
 
                  run p_calc_netprice(buffer rqd_det).
 
                  rqd_max_cost =
                     if rqd_disc_pct < 0 then
                        rqd_pur_cost *
                           (1 - (- (net_price - rqd_pur_cost)
                                 / (rqd_pur_cost / 100))
                            / 100)
                     else
                        rqd_pur_cost.
 
                  /* CONVERT PRICE PER UM CONVERSION */
                  if pt_um = rqd_um then do:
                     conversion_factor = 1.
                  end.
                  else do:
                     {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                                    &HANDLE=ph_gpumxr
                                    &PARAM="(input rqd_part,
                                             input pt_um,
                                             input rqd_um,
                                             output conversion_factor)"
                                    &NOAPPERROR=True
                                    &CATCHERROR=True}
                  end.
 
                  if conversion_factor = ? then do:
                     /* NO UM CONVERSION EXISTS */
                     run display_message
                        (input 33,
                         input 2,
                         input rqd_um,
                         input "").
                  end.
                  else do:
                     rqd_pur_cost = rqd_pur_cost * conversion_factor.
 
                     run p_calc_netprice(buffer rqd_det).
 
                     rqd_max_cost = if rqd_disc_pct < 0 then
                                       rqd_pur_cost *
                                          (1 - (- (net_price - rqd_pur_cost)
                                                / (rqd_pur_cost / 100))
                                           / 100)
                                    else
                                       rqd_pur_cost.
 
                  end.
               end.
            end.  /* if available pt_mstr */
            else do:
               /*RESET COST FIELDS*/
               assign
                  rqd_pur_cost = 0
                  rqd_max_cost = 0.
 
               if sngl_ln then
                  display
                     rqd_max_cost
               with frame c.
            end.
 
            /* INITIAL DEFAULT FOR DISCOUNT */
           if rqm_vend = rqd_vend
           then
            assign
               l_rqd_disc_pct = rqd_disc_pct
               rqd_disc_pct    = rqm_disc_pct.
           else
               l_rqd_disc_pct = rqd_disc_pct.
           assign
               /* GET PRICE FROM PRICE TABLES IF THERE IS ONE */
               net_price = rqd_pur_cost * (1 - rqd_disc_pct / 100).
 
            if rqf_pc_line
            then
               lineffdate = rqd_due_date.
            else
               lineffdate = rqm_req_date.
 
            if lineffdate = ? then lineffdate = rqm_req_date.
            if lineffdate = ? then lineffdate = today.
 
            if rqd_pr_list2 <> "" then do:
 
               net_price = ?.
               {us/bbi/gprun.i ""gppclst.p""
                        "(input      rqd_pr_list2,
                          input        rqd_part,
                          input        rqd_um,
                          input        rqd_um_conv,
                          input        lineffdate,
                          input        rqm_curr,
                          input        '{&SUPPLIER-CLASSIFICATION}',
                          input        true,
                          input        poc_pt_req,
                          input-output rqd_pur_cost,
                          input-output net_price,
                          output       minprice,
                          output       maxprice,
                          output       pc_recno)"}
 
               if net_price <> ? then
                  net_price = net_price * (1 - rqd_disc_pct / 100).
            end.
 
            if poc_pt_req
               and (rqd_pr_list2 = ""
                    or pc_recno     = 0)
            then do:
 
               /* DISPLAY ERROR IF IT IS INVENTORY ITEM */
               if can-find (pt_mstr where pt_mstr.pt_domain = global_domain
                                      and  pt_part = rqd_part)
               then do:
 
                  /* REQUIRED PRICE TABLE FOR ITEM # IN UM # NOT FOUND */
                  run display_message
                     (input 6231,
                      input 3,
                      input rqd_part,
                      input rqd_um).
 
                  undo, retry.
               end.
 
               /* DISPLAY WARNING IF IT IS MEMO ITEM */
               else do:
 
                  /* REQUIRED PRICE TABLE FOR ITEM # IN UM # NOT FOUND */
                  run display_message
                     (input 6231,
                      input 2,
                      input rqd_part,
                      input rqd_um).
 
               end.
            end. /* IF poc_pt_req ... */
 
            /* GET DISCOUNT FROM DISCOUNT TABLES IF THERE IS ONE */
            if rqd_pr_list <> "" then do:
               {us/bbi/gprun.i ""gppccal.p""
                        "(input      rqd_part,
                          input        rqd_req_qty,
                          input        rqd_um,
                          input        rqd_um_conv,
                          input        rqm_curr,
                          input        '{&SUPPLIER-CLASSIFICATION}',
                          input        rqd_pr_list,
                          input        lineffdate,
                          input        rqd_pur_cost,
                          input        disc_tbl_req,
                          input        rqm_disc_pct,
                          input-output rqd_pur_cost,
                          output       rqd_disc_pct,
                          input-output net_price,
                          output       pc_recno)"}
            end.
 
            if disc_tbl_req
               and (rqd_pr_list = ""
               or pc_recno = 0)
            then do:
 
               /* DISPLAY ERROR IF IT IS INVENTORY ITEM */
               if can-find (pt_mstr where pt_mstr.pt_domain = global_domain
                                      and pt_part = rqd_part)
               then do:
 
                  /* REQUIRED DISCOUNT TABLE FOR ITEM # IN UM # NOT FOUND */
                  run display_message
                     (input 982,
                      input 3,
                      input rqd_part,
                      input rqd_um).
 
                  undo, retry.
               end.
 
               /* DISPLAY WARNING IF IT IS MEMO ITEM */
               else do:
 
                  /* REQUIRED DISCOUNT TABLE FOR ITEM # IN UM # NOT FOUND */
                  run display_message
                     (input 982,
                      input 2,
                      input rqd_part,
                      input rqd_um).
 
               end.
            end. /* IF disc_tbl_req ... */
 
            /*SET UNIT COST TO NET PRICE*/
 
            /*Unit cost is set to net price when there is no       */
            /*standard cost on the item but the req. refers        */
            /*to a price table or discount table.  The disc% is    */
            /*returned as 0.00 since it is based on the unit cost. */
            /*The net price is passed back from the sub-programs   */
            /*and plugged into the unit cost field to show the     */
            /*discounted price.                                    */
 
            if rqd_pur_cost = 0 and net_price <> ? then
               rqd_pur_cost = net_price.
 
            /* DISPLAY PRICE, DISC%, EXT PRICES */
            rqd_max_cost = if rqd_disc_pct < 0 then
                              rqd_pur_cost *
                                 (1 - (- (net_price - rqd_pur_cost)
                                       / (rqd_pur_cost / 100))
                                  / 100)
                           else
                              rqd_pur_cost.
 
            run display_line_frame_b.
 
            if sngl_ln then do:
               run display_ext_cost (output l_netprice_int,
                                     output l_netprice_frac).
               run display_max_ext_cost.
            end.
 
         end.
 
      end.
 
      if (new_rqd or rqd_part <> prev_item or rqd_um <> prev_um)
         and rqm_curr <> base_curr and rqd_pur_cost <> 0
      then do:
         msg-arg = string(base_cost, ">>>>,>>>,>>9.99<<<").
         /* Base currency list price: 19.99 */
         run display_message
            (input 684,
             input 1,
             input msg-arg,
             input "").
      end.
 
      /* GET PRICE, DISCOUNT% FROM USER */
      ststatus = stline[3].
      status input ststatus.
 
      do on error undo, retry:
 
         l_actual_disc = rqd_disc_pct.
 
         if rqd_disc_pct < l_min_disc or
            rqd_disc_pct > l_max_disc
         then do:
            if rqd_disc_pct >  l_max_disc then
               rqd_disc_pct =  l_max_disc.
            if rqd_disc_pct < l_min_disc then
               rqd_disc_pct = l_min_disc.
 
            /* DISCOUNT # CANNOT BE FIT IN THE FORMAT, DISPLAYED */
            /* AS ALL 9'S                                        */
            run display_message
               (input 1651,
                input 2,
                input string(l_actual_disc),
                input "").
         end.
 
         assign
           l_cost_chg     = rqd_pur_cost
           l_rqd_disc_pct = rqd_disc_pct.
 
         set
            rqd_pur_cost
            rqd_disc_pct
         with frame b.
 
         if not rqd_disc_pct entered then
            rqd_disc_pct = l_actual_disc.
 
         net_price = rqd_pur_cost * (1 - rqd_disc_pct / 100).
 
         if rqd_pr_list2 > "" 
         then do:
 
            net_price = rqd_pur_cost * (1 - rqd_disc_pct / 100).
 
            {us/bbi/gprun.i ""gpmnmx.p""
                     "(input        true,
                       input        true,
                       input        minprice,
                       input        maxprice,
                       output       minmaxerr,
                       input-output rqd_pur_cost,
                       input-output net_price,
                       input        rqd_part)"}
            display rqd_pur_cost with frame b.
 
         end. /* IF rqd_pr_list2 > "" */
      end. /* DO ON ERROR UNDO, RETRY */
 
      if     rqd_req_qty   =  prev_qty
         and rqd_part      =  prev_item
         and rqd_um        =  prev_um
         and (l_rqd_cost   <> rqd_pur_cost
            or (l_rqd_disc_pct <> rqd_disc_pct))
         and rqd_status     = ""
         and not new_rqd
      then do:
         l_flag = yes.
         /* UNIT COST HAS CHANGED, UPDATE MAXIMUM UNIT COST (Y/N) */
         run p-message-question
            (input 4389,
             input 1,
             input-output l_flag).
      end. /* IF NOT new_rqd */
 
      if new_rqd
         or (rqd_part     <> prev_item
         or rqd_um        <> prev_um
         or rqd_req_qty   <> prev_qty
         or rqd_pur_cost  <> prev_pur_cost
         or l_flag
         or rqd_disc_pct  <> l_rqd_disc_pct)
      then do:
 
         if l_flag
         then
            rqd__qadc01 = "".
         else
            if net_price <> 0
            then
            rqd__qadc01 = getCharFromDec(net_price).
 
         if    l_cost_chg     <> rqd_pur_cost
            or l_rqd_disc_pct <> rqd_disc_pct
            or l_flag
         then
            run p_calc_netprice(buffer rqd_det).
 
         if l_flag
            or new rqd_det
         then
            rqd_max_cost = if rqd_disc_pct < 0
                           then
                           rqd_pur_cost *
                              (1 - (- (net_price - rqd_pur_cost)
                                    / (rqd_pur_cost / 100))
                               / 100)
                        else
                           rqd_pur_cost.
 
 
      if not new_rqd
         and (rqm_status = "c" or rqm_status = "x"
         or  rqd_status = "c" or rqd_status = "x")
         then do:
            yn = no.
            /* REQ AND/OR REQ LINE CLOSED OR CANCELLED - REOPEN? */
            run p-message-question
               (input 3327,
                input 1,
                input-output yn).
            if not yn then undo,retry.
 
            if yn then do:
               assign
                  rqm_status  = ""
                  rqm_cls_date = ?
                  rqm_open    = true
                  rqd_status  = ""
                  rqd_open    = true
                  prev_status = rqm_status
                  p_line_opened = yes
                  rqm_aprv_stat = APPROVAL_STATUS_UNAPPROVED
                  rqm_rtdto_purch = no .
 
            end. /* IF YN THEN */
         end. /* not new_rqd */
 
      end.
 
      /* PURCHASE COST VALIDATION */
      {us/px/pxrun.i &PROC='validatePurchaseCost' &PROGRAM='popoxr1.p'
                     &PARAM="(input rqd_pur_cost)"
                     &NOAPPERROR=True
                     &CATCHERROR=True}

      if rqd_pur_cost <> 0
         and sngl_ln
      then do:
         /* NET UNIT COST = # */
         {us/bbi/pxmsg.i &MSGNUM=5014 &ERRORLEVEL={&INFORMATION-RESULT}
                         &MSGARG1="net_price, ""->>>,>>>,>>9.99<<<"" "}
      end. /* IF rqd_pur_cost <> 0 ... */

      if sngl_ln then do:
         /* GET REST OF STUFF FROM USER */
 
         run display_line_frame_c.
 
         find pt_mstr where pt_mstr.pt_domain = global_domain
             and pt_part = rqd_part
         no-lock no-error.
 
         if available pt_mstr then do:
            {us/px/pxrun.i &PROC  = 'getFieldDefault'
                     &PROGRAM = 'ppitxr.p'
                     &HANDLE = ph_ppitxr
                     &PARAM = "( input  rqd_part,
                                 input  rqd_site,
                                 input ""pt_lot_ser"",
                                 output l_pt_lot_ser)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
         end.
 
         serial_controlled = available pt_mstr and l_pt_lot_ser = "s".
 
         do on error undo, retry:

/*c1209*/   cprevdomain = global_domain.
/*c1209*/   find first b1dom no-lock 
/*c1209*/   where b1dom.dom_domain = global_domain
/*c1209*/   no-error.
/*c1209*/   if available b1dom and
/*c1209*/   b1dom.dom_user1 <> ? and
/*c1209*/   b1dom.dom_user1 <> "" and
/*c1209*/   can-find(first b2dom where b2dom.dom_domain = b1dom.dom_user1)
/*c1209*/   then global_domain = b1dom.dom_user1.
/*c1209*/   find first si_mstr no-lock
/*c1209*/   where si_site = rqd_site
/*c1209*/   and   si_domain <> si_db
/*c1209*/   no-error.
/*c1209*/   if available si_mstr
/*c1209*/   then do:
/*c1209*/     if available si_mstr
/*c1209*/     then do:
/*c1209*/        find first en_mstr no-lock
/*c1209*/        where en_entity = si_entity
/*c1209*/        no-error.
/*c1209*/        if available en_mstr 
/*c1209*/        then do:
/*c1209*/           global_domain = en_domain.
/*c1209*/        end.
/*c1209*/     end.
/*c1209*/   end.



            /* Add the site filter to ac_mstr browse */
            {us/gp/gpbrparm.i &browse=gplu323.p &parm=c-brparm2 &val="rqd_site"} 
            set
               rqd_due_date
               rqd_need_date
               rqd_type
               rqd_category    when (not rqm_direct)
               rqd_acct
/*c1199*/      rqd__chr01
/*c1199*/      rqd_cc 
               rqd_project
               rqd_vpart
               desc1 when (not can-find(pt_mstr
                                   where pt_mstr.pt_domain = global_domain and
                                   (  pt_part = rqd_part)))
               rqd_lot_rcpt   when (not serial_controlled)
               rqd_rev
               rqd_item_rev_date
               rqd_um_conv    when (new_rqd or rqd_part <> prev_item)
               rqd_max_cost
               rqd_status
               line_cmmts
            with frame c.
 
/*c1211*/   if rqd_line = 1 then rqm_cc = rqd_cc.
/*c1209*/   global_domain = cprevdomain.

            /* CHECK DUE DATE */
            if rqd_due_date = ? then do:
               run p_ip_msg (input 27, input 3).
               /* INVALID DATE */
               next-prompt rqd_due_date with frame c.
               undo, retry.
            end.
 
            /* CHECK NEED DATE */
            if rqd_need_date = ? then do:
               run p_ip_msg (input 27, input 3).
               /* INVALID DATE */
               next-prompt rqd_need_date with frame c.
               undo, retry.
            end.
 
            /* CHECK TYPE */
 
            /* GENERALIZED CODE VALIDATION OF RQD_TYPE */
            {us/px/pxrun.i &PROC  = 'validateGeneralizedCodes' &PROGRAM = 'gpcodxr.p'
                           &HANDLE=ph_gpcodxr
                           &PARAM="(input 'rqd_type',
                                   input '',
                                   input rqd_type,
                                   input '')"
                           &NOAPPERROR=True
                           &CATCHERROR=True}
            if return-value <> {&SUCCESS-RESULT} then do:
               next-prompt rqd_type with frame c.
               undo, retry.
            end. 

            {us/px/pxgetph.i ppitxr}
            if not ({us/px/pxfunct.i &FUNCTION = 'IsValidItem' 
                                     &PROGRAM = 'ppitxr.p'
                                     &HANDLE = ph_ppitxr
                                     &PARAM = "(rqd_part)"})
               and rqd_type <> "M"
            then do:
               run p_ip_msg (input 715, input 3).
               /* ITEM DOES NOT EXIST AT THIS SITE */
               next-prompt rqd_type with frame c.
               undo, retry.
            end.
 
            /* CHECK CATEGORY */
            if rqd_category > "" then do:
               find rqc_mstr where rqc_mstr.rqc_domain = global_domain and
                  rqc_category = rqd_category
               no-lock no-error.
               if not available rqc_mstr then do:
                  run p_ip_msg (input 2064, input 3).
                  /* INVALID CATEGORY */
                  next-prompt rqd_category with frame c.
                  undo, retry.
               end.
            end.
 
            /* CHECK MAX COST */
            if rqd_max_cost < rqd_pur_cost then do:
               run p_ip_msg (input 2062, input 3).
               /* MAX COST MAY NOT BE LESS THAN PURCHASE COST */
               next-prompt rqd_max_cost with frame c.
               undo, retry.
            end.
 
            /* CHECK STATUS */
            if rqd_status <> ""  and
               rqd_status <> "c" and
               rqd_status <> "x"
            then do:
               run p_ip_msg (input 19, input 3).
               /* INVALID STATUS */
               next-prompt rqd_status with frame c.
               undo, retry.
            end.
 
            if prev_status = "" and rqd_status = "x" then do:
 
               /* IF THERE IS A PO REFERENCING, DON'T ALLOW CANCEL */
               find first rqpo_ref where rqpo_ref.rqpo_domain = global_domain
                  and rqpo_req_nbr = rqd_nbr
                  and rqpo_req_line = rqd_line
               no-lock no-error.
 
               if available rqpo_ref then do:
                  run p_ip_msg (input 2053, input 3).
                  /* ORDER HAS BEEN PLACED */
                  next-prompt rqd_status with frame c.
                  undo, retry.
               end.
            end.
 
            if prev_status = "x" and rqd_status = "" then do:
               yn = false.
               /* REQ OR REQ LINE CANCELLED - REOPEN? */
               run p-message-question
                  (input 2183,
                   input 1,
                   input-output yn).
               if not yn then do:
                  next-prompt rqd_status with frame c.
                  undo, retry.
               end.
 
               find rqm_mstr where recid(rqm_mstr) = p_rqm_recid
               exclusive-lock.
               assign
               rqm_status   = ""
               rqm_cls_date = ?.
            end.
 
            /* USER CLOSING THE STATUS MANUALLY */
            if prev_status = "" 
               and rqd_status  = "c"
               and not can-find(first b_rqd_det
                                   where b_rqd_det.rqd_domain = global_domain
                                   and   b_rqd_det.rqd_nbr    = rqd_det.rqd_nbr
                                   and   b_rqd_det.rqd_line  <> rqd_det.rqd_line
                                   and   b_rqd_det.rqd_status = "")
            then do:
               run p_close_req (input recid(rqm_mstr)).
            end.
 
            /* USER OPENING THE STATUS MANUALLY */
            if prev_status = "c"
               and rqd_status  = ""
            then do:
               yn = no.
               /* REQ AND/OR REQ LINE CLOSED OR CANCELLED - REOPEN? */
               run p-message-question
                  (input 3327,
                   input 1,
                   input-output yn).
 
               if not yn then do:
                  next-prompt rqd_status with frame c.
                  undo, retry.
               end.
               else do:
                  run p_open_req (input recid(rqm_mstr)).
               end. /* ELSE DO */
 
            end.   /* IF PREV_STATUS = "C" ... */
 
            if rqd_type = "s" then
                run displayWorkOrder (buffer rqd_det).
 
            /* CHECK PROJECT */
            do with frame c:
               if not ({gpglproj.v rqd_project}) then do:
                  run p_ip_msg (input 3128, input 3).
                  /* INVALID PROJECT */
                  next-prompt rqd_project with frame c.
                  undo, retry.
               end.
            end.

/*d3032>>*/
         find first SharedSet where SharedSet.SharedSetTypeCode = "GL"
	 no-lock no-error.
         find first Domains where Domains.DomainCode = global_domain
	 no-lock no-error.
	 find first DomainSharedSet 
	     where DomainSharedSet.Domain_ID = Domains.Domain_ID
	     no-lock no-error.
         if available DomainSharedSet then do:


/*d3032a >>> */
            if can-find(first GL
	                where GL.SharedSet_ID = SharedSet.SharedSet_ID
			and   GL.GLCode = rqd_acct
			and   GL.GLAnalysisLimitation = "BOTHREQUIRED"
			and   rqd_cc = ""
			and   rqd_project = "")
            or can-find(first GL
	                where GL.SharedSet_ID = SharedSet.SharedSet_ID
			and   GL.GLCode = rqd_acct
			and   GL.GLIsCostCentreAccount
			and   rqd_cc = "")
            then do:
               /* COST CENTER OR PROJECT OR BOTH ARE REQUIRED */
               run p_ip_msg (input 1729, input 3).
               next-prompt rqd_project with frame c.
               undo, retry.
            end.

/*d3032a <<< */
/*d3032a*>>>>
            find first GL 
	         where GL.SharedSet_ID = SharedSet.SharedSet_ID and 
	                        GL.GLcode = rqd_acct
/*d3032a*				and GL.GLIsProjectAccount  */
/*d3032a*/			and GL.GLAnalysisLimitation = "BOTHREQUIRED"
/*d3032a*/			and rqd_cc = ""
				and rqd_project = ""
				no-lock no-error.
            if available GL
            then do:
               /* COST CENTER OR PROJECT OR BOTH ARE REQUIRED */
               run p_ip_msg (input 1729, input 3).
               next-prompt rqd_project with frame c.
               undo, retry.
	    end.
*d3032a* <<< */
	 end.
        
/*d3032<<*/

/*q9006*/   prevdomain = global_domain.
/*q9006*/   preventity = current_entity.
/*q9006*/   find first b1dom no-lock 
/*q9006*/   where b1dom.dom_domain = global_domain
/*q9006*/   no-error.
/*q9006*/   if available b1dom and
/*q9006*/   b1dom.dom_user1 <> ? and
/*q9006*/   b1dom.dom_user1 <> "" and
/*q9006*/   can-find(first b2dom where b2dom.dom_domain = b1dom.dom_user1)
/*q9006*/   then global_domain = b1dom.dom_user1.
/*q9006*/   find first si_mstr no-lock
/*q9006*/   where si_site = rqd_site
/*q9006*/   and   si_domain <> si_db
/*q9006*/   no-error.
/*q9006*/   if available si_mstr
/*q9006*/   then do:
/*q9006*/     if available si_mstr
/*q9006*/     then do:
/*q9006*/        find first en_mstr no-lock
/*q9006*/        where en_entity = si_entity
/*q9006*/        no-error.
/*q9006*/        if available en_mstr 
/*q9006*/        then do:
/*q9006*/           global_domain = en_domain.
/*q9006*/           current_entity = en_entity.
/*q9006*/        end.
/*q9006*/     end.
/*q9006*/   end.




            assign siteEntity = "".
            for first si_mstr where si_domain = global_domain
                                   and si_site = rqd_site no-lock:
               assign siteEntity = si_entity.
            end.

/*cy1011* start deleted code >>>>>>>>
            /* CHECK GL ACCOUNT/COST CENTER */
            {us/px/pxrun.i &PROC='validateFullAccount' 
                           &PROGRAM='glacxr.p'
                           &PARAM="(input  rqd_acct,
                                    input  rqm_sub,
                                    input  rqm_cc,
                                    input  rqd_project,
                                    input ""rqd_acct"",
                                    input siteEntity)"
                           &NOAPPERROR=true
                           &CATCHERROR=true}

            if return-value <> {&SUCCESS-RESULT}
            then do:
               next-prompt rqd_acct with frame c no-validate.
               undo , retry .
            end. /* IF RETURN-VALUE <> {&SUCCESS-RESULT} */
*cy1011* end deleted code <<<<<<<< */
/*c9999* start added code >>>>>> */
            /* VALIDATION FOR MEMO ITEM */
            if rqd_type <> " "
            then do:
            /* CHECK GL ACCOUNT/COST CENTER */
/*d2101* start added code >>>>   */
               {us/px/pxrun.i &PROC='validateFullAccount' &PROGRAM='glacxr.p'
                              &PARAM="(input  rqd_acct,
                                       input  rqd__chr01,
                                       input  rqd_cc,
                                       input  rqd_project,
                                       input ""rqd_acct"",
                                       input siteEntity)"
				      
                              &NOAPPERROR=true
                              &CATCHERROR=true}
/*d2101* end   added code <<<<<  */
/*q9006*/   global_domain = prevdomain.
/*q9006*/   current_entity = preventity.

               if return-value <> {&SUCCESS-RESULT}
               then do:
                  next-prompt rqd_acct with frame c no-validate.
                  undo , retry .
               end.
            end.
/*c9999* end added code <<<<<< */


            if rqd_type = " "
            then do:
               /* VALIDATE PROJECT CODE */
               {us/px/pxrun.i &PROC='validateProjectCode' 
                              &PROGRAM='glacxr.p'
                              &PARAM="(input rqd_project)"
                              &NOAPPERROR=true
                              &CATCHERROR=true}
 
            end. /* IF rqd_type = " " */
 
            /*CHECK IF CATEGORY IS FOR ACCT*/
            if rqd_category > "" then do:
 
               find last rqcd_det
                   where rqcd_det.rqcd_domain = global_domain
                  and rqcd_category = rqd_category
                  and rqcd_acct_from <= rqd_acct
                  and rqcd_acct_to >= rqd_acct
/*c1199*/         and rqcd_sub_from <= rqd__chr01
/*c1199*/         and rqcd_sub_to >= rqd__chr01
/*c1199*                  and rqcd_sub_from <= rqm_sub */
/*c1199*                  and rqcd_sub_to >= rqm_sub */
               no-lock no-error.
 
               if not available rqcd_det
               then do:
                  for last rqcd_det
                     where rqcd_det.rqcd_domain = global_domain
                     and rqcd_category          = rqd_category
                     and rqcd_acct_from        <= rqd_acct
                     and rqcd_acct_to          >= rqd_acct
                     and rqcd_sub_from          = ""
                     and rqcd_sub_to            = ""
                  no-lock:
                  end. /*FOR LAST rqcd_det*/
 
                  if not available rqcd_det
                  then do:
                     run p_ip_msg (input 1552, input 2).
                     /*ACCOUNT NOT DEFINED FOR CATEGORY*/
                  end. /* IF NOT AVAILABLE rqcd_det */
               end. /* IF NOT AVAILABLE rqcd_det */
            end. /* IF rqd_category > "" */
 
            do i = 1 to num-entries(messages):
               msgnbr = integer(entry(i,messages)).
               msglevels = entry(i,msglevels).
               run p_ip_msg (input msgnbr,
                             integer(msglevels)).
               if integer(msglevels) >=3
               then
                  undo, retry.
               if     line_cmmts
                  and not batchrun
               then
                  pause.
            end. /* DO i = 1 TO ..... */
 
 /*cy1011* start deleted code >>>>>>>>
            /*DEFAULT CATEGORY*/
            if rqd_category = "" then
            run get_default_category
               (input rqm_direct,
                input rqd_acct,
                input rqm_sub,
                output rqd_category).
 *cy1011* end deleted code <<<<<<<< */

/*c1199*  start added code */
            if rqd_category = "" then
            run get_default_category
               (input rqm_direct,
                input rqd_acct,
                input rqd__chr01,
                output rqd_category).
/*c1199*  end added code */
 
            display
               rqd_category
               rqd_acct
            with frame c.
         end.
 
         display rqd_um_conv with frame c.
 
         run display_st_qty.
         run display_ext_cost (output l_netprice_int,
                               output l_netprice_frac).
         run display_max_ext_cost.
 
         rqd_desc = desc1.
      end.
 
      if not sngl_ln and rqd_type = "s" then
         run displayWorkOrder (buffer rqd_det).
 
      if rqd_due_date = ? then rqd_due_date = today.
      if rqd_need_date = ? then rqd_need_date = rqd_due_date.
 
      if sngl_ln then do:
         display
            rqd_due_date
            rqd_need_date
         with frame c.
      end.
 
      assign
         global_type = ""
         global_lang = rqm_lang.
 
      if line_cmmts then do:
         hide frame c no-pause.
         hide frame b no-pause.
         hide frame a no-pause.
 
         global_ref = rqd_part.
 
         if rqd_cmtindx = -1 then
            cmtindx = 0.
         else
            cmtindx = rqd_cmtindx.
 
         {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""pod_det"")"}
 
         rqd_cmtindx = cmtindx.
         view frame a.
         view frame b.
         if sngl_ln then view frame c.
      end.
 
      if rqd_cmtindx = -1 then rqd_cmtindx = 0.
 
      if not sngl_ln then down 1 with frame b.
      line = line + 1.
 
      /* UPDATE MRP */
      {us/bbi/gprun.i ""rqmrw.p""
               "(input rqd_nbr,
                 input rqd_line)"}
 
      /* CALCULATE NEW EXT COSTS */
      assign
         ext_cost     = if rqd_pur_cost <> 0
                        then
                           rqd_req_qty * (l_netprice_int + l_netprice_frac / 100000)
                        else
                           0.
 
         max_ext_cost = rqd_req_qty * rqd_max_cost.
 
      /* ONLY ASSIGN TO 0 FOR CANCELED */
      if rqd_status = "x"
      then do:
         assign
            ext_cost = 0
            max_ext_cost = 0.
      end. /*IF rqd_status = "x"*/

      l_count = no.
      {us/bbi/gprun.i ""rqbal.p"" "(input recid(rqm_mstr))"} /*BUILD APPROVER LIST*/
      if can-find (first ttdal)
         or can-find (first ttval)
         or can-find (first ttjal)
         or can-find (first tthal)
      then
         l_count = yes.

      if l_count 
         or new_rqd
      then do:
         /* SET LINE STATUS */
         /* IF UNAPPROVED, THEN SET TO OPEN ALSO */
         assign
            rqd_aprv_stat = APPROVAL_STATUS_UNAPPROVED.
 
         if prev_status = "c"
         then
            rqd_status = "".
 
         /* IF SETTING LINE TO UNAPPROVED, HEADER SHOULD BE UNAPPROVED */
         find rqm_mstr
            where rqm_domain = global_domain
            and rqm_nbr = rqd_nbr
         exclusive-lock no-error.
 
         /* IF UNAPPROVING HEADER, THEN HEADER STATUS SHOULD BE CLEAR */
         if available rqm_mstr
         then
            assign
               rqm_aprv_stat = APPROVAL_STATUS_UNAPPROVED
               rqm_status    = "".
 
         /*CHECK IF CHANGING QTY OR COST THEN DELETE APPROVALS */
         if    (prev_qty      <> rqd_req_qty
             or prev_pur_cost <> rqd_pur_cost)
         then do:
            for each rqda_det
               where rqda_domain = global_domain
               and   rqda_nbr    = rqd_nbr
            exclusive-lock:
               delete rqda_det.
            end. /* FOR EACH rqda_det*/
         end. /*IF prev_qty      <> rqd_req_qty*/
      end. /* IF l_count or new_rqd */
      /* UPDATE REQUISITION TOTALS */
      find rqm_mstr where recid(rqm_mstr) = p_rqm_recid exclusive-lock.
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output ext_cost,
                 input rndmthd)"}
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output prev_ext_cost,
                 input rndmthd)"}
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output max_ext_cost,
                 input rndmthd)"}
 
      {us/bbi/gprun.i ""gpcurrnd.p""
               "(input-output prev_max_ext_cost,
                 input rndmthd)"}
      if
              (l_rqd_cost     <> rqd_pur_cost
           or (l_rqd_disc_pct <> rqd_disc_pct))
         and rqd_status       = ""
         and rqm_total        = ?
         and rqm_max_total    = ?
         and not new_rqd
      then
         assign
            rqm_total         = 0
            rqm_max_total     = 0
            prev_ext_cost     = 0
            prev_max_ext_cost = 0.
 
      assign
         rqm_total = rqm_total + ext_cost - prev_ext_cost
         rqm_max_total = rqm_max_total + max_ext_cost - prev_max_ext_cost.
 
      /* WRITE HISTORY RECORD */
      if new_rqd then
         action_entry = ACTION_CREATE_REQ_LINE.
      else
         action_entry = ACTION_MODIFY_REQ_LINE.
 
      {us/bbi/gprun.i ""rqwrthst.p""
               "(input rqm_nbr,
                 input rqd_line,
                 input action_entry,
                 input userid_modifying,
                 input '',
                 input '')"}
 
      /* VALUE STORED IN rqd__qadc01 WILL BE USED TO SET net_price */
      /* WHEN THE USER ACCESSES AN EXISTING REQUISITION LINE.      */
      rqd__qadc01 = getCharFromDec(net_price).
 
      release rqd_det.
 
   end. /*LINELOOP: repeat transaction*/
 
   if sngl_ln then hide frame c no-pause.
   hide frame b no-pause.

/*c1185*/ leave mainloop.
 
   do on endkey undo, leave mainloop:
      update sngl_ln with frame a.
   end.
 
end. /*MAINLOOP*/
 
hide frame a no-pause.
 
delete procedure hBlockedTransactionlibrary.
 
/******************************************************/
/******************************************************/
/**                 PROCEDURES                       **/
/******************************************************/
/******************************************************/
 
PROCEDURE initialize_frame_b:
 
   find rqm_mstr where recid(rqm_mstr) = rqm_recid no-lock.
 
   display
      line
      rqm_site @ rqd_site
      "" @ rqd_part
      rqm_vend @ rqd_vend
      0 @ rqd_req_qty
      "" @ rqd_um
      0 @ rqd_pur_cost
      rqm_disc_pct @ rqd_disc_pct
   with frame b.
 
END PROCEDURE.
 
PROCEDURE initialize_frame_c:
 
   find rqm_mstr where recid(rqm_mstr) = rqm_recid no-lock.
 
   display
      "" @ rqd_due_date
      "" @ rqd_need_date
      "" @ rqd_type
      "" @ rqd_category
      "" @ rqd_acct
      "" @ rqd_project
      "" @ rqd_vpart
      "" @ mfgr
      "" @ mfgr_part
      "" @ desc1
      "" @ desc2
      "" @ rqd_lot_rcpt
      "" @ rqd_rev
      "" @ rqd_item_rev_date
/*c1199*/     "" @ rqd__chr01
/*c1199*/     "" @ rqd_cc
/*c1199*      "" @ rqm_sub*/
/*c1199*      "" @ rqm_cc */
      "" @ rqd_um_conv
      0 @ st_qty
      0 @ tot_qty_ord
      0 @ rqd_max_cost
      0 @ ext_cost
      0 @ max_ext_cost
      "" @ rqd_status
      "" @ rqd_aprv_stat
      "" @ line_cmmts
   with frame c.
 
END PROCEDURE.
 
PROCEDURE display_line_frame_b:
 
   find rqd_det where recid(rqd_det) = rqd_recid exclusive-lock.
 
   if rqd_disc_pct >  l_max_disc then
      l_display_disc =  l_max_disc.
   else
   if rqd_disc_pct < l_min_disc then
      l_display_disc = l_min_disc.
   else
      l_display_disc = rqd_disc_pct.
 
   assign
      prev_vend = rqd_vend
      line = rqd_line.
 
   display
      line
      rqd_site
      rqd_part
      rqd_vend
      rqd_req_qty
      rqd_um
      rqd_pur_cost
      l_display_disc @ rqd_disc_pct
   with frame b.
 
END PROCEDURE.
 
PROCEDURE display_line_frame_c:
 
   find rqd_det where recid(rqd_det) = rqd_recid no-lock.
   find rqm_mstr where recid(rqm_mstr) = rqm_recid no-lock.
 
   assign
      line_cmmts = rqd_cmtindx <> 0
      desc1 = not_in_inventory_msg
      desc2 = "".
 
   find pt_mstr where pt_mstr.pt_domain = global_domain
      and pt_part = rqd_part
   no-lock no-error.
 
   if available pt_mstr then do:
      assign
         desc1 = pt_desc1
         desc2 = pt_desc2.
   end.
   else
   if rqd_desc <> "" then do:
      assign
         desc1 = rqd_desc
         desc2 = "".
   end.
 
   assign
      global_part = rqd_part
      global_addr = rqd_vend.
 
   /* CALCULATE QTY ALREADY ORDERED ON PO'S */
   tot_qty_ord = 0.
 
   for each rqpo_ref where rqpo_ref.rqpo_domain = global_domain
      and rqpo_req_nbr = rqd_nbr
      and rqpo_req_line = rqd_line
   no-lock:
      tot_qty_ord = tot_qty_ord + rqpo_qty_ord.
   end.
 
   /* GET MFGR, MFGR PART FROM VP_MSTR */
   assign
      mfgr      = ""
      mfgr_part = ""
      vendor    = if rqd_vend = "" then rqm_vend else rqd_vend.
 
   if rqd_vpart <> "" then do:
      find first vp_mstr where vp_mstr.vp_domain = global_domain
          and vp_part      = rqd_part
          and vp_vend_part = rqd_vpart
          and vp_vend      = vendor
      no-lock no-error.
 
      if available vp_mstr then do:
         mfgr = vp_mfgr.
         mfgr_part = vp_mfgr_part.
      end.
   end.
 
   /* GET TEXT OF APPROVAL STATUS */
   {us/gp/gplngn2a.i
      &file=""rqm_mstr""
      &field=""rqm_aprv_stat""
      &code=rqd_aprv_stat
      &mnemonic=approval_stat_entry
      &label=approval_stat_desc}
 
   display
      rqd_due_date
      rqd_need_date
      rqd_type
      rqd_category
      rqd_acct
/*c1199*/     rqd__chr01
/*c1199*/     rqd_cc
/*c1199*      rqm_sub*/
/*c1199*      rqm_cc*/
      rqd_project
      rqd_vpart
      mfgr
      mfgr_part
      desc1
      desc2
      rqd_lot_rcpt
      rqd_rev
      rqd_item_rev_date
      rqd_um_conv
      tot_qty_ord
      rqd_max_cost
      rqd_status
      line_cmmts
      approval_stat_desc @ rqd_aprv_stat
   with frame c.
 
   /* RECALCULATE THE NET PRICE FOR THE NEXT LINE */
   run p_calc_netprice(buffer rqd_det).
   run display_st_qty.
   run display_ext_cost (output l_netprice_int,
                         output l_netprice_frac).
   run display_max_ext_cost.
 
END PROCEDURE.
 
PROCEDURE get_site:
 
   find rqd_det where recid(rqd_det) = rqd_recid exclusive-lock.
   find rqm_mstr where recid(rqm_mstr) = rqm_recid no-lock.
 
   continue = false.
 
   do on error undo, retry:
 
      set
         rqd_site
      with frame b
      editing:
         {us/mf/mfnp.i si_mstr rqd_site  " si_mstr.si_domain = global_domain and
         si_site "  rqd_site si_site si_site}
         if recno <> ? then do:
            display si_site @ rqd_site with frame b.
         end.
      end.
/*q9006*/ find first b1dom no-lock
/*q9006*/ where b1dom.dom_domain = global_domain
/*q9006*/ no-error.
/*q9006*/ if available b1dom
/*q9006*/ and can-find(first b2dom where b2dom.dom_domain = b1dom.dom_user1)
/*q9006*/ then do:
/*q9006*/    find si_mstr where si_mstr.si_domain = b1dom.dom_user1
/*q9006*/    and si_site = rqd_site
/*q9006*/    no-lock no-error.
/*q9006*/ end.
/*q9006*/ else do:
 
      find si_mstr where si_mstr.si_domain = global_domain
         and si_site = rqd_site
      no-lock no-error.
/*q9006*/ end.
 
      if not available si_mstr then do:
         run p_ip_msg (input 708, input 3).
         /* SITE DOES NOT EXIST */
         next-prompt rqd_site with frame b.
         undo, retry.
      end.
 
 /*cy1011* start deleted code >>>>>>>>
      if si_db <> global_db then do:
         /* SITE IS NOT ASSIGNED TO THIS DOMAIN */
         run p_ip_msg (input 6251, input 3).
         next-prompt rqd_site with frame b.
         undo, retry.
      end.
 *cy1011* end deleted code <<<<<<<< */
 
      /* VALIDATE USER ACCESS RIGHTS TO THIS SITE  */
      {us/bbi/gprun.i ""gpsiver.p""
               "(input  rqd_site,
                 input  ?,
                 output return_int)"}
 
      if return_int = 0 then do:
         /* USER DOES NOT HAVE ACCESS TO THIS SITE */
         run p_ip_msg (input 725, input 3).
         next-prompt rqd_site with frame b.
         undo, retry.
      end. /* IF return_int = 0 */
 
 /*cy1011* start deleted code >>>>>>>>
      /* CHANGED MESSAGE FROM ERROR TO WARNING SO THAT        */
      /* MULTI-ENTITY IS ALLOWED WHILE REQUISITION GENERATION */
      if si_entity <> rqm_entity then do:
         run p_ip_msg (input 2107, input 2).
         /* SITE ENTITY DOES NOT MATCH REQUISITION ENTITY */
      end.
 *cy1011* end deleted code <<<<<<<< */
      if not new_rqd and rqd_site <> prev_site then do:
         find first rqpo_ref where rqpo_ref.rqpo_domain = global_domain
            and rqpo_req_nbr = rqd_nbr
            and rqpo_req_line = rqd_line
         no-lock no-error.
 
         if available rqpo_ref then do:
            run p_ip_msg (input 2114, input 3).
            /* REQUISITION LINE REFERENCED BY PO, CHANGE NOT ALLOWED */
            next-prompt rqd_site with frame b.
            undo, retry.
         end.
      end.
 
      continue = true.
   end.
 
END PROCEDURE.
 
PROCEDURE get_item:
   define variable ptstatus as character.
 
   find rqd_det where recid(rqd_det) = rqd_recid exclusive-lock.
   find rqm_mstr where recid(rqm_mstr) = rqm_recid no-lock.
 
   continue = false.
 
   do on error undo, retry:
 
      set
         rqd_part with frame b
      editing:
 
         {us/mf/mfnp.i pt_mstr rqd_part  " pt_mstr.pt_domain = global_domain and
         pt_part "  rqd_part pt_part pt_part}
 
         if recno <> ? then do:
            display_um = rqd_um.
            if display_um = ""  then
               display_um = pt_um.
 
            /* FIND UNIT COST FOR EACH NEXT/PREVIOUS */
            run get_pur_cost
               (input pt_part,
                input rqd_vend,
                input rqd_site,
                input rqm_curr,
                input rqd_req_qty,
                input display_um,
                input rqm_ex_rate,
                input rqm_ex_rate2,
                output rqd_pur_cost,
                output base_cost).
 
            display
               pt_part @ rqd_part
               display_um @ rqd_um
               rqd_pur_cost
            with frame b.
 
            if sngl_ln then do:
               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &HANDLE = ph_ppitxr
                        &PARAM = "(input  pt_part,
                                   input  rqd_site,
                                   input ""pt_memo_type"",
                                   output l_pt_memo_type)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
 
               display
                  1 @ rqd_um_conv
                  pt_desc1 @ desc1
                  pt_desc2 @ desc2
                  l_pt_memo_type @ rqd_type
               with frame c.
            end.
         end.
      end.
 
      if rqd_part = "" then do:
         run p_ip_msg (input 40, input 3).
         /* BLANK NOT ALLOWED */
         next-prompt rqd_part with frame b.
         undo, retry.
      end.
 
      find pt_mstr 
      where pt_mstr.pt_domain = global_domain
      and pt_part = rqd_part
/*c1446*/ and (pt_memo_type = ? or
/*c1446*/      pt_memo_type = "")
      no-lock no-error.

/*q9006* start added code */
      if available pt_mstr
      then do:
         vmessage = "Only Memo Items allowed in this function".
         {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
         /* BLANK NOT ALLOWED */
         next-prompt rqd_part with frame b.
         undo, retry.
      end.
/*q9006* end added code */
 
      if not available pt_mstr then do:
         run p_ip_msg (input 16, input 2).
         /* ITEM NUMBER DOES NOT EXIST */
      end.
 
      if available pt_mstr then do:
         /* SET STOCKING UM TO THE PART UM IF VALID PART */
         assign
            st_um = pt_um
            ptstatus = pt_status
            substring(ptstatus,9,1) = "#".
 
         if can-find(isd_det where isd_det.isd_domain = global_domain
                               and isd_status = ptstatus
                               and isd_tr_type = "ADD-PO")
         then do:
            /* RESTRICTED PROCEDURE FOR ITEM STATUS CODE */
            run display_message
               (input 358,
                input 3,
                input pt_status,
                input "").
            undo, retry.
         end.
 
      end.
 
      if not new_rqd and rqd_part <> prev_item then do:
 
         find first rqpo_ref where rqpo_ref.rqpo_domain = global_domain
            and rqpo_req_nbr = rqd_nbr
            and rqpo_req_line = rqd_line
         no-lock no-error.
 
         if available rqpo_ref then do:
            run p_ip_msg (input 2114, input 3).
            /* REQUISITION LINE REFERENCED BY PO, CHANGE NOT ALLOWED */
            next-prompt rqd_part with frame b.
            undo, retry.
         end.
      end.
 
      if available (pt_mstr) and rqd_pur_cost = 0 then do:
 
         display_um = rqd_um.
 
         if display_um = ""  then
            display_um = pt_um.
 
         /* FIND UNIT COST FOR THE PART */
         run get_pur_cost
            (input rqd_part,
             input rqd_vend,
             input rqd_site,
             input rqm_curr,
             input rqd_req_qty,
             input display_um,
             input rqm_ex_rate,
             input rqm_ex_rate2,
             output rqd_pur_cost,
             output base_cost).
 
         display
            display_um @ rqd_um
            rqd_pur_cost
         with frame b.
 
      end.  /* END - if rqd_pur_cost = 0 */
 
      continue = true.
 
   end.
 
END PROCEDURE.
 
PROCEDURE get_supplier:
   find rqd_det where recid(rqd_det) = rqd_recid exclusive-lock.
   find rqm_mstr where recid(rqm_mstr) = rqm_recid no-lock.
 
   continue = false.
 
   do on error undo, retry:
 
      set rqd_vend with frame b
      editing:
         {us/mf/mfnp.i vd_mstr rqd_vend  " vd_mstr.vd_domain = global_domain and
         vd_addr "  rqd_vend vd_addr vd_addr}
 
         if recno <> ? then do:
            display vd_addr @ rqd_vend with frame b.
 
            if sngl_ln then do:
               run display_supplier(input vd_addr).
 
               display
                  vd_pr_list2 @ rqd_pr_list2
                  vd_pr_list @ rqd_pr_list
               with frame vend.
            end.
         end.
      end.
 
      if rqd_vend > "" then do:
         find vd_mstr
            where vd_mstr.vd_domain = global_domain
              and vd_addr = rqd_vend
         no-lock no-error.
 
         if not available vd_mstr then do:
            run p_ip_msg (input 2, input 3).
            /* NOT A VALID SUPPLIER */
            next-prompt rqd_vend with frame b.
            undo, retry.
         end.
      end.
 
      if blockedSupplier(input rqd_vend,
                         input {&PO001},
                         input true,
                         input "Supplier")
      then do:
         undo, retry.
      end.
 
      if sngl_ln then do:
         run display_supplier(input rqd_vend).
      end.
 
      continue = true.
 
   end.
 
END PROCEDURE.
 
PROCEDURE display_supplier:
   define input parameter p_vend like rqd_vend no-undo.
 
   pause 0 .
   find ad_mstr where ad_mstr.ad_domain = global_domain
      and ad_addr = p_vend
   no-lock no-error.
 
   vend_row = frame-row(c) + 1.
 
   if available ad_mstr then do:
 
      find first ctry_mstr where ctry_ctry_code = ad_ctry
      no-lock no-error.
 
      display
         ad_name
         ad_line1
         ad_line2
         ad_city
         ad_state
         ad_zip
         ctry_country  when (available ctry_mstr)
      with frame vend.
   end.
   else do:
      display
         "" @ ad_name
         "" @ ad_line1
         "" @ ad_line2
         "" @ ad_city
         "" @ ad_state
         "" @ ad_zip
         "" @ ctry_country
      with frame vend.
   end.
 
   pause before-hide.
 
END PROCEDURE.
 
PROCEDURE retrieve_vendor_item_data:
   define input  parameter p_vendor like rqm_vend no-undo.
   define input  parameter p_part like rqd_part no-undo.
   define output parameter p_got_vendor_item_data as logical no-undo.
   define output parameter p_q_qty like rqd_req_qty no-undo.
   define output parameter p_q_um like rqd_um no-undo.
   define output parameter p_curr like rqm_curr no-undo.
   define output parameter p_vpart like rqd_vpart no-undo.
   define output parameter p_q_price like rqd_pur_cost no-undo.
   define output parameter p_mfgr like vp_mfgr no-undo.
   define output parameter p_mfgr_part like vp_mfgr_part no-undo.
 
   p_got_vendor_item_data = false.
 
   for each vp_mstr no-lock
       where vp_mstr.vp_domain = global_domain
         and vp_part = p_part
         and vp_vend = p_vendor
   break by vp_q_date descending:
 
      if first(vp_q_date) then do:
         assign
            p_q_qty = vp_q_qty
            p_q_um = vp_um
            p_curr = vp_curr
            p_vpart = vp_vend_part
            p_q_price = vp_q_price
            p_mfgr = vp_mfgr
            p_mfgr_part = vp_mfgr_part
            p_got_vendor_item_data = true.
 
         leave.
      end.
 
   end.
 
END PROCEDURE.
 
PROCEDURE display_ext_cost:
   define output parameter p_netpriceint  as integer no-undo.
   define output parameter p_netpricefrac as integer no-undo.
 
   find rqd_det where recid(rqd_det) = rqd_recid exclusive-lock.
 
   assign
      p_netpriceint  = net_price
      p_netpricefrac = (net_price - p_netpriceint ) * 100000
      ext_cost       = if rqd_pur_cost <> 0
                       then
                          rqd_req_qty * (p_netpriceint + p_netpricefrac / 100000)
                       else
                          0.
 
   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
             "(input-output ext_cost,
              input rndmthd,
              output mc-error-number)"}
 
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.
 
   display ext_cost with frame c.
 
END PROCEDURE.
 
PROCEDURE display_max_ext_cost:
 
   find rqd_det where recid(rqd_det) = rqd_recid exclusive-lock.
 
   max_ext_cost = rqd_req_qty * rqd_max_cost.
 
   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
             "(input-output max_ext_cost,
               input rndmthd,
               output mc-error-number)"}
 
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.
 
   display max_ext_cost with frame c.
 
END PROCEDURE.
 
PROCEDURE display_st_qty:
 
   find rqd_det where recid(rqd_det) = rqd_recid exclusive-lock.
   st_qty = rqd_req_qty * rqd_um_conv.
   display st_qty with frame c.
 
END PROCEDURE.
 
PROCEDURE get_item_data:
   define input  parameter p_part     like pt_part     no-undo.
   define input  parameter p_site     like pt_site     no-undo.
   define input  parameter p_supp_type like vd_type     no-undo.
   define output parameter p_std_cost as   decimal     no-undo.
   define output parameter p_rev      like pt_rev      no-undo.
   define output parameter p_loc      like pt_loc      no-undo.
   define output parameter p_ins      like pt_insp_rqd no-undo.
   define output parameter p_acct     like pod_acct    no-undo.
   define output parameter p_sub      like pod_sub     no-undo.
   define output parameter p_cc       like pod_cc      no-undo.
 
   define variable curcst       as   decimal.
   define variable l_dummy_type as   character no-undo.
 
   find si_mstr 
      where si_mstr.si_domain = global_domain 
        and si_site = p_site
   no-lock.
  
   /* GPSCT05.P LOOKS FOR IN_MSTR AND GETS THE COST, IF */
   /* IT IS NOT AVAILABLE, VALUES OF 0.00 ARE RETURNED. */
   /* IF NOT AVAIABLE IN_MSTR IS CREATED LATER IN THIS  */
   /* PROGRAM.                                          */
   /* WITH LINKED SITE COSTING, IF THE SELECTED ITEM AND*/
   /* SITE ARE LINKED TO ANOTHER SITE, I.E. IF A LINKING*/
   /* RULE EXIST FOR SELECTED SITE, THEN IN_MSTR IS     */
   /* CREATED WITH THE LINK. (I.E. IN_GL_COST_SITE =    */
   /* SOURCE SITE AND IN_GL_SET = SOURCE GL COST SET.)  */
   /* THEREFORE FOR LINKED SITES THE UNIT COST RETRIEVED*/
   /* HERE SHOULD BE THE COST AT THE SOURCE SITE.       */
   /* TO AVOID CHANGING THE IN_MSTR CREATION TIMING WE  */
   /* FIND THE SOURCE SITE AND GET THE COST AT THAT SITE*/
 
   gl-site = si_site.
   for first in_mstr where in_domain = global_domain
      and in_part = p_part
      and in_site = si_site
   no-lock: end.
 
   if not available in_mstr then
      {us/bbi/gprun.i ""gpingl.p""
               "(input  si_site,
                 input  p_part,
                 output gl-site,
                 output gl-set)"}
 
   {us/bbi/gprun.i ""gpsct05.p""
            "(input  p_part,
              input  gl-site,
              input  2,
              output p_std_cost,
              output curcst)"}
 
   {us/bbi/gprun.i ""popomte1.p""
            "(input  p_part,
              input  si_site,
              input  p_supp_type,
              output p_rev,
              output p_loc,
              output p_ins,
              output p_acct,
              output p_sub,
              output p_cc,
              output l_dummy_type)"}
  
END PROCEDURE.
 
PROCEDURE get_vendor_q_price:
   define input parameter p_part like pod_part no-undo.
   define input parameter p_vend like po_vend no-undo.
   define input parameter p_curr like po_curr no-undo.
   define input parameter p_qty_ord like pod_qty_ord no-undo.
   define input parameter p_um like pod_um no-undo.
   define output parameter p_pur_cost like pod_pur_cost no-undo.
 
   define variable conversion_factor as decimal no-undo.
 
   p_pur_cost = ?.
 
   for each vp_mstr no-lock
       where vp_mstr.vp_domain = global_domain
         and vp_part = p_part
         and vp_vend = p_vend
   break by vp_q_date descending:
 
      if first(vp_q_date) then do:
         conversion_factor = 1.
 
         if vp_um <> p_um then do:
            {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                           &HANDLE=ph_gpumxr
                           &PARAM="(input vp_part,
                                    input p_um,
                                    input vp_um,
                                    output conversion_factor)"
                           &NOAPPERROR=True
                           &CATCHERROR=True}
         end.
 
         if conversion_factor <> ? then do:
            if p_qty_ord / conversion_factor >= vp_q_qty
               and p_curr = vp_curr
            then
               p_pur_cost = vp_q_price / conversion_factor.
         end.
 
         leave.
 
      end.
   end.
 
END PROCEDURE.
 
PROCEDURE get_pur_cost:
   define input parameter p_part like pt_part no-undo.
   define input parameter p_vend like po_vend no-undo.
   define input parameter p_site like si_site no-undo.
   define input parameter p_curr like po_curr no-undo.
   define input parameter p_qty_ord like pod_qty_ord no-undo.
   define input parameter p_um like pod_um no-undo.
   define input parameter p_ex_rate like po_ex_rate no-undo.
   define input parameter p_ex_rate2 like po_ex_rate2 no-undo.
   define output parameter p_pur_cost like pod_pur_cost no-undo.
   define output parameter p_base_cost like pod_pur_cost no-undo.
 
   define variable conversion_factor as decimal no-undo.
   define variable glxcst as decimal no-undo.
   define variable l_pl_acc like pl_pur_acct  no-undo.
   define variable l_pl_sub like pl_pur_sub  no-undo.
   define variable l_pl_cc  like pl_pur_cc  no-undo.
   define variable l_pt_rev like pt_rev no-undo.
   define variable l_pt_ins like pt_insp_rqd no-undo.
   define variable l_pt_loc like pt_loc no-undo.
 
   run get_vendor_q_price
      (input  p_part,
       input  p_vend,
       input  p_curr,
       input  p_qty_ord,
       input  p_um,
       output p_pur_cost).
 
   if p_pur_cost = ? then do:
 
      find pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = p_part
      no-lock no-error.
 
      if available pt_mstr then do:
 
         for first vd_mstr
             where vd_mstr.vd_domain = global_domain and vd_addr = p_vend
         no-lock: end.
 
         /* ADDED SUPPLIER TYPE AS THIRD INPUT PARAMETER  */
         run get_item_data
           (input  p_part,
            input  p_site,
            input  if available vd_mstr then vd_type else """",
            output glxcst,
            output l_pt_rev,
            output l_pt_loc,
            output l_pt_ins,
            output l_pl_acc,
            output l_pl_sub,
            output l_pl_cc).
 
         conversion_factor = 1.
 
         if pt_um <> p_um then do:
            {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                           &HANDLE=ph_gpumxr
                           &PARAM="(input pt_part,
                                    input p_um,
                                    input pt_um,
                                    output conversion_factor)"
                           &NOAPPERROR=True
                           &CATCHERROR=True}
         end.
 
         p_pur_cost = (glxcst / conversion_factor) * p_ex_rate.
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                   "(input  base_curr,
                     input  p_curr,
                     input  p_ex_rate2,
                     input  p_ex_rate,
                     input  (glxcst / conversion_factor),
                     input  false,  /* DO NOT ROUND */
                     output p_pur_cost,
                     output mc-error-number)"}
 
         p_base_cost = glxcst / conversion_factor.
      end.
   end.
END PROCEDURE.
 
PROCEDURE display_message:
   define input parameter p-message-nbr    like msg_nbr no-undo.
   define input parameter p-severity       as integer no-undo.
   define input parameter p-user-val1      as character no-undo.
   define input parameter p-user-val2      as character no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=p-message-nbr &ERRORLEVEL=p-severity
            &MSGARG1=p-user-val1
            &MSGARG2=p-user-val2}
 
END PROCEDURE.
 
PROCEDURE get_default_category:
   define input parameter p_direct like rqm_direct no-undo.
   define input parameter p_acct like rqd_acct no-undo.
 
   define input parameter p_sub like rqm_sub no-undo.
   define output parameter p_category like rqc_category no-undo.
 
   p_category = "".
 
   /*DEFAULT RULES:                                            */
   /*  1. CATEGORIES NEEDED ONLY FOR MRO REQS. (DIRECT = NO)   */
   /*  2. USE (PUR ACCT + SUBACCT) TO FIND CATEGORY            */
   /*  3. USE PUR ACCT TO FIND CATEGORY                        */
   /*  4. NOT FOUND, CATEGORY = ""                             */
 
   if not p_direct then do:
      find last rqcd_det where rqcd_domain = global_domain
         and rqcd_acct_from <= p_acct
         and rqcd_acct_to >= p_acct
         and rqcd_sub_from <= p_sub
         and rqcd_sub_to >= p_sub
      no-lock no-error.
 
   if not available rqcd_det
   then do:
      for last rqcd_det
         where rqcd_det.rqcd_domain     = global_domain
         and   rqcd_det.rqcd_acct_from <= p_acct
         and   rqcd_acct_to            >= p_acct
         and   rqcd_sub_from            = ""
         and   rqcd_sub_to              = ""
      no-lock:
      end. /*FOR LAST rqcd_det*/
   end. /*IF NOT AVAILABLE rqcd_det*/
 
      if available rqcd_det then
         p_category = rqcd_category.
 
   end.  /* if not p_direct */
 
END PROCEDURE.
 
PROCEDURE p_close_req:
 
   define input parameter p_rqm_recid as recid no-undo.
 
   find rqm_mstr where recid(rqm_mstr) = p_rqm_recid
   exclusive-lock no-error.
 
   if available rqm_mstr then do:
      if rqm_status = "" and
         rqm_open   = true
      then
      assign
      rqm_status   = "c"
      rqm_cls_date = today.
   end.
 
END PROCEDURE.
 
PROCEDURE p_open_req:
 
   define input parameter p_rqm_recid as recid no-undo.
 
   find rqm_mstr where recid(rqm_mstr) = p_rqm_recid
   exclusive-lock no-error.
   if available rqm_mstr then
      assign
      rqm_status   = ""
      rqm_cls_date = ?.
 
END PROCEDURE.
 
PROCEDURE p_ip_msg:
 
   define input parameter l_num  as integer no-undo.
   define input parameter l_stat as integer no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=l_num &ERRORLEVEL=l_stat}
END PROCEDURE.
 
PROCEDURE p-message-question:
 
   define input        parameter l_num  as   integer     no-undo.
   define input        parameter l_stat as   integer     no-undo.
   define input-output parameter l_yn   like mfc_logical no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=l_num &ERRORLEVEL=l_stat &CONFIRM=l_yn}
 
END PROCEDURE.
 
PROCEDURE getPurchaseAcctDefault:
 
   define variable ip_temp_acct like rqd_acct no-undo.
 
   /* Determine if vendor or site has changed and re-default pur acct */
   if not new_rqd and
      (rqd_det.rqd_site <> prev_site or rqd_vend <> prev_vend)
   then do:
      /* Default first to gl control file */
      assign
         rqd_acct = gl_ctrl.gl_pur_acct.
 
      /* Retrieve default purchase account info from Financials */
      assign vcProxyCompanyCode = current_entity
             icCreditorCode     = rqd_vend.
 
      {proxy/bcreditor/apigetpurchaseaccountdatarun.i}
      if ocPurchaseGLCode <> "" then
         assign rqd_acct = ocPurchaseGLCode.
 
      /* Default next to PL_MSTR or ACCT_MSTR (if valid part) */
      for first pt_mstr
         where pt_mstr.pt_domain = global_domain and pt_part = rqd_part
      no-lock: end.
 
      if available pt_mstr then do:
         {us/px/pxgetph.i ppprxr}
         if ({us/px/pxfunct.i &FUNCTION = 'IsValidProductLine' 
                        &PROGRAM = 'ppprxr.p'
                        &HANDLE = ph_ppprxr
                        &PARAM = "(pt_prod_line)"})
         then do:
 
            find vd_mstr
               where vd_mstr.vd_domain = global_domain
                 and vd_addr = rqd_vend
            no-lock no-error.
 
            /* Determine if default gl accounts exists */
            {us/bbi/gprun.i ""glactdft.p""
               "(input  ""PO_PUR_ACCT"",
                 input  pt_prod_line,
                 input  rqd_site,
                 input  if available vd_mstr then vd_type else """",
                 input  """",
                 input  no,
                 output ip_temp_acct,
                 output dummy_sub,
                 output dummy_cc)"}
 
            if ip_temp_acct <> "" then
            assign
               rqd_acct  = ip_temp_acct.
         end.
 
      end. /* for first pt_mstr */
   end.  /* if not new_rqd... */
END PROCEDURE.
 
PROCEDURE p_calc_netprice:
 
   /* TO CALCULATE THE NET PRICE FOR REQUISITION LINE */
 
   define parameter buffer rqddet for rqd_det.
 
   if available rqddet then do:
      if rqddet.rqd__qadc01 <> "" then
         net_price = getDecFromChar(rqddet.rqd__qadc01).
      else
         net_price = rqddet.rqd_pur_cost
                   * (1 - rqddet.rqd_disc_pct / 100).
   end.
   else
      net_price = 0.
 
END PROCEDURE. /* p_calc_netprice */
 
PROCEDURE displayWorkOrder:
 
/* DISPLAY THE WORK ORDER FRAME IF THE SUBTYPE IN PURCHASE */
/* ORDER LINE IS SET TO 'S'                                */
 
   define parameter buffer b_rqd_det for rqd_det.
   define variable sub_type  like rqd_det.rqd_sub_type no-undo.
   define variable workord  like wo_mstr.wo_nbr no-undo.
   define variable worklot  like wo_mstr.wo_lot no-undo.
   define variable routeop  like wr_route.wr_op no-undo.
   define variable workpart like wo_mstr.wo_part no-undo.
   define variable workproj like wo_mstr.wo_project no-undo.
 
   /* PASS EXISTING RQD VALUES TO THE SUBCONTRACT FRAME */
   assign
      worklot  = b_rqd_det.rqd_wo_lot
      routeop  = b_rqd_det.rqd_op
      sub_type = b_rqd_det.rqd_sub_type
      workproj = b_rqd_det.rqd_project
      workpart = b_rqd_det.rqd_part.
 
   {us/bbi/gprun.i ""rqrqmtd1.p""
            "(input rqd_recid,
              input-output workord,
              input-output worklot,
              input-output routeop,
              input-output sub_type,
              input-output workpart,
              input-output workproj)"}
 
   /* SAVE MODIFIED VALUES SET IN THE SUBCONTRACT FRAME */
   assign
      b_rqd_det.rqd_wo_lot   = worklot
      b_rqd_det.rqd_sub_type = sub_type
      b_rqd_det.rqd_op       = routeop.
 
END PROCEDURE.
