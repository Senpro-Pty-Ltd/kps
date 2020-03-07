/* xfrp3a01.p - PURCHASE ORDER PRINT DETAIL SUBROUTINE                        */
/* porp3a01.p - PURCHASE ORDER PRINT DETAIL SUBROUTINE                        */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrp3a01.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/*                                                                            */
/* REVISION: 6.0     LAST MODIFIED: 08/14/91    BY: RAM *D828*                */
/* REVISION: 7.2     LAST MODIFIED: 03/29/95    BY: dzn *F0PN*                */
/* REVISION: 8.6     LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan         */
/* REVISION: 9.1     LAST MODIFIED: 08/13/00    BY: *N0KQ* Mark Brown         */
/* Revision: 1.3.1.4     BY: Jean Miller          DATE: 12/05/01  ECO: *P039* */
/* $Revision: 1.2 $  BY: Robin McCarthy       DATE: 05/31/06  ECO: *R02F* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*V8:ConvertMode=Report                                                       */

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/po/pocurvar.i "new"}
/*eb3sp5
{us/po/potrldef.i "new"}
*/
{us/xf/xftrldef.i "new"} /*eb3sp5*/

{us/xf/xfdefa.i} /*eb3sp5*/
/*eb3sp5 {us/po/porp0301.i &sort1 = "pod_site" &sort2 = "pod_line"} */
{us/xf/xfrp0301.i &sort1 = "pod_site" &sort2 = "pod_line"} /*eb3sp5*/
