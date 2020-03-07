/* xfivpsta.p - SALES ORDER HEADER INVOICE POST                               */
/* soivpsta.p - SALES ORDER HEADER INVOICE POST                               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfivpsta.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/*                                                                            */
/* Old ECO marker removed, but no ECO header exists *Ftmd*                    */
/* REVISION: 6.0      LAST MODIFIED: 03/19/90   BY: ftb *D005*                */
/* REVISION: 6.0      LAST MODIFIED: 04/10/90   BY: ftb *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 05/22/90   BY: WUG *D022*                */
/* REVISION: 6.0      LAST MODIFIED: 08/18/90   BY: MLB *D055*                */
/* REVISION: 6.0      LAST MODIFIED: 10/18/90   BY: MLB *D109*                */
/* REVISION: 6.0      LAST MODIFIED: 11/01/90   BY: MLB *D148*                */
/* REVISION: 6.0      LAST MODIFIED: 11/02/90   BY: MLB *D170*                */
/* REVISION: 6.0      LAST MODIFIED: 12/23/90   BY: MLB *D238*                */
/* REVISION: 6.0      LAST MODIFIED: 02/18/91   BY: afs *D354*                */
/* REVISION: 6.0      LAST MODIFIED: 02/28/91   BY: afs *D387*                */
/* REVISION: 6.0      LAST MODIFIED: 03/18/91   BY: MLB *D443*                */
/* REVISION: 6.0      LAST MODIFIED: 04/05/91   BY: bjb *D507*                */
/* REVISION: 6.0      LAST MODIFIED: 04/29/91   BY: afs *D586*                */
/* REVISION: 6.0      LAST MODIFIED: 05/07/91   BY: MLV *D617*                */
/* REVISION: 6.0      LAST MODIFIED: 08/14/91   BY: MLV *D825*                */
/* REVISION: 7.0      LAST MODIFIED: 09/16/91   BY: MLV *F015*                */
/* REVISION: 7.0      LAST MODIFIED: 10/16/91   BY: MLV *F023*                */
/* REVISION: 7.0      LAST MODIFIED: 11/13/91   BY: pma *F003*                */
/* REVISION: 7.0      LAST MODIFIED: 11/12/91   BY: MLV *F029*                */
/* REVISION: 7.0      LAST MODIFIED: 11/29/91   BY: SAS *F017*                */
/* REVISION: 7.0      LAST MODIFIED: 12/10/91   BY: afs *F042*                */
/* REVISION: 7.0      LAST MODIFIED: 01/15/92   BY: WUG *F034*                */
/* REVISION: 7.0      LAST MODIFIED: 09/19/91   BY: afs *F040*                */
/* REVISION: 7.0      LAST MODIFIED: 01/17/92   BY: afs *F039*                */
/* REVISION: 7.0      LAST MODIFIED: 01/30/92   BY: WUG *F110*                */
/* REVISION: 7.0      LAST MODIFIED: 02/19/92   BY: tjs *F213*                */
/* REVISION: 7.0      LAST MODIFIED: 03/23/92   BY: TMD *F263*                */
/* REVISION: 7.0      LAST MODIFIED: 03/26/92   BY: dld *F297*                */
/* REVISION: 7.0      LAST MODIFIED: 04/09/92   BY: emb *F369*                */
/* REVISION: 7.0      LAST MODIFIED: 04/10/92   BY: afs *F398*                */
/* REVISION: 7.0      LAST MODIFIED: 04/20/92   BY: tjs *F371*                */
/* REVISION: 7.0      LAST MODIFIED: 06/10/92   BY: tjs *F504*                */
/* REVISION: 7.0      LAST MODIFIED: 06/18/92   BY: tmd *F458*                */
/* REVISION: 7.0      LAST MODIFIED: 06/24/92   BY: sas *F656*                */
/* REVISION: 7.0      LAST MODIFIED: 06/29/92   BY: afs *F715*                */
/* REVISION: 7.0      LAST MODIFIED: 07/30/92   BY: tjs *F739*                */
/* REVISION: 7.3      LAST MODIFIED: 08/24/92   BY: tjs *G033*                */
/* REVISION: 7.3      LAST MODIFIED: 09/04/92   BY: afs *G047*                */
/* REVISION: 7.3      LAST MODIFIED: 10/23/92   BY: afs *G230*                */
/* REVISION: 7.3      LAST MODIFIED: 10/12/92   by: afs *G163*                */
/* REVISION: 7.3      LAST MODIFIED: 11/06/92   BY: afs *G290*                */
/* REVISION: 7.3      LAST MODIFIED: 11/17/92   BY: tjs *G191*                */
/* REVISION: 7.3      LAST MODIFIED: 12/04/92   BY: afs *G394*                */
/* REVISION: 7.3      LAST MODIFIED: 01/07/93   BY: WUG *G521*                */
/* REVISION: 7.3      LAST MODIFIED: 01/27/93   BY: sas *G613*                */
/* REVISION: 7.3      LAST MODIFIED: 04/08/93   BY: afs *G905*                */
/* REVISION: 7.3      LAST MODIFIED: 04/15/93   BY: tjs *G948*                */
/* REVISION: 7.3      LAST MODIFIED: 05/27/93   BY: kgs *GB38*                */
/* REVISION: 7.3      LAST MODIFIED: 06/07/93   BY: tjs *GA64*                */
/* REVISION: 7.3      LAST MODIFIED: 06/09/93   BY: WUG *GB90*                */
/* REVISION: 7.3      LAST MODIFIED: 06/09/93   BY: dpm *GB71*                */
/* REVISION: 7.3      LAST MODIFIED: 07/12/93   BY: dpm *GD33*                */
/* REVISION: 7.4      LAST MODIFIED: 07/21/93   BY: jjs *H050*                */
/* REVISION: 7.4      LAST MODIFIED: 08/24/93   BY: tjs *H070*                */
/* REVISION: 7.4      LAST MODIFIED: 10/04/93   BY: tjs *H082*                */
/* REVISION: 7.4      LAST MODIFIED: 10/18/93   BY: tjs *H182*                */
/* REVISION: 7.4      LAST MODIFIED: 10/23/93   BY: cdt *H184*                */
/* REVISION: 7.4      LAST MODIFIED: 11/15/93   BY: tjs *H196*                */
/* REVISION: 7.4      LAST MODIFIED: 11/16/93   BY: bcm *H226*                */
/* REVISION: 7.4      LAST MODIFIED: 11/23/93   BY: afs *H239*                */
/* REVISION: 7.4      LAST MODIFIED: 01/04/94   BY: afs *FL20*                */
/* REVISION: 7.4      LAST MODIFIED: 01/20/94   BY: dpm *FL30*                */
/* REVISION: 7.4      LAST MODIFIED: 02/02/94   BY: afs *FL89*                */
/* REVISION: 7.4      LAST MODIFIED: 03/08/94   BY: afs *FM80*                */
/* REVISION: 7.4      LAST MODIFIED: 04/25/94   BY: WUG *H361*                */
/* REVISION: 7.4      LAST MODIFIED: 05/09/94   BY: dpm *FN83*                */
/* REVISION: 7.4      LAST MODIFIED: 06/09/94   BY: dpm *FO70*                */
/* REVISION: 7.4      LAST MODIFIED: 07/05/94   BY: tjs *FN95*                */
/* REVISION: 7.4      LAST MODIFIED: 09/08/94   BY: pmf *FQ75*                */
/* REVISION: 7.4      LAST MODIFIED: 09/15/94   by: slm *GM64*                */
/* REVISION: 7.4      LAST MODIFIED: 10/20/94   BY: afs *FS65*                */
/* REVISION: 7.4      LAST MODIFIED: 11/01/94   BY: ame *GN90*                */
/* REVISION: 7.4      LAST MODIFIED: 11/06/94   BY: bcm *GO14*                */
/* REVISION: 7.4      LAST MODIFIED: 11/17/94   BY: rxm *FT54*                */
/* REVISION: 7.4      LAST MODIFIED: 01/26/95   BY: jxz *F0GC*                */
/* REVISION: 7.4      LAST MODIFIED: 02/06/95   BY: bcm *G0DN*                */
/* REVISION: 7.4      LAST MODIFIED: 03/13/95   BY: jxz *F0M3*                */
/* REVISION: 8.5      LAST MODIFIED: 03/06/95   by: dpm *J044*                */
/* REVISION: 8.5      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 8.5      LAST MODIFIED: 08/18/95   BY: afs *J06R*                */
/* REVISION: 8.5      LAST MODIFIED: 06/19/95   BY: jym *G0ND*                */
/* REVISION: 8.5      LAST MODIFIED: 08/25/95   BY: vrn *G0VL*                */
/* REVISION: 8.5      LAST MODIFIED: 11/21/95   BY: mys *G1DX*                */
/* REVISION: 8.5      LAST MODIFIED: 07/25/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 01/05/96   BY: mys *G1J6*                */
/* REVISION: 8.5      LAST MODIFIED: 01/30/96   by: ais *G1L8*                */
/* REVISION: 8.5      LAST MODIFIED: 04/09/96   by: ais *H0KL*                */
/* REVISION: 8.5      LAST MODIFIED: 04/12/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 05/14/96   BY: *J0M7* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 06/28/96   BY: *J0WF* Sue Poland         */
/* REVISION: 8.6      LAST MODIFIED: 07/15/96   BY: *K001* Barry Lass         */
/* REVISION: 8.5      LAST MODIFIED: 07/26/96   BY: *G1YS* Dwight Kahng       */
/* REVISION: 8.5      LAST MODIFIED: 08/26/96   BY: *G2CR* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 09/30/96   BY: *G2G2* Aruna P. Patil     */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Kurt De Wit        */
/* REVISION: 8.6      LAST MODIFIED: 11/25/96   BY: *K01X* Jeff Wootton       */
/* REVISION: 8.6      LAST MODIFIED: 12/27/96   BY: *K022* Bill Keese         */
/* REVISION: 8.6      LAST MODIFIED: 01/27/97   BY: *H0R0* Robin McCarthy     */
/* REVISION: 8.6      LAST MODIFIED: 02/17/97   BY: *K01R* Elizabeth Hughart  */
/* REVISION: 8.6      LAST MODIFIED: 02/28/97   BY: *K06N* Elizabeth Hughart  */
/* REVISION: 8.6      LAST MODIFIED: 06/10/97   BY: *K0D4* Jeff Wootton       */
/* REVISION: 8.6      LAST MODIFIED: 06/16/97   BY: *G2NF* Irine D'mello      */
/* REVISION: 8.6      LAST MODIFIED: 07/13/97   BY: *K0DH* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 11/07/97   BY: *K18J* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 12/08/97   BY: *J27M* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 11/26/97   BY: *K15N* Jim Williams       */
/* REVISION: 8.6      LAST MODIFIED: 01/21/98   BY: *J2BD* Seema Varma        */
/* REVISION: 8.6E     LAST MODIFIED: 03/20/98   BY: *J2F2* Samir Bavkar       */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* REVISION: 8.6E     LAST MODIFIED: 06/23/98   BY: *J2LD* Niranjan Ranka     */
/* REVISION: 8.6E     LAST MODIFIED: 07/07/98   BY: *J2Q7* Niranjan Ranka     */
/* REVISION: 8.6E     LAST MODIFIED: 07/09/98   BY: *L024* Bill Reckard       */
/* REVISION: 8.6E     LAST MODIFIED: 08/20/98   BY: *L06Q* Steve Goeke        */
/* REVISION: 8.6E     LAST MODIFIED: 08/24/98   BY: *K1DQ* Suresh Nayak       */
/* REVISION: 9.0      LAST MODIFIED: 09/30/98   BY: *J2CZ* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 11/24/98   BY: *M017* David Morris       */
/* REVISION: 9.0      LAST MODIFIED: 01/08/99   BY: *M04V* Steve Nugent       */
/* REVISION: 9.0      LAST MODIFIED: 01/22/99   BY: *M050* Steve Nugent       */
/* REVISION: 9.0      LAST MODIFIED: 03/09/99   BY: *M09Z* Jean Miller        */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 03/23/99   BY: *H1NP* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 07/01/99   BY: *N00T* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 08/12/99   BY: *J3KJ* Bengt Johansson    */
/* REVISION: 9.1      LAST MODIFIED: 09/08/99   BY: *N02P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Murali Ayyagari    */
/* REVISION: 9.1      LAST MODIFIED: 10/06/99   BY: *N03Z* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 10/12/99   BY: *K23M* Kedar Deherkar     */
/* REVISION: 9.1      LAST MODIFIED: 10/12/99   BY: *N04P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 10/15/99   BY: *N004* Steve Nugent       */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic         */
/* REVISION: 9.1      LAST MODIFIED: 01/25/00   BY: *N06R* Bud Woolsey        */
/* REVISION: 9.1      LAST MODIFIED: 08/23/00   BY: *N0ND* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/25/00   BY: *L121* Gurudev Chennuru   */
/* REVISION: 9.1      LAST MODIFIED: 09/26/00   BY: *K264* Manish Kulkarni    */
/* REVISION: 9.1      LAST MODIFIED: 01/16/01   BY: *M0ZZ* Manisha Sawant     */
/* REVISION: 9.1      LAST MODIFIED: 10/16/00   BY: *N0W8* Mudit Mehta        */
/* Revision: 1.67         BY: Katie Hilbert       DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.68         BY: Steve Nugent        DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.70         BY: Mercy Chittilapilly DATE: 09/26/01  ECO: *M1H4* */
/* Revision: 1.72         BY: Ellen Borden        DATE: 03/15/02  ECO: *P00G* */
/* Revision: 1.73         BY: Katie Hilbert       DATE: 04/15/02  ECO: *P03J* */
/* Revision: 1.74         BY: Jean Miller         DATE: 05/13/02  ECO: *P05M* */
/* Revision: 1.75         BY: Jean Miller         DATE: 06/03/02  ECO: *P065* */
/* Revision: 1.78         BY: Dave Caveney        DATE: 06/10/02  ECO: *P042* */
/* Revision: 1.79         BY: Robin McCarthy      DATE: 07/08/02  ECO: *P08Q* */
/* Revision: 1.80         BY: Robin McCarthy      DATE: 07/15/02  ECO: *P0BJ* */
/* Revision: 1.81         BY: Seema Tyagi         DATE: 08/07/02  ECO: *N1QG* */
/* Revision: 1.84         BY: Robin McCarthy      DATE: 11/08/02  ECO: *P0JS* */
/* Revision: 1.89         BY: Laurene Sheridan    DATE: 11/18/02  ECO: *P09M* */
/* Revision: 1.90         BY: Amit Chaturvedi     DATE: 01/20/03  ECO: *N20Y* */
/* Revision: 1.94         BY: Robin McCarthy      DATE: 02/28/03  ECO: *P0M9* */
/* Revision: 1.95         BY: Robin McCarthy      DATE: 03/03/03  ECO: *P0NJ* */
/* Revision: 1.98         BY: Wojciech Palczyski  DATE: 03/25/03  ECO: *P0P6* */
/* Revision: 1.100        BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.103        BY: Kirti Desai         DATE: 11/12/03  ECO: *P195* */
/* Revision: 1.103        BY: Ashish Maheshwari   DATE: 11/15/03  ECO: *P15L* */
/* Revision: 1.104        BY: Vinay Soman         DATE: 01/20/04  ECO: *N2NZ* */
/* Revision: 1.105        BY: Salil Pradhan       DATE: 03/02/04  ECO: *P1GM* */
/* Revision: 1.106        BY: Somesh Jeswani      DATE: 06/14/04  ECO: *P25V* */
/* Revision: 1.108        BY: Ed van de Gevel     DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.109        BY: Ed van de Gevel     DATE: 03/07/05  ECO: *R00K* */
/* Revision: 1.110        BY: Dayanand Jethwa     DATE: 04/01/05  ECO: *P27M* */
/* Revision: 1.111        BY: Shivganesh Hegde    DATE: 09/28/05  ECO: *P42R* */
/* Revision: 1.115        BY: Robin McCarthy      DATE: 10/14/05  ECO: *P44V* */
/* Revision: 1.116        BY: Nishit V            DATE: 02/06/06  ECO: *P4GY* */
/* Revision: 1.118        BY: Jean Miller         DATE: 02/28/06  ECO: *Q0R5* */
/* Revision: 1.119        BY: Katie Hilbert       DATE: 06/08/06  ECO: *Q0LK* */
/* Revision: 1.120        BY: Shivaraman V.       DATE: 09/22/06  ECO: *P577* */
/* Revision: 1.121        BY: Jean Miller         DATE: 07/05/07  ECO: *R0C6* */
/* Revision: 1.124        BY: Jean Miller         DATE: 01/09/08  ECO: *P5R3* */
/* Revision: 1.125        BY: Jing Li             DATE: 01/09/08  ECO: *R0JR* */
/* Revision: 1.126        BY: Deepak Taneja       DATE: 02/06/08  ECO: *R0KN* */
/* Revision: 1.127        BY: Jean Miller         DATE: 02/14/08  ECO: *P5ZM* */
/* Revision: 1.128        BY: Prajakta Patil      DATE: 02/26/08  ECO: *P6JY* */
/* Revision: 1.131        BY: Dilip Manawat       DATE: 03/07/08  ECO: *R0NB* */
/* Revision: 1.132        BY: Vivek Kamath        DATE: 04/23/08  ECO: *P4LG* */
/* Revision: 1.135        BY: Nan Zhang           DATE: 06/04/08  ECO: *R0JS* */
/* Revision: 1.138        BY: Deirdre O'Brien     DATE: 10/31/08  ECO: *R16Q* */
/* Revision: 1.139        BY: Niranjan Ranka      DATE: 10/15/08  ECO: *R179* */
/* Revision: 1.142        BY: Prabu M             DATE: 02/20/09  ECO: *Q2FY* */
/* Revision: 1.144        BY: Evan Todd           DATE: 02/25/09  ECO: *Q2H0* */
/* Revision: 1.145        BY: Yiqing Chen         DATE: 04/28/10  ECO: *R1Z0* */
/* Revision: QAD2016      BY: sxh    DATE:  06/04/16  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/bbi/mfdeclre.i}
{us/px/pxmaint.i}
define shared temp-table IntraStat field StatID as recid.
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
 
{us/fs/fsconst.i}    /* Field Service Constants */
/* DEFINITION FOR TEMP TABLE  t_tr_hist1 */
{us/so/sotrhstb.i}
{us/gp/gpldcons.i}   /* CONSTANTS FOR LEGAL DOCUMENT */
{us/px/pxphdef.i gpcmxr}
{us/px/pxphdef.i pasopixr}
{us/px/pxphdef.i pasldel}
{us/px/pxphdef.i rcshxr}
 
&SCOPED-DEFINE QXO-EVENT InvoicePost
&SCOPED-DEFINE QXO-TABLE ih_hist
{us/qx/qxodef.i}
 
define input        parameter l_consolidate    as   logical             no-undo.
define input        parameter l_po_schd_nbr    like sod_contr_id        no-undo.
define input        parameter daybook          as character             no-undo.
define input        parameter p_line_charges   like absl_lc_amt         no-undo.
define input        parameter p_mgmt_ex_rate   like exr_rate            no-undo.
define input        parameter p_mgmt_ex_rate2  like exr_rate            no-undo.
define input        parameter p_last_taxdt     as   date                no-undo.
define output       parameter vinvtamt         like ar_amt              no-undo.
define input-output parameter l_tot_amt1       like ar_base_amt         no-undo.
define input-output parameter l_tot_ramt1      like ar_base_amt         no-undo.
 
define new shared variable sonbr               like sod_nbr.
define new shared variable soline              like sod_line.
define new shared variable tax_recno           as   recid.
define new shared variable soinv               like so_inv_nbr.
define new shared variable using_seq_schedules like mfc_logical         no-undo.
 
define shared variable rndmthd                 like rnd_rnd_mthd.
define shared variable so_recno                as   recid.
define shared variable sod_recno               as   recid.
define shared variable ord_amt                 like sod_price.
define shared variable disc_amt                like sod_price.
define shared variable tax                     like ord_amt extent 3.
define shared variable eff_date                like ar_date.
define shared variable line_total              as   decimal.
define shared variable undo_all                like mfc_logical         no-undo.
define shared variable batch                   like ar_batch.
define shared variable base_amt                like ar_amt.
define shared variable exch_rate               like exr_rate.
define shared variable exch_rate2              like exr_rate.
define shared variable exch_ratetype           like exr_ratetype.
define shared variable tot_inv_comm            as   decimal format "->>,>>9.99"
                                               extent 4                 no-undo.
define shared variable tot_line_comm           as   decimal
                                               format "->>,>>>,>>9.999999"
                                               extent 4.
define shared variable tot_ext_cost            like sod_price.
define shared variable post_entity             like ar_entity.
define shared variable batch_tot               like ord_amt.
define shared variable customer_sched          like mfc_logical.
define shared variable prog_name               as   character           no-undo.
define shared variable consign_batch           like cncu_batch          no-undo.
define shared variable tax_date                like so_tax_date.
define variable line_amt                       like ord_amt             no-undo.
define variable i                              as   integer             no-undo.
define variable net_price                      like sod_price           no-undo.
define variable so_db                          like si_db               no-undo.
define variable err_flag                       as   integer             no-undo.
define variable cmtindx                        like so_cmtindx          no-undo.
define variable deleterma                      like mfc_logical         no-undo.
define variable prepaid_amt                    like ord_amt             no-undo.
define variable restock-pct                    like rma_rstk_pct        no-undo.
define variable connect_db                     like dc_name             no-undo.
define variable mc-error-number                like msg_nbr             no-undo.
define variable return_status                  as   integer             no-undo.
define variable save_sbinfo                    as   logical             no-undo.
define variable create_tax_trailer_line        as   logical             no-undo.
define variable v_par_id                       like tr_ship_id          no-undo.
define variable account_code                   like ac_code             no-undo.
define variable l_invnbr                       like so_inv_nbr          no-undo.
define variable use-log-acctg                  as   logical             no-undo.
define variable tax_type                       like tx2d_tr_type        no-undo.
define variable end_of_month                   as   date                no-undo.
define variable auth_price                     like sod_price           no-undo
                                               format "->>>>,>>>,>>9.99".
define variable auth_found                     as   logical             no-undo.
define variable l_sngldcon                     like mfc_logical         no-undo.
 
define variable iReturnStatus                  as integer               no-undo.
define variable is_active                      like mfc_logical initial no no-undo.
define variable has_gt                         like mfc_logical initial no no-undo.
/* CONSIGNMENT VARIABLES */
{us/so/socnvars.i}
define variable proc_id                        as   character           no-undo.
define variable l_consigned_line_item          as   logical             no-undo.
 
define variable hQADFinInvPostLib as handle     no-undo.
define variable delOnInv                       as logical initial yes    no-undo.
/* whether it is a depot order */
define variable l_isDO                         as logical initial no    no-undo.
define variable l_update                       as logical               no-undo.
define variable l_picked                       as logical               no-undo.
define variable l_completed                    as logical               no-undo.
  
define shared temp-table t_absr_det            no-undo
   field t_absr_id        like absr_id
   field t_absr_reference like absr_reference
   field t_absr_qty       as decimal format "->>>>,>>>,>>9.99"
   field t_absr_ext       as decimal format "->>>>,>>>,>>9.99"
   index t_absr_indx t_absr_id t_absr_reference.
 
define shared workfile invoice_err             no-undo
   field  inv_nbr  like so_inv_nbr
   field  ord_nbr  like so_nbr
   field  db_name  like dc_name.
 
define temp-table tt_abs_item no-undo
   field tt_abs_recid as recid
   index tt_index tt_abs_recid.

define buffer soddet for sod_det.
 
{us/so/soexlnxr.i}        /*  LOAD PL INVOICE INCLUDE FILE  */
 
/* THE TEMP-TABLE WORK_TRNBR STORES THE VALUES OF FIRST AND LAST  */
/* TRANSACTION NUMBER WHICH IS USED WHEN INVOICE IS POSTED VIA    */
/* SHIPPER CONFIRM, FOR ASSIGNING THE TR_RMRKS AND TR_GL_DATE     */
/* FIELDS. PREVIOUSLY, THIS WAS BEING DONE IN RCSOISB1.P PRIOR TO */
/* INVOICE POST.                                                  */
define shared temp-table work_trnbr no-undo
   field work_sod_nbr  like sod_nbr
   field work_sod_line like sod_line
   field work_tr_recid like tr_trnbr
index
   work_sod_nbr
   work_sod_nbr
ascending.
 
/* CREATE TEMP-TABLE TO STORE SALES ORDER/SHIPPER INFO */
/* WHEN THE INVOICE POST IS POSTING AGAINST MULTIPLE   */
/* SHIPPERS.                                           */
define new shared temp-table so_shipper_info no-undo
   field tt_ship_id like tr_ship_id
   field tt_nbr     like so_nbr
   field tt_line    like sod_line
   field tt_inv_nbr like so_inv_nbr
index tt_ship_id
      tt_nbr tt_line
      tt_inv_nbr.

define temp-table tt-shiplist no-undo
   field tt-ship-id   as character
   field tt-sonbr     as character
   field tt-soline    as integer
   field tt-qty-chg   as decimal
   index idxshiplist  is primary
   tt-ship-id tt-sonbr tt-soline.          
       
/* DETERMINE IF SEQUENCE SCHEDULES IS INSTALLED */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'enable_sequence_schedules',
     input '',
     input '',
     input 'rcf_ctrl',
     output using_seq_schedules)"}
 
l_sngldcon = can-find(dc_mstr where dc_active = yes).
 
/* If setting in Sales Order Accounting Control File is 0 then delete on Invoice */
delOnInv = not can-find(first soc_ctrl where soc_domain = global_domain
                                         and soc_days_del_so > 0).
 
/* CHECK TO SEE IF CONTAINER/LINE CHARGES ARE ACTIVATED */
{us/cc/cclc.i}
 
/* CHECK TO SEE IF CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
         "(input  ENABLE_CUSTOMER_CONSIGNMENT,
           input  10,
           input  ADG,
           input  CUST_CONSIGN_CTRL_TABLE,
           output using_cust_consignment)"}
 
/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

run mfairunh.p
  (input 'soivpstfinpl.p',
   input '?',
   output hQADFinInvPostLib) no-error.
 
procesloop:
do transaction on error undo, leave:
 
   for first soc_ctrl where soc_domain = global_domain
   no-lock: end.
 
   if not available soc_ctrl then do:
      create soc_ctrl.
      soc_domain = global_domain.
   end.
   if recid(soc_ctrl) = -1 then .
 
   for first so_mstr where recid(so_mstr) = so_recno
   no-lock: end.
 
   /* check whether it is a depot order */
   if so_fsm_type = fsmro_c and
      can-find(first ca_mstr
               where ca_domain = global_domain
               and   ca_nbr    = so_nbr
               and   can-find(first fwk_mstr
                              where fwk_domain      = global_domain
                              and   fwk_ca_int_type = ca_int_type
                              and   fwk_repair_ctr  = yes)) then
      l_isDO = yes.
 
   delOnInv = delOnInv and not l_isDO.

   {us/px/pxrun.i &PROC = 'setDeleteTrigger'
      &PROGRAM='pasldel.p'
      &HANDLE = ph_pasldel
      &PARAM = "(input delOnInv)"
      &NOAPPERROR = true
      &CATCHERROR = true}

   {us/px/pxrun.i &PROC = 'setIsDo'
      &PROGRAM='pasldel.p'
      &HANDLE = ph_pasldel
      &PARAM = "(input l_isDO)"
      &NOAPPERROR = true
      &CATCHERROR = true}

   /* If for any reason the invoice number is blank then LEAVE.
    * This causes UNDO_ALL to be set TRUE and the SO posting
    * is rolled back. */
   if so_inv_nbr = "" then
      undo procesloop, leave procesloop.
 
   /* UNLIKE DATA CAPTURE FOR TAXES AND TRAILER, WE UPDATE THE      */
   /* INVOICE# IRRESPECTIVE OF WHETHER THE BILL-TO HAS SELF-BILLING */
   /* TURNED ON OR NOT                                              */
   run p-self-bill-control
      (input so_nbr,
       input so_inv_nbr,
       input so_bill).
 
   /* IF THE CONTROL FILE EXIST THEN SHOW THAT THE WORK FILE RECORD */
   /* HAS BEEN POSTED.                                              */
   run mark-as-posted
      (input so_nbr,
       input so_inv_nbr).
 
   /* CREATE AR DISTRIBUTION DETAIL */
   run create-ar-distribution.
 
   /* UPDATE TRANSACTION HISTORY WITH INVOICE NUMBER */
   /* WHEN so_inv_mthd = "y" THEN rcsois.p UPDATES tr_remarks DIRECTLY */
   /* WHEN POSTING INVOICE.                                            */
   if substring(so_inv_mthd,2,1) <> "y"
      or prog_name = "soivpst.p"
      or prog_name = "xfivpst.p" /*grc338*/
      or prog_name = "socnpst.p"
   then do:
 
      /* IN CASE OF SINGLE-DB THE tr_hist BELONGING ONLY TO THE CURRENT
       * DB IS TO BE UPDATED. THERE IS NO NEED TO GO THRU sod_det'S THAT
       * CAUSES A PERFORMANCE OVERHEAD */
      if global_db = ""
         or l_sngldcon 
      then do:
         empty temp-table tt-shiplist no-error.
        
         for each tr_hist
            where tr_hist.tr_domain = global_domain
            and   tr_nbr            = so_nbr                    
            and   tr_type           = "ISS-SO"
            and   tr_rmks           = ""
            and   tr_ship_id        > ""
         no-lock:
               
            if not can-find(first tt-shiplist
                            where tt-ship-id   = tr_ship_id
                            and   tt-sonbr     = tr_nbr
                            and   tt-soline    = tr_line)
            then do:
               create tt-shiplist.
               assign
                  tt-ship-id   = tr_ship_id
                  tt-sonbr     = tr_nbr
                  tt-soline    = tr_line.
                
            end. /* IF NOT CAN-FIND(FIRST tt-consignshiplist */
         
            for first tt-shiplist
               where tt-ship-id   = tr_ship_id
               and   tt-sonbr     = tr_nbr
               and   tt-soline    = tr_line:
               tt-qty-chg = tt-qty-chg + tr_qty_loc.
         
            end. /* FOR FIRST tt-shiplist */
         end. /* FOR EACH tr_hist */
 
         for each tr_hist
            where tr_domain = global_domain
            and   tr_nbr    = so_nbr
            and  (tr_type   = "ISS-SO"
            or    tr_type   = "ISS-COR")
            and   tr_rmks   = ""
         exclusive-lock:
            
            if tr_ship_id <> ""
               and tr_type = "ISS-SO"
            then do:
            
               /* IF CONSIGNED THEN CHECK THE TOTAL QTY CHG = ZERO THEN SKIP */
               /* IF NON-CONSIGNED CHECK IF THE SHIPPER IS UNCONFIRMED AND   */
               /* THEN CHECK THE TOTAL QTY CHG = ZERO THEN SKIP              */
               if ((using_cust_consignment
                      and can-find(first cncix_mstr
                                   where cncix_domain   = global_domain
                                   and   cncix_so_nbr   = tr_nbr
                                   and   cncix_sod_line = tr_line))
                      or can-find(first abs_mstr
                                  where abs_domain                = global_domain
                                  and   abs_shipfrom              = tr_site
                                  and   abs_id                    = "s" + tr_ship_id 
                                  and   substring(abs_status,2,1) <> "y")
                      or not can-find(first abs_mstr
                                      where abs_domain   = global_domain
                                      and   abs_shipfrom = tr_site
                                      and   abs_id       = "s" + tr_ship_id ))
                      and can-find(first tt-shiplist
                                   where tt-ship-id   = tr_ship_id
                                   and   tt-sonbr     = tr_nbr
                                   and   tt-soline    = tr_line
                                   and   tt-qty-chg   = 0)
               then
                  next.    
            end. /* IF tr_ship_id <> "" */  
            
            assign
               tr_rmks    = so_inv_nbr
               v_par_id   = "s" + tr_ship_id
               tr_gl_date = eff_date.
 
            if using_cust_consignment then do:
               /* CHECK TO SEE IF LINE IS CONSIGNED. IF SO, THEN DISPLAY */
               /* A WARNING.                                             */
               l_consigned_line_item = no.
               {us/gp/gprunmo.i &module = "ACN" &program = "socnsod1.p"
                          &param  = """(input  tr_nbr,
                                        input  tr_line,
                                        output l_consigned_line_item,
                                        output consign_loc,
                                        output intrans_loc,
                                        output max_aging_days,
                                        output auto_replenish)"""}
 
               if l_consigned_line_item then do:
                  {us/gp/gprunmo.i &module = "ACN" &program = "socncuup.p"
                             &param  = """(input tr_trnbr,
                                           input so_inv_nbr)"""}
               end.
 
               for first cncu_mstr where cncu_domain  = global_domain
                  and cncu_trnbr   = tr_trnbr
                  and cncu_invoice = so_inv_nbr
               no-lock:
                  consign_batch  = cncu_batch .
               end. /* for first cncu_mstr */
 
            end.  /* if using_cust_consignment */
 
            if using_seq_schedules then do:
               create so_shipper_info.
               assign
                  tt_ship_id = v_par_id
                  tt_nbr     = tr_nbr
                  tt_line    = tr_line
                  tt_inv_nbr = so_inv_nbr.
 
               if recid(so_shipper_info) = -1 then .
            end.

            find first abs_mstr
               where abs_domain   = global_domain
               and   abs_shipfrom = tr_site
               and   abs_id       = "s" + tr_ship_id
            exclusive-lock no-error no-wait.

            if available abs_mstr
            then do:
               abs_inv_nbr = so_inv_nbr.
               empty temp-table tt_abs_item.

               {us/px/pxrun.i &PROC = 'p_get_abs_item_recid'
                              &PROGRAM = 'rcshxr.p'
                              &HANDLE  = ph_rcshxr
                              &PARAM   = "(input  abs_mstr.abs_shipfrom,
                                           input  abs_mstr.abs_id,
                                           input  tr_nbr,
                                           input  string(tr_line),
                                           input  tr_part,
                                           input  so_mstr.so_inv_nbr,
                                           input-output table tt_abs_item)"
                              &NOAPPERROR = true
                              &CATCHERROR = true}

               for each tt_abs_item:
                  run createShipperRef in hQADFinInvPostLib
                     (input so_mstr.so_inv_nbr,
                      input tt_abs_recid).
               end. /* FOR EACH tt_abs_item */
            end. /* IF AVAILABLE abs_mstr */
         end. /* for each tr_hist */
      end. /* if global_db */
      else do:
 
         so_db = global_db.
 
         {us/px/pxrun.i &PROC = 'setDatabase'
            &PROGRAM='pasldel.p'
            &HANDLE = ph_pasldel
            &PARAM = "(input so_db)"
            &NOAPPERROR = true
            &CATCHERROR = true}

         for each sod_det where sod_domain = global_domain
            and sod_nbr    = so_nbr
            and sod_qty_inv <> 0
         no-lock:
 
            for first si_mstr where si_domain = global_domain
               and si_site   = sod_site
            no-lock: end.
 
            /* CHANGE DATABASES IF USING MULTI-DATABASES TO LOCATE tr_hist */
            if available si_mstr and si_db <> so_db then do:
               {us/bbi/gprun.i ""gpalias3.p""
                        "(input  si_db,
                          output err_flag)"}
 
               {us/so/soivconn.i procesloop yes}
            end.
 
            assign
               sonbr  = so_nbr
               soline = sod_line
               soinv  = so_inv_nbr.
 
            {us/bbi/gprun.i ""soivpstf.p""}
 
            /* RESET THE DB ALIAS TO THE ORIGINAL DATABASE */
            if available si_mstr and si_db <> so_db then do:
               {us/bbi/gprun.i ""gpalias3.p""
                        "(input  so_db,
                          output err_flag)"}
 
               {us/so/soivconn.i procesloop no}
            end.
 
         end. /* for each sod_det */
 
      end. /* else of if global_db = "" */
 
   end. /* if substr(so_inv_mthd...*/
   else do:
 
      for each work_trnbr
         where work_sod_nbr = so_nbr
      no-lock
      break by work_sod_nbr
            by work_sod_line:
 
         if first-of(work_sod_line) then do:
            so_db = global_db.

            {us/px/pxrun.i &PROC = 'setDatabase'
               &PROGRAM='pasldel.p'
               &HANDLE = ph_pasldel
               &PARAM = "(input so_db)"
               &NOAPPERROR = true
               &CATCHERROR = true}
 
            for first sod_det where sod_domain = global_domain
               and sod_nbr    = work_sod_nbr
               and sod_line   = work_sod_line
            no-lock: end.
 
            for first si_mstr where si_domain = global_domain
               and si_site   = sod_site
            no-lock: end.
 
            if available si_mstr and si_db <> so_db then do:
               {us/bbi/gprun.i ""gpalias3.p""
                        "(input  si_db,
                          output err_flag)"}
 
               {us/so/soivconn.i procesloop yes}
            end.
 
            {us/bbi/gprun.i ""soivpsti.p""
                     "(input sod_nbr,
                       input sod_line,
                       input so_inv_nbr,
                       input eff_date)"}
 
            if available si_mstr and si_db <> so_db then do:
               {us/bbi/gprun.i ""gpalias3.p""
                        "(input  so_db,
                          output err_flag)"}
 
               {us/so/soivconn.i procesloop no}
            end.
 
         end. /* if first-of(work_sod_line) */
 
      end. /* FOR EACH WORK_TRNBR */
 
   end. /* ELSE OF IF SUBSTR(SO_INV_MTHD,2,1) = Y OR PROG NAME .. */
 
   /* CALL SEQUENCE SCHEDULE PROGRAM TO STORE THE INVOICE NUMBER */
   /* IF SEQUENCE SCHEDULES IS INSTALLED                         */
   if using_seq_schedules then do:
      for each so_shipper_info exclusive-lock:
         {us/gp/gprunmo.i &module = "ASQ" &program = ""rcabssiv.p""
                    &param  = """(input tt_ship_id,
                                  input tt_nbr,
                                  input tt_line,
                                  input tt_inv_nbr)"""}
 
         delete so_shipper_info.
      end.
   end.
 
   /* Second find for so_mstr with exclusive lock */
   find so_mstr where recid(so_mstr) = so_recno exclusive-lock.
 
   /* If for any reason the invoice number is blank then LEAVE.
    * This causes UNDO_ALL to be set TRUE and the SO posting
    * is rolled back. */
   if so_inv_nbr = "" then
      undo procesloop, leave procesloop.
 
   /* Save the prepaid amount for invoice history */
   prepaid_amt = so_prepaid.
 
   /*
   * Only adjust the prepaid amount here when the invoice does
   * not have any credit card details from an external system
   * associated with it. The prepaid amount is adjusted for
   * these orders in the deleteCreditCardDetails procedure.
   */
   if not can-find(first qad_wkfl where qad_domain = global_domain
      and qad_key1 begins string(so_nbr,"x(8)")
      and qad_key2 = "CreditCard")
   then do:
      if ord_amt >= 0 then
         so_prepaid = max(0, so_prepaid - ord_amt).
      else
         so_prepaid = min(0, so_prepaid - ord_amt).
   end.
 
   /*******************************************************/
   /*     Check to see if the whole rma is completed and  */
   /*     RMA status is blank.                            */
   /*******************************************************/
   assign
      deleterma = no
      restock-pct = 0.
 
   if so_fsm_type = "RMA" then do:
         {us/bbi/gprun.i ""fsivrmac.p""
                  "(input  so_recno,
                    output deleterma)"}
   end.
 
   if so_fsm_type = "RMA"
      and deleterma
   then do:
      {us/bbi/gprun.i ""fsivrhd.p""
               "(input  so_recno,
                 input  ""RMA"",
                 input  delOnInv,
                 output restock-pct)"}
   end.
 
   if so_sched = yes
      and so__qadc03 = "yes"
      and not can-find(first t_tr_hist1 where t_tr_nbr = so_nbr)
   then do:
      /* sotrhstb.p CREATES TEMP-TABLE TO STORE tr_hist RECORDS AND RETRIEVE  */
      /* THE SAME IN soauthbl.p TO IMPROVE THE PERFORMANCE WHILE PRINTING     */
      /* AUTHORIZATION NUMBERS FOR SCHEDULE ORDERS.                           */
      {us/bbi/gprun.i ""sotrhstb.p""
               "(input so_nbr,
                 input so_inv_nbr,
                 input-output table t_tr_hist1)"}
 
   end.
 
   for each sod_det where sod_domain = global_domain
      and   sod_nbr = so_nbr
      and   sod_compl_stat = ""
      and  (sod_qty_inv <> 0
      /* CREATE HISTORY FOR 0 ORD-QTY LINES */
      or   (sod_qty_ord = 0 and sod_qty_ship = 0
      and   sod_qty_all = 0 and sod_qty_pick = 0
      and   substring(sod_fsm_type,1,3) <> "RMA"
      and   not sod_sched)
      /*And lines which had remaining bckord cancl'd*/
      or   (sod_qty_ord - sod_qty_ship = 0
      and   substring(sod_fsm_type,1,3) <> "RMA"
      and   not sod_sched))
   exclusive-lock:
 
      assign
         l_invnbr  = so_inv_nbr
         net_price = sod_price.
 
      {us/px/pxrun.i &PROC = 'setInvoiceNumber'
         &PROGRAM='pasldel.p'
         &HANDLE = ph_pasldel
         &PARAM = "(input l_invnbr)"
         &NOAPPERROR = true
         &CATCHERROR = true}

      if sod_tax_in then do:
         /* DETERMINE NET PRICE.  TAX BY TOTAL RECORDS    */
         /* (LINE 0) DO NOT NEED TO BE CONSIDERED BECAUSE */
         /* IF TAX IS INCLUDED IN A PRICE TAXES WILL ONLY */
         /* BE CALCULATED BY LINE AND NOT BY TOTAL.       */
         for each tx2d_det where tx2d_domain  = global_domain
            and   tx2d_ref     = so_inv_nbr
            and   tx2d_nbr     = so_nbr
            and   tx2d_line    = sod_line
            and   tx2d_tr_type = "16"
         no-lock:
            net_price = net_price - tx2d_cur_tax_amt.
         end.
      end.
 
      line_amt = (sod_qty_inv * net_price) * (1 - (so_disc_pct / 100)).
 
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                "(input-output line_amt,
                  input  rndmthd,
                  output mc-error-number)" }
      if mc-error-number <> 0 then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end.
 
      /* CHECK AUTHORIZATION RECORDS FOR DIFFERENT EXTENDED PRICE */
      if sod_sched      = yes
         and so__qadc03 = "yes"
      then do:
 
         auth_found = no.
         {us/bbi/gprun.i ""soauthbl.p""
                  "(input  table t_tr_hist1,
                    input  so_inv_nbr,
                    input  so__qadc03,
                    input  sod_nbr,
                    input  sod_line,
                    input  net_price,
                    input  sod_site,
                    input  line_amt,
                    output auth_price,
                    output auth_found)"}
 
         line_amt = auth_price * (1 - (so_disc_pct / 100)).
 
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
                   "(input-output line_amt,
                     input  rndmthd,
                     output mc-error-number)"}
 
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.
 
      end. /* IF sod_sched */
 
      if sod_qty_inv <> 0
         and can-find (iec_ctrl where iec_domain = global_domain
                                  and iec_use_instat = yes)
      then do:
         /* CREATE IMPORT EXPORT HISTORY RECORD */
         /* consign_batch WILL CONTAIN THE BATCH NUMBER GENERATED BY    */
         /* EITHER BY THE  CREATE USAGE / UNDO USAGE TRANSACTION        */
         /* THIS BATCH NUMBER IS USED TO ACCORDING UPDATE/CREATE/DELETE */
         {us/bbi/gprun.i ""iehistso.p""
                  "(buffer sod_det,
                    input sod_qty_inv,
                    input """",
                    input consign_batch,
                    input so_inv_date,
                    input ""POST"")"}
      end.
 
      /*CREATE HISTORY FOR SALES ORDER LINES sod_det */
      sod_recno = recid(sod_det).
      {us/bbi/gprun.i ""soivpstc.p""}
 
      /* SOD_QTY_IVCD REPRESENTS THE QUANTITY WHICH HAS BEEN INVOICED. */
      assign
         sod_qty_ivcd = sod_qty_ivcd + sod_qty_inv
         sod_qty_inv  = 0.
 
      /* Update qty to inv in remote database */
      if global_db <> ""
         and l_sngldcon = no
      then do:
 
         for first si_mstr where si_domain = global_domain
            and si_site = sod_site
         no-lock: end.
 
         if available si_mstr and si_db <> global_db then do:
            {us/bbi/gprun.i ""gpalias3.p""
                     "(input  si_db,
                       output err_flag)"}
 
            {us/so/soivconn.i procesloop yes}
 
            assign
               sonbr  = so_nbr
               soline = sod_line.
 
            {us/bbi/gprun.i ""soivpstu.p""}
 
            {us/bbi/gprun.i ""gpalias3.p""
                     "(input  so_db,
                       output err_flag)"}
 
            {us/so/soivconn.i procesloop no}
         end.
 
      end.
 
      /* CLOSING (AND DELETING) SALES ORDER LINES - A discussion:
       * We want to close a given line if it has been completely
       * shipped or overshipped.  This is complicated by the fact that
       * either the quantity ordered or the quantity shipped may be
       * negative.  Another way of looking at the problem is that the
       * line should be closed if the shipment has driven the
       * backordered quantity across zero (so that the result has a
       * different sign than the ordered quantity).  This is
       * complicated by the fact that Progress does not provide a sign
       * function.  HOWEVER, we know that the product of two numbers
       * is negative if and only if they have different signs and
       * multiplication is relatively cheap in terms of processing
       * time. */
      for each ecx_ref
         where ecx_domain = global_domain
         and   ecx_nbr    = sod_nbr
         and   ecx_line   = string(sod_line)
         and   ecx_order_type = "so"
      no-lock:
         create ecxref.
         assign
            orderType = ecx_order_type
            orderNbr  = ecx_nbr
            exHdrRef  = ecx_ext_ref
            exLnRef   = ecx_ext_line
            orderLn   = decimal(ecx_line).
      end.
 
      /*TEST TO SEE IF SALES ORDER LINE SHOULD BE DELETED (see above)*/
      l_consigned_line_item = no.
 
      if using_cust_consignment then do:
         l_consigned_line_item = no.
         {us/gp/gprunmo.i &module = "ACN" &program = "socnsod1.p"
                    &param  = """(input  sod_nbr,
                                  input  sod_line,
                                  output l_consigned_line_item,
                                  output consign_loc,
                                  output intrans_loc,
                                  output max_aging_days,
                                  output auto_replenish)"""}
      end.
 
    /*grc338  if prog_name <> "rcsois.p" */
          if (prog_name <> "rcsois.p" and prog_name <> "xfrcsois.p")  /*grc338*/
      then do:

         {us/px/pxrun.i &PROC = 'checkSoLinePicked'
                        &PROGRAM='pasopixr.p'
                        &HANDLE = ph_pasopixr
                        &PARAM = "(input sod_nbr,
                                   input sod_line,
                                   output l_picked)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

      end.

      /* ANY CHANGE TO THIS CHECK FOR l_completed SHOULD ALSO BE */
      /* MADE TO p_checkOrderLine IN pasldel.p */
      if (l_consigned_line_item
            and (sod_qty_all  = 0
               and sod_qty_pick = 0)
            and not sod_sched
            and (sod_qty_ord * (sod_qty_ord - sod_cum_qty[4]) <= 0)
            and (sod_qty_ship = sod_cum_qty[4]))
         or (not l_consigned_line_item
            and (sod_qty_all  = 0
               and sod_qty_pick = 0)
            and  not sod_sched
            and (sod_qty_ord * (sod_qty_ord - sod_qty_ship) <= 0))
            and ((sod_qty_ord * (sod_qty_ord - sod_qty_ivcd) <= 0 )) then do:
         l_completed = yes.
      end.
      else
         l_completed = no.

      /* IF THE LINE IS CONSIGNED, CHECK TO SEE IF IT HAS BEEN */
      /* COMPLETELY USED BEFORE DELETING IT.                   */
      /* grc 338 if prog_name <> "rcsois.p" */
      if (prog_name <> "rcsois.p" and prog_name <> "xfrcsois.p" )/*grc338 */
         and l_completed
         and not l_picked
         /* Check for invoiced not just shipped */
      then do:
 
         /* Delete line information that might exist in other dbs */
         for first si_mstr where si_domain = global_domain
            and si_site = sod_site
         no-lock: end.
 
         if available si_mstr and si_db <> so_db then do:
            {us/bbi/gprun.i ""gpalias3.p""
                     "(input  si_db,
                       output err_flag)"}
 
            {us/so/soivconn.i procesloop yes}
 
            assign
               sonbr  = so_nbr
               soline = sod_line.
 
            /* DO NOT EXECUTE MFSOFC01.I                   */
            /* AND MFSOFC02.I WHEN CALLED FROM DETAIL LINE */
            {us/bbi/gprun.i ""solndel.p""  "(input no)"}
 
            {us/bbi/gprun.i ""gpalias3.p""
                     "(input  so_db,
                       output err_flag)"}
 
            {us/so/soivconn.i procesloop no}
         end.
 
         for each sob_det where sob_domain = global_domain
             and sob_nbr    = sod_nbr
             and sob_line   = sod_line
         exclusive-lock:
 
            if sod_status <> "FAS"
               and sod_fa_nbr  = ""
               and sod_lot     = ""
               and sod_type    = ""
               and sob_qty_req <> 0
            then do:
 
               find pt_mstr where pt_domain = global_domain
                   and  pt_part    = sob_part
               exclusive-lock no-error.
 
               if available pt_mstr then do:
 
                  pt_mrp = yes.
 
                  find in_mstr where in_domain = global_domain
                     and in_part = pt_part
                     and in_site = sob_site
                  exclusive-lock no-error.
 
                  if available in_mstr then do:
                     if sob_qty_req > 0 then
                        in_qty_req =
                           in_qty_req - max(sob_qty_req - sob_qty_iss,0).
                     if sob_qty_req < 0 then
                        in_qty_req =
                           in_qty_req - min(sob_qty_req - sob_qty_iss,0).
                  end.
 
               end. /* if available pt_mstr */
 
            end. /* if sod_status <> "FAS" */
 
            {us/mf/mfmrwdel.i "sob_det" sob_part sob_nbr
                "string(sob_line) + ""-"" + sob_feature" sob_parent}
 
            if delOnInv then
               run del-cmt-det
                  (input sob_cmtindx).
 
            if delOnInv then
               delete sob_det.
 
         end. /* for each sob_det */
 
         /* Delete cost data */
         run del-sct-det
            (input sod_part,
             input sod_nbr,
             input sod_line).
 
         {us/mf/mfmrwdel.i "sod_fas" sod_part sod_nbr string(sod_line) """" }
         if so_fsm_type <> "RMA" or deleterma then do:
 
            if delOnInv then
               run del-cmt-det
                  (input sod_cmtindx).
 
            /* DELETE IMPORT EXPORT RECORDS */
            if delOnInv then
               run p-ieddet-delete
                  (input "1",
                   input sod_nbr,
                   input sod_line).
 
            /* Delete price history records */
            if delOnInv then
               run del-pih-hist
                  (input sod_nbr,
                   input sod_line).
 
            /* DELETE BTB RECORDS */
            run del-btb-det.
 
            if using_line_charges and delOnInv then do:
               /* DELETE ANY ADDITIONAL LINE CHARGES */
               {us/gp/gprunmo.i &module = "ACL" &program = ""sosodlcd.p""
                          &param  = """(input sod_nbr,
                                        input sod_line)"""}
            end.
  
            /* DELETE tx2d_det FOR FULLY SHIPPED LINES          */
            /* I.E. BEFORE sod_det LINES ARE DELETED            */
            run del_tx2d_line13
               (input so_inv_nbr,
                input sod_nbr,
                input sod_line,
                input '16').
 
            /* IF LOGISTICS ACCOUNTING IS ENABLED */
            if use-log-acctg then do:
 
               /* LOGISTICS ACCTG TAX TYPE 43 RECORDS ARE NEEDED DURING */
               /* VOUCHERING OF THE LOGISTICS CHARGE. THEREFORE TYPE 43 */
               /* tx2d_det RECORDS CREATED DURING SO SHIPMENT PROCESSES */
               /* ARE NOT DELETED HERE.                                 */
               tax_type = "41".
               if so_fsm_type = "RMA" then
                  tax_type = "46".
 
               /* DELETE LOGISTICS ACCOUNTING tx2d_det RECORDS FOR SO LINE */
               {us/gp/gprunmo.i &module = "LA" &program = "lataxdel.p"
                          &param  = """(input tax_type,
                                        input sod_nbr,
                                        input sod_line)"""}
            end.   /* use-log-acctg */
 
            run deleteCreditCardDetails
               (input sod_nbr,
                input sod_line).
 
            for first trq_mstr where trq_domain = global_domain
               and trq_doc_ref  = sod_btb_po
               and trq_doc_type = "PO"
               and trq_msg_type = "ORDERS"
            exclusive-lock:
               delete trq_mstr.
            end. /* FOR FIRST trq_mstr */
 
            if delOnInv then do:

               {us/px/pxrun.i &PROC       = 'deleteRelatedSerialInfoBySoLine'
                              &PROGRAM    = 'pasopixr.p'
                              &HANDLE     = ph_pasopixr
                              &PARAM      = "(input sod_det.sod_nbr,
                                              input sod_det.sod_line)"
                              &NOAPPERROR = true
                              &CATCHERROR = true}

               delete sod_det.
            end.
            else if not l_isDO then do:
 
               /* Run the hook here to determine if we should leave the */
               /* Sales order open. In some cases, Shipper needs to be  */
               /* unconfirmed to backout all the Invoice, Sales Order   */
               /* and Legal document processing. If these fields        */
               /* have a value, then Shipper Unconfirm doesn't allow    */
               /* user to unconfirm the shipper. So in this case, we    */
               /* need to leave these fields blank.                     */
 
               {us/bbi/gprun.i ""gpinvdat.p"" "(input sod_det.sod_nbr,
                                                input sod_det.sod_line,
                                                output l_update)"}
               if l_update then do:
                  assign
                     sod_compl_stat = "01"
                     sod_compl_date = today.
               end.
 
            end. /* if not l_isDO */ 
 
         end.
 
      end. /* if (sod_qty_all = 0 ... */
      else if l_completed
      and prog_name = "rcsois.p" then do:

         {us/px/pxrun.i &PROC = 'addOrderLine'
                        &PROGRAM='pasldel.p'
                        &HANDLE = ph_pasldel
                        &PARAM = "(input sod_nbr,
                                   input string(sod_line))"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

      end. /*sod_qty_all = 0 and from so confirm/unconfirm*/
 
   end. /* for each sod_det */
 
   /*CREATE INVOICE HISTORY - FOR EVERY INVOICE CREATED */
   run create-invoice-history.
  
   assign
      so_to_inv = no
      so_inv_nbr  = "".
 
   /* RESTORING THE ORIGINAL VALUE OF SO_SHIP WHICH GETS UPDATED */
   /* BY ABS_SHIPTO DURING SHIPPER CONFIRM                       */
   if so__qadc01 <> "" then
      assign
         so_ship    = so__qadc01
         so__qadc01 = "".
 
   if not customer_sched then
      assign
         so_trl1_amt = 0
         so_trl2_amt = 0
         so_trl3_amt = 0.
 
   /* IF NO OPEN LINE REMAIN, DELETE THE SALES ORDER */
   /* (Lines with zero qty ord count as closed) */
   for last sod_det where sod_domain = global_domain
      and  sod_nbr       = so_nbr
      and  (sod_qty_ord  <> 0
      or    sod_qty_ship <> 0
      or    sod_qty_all  <> 0
      or    sod_qty_pick <> 0
      or    sod_sched)
      and  (sod_fsm_type <> "FSM-RO"
            or (sod_fsm_type = "FSM-RO" and  l_isDO))
      and  sod_compl_stat = ""
   no-lock: end.
 
   if available sod_det
      /* grc338 * and prog_name <> "rcsois.p" */
      and ( prog_name <> "rcsois.p" and prog_name <> "xfrcsois.p") /*grc338 */
   then do:
 
      /* DELETE tx2d_det FOR PARTIALLY SHIPPED LINES  */
      /* I.E. IF sod_det LINES EXISTS                 */
      for each soddet
         where soddet.sod_domain   = global_domain
         and   soddet.sod_nbr      = sod_det.sod_nbr
         and  (soddet.sod_qty_ord  <> 0
         or    soddet.sod_qty_ship <> 0
         or    soddet.sod_qty_all  <> 0
         or    soddet.sod_qty_pick <> 0
         or    soddet.sod_sched)
         and   (soddet.sod_fsm_type <> "FSM-RO"
                or (soddet.sod_fsm_type = "FSM-RO" and l_isDO))
         and   soddet.sod_compl_stat = ""
      no-lock:
 
         run del_tx2d_line13
            (input l_invnbr,
             input soddet.sod_nbr,
             input soddet.sod_line,
             input '16').
 
      end. /* FOR EACH soddet */
 
   end. /* IF AVAILABLE sod_det */
 
   if (not available sod_det
         or so_fsm_type = "RMA"
         and deleterma)
             /* grc338 * and prog_name <> "rcsois.p" */
      and ( prog_name <> "rcsois.p" and prog_name <> "xfrcsois.p") /*grc338 */
   then do:
 
      /* COMMENTS SHOULD NOT BE DELETED IN CASE OF CALL INVOICE */
      if so_fsm_type <> "fsm-ro" and delOnInv then
         run del-cmt-det
            (input so_cmtindx).
 
      for each sod_det
         where sod_domain = global_domain
         and   sod_nbr    = so_nbr
         and   sod_line   > 0
      exclusive-lock:
 
         /* FORCE USE OF sod_nbrln INDEX */
         /* Delete line information that might exist in other dbs */
         for first si_mstr where si_mstr.si_domain = global_domain
            and si_site = sod_site
         no-lock: end.
 
         if available si_mstr and si_db <> so_db then do:
            {us/bbi/gprun.i ""gpalias3.p""
                     "(input  si_db,
                       output err_flag)"}
 
            {us/so/soivconn.i procesloop yes}
 
            assign
               sonbr  = so_nbr
               soline = sod_line.
 
            /* DO NOT EXECUTE MFSOFC01.I                   */
            /* AND MFSOFC02.I WHEN CALLED FROM DETAIL LINE */
            {us/bbi/gprun.i ""solndel.p"" "(input no)"}
 
            /* Reset the DB Alias To the SO Database */
            {us/bbi/gprun.i ""gpalias3.p""
                     "(input  so_db,
                       output err_flag)"}
 
            {us/so/soivconn.i procesloop no}
         end.
 
         if delOnInv then
            for each sob_det
               where sob_domain = global_domain
               and   sob_nbr    = so_nbr
               and   sob_line   = sod_line
            exclusive-lock:
               run del-cmt-det
                  (input sob_cmtindx).
               delete sob_det.
            end.
 
         /* Delete cost data */
         run del-sct-det
            (input sod_part,
             input sod_nbr,
             input sod_line).
 
         if so_fsm_type <> "RMA" or deleterma then do:
 
            if delOnInv then
               run del-cmt-det
                  (input sod_cmtindx).
 
            /* DELETE IMPORT EXPORT RECORDS */
            if delOnInv then
               run p-ieddet-delete
                  (input "1",
                   input sod_nbr,
                   input sod_line).
 
            /* DELETE BTB RECORDS */
            run del-btb-det.
  
            /* IF LOGISTICS ACCOUNTING IS ENABLED */
            if use-log-acctg and delOnInv then do:
 
               /* LOGISTICS ACCTG TAX TYPE 43 RECORDS ARE NEEDED DURING */
               /* VOUCHERING OF THE LOGISTICS CHARGE. THEREFORE TYPE 43 */
               /* tx2d_det RECORDS CREATED DURING SO SHIPMENT PROCESSES */
               /* ARE NOT DELETED HERE.                                 */
               tax_type = "41".
               if so_fsm_type = "RMA" then
                  tax_type = "46".
 
               /* DELETE LOGISTICS ACCOUNTING tx2d_det RECORDS FOR SO LINE */
               {us/gp/gprunmo.i &module = "LA" &program = "lataxdel.p"
                          &param  = """(input tax_type,
                                        input sod_nbr,
                                        input sod_line)"""}
            end.   /* use-log-acctg */
 
            run deleteCreditCardDetails
               (input sod_nbr,
                input sod_line).
 
            if delOnInv then do:

               {us/px/pxrun.i &PROC       = 'deleteRelatedSerialInfoBySoLine'
                              &PROGRAM    = 'pasopixr.p'
                              &HANDLE     = ph_pasopixr
                              &PARAM      = "(input sod_det.sod_nbr,
                                              input sod_det.sod_line)"
                              &NOAPPERROR = true
                              &CATCHERROR = true}

               delete sod_det.
            end.
            else if not l_isDO then
               assign
                  sod_compl_stat = "01"
                  sod_compl_date = today.
 
         end.
 
      end. /* for each sod_det */
 
      empty temp-table t_tr_hist1.
 
      /* DELETE TAX DETAIL FOR SALES ORDER OR CALL INVOICE */
      run del-tx2d-det
         (input so_nbr,
          input so_quote).
 
      if so_fsm_type <> "RMA"  or deleterma then do:
 
         if delOnInv then
            /* DELETE INTRASTAT MASTER RECORD */
            run p-iemstr-delete
               (input "1",
                input so_nbr).
  
         /* IF LOGISTICS ACCOUNTING IS ENABLED */
         if use-log-acctg then do:
 
            /* LOGISTICS ACCTG TAX TYPE 43 RECORDS ARE NEEDED DURING */
            /* VOUCHERING OF THE LOGISTICS CHARGE. THEREFORE TYPE 43 */
            /* tx2d_det RECORDS CREATED DURING SO SHIPMENT PROCESSES */
            /* ARE NOT DELETED HERE.                                 */
            tax_type = "41".
            if so_fsm_type = "RMA" then
               tax_type = "46".
 
            /* DELETE ALL LOGISTICS ACCOUNTING tx2d_det RECORDS FOR SO */
            {us/gp/gprunmo.i &module = "LA" &program = "lataxdel.p"
                       &param  = """(input tax_type,
                                     input so_nbr,
                                     input 0)"""}
 
            /* DELETE THE LACD_DET (LOGISTICS ACCOUNTING CHARGE DETAIL)*/
            /* RECORDS REFERENCING THIS SALES ORDER.   */
            if delOnInv then do:
               {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                           &param  = """(input 'DELETE',
                                         input '{&TYPE_SO}',
                                         input so_nbr,
                                         input ' ',
                                         input ' ',
                                         input ' ',
                                         input no,
                                         input no)"""}
            end. /*if delOnInv */
 
         end. /* IF use-log-acctg */
 
         if delOnInv then
            delete so_mstr.
         else if not l_isDO then do:
 
            /* Run the hook here to determine if we should leave the */
            /* Sales order open. In some cases, Shipper needs to be  */
            /* unconfirmed to backout all the Invoice, Sales Order   */
            /* and Legal document processing. If these fields        */
            /* have a value, then Shipper Unconfirm doesn't allow    */
            /* user to unconfirm the shipper. So in this case, we    */
            /* need to leave these fields blank.                     */
 
            {us/bbi/gprun.i ""gpinvdat.p"" "(input so_mstr.so_nbr,
	                                     input 0,
                                             output l_update)"}
            if l_update then do:
 
               assign
                  so_compl_stat = "01"
                  so_compl_date = today.
            end.
 
         end. /* if not l_isDO */ 
 
      end.
 
   end. /* if not available sod-det */
 
   return.
 
end. /* do transaction on error undo, leave */
 
undo_all = yes.
 
PROCEDURE create-ar-distribution:
 
   define variable salesAmt like ar_sales_amt no-undo.
   define variable commPct  like ar_comm_pct no-undo.
   define variable mrgnAmt  like ar_mrgn_amt  no-undo.
   define variable ccStatus as character initial "" no-undo.
   define variable payType  as character initial "" no-undo.
 
   for first gl_ctrl where gl_domain = global_domain
   no-lock: end.
 
   for first so_mstr where recid(so_mstr) = so_recno
   no-lock: end.
   
   /* SAVE TRAILER CHARGES INFORMATION IF NEEDED BY SELF-BILLING */
   if save_sbinfo then
      if so_trl1_amt <> 0 or so_trl2_amt <> 0 or so_trl3_amt <> 0 then
         run save_selfbill_info
            (input "C",
             input so_inv_nbr,
             input so_nbr,
             input (so_trl1_amt + so_trl2_amt + so_trl3_amt) ).
 
   {us/bbi/gprun.i ""txmkard.p""
      "(input so_inv_nbr,
        input so_nbr,
        input '16'  /* TRXN TYPE */)"}
 
   /* Check to see if we are processing a credit card order */
   run checkCCTransactionStatus in hQADFinInvPostLib
      (input so_mstr.so_nbr,
       output ccStatus).
 
   if ccStatus <> "" then
      payType = "CREDITCARD".

   run createInvoice in hQADFinInvPostLib
      (input recid(so_mstr),
       input eff_date,
       input batch,
       input l_po_schd_nbr,
       input payType,
       input exch_rate,
       input exch_rate2,
       input p_last_taxdt,
       input daybook).
 
   assign
      tot_inv_comm[1] = 0
      tot_inv_comm[2] = 0
      tot_inv_comm[3] = 0
      tot_inv_comm[4] = 0
      vinvtamt        = ord_amt.
 
   /* AR_CURR IS NOT BASE CURR - CONVERT BASE AMOUNT TO BASE CURR*/
   if (so_curr <> gl_base_curr) then do:
 
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                "(input  so_curr,
                  input  base_curr,
                  input  so_ex_rate,
                  input  so_ex_rate2,
                  input  ord_amt,
                  input  true,  /* ROUND */
                  output base_amt,
                  output mc-error-number)" }
      if mc-error-number <> 0 then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end.
   end.
   else
      base_amt = ord_amt.
 
   assign
      l_tot_amt1  = l_tot_amt1  + ord_amt
      l_tot_ramt1 = l_tot_ramt1 + base_amt.
 
   if eff_date = ? then
         eff_date = today.
 
   assign
      salesAmt = salesAmt + (line_total - p_line_charges) + disc_amt
      mrgnAmt  = mrgnAmt + line_total + disc_amt - tot_ext_cost
      tot_inv_comm[1] = tot_inv_comm[1]
                      + (tot_line_comm[1] * (100 - so_disc_pct)) / 100
      tot_inv_comm[2] = tot_inv_comm[2]
                      + (tot_line_comm[2] * (100 - so_disc_pct)) / 100
      tot_inv_comm[3] = tot_inv_comm[3]
                      + (tot_line_comm[3] * (100 - so_disc_pct)) / 100
      tot_inv_comm[4] = tot_inv_comm[4]
                      + (tot_line_comm[4] * (100 - so_disc_pct)) / 100.
 
   if soc_ctrl.soc_margin = yes then do:
      if mrgnAmt <> 0 then
         /* ROUNDING IS DONE IF CONSOLIDATION HAS OCCURED ELSE */
         /* ASSIGN SALES ORDER COMMISSION PERCENTAGE           */
         assign
            commPct[1] = if l_consolidate then
                                round(((tot_inv_comm[1] * 100)/ mrgnAmt), 2)
                             else
                                so_comm_pct[1]
            commPct[2] = if l_consolidate then
                                round(((tot_inv_comm[2] * 100)/ mrgnAmt), 2)
                             else
                                so_comm_pct[2]
            commPct[3] = if l_consolidate then
                                round(((tot_inv_comm[3] * 100)/ mrgnAmt), 2)
                             else
                                so_comm_pct[3]
            commPct[4] = if l_consolidate then
                                round(((tot_inv_comm[4] * 100)/ mrgnAmt), 2)
                             else
                                so_comm_pct[4].
      else
         assign
            commPct[1] = 0
            commPct[2] = 0
            commPct[3] = 0
            commPct[4] = 0.
   end.
   else if soc_margin = no then do:
      if salesAmt <> 0 then
 
         /* ROUNDING IS DONE IF CONSOLIDATION HAS OCCURED ELSE */
         /* ASSIGN SALES ORDER COMMISSION PERCENTAGE           */
         assign
            commPct[1] = if l_consolidate then
                               round(((tot_inv_comm[1] * 100)/ salesAmt), 2)
                             else
                               so_comm_pct[1]
            commPct[2] = if l_consolidate then
                               round(((tot_inv_comm[2] * 100)/ salesAmt), 2)
                             else
                               so_comm_pct[2]
            commPct[3] = if l_consolidate then
                               round(((tot_inv_comm[3] * 100)/ salesAmt), 2)
                             else
                               so_comm_pct[3]
            commPct[4] = if l_consolidate then
                               round(((tot_inv_comm[4] * 100)/ salesAmt), 2)
                             else
                               so_comm_pct[4].
      else
         assign
            commPct[1] = 0
            commPct[2] = 0
            commPct[3] = 0
            commPct[4] = 0.
   end.
 
   run updateInvoiceTotals in hQADFinInvPostLib
      (input salesAmt,
       input commPct,
       input mrgnAmt).
 
   batch_tot = batch_tot + ord_amt.
 
END PROCEDURE. /* procedure create-ar-distribution */
 
PROCEDURE create-invoice-history:
   define buffer ih_hist for ih_hist.
   define buffer cmtdet for cmt_det.
 
   define variable l_rnd_flag       like mfc_logical     no-undo.
   define variable rnd_amt          like sod_act_price   no-undo.
   define variable rnd_acct         like sod_acct        no-undo.
   define variable rnd_sub          like rndc_sub        no-undo.
   define variable proc-parent      as character         no-undo.   
 
   /* Copy comments */
   if so_mstr.so_cmtindx <> 0 then do:
      {us/gp/gpcmtcpy.i &old_index = so_cmtindx
                  &new_index = cmtindx
                  &counter   = i}
   end.
   else
      cmtindx = 0.
 
   /* Check whether Swiss Rounding is enabled */
   {us/bbi/gprun.i ""soivpret.p"" "(output l_rnd_flag)"}
 
   /* Get rounded amount if rounding is enabled */
   if l_rnd_flag then do:
      {us/bbi/gprun.i ""sosorcet.p"" "(input so_site,
                                input so_ship,
                                input so_curr,
                                input ord_amt,
                                output rnd_amt,
                                output rnd_acct,
                                output rnd_sub,
                                output mc-error-number)"}
      assign
         rnd_amt = rnd_amt - ord_amt.
   end.
 
   create ih_hist.
   assign
      ih_domain       = global_domain
      ih_bank         = so_bank
      ih_bill         = so_bill
      ih_bol          = so_bol
      ih_cartons      = so_cartons
      ih_ca_nbr       = so_ca_nbr
      ih_channel      = so_channel
      ih_cmtindx      = cmtindx
      ih_cncl_date    = so_cncl_date
      ih_comm_pct[1]  = so_comm_pct[1]
      ih_comm_pct[2]  = so_comm_pct[2]
      ih_comm_pct[3]  = so_comm_pct[3]
      ih_comm_pct[4]  = so_comm_pct[4]
      ih_conf_date    = so_conf_date
      ih_conrep       = so_conrep
      ih_credit       = so_credit
      ih_crprlist     = so_crprlist
      ih_cr_card      = so_cr_card
      ih_cr_init      = so_cr_init
      ih_cr_terms     = so_cr_terms
      ih_curr         = so_curr
      ih_cust         = so_cust
      ih_cust_po      = so_cust_po
      ih_disc_pct     = so_disc_pct
      ih_div          = so_div
      ih_due_date     = so_due_date
      ih_ex_rate      = exch_rate
      ih_ex_rate2     = exch_rate2
      ih_ex_ratetype  = exch_ratetype
      ih_fcg_code     = so_fcg_code
      ih_fix_pr       = so_fix_pr
      ih_fix_rate     = so_fix_rate
      ih_fob          = so_fob
      ih_fr_list      = so_fr_list
      ih_fr_terms     = so_fr_terms
      ih_fr_min_wt    = so_fr_min_wt
      ih_fsm_type     = so_fsm_type
      ih_fst_id       = so_fst_id
      ih_inv_cr       = so_inv_cr
      ih_inv_date     = so_inv_date
      ih_inv_mthd     = so_inv_mthd
      ih_inv_nbr      = so_inv_nbr
      ih_lang         = so_lang
      ih_nbr          = so_nbr
      ih_ord_date     = so_ord_date
      ih_partial      = so_partial
      ih_po           = so_po
      ih_prepaid      = prepaid_amt
      ih_prep_tax     = so_prep_tax
      ih_priced_dt    = so_priced_dt
      ih_pricing_dt   = so_pricing_dt
      ih_primary      = so_primary
      ih_secondary    = so_secondary
      ih_print_bl     = so_print_bl
      ih_print_pl     = so_print_pl
      ih_print_so     = so_print_so
      ih_project      = so_project
      ih_pr_list      = so_pr_list
      ih_pr_list2     = so_pr_list2
      ih_pst          = so_pst
      ih_pst_id       = so_pst_id
      ih_pst_pct      = so_pst_pct
      ih_quote        = so_quote
      ih_req_date     = so_req_date
      ih_rev          = so_rev
      ih_rmks         = so_rmks
      ih_rstk_pct     = restock-pct
      ih_sa_nbr       = so_sa_nbr
      ih_sched        = so_sched
      ih_sch_mthd     = so_sch_mthd
      ih_ship         = so_ship
      ih_shipvia      = so_shipvia
      ih_ship_date    = so_ship_date
      ih_ship_eng     = so_ship_eng
      ih_ship_po      = so_ship_po
      ih_site         = so_site
      ih_size         = so_size
      ih_size_um      = so_size_um
      ih_slspsn[1]    = so_slspsn[1]
      ih_slspsn[2]    = so_slspsn[2]
      ih_slspsn[3]    = so_slspsn[3]
      ih_slspsn[4]    = so_slspsn[4]
      ih_source       = so_source
      ih_stat         = so_stat
      ih_taxable      = so_taxable
      ih_taxc         = so_taxc
      ih_tax_date     = tax_date
      ih_tax_env      = so_tax_env
      ih_tax_pct[1]   = so_tax_pct[1]
      ih_tax_pct[2]   = so_tax_pct[2]
      ih_tax_pct[3]   = so_tax_pct[3]
      ih_tax_usage    = so_tax_usage
      ih_to_inv       = so_to_inv
      ih_trl1_amt     = so_trl1_amt
      ih_trl1_cd      = so_trl1_cd
      ih_trl2_amt     = so_trl2_amt
      ih_trl2_cd      = so_trl2_cd
      ih_trl3_amt     = so_trl3_amt
      ih_trl3_cd      = so_trl3_cd
      ih_type         = so_type
      ih_user1        = so_user1
      ih_user2        = so_user2
      ih_userid       = so_userid
      ih_weight       = so_weight
      ih_weight_um    = so_weight_um
      ih_xcomm_pct[1] = so_xcomm_pct[1]
      ih_xcomm_pct[2] = so_xcomm_pct[2]
      ih_xslspsn[1]   = so_xslspsn[1]
      ih_xslspsn[2]   = so_xslspsn[2]
      ih__chr01       = so__chr01
      ih__chr02       = so__chr02
      ih__chr03       = so__chr03
      ih__chr04       = so__chr04
      ih__chr05       = so__chr05
      ih__chr06       = so__chr06
      ih__chr07       = so__chr07
      ih__chr08       = so__chr08
      ih__chr09       = so__chr09
      ih__chr10       = so__chr10
      ih__dec01       = so__dec01
      ih__dec02       = so__dec02
      ih__dte01       = so__dte01
      ih__dte02       = so__dte02
      ih__log01       = so__log01
      ih__qad01       = so__qad01
      ih__qad02       = so__qad02
      ih__qad03       = so__qad03
      ih__qad04       = so__qad04
      ih__qad05[1]    = so__qad05[1]
      ih__qad05[2]    = so__qad05[2]
      ih_custref_val  = so_custref_val
      ih_daybookset   = so_daybookset
      ih_daybook      = daybook
      ih_trl_amt      = rnd_amt
      ih_batch        = batch
      ih_mgmt_ex_rate  = p_mgmt_ex_rate 
      ih_mgmt_ex_rate2 = p_mgmt_ex_rate2
      recno           = recid(ih_hist)
      ih_mod_date     = today
      ih_eff_date     = eff_date.
 
   for first soc_ctrl where soc_domain = global_domain
   no-lock: end.
 
   run getCurrentInvoiceDetails in hQADFinInvPostLib
      (input so_inv_nbr,
       input so_nbr,
       output ih_invoicetype,
       output ih_invoicetotal).
 
   if ih_inv_date = ? then
      ih_inv_date = eff_date.
 
   if ih_tax_date = ? then
      ih_tax_date = ih_inv_date.
  
   run fireOutboundEvent (input '{&QXO-EVENT}',
                          input '{&QXO-TABLE}',
                          input rowid(ih_hist),
                          input ih_hist.oid_ih_hist,
                          input 'WRITE').
                          
   proc-parent = "".                          
 
   /* Global Shipping */
   for each abs_mstr where abs_domain  = global_domain
      and   abs_inv_nbr = ih_inv_nbr
      and   abs_par_id <> ""
   no-lock:
      
      if index(proc-parent,abs_par_id) <> 0 then
      next.      
 
      for each lgd_mstr where lgd_domain = global_domain
         and   lgd_shipper_id = abs_par_id
         and   lgd_type = yes
      exclusive-lock:
         assign
            lgd_posted   = Yes
            lgd_inv_date = ih_inv_date.
 
         if lgd_status = {&LD_CANCELLED} then do:
            /* Update cancelled invoice number for the
             * latest cancellation only */
            if lgd_cancel_inv = "" then
               lgd_cancel_inv = ih_inv_nbr.
         end.
         else if lgd_ar_amt <> 0 then 
	      do:	
            lgd_inv_nbr = ih_inv_nbr.
         end.
      end.
      
      if proc-parent = "" then  
         proc-parent = abs_par_id.    
      else
         proc-parent = proc-parent + "," + abs_par_id.      
   end.
 
END PROCEDURE.
 
 
PROCEDURE save_selfbill_info:
/*****************************************************************
/* New procedure added. The reason for making an internal procedure is
 * to hide the "gory" details of gprunmo from the main code. When
 * self-billing becomes std product the invocation of internal proc
 * can be replaced with invocation to the external proc */
*****************************************************************/
   define input parameter transtype    as   character no-undo.
   define input parameter invnbr       like ar_nbr    no-undo.
   define input parameter sonbr        like so_nbr    no-undo.
   define input parameter amt          like ar_amt    no-undo.
 
   {us/gp/gprunmo.i &module = "ASB" &program = "arsixcr2.p"
              &param  = """(input  transtype,
                            input  invnbr,
                            input  sonbr,
                            input  amt)"""}
 
END PROCEDURE.
 
PROCEDURE mark-as-posted:
   define input parameter inpar_nbr4    like so_nbr     no-undo.
   define input parameter inpar_inv_nbr like so_inv_nbr no-undo.
   define buffer qad_wkfl for qad_wkfl.
 
   if can-find(mfc_ctrl
      where mfc_domain = global_domain
      and   mfc_module = "SO"
      and   mfc_seq    = 170)
   then do:
 
      for each qad_wkfl
         where qad_domain = global_domain
         and   qad_key1   = inpar_nbr4
         and   r-index(qad_key2,"utsoship") > 0
         and   qad_key3   = inpar_inv_nbr
      exclusive-lock:
         qad_charfld[4] = "posted".
      end.
 
   end. /* multiple bol print is turned on.  */
 
END PROCEDURE.
 
PROCEDURE del-cmt-det:
   define input parameter inpar_indx like so_cmtindx no-undo.
 
   {us/px/pxrun.i &PROC  = 'deleteAllTransactionComments' &PROGRAM = 'gpcmxr.p'
                  &HANDLE=ph_gpcmxr
                  &PARAM="(inpar_indx)"
                  &NOAPPERROR=True
                  &CATCHERROR=True}
 
END PROCEDURE.
 
PROCEDURE del-sct-det:
   define input parameter inpar_part  like sod_part no-undo.
   define input parameter inpar_nbr1  like sod_nbr  no-undo.
   define input parameter inpar_line1 like sod_line no-undo.
 
   define variable var_sim            like sct_sim  no-undo.
 
   var_sim  = string(inpar_nbr1) + "." + string(inpar_line1).
 
   for each sct_det where sct_domain = global_domain
      and   sct_part   = inpar_part
      and   sct_sim    = var_sim
   exclusive-lock:
      delete sct_det.
   end.
 
END PROCEDURE.
 
PROCEDURE del-pih-hist:
   define input parameter inpar_nbr2  like sod_nbr  no-undo.
   define input parameter inpar_line2 like sod_line no-undo.
 
   for each pih_hist
      where pih_domain   = global_domain
      and   pih_doc_type = 1
      and   pih_nbr      = inpar_nbr2
      and   pih_line     = inpar_line2
   exclusive-lock:
      delete pih_hist.
   end.
 
END PROCEDURE.
 
PROCEDURE del-tx2d-det:
   define input parameter inpar_nbr3 like so_nbr   no-undo.
   define input parameter l_quote    like so_quote no-undo.
 
   define variable l_par_recid       as   recid    no-undo.
   define variable l_ref             like tx2d_ref no-undo.
 
   define buffer   b_abs_mstr  for  abs_mstr.
 
      /* ENSURE THAT ALL THE TAX RECORDS FOR SALES ORDER      */
      /* RELEASED FROM SALES QUOTE ARE CORRECTLY DELETED      */
      for each tx2d_det where tx2d_domain = global_domain
         and ( tx2d_ref     = inpar_nbr3
         and ( tx2d_nbr = ""   or  tx2d_nbr = l_quote)
         and ( tx2d_tr_type = "38"
         or    tx2d_tr_type = "36"
         or    tx2d_tr_type = "11") )
      exclusive-lock:
         delete tx2d_det.
      end.
 
      /* OBTAINING SHIPPERS AGAINST THE SALES ORDER  */
      for each abs_mstr where abs_domain = global_domain
         and   abs_order  = inpar_nbr3
      no-lock:
 
         /* FIND TOP LEVEL SHIPPER */
         {us/bbi/gprun.i ""gpabspar.p""
                  "(input  recid(abs_mstr),
                    input  'S',
                    input  false,
                    output l_par_recid)" }
 
         if l_par_recid <> ? then do:
 
            for first b_abs_mstr where recid(b_abs_mstr) = l_par_recid
            no-lock: end.
 
            if available b_abs_mstr then do:
               l_ref = string(b_abs_mstr.abs_shipfrom, "x(8)") +
                       b_abs_mstr.abs_id.
 
               {us/bbi/gprun.i ""txdelete.p""
                        "(input '14',
                          input l_ref,
                          input inpar_nbr3 )"}
            end.
 
         end. /* IF L_PAR_RECID <> ? */
 
      end. /* FOR EACH ABS_MSTR */
 
END PROCEDURE.
   
PROCEDURE del-btb-det:
   /* -----------------------------------------------------------
    * Purpose:     Delete BTB Recordsin internal procedure to overcome
    *              action segment error.
    * -------------------------------------------------------------*/
 
   for each btb_det
       where btb_domain   = global_domain
       and   btb_so       = sod_det.sod_nbr
       and   btb_sod_line = sod_det.sod_line
   exclusive-lock:
      delete btb_det.
   end.
 
END PROCEDURE. /* del-btb-det */
 
PROCEDURE p-self-bill-control:
   /* -----------------------------------------------------------
    * Purpose:     AR Self-Billing internal procedure to overcome
    *              action segment error.
    * Parameters:
    *   p-so-nbr  = so_nbr     Sales Order Number
    *   p-so-inv  = so_inv_nbr Invoice Number
    *   p-so-bill = so_bill   Bill To
    * Notes:
    * -------------------------------------------------------------*/
   define input parameter p-so-nbr  like so_mstr.so_nbr     no-undo.
   define input parameter p-so-inv  like so_mstr.so_inv_nbr no-undo.
   define input parameter p-so-bill like so_mstr.so_bill    no-undo.
   define variable using_self_billing as logical no-undo.

   {us/bbi/gprun.i ""gpmfc01.p""
      "(input 'enable_self_bill',
        input '',
        input 'ADG',
        input '',
        output using_self_billing)"}
 
   if using_self_billing
   then do:
 
      {us/gp/gprunmo.i &module = "ASB" &program = "arsixup.p"
                 &param  = """(input  p-so-nbr,
                               input  p-so-inv,
                               output return_status,
                               output create_tax_trailer_line)"""}
 
   end. /* END OF IF using_self_billing  */
 
   /* CHECK WHETHER SELF-BILLING INFO IS TO BE CAPTURED */
   /* THE CONDITION OF create_tax_trailer_line IS PUT   */
   /* BECAUSE IN SELF-BILLING CROSS REFERENCE RECORDS (Six_ref) */
   /* FOR SHIPMENT LINES ARE NOT CAPTURED WHEN SHIPMENT IS DONE */
   /* FOR POSTING OF SO SHIPMENTS (sosois.p). SO WE DO NOT WANT */
   /* TO CAPTURE THE TAX / TRAILER INFORMATION WHEN SHIPMENTS   */
   /* ARE DONE USING DISCRETE SHIPMENTS */
 
   assign
      save_sbinfo = using_self_billing
         and can-find(first cm_mstr
         where cm_domain = global_domain
         and   cm_addr   = p-so-bill
         and   cm__qad06 = yes)
         and   create_tax_trailer_line = yes
      so_db = global_db.
 
      {us/px/pxrun.i &PROC = 'setDatabase'
         &PROGRAM='pasldel.p'
         &HANDLE = ph_pasldel
         &PARAM = "(input so_db)"
         &NOAPPERROR = true
         &CATCHERROR = true}

   if save_sbinfo then do:
      if disc_amt <> 0 then
         run save_selfbill_info
            (input "D",
             input p-so-inv,
             input p-so-nbr,
             input disc_amt).
   end.
 
END PROCEDURE.
 
/* Delete tx2d_line record */
PROCEDURE del_tx2d_13:
 
   define input parameter sonbr like so_nbr.
 
   for each tx2d_det
      where tx2d_domain  = global_domain
      and   tx2d_ref     = sonbr
      and   tx2d_nbr     = ""
      and   tx2d_tr_type = "13"
   exclusive-lock:
      delete tx2d_det.
   end.
 
END PROCEDURE.
 
/* DELETE TAX LINES, CREATED ACCORDING TO TAX-BY-LINE FLAG */
PROCEDURE del_tx2d_line13:
   define input parameter soinvnbr like so_inv_nbr   no-undo.
   define input parameter sodnbr   like sod_nbr      no-undo.
   define input parameter sodline  like sod_line     no-undo.
   define input parameter trtype   like tx2d_tr_type no-undo.
 
   /* CHECK tx2d_line = sod_line FOR TAX-BY-LINE = YES */
   /* ON POSTING OF INVOICE ALL THE 13 TYPE OF RECORDS FOR THE SALES ORDER   */
   /* SHOULD BE DELETED AS IN CONSOLIDATION THE tx2d_nbr WILL CONTAIN        */
   /* "CONSOL" INSTEAD OF SALES ORDER NO.                                    */
   if can-find (first tx2d_det
      where tx2d_domain  = global_domain
      and   tx2d_ref     = soinvnbr
      and   tx2d_nbr     <> ""
      and   tx2d_line    <> 0
      and   tx2d_tr_type = trtype)
   then
      run del_tx2d_13
         (input sodnbr).
 
   /* CHECK tx2d_line = 0 FOR TAX-BY-LINE = NO         */
   else
      if can-find (first tx2d_det
         where tx2d_domain  = global_domain
         and   tx2d_ref     = soinvnbr
         and   tx2d_nbr     <> ""
         and   tx2d_line    = 0
         and   tx2d_tr_type = trtype)
      then do:
         {us/bbi/gprun.i ""txdelete.p""
                  "(input '13',
                    input sodnbr,
                    input '')"}
      end.
 
END PROCEDURE.
 
PROCEDURE deleteCreditCardDetails:
/* -----------------------------------------------------------
 * Purpose:     Logic for deleting creditcard details from the
 *              qad_wkfl table when salesorder line is deleted.
 * Parameters:  so_nbr, sod_line
 * -------------------------------------------------------------*/
   define input parameter orderNumber like sod_nbr.
   define input parameter orderLine   like sod_line.
 
   for first qad_wkfl where qad_domain = global_domain
      and qad_key1 = string(orderNumber, "x(8)") + string(orderLine, "999")
      and qad_key2 = "CreditCard"
   exclusive-lock:
 
      /* MUST UPDATE so_prepaid IF A qad_wkfl * STILL EXISTS */
      for first so_mstr where so_domain = global_domain
         and so_nbr = orderNumber
      exclusive-lock:
         so_prepaid = so_prepaid - qad_decfld[1].
      end.
 
      delete qad_wkfl.
 
   end.
 
END PROCEDURE.
 
/* INTERNAL PROCEDURE TO CREATE AND DELETE INTRASTAT MASTER/DETAIL */
{us/ie/ieintr.i}
