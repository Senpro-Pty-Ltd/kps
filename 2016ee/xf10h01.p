/* xf10h01.p - SALES ORDER INVOICE PRINT FOR ENGLISH PRINT CODE "1"           */
/* so10h01.p - SALES ORDER INVOICE PRINT FOR ENGLISH PRINT CODE "1"           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xf10h01.p,v 1.2 2018/03/13 17:09:34 gbg Exp $: */
/* $Revision: 1.2 $                                                      */
/* REVISION: 7.2      LAST MODIFIED: 11/11/94   BY: rxm *FT54*                */
/* REVISION: 7.3      LAST MODIFIED: 09/05/95   BY: jym *G0W9*                */
/* REVISION: 7.3      LAST MODIFIED: 11/14/96   BY: ame *G2J1*                */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* EvdGevel           */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 07/14/98   BY: *L024* Steve Goeke        */
/* REVISION: 8.6E     LAST MODIFIED: 08/13/98   BY: *J2VM* Irine D'mello      */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0JM* Mudit Mehta        */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.10.1.3  BY: Jean Miller          DATE: 04/16/02   ECO: *P05H* */
/* Revision: 1.10.1.5  BY: Paul Donnelly (SB)   DATE: 06/28/03   ECO: *Q00L* */
/* Revision: 1.10.1.6  BY: Ashish Maheshwari    DATE: 11/15/03   ECO: *P15L* */
/* $Revision: 1.2 $ BY: Katie Hilbert          DATE: 06/08/06  ECO: *Q0LK*   */
/* Revision: QAD2016EE    BY: Steve Hong        DATE: 31/03/16  ECO: *93sp12.1   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
/* DEFINITION FOR TEMP TABLE  t_tr_hist1 */
{us/so/sotrhstb.i}
{us/pa/pashphtb.i} /* tt_item_serials temp table */
{us/px/pxmaint.i}
{us/px/pxphdef.i pashphxr}

{us/xf/xfdefa.i} /*93sp12.1*/

define input parameter table for t_tr_hist1.
define input parameter soAppOwner like so_app_owner.

define shared variable sonbr     like sod_nbr.
define shared variable soline    like sod_line.
define shared variable sopart    like sod_part.
define shared variable qty_bo    like sod_qty_ord format "->>>>>>9.9<<<<".
define shared variable ext_price like sod_price
                                 label "Ext Price" format "->>>>,>>>,>>9.99".

define variable lot-lbl                 as character format "x(56)".
define variable lotserial_total         like tr_qty_chg.
define variable ent_ord_line_part       like sod_part    no-undo.
define variable ent_ord_line_uom        like sod_um      no-undo.

define shared frame d.
define shared frame dent.

lot-lbl  = getTermLabelRtColon("LOT/SERIAL_NUMBERS_SHIPPED",27) + " " +
           getTermLabelRt("QUANTITY",6) + " " +
           getTermLabelRt("EXPIRE",8) + " " +
           getTermLabelRt("REFERENCE",12).

{us/et/etvar.i}
{us/et/etdcrvar.i}
{us/et/etrpvar.i}

/*93sp12.1 {us/so/so10e02.i} */

for each t_tr_hist1 no-lock
   where t_tr_type = "ISS-SO"
     and t_tr_nbr  = sonbr
     and t_tr_rmks = ""
     and t_tr_line = soline
     and t_tr_serial <> ""
use-index t_hist1_indx
break by t_tr_serial by t_tr_ref by t_tr_expire:
   if first-of(t_tr_serial) then do:
      empty temp-table tt_item_serials.
   end.

/*93sp12.1 ****
   if first(t_tr_expire) then do:
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h02.i}
      end.

      put lot-lbl at 3
         skip.
   end.
***/

   if first-of(t_tr_expire) then
      lotserial_total = 0.

   lotserial_total = lotserial_total - t_tr_qty_loc.

   if last-of(t_tr_expire) and lotserial_total <> 0 then do:

    /*93sp12.1 ******
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h02.i}
      end.

      put
         t_tr_serial     at 5
         lotserial_total at 25
         t_tr_expire     at 40
         t_tr_ref        at 50
         skip.
     ****93sp12.1*/
     {us/xf/xf10h09mp.i} /*93sp12.1*/
   end.
     
   {us/px/pxrun.i &PROC       = 'getShippingSerialHistoryByTrans'
                  &PROGRAM    = 'pashphxr.p'
                  &HANDLE     = ph_pashphxr
                  &PARAM      = "(input t_tr_hist1.t_tr_trnbr,
                                  input-output table tt_item_serials by-reference)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}
   if last-of (t_tr_serial) then do:
      for each tt_item_serials no-lock:
         /*93sp12.1*
         put tt_serial_id at 5 skip.
	   ****93sp12.1*/
	 /*93sp12.1*/ put stream ft "P" at 1
	                        tt_serial_id at 2 format "x(18)" skip.  
      end.
   end.

end.
