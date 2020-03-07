/* xfqotrl2.p - QUOTE TRAILER FOR {txnew.i}                             */
/* sqqotrl2.p - QUOTE TRAILER FOR GTM                                   */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfqotrl2.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* $Revision: 1.2 $                                                     */
/*V8:ConvertMode=Maintenance                                            */

/* REVISION: 7.3            CREATED: 02/02/93   BY: bcm *G414*          */
/* REVISION: 7.4      LAST MODIFIED: 06/07/93   BY: wep *H005*          */
/* REVISION: 7.4      LAST MODIFIED: 07/14/93   BY: bcm *H030*          */
/* REVISION: 7.4      LAST MODIFIED: 07/28/93   BY: bcm *H042*          */
/* REVISION: 7.4      LAST MODIFIED: 09/29/93   BY: tjs *H082*          */
/* REVISION: 7.4      LAST MODIFIED: 09/08/94   BY: bcm *H509*          */
/* REVISION: 7.4      LAST MODIFIED: 11/22/94   BY: bcm *H606*          */
/* REVISION: 7.4      LAST MODIFIED: 07/06/95   BY: jym *H0F7*          */
/* REVISION: 7.4      LAST MODIFIED: 09/25/95   BY: rxm *H0G3*          */
/* REVISION: 7.4      LAST MODIFIED: 10/09/95   BY: jym *G0YN*          */
/* REVISION: 8.5      LAST MODIFIED: 06/20/95   BY: taf *J053*          */
/* REVISION: 8.6E     LAST MODIFIED: 24/04/98   BY: Adma Harris    *L00L*/
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown   */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *H032*                    */
/* $Revision: 1.2 $    BY: Jean Miller           DATE: 04/26/02  ECO: *P06H*  */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 18/02/10  ECO: *eb3sp5* */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}

define shared variable convertmode as character no-undo.
define shared variable rndmthd      like gl_rnd_mthd.

if convertmode = "MAINT" then do:
  /*93sp12.1 {us/bbi/gprun.i ""sqqotrld.p""} */
/*eb3sp5*/ {us/bbi/gprun.i ""xfqotrld.p""}
end.
else do:
   /*93sp12.1 {us/bbi/gprun.i ""sqqotrlc.p""} */
/*eb3sp5*/ {us/bbi/gprun.i ""xfqotrlc.p""}
end.
