/* xfworlf.i - PRINT CO/BY-PRODUCT EXPECTED RECEIPTS                          */
/* mfworlf.i - PRINT CO/BY-PRODUCT EXPECTED RECEIPTS                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfworlf.i,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* REVISION: 8.5     LAST MODIFIED: 10/05/94    BY: tjs *J027*          */
/* REVISION: 8.5     LAST MODIFIED: 09/06/95    BY: srk *J07Q*          */
/* REVISION: 8.5     LAST MODIFIED: 02/04/97    BY: *J1GW* Russ Witt        */

/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane        */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan       */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan       */
/* REVISION: 9.0      LAST MODIFIED: 12/22/99   BY: *J3N3* Vandna Rohira    */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 07/18/00   BY: *N0GB* Mudit Mehta      */
/* REVISION: 9.1      LAST MODIFIED: 08/23/00   BY: *N0ND* Mark Brown       */
/* Old ECO marker removed, but no ECO header exists *F0PN*                  */
/* Revision: 1.11     BY: Katie Hilbert  DATE: 04/01/01 ECO: *P008*      */
/* Revision: 1.12  BY: Mugdha Tambe DATE: 04/25/03 ECO: *P0QK* */
/* Revision: 1.14    BY: Paul Donnelly (SB)     DATE: 06/28/03   ECO: *Q00G* */
/* $Revision: 1.2 $ BY: Shilpa Kamath          DATE: 06/28/03   ECO: *R03V* */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/px/pxmaint.i}
define variable description like pt_desc1.
define variable um          like pt_um.
define variable loc         like pt_loc.
define variable wonbr       like wo_nbr.
define variable received    like wo_qty_comp.
/*eB3sp5*/   {us/xf/xfworlbv.i}

{us/mf/mfworlb1.i &row="1"} /* REPORT OPTIONS */

form
   skip (1)
   wo_nbr         colon 13
   wo_lot         colon 13
   wo_part        colon 13
   par_rev        colon 40 label "Rev"
   wo_due_date    colon 68 label "Work Order Due Date" skip
   wo_des         no-label format "x(49)" at 15
   wo_rmks        colon 13
   wo_so_job      colon 68
   wo_qty         colon 13
   wo_um          no-label
   wo_site        colon 40
   deliv          colon 68 skip (1)
with frame jplist page-top side-labels  width 80
   title (getFrameTitle("WORK_ORDER_CO/BY-PRODUCT_RECEIPTS",46)).

/* SET EXTERNAL LABELS */
setFrameLabels(frame jplist:handle).

find pt_mstr  where pt_mstr.pt_domain = global_domain and  pt_part = wo_part
no-lock no-error.
assign
    /*eB3sp5*/ par_draw = "" 
   wo_des = ""
   wo_um = ""
   par_rev = "".
if available pt_mstr then
assign
    /*eB3sp5*/ par_draw = pt_draw
   wo_des = pt_desc1
   wo_des = wo_des + " " + pt_desc2
   wo_um = pt_um
   par_rev = pt_rev.

wonbr = wo_nbr.
display
   wo_nbr
   wo_lot
   wo_part
   par_rev
   wo_due_date
   wo_des
   wo_rmks
   wo_so_job
   wo_qty
   wo_um
   wo_site
   deliv
with frame jplist.
/*eB3sp5*/   run print_header in this-procedure.
jpprinted = yes.

for each wo_mstr exclusive-lock  where wo_mstr.wo_domain = global_domain and
wo_nbr = wonbr
      and wo_joint_type <> "5"
      break by wo_part
   with frame detail no-box down:

   /*DISPLAY COMMENTS */

   find pt_mstr  where pt_mstr.pt_domain = global_domain and  pt_part = wo_part
   no-lock no-error.
   if available pt_mstr 
   then do:
      assign
         um = pt_um
         description = pt_desc1.
      {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
               &PARAM = "(input  wo_part,
                          input  wo_site,
                          input ""pt_loc"",
                          output loc)"
               &NOAPPERROR = true
               &CATCHERROR = true
      }
   end. /* IF AVAILABLE pt_mstr */
   else
   assign
      um = ""
      loc = ""
      description = "".

   if page-size - line-counter < 4 then page.

   setFrameLabels(frame detail:handle).
   down 1 with frame detail.
   display
      wo_part
      wo_lot
      " " @ lad_lot column-label "Lot/Serial!Ref"
      max(wo_qty_ord - wo_qty_comp,0) @ wo_qty_chg
      column-label "Expected Qty"
      um
      "_____________" @ received column-label "Received/!Scrapped"
   with frame detail width 80.

   down 1 with frame detail.
   if page-size - line-counter < 1 then do:
      page.

      display
         wo_part "*** " + getTermLabel("CONTINUE",4) + " ***"
         @ lad_lot with frame detail.
      down 1 with frame detail.
   end.
   put space(3) description
      space(1) "__________________"
      space(17) "_____________" skip.
   if available pt_mstr and pt_desc2 <> "" then do:
      if page-size - line-counter < 1 then do:
         page.

         display
            wo_part "*** " + getTermLabel("CONTINUE",4) + " ***"
            @ lad_lot with frame detail.
         down 1 with frame detail.
      end.
      put space(3) pt_desc2 skip.
   end.

/*93sp12.1
   {us/gp/gpcmtprt.i &type = RP 
    &id   = wo_cmtindx
      &pos  = 3} */
 
   {us/xf/xfcmtprt.i
      &type=RP
      &rectype=Y
      &id=wo_cmtindx
      &usercode="us/xf/xfworluy.i"}
   /*eB3sp5 end*/

end. /*FOR EACH*/

page.
hide frame jplist.
/*eB3sp5*/  {us/xf/xfworlfm0.i}
