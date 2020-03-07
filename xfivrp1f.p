/* xfivrp1f.p  -  SALES ORDER INVOICE REPRINT - LINE ITEMS              */
/* soivrp1f.p  -  SALES ORDER INVOICE REPRINT - LINE ITEMS              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivrp1f.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 7.2            CREATED: 04/15/95   BY: rxm *F0PD*          */
/* REVISION: 8.5      LAST MODIFIED: 06/12/95   BY: DAH *J042*          */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: DAH *J0T0*          */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane    */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00   BY: *N0JM* Mudit Mehta      */
/* Revision: 1.6.1.4    BY: Paul Donnelly (SB)    DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.6.1.5    BY: Katie Hilbert         DATE: 06/08/06  ECO: *Q0LK* */
/* Revision: 1.6.1.6    BY: Dipanshu Talwar       DATE: 06/10/09  ECO: *Q2K3* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/* Revision: QAD2015EE    BY: Steve Hong        DATE: 14/01/16  ECO: *grc338   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/xf/xfdefa.i} /*93sp12.1*/
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

{us/px/pxmaint.i}
{us/px/pxphdef.i pasexr}
{us/px/pxphdef.i pashphxr}
{us/px/pxphdef.i pasldel}

{us/pa/pattrciq.i}

define input parameter parent as character.
define input parameter level as integer.
define input parameter order as character.
define input parameter line as integer.
define input parameter print_lotserials as logical.

define shared variable ih_recno        as recid.
define shared variable disc_prnt_label as character.
define shared variable isDomOrder      as logical no-undo.

define variable fillchar  as character no-undo.
define variable parent_id as character no-undo.
define variable sob-qty   like sob_qty_req.
define variable ibh_desc  like pt_desc1 no-undo.
define variable ibh_desc2 like pt_desc2 no-undo.
define variable ibh_um    like pt_um.
define variable qty_bo    like idh_qty_ord format "->>>>>>9.9<<<<".
define variable ext_price like idh_price format "->>>>,>>>,>>9.99".
define variable ent_ord_line_part   like idh_part    no-undo.
define variable ent_ord_line_uom    like idh_um      no-undo.
define variable hdl_disc_lbl as handle.
define variable l_lot-lbl    as character format "x(56)".
define variable l_lotsrl_tot like tr_qty_chg.
define variable l_effdate    as date no-undo.
define variable fromShippingHist as logical no-undo.
define variable progName as character no-undo.

define temp-table tt_item_serials no-undo
   field tt_serial_id      like ser_serial_id
   index idx_p tt_serial_id.

define temp-table tt_tr_hist no-undo
   field tt_tr_trnbr     as integer
   field tt_tr_type      as character
   field tt_tr_rmks      as character
   field tt_tr_serial    as character
   field tt_tr_expire    as date
   field tt_tr_ref       as character
   field tt_tr_nbr       as character
   field tt_tr_part      as character
   field tt_tr_effdate   as date
   field tt_tr_qty_loc   as decimal
   field tt_display      as logical
   index tt_tr_trnbr tt_tr_trnbr.

define shared frame d.
define shared frame dent.

l_lot-lbl = getTermLabelRtColon("LOT/SERIAL_NUMBERS_SHIPPED",27) + " " +
            getTermLabelRt("QUANTITY",6) + " " +
            getTermLabelRt("EXPIRE",8) + " " +
            getTermLabelRt("REFERENCE",12).

define buffer kit_item_tr_hist for tr_hist.
define buffer kit_item_abs_mstr for abs_mstr.

{us/so/sodiscwk.i}  /* Shared workfile for summary discounts */
{us/so/soivhfm2.i}  /* INCLUDE FILE FOR FRAMES d, dent */

/* Set the label for the discount display */
hdl_disc_lbl = prnt_disc_amt:handle in frame disc_print.

find ih_hist where recid(ih_hist) = ih_recno no-lock no-error.
find idh_hist
   where idh_domain  = global_domain
    and  idh_inv_nbr = ih_inv_nbr
    and  idh_nbr     = order
    and  idh_line    = line
no-lock no-error.

for each ibh_hist
   where ibh_domain  = global_domain
     and ibh_inv_nbr = ih_inv_nbr
     and ibh_nbr     = idh_nbr
     and ibh_line    = idh_line
     and ibh_parent  = parent
     and ibh_qty_req <> 0
no-lock:
   if idh_qty_ord = 0
   then sob-qty = 0.
   else sob-qty = ibh_qty_req / idh_qty_ord.
   assign
      ibh_desc  = ""
      ibh_desc2 = "".
   for first pt_mstr
      where pt_domain = global_domain
       and  pt_part = ibh_part
   no-lock:
      assign
         ibh_desc  = pt_desc1
         ibh_desc2 = pt_desc2
         ibh_um    = pt_um.
   end.

   parent_id = substring(ibh_serial, 11, 4).

   /*eb3sp5 comment begin
   {us/et/etivsa.i d dent}

   fillchar = fill(".", level).

   put
      ibh_feature format "x(12)" at 5 " "
      fillchar + ibh_part format "x(27)"
      sob-qty " " ibh_um.

   if ibh_desc > "" then do:
      {us/et/etivsa.i d dent}
      put ibh_desc at 20 skip.
   end.

   if ibh_desc2 > "" then do:
      {us/et/etivsa.i d dent}
      put ibh_desc2 at 20 skip.
   end.
   eb3sp5 comment end*/
   {us/xf/xfivrp9fmc.i} /*93sp12.1*/

   /* Print discounts for component item */
   /*eb3sp5 comment begin
   {us/so/sopiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
      &line=idh_line &part=idh_part
      &parent=ibh_parent
      &feature="substring(ibh_feature,1,12)"
      &opt=ibh_part
      &qty="(sob-qty * idh_qty_inv)"
      &list_price=ibh_tot_std
      &net_price=ibh_price
      &confg_disc="no"
      &command="~{us/so/soivcmd.i~}"}
   eb3sp5 comment end*/
   /*eb3sp5 add begin*/
   {us/xf/xfpiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
      &line=idh_line &part=idh_part
      &parent=ibh_parent
      &feature="substring(ibh_feature,1,12)"
      &opt=ibh_part
      &qty="(sob-qty * idh_qty_inv)"
      &list_price=ibh_tot_std
      &net_price=ibh_price
      &confg_disc="no"}
   /*eb3sp5 add end*/
   
   if print_lotserials
   then do:
      for first sod_det
         where sod_domain      = global_domain
         and   sod_nbr         = idh_nbr
         and   sod_line        = idh_line
      no-lock:
      end. /* FOR FIRST sod_det */
      if available sod_det
      then do:
         if sod_consignment = no
         then do:
            /*grc338
	    {us/so/solotspr.i}
	    */ {us/xf/xfsolotspr.i}
         end. /* IF sod_consignment = no */ 
      end. /* IF AVAILABLE sod_det */
      else do:
         if not can-find(first cncix_mstr
                            where cncix_domain   = global_domain
                            and   cncix_so_nbr   = idh_nbr
                            and   cncix_sod_line = idh_line)
            and not can-find(first cncu_mstr
                                where cncu_domain   = global_domain
                                and   cncu_so_nbr   = idh_nbr
                                and   cncu_sod_line = idh_line)
         then do:
	     /*grc338
            {us/so/solotspr.i}
	    */  {us/xf/xfsolotspr.i}
	    
         end. /* IF NOT CAN-FIND(FIRST cncix_mstr AND ... */
      end. /* IF NOT AVAILABLE sod_det */
   end. /* IF print_lotserials */


   if parent_id <> "" then do:
      /* 93sp12.1 {us/bbi/gprun.i ""soivrp1f.p"" */
  /* 93sp12.1*/ {us/bbi/gprun.i ""xfivrp1f.p"" 
         "(input parent_id,
           input level + 1,
           input order,
           input line,
           input print_lotserials)"}
   end.
end.
