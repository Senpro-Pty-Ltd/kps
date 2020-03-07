/* xfsl09.p - STAGE LIST SUBPROGRAM - PRINT A PICK LIST                       */
/* sosl01.p - STAGE LIST SUBPROGRAM - PRINT A PICK LIST                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsl09.p,v 1.2 2018/03/13 17:09:37 gbg Exp $: */
/*                                                                            */
/* Description:                                                               */
/* THIS PROGRAM WAS CLONED TO whsosl01.p 06/30/06.                            */
/* WAREHOUSING (AIM). CHANGES TO THIS PROGRAM MAY ALSO NEED TO BE APPLIED TO  */
/* THESE PROGRAMS: whsosl01.p                                                 */
/******************************************************************************/
/*                                                                            */
/* REVISION: 8.5      LAST MODIFIED: 03/14/95   BY: GWM *J049*                */
/* REVISION: 8.5      LAST MODIFIED: 04/23/96   BY: AJW *J0JH*                */
/* REVISION: 8.5      LAST MODIFIED: 05/15/96   BY: GWM *J0MJ*                */
/* REVISION: 8.5      LAST MODIFIED: 05/29/96   BY: AME *J0NP*                */
/* REVISION: 8.5      LAST MODIFIED: 07/08/96   BY: GWM *J0XM*                */
/* REVISION: 8.5      LAST MODIFIED: 07/25/96   BY: AJW *J107*                */
/* REVISION: 8.5      LAST MODIFIED: 07/26/96   BY: *J11T* Rob Wachowicz      */
/* REVISION: 8.5      LAST MODIFIED: 07/27/96   BY: *J12G* Dennis Henson      */
/* REVISION: 8.6      LAST MODIFIED: 09/20/96   BY: TSI *K005*                */
/* REVISION: 8.6      LAST MODIFIED: 09/17/96   BY: *K003* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 10/08/96   BY: *K003* forrest mori       */
/* REVISION: 8.6      LAST MODIFIED: 12/05/96   BY: *K02Y* Chris Theisen      */
/* REVISION: 8.6      LAST MODIFIED: 01/10/97   BY: *K04R* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 02/03/97   BY: *K05L* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K04X* Steve Goeke        */
/* REVISION: 8.5      LAST MODIFIED: 04/04/97   BY: *J1LY* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 05/12/97   BY: *K0D5* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 06/03/97   BY: *K0DH* Arul Victoria      */
/* REVISION: 8.6      LAST MODIFIED: 11/14/97   BY: *J25W* Niranjan R.        */
/* REVISION: 8.6      LAST MODIFIED: 11/18/97   BY: *K18W* Taek-Soo Chang     */
/* REVISION: 8.6      LAST MODIFIED: 11/24/97   BY: *K15N* Jim Williams       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 03/23/98   BY: *K1MN* Niranjan R.        */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/01/98   BY: *J2LW* Niranjan R.        */
/* REVISION: 8.6E     LAST MODIFIED: 06/08/98   BY: *J2MH* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 09/14/98   BY: *J2ZS* Jean Miller        */
/* REVISION: 8.6E     LAST MODIFIED: 10/28/98   BY: *J331* Surekha Joshi      */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/99   BY: *K20L* Anup Pereira       */
/* REVISION: 8.6E     LAST MODIFIED: 08/12/99   BY: *K225* Kedar Deherkar     */
/* REVISION: 8.6E     LAST MODIFIED: 10/26/99   BY: *K23C* Kedar Deherkar     */
/* REVISION: 9.1      LAST MODIFIED: 11/30/99   BY: *N004* Patrick Rowan      */
/* REVISION: 9.1      LAST MODIFIED: 11/26/99   BY: *N039* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 12/23/99   BY: *N06X* Patrick Rowan      */
/* REVISION: 9.1      LAST MODIFIED: 02/08/00   BY: *L0QM* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/01/00   BY: *K267* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown         */
/* Revision: 1.24.1.12      BY: Kirti Desai       DATE: 05/22/01  ECO: *N0Y4* */
/* Revision: 1.24.1.13      BY: Vandna Rohira     DATE: 11/15/01  ECO: *M1PX* */
/* Revision: 1.24.1.14      BY: K S Paneesh       DATE: 12/07/01  ECO: *M1RQ* */
/* Revision: 1.24.1.15      BY: Mercy C.          DATE: 02/19/02  ECO: *M1VH* */
/* Revision: 1.24.1.16      BY: Katie Hilbert     DATE: 04/15/02  ECO: *P03J* */
/* Revision: 1.24.1.17      BY: Jean Miller       DATE: 05/13/02  ECO: *P05M* */
/* Revision: 1.24.1.18      BY: Anitha Gopal      DATE: 06/12/02  ECO: *N1HD* */
/* Revision: 1.24.1.19      BY: Manish Dani       DATE: 08/12/02  ECO: *N1R2* */
/* Revision: 1.24.1.20      BY: Shoma Salgaonkar  DATE: 10/22/02  ECO: *N1XX* */
/* Revision: 1.24.1.22      BY: Mamata Samant     DATE: 04/04/03  ECO: *N28J* */
/* Revision: 1.24.1.24      BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.24.1.25      BY: Subramanian Iyer  DATE: 11/18/03  ECO: *P18N* */
/* Revision: 1.24.1.26      BY: Shivanand H       DATE: 01/23/04  ECO: *P1KF* */
/* Revision: 1.24.1.27      BY: Nishit V          DATE: 03/05/04  ECO: *P1RF* */
/* Revision: 1.24.1.28      BY: Mercy C.          DATE: 05/07/04  ECO: *P20Q* */
/* Revision: 1.24.1.29      BY: Shivaraman V.     DATE: 05/11/04  ECO: *P212* */
/* Revision: 1.24.1.30      BY: Reena Ambavi      DATE: 05/26/05  ECO: *P3MJ* */
/* Revision: 1.24.1.31      BY: Rafiq S           DATE: 11/21/05  ECO: *P481* */
/* Revision: 1.24.1.32      BY: Miguel Alonso     DATE: 06/30/06  ECO: *R071* */
/* Revision: 1.24.1.35      BY: Sambit Pattnaik   DATE: 12/07/06  ECO: *P5H4* */
/* Revision: 1.24.1.38      BY: Masroor Alam      DATE: 12/22/06  ECO: *P5K7* */
/* Revision: 1.24.1.39      BY: Jean Miller       DATE: 03/15/07  ECO: *R0C6* */
/* Revision: 1.24.1.40      BY: Mochesh Chandran  DATE: 11/06/07  ECO: *R0GB* */
/* Revision: 1.24.1.41      BY: Amar Gaikwad      DATE: 01/10/08  ECO: *P616* */
/* Revision: 1.24.1.42      BY: Xavier Prat       DATE: 01/21/08  ECO: *R0L9* */
/* Revision: 1.24.1.43      BY: Jean Miller       DATE: 06/20/08  ECO: *R0VG* */
/* Revision: 1.24.1.46      BY: Miguel Alonso     DATE: 01/21/08  ECO: *R0NZ* */
/* Revision: 1.24.1.47      BY: Xavier Prat       DATE: 12/16/08  ECO: *R181* */
/* Revision: 1.24.1.48      BY: Jean Miller       DATE: 03/03/09  ECO: *R18C* */
/* Revision: 1.24.1.49      BY: Xavier Prat       DATE: 06/02/09  ECO: *R1JT* */
/* Revision: 1.24.1.50      BY: Dipanshu Talwar   DATE: 07/20/09  ECO: *P6ZX* */
/* Revision: 1.24.1.51      BY: Xiaolei Meng      DATE: 07/28/09  ECO: *R1MZ* */
/* Revision: 1.24.1.53    BY: Chandrakant Ingale  DATE: 09/24/09  ECO: *Q3DM* */
/* Revision: 1.24.1.54    BY: Jordan Fei        DATE: 08/27/09  ECO: *R1V9* */
/* Revision: QAD2016      BY: sxh    DATE:  16/05/16  ECO: *grc338  */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

/*GRC3381*/ {us/xf/xfsolu.i}
/*GRC338*/ {us/xf/xfdefa.i}
/*GRC338*/ {us/xf/xfsosl09v.i}

{us/rc/rcinvtbl.i new}
 
{us/px/pxmaint.i}
{us/px/pxphdef.i gpumxr}
{us/px/pxphdef.i fssmxr}
{us/px/pxphdef.i ppptrexr}
{us/px/pxphdef.i sosodxr}
{us/px/pxphdef.i capfxr}
{us/px/pxphdef.i adctxr}
{us/px/pxphdef.i caisxr}
{us/pp/ppptrett.i}
 
{us/ca/cattdef.i}
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
 
/* INPUT PARAMETERS */
define input parameter max_weight        like abs_nwt.
define input parameter max_volume        like abs_vol.
define input parameter wght_um           like pt_net_wt_um no-undo.
define input parameter vol_um            like pt_size_um   no-undo.
define input parameter break_order       as logical.
define input parameter pack_cmmt_include as logical.
define input parameter pack_cmmt_print   as logical.
define input parameter print_options     as logical.
define input parameter due_date          as date.
define input parameter due_date1         as date.
define input parameter due_time          like schd_time      no-undo.
define input parameter due_time1         like schd_time      no-undo.
define input parameter ref               like schd_reference no-undo.
define input parameter ref1              like schd_reference no-undo.
define input parameter l_create_um       like mfc_logical    no-undo.
define input parameter l_update_yn       like mfc_logical initial "yes" no-undo.
define input parameter all_only          like mfc_logical no-undo.
 
/* OUTPUT PARAMETERS */
define output parameter errors as logical no-undo.
 
/* LOCAL VARIABLES */
define variable l_is_depot         as logical initial no no-undo.
define variable pack_nbr           like abs_id no-undo.
define variable max_lines          as integer no-undo.
define variable total_weight       like max_weight no-undo.
define variable total_volume       like max_volume no-undo.
define variable total_lines        like max_lines no-undo.
define variable qty_open           like sod_qty_ord
                                   column-label "Qty Open!Qty to Ship"
                                   format "->>>>>9.9<<<<<" no-undo.
define variable l_accum_qty        like sod_qty_ord
                                   format "->>>>>9.9<<<<<" no-undo.
define variable l_temp_disp_qty    like sod_qty_ord
                                   format "->>>>>9.9<<<<<" no-undo.
define variable l_qty_open         like sod_qty_ord
                                   format "->>>>>9.9<<<<<" no-undo.
define variable old_sod_nbr        like sod_nbr no-undo.
define variable desc1              like pt_desc1 no-undo.
define variable desc2              like desc1 no-undo.
define variable location           like pt_loc no-undo.
define variable rev                like pt_rev no-undo.
define variable cspart-lbl         as character format "x(15)" no-undo.
define variable cont_lbl           as character format "x(12)" no-undo.
define variable prior_cum_net_req  as decimal no-undo.
define variable cum_net_req        as decimal no-undo.
define variable net_req            as decimal no-undo.
define variable addr               as character format "x(38)" extent 6 no-undo.
define variable shipto             as character format "x(38)" extent 6 no-undo.
define variable pages              as integer no-undo.
define variable new_page           as logical no-undo.
define variable rev-lbl            as character format "X(10)" no-undo.
define variable sob_um             like pt_um no-undo.
define variable trans_conv         as decimal no-undo.
define variable soship             like so_ship no-undo.
define variable create_stage       as logical no-undo.
define variable first_page         as logical initial true no-undo.
define variable i                  as integer no-undo.
define variable weight_conv        as decimal no-undo.
define variable old_pack_nbr       like pack_nbr no-undo.
define variable first_one          as logical no-undo.
define variable last_ship_recid    as recid no-undo.
define variable ship_cmplt         as decimal no-undo.
define variable cum_all_qty        as decimal no-undo.
define variable inv_um_qty         like abs_qty no-undo.
define variable consolidate_ok     like mfc_logical no-undo.
define variable dummy_so           like so_nbr no-undo.
define variable comp_part          like sob_part no-undo.
define variable v_unpicked_qty     like sod_qty_pick no-undo.
define variable open_qty           like sod_qty_pick no-undo.
define variable l_abs_pick_qty     like sod_qty_pick no-undo.
define variable tot_qad_decfld     like qad_decfld   no-undo.
define variable sequence_list      as   character format "x(36)" no-undo.
define variable prev_shipper_count as   decimal     no-undo.
define variable curr_shipper_count as   decimal     no-undo.
define variable l_line             as   integer     no-undo.
define variable l_container        like mfc_logical no-undo.
define variable l_skip             like mfc_logical no-undo.
define variable proc_error         like mfc_logical no-undo.
 
define variable abs_recno          as recid no-undo.
define variable qad_recno          as recid no-undo.
define variable so_recno           as recid no-undo.
define variable sod_recno          as recid no-undo.
define variable line_recno         as recid no-undo.
define variable comp_recno         as recid no-undo.
define variable tot_loclotref_qty  like qad_decfld[1] no-undo.
define variable break_wtvoln         as logical no-undo.
define variable new_shipper          as logical no-undo.
define variable cust_ref_list as character no-undo.
define variable absparid           like abs_id no-undo.
define variable absfound           like mfc_logical initial false no-undo.
define variable LVOKForUse         as logical no-undo.
define variable LVType             like abs_type no-undo.
define variable ld_max_lines       as integer    no-undo.
define variable dTotalShipQty      as decimal no-undo.
define variable conformingLabel    as character no-undo.
define variable use-log-acctg      as logical no-undo.
define variable l_UpdateLogSupplier as logical no-undo.
define variable inv_ord_qty        as integer    no-undo.
define variable conversion_factor  as decimal no-undo.
define variable unserialized       as   logical  no-undo.
 
define new shared variable old_ft_type like ft_type.
 
{us/px/pxphdef.i pasexr}
 
define variable tIsItemWithSerialId as logical no-undo.
define variable tNoPickingMenu as character no-undo
   /*grc338 initial "sososl.p". */   initial "xfsosl.p". /*grc338*/
 
define new shared frame d.
 
/* SHARED VARIABLES FOR CUSTOMER SEQUENCE SCHEDULES */
{us/so/sosqvars.i}
 
define variable l_wrk_cust_ref like wrk_cust_ref.
define variable l_wrk_date     like wrk_date.
 
/* BUFFERS */
define buffer tmp_wkfl for qad_wkfl.
define buffer ship_line for abs_mstr.
define buffer abs_parent for abs_mstr.
define buffer b_qad for qad_wkfl.
define buffer LBAbsMstr for abs_mstr.
define buffer LBAbsShp for abs_mstr.
define buffer LBSchdDet for schd_det.
define buffer LBAbsrDet for absr_det.
define buffer LBAbscDet for absc_det.
define buffer b_abs_mstr for abs_mstr.
 
define shared temp-table t_sod_site no-undo
   field t_sonbr   like sod_nbr
   field t_sodsite like sod_site
   index t_sonbr t_sonbr.
 
/* PROGRAM X-REFERENCE FUNCTIONS */
{us/wh/whexecfn.i}
 
/* USE TEMP-TABLE IN PLACE OF WORKFILE TO IMPROVE PERFORMANCE     */
{us/pa/pattptp.i}
 
/* MAKE SURE CONTROL FIELDS EXIST */
{us/bbi/gprun.i ""rcpma.p""}
 
/* FIND MAX LINES */
find mfc_ctrl where mfc_ctrl.mfc_domain = global_domain
   and mfc_field = "rcc_ship_lines"
no-lock no-error.
if available mfc_ctrl then
   max_lines = mfc_integer.
 
{us/so/sopkf01.i}
 
form
   header         skip (3)
   getTermLabelRtColon("SHIP_TO",8) at 4
   soship
   if not l_update_yn then
      getTermLabel("BANNER_SIMULATION",28)
   else
      "" format "x(28)" to 79
   getTermLabel("BANNER_PICKLIST",16) + " / " +
   getTermLabel("BANNER_PRE_SHIPPER",22) format "x(40)" to 79
   shipto[1]      at 4
   sequence_list no-label to 79
   shipto[2]      at 4
   getTermLabelRtColon("PRE-SHIPPER",14) format "x(14)" to 61
   pack_nbr       at 63
   getTermLabel("PAGE_OF_REPORT",8) + ":"
   + string(page-number - pages,">>9") to 80
   shipto[3]      at 4
   shipto[4]      at 4
   getTermLabelRtColon("PRINT_DATE",14) format "x(14)" to 61
   today          at 63
   shipto[5]      at 4
   shipto[6]      at 4 skip(1)
with frame phead3 page-top width 90.
 
/* FORMAT OF SOD_PART INCREASED TO X(30) SO THAT IT CAN ALSO BE USED */
/* TO DISPLAY THE PO NBR. FRAME D DEFINED AS DOWN FRAME TO PREVENT   */
/* HEADER TO BE PRINTED EACH TIME THE DETAIL LINE IS DISPLAYED.      */
form
   sod_line
   sod_part
   sod_type
   lad_loc
   lad_lot
   qty_open
   sod_um
   sod_due_date
with frame d down width 90.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).
 
form
   so_nbr
   so_ord_date
   so_ship_po
   so_shipvia
with frame d1 side-labels
width 90.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame d1:handle).
 
form
   wrk_dock        at 41
   wrk_line_feed   at 45
with frame d2 side-labels width 90.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame d2:handle).
 
form
   tt_rep_item_part
   tt_rep_item_site column-label "Site"
   tt_rep_item_loc column-label "Location"
   tt_rep_item_status column-label "Status"
   tt_rep_item_qty_avail
with frame repl_item_inventory down width 90
title color normal (getFrameTitle("REPLACEMENT_ITEM_INVENTORY",34)).
setFrameLabels(frame repl_item_inventory:handle).
 
assign
   cspart-lbl = getTermLabel("CUSTOMER_ITEM",14) + ":"
   cont_lbl   = dynamic-function
                ('getTermLabelFillCentered' in h-label,
                input "CONTINUED",
                input 12,
                input "*")
   rev-lbl    = getTermLabel("REVISION",9) + ":".
 
view frame phead3.
 
/* QAD_WKFL LAYOUT                                                 */
/* FOR QAD_WKFL LAYOUT INFORMATION REFER TO THE BOTTOM PORTION     */
/* OF THE PROGRAM SOSLE01.P                                        */
 
/* INITIALIZATION FOR SEQUENCE SCHEDULE QUANTITIES */
 
if using_seq_schedules then do:
 
   /* SUMMARIZE SEQ. STAGE LIST ENTRIES (qad_wkfl) */
   /* ADDED wght_um AND vol_um AS THIRD AND FOURTH INPUT PARAMETERS */
   /* RESPECTIVELY                                                  */
   {us/gp/gprunmo.i
      &program = ""sosl01b.p""
      &module = "ASQ"
      &param = """(input max_weight,
                   input max_volume,
                   input wght_um,
                   input vol_um,
                   input break_order)"""}
 
end.  /* if using_seq_schedules */
 
for each rcsd_wrk:
   assign wrk_log = no.
end.
 
/* SET FIRST_ONE FOR PROPER PAGE NUMBER.NEW_SHIPPER FOR OPEN QTY PRINTING */
 assign
    first_one = true
    new_shipper = true
    use-log-acctg = false
    l_UpdateLogSupplier = false.
 
/* BREAK BY SHIPFROM, SHIPTO, SALES ORDER, LINE           */
abs_recno = ?.
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}
 
PRINT_LINES:
for each qad_wkfl where qad_domain = global_domain
   and qad_key1 = SessionUniqueID + global_db + "stage_list" exclusive-lock
   break by qad_charfld[12]            /* SITE (SHIP-FROM) */
      by qad_charfld[6]             /* SHIP-TO */
      by qad_charfld1[8]            /* LOADNBR. USED BY WAVE/TMS.       */
                                    /* NO EFFECT OTHERWISE, VALUE WILL  */
                                    /* BE BLANK                         */
      by qad_decfld[5]              /* DROPOFFSEQ. USED BY WAVE/TMS.    */
                                    /* NO EFFECT OTHERWISE, VALUE WILL  */
                                    /* BE ZERO                          */
      by qad_charfld1[9]            /* CARRIERREF. USED BY WAVE/TMS.    */
                                    /* NO EFFECT OTHERWISE, VALUE WILL  */
                                    /* BE BLANK                         */
      by qad_charfld1[5]            /* SHIPVIA. USED BY WAVE PLANNING.  */
                                    /* NO EFFECT OTHERWISE, VALUE WILL  */
                                    /* BE BLANK                         */
      by qad_charfld[7]             /* SALES ORDER */
      by qad_decfld[4]              /* SHIPPER NUMBER. USED BY SEQUENCE */
                                    /* SCHEDULES. NO EFFECT OTHERWISE,  */
                                    /* VALUE WILL BE BLANK.             */
      by integer(qad_charfld[8])    /* LINE NUMBER */
      by qad_charfld[9]
   on endkey undo print_lines, leave:
   curr_shipper_count = qad_decfld[4].
 
   assign
      qad_decfld[4]  = 0
      proc_error = yes.
 
   /* first-of sales order# */
   if first-of(qad_charfld[7]) then do:
 
      /* WAVE PICKING MODULE: WAVE REPLENISHMENT OR WAVE RELEASE */
      if {us/wh/whgpwhon.i} and
         ({us/wh/whmfgexe.i
            &File="whwarpmt"
            &Extension=".p"
            &Operator="="
            &Validate="execname"}
            or {us/wh/whmfgexe.i
               &File="whwaremt"
               &Extension=".p"
               &Operator="="
               &Validate="execname"}
            or isProgInStack("whwareau.p"))
      then do:
 
         assign
            abs_recno = ?
            pack_nbr = ""
            absfound = false
            LVType = "s".
 
         /* FIND OPEN PRE-SHIPPER FOR WAVE LINE */
         {us/wh/whwafnps.i}
 
      end.
 
      find abs_parent where recid(abs_parent) = abs_recno
      no-lock no-error.
 
      if available abs_parent then do:
         consolidate_ok = yes.
 
         /* Consolidate field "0"-No, "1"-Optional, "2"-Yes */
         CASE abs_parent.abs_cons_ship:
            when "0" then
               consolidate_ok = no.
            when "1" then
               if break_order then
                  consolidate_ok = no.
               else
                  consolidate_ok = yes.
            when "2" then
               consolidate_ok = yes.
         END CASE.
 
      end. /* if available abs_parent  */
 
   end. /* if first-of(qad_charfld[7])  */
 
   if first-of(integer(qad_charfld[8])) then do:
      /* DELETE PEGGING INFO FOR SERIAL IDs*/
      {us/bbi/gprun.i ""paunpeg.p""
         "(input qad_charfld[7],
           input integer(qad_charfld[8]),
           input last_ship_recid)"}
   end.
 
   {us/px/pxrun.i &PROC='isDepotOrder' &PROGRAM='fssmxr.p'
            &PARAM="(input  qad_charfld[7],
                     output l_is_depot)"
            &NOAPPERROR=true
            &CATCHERROR=true
   }
 
   if l_is_depot and can-find(first itm_det
                              where itm_domain      = global_domain
                              and   itm_nbr         = qad_charfld[7]
                              and   itm_prefix      = "CA"
                              and   itm_type        = ""
                              and   itm_itm_line    = 0
                              and   itm_line        = integer(qad_charfld[8])
                              and   itm_repair_type = "2")
   then do:
      proc_error = no.
      next PRINT_LINES.
   end.
 
   /* DO NOT PRINT THE PICKLIST FOR A SALES ORDER AND SITE IF */
   /* RECORD EXISTS IN TEMP-TABLE t_sod_site                  */
   for first t_sod_site
      where t_sonbr   = qad_charfld[7]
        and t_sodsite = qad_charfld[12]
   no-lock:
      proc_error = no.
      next PRINT_LINES.
   end. /* FOR FIRST t_sod_site */
 
   /* HANDLE PRINT ALL OPEN LINES LOGIC - DETERMINE IF WE NEED TO */
   /* CREATE A STAGE LIST FOR THIS SHIPTO, SHIPVIA OR ORDER       */
   if first-of(qad_charfld[6])                  /* SHIP-TO */
      or first-of(qad_charfld[12])              /* SHIP-FROM */
      or first-of(qad_charfld1[8])              /* LOADNBR */
      or first-of(qad_decfld[5])                /* DROPOFFSEQ */
      or first-of(qad_charfld1[9])              /* CARRIERREF */
      or first-of(qad_charfld1[5])              /* SHIPVIA */
      or (not consolidate_ok and first-of(qad_charfld[7])) /* SALES ORDER */
   then do:
 
  /*grc338  */  {us/xf/xfsol09a.i}
      /* WAVE PICKING MODULE: WAVE REPLENISHMENT OR WAVE RELEASE */
      if {us/wh/whgpwhon.i} and
         ({us/wh/whmfgexe.i
            &File="whwarpmt"
            &Extension=".p"
            &Operator="="
            &Validate="execname"}
            or {us/wh/whmfgexe.i
               &File="whwaremt"
               &Extension=".p"
               &Operator="="
               &Validate="execname"}
            or isProgInStack("whwareau.p"))
      then do:
 
         find sod_det where sod_domain = global_domain
            and sod_nbr = qad_charfld[7]
            and sod_line = integer(qad_charfld[8])
            and sod_compl_stat = ""
         no-lock.
 
         find sch_mstr where sch_domain = global_domain
            and sch_nbr = sod_nbr
            and sch_line = sod_line
            and sch_type = 3
            and sch_rlse_id = sod_curr_rlse_id[3]
         no-lock no-error.
 
         if available sch_mstr then do:
 
            for each schd_det where schd_domain = global_domain
               and schd_type = sch_type
               and schd_nbr = sch_nbr
               and schd_line = sch_line
               and schd_rlse_id = sch_rlse_id
            no-lock:
 
               find LBSchdDet where recid(LBSchdDet) = recid(schd_det)
               exclusive-lock no-error.
 
               if available LBSchdDet then do:
 
                  LBSchdDet.schd_all_qty = 0.
                  release LBSchdDet.
 
                  for each absr_det where absr_domain = global_domain
                     and absr_cnfrm = false
                     and absr_type = schd_det.schd_type
                     and absr_nbr  = schd_det.schd_nbr
                     and absr_line = schd_det.schd_line
                     and absr_rlse_id = schd_det.schd_rlse_id
                     and absr_date = schd_det.schd_date
                     and absr_time = schd_det.schd_time
                     and absr_interval = schd_det.schd_interval
                     and absr_reference = schd_det.schd_reference
                  no-lock:
                     find LBAbsrDet where recid(LBAbsrDet) = recid(absr_det)
                     exclusive-lock no-error.
                     if available LBAbsrDet then
                        delete LBAbsrDet.
                  end. /* absr_det */
 
               end. /* LBSchdDet */
 
            end. /* schd_det */
 
         end. /* sch_mstr */
 
      end. /* WAVE PICKING */
 
 
      CHECK_OPEN_LINES:
      for each tmp_wkfl where tmp_wkfl.qad_domain = global_domain
         and tmp_wkfl.qad_key1 = SessionUniqueID + global_db + "stage_list"
         and tmp_wkfl.qad_charfld[6] = qad_wkfl.qad_charfld[6]   /* SHIP-TO */
         and tmp_wkfl.qad_charfld1[8] = qad_wkfl.qad_charfld1[8] /* LOADNBR */
         and tmp_wkfl.qad_decfld[5] = qad_wkfl.qad_decfld[5]     /* DROPOFFSEQ */
         and tmp_wkfl.qad_charfld1[9] = qad_wkfl.qad_charfld1[9] /* CARRIERREF */
         and tmp_wkfl.qad_charfld1[5] = qad_wkfl.qad_charfld1[5] /* SHIPVIA */
      no-lock:
 
         /* IF BREAK_ORDER THEN ONLY CHECK RECORDS FOR THE CURRENT */
         /*    ORDER                                               */
         if not consolidate_ok
            and first-of(qad_wkfl.qad_charfld[7])
            and tmp_wkfl.qad_charfld[7] <> qad_wkfl.qad_charfld[7]
         then
            next CHECK_OPEN_LINES.
 
         /* IF A QUANTITY TO STAGE THEN SET FLAG TO CREATE         */
         if (tmp_wkfl.qad_decfld[1]    = 0
         and not all_only)
             or tmp_wkfl.qad_decfld[1] <> 0
         then do:
            create_stage = true.
            leave CHECK_OPEN_LINES.
         end. /* IF (tmp_wkfl.qad_decfld[1] = 0 ... */
 
      end.
 
   end. /* IF FIRST-OF QAD_CHARFLD[6] (SHIPTO)*/
 
   if last_ship_recid <> ?
   then do:
      /* SHIPPER VERIFICATION & PEGGING */
      /* ADDED INPUT PARAMETERS DUE_DATE, DUE_DATE1, DUE_TIME, */
      /* DUE_TIME1, REF AND REF1                               */
      {us/bbi/gprun.i ""sosl01a.p"" "(input last_ship_recid,
                               input due_date,
                               input due_date1,
                               input due_time,
                               input due_time1,
                               input ref,
                               input ref1,
                               output errors)"}
      if errors then
         return.
   end. /* IF last_ship_recid <> ? */
 
   /* GET WORKING RECORDS FOR THIS WORKFILE RECORD */
   find so_mstr where so_mstr.so_domain = global_domain
      and so_nbr = qad_charfld[7]
      and so_compl_stat = ""
   no-lock.
 
   find sod_det where sod_det.sod_domain = global_domain
      and sod_nbr = qad_charfld[7]
      and sod_line = integer(qad_charfld[8])
      and sod_compl_stat = ""
   no-lock.
 
   find pt_mstr where pt_mstr.pt_domain = global_domain
      and  pt_part = qad_charfld[2]
   no-lock no-error.
 
   find sch_mstr where sch_mstr.sch_domain = global_domain
      and  sch_type = 3
      and sch_nbr = sod_nbr and sch_line = sod_line
      and sch_rlse_id = sod_curr_rlse_id[3]
   no-lock no-error.
 
   assign
      so_recno  = recid(so_mstr)
      sod_recno = recid(sod_det).
 
   /**grc338 COMMENTED PORTION BEGINS**
   /* SET ADDRESS FOR PRINTING */
   if so_nbr <> old_sod_nbr then do:
 
      assign
         soship = so_ship
         shipto = "".
 
      find ad_mstr where ad_mstr.ad_domain = global_domain
         and ad_addr = so_ship
      no-lock no-error.
 
      if available ad_mstr then do:
 
         assign
            addr[1] = ad_name
            addr[2] = ad_line1
            addr[3] = ad_line2
            addr[4] = ad_line3.
 
         {us/px/pxrun.i &PROC  = 'getCountryDescription'
            &PROGRAM = 'adctxr.p'
            &HANDLE = ph_adctxr
            &PARAM = "(input ad_mstr.ad_ctry,
                       output addr[6])"
            &NOAPPERROR = true
            &CATCHERROR = true}
 
         {us/mf/mfcsz.i addr[5] ad_city ad_state ad_zip}.
 
         {us/bbi/gprun.i ""gpaddr.p"" }
 
         assign
            shipto[1] = addr[1]
            shipto[2] = addr[2]
            shipto[3] = addr[3]
            shipto[4] = addr[4]
            shipto[5] = addr[5]
            shipto[6] = addr[6].
      end.
 
   end.  /* IF SO_NBR <> OLD_SO_NBR */
   **grc338 COMMENTED PORTION ENDS**/
 
   /* DETERMINE WEIGHT */
   if available pt_mstr and wght_um <> "" then do:
      /* REPLACED SECOND INPUT PARAMETER FROM pt_um TO pt_net_wt_um */
      {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                     &HANDLE=ph_gpumxr
                     &PARAM="(input pt_part,
                              input pt_net_wt_um,
                              input wght_um,
                              output weight_conv)"
                     &NOAPPERROR=True
                     &CATCHERROR=True}
      if weight_conv = ? then weight_conv = 1.
   end.
   else
      weight_conv = 1.
 
   /* DETERMINE VOLUME */
   if available pt_mstr and vol_um <> "" then do:
      /* REPLACED SECOND INPUT PARAMETER FROM pt_um TO pt_size_um */
      {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                     &HANDLE=ph_gpumxr
                     &PARAM="(input pt_part,
                              input pt_size_um,
                              input vol_um,
                              output trans_conv)"
                     &NOAPPERROR=True
                     &CATCHERROR=True}
      if trans_conv = ? then trans_conv = 1.
   end.
   else
      trans_conv = 1.
 
   if available pt_mstr and qad_decfld[1] > 0 then
      assign
         total_weight = total_weight + qad_decfld[1] * pt_net_wt / weight_conv
         total_volume = total_volume + qad_decfld[1] * pt_size   / trans_conv.
 
   if qad_decfld[1] > 0 then
      total_lines  = total_lines + 1.
 
   /* Get format from sgid_format */
   for first sgid_det where sgid_domain = global_domain
      and sgid_grp     = entry(1, qad_charfld[13])
      and sgid_inv_mov = entry(2, qad_charfld[13]) no-lock:
      /* Use legal document max lines to overwrite pre-shipper max lines */
      {us/gp/gprunp.i "soldxr" "p" "getMaxLines"
                "(input sgid_format,
                  input sgid_inv_mov,
                  output ld_max_lines)"}
      if ld_max_lines > 0 then do:
         max_lines = ld_max_lines.
      end.
   end.
 
   /* CHECK FOR CONDITIONS TO CREATE A NEW STAGE LIST */
   if (total_weight > max_weight and max_weight <> 0)
   or (total_volume > max_volume and max_volume <> 0)
   or (total_lines > max_lines and max_lines <> 0)
 
   /* BREAK FOR SEQUENCES */
   or (using_seq_schedules and curr_shipper_count <> prev_shipper_count)
   or create_stage
   then do:
 
      /* IF NEW STAGE LIST IS REQUIRED AND HAVE A STAGE QUANTITY    */
      /* OR DETERMINED NEED FROM ABOVE THEN CREATE A NEW STAGE LIST */
      if qad_decfld[1] <> 0 or create_stage then do:
 
         assign
            qad_recno = recid(qad_wkfl)
            create_stage = false.
 
         /* PRINT SEQUENCE LIST BEFORE PRINTING NEXT PAGE */
         if using_seq_schedules then do:
 
            sequence_list = getTermLabel("BANNER_SEQUENCE_PACKING_LIST",36).
            {us/gp/gprunmo.i
               &program = ""sosob2.p""
               &module = "ASQ"
               &param = """(input abs_recno,
                            input-output pages)"""}
            sequence_list = "".
           break_wtvoln = true.
 
         end.  /* if using_seq_schedules */
 
         /* WAVE PICKING MODULE: WAVE REPLENISHMENT OR WAVE RELEASE */
         if {us/wh/whgpwhon.i} and
            ({us/wh/whmfgexe.i
               &File="whwarpmt"
               &Extension=".p"
               &Operator="="
               &Validate="execname"}
               or {us/wh/whmfgexe.i
                  &File="whwaremt"
                  &Extension=".p"
                  &Operator="="
                  &Validate="execname"}
               or isProgInStack("whwareau.p"))
         then do:
 
            /* WE HAVE PUT HIGHER SOME CODE IN us/wh/whwafnps.i TO FIND A PACK */
            /* LIST NUMBER ALREADY OPEN FOR THE ORDER. IF WE FIND IT, WE */
            /* DON'T WANT TO CALCULATE A NEW PACK NUMBER.                */
            if    pack_nbr = "" 
               or  (total_lines > max_lines 
                    and max_lines <> 0)
            then do:
 
               /* CREATE STAGE LIST HEADER RECORD */
               {us/bbi/gprun.i ""sosob.p""
                  "(input so_recno,
                    input sod_recno,
                    input qad_recno,
                    output pack_nbr,
                    output abs_recno,
                    output proc_error)"}
 
               if proc_error
               then do:
                  errors = yes.
                  return.
               end. /* IF proc_error */
 
               /* sosob.p CREATE THE abs_mstr RECORD FOR THE PRESHIPPER AND */
               /* IT USES THE CARRIER FROM THE DO HEADER, WHICH IS WRONG    */
               /* SINCE EACH LINE CAN HAVE A DIFFERENT CARRIER. WE CORRECT  */
               /* THIS HERE                                                 */
               find LBAbsShp where recid(LBAbsShp) = abs_recno
               exclusive-lock no-error.
 
               if available LBAbsShp then
                  substring(LBAbsShp.abs__qad01, 1,20) = string(qad_charfld1[5],
                     "x(20)").
               /* IF THIS PRE-SHIPPER BELONGS TO A LOAD, WE WRITE THE */
               /* PRE-SHIPPER NUMBER IN THE LOAD MASTER RECORD HERE   */
               if qad_charfld1[8] <> "" then do:
 
                  find LoadM where LoadM.Domain = global_domain
                     and LoadM.LoadNbr = qad_charfld1[8]
                     and LoadM.DropOffSeq = integer(qad_decfld[5])
                     and LoadM.CarrierRef = qad_charfld1[9]
                  exclusive-lock no-error.
 
                  if available LoadM then do:
                     LoadM.ABSID = "p" + pack_nbr.
 
                     /* OVERWRITE PRE-SHIPPER PACKED FIELDS WITH THE VALUES */
                     /* ON THE LOAD                                         */
                     if available LBAbsShp then do:
                        assign
                           substring(LBAbsShp.abs__qad01, 1,20)
                              = string(LoadM.ShipVia,"x(20)")
                           substring(LBAbsShp.abs__qad01,21,20)
                              = string(LoadM.FOB,"x(20)")
                           substring(LBAbsShp.abs__qad01,41,20)
                              = string(LoadM.CarrierRef,"x(20)")
                           substring(LBAbsShp.abs__qad01,61,20)
                              = string(LoadM.TransMode,"x(20)")
                           substring(LBAbsShp.abs__qad01,81,20)
                              = string(LoadM.VehicleID,"x(20)")
                           substring(LBAbsShp.abs__qad01,101,20)
                              = string(LoadM.PaymentType,"x(20)")
                           substring(LBAbsShp.abs__qad01,121,20)
                              = string(LoadM.CarrierAccount,"x(20)").
 
                        for each absc_det where absc_domain = global_domain
                           and absc_abs_id = "LOAD" + LoadM.LoadNbr
                        no-lock:
                           create LBAbscDet.
                           buffer-copy absc_det except oid_absc_det to LBAbscDet
                              assign
                                 LBAbscDet.absc_abs_id = LBAbsShp.abs_id.
                        end.
                     end.
 
                     release LoadM.
                  end.
               end.
 
            end. /* pack_nbr = "" */
 
            else do:
               find LBAbsShp where LBAbsShp.abs_domain = global_domain
                  and LBAbsShp.abs_shipfrom = qad_charfld[12]
                  and LBAbsShp.abs_id = "p" + pack_nbr no-lock no-error.
               if available LBAbsShp then
                  abs_recno = recid(LBAbsShp).
               else do:
                  errors = yes.
                  return.
               end.
            end.
 
         end. /* WAVE PICKING */
 
         /* STANDARD PICKING */
         else do:
 
            /* CREATE STAGE LIST HEADER RECORD */
            {us/bbi/gprun.i ""sosob.p""
               "(input so_recno,
                 input sod_recno,
                 input qad_recno,
                 output pack_nbr,
                 output abs_recno,
                output proc_error)"}
            if proc_error
            then do:
               errors = yes.
               return.
            end. /* IF proc_error */
 
         end. /* STANDARD PICKING */
 
         if abs_recno <> ? then
            last_ship_recid = abs_recno.
 
         /* SET NEW WEIGHT */
         if available pt_mstr and wght_um <> "" then do:
            /* REPLACED SECOND INPUT PARAMETER FROM pt_um TO pt_net_wt_um */
            {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                           &HANDLE=ph_gpumxr
                           &PARAM="(input pt_part,
                                    input pt_net_wt_um,
                                    input wght_um,
                                    output weight_conv)"
                           &NOAPPERROR=True
                           &CATCHERROR=True}
            if weight_conv = ? then weight_conv = 1.
         end.
         else
            weight_conv = 1.
 
         /* SET NEW VOLUME */
         if available pt_mstr and vol_um <> "" then do:
            /* REPLACED SECOND INPUT PARAMETER FROM pt_um TO pt_size_um */
            {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                           &HANDLE=ph_gpumxr
                           &PARAM="(input pt_part,
                                    input pt_size_um,
                                    input vol_um,
                                    output trans_conv)"
                           &NOAPPERROR=True
                           &CATCHERROR=True}
            if trans_conv = ? then trans_conv = 1.
         end.
         else
            trans_conv = 1.
 
         if available pt_mstr and qad_decfld[1] > 0 then
            assign
               total_weight = qad_decfld[1] * pt_net_wt / weight_conv
               total_volume = qad_decfld[1] * pt_size   / trans_conv.
 
         if qad_decfld[1] > 0 then
            total_lines = 1.
      end.
 
      /* SAVE THE SHIPPER COUNTER FOR SEQUENCE PROCESSING */
      prev_shipper_count = curr_shipper_count.
 
      /* HANDLE PAGE NUMBER LOGIC */
      if  ( break_order or break_wtvoln )
      and not first_one
      then
         assign
            break_wtvoln = false
            pages = page-number.
      else
         assign
            break_wtvoln = false
            first_one = false
            pages     = page-number - 1.
 
      page.
 
      /* PRINT DOCK AND LINE FEED FROM SEQ. SCHEDULE */
      if using_seq_schedules and
         so_seq_order and
         can-find (first rcsd_wrk where
         wrk_summ_qad_wkfl_recid = recid(qad_wkfl))
      then do:
         for first rcsd_wrk where wrk_summ_qad_wkfl_recid = recid(qad_wkfl)
         no-lock: end.
         if available(rcsd_wrk) then
            display
               wrk_dock
               wrk_line_feed
            with frame d2.
            /*grc338*/ {us/xf/xfsol09mw.i}
      end.  /* if using_seq_schedules */
 
   end. /* IF TOTAL_WEIGHT ... */
   else
   if first-of(qad_charfld[7]) and
      qad_decfld[1] = 0        and
      not consolidate_ok
   then do:
 
      pack_nbr = "".
 
      /* HANDLE PAGE NUMBER LOGIC */
      if  break_order
      and not first_one
      then
         pages = page-number.
      else
         assign
            first_one = false
            pages = page-number - 1.
 
      page.
   end. /* IF FIRST-OF(QAD_CHARFLD[7]) */
 
   /* RE-INITIALISE QTY VARIABLES AT NEW SALES ORDER AND ORDER LINE */
   if (old_sod_nbr <> sod_nbr)
      or (first-of(integer(qad_charfld[8])))
   then
      assign
         l_qty_open      = 0
         l_temp_disp_qty = 0
         l_accum_qty     = 0
         l_container     = no
         l_skip          = no.
 
   /* HANDLE NEW SALES ORDER LINE */
 
   if first-of(integer(qad_charfld[8]))
      or new_page
      or old_pack_nbr <> pack_nbr
   then do:
 
      for first b_abs_mstr
         where recid(b_abs_mstr) = abs_recno
      no-lock:
      end. /* FOR FIRST b_abs_mstr */
 
      /*PRINT HEADER COMMENTS IF A NEW ORDER */
      if old_sod_nbr <> sod_nbr then do:
 
         /*grc338*/        {us/xf/xfsol09m0.i}
         /* PRINT PACK LIST COMMENTS */
         if pack_cmmt_print then do:
        /*grc338    {us/gp/gpcmtprt.i &type=PA &id=so_cmtindx &pos=3} */
        /*grc338*/    {us/xf/xfcmtprt.i &type=PA &id=so_cmtindx &rectype=A}
         end. /* IF PACK_CMMT_PRINT */
 
         /* COUNT LINES FOR SHIPPER */
         if pack_cmmt_include then do:
 
            for each cmt_det where cmt_det.cmt_domain = global_domain
               and cmt_indx = so_cmtindx
               and lookup("PA",cmt_print) > 0
            no-lock:
               do i = 1 to 15:
                  if cmt_cmmt[i] <> ""
                     and qad_decfld[1] <> 0
                  then
                     total_lines = total_lines + 1.
               end.
            end.
 
         end. /* IF PACK_CMMT_INCLUDE */
         /*grc338*/      {us/xf/xfsol09m2.i}
 
         display
            so_nbr
            so_ord_date
            so_ship_po
            string(substring(b_abs_mstr.abs__qad01,1,20), "x(20)")
                   when available b_abs_mstr @ so_shipvia
            so_shipvia when not available b_abs_mstr
         with frame d1.
 
      end. /* IF OLD_SOD_NBR <> SOD_NBR */
 
      /* HANDLE CASE WHERE SALES ORDER IS SAME BUT NEW PACK LIST */
      else if pack_nbr <> old_pack_nbr then do:
 
         display
            so_nbr
            so_ord_date
            so_ship_po
            string(substring(b_abs_mstr.abs__qad01,1,20), "x(20)")
                   when available b_abs_mstr @ so_shipvia
            so_shipvia when not available b_abs_mstr
         with frame d1.
      end.
 
      if pack_nbr <> old_pack_nbr then
        new_shipper = true.
 
      assign
         old_sod_nbr  = sod_nbr
         old_pack_nbr = pack_nbr
         new_page     = false
         desc1        = sod_desc
         desc2        = ""
         location     = ""
         rev          = "".
 
      /* PREPARE PRINT DETAIL */
      find pt_mstr  where pt_mstr.pt_domain = global_domain
         and pt_part = sod_part
      no-lock no-error.
 
      if available pt_mstr then do:
         if desc1 = "" then desc1 = pt_desc1.
         assign
            desc2 = pt_desc2
            rev = pt_rev.
      end.
 
      /*PRINT LINE*/
      if qad_decfld[4] = 0
      and qad_logfld[3] = no
      and (new_shipper
          or first-of(integer(qad_charfld[8])))
      then do:
 
      display
         sod_line
         sod_part
         sod_type
         sod_site @ lad_loc
      with frame d.
 
      down 1 with frame d.
 
      /* PRINT REVISION LEVEL */
      if rev <> "" then do:
         if page-size - line-counter < 1 then do:
            page.
            /*DISPLAY CONTINUED*/
            {us/so/sopkd01.i}
            down 1 with frame d.
         end.
         put rev-lbl at 5 rev skip.
      end. /* IF REV <> "" */
 
      /* PRINT DESCRIPTIONS */
      if desc1 <> "" then do:
         if page-size - line-counter < 1 then do:
            page.
            /*DISPLAY CONTINUED*/
            {us/so/sopkd01.i}
            down 1 with frame d.
         end.
         put desc1 at 1.
      end. /* IF DESC1 <> "" */
 
      if desc2 <> "" then do:
         if page-size - line-counter < 1 then do:
            page.
            /*DISPLAY CONTINUED*/
            {us/so/sopkd01.i}
            down 1 with frame d.
         end.
         put desc2 at 1.
      end.
 
      /* PRINT THE MEMO ITEM QUANTITY */
      if sod_type <> "" and sod_qty_all <> 0 then do:
         display
            (if l_create_um then
               sod_qty_all
            else
               sod_qty_all * sod_um_conv ) @ qty_open
            sod_qty_ship format ">>>>>9.9<<<" @ sod_due_date
         with frame d.
      end.
 
      /* PRINT CUSTOMER PART NUMBER */
      if sod_custpart <> "" then do:
         if page-size - line-counter < 1 then do:
            page.
            /*DISPLAY CONTINUED*/
            {us/so/sopkd01.i}
            down 1 with frame d.
         end.
         put cspart-lbl at 1 sod_custpart at 18.
      end.
 
      /* PUT CUSTOMER REFERENCE AND MODEL YEAR UNDERNEATH THE FORM STATEMENT */
      if (available sod_det) then do:
         if sod_custref <> "" and sod_custref <> sod_custpart then
            put {us/bbi/gplblfmt.i
                   &FUNC=getTermLabel(""CUSTOMER_REFERENCE"",18)
                   &CONCAT="':'"
                } at 1 sod_custref.
      end.
 
      if (available sod_det) then do:
         if sod_modelyr <> "" then
            put {us/bbi/gplblfmt.i
                   &FUNC=getTermLabel(""MODEL_YEAR"",15)
                   &CONCAT="':'"
                } at 1 sod_modelyr.
      end.
      /*grc338*/ {us/xf/xfsol09mb.i}
 
      /* PRINT LINE ITEM COMMENTS */
      if pack_cmmt_print then do:
      /*grc338   {us/gp/gpcmtprt.i &type=PA &id=sod_cmtindx &pos=5
            &command="{us/so/sopkd01.i} down 1 with frame d."} */
      /*grc338*/ {us/xf/xfcmtpr9.i &type=PA &id=sod_cmtindx &rectype=D}
      end. /* IF PACK_CMMT_PRINT */
 
      /* COUNT LINES FOR THE SHIPPER */
      if pack_cmmt_include then do:
         for each cmt_det
             where cmt_domain = global_domain
              and cmt_indx = sod_cmtindx
              and lookup("PA",cmt_print) > 0
         no-lock:
            do i = 1 to 15:
               if cmt_cmmt[i] <> ""
                  and qad_decfld[1] <> 0
               then
                  total_lines = total_lines + 1.
            end.
         end.
      end. /* IF PACK_CMMT_INCLUDE */
 
   end.
 
      /* PRINT SCHEDULE HEADER */
      if sod_sched then do:
 
         /* GET THE TOTAL SHIPPED FOR SCHEDULED ORDER LINES RELATED TO THIS */
         /* LINE AS DEFINED BY AN ITEM REPLACEMENT SCHEDULE.                */
         dTotalShipQty = 0.
         {us/px/pxrun.i &PROC='getCumShipQtyByOrderLineSet' &PROGRAM='sosodxr.p'
                  &HANDLE=ph_sosodxr
                  &PARAM="(input sod_nbr, input sod_line,
                           output dTotalShipQty)"
                  &NOAPPERROR=True
                  &CATCHERROR=True}
 
         /* PRINT SCHEDULE COMMENTS */
 
         if sod_sched
            and pack_cmmt_print
            and available sch_mstr
         then do:
            /*grc338 {us/gp/gpcmtprt.i &type=PA &id=sch_cmtindx &pos=5
               &command="{us/so/sopkd01.i} down 1 with frame d."} */
            /*grc338*/{us/xf/xfcmtpr9.i &type=PA &id=so_cmtindx &rectype=A}
         end. /* IF sod_sched */
 
         clear frame d no-pause.
 
         /* COUNT LINES FOR THE SHIPPER */
         if pack_cmmt_include
            and available sch_mstr
         then do:
            for each cmt_det
                where cmt_det.cmt_domain = global_domain and  cmt_indx =
                sch_cmtindx
                 and lookup("PA",cmt_print) > 0
               no-lock:
 
               do i = 1 to 15:
 
                  if cmt_cmmt[i] <> ""
                     and qad_decfld[1] <> 0
                  then
                     total_lines = total_lines + 1.
               end.
            end.
         end. /* IF PACK_CMMT_INCLUDE */
 
         if available sch_mstr
         then do:
            for first schd_det
               where schd_det.schd_domain                 = global_domain
               and   schd_type                            = sch_type
               and   schd_nbr                             = sch_nbr
               and   schd_line                            = sch_line
               and   schd_rlse_id                         = sch_rlse_id
               and   substring(schd_det.schd_fc_qual,3,1) = "y"
            no-lock:
               {us/rc/rcoqty.i}
            end. /* FOR FIRST schd_det */
            if not available schd_det
            then
               prior_cum_net_req = max(sch_pcr_qty - dTotalShipQty,0).
         end. /* IF AVAILABLE sch_mstr */
         else
            prior_cum_net_req = 0.
 
         if prior_cum_net_req > 0
            and so_cum_acct
         then do:
 
            qty_open = prior_cum_net_req - l_qty_open.
 
            if qty_open <> 0
            then do: 
               if page-size - line-counter < 1
               then do:
 
                  page.
                  /*DISPLAY CONTINUED*/
                  {us/so/sopkd01.i}
                  down 1 with frame d.
 
               end. /* IF page-size - line-counter < 1 */
 
               display
                  "" @ sod_line
                  "" @ sod_part
                  "" @ sod_type
                  "" @ lad_loc
                  "" @ lad_lot
                  qty_open
                  sod_um
                  sch_pcs_date when available sch_mstr @ sod_due_date
               with frame d.
               down 1 with frame d.
	       /*grc338*/    {us/xf/xfsol09mh.i}
            end. /* IF qty_open <> 0 */
         end. /* IF PRIOR_CUM_NET_REQ */
 
         /* PRINT SCHEDULE DETAIL */
 
         assign
            cum_all_qty = 0
            ship_cmplt  = if so_ship_cmplt = 0
                           then 100 else so_ship_cmplt.
 
         /* PRINT SEQUENCE QUANTITIES ON PRE-SHIPPER */
 
         if using_seq_schedules and
            so_seq_order and
            can-find (first rcsd_wrk where
            wrk_summ_qad_wkfl_recid = recid(qad_wkfl))
         then do:
                for first rcsd_wrk where
                     wrk_summ_qad_wkfl_recid = recid(qad_wkfl):
 
                    assign
                       l_wrk_cust_ref = wrk_cust_ref
                       l_wrk_date     = wrk_date.
                    run GetTotalQty(input wrk_shipfrom,
                                    input wrk_shipto,
                                    input wrk_rlse_id,
                                    input wrk_part,
                                    input curr_shipper_count,
                                    input wrk_order,
                                    output qty_open,
                                    output cust_ref_list
                                    ).
                 end.  /* back for each rcsd_wrk */
 
       if new_shipper or first-of(integer(qad_charfld[8]))
            then do:
 
            if new_shipper then
                new_shipper = false.
 
                    if page-size - line-counter < 1
                    then do:
                       page.
                      /*DISPLAY CONTINUED*/
                      {us/so/sopkd01.i}
                      down 1 with frame d.
                    end.
 
                    display
                      "" @ sod_line
                      "" @ sod_part
                      "" @ sod_type
                      "" @ lad_loc
                      "" @ lad_lot
                      qty_open
                      sod_um
                      l_wrk_date @ sod_due_date
                    with frame d.
                    down 1 with frame d.
 
                 for each rcsd_wrk where
                     wrk_order = sod_nbr and
                     wrk_line  = sod_line
                    break by wrk_cust_ref:
                 /* ADDED TO PRINT MULTIPLE SEQUENCES*/
 
                    if first-of(wrk_cust_ref)
                      and index( cust_ref_list, wrk_cust_ref ) > 0
                    then do:
                       display
                          "" @ sod_line
                          "" @ sod_part
                          "" @ sod_type
                          wrk_cust_ref @ lad_loc
                          "" @ lad_lot
                          "" @ qty_open
                          "" @ sod_um
                          "" @ sod_due_date
                       with frame d.
 
                       down 1 with frame d.
                    end.
                 end.
                 down 1 with frame d.
              /*grc338*/     {us/xf/xfsol09ms.i}
            end. /* if new_shipper */
         end.  /* if using_seq_schedules */
         else do:
            l_accum_qty = l_qty_open.
 
            if available sch_mstr
            then
               for each schd_det
                  where schd_det.schd_domain = global_domain
                  and   schd_type = sch_type
                  and   schd_nbr = sch_nbr
                  and   schd_line = sch_line
                  and   schd_rlse_id = sch_rlse_id
                  no-lock
                  break by schd_line:
 
                  if first-of(schd_line)
                  then
                     l_accum_qty = 0.
 
                  {us/rc/rcoqty.i}
 
                  /* Logic: Consider due_time only for schedules on due_date and
                         due_time1 only for schedules on the due_date1.
                         If the schedule is between the due_date and due_date1,
                         then ignore the times.
                         If the due_date and due_date1 coincide, then
                         consider both times to select schedules.
                         Some apparently redundant logic like
                         schd_date = due_date and schd_date < due_date1
                         is required to catch errors like due_date entered is
                         greater than the due_date1 */
 
                  if net_req <> 0
                     and ((schd_date = due_date and schd_date < due_date1
                     and schd_time >= due_time) or
                     (schd_date > due_date and schd_date < due_date1) or
                     (schd_date > due_date and schd_date = due_date1
                     and schd_time <= due_time1) or
                     (schd_date = due_date and schd_date = due_date1 and
                     schd_time >= due_time and schd_time <= due_time1))
                     and schd_reference >= ref and schd_reference <= ref1
                  then do:
                     if page-size - line-counter < 1
                     then do:
                        page.
                        /*DISPLAY CONTINUED*/
                        {us/so/sopkd01.i}
                        down 1 with frame d.
                     end. /* IF page-size - line-counter < 1 */
 
                     if l_accum_qty >= net_req
                     then
                        assign
                           l_temp_disp_qty = 0
                           l_accum_qty     = l_accum_qty - net_req.
                     else
                        if l_accum_qty > 0
                     then
                        assign
                           l_temp_disp_qty = net_req - l_accum_qty
                           l_accum_qty     = 0.
                     else
                        l_temp_disp_qty = net_req.
 
                     qty_open = l_temp_disp_qty.
 
                     display
                        "" @ sod_line
                        "" @ sod_part
                        "" @ sod_type
                        "" @ lad_loc
                        schd_reference @ lad_lot
                        qty_open
                        sod_um
                        schd_date @ sod_due_date
                        with frame d.
                        down 1 with frame d.
 
                     /*grc338*/ {us/xf/xfsol09mt.i}
                     /* PRINT COMMENTS */
 
                     if pack_cmmt_print
                     then do:
   /*grc338           {us/gp/gpcmtprt.i &type=PA &id=schd_cmtindx &pos=5
                        &command="{us/so/sopkd01.i} down 1 with frame d."} */
   /*grc338*/         {us/xf/xfcmtpr9.i &type=PA &id=so_cmtindx &rectype=A}
                     end. /* IF pack_cmmt_print */
 
                     /* COUNT LINES FOR THE SHIPPER */
                     if pack_cmmt_include
                        and available sch_mstr
                     then do:
                        for each cmt_det
                           where cmt_det.cmt_domain = global_domain
                           and   cmt_indx           = sch_cmtindx
                           and   lookup("PA",cmt_print) > 0
                           no-lock:
 
                           do i = 1 to 15:
                              if cmt_cmmt[i] <> ""
                                 and qad_decfld[1] > 0
                              then
                                 total_lines = total_lines + 1.
                           end. /* DO i = 1 to 15 */
                        end. /* FOR EACH cmt_det */
                     end. /* IF pack_cmmt_include */
 
                  end. /* IF net_req <> 0 */
 
               end. /* FOR EACH schd_det */
 
         end.  /* ELSE DO */
 
      end. /* IF SOD_SCHED */
 
      /* DISCRETE ORDER LINE */
      else do:
         for first fac_ctrl   where
         fac_ctrl.fac_domain = global_domain no-lock:
         end. /* FOR FIRST FAC_CTRL */
 
         /* DETERMINE THE OPEN QUANTITY */
         {us/op/openqty.i}
 
         if sod_cfg_type = "2" and
            (available fac_ctrl and fac_so_rec = yes)
         then
            qty_open = if l_create_um
                       then
                          open_qty
                       else
                          open_qty * sod_um_conv.
         else do:
 
            /* ACCUMULATE QTY IF SO LINE IS ALLOCATED/PICKED FROM    */
            /* MULTIPLE LOCATIONS/LOT/SERIAL/REFERENCES              */
            tot_qad_decfld = 0.
            for each tmp_wkfl where tmp_wkfl.qad_domain = global_domain
               and tmp_wkfl.qad_key1 = SessionUniqueID + global_db + "stage_list"
               and tmp_wkfl.qad_charfld[6] = qad_wkfl.qad_charfld[6]   /* SHIP-TO */
               and tmp_wkfl.qad_charfld1[8] = qad_wkfl.qad_charfld1[8] /* LOADNBR */
               and tmp_wkfl.qad_decfld[5] = qad_wkfl.qad_decfld[5]     /* DROPOFFSEQ */
               and tmp_wkfl.qad_charfld1[9] = qad_wkfl.qad_charfld1[9] /* CARRIERREF */
               and tmp_wkfl.qad_charfld1[5] = qad_wkfl.qad_charfld1[5] /* SHIPVIA */
               and tmp_wkfl.qad_charfld[7] = qad_wkfl.qad_charfld[7]   /* ORDER */
               and tmp_wkfl.qad_charfld[8] = qad_wkfl.qad_charfld[8]   /* LINE */
            no-lock:
 
               if not tmp_wkfl.qad_logfld[1]
               then
                  assign
                     tot_qad_decfld[1] = tot_qad_decfld[1] +
                                         tmp_wkfl.qad_decfld[1]
                     tot_qad_decfld[3] = tot_qad_decfld[3] +
                                         tmp_wkfl.qad_decfld[3].
 
            end. /* FOR EACH TMP_WKFL */
 
            /* CALCULATE QTY_OPEN BASED ON ACCUMULATED QTY */
 
            if tot_qad_decfld[1] = tot_qad_decfld[3] then do:
               /* check if the item is used in serialization */
               {us/px/pxrun.i &PROC = 'isItemWithSerialID'
                        &PROGRAM='pasexr.p'
                        &HANDLE = ph_pasexr
                        &PARAM = "(input sod_part,
                                   output tIsItemWithSerialID)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
               if tIsItemWithSerialID and
                  lookup(execname, tNoPickingMenu) > 0 
               then do:
                  /* For item used for serialization, do not add
                   * tot_qad_decfld[1] because nothing has been moved to 
                   * qty picked. Therefore open_qty calculated in openqty.i
                   * is the correct open qty. 
                   */
                  qty_open = if l_create_um
                             then
                                open_qty 
                             else
                                open_qty * sod_um_conv .
               end.
               else do:
                  qty_open = if l_create_um
                             then
                                open_qty + tot_qad_decfld[1] / sod_um_conv
                             else
                                open_qty * sod_um_conv + tot_qad_decfld[1].
               end.
            end.
            else
               qty_open = if l_create_um
                          then
                             open_qty
                          else
                             open_qty * sod_um_conv .
         end.
 
         display
            "" @ sod_line
            "" @ sod_part
            "" @ sod_type
            "" @ lad_loc
            "" @ lad_lot
            qty_open
            qad_charfld[10] @ sod_um
            sod_due_date
         with frame d.
         down 1 with frame d.
         /*grc338*/   {us/xf/xfsol09mu.i}
      end.
 
   end. /* IF FIRST-OF QAD_CHARFLD[8] (SALES ORDER LINE) */
 
   /* IF STAGE QUANTITY THEN CREATE A RECORD */
   if qad_decfld[1] <> 0
      or ({us/wh/whgpwhon.i} and sod_cfg_type = "2") /* KIT PARENT WITH WMS ACTIVE */
   then do:
 
      qad_recno = recid(qad_wkfl).
      /* CREATE STAGE LIST LINE RECORD */
      {us/bbi/gprun.i ""sosob1.p""
         "(input qad_recno,
           input abs_recno,
           input abs_recno,
           output line_recno)"}
 
      if page-size - line-counter < 1 then do:
         page.
         /*DISPLAY CONTINUED*/
         {us/so/sopkd01.i}
         down 1 with frame d.
      end.
 
      /* ADDED FOLLOWING CONDITONAL DO STATEMENT */
      /* DISPLAY FOR REGULAR ITEMS AND ATO CONFIGURED PRODUCTS */
      /* NOT A MEMO ITEM */
      if (not can-find(first sob_det       /* NO SALES ORDER BILL     */
                        where sob_domain = global_domain
                          and (sob_nbr = sod_nbr
                         and sob_line = sod_line))
      or (can-find(first sob_det      /* SALES ORDER BILL EXISTS */
                         where sob_domain = global_domain
                           and (sob_nbr = sod_nbr
                          and sob_line = sod_line))
             and (sod_cfg_type = "1"         /* ASSEMBLE-TO-ORDER */
             or sod_fa_nbr <> "")))          /* FINAL ASSEMBLY ORDER   */
      then do:
 
         /* DISPLAY WORK ORDER NUMBER */
         if qad_charfld[15] <> "" and sod_fa_nbr <> "" then do:
            /* NOW STORING wo_nbr IN qad_user1 WHEN BUILDING qad_wkfl TO AVOID  */
            /* DB SWITCHING AND EXTRA LOOKUP OF wo_mstr AT THIS TIME            */
            if qad_user1 <> "" then do:
               if page-size - line-counter < 1 then do:
                  page.
                  /*DISPLAY CONTINUED*/
                  {us/so/sopkd01.i}
                  down 1 with frame d.
               end.
               put getTermLabelRtColon("WORK_ORDER",3)
                  + qad_user1 format "x(22)" at 35.
            end. /* IF AVAILABLE WO_MSTR */
         end.
 
         /* LOCATION AND LOT OR CONTAINER NUMBER */
         if qad_logfld[3] = no then do:
 
            tot_loclotref_qty = 0.
 
            if using_seq_schedules and
               so_seq_order and
            can-find (first rcsd_wrk where
               wrk_summ_qad_wkfl_recid = recid(qad_wkfl)) and
              (qad_charfld[4] <> "" or qad_charfld[9] <> "" or qad_charfld[5] <> "" )
            then
            /* PRINT DETAILS FROM SEQUENCE WORK-FILE */
            for each rcsd_wrk where
               wrk_summ_qad_wkfl_recid = recid(qad_wkfl)
            break by wrk_uniqkey:
 
               tot_loclotref_qty = tot_loclotref_qty + wrk_qty.
 
               if last-of(wrk_uniqkey)
               then do:
 
                  run print_line_detail
                     (input "",
                      input wrk_charfld[3],
                      input wrk_charfld[4],
                      input wrk_charfld[5],
                      input wrk_charfld[9],
                      input wrk_charfld[10],
                      input wrk_charfld[11],
                      input wrk_charfld[15],
                      input tot_loclotref_qty,
                      input sod_sched,
                      input sod_contr_id,
                      input sod_um_conv,
                      input l_container ,
                      input-output l_skip).
 
                  down 1 with frame d.
                  tot_loclotref_qty = 0.
 
               end.
 
               assign wrk_log = yes.
 
            end.  /* for each rcsd_wrk */
 
            else do:
 
               if first-of (qad_charfld[9])
                  and (qad_charfld[9] <> "")
               then do:
                  l_container = yes.
                  display
                     getTermLabelRtColon("CONTAINER",5) +
                                        substring(qad_charfld[9],2)
                                        format "x(13)" /* CONTAINER */
                                        @ lad_lot
                  with frame d.
                  down 1 with frame d.
               end. /* IF (qad_charfld[9] <> "") */
 
               qad_wkfl.qad_logfld[1] = yes.
 
               run print_line_detail
                  (input qad_charfld[2],
                   input qad_charfld[3],
                   input qad_charfld[4],
                   input qad_charfld[5],
                   input qad_charfld[9],
                   input qad_charfld[10],
                   input qad_charfld[11],
                   input qad_charfld[15],
                   input qad_decfld[1],
                   input sod_sched,
                   input sod_contr_id,
                   input sod_um_conv,
                   input l_container,
                   input-output l_skip).
 
               l_qty_open = l_qty_open + qad_wkfl.qad_decfld[1].
 
            end. /* ELSE DO */
 
         end.
 
         down 1 with frame d.
 
      end. /* IF SOD_TYPE = "" */
 
   end. /* if qad_charfld[1] */
 
   /*PRINT OPTIONS FOR ASSEMBLE-TO-ORDER ITEMS */
   if print_options
      and qad_decfld[1] <> 0
      and can-find(first sob_det
                   where sob_det.sob_domain = global_domain
                   and   sob_nbr  = so_nbr
                   and   sob_line = sod_line)
                   and sod_cfg_type = "1"
   then do:
 
      for first sob_det where sob_det.sob_domain = global_domain
         and sob_nbr  = sod_nbr
         and sob_line = sod_line
      no-lock: end.
 
      /* INSTEAD OF DIRECTLY CALLING SOPKG01.P, CALL SOPKG01.P THROUGH */
      /* THE WRAPPER PROGRAM SOPKG01A.P                                */
/*grc338      {us/bbi/gprun.i ""sopkg01a.p"" */
/*grc338*/      {us/bbi/gprun.i ""xfpkg09a.p""
         "(input """",
           input 0,
           input sod_nbr,
           input sod_line)"}
 
   end. /* IF PRINT OPTIONS */
 
   /* LAST OF SALES ORDER LINE */
   if last-of((integer(qad_charfld[8]))) then do:
 
      /* PRINT AND PROCESS COMPONENTS */
      if qad_decfld[1] <> 0
      then
         find first tmp_wkfl
             where tmp_wkfl.qad_domain = global_domain and  tmp_wkfl.qad_key1 =
             SessionUniqueID + global_db + "stage_component"
              and tmp_wkfl.qad_key2 begins sod_nbr + "," + string(sod_line) + ","
              and tmp_wkfl.qad_key3 = sod_nbr
              and tmp_wkfl.qad_key4 = string(sod_line)
         no-lock no-error.
 
      /* COMPONENT RECORDS TO PROCESS */
      if available tmp_wkfl then do:
 
         for each tmp_wkfl exclusive-lock
            where tmp_wkfl.qad_domain = global_domain
              and  tmp_wkfl.qad_key1 = SessionUniqueID + global_db + "stage_component"
              and tmp_wkfl.qad_key2 begins sod_nbr + "," + string(sod_line) + ","
              and tmp_wkfl.qad_key3 = sod_nbr
              and tmp_wkfl.qad_key4 = string(sod_line)
         break by tmp_wkfl.qad_key5
               by tmp_wkfl.qad_key6:
 
            comp_part = tmp_wkfl.qad_key6.
 
            /* FIRST OF COMPONENT ITEM */
            if first-of(tmp_wkfl.qad_key6) then do:
 
               /* PREPARE PRINT DETAIL */
               find pt_mstr  where pt_mstr.pt_domain = global_domain and
               pt_part = comp_part no-lock no-error.
 
               if available pt_mstr then
                  assign
                     desc1  = pt_desc1
                     desc2  = pt_desc2
                     rev    = pt_rev
                     sob_um = pt_um.
               else
                  assign
                     desc1  = ""
                     desc2  = ""
                     rev    = ""
                     sob_um = "".
 
               l_line = 1.
               if rev <> "" then
                  l_line = l_line + 1.
               if desc1 <> "" then
                  l_line = l_line + 1.
               if desc2 <> "" then
                  l_line = l_line + 1.
 
               /* PRINT PART INFORMATION */
               if page-size - line-counter <= l_line
               then do:
                  page.
                  /*DISPLAY CONTINUED*/
                  {us/so/sopkd01.i}
                  down 1 with frame d.
               end. /* IF PAGE-SIZE - LINE-COUNT <= L_LINE THEN DO */
 
               display with frame d.
               put comp_part at 7 skip.
 
               /* PRINT REVISION LEVEL */
               if rev <> "" then do:
                  if page-size - line-counter < 1 then do:
                     page.
                     /*DISPLAY CONTINUED*/
                     display with frame d.
                     put comp_part at 7 cont_lbl at 35 skip.
                  end.
                  put rev-lbl at 7 rev skip.
               end. /* IF REV <> "" */
 
               /* PRINT DESCRIPTIONS */
               if desc1 <> "" then do:
                  if page-size - line-counter < 1 then do:
                     page.
                     /*DISPLAY CONTINUED*/
                     display with frame d.
                     put comp_part at 7 cont_lbl at 35 skip.
                  end.
                  put desc1 at 7.
               end. /* IF DESC1 <> "" */
 
               if desc2 <> "" then do:
                  if page-size - line-counter < 1 then do:
                     page.
                     /*DISPLAY CONTINUED*/
                     display with frame d.
                     put comp_part at 7 cont_lbl at 35 skip.
                  end.
                  put desc2 at 7.
               end.
 
            end. /* first-of tmp_wkfl.qad_key6 (COMPONENT ITEM) */
 
            /* LOCATION AND LOT */
            display
               "" @ sod_line
               "" @ sod_part
               "" @ sod_type
               "" @ lad_loc
               "" @ lad_lot
               tmp_wkfl.qad_charfld[3] @ lad_loc
               tmp_wkfl.qad_charfld[4] @ lad_lot column-label "Lot/Serial!Ref"
            with frame d.
 
            if available pt_mstr then
               display
                  pt_um @ sod_um
               with frame d.
 
/*grc338*/   {us/xf/xfsol09mv.i}
            /* PRINT REFERENCE AND QUANTITY */
            if tmp_wkfl.qad_charfld[5] = ""
            then do:
 
               display
                  tmp_wkfl.qad_decfld[1] @ qty_open
                  "(      )"             @ sod_due_date
               with frame d.
 
/*grc338*/   put stream ft tmp_wkfl.qad_decfld[1] at 30
                   format "->>>>>>>>9.999999999".
               if sod_sched and sod_contr_id <> " " then do:
                  down 1 with frame d.
                  put getTermLabelRtColon("PO_NBR",8)
                     at 5 sod_contr_id.
/*grc338*/   put stream ft sod_contr_id at 50 format "x(30)" skip.
               end. /* IF SOD_SCHED */
 
            end. /* IF TMP_WKFL.QAD_CHARFLD[5] */
 
            else do:
/*grc338*/   {us/xf/xfsol09mm.i}
               down 1 with frame d.
 
               display
                  tmp_wkfl.qad_charfld[5] format "x(8)" @ lad_lot
                  tmp_wkfl.qad_decfld[1] @ qty_open
                  "(      )"             @ sod_due_date
               with frame d.
 
               if sod_sched and sod_contr_id <> "" then do:
                  down 1 with frame d.
                  put getTermLabelRtColon("PO_NBR",8)
                     at 5 sod_contr_id.
/*grc338*/      put stream ft sod_contr_id at 50 format "x(30)" skip.
               end. /* IF SOD_SCHED */
 
            end. /* else do */
 
            down 1 with frame d.
 
            /* FIND SHIPPER FOR THE SALES ORDER LINE */
            /* CREATE SHIPPER (abs_mstr) RECORD */
            {us/bbi/gprun.i ""sosob1.p""
               "(input recid(tmp_wkfl),
                 input abs_recno,
                 input line_recno,
                 output comp_recno)"}
 
            /* DELETING TMP_WKFL RECORD */
            {us/bbi/gprun.i ""sosl0101.p"" "(input recid(tmp_wkfl))"}
 
         end. /* for each tmp_wkfl - KIT COMPONENTS */
 
      end. /* if component records to process */
 
      /* LAST OF SALES ORDER LINE */
      if last-of(integer(qad_wkfl.qad_charfld[8])) then
         down 1 with frame d.
 
      /* display num of packs */
      empty temp-table ttPackToPick no-error.
         /* Convert SO Line UM to inventory UM */
         inv_ord_qty = sod_det.sod_qty_ord * sod_det.sod_um_conv.
 
         {us/px/pxrun.i
            &PROC  ='calculateNumOfPacksByType'
            &PROGRAM = 'pabpsxr.p'
            &PARAM = "(input sod_det.sod_part,
                input sod_det.sod_part,
                input sod_det.sod_site,
                input """",
                input inv_ord_qty,
                input """",
                input 0,
                input 'ISS-SO',
                input-output table ttPackToPick by-reference)"
            &NOAPPERROR = true
            &CATCHERROR = true}
 
      for each ttPackToPick no-lock 
         with frame np width 132 down no-box:
         setFrameLabels(frame np:handle).
         display
            fPack @ pckc_pack_code colon 35
            fPackNum column-label "Number".
         down 1.
	 /*grc338*/   {us/xf/xfsol09mn.i}
      end. /*ttPackToPick*/
 
      /* IF THERE OLDER REPLACEMENT ITEMS DEFINED FOR THE PART ON */
      /* THE SALES ORDER LINE, AND THOSE REPLACEMENT PARTS HAVE   */
      /* AVAILABLE INVENTORY, PRINT THE REPLACEMENT PARTS AND THE */
      /* SITE/LOCATIONS WHERE THE INVENTORY EXISTS.               */
      {us/px/pxrun.i &PROC='getAvailInvQtyForRepItems' &PROGRAM='ppptrexr.p'
               &HANDLE=ph_ppptrexr
               &PARAM="(input sod_part, input sod_site, input so_ship,
                        input so_cust, input so_sched,
                        output table tt_rep_item_avail_qty)"
               &NOAPPERROR=True
               &CATCHERROR=True}
 
      for each tt_rep_item_avail_qty no-lock:
         display
            tt_rep_item_part
            tt_rep_item_site
            tt_rep_item_loc
            tt_rep_item_status
            tt_rep_item_qty_avail
         with frame repl_item_inventory.
         down 1 with frame repl_item_inventory.
      end.
 
      /* DELETING QAD_WKFL RECORD */
      {us/bbi/gprun.i ""sosl0101.p"" "(input recid(qad_wkfl))"}
 
   end. /* last of integer(qad_charfld[8]) - sales order line */
   if  (last-of (qad_wkfl.qad_charfld[7]) 
        and break_order)
       or last-of (qad_wkfl.qad_charfld[6])  
   then
      if use-log-acctg  
      then do:
         for first abs_mstr 
            where RECID (abs_mstr) = abs_recno 
         no-lock :
         end.
         if available abs_mstr 
         then do:
            run maintainLogAcctDetail(input abs_mstr.abs_id , 
                                      input abs_mstr.abs_shipfrom,
                                      input {&TYPE_SOPreShipper},
                                      output l_UpdateLogSupplier).
            if l_UpdateLogSupplier
            then do:
               {us/bbi/gprun.i ""lacamts.p""
                  "(input global_domain,
                    input '',
                    input substring(abs_mstr.abs_id,2),
                    input {&TYPE_SOPreShipper},
                    input abs_mstr.abs_shipfrom)"}.  
            end. /* IF l_UpdateLogSupplier */
         end. /* IF AVAILABLE abs_mstr */
      end. /* use-log-acctg */  
   proc_error = no.
 
end. /* PRINT_LINES */
 
if proc_error then do:
   errors = yes.
   return.
end.
 
/* PRINT SEQUENCE LIST ONE LAST TIME IN CASE OF NO PREVIOUS BREAKS */
if using_seq_schedules then do:
 
   sequence_list = getTermLabel("BANNER_SEQUENCE_PACKING_LIST",36).
 
   {us/gp/gprunmo.i
      &program = ""sosob2.p""
      &module = "ASQ"
      &param = """(input abs_recno,
                   input-output pages)"""}
 
   sequence_list = "".
   page-number = 0.
 
   /* DELETE SEQUENCE WORK-FILE RECORDS */
   for each rcsd_wrk
   exclusive-lock:
      delete rcsd_wrk.
   end.  /* for each rcsd_wrk */
 
end.  /* if using_seq_schedules */
 
{us/bbi/gprun.i ""sosl01a.p"" "(input last_ship_recid,
                         input due_date,
                         input due_date1,
                         input due_time,
                         input due_time1,
                         input ref,
                         input ref1,
                         output errors)"}
 
{us/rc/rcinvcon.i}
 
PROCEDURE print_line_detail:
   define input parameter in_qad_charfld_2  as character no-undo.
   define input parameter in_qad_charfld_3  as character no-undo.
   define input parameter in_qad_charfld_4  as character no-undo.
   define input parameter in_qad_charfld_5  as character no-undo.
   define input parameter in_qad_charfld_9  as character no-undo.
   define input parameter in_qad_charfld_10 as character no-undo.
   define input parameter in_qad_charfld_11 as character no-undo.
   define input parameter in_qad_charfld_15 as character no-undo.
   define input parameter in_qad_decfld_1   as decimal no-undo.
   define input parameter in_sod_sched      like sod_sched no-undo.
   define input parameter in_sod_contr_id   like sod_contr_id no-undo.
   define input parameter in_sod_um_conv    like sod_um_conv no-undo.
   define input parameter p_container       like mfc_logical no-undo.
 
   define input-output parameter p_skip     like mfc_logical no-undo.
 
   if p_container
      and not (can-find (first abs_mstr
                        where abs_domain = global_domain
                        and   abs_item   = in_qad_charfld_2
                        and   abs_loc    = in_qad_charfld_3
                        and   abs_lot    = in_qad_charfld_4
                        and   abs_ref    = in_qad_charfld_5
                        and   abs_id begins("ic")
                        and   abs_type = "s"))
       and p_skip = no
   then do:
      display with frame d.
      put skip.
      p_skip = yes.
   end. /* IF p_container AND ... */
 
   display
      in_qad_charfld_3    when (in_qad_charfld_15 = "")
                          @ lad_loc
      in_qad_charfld_4    when ( /* LOT */ in_qad_charfld_15 = "")
                          @ lad_lot
                          column-label "Lot/Serial!Ref"
      getTermLabel("ID",3) + ":" + in_qad_charfld_15 /* FA ID     */
                          format "x(12)"
                          when (in_qad_charfld_15 <> "")
                          @ lad_lot
   with frame d.
/*grc338*/   {us/xf/xfsol09mq.i}
 
   if in_qad_charfld_5 = "" then do:
 
      display
         (if in_qad_charfld_9 <> ""  then
            in_qad_decfld_1 / decimal(in_qad_charfld_11)
         else
         if l_create_um then
            in_qad_decfld_1 / in_sod_um_conv
         else
            in_qad_decfld_1 ) @ qty_open
         in_qad_charfld_10   when (in_qad_charfld_9 <> "")
         @ sod_um
         "(      )"          @ sod_due_date
      with frame d.
 
      if in_sod_sched and in_sod_contr_id <> "" then do:
         down 1 with frame d.
         put getTermLabelRtColon("PO_NBR",8)
            at 5 in_sod_contr_id.
      end. /* IF SOD_SCHED */
      /*grc338*/   {us/xf/xfsol09m9.i}
   end. /* IF QAD_CHAR[5] = "" */
 
   else do:
 
      down 1 with frame d.
 
      /* REFERENCE */
      display
         in_qad_charfld_5        format "x(8)"
         @ lad_lot
 
         /* FOR CONTAINER ITEMS DISPLAY THE QTY AND UM IN TERMS   */
         /* OF CONTAINER ITEM UM, ELSE DISPLAY IN INVENTORY UM OR */
         /* SO UM DEPENDING ON THE L_CREATE_UM FLAG .             */
 
         (if in_qad_charfld_9 <> ""  then
            in_qad_decfld_1 / decimal(in_qad_charfld_11)
         else
         if l_create_um then
            in_qad_decfld_1 / in_sod_um_conv
         else
            in_qad_decfld_1 ) @ qty_open
         in_qad_charfld_10   when (in_qad_charfld_9 <> "")
         @ sod_um
         "(      )" @ sod_due_date
      with frame d.
 
      if in_sod_sched then do:
         down 1 with frame d.
         put getTermLabelRtColon("PO_NBR",8)
            at 5 in_sod_contr_id.
      end. /* IF SOD_SCHED */
      /*grc338*/   {us/xf/xfsol09m9a.i}
   end.    /* else do */
 
   {us/px/pxrun.i &PROC='getSOLineProfile'
                  &PROGRAM='capfxr.p'
                  &HANDLE=ph_capfxr
                  &PARAM="(input sod_det.sod_nbr,
                           input sod_det.sod_line,
                           output table tt_attrpf_mstr by-reference,
                           output table tt_attrpfd_det by-reference)"
                  &NOAPPERROR=true
                  &CATCHERROR=true
   }
 
   if can-find(first tt_attrpf_mstr) then do:
      {us/px/pxrun.i &PROC='getConformingLabelForInvAttrSpecByKeys'
                     &PROGRAM='caisxr.p'
                     &HANDLE=ph_caisxr
                     &PARAM="(input 0.0,
                              input sod_part,
                              input sod_site,
                              input in_qad_charfld_3,
                              input in_qad_charfld_4,
                              input in_qad_charfld_5,
                              input sod_det.sod_nbr,
                              input sod_det.sod_line,
                              output conformingLabel)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
      }
 
      down 1 with frame d.
      display
         conformingLabel @ lad_lot
      with frame d.
   end.
 
   for first b_qad where b_qad.qad_domain = global_domain
      and b_qad.qad_key1 = qad_wkfl.qad_key1
      and b_qad.qad_key2 = "s" + qad_wkfl.qad_key2
   exclusive-lock:
      assign
         b_qad.qad_logfld[3] = yes.
   end.
 
END PROCEDURE.  /* print_line_detail */
 
PROCEDURE GetTotalQty:
 
   define input parameter ip_wrk_shipfrom like wrk_shipfrom no-undo.
   define input parameter ip_wrk_shipto like wrk_shipto no-undo.
   define input parameter ip_wrk_rlse_id like wrk_rlse_id no-undo.
   define input parameter ip_wrk_part like wrk_part no-undo.
   define input parameter ip_shipper_count like qad_key2 no-undo.
   define input parameter ip_wrk_order like wrk_order no-undo.
   define output parameter op_qty_open like qty_open no-undo.
   define output parameter op_cust_ref_list like wrk_cust_ref no-undo.
 
   define buffer b_wrk_rcsd for rcsd_wrk.
   define buffer b_qad_wkfl for qad_wkfl.
 
   for each b_qad_wkfl no-lock
      where b_qad_wkfl.qad_domain = global_domain
      and   b_qad_wkfl.qad_key1   = SessionUniqueID + global_db + "stage_list"
      and   b_qad_wkfl.qad_key2 begins "s" + ip_shipper_count 
                          + ","
                          + ip_wrk_order
      ,each b_wrk_rcsd 
         where b_wrk_rcsd.wrk_shipfrom = ip_wrk_shipfrom
         and b_wrk_rcsd.wrk_shipto     = ip_wrk_shipto
         and b_wrk_rcsd.wrk_rlse_id    = ip_wrk_rlse_id
         and b_wrk_rcsd.wrk_part       = ip_wrk_part
         and b_wrk_rcsd.wrk_log        = no
         and b_wrk_rcsd.wrk_summ_qad_wkfl_recid
                                       = recid(b_qad_wkfl):
 
         assign
            op_cust_ref_list = if(index(op_cust_ref_list , wrk_cust_ref ) = 0) 
	                       then
                                  ( op_cust_ref_list + "," + wrk_cust_ref )
                               else
                                  (op_cust_ref_list)
            op_qty_open      = op_qty_open + wrk_qty.
   end. /* FOR EACH b_qad_wkfl */
 
END PROCEDURE. /* GetTotalQty */
PROCEDURE maintainLogAcctDetail:
   /* THIS IS A LOCAL COPY OF THE PROCEDURE TAKEN FORM RCSHWB.p,
      ANY CHANGES HERE MUST BE MADE TO THE VERSION IN RCSHWB.p */
   define input parameter ipAbsId like abs_id no-undo.
   define input parameter ipShipFrom like abs_shipfrom no-undo.
   define input parameter ipShipperType as character no-undo.
   define output parameter opUpdateLogSupplier as logical no-undo.
   define variable l_FirstOrder like so_nbr no-undo.
   define variable l_FrTermsOnFirstOrder  like so_fr_terms no-undo.
   define buffer b1_abs_mstr for abs_mstr.
   for first b1_abs_mstr
       where b1_abs_mstr.abs_domain = global_domain
       and   b1_abs_mstr.abs_shipfrom = ipShipFrom
       and   b1_abs_mstr.abs_id = ipAbsId
   no-lock: end.
   if available b1_abs_mstr 
   then do:
      {us/gp/gprunmo.i  &module = "LA" &program = "lashex01.p"
                        &param  = """(buffer b1_abs_mstr,
                                      output l_FirstOrder,
                                      output l_FrTermsOnFirstOrder)"""}
 
      if l_FirstOrder <> "" 
         and l_FrTermsOnFirstOrder <> "" 
      then do:
         old_ft_type = l_FrTermsOnFirstOrder.
         /* CREATE AN LACD_DET FOR THE PRE-SHIPPER/SHIPPER IF ONE IS NOT */
         /* AVAILABLE.                                                   */
         {us/gp/gprunmo.i  &module = "LA" &program = "larcsh01.p"
                           &param  = """(input l_FirstOrder,
                                         input l_FrTermsOnFirstOrder,
                                         input '{&TYPE_SO}',
                                         input substring(b1_abs_mstr.abs_id,2),
                                         input b1_abs_mstr.abs_shipfrom,
                                         input ipShipperType)"""}
         /* RETURN A LOGICAL INDICATING THAT LACD_DET WILL BE AVAILABLE   */
         /* THIS WILL BE USED TO INVOKE A FRAME WHERE THE USER WILL BE    */
         /* ABLE TO UPDATE THE DEFAULT LOGISTICS SUPPLIER ON THE LACD_DET */
         find first ft_mstr where ft_domain = global_domain
                            and   ft_terms  = l_FrTermsOnFirstOrder
                            no-lock no-error.
         if available ft_mstr 
            and can-find(first lacd_det where lacd_domain            = global_domain
                                        and   lacd_internal_ref      = l_FirstOrder
                                        and   lacd_shipfrom          = b1_abs_mstr.abs_shipfrom
                                        and   lacd_lc_charge         = ft_lc_charge
                                        and   lacd_internal_ref_type = {&TYPE_SO}
                                        and   lacd_lc_amt            <> 0)
         then
            opUpdateLogSupplier = true.
      end. /* IF L_FIRSTORDER <> "" AND ... */
   end. /* IF AVAILABLE B1_ABS_MSTR ... */
   if (not available b1_abs_mstr) 
       or (l_FirstOrder = "" 
           or l_FrTermsOnFirstOrder = "")
   then do:
      /* DELETE LOGISTICS ACCTG CHARGE DETAIL IF IT EXISTS */
      {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                        &param  = """(input 'DELETE',
                                      input ipShipperType,
                                      input substring(ipAbsId,2),
                                      input ipShipFrom,
                                      input ' ',
                                      input ' ',
                                      input no,
                                      input no)"""}
   end. /* IF NOT AVAILABLE B1_ABS_MSTR OR ....*/
END PROCEDURE. /*maintainLogAcctDetail*/
