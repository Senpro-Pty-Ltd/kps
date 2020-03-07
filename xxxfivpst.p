/* xxxfivpst.p - POST INVOICES TO AR AND GL REPORT                          */
/* xfivpst.p - POST INVOICES TO AR AND GL REPORT                            */
/* soivpst.p - POST INVOICES TO AR AND GL REPORT                            */
/* Copyright 1986 QAD Inc. All rights reserved.                             */
/* $Id: xxxfivpst.p,v 1.2 2018/03/13 17:10:02 gbg Exp $: */
/* REVISION: 6.0      LAST MODIFIED: 04/20/90   BY: ftb *                   */
/* REVISION: 6.0      LAST MODIFIED: 07/11/90   BY: wug *D051*              */
/* REVISION: 6.0      LAST MODIFIED: 08/17/90   BY: mlb *D055*              */
/* REVISION: 6.0      LAST MODIFIED: 08/24/90   BY: wug *D054*              */
/* REVISION: 6.0      LAST MODIFIED: 11/01/90   BY: mlb *D162*              */
/* REVISION: 6.0      LAST MODIFIED: 12/21/90   BY: mlb *D238*              */
/* REVISION: 6.0      LAST MODIFIED: 12/06/90   BY: afs *D279*              */
/* REVISION: 6.0      LAST MODIFIED: 02/18/91   BY: afs *D354*              */
/* REVISION: 6.0      LAST MODIFIED: 02/28/91   BY: afs *D387*              */
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D424*              */
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425*              */
/* REVISION: 6.0      LAST MODIFIED: 03/28/91   BY: afs *D464*              */
/* REVISION: 6.0      LAST MODIFIED: 04/04/91   BY: afs *D478*   (rev only) */
/* REVISION: 6.0      LAST MODIFIED: 04/29/91   BY: afs *D586*   (rev only) */
/* REVISION: 6.0      LAST MODIFIED: 05/08/91   BY: afs *D628*   (rev only) */
/* REVISION: 6.0      LAST MODIFIED: 08/12/91   BY: afs *D824*   (rev only) */
/* REVISION: 6.0      LAST MODIFIED: 08/14/91   BY: mlv *D825*              */
/* REVISION: 6.0      LAST MODIFIED: 10/09/91   BY: dgh *D892*              */
/* REVISION: 7.0      LAST MODIFIED: 10/30/91   BY: mlv *F029*              */
/* REVISION: 6.0      LAST MODIFIED: 11/26/91   BY: wug *D953*              */
/* REVISION: 7.0      LAST MODIFIED: 11/30/91   BY: sas *F017*              */
/* REVISION: 7.0      LAST MODIFIED: 02/19/92   BY: tjs *F213*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 03/04/92   BY: tjs *F247*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 03/22/92   BY: tmd *F263*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 03/27/92   BY: dld *F297*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 04/08/92   BY: tmd *F367*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 04/09/92   BY: afs *F356*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 06/08/92   BY: tjs *F504*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 06/19/92   BY: tmd *F458*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 06/25/92   BY: sas *F656*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 06/29/92   BY: afs *F715*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 07/20/92   BY: tjs *F739*   (rev only) */
/* REVISION: 7.0      LAST MODIFIED: 08/13/92   BY: sas *F850*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 08/24/92   BY: tjs *G033*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 09/04/92   BY: afs *G047*              */
/* REVISION: 7.3      LAST MODIFIED: 10/23/92   BY: afs *G230*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 10/12/92   BY: afs *G163*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 11/06/92   BY: afs *G290*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 12/04/92   BY: afs *G394*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 01/05/93   BY: mpp *G484*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 12/06/92   BY: sas *G435*              */
/* REVISION: 7.3      LAST MODIFIED: 01/24/93   BY: sas *G585*              */
/* REVISION: 7.3      LAST MODIFIED: 01/27/93   BY: sas *G613*              */
/* REVISION: 7.3      LAST MODIFIED: 04/08/93   BY: afs *G905*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 04/12/93   BY: bcm *G942*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 04/20/93   BY: tjs *G948*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 05/26/93   BY: kgs *GB38*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 06/07/93   BY: tjs *GA64*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 06/09/93   BY: dpm *GB71*   (rev only) */
/* REVISION: 7.3      LAST MODIFIED: 06/16/93   BY: tjs *GA65*   (rev only) */
/* REVISION: 7.4      LAST MODIFIED: 07/30/93   BY: jjs *H050*   (rev only) */
/* REVISION: 7.4      LAST MODIFIED: 07/22/93   BY: pcd *H039*              */
/* REVISION: 7.4      LAST MODIFIED: 10/01/93   BY: tjs *H070*   (rev only) */
/* REVISION: 7.4      LAST MODIFIED: 10/18/93   BY: tjs *H182*   (rev only) */
/* REVISION: 7.4      LAST MODIFIED: 10/23/93   BY: cdt *H184*   (rev only) */
/* REVISION: 7.4      LAST MODIFIED: 11/15/93   BY: tjs *H196*   (rev only) */
/* REVISION: 7.4      LAST MODIFIED: 11/16/93   BY: bcm *H226*   (rev only) */
/* REVISION: 7.4      LAST MODIFIED: 11/23/93   BY: afs *H239*   (rev only) */
/* REVISION: 7.4      LAST MODIFIED: 05/09/94   BY: dpm *H367*              */
/* REVISION: 7.4      LAST MODIFIED: 05/27/94   BY: dpm *GJ95*              */
/* REVISION: 7.4      LAST MODIFIED: 06/07/94   BY: dpm *FO66*              */
/* REVISION: 7.4      LAST MODIFIED: 06/22/95   BY: rvw *H0F0*              */
/* REVISION: 8.5      LAST MODIFIED: 03/11/96   BY: wjk *J0DV*              */
/* REVISION: 8.5      LAST MODIFIED: 04/12/96   BY: *J04C* Sue Poland       */
/* REVISION: 8.6      LAST MODIFIED: 06/19/96   BY: bjl *K001*              */
/* REVISION: 8.5      LAST MODIFIED: 08/26/96   BY: *G2CR* Ajit Deodhar     */
/* REVISION: 8.6      LAST MODIFIED: 03/19/97   BY: *K082* E. Hughart       */
/* REVISION: 8.6      LAST MODIFIED: 12/08/97   BY: *J27M* Seema Varma      */
/* REVISION: 8.6      LAST MODIFIED: 11/06/97   BY: *K15N* Jim Williams     */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane        */
/* REVISION: 8.6E     LAST MODIFIED: 28/04/98   BY: *L00L* Adam Harris      */
/* REVISION: 9.0      LAST MODIFIED: 09/30/98   BY: *J2CZ* Reetu Kapoor     */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan       */
/* REVISION: 9.0      LAST MODIFIED: 08/12/99   BY: *J3KJ* Bengt Johansson  */
/* REVISION: 9.1      LAST MODIFIED: 09/08/99   BY: *N02P* Robert Jensen    */
/* REVISION: 9.1      LAST MODIFIED: 11/23/99   BY: *L0LS* Manish K.        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 07/20/00   BY: *L0QV* Manish K.        */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb              */
/* REVISION: 9.1      LAST MODIFIED: 11/27/00   BY: *L12B* Santosh Rao      */
/* Revision: 1.28     BY: Falguni Dalal       DATE: 12/12/00   ECO: *L15W*  */
/* REVISION: 9.1      LAST MODIFIED: 10/13/00 BY: *N0W8* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 02/13/01 BY: *N0WV* Sandeep P.         */
/* Old ECO marker removed, but no ECO header exists *F0PN*                  */
/* Revision: 1.30      BY: Steve Nugent       DATE: 07/09/01   ECO: *P007*  */
/* Revision: 1.31      BY: Mercy C.           DATE: 04/02/02   ECO: *N1D2*  */
/* Revision: 1.32      BY: Ed van de Gevel    DATE: 05/08/02   ECO: *P069*  */
/* Revision: 1.33.3.1  BY: John Corda         DATE: 08/09/02   ECO: *N1QP*  */
/* Revision: 1.33.3.2  BY: Paul Donnelly (SB) DATE: 06/28/03   ECO: *Q00L*  */
/* Revision: 1.33.3.4  BY: Marcin Serwata     DATE: 08/25/03   ECO: *P10T*  */
/* Revision: 1.33.3.5  BY: Narathip W.        DATE: 09/01/03   ECO: *P0VH*  */
/* Revision: 1.33.3.6  BY: Kirti Desai        DATE: 11/12/03   ECO: *P195*  */
/* Revision: 1.33.3.7  BY: Veena Lad          DATE: 11/20/03   ECO: *P1BB*  */
/* Revision: 1.33.3.8  BY: Salil Pradhan      DATE: 03/09/04   ECO: *P1GM*  */
/* Revision: 1.33.3.9  BY: Manisha Sawant     DATE: 06/29/04   ECO: *P27Z*  */
/* Revision: 1.33.3.10 BY: Bharath Kumar      DATE: 09/20/04   ECO: *P2LB*  */
/* Revision: 1.33.3.11 BY: Ed van de Gevel    DATE: 03/01/05   ECO: *R00G*  */
/* Revision: 1.33.3.13 BY: Ed van de Gevel    DATE: 03/07/05   ECO: *R00K*  */
/* Revision: 1.33.3.14 BY: Manish Dani        DATE: 04/08/05   ECO: *P3DM*  */
/* Revision: 1.33.3.15 BY: Shivganesh Hegde   DATE: 05/17/05   ECO: *P3LK*  */
/* Revision: 1.33.3.16 BY: Ed van de Gevel    DATE: 07/01/05   ECO: *R01H*  */
/* Revision: 1.33.3.17 BY: Jignesh Rachh      DATE: 08/02/05   ECO: *P3V0*  */
/* Revision: 1.33.3.18 BY: Jean Miller        DATE: 02/18/06   ECO: *Q0R5*  */
/* Revision: 1.33.3.19 BY: Katie Hilbert      DATE: 07/16/07   ECO: *R0C6*  */
/* Revision: 1.33.3.20    BY: Vivek Kamath       DATE: 04/22/08   ECO: *P4LG* */
/* Revision: 1.33.3.21    BY: Jean Miller        DATE: 06/19/08   ECO: *R0VD* */
/* Revision: 1.33.3.22    BY: Dinesh Dubey       DATE: 07/18/08   ECO: *R0Y1* */
/* Revision: 1.33.3.23    BY: Katie Hilbert      DATE: 07/23/08   ECO: *R0YS* */
/* Revision: 1.33.3.24    BY: Deirdre O'Brien    DATE: 10/31/08   ECO: *R16Q* */
/* Revision: 1.33.3.27    BY: Deirdre O'Brien    DATE: 10/31/08   ECO: *R17K* */
/* Revision: 1.33.3.28    BY: Xiaolei Meng       DATE: 07/31/09   ECO: *R1N2* */
/* Revision: 1.33.3.29    BY: Deepak Keni        DATE: 10/22/09   ECO: *R1SV* */
/* Revision: 1.33.3.30    BY: Laxmikant Bondre   DATE: 11/09/09   ECO: *R1SF* */
/* Revision: 1.33.3.31    BY: Jean Miller        DATE: 11/22/09   ECO: *R1TV* */
/* Revision: 1.33.3.32    BY: Katie Hilbert      DATE: 02/04/10   ECO: *R1XQ* */
/* Revision: 1.33.3.35    BY: Katie Hilbert      DATE: 06/25/10   ECO: *R21M* */
/* Revision: 1.33.3.36    BY: Deirdre O'Brien    DATE: 07/09/10   ECO: *R21V* */
/* Revision: QAD2016      BY: sxh     DATE: 06/04/16 ECO: *grc338* */
/* CYB       LAST MODIFIED: 10-AUG-2010     BY: gbg *cy1002*                  */
/* CYB                LAST MODIFIED: 26 Nov 10  BY: *A1007-CR01* nac      */
/* CYB                LAST MODIFIED: 12 Jul 11  BY: *CA825021 -R1SV* nac  */
/* CYB       LAST MODIFIED: 20-JUL-2011     BY: nac *cy1002g*                 */
/* CYB   LAST MODIFIED: 23-AUG-2011     BY: gbg *cy1047*                      */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 14-AUG-2012    BY:  gbg *c1329*                     */
/* CYB    LAST MODIFIED: 28-AUG-2012    BY:  gbg *c1333*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 07-MAY-2013     BY: gbg *c1398*                   */
/* CYB       LAST MODIFIED: 21-Jun-2013     BY: gbg *c1420*                   */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
{us/mf/mfdtitle.i}
 
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}
 
{us/so/soivpst.i "new shared"} /* variable definition moved include file */
{us/so/soivrfrpt.i}
{us/fs/fsdeclr.i new}
 
{us/et/etvar.i &new="new"}
{us/et/etdcrvar.i "new"}
{us/et/etrpvar.i  &new="new"}
{us/so/soivtot1.i "NEW" }  /* Define variables for invoice totals. */
{us/tt/ttinvprt.i}
 
/* Shared variables definitions */
{us/so/soprsets.i "new"}
 
{us/mf/mfsprtdf.i new}
 
{us/gp/gpldcons.i}   /* CONSTANTS FOR LEGAL DOCUMENT */
 
{us/gt/gtsoindf.i}

{us/fs/fsconst.i}    /* CONSTANTS FOR SSM */

{us/px/pxphdef.i soldxr}

define new shared variable dom-ord          like so_nbr no-undo.
define new shared variable dom-ord1         like so_nbr no-undo.
define new shared variable sls-psn          like so_slspsn[1] no-undo.
define new shared variable sls-psn1         like so_slspsn[1] no-undo.
define new shared variable dom-single       like mfc_logical no-undo.
 
define new shared variable prog_name as character
   initial "soivpst.p" no-undo.
define new shared variable consign_batch  like  cncu_batch  no-undo  .
 
define new shared variable update_invoice    like mfc_logical no-undo.
define variable l_cur_tax_amt like tx2d_cur_tax_amt no-undo.
define variable l_po_schd_nbr like sod_contr_id     no-undo.
define variable vba_recno as recid      no-undo.
 
 
/* CUSTOMIZED SECTION FOR VERTEX BEGIN */
define variable l_vtx_message   like mfc_logical initial no no-undo.
define variable l_cont          like mfc_logical initial no no-undo.
define variable l_api_handle      as handle                 no-undo.
define variable l_vq_reg_db_open  as logical     initial no no-undo.
define variable result-status     as integer                no-undo.
 
define variable print_invoice     like mfc_logical no-undo.


/*cy1024*/ define shared variable cyb_pst_prt as logical initial yes
/*cy1024*/   label "Post & Print Inv"             no-undo.
/*cy1024*/ define shared variable cyb_so_recid as recid no-undo.
/*cy1024*/ define shared variable cyb_so_nbr like so_nbr no-undo.


 
/* CUSTOMIZED SECTION FOR VERTEX END */
 
/* THE TEMP-TABLE WORK_TRNBR STORES THE VALUES OF FIRST AND LAST  */
/* TRANSACTION NUMBER WHICH IS USED WHEN INVOICE IS POSTED VIA    */
/* SHIPPER CONFIRM, FOR ASSIGNING THE TR_RMRKS AND TR_GL_DATE     */
/* FIELDS. PREVIOUSLY, THIS WAS BEING DONE IN RCSOISB1.P PRIOR TO */
/* INVOICE POST. THIS TEMP-TABLE IS HOWEVER NOT USED BY SOIVPST.P */
/* AND HAS BEEN DEFINED HERE SINCE SOIVPSTA.P, WHICH IS SHARED    */
/* BETWEEN RCSOIS.P AND SOIVPST.P USES IT.                        */
 
define new shared temp-table work_trnbr no-undo
   field work_sod_nbr  like sod_nbr
   field work_sod_line like sod_line
   field work_tr_recid like tr_trnbr
   index work_sod_nbr work_sod_nbr ascending.
 
define new shared temp-table IntraStat field StatID as recid.
define new shared temp-table tt_gt_spt_hist like tt_gt_hist.
define new shared variable site            like ih_site.
define new shared variable site1           like ih_site.
define new shared variable ship            like so_ship.
define new shared variable ship1           like so_ship.
define new shared variable rndmthd         like rnd_rnd_mthd.
define new shared variable oldcurr         like ih_curr.
define new shared variable prt_cor         like mfc_logical.
define new shared variable next_inv_nbr    like soc_inv.
define new shared variable soldto          as character format "x(38)" extent 6.
define new shared variable billto          as character format "x(38)" extent 6.
define new shared variable hdr_po          as character format "x(38)".
define new shared variable resale          like cm_resale.
define new shared variable termsdesc       as character format "x(40)" label "Description" no-undo.
define new shared variable next_inv_pre    like soc_inv_pre.
define new shared variable undo_nota       like mfc_logical.
define new shared variable body_count      as integer.
define new shared variable max_lines       as integer.
define new shared variable conso           like mfc_logical initial no
                                           label "Consolidate Invoices".
define new shared variable override_print_hist like mfc_logical
                                           label "Override Print Invoice".
define new shared variable msg             like msg_desc.
define new shared variable first_line      like mfc_logical.
define new shared variable pages           as integer.
define new shared variable ih_recno        as recid.
define new shared variable comp_addr       like soc_company.
define new shared variable inv_date        like so_inv_date initial today.
define new shared variable inv_date1       like ih_inv_date.
define new shared variable company         as character format "x(38)" extent 6.
define new shared variable shipdate        like so_inv_date.
define new shared variable shipdate1       like shipdate.
define new shared variable addr            as character format "x(38)" extent 6.
define new shared variable tot_ord_amt     like ih_trl3_amt label "Total".
define new shared variable tot_disc        like ih_trl1_amt label "Discount".
define new shared variable tot_trl1        like ih_trl1_amt.
define new shared variable tot_trl2        like ih_trl2_amt.
define new shared variable tot_trl3        like ih_trl3_amt.
define new shared variable base_rpt        as character.
define new shared variable print_options   like mfc_logical initial no
                                           label "Print Features and Options".
define new shared variable lang            like so_lang.
define new shared variable lang1           like lang.
define new shared variable incinv          like mfc_logical initial yes
                                           label "Include Debit Invoices".
define new shared variable incmemo         like mfc_logical initial yes
                                           label "Include Credit Invoices".
define new shared variable order_nbrs      as character extent 30.
define new shared variable order_nbr_list  as character no-undo.
define new shared variable disc_det_key    like lngd_key1 initial "1".
define new shared variable disc_sum_key    like lngd_key1 initial "1".
define new shared variable call-detail     like mfc_logical initial no
                                           label "Print Call Invoice Detail".
define new shared variable reprint         like mfc_logical.
define new shared variable slspsn          as character.
define new shared variable slspsn1         as character.
define new shared variable form_code       as character format "x(2)" label "Form Code" no-undo.
 
define variable print_gl_detail like mfc_logical no-undo.
define variable run_file        as character format "x(12)" no-undo.
define variable disc_det        like lngd_translation label "Discount Detail".
define variable disc_sum        like disc_det         label "Discount Summary".
define variable program_name    as character initial 'soprint.p' no-undo.
define variable msgText         like msg_desc no-undo.
define variable errorSummary    like mfc_logical no-undo.
define variable dev1            like dev no-undo.
define variable l_prtInstBase   like mfc_logical 
                                label "Print ISB Details" no-undo.
define variable rcorder_nbrs     as character extent 30.
define variable rcorder_nbr_list as character no-undo.
define variable rcorder_ct       as integer initial 0.                          
define variable l_isBrazilSSM    as logical no-undo.
 
define buffer bSoMstr for so_mstr.
 
define new shared temp-table consolidated-so
   field cs-so-nbr   like so_nbr
   field cs-trl1-cd  like so_trl1_cd
   field cs-trl2-cd  like so_trl2_cd
   field cs-trl3-cd  like so_trl3_cd
   field cs-trl1-amt like so_trl1_amt
   field cs-trl2-amt like so_trl2_amt
   field cs-trl3-amt like so_trl3_amt
   field cs-added    as logical
index cs-primary is unique primary cs-so-nbr.
 
/* DEFINE VARIABLES USED IN GPGLEF1.P (GL CALENDAR VALIDATION) */
{us/gp/gpglefv.i}
/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtepdf.i &var="new shared"}
{us/gp/gpvtecdf.i &var="new shared"}
 
{us/sh/shrvarsg.i}

/* 'post' MUST BY YES OR GLT_DET RECORDS WILL NOT BE CREATED */
/* HENCE THE POST TO WHITE WILL NOT BE SUCCESSFUL            */
assign
   post        = yes
   update_post = yes.
 
{us/xf/xfso10u.i "new"} /*grc338*/
{us/xf/xfdefa.i "new"} /*grc338*/
{us/xf/xfso10v.i "new"} /*grc338*/
/* Retrieve informational message for invoice printing */
/* Press 'Next' to print invoices */
{us/bbi/pxmsg.i &MSGNUM=7777 &ERRORLEVEL=1 &MSGBUFFER=msgText}
find first soc_ctrl where soc_domain = global_domain
no-lock no-error.
 
find first shc_ctrl where shc_domain = global_domain
no-lock no-error.

for first lgdc_ctrl where lgdc_ctrl.lgdc_domain = global_domain
no-lock: end.
 
/*c1603* start added code >>>>>> */
/*cy1002* start added code */
form
   nbr                  colon 19
   nbr1                 label "To" colon 49 skip
   cyb_pst_prt    colon 19
   xx_inv_type            colon 19
   skip(1)
   lvunpriced             colon 19
   lvproofofdelivery      colon 19
   print_invoice        colon 33
   l_prtInstBase        colon 33
with frame xa width 80 side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame xa:handle).
/*c1603* end   added code <<<<<< */


/*c1333* start deleted code >>>>>>
*  form
*     nbr                  colon 19
*     nbr1                 label "To" colon 49 skip
*     shipdate             colon 19
*     shipdate1            label "To" colon 49 skip
*     daybookset           colon 19
*     daybookset1          label "To" colon 49 skip
*     cust                 colon 19
*     cust1                label "To" colon 49 skip
*     bill                 colon 19
*     bill1                label "To" colon 49 skip
*     ship                 colon 19
*     ship1                label "To" colon 49 skip
*     site                 colon 19
*     site1                label "To" colon 49 skip
*     lang                 colon 19
*     lang1                label "To" colon 49 skip(1)
*     eff_date             colon 19 label "GL Effective Date"
*     print_gl_detail      colon 49
*     errorSummary         colon 72
*     incinv               colon 33
*     incmemo              colon 72
*     conso                colon 33
*     inccor               colon 72
*     prt_cor              colon 33
*     print_invoice        colon 72
*     l_prtInstBase        colon 33
*  with frame a width 80 side-labels.
*  /* Hide the 'Consolidate Invoices' field if the legal document form code is Brazil (51). */
*  if available lgdc_ctrl and lgdc_form_code = "51"
*  then
*     conso:hidden in frame a = yes.
*   
*  /* SET EXTERNAL LABELS */
*  setFrameLabels(frame a:handle).
*c1333* end deleted code <<<<<< */
 
{us/so/soivpstld.i} /* Define legal document frame */
 
/* CUSTOMIZED SECTION FOR VERTEX BEGIN */
/* RUN vqregopn.p TO SEE IF VERTEX SUTI API IS RUNNING, */
/* AND THEN OPEN REGISTER DB                            */
 
/* TRY AND FIND VERTEX TAX API'S PROCEDURE HANDLE. */
{us/gp/gpfindph.i vqapi l_api_handle}
 
/* IF THERE IS NO PROCEDURE HANDLE WE ARE DONE. */
if l_api_handle <> ?
then do:
 
   {us/bbi/gprun.i ""vqregopn.p"" "(output result-status)"}
 
   if result-status = 0
   then
      l_vq_reg_db_open = yes.
 
   if  result-status <> 0
      and not batchrun
   then do:
 
      /* INVOICES WILL POST TO MFG/PRO BUT NOT UPDATE THE VERTEX REGISTER */
      {us/bbi/pxmsg.i &MSGNUM=8880 &ERRORLEVEL=1}
 
      /* CONTINUE WITH INVOICE POST? */
      {us/bbi/pxmsg.i &MSGNUM=8881 &ERRORLEVEL=1 &CONFIRM=l_cont}
      if  l_cont = no
      then
         undo, return no-apply.
 
   end. /* IF  result-status <> 0... */
 
   if result-status <> 0
   then
      l_vtx_message = yes.
 
end. /* IF l_api_handle */
/* CUSTOMIZED SECTION FOR VERTEX END  */
 
do transaction:
 
   insbase = no.
 
   for first svc_ctrl
      where svc_ctrl.svc_domain = global_domain no-lock:
   end.
 
   /* SVC_WARR_SVCODE IS THE WARRANTY SERVICE TYPE FOR RMA'S, */
   /* NOT A DEFAULT WARRANTY TYPE.                            */
 
   /* WITH THE 8.5 RELEASE, LOADING THE STANDARD BOM CONTENTS */
   /* INTO THE INSTALLED BASE IS NO LONGER AN OPTION.  THIS   */
   /* DECISION WAS MADE TO PREVENT SERIALIZED ITEMS FROM      */
   /* GETTING INTO THE ISB WITHOUT SERIAL NUMBERS, AND ENSURE */
   /* THERE ARE NO ADVERSE IMPACTS TO THE COMPLIANCE SERIAL   */
   /* NUMBERING REQUIREMENTS.                                 */
   if available svc_ctrl then
   assign
      serialsp = "S"       /* ALL SERIALS SHOULD LOAD */
      nsusebom = no
      usebom   = svc_isb_bom
      needitem = svc_pt_mstr
      insbase  = svc_ship_isb.
end.
 
/*
* Clear out so_inv_nbr and so_inv_date for previous invoice post runs
* that were cancelled
*/
do transaction:
    orders:
    for each bSoMstr
       where bSoMstr.so_domain = global_domain
         and bSoMstr.so_inv_nbr <> ""
         and bSoMstr.so_to_inv = true
    no-lock:
        /* skip locked records */
        find first so_mstr exclusive-lock
            where recid(so_mstr) = recid(bSoMstr) no-error no-wait.
        if not available so_mstr and locked so_mstr
        then next orders.
        else if available so_mstr
        then
           assign
              so_mstr.so_inv_nbr = ""
              so_mstr.so_inv_date = ?.
        release so_mstr.
    end.
end.
 
/* If 'Separate Invoices for Each Shipment', post invoice by shipment/Legal Doc */
if available shc_ctrl and shc_check_ship_pending
then
   conso = yes.
/*c1603* start deleted code >>>>>>>>
main:
repeat:
**c1603* end   deleted code <<<<<<< */

/*c1603* start added code >>>>>> */
main:
do on error undo, leave:
/*c1603* end   added code <<<<<< */
    
   run resetSharedVars.

/*cy1024>>*/
find first so_mstr where so_domain = global_domain and
so_nbr = cyb_so_nbr no-lock no-error.
if not available so_mstr then do:
   bell.
   message "Sales Order is not available. SalesOrder#" cyb_so_nbr. pause.
   leave.
end.
else
   assign nbr = so_nbr
          nbr1 = so_nbr
	  print_invoice = yes.

/*cy1024<<*/
 
/*c1603* start deleted code >>>>>>>>
*    if batchrun
*       and available shc_ctrl 
*       and shc_check_ship_pending
*    then do:
*       update
*          nbr nbr1
*          shipdate shipdate1
*          daybookset daybookset1
*          cust cust1
*          bill bill1
*          ship ship1
*          site site1
*          lang lang1
*          eff_date skip
*          print_gl_detail
*          errorSummary
*          incinv
*          incmemo
*          /* Hide the 'Consolidate Invoices' field if the legal document form code is Brazil (51). */
*          conso when not (available lgdc_ctrl and lgdc_form_code = "51")
*          inccor
*          prt_cor
*          print_invoice
*          l_prtInstBase
*          ldnbr
*          ldnbr1
*          ldshipfrom
*          ldshipfrom1
*       with frame batch 2 columns width 80.     
*    end. /* IF batchrun AND AVAILABLE shc_ctrl ... */
*    else do:
*       update
*          nbr nbr1
*          shipdate shipdate1
*          daybookset daybookset1
*          cust cust1
*          bill bill1
*          ship ship1
*          site site1
*          lang lang1
*          eff_date  skip
*          print_gl_detail
*          errorSummary
*          incinv
*          incmemo
*          /* Hide the 'Consolidate Invoices' field if the legal document form code is Brazil (51). */
*          conso when not (available lgdc_ctrl and lgdc_form_code = "51")
*          inccor
*          prt_cor
*          print_invoice
*          l_prtInstBase
*       with frame a.
*    end. /* ELSE DO: IF batchrun AND AVAILABLE shc_ctrl */
**c1603* end   deleted code <<<<<<< */


/*c1603* start added code >>>>>> */
/*cy1024*/ display nbr nbr1 print_invoice with frame xa.

/*cy1047*/ cyb_pst_prt = yes.
/*c1329*/ uploop:
/*c1329*/ repeat:
/*cy1047*/    update 
/*cy1047*/    cyb_pst_prt
/*cy1047*/    with frame xa.
/*c1329* start added code */
              if not cyb_pst_prt
	      then do:
                 hide frame xa no-pause.
	         return.
	      end.
/*c1329* end   added code */

/*cy1002*/     update 
/*cy1002*/     xx_inv_type
/*cy1002*/     lvunpriced
/*cy1002*/     lvproofofdelivery
/*cy1002*/     with frame xa.
/*c1329*/     leave uploop.
/*c1329*/ end. /* uploop */
/*c1329* start added code */
          if keyfunction(lastkey) = "end-error"
	  then do:
              hide frame xa no-pause.
	      undo, leave.
	  end.
/*c1329* end   added code */
/*c1603* end   added code <<<<<< */

   if can-find(sbic_ctl where sbic_domain = global_domain
                          and sbic_active = yes)
   then do:
      if can-find(soc_ctrl where soc_domain = global_domain
                             and soc_ar     = no)
      then do:
 
         /* CANNOT EXECUTE INVOICE POST */
         {us/bbi/pxmsg.i &MSGNUM=6671 &ERRORLEVEL=4}
 
         /* SELF BILLING ENABLED. INTEGRATE WITH AR IN SO  */
         /* CTRL MUST BE 'YES'                             */
         {us/bbi/pxmsg.i &MSGNUM=6672 &ERRORLEVEL=1}
 
/*cy1024         next main. */
/*cy1024*/       leave main.
      end.  /* IF CAN-FIND(soc_ctrl) */
   end.  /* IF CAN-FIND(sbic_ctl) */
 
   /* VALIDATE OPEN GL PERIOD FOR PRIMARY ENTITY - GIVE
   * A WARNING IF THE PRIMARY ENTITY IS CLOSED. WE DON'T
   * WANT A HARD ERROR BECAUSE WHAT REALLY MATTERS IS
   * THE ENTITY SO_SITE OF EACH SO_SITE (WHICH IS VALIDATED
   * IN SOIVPST1.P. BUT WE AT LEAST WANT A WARNING MESSAGE
   * IN CASE, FOR EXAMPLE, THEY ACCIDENTALLY ENTERED
   * THE WRONG EFFECTIVE DATE */
 
   /* VALIDATE OPEN GL PERIOD FOR SPECIFIED ENTITY */
   {us/bbi/gprun.i ""gpglef1.p""
      "( input  ""SO"",
        input  glentity,
        input  eff_date,
        output gpglef_result,
        output gpglef_msg_nbr)" }
 
   if gpglef_result > 0 then do:
      /* IF PERIOD CLOSED THEN WARNING ONLY */
      if gpglef_result = 2 then do:
         {us/bbi/pxmsg.i &MSGNUM=3005 &ERRORLEVEL=2}
      end.
      /* OTHERWISE REGULAR ERROR MESSAGE */
      else do:
         {us/bbi/pxmsg.i &MSGNUM=gpglef_msg_nbr &ERRORLEVEL=4}
/*cy1024*/leave main.
         next-prompt eff_date with frame a.
         undo, retry.
      end.
   end.
   if not incinv and not incmemo then do:
      /* Selection criteria results in no data to report */
      {us/bbi/pxmsg.i &MSGNUM=1614 &ERRORLEVEL=3}
/*cy1024*/leave main.
      next-prompt incinv with frame a.
      undo, retry.
   end.
 
   if not batchrun
      and available shc_ctrl 
      and shc_check_ship_pending
   then do:
      update
         ldnbr
         ldnbr1
         ldshipfrom
         ldshipfrom1
      with frame ld-option.
      hide frame ld-option.
   end. /* IF NOT batchrun AND AVAILABLE shc_ctrl ... */
 
   bcdparm = "".
 
   {us/mf/mfquoter.i nbr     }
   {us/mf/mfquoter.i nbr1    }
   {us/mf/mfquoter.i shipdate     }
   {us/mf/mfquoter.i shipdate1    }
   {us/mf/mfquoter.i daybookset }
   {us/mf/mfquoter.i daybookset1 }
   {us/mf/mfquoter.i cust     }
   {us/mf/mfquoter.i cust1    }
   {us/mf/mfquoter.i bill     }
   {us/mf/mfquoter.i bill1    }
   {us/mf/mfquoter.i ship     }
   {us/mf/mfquoter.i ship1    }
   {us/mf/mfquoter.i site     }
   {us/mf/mfquoter.i site1    }
   {us/mf/mfquoter.i lang     }
   {us/mf/mfquoter.i lang1    }
   {us/mf/mfquoter.i eff_date }
   {us/mf/mfquoter.i print_gl_detail  }
   {us/mf/mfquoter.i errorSummary  }
   {us/mf/mfquoter.i incinv   }
   {us/mf/mfquoter.i incmemo  }
   {us/mf/mfquoter.i conso  }
   {us/mf/mfquoter.i inccor  }
   {us/mf/mfquoter.i prt_cor  }
   {us/mf/mfquoter.i print_invoice  }
   {us/mf/mfquoter.i l_prtInstBase }
   {us/mf/mfquoter.i ldnbr    }
   {us/mf/mfquoter.i ldnbr1   }
   {us/mf/mfquoter.i ldshipfrom    }
   {us/mf/mfquoter.i ldshipfrom1   }
 
   if eff_date  = ?  then eff_date   = today.
   if cust1     = "" then cust1      = hi_char.
   if bill1     = "" then bill1      = hi_char.
   if ship1     = "" then ship1      = hi_char.
   if nbr1      = "" then nbr1       = hi_char.
   if sls-psn1  = "" then sls-psn1   = hi_char.
   if slspsn1   = "" then slspsn1    = hi_char.
   if dom-ord1  = "" then dom-ord1   = hi_char.
   if shipdate  = ?  then shipdate   = low_date.
   if shipdate1 = ?  then shipdate1  = hi_date.
   if lang1     = "" then lang1      = hi_char.
   if daybookset1 = "" then daybookset1 = hi_char.
   if site1     = "" then site1      = hi_char.
   if ldnbr1    = "" then ldnbr1     = hi_char.
   if ldshipfrom1 = "" then ldshipfrom1 = hi_char.
 
   if print_invoice or prt_cor
   then do:
      pause 0.
      /* EXTRACT REPORT SELECTION PARAMETER VIA CHUI */
     /*grc338 {us/bbi/gprun.i ""soivpstp.p"" "(output table ttInvoicePrint)"} */
      {us/bbi/gprun.i ""xfivpstp.p"" "(output table ttInvoicePrint)"} /*grc338*/
 
      if    keyfunction(lastkey) = "ENDKEY"
         or keyfunction(lastkey) = "END-ERROR"
      then do:
         next-prompt
            print_invoice
         with frame a.
         undo main, retry main.
      end. /* IF KEYFUNCTION(LASTKEY) = "ENDKEY" OR ... */
   end.
 
   assign dev = dev1 when dev1 <> "".
 
   /* OUTPUT DESTINATION SELECTION */
/*c1333*    {us/gp/gpselout.i &printType = "printer" */
/*c1333*/   {us/xx/xxselout.i &printType = "printer"
         &printWidth = 132
         &pagedFlag = " "
         &stream = " "
         &appendToFile = " "
         &streamedOutputToTerminal = " "
         &withBatchOption = "yes"
         &displayStatementType = 1
         &withCancelMessage = "yes"
         &pageBottomMargin = 6
         &withEmail = "yes"
         &withWinprint = "yes"
         &defineVariables = "no"
         &withSecondOutput = "yes"}
 
   assign dev1 = dev.
 
   /* If we are running under dos then the second print file for  */
 
   empty temp-table ttisb.
 
   if insbase then do:
      {us/bbi/gpfildel.i &filename="global_userid + "".isb"""}
      output stream prt2  to value(global_userid + ".isb").
   end.
 
   gl_sum = not print_gl_detail.
 
   invoice-print:
   do transaction
      on error undo, leave:
 
      /* Temporarily assign the next invoice number using the SO Control   */
      /* table fields since we don't know the invoice total yet.           */
      /* The actual invoice number will be determined just before posting. */
      /* This temporary invoice number is needed. Do not remove this code. */
      if prt_cor then do:
         find first soc_ctrl
            where soc_ctrl.soc_domain = global_domain
         no-lock.
         assign
            next_inv_nbr = soc_crn_next - 1
            next_inv_pre = soc_crn_pre.
      end.
      else do:
         find first soc_ctrl
            where soc_ctrl.soc_domain = global_domain
         no-lock.
         assign
            next_inv_nbr = soc_inv - 1
            next_inv_pre = soc_inv_pre.
      end.
 
      /*RUN SELECTED FORMAT */
      undo_nota = no.
 
      {us/gp/gprfile.i}
      /* USED FOR BOM information */
      if false then do:
         {us/bbi/gprun.i ""sorp1001.p""}
         {us/bbi/gprun.i ""sorp1011.p""}
      end.
 
      /* UPDATE INVOICE & GENERATE INVOICE NUMBERS */
      if form_code <> "09"                            /*grc338*/
      then do :                                       /*grc338*/
      {us/bbi/gprun.i " ""sorp10"" + run_file + "".p"" "}
      end. /*if form_code <> "09"*/                   /*grc338*/
      else do :                                       /*grc338*/
         {us/bbi/gprun.i " ""xfrp10"" + run_file + "".p"" "} /*grc338*/
      end. /*else*/                                   /*grc338*/

      if not update_post
      then do:
         {us/bbi/mfreset.i}
         undo invoice-print, leave.
      end.
 
   end.
 
   /* runok SHOULD BE SET TO TRUE WHEN THERE ARE NO SALES ORDER FOR INVOICE */
   /* PRINT/POST BASED ON SELECTION CRITERIA IN BATCH MODE.  THE PROCESS    */
   /* IS COMPLETED SUCCESSFULLY WITH RUN STATUS: COMPLETE and PROCESS: YES  */
   if batchrun
      and not can-find( first so_mstr no-lock
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
         and so_compl_stat = "")
   then
      runok=true.
      if update_post then do:
 
         assign
            inv  = nbr
            inv1 = nbr1.
         so_mstr-loop:
 
         for each so_mstr no-lock
            where so_mstr.so_domain = global_domain
              and (so_inv_nbr >= inv and  so_inv_nbr <= inv1)
              and (so_to_inv = yes)
              and (so_ship_date >= shipdate and  so_ship_date <= shipdate1)
              and (so_cust >= cust and  so_cust <= cust1)
              and (so_bill >= bill and  so_bill <= bill1)
              and (so_ship >= ship and  so_ship <= ship1)
              and (so_site >= site and  so_site <= site1)
              and (so_lang >= lang and  so_lang <= lang1)
              and (so_slspsn[1] >= sls-psn and  so_slspsn[1] <= sls-psn1)
              and (so_daybookset >= daybookset and  so_daybookset <= daybookset1)
              and so_compl_stat = ""
         use-index so_invoice:

            {us/gp/gprunp.i "soldxr" "p" "isBrazilSSMwLD" "(output l_isBrazilSSM)"}

            if l_isBrazilSSM and
               (so_mstr.so_fsm_type = fsmro_c or so_mstr.so_fsm_type = scontract_c)
            then 
               next.

            for first lgdd_det no-lock
               where lgdd_domain = global_domain
                 and lgdd_order = so_nbr,
               first lgd_mstr no-lock
               where lgd_domain = global_domain
                 and lgd_type = yes
                 and ((lgd_posted = no and lgd_status = {&LD_CONFIRMED})
                 or  (lgd_posted = yes and lgd_status = {&LD_CANCELLED} and lgd_cancel_inv = ""))
                 and lgd_mstr.oid_lgd_mstr = lgdd_det.oid_lgd_mstr:
               if lgd_nbr < ldnbr
                  or lgd_nbr > ldnbr1
                  or lgd_shipfrom < ldshipfrom
                  or lgd_shipfrom > ldshipfrom1
               then
                  next so_mstr-loop.
            end.
 
            for each sod_det where sod_det.sod_domain = global_domain
                 and sod_nbr = so_nbr
                 and sod_compl_stat = ""
            no-lock:
 
               if so_sched
               then
                  l_po_schd_nbr = sod_contr_id.
               else
                  l_po_schd_nbr = "".
 
               if (sod_price * sod_qty_inv) <> 0
                  or sod_disc_pct           <> 0
               then do:
                  leave so_mstr-loop.
               end. /* THEN DO */
 
               if can-find(first absl_det
                  where absl_det.absl_domain  = global_domain
                    and absl_order            = sod_nbr
                    and absl_ord_line         = sod_line
                    and absl_abs_shipfrom     = sod_site
                    and absl_confirmed        = yes
                    and absl_inv_nbr          = so_inv_nbr
                    and absl_inv_post         = no
                    and absl_lc_amt           <> 0)
               then do:
                  leave so_mstr-loop.
               end. /* IF CAN-FIND(FIRST absl_det ... */
 
               for each sodlc_det
                  where sodlc_det.sodlc_domain = global_domain
                    and sodlc_order            = sod_nbr
                    and sodlc_ord_line         = sod_line
                    and sodlc_lc_amt           <> 0
               no-lock:
                  if    (sodlc_one_time      = no
                     or (sodlc_one_time      = yes
                     and sodlc_times_charged <= 1))
                     and sod_qty_inv         <> 0
                  then do:
 
                     leave so_mstr-loop.
 
                  end. /* IF (sodlc_one_time = no .... */
 
               end. /* FOR EACH sodlc_det */
 
               if can-find(first abscc_det
                  where abscc_det.abscc_domain  = global_domain
                    and abscc_order             = sod_nbr
                    and abscc_ord_line          = sod_line
                    and abscc_abs_shipfrom      = sod_site
                    and abscc_confirmed         = yes
                    and abscc_inv_nbr           = so_inv_nbr
                    and abscc_inv_post          = no
                    and abscc_cont_price        <> 0 )
               then do:
                  leave so_mstr-loop.
               end. /* IF CAN-FIND(FIRST abscc_det ... */
 
            end. /* FOR EACH sod_det */
 
            /* TO ACCUMULATE TAX AMOUNTS OF SHIPPED SO ONLY ('13'/'14'type) */
            for each tx2d_det
               where tx2d_det.tx2d_domain = global_domain
                 and (tx2d_ref            = so_nbr
                 and (tx2d_tr_type        = '13'
                  or  tx2d_tr_type        = '14'))
            no-lock:
               l_cur_tax_amt = l_cur_tax_amt + absolute(tx2d_cur_tax_amt).
            end. /* FOR EACH tx2d_det */
 
            if (absolute(so_trl1_amt) + absolute(so_trl2_amt) +
               absolute(so_trl3_amt) + l_cur_tax_amt) <> 0
            then do:
               leave so_mstr-loop.
            end. /* IF ABSOLUTE(so_trl1_amt) + ... */
 
         end. /* FOR EACH SO_MSTR */
 
         run p_getbatch.
 
         mainloop:
         do on error undo, leave:
 
            {us/bbi/mfphead.i}
 
            undo_all = no.
 
            {us/bbi/gprun.i ""gtextract.p""
               "(input        nbr,
                 input        nbr1,
                 input        inv_date,
                 input        shipdate,
                 input        shipdate1,
                 input        cust,
                 input        cust1,
                 input        bill,
                 input        bill1,
                 input        ship,
                 input        ship1,
                 input        site,
                 input        site1,
                 input        conso,
                 input        rcorder_ct,
                 input        rcorder_nbrs,
                 input        rcorder_nbr_list)" }
      
            if undo_all = TRUE
            then do:
                {us/bbi/mfreset.i}
                undo mainloop, leave mainloop.
            end.
            {us/bbi/gprun.i ""soivpst1.p""
               "(input ?,
                 input l_po_schd_nbr,
                 input errorSummary,
                 input no,     /* SHIPPER CONFIRMATION POSTS INVOICE - NO */
                 input """",   /* FILE NAME TO SAVE INVOICE POSTING ERRORS */
                 input l_prtInstBase, /* PRINT INSTALL BASE REPORT */
                 output table ttisb)"}
            if l_prtInstBase
            then
               run p_printISBOutput.
 
            if undo_all = TRUE
            then do:
                {us/bbi/mfreset.i}
                undo mainloop, leave mainloop.
            end.
 
            do transaction:
               find ba_mstr
                  where ba_mstr.ba_domain = global_domain
                    and ba_batch          = batch
                    and ba_module         = "SO"
               exclusive-lock no-error.
               if available ba_mstr then do:
                  ba_total  = ba_total + batch_tot.
                  ba_ctrl   = ba_total.
                  ba_userid = global_userid.
                  ba_date   = today.
                  batch_tot = 0.
                  ba_status = " ". /*balanced*/
               end.
            end.
 
            /* CUSTOMIZED SECTION FOR VERTEX BEGIN */
            if l_vtx_message
            then do:
 
               /* DISPLAY A MESSAGE IN THE AUDIT TRAIL */
 
               /* API FUNCTION FAILURE. VERTEX REGISTER DB DID NOT UPDATE. */
               {us/bbi/pxmsg.i &MSGNUM=8882 &ERRORLEVEL=1}
 
               /* VERIFY THE DATA IN THE VERTEX REGISTER. */
               {us/bbi/pxmsg.i &MSGNUM=8883 &ERRORLEVEL=1}
 
            end. /* IF l_vtx_message */
            /*  CUSTOMIZED SECTION FOR VERTEX ENDS */
 
            /* REPORT TRAILER */
            /* {mfrtrail.i} */
 
            for each IntraStat:
               {us/bbi/gprun.i ""iehrtrmt.p"" "(input IntraStat.StatID)"}
            end.
 
            {us/bbi/mfreset.i}
 
            if print_invoice or prt_cor
            then do:
 
               if     not batchrun
                  and {us/bbi/gpiswrap.i} then do:
                  /* For Desktop the "page" mechanism doesn't expect to  */
                  /* get two generated reports in a row.  However, if    */
                  /* there is a screen in between them it will function. */
                  /* Press 'Next' to print invoices */
                  /*grc338 comment begin
                  display msgText with frame aa no-labels.
                  {us/gp/gpwait.i}  /* Does a "wait-for" */
                  grc338 comment end*/
               end.
 
               /* COPY PRINT PARAMS TO SHARED VARIABLE */
               run mapInvoicePrintParmsToSharedVariables.
               /* PRINT INVOICES */
               if form_code <> "09"          /*grc338*/
               and form_code <> "9"          /*grc338*/
               then do :                     /*grc338*/
               {us/bbi/gprun.i ""soivpspr.p""}
               end. /*if form_code <> "09"*/ /*grc338*/
               else do :                     /*grc338*/
/*c1398*/         {us/bbi/gprun.i ""xxfivps01.p""}
/*c1398*          {us/bbi/gprun.i ""xfivpspr.p""}   /*eb3sp5*/ */
               end. /*else*/                 /*grc338*/
            end.
            hide message no-pause.
            {us/bbi/pxmsg.i &MSGNUM=1107 &ERRORLEVEL=1} /* Process complete */
 
         end. /* mainloop */
      end. /* if update_post */
 
   /* Reset second print file */
   if insbase then do:
      put stream prt2 " ".
      output stream prt2 close.
   end.
/*cy1024a*/ hide all no-pause.

   {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}

end.

/* CUSTOMIZED SECTION FOR VERTEX BEGIN */
/* CHECK IF VERTEX REGISTER DBF WAS OPENED */
if l_vq_reg_db_open
then do:
   {us/bbi/gprun.i ""vqregcls.p""}
end. /* IF l_vq_reg_db_open */
/*  CUSTOMIZED SECTION FOR VERTEX ENDS */
 
PROCEDURE p_getbatch:
/*--------------------------------------------------------------------
Purpose: Get next AR batch number
---------------------------------------------------------------------*/
 
   if can-find(first soc_ctrl
      where soc_domain = global_domain
        and soc_ar     = yes)
   then do:
 
      /*Find or create batch number*/
      {us/bbi/gprun.i ""gpgetbat.p""
         "(input batch,
           input ""SO"",
           input ""I"",
           input 0,
           output vba_recno,
           output batch)"}
 
   end. /* IF CAN-FIND(FIRST soc_ctrl.. */
END PROCEDURE. /* p_getbatch */
 
PROCEDURE resetSharedVars:
/*---------------------------------------------------------------
    Purpose: Initialise selection variables to default values.
 Parameters: <input>
             <output>
      Notes:
---------------------------------------------------------------*/
   assign
      expcount      = 999
      pageno        = 0
      update_post   = no
      oldcurr       = "".
 
   if shipdate    = low_date then shipdate      = ?.
   if shipdate1   = hi_date  then shipdate1     = ?.
   if eff_date    = ?        then eff_date      = today.
   if inv1        = hi_char  then inv1          = "".
   if cust1       = hi_char  then cust1         = "".
   if bill1       = hi_char  then bill1         = "".
   if ship1       = hi_char  then ship1         = "".
   if form_code   = ""       then form_code     = "01".
   if nbr1        = hi_char  then nbr1          = "".
   if sls-psn1    = hi_char  then sls-psn1      = "".
   if site1       = hi_char  then site1         = "".
   if lang1       = hi_char  then lang1         = "".
   if dom-ord1    = hi_char  then dom-ord1      = "".
   if daybookset1 = hi_char  then daybookset1   = "".
   if ldnbr1      = hi_char  then ldnbr1        = "".
   if ldshipfrom1 = hi_char  then ldshipfrom1   = "".
 
END PROCEDURE.
 
PROCEDURE mapInvoicePrintParmsToSharedVariables:
/*---------------------------------------------------------------
    Purpose: Copies field values from ttInvoicePrint
             to shared variables used by the sub procedures.
 Parameters: <input>   - none
             <output>  - none
      Notes:
---------------------------------------------------------------*/
 
   for first ttInvoicePrint:
      run setPrint_lotserials(lPrint_lotserials).
      run setPrint_options(lPrint_options).
      run setOverride_print_hist(lOverride_print_hist).
      run setComp_addr(cComp_addr).
      run setDisc_det(cDisc_det).
      run setDisc_sum(cDisc_sum).
      run setForm_code(cForm_code).
      run setInv_only(lInv_only).
      run setCall-detail(lCall-detail).
      run setUpdate_invoice(lUpdate_invoice).
      run setProg_name(cProg_name).
      run setMsg(cMsg).
      run setIh_recno(rIh_recno).
      run setReport_framework(lReport_Framework).
      run setCompany( cCompany[1],
                      cCompany[2],
                      cCompany[3],
                      cCompany[4],
                      cCompany[5],
                      cCompany[6]).
 
      run setAddr( cAddr[1],
                   cAddr[2],
                   cAddr[3],
                   cAddr[4],
                   cAddr[5],
                   cAddr[6]).
      /*grc338 add begin*/
      if form_code = "09" or form_code = "9"
      then do :
         find ad_mstr no-lock
            where ad_domain = global_domain
             and  ad_addr   = comp_addr
         no-error.
         assign
            company_city  = ""
            company_state = ""
            company_zip   = ""
            addr[5]       = ""
            company[5]    = "".
         if available ad_mstr
         then do :
            {us/xf/xfaddr.i company}
            {us/xf/xfgetabn.i &abn=covatreg}
         end.
      end.
      /*grc338 add end*/
   end.
   /* Set disc_det_key and disc_sum_key values */
   find first lngd_det
      where lngd_dataset = program_name
        and lngd_field   = "det_disc_prnt"
        and lngd_lang    = global_user_lang
        and lngd_translation = disc_det
   no-lock no-error.
 
   if available lngd_det then
      disc_det_key = lngd_key1.
   else
      disc_det_key = "1".
 
   find first lngd_det
      where lngd_dataset = program_name
        and lngd_field   = "det_disc_prnt"
        and lngd_lang    = global_user_lang
        and lngd_translation = disc_sum
   no-lock no-error.
 
   if available lngd_det then
      disc_sum_key = lngd_key1.
   else
      disc_sum_key = "1".
 
 
END PROCEDURE.
 
PROCEDURE p_printISBOutput:
 
   if not can-find(first ttisb) 
   then
      return.
 
   /* RESET VALUES */
   assign 
      expcount = 999
      pageno   = 0.
 
   page.
 
   if (expcount + 4 > page-size)
   and page-size <>  0 
   then do:
      page.
 
      put {us/bbi/gplblfmt.i 
             &FUNC=getTermLabel(""INSTALLED_BASE_POST_REPORT"",35)}  at 20
         skip(1).
 
      put 
         getTermLabel("ORDER",8)     format "x(9)"
         getTermLabel("LINE",5)      format "x(6)"
         getTermLabel("CUSTOMER",8)  format "x(9)"
         getTermLabel("END_USER",8)  format "x(9)"
         getTermLabel("LEVEL",8)     format "x(9)"
         getTermLabel("ITEM",18)     format "x(19)"
         getTermLabel("SERIAL",18)   format "x(19)"
         getTermLabel("REFERENCE",8) format "x(9)"
         getTermLabel("DESCRIPTION",12) format "X(12)"
         skip
         "------------------------------------------------------------"
         "---------"
         "------------------------------------------------"
         skip.
 
      expcount = 6.
   end. /* IF (expcount + 4 > page-size) */
 
   for each ttisb 
   no-lock:
      put
         ttisb_so      format "x(8)"      " "
         ttisb_line    format "zzz"       "   "
         ttisb_cmaddr  format "x(8)"      " "
         ttisb_euaddr  format "x(8)"      " "
         ttisb_level   format "x(8)"      " "
         ttisb_part    format "x(18)"     " "
         ttisb_serial  format "x(18)"     " "
         ttisb_no      format "x(8)"      " "
         ttisb_desc format "x(" + string(length(ttisb_desc)) + ")"  " "
         ttisb_newser
      skip.
   end. /* FOR EACH ttisb */
END PROCEDURE.
