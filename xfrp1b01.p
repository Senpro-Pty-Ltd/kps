/* xfrp1b01.p  -  SALES ORDER INVOICE PRINT                             */
/* sorp1b01.p  -  SALES ORDER INVOICE PRINT                             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrp1b01.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 7.2            CREATED: 04/19/95   BY: rxm *F0PD*          */
/* REVISION: 8.5      LAST MODIFIED: 06/07/95   BY: DAH *J042*          */
/* REVISION: 8.5      LAST MODIFIED: 10/05/95   BY: srk *J08B*          */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: DAH *J0T0*          */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 06/05/98   BY: *L00L* Adam Harris */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 06/29/00   BY: *N0DX* Mudit Mehta      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb              */
/* REVISION: 9.1      LAST MODIFIED: 10/14/00   BY: *N0WB* BalbeerS Rajput  */
/* Revision: 1.7.2.5       BY: Narathip W.        DATE: 05/13/03  ECO: *P0RT* */
/* Revision: 1.7.2.7       BY: Paul Donnelly      DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.7.2.10      BY: Ed van de Gevel    DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.7.2.11      BY: Katie Hilbert      DATE: 06/08/06  ECO: *Q0LK* */
/* Revision: 1.7.2.12      BY: Jean Miller        DATE: 06/19/08  ECO: *R0VG* */
/* $Revision: 1.2 $   BY: Dipanshu Talwar    DATE: 06/10/09  ECO: *Q2K3* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

{us/et/etvar.i &new="new"}
{us/et/etrpvar.i &new="new"}
{us/et/etdcrvar.i "new"}
{us/xf/xfdefa.i} /*eb3sp5*/

define input parameter parent as character.
define input parameter level  as integer.
define input parameter order  as character.
define input parameter line   as integer.
define input parameter print_lotserials as logical.

define shared variable qty_bo          like sod_qty_ord format "->>>>>>9.9<<<<".
define shared variable ext_price       like sod_price label "Ext Price"
                                       format "->>>>,>>>,>>9.99".
define shared variable disc_prnt_label as character.
define shared variable so_recno        as recid.

define shared frame d.
define shared frame dent.
define shared frame deuro.

define variable fillchar     as character no-undo.
define variable parent_id    as character no-undo.
define variable sob-qty      like sob_qty_req no-undo.
define variable sob_desc     like pt_desc1 no-undo.
define variable sob_desc2    like pt_desc2 no-undo.
define variable sob_um       like pt_um no-undo.
define variable ent_ord_line_part       like sod_part    no-undo.
define variable ent_ord_line_uom        like sod_um      no-undo.

define variable hdl_disc_lbl as handle.

define variable l_lot-lbl    as character format "x(56)".
define variable l_lotsrl_tot like tr_qty_chg.
define variable l_effdate    as date no-undo.

l_lot-lbl = getTermLabelRtColon("LOT/SERIAL_NUMBERS_SHIPPED",27) + " " +
            getTermLabelRt("QUANTITY",6) + " " +
            getTermLabelRt("EXPIRE",8) + " " +
            getTermLabelRt("REFERENCE",12).

{us/so/sodiscwk.i} /* Shared workfile for summary discounts */

{us/so/so10e02.i}               /* INCLUDE FILE FOR FRAME D, DEnt, and DEuro */

find so_mstr where recid(so_mstr) = so_recno no-lock.

find sod_det where sod_domain = global_domain
    and  sod_nbr = order
    and  sod_line = line
    and  sod_compl_stat = ""
no-lock no-error.

if not available sod_det then return.

find first cil_mstr
   where cil_mstr.cil_domain = global_domain
     and cil_cor_so_nbr = sod_nbr
no-lock no-error.

if available cil_mstr then
   find first cild_det
      where cild_det.cild_domain = global_domain
        and cild_cor_inv = cil_cor_inv
        and cild_cor_so_nbr     = cil_cor_so_nbr
        and cild_cor_line = sod_line
   no-lock.
{us/so/socirp05.i}
{us/so/socifrm.i}

/* Set the label for the discount display */
hdl_disc_lbl = prnt_disc_amt:handle in frame disc_print.

/*!      ***********************************************
sob_serial subfield positions:
1-4     operation number (old - now 0's)
5-10    scrap percent
11-14   id number of this record
15-15   structure code
16-16   "y" (indicates "new" format sob_det record)
17-34   original qty per parent
35-35   original mandatory indicator (y/n)
36-36   original default indicator (y/n)
37-39   leadtime offset
40-40   price manually updated (y/n)
41-46   operation number (new - 6 digits)
*******************************************/

/* NEW STYLE sob_det RECORDS DO NOT HAVE DATA IN sob_parent THAT
   CORRESPONDS TO A pt_part RECORD.  THEY CONTAIN A SYMBOLIC REFERENCE
   IDENTIFIED BY BYTES 11-14 IN sob_serial.
   NEW STYLE sob_det RECORDS ARE FOR SALES ORDERS CREATED
   SINCE PATCH FP28 AND GK60.
*/
for each sob_det
   where sob_domain = global_domain
    and  sob_nbr = sod_nbr
    and  sob_line = sod_line
    and  sob_parent = parent
    and  sob_qty_req <> 0
no-lock:
   if sod_qty_ord = 0
   then sob-qty = 0.
   else sob-qty = sob_qty_req / sod_qty_ord.
   find pt_mstr
      where pt_domain = global_domain
       and  pt_part = sob_part
   no-lock no-error.
   if available pt_mstr then
      assign
         sob_desc  = pt_desc1
         sob_desc2 = pt_desc2
         sob_um    = pt_um.
   else
      assign
         sob_desc  = "".
         sob_desc2 = "".

   parent_id = substring(sob_serial, 11, 4).
   /*eb3sp5 comment begin
   if page-size - line-counter < 1 then do:
      page.
      {us/so/so10h01.i}
   end.

   fillchar = fill(".", level).

   put
      sob_feature format "x(12)" at 5 " "
      fillchar + sob_part format "x(27)"
      sob-qty " " sob_um.

   if sob_desc > "" then do:
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h01.i}
      end.
      put sob_desc at 20 skip.
   end.
   if sob_desc2 > "" then do:
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so10h01.i}
      end.
      put sob_desc2 at 20 skip.
   end.
   eb3sp5 comment end*/
   {us/xf/xfrp1b09mc.i} /*eb3sp5*/

   /*ADDED TILDE BEFORE CURLY BRACES SO FILE WOULD COMPILE*/
   /* Print discounts for component item */
   /* Added net price parameter */
   /* Changed qty from ordered to invoiced */
   /*eb3sp5 comment begin
   {us/so/sopiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
      &part=sod_part
      &parent=sob_parent &feature=sob_feature
      &opt=sob_part
      &qty="(sob-qty * sod_qty_inv)"
      &list_price=sob_tot_std
      &net_price=sob_price
      &confg_disc="no"
      &command="~{us/so/so10h01.i~}"}
   eb3sp5 comment end*/
   /*eb3sp5 add begin*/
   {us/xf/xfpiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
      &part=sod_part
      &parent=sob_parent &feature=sob_feature
      &opt=sob_part
      &qty="(sob-qty * sod_qty_inv)"
      &list_price=sob_tot_std
      &net_price=sob_price
      &confg_disc="no"}
   /*eb3sp5 add end*/

   if print_lotserials
   then do:
      find first mfc_ctrl
         where mfc_domain = global_domain
         and   mfc_field  = "scan_tr_hist_days"
      no-lock no-error.
      if     available mfc_ctrl
         and mfc_integer <> 0
      then
         l_effdate = today - mfc_integer.
      else
         l_effdate = low_date.

      for each tr_hist
         where tr_domain   = global_domain
         and   tr_nbr      = sob_nbr + "." + string(sob_line)
         and   tr_effdate >= l_effdate
         and   tr_part     = sob_part
         and   tr_type     = "ISS-FAS"
         and   tr_serial  <> ""
      no-lock
      use-index tr_nbr_eff
      break by tr_serial
            by tr_ref
            by tr_expire:

         if first(tr_expire)
         then do:
            if page-size - line-counter < 1
            then do:
               page.
               {us/so/so10h01.i}
            end.

            put l_lot-lbl at 3
               skip.
         end. /* IF FIRST(tr_expire) */

         if first-of(tr_expire)
         then
            l_lotsrl_tot = 0.

         l_lotsrl_tot = l_lotsrl_tot - tr_qty_loc.

         if     last-of(tr_expire)
            and l_lotsrl_tot <> 0
         then do:
            if page-size - line-counter < 1
            then do:
               page.
               {us/so/so10h01.i}
            end.

            put
               tr_serial    at 5
               l_lotsrl_tot at 25
               tr_expire    at 40
               tr_ref       at 50
               skip.
         end. /* IF LAST-OF(tr_expire) and */
      end. /* FOR EACH tr_hist */
   end. /* IF print_lotserials */

   if parent_id <> "" then do:
   /*93sp12.1   {us/bbi/gprun.i ""sorp1b01.p"" */
 /*93sp12.1*/   {us/bbi/gprun.i ""xfrp1b01.p"" 
         "(input parent_id,
           input level + 1,
           input order,
           input line,
           input print_lotserials)"}
   end.
end.
