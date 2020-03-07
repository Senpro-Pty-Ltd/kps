/* xxsosomtdi.i - Sales Order Maintenance Display header frame b             */
/* sosomtdi.i - Sales Order Maintenance Display header frame b               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsosomtdi.i,v 1.2 2018/03/13 17:10:01 gbg Exp $: */
/*V8:ConvertMode=Maintenance                                                 */
/* REVISION: 7.3      LAST MODIFIED: 09/14/92   BY: tjs *G035*               */
/* REVISION: 7.4      LAST MODIFIED: 09/22/93   BY: cdt *H086*               */
/* REVISION: 7.4      LAST MODIFIED: 10/19/93   BY: cdt *H184*               */
/* REVISION: 7.4      LAST MODIFIED: 06/29/94   BY: qzl *H419*               */
/* REVISION: 7.5      LAST MODIFIED: 03/10/95   BY: DAH *J042*               */
/* REVISION: 8.5      LAST MODIFIED: 10/02/96   BY: *J15C* Markus Barone     */
/* REVISION: 8.6      LAST MODIFIED: 06/03/97   BY: *K0DQ* Taek-Soo Chang    */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KN* myb                 */
/* REVISION: 9.1      LAST MODIFIED: 10/16/00 BY: *N0WB* Mudit Mehta         */
/* REVISION: 9.1      LAST MODIFIED: 29 JUN 2001 BY: *N0ZX* Ed van de Gevel */
/* Old ECO marker removed, but no ECO header exists *F0PN*                   */
/* Revision: 1.15       BY: Russ Witt            DATE: 09/21/01  ECO: *P01H* */
/* Revision: 1.17       BY: Ed van de Gevel      DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.18        BY: Jean Miller          DATE: 09/24/07  ECO: *R0C5* */
/* Revision: 1.20        BY: Arun Kumar           DATE: 10/01/07  ECO: *R0C6* */
/* $Revision: 1.2 $    BY: Sameer Lodha         DATE: 09/26/07  ECO: *R0J5*  */
/* CYB                   LAST MODIFIED: 14-NOV-2012 BY: gbg *cy1020*  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

if new_order then
   socmmts = if this-is-rma then
                rmc_hcmmts
             else
                soc_hcmmts.
else
   socmmts = (so_cmtindx <> 0).

if not new_order then
   socrt_int = so__qad02.

find first cil_mstr where cil_domain = global_domain and
                          cil_cor_so_nbr = so_nbr
no-lock no-error.

assign inv_org = if available cil_mstr then
                    cil_prev_inv
                 else "".

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

display
   so_ord_date
   line_pricing
   confirm
   so_conf_date
   so_req_date
   so_pr_list
   so_curr
   so_lang
   promise_date
   perform_date
   so_taxable
   so_taxc
   so_tax_date
   so_due_date
   so_channel
   so_fix_pr
   so_pricing_dt
   so_project
   so_cr_terms
   so_site
   so_po
   socrt_int
   so_rmks
   reprice
/*cy1020*/ so__chr01
/*cy1020*   inv_org */
   so_daybookset
with frame b.
