/* rcsois1a.p - Customer Schedules - Confirm Shipper Invoicing Sub-Program    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrcso1a.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 7.4      LAST MODIFIED: 12/19/94   BY: bcm *H09G*                */
/* REVISION: 7.4      LAST MODIFIED: 12/21/94   BY: jxz *GO77*                */
/* REVISION: 7.3      LAST MODIFIED: 01/26/95   BY: WUG *G0BY*                */
/* REVISION: 7.4      LAST MODIFIED: 03/20/95   BY: bcm *G0HR*                */
/* REVISION: 7.4      LAST MODIFIED: 03/23/95   BY: jxz *F0M3*                */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.4      LAST MODIFIED: 04/18/95   BY: srk *H0DD*                */
/* REVISION: 7.4      LAST MODIFIED: 08/01/95   BY: vrn *G0T8*                */
/* REVISION: 7.4      LAST MODIFIED: 09/09/95   BY: vrn *H0FT*                */
/* REVISION: 7.4      LAST MODIFIED: 09/25/95   BY: vrn *H0G2*                */
/* REVISION: 7.4      LAST MODIFIED: 12/15/95   BY: rwl *F0WR*                */
/* REVISION: 7.4      LAST MODIFIED: 01/24/96   BY: vrn *H0JD*                */
/* REVISION: 8.5      LAST MODIFIED: 08/01/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 05/28/96   BY: pfh *G1WD*                */
/* REVISION: 8.5      LAST MODIFIED: 07/22/96   BY: *J0Y3* Robert Wachowicz   */
/* REVISION: 8.6      LAST MODIFIED: 08/09/96   BY: *K003* Vinay Nayak-Sujir  */
/* REVISION: 8.5      LAST MODIFIED: 08/16/96   BY: *H0MD* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 09/20/96   BY: TSI *K005*                */
/* REVISION: 8.6      LAST MODIFIED: 10/17/96   BY: *K003* Forrest mori       */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Kurt De Wit        */
/* REVISION: 8.6      LAST MODIFIED: 12/06/96   BY: *K030* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 02/28/97   BY: *H0S3* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 06/13/97   BY: *J1T4* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 09/20/97   BY: *H1F5* Niranjan Ranka     */
/* REVISION: 8.6      LAST MODIFIED: 10/22/97   BY: *H1G6* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 11/16/97   BY: *K18W* Taek-Soo Chang     */
/* REVISION: 8.6      LAST MODIFIED: 12/13/97   BY: *J20Q* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 12/30/97   BY: *J27M* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 11/24/97   BY: *K15N* Jim Williams       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 03/07/98   BY: *K1J8* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 03/20/98   BY: *J2F2* Samir Bavkar       */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* REVISION: 8.6E     LAST MODIFIED: 06/01/98   BY: *K1NF* Niranjan Ranka     */
/* REVISION: 8.6E     LAST MODIFIED: 06/08/98   BY: *J2MH* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 24 JUN 98  BY: *L00X* Ed van de Gevel    */
/* REVISION: 8.6E     LAST MODIFIED: 07/15/98   BY: *L024* Bill Reckard       */
/* REVISION: 8.6E     LAST MODIFIED: 08/18/98   BY: *K1DQ* Suresh Nayak       */
/* REVISION: 8.6E     LAST MODIFIED: 09/10/98   BY: *J2ZD* Surekha Joshi      */
/* REVISION: 8.6E     LAST MODIFIED: 09/17/98   BY: *J29B* Ajit Deodhar       */
/* REVISION: 8.6E     LAST MODIFIED: 10/23/98   BY: *L0CD* Steve Goeke        */
/* REVISION: 8.6E     LAST MODIFIED: 12/14/98   BY: *L0CV* Steve Goeke        */
/* REVISION: 8.6E     LAST MODIFIED: 04/08/99   BY: *J3D8* Ranjit Jain        */
/* REVISION: 9.0      LAST MODIFIED: 04/14/99   BY: *J3BM* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 07/09/99   BY: *J3HZ* Poonam Bahl        */
/* REVISION: 9.0      LAST MODIFIED: 07/27/99   BY: *K21K* Jose Alex          */
/* REVISION: 9.0      LAST MODIFIED: 08/12/99   BY: *J3KJ* Bengt Johansson    */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Vijaya Pakala      */
/* REVISION: 9.1      LAST MODIFIED: 10/20/99   BY: *N04X* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 10/29/99   BY: *N04P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 11/23/99   BY: *L0LS* Manish Kulkarni    */
/* REVISION: 9.1      LAST MODIFIED: 01/11/00   BY: *J3N7* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 03/28/00   BY: *K25V* Surekha Joshi      */
/* REVISION: 9.1      LAST MODIFIED: 04/24/00   BY: *L0PR* Kedar Deherkar     */
/* REVISION: 9.1      LAST MODIFIED: 06/30/00   BY: *L10R* Kaustubh Kulkarni  */
/* REVISION: 9.1      LAST MODIFIED: 07/20/00   BY: *N0B5* Vinay Nayak-Sujir  */
/* REVISION: 9.1      LAST MODIFIED: 07/28/00   BY: *L0QV* Manish Kulkarni    */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 10/04/00   BY: *L0TS* Manish Kulkarni    */
/* REVISION: 9.1      LAST MODIFIED: 12/20/00   BY: *L155* Abhijeet Thakur    */
/* REVISION: 9.1      LAST MODIFIED: 10/18/00   BY: *N0WD* BalbeerS Rajput    */
/* REVISION: 9.1      LAST MODIFIED: 02/13/01   BY: *N0WV* Sandeep Parab      */
/* Revision: 1.76     BY: Jean Miller              DATE: 03/22/01 ECO: *P008* */
/* Revision: 1.76     BY: Rajaneesh Sarangi        DATE: 06/29/01 ECO: *M1CP* */
/* Revision: 1.78     BY: Dan Herman               DATE: 07/09/01 ECO: *P007* */
/* Revision: 1.79     BY: Niranjan Ranka           DATE: 07/23/01 ECO: *P00L* */
/* Revision: 1.80     BY: Kaustubh Kulkarni        DATE: 08/30/01 ECO: *M13W* */
/* Revision: 1.81     BY: Steve Nugent             DATE: 10/15/01 ECO: *P004* */
/* Revision: 1.82     BY: Rajiv Ramaiah            DATE: 10/31/01 ECO: *M1LM* */
/* Revision: 1.85     BY: Ashwini Ghaisas          DATE: 12/15/01 ECO: *M1LD* */
/* Revision: 1.87     BY: Hareesh V.               DATE: 02/04/02 ECO: *M1S2* */
/* Revision: 1.88     BY: Patrick Rowan            DATE: 04/24/01 ECO: *P00G* */
/* Revision: 1.89     BY: Mercy C.                 DATE: 04/02/02 ECO: *N1D2* */
/* Revision: 1.90     BY: Robin McCarthy           DATE: 04/05/02 ECO: *P000* */
/* Revision: 1.91     BY: Sandeep Parab            DATE: 06/04/02 ECO: *M1XH* */
/* Revision: 1.92     BY: Ed van de Gevel          DATE: 07/04/02 ECO: *P0B4* */
/* Revision: 1.93     BY: Manisha Sawant           DATE: 09/23/02 ECO: *N1QH* */
/* Revision: 1.96     BY: Ashish Maheshwari        DATE: 11/25/02 ECO: *N20H* */
/* Revision: 1.97     BY: Dorota Hohol             DATE: 03/14/03 ECO: *P0N6* */
/* Revision: 1.98     BY: Seema Tyagi              DATE: 03/25/03 ECO: *N29M* */
/* Revision: 1.99     BY: Seema Tyagi              DATE: 03/28/03 ECO: *N2BB* */
/* Revision: 1.100    BY: Rajaneesh Sarangi        DATE: 05/14/03 ECO: *N2FH* */
/* Revision: 1.102    BY: Paul Donnelly (SB)       DATE: 06/28/03 ECO: *Q00K* */
/* Revision: 1.103    BY: Rajinder Kamra           DATE: 05/05/03 ECO: *Q003* */
/* Revision: 1.105    BY: Rajinder Kamra           DATE: 07/16/03 ECO: *Q013* */
/* Revision: 1.108    BY: Subramanian Iyer         DATE: 09/23/03 ECO: *P12N* */
/* Revision: 1.109    BY: Orawan Songmoungsuk      DATE: 10/08/03 ECO: *P14K* */
/* Revision: 1.110    BY: Veena Lad                DATE: 10/28/03 ECO: *P17K* */
/* Revision: 1.112    BY: Kirti Desai              DATE: 11/12/03 ECO: *P195* */
/* Revision: 1.113    BY: Ed van de Gevel          DATE: 12/02/03 ECO: *P1BX* */
/* Revision: 1.114    BY: Karan Motwani            DATE: 01/13/04 ECO: *P1HP* */
/* Revision: 1.115    BY: Vinay Soman              DATE: 01/23/04 ECO: *P1JP* */
/* Revision: 1.116    BY: Vinay Soman              DATE: 01/30/04 ECO: *P1LR* */
/* Revision: 1.117    BY: Salil Pradhan            DATE: 03/09/04 ECO: *P1GM* */
/* Revision: 1.118    BY: Vinay Soman              DATE: 03/18/04 ECO: *P1TW* */
/* Revision: 1.119    BY: Vinay Soman              DATE: 04/12/04 ECO: *P1WK* */
/* Revision: 1.120    BY: Robin McCarthy           DATE: 04/19/04 ECO: *P15V* */
/* Revision: 1.121    BY: Prashant Parab           DATE: 05/21/04 ECO: *Q07X* */
/* Revision: 1.122    BY: Sunil Fegade             DATE: 06/25/04 ECO: *P27K* */
/* Revision: 1.123    BY: Shivganesh Hegde         DATE: 08/03/04 ECO: *P26L* */
/* Revision: 1.124    BY: Jean Miller              DATE: 09/02/04 ECO: *Q0CP* */
/* Revision: 1.125    BY: Manish Dani              DATE: 10/28/04 ECO: *P2RT* */
/* Revision: 1.126    BY: Reena Ambavi             DATE: 11/15/04 ECO: *P2T1* */
/* Revision: 1.127    BY: Jignesh Rachh            DATE: 12/01/04 ECO: *P2XJ* */
/* Revision: 1.128    BY: Binoy John               DATE: 01/27/05 ECO: *P35M* */
/* Revision: 1.129    BY: Ed van de Gevel          DATE: 03/07/05 ECO: *R00G* */
/* Revision: 1.131    BY: Ed van de Gevel          DATE: 03/07/05 ECO: *R00K* */
/* Revision: 1.132    BY: Preeti Sattur            DATE: 03/17/05 ECO: *P3CL* */
/* Revision: 1.133    BY: Preeti Sattur            DATE: 03/28/05 ECO: *P3DD* */
/* Revision: 1.134    BY: Somesh Jeswani           DATE: 03/29/05 ECO: *Q0HJ* */
/* Revision: 1.135    BY: Jignesh Rachh            DATE: 03/30/05 ECO: *P3DG* */
/* Revision: 1.136    BY: Shivganesh Hegde         DATE: 06/28/05 ECO: *P3LK* */
/* Revision: 1.137    BY: Priya Idnani             DATE: 07/05/05 ECO: *P3N3* */
/* Revision: 1.138    BY: Jignesh Rachh            DATE: 08/02/05 ECO: *P3V0* */
/* Revision: 1.139    BY: Jignesh Rachh            DATE: 08/26/05 ECO: *P3Z2* */
/* Revision: 1.141    BY: Robin McCarthy           DATE: 10/03/05 ECO: *R027* */
/* Revision: 1.142    BY: Munira Savai             DATE: 12/01/05 ECO: *Q0N2* */
/* Revision: 1.143    BY: Jean Miller              DATE: 02/20/06 ECO: *Q0R5* */
/* Revision: 1.144    BY: Dan Herman               DATE: 03/21/06 ECO: *R001* */
/* Revision: 1.145    BY: Paul Dreslinski          DATE: 06/08/06 ECO: *Q0LK* */
/* Revision: 1.146    BY: Samit Patil              DATE: 07/26/06 ECO: *P4XT* */
/* Revision: 1.148    BY: Vaibhav Desai            DATE: 08/21/06 ECO: *P51V* */
/* Revision: 1.149    BY: Priya Idnani             DATE: 11/20/06 ECO: *P5FZ* */
/* Revision: 1.150    BY: Katie Hilbert            DATE: 07/17/07 ECO: *R0C6* */
/* Revision: 1.151    BY: Jean Miller              DATE: 11/05/07 ECO: *P602* */
/* Revision: 1.152    BY: Prajakta Patil           DATE: 12/24/07 ECO: *P69D* */
/* Revision: 1.153    BY: Abhijit Gupta            DATE: 01/10/08 ECO: *P6JC* */
/* Revision: 1.154    BY: Jean Miller              DATE: 02/20/08 ECO: *P5TS* */
/* Revision: 1.159    BY: Jean Miller              DATE: 02/20/08 ECO: *P5KF* */
/* Revision: 1.160    BY: Neil Curzon              DATE: 03/17/08 ECO: *R0P6* */
/* Revision: 1.161    BY: Vivek Kamath             DATE: 04/22/08 ECO: *P4LG* */
/* Revision: 1.162    BY: Jean Miller              DATE: 05/22/08 ECO: *R0TK* */
/* Revision: 1.163    BY: Jean Miller              DATE: 06/18/08 ECO: *R0V9* */
/* Revision: 1.165    BY: Jean Miller              DATE: 06/23/08 ECO: *P6G5* */
/* Revision: 1.168    BY: Archana Kirtane          DATE: 07/02/08 ECO: *P6WV* */
/* Revision: 1.169    BY: Deirdre O'Brien          DATE: 10/31/08 ECO: *R16Q* */
/* Revision: 1.172    BY: Neil Curzon              DATE: 02/26/09 ECO: *R1CZ* */
/* Revision: 1.176    BY: Jiang Wan                DATE: 03/03/09 ECO: *R1BY* */
/* Revision: 1.178    BY: Prajakta Patil           DATE: 04/22/09 ECO: *Q1T4* */
/* Revision: 1.179    BY: Yizhou Mao               DATE: 08/03/09 ECO: *R1N2* */
/* Revision: 1.183    BY: Jean Miller              DATE: 11/23/09 ECO: *R1TV* */
/* Revision: 1.184    BY: Katie Hilbert            DATE: 02/04/10 ECO: *R1XQ* */
/* Revision: 1.185    BY: Trupti Khairnar          DATE: 02/17/10 ECO: *Q3VG* */
/* Revision: 1.186    BY: Katie Hilbert            DATE: 02/20/10 ECO: *R1YB* */
/* Revision: 1.187    BY: Katie Hilbert            DATE: 06/25/10 ECO: *R21M* */
/* Revision: 1.188    BY: Deirdre O'Brien          DATE: 07/09/10 ECO: *R21V* */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* ALL CHANGES MADE TO THIS PROGRAM SHOULD BE MADE TO rcsois2a.p AS WELL*/
{us/bbi/mfdeclre.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i gpumxr}
{us/gp/gpuid.i}
{us/bbi/gplabel.i}
{us/mf/mfsprtdf.i}
{us/fs/fsdeclr.i}

 define temp-table temp_somstr
   field temp_so_nbr like so_nbr
   field temp_so_inv_nbr like so_inv_nbr
   field temp_so_inv_date like so_inv_date
index temp_so_nbr temp_so_nbr ascending.

/* PARAMETERS */
define input  parameter calling_function         as   character      no-undo.
define input  parameter consignment              as   logical        no-undo.
define input  parameter trade_sale               as   logical        no-undo.
define input  parameter send_ts_asn              as   logical        no-undo.
define output parameter o_undo                   like mfc_logical    no-undo 
                                                 initial true.
define input-output parameter table              for  temp_somstr.
define input-output parameter temp_so_ship       like so_ship        no-undo.
define input-output parameter temp_so_qadc01     like so__qadc01     no-undo.
define input-output parameter temp_fob           like so_fob extent 30.
define input-output parameter temp_shipvia       like so_shipvia extent 30.
define input-output parameter temp_fob_list      as   character      no-undo.
define input-output parameter temp_shipvia_list  as   character      no-undo.
define input-output parameter l_traddr           like tr_addr.
define input-output parameter l_qty_iss_rcv      like tr_qty_loc.
 
/* SHARED VARIABLES */
define new shared variable traddr      like tr_addr.
define new shared temp-table IntraStat field  StatID as recid.
define new shared variable qty_iss_rcv like tr_qty_loc.

define shared variable abs_carr_ref   as character.
define shared variable abs_fob        like so_fob.
define shared variable abs_recid      as recid.
define shared variable abs_shipvia    like so_shipvia.
define shared variable auto_post      like mfc_logical label "Post Invoice".
define shared variable change_db      like mfc_logical.
define shared variable eff_date       like glt_effdate label  "Effective".
define shared variable exch_rate      like exr_rate.
define shared variable exch_rate2     like exr_rate2.
define shared variable exch_ratetype  like exr_ratetype.
define shared variable ext_price      as decimal label "Ext Price"
                                      decimals 2 format "->>>>,>>>,>>9.99".
define shared variable order_nbrs     as character extent 30.
define shared variable order_nbr_list as character no-undo.
define shared variable order_ct       as integer.
define shared variable part           as character format "x(18)".
define shared variable que-doc        as logical.
define shared variable qty_all        like sod_qty_all.
define shared variable qty_pick       like sod_qty_pick.
define shared variable qty_bo         like sod_bo_chg.
define shared variable qty_cum_ship   like sod_qty_ship.
define shared variable qty_chg        like sod_qty_chg.
define shared variable qty_inv        like sod_qty_inv.
define shared variable qty_ord        like sod_qty_ord.
define shared variable qty_req        like in_qty_req.
define shared variable qty_ship       like sod_qty_ship.
define shared variable ship_db        like global_db.
define shared variable ship_dt        like so_ship_date.
define shared variable ship_line      like sod_line.
define shared variable ship_so        like so_nbr.
define shared variable so_db          like global_db.
define shared variable sod_entity     like en_entity.
define shared variable sod_recno      as recid.
define shared variable std_cost       like sod_std_cost.
define shared variable confirm_mode   like mfc_logical no-undo.
define shared variable rejected       like mfc_logical no-undo.
define shared variable auto_inv       like mfc_logical.
define shared variable l_undo         like mfc_logical no-undo.
define shared variable l_unconfm_shp  like mfc_logical  no-undo.
define shared variable l_multi_ln_item like mfc_logical  no-undo.
define shared variable l_abs_id        like abs_mstr.abs_id no-undo.
define shared variable ordernbr        like tr_nbr.

/* LOCAL VARIABLES */
define variable doc-type            as character.
define variable doc-ref             as character.
define variable add-ref             as character.
define variable msg-type            as character.
define variable trq-id              like trq_id.
define variable i                   as integer             no-undo.
define variable order_num           as character           no-undo.
define variable err_flag            as integer             no-undo.
define variable l_abs_pick_qty      like sod_qty_pick      no-undo.
define variable return_status       as   integer           no-undo.
define variable l_shipto            like abs_shipto        no-undo.
define variable undo_stat           like mfc_logical       no-undo.
define variable tmp_issueqty        like abs_qty           no-undo.
define variable tmp_shipqty         like abs_qty           no-undo.
define variable tmp_pickqty         like abs_qty          no-undo.
define variable sum_tr_item         like mfc_logical       no-undo.
define variable sum_tr_cont         like mfc_logical       no-undo.
define variable l_absid             like abs_id            no-undo.
define variable prev_qty_all        like sod_qty_all       no-undo.
define variable l_multi_ln_shpr     like mfc_logical       no-undo.
define variable l_save_db           like global_db         no-undo.
define variable l_err-flag          as   integer           no-undo.
define variable l_accum_shpqty      as   decimal           no-undo.
define variable l_umconv            like sod_um_conv       no-undo.
define variable l_um                like sod_um            no-undo.
define variable using_shipment_perf like mfc_logical       no-undo.
define variable vUsingSelfBilling   as logical             no-undo.
define variable perf_ship_qty       like sod_qty_ship      no-undo.
define variable total_sp_qty        like sod_qty_ship      no-undo.
define variable shipperid           like abs_id            no-undo.
define variable l_remote-base-curr  like gl_base_curr      no-undo.
define variable l_exch-rate         like exr_rate          no-undo.
define variable l_exch-rate2        like exr_rate2         no-undo.
define variable l_is_DOM            like mfc_logical       no-undo.
define variable fromEDI             as logical initial no  no-undo.
define variable level               as integer initial 1   no-undo.
define variable l_tran_type         like tr_type           no-undo.
define variable l_Value             as character           no-undo.
define variable l_Found             as logical             no-undo.

{us/px/pxphdef.i edgetpv}
 
{us/rc/rcsois.i}
 
/* CONSIGNMENT VARIABLES */
{us/so/socnvars.i}
using_cust_consignment = consignment.
 
/* DEFINE BUFFERS */
define buffer abs_work for abs_mstr.
define buffer abs_comp for abs_mstr.
define buffer abs_line for abs_mstr.
define buffer pt_line for pt_mstr.
define buffer seoc_buf for seoc_ctrl.
 
/* USE OF abs_mstr BUFFERS                                          */
/*  abs_mstr buffer for pre-shipper/shipper header                  */
/*  abs_work buffer for containers/items nested within a shipper    */
/*  abs_comp buffer to check for kit components within an item      */
 
/* DEFINE WORKFILE DEFINITIONS */
define shared workfile work_sr_wkfl like sr_wkfl.
 
{us/rc/rcwabsdf.i}
define buffer work_abs_buff for work_abs_mstr.
 
/* THE TEMP-TABLE WORK_TRNBR STORES THE VALUES OF FIRST AND LAST  */
/* TRANSACTION NUMBER WHICH IS USED WHEN INVOICE IS POSTED VIA    */
/* SHIPPER CONFIRM, FOR ASSIGNING THE TR_RMRKS AND TR_GL_DATE     */
/* FIELDS. PREVIOUSLY, THIS WAS BEING DONE IN RCSOISB1.P PRIOR TO */
/* INVOICE POST.                                                  */
 
define shared temp-table work_trnbr no-undo
   field work_sod_nbr  like sod_nbr
   field work_sod_line like sod_line
   field work_tr_recid  like tr_trnbr
index work_sod_nbr work_sod_nbr ascending.
 
/* SHARED TEMP-TABLE TO COMPUTE THE QUANTITY IN rcinvchk.p */
/* TO CHECK AGAINST THE INVENTORY AVAILABLE FOR THAT ITEM  */
define shared temp-table compute_ldd               no-undo
   field compute_site   like work_abs_mstr.abs_site
   field compute_loc    like work_abs_mstr.abs_loc
   field compute_lot    like work_abs_mstr.abs_lotser
   field compute_item   like work_abs_mstr.abs_item
   field compute_ref    like work_abs_mstr.abs_ref
   field compute_qty    like work_abs_mstr.abs_qty
   field compute_lineid like work_abs_mstr.abs_id
   index compute_index compute_site compute_item
         compute_loc   compute_lot  compute_ref.

define shared temp-table work_ldd no-undo
   field work_ldd_id  like abs_mstr.abs_id
   index work_ldd_id  work_ldd_id.

empty temp-table compute_ldd no-error.

/* Euro Tool Kit definitions */
{us/et/etvar.i}
{us/et/etdcrvar.i}
{us/et/etrpvar.i}
{us/so/soivtot1.i}  /* Define variables for invoice totals. */
 
{us/so/socurvar.i}
 
{us/gp/gpglefdf.i}
{us/gp/gpcmf.i}
 
/* DETERMINE IF SHIPMENT PERFORMANCE IS INSTALLED */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'enable_shipment_perf',
     input '',
     input 'ADG',
     input '',
     output using_shipment_perf)"}
 
{us/cc/cclc.i} /* CHECK FOR ENABLEMENT OF CONTAINER AND LINE CHARGES */

/* Determine if Self-Billing is installed and active */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'enable_self_bill',
     input 2,
     input 'ADG',
     input 'sbic_ctl',
     output vUsingSelfBilling)"}

l_multi_ln_shpr = no.

for first soc_ctrl where soc_domain = global_domain
no-lock: end.
 
run p_init_proc (output sum_tr_item,
                 output sum_tr_cont).
 
if calling_function = "po_shipper_confirm"
then
   assign
      auto_inv     = no
      auto_post    = no
      confirm_mode = yes.
 
for first abs_mstr where recid(abs_mstr) = abs_recid
no-lock: end.
 
l_shipto = abs_shipto.
 
{us/bbi/gprun.i ""socrshc.p""}
 
find first shc_ctrl
   where shc_domain = global_domain
no-lock.
 
progloop:
do on error undo, leave:
 
   l_is_DOM  = no.
 
   /* GO THRU WORKFILE AND PERFORM SO ISSUES, CONTAINER ITEM ISSUES,
    * OR LOCATION TRANSFERS */
   do i = 1 to order_ct transaction:
 
      order_num = if (i <= 30) then
                     order_nbrs[i]
                  else
                     entry(i - 30,order_nbr_list).
 
      if can-find (first ecx_ref where
                         ecx_domain = global_domain and
                         ecx_nbr = order_num) then
         l_is_DOM = yes.
 
      find so_mstr
         where so_domain = global_domain
         and  so_nbr = order_num
         and  so_compl_stat = ""
      exclusive-lock no-error.
 
      if available so_mstr
         and so_inv_nbr <> ""
      then do:
         create temp_somstr.
         assign
            temp_so_nbr      = so_nbr
            temp_so_inv_nbr  = so_inv_nbr
            temp_so_inv_date = so_inv_date.
      end.  /* IF AVAILABLE SO_MSTR  AND SO_INV_NBR <> "" */
 
      if available so_mstr
      then do:
 
         if ( i <= 30 )
         then
         assign
            temp_fob[i]     = so_fob
            temp_shipvia[i] = so_shipvia.
      else
         assign
            temp_fob_list     = temp_fob_list + so_fob + ","
            temp_shipvia_list = temp_shipvia_list + so_shipvia + ",".
 
      assign
         so_bol         = abs_carr_ref
         so_fob         = abs_fob
         temp_so_qadc01 = so__qadc01
         temp_so_ship   = so_ship
         so_shipvia     = abs_shipvia
         so__qadc01     = so_ship when (so__qadc01 = " ").
      end. /* IF AVAILABLE so_mstr */
   end.
 
   /* MOVED CLOSER TO ACTUAL INVOICE PRINT SO THAT INVOICE NUMBER */
   /* IS DETERMINED IN THE SAME TRANSACTION AS IT IS PRINTED      */
   issue_inventory_loop:
   do transaction:
 
      for each work_abs_mstr no-lock
         where ((work_abs_mstr.abs_qty <> work_abs_mstr.abs_ship_qty)
         or      work_abs_mstr.abs_qty = 0),
      each abs_work exclusive-lock
         where abs_work.abs_domain = global_domain
         and   abs_work.abs_shipfrom = work_abs_mstr.abs_shipfrom
         and   abs_work.abs_id = work_abs_mstr.abs_id
         break by work_abs_mstr.abs_order
               by work_abs_mstr.abs_line
               by work_abs_mstr.abs_item
               by work_abs_mstr.abs_site
               by work_abs_mstr.abs_loc
               by work_abs_mstr.abs_lotser
               by work_abs_mstr.abs_ref:
 
         for first pt_mstr
            where pt_domain = global_domain
              and pt_part   = work_abs_mstr.abs_item
         no-lock: end.
 
         if work_abs_mstr.abs_item <> ""
            and (available pt_mstr and pt_cfg_type = "2")
            and not can-find (first sod_det
                              where sod_domain = global_domain
                                and sod_nbr    = work_abs_mstr.abs_order
                                and sod_part   = work_abs_mstr.abs_item
                                and sod_compl_stat = "")
         then next.
 
         /* CHECK FOR THE PRESENCE OF LOT/SERIAL NUMBER FOR */
         /* LOT/SERIAL CONTROLLED KIT PARENT AND COMPONENTS */
 
         if first-of(work_abs_mstr.abs_line)
            and (available pt_mstr
            and pt_cfg_type = "2")
            and can-find(first sod_det
                   where sod_domain     = global_domain
                   and   sod_nbr        = work_abs_mstr.abs_order
                   and   sod_part       = work_abs_mstr.abs_item
                   and   sod_compl_stat = "")
         then do :
            run p_lot_serial_validate
               (input work_abs_mstr.abs_order,
                input work_abs_mstr.abs_line,
                input work_abs_mstr.abs_site,
                input work_abs_mstr.abs_loc,
                input work_abs_mstr.abs_item,
                input work_abs_mstr.abs_lotser,
                input work_abs_mstr.abs_ref,
                input (if confirm_mode = yes
                       then
                          1
                       else
                          -1) * work_abs_mstr.abs_qty,
                input work_abs_mstr.abs__qad02,
                output rejected).
 
            if rejected
            then
               undo progloop,leave progloop.
 
            for each abs_comp
               where abs_comp.abs_domain   = global_domain
               and   abs_comp.abs_shipfrom = abs_work.abs_shipfrom
               and   abs_comp.abs_id begins "I"
               and   abs_comp.abs_par_id   = abs_work.abs_id
            no-lock:
               run p_lot_serial_validate
                  (input work_abs_mstr.abs_order,
                   input work_abs_mstr.abs_line,
                   input abs_comp.abs_site,
                   input abs_comp.abs_loc,
                   input abs_comp.abs_item,
                   input abs_comp.abs_lotser,
                   input abs_comp.abs_ref,
                   input (if confirm_mode = yes
                          then
                             1
                          else
                             -1) * abs_comp.abs_qty,
                   input abs_comp.abs__qad02,
                   output rejected).
 
               if rejected
               then
                  undo progloop,leave progloop.
            end. /* FOR EACH abs_mstr */
         end. /* IF FIRST-OF(work_abs_mstr.abs_line) AND ... */
 
         find sod_det
            where sod_domain = global_domain
            and sod_nbr = abs_work.abs_order
            and sod_line = integer(abs_work.abs_line)
            and sod_compl_stat = ""
         exclusive-lock no-error.
 
         assign
            sod_recno = recid(sod_det).
 
         for first si_mstr
            where si_domain = global_domain
            and   si_site = work_abs_mstr.abs_site
         no-lock: end.
 
         accumulate abs_work.abs_qty
            (total by work_abs_mstr.abs_item).
         accumulate abs_work.abs_ship_qty
            (total by work_abs_mstr.abs_item).
         accumulate abs_work.abs_qty
            (total by work_abs_mstr.abs_ref).
         accumulate abs_work.abs_ship_qty
            (total by work_abs_mstr.abs_ref).
 
         {us/ab/absupack.i  "abs_work" 3 22 "l_abs_pick_qty"}
 
         accumulate l_abs_pick_qty
            (total by work_abs_mstr.abs_ref).
 
         /* Pick up accumulated value or the record value depending */
         /* on the setting of the consolidation flags */
         /* Items */
         if abs_work.abs_id begins "I"
         then do:
            if sum_tr_item then
               assign
                  tmp_issueqty = accum total by work_abs_mstr.abs_ref
                     abs_work.abs_qty
                  tmp_shipqty  = accum total by work_abs_mstr.abs_ref
                     abs_work.abs_ship_qty
                  tmp_pickqty  = accum total by work_abs_mstr.abs_ref
                     l_abs_pick_qty.
            else
               assign
                  tmp_issueqty = abs_work.abs_qty
                  qty_chg      = abs_work.abs_qty
                  tmp_shipqty  = abs_work.abs_ship_qty
                  tmp_pickqty  = l_abs_pick_qty.
         end. /* if abs_work.abs_id begins "I"  */
 
         /* Containers */
         if not abs_work.abs_id begins "I"
         then do:
            if sum_tr_cont then
               assign
                  tmp_issueqty = accum total by work_abs_mstr.abs_ref
                     abs_work.abs_qty
                  tmp_shipqty  = accum total by work_abs_mstr.abs_ref
                     abs_work.abs_ship_qty
                  tmp_pickqty  = accum total by work_abs_mstr.abs_ref
                    l_abs_pick_qty.
            else
               assign
                  tmp_issueqty = abs_work.abs_qty
                  tmp_shipqty  = abs_work.abs_ship_qty
                  tmp_pickqty  = l_abs_pick_qty.
         end. /* if not abs_work.abs_id begins "I"  */
 
         /* SAVE OFF THE SHIPPER NUMBER FOR SHIPMENT PERFORMANCE */
         if using_shipment_perf
            and abs_work.abs_id begins "s"
         then
            shipperid = substring(abs_work.abs_id,2,20).
 
         if abs_work.abs_id begins "s" then
            /* SET THE INVOICE NUMBER ON THE abs_mstr TO REFLECT    */
            /* WHETHER THE abs_mstr IS BEING CONFIRMED OR           */
            /* UNCONFIRMED. THIS WILL BE USED LATER WHEN PRINTING   */
            /* THE INVOICE. BY SETTING THE INVOICE NUMBER, THE      */
            /* PRINT PROGRAM CAN RELIABLY FIND THE abs_mstr RECORDS */
            /* THAT HAVE BEEN PROCESSED AND NEED TO BE INVOICED.    */
 
            abs_work.abs_inv_nbr = if confirm_mode then "conf"
                                   else "unconf".
 
         /* IF USING LINE CHARGES THEN STORE IN TEMP TABLE */
         /* INFORMATION TO BE USED DURING INVOICE PRINT    */
         /* AND INVOICE POST.                              */
         if using_line_charges
            and abs_work.abs_id begins "i"
         then do:
            /* ADDED 7TH INPUT PARAMETER FOR CALCULATING THE CORRECT   */
            /* VALUE OF vLineUnitCharge                                */
            /*  Update Shipment Detail Line Charges with the extended price.*/
            {us/gp/gprunmo.i &program = ""rcsois1b.p""  &module = "ACL"
                       &param   = """(input abs_work.abs_id,
                                      input abs_work.abs_shipfrom,
                                      input abs_work.abs_order,
                                      input integer(abs_work.abs_line),
                                      input recid(abs_work),
                                      input confirm_mode,
                                      input no,
                                      input no)"""}
 
            /* CREATE SELF-BILLING RECORDS FOR EACH LINE CHARGE */
            /* SO THAT BILLING CAN BE DONE BY INDIVIDUAL LINE   */
            /* CHARGE TRAILER CODE.                             */
            if can-find (first sbic_ctl no-lock
               where sbic_domain = global_domain
               and   sbic_active = yes)
            then do:
 
               {us/gp/gprunmo.i &program = ""rcsois1c.p""  &module = "ACL"
                          &param   = """(input abs_work.abs_id,
                                         input abs_work.abs_shipfrom,
                                         input abs_work.abs_order,
                                         input integer(abs_work.abs_line),
                                         input recid(abs_work))"""}
            end.
         end. /* IF USING_LINE_CHARGES */
 
         /* Handle any ATO or KIT line items. Process the last
          * abs-record for a sales order line */
         if ( (last-of(work_abs_mstr.abs_ref))
            or ( (sum_tr_item = no)
            and (abs_work.abs_fa_lot <> "")))
            and available sod_det
            and sod_part = abs_work.abs_item
         then do:
            /* RECEIVE ASSEMBLE-TO-ORDER ITEM WITH FINAL ASSEMBLY ORDER */
            if abs_work.abs_fa_lot <> "" then do:
               if change_db then do:
                  run p_gp_alias (input ship_db, output err_flag).
                  if err_flag = 2
                     or err_flag = 3
                  then
                     undo progloop, leave progloop.
               end.
               else
                  sod_recno = recid(sod_det).
 
               /* STORING THE QTY_CHG IN INVENTORY UM AND        */
               /* PASSING IT AS +VE QTY SO THAT SR_QTY AND       */
               /* SOD_QTY_CHG GET UPDATED CORRECTLY IN RCSOISJ.P */
               if sum_tr_item then do:
                  if confirm_mode then
                     qty_chg = (accum total by work_abs_mstr.abs_ref
                                abs_work.abs_qty) -
                               (accum total by work_abs_mstr.abs_ref
                                abs_work.abs_ship_qty).
                  else
                     qty_chg = (accum total by work_abs_mstr.abs_ref
                                abs_work.abs_qty).
               end. /* IF sum_tr_item */
 
               {us/bbi/gprun.i ""rcsoisj.p""
                        "(input sod_nbr,
                          input sod_line,
                          input abs_work.abs_line,
                          input abs_work.abs_fa_lot,
                          input abs_work.abs_site,
                          input abs_work.abs_loc,
                          input abs_work.abs_lotser,
                          input abs_work.abs_ref,
                          input qty_chg,
                          input confirm_mode,
                          output sod_qty_chg)"}.
 
               /* SWITCH BACK TO SALES ORDER DOMAIN IF NECESSARY */
               if change_db then do:
                  run p_gp_alias (input so_db, output err_flag).
                  if err_flag = 2
                     or err_flag = 3
                  then
                     undo progloop, leave progloop.
               end.
 
            end. /* if abs_work.abs_fa_lot <> "" then do: */
 
            if can-find (first pt_mstr
               where pt_domain = global_domain
               and   pt_part = work_abs_mstr.abs_item
               and   pt_pm_code  = "C"
               and   pt_cfg_type = "1")
            then do:
 
               /* SWITCH TO INVENTORY DOMAIN IF NECESSARY */
               if change_db then do:
                  run p_gp_alias (input ship_db, output err_flag).
                  if err_flag = 2
                     or err_flag = 3
                  then
                     undo progloop, leave progloop.
               end. /* IF change_db */
 
               if first-of(work_abs_mstr.abs_ref)
                  or ((sum_tr_item         =  no)
                  and (abs_work.abs_fa_lot <> ""))
               then
                  l_accum_shpqty = 0.
 
               if first-of(work_abs_mstr.abs_item)
                  and work_abs_mstr.abs_item = sod_part
               then
                  assign
                     l_um     = work_abs_mstr.abs__qad02
                     l_umconv = decimal(work_abs_mstr.abs__qad03).
 
               if sod_type = "" then
                  if confirm_mode then
                     l_accum_shpqty = l_accum_shpqty +
                                    + work_abs_mstr.abs_qty
                                    - work_abs_mstr.abs_ship_qty.
                  else
                     l_accum_shpqty = -1 * (l_accum_shpqty
                                    + work_abs_mstr.abs_qty).
 
               if work_abs_mstr.abs_id begins "I"
                  and not (can-find (first abs_mstr
                  where abs_mstr.abs_domain   = global_domain
                  and   abs_mstr.abs_shipfrom = work_abs_mstr.abs_shipfrom
                  and   abs_mstr.abs_par_id   = work_abs_mstr.abs_id))
               then do:
                  l_tran_type = if sod_consignment
                                then
                                   "ISS-TR"
                                else
                                   "ISS-SO".
                  {us/bbi/gprun.i ""icedit2.p""
                     "(input l_tran_type,
                       input work_abs_mstr.abs_site,
                       input work_abs_mstr.abs_loc,
                       input work_abs_mstr.abs_item,
                       input work_abs_mstr.abs_lotser,
                       input work_abs_mstr.abs_ref,
                       input l_accum_shpqty * l_umconv,
                       input l_um,
                       input """",
                       input """",
                       output rejected)"}
                  if sod_consignment
                     and rejected = no
                  then
                     {us/bbi/gprun.i ""icedit2.p""
                        "(input ""CN-SHIP"",
                          input work_abs_mstr.abs_site,
                          input work_abs_mstr.abs_loc,
                          input work_abs_mstr.abs_item,
                          input work_abs_mstr.abs_lotser,
                          input work_abs_mstr.abs_ref,
                          input l_accum_shpqty * l_umconv,
                          input l_um,
                          input """",
                          input """",
                          output rejected)"}
               end. /* IF abs_id BEGINS "I" ... */
 
               /* SWITCH BACK TO SALES ORDER DOMAIN IF NECESSARY */
               if change_db then do:
                  run p_gp_alias (input so_db, output err_flag).
                  if err_flag = 2
                     or err_flag = 3
                  then
                     undo progloop, leave progloop.
               end. /* IF change_db */
 
               if rejected
               then do:
                  /* UNABLE TO ISSUE OR RECEIVE FOR ITEM # */
                  {us/bbi/pxmsg.i &MSGNUM=161 &ERRORLEVEL=3 &MSGARG1=work_abs_mstr.abs_item}
                  undo_stat = yes.
                  undo progloop, leave progloop.
               end. /* IF REJECTED */
 
            end. /* IF CAN FIND PT_MSTR */
 
         end. /* IF LAST-OF(abs_ref) AND AVAILABLE sod_det.. */
 
         /* CHECK FOR KIT COMPONENTS IN abs_mstr*/
         if available sod_det
            and sod_part = abs_work.abs_item
         then do:
 
            for first abs_comp
               where abs_comp.abs_domain   = global_domain
               and   abs_comp.abs_shipfrom = abs_work.abs_shipfrom
               and   abs_comp.abs_id begins "I"
               and   abs_comp.abs_par_id   = abs_work.abs_id
            no-lock:
 
               /* PROCEDURE TO CHECK THE INVENTORY STATUS FOR KIT */
               run p-kitinvchk (output l_undo).
               if l_undo then
                  undo progloop, leave progloop.
 
            end. /* FOR FIRST abs_comp */
 
         end. /* IF AVAILABLE sod_det */
 
         /* PROCESS KIT PARENT AND ITS COMPONENTS */
         if (available abs_comp
             or (not available abs_comp
                 and can-find(first sod_det
                              where sod_det.sod_domain = global_domain
                              and   sod_nbr            = abs_work.abs_order
                              and   string(sod_line)   = abs_work.abs_line
                              and   sod_part           = abs_work.abs_item
                              and   sod_compl_stat = ""
                              and   sod_cfg_type       = "2")))
            and abs_work.abs_id begins "I"
         then do:
 
            sod_recno = recid(sod_det).
            /* PASSING ABS_QTY IN INVENTORY UM */
            {us/bbi/gprun.i ""rcsoisk.p""
               "(input recid(abs_work),
                 input confirm_mode,
                 input ((accum total by work_abs_mstr.abs_item
                       abs_work.abs_qty) * decimal (abs_work.abs__qad03)))"}.
         end.
 
         /*HANDLE ISSUE/TRANSFER OF PRODUCT ITEMS*/
         if (last-of(work_abs_mstr.abs_ref) or
            not sum_tr_item) and
            available sod_det and
            sod_part = abs_work.abs_item and
            abs_work.abs_id begins "I"
         then do:
 
            for first so_mstr where so_domain = global_domain
               and so_nbr = sod_nbr
               and so_compl_stat = ""
            no-lock: end.
 
            if so_fix_rate then
               assign
                  exch_rate     = so_ex_rate
                  exch_rate2    = so_ex_rate2
                  exch_ratetype = so_ex_ratetype.
            else do:
               /* GET EXCHANGE RATE FOR BASE TO ACCOUNT CURRENCY */
               {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
                  "(input  so_curr,
                    input  base_curr,
                    input  so_ex_ratetype,
                    input  eff_date,
                    output exch_rate,
                    output exch_rate2,
                    output mc-error-number)"}
               if mc-error-number <> 0 then do:
                  run p_display_message (input mc-error-number,
                                         input 3).
                  undo progloop, leave progloop.
               end.
 
               exch_ratetype = so_ex_ratetype.
 
            end.  /* else */
 
            /* ABS_QTY IN SHIP UM NEEDS TO BE CONVERTED TO INVENTORY UM */
            /* FOR INVENTORY IMPACTS OR SOD_UM FOR SOD_DET UPDATE              */
            create work_sr_wkfl.
            assign
               work_sr_wkfl.sr_domain = global_domain
               work_sr_wkfl.sr_userid = SessionUniqueID
               work_sr_wkfl.sr_lineid = abs_work.abs_line
               work_sr_wkfl.sr_site   = abs_work.abs_site
               work_sr_wkfl.sr_loc    = abs_work.abs_loc
               work_sr_wkfl.sr_lotser = abs_work.abs_lotser
               work_sr_wkfl.sr_ref    = abs_work.abs_ref
               ship_so                = so_nbr
               ship_line              = sod_line.
 
            {us/ab/absupack.i  "abs_work" 3 22 "l_abs_pick_qty"}
 
            /* CONVERTING SHIPPED QTY TO SOD_UM TO UPDATE SOD_DET LATER */
            if decimal(abs_work.abs__qad03) = 0 then
               assign
                  abs_work.abs__qad03 = "1".
 
            /* STORING THE QUANTITY IN INVENTORY UM TO     */
            /* AVOID ROUNDING ERRORS IN LD_DET AND TR_HIST */
            if confirm_mode then
               assign
                  work_sr_wkfl.sr_qty = (tmp_issueqty - tmp_shipqty)
                                      * decimal(abs_work.abs__qad03)
                                      / sod_um_conv
                  work_sr_wkfl.sr__qadc01 = string(
                                            round((tmp_issueqty - tmp_shipqty)
                                            * decimal(abs_work.abs__qad03),9))
                  qty_pick = tmp_pickqty * decimal(abs_work.abs__qad03)
                           / sod_um_conv
                  qty_chg  = work_sr_wkfl.sr_qty.
 
            else /* unconfirm, so reverse signs */
               /* Since abs_ship_qty does not seem to play any role
                * in the system it is being dropped from the calculation */
               assign
                  work_sr_wkfl.sr_qty = (-1 * tmp_issueqty
                                      * decimal(abs_work.abs__qad03))
                                      / sod_um_conv
                  work_sr_wkfl.sr__qadc01 = string(-1 *
                                            round(tmp_issueqty
                                            * decimal(abs_work.abs__qad03),9))
                  qty_pick = -1 * tmp_pickqty
                           * decimal(abs_work.abs__qad03) / sod_um_conv
                  qty_chg = work_sr_wkfl.sr_qty.
 
            if sod_type <> "" then do:
               if confirm_mode then
                  qty_pick = abs_work.abs_qty.
               else
                  qty_pick = (-1) * abs_work.abs_qty.
            end. /* if sod_type <> "" */
 
            if recid(work_sr_wkfl) = -1 then.
 
            for first si_mstr
               where   si_domain = global_domain
               and     si_site = sod_site
            no-lock: end.
 
            assign
               sod_entity      = si_entity
               l_unconfm_shp   = no
               l_multi_ln_item = no.
 
            if sod__qadl01
               and confirm_mode
            then do:
 
               /* CHECK FOR UNCONFIRMED SHIPPERS */
               for each abs_comp
                  where abs_comp.abs_domain   = global_domain
                  and   abs_comp.abs_order    = sod_nbr
                  and   abs_comp.abs_line     = string(sod_line)
                  and   abs_comp.abs_ship_qty <> abs_comp.abs_qty
               no-lock:
 
                  run p-get-parent-id
                     (input  recid(abs_comp),
                      output l_absid).
 
                  if l_absid <> abs_mstr.abs_id then do:
                     l_unconfm_shp = yes.
                     leave.
                  end. /* IF L_ABSID,2 <> ... */
 
               end. /* FOR EACH ABS_COMP */
 
               /* CANCEL BACKORDERS ONLY IF THERE EXISTS NO */
               /* UNCONFIRMED SHIPPERS FOR SAME SO LINE     */
               if not l_unconfm_shp then do:
 
                  /* CHECK FOR MULTIPLE SHIPPER LINES WITHIN THE SAME        */
                  /* SHIPPER FOR A SALES ORDER LINE. CANCEL BACKORDER        */
                  /* QUANTITY ONLY FOR THE LAST SHIPPER LINE OF THAT SO LINE */
                  if can-find (first abs_comp
                     where abs_comp.abs_domain = global_domain
                     and   abs_comp.abs_order    =  sod_nbr
                     and   abs_comp.abs_line     =  string(sod_line)
                     and   abs_comp.abs_item     =  abs_work.abs_item
                     and   abs_comp.abs_ship_qty <> abs_comp.abs_qty
                     and   abs_comp.abs_id       <> abs_work.abs_id)
                  then
                     assign
                        l_multi_ln_item = yes
                        l_multi_ln_shpr = yes
                        qty_bo          = if sod_qty_ord > 0
                                             or not so_sched
                                          then
                                             sod_qty_ord - sod_qty_ship - qty_chg
                                          else
                                             0.
                  else do:
 
                     if (sod_qty_ord  * (sod_qty_ord -
                        (sod_qty_ship + qty_chg )) < 0)
                     then
                        sod_bo_chg = sod_qty_ord - sod_qty_ship - qty_chg.
 
                     /* MFSOTR.I EXPECTS QTY_ALL TO HAVE BEEN */
                     /* CONVERTED TO THE SKU UNIT OF MEASURE. */
                     assign
                        prev_qty_all = qty_all
                        qty_all      = qty_all * sod_um_conv
                        sod_qty_chg  = qty_chg.
 
                     {us/mf/mfsotr.i "QTYCHG"}
 
                     l_save_db = global_db.
 
                     if global_db <> "" and
                        si_db     <> global_db
                     then do:
                        run p_gp_alias (input si_db, output l_err-flag).
                     end. /* IF GLOBAL_DB <> "" */
 
                     /* BACKOUT CHANGES MADE TO IN_QTY_ALL IN MFSOTR.I */
                     {us/bbi/gprun.i ""rcinupd.p""
                        "(input        sod_part,
                          input        sod_site,
                          input-output l_multi_ln_shpr)"}
 
                     if global_db <> l_save_db then do:
                        run p_gp_alias (input l_save_db, output l_err-flag).
                     end.
 
                     /* CANCELLING BACKORDER QUANTITY */
                     assign
                        qty_all = prev_qty_all
                        qty_bo  = 0.
 
                  end. /* ELSE DO */
 
               end. /* IF NOT L_UNCONFM_SHP */
               else
                  qty_bo = if sod_qty_ord > 0
                              or not so_sched
                           then
                              sod_qty_ord - sod_qty_ship - qty_chg
                           else
                              0.
 
            end. /* IF SOD__QADl01 AND CONFIRM_MODE THEN */
            else
               qty_bo = if sod_qty_ord > 0
                           or not so_sched
                        then
                           sod_qty_ord - sod_qty_ship - qty_chg
                        else
                           0.
 
            /* SAVE sod_qty_ship BEFORE THE SO ISSUE UPDATES       */
            /* IT WITH THE QTY TO BE SHIPPED. SHIPMENT PERFORMANCE */
            /* NEEDS THIS VALUE IN ORDER TO PROCESS DISCRETE       */
            /* SALES ORDERS CORRECTLY.                             */
            if first-of(work_abs_mstr.abs_item) then
               perf_ship_qty = sod_qty_ship.
 
            /* SWITCH TO INVENTORY DOMAIN IF NECESSARY */
            if change_db then do:
               run p_gp_alias (input ship_db, output err_flag).
 
               if err_flag = 2
                  or err_flag = 3
               then
                  undo progloop, leave progloop.
            end. /* IF change_db */
 
            /* CREATING pk_det RECORD FOR FAMILY PLANNING ITEMS. */
            if sod_sched then do:
               {us/mf/mfdel.i pk_det "where pk_domain = global_domain
                                and   pk_user = SessionUniqueID"}
               part = sod_part.
               {us/bbi/gprun.i ""sopbex.p""}
            end. /* IF sod_sched */
 
            /* GET THE BASE CURRENCY OF THE REMOTE DATABASE */
            {us/bbi/gprun.i ""gpbascur.p"" "(output l_remote-base-curr)"}
 
            /* SWITCH BACK TO SALES ORDER DOMAIN IF NECESSARY */
            if change_db then do:
               run p_gp_alias (input so_db, output err_flag).
 
               if err_flag = 2
                  or err_flag = 3
               then
                  undo progloop, leave progloop.
            end. /* IF change_db */
 
            /*DO A SO ISSUE*/
            l_abs_id = work_abs_mstr.abs_id.
 
            {us/bbi/gprun.i ""rcsoisb.p""
               "(input recid(sod_det),
                 input auto_post,
                 input so_inv_nbr,
                 input abs_mstr.abs_id,
                 input ship_dt,
                 input abs_mstr.abs_inv_mov,
                 input abs_work.abs_id,
                 input abs_work.abs_shipfrom)"}
 
            if l_undo then
               undo progloop, leave progloop.
 
            /* Store cum shipped in prior cum shipped before overwriting
             * cum shipped with new value below. This section was copied
             * from sosoisu3.p where it's used to update the remote
             * domain records. Here it's used to update the central
             * domain. */
 
            if sod_cum_date[2] = ? then do:
               sod_cum_date[2] = eff_date - 1.
            end.
            else if sod_cum_date[2] < eff_date - 1 then do:
               assign
                  sod_cum_date[2] = eff_date - 1
                  sod_cum_qty[2] = sod_cum_qty[1].
            end.
 
            /* UPDATE QTY INVOICED */
            if using_cust_consignment = no
               or (using_cust_consignment and abs_consign_flag = no)
            then
               sod_qty_inv  = qty_inv.
 
            /* SET THE FOLLOWING IN THE CURRENT DOMAIN*/
            assign
               sod_qty_chg    = 0
               sod_bo_chg     = 0
               sod_qty_ord    = qty_ord
               sod_qty_ship   = qty_ship
               sod_cum_qty[1] = qty_cum_ship
               sod_pickdate   = ?
               sod_qty_all    = qty_all
               sod_qty_pick   = qty_pick
               sod_std_cost   = std_cost.
 
            {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
               "(input  base_curr,
                 input  l_remote-base-curr,
                 input  """",
                 input  eff_date,
                 output l_exch-rate2,
                 output l_exch-rate,
                 output mc-error-number)"}
            if mc-error-number <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end. /* IF mc-error-number */
 
            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
               "(input  l_remote-base-curr,
                 input  so_curr,
                 input  l_exch-rate,
                 input  l_exch-rate2,
                 input  std_cost,
                 input  false,
                 output sod_std_cost,
                 output mc-error-number)"}
            if mc-error-number <> 0
            then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end. /*  IF mc-error-number <> 0 */
 
            if confirm_mode and que-doc and
               can-find(first ecx_ref where ecx_domain = global_domain
                        and ecx_nbr = sod_nbr)
            then do:
               /* For DOM owned orders, queue a Supplier Initiated Change Document */
               /* This sends back both the quantity shipped and the new open order total */
               run create-sod-cmf (input recid(sod_det)).
            end.
 
            if using_cust_consignment = no
               or
               (using_cust_consignment and abs_consign_flag = no)
               or
               (using_cust_consignment = yes and abs_consign_flag = yes
               and qty_chg < 0
               and abs_work.abs_consigned_return = no)
               then
 
               /* The flag on control file sbic_ctrl and mfc_ctrl would always
                * be maintained in sync. So we test value of mfc_ctrl flag */
               if vUsingSelfBilling
                  and can-find (cm_mstr where cm_domain = global_domain
                                          and cm_addr = so_bill
                                          and cm__qad06 = yes)
               then do:
                  /* Create Self-Bill X-Ref Records */
                  {us/gp/gprunmo.i &program = "arsixcr1.p" &module="ASB"
                             &param="""(input  abs_work.abs_id,
                                        input  abs_work.abs_shipfrom,
                                        input  substring(abs_mstr.abs_id,2),
                                        input  confirm_mode,
                                        output return_status)"""}
            end.
 
            /* ALWAYS ACCUMULATE QUANTITIES FOR SHIPMENT PERFORMANCE */
            if using_shipment_perf then
               total_sp_qty = (accumulate total by
                               work_abs_mstr.abs_item
                               abs_work.abs_qty) -
                              (accumulate total by
                               work_abs_mstr.abs_item
                               abs_work.abs_ship_qty) /
                               sod_um_conv.
 
            /* COLLECT SHIPMENT PERFORMANCE INFORMATION IF  */
            if using_shipment_perf
               and last-of(work_abs_mstr.abs_item)
            then
               run collect_ship_perf_info
                  (input  recid(sod_det),
                   input  abs_work.abs_id,
                   input  abs_work.abs_shipfrom,
                   input  shipperid,
                   input  yes,
                   input  perf_ship_qty,
                   input  confirm_mode,
                   input  total_sp_qty,
                   input  no).
 
         end. /* if (last-of(work_abs_mstr.abs_ref)... */
 
         /*HANDLE ISSUE/TRANSFER OF CONTAINER ITEMS*/
         if (last-of(work_abs_mstr.abs_ref)
            or not sum_tr_cont)
            and not work_abs_mstr.abs_id begins "I"
         then
         CONTAINERS:
         do:

            ordernbr = abs_work.abs_order.

            if change_db
            then do:
               if global_db <> ship_db
               then do:
                  run p_gp_alias
                     (input  ship_db,
                      output err_flag).
                  if    err_flag = 2
                     or err_flag = 3
                  then
                     undo progloop, leave progloop.
               end. /* IF global_db <> ship_db */
            end. /* IF change_db */
 
            {us/bbi/gprun.i ""rctrccp.p""
               "(input abs_work.abs_item,
                 input abs_work.abs_line,
                 input abs_work.abs_site,
                 input abs_work.abs_loc,
                 input abs_work.abs_lotser,
                 input abs_work.abs_ref,
                 input abs_work.abs_shipfrom,
                 input tmp_issueqty,
                 input tmp_shipqty,
                 input l_shipto,
                 input substr(abs_mstr.abs_id,2),
                 input ship_dt,
                 input abs_mstr.abs_inv_mov)"}
 
            if change_db
            then do:
               if global_db <> so_db
               then do:
                  run p_gp_alias
                     (input  so_db,
                      output err_flag).
                  if    err_flag = 2
                     or err_flag = 3
                  then
                     undo progloop, leave progloop.
               end. /* IF global_db <> so_db */
            end. /* IF change_db */
 
         end. /* CONTAINERS:  */
 
         /* SKIP KIT COMPONENTS HERE */
         if not (available sod_det
            and sod_part <> abs_work.abs_item
            and abs_work.abs_id begins "i")
         then do:
            if confirm_mode then
               abs_work.abs_ship_qty = abs_work.abs_qty.
            else
               abs_work.abs_ship_qty = 0.
 
            abs_work.abs_shp_date = ship_dt.
         end. /*  if not (available sod_det ... */
 
         if last-of(work_abs_mstr.abs_order) and
            available (sod_det)
         then do:
            level = 1.
            /* For DOM owned orders, queue a Supplier Initiated Change Document */
            /* This sends back both the quantity shipped and the new open order total */
            if confirm_mode and que-doc and
               can-find(first ecx_ref where ecx_domain = global_domain
                        and ecx_nbr = sod_nbr)
            then do:
 
               repeat while program-name(level) <> ?:
                  if index(program-name(level), "edimasld") > 0 then
                     fromEDI = yes.
                  if fromEDI then leave.
                  level = level + 1.
               end.
                  assign
                     doc-type = "SO"
                     doc-ref  = sod_nbr
                     add-ref  = ""
                     msg-type = "ORDRSP-S".
 
                  /* QUEUE DOCUMENT FOR TRANSMISSION - BTB */
                  {us/bbi/gprun.i ""gpquedoc.p""
                        "(input-output doc-type,
                          input-output doc-ref,
                          input-output add-ref,
                          input-output msg-type,
                          input-output trq-id,
                          input yes)"}.
 
            end.
         end.
 
      end. /* for each work_abs_mstr */
   end. /* issue_inventory_loop: do transaction: */
 
   /* MARK SHIPPER CONFIRMED */
   for first abs_mstr
      where recid(abs_mstr) = abs_recid
   exclusive-lock:
      abs_mstr.abs_eff_date = eff_date.
   end.
 
   if available abs_mstr then do transaction:
      if confirm_mode then
         substring(abs_mstr.abs_status,2,1) = "y".
      else
         assign
            substring(abs_mstr.abs_status,2,1)  = " ".
            substring(abs_mstr.abs_status,21,1) = "u".
 
      /* CLEAR INVOICE NUMBER ON SHIPPER DETAIL LINES TO BE LINKED TO
       * THE NEW INVOICE */
      run p_clear_line_invnbr(input abs_mstr.abs_shipfrom,
                              input abs_mstr.abs_id).
   end. /* IF AVAILABLE abs_mstr DO TRANSACTION */
   
   /* TAX POSTING */
   do transaction:
      for first abs_mstr no-lock
         where recid(abs_mstr) = abs_recid:
         for each tr_hist no-lock
            where tr_domain = global_domain and 
                  tr_ship_inv_mov = abs_mstr.abs_inv_mov and 
                  tr_ship_id = substring(abs_mstr.abs_id,2) and
                  tr_type = "ISS-UNP"
            break by tr_type by tr_nbr by tr_line by tr_part by tr_serial:         
            if last-of(tr_serial) then do:
               for each abs_line
                  where abs_line.abs_domain = global_domain
                  and   abs_line.abs_par_id = abs_mstr.abs_id
                  and   abs_line.abs_shipfrom = abs_mstr.abs_shipfrom				  
               exclusive-lock:
                  for first pt_line
                     where pt_line.pt_domain = global_domain
                     and   pt_line.pt_part = abs_line.abs_item
                  no-lock:
                     for first pl_mstr
                        where pl_domain = global_domain
                        and   pl_prod_line = pt_line.pt_prod_line
                     no-lock:
                        assign
                           abs_line.abs_acct = pl_cop_acct
                           abs_line.abs_sub = pl_cop_sub
                           abs_line.abs_cc = pl_cop_cc
                        .
                     end.
                  end.
               end.
               {us/bbi/gprun.i ""icgltax.p""
                  "(input tr_trnbr,
                   input abs_recid)"}
            end.
         end.

      end.
   end.
 
   /* MARK SHIPPER CONFIRMED */
   do transaction:

      assign
         l_Found = ?
         l_Value = "".
 
      find abs_mstr 
         where recid(abs_mstr) = abs_recid 
      exclusive-lock.
 
      if que-doc
      then do:
 
         {us/px/pxrun.i &proc = 'getParameterValue'
                        &program = 'edgetpv.p'
                        &handle = ph_edgetpv       
                        &param = "(input ecom_domain,
                                   input abs_shipto,
                                   input abs_shipfrom,
                                   input ""SEND_EDI_ASN's"",
                                   input 'LOGICAL',
                                   output l_Found,
                                   output l_Value)"
                        &catcherror = TRUE
                        &noapperror = TRUE}

         if l_Value = ""
         then
            {us/px/pxrun.i &proc = 'getParameterValue'
                           &program = 'edgetpv.p'
                           &handle = ph_edgetpv
                           &param = "(input ecom_domain,
                                      input abs_shipto,
                                      input abs_shipfrom,
                                      input ""SEND_EDI_ASN"",
                                      input 'LOGICAL',
                                      output l_Found,
                                      output l_Value)"
                           &catcherror = TRUE
                           &noapperror = TRUE}

         if l_Value = ""
         then
            {us/px/pxrun.i &proc = 'getParameterValue'
                           &program = 'edgetpv.p'
                           &handle = ph_edgetpv
                           &param = "(input ecom_domain,
                                      input abs_shipto,
                                      input abs_shipfrom,
                                      input ""SEND_ASN"",
                                      input 'LOGICAL',
                                      output l_Found,
                                      output l_Value)"
                           &catcherror = TRUE
                           &noapperror = TRUE} 

         if l_Found = yes 
            or l_is_DOM
         then do:
 
            assign
               doc-type = "ASN"
               doc-ref  = abs_shipfrom
               add-ref  = abs_id
               msg-type = "ASN".
 
            /* QUEUE DOCUMENT FOR TRANSMISSION - BTB */
 
            if confirm_mode and
               (not trade_sale or (trade_sale and send_ts_asn))
            then
               {us/bbi/gprun.i ""gpquedoc.p""
                  "(input-output doc-type,
                    input-output doc-ref,
                    input-output add-ref,
                    input-output msg-type,
                    input-output trq-id,
                    input yes)"}.
 
         end. /* ad_edi_ctrl[1] = "e" */
 
      end. /* QUEUE DOCUMENT FOR TRANSMISSION */
 
      assign
         abs_mstr.abs_eff_date = eff_date
         abs_mstr.abs_shp_date = ship_dt.
 
   end. /* do transaction */
 
   if not auto_post
   then do:
      /* CONFIRM PEGGED SHIPPER LINES */
      {us/bbi/gprun.i ""rcsois3a.p"" "(input abs_recid)"}
   end. /* IF NOT auto_post */
   
   for each work_abs_mstr
      where work_abs_mstr.abs_qty <> work_abs_mstr.abs_ship_qty
   no-lock:
 
      for first sod_det where  sod_domain = global_domain
          and  sod_nbr  = work_abs_mstr.abs_order
          and  sod_line = integer(work_abs_mstr.abs_line)
          and  sod_compl_stat = ""
      no-lock:
 
         if sod_sched then do:
 
         for first so_mstr where so_domain = global_domain
            and   so_nbr = sod_nbr
            and   so_compl_stat = ""
         no-lock: end.
 
         /* FOR NON-CUM ORDERS RELIEVE MRP REQUIREMENTS */
         if not so_cum_acct then do:
            {us/bbi/gprun.i ""rcmrw.p""
               "(input sod_nbr,
                 input sod_line,
                 input no,
                 input yes)"}
         end. /* IF NOT SO_CUM_ACCT */
 
         end. /* IF SOD_SCHED */
 
      end. /* FOR FIRST SOD_DET */
 
   end. /* FOR EACH WORK_ABS_MSTR */

   /* Shipment Certification */
   do transaction:
      for first abs_mstr
         where recid(abs_mstr) = abs_recid
      no-lock:
         if confirm_mode then do:
            /* Generate the signature */
            {us/gp/gprunp.i "gpshpcer" "p" "performShipmentCertification"
               "(input abs_mstr.oid_abs_mstr)"}
         end.
         else do:
            for each abssi_det
               where abssi_det.oid_abs_mstr = abs_mstr.oid_abs_mstr
               and   abssi_status = ""
            exclusive-lock:
               abssi_status = "Cancelled".
            end.
         end.
      end.
   end.
   assign
      l_traddr      = traddr
      l_qty_iss_rcv = qty_iss_rcv
      o_undo        = false.
 
end. /* progloop */
 
PROCEDURE create-sod-cmf:
   define input parameter ip_sod_recid as recid no-undo.
 
   /* LOCAL VARIABLES */
   define variable v_transnbr like cmf_trans_nbr initial 0 no-undo.
 
   define buffer sod_det for sod_det.
   define buffer so_mstr for so_mstr.
   define buffer cmf_mstr for cmf_mstr.
 
   find sod_det where recid(sod_det) = ip_sod_recid no-lock no-error.
   if not available sod_det then
      return.
 
   find so_mstr
      where so_domain = global_domain
       and  so_nbr = sod_nbr
       and  so_compl_stat = ""
   no-lock no-error.
   if not available so_mstr then
      return.
 
   find cmf_mstr
      where cmf_domain = global_domain and
            cmf_doc_type = "SO" and
            cmf_doc_ref  = so_nbr and
            cmf_status   = "1"
   no-lock no-error.
   if available cmf_mstr
   then
      v_transnbr = cmf_trans_nbr.
 
   run cmd_chg_SOD
     (input sod_nbr,
      input sod_line,
      input "sod_qty_ship",
      input string(sod_qty_ship),
      input so_po,
      input-output v_transnbr).
 
   if v_transnbr = -1
   then
      undo, retry.
 
END PROCEDURE. /* create-sod-cmf */
 
PROCEDURE p-get-parent-id:
/*--------------------------------------------------------------------
* Purpose:    Get Shipper ID for a shipper line
*----------------------------------------------------------------------*/
   define input  parameter l_recid      as   recid           no-undo.
   define output parameter l_absid      like abs_id          no-undo.
 
   define variable l_par_recid as  recid no-undo.
   define buffer   b_abs_mstr  for abs_mstr.
 
   /* FIND TOP-LEVEL PARENT SHIPPER OR PRESHIPPER */
   {us/bbi/gprun.i ""gpabspar.p""
      "(input l_recid,
        input 'PS',
        input false,
        output l_par_recid)"}
 
   for first b_abs_mstr
      where recid(b_abs_mstr) = l_par_recid
   no-lock:
      l_absid   = b_abs_mstr.abs_id.
   end.
 
END PROCEDURE.
 
PROCEDURE collect_ship_perf_info:
   define input parameter ip_sodrecid      as recid no-undo.
   define input parameter ip_abs_id        like abs_mstr.abs_id no-undo.
   define input parameter ip_shipfrom      like abs_mstr.abs_shipfrom no-undo.
   define input parameter ip_shipperid     like abs_mstr.abs_id no-undo.
   define input parameter ip_logical       like mfc_logical no-undo.
   define input parameter ip_perf_ship_qty like abs_mstr.abs_qty no-undo.
   define input parameter ip_confirm_mode  like mfc_logical no-undo.
   define input parameter ip_total_sp_qty  like abs_mstr.abs_qty no-undo.
   define input parameter ip_logical2      like mfc_logical no-undo.
 
   {us/gp/gprunmo.i &program = ""soshpso.p"" &module = "ASR"
              &param   = """(input  ip_sodrecid,
                             input  ip_abs_id,
                             input  ip_shipfrom,
                             input  ip_shipperid,
                             input  ip_logical /*YES*/,
                             input  ip_perf_ship_qty,
                             input  ip_confirm_mode,
                             input  ip_total_sp_qty,
                             input  ip_logical2 /*no*/)"""}
END PROCEDURE.
 
PROCEDURE p_gp_alias:
/*-----------------------------------------------------------------------
* Purpose:      To Establish an Alias for a particular db
*
* Parameters:   i_db          Name of the database
*               o_err_flag    If true, then database alias not established
*
* Note:         Procedure created to remove Error "Action Segment has exceeded
*               its limit of 63488 bytes".
*-------------------------------------------------------------------------*/
 
   define input  parameter l_db       like global_db   no-undo.
   define output parameter l_err_flag like mfc_logical no-undo.
 
   define variable         l_err_num  as   integer     no-undo.
 
   {us/bbi/gprun.i ""gpalias3.p"" "(input l_db, output l_err_num)"}
 
   l_err_flag = l_err_num = 2 or l_err_num = 3.
 
   if l_err_flag then do:
      /* DOMAIN # IS NOT AVAILABLE */
      {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=l_db}
   end. /* IF l_err_flag */
 
END PROCEDURE.  /* p_gp_alias */
 
PROCEDURE p-kitinvchk:
/*-----------------------------------------------------------------------
* Purpose:      To check the inventory for Overissue Status fo kit
*               components
* Parameters:   l_undo        logical field to undo
*-------------------------------------------------------------------------*/
 
   define output parameter l_undo like mfc_logical no-undo.
 
   define variable trans_conv like sod_um_conv.
   define variable l_db       like global_db no-undo.
 
   define buffer   work_abs_buff for work_abs_buff.
   define buffer   pt_mstr       for pt_mstr.
   define buffer   si_mstr       for si_mstr.
 
   for each work_abs_buff
      where   work_abs_buff.abs_order <> ""
      and     work_abs_buff.abs_item  <> ""
      and     work_abs_buff.abs_id  begins "i"
      and     work_abs_buff.abs_par_id begins "i"
   no-lock:
      trans_conv = 1.
      if can-find (first work_ldd
         where work_ldd_id = work_abs_buff.abs_id )
      then
         next.
 
      if (confirm_mode = yes and work_abs_buff.abs_qty > 0 )
         or
         (confirm_mode = no and work_abs_buff.abs_qty < 0 )
      then do:
 
         /* GET THE CORRECT UM */
         for first pt_mstr
            where   pt_domain = global_domain
            and     pt_part = work_abs_buff.abs_item
         no-lock:
            if work_abs_buff.abs__qad02 <> pt_um
            then do:
               {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                              &HANDLE=ph_gpumxr
                              &PARAM="(input pt_part,
                                       input pt_um,
                                       input work_abs_buff.abs__qad02,
                                       output trans_conv)"
                              &NOAPPERROR=True
                              &CATCHERROR=True}
            end. /* IF work_abs_buff .. */
         end. /* FOR FIRST pt_mstr */
 
         l_db = global_db.
         for first si_mstr
            where   si_domain = global_domain
            and     si_site = work_abs_buff.abs_site
         no-lock:
            if si_db <> global_db then do:
               {us/bbi/gprun.i ""gpalias3.p"" "(input si_db, output err_flag)"}
            end.
         end. /* FOR FIRST si_mstr */
 
         {us/bbi/gprun.i ""rcinvchk.p""
            "(input  work_abs_buff.abs_item,
              input  work_abs_buff.abs_site,
              input  work_abs_buff.abs_loc,
              input  work_abs_buff.abs_lot,
              input  work_abs_buff.abs_ref,
              input  work_abs_buff.abs_qty * trans_conv,
              input  work_abs_buff.abs_id,
              input  no,
              output l_undo)"}
 
         if l_db <> global_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(input l_db, output err_flag)"}
         end.
 
         if l_undo then
            return.
 
      end. /* IF confirm_mode ... */
   end. /* FOR EACH work_abs_buff.. */
 
   empty temp-table compute_ldd no-error.
 
END PROCEDURE.
 
PROCEDURE p_display_message:
/*-------------------------------------------------------------------------
* Purpose:      To display message using us/bbi/pxmsg.i
*
* Parameters:   i_msg_nbr      Message number
*               i_err_level    Error Level
*
* Note:         Procedure created to remove Error "Action Segment has
*               exceeded its limit of 63488 bytes".
*-------------------------------------------------------------------------*/
 
   define input  parameter i_msg_nbr      as integer     no-undo.
   define input  parameter i_err_level    as integer     no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=i_msg_nbr &ERRORLEVEL=i_err_level}
 
END PROCEDURE.  /* p_display_message */
 
PROCEDURE p_init_proc:
/*--------------------------------------------------------------------------
* Purpose:      Clean up temp tables and assign sum_tr_cont and sum_tr_item
*
* Parameters:   sum_tr_item    Setting of shc_sum_tr_item from mfc_ctrl
*               sum_tr_cont    Setting of shc_sum_tr_cont from mfc_ctrl
*
* Note:         Procedure created to remove Error "Action Segment has
*               exceeded its limit of 63488 bytes".
*--------------------------------------------------------------------------*/
 
   define output parameter sum_tr_item like sum_tr_item no-undo.
   define output parameter sum_tr_cont like sum_tr_cont no-undo.
 
   /* EMPTY TEMP-TABLES */
   empty temp-table work_trnbr no-error.
   empty temp-table temp_somstr no-error.
 
   for first mfc_ctrl
      where   mfc_domain = global_domain
      and     mfc_field = "shc_sum_tr_item"
   no-lock:
      sum_tr_item = mfc_logical.
   end.
 
   if not available mfc_ctrl then
      sum_tr_item = false.
 
   for first mfc_ctrl
      where   mfc_domain = global_domain
      and     mfc_field = "shc_sum_tr_cont"
   no-lock:
      sum_tr_cont = mfc_logical.
   end.
 
   if not available mfc_ctrl then
      sum_tr_cont = false.
 
END PROCEDURE.  /* p_init_proc */
 
PROCEDURE p_lot_serial_validate:
/*-------------------------------------------------------------------------
* Purpose:      Check for the presence of lot/serial number for lot/serial
*               controlled kit parent and components
*
* Parameters:   order    Setting of order  from work_abs_mstr.abs_order
*               line     Setting of line   from work_abs_mstr.abs_line
*               site     Setting of site   from work_abs_mstr.abs_site
*               loc      Setting of loc    from work_abs_mstr.abs_loc
*               item     Setting of item   from work_abs_mstr.abs_item
*               lotser   Setting of lotser from work_abs_mstr.abs_lotser
*               ref      Setting of ref    from work_abs_mstr.abs_ref
*               qty      Setting of qty    from work_abs_mstr.abs_qty
*               qad02    Setting of qad02  from work_abs_mstr.abs__qad02
*               rejected Setting of the rejected flag
*
* Note:         Procedure created to remove Error "Action Segment has
*               exceeded its limit of 63488 bytes".
*-------------------------------------------------------------------------*/
 
   define input parameter order  like abs_order      no-undo.
   define input parameter line   like abs_line       no-undo.
   define input parameter site   like abs_site       no-undo.
   define input parameter loc    like abs_loc        no-undo.
   define input parameter item   like abs_item       no-undo.
   define input parameter lotser like abs_lotser     no-undo.
   define input parameter ref    like abs_ref        no-undo.
   define input parameter qty    like abs_qty        no-undo.
   define input parameter qad02  like abs__qad02     no-undo.
   define output parameter rejected like mfc_logical no-undo.
   if item <> ""
   then do:
      if can-find(first ptp_det
         where ptp_domain   = global_domain
         and   ptp_part     = item
         and   ptp_site     = site
         and   ptp_pm_code  = "C"
         and   ptp_cfg_type = "2")
      then
         return.
      else
         if can-find(first pt_mstr
      where pt_domain   = global_domain
      and   pt_part     = item
      and   pt_pm_code  = "C"
      and   pt_cfg_type = "2")
         then
            return.
      if can-find (first sod_det
         where sod_domain      = global_domain
         and   sod_nbr         = order
         and   string(sod_line)= line
         and   sod_cfg_type    = "2"
         and   sod_compl_stat = "")
      then do:
         /* SWITCH TO INVENTORY DOMAIN IF NECESSARY */
         if change_db
         then do:
            run p_gp_alias (input ship_db, output err_flag).
            if err_flag = 2
               or err_flag = 3
            then do:
               assign
                  rejected = yes
                  undo_stat = yes.
                  return.
            end. /*  if err_flag = 2 or or err_flag = 3 */
         end. /* IF change_db */
 
         {us/bbi/gprun.i ""icedit.p""
            "(input ""ISS-SO"",
              input site,
              input loc,
              input item,
              input lotser,
              input ref,
              input qty,
              input qad02,
              input """",
              input """",
              output rejected)"}
      end. /* IF NOT CAN-FIND ... */
 
      if rejected then do:
         /* UNABLE TO ISSUE OR RECEIVE FOR ITEM # */
         {us/bbi/pxmsg.i &MSGNUM=161 &ERRORLEVEL=3
                  &MSGARG1=item}
         undo_stat = yes.
      end. /* IF rejected */
      /* SWITCH BACK TO SALES ORDER DOMAIN IF NECESSARY */
      if change_db
      then do:
         run p_gp_alias (input so_db, output err_flag).
         if err_flag = 2 or
            err_flag = 3
         then do:
            assign
               rejected  = yes
               undo_stat = yes.
            return.
         end. /*  if err_flag = 2 or or err_flag = 3 */
      end. /* IF change_db */
   end. /* IF item <> "" */
 
END PROCEDURE. /* p_lot_serial_validate */
 
PROCEDURE p_clear_line_invnbr:
/*--------------------------------------------------------------------
* Purpose:    Clear abs_inv_nbr on detail lines to allow new invoice
              reference to be established during invoice post
*----------------------------------------------------------------------*/
   define input parameter p_abs_shipfrom like abs_mstr.abs_shipfrom no-undo.
   define input parameter p_abs_id       like abs_mstr.abs_id       no-undo.
 
   define buffer b_abs_mstr for abs_mstr.
 
   for each b_abs_mstr
      where b_abs_mstr.abs_domain   = global_domain
      and   b_abs_mstr.abs_shipfrom = p_abs_shipfrom
      and   b_abs_mstr.abs_par_id   = p_abs_id
   exclusive-lock:

      if b_abs_mstr.abs_id begins "i"
      then
         b_abs_mstr.abs_inv_nbr = "".
      else
         run p_clear_line_invnbr(input b_abs_mstr.abs_shipfrom,
                                 input b_abs_mstr.abs_id).
 
   end. /* FOR EACH b_abs_mstr */
 
END PROCEDURE.
