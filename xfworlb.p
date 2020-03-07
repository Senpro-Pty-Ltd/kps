/* xfworlb.p - PRINT WORK ORDER PICKLIST                                      */
/* woworlb.p - PRINT WORK ORDER PICKLIST                                      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfworlb.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* $Revision: 1.2 $                                                        */
/*V8:ConvertMode=Report                                                       */
/* REVISION: 5.0          LAST EDIT: 06/14/89    MODIFIED BY: MLB             */
/* REVISION: 4.0          LAST EDIT: 01/22/90    MODIFIED BY: emb *A802*      */
/* REVISION: 6.0          LAST EDIT: 05/03/90    MODIFIED BY: MLB *D024*      */
/* REVISION: 8.6          LAST EDIT: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KC* Mark Brown         */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* $Revision: 1.2 $    BY: Manisha Sawant       DATE: 04/03/01  ECO: *P008*   */
/* REVISION: eb3sp5  CREATED: 11/02/10  BY: Shridhar M  *eb3sp5* */
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
    /*eB3sp5 */ {us/xf/xfdefa.i}
/*eB3sp5*/  {us/xf/xfworlu.i}

define shared variable picklistprinted like mfc_logical.
define shared variable deliv like wod_deliver.
define shared variable wo_des like pt_desc1.
define shared variable wo_qty like wo_qty_ord.
define shared variable wo_um like pt_um.
define shared variable wo_recno as recid.

define variable i as integer.
define variable par_rev like pt_rev.

find wo_mstr no-lock where recid(wo_mstr) = wo_recno no-error.
if not available wo_mstr then
   leave.

/* Print Picklist */
/*93sp12.1 {us/mf/mfworlb.i} */
/*eB3sp5*/ {us/xf/xfworlb.i}
