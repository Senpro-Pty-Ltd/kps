/* xxdois.p - DISTRIBUTION ORDER ISSUE                                        */
/* dsdois.p - DISTRIBUTION ORDER ISSUE                                        */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdois.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/* REVISION: 7.0       LAST MODIFIED: 01/27/92   BY: emb                      */
/* REVISION: 7.0       LAST MODIFIED: 03/31/92   BY: emb *F225*               */
/* REVISION: 7.0       LAST MODIFIED: 04/07/92   BY: emb *F362*               */
/* REVISION: 7.0       LAST MODIFIED: 05/29/92   BY: emb *F611*               */
/* REVISION: 7.0       LAST MODIFIED: 07/13/92   BY: emb *F810*               */
/* REVISION: 7.3       LAST MODIFIED: 09/27/93   BY: jcd *G247*               */
/* REVISION: 7.3       LAST MODIFIED: 01/08/93   BY: emb *G528*               */
/* REVISION: 7.3       LAST MODIFIED: 05/19/93   BY: pma *GB23*               */
/* REVISION: 7.3       LAST MODIFIED: 06/11/93   BY: emb *GD41*               */
/* REVISION: 7.4       LAST MODIFIED: 07/22/93   BY: pcd *H039*               */
/* REVISION: 7.4       LAST MODIFIED: 11/19/93   BY: pxd *H233* rev only      */
/* REVISION: 7.3       LAST MODIFIED: 08/25/94   BY: rxm *GL46*               */
/* REVISION: 7.3       LAST MODIFIED: 09/15/94   BY: ljm *GM57*               */
/* REVISION: 8.5       LAST MODIFIED: 12/09/94   BY: taf *J038*               */
/* REVISION: 8.5       LAST MODIFIED: 12/09/94   BY: mwd *J034*               */
/* REVISION: 8.5       LAST MODIFIED: 01/05/95   BY: ktn *J041*               */
/* REVISION: 7.2       LAST MODIFIED: 01/23/95   BY: ais *F0G0*               */
/* REVISION: 7.4       LAST MODIFIED: 03/29/95   BY: dzn *F0PN*               */
/* REVISION: 8.5       LAST MODIFIED: 05/17/95   BY: sxb *J04D*               */
/* REVISION: 8.5       LAST MODIFIED: 05/26/95   BY: tjs *J04H*               */
/* REVISION: 7.2       LAST MODIFIED: 05/31/95   BY: emb *F0T4*               */
/* REVISION: 7.2       LAST MODIFIED: 11/17/95   BY: qzl *F0W7*               */
/* REVISION: 7.3       LAST MODIFIED: 12/11/95   BY: qzl *G1FY*               */
/* REVISION: 8.5       LAST MODIFIED: 01/05/96   BY: kxn *J09L*               */
/* REVISION: 8.5       LAST MODIFIED: 05/01/96   BY: jym *G1MN*               */
/* REVISION: 8.6       LAST MODIFIED: 06/11/96   BY: ejh *K001*               */
/* REVISION: 8.6       LAST MODIFIED: 08/14/96   BY: *G2C7* Russ Witt         */
/* REVISION: 8.6       LAST MODIFIED: 10/18/96   BY: *J16H* Russ Witt         */
/* REVISION: 8.6       LAST MODIFIED: 12/23/96   BY: *J1BS* Julie Milligan    */
/* REVISION: 8.6       LAST MODIFIED: 12/26/96   BY: *H0NH* Julie Milligan    */
/* REVISION: 8.6       LAST MODIFIED: 01/05/97   BY: *J1DH* Julie Milligan    */
/* REVISION: 8.6       LAST MODIFIED: 03/25/97   BY: *K04X* Steve Goeke       */
/* REVISION: 8.6       LAST MODIFIED: 03/05/97   BY: *H0S5* Julie Milligan    */
/* REVISION: 8.6E      LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane         */
/* REVISION: 8.6E      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6E      LAST MODIFIED: 09/09/98   BY: *J2Z7* Sandesh Mahagaokar*/
/* REVISION: 8.6E      LAST MODIFIED: 02/27/99   BY: *J3B5* G.Latha           */
/* REVISION: 9.1       LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1       LAST MODIFIED: 07/17/00   BY: *M0PQ* Falguni Dalal     */
/* REVISION: 9.1       LAST MODIFIED: 08/11/00   BY: *N0KK* Jacolyn Neder     */
/* REVISION: 9.1       LAST MODIFIED: 08/23/00   BY: *N0MX* Mudit Mehta       */
/* REVISION: 9.1       LAST MODIFIED: 10/04/00   BY: *J3M4* Vandna Rohira     */
/* Revision: 1.12.1.11    BY: Samir Bavkar  DATE: 07/31/01 ECO: *P009*   */
/* $Revision: 1.2 $   BY: Dan Herman    DATE: 11/01/04 ECO: *M1L8*   */
/* CYB    LAST MODIFIED: 02-JUN-2010    BY:  gbg *cy1005*                    */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* DISPLAY TITLE */
{us/mf/mfdtitle.i}
 
/* SUPPRESS DISPLAY OF SCREEN TITLE IN API MODE */
{us/mf/mfaititl.i}
 
/* INPUT PARAMETERS BELOW ARE BLANK OR FALSE BECAUSE DO SHIPMENTS IS BEING    */
/* CALLED DIRECTLY FROM THE MENU HERE. WHEN CALLED AS A SUB-PROCESS FROM      */
/* DO PROCESSING (dsdomt02.p) IT NEEDS THE INFORMATION PASSED IN TO IT.       */
/*cy1005*  {us/bbi/gprun.i ""dsdois01.p"" */
/*cy1005*/ {us/bbi/gprun.i ""xxdois01.p""
          "(input false,    /* Auto DO Processing = false */
            input '',       /* DO Order Number */
            input '',       /* DO Ship Site */
            input '')"}     /* DO Receipt Site */
