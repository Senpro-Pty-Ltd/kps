/* xxpopomtc.p - PURCHASE ORDER MAINTENANCE LINE ITEMS                  */
/* popomtc.p - PURCHASE ORDER MAINTENANCE LINE ITEMS                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxpopomtc.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* REVISION: 1.0      LAST MODIFIED: 04/29/86   BY: pml       */
/* REVISION: 4.0      LAST MODIFIED: 12/31/87   BY: FLM *A108**/
/* REVISION: 4.0      LAST MODIFIED: 12/27/87   BY: pml *Axxx**/
/* REVISION: 4.0      LAST MODIFIED: 06/22/88   BY: flm *A294**/
/* REVISION: 4.0      LAST MODIFIED: 09/02/88   BY: flm *A419**/
/* REVISION: 4.0      LAST MODIFIED: 03/24/89   BY: flm *A685**/
/* REVISION: 4.0      LAST MODIFIED: 02/27/90   BY: emb *B591**/
/* REVISION: 6.0      LAST MODIFIED: 07/06/90   BY: EMB *D040**/
/* REVISION: 6.0      LAST MODIFIED: 11/15/91   BY: RAM *D952**/
/* REVISION: 7.3      LAST MODIFIED: 09/29/92   BY: tjs *G028**/
/* REVISION: 7.4      LAST MODIFIED: 10/31/93   BY: afs *H221**/
/* REVISION: 7.4      LAST MODIFIED: 12/22/93   BY: tjs *GI29**/
/* REVISION: 7.4      LAST MODIFIED: 03/17/95   BY: smp *F0N5**/
/* REVISION: 7.4      LAST MODIFIED: 07/19/95   BY: rxm *G0QG**/
/* REVISION: 7.4      LAST MODIFIED: 10/18/95   BY: dxk *G0XK**/
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane      */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan     */
/* REVISION: 9.0      LAST MODIFIED: 04/16/99   BY: *J2DG* Reetu Kappor   */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Patti Gaultney */
/* REVISION: 9.1      LAST MODIFIED: 06/08/00   BY: *M0ND* Reetu Kappor   */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KQ* Mark Brown     */
/* REVISION: 9.1      LAST MODIFIED: 10/04/00   BY: *M0SQ* Santosh Rao    */
/* REVISION: 9.1      LAST MODIFIED: 11/08/00   BY: *N0TN* Jean Miller    */
/* REVISION: 9.1      LAST MODIFIED: 11/14/00   BY: *L15N* Rajesh Kini    */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.21      BY: Samir Bavkar           DATE: 12/12/01  ECO: *P013* */
/* Revision: 1.22      BY: Deepak Rao             DATE: 02/11/03  ECO: *N274* */
/* Revision: 1.24      BY: Paul Donnelly (SB)     DATE: 06/28/03  ECO: *Q00J* */
/* Revision: 1.25      BY: Nishit V               DATE: 06/07/05  ECO: *P3NR* */
/* Revision: 1.26      BY: B. Gates               DATE: 08/03/05  ECO: *P3WP* */
/* Revision: 1.27      BY: Shilpa Kamath          DATE: 11/03/05  ECO: *R02B* */
/* Revision: 1.31      BY: Jean Miller            DATE: 06/15/08  ECO: *R0V6* */
/* Revision: 1.32      BY: Amit Kumar             DATE: 06/12/09  ECO: *Q30J* */
/* $Revision: 1.2 $   BY: John Corda             DATE: 01/11/10  ECO: *Q2J7* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/px/pxmaint.i}

define shared variable po_recno             as   recid.
define shared variable pod_recno            as   recid.
define shared variable old_pod_status       like pod_status.
define shared variable old_type             like pod_type.
define shared variable st_qty               like pod_qty_ord.
define shared variable st_um                like pod_um.
define shared variable old_um               like pod_um.
define shared variable blanket              like mfc_logical.
define shared variable del-yn           like mfc_logical.
define shared variable old_qty_ord      like pod_qty_ord.

define        variable openqty              like mrp_qty      no-undo.
define        variable qty_ord              like pod_qty_ord  no-undo.
define        variable bl_qty_chg           like pod_rel_qty  no-undo.
define        variable line_db              like si_db        no-undo.
define        variable l_qty_req            like sob_qty_req  no-undo.
define        variable l_delay              like mfc_logical  no-undo.
define        variable l_pod_qty_ord        like pod_qty_ord  no-undo.
define        variable l_pod_pur_cost       like pod_pur_cost no-undo.
define        variable l_pod_site           like pod_site     no-undo.
define        variable site_to_use          like pod_site     no-undo.
define        variable requisitionUM        as   character    no-undo.
define        variable crossReferenceOk     as   logical      no-undo.

define buffer poddet for pod_det.

/*CHECK IF USER IS IN VIEWER MODE */
{us/gp/gpvwckhd.i}

find po_mstr where recid(po_mstr) = po_recno exclusive-lock.

/* ADDED POD_SOD_LINE IN THE FIELD LIST FOR POD_DET */
for first pod_det where recid(pod_det) = pod_recno
no-lock: end.

for first si_mstr where si_mstr.si_domain = global_domain
/*q9006*    and si_site = pod_site */
/*q9006*/   and si_site = po_site
no-lock: end.

line_db = si_db.

/* WRITE ORD-PO TO TR_HIST */
/* SUPPRESS THIS CODE IF INVOKED IN VIEWER MODE */
if not isViewer and po_stat <> "c" and po_stat <> "x" and
   pod_status <> "c" and pod_status <> "x" then do:

   l_pod_pur_cost = pod_pur_cost.

   if global_db = pod_po_db then do:
      {us/mf/mfpotr01.i "ADD"}
   end.
   if global_db = line_db then do:
      {us/mf/mfpotr02.i "ADD"}
   end.
end.

/* CALCULATING MATERIAL COST (EMT PO) FOR ATO/KIT ITEMS TO */
/* REFLECT ENTIRE CONFIGURATION COST IN ORD-PO TRANSACTION */
if po_is_btb and
   can-find (first pt_mstr where pt_mstr.pt_domain = global_domain
                             and pt_part    = pod_part
                             and pt_pm_code = "c")
then do:

   for first sod_det where sod_det.sod_domain = global_domain
      and sod_nbr  = po_so_nbr
      and sod_line = pod_sod_line
      and sod_compl_stat = ""
   no-lock: end.

   if available sod_det then do:

      for each sob_det where sob_det.sob_domain = global_domain
         and sob_nbr  = sod_nbr
         and sob_line = sod_line
      no-lock
      break by sob_part:

         if first-of(sob_part) then
            l_qty_req = 0.

         if substring(sob_serial,15,1) = "o" then
            l_qty_req = l_qty_req + sob_qty_req.

         if last-of(sob_part) and
            l_qty_req <> 0
         then do:

            {us/bbi/gprun.i ""gpsct05.p""
               "(input sob_part, sob_site, input 1,
                 output glxcst, output curcst)"}

            glxcst = glxcst * (sob_qty_req / sod_qty_ord).

            if available tr_hist then
               tr_mtl_std = tr_mtl_std + glxcst.

         end. /* IF LAST-OF */

      end. /* FOR EACH SOB_DET */

   end. /* IF AVAILABLE SOD_DET */

end. /* IF PO_IS_BTB AND CAN-FIND(FIRST PT_MSTR ... */

/* DELETE IF CLOSING OR CANCELLING AN OPEN INVENTORY LINE ITEM    */
/* OR IF CHANGING AN OPEN INVENTORY ITEM TO MEMO OR SUBCONTRACTED */
if global_db = line_db then do:
   if ((pod_status = "c" or pod_status = "x" ) and
      old_pod_status <> "c" and old_pod_status <> "x"
      and old_type = "" )
      or ((old_pod_status <> "c" and old_pod_status <> "x" ) and
      old_type = "" and pod_type <> "" )
   then do:
      /* MRP WORKFILE */
      {us/mf/mfmrw.i "pod_det" pod_part pod_nbr string(pod_line) """" ?
         pod_due_date "0" "SUPPLY" PURCHASE_ORDER pod_site}
   end.
end.

/* ADJUST BLANKET PO WHEN CANCELING PO CREATED BY BLANKET */
/* ADJUSTMENT NEEDS TO OCCUR IN BOTH CENTRAL AND REMOTE DBS */
if old_pod_status = "" and pod_status = "x"
   and not blanket
then do:
   {us/po/pobladj.i}

   if ({us/px/pxfunct.i &FUNCTION='isGRSInUse' &PROGRAM='rqgrsxr.p'})
      and pod_req_nbr <> ""
   then do:
      {us/px/pxrun.i &PROC='updateRequisitionCrossReference' &PROGRAM='rqgrsxr1.p'
         &PARAM="(input  pod_site,
                  input  pod_req_nbr,
                  input  pod_req_line,
                  input  pod_nbr,
                  input  pod_line,
                  input  pod_qty_rcvd,
                  input  pod_um,
                  output requisitionUM,
                  output crossReferenceOk)"}
   end. /* if ({us/px/pxfunct.i &FUNCTION='isGRSInUse' ... */
end.

/* ADJUST BLANKET PO WHEN UN-CANCELING PO CREATED BY BLANKET */
if old_pod_status = "x" and pod_status = ""
   and not blanket
then do:
   {us/po/pobladj.i &incr="yes"}

   if ({us/px/pxfunct.i &FUNCTION='isGRSInUse' &PROGRAM='rqgrsxr.p'})
      and pod_req_nbr <> ""
   then do:
      {us/px/pxrun.i &PROC='updateRequisitionCrossReference' &PROGRAM='rqgrsxr1.p'
         &PARAM="(input  pod_site,
                  input  pod_req_nbr,
                  input  pod_req_line,
                  input  pod_nbr,
                  input  pod_line,
                  input  pod_qty_ord,
                  input  pod_um,
                  output requisitionUM,
                  output crossReferenceOk)"}
   end. /* if ({us/px/pxfunct.i &FUNCTION='isGRSInUse' ... */
end.

/* ADJUST THE BLANKET ORDER CUMULATIVE RELEASED QUANTITY WHEN */
/* THE ORDER QUANTITY ON THE RELEASED PO LINE IS UPDATED.     */
if pod_status = "" and not blanket
   and old_qty_ord <> pod_qty_ord then do:
   {us/po/pobladj.i &incr = "ADJ"
              &old_qty_ord = old_qty_ord}
end.

/* IF LINE IS NOT CLOSED OR CANCELLED FOR INVENTORY LINE ITEMS */
if global_db = line_db then do:

   if po_stat <> "c" and po_stat <> "x"
      and pod_status <> "c" and pod_status <> "x"
      and pod_type = ""
   then do:

      if pod_qty_ord >= 0 then
         openqty = max(pod_qty_ord - pod_qty_rcvd,0) * pod_um_conv.
      else
         openqty = min(pod_qty_ord - pod_qty_rcvd,0) * pod_um_conv.

      for first loc_mstr where loc_mstr.loc_domain = global_domain
         and loc_site = pod_site
         and loc_loc  = pod_loc
      no-lock: end.

      if available loc_mstr then
         for first is_mstr where is_mstr.is_domain = global_domain
            and is_status = loc_status
         no-lock: end.
      else do:
         for first si_mstr where si_mstr.si_domain = global_domain
/*q9006*             and si_site = pod_site */
/*q9006*/            and si_site = po_site
         no-lock: end.
         if available si_mstr then
            for first is_mstr where is_mstr.is_domain = global_domain
               and is_status = si_status
            no-lock: end.
      end. /* ELSE DO */

      /* FOR RTS RETURN LINES, ZERO REPLENISHMENT SHOULD SHOW IN MRP */
      if pod_rma_type = "O"
         and available is_mstr
         and not is_nettable
      then
         openqty = 0.

      /* Changed pre-processor to Term */
      {us/mf/mfmrw.i "pod_det" pod_part pod_nbr string(pod_line) """"
         ? pod_due_date openqty "SUPPLY" PURCHASE_ORDER pod_site}

   end.

end.

if global_db = pod_po_db then
close-po:
do on error undo, leave:
   if po_stat <> "c" then do:
      for each pod_det where pod_det.pod_domain = global_domain
         and pod_nbr = po_nbr
      no-lock:
         if pod_status <> "c" and pod_status <> "x" then
            leave close-po.
      end. /* FOR EACH POD_DET */
      assign
         po_stat = "c"
         po_cls_date = today.
   end.
end.
