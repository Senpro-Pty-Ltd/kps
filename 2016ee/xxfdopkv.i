/* xxfdopkv.i - Variables for CYB_DistributionOrderPicklist                   */
/*----------------------------------------------------------------------------*/
/* Copyright 2019 QAD Inc. All rights reserved.                               */
/*----------------------------------------------------------------------------*/
/* CYB   LAST MODIFIED: 15-FEB-2018    BY: gbg *K10017*Task1163*              */
/*----------------------------------------------------------------------------*/


def {1} shared var any_open        as logical.
def {1} shared var totpkqty        as dec.
def {1} shared var totallqty       as dec.
def {1} shared var qty_to_all      as dec.
def {1} shared var ds_recno        as recid.
def {1} shared var update_yn       as logical.
def {1} shared var l_totalqty      as dec.

/****
define new shared variable rec_site like dss_rec_site.
define new shared variable rec_site1 like dss_rec_site.
define new shared variable src_site like dss_shipsite.
define new shared variable src_site1 like dss_shipsite.
define new shared variable nbr like dss_nbr.
define new shared variable nbr1 like dss_nbr.
define new shared variable ord like dss_created.
define new shared variable ord1 like dss_created.
define new shared variable lang  like dss_lang.
define new shared variable lang1 like dss_lang.
****/
define new shared variable company as character format "x(38)" extent 6.
define new shared variable addr    as character format "x(38)" extent 6.
define new shared variable dss_recno as recid.

define buffer ship for ad_mstr.

define variable comp_addr like soc_company no-undo.
define variable weight_um like tm_weight_um no-undo.
define variable cube_um   like tm_cube_um   no-undo.
define variable weight_conv like um_conv no-undo.
define variable cube_conv   like um_conv no-undo.
define variable i as integer no-undo.
define variable cum_weight like pt_ship_wt label "Cum Weight" no-undo.
define variable cum_cube like pt_size label "Cum Cube" no-undo.
define variable item_count as integer label "Item Count" no-undo.
define variable qty_open like ds_qty_ord format "->>>>>>9.9<<<<<"
   label "Qty Open" no-undo.
define variable desc1 like pt_desc1 no-undo.
define variable pages as integer no-undo.
define variable billto as character format "x(38)" extent 6 no-undo.
define variable shipto as character format "x(38)" extent 6 no-undo.
define variable termsdesc like ct_desc no-undo.
define variable billattn like ad_attn no-undo.
define variable shipattn like ad_attn no-undo.
define variable billphn like ad_phone no-undo.
define variable shipphn like ad_phone no-undo.
define variable first_line like  mfc_logical no-undo.
define variable desc2 like pt_desc2 no-undo.
define variable disp-do-pklist as character format "x(72)" no-undo.
define variable shipped as character format "x(9)" no-undo.
define variable req-nbr like ds_req_nbr no-undo.
