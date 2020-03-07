/* xfivrp1d.p - SALES ORDER INVOICE REPRINT LINE ITEMS                  */
/* soivrp1d.p - SALES ORDER INVOICE REPRINT LINE ITEMS                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivrp1d.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 7.2      LAST MODIFIED: 11/12/94   BY: rxm *FT54*          */
/* REVISION: 7.3      LAST MODIFIED: 09/05/95   BY: jym *G0W9*          */
/* REVISION: 7.3      LAST MODIFIED: 11/15/96   BY: ame *G2J1*          */
/* REVISION: 7.3      LAST MODIFIED: 02/13/97   BY: *G2KX* Suresh Nayak */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane    */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 08/17/98   BY: *J2VM* Irine D'mello*/
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 06/27/00   BY: *N0DM* Rajinder Kamra   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb              */
/* REVISION: 9.1      LAST MODIFIED: 10/09/00   BY: *N0W8* Mudit Mehta      */
/* Old ECO marker removed, but no ECO header exists *F0PN*                  */
/* Revision: 1.8.2.6     BY: Paul Donnelly (SB)   DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.8.2.8     BY: Ashish Maheshwari    DATE: 11/15/03  ECO: *P15L* */
/* Revision: 1.8.2.9     BY: Katie Hilbert        DATE: 06/08/06  ECO: *Q0LK* */
/* Revision: 1.8.2.10    BY: Prashant Menezes     DATE: 10/09/06  ECO: *P593* */
/* $Revision: 1.2 $ BY: Jean Miller          DATE: 11/23/09  ECO: *R1TW* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/px/pxmaint.i}
{us/bbi/mfdeclre.i}
{us/xf/xfdefa.i} /*eb3sp5*/
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

/* DEFINITION FOR TEMP TABLE  t_tr_hist1 */
{us/so/sotrhstb.i}
{us/pa/pattrciq.i}

{us/px/pxphdef.i pashphxr}
{us/px/pxphdef.i pasexr}
{us/px/pxphdef.i pasldel}

define input  parameter table           for  t_tr_hist1.

define shared variable lotserial_total    like tr_qty_chg.
define shared variable lotserials_toprint as integer.
define shared variable sonbr              like idh_nbr.
define shared variable soline             like idh_line.
define shared variable soinv              like idh_inv_nbr no-undo.
define shared variable sopart             like idh_part.
define shared variable isDomOrder         as logical no-undo.
define variable fromShippingHist as logical no-undo.
define variable progName as character no-undo.

define variable qty_bo              like idh_qty_ord
                                    format "->>>>>>9.9<<<<"
                                    label "Backorder".
define variable ext_price           like idh_price label "Ext Price"
                                    format "->>>>,>>>,>>9.99".
define variable ent_ord_line_part   like idh_part    no-undo.
define variable ent_ord_line_uom    like idh_um      no-undo.

define temp-table tt_item_serials no-undo
   field tt_serial_id      like ser_serial_id
   index idx_p tt_serial_id.

define shared frame d.
define shared frame dent.

{us/so/soivhfm2.i}

{us/px/pxrun.i &PROC = 'getProgName'
   &PROGRAM='pasldel.p'
   &HANDLE = ph_pasldel
   &PARAM = "(output progName)"
   &NOAPPERROR = true
   &CATCHERROR = true}

if progName <> "rcsois.p" then do:
   fromShippingHist = yes.
end.
else do:
   fromShippingHist = no.
end. 

/* MAKE SURE ORACLE DOES NOT PICK TR_TYPE INDEX */
for each t_tr_hist1 no-lock
   where t_tr_type = "ISS-SO"
     and t_tr_nbr = sonbr
     and t_tr_line = soline
     and t_tr_rmks = soinv
     and t_tr_serial <> ""
use-index t_hist1_indx
break by t_tr_serial by t_tr_ref by t_tr_expire:

   if first-of(t_tr_expire) then do:
      lotserial_total = 0.
      empty temp-table tt_item_serials.
   end.

   if fromShippingHist then do:
      for each tr_hist no-lock
         where tr_hist.tr_domain = global_domain
            and tr_hist.tr_type = "ISS-SO"
            and tr_hist.tr_nbr = t_tr_nbr
            and tr_hist.tr_line = t_tr_line
            and tr_hist.tr_rmks = t_tr_rmks
            and tr_hist.tr_loc = t_tr_loc
            and tr_hist.tr_part = t_tr_part
            and tr_hist.tr_qty_chg = t_tr_qty_chg
            and tr_hist.tr_ref = t_tr_ref
            and tr_hist.tr_serial = t_tr_serial
            and tr_hist.tr_site = t_tr_site
            and tr_hist.tr_ship_id = t_tr_ship_id
            and tr_hist.tr_qty_loc = t_tr_qty_loc
            and tr_hist.tr_expire = t_tr_expire:

         {us/px/pxrun.i &PROC       = 'getShippingSerialHistoryByTrans'
                        &PROGRAM    = 'pashphxr.p'
                        &HANDLE     = ph_pashphxr
                        &PARAM      = "(input tr_hist.tr_trnbr,
                                        input-output table tt_item_serials by-reference)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
      end.
   end.
   else do:
      find first abs_mstr no-lock
         where abs_mstr.abs_domain = global_domain
            and abs_mstr.abs_shipfrom = t_tr_site
            and abs_mstr.abs_id = "s" + t_tr_ship_id
      no-error.

      if available abs_mstr then do:
         empty temp-table ttMasterSerialToShipper.

         {us/bbi/gprun.i ""parciq1a.p""
                "(input oid_abs_mstr,
                  input today,
                  input no,
                  input-output table ttMasterSerialToShipper by-reference)"}

         for each ttMasterSerialToShipper no-lock
            where ttMasterSerialToShipper.orderNumber = sonbr
               and ttMasterSerialToShipper.orderLine = string(soline)
               and ttMasterSerialToShipper.itemNumber = t_tr_part
               and ttMasterSerialToShipper.site = t_tr_site
               and ttMasterSerialToShipper.location = t_tr_loc
               and ttMasterSerialToShipper.lotSerial = t_tr_serial
               and ttMasterSerialToShipper.reference = t_tr_ref:

            empty temp-table ttItemSerialToShipper.

            {us/px/pxrun.i &PROC = 'getItemSerIDByOrderLine'
               &PROGRAM='pasexr.p'
               &HANDLE = ph_pasexr
               &PARAM = "(input ttMasterSerialToShipper.masterSerialID,
                          input ttMasterSerialToShipper.orderType,
                          input ttMasterSerialToShipper.orderNumber,
                          input ttMasterSerialToShipper.orderLine,
                          input-output table ttItemSerialToShipper by-reference)"
               &NOAPPERROR = true
               &CATCHERROR = true}

            for each ttItemSerialToShipper exclusive-lock
               where ttItemSerialToShipper.itemNumber <> t_tr_part
               or    ttItemSerialToShipper.lotSerial  <> t_tr_serial
               or    ttItemSerialToShipper.reference  <> t_tr_ref:
               delete ttItemSerialToShipper.
            end.

            for each ttItemSerialToShipper no-lock:

               if not can-find(first tt_item_serials
                  where tt_item_serials.tt_serial_id  = ttItemSerialToShipper.itemSerialID)
               then do:
                  create tt_item_serials.
                  assign
                     tt_item_serials.tt_serial_id = ttItemSerialToShipper.itemSerialID
                  .
               end.
            end. /*ttItemSerialToShipper*/
         end. /*ttMasterSerialToShipper*/
      end. /*abs_mstr*/
   end. /*not fromShippingHist*/

   lotserial_total = lotserial_total - t_tr_qty_loc.

   if last-of(t_tr_expire)
      and lotserial_total <> 0
   then do:
      /*eb3sp5 comment begin
      if page-size - line-counter < 1
      then do:

         if isDomOrder then do:
           page.

            display
               sopart   @ ent_ord_line_part
               cont_lbl @ idh_qty_inv
            with frame dent.
            down 1 with frame dent.
         end.

         page.

         display
            sopart   @ idh_part
            cont_lbl @ idh_qty_inv
         with frame d.
         down 1 with frame d.

      end. /* IF page-size - line-counter < 1 ... */

      put
         t_tr_serial     at 5
         lotserial_total at 25
         t_tr_expire     at 40
         t_tr_ref        at 50
         skip.
    
      
      
      for each tt_item_serials no-lock:

         if page-size - line-counter < 1 then do:

            if isDomOrder then do:
               page.

               display
                  sopart   @ ent_ord_line_part
                  cont_lbl @ idh_qty_inv
               with frame dent.

               down 1 with frame dent.
            end.

            page.

            display
               sopart   @ idh_part
               cont_lbl @ idh_qty_inv
            with frame d.

            down 1 with frame d.
         end. /* IF page-size - line-counter < 1 ... */

         put tt_serial_id at 5 skip.
      end.
        eb3sp5 comment end*/
       {us/xf/xfivrp9dmp.i} /*93sp12.1*/
   end.  /* IF last-of(t_tr_expire) ... */

end.  /* IF last-of(t_tr_expire) ... */
