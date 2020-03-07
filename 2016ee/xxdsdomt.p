/* xxdsdomt.p - DISTRIBUTION ORDER MAINTENANCE                                */
/* dsdomt.p - DISTRIBUTION ORDER MAINTENANCE                                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdsdomt.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/* $Revision: 1.2 $                                                      */
/*V8:ConvertMode=Maintenance                                                  */
/* REVISION: 7.0      LAST MODIFIED: 01/10/92   BY: emb                       */
/* REVISION: 7.0      LAST MODIFIED: 03/31/92   BY: emb *F225*                */
/* REVISION: 7.0      LAST MODIFIED: 05/29/92   BY: emb *F611*                */
/* REVISION: 7.0      LAST MODIFIED: 07/13/92   BY: emb *F810*                */
/* REVISION: 7.0      LAST MODIFIED: 09/02/92   BY: emb *F868*                */
/* REVISION: 7.3      LAST MODIFIED: 09/27/93   BY: jcd *G247*                */
/* REVISION: 7.3      LAST MODIFIED: 01/07/93   BY: emb *G526*                */
/* REVISION: 7.3      LAST MODIFIED: 07/15/93   BY: emb *GD45*                */
/* REVISION: 7.3      LAST MODIFIED: 08/25/94   BY: rxm *GL46*                */
/* REVISION: 8.5      LAST MODIFIED: 10/19/94   BY: mwd *J034*                */
/* REVISION: 7.3      LAST MODIFIED: 02/10/95   BY: pxd *G0DT*                */
/* REVISION: 7.3      LAST MODIFIED: 02/17/95   BY: srk *G0FL*                */
/* REVISION: 7.3      LAST MODIFIED: 03/03/95   BY: pxd *F0DX*                */
/* REVISION: 7.3      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.3      LAST MODIFIED: 04/03/95   BY: pxd *F0PZ*                */
/* REVISION: 7.3      LAST MODIFIED: 10/23/95   BY: str *G19V*                */
/* REVISION: 7.3      LAST MODIFIED: 11/16/95   BY: qzl *G1DK*                */
/* REVISION: 8.5      LAST MODIFIED: 01/07/97   BY: *H0QN* Julie Milligan     */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 08/04/98   BY: *J2RN* Thomas Fernandes   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 12/15/98   BY: *J34F* Vijaya Pakala      */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Patti Gaultney     */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00   BY: *N0KK* Jacolyn Neder      */
/* REVISION: 9.1      LAST MODIFIED: 09/07/00   BY: *N0MX* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 11/06/00   BY: *N0TN* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 09/18/00   BY: *N0W6* Mudit Mehta        */
/* Revision: 1.23     BY: Vivek Gogte           DATE: 03/29/01 ECO: *M10G*    */
/* $Revision: 1.2 $    BY: Samir Bavkar    DATE: 07/31/01 ECO: *P009*    */
/* Revision:2009.1EE  BY: Vishal Agarwal  DATE: 26/01/11 ECO: *Q9028-CRD07*   */
/* CYB    LAST MODIFIED: 02-OCT-2012    BY:  gbg *c1347*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "x2 "}  /*d2101*/

/* INPUT PARAMETERS BELOW ARE BLANK OR FALSE BECAUSE DO MAINTENANCE IS BEING  */
/* CALLED DIRECTLY FROM THE MENU HERE. WHEN CALLED AS A SUB-PROCESS FROM      */
/* DO PROCESSING (dsdomt02.p) IT NEEDS THE INFORMATION PASSED IN TO IT.       */
/*q9028* {us/bbi/gprun.i ""dsdomt2a.p"" */
/*q9028*/ {us/bbi/gprun.i ""xxdomt2a.p""
          "(input false,    /* Auto DO Processing = false */
            input '',       /* DO Order Number */
            input '',       /* DO Ship Site */
            input '')"}     /* DO Receipt Site */
