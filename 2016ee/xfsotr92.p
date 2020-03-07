/* xfsotr92.p - SALES ORDER TRAILER - TAX MANAGEMENT                    */
/* sosotrl2.p - SALES ORDER TRAILER - TAX MANAGEMENT                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsotr92.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* $Revision: 1.2 $                                                     */
/*V8:ConvertMode=Maintenance                                            */
/* REVISION: 7.3            CREATED: 02/02/93   BY: bcm *G415*          */
/* REVISION: 7.3      LAST MODIFIED: 02/22/93   BY: afs *G692*          */
/* REVISION: 7.4      LAST MODIFIED: 06/21/93   BY: pcd *H008*          */
/* REVISION: 7.4      LAST MODIFIED: 07/01/93   BY: bcm *H002*          */
/* REVISION: 7.4      LAST MODIFIED: 07/20/93   BY: bcm *H032*          */
/* REVISION: 7.4      LAST MODIFIED: 07/28/93   BY: bcm *H042*          */
/* REVISION: 7.4      LAST MODIFIED: 09/28/93   BY: bcm *H139*          */
/* REVISION: 7.4      LAST MODIFIED: 09/29/93   BY: tjs *H082*          */
/* REVISION: 7.4      LAST MODIFIED  09/08/94   BY: bcm *H509*          */
/* REVISION: 7.4      LAST MODIFIED  11/22/94   BY: bcm *H606*          */
/* REVISION: 7.4      LAST MODIFIED  03/15/95   BY: bcm *H0C1*          */
/* REVISION: 7.4      LAST MODIFIED  04/24/95   BY: jpm *H0D9*          */
/* REVISION: 7.4      LAST MODIFIED  03/28/95   BY: tvo *H0BJ*          */
/* REVISION: 7.4      LAST MODIFIED  07/06/95   BY: jym *H0F7*          */
/* REVISION: 7.4      LAST MODIFIED: 09/21/95   BY: rxm *H0G0*          */
/* REVISION: 7.4      LAST MODIFIED: 09/25/95   BY: rxm *H0G3*          */
/* REVISION: 7.4      LAST MODIFIED: 10/02/95   BY: jym *G0XY*          */
/* REVISION: 8.5      LAST MODIFIED: 07/12/95   BY: taf *J053*          */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb          */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* $Revision: 1.2 $    BY: Jean Miller           DATE: 04/26/02  ECO: *P06H*  */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 16/02/10  ECO: *eb3sp5* */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
define shared variable convertmode as character no-undo.
define shared variable rndmthd like rnd_rnd_mthd.

if convertmode = "MAINT" then do:
  /*eb3sp5 {us/bbi/gprun.i ""sosotrld.p""} */
/*eb3sp5 */ {us/bbi/gprun.i ""xfsotr9d.p""}
end.
else do:
  /*eb3sp5 {us/bbi/gprun.i ""sosotrlc.p""} */
/*eb3sp5*/  {us/bbi/gprun.i ""xfsotr9c.p""}
end.
