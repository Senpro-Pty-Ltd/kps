/* xfsotr9c.p - DISPLAY INVOICE TRAILER                                       */
/* sosotrlc.p - DISPLAY INVOICE TRAILER                                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsotr9c.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* $Revision: 1.2 $                                                       */
/*V8:ConvertMode=Report                                                       */
/* REVISION: 7.3           CREATED:  10/02/95   BY: JYM *G0XY*                */
/* REVISION: 8.5       MODIFIED ON:  03/18/97   BY: *J1L9* Aruna Patil        */
/* REVISION: 8.6E    LAST MODIFIED:  04/15/98   BY: *L00L* LN/SVA             */
/* REVISION: 8.6E    LAST MODIFIED:  05/05/98   BY: *L00L* EvdGevel           */
/* REVISION: 8.6E    LAST MODIFIED:  05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E    LAST MODIFIED:  06/23/98   BY: *L01G* R. McCarthy        */
/* REVISION: 8.6E    LAST MODIFIED:  08/28/98   BY: *J2XT* Poonam Bahl        */
/* REVISION: 9.1     LAST MODIFIED:  08/12/00   BY: *N0KN* Mark Brown         */
/* $Revision: 1.2 $  BY: Jean Miller         DATE: 04/10/02  ECO: *P058*  */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 16/02/10  ECO: *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

define variable msg-arg as character format "x(20)" no-undo.

/*V8!
&SCOPED-DEFINE PP_GUI_CONVERT_MODE REPORT
*/

/*eb3sp5*/ {us/xf/xfdefa.i}
/**eb3sp5 COMMENTED PORTION BEGINS**
{us/so/sosotrl2.i &sod_for_each=" and (not due_date_range or
   (due_date_range and sod_confirm and (sod_due_date = ? or
   (sod_due_date >= date_range and sod_due_date <= date_range1))))"}
**eb3sp5 COMMENTED PORTION ENDS**/

/**eb3sp5 ADDED PORTION BEGINS**/
{us/xf/xfsotr92.i &sod_for_each=" and (not due_date_range or
   (due_date_range and sod_confirm and (sod_due_date = ? or
   (sod_due_date >= date_range and sod_due_date <= date_range1))))"}
/**eb3sp5 ADDED PORTION ENDS**/
