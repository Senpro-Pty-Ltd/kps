/* xxporca.p - PURCHASE ORDER RECEIPT W/ SERIAL NUMBER CONTROL                */
/* poporca.p - PURCHASE ORDER RECEIPT W/ SERIAL NUMBER CONTROL                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxporca.p,v 1.3 2018/03/23 14:18:11 gbg Exp $: */
/*                                                                            */
/* REVISION: 7.0     LAST MODIFIED: 11/19/91    BY: pma *F003*                */
/* REVISION: 7.0     LAST MODIFIED: 12/09/91    BY: RAM *F070*                */
/* REVISION: 7.0     LAST MODIFIED: 01/31/92    BY: RAM *F126*                */
/* REVISION: 7.0     LAST MODIFIED: 02/12/92    BY: pma *F190*                */
/* REVISION: 7.0     LAST MODIFIED: 03/03/92    BY: pma *F085*                */
/* REVISION: 7.0     LAST MODIFIED: 03/09/92    BY: RAM *F269*                */
/* REVISION: 7.0     LAST MODIFIED: 03/11/92    BY: pma *F087*                */
/* REVISION: 7.0     LAST MODIFIED: 03/24/92    BY: RAM *F311*                */
/* REVISION: 7.3     LAST MODIFIED: 10/24/92    BY: sas *G240*                */
/* REVISION: 7.3     LAST MODIFIED: 09/27/92    BY: jcd *G247*                */
/* REVISION: 7.3     LAST MODIFIED: 11/10/92    BY: pma *G304*                */
/* REVISION: 7.3     LAST MODIFIED: 12/14/92    BY: tjs *G443*                */
/* REVISION: 7.3     LAST MODIFIED: 01/11/93    BY: bcm *G425*                */
/* REVISION: 7.3     LAST MODIFIED: 01/18/93    BY: WUG *G563*                */
/* REVISION: 7.3     LAST MODIFIED: 02/22/93    BY: tjs *G718*                */
/* REVISION: 7.3     LAST MODIFIED: 04/09/93    BY: WUG *G873*                */
/* REVISION: 7.3     LAST MODIFIED: 04/19/93    BY: tjs *G964*                */
/* REVISION: 7.2     LAST MODIFIED: 05/13/93    BY: kgs *GA90*                */
/* REVISION: 7.2     LAST MODIFIED: 05/26/93    BY: kgs *GB35*                */
/* REVISION: 7.3     LAST MODIFIED: 06/17/93    BY: WUG *GC41*                */
/* REVISION: 7.3     LAST MODIFIED: 06/21/93    BY: WUG *GC57*                */
/* REVISION: 7.3     LAST MODIFIED: 06/30/93    BY: dpm *GC87*                */
/* REVISION: 7.4     LAST MODIFIED: 07/02/93    BY: jjs *H020*                */
/* REVISION: 7.4     LAST MODIFIED: 07/26/93    BY: WUG *H038*                */
/* REVISION: 7.4     LAST MODIFIED: 09/15/93    BY: tjs *H093*                */
/* REVISION: 7.3     LAST MODIFIED: 11/19/93    BY: afs *H236*                */
/* REVISION: 7.3     LAST MODIFIED: 04/19/94    BY: dpm *GJ42*                */
/* REVISION: 7.3     LAST MODIFIED: 07/19/94    BY: dpm *FP45*                */
/* REVISION: 7.3     LAST MODIFIED: 07/28/94    BY: dpm *FP66*                */
/* REVISION: 7.3     LAST MODIFIED: 08/02/94    BY: rmh *FP73*                */
/* REVISION: 7.3     LAST MODIFIED: 09/11/94    BY: rmh *GM16*                */
/* REVISION: 7.3     LAST MODIFIED: 09/20/94    BY: ljm *GM74*                */
/* REVISION: 7.3     LAST MODIFIED: 10/11/94    BY: cdt *FS26*                */
/* REVISION: 7.3     LAST MODIFIED: 10/18/94    BY: cdt *FS54*                */
/* REVISION: 8.5     LAST MODIFIED: 10/24/94    BY: pma *J040*                */
/* REVISION: 7.3     LAST MODIFIED: 10/25/94    BY: cdt *FS78*                */
/* REVISION: 8.5     LAST MODIFIED: 10/27/94    BY: taf *J038*                */
/* REVISION: 7.3     LAST MODIFIED: 10/27/94    BY: ljm *GN62*                */
/* REVISION: 7.3     LAST MODIFIED: 11/10/94    BY: bcm *GO37*                */
/* REVISION: 8.5     LAST MODIFIED: 11/22/94    BY: mwd *J034*                */
/* REVISION: 8.5     LAST MODIFIED: 12/14/94    BY: ktn *J041*                */
/* REVISION: 8.5     LAST MODIFIED: 12/20/94    BY: tjs *J014*                */
/* REVISION: 7.4     LAST MODIFIED: 12/28/94    BY: srk *G0B2*                */
/* REVISION: 7.3     LAST MODIFIED: 03/15/95    BY: pcd *G0HJ*                */
/* REVISION: 7.4     LAST MODIFIED: 03/22/95    BY: dxk *F0NS*                */
/* REVISION: 7.4     LAST MODIFIED: 05/22/95    BY: jym *F0S0*                */
/* REVISION: 8.5     LAST MODIFIED: 06/07/95    BY: sxb *J04D*                */
/* REVISION: 8.5     LAST MODIFIED: 07/31/95    BY: kxn *J069*                */
/* REVISION: 8.5     LAST MODIFIED: 09/26/95    BY: kxn *J07M*                */
/* REVISION: 8.5     LAST MODIFIED: 10/07/95    BY: kxn *J08J*                */
/* REVISION: 7.4     LAST MODIFIED: 07/11/95    BY: jym *G0RY*                */
/* REVISION: 7.4     LAST MODIFIED: 08/07/95    BY: jym *G0TP*                */
/* REVISION  7.4     LAST MODIFIED: 08/15/95    BY: rvw *G0V0*                */
/* REVISION  7.4     LAST MODIFIED: 09/12/95    BY: ais *F0V7*                */
/* REVISION  7.4     LAST MODIFIED: 10/23/95    BY: ais *G19K*                */
/* REVISION  7.4     LAST MODIFIED: 10/31/95    BY: jym *F0TC*                */
/* REVISION: 8.5     LAST MODIFIED: 11/07/95    BY: kxn *J091*                */
/* REVISION: 8.5     LAST MODIFIED: 03/11/96    BY: jpm *J0F5*                */
/* REVISION: 8.5     LAST MODIFIED: 03/28/96    BY: rxm *G1R9*                */
/* REVISION: 8.5     LAST MODIFIED: 05/01/96    BY: *J04C* Sue Poland         */
/* REVISION: 8.5     LAST MODIFIED: 05/14/96    BY: *G1SL* Robin McCarthy     */
/* REVISION: 8.5     LAST MODIFIED: 06/28/96    BY: *J0WR* Sue Poland         */
/* REVISION: 8.5     LAST MODIFIED: 07/03/96    BY: *G1Z8* Ajit Deodhar       */
/* REVISION: 8.5     LAST MODIFIED: 07/29/96    BY: *J12S* Kieu Nguyen        */
/* REVISION: 8.5     LAST MODIFIED: 09/03/96    BY: *J14K* Sue Poland         */
/* REVISION: 8.5     LAST MODIFIED: 01/05/97    BY: *J1DH* Julie Milligan     */
/* REVISION  8.5     LAST MODIFIED: 02/27/97    BY: *H0SN* Suresh Nayak       */
/* REVISION: 8.5     LAST MODIFIED: 04/30/97    BY: *J1QB* Sanjay Patil       */
/* REVISION: 8.5     LAST MODIFIED: 05/13/97    BY: *G2M4* Ajit Deodhar       */
/* REVISION: 8.5     LAST MODIFIED: 10/15/97    BY: *J22T* Niranjan Ranka     */
/* REVISION: 8.6E    LAST MODIFIED: 02/23/98    BY: *L007* A. Rahane          */
/* REVISION: 8.6E    LAST MODIFIED: 04/01/98    BY: *J2HH* A. Licha           */
/* REVISION: 8.6E    LAST MODIFIED: 06/26/98    BY: *J2MG* Samir Bavkar       */
/* REVISION: 8.6E    LAST MODIFIED: 06/30/98    BY: *J2P2* Niranjan R.        */
/* REVISION: 8.6E    LAST MODIFIED: 07/29/98    BY: *J2QC* Niranjan R.        */
/* REVISION: 8.6E    LAST MODIFIED: 08/20/98    BY: *J2WJ* Ajit Deodhar       */
/* REVISION: 9.0     LAST MODIFIED: 01/19/99    BY: *J38P* Surekha Joshi      */
/* REVISION: 9.0     LAST MODIFIED: 03/13/99    BY: *M0BD* Alfred Tan         */
/* REVISION: 9.0     LAST MODIFIED: 04/16/99    BY: *J2DG* Reetu Kapoor       */
/* REVISION: 9.0     LAST MODIFIED: 05/15/99    BY: *J39K* Sanjeev Assudani   */
/* REVISION: 9.1     LAST MODIFIED: 10/25/99    BY: *N002* Bill Gates         */
/* REVISION: 9.1     LAST MODIFIED: 03/06/00    BY: *N05Q* Thelma Stronge     */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1     LAST MODIFIED: 03/28/00    BY: *N090* David Morris       */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* REVISION: 9.1     LAST MODIFIED: 07/28/00    BY: *M0PQ* Falguni Dalal      */
/* REVISION: 9.1      LAST MODIFIED: 05/21/00   BY: Strip/Beautify:  3.0      */
/* REVISION: 9.1     LAST MODIFIED: 06/27/00    BY: *N0DM* Mudit Mehta        */
/* REVISION: 9.1     LAST MODIFIED: 07/14/00    BY: *N0DV* Inna Lyubarsky     */
/* REVISION: 9.1      LAST MODIFIED: 06/15/00   BY: Zheng Huang      *N0DK*   */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KQ* myb                */
/* Revision: 1.46     BY: Markus Barone         DATE: 09/01/00  ECO: *N0R3*   */
/* Revision: 1.47     BY: Kaustubh K.           DATE: 09/08/00  ECO: *M0RJ*   */
/* Revision: 1.48     BY: Reetu Kapoor          DATE: 11/28/00  ECO: *M0X2*   */
/* Revision: 1.49     BY: Mudit Mehta           DATE: 09/30/00  ECO: *N0WT*   */
/* Revision: 1.51     BY: Katie Hilbert         DATE: 04/01/01  ECO: *P002*   */
/* Revision: 1.53     BY: Hareesh V.            DATE: 08/16/01  ECO: *M1GR*   */
/* Revision: 1.54     BY: Rajiv Ramaiah         DATE: 09/17/01  ECO: *N12L*   */
/* Revision: 1.55     BY: Manjusha Inglay       DATE: 01/03/02  ECO: *N178*   */
/* Revision: 1.56     BY: Vivek Dsilva          DATE: 02/21/02  ECO: *N19R*   */
/* Revision: 1.57.1.1 BY: Reetu Kapoor          DATE: 03/25/02  ECO: *N1FC*   */
/* Revision: 1.58     BY: Jeff Wootton          DATE: 05/14/02  ECO: *P03G*   */
/* Revision: 1.59     BY: Lena Lim              DATE: 05/30/02  ECO: *P07G*   */
/* Revision: 1.61     BY: Jeff Wootton          DATE: 06/03/02  ECO: *P079*   */
/* Revision: 1.62     BY: Manisha Sawant        DATE: 11/26/02  ECO: *N20M*   */
/* Revision: 1.63     BY: Deepali Kotavadekar   DATE: 01/24/03  ECO: *N23Y*   */
/* Revision: 1.64     BY: Gnanasekar            DATE: 02/12/03  ECO: *N277*   */
/* Revision: 1.66     BY: Pawel Grzybowski      DATE: 03/27/03  ECO: *P0NT*   */
/* Revision: 1.67     BY: Orawan S.             DATE: 05/26/03  ECO: *P0RG*   */
/* Revision: 1.69     BY: Paul Donnelly (SB)    DATE: 06/28/03  ECO: *Q00J*   */
/* Revision: 1.70     BY: Gnanasekar            DATE: 08/05/03  ECO: *P0XW*   */
/* Revision: 1.73     BY: Shoma Salgaonkar      DATE: 09/26/03  ECO: *N2K8*   */
/* Revision: 1.74     BY: Prashant Parab        DATE: 12/04/03  ECO: *P1DD*   */
/* Revision: 1.76     BY: Deepak Rao            DATE: 02/26/04  ECO: *P1QV*   */
/* Revision: 1.77     BY: Vandna Rohira         DATE: 04/27/04  ECO: *P1Z3*   */
/* Revision: 1.78     BY: Max Iles              DATE: 07/01/04  ECO: *N2VQ*   */
/* Revision: 1.83     BY: Priya Idnani          DATE: 10/15/04  ECO: *P2PM*   */
/* Revision: 1.84     BY: Priya Idnani          DATE: 10/27/04  ECO: *Q0F2*   */
/* Revision: 1.87     BY: Dan Herman            DATE: 11/04/04  ECO: *M1V1*   */
/* Revision: 1.88     BY: Tejasvi Kulkarni      DATE: 12/29/04  ECO: *P31T*   */
/* Revision: 1.89     BY: Shivanand H           DATE: 01/06/05  ECO: *P32W*   */
/* Revision: 1.90     BY: Bhagyashri Shinde     DATE: 01/28/05  ECO: *P35C*   */
/* Revision: 1.91     BY: Priyank Khandare      DATE: 02/02/05  ECO: *P35K*   */
/* Revision: 1.92     BY: Ajit Philip           DATE: 14/03/05  ECO: *P3BV*   */
/* Revision: 1.93     BY: Ed van de Gevel       DATE: 18/03/05  ECO: *R00F*   */
/* Revision: 1.94     BY: Preeti Sattur         DATE: 06/23/05  ECO: *P3QJ*   */
/* Revision: 1.95     BY: Anitha Gopal          DATE: 07/07/05  ECO: *P3RL*   */
/* Revision: 1.93.2.2 BY: David Morris          DATE: 09/29/05  ECO: *R021*   */
/* Revision: 1.96     BY: Michael Hansen        DATE: 09/29/05  ECO: *R021*   */
/* Revision: 1.100    BY: Rafiq S               DATE: 12/06/05  ECO: *P4B8*   */
/* Revision: 1.102    BY: Kirti Desai           DATE: 12/27/05  ECO: *P4CF*   */
/* Revision: 1.103    BY: Ellen Borden          DATE: 12/28/05  ECO: *R000*   */
/* Revision: 1.104    BY: Ellen Borden          DATE: 01/17/06  ECO: *R008*   */
/* Revision: 1.105    BY: Shridhar M            DATE: 02/19/06  ECO: *P4J2*   */
/* Revision: 1.106    BY: Shridhar M            DATE: 03/20/06  ECO: *P4J2*   */
/* Revision: 1.107    BY: Munira savai          DATE: 03/21/06  ECO: *P4K6*   */
/* Revision: 1.109    BY: SurenderSingh Nihalani DATE: 05/16/06 ECO: *P4PQ*   */
/* Revision: 1.110    BY: Shilpa Kamath          DATE: 06/12/06 ECO: *R05X*   */
/* Revision: 1.111     BY: SurenderSingh Nihalani DATE: 06/19/06 ECO: *P4S2*  */
/* Revision: 1.112     BY: SurenderSingh Nihalani DATE: 06/27/06 ECO: *P4TZ*  */
/* Revision: 1.113     BY: Munira Savai           DATE: 09/11/06  ECO: *P55G* */
/* Revision: 1.114     BY: Munira Savai           DATE: 09/14/06  ECO: *P561* */
/* Revision: 1.117     BY: Michael Yan            DATE: 03/18/07  ECO: *R0FB* */
/* Revision: 1.118     BY: Steve Nugent           DATE: 06/08/07  ECO: *R0H0* */
/* Revision: 1.119     BY: Devna Sahai            DATE: 06/18/07  ECO: *P5RG* */
/* Revision: 1.122     BY: Jean Miller            DATE: 03/21/07  ECO: *R0C5* */
/* Revision: 1.124     BY: Jean Miller            DATE: 11/09/07  ECO: *P608* */
/* Revision: 1.125     BY: Deepak Taneja          DATE: 01/16/08  ECO: *P6JQ* */
/* Revision: 1.126     BY: Antony LejoS           DATE: 05/16/08  ECO: *P6T9* */
/* Revision: 1.129     BY: Antony LejoS           DATE: 06/06/08  ECO: *P6V4* */
/* Revision: 1.132     BY: Julie Milligan         DATE: 07/08/08  ECO: *R0WT* */
/* Revision: 1.135     BY: Nan Zhang              DATE: 10/30/08  ECO: *R15P* */
/* Revision: 1.136     BY: Kunal Pandya           DATE: 11/07/08  ECO: *Q1TR* */
/* Revision: 1.137     BY: Ambrose Almeida        DATE: 11/18/08  ECO: *Q20G* */
/* Revision: 1.138     BY: Steve Nugent           DATE: 12/18/08  ECO: *R197* */
/* Revision: 1.139     BY: Mukesh Singh           DATE: 12/31/08  ECO: *Q24C* */
/* Revision: 1.140     BY: Jiang Wan              DATE: 02/09/09  ECO: *R1BY* */
/* Revision: 1.142     BY: Jiang Wan              DATE: 08/07/09  ECO: *R1N2* */
/* Revision: 1.143     BY: Ravi Swami             DATE: 08/21/09  ECO: *Q39D* */
/* Revision: 1.144     BY: Yizhou Mao             DATE: 09/01/09  ECO: *R1QF* */
/* Revision: 1.145     BY: Rajat Kulshreshtha     DATE: 10/29/09  ECO: *Q34B* */
/* Revision: 1.147     BY: Zhijun Guan            DATE: 11/17/09  ECO: *R1V9* */
/* Revision: 1.148     BY: Zhijun Guan            DATE: 01/15/10  ECO: *R1XF* */
/* Revision: 1.149     BY: Devna Sahai            DATE: 01/15/10  ECO: *R1TH* */
/* Revision: 1.150     BY: Avishek Chakraborty    DATE: 04/29/10  ECO: *Q3X0* */
/* Revision: 1.152     BY: Avishek Chakraborty    DATE: 05/19/10  ECO: *R20K* */
/* Revision: 1.153     BY: Avishek Chakraborty    DATE: 06/14/10  ECO: *Q3Z7* */
/* Revision: 1.154     BY: Yiqing Chen            DATE: 04/26/10  ECO: *R1Z0* */
/* Revision: 1.155     BY: Jean Miller            DATE: 08/03/10  ECO: *R24J* */
/* CYB    LAST MODIFIED: 02-JUN-2010    BY:  gbg *cy1011*                    */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 15-MAR-2013 BY: gbg *c1372*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/* CYB   LAST MODIFIED: 23-FEB-2018    BY: gbg *K10017c*                      */
/*-Revision End---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/*                                                                            */
 
/******************************************************************************/
/* THIS PROGRAM WAS CLONED TO kbporca.p 05/14/02, REMOVING UI.                */
/* CHANGES TO THIS PROGRAM MAY ALSO NEED TO BE APPLIED TO kbporca.p           */
/* CHANGES MADE IN THIS PROGRAM MAY ALSO HAVE TO BE MADE TO PORVISA.P         */
/******************************************************************************/
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
 
/* SEVERITY PREPROCESSOR CONSTANT DEFINITION INCLUDE FILE */
{us/px/pxmaint.i}
{us/px/pxphdef.i ppitxr}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/gp/gpldcons.i} /* CONSTANTS FOR LEGAL DOCUMENT */
 
{us/po/porcdef.i}
 
/* VARIABLE DEFINITION FOR GL CALENDAR VALIDATION */
{us/gp/gpglefdf.i}
 
/* DEFINITION FOR TT_SHIPPER_SCROLL TEMP TABLE*/
{us/po/porcsshp.i}
  
/* Update Restrictions Temp Table Definition */
{us/up/updaterestriction.i}
 
/* SHARED TEMP TABLES */
{us/ic/icshmtdf.i "new" }
{us/px/pxphdef.i lagenpro}  
{us/px/pxphdef.i paicxr}
{us/px/pxphdef.i pafunc}
{us/ap/apconsdf.i}          
 
{us/ca/caattr.i}
{us/ca/cattdef2.i}
{us/px/pxphdef.i caatdxr}
{us/px/pxphdef.i caisxr}
{us/px/pxphdef.i captdxr2}
{us/px/pxphdef.i carcxr}
{us/px/pxphdef.i caparaxr}

define temp-table tt_auto_pod_lot no-undo
   field tt_auto_pod_oid    as decimal
   field tt_auto_pod_lotser as character
   index tt_auto_lot_index
         tt_auto_pod_oid.

/* REORGANIZED VARIABLES */
 
/* PARAMETERS */
define input parameter p_int_ref_type   like lacd_internal_ref_type   no-undo.
define input parameter table for tt_auto_pod_lot.
define input-output parameter table for tt_shipper_scroll.
define input-output parameter table for tt_attr_pfvalue.
define output parameter manual_update as logical no-undo.
define input-output parameter shippernbr like abs_id no-undo.
define input-output parameter inv_mov    like im_inv_mov no-undo.

/* NEW SHARED VARIABLES, BUFFERS AND FRAMES */
define new shared variable conv_to_pod_um      like pod_um_conv.
define new shared variable line                like pod_line
                                               format ">>>"           no-undo.
define new shared variable lotserial_qty       like sr_qty            no-undo.
define new shared variable podtype             like pod_type.
define new shared variable rct_site            like pod_site.
define new shared variable total_lotserial_qty like pod_qty_chg.
define new shared variable total_received      like pod_qty_rcvd.
define new shared variable trans_um            like pt_um.
define new shared variable trans_conv          like sod_um_conv.
define new shared variable undo_all            like mfc_logical.
define new shared variable cline               as   character.
define new shared variable issue_or_receipt    as   character.
define new shared variable lotserial_control   as   character.
define new shared variable multi_entry like mfc_logical
   no-undo
   label "Multi Entry".
 
/* SHARED VARIABLES, BUFFERS AND FRAMES */
define shared variable h_wiplottrace_procs as   handle                no-undo.
define shared variable h_wiplottrace_funcs as   handle                no-undo.
define shared variable qopen               like pod_qty_rcvd
   label "Qty Open".
define shared variable vendlot             like tr_vend_lot           no-undo.
define shared variable fill-all            like mfc_logical           no-undo.
define shared frame b.
 
/* LOCAL VARIABLES, BUFFERS AND FRAMES */
define variable lotserials_req like mfc_logical                       no-undo.
define variable leave_loop     like mfc_logical initial no            no-undo.
define variable cancel_bo      like mfc_logical                       no-undo.
define variable chg_attr       like mfc_logical label "Chg Attribute" no-undo.
define variable cmmt_yn        like mfc_logical label "Comments"      no-undo.
define variable cont           like mfc_logical initial yes           no-undo.
define variable del-yn         like mfc_logical initial no            no-undo.
define variable due            like pod_due                           no-undo.
define variable err_flag       like mfc_logical                       no-undo.
define variable ln_stat        like mfc_logical                       no-undo.
define variable packing_qty    like pod_ps_chg                        no-undo.
define variable qty_left       like tr_qty_chg                        no-undo.
define variable receipt_um     like pod_rum                           no-undo.
define variable reset_um       like mfc_logical initial no            no-undo.
define variable serial_control like mfc_logical initial no            no-undo.
define variable shipqtychg     like pod_qty_chg
   column-label "Ship Qty"                                            no-undo.
define variable undo-taxes     like mfc_logical                       no-undo.
define variable undotran       like mfc_logical                       no-undo.
define variable yn             like mfc_logical                       no-undo.
define variable ponbr          like pod_nbr                           no-undo.
define variable poline         like pod_line                          no-undo.
define variable lotnext        like pod_lot_next                      no-undo.
define variable lotprcpt       like pod_lot_rcpt                      no-undo.
define variable newlot         like pod_lot_next                      no-undo.
define variable trans-ok       like mfc_logical                       no-undo.
define variable srlot          like sr_lotser                         no-undo.
define variable almr           like alm_pgm                           no-undo.
define variable errsite        like pod_site                          no-undo.
define variable errloc         like pod_loc                           no-undo.
define variable l_getlot       like mfc_logical                       no-undo.
 
define variable mess_desc      as   character                         no-undo.
define variable templot        as   character                         no-undo.
define variable csz            as   character format "X(38)"          no-undo.
define variable dwn            as   integer                           no-undo.
define variable first_down     as   integer initial 0                 no-undo.
define variable i              as   integer                           no-undo.
define variable msgnbr         as   integer                           no-undo.
define variable w-int1         as   integer                           no-undo.
define variable w-int2         as   integer                           no-undo.
define variable alm_recno      as   recid                             no-undo.
define variable filename       as   character                         no-undo.
define variable ii             as   integer                           no-undo.
define variable use_pod_um_conv as  logical                           no-undo.
define variable l_use_pod_um_conv like mfc_logical                    no-undo.
 
define variable to_site         like pod_site no-undo.
define variable from_site       like pod_site no-undo.
define variable gen_ship        as logical no-undo.
define variable v_lines_found   like mfc_logical no-undo.
define variable shipgrp         like sgid_grp no-undo.
define variable v_abs_recid     as recid no-undo.
 
define variable vQuantityReceived as decimal no-undo.
define variable vSiteId           as character no-undo.
define variable vLocation         as character no-undo.
define variable l_remove_srwkfl   like mfc_logical no-undo.
define variable l_flag            like mfc_logical no-undo.
define variable l_continue        like mfc_logical initial no  no-undo.
define variable l_scan            like mfc_logical initial yes no-undo.
define variable l_undo            like mfc_logical             no-undo.
define variable o_trflow_flg      as   logical     no-undo.
define variable l_multi_return    like mfc_logical no-undo.
define variable l_sr_wkfl_recid   as   recid                   no-undo.
 
define variable l_delete_sr_wkfl like mfc_logical no-undo.
define variable l_update_sr_wkfl like mfc_logical no-undo.
define variable l_error          like mfc_logical no-undo.
 
define variable l_ttype          as   character   initial "" no-undo.
define variable l_trans_type     as   character   initial "" no-undo.
define variable l_multi_ent_pass like mfc_logical initial no no-undo.
define variable l_exit_yn        like mfc_logical initial no no-undo.
define variable l_route          like mfc_logical initial no no-undo.
define variable l_total          like sr_qty                 no-undo.
define variable l_conv_to_pod_um like pod_um_conv            no-undo.
define variable l_trans_conv     like sod_um_conv            no-undo.
define variable l_prompt         as   character              no-undo.
/* Global Shipping: Legal Document Variables */
define variable c_form_code      like df_form_code    no-undo.
define variable c_ld_form_code   like df_ld_form_code no-undo.
define variable c_ld_nbr         like lgd_nbr         no-undo.
define variable shipnbr          like abs_id          no-undo.
define variable p_inv_mov        like im_inv_mov      no-undo.
define variable lgdnbr           like lgd_nbr         no-undo.
define variable c_shipfrom       like lgd_shipfrom    no-undo.
define variable c_shipto         like lgd_ship        no-undo.
define variable v_imflow         like im_flow         no-undo.
define variable allowToIssue     as   logical         no-undo.
define variable j                as   integer         no-undo.
define variable validationPass   as character format "x(12)"  no-undo.
define variable l_cont           as   logical         no-undo.
define variable toWarning        as   logical         no-undo.
define variable looseQty         like sr_qty          no-undo.
define variable l_next_prompt    as   character       no-undo.
define variable l_process_consign_now        as logical   no-undo.
define variable l_using_supplier_consignment as logical   no-undo.
define variable l_non_cons_qty               as decimal   no-undo.
define variable l_validateInv                as logical   no-undo.
define variable l_validateCum                as logical   no-undo.
define variable l_lot_ser                    as character no-undo.

define variable warning-message1 as character no-undo format 'x(74)'.
define variable warning-message2 as character no-undo format 'x(74)'.
define variable warning-message3 as character no-undo format 'x(74)'.
define variable warning-message4 as character no-undo format 'x(74)'.
define variable lv_auto_ers as logical             no-undo.
define variable l_autolot   as logical initial no  no-undo.
define variable l_newlot    as character           no-undo.
assign warning-message1 = 'The ERS processor will run when the legal document is confirmed.'
       warning-message2 = 'DO NOT CLOSE tab or CANCEL processing as this WILL cause unexpected '
	   warning-message3 = 'results.'
	   warning-message4 = ''.
	   
define frame warning-frame
warning-message1 colon 3
warning-message2 colon 3
warning-message3 colon 3
warning-message4 colon 3
with width 80 no-labels.  

define variable isSerialized as logical no-undo.
 
/* TEMP-TABLE t_sr_wkfl STORES THE LIST OF DEFAULT sr_wkfl      */
/* RECORDS (NOT CREATED BY THE USER)                            */
define temp-table t_sr_wkfl no-undo
   field t_sr_userid like sr_userid
   field t_sr_lineid like sr_lineid
   field t_sr_site   like sr_site
   field t_sr_loc    like sr_loc
   field t_sr_lotser like sr_lotser
   field t_sr_ref    like sr_ref
   field t_sr_qty    like sr_qty
index t_sr_lineid is unique
   t_sr_userid
   t_sr_lineid.
 
define variable cOldInventoryStatus as character no-undo initial "".
define variable cInventoryStatus    as character no-undo initial "".
define variable l_pt_lot_ser        as character no-undo.
define variable l_pt_auto_lot       as character no-undo.

/*cy1011*/ def var desc1   like pt_desc1.



/*WORKFILE FOR POD RECEIPT ATTRIBUTES*/
define shared workfile attr_wkfl no-undo
   field chg_line     like sr_lineid
   field chg_assay    like tr_assay
   field chg_grade    like tr_grade
   field chg_expire   like tr_expire
   field chg_status   like tr_status
   field assay_actv   as   logical
   field grade_actv   as   logical
   field expire_actv  as   logical
   field status_actv  as   logical.
 
/* TEMP-TABLE ADDED TO COLLECT THE LINES WHICH ARE SHIPPED, */
/* WHICH CAN BE USED WHILE CALCULATING THE TAXES            */
define temp-table tt_po_tax no-undo
   field tt_po     like po_nbr
   field tt_line   like pod_line
   index tt_po_line_indx tt_po tt_line.

define temp-table tt_po_lineqty no-undo
   field tt_part    like pt_part
   field tt_site    like pt_site
   field tt_loc     like pt_loc
   field tt_tpoline like pod_line
   field tt_qty     like mrp_qty
   index tt_index_part tt_part
         tt_site
         tt_loc.

define output parameter table for tt_po_tax.
define buffer b_pod_det for pod_det.

{us/mf/mfaimfg.i}  /* Common API constants and variables */
 
{us/po/popoit01.i} /* Define API purchase order temp tables  */
{us/mf/mfctit01.i} /* Define API transaction comments temp tables */
 
if c-application-mode = "API" then do:
 
   /* Get handle of API controller */
   {us/bbi/gprun.i ""gpaigh.p"" "(output ApiMethodHandle,
                           output ApiProgramName,
                           output ApiMethodName,
                           output ApiContextString)"}
 
   /* Get current purchase order transaction detail record */
   run getPurchaseOrderTransDet in ApiMethodHandle
      (output table ttPurchaseOrderTransDet).
     /* Get purchase order transaction comment temp-table */
   run getPurchaseOrderTransDetCmt in ApiMethodHandle
      (output table ttPurchaseOrderTransDetCmt).

   /* Get purchase order transaction detail attributes */
   run getDetailAttribute in ApiMethodHandle
      (output table ttDetailAttribute).


end. /* IF c-application-mode = "API" */
 
assign issue_or_receipt = getTermLabel("RECEIPT",8).
 
form with frame c 5 down width 80.
 
{us/wl/wlfnc.i} /*FUNCTION FORWARD DECLARATIONS*/
{us/wl/wlcon.i}
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame c:handle).
 
/*cy1011* start deleted code >>>>
form
   pod_line
   pod_part
   pt_um
   qopen
   pod_um
   shipqtychg
   pod_rum
   pod_project
   pod_due_date
   pod_type
with frame cship 5 down width 80.
*cy1011* end deleted code <<<<<<<<< */

/*cy1011* start added code */
form
   pod_line
   pod_part     format "x(10)"  label "Itm Nbr"
   desc1        format "x(20)" label "Description"
   pt_um
   qopen        format "->>,>>9.9<<<"
   pod_um
   shipqtychg   format "->>,>>9.9<<<" 
   pod_rum
/*cy1011*   pod_project */
   pod_due_date
   pod_type
with frame cship 5 down width 80.
/*cy1011* end   added code */
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame cship:handle).

form
   po_nbr         colon 12   label "Order"
   po_vend
   po_stat
   ps_nbr         format "x(12)" to 78
with frame b side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).
 
form with frame e down width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame e:handle).
 
form
   line           colon 15
   receipt_um     colon 36
   site           colon 54
   location       colon 68 label "Loc"
   lotserial_qty  colon 15
   wolot          colon 36 label "ID"
   lotserial      colon 54 label "Lot/Ser"
   packing_qty    colon 15 label "Packing Qty"
   woop           colon 36 label "WO Op"
   lotref         colon 54
   cancel_bo      colon 15 label "Cancel B/O"
   pod__qad04[1]  colon 54 label "Supplier Lot" format "x(22)"
   pod_part       colon 15 /*7.0*/
   multi_entry    colon 54
   chg_attr       colon 73
   pod_vpart
   colon 15
   cmmt_yn        colon 54 label "Cmmts"
with frame d side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).
 
subscribe to "itemAttributeUIPrompt" anywhere.

if is_wiplottrace_enabled() then
   run init_poline_bkfl_input_output.

/* DETERMINE IF SUPPLIER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ""enable_supplier_consignment"",
     input 11,
     input ""ADG"",
     input ""cns_ctrl"",
     output l_using_supplier_consignment)"}
 
/*DELETE SUBSHIPPER WORK TEMP TABLE*/
empty temp-table tt_shipper_scroll no-error.
 
for first poc_ctrl where poc_domain = global_domain
no-lock: end.
ln_stat = if available poc_ctrl and poc_ln_stat = "x" then yes else no.
 
find first mfc_ctrl where mfc_domain = global_domain
				 and mfc_field = 'lv_ers_auto_neg_po'
no-lock no-error.

if available mfc_ctrl then assign lv_auto_ers = mfc_logical.
else assign lv_auto_ers = no. 
 
for first clc_ctrl where clc_domain = global_domain
no-lock: end.
 
if not available clc_ctrl then do:
   {us/bbi/gprun.i ""gpclccrt.p""}
   for first clc_ctrl where clc_domain = global_domain
   no-lock: end.
end. /* IF NOT AVAILABLE CLC_CTRL */
 
for first po_mstr where recid(po_mstr) = po_recno
no-lock: end.
 
assign
   line           = 1
   proceed        = no
   l_multi_return = no.
 
empty temp-table tt_po_lineqty.
subscribe to "getPrompt" anywhere.
subscribe to "setPrompt" anywhere.
subscribe to "doInvCheck" anywhere.
subscribe to "doCumOrderCheck" anywhere.

/* Clear shipper line item temp table */
{us/bbi/gprun.i  ""icshmt1c.p"" }

edit-loop:
 
repeat on endkey undo, leave:
   lineloop:
   repeat:
 
      if c-application-mode = "API" and retry
         then return error return-value.
 
      if c-application-mode <> "API" then
         display po_nbr po_vend po_stat ps_nbr with frame b.
 
         clear frame c all no-pause.
         clear frame d all no-pause.
 
         clear frame cship all no-pause.
         clear frame e all no-pause.
 
      if c-application-mode <> "API" then
         if porec then
            view frame c.
         else
            view frame cship.
      if c-application-mode <> "API" then
         view frame d.
 
 
      for each pod_det no-lock
         where pod_domain = global_domain
           and pod_nbr = po_nbr
           and pod_line >= line
           and pod_status <> "c"
           and pod_status <> "x"
      use-index pod_nbrln by pod_line:
 
         if porec then do:
            if pod_rma_type <> "I"  and
               pod_rma_type <> ""   then next.
         end. /* IF POREC */
         else
            if  pod_rma_type <> "O" then next.
 
 
         for first si_mstr where si_domain = global_domain
            and si_site = pod_site
         no-lock: end.
 
         if available si_mstr and si_db = global_db then do:
 
            for first pt_mstr where pt_domain = global_domain
               and pt_part = pod_part
            no-lock: end.
 
            if porec then do:
               {us/px/pxrun.i &PROC='getOpenQuantity' &PROGRAM='porcxr1.p'
                  &PARAM="(input pod_qty_ord,
                                 input pod_qty_rcvd,
                                 output qopen)"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
            end.
            else
               assign
                  qopen  =  - (pod_qty_ord - pod_qty_rcvd).
 
            {us/px/pxrun.i &PROC='getScheduleOpenQuantity' &PROGRAM='porcxr1.p'
               &PARAM="(buffer pod_det,
                              input eff_date,
                              input-output qopen)"
               &NOAPPERROR=true
               &CATCHERROR=true}
 
            /* Display correct label for RTS shipments. */
            assign
               shipqtychg = pod_qty_chg.
 
/*cy1011*/  if available pt_mstr then desc1 = pt_desc1.
/*cy1011*/  else desc1 = "".

            if porec then do:
/*cy1011* start deleted code >>>>
               if c-application-mode <> "API" then
                  display
                     pod_line
                     pod_part
                     pt_um when (available pt_mstr)
                     qopen
                     pod_um
                     pod_qty_chg
                     pod_rum
                     pod_project
                     pod_due_date
                     pod_type
                  with frame c.
 
               if frame-line(c) = frame-down(c) then leave.
               if c-application-mode <> "API" then
                  down 1 with frame c.
*cy1011* end deleted code <<<<<<<< */

/*d2101* start added code >>>>   */
               if c-application-mode <> "API" then
                  display
                     pod_line
                     pod_part format "x(10)" label "Itm Nbr"
                     desc1 format "x(20)" label "Description"
                     pt_um when (available pt_mstr)
                     qopen  format "->>,>>9.99<<<"
                     pod_um
                     pod_qty_chg  format "->>,>>9.99<<<"
                     pod_rum
                     pod_due_date
                     pod_type
                  with frame c.
/*k10017c*/    if frame-line(c) = frame-down(c) then leave.
/*k10017c*/    if c-application-mode <> "API" then
/*k10017c*/       down 1 with frame c.
/*d2101* end   added code <<<<<  */

            end.  /* IF POREC */
            else do:
/*cy1011* start deleted code >>>>>>>>>
               if c-application-mode <> "API" then
                  display
                     pod_line
                     pod_part
                     pt_um when (available pt_mstr)
                     qopen
                     pod_um
                     shipqtychg
                     pod_rum
                     pod_project
                     pod_due_date
                     pod_type
                  with frame cship.
*cy1011* end deleted code <<<<<< */
/*cy1011* start added code >>>>>> */
/*d2101* start added code >>>>   */
               if c-application-mode <> "API" then
                  display
                     pod_line
                     pod_part
		     desc1
                     pt_um when (available pt_mstr)
                     qopen
                     pod_um
                     shipqtychg
                     pod_rum
                     pod_due_date
                     pod_type
                  with frame cship.
/*d2101* end   added code <<<<<  */
/*cy1011* end added code <<<<<< */
 
               if frame-line(cship) = frame-down(cship) then leave.
               if c-application-mode <> "API" then
                  down 1 with frame cship.
            end. /* ELSE DO */
 
         end.  /* IF AVAILABLE SI_MSTR */
      end.  /* FOR EACH POD_DET */
 
      line = 0.
 
      setline:
      do transaction on error undo, retry:
         if c-application-mode = "API" and retry
            then return error return-value.
 
         if c-application-mode = "API" then
            find next ttPurchaseOrderTransDet
               where ttPurchaseOrderTransDet.nbr = po_nbr
            no-lock no-error.
 
         if c-application-mode = "API" and
            not available ttPurchaseOrderTransDet then leave.
 
 
         if c-application-mode <> "API" then
         update line with frame d
            editing:
            nppoddet:
            repeat:
               /* FIND NEXT/PREVIOUS RECORD */
               {us/mf/mfnp01.i
                  pod_det
                  line
                  pod_line
                  pod_nbr
                   " pod_det.pod_domain = global_domain and po_nbr "
                  pod_nbrln}
 
               if recno <> ? then do:
                  line = pod_line.
 
                  for first si_mstr where si_domain = global_domain
                     and si_site = pod_site
                  no-lock: end.
 
                  if not available si_mstr
                     or (available si_mstr and si_db <> global_db)
                  then
                     next nppoddet.
 
                  run display-detail.
 
                  /* Do not display pt_desc on help keys from Desktop */
                  if not ( {us/bbi/gpiswrap.i} and keyfunction(lastkey) = "help" ) then
                  run get_pt_description
                     (input pod_part,
                      input pod_desc).
 
               end. /* IF RECNO <> ? */
               leave.
            end.  /* NPPODDET: REPEAT: */
 
            if keyfunction(lastkey) = "end-error" then
            undo lineloop, leave.
 
         end. /* EDITING */
 
         if c-application-mode = "API" then
            line = ttPurchaseOrderTransDet.line.
 
         if (line = 0) then do:         /* NO PO LINE SELECTED */
            leave lineloop.
         end.     /* IF LINE = 0 */
 
         assign
            vendlot = ""
            lotnext = ""
            newlot  = "".
 
         {us/px/pxrun.i &PROC='processRead' &PROGRAM='popoxr1.p'
            &PARAM="(input po_nbr,
                     input line,
                     buffer pod_det,
                     input {&LOCK_FLAG},
                     input {&WAIT_FLAG})"
            &NOAPPERROR=true
            &CATCHERROR=true}
 
         if return-value = {&SUCCESS-RESULT} then do:
 
            /* Maintain additional legal document data if applicable */
            {us/bbi/gprun.i ""gpckln.p"" "(input lgdkey, 
                                           input po_nbr,
                                           input pod_line)"}
            if return-value <> {&SUCCESS-RESULT}
            then do:
               if batchrun
               then
                  undo edit-loop, retry edit-loop.
               else
                  undo setline, retry.
            end. /* IF return-value <> {&SUCCESS-RESULT} */

            run get_pt_description
               (input pod_part,
                input pod_desc).
 
            if pod_sched and
               pod_curr_rlse_id [1] = ""
            then do:
               /* NO ACTIVE SCHEDULE EXISTS */
               {us/bbi/pxmsg.i &MSGNUM=2362 &ERRORLEVEL=2}
            end. /* IF pod_sched ... */
 
            {us/px/pxrun.i &PROC='validateSiteDatabase' &PROGRAM='porcxr1.p'
               &PARAM="(input pod_site)"
               &NOAPPERROR=true
               &CATCHERROR=true}
 
            if return-value <> {&SUCCESS-RESULT}
            then do:
               if batchrun
               then
                  undo edit-loop, retry edit-loop.
               else
                  undo setline, retry.
            end. /* IF return-value <> {&SUCCESS-RESULT} */
 
            /* PONBR AND POLINE NOW ASSIGNED WITH POD_NBR AND POD_LINE        */
            /* IRRESPECTIVE OF TYPE OF PURCHASE ORDER                         */
 
            assign
               ponbr  = pod_nbr
               poline = pod_line.
 
            if pod_consignment
            then
               assign
                  l_ttype      = "CN-RCT"
                  l_trans_type = transtype
                  transtype    = "CN-RCT".
            else
               l_ttype = "RCT-PO".
         end. /* IF AVAILABLE POD_DET */
 
         if not available pod_det then do:
            /* LINE ITEM DOES NOT EXIST */
             run displayMessage (input 45,
                                 input {&APP-ERROR-RESULT}).
 
            if batchrun
            then
               undo edit-loop, retry edit-loop.
            else
               undo setline, retry.
 
         end. /* IF NOT AVAILABLE POD_DET */
 
         /* check if 'Fiscal Consirm Required' flag is yes and
         *  pod_ers_opt is either '3' or '0'. If not, then error
         */
         if poc_ctrl.poc_fiscal_confirm and pod_ers_opt <> 3 and
            pod_ers_opt <> 0 then do:

            hide message no-pause.
            /* Line Invalid ERS option */
            {us/bbi/pxmsg.i &MSGNUM=2303 &ERRORLEVEL=3}
            undo setline, retry.

         end. /* if poc_ctrl.poc_fiscal_confirm and pod_ers_opt <> 3 */

         /* PICK UP CURRENTLY EFFECTIVE CUM ORDER*/
         {us/bbi/gprun.i ""poporca5.p""
            "(input pod_nbr,
                    input pod_line,
                    input eff_date)"}
 
         if (porec               and
            pod_rma_type <> "I"  and
            pod_rma_type <> "")  or
            (not porec           and
            pod_rma_type <> "O")
         then do:
 
            /* LINE ITEM DOES NOT EXIST */
             run displayMessage (input 45,
                                 input {&APP-ERROR-RESULT}).
            if batchrun then
               undo edit-loop, retry edit-loop.
            else
               undo setline, retry.
 
         end. /* IF POREC */
 
         {us/px/pxrun.i &PROC='validateStatusId' &PROGRAM='porcxr1.p'
            &PARAM="(input pod_status)"
            &NOAPPERROR=true
            &CATCHERROR=true}
 
         if return-value <> {&SUCCESS-RESULT}
         then do:
            if batchrun
            then
               undo edit-loop, retry edit-loop.
            else
               undo setline, retry.
         end. /* IF return-value <> {&SUCCESS-RESULT} */
 
         /*Validate that the receipt date is within the effectove date range*/
         /*of the scheduled order.                                          */
         if po_sched then do:
            {us/px/pxrun.i &PROC='validateSchedOrderEffective' &PROGRAM='popoxr1.p'
               &PARAM="(input po_eff_strt,
                            input po_eff_to,
                            input pod_start_eff[1],
                            input pod_end_eff[1],
                            input eff_date)"
               &NOAPPERROR=true
               &CATCHERROR=true}
 
         if return-value <> {&SUCCESS-RESULT} then do:
            if batchrun
            then
               undo edit-loop, retry edit-loop.
            else
               undo setline, retry.
            end. /* IF return-value <> {&SUCCESS-RESULT} */
         end. /*IF po_sched*/
 
         cline = string (line).
 
         {us/px/pxrun.i &PROC='readFirstDetailForLine' &PROGRAM='porcxr2.p'
            &PARAM="(input integer(cline),
                           buffer sr_wkfl,
                           input {&NO_LOCK_FLAG},
                           input {&NO_WAIT_FLAG})"
            &NOAPPERROR=true
            &CATCHERROR=true}
 
         if return-value = {&SUCCESS-RESULT} then newlot = sr_lotser.
 
         pod_recno = recid (pod_det).
 
         {us/px/pxrun.i &PROC='isItemSerialized'
               &PROGRAM='pafunc.p'
               &HANDLE = ph_pafunc
               &PARAM = "(input pod_part,
                          output isSerialized)"
               &NOAPPERROR = true
               &CATCHERROR = true}
         if isSerialized then do:
            /* Serialized Item is not allowed */
            {us/bbi/pxmsg.i &MSGNUM=13694 &ERRORLEVEL=3}
            if batchrun
            then
               undo edit-loop, retry edit-loop.
            else
               undo setline, retry.         
         end.

         if c-application-mode = "API" then do:
                 {us/mf/mfaiset.i newlot ttPurchaseOrderTransDet.LotSer}.
         end.
         /* tt_auto_pod_lot IS CREATED WHEN AUTO LOT NUMBERS ARE USED */
         for first tt_auto_pod_lot
            where  tt_auto_pod_oid = oid_pod_det
         no-lock:
            newlot = tt_auto_pod_lotser.
         end. /* FOR FIRST tt_pod_lot */

         lotserial = newlot.
 
      end. /*  DO ON ERROR UNDO, RETRY */ /* TRANSACTION */
 
      assign
         packing_qty = pod_ps_chg
         cancel_bo   = can-find(first poc_ctrl
                                where poc_domain = global_domain
                                  and poc_ln_stat = "x")
         wolot       = pod_wo_lot
         woop        = pod_op
         lotserial   = newlot
         lotnext     = newlot
         receipt_um  = pod_rum.
 
      if c-application-mode <> "API" then
         display
            line
            packing_qty
            cancel_bo
            pod_part
            pod_vpart
            receipt_um
            wolot
            lotnext @ lotserial
            woop
            pod_site @ site
         with frame d.
 
      for first si_mstr where si_domain = global_domain
         and si_site = pod_site
      no-lock:
 
         {us/px/pxrun.i &PROC='validateSiteSecurity' &PROGRAM='icsixr.p'
            &PARAM="(input si_site,
                           input """")"
            &NOAPPERROR=true
            &CATCHERROR=true}
 
         if return-value <> {&SUCCESS-RESULT} then do:
            if c-application-mode <> "API" then
               pause.
            next-prompt line with frame d.
            undo lineloop, retry.
         end. /* IF return-value <> {&SUCCESS-RESULT} */
 
      end. /* FOR FIRST si_mstr */
 
      /* Initialize input variables, check for open vouchers. */
      pod_recno = recid(pod_det).
 
      {us/bbi/gprun.i ""poporca3.p""}
 
      do transaction :
 
         locloop:
         do on error undo, retry:
 
            if c-application-mode = "API" and retry
               then return error return-value.
 
            ststatus = stline[3].
            status input ststatus.
            l_next_prompt = "".
 
            {us/px/pxrun.i &PROC='readFirstDetailForLine' &PROGRAM='porcxr2.p'
               &PARAM="(input integer(cline),
                           buffer sr_wkfl,
                           input {&NO_LOCK_FLAG},
                           input {&NO_WAIT_FLAG})"
               &NOAPPERROR=true
               &CATCHERROR=true}
 
            assign
               cmmt_yn = no
               chg_attr = no.
 
            {us/px/pxrun.i &PROC='processRead' &PROGRAM='ppitxr.p'
                     &PARAM="(input pod_part,
                                 buffer pt_mstr,
                                 input {&NO_LOCK_FLAG},
                                 input {&NO_WAIT_FLAG})"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
 
            lotprcpt  = pod_lot_rcpt.
 
            assign
               i                = 0
               multi_entry      = no
               l_multi_ent_pass = no.
 
            for each sr_wkfl where sr_domain = global_domain
               and sr_userid = SessionUniqueID
               and sr_lineid = cline
            no-lock:
               i = i + 1.
               if i > 1 then do:
                  multi_entry = yes.
                  leave.
               end. /* IF I > 1  */
            end. /*  FOR FIRST SR_WKFL */
 
            if pod__qad04[1] = ? then
               assign pod__qad04[1] = "".
 
            if c-application-mode <> "API" then
               display
                  lotserial_qty
                  packing_qty
                  cancel_bo
                  receipt_um
                  wolot
                  woop
                  site
                  location
                  lotserial
                  lotref
                  pod__qad04[1]
                  multi_entry
                  chg_attr
                  cmmt_yn
               with frame d.
 
            l_getlot = yes.
            l_autolot = no.
            if available pt_mstr
               and (porec = yes) and
               (is-return = no) then
            do:
               {us/px/pxrun.i &PROC  = 'clearGetFieldDefaultTempRecord' 
                              &PROGRAM = 'ppitxr.p'
                              &HANDLE=ph_ppitxr
                              &PARAM = "(input  pt_part,
                                         input  site)"
                              &NOAPPERROR = true
                              &CATCHERROR = true}

               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &HANDLE = ph_ppitxr
                        &PARAM = "(input  pt_part,
                                   input  site,
                                   input ""pt_auto_lot"",
                                   output l_pt_auto_lot)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
 
               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &HANDLE = ph_ppitxr
                        &PARAM = "(input  pt_part,
                                   input  site,
                                   input ""pt_lot_ser"",
                                   output l_pt_lot_ser)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
 
               if ({us/px/pxfunct.i &FUNCTION='isAutoLotEnabled' &PROGRAM='clalxr.p'
                           &PARAM="input l_pt_lot_ser,
                                   input logical(l_pt_auto_lot),
                                   input pt_lot_grp,
                                   input pod_type,
                                   input yes"})
               then 
                  assign
                     l_getlot  = no
                     l_autolot = yes.
 
            end. /* IF AVAILABLE PT_MSTR */
 
            for last wr_route where wr_domain = global_domain
               and wr_lot = pod_wo_lot
            no-lock: end.
 
            if available wr_route
               and (pod_type       = "s"
                    and wr_op      = pod_op )
            then
               l_route = yes.
            else
               l_route = no.
              
            if lotserial_qty < 0 
               and l_autolot
            then 
               l_getlot = yes.  
             
                  
            if     {us/wh/whgpwhon.i}
               and {us/bbi/gpiswrap.i}
            then do:
               if c-application-mode <> "API" then
                  set
                     lotserial_qty
                     packing_qty
                     cancel_bo
                     receipt_um
                     wolot
                     woop
                     site          when (not multi_entry
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     location      when (not multi_entry
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     lotserial     when ((not multi_entry) and l_getlot
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     lotref        when (not multi_entry
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     pod__qad04[1] when (not (is_wiplottrace_enabled() and pod_type = "s"))
                  with frame d
                  editing:
                     assign
                        global_site = input site
                        global_loc  = input location
                        global_lot  = input lotserial.
 
                     readkey.
                     apply lastkey.
                  end. /* EDITING: */
                  set
                     multi_entry   when (not multi_entry
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     chg_attr      when (porec
                                   and (pod_type = ""  or l_route))
                     cmmt_yn
                  with frame d.
            end. /* IF {us/wh/whgpwhon.i} */
            else
               if c-application-mode <> "API"
               then do:
                  set
                     lotserial_qty
                     packing_qty
                     cancel_bo
                     receipt_um
                     wolot
                     woop
                     site          when (not multi_entry
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     location      when (not multi_entry
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     lotserial     when ((not multi_entry) and l_getlot
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     lotref        when (not multi_entry
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     pod__qad04[1] when (not (is_wiplottrace_enabled() and pod_type = "s"))
                     multi_entry   when (not multi_entry
                                   and not (is_wiplottrace_enabled() and pod_type = "s"))
                     chg_attr      when (porec
                                   and (pod_type = ""  or l_route))
                     cmmt_yn
                  with frame d
                  editing:
                     assign
                        global_site = input site
                        global_loc  = input location
                        global_lot  = input lotserial.
 
                     readkey.
                     apply lastkey.
                  end. /* EDITING: */
      
                  if lotserial_qty >= 0
                     and l_autolot
                  then do:
                     lotserial   = newlot.
                     display lotserial with frame d.
                  end. /* IF lotserial_qty >= 0 AND .. */
               end. /* IF c-application-mode <> "API" */
               
            /* CREATE THE TEMP-TABLE FOR COLLECTING THE LINES EDITED, */
            /* TO BE USED IN RECALCULATING THE TAXES                  */
            for first tt_po_tax
               where tt_po   = pod_nbr
               and   tt_line = pod_line
            no-lock: end.
 
            if not available tt_po_tax
            then do:
               create tt_po_tax.
               assign tt_po   = pod_nbr
                      tt_line = pod_line.
            end. /* IF NOT AVAILABLE tt_po_tax */
 
            if c-application-mode = "API" then do:
 
               assign
                  {us/mf/mfaiset.i packing_qty ttPurchaseOrderTransDet.psChg}
                  {us/mf/mfaiset.i cancel_bo   ttPurchaseOrderTransDet.cancelBO}
                  {us/mf/mfaiset.i receipt_um  ttPurchaseOrderTransDet.rum}
                  {us/mf/mfaiset.i wolot       ttPurchaseOrderTransDet.woLot}
                  {us/mf/mfaiset.i woop        ttPurchaseOrderTransDet.op}
                  {us/mf/mfaiset.i site        ttPurchaseOrderTransDet.site}
                  cmmt_yn     = yes.
               if pod_type <> "s" then 
                  multi_entry = yes.
               else 
                  assign
                     {us/mf/mfaiset.i lotserial_qty ttPurchaseOrderTransDet.qty}.
               if ttPurchaseOrderTransDet.assay      = ?
                  and ttPurchaseOrderTransDet.assayLog   = ?
                  and ttPurchaseOrderTransDet.grade      = ?
                  and ttPurchaseOrderTransDet.gradeLog   = ?
                  and ttPurchaseOrderTransDet.expire     = ?
                  and ttPurchaseOrderTransDet.expireLog  = ?
                  and ttPurchaseOrderTransDet.rctstat    = ?
                  and ttPurchaseOrderTransDet.rctstatLog = ?
               then
                  chg_attr    = no.
               else
                  chg_attr    = yes.
            end.

            if pod_type   = "S"
               and pod_fsm_type  = ""
            then
               l_validateInv = no.
            else
               l_validateInv = yes.
  
            l_validateCum = no.

            {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                     &PARAM = "(input  pod_part,
                                input  pod_site,
                                input ""pt_lot_ser"",
                                output l_lot_ser)"
                     &NOAPPERROR = true
                     &CATCHERROR = true
            }

            if not l_validateInv
               and l_lot_ser <> "L"
               and l_lot_ser <> "S"
            then do:
               for first wo_mstr
                  where wo_domain = global_domain
                  and   wo_lot    = pod_wo_lot
                  and   wo_type   = "C"
               no-lock:
                  for first ro_det
                     where ro_domain    = global_domain
                     and   ro_routing   = (if wo_routing <> ""
                                           then
                                              wo_routing
                                           else
                                              wo_part )
                     and   ro_op        = pod_op
                     and  (ro_start    <= wo_rel_date
                        or ro_start     = ?)
                     and  (ro_end      >= wo_rel_date
                        or ro_end       = ?)
                  no-lock:
                     if ro_det.ro_mv_nxt_op = yes
                     then
                        l_validateCum = yes.
                  end. /* FOR FIRST ro_det */
                  if not available ro_det
                     or (available ro_det
                            and ro_det.ro_mv_nxt_op = yes)
                  then do:
                     for last wr_route
                        where wr_domain    = global_domain
                        and   wr_lot       = pod_wo_lot
                        and   wr_mv_nxt_op = yes
                     no-lock:
                        if wr_op = pod_op
                        then
                           l_validateCum = yes.
                        else
                           l_validateCum = no.
                     end. /* FOR LAST wr_route */
                  end. /* IF NOT AVAILABLE ro_det OR ... */
               end. /* FOR FIRST wo_mstr */
            end. /* IF NOT l_validateInv AND (l_lot_ser OR ... */

            {us/px/pxrun.i &PROC='getUMConversionToPOLine' &PROGRAM='porcxr1.p'
               &PARAM="(input receipt_um,
                           buffer pod_det,
                           output conv_to_pod_um,
                           output use_pod_um_conv)"
               &NOAPPERROR=true
               &CATCHERROR=true}
 
            if return-value <> {&SUCCESS-RESULT} then do:
               next-prompt receipt_um with frame d.
               undo, retry.
            end. /* IF CONV_TO_POD_UM = ? */
 
            if     pod_consignment
               and pod_site <> site
            then do:
               /* CANNOT RECEIVE CONSIGNED ITEM INTO A SITE  OTHER THAN */
               /* PO SITE                                               */
               {us/bbi/pxmsg.i &MSGNUM=11169 &ERRORLEVEL=3 &FIELDNAME=""ttPurchaseOrderTransDet.site""}
               next-prompt site with frame d.
               undo, retry.
            end. /* IF  pod_consignment */

            if      {us/wh/whgpwhon.i}
               and   pod_site <> site
            then do:
               /* Receiving site is different from PO site. */
               /* Please check */
               {us/bbi/pxmsg.i &MSGNUM=12706 &ERRORLEVEL=2 &PAUSEAFTER = TRUE}
            end. /* IF {us/wh/whgpwhon.i} and  pod_site <> site */
 
            {us/px/pxrun.i &PROC='validateSiteSecurity' &PROGRAM='icsixr.p'
               &PARAM="(input (input site),
                           input ? )"
               &NOAPPERROR=true
               &CATCHERROR=true}
 
            if return-value <> {&SUCCESS-RESULT} then do:
               next-prompt site with frame d.
               undo, retry.
            end.
 
            {us/px/pxrun.i &PROC='processRead' &PROGRAM='icsixr.p'
               &PARAM="(input  site,
                           buffer si_mstr,
                           input  {&NO_LOCK_FLAG},
                           input  {&NO_WAIT_FLAG})"
               &NOAPPERROR=true
               &CATCHERROR=true}
 
            /* VERIFY OPEN GL PERIOD FOR LINE ITEM SITE/ENTITY */
            if available si_mstr then do:
               if pod_site <> site
               then 
                  {us/px/pxrun.i &PROC='validateDateInGLPeriod' &PROGRAM='glglxr.p'
                           &PARAM="(input pod_site,
                                    input ""IC"",
                                    input eff_date)"
                           &NOAPPERROR=true
                           &CATCHERROR=true}
                              
               if return-value = {&SUCCESS-RESULT}
               then
                  {us/px/pxrun.i &PROC='validateDateInGLPeriod' &PROGRAM='glglxr.p'
                          &PARAM="(input site,
                                   input ""IC"",
                                   input eff_date)"
                          &NOAPPERROR=true
                          &CATCHERROR=true}         
            end. /* IF AVAILABLE si_mstr */
 
            if return-value <> {&SUCCESS-RESULT} then do:
               if not available si_mstr
               then
                  /* SITE DOES NOT EXIST */
                  run displayMessage (input 708,
                                      input 3).
 
               next-prompt site with frame d.
               undo locloop, retry.
            end.
 
            if available pt_mstr then do:
 
               /* IN CASE OF RTS RECEIPTS FOR SERIALIZED ITEMS, SKIP THE     */
               /* VALIDATION FOR SERIAL NUMBER USING THE PROCEDURE           */
               /* validateLotSerialUsage WHEN THE SHIPMENT AND RECEIPT FOR   */
               /* THE SERIALIZED ITEM ARE PERFORMED ON THE SAME RTS WITH THE */
               /* SAME SERIAL NUMBER.                                        */
 
               l_flag = no.
 
               if pod_fsm_type = "RTS-RCT"
               then do:
 
                  for first rmd_det where rmd_domain = global_domain
                     and rmd_nbr = pod_nbr
                     and rmd_part    = pod_part
                     and rmd_prefix  = "V"
                     and rmd_type    = "O"
                     and rmd_qty_acp > 0
                  no-lock:
 
                     if rmd_ser <> lotserial
                     then do:
 
                        for first tr_hist where tr_domain = global_domain
                           and tr_serial  = lotserial
                           and tr_nbr     = pod_nbr
                           and tr_part    = pod_part
                           and tr_program = "fsrtvis.p"
                        no-lock: end.
 
                        if not available tr_hist then
                           l_flag = yes.
 
                     end. /* IF rmd_ser <> lotserial */
 
                  end. /* FOR FIRST rmd_det */
 
                  if not available rmd_det then
                     l_flag = yes.
 
               end. /* IF pod_fsm_type = "RTS-RCT" */
 
               else
                  /* FOR ALL OTHER TRANSACTIONS, EXCEPT RTS RECEIPTS */
                  /* FOR SERIALIZED ITEMS.                           */
                  l_flag = yes.
 
               if l_flag = yes
                  and pod_fsm_type <> "RTS-RCT"
                  and not multi_entry
                  and not (is_wiplottrace_enabled()
                           and pod_type = "S")
                  and l_route
                  and l_validateInv
               then do: 
                  run lotserialvalidation
                     (input  l_pt_lot_ser,
                      input  lotserial,
                      input  site,
                      input  cline,
                      input  lotref,
                      input  pod_nbr,
                      input  pt_part,
                      input  location,
                      input  pod_lot_rcpt,
                      output l_undo).
                  if l_undo then
                     undo, retry.
               end. /* IF l_flag = YES */
 
            end. /* IF AVAILABLE pt_mstr */

 
 
            {us/px/pxrun.i &PROC='setReceiptSite' &PROGRAM='porcxr1.p'
               &PARAM="(buffer pod_det,
                           buffer wo_mstr,
                          output rct_site)"
               &NOAPPERROR=true
               &CATCHERROR=true}
 
            /* IF receipt_um = pt_um, THE CONVERSION FACTOR SHOULD BE */
            /* DOESN'T ALWAYS EQUAL 1, LEADING TO INVENTORY PROBLEMS  */
            {us/px/pxrun.i &PROC='getReceiptUMConversion' &PROGRAM='porcxr1.p'
               &PARAM="(input receipt_um,
                           input conv_to_pod_um,
                           buffer pt_mstr,
                           buffer pod_det,
                           output trans_conv)"
               &NOAPPERROR=true
               &CATCHERROR=true
            }

            if pod_type = "S" then do:
 
               for first si_mstr where si_domain = global_domain
                  and si_site   = pod_site
               no-lock:
 
                  if not si_auto_loc
                     and (l_validateInv
                        or l_validateCum)
                  then do:
 
                     if not multi_entry
                     then do:
 
                        if not can-find (first loc_mstr
                                            where loc_domain = global_domain
                                            and   loc_site   = site
                                            and   loc_loc    =
                                               if site <> pod_site
                                               then
                                                  pt_loc
                                               else
                                                  location)
                        then do:
                           /* Unable to issue or receive */
                           {us/bbi/pxmsg.i &MSGNUM=7037 &ERRORLEVEL=3 &MSGARG1=pt_part}
                           undo locloop, retry.
                        end. /*IF NOT CAN-FIND (FIRST loc_mstr...*/
 
                     end. /*IF NOT multi_entry*/
 
                  end. /*IF NOT si_auto_loc AND (l_validateInv ... */
 
               end. /*FOR FIRST si_site*/
 
               assign
                  undo_all  = false
                  pod_recno = recid(pod_det).
 
               if c-application-mode = "API" then
                  run setPurchaseOrderTransDetRow in apiMethodHandle
                     (input ttPurchaseOrderTransDet.apiSequence).
 
               /* SUBCONTRACT WORKORDER UPDATE */
               {us/bbi/gprun.i ""poporca2.p""
                          "(output l_prompt)"}
               if undo_all 
               then do:
                  case l_prompt:
                     when "wolot"
                     then
                        next-prompt wolot with frame d.
                     when "woop"
                     then
                        next-prompt woop with frame d.
                  end case.
                  undo, retry.
               end. /* IF UNDO_ALL */
 
               if not multi_entry
                  and not is_wiplottrace_enabled()
               then do:
                  /* ACCUMULATE TOTAL QUANTITY FOR THE SAME */
                  /* ITEM/SITE/LOCATION/LOTSER/REF */
                  l_total = 0.
                  for each b_pod_det
                     where b_pod_det.pod_domain =  pod_det.pod_domain
                       and b_pod_det.pod_nbr    =  pod_det.pod_nbr
                       and b_pod_det.pod_part   =  pod_det.pod_part
                       and b_pod_det.pod_line   <> pod_det.pod_line
                  no-lock:
 
                     if can-find(first sr_wkfl
                                    where sr_wkfl.sr_domain = global_domain
                                      and sr_wkfl.sr_userid = SessionUniqueID
                                      and sr_wkfl.sr_lineid =
                                          string(b_pod_det.pod_line)
                                      and sr_wkfl.sr_site   = site
                                      and sr_wkfl.sr_loc    = location
                                      and sr_wkfl.sr_lotser = lotserial
                                      and sr_wkfl.sr_ref    = lotref  )
                     then do:
                        {us/px/pxrun.i &PROC='getUMConversionToPOLine'
                                 &PROGRAM='porcxr1.p'
                                 &PARAM="(input b_pod_det.pod_rum,
                                          buffer b_pod_det,
                                          output l_conv_to_pod_um,
                                          output l_use_pod_um_conv)"
                                 &NOAPPERROR=true
                                 &CATCHERROR=true
                        }
 
                        {us/px/pxrun.i &PROC='getReceiptUMConversion'
                                 &PROGRAM='porcxr1.p'
                                 &PARAM="(input b_pod_det.pod_rum,
                                          input l_conv_to_pod_um,
                                          buffer pt_mstr,
                                          buffer b_pod_det,
                                          output l_trans_conv)"
                                 &NOAPPERROR=true
                                 &CATCHERROR=true
                        }
 
                        l_total = l_total  + (b_pod_det.pod_qty_chg *
                                              l_trans_conv).
 
                     end. /* IF CAN-FIND(FIRST sr_wkfl */
                  end. /* FOR EACH b_pod_det */
                  l_total = (lotserial_qty * (trans_conv) )  + l_total.
                  if l_route
                  then do:
                     {us/px/pxrun.i &PROC='validateInventory' &PROGRAM='porcxr2.p'
                        &PARAM="(input transtype,
                                 input site,
                                 input location,
                                 input global_part,
                                 input lotserial,
                                 input lotref,
                                 input l_total,
                                 input trans_um,
                                 input ponbr,
                                 input (if lotserial_qty >=0
                                        then
                                           string(poline)
                                        else
                                           """"),
                                 input yes)"
                        &NOAPPERROR=true
                        &CATCHERROR=true}
                  end. /* IF l_route */
                  if return-value <> {&SUCCESS-RESULT}
                     or (undotran and
                         l_ttype = "CN-RCT")
                  then
                     if batchrun
                     then
                        undo edit-loop, retry edit-loop.
                     else do:
                        if l_next_prompt = "lotser"
                        then
                           next-prompt lotserial with frame d.
                        undo locloop, retry.
                     end. /* IF NOT batchrun */
               end. /* IF NOT multi_entry */
 
            end. /* IF POD_TYPE = "S" */
 
            assign
               total_lotserial_qty = pod_qty_chg
               trans_um            = receipt_um.
 
            if multi_entry then do:
 
               /* THIS PATCH INSURES THAT AT LEAST ONE sr_wkfl ENTRY IS
               PASSED  TO icsrup2.p ( MULTI ENTRY  MODE HANDLER ) EVEN IF
               RECEIVE ALL IS SET TO NO; SO AS TO BRING CONSISTENCY WITH
               RECEIVE ALL SET TO YES.
               */
 
               /* CREATE BEGINS */
               {us/px/pxrun.i &PROC='processRead' &PROGRAM='ppitxr.p'
                  &PARAM="(input pod_part,
                              buffer pt_mstr,
                              input {&NO_LOCK_FLAG},
                              input {&NO_WAIT_FLAG})"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
 
               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &HANDLE = ph_ppitxr
                        &PARAM = "( input  pod_part,
                                    input  site,
                                    input ""pt_lot_ser"",
                                    output l_pt_lot_ser)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
 
               if return-value <> {&SUCCESS-RESULT} or
                 (return-value = {&SUCCESS-RESULT} and
                 l_pt_lot_ser = "" )
               then do:
 
                  {us/px/pxrun.i &PROC='readFirstDetailForLine' &PROGRAM='porcxr2.p'
                     &PARAM="(input integer(cline),
                                 buffer sr_wkfl,
                                 input {&NO_LOCK_FLAG},
                                 input {&NO_WAIT_FLAG})"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
 
                  if return-value <> {&SUCCESS-RESULT} then do:
                     if {us/wh/whgpwhon.i}
                     then do:
                        {us/px/pxrun.i &PROC='validateInventory' &PROGRAM='porcxr2.p'
                           &PARAM="(input transtype,
                                    input site,
                                    input location,
                                    input global_part,
                                    input lotserial,
                                    input lotref,
                                    input 0,
                                    input trans_um,
                                    input ponbr,
                                    input (if lotserial_qty >=0
                                           then
                                              string(poline)
                                           else
                                              """"),
                                    input yes)"
                           &NOAPPERROR=true
                           &CATCHERROR=true}
			   if return-value <> {&SUCCESS-RESULT} then 
			     undo locloop, retry locloop. 
                     end. /* IF {us/wh/whgpwhon.i} */
                     if return-value = {&SUCCESS-RESULT}
                     then do:
                        {us/px/pxrun.i &PROC='createPOReceiptDetail' &PROGRAM='porcxr2.p'
                                       &PARAM="(buffer sr_wkfl,
                                                input SessionUniqueID,
                                                input integer(cline),
                                                input site,
                                                input location,
                                                input lotserial,
                                                input lotref,
                                                input """",
                                                input lotserial_qty)"
                                       &NOAPPERROR=true
                                       &CATCHERROR=true}
                     end. /* IF return-value <> {&SUCCESS-RESULT} */
 
                     {us/px/pxrun.i &PROC='processRead' &PROGRAM='porcxr2.p'
                        &PARAM="(input SessionUniqueID,
                                    input integer(cline),
                                    input site,
                                    input location,
                                    input lotserial,
                                    input lotref,
                                    buffer sr_wkfl,
                                    input {&LOCK_FLAG},
                                    input {&WAIT_FLAG})"
                        &NOAPPERROR=true
                        &CATCHERROR=true}
 
                     /* STORE THE ABOVE CREATED DEFAULT sr_wkfl */
                     run p_create_t_sr_wkfl
                        (input        SessionUniqueID,
                         input        cline,
                         input        site,
                         input        location,
                         input        lotserial,
                         input        lotref,
                         input        lotserial_qty,
                         input-output table t_sr_wkfl).
 
                  end. /* IF NOT AVAILABLE SR_WKFL */
 
                  if available sr_wkfl 
                  then do:
                     sr_vend_lot = pod__qad04[1].

                     if (    lotserial_qty < 0
                         and pod_fsm_type = "RTS-ISS" )
                        or (    lotserial_qty > 0 
                            and pod_fsm_type = "RTS-RCT")
                     then do:
                        for first rmd_det
                           where rmd_domain = global_domain
                           and   rmd_nbr    = pod_nbr
                           and   rmd_prefix = "V"
                           and   rmd_line   = pod_line
                        no-lock:
                           assign
                              sr_to_site = rmd_site
                              sr_to_loc  = rmd_loc.
                        end. /* FOR FIRST rmd_det */
                     end. /* IF lotserial_qty < 0 */
                  end. /* IF AVAILABLE sr_wkfl */  
               end. /* IF NOT AVAILABLE PT_MSTR */
               /* CREATE ENDS */
 
               {us/px/pxrun.i &PROC='readFirstDetailForLine' &PROGRAM='porcxr2.p'
                  &PARAM="(input integer(cline),
                              buffer sr_wkfl,
                              input {&LOCK_FLAG},
                              input {&WAIT_FLAG})"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
 
               l_sr_wkfl_recid = recid(sr_wkfl).
 
               if lotserial_qty = 0 then do:
 
                  if available sr_wkfl
                     and (not can-find(first sr_wkfl
                                          where sr_domain       = global_domain
                                          and   recid(sr_wkfl)  <> l_sr_wkfl_recid
                                          and   sr_lineid       = cline))
                  then do:
                     total_lotserial_qty = total_lotserial_qty - sr_qty.
                     delete sr_wkfl.
                  end. /* IF AVAILABLE SR_WKFL */
 
               end. /* IF LOTSERIAL_QTY = 0 */
 
               else do:
                  if available sr_wkfl then do:
                     /* IF MORE THAN ONE SR_WKFL RECORD EXISTS, THEN THE USER
                        ALREADY ENTERED MULTI-LINE INFORMATION, DO NOT DESTROY
                        THAT */
                     find sr_wkfl where sr_domain = global_domain
                        and sr_userid = SessionUniqueID
                        and sr_lineid = cline
                     exclusive-lock no-error.
                     if not ambiguous sr_wkfl then
                     assign
                        sr_site   = site
                        sr_loc    = location
                        sr_lotser = lotserial
                        sr_ref    = lotref
                        sr_qty    = lotserial_qty.
                  end. /* IF AVAIL SR_WKFL */
               end. /* ELSE DO: */
 
               if i >= 1 then
               assign
                  location = ""
                  lotref   = ""
                  vendlot  = "".
 
               if i = 0 then
                  assign vendlot = pod__qad04[1].
 
               if lotprcpt = yes then lotnext = lotserial.
 
               podtype = pod_type.
               total_lotserial_qty = 0.
 
               {us/px/pxrun.i &PROC='getTotalLotSerialQuantity' &PROGRAM='porcxr2.p'
                  &PARAM="(input integer(cline),
                              output total_lotserial_qty)"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
 
               if c-application-mode = "API" then
                  run setPurchaseOrderTransDetRow in apiMethodHandle
                     (input ttPurchaseOrderTransDet.apiSequence).
 
               do on error undo, return error return-value:
 
                  if execname = "poporc.p"  or          /* PO Receipts */
                     execname = "fsrtvrc.p" or          /* RTS Receipts */
                     execname = "fsrtvis.p"             /* RTS Shipments */
                  then do:
                     /* Update Restriction Procedure Library */
                     run mfairunh.p
                        (input "mgurpl.p",
                         input ?,
                         output hUpdateRestrictedLibrary).
 
                     /* Update Restriction Constants */
                     {us/mg/mgurpl.i "hUpdateRestrictedLibrary"}
 
                     /* VALIDATE IF THE USER UPDATE IS RESTRICTED */
                     /* CLEAR TEMP TABLE RECORDS BEFORE CREATING NEW RECORD */
                     empty temp-table ttUpdateRestrictionSignature.
 
                     /* CREATE TEMP-TABLE RECORD */
                     create ttUpdateRestrictionSignature.
                     assign
                        ttUpdateRestrictionSignature.program
                                                     = execname
                        ttUpdateRestrictionSignature.category
                                                     = if execname = "poporc.p"
                                                       then {&PORCT}
                                                       else {&SSM}
                        ttUpdateRestrictionSignature.part
                                                     = pod_part
                        ttUpdateRestrictionSignature.account               = ?
                        ttUpdateRestrictionSignature.subAccount            = ?
                        ttUpdateRestrictionSignature.costCenter            = ?
                        ttUpdateRestrictionSignature.project               = ?.
 
                     if execname = "poporc.p" then do:  /* PO Receipts */
 
                        run getInventoryStatusCodeValue
                            in hUpdateRestrictedLibrary
                               (input  global_site,
                                input  location,
                                input  global_part,
                                input  lotserial,
                                input  lotref,
                                output cInventoryStatus).
 
                        assign
                           ttUpdateRestrictionSignature.site
                                                        = global_site
                           ttUpdateRestrictionSignature.siteTo
                                                        = ?
                           ttUpdateRestrictionSignature.location
                                                        = global_loc
                           ttUpdateRestrictionSignature.locationTo
                                                        = ?
                           ttUpdateRestrictionSignature.inventoryStatus
                                                        = cInventoryStatus
                           ttUpdateRestrictionSignature.inventoryStatusTo
                                                        = ?
                           ttUpdateRestrictionSignature.changeInventoryStatus
                                                        = ?.
                     end.
                     else do:
                        if execname = "fsrtvrc.p" then do:   /* RTS Receipts */
 
                           /* We need to get the issuing/receiving Site and */
                           /* Location values                               */
                           for first rmd_det where rmd_domain = global_domain
                              and rmd_nbr    = pod_nbr
                              and rmd_part   = pod_part
                              and rmd_line   = pod_line
                              and rmd_prefix = "V"
                              and rmd_type   = "I"
                           no-lock: end.
 
                           assign
                              ttUpdateRestrictionSignature.site
                                                           = rmd_site
                              ttUpdateRestrictionSignature.siteTo
                                                           = global_site
                              ttUpdateRestrictionSignature.location
                                                           = rmd_loc
                              ttUpdateRestrictionSignature.locationTo
                                                           = global_loc.
                        end.
 
                        else if execname = "fsrtvis.p" then do: /* RTS Shipments */
                           /* We need to get the issuing/receiving Site and */
                           /* Location values                               */
                           for first rmd_det where rmd_domain = global_domain
                              and rmd_nbr    = pod_nbr
                              and rmd_part   = pod_part
                              and rmd_line   = pod_line
                              and rmd_prefix = "V"
                              and rmd_type   = "O"
                           no-lock: end.
 
                           issue_or_receipt = getTermLabel("SHIPMENT",10). 
                           assign
                              ttUpdateRestrictionSignature.site
                                                           = global_site
                              ttUpdateRestrictionSignature.siteTo
                                                           = rmd_site
                              ttUpdateRestrictionSignature.location
                                                           = global_loc
                              ttUpdateRestrictionSignature.locationTo
                                                           = rmd_loc.
                        end.
 
                        assign
                           ttUpdateRestrictionSignature.inventoryStatus
                                                        = cInventoryStatus
                           ttUpdateRestrictionSignature.inventoryStatusTo
                                                        = ?
                           ttUpdateRestrictionSignature.changeInventoryStatus
                                                        = ?.
                     end.
 
                     if isUpdateRestricted
                        (input table ttUpdateRestrictionSignature,
                         input true)
                     then do:
                        undo locloop, retry.
                     end.
 
                     delete procedure hUpdateRestrictedLibrary no-error.
 
                  end.        /* end if lookup */
 
                  assign
                     l_delete_sr_wkfl = no
                     l_update_sr_wkfl = no.
 
                  /* DEFAULT CREATED sr_wkfl RECORD IS DELETED TO AVOID    */
                  /* DELETING IT MANUALLY IN MULTI ENTRY SCREEN. THIS WILL */
                  /* ENSURE EVERY sr_wkfl RECORD IS PASSED FOR VALIDATION  */
                  /* CHECK                                                 */
                  run p_delete_sr_wkfl (input        SessionUniqueID,
                                        input        cline,
                                        input        table t_sr_wkfl,
                                        input-output total_lotserial_qty,
                                        input-output l_delete_sr_wkfl).
 
                  {us/ca/cacratpr.i &eff_date_attr=eff_date}
                  
                  if l_autolot 
                  then
                     l_newlot = newlot.
                  else    
                     l_newlot = " ". 
                  /* IF sr_wkfl IS MODIFIED IN MULTI ENTRY, */
                  /* l_update_sr_wkfl IS SET TO YES         */
                  {us/bbi/gprun.i ""icsrup2.p""
                     "(input        rct_site,
                       input        ponbr,
                       input        poline,
                       input        lotprcpt,
                       input        l_multi_return,
                       input        l_newlot,
                       output       l_error,
                       input-output lotnext,
                       input-output vendlot,
                       input-output table tt_attr_pfvalue by-reference,
                       input-output table tt_attr_parameter by-reference,
                       input-output l_update_sr_wkfl)"}
 
                  /* IN CASE OF INVENTORY VALIDATION ERROR AND */
                  /* sr_wkfl IS NOT MODIFIED, UNDO locloop.    */
                  if l_error
                  and not l_update_sr_wkfl
                  then do:
                     if not batchrun
                     then
                        undo locloop, retry locloop.
                     else
                        undo lineloop, retry lineloop.
                  end. /* IF l_error */
 
                  if pod_consignment
                  then
                     transtype = l_trans_type.
                  /* RE-CREATE DEFAULT sr_wkfl, IF sr_wkfl IS NOT UPDATED */
                  /* IN MULTI ENTRY SCREEN. SO THE INVENTORY VALIDATION   */
                  /* CAN BE DONE.                                         */
                  run p_create_default_sr_wkfl
                     (input        l_update_sr_wkfl,
                      input        SessionUniqueID,
                      input        cline,
                      buffer       sr_wkfl,
                      input-output table t_sr_wkfl,
                      input-output l_delete_sr_wkfl) .
 
               end.
 
               /* IF MULTI-ENTRY MODE WAS USED TO PROCESS RECEIPTS FOR A
                  SINGLE ITEM/LOT/SERIAL LOCATION, IT IS POSSIBLE THAT
                  THEY ARE RETURNING TO THIS PROGRAM HAVING CREATED ONLY 1
                  sr_wkfl RECORD.  IF SO, THIS PROGRAM WILL RESET THE
                  VALUE OF THE multi_entry FIELD TO "NO" (F0S0 BELOW). IF
                  THE USER HAS RETURNED FROM THE MULTI-ENTRY FRAME BY
                  PRESSING F4 ON AN ERROR CONDITION FOR SINGLE
                  ITEM/LOT/SERIAL, THE PROGRAM IS RETURNING WITH THE
                  VALUES IN sr_wkfl THAT CAUSED THE ERROR MESSAGE (BECAUSE
                  THEY ARE DEFINED no-undo).  THESE ERRONEOUS VALUES WERE
                  THEN OVERWRITING THE GOOD ONES.  TO PREVENT THIS FROM
                  OCCURRING, WE DO A FIND ON THE FIRST sr_wkfl HERE TO
                  RE-ESTABLISH THE CORRECT VALUES FROM sr_wkfl.
               */
 
               {us/px/pxrun.i &PROC='readFirstDetailForLine' &PROGRAM='porcxr2.p'
                  &PARAM="(input integer(cline),
                              buffer sr_wkfl,
                              input {&NO_LOCK_FLAG},
                              input {&NO_WAIT_FLAG})"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
 
               if return-value = {&SUCCESS-RESULT} then
               assign
                  site      = sr_site
                  location  = sr_loc
                  lotserial = sr_lotser
                  lotref    = sr_ref
                  lotserial_qty = sr_qty.
 
               for first si_mstr where si_domain = global_domain
                  and si_site   = site
               no-lock:
 
                  if not si_auto_loc
                     and (l_validateInv
                        or l_validateCum)
                  then do:

                     for each sr_wkfl where sr_domain  = global_domain
                        and sr_site    = site
                        and sr_userid  = SessionUniqueID
                        and sr_lineid  = cline
                     no-lock:
                        if    (pod_type = "S"
                                  and not can-find (first loc_mstr
                                            where loc_domain = global_domain
                                            and   loc_site   = sr_site
                                            and   loc_loc    =
                                               if sr_site <> pod_site
                                               then
                                                  pt_loc
                                               else
                                                  sr_loc)
                              )
                           or (pod_type <> "S"
                                  and not can-find (first loc_mstr
                                            where loc_domain = global_domain
                                            and   loc_site   = sr_site
                                            and   loc_loc    = sr_loc)
                               )
                        then do:
                           /* Unable to issue or receive */
                           {us/bbi/pxmsg.i &MSGNUM=7037 &ERRORLEVEL=3 &MSGARG1=pt_part}
                           undo locloop, retry.
                        end. /*IF NOT CAN-FIND (FIRST loc_mstr...*/
 
                     end. /*FOR EACH sr_wkfl*/
 
                  end. /*IF not si_auto_loc  AND (l_validateInv ... */
 
               end. /*FOR FIRST si_mstr_*/
 
            end. /* IF MULTI_ENTRY */
 
            if multi_entry = yes then do:
 
               /* VERIFY THAT A MULTI_ENTRY WAS ACTUALLY PERFORMED */
               assign
                  i                = 0
                  multi_entry      = no
                  l_multi_ent_pass = yes.
 
               for each sr_wkfl where sr_domain = global_domain
                  and sr_userid = SessionUniqueID
                  and sr_lineid = cline
               no-lock:
                  i = i + 1.
                  if i = 1 then
                     assign pod__qad04[1] = sr_vend_lot.
 
                  if i > 1 then do:
                     multi_entry = yes.
                     leave.
                  end. /* IF I > 1 */
               end. /* FOR EACH SR_WKFL */
 
               for each sr_wkfl where sr_domain = global_domain
                  and sr_userid = SessionUniqueID
                  and sr_lineid = cline
               exclusive-lock:

                  if pod_consignment
                  then do:
                     run p_validateTransaction (input  "CN-RCT",
                                                input  sr_site,
                                                input  sr_loc,
                                                input  pod_part,
                                                input  multi_entry,
                                                input  sr_lotser,
                                                input  sr_ref,
                                                input  sr_qty,
                                                input  receipt_um,
                                                input  ponbr,
                                                input  (if lotserial_qty >=0
                                                        then
                                                           string(poline)
                                                        else
                                                           """"),
                                                output yn).
                  end. /* IF pod_consignment */

                  if pod_consignment
                     and yn
                  then do:
                     if not multi_entry
                     then
                        lotserial_qty = 0.
                     delete sr_wkfl.
                     retry.
                  end. /* IF yn */

               end. /* FOR EACH sr_wkfl */

               {us/px/pxrun.i &PROC='getTotalLotSerialQuantity' &PROGRAM='porcxr2.p'
                        &PARAM="(input integer(cline),
                                 output total_lotserial_qty)"
                        &NOAPPERROR=true
                        &CATCHERROR=true}
               /* FOR RTS RECEIPTS ALREADY PROCESSED IN MULTI-ENTRY MODE,     */
               /* ASSIGN FLAGS SO AS TO STOP RE-ENTRY INTO SINGLE-ENTRY MODE. */
               if pod_fsm_type   = "RTS-RCT" then
                  assign
                     l_flag      = yes
                     multi_entry = yes.
            end. /* IF multi_entry = YES */
 
            if  l_flag       = yes
               and pod_fsm_type = "RTS-RCT"
               and available pt_mstr
               and multi_entry = no
            then do:
 
               for first rmd_det where rmd_domain = global_domain
                  and rmd_nbr    = pod_nbr
                  and rmd_part   = pod_part
                  and rmd_line   = pod_line
                  and rmd_prefix = "V"
                  and rmd_type   = "I"
               no-lock: end.
 
               if available rmd_det
                  and rmd_iss = no
               then do:
 
                  l_continue = no.
 
                  /* PROMPT WARNING MESSAGE ASKING USER IF HE WISHES TO      */
                  /* RECEIVE ITEM WITH LOT/SERIAL DIFFERENT FROM ONE SHIPPED */
                  /* WHEN INV ISSUE = NO AND LOT CONTROL LEVEL > 0.          */
                  if clc_lotlevel > 0
                  then do:
                     /* SERIAL DIFFERS FROM EXPECTED VALUE */
                     /* FOR ITEM RECEIVED. CONTINUE?       */
                     {us/bbi/pxmsg.i &MSGNUM=6379 &ERRORLEVEL=2
                              &CONFIRM=l_continue}
                  end. /* IF clc_lotlevel > 0 */
                  else
                     l_continue = yes.
 
                  if l_continue = no
                  then do:
                     undotran = yes.
                     undo locloop, retry.
                  end. /* IF l_continue */
 
                  else do:
 
                     /* IF USER WISHES TO CONTINUE, EXECUTE LOGIC TO   */
                     /* FIND IF THE RECEIVED LOTSERIAL IS PRESENT IN   */
                     /* ANY SITE/LOCATION OTHER THAN THE SHIP-FROM     */
                     /* SITE/LOCATION IN COMBINATION WITH ACTIVE       */
                     /* COMPLIANCE LEVEL.                              */
 
                     if (can-find (first ld_det
                        where ld_domain = global_domain
                        and   ( ( ld_site <> rmd_site
                                and ld_loc  <> rmd_loc)
                              or (ld_site <> rmd_site))
                        and (ld_lot  = lotserial)
                        and ( ( clc_lotlevel = 1
                              and ld_part = pod_part)
                            or  clc_lotlevel = 2)))
                        or (can-find (first sr_wkfl
                              where sr_domain = global_domain
                              and   sr_userid = SessionUniqueID
                              and   sr_lotser = lotserial))
                     then
                        l_scan = yes.
                     else do:
                        l_scan = no.
                        if can-find (first tr_hist
                           where  tr_domain  =  global_domain
                           and    tr_serial  = lotserial
                           and    tr_nbr     <> pod_nbr
                           and    tr_part    = pod_part
                           and    tr_program = "fsrtvis.p")
                        then
                           l_scan = yes.
                     end. /* ELSE DO */
 
                  end. /* ELSE DO */
 
               end. /* IF AVAILABLE rmd_det */
 
               if l_scan = yes
               then do:
                  {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                           &HANDLE = ph_ppitxr
                           &PARAM = "( input  pt_part,
                                       input  site,
                                       input ""pt_lot_ser"",
                                       output l_pt_lot_ser)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
 
                  run lotserialvalidation
                     (input  l_pt_lot_ser,
                      input  lotserial,
                      input  site,
                      input  cline,
                      input  lotref,
                      input  pod_nbr,
                      input  pt_part,
                      input  location,
                      input  pod_lot_rcpt,
                      output l_undo).
 
                  if l_undo then
                     undo, retry.
 
               end. /* IF l_scan = YES */
 
            end. /* IF l_flag = yes AND ... */
 
            if multi_entry = no
            then do:
               /* DO NOT ALLOW CONSIGNED INVENTORY TO BE ISSUED FOR RTS */
               if l_using_supplier_consignment
                  and (  pod_fsm_type = "RTS-RCT"
                      or pod_fsm_type = "RTS-ISS")
                  and lotserial_qty <> 0
               then do:
                  /* CHECK VALUE OF USE CONSIGNED FIRST */
                  if can-find (first cns_ctrl
                                 where cns_domain = global_domain
                                 and   cns_active)
                  then
                     for first cns_ctrl 
                        where cns_domain = global_domain
                     no-lock:
                        l_process_consign_now = (if cns_picking_logic = "1"
                                                 then 
                                                    yes
                                                 else
                                                    no).
                     end. /* FOR FIRST cns_ctrl */

                  if (    pod_fsm_type  = "RTS-ISS" 
                      and lotserial_qty > 0)
                     or (    pod_fsm_type  = "RTS-RCT" 
                         and lotserial_qty < 0)
                  then 
                     for first ld_det
                        where  ld_domain = global_domain
                        and    ld_site   = site
                        and    ld_loc    = location
                        and    ld_part   = pod_part
                        and    ld_lot    = lotserial
                        and    ld_ref    = lotref
                     no-lock:
                     end. /* FOR FIRST ld_det */

                  if (    pod_fsm_type  = "RTS-ISS"
                      and lotserial_qty < 0)
                     or (    pod_fsm_type  = "RTS-RCT"
                         and lotserial_qty > 0)
                  then do:
                     for first rmd_det
                        where rmd_domain = global_domain
                        and   rmd_nbr    = pod_nbr
                        and   rmd_prefix = "V"
                        and   rmd_line   = pod_line
                     no-lock:
                        for first ld_det
                           where ld_domain = global_domain
                           and   ld_site   = rmd_site
                           and   ld_loc    = rmd_loc
                           and   ld_part   = pod_part
                           and   ld_lot    = lotserial
                           and   ld_ref    = lotref
                        no-lock:
                        end. /* FOR FIRST ld_det */
                     end. /* FOR FIRST rmd_det */
                  end. /* IF pod_fsm_type = "RTS-ISS" */
                  
                  if available ld_det
                  then do:
                     if l_process_consign_now                     
                     then do:
                        if pod_type = "R"
                           and lotserial_qty > 0
                        then do:
                           if ld_supp_consign_qty > 0
                           then do:
                              /* STOCK IS CONSIGNED, CANNOT ISSUE. CHANGE OWNERSHIP */ 
                              {us/bbi/pxmsg.i &MSGNUM=14484 &ERRORLEVEL=3}
                              undo locloop, retry.                  
                           end. /* IF AVAILABLE ld_det */
                        end. /* IF pod_type = "R" */
                        else do: 
                           if pod_type = "R"
                              and lotserial_qty < 0
                           then do:
                              if can-find(first loc_mstr
                                             where loc_domain = global_domain
                                             and   loc_site   = ld_site
                                             and   loc_loc    = ld_loc
                                             and   loc_xfer_ownership = no)
                                 and ld_supp_consign_qty > 0
                              then do:
                                 /* STOCK IS CONSIGNED, CANNOT ISSUE. CHANGE OWNERSHIP */ 
                                 {us/bbi/pxmsg.i &MSGNUM=14484 &ERRORLEVEL=3}
                                 undo locloop, retry.                  
                              end. /* IF CAN-FIND(FIRST loc_mstr */
                           end. /* IF pod_type = "R" */

                           {us/px/pxrun.i &PROC='p_getTotalQtyforLines'
                                          &PROGRAM='porcxr1.p'
                                          &PARAM="(input  pod_nbr,
                                                   input  pod_part,
                                                   input  pod_line,
                                                   input  ld_site,
                                                   input  ld_loc,
                                                   input  ld_lot,
                                                   input  ld_ref,
                                                   input  yes,
                                                   buffer pt_mstr,
                                                   output l_total)"
                                          &NOAPPERROR=true
                                          &CATCHERROR=true}
                           if return-value <> {&SUCCESS-RESULT}
                           then
                              undo locloop, retry.

                           assign
                              l_non_cons_qty = ld_qty_oh - ld_supp_consign_qty - l_total
                              l_total        = (absolute(lotserial_qty) * (trans_conv) )
                                               + l_total.

                           if (ld_qty_oh - ld_supp_consign_qty) < l_total
                              and can-find(first is_mstr
                                             where is_domain    = global_domain
                                             and   is_status    = ld_status
                                             and   is_overissue = no)
                           then do:
                              /* NON-CONSIGNED QUANTITY AVAILABLE */
                              /* IN SITE LOCATION FOR LOT/SERIAL  */ 
                              {us/bbi/pxmsg.i &MSGNUM=6789 &ERRORLEVEL=3
                                              &MSGARG1=l_non_cons_qty}
                              undo locloop, retry.
                           end. /* IF (ld_qty_oh - ld_supp_consign_qty) ... */                        
                        end. /* ELSE DO */
                     end. /* IF l_process_consign_now */
                     else do:
                        {us/px/pxrun.i &PROC='p_getTotalQtyforLines'
                                          &PROGRAM='porcxr1.p'
                                          &PARAM="(input  pod_nbr,
                                                   input  pod_part,
                                                   input  pod_line,
                                                   input  ld_site,
                                                   input  ld_loc,
                                                   input  ld_lot,
                                                   input  ld_ref,
                                                   input  no,
                                                   buffer pt_mstr,
                                                   output l_total)"
                                          &NOAPPERROR=true
                                          &CATCHERROR=true}
                        if return-value <> {&SUCCESS-RESULT}
                        then
                           undo locloop, retry.

                        assign
                           l_non_cons_qty = ld_qty_oh - ld_supp_consign_qty - l_total
                           l_total        = (absolute(lotserial_qty) * (trans_conv) )
                                            + l_total.

                        if (ld_qty_oh - ld_supp_consign_qty) < l_total
                        then do:
                           if pod_type = "R"
                              and lotserial_qty       > 0
                              and ld_supp_consign_qty > 0
                           then do:
                              /* STOCK IS CONSIGNED, CANNOT ISSUE. CHANGE OWNERSHIP */ 
                              {us/bbi/pxmsg.i &MSGNUM=14484 &ERRORLEVEL=3}
                              undo locloop, retry.                  
                           end. /* IF pod_type = "R" */
                           else do:
                              if can-find(first is_mstr
                                          where is_domain    = global_domain
                                          and   is_status    = ld_status
                                          and   is_overissue = no)
                              then do:
                                 /* NON-CONSIGNED QUANTITY AVAILABLE */
                                 /* IN SITE LOCATION FOR LOT/SERIAL  */ 
                                 {us/bbi/pxmsg.i &MSGNUM=6789 &ERRORLEVEL=3
                                                 &MSGARG1=l_non_cons_qty}
                                 undo locloop, retry.
                              end. /* IF (ld_qty_oh - ld_supp_consign_qty) ... */                        
                           end. /* ELSE DO */
                        end. /* IF (ld_qty_oh - ld_supp_consign_qty) */
                     end. /* IF NOT l_process_consign_now */
                  end. /* IF AVAILABLE ld_det */
               end. /* IF l_using_supplier_consignment */

               /* PERFORM EDITS HERE FOR PURCHASE ORDERS.  RTS
               EDITS ARE DONE LATER... */
 
               /* ADDED CONDITION FOR RTS RECEIPTS HAVING LOT/SERIAL */
               /* NOT SHIPPED EARLIER BUT FOUND IN INVENTORY.        */
 
               if (pod_type = "" and pod_fsm_type = "")
                  or (pod_type     = "R"
                  and pod_fsm_type = "RTS-RCT"
                  and l_flag       = yes
                  and l_scan       = yes)
               then do:
 
                  /* FOR A NEGATIVE RECEIPT AGAINST A CONSIGNED LINE      */
                  /* CHECK WHETHER A POSITIVE RECEIPT EXISTS FOR THE LINE */
                  if pod_consignment and lotserial_qty < 0
                  then do:
 
                     for each cnsix_mstr where cnsix_domain = global_domain
                        and cnsix_part     = pod_part
                        and cnsix_site     = pod_site
                        and cnsix_po_nbr   = pod_nbr
                        and cnsix_pod_line = pod_line
                        and cnsix_lotser   = lotserial
                        and cnsix_ref      = lotref
                     no-lock:
                        if can-find(first   tr_hist
                                      where tr_domain = global_domain
                                      and   tr_trnbr  = cnsix_receipt_trnbr
                                      and   tr_loc    = location)
                        then
                           accumulate cnsix_qty_consigned (total).
                     end. /* for each cnsix */
 
                     if (accum total cnsix_qty_consigned)
                        < absolute(lotserial_qty)
                     then do:
                        /* NO CONSIGNED INVENTORY CAN BE RETURNED FOR PO LINE */
                        {us/bbi/pxmsg.i &MSGNUM=6303 &ERRORLEVEL=3
                                 &MSGARG1=pod_nbr
                                 &MSGARG2=string(pod_line)}
                        undo lineloop, retry lineloop.
                     end.
 
                  end. /* IF pod_consignment */
 
                  if l_ttype = "CN-RCT"
                     and not l_multi_ent_pass
                  then do:

                     run p_validateTransaction (input  "CN-RCT",
                                                input  site,
                                                input  location,
                                                input  global_part,
                                                input  multi_entry,
                                                input  lotserial,
                                                input  lotref,
                                                input  lotserial_qty,
                                                input  receipt_um,
                                                input  ponbr,
                                                input  (if lotserial_qty >=0
                                                        then
                                                           string(poline)
                                                        else
                                                           """"),
                                                output undotran).

                  end. /* IF l_ttype = "CN-RCT" */
                  else do:
                  /* ACCUMULATE TOTAL QUANTITY FOR THE SAME */
                  /* ITEM/SITE/LOCATION/LOTSER/REF */
                  l_total = 0.
                  for each b_pod_det
                     where b_pod_det.pod_domain =  pod_det.pod_domain
                       and b_pod_det.pod_nbr    =  pod_det.pod_nbr
                       and b_pod_det.pod_part   =  pod_det.pod_part
                       and b_pod_det.pod_line   <> pod_det.pod_line
                  no-lock:
 
                     if can-find(first sr_wkfl
                                    where sr_wkfl.sr_domain = global_domain
                                      and sr_wkfl.sr_userid = SessionUniqueID
                                      and sr_wkfl.sr_lineid =
                                          string(b_pod_det.pod_line)
                                      and sr_wkfl.sr_site   = site
                                      and sr_wkfl.sr_loc    = location
                                      and sr_wkfl.sr_lotser = lotserial
                                      and sr_wkfl.sr_ref    = lotref  )
                     then do:
                        {us/px/pxrun.i &PROC='getUMConversionToPOLine'
                                 &PROGRAM='porcxr1.p'
                                 &PARAM="(input b_pod_det.pod_rum,
                                          buffer b_pod_det,
                                          output l_conv_to_pod_um,
                                          output l_use_pod_um_conv)"
                                 &NOAPPERROR=true
                                 &CATCHERROR=true
                        }
 
                        {us/px/pxrun.i &PROC='getReceiptUMConversion'
                                 &PROGRAM='porcxr1.p'
                                 &PARAM="(input b_pod_det.pod_rum,
                                          input l_conv_to_pod_um,
                                          buffer pt_mstr,
                                          buffer b_pod_det,
                                          output l_trans_conv)"
                                 &NOAPPERROR=true
                                 &CATCHERROR=true
                        }
 
                        l_total = l_total  + (b_pod_det.pod_qty_chg *
                                              l_trans_conv ).
 
                     end. /* IF CAN-FIND(FIRST sr_wkfl */
                  end. /* FOR EACH b_pod_det */
                  if lotserial_qty < 0 then do:
                     {us/px/pxrun.i &PROC = 'allowIssueWithoutSerialization'
                                       &PROGRAM='paicxr.p'
                                       &HANDLE = ph_paicxr
                                       &PARAM = "(input global_part,
                                                  input site,
                                                  input location,
                                                  input lotserial,
                                                  input lotref,
                                                  input absolute(lotserial_qty),
                                                  output allowToIssue,
                                                  output looseQty)"
                                       &NOAPPERROR = true
                                       &CATCHERROR = true}

                     if not allowToIssue then do:
                        /* Not enough qty in inventory */
                        {us/bbi/pxmsg.i &MSGNUM=11362 &ERRORLEVEL={&APP-ERROR-RESULT}}
                        undo lineloop, retry lineloop.
                     end.
 
                  end.
                  l_total = (lotserial_qty * (trans_conv) )  + l_total.
 
                  /* MODIFIED TENTH INPUT PARAMTER SUCH THAT A STRING */
                  /* IS PASSED TO THE PROCEDURE validateInventory     */
                  {us/px/pxrun.i &PROC='validateInventory' &PROGRAM='porcxr2.p'
                     &PARAM="(input transtype,
                              input site,
                              input location,
                              input global_part,
                              input lotserial,
                              input lotref,
                              input l_total,
                              input trans_um,
                              input ponbr,
                              input (if lotserial_qty >=0
                                     then
                                        string(poline)
                                     else
                                        """"),
                              input yes)"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
                  end. /* ELSE DO */
 
                  if return-value <> {&SUCCESS-RESULT}
                     or (undotran and
                         l_ttype = "CN-RCT")
                  then
                     if batchrun
                     then
                        undo lineloop, retry lineloop.
                     else do:
                        if l_next_prompt = "lotser"
                        then
                           next-prompt lotserial with frame d.
                        undo locloop, retry.
                     end. /* IF NOT batchrun */
 
               end. /* IF (POD_TYPE = "" AND POD_FSM_TYPE = "") */
 
               /* PERFORM EDITS FOR RTS SHIPMENT/RECEIPTS WITH INVENTORY
               ISSUE/RECEIPT = YES ( -> POD_TYPE = " " INSTEAD OF "R") */
 
               /* NOTE: FOR RTS RECEIPTS, IT'S JUST LIKE EDITING A PO RECEIPT,
               HOWEVER, AN RTS RETURN IS EDITED AS IF IT'S A RECEIPT FOR A
               NEGATIVE QUANTITY. */
 
               if (pod_type = "" and pod_fsm_type <> "") then do:
 
                  {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                           &HANDLE = ph_ppitxr
                           &PARAM = "( input  global_part,
                                       input  site,
                                       input ""pt_lot_ser"",
                                       output l_pt_lot_ser)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
                  /* ACCUMULATE TOTAL QUANTITY FOR THE SAME */
                  /* ITEM/SITE/LOCATION/LOTSER/REF */
                  l_total = 0.
                  for each b_pod_det
                     where b_pod_det.pod_domain =  pod_det.pod_domain
                       and b_pod_det.pod_nbr    =  pod_det.pod_nbr
                       and b_pod_det.pod_part   =  pod_det.pod_part
                       and b_pod_det.pod_line   <> pod_det.pod_line
                  no-lock :
 
                     if can-find(first sr_wkfl
                                    where sr_wkfl.sr_domain = b_pod_det.pod_domain
                                      and sr_wkfl.sr_userid = SessionUniqueID
                                      and sr_wkfl.sr_lineid =
                                          string(b_pod_det.pod_line)
                                      and sr_wkfl.sr_site   = site
                                      and sr_wkfl.sr_loc    = location
                                      and sr_wkfl.sr_lotser = lotserial
                                      and sr_wkfl.sr_ref    = lotref  )
                     then do:
 
                        {us/px/pxrun.i &PROC='getUMConversionToPOLine'
                                 &PROGRAM='porcxr1.p'
                                 &PARAM="(input b_pod_det.pod_rum,
                                          buffer b_pod_det,
                                          output l_conv_to_pod_um,
                                          output l_use_pod_um_conv)"
                                 &NOAPPERROR=true
                                 &CATCHERROR=true
                        }
 
                        {us/px/pxrun.i &PROC='getReceiptUMConversion'
                                 &PROGRAM='porcxr1.p'
                                 &PARAM="(input b_pod_det.pod_rum,
                                          input l_conv_to_pod_um,
                                          buffer pt_mstr,
                                          buffer b_pod_det,
                                          output l_trans_conv)"
                                 &NOAPPERROR=true
                                 &CATCHERROR=true
                        }
 
                        l_total = l_total  + (b_pod_det.pod_qty_chg *
                                              l_trans_conv).
                     end. /* IF CAN-FIND(FIRST sr_wkfl */
                  end. /* FOR EACH b_pod_det */
                  l_total = (lotserial_qty * (trans_conv) )  + l_total.
 
                  if (l_pt_lot_ser <> "S") then do:
                     {us/bbi/gprun.i ""paicedit.p""
                        "(input  transtype,
                                input  site,
                                input  location,
                                input  global_part,
                                input  lotserial,
                                input  lotref,
                                input  if pod_fsm_type = ""RTS-RCT"" then
                                          l_total
                                       else
                                          l_total * -1,
                                input  trans_um,
                                input  """",
                                input  """",
                                input toWarning,
                                output undotran)"}
                  end. /* IF (PT_LOT_SER <> "S") */
 
                  else if l_pt_lot_ser = "S" then do:
                     {us/bbi/gprun.i ""paiced5.p""
                        "(input  transtype,
                                input  site,
                                input  location,
                                input  global_part,
                                input  lotserial,
                                input  lotref,
                                input  if pod_fsm_type = ""RTS-RCT"" then
                                          l_total
                                       else
                                          l_total * -1,
                                input  trans_um,
                                input  """",
                                input  """",
                                input toWarning,
                                output undotran)"}
                  end. /* ELSE IF PT_LOT_SER = "S" */
 
                  if undotran 
                  then do:
                     if l_next_prompt = "lotser"
                     then
                        next-prompt lotserial with frame d.
                     undo locloop, retry.
                  end. /* IF undotran */
 
               end. /* IF POD_TYPE = "" AND POD_FSM_TYPE <> "" */
 
               /* PERFORM OTHER RTS EDITS - THESE ARE THE RTS SHIPMENTS
                  AND RECEIPTS WHERE INVENTORY ISSUE/RECEIPT = NO,
                  I.E., INSTEAD OF 'RECEIVING' PARTS, THEY ARE ABOUT
                  TO BE TRANSFERRED BETWEEN A SUPPLIER SITE/LOCATION AND
                  AN INTERNAL WAREHOUSE SITE/LOCAION. */
 
               else if pod_fsm_type <> ""
                    and  pod_type   <> "M"
               then do:
 
                  {us/bbi/gprun.i ""fsrtved.p""
                     "(input pod_nbr,
                       input pod_line,
                       input pod_rma_type,
                       input site,
                       input location,
                       input lotserial,
                       input lotref,
                       input lotserial_qty,
                       input trans_conv,
                       input trans_um,
                       input l_flag,
                       output undotran,
                       output msgnbr,
                       output errsite,
                       output errloc)"}
 
                  if undotran then do:
                     {us/bbi/pxmsg.i &MSGNUM=msgnbr &ERRORLEVEL={&INFORMATION-RESULT}
                        &MSGARG1=errsite
                        &MSGARG2=errloc}
                     if l_next_prompt = "lotser"
                     then
                        next-prompt lotserial with frame d.
                     undo locloop,retry.
                  end. /* IF UNDOTRAN */
 
               end. /* ELSE IF POD_FSM_TYPE <> "" */
 
               if pod_type = "" then do:
                  {us/px/pxrun.i &PROC='validateReceiptToPOSiteTransfer'
                     &PROGRAM='porcxr2.p'
                     &PARAM="(input rct_site,
                              input site,
                              input transtype,
                              input pod_loc,
                              input location,
                              input global_part,
                              input lotserial,
                              input lotref,
                              input (lotserial_qty * trans_conv),
                              input trans_um,
                              input ponbr,
                              input poline)"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
                  if return-value <> {&SUCCESS-RESULT} 
                  then do:
                     if l_next_prompt = "lotser"
                     then
                        next-prompt lotserial with frame d.
                     undo locloop, retry.
                  end. /* IF return-value <> {&SUCCESS-RESULT} */
               end.  /* if pod_type = "" */
 
               {us/px/pxrun.i &PROC='readFirstDetailForLine' &PROGRAM='porcxr2.p'
                  &PARAM="(input integer(cline),
                                 buffer sr_wkfl,
                                 input {&LOCK_FLAG},
                                 input {&WAIT_FLAG})"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
 
               if lotserial_qty = 0 then do:
                  if available sr_wkfl then do:
                     total_lotserial_qty = total_lotserial_qty - sr_qty.
                     delete sr_wkfl.
                  end. /* IF AVAILABLE SR_WKFL */
               end. /* IF LOTSERIAL_QTY = 0 */
               else do:
 
                  if available sr_wkfl then
                  assign
                     total_lotserial_qty = total_lotserial_qty - sr_qty
                                           + lotserial_qty
                     sr_site = site
                     sr_loc = location
                     sr_lotser = lotserial
                     sr_ref = lotref
                     sr_vend_lot = pod__qad04[1]
                     sr_qty = lotserial_qty.
 
                  else do:
                     {us/px/pxrun.i &PROC='createPOReceiptDetail' &PROGRAM='porcxr2.p'
                        &PARAM="(buffer sr_wkfl,
                                 input SessionUniqueID,
                                 input integer(cline),
                                 input site,
                                 input location,
                                 input lotserial,
                                 input lotref,
                                 input pod__qad04[1],
                                 input lotserial_qty)"
                        &NOAPPERROR=true
                        &CATCHERROR=true}
 
                     {us/px/pxrun.i &PROC='processRead' &PROGRAM='porcxr2.p'
                        &PARAM="(input SessionUniqueID,
                                 input integer(cline),
                                 input site,
                                 input location,
                                 input lotserial,
                                 input lotref,
                                 buffer sr_wkfl,
                                 input {&LOCK_FLAG},
                                 input {&WAIT_FLAG})"
                        &NOAPPERROR=true
                        &CATCHERROR=true}
 
                     total_lotserial_qty = total_lotserial_qty
                                           + lotserial_qty.
 
                     if recid(sr_wkfl) = -1 then .
 
                     if available sr_wkfl
                        and ((    lotserial_qty < 0
                              and pod_fsm_type = "RTS-ISS" )
                             or (    lotserial_qty > 0 
                                 and pod_fsm_type = "RTS-RCT"))
                     then do: 
                        for first rmd_det
                           where rmd_domain = global_domain
                           and   rmd_nbr    = pod_nbr
                           and   rmd_prefix = "V"
                           and   rmd_line   = pod_line
                           no-lock: 
                           assign
                              sr_to_site = rmd_site
                              sr_to_loc  = rmd_loc.
                        end. /* FOR FIRST rmd_det */
                     end. /* IF AVAILABLE sr_wkfl */
                  end.

                  {us/ca/cacratpr.i &eff_date_attr=eff_date}

                  if available sr_wkfl
                  then do:
                     {us/px/pxrun.i &PROC       = 'createAttrpfValueRCT'
                                    &PROGRAM    = 'carcxr.p'
                                    &HANDLE     = ph_carcxr
                                    &PARAM      = "(input sr_wkfl.oid_sr_wkfl,
                                                    input pod_part,
                                                    input site,
                                                    input location,
                                                    input lotserial,
                                                    input lotref,
                                                    input 'RCT-PO',
                                                    input sr_wkfl.sr_qty,
                                                    input pod_nbr,
                                                    input pod_line,
                                                    input table tt_attr_parameter by-reference,
                                                    input-output table tt_attr_pfvalue by-reference)"
                                    &NOAPPERROR = true
                                    &CATCHERROR = true
                     }
                  end. /* IF AVAILABLE sr_wkfl */

                  if can-find (first tt_attr_pfvalue
                     where tt_attr_pfvalue.tt_oid_attrpf_mstr
                     =sr_wkfl.oid_sr_wkfl ) then
                  do:

                     /* Positive PO receipt */
                     if porec = yes and sr_qty > 0 then do:

                        {us/ca/cainipf.i sr_wkfl.oid_sr_wkfl
                                         pod_part
                                         site
                                         location
                                         lotserial
                                         lotref
                                         d
                                         locloop
                                         lotprcpt
                        }

                     end.

                     for first tt_attr_pfvalue no-lock
                        where tt_attr_pfvalue.tt_oid_attrpf_mstr    = sr_wkfl.oid_sr_wkfl
                        and   tt_attr_pfvalue.tt_attrpfd_ui_display :

                        hide frame b no-pause.
                        hide frame c no-pause.
                        hide frame d no-pause.
                        {us/bbi/gprun.i ""caatui.p""
                           "(input sr_wkfl.oid_sr_wkfl,
                             input pt_part,
                             input sr_wkfl.sr_site,
                             input sr_wkfl.sr_loc,
                             input sr_wkfl.sr_lotser,
                             input sr_wkfl.sr_ref,
                             input lotserial_qty,
                             input receipt_um,
                             input transtype,
                             input-output table tt_attr_pfvalue by-reference)"}

                        if c-application-mode <> "API" then do:
                           view frame b.
                           view frame c.
                        end.  /* if c-application-mode <> "API" */
                     end.

                  end. /* ELSE DO: */
 
               end. /* IF LOTSERIAL_QTY <> 0 */
 
               if porec or is-return then do:

                  {us/px/pxrun.i &PROC='validateSingleItemOrLotSerialLocation'
                     &PROGRAM='porcxr2.p'
                     &PARAM="(input site,
                              input location,
                              input lotserial,
                              input lotref,
                              input pod_nbr,
                              input pod_line,
                              input yes)"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
                  if return-value <> {&SUCCESS-RESULT} then
                     undo locloop, retry.
               end. /* IF POREC OR IS-RETURN */
 
               /* IF SITE CHANGED ALLOW USER TO CHANGE TAX ENVIRONMENT */
               if site <> pod_site and pod_taxable then do:
 
                  undo-taxes = true.
 
                  if c-application-mode = "API" then
                     run setPurchaseOrderTransDetRow in apiMethodHandle
                        (input ttPurchaseOrderTransDet.apiSequence).
 
                  {us/bbi/gprun.i ""poporctx.p""
                     "(input recid(po_mstr),
                             input site,
                             input pod_site,
                             input pod_taxable,
                             input pod_taxc,
                             input-output pod_tax_usage,
                             input-output pod_tax_env,
                             input-output pod_tax_in,
                             input-output undo-taxes)"}
 
                  if undo-taxes then undo locloop, retry.
 
               end. /* IF SITE <> POD_SITE AND POD_TAXABLE */
 
            end. /* ELSE IF NOT MULTI_ENTRY */
 
            /*SET AND UPDATE INVENTORY DETAIL ATTRIBUTES*/
            find first attr_wkfl
               where chg_line = string(pod_line) exclusive-lock no-error.
            if available attr_wkfl
               and (pod_type = ""
               or   l_route)
            then do:
 
               if status_actv = no
               then do:
 
                  for first ld_det where ld_domain = global_domain
                     and ld_site   = site
                     and ld_loc    = location
                     and ld_part   = pod_part
                     and ld_lot    = lotserial
                     and ld_ref    = lotref
                  no-lock: end.
 
                  if available ld_det then
                     chg_status = ld_status.
 
                  else do:
 
                     for first loc_mstr where loc_domain = global_domain
                        and loc_site   = site
                        and loc_loc    = location
                        and loc_domain = global_domain
                     no-lock: end.
 
                     if available loc_mstr then
                        chg_status = loc_status.
 
                     else
                        for first si_mstr where si_domain = global_domain
                           and si_site   = site
                        no-lock:
                          chg_status = si_status.
                        end.  /* FOR FIRST si_mstr */
 
                  end. /* ELSE DO: */
 
               end. /* IF status_actv = no */
 
               if c-application-mode = "API" then
                  run setPurchaseOrderTransDetRow in apiMethodHandle
                     (input ttPurchaseOrderTransDet.apiSequence).
 
               do on error undo, return error return-value:
 
                  assign cOldInventoryStatus = chg_status.  /*R021*/
 
                  {us/bbi/gprun.i ""porcat02.p""
                     "(input  recid(pod_det),
                             input  chg_attr,
                             input  eff_date,
                             input-output chg_assay,
                             input-output chg_grade,
                             input-output chg_expire,
                             input-output chg_status,
                             input-output assay_actv,
                             input-output grade_actv,
                             input-output expire_actv,
                             input-output status_actv)"}
               end.

               if l_validateInv
               then do:
                  /*TEST FOR ATTRIBUTE CONFLICTS*/
                  {us/px/pxrun.i &PROC='validateAttributes' &PROGRAM='porcxr1.p'
                     &PARAM="(buffer pod_det,
                                    input  eff_date,
                                    input  chg_assay,
                                    input  chg_grade,
                                    input  chg_expire,
                                    input  chg_status,
                                    input  assay_actv,
                                    input  grade_actv,
                                    input  expire_actv,
                                    input  status_actv)"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
    
                  if return-value <> {&SUCCESS-RESULT} then do:
                     next-prompt site.
                     undo locloop, retry.
                  end.
               end. /* IF l_validateInv */ 
            end. /* IF AVAIL ATTR_WKFL..*/
 
            if not multi_entry and
               (execname = "poporc.p"  or           /* PO Receipts */
                execname = "fsrtvrc.p" or           /* RTS Receipts */
                execname = "fsrtvis.p") then        /* RTS Shipments */
            do:
               /* Update Restriction Procedure Library */
               run mfairunh.p
                  (input "mgurpl.p",
                   input ?,
                   output hUpdateRestrictedLibrary).
 
               /* Update Restriction Constants */
               {us/mg/mgurpl.i "hUpdateRestrictedLibrary"}
 
               /* VALIDATE IF THE USER UPDATE IS RESTRICTED */
               /* CLEAR TEMP TABLE RECORDS BEFORE CREATING NEW RECORD */
               empty temp-table ttUpdateRestrictionSignature.
 
               /* CREATE TEMP-TABLE RECORD */
               create ttUpdateRestrictionSignature.
               assign
                  ttUpdateRestrictionSignature.program               = execname
                  ttUpdateRestrictionSignature.category
                                               = if execname = "poporc.p"
                                                 then {&PORCT}
                                                 else {&SSM}
                  ttUpdateRestrictionSignature.part                  = pod_part
                  ttUpdateRestrictionSignature.account               = ?
                  ttUpdateRestrictionSignature.subAccount            = ?
                  ttUpdateRestrictionSignature.costCenter            = ?
                  ttUpdateRestrictionSignature.project               = ?.
 
               /* Check if the inventory status has changed */
               if chg_attr and
                  chg_status <> cOldInventoryStatus then
               do:
                  /* Yes, it has changed */
                  assign
                     ttUpdateRestrictionSignature.inventoryStatus
                                                  = cOldInventoryStatus
                     ttUpdateRestrictionSignature.inventoryStatusTo
                                                  = chg_status
                     ttUpdateRestrictionSignature.changeInventoryStatus = yes.
               end.
               else do:
                  /* No, it has not changed */
                  assign
                     ttUpdateRestrictionSignature.inventoryStatus
                                                  = cOldInventoryStatus
                     ttUpdateRestrictionSignature.inventoryStatusTo     = ?
                     ttUpdateRestrictionSignature.changeInventoryStatus = ?.
               end.
 
               assign cOldInventoryStatus = "".
 
               if execname = "poporc.p" then   /* PO Receipts */
               do:
                  run getInventoryStatusCodeValue
                         in hUpdateRestrictedLibrary
                         (input  global_site,
                          input  location,
                          input  global_part,
                          input  lotserial,
                          input  lotref,
                          output cInventoryStatus).
 
                  assign
                     ttUpdateRestrictionSignature.site       = global_site
                     ttUpdateRestrictionSignature.siteTo     = ?
                     ttUpdateRestrictionSignature.location   = global_loc
                     ttUpdateRestrictionSignature.locationTo = ?.
               end.
               else do:
                  if execname = "fsrtvrc.p" then    /* RTS Receipts */
                  do:
                     /* We need to get the issuing/receiving Site and */
                     /* Location values                               */
                     for first rmd_det where rmd_domain = global_domain
                        and rmd_nbr    = pod_nbr
                        and rmd_part   = pod_part
                        and rmd_line   = pod_line
                        and rmd_prefix = "V"
                        and rmd_type   = "I"
                     no-lock: end.
 
                     assign
                        ttUpdateRestrictionSignature.site       = rmd_site
                        ttUpdateRestrictionSignature.siteTo     = global_site
                        ttUpdateRestrictionSignature.location   = rmd_loc
                        ttUpdateRestrictionSignature.locationTo = global_loc.
                  end.
 
                  else if execname = "fsrtvis.p" then /* RTS Shipments */
                  do:
                     /* We need to get the issuing/receiving Site and */
                     /* Location values                               */
                     for first rmd_det where rmd_domain = global_domain
                        and rmd_nbr    = pod_nbr
                        and rmd_part   = pod_part
                        and rmd_line   = pod_line
                        and rmd_prefix = "V"
                        and rmd_type   = "O"
                     no-lock: end.
 
                     assign
                        ttUpdateRestrictionSignature.site       = global_site
                        ttUpdateRestrictionSignature.siteTo     = rmd_site
                        ttUpdateRestrictionSignature.location   = global_loc
                        ttUpdateRestrictionSignature.locationTo = rmd_loc.
                  end.
               end.
 
               if isUpdateRestricted
                  (input table ttUpdateRestrictionSignature,
                   input true)
               then do:
                  undo locloop, retry.
               end.
 
               delete procedure hUpdateRestrictedLibrary no-error.
 
            end.        /* end if lookup */
 
         end. /* LOCLOOP: DO ON ERROR..*/
 
         pod_qty_chg = total_lotserial_qty.
 
         /* CHECK OPERATION QUEUE QTY'S */
         {us/bbi/gprun.i ""poporca6.p""
            "(input ""receipt"",
                    input pod_nbr,
                    input wolot,
                    input woop,
                    input move)"}
 
         {us/px/pxrun.i &PROC='setTotalReceived' &PROGRAM='porcxr1.p'
            &PARAM="(input use_pod_um_conv,
                          input total_lotserial_qty,
                          input conv_to_pod_um,
                          input pod_qty_rcvd,
                          input pod_um_conv,
                          output total_received)"
            &NOAPPERROR=true
            &CATCHERROR=true}
 
         /* If it's an RTS shipment(issue) all pod_det qty fields are */
         /* expressed in negative numbers.  For correct calculations  */
         /* of pod_bo_chg and ultimately tr_hist back order qty,      */
         /* switch the sign of total_received.                        */
 
         if pod_rma_type = "O" then
            total_received = total_received * -1.
 
         {us/px/pxrun.i &PROC='setBackOrder' &PROGRAM='porcxr1.p'
            &PARAM="(input cancel_bo,
                           input total_received,
                           input eff_date,
                           input conv_to_pod_um,
                           buffer pod_det,
                           input total_lotserial_qty,
                           input-output qopen)"
            &NOAPPERROR=true
            &CATCHERROR=true}
 
         assign
            pod_rum_conv = conv_to_pod_um
            pod_rum = receipt_um
            pod_ps_chg = packing_qty.
 
         /* Only update blanket order if user requests update */
         updt_blnkt = no.
 
         /*@MODULE wiplottrace BEGIN*/
         if pod_type = 's'
         then
            {us/bbi/gprun.i ""porwiplt.p""
                     "(input  recid(pod_det),
                       input  wolot,
                       input  woop,
                       input  move,
                       input-output table tt_po_lineqty,
                       output undo_all)"}
 
         if pod_type = 's' and
            undo_all then undo lineloop, retry lineloop.
         /*@MODULE wiplottrace END*/
 
         /* UPDT_BLNKT_LIST IS A COMMA SEPARATED LIST OF ALL POD_LINE
         NUMBERS WHICH MUST HAVE THE BLANK PO RELEASE QUANTITY UPDATED
 
         IF THE USER IS MODIFYING THE RECORD, IT IS POSSIBLE THAT
         OF UPDT_BLNK_LIST HAS BEEN PRVIOUSLY UPDATED TO SHOW UPDT_BLNK =
         YES, IF SO, REMOVE ANY PREVIOUSLY FLAG SETTINGS BECUASE THE USER
         WILL BE PROMPTED AGAIN.
         W-INT1 = THE POSITION THE LINE NUMBER NEEDING REMOVAL STARTS ON
         W-INT2 = THE POSITION THE COMMA AFTER THE LINE NUMBER IS ON
         */
 
         if can-do(updt_blnkt_list,string(pod_line)) then
         assign
            w-int1 = index(updt_blnkt_list, string(pod_line))
            w-int2 = (index(substring(updt_blnkt_list,w-int1),
            ",")) + w-int1 - 1
            updt_blnkt_list =
            substring(updt_blnkt_list,1,w-int1 - 1) +
            substring(updt_blnkt_list,w-int2 + 1).
 
         if  pod_rma_type = "O"
         and pod_qty_ord  < 0
         then
            total_received = total_received * -1.
 
         /* OVER-RECEIPT TOLERANCE CHECKS */
         if pod_sched or (not pod_sched and
            (total_received > pod_qty_ord and pod_qty_ord >= 0) or
            (total_received < pod_qty_ord and pod_qty_ord < 0)) then do:
 
            pod_recno = recid(pod_det).
            if c-application-mode = "API" then
               run setPurchaseOrderTransDetRow in apiMethodHandle
                  (input ttPurchaseOrderTransDet.apiSequence).
 
            {us/bbi/gprun.i ""poporca4.p"" "(output yn)"}
            if yn then undo lineloop, retry lineloop.
         end. /* IF POD_SCHED OR (NOT POD_SCHED AND */
         /*@TO-DOEND*/
 
         if  pod_rma_type = "O"
         and pod_qty_ord  < 0
         then
            total_received = total_received * -1.
 
         if cmmt_yn then do:
            if c-application-mode <> "API" then
               run hide-frames.
 
            assign
               cmtindx = pod_cmtindx
               global_ref = caps(getTermLabel("RCPT",8)) + ": "
                            + pod_nbr + "/" + string(pod_line).
 
            if c-application-mode = "API" then do:
               {us/gp/gpttcp.i ttPurchaseOrderTransDetCmt
                     ttTransComment
                     "    ttPurchaseOrderTransDetCmt.nbr  = pod_det.pod_nbr
                      and ttPurchaseOrderTransDetCmt.line = pod_det.pod_line
                     "
                     true}
               run setTransComment in apiMethodHandle
                  (input table ttTransComment).
            end.
            do on error undo, return error return-value:
               {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""pod_det"")"}
            end.
            pod_cmtindx = cmtindx.
         end. /* IF CMMT_YN */
 
         if pod_type = 's' and
            (lotserial_qty <> 0) or (lotserial_qty = 0 and cancel_bo = yes)
            and c-application-mode <> "API"
         then do:
            run get-subshipper-info
               (input-output table tt_shipper_scroll,
                input pod_site,
                input po_vend,
                input lotserial_qty,
                input pod_part,
                input pod_nbr,
                input line,
                input woop,
                input-output wolot,
                input no, /*po shipper*/
                output manual_update).
 
         end. /* IF POD_TYPE = 'S' */

         {us/bbi/gprun.i ""gpshpdat.p"" "(input lgdkey,
                                          input pod_nbr,
                                          input pod_line,
                                          output l_cont)"}
 
         if not l_cont then do:
            {us/bbi/pxmsg.i &MSGNUM=12688 &ERRORLEVEL=3}
            undo lineloop, retry lineloop.
         end.
 
      end. /* DO TRANSACTION */
   end. /* lineloop: repeat: */
empty temp-table tt_po_lineqty.
      do on endkey undo edit-loop, leave edit-loop
         on error undo, leave:
          
          assign
            ponbr           = po_nbr
            l_remove_srwkfl = yes
            yn              = yes.
         if not batchrun then do:
         if porec then
            /* DISPLAY PURCHASE ORDER LINES BEING RECEIVED? */
            msgnbr  = 340.
         else
            /* DISPLAY ITEMS BEING ISSUED? */
            msgnbr  = 636.
 
         {us/bbi/pxmsg.i &MSGNUM=msgnbr &ERRORLEVEL={&INFORMATION-RESULT}
            &CONFIRM=yn}
         end.  /*if not batchrun*/
         /* Display purchase order lines being received ? */
         if yn then do:
 
            if c-application-mode <> "API" then
               run hide-frames.

            for each pod_det where pod_domain = global_domain
               and pod_nbr = po_nbr
               and pod_status <> "c"
               and pod_status <> "x"
               and pod_qty_chg <> 0 no-lock
            use-index pod_nbrln ,
                each sr_wkfl where sr_domain = global_domain
               and sr_userid = SessionUniqueID
               and sr_lineid = string(pod_line)
            with width 80:
               if sr_qty > 0 then do:
                  /* Check Result against attribute specification */
                  {us/px/pxrun.i &PROC      ='validateAttrSpec'
                                 &PROGRAM   ='caatdxr.p'
                                 &HANDLE    = ph_caatdxr
                                 &PARAM     ="(input sr_wkfl.oid_sr_wkfl,
                                             input-output table tt_attr_pfvalue by-reference)"
                                 &NOAPPERROR=true
                                 &CATCHERROR=true
                  }
               end.
               else if sr_qty < 0 then do:
                  /* Check Result against attribute specification */
                  {us/px/pxrun.i &PROC      ='validateAttrSpec'
                                 &PROGRAM   ='caisxr.p'
                                 &HANDLE    = ph_caatdxr
                                 &PARAM     ="(input sr_wkfl.oid_sr_wkfl,
                                             input-output table tt_attr_pfvalue by-reference)"
                                 &NOAPPERROR=true
                                 &CATCHERROR=true
                  }
               end.

               validationPass = "".
               find first tt_attr_pfvalue
                  where tt_attr_pfvalue.tt_oid_attrpf_mstr = sr_wkfl.oid_sr_wkfl
               no-lock no-error.

               if available tt_attr_pfvalue then do:
                  if can-find (first tt_attr_pfvalue
                               where tt_attr_pfvalue.tt_oid_attrpf_mstr = sr_wkfl.oid_sr_wkfl
                               and tt_attr_pfvalue.tt_attrpfd_validate_result = no)
                  then do:
                     validationPass = getTermLabelRt('NON-CONFORM', 12).
                  end.
                  else do:
                     validationPass = getTermLabelRt('CONFORM', 12).
                  end.
               end.
 
               if c-application-mode <> "API" then
                  display
                     pod_line
                     pod_part
                     sr_site
                     sr_loc column-label "Location!Ref"
                     sr_lotser column-label "Lot/Serial!Supplier Lot"
                               format "x(22)"
                     sr_qty with frame e.
 
               if sr_ref <> "" or sr_vend_lot <> "" or validationPass <> "" then do:
                  if c-application-mode <> "API" then
                     down 1 with frame e.
                  /* DISPLAY RECORDS WITH CORRECT ALIGNMENT IN NETUI */
                  {us/gp/gpwait.i &INSIDELOOP=yes &FRAMENAME=e}
                  if c-application-mode <> "API" then
                     display
                        sr_ref @ sr_loc
                        sr_vend_lot @ sr_lotser
                        validationPass @ sr_qty with frame e.
 
               end. /* IF SR_REF <> "" OR SR_VEND_LOT <> "" */
 
               if c-application-mode <> "API" 
               then
                  down 1 with frame e.

               {us/gp/gpwait.i &INSIDELOOP=yes &FRAMENAME=e}
 
            end. /* FOR EACH POD_DET..*/
 
            {us/gp/gpwait.i &OUTSIDELOOP=yes}
 
         end. /* IF YN */
 
      end. /* DO ON ENDKEY..*/
 
      do on endkey undo edit-loop, leave edit-loop
         on error undo edit-loop, leave edit-loop:
 
         assign
            proceed = no
            yn      = yes.
         if not batchrun then do:
         /* IS ALL INFORMATION CORRECT */
         {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=yn}
         end.  /*if not batchrun*/ 
         l_remove_srwkfl = no.

         if yn then do:
 
            /* Global Shipping: Legal Documents */
            for first po_mstr where po_domain = global_domain
               and po_nbr = ponbr
            no-lock:
 
               for first pod_det where pod_domain = global_domain
                  and pod_nbr = po_nbr
                  and pod_qty_chg <> 0
               no-lock:
 
                  /* Get Inventory Movement Code and Form Code */
                  {us/bbi/gprun.i ""gpimfcmt.p"" "
                     (input  po_vend,
                      input  """",
                      input  pod_site,
                      input  """",
                      input  'RCT-PO',
                      output p_inv_mov,
                      output c_form_code,
                      output c_ld_form_code,
                      output l_undo)"}
 
                  if l_undo then undo, retry.

                  assign
                     c_shipfrom = po_vend
                     c_shipto   = pod_site.
               end.
            end.
 
            if p_inv_mov <> "" and p_inv_mov <> ?
            then do:
               for each pod_det no-lock  where pod_det.pod_domain = global_domain and
                  pod_nbr     eq po_nbr and
                  pod_qty_chg ne 0,
               each sr_wkfl no-lock  where sr_wkfl.sr_domain = global_domain and
                  sr_userid eq SessionUniqueID and
                  sr_lineid eq string(pod_line):
                  for first pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
                     pt_part eq pod_part:
                  end.

                  /* Add to shipper line item temp table */
                  {us/bbi/gprun.i
                     ""icshmt1a.p""
                     "(pod_nbr,
                       pod_line,
                       pod_part,
                       sr_lotser,
                       sr_ref,
                       sr_site,
                       sr_loc,
                       sr_qty,
                       pod_um,
                       pod_um_conv,
                       if available pt_mstr
                       then
                          absolute(pt_net_wt * sr_qty * pod_um_conv)
                       else
                          0,
                       if available pt_mstr
                       then
                          pt_net_wt_um
                       else
                          """",
                       if available pt_mstr
                       then
                          pt_size * sr_qty * pod_um_conv
                       else
                          0,
                       if available pt_mstr
                       then
                          pt_size_um
                       else
                          """" )" }

                  v_lines_found = true.
               end.
 
               /* Get shipper id, ld nbr and shipper detail */
               if not poc_fiscal_confirm or (issueld) then do:
                  /* Create or add to shipper */
                  if v_lines_found then do:
                     for first qad_wkfl exclusive-lock where
                               qad_domain = global_domain
                           and qad_key1 = "INV_MOV_RCT-PO"
                           and qad_key2 = SessionUniqueID:
                     end.

                     if not available qad_wkfl then do:
                        create qad_wkfl.
                        assign
                           qad_domain = global_domain
                           qad_key1 = "INV_MOV_RCT-PO"
                           qad_key2 = SessionUniqueID.

                        if recid(qad_wkfl) = -1 then.
                     end.
                     qad_charfld[1] = p_inv_mov.
                     release qad_wkfl.

                     /* Run the hook here to pass Ship-from and Ship-to    */
                     /* So that for negative PO Receipts, Ship-from and    */
                     /* Ship-to will be switched to function similar to    */
                     /* PO Returns. Do it only for returns in PO Receipts. */
                     for first im_mstr where im_domain = global_domain
                        and im_inv_mov = p_inv_mov
                     no-lock:
                        v_imflow = im_flow.
                     end.
                     l_cont = yes.
                     if v_imflow = 2 then do:
                         {us/bbi/gprun.i ""gppordat.p"" "(input c_shipfrom,
                                                          input c_shipto,
                                                          input-output table t_abs,
                                                          output l_cont)"}
                     end.

                     if l_cont then do:
                        {us/bbi/gprun.i
                           ""icshmt.p""
                           "(c_shipfrom,
                             c_shipto,
                             'RCT-PO',
                             eff_date,
                             ""no"",
                             output v_abs_recid,
                             output o_trflow_flg)" }
                     end.

                     if c-application-mode = "API" and return-value = {&APP-ERROR-RESULT}
                        then return {&APP-ERROR-RESULT}.

                     if inv_mov    = "" then
                        inv_mov    = p_inv_mov.

                     for first abs_mstr where recid(abs_mstr) = v_abs_recid
                     no-lock:
                        if shippernbr = "" then
                           shippernbr = substring(abs_id,2).
                     end.
                  end.  /* if v_lines_found */
               end.
               else
                  o_trflow_flg = no.

               /* Update exchange rate and calculate the LD amounts */
               {us/gp/gprunp.i "soldxr" "p" "updateExchangeRateForLD"
                               "(input v_abs_recid,
                                 input exch_rate,
                                 input exch_rate2)"}
 
               run assignPackingSlip(input v_abs_recid).
 
               /* If transaction happens in same site, different
                  locations, set original site value to abs_site */
               for first abs_mstr
                  where recid(abs_mstr) = v_abs_recid
               exclusive-lock:
 
                  assign
                     abs_site = site.
               end.
 
               do transaction:
                  find qad_wkfl where qad_domain = global_domain
                    and qad_key1 = "ABS_ID"
                    and qad_key2 = SessionUniqueID
                  exclusive-lock no-error.
                  if not available qad_wkfl then do:
                     create qad_wkfl.
                     assign
                        qad_domain = global_domain
                        qad_key1 = "ABS_ID"
                        qad_key2 = SessionUniqueID.
                     if recid(qad_wkfl) = -1 then.
                  end.
                  assign
                     qad_intfld[1] = integer(v_abs_recid).
               end.
 
               /* If it is recognized as issuing, assign lgd nbr */
               for first pod_det where pod_domain = global_domain
                  and pod_nbr = ponbr
                  and pod_qty_chg <> 0
               no-lock:
                  if pod_fsm_type = "RTS-ISS" or issueld
                  then do:
                     {us/bbi/gprun.i ""gpldnbr.p"" "(input v_abs_recid)"}
                  end.
               end.
 
               /* For PO Return, we need to record the generated LD.
                  Also set the status to Confirmed. */
               run recordLegalNbr.
 
               /* Complement Salejob and remarks for legal document */
               {us/bbi/gprun.i ""icshldm1.p""
                  "(input v_abs_recid,
                    input '',
                    input '')"}
 
               if o_trflow_flg = yes then do:
 
                  /* COLLECT INFO FOR THE LEGAL DOCUMENT */
                  if available abs_mstr then do:
                     {us/gp/gprunp.i "soldxr" "p" "saveLegalSiteLoc"
                        "(input abs_id,
                          input po_vend,
                          input """",
                          input pod_site,
                          input location)"}
                  end.
 
                  /* Print Legal Document */
                  if not (poc_fiscal_confirm and issueld) then do:
                     {us/bbi/gprun.i ""icldprt.p"" "(input v_abs_recid)"}
                  end.
                  else do:
				  
					 if lv_auto_ers = yes and poc_ers_proc = yes and porec = yes
					 then do:
						view frame warning-frame.
						display 
							warning-message1
							warning-message2
							warning-message3
							warning-message4
						with frame warning-frame.
					end.
				  
                     if lgdnbr <> "" then do:
                        /* LEGAL DOCUMENT # HAS BEEN GENERATED */
                        {us/bbi/pxmsg.i &MSGNUM=11144 &ERRORLEVEL=1 &MSGARG1=lgdnbr}
                        pause.
                     end.
 
                     hide all no-pause.
                     display
                        dtitle format "x(78)"
                     with no-labels color messages
                     width 80 row 1 column 1
                     frame dtitle no-box.
                  end. /* if poc_fiscal_confirm and issueld */
               end.
            end.
 
            /* CHECK FOR RECEIPTS OF DIFFERENT ITEMS ON A   */
            /* SINGLE ITEM LOCATION                         */
            for each sr_wkfl where sr_domain = global_domain
               and sr_userid = SessionUniqueID
            no-lock:
 
               {us/px/pxrun.i &PROC='validateSingleItemOrLotSerialLocation'
                  &PROGRAM='porcxr2.p'
                  &PARAM="(input sr_site,
                                    input sr_loc,
                                    input sr_lotser,
                                    input sr_ref,
                                    input po_nbr,
                                    input integer(sr_lineid),
                                    input no)"
                  &NOAPPERROR=true
                  &CATCHERROR=true}
 
               if return-value <> {&SUCCESS-RESULT} then
                  undo edit-loop, retry edit-loop.
 
               if sr_qty < 0
               then do:
 
                  for first pod_det where pod_domain = global_domain
                       and pod_nbr  = po_nbr
                       and pod_line = integer(sr_lineid)
                  no-lock: end.
 
                  /* FOR A NEGATIVE RECEIPT AGAINST A CONSIGNED LINE      */
                  /* CHECK WHETHER A POSITIVE RECEIPT EXISTS FOR THE LINE */
                  if available pod_det and pod_consignment
                  then do:
                     for each cnsix_mstr where cnsix_domain = global_domain
                        and cnsix_part     = pod_part
                        and cnsix_site     = pod_site
                        and cnsix_po_nbr   = pod_nbr
                        and cnsix_pod_line = pod_line
                        and cnsix_lotser   = sr_lotser
                        and cnsix_ref      = sr_ref
                     no-lock:
                        if can-find(first   tr_hist
                                      where tr_domain = global_domain
                                      and   tr_trnbr  = cnsix_receipt_trnbr
                                      and   tr_loc    = sr_loc)
                        then
                           accumulate cnsix_qty_consigned (total).
                     end. /* for each cnsix */
 
                     if (accum total cnsix_qty_consigned) < absolute(sr_qty)
                     then do:
                        /* NO CONSIGNED INVENTORY CAN BE RETURNED FOR PO LINE */
                        run displayMessage2 (input 6303,
                                             input 3,
                                             input pod_nbr,
                                             input string(pod_line)).
 
                        undo edit-loop, retry edit-loop.
                     end. /* if accum total */
 
                  end. /* IF AVAILABLE pod_det */
 
               end. /* IF sr_qty < 0 */
 
            end.  /* FOR EACH SR_WKFL */
            if p_int_ref_type = {&TYPE_PO} 
            then do:

               {us/px/pxrun.i &PROC='pCalculateLineCharges' &PROGRAM='lagenpro.p'
                        &HANDLE=ph_lagenpro
                        &PARAM="(input recid(po_mstr),input '{&TYPE_PO}')"
                        &NOAPPERROR=true &CATCHERROR=true}
            end. /* if execname = "poporc.p" */
            proceed = yes.
            leave.
         end.  /* IF YN */
 
         else do:
            /* User should be able to quit in GUI if a wrong PO is received.
              Here, if the user selects 'No' to all information correct then
              he will be asked to confirm exiting the PO Receipt. */
            if {us/bbi/gpiswrap.i} then do:
               /* Please confirm exit. */
               {us/bbi/pxmsg.i &MSGNUM=36 &ERRORLEVEL=1 &CONFIRM=l_exit_yn}
               if l_exit_yn then do:
                  proceed = no.
                  l_remove_srwkfl = yes.
                  undo, leave.
               end. /* IF l_exit_yn then */
            end. /* IF {us/bbi/gpiswrap.i} THEN DO: */
 
         end. /* ELSE DO: */
 
      end. /* do on endkey..*/
end. /* edit-loop */
 
if c-application-mode <> "API" then
   run hide-frames.
 
if l_remove_srwkfl then
   for each sr_wkfl where sr_domain = global_domain
      and sr_userid = SessionUniqueID
   exclusive-lock:
      delete sr_wkfl.
   end. /* IF l_remove_srwkfl */

unsubscribe to "getPrompt".
unsubscribe to "setPrompt".
unsubscribe to "doInvCheck".
unsubscribe to "doCumOrderCheck".
 
/* ========================================================================== */
/* *************************** INTERNAL PROCEDURES ************************** */
/* ========================================================================== */
  
PROCEDURE display-detail:
/*------------------------------------------------------------------
PURPOSE :   Display details in frame d.
PARAMETERS:
NOTES:      Added for ECO N05Q to help reduce action segment size
------------------------------------------------------------------*/
 
   display
      line
      pod_det.pod_qty_chg @ lotserial_qty
      pod_det.pod_ps_chg  @ packing_qty
      ln_stat             @ cancel_bo
      pod_det.pod_part
      pod_det.pod_vpart
      pod_det.pod_rum     @ receipt_um
      pod_det.pod_wo_lot  @ wolot
      pod_det.pod_op      @ woop
   with frame d.
 
END PROCEDURE.
  
PROCEDURE hide-frames:
/*------------------------------------------------------------------
PURPOSE :   Hides the frames c, d and cship.
PARAMETERS:
NOTES:      Added for ECO N05Q to help reduce action segment size
------------------------------------------------------------------*/
   hide frame c     no-pause.
   hide frame cship no-pause.
   hide frame d     no-pause.
 
END PROCEDURE.
 
/*============================================================================*/
PROCEDURE init_poline_bkfl_input_output:
/*------------------------------------------------------------------
PURPOSE :
PARAMETERS:
NOTES:
-----------------------------------------------------------------*/
 
   run init_poline_bkfl_input_wip_lot in h_wiplottrace_procs.
 
   run init_poline_bkfl_output_wip_lot in h_wiplottrace_procs.
 
END PROCEDURE.
  
/*PROCEDURE WILL DISPLAY THE ITEM DESCRIPTION */
PROCEDURE get_pt_description:
/*------------------------------------------------------------------
PURPOSE :
PARAMETERS:
NOTES:
-----------------------------------------------------------------*/
   define input parameter p_pod_part like pt_part  no-undo.
   define input parameter p_pod_desc like pod_desc no-undo.
 
   define variable p_pt_desc1 like pt_desc1 no-undo.
   define variable p_pt_desc2 like pt_desc2 no-undo.
 
   for first pt_mstr where pt_domain = global_domain
      and pt_part   = p_pod_part
   no-lock: end.
 
   if available pt_mstr
   then
      assign
         p_pt_desc1 = pt_desc1
         p_pt_desc2 = pt_desc2.
   else
      assign
         p_pt_desc1 = p_pod_desc
         p_pt_desc2 = "".
 
   /* DESCRIPTION: p_pt_desc1 + p_pt_desc2 */
   {us/bbi/pxmsg.i &MSGNUM=2685 &ERRORLEVEL=1
            &MSGARG1=getTermLabel('DESCRIPTION',45)
            &MSGARG2='":"'
            &MSGARG3=p_pt_desc1
            &MSGARG4=p_pt_desc2}
 
END PROCEDURE. /* get_pt_description */
 
PROCEDURE displayMessage:
/*------------------------------------------------------------------
PURPOSE :
PARAMETERS:
NOTES:
-----------------------------------------------------------------*/
    define input parameter ipMsgNum as integer no-undo.
    define input parameter ipErrorLevel as integer no-undo.
 
    {us/bbi/pxmsg.i &MSGNUM=ipMsgNum &ERRORLEVEL=ipErrorLevel}
 
END PROCEDURE. /* displayMessage */
 
PROCEDURE lotserialvalidation:
/*--------------------------------------------------------------------------
PURPOSE :  For serialized item, ensure there aren't multiple sr_wkfl's
           for the current serial number.
PARAMETERS:
NOTES:      Added 6th and 7th parameters to the validateLotSerialAlreadyUsed
            procedure as po number and item in order to make the validation
            limited only to the same item when Lot control level is 0/1
----------------------------------------------------------------------------*/
   define input  parameter ip_lot_ser   as character     no-undo.
   define input  parameter ip_lotserial as character     no-undo.
   define input  parameter ip_site      as character     no-undo.
   define input  parameter ip_line      as integer       no-undo.
   define input  parameter ip_lotref    as character     no-undo.
   define input  parameter ip_pod_nbr   as character     no-undo.
   define input  parameter ip_part      as character     no-undo.
   define input  parameter ip_location  as character     no-undo.
   define input  parameter ip_lot_rcpt  like mfc_logical no-undo.
   define output parameter op_undo       like mfc_logical no-undo.
   if can-do("s,l",ip_lot_ser)
      and   ip_lotserial = ""
      and   l_route
   then do:
      /* LOT/SERIAL NUMBER REQUIRED */
      {us/bbi/pxmsg.i &MSGNUM=1119 &ERRORLEVEL=3}
      next-prompt
         lotserial
      with frame d.
      op_undo = true.
      leave.
 
   end. /* IF can-do */
 
   {us/px/pxrun.i &PROC='validateLotSerialAlreadyUsed'
      &PROGRAM='porcxr2.p'
      &PARAM="(input ip_lot_ser,
               input ip_lotserial,
               input ip_site,
               input integer(ip_line),
               input ip_lotref,
               input ip_pod_nbr ,
               input ip_part,
               input ip_location )"
      &NOAPPERROR=True
      &CATCHERROR=True}
 
   if return-value <> {&SUCCESS-RESULT}
   then do:
      next-prompt
         lotserial
      with frame d.
      op_undo = true.
      leave.
   end. /* if return-value <> {&SUCCESS-RESULT} */
 
   {us/px/pxrun.i &PROC='validateLotSerialUsage'
      &PROGRAM='cllotxr.p'
      &PARAM="(input ip_part,
               input ip_lot_ser,
               input ip_lot_rcpt,
               input yes,
               input ip_lotserial)"
      &NOAPPERROR=true
      &CATCHERROR=true}
 
   if return-value <> {&SUCCESS-RESULT}
   then do:
      next-prompt
         lotserial
      with frame d.
      op_undo = true.
      leave.
   end. /* IF  return-value <> {&SUCCESS-RESULT} */
 
 
 
END PROCEDURE. /* lotserialvalidation */
 
PROCEDURE p_create_t_sr_wkfl:
/*------------------------------------------------------------------
PURPOSE :
PARAMETERS:
NOTES:
-----------------------------------------------------------------*/
   define input        parameter l_mfguser           as   character   no-undo.
   define input        parameter l_cline             as   character   no-undo.
   define input        parameter l_site              like si_site     no-undo.
   define input        parameter l_location          as   character   no-undo.
   define input        parameter l_lotserial         as   character   no-undo.
   define input        parameter l_lotref            as   character   no-undo.
   define input        parameter l_lotserial_qty     like lotserial_qty
                                                                      no-undo.
   define input-output parameter table               for  t_sr_wkfl.
 
   if not can-find(first t_sr_wkfl
                      where t_sr_userid = l_mfguser
                      and   t_sr_lineid = l_cline)
   then do:
      create t_sr_wkfl.
      assign
         t_sr_userid = l_mfguser
         t_sr_lineid = l_cline
         t_sr_site   = l_site
         t_sr_loc    = l_location
         t_sr_lotser = l_lotserial
         t_sr_ref    = l_lotref
         t_sr_qty    = l_lotserial_qty.
   end. /* IF NOT CAN-FIND(FIRST ... */
 
END PROCEDURE. /* p_create_t_sr_wkfl */
 
PROCEDURE p_create_default_sr_wkfl:
/*------------------------------------------------------------------
PURPOSE :
PARAMETERS:
NOTES:
-----------------------------------------------------------------*/
   define input        parameter l_update_sr_wkfl    like mfc_logical no-undo.
   define input        parameter l_mfguser           as   character   no-undo.
   define input        parameter l_cline             as   character   no-undo.
   define              parameter buffer sr_wkfl      for  sr_wkfl.
   define input-output parameter table               for  t_sr_wkfl.
   define input-output parameter l_delete_sr_wkfl    like mfc_logical no-undo.
 
   /* RE-CREATE DEFAULT sr_wkfl, IF sr_wkfl IS NOT UPDATED IN MULTI ENTRY */
   /* SCREEN. SO THE INVENTORY VALIDATION CAN BE DONE.                    */
 
   if l_delete_sr_wkfl
   then do:
 
      if not l_update_sr_wkfl
      then do:
 
         if not can-find(first sr_wkfl
                            where sr_domain = global_domain
                            and   sr_userid = l_mfguser
                            and   sr_lineid = l_cline)
         then do:
 
            for first t_sr_wkfl
               where t_sr_userid = l_mfguser
               and   t_sr_lineid = l_cline
            no-lock:
 
               create sr_wkfl.
               assign
                  sr_domain           = global_domain
                  sr_userid           = t_sr_userid
                  sr_lineid           = t_sr_lineid
                  sr_site             = t_sr_site
                  sr_loc              = t_sr_loc
                  sr_lotser           = t_sr_lotser
                  sr_ref              = t_sr_ref
                  sr_qty              = t_sr_qty.
 
               if recid(sr_wkfl) = -1
               then
                  .
            end. /* FOR FIRST t_sr_wkfl */
 
         end. /* IF NOT CAN-FIND(FIRST ... */
      end. /* IF NOT l_update_sr_wkfl */
 
      else do:
 
         /* DELETE TEMP-TABLE RECORD TO INDICATE DEFAULT sr_wkfl */
         /* IS UPDATED IN MULTI-ENTRY SCREEN                     */
 
         find first t_sr_wkfl
            where t_sr_userid = l_mfguser
            and   t_sr_lineid = l_cline
            exclusive-lock no-error.
 
         if available t_sr_wkfl
         then
            delete t_sr_wkfl.
 
      end. /* ELSE DO */
 
      l_delete_sr_wkfl = no.
 
   end. /* IF l_delete_sr_wkfl */
 
END PROCEDURE. /* p_create_default_sr_wkfl */
 
PROCEDURE p_delete_sr_wkfl:
/*------------------------------------------------------------------
PURPOSE :
PARAMETERS:
NOTES:
-----------------------------------------------------------------*/
   define input        parameter l_mfguser           as   character   no-undo.
   define input        parameter l_cline             as   character   no-undo.
   define input        parameter table               for  t_sr_wkfl.
   define input-output parameter l_tot_lotserial_qty like pod_qty_chg no-undo.
   define input-output parameter l_delete_sr_wkfl    like mfc_logical no-undo.
 
   define buffer sr_wkfl for sr_wkfl.
 
   for first t_sr_wkfl
      where t_sr_userid = l_mfguser
      and   t_sr_lineid = l_cline
      no-lock,
      first sr_wkfl
         where sr_domain  = global_domain
         and   sr_userid  = t_sr_userid
         and   sr_lineid  = t_sr_lineid
         and   sr_site    = t_sr_site
         and   sr_loc     = t_sr_loc
         and   sr_lotser  = t_sr_lotser
         and   sr_ref     = t_sr_ref
         exclusive-lock:
 
         assign
            l_tot_lotserial_qty = 0
            l_delete_sr_wkfl    = yes.
 
         delete sr_wkfl.
 
   end. /* FOR FIRST t_sr_wkfl */
 
END PROCEDURE. /* p_delete_sr_wkfl */
 
PROCEDURE get-subshipper-info:
/*------------------------------------------------------------------
PURPOSE :   Prompts the user for subshipper information for the line
            received if the line type is (S)ubcontract.
PARAMETERS:
NOTES:
------------------------------------------------------------------*/
   define input-output parameter table for tt_shipper_scroll.
   define input parameter ip_pod_site like pod_site no-undo.
   define input parameter ip_vend      like po_vend no-undo.
   define input parameter ip_po_rcpt_qty as decimal no-undo.
   define input parameter ip_part like pod_part no-undo.
   define input parameter ip_po_nbr   like po_nbr   no-undo.
   define input parameter ip_po_line like pod_line no-undo.
   define input parameter ip_po_woop like pod_op no-undo.
   define input-output parameter io_pod_wo_lot like pod_wo_lot no-undo.
   define input parameter ip_po_shipper as logical no-undo.
   define output parameter manual_shipper_update as logical no-undo.
 
   define variable receipt as logical initial yes no-undo.
 
   /* RETRIEVE SUBSHIPPER INFO IF THE SUBSHIPPER AT RECEIPT FLAG IS SET TO YES*/
   if can-find(first scs_ctrl where scs_domain = global_domain
                                and scs_enter_shipper)
   then do:
 
      manual_shipper_update = true.
      if ip_po_rcpt_qty >= 0 then
         receipt = yes.
      else
         receipt = no.
 
      /*CALL PO SUBSHIPPER POPUP THAT PROCESSES POSITIVE RECEIPTS*/
      {us/bbi/gprun.i ""porcsshp.p""
         "(input-output table tt_shipper_scroll,
           input ip_pod_site,
           input ip_vend,
           input ip_po_rcpt_qty,
           input ip_part,
           input ip_po_nbr,
           input ip_po_line,
           input ip_po_woop,
           input-output io_pod_wo_lot,
           input '',
           input receipt)"}
   end. /*IF CAN-FIND*/
 
   else
      manual_shipper_update = false.
 
END PROCEDURE.
 
PROCEDURE p_validateTransaction:
/*------------------------------------------------------------------
PURPOSE :
PARAMETERS:
NOTES:
-----------------------------------------------------------------*/
   define input parameter  p_transtype     like tr_type.
   define input parameter  p_site          like tr_site.
   define input parameter  p_location      like tr_loc.
   define input parameter  p_part          like tr_part.
   define input parameter  p_multi_ent     like mfc_logical no-undo.
   define input parameter  p_lotserial     like pt_lot_ser  no-undo.
   define input parameter  p_lotref        like sr_ref      no-undo.
   define input parameter  p_lotserial_qty like pod_qty_ord no-undo.
   define input parameter  p_receipt_um    like pt_um       no-undo.
   define input parameter  p_ponbr         like po_nbr      no-undo.
   define input parameter  p_poline        like lot_line    no-undo.
   define output parameter p_undotran      like mfc_logical no-undo.

   define variable l_status   like si_status initial "" no-undo.
   define variable l_trans-ok like mfc_logical          no-undo.

   for first ld_det
      where ld_domain = global_domain
      and   ld_site   = p_site
      and   ld_loc    = p_location
      and   ld_part   = p_part
      and   ld_lot    = p_lotserial
      and   ld_ref    = p_lotref
   no-lock:
      l_status = ld_status.
   end. /* FOR FIRST ld_det */

   if not available ld_det
   then do:

      for first loc_mstr where loc_domain = global_domain
         and loc_site = p_site
         and loc_loc  = p_location
      no-lock:
         l_status = loc_status.
      end. /* FOR FIRST loc_mstr */

      if not available loc_mstr
      then do:

         for first si_mstr where si_domain = global_domain
            and si_site = p_site
         no-lock:
            l_status = si_status.
         end. /* FOR FIRST si_mstr */
         if not si_auto_loc
         then do:
            p_undotran = Yes.
            /* LOCATION DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=709
                     &ERRORLEVEL=3
                     &PAUSEAFTER=true}
            undo, retry.
         end. /*IF NOT si_auto_loc*/
         else do:
            /* LOCATION DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=709
                     &ERRORLEVEL=2
                     &PAUSEAFTER=true}
         end. /*IF si_auto_loc*/
      end. /* IF NOT AVALIABLE loc_mstr */
   end. /* IF NOT AVAILABLE ld_det */

   /* MAKE SURE STATUS CODE EXISTS AND TRANSTYPE ALLOWED */
   for first is_mstr where is_domain = global_domain
      and is_status = l_status
   no-lock: end.

   if not available is_mstr
   then do:
      /* INVENTORY STATUS IS NOT DEFINED */
      {us/bbi/pxmsg.i &MSGNUM=361 &ERRORLEVEL=3}
      undo, retry.
   end.

   for first pt_mstr where pt_domain = global_domain
      and pt_part = p_part
   no-lock: end.

   /* MAKE SURE LOT/SERIAL ENTERED FOR LOT OR SERIAL-CONTROLLED PARTS */
   if available pt_mstr
      and index("LS",pt_lot_ser) > 0
      and p_lotserial_qty       <> 0
      and p_lotserial            = ""
      and l_validateInv
   then do:
      /* LOT/SERIAL NUMBER REQUIRED */
      {us/bbi/pxmsg.i &MSGNUM=1119 &ERRORLEVEL=3}
      next-prompt lotserial with frame d.
      p_undotran = yes.
      undo, retry.
   end. /*IF AVAILABLE pt_mstr*/

   /* MAKE SURE QTY IS 1, 0, OR -1 FOR SERIAL-CONTROLLED PARTS */
   if available pt_mstr
      and pt_lot_ser      = "S"
      and p_lotserial_qty <> 1
      and p_lotserial_qty <> -1
      and p_lotserial_qty <> 0
   then do:
      /* QUANTITY MUST BE -1 OR 1 */
      {us/bbi/pxmsg.i &MSGNUM=314 &ERRORLEVEL=3}
      p_undotran = yes.
      undo, retry.
   end. /*IF AVAILABLE pt_mstr*/


   /* MAKE SURE UM = PT_UM IF SERIAL-CONTROLLED PARTS */
   if available pt_mstr
      and pt_lot_ser = "S"
      and pt_um      <> p_receipt_um
   then do:
      /* UM MUST BE EQUAL TO STOCKING */
      /* UM FOR SERIAL-CONTROLLED ITEMS */
      {us/bbi/pxmsg.i &MSGNUM=367 &ERRORLEVEL=3}
      p_undotran = yes.
      undo, retry.
   end. /*IF AVAILABLE pt_mstr*/

   /* MAKE SURE THAT ITEM STATUS ALLOWS TRANSTYPE */
   if available pt_mstr
   then do:
      for first isd_det
         where  isd_domain  = global_domain
         and    isd_status  = string(pt_status,"x(8)") + "#"
         and    isd_tr_type = p_transtype
      no-lock:
      end. /* FOR FIRST isd_det */

      if available isd_det
      then do:
         if (batchrun            = yes
            and isd_bdl_allowed <> yes)
            or batchrun         <> yes
         then do:
            p_undotran = yes.
            /* RESTRICTED PROCEDURE FOR ITEM STATUS CODE */
            {us/bbi/pxmsg.i &MSGNUM=358 &ERRORLEVEL=3 &MSGARG1=pt_status}
            undo, retry.
         end. /* IF batchrun = yes */
      end. /*IF AVAILABLE isd_det */
   end. /* IF AVAILABLE pt_mstr */

   for first isd_det where isd_domain = global_domain
      and isd_tr_type = p_transtype
      and isd_status  = is_status
   no-lock: end.

   if available isd_det
   then do:
      if (batchrun            =  yes
          and isd_bdl_allowed <> yes)
         or batchrun <> yes
      then do:
         p_undotran = yes.
         if p_multi_ent
         then do:
            /* TRANSACTION RESTRICTED FOR SITE/LOC */
            {us/bbi/pxmsg.i &MSGNUM=7085 &ERRORLEVEL=2
                     &MSGARG1=p_transtype
                     &MSGARG2=p_site
                     &MSGARG3=p_location}
         end. /* IF p_multi_ent */
         else do:
            /* TRANSACTION RESTRICTED FOR SITE/LOC */
            {us/bbi/pxmsg.i &MSGNUM=7086 &ERRORLEVEL=3
                     &MSGARG1=p_transtype
                     &MSGARG2=p_site
                     &MSGARG3=p_location}
         end. /* IF NOT p_multi_ent */
         undo, retry.
      end. /* IF batchrun = yes */
   end. /* IF AVAILABLE isd_det */

   if not l_validateInv
   then
      return.

   for first clc_ctrl where clc_domain = global_domain
   no-lock: end.

   if not available clc_ctrl
   then do:
      {us/bbi/gprun.i ""gpclccrt.p""}
      for first clc_ctrl where clc_domain = global_domain
      no-lock: end.
   end. /*IF NOT AVAILABLE clc_ctrl*/

   if p_lotserial      <> ""
      and clc_lotlevel <> 0
   then do:
      find lot_mstr no-lock
         where lot_domain = global_domain
         and   lot_part   = p_part
         and   lot_serial = p_lotserial no-error.
      if available lot_mstr
      then do:
         if (p_ponbr     <> ""
            and lot_nbr  <> p_ponbr)
            or (p_poline <> ""
            and lot_line <> p_poline)
         then do:
            /* ORDER OR LINE DOES NOT MATCH LOT MASTER*/
            {us/bbi/pxmsg.i &MSGNUM=2707 &ERRORLEVEL=3}
            next-prompt lotserial with frame d.
            p_undotran = yes.
            undo, retry.
         end. /*IF p_ponbr <> ""*/
      end. /* IF AVAILABLE LOT_MSTR */
      else
         if p_transtype begins "C"
            and p_lotserial_qty > 0
         then do:
            {us/bbi/gprun.i ""gplotwup.p""
                     "(input p_lotserial,
                       input p_part,
                       output l_trans-ok)"}
            if not l_trans-ok
            then do:
               next-prompt lotserial with frame d.
               p_undotran = Yes.
               undo, retry.
            end. /*IF NOT l_trans-ok*/
         end. /* ELSE IF p_transtype BEGINS "C" */
   end. /* IF p_lotserial <> "" AND */

END PROCEDURE. /* p_validateTransaction */
PROCEDURE assignPackingSlip:
   define input parameter pAbsRecid as recid no-undo.
 
   define buffer lgd_mstr for lgd_mstr.
   define buffer lgdd_det for lgdd_det.
 
   for first abs_mstr where recid(abs_mstr) = pAbsRecid
   no-lock:
      /* Assign packing slip to lgd_ps_nbr */
      for each lgd_mstr where lgd_mstr.lgd_domain = global_domain
         and lgd_shipper_id = abs_id
         and lgd_type = yes
      exclusive-lock:
         lgd_ps_nbr = ps_nbr.
      end.
 
      /* Assign packing slip qty to lgdd_ps_qty */
      for each lgdd_det exclusive-lock
         where lgdd_det.oid_lgd_mstr = lgd_mstr.oid_lgd_mstr,
         each pod_det where pod_domain = global_domain
         and pod_nbr  = lgdd_order
         and pod_line = lgdd_order_line
      no-lock:
         lgdd_ps_qty = pod_ps_chg.
      end.
   end.
END PROCEDURE.
 
PROCEDURE recordLegalNbr:

   define buffer lgd_mstr for lgd_mstr.
 
   for first lgd_mstr exclusive-lock
      where lgd_mstr.lgd_domain     = global_domain
      and   lgd_mstr.lgd_shipper_id = abs_mstr.abs_id
      and   lgd_mstr.lgd_type       = yes
      and   lgd_mstr.lgd_status <> {&LD_CANCELLED}:
      assign
         lgdkey              = lgd_mstr.oid_lgd_mstr
         lgd_mstr.lgd_status = {&LD_CONFIRMED}
         lgdnbr              = lgd_mstr.lgd_nbr.
   end.
 
   release lgd_mstr.
 
END PROCEDURE. /* recordLegalNbr */

PROCEDURE getPrompt:
   define input parameter p_nextprompt as character no-undo.

   l_next_prompt = p_nextprompt.
END PROCEDURE. /* GETPROMPT */

PROCEDURE setPrompt:
   define output parameter p_setprompt as logical no-undo.

   p_setprompt = yes.
END PROCEDURE. /* SETPROMPT */

PROCEDURE itemAttributeUIPrompt:
   define input parameter ipDisplayAttributeUI  as logical   no-undo.

   if c-application-mode <> "API" then do:
      if ipDisplayAttributeUI = yes
      then do:
         hide frame b    no-pause.
         hide frame c     no-pause.
         hide frame d     no-pause.
      end.
      else do:
        view frame b.
        view frame c.
        view frame d.
      end.
   end. /* if c-application-mode <> "API" */
END PROCEDURE. /* itemAttributeUIPrompt */

PROCEDURE doInvCheck:
   /* PROCEDURE WILL BE USED TO EXCLUDE INVENTORY CHECK FOR WIP ITEMS */
   /* CALLED BY - icedit.i, icedit1.i, icsrup2.p                      */
   define output parameter p_checkInv as logical no-undo.

   p_checkInv = l_validateInv.

END PROCEDURE. /* doInvCheck */

PROCEDURE doCumOrderCheck:
   /* PROCEDURE WILL BE USED TO EXCLUDE LOCATION CHECK FOR WIP ITEMS */
   /* CALLED BY - icedit.i                                           */
   define output parameter p_checkCum as logical no-undo.

   p_checkCum = l_validateCum.

END PROCEDURE. /* doCumOrderCheck */
