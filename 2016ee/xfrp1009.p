/* xfrp1009.p - SALES ORDER INVOICE PRINT FOR ENGLISH PRINT CODE "9"          */
/* sorp1001.p - SALES ORDER INVOICE PRINT FOR ENGLISH PRINT CODE "1"          */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrp1009.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 5.0      LAST MODIFIED: 03/15/90   BY: MLB *B615*                */
/* REVISION: 6.0      LAST MODIFIED: 04/20/90   BY: ftb      *                */
/* REVISION: 6.0      LAST MODIFIED: 07/05/90   BY: WUG *D043*                */
/* REVISION: 5.0      LAST MODIFIED: 08/18/90   BY: MLB *B755*                */
/* REVISION: 6.0      LAST MODIFIED: 08/20/90   BY: MLB *D055*                */
/* REVISION: 6.0      LAST MODIFIED: 12/13/90   BY: dld *D257*                */
/* REVISION: 6.0      LAST MODIFIED: 12/21/90   BY: MLB *D238*                */
/* REVISION: 6.0      LAST MODIFIED: 01/04/90   BY: WUG *D288*                */
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425*                */
/* REVISION: 6.0      LAST MODIFIED: 10/21/91   BY: afs *D903*                */
/* REVISION: 6.0      LAST MODIFIED: 11/26/91   BY: WUG *D953*                */
/* REVISION: 7.0      LAST MODIFIED: 11/29/91   BY: SAS *F017*                */
/* REVISION: 7.0      LAST MODIFIED: 02/11/92   BY: tjs *F191*                */
/* REVISION: 7.0      LAST MODIFIED: 03/28/92   BY: dld *F322*                */
/* REVISION: 7.0      LAST MODIFIED: 03/31/92   BY: sas *F277*                */
/* REVISION: 7.0      LAST MODIFIED: 04/02/92   BY: afs *F348*                */
/* REVISION: 7.0      LAST MODIFIED: 04/09/92   BY: emb *F369*                */
/* REVISION: 7.0      LAST MODIFIED: 04/16/92   BY: sas *F378*                */
/* REVISION: 7.0      LAST MODIFIED: 06/08/92   BY: tjs *F504*                */
/* REVISION: 7.3      LAST MODIFIED: 09/04/92   BY: afs *G047*                */
/* REVISION: 7.3      LAST MODIFIED: 12/03/92   BY: afs *G341*                */
/* REVISION: 7.3      LAST MODIFIED: 02/19/93   by: jms *G712*                */
/* REVISION: 7.3      LAST MODIFIED: 04/05/93   BY: tjs *G858*                */
/* REVISION: 7.4      LAST MODIFIED: 07/15/93   BY: jjs *H050*                */
/* REVISION: 7.4      LAST MODIFIED: 08/19/93   BY: pcd *H009*                */
/* REVISION: 7.4      LAST MODIFIED: 10/28/93   BY: cdt *H197*                */
/* REVISION: 7.4      LAST MODIFIED: 05/03/94   BY: cdt *FN91*                */
/* REVISION: 7.4      LAST MODIFIED: 06/03/94   BY: dpm *GK02*                */
/* REVISION: 7.4      LAST MODIFIED: 10/05/94   BY: rxm *GM88*                */
/* REVISION: 7.4      LAST MODIFIED: 11/18/94   BY: smp *FT80*                */
/* REVISION: 7.4      LAST MODIFIED: 11/30/94   BY: smp *GO65*                */
/* REVISION: 7.4      LAST MODIFIED: 03/14/95   BY: kjm *F0MY*                */
/* REVISION: 7.4      LAST MODIFIED: 03/24/95   BY: kjm *F0NZ*                */
/* REVISION: 8.5      LAST MODIFIED: 03/30/95   BY: nte *J042*                */
/* REVISION: 7.4      LAST MODIFIED: 05/31/95   BY: jym *G0ND*                */
/* REVISION: 7.4      LAST MODIFIED: 07/19/95   BY: bcm *F0RW*                */
/* REVISION: 7.4      LAST MODIFIED: 10/13/95   BY: rxm *G0Z9*                */
/* REVISION: 7.4      LAST MODIFIED: 10/20/95   BY: jym *G0XY*                */
/* REVISION: 8.5      LAST MODIFIED: 07/25/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 01/05/96   BY: ais *G1J5*                */
/* REVISION: 8.5      LAST MODIFIED: 02/05/96   BY: ais *G0NX*                */
/* REVISION: 8.5      LAST MODIFIED: 04/11/96   BY: GWM *J0HW*                */
/* REVISION: 8.5      LAST MODIFIED: 04/12/96   BY: ais *G1QW*                */
/* REVISION: 8.5      LAST MODIFIED: 04/10/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 06/14/96   BY: *J0T0* Dennis Hensen      */
/* REVISION: 8.5      LAST MODIFIED: 06/26/96   BY: *J0WF* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 07/22/96   BY: *J0ZZ* T. Farnsworth      */
/* REVISION: 8.5      LAST MODIFIED: 08/07/96   BY: *G29K* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 11/14/96   BY: *G2J1* Amy Esau           */
/* REVISION: 8.5      LAST MODIFIED: 07/22/97   BY: *H1C9* Seema Varma        */
/* REVISION: 8.5      LAST MODIFIED: 08/19/97   BY: *J1Z0* Ajit Deodhar       */
/* REVISION: 8.5      LAST MODIFIED: 09/23/97   BY: *H1FM* Seema Varma        */
/* REVISION: 8.5      LAST MODIFIED: 10/20/97   BY: *H1F8* Nirav Parikh       */
/* REVISION: 8.5      LAST MODIFIED: 11/27/97   BY: *J273* Nirav Parikh       */
/* REVISION: 8.5      LAST MODIFIED: 12/30/97   BY: *J281* Manish K.          */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* Adam Harris        */
/* REVISION: 8.6E     LAST MODIFIED: 05/05/98   BY: *L00T* Ed v.d.Gevel       */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/29/98   BY: *L024* Sami Kureishy      */
/* REVISION: 8.6E     LAST MODIFIED: 09/08/98   BY: *H1MZ* Poonam Bahl        */
/* REVISION: 8.6E     LAST MODIFIED: 10/15/98   BY: *J29B* Ajit Deodhar       */
/* REVISION: 8.6E     LAST MODIFIED: 02/01/99   BY: *L0D5* Robin McCarthy     */
/* REVISION: 8.6E     LAST MODIFIED: 04/13/99   BY: *J3CZ* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 09/08/99   BY: *N02P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Murali Ayyagari    */
/* REVISION: 9.1      LAST MODIFIED: 10/18/99   BY: *K23R* Sachin Shinde      */
/* REVISION: 9.1      LAST MODIFIED: 11/02/99   BY: *N04P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 02/16/00   BY: *N06R* Denis Tatarik      */
/* REVISION: 9.1      LAST MODIFIED: 06/08/00   BY: *L0Z5* Ashwini G.         */
/* REVISION: 9.1      LAST MODIFIED: 06/28/00   BY: *N0DM* Rajinder Kamra     */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 11/07/00   BY: *L15K* Kaustubh K         */
/* Revision: 1.29.1.15     BY: Manisha Sawant     DATE: 12/07/00  ECO: *M0XL* */
/* Revision: 1.29.1.16     BY: BalbeerS Rajput    DATE: 10/14/00  ECO: *N0WB* */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.29.1.17    BY: Katie Hilbert       DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.29.1.18    BY: Ellen Borden        DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.29.1.19    BY: Jean Miller         DATE: 07/09/01  ECO: *P03Q* */
/* Revision: 1.29.1.20    BY: Patrick Rowan       DATE: 03/15/02  ECO: *P00G* */
/* Revision: 1.29.1.21    BY: Dipesh Bector       DATE: 01/14/03  ECO: *M21Q* */
/* Revision: 1.29.1.22    BY: Vandna Rohira       DATE: 04/28/03  ECO: *N1YL* */
/* Revision: 1.29.1.23    BY: Narathip W.         DATE: 05/21/03  ECO: *P0S8* */
/* Revision: 1.29.1.26    BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.29.1.26    BY: Manish Dani         DATE: 09/01/03  ECO: *P0VZ* */
/* Revision: 1.29.1.27    BY: Shoma Salgaonkar    DATE: 09/18/03  ECO: *N2L5* */
/* Revision: 1.29.1.28    BY: Somesh Jeswani      DATE: 10/10/03  ECO: *P131* */
/* Revision: 1.29.1.29    BY: Shivaraman V.       DATE: 02/05/04  ECO: *P1MR* */
/* Revision: 1.29.1.30    BY: Prashant Parab      DATE: 04/06/04  ECO: *P1WT* */
/* Revision: 1.29.1.31    BY: Bharath Kumar       DATE: 09/03/04  ECO: *P2J3* */
/* Revision: 1.29.1.32    BY: Ed van de Gevel     DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.29.1.33    BY: Ed van de Gevel     DATE: 03/16/05  ECO: *R00H* */
/* Revision: 1.29.1.34    BY: Ed van de Gevel     DATE: 18/03/05  ECO: *R00F* */
/* Revision: 1.29.1.35    BY: Dayanand Jethwa     DATE: 04/01/05  ECO: *P27M* */
/* Revision: 1.29.1.36    BY: Ed van de Gevel     DATE: 07/01/05  ECO: *R01H* */
/* Revision: 1.29.1.37    BY: Dinesh Dubey        DATE: 01/17/06  ECO: *P3HZ* */
/* Revision: 1.29.1.38    BY: Jean Miller         DATE: 02/17/06  ECO: *Q0R5* */
/* Revision: 1.29.1.39    BY: Tom Kennedy         DATE: 06/08/06  ECO: *Q0LK* */
/* Revision: 1.29.1.40    BY: Rafiq S.            DATE: 11/23/06  ECO: *P4YY* */
/* Revision: 1.29.1.43    BY: Jean Miller         DATE: 07/23/07  ECO: *R0C5* */
/* Revision: 1.29.1.46    BY: Edgar Roca          DATE: 09/24/07  ECO: *R0C6* */
/* Revision: 1.29.1.47    BY: Jean Miller         DATE: 02/20/08  ECO: *P5KF* */
/* Revision: 1.29.1.48    BY: Jean Miller         DATE: 06/20/08  ECO: *R0VG* */
/* Revision: 1.29.1.49    BY: Dinesh Dubey        DATE: 07/07/08  ECO: *R0W3* */
/* Revision: 1.29.1.50    BY: Deirdre O'Brien     DATE: 10/31/08  ECO: *R16Q* */
/* Revision: 1.29.1.54    BY: Jean Miller         DATE: 10/31/08  ECO: *R15M* */
/* Revision: 1.29.1.55       BY: Dilip Manawat    DATE: 10/03/08  ECO: *R15K* */
/* Revision: 1.29.1.56       BY: Sundeep Kalla    DATE: 05/27/09  ECO: *R1K4* */
/* Revision: 1.29.1.57       BY: Xiaolei Meng     DATE: 07/31/09  ECO: *R1N2* */
/* Revision: 1.29.1.58       BY: Dipanshu Talwar  DATE: 11/06/09  ECO: *R1TK* */
/* Revision: 1.29.1.60       BY: Jean Miller      DATE: 11/22/09  ECO: *R1TV* */
/* Revision: 1.29.1.61       BY: Jean Miller      DATE: 11/23/09  ECO: *R1TW* */
/* Revision: QAD2016      BY: sxh    DATE: 08/04/16  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* THIS PROGRAM IS SIMILAR TO soiv1001.p. CHANGES DONE IN THIS          */
/* PROGRAM MAY ALSO NEED TO BE DONE IN soiv1001.p.                      */

/* IN ORDER TO AVOID LOCKING ISSUES DURING INVOICE PRINT OF    */
/* SINGLE/MULTIPLE ORDERS, SKIP THE LOCKED ORDER AND PRINT THE */
/* INVOICES FOR THE REMAINING ORDERS.                          */

using com.qad.eefin.buser.EntitySecurityCheck.
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i adcrxr}
{us/px/pxphdef.i soldxr}

{us/gp/gpldcons.i}   /* CONSTANTS FOR LEGAL DOCUMENT */
{us/fs/fsconst.i}    /* CONSTANTS FOR SSM */

{us/xf/xfso10u.i} /*grc338*/
{us/xf/xfso10v.i} /*grc338*/
{us/xf/xfdefa.i}  /*grc338*/

define variable daybookSetBySiteInstalled like mfc_logical no-undo.
define variable hDaybooksetValidation as handle no-undo.
define variable iErrorNumber          as integer no-undo.
define variable daybookDate           as date       no-undo.
define variable lcovatreglbl          as character format "x(12)" no-undo.
define variable lcovatreg             as character format "x(16)" no-undo.

/* DAYBOOKSET VALIDATION LIBRARY PROTOTYPES */
{us/dy/dybvalpl.i hDaybooksetValidation}

/* INITIALIZE PERSISTENT PROCEDURES */
run mfairunh.p
   (input "dybvalpl.p",
    input ?,
    output hDaybooksetValidation).

define new shared temp-table t_absr_det no-undo
   field t_absr_id        like absr_id
   field t_absr_reference like absr_reference
   field t_absr_qty       as   decimal format "->>>>,>>>,>>9.99"
   field t_absr_ext       as   decimal format "->>>>,>>>,>>9.99"
   index t_absr_indx t_absr_id t_absr_reference.

define shared temp-table consolidated-so
   field cs-so-nbr   like so_nbr
   field cs-trl1-cd  like so_trl1_cd
   field cs-trl2-cd  like so_trl2_cd
   field cs-trl3-cd  like so_trl3_cd
   field cs-trl1-amt like so_trl1_amt
   field cs-trl2-amt like so_trl2_amt
   field cs-trl3-amt like so_trl3_amt
   field cs-added    as logical
index cs-primary is unique primary cs-so-nbr.
define temp-table tt_so_inv 
   field tt_so_inv_nbr     like so_inv_nbr
   field tt_invtot_ord_amt as decimal
index tt_so_inv tt_so_inv_nbr.

define new shared variable convertmode     as character no-undo initial "report".
define new shared variable rndmthd         like rnd_rnd_mthd.
define new shared variable old_sod_nbr     like sod_nbr.
define new shared variable pages           as integer.
define new shared variable so_recno        as recid.
define new shared variable billto          as character format "x(38)" extent 6.
define new shared variable soldto          as character format "x(38)" extent 6.
define new shared variable print_invoice   like mfc_logical.
define new shared variable rmaso           like mfc_logical.
define new shared variable sacontract      like mfc_logical.
define new shared variable fsremarks       as character format "x(60)".
define new shared variable ext_actual      like sod_price.
define new shared variable ext_margin      like sod_price.
define new shared variable comb_inv_nbr    like so_inv_nbr.
define new shared variable consolidate     like mfc_logical initial true.
define new shared variable undo_trl2       like mfc_logical.
define new shared variable undo_txdetrp    like mfc_logical.
define new shared variable new_order       like mfc_logical.
define new shared variable disc_prnt_label as character format "x(8)".
define new shared variable addtax          like mfc_logical.
define new shared variable shipper_id      like abs_id no-undo.
define new shared variable shipper_date    like abs_shp_date no-undo.
define new shared variable abs_recno       as recid.

define shared variable dom-ord          like so_nbr no-undo.
define shared variable dom-ord1         like so_nbr no-undo.
define shared variable daybookset       like dybs_code.
define shared variable daybookset1      like dybs_code.
define shared variable sls-psn          like so_slspsn[1] no-undo.
define shared variable sls-psn1         like so_slspsn[1] no-undo.
define shared variable dom-single       like mfc_logical no-undo.
define shared variable cust             like ih_cust.
define shared variable cust1            like ih_cust.
define shared variable bill             like ih_bill.
define shared variable bill1            like ih_bill.
define shared variable ship             like so_ship.
define shared variable ship1            like so_ship.
define shared variable site             like so_site.
define shared variable site1            like so_site.
define shared variable conso            like mfc_logical.
define shared variable nbr              like so_nbr.
define shared variable nbr1             like so_nbr.
define shared variable inv_only         as logical.
define shared variable print_lotserials as logical.
define shared variable msg              like msg_desc.
define shared variable inv_date         like so_inv_date.
define shared variable company          as character format "x(38)" extent 6.
define shared variable shipdate         like so_ship_date.
define shared variable shipdate1        like shipdate.
define shared variable addr             as character format "x(38)" extent 6.
define shared variable print_options    as logical.
define shared variable lang             like so_lang.
define shared variable lang1            like lang.
define shared variable ldnbr            like lgd_nbr.
define shared variable ldnbr1           like lgd_nbr.
define shared variable ldshipfrom       like lgd_shipfrom.
define shared variable ldshipfrom1      like lgd_shipfrom.
define shared variable call-detail      like mfc_logical.
define shared variable incinv           like mfc_logical.
define shared variable incmemo          like mfc_logical.
define shared variable order_nbrs       as character extent 30.
define shared variable order_nbr_list   as character no-undo.
define shared variable prt_cor          like mfc_logical.
define shared variable undo_all         like mfc_logical no-undo.
define shared variable update_post      like mfc_logical.
define shared variable inccor           like mfc_logical.
define shared variable eff_date         like ar_effdate.

/* Shared variables for print settings */
{us/so/soprsets.i}

define variable ent_ord_bill       like so_bill no-undo.
define variable ent_ord_ship       like so_ship no-undo.
define variable ent_ord_nbr        like so_nbr no-undo.
define variable ent_ord_line       like sod_line no-undo.
define variable ent_ord_line_part  like sod_part no-undo.
define variable ent_ord_line_uom   like sod_um no-undo.
define variable so-trl1-cd         like so_trl1_cd no-undo.
define variable so-trl2-cd         like so_trl2_cd no-undo.
define variable so-trl3-cd         like so_trl3_cd no-undo.
define variable isConsolDom        as logical no-undo.
define variable pass-con           as integer no-undo.

define variable termsdesc          as character format "x(40)" label "Description" no-undo.
define variable prepaid-lbl        as character format "x(12)" no-undo.
define variable po-lbl             as character format "x(8)"  no-undo.
define variable po-lbl2            as character format "x(16)" no-undo.
define variable lot-lbl            as character format "x(43)" no-undo.
define variable cspart-lbl         as character format "x(15)" no-undo.
define variable resale             like cm_resale format "x(20)".
define variable trl_length         as integer initial 11 no-undo.
define variable hdr_po             as character format "x(38)".
define variable sales_entity       like si_entity.
define variable col-80             like mfc_logical initial true no-undo.
define variable xab                as character format "x(70)" .
define variable env_check          as logical initial true no-undo.
define variable line_env_check     as logical initial true no-undo.
define variable foundone           as logical   no-undo.
define variable cErrorArgs         as character no-undo.

define workfile shipper    field shipper_sonbr    like sod_nbr.

define buffer bsod_det     for sod_det.
define buffer bsoddet      for sod_det.

{us/px/pxmaint.i}

{us/so/sodiscwk.i &new="new"} /* Shared workfile for summary discounts */

define variable l_inv_conso   like mfc_logical initial no no-undo.
define variable l_orig_invnbr like so_inv_nbr  initial "" no-undo.
define variable r-result      as integer    no-undo.
define variable l_gst_id      like cm_gst_id              no-undo.

define buffer soddet2      for sod_det.
define buffer abs_mst1     for abs_mstr.
define buffer somstr       for so_mstr.
define buffer somstr2      for so_mstr.
define buffer bsomstr      for so_mstr.
define buffer bsomstr1     for so_mstr.
define buffer bsomstr2     for so_mstr.

define new shared frame sotot.

{us/so/soivtot1.i "NEW"}  /* Define variables for invoice totals. */

define variable hdr_call            as character format "x(21)" no-undo.
define variable call-lbl            as character format "x(16)" no-undo.
define variable prepaid_fmt         as character no-undo.
define variable prepaid_old         as character no-undo.
define variable h_format as handle no-undo.
define variable oldcurr             like so_curr no-undo.
define variable tot_prepaid_amt     like so_prepaid.
define variable hdl_sum_disc_lbl    as handle.
define variable tax-tran-type       as character no-undo.
define variable l_consolidate       as logical initial no no-undo.
define variable l_msg_text          as character no-undo.
define variable l_ctrj              as integer no-undo.
define variable l_ctrk              as integer no-undo.
define variable l_so_nbr            like so_nbr no-undo.
define variable l_so_nbr2           like so_nbr no-undo.
define variable l_nbr               like tx2d_nbr no-undo.
define variable tot_prepaid_nett    like so_prepaid
                                    label "Total Prepaid" no-undo.
define variable tot_ptax_amt        like so_prepaid no-undo
                                    label "Prepaid Tax".
define variable amt_due_af_prep     like so_prepaid
                                    label "Amount Due" no-undo.
define variable l_last_shipdt       like so_ship_date  no-undo.
define variable l_orig_taxdt        like so_tax_date   no-undo.
define variable add-trl-length      as integer no-undo.
define variable price_fmt           as character no-undo.
define variable vlResult            like mfc_logical no-undo.
define variable vcCreditCardMsg     as character format "x(80)" extent 3 no-undo.
define variable tot_cont_charge     as decimal no-undo.
define variable tot_line_charge     as decimal no-undo.
define variable c-cont              as character format "x(35)" no-undo.
define variable exch_rate           like so_ex_rate no-undo.
define variable exch_rate2          like so_ex_rate2 no-undo.
define variable l_tot_amt           as decimal no-undo.
define variable l_tax_total_message as character extent 2 format "x(13)" no-undo.
define variable l_basetaxtot        like glt_amt.
define variable hInvoiceTotal       as handle no-undo.
define variable blockedEntities     as character no-undo initial "".
define variable lEntityOk           as logical no-undo.
define variable l_consign_progs     as character no-undo.
define variable l_isBrazilSSM       as logical no-undo.

/* TEMP-TABLE TO STORE CONSOLIDATED SO NUMBERS */
define temp-table t_cons_so
field t_cons_sonbr like so_nbr.

/* QAD Financials Data Objects Definitions */
define variable hQADFinancialsLib as   handle      no-undo.
define variable EntitySecurity    as EntitySecurityCheck no-undo.

l_consign_progs = "socnaimt.p,socnuac.p,socnuac3.p,socnuac5.p,socnuac7.p" +
                  ",socnundo.p".

run mfairunh.p
      (input 'mfinvtot.p',
       input '?',
       output hInvoiceTotal) no-error.

for first txc_ctrl where txc_domain = global_domain
no-lock: end.

{us/so/soeuinv.i}

assign
   l_tax_total_message[1] = getTermLabel("TOTAL_TAX",9)
                          + " "
                          + getTermLabel("IN",2)
   l_tax_total_message[2] = getTermLabel("TOTAL_TAX",9).

{us/xf/xftxtots.i} /*grc338*/

c-cont = CAPS(dynamic-function('getTermLabelFillCentered' in h-label,
              input "CONTINUED",
              input 35,
              input '*')).

{us/gp/gprunpdf.i "txincopl" "p"}

/* FORMS NEEDED FOR SOIVTRL2.P */
define new shared frame d.
form  /* NOT USED DURING INVOICE PRINT */
   so_cr_init     colon 15
   so_to_inv      colon 48
   so_cr_card     colon 15
   so_print_so    colon 48
   so_stat        colon 15
   so_print_pl    colon 48
   so_rev         colon 15
   so_prepaid     colon 48
   so_fob         colon 15
with frame d side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

form
   tot_prepaid_amt      colon 60
   tot_ptax_amt         colon 60
   tot_prepaid_nett     colon 60
   skip(1)
   amt_due_af_prep      colon 60
with frame prepd width 80 side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame prepd:handle).

form header
   fill("-",77)   format "x(77)" skip
   space(31)
   c-cont
   skip(8)
with frame continue page-bottom width 80.

form
   so_nbr        colon 15
   so_ship_date  colon 55
   so_ord_date   colon 15
   hdr_po        to 78    no-label
   so_slspsn[1]  colon 15 label "Salesperson(s)"
   so_slspsn[2]           no-label
   so_ship       colon 55
   so_slspsn[3]  at 17    no-label
   so_slspsn[4]           no-label
   so_shipvia    colon 55
   so_cr_terms   colon 15
   so_bol        colon 55
   termsdesc     at    17 no-label
   so_fob        colon 55
   resale        colon 15
   hdr_call      to 64 no-label
   so_rmks       colon 15
with frame phead2 side-labels width 90.

/* SET EXTERNAL LABELS */
setFrameLabels(frame phead2:handle).

/*grc338
form
   l_gst_id colon 15 label "Tax ID"
with frame phead3 side-labels width 90 no-box.

/* SET EXTERNAL LABELS */
setFrameLabels(frame phead3:handle).
*/

{us/et/etvar.i}
{us/et/etrpvar.i &new="new"}

/*grc338 {us/et/etsotrla.i "NEW"} */
{us/xf/xfsotrla.i "NEW"} /*grc338*/
{us/so/so10a01.i}

{us/fs/fsconst.i}     /* FIELD SERVICE CONSTANTS */

empty temp-table t_absr_det no-error.

assign
   l_nontaxable_lbl = getTermLabelRtColon("NON-TAXABLE", 12)
   l_taxable_lbl    = getTermLabelRtColon("TAXABLE", 12).

form
   vcCreditCardMsg[1] skip
   vcCreditCardMsg[2] skip
   vcCreditCardMsg[3]
with frame soccmsg no-labels width 132.

/* **NOTE: The customer has promised to pay using a credit card */
{us/bbi/pxmsg.i &MSGNUM=3867 &ERRORLEVEL=1 &MSGBUFFER=vcCreditCardMsg[1]}
/* The card used at order time will be processed for payment */
{us/bbi/pxmsg.i &MSGNUM=3868 &ERRORLEVEL=1 &MSGBUFFER=vcCreditCardMsg[2]}
/* Customer is responsible for payment if credit card is denied */
{us/bbi/pxmsg.i &MSGNUM=3869 &ERRORLEVEL=1 &MSGBUFFER=vcCreditCardMsg[3]}

hdl_sum_disc_lbl = prnt_sum_disc_amt:handle in frame disc_sum_print.

/* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
/*grc338 comment begin
assign
   nontax_old      = nontaxable_amt:format
   taxable_old     = taxable_amt:format
   line_tot_old    = line_total:format
   disc_old        = disc_amt:format
   trl_amt_old     = so_trl1_amt:format
   tax_amt_old     = tax_amt:format
   ord_amt_old     = ord_amt:format
   prepaid_old     = so_prepaid:format
   container_old   = container_charge_total:format
   line_charge_old = line_charge_total:format.
grc338 comment end*/

find first sac_ctrl where sac_domain = global_domain no-lock no-error.
find first rmc_ctrl where rmc_domain = global_domain no-lock no-error.
find first svc_ctrl where svc_domain = global_domain no-lock no-error.
find first shc_ctrl where shc_domain = global_domain no-lock no-error.
find first soc_ctrl
   where soc_domain = global_domain
no-lock no-error.

/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtecdf.i &var="shared"}
{us/gp/gpvtepdf.i &var=" "}

assign
   maint = no
   pages = 0
   old_sod_nbr = ?.

{us/bbi/gprun.i ""gpctryfmt.p"" "persistent set h_format"}

if msg <> "" then trl_length = trl_length + 1.

if dom-single = yes
then do:
   conso = yes.
   /* TELL DOM THE ORDER NUMBERS THAT ARE PROCESSED HERE */
   {us/bbi/gprun.i ""sodomso.p"" }
end.
empty temp-table tt_so_inv.
/* The check on rcauis01 will prevent execution when coming from      */
/* rcauis.p as well as the two EDI inbound gateways that also call it */
if (execname <> "rcsois.p"   and
    execname <> "xfrcsois.p"   and /*grc338*/
    execname <> "whrfshtr.p" and
    index(program-name(4),'rcauis01') = 0 and
    execname <> "rcunis.p" and
    lookup(execname,l_consign_progs) = 0)
    and dom-single = no
then do:
   for each so_mstr
      where so_domain = global_domain
       and  (so_nbr >= nbr and so_nbr <= nbr1)
       and  (so_to_inv = yes)
       and  (so_ship_date >= shipdate and so_ship_date <= shipdate1)
       and  (so_cust >= cust and so_cust <= cust1)
       and  (so_bill >= bill and so_bill <= bill1)
       and  (so_ship >= ship and so_ship <= ship1)
       and  (so_site >= site and so_site <= site1)
       and  (so_lang >= lang and so_lang <= lang1)
       and  (so_slspsn[1] >= sls-psn and so_slspsn[1] <= sls-psn1)
       and  (so_daybookset >= daybookset and so_daybookset <= daybookset1)
       and so_compl_stat = ""
   no-lock
   by so_nbr:
      
      {us/gp/gprunp.i "soldxr" "p" "isBrazilSSMwLD" "(output l_isBrazilSSM)"}

      if l_isBrazilSSM and
         (so_mstr.so_fsm_type = fsmro_c or so_mstr.so_fsm_type = scontract_c)
      then do:
         if lookup(execname, "fsshcnmt.p,fsshucmt.p,fssacnmt.p,fssaucmt.p") > 0 
         then do:
            so_recno = recid(so_mstr).
            run p_check_locked(input so_recno).
            leave.              
         end.
         else next. /* SKIP SSM CALLS AND CONTRACTS IN INVOICE POST */           
      end.
         
      /* Consider legal doc number when 'Separate Invoices for Each Shipment' */
      if available shc_ctrl and shc_check_ship_pending then do:

         if can-find(first lgdd_det where lgdd_domain = global_domain
                       and lgdd_order = so_nbr
                       and can-find(first lgd_mstr where lgd_domain = global_domain
                                    and lgd_type = yes
                                    and ((lgd_posted = no and lgd_status = {&LD_CONFIRMED})
                                    or  (lgd_posted = yes and lgd_status ={&LD_CANCELLED} and lgd_cancel_inv = ""))
                                    and lgd_mstr.oid_lgd_mstr = lgdd_det.oid_lgd_mstr
                                    and lgd_nbr >= ldnbr and lgd_nbr <= ldnbr1
                                    and lgd_shipfrom >= ldshipfrom and lgd_shipfrom <= ldshipfrom1))
            or
            not can-find(first lgdd_det where lgdd_domain = global_domain and lgdd_order = so_nbr)
         then do:
            so_recno = recid(so_mstr).
            run p_check_locked(input so_recno).
            leave.
         end.
      end.
      else do:
         so_recno = recid(so_mstr).
         run p_check_locked(input so_recno).
         leave.
      end.
   end.
end. /* IF EXECNAME <>"RCSOIS.P" AND EXECNAME <> "RCUNIS.P"  */

else do:
   l_ctrj = 1.
   /* OBTAINING FIRST SALES ORDER  FROM ORDER_NBR ARRAY IF         */
   /* INVOICE PRINT IS BEING RUN FROM PRE-SHIPPER/SHIPPER CONFIRM  */
   /* OR SHIPPER UNCONFIRM                                         */
   l_so_nbr = order_nbrs[l_ctrj].
   for first so_mstr where so_domain = global_domain
       and so_nbr = l_so_nbr
       and so_compl_stat = ""
   no-lock: end.
end.

assign lcovatreglbl = covatreglbl
       lcovatreg    = covatreg.

repeat while available so_mstr:
   empty temp-table t_cons_so.
   foundone = true.
   l_last_shipdt = ?.

   /* CALL PROCEDURE p_consolidate TO FIND IF THERE EXIST PENDING */
   /* INVOICES REFERENCING SAME MANUALLY ENTERED INVOICE NUMBER   */
   /* NOTE: FOR QADFinancials, Manually entered invoice numbers   */
   /* are no longer supported.  Need to determine if the internal */
   /* procedure, p_consolidate, and the flag l_inv_conso should be deleted. */
   /* EMPTY THE TEMP-TABLES FOR CONSOLIDATION OF INVOICE          */
   {us/gp/gprunp.i "txincopl" "p" "empty-table"}

   assign
      l_inv_conso   = no
      l_orig_invnbr = ""
      l_gst_id      = "".

   /* THE BLOCKA HAS BEEN INTRODUCED AND THE NEXT STATEMENTS IN THE   */
   /* PROGRAM WHICH REFER TO THE OUTER REPEAT WHILE AVAILABLE so_mstr*/
   /* HAVE BEEN REPLACED BY THE STATEMENT LEAVE BLOCKA. THIS IS       */
   /* NECCESSARY, SINCE THE FIND NEXT so_mstr IS BEING DONE AT THE   */
   /* END OF THE REPEAT LOOP AS A RESULT OF WHICH, THE INVOICE PRINT */
   /* WENT INTO AN INFINITE LOOP FOR ALL CONDITIONS WHERE THE NEXT   */
   /* STATEMENT IS BEING USED                                        */
   blocka:
   do:

      daybookDate = today.

      if eff_date <> ? then
         daybookDate = eff_date.
      else if so_inv_date <> ? then
         daybookDate = so_inv_date.

      run validateDaybookSet in hDaybookSetValidation
         ( input  so_mstr.so_daybookset,
           input  so_mstr.so_site,
           input  daybookDate,
           output iErrorNumber,
           output cErrorArgs).

      if iErrorNumber > 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=iErrorNumber &ERRORLEVEL=3 &MSGARG1=cErrorArgs}
         leave blocka.
      end.

      /* Find the entity for the current header site*/
      for first si_mstr no-lock
         where si_mstr.si_domain = so_domain
           and si_mstr.si_site = so_site:

         /* If this entity is already in our blocked list then skip this so*/
         if lookup(si_mstr.si_entity,blockedEntities,chr(2)) <> 0
         then leave blocka.

         {us/gl/glenchk.i
            &entity=si_mstr.si_entity
            &entity1=si_mstr.si_entity
            &entity_ok=lEntityOk}

         /* Error handling */
         if not lEntityOk
         then do:
            /* Store a list of blocked entities so we only get one error message */
            if blockedEntities = ""
            then
               assign blockedEntities = si_mstr.si_entity.
            else
               assign blockedEntities = blockedEntities + chr(2)
                                       + si_mstr.si_entity.
            leave blocka.
         end.
      end.

      /* THIS TEST IS INCLUDED TO PREVENT THE PROGRAM FROM RE-INVOICING */
      /* SALES ORDERS INCLUDED IN PREVIOUS CONSOLIDATIONS (EARLIER IN   */
      /* THIS LOOP).  IT SEEMS NECESSARY BECAUSE PROGRESS DOES NOT      */
      /* NECESSARILY UPDATE ALL INDEXES AT THE SAME TIME IT UPDATES     */
      /* DATA IN THE DATABASE.                                          */
      for each shipper exclusive-lock:
         delete shipper.
      end.
      create shipper.
      assign shipper.shipper_sonbr = so_mstr.so_nbr.
      if recid(shipper) = -1 then .

      if not so_to_inv then leave blocka.
      find first cil_mstr  where
         cil_mstr.cil_domain = global_domain and
         cil_cor_so_nbr = so_mstr.so_nbr
      no-lock no-error.
      if available cil_mstr and not inccor then leave blocka.

      if (oldcurr <> so_curr) or (oldcurr = "") then do:

         {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
            "(input so_curr,
              output rndmthd,
              output mc-error-number)"}
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=4}
            leave blocka.
         end.

         /* DETERMINE CURRENCY DISPLAY AMERICAN OR EUROPEAN   */
         find rnd_mstr where rnd_rnd_mthd = rndmthd no-lock no-error.
         if not available rnd_mstr then do:
            /* ROUND METHOD RECORD NOT FOUND */
            {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=4}
            leave blocka.
         end.

         /*grc338 comment begin
         {us/so/socurfmt.i}
         prepaid_fmt = prepaid_old.
         {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output prepaid_fmt,
                                   input rndmthd)"}
         grc338 comment end*/

         oldcurr = so_curr.
      end. /* IF (OLDCURR <> SO_CURR) */

      if can-find(qad_wkfl where qad_domain = global_domain
                             and qad_key1 = "sosois.p" + so_nbr
                             and qad_key2 = "BATCH" )
      then
         leave blocka.

      /* FOR CALL INVOICES, USE TRANSACTION TYPE 38 INSTEAD OF 13 */
      if so_fsm_type = "FSM-RO"
      then
         tax-tran-type = "38".
      else
         tax-tran-type = "13".

      {us/so/soivtot2.i}  /* Initialize variables for invoice totals. */

      assign
         comb_inv_nbr   = ""
         taxable_amt    = 0
         nontaxable_amt = 0 .

      /* PRINT INVOICES, CREDITS, OR BOTH */
      /* THIS ENHANCEMENT REQUIRES AN IMMEDIATE CALL TO SOIVTRL TO GET */
      /* THE INVOICE TOTAL TO DETERMINE IF IT SHOULD BE PRINTED.       */
      if not incinv or not incmemo then do:

         so_recno = recid(so_mstr).
         /* TOTAL INVOICE */
         undo_trl2 = true.

     /*grc338    {us/bbi/gprun.i ""soivtrl2.p"" */
         /*grc338*/ {us/bbi/gprun.i ""xfivtrl2.p""
            "(input so_nbr,
              input '',
              input col-80 /* REPORT WIDTH */,
              input '13',
              input tot_cont_charge,
              input tot_line_charge,
              input l_consolidate)"}
              
         if undo_trl2 then leave blocka.
         
         if not incinv and ord_amt >= 0 then leave blocka.

         /* CREDIT PRINT TEST */
         if not incmemo and ord_amt < 0 then leave blocka.
         /*grc338 add begin*/
         assign
            invcrdt = if ord_amt < 0 then "ADJUSTMENT NOTE"
                      else "TAX INVOICE".
         /*grc338 add end*/

         {us/so/soivtot2.i}  /* Initialize variables for invoice totals. */

      end.

      assign
         rmaso         = no
         print_invoice = yes
         sacontract    = no.

      /* RMASO INDICATES AN RMA INVOICE */
      if so_fsm_type = rma_c then
         rmaso       = yes.

      /* IF "PRINT NO CHARGE RECEIPTS" (rmc_prt_rtn) IS NO, */
      /* AND THE RMA INVOICE HAS ONLY ZERO PRICED RECEIPT   */
      /* LINES, THEN WE DON'T PRINT THE INVOICE.            */
      if available rmc_ctrl  and
         not rmc_prt_rtn     and
         so_fsm_type = rma_c
      then do:

         print_invoice = no.

         for each sod_det where sod_domain = global_domain
            and sod_nbr = so_nbr
            and sod_qty_inv  <> 0
            and sod_compl_stat = ""
         no-lock:
            if sod_price     <>  0    or
               sod_rma_type  <> "I"
            then
               print_invoice =  yes.
         end.

         if  print_invoice = no then do:
            so_recno = recid(so_mstr).
            {us/bbi/gprun.i ""sosoina.p""}
            leave blocka.
         end.

      end.    /* if available rmc_ctrl */

      /* Identify if it's a service contract billing. */
      /* SACONTRACT INDICATES A SERVICE CONTRACT INVOICE */
      if so_fsm_type = "SC" then sacontract = yes.

      termsdesc = "".
      {us/px/pxrun.i &PROC='getTermsDescription' &PROGRAM='adcrxr.p'
         &HANDLE=ph_adcrxr
         &PARAM="(input so_cr_terms,
                  output termsdesc)"}

      /* ASSIGN COMPANY VAT REG */
      assign covatreglbl = lcovatreglbl
             covatreg    = lcovatreg.

      /*CHECK IF SITE COMPANY ADDRESS HAS A STATE TAX ID */
      for first ad_mstr 
         where ad_domain = global_domain 
           and ad_addr   = so_site 
      no-lock:
         if     ad_pst_id <> "":U 
            and ad_pst_id <> ? 
            and can-find (first ls_mstr 
                             where ls_domain = global_domain
                               and ls_addr = ad_addr
                               and ls_type = "company")
         then do:
            /* FIND VAT REG. NO & COUNTRY CODE */
            {us/gp/gpvtecrg.i}
         end.   /* IF     ad_pst_id */
      end.   /* FOR FIRST ad_mstr  */


      find ad_mstr where ad_domain = global_domain
          and  ad_addr = so_bill
      no-lock no-wait no-error.

      update billto = "".

      /*grc338 add begin*/
      assign
         billto_city  = ""
         billto_state = ""
         billto_zip   = ""
         billto_attn  = ""
         billto_fax   = ""
         billto_phn   = "".
      /*grc338 add end*/
      if available ad_mstr then do:

         /*grc338 add begin*/
         assign
            billto_city  = ad_city
            billto_state = ad_state
            billto_zip   = ad_zip
            billto_attn  = ad_attn
            billto_fax   = ad_fax
            billto_phn   = ad_phone.
         /*grc338 add end*/
         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
         assign addr[5] = "". /*grc338*/
         {us/xf/xfaddr.i "billto"} /*grc338*/

         assign
            billto[1] = addr[1]
            billto[2] = addr[2]
            billto[3] = addr[3]
            billto[4] = addr[4]
            billto[5] = addr[5]
            billto[6] = addr[6].

         for first cm_mstr where cm_domain = global_domain
            and cm_addr   = so_bill
         no-lock: end.

         /* Format based on sold-to country */
         run setFormatForCountryCode in h_format
            (input cm_lang, input ad_mstr.ad_ctry).

         /* Move the PO number up into the address window */
         /* (if it fits)                                  */
         /*grc338 comment begin
         hdr_po    = po-lbl2 + so_po.

         if addr[6]  <> ""
            and so_po = ""
         then
            billto[6] = addr[6].
         grc338 comment end*/
      end.    /* if available ad_mstr */
      else do:
         for first usr_mstr
            where usr_userid = global_userid
         no-lock:
         end.
         /* Default to user's format if country not available */
         run setFormatForCountryCode in h_format
            (input global_user_lang, input usr_ctry_code).
      end.

      for first cm_mstr 
         where cm_domain = global_domain
         and   cm_addr   = so_cust
      no-lock:
      end. /* FOR FIRST cm_mstr */
      if available cm_mstr 
      then
         l_gst_id  = cm_gst_id.
      else do:
         for first ad_mstr 
            where ad_domain = global_domain
            and   ad_addr   = so_cust
         no-lock:
            l_gst_id  = ad_gst_id.
         end. /* FOR FIRST ad_mstr */
      end. /* IF NOT AVAILABLE cm_mstr */

      find ad_mstr where ad_domain = global_domain
          and  ad_addr = so_cust
      no-lock no-wait no-error.

      update soldto = "".
      /*grc338 add begin*/
      assign
         soldto_city  = ""
         soldto_state = ""
         soldto_zip   = "" .
      /*grc338 add end*/

      if available ad_mstr then do:

         /*grc338 add begin*/
         assign
            soldto_city  = ad_city
            soldto_state = ad_state
            soldto_zip   = ad_zip .
         /*grc338 add end*/

         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
         assign addr[5] = "". /*grc338*/
         {us/xf/xfaddr.i "soldto"} /*grc338*/

         assign
            soldto[1] = addr[1]
            soldto[2] = addr[2]
            soldto[3] = addr[3]
            soldto[4] = addr[4]
            soldto[5] = addr[5]
            soldto[6] = addr[6].
      end.    /* if available ad_mstr */

      if so_app_owner = 'DOM' then do:
         {us/bbi/gprun.i ""sodomxr.p""
            "(input so_nbr,
              input 0,
              input 'SO',
              output ent_ord_nbr,
              output ent_ord_line,
              output ent_ord_bill,
              output ent_ord_ship,
              output ent_ord_line_part,
              output ent_ord_line_uom)" }
      end. /* if so_app_owner = 'DOM' */

      /* FIND VAT NO FOR SHIP TO OR BILL TO IF SHIP TO VAT=" " */
      find ad_mstr where ad_domain = global_domain
         and ad_addr = so_ship
      no-lock no-wait no-error.

      /*grc338 add begin*/
      update shipto = "".
      assign
         shipto_city  = ""
         shipto_state = ""
         shipto_zip   = ""
         shipto_attn  = ""
         shipto_phn   = "".
      /*grc338 add end*/

      if available ad_mstr
      then do:
         /*grc338 add begin*/
         assign
            shipto_city  = ad_city
            shipto_state = ad_state
            shipto_zip   = ad_zip
            shipto_attn  = ad_attn
            shipto_phn   = ad_phone
            shipto[1]    = ad_name
            shipto[2]    = ad_line1
            shipto[3]    = ad_line2
            shipto[4]    = ad_line3
            shipto[5]    = ""
            shipto[6]    = ad_country.
         /*grc338 add end*/
         vatreg1 = "".
         for first cm_mstr where cm_domain = global_domain
            and cm_addr = so_cust
         no-lock: end.
         if available cm_mstr then
           vatreg1 = if  so_cust <> so_ship
                     then substring(ad_pst_id,1,15)
                     else substring(cm_pst_id,1,15).

         if ad_pst_id = " " then do:
            find ad_mstr where ad_domain = global_domain
               and ad_addr = so_bill
            no-lock no-wait no-error.
            if available ad_mstr then do:
               {us/gp/gpvteprg.i}
            end.
         end.
         else do:
            {us/gp/gpvteprg.i}
         end.
      end.    /* if available ad_mstr */

      find cm_mstr where cm_domain = global_domain
         and cm_addr = so_cust
      no-lock no-error.
      if available cm_mstr then
         resale = cm_resale.
      else
         resale = "".

      hdr_call = "".
      if rmaso then do.
         find first rma_mstr where rma_domain = global_domain
            and rma_nbr = so_nbr
            and rma_prefix = "C"
         no-lock no-error.
         if available rma_mstr then
            hdr_call = call-lbl + rma_ca_nbr.
      end.

      assign
         addtax   = yes
         so_recno = recid(so_mstr).

      /* DAYBOOK SET INVOICE NUMBER GENERATION */
      if execname <> "sosorp20.p" then
      do for bsomstr:
         for first bsomstr where recid(bsomstr) = so_recno
         exclusive-lock: end.
         if available(bsomstr)
         then do:
            if so_inv_nbr = ""
            then do:
               if comb_inv_nbr <> ""
               then
                  bsomstr.so_inv_nbr = comb_inv_nbr.
               else
                  bsomstr.so_inv_nbr = bsomstr.so_nbr.
            end. /* IF so_inv_nbr = "" */
            bsomstr.so_inv_date = inv_date.
         end. /* IF AVAILABLE(bsomstr) */
      end. /* DO FOR BSOMSTR */
      else do:
         {us/bbi/gprun.i ""sosoina.p""}
      end.

      {us/bbi/gprun.i ""txdelete.p""
         "(input '16',
           input so_inv_nbr,
           input (if conso
                  or (not conso and l_inv_conso)
                  then
                     '*'
                  else
                     so_nbr))" }

      if tax-tran-type = "38" then
         l_nbr = so_quote.
      else
         l_nbr = "".

      if l_inv_conso then
         run p_consotot
            (input nbr,
             input nbr1,
             input so_mstr.so_nbr,
             input so_mstr.so_inv_nbr).

      so_recno = recid(so_mstr).

      if not conso
      and not l_inv_conso
      then do:
         /* COPY tx2d_dets FROM SALES ORDER OR CALL INVOICE TO INVOICE */
         {us/bbi/gprun.i ""txdetcpy.p""
            "(input so_nbr,
              input l_nbr,
              input tax-tran-type,
              input so_inv_nbr,
              input so_nbr,
              input '16')"}
      end. /* IF NOT conso */

      if execname = "sosorp20.p" then do:  /*grc338 DRAFT Invoice - ignore*/
         l_last_shipdt = so_mstr.so_ship_date.
         if conso
         then do:
            for each somstr
               where somstr.so_domain    = global_domain
               and  (somstr.so_nbr      >= nbr
               and   somstr.so_nbr      <= nbr1)
               and  somstr.so_to_inv     = yes
               and  somstr.so_compl_stat = ""
            no-lock:

               /* PROCEDURE FOR CONSOLIDATION RULES */
               pass-con = 1.
               if dom-single = yes
               then 
                  pass-con = 3.
               else 
                  if available shc_ctrl 
                     and shc_ctrl.shc_check_ship_pending
                  then 
                     pass-con = 4.
               {us/bbi/gprun.i ""soconsod.p"" 
                  "(input pass-con,
                    input so_mstr.so_nbr,
                    input somstr.so_nbr,
                    output l_consolidate,
                    output l_msg_text)"}

               if l_consolidate
                  and l_last_shipdt < somstr.so_ship_date
               then
                  l_last_shipdt = somstr.so_ship_date.
            end. /* FOR EACH somstr */
         end. /* IF conso */
         {us/so/sorphfrm.i} /* Form definitions for phead1 */

         run GetHeading.
         view frame phead1.

         if old_sod_nbr <> ? then page.
         pages = page-number - 1.

         display
            so_nbr
            l_last_shipdt @ so_ship_date
            so_ord_date
            hdr_po
            so_slspsn[1]
            so_slspsn[2]
            so_ship
            so_slspsn[3]
            so_slspsn[4]
            so_shipvia
            so_cr_terms
            so_bol termsdesc
            so_fob
            hdr_call
            resale
            so_rmks
         with frame phead2.

         hide frame phead2.

         /*grc338
         if available soc_ctrl
            and soc_gst_pst
         then do:
            display
               l_gst_id
            with frame phead3.
            hide frame phead3.
         end. /* IF AVAILABLE soc_ctrl ... */
         */

         if sacontract then do:

            /* FOR SERVICE CONTRACT INVOICES, PRINT THE PERIOD  */
            /* OF COVERAGE BEING BILLED FOR, AND THE CONTRACT # */
            fsremarks = getTermLabel("FOR_PERIOD",25) + ": " +
                        string(so_req_date,"99/99/99")       +
                        " " + getTermLabel("TO",10) + ": "   +
                        string(so_due_date,"99/99/99").
            /* put fsremarks  at 15. */ /*grc338*/

            fsremarks = getTermLabel("SERVICE_CONTRACT",35) + ": " + so_sa_nbr.
            put fsremarks at 15.

         end.    /* if sacontract */

         run PrintHeaderComment(input so_cmtindx,
                                input vcPriHeadComment).
         put skip(1).

         /* IF THIS INVOICE IS FOR AN RMA WHICH REFERENCES */
         /* A CALL, PRINT HEADER COMMENTS FROM THAT CALL   */
         if rmaso then do:
            if available rma_mstr then do:
               /* NOTE: CA_CATEGORY = "0" FOR CALLS, AND  */
               /*       "QUOTE" FOR CALL QUOTES.          */
               find first ca_mstr where ca_domain = global_domain
                  and ca_nbr = rma_ca_nbr
                  and ca_category = "0"
               no-lock no-error.
               if available ca_mstr then do:
                  put skip(1).
                  run PrintHeaderComment(input ca_cmtindx,
                                         input vcPriHeadComment).
               end.  /* if available ca_mstr */
            end.  /* if available rma_mstr */
         end.  /* if rmaso */
      end. /* if execname = "sosorp20.p" */

      old_sod_nbr = so_nbr.

      /*Establish the label for the display of discounts*/
      if disc_det_key <> "1" then do:
         find first lngd_det
            where lngd_dataset begins "soprint"
            and   lngd_field   = "det_disc_prnt"
            and   lngd_lang    = global_user_lang
            and   lngd_key1    = disc_det_key
         no-lock no-error.
         if available lngd_det then
            disc_prnt_label = lngd_translation.
      end.

      if execname = "sosorp20.p" then do:  /*grc338 ignore*/
         {us/bbi/gprun.i ""sorp1a01.p"" "(output tot_cont_charge,
                                   output tot_line_charge)"}
      end.

      find si_mstr where si_domain = global_domain
         and si_site = so_site
      no-lock no-error.

      assign
         sales_entity = if available si_mstr then si_entity
                        else glentity
         tot_prepaid_amt = 0
         tot_ptax_amt    = 0
         l_consolidate   = no.

      /*Check if this is a credit card order*/
      {us/gp/gprunp.i "gpccpl" "p" "isCCOrder"
         "(input so_nbr, output vlResult)"}
      /*If it is then view credit card message frame*/
      if vlResult then
         display vcCreditCardMsg with frame soccmsg.

      /* MOVED THE CODE FROM BELOW SO THAT THE TOTALS OF THE  */
      /* FIRST SALES ORDER ARE ACCUMULATED BEFORE CHECKING    */
      /* FOR ITS POSSIBLE CONSOLIDATIONS WITH THE REMAINING   */
      /* SALES ORDERS                                         */
      /* TOTAL ORDER, BUT DON'T PRINT THE DETAIL REPORT YET*/
      if not conso
      and not l_inv_conso
      then do:
         undo_trl2 = true.
        /*grc338  {us/bbi/gprun.i ""soivtrl2.p"" "(input so_inv_nbr,  */
         /*grc338*/ {us/bbi/gprun.i ""xfivtrl2.p"" "(input so_inv_nbr,
                                   input so_nbr,
                                   input col-80 /* REPORT WIDTH */,
                                   input '16',
                                   input tot_cont_charge,
                                   input tot_line_charge,
                                   input l_consolidate)"}

         if undo_trl2 then return.
         {us/so/soivtod7.i}  /* ACCUMULATE INVOICE TOTALS */

         /* STORE THIS VALUE, WHICH CAN BE USED BY POST SUBROUTINE */
         if execname <> "sosorp20.p" then
            run addOrderTotal in hInvoiceTotal
               (input so_nbr,
                input invtot_ord_amt).
      end. /* IF NOT conso */

      /* Check for consolable invoices */
      /* ADDED CONDITION TO ENTER LOOP IF CONSOLIDATE INVOICES IS NO */
      /* BUT MULTIPLE PENDING INVOICES REFERENCE SAME INVOICE NUMBER */
      if conso
         or (not conso and l_inv_conso)
      then do:
         if not can-find( first tt_so_inv
                             where tt_so_inv_nbr = so_mstr.so_inv_nbr)
         then do:
            create tt_so_inv.
            assign
               tt_so_inv_nbr     = so_mstr.so_inv_nbr
               tt_invtot_ord_amt = 0.
         end.  /*  IF NOT CAN-FIND (FIRST tt_so_inv ..) */ 
         {us/gp/gprunp.i "txincopl" "p" "create-record"
                   "(input recid(so_mstr),
                     input tax-tran-type)" }

         if (execname <> "rcsois.p"   and
            execname <> "xfrcsois.p"   and /*grc338*/
             execname <> "whrfshtr.p" and
             index(program-name(4),'rcauis01') = 0 and
             execname <> "rcunis.p"   and
             lookup(execname,l_consign_progs) = 0)
         then do:
            for each somstr2
                where somstr2.so_domain = global_domain
                 and (so_nbr > so_mstr.so_nbr and so_nbr <= nbr1)
                 and (so_to_inv = yes)
                 and (so_ship_date >= shipdate and so_ship_date <= shipdate1)
                 and (so_lang >= lang and so_lang <= lang1)
                 and (so_daybookset >= daybookset and so_daybookset <= daybookset1)
                 and (so_site >= site and so_site <= site1)
                 and so_compl_stat = ""
            no-lock by so_to_inv by so_nbr:

               /* ASSIGN TRANSACTION TYPE AS 38 FOR CALL INVOICES */
               if somstr2.so_fsm_type = "FSM-RO"
               then
                  tax-tran-type = "38".
               else
                  tax-tran-type = "13".

               if not incinv or not incmemo
               then do:
                  so_recno = recid(somstr2).
                  /* GET THE INVOICE TOTAL */
                  undo_trl2 = true.
                  /*grc338
                  {us/bbi/gprun.i ""soivtrl2.p""
                  */ {us/bbi/gprun.i ""xfivtrl2.p""
                     "(input comb_inv_nbr,
                       input so_nbr,
                       input col-80 /* REPORT WIDTH */,
                       input '16',
                       input tot_cont_charge,
                       input tot_line_charge,
                       input l_consolidate)"}

                  if not incinv and ord_amt >= 0 then
                     next.

                  if not incmemo and ord_amt < 0 then
                     next.

               end. /* IF NOT INCINV OR NOT INCMEMO */ 

               if (somstr2.so_inv_nbr      <> ""
                   and somstr2.so_inv_nbr  <> so_mstr.so_inv_nbr)
                   or  somstr2.so_cust     <> so_mstr.so_cust
               then
                  next.

               /* PROCEDURE FOR CONSOLIDATION RULES */
               pass-con = 1.
               if dom-single = yes
               then pass-con = 3.
               else if available shc_ctrl and shc_check_ship_pending
               then pass-con = 4.
               {us/bbi/gprun.i ""soconsod.p"" "(input pass-con,
                                        input so_mstr.so_nbr,
                                        input so_nbr,
                                        output l_consolidate,
                                        output l_msg_text)"}
               if l_consolidate
               then do:
                  create t_cons_so.
                  t_cons_sonbr = so_nbr.
                  {us/gp/gprunp.i "txincopl" "p" "create-record"
                            "(input recid(somstr2),
                              input tax-tran-type)" }
               end. /* IF l_consolidate */
            end. /* FOR EACH somstr2 */
            r-result = 0 .
            so_recno = recid(so_mstr). 
            {us/gp/gprunp.i "txincopl" "p" "txcalc"
                      "(input 16                 ,
                        input so_mstr.so_inv_nbr ,
                        input 'CONSOL'           ,
                        input 0                  ,
                        input tax-tran-type      ,
                        input no                 ,
                        input ?                  ,
                        output r-result)" }

            undo_trl2 = true.
         /*grc338  {us/bbi/gprun.i ""soivtrl2.p"" "(input so_mstr.so_inv_nbr, */
          /*grc338*/ {us/bbi/gprun.i ""xfivtrl2.p"" "(input so_mstr.so_inv_nbr,
                                      input (if conso
                                            or (not conso and l_inv_conso)
                                            then
                                               '*'
                                            else
                                               so_mstr.so_nbr),
                                      input col-80 /* REPORT WIDTH */,
                                      input '16',
                                      input tot_cont_charge,
                                      input tot_line_charge,
                                      input (if conso
                                            or (not conso and l_inv_conso)
                                            then
                                               yes
                                            else
                                               l_consolidate ))"}
            if undo_trl2 then return.

            {us/so/soivtod7.i}  /* ACCUMULATE INVOICE TOTALS */
            for first tt_so_inv
               where tt_so_inv_nbr = so_mstr.so_inv_nbr
            no-lock:
                tt_invtot_ord_amt = tt_invtot_ord_amt + invtot_ord_amt.
            end. /* FOR FIRST tt_so_inv */
            if execname <> "sosorp20.p" then
               run addOrderTotal in hInvoiceTotal (so_mstr.so_nbr, 
                                                   (if available tt_so_inv
                                                    then
                                                       tt_invtot_ord_amt
                                                    else
                                                       invtot_ord_amt)).
            addtax = no.

            for each t_cons_so
            no-lock:
               l_consolidate = yes. 
               for first somstr2 
                  where somstr2.so_domain     = global_domain
                  and   somstr2.so_nbr        = t_cons_sonbr
                  and   somstr2.so_compl_stat = ""
               no-lock: end.
                  assign
                     tot_prepaid_amt = tot_prepaid_amt + somstr2.so_prepaid
                     tot_ptax_amt    = tot_ptax_amt + somstr2.so_prep_tax
                     comb_inv_nbr    = so_mstr.so_inv_nbr.

                  /* ASSIGN TRANSACTION TYPE AS 38 FOR CALL INVOICES */
                  if somstr2.so_fsm_type = "FSM-RO"
                  then
                     tax-tran-type = "38".
                  else
                     tax-tran-type = "13".

                  if tax-tran-type = "38" 
                  then
                     l_nbr = so_quote.
                  else
                     l_nbr = "".

                  so_recno = recid(somstr2).

                  find first shipper 
                     where shipper.shipper_sonbr = somstr2.so_nbr 
                  no-error.
                  if not available shipper 
                  then
                     create shipper.
                     shipper.shipper_sonbr = somstr2.so_nbr.
                     if recid(shipper) = -1 then .

                  /* UPDATE SALES ORDER HEADER */
                  {us/bbi/gprun.i ""sosoina.p""}

                  if execname = "sosorp20.p" 
                  then do:
                     /* PRINT SALES ORDER LINES */
                     {us/bbi/gprun.i ""sorp1a01.p"" 
                        "(output tot_cont_charge,
                          output tot_line_charge)"}
                  end.

                  /* TOTAL SALES ORDER */
                  /* TOTAL ORDER, BUT DON'T PRINT THE DETAIL REPORT YET */
                  undo_trl2 = true.
            /*grc338      {us/bbi/gprun.i ""soivtrl2.p"" */
                  /*grc338*/ {us/bbi/gprun.i ""xfivtrl2.p""
                     "(input comb_inv_nbr,
                       input somstr2.so_nbr,
                       input col-80,
                       input '16',
                       input tot_cont_charge,
                       input tot_line_charge,
                       input l_consolidate)"}
                  if undo_trl2 then return.

                  /* ACCUMULATE INVOICE TOTALS */
                  {us/so/soivtod7.i}

                  if execname <> "sosorp20.p" then
                     run addOrderTotal in hInvoiceTotal (l_so_nbr, invtot_ord_amt).
            end. /* FOR EACH t_cons_so */
         end. /* IF execname <> "rcsois" ... */
         else do for somstr2:

            l_ctrk = l_ctrj + 1.

            /* FOR CONSOLIDATIONS, OBTAINING SALES ORDER FROM ORDER_NBR   */
            /* ARRAY OR ORDER_NBR_LIST IF INVOICE PRINT IS BEING RUN FROM */
            /* PRE-SHIPPER/SHIPPER CONFIRM OR SHIPPER UNCONFIRM           */
            l_so_nbr2 = if (l_ctrk <= 30) then
                           order_nbrs[l_ctrk]
                        else
                           entry(l_ctrk - 30 ,order_nbr_list).

            for first somstr2 where somstr2.so_domain = global_domain
               and somstr2.so_nbr = l_so_nbr2
               and somstr2.so_compl_stat = ""
            no-lock:
            end. /* FOR FIRST somstr2 */

            if addtax
            then do:
               repeat while available somstr2 and somstr2.so_to_inv:
                  /* PROCEDURE FOR CONSOLIDATION RULES */
                  pass-con = 1.
                  if dom-single = yes
                  then pass-con = 3.
                  else if available shc_ctrl and shc_check_ship_pending
                  then pass-con = 4.
                  {us/bbi/gprun.i ""soconsod.p"" "(input pass-con,
                                            input so_mstr.so_nbr,
                                            input so_nbr,
                                            output l_consolidate,
                                            output l_msg_text)"}
                  if l_consolidate
                  then do:
                     {us/gp/gprunp.i "txincopl" "p" "create-record"
                               "(input recid(somstr2),
                                 input tax-tran-type)" }
                  end. /* IF l_consolidate */

                  l_ctrk = l_ctrk + 1.

                  /* OBTAIN NEXT SALES ORDER FROM ORDER_NBR ARRAY OR */
                  /* THE ORDER_NBR_LIST                              */
                  l_so_nbr2 = if (l_ctrk <= 30) then
                                 order_nbrs[l_ctrk]
                              else
                                 entry(l_ctrk - 30 ,order_nbr_list).

                  for first somstr2
                     where somstr2.so_domain = global_domain
                     and   somstr2.so_nbr = l_so_nbr2
                     and   somstr2.so_compl_stat = ""
                  no-lock:
                  end. /* FOR FIRST somstr2 */

               end. /* REPEAT WHILE AVAILABLE SOMSTR2 */

               {us/gp/gprunp.i "txincopl" "p" "txcalc"
                         "(input 16                 ,
                           input so_mstr.so_inv_nbr ,
                           input 'CONSOL'           ,
                           input 0                  ,
                           input tax-tran-type      ,
                           input no                 ,
                           input ?,
                           output r-result)" }

               undo_trl2 = true.
/*grc338     {us/bbi/gprun.i ""soivtrl2.p""  */
/*grc338*/     {us/bbi/gprun.i ""xfivtrl2.p""
                  "(input so_mstr.so_inv_nbr,
                    input (if conso
                           or (not conso and l_inv_conso)
                           then
                              '*'
                           else
                              so_mstr.so_nbr),
                    input col-80 /* REPORT WIDTH */,
                    input '16',
                    input tot_cont_charge,
                    input tot_line_charge,
                    input (if conso
                           or (not conso and l_inv_conso)
                           then
                              yes
                           else
                              l_consolidate ))"}

               if undo_trl2 then return.
               assign
                  l_ctrk    = l_ctrj
                  l_so_nbr2 = if (l_ctrk <= 30) then
                                 order_nbrs[l_ctrk]
                              else
                                 entry(l_ctrk - 30 ,order_nbr_list).

               for first somstr2
                  where somstr2.so_domain = global_domain
                  and   somstr2.so_nbr = l_so_nbr2
                  and   somstr2.so_compl_stat = ""
               no-lock:
               end. /* FOR FIRST somstr2 */

               {us/so/soivtod7.i}  /* ACCUMULATE INVOICE TOTALS */

               addtax = no.
               for first tt_so_inv
                   where tt_so_inv_nbr = so_mstr.so_inv_nbr
               no-lock:
                  tt_invtot_ord_amt = tt_invtot_ord_amt + invtot_ord_amt.
               end. /*  FOR FIRST tt_so_inv */
               if execname <> "sosorp20.p" then
                  run addOrderTotal in hInvoiceTotal (so_mstr.so_nbr, 
                                                      (if available tt_so_inv
                                                       then
                                                          tt_invtot_ord_amt
                                                       else
                                                          invtot_ord_amt)).

            end. /* IF addtax */
            l_ctrk  = l_ctrj + 1.

            /* FOR CONSOLIDATIONS, OBTAINING SALES ORDER FROM ORDER_NBR   */
            /* ARRAY OR ORDER_NBR_LIST IF INVOICE PRINT IS BEING RUN FROM */
            /* PRE-SHIPPER/SHIPPER CONFIRM OR SHIPPER UNCONFIRM           */
            l_so_nbr2 = if (l_ctrk <= 30) then
                           order_nbrs[l_ctrk]
                        else
                           entry(l_ctrk - 30 ,order_nbr_list).

            for first somstr2
               where somstr2.so_domain = global_domain
               and   somstr2.so_nbr = l_so_nbr2
               and   somstr2.so_compl_stat = ""
            no-lock:
            end. /* FOR FIRST somstr2 */

            repeat while available somstr2 and somstr2.so_to_inv:

               run process-conso
                  (input somstr2.so_nbr,
                   input so_mstr.so_nbr,
                   input so_mstr.so_inv_nbr,
                   input so_mstr.so_cust).

               if undo_trl2 then
                  return.

               l_ctrk = l_ctrk + 1.

               /* OBTAIN NEXT SALES ORDER FROM ORDER_NBR ARRAY OR */
               /* THE ORDER_NBR_LIST                              */
               l_so_nbr2 = if (l_ctrk <= 30) then
                              order_nbrs[l_ctrk]
                           else
                              entry(l_ctrk - 30 ,order_nbr_list).

               for first somstr2
                  where somstr2.so_domain = global_domain
                  and   somstr2.so_nbr = l_so_nbr2
                  and   somstr2.so_compl_stat = ""
               no-lock:
               end. /* FOR FIRST somstr2 */

            end. /* REPEAT WHILE AVAILABLE SOMSTR2 */

         end. /* IF EXECNAME = "RCSOIS.P" OR EXECNAME = "RCUNIS.P"  */

      end. /* IF CONSO */

      /*grc338 this is for draft Invoice print - ignore this ***/
      if execname = "sosorp20.p" then do:
         if can-find(mfc_ctrl where mfc_domain = global_domain and
                                    mfc_module = "SO" and
                                    mfc_seq = 170)
         then do:
            so_recno = recid(so_mstr).
            {us/bbi/gprun.i ""sorp10c.p""}
         end.

         hide frame continue.

         /*Establish the label for the display of discounts*/
         if disc_sum_key <> "1" and
            disc_sum_key <> disc_det_key
         then do:
            find first lngd_det where lngd_dataset begins "soprint"
               and lngd_field   = "det_disc_prnt"
               and lngd_lang    = global_user_lang
               and lngd_key1    = disc_sum_key
            no-lock no-error.
            if available lngd_det then
               disc_prnt_label = lngd_translation.
            else
               disc_prnt_label = "".
         end.

         /* Print discount summary, delete disc wkfl records */
         {us/so/sopiprn2.i}

      end.

      /*PRINT TRAILER*/
      so_recno = recid(so_mstr).

      /* DISPLAY TRAILER*/
      /* PRINT TAX DETAIL FOR ALL SALES ORDERS */
      /* FOR THIS INVOICE NUMBER USING 132 COLUMN */
      /* AND NO FORCED PAGE BREAK              */
      undo_txdetrp = true.

      /* ADDED SIXTH INPUT PARAMETER '' AND SEVENTH INPUT     */
      /* PARAMETER yes TO ACCOMMODATE THE LOGIC INTRODUCED IN */
      /* txdetrpa.i FOR DISPLAYING THE APPROPRIATE CURRENCY   */
      /* AMOUNT.                                              */

      if so_curr <> base_curr and isEUtransaction(so_site, so_cust)
      then do:
         assign exch_rate  = so_ex_rate
                exch_rate2 = so_ex_rate2.

         if (not so_fix_rate) then do:
            {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
                           "(input  so_curr,
                             input  base_curr,
                             input  so_ex_ratetype,
                             input  so_inv_date,
                             output exch_rate,
                             output exch_rate2,
                             output mc-error-number)" }
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end.

            assign so_ex_rate  = exch_rate
                   so_ex_rate2 = exch_rate2.

         end. /* IF (NOT SO_FIX_RATE) AND .. */

         for each tx2d_det where tx2d_domain = global_domain
                             and tx2d_ref = so_inv_nbr
                             and tx2d_nbr = so_nbr
                             and tx2d_tr_type = "16"
                             and tx2d_tax_code <> "00000000"
         exclusive-lock:
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                "(input  so_curr,
                  input  base_curr,
                  input  exch_rate,
                  input  exch_rate2,
                  input  tx2d_cur_tax_amt,
                  input  true, /* ROUND */
                  output tx2d_tax_amt,
                  output mc-error-number)" }

            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                "(input  so_curr,
                  input  base_curr,
                  input  exch_rate,
                  input  exch_rate2,
                  input  tx2d_tottax,
                  input  true, /* ROUND */
                  output tx2d_taxable_amt,
                  output mc-error-number)" }

            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                "(input  so_curr,
                  input  base_curr,
                  input  exch_rate,
                  input  exch_rate2,
                  input  tx2d_cur_nontax_amt,
                  input  true, /* ROUND */
                  output tx2d_nontax_amt,
                  output mc-error-number)" }

            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                "(input  so_curr,
                  input  base_curr,
                  input  exch_rate,
                  input  exch_rate2,
                  input  tx2d_cur_recov_amt,
                  input  true, /* ROUND */
                  output tx2d_recov_amt,
                  output mc-error-number)" }

            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                "(input  so_curr,
                  input  base_curr,
                  input  exch_rate,
                  input  exch_rate2,
                  input  tx2d_cur_abs_ret_amt,
                  input  true, /* ROUND */
                  output tx2d_abs_ret_amt,
                  output mc-error-number)" }
         end.
      end.

      /*grc338 this is for draft Invoice print - ignore this ***/
      /*grc338 ***
      if execname = "sosorp20.p" 
      then do:
         {us/bbi/gprun.i ""txdetrp.p"" "(input '16',
                                  input so_inv_nbr,
                                  input '*',
                                  input col-80,
                                  input trl_length, /* PAGE-BREAK */
                                  input '',
                                  input yes)"}

         if undo_txdetrp then
            undo, leave.  /* FOR EACH SO_MSTR */

         assign
            tot_ptax_amt    = tot_ptax_amt + so_prep_tax
            tot_prepaid_amt = tot_prepaid_amt + so_prepaid
            add-trl-length  = if tot_prepaid_amt <> 0 then 5
                              else 0.

         if so_curr <> base_curr then do:
            assign l_basetaxtot = 0.

            for each tx2d_det
               where tx2d_domain = global_domain
                 and tx2d_ref = so_inv_nbr
                 and tx2d_nbr = so_nbr
                 and tx2d_tr_type = "16"
                 and tx2d_tax_code <> "00000000"
            no-lock:
               l_basetaxtot = l_basetaxtot + tx2d_tax_amt.
            end.

            {us/so/soivto11.i &totaltaxbase=l_basetaxtot
                        &totaltax=invtot_tax_amt
                        &socurr=so_curr
                        &eusite=so_site
                        &eubill=so_cust
                        &euship=so_ship
                        &base_only=no
                        &linepos=38
                        &labelpos=23}
         end.

         if page-size - line-counter < trl_length + add-trl-length then
            page.

         do while page-size - line-counter > trl_length + add-trl-length:
            put skip(1).
         end.

         if msg <> "" then put msg skip.
         put
            "-----------------------------------------" +
            "-----------------------------------------" format "x(80)".

         if conso
         then 
            assign
               l_orig_taxdt = tax_date
               tax_date     = l_last_shipdt.
         {us/so/soivtod8.i}

         if conso
         then 
            tax_date = l_orig_taxdt.
         price_fmt = "-zzzz,zzz,zz9.99".

         {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output price_fmt,
                                   input rndmthd)"}

         tot_prepaid_amt:format  in frame prepd = price_fmt.
         tot_ptax_amt:format     in frame prepd = price_fmt.
         tot_prepaid_nett:format in frame prepd = price_fmt.
         amt_due_af_prep:format  in frame prepd = price_fmt.

         if tot_prepaid_amt <> 0 then do:

            /* IF THERE HAS BEEN A ROUNDING ERROR, ADJUST */
            /* THE PREPAID TAX AMOUNT TO BALANCE IT OUT.  */
            if absolute(tot_ptax_amt - tax_amt) = .01 then
               tot_ptax_amt = tax_amt.

            assign
               tot_prepaid_nett = tot_prepaid_amt + tot_ptax_amt
               amt_due_af_prep  = invtot_ord_amt  - tot_prepaid_nett.

            display
               tot_prepaid_amt
               tot_ptax_amt
               tot_prepaid_nett
               amt_due_af_prep
            with frame prepd.

         end.

         page.
      end.
      **** grc338 */

      assign update_post = true.

   end. /* BLOCKA */

   if (execname <> "rcsois.p"   and
       execname <> "xfrcsois.p" and /*grc338-1*/
       execname <> "whrfshtr.p" and
       index(program-name(4),'rcauis01') = 0 and
       execname <> "rcunis.p"   and
       lookup(execname,l_consign_progs) = 0) and
       dom-single = no
   then do:
      if l_consolidate
      then do:
         if not 
            can-find(first so_mstr where so_domain = global_domain
            and  (so_nbr >= nbr and so_nbr <= nbr1)
            and  (so_to_inv = yes)
            and  (so_ship_date >= shipdate and so_ship_date <= shipdate1)
            and  (so_cust >= cust and so_cust <= cust1)
            and  (so_bill >= bill and so_bill <= bill1)
            and  (so_ship >= ship and so_ship <= ship1)         
            and  (so_site >= site and so_site <= site1)
            and  (so_slspsn[1] >= sls-psn and so_slspsn[1] <= sls-psn1)
            and  (so_lang >= lang and so_lang <= lang1)
            and  (so_daybookset >= daybookset and so_daybookset <= daybookset1)
            and  so_compl_stat = ""
            and  so_inv_nbr = "")
         then
            leave.
      end.

      find next so_mstr where so_domain = global_domain
         and  (so_nbr >= nbr and so_nbr <= nbr1)
         and  (so_to_inv = yes)
         and  (so_ship_date >= shipdate and so_ship_date <= shipdate1)
         and  (so_cust >= cust and so_cust <= cust1)
         and  (so_bill >= bill and so_bill <= bill1)
         and  (so_ship >= ship and so_ship <= ship1)         
	 and  (so_site >= site and so_site <= site1)
         and  (so_slspsn[1] >= sls-psn and so_slspsn[1] <= sls-psn1)
         and  (so_lang >= lang and so_lang <= lang1)
         and  (so_daybookset >= daybookset and so_daybookset <= daybookset1)
         and  so_compl_stat = ""
      no-lock no-error.

      if available so_mstr
      then do:
         so_recno = recid(so_mstr).
         run p_check_locked(input so_recno).
       end. /* IF AVAILABLE so_mstr */
   end. /* IF (EXECNAME <> "RCSOIS.P" AND EXECNAME <> "RCUNIS.P") */

   else do:
      l_ctrj = l_ctrj + 1.
      /* OBTAIN NEXT SALES ORDER FROM ORDER_NBR ARRAY OR */
      /* THE ORDER_NBR_LIST                              */
      l_so_nbr = if (l_ctrj <=  30) then
                    order_nbrs[l_ctrj]
                 else
                    entry(l_ctrj - 30 ,order_nbr_list).
      for first so_mstr where so_domain = global_domain
           and so_nbr = l_so_nbr
           and so_compl_stat = ""
      no-lock: end.
   end. /* ELSE DO */

end.

if not foundone then do:
   /* 0 records found matching selection criteria */
   {us/bbi/pxmsg.i &MSGNUM=1615 &ERRORLEVEL=1 &MSGARG1=string(0)
            &PAUSEAFTER=true}
end.

run resetFormat in h_format.
delete procedure h_format no-error.

PROCEDURE process-conso:
/* THIS PROCEDURE PROCESSES CONSOLIDATIONS OF SALES ORDERS */

   /* INPUT PARAMETERS */
   define input parameter l_so_nbr3    like so_nbr     no-undo.
   define input parameter l_so_nbr     like so_nbr     no-undo.
   define input parameter l_so_inv_nbr like so_inv_nbr no-undo.
   define input parameter l_so_cust    like so_cust    no-undo.
   /* BUFFERS */
   define buffer somstr3 for so_mstr.

   for first somstr3 where somstr3.so_domain = global_domain
        and somstr3.so_nbr = l_so_nbr3
        and somstr3.so_compl_stat = ""
   no-lock: end.

   if (somstr3.so_inv_nbr     <> ""
       and somstr3.so_inv_nbr <> l_so_inv_nbr)
       or  somstr3.so_cust    <> l_so_cust
   then
      return.

   /* PROCEDURE FOR CONSOLIDATION RULES */
   pass-con = 1.
   if dom-single = yes
   then pass-con = 3.
   else if available shc_ctrl and shc_ctrl.shc_check_ship_pending
   then pass-con = 4.
   {us/bbi/gprun.i ""soconsod.p"" "(input pass-con,
                             input l_so_nbr,
                             input somstr3.so_nbr,
                             output l_consolidate,
                             output l_msg_text)"}

   if l_consolidate then do:

      assign
         tot_prepaid_amt = tot_prepaid_amt + so_prepaid
         tot_ptax_amt    = tot_ptax_amt + so_prep_tax
         comb_inv_nbr    = l_so_inv_nbr.

      if tax-tran-type = "38" then
         l_nbr = so_quote.
      else
         l_nbr = "".

      so_recno = recid(somstr3).

      find first shipper where shipper.shipper_sonbr = somstr3.so_nbr no-error.
      if not available shipper then
         create shipper.
      shipper.shipper_sonbr = somstr3.so_nbr.
      if recid(shipper) = -1 then .

      /* UPDATE SALES ORDER HEADER */
      {us/bbi/gprun.i ""sosoina.p""}
   
      if execname = "sosorp20.p" then do:
         /* PRINT SALES ORDER LINES */
/*grc338  {us/bbi/gprun.i ""sorp1a01.p"" "(output tot_cont_charge, */
/*grc338*/  {us/bbi/gprun.i ""xfrp1a01.p"" "(output tot_cont_charge,
                                          output tot_line_charge)"}
      end.

      /* TOTAL SALES ORDER */
      /* TOTAL ORDER, BUT DON'T PRINT THE DETAIL REPORT YET */
      undo_trl2 = true.
      /*grc338 {us/bbi/gprun.i ""soivtrl2.p"" "(input comb_inv_nbr,  */
      /*grc338*/ {us/bbi/gprun.i ""xfivtrl2.p"" "(input comb_inv_nbr,
                                input somstr3.so_nbr,
                                input col-80,
                                input '16',
                                input tot_cont_charge,
                                input tot_line_charge,
                                input l_consolidate)"}
      if undo_trl2 then return.

      /* ACCUMULATE INVOICE TOTALS */
      {us/so/soivtod7.i}

      if execname <> "sosorp20.p" then
         run addOrderTotal in hInvoiceTotal (l_so_nbr, invtot_ord_amt).

   end. /* IF L_CONSOLIDATE */

END PROCEDURE.

/* THIS PROCEDURE CHECKS FOR MULTIPLE PENDING INVOICES REFERENCING */
/* SAME INVOICE NUMBER SO AS TO PROCEED FOR CONSOLIDATION EVEN IF  */
/* USER ENTERS CONSOLIDATE INVOICES AS NO.                         */
PROCEDURE p_consolidate:

   define input  parameter l_nbr1        like so_nbr      no-undo.
   define input  parameter l_nbr2        like so_nbr      no-undo.
   define input  parameter l_so_nbr      like so_nbr      no-undo.
   define input  parameter l_so_inv_nbr  like so_inv_nbr  no-undo.
   define output parameter l_multi_conso like mfc_logical no-undo.

   define buffer somstr4 for so_mstr.

   isConsolDom = no.
   if dom-single = yes
   then do:
      if can-find (first somstr4
         where somstr4.so_domain = global_domain
         and   somstr4.so_nbr >= l_nbr1
         and   somstr4.so_nbr <= l_nbr2
         and   somstr4.so_nbr <> l_so_nbr
         and   somstr4.so_inv_nbr = l_so_inv_nbr
         and   somstr4.so_app_owner = "DOM"
         and   somstr4.so_compl_stat = "")
      then do:
         assign
            l_multi_conso = yes
            isConsolDom   = yes.
         return.
      end.
   end.

   if can-find (first somstr4
      where somstr4.so_domain = global_domain
      and   somstr4.so_nbr >= l_nbr1
      and   somstr4.so_nbr <= l_nbr2
      and   somstr4.so_nbr <> l_so_nbr
      and   somstr4.so_inv_nbr = l_so_inv_nbr
      and   somstr4.so_compl_stat = "")
   then
      l_multi_conso = yes.

END PROCEDURE. /* p_consolidate */

PROCEDURE p_consotot:

   define input  parameter l_nbr1        like so_nbr      no-undo.
   define input  parameter l_nbr2        like so_nbr      no-undo.
   define input  parameter l_so_nbr      like so_nbr      no-undo.
   define input  parameter l_so_inv_nbr  like so_inv_nbr  no-undo.

   define buffer somstr4 for so_mstr.

   for each somstr4
      where somstr4.so_domain  = global_domain
      and   somstr4.so_nbr     <> l_so_nbr
      and   somstr4.so_inv_nbr = l_so_inv_nbr
      and   somstr4.so_to_inv  = false
      and   somstr4.so_compl_stat = ""
   no-lock:
         so_recno = recid(somstr4) .

         {us/gp/gprunp.i "txincopl" "p" "create-record"
                   "(input recid(somstr4),
                     input tax-tran-type)" }

         undo_trl2 = true.
        /*grc338  {us/bbi/gprun.i ""soivtrl2.p"" "(input somstr4.so_inv_nbr, */
         /*grc338*/ {us/bbi/gprun.i ""xfivtrl2.p"" "(input somstr4.so_inv_nbr,
                                   input '*',
                                   input col-80 /* REPORT WIDTH */,
                                   input '16',
                                   input tot_cont_charge,
                                   input tot_line_charge,
                                   input l_consolidate)"}
         if undo_trl2 then return.
         {us/so/soivtod7.i}  /* ACCUMULATE INVOICE TOTALS */
   end. /* FOR EACH somstr4 */

END PROCEDURE. /* p_consotot */

/* PROCEDURE TO SKIP LOCKED ORDERS DURING INVOICE PRINT */
PROCEDURE p_check_locked:

   define input parameter l_so_recno as recid no-undo.

   find first so_mstr
      where recid(so_mstr) = l_so_recno
   exclusive-lock no-error no-wait.

   if locked so_mstr
   then do:
      /* Consider legal doc number when 'Separate Invoices for Each Shipment' */
      if available shc_ctrl and shc_ctrl.shc_check_ship_pending then
         find next so_mstr
            where so_domain = global_domain
            and  (so_nbr >= nbr and so_nbr <= nbr1)
            and  (so_to_inv = yes)
            and  (so_ship_date >= shipdate and so_ship_date <= shipdate1)
            and  (so_cust >= cust and so_cust <= cust1)
            and  (so_bill >= bill and so_bill <= bill1)
            and  (so_ship >= ship and so_ship <= ship1)
	    and  (so_site >= site and so_site <= site1)
            and  (so_lang >= lang and so_lang <= lang1)
            and  (so_slspsn[1] >= sls-psn and so_slspsn[1] <= sls-psn1)
            and  (so_daybookset >= daybookset and so_daybookset <= daybookset1)
            and so_compl_stat = ""
            and (can-find(first lgdd_det where lgdd_domain = global_domain
                         and lgdd_order = so_nbr
                         and can-find(first lgd_mstr where lgd_domain = global_domain
                                      and lgd_type = yes
                                      and ((lgd_posted = no and lgd_status = {&LD_CONFIRMED})
                                      or  (lgd_posted = yes and lgd_status = {&LD_CANCELLED} and lgd_cancel_inv = ""))
                                      and lgd_mstr.oid_lgd_mstr = lgdd_det.oid_lgd_mstr
                                      and lgd_nbr >= ldnbr and lgd_nbr <= ldnbr1
                                      and lgd_shipfrom >= ldshipfrom and lgd_shipfrom <= ldshipfrom1))
                 or
                 not can-find(first lgdd_det where lgdd_domain = global_domain and lgdd_order = so_nbr))
         no-lock no-error.
      else
         find next so_mstr
            where so_domain = global_domain
            and  (so_nbr >= nbr and so_nbr <= nbr1)
            and  (so_to_inv = yes)
            and  (so_ship_date >=shipdate and so_ship_date <= shipdate1)
            and  (so_cust >= cust and so_cust <= cust1)
            and  (so_bill >= bill and so_bill <= bill1)
            and  (so_ship >= ship and so_ship <= ship1)
	    and  (so_site >= site and so_site <= site1)
            and  (so_slspsn[1] >= sls-psn and so_slspsn[1] <= sls-psn1)
            and  (so_lang >= lang and so_lang <= lang1)
            and  (so_daybookset >= daybookset and so_daybookset <= daybookset1)
            and  so_compl_stat = ""
         no-lock no-error.

      if available(so_mstr)
      then do:
         l_so_recno = recid(so_mstr).
         run p_check_locked(l_so_recno).
      end. /* IF AVAILABLE so_mstr */

   end. /* IF LOCKED so_mstr */

END PROCEDURE. /* p_check_locked */

/* procedures of print settings */
{us/so/soprprc1.i}
