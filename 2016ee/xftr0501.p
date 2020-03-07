/* xftr0501.p - PRINT QUOTE TRAILER                                     */
/* sqtr0501.p - PRINT QUOTE TRAILER                                     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xftr0501.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* $Revision: 1.2 $                                                */
/*V8:ConvertMode=Report                                                 */
/* REVISION: 7.0      LAST MODIFIED: 03/20/92   BY: tjs *F300**/
/* REVISION: 7.0      LAST MODIFIED: 03/26/92   BY: tmd *F324**/
/* REVISION: 7.3      LAST MODIFIED: 10/13/92   BY: tjs *G178**/
/* REVISION: 7.3      LAST MODIFIED: 03/17/93   BY: bcm *G832**/
/* REVISION: 7.3      LAST MODIFIED: 03/17/93   BY: afs *G820**/
/* REVISION: 7.4      LAST MODIFIED: 07/14/93   BY: bcm *H030**/
/* REVISION: 7.4      LAST MODIFIED: 09/29/93   BY: tjs *H082**/
/* REVISION: 7.4      LAST MODIFIED: 10/03/95   BY: jym *G0YN**/
/* REVISION: 8.5      LAST MODIFIED: 07/06/95   BY: taf *J053**/
/* REVISION: 8.5      LAST MODIFIED: 05/16/97   BY: *J1RR* Suresh Nayak */
/* REVISION: 8.5      LAST MODIFIED: 08/14/97   BY: *J1Z0* Ajit Deodhar */
/* REVISION: 8.6E     LAST MODIFIED: 18/04/98   BY: Adam Harris *L00L*   */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan    */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan    */
/* REVISION: 9.0      LAST MODIFIED: 02/06/99   BY: *M06R* Doug Norton   */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan    */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb              */
/* $Revision: 1.2 $    BY: Katie Hilbert  DATE: 04/01/01 ECO: *P002* */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 18/02/10  ECO: *eb3sp5* */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

{us/et/etdcrvar.i}
{us/et/etvar.i}
{us/et/etrpvar.i}

define new shared variable convertmode as character no-undo
   initial "report".
define new shared variable new_order like mfc_logical.
define new shared variable display_trail like mfc_logical initial yes.
define new shared variable calc_open_qty like mfc_logical initial no.

define shared variable qo_recno as recid.
define shared variable tax_date like qo_tax_date.
define shared variable rndmthd like rnd_rnd_mthd.

{us/mf/mfsqtrla.i}  /* like mfsotrla.i */

find qo_mstr where recid(qo_mstr) = qo_recno
   exclusive-lock.
maint = no.

if qo_tax_date <> ? then tax_date = qo_tax_date.
else if qo_due_date <> ? then tax_date = qo_due_date.
else tax_date = qo_ord_date.

undo_trl2 = true.
/*eb3sp5 {us/bbi/gprun.i ""sqqotrl2.p""} */
/*eb3sp5*/ {us/bbi/gprun.i ""xfqotrl2.p""}
if undo_trl2 then undo, leave.
