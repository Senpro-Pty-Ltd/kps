/* xfsq5a09.p  -  SALES QUOTE PRINT                                        */
/* sqrp5a01.p  -  SALES ORDER PRINT                                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsq5a09.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* $Revision: 1.2 $                                                       */
/* REVISION: 7.2           CREATED: 04/19/95   BY: rxm *F0PD*                 */
/* REVISION: 8.5     LAST MODIFIED: 06/15/95   BY: DAH *J042*                 */
/* REVISION: 8.5     LAST MODIFIED: 10/05/95   BY: srk *J08B*                 */
/* REVISION: 8.5     LAST MODIFIED: 06/13/96   BY: DAH *J0T0*                 */
/* REVISION: 8.6E    LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane           */
/* REVISION: 8.6E    LAST MODIFIED: 24/04/98   BY: *L00L* Adam Harris         */
/* REVISION: 8.6E    LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan          */
/* REVISION: 8.6E    LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan          */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane    */
/* REVISION: 9.1     LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown          */
/* REVISION: 9.1     LAST MODIFIED: 11/20/00   BY: *N0TW* Jean Miller         */
/* Revision: 1.7.1.5      BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00M*  */
/* $Revision: 1.2 $   BY: Jean Miller        DATE: 05/05/06  ECO: *R047*  */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 18/02/10  ECO: *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
/*eb3sp5 */ {us/xf/xfdefa.i}

{us/et/etdcrvar.i "new"}

define input parameter parent as character.
define input parameter level as integer.
define input parameter order as character.
define input parameter line as integer.

define shared variable disc_prnt_label as character.

define variable fillchar     as character no-undo.
define variable parent_id    as character no-undo.
define variable qob_desc     like pt_desc1 no-undo.
define variable qob_desc2    like pt_desc2 no-undo.
define variable qob_um       like pt_um no-undo.
define variable qob-qty      like qob_qty_req no-undo.
define variable cont_lbl     as character format "x(10)" no-undo.
define variable hdl_disc_lbl as handle.
define variable ext_price    like qod_price label "Ext Price"
   format "->>>,>>>,>>9.99" no-undo.

define shared frame c.

cont_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
   input "CONTINUE",
   input 10,
   input '*').

{us/so/sodiscwk.i} /*Shared workfile for summary discounts*/

/* Set the label for the discount display */
hdl_disc_lbl = prnt_disc_amt:handle in frame disc_print.

/* INCLUDE FILE FOR FRAME C */
{us/sq/sq05f01.i}

find qod_det where qod_domain = global_domain
               and qod_nbr    = substring(order,8,8)
               and qod_line   = line
no-lock no-error.

find first qo_mstr 
   where qo_domain  = global_domain
     and qo_nbr     = qod_nbr
   no-lock no-error.                

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
 * CORRESPONDS TO A pt_part RECORD.  THEY CONTAIN A SYMBOLIC REFERENCE
 * IDENTIFIED BY BYTES 11-14 IN sob_serial.  sob_det RECORDS ARE USED
 * FOR NEW STYLE QUOTES BY PREFIXING qo_nbr WITH "qod_det" INSTEAD
 * OF USING qob_det RECORDS.
*/
for each sob_det where
         sob_domain = global_domain
     and sob_nbr = order
     and sob_line = qod_line
     and sob_parent = parent
     and sob_qty_req <> 0
no-lock:

   if qod_rel_chg = 0 then
      qob-qty = 0.
   else
      qob-qty = sob_qty_req / qod_qty_quot.

   find pt_mstr where pt_domain = global_domain
                  and pt_part = sob_part
   no-lock no-error.

   if available pt_mstr then
      assign
         qob_desc = pt_desc1
         qob_desc2 = pt_desc2
         qob_um = pt_um.

   parent_id = substring(sob_serial, 11, 4).

   if page-size - line-counter < 1 then do:
      page.
      {us/sq/sq05e01.i}
   end.

   fillchar = fill(".", level).

   put
      sob_feature format "x(12)" at 5 " "
      fillchar + sob_part format "x(27)"
      qob-qty " " qob_um.

   if qob_desc > "" then do:
      if page-size - line-counter < 1 then do:
         page.
         {us/sq/sq05e01.i}
      end.

      put qob_desc at 20 skip.
   end.
/*eb3sp5 */ {us/xf/xfsq5amd.i}

   if qob_desc2 > "" then do:
      if page-size - line-counter < 1 then do:
         page.
         {us/sq/sq05e01.i}
      end.

      put qob_desc2 at 20 skip.
   end.

   /*ADDED TILDE BEFORE CURLY BRACES SO FILE WOULD COMPILE*/
   /*Print discounts for component item*/
/**eb3sp5 COMMENTED PORTION BEGINS**
   {us/so/sopiprn1.i &doctype="2" &nbr=qod_nbr &line=qod_line
      &part=qod_part
      &parent=sob_parent &feature=sob_feature
      &opt=sob_part
      &qty="(qob-qty * qod_rel_chg)"
      &list_price=sob_tot_std
      &net_price=sob_price
      &confg_disc="no"
      &command="~{us/sq/sq05e01.i~}"}
**eb3sp5 COMMENTED PORTION ENDS**/
/**eb3sp5 ADDED PORTION BEGINS**/
   {us/xf/xfpiprn1.i &doctype="2" 
       &nbr=qod_nbr 
       &line=qod_line
       &part=qod_part
       &parent=sob_parent 
       &feature=sob_feature
       &opt=sob_part
       &qty="(qob-qty * qod_rel_chg)"
       &list_price=sob_tot_std
       &net_price=sob_price
       &confg_disc="no"}
/**eb3sp5 ADDED PORTION ENDS**/

   if parent_id <> "" then do:
/**eb3sp5 COMMENTED PORTION BEGINS**
      {us/bbi/gprun.i ""sqrp5a01.p""
         "(input parent_id,
           input level + 1,
           input order,
           input line)"}
**eb3sp5 COMMENTED PORTION ENDS**/
/**eb3sp5 ADDED PORTION BEGINS**/
      {us/bbi/gprun.i ""xfsq5a09.p"" 
                "(input parent_id, 
                  input level + 1,
                  input order,
                  input line)"}
/**eb3sp5 ADDED PORTION ENDS**/           
   end.

end. /* for each sob_det */
