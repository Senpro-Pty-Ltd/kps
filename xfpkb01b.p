/* xfpkb01b.p - PACKING LIST PRINT - LINE ITEMS COMMENTS PRINT               */
/* sopkb01b.p - PACKING LIST PRINT - LINE ITEMS COMMENTS PRINT               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfpkb01b.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */

/* Revision: 1.1      BY: Binoy John          DATE: 12/27/04  ECO: *Q0G4* */
/* $Revision: 1.2 $   BY: Jean Miller         DATE: 06/19/08  ECO: *R0VG* */
/* REVISION: eb3sp5  CREATED: 02/14/10  BY: Shridjar M  *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*-Revision end--------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
/*eb3sp5*/ {us/xf/xfdefa.i} /*FT Global vars */

define input parameter p_nbr    like sod_nbr                 no-undo.
define input parameter p_line   like sod_line                no-undo.
define input parameter p_part   like sod_part                no-undo.
define input parameter cont_lbl as   character format "x(9)" no-undo.
define input parameter i        as   integer                 no-undo.
define input parameter qty_open like sod_qty_ord
   format "->>>>>9.9<<<<<"                                   no-undo.

define  shared frame d.

{us/so/sopkf01.i}

for first sod_det where sod_domain = global_domain
   and sod_part   = p_part
   and sod_nbr    = p_nbr
   and sod_line   = p_line
   and sod_compl_stat = ""
no-lock:

   /* PRINT LINE ITEM COMMENTS */
    /**eb3sp5 COMMENTED PORTION BEGINS**
   {us/gp/gpcmtprt.i &type=PA &id=sod_cmtindx &pos=5
      &command="~{us/so/sopkd01.i~} down 1 with frame d."}
**eb3sp5 COMMENTED PORTION ENDS**/

/*eb3sp5-93sp12.1*/  {us/xf/xfcmtpr9.i &type=PA &id=sod_cmtindx &Rectype=D}
end. /* FOR FIRST sod_det */
