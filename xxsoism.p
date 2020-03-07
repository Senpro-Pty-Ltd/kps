/* xxsoism.p - SALES ORDER SHIPMENT WITH SERIAL NUMBERS                       */
/* sosoism.p - SALES ORDER SHIPMENT WITH SERIAL NUMBERS                       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoism.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/* REVISION: 1.0      LAST MODIFIED: 07/28/86   BY: PML                       */
/* REVISION: 6.0      LAST MODIFIED: 03/14/90   BY: emb *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 03/14/90   BY: WUG *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 04/30/90   BY: MLB *D021*                */
/* REVISION: 6.0      LAST MODIFIED: 12/17/90   BY: WUG *D447*                */
/* REVISION: 6.0      LAST MODIFIED: 01/14/91   BY: emb *D313*                */
/* REVISION: 6.0      LAST MODIFIED: 02/18/91   BY: afs *D354*                */
/* REVISION: 6.0      LAST MODIFIED: 03/18/91   BY: MLB *D443*                */
/* REVISION: 6.0      LAST MODIFIED: 04/03/91   BY: afs *D477*   (rev only)   */
/* REVISION: 6.0      LAST MODIFIED: 04/08/91   BY: afs *D497*                */
/* REVISION: 6.0      LAST MODIFIED: 04/09/91   BY: afs *D510*                */
/* REVISION: 6.0      LAST MODIFIED: 05/09/91   BY: emb *D643*                */
/* REVISION: 6.0      LAST MODIFIED: 05/28/91   BY: emb *D661*                */
/* REVISION: 6.0      LAST MODIFIED: 06/04/91   BY: emb *D673*                */
/* REVISION: 6.0      LAST MODIFIED: 09/19/91   BY: afs *F040*                */
/* REVISION: 7.0      LAST MODIFIED: 10/30/91   BY: MLV *F029*                */
/* REVISION: 7.0      LAST MODIFIED: 11/13/91   BY: WUG *D887*                */
/* REVISION: 7.0      LAST MODIFIED: 11/18/91   BY: WUG *D858*                */
/* REVISION: 7.0      LAST MODIFIED: 11/18/91   BY: WUG *D953*                */
/* REVISION: 7.0      LAST MODIFIED: 11/25/91   BY: SAS *F017*                */
/* REVISION: 7.0      LAST MODIFIED: 02/12/92   BY: pma *F190*                */
/* REVISION: 7.0      LAST MODIFIED: 02/19/92   BY: afs *F209*                */
/* REVISION: 7.0      LAST MODIFIED: 04/22/92   BY: afs *F379*                */
/* REVISION: 7.0      LAST MODIFIED: 06/16/92   BY: tjs *F504*                */
/* REVISION: 7.0      LAST MODIFIED: 07/01/92   BY: tjs *F726*                */
/* REVISION: 7.0      LAST MODIFIED: 07/27/92   BY: tjs *F732*                */
/* REVISION: 7.0      LAST MODIFIED: 07/23/92   BY: tjs *F805*                */
/* REVISION: 7.3      LAST MODIFIED: 09/17/92   BY: tjs *G035*                */
/* REVISION: 7.3      LAST MODIFIED: 09/27/92   BY: jcd *G247*                */
/* REVISION: 7.2      LAST MODIFIED: 11/09/92   BY: emb *G292*                */
/* REVISION: 7.3      LAST MODIFIED: 11/09/92   BY: afs *G302*                */
/* REVISION: 7.3      LAST MODIFIED: 12/05/92   BY: mpp *G484*                */
/* REVISION: 7.3      LAST MODIFIED: 02/19/93   BY: tjs *G702*                */
/* REVISION: 7.2      LAST MODIFIED: 03/16/93   BY: tjs *G451*                */
/* REVISION: 7.3      LAST MODIFIED: 03/18/93   BY: afs *G818*                */
/* REVISION: 7.3      LAST MODIFIED: 04/26/93   BY: WUG *GA39*                */
/* REVISION: 7.3      LAST MODIFIED: 06/09/93   BY: sas *GB82*                */
/* REVISION: 7.3      LAST MODIFIED: 06/11/93   BY: sas *GC18*                */
/* REVISION: 7.3      LAST MODIFIED: 06/25/93   BY: WUG *GC74*                */
/* REVISION: 7.3      LAST MODIFIED: 06/28/93   BY: afs *GC22*                */
/* REVISION: 7.3      LAST MODIFIED: 07/01/93   BY: jjs *GC96*                */
/* REVISION: 7.3      LAST MODIFIED: 07/27/93   BY: tjs *GD76*                */
/* REVISION: 7.4      LAST MODIFIED: 07/22/93   BY: pcd *H039*                */
/* REVISION: 7.4      LAST MODIFIED: 08/23/93   BY: cdt *H049*                */
/* REVISION: 7.4      LAST MODIFIED: 11/14/93   BY: afs *H222*                */
/* REVISION: 7.4      LAST MODIFIED: 01/24/94   BY: afs *FL52*                */
/* REVISION: 7.4      LAST MODIFIED: 07/20/94   BY: bcm *H447*                */
/* Oracle changes (share-locks)      09/13/94   BY: rwl *FR31*                */
/* REVISION: 7.4      LAST MODIFIED: 09/23/94   BY: ljm *GM78*                */
/* REVISION: 8.5      LAST MODIFIED: 10/05/94   BY: mwd *J034*                */
/* REVISION: 8.5      LAST MODIFIED: 10/21/94   BY: rmh *FQ08*                */
/* REVISION: 8.5      LAST MODIFIED: 11/01/94   BY: ame *GN90*                */
/* REVISION: 8.5      LAST MODIFIED: 11/11/94   BY: jxz *FT56*                */
/* REVISION: 8.5      LAST MODIFIED: 12/20/94   BY: rxm *F0B4*                */
/* REVISION: 8.5      LAST MODIFIED: 01/07/95   BY: smp *G0BM*                */
/* REVISION: 8.5      LAST MODIFIED: 01/16/95   BY: rxm *F0F0*                */
/* REVISION: 8.5      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 8.5      LAST MODIFIED: 03/30/95   BY: pmf *G0JW*                */
/* REVISION: 8.5      LAST MODIFIED: 06/16/95   BY: rmh *J04R*                */
/* REVISION: 8.5      LAST MODIFIED: 04/06/95   BY: tvo *H0BJ*                */
/* REVISION: 8.5      LAST MODIFIED: 07/18/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 02/07/96   BY: ais *G0NX*                */
/* REVISION: 8.5      LAST MODIFIED: 03/11/96   BY: wjk *J0DV*                */
/* REVISION: 8.5      LAST MODIFIED: 04/15/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/15/96   BY: *J04C* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: *G1Y6* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 07/18/96   BY: *J0ZX* Andy Wasilczuk     */
/* REVISION: 8.5      LAST MODIFIED: 07/28/96   BY: *J0ZZ* Tamra Farnsworth   */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Kurt De Wit        */
/* REVISION: 8.6      LAST MODIFIED: 11/25/96   BY: *K01X* Jeff Wootton       */
/* REVISION: 8.6      LAST MODIFIED: 01/02/97   BY: *J1D8* Sue Poland         */
/* REVISION: 8.6      LAST MODIFIED: 05/14/97   BY: *G2MT* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 07/14/97   BY: *G2NY* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 07/11/97   BY: *K0DH* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 09/02/97   BY: *J205* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 10/24/97   BY: *K0JV* Surendra Kumar     */
/* REVISION: 8.6      LAST MODIFIED: 10/29/97   BY: *G2Q3* Steve Nugent       */
/* REVISION: 8.6      LAST MODIFIED: 11/03/97   BY: *J22N* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 11/07/97   BY: *K15N* Jim Williams       */
/* REVISION: 8.6      LAST MODIFIED: 01/14/98   BY: *J29W* Aruna Patil        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 04/27/98   BY: *L00L* Adam Harris        */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* REVISION: 8.6E     LAST MODIFIED: 05/12/98   BY: *J2DD* Kawal Batra        */
/* REVISION: 8.6E     LAST MODIFIED: 06/22/98   BY: *H1JB* Niranjan Ranka     */
/* REVISION: 8.6E     LAST MODIFIED: 07/12/98   BY: *L024* Sami Kureishy      */
/* REVISION: 8.6E     LAST MODIFIED: 09/02/98   BY: *H1LZ* Manish Kulkarni    */
/* REVISION: 8.6E     LAST MODIFIED: 09/15/98   BY: *J2YT* Irine D'mello      */
/* REVISION: 8.6E     LAST MODIFIED: 09/16/98   BY: *L092* Steve Goeke        */
/* REVISION: 8.6E     LAST MODIFIED: 02/16/99   BY: *J3B4* Madhavi Pradhan    */
/* REVISION: 9.1      LAST MODIFIED: 07/13/99   BY: *J2MD* A. Philips         */
/* REVISION: 9.1      LAST MODIFIED: 09/08/99   BY: *N02S* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 10/06/99   BY: *N03Z* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 10/21/99   BY: *N04X* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 10/27/99   BY: *N03P* Mayse Lai          */
/* REVISION: 9.1      LAST MODIFIED: 11/03/99   BY: *N04P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 01/02/00   BY: *N07J* Pat Pigatti        */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 02/16/00   BY: *N06R* Denis Tatarik      */
/* REVISION: 9.1      LAST MODIFIED: 04/21/00   BY: *N09J* Denis Tatarik      */
/* REVISION: 9.1      LAST MODIFIED: 06/05/00   BY: *N0CZ* John Pison         */
/* REVISION: 9.1      LAST MODIFIED: 07/11/00   BY: *M0PQ* Falguni Dalal      */
/* REVISION: 9.1      LAST MODIFIED: 07/20/00   BY: *L0QV* Manish Kulkarni    */
/* REVISION: 9.1      LAST MODIFIED: 08/16/00   BY: *N0K6* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 09/25/00   BY: *M0T3* Rajesh Kini        */
/* REVISION: 9.1      LAST MODIFIED: 12/14/00   BY: *M0XX* Ashwini Ghaisas    */
/* REVISION: 9.1      LAST MODIFIED: 01/11/01   BY: *M0XM* Rajesh Lokre       */
/* REVISION: 9.1      LAST MODIFIED: 10/10/00   BY: *N0WB* Mudit Mehta        */
/* Revision: 1.34.1.34     BY: Katie Hilbert       DATE: 04/01/01 ECO: *P002* */
/* Revision: 1.34.1.35     BY: Ellen Borden        DATE: 07/09/01 ECO: *P007* */
/* Revision: 1.34.1.36     BY: Annasaheb Rahane    DATE: 09/12/01 ECO: *N129* */
/* Revision: 1.34.1.39     BY: Nikita Joshi        DATE: 01/14/02 ECO: *M1MH* */
/* Revision: 1.34.1.40     BY: Santosh Rao         DATE: 02/18/02 ECO: *N19C* */
/* Revision: 1.34.1.41     BY: Rajaneesh Sarangi   DATE: 02/21/02 ECO: *L13N* */
/* Revision: 1.34.1.45     BY: Patrick Rowan       DATE: 04/24/02 ECO: *P00G* */
/* Revision: 1.34.1.47     BY: Jean Miller         DATE: 05/21/02 ECO: *P05V* */
/* Revision: 1.34.1.50     BY: Samir Bavkar        DATE: 05/08/02 ECO: *P042* */
/* Revision: 1.34.1.53     BY: Robin McCarthy      DATE: 07/03/02 ECO: *P08Q* */
/* Revision: 1.34.1.54     BY: Robin McCarthy      DATE: 07/15/02 ECO: *P0BJ* */
/* Revision: 1.34.1.56     BY: Samir Bavkar        DATE: 08/15/02 ECO: *P09K* */
/* Revision: 1.34.1.57     BY: Samir Bavkar        DATE: 08/18/02 ECO: *P0FS* */
/* Revision: 1.34.1.58     BY: Samir Bavkar        DATE: 08/28/02 ECO: *P0H5* */
/* Revision: 1.34.1.59     BY: Deepak Rao          DATE: 10/24/02 ECO: *N1Y3* */
/* Revision: 1.34.1.60     BY: Robin McCarthy      DATE: 11/08/02 ECO: *P0JS* */
/* Revision: 1.34.1.61     BY: Mercy Chittilapilly DATE: 01/15/03 ECO: *N244* */
/* Revision: 1.34.1.62     BY: Dorota Hohol        DATE: 02/25/03 ECO: *P0N6* */
/* Revision: 1.34.1.63     BY: Narathip W.         DATE: 05/08/03 ECO: *P0RL* */
/* Revision: 1.34.1.65     BY: Paul Donnelly (SB)  DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.34.1.66     BY: Ed van de Gevel     DATE: 07/08/03 ECO: *Q003* */
/* Revision: 1.34.1.67     BY: Deepak Rao          DATE: 08/20/03 ECO: *N2K3* */
/* Revision: 1.34.1.68     BY: Deepak Rao          DATE: 09/08/03 ECO: *N2KM* */
/* Revision: 1.34.1.69     BY: Mercy Chittilapilly DATE: 01/12/04 ECO: *P1JM* */
/* Revision: 1.34.1.72     BY: Robin McCarthy      DATE: 04/19/04 ECO: *P15V* */
/* Revision: 1.34.1.73     BY: Robin McCarthy      DATE: 08/09/04 ECO: *Q0BZ* */
/* Revision: 1.34.1.74     BY: Ed van de Gevel     DATE: 06/10/04 ECO: *Q08R* */
/* Revision: 1.34.1.75     BY: Bhavik Rathod       DATE: 11/26/04 ECO: *P2X0* */
/* Revision: 1.34.1.77     BY: Vinod Kumar         DATE: 12/06/04 ECO: *P2TK* */
/* Revision: 1.34.1.78     BY: Abhishek Jha        DATE: 01/16/05 ECO: *P34D* */
/* Revision: 1.34.1.80     BY: Abhishek Jha        DATE: 01/26/05 ECO: *P353* */
/* Revision: 1.34.1.81     BY: Bhagyashri Shinde   DATE: 02/04/05 ECO: *P36P* */
/* Revision: 1.34.1.84     BY: Ed van de Gevel     DATE: 03/01/05 ECO: *R00G* */
/* Revision: 1.34.1.85     BY: Shoma Salgaonkar    DATE: 03/10/05 ECO: *P3CF* */
/* Revision: 1.34.1.86    BY : Ed van de Gevel    DATE : 18/03/05 ECO: *R00F* */
/* Revision: 1.34.1.87    BY : Ed van de Gevel    DATE : 05/26/05 ECO: *P3MP* */
/* Revision: 1.34.1.88    BY : Vinod Kumar        DATE : 07/07/05 ECO: *Q0K1* */
/* Revision: 1.34.1.89    BY : Priya Idnani       DATE : 08/22/05 ECO: *P3YR* */
/* Revision: 1.34.1.90    BY : Andrew Dedman      DATE : 08/16/05 ECO: *R01P* */
/* Revision: 1.34.1.92    BY : Jean Miller        DATE : 01/11/06 ECO: *Q0PD* */
/* Revision: 1.34.1.93    BY: Jean Miller         DATE: 02/20/06  ECO: *Q0R5* */
/* Revision: 1.34.1.94    BY: Munira Savai        DATE: 04/24/06  ECO: *P4N7* */
/* Revision: 1.34.1.95    BY: Katie Hilbert       DATE: 07/25/07  ECO: *R0C6* */
/* Revision: 1.34.1.102   BY: Jean Miller         DATE: 06/20/08  ECO: *R0VG* */
/* Revision: 1.34.1.115   BY: Nan Zhang           DATE: 06/20/08  ECO: *R0JS* */
/* Revision: 1.34.1.117   BY: Niranjan Ranka      DATE: 10/15/08  ECO: *R19N* */
/* Revision: 1.34.1.118   BY: Yizhou Mao          DATE: 11/28/08  ECO: *R18K* */
/* Revision: 1.34.1.119   BY: Jiang Wan           DATE: 12/20/08  ECO: *R1BY* */
/* Revision: 1.34.1.120   BY: Hemant Dhavse       DATE: 03/17/09  ECO: *Q2KX* */
/* Revision: 1.34.1.121   BY: Jordan Fei          DATE: 07/30/09  ECO: *R1N2* */
/* Revision: 1.34.1.122   BY: Jean Miller         DATE: 09/02/09  ECO: *Q3C7* */
/* Revision: 1.34.1.123   BY: Jean Miller         DATE: 09/24/09  ECO: *P69Z* */
/* Revision: 1.34.1.124   BY: Niranjan Ranka      DATE: 11/28/09  ECO: *Q3LN* */
/* Revision: 1.34.1.125   BY: Jordan Fei          DATE: 09/28/09  ECO: *R1V9* */
/* Revision: 1.34.1.126   BY: Miguel Alonso       DATE: 01/13/10  ECO: *R1WN* */
/* CYB    LAST MODIFIED: 22-JUL-2010    BY:  nac *q9021*cy1024*              */
/* CYB           MODIFIED: 09-MAY-2011            BY: psu *cy1021*            */
/* CYB    APPLY PATCH MFGS-618 06-JUN-2011        BY: nac *Q9021-CRD16C*      */
/* CENTURY YUASA      LAST MODIFIED: 18-AUG-2011 BY: gbg *cy1044*          */
/* CYB   LAST MODIFIED: 23-AUG-2011     BY: gbg *cy1047                       */
/* CYB    LAST MODIFIED: 19-AUG-2010    BY:  gbg *CA839672*                   */
/* CYB    LAST MODIFIED:                BY:  nac *ca791753*                  */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 03-OCT-2011    BY:  gbg *c1254*                     */
/* CYB   LAST MODIFIED: 31-JAN-2012  BY:  gbg *c1279*                  */
/* CYB   LAST MODIFIED: 28-SEP-2012  BY:  gbg *c1346*                  */
/* CYB    LAST MODIFIED: 02-OCT-2012    BY:  gbg *c1348*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 22-FEB-2013    BY:  gbg *c1367*                      */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
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
 
/*****************************************************************************/
/*                                                                           */
/*    Any for each loops which go through every sod_det for a                */
/*    so_nbr (i.e. for each sod_det where sod_nbr = so_nbr )                 */
/*    should have the following statments first in the loop.                 */
/*                                                                           */
/*       if (sorec = fsrmarec    and sod_fsm_type  <> "RMA-RCT")             */
/*       or (sorec = fsrmaship   and sod_fsm_type  <> "RMA-ISS")             */
/*       or (sorec = fssormaship and sod_fsm_type  =  "RMA-RCT")             */
/*       or (sorec = fssoship    and sod_fsm_type  <> "")                    */
/*       then next.                                                          */
/*                                                                           */
/*    This is to prevent rma receipt line from being processed               */
/*    when issue lines are processed (sas).                                  */
/*                                                                           */
/*    Also, sosoisa.p is called by fsrmamtu.p which is called                */
/*    from fsrmamt.p (rma maintenance). Any shared variables                 */
/*    added to sosoisa.p will need to be added to one or both                */
/*    of the above rma programs....                                          */
/*                                                                           */
/*    !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!        */
/*                                                                           */
/*    NOTE:- This program has been API-ed. Any display, update or set        */
/*            statement should be conditionalized with 'c-application-mode   */
/*            <> "API"'. Please refer to the standards for API-ing source    */
/*            code. Failure to API the code will cause the EDI ECommerce     */
/*            to work incorrectly.                                           */
/*                                                                           */
/*    !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!        */
/*                                                                           */
/*****************************************************************************/
using com.qad.eefin.bdomain.DomainForOperationalInfo.
using com.qad.eefin.bexchangeratetype.ExchangeRateTypeByTypeCode.
using com.qad.eefin.bcurrency.SelectCurrency.
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i}    /* EXTERNAL LABEL INCLUDE */
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/la/laapmtdf.i}
 
{us/so/sosois1.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i fssmxr}
{us/px/pxphdef.i sosetr}
 
{us/ca/cattdef2.i}
{us/so/sosoms.i}
{us/pa/paconst.i }
{us/px/pxphdef.i pasexr}
{us/px/pxgetph.i pasexr}
{us/px/pxphdef.i sosopp}

define new shared variable rndmthd             like rnd_rnd_mthd. 
define new shared variable copyusr             like mfc_logical.
define new shared variable fill_all            like mfc_logical
                                               label "Ship Allocated"
                                               initial no.
define new shared variable fill_pick           like mfc_logical
                                               label "Ship Picked"
                                               initial yes.
define new shared variable fill_ship_by_pack   like mfc_logical
                                               label "Ship By Pack"
                                               initial no.
define new shared variable so_mstr_recid       as recid.
define new shared variable qty_left            like tr_qty_chg.
define new shared variable trqty               like tr_qty_chg.
define new shared variable eff_date            like glt_effdate
                                               label "Effective".
define new shared variable trlot               like tr_lot.
define new shared variable ref                 like glt_ref.
define new shared variable qty_req             like in_qty_req.
define new shared variable open_ref            like sod_qty_ord.
define new shared variable fas_so_rec          as character.
define new shared variable undo-all            like mfc_logical no-undo.
define new shared variable cline               as character.
define new shared variable lotserial_control   as character.
define new shared variable issue_or_receipt    as character.
define new shared variable total_lotserial_qty like sod_qty_chg.
define new shared variable multi_entry         like mfc_logical
                                               label "Multi Entry".
define new shared variable site                like sr_site no-undo.
define new shared variable location            like sr_loc no-undo.
define new shared variable lotserial           like sr_lotser no-undo.
define new shared variable lotserial_qty       like sr_qty no-undo.
define new shared variable trans_um            like pt_um.
define new shared variable trans_conv          like sod_um_conv.
define new shared variable loc                 like pt_loc.
define new shared variable sod_recno           as recid.
define new shared variable exch_rate           like exr_rate.
define new shared variable exch_rate2          like exr_rate2.
define new shared variable exch_ratetype       like exr_ratetype.
define new shared variable exch_exru_seq       like exru_seq.
define new shared variable change_db           like mfc_logical.
define new shared variable so_db               like dc_name.
define new shared variable ship_site           like sod_site.
define new shared variable ship_db             like dc_name.
define new shared variable ship_entity         like en_entity.
define new shared variable ship_so             like so_nbr.
define new shared variable ship_line           like sod_line.
define new shared variable new_site            like so_site.
define new shared variable new_db              like so_db.
define new shared variable lotref              like sr_ref format "x(8)" no-undo.
define new shared variable lotrf               like sr_ref format "x(8)" no-undo.
define new shared variable transtype           as character initial "ISS-SO".
define new shared variable freight_ok          like mfc_logical.
define new shared variable old_ft_type         like ft_type.
define new shared variable calc_fr             like mfc_logical
                                               label "Calculate Freight".
define new shared variable undo-select         like mfc_logical no-undo.
define new shared variable disp_fr             like mfc_logical
                                               label "Display Weights".
define new shared variable qty_chg             like sod_qty_chg.
define new shared variable gl_amt              like sod_fr_chg.
define new shared variable accum_qty_all       like sod_qty_all.
define new shared variable site_to             like sod_site.
define new shared variable loc_to              like sod_loc.
define new shared variable batch_id            like bcd_batch.
define new shared variable dev                 as character label "Output".
define new shared variable new_line            like mfc_logical.
define new shared variable base_amt            like ar_amt.
define     shared variable global_recid        as recid.
/*cy1024*/ define new shared variable cyb_pst_prt as logical initial yes
/*cy1024*/   label "Post & Print Invoice"             no-undo.
/*cy1024*/ define new shared variable cyb_so_recid as recid no-undo.
/*cy1024*/ define new shared variable cyb_so_nbr like so_nbr no-undo.
 
define variable oldcurr           like so_curr no-undo.
define variable prefix            as character initial "C" no-undo.
define variable cchar             as   character no-undo.
define variable recalc            like mfc_logical initial true no-undo.
define variable vSOToHold         like so_nbr no-undo.
define variable errorNbr          as integer no-undo.
define variable l_undo            like mfc_logical no-undo.
define variable filllbl           as character format "x(15)" no-undo.
define variable so_cust_lbl       as character format "x(15)" no-undo.
define variable fillpk            as character format "x(15)" no-undo.
define variable fillsbp           as character format "x(16)" no-undo.
define variable err-flag          as integer no-undo.
define variable old_um            like fr_um no-undo.
define variable batch_update      like mfc_logical
                                  label "Auto Batch Shipment" no-undo.
define variable batch_mfc         like mfc_logical no-undo.
define variable btemp_mfguser     as character no-undo.
define variable batch_review      like mfc_logical no-undo.
define variable l_old_entity      like si_entity no-undo.
define variable db_undo           like mfc_logical no-undo.
define variable l_recalc          like mfc_logical no-undo.
define variable mc-error-number   like msg_nbr     no-undo.
define variable err_check         like mfc_logical no-undo.
define variable lv_undo_flag      as logical no-undo.
define variable use-log-acctg     as logical no-undo.
define variable tax_type          like tx2d_tr_type no-undo.
define variable lv_shipfrom       like so_site no-undo.
define variable lv_nrm_seqid      like lac_soship_nrm_id no-undo.
define variable lv_shipment_id    as character format "x(24)" no-undo.
define variable lv_accrue_freight as logical no-undo.
define variable order-on-shipper  as logical no-undo.
define variable old_fr_terms      like so_fr_terms no-undo.
define variable l_parent_abs_id   like abs_id    no-undo.
define variable l_batch_mfguser   as character    no-undo.
define variable lv_error_num      as integer      no-undo.
define variable lv_name           as character    no-undo.
define variable ok_to_ship        as logical      no-undo.
define variable corr_inv          like mfc_logical no-undo.
define variable old_sorec         as   character     no-undo.
define variable hBlockedTransactionlibrary as handle no-undo.
define variable DomainInfo        as DomainForOperationalInfo   no-undo.
define variable ExchangeRateType  as ExchangeRateTypeByTypeCode no-undo.
define variable StatCurrency      as SelectCurrency             no-undo.
define variable hasPackUsed       as logical      no-undo.

/* Below variables are defined for rolling back SO trailer fields in case the
   later shipper and LD are not created successfully. They are original values. */
define variable ori_so_to_inv     like so_to_inv     no-undo.
define variable ori_so_shipvia    like so_shipvia    no-undo.
define variable ori_so_ship_date  like so_ship_date  no-undo.
define variable ori_so_bol        like so_bol        no-undo.
define variable ori_so_rmks       like so_rmks       no-undo.
define variable ori_so_daybookset like so_daybookset no-undo.

define variable l_ex_rate like exr_rate initial 0.
define variable l_ex_rate2 like exr_rate initial 0.
define variable l_so_latype       like lacd_type   no-undo.
define variable l_so_la_supp      as   character   no-undo.
define variable isShipByPackActive as logical     initial no    no-undo.
define variable vIsFullyModifiedForCO as logical  initial no    no-undo.
define variable vUnmodifiedLine   like sod_det.sod_line         no-undo.
define variable vOrderHasShipByPack   as logical  initial no    no-undo.
 
{us/gp/gpscdef.i}
 
/* CREDIT MANAGEMENT */
define variable hCreditLibrary    as handle        no-undo.
{us/mf/mfcredpl.i "hCreditLibrary"}
 
define temp-table tt_sod_det no-undo
   field tt_sod_nbr  like sod_nbr
   field tt_sod_line like sod_line
   field tt_pr_found as logical
   index i_sodnbr tt_sod_nbr.
 
define temp-table tt_ssm_sod_det no-undo
   field tt_ssm_sod_nbr     like sod_nbr
   field tt_ssm_sod_line    like sod_line
   field tt_ssm_sod_consume as logical
   index sodLine tt_ssm_sod_nbr tt_ssm_sod_line.
 
/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}
 
/* ASN API TEMP-TABLE */
{us/so/soshxt01.i}
 
{us/tx/txcalvar.i}
 
{us/so/socnvars.i}         /* CONSIGNMENT VARIABLES. */
 
{us/et/etdcrvar.i "NEW"}
{us/et/etsotrla.i "NEW"}
 
{us/mg/mgbltrpl.i "hBlockedTransactionlibrary"}
 
if c-application-mode = "API" then do:
 
   /*
   * GET HANDLE OF API CONTROLLER
   */
   {us/bbi/gprun.i ""gpaigh.p""
      "(output apiMethodHandle,
        output apiProgramName,
        output apiMethodName,
        output apiContextString)"}
 
   /*
   * GET SO SHIPMENT HDR TEMP-TABLE
   */
   run getSoShipHdrRecord in apiMethodHandle
      (buffer ttSoShipHdr).
 
   /* WHEN CALLED FROM AN API (EDI ECOMMERCE) PROGRAM, WE NEED
      TO UPDATE THE EXECNAME TO SOSOISM.P SO THAT THE FUNCTIONALITY
      AVAILABLE IN SO SHIPMENT MAINTENANCE IS AVAILABLE TO THE API PROGRAM.
      THE EXECNAME HAS TO BE SET TO THE SOSOIS.P, WHICH IS A MENU LEVEL
      PROGRAM
   */
   execname = "sosois.p".
end. /* IF c-application-mode = "API" */
 
{us/so/socnis.i}           /* CONSIGNMENT TEMP-TABLE DEFINITION */
{us/la/lafrttmp.i "new"}   /* FREIGHT ACCRUAL TEMP-TABLE DEFINITION */
  
define new shared variable document as character format "x(24)".
 
/*************SET INITIAL VALUES************ */
assign
   issue_or_receipt = getTermLabel("ISSUE",8)
   filllbl = getTermLabel("SHIP_ALLOCATED",14) + ":"
   fillpk  = getTermLabelRtColon("SHIP_PICKED",15)
   fillsbp = if sorec <> fsrmarec then "   " + getTermLabelRtColon("SHIP_BY_PACK",13) else 
             getTermLabelRtColon("RECEIVE_BY_PACK",16)
   so_cust_lbl = getTermLabelRtColon("SOLD_TO",13).
 
/* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
assign
   nontax_old   = nontaxable_amt:format
   taxable_old  = taxable_amt:format
   line_tot_old = line_total:format
   disc_old     = disc_amt:format
   trl_amt_old  = so_trl1_amt:format
   tax_amt_old  = tax_amt:format
   ord_amt_old  = ord_amt:format
   container_old = container_charge_total:format
   line_charge_old = line_charge_total:format.
 
/* SOREC IS CHANGED IF IT IS DEPOT ORDER SHIPMENT. */
/* IF USER F4 AND SELECTS SALES ORDER THEN OLD SOREC NEEDS TO BE ASSIGNED */
old_sorec = sorec.
 
/* DEFINE VARIABLES USED IN GPGLEF1.P (GL CALENDAR VALIDATION) */
{us/gp/gpglefv.i}
 
/* INPUT OPTION FORM */
form
   so_nbr         colon 12   label "Order"
   filllbl        at 23      no-label
   fill_all                  no-label 
   fillsbp        at 43      no-label
   fill_ship_by_pack         no-label space(2)
   ship_site      
   eff_date       colon 12
   fillpk         at 23      no-label
   fill_pick                 no-label 
   so_cust_lbl    at 46      no-label
   so_cust                   no-label
   document       colon 12   label "Document"
   ad_name        at 45       format "x(33)" no-label
with frame a side-labels width 80.
 
if c-application-mode <> "API" then
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame a:handle).
 
fill_pick:hidden = true.
 
form
   so_fr_list       colon 26
   so_fr_min_wt     colon 26
   fr_um            no-label
   so_fr_terms      colon 26
   calc_fr          colon 26
   disp_fr          colon 26
with frame d overlay side-labels centered row 7 width 50.
 
if c-application-mode <> "API" then do:
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame d:handle).
end.
 
/* Pop-up frame for batch update info */
form
   batch_update colon 30
   dev          colon 30
   batch_id     colon 30
with frame batr_up width 50 column 15
title color normal (getFrameTitle("BATCH_PROCESSING",24))
side-labels overlay.
 
if c-application-mode <> "API" then
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame batr_up:handle).
 
/* SET EXTERNAL LABELS */
assign
   filllbl = getTermLabelRtColon("SHIP_ALLOCATED",15).
   fillpk  = getTermLabelRtColon("SHIP_PICKED",15).
 
/* CHECK TO SEE IF CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
         "(input ENABLE_CUSTOMER_CONSIGNMENT,
           input 10,
           input ADG,
           input CUST_CONSIGN_CTRL_TABLE,
           output using_cust_consignment)"}
 
if sorec = fsrmarec then
assign
   filllbl = getTermLabelRtColon("RECEIVE_ALL",15)
   fillpk  = "".
 
if c-application-mode <> "API" then do:
   display
      filllbl
      fillpk
      so_cust_lbl
      fillsbp
   with frame a.
 
   view frame a.
end. /* IF C-APPLICATION-MODE <> "API" */
 
assign
   eff_date = today
   so_db = global_db.
 
run find-mfcctrl.
 
do transaction:
 
   if c-application-mode = "API" and retry
      then return error return-value.
 
   run p_find_mfc.
 
   for first fac_ctrl
      where   fac_domain = global_domain
   no-lock:
      fas_so_rec = string(fac_so_rec).
   end.
 
end.  /* transaction to find control file variables. */
 
/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}
 
run p-find-mfc-rec.
 
{us/gp/gpscproxy.i}
 
/* CHECK SERIAL CONTROL TO FIND IF THE SHIP BY PACK IS ACTIVE */
for first serc_ctrl no-lock
   where serc_ctrl.serc_domain = global_domain:
   assign isShipByPackActive = serc_ctrl.serc_active.
end.

/* Need to undo the mainloop and after that set a field */
upperloop:
repeat:
 
   if c-application-mode = "API" and retry
      then return error return-value.
 
   /* DISPLAY */
   mainloop:
 
   do on error undo mainloop, leave mainloop:
      if c-application-mode = "API" and retry
         then return error return-value.
 
      {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}
 
      do transaction:
         if c-application-mode = "API" and retry
            then return error return-value.
 
         if c-application-mode <> "API" then do:
            display
               eff_date
               fill_all
               fill_pick   when (sorec <> fsrmarec)
               fill_ship_by_pack when (sorec <> fsrmarec and sorec <> fsrmaship)
            with frame a.
 
            prompt-for
               so_nbr
               eff_date
               fill_all
               fill_pick when (sorec <> fsrmarec)
               fill_ship_by_pack when isShipByPackActive
               ship_site
            with frame a
            editing:
 
               if frame-field = "so_nbr" then do:
                  /* FIND NEXT/PREVIOUS RECORD */
                  /* IF WE'RE SHIPPING/RECEIVING RMA'S, NEXT/PREV ON RMA'S */
                  /* ONLY ELSE, NEXT/PREV ON SALES ORDERS.                 */
                  if sorec = fsrmarec or sorec = fsrmaship then do:
                     {us/mf/mfnp05.i so_mstr so_fsm_type
                        "so_domain = global_domain and so_compl_stat = ''
                          and so_fsm_type = 'RMA' "
                        so_nbr "input so_nbr"}
                  end.
                  else do:
                     /* FIND NEXT/PREVIOUS RECORD - SO'S ONLY */
                     {us/mf/mfnp05.i so_mstr so_fsm_type
                        "so_domain = global_domain and so_compl_stat = ''
                         and (so_fsm_type  = '' or so_fsm_type = 'FSM-RO')"
                        so_nbr "input so_nbr"}
                  end.
                  if recno <> ? then do:
                     display so_nbr so_cust with frame a.
 
                     for first ad_mstr
                        where  ad_domain = global_domain
                        and    ad_addr = so_cust
                     no-lock:
                        display ad_name with frame a.
                     end.
 
                     calc_fr = so_fr_list <> "".
                  end.
               end.
               else do:
                  readkey.
                  apply lastkey.
               end.
 
            end.
         end. /* IF C-APPLICATION-MODE <> "API" */
         else do:
            assign
               {us/mf/mfaiset.i eff_date ttSoShipHdr.ed_eff_date}
               {us/mf/mfaiset.i fill_all ttSoShipHdr.ed_fill_all}
               {us/mf/mfaiset.i fill_pick ttSoShipHdr.ed_fill_pick}
               {us/mf/mfaiset.i ship_site ttSoShipHdr.ed_so_site}.

            if isShipByPackActive then do:
               {us/mf/mfaiset.i fill_ship_by_pack ttSoShipHdr.ed_ship_by_pack}.
            end.
         end.
 
         if c-application-mode <> "API" then do:
            update document with frame a.
         end. /* IF C-APPLICATION-MODE <> "API" */
         else
            assign
               {us/mf/mfaiset.i document ttSoShipHdr.ed_document}.
 
         assign
            eff_date
            fill_all
            fill_pick
            fill_ship_by_pack
            ship_site
            oldcurr = ""
            l_so_latype = ""
            l_so_la_supp = "".

         if eff_date = ? then eff_date = today.
 
         old_ft_type = "".
 
         if c-application-mode <> "API" then
            find so_mstr using so_nbr
               where so_domain = global_domain
            exclusive-lock no-error no-wait.
         else
            for first so_mstr where
               so_domain = global_domain and
               so_nbr = ttSoShipHdr.nbr exclusive-lock:
            end.
 
         if locked so_mstr then do:
            /* SALES ORDER BEING MODIFIED, PLEASE WAIT */
            {us/bbi/pxmsg.i &MSGNUM=666 &ERRORLEVEL=2}
            if c-application-mode <> "API" then
               pause 5.
            undo,retry.
         end.
 
         if not available so_mstr then do:
            /* Sales order does not exist */
            {us/bbi/pxmsg.i &MSGNUM=609 &ERRORLEVEL=3}
            next-prompt so_nbr with frame a.
            undo, retry.
         end.
 
         if so_compl_stat <> "" then do:
            /* Sales order is Closed */
            {us/bbi/pxmsg.i &MSGNUM=8024 &ERRORLEVEL=3}
            next-prompt so_nbr with frame a.
            undo, retry.
         end.

/*c1279* start added code here - site security */
	    find first si_mstr no-lock
	    where si_domain = global_domain
	    and   si_site = so_site
	    no-error.
            {us/bbi/gprun.i ""gpsiver.p""
                     "(input si_site,
                       input recid(si_mstr),
                       output return_int)"}

            if return_int = 0 then do:
               /* USER DOES NOT HAVE ACCESS TO THIS SITE */
               {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
               next-prompt so_nbr with frame a.
               undo, retry.
            end.
/*c1279* end added code here - site security */
 
         if so_conf_date = ? then do:
            /* warning: Sales Order not confirmed */
            {us/bbi/pxmsg.i &MSGNUM=621 &ERRORLEVEL=2}
         end.
 
         /* IF THIS IS AN RMA AND WE ARE SALES ORDER ONLY MODE, ERROR */
         if (can-find(rma_mstr
            where rma_domain = global_domain
            and   rma_nbr    = so_nbr
            and   rma_prefix = prefix))
         then do:
            if  sorec = fssoship  then do:
               /* CANNOT PROCESS IF ONLY SALES ORDERS */
               {us/bbi/pxmsg.i &MSGNUM=7190 &ERRORLEVEL=3}
               undo, retry.
            end.
         end.
         else
 
         if  sorec = fsrmaship  or
             sorec = fsrmaall   or
             sorec = fsrmarec
         then do:
            /* This is not an RMA */
            {us/bbi/pxmsg.i &MSGNUM=7191 &ERRORLEVEL=3}
            undo, retry.
         end.
 
         run p_err_msg ( input so_fsm_type, input so_secondary,
                         output err_check ).
         if err_check then
            undo, retry.
 
         /* Start blocked transaction library to run persistently */
         run mfairunh.p
            (input "mgbltrpl.p",
             input  ?,
             output hBlockedTransactionlibrary).
 
         if sorec = fsrmaship /*RMA Shipments*/
         then do:
 
            /* Check to see if RMA customers have blocked transactions */
            for first rma_mstr no-lock
                where rma_domain = global_domain
                  and rma_nbr    = so_nbr
                  and rma_prefix = prefix:
 
               if blockedCustomer(input rma_cust_ven,
                                  input {&SSM021},
                                  input true,
                                  input "Customer")
               then do:
                  undo mainloop, retry mainloop.
               end.
 
               if blockedCustomer(input rma_bill_to,
                                  input {&SSM021},
                                  input true,
                                  input "Bill-To Customer")
               then do:
                  undo mainloop, retry mainloop.
               end.
 
               if blockedCustomer(input rma_ship,
                                  input {&SSM021},
                                  input true,
                                  input "Ship-To Customer")
               then do:
                  undo mainloop, retry mainloop.
               end.
 
               for first eu_mstr
                   where eu_domain = global_domain
                     and eu_addr = rma_enduser
               no-lock:
 
                  if blockedCustomer(input eu_cm_nbr,
                                     input {&SSM021},
                                     input true,
                                     input "Customer")
                  then do:
                     undo mainloop, retry mainloop.
                  end.
               end.
            end.
         end.
 
         if sorec = fssoship /* SO Shipments */
         then do:
            /* Check to see if Customer has any blocked transactions */
            if blockedCustomer(input so_cust,
                               input {&SO013},
                               input true,
                               input "Sold-To Customer")
            then do:
                undo mainloop, retry mainloop.
            end.
 
            if blockedCustomer(input so_bill,
                               input {&SO013},
                               input true,
                               input "Bill-To Customer")
            then do:
                undo mainloop, retry mainloop.
            end.
 
            if blockedCustomer(input so_ship,
                               input {&SO013},
                               input true,
                               input "Ship-To Customer")
            then do:
                undo mainloop, retry mainloop.
            end.
 
         end.
 
         if sorec = fsrmarec /* RMA Reciepts */
         then do:
 
            /* Check to see if RMA customers have blocked transactions */
            for first rma_mstr no-lock
                where rma_domain = global_domain
                  and rma_nbr    = so_nbr
                  and rma_prefix = prefix:
 
               if blockedCustomer(input rma_cust_ven,
                                  input {&SSM020},
                                  input true,
                                  input "Customer")
               then do:
                  undo mainloop, retry mainloop.
               end.
 
               if blockedCustomer(input rma_bill_to,
                                  input {&SSM020},
                                  input true,
                                  input "Bill-To Customer")
               then do:
                  undo mainloop, retry mainloop.
               end.
 
               if blockedCustomer(input rma_ship,
                                  input {&SSM020},
                                  input true,
                                  input "Ship-To Customer")
               then do:
                  undo mainloop, retry mainloop.
               end.
 
               for first eu_mstr
                   where eu_domain = global_domain
                     and eu_addr = rma_enduser
               no-lock:
 
                  if blockedCustomer(input eu_cm_nbr,
                                     input {&SSM020},
                                     input true,
                                     input "Customer")
                  then do:
                     undo mainloop, retry mainloop.
                  end.
               end.
            end.
 
         end.
 
         delete procedure hBlockedTransactionlibrary no-error.
 
         /* ALLOW PROCESSING OF RMA EMT ORDERS.              */
         /* VALIDATIONS ARE DONE AT THE LINE LEVEL LATER.    */
         if so_fsm_type <> "RMA" 
         then do:
            for first sod_det where sod_domain = global_domain
                   and sod_nbr = so_nbr
                   and (sod_btb_type = "02" or sod_btb_type = "03")
                   and sod_compl_stat = ""
            no-lock: end.
    
            if available sod_det then do:
               /* BTB ORDERS ARE NOT ALLOWED IN THIS TRANSACTION */
               {us/bbi/pxmsg.i &MSGNUM=2822 &ERRORLEVEL=3}
               undo, retry.
            end.
         end. /* if so_fsm_type <> "RMA" */
    
         /* Determine if this order will be processed with a credit card
          * and validate that the credit card info is valid and that the
          * authorized amount is enough to process the order.  Issue
          * warning if an error occurs */
         {us/gp/gprunp.i "soccval" "p" "preValidateCCProcessing"
            "(input so_nbr, output errorNbr)"}
         if errorNbr <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=errorNbr &ERRORLEVEL=2}
            if c-application-mode <> "API" then do:
               if not batchrun then pause.
            end.
         end.
 
         /* FIND EXCH RATE IF CURRENCY NOT BASE */
 
         if not so_fix_rate then do:
 
            /* Create usage records for posting; delete later. */
            {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
                      "(input  so_curr,
                        input  base_curr,
                        input  so_ex_ratetype,
                        input  eff_date,
                        output exch_rate,
                        output exch_rate2,
                        output mc-error-number)"}
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               undo, retry.
            end.
 
         end.
         else
            assign
               exch_rate     = so_ex_rate
               exch_rate2    = so_ex_rate2.
 
         if (oldcurr <> so_curr) or (oldcurr = "")
         then do:
 
            /** GET ROUNDING METHOD FROM CURRENCY MASTER **/
            {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
                      "(input so_curr,
                        output rndmthd,
                        output mc-error-number)"}
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               undo, retry.
            end. /* if mc-error-number <> 0 */
 
            {us/so/socurfmt.i}
            oldcurr = so_curr.
         end. /* IF OLDCURR <> SO_CURR */
 
         for first cil_mstr
            where cil_mstr.cil_domain = global_domain
            and   cil_cor_so_nbr = so_nbr
         no-lock: end.
 
         assign corr_inv = available cil_mstr.
         
         /* Check all cross line serial package should be modified in correction order */
         if corr_inv then do:
            {us/px/pxrun.i &PROC  = 'isFullyModifyedForCrossLineInCO' &PROGRAM = 'sosetr.p'
                           &HANDLE = ph_sosetr
                           &PARAM = "(input cil_mstr_inv,
                                      input so_nbr,
                                      input cil_prev_so_nbr,
                                      output vIsFullyModifiedForCO,
                                      output vUnmodifiedLine)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
            if not vIsFullyModifiedForCO then do: 
               /* Line # must be corrected for further serial processing */
               {us/bbi/pxmsg.i &MSGNUM=14403 &MSGARG1=vUnmodifiedLine
                               &ERRORLEVEL={&WARNING-RESULT}}
               undo, retry.
            end.

            /* If the order has been shipped through package then auto set ship by pack yes */
            empty temp-table tt_inv_serials.
            {us/px/pxrun.i &PROC  = 'getSerialByInvAndOrd' &PROGRAM = 'sosetr.p'
                           &HANDLE = ph_sosetr
                           &PARAM = "(input cil_mstr_inv,
                                      input cil_prev_so_nbr,
                                      input-output table tt_inv_serials)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
            for each tt_inv_serials no-lock:
               if can-find(first sod_det
                           where sod_det.sod_domain = global_domain
                           and   sod_det.sod_nbr = so_nbr
                           and   sod_det.sod_line = tt_inv_serials.tt_serial_line) then do:
                  fill_ship_by_pack = yes.   
                  leave.
               end.
            end.
         end.
 
         if corr_inv then
            fill_all = yes.
 
         if c-application-mode <> "API" then
            display 
               fill_all 
               fill_ship_by_pack
            with frame a.
 
         transtype = if corr_inv then "ISS-COR" else "ISS-SO".
 
         for first ad_mstr
            where   ad_domain = global_domain
            and     ad_addr = so_cust
         no-lock: end.
 
         if c-application-mode <> "API" then
            display
               so_cust
               ad_name
            with frame a.
 
         calc_fr = so_fr_list <> "".
 
         for first ft_mstr
            where   ft_domain = global_domain
            and     ft_terms = so_fr_terms
         no-lock:
            old_ft_type = ft_type.
         end.
 
         /* Check to see if batch update exists */
         run check-batch.
 
         if available qad_wkfl and
            not batch_review then undo, retry.
 
         if so_stat <> "" then do:
            /* SALES ORDER STATUS NOT BLANK */
/*d2101*            {us/bbi/pxmsg.i &MSGNUM=623 &ERRORLEVEL=2 &MSGARG1=so_stat} */
/*d2101*/            {us/bbi/pxmsg.i &MSGNUM=623 &ERRORLEVEL=2}
         end.
 
         run find-cm-mstr
            (input so_bill).
 
         /* Determine the ship-from domain */
         if ship_site = "" then do:
 
            /* Take the domain from the first line */
            for first sod_det where  sod_det.sod_domain = global_domain
                and sod_nbr = so_nbr
                and sod_compl_stat = ""
            no-lock: end.
 
            for first si_mstr
               where   si_domain = global_domain
               and     si_site = sod_site
            no-lock: end.
 
            if not available si_mstr then
               ship_db = global_db.
            else do:
 
               ship_db = si_db.
 
               /* Check to see if SO affects other domain */
               /* (If so, the user must pick one)            */
               for each sod_det where sod_domain = global_domain
                  and sod_nbr = so_nbr
                  and sod_site <> si_site
                  and sod_confirm
                  and sod_compl_stat = ""
               no-lock:
 
                  for first si_mstr
                     where   si_domain = global_domain
                     and     si_site = sod_site
                  no-lock: end.
 
                  if available si_mstr and si_db <> ship_db then do:
                     /* SO spans domains, site must be specified */
                     {us/bbi/pxmsg.i &MSGNUM=6252 &ERRORLEVEL=4}
                     display si_site @ ship_site with frame a.
                     undo mainloop, retry.
                  end.
 
               end.  /* FOR EACH SOD_DET */
 
            end.   /* ELSE DO - IF NOT AVAIL SI_MSTR */
 
            ship_entity = "".
 
            /* PERFORM GL CALENDER VALIDATION WHEN ship_site IS BLANK
             * AND "Ship Allocated" OR "Ship Picked" IS YES. */
 
            /* PROCESS SHIPMENT FROM THE CIM FILE ONLY               */
            /* DURING BATCHRUN OF SALES ORDER SHIPMENTS AND WHEN THE */
            /* FLAG 'Ship One Line During CIM' IS SET TO YES IN      */
            /* WAREHOUSE CONTROL FILE                                */
 
            if fill_all
/*c1367*/   or true
            or fill_pick
            then do:
 
               l_old_entity = "".
 
               for each sod_det no-lock
                  where sod_domain = global_domain
                  and   sod_nbr = so_nbr
                  and   sod_confirm
                  and   sod_compl_stat = ""
               break by sod_site:
 
                  if first-of(sod_site) then do:
 
                     for first si_mstr
                        where   si_domain = global_domain
                        and     si_site = sod_site
                     no-lock: end.
 
                     if l_old_entity <> si_entity then do:
                        l_old_entity = si_entity.
 
                        {us/gp/gpglef3.i &from_db = so_db
                           &to_db   = si_db
                           &module  = ""IC""
                           &entity  = si_entity
                           &date    = eff_date
                           &prompt  = "eff_date"
                           &frame   = "a"
                           &loop    = "mainloop"}
                     end. /* IF L_OLD_ENTITY <> SI_ENTITY */
 
                  end. /* IF FIRST-OF(SOD_SITE) */
 
               end. /* FOR EACH sod_det */
 
            end. /* IF INPUT FILL_ALL = YES OR INPUT FILL_PICK = YES */
 
         end.  /* IF SHIP-SITE = "" */
 
         else do:
 
            for first si_mstr
               where  si_domain = global_domain and  si_site = ship_site
            no-lock: end.
 
            if not available si_mstr then do:
               {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}  /* Site does not exist */
               next-prompt ship_site with frame a.
               undo, retry.
            end.
 
            assign
               ship_db     = si_db
               ship_entity = si_entity.
         end.
 
         if ship_site <> ""
            and available si_mstr
         then do:
 
            l_undo = no.
 
            run find-soddet
               (input so_nbr,
                input ship_site,
                output l_undo).
 
            if l_undo and batchrun then
               undo upperloop, leave upperloop.
            else if l_undo then do:
               next-prompt ship_site with frame a.
               undo, retry.
            end.
 
            {us/bbi/gprun.i ""gpsiver.p""
                     "(input si_site,
                       input recid(si_mstr),
                       output return_int)"}
 
            if return_int = 0 then do:
               /* USER DOES NOT HAVE ACCESS TO THIS SITE */
               {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
               next-prompt ship_site with frame a.
               undo, retry.
            end.
 
         end.
 
         if global_db <> ship_db then do:
            /* MAKE SURE SHIP-FROM DOMAIN IS CONNECTED */
            {us/gp/gprunp.i "mgdompl" "p" "ppDomainConnect"
                      "(input  ship_db,
                        output lv_error_num,
                        output lv_name)"}
 
            if lv_error_num <> 0 then do:
               /* DOMAIN # IS NOT AVAILABLE */
               {us/bbi/pxmsg.i &MSGNUM=lv_error_num &ERRORLEVEL=3 &MSGARG1=lv_name}
               next-prompt ship_site with frame a.
               undo mainloop, retry.
            end.
         end. /* if global_db <> ship_db then do: */
 
         /* VALIDATE OPEN GL PERIOD FOR SPECIFIED ENTITY AND
          * DOMAIN. WE ONLY NEED TO DO THIS IF THE SITE FIELD
          * WAS ENTERED, BECAUSE OTHERWISE WE DON'T KNOW WHICH
          * ENTITY TO VALIDATE YET. THIS IS OK BECAUSE THE LINE
          * ITEMS WILL ALSO BE VALIDATED. */
 
         if ship_entity <> "" then do:
 
            /* VALIDATE GL PERIOD FOR SPECIFIED ENTITY/DOMAIN */
            {us/gp/gpglef3.i &from_db = so_db
               &to_db   = ship_db
               &module  = ""IC""
               &entity  = ship_entity
               &date    = eff_date
               &prompt  = "eff_date"
               &frame   = "a"
               &loop    = "mainloop"}
 
         end. /* IF SHIP_ENTITY <> "" */
 
         /* FREIGHT LIST, MIN SHIP WEIGHT & FREIGHT TERMS PARAMETERS */
         if calc_fr then do:
 
            if so_fr_list <> "" then do:
 
               for first fr_mstr
                  where   fr_domain = global_domain
                  and     fr_list   = so_fr_list
                  and     fr_site   = so_site
                  and     fr_curr   = so_curr
               no-lock: end.
 
               if not available fr_mstr then
               for first fr_mstr
                  where   fr_domain = global_domain
                  and     fr_list   = so_fr_list
                  and     fr_site   = so_site
                  and     fr_curr   = base_curr
               no-lock: end.
 
               disp_fr = yes.
               if c-application-mode <> "API" then
                  display
                     so_fr_list
                     so_fr_min_wt
                     so_fr_terms
                     calc_fr
                     disp_fr
                  with frame d.
 
            end.
 
            assign
               old_fr_terms = so_fr_terms
               old_um = "".
 
            if available fr_mstr then do:
               if c-application-mode <> "API" then
                  display fr_um with frame d.
               old_um = fr_um.
            end.
 
            set_d:
            do on error undo, retry:
 
               if c-application-mode = "API" and retry
                  then return error return-value.
 
 
               if c-application-mode <> "API" then
                  set so_fr_min_wt so_fr_terms calc_fr disp_fr with frame d.
               else
                  assign
                     {us/mf/mfaiset.i
                        so_fr_min_wt ttSoShipHdr.ed_fr_min_wt}
                     {us/mf/mfaiset.i
                        so_fr_terms ttSoShipHdr.ed_fr_terms}
                     {us/mf/mfaiset.i
                        calc_fr ttSoShipHdr.ed_calc_fr}
                     {us/mf/mfaiset.i
                        disp_fr ttSoShipHdr.ed_disp_fr}.
 
               if so_fr_list <> "" or (so_fr_list = "" and calc_fr)
               then do:
 
                  for first fr_mstr
                     where   fr_domain = global_domain
                     and     fr_list   = so_fr_list
                     and     fr_site   = so_site
                     and     fr_curr   = so_curr
                  no-lock: end.
 
                  if not available fr_mstr then
                  for first fr_mstr
                     where   fr_domain = global_domain
                     and     fr_list   = so_fr_list
                     and     fr_site   = so_site
                     and     fr_curr = base_curr
                  no-lock: end.
 
                  if not available fr_mstr then do:
                     /* WARN: FREIGHT LIST # NOT FOUND FOR SITE # CURRENCY */
                     {us/bbi/pxmsg.i &MSGNUM=670 &ERRORLEVEL=2
                              &MSGARG1=so_fr_list
                              &MSGARG2=so_site
                              &MSGARG3=so_curr}
                     /* Lines may be ok. No lines added, so no default.*/
                     if c-application-mode <> "API" then do:
                        if not batchrun then pause.
                     end.
                  end.
 
                  if c-application-mode <> "API" then
                     display fr_um with frame d.
 
                  if old_um <> fr_um then do:
                     {us/bbi/pxmsg.i &MSGNUM=675 &ERRORLEVEL=2}
                     /* WARNING: UNIT OF MEASURE HAS CHANGED */
                     if c-application-mode <> "API" then do:
                        if not batchrun then pause.
                     end.
                  end.
 
               end.
 
               if so_fr_terms <> "" or (so_fr_terms = "" and calc_fr)
               then do:
 
                  for first ft_mstr
                     where   ft_domain = global_domain
                     and     ft_terms  = so_fr_terms
                  no-lock: end.
 
                  if not available ft_mstr then do:
                     /* INVALID FREIGHT TERMS */
                     {us/bbi/pxmsg.i &MSGNUM=671 &ERRORLEVEL=3 &MSGARG1=so_fr_terms}
                     next-prompt so_fr_terms with frame d.
                     undo set_d, retry.
                  end.
 
               end.
 
               /* IF LOGISTICS ACCOUNTING IS ENABLED */
               if so_fr_terms <> old_fr_terms and use-log-acctg then do:
                  order-on-shipper = no.
 
                  /* CHECK IF ORDER ATTACHED TO AN UNCONFIRMED SHIPPER */
                  {us/gp/gprunmo.i  &module = "LA" &program = "larcsh02.p"
                              &param  = """(input so_nbr,
                                            output l_parent_abs_id,
                                            output order-on-shipper)"""}
 
                  if order-on-shipper then do:
                     /* FREIGHT TERMS CANNOT BE CHANGED. ORDER ON SHIPPER # */
                     {us/bbi/pxmsg.i &MSGNUM = 5373 &ERRORLEVEL = 3
                              &MSGARG1 = substring(l_parent_abs_id,2)}
                     next-prompt so_fr_terms with frame d.
                     undo set_d, retry.
                  end.
                  else do:
                     if so_fr_terms = "" then do:
 
                        tax_type = "41".
                        if so_fsm_type = "RMA" then
                           tax_type = "46".
 
                        /* DELETE ALL LOGISTICS ACCTG tx2d_det RECORDS FOR SO */
                        {us/gp/gprunmo.i &module = "LA" &program = "lataxdel.p"
                                   &param  = """(input tax_type,
                                                 input so_nbr,
                                                 input 0)"""}
 
                        /* DELETE LOGISTICS ACCTG CHARGE DETAIL */
                        {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                                    &param  = """(input 'DELETE',
                                                  input '{&TYPE_SO}',
                                                  input so_nbr,
                                                  input ' ',
                                                  input ' ',
                                                  input ' ',
                                                  input no,
                                                  input no)"""}
                     end.
                     else do:
                        /* UPDATE LOGISTICS ACCTG CHARGE DETAIL */
                        {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                                    &param  = """(input 'MODIFY',
                                                  input '{&TYPE_SO}',
                                                  input so_nbr,
                                                  input ' ',
                                                  input ft_lc_charge,
                                                  input ft_accrual_level,
                                                  input no,
                                                  input no)"""}
                    end.
                  end.   /* else (not on shipper) */
               end.   /* if so_fr_terms <> old_fr_terms */
 
               if c-application-mode <> "API" then
                  hide frame d no-pause.
 
            end.
         end.
 
         ship_so = so_nbr.
 
         /* Update batch shipment information if batch in use */
         /* (unless an existing batch job is already queued)  */
         run update-batch.
 
      end.  /* SO number input transaction */
 
      do transaction:
         if c-application-mode = "API" and retry
            then undo MAINLOOP, leave MAINLOOP.
         /* Switch domains to get next trlot based on remote */
         /* Work order master for shipping transaction if necessary */
         change_db = (ship_db <> global_db).
         if change_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
 
            run check-db-connect (input ship_db, output db_undo).
 
            if db_undo then
               undo mainloop, retry mainloop.
 
            /* RETRIEVE FAC CONTROL FILE SETTINGS FROM REMOTE DOMAIN */
            {us/bbi/gprun.i ""sofactrl.p"" "(output fas_so_rec)"}
 
         end.
 
         {us/bbi/gprun.i ""gpnxtsq.p"" "(output trlot)"}
 
         if change_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
 
            run check-db-connect (input so_db, output db_undo).
 
            if db_undo then
               undo mainloop, retry mainloop.
         end.
      end.
 
      /* INITIALIZE TEMP FREIGHT ACCRUAL TEMP-TABLE */
      for each tt-frcalc exclusive-lock:
          delete tt-frcalc.
      end.
 
      if not batch_review then do:
 
         for each sr_wkfl
            where sr_domain = global_domain
            and   sr_userid = SessionUniqueID
         exclusive-lock:
            delete sr_wkfl.
         end.
 
         if can-find(first lotw_wkfl
            where lotw_domain = global_domain
            and   lotw_mfguser = SessionUniqueID)
         then do:
            for each lotw_wkfl
               where lotw_domain  = global_domain
               and   lotw_mfguser = SessionUniqueID
            exclusive-lock:
               delete lotw_wkfl.
            end. /* FOR EACH lotw_wkfl  */
         end. /* IF CAN-FIND(lotw_wkfl) */
 
      end. /* IF NOT batch_review */
 
 
      /* Switch domains to find allocations if necessary */
      change_db = (ship_db <> global_db).
      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
 
         run check-db-connect (input ship_db, output db_undo).
 
         if db_undo then
            undo mainloop, retry mainloop.
 
         {us/bbi/gprun.i ""sosoiss3.p""} /* Delete sr_wkfl in remote db */
 
         {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
 
         run check-db-connect (input so_db, output db_undo).
 
         if db_undo then
            undo mainloop, retry mainloop.
      end.
 
      /* CHECK FOR EXISTING ALLOCATIONS AND RESET BACKORDER CHANGE QUANTITY */
      /* (Get all lines to reset the change quantities) */
      if not batch_review then
      for each sod_det
         where sod_domain = global_domain
         and   sod_nbr    = so_nbr
         and   sod_compl_stat = ""
      exclusive-lock
         break by sod_site
               by sod_loc
               by sod_serial
               by sod_part:
 
         assign
            sod_qty_chg = 0
            sod_bo_chg  = 0.
 
         if first-of(sod_part) then
            accum_qty_all = 0.
 
         if not (sod_site = ship_site or ship_site = "") then next.
 
         /* Consider skipping this record based on something */
         if    (sorec = fsrmarec    and sod_rma_type  <> "I")
            or (sorec = fsrmaship   and sod_rma_type  <> "O")
            or (sorec = fssormaship and sod_rma_type  =  "I")
            or (sorec = fssoship    and sod_fsm_type  <> "")
         then
            next.
 
         ship_line = sod_line.
 
         /* Check for allocations if shipping based on allocations */
         if fill_all
/*c1367*/   or true
         or fill_pick
         or corr_inv
         then do:
 
            if using_cust_consignment
               and sod_consignment
            then do:
               /* CREATE CONSIGNMENT TEMP-TABLE RECORD */
               {us/gp/gprunmo.i &module  = "ACN"
                          &program = "socnship.p"
                          &param   = """(input  sod_nbr,
                                         input  sod_line,
                                         input  sod_site,
                                         input  sod_loc,
                                         input  sod_part,
                                         input  sod_serial,
                                         input  ' ',
                                         input  sod_qty_chg * sod_um_conv,
                                         output ok_to_ship,
                                         input-output table
                                            tt_consign_shipment_detail)"""}
 
               if not ok_to_ship
               then do:
                  pause.   /* TO SEE ERROR MESSAGE FROM socnship.p */
                  undo mainloop, retry mainloop.
               end.
 
            end.  /* if using_cust_consignment */
 
            accum_qty_all = accum_qty_all + sod_qty_all.
 
            qty_chg = 0.
 
            {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
 
            run check-db-connect
               (input ship_db, output db_undo).
 
            if db_undo then
               undo mainloop, retry mainloop.
 
            if corr_inv
               and can-find(cild_det
                  where cild_domain = global_domain
                  and   cild_cor_inv  = cil_cor_inv
                  and   cild_cor_so_nbr = cil_cor_so_nbr
                  and   cild_cor_line  = sod_line
                  and   cild_line_type = "R")
            then do:
               {us/bbi/gprun.i ""sosoisu7.p""}
            end.
            else do:
               {us/bbi/gprun.i ""sosoisu1.p""}
            end.
 
            {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
 
            run check-db-connect
               (input so_db, output db_undo).
 
            if db_undo then
               undo mainloop, retry mainloop.
 
            if change_db then
               sod_qty_chg = qty_chg.
 
         end.   /* IF fill_all */
 
         if (sod_fsm_type = "RMA-RCT"
            and sod_qty_ord  < 0 )
         then
            sod_bo_chg = sod_qty_ord - sod_qty_ship + sod_qty_chg.
         else
            sod_bo_chg = if sod_qty_ord >= 0 then
                            max((sod_qty_ord - sod_qty_ship - sod_qty_chg),0)
                         else
                            min((sod_qty_ord - sod_qty_ship - sod_qty_chg),0).
 
      end.  /*for each sod_det*/
 
      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
 
         run check-db-connect (input so_db, output db_undo).
 
         if db_undo then
            undo mainloop, retry mainloop.
      end.
 
      assign
         global_recid  = ?
         so_mstr_recid = recid(so_mstr)
         undo-select   = true.
 
      release sod_det.
 
      /* Clear the temp table */
      empty temp-table tt_serials.

      {us/px/pxrun.i &PROC = 'initializedPickedPacks'
                     &PROGRAM = 'sosopp.p'
                     &HANDLE = ph_sosopp
                     &NOAPPERROR = true
                     &CATCHERROR = true}

      ser_control:
      do on error undo, retry:
         undo-select = true.

      run p-sel-line-qty.
 
         if undo-select then
            undo ser_control, leave ser_control.
 
      undo-all = yes.
 
      /* REVERSE SIGNS FOR TRAILER IF WE ARE IN FSRMAREC MODE */
      if sorec = fsrmarec then do:
         undo-select = false.
         {us/bbi/gprun.i ""sosoiss4.p""}
         if undo-select then
            undo mainloop, retry mainloop.
      end. /* IF sorec = false THEN DO */
 
      lv_accrue_freight = no.
      /* IF LOGISTICS ACCOUNTING IS ENABLED AND VALID FREIGHT TERMS/LIST IS   */
      /* ENTERED DISPLAY THE LOGISTICS CHARGE DETAIL FRAME WHICH DISPLAYS THE */
      /* LOGISTICS SUPPLIER FOR THIS ORDER STORED IN THE lacd_det.            */
      /* IF THE USER CHANGES THIS SUPPLIER IT WILL NOT BE UPDATED IN lacd_det */
      /* RECORD, IT WILL BE HOWEVER BE STORED IN THE PENDING VOUCHER RECORD   */
      /* CREATED FOR VOUCHERING THIS ACCRUAL.                                 */
      if use-log-acctg
         and so_fr_terms <> ""
         and (can-find(first sod_det where sod_domain = global_domain
                                       and sod_nbr = so_nbr
                                       and sod_fr_list <> ""
                                       and sod_compl_stat = ""))
      then do transaction on error undo, retry:
 
         for first ft_mstr
            where   ft_domain = global_domain
            and     ft_terms = so_fr_terms
          no-lock:
            if ft_accrual_level = {&LEVEL_Shipment}
               or ft_accrual_level = {&LEVEL_Line}
            then do:
 
               assign
                  lv_accrue_freight = yes
                  lv_shipfrom = "".
 
               for first sod_det where   sod_domain = global_domain
                  and sod_nbr = so_nbr
                  and sod_compl_stat = ""
                no-lock:
                  lv_shipfrom = sod_site.
               end.
 
               if ft_accrual_level = {&LEVEL_Shipment}
                  and so_site <> ""
               then
                  lv_shipfrom = so_site.
               for first lacd_det
                  where lacd_domain            = global_domain 
                  and   lacd_internal_ref      = so_nbr
                  and   lacd_shipfrom          = lv_shipfrom
                  and   lacd_lc_charge         = ft_lc_charge
                  and   lacd_internal_ref_type = {&TYPE_SO}
               no-lock:
               end.

               if available lacd_det  
               then
                  assign
                     l_so_latype  = lacd_type
                     l_so_la_supp = lacd_log_supplier.
               else
                  assign
                     l_so_latype  = ""
                     l_so_la_supp = "" .
 
               /* DISPLAY LOGISTICS CHARGE DETAIL */
               {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                           &param  = """(input 'ADD',
                                         input '{&TYPE_SO}',
                                         input so_nbr,
                                         input lv_shipfrom,
                                         input ft_lc_charge,
                                         input ft_accrual_level,
                                         input yes,
                                         input no)"""}
 
               /* GET THE SO SHIPMENT SEQUENCE ID DEFINED IN LOGISTICS     */
               /* ACCOUNTING CONTROL FILE.                                 */
               lv_nrm_seqid = "".
               for first lac_ctrl
                   where lac_domain = global_domain
               no-lock:
                  lv_nrm_seqid = lac_soship_nrm_id.
               end.
 
               lv_undo_flag = true.
 
               /* ENTER SHIPMENT-ID FOR DISCRETE SHIPMENTS */
               {us/gp/gprunmo.i  &module = "LA" &program = "lalgship.p"
                           &param  = """(input lv_nrm_seqid,
                                         output lv_shipment_id,
                                         input-output lv_undo_flag)"""}
               run LdShipmentID (input 0, 
                                 input lv_shipment_id).
 
               if lv_undo_flag and batchrun then
                  undo upperloop, leave upperloop.
               else if lv_undo_flag then
                  undo mainloop, retry mainloop.
               if calc_fr = yes then do:
                  {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                              &param  = """(input 'DELETE',
                                            input '{&TYPE_SO}',
                                            input so_nbr,
                                            input lv_shipfrom,
                                            input ft_lc_charge,
                                            input ft_accrual_level,
                                            input yes,
                                            input yes)"""}
                  {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                              &param  = """(input 'ADD',
                                            input '{&TYPE_SO}',
                                            input so_nbr,
                                            input lv_shipfrom,
                                            input ft_lc_charge,
                                            input ft_accrual_level,
                                            input yes,
                                            input yes)"""}
               end.
               for first lacd_det
                  where lacd_domain            = global_domain 
                  and   lacd_internal_ref      = so_nbr
                  and   lacd_shipfrom          = lv_shipfrom
                  and   lacd_lc_charge         = ft_lc_charge
                  and   lacd_internal_ref_type = {&TYPE_SO}
               exclusive-lock:
                  assign
                     lacd_log_supplier = l_so_la_supp
                     lacd_type         = if l_so_latype <> "" 
                                         then
                                            l_so_latype
                                         else
                                            lacd_type.
 
                  if lacd_type = "Bulk"
                  then
                     lacd_charge = lacd_lc_amt.
               end.  /* FOR FIRST lacd_det */          
               if can-find( first lacd_det no-lock where 
                  lacd_domain = global_domain and
                  lacd_internal_ref      = so_nbr     and
                  lacd_shipfrom          = lv_shipfrom and
                  lacd_internal_ref_type = {&TYPE_SO} and
                  lacd_apportion_method <> {&APPORTION_TYPE_COST}) then do:
 
                  {us/bbi/gprun.i ""lacamts.p""
                                 "(input global_domain,
                                   input '',
                                   input so_nbr,
                                   input '{&TYPE_SO}',
                                   input lv_shipfrom)"}.
 
               end. /*if can-find(first */
 
            end. /* IF FT_ACCRUAL_LEVEL ... */
         end. /* FOR FIRST FT_MSTR ... */
      end.   /* TRANSACTION */
 
      /* CALCULATE FREIGHT */
      if calc_fr
         and so_fr_terms <> ""
      then do transaction:
 
         so_mstr_recid = recid(so_mstr).
 
         /* FREIGHT CHARGE AND WEIGHT CALC FOR SHIPMENTS */
         {us/bbi/gprun.i ""sofrcals.p""
                  "(input table tt_sod_det,
                    input ' ')"}
 
         for each tt_sod_det
         exclusive-lock:
            delete tt_sod_det.
         end.
 
      end.   /* TRANSACTION */
 
      if use-log-acctg and can-find( first lacd_det no-lock where 
         lacd_domain = global_domain and
         lacd_internal_ref      = so_nbr     and
         lacd_shipfrom          = lv_shipfrom and
         lacd_internal_ref_type = {&TYPE_SO} and
         lacd_apportion_method = {&APPORTION_TYPE_COST} ) then do:
            {us/bbi/gprun.i ""lacamts.p""
                     "(input global_domain,
                       input '',
                       input so_nbr,
                       input '{&TYPE_SO}',
                       input lv_shipfrom)"}.
      end. /* if can-find(first */
 
      /* Make sure the alias is pointed back to the central db */
      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
 
         run check-db-connect (input so_db, output db_undo).
 
         if db_undo then
            undo mainloop, retry mainloop.
      end.

      run ProtectSOTrailerChanges.
      if db_undo then
         undo mainloop, retry mainloop.

 
      /* TRAILER DATA INPUT */
/*cy1021*      {us/bbi/gprun.i ""sosoisc.p""*/
/*cy1021*/      {us/bbi/gprun.i ""xxsosoisc.p""
               "(input corr_inv,
                 output l_recalc,
                 input-output table tt_consign_shipment_detail)"}

         run checkSerialIdsAvilable(input table tt_serials, output hasPackUsed).            

         if hasPackUsed then do:
            /* Invalid Stage */
            {us/bbi/pxmsg.i &MSGNUM=11389 &ERRORLEVEL=3 }
            undo ser_control, retry ser_control.
         end.
      end. /*end of ser_control*/
 
      if undo-select and batchrun then
         undo upperloop, leave upperloop.
      else if undo-select then
            undo mainloop, retry mainloop.

      if undo-all then do:
         run RollbackSOTrailerChanges.

         for each sr_wkfl
            where sr_domain = global_domain
            and   sr_userid = SessionUniqueID
         exclusive-lock:
            delete sr_wkfl.
         end.
 
         for each sod_det where sod_domain = global_domain
            and sod_nbr = so_nbr
            and sod_compl_stat = ""
         exclusive-lock:
            assign
               sod_qty_chg = 0
               sod_bo_chg  = 0.
         end.
 
         next.
      end. /* IF undo-all THEN */
 
      /* Determine if this order will be processed with a credit card
       * and validate that the credit card info is valid and that the
       * authorized amount is enough to process the order.  Issue
       * warning if an error occurs and "remember" the order number
       * so that at the end of shipment we can put the order on hold. */
      {us/gp/gprunp.i "soccval" "p" "postValidateCCProcessing"
                "(input so_nbr,
                  input ord_amt,
                  output errorNbr)"}
 
      if errorNbr <> 0 then do:
         {us/bbi/pxmsg.i &MSGNUM=errorNbr &ERRORLEVEL=2}
         {us/bbi/pxmsg.i &MSGNUM=3468 &ERRORLEVEL=2} /*ORDER PLACED ON HOLD*/
         if not batchrun then
           pause.
         /* Mark the sales order to put on hold. */
         vSOToHold = so_nbr.
      end. /*If errorNbr <> 0 then do:*/
 
      {us/gp/gpdelp.i "soccval" "p"} /*Delete persistent procedure*/
 
      /* If batch update, create batch record */
      if batch_update then do transaction:
         run create-batch.
 
         if use-log-acctg
            and lv_accrue_freight
         then
            run storeFreightDetailsInQadWkfl
               (input l_batch_mfguser,
                input lv_shipment_id).
 
         if using_cust_consignment then
            run storeShipmentInQadWkfl
               (input l_batch_mfguser).
 
      end.  /* Batch record creation */
      else do:
 
         /* PROCESS SHIPMENTS ENTERED */
         so_mstr_recid = recid(so_mstr).
 
         run p-post-freight-accrual.

         if corr_inv then do:
            /* PROCESS SERIAL INVENTORY UPDATE */
            {us/px/pxrun.i &PROC  = 'createCorrSOShipmentSerialData' &PROGRAM = 'sosetr.p'
                  &HANDLE = ph_sosetr
                  &PARAM = "(input so_nbr,
                             input table tt_serials by-reference,
                             output undo-select)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
            }
         end.
         else do:
            /* PROCESS SERIAL INVENTORY UPDATE */
            {us/px/pxrun.i &PROC  = 'createSOShipmentSerialData' &PROGRAM = 'sosetr.p'
                  &HANDLE = ph_sosetr
                  &PARAM = "(input so_nbr,
                             input table tt_serials by-reference,
                             output undo-select)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
            }
         end.

         if undo-select then
            undo mainloop, retry mainloop.
  
         /* RECALCULATE SALES ORDER TAX DETAILS (TYPE 11) */
         run p-recalc-so-tax-det.
 
         /* Delete sr_wkfl in the shipping domain */
         {us/bbi/gprun.i ""gpalias3.p"" "(ship_db, output err-flag)"}
 
         run check-db-connect (input ship_db, output db_undo).
 
         if db_undo then
            undo mainloop, retry mainloop.
 
/*cy1241*         {us/bbi/gprun.i ""sosoiss3.p""}*/
/*cy1241*/  run shipit.
 
         /* Make sure the alias is pointed back to the central db */
         {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err-flag)"}
 
         run check-db-connect (input so_db, output db_undo).
 
         if db_undo then
            undo mainloop, retry mainloop.
 
      end.
 
/*cy1024*/ assign cyb_so_nbr = so_nbr.
      release so_mstr.
 
      {us/gp/gprunp.i "soldxr" "p" "updateLegalNumToUnpostedGL"}
/*ca839672*/ release qad_wkfl.
 
      /* RETURN SUCCESS STATUS TO API CALLER */
      if c-application-mode = "API" then return {&SUCCESS-RESULT}.
 
   end. /*mainloop*/
 
   if vSOToHold <> "" then do transaction:
 
      for first ccc_ctrl where ccc_domain = global_domain
      no-lock:
         for first so_mstr where so_domain = global_domain
            and   so_nbr = vSOToHold
            and   so_compl_stat = ""
         exclusive-lock:
            so_stat = ccc_cc_hold_status.
         end.
         vSOToHold = "".
      end.
 
      release so_mstr.
/*ca839672*/ release qad_wkfl.
 
   end. /*If vSOToHold <> "" then do transaction:*/
/*cy1024>>*/
       {us/bbi/gprun.i ""xxxfivpst.p""}
/*cy1024<<*/
 
end. /*UPPERLOOP*/
 
PROCEDURE check-db-connect:
   define input        parameter connect_db like dc_name     no-undo.
   define output       parameter db_undo    like mfc_logical no-undo.
 
   db_undo = err-flag = 2 or err-flag = 3.
   if db_undo then do:
      /* DOMAIN # IS NOT AVAILABLE */
      {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=connect_db}
      next-prompt ship_site with frame a.
   end.
 
END PROCEDURE. /* check-db-connect */
 
PROCEDURE check-batch:
 
   batch_review = false.
 
   for first qad_wkfl
      where   qad_domain = global_domain
      and     qad_key1 = "sosois.p" + so_mstr.so_nbr
      and     qad_key2 = "BATCH"
   no-lock: end.
 
   if available qad_wkfl then do:
 
      if qad_charfld[4] <> "" then
         for first lngd_det
            where   lngd_dataset = "bcd_det"
            and     lngd_field = "bcd_run_stat"
            and     lngd_key1 = qad_charfld[4]
            and     lngd_lang = global_user_lang
         no-lock: end.
 
      if available lngd_det and qad_charfld[4] = "3" then do:
         /* ERROR: Batch shipment already exists with status: */
         {us/bbi/pxmsg.i &MSGNUM=1122 &ERRORLEVEL=3 &MSGARG1=lngd_translation}
         return.
      end.
      else if available lngd_det then do:
         /* WARNING: Batch shipment already exists with status: */
         {us/bbi/pxmsg.i &MSGNUM=1122 &ERRORLEVEL=2 &MSGARG1=lngd_translation}
      end.
      else do:
         /* Batch shipment already exists */
         {us/bbi/pxmsg.i &MSGNUM=1121 &ERRORLEVEL=2}
      end.
 
      /* Continue? */
      {us/bbi/pxmsg.i &MSGNUM=2233 &ERRORLEVEL=1 &CONFIRM=batch_review}
      if not batch_review then return.
 
      /* Set SessionUniqueID to match batch file */
      /* Along with ship_site?           */
      assign
         btemp_mfguser = mfguser
         ship_site     = qad_charfld[2]
         ship_db       = qad_charfld[3].
 
      /* This procedure has been created to avoid the standard checker
       * to give an error message on the modification of the SessionUniqueID
       * variable.         */
      {us/bbi/gprun.i ""gpmfguse.p""
         "(input ""sosois.p"" + so_mstr.so_nbr, output mfguser)"}
 
      batch_review = true.
 
   end.  /* Batch shipment check */
 
END PROCEDURE. /* check-batch */
 
PROCEDURE update-batch:
 
   for first mfc_ctrl
      where   mfc_domain = global_domain
      and     mfc_field = "soc_is_batch"
   no-lock: end.
 
   if available mfc_ctrl
      and mfc_logical = yes
      and not (available qad_wkfl
      and qad_wkfl.qad_charfld[4] = "")
   then
      bat_loop:
      do with frame batr_up on error undo, return error
                            on endkey undo, return error:
        if c-application-mode = "API" and retry
           then return error return-value.
 
         if c-application-mode <> "API" then
            update batch_update.
         else
            {us/mf/mfaiset.i batch_update ttSoShipHdr.ed_batch_upd}.
 
         if batch_update
         then do with frame batr_up:
 
            if c-application-mode <> "API" then
               update dev batch_id.
            else
              assign
                 {us/mf/mfaiset.i dev ttSoShipHdr.ed_device}
                 {us/mf/mfaiset.i batch_id ttSoShipHdr.ed_batch_id}.
 
 
            if dev = "" then do:
               {us/bbi/pxmsg.i &MSGNUM=2235 &ERRORLEVEL=3}
               next-prompt dev.
               undo bat_loop, retry.
            end.
 
            if batch_id = ""
               or not can-find(bc_mstr
               where bc_domain = global_domain
               and   bc_batch = batch_id)
            then do:
               {us/bbi/pxmsg.i &MSGNUM=67 &ERRORLEVEL=3}
               /* Batch control record does not exist */
               next-prompt batch_id.
               undo bat_loop, retry.
            end.
 
            if (dev = "terminal"
               or dev = "/dev/tty"
               or dev = "tt:")
            then do:
               /* Output to terminal not allowed for batch request */
               {us/bbi/pxmsg.i &MSGNUM=66 &ERRORLEVEL=3}
               next-prompt dev.
               undo bat_loop, retry.
            end.
         end.   /* IF batch_update */
 
         /* Assign a unique userid for the shipping workfile */
         assign
            btemp_mfguser = mfguser.
 
         /* This procedure has been created to avoid the standard checker
          * to give an error message on the modification of the SessionUniqueID
          * variable.         */
         {us/bbi/gprun.i ""gpmfguse.p""
                  "(input ""sosois.p"" + so_mstr.so_nbr,
                    output mfguser)"}
 
         if c-application-mode <> "API" then
            hide frame batr_up.
 
      end.   /* batloop */
END PROCEDURE. /* update-batch */
 
PROCEDURE create-batch:
 
   /* No need to create batch if it is already queued normally */
   if not (available qad_wkfl and
      qad_wkfl.qad_charfld[4] = "") then do:
 
      /* Reset the status for a failed batch */
      if available qad_wkfl then qad_charfld[4] = "".
 
      bcdparm = "".
      {us/mf/mfquoter.i so_mstr.so_nbr}
      {us/mf/mfquoter.i eff_date}
      {us/mf/mfquoter.i ship_site}
      {us/mf/mfquoter.i ship_db}
 
      for first bc_mstr
         where   bc_domain = global_domain
         and     bc_batch = batch_id
      no-lock: end.
 
      create bcd_det.
      assign
         bcd_domain = global_domain
         bcd_batch    = batch_id
         bcd_priority = bc_priority
         bcd_date_sub = today
         bcd_time_sub = string(time,"HH:MM:SS")
         bcd_perm     = false
         bcd_userid   = global_userid
         bcd_exec     = "soisbt.p"
         bcd_dev      = dev
         bcd_parm     = bcdparm
         bcd_process  = yes.
 
      if recid(bcd_det) = -1 then.
      /* Request queued for batch processing */
      {us/bbi/pxmsg.i &MSGNUM=64 &ERRORLEVEL=1}
 
      /* Create qad_wkfl rec for quick identification of batch */
      for first qad_wkfl
         where qad_domain = global_domain
         and   qad_key1   = SessionUniqueID
         and   qad_key2   = "BATCH"
      exclusive-lock: end.
 
      /* If the record doesn't exist, create it.*/
      if not available qad_wkfl then do:
         create qad_wkfl.
         qad_domain = global_domain.
         assign
            qad_key1 = SessionUniqueID
            qad_key2 = "BATCH"
            qad_charfld[1] = so_nbr
            qad_datefld[1] = eff_date
            qad_charfld[2] = ship_site
            qad_charfld[3] = ship_db
            qad_charfld[5] = string(l_recalc, "yes/no")
            qad_decfld[1]  = gl_amt.  /* freight charge */
         if qad_charfld[2] = ? then qad_charfld[2] = "".
         if recid(qad_wkfl) = -1 then.
      end.
 
   end. /* IF NOT AVAILABLE QAD_WKFL AND .... */
 
   else do: /* AVAILABLE QAD_WKFL AND QAD_CHARFLD[4] = "" */
 
      /* UPDATE THE FREIGHT IN CASE WE CHANGE THE SHIPMENT QTY AND  */
      /* THEREFORE THE FREIGHT AFTER IT WAS QUEUED.                 */
      for first qad_wkfl
         where qad_domain = global_domain
         and   qad_key1   = SessionUniqueID
         and   qad_key2 = "BATCH"
      exclusive-lock: 
         qad_decfld[1]  = gl_amt.  /* freight charge */
      end.
   end. /* AVAILABLE QAD_WKFL AND QAD_CHARFLD[4] = "" */
 
   /* SAVE SessionUniqueID USED FOR QAD_WKFL BEFORE RESET */
   l_batch_mfguser =  mfguser.
 
   /* Reset SessionUniqueID to original setting */
   /* This procedure has been created to avoid the standard checker
    * to give an error message on the modification of the SessionUniqueID
    * variable.         */
   {us/bbi/gprun.i ""gpmfguse.p"" "(input btemp_mfguser, output mfguser)"}
 
END PROCEDURE.  /* create-batch */
 
PROCEDURE find-mfcctrl:
 
   for first mfc_ctrl
      where   mfc_domain = global_domain
      and     mfc_field = "soc_is_batch"
   no-lock: end.
 
   if available mfc_ctrl then do:
      assign
         batch_mfc    = true
         batch_update = mfc_logical.
 
      for first mfc_ctrl
         where   mfc_domain = global_domain
         and     mfc_field  = "soc_is_dev"
      no-lock:
         dev = mfc_char.
      end.
 
      for first mfc_ctrl
         where   mfc_domain = global_domain
         and     mfc_field  = "soc_is_batid"
      no-lock:
         batch_id = mfc_char.
      end.
 
   end. /* IF AVAILABLE MFC_CTRL */
 
END PROCEDURE.
 
PROCEDURE find-cm-mstr:
   define input parameter inpar_bill like so_bill.
 
   for first cm_mstr
       where  cm_domain = global_domain
       and    cm_addr = inpar_bill
   no-lock: end.
 
   run initialiseCreditManagementLibrary ( input  hCreditLibrary,
                                           output hCreditLibrary).
 
   if isCustomerOnCreditHold(input cm_addr)
   then do:
      /* Warning: Customer on credit hold */
      {us/bbi/pxmsg.i &MSGNUM=614 &ERRORLEVEL=2}
      if c-application-mode <> "API" then do:
         if not batchrun then pause.
      end.
   end.
 
END PROCEDURE.
 
PROCEDURE p_find_mfc:
 
   for first mfc_ctrl
      where mfc_domain = global_domain
      and   mfc_field = "fas_so_rec"
   exclusive-lock: end.
 
   if available mfc_ctrl then do:
      for first fac_ctrl
         where fac_domain = global_domain
      exclusive-lock: end.
      if available fac_ctrl then do:
         fac_so_rec = mfc_logical.
         delete mfc_ctrl.
      end.
      release fac_ctrl.
 
   end.
 
END PROCEDURE.
  
PROCEDURE p_err_msg:
   define input  parameter fsmtype  like so_fsm_type no-undo.
   define input  parameter sosecond like so_secondary no-undo.
   define output parameter err_chk  like mfc_logical  no-undo.
 
   define variable depotCall as logical no-undo.
   sorec = old_sorec.
 
   /* DO NOT LET USERS SHIP MO'S OR CALL ACTIVITY */
   /* RECORDING ORDERS IN SOSOIS.P... */
   if fsmtype = "SEO" then do:
      err_chk = yes.
      /* MATERIAL ORDERS ARE NOT SHIPPED HERE */
      {us/bbi/pxmsg.i &MSGNUM=3358 &ERRORLEVEL=3}
      return.
   end.   /* if so_fsm_type = "SEO" */
 
   else if fsmtype = "FSM-RO" then do:
      /* IF THE SO IS CREATED FROM DEPOT ORDER THEN ALLOW SO SHIPMENT */
      /* PROGRAM TO BE USED. I THINK IT IS NOT A GOOD IDEA. BUT IT WAS */
      /* DECIDED THAT IT WILL BE MEMO TYPE AND WON'T HAVE IMPACT ON */
      /* INVENTORY, THEN WHY TO USE? */
      /* VALIDATE IF THE CALL IS DEPOT ORDER CALL */
      {us/px/pxrun.i &PROC  = 'validateDepotCall' &PROGRAM = 'fssmxr.p'
               &HANDLE = ph_fssmxr
               &PARAM = "(input so_mstr.so_nbr,
                          output depotCall
                         )"
               &NOAPPERROR = true
               &CATCHERROR = true
      }
      if not depotCall then do:
         err_chk = yes.
         /* USE CALL ACTIVITY RECORDING FOR THIS ORDER */
         {us/bbi/pxmsg.i &MSGNUM=1058 &ERRORLEVEL=3}
      end.
      /* SINCE THIS IS A DEPOT ORDER TYPE SO, CHANGE THE sorec HERE.*/
      /* NORMALLY sorec IS ASSIGNED IN SOSOIS.P */
      /* QUESTION MAY COME UP WHY NOT CHANGE IN SOSOIS.P. THE REASON IS */
      /* WE DON'T WANT TO CREATE ANOTHER TOP LEVEL PROGRAM AND STILL WANT */
      /* USE ALL THE SO SHIPMENT FUNCTIONALITY, ALSO WE DON'T WANT TO */
      /* ASSIGN DIFFERENT VALUE TO SOD_FSM_TYPE AND SO_FSM_TYPE. */
      /* SO TO BY PASS ALL SOD_FSM_TYPE CHECK SOREC IS CHAHGED, IT IS KIND */
      /* OF DECEVING, BUT THAT IS THE TRUTH */
      else do:
         if so_mstr.so_conf_date = ? then do:
            err_chk = yes.
            /* ORDER IS NOT CONFIRMED */
            {us/bbi/pxmsg.i &MSGNUM=8839 &ERRORLEVEL=3}
         end.
         else if so_mstr.so_stat <> "" then do:
            err_chk = yes.
            /* ORDER STATUS IS NOT BLANK */
            {us/bbi/pxmsg.i &MSGNUM=7314 &ERRORLEVEL=3}
         end.
         else
            sorec = fssodoship.
      end.
 
      if valid-handle(ph_fssmxr) then do:
         delete object ph_fssmxr.
         ph_fssmxr = ?.
      end.
      return.
   end.   /* if so_fsm_type = "FSM-RO" */
 
   else if fsmtype = "SC"
   then do:
      err_chk = yes.
      /* INVALID ORDER TYPE */
      {us/bbi/pxmsg.i &MSGNUM=5103 &ERRORLEVEL=3}
      return.
   end. /* IF FSMTYPE = "SC" */
 
   if sosecond then do:
      err_chk = yes.
      /* BTB ORDERS ARE NOT ALLOWED IN THIS TRANSACTION */
      {us/bbi/pxmsg.i &MSGNUM=2822 &ERRORLEVEL=3}
      return.
   end. /* IF SOSECOND */
 
END PROCEDURE. /* P_ERR_MSG */
 
PROCEDURE p-find-mfc-rec:
 
   copyusr = no.
 
   {us/mf/mfctrl01.i mfc_ctrl so_copy_usr cchar no no}
 
   if cchar = "yes" then
      copyusr = yes.
 
END PROCEDURE. /* P-FIND-MFC-REC */
 
PROCEDURE p-sel-line-qty:
 
   /* SELECT LINES AND QUANTITES FOR SHIPMENT */
   /* ADDED tt_ssm_sod_det AND consume_shipped PARAMETERS */
   /* tt_ssm_sod_det WILL BE EMPTY FROM SO SHIPMENT */
/*cy1021*    {us/bbi/gprun.i ""sosoisd.p"" */
/*cy1021*/   {us/bbi/gprun.i ""xxsoisd.p""
      "(input-output table tt_consign_shipment_detail,
        output       table tt_sod_det,
        output       table tt_ssm_sod_det,
        input        '',
        input        '',
        input        no,   /* DO NOT CONSUME WHEN SHIPPED */
        output       table tt_attr_pfvalue by-reference,
        input        fill_ship_by_pack,
        input-output        table tt_serials by-reference)"}

/*c1346* start added code */
   for each sod_det
   where sod_domain = global_domain
   and   sod_nbr = so_mstr.so_nbr
   and   sod_compl_stat = ""
   exclusive-lock:
      if can-find(first pt_mstr
      where pt_domain = global_domain
      and   pt_part = sod_part
      and   pt_cfg_type = "2")
      then  do:
          sod_qty_all = 0.0.
          for first in_mstr where in_domain = global_domain
          and  in_site = sod_site
          and  in_part = sod_part:
            in_qty_all = 0.0.
          end.
      end.
   end.
/*c1346* end   added code */

   /* empty allocation override check information in qad_wkfl */
   for each qad_wkfl exclusive-lock
      where qad_wkfl.qad_domain = global_domain
      and   qad_wkfl.qad_key1 = SessionUniqueID
      and   qad_wkfl.qad_key2 begins "AL":
      delete qad_wkfl.
   end.

   /* RESET SOD_QTY_CHG, SOD_BO_CHG TO ZERO */
   /* IF THE USER ABORTED OUT OF SOSOISD.P  */
   if undo-select then
      for each sod_det
         where sod_domain = global_domain
         and   sod_nbr = so_mstr.so_nbr
         and   sod_compl_stat = ""
      exclusive-lock:
         assign
            sod_qty_chg = 0
            sod_bo_chg  = 0.
   end. /* FOR EACH SOD_DET */
 
END PROCEDURE. /* P-SEL-LINE-QTY */
 
PROCEDURE p-recalc-so-tax-det:
 
   /* IF WE ARE SHIPPING DEPOT ORDER SO THEN */
   /* TAX TYPE WILL BE 38 */
   define variable l_tax_type like tax_type no-undo.
 
   if so_mstr.so_fsm_type = "" then
      l_tax_type = "11".
   else
     if so_mstr.so_fsm_type = "FSM-RO" then
        l_tax_type = "38".
 
   if (so_mstr.so_fsm_type = "" 
   or so_mstr.so_fsm_type = "FSM-RO")
   and l_recalc
   then do:
      /* TYPE 11 TAX DETAIL RECS DON'T EXIST FOR SCHEDULED ORDERS */
      if not so_sched then do:
         {us/bbi/gprun.i ""txcalc.p""
                  "(input  l_tax_type,
                    input  so_mstr.so_nbr,
                    input  so_mstr.so_quote,
                    input  0,
                    input  no,
                    output result-status)"}
      end.
   end. /* IF SO_MSTR.SO_FSM_TYPE = "" AND L_RECALC */
 
   if so_mstr.so_fsm_type = "RMA"
   then do:
 
      for first tx2d_det
         where tx2d_domain = global_domain
           and tx2d_ref = so_mstr.so_nbr
           and tx2d_nbr = ''
           and tx2d_tr_type = '36'
           and tx2d_edited
      no-lock:
         /* Previous tax values edited. Recalculate? */
         {us/bbi/pxmsg.i &MSGNUM=917 &ERRORLEVEL=2 &CONFIRM=recalc}
      end.
 
      if recalc then do:
         /* THE POST FLAG IS SET  TO 'NO' BECAUSE WE ARE NOT CREATING */
         /* QUANTUM REGISTER RECORDS FROM THIS CALL TO TXCALC.P       */
         {us/bbi/gprun.i ""txcalc.p""
                  "(input  '36',
                    input  so_mstr.so_nbr,
                    input  '',
                    input  0 /*ALL LINES*/,
                    input no,
                    output result-status)"}
      end. /* IF RECALC */
 
   end.
 
END PROCEDURE. /* P-RECALC-SO-TAX-DET */
 
PROCEDURE p-post-freight-accrual:
   /* MOVED THE FREIGHT ACCRUAL POSTING AFTER SHIPMENTS ARE PROCESSED.       */
 
   /* WHEN POSTING FREIGHT WITH LOGISTICS ACCOUNTING WE NEED THE TRANSACTION */
   /* NUMBER(tr_trnbr)FOR THE "ISS-SO" TRANSACTION. THIS NUMBER IS USED TO   */
   /* RELATE THE TRGL_DET RECORDS CREATED IN LAFRPST.P TO "ISS-SO"           */
   /* TRANSACTION(TR_HIST) RECORD.                                           */
 
   undo-select = false.
 
   /* PROCESS SHIPMENTS ENTERED */
   run p_shipment.
 
   /* POST FREIGHT ACCRUALS */
   if gl_amt <> 0
   then do:
 
      for first so_mstr 
         where recid(so_mstr) = so_mstr_recid
      no-lock: 
      end. 

      for first ft_mstr
         where   ft_domain = global_domain
         and     ft_terms = so_fr_terms
      no-lock:
      end.
 
      /* IF LOGISTICS ACCOUNTING IS ENABLED THEN CREATE PENDING VOUCHER */
      /* MASTER AND DETAIL RECORDS AND POST THE FREIGHT TO THE GL.      */
      if use-log-acctg
         and lv_accrue_freight
         and (available ft_mstr 
              and not (ft_type = "3" 
                          and ft_lc_charge = ""))
      then do:
 
         for first sod_det 
            where sod_domain = so_domain 
               and   sod_nbr = so_nbr  
         no-lock:
         end. /* FOR FIRST sod_det */
 
         if available ft_mstr
         then do:
            for first lacd_det no-lock where 
               lacd_domain = global_domain and
               lacd_internal_ref      = so_nbr     and
               lacd_shipfrom          = sod_site   and
               lacd_lc_charge         = ft_lc_charge and
               lacd_internal_ref_type = {&TYPE_SO} and
               lacd_apportion_method  = {&APPORTION_TYPE_WT}:
            end. /* FOR FIRST lacd_det */ 

            if available lacd_det 
            then do:
               for first lacod_det no-lock 
                  where lacod_det.oid_lacd_det   = lacd_det.oid_lacd_det 
                    and lacod_det.oid_order_line = oid_sod_det:
                  assign
                     l_ex_rate  = lacod_ex_rate
                     l_ex_rate2 = lacod_ex_rate2.
               end. /* FOR FIRST lacod_det */
            end. /* IF AVAILABLE lacd_det */

            /* CREATE FREIGHT ACCRUAL RECORDS */
            {us/gp/gprunmo.i &module = "LA" &program = "lafrpst.p"
                       &param  = """(input '{&TYPE_SOShipment}',
                                     input lv_shipment_id,
                                     input so_nbr,
                                     input so_ship_date,
                                     input eff_date,
                                     input so_ship,
                                     input '{&TYPE_SO}',
                                     input so_curr,
                                     input if l_ex_rate <> 0 and so_curr = lacod_curr then l_ex_rate else so_ex_rate,
                                     input if l_ex_rate2 <> 0 and so_curr = lacod_curr then l_ex_rate2 else so_ex_rate2,
                                     input ' ',  /* BLANK PVO_EX_RATETYPE */
                                     input so_exru_seq,
                                     input so_cust)"""}
         end. /* IF AVAILABLE ft_mstr */
      end. /* IF use-log-acctg */
      else do:
         {us/bbi/gprun.i ""sofrpst.p"" "(input eff_date)"}
      end. /* IF use-log-acctg IS FALSE */
      gl_amt = 0.
   end. /* IF GL_AMT <> 0 */
 
END PROCEDURE. /* P-POST-FREIGHT-ACCRUAL */
 
 
PROCEDURE find-soddet:
 
   define input  parameter p_sonbr    like so_nbr      no-undo.
   define input  parameter p_shipsite like sod_site    no-undo.
   define output parameter p_l_undo   like mfc_logical no-undo.
 
   for first sod_det where sod_domain = global_domain
        and sod_nbr  = p_sonbr
        and sod_site = p_shipsite
        and sod_compl_stat = ""
   no-lock: end.
   if not available sod_det then do:
      /* THE SITE ENTERED ON HEADER DOES NOT BELONG TO THE */
      /* LINE ITEM SITES OF SALES ORDER.                   */
      {us/bbi/pxmsg.i &MSGNUM=4561 &ERRORLEVEL=3 &MSGARG1=p_sonbr}
      p_l_undo = yes.
   end. /* IF NOT AVAILABLE sod_det */
 
END PROCEDURE.
 
PROCEDURE p_shipment:
/* PROCEDURE p_shipment VERIFIES THAT SHIPMENTS ARE PROCESSED FOR ONLY */
/* NON-ERRONEOUS LINE ITEMS DURING CIM LOAD WHEN THE FLAG              */
 
   for first sr_wkfl
      where sr_domain = global_domain
      and   sr_userid = SessionUniqueID
   no-lock: end.
   /* PROCESS SHIPMENTS ENTERED */
/*cy1044*    {us/bbi/gprun.i ""sosoisa.p"" */
/*cy1044*/   {us/bbi/gprun.i ""xxsosoisa.p""
      "(input-output table tt_consign_shipment_detail by-reference,
        input-output table tt_attr_pfvalue by-reference,
        input-output table tt_serials by-reference)"}
 
   run LdShipmentID (input 1, /*Delete*/ 
                     input "").         
END PROCEDURE. /* PROCEDURE p_shipment */
 
PROCEDURE storeFreightDetailsInQadWkfl:
 
   /* IF THE SHIPMENT IS DONE IN BATCH MODE THE FREIGHT IS CALC-  */
   /* ULATED WHEN AN SHIPMENT IS ENTERED AND THE ACTUAL SHIPMENT  */
   /* ALONG WITH THE FREIGHT POSTING IS DONE IN THE BATCH MODE    */
   /* THROUGH SOISBT.P - SO BATCH SHIPMENT PROCESSOR              */
   /* WITH LOGISTICS ACCOUNTING ENABLED WE STORE THE FREIGHT      */
   /* DETAILS WHEN THE FREIGHT IS CALCULATED IN A TEMP-TABLE      */
   /* AND USE THAT TEMP-TABLE TO POST FREIGHT.                    */
   /* WHEN FREIGHT IS POSTED IN BATCH, WE NEED TO STORE THE TEMP- */
   /* TABLE DATA TO QAD_WKFL SO THAT IT IS AVAILABLE WHEN POSTING */
   /* FREIGHT IN SOISBT.P                                         */
 
   define input  parameter ip_mfguser      as character no-undo.
   define input parameter  ip_shipment_id  as character no-undo.
 
   /* WE DO NOT NEED THE OUTPUT - FOURTH PARAMETER FROM LAFRTTM1.P */
   /* STORE IT IN A TEMP VARIABLE.                                 */
   define variable l_temp as character no-undo.
 
   /* GET qad_wkfl RECORD FOR THE BATCH MODE */
   for first qad_wkfl
      where qad_domain = global_domain
      and   qad_key1 = ip_mfguser  /* CONTAINS sosois.p+so_nbr */
      and   qad_key2 = "BATCH"
   no-lock:
 
      {us/gp/gprunmo.i  &module = "LA" &program = "lafrttm1.p"
                  &param  = """(input 0,
                                input ip_mfguser,
                                input ip_shipment_id,
                                output l_temp)"""}
   end. /* FOR FIRST QAD_WKFL */
END PROCEDURE. /* PROCEDURE storeFreightDetailsInQadWkfl */
 
PROCEDURE storeShipmentInQadWkfl:
   define input  parameter ip_mfguser      as character no-undo.
 
   /* GET qad_wkfl RECORD FOR THE BATCH MODE */
   for first qad_wkfl
      where qad_domain = global_domain
      and   qad_key1 = ip_mfguser /* sosois.p + so_nbr */
      and   qad_key2 = "BATCH"
   no-lock:
 
      /* TRANSFER CONSIGNMENT TEMP-TABLE TO qad_wkfl, SO THAT     */
      /* IT CAN BE RECONSTRUCTED WHEN RUN IN BATCH MODE.          */
      {us/gp/gprunmo.i &program = "socntmp.p" &module  = "ACN"
                 &param   = """(input 0,
                                input ip_mfguser,
                                input-output table
                                   tt_consign_shipment_detail)"""}
 
   end.
END PROCEDURE. /* PROCEDURE storeShipmentInQadWkfl */
 
PROCEDURE LdShipmentID:
   /*Save the shipperID generated for Logistics Accounting so *
    * it can be used later when creating the Legal Document   */
   define input parameter iAction as integer no-undo. 
   define input parameter ShipmentID as character no-undo.
 
   define buffer qad_wkfl for qad_wkfl.
 
   case iAction:
       when 0 then do:
           create qad_wkfl.
           assign
              qad_wkfl.qad_domain = global_domain
              qad_wkfl.qad_key1 = SessionUniqueID
              qad_wkfl.qad_key2 = "SHIPPER-ID"
              qad_wkfl.qad_key3 = ShipmentID.
       end.       
       otherwise do:
           for first qad_wkfl exclusive-lock where
              qad_wkfl.qad_domain = global_domain and
              qad_wkfl.qad_key1 = SessionUniqueID and
              qad_wkfl.qad_key2 = "SHIPPER-ID":
              delete qad_wkfl.
           end.             
       end.
    end.          
END PROCEDURE.  /*LdShipmentID*/   

PROCEDURE ProtectSOTrailerChanges:
   db_undo = no.
   if ship_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
      run check-db-connect (input ship_db, output db_undo).

      if db_undo then
         return.
   end.

   for first so_mstr where recid(so_mstr) = so_mstr_recid
   no-lock:
      assign
         ori_so_to_inv     = so_to_inv
         ori_so_shipvia    = so_shipvia
         ori_so_ship_date  = so_ship_date
         ori_so_bol        = so_bol
         ori_so_rmks       = so_rmks
         ori_so_daybookset = so_daybookset
         .
   end.

   if ship_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
      run check-db-connect (input so_db, output db_undo).
   end.

END PROCEDURE.

PROCEDURE RollbackSOTrailerChanges:
   define buffer so_mstr for so_mstr.

   db_undo = no.
   if ship_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}
      run check-db-connect (input ship_db, output db_undo).

      if db_undo then
         return.
   end.

   for first so_mstr where recid(so_mstr) = so_mstr_recid
   exclusive-lock:
      assign
         so_to_inv     = ori_so_to_inv
         so_shipvia    = ori_so_shipvia
         so_ship_date  = ori_so_ship_date
         so_bol        = ori_so_bol
         so_rmks       = ori_so_rmks
         so_daybookset = ori_so_daybookset
         .
   end.

   if ship_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}
      run check-db-connect (input so_db, output db_undo).
   end.

END PROCEDURE.

PROCEDURE checkSerialIdsAvilable:
   define input  parameter table         for  tt_serials.
   define output parameter hasPackUsed   as logical no-undo.

   define variable masterPackStg         like ser_stage  no-undo.

   define buffer   b_cil_mstr            for  cil_mstr.
   
   hasPackUsed = no.
   empty temp-table tt_inv_serials.
   for first b_cil_mstr
      where b_cil_mstr.cil_domain = global_domain
      and   b_cil_mstr.cil_cor_so_nbr = so_mstr.so_nbr no-lock:
      {us/px/pxrun.i &PROC  = 'getSerialByInvAndOrd' &PROGRAM = 'sosetr.p'
                     &HANDLE = ph_sosetr
                     &PARAM = "(input b_cil_mstr.cil_mstr_inv,
                                input b_cil_mstr.cil_prev_so_nbr,
                                input-output table tt_inv_serials)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
   end.
  
   for each tt_serials no-lock
   break by tt_serials.tt_master_serial_id:
      if first-of(tt_serials.tt_master_serial_id) then do:
         {us/px/pxrun.i &PROC = 'getMasterPackStage'
                        &PROGRAM = 'pasexr.p'
                        &HANDLE = ph_pasexr
                        &PARAM = "(input tt_serials.tt_master_serial_id,
                                   output masterPackStg)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
         if (tt_serials.tt_item_ship_qty < 0 and masterPackStg = {&SER-STAGE-ACTIVE})then do:
            hasPackUsed = yes.
            leave.
         end.
         if (tt_serials.tt_item_ship_qty > 0 and masterPackStg = {&SER-STAGE-CONSUMED}) then do:
            if can-find(first tt_inv_serials
                        where tt_inv_serials.tt_inv_master_ser_id = tt_serials.tt_master_serial_id) then do:
               next.
            end.
            hasPackUsed = yes.
            leave.
         end.
      end.
   end.
END PROCEDURE.



/*c1241*  start added code */
procedure shipit.
      {us/bbi/gprun.i ""sosoiss3.p""}
      release usrw_wkfl.

end.



define stream logit.
procedure logit.
def input parameter iptxt as char.
def var logname as char.
logname = entry(num-entries(program-name(1), "~/"), program-name(1), "~/").
logname = entry(1, logname, "~.").
   output stream logit to value("/tmp/" + trim(logname) + ".log") append.
   put stream logit unformatted
   string(program-name(2)) + "|" +
   string(today) + "|" +
   string(time, "HH:MM:SS") + "|" +
   global_userid + "|" +
   iptxt.
   if program-name(3) <> ? then
   put stream logit unformatted
   "|" + string(program-name(3)).
   if program-name(4) <> ? then
   put stream logit unformatted
   "|" + string(program-name(4)).
   put stream logit unformatted
   skip.
   output stream logit close.
   unix value("chmod 666 ~/tmp~/" + trim(logname) + ".log 2~>~/dev~/null").
end.  /* procedure logit */
