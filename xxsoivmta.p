/* xxsoivmta.p - PENDING INVOICE LINE ITEM MAINTENANCE                        */
/* soivmta.p - PENDING INVOICE LINE ITEM MAINTENANCE                          */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoivmta.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/* REVISION: 1.0      LAST MODIFIED: 08/31/86   BY: pml *17*                  */
/* REVISION: 6.0      LAST MODIFIED: 03/21/90   BY: ftb *D011*                */
/* REVISION: 6.0      LAST MODIFIED: 03/22/90   BY: ftb *D007*                */
/* REVISION: 6.0      LAST MODIFIED: 04/02/90   BY: ftb *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 04/05/90   BY: wug *B649*                */
/* REVISION: 6.0      LAST MODIFIED: 05/02/90   BY: mlb *D021*                */
/* REVISION: 6.0      LAST MODIFIED: 07/06/90   BY: emb *D040*                */
/* REVISION: 6.0      LAST MODIFIED: 08/09/90   BY: mlb *D055*                */
/* REVISION: 6.0      LAST MODIFIED: 12/11/90   BY: mlb *D238*                */
/* REVISION: 6.0      LAST MODIFIED: 02/20/91   BY: afs *D356*                */
/* REVISION: 6.0      LAST MODIFIED: 03/18/91   BY: mlb *D443*                */
/* REVISION: 6.0      LAST MODIFIED: 06/17/91   BY: emb *D710*                */
/* REVISION: 6.0      LAST MODIFIED: 07/08/91   BY: afs *D751*                */
/* REVISION: 6.0      LAST MODIFIED: 08/02/91   BY: wug *D810*                */
/* REVISION: 6.0      LAST MODIFIED: 08/14/91   BY: mlv *D825*                */
/* REVISION: 7.0      LAST MODIFIED: 09/17/91   BY: mlv *F015*                */
/* REVISION: 6.0      LAST MODIFIED: 09/19/91   BY: afs *F040*                */
/* REVISION: 6.0      LAST MODIFIED: 10/07/91   BY: alb *D887*(rev only)      */
/* REVISION: 6.0      LAST MODIFIED: 11/14/91   BY: pma *F003*                */
/* REVISION: 7.0      LAST MODIFIED: 02/11/92   BY: tjs *F191*                */
/* REVISION: 7.0      LAST MODIFIED: 02/26/92   BY: afs *F240*                */
/* REVISION: 7.0      LAST MODIFIED: 03/24/92   BY: dld *F297*                */
/* REVISION: 7.0      LAST MODIFIED: 03/27/92   BY: pma *F315*                */
/* REVISION: 7.0      LAST MODIFIED: 04/09/92   BY: afs *F356*                */
/* REVISION: 7.0      LAST MODIFIED: 04/15/92   BY: afs *F398*                */
/* REVISION: 7.0      LAST MODIFIED: 05/06/92   BY: tjs *F470*                */
/* REVISION: 7.0      LAST MODIFIED: 06/05/92   BY: tjs *F504*                */
/* REVISION: 7.0      LAST MODIFIED: 06/16/92   BY: afs *F519*                */
/* REVISION: 7.3      LAST MODIFIED: 09/16/92   BY: tjs *G035*                */
/* REVISION: 7.3      LAST MODIFIED: 09/27/92   BY: jcd *G247*                */
/* REVISION: 7.3      LAST MODIFIED: 01/17/93   BY: afs *G501*                */
/* REVISION: 7.3      LAST MODIFIED: 01/21/93   BY: tjs *G579*                */
/* REVISION: 7.3      LAST MODIFIED: 02/10/93   BY: bcm *G416*                */
/* REVISION: 7.3      LAST MODIFIED: 02/24/93   BY: sas *G457*                */
/* REVISION: 7.3      LAST MODIFIED: 04/07/93   BY: bcm *G889*                */
/* REVISION: 7.3      LAST MODIFIED: 04/28/93   BY: tjs *G948*                */
/* REVISION: 7.3      LAST MODIFIED: 07/26/93   BY: afs *GD61*                */
/* REVISION: 7.3      LAST MODIFIED: 08/23/93   BY: afs *GC24*                */
/* REVISION: 7.4      LAST MODIFIED: 10/10/93   BY: cdt *H086*                */
/* REVISION: 7.4      LAST MODIFIED: 10/2/93    BY: cdt *H184*                */
/* REVISION: 7.4      LAST MODIFIED: 11/03/93   BY: bcm *H206*                */
/* REVISION: 7.4      LAST MODIFIED: 11/22/93   BY: afs *H238*                */
/* REVISION: 7.4      LAST MODIFIED: 11/22/93   BY: dpm *GI46*                */
/* REVISION: 7.4      LAST MODIFIED: 02/18/94   BY: afs *FL81*                */
/* REVISION: 7.4      LAST MODIFIED: 03/16/94   BY: afs *H295*                */
/* REVISION: 7.4      LAST MODIFIED: 03/28/94   BY: wug *GJ21*                */
/* REVISION: 7.4      LAST MODIFIED: 03/31/94   BY: afs *H108*                */
/* REVISION: 7.4      LAST MODIFIED: 07/20/94   BY: bcm *H449*                */
/* REVISION: 7.4      LAST MODIFIED: 09/10/94   BY: bcm *GM05*                */
/* REVISION: 7.4      LAST MODIFIED: 10/16/94   BY: dpm *FR95*                */
/* REVISION: 7.4      LAST MODIFIED: 12/12/94   BY: dpm *FT84*                */
/* REVISION: 7.4      LAST MODIFIED: 01/13/95   BY: dpm *F0DR*                */
/* REVISION: 7.4      LAST MODIFIED: 02/23/95   BY: jzw *H0BM*                */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: rxw *F0PJ*                */
/* REVISION: 7.4      LAST MODIFIED: 04/19/95   BY: dpm *J044*                */
/* REVISION: 8.5      LAST MODIFIED: 04/12/95   BY: dah *J042*                */
/* REVISION: 8.5      LAST MODIFIED: 08/29/95   BY: jym *G0VQ*                */
/* REVISION: 8.5      LAST MODIFIED: 09/25/95   BY: jym *G0Y0*                */
/* REVISION: 8.5      LAST MODIFIED: 10/04/95   BY: kxn *J087*                */
/* REVISION: 8.5      LAST MODIFIED: 11/07/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 03/11/96   BY: wjk *J0DV*                */
/* REVISION: 8.5      LAST MODIFIED: 04/10/96   BY: ais *G1R4*                */
/* REVISION: 8.5      LAST MODIFIED: 04/15/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/15/96   BY: *J04C* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 04/29/96   BY: *J0KJ* Dennis Henson      */
/* REVISION: 8.5      LAST MODIFIED: 05/22/96   BY: *J0N2* Dennis Henson      */
/* REVISION: 8.5      LAST MODIFIED: 07/04/96   BY: *J0XR* Dennis Henson      */
/* REVISION: 8.6      LAST MODIFIED: 10/01/96   BY: svs *K007*                */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *H0NF* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 11/14/96   BY: *G2J1* Amy Esau           */
/* REVISION: 8.6      LAST MODIFIED: 01/01/97   BY: *K03Y* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 01/08/97   BY: *J1DV* Sue Poland         */
/* REVISION: 8.6      LAST MODIFIED: 02/21/97   BY: *H0SM* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 05/02/97   BY: *J1QH* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 05/15/97   BY: *G2MG* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 07/01/97   BY: *J1TQ* Irine D'mello      */
/* REVISION: 8.6      LAST MODIFIED: 07/08/97   BY: *K0DT* Arul Victoria      */
/* REVISION: 8.6      LAST MODIFIED: 11/12/97   BY: *H1GM* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 01/16/98   BY: *J25N* Aruna Patil        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/21/98   BY: *J2K3* Samir Bavkar       */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* REVISION: 8.6E     LAST MODIFIED: 07/06/98   BY: *L024* Sami Kureishy      */
/* REVISION: 9.0      LAST MODIFIED: 11/24/98   BY: *M017* Luke Pokic         */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Patti Gaultney     */
/* REVISION: 9.1      LAST MODIFIED: 09/08/99   BY: *N02P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 06/28/00   BY: *N0DM* Rajinder Kamra     */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb                */
/* REVISION: 9.1      LAST MODIFIED: 11/03/00   BY: *L15F* Kaustubh K         */
/* REVISION: 9.1      LAST MODIFIED: 10/14/00   BY: *N0W8* BalbeerS Rajput    */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.32          BY: Katie Hilbert      DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.33          BY: Russ Witt          DATE: 06/19/01  ECO: *P00J* */
/* Revision: 1.34          BY: Rajesh Thomas      DATE: 07/11/01  ECO: *M136* */
/* Revision: 1.35          BY: Jeff Wootton       DATE: 09/21/01  ECO: *P01H* */
/* Revision: 1.36          BY: Steve Nugent       DATE: 10/15/01  ECO: *P004* */
/* Revision: 1.37          BY: Rajiv Ramaiah      DATE: 10/31/01  ECO: *M1LM* */
/* Revision: 1.38          BY: Rajesh Kini        DATE: 03/14/02  ECO: *M1WN* */
/* Revision: 1.39          BY: Jean Miller        DATE: 05/14/02  ECO: *P05V* */
/* Revision: 1.40          BY: Veena Lad          DATE: 06/26/02  ECO: *N1M4* */
/* Revision: 1.41          BY: Vivek Gogte        DATE: 10/22/02  ECO: *N1XT* */
/* Revision: 1.42          BY: Dipesh Bector      DATE: 01/14/03  ECO: *M21Q* */
/* Revision: 1.44          BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.45          BY: Rajesh Kini        DATE: 08/13/03  ECO: *N2HN* */
/* Revision: 1.46          BY: Katie Hilbert      DATE: 03/02/04  ECO: *Q06B* */
/* Revision: 1.50          BY: Pankaj Goswami     DATE: 08/05/04  ECO: *P2BD* */
/* Revision: 1.51          BY: Alok Gupta         DATE: 01/19/05  ECO: *P34P* */
/* Revision: 1.52          BY: Sunil Fegade       DATE: 03/22/05  ECO: *P3DL* */
/* Revision: 1.55          BY: Niranjan Ranka     DATE: 06/17/05  ECO: *R01D* */
/* Revision: 1.56          BY: Gaurav Kerkar      DATE: 07/19/05  ECO: *P3T8* */
/* Revision: 1.57          BY: David Morris       DATE: 09/30/05  ECO: *R021* */
/* Revision: 1.58          BY: Jean Miller        DATE: 02/18/06  ECO: *Q0R5* */
/* Revision: 1.59          BY: Shilpa Kamath      DATE: 04/18/06  ECO: *R043* */
/* Revision: 1.60          BY: Aaron Luo          DATE: 04/11/07  ECO: *R0C6* */
/* Revision: 1.61          BY: Jean Miller        DATE: 11/17/07  ECO: *P62Q* */
/* Revision: 1.62          BY: Anju Dubey         DATE: 01/11/08  ECO: *P64F* */
/* Revision: 1.63          BY: Jean Miller        DATE: 06/19/08  ECO: *R0VD* */
/* Revision: 1.64          BY: Jean Miller        DATE: 06/26/08  ECO: *R0JS* */
/* Revision: 1.65          BY: Sandeep Panchal    DATE: 07/23/08  ECO: *R0YL* */
/* Revision: 1.66          BY: Archana Kirtane    DATE: 08/20/08  ECO: *P6ZK* */
/* Revision: 1.67          BY: Rohan Golatkar     DATE: 10/17/08  ECO: *R15W* */
/* Revision: 1.68          BY: Niranjan Ranka     DATE: 10/27/08  ECO: *R16D* */
/* Revision: 1.69          BY: Katie Hilbert      DATE: 11/07/08  ECO: *R175* */
/* Revision: 1.70          BY: Prabu M            DATE: 02/24/10  ECO: *R1YM* */
/* $Revision: 1.2 $       BY: Katie Hilbert      DATE: 06/24/10  ECO: *R21M* */
/* CYB        LAST MODIFIED: 29-JUN-2011  BY: gbg *cy1046*               */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
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
{us/px/pxmaint.i}
/* Define Handles for the programs. */
{us/px/pxphdef.i ppptrexr}
{us/px/pxphdef.i gpcmxr}
 
/* SET so_to_inv TO YES ONLY ON ADDING A NEW LINE OR MODIFYING THE */
/* QUANTITY OF EXISTING LINE ITEMS                                 */
 
/* DEFINE RNDMTHD FOR CALL TO SOIVMTEA.P */
define shared variable rndmthd          like rnd_rnd_mthd.
define shared variable line             like sod_line.
define shared variable del-yn           like mfc_logical.
define shared variable prev_due         like sod_due_date.
define shared variable prev_qty_ord     like sod_qty_ord.
define shared variable all_days         as integer.
define shared variable qty              like sod_qty_ord.
define shared variable part             as character format "x(18)".
define shared variable eff_date         as date.
define shared variable ref              like glt_det.glt_ref.
define shared variable so_recno         as recid.
define shared variable base_amt         like ar_amt.
define shared variable ln_fmt           like soc_ln_fmt.
define shared variable tax_in           like cm_tax_in.
define shared variable exch_rate        like exr_rate.
define shared variable exch_rate2       like exr_rate2.
define shared variable exch_ratetype    like exr_ratetype.
define shared variable exch_exru_seq    like exru_seq.
define shared variable so_db            like dc_name.
define shared variable soc_pc_line      like mfc_logical.
define shared variable socrt_int        like sod_crt_int.
define shared variable mult_slspsn      like mfc_logical no-undo.
define shared variable reprice          like mfc_logical.
define shared variable new_order        like mfc_logical.
define shared variable perform_date     as date label "Perform Date".
 
define new shared variable trlot        like tr_lot.
define new shared variable sod_recno    as recid.
define new shared variable pcqty        like sod_qty_ord.
define new shared variable sodcmmts     like soc_lcmmts label "Comments".
define new shared variable prev_consume like sod_consume.
define new shared variable amd          as character.
define new shared variable pl           like pt_prod_line.
define new shared variable ad_mod_del   as character.
define new shared variable undo_all     like mfc_logical initial no.
define new shared variable prev_type    like sod_type.
define new shared variable prev_site    like sod_site.
define new shared variable clines       as integer initial ?.
define new shared variable delete_line  like mfc_logical.
define new shared variable new_site     like sod_site.
define new shared variable err_stat     as integer.
define new shared variable sonbr        like sod_nbr.
define new shared variable soline       like sod_line.
define new shared variable continue     like mfc_logical.
define new shared variable location     like sod_loc.
define new shared variable lotser       like sod_serial.
define new shared variable lotrf        like sr_ref.
define new shared variable exch-rate    like exr_rate.
define new shared variable exch-rate2   like exr_rate2.
define new shared variable new_line     like mfc_logical.
define new shared variable noentries    as integer no-undo.
define new shared variable discount     as decimal label "Discount"
                                        format "->>>9.9<<<".
define new shared variable reprice_dtl  like mfc_logical
                                        label "Reprice".
define new shared variable save_parent_list like sod_list_pr.
define new shared variable cmtindx          like cmt_indx.
define new shared variable l_prev_db        like si_db no-undo.
define new shared variable old_taxable  like sod_taxable no-undo.
define shared variable l_consume        like sod_consume no-undo.
 
define new shared frame c.
define new shared frame d.
 
define variable desc1            like pt_desc1.
define variable l_ln_fmt         like soc_ln_fmt no-undo.
define variable first_time       like mfc_logical initial yes.
define variable err-flag         as integer.
define variable ptstatus         like pt_status.
define variable imp-okay         like mfc_logical no-undo.
define variable l_changedb       like mfc_logical no-undo.
define variable return-msg       like msg_nbr initial 0 no-undo.
define variable rtn_error        as logical no-undo.
define variable disc_min_max     like mfc_logical.
define variable disc_pct_err     as   decimal.
define variable mc-error-number  like msg_nbr     no-undo.
define variable cust-resv-loc    like locc_loc    no-undo.
define variable useloc           like mfc_logical no-undo.
define variable l_sonbr          like sod_nbr     no-undo.
define variable i                as   integer     no-undo.
define variable l_sod_qty_chg    like sod_qty_chg no-undo.
define variable lotref           like sr_ref format "x(8)" no-undo.
 
{us/pp/ppptup.i}
define variable defaultUpSell    as   logical      no-undo.
define variable itemRepRecid     as   recid        no-undo.
define variable crossSellExist   as   logical      no-undo.
define variable crossSellItem    like pt_part      no-undo.
define variable crossSellCmtIndx like ptre_cmtindx no-undo.
define variable crossSellOrdQty  like sod_qty_ord  no-undo.
define variable crossSoldQty     like sod_qty_ord  no-undo.
define variable accept           as   logical      no-undo.
define variable is_active like mfc_logical initial no   no-undo.
define variable is_lock   like mfc_logical initial no   no-undo.
 
define new shared workfile wf-tr-hist
   field trsite      like tr_site
   field trloc       like tr_loc
   field trlotserial like tr_serial
   field trref       like tr_ref
   field trqtychg    like tr_qty_chg
   field trum        like tr_um
   field trprice     like tr_price.
 
/* User Update Restrictions Temp Table Definition */
{us/up/updaterestriction.i}
 
form
   space(1)
   so_nbr
   so_cust
   ln_fmt
with frame a side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
/* Define shared line screens */
{us/so/soivlnfm.i}
 
define shared temp-table tt_soddet no-undo like sod_det.
 
for first so_mstr where recid(so_mstr) = so_recno
no-lock: end.
 
for first cm_mstr
    where cm_mstr.cm_domain = global_domain
     and  cm_mstr.cm_addr = so_cust
no-lock: end.
 
find first soc_ctrl where soc_domain = global_domain no-lock.
eff_date = so_ship_date.
 
find first pic_ctrl where pic_domain = global_domain no-lock.
 
display
   so_nbr
   so_cust
   ln_fmt
with frame a.
 
/* SET DISPLAY OF THE MULTIPLE SALESPERSON FLAG          */
/* MULPITLE COMMISSION UPDATES WILL ONLY HAPPEN IF TRUE. */
if so_slspsn[2] <> "" or
   so_slspsn[3] <> "" or
   so_slspsn[4] <> ""
then
   mult_slspsn = true.
else
   mult_slspsn = false.
 
if ln_fmt then clines = 1.
 
linefmt:
repeat on endkey undo, leave:
 
   assign l_ln_fmt = ln_fmt.
   if not first_time then
      update ln_fmt with frame a.
 
   if l_ln_fmt <> ln_fmt  then
      clear frame c all no-pause.
 
   clines = ?.
   if ln_fmt then clines = 1.
 
   first_time = no.
 
   assign
      crossSellExist = no
      crossSellItem = "".
 
   mainloop:
   repeat on endkey undo, next linefmt
   with frame c down:
 
      /* CHECK FOR CROSS SELL ITEM */
      /* Check if there are any cross sell record, if yes, then select first */
      /* record to default and delete that from temp-table */
 
      if can-find(first ttUpSell) then do:
         find first ttUpSell exclusive-lock no-error.
         if available ttUpSell then do:
            find first ptre_det where recid(ptre_det) = tt_recid no-lock.
            assign
               crossSellExist   = yes
               crossSellItem    = tt_upsell_part
               crossSellCmtIndx = tt_cmtindx.
 
            if (crossSoldQty / ptre_qty)
               - truncate(crossSoldQty / ptre_qty , 0) <> 0
            then
               crossSellOrdQty  = crossSoldQty * (ptre_rep_qty / ptre_qty).
            else
               crossSellOrdQty = ptre_rep_qty * (crossSoldQty / ptre_qty).
 
            {us/bbi/gprun.i ""gpqtyrnd.p""
                     "(input  crossSellOrdQty,
                       input  ptre_round_qty,
                       output crossSellOrdQty)" }
 
            delete ttUpSell.
         end. /* if available ttUpSell */
      end. /* if can-find (first ttUpSell) */
      else
         crossSellExist = no.
 
      do transaction:
 
         find first so_mstr where recid(so_mstr) = so_recno
         exclusive-lock no-error.
 
         reprice_dtl = reprice.
 
         hide frame d.
         hide frame c.
         view frame c.
 
         if ln_fmt then do:
            view frame d.
            display l_sod_consume with frame d.
         end. /* IF ln_fmt THEN DO: */
 
         assign
            sodcmmts = soc_lcmmts
            lotref   = "".
 
         /* SCREENS & REPORTS DON'T SUPPORT 4 DIGIT LINE NOS. */
         if line < 999 then
            line = line + 1.
         else
         if line = 999 then do:
            {us/bbi/pxmsg.i &MSGNUM=7418 &ERRORLEVEL=2}  /* LINE CANNOT BE > 999 */
         end.
 
         find sod_det
            where sod_domain = global_domain
             and  sod_nbr = so_nbr
             and  sod_line = line
         no-lock no-error.
 
         if not available sod_det then do:
 
            discount = if not pic_so_fact then
                          0
                       else
                          1.
            display
               line
               "" @ sod_part
               0  @ sod_qty_chg
               "" @ sod_um
               0  @ sod_list_pr
               discount
               0  @ sod_price
            with frame c.
 
         end.
 
         if available sod_det then do:
 
            run p_get_lotref
                (input sod_nbr,
                 input  sod_line,
                 input  sod_part,
                 output lotref).
 
            find pt_mstr
               where pt_domain = global_domain
                and  pt_part = sod_part
            no-lock no-error no-wait.
            if available pt_mstr then
               desc1 = pt_desc1.
            else
            if sod_desc <> "" then
               desc1 = sod_desc.
            else
               desc1 = getTermLabel("ITEM_NOT_IN_INVENTORY",24).
 
            /* DETERMINE DISCOUNT DISPLAY FORMAT AND SET VARIABLE discount */
            {us/gp/gppidisc.i pic_so_fact sod_disc_pct pic_so_rfact}
 
            /* REMEMBER, RMA RECEIPT LINES CONTAIN NEGATIVE QTY'S */
            /* BUT THEY SHOULD DISPLAY POSITIVE...                */
            display
               line
               sod_part
               sod_qty_inv        when (sod_fsm_type <> "RMA-RCT") @ sod_qty_chg
               (sod_qty_inv * -1) when (sod_fsm_type = "RMA-RCT") @ sod_qty_chg
               sod_um
               sod_list_pr
               discount
               sod_price
            with frame c.
 
            if ln_fmt then do:
 
               if sod_fsm_type <> "RMA-RCT" then do:
                  if sod_qty_ord >= 0 then
                     display
                        max(sod_qty_ord - sod_qty_ship, 0) @ sod_bo_chg
                     with frame d.
                  else
                     display
                        min(sod_qty_ord - sod_qty_ship, 0) @ sod_bo_chg
                     with frame d.
               end.
 
               else /* FOR RMA RECEIPT LINES, FLIP THE SIGN */
                  display
                     (sod_qty_inv * -1) @ sod_bo_chg
                  with frame d.
 
               display
                  sod_std_cost
                  sod_type
                  sod_due_date
                  sod_loc
                  sod_fr_list
                  sod_site
                  sod_qty_all
                  sod_qty_pick
                  sod_qty_inv        when (sod_fsm_type <> "RMA-RCT")
                  (sod_qty_inv * -1) when (sod_fsm_type = "RMA-RCT") @ sod_qty_inv
                  sod_serial
                  lotref
                  sod_acct
                  sod_sub
                  sod_cc
                  sod_project
                  sod_dsc_acct
                  sod_dsc_sub
                  sod_dsc_cc
                  sod_dsc_project
                  sod_confirm
                  sod_um_conv
                  l_sod_consume
                  sod_consume
                  sod_taxable
                  sod_taxc
                  sod_req_date
                  sod_per_date
                  sod_slspsn[1]
                  mult_slspsn
                  sod_comm_pct[1]
                  desc1
                  (sod_cmtindx <> 0) @ sodcmmts
                  sod_crt_int
                  sod_fix_pr
                  sod_pricing_dt
               with frame d.
 
            end.
 
         end.
 
         update
            line when (not crossSellExist)
         with frame c
         editing:
 
            /* TO SHOW SO LINES FOR SELECTED SO IN CHAR AND GUI  */
            /* USING LOOK-UP OR DRILL DOWN BROWSE ON LINE FIELD. */
            {us/gp/gpbrparm.i &browse=gpbr241.p &parm=c-brparm1 &val="so_nbr"}
            {us/gp/gpbrparm.i &browse=gplu241.p &parm=c-brparm1 &val="so_nbr"}
 
            l_sonbr = so_nbr.
 
            /* FIND NEXT RECORD */
            {us/mf/mfnp01.i sod_det line sod_line so_nbr  " sod_domain =
               global_domain and sod_compl_stat = '' and sod_nbr "  sod_nbrln}
 
            if recno <> ? then do:
 
               run p_get_lotref
                  (input sod_nbr,
                   input  sod_line,
                   input  sod_part,
                   output lotref).
 
               find pt_mstr where pt_domain = global_domain
                  and pt_part = sod_part
               no-lock no-error no-wait.
               if available pt_mstr then
                  desc1 = pt_desc1.
               else
               if sod_desc <> "" then
                  desc1 = sod_desc.
               else
                  desc1 = getTermLabel("ITEM_NOT_IN_INVENTORY",24).
               line = sod_line.
 
               /* DETERMINE DISCOUNT DISPLAY FORMAT AND SET VARIABLE discount */
               {us/gp/gppidisc.i pic_so_fact sod_disc_pct pic_so_rfact}
 
               display
                  line
                  sod_part
                  sod_qty_inv        when (sod_fsm_type <> "RMA-RCT")
                                     @ sod_qty_chg
                  (sod_qty_inv * -1) when (sod_fsm_type =  "RMA-RCT")
                                     @ sod_qty_chg
                  sod_um
                  sod_list_pr
                  discount
                  sod_price
               with frame c.
 
               if ln_fmt then do:
                  if sod_fsm_type <> "RMA-RCT" then do:
                     if sod_qty_ord >= 0 then
                        display
                           max(sod_qty_ord - sod_qty_ship, 0) @ sod_bo_chg
                        with frame d.
                     else
                        display
                           min(sod_qty_ord - sod_qty_ship, 0) @ sod_bo_chg
                        with frame d.
                  end.
                  else /* FOR RMA RECEIPT LINES, FLIP THE SIGN */
                     display
                        (sod_qty_inv * -1)  @ sod_bo_chg
                     with frame d.
 
                  display
                     sod_std_cost
                     sod_type
                     sod_due_date
                     sod_loc
                     sod_fr_list
                     sod_site
                     sod_qty_all
                     sod_qty_pick
                     sod_qty_inv        when (sod_fsm_type <> "RMA-RCT")
                     (sod_qty_inv * -1) when (sod_fsm_type = "RMA-RCT")
                                        @ sod_qty_inv
                     sod_serial
                     lotref
                     sod_acct
                     sod_sub
                     sod_cc
                     sod_project
                     sod_dsc_acct
                     sod_dsc_sub
                     sod_dsc_cc
                     sod_dsc_project
                     sod_confirm
                     sod_um_conv
                     l_sod_consume
                     sod_consume
                     sod_taxable
                     sod_taxc
                     sod_req_date
                     sod_per_date
                     sod_slspsn[1]
                     mult_slspsn
                     sod_comm_pct[1]
                     desc1
                     (sod_cmtindx <> 0) @ sodcmmts
                     sod_crt_int
                     sod_fix_pr
                     sod_pricing_dt
                     sod_order_category
                  with frame d.
 
               end.
 
            end.
 
         end.
 
         /* ADD/MOD/DELETE  */
         find sod_det where sod_domain = global_domain
            and  sod_nbr = so_nbr
            and  sod_line = input line
         no-error.
 
         /* Check China Golden Tax Status */
         {us/gp/gprunp.i "gtcheck" "p" "gt-check-func" "(output is_active)"}
 
         if is_active and available(so_mstr)
         then do:
            is_lock = no.
            {us/gp/gprunp.i "gtcheck" "p" "gt-check-status"
               "(input  so_nbr,
                 output is_lock)"}
 
            if is_lock = yes
            then do:
               /*Record is locked for Golden Tax Invoice process */
               {us/bbi/pxmsg.i &MSGNUM=12003 &ERRORLEVEL=3}
               undo, retry.
            end.
         end.
 
         noentries = 0.
 
         if available sod_det and sod_compl_stat <> "" then do:
            /* Sales Order Line is Closed */
            {us/bbi/pxmsg.i &MSGNUM=8025 &ERRORLEVEL=3}
            undo, retry.
         end.
 
         if available sod_det then do:
 
            /* User Update Restriction Procedure Library */
            run mfairunh.p
               (input "mgurpl.p",
                input ?,
                output hUpdateRestrictedLibrary).
 
            /* User Update Restriction Constants */
            {us/mg/mgurpl.i "hUpdateRestrictedLibrary"}
 
            /* VALIDATE IF THE USER UPDATE IS RESTRICTED */
            /* CLEAR TEMP TABLE RECORDS BEFORE CREATING NEW RECORD */
            empty temp-table ttUpdateRestrictionSignature.
 
            /* CREATE TEMP-TABLE RECORD */
            create ttUpdateRestrictionSignature.
            assign
               ttUpdateRestrictionSignature.category              = {&SOMT}
               ttUpdateRestrictionSignature.program               = execname
               ttUpdateRestrictionSignature.part                  = sod_det.sod_part
               ttUpdateRestrictionSignature.site                  = sod_det.sod_site
               ttUpdateRestrictionSignature.siteTo                = ?
               ttUpdateRestrictionSignature.location              = sod_det.sod_loc
               ttUpdateRestrictionSignature.locationTo            = ?
               ttUpdateRestrictionSignature.inventoryStatus       = ?
               ttUpdateRestrictionSignature.inventoryStatusTo     = ?
               ttUpdateRestrictionSignature.account               = ?
               ttUpdateRestrictionSignature.subaccount            = ?
               ttUpdateRestrictionSignature.costCenter            = ?
               ttUpdateRestrictionSignature.project               = ?
               ttUpdateRestrictionSignature.changeInventoryStatus = ?.
            if recid(ttUpdateRestrictionSignature) = -1 then .
 
            if isUpdateRestricted(input table ttUpdateRestrictionSignature,
                                  input true)
            then do:
               undo mainloop, retry.
            end.
 
            delete procedure hUpdateRestrictedLibrary.
         end.
 
         for each wf-tr-hist exclusive-lock:
            delete wf-tr-hist.
         end.
 
         /* DO NOT LET THE USER CREATE RMA LINE ITEMS HERE - USE RMA MAINT */
         if not available sod_det and so_fsm_type = "RMA"
         then do:
            {us/bbi/pxmsg.i &MSGNUM=1310 &ERRORLEVEL=3}    /* RECORD NOT FOUND */
            {us/bbi/pxmsg.i &MSGNUM=1262 &ERRORLEVEL=1}
            /* USE RMA MAINT TO CREATE NEW RMA LINES */
            undo, retry.
         end.    /* if not available sod_det and... */
 
         if not available sod_det then do:
 
            /* LINE 0 ENTRY SHOULD NOT BE ALLOWED */
            if line = 0
            then do:
               /* INVALID LINE NUMBER */
               {us/bbi/pxmsg.i &MSGNUM=642 &ERRORLEVEL=4}
               undo mainloop, retry.
            end. /* IF line = 0 */
 
            if not new_order then
               reprice_dtl = yes.  /*This will cause the line to be priced*/
 
            assign
               amd = "ADD"
               lotref = "".
 
            create sod_det.
            assign
               sod_domain      = global_domain
               sod_nbr         = so_nbr
               sod_line        = input line
               sod_confirm     = yes
               sod_due_date    = so_due_date
               sod_pricing_dt  = so_pricing_dt
               sod_pr_list     = so_pr_list
               sod_consume     = l_consume
               sod_site        = so_site
               sod_slspsn[1]   = so_slspsn[1]
               sod_slspsn[2]   = so_slspsn[2]
               sod_slspsn[3]   = so_slspsn[3]
               sod_slspsn[4]   = so_slspsn[4]
               sodcmmts        = soc_lcmmts
               sod_fr_list     = so_fr_list
               sod_fix_pr      = so_fix_pr
               sod_crt_int     = socrt_int
               sod_enduser     = so_ship
               sod_contr_id    = so_po
               sod_project     = so_project
               sod_dsc_project = so_project.
 
            if so_req_date <> so_due_date then
               sod_req_date = so_req_date.
            if perform_date <> so_due_date
            then
               sod_per_date = perform_date.
 
            assign
               desc1       = ""
               new_line    = yes
               so_to_inv   = yes.
 
            /* Set tax defaults */
            /* INITIALIZE TAX MANAGEMENT FIELDS */
            assign
               sod_taxable   = so_taxable
               sod_taxc      = so_taxc
               sod_tax_usage = so_tax_usage
               sod_tax_env   = so_tax_env
               sod_tax_in    = tax_in.
 
            assign line.
 
            /* DETERMINE DISCOUNT DISPLAY FORMAT AND SET VARIABLE discount */
            {us/gp/gppidisc.i pic_so_fact sod_disc_pct pic_so_rfact}
 
            if crossSellExist then
               sod_det.sod_part = crossSellItem.
 
            display
               line
               sod_part
               sod_qty_inv @ sod_qty_chg
               sod_um
               sod_list_pr
               discount
               sod_price
            with frame c.
 
            /* Display line detail if in single line mode */
            if ln_fmt then
            display
               base_curr
               sod_std_cost
               sod_type
               sod_due_date
               sod_loc
               sod_fr_list
               sod_site
               sod_qty_all
               sod_qty_pick
               sod_qty_inv
               sod_serial
               lotref
               sod_acct
               sod_sub
               sod_cc
               sod_project
               sod_dsc_acct
               sod_dsc_sub
               sod_dsc_cc
               sod_dsc_project
               sod_confirm
               sod_um_conv sod_taxable sod_taxc
               l_sod_consume
               sod_consume
               sod_req_date sod_per_date
               sod_slspsn[1] mult_slspsn sod_comm_pct[1]
               desc1 sodcmmts
               sod_crt_int
               sod_fix_pr
               sod_pricing_dt
               sod_order_category
            with frame d.
 
            prompt-for sod_det.sod_part when (not crossSellExist)
            with frame c
            editing:
 
               /* FIND NEXT/PREVIOUS RECORD */
               {us/mf/mfnp.i pt_mstr sod_part  " pt_domain = global_domain
                  and pt_part "  sod_part pt_part pt_part}
 
               if recno <> ? then do:
                  assign
                     desc1    = pt_desc1
                     sod_part = pt_part
                     sod_um   = pt_um.
 
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                     "(input base_curr,
                       input so_curr,
                       input so_ex_rate2,
                       input so_ex_rate,
                       input pt_price,
                       input false,
                       output sod_list_pr,
                       output mc-error-number)"}
                  if mc-error-number <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                  end.
 
                  sod_price = sod_list_pr.
 
                  /*DETERMINE DISCOUNT DISPLAY FORMAT AND SET VARIABLE discount*/
                  {us/gp/gppidisc.i pic_so_fact sod_disc_pct pic_so_rfact}
 
                  display
                     sod_part
                     sod_um
                     sod_list_pr
                     discount
                     sod_price
                  with frame c.
 
                  if ln_fmt then display desc1 with frame d.
 
               end.
 
            end.
 
            assign
               sod_part  = input sod_part
               sod_recno = recid(sod_det).
 
            /* CHECKING OF CUST PART AND COMMISSION CALCULATION */
            {us/bbi/gprun.i
               ""soivmta3.p""
               "(output rtn_error)"}
            if rtn_error then undo, retry.

/*cy1046* start added code */ 
            {us/bbi/gprun.i ""xxulab.p"" 
                    "('sod_part',
		      'yes',
		      'sod_det',
		      recid(sod_det),
		      output rtn_error)"}
	    if not rtn_error then undo, retry.
/*cy1046* end   added code */ 
 
            find pt_mstr
               where pt_domain = global_domain
                and  pt_part = sod_part
            no-lock no-error.
            /* Set line defaults from part master (if available) */
            if available pt_mstr then do:
 
               /* INITIALIZE FREIGHT VALUES*/
               assign
                  sod_fr_class = pt_fr_class
                  sod_fr_wt    = pt_ship_wt
                  sod_fr_wt_um = pt_ship_wt_um
                  ptstatus     = pt_status
                  substring(ptstatus,9,1) = "#".
 
               if can-find(isd_det where isd_domain = global_domain
                                     and isd_status = ptstatus
                                     and isd_tr_type = "ADD-SO")
               then do:
                  {us/bbi/pxmsg.i &MSGNUM=358 &ERRORLEVEL=3 &MSGARG1=pt_status}
                  undo, retry.
               end.
 
               /* Tax information */
               assign
                  sod_taxable  = (so_taxable and pt_taxable)
                  sod_taxc     = pt_taxc
                  sod_prodline = pt_prod_line
                  sod_um       = pt_um .
 
               /* SEE IF THERE IS A DEFAULT LOCATION FOR A  */
               /* CUSTOMER RESERVED LOCATION                */
               {us/bbi/gprun.i ""sorldft.p""
                  "(input so_ship,
                    input so_bill,
                    input so_cust,
                    input sod_site,
                    output cust-resv-loc,
                    output useloc)"}
 
               if useloc = yes then
                 sod_loc = cust-resv-loc.
               else do:
                  {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                           &PARAM =  "(input  sod_part,
                                       input  sod_site,
                                       input ""pt_loc"",
                                       output sod_loc)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
               end.
               if so_curr = base_curr then
                  assign
                     sod_price   = if sod_fsm_type <> "RMA-RCT" then
                                      pt_price
                                   else
                                      sod_price
                     sod_list_pr = if sod_fsm_type <> "RMA-RCT" then
                                      pt_price
                                   else
                                      sod_list_pr.
 
               /* Set default line site to pt_mstr site if header site is */
               global_part = sod_part.
 
               if sod_type = "" then do:
 
                  new_site = sod_site.
                  {us/bbi/gprun.i ""gpptsi01.p""}
 
                  if err_stat <> 0 then do:
                     new_site = pt_site.
                     {us/bbi/gprun.i ""gpptsi01.p""}
 
                     if err_stat = 0 then do:
 
                        sod_site = pt_site.
 
                        /* DEFAULT SITE INVALID */
                        /* CHANGED TO ITEM DEFAULT */
                        {us/bbi/pxmsg.i &MSGNUM=6201 &ERRORLEVEL=1 &MSGARG1=sod_site}
                        if not batchrun then pause.
 
                        /* NOW CHECK ITEM DEFAULT SITE */
                        {us/bbi/gprun.i
                           ""soivmta5.p""
                           "(input pt_site,
                             input-output lotref,
                             output return_int)"}
                        if return_int = 0 and not ln_fmt then
                           undo mainloop, retry mainloop.
 
                     end.
 
                     /* If multi-line, we need to reject the line NOW. */
                     else if not ln_fmt then do:
                        /* Item does not exist at site */
                        {us/bbi/pxmsg.i &MSGNUM=715 &ERRORLEVEL=3}
                        undo mainloop, next mainloop.
                     end.
 
                  end.
 
               end.
 
            end.  /* available pt_mstr */
 
            else if not ln_fmt and so_site = "" then do:
               {us/bbi/pxmsg.i &MSGNUM=941 &ERRORLEVEL=3} /* BLANK SITE NOT ALLOWED */
               undo mainloop, next mainloop.
            end.
 
            if crossSellExist then do:
               if crossSellcmtindx <> 0 then do:
                  /* COPY THE TRANSACTION COMMENTS */
                  {us/px/pxrun.i &PROC = 'copyComments' &PROGRAM = 'gpcmxr.p'
                           &HANDLE=ph_gpcmxr
                           &PARAM = "(input  crossSellcmtindx,
                                      output sod_cmtindx)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
                  sodcmmts = sod_cmtindx <> 0.
               end. /* if ptre_cmtindx <> 0 */
            end. /* if crossSellExist */
         end. /* ADD NEW LINE ITEM */
 
         else do:
 
            /* MODIFY EXISTING LINE */
            if not sod_confirm then do:
               /* Sales order line has not been confirmed */
               {us/bbi/pxmsg.i &MSGNUM=646 &ERRORLEVEL=3}
               undo, next mainloop.
            end.
 
            /* IF THIS IS A RMA RECEIPT LINE, INVOICE AND BACKORDER QTYS */
            /* (AS STORED IN SOD_DET) ARE NEGATIVE, SO, WE'LL NEED TO DO */
            /* SOME EXTRA WORK TO SHOW THEM AS POSITIVE.  ALSO, TELL THE */
            /* USER IF HE'S PICKED UP A RECEIPT LINE.                    */
            if sod_fsm_type = "RMA-RCT" then do:
               /* THIS IS AN RMA RETURN LINE */
               {us/bbi/pxmsg.i &MSGNUM=1261 &ERRORLEVEL=1}
            end.   /* if sod_fsm_type = "RMA-RCT" */
 
            new_line = no.
 
            /* ADDED SECTION BELOW TO ACCESS TR_HIST OF THE INVENTORY DATABASE */
            find si_mstr
               where si_domain = global_domain
                and  si_site = sod_site
            no-lock no-error.
 
            assign
               l_changedb = (si_db <> so_db)
               l_prev_db  = si_db.
 
            if l_changedb then do:
               {us/bbi/gprun.i ""gpalias2.p"" "(sod_site,output err-flag)" }
            end.
 
            /* ACCESS tr_hist RECORDS TO CREATE WORKFILE wf-tr-hist */
            {us/bbi/gprun.i ""soivmtu3.p""
               "(input sod_nbr, input sod_line,
                 input sod_part, input-output lotrf,
                 input-output noentries)"  }
 
            if l_changedb then do:
               {us/bbi/gprun.i ""gpalias3.p"" "(so_db,output err-flag)" }
            end.
 
            /* Check for detail allocations */
            if can-find(first lad_det where lad_domain = global_domain
                                       and  lad_dataset = "sod_det"
                                       and  lad_nbr = sod_nbr
                                       and  lad_line = string(sod_line))
            then do:
               /* Detail Allocations Exist */
               {us/bbi/pxmsg.i &MSGNUM=4990 &ERRORLEVEL=2}
            end.
 
            assign
               amd = "MODIFY"
               sod_qty_chg = - sod_qty_inv.
 
            /* First empty the temp table and then create copy  */
            /* of old line info to track changes                */
            empty temp-table tt_soddet no-error.
            buffer-copy sod_det to tt_soddet.
 
            sod_det.sod_qty_chg = sod_det.sod_qty_inv.
 
            if sod_det.sod_qty_ord >= 0 then
               sod_det.sod_bo_chg = max(sod_det.sod_qty_ord - sod_det.sod_qty_ship, 0).
            else
               sod_det.sod_bo_chg = min(sod_det.sod_qty_ord - sod_det.sod_qty_ship, 0).
 
         end.  /* modify existing line */
 
         /* Pause to show messages that will otherwise be hidden when */
         if ln_fmt then do:
            message.
            message.
         end.
 
         assign
            prev_type     = sod_det.sod_type
            prev_site     = sod_det.sod_site
            undo_all      = yes
            l_sod_qty_chg = sod_det.sod_qty_chg
            so_recno      = recid(so_mstr)
            sod_recno     = recid(sod_det).
 
         hide message no-pause.
 
         {us/bbi/gprun.i ""soivmtea.p""
            "(input crossSellExist,
              input crossSellOrdQty,
              input-output lotref,
              output return-msg)"}
 
         if amd = "MODIFY"
            and l_sod_qty_chg <> sod_det.sod_qty_chg
            or (old_taxable   <> sod_det.sod_taxable)
         then
            so_to_inv   = yes.
 
         if undo_all = yes then undo mainloop, next mainloop.
 
         /* CREATING pk_det RECORD FOR FAMILY PLANNING ITEMS. */
         if sod_det.sod_sched then do:
            {us/mf/mfdel.i pk_det " where pk_domain = global_domain
                and pk_user = SessionUniqueID"}
            part = sod_det.sod_part.
            {us/bbi/gprun.i ""sopbex.p""}
         end. /* IF sod_sched */
 
         /* Check whether its a new order and the qty has been
            changed for a new line item*/
         if     new_order
            and l_sod_qty_chg <> sod_det.sod_qty_chg
         then do:
            if can-find(first tr_hist
                        where tr_hist.tr_domain = global_domain
                          and tr_hist.tr_nbr    = sod_det.sod_nbr
                          and tr_hist.tr_line   = sod_det.sod_line)
            then do:
               sod_det.sod_qty_inv = 0.
            end. /* IF CAN-FIND (FIRST tr_hist .. */
         end. /* IF new_order .. */
 
         /* Switch to the inventory database and update it */
         {us/bbi/gprun.i ""soivmtu1.p""}
 
         if del-yn = yes then do:
            continue = no.
            {us/bbi/gprun.i
               ""soivmta4.p""
               "(input-output lotref)"}
            if continue = no then undo mainloop, next mainloop.
            if continue = yes then next mainloop.
         end.
 
         if not sod_det.sod_bonus
            and soc_apm
            and available cm_mstr
            and cm_promo <> ""
         then
         for each pih_hist
            where pih_domain   = global_domain
              and pih_doc_type = 1
              and pih_nbr      = sod_det.sod_nbr
              and pih_line     = sod_det.sod_line
         no-lock:
 
            if pih_promo2 = "B" then do on endkey undo, leave:
               find pi_mstr
                  where pi_domain = global_domain
                    and pi_list_id = pih_list_id
               no-lock no-error.
               if available pi_mstr then do:
                  cmtindx = pi_mstr.pi_cmtindx.
                  {us/bbi/gprun.i ""gpcmmt04.p"" "(input ""pi_mstr"")"}
               end.
            end. /* contain bonus stock price list */
 
         end. /*  for each pih_hist  */
 
         if not ln_fmt then down 1 with frame c.
 
         /* IF IMPORT EXPORT MASTER RECORD EXIST  THEN CALL THE IMPORT     */
         /* EXPORT DETAIL LINE CREATION PROGRAM TO CREATE ied_det          */
         imp-okay = no.
 
         if can-find(first ie_mstr where ie_domain = global_domain
                       and ie_type = "1" and ie_nbr = sod_det.sod_nbr)
         then do:
            {us/bbi/gprun.i ""iedetcr.p"" "(input ""1"",
                     input sod_det.sod_nbr,
                     input sod_det.sod_line,
                     input recid(sod_det),
                     input-output imp-okay)"}
            if imp-okay = no  then undo mainloop, retry.
         end.
 
      end. /* do transaction */
 
      /* CHECK FOR CROSS-SELL */
      if new_line = yes then do:
 
         if crossSellExist = no then do:
            /* Check, if there is any cross sell record exist */
            if can-find(first ptre_det where ptre_domain = global_domain
                          and ptre_type = "30"
                          and ptre_part = sod_det.sod_part
                          and ptre_eff_date <= so_ord_date
                          and (ptre_end_date >= so_ord_date
                               or ptre_end_date = ?)
                       )
            then do:
               /* Create temp table ttUpSell */
               {us/bbi/gprun.i ""ppptup.p""
                  "(input "30",
                    input sod_det.sod_part,
                    input so_ord_date,
                    input sod_det.sod_site,
                    input so_cust,
                    input so_ship,
                    output defaultUpSell,
                    output table ttUpSell
                    )"}
               if can-find(first ttUpSell) then do:
                  for each ttUpSell:
                     /* VALIDATE THE ENTERED ITEM CODE */
                     {us/px/pxrun.i &PROC='getAvailToAllocQty'  &PROGRAM='ppptrexr.p'
                              &HANDLE=ph_ppptrexr
                              &PARAM="(input sod_det.sod_site,
                                       input tt_upsell_part,
                                       input so_ship,
                                       input so_bill,
                                       input so_cust,
                                       input so_fsm_type,
                                       input so_db,
                                       input no,
                                       output tt_avail_alloc
                                      )"
                              &NOAPPERROR=True
                              &CATCHERROR=True}
 
                     /* Calculate the best price */
                     {us/bbi/gprun.i ""ppptbp.p"" "(input tt_upsell_part,
                                             input so_cust,
                                             input sod_det.sod_site,
                                             input tt_um,
                                             output tt_list_price)" }
                  end.
 
                  /* Display the scrolling cross-sell selection screen */
                  {us/bbi/gprun.i ""ppptcsp.p"" "(input-output table ttUpSell)" }
                  accept = yes.
                  find first ttUpSell exclusive-lock no-error.
                  if available ttUpSell then
                     find first ptre_det where recid(ptre_det) = tt_recid
                     no-lock.
                     if not ptre_auto_accept and not batchrun then do:
                        /* PLEASE CONFIRM UPDATE */
                        {us/bbi/pxmsg.i &MSGNUM=32 &ERRORLEVEL=1 &CONFIRM=accept}
                     end.
                     if not accept then
                        empty temp-table ttUpSell.
 
               end.
               /* Delete all the unselected records */
               for each ttUpSell where tt_mark = " " exclusive-lock:
                  delete ttUpSell.
               end.
            end. /* if can-find (ptre_det.. */
            /* Order Quantity of original item */
            crossSoldQty = sod_det.sod_qty_ord.
         end. /* if not crossSellExist */
      end. /* if new_line  = yes */
   end. /* mainloop */
 
end. /* linefmt */
 
if ln_fmt then hide frame d.
hide frame c.
hide frame a.
 
PROCEDURE p_get_lotref:
   define input parameter p_sodnbr  like sod_det.sod_nbr  no-undo.
   define input parameter p_sodline like sod_det.sod_line no-undo.
   define input parameter p_sodpart like sod_det.sod_part no-undo.
   define output parameter lotref   like sr_ref           no-undo.
 
   define buffer tr_hist for tr_hist.
 
   /* GET LOTSERIAL REFERENCE FROM  tr_hist */
   for last tr_hist where tr_domain = global_domain
        and tr_nbr    = p_sodnbr
        and tr_line   = p_sodline
        and tr_type  >= "iss-so"
        and tr_type  <= "iss-so"
        and tr_part   = p_sodpart
        and tr_rmks   = ""
   use-index tr_nbr_eff
   no-lock:
 
      lotref = tr_ref.
 
   end. /* FOR LAST tr_hist */
END PROCEDURE. /* p_get_lotref */
