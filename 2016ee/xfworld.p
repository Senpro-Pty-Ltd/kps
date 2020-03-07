/* xfworld.p - PRINT WORK ORDER ROUTING                                 */
/* woworld.p - PRINT WORK ORDER ROUTING                                 */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfworld.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* $Revision: 1.2 $                                                    */
/*V8:ConvertMode=Report                                                 */
/* REVISION: 5.0       LAST EDIT: 06/14/89    MODIFIED BY: MLB          */
/* REVISION: 8.6       LAST EDIT: 05/20/98    BY: *K1Q4* Alfred Tan     */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/10/00 BY: *N0GB* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/23/00 BY: *N0ND* Mark Brown       */
/* Old ECO marker removed, but no ECO header exists *F0PN*                */
/* $Revision: 1.2 $    BY: Katie Hilbert  DATE: 04/05/01 ECO: *P008*   */
/* REVISION: eb3sp5  CREATED: 02/11/10  BY: Shridhar M  *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* DISPLAY TITLE */
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
/*eB3sp5*/   {us/xf/xfdefa.i}
/*eB3sp5*/   {us/xf/xfworlu.i}

define shared variable routingprinted like mfc_logical.
define shared variable deliv like wod_deliver.
define shared variable barcode like mfc_logical.
define shared variable wo_des like pt_desc1.
define shared variable wo_qty like wo_qty_ord.
define shared variable wo_um like pt_um.
define shared variable wo_recno as recid.
define shared variable print_loc like mfc_logical.
define shared variable prd_recno as recid.
define variable wc_description like wc_desc.
define variable i as integer.
define variable par_rev like pt_rev.

find wo_mstr no-lock where recid(wo_mstr) = wo_recno no-error.
if not available wo_mstr then leave.

find prd_det where recid(prd_det) = prd_recno no-lock no-error.

/*93sp12.1 {us/mf/mfworld.i} /* PRINT ROUTING */ */
/*eB3sp5*/   {us/xf/xfworld.i}
