/* xfpke09.p - TOTAL DETAIL ALLOCATIONS FOR A SALES ORDER LINE               */
/* sopke01.p - TOTAL DETAIL ALLOCATIONS FOR A SALES ORDER LINE               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfpke09.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 01/06/92   BY: afs *G511**/
/* REVISION: 7.3      LAST MODIFIED: 01/14/94   BY: afs *FL21**/
/* REVISION: 7.3      LAST MODIFIED: 07/26/96   BY: *Ajit Deodhar* **F0XH**/
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan     */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan     */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00 BY: *N0JM* Mudit Mehta      */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *F0XH*                    */
/* Old ECO marker removed, but no ECO header exists *F444*                    */
/* Revision: 1.6.1.4     BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L*  */
/* Revision: 1.6.1.6     BY: Jean Miller         DATE: 05/05/06  ECO: *R047*  */
/* $Revision: 1.2 $  BY: Jean Miller         DATE: 06/19/08  ECO: *R0VG*  */
/* REVISION: eb3sp5  CREATED: 02/14/10  BY: Shriahr M  *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
/**tsg001 ADDED PORTION BEGINS**/
 {us/xf/xfsopku.i}
 {us/xf/xfsopkv.i}
 {us/xf/xfdefa.i} /*FT Global vars */
/**tsg001 ADDED PORTION ENDS**/
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

{us/px/pxmaint.i}
{us/px/pxphdef.i caisxr}
{us/px/pxphdef.i capfxr}

{us/ca/cattdef.i}

define new shared variable lad_recno as recid.

define shared variable tot_qty_all like lad_qty_all.
define shared variable alc_sod_nbr like sod_nbr.
define shared variable alc_sod_line like sod_line.

define variable cont_lbl as character format "x(12)" no-undo.
define variable qty_all like lad_qty_all.
define variable qty_open like sod_qty_ord column-label "Qty Open!Qty to Ship"
   format "->>>>>9.9<<<<<".
define variable ext_price like sod_price label "Ext Price"
   format "->>,>>>,>>9.99".
define variable desc1 like pt_desc1.
define variable qtyshipped as character format "x(8)"
   initial "(      )" label " Shipped".
define variable rev like pt_rev.
define variable msg-desc like msg_desc no-undo.
define variable conformingLabel as character no-undo.

define shared frame d.

assign
   cont_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
   input "CONTINUE", input 12, input '*').

{us/so/sopkf01.i}  /* Define shared frame d for sales order lines */

find first icc_ctrl where icc_domain = global_domain
no-lock no-error.

find sod_det where sod_domain = global_domain
               and sod_nbr = alc_sod_nbr
               and sod_line = alc_sod_line
               and sod_compl_stat = ""
no-lock.

/*DISPLAY ALLOCATION DETAIL*/
for each lad_det where lad_domain = global_domain
      and lad_dataset = "sod_det"
      and lad_nbr = sod_nbr
      and lad_line = string(sod_line)
with frame d:

   find ld_det where ld_domain = global_domain
      and ld_site = lad_site
      and ld_loc  = lad_loc
      and ld_part = lad_part
      and ld_lot  = lad_lot
      and ld_ref  = lad_ref
   no-lock no-error.

   if ld_expire <= today + icc_iss_days then next.

   qty_all = lad_qty_all.
   accumulate lad_qty_all (total).

   lad_recno = recid(lad_det).
   {us/bbi/gprun.i ""sosopke.p""}

   if page-size - line-counter < 1 then do:
      page.
      /*DISPLAY CONTINUED*/
      {us/so/sopkd01.i}
      down 1 with frame d.
   end.

   {us/so/sopkc01.i}

   {us/px/pxrun.i &PROC='getSOLineProfile'
                  &PROGRAM='capfxr.p'
                  &HANDLE=ph_capfxr
                  &PARAM="(input sod_nbr,
                           input sod_line,
                           output table tt_attrpf_mstr by-reference,
                           output table tt_attrpfd_det by-reference)"
                  &NOAPPERROR=true
                  &CATCHERROR=true
   }

   if can-find(first tt_attrpf_mstr) then do:

      {us/px/pxrun.i &PROC='getConformingLabelForInvAttrSpecByKeys'
                     &PROGRAM='caisxr.p'
                     &HANDLE=ph_caisxr
                     &PARAM="(input 0.0,
                              input lad_part,
                              input lad_site,
                              input lad_loc,
                              input lad_lot,
                              input lad_ref,
                              input sod_nbr,
                              input sod_line,
                              output conformingLabel)"
                     &NOAPPERROR=true
                     &CATCHERROR=true
      }

      down 1 with frame d.
      display
         conformingLabel @ lad_lot
      with frame d.
   end.

   down 1 with frame d.

   /*IF QTY OH - QTY ALL TO OTHER ORDERS < QTY ALL TO THIS ORDER*/
   if not available ld_det
      or ld_qty_oh - ld_qty_all + lad_qty_all < lad_qty_all
   then do:

      if page-size - line-counter < 1 then do:
         page.
         /*DISPLAY CONTINUED*/
         {us/so/sopkd01.i}
         down 1 with frame d.
      end.

      /* Quantity not available at this location */
      {us/bbi/pxmsg.i &MSGNUM=4992 &ERRORLEVEL=1 &MSGBUFFER=msg-desc}
/* eb3sp5
      put msg-desc at 20 skip.
 */     

   end.
   /*eb3sp5*/ {us/xf/xfpke09mc.i}
end.

tot_qty_all = accum total (lad_qty_all).
/*93sp12.1 put skip(1). */
