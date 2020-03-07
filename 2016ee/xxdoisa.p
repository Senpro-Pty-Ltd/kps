/* xxdoisa.p - DISTRIBUTION ORDER ISSUE SUBROUTINE                            */
/* dsdoisa.p - DISTRIBUTION ORDER ISSUE SUBROUTINE                            */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdoisa.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/* REVISION: 7.0      LAST EDIT: 01/27/92      MODIFIED BY: emb         */
/* REVISION: 7.0      LAST EDIT: 03/31/92      MODIFIED BY: emb *F225*  */
/* REVISION: 7.0      LAST EDIT: 06/08/92      MODIFIED BY: emb *F611*  */
/* REVISION: 7.0      LAST EDIT: 07/07/92      MODIFIED BY: emb *F810*  */
/* REVISION: 7.0      LAST EDIT: 09/29/92      MODIFIED BY: emb *G108*  */
/* REVISION: 7.0      LAST EDIT: 11/02/92      MODIFIED BY: emb *G259*  */
/* REVISION: 7.3      LAST EDIT: 06/11/92      MODIFIED BY: emb *GD41*  */
/* REVISION: 7.3      LAST EDIT: 12/14/93      MODIFIED BY: pxd *GH98*  */
/* REVISION: 7.3      LAST EDIT: 01/31/94      MODIFIED BY: qzl *GI58*  */
/* REVISION: 7.3      LAST EDIT: 02/15/94      MODIFIED BY: pxd *FL60*  */
/* REVISION: 7.3      LAST EDIT: 02/16/94      MODIFIED BY: qzl *FL85*  */
/* REVISION: 7.3      LAST EDIT: 03/02/94      MODIFIED BY: ais *FM54*  */
/* REVISION: 7.3      LAST EDIT: 04/18/94      MODIFIED BY: qzl *GJ45*  */
/* REVISION: 7.3      LAST EDIT: 09/06/94      MODIFIED BY: ais *FP87*  */
/* REVISION: 7.3      LAST EDIT: 10/06/94      MODIFIED BY: pxd *FR90*  */
/* REVISION: 7.3      LAST EDIT: 10/06/94      MODIFIED BY: ais *FR66*  */
/* REVISION: 7.3      LAST EDIT: 10/10/94      MODIFIED BY: pxd *FR07*  */
/* REVISION: 7.4      LAST EDIT: 04/10/95      MODIFIED BY: pxd *F0PZ*  */
/* REVISION: 7.3      LAST EDIT: 07/03/95      MODIFIED BY: emb *F0T4*  */
/* REVISION: 7.4    LAST MODIFIED: 10/24/96 BY: *H0NH* Julie Milligan   */
/* REVISION: 8.6    LAST MODIFIED: 03/15/97 BY: *K04X* Steve Goeke      */
/* REVISION: 8.6    LAST MODIFIED: 03/05/97 BY: *H0S5* Julie Milligan   */
/* REVISION: 8.6    LAST MODIFIED: 07/07/97 BY: *J1PS* Felcy D'Souza    */
/* REVISION: 8.5    LAST MODIFIED: 01/14/98 BY: *J29V* Santhosh Nair    */
/* REVISION: 8.6E   LAST MODIFIED: 02/23/98 BY: *L007* A. Rahane        */
/* REVISION: 8.6E   LAST MODIFIED: 05/09/98 BY: *L00Y* Jeff Wootton     */
/* REVISION: 8.6E   LAST MODIFIED: 06/29/98 BY: *L034* Markus Barone    */
/* REVISION: 8.6E   LAST MODIFIED: 07/08/98 BY: *L01D* Brenda Milton    */
/* REVISION: 8.6E   LAST MODIFIED: 10/06/98 BY: *J316* G.Latha          */
/* Old ECO marker removed, but no ECO header exists *F003*                    */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Vijaya Pakala      */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00   BY: *N0KK* jyn                */
/* REVISION: 9.1      LAST MODIFIED: 09/07/00   BY: *N0MX* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 11/06/00   BY: *N0TN* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 08/05/00   BY: *N0W6* Mudit Mehta        */
/* Revision: 1.21.1.9       BY: Rajesh Thomas      DATE: 06/25/01 ECO: *M1BV* */
/* Revision: 1.21.1.11.2.1  BY: Niranjan R.        DATE: 07/11/01 ECO: *P00L* */
/* Revision: 1.21.1.12      BY: Sathish Kumar      DATE: 10/31/01 ECO: *M1NV* */
/* Revision: 1.21.1.13      BY: Paul Donnelly      DATE: 12/13/01 ECO: *N16J* */
/* Revision: 1.21.1.14      BY: Vandna Rohira      DATE: 06/05/02 ECO: *M1Z8* */
/* Revision: 1.21.1.16      BY: Paul Donnelly (SB) DATE: 06/26/03 ECO: *Q00B* */
/* Revision: 1.21.1.17      BY: Rajinder Kamra     DATE: 05/05/03 ECO: *Q003* */
/* Revision: 1.21.1.18      BY: Jean Miller        DATE: 01/07/04 ECO: *Q04Y* */
/* Revision: 1.21.1.19      BY: Dan Herman         DATE: 11/01/04 ECO: *M1L8* */
/* Revision: 1.21.1.20      BY: Karel Groos        DATE: 02/28/05 ECO: *R009* */
/* Revision: 1.21.1.21      BY: Ed van de Gevel    DATE: 03/11/05 ECO: *R00L* */
/* Revision: 1.21.1.22      BY: Anil Sudhakaran    DATE: 01/17/07 ECO: *R0C6* */
/* Revision: 1.21.1.25      BY: Antony LejoS       DATE: 10/25/07 ECO: *P6C0* */
/* Revision: 1.21.1.26      BY: Anish Mandalia     DATE: 04/14/08 ECO: *P6HS* */
/* Revision: 1.21.1.27      BY: Steve Nugent       DATE: 02/25/09 ECO: *R1D1* */
/* $Revision: 1.2 $            BY: Antony LejoS       DATE: 01/06/10 ECO: *R1V2* */
/* CYB    LAST MODIFIED: 02-JUN-2010    BY:  gbg *cy1005*                    */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
         /*********************************************************/
         /* NOTES:   1. Patch FL60 sets in_level to a value       */
         /*             of 99999 when in_mstr is created or       */
         /*             when any structure or network changes are */
         /*             made that affect the low level codes.     */
         /*          2. The in_levels are recalculated when MRP   */
         /*             is run or can be resolved by running the  */
         /*             mrllup.p utility program.                 */
         /*********************************************************/
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i}
{us/ap/apconsdf.i}
 
/* INTER-COMPANY ACCOUNT PROCEDUres */
{us/px/pxpgmmgr.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i ppprxr}
{us/px/pxphdef.i gputlxr}
{us/px/pxphdef.i icilxr}
 
/*TO ASSIGN OID*/
{us/gp/gpoidfcn.i}
 
{us/la/lafrttmp.i}   /* FREIGHT CALCULATION TEMP TABLE DEFINITION */
define buffer btt-frcalc for tt-frcalc. 
define buffer blacd-det  for lacd_det.  
define buffer blacod-det for lacod_det.
define variable vcShipNbr  like tr_ship_id      no-undo.
 
define variable mc-error-number like msg_nbr no-undo.
define variable git_entity like si_entity.
define variable qty_left like tr_qty_chg.
define variable ref like glt_ref.
define variable original_db as character.
define variable err-flag as integer.
define variable dingbat_acct as character initial "########".
define variable dingbat_sub  as character initial "%%%%%%%%".
define variable dingbat_cc as character initial "@@@@".
define variable v_abs_recid as recid no-undo.
define variable dblcol as character initial "::" no-undo.
define variable inrecno as recid no-undo.
define variable gen-all like ds_qty_all no-undo.
define variable dftVendor like vd_addr no-undo.
define variable cIntercoRef like glt_interco_ref no-undo.
define variable cInitialIntercoRef like glt_interco_ref no-undo.
define variable l_exec             like mfc_logical initial yes no-undo.
define variable vdLacdOid like lacd_det.oid_lacd_det no-undo.
 
define shared variable rec_site like dss_rec_site.
define shared variable dss_recno as recid.
define shared variable eff_date like tr_date.
/*cy1005*  define shared variable site like sr_site no-undo. */
/*cy1005*/ define shared variable site as char label "Site" no-undo.
define shared variable location like sr_loc no-undo.
define shared variable lotserial like sr_lotser no-undo.
define shared variable lotref like sr_ref no-undo.
define shared variable cancel_bo as logical no-undo.
 
define new shared variable open_ref like mrp_qty.
define new shared variable intermediate_acct like trgl_dr_acct.
define new shared variable intermediate_sub  like trgl_dr_sub.
define new shared variable intermediate_cc like trgl_dr_cc.
define new shared variable xfer_acct like trgl_dr_acct.
define new shared variable xfer_sub  like trgl_dr_sub.
define new shared variable xfer_cc   like trgl_dr_cc.
define new shared variable from_site like si_site.
define new shared variable from_entity like si_entity.
define new shared variable from_db as character.
define new shared variable from_cost like sct_cst_tot.
define new shared variable to_site like si_site.
define new shared variable to_entity like si_entity.
define new shared variable to_db as character.
define new shared variable to_cost like sct_cst_tot.
define new shared variable trqty like tr_qty_chg.
define new shared variable gl_amt like glt_amt.
define new shared variable transtype as character format "x(7)".
define new shared variable expect_date like ds_due_date.
define new shared variable bol like dss_bol.
define new shared variable trans_id like ds_trans_id.
 
define new shared variable git_db as character.
define new shared variable undo-input like mfc_logical.
define new shared variable glcost like sct_cst_tot.
define new shared variable glx_mthd like cs_method.
define new shared variable glx_set like cs_set.
define new shared variable cur_mthd like cs_method.
define new shared variable cur_set like cs_set.
define new shared variable from_curr like exr_curr1.
define new shared variable to_curr like exr_curr2.
define new shared variable tmp_exch_rate like exr_rate.
define new shared variable tmp_exch_rate2 like exr_rate2.
define new shared variable exch_rate like exr_rate.
define new shared variable exch_rate2 like exr_rate2.
define new shared variable exch_ratetype like exr_ratetype no-undo.
define new shared variable exch_exru_seq like exru_seq no-undo.
define new shared variable tmp_exch_ratetype like exr_ratetype.
define new shared variable ship_part like ds_part.
define new shared variable ds_recno as recid.
define new shared variable sctsim    like sct_site.
define new shared variable sctbdn_ll like sct_bdn_ll.
define new shared variable sctbdn_tl like sct_bdn_tl.
define new shared variable sctlbr_ll like sct_lbr_ll.
define new shared variable sctlbr_tl like sct_lbr_tl.
define new shared variable sctmtl_ll like sct_mtl_ll.
define new shared variable sctmtl_tl like sct_mtl_tl.
define new shared variable sctovh_ll like sct_ovh_ll.
define new shared variable sctovh_tl like sct_ovh_tl.
define new shared variable sctsub_ll like sct_sub_ll.
define new shared variable sctsub_tl like sct_sub_tl.
define new shared variable this_qty_ship like ds_qty_ship no-undo.
define new shared variable this_qty_det_all like ds_qty_all no-undo.
 
define variable v_elec_ld as logical no-undo.  
define variable l-messageArgs  as   character  no-undo.

define temp-table tt_bo no-undo
   field tt_domain      like global_domain
   field tt_ds_req_nbr  like ds_req_nbr
   field tt_cancel_bo   like mfc_logical
index tt_index tt_domain tt_ds_req_nbr.
 
define input parameter table for tt_bo.
 
define buffer dsdet for ds_det.
 
find first icc_ctrl where icc_domain = global_domain no-lock no-error.
find dss_mstr where recid(dss_mstr) = dss_recno no-lock.
 
assign
   from_site = dss_shipsite
   bol = dss_bol.
 
find si_mstr where si_domain = global_domain and
                   si_site = dss_shipsite
no-lock.
 
assign
   from_db = si_db
   from_site = si_site
   from_entity = si_entity.
 
do on error undo, return error return-value:
 
   /* clear work table records of LG and GL */
   {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}
 
   /* CREATE SHIPPER FOR DISTRIBUTION ORDER */
   {us/bbi/gprun.i ""dsdoisa4.p"" "(dss_recno, eff_date, output v_abs_recid)"}
end. /* DO ON ERROR UNDO, RETURN ERROR RETURN-VALUE */
for first abs_mstr no-lock where recid(abs_mstr) = v_abs_recid:
   assign
         vcShipNbr  = substring(abs_id, 2).
   for each  tt-frcalc exclusive-lock
       where tt-frcalc.tt_order <> vcShipNbr
        break by tt-frcalc.tt_dss_nbr :
      for first lacd_det
          where lacd_det.lacd_domain            = global_domain
            and lacd_det.lacd_internal_ref      = tt-frcalc.tt_dss_nbr
            and lacd_det.lacd_shipfrom          = abs_mstr.abs_shipfrom
            and lacd_det.lacd_lc_charge         = tt-frcalc.tt_lc_charge
            and lacd_det.lacd_internal_ref_type = {&TYPE_DO}
            exclusive-lock: end.
      if not available lacd_det then next.
      for first ds_det
           where ds_domain     = global_domain
             and ds_nbr        = tt-frcalc.tt_order
             and ds_shipsite   = tt-frcalc.tt_shipfrom
             and ds_line       = tt-frcalc.tt_order_line
             no-lock:
      end.
      if not available ds_det then
         next.
      for first lacod_det where
           lacod_det.oid_lacd_det   = lacd_det.oid_lacd_det and
           lacod_det.oid_order_line = oid_ds_det exclusive-lock:
      end.
      if not available lacod_det then
         next.
      if first-of (tt-frcalc.tt_dss_nbr) then do:
         buffer-copy lacd_det except oid_lacd_det lacd_internal_ref
         lacd_internal_ref_type to blacd-det.
         assign blacd-det.lacd_internal_ref = vcShipNbr
                blacd-det.lacd_internal_ref_type = {&TYPE_DOShipper}.
         assign vdLacdOid = blacd-det.oid_lacd_det.
      end.
      buffer-copy lacod_det except lacod_det.oid_lacd_det oid_lacod_det
      to blacod-det.
      assign blacod-det.oid_lacd_det = vdLacdOid.
      buffer-copy tt-frcalc except tt_order to btt-frcalc.
      assign btt-frcalc.tt_order = vcShipNbr.
     assign
         lacd_det.lacd_lc_amt    = 0
         lacod_det.lacod_lc_amt  = 0
         /* THE LACOD EXCH RATES MAY HAVE BEEN CHANGED _ CHANGE THEM BACK */
         lacod_det.lacod_ex_rate = lacd_det.lacd_ex_rate
         lacod_det.lacod_ex_rate2 = lacd_det.lacd_ex_rate2.
      delete tt-frcalc.
   end. /* for each tt-frcalc */
   run modifyShipperType (input abs_shipfrom,
                          input abs_id).
end. /* if available abs_mstr  */
 
issue-loop:
for each ds_det no-lock use-index ds_nbr
   where ds_domain = global_domain
   and ( ds_nbr = dss_nbr
   and ds_shipsite = dss_shipsite
   and (ds_site = rec_site or rec_site = "")
   and can-find (first sr_wkfl where sr_domain = global_domain and
                                     sr_userid = SessionUniqueID and
                                     sr_lineid = ds_part + dblcol + ds_req_nbr + dblcol + ds_shipsite))
by ds_nbr by ds_part by ds_site by ds_req_nbr:
   cInitialIntercoRef = string(nextOidValue()).

   processTran-loop:
   do transaction on error undo, retry:
      /* This line of code is required in order for the retry logic to    */
      /* process corrrectly.                                              */
      if retry then .

      /* When issuing a DO shipment, the in_mstr & ld_det for the From Site*/
      /* and location and the To Site and location will be updated with    */
      /* transfer information. All records must be locked before processing*/
      /* the transfer in order to prevent a dead lock situation.           */
      /* hasMaxNumOfLockRetryAttemptsBeenExceeded is a general purpose     */
      /* procedure to keep track of the number of tries that have been made*/
      /* to lock the entire set of in_mstr & ld_det records.  Once the     */
      /* maximum number of attempts to lock the set of records has been    */
      /* reached, this procedure will return {&APP-ERROR-RESULT}           */

      {us/px/pxrun.i &PROC  = 'hasMaxNumOfLockRetryAttemptsBeenExceeded'
         &PROGRAM = 'gputlxr.p'
         &HANDLE=ph_gputlxr
         &PARAM =  "(input if retry then true else false,
                     input l-messageArgs,
                     input ds_det.ds_nbr)"
         &NOAPPERROR = true
         &CATCHERROR = true}

      if return-value <> {&SUCCESS-RESULT} then
         undo processTran-loop, leave processTran-loop.

      sr_wkfl-loop:
      for each sr_wkfl no-lock where
             sr_domain = global_domain
         and sr_userid = SessionUniqueID
         and sr_lineid = ds_part + dblcol + ds_req_nbr + dblcol + ds_shipsite:

         /* Lock the in_mstr and ld_det data effected by this DO shipment        */
         {us/px/pxrun.i &PROC  = 'lockLocationDetailInventoryData'
                  &PROGRAM = 'icilxr.p'
                  &HANDLE=ph_icilxr
                  &PARAM = "( input  ds_det.ds_part,
                              input  ds_det.ds_git_site,
                              input  ds_det.ds_trans_id,
                              input  sr_wkfl.sr_lotser,
                              input  sr_wkfl.sr_ref,
                              output l-messageArgs)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}
         if return-value = {&APP-ERROR-RESULT} then
            undo processTran-loop, retry processTran-loop.

         {us/px/pxrun.i &PROC  = 'lockLocationDetailInventoryData'
                  &PROGRAM = 'icilxr.p'
                  &HANDLE=ph_icilxr
                  &PARAM = "( input  ds_det.ds_part,
                              input  sr_wkfl.sr_site,
                              input  sr_wkfl.sr_loc,
                              input  sr_wkfl.sr_lotser,
                              input  sr_wkfl.sr_ref,
                              output l-messageArgs)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}

         if return-value = {&APP-ERROR-RESULT} then
            undo processTran-loop, retry processTran-loop.
      end. /* sr_wkfl-loop */
      for first tt_bo
      where tt_domain     = global_domain
      and   tt_ds_req_nbr = ds_req_nbr
      no-lock:
         if available tt_bo
         then do:
            assign
               tt_domain = global_domain
               cancel_bo = tt_cancel_bo.
         end. /*IF AVAILABLE tt_bo*/
      end. /*FOR FIRST tt_bo*/
 
      assign
         from_cost = 0
         to_cost   = 0
         xfer_acct = dingbat_acct
         xfer_sub  = dingbat_sub
         xfer_cc   = dingbat_cc
         intermediate_acct = dingbat_acct
         intermediate_sub  = dingbat_sub
         intermediate_cc   = dingbat_cc
         trans_id          = ds_trans_id.
 
      {us/bbi/gprun.i ""dsdate03.p""
         "(ds_shipsite,ds_site,ds_trans_id,"""",eff_date,
           output expect_date)"}
 
      find si_mstr where si_domain = global_domain and
                         si_site = ds_git_site
      no-lock no-error.
 
      /* Get transfer variance account/subaccount/cost center */
      for first pt_mstr where pt_mstr.pt_domain = global_domain
                          and pt_part = ds_part
                        no-lock:
 
         {us/px/pxrun.i &PROGRAM='glacdfpl.p'
                  &PROC='GetDefaultAcct'
                  &PARAM="( input '',
                            input 'XFER_ACCT',
                            input pt_prod_line,
                            input si_site,
                            input '',
                            input '',
                            input '',
                            input '',
                            output xfer_acct,
                            output xfer_sub,
                            output xfer_cc)"
                  &CATCHERROR=true
                  &NOAPPERROR=true
         }
      end.
 
      if not available pt_mstr or return-value <> {&SUCCESS-RESULT} then
         assign xfer_acct = si_xfer_acct
                xfer_sub  = si_xfer_sub
                xfer_cc   = si_xfer_cc.
      assign
         to_db      = si_db
         to_site    = si_site
         git_entity = si_entity
         to_entity  = si_entity.

      {us/gp/gpsct06.i &part=ds_part &site=from_site &type=""GL"" }
      if available sct_det then from_cost = sct_cst_tot.
 
      find pt_mstr where pt_domain = global_domain and
                         pt_part = ds_part
      no-lock no-error.
 
      if from_site = to_site and
         from_db = to_db
      then do:
 
         to_cost = from_cost.
 
         if icc_xclr_acct = "" then do:
 
            if available pt_mstr then do:
               {us/px/pxgetph.i ppprxr}
               if ({us/px/pxfunct.i &FUNCTION = 'IsValidProductLine'
                                    &PROGRAM = 'ppprxr.p'
                                    &HANDLE = ph_ppprxr
                                    &PARAM = "(pt_prod_line)"})
               then do:
 
                  dftVendor = "".
 
                  /* IF PO EXIST THEN GET VENDOR FROM THERE */
                  if dss_po_nbr <> "" then do:
                     for first po_mstr
                         where po_domain = global_domain and
                               po_nbr = dss_po_nbr
                     no-lock:
                        dftVendor = po_vend.
                     end.
                  end. /* IF DSS_PO_NBR */
 
                  for first vd_mstr
                     where vd_domain = global_domain and
                           vd_addr = dftVendor
                  no-lock: end.
 
                  {us/bbi/gprun.i ""glactdft.p"" "(input ""PO_PUR_ACCT"",
                                         input pt_prod_line,
                                         input ds_site,
                                         input if available vd_mstr then
                                         vd_type else """",
                                         input """",
                                         input no,
                                         output xfer_acct,
                                         output xfer_sub,
                                         output xfer_cc)"}
                  assign
                     intermediate_acct = xfer_acct
                     intermediate_sub  = xfer_sub
                     intermediate_cc   = xfer_cc.
 
               end. /* IF IsValidProductLine */
            end.
         end.
 
         else do:
            /* USE NEW TRANSFER CLEARING ACCT */
            if available icc_ctrl then
            assign
               xfer_acct         = icc_xclr_acct
               xfer_sub          = icc_xclr_sub
               xfer_cc           = icc_xclr_cc
               intermediate_acct = icc_xclr_acct
               intermediate_sub  = icc_xclr_sub
               intermediate_cc   = icc_xclr_cc.
         end.
 
      end.
 
      else do:
         /* SECTION ADDED TO HANDLE AVERAGE COST AT MULT. DOMAIN  */
         ship_part = ds_part.
         find first gl_ctrl where gl_domain = global_domain no-lock.
 
         assign
            from_curr = gl_base_curr
            original_db = global_db.
 
         /* CHANGE TO TO DOMAIN IF DIFF */
         if to_db <> global_db then do:
            {us/bbi/gprun.i ""gpmdas.p"" "(input to_db, output err-flag)"}
            if err-flag <> 0 then do:
               /* DOMAIN # IS NOT AVAILABLE */
               {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=to_db}
               undo issue-loop, next issue-loop.
            end.
         end.
 
         /* GET TO COSTS - FROM TO DB */
         {us/bbi/gprun.i ""dsdoisa2.p""}
 
         /* SWITCH BACK IF DIFF */
         if original_db <> global_db then do:
            {us/bbi/gprun.i ""gpmdas.p"" "(input original_db, output err-flag)"}
            if err-flag <> 0 then do:
               /* DOMAIN # IS NOT AVAILABLE */
               {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=original_db}
               undo issue-loop, next issue-loop.
            end.
         end.
 
         if exch_rate = ? and exch_rate2 = ? then
            undo issue-loop, leave issue-loop.
 
         if (glx_mthd = "AVG" or cur_mthd = "AVG" or cur_mthd = "LAST")
         then do:
 
            {us/gp/gpsct06.i &part=ds_part &site=from_site &type=""GL"" }
 
            if available sct_det then do:
               assign
                  sctsim = sct_sim.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_bdn_ll,
                    input false,   /* NO ROUNDING */
                    output sctbdn_ll,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_bdn_tl,
                    input false,   /* NO ROUNDING */
                    output sctbdn_tl,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_lbr_ll,
                    input false,   /* NO ROUNDING */
                    output sctlbr_ll,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_lbr_tl,
                    input false,   /* NO ROUNDING */
                    output sctlbr_tl,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_mtl_ll,
                    input false,   /* NO ROUNDING */
                    output sctmtl_ll,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_mtl_tl,
                    input false,   /* NO ROUNDING */
                    output sctmtl_tl,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_ovh_ll,
                    input false,   /* NO ROUNDING */
                    output sctovh_ll,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_ovh_tl,
                    input false,   /* NO ROUNDING */
                    output sctovh_tl,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_sub_ll,
                    input false,   /* NO ROUNDING */
                    output sctsub_ll,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_sub_tl,
                    input false,   /* NO ROUNDING */
                    output sctsub_tl,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
 
               {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                  "(input from_curr,
                    input to_curr,
                    input exch_rate,
                    input exch_rate2,
                    input sct_cst_tot,
                    input false,   /* NO ROUNDING */
                    output from_cost,
                    output mc-error-number)"}
 
               if mc-error-number <> 0 then do:
                  {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               end.
            end.  /* IF AVAILABLE sct_det */
         end.  /* IF AVG OR LAST */
 
         /*IF THE ENTITIES ARE THE SAME,  USE THE CLEARING ACCT;   */
         /*IF THE ENTITIES ARE DIFFERENT, USE THE INTERCOMPANY ACCT*/
         if from_entity = to_entity
            and from_db = to_db
         then
            assign
               intermediate_acct = icc_xclr_acct
               intermediate_sub  = icc_xclr_sub
               intermediate_cc   = icc_xclr_cc
               trmsg             = 5232.
         else do:
            {us/gl/glenacex.i &entity=from_entity
                        &type='"DR"'
                        &module='"IC"'
                        &acct=intermediate_acct
                        &sub=Intermediate_sub
                        &cc=intermediate_cc }
 
            assign
               trmsg             = 5242
               cIntercoRef       = cInitialIntercoRef.
         end.
 
         if intermediate_acct = "" then
            assign
               intermediate_acct = dingbat_acct
               intermediate_sub  = dingbat_sub
               intermediate_cc   = dingbat_cc.
 
      end.  /* ELSE DO */
 
      if from_entity = to_entity and
         from_db <> to_db and
         from_site <> to_site
      then do:
 
         for first si_mstr
            where si_domain = global_domain and si_site = to_site
         no-lock: end.
 
         {us/gl/glenacex.i &entity=si_entity
                     &type='"DR"'
                     &module='"IC"'
                     &acct=intermediate_acct
                     &sub=intermediate_sub
                     &cc=intermediate_cc }
      end.
 
 
      /* GPINCR.P ROUTINE IS USED TO CREATE IN_MSTR RECORD */
      find si_mstr where si_domain = global_domain and
                         si_site = ds_shipsite
      no-lock no-error.
 
      {us/bbi/gprun.i ""gpincr.p"" "(input no,
                              input ds_part,
                              input ds_shipsite,
                              input if available si_mstr then
                                       si_gl_set
                                    else """",
                              input if available si_mstr then
                                       si_cur_set
                                    else """",
                              input if available pt_mstr then
                                       pt_abc
                                    else """",
                              input if available pt_mstr then
                                       pt_avg_int
                                    else 0,
                              input if available pt_mstr then
                                       pt_cyc_int
                                    else 0,
                              input if available pt_mstr then
                                       pt_rctpo_status
                                    else """",
                              input if available pt_mst then
                                       pt_rctpo_active
                                    else no,
                              input if available pt_mstr then
                                       pt_rctwo_status
                                    else """",
                              input if available pt_mstr then
                                       pt_rctwo_active
                                    else no,
                              output inrecno)"}
 
      for first in_mstr where recid(in_mstr) = inrecno
      no-lock:
	    end.
 
      for first ptp_det where ptp_domain = global_domain
                     and ptp_part = in_part
                     and ptp_site = in_site
      no-lock:
	    end.
 
      /* TO FIND, HOW MUCH OF THE ALLOCATED QUANTITY IS GENERAL */
      /* BEFORE PROCESSING SHIPMENT SUB-ROUTINE dsdoisa3.p      */
      gen-all = ds_qty_all.
 
      for each lad_det where
               lad_domain = global_domain
           and lad_dataset = "ds_det"
           and lad_nbr     = ds_req_nbr
           and lad_line    = ds_site
           and lad_part    = ds_part
           and lad_site    = ds_shipsite
      no-lock:
         gen-all = gen-all - lad_qty_all.
      end. /* FOR EACH lad_det */
 
      gen-all = max(gen-all,0).
 
      ds_recno = recid(ds_det).
/*cy1005*  {us/bbi/gprun.i ""dsdoisa3.p"" "(v_abs_recid, cIntercoRef,"""")"} */
/*cy1005*/ {us/bbi/gprun.i ""xxdoisa3.p"" "(v_abs_recid, cIntercoRef,"""")"}
 
      for first dsdet where recid(dsdet) = recid(ds_det)
      exclusive-lock:
 
      assign
         dsdet.ds_qty_all  = 0
         dsdet.ds_qty_pick = 0
         dsdet.ds_qty_chg  = 0.
      end.
 
      /* MRP WORKFILE */
      if ds_det.ds_qty_ord >= 0 then
         open_ref = max(ds_det.ds_qty_conf -
                    max(ds_det.ds_qty_ship,0),0).
      else
         open_ref = min(ds_det.ds_qty_conf -
                    min(ds_det.ds_qty_ship,0),0).
 
      if ds_det.ds_status = "C" then open_ref = 0.
 
      /* UPDATE mrp_det RECORDS PROPERLY */
      {us/mf/mfmrw.i
         "ds_det"
         ds_det.ds_part
         ds_det.ds_req_nbr
         ds_det.ds_shipsite
         ds_det.ds_site
         ?
         ds_det.ds_shipdate
         open_ref
         "DEMAND"
         INTERSITE_DEMAND
         ds_det.ds_shipsite}

      /* DELETE UNNECESSARY DETAIL ALLOCATIONS REMAINING                */
      /* UNPICK DETAIL PICK QUANTITIES NOT ISSUED                       */
      /* MAKE AN ATTEMPT TO RETAIN THE ITEMS NOT ISSUED IN THE ORDER    */
      /* SPECIFIED IN THE ICC_CTRL FILE (WORKS WELL FOR LOCATION        */
      /* OR LOT EITHER ASCENDING OR DESCENDING BECAUSE SR_WKFL          */
      /* CONTAINS THE LOCATION AND LOT/SERIAL FIELDS).                  */
      /* FOR EXPIRATION DATE OR CREATION DATE WE NEED TO RELY ON THE    */
      /* HOPEFUL EXPECTATION THAT LAD_DET RECORD ALLOCATIONS WERE       */
      /* CREATED IN THE PROPER SEQUENCE, i.e, USE THE RECID ORDER. THIS */
      /* WILL NOT WORK IF ALL ALLOCATIONS WERE NOT CREATED AT THE SAME  */
      /* TIME OR WERE NOT CREATED USING THE AUTOMATIC PICK LOGIC        */
      /* ROUTINES.                                                      */
 
      for each lad_det
      exclusive-lock
         where lad_domain = global_domain
           and lad_dataset = "ds_det"
           and lad_nbr  = ds_det.ds_req_nbr
           and lad_line = ds_det.ds_site
           and lad_part = ds_det.ds_part
           and lad_site = ds_det.ds_shipsite
      use-index lad_det
      by (if icc_pk_ord = 1 and icc_ascend then lad_loc
      else if icc_pk_ord = 2 and icc_ascend then lad_lot
      else lad_dataset)
      by (if icc_pk_ord = 1 and not icc_ascend then lad_loc
      else if icc_pk_ord = 2 and not icc_ascend then lad_lot
      else lad_dataset) descending
      by recid(lad_det):
 
         assign
            lad_qty_all  = lad_qty_all + lad_qty_pick
            lad_qty_pick = 0.
 
         if lad_qty_all <= open_ref then do:
 
            open_ref = open_ref - lad_qty_all.
 
            find dsdet where recid(dsdet) = recid(ds_det)
            exclusive-lock no-error.
 
            if available dsdet then
               dsdet.ds_qty_all = dsdet.ds_qty_all + lad_qty_all.
 
         end.
 
         else do:
 
            find in_mstr where in_domain = global_domain
                           and in_part = lad_part
                           and in_site = lad_site
            exclusive-lock no-error.
 
            if available in_mstr then
               in_qty_all = in_qty_all - lad_qty_all + open_ref.
 
            for first ld_det where ld_domain = global_domain
                          and ld_site = lad_site
                          and ld_loc  = lad_loc
                          and ld_part = lad_part
                          and ld_lot  = lad_lot
                          and ld_ref  = lad_ref
            exclusive-lock:
 
               ld_qty_all = max(ld_qty_all - lad_qty_all + open_ref,0).
            end. 
            lad_qty_all = open_ref.
 
            for first dsdet where recid(dsdet) = recid(ds_det)
            exclusive-lock:
 
               dsdet.ds_qty_all = dsdet.ds_qty_all + lad_qty_all.
            end. 
            if lad_qty_all = 0 then delete lad_det.
 
            open_ref = 0.
 
         end.  /* ELSE DO */
 
      end.  /* FOR EACH lad_det */
 
      /* TO UPDATE ALLOCATION QUANTITY FIELD IN INVENTORY MASTER */
      /* RECORD FOR GENERAL ALLOCATION QUANTITY AND TO RETAIN    */
      /* DRP ORDER LINE (GENERAL ALLOCATED QUANTITY WHEN PART    */
      /* SHIPMENT).                                              */
      do on error undo:
 
         for first in_mstr where in_domain = global_domain
                        and in_part = ds_det.ds_part
                        and in_site = ds_det.ds_shipsite
         exclusive-lock:
 
            in_qty_all = in_qty_all -
               min(max(this_qty_ship - this_qty_det_all,0),gen-all).
         end.
         for first dsdet where recid(dsdet) = recid(ds_det)
         exclusive-lock:
 
            /* ADJUST THE ds_qty_all FOR THE GENERALLY */
            /* ALLOCATED QTY BEING SHIPPED */
            dsdet.ds_qty_all = dsdet.ds_qty_all +
                 gen-all - min(max(this_qty_ship - this_qty_det_all,0),gen-all).
         end.
      end. /* DO ON ERROR UNDO */
 
      for each sr_wkfl where
               sr_domain = global_domain and
               sr_userid = SessionUniqueID and
               sr_lineid = ds_det.ds_part + dblcol + ds_det.ds_req_nbr
                           + dblcol + ds_det.ds_shipsite
      exclusive-lock:
         delete sr_wkfl.
      end.
 
      if l_exec = yes
      then
         run p-del-qad-wkfl.
 
      if l_exec = yes
      then
         run p-del-qad-wkfl.
   end. /* processTran-loop */
end.  /* ISSUE LOOP */

/* update legal document number in General Ledger Unposted Transaction */
/* Detail table. */
{us/gp/gprunp.i "soldxr" "p" "updateLegalNumToUnpostedGL"}

run modifyLcAmt(input dss_mstr.dss_nbr).
PROCEDURE modifyShipperType:
   /*************************************************************
   The shipper created by SHIPING GROUP MODULE is wrong in terms of
       abs_type (it should be "D" ) and does not cotain requisition
       number reference at line level.
   ************************************************************/
   define input parameter icShipfrom like abs_shipfrom no-undo.
   define input parameter icId       like abs_id       no-undo.
   define buffer abs_mstr for abs_mstr.
   for first abs_mstr
        where abs_domain   = global_domain
          and abs_shipfrom = icShipfrom
          and abs_id       = icId
          exclusive-lock:
      assign abs_type = "D".
   end.
   for each abs_mstr where abs_domain   = global_domain
                       and abs_shipfrom = icShipfrom
                       and abs_par_id   = icid
                       exclusive-lock:
      assign abs_type = "D".
      for first ds_det
           where ds_domain     = global_domain
             and ds_nbr        = abs_order
             and ds_shipsite   = abs_shipfrom
             and ds_line       = int(abs_line)
             no-lock:
         assign abs_line = ds_req_nbr.
      end.
   end. /* for each abs_mstr */
   release abs_mstr.
END PROCEDURE. /* modifyShipperType */
PROCEDURE modifyLcAmt:
   define input parameter v_dss_nbr like dss_nbr .
   for each  tt-frcalc exclusive-lock
          where tt-frcalc.tt_order  = v_dss_nbr
          break by tt-frcalc.tt_dss_nbr :
         for first lacd_det
             where lacd_det.lacd_domain            = global_domain
               and lacd_det.lacd_internal_ref      = tt-frcalc.tt_dss_nbr
               and lacd_det.lacd_shipfrom          = tt-frcalc.tt_shipfrom
               and lacd_det.lacd_lc_charge         = tt-frcalc.tt_lc_charge
               and lacd_det.lacd_internal_ref_type = {&TYPE_DO}
               exclusive-lock:
         end.
         if not available lacd_det then next.
         for first ds_det
              where ds_domain     = global_domain
                and ds_nbr        = tt-frcalc.tt_order
                and ds_shipsite   = tt-frcalc.tt_shipfrom
                and ds_line       = tt-frcalc.tt_order_line
                no-lock:
         end.
         if not avail ds_det then
            next.
         for first lacod_det where
              lacod_det.oid_lacd_det   = lacd_det.oid_lacd_det and
              lacod_det.oid_order_line = oid_ds_det exclusive-lock:
         end.
         if not avail lacod_det then
            next.
          assign
            lacd_det.lacd_lc_amt    = 0
            lacod_det.lacod_lc_amt  = 0.
          release lacd_det.
          release lacod_det.
  end.
END PROCEDURE. /*modifyLcAmt*/
/* END OF INTERNAL PROCEDURES */
 
/* NOTE: PRINT ELECTRONIC LEGAL DOCUMENT AFTER THE 
 *       TRANACTION IS COMMITED TO PREVENT SENDING 
 *       ELECTRONIC REQUEST FOR ANY LEGAL DOCUMENT
 *       THAT IS ROLLED BACK BY THE SYSTEM.
 */
if v_abs_recid <> ? then do:
   for first abs_mstr where
             recid(abs_mstr) = v_abs_recid
   no-lock:
      if can-find(first im_mstr
                  where im_domain  = global_domain
                    and im_inv_mov = abs_inv_mov
                    and im_tr_type = "ISS-DO"
                    and im_flow   <> 0) then do:
 
         /* Print Non-electronic Legal Doc */
         {us/gp/gprunp.i "soldxr" "p" "checkElecLDForShipper"
          "(input oid_abs_mstr,
            output v_elec_ld)"}
 
         if v_elec_ld then do: 
            {us/bbi/gprun.i ""icldprt.p"" "(v_abs_recid)"}
         end.
      end.
   end.
end.
 
PROCEDURE p-del-qad-wkfl:
/*-----------------------------------------------------------------------
  Purpose:      Clean up qad_wkfl records used for icshmt.p
  Parameters:
  Notes:        Internal procedure created to reduce compile size
-------------------------------------------------------------------------*/
 
   define buffer b_qad_wkfl for qad_wkfl.
 
   for each b_qad_wkfl
      where b_qad_wkfl.qad_domain = global_domain
      and   b_qad_wkfl.qad_key3   = "icshmt.p"
      and   b_qad_wkfl.qad_key4   = SessionUniqueID
   exclusive-lock:
      delete b_qad_wkfl.
   end. /* FOR EACH qad_wkfl */
 
END PROCEDURE.  /* p-del-qad-wkfl */
 
/* END OF INTERNAL PROCEDURES */
