/* xfrp5a09.p  -  FORMTRAP `SALES ORDER PRINT                           */
/* sorp5a01.p  -  SALES ORDER PRINT                                     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrp5a09.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 7.2            CREATED: 04/19/95   BY: rxm *F0PD*          */
/* REVISION: 8.5      LAST MODIFIED: 06/06/95   BY: DAH *J042*          */
/* REVISION: 8.5      LAST MODIFIED: 10/05/95   BY: srk *J08B*          */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: DAH *J0T0*          */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 06/05/98   BY: *L00L* Adam Harris */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 08/14/99   BY: *N01Q* Michael Amaladhas */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/23/00 BY: *N0ML* Dave Caveney     */
/* REVISION: 9.1      LAST MODIFIED: 09/13/00 BY: *N0RW* Rajinder Kamra   */
/* Revision: 1.7.1.5       BY: Kedar Deherkar     DATE: 05/27/03  ECO: *N2G0* */
/* Revision: 1.7.1.7       BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* $Revision: 1.2 $    BY: Jean Miller        DATE: 06/19/08  ECO: *R0VG* */
/* Revision: eb3sp5      BY: Shilpa Ahuja        DATE: 16/02/10  ECO: *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 23/10/12  ECO: *93sp12.1  */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

/**eb3sp5 ADDED PORTION BEGINS**/
{us/xf/xfso05v.i}
{us/xf/xfso05u.i}
{us/xf/xfdefa.i}
/**eb3sp5 ADDED PORTION ENDS**/
{us/et/etvar.i &new="new"}
{us/et/etrpvar.i &new="new"}
{us/et/etdcrvar.i "new"}

define input parameter parent as character.
define input parameter level as integer.
define input parameter order as character.
define input parameter line as integer.

define variable fillchar as character no-undo.
define variable parent_id as character no-undo.
define variable sob-qty like sob_qty_req no-undo.
define variable sob_desc like pt_desc1 no-undo.
define variable sob_desc2 like pt_desc2 no-undo.
define variable sob_um like pt_um no-undo.
define variable cont_lbl as character format "x(10)" no-undo.
define variable qty_open like sod_qty_ord
   format "->>>>>>9.9<<<<<" label "Qty Open" no-undo.
define variable ext_price like sod_price label "Ext Price"
   format "->>>,>>>,>>9.99".

define shared frame c.
define shared variable disc_prnt_label as character.
define variable hdl_disc_lbl as handle.

cont_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
   input "CONTINUE", input 10, input '*').

{us/so/sodiscwk.i} /* Shared workfile for summary discounts */

/* Set the label for the discount display */
hdl_disc_lbl = prnt_disc_amt:handle in frame disc_print.

/*93sp12.1 {us/so/so05f01.i}   */            /* INCLUDE FILE FOR FRAME C */

for first so_mstr where so_mstr.so_domain = global_domain
   and so_nbr = order
   and so_compl_stat = ""
no-lock: end.

find sod_det where sod_det.sod_domain = global_domain
   and sod_nbr = order
   and sod_line = line
   and sod_compl_stat = ""
no-lock no-error.

/*!      ***********************************************
sob_serial subfield positions:
1-4     operation number (old - now 0's)
5-10    scr    ap percent
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
CORRESPONDS TO A pt_part RECORD.  THEY CONTAIN A SYMBOLIC REFERNCE
IDENTIFIED BY BYTES 11-14 IN sob_serial.
NEW STYLE sob_det RECORDS ARE FOR SALES ORDERS CREATED
SINCE PATCH FP28 AND GK60.
*/
for each sob_det where sob_det.sob_domain = global_domain
   and sob_nbr = sod_nbr
   and sob_line = sod_line
   and sob_parent = parent
   and sob_qty_req <> 0
no-lock:

   if sod_qty_ord = 0 then
      sob-qty = 0.
   else
      sob-qty = sob_qty_req / sod_qty_ord.

   find pt_mstr where pt_mstr.pt_domain = global_domain
      and  pt_part = sob_part
   no-lock no-error.

   if available pt_mstr then do:
      sob_desc = pt_desc1.
      sob_desc2 = pt_desc2.
      sob_um = pt_um.
   end.

   parent_id = substring(sob_serial, 11, 4).

/**eb3sp5 COMMENTED PORTION BEGINS**
   if page-size - line-counter < 1 then do:
      page.
      {us/so/so05e01.i}
   end.

   fillchar = fill(".", level).

   put
      sob_feature format "x(12)" at 5 " "
      fillchar + sob_part format "x(27)"
      sob-qty " " sob_um skip.

   if sob_desc > "" then do:
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so05e01.i}
      end.
      put sob_desc at 20 skip.
   end.
   if sob_desc2 > "" then do:
      if page-size - line-counter < 1 then do:
         page.
         {us/so/so05e01.i}
      end.
      put sob_desc2 at 20 skip.
   end.
**eb3sp5 COMMENTED PORTION ENDS**/

/*eb3sp5*/ {us/xf/xfrp5amc.i}
   /*ADDED TILDE BEFORE CURLY BRACES SO FILE WOULD COMPILE*/
   /* Print discounts for component item */

/**eb3sp5 COMMENTED PORTION BEGINS**
   {us/so/sopiprn1.i &doctype="1" &nbr=sod_nbr &line=sod_line
      &part=sod_part
      &parent=sob_parent &feature=sob_feature
      &opt=sob_part
      &qty="(sob-qty * (sod_qty_ord - sod_qty_ship))"
      &list_price=sob_tot_std
      &net_price=sob_price
      &confg_disc="no"
      &command="~{us/so/so05e01.i~}"}
**eb3sp5 COMMENTED PORTION ENDS**/

/**eb3sp5 ADDED PORTION BEGINS**/
   {us/xf/xfpiprn1.i &doctype="1" 
               &nbr=sod_nbr 
               &line=sod_line
               &part=sod_part
               &parent=sob_parent 
               &feature=sob_feature
               &opt=sob_part
               &qty="(sob-qty * (sod_qty_ord - sod_qty_ship))"
               &list_price=sob_tot_std
               &net_price=sob_price
               &confg_disc="no"
               &usercode="xfso05uq.i"} 
/**eb3sp5 ADDED PORTION ENDS**/

   if parent_id <> "" then do:
     /*93sp12.1  {us/bbi/gprun.i ""sorp5a01.p"" "(input parent_id, input level + 1,
           input order, input line)"} */
    /*93sp12.1*/  {us/bbi/gprun.i ""xfrp5a09.p"" "(input parent_id, input level + 1,
            input order, input line)"}
   end.
end.
