/* xftr0509.p - DISPLAY SALES ORDER TRAILER                                  */
/* sotr0501.p - DISPLAY SALES ORDER TRAILER                                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xftr0509.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* $Revision: 1.2 $                                                  */
/*V8:ConvertMode=Report                                                      */
/* REVISION: 5.0      LAST MODIFIED: 03/29/90   BY: ftb *B642*               */
/* REVISION: 5.0      LAST MODIFIED: 08/18/90   BY: MLB *B755*               */
/* REVISION: 6.0      LAST MODIFIED: 12/21/90   BY: MLB *D238*               */
/* REVISION: 7.3      LAST MODIFIED: 03/17/93   BY: afs *G820*               */
/* REVISION: 7.3      LAST MODIFIED: 04/05/93   BY: tjs *G858*               */
/* REVISION: 7.4      LAST MODIFIED: 07/20/93   BY: bcm *H032*               */
/* REVISION: 7.4      LAST MODIFIED: 08/19/93   BY: pcd *H009*               */
/* REVISION: 7.4      LAST MODIFIED: 09/29/93   BY: tjs *H082*               */
/* REVISION: 7.4      LAST MODIFIED: 10/26/93   BY: tjs *H188*               */
/* REVISION: 7.4      LAST MODIFIED: 10/20/95   BY: jym *G0XY*               */
/* REVISION: 8.5      LAST MODIFIED: 07/13/95   BY: taf *J053*               */
/* REVISION: 8.5      LAST MODIFIED: 07/30/96   BY: *J130* Markus Barone     */
/* REVISION: 8.5      LAST MODIFIED: 08/15/97   BY: *J1Z0* Ajit Deodhar      */
/* REVISION: 8.6E     LAST MODIFIED: 04/23/98   BY: *L00L* EvdGevel          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb               */
/* $Revision: 1.2 $    BY: Katie Hilbert  DATE: 04/01/01 ECO: *P002*  */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 16/02/10  ECO: *eb3sp5* */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

define new shared variable convertmode as character no-undo
   initial "report".
define new shared variable due_date_range like mfc_logical initial no.
define new shared variable date_range     like sod_due_date.
define new shared variable date_range1    like sod_due_date.
define new shared variable new_order like mfc_logical.
define new shared variable undo_trl2 like mfc_logical.
define new shared variable display_trail like mfc_logical initial yes.
define shared variable so_recno as recid.
define new shared frame sotot.

{us/et/etvar.i}
{us/et/etdcrvar.i}
/* 93sp12.1 {us/et/etsotrla.i} */
/*eb3sp5 */ {us/xf/xfsotrla.i}

/* TAX_EDIT_LBL MUST BE BLANK */
tax_edit_lbl = "".

find so_mstr where recid(so_mstr) = so_recno
   no-lock.
maint = no.

undo_trl2 = true.
/*93sp12.1 {us/bbi/gprun.i ""sosotrl2.p""} */
/*eb3sp5*/  {us/bbi/gprun.i ""xfsotr92.p""}
if undo_trl2 then undo, leave.
