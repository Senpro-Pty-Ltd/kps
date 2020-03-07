/* xfrp10c.p  - SALES ORDER INVOICE PRINT FOR ENGLISH PRINT CODE "1"          */
/* sorp10c.p  - SALES ORDER INVOICE PRINT FOR ENGLISH PRINT CODE "1"          */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrp10c.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 03/18/96   BY: ais *G1QW*                */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* Revision: 1.2.1.3       BY: Jean Miller        DATE: 12/07/01  ECO: *P03F* */
/* Revision: 1.2.1.5       BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* $Revision: 1.2 $    BY: Jean Miller        DATE: 06/19/08  ECO: *R0VG* */
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
{us/xf/xfdefa.i} /*eb3sp5*/

define shared variable so_recno as recid.

define variable multbol_lab as character format "x(6)" no-undo.

define buffer somstr2 for so_mstr.

form
   multbol_lab    no-label
   qad_key1       no-label
   qad_key2       label "BOL"      format "x(18)"
   qad_charfld[2] label "Ship Via" format "x(20)"
with side-labels down frame multbol width 80 no-box.

/* SET EXTERNAL LABELS */
setFrameLabels(frame multbol:handle).

form
   qad_charfld[1] label "Site" at 16
   qad_charfld[3] label "Remarks" format "x(40)"
with side-labels down frame multbol2 width 80 no-box.

/* SET EXTERNAL LABELS */
setFrameLabels(frame multbol2:handle).

find so_mstr no-lock where recid(so_mstr) = so_recno.

for each somstr2 where somstr2.so_domain = global_domain and
         somstr2.so_inv_nbr = so_mstr.so_inv_nbr and
         somstr2.so_compl_stat = ""
no-lock
break by somstr2.so_inv_nbr:

   for each qad_wkfl where qad_wkfl.qad_domain = global_domain
      and qad_key1 = somstr2.so_nbr
      and r-index(qad_key2,"utsoship") > 0
      and qad_charfld[4] = " "
   exclusive-lock
   /* break by somstr2.so_nbr with frame multbol: *eb3sp5*/
   break by somstr2.so_nbr : /*eb3sp5*/
      /*eb3sp5 comment begin
      if first-of(somstr2.so_nbr) or line-count = 1 then
         display
            getTermLabelRtColon("ORDER",6) @ multbol_lab
            qad_key1.

      display
         substring(qad_key2,1,((r-index(qad_key2,"utsoship")) - 1)) @ qad_key2
         qad_charfld[2].

      display
         qad_charfld[1]
         qad_charfld[3]
      with frame multbol2.

      down.
      eb3sp5 comment end*/
      assign qad_key3 = so_mstr.so_inv_nbr.

      /*eb3sp5 comment begin
      if page-size - line-count < 1 then
         page.
      eb3sp5 comment end*/
      {us/xf/xfrp109cmt.i} /*eb3sp5*/

   end. /* for each qad_wkfl */

end.  /* get all sales order numbers printed */
