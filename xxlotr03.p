/* xxlotr03.p - INVENTORY TRANSFER WITH LOT/SERIAL CHANGE                     */
/* iclotr03.p - INVENTORY TRANSFER WITH LOT/SERIAL CHANGE                     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxlotr03.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* $Revision: 1.2 $                                                           */
/*V8:ConvertMode=Maintenance                                                  */
/* REVISION: 7.0      LAST MODIFIED: 07/02/92    BY: pma *F701*               */
/* REVISION: 8.6      LAST MODIFIED: 06/11/96    BY: aal *K001*               */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00    BY: *N0KS* Mark Brown        */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.7      BY: Jean Miller           DATE: 12/10/01  ECO: *P03H*   */
/* $Revision: 1.2 $       BY: Manjusha Inglay       DATE: 08/16/02  ECO: *N1QP*   */
/* $Revision: 1.2 $   BY: Dorota Hohol      DATE: 08/25/03 ECO: *P112* */
/* CYB               LAST MODIFIED: 08-SEP-2011 BY: gbg *cy1033*        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/cxcustom.i "ICLOTR03.P"}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

define new shared variable trtype as character.
{&ICLOTR03-P-TAG1}
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}

trtype = "LOT/SER".
/*cy1033*  {us/bbi/gprun.i ""iclotr.p""} */
/*cy1033*/ {us/bbi/gprun.i ""xxiclotr.p""}
