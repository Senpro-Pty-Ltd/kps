/* xxsosomt02.i - SALES ORDER MAINTENANCE - SHARED FRAME B                */
/* sosomt02.i - SALES ORDER MAINTENANCE - SHARED FRAME B                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsosomt02.i,v 1.2 2018/03/13 17:10:01 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 05/25/93   BY: afs *GB31**/
/* REVISION: 7.4      LAST MODIFIED: 09/22/93   BY: cdt *H086**/
/* REVISION: 7.4      LAST MODIFIED: 10/19/93   BY: cdt *H184**/
/* REVISION: 7.4      LAST MODIFIED: 09/22/94   BY: jpm *GM78**/
/* REVISION: 7.5      LAST MODIFIED: 02/17/95   BY: dpm *J044**/
/* REVISION: 7.5      LAST MODIFIED: 03/10/95   BY: DAH *J042**/
/* REVISION: 8.5      LAST MODIFIED: 08/27/96   BY: *G2D5* Suresh Nayak */
/* REVISION: 8.5      LAST MODIFIED: 11/19/96   BY: *J190* Sue Poland   */
/* REVISION: 8.6      LAST MODIFIED: 06/03/97   BY: *K0DQ* Taek-Soo Chang */

/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan     */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan     */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KN* myb              */
/* REVISION: 9.1      LAST MODIFIED: 10/16/00 BY: *N0WB* BalbeerS Rajput  */
/* Old ECO marker removed, but no ECO header exists *F0PN*               */
/* Revision: 1.14        BY: Russ Witt           DATE: 09/21/01  ECO: *P01H* */
/* Revision: 1.17        BY: Patrick Rowan       DATE: 03/14/02  ECO: *P00G* */
/* Revision: 1.20        BY: Ed van de Gevel     DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.22        BY: Jean Miller         DATE: 09/24/07  ECO: *R0C5* */
/* Revision: 1.24        BY: Arun Kumar          DATE: 10/01/07  ECO: *R0C6* */
/* Revision: 1.29        BY: Sameer Lodha        DATE: 09/26/07  ECO: *R0J5* */
/* $Revision: 1.2 $ BY: Dipanshu Talwar   DATE: 04/03/09  ECO: *Q29P* */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

form
   space(1)
   so_nbr label "Order"
   so_cust
   so_bill
   so_ship
with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
   so_ord_date     colon 15
   line_pricing    colon 38
   confirm         colon 58 so_conf_date no-label

   so_req_date     colon 15
   so_pr_list      colon 38
   so_curr         colon 58 so_lang

   promise_date    colon 15
   so_daybookset   colon 38
   so_taxable      colon 58 so_taxc no-label so_tax_date to 77 no-label

   so_due_date     colon 15
   so_channel      colon 38
   so_fix_pr       colon 68

   perform_date    colon 15
   so_project      colon 38
   so_cr_terms     colon 68

   so_pricing_dt   colon 15
/*cy1020*   inv_org         colon 38 label "Orig Invoice" */
/*cy1020*/ so__log01  colon 38 label "Priced Inv"
/*cy1020*/ so__chr01           format "x(8)" label "Loc"
   so_site         colon 68

   so_po           colon 15
   socrt_int       colon 68

   so_rmks         colon 15
   reprice         colon 73
with frame b side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

form
   inv_org       colon 20 label "Original Invoice"
   org_nbr       colon 20 label "Org. Order"       skip
   cil_cor_rsn   colon 20 label "Correction Reason"  format "x(10)" skip
with frame f_cor_inv centered overlay
side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame f_cor_inv:handle).


form
   so_slspsn[1]    colon 15
   so_fr_list      colon 38 so_weight_um no-label

   so_consignment  colon 69
   mult_slspsn     colon 15 label "Multiple"
   so_fr_min_wt    colon 38
   consume         colon 69

   so_comm_pct[1]  colon 15
   so_fr_terms     colon 38
   so-detail-all   colon 69

   calc_fr         colon 38

   all_days        colon 69 label "Allocate Days"
   disp_fr         colon 38
   socmmts         colon 69
   so_userid       colon 38 label "Entered By"
   impexp          colon 69 label "Imp/Exp"
with frame b1 overlay side-labels column 1 row 12 width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b1:handle).
