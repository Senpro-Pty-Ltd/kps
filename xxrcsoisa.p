/* xxrcsois1a.p - Customer Schedules - Confirm Shipper Invoicing Sub-Program  */
/* rcsois1a.p - Customer Schedules - Confirm Shipper Invoicing Sub-Program    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrcsoisa.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
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
/* $Revision: 1.2 $ BY: Katie Hilbert            DATE: 06/25/10 ECO: *R21M* */
/* $Revision: 1.2 $ BY: Deirdre O'Brien           DATE: 07/09/10 ECO: *R21V* */
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                     */
/* CYB    LAST MODIFIED: 27-JUL-2011    BY:  gbg *c1226*                      */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CENTURY YUASA      LAST MODIFIED: 18-AUG-2011 BY: gbg *cy1044*          */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 13-DEC-2011    BY:  gbg *c1021b*                    */
/* CYB    LAST MODIFIED: 15-FEB-2012    BY:  gbg *c1275*                     */
/* CYB    LAST MODIFIED: 28-AUG-2012    BY:  gbg *c1334*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 30-MAY-2013    BY:  gbg *c1415*                     */
/* CYB   LAST MODIFIED: 22-JAN-2014    BY: gbg *c1454* Retrofit Q1066540      */
/* Q1066540           BY: Anu prasad           DATE: 01/16/14   ECO: MFGS-2812*/
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* ALL CHANGES MADE TO THIS PROGRAM SHOULD BE MADE TO rcsois2a.p AS WELL*/
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i}
/*Q1066540* {us/mf/mfsprtdf.i "new"} */
/*Q1066540*/ {us/mf/mfsprtdf.i}
{us/fs/fsdeclr.i}
/*cy1045*/ {us/xf/xfso10u.i "new"} /*eb3sp5*/
/*cy1045*/ {us/xf/xfso10v.i "new"} /*eb3sp5*/
/*c1226*/ {us/xx/xxauis2.i}
/*c1603* start added code >>>> */
def var p_inv_nbr_list as char no-undo.
def var p_inv_nbrs     as char extent 30 no-undo.
/*c1603* end added code <<<< */
 
define temp-table tt_somstr no-undo
   field tt_sonbr   like so_nbr
   field tt_sotoinv like mfc_logical initial no
index sonbr is primary unique
   tt_sonbr.
 
/* PARAMETERS */
define input  parameter calling_function as character      no-undo.
define input  parameter consignment      as logical        no-undo.
define input  parameter table            for tt_somstr.
define input  parameter trade_sale       as logical        no-undo.
define input  parameter send_ts_asn      as logical        no-undo.
define input  parameter brazil_ld        as logical        no-undo.
define input  parameter pPostFile        as character      no-undo.
define input  parameter p_prtInstBase    like mfc_logical  no-undo.
define input  parameter p_prtExtRep      like mfc_logical  no-undo.
define output parameter o_undo           like mfc_logical  no-undo 
                                         initial true.
define output parameter table            for ttisb.
 
/* SHARED VARIABLES */
define new shared variable qty_iss_rcv   like tr_qty_loc.
define new shared variable copyusr       like mfc_logical.
define new shared variable fas_so_rec    as character.
define new shared variable issrct        as character format "x(3)".
define new shared variable lotserial_qty like sr_qty no-undo.
define new shared variable open_ref      like sod_qty_ord.
define new shared variable orderline     like tr_line.
define new shared variable ordernbr      like tr_nbr.
define new shared variable prev_consume  like sod_consume.
define new shared variable prev_qty_ord  like sod_qty_ord.
define new shared variable prev_due      like sod_due_date.
define new shared variable prev_site     like sod_site.
define new shared variable prev_type     like sod_type.
define new shared variable traddr        like tr_addr.
define new shared variable conv          like um_conv label "Conversion" no-undo.
define new shared variable next_inv_nbr  like soc_inv.
define new shared variable next_inv_pre  like soc_inv_pre.
/*Q1066540* start deleted code >>>
define new shared variable inv_date      like ar_date.
*Q1066540* end deleted code <<<< */
define new shared variable comb_inv_nbr  like so_inv_nbr.
define new shared variable undo-select   like mfc_logical no-undo.
define new shared temp-table IntraStat field StatID as recid.
/*Q1066540* start deleted code >>>
define new shared variable prt_cor like mfc_logical
   label "Correction Invoices" initial no.
*Q1066540* end deleted code <<<< */
define new shared variable inccor           like mfc_logical
   label "Correction Invoices" initial no.
define new shared variable l_unconfm_shp   like mfc_logical  no-undo.
define new shared variable l_multi_ln_item like mfc_logical  no-undo.
define new shared variable conso           like mfc_logical.
 
define new shared variable l_abs_id        like abs_mstr.abs_id no-undo.
define new shared variable consign_batch   like cncu_mstr.cncu_batch  no-undo.
define new shared variable dom-ord         like so_nbr no-undo.
define new shared variable dom-ord1        like so_nbr no-undo.
/*Q1066540* start deleted code >>>
define new shared variable sls-psn         like so_slspsn[1] no-undo.
define new shared variable sls-psn1        like so_slspsn[1] no-undo.
*Q1066540* end deleted code <<<< */
define new shared variable dom-single      like mfc_logical no-undo.
define new shared variable site            like ih_site.
define new shared variable site1           like ih_site.
/*Q1066540* start deleted code >>>
define new shared variable lang            like so_lang.
define new shared variable lang1           like lang.
 
define new shared variable nbr1             like so_nbr.
define new shared variable dnbr             like ih_nbr no-undo.
define new shared variable dnbr1            like ih_nbr no-undo.
*Q1066540* end deleted code <<<< */
define new shared variable dom-proc         as integer no-undo.
define new shared variable first_line       like mfc_logical.
/*Q1066540* start deleted code >>>
define new shared variable pages            as integer.
*Q1066540* end deleted code <<<< */
define new shared variable comp_addr        like soc_company.
/*Q1066540* start deleted code >>>
define new shared variable msg              like msg_desc.
define new shared variable inv_date1        like ih_inv_date.
*Q1066540* end deleted code <<<< */
define new shared variable ih_recno         as recid.
/*Q1066540* start deleted code >>>
define new shared variable addr             as character
                                            format "x(38)" extent 6.
define new shared variable company          as character
                                            format "x(38)" extent 6.
*Q1066540* end deleted code <<<< */
define new shared variable billto           as character
                                            format "x(38)" extent 6.
define new shared variable soldto           as character
                                            format "x(38)" extent 6.
define new shared variable termsdesc        like ct_desc.
/*Q1066540* start deleted code >>>
define new shared variable shipdate         like ih_ship_date.
define new shared variable shipdate1        like shipdate.
define new shared variable print_options    like mfc_logical initial no
                                            label "Print Features and Options".
define new shared variable base_rpt         as character.
define new shared variable override_print_hist like mfc_logical
                                            label "Override Print Inv Hist".
define new shared variable hdr_po           as character format "X(38)".
/* DEFINE VARIABLES FOR INVOICE TOTALS. */
define new shared variable resale           like cm_resale.
define new shared variable call-detail      like mfc_logical
                                            label "Print Call Invoice Detail".
define new shared variable incinv           like mfc_logical initial yes
                                            label "Include Invoices".
define new shared variable incmemo          like mfc_logical initial yes
                                            label "Include Credit Memos".
define new shared variable reprint          like mfc_logical.
define new shared variable update_invoice   like mfc_logical.
define new shared variable disc_det_key     like lngd_key1 initial "1".
define new shared variable disc_sum_key     like lngd_key1 initial "1".
define new shared variable daybookset       like dybs_code.
define new shared variable daybookset1      like dybs_code.
define new shared variable daybook_code     like dy_dy_code.
define new shared variable update_post      like mfc_logical initial yes.
define new shared variable s_eff_error      as integer format "9" no-undo
                                            label "On Effective Date Error" initial 1.
define new shared variable invoice_type     as character.
define new shared variable form_code        as character format "x(2)" label "Form Code" no-undo.
*Q1066540* end deleted code <<<< */
 
define shared variable rndmthd        like rnd_rnd_mthd.
define shared variable abs_carr_ref   as character.
define shared variable abs_fob        like so_fob.
define shared variable abs_recid      as recid.
define shared variable abs_shipvia    like so_shipvia.
define shared variable accum_wip      like tr_gl_amt.
define shared variable already_posted like glt_amt.
define shared variable auto_post      like mfc_logical label "Post Invoice".
define shared variable base_amt       like ar_amt.
define shared variable first_batch    like ar_batch.
define shared variable batch          like ar_batch.
define shared variable batch_tot      like glt_amt.
define shared variable bill           like so_bill.
define shared variable bill1          like so_bill.
define shared variable change_db      like mfc_logical.
define shared variable consolidate    like mfc_logical
                                      label "Consolidate Invoices".
define shared variable cr_amt         as decimal format "->>>,>>>,>>>.99"
                                      label "Credit".
define shared variable cr_proj        like trgl_cr_proj.
define shared variable curr_amt       like glt_amt.
define shared variable cust           like so_cust.
define shared variable cust1          like so_cust.
define shared variable desc1          like pt_desc1 format "x(49)".
define shared variable dr_amt         as decimal format "->>>,>>>,>>>.99"
                                      label "Debit".
define shared variable eff_date       like glt_effdate label  "Effective".
define shared variable exch_rate      like exr_rate.
define shared variable exch_rate2     like exr_rate2.
define shared variable exch_ratetype  like exr_ratetype.
define shared variable exch_exru_seq  like exru_seq.
define shared variable ext_cost       like sod_price.
define shared variable ext_disc       as decimal decimals 2.
define shared variable ext_list       like sod_list_pr decimals 2.
define shared variable ext_price      as decimal label "Ext Price"
                                      decimals 2 format "->>>>,>>>,>>9.99".
define shared variable freight_ok     like mfc_logical.
define shared variable gl_amt         like sod_fr_chg.
define shared variable gl_sum         like mfc_logical format "Consolidated/Detail"
                                      initial yes.
define shared variable gr_margin      like sod_price label "Unit Margin"
                                      format "->>>>,>>9.99".
define shared variable ext_gr_margin  like gr_margin label "Ext Margin".
define shared variable base_price     like ext_price.
define shared variable base_margin    like ext_gr_margin.
define shared variable global_recid   as recid.
define shared variable inv_only       like mfc_logical initial yes.
define shared variable inv            like ar_nbr label "Invoice".
define shared variable inv1           like ar_nbr label "To".
define shared variable loc            like pt_loc.
define shared variable lotserial_total like tr_qty_chg.
define shared variable name           like ad_name.
define shared variable nbr            like tr_nbr.
define shared variable net_list       like sod_list_pr.
define shared variable net_price      like sod_price.
define shared variable old_ft_type    as character.
define shared variable order_nbrs     as character extent 30.
define shared variable order_nbr_list as character no-undo.
define shared variable order_ct       as integer.
define shared variable part           as character format "x(18)".
define shared variable post           like mfc_logical.
define shared variable post_entity    like ar_entity.
define shared variable print_lotserials like mfc_logical
                                        label "Print Lot/Serial Numbers Shipped".
define shared variable que-doc        as logical.
define shared variable qty            as decimal.
define shared variable qty_all        like sod_qty_all.
define shared variable qty_pick       like sod_qty_pick.
define shared variable qty_bo         like sod_bo_chg.
define shared variable qty_cum_ship   like sod_qty_ship.
define shared variable qty_chg        like sod_qty_chg.
define shared variable qty_inv        like sod_qty_inv.
define shared variable qty_left       like tr_qty_chg.
define shared variable qty_open       like sod_qty_ord.
define shared variable qty_ord        like sod_qty_ord.
define shared variable qty_req        like in_qty_req.
define shared variable qty_ship       like sod_qty_ship.
define shared variable ref            like glt_ref.
define shared variable sct_recid      as recid.
define shared variable sct_recno      as recid.
define shared variable ship_db        like global_db.
define shared variable ship_dt        like so_ship_date.
define shared variable ship_line      like sod_line.
define shared variable ship_site      as character.
define shared variable ship_so        like so_nbr.
define shared variable should_be_posted like glt_amt.
define shared variable so_db          like global_db.
define shared variable so_hist        like soc_so_hist.
define shared variable so_mstr_recid  as recid.
define shared variable so_recno       as recid.
define shared variable sod_entity     like en_entity.
define shared variable sod_recno      as recid.
define shared variable std_cost       like sod_std_cost.
define shared variable tax_recno      as recid.
define shared variable tot_curr_amt   like glt_amt.
define shared variable tot_ext_cost   like sod_price.
define shared variable tot_line_disc  as decimal decimals 2.
define shared variable tr_recno       as recid.
define shared variable trgl_recno     as recid.
define shared variable trlot          like tr_lot.
define shared variable trqty          like tr_qty_chg.
define shared variable undo_all       like mfc_logical no-undo.
define shared variable wip_entity     like si_entity.
define shared variable yn             like mfc_logical.
define shared variable confirm_mode   like mfc_logical no-undo.
define shared variable rejected       like mfc_logical no-undo.
define shared variable auto_inv       like mfc_logical.
define shared variable l_undo         like mfc_logical no-undo.
/*cy1045*/ define shared variable print_inv like mfc_logical label "Print Invoices"  no-undo.
 
/* LOCAL VARIABLES */
define variable doc-type            as character.
define variable doc-ref             as character.
define variable add-ref             as character.
define variable msg-type            as character.
define variable trq-id              like trq_id.
define variable i                   as integer             no-undo.
define variable inv_ct              as integer.
define variable inv_nbrs            as character extent 30.
define variable new_inv_nbr         as character.
define variable temp_fob            like so_fob extent 30.
define variable temp_shipvia        like so_shipvia extent 30.
define variable temp_fob_list       as character           no-undo.
define variable temp_shipvia_list   as character           no-undo.
define variable inv_nbr_list        as character           no-undo.
define variable order_num           as character           no-undo.
define variable err_flag            as integer             no-undo.
define variable l_abs_pick_qty      like sod_qty_pick      no-undo.
define variable return_status       as   integer           no-undo.
define variable l_shipto            like abs_shipto        no-undo.
define variable undo_stat           like mfc_logical       no-undo.
define variable temp_so_ship        like so_ship           no-undo.
define variable temp_so_qadc01      like so__qadc01        no-undo.
define variable tmp_issueqty        like abs_qty           no-undo.
define variable tmp_shipqty         like abs_qty           no-undo.
define variable tmp_pickqty          like abs_qty          no-undo.
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
define variable perf_ship_qty       like sod_qty_ship      no-undo.
define variable total_sp_qty        like sod_qty_ship      no-undo.
define variable shipperid           like abs_id            no-undo.
define variable l_increment         like mfc_logical       no-undo.
define variable l_cur_tax_amt       like tx2d_cur_tax_amt  no-undo.
define variable l_po_schd_nbr       like sod_contr_id      no-undo.
define variable l_remote-base-curr  like gl_base_curr      no-undo.
define variable l_exch-rate         like exr_rate          no-undo.
define variable l_exch-rate2        like exr_rate2         no-undo.
define variable l_is_DOM            like mfc_logical       no-undo.
define variable fromEDI             as logical initial no  no-undo.
define variable level               as integer initial 1   no-undo.
define variable first_time          as logical initial yes no-undo.
define variable vba_recno           as recid               no-undo.
/*cy1021*/ def var cancel_bo        as logical.
 
{us/rc/rcsois.i} /*Q1066540*/ 

/* CONSIGNMENT VARIABLES */
{us/so/socnvars.i}
using_cust_consignment = consignment.
 
/* DEFINE BUFFERS */
define buffer abs_work for abs_mstr.
define buffer abs_comp for abs_mstr.
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
 
define new shared temp-table work_trnbr no-undo
   field work_sod_nbr  like sod_nbr
   field work_sod_line like sod_line
   field work_tr_recid  like tr_trnbr
index work_sod_nbr work_sod_nbr ascending.
 
/* SHARED TEMP-TABLE TO COMPUTE THE QUANTITY IN rcinvchk.p */
/* TO CHECK AGAINST THE INVENTORY AVAILABLE FOR THAT ITEM  */
define new shared temp-table compute_ldd               no-undo
   field compute_site   like work_abs_mstr.abs_site
   field compute_loc    like work_abs_mstr.abs_loc
   field compute_lot    like work_abs_mstr.abs_lotser
   field compute_item   like work_abs_mstr.abs_item
   field compute_ref    like work_abs_mstr.abs_ref
   field compute_qty    like work_abs_mstr.abs_qty
   field compute_lineid like work_abs_mstr.abs_id
   index compute_index compute_site compute_item
         compute_loc   compute_lot  compute_ref.
 
define new shared temp-table consolidated-so
   field cs-so-nbr   like so_nbr
   field cs-trl1-cd  like so_trl1_cd
   field cs-trl2-cd  like so_trl2_cd
   field cs-trl3-cd  like so_trl3_cd
   field cs-trl1-amt like so_trl1_amt
   field cs-trl2-amt like so_trl2_amt
   field cs-trl3-amt like so_trl3_amt
   field cs-added    as logical
index cs-primary is unique primary cs-so-nbr.
 
define temp-table temp_somstr
   field temp_so_nbr like so_nbr
   field temp_so_inv_nbr like so_inv_nbr
   field temp_so_inv_date like so_inv_date
index temp_so_nbr temp_so_nbr ascending.
 
define shared temp-table work_ldd no-undo
   field work_ldd_id  like abs_mstr.abs_id
   index work_ldd_id  work_ldd_id.
 
define temp-table tt_so_notaxdt no-undo
   field tt_sonum   like so_nbr
   index sonbr is primary unique
   tt_sonum.
 
empty temp-table compute_ldd no-error.
empty temp-table tt_so_notaxdt.
/* Euro Tool Kit definitions */
{us/et/etvar.i}
{us/et/etdcrvar.i}
{us/et/etrpvar.i}
/*Q1066540* {us/so/soivtot1.i "NEW"} /*Define variables for invoice totals.*/ */
/*Q106650*/ {us/so/soivtot1.i}  /* Define variables for invoice totals. */
 
{us/so/socurvar.i}
 
{us/gp/gpglefdf.i}
{us/bbi/gpfilev.i} /* VARIABLE DEFINITIONS FOR gpfile.i */
{us/gp/gpcmf.i}
 
/*cy1045*/ form_code = "09".
/* DETERMINE IF SHIPMENT PERFORMANCE IS INSTALLED */
for first mfc_ctrl
   where mfc_domain = global_domain
   and   mfc_field = "enable_shipment_perf"
   and   mfc_module = "ADG"
   and   mfc_logical = yes
no-lock:
   using_shipment_perf = yes.
end.
 
{us/cc/cclc.i} /* CHECK FOR ENABLEMENT OF CONTAINER AND LINE CHARGES */
 
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
 
/*cy1021*/ if available sod_det
/*cy1021*/ then do:
/*cy1021*/ {us/bbi/gprun.i ""xx1021b.p"" "(sod_nbr, output cancel_bo)"}

         assign
            sod_recno = recid(sod_det).
/*cy1021*/ end.
 
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
                  {us/bbi/gprun.i ""icedit2.p""
                     "(input ""ISS-SO"",
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
                  exch_ratetype = so_ex_ratetype
                  exch_exru_seq = so_exru_seq.
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
 
               assign
                  exch_ratetype = so_ex_ratetype
                  exch_exru_seq = 0.
 
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
/*cy1021* start added code */
                        qty_bo          = if (sod_qty_ord > 0 or not so_sched)
			                  and cancel_bo = no
                                          then
                                             sod_qty_ord - sod_qty_ship - qty_chg
                                          else
                                             0.
/*cy1021* end   added code */
/*cy1021* start deleted code >>>>>>>>>

                        qty_bo          = if sod_qty_ord > 0
                                             or not so_sched
                                          then
                                             sod_qty_ord - sod_qty_ship - qty_chg
                                          else
                                             0.
*cy1021*  end deleted code  <<<<<<<<<<<<<<<<<<<<<<<<<*/

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
/*cy1021* start deleted code  >>>>>>>>>>>>>>>>
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
*cy1021* end   deleted code  <<<<<<<<<<<<<<< */
 
/*cy1021* start added code */
                  qty_bo = if (sod_qty_ord > 0 or not so_sched)
		           and cancel_bo = no
                           then
                              sod_qty_ord - sod_qty_ship - qty_chg
                           else
                              0.
            end. /* IF SOD__QADl01 AND CONFIRM_MODE THEN */
            else
               qty_bo = if (sod_qty_ord > 0 or not so_sched)
	                and cancel_bo = no
                        then
                           sod_qty_ord - sod_qty_ship - qty_chg
                        else
                           0.
/*cy1021* end   added code */

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

/*c1334* start added code */
            /* Trial code to prevent dead-lock between xxauis.p      */
            /* and sosois.p                                          */
            /* Deadlocking will be prevented by obtaining nr_mstr    */
            /* records in the same order so grab a lock on           */
            /* nr_mstr record  ISS-FAS  here before locking          */
            /* nr_mstr record  ISS-SO                                */
            /*                                                       */

                find first nr_mstr exclusive-lock
                where nr_domain = global_domain
                and  nr_seqid = "ISS-FAS"
                no-error.
/*c1334* end   added code */
 
            {us/bbi/gprun.i ""rcsoisb.p""
               "(input recid(sod_det),
                 input auto_post,
                 input so_inv_nbr,
                 input abs_mstr.abs_id,
                 input ship_dt,
                 input abs_mstr.abs_inv_mov,
                 input abs_work.abs_id)"}
 
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
               if can-find (first mfc_ctrl
                  where mfc_domain = global_domain
                  and   mfc_field = "enable_self_bill"
                  and   mfc_seq = 2
                  and mfc_module = "ADG"
                  and mfc_logical = yes)
                  and can-find (_file where _file-name = "sbic_ctl")
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
                 input l_shipto)"}
 
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
   end.
 
   if available abs_mstr then do transaction:
      if confirm_mode then
         substring(abs_mstr.abs_status,2,1) = "y".
      else
         substring(abs_mstr.abs_status,2,1) = "".

      /* CLEAR INVOICE NUMBER ON SHIPPER DETAIL LINES TO BE LINKED TO
       * THE NEW INVOICE */
      run p_clear_line_invnbr(input abs_mstr.abs_shipfrom,
                              input abs_mstr.abs_id).
   end. /* IF AVAILABLE abs_mstr DO TRANSACTION */
 
   /* PRINT INVOICES IF WE NEED TO.  THIS SECTION  WAS  ADDED
    * FOR BRAZILIAN REQUIREMENTS.  */
   subloop:
   do transaction on error undo, leave:
 
      if auto_post or auto_inv then do:
 
         inv_ct = 0.
 
         /*FIRST ASSIGN INVOICE NUMBERS*/
         do i = 1 to order_ct:
 
            order_num = if (i <= 30) then
                           order_nbrs[i]
                        else
                           entry(i - 30,order_nbr_list).
 
            find so_mstr
               where so_domain = global_domain
               and   so_nbr = order_num
               and   so_compl_stat = ""
            exclusive-lock no-error.
 
            if (consolidate and i = 1)
               or not consolidate
            then do:
 
               assign
                  so_recno = recid(so_mstr)
                  next_inv_pre = soc_inv_pre
                  next_inv_nbr = soc_inv - 1.
 
               {us/bbi/gprun.i ""sosoina.p""}
 
               assign
                  new_inv_nbr = so_inv_nbr
                  inv_ct = inv_ct + 1.
 
               {us/bbi/gprun.i ""sorp10b.p""}
 
            end. /* IF (CONSOLIDATE AND I = 1) OR NOT CONSOLIDATE */
 
            if inv_ct <= 30 then
               inv_nbrs[inv_ct] = new_inv_nbr.
            else
               inv_nbr_list = inv_nbr_list + new_inv_nbr + ",".
 
            assign
               so_inv_nbr   = new_inv_nbr
               so_ship      = abs_mstr.abs_shipto
               so_to_inv    = yes
               so_ship_date = ship_dt
               so_print_bl  = no
               so_inv_date = eff_date.
 
            if sod_consignment  = no
               and so_tax_date  = ?
	    then do:
	       create tt_so_notaxdt.
	       tt_sonum = so_nbr.
	       so_tax_date  = ship_dt.
            end. /* IF sod_consignment */
 
         end. /* DO I = 1 TO ORDER_CT */
 
      end. /* IF AUTO_POST OR AUTO_INV THEN DO: */
 
      do on error undo, retry:
 
         if inv_ct >  0 then do:
            if auto_post then do:
 
               conso = consolidate.
 
/*d2101* start deleted code  >>>>>>>>>>>>>>>>
               {us/bbi/gprun.i ""rcsorp10.p""
                  "(input  table tt_somstr,
                    output undo_stat)"}
*d2101* end   deleted code  <<<<<<<<<<<<<<< */
/*cy1045*/ if print_inv
/*c1418*/ then do:
/*cy1045*/     auto_inv = yes.  
/*cy1045       {us/bbi/gprun.i ""rcsorp10.p"" */
/*c1226* /*cy1045*/     {us/bbi/gprun.i ""xxrcsorp10.p"" */
/*c1226* start added code >>>>   */
/*c1226*/     if not can-find(first prd_det where prd_dev = invprinter)
/*c1226*/          then do:
/*c1226*/            printseq = printseq + 1.
/*c1226*/            invp = invprinter + string(printseq, "999").
/*c1226*/          end.
/*c1226*/          else do:
/*c1226*/             invp = invprinter.
/*c1226*/          end.
/*c1603* start added code >>>>>> */
/*c1226*/     {us/bbi/gprun.i ""xxrcsorp11.p""
                  "(input  table tt_somstr,
		    input 'no',
                    output undo_stat,
		    input-output p_inv_nbr_list,
		    input-output p_inv_nbrs)"}
/*c1603* end   added code <<<<< */
/*c1603* start deleted code >>>>>
/*c1226*/     {us/bbi/gprun.i ""xxrcsorp11.p""
                  "(input  table tt_somstr,
                    output undo_stat)"}
*c1603* end deleted code <<<<, */

/*c1226* end   added code <<<<<  */

               if undo_stat then do:
 
                  /*RESET INVOICE NUMBERS SO WE CAN DO IT AGAIN IF NEEDED*/
                  do i = 1 to order_ct:
                     order_num = if (i <= 30) then
                                    order_nbrs[i]
                                 else
                                    entry(i - 30,order_nbr_list).
 
                     find so_mstr
                        where so_domain = global_domain
                        and   so_nbr = order_num
                        and   so_compl_stat = ""
                     exclusive-lock no-error.
 
                     find temp_somstr
                        where temp_so_nbr = order_num
                     no-lock no-error.
 
                     if available temp_somstr then
                        assign
                           so_inv_nbr  = temp_so_inv_nbr
                           so_inv_date = temp_so_inv_date.
                     else
                        assign
                           so_inv_nbr  = ""
                           so_inv_date = ?.
 
                     assign
                        so_to_inv   = yes
                        so_ship     = temp_so_ship
                        so__qadc01  = temp_so_qadc01.
 
                     for first tt_somstr
                        where tt_sonbr = so_nbr
                     no-lock :
                        so_to_inv = tt_sotoinv.
                     end.
 
                  end. /* do i = 1 to order_ct */
 
                  /* IF UNDO_STAT IS YES, DON'T POST THE INVOICE.  BUT */
                  /* UPDATE THE SHIPPER STATUS                         */
                  assign
                     auto_post = no
                     inv_ct    = 0.
 
                  release qad_wkfl.
                  leave subloop.
 
               end.
/*c1418*/ end.
 
            end. /* if auto_post */
         end.
 
         release soc_ctrl.
         release qad_wkfl.
 
      end. /* DO ON ERROR UNDO RETRY */
 
   end. /* SUBLOOP */
 
   if auto_post
      then do transaction:
 
      /* Posting Invoice */
      run p_display_message (input 8235, input 1).
 
      do i = 1 to inv_ct:
 
         assign
            cust1 = hi_char
            bill1 = hi_char
            inv   = if (i <= 30) then
                       inv_nbrs[i]
                    else
                       entry(i - 30,inv_nbr_list)
            inv1  = inv
            post  = yes
            gl_sum = yes
            print_lotserials = no
            undo_all = no
            insbase = no.
 
         for first svc_ctrl
            where   svc_domain = global_domain
         no-lock:
            assign
               serialsp = "S"
               nsusebom = no
               usebom   = svc_isb_bom
               needitem = svc_pt_mstr
               insbase  = svc_ship_isb.
         end.
 
         if insbase then do:
            {us/bbi/gpfildel.i &filename=global_userid + "".isb""}
            output stream prt2 to value(global_userid + ".isb").
         end. /* IF INSBASE */
 
         assign
            expcount = 999
            pageno = 0.
 
         /* Do this on the first iteration only! Otherwise you get a Progress */
         /* error message when you try to "output to" on subsequent iterations */
         if i = 1 then do:
            /* This is essentially disabling all the  */
            /* DISPLAY statements in Invoice Post     */
            if opsys = "unix" then
               output to "/dev/null".
            else
            if opsys = "msdos" or opsys = "win32" then
               output to "nul".
         end.
 
         l_increment = no.
 
         so_mstr-loop:
         for each so_mstr where so_domain = global_domain
            and so_inv_nbr    = inv
            and so_to_inv     = yes
            and so_compl_stat = ""
         no-lock
         use-index so_invoice:
            for each sod_det where sod_domain = global_domain
               and sod_nbr    = so_nbr
               and sod_compl_stat = ""
            no-lock:
 
               l_po_schd_nbr = if so_sched then
                                  sod_contr_id
                               else
                                  "".
 
               if (sod_price * sod_qty_inv) <> 0
                  or sod_disc_pct           <> 0
               then do:
                  l_increment = yes.
                  leave so_mstr-loop.
               end. /* IF (sod_list_pr * sod_qty_inv) OR ...*/
 
               run p-check(input so_nbr,
                           input so_inv_nbr,
                           output l_increment).
 
               if l_increment = yes
               then
                  leave so_mstr-loop.
 
            end. /* FOR EACH sod_det */
 
            /* TO ACCUMULATE TAX AMOUNTS OF SHIPPED SO ONLY ('13'/ '14' type) */
            for each tx2d_det
               where   tx2d_domain  = global_domain
               and    (tx2d_ref     = so_nbr
               and    (tx2d_tr_type = '13'
               or      tx2d_tr_type = '14'))
            no-lock:
               l_cur_tax_amt = l_cur_tax_amt + absolute(tx2d_cur_tax_amt).
            end.
 
            if (absolute(so_trl1_amt) + absolute(so_trl2_amt) +
                absolute(so_trl3_amt) + l_cur_tax_amt) <> 0
            then do:
               l_increment = yes.
               leave so_mstr-loop.
            end. /* IF ABSOLUTE(so_trl1_amt) + ... */
 
         end. /* FOR EACH SO_MSTR */
 
         if l_increment
         then do:
            run p_getbatch.
         end.
         else do:
            run p_getbatch.
            ref   = "".
            if first_time then
               assign
                  first_batch = batch
                  first_time = no.
         end. /* ELSE DO */
 
         /* GL TRANSACTIONS FOR FREIGHT ACCOUNTS GET CREATED         */
         /* PRIOR TO INVOICE POST, FOR CONSISTENCY WITH SO SHIPMENTS */
         undo_all = no.
 
         {us/bbi/gprun.i ""soivpst1.p"" 
                  "(input abs_recid,
                    input l_po_schd_nbr,
                    input no,
                    input yes,         /* SHIPPER CONFIRMATION POSTS INVOICE - YES */
                    input pPostFile,   /* FILE NAME TO SAVE INVOICE POSTING ERRORS */
                    input p_prtInstBase, /* PRINT INSTALL BASE REPORT */
                    output table ttisb)"}
 
         /* RESET PRINT FILE FOR INSTALLED BASE UPDATE */
         if insbase then do:
            put stream prt2 " ".
            output stream prt2 close.
         end. /* IF INSBASE */
 
         if undo_all then do:
            o_undo = true.      /* TO UNDO THE SHIPPER CONFIRMATION WHEN POSTING FAILS */
            undo progloop, leave progloop.
         end.
 
         if undo_all then do:
            run p_display_message (input 8236, input 3).
            run p_display_message (input 8237, input 1).
            pause.
            undo progloop, leave.
         end.
 
         else do:
 
            find ba_mstr
               where ba_domain = global_domain
               and   ba_batch  = batch
               and   ba_module = "SO"
            exclusive-lock no-error.
 
            if available ba_mstr then
               assign
                  ba_total  = ba_total + batch_tot
                  ba_ctrl   = ba_total
                  ba_userid = global_userid
                  ba_date   = today
                  batch_tot = 0
                  ba_status = "".
 
            release ba_mstr.
 
            /* ZERO SOD_QTY_INV IN REMOTE DOMAIN SOD RECORDS IF THERE ARE*/
            if available so_mstr then do:
               {us/bbi/gprun.i ""rcsoisd.p"" "(input so_nbr, input no)"}
            end.
         end.
      end.
 
      /* Close the output for invoice post */
      output close.

      /*RESTORE SHIP-TO'S AND INVOICE METHOD*/
      do i = 1 to order_ct:
 
         order_num = if (i <= 30) then
                        order_nbrs[i]
                     else
                        entry(i - 30,order_nbr_list).
 
         find so_mstr
            where so_domain = global_domain
            and   so_nbr = order_num
            and   so_compl_stat = ""
         exclusive-lock no-error.
 
         if available so_mstr then
            if (i <= 30) then
               assign
                  so_ship    = so__qadc01 when ( so__qadc01 <> "" )
                  so__qadc01 = ""
                  so_fob     = temp_fob[i]
                  so_shipvia = temp_shipvia[i].
            else
               assign
                  so_ship    = so__qadc01 when ( so__qadc01 <> "" )
                  so__qadc01 = ""
                  so_fob     = entry(i - 30, temp_fob_list)
                  so_shipvia = entry(i - 30, temp_shipvia_list).
 
      end.
 
      if {us/bbi/gpiswrap.i} then
         /* POSTING COMPLETE */
         run p_display_message (input 4276, input 1).
      hide message no-pause.
 
   end.
 
   /* MARK SHIPPER CONFIRMED */
   do transaction:
 
      find abs_mstr where recid(abs_mstr) = abs_recid exclusive-lock.
 
      if que-doc then do:
 
         for first ad_mstr
            where   ad_domain = global_domain
            and     ad_addr = abs_shipto
         no-lock: end.
 
         if (available ad_mstr
            and ad_edi_ctrl[1] ="e") or
            l_is_DOM
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
 
   /* CONFIRM PEGGED SHIPPER LINES */
   {us/bbi/gprun.i ""rcsois3a.p"" "(input abs_recid)"}
 
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
 
   for each tt_so_notaxdt,
      first so_mstr
         where so_domain = global_domain
	 and   so_nbr    = tt_sonum
      exclusive-lock:
         so_tax_date = ?.
   end. /* FOR EACH tt_so_notaxdt */
 
   o_undo = false.
 
end. /* progloop */
/*cy1045*/ if print_inv then auto_inv = yes.
 
/*Q1066540* start deleted code >>>
/* FORM CODE IS NOT BRAZIL THEN PRINT INVOICE IF POSTING IS OK */
if brazil_ld = no and auto_post and auto_inv and undo_all = no 
then do:
   pause 0.
   /* PRINT INVOICES */
/*cy1045*    {us/bbi/gprun.i ""rcsopspr.p""} */
/*cy1045*/   {us/bbi/gprun.i ""xxrcsopspr.p""}
   
   if p_prtInstBase
   and p_prtExtRep
   then
      {us/bbi/gprun.i ""fsprtisb.p"" "(input table ttisb)"}

end.
*Q1066540* end deleted code <<<< */
 
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
 
/*cy1044*    {us/gp/gprunmo.i &program = ""soshpso.p"" &module = "ASR" */
/*cy1044*/   {us/gp/gprunmo.i &program = ""xxsoshpso.p"" &module = "ASR"
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
               {us/bbi/gprun.i ""gpumcnv.p""
                  "(input work_abs_buff.abs__qad02,
                    input pt_um, input pt_part,
                    output trans_conv)"}
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
 
PROCEDURE p_getbatch:
/*--------------------------------------------------------------------
Purpose: Get next AR batch number
---------------------------------------------------------------------*/
 
   if can-find(first soc_ctrl
      where soc_domain = global_domain
      and   soc_ar     = yes)
   then do:
 
      /*Find or create batch number*/
      {us/bbi/gprun.i ""gpgetbat.p""
         "(input batch,
           input ""SO"",
           input ""I"",
           input 0,
           output vba_recno,
           output batch)"}
 
   end. /* IF CAN-FIND(FIRST soc_ctrl.. */
 
END PROCEDURE. /* PROCEDURE p_getbatch */
 
PROCEDURE p-check:
 
   define input  parameter ip_sod_nbr    like tt_sonbr    no-undo.
   define input  parameter ip_so_inv_nbr like so_inv_nbr  no-undo.
   define output parameter op_lupdate    like l_increment no-undo.
 
   for each work_abs_mstr
      where work_abs_mstr.abs_order = ip_sod_nbr
   no-lock:
 
      if    ((can-find (first absl_det
         where absl_det.absl_domain  = global_domain
         and   absl_abs_id           = work_abs_mstr.abs_id
         and   absl_order            = work_abs_mstr.abs_order
         and   string(absl_ord_line) = work_abs_mstr.abs_line
         and   absl_abs_shipfrom     = work_abs_mstr.abs_shipfrom
         and   absl_confirmed        = yes
         and   absl_inv_post         = no
         and   absl_lc_amt           <> 0 ))
         or
         (can-find(first absl_det
         where absl_det.absl_domain  = global_domain
         and   absl_order            = work_abs_mstr.abs_order
         and   string(absl_ord_line) = work_abs_mstr.abs_line
         and   absl_abs_shipfrom     = work_abs_mstr.abs_shipfrom
         and   absl_confirmed        = yes
         and   absl_inv_nbr          = ip_so_inv_nbr
         and   absl_inv_post         = no
         and   absl_lc_amt           <> 0 )))
 
         or ((can-find (first abscc_det
         where abscc_det.abscc_domain = global_domain
         and   abscc_abs_id          = work_abs_mstr.abs_id
         and   abscc_order           = work_abs_mstr.abs_order
         and  string(abscc_ord_line) = work_abs_mstr.abs_line
         and   abscc_abs_shipfrom    = work_abs_mstr.abs_shipfrom
         and   abscc_confirmed       = yes
         and   abscc_inv_post        = no
         and   abscc_cont_price      <> 0))
         or
         (can-find(first abscc_det
         where abscc_det.abscc_domain = global_domain
         and   abscc_order           = work_abs_mstr.abs_order
         and  string(abscc_ord_line) = work_abs_mstr.abs_line
         and   abscc_abs_shipfrom = work_abs_mstr.abs_shipfrom
         and   abscc_confirmed    = yes
         and   abscc_inv_nbr      = ip_so_inv_nbr
         and   abscc_inv_post     = no
         and   abscc_cont_price   <> 0)))
      then do:
         op_lupdate = yes .
         leave .
      end. /* IF CAN-FIND (FIRST absl_det ... */
   end. /* FOR EACH work_abs_mstr */
 
END PROCEDURE.

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

      b_abs_mstr.abs_inv_nbr = "".
      
   end.

END PROCEDURE.
