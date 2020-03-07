/* xxsoivmt.p - INVOICE MAINTENANCE                                           */
/* soivmt.p - INVOICE MAINTENANCE                                             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoivmt.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/*                                                                            */
/* REVISION: 1.0      LAST MODIFIED: 08/31/86   BY: pml *17*                  */
/* REVISION: 6.0      LAST MODIFIED: 03/22/90   BY: ftb *D013*                */
/* REVISION: 6.0      LAST MODIFIED: 03/22/90   BY: ftb *D007*                */
/* REVISION: 6.0      LAST MODIFIED: 04/05/90   BY: ftb *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 06/29/90   BY: WUG *D043*                */
/* REVISION: 6.0      LAST MODIFIED: 08/16/90   BY: MLB *D055*                */
/* REVISION: 6.0      LAST MODIFIED: 10/17/90   BY: pml *D109*                */
/* REVISION: 6.0      LAST MODIFIED: 12/11/90   BY: MLB *D238*                */
/* REVISION: 6.0      LAST MODIFIED: 01/02/91   BY: dld *D259*                */
/* REVISION: 6.0      LAST MODIFIED: 01/19/91   BY: dld *D316*                */
/* REVISION: 6.0      LAST MODIFIED: 02/13/91   BY: afs *D348*(rev only)      */
/* REVISION: 6.0      LAST MODIFIED: 03/08/91   BY: dld *D409*                */
/* REVISION: 6.0      LAST MODIFIED: 03/18/91   BY: MLB *D443*                */
/* REVISION: 6.0      LAST MODIFIED: 06/18/91   BY: emb *D710*                */
/* REVISION: 6.0      LAST MODIFIED: 07/07/91   BY: afs *D747*(rev only)      */
/* REVISION: 6.0      LAST MODIFIED: 07/08/91   BY: afs *D751*(rev only)      */
/* REVISION: 6.0      LAST MODIFIED: 07/13/91   BY: afs *D767*                */
/* REVISION: 6.0      LAST MODIFIED: 08/14/91   BY: MLV *D825*                */
/* REVISION: 7.0      LAST MODIFIED: 09/17/91   BY: MLV *F015*                */
/* REVISION: 6.0      LAST MODIFIED: 09/19/91   BY: afs *F040*                */
/* REVISION: 7.0      LAST MODIFIED: 10/29/91   BY: MLV *F029*                */
/* REVISION: 6.0      LAST MODIFIED: 11/14/91   BY: afs *D928*                */
/* REVISION: 7.0      LAST MODIFIED: 11/16/91   BY: pml *F048*                */
/* REVISION: 7.0      LAST MODIFIED: 01/16/92   BY: afs *F038*                */
/* REVISION: 7.0      LAST MODIFIED: 01/17/92   BY: afs *F039*                */
/* REVISION: 7.0      LAST MODIFIED: 01/18/92   BY: afs *F042*                */
/* REVISION: 7.0      LAST MODIFIED: 02/13/92   BY: tjs *F191*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 03/02/92   BY: tjs *F247*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 03/18/92   BY: tjs *F273*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 03/22/92   BY: TMD *F263*                */
/* REVISION: 7.0      LAST MODIFIED: 03/25/92   BY: dld *F297*                */
/* REVISION: 7.0      LAST MODIFIED: 03/31/92   BY: afs *F338*                */
/* REVISION: 7.0      LAST MODIFIED: 04/01/92   BY: afs *F344*                */
/* REVISION: 7.0      LAST MODIFIED: 04/02/92   BY: afs *F253*                */
/* REVISION: 7.0      LAST MODIFIED: 04/02/92   BY: dld *F349*                */
/* REVISION: 7.0      LAST MODIFIED: 04/08/92   BY: tmd *F367*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 04/06/92   BY: dld *F358*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 04/10/92   BY: afs *F356*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 04/22/92   BY: tjs *F421*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 04/30/92   BY: tjs *F463*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 05/06/92   BY: tjs *F470*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 05/11/92   BY: afs *F471*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 05/22/92   BY: tjs *F444*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 06/05/92   BY: tjs *F504*                */
/* REVISION: 7.0      LAST MODIFIED: 06/16/92   BY: afs *F519*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 06/18/92   BY: tmd *F458*                */
/* REVISION: 7.0      LAST MODIFIED: 06/26/92   BY: afs *F676*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 06/26/92   BY: afs *F711*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 06/30/92   BY: tjs *F646*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 06/30/92   BY: tjs *F698*                */
/* REVISION: 7.0      LAST MODIFIED: 07/07/92   BY: tjs *F496*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 07/09/92   BY: tjs *F739*                */
/* REVISION: 7.0      LAST MODIFIED: 07/14/92   BY: tjs *F764*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 07/24/92   BY: tjs *F765*                */
/* REVISION: 7.0      LAST MODIFIED: 07/24/92   BY: tjs *F802*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 07/31/92   BY: tjs *F815*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 08/21/92   BY: afs *F862*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 08/24/92   BY: tjs *F859*(rev only)      */
/* REVISION: 7.0      LAST MODIFIED: 08/24/92   BY: tjs *F835*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 09/04/92   BY: afs *G056*                */
/* REVISION: 7.3      LAST MODIFIED: 09/17/92   BY: tjs *G035*                */
/* REVISION: 7.3      LAST MODIFIED: 09/30/92   BY: tjs *G112*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 10/06/92   BY: tjs *G129*                */
/* REVISION: 7.3      LAST MODIFIED: 10/21/92   BY: afs *G219*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 09/27/92   BY: jcd *G247*                */
/* REVISION: 7.3      LAST MODIFIED: 11/05/92   BY: afs *G244*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 11/16/92   BY: tjs *G318*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 01/04/92   BY: tjs *G456*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 12/01/92   BY: mpp *G484*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 01/07/93   BY: tjs *G507*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 01/13/93   BY: tjs *G530*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 01/15/93   BY: afs *G501*                */
/* REVISION: 7.3      LAST MODIFIED: 01/21/93   BY: tjs *G579*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 01/26/93   BY: bcm *G429*                */
/* REVISION: 7.3      LAST MODIFIED: 02/01/93   BY: tjs *G588*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 02/10/93   BY: bcm *G416*                */
/* REVISION: 7.3      LAST MODIFIED: 02/18/93   BY: afs *G692*                */
/* REVISION: 7.3      LAST MODIFIED: 02/25/93   BY: sas *G457*                */
/* REVISION: 7.3      LAST MODIFIED: 03/16/93   BY: bcm *G823*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 03/23/93   BY: tjs *G858*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 04/05/93   BY: bcm *G889*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 04/15/93   BY: tjs *G948*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 04/20/93   BY: afs *G970*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 05/20/93   BY: kgs *GA92*                */
/* REVISION: 7.3      LAST MODIFIED: 05/20/93   BY: kgs *GB18*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 05/20/93   BY: kgs *GA60*                */
/* REVISION: 7.3      LAST MODIFIED: 05/28/93   BY: kgs *GB31*                */
/* REVISION: 7.3      LAST MODIFIED: 06/14/93   BY: afs *GC26*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 06/18/93   BY: bcm *GC50*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 06/22/93   by: cdt *GC58*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 07/01/93   by: cdt *GC90*(rev only)      */
/* REVISION: 7.3      LAST MODIFIED: 07/09/93   by: bcm *GA70*(rev only)      */
/* REVISION  7.4      LAST MODIFIED  06/07/93   BY: skk *H002*(soivtrl2)      */
/* REVISION: 7.4      LAST MODIFIED: 08/23/93   BY: cdt *H049*                */
/* REVISION: 7.4      LAST MODIFIED: 10/04/93   BY: dpm *H075*(rev only)      */
/* REVISION: 7.4      LAST MODIFIED: 09/27/93   BY: cdt *H086*                */
/* REVISION: 7.4      LAST MODIFIED: 10/19/93   BY: bcm *H185*                */
/* REVISION: 7.4      LAST MODIFIED: 10/27/93   BY: dpm *H067*(rev only)      */
/* REVISION: 7.4      LAST MODIFIED: 10/19/93   BY: cdt *H184*                */
/* REVISION: 7.4      LAST MODIFIED: 11/22/93   BY: afs *H238*(rev only)      */
/* REVISION: 7.4      LAST MODIFIED: 01/28/94   BY: afs *GI55*                */
/* REVISION: 7.4      LAST MODIFIED: 02/24/94   BY: cdt *H282*                */
/* REVISION: 7.4      LAST MODIFIED: 04/21/94   BY: dpm *GJ49*                */
/* REVISION: 7.4      LAST MODIFIED: 05/17/94   BY: dpm *FN83*                */
/* REVISION: 7.4      LAST MODIFIED: 05/23/94   BY: afs *FM85*                */
/* REVISION: 7.4      LAST MODIFIED: 05/26/94   BY: afs *GH40*                */
/* REVISION: 7.4      LAST MODIFIED: 09/10/94   BY: bcm *GM05*                */
/* REVISION: 7.4      LAST MODIFIED: 10/10/94   BY: ljm *GN23*                */
/* REVISION: 7.4      LAST MODIFIED: 10/21/94   BY: rmh *FQ08*                */
/* REVISION: 7.4      LAST MODIFIED: 10/29/94   BY: bcm *FT06*                */
/* REVISION: 8.5      LAST MODIFIED: 12/03/94   BY: mwd *J034*                */
/* REVISION: 7.4      LAST MODIFIED: 01/12/95   BY: ais *F0C7*                */
/* REVISION: 8.5      LAST MODIFIED: 02/10/95   BY: dpm *J044*                */
/* REVISION: 7.4      LAST MODIFIED: 02/15/95   BY: rxm *G0F4*                */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.4      LAST MODIFIED: 04/06/95   BY: rxm *G0K8*                */
/* REVISION: 8.5      LAST MODIFIED: 04/11/95   BY: DAH *J042*                */
/* REVISION: 8.5      LAST MODIFIED: 07/14/95   BY: taf *J053*                */
/* REVISION: 7.4      LAST MODIFIED: 02/05/96   BY: ais *G0NX*                */
/* REVISION: 8.5      LAST MODIFIED: 03/12/96   BY: GWM *J0F8*                */
/* REVISION: 8.5      LAST MODIFIED: 04/10/96   BY: DAH *J0HR*                */
/* REVISION: 8.5      LAST MODIFIED: 04/17/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/17/96   BY: *J04C* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 04/29/96   BY: *J0KJ* Dennis Hensen      */
/* REVISION: 8.5      LAST MODIFIED: 07/02/96   BY: *J0WF* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 08/01/96   BY: *J0ZZ* T. Farnsworth      */
/* REVISION: 8.6      LAST MODIFIED: 06/11/96   BY: aal *K001*                */
/* REVISION: 8.5      LAST MODIFIED: 08/02/96   BY: *J12Q* Andy Wasilczuk     */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Elke Van Maele     */
/* REVISION: 8.6      LAST MODIFIED: 03/12/97   BY: *K07K* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 05/02/97   BY: *J1QH* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 06/03/97   BY: *K0DQ* Taek-Soo Chang     */
/* REVISION: 8.6      LAST MODIFIED: 08/06/97   BY: *J1YG* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 08/27/97   BY: *K0HN* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 11/18/97   BY: *J25B* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 11/18/97   BY: *K1BG* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 12/16/97   BY: *H1HF* Niranjan Ranka     */
/* REVISION: 8.6      LAST MODIFIED: 01/16/98   BY: *J25N* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 01/26/98   BY: *J29R* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 01/31/98   BY: *J2D7* Niranjan Ranka     */
/* REVISION: 8.6      LAST MODIFIED: 01/31/98   BY: *J2BC* Aruna Patil        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 04/27/98   BY: *L00L* Adam Harris        */
/* REVISION: 8.6E     LAST MODIFIED: 05/06/98   BY: *J2DD* Kawal Batra        */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* REVISION: 8.6E     LAST MODIFIED: 06/05/98   BY: *L01M* Jean Miller        */
/* REVISION: 8.6E     LAST MODIFIED: 06/24/98   BY: *L01G* Robin McCarthy     */
/* REVISION: 8.6E     LAST MODIFIED: 07/09/98   BY: *J2Q9* Niranjan Ranka     */
/* REVISION: 8.6E     LAST MODIFIED: 07/01/98   BY: *L024* Sami Kureishy      */
/* REVISION: 9.0      LAST MODIFIED: 11/17/98   BY: *H1LN* Poonam Bahl        */
/* REVISION: 9.0      LAST MODIFIED: 11/24/98   BY: *M017* Sandy Brown        */
/* REVISION: 9.0      LAST MODIFIED: 12/15/98   BY: *J34F* Vijaya Pakala      */
/* REVISION: 9.0      LAST MODIFIED: 12/16/98   BY: *J2ZM* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 07/09/99   BY: *J3J0* G.Latha            */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Patti Gaultney     */
/* REVISION: 9.1      LAST MODIFIED: 09/08/99   BY: *N02P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 10/19/99   BY: *N04X* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 10/27/99   BY: *N03P* Mayse Lai          */
/* REVISION: 9.1      LAST MODIFIED: 11/02/99   BY: *N04P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic         */
/* REVISION: 9.1      LAST MODIFIED: 02/16/00   BY: *N06R* Denis Tatarik      */
/* REVISION: 9.1      LAST MODIFIED: 04/21/00   BY: *N09J* Denis Tatarik      */
/* REVISION: 9.1      LAST MODIFIED: 05/07/00   BY: *N09G* Luke Pokic         */
/* REVISION: 9.1      LAST MODIFIED: 05/13/00   BY: *N0B4* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 06/05/00   BY: *N0CZ* John Pison         */
/* REVISION: 9.1      LAST MODIFIED: 06/14/00   BY: *L0Y4* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 07/01/00   BY: *N0DX* BalbeerS Rajput    */
/* REVISION: 9.1      LAST MODIFIED: 07/06/00   BY: *N0F0* Arul Victoria      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 10/03/00   BY: *L14Q* Abhijeet Thakur    */
/* REVISION: 9.1      LAST MODIFIED: 11/19/00   BY: *M0WC* Rajesh Thomas      */
/* REVISION: 9.1      LAST MODIFIED: 11/30/00   BY: *L15Z* Veena Lad          */
/* REVISION: 9.1      LAST MODIFIED: 12/18/00   BY: *M0TZ* Veena Lad          */
/* REVISION: 9.1      LAST MODIFIED: 10/09/00   BY: *N0WW* Mudit Mehta        */
/* Revision: 1.77          BY: Katie Hilbert      DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.78          BY: Ellen Borden       DATE: 07/06/01  ECO: *P007* */
/* Revision: 1.79          BY: Jean Miller        DATE: 07/06/01  ECO: *M11Z* */
/* Revision: 1.80          BY: Jeff Wootton       DATE: 09/21/01  ECO: *P01H* */
/* Revision: 1.81          BY: Vivek Dsilva       DATE: 02/05/02  ECO: *N18S* */
/* Revision: 1.82          BY: Santhosh Nair      DATE: 03/05/02  ECO: *M1H1* */
/* Revision: 1.83          BY: Rajesh Kini        DATE: 03/14/02  ECO: *M1WN* */
/* Revision: 1.84          BY: Ashish Maheshwari  DATE: 05/14/02  ECO: *P06M* */
/* Revision: 1.85          BY: Ashish Maheshwari  DATE: 05/20/02  ECO: *P04J* */
/* Revision: 1.87          BY: Dave Caveney       DATE: 05/30/02  ECO: *P042* */
/* Revision: 1.88          BY: Robin McCarthy     DATE: 07/03/02  ECO: *P08Q* */
/* Revision: 1.89          BY: Robin McCarthy     DATE: 07/15/02  ECO: *P0BJ* */
/* Revision: 1.90          BY: John Corda         DATE: 08/09/02  ECO: *N1QP* */
/* Revision: 1.91          BY: Dipesh Bector      DATE: 01/14/03  ECO: *M21Q* */
/* Revision: 1.92          BY: Katie Hilbert      DATE: 01/31/03  ECO: *P0MJ* */
/* Revision: 1.93          BY: Robin McCarthy     DATE: 02/28/03  ECO: *P0M9* */
/* Revision: 1.94          BY: Dorota Hohol       DATE: 03/06/03  ECO: *P0N6* */
/* Revision: 1.95          BY: Narathip W.        DATE: 05/08/03  ECO: *P0RL* */
/* Revision: 1.97          BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.98          BY: Kirti Desai        DATE: 10/14/03  ECO: *P165* */
/* Revision: 1.99          BY: Veena Lad          DATE: 10/22/03  ECO: *P160* */
/* Revision: 1.101         BY: Veena Lad          DATE: 02/03/04  ECO: *P1M6* */
/* Revision: 1.102         BY: Vinay Soman        DATE: 02/26/04  ECO: *P1QB* */
/* Revision: 1.103         BY: Veena Lad          DATE: 03/03/04  ECO: *Q064* */
/* Revision: 1.104         BY: Katie Hilbert      DATE: 03/09/04  ECO: *Q06B* */
/* Revision: 1.105         BY: Laxmikant Bondre   DATE: 05/10/04  ECO: *P20V* */
/* Revision: 1.106         BY: Shivanand H        DATE: 06/22/04  ECO: *P25X* */
/* Revision: 1.107         BY: SurenderSingh N.   DATE: 01/12/05  ECO: *P322* */
/* Revision: 1.108         BY: Ed van de Gevel    DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.110         BY: Ed van de Gevel    DATE: 03/07/05  ECO: *R00K* */
/* Revision: 1.111         BY: Gaurav Kerkar      DATE: 07/19/05  ECO: *P3T8* */
/* Revision: 1.114         BY: Jean Miller        DATE: 02/18/06  ECO: *Q0R5* */
/* Revision: 1.115         BY: Tom Kennedy        DATE: 06/08/06  ECO: *Q0LK* */
/* Revision: 1.116         BY: Jean Miller        DATE: 06/26/06  ECO: *Q066* */
/* Revision: 1.122         BY: Zheng Huang        DATE: 07/25/07  ECO: *R0C6* */
/* Revision: 1.118         BY: Anju Dubey         DATE: 01/11/08  ECO: *P64F* */
/* Revision: 1.120         BY: Vivek Kamath       DATE: 04/22/08  ECO: *P4LG* */
/* Revision: 1.130         BY: Nan Zhang          DATE: 06/04/08  ECO: *R0JS* */
/* Revision: 1.131         BY: Prajakta Patil     DATE: 07/08/08  ECO: *P6VC* */
/* Revision: 1.140         BY: Jean Miller        DATE: 07/11/08  ECO: *R0WZ* */
/* Revision: 1.145         BY: Jean Miller        DATE: 07/10/08  ECO: *R0WJ* */
/* Revision: 1.146         BY: Katie Hilbert      DATE: 11/07/08  ECO: *R175* */
/* Revision: 1.147         BY: Jiang Wan          DATE: 12/20/08  ECO: *R1BY* */
/* Revision: 1.148         BY: Prabu M            DATE: 25/09/09  ECO: *Q3G6* */
/* Revision: 1.150         BY: Jiang Wan          DATE: 12/04/09  ECO: *R1V9* */
/* Revision: 1.151         BY: Prabu M            DATE: 04/09/10  ECO: *R1ZH* */
/* Revision: 1.152         BY: Prabu M            DATE: 04/12/10  ECO: *R1ZM* */
/* Revision: 1.153         BY: Katie Hilbert      DATE: 06/24/10  ECO: *R21M* */
/* $Revision: 1.2 $      BY: Zhijun Guan        DATE: 12/16/09  ECO: *R1Z0* */
/* CYB        LAST MODIFIED: 10-OCT-2011  BY: gbg *cy1046*               */
/* CYB        LAST MODIFIED: 18-OCT-2012  BY: gbg *c1351*                */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/******************************************************************************/
/* Due to the introduction of the module Project Realization Management (PRM) */
/* the term Material Order (MO) replaces all previous references to Service   */
/* Engineer Order (SEO) in the user interface. Material Order is a type of    */
/* Sales Order used by an engineer to obtain inventory needed for service     */
/* work. In PRM, a material order is used to obtain inventory for project     */
/* work.                                                                      */
/******************************************************************************/
 
/* DISPLAY TITLE */
{us/mf/mfdtitle.i "3+ "}
{us/gp/gpuid.i}
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
 
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}
 
{us/et/etvar.i &new="new"}
{us/et/etdcrvar.i "new"}
{us/et/etrpvar.i &new="new"}
 
{us/gp/gpoidfcn.i}
{us/px/pxphdef.i mglbxr}
 
define new shared variable sls-psn          like so_slspsn[1] no-undo.
define new shared variable sls-psn1         like so_slspsn[1] no-undo.
define new shared variable order_nbrs       as character extent 30.
define new shared variable order_nbr_list   as character no-undo.
define new shared variable rndmthd          like rnd_rnd_mthd.
define new shared variable oldcurr          like so_curr.
define new shared variable line             like sod_line.
define new shared variable del-yn           like mfc_logical.
define new shared variable qty_req          like in_qty_req.
define new shared variable qty_all          like in_qty_all.
define new shared variable prev_due         like sod_due_date.
define new shared variable prev_qty_ord     like sod_qty_ord.
define new shared variable trnbr            like tr_trnbr.
define new shared variable qty              as decimal.
define new shared variable part             as character format "x(18)".
define new shared variable eff_date         as date.
define new shared variable all_days         like soc_all_days.
define new shared variable all_avail        like soc_all_avl.
define new shared variable ln_fmt           like soc_ln_fmt.
define new shared variable ref              like glt_det.glt_ref.
define new shared variable so_recno         as recid.
define new shared variable comp             like ps_comp.
define new shared variable trlot            like tr_lot.
define new shared variable cmtindx          like cmt_indx.
define new shared variable sonbr            like so_nbr.
define new shared variable socmmts          like soc_hcmmts label "Comments".
define new shared variable perform_date     as date label "Perform Date".
define new shared variable base_amt         like ar_amt.
define new shared variable cm_recno         as recid.
define new shared variable new_order        like mfc_logical initial no.
define new shared variable sotax_trl        like tax_trl.
define new shared variable tax_in           like cm_tax_in.
define new shared variable exch_rate        like exr_rate.
define new shared variable exch_rate2       like exr_rate2.
define new shared variable exch_ratetype    like exr_ratetype.
define new shared variable exch_exru_seq    like exru_seq.
define new shared variable so_db            like dc_name.
define new shared variable inv_db           like dc_name.
define new shared variable mult_slspsn      like mfc_logical no-undo.
define new shared variable tax_recno        as recid.
define new shared variable ad_recno         as recid.
define new shared variable ship2_addr       like so_ship.
define new shared variable ship2_pst_id     like cm_pst_id.
define new shared variable ship2_lang       like cm_lang.
define new shared variable ship2_ref        like cm_addr.
define new shared variable undo_taxc        like mfc_logical.
define new shared variable undo_cust        like mfc_logical.
define new shared variable rebook_lines     like mfc_logical no-undo.
define new shared variable so_mstr_recid    as recid.
define new shared variable freight_ok       like mfc_logical initial yes.
define new shared variable old_ft_type      like ft_type.
define new shared variable calc_fr          like mfc_logical
                                            label "Calculate Freight".
define new shared variable old_um           like fr_um.
define new shared variable undo_soivmtb     like mfc_logical.
define new shared variable undo_flag        like mfc_logical.
define new shared variable disp_fr          like mfc_logical
                                            label "Display Weights".
define new shared variable soc_pc_line      like mfc_logical initial yes.
define new shared variable socrt_int        like sod_crt_int.
define new shared variable picust           like cm_addr.
define new shared variable price_changed    like mfc_logical.
define new shared variable reprice          like mfc_logical
                                            label "Reprice" initial no.
define new shared variable balance_fmt      as character.
define new shared variable limit_fmt        as character.
define new shared variable prepaid_fmt      as character no-undo.
define new shared variable line_pricing     like pic_so_linpri
                                            label "Line Pricing".
define new shared variable l_edittax        like mfc_logical
                                            initial no no-undo.
define new shared variable impexp           like mfc_logical no-undo.
define new shared variable lv_shipment_id   as character no-undo.
define new shared variable l_consume        like sod_consume no-undo.
define new shared variable coverage-discount  like sod_disc_pct.
define buffer bill_cm for cm_mstr.
 
define variable comment_type    like so_lang.
define variable sotrnbr         like so_nbr.
define variable sotrcust        like so_cust.
define variable counter         as integer no-undo.
define variable msgref          as character format "x(20)".
define variable impexp_edit     like mfc_logical no-undo.
define variable upd_okay        like mfc_logical no-undo.
define variable in_batch_proces as logical.
define variable prepaid_old     as character no-undo.
define variable l_old_shipto    like  so_ship no-undo.
define variable l_undo_shipto   like mfc_logical no-undo.
define variable l_retrobill     like mfc_logical no-undo.
define variable errorNbr        as integer no-undo.
define variable vSOToHold       like so_nbr no-undo.
define variable emt-bu-lvl      like global_part no-undo.
define variable save_part       like global_part no-undo.
define variable use-log-acctg   as logical no-undo.
define variable lv_nrm_seqid    like lac_soship_nrm_id no-undo.
define variable lv_undo_flag    as logical no-undo.
define variable lv_shipfrom     like so_site no-undo.
define variable msg-arg         as character format "x(24)" no-undo.
define variable l_vq_use_sold   like mfc_logical initial no no-undo.
define variable l_inv_mthd      like so_inv_mthd no-undo.
define variable tms-error       like msg_nbr     no-undo.
define variable v_trflow_flg    as   logical                no-undo.
/* CREDIT LIMIT VARIABLES */
define variable hCreditLibrary    as handle        no-undo.
 
/* Global Shipping: Shipper and Legal Doc */
define variable v_lines_found  like mfc_logical     no-undo.
define variable v_abs_recid    as   recid           no-undo.
define variable c_tr_trnbr1    like tr_trnbr        no-undo.
define variable c_tr_trnbr2    like tr_trnbr        no-undo.

 
/* SHIPPER TEMP TABLE */
{us/ic/icshmtdf.i "new"}
 
define temp-table t_sod_qty no-undo
   field t_line     like sod_line
   field t_qty_ship like sod_qty_ship
   field t_um_conv  like sod_um_conv.
 
/* Credit Management Procedure Library */
run mfairunh.p
   (input "mfcredpl.p",
    input ?,
    output hCreditLibrary).
 
{us/mf/mfcredpl.i "hCreditLibrary"}
 
define variable imp-okay as logical no-undo.
define new shared temp-table IntraStat field StatID as recid.
 
/* Global Shipping: Use Seq ID to generate SO nbr */
define variable l_errorst  like mfc_logical no-undo.
define variable i_errornum as   integer     no-undo.
define variable c_sonrm    like so_nrm      no-undo.
define variable use_nrmseq as   logical initial no no-undo.
define variable temp_seqid as   character   no-undo.
 
define temp-table tt_nrm
   field tt_dataset like nr_dataset
   field tt_seqid   like nr_seqid
   field tt_nbrtype as   character
index idx_seqid_pk is unique primary tt_seqid.
 
form
   tt_seqid
with frame frame_seqid side-labels overlay row 2 columns 12.
 
setFrameLabels(frame frame_seqid:handle).
 
/* Includes 'getnbr' */
{us/gp/gpnbrgen.i}
 
define new shared frame a.
define new shared frame sold_to.
define new shared frame ship_to.
define new shared frame b.
define new shared frame b1.
define new shared frame sotot.
 
{us/la/lafrttmp.i "new"}   /* FREIGHT ACCRUAL TEMP-TABLE DEFINITION */
{us/la/latrhtmp.i "new"}   /* FREIGHT ACCRUAL TEMP-TABLE FOR TR_HIST DATA */
 
/*THIS TEMP TABLE IS CREATED TO CALCULATE FREIGHT CHARGES  */
/*WHEN A NEW SALES ORDER LINE IS ADDED TO AN EXISTING ORDER*/
/*WHEN THE FREIGHT TYPE IS "INCLUDE".                      */
define new shared temp-table l_fr_table
       field l_fr_sonbr   like sod_nbr
       field l_fr_soline  like sod_line
       field l_fr_chrg    like sod_fr_chg
       field l_sodlist_pr like sod_list_pr
       index nbrline is primary l_fr_sonbr l_fr_soline.
 
{us/pp/pppivar.i "new"}  /* Shared pricing variables */
{us/pp/pppiwqty.i "new"} /* Workfile for accum qty for pricing routines */
 
{us/gp/gptxcdec.i}    /* DECLARATIONS FOR gptxcval.i */
 
/* DUE TO THE SHARED USE OF SOSOMTCM.P WITH SALES ORDER MNT */
{us/so/sobtbvar.i "new"} /* BACK TO BACK SHARED WORKFILES AND VARIABLES */
 
{us/et/etsotrla.i "NEW"}
{us/so/soivmt01.i}
 
/* TEMP TABLE DEFINITIONS FOR APM/API */
{us/if/ifttcmdr.i "new"}
{us/if/ifttcmdv.i "new"}
 
define new shared temp-table tt_soddet no-undo like sod_det.
 
run p-get-formats.
 
if execname = "rcrbrp01.p" then
   l_retrobill = yes.
 
{us/px/pxmaint.i}
 
run new-proc-j2dd.
 
do transaction on error undo, retry:
   find first pic_ctrl where pic_ctrl.pic_domain = global_domain
   no-lock no-error.
   if not available pic_ctrl then do:
      create pic_ctrl.
      pic_ctrl.pic_domain = global_domain.
   end.
end.
 
so_db = global_db.
 
/* INITIALIZING SR_WKFL */
for each sr_wkfl where sr_domain = global_domain
    and  sr_userid = SessionUniqueID
exclusive-lock:
   delete sr_wkfl.
end. /* FOR EACH SR_WKFL WHERE SR_USERID = SessionUniqueID */
 
/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}
 
/* Need to undo the mainloop and after that set a field */
upperloop:
repeat:
 
   mainloop:
 
   do on error undo mainloop, leave mainloop:
      hide all no-pause.
 
      do transaction on error undo, retry:
 
         find first gl_ctrl where gl_domain = global_domain no-lock.
         find first soc_ctrl where soc_domain = global_domain no-lock no-error.
 
         assign
            socmmts  = soc_hcmmts /* Set default comments */
            tax_edit = no.
 
         /* DISPLAY SELECTION FORM */
 
         {us/so/soivmt02.i}  /* Definitions for shared frames a & b & b1 */
 
         {us/mf/mfadform.i "sold_to" 1 SOLD-TO}
         {us/mf/mfadform.i "ship_to" 41 SHIP-TO}
 
         view frame dtitle.
         view frame a.
         view frame sold_to.
         view frame ship_to.
         view frame b.
 
         /* Check is any NRM sequences defined for Numbering */
         use_nrmseq = can-find(first nr_mstr where nr_domain = global_domain
                                               and nr_dataset begins "so_nbr."
                                               and nr_effdate <= today
                                               and (nr_exp_date = ? or nr_exp_date >= today)).
 
         c_sonrm = "".
 
         prompt-for so_mstr.so_nbr with frame a
         editing:
 
            /* FIND NEXT/PREVIOUS  RECORD */
            {us/mf/mfnp.i so_mstr so_nbr  " so_domain = global_domain and
            so_compl_stat = '' and so_nbr "  so_nbr so_nbr so_nbr}
 
            if keyfunction(lastkey) = "RECALL" or lastkey = 307
            then
               display sonbr @ so_nbr with frame a.
 
            if recno <> ? then do:
               {us/mf/mfaddisp.i so_cust sold_to}
               {us/mf/mfaddisp.i so_ship ship_to}
               display
                  so_nbr
                  so_cust
                  so_bill
                  so_ship
               with frame a.
 
               perform_date = ?.
 
               if so_slspsn[2] <> "" or
                  so_slspsn[3] <> "" or
                  so_slspsn[4] <> ""
               then
                  mult_slspsn = true.
               else
                  mult_slspsn = false.
               if not new_order then socrt_int = so__qad02.
 
               run p-disp-frameb.
            end. /* if recno <> ? then do */
 
         end. /* prompt-for with editing */
 
         if input so_nbr = "" then do:
 
            if use_nrmseq then do:
 
               /* Global Shipping: Identify SO type using NRM, RMA won't use NRM*/
               /* Fill temp table for display */
               empty temp-table tt_nrm no-error.
 
               for each nr_mstr where nr_domain = global_domain
                  and nr_dataset begins "so_nbr."
                  and nr_effdate <= today
                  and (nr_exp_date = ? or nr_exp_date >= today)
               no-lock:
 
                  if can-find (first lngd_det where lngd_lang = global_user_lang
                                                and lngd_dataset = "so_seq_id"
                                                and lngd_field = "seq_type"
                                                and lngd_key2  = substring(nr_dataset,8))
                  then do:
                     create tt_nrm.
                     assign
                        tt_dataset = nr_dataset
                        tt_seqid   = nr_seqid
                        tt_nbrtype = substring(nr_dataset,8).
                     if recid(tt_nrm) = -1 then.
                  end.
 
               end.
 
               /* Display empty as default Seq ID */
               display
                  "" @ tt_seqid
               with frame frame_seqid.
 
            end.
 
            /* Set the Seq ID and return the value */
            settype:
            do on error undo, retry on endkey undo mainloop, retry mainloop:
 
               if use_nrmseq then do:
 
                  prompt-for tt_seqid with frame frame_seqid editing:
                     {us/mf/mfnp05.i tt_nrm idx_seqid_pk
                        " true "
                        tt_seqid
                        " input tt_seqid"}
                     if recno <> ? then do:
                        display
                           tt_seqid
                        with frame frame_seqid.
                     end.
                  end. /* prompt-for tt_seqid */
 
                  for first tt_nrm where tt_seqid = input tt_seqid
                  no-lock: end.
 
                  temp_seqid = input tt_seqid.
 
                  if not available tt_nrm and temp_seqid <> ""
                  then do:
                     /* Invalid Sequence */
                     {us/bbi/pxmsg.i &MSGNUM=2818 &ERRORLEVEL=3}
                     next-prompt tt_seqid.
                     undo, retry.
                  end.
                  else if temp_seqid <> "" then
                     c_sonrm = tt_nbrtype.
 
               end. /* if use_nrmseq */
 
               GetSoNbr:
               repeat:
 
                  if available tt_nrm and
                     tt_seqid <> "" and
                     use_nrmseq
                  then do:
                     run getnbr
                         (input tt_seqid,
                          input today,
                          output sonbr,
                          output l_errorst,
                          output i_errornum).
                  end. /* If input tt_seqid <> "" */
 
                  else do:
                     /* GET NEXT SALES ORDER NUMBER WITH PREFIX */
                     {us/mf/mfnctrlc.i "soc_domain = global_domain"
                        "soc_domain" "so_domain = global_domain"
                        soc_ctrl soc_so_pre soc_so so_mstr so_nbr sonbr}
                  end.
 
                  if not can-find(first so_mstr
                               where so_domain = global_domain
                               and   so_nbr    = sonbr no-lock)
                  then do:
                     leave GetSoNbr.
                  end.
 
               end. /* Repeat GetSoNbr */
 
               /* SO number length is 8 */
               if length(sonbr) > 8
               then do:
                  /* LENGTH MUST BE LESS THEN 8 */
                  {us/bbi/pxmsg.i &MSGNUM=7982 &ERRORLEVEL=3}
                  undo, retry settype.
               end.
 
            end. /* Settype */
 
            hide frame frame_seqid.
 
         end.
         /* IF SO Number entered */
         else
            sonbr = input so_nbr.
 
         find first cil_mstr where cil_domain = global_domain
            and cil_cor_so_nbr = sonbr
         no-lock no-error.
         if available cil_mstr then do:
            {us/bbi/pxmsg.i &MSGNUM=5353 &ERRORLEVEL=3}
            pause.
            undo mainloop,retry mainloop.
         end.
      end. /* do transaction */
 
      {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}
 
      do transaction on error undo, retry:
 
         old_ft_type = "".
         find so_mstr where so_domain = global_domain
            and so_nbr = sonbr
         exclusive-lock no-error.
 
         if not available so_mstr then do:
 
            find first soc_ctrl where soc_domain = global_domain
            no-lock no-error.
 
            clear frame sold_to.
            clear frame ship_to.
            clear frame b.
 
            /* ADDING NEW RECORD */
            {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}
 
            /* READY TO INVOICE FLAG SHOULD BE SET     */
            /* TO YES INITIALLY WHEN ORDER IS CREATED  */
 
            create so_mstr.
            assign
               new_order    = yes
               so_domain    = global_domain
               so_nbr       = sonbr
               so_ord_date  = today
               so_due       = today
               so_ship_date = today
               so_to_inv    = yes
               so_conf_date = today
               so_print_pl  = no
               socmmts      = soc_hcmmts
               so_nrm       = c_sonrm
               so_fob       = soc_fob
               so_userid    = global_userid.
 
         end. /* if not available so_mstr */
 
         else do:
 
            /* Check for batch shipment record */
            in_batch_proces = no.
            {us/so/sosrchk.i so_nbr in_batch_proces}
            if in_batch_proces then
               undo mainloop, retry mainloop.
 
            /* Check if Sales Order is Closed */
            if so_compl_stat <> ""
            then do:
               /* Order is closed. Modification not allowed */
               {us/bbi/pxmsg.i &MSGNUM=8042 &ERRORLEVEL=3}
                if not batchrun then pause.
               undo mainloop, retry mainloop.
            end.
 
            /* Determine if this order will be processed with a credit card
             * and validate that the credit card info is valid and that the
             * authorized amount is enough to process the order.  Issue
             * warning if an error occurs*/
            {us/gp/gprunp.i "soccval" "p" "preValidateCCProcessing"
               "(input so_nbr, output errorNbr)"}
            if errorNbr <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=errorNbr &ERRORLEVEL=2}
               if not batchrun then pause.
            end.
 
            /* I.E. IF AVAIL SO_MSTR */
            if so_conf_date = ? then do:
               /* WARNING: SALES ORDER NOT CONFIRMED */
               {us/bbi/pxmsg.i &MSGNUM=621 &ERRORLEVEL=2}
            end.
 
            /* SO'S AND RMA'S ARE UPDATEABLE IN PENDING INV. MAINT., */
            /* ALTHOUGH THE USER WILL BE SOMEWHAT LIMITED AS TO WHAT */
            /* HE CAN SEE/MAINTAIN ON RMA'S.                         */
            if so_fsm_type <> ""
               and so_fsm_type <> "RMA"
            then do:
               if so_fsm_type = "SC"
               then
                  msgref = getTermLabel("SERVICE_CONTRACT", 20).
               else
               if so_fsm_type = "SEO"
               then
                  msgref = getTermLabel("MATERIAL_ORDER", 20).
               else
               if so_fsm_type = "PRM"
               then
                  msgref = getTermLabel("PRM_PENDING_INVOICE", 20).
               else
                  msgref = getTermLabel("SERVICE_INVOICE", 20).
 
               /* THIS IS A # CANNOT PROCESS */
               {us/bbi/pxmsg.i &MSGNUM=7326 &ERRORLEVEL=3 &MSGARG1=msgref}
 
               if not batchrun then pause.
               undo mainloop, retry mainloop.
            end.
 
            if soc_maintain_reviewed = no
            and so_reviewed          = yes
            then do:
               /* ORDER HAS BEEN REVIEWED BY CREDIT CONTROLLER. UNABLE TO MODIFY*/
               {us/bbi/pxmsg.i &MSGNUM=7597 &ERRORLEVEL=3}
                if not batchrun then pause.
               undo mainloop, retry mainloop.
            end.
 
            /* MODIFYING EXISTING RECORD */
            {us/bbi/pxmsg.i &MSGNUM=10 &ERRORLEVEL=1}
 
            {us/mf/mfaddisp.i so_cust sold_to}
            if not available ad_mstr then do:
               hide message no-pause.
               /* NOT A VALID CUSTOMER */
               {us/bbi/pxmsg.i &MSGNUM=3 &ERRORLEVEL=2}
            end.
 
            {us/mf/mfaddisp.i so_ship ship_to}
 
            assign
               socrt_int = so__qad02
               socmmts   = so_cmtindx <> 0
               new_order = no.
 
            find ft_mstr
               where ft_domain = global_domain
                and  ft_terms  = so_fr_terms
            no-lock no-error.
            if available ft_mstr then old_ft_type = ft_type.
 
            {us/bbi/gprun.i ""gpsiver.p""
               "(input so_site, input ?, output return_int)"}
 
            if return_int = 0 then do:
               display so_site with frame b.
               /* USER DOES NOT HAVE ACCESS TO SITE */
               {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
               pause.
               undo mainloop, retry mainloop.
            end.
 
            if so_sched then
            /* ORDER WAS CREATED BY SCHEDULED ORDER MAINTENANCE */
            {us/bbi/pxmsg.i &MSGNUM=8210 &ERRORLEVEL=2}
 
         end. /* else do (available so_mstr) */
 
         assign
            recno    = recid(so_mstr)
            sotrnbr  = so_nbr
            sotrcust = so_cust.
         display
            so_nbr
            so_cust
            so_bill
            so_ship
         with frame a.
 
         if so_ship_date = ? then so_ship_date = today.
 
         perform_date = ?.
 
         assign
            sls-psn  = so_slspsn[1]
            sls-psn1 = so_slspsn[1].
         if so_slspsn[2] <> "" or
            so_slspsn[3] <> "" or
            so_slspsn[4] <> ""
         then
            mult_slspsn = true.
         else
            mult_slspsn = false.
 
         run p-disp-frameb.   /* display frame b */
 
         /* Get sold-to, bill-to, and ship-to customer */
         /* SHIP-TO CHANGED; UPDATE TAX DATA ON CONFIRMATION. PREVIOUS */
         /* HEADER TAX ENVIRONMENT BLANKED OUT FOR RECALCULATION LATER */
         assign
            so_recno  = recid(so_mstr)
            undo_cust = true
            l_edittax = no.
 
         if so_fsm_type = "RMA" then
            find rma_mstr
               where rma_domain = global_domain
                and  rma_nbr = so_nbr
                and  rma_prefix = "C"
            no-lock.
 
         l_old_shipto = so_ship.
 
         /* SOSOMTCM.P INPUT PARMS INDICATE IF THIS IS RMA */
/*c1351*         {us/bbi/gprun.i ""sosomtcm.p"" */
/*c1351*/        {us/bbi/gprun.i ""xxsomtcm.p""
            "(input     (available rma_mstr),
              input     if available rma_mstr then recid(rma_mstr)
                        else ?,
              input     no,
              output    l_edittax)"}
 
         if undo_cust then undo mainloop, retry.
 
         /* THIS BLOCK OF CODE EXECUTED WHEN SHIP-TO IS CHANGED IN GTM */
         if l_old_shipto <> "" and l_old_shipto <> so_ship
         then do:
            l_undo_shipto = true.
            /* IF SHIP-TO IS CHANGED */
            run p-shipto-change
               (input so_recno,
               input-output l_undo_shipto).
            if l_undo_shipto then do:
               display
                  l_old_shipto @ so_ship
               with frame a.
               undo mainloop, retry mainloop.
            end. /* IF L_UNDO_SHIPTO */
         end.  /* IF SHIP-TO IS CHANGED IN GTM */
 
         find cm_mstr
            where cm_mstr.cm_domain = global_domain
              and cm_mstr.cm_addr = so_cust no-lock.
         find bill_cm
            where bill_cm.cm_domain = global_domain
              and bill_cm.cm_addr = so_bill no-lock.
         find ad_mstr
            where ad_domain = global_domain
             and  ad_addr = so_bill no-lock.
         if ad_inv_mthd = "" then do:
            find ad_mstr
               where ad_domain = global_domain
                and  ad_addr = so_ship no-lock.
            if ad_inv_mthd = "" then
               find ad_mstr
                  where ad_domain = global_domain
                    and ad_addr = so_cust no-lock.
         end.
 
         /* SET CUSTOMER VARIABLE USED BY PRICING ROUTINE gppibx.p */
         picust = so_cust.
         if so_cust <> so_ship and
            can-find(cm_mstr where cm_mstr.cm_domain = global_domain and
                                   cm_mstr.cm_addr = so_ship)
         then
            picust = so_ship.
 
         order-header:
         do on error undo, retry with frame b:
 
            /* DO NOT ALLOW RMA'S TO BE DELETED IN PENDING INVOICE MAINT */
            if so_fsm_type = " " then
               ststatus = stline[2].
            else
               ststatus = stline[3].
            status input ststatus.
 
            del-yn = no.
 
            /* SET DEFAULTS WHEN CREATING A NEW ORDER - */
            /* USE SHIP-TO CUSTOMER INFO FOR DEFAULT IF */
            /* AVAILABLE ELSE USE SOLD-TO INFO          */
            if new so_mstr then
               run assign_new_so.
 
            /* LOAD DEFAULT TAX CLASS & USAGE */
            for first cm_mstr
               where cm_mstr.cm_domain = global_domain
                and  cm_mstr.cm_addr = so_ship
            no-lock:
               tax_in  = cm_mstr.cm_tax_in.
            end.
 
            if not available cm_mstr
            then do:
               for first ad_mstr
                  where ad_mstr.ad_domain = global_domain
                    and ad_mstr.ad_addr   = so_ship
               no-lock:
                  tax_in  = ad_mstr.ad_tax_in.
               end.
            end.
 
            if not available cm_mstr and
               not available ad_mstr
            then
               for first cm_mstr
                  where cm_mstr.cm_domain = global_domain
                    and cm_mstr.cm_addr = so_cust
               no-lock:
                 tax_in  = cm_mstr.cm_tax_in.
               end.
 
            if not new so_mstr then socmmts = so_cmtindx <> 0.
 
            /* CHECK CREDIT LIMIT */
            if validCustomerCreditLimit
               (bill_cm.cm_addr, 0.0, 0.0, so_curr, 2, "SO", yes) <> 0
            then do:
               /* MESSAGE IS GIVEN IN validCustomerCreditLimit() */
            end.
 
            /* CHECK CREDIT HOLD  */
            if isCustomerOnCreditHold(input bill_cm.cm_addr) then do:
               /* CUSTOMER ON CREDIT HOLD */
               if new so_mstr then so_stat = "HD".
            end.
 
            if not new_order then socrt_int = so__qad02.
 
            /* TMS Black Box Interface */
            assign
               tms-error = 0.
 
            {us/bbi/gprun.i ""sotmsbb.p""
               "(input 'sow',
                 input recid(so_mstr),
                 input yes,
                 output tms-error)"}
 
            recno = recid(so_mstr).
            run p-disp-frameb.   /* display frame b */
 
            undo_flag = true.
            {us/bbi/gprun.i ""soivmtp.p""}
 
            /* Jump out if SO was (successfully) deleted */
            if not can-find(so_mstr where so_domain = global_domain
                                     and  so_nbr = input so_nbr
                                     and so_compl_stat = "")
            then next upperloop.
            if undo_flag then
               undo mainloop, next upperloop.
 
         end. /* order-header: do on error */
 
         cr_terms_changed = no.
 
         if (oldcurr <> so_curr) or (oldcurr = "") then do:
            /* SET CURRENCY DEPENDENT FORMATS */
            {us/so/socurfmt.i}
            oldcurr = so_curr.
            /* SET CURRENCY DEPENDENT FORMAT FOR PREPAID_FMT */
            prepaid_fmt = prepaid_old.
            {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output prepaid_fmt,
                                      input rndmthd)"}
         end.
 
         if perform_date = ? then perform_date = so_mstr.so_due_date.
         if so_mstr.so_req_date = ? then
            so_mstr.so_req_date = so_mstr.so_due_date.
 
         if so_fsm_type <> "" and so_pricing_dt = ? then
            so_pricing_dt = so_ord_date.
         if so_pricing_dt    = ? then do:
            if pic_so_date   = "ord_date" then
               so_pricing_dt = so_ord_date.
            else
            if pic_so_date   = "req_date" then
               so_pricing_dt = so_req_date.
            else
            if pic_so_date   = "per_date" then
               so_pricing_dt = perform_date.
            else
            if pic_so_date   = "due_date" then
               so_pricing_dt = so_due_date.
            else
               so_pricing_dt = today.
         end.
 
         /* COMMENTS */
         assign
            global_lang = so_mstr.so_lang
            global_type = "".
 
         /* If EMT, determine the Comment Type */
         emt-bu-lvl = "".
         if     so_primary
            and not so_secondary
         then
            emt-bu-lvl = "MAN".
         else
            if     so_primary
               and so_secondary
               and so_app_owner = "DOM"
               and so__qadl04
            then
               emt-bu-lvl = "PBU".
            else
               if     so_primary
                  and so_secondary
               then
                  emt-bu-lvl = "MBU".
               else
                  if so_secondary
                  then
                     emt-bu-lvl = "SBU".
 
         if socmmts = yes then do:
            assign
               cmtindx     = so_mstr.so_cmtindx
               global_ref  = so_mstr.so_cust
               save_part   = global_part
               global_part = emt-bu-lvl.
            {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""so_mstr"")"}
            global_part = save_part.
            so_mstr.so_cmtindx = cmtindx.
         end.
 
      end.  /* do transaction: SO Header updates */
 
      /* FIND LAST LINE */
      line = 0.
 
      for each sod_det where sod_domain = global_domain
         and sod_nbr = so_mstr.so_nbr
      by sod_line descending:
         line = sod_line.
         leave.
      end.
 
      /* INITIALIZE ACCUM QTY WORKFILES USED BY PRICING ROUTINES */
      {us/bbi/gprun.i ""gppiqty1.p"" "(""1"",
                                so_mstr.so_nbr,
                                yes,
                                yes)"}
 
      hide frame sold_to no-pause.
      hide frame ship_to no-pause.
      hide frame b1 no-pause.
      hide frame b no-pause.
      hide frame a no-pause.
 
      /* LINE ITEMS */
      hide frame a.
 
      /* Use c_tr_trnbr1 and c_tr_trnbr2 to validate whether there is
         transaction with qty changed for same order */
      for last tr_hist
         where tr_domain  =  global_domain
         and   tr_nbr     =  so_mstr.so_nbr
         and   tr_qty_chg <> 0
      no-lock:
         c_tr_trnbr1 = tr_hist.tr_trnbr.
      end.
 
/*cy1046*      {us/bbi/gprun.i ""soivmta.p""} */
/*cy1046*/     {us/bbi/gprun.i ""xxsoivmta.p""}
 
      for last tr_hist
         where tr_domain  =  global_domain
         and   tr_nbr     =  so_mstr.so_nbr
         and   tr_qty_chg <> 0
      no-lock:
         c_tr_trnbr2 = tr_hist.tr_trnbr.
      end.
 
      /* IF LOGISTICS ACCOUNTING IS ENABLED AND VALID FREIGHT TERMS/LIST   */
      /* IS ENTERED DISPLAY THE LOGISTICS CHARGE DETAIL FRAME WHICH        */
      /* DISPLAYS THE LOGISTICS SUPPLIER FOR THIS ORDER STORED IN THE      */
      /* lacd_det. IF THE USER CHANGES THIS SUPPLIER IT WILL NOT BE UPDATED*/
      /* IN lacd_det RECORD. IT WILL BE HOWEVER BE STORED IN THE PENDING   */
      /* VOUCHER RECORD CREATED FOR VOUCHERING THIS ACCRUAL.               */
 
      if use-log-acctg and
         so_fr_terms <> "" and
        (can-find(first sod_det where sod_domain = global_domain
                                 and  sod_nbr = so_nbr
                                 and  sod_fr_list <> ""
                                 and  sod_compl_stat = ""))
      then do transaction on error undo, retry:
 
         /* FREIGHT TERMS MASTER ALREADY VALIDATED */
         for first ft_mstr
            where ft_domain = global_domain
             and  ft_terms = so_fr_terms
         no-lock:
         end.
 
         if available ft_mstr and
            (ft_accrual_level = {&LEVEL_Shipment}
             or ft_accrual_level = {&LEVEL_Line})
         then do:
            lv_shipfrom = "".
 
            for first sod_det where sod_domain = global_domain
                and sod_nbr = so_nbr
                and sod_compl_stat = ""
            no-lock:
               lv_shipfrom = sod_site.
            end.
 
            if ft_accrual_level = {&LEVEL_Shipment} and so_site <> "" then
               lv_shipfrom = so_site.
 
            view frame a.
 
            /* DISPLAY LOGISTICS CHARGE CODE DETAIL */
            {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                        &param  = """(input 'ADD',
                                      input '{&TYPE_SO}',
                                      input so_nbr,
                                      input lv_shipfrom,
                                      input ft_lc_charge,
                                      input ft_accrual_level,
                                      input yes,
                                      input yes)"""}
 
            /* GET THE SO SHIPMENT SEQUENCE ID DEFINED IN LOGISTICS     */
            /* ACCOUNTING CONTROL FILE.                                 */
            lv_nrm_seqid = "".
            for first lac_ctrl where lac_domain = global_domain
            no-lock:
               lv_nrm_seqid = lac_soship_nrm_id.
            end.
 
            /* ASSIGN SHIPMENT ID */
            {us/gp/gprunmo.i  &module = "LA" &program = "lalgship.p"
                        &param  = """(input lv_nrm_seqid,
                                      output lv_shipment_id,
                                      input-output lv_undo_flag)"""}
 
            if lv_undo_flag and batchrun then
               undo upperloop, leave upperloop.
            else if lv_undo_flag then
               undo mainloop, retry mainloop.
         end.
      end.
 
      /* TEST FOR PRICING OR REPRICING REQUIREMENTS AND SUBSEQUENT */
      /* PROCESSING                                                */
 
      /* SKIPPING REPRICING AFTER LINE PROCESSING FOR RETROBILLED ITEMS */
      if not l_retrobill then
      {us/bbi/gprun.i ""sosoprc.p"" "(input so_recno,
                               input reprice,
                               input new_order,
                               input line_pricing)" }
 
      view frame a.
      display so_mstr.so_ship with frame a.
 
      do transaction on error undo, retry:
         {us/gp/gpgettrl.i &hdr_file="so" &ctrl_file="soc"}
 
         if new_order
            and soc_use_frt_trl_cd
         then do:
            for first fr_mstr where fr_domain = global_domain
                  and   fr_list = so_fr_list
                  and   fr_site = so_site
                  and   fr_curr = so_curr
            no-lock:
               so_trl1_cd = fr_trl_cd.
            end. /* FOR FIRST fr_mstr */
 
         end. /* IF new-order and ... */
 
         if current_cr_terms <> "" and current_cr_terms <> so_cr_terms then
         assign
            so_cr_terms = current_cr_terms
            cr_terms_changed = yes.
 
         if current_fr_terms <> ""
            and so_manual_fr_terms  = no
         then
            so_fr_terms = current_fr_terms.
 
         assign
            current_cr_terms = ""
            current_fr_terms = "".
 
         /* CALCULATE FREIGHT */
         if calc_fr and so_fr_terms = "" then do:
            /* INVALID FRT TERMS */
            {us/bbi/pxmsg.i &MSGNUM=671 &ERRORLEVEL=2 &MSGARG1=so_fr_terms}
         end. /* if calc_fr and so_fr_terms */
 
         if calc_fr and so_mstr.so_fr_terms <> ""
         then do:
            so_mstr_recid = recid(so_mstr).
            {us/bbi/gprun.i ""sofrcali.p""}
         end.
 
      end.   /* do transaction */
 
      /* TRAILER */
      cm_recno = recid(bill_cm).
      {us/bbi/gprun.i ""soivmtc.p""}
 
      /* Global Shipping: Generate Shipper and Legal Doc */
      if c_tr_trnbr1 <> c_tr_trnbr2 then /* There's qty changed for same order*/
         run p_dispatchNoteShipper.
 
      {us/gp/gpdelp.i "soccval" "p"} /*Delete persistent procedure*/
 
      if impexp then do:
         imp-okay = no.
         {us/bbi/gprun.i ""iemstrcr.p"" "(input ""1"",
            input so_nbr,
            input recid(so_mstr),
            input-output imp-okay )"}
      end.
 
      /* IMPORT EXPORT FLAG IS SET TO YES CALL THE IMPORT EXPORT DETAIL */
      /* LINE MAINTENANCE PROGRAM FOR USER TO UPDATE ied_det            */
      importloop:
      do on error  undo importloop, leave importloop
         on endkey undo importloop, leave importloop:
         if not batchrun
            and impexp
         then do:
            impexp_edit = no.
            /* VIEW EDIT IMPORT EXPORT DATA ? */
            {us/bbi/pxmsg.i &MSGNUM=271 &ERRORLEVEL=1 &CONFIRM=impexp_edit}
            if impexp_edit
            then do:
               upd_okay = no.
               hide all no-pause.
               view frame dtitle.
               view frame a.
               {us/bbi/gprun.i ""iedmta.p"" "(input ""1"",
                                       input so_nbr,
                                       input-output upd_okay )" }
            end. /* IF impexp_edit*/
         end. /* IF NOT  batchrun */
      end. /* DO ON ERROR UNDO */
 
      /* SEE IF INTRASTAT IS ENABLED */
      for first iec_ctrl where iec_domain = global_domain
           and iec_use_instat = yes
      no-lock:
 
         for each sod_det where sod_domain = global_domain
               and sod_nbr    = so_nbr
         no-lock:
 
            if sod_qty_inv = 0
            and not can-find(first ieh_hist
                                where ieh_hist.ieh_domain = global_domain
                                  and ieh_authority       = iec_authority
                                  and ieh_type            = "1"
                                  and ieh_nbr             = sod_nbr
                                  and ieh_line            = sod_line
                                  and ieh_ref             = ""
                                  and ieh_voucher         = ""
                                  and ieh_reported        = false)
            then
               next.
 
            /* CREATE IMPORT EXPORT HISTORY RECORD */
        /* ADDED THITD INPUT PARAMETER TO AVOID PARAMETER MISMATCH   */
        /* ADDED FOURTH INPUT PARAMETER TO AVOID PARAMETER MISMATCH  */
            {us/bbi/gprun.i ""iehistso.p"" "(buffer sod_det,
                                      input sod_qty_inv,
                                      input """",
                                      input 0,
                                      input so_ship_date,
                                      input ""SHIP"")"}
         end. /* FOR FIRST sod_det */
 
      end. /* FOR FIRST iec_ctrl */
 
      {us/gp/gprunp.i "soldxr" "p" "updateLegalNumToUnpostedGL"}
 
      global_type = comment_type.
 
      release so_mstr.
 
   end. /*mainloop*/
 
end. /*UPPERLOOP*/
 
status input.
 
 
/****************** INTERNAL PROCEDURES **********************/
 
PROCEDURE p-get-formats:
   /* -----------------------------------------------------------
   Purpose:     assigns formats of various amount fields to
                variables for use with CDR.
   Parameters:  <none>
   Notes:       Moved out of main line of code to reduce compile
                size
   -------------------------------------------------------------*/
 
   /* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
   assign
      nontax_old      = nontaxable_amt:format in frame sotot
      taxable_old     = taxable_amt:format in frame sotot
      line_tot_old    = line_total:format in frame sotot
      disc_old        = disc_amt:format in frame sotot
      trl_amt_old     = so_trl1_amt:format in frame sotot
      tax_amt_old     = tax_amt:format in frame sotot
      ord_amt_old     = ord_amt:format in frame sotot
      prepaid_old     = so_prepaid:format in frame d
      container_old   = container_charge_total:format in frame sotot
      line_charge_old = line_charge_total:format in frame sotot.
 
   /* SET LIMIT_FMT AND BALANCE_FMT FOR USE IN PXMSG.I */
   assign
      oldcurr     = ""
      balance_fmt = "->>>>,>>>,>>9.99"
      limit_fmt   = "->>>>,>>>,>>9.99".
 
   /* SET LIMIT_FMT ACCORDING TO BASE CURR ROUND METHOD*/
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output limit_fmt,
                             input gl_ctrl.gl_rnd_mthd)"}
   /* SET BALANCE_FMT ACCORDING TO BASE CURR ROUND METHOD*/
   {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output balance_fmt,
                             input gl_ctrl.gl_rnd_mthd)"}
 
END PROCEDURE.
 
PROCEDURE assign_new_so:
   /* -----------------------------------------------------------
   Purpose:     When this is a new Sales Order, assigns all of
                the so_mstr header information
   Parameters:  <none>
   Notes:       Moved out of main line of code to reduce compile size
   -------------------------------------------------------------*/
 
   find first soc_ctrl where soc_domain = global_domain no-lock.
   find current so_mstr.
 
   find cm_mstr
      where cm_mstr.cm_domain = global_domain
        and cm_mstr.cm_addr = so_cust
   no-lock.
 
   find bill_cm
      where bill_cm.cm_domain = global_domain
        and bill_cm.cm_addr = so_bill
   no-lock.
 
   find ad_mstr
      where ad_domain = global_domain
       and  ad_addr = so_bill
   no-lock.
 
   if ad_inv_mthd = "" then do:
      find ad_mstr
         where ad_domain = global_domain
          and  ad_addr = so_ship  no-lock.
      if ad_inv_mthd = "" then
         find ad_mstr
            where ad_domain = global_domain
             and  ad_addr = so_cust  no-lock.
   end.
 
   l_inv_mthd = ad_inv_mthd.
 
   if so_cust <> so_ship
   then do:
      if can-find(cm_mstr where cm_mstr.cm_domain = global_domain and
                                cm_mstr.cm_addr = so_ship)
      then do:
         for first cm_mstr where cm_mstr.cm_domain = global_domain
              and  cm_mstr.cm_addr = so_ship
         no-lock:
            so_lang = cm_mstr.cm_lang.
         end. /* FOR FIRST cm_mstr */
      end. /* IF CAN-FIND */
      else do:
         for first ad_mstr where ad_domain = global_domain
             and  ad_addr = so_ship
         no-lock:
            so_lang = ad_lang.
         end. /* FOR FIRST ad_mstr */
      end. /* ELSE DO */
   end. /* IF so_cust <> so_ship */
 
   else
      assign so_lang = cm_mstr.cm_lang.
 
   /* SO_FIX_PR = YES FOR RETROBILLED ITEMS       */
   /* TO AVOID SALES ORDER REPRICING.             */
   /* NO CUSTOMER DISCOUNT FOR RETROBILLED ITEMS. */
   assign
      so_cr_terms  = bill_cm.cm_cr_terms
      so_curr      = bill_cm.cm_curr
      so_fix_pr    = if not l_retrobill then cm_mstr.cm_fix_pr else yes
      so_disc_pct  = if not l_retrobill then cm_mstr.cm_disc_pct else 0
      so_shipvia   = cm_mstr.cm_shipvia
      so_partial   = cm_mstr.cm_partial
      so_rmks      = cm_mstr.cm_rmks
      so_site      = cm_mstr.cm_site
      so_taxable   = cm_mstr.cm_taxable
      so_taxc      = cm_mstr.cm_taxc
      so_pst       = cm_mstr.cm_pst
      so_fst_id    = cm_mstr.cm_fst_id
      so_pst_id    = ad_pst_id
      so_fr_list   = cm_mstr.cm_fr_list
      so_fr_terms  = cm_mstr.cm_fr_terms
      so_fr_min_wt = cm_mstr.cm_fr_min_wt
      so_inv_mthd  = l_inv_mthd
      socmmts      = soc_hcmmts
      so_userid    = global_userid.
 
   {us/bbi/gprun.i ""gpsiver.p""
      "(input so_site, input ?, output return_int)"}
 
   if return_int = 0 then do:
      /* USER DOES NOT HAVE ACCESS TO DEFAULT SITE */
      {us/bbi/pxmsg.i &MSGNUM=2711 &ERRORLEVEL=2 &MSGARG1=so_site}
      so_site = "".
      display so_site with frame b.
   end.
 
   socrt_int = 0.
 
   if so_cr_terms <> "" then do:
      find ct_mstr where ct_domain = global_domain
                     and ct_code = so_cr_terms
      no-lock no-error.
      if available ct_mstr then
         socrt_int = ct_terms_int.
   end.
 
   if not l_vq_use_sold
   then do:
      for first cm_mstr
         where cm_mstr.cm_domain = global_domain
         and   cm_mstr.cm_addr   = so_ship
      no-lock:
         assign
            so_taxable   = cm_mstr.cm_taxable
            so_tax_usage = cm_mstr.cm_tax_usage
            so_taxc      = cm_mstr.cm_taxc.
      end.
 
      if not available (cm_mstr)
      then do:
         for first ad_mstr
            where ad_mstr.ad_domain = global_domain
            and   ad_mstr.ad_addr   = so_ship
         no-lock:
            assign
               so_taxable   = ad_taxable
               so_tax_usage = ad_tax_usage
               so_taxc      = ad_taxc.
         end.
      end.
 
      if not available cm_mstr
      then do:
         for first cm_mstr
            where cm_mstr.cm_domain = global_domain
            and   cm_mstr.cm_addr   = so_cust
         no-lock:
            if not available (ad_mstr)
            then
               assign
                  so_taxable   = cm_mstr.cm_taxable
                  so_tax_usage = cm_mstr.cm_tax_usage
                  so_taxc      = cm_mstr.cm_taxc.
         end.
      end.
   end. /* IF NOT l_vq_use_sold */
   else do:
      for first cm_mstr
         where cm_mstr.cm_domain = global_domain
         and   cm_mstr.cm_addr   = so_ship
      no-lock:
         assign
            so_taxable   = cm_mstr.cm_taxable
            so_taxc      = cm_mstr.cm_taxc.
      end. /* FOR FIRST ad_mstr */
 
      /* If shipto is not a customer then find ad_mstr record for the shipto */
      if not available (cm_mstr)
      then do:
         for first ad_mstr no-lock
            where ad_mstr.ad_domain = global_domain
              and ad_mstr.ad_addr = so_ship:
            assign
               so_taxable   = ad_mstr.ad_taxable
               so_taxc      = ad_mstr.ad_taxc.
         end.
         for first cm_mstr where cm_mstr.cm_domain = global_domain
            and   cm_mstr.cm_addr   = so_cust
         no-lock:
            assign
               so_tax_usage = cm_mstr.cm_tax_usage.
         end. /* FOR FIRST ad_mstr */
      end.
   end. /* IF l_vq_use_sold */
 
   do counter = 1 to 4:
      so_slspsn[counter] = cm_mstr.cm_slspsn[counter].
 
      if cm_mstr.cm_slspsn[counter] <> "" then do:
 
         find sp_mstr
            where sp_domain = global_domain
             and  sp_addr   = cm_mstr.cm_slspsn[counter]
         no-lock no-error.
 
         find spd_det
            where spd_domain  = global_domain
             and  spd_addr    = cm_mstr.cm_slspsn[counter]
             and  spd_prod_ln = ""
             and  spd_part    = ""
             and  spd_cust    = cm_mstr.cm_addr
         no-lock no-error.
 
         if available spd_det then
            so_comm_pct[counter] = spd_comm_pct.
         else
         if available sp_mstr then
            so_comm_pct[counter] = sp_comm_pct.
 
      end. /* if cm_mstr.cm_slspsn[counter] <> ""  */
   end. /* do counter  */
 
   if so_slspsn[2] <> "" or
      so_slspsn[3] <> "" or
      so_slspsn[4] <> ""
   then
      mult_slspsn = true.
   else
      mult_slspsn = false.
 
 
END PROCEDURE. /* assign_new_so */
 
PROCEDURE new-proc-j2dd:
   /* -----------------------------------------------------------
   Purpose:     Reads soc_ctrl and mfc_control and sets local
                variables
   Parameters:  None
   Notes:       Moved out of main line of code to reduce compile
                size, new procedure in /*J2DD*/
   -------------------------------------------------------------*/
 
   do transaction on error undo, retry:
      find first soc_ctrl where soc_domain = global_domain no-lock
      no-error.
      if not available soc_ctrl then do:
         create soc_ctrl.
         soc_domain = global_domain.
      end.
      assign
         ln_fmt = soc_ln_fmt
         comment_type = global_type.
   end.
 
   do transaction on error undo, retry:
      /* SET UP PRICING BY LINE VALUES */
      find first mfc_ctrl
         where mfc_domain = global_domain
           and mfc_field = "soc_pc_line"
      no-lock no-error.
      if available mfc_ctrl then
         soc_pc_line = mfc_logical.
   end.
 
   do transaction on error undo, retry:
      for first mfc_ctrl where mfc_domain = global_domain
           and mfc_field = "l_vqc_sold_usage"
      no-lock:
         l_vq_use_sold = mfc_logical.
      end. /* FOR FIRST mfc_ctrl */
   end. /* DO TRANSACTION */
 
END PROCEDURE. /* new-proc-j2dd */
 
PROCEDURE p-disp-frameb:
   /* -----------------------------------------------------------
   Purpose:     Displays information in frame b
   Parameters:  None
   Notes:       Moved out of main line of code to reduce compile
                size, new procedure in /*L00L*/
   -------------------------------------------------------------*/
 
   find first soc_ctrl where soc_domain = global_domain
   no-lock no-error.
 
   /* THE FOLLOWING CODE WAS ADDED FROM soivmtdi.i */
   if new_order then
      socmmts = soc_hcmmts.
   else
      socmmts = (so_mstr.so_cmtindx <> 0).
 
   display
      so_ord_date
      so_ship_date
      so_req_date
      so_pr_list
      so_curr
      so_lang
      perform_date
      so_site
      so_taxable
      so_taxc
      so_tax_date
      so_due_date
      so_channel
      so_fix_pr
      so_pricing_dt
      so_project
      so_cr_terms
      so_po
      socrt_int
      so_rmks
      reprice
      so_userid
      so_daybookset
   with frame b.
 
END PROCEDURE.  /* p-disp-frameb */
 
PROCEDURE p-shipto-change:
   /* -----------------------------------------------------------
   Purpose:     Check to see if valid to change ship-to and reassign
                tax fields in so_mstr header record if valid
   Parameters:
   so_recno:   input parm   Contains recid of current SO
   l_undo_ship output parm  If no then don't change ship-tp
   Notes:
   -------------------------------------------------------------*/
   define input parameter so_recno as recid no-undo.
   define input-output parameter l_undo_shipto like mfc_logical no-undo.
 
   find so_mstr where recid(so_mstr) = so_recno exclusive-lock.
 
   /* SHIP-TO CANNOT BE CHANGED; QUANTITY TO INVOICE EXISTS */
   if l_old_shipto <> "" and l_old_shipto <> so_ship
   then do:
      if can-find(first sod_det where sod_domain = global_domain
                                 and  sod_nbr = so_nbr
                                 and  sod_qty_inv <> 0
                                 and  sod_compl_stat = "" )
      then do:
         l_undo_shipto = true.
         /* OUTSTANDING QTY TO INVOICE, SHIP-TO TAXES CANNOT BE UPDATED */
         {us/bbi/pxmsg.i &MSGNUM=2363 &ERRORLEVEL=4}
         if not batchrun then pause.
         leave.
      end. /* if can-find */
   end. /* if l_old_shipto */
 
   if not batchrun
      and l_old_shipto <> ""
      and l_old_shipto <> so_ship
      and not l_vq_use_sold
   then do:
 
      /* SHIP-TO CHANGED; UPDATE TAX DATA? */
      {us/bbi/pxmsg.i &MSGNUM=2351 &ERRORLEVEL=1 &CONFIRM=l_edittax}
 
      if l_edittax then do:
 
         /* LOAD DEFAULT TAX CLASS & USAGE */
         for first cm_mstr
            where cm_mstr.cm_domain = global_domain
              and cm_mstr.cm_addr   = so_ship
         no-lock:
            assign
               so_taxable   = cm_mstr.cm_taxable
               so_tax_usage = cm_mstr.cm_tax_usage
               so_taxc      = cm_mstr.cm_taxc
               so_tax_env   = "".
         end.
 
         if not available cm_mstr
         then do:
            for first ad_mstr
               where ad_mstr.ad_domain = global_domain
                 and ad_mstr.ad_addr   = so_cust
            no-lock:
               assign
                  so_taxable   = ad_mstr.ad_taxable
                  so_tax_usage = ad_mstr.ad_tax_usage
                  so_taxc      = ad_mstr.ad_taxc
                  so_tax_env   = "".
            end.
         end.
 
         if not available(cm_mstr) and
            not available(ad_mstr)
         then do:
            for first cm_mstr
               where cm_mstr.cm_domain = global_domain
                 and cm_mstr.cm_addr   = so_cust
            no-lock:
               assign
                  so_taxable   = cm_mstr.cm_taxable
                  so_tax_usage = cm_mstr.cm_tax_usage
                  so_taxc      = cm_mstr.cm_taxc
                  so_tax_env   = "".
            end.
         end.
 
      end.  /* if l_edittax is true */
 
   end. /* if ship-to changed in GTM and not batchrun */
 
   l_undo_shipto = false.
 
END PROCEDURE.  /* p-shipto-change */
 
PROCEDURE p_dispatchNoteShipper:
 
   define buffer soddet for sod_det.
   define buffer tr_hist for tr_hist.
   define buffer qad_wkfl for qad_wkfl.
 
   define variable t_qty       like sod_det.sod_qty_ord no-undo.
   define variable t_line_list as character     no-undo.
   define variable t_new_list  as character     no-undo.
 
   for first qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID
   exclusive-lock:
      qad_logfld[1] = no.
   end.

   if not can-find (qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID)
   then do transaction:
      create qad_wkfl.
      assign
         qad_domain = global_domain
         qad_key1 = "SHIPPER"
         qad_key2 = SessionUniqueID
         qad_logfld[1] = no.
   end.
  
   {us/bbi/gprun.i ""icshmt1c.p""}
 
   assign
      v_lines_found = no
      t_line_list   = ""
      t_new_list    = "".
 
   /*CREATE SHIPPER FIRST*/
   for each sod_det
      where sod_det.sod_domain = global_domain
      and sod_det.sod_nbr = so_mstr.so_nbr
      and sod_det.sod_qty_ship <> 0
   no-lock:
 
      find pt_mstr where pt_domain = global_domain and
         pt_part = sod_det.sod_part
      no-lock no-error.
 
      /* ADD TO SHIPPER LINE ITEM TEMP TABLE */
      {us/bbi/gprun.i ""icshmt1a.p""
         "(sod_det.sod_nbr,
           sod_det.sod_line,
           sod_det.sod_part,
           sod_det.sod_serial,
           sod_det.sod_ref,
           sod_det.sod_site,
           sod_det.sod_loc,
           sod_qty_inv,
           sod_det.sod_um,
           sod_det.sod_um_conv,
           if avail pt_mstr then
           pt_net_wt * sod_qty_inv
           else 0,
           if avail pt_mstr then
           pt_net_wt_um
           else """",
           if avail pt_mstr then
           pt_size * sod_qty_inv
           else 0,
           if avail pt_mstr then
           pt_size_um
           else """" )" }
 
      assign
         v_lines_found = true
         t_line_list = t_line_list + ( if t_line_list = "" then ""
                              else "," ) +  string(sod_det.sod_line).
   end.
 
   if v_lines_found then do:
 
      {us/bbi/gprun.i ""icshmt.p""
         "(so_site,
           so_ship,
           ""ISS-SO"",
           eff_date,
           ""no"",
           output v_abs_recid,
           output v_trflow_flg)" }
 
      find abs_mstr where recid(abs_mstr) = v_abs_recid no-lock no-error.
 
      if available abs_mstr
      then do:
 
         for each tr_hist
            where tr_domain = global_domain
             and  tr_nbr  = so_nbr and
                  tr_date = today  and
                  tr_type = "ISS-SO" and
                  can-do(t_line_list, string(tr_line)) and
                  tr_ship_id = ""
         exclusive-lock:
            assign
               tr_ship_id       = substring(abs_id,2)
               tr_ship_inv_mov  = abs_inv_mov
               tr_ship_date     = abs_shp_date.
         end.
 
         /* If the transaction flow is not internal,
            then print legal document*/
         if v_trflow_flg = yes then do:
            /* Assign Legal Doc nbr */
            {us/bbi/gprun.i ""gpldnbr.p"" "(recid(abs_mstr))"}
 
            /* get comments data */
            {us/bbi/gprun.i ""gpldcmt.p"" "(recid(abs_mstr), 'SO')"}
 
            /* Save site(from/to) and location(from/to) values to lgd_mstr */
            for first lgd_mstr where lgd_domain = global_domain
               and lgd_shipper_id = abs_mstr.abs_id
               and lgd_type = yes no-lock:
               {us/px/pxrun.i &PROC='saveLegalSiteLoc' &PROGRAM='soldxr.p'
                        &HANDLE=ph_mglbxr
                        &PARAM="(input abs_id,
                                 input so_site,
                                 input lgd_loc,
                                 input so_ship,
                                 input '')"
                        &NOAPPERROR=true
                        &CATCHERROR=true}
            end.
 
            /* Print Legal Document */
            {us/bbi/gprun.i ""icldprt.p"" "(recid(abs_mstr))"}
         end.
      end.
 
   end.
 
   /*CREATE BACK SHIPPER NOW */
   for first qad_wkfl where qad_domain = global_domain
      and qad_key1 = "SHIPPER"
      and qad_key2 = SessionUniqueID
   exclusive-lock:
      qad_logfld[1] = yes.
   end.
 
   /* CLEAR SHIPPER LINE ITEM TEMP TABLE */
   {us/bbi/gprun.i ""icshmt1c.p""}
 
   assign v_lines_found = no
          t_line_list   = "".
 
   for each sod_det no-lock where sod_det.sod_domain = global_domain
                              and sod_det.sod_nbr = so_mstr.so_nbr
                              and sod_det.sod_qty_ship <> 0
      and can-do(t_line_list, string(sod_det.sod_line)) = false:
 
      if can-do(t_new_list, string(sod_det.sod_line)) then next.
 
      find first t_sod_qty where t_sod_qty.t_line = sod_det.sod_line
      no-lock no-error.
 
      if available t_sod_qty then t_qty = t_qty_ship.
 
      if t_qty >= 0 then next.
 
      t_new_list = t_new_list + ( if t_new_list = "" then ""
                                  else "," ) +  string(sod_det.sod_line).
 
      /* ADD TO SHIPPER LINE ITEM TEMP TABLE */
      {us/bbi/gprun.i ""icshmt1a.p""
         "(sod_det.sod_nbr,
           sod_det.sod_line,
           sod_det.sod_part,
           sod_det.sod_serial,
           sod_det.sod_ref,
           sod_det.sod_site,
           sod_det.sod_loc,
           t_qty,
           sod_det.sod_um,
           sod_det.sod_um_conv,
           if avail pt_mstr then
           pt_net_wt * t_qty
           else 0,
           if avail pt_mstr then
           pt_net_wt_um
           else """",
           if avail pt_mstr then
           pt_size * t_qty
           else 0,
           if avail pt_mstr then
           pt_size_um
           else """" )" }
 
      assign v_lines_found = true.
 
   end.
 
   if v_lines_found then do:
 
      /*HIDE FRAME SHIP-DATE.*/
      {us/bbi/gprun.i ""icshmt.p""
         "(so_site,
           so_ship,
           ""ISS-SO"",
           eff_date,
           ""no"",
           output v_abs_recid,
           output v_trflow_flg)" }
 
      find abs_mstr where recid(abs_mstr) = v_abs_recid no-lock no-error.
      if available abs_mstr then do:
         for each tr_hist
            where tr_domain = global_domain and
                  tr_nbr  = so_nbr    and
                  tr_date = today     and
                  tr_type = "ISS-SO"  and
                  can-do(t_new_list, string(tr_line))     and
                  tr_ship_id = ""
         exclusive-lock:
            assign
               tr_ship_id       = substring(abs_id,2)
               tr_ship_inv_mov  = abs_inv_mov
               tr_ship_date     = abs_shp_date.
         end.
      end.
   end.
 
   for first qad_wkfl where qad_wkfl.qad_domain = global_domain and
      qad_key1 = "SHIPPER" and
      qad_key2 = SessionUniqueID
   exclusive-lock:
      delete qad_wkfl.
   end.
 
END PROCEDURE.
