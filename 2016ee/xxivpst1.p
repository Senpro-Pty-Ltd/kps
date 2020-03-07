/* xxivpst1.p - POST INVOICES TO AR AND GL REPORT                             */
/* soivpst1.p - POST INVOICES TO AR AND GL REPORT                             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxivpst1.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* REVISION: 1.0      LAST MODIFIED: 03/11/86   BY: pml                       */
/* REVISION: 6.0      LAST MODIFIED: 04/20/90   BY: ftb *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 07/11/90   BY: wug *D051*                */
/* REVISION: 6.0      LAST MODIFIED: 08/17/90   BY: mlb *D055*                */
/* REVISION: 6.0      LAST MODIFIED: 08/24/90   BY: wug *D054*                */
/* REVISION: 6.0      LAST MODIFIED: 11/01/90   BY: mlb *D162*                */
/* REVISION: 6.0      LAST MODIFIED: 12/21/90   BY: mlb *D238*                */
/* REVISION: 6.0      LAST MODIFIED: 12/06/90   BY: afs *D279*                */
/* REVISION: 6.0      LAST MODIFIED: 02/18/91   BY: afs *D354*                */
/* REVISION: 6.0      LAST MODIFIED: 02/28/91   BY: afs *D387*                */
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D424*                */
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425*                */
/* REVISION: 6.0      LAST MODIFIED: 03/28/91   BY: afs *D464*                */
/* REVISION: 6.0      LAST MODIFIED: 04/04/91   BY: afs *D478* (rev only)     */
/* REVISION: 6.0      LAST MODIFIED: 04/29/91   BY: afs *D586* (rev only)     */
/* REVISION: 6.0      LAST MODIFIED: 05/08/91   BY: afs *D628* (rev only)     */
/* REVISION: 6.0      LAST MODIFIED: 08/12/91   BY: afs *D824* (rev only)     */
/* REVISION: 6.0      LAST MODIFIED: 08/14/91   BY: mlv *D825*                */
/* REVISION: 6.0      LAST MODIFIED: 10/09/91   BY: dgh *D892*                */
/* REVISION: 7.0      LAST MODIFIED: 10/30/91   BY: mlv *F029*                */
/* REVISION: 6.0      LAST MODIFIED: 11/26/91   BY: wug *D953*                */
/* REVISION: 7.0      LAST MODIFIED: 11/30/91   BY: sas *F017*                */
/* REVISION: 7.0      LAST MODIFIED: 04/06/92   BY: afs *F356*                */
/* REVISION: 7.0      LAST MODIFIED: 06/18/92   BY: tmd *F458*                */
/* REVISION: 7.0      LAST MODIFIED: 08/13/92   BY: sas *F850*                */
/* REVISION: 7.3      LAST MODIFIED: 09/04/92   BY: afs *G047*                */
/* REVISION: 7.3      LAST MODIFIED: 10/23/92   BY: afs *G230*                */
/* REVISION: 7.3      LAST MODIFIED: 12/21/92   BY: mpp *G484*                */
/* REVISION: 7.3      LAST MODIFIED: 01/21/93   BY: sas *G585*                */
/* REVISION: 7.3      LAST MODIFIED: 04/05/93   BY: tjs *G858*                */
/* REVISION: 7.3      LAST MODIFIED: 05/11/93   BY: tjs *GA65*                */
/* REVISION: 7.4      LAST MODIFIED: 07/21/93   BY: jjs *H050*                */
/* REVISION: 7.4      LAST MODIFIED: 08/19/93   BY: pcd *H009*                */
/* REVISION: 7.4      LAST MODIFIED: 10/23/93   BY: cdt *H184*                */
/* REVISION: 7.4      LAST MODIFIED: 11/16/93   BY: bcm *H226*                */
/* REVISION: 7.4      LAST MODIFIED: 03/01/94   BY: dpm *H075*                */
/* REVISION: 7.4      LAST MODIFIED: 04/13/94   BY: bcm *H338*                */
/* REVISION: 7.4      LAST MODIFIED: 04/15/94   BY: cdt *H353*                */
/* REVISION: 7.4      LAST MODIFIED: 04/29/94   BY: dpm *FN83*                */
/* REVISION: 7.4      LAST MODIFIED: 05/18/94   BY: dpm *FO10*                */
/* REVISION: 7.3      LAST MODIFIED: 06/02/94   BY: dpm *GK02*                */
/* REVISION: 7.4      LAST MODIFIED: 06/07/94   BY: dpm *FO66*                */
/* REVISION: 7.4      LAST MODIFIED: 09/13/94   BY: rwl *FR31*                */
/* REVISION: 7.4      LAST MODIFIED: 11/06/94   BY: qzl *FT41*                */
/* REVISION: 7.4      LAST MODIFIED: 11/08/94   BY: bcm *GO14*                */
/* REVISION: 7.4      LAST MODIFIED: 11/17/94   BY: rxm *FT54*                */
/* REVISION: 7.4      LAST MODIFIED: 03/13/95   BY: jxz *F0M3*                */
/* REVISION: 8.5      LAST MODIFIED: 03/29/95   BY: dpm *J044*                */
/* REVISION: 8.5      LAST MODIFIED: 08/23/95   BY: jym *F0TR*                */
/* REVISION: 8.5      LAST MODIFIED: 10/02/95   BY: jym *G0XY*                */
/* REVISION: 8.5      LAST MODIFIED: 11/07/95   BY: ais *F0VT*                */
/* REVISION: 8.5      LAST MODIFIED: 07/25/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 04/03/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/24/96   BY: *G1LW* Robin McCarthy     */
/* REVISION: 8.5      LAST MODIFIED: 05/14/96   BY: *G1SG* Walt Koteke        */
/* REVISION: 8.5      LAST MODIFIED: 07/09/96   BY: *G1YS* Dwight Kahng       */
/* REVISION: 8.5      LAST MODIFIED: 08/01/96   BY: *J0ZZ* T. Farnsworth      */
/* REVISION: 8.6      LAST MODIFIED: 10/02/96   BY: svs *K007*                */
/* REVISION: 8.6      LAST MODIFIED: 10/18/96   BY: *K017* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *H0MY* Aruna P. Patil     */
/* REVISION: 8.6      LAST MODIFIED: 09/30/96   BY: *G2G2* Aruna P. Patil     */
/* REVISION: 8.6      LAST MODIFIED: 11/12/96   BY: *H0N9* Aruna P. Patil     */
/* REVISION: 8.5      LAST MODIFIED: 01/02/97   BY: *J1D7* Sue Poland         */
/* REVISION: 8.6      LAST MODIFIED: 03/13/97   BY: *K06M* Srinivasa(SVS)     */
/* REVISION: 8.6      LAST MODIFIED: 05/29/97   BY: *J1S9* Aruna P. Patil     */
/* REVISION: 8.6      LAST MODIFIED: 08/14/97   BY: *J1Z0* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 09/23/97   BY: *H1FM* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 10/16/97   BY: *K0N1* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 11/20/97   BY: *J26P* Mandar K.          */
/* REVISION: 8.6      LAST MODIFIED: 11/27/97   BY: *J273* Nirav Parikh       */
/* REVISION: 8.6      LAST MODIFIED: 01/06/98   BY: *J297* Mandar K.          */
/* REVISION: 8.6      LAST MODIFIED: 12/23/97   BY: *K15N* Jim Williams       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 04/17/98   BY: *J2J6* A. Licha           */
/* REVISION: 8.6E     LAST MODIFIED: 04/15/98   BY: *L00L* Adam Harris        */
/* REVISION: 8.6E     LAST MODIFIED: 06/23/98   BY: *J2LD* Niranjan R.        */
/* Old ECO marker removed, but no ECO header exists *J0DV*                    */
/* REVISION: 8.6E     LAST MODIFIED: 07/08/98   BY: *L024* Sami Kureishy      */
/* REVISION: 8.6E     LAST MODIFIED: 08/10/98   BY: *J2VV* Rajesh Talele      */
/* REVISION: 8.6E     LAST MODIFIED: 08/31/98   BY: *J2S3* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 08/31/98   BY: *H1LL* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 09/08/98   BY: *H1MZ* Poonam Bahl        */
/* REVISION: 9.0      LAST MODIFIED: 09/29/98   BY: *J2CZ* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 11/24/98   BY: *M017* David Morris       */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Murali Ayyagari    */
/* REVISION: 9.1      LAST MODIFIED: 12/03/99   BY: *K24M* Sachin Shinde      */
/* REVISION: 9.1      LAST MODIFIED: 12/17/99   BY: *J3MX* Surekha Joshi      */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 01/25/00   BY: *N06R* Bud Woolsey        */
/* REVISION: 9.1      LAST MODIFIED: 04/21/00   BY: *N09J* Denis Tatarik      */
/* REVISION: 9.1      LAST MODIFIED: 05/08/00   BY: *J3P2* Manish K.          */
/* REVISION: 9.1      LAST MODIFIED: 05/11/00   BY: *N09V* John Pison         */
/* REVISION: 9.1      LAST MODIFIED: 05/30/00   BY: *N0C8* John Pison         */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/15/00   BY: *N0RZ* Dave Caveney       */
/* REVISION: 9.1      LAST MODIFIED: 09/26/00   BY: *K264* Manish K.          */
/* REVISION: 9.1      LAST MODIFIED: 12/14/00   BY: *M0XT* Nikita Joshi       */
/* REVISION: 9.1      LAST MODIFIED: 01/02/01   BY: *J3Q3* Ashwini G.         */
/* REVISION: 8.6E     LAST MODIFIED: 01/24/01   BY: *L17C* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 10/14/00   BY: *N0W8* BalbeerS Rajput    */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.72       BY: Katie Hilbert       DATE: 04/01/01  ECO: *P002*   */
/* Revision: 1.75       BY: Hualin Zhong        DATE: 06/01/01  ECO: *N0YR*   */
/* Revision: 1.77       BY: Steve Nugent        DATE: 07/09/01  ECO: *P007*   */
/* Revision: 1.78       BY: Nikita Joshi        DATE: 04/17/01  ECO: *L18Q*   */
/* Revision: 1.79       BY: Ed van de Gevel     DATE: 12/03/01  ECO: *N16R*   */
/* Revision: 1.80       BY: Jean Miller         DATE: 12/12/01  ECO: *P03N*   */
/* Revision: 1.83       BY: Niranjan R.         DATE: 03/12/02  ECO: *P020*   */
/* Revision: 1.86       BY: Ellen Borden        DATE: 05/30/01  ECO: *P00G*   */
/* Revision: 1.87       BY: Hareesh V           DATE: 09/12/02  ECO: *M209*   */
/* Revision: 1.88       BY: Gnanasekar          DATE: 11/12/02  ECO: *N1Y0*   */
/* Revision: 1.89       BY: Piotr Witkowicz     DATE: 01/13/03  ECO: *P0LP*   */
/* Revision: 1.90       BY: Amit Chaturvedi     DATE: 01/20/03  ECO: *N20Y*   */
/* Revision: 1.91       BY: Dipesh Bector       DATE: 01/29/03  ECO: *M21Q*   */
/* Revision: 1.93       BY: Marek Krajanowski   DATE: 02/27/03  ECO: *P0NH*   */
/* Revision: 1.94       BY: Shoma Salgaonkar    DATE: 03/26/03  ECO: *N28N*   */
/* Revision: 1.95       BY: Seema Tyagi         DATE: 03/28/03  ECO: *N2BB*   */
/* Revision: 1.96       BY: Narathip W.         DATE: 05/09/03  ECO: *P0RL*   */
/* Revision: 1.98       BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L*   */
/* Revision: 1.99       BY: Vivek Gogte         DATE: 08/02/03  ECO: *N2GZ*   */
/* Revision: 1.100      BY: Manish Dani         DATE: 09/01/03  ECO: *P0VZ*   */
/* Revision: 1.101      BY: Narathip W.         DATE: 09/02/03  ECO: *P0VH*   */
/* Revision: 1.102      BY: Gnanasekar          DATE: 09/15/03  ECO: *P0ZW*   */
/* Revision: 1.103      BY: Jyoti Thatte        DATE: 09/23/03  ECO: *P106*   */
/* Revision: 1.104      BY: Kirti Desai         DATE: 11/12/03  ECO: *P195*   */
/* Revision: 1.105      BY: Ashish Maheshwari   DATE: 11/15/03  ECO: *P15L*   */
/* Revision: 1.106      BY: Vinay Soman         DATE: 01/20/04  ECO: *N2NZ*   */
/* Revision: 1.107      BY: Manisha Sawant      DATE: 03/19/04  ECO: *P1V0*   */
/* Revision: 1.108      BY: Anitha Gopal        DATE: 03/29/04  ECO: *Q06L*   */
/* Revision: 1.109      BY: Prashant Parab      DATE: 04/06/04  ECO: *P1WT*   */
/* Revision: 1.111      BY: Abhishek Jha        DATE: 05/28/04  ECO: *P237*   */
/* Revision: 1.112      BY: Ashwini             DATE: 05/27/04  ECO: *P23C*   */
/* Revision: 1.114      BY: Manisha Sawant      DATE: 06/17/04  ECO: *P26X*   */
/* Revision: 1.115      BY: Sachin Deshmukh     DATE: 07/07/04  ECO: *P268*   */
/* Revision: 1.115      BY: Bharath Kumar       DATE: 07/27/04  ECO: *P2CK*   */
/* Revision: 1.117      BY: Zheng Huang         DATE: 10/28/04  ECO: *N2YC*   */
/* Revision: 1.1.2.1    BY: Franz Tang          DATE: 07/14/05  ECO: *R03T*   */
/* Revision: 1.2        BY: Franz Tang          DATE: 10/18/05  ECO: *R03T*   */
/* Revision: 1.118      BY: Ed van de Gevel     DATE: 03/01/05  ECO: *R00G*   */
/* Revision: 1.120      BY: Ed van de Gevel     DATE: 03/07/05  ECO: *R00K*   */
/* Revision: 1.121      BY: Ed van de Gevel     DATE: 03/16/05  ECO: *R00H*   */
/* Revision: 1.122      BY: Ed van de Gevel     DATE: 18/03/05  ECO: *R00F*   */
/* Revision: 1.123      BY: Dayanand Jethwa     DATE: 04/01/05  ECO: *P27M*   */
/* Revision: 1.124      BY: Ken Casey           DATE: 02/22/05  ECO: *P38T*   */
/* Revision: 1.125      BY: Manjusha Inglay     DATE: 11/29/05  ECO: *P49C*   */
/* Revision: 1.126      BY: Dinesh Dubey        DATE: 01/17/06  ECO: *P3HZ*   */
/* Revision: 1.130      BY: Nishit V            DATE: 02/06/06  ECO: *P4GY*   */
/* Revision: 1.131      BY: Tom Kennedy         DATE: 06/08/06  ECO: *Q0LK*   */
/* Revision: 1.132      BY: Dilip Manawat       DATE: 07/14/06  ECO: *P4XH*   */
/* Revision: 1.133      BY: Abhijit Gupta       DATE: 11/14/06  ECO: *P5CX*   */
/* Revision: 1.134      BY: Rafiq S.            DATE: 11/23/06  ECO: *P4YY*   */
/* Revision: 1.135      BY: Katie Hilbert       DATE: 11/28/06  ECO: *R0BW*   */
/* Revision: 1.137      BY: Jean Miller         DATE: 08/02/07  ECO: *R0C5*   */
/* Revision: 1.138      BY: Katie Hilbert       DATE: 08/02/07  ECO: *R0C6*   */
/* Revision: 1.139      BY: Jean Miller         DATE: 11/05/07  ECO: *P5ZK*   */
/* Revision: 1.140      BY: Jean Miller         DATE: 11/17/07  ECO: *P5HD*   */
/* Revision: 1.141      BY: Chi Liu             DATE: 12/12/07  ECO: *P6BR*   */
/* Revision: 1.144      BY: Jing Li             DATE: 01/09/08  ECO: *R0JR*   */
/* Revision: 1.145      BY: Deirdre O'Brien     DATE: 03/14/08  ECO: *R0P6*   */
/* Revision: 1.146      BY: Deirdre O'Brien     DATE: 03/14/08  ECO: *R0Q0*   */
/* Revision: 1.148      BY: Jean Miller         DATE: 06/14/08  ECO: *R0JS*   */
/* Revision: 1.149      BY: Jean Miller         DATE: 07/08/08  ECO: *P6S5*   */
/* Revision: 1.150      BY: Jean Miller         DATE: 07/08/08  ECO: *P5YT*   */
/* Revision: 1.151      BY: Jean Miller         DATE: 07/08/08  ECO: *P5SN*   */
/* Revision: 1.153      BY: Jean Miller         DATE: 07/08/08  ECO: *P6SH*   */
/* Revision: 1.154      BY: Dan Herman          DATE: 09/11/08  ECO: *R14C*   */
/* Revision: 1.155      BY: Dilip Manawat       DATE: 09/24/08  ECO: *P6KG*   */
/* Revision: 1.160      BY: Deirdre O'Brien     DATE: 10/31/08  ECO: *R16Q*   */
/* Revision: 1.161      BY: Niranjan Ranka      DATE: 10/15/08  ECO: *R19Q*   */
/* Revision: 1.162      BY: Anju Dubey          DATE: 01/13/09  ECO: *R19P*   */
/* Revision: 1.163      BY: Chi Liu             DATE: 01/19/09  ECO: *Q22F*   */
/* Revision: 1.165      BY: John Corda          DATE: 01/21/09  ECO: *Q28C*   */
/* Revision: 1.171      BY: Evan Todd           DATE: 02/25/09  ECO: *Q2H0*   */
/* Revision: 1.172      BY: Amit Kumar          DATE: 03/06/09  ECO: *R1D9*   */
/* Revision: 1.173      BY: Deepak Keni         DATE: 04/13/09  ECO: *R1GS*   */
/* Revision: 1.174      BY: Trupti Khairnar     DATE: 06/22/09  ECO: *Q2ZX*    */
/* Revision: 1.176      BY: Deirdre O'Brien     DATE: 07/10/09  ECO: *R1HB*  */
/* Revision: 1.179      BY: Deepak Keni         DATE: 08/21/09  ECO: *R1MK*  */
/* Revision: 1.183      BY: Dipanshu Talwar     DATE: 11/09/09  ECO: *P552*  */
/* Revision: 1.185      BY: Nancy Philip        DATE: 01/04/10  ECO: *R1W3*  */
/* Revision: 1.186      BY: Mitesh Singh        DATE: 01/18/10  ECO: *R1VG*  */
/* Revision: 1.187      BY: Rajalaxmi Ganji     DATE: 04/09/10  ECO: *Q3ZK*  */
/* $Revision: 1.2 $   BY: Katie Hilbert       DATE: 06/25/10  ECO: *R21M*  */
/* $Revision: 1.2 $     BY: Neil Curzon       DATE: 07/09/10  ECO: *R21V*  */
/* CYB    LAST MODIFIED: 29-NOV-2012    BY:  gbg *c1359*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* Revision: QAD2016    BY: nac      DATE: 27Nov17   ECO: *d4081-877* */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* ENCLOSED DISPLAY STATEMENTS IN 'DO ON ENDKEY UNDO, LEAVE'              */
/* LOOPS FOR CORRECT POSTING OF INVOICE WHEN F4 IS PRESSED AT             */
/* THE SPACEBAR PROMPT FOR OUTPUT DIRECTED TO TERMINAL                    */

{us/bbi/mfdeclre.i }
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/fs/fsdeclr.i}

define input  parameter abs_recid     as   recid        no-undo.
define input  parameter l_po_schd_nbr like sod_contr_id no-undo.
define input  parameter errorSummary  like mfc_logical  no-undo.
define input  parameter pShipperConf  like mfc_logical  no-undo.
define input  parameter pPostFile     as   character    no-undo.
define input  parameter p_prtInstBase like mfc_logical  no-undo.
define output parameter table         for ttisb.

define new shared variable convertmode as character no-undo initial "report".
define variable rounding_amt          like glt_amt no-undo.
define new shared variable rndmthd like rnd_rnd_mthd.
define new shared variable addtax       like mfc_logical.

{us/so/soivpst.i "shared"}
{us/et/etdcrvar.i "new"}
{us/gl/gldydef.i}
{us/gl/gldynrm.i}
{us/so/soivtt01.i}

define new shared frame sotot.

{us/et/etsotrla.i "NEW"}

define variable w-first-key  like so_mstr.so_inv_nbr        no-undo.
define variable w-first-pass as logical                     no-undo.
define variable bill_name    like ad_name                   no-undo.
define variable ship_name    like ad_name                   no-undo.
define variable col-80       like mfc_logical initial false no-undo.
define variable err_flag     as integer                     no-undo.

define variable auth_price   like sod_price format "->>>>,>>>,>>9.99" no-undo.
define variable auth_found   like mfc_logical               no-undo.
define variable l_ord_contains_tax_in_lines like mfc_logical no-undo.
define variable orderTotal as decimal no-undo initial 0.

{us/so/soivtot1.i "NEW"}  /* Define variables for invoice totals. */

{us/gp/gprunpdf.i "txincopl" "p"}

define new shared variable new_order       like mfc_logical.
define new shared variable consolidate     like mfc_logical initial true.
define new shared variable undo_trl2       like mfc_logical.
define new shared variable undo_txdetrp    like mfc_logical.
define new shared variable crtint_amt      like trgl_gl_amt.
define new shared variable customer_sched  like mfc_logical.
define new shared variable so_db           like dc_name.
define new shared variable tot_inv_comm    as decimal format "->>,>>9.99"
                                           extent 4 no-undo.
define new shared variable line_pricing    like mfc_logical.
define new shared variable sonbr           like sod_nbr.
define new shared variable soline          like sod_line.
define new shared variable sopart          like sod_part.
define new shared variable auto_balance_amount like glt_amt no-undo.
define new shared variable hasSystemSafConcepts as logical.

define new shared variable dom-single      like mfc_logical no-undo.

define shared variable prog_name     as   character    no-undo.

define variable connect_db      like dc_name no-undo.
define variable base_total      like base_price no-undo.
define variable marg_total      like base_margin no-undo.
define variable base_total_fmt  as character no-undo.
define variable base_total_old  as character no-undo.
define variable marg_total_fmt  as character no-undo.
define variable marg_total_old  as character no-undo.
define variable ext_price_fmt   as character no-undo.
define variable ext_price_old   as character no-undo.
define variable ext_gr_marg_fmt as character no-undo.
define variable ext_gr_marg_old as character no-undo.
define variable totstr          as character no-undo.
define variable gltwdr_fmt      as character no-undo.
define variable gltwdr_old      as character no-undo.
define variable gltwdr          as decimal format "->>>>,>>>,>>9.99" no-undo.
define variable gltwcr_fmt      as character no-undo.
define variable gltwcr_old      as character no-undo.
define variable gltwcr          as decimal format "->>>>,>>>,>>9.99" no-undo.
define variable oldsession      as character no-undo.
define variable oldcurr         like so_curr no-undo.
define variable base_cost       as decimal no-undo.
define variable promo_inv       like so_inv_nbr no-undo.
define variable complete        as logical no-undo.
define variable apm-ex-prg      as character format "x(10)" no-undo.
define variable apm-ex-sub      as character format "x(24)" no-undo.
define variable error_msg       as character format "x(78)" no-undo.
define variable msgText         as character format "x(78)" no-undo.
define variable msgNbr          as integer no-undo.
define variable l_consolidate   as   logical initial no no-undo.
define variable l_so_nbr        like so_nbr  no-undo.
define variable mc-error-number like msg_nbr no-undo.
define shared temp-table IntraStat field StatID as recid.
{us/so/soeuinv.i}

define variable l_tax_total_message as character extent 2 format "x(13)" no-undo.
define variable l_basetaxtot    like glt_amt no-undo.
define variable l_basesubtot    like glt_amt no-undo.

define variable soinvnbr        like so_inv_nbr.
define variable new_invnbr      like so_inv_nbr.
define variable org_ref         like ref.

define variable err_mess_num    like msg_nbr      no-undo.
define variable error_flag      like mfc_logical  no-undo.
define variable l_so_gl_line    like glt_line     no-undo.
define variable l_so_gltw_line  like gltw_line    no-undo.
define variable l_ar_gl_line    like glt_line     no-undo.
define variable l_ar_gltw_line  like gltw_line    no-undo.
define variable l_tot_amt       like glt_amt      no-undo.
define variable l_tot_ramt      like glt_amt      no-undo.
define variable l_tot_amt1      like glt_amt      no-undo.
define variable l_tot_ramt1     like glt_amt      no-undo.
define variable l_inv_nbr       like so_inv_nbr   no-undo.
define variable l_intco_inv_nbr like so_inv_nbr   no-undo.
define variable l_lastof        like mfc_logical  no-undo.
define variable l_so_curr       like so_curr      no-undo.
define variable cont_charges    as decimal format "->>>>>>>>>9.9999" no-undo.
define variable line_charges    like absl_lc_amt no-undo.
define variable avail_abs       like mfc_logical no-undo.
define variable l_locked        like mfc_logical no-undo.
define variable l_invoice_nbr   like so_inv_nbr  no-undo.
define variable l_tempref       like tx2d_ref    no-undo.
define variable so-trl1-cd      like so_trl1_cd   no-undo.
define variable so-trl2-cd      like so_trl2_cd   no-undo.
define variable so-trl3-cd      like so_trl3_cd   no-undo.
define variable isConsolDom     as logical        no-undo.
define variable l_sonbr         like so_nbr       no-undo.
define variable daybook         as character      no-undo.
define variable billTo          like so_bill      no-undo.
define variable oldCapplicationMode like c-application-mode no-undo.
define new shared frame d.
{us/so/sogiatt.i "new shared"}
{us/px/pxpgmmgr.i}
define variable acct as character no-undo.
define variable sub  as character no-undo.
define variable cc   as character no-undo.

define new shared temp-table t_absr_det no-undo
   field t_absr_id        like absr_id
   field t_absr_reference like absr_reference
   field t_absr_qty       as decimal format "->>>>,>>>,>>9.99"
   field t_absr_ext       as decimal format "->>>>,>>>,>>9.99"
   index t_absr_indx t_absr_id t_absr_reference.

define temp-table t_tx2d no-undo
   field t_line         like tx2d_det.tx2d_line
   field t_ref          like tx2d_det.tx2d_ref
   field t_edited       like tx2d_det.tx2d_edited
   field t_cur_tax_amt  like tx2d_det.tx2d_cur_tax_amt
   field t_tax_amt      like tx2d_det.tx2d_tax_amt
   field t_ent_tax_amt  like tx2d_det.tx2d_ent_tax_amt
   index t_tx2d_idx t_ref t_line.

define buffer somstr for so_mstr.
define buffer somstr2 for so_mstr.

define new shared workfile invoice_err no-undo
   field  inv_nbr  like so_inv_nbr
   field  ord_nbr  like so_nbr
   field  db_name  like dc_name.

{ proxy/datasets/tfcmessages.i }

define variable l_addtax1        as logical    no-undo.
define variable l_addtax2        as logical    no-undo.
define variable l_addtax3        as logical    no-undo.
define variable r-result         as integer    no-undo.
define variable l_consolflg      as logical initial no no-undo.
define variable l_tr_type        as character  no-undo.
define variable success          as logical    no-undo.
define variable vglamt           like ar_amt   no-undo.
define variable cur-sonbr        like so_nbr   no-undo.
define variable postInvoice      as logical    no-undo.
define variable cardProcessed    as logical    no-undo.
define variable default_daybookset as character no-undo.
define variable inv_type         as character  no-undo.
define variable depotCall        as logical no-undo.

/* DEFINE VARIABLES USED IN GPGLEF1.P (GL CALENDAR VALIDATION) */
{us/gp/gpglefv.i}

{us/gp/gpcrfmt.i}
{us/bbi/gpfilev.i} /* VARIABLE DEFINITIONS FOR gpfile.i */
/* DEFINITION FOR TEMP TABLE  t_tr_hist1 */
{us/so/sotrhstb.i}

define variable prepaid-amt like so_prepaid no-undo.
define variable amt-due  like so_prepaid no-undo.
define variable price_fmt as character no-undo.

define variable hQADFinInvPostLib as handle no-undo.

define variable daybookSetBySiteInstalled like mfc_logical no-undo.
define variable hDaybooksetValidation as handle no-undo.
define variable iErrorNumber          as integer no-undo.
define variable sobillto              as character no-undo.

define variable l_last_inv_flag  like mfc_logical     no-undo.
define variable severity as character no-undo.

define variable vlReturnStatus        as logical      no-undo.
define variable cErrorArgs            as character    no-undo.

define variable finTransCommitted     as logical no-undo.
define variable finAPIError           as integer no-undo.
define variable DIInvCertCertificate    as character.
define variable DIInvCertSignatureCurr  as character.

define variable isPortugal            as logical initial false.

/*c1359*/ define variable txresult         as int.

{us/so/sorp.i}
{us/ds/dsexcptn.i}

/* DAYBOOKSET VALIDATION LIBRARY PROTOTYPES */
{us/dy/dybvalpl.i hDaybooksetValidation}

/* INITIALIZE PERSISTENT PROCEDURES */
run mfairunh.p
   (input "dybvalpl.p",
    input ?,
    output hDaybooksetValidation).

run mfairunh.p
   (input 'soivpstfinpl.p',
    input '?',
    output hQADFinInvPostLib) no-error.

form
   so_cr_init     colon 15
   so_to_inv      colon 48
   so_cr_card     colon 15
   so_print_so    colon 48
   so_stat        colon 15
   so_print_pl    colon 48
   so_rev         colon 15
   so_prepaid     colon 48
   so_fob         colon 15
with frame d side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

form
   space(3)
   sod_line
   sod_part      format "x(22)"
   sod_um
   sod_acct
   sod_sub
   sod_cc
   sod_qty_inv   column-label "Invoiced!Backorder"
   space(5)
   sod_taxable
   sod_taxc      no-label
   sod_price     format "->>>,>>>,>>9.99<<<"
   ext_price     label "Ext Price"
   ext_gr_margin format "->>>>,>>>,>>9.99"
with frame e width 132 down.

/* SET EXTERNAL LABELS */
setFrameLabels(frame e:handle).

form
   skip(1)
   totstr     format "x(19)"            to 60
   base_total                           to 113
   marg_total format "->>>>,>>>,>>9.99" to 130
   skip(1)
with frame rpttot no-labels width 132.

/*DEFINE FRAME FOR DISPLAYING GL TOTALS */
form
   gltw_entity
   gltw_acct
   gltw_sub
   gltw_cc
   gltw_project
   gltw_date
   dr_amt      label "Consolidated Dr"
   cr_amt      label "Consolidated Cr"
   gltw_desc format "x(30)"
with frame gltwtot width 132 down no-labels.

form
   tFcMessages.tcFcMsgNumber format "x(22)" label "Message Number"
   tFcMessages.tcFcMessage label "Errors During Posting" view-as editor
   INNER-CHARS 50 INNER-LINES 1
   tFcMessages.tcFcContext format "x(22)" label "Invoice"
   tFcMessages.tcFcFieldName format "x(30)" label "Field"
   tFcMessages.tcFcFieldValue format "x(22)" label "Field Value"
with frame ferr width 170 down.

/* SET EXTERNAL LABELS */
setFrameLabels(frame ferr:handle).
tFcMessages.tcFcMsgNumber:label  in frame ferr   = getTermLabel("MESSAGE_NUMBER",22).
tFcMessages.tcFcMessage:label    in frame ferr   = getTermLabel("INVOICE_POST_ERRORS",50).
tFcMessages.tcFcContext:label    in frame ferr   = getTermLabel("INVOICE",22).
tFcMessages.tcFcFieldName:label  in frame ferr   = getTermLabel("FIELD",30).
tFcMessages.tcFcFieldValue:label in frame ferr   = getTermLabel("FIELD_VALUE",22).

form
    invoiceErrors.invoiceNumber
    invoiceErrors.salesOrderNum
    invoiceErrors.billTo
    severity
    invoiceErrors.errorNumber format "X(13)"
    invoiceErrors.errorMessage view-as editor inner-chars 50 inner-lines 1
with frame errorSummary width 132 down.

setFrameLabels(frame errorSummary:handle).
form header
   (getTermLabel ("SALES_JOURNAL_REFERENCE",24)) + ": " format "x(24)"
   ref format "x(22)"
   (getTermLabel ("AR_BATCH",9)) + ": " format "x(9)"
   batch
with frame jrnl width 80 page-top.

assign l_tax_total_message[1] = getTermLabel("TOTAL_TAX",9)
                              + " "
                              + getTermLabel("IN",2)
       l_tax_total_message[2] = getTermLabel("TOTAL_TAX",9).

empty temp-table t_absr_det.

for first txc_ctrl where txc_domain = global_domain no-lock: end.

/* DETERMINE IF CONTAINER AND LINE CHARGES IS ENABLED */
{us/cc/cclc.i}

/* CHECK IF APM DATABASE IS CONNECTED IF TrM RUNNING */
if soc_apm then do:
   /* TrM DATABASE IS NOT CONNECTED */
   {us/if/ifapmcon.i "6316" "return"}
end.
for each gltw_wkfl
   where gltw_domain = global_domain
      and gltw_userid = mfguser
exclusive-lock:
   {us/gp/gprunp.i "mcpl" "p" "mc-delete-ex-rate-usage"
      "(input gltw_exru_seq)"}
   delete gltw_wkfl.
end.

/* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
assign
   nontax_old      = nontaxable_amt:format
   taxable_old     = taxable_amt:format
   line_tot_old    = line_total:format
   disc_old        = disc_amt:format
   trl_amt_old     = so_trl1_amt:format
   tax_amt_old     = tax_amt:format
   ord_amt_old     = ord_amt:format
   container_old   = container_charge_total:format
   line_charge_old = line_charge_total:format.

assign
   ext_price_old   = ext_price:format
   ext_gr_marg_old = ext_gr_margin:format
   gltwcr_old      = cr_amt:format
   gltwdr_old      = dr_amt:format
   marg_total_old  = marg_total:format
   base_total_old  = base_total:format
   maint           = no
   oldsession      = SESSION:numeric-format.

mainloop:
do on error undo, leave:

   /* FIND FIRST logic used to simulate FOR EACH logic because the inner
    * FOR EACH so_mstr loop deletes so_mstr records.  This changes the
    * index cursor position being used for the so_mstr table and caused
    * the earlier outer FOR EACH and FIRST-OF to act unpredictably under
    * V7 Progress (but not V6).  Changed selection criterion to so_inv_nbr > ""
    * rather than 'so_inv_nbr <> ""' for better index bracketing and added
    * back missing selection criteria (so_cust, so_bill). Lastly,
    * added USE-INDEX to ensure that the invoice number index is used. */

   assign
      w-first-pass = yes
      w-first-key = inv.
   /* When coming from Shipper Confirm the following variables will not have been set */
   if daybookset1 = "" then daybookset1 = hi_char.

   empty temp-table invoiceErrors.
        /* run the prevalidation */
        {us/bbi/gprun.i ""soivpval.p""
          "(input eff_date,
                output vlReturnStatus)"}

        if vlReturnStatus = TRUE
        then do:
                assign undo_all = TRUE.
                undo mainloop, leave.
        end.

   /*
   * if the user has indicated they would like the errors summarized at the end of the report then set
   * the application mode to 'API'.  This will result in error messages being logged to the temp table.
   */
   if errorSummary then
       assign
           oldCapplicationMode = c-application-mode
           c-application-mode = "API".
   subloop:
   repeat:
      
       if errorSummary
       then
           run clearMessageTempTable.

      if w-first-pass then do:

         for first somstr
             where somstr.so_domain = global_domain
              and (so_inv_nbr >= w-first-key
              and  so_inv_nbr <= inv1
              and  so_inv_nbr > "")
              and (so_to_inv = yes)
              and (so_cust >= cust and so_cust <= cust1)
              and (so_bill >= bill and so_bill <= bill1)
              and (so_daybookset >= daybookset and
                   so_daybookset <= daybookset1)
         use-index so_invoice no-lock:
         end.

         if available somstr
         then do:
            {us/bbi/gprun.i ""txdelete.p""
               "(input '16',
                 input so_inv_nbr,
                 input '*')" }
         end. /* IF AVAILABLE somstr */

         /* This is the start of a new invoice run,
            so we first empty the saf temp-tables and re-fetch them later */
         run EmptySafTempTables in hQADFinInvPostLib.

         run GetActiveSystemSafConcepts in hQADFinInvPostLib
            (output hasSystemSafConcepts,
             output err_flag).

         if err_flag < 0 then do:
            return error.
         end.

         w-first-pass = no.

      end.

      else
         for first somstr
          where somstr.so_domain = global_domain
           and (so_inv_nbr > "")
           and (so_inv_nbr > w-first-key)
           and (so_inv_nbr <= inv1)
           and (so_to_inv = yes)
           and (so_cust >= cust and so_cust <= cust1)
           and (so_bill >= bill and so_bill <= bill1)
           and (so_daybookset >= daybookset and
                so_daybookset <= daybookset1)
      use-index so_invoice no-lock:
      end.

      if available somstr then do:
/*c1359*/ do:
/*c1359*/   {us/bbi/gprun.i ""xxtx13rm.p"" "(recid(somstr),
                                      output txresult)"}
/*c1359*/   if txresult <> 0 then do:
/*c1359*/       next subloop.
/*c1359*/   end.
/*c1359*/ end.
         assign
             soinvnbr = so_inv_nbr
             sobillto = so_bill.

         /* CHECK IF THE SO BELONGS TO DEPOT ORDER OF SSM */
         /* IF YES THEN CREATE THE ISB */
         run validateDepotCall (input so_nbr,
                                output depotCall).

         /* Changed W-FIRST-KEY logic to avoid using an appended
          * "!" since this may be unreliable; eg, a <space> falls
          * before "!" in the ASCII collating sequence, hence if the
          * invoice number sequence were "ABC", "ABC XYZ", "DEF",
          * "ABC XYZ" would be skipped.  Also, it's possible that
          * EBCIDIC and Code Pages may produce unexpected results.
          * Instead, change the FIND-FIRST clause to handle the first
          * pass into the REPEAT one way and all subsequent passes
          * another (discriminated by W-FIRST-KEY equaling INV or not). */

         w-first-key = somstr.so_inv_nbr.

         {us/bbi/gprun.i ""txdelete.p""
            "(input '16',
              input so_inv_nbr,
              input '*')" }

         /* VALIDATE DAYBOOK SET */
         run validateDaybookSet in hDaybookSetValidation
             ( input  so_daybookset,
               input  so_site,
               input  eff_date,
               output iErrorNumber,
               output cErrorArgs).

         if iErrorNumber > 0
         then do:
            {us/bbi/pxmsg.i &MSGNUM=iErrorNumber &ERRORLEVEL=3 &MSGARG1=cErrorArgs}
            next subloop.
         end.

         if (oldcurr <> so_curr) or (oldcurr = "") then do:

            /* GET ROUNDING METHOD FROM CURRENCY MASTER */
            {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
               "(input so_curr,
                 output rndmthd,
                 output mc-error-number)"}
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
               next subloop.
            end. /* if mc-error-number <> 0 */

            /* DETERMINE CURRENCY DISPLAY AMERICAN OR EUROPEAN */
            for first rnd_mstr where rnd_rnd_mthd = rndmthd
            no-lock: end.

            if not available rnd_mstr then do:
               /* Rounding method record not found */
               {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=3}
               next subloop.
            end.

            {us/so/socurfmt.i} /* SET CURRENCY DEPENDENT FORMATS */

            /* SET CURRENCY FORMAT FOR EXT_PRICE */
            ext_price_fmt = ext_price_old.

            run gpcrfmt
               (input-output ext_price_fmt,
                input rndmthd).

            /* SET CURRENCY FORMAT FOR EXT_GR_MARGIN */
            ext_gr_marg_fmt = ext_gr_marg_old.

            run gpcrfmt
               (input-output ext_gr_marg_fmt,
                input rndmthd).

            oldcurr = so_curr.

         end. /* IF (OLDCURR <> SO_CURR) */

         invoiceloop:
         do transaction on error undo , leave:
                          
             assign finTransCommitted = false.
             
             /* start the financial transaction */
             run proxy/starttransaction.p (output dataset tFcMEssages,
                                           output finAPIError).
             if finAPIError < 0
             then do:
               /* Start qflib.p - QAD Financials Library running persistently */
                run mfairunh.p
                  (input  'qflib.p',
                   input  '?',
                   output hQADFinInvPostLib) no-error.
                run processErrors in hQADFinInvPostLib
                  (input table tFcMessages,
                   input 3).
                assign undo_all = true.
                undo invoiceloop, leave invoiceloop.      
             end.                                                     

           /* This is the start of a new invoice, so we first empty all temp-tables */
           run emptyApiTempTables in hQADFinInvPostLib.
                   empty temp-table ttGiaTransactions.

           /* First call soivnbr to just get the daybook */
           {us/bbi/gprun.i ""soivnbr.p""
               "(input recid(somstr),
                 input eff_date,
                 input yes,
                 output new_invnbr,
                 output daybook)"}

           /* Lock the qad-wkfl for that daybook so that only one person can run invoice post at any one time*/
           {us/bbi/gprun.i ""sorp10a.p"" "(input daybook)"}

           /* Second call to get a new invoice number based on the invoice total */
           {us/bbi/gprun.i ""soivnbr.p""
               "(input recid(somstr),
                 input eff_date,
                 input no,
                 output new_invnbr,
                 output daybook)"}

           /* Get a new invoice for inter company posting */
           {us/bbi/gprun.i ""intcnbr.p""
               "(input recid(somstr),
                 output l_intco_inv_nbr)"}

           assign
              ref         = new_invnbr
              l_tot_amt   = 0
              l_tot_ramt  = 0
              l_tot_amt1  = 0
              l_tot_ramt1 = 0.

            /* IN ORDER TO AVOID LOCKING ISSUES DURING INVOICE POST  */
            /* OF SINGLE/CONSOLIDATED INVOICES, SKIP THE LOCKED      */
            /* ORDER AND POST THE INVOICES FOR THE REMAINING ORDERS. */

            run p_check_locked(input somstr.so_inv_nbr,
                               output l_sonbr).

            /* NEED TO CYCLE IF THE RECORD IS LOCKED AND IS FROM DOM */
            if l_locked
            then do:
               /* COULD BE A TIMING ISSUE - SO CYCLE UNTIL RECORD IS FREE */
               if can-find (first ecx_ref where ecx_domain = global_domain
                                         and ecx_nbr = l_sonbr
                                         and ecx_line = "0"
                                         and ecx_order_type = 'SO')
               then
               do while l_locked:
                  run p_check_locked(input somstr.so_inv_nbr,
                                     output l_sonbr).
               end.
               else
                  next subloop.
            end.

            /* EXCLUSIVE-LOCKING THE SALES ORDER AT THE START OF THE  */
            /* TRANSACTION SO THAT INVOICE NUMBER REMAINS CONSISTENT  */
            /* THROUGHOUT INVOICE POST TRANSACTIONS(AR, GL, SO)       */

            for each so_mstr where so_mstr.so_domain = global_domain
                 and so_mstr.so_inv_nbr = somstr.so_inv_nbr
            exclusive-lock:
               if can-find (first iec_ctrl
                            where iec_domain     = global_domain
                            and   iec_use_instat = yes)
               then do:
                  {us/bbi/gprun.i ""soiesoval.p""
                     "(input rowid(so_mstr),
                     output iErrorNumber)"}
                  if iErrorNumber > 0
                  then do:
                     {us/bbi/pxmsg.i &MSGNUM=iErrorNumber &MSGARG1=so_mstr.so_nbr &ERRORLEVEL=2}
                     next.
                  end. /* IF iErrorNumber > 0 */
               end. /* IF CAN-FIND iec_ctrl */
               so_mstr.so_inv_nbr = new_invnbr.
            end. /* FOR EACH so_mstr */

            soloop:
            for each so_mstr where so_mstr.so_domain = global_domain
                 and so_mstr.so_inv_nbr = new_invnbr
            exclusive-lock
            use-index so_invoice
            break by so_inv_nbr:

               assign so_mstr.so_inv_nbr = new_invnbr.

               run updateCorrectionInv( input so_nbr,
                                        input so_inv_nbr).

               run createSalesOrderRef in hQADFinInvPostLib
                                 (input so_inv_nbr,
                                 input recid(so_mstr) ).

               for first invoice_err
                  where inv_nbr = so_inv_nbr
               no-lock: end.

               if available invoice_err then leave.
               find first cil_mstr
                  where cil_domain     = global_domain
                    and cil_cor_so_nbr = so_mstr.so_nbr
               no-lock no-error.

               if available cil_mstr then do:
                  if not inccor then leave.
                  for each sod_det where sod_domain = global_domain
                      and sod_nbr    = so_mstr.so_nbr
                      and sod_compl_stat = ""
                  no-lock:
                      if sod_qty_ord <> sod_qty_ship then leave.
                  end.
                  if available sod_det and sod_qty_ord <> sod_qty_ship then
                     leave.
               end.
               else if inccor then
                  leave.

               so_recno = recid(so_mstr).

               view frame jrnl. 

               assign
                  already_posted  = 0
                  tot_curr_amt    = 0
                  tot_line_disc   = 0
                  name            = "" .

               if first-of(so_inv_nbr) then do:
                  assign
                     addtax         = true
                     l_consolflg    = false
                     l_so_nbr       = so_nbr
                     taxable_amt    = 0
                     nontaxable_amt = 0.

                  {us/so/soivtot2.i}  /*Initialize variables for invoice totals*/

                  /* DETERMINE IF THIS INVOICE IS A CONSOLIDATED INVOICE WHICH */
                  /* WAS CONSOLIDATED FROM A DOM GLOBAL ORDER                  */
                  dom-single = no.
                  if can-find (first ecx_ref where ecx_domain = global_domain
                                               and ecx_nbr = so_nbr
                                               and ecx_line = "0"
                                               and ecx_order_type = 'SO')
                  then do:
                     {us/bbi/gprun.i ""soivdom1.p""
                        "(input 'so_mstr',
                          input so_inv_nbr,
                          output so-trl1-cd,
                          output so-trl2-cd,
                          output so-trl3-cd,
                          output isConsolDom)"}
                     if isConsolDOm = yes
                     then dom-single = yes.
                  end.

                  if can-find(first somstr2
                     where somstr2.so_domain  = global_domain
                     and   somstr2.so_inv_nbr = so_mstr.so_inv_nbr
                     and   recid(somstr2)     <> recid(so_mstr)
                     and   somstr2.so_inv_nbr <> "")
                  then do:

                     /* EMPTY THE TEMP-TABLES FOR CONSOLIDATION OF INVOICE */
                     {us/gp/gprunp.i "txincopl" "p" "empty-table"}

                     find first tx2d_det
                        where tx2d_domain  = global_domain
                        and   tx2d_ref     = so_nbr
                        and   tx2d_tr_type = "13"
                     no-lock no-error.

                     if not available tx2d_det
                     then do:
                        if so_mstr.so_fsm_type = ""
                        then
                           l_tr_type = "11".
                        else if so_mstr.so_fsm_type = "RMA"
                             then
                                l_tr_type = "36".
                     end. /* IF NOT AVAILABLE tx2d_det */
                     else
                     l_tr_type = "13".

                     l_consolflg = true .

                     for each somstr2 where somstr2.so_domain  = global_domain
                        and somstr2.so_inv_nbr = so_mstr.so_inv_nbr
                     no-lock:

                        if somstr2.so_fsm_type = "FSM-RO"
                        then do:

                           l_tr_type = "38" .

                           find first tx2d_det
                              where tx2d_domain  = global_domain
                              and   tx2d_ref     = so_mstr.so_nbr
                              and   tx2d_tr_type = "38"
                           no-lock no-error.

                           if not available tx2d_det
                           then do:

                              if so_taxable = yes
                              then do:

                                 find first txc_ctrl
                                    where txc_ctrl.txc_domain = global_domain
                                 no-lock no-error.

                                 if available txc_ctrl
                                 then do:

                                    create tx2d_det.
                                    assign
                                       tx2d_det.tx2d_domain   = global_domain
                                       tx2d_det.tx2d_ref      = so_inv_nbr
                                       tx2d_det.tx2d_nbr      = so_nbr
                                       tx2d_det.tx2d_tr_type  = "16"
                                       tx2d_det.tx2d_tax_env  = txc_ctrl.txc_tax_env
                                       tx2d_det.tx2d_tax_code = txc_ctrl.txc_tax_code
                                       tx2d_det.tx2d_by_line  = txc_ctrl.txc_by_line
                                       tx2d_det.tx2d_line     = 0
                                       tx2d_det.tx2d_trl      = "".
                                 end. /* IF AVAILABLe txc_ctrl */
                              end.  /* IF so_taxable = yes */
                           end. /* if not available tx2d_det  */
                        end. /* IF somstr2.so_fsm_type = "FSM-RO" THEN DO */
                        else
                           l_tr_type = "13".

                        {us/gp/gprunp.i "txincopl" "p" "create-record"
                                  "(input recid(somstr2),
                                    input l_tr_type)" }

                     end. /* FOR EACH somstr2 */

                     r-result = 0 .

                     {us/gp/gprunp.i "txincopl" "p" "txcalc"
                        "(input 16                 ,
                          input so_mstr.so_inv_nbr ,
                          input 'CONSOL'           ,
                          input 0                  ,
                          input l_tr_type          ,
                          input no                 ,
                          output r-result)" }

                     {us/bbi/gprun.i ""soivtrl2.p""
                        "(input so_mstr.so_inv_nbr,
                          input '*'   ,
                          input col-80 /* REPORT WIDTH */,
                          input '16'   /* TRANSACTION TYPE */,
                          input cont_charges,
                          input line_charges,
                          input yes           )"}

                     assign
                        invtot_tax_amt  = tax_amt
                        invtot_ord_amt  = tax_amt
                        l_addtax1       = true
                        l_addtax2       = true
                        l_addtax3       = true
                        addtax          = false .
                  end. /* IF CAN-FIND(FIRST somstr2 .... */
               end.
               else
                  l_consolidate = yes.

               for first ad_mstr
                   where ad_domain = global_domain
                    and  ad_addr = so_cust
               no-lock:
                  name = ad_name.
               end.

               for first ad_mstr
                   where ad_domain = global_domain
                    and  ad_addr = so_bill
               no-lock:
                  bill_name = ad_name.
               end.

               for first ad_mstr
                   where ad_domain = global_domain
                    and  ad_addr = so_ship
               no-lock:
                  ship_name = ad_name.
               end.

               /* GET THE POSTING ENTITY BASED ON THE SO HEADER SITE */
               for first si_mstr
                   where si_domain = global_domain
                    and  si_site = so_site
               no-lock: end.

               if available si_mstr then
                  post_entity = si_entity.
               else
                  post_entity = glentity.

               if first-of(so_inv_nbr) then do:

                  if page-size - line-counter <= 11 then
                  do on endkey undo, leave:
                     page.
                  end. /* DO ON ENDKEY UNDO, LEAVE */

                  do on endkey undo, leave:

                     form with frame h1 width 80.
                     /* SET EXTERNAL LABELS */
                     setFrameLabels(frame h1:handle).
                     display
                        so_inv_nbr
                        so_bill
                        bill_name
                        so_cust
                        name
                        so_slspsn[1] label "Salespsn"
                        so_slspsn[2] no-label
                        so_slspsn[3] no-label
                        so_slspsn[4] no-label
                     with frame h1 width 132.

                  end. /* DO ON ENDKEY UNDO, LEAVE */

               end.

               if page-size - line-counter <= 6 then
               do on endkey undo, leave:
                  page.
               end. /* DO ON ENDKEY UNDO, LEAVE */

               do on endkey undo, leave:

                  do with frame h2:

                     /* SET EXTERNAL LABELS */
                     setFrameLabels(frame h2:handle).

                     display
                        skip(1)
                        space(3)
                        so_nbr
                        so_ship
                        ship_name   no-label
                        so_ord_date
                        so_po       label "P/O"
                     with frame h2 side-labels width 132 no-box.

                  end. /* do with */

               end. /* DO ON ENDKEY UNDO, LEAVE */

               /* VERIFY OPEN GL PERIOD FOR SITE ENTITY */
               {us/gp/gpglef2.i &module  = ""SO""
                  &entity  = post_entity
                  &date    = eff_date
                  &loop    = "invoiceloop"
                  &result  = undo_all}

               for each sod_det where sod_domain =  so_domain
                  and sod_nbr  =  so_nbr
                  and sod_site <> so_site
                  and sod_compl_stat = ""
               no-lock:

                  for first si_mstr
                     where si_mstr.si_domain = sod_domain
                     and   si_mstr.si_site   = sod_site
                  no-lock: end.
                  if available si_mstr then do:
                     /* VERIFY OPEN GL PERIOD FOR LINE LEVEL SITE ENTITY */
                     {us/gp/gpglef2.i &module = ""SO""
                                &entity = si_mstr.si_entity
                                &date   = eff_date
                                &loop   = "invoiceloop"
                                &result  = undo_all}
                  end.
               end. /* FOR EACH sod_det.... */

               /* Get current rate if SO rate is not fixed */
               if so_mstr.so_fix_rate = no then do:

                  /* Create usage records for posting; delete later. */
                  {us/gp/gprunp.i "mcpl" "p" "mc-create-ex-rate-usage"
                    "(input  so_curr,
                      input  base_curr,
                      input  so_ex_ratetype,
                      input  eff_date,
                      output exch_rate,
                      output exch_rate2,
                      output exch_exru_seq,
                      output mc-error-number)"}
                  if mc-error-number <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=4}
                     undo, retry.
                  end.
               end.

               /* Copy rate from SO if using fixed rate */
               else
                  assign
                     exch_rate     = so_mstr.so_ex_rate
                     exch_rate2    = so_mstr.so_ex_rate2
                     exch_exru_seq = so_mstr.so_exru_seq.

               avail_abs = no.

               /* abs_recid only has a value when soivpst1 is called from Shipper Confirm */
               for first abs_mstr where recid(abs_mstr) = abs_recid
               no-lock:
                  avail_abs = yes.
               end.

               if (using_line_charges or using_container_charges)
               then do:
                   /* ASSIGN THE INVOICE NUMBER TO THE abs_mstr AND */
                   /* absl_det RECORDS BEING PROCESSED.             */
                   {us/gp/gprunmo.i
                      &program = ""soivpst2.p""
                      &module = "ACL"
                      &param = """(input abs_recid,
                                   input so_nbr,
                                   input so_site,
                                   input so_inv_nbr)"""}
               end. /* IF AVAIL_ABS */

               /* TOTAL THE ORDER FOR TRAILER AND GL DETAIL */

               if (using_line_charges or using_container_charges)
               then do:
                  /* GET THE CONTAINER AND LINE CHARGE TOTALS */
                  /* AND PASS THEM TO soivtrl2.p SO THAT THEY */
                  /* CAN BE CALCULATED AND PRINTED ON THE     */
                  /* INVOICE POST TRAILER.                    */
                  {us/gp/gprunmo.i
                     &program = ""soivpst3.p""
                     &module = "ACL"
                     &param = """(input so_recno,
                                  output cont_charges,
                                  output line_charges)"""}
               end. /* IF using_line_charges ... */

               /* TOTAL ORDER, BUT DON'T PRINT THE DETAIL */
               /* REPORT YET                              */
               undo_trl2 = true.
               if not l_consolflg
               then do:
                  /* NOW SSM DEPOT ORDER CREATES SO, WITH ALL THE LINES */
                  /* OF MEMO TYPE. SO SHIPMENT IS USED TO SHIP THOSE LINES */
                  /* SO SHIPMENT WILL CREATE THE tx2d_det WITH TYPE 13 */

                  if so_fsm_type = "FSM-RO"
                     and not depotCall
                  then do:

                     find first tx2d_det
                        where tx2d_domain  = global_domain
                        and   tx2d_ref     = so_nbr
                        and   tx2d_tr_type = "38"
                     no-lock no-error.

                     if available tx2d_det
                     then do:

                        {us/bbi/gprun.i ""txdetcpy.p""
                                 "(input so_nbr,
                                   input so_quote,
                                   input '38',
                                   input so_inv_nbr,
                                   input so_nbr,
                                   input '16')"}
                     end. /* IF AVAILABLE tx2d_det " */
                     else do:

                        if so_taxable = yes
                        then do:
                           find first txc_ctrl
                              where txc_ctrl.txc_domain = global_domain
                           no-lock no-error.

                           if available txc_ctrl
                           then do:

                              create tx2d_det.
                              assign
                                 tx2d_det.tx2d_domain   = global_domain
                                 tx2d_det.tx2d_ref      = so_inv_nbr
                                 tx2d_det.tx2d_nbr      = so_nbr
                                 tx2d_det.tx2d_tr_type  = "16"
                                 tx2d_det.tx2d_tax_env  = txc_ctrl.txc_tax_env
                                 tx2d_det.tx2d_tax_code = txc_ctrl.txc_tax_code
                                 tx2d_det.tx2d_by_line  = txc_ctrl.txc_by_line
                                 tx2d_det.tx2d_line     = 0
                                 tx2d_det.tx2d_trl      = "".
                           end. /* IF AVAILABLe txc_ctrl */
                        end.  /* IF so_taxable = yes */
                     end. /* IF NOT AVAILABLE tx2d_det */
                  end. /* IF so_fsm_type = "FSM-RO" */

                  else do:
                     find first tx2d_det
                        where tx2d_domain  = global_domain
                        and   tx2d_ref     = so_nbr
                        and   tx2d_tr_type = "13"
                     no-lock no-error.

                     if not available tx2d_det
                     then do:
                        if so_fsm_type = "RMA"
                        then do:
                           {us/bbi/gprun.i ""txdetcp1.p""
                                    "(input so_nbr,
                                      input '',
                                      input '36',
                                      input so_inv_nbr,
                                      input so_nbr,
                                      input '16')"}
                        end. /* IF so_fsm_type = "RMA" */

                        if so_fsm_type = ""
                        then do:
                           {us/bbi/gprun.i ""txdetcp1.p""
                                    "(input so_nbr,
                                      input '',
                                      input '11',
                                      input so_inv_nbr,
                                      input so_nbr,
                                      input '16')"}
                        end. /* IF so_fsm_type = "" */
                     end. /* IF NOT AVAIL tx2d_det */

                     else do:
                        {us/bbi/gprun.i ""txdetcpy.p""
                                 "(input so_nbr,
                                   input '',
                                   input '13',
                                   input so_mstr.so_inv_nbr,
                                   input so_nbr,
                                   input '16')"}
                     end. /* IF AVAILABLE tx2d_det */
                  end. /* IF so_fsm_type <> "FSM-RO" */
               end. /* IF NOT l_consolflg */

               {us/bbi/gprun.i ""soivtrl2.p""
                  "(input so_inv_nbr,
                    input so_nbr,
                    input col-80 /* REPORT WIDTH */,
                    input '16'   /* TRANSACTION TYPE */,
                    input cont_charges,
                    input line_charges,
                    input l_consolidate)"}

               if undo_trl2 then return.

               assign crtint_amt = 0.

               /* sotrhstb.p CREATES TEMP-TABLE TO STORE tr_hist RECORDS AND */
               /* RETRIEVE IN soauthbl.p AND soivpste.p TO IMPROVE THE       */
               /* PERFORMANCE WHILE PRINTING AUTHORIZATION NUMBERS FOR       */
               /* SCHEDULE ORDERS AND LOTSERIAL NUMBER RESPECTIVELY.         */

               if  so_sched   = yes
               and so__qadc03 = "yes"
               and not can-find(first t_tr_hist1
                                   where t_tr_nbr = so_nbr)
               then do:

                 /* REPLACED SECOND PARAMETER FROM so_inv_nbr WITH BLANK */
                 /* INORDER TO MATCH THE INVOICE TOTAL WITH DR/CR MEMO TOTAL */

                  {us/bbi/gprun.i ""sotrhstb.p""
                     "(input so_nbr,
                       input '',
                       input-output table t_tr_hist1)"}

               end. /* IF (so_sched or ... */

               l_ord_contains_tax_in_lines = can-find (first sod_det
                                                where sod_domain = global_domain
                                                and   sod_nbr = so_nbr
                                                and   sod_taxable
                                                and   sod_tax_in).

               /* GET ORDER DETAIL  */
               for each sod_det
                  where sod_domain   = global_domain
                  and sod_nbr        = so_nbr
                  and sod_line       > 0
                  and sod_qty_inv   <> 0
                  and sod_compl_stat = ""
               no-lock
               break by sod_line with frame e width 132:

                  sod_recno = recid(sod_det).
                  run p-abs-mstr.

                  /* CALL INVOICES (REPAIRS) SHOULD HAVE A ZERO QTY
                   * BACKORDERED.  OTHERWISE, CALCULATE IT... */
                  if so_fsm_type = "FSM-RO" then
                     qty_bo = 0.
                  else if sod_qty_ord >= 0 then
                     qty_bo = max(sod_qty_ord - sod_qty_ship, 0).
                  else
                     qty_bo = min(sod_qty_ord - sod_qty_ship, 0).

                  assign
                     net_list  = sod_list_pr
                     net_price = sod_price.

                  /* IN CASE OF SERVICE CONTRACTS ROUND (PRICE * ITEM QTY)   */
                  /* AND MULTIPLY THE RESULT WITH QTY PER AND ROUND IT AGAIN */

                  if (so_fsm_type = "SC")
                  then do:
                     ext_price = net_price * sod_qty_item.
                     if can-find (sac_ctrl
                                     where sac_domain = global_domain
                                     and   sac_int_rnd)
                     then do:
                        run p-rounding
                           (input-output ext_price,
                            input        rndmthd,
                            output       mc-error-number).

                        if mc-error-number <> 0
                        then do:
                           {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                        end. /* IF mc-error-number <> 0 */
                     end. /* IF CAN-FIND (sac_ctrl ... */
                     ext_price = ext_price * sod_qty_per.

                  end. /* IF so_fsm_type = "SC" */
                  else
                     ext_price = net_price * sod_qty_inv.

                  run p-rounding (input-output ext_price,
                                  input  rndmthd,
                                  output mc-error-number).

                  if mc-error-number <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                  end.

                  /* CHECK AUTHORIZATION RECORDS FOR DIFFERENT EXTENDED PRICE */
                  if  sod_sched  = yes
                  and so__qadc03 = "yes"
                  then do:

                 /* REPLACED SECOND PARAMETER FROM so_inv_nbr WITH BLANK */
                 /* INORDER TO MATCH THE INVOICE TOTAL WITH DR/CR MEMO TOTAL */

                     auth_found = no.
                     {us/bbi/gprun.i ""soauthbl.p""
                        "(input  table t_tr_hist1,
                          input  '',
                          input  so__qadc03,
                          input  sod_nbr,
                          input  sod_line,
                          input  net_price,
                          input  sod_site,
                          input  ext_price,
                          output auth_price,
                          output auth_found)"}

                     ext_price = auth_price.

                  end. /* IF sod_sched */


                  if (so_fsm_type = "SC")
                  then do:
                     ext_list = net_list * sod_qty_item.
                     if can-find (sac_ctrl
                                     where sac_domain = global_domain
                                     and   sac_int_rnd)
                     then do:
                        run p-rounding
                           (input-output ext_list,
                            input        rndmthd,
                            output       mc-error-number).

                        if mc-error-number <> 0
                        then do:
                           {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                        end. /* IF mc-error-number <> 0 */
                     end. /* IF CAN-FIND (sac_ctrl ... */

                     ext_list = ext_list * sod_qty_per.

                  end. /* IF so_fsm_type = "SC" */
                  else
                     ext_list = net_list * sod_qty_inv.

                  run p-rounding (input-output ext_list,
                                  input  rndmthd,
                                  output mc-error-number).

                  if mc-error-number <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                  end.

                  /* CHECK AUTHORIZATION RECORDS FOR DIFFERENT EXTENDED PRICE */
                  if  sod_sched  = yes
                  and so__qadc03 = "yes"
                  then do:

                 /* REPLACED SECOND PARAMETER FROM so_inv_nbr WITH BLANK */
                 /* INORDER TO MATCH THE INVOICE TOTAL WITH DR/CR MEMO TOTAL */

                     auth_found = no.
                     {us/bbi/gprun.i ""soauthbl.p""
                        "(input  table t_tr_hist1,
                          input  '',
                          input  so__qadc03,
                          input  sod_nbr,
                          input  sod_line,
                          input  net_list,
                          input  sod_site,
                          input  ext_list,
                          output auth_price,
                          output auth_found)"}

                     ext_list = auth_price.

                  end. /* IF sod_sched */


                  assign
                     ext_disc      = ext_list - ext_price
                     tot_line_disc = tot_line_disc + ext_disc
                     base_cost     = sod_std_cost.

                  /* SOD_STD_COST IS STORED IN BASE - IF DIFFERENT FROM */
                  /* DOC CURRENCY CONVERT IT TO DOC TO CALCULATE GROSS  */
                  /* MARGIN IN DOC CURRENCY. */
                  if base_curr <> so_curr then do:
                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                        "(input base_curr,
                          input so_curr,
                          input so_ex_rate2,
                          input so_ex_rate,
                          input base_cost,
                          input false,
                          output base_cost,
                          output mc-error-number)"}
                     if mc-error-number <> 0 then do:
                        {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                     end.
                  end.

                  gr_margin = net_price - base_cost.

                  if (so_fsm_type = "SC")
                  then do:
                     ext_gr_margin = gr_margin * sod_qty_item.
                     if can-find (sac_ctrl
                                     where sac_domain = global_domain
                                     and sac_int_rnd)
                     then do:
                        run p-rounding
                           (input-output ext_gr_margin,
                            input        rndmthd,
                            output       mc-error-number).

                        if mc-error-number <> 0
                        then do:
                           {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                        end. /* IF mc-error-number <> 0 */
                     end. /* IF CAN-FIND (sac_ctrl ... */

                     ext_gr_margin = ext_gr_margin * sod_qty_per.

                  end. /* IF so_fsm_type = "SC" */
                  else
                     ext_gr_margin = sod_qty_inv * gr_margin.

                  /* ROUND PER DOCUMENT CURR ROUND METHOD */
                  run p-rounding (input-output ext_gr_margin,
                                  input  rndmthd,
                                  output mc-error-number).

                  if mc-error-number <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                  end.

                  assign
                     base_price = ext_price
                     base_margin = ext_gr_margin.

                  if base_curr <> so_curr then do:

                     /* CONVERT BASE PRICE TO BASE CURRENCY */
                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                        "(input so_curr,
                          input base_curr,
                          input exch_rate,
                          input exch_rate2,
                          input base_price,
                          input true,  /* ROUND */
                          output base_price,
                          output mc-error-number)"}
                     if mc-error-number <> 0 then do:
                        {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                     end.

                     /* CONVERT BASE MARGIN TO BASE CURRENCY */
                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                        "(input so_curr,
                          input base_curr,
                          input exch_rate,
                          input exch_rate2,
                          input base_margin,
                          input true,  /* ROUND */
                          output base_margin,
                          output mc-error-number)"}
                     if mc-error-number <> 0 then do:
                        {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                     end.

                  end. /* IF BASE_CURR <> SO_CURR */

                  /* ACCUMULATE CREDIT TERMS INTEREST */
                  if sod_crt_int <> 0 then do:

                     crtint_amt = crtint_amt + (ext_price -
                                  (ext_price / ((sod_crt_int + 100) / 100))).

                     /* ROUND PER CURR ROUND METHOD */
                     run p-rounding (input-output crtint_amt,
                                     input  rndmthd,
                                     output mc-error-number).

                     if mc-error-number <> 0 then do:
                        {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                     end.

                  end.

                  accumulate (base_price) (total).
                  accumulate (base_margin) (total).
                  accumulate (ext_price) (total).
                  accumulate (ext_gr_margin) (total).

                  /* BASE_COST IS ACTUALLY STORED IN FOREIGN CURRENCY */

                  if so_fsm_type = "SC"
                  then do:
                     ext_cost = base_cost * sod_qty_item.
                     if can-find (sac_ctrl
                                     where sac_domain = global_domain
                                     and   sac_int_rnd)
                     then do:
                        run p-rounding
                           (input-output ext_cost,
                            input        rndmthd,
                            output       mc-error-number).

                        if mc-error-number <> 0
                        then do:
                           {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                        end. /* IF mc-error-number <> 0 */
                     end. /* IF CAN-FIND (sac_ctrl ...*/

                     ext_cost = ext_cost * sod_qty_per.

                  end. /* IF so_fsm_type = "SC" */
                  else
                     ext_cost = base_cost * sod_qty_inv.

                  /* ROUND PER FOREIGN CURR ROUND METHOD */
                  run p-rounding (input-output ext_cost,
                                  input  rndmthd,
                                  output mc-error-number).

                  if mc-error-number <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                  end.

                  accumulate (ext_cost)  (total).

                  desc1 = sod_desc.

                  for first pt_mstr
                     where pt_domain = global_domain
                      and  pt_part = sod_part
                  no-lock:
                     if desc1 = "" then
                        desc1 = pt_desc1 + " " + pt_desc2.
                  end.

                  /* UPDATE GL WORKFILE */
                  undo_all = no.

                  /* ADDED FIFTH INPUT PARAMETER p_last_line TO ACCOMODATE */
                  /* THE LOGIC INTRODUCED IN gpcurcnv.i FOR HANDLING       */
                  /* ROUNDING ISSUES                                       */

                  {us/bbi/gprun.i ""sosoglb.p""
                     "(input-output l_so_gl_line,
                       input-output l_so_gltw_line,
                       input-output l_tot_amt,
                       input-output l_tot_ramt,
                       input-output l_addtax1 )" }

                  if undo_all then undo invoiceloop , leave.

                  ext_price:format = ext_price_fmt.
                  ext_gr_margin:format = ext_gr_marg_fmt.

                  do on endkey undo, leave:
                    /* Start invoice certification  */
					 for first en_mstr no-lock
                         where en_mstr.en_domain = global_domain
                           and en_mstr.en_entity = current_entity,
                        first ad_mstr no-lock
                        where ad_mstr.ad_domain = global_domain
                          and ad_mstr.ad_addr = en_mstr.en_addr and
                             (ad_mstr.ad_country = "Portugal" or ad_mstr.ad_country = "PT" or ad_mstr.ad_country = "PRT"):
						 
						 assign isPortugal = true.

					 end.
					 if isPortugal
                     then display
   					    sod_line
                        sod_part
                        sod_um
                        sod_acct sod_cc
                        sod_sub
                        absolute(sod_qty_inv) @ sod_qty_inv
                        sod_taxable sod_taxc
                        absolute(net_price) @ sod_price
                        ext_price
                        ext_gr_margin
                        with frame e. 
					 else display
                        sod_line
                        sod_part
                        sod_um
                        sod_acct sod_cc
                        sod_sub
                        sod_qty_inv
                        sod_taxable sod_taxc
                        net_price @ sod_price
                        ext_price
                        ext_gr_margin
                        with frame e. 
                     /*  End invoice certification  */
                     down 1 with frame e.

                  end. /* DO ON ENDKEY UNDO, LEAVE */

                  if desc1 <> "" then
                  do on endkey undo, leave:
                     put desc1 at 8.
                  end. /* DO ON ENDKEY UNDO, LEAVE */

                  do on endkey undo, leave:
                     put qty_bo to 68.
                  end. /* DO ON ENDKEY UNDO, LEAVE */

                  if desc1 <> ""  then
                  do on endkey undo, leave:
                     put skip.
                  end. /* DO ON ENDKEY UNDO, LEAVE */

                  /* Print Lot/Serial Numbers */
                  if print_lotserials then do:

                     so_db = global_db.

                     assign
                        sonbr = sod_nbr
                        soline = sod_line
                        sopart = sod_part.

                     undo_all = no.

                     if not can-find(first t_tr_hist1)
                     then do:
                        l_invoice_nbr = "".
                        {us/bbi/gprun.i ""sotrhstb.p""
                           "(input so_nbr,
                             input l_invoice_nbr,
                             input-output table t_tr_hist1)"}
                     end. /* IF NOT CAN-FIND ... */

                     {us/bbi/gprun.i ""soivpste.p""
                        "(input table t_tr_hist1)"}

                     if undo_all then undo invoiceloop , leave.

                  end.

                  /* UPDATE AR DETAIL */
                  undo_all = no.

                  {us/bbi/gprun.i ""soivpstb.p"" "(input-output l_addtax2)"}

                  if undo_all then undo invoiceloop , leave.

               end. /* for each sod_det */

               empty temp-table t_tr_hist1.

               if l_ord_contains_tax_in_lines
               then do:
                  run ip_adjust_l_tot_amt
                     (input accum total(ext_price)).

               end. /* IF l_ord_contains_tax_in_lines ... */

               tot_ext_cost = accum total (ext_cost).

               if so_nbr <> l_so_nbr then
                  l_consolidate = yes.

               {us/so/soivtod7.i}

               /* Display Trailer */
               /* (Only display trailer after all SOs for this invoice */
               /* have been printed.)                                  */
               if last-of(so_inv_nbr) then do:

                  assign
                     l_inv_nbr = so_inv_nbr
                     l_lastof  = yes
                     l_so_curr = so_curr .

                  /* PRINT TAX DETAIL FOR ALL SALES ORDERS */
                  /* FOR THIS INVOICE NUMBER USING 132 COL */
                  /* AND NO FORCED PAGE BREAK              */
                  undo_txdetrp = true.

                  /* ADDED SIXTH INPUT PARAMETER '' AND SEVENTH INPUT     */
                  /* PARAMETER yes TO ACCOMMODATE THE LOGIC INTRODUCED IN */
                  /* txdetrpa.i FOR DISPLAYING THE APPROPRIATE CURRENCY   */
                  /* AMOUNT.                                              */

                  {us/bbi/gprun.i ""txdetrp.p""
                     "(input '16',
                       input so_inv_nbr,
                       input '*',
                       input col-80,
                       input 0,
                       input '',
                       input yes)"}

                  if so_curr <> base_curr
                     and isEUtransaction(so_site, so_cust) then do:
                     assign l_basetaxtot = 0.

                     for each tx2d_det where tx2d_domain = global_domain
                                         and tx2d_ref = so_inv_nbr
                                         and tx2d_nbr = so_nbr
                                         and tx2d_tr_type = "16"
                                         and tx2d_tax_code <> "00000000"
                     no-lock:

                        /* CONVERT L_TOT_AMT TO BASE_CURRENCY */
                        {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                           "(input  so_curr,
                             input  base_curr,
                             input  exch_rate,
                             input  exch_rate2,
                             input  tx2d_cur_tax_amt,
                             input  true, /* ROUND */
                             output l_basesubtot,
                             output mc-error-number)" }

                        if mc-error-number <> 0 then do:
                           {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                        end. /* IF MC-ERROR-NUMBER <> 0 */
                        assign l_basetaxtot = l_basetaxtot + l_basesubtot.

                     end.

                     {us/so/soivto11.i &totaltaxbase=l_basetaxtot
                                 &totaltax=invtot_tax_amt
                                 &socurr=so_curr
                                 &eusite=so_site
                                 &euship=so_ship
                                 &eubill=so_bill
                                 &base_only=no
                                 &linepos=66
                                 &labelpos=51}
                  end.

                  if undo_txdetrp
                  then do:
                     assign undo_all = true.
                     undo invoiceloop, leave.
                  end.

                  {us/so/soivtod8.i}

/*jpm*/ /*Temporarily remove PRM */
/*
                  if so_fsm_type = "PRM" and so_prepaid <> 0 then do:

                     assign
                        prepaid-amt = so_prepaid + so_prep_tax
                        amt-due = invtot_ord_amt - prepaid-amt
                        price_fmt = "-zzzz,zzz,zz9.99"
                        l_tempref = "pre".

                     /* IF PREPAYMENTS EXIST WITH TAX, THEN CREATE */
                     /* REVERSING tx2d_det RECORD TO AVOID         */
                     /* OVERSTATEMENT OF TAX                       */

                     if so_prep_tax <> 0
                     then do:
                        {us/bbi/gprun.i ""txdetcpy.p""
                           "(input so_nbr,
                             input '',
                             input '13',
                             input l_tempref,
                             input so_nbr,
                             input '16')"}
                     end. /* IF so_prep_tax <> 0 */

                     /* NOW UPDATE THE tx2d_det RECORD WITH THE CORRECT */
                     /* VALUES FOR tx2d_ref, tx2d_trl AND tx2d_tax_amt  */

                     for each tx2d_det
                        where tx2d_domain  = global_domain
                        and   tx2d_ref     = l_tempref
                        and   tx2d_nbr     = so_nbr
                        and   tx2d_tr_type = "16"
                        exclusive-lock:

                        assign
                           tx2d_ref         = so_inv_nbr
                           tx2d_trl         = l_tempref
                           tx2d_tax_amt     = - (so_prep_tax)
                           tx2d_cur_tax_amt = - (so_prep_tax)
                           tx2d_tottax      = - (so_prepaid)
                           tx2d_totamt      = - (so_prepaid).

                     end. /* FOR EACH tx2d_det */

                     {us/bbi/gprun.i ""gpcurfmt.p""
                        "(input-output price_fmt,
                          input rndmthd)"}

                     form
                        so_prepaid  colon 15
                        prepaid-amt colon 60 label "Total Prepaid"
                        skip
                        so_prep_tax colon 15
                        "-----------------" at 61
                        skip
                        amt-due     colon 60 label "Amount Due"
                     with frame prep-frame side-labels width 80.

                     /* SET EXTERNAL LABELS */
                     setFrameLabels(frame prep-frame:handle).

                     assign
                        so_prepaid  :format
                           in frame prep-frame = price_fmt
                        prepaid-amt :format
                           in frame prep-frame = price_fmt
                        so_prep_tax :format
                           in frame prep-frame = price_fmt
                        amt-due     :format
                           in frame prep-frame = price_fmt.

                     do on endkey undo, leave:
                        display
                           so_prepaid
                           prepaid-amt
                           so_prep_tax
                           amt-due
                        with frame prep-frame.
                     end. /* DO ON ENDKEY UNDO, LEAVE */

                     assign
                        prepaid-amt = 0
                        amt-due = 0.

                  end. /* IF SO_FSM_TYPE = "PRM" */
*/
               end. /* if last-of(so_inv_nbr) */

               /* GLTRANS WORKFILE POST */
               assign
                  undo_all    = no
                  l_last_inv_flag = last-of(so_inv_nbr).

               if l_last_inv_flag then
                  ord_amt = invtot_ord_amt.
               else
                  ord_amt = 0.

               /* GL Transaction Workfile Post */
               {us/bbi/gprun.i ""sosogla.p""
                  "(input-output l_ar_gl_line,
                    input-output l_ar_gltw_line,
                    input-output l_tot_amt,
                    input-output l_tot_ramt,
                    input l_so_gl_line,
                    input l_so_gltw_line,
                    input cont_charges,
                    input line_charges,
                    input l_last_inv_flag,
                    input-output l_addtax3 )" }

               if undo_all then undo invoiceloop , leave.

               /* Check to see if we should create installed base  */
               /* SERVICE CONTRACT ORDERS AND CALL INVOICE (REPAIR */
               /* ORDERS) DO NOT UPDATE THE INSTALLED BASE.        */
               if insbase then do:
                  if so_fsm_type begins "SC"
                     or (so_fsm_type = "FSM-RO" and not depotCall)
                     then .
                  else do:
                     /* CREATE ISB FOR DEPOT ORDER */
                     undo_all = no.
                     {us/bbi/gprun.i ""fsivpcfa.p""
                        " (input p_prtInstBase,
                           output table ttisb append)"}
                     if undo_all then undo invoiceloop , leave.
                  end.
               end.

               /* FOR CALL INVOICES, CREATE GL TRANSACTIONS TO */
               /* CREDIT WIP AND DEBIT COGS.                   */
               if so_fsm_type = "FSM-RO" then do:

                  if not available sac_ctrl then
                     for first sac_ctrl
                        where sac_domain = global_domain
                     no-lock: end.

                  {us/bbi/gprun.i ""fsivpcfb.p""
                     "(input so_nbr,
                       input sac_sa_pre,
                       input eff_date)"}

               end.   /* if so_fsm_type= "FSM-RO" */

/*jpm*/ /*Temporarily remove PRM */
/*
               /* FOR PRM INVOICES, CREATE GL TRANSACTIONS TO   */
               /* CREDIT WIP AND DEBIT COGS FOR ALL PROJ LINES  */
               if so_fsm_type = "PRM" then do:

                  /* WIP -> COGS GL BOOKINGS */
                  {us/gp/gprunmo.i
                     &module="PRM"
                     &program="pjivpst.p"}

                  /* ARCHIVE SFB_DET FOR INVOICE REPRINT */
                  {us/gp/gprunmo.i
                     &module="PRM"
                     &program="pjsfbdet.p"
                     &param="""(input so_nbr)"""}

               end. /* IF SO_FSM_TYPE = "PRM" */
*/
               cur-sonbr = so_nbr.

               /* UPDATE AR MASTER FILE AND DELETE ORDER */
               /* INVOICE NUMBER HAS TO BE STORED IN CASE OF SO DELETION */
               assign promo_inv = if last-of(so_inv_nbr)
                                  then
                                     so_inv_nbr
                                  else
                                     ""
                      undo_all = no
                      ord_amt   = if last-of(so_inv_nbr)
                                  then
                                     invtot_ord_amt
                                  else
                                     0
                      billTo = so_bill.

               {us/bbi/gprun.i ""soivpsta.p""
                  "(input        l_consolidate,
                    input        l_po_schd_nbr,
                    input        daybook,
                    input        line_charges,
                    output       vglamt,
                    input-output l_tot_amt1,
                    input-output l_tot_ramt1)" }

               /* RECALCULATE THE TAXES */
               if available so_mstr
                  and so_compl_stat = ""
                  and not so_sched
               then do:
                  empty temp-table t_tx2d.
                  for each tx2d_det
                     where tx2d_domain  = global_domain
                       and tx2d_ref     = so_nbr
                       and tx2d_tr_type = "11"
                  no-lock:
                     create t_tx2d.
                     assign
                        t_ref         = tx2d_ref
                        t_line        = tx2d_line
                        t_edited      = tx2d_edited
                        t_cur_tax_amt = tx2d_cur_tax_amt
                        t_tax_amt     = tx2d_tax_amt
                        t_ent_tax_amt = tx2d_ent_tax_amt.
                  end. /* FOR EACH tx2d_det */

                  /* IF DEPOT ORDER THEN TAX TYPE IS 38 ELSE 11 */
                  {us/bbi/gprun.i ""txcalc.p""
                     "(input  if depotCall then 38 else 11,
                       input  so_nbr,
                       input  if depotCall then """" else so_quote,
                       input  0, /*ALL LINES*/
                       input  no,
                       output mc-error-number)"}

                  for each t_tx2d:
                     find tx2d_det
                        where tx2d_domain  = global_domain
                          and tx2d_ref     = t_tx2d.t_ref
                          and tx2d_line    = t_tx2d.t_line
                          and tx2d_tr_type = "11"
                     exclusive-lock no-error.
                     if available tx2d_det
                     and t_tx2d.t_edited = yes
                     then
                        assign
                           tx2d_edited      = t_tx2d.t_edited
                           tx2d_cur_tax_amt = t_tx2d.t_cur_tax_amt
                           tx2d_tax_amt     = t_tx2d.t_tax_amt
                           tx2d_ent_tax_amt = t_tx2d.t_ent_tax_amt.
                  end. /* FOR EACH t_tx2d */
               end. /* IF AVAILABLE so_mstr */

               /* DURING INVOICE POST IF TAX RATE IS NOT FOUND THEN */
               /* SHOW ERROR AND DO NOT ALLOW POSTING OF INVOICE    */
               if mc-error-number = 934
                  and (execname = "soivpst.p"
                  or   execname  = "rcsois.p"
                  or   execname  = "rcauis.p"
/*d4081-877*/     or   execname  = "xxauis.p"  )
               then do:
                  {us/bbi/pxmsg.i &MSGNUM=871 &ERRORLEVEL=3}
                  undo_all = yes.
               end. /* IF execname =  "soivpst.p" */

               if undo_all then do:

                  /* Error occurred. Invoice processing terminated */
                  {us/bbi/pxmsg.i &MSGNUM=2197 &ERRORLEVEL=4 &MSGBUFFER=error_msg}.

                  display
                     skip(3)
                     error_msg
                     skip(3)
                  with frame unpost no-labels width 80.

                  undo invoiceloop , leave.

               end.

               if soc_apm and promo_inv <> "" then do:
                  complete = no.
                  apm-ex-prg = "ifapm053.p".
                  apm-ex-sub = "if/".
                  {us/gp/gprunex.i
                     &module   = 'APM'
                     &subdir   = apm-ex-sub
                     &program  = 'ifapm053.p'
                     &params   = "(input promo_inv,
                                   output error_flag,
                                   output err_mess_num)"}
                  if error_flag then do:
                     {us/bbi/pxmsg.i &MSGNUM=err_mess_num &ERRORLEVEL=3}
                     undo_all = yes.
                  end.
               end.

               if undo_all then do:
                  /* Error occurred in APM. Invoice posting terminated */
                  {us/bbi/pxmsg.i &MSGNUM=2198 &ERRORLEVEL=4 &MSGBUFFER=error_msg}.
                  display
                     skip(3)
                     error_msg
                     skip(3)
                  with frame unpost no-labels width 80.
                  undo invoiceloop, leave.
               end.

               /* Delete exchange rate usage if not attached to SO */
               if not available so_mstr or
                  exch_exru_seq <> so_exru_seq or
                  so_compl_stat <> ""
               then do:
                  {us/gp/gprunp.i "mcpl" "p" "mc-delete-ex-rate-usage"
                     "(input exch_exru_seq)" }
               end.

               if l_lastof then do:

                  assign
                     l_lastof = no
                     orderTotal = getInvoiceTotal(l_so_nbr).
                     inv_type = getInvoiceType(l_so_nbr,orderTotal).

                  /* IF PROPLUS SELF-BILLING IS ENABLED THEN */
                  /* COMPARE six_ref AMOUNTS WITH AR AMOUNTS */
                  if can-find(first sbic_ctl
                         where sbic_domain = global_domain and
                               sbic_active = yes)
                  then
                     run p_sixref_balance(input l_inv_nbr,
                                          input billTo,
                                          input orderTotal).

                  if soc_ar then
                     run createInvoiceTax in hQADFinInvPostLib
                        (input l_inv_nbr,
                         input post_entity).
 
                  run createGiaPostings in hQADFinInvPostLib
                     (input l_inv_nbr,
                      input l_intco_inv_nbr,
                      input post_entity,
                      input table ttGIATransactions by-reference,
                      input eff_date,
                      input inv_type ).
 
                  run createPostings in hQADFinInvPostLib
                     (input l_inv_nbr,
                      input eff_date,
                      input post_entity,
                      input inv_type,
                      input table ttGiaTransactions by-reference).
             
                  run createInterCoPostings in hQADFinInvPostLib
                     (input l_inv_nbr,
                      input l_intco_inv_nbr,
                      input eff_date,
                      input post_entity,
                      input inv_type,
                      input table ttGiaTransactions by-reference).

                  assign undo_all = false.

                  for first ih_hist
                     where ih_domain  = global_domain
                       and ih_inv_nbr = l_inv_nbr
                  no-lock:

                        /* UPDATE CUSTOMER LAST SALE FIELD */
                     for first cm_mstr
                        where cm_mstr.cm_domain = global_domain
                        and   cm_mstr.cm_addr   = ih_bill
                     exclusive-lock:
                        assign
                           cm_mstr.cm_sale_date = max(cm_mstr.cm_sale_date,ih_inv_date).
                     end.
                  end.
                  /* Send the invoice postings to the financials and process any errors that occur. */
                  /* InvoiceCerification 20110405 : Extend the call to "run sendInvoicePostings in hQADFinInvPostLib" with the two new parameters that hold the invoice-certification data */
                  run sendInvoicePostings in hQADFinInvPostLib
                     (input l_inv_nbr,
                      input post_entity, 
                    
                      output DIInvCertCertificate ,
                      output DIInvCertSignatureCurr , 

                      output table tFcMessages,
                      output err_flag ).
                    
                    /* InvoiceCerification 20110405 : Store the invoice-certification data into the ih_hist record in field ih__qadc05 */
                    if DIInvCertCertificate   <> "":U and 
                       DIInvCertCertificate   <> ?    and 
                       DIInvCertSignatureCurr <> "":U and 
                       DIInvCertSignatureCurr <> ?
                    then do :
                        find ih_hist where
                             ih_hist.ih_domain  = global_domain and 
                             ih_hist.ih_inv_nbr = l_inv_nbr
                             no-prefetch no-error.
                        if available ih_hist
                        then Assign ih_hist.ih__qadc05 = DIInvCertCertificate + chr(4) + 
                                                         substring(DIInvCertSignatureCurr,1,1,'character':U) + 
                                                         substring(DIInvCertSignatureCurr,11,1,'character':U) + 
                                                         substring(DIInvCertSignatureCurr,21,1,'character':U) + 
                                                         substring(DIInvCertSignatureCurr,31,1,'character':U).
                    end. /* if DIInvCertCertificate   <> "":U and */
                    

                  if err_flag < 0 then do:
                     if pShipperConf 
                     then do:

                        if pPostFile <> ""
                        then 
                           output to value(pPostFile).
    
                        run mfairunh.p
                           (input  'qflib.p',
                            input  '?',
                            output hQADFinInvPostLib) no-error.
                        run processErrors in hQADFinInvPostLib
                           (input table tFcMessages,
                            input 3).
                        
                        if pPostFile <> ""
                        then
                           output close.
                      end. /* IF pShipperConf */

                     assign undo_all = true.
                     for each tFcMessages with frame ferr:
                        if not errorSummary
                        then do:
                            display
                               tFcMessages.tcFcMsgNumber
                               tFcMessages.tcFcMessage
                               tFcMessages.tcFcContext
                               tFcMessages.tcFcFieldName
                               tFcMessages.tcFcFieldValue
                               with frame ferr.
                            down.
                        end.
                        else do:
                            /* Store error messages for summary display at the end of the report */
                            create invoiceErrors.
                            assign
                                invoiceErrors.invoiceNumber = l_inv_nbr
                                invoiceErrors.salesOrderNum = l_so_nbr
                                invoiceErrors.billTo = billTo
                                invoiceErrors.errorMessage = tFcMessages.tcFcMessage
                                invoiceErrors.errorNumber = tFcMessages.tcFcMsgNumber
                                invoiceErrors.severity = if tFcMessages.tcFcType = "w" then "w" else "e".

                         end.
                     end.
                     undo invoiceloop , leave invoiceloop.
                  end.
                  else if err_flag > 0 then do:
                     tFcMessages.tcFcMessage:label in frame ferr = getTermLabel("INVOICE_POST_WARN",50).
                     for each tFcMessages with frame ferr:
                        if not errorSummary
                        then do:
                            display
                               tFcMessages.tcFcMsgNumber
                               tFcMessages.tcFcMessage
                               tFcMessages.tcFcContext
                               tFcMessages.tcFcFieldName
                               tFcMessages.tcFcFieldValue
                               with frame ferr.
                            down.
                        end.
                        else do:

                            create invoiceErrors.
                            assign
                                invoiceErrors.invoiceNumber = l_inv_nbr
                                invoiceErrors.salesOrderNum = l_so_nbr
                                invoiceErrors.billTo = billTo
                                invoiceErrors.errorMessage = tFcMessages.tcFcMessage
                                invoiceErrors.errorNumber = tFcMessages.tcFcMsgNumber
                                invoiceErrors.severity = if tFcMessages.tcFcType = "w" then "w" else "e".
                        end.
                     end.
                  end.

                  /* Send the GIA transactions */
                  run sendGiaPostings in hQADFinInvPostLib
                     ( input l_inv_nbr,
                       input table ttGIATransactions by-reference,
                       output table tFcMessages,
                       output err_flag ).

                   if err_flag > 0 then do:
                      tFcMessages.tcFcMessage:label in frame ferr = getTermLabel("INVOICE_POST_WARN",50).
                      for each tFcMessages with frame ferr:
                         if not errorSummary
                         then do:
                             display
                                tFcMessages.tcFcMsgNumber
                                tFcMessages.tcFcMessage
                                tFcMessages.tcFcContext
                                tFcMessages.tcFcFieldName
                                tFcMessages.tcFcFieldValue
                                with frame ferr.
                             down.
                         end.
                         else do:
                             create invoiceErrors.
                             assign
                                invoiceErrors.invoiceNumber = l_inv_nbr
                                invoiceErrors.salesOrderNum = l_so_nbr
                                invoiceErrors.billTo = billTo
                                invoiceErrors.errorMessage = tFcMessages.tcFcMessage
                                invoiceErrors.errorNumber = tFcMessages.tcFcMsgNumber
                                invoiceErrors.severity = "w".
                         end.
                      end.
                   end.

                  /* Send the intercompany transactions */
                  run sendInterCoPostings in hQADFinInvPostLib
                     ( input l_inv_nbr,
                       input l_intco_inv_nbr,
                       input post_entity,
                       output table tFcMessages,
                       output err_flag ).

                   if err_flag > 0 then do:
                      tFcMessages.tcFcMessage:label in frame ferr = getTermLabel("INVOICE_POST_WARN",50).
                      for each tFcMessages with frame ferr:
                         if not errorSummary
                         then do:
                             display
                                tFcMessages.tcFcMsgNumber
                                tFcMessages.tcFcMessage
                                tFcMessages.tcFcContext
                                tFcMessages.tcFcFieldName
                                tFcMessages.tcFcFieldValue
                                with frame ferr.
                             down.
                         end.
                         else do:
                             create invoiceErrors.
                             assign
                                invoiceErrors.invoiceNumber = l_inv_nbr
                                invoiceErrors.salesOrderNum = l_so_nbr
                                invoiceErrors.billTo = billTo
                                invoiceErrors.errorMessage = tFcMessages.tcFcMessage
                                invoiceErrors.errorNumber = tFcMessages.tcFcMsgNumber
                                invoiceErrors.severity = "w".
                         end.
                      end.
                   end.
                                   
                  /* Decide if we need to use credit card and */
                  /* if we do then make a payment             */
                  run processCreditCard
                     (input l_inv_nbr,
                      output cardProcessed,
                      output success,
                      output msgNbr).

                  if cardProcessed then do:
                     if success = false then do:

                     /* No MFG/PRO errors occurred but VeriSign
                      * returned an error - post invoice anyway
                      */
                        if msgNbr = 0 then do:
                           /* VeriSign transaction was not successful*/
                           {us/bbi/pxmsg.i &MSGNUM=3810 &ERRORLEVEL=2 &MSGBUFFER=msgText}

                           /* Invoice posted but VeriSign returned an error*/
                           {us/bbi/pxmsg.i &MSGNUM=3490 &ERRORLEVEL=2 &MSGBUFFER=error_msg}
                        end.
                        else
                           {us/bbi/pxmsg.i &MSGNUM=msgNbr &ERRORLEVEL=2 &MSGBUFFER=error_msg}

                        display
                           skip(3)
                           msgText   skip
                           error_msg skip
                           skip(3)
                        with frame unpost2 no-labels width 80.

                     end.

                  end. /*if cardProcessed then do:*/
                  if not undo_all and
                     prog_name = "socnpst.p" and
                     index(global_ref,l_inv_nbr) = 0
                  then
                     global_ref = global_ref + "," + l_inv_nbr.

               end.  /* if l_lastof */

            end. /*for each so_mstr*/
           /* DELETE STRANDED/EXPORTED  GLT_DET RECORDS FOR "SO" ALSO UPDATE */
           /* CO_CTRL IF IT IS THE FIRST TIME FOR THE DOMAIN. CO_CTRL UPDATE */
           /* IS KEPT IN SYNC WITH       THE LOGIC IN OPERATIONAL TRANSACTION POST */
           for each glt_det where glt_det.glt_domain = global_domain
                       and glt_det.glt_ref    = l_inv_nbr
                       and glt_det.glt_batch  = batch
                       and glt_det.glt_tr_type = "SO"
                       and glt_det.glt_unb    = no
                       and glt_det.glt_exp    = yes
           exclusive-lock :
              for first co_ctrl
                 where co_ctrl.co_domain = glt_det.glt_domain
                   and co_ctrl.co_so_trans_exp = no
              exclusive-lock :
                 co_so_trans_exp = yes.
              end.

              /* Find the qad_wkfl records required GIA transactions and delete them. */
              for each qad_wkfl where qad_domain = global_domain
                                and qad_key1   = "GIA|" + trim(glt_det.glt_ref) + '|' + string(glt_det.glt_line)
              exclusive-lock:
                 delete qad_wkfl.
              end.

              delete glt_det.
           end.   /* for each glt_det */
           /* DELETE ANY GIA TRANSACTIONS */
           for each ttGiaTransactions no-lock:
              for each glt_det where glt_det.glt_domain = global_domain
                 and glt_det.glt_ref     = cGIATransRef
                 and glt_det.glt_batch   = batch
                 and glt_det.glt_tr_type = "SO"
                 and glt_det.glt_unb     = no
                 and glt_det.glt_exp     = yes
              exclusive-lock :
                 /* Find the qad_wkfl records required GIA transactions and delete them. */
                 for each qad_wkfl where qad_domain = global_domain
                              and qad_key1   = "GIA|" + trim(glt_det.glt_ref) + '|' + string(glt_det.glt_line)
                 exclusive-lock:
                    delete qad_wkfl.
                 end.
                 delete glt_det.
              end.
           end.
           
            run proxy/committransaction.p (output dataset tFcMEssages,
                                             output finAPIError).    
            if finAPIError < 0
              then do:
               /* Start qflib.p - QAD Financials Library running persistently */
                 run mfairunh.p
                  (input  'qflib.p',
                   input  '?',
                   output hQADFinInvPostLib) no-error.
                 run processErrors in hQADFinInvPostLib
                  (input table tFcMessages,
                   input 3).
                 assign undo_all = true.
                 undo invoiceloop, leave invoiceloop.      
            end.
            else                    
                assign finTransCommitted = true.  
             
            finally:                  
                if not finTransCommitted
                then do:                      
                    /* ===================================================== */        
                    /* End the Financial transaction on the FIN Appserver    */        
                    /* ===================================================== */ 
                   run proxy/rollbacktransaction.p (output dataset tFcMEssages,
                                                     output finAPIError).                                                        
                end.      
            end. /* finally */     
         end. /*invoiceloop*/         

         if errorSummary
         then do:
             run getAllExceptions (output dataset dsExceptions).
             for each temp_err_msg:
                   create invoiceErrors.
                   assign
                        invoiceErrors.salesOrderNum = l_so_nbr
                        invoiceErrors.billTo = sobillto
                        invoiceErrors.errorMessage = temp_err_msg.tt_msg_desc
                        invoiceErrors.errorNumber = temp_err_msg.tt_msg_nbr
                        invoiceErrors.severity = temp_err_msg.tt_msg_sev.
                   if l_inv_nbr <> ""
                   then
                       assign invoiceErrors.invoiceNumber = l_inv_nbr.
                   else if new_invnbr <> ""
                   then
                       assign invoiceErrors.invoiceNumber = new_invnbr.
                   else
                       assign invoiceErrors.invoiceNumber = soinvnbr.
            end.
         end.
         if undo_all then do:
            for each so_mstr where so_domain = global_domain
               and so_inv_nbr = soinvnbr
            exclusive-lock:
               assign
                  so_mstr.so_inv_nbr  = ""
                  so_mstr.so_to_inv   = yes
                  so_mstr.so_inv_date = ?.
            end.
         end.

      end. /* if avail somstr */

      else
         leave.   /* not avail somstr */

   end. /* repeat: find first somstr */

   SESSION:numeric-format = oldsession.

   if not undo_all then do:

      /* SET CURRENCY FORMAT FOR BASE_TOTAL */
      base_total_fmt = base_total_old.

      run gpcrfmt
         (input-output base_total_fmt,
          input gl_rnd_mthd).

      assign
         base_total:format = base_total_fmt
         /* SET CURRENCY FORMAT FOR MARG_TOTAL */
         marg_total_fmt = marg_total_old.

      run gpcrfmt
         (input-output marg_total_fmt,
          input gl_rnd_mthd).

      assign
         marg_total:format = marg_total_fmt
         base_total = accum total (base_price)
         marg_total = accum total (base_margin).

      if using_container_charges or using_line_charges then
         assign
            base_total = base_total + cont_charges + line_charges
            marg_total = marg_total + cont_charges + line_charges.

      underline base_total base_margin with frame rpttot.
      down 1 with frame rpttot.

      do on endkey undo, leave:
         display
            skip(1)
            base_curr + " " + getTermLabel("REPORT_TOTALS",13) + ": " @ totstr
            base_total
            marg_total
         with frame rpttot.
      end. /* DO ON ENDKEY UNDO, LEAVE */

   end.

   /* PRINT GL RECAP */
   do on endkey undo, leave:
      page.
   end. /* DO ON ENDKEY UNDO, LEAVE */

   /* SET CURRENCY FORMAT FOR GLTWDR ACCORDING TO BASE */
   gltwdr_fmt = gltwdr_old.

   run gpcrfmt
      (input-output gltwdr_fmt,
       input gl_rnd_mthd).

   /* SET CURRENCY FORMAT FOR GLTWCR ACCORDING TO BASE */
   gltwcr_fmt = gltwcr_old.

   run gpcrfmt
      (input-output gltwcr_fmt,
       input gl_rnd_mthd).

   for each gltw_wkfl exclusive-lock
      where gltw_wkfl.gltw_domain = global_domain
       and  gltw_userid = mfguser
   break by gltw_entity by gltw_desc by gltw_acct by gltw_sub by gltw_cc
   with frame gltwtot:
      if first-of(gltw_desc) then do:
         down 1 with frame gltwtot. 
      end. 
         view frame jrnl.

      assign
         dr_amt:format = gltwdr_fmt
         cr_amt:format = gltwcr_fmt
         cr_amt = 0
         dr_amt = 0.

      if gltw_amt < 0 then
         cr_amt = - gltw_amt.
      else
         dr_amt = gltw_amt.

      accumulate (dr_amt) (total by gltw_cc by gltw_desc by gltw_entity).
      accumulate (cr_amt) (total by gltw_cc by gltw_desc by gltw_entity).

      if not gl_sum then do:
         do on endkey undo, leave:
            display
               gltw_entity
               gltw_acct
               gltw_sub
               gltw_cc
               gltw_project
               gltw_date
               gltw_desc
            with frame gltwtot.
         end. /* DO ON ENDKEY UNDO, LEAVE */

         do on endkey undo, leave:
            if dr_amt <> 0 then display dr_amt.
            if cr_amt <> 0 then display cr_amt.
            down 1 with frame gltwtot.
         end. /* DO ON ENDKEY UNDO, LEAVE */

      end.

      if last-of(gltw_cc) then do:
         if gl_sum then
         do on endkey undo, leave:
            display
               gltw_entity
               gltw_acct
               gltw_sub
               gltw_cc
               gltw_date
               gltw_desc
            with frame gltwtot.
         end. /* DO ON ENDKEY UNDO, LEAVE */

         if (accum total by gltw_cc dr_amt) <> 0 then do:
            gltwdr = accum total by gltw_cc dr_amt.
            do on endkey undo, leave:
               display gltwdr @ dr_amt with frame gltwtot. 
            end. /* DO ON ENDKEY UNDO, LEAVE */
         end.

         if (accum total by gltw_cc cr_amt) <> 0 then do:
            gltwcr = accum total by gltw_cc cr_amt.
            do on endkey undo, leave:
               display gltwcr @ cr_amt with frame gltwtot. 
            end. /* DO ON ENDKEY UNDO, LEAVE */
         end.

         down 1 with frame gltwtot. 

      end.

     if last-of(gltw_desc)
     then do:
        underline dr_amt cr_amt with frame gltwtot.
        down 1 with frame gltwtot.
        do on endkey undo, leave:
           display
              accum total by gltw_desc (dr_amt) @ dr_amt
              accum total by gltw_desc (cr_amt) @ cr_amt with frame gltwtot.
           down 1 with frame gltwtot.
        end. /* DO ON ENDKEY UNDO, LEAVE */
     end.

      if last-of(gltw_entity) then do:
         down 1 with frame gltwtot.
         underline dr_amt cr_amt with frame gltwtot.
         down 1 with frame gltwtot.
         do on endkey undo, leave:
            display
               accum total by gltw_entity (dr_amt) @ dr_amt
               accum total by gltw_entity (cr_amt) @ cr_amt with frame gltwtot.
            down 1 with frame gltwtot.
         end. /* DO ON ENDKEY UNDO, LEAVE */
      end.

      {us/gp/gprunp.i "mcpl" "p" "mc-delete-ex-rate-usage"
         "(input gltw_exru_seq)"}

      delete gltw_wkfl.

   end.

   if errorSummary
   then do:
       for each invoiceErrors:
           if invoiceErrors.severity = "w"
           then assign severity = getTermLabel("WARNING",8).
           else assign severity = getTermLabel("ERROR",8).
           display
             invoiceErrors.invoiceNumber
             invoiceErrors.billTo
             invoiceErrors.salesOrderNum
             severity
             invoiceErrors.errorMessage
             invoiceErrors.errorNumber
           with frame errorSummary.
           down with frame errorSummary.
       end.
   end.

   if auto_balance_amount <> 0 then
      do with frame autobalance:
         display
            getTermLabelRtColon("NOTE",7)
            auto_balance_amount
            getTermLabel("AUTO_BALANCED_REFER", 20)
            getTermLabelRtColon("SALES_JOURNAL_REFERENCE",24) format "x(24)"
            ref
            getTermLabelRtColon("AR_BATCH",9) format "x(9)"
            batch
         with frame autobalance width 132 no-labels.
      end.

   /* Display unposted invoices */
   for first invoice_err
   no-lock: end.

   if available invoice_err then do:

      page.

      display
         getTermLabel("UNPOSTED_INVOICES_DURING_PROCESS",35) format "x(35)"
      with frame c width 80.

      for each invoice_err no-lock,
          each so_mstr
             where so_mstr.so_domain = global_domain
              and  so_mstr.so_inv_nbr = inv_nbr
      no-lock
      with frame err width 80:

         /* SET EXTERNAL LABELS */
         setFrameLabels(frame err:handle).

         display
            inv_nbr
            so_nbr
            db_name column-label "DB Not Connected"
         with frame err.

      end.

   end.

   SESSION:numeric-format = oldsession.

   /* Clean up invoice post procedure */
   if valid-handle(hQADFinInvPostLib)
      then delete procedure hQADFinInvPostLib.

   assign c-application-mode = oldCapplicationMode.
   return.

end.

SESSION:numeric-format = oldsession.
undo_all = yes.

PROCEDURE processCreditCard:
/*---------------------------------------------------------------------------
  Purpose: Make a credit card payment
  Parameters:
     pSuccess - error status - will be false if any error occurred
     pMsgNbr  - Message number of any MFG/PRO errors occurring
                in soivccpy.p.  If only VeriSign errors occurred
                then this will be 0
  Exceptions:
  Notes:
 ---------------------------------------------------------------------------*/
   define input  parameter pInvoiceNumber as character  no-undo.
   define output parameter pCardProcessed as logical no-undo.
   define output parameter pSuccess       as logical no-undo.
   define output parameter pMsgNbr        as integer no-undo.

   define variable pcTransStatus    as character no-undo.
   define variable viErrFlag        as integer   no-undo.

   /*
    * Modified by fzt 7/14/2005 10:13 GMT+8.
    * check the transaction type for credit card.
    */
   run checkCCTransStatus(output pcTransStatus).

   if pcTransStatus = "saled" then do:
      /*
      * if transaction type is SALE,or redo prior failed transaction just
      * save invoice number.
      */
      run saveInvoiceNumber(input  promo_inv,
                            output pSuccess).
      assign
         pCardProcessed = true.
   end.
   else if pcTransStatus = "authorized" then do:
      /* if transaction type is authorized, then do capture. */
      {us/bbi/gprun.i ""soivccpy.p""
      "(input cur-sonbr,
        input promo_inv,
        input vglamt,
        output pCardProcessed,
        output pSuccess,
        output pMsgNbr)"}
   end.
   else do:
      return. /* cannot find socc_mstr then return. */
   end.

   /* Not a credit card order or an error occurred */
   if pCardProcessed = false or pSuccess = false then return.

   run createCustomerDocument in hQADFinInvPostLib
                     (input pInvoiceNumber,
                      input pInvoiceNumber,
                      input post_entity,
                      output table tFcMessages,
                      output viErrFlag ).

    if viErrFlag < 0 then
       assign pCardProcessed = false.

   for each tFcMessages with frame ferr:
      if not errorSummary
      then do:
          display
             tFcMessages.tcFcMsgNumber
             tFcMessages.tcFcMessage
             tFcMessages.tcFcContext
             tFcMessages.tcFcFieldName
             tFcMessages.tcFcFieldValue
             with frame ferr.
          down.
      end.
      else do:
           create invoiceErrors.
           assign
               invoiceErrors.invoiceNumber = pInvoiceNumber
               invoiceErrors.salesOrderNum = ""
               invoiceErrors.billTo = billTo
               invoiceErrors.errorMessage = tFcMessages.tcFcMessage
               invoiceErrors.errorNumber = tFcMessages.tcFcMsgNumber
               invoiceErrors.severity = if tFcMessages.tcFcType = "w" then "w" else "e".
       end.
   end.

   assign
      pCardProcessed = true
      pSuccess       = true.

END PROCEDURE. /*ProcessCreditCard*/

PROCEDURE p-abs-mstr:

   define buffer absmstr for abs_mstr.

   for each abs_mstr
      where abs_mstr.abs_domain = global_domain
      and   abs_mstr.abs_order  = sod_det.sod_nbr
      and   abs_mstr.abs_line   = string(sod_det.sod_line)
      and   abs_mstr.abs_shp_date <> ?
   exclusive-lock:

      if abs_inv_nbr <> ""
         or abs_par_id = ""
      then
         next.

      /* To handle configured items having multiple components */
      if sod_det.sod_cfg_type <> "" 
      then
         if can-find(absmstr
            where absmstr.abs_domain   = global_domain
            and   absmstr.abs_shipfrom = abs_mstr.abs_shipfrom
            and   absmstr.abs_id       = abs_mstr.abs_par_id
            and   absmstr.abs_order   <> "")
         then 
            next.

      /* Set invoice number if the quantity shipped is not zero or
       * the shipper is unconfirmed */
      if abs_ship_qty <> 0 or
         can-find(first absmstr
                  where absmstr.abs_domain   = global_domain
                  and   absmstr.abs_shipfrom = abs_mstr.abs_shipfrom
                  and   absmstr.abs_id       = abs_mstr.abs_par_id
                  and   substring(abs_status,2,1) <> "y") then
         abs_mstr.abs_inv_nbr = so_mstr.so_inv_nbr.

      run createShipperRef in hQADFinInvPostLib
         (input so_mstr.so_inv_nbr,
          input (recid(abs_mstr)) ).

   end.

END PROCEDURE.

/* PROCEDURE TO ROUND VALUES */

PROCEDURE p-rounding:

   define input-output parameter l_ext_val       as decimal
                                 format "->>>>,>>>,>>9.99<<<"      no-undo.
   define input        parameter rndmthd         like rnd_rnd_mthd no-undo.
   define output       parameter mc-error-number like msg_nbr      no-undo.

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_ext_val,
        input rndmthd,
        output mc-error-number)"}

END PROCEDURE. /* PROCEDURE p-rounding */

PROCEDURE p_sixref_balance:

   define input parameter i_invnbr like so_inv_nbr        no-undo.
   define input parameter billTo       like so_bill       no-undo.
   define input parameter invoiceTotal as decimal         no-undo.

   define variable l_six_total     like six_amt initial 0 no-undo.
   define variable l_six_correct   like six_amt initial 0 no-undo.
   define variable l_six_qty       like six_qty initial 0 no-undo.
   define variable l_idh_qty_inv   like idh_qty_inv
                                                         initial 0 no-undo.
   define variable l_cur_tax_amt   like tx2d_cur_tax_amt
                                                         initial 0 no-undo.

   define buffer   armstr          for ar_mstr.
   define buffer   ihhist          for ih_hist.
   define buffer   idhhist         for idh_hist.
   define buffer   sixref          for six_ref.
   define buffer   tx2ddet         for tx2d_det.

   /* FIND IF THE ORDER CORRESPONDING TO THIS INVOICE OR       */
   /* ATLEAST ONE ORDER IN THIS INVOICE IF IT IS CONSOLIDATED, */
   /* WAS PROCESSED THROUGH NON-SHIPPER CYCLE.                 */
   for first ihhist
       where ihhist.ih_domain = global_domain
        and  ihhist.ih_inv_nbr = i_invnbr
        and not can-find(first sixref
           where sixref.six_domain  = global_domain
            and  sixref.six_bill    = billTo
            and  sixref.six_inv_nbr = i_invnbr
            and  sixref.six_order   = ihhist.ih_nbr
      use-index six_bill_inv)
      no-lock:
   end. /* FOR FIRST ihhist */
   if not available ihhist
   then do:

      /* GET THE TOTAL OF INVOICE QUANTITIES FROM INVOICE DETAIL */
      /* THIS IS THE SUM OF ALL LINES AND IGNORES THE UNIT OF    */
      /* MEASURE AT INDIVIDUAL LINE LEVEL.                       */
      for each idhhist
          where idhhist.idh_domain = global_domain
           and  idhhist.idh_inv_nbr = i_invnbr
      no-lock:
         l_idh_qty_inv = l_idh_qty_inv + idh_qty_inv.

         /* TOTAL ALL INCLUSIVE TAX AMOUNTS */
         for each tx2ddet
            where tx2ddet.tx2d_domain  = global_domain
            and   tx2ddet.tx2d_ref     = idhhist.idh_inv_nbr
            and   tx2ddet.tx2d_nbr     = idhhist.idh_nbr
            and   tx2ddet.tx2d_line    = idhhist.idh_line
            and   tx2ddet.tx2d_tr_type = '16'
            and   tx2ddet.tx2d_tax_in  = yes
         no-lock:
            l_cur_tax_amt = l_cur_tax_amt + tx2d_cur_tax_amt.
         end. /* FOR EACH tx2ddet */

      end.  /* FOR EACH idhhist */

      /* GET THE TOTAL OF THE sixref's */
      for each sixref
          where sixref.six_domain  = global_domain
          and   sixref.six_bill    = billTo
          and   sixref.six_inv_nbr = i_invnbr
         use-index six_bill_inv
      no-lock:
         assign
            l_six_total = l_six_total + sixref.six_amt
            l_six_qty   = l_six_qty   + sixref.six_qty.
      end. /* FOR EACH sixref */

      /* ADJUST FOR INCLUSIVE TAXES */
      l_six_total = l_six_total - l_cur_tax_amt.
      /* PROCEED WITH THE ADJUSTMENT OF six_ref's ONLY WHEN   */
      /* SUM QTY OF idh_hist AND six_ref ARE EQUAL            */
      if l_idh_qty_inv = l_six_qty
      then do:

         /* IF THE sixref's TOTAL DOES NOT MATCH THE AR TOTAL */
         /* THEN APPLY CORRECTION TO six_amt ACCORDINGLY      */
         if invoiceTotal <> l_six_total
         then do:

            l_six_correct = invoiceTotal - l_six_total.

            find last sixref
               where sixref.six_domain  = global_domain
               and   sixref.six_bill    = billTo
               and   sixref.six_inv_nbr = i_invnbr
               and   sixref.six_type    = ""
               use-index six_bill_inv
            exclusive-lock no-error.

            if available sixref
            then
               sixref.six_amt = sixref.six_amt + l_six_correct.
         end. /* IF armstr.ar_amt <> l_six_total */

      end. /* IF l_idh_inv_qty = l_six_qty */

   end. /* IF NOT AVAILABLE ihhist */

END PROCEDURE. /* p_sixref_balance */

/* PROCEDURE TO SKIP LOCKED ORDERS DURING INVOICE POST */

PROCEDURE p_check_locked:

   define input parameter l_invnbr like so_inv_nbr no-undo.
   define output parameter p_sonbr like so_nbr no-undo.

   l_locked = no.

   find first so_mstr
      where so_domain = global_domain
       and  so_inv_nbr = l_invnbr
   exclusive-lock no-wait no-error.

   if locked(so_mstr)
   then do:
      l_locked = yes.
      find first so_mstr
         where so_domain = global_domain
           and so_inv_nbr = l_invnbr
      no-lock no-error.
      if available so_mstr then p_sonbr = so_nbr.
   end.

END PROCEDURE. /* p_check_locked */


/* PROCEDURE FOR ROUNDING ADJUSTMENTS */
PROCEDURE p-adjustments:
   define input parameter l_ref        like glt_ref  no-undo.
   define input parameter l_so_line    like glt_line no-undo.
   define input parameter l_ar_line    like glt_line no-undo.
   define input parameter l_diff_amt   like glt_amt  no-undo.
   define input parameter l_so_wk_line like glt_line no-undo.
   define input parameter l_ar_wk_line like glt_line no-undo.

   define variable l_glt_so_entity like glt_entity   no-undo.
   define variable l_glt_ar_entity like glt_entity   no-undo.

   if     l_so_line = 0
      and l_ar_line <> 0
   then
      assign
         l_so_line    = l_ar_line + 1
         l_so_wk_line = l_ar_wk_line + 1.

   /* ADJUST THE SO ACCT FOR THE LAST INVOICE */
   for first glt_det
      where glt_det.glt_domain = global_domain
      and   glt_ref   = l_ref
      and   glt_rflag = false
      and   glt_line  = l_so_line
   exclusive-lock:
      /* CAPTURING VALUE OF SO ENTITY */
      assign
         l_glt_so_entity = glt_entity
         glt_amt         = glt_amt      + l_diff_amt
         glt_ecur_amt    = glt_ecur_amt + l_diff_amt.

   end. /* FOR FIRST glt_det */

   if l_ar_line = 0
   then
      l_glt_ar_entity = post_entity.

   /* ADJUST THE AR ACCT FOR THE LAST INVOICE */
   for first glt_det
      where glt_det.glt_domain = global_domain
      and   glt_ref   = ref
      and   glt_rflag = false
      and   glt_line  = l_ar_line
   exclusive-lock:
      /* CAPTURING VALUE OF AR ENTITY */
      assign
         l_glt_ar_entity = glt_entity
         glt_amt         = glt_amt      - l_diff_amt
         glt_ecur_amt    = glt_ecur_amt - l_diff_amt.

   end. /* FOR FIRST glt_det */


   for each gltw_wkfl
      where gltw_wkfl.gltw_domain = global_domain
      and   gltw_ref    = mfguser
      and   gltw_userid = mfguser
   exclusive-lock:
      if gltw_line = l_so_wk_line
      then
         assign
            gltw_amt      = gltw_amt      + l_diff_amt
            gltw_ecur_amt = gltw_ecur_amt + l_diff_amt.

      if gltw_line = l_ar_wk_line
      then
         assign
            gltw_amt      = gltw_amt      - l_diff_amt
            gltw_ecur_amt = gltw_ecur_amt - l_diff_amt.

   end. /* FOR EACH gltw_wkfl */

   /* IF SO ENTITY AND AR ENTITY ARE DIFFERENT */
   /* CHECK AND ADJUST INTER-COMPANY ACCOUNTS */
   if l_glt_so_entity <> l_glt_ar_entity
   then do:
      /* ADJUST SO HEADER ENTITY */
      {us/gl/glenacex.i &entity=l_glt_so_entity
                  &type='"CR"'
                  &module='"AR"'
                  &acct=acct
                  &sub=sub
                  &cc=cc}

      for first glt_det
         where glt_domain = global_domain
         and   glt_ref    = l_ref
         and   glt_rflag  = false
         and   glt_acct   = acct
         and   glt_sub    = sub
         and   glt_cc     = cc
         and   glt_entity = l_glt_ar_entity
      use-index glt_ref exclusive-lock:

      assign
         glt_amt      = glt_amt      + l_diff_amt
         glt_ecur_amt = glt_ecur_amt + l_diff_amt.

      end. /* FOR FIRST glt_det */

      for first gltw_wkfl
         where gltw_domain = global_domain
         and   gltw_ref    = mfguser
         and   gltw_userid = mfguser
         and   gltw_acct   = acct
         and   gltw_sub    = sub
         and   gltw_cc     = cc
         and   gltw_entity = l_glt_ar_entity
      use-index gltw_ref exclusive-lock:
          gltw_amt = gltw_amt + l_diff_amt.
      end. /* FOR FIRST gltw_wkfl */

      /* ADJUST SO LINE ENTITY */
      {us/gl/glenacex.i &entity=l_glt_ar_entity
                  &type='"DR"'
                  &module='"AR"'
                  &acct=acct
                  &sub=sub
                  &cc=cc}

      for first glt_det
         where glt_domain = global_domain
         and   glt_ref    = l_ref
         and   glt_rflag  = false
         and   glt_acct   = acct
         and   glt_sub    = sub
         and   glt_cc     = cc
         and   glt_entity = l_glt_so_entity
      use-index glt_ref exclusive-lock:

      assign
         glt_amt      = glt_amt      - l_diff_amt
         glt_ecur_amt = glt_ecur_amt - l_diff_amt.

      end. /* FOR FIRST glt_det */

      for first gltw_wkfl
          where gltw_domain = global_domain
          and   gltw_ref    = mfguser
          and   gltw_userid = mfguser
          and   gltw_acct   = acct
          and   gltw_sub    = sub
          and   gltw_cc     = cc
          and   gltw_entity = l_glt_so_entity
      use-index gltw_ref exclusive-lock:

          gltw_amt = gltw_amt - l_diff_amt.
      end. /* FOR FIRST gltw_wkfl */
   end. /* IF l_glt_so_entity <> l_glt_ar_entity */

END PROCEDURE. /* p-adjustments */

PROCEDURE ip_adjust_l_tot_amt:

   define input parameter p_accum_ext_price like ext_price no-undo.

   define variable l_disc_amt        like line_total  no-undo.
   define variable l_diff_dueto_tax  like line_total  no-undo.

   /* GET THE SALES ORDER TOTAL WHICH IS INCLUSIVE */
   /* OF INCLUDED TAX                              */
   /* CALCULATE THE ORDER DISCOUNT ON THIS TOTAL   */
   l_disc_amt        = - (p_accum_ext_price
                          * so_mstr.so_disc_pct) / 100.

   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output l_disc_amt,
        input        rndmthd,
        output       mc-error-number)"}

   if mc-error-number <> 0
   then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end. /* IF mc-error-number <> 0 */

   /* THIS FIX CORRECTS DIFFERENCE BETWEEEN l_tot_amt */
   /* AND l_tot_ramt DUE TO L18Q BY ENSURING          */
   /* l_tot_amt DOES NOT CONTAIN INCLUDED TAX         */
   /* COMPONENT THUS POSTING CORRECT AMOUNTS TO       */
   /* SALES AND AR ACCOUNTS                           */
   assign
      l_diff_dueto_tax = abs(l_disc_amt - disc_amt)
      l_tot_amt        = l_tot_amt + l_diff_dueto_tax.

END PROCEDURE. /* ip_adjust_l_tot_amt */

PROCEDURE checkCCTransStatus:
/*------------------------------------------------------------------------------
  Purpose:     Check the transaction status in socc_mstr, with defined domain and
               current SO number.

  Parameters:  <output>
               pcTransStatus - Transaction returned.

------------------------------------------------------------------------------*/
   define output parameter pcTransStatus as character no-undo initial "".

   for each cctr_hist
      where cctr_domain = global_domain and
            cctr_nbr    = cur-sonbr no-lock by cctr_trnbr descending:
      assign
         pcTransStatus = cctr_status.
      leave. /* for first cannot make correct hit, so use this way. -jtz */
   end.

END PROCEDURE. /* pcTransStatus */

PROCEDURE saveInvoiceNumber:
/*------------------------------------------------------------------------------
  Purpose:     Save the invoice number to cctr_hist.

  Parameters:  <input>
               pcInvoiceNumber - current invoice number.
               <output>
               plSuccess - whether the save action succeed or not.

------------------------------------------------------------------------------*/
   define input  parameter pcInvoiceNumber as character no-undo.
   define output parameter plSuccess       as logical   no-undo initial false.

   for each cctr_hist
      where cctr_domain = global_domain and
            cctr_nbr    = cur-sonbr exclusive-lock by cctr_trnbr descending:
      assign
         cctr_inv_nbr = pcInvoiceNumber
         plSuccess    = true.
      leave.
   end.

END PROCEDURE. /* saveInvoiceNumber */

PROCEDURE updateCorrectionInv:
/*------------------------------------------------------------------------------
  Purpose:     Update Correction Invoices Table with
               Sales Order Invoice Number
  Parameters:  <input>
               pcSoNbr         - SO Number
               pcSoInvoiceNbr  - Generated Invoice Number
       Notes:
------------------------------------------------------------------------------*/
   define input parameter pcSoNbr        as character no-undo.
   define input parameter pcSoInvoiceNbr as character no-undo.

   find first cil_mstr
      where cil_mstr.cil_domain     = global_domain
        and cil_mstr.cil_cor_so_nbr = pcSoNbr
   exclusive-lock no-error.

   if available cil_mstr then do:
      for each cild_det
         where cild_det.cild_domain = global_domain
         and   cild_cor_inv    = cil_cor_inv
         and   cild_cor_so_nbr = cil_cor_so_nbr
      exclusive-lock:
         assign
            cild_cor_inv    = pcSoInvoiceNbr
            cild_mod_date   = today
            cild_mod_userid = global_userid.
      end.

      assign cil_cor_inv    = pcSoInvoiceNbr
             cil_mod_date   = today
             cil_mod_userid = global_userid.
   end.

END PROCEDURE.

PROCEDURE validateDepotCall.
   define input  parameter pCallId    as character no-undo.
   define output parameter pDepotCall as logical   no-undo.

   define buffer ca_mstr for ca_mstr.

   for first ca_mstr where ca_domain   = global_domain
                     and   ca_category = '0'
                     and   ca_nbr      = pCallId
                     and can-find(first fwk_mstr
                                    where fwk_domain = global_domain
                                    and   fwk_ca_int_type = ca_int_type
                                    and   fwk_repair_ctr = yes)
   no-lock:
      pDepotCall = yes.
   end. /* for first ca_mstr */
END PROCEDURE.
