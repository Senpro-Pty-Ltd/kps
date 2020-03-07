/* xfpkg09.p  -  SALES ORDER PACKING LIST PRINT                         */
/* sopkg01.p  -  SALES ORDER PACKING LIST PRINT                         */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfpkg09.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 7.2            CREATED: 04/19/95   BY: rxm *F0PD**/
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/10/00 BY: *N0JM* Mudit Mehta      */
/* Revision: 1.5.1.4  BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L*  */
/* Revision: 1.5.1.5  BY: K Paneesh          DATE: 08/01/03  ECO: *P0VB*  */
/* Revision: 1.5.1.6     BY: Shivaraman V.       DATE: 05/11/04  ECO: *P212*  */
/* $Revision: 1.2 $  BY: Jean Miller         DATE: 06/19/08  ECO: *R0VG*  */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 30/10/12  ECO: *93sp12.1  */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

{us/xf/xfdefa.i} /*93sp12.1*/

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
define variable qty_open like sod_qty_ord
   column-label "Qty Open!Qty to Ship" format "->>>>>9.9<<<<<".
define variable cont_lbl as character format "x(9)"
   no-undo.
define shared variable rev like pt_rev.
define shared frame d.

assign
   cont_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
                                input "CONTINUE",
                                input 9,
                                input '*').

{us/so/sopkf01.i}               /* INCLUDE FILE FOR FRAME D */

find sod_det  where sod_det.sod_domain = global_domain
                and sod_nbr            = order
                and sod_line           = line
                and sod_compl_stat     = ""
no-lock no-error.

/************************************************
sob_serial subfield positions:
1-4     operation number
5-10    scrap percent
11-14   id number of this record
15-15   structure code
16-16   "y" (indicates "new" format sob_det record)
17-34   original qty per parent
35-35   original mandatory indicator (y/n)
36-36   original default indicator (y/n)
37-39   leadtime offset
*******************************************/

/* NEW STYLE sob_det RECORDS DO NOT HAVE DATA IN sob_parent THAT
CORRESPONDS TO A pt_part RECORD.  THEY CONTAIN A SYMBOLIC REFERNCE
IDENTIFIED BY BYTES 11-14 IN sob_serial.
NEW STYLE sob_det RECORDS ARE FOR SALES ORDERS CREATED
SINCE PATCH FP28 AND GK60.
*/
for each sob_det  where sob_det.sob_domain = global_domain
                    and sob_nbr            = sod_nbr
                    and sob_line           = sod_line
                    and sob_parent         = parent
                    and sob_qty_req       <> 0
                    no-lock:
   if sod_qty_ord = 0
   then
      sob-qty = 0.
   else
      sob-qty = sob_qty_req / sod_qty_ord.

   find pt_mstr where pt_mstr.pt_domain = global_domain
                  and pt_part           = sob_part
   no-lock no-error.
   if available pt_mstr
   then do:
      assign
      sob_desc  = pt_desc1
      sob_desc2 = pt_desc2
      sob_um    = pt_um.
   end. /* IF AVAILABLE pt_mstr */

   parent_id = substring(sob_serial, 11, 4).

   if page-size - line-counter < 1
   then do:
      page.
      {us/so/sopkd01.i}
   down 1 with frame d.
   end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */


   fillchar = fill(".", level).

   put
      sob_feature format "x(12)" at 5
      " "
      fillchar + sob_part format "x(27)"
      sob-qty to 64
      sob_um  at 65
      skip.

   line-counter = line-counter + 1.

   if sob_desc > ""
   then do:
      if page-size - line-counter < 1
      then do:
         page.
         {us/so/sopkd01.i}
      down 1 with frame d.
      end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

      put
         sob_desc at 20
         skip.
         line-counter = line-counter + 1.
   end. /* IF sob_desc > "" */


   if sob_desc2 > ""
   then do:
      if page-size - line-counter < 1
      then do:
         page.
         {us/so/sopkd01.i}
      down 1 with frame d.
      end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

      put
         sob_desc2 at 20
         skip.
         line-counter = line-counter + 1.
   end. /* IF sob_desc2 > "" */

{us/xf/xfpkg09mf.i} /*93sp12.1*/

   if parent_id <> ""
   then do:
     /*93sp12.1 {us/bbi/gprun.i ""sopkg01.p"" "(input parent_id, */
 /*93sp12.1*/ {us/bbi/gprun.i ""xfpkg09.p"" "(input parent_id, 
                               input level + 1,
                               input order,
                               input line)"}
   end. /* IF parent_id <> "" */
end. /* FOR EACH sob_det where sob_nbr = sod_nbr ... */
