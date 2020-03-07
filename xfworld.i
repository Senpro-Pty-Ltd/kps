/* xfworld.i - RELEASE WORK ORDERS Print Routing                           */
/* mfworld.i - RELEASE WORK ORDERS Print Routing                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfworld.i,v 1.2 2018/03/13 17:09:55 gbg Exp $: */

/* REVISION: 1.0       LAST EDIT: 05/06/86      MODIFIED BY: EMB           */
/* REVISION: 1.0       LAST EDIT: 02/05/87      MODIFIED BY: EMB *35*      */
/* REVISION: 2.0       LAST EDIT: 09/04/87      MODIFIED BY: EMB *A88*     */
/* REVISION: 2.1       LAST EDIT: 09/11/87      MODIFIED BY: WUG *A94*     */
/* REVISION: 4.0       LAST EDIT: 01/28/88      MODIFIED BY: pml *A119*    */
/* REVISION: 4.0       LAST EDIT: 02/21/88      MODIFYED BY: WUG *A194*    */
/* REVISION: 4.0       LAST EDIT: 04/26/88      MODIFYED BY: emb           */
/* REVISION: 4.0       LAST EDIT: 06/08/88      MODIFIED BY: WUG *A269*    */
/* REVISION: 4.0       LAST EDIT: 07/15/88      MODIFIED BY: WUG *A324*    */
/* REVISION: 4.0       LAST EDIT: 07/20/88      MODIFIED BY: flm *A340*    */
/* REVISION: 4.0       LAST EDIT: 07/25/88      MODIFIED BY: WUG *A363*    */
/* REVISION: 4.0       LAST EDIT: 09/15/88      MODIFIED BY: WUG *A440*    */
/* REVISION: 5.0       LAST EDIT: 03/29/90      MODIFIED BY: RAM *B639*    */
/* REVISION: 6.0       LAST EDIT: 07/03/90      MODIFIED BY: WUG *D043*    */
/* REVISION: 7.2       LAST EDIT: 06/14/93      MODIFIED BY: pma *GC04*    */
/* REVISION: 7.4       LAST EDIT: 01/12/94      MODIFIED BY: qzl *H276*    */
/* REVISION: 7.5       LAST EDIT: 10/14/94      MODIFIED BY: taf *J035*    */
/* REVISION: 7.2       LAST EDIT: 11/23/94      MODIFIED BY: qzl *FU02*    */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane       */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan      */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan      */
/* REVISION: 8.6E     LAST MODIFIED: 10/28/98   BY: *J330* Mugdha Tambe    */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 07/18/00   BY: *N0GB* Mudit Mehta     */
/* REVISION: 9.1      LAST MODIFIED: 08/23/00   BY: *N0ND* Mark Brown      */
/* Old ECO marker removed, but no ECO header exists *F0PN*                 */
/* Revision: 1.17  BY: Katie Hilbert DATE: 04/01/01 ECO: *P008* */
/* Revision: 1.19  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00G* */
/* $Revision: 1.2 $ BY: Alex Joy DATE: 07/07/09 ECO: *Q342* */
/* REVISION: eb3sp5  CREATED: 02/11/10  BY: Shridhar M  *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/*V8:ConvertMode=Report                                                       */
/* ********** Begin Translatable Strings Definitions ********* */

&SCOPED-DEFINE mfworld_i_1 "Work Order Due Date"
/* MaxLen: Comment: */

&SCOPED-DEFINE mfworld_i_2 "Rev"
/* MaxLen: Comment: */

&SCOPED-DEFINE mfworld_i_4 "Setup Time!Run Time"
/* MaxLen: Comment: */

&SCOPED-DEFINE mfworld_i_5 "Tooling!Supplier"
/* MaxLen: Comment: */

&SCOPED-DEFINE mfworld_i_6 " By"
/* MaxLen: Comment: */

&SCOPED-DEFINE mfworld_i_8 "Actual"
/* MaxLen: Comment: */

/* ********** End Translatable Strings Definitions ********* */

define variable wr_ctr_mch like wr_wkctr format "x(24)".
define variable temp1 as character format "x(6)".
define variable temp2 as character format "x(4)".
define variable commentindex like cmt_indx.

define variable l_yield like pt_yield_pct initial 100.

/*eB3sp5*/   {us/xf/xfworlbv.i}

form
   skip (1)
   wo_nbr         colon 13
   wo_lot         colon 13
   wo_batch       colon 13
   wo_part        colon 13
   par_rev        colon 40 label {&mfworld_i_2}
   wo_due_date    colon 68 label {&mfworld_i_1}
   wo_des         no-label format "x(49)" at 15
   wo_rmks        colon 13
   wo_so_job      colon 68
   wo_qty         colon 13
   wo_um          no-label
   deliv          colon 68 skip (1)
with frame routing page-top side-labels no-attr-space width 80 title
   (getFrameTitle("WORK_ORDER_ROUTING",24)).

/* SET EXTERNAL LABELS */
setFrameLabels(frame routing:handle).

/* Explicitly define frame d */
form
   wr_op
   wr_ctr_mch
   wr_std_op
   wr_tool column-label {&mfworld_i_5}
   wr_run  column-label {&mfworld_i_4}
   temp1   column-label {&mfworld_i_8}
   temp2   column-label {&mfworld_i_6}
with frame d down.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

find pt_mstr  where pt_mstr.pt_domain = global_domain and  pt_part = wo_part
no-lock no-error.
assign
 /*eB3sp5*/ par_draw = ""   
   wo_des = ""
   wo_um = ""
   par_rev = "".
if available pt_mstr then do:
   assign
 /*eB3sp5*/   par_draw = pt_draw
      wo_des = pt_desc1
      wo_des = wo_des + " " + pt_desc2
      wo_um = pt_um.

   /*  REVISION NUMBER IS DISPLAYED FROM PTP_DET TO GET LATEST  */
   /*  MODIFIED REVISION NUMBER                                 */

   for first ptp_det
          where ptp_det.ptp_domain = global_domain and  ptp_part = wo_part
         and   ptp_site = wo_site
         no-lock:
   end. /* FOR FIRST PTP_DET */

   if available ptp_det then assign par_rev = ptp_rev .
   else assign par_rev = pt_rev .

end.

for each wr_route  where wr_route.wr_domain = global_domain and  wr_lot =
wo_lot break by wr_lot by wr_op
   with frame d:
   routingprinted = yes.

   if first-of (wr_lot) and barcode then do:
      {us/mf/mfprtbar.i wr_lot}
      {us/mf/mfprtbar.i wr_lot}
      /*eB3sp5*/      {us/xf/xfworldm7.i}
   end.
   if first-of (wr_lot) then do:
      display
         wo_nbr
         wo_lot
         wo_batch
         wo_part
         wo_due_date
         par_rev
         wo_des
         wo_rmks
         wo_so_job
         wo_qty
         wo_um
         deliv
      with frame routing.
   /*eB3sp5*/      run print_header in this-procedure.
      /*DISPLAY COMMENTS */
   /*93sp12.1   {us/gp/gpcmtprt.i &type=RP &id=wo_cmtindx &pos=3} */
     /*eB3sp5*/      {us/xf/xfcmtprt.i &type=RP &rectype=Y &id=wo_cmtindx
                 &usercode="us/xf/xfworluy.i"}
   end.
   else view frame routing.
   /*eB3sp5*/  {us/xf/xfworldmm.i}

   wr_ctr_mch = wr_wkctr.

   if wr_mch <> "" then
      wr_ctr_mch = wr_ctr_mch + "  " + getTermLabel("MACHINE",6)
                 + ": " + wr_mch.

   wc_description = "".
   find wc_mstr  where wc_mstr.wc_domain = global_domain and  wc_wkctr =
   wr_wkctr
      and wc_mch   = wr_mch   no-lock no-error.
   if available wc_mstr then wc_description = wc_desc.
   /*eB3sp5*/   {us/xf/xfworldml.i}

   display
      wr_op
      wr_ctr_mch
      wr_std_op
      wr_tool           column-label {&mfworld_i_5}
      wr_setup @ wr_run column-label {&mfworld_i_4}
      "______" @ temp1  column-label {&mfworld_i_8}
      "(  )"   @ temp2  column-label {&mfworld_i_6}.

   down 1.

   if (not available ptp_det
       and pt_op_yield  = yes)
   or (available ptp_det
       and ptp_op_yield = yes)
   then do:
      display
         wc_description @ wr_ctr_mch
         wr_vend @ wr_tool
         wr_run * ((wr_qty_ord) * (l_yield * .01))
            when (wr_run * wr_qty_ord <= 1.0)
         @ wr_run
         round(wr_run * wr_qty_ord,3) * (l_yield * .01)
            when (wr_run * wr_qty_ord > 1.0)
         @ wr_run
         "______" @ temp1
         "(  )" @ temp2.

      l_yield = l_yield * (wr_yield * .01).
   end. /* IF (NOT AVAILABLE ptp_det */
   else
      display
         wc_description @ wr_ctr_mch
         wr_vend @ wr_tool
         wr_run * wr_qty_ord when (wr_run * wr_qty_ord <= 1.0)
         @ wr_run
         round(wr_run * wr_qty_ord,3) when (wr_run * wr_qty_ord > 1.0)
         @ wr_run
         "______" @ temp1
         "(  )" @ temp2.

   if wr_desc <> "" then do:
      down 1.
      display wr_desc @ wr_ctr_mch.
   end.

   if barcode then do:
      {us/mf/mfprtbar.i string(wr_op)}
      {us/mf/mfprtbar.i string(wr_op)}
      put skip(1).
      /**eB3sp5*/  {us/xf/xfworldmv.i}
   end.

   /* PRINT ROUTING COMMENTS */
   if wr_cmtindx <> 0 then
      find first cmt_det  where cmt_det.cmt_domain = global_domain and
      cmt_indx = wr_cmtindx no-lock no-error.
   else do:

      find ro_det  where ro_det.ro_domain = global_domain and (
         ro_routing = (if wo_routing <> "" then wo_routing else wo_part)
         and ro_op = wr_op
         and (ro_start = ? or ro_start <= today)
         and (ro_end = ? or ro_end >= today)
         ) no-lock no-error.

      if available ro_det and ro_cmtindx <> 0 then do:
         find first cmt_det  where cmt_det.cmt_domain = global_domain and
         cmt_indx = ro_cmtindx
            no-lock no-error.
      end.
      else do:
         find opm_mstr  where opm_mstr.opm_domain = global_domain and
         opm_std_op = wr_std_op no-lock no-error.
         if available opm_mstr and opm_cmtindx <> 0 then
            find first cmt_det  where cmt_det.cmt_domain = global_domain and
            cmt_indx = opm_cmtindx
            no-lock no-error.
      end.
   end.

   if available cmt_det then do:
      commentindex = cmt_indx.
     /*eB3sp5*/   {us/xf/xfcmtprt.i &type=RP &rectype=Z &id=commentindex
                 &usercode="us/xf/xfworluz.i"}
     /*93sp12.1  {us/gp/gpcmtprt.i &type=RP &id=commentindex &pos=3
         &command="down 1 with frame d."} */
   end.

   down 1.
end.
page.
hide frame routing.
/*eB3sp5*/  {us/xf/xfworldm0.i} /*Print Header Procedure */
