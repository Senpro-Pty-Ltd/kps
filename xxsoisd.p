/* xxsoisd.p - SALES ORDER SHIPMENT SELECT LINE QUANITIES TO SHIP             */
/* sosoisd.p - SALES ORDER SHIPMENT SELECT LINE QUANITIES TO SHIP             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoisd.p,v 1.5 2018/09/19 16:16:57 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 07/01/93   BY: JJS *GC96*                */
/*                                        (split from sosoism.p)              */
/* REVISION: 7.3      LAST MODIFIED: 07/02/93   BY: JJS *H019*                */
/* REVISION: 7.4      LAST MODIFIED: 08/13/93   BY: dpm *H069*                */
/* REVISION: 7.4      LAST MODIFIED: 08/23/93   BY: cdt *H049*                */
/* REVISION: 7.4      LAST MODIFIED: 01/21/94   BY: afs *FL52*                */
/* REVISION: 7.4      LAST MODIFIED: 02/07/94   BY: afs *FL83*                */
/* REVISION: 7.4      LAST MODIFIED: 03/08/94   BY: afs *FM79*                */
/* REVISION: 7.4      LAST MODIFIED: 04/21/94   BY: dpm *H360*                */
/* REVISION: 7.4      LAST MODIFIED: 06/16/94   BY: afs *FO97*                */
/* REVISION: 7.4      LAST MODIFIED: 07/15/94   BY: afs *FP43*                */
/* REVISION: 7.4      LAST MODIFIED: 08/29/94   BY: bcm *H494*                */
/* Oracle changes (share-locks)      09/13/94   BY: rwl *FR31*                */
/* REVISION: 7.4      LAST MODIFIED: 09/26/94   BY: ljm *GM78*                */
/* REVISION: 7.4      LAST MODIFIED: 10/05/94   BY: cdt *FS10*                */
/* REVISION: 8.5      LAST MODIFIED: 11/01/94   BY: pmf *GN31*                */
/* REVISION: 8.5      LAST MODIFIED: 11/20/94   BY: GWM *H604*                */
/* REVISION: 8.5      LAST MODIFIED: 10/05/94   by: mwd *J034*                */
/* REVISION: 8.5      LAST MODIFIED: 12/09/94   by: taf *J038*                */
/* REVISION: 8.5      LAST MODIFIED: 12/28/94   by: ktn *J041*                */
/* REVISION: 8.5      LAST MODIFIED: 01/07/95   by: smp *G0BM*                */
/* REVISION: 8.5      LAST MODIFIED: 03/06/95   BY: smp *F0LQ*                */
/* REVISION: 8.5      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 8.5      LAST MODIFIED: 05/17/95   by: sxb *J04D*                */
/*                                   08/03/95   BY: jym *G0T9*                */
/*                                   08/15/95   BY: vrn *G0V3*                */
/*                                   09/07/95   BY: jym *F0V3*                */
/*                                   09/12/95   BY: vrn *G0X3*                */
/*                                   11/30/95   BY: kjm *G1F7*                */
/*                                   11/07/95   BY: taf *J053*                */
/*                                   03/11/96   BY: wjk *J0DV*                */
/*                                   03/17/96   BY: kxn *J0FN*                */
/* REVISION: 8.5      LAST MODIFIED: 04/11/96   BY: rpw *J0HS*                */
/* REVISION: 8.5      LAST MODIFIED: 04/15/96   BY: *G1RS* Art Schain         */
/* REVISION: 7.5      LAST MODIFIED: 03/23/94   BY: *J04C* Greco Steenmetz    */
/* REVISION: 7.5      LAST MODIFIED: 06/06/94   BY: *J04C* Dennis Taylor      */
/* REVISION: 8.5      LAST MODIFIED: 04/14/95   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 12/03/95   BY: *J04C* Tom Vogten         */
/* REVISION: 8.5      LAST MODIFIED: 02/13/96   BY: *J04C* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 04/29/96   BY: *G1T4* Tony Patel         */
/* REVISION: 8.5      LAST MODIFIED: 05/14/96   BY: *G1LV* Vinay Nayak-Sujir  */
/* REVISION: 8.5      LAST MODIFIED: 06/05/96   BY: *J0QV* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: *G1Y6* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 07/09/96   BY: *J0NK* Kieu Nguyen        */
/* REVISION: 8.5      LAST MODIFIED: 07/11/96   BY: *J0VW* Tamra Farnsworth   */
/* REVISION: 8.5      LAST MODIFIED: 07/23/96   BY: *J10Q* Andy Wasilczuk     */
/* REVISION: 8.6      LAST MODIFIED: 09/24/96   BY: *K003* Forrest Mori       */
/* REVISION: 8.6      LAST MODIFIED: 01/03/97   BY: *J1CR* Sue Poland         */
/* REVISION: 8.6      LAST MODIFIED: 04/15/97   BY: *H0W3* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 05/06/97   BY: *G2MQ* Sue Poland         */
/* REVISION: 8.6      LAST MODIFIED: 07/03/97   BY: *H1B7* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 09/26/97   BY: *J21P* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 11/07/97   BY: *K15N* Jim Williams       */
/* REVISION: 8.6      LAST MODIFIED: 01/14/98   BY: *J29W* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 02/11/98   BY: *H1JL* Seema Varma        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 02/26/98   BY: *J2FY* Jim Williams       */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* REVISION: 8.6E     LAST MODIFIED: 06/30/98   BY: *J2PB* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 08/03/98   BY: *L024* Sami Kureishy      */
/* REVISION: 9.0      LAST MODIFIED: 11/11/98   BY: *M00R* Sue Poland         */
/* REVISION: 9.0      LAST MODIFIED: 12/16/98   BY: *J371* Niranjan Ranka     */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 07/13/99   BY: *J2MD* Alexander Philips  */
/* REVISION: 9.1      LAST MODIFIED: 08/27/99   BY: *J3J9* Satish Chavan      */
/* REVISION: 9.1      LAST MODIFIED: 10/27/99   BY: *N03P* Mayse Lai          */
/* REVISION: 9.1      LAST MODIFIED: 10/28/99   BY: *K240* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 05/17/00   BY: *L0XV* Kedar Deherkar     */
/* REVISION: 9.1      LAST MODIFIED: 06/30/00   BY: *N0DX* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 07/10/00   BY: *M0PQ* Falguni Dalal      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 12/14/00   BY: *M0XX* Ashwini Ghaisas    */
/* REVISION: 9.1      LAST MODIFIED: 01/11/01   BY: *M0XM* Rajesh Lokre       */
/* REVISION: 9.1      LAST MODIFIED: 10/14/00   BY: *N0WB* BalbeerS Rajput    */
/* Revision: 1.45     BY: Katie Hilbert           DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.46     BY: Russ Witt               DATE: 04/20/01  ECO: *P00J* */
/* Revision: 1.47     BY: Rajesh Thomas           DATE: 07/23/01  ECO: *M136* */
/* Revision: 1.48     BY: Hareesh V               DATE: 10/07/01  ECO: *P027* */
/* Revision: 1.49     BY: Sandeep Parab           DATE: 11/28/01  ECO: *N16L* */
/* Revision: 1.50     BY: Ed van de Gevel         DATE: 12/03/01  ECO: *N16R* */
/* Revision: 1.53     BY: Rajesh Kini             DATE: 01/28/02  ECO: *N18G* */
/* Revision: 1.54     BY: Nikita Joshi            DATE: 01/14/02  ECO: *M1MH* */
/* Revision: 1.56     BY: Manisha Sawant          DATE: 02/19/02  ECO: *N19P* */
/* Revision: 1.57     BY: Rajaneesh Sarangi       DATE: 02/21/02  ECO: *L13N* */
/* Revision: 1.59     BY: Patrick Rowan           DATE: 04/24/02  ECO: *P00G* */
/* Revision: 1.60     BY: Jean Miller             DATE: 05/10/02  ECO: *P05V* */
/* Revision: 1.62     BY: Ashish Maheshwari       DATE: 07/17/02  ECO: *N1GJ* */
/* Revision: 1.63     BY: Ed van de Gevel         DATE: 09/05/02  ECO: *P0HQ* */
/* Revision: 1.67     BY: Rajiv Ramaiah           DATE: 01/13/03  ECO: *N23Z* */
/* Revision: 1.68     BY: Shilpa Athalye          DATE: 02/20/03  ECO: *P0MZ* */
/* Revision: 1.69     BY: Subashini Bala          DATE: 02/25/03  ECO: *N28C* */
/* Revision: 1.71     BY: Narathip W.             DATE: 05/21/03  ECO: *P0S8* */
/* Revision: 1.73     BY: Paul Donnelly (SB)      DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.74     BY: Rajinder Kamra          DATE: 06/23/03  ECO: *Q003* */
/* Revision: 1.76     BY: Mercy Chittilapilly     DATE: 08/04/03  ECO: *N2DJ* */
/* Revision: 1.77     BY: Deepali Kotavadekar     DATE: 08/11/03  ECO: *P0Z8* */
/* Revision: 1.78     BY: Deepak Rao              DATE: 08/20/03  ECO: *N2K3* */
/* Revision: 1.79     BY: Deepak Rao              DATE: 09/08/03  ECO: *N2KM* */
/* Revision: 1.80     BY: Rajesh Kini             DATE: 09/26/03  ECO: *P14G* */
/* Revision: 1.81     BY: Gnanasekar              DATE: 10/13/03  ECO: *N2LK* */
/* Revision: 1.82     BY: Vinay Soman             DATE: 10/22/03  ECO: *N2M1* */
/* Revision: 1.85     BY: Vinay Soman             DATE: 10/27/03  ECO: *N2M8* */
/* Revision: 1.86     BY: Karan Motwani           DATE: 01/13/04  ECO: *P1HP* */
/* Revision: 1.87     BY: Ken Casey               DATE: 02/19/04  ECO: *N2GM* */
/* Revision: 1.88     BY: Gaurav Kerkar           DATE: 03/04/04  ECO: *P1RY* */
/* Revision: 1.92     BY: Robin McCarthy          DATE: 04/19/04  ECO: *P15V* */
/* Revision: 1.94     BY: Abhishek Jha            DATE: 07/23/04  ECO: *P2B9* */
/* Revision: 1.96     BY: Bhagyashri Shinde       DATE: 08/04/04  ECO: *P2D6* */
/* Revision: 1.97     BY: Jignesh Rachh           DATE: 12/01/04  ECO: *P2XJ* */
/* Revision: 1.99     BY: Vinod Kumar             DATE: 12/20/04  ECO: *P2TK* */
/* Revision: 1.100    BY: Alok Gupta              DATE: 02/19/05  ECO: *P372* */
/* Revision: 1.103    BY: Ed van de Gevel         DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.104    BY: Ed van de Gevel         DATE: 18/03/05  ECO: *R00F* */
/* Revision: 1.105    BY: Ed van de Gevel         DATE: 05/26/05  ECO: *P3MP* */
/* Revision: 1.108    BY: Ed van de Gevel         DATE: 05/27/05  ECO: *R01K* */
/* Revision: 1.109    BY: Vinod Kumar             DATE: 07/08/05  ECO: *Q0K1* */
/* Revision: 1.110    BY: Niranjan Ranka          DATE: 07/11/05  ECO: *R01G* */
/* Revision: 1.111    BY: Priya Idnani            DATE: 08/22/05  ECO: *P3YR* */
/* Revision: 1.112    BY: Alok Gupta              DATE: 08/29/05  ECO: *P3ZT* */
/* Revision: 1.113    BY: Bhavik Rathod           DATE: 09/20/05  ECO: *P41S* */
/* Revision: 1.114    BY: Michael Hansen          DATE: 10/04/05  ECO: *R021* */
/* Revision: 1.115    BY: Jean Miller             DATE: 01/11/06  ECO: *Q0PD* */
/* Revision: 1.116    BY: Shilpa Kamath           DATE: 04/04/06  ECO: *R03R* */
/* Revision: 1.117    BY: Shilpa Kamath           DATE: 06/12/06  ECO: *R05X* */
/* Revision: 1.118    BY: Mochesh Chandran        DATE: 09/04/06  ECO: *P54H* */
/* Revision: 1.121    BY: Aaron Luo               DATE: 04/11/07  ECO: *R0C6* */
/* Revision: 1.123    BY: Arun Nair               DATE: 04/12/07  ECO: *R08C* */
/* Revision: 1.125    BY: Yiqing Chen             DATE: 01/31/08  ECO: *R0LC* */
/* Revision: 1.126    BY: Markus Barone           DATE: 02/08/08  ECO: *R0N8* */
/* Revision: 1.129    BY: Jean Miller             DATE: 02/14/08  ECO: *P5B6* */
/* Revision: 1.131    BY: Arun Nair               DATE: 05/20/08  ECO: *R0TB* */
/* Revision: 1.133    BY: Jean Miller             DATE: 06/20/08  ECO: *R0VG* */
/* Revision: 1.134    BY: Nan Zhang               DATE: 06/20/08  ECO: *R0JS* */
/* Revision: 1.139    BY: Nan Zhang               DATE: 08/20/08  ECO: *R11Z* */
/* Revision: 1.146    BY: Dipanshu Talwar         DATE: 12/01/08  ECO: *R183* */
/* Revision: 1.147    BY: Niranjan Ranka          DATE: 10/15/08  ECO: *R19N* */
/* Revision: 1.150    BY: Niranjan Ranka          DATE: 02/04/09  ECO: *R1B0* */
/* Revision: 1.154    BY: Yizhou Mao              DATE: 02/11/09  ECO: *R1BY* */
/* Revision: 1.155    BY: Dipanshu Talwar         DATE: 04/22/09  ECO: *Q2KX* */
/* Revision: 1.156    BY: Rijoy Ravindran         DATE: 07/14/09  ECO: *Q32T* */
/* Revision: 1.158    BY: Niranjan Ranka          DATE: 11/28/09  ECO: *Q3LN* */
/* $Revision: 1.5 $ BY: Zhijun Guan             DATE: 09/09/09  ECO: *R1V9* */
/* CYB        LAST MODIFIED: 31-JAN-2012  BY: gbg *cy1021*                    */
/* CYB   LAST MODIFIED: 31-JAN-2012  BY:  gbg *c1279*                  */
/* CYB   LAST MODIFIED: 21-MAR-2012  BY:  gbg *c1285*                  */
/* CYB   LAST MODIFIED: 22-MAR-2012  BY:  gbg *c1287*                  */
/* CYB    LAST MODIFIED: 02-OCT-2012    BY:  gbg *c1348*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 22-FEB-2013    BY:  gbg *c1367*                      */
/* CYB    LAST MODIFIED: 07-MAY-2013    BY:  gbg *c1399*                      */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/* CYB    LAST MODIFIED: 2018-AUG-10    BY: gbg *k10017* Task*T1086*           */
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
/*                                                                            */
/*    Any for-each loops which go through every sod_det for a                 */
/*    so_nbr (i.e. for each sod_det where sod_nbr = so_nbr )                  */
/*    should have the following statments first in the loop.                  */
/*                                                                            */
/*       if (sorec = fsrmarec    and sod_fsm_type  <> "RMA-RCT")              */
/*       or (sorec = fsrmaship   and sod_fsm_type  <> "RMA-ISS")              */
/*       or (sorec = fssormaship and sod_fsm_type  =  "RMA-RCT")              */
/*       or (sorec = fssoship    and sod_fsm_type  <> "")                     */
/*       then next.                                                           */
/*                                                                            */
/*    this is to prevent rma receipt line from being processed                */
/*    when issue lines are processed (sas).                                   */
/*                                                                            */
/******************************************************************/

{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
{us/pp/ppprlst.i} /* PRICE LIST CONSTANTS */

/* Define Handles For the program */
{us/px/pxphdef.i ppitxr}
{us/px/pxphdef.i ppprxr}
{us/px/pxphdef.i fsclsfxr}
{us/px/pxphdef.i soldxr}
{us/px/pxphdef.i sosodxr}
{us/px/pxphdef.i caisxr}
{us/px/pxphdef.i caparaxr}
{us/px/pxphdef.i paicxr}
{us/px/pxphdef.i pafunc}
{us/px/pxphdef.i pasdxr}
{us/px/pxphdef.i sosetr}

{us/pa/paconst.i}
{us/so/socnis.i} /* CUSTOMER CONSIGNMENT SHIPMENT TEMP-TABLE DEFINITION */

{us/ca/cattdef2.i}
{us/so/sosoms.i}
/*k10017* start added code >>>>> */
def var vmessage as char.
def var stkavailok as logical.
/*k10017* end added code <<<<<< */

define temp-table tt_sod_det no-undo
   field tt_sod_nbr  like sod_nbr
   field tt_sod_line like sod_line
   field tt_pr_found as logical
   index i_sodnbr tt_sod_nbr.

define temp-table tt_ssm_sod_det no-undo
   field tt_ssm_sod_nbr     like sod_nbr
   field tt_ssm_sod_line    like sod_line
   field tt_ssm_sod_consume as   logical
   index sodLine tt_ssm_sod_nbr tt_ssm_sod_line.

define input-output parameter table for tt_consign_shipment_detail.
define output       parameter table for tt_sod_det.
define output       parameter table for tt_ssm_sod_det.
define input        parameter p-site-to like sod_site no-undo.
define input        parameter p-loc-to  like sod_loc  no-undo.
define input        parameter p-consume-shipped  as logical no-undo.
define output parameter table for tt_attr_pfvalue.
define input        parameter fill_ship_by_pack like mfc_logical no-undo.
define input-output parameter table for tt_serials.

define new shared variable sod_recno as recid.
define new shared variable so_recno as recid.
define new shared variable picking_logic  as logical label "Use Pick Logic".

/* DEFINE SHARED VARIABLE RNDMTHD FOR GPFRLWT.P */
define shared variable rndmthd like rnd_rnd_mthd.
define shared variable issue_or_receipt as character.
define shared variable total_lotserial_qty like sod_qty_chg.
define shared variable multi_entry like mfc_logical label "Multi Entry".
define shared variable site like sr_site no-undo.
define shared variable location like sr_loc no-undo.
define shared variable loc like pt_loc.
define shared variable lotserial like sr_lotser no-undo.
define shared variable lotserial_qty like sr_qty no-undo.
define shared variable trans_um like pt_um.
define shared variable trans_conv like sod_um_conv.
define shared variable transtype as character initial "ISS-SO".
define shared variable change_db like mfc_logical.
define shared variable ship_site like sod_site.
define shared variable ship_db like dc_name.
define shared variable ship_so like so_nbr.
define shared variable ship_line like sod_line.
define shared variable lotref like sr_ref format "x(8)" no-undo.
define shared variable lotserial_control as character.
define shared variable eff_date like glt_effdate label "Effective".
define shared variable undo-all like mfc_logical no-undo.
define shared variable so_mstr_recid as recid.
define shared variable so_db like dc_name.
define shared variable cline as character.
define shared variable undo-select like mfc_logical no-undo.
define shared variable freight_ok like mfc_logical.
define shared variable calc_fr like mfc_logical.
define shared variable disp_fr like mfc_logical.
define shared variable exch_rate like exr_rate.
define shared variable exch_rate2 like exr_rate2.

define variable line          like sod_line format ">>>" no-undo.
define variable yn            like mfc_logical no-undo.
define variable i             as integer no-undo.
define variable cancel_bo     like mfc_logical label "Cancel B/O" no-undo.
define variable mod_iss       like mfc_logical label "Issue Components" no-undo.
define variable err-flag        as integer no-undo.
define variable msgnbr          as integer no-undo.
define variable sav_global_type like cmt_type no-undo.
define variable detqty          like sod_qty_ord no-undo.
define variable original_db     like ship_db no-undo.
define variable new_db          like ship_db no-undo.
define variable lotnext         like wo_lot_next no-undo.
define variable lotprcpt        like wo_lot_rcpt no-undo.
define variable linked-line     like sod_line no-undo.
define variable done_entry      like mfc_logical no-undo.
define variable overissue_ok    like mfc_logical no-undo.
define variable lineid_list     as character no-undo.
define variable fr_title        as character no-undo.
define variable fac_bflush_comp as logical label "Automatic Backflush" no-undo.
define variable line_to_preissue   as logical no-undo.
define variable l_disc_pct1        as decimal no-undo.
define variable l_net_price        as decimal no-undo.
define variable l_list_price       as decimal no-undo.
define variable l_rec_no           as recid   no-undo.
define variable prev_lotserial_qty like sod_qty_chg no-undo.
define variable connect_db         like dc_name no-undo.
define variable db_undo            like mfc_logical no-undo.
define variable l_overship         as logical no-undo.
define variable l_remove_srwkfl    like mfc_logical no-undo.
define variable mc-error-number    like msg_nbr no-undo.
define variable disp_ord           as decimal no-undo.
define variable disp_ship          as decimal no-undo.
define variable ret-flag           as integer no-undo.
define variable l_sonbr            like sod_nbr no-undo.
define variable l_sod_bo_chg       like sod_bo_chg  no-undo.
define variable l_sod_fr_chg       like sod_fr_chg  no-undo.
define variable l_wo_reject        like mfc_logical no-undo.
define variable l_rej              like mfc_logical initial no no-undo.
define variable key1               as character     no-undo.
define variable ok_to_ship         as logical       no-undo.
define variable srqty              as decimal       no-undo.
define variable v_trflow_flg       as logical       no-undo.

define variable from_site       as   character   no-undo.
define variable to_site         as   character   no-undo.
define variable from_loc        as   character   no-undo.
define variable to_loc          as   character   no-undo.
define variable v_lines_found   like mfc_logical no-undo.
define variable is_lock         like mfc_logical initial no no-undo.
define variable is_active       like mfc_logical initial no no-undo.
define variable v_abs_recid     as   recid       no-undo.
define variable classificationDrill as logical   no-undo.
define variable l_loc_frm_typ      like loc_type  no-undo.
define variable l_loc_to_typ       like loc_type  no-undo.
define variable cSiteFrom     as character no-undo.
define variable cSiteTo       as character no-undo.
define variable cLocationFrom as character no-undo.
define variable cLocationTo   as character no-undo.
define variable dExcessQty as decimal no-undo.
define variable l_continue as logical no-undo.
define variable looseQty like sr_qty no-undo.

define variable l_pt_lot_ser as character no-undo.
define variable consumeShippedLine as logical no-undo.
define variable l_consumeDOReplace  as logical no-undo.

define variable dummy-time   as character format "99:99" no-undo.
define variable dummy-length as character format "999:99" no-undo.
define variable l_override         like mfc_logical no-undo.
define variable l_reallocate       like mfc_logical initial yes no-undo.
/*cy1021* start added code */
def var defaultbo     as logical.
/*cy1021* end   added code */

define variable isDOReplacementShip as logical no-undo.
define variable temp_sitefrom as character       no-undo.
define variable temp_siteto  as character        no-undo.

define variable isSerialized     as   logical    no-undo.
define variable allowOverIssue   as   logical    no-undo.
define variable failedPart       like sod_part   no-undo.
define variable l_serialized     like mfc_logical initial no no-undo.
define variable undo_sersel      as logical      no-undo.
define variable selectedQty      like sod_qty_chg   no-undo.
define variable serialStage      like ser_mstr.ser_stage no-undo.
define variable vCount           as   integer    no-undo.

define variable hasSerializedComponent    like mfc_logical initial no no-undo.
define variable isKitItem                 like mfc_logical initial no no-undo.
/* DEFINE VARIABLES USED IN GPGLEF1.P (GL CALENDAR VALIDATION) */
{us/gp/gpglefv.i}

{us/so/socnvars.i}   /* CONSIGNMENT VARIABLES. */
/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}

/* ASN API TEMP-TABLE */
{us/so/soshxt01.i}

/* update restriction */
{us/up/updaterestriction.i}

define buffer soddet for sod_det.

define new shared temp-table work_ldd                    no-undo
   field work_ldd_id  like abs_id
   index work_ldd_id  work_ldd_id.

/* DEFINING A SHARED TEMP-TABLE TO COMPUTE THE QUANTITY IN rcinvchk.p */
/* TO CHECK AGAINST THE INVENTORY AVAILABLE FOR THAT ITEM  */
define new shared temp-table compute_ldd               no-undo
   field compute_site   like abs_site
   field compute_loc    like abs_loc
   field compute_lot    like abs_lotser
   field compute_item   like abs_item
   field compute_ref    like abs_ref
   field compute_qty    like abs_qty
   field compute_lineid like abs_id
   index compute_index compute_site compute_item
         compute_loc   compute_lot  compute_ref.

define temp-table tt_filteredlines no-undo
   field tt_filtered_line like sod_line
   index ttfilteredline is primary
      tt_filtered_line.

empty temp-table compute_ldd  no-error.
empty temp-table tt_bo        no-error.
empty temp-table tt_attr_pfvalue.

assign
   issue_or_receipt = getTermLabel("ISSUE",8).

{us/so/sosois1.i}

for first mfc_ctrl
   where mfc_domain = global_domain
   and   mfc_field  = "fac_bflush_comp"
no-lock: end.

if available mfc_ctrl then
   fac_bflush_comp = mfc_logical.
else
   fac_bflush_comp = false.

picking_logic = true.

for first mfc_ctrl
   where mfc_ctrl.mfc_domain = global_domain
   and            mfc_field  = "rcc_reallocate"
no-lock:
   l_reallocate = mfc_logical.
end. /* FOR FIRST mfc_ctrl */

subscribe to "getOverride" anywhere.

for first svc_ctrl where svc_domain = global_domain no-lock: end.

form
   fac_bflush_comp    colon 40 skip
   picking_logic      colon 40
with frame ship_comps width 80 side-labels
title color normal (getFrameTitle("CONFIRM_CONFIGURED_ITEM_BACKFLUSH",60)).

if c-application-mode <> "API" then
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame ship_comps:handle).

if c-application-mode = "API" then do:

   /*
   * GET HANDLE OF API CONTROLLER
   */
   {us/bbi/gprun.i ""gpaigh.p""
      "( output apiMethodHandle,
         output apiProgramName,
         output apiMethodName,
         output apiContextString)"}

   run getSoShipHdrRecord in apiMethodHandle
      (buffer ttSoShipHdr).

   /* GET SO SHIPMENT DETAIL TEMP-TABLE */
   run getSoShipDet in apiMethodHandle
      (output table ttSoShipDet).

   /* GET SO SHIPMENT LOT SERIAL TEMP-TABLE */
   run getSoShipLotSerial in apiMethodHandle
      (output table ttSoShipLotSerial).

end. /* IF c-application-mode = "API" */

/* CHECK TO SEE IF CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
         "(input ENABLE_CUSTOMER_CONSIGNMENT,
           input 10,
           input ADG,
           input CUST_CONSIGN_CTRL_TABLE,
           output using_cust_consignment)"}

for first so_mstr where recid(so_mstr) = so_mstr_recid
no-lock: end.

/*cy1021* start added code */
find first cm_mstr no-lock
where cm_domain = global_domain
and   cm_addr = so_cust
no-error.
cancel_bo = no.
defaultbo = no.
if available cm_mstr and cm__chr07 <> "yes" 
then assign
     defaultbo = yes
     cancel_bo = yes.
/*cy1021* end   added code */
 

find cil_mstr
   where cil_mstr.cil_domain = global_domain
   and   cil_cor_so_nbr = so_nbr
no-lock no-error.
transtype = if available cil_mstr then "ISS-COR" else transtype.

/* SET FRAME TITLE TO CLEARLY INDICATE WHAT'S BEING SHIPPED */
if sorec = fsseoship then
   fr_title = getFrameTitle("MATERIAL_ORDER_LINE_ITEMS",35).
else if sorec = fsktship then
   fr_title = getFrameTitle("KIT_ASSEMBLY_LINE_ITEMS",35).
else
   fr_title = getFrameTitle("SALES_ORDER_LINE_ITEMS",35).

if change_db then do:
   {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

   assign
      connect_db = ship_db
      db_undo = no.

   run check-db-connect
      (input connect_db, input-output db_undo).

   if db_undo then undo, return.

   /* RETRIEVE BACKFLUSH FLAG FROM REMOTE DOMAIN IF NECESSARY */
   {us/bbi/gprun.i ""sobflush.p"" "(output fac_bflush_comp)"}

   {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

   assign
      connect_db = so_db
      db_undo = no.

   run check-db-connect
      (input connect_db, input-output db_undo).

   if db_undo then undo, return.

end.

line_to_preissue = false.

if (can-find (first sob_det
              where sob_domain = global_domain
              and  (sob_nbr  = so_nbr
              and   sob_site = ship_site))
              or  ship_site = "")
then do:

   for each sod_det where sod_domain = global_domain
      and sod_nbr = so_nbr
      and sod_compl_stat = ""
   no-lock:

      if sod_fa_nbr = ""
         and  sod_cfg_type <> "1"           /* Not "1" Assemble-to-Order */
         and (can-find (first sob_det
                        where sob_domain = global_domain
                        and  (sob_nbr = so_nbr
                        and   sob_line = sod_line
                        and   sob_site = ship_site))
                        or    ship_site = "")
      then do:
         /* There is at least one line we can do an automatic     */
         /* Backflush for.  That's all we wanted to know.         */
         line_to_preissue = true.
         leave.
      end.

   end.    /* for each sod_det */

end.   /* if can-find (first sob_det...) */

run hasSerializedItemInKit(input so_nbr, output hasSerializedComponent).

if available cil_mstr then do:
   if line_to_preissue then assign
      fac_bflush_comp = true
      picking_logic   = true.
end.
else do:

   if fac_bflush_comp and line_to_preissue then do:
      if c-application-mode <> "API" then do:
         if hasSerializedComponent then fac_bflush_comp = no.
         update
            fac_bflush_comp when not hasSerializedComponent
            picking_logic
         with frame ship_comps.
      end.
      else
      assign
         {us/mf/mfaiset.i
            fac_bflush_comp ttSoShipHdr.ed_auto_backflush}
         {us/mf/mfaiset.i
            picking_logic ttSoShipHdr.ed_pick_logic}.

   end. /* IF FAC_BFLUSH_COMP AND LINE_TO_PREISSUE THEN */

   if c-application-mode <> "API" then
      hide frame ship_comps no-pause.
end.

/* LINE ITEM DISPLAY FORM */
form
with frame b title color normal fr_title 4 down width 80.

if c-application-mode <> "API" then
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame b:handle).

/* RMA LINE ITEM DISPLAY FORM */
form
   sod_line
   sod_part
   sod_type
   disp_ord    format "->>>>>>9.9<<<<<<" label "Expected"
   sod_qty_chg format "->>>>>>9.9<<<<<<" label "To Receive"
   disp_ship   format "->>>>>>9.9<<<<<<" label "Received"
   sod_site
with frame f title color normal (getFrameTitle("RETURNED_LINE_ITEMS",28))
4 down width 80.

if c-application-mode <> "API" then
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame f:handle).

sod_qty_chg:label in frame f = getTermLabel("TO_RECEIVE",10).
consumeShippedLine = p-consume-shipped.
/* LINE ITEM ENTRY FORM */
form
   line           colon 13
   cancel_bo
   site           colon 50
   location       colon 67  label "Loc"
   lotserial_qty  colon 13
   lotserial      colon 50
   sod_part       colon 13
   sod_um
   lotref         colon 50
   multi_entry
   sod_desc       colon 13
   sod_req_date   colon 50  label "Req Date"
   sod_req_time   colon 67  label "Time" format "xx:xx"
   consumeShippedLine colon 50 label "Consume Shipped"
with frame c side-labels width 80.

if sorec <> fsseoship then do with frame c:
   sod_req_date:visible = no.
   sod_req_time:visible = no.
   consumeShippedLine:visible = no.
end.

if c-application-mode <> "API" then
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame c:handle).

assign
   lotnext = ""
   lotprcpt = no
   line = 1.

loop0:
repeat transaction:
   
   empty temp-table compute_ldd no-error.
   if c-application-mode = "API" and retry
      then return error return-value.

   vCount = vCount + 1.
   /* Call serial selection program if ship by pack */
   if fill_ship_by_pack = yes then do:
      if available cil_mstr and vCount = 1 then do:
         /* Only for correction order */
         for first qad_wkfl exclusive-lock 
            where qad_domain = global_domain 
            and   qad_key1 = "SOSOSSC.P" 
            and   qad_key2 = SessionUniqueID:
         end.
         if not available qad_wkfl then do:
            create qad_wkfl.
            assign
               qad_domain = global_domain
               qad_key1 = "SOSOSSC.P"
               qad_key2 = SessionUniqueID.
         end.
         release qad_wkfl.
      end.

      /* Clear allocation override records in qad_wkfl for the first time */
      if vCount = 1 then do:
         for each qad_wkfl exclusive-lock
            where qad_wkfl.qad_domain = global_domain
            and   qad_wkfl.qad_key1 = SessionUniqueID
            and   qad_wkfl.qad_key2 begins "AL":
            delete qad_wkfl.  
         end.
         release qad_wkfl.
      end.

      {us/bbi/gprun.i ""sososs.p""
       "(input  so_nbr,
         input ship_site,
         input """",
         input """",
         input 0,
         output selectedQty,
         output undo_sersel,
         input-output table tt_serials,
         input-output       table tt_bo)"}

      if available cil_mstr then do:
         for first qad_wkfl 
            where qad_domain = global_domain 
            and   qad_key1 = "SOSOSSC.P" 
            and   qad_key2 = SessionUniqueID 
         exclusive-lock:
            delete qad_wkfl.
         end.
         release qad_wkfl.
      end.
   end.

   /* Initial the temp table: filtered lines */
   empty temp-table tt_filteredlines.
   for each sod_det no-lock
      where sod_domain = global_domain
        and sod_nbr = so_nbr
        and (sod_site = ship_site or ship_site = "")
   by sod_line:
      /* adjust if it is serializaed item */
     {us/px/pxrun.i &PROC  = 'isItemSerialized'
                  &PROGRAM = 'pafunc.p'
                  &HANDLE  = ph_pafunc
                  &PARAM   = "(input sod_part,
                               output l_serialized)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}

      if l_serialized then do:
         next.
      end.

      if fill_ship_by_pack then do:
         for first tt_serials
            where tt_sod_line = sod_line
         no-lock: end.
         if available tt_serials then do:
            next.
         end.
         /* No need to care about the serial booking, it's allowed to pick loose item
            if no serial pack has been selected in the serial processing frame */
      end.
      create tt_filteredlines.
      assign
         tt_filtered_line = sod_line.
   end.

   if fac_bflush_comp and line_to_preissue
   then do:
      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

         assign
            connect_db = ship_db
            db_undo = no.

         run check-db-connect
            (input connect_db, input-output db_undo).

         if db_undo then do:
            if c-application-mode <> "API" then do:
               hide frame b.
               hide frame f.
               hide frame c.
            end. /* IF C-APPLICATION-MODE <> "API" THEN */
            undo loop0, leave loop0.
         end.
      end.
      else
         so_recno = recid(so_mstr).

/*cy1201*       {us/bbi/gprun.i ""soise05.p"" "(input so_nbr)"} */
/*cy1201*/      {us/bbi/gprun.i ""xxsoise05.p"" "(input so_nbr)"}

      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

         assign
            connect_db = so_db
            db_undo = no.

         run check-db-connect
            (input connect_db, input-output db_undo).

         if db_undo then do:
            if c-application-mode <> "API" then do:
               hide frame b.
               hide frame f.
               hide frame c.
            end. /* IF C-APPLICATION-MODE <> "API" THEN */
            undo loop0, leave loop0.
         end.
      end.
   end.

/*c1287** start added code */
         for each sod_det no-lock
            where sod_domain = global_domain
            and   sod_nbr = so_nbr
            and   sod_line >= line
            and  (sod_site = ship_site or ship_site = "")
            and  sod_compl_stat = ""
         by sod_line:

            /* Consider skipping this record based on something */
            if (sorec = fsrmarec and sod_rma_type  <> "I")
               or (sorec = fsrmaship and sod_rma_type  <> "O")
               or (sorec = fssormaship and sod_rma_type  =  "I")
               or (sorec = fssoship    and sod_fsm_type  <> "")
            then next.
                 find first cm_mstr no-lock
                 where cm_domain = global_domain
                 and   cm_addr = so_cust
                 no-error.
                 cancel_bo = yes.
                 if available cm_mstr and cm__chr07 = "yes" then cancel_bo = no.
/*cy1021*/        {us/bbi/gprun.i ""xxsoisx.p"" 
                             "(recid(sod_det),
			      cancel_bo)"}
         end.
/*c1287** end added code */

   /* DISPLAY DETAIL */
   repeat:

      if c-application-mode = "API" and retry
         then return error return-value.

      if c-application-mode = "API" then do:

         find next ttSoShipDet no-lock no-error.
         if not available ttSoShipDet then leave.
      end.

      if c-application-mode <> "API" then do:
         clear frame b all no-pause.
         clear frame c no-pause.
         clear frame f all no-pause.

         if sorec = fsrmarec then
            view frame f.
         else
            view frame b.

         view frame c.
      end. /* IF C-APPLICATION-MODE <> "API" THEN */

      if not can-find(first sod_det
         where sod_domain = global_domain
         and   sod_nbr = so_nbr
         and   sod_compl_stat = "")
      then do:
         {us/bbi/pxmsg.i &MSGNUM=611 &ERRORLEVEL=2}  /* Order has no line items */
         if batchrun
         then
            undo loop0, leave loop0.
         else
            leave.
      end.

      /* Display order detail */
      /* FACILITATES ONE LINE SHIPMENT DURING CIM PROCESS */
      if execname = "sosois.p"
         and batchrun
      then do:
         for first sod_det where sod_domain = global_domain
            and  sod_nbr  = so_nbr
            and  sod_line = line
            and (sod_site = ship_site or ship_site = "")
            and  sod_compl_stat = ""
         no-lock: end.
      end. /* IF execname = "sosois.p" ... */

      else do:
/*cy1021* start added code  Preset Backorder Values */
         for each sod_det no-lock
            where sod_domain = global_domain
            and   sod_nbr = so_nbr
            and   sod_line >= line
            and  (sod_site = ship_site or ship_site = "")
            and  sod_compl_stat = ""
         by sod_line:
            /* Consider skipping this record based on something */
            if (sorec = fsrmarec and sod_rma_type  <> "I")
               or (sorec = fsrmaship and sod_rma_type  <> "O")
               or (sorec = fssormaship and sod_rma_type  =  "I")
               or (sorec = fssoship    and sod_fsm_type  <> "")
            then next.

            /* Use different display if receiving against an RMA */
            if  sorec = fsrmarec then do:

               assign
                  disp_ord  = sod_qty_ord * -1.0
                  disp_ship = sod_qty_ship * -1.0.


            end. /* if fsrmarec */

            else do:
               /* IF THE SO IS CREATED BY DEPOT ORDER FROM SSM, THEN DO NOT */
               /* DISPLAY THE REPLACE TYPE OF LINE IN THE MIDDLE FRAME */
               /* THIS WILL BE EXECUTED WHEN USER TRY TO SHIP DEPOT ORDER */
               /* ALSO DON'T ALLOW LINES WHICH ARE NOT COMPLETE */
               if sorec = fssodoship then
                  if can-find(first itm_det where itm_domain = global_domain
                                            and   itm_nbr    = sod_nbr
                                            and   itm_line   = sod_line
                                            and   (itm_repair_type = "2" or /* Replace */
                                                   itm_status <> svc_comp_status)
                             )
                  then
                     next.

               for first tt_bo where tt_bo.tt_sod_line = sod_line
               no-lock: end.

               if not available tt_bo
               then do:
                  create tt_bo.

                  tt_bo.tt_sod_line = sod_line.
                  if sod_line = line
                     and cancel_bo
                  then
                     tt_bo.tt_cancel_bo = yes.
                  else
                     tt_bo.tt_cancel_bo = defaultbo.

               end. /* IF NOT AVAILABLE tt_bo */

               /* THE BACKORDER QUANTITY SHOULD BE DISPLAYED AS ZERO */
               /* FOR OVERISSUES WHEN CANCEL B/O IS YES              */
/*cy1021* start added code */
               if tt_bo.tt_cancel_bo and sod_bo_chg > 0 
               then do:
                  {us/bbi/gprun.i ""xxsoisbo.p"" "(recid(sod_det))"}
               end.
/*cy1021* end   added code */

               if tt_bo.tt_cancel_bo and sod_bo_chg <> 0 
               then do:
                  {us/bbi/gprun.i ""xxsoisbo.p"" "(recid(sod_det))"}
                  l_sod_bo_chg = 0.0.
               end.
               else
                     l_sod_bo_chg = sod_bo_chg.


            end. /* if not fsrmarec */

         end.  /* Preset Back Order Values */
/*cy1021* end added code */

         for each sod_det no-lock
            where sod_domain = global_domain
            and   sod_nbr = so_nbr
            and   sod_line >= line
            and  (sod_site = ship_site or ship_site = "")
            and  sod_compl_stat = ""
         by sod_line:

            /* Consider skipping this record based on something */
            if (sorec = fsrmarec and sod_rma_type  <> "I")
               or (sorec = fsrmaship and sod_rma_type  <> "O")
               or (sorec = fssormaship and sod_rma_type  =  "I")
               or (sorec = fssoship    and sod_fsm_type  <> "")
            then next.
            /* Use different display if receiving against an RMA */
            if  sorec = fsrmarec then do:

               assign
                  disp_ord  = sod_qty_ord * -1.0
                  disp_ship = sod_qty_ship * -1.0.

               if c-application-mode <> "API" then do:

                  display
                     sod_line
                     sod_part
                     sod_type
                     disp_ord     format "->>>>>>9.9<<<<<<" label "Expected"
                     sod_qty_chg  format "->>>>>>9.9<<<<<<" label "To Receive"
                     disp_ship    format "->>>>>>9.9<<<<<<" label "Received"
                     sod_site
                  with frame f.

                  if frame-line(f) = frame-down(f) then leave.
                  down 1 with frame f.
               end. /* IF C-APPLICATION-MODE <> "API" THEN */

            end. /* if fsrmarec */

            else do:
               /* IF THE SO IS CREATED BY DEPOT ORDER FROM SSM, THEN DO NOT */
               /* DISPLAY THE REPLACE TYPE OF LINE IN THE MIDDLE FRAME */
               /* THIS WILL BE EXECUTED WHEN USER TRY TO SHIP DEPOT ORDER */
               /* ALSO DON'T ALLOW LINES WHICH ARE NOT COMPLETE */
               if sorec = fssodoship then
                  if can-find(first itm_det where itm_domain = global_domain
                                            and   itm_nbr    = sod_nbr
                                            and   itm_line   = sod_line
                                            and   (itm_repair_type = "2" or /* Replace */
                                                   itm_status <> svc_comp_status)
                             )
                  then
                     next.

               for first tt_bo where tt_bo.tt_sod_line = sod_line
               no-lock: end.

               if not available tt_bo
               then do:
                  create tt_bo.
                  tt_bo.tt_sod_line = sod_line.

                  if sod_line = line
                     and cancel_bo
                  then
                     tt_bo.tt_cancel_bo = yes.
                  else
                     tt_bo.tt_cancel_bo = no.

               end. /* IF NOT AVAILABLE tt_bo */

               /* THE BACKORDER QUANTITY SHOULD BE DISPLAYED AS ZERO */
               /* FOR OVERISSUES WHEN CANCEL B/O IS YES              */
               if  tt_bo.tt_cancel_bo and sod_bo_chg < 0
               then
                  l_sod_bo_chg = 0.
               else
                  l_sod_bo_chg = sod_bo_chg.

               if c-application-mode <> "API" then do:
                  display
                     sod_line      at 1
                     sod_part      at 5 
                     sod_type      at 23
                     sod_qty_all   at 25 format "->>>>>>9.9<<<<<<" label "Allocated"
                     sod_qty_pick  at 36 format "->>>>>>9.9<<<<<<" label "Picked"
                     sod_qty_chg   at 46 format "->>>>>>9.9<<<<<<" label "To Ship"
                     l_sod_bo_chg  at 57 format "->>>>>>9.9<<<<<<" label "Backorder"
                     sod_um        label "UM"
                     sod_site
                  with frame b.

                  if frame-line(b) = frame-down(b) then leave.
                  down 1 with frame b.
               end. /* IF-C-APPLICATION-MODE <> "API" THEN */

            end. /* if not fsrmarec */

         end.  /* Display order detail */

      end. /* ELSE DO */

      line = 0.

      do on error undo, retry:

         if c-application-mode = "API" and retry
            then return error return-value.

         /* us/bbi/gpiswrap.i QUERIES THE SESSION PARAMETER FOR */
         /* THE MFGWRAPPER TAG                           */
         if not {us/bbi/gpiswrap.i}
         then
            input clear.

         cancel_bo = no.

/*cy1021*/ cancel_bo = defaultbo.


         if c-application-mode <> "API" then do:
/*cy1021*/ uploopa:
/*cy1021*/ repeat:
            update line cancel_bo with frame c width 80
            editing:

               /* TO SHOW SO LINES FOR SELECTED SO IN CHAR AND GUI */
               /* USING LOOK-UP OR DRILL DOWN BROWSE ON LINE FIELD.  */
               {us/gp/gpbrparm.i &browse=gpbr241.p &parm=c-brparm1 &val="so_nbr"}
               {us/gp/gpbrparm.i &browse=gplu241.p &parm=c-brparm1 &val="so_nbr"}

               l_sonbr = so_nbr.

               if frame-field = "line" then do:

                  {us/mf/mfnp.i tt_filteredlines line "tt_filtered_line " 
                     line tt_filtered_line ttfilteredline}

                  if recno <> ? then do:
                     for first sod_det
                        where sod_domain = global_domain
                          and sod_nbr = so_nbr
                          and sod_line = tt_filtered_line
                     no-lock: end.

                     if not available sod_det
                     then
                        leave.
                     
                     line = sod_line.

                     for first pt_mstr
                        where   pt_domain = global_domain
                        and     pt_part = sod_part
                     no-lock: end.

                     display
                        line
                        sod_part
                        sod_desc
                        sod_um
                     with frame c.

                     if sorec = fsseoship then do:
                        display sod_req_date
                                sod_req_time
                        with frame c.
                     end. /* if sorec = fsseoship */

                     if available pt_mstr then
                        display pt_desc1 @ sod_desc with frame c.
                  end.

               end.
               else do:
                  status input.
                  readkey.
                  apply lastkey.
               end.

            end.

/*cy1021*/  leave uploopa.
/*cy1021*/ end.  /* uploopa*/
/*cy1021*/ if keyfunction(lastkey) = "end-error" then leave.




            status input.
         end. /* IF C-APPLICATION-MODE <> "API" THEN */
         else
            assign
               {us/mf/mfaiset.i line integer(ttSoShipDet.line)}
               {us/mf/mfaiset.i cancel_bo ttSoShipDet.ed_cncl_backord}.

         if line = 0 then leave.

         find sod_det where sod_domain = global_domain
            and sod_nbr = so_nbr
            and sod_line = line
         exclusive-lock no-error.

         if not available sod_det then do:
            /* Line item does not exist */
            {us/bbi/pxmsg.i &MSGNUM=45 &ERRORLEVEL=3}
            if batchrun then
               undo loop0, leave loop0.
            else
               undo, retry.
         end.


/*c1348* start added code */
	 if sod_type = ""
	 then do:
            find first pt_mstr no-lock
	    where pt_domain = global_domain
	    and   pt_part = sod_part
	    no-error.
	    if available pt_mstr
	    and  pt_cfg_type = "2"
	    and  sod_qty_all <> 0
	    then do:
                find first in_mstr
		where in_domain = global_domain
		and   in_site = sod_site
		and   in_part = pt_part
		exclusive-lock no-error.
		if available in_mstr
		then in_qty_all = 0.0.
		sod_qty_all = 0.
	    end.
	 end.
/*c1348* end   added code */



         {us/gp/gpbrparm.i &browse=calu022.p &parm=c-brparm1 &val=string(sod_det.oid_sod_det)}
         {us/gp/gpbrparm.i &browse=calu023.p &parm=c-brparm1 &val=string(sod_det.oid_sod_det)}
         {us/gp/gpbrparm.i &browse=calu024.p &parm=c-brparm1 &val=string(sod_det.oid_sod_det)}

         /* DO NOT PERFORM THIS CHECK FOR DEPOT ORDER */
         if sorec <> fssodoship
            and sod_type     = ""
            and sod_fsm_type = "RMA-ISS"
            and not ({us/px/pxfunct.i &FUNCTION = 'IsValidProductLine' 
                                           &PROGRAM = 'ppprxr.p'
                                           &PARAM = "(sod_prodline)"})
         then do:
            /* Product line does not exist */
            {us/bbi/pxmsg.i &MSGNUM=59 &ERRORLEVEL=4}
            if batchrun then
               undo loop0, leave loop0.
            else
               undo, retry.
         end.

         isDOReplacementShip = no.
         /* SINCE us/mf/mfnp01.i COULD NOT BE CHANGED,SO THAT IT WON'T SHOW */
         /* DEPOT ORDER REPLACE LINE, FOLLOWING CHECK HAS TO BE DONE */
         /* TO PREVENT THE REPLACE LINE FROM SHIPPING */
         /* ALSO IF THE SELECTED LINE IS NOT COMPLETE THEN DON'T PROCEED */
         if sorec = fssodoship then do:
            if can-find(first itm_det where itm_domain = global_domain
                                      and   itm_nbr    = sod_nbr
                                      and   itm_line   = sod_line
                                      and   itm_repair_type = "2" /* Replace */
                       )
            then do:
               /* LINE TYPE REPLACE CANNOT BE SHIPPED */
               {us/bbi/pxmsg.i &MSGNUM=8861 &ERRORLEVEL=3}
               if batchrun then
                  undo loop0, leave loop0.
               else
                  undo, retry.
            end.
            if can-find(first itm_det where itm_domain = global_domain
                                      and   itm_nbr    = sod_nbr
                                      and   itm_line   = sod_line
                                      and   itm_status <> svc_comp_status
                       )
            then do:
               /* LINE STATUS IS NOT COMPLETE */
               {us/bbi/pxmsg.i &MSGNUM=8852 &ERRORLEVEL=3}
               if batchrun then
                  undo loop0, leave loop0.
               else
                  undo, retry.
            end.

            /* DO NOT ALLOW TO SHIP IF THERE ARE OPEN MO */
            if can-find(first itm_det where itm_domain = global_domain
                                      and   itm_nbr    = sod_nbr
                                      and   itm_line   = sod_line
                                      and   itm_repair_type <> "3" /* Replacement */
                       )
            then do:
               if can-find(first soddet where soddet.sod_domain = global_domain
                                        and soddet.sod_ca_nbr  =  sod_det.sod_nbr
                                        and soddet.sod_ca_line =  sod_det.sod_line
                                        and soddet.sod_qty_ord <>
                                            soddet.sod_qty_cons + soddet.sod_qty_ret
                                        and soddet.sod_compl_stat = ""
                          )
               then do:
                  /* Open MO's exist */
                  {us/bbi/pxmsg.i &MSGNUM=783 &ERRORLEVEL=3}
                  if batchrun then
                     undo loop0, leave loop0.
                  else
                     undo, retry.
               end.
            end.
            else do:
               isDOReplacementShip = yes.
               if can-find(first soddet where soddet.sod_domain = global_domain
                                          and soddet.sod_ca_nbr  =  sod_det.sod_nbr
                                          and soddet.sod_ca_line =  sod_det.sod_line
                                          and soddet.sod_qty_ord > soddet.sod_qty_ship
                                          and soddet.sod_compl_stat = ""
                          )
               then do:
                  /* Please ship the Material Order */
                  {us/bbi/pxmsg.i &MSGNUM=10971 &ERRORLEVEL=3}
                  if batchrun then
                     undo loop0, leave loop0.
                  else
                     undo, retry.
               end.
            end. /* else do: */
         end. /* if sorec = fssodoship */

/*k10017* start added code >>>>> */
	 /**********
         if not can-find(first ld_det
                where ld_domain = global_domain
		and   ld_part = sod_part
		and   ld_site = sod_site
		and   ld_loc = sod_loc
		and   ld_qty_oh >= sod_qty_ord - sod_qty_ship)
	 ************/

         {us/bbi/gprun.i ""xxdfstk1a.p""
                         "(recid(so_mstr),
                           recid(sod_det),
                           output stkavailok)"}

	 if not stkavailok
         then do:
            vmessage = "Insufficent stock in default location " + sod_loc.
            {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
            if batchrun then undo loop0, leave loop0. else undo, retry.
         end.
/*k10017* end added code <<<<<< */


         if sod_compl_stat <> "" then do:
            /* Sales order line is Closed */
            {us/bbi/pxmsg.i &MSGNUM=8025 &ERRORLEVEL=3}
            if batchrun then
               undo loop0, leave loop0.
            else
               undo, retry.
         end.

         if not sod_confirm then do:
            /* Sales order line has not been confirmed */
            {us/bbi/pxmsg.i &MSGNUM=646 &ERRORLEVEL=3}
            if batchrun then
               undo loop0, leave loop0.
            else
               undo, retry.
         end.

         /* CHECK IF WORK ORDER IS RELEASED OR ALLOCATED */
         /* FOR ATO CONFIGURED ITEMS                     */
         l_wo_reject = no.
         if sod_lot <> "" then do:

            for first wo_mstr
               where wo_domain = global_domain
               and   wo_lot    = sod_lot
            no-lock:

               if lookup(wo_status, "A,R,C") = 0 then
                  l_wo_reject = yes.
            end. /* FOR FIRST wo_mstr */
         end. /* IF sod_lot <> "" */
         else do:

            if sod_fa_nbr <> "" then do:

               for first wo_mstr
                  where wo_domain = global_domain
                    and wo_nbr    = sod_fa_nbr
                    and lookup(wo_status, "A,R,C") = 0
               no-lock:
                  l_wo_reject = yes.
               end. /* FOR FIRST wo_mstr */

            end. /* IF sod_fa_nbr <> "" */
         end. /* ELSE */

         if l_wo_reject = yes then do:

            /* WORK ORDER ID IS CLOSED, PLANNED OR */
            /* FIRM PLANNED                        */
            run DisplayMessage(input 523,
                               input 3,
                               input '').

            /* CURRENT WORK ORDER STATUS: */
            run DisplayMessage(input 525,
                               input 1,
                               input wo_status).

            undo, retry.

         end. /* IF l_wo_reject = yes */

         msgnbr = 0.
         if  sorec = fsrmarec and sod_rma_type <> "I"
         then
            msgnbr = 7228.  /* CANNOT PROCESS ISSUES */

         if (sorec = fsrmaship     or
             sorec = fssoship      or
             sorec = fssormaship) and
             sod_rma_type = "I"
         then
            msgnbr = 7227.  /* CANNOT PROCESS RETURNS */

         /* STOP PROCESSING DIR-SHIP EMT RMA ISSUE LINES.      */
         /* ONLY TRANSSHIPMENT RMA ISSUE LINES CAN BE SHIPPED. */
         if sorec = fsrmaship   and    
            sod_rma_type = "O" and
            sod_btb_type = "03"
         then
            /* SHIPMENT NOT ALLOWED FOR DIR-SHIP EMT SALES ORDER */
            msgnbr = 3985. 

         /* STOP PROCESSING TRANSSHIPMENT ORDER LINE IF IT HAS NOT BEEN */
         /* FULFILLED BY THE SECONDARY BUSINESS UNIT.                   */
         if sorec = fsrmaship   and    
            sod_rma_type = "O"  and
            sod_btb_type = "02" and
            sod_qty_all  = 0 
         then
            /* CHANGE ON EMT ORDER WITH PENDING CHANGE IS NOT ALLOWED */
            msgnbr = 2834. 

         if  msgnbr <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=msgnbr &ERRORLEVEL=3}
            if batchrun
            then
               undo loop0, leave loop0.
            else
               undo, retry.
         end.

         if ship_site <> "" and sod_site  <> ship_site
         then do:
            /* SITE OF THE LINE DOES NOT MATCH ... */
            {us/bbi/pxmsg.i &MSGNUM=4573 &ERRORLEVEL=3}
            if batchrun then
               undo loop0, leave loop0.
            else
               undo, retry.
         end. /* IF ship_site <> "" */

         run isKitItem(input sod_part, output isKitItem).
         /* Check if the item is serialized item */
         l_serialized = no.
         {us/px/pxrun.i &PROC = 'isItemSerialized'
               &PROGRAM = 'pafunc.p'
               &HANDLE = ph_pafunc
               &PARAM = "(input sod_part,
                        output l_serialized)"
               &NOAPPERROR = true
               &CATCHERROR = true} 

         if not isKitItem then do:
            /* If it's not serialized item, check if any serial pack has been selected for the item */
            if l_serialized then do:
               for first tt_serials
                  where tt_serials.tt_sod_line = line
               no-lock: end.
               if available tt_serials and c-application-mode = "API"
               then do:
                  next.
               end.
               /* Item with Serial Control: Mandatory */ 
               {us/bbi/pxmsg.i &MSGNUM=13762 &ERRORLEVEL=3}
            end.
            else do:
               /* If the line has been shipped through package then could not select */
               if available cil_mstr then do:
                  /* Initialize tt_inv_serial temp_table */
                  empty temp-table tt_inv_serials.
                  {us/px/pxrun.i &PROC  = 'getSerialByInvAndOrd' &PROGRAM = 'sosetr.p'
                                 &HANDLE = ph_sosetr
                                 &PARAM = "(input cil_mstr.cil_prev_inv,
                                            input cil_mstr.cil_prev_so_nbr,
                                            input-output table tt_inv_serials)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true}
                  if can-find(first tt_inv_serials
                              where tt_inv_serials.tt_serial_line = line) then do:
                     if c-application-mode = "API" then do:
                        next.
                     end.
                     /* Current line was already "Ship by Pack" */
                     {us/bbi/pxmsg.i &MSGNUM=13763 &ERRORLEVEL=3}
                     l_serialized = yes.
                  end.
               end.
               else do:
                  for first tt_serials
                     where tt_serials.tt_sod_line = line
                  no-lock: end.
                  if available tt_serials
                  then do:
                     l_serialized = yes.
                     if c-application-mode = "API" then do:
                        next.
                     end.

                     /* Check serial stage */
                     for first ser_mstr no-lock
                        where ser_mstr.ser_domain = global_domain
                        and   ser_mstr.ser_serial_id = tt_serials.tt_master_serial_id:
                        assign serialStage = ser_mstr.ser_stage.
                     end.

                     if serialStage = {&SER-STAGE-ACTIVE} then do:
                        /* Current line was already "Ship by Pack" */
                        {us/bbi/pxmsg.i &MSGNUM=13763 &ERRORLEVEL=3}
                     end.
                     else do:
                        /* Current line was already "Receive by Pack" */
                        {us/bbi/pxmsg.i &MSGNUM=14310 &ERRORLEVEL=3}
                     end.
                  end.
               end.
               /* No need to care about the serial booking, it's allowed to pick loose item
                  if no serial pack has been selected in the serial processing frame */
            end.

            if l_serialized then do:
               if batchrun then
                  undo loop0, leave loop0.
               else
                  undo, retry.
            end.
 
         end. /* if not isKitItem */

         if c-application-mode <> "API" then do:
            display line sod_part sod_desc sod_um with frame c.
         end. /* IF C-APPLICATION-MODE <> "API" THEN */

         for first pt_mstr
             where pt_domain = global_domain
             and   pt_part = sod_part
         no-lock:
            if c-application-mode <> "API" then
               display pt_desc1 @ sod_desc with frame c.
         end.

         lotserial_control = "".

         /* Don't bother with Item Master for Memo items */
         if sod_type = "" then do:
            if not available pt_mstr then do:
               /* WARNING - ITEM NOT IN INVENTORY */
               {us/bbi/pxmsg.i &MSGNUM=16 &ERRORLEVEL=2}
            end.
         end.

         find first cil_mstr
            where cil_mstr.cil_domain = global_domain
            and   cil_mstr.cil_cor_so_nbr = so_nbr
         no-lock no-error.
         if available cil_mstr
            and can-find(first cild_det
               where cild_det.cild_domain = global_domain
               and   cild_cor_inv = cil_cor_inv
               and   cild_cor_so_nbr     = cil_cor_so_nbr
               and   cild_cor_line = sod_line
               and   cild_line_type    = "R")
         then do:
            {us/bbi/pxmsg.i &MSGNUM=5370 &ERRORLEVEL=3}
            undo, retry.
         end.
      end.

      if available pt_mstr then do:
         {us/px/pxrun.i &PROC  = 'getFieldDefault'
                  &PROGRAM = 'ppitxr.p'
                  &HANDLE = ph_ppitxr
                  &PARAM = "( input  sod_part,
                              input  sod_site,
                              input ""pt_lot_ser"",
                              output lotserial_control)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
         }
      end.
      else
         lotserial_control = "".

      assign
         site                = ""
         location            = ""
         lotserial           = ""
         lotref              = ""
         lotserial_qty       = sod_qty_chg
         prev_lotserial_qty  = sod_qty_chg
         cline               = string(line)
         global_part         = sod_part
         trans_um            = sod_um
         trans_conv          = sod_um_conv
         multi_entry         = no
         consumeShippedLine  = p-consume-shipped
         sod_qty_chg         = 0
         total_lotserial_qty = 0.

      /* Fill lotserial data for MO-line */
      if sod_fsm_type = "SEO" or sorec = fssodoship then
         assign
            lotserial     = sod_serial
            site          = sod_site
            location      = sod_loc.

      /* Total previously entered ship qtys for this line */
      {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

      assign
         connect_db = ship_db
         db_undo = no.

      run check-db-connect
         (input connect_db, input-output db_undo).

      if db_undo then do:
         if c-application-mode <> "API" then do:
            hide frame b.
            hide frame f.
            hide frame c.
         end. /* IF C-APPLICATION-MODE <> "API" THEN */
         undo loop0, leave loop0.
      end.

      {us/bbi/gprun.i ""sosoiss5.p""}
      {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

      assign
         connect_db = so_db
         db_undo = no.

      run check-db-connect
         (input connect_db, input-output db_undo).

      if db_undo then do:
         if c-application-mode <> "API" then do:
            hide frame b.
            hide frame f.
            hide frame c.
         end. /* IF C-APPLICATION-MODE <> "API" THEN */
         undo loop0, leave loop0.
      end.

      /* Default to SO site if no shipments exist */
      if site = "" then
         assign
            site     = sod_site
            location = sod_loc.

      /* RMA receipt's for serialized item's are typically */
      /* for a single item. Therefore default the serial   */
      /* number, ref, and quantity for this item.          */
      if sod_serial    <> ""       and
         sod_fsm_type  = "RMA-RCT" and
         sod_rma_type  = "I"       and
         sod_qty_ord   = -1
      then
         assign
            lotserial = sod_serial
            lotserial_qty = sod_qty_ord * -1.

      {us/bbi/gprun.i ""gpsiver.p"" "(input site,
                               input ?,
                               output return_int)"}
      if return_int = 0 then do:
         /* USER DOES NOT HAVE ACCESS TO THIS SITE */
         {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
         undo, retry.
      end.

      if c-application-mode <> "API" then do:
         if sorec = fsrmarec then do:
            global_addr = sod_enduser.

            {us/px/pxrun.i &PROC='classificationDrill' &PROGRAM='fsclsfxr.p'
                     &HANDLE=ph_fsclsfxr
                     &PARAM="(output classificationDrill)"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
            if classificationDrill then do:
               {us/bbi/gprun.i ""fsclsfdr.p""}
            end.
         end. /* if sorec = fsrmarec  */
      end. /* IF C-APPLICATION-MODE <> "API" THEN */

      /* UPDATE INVENTORY LOCATION INFORMATION */
      setlot:
      do on error undo, retry:
         if c-application-mode = "API" and retry
            then return error return-value.

         /* FOR MO'S WITH KITS TO SHIP, WE DO NOT (!!!) WANT   */
         /* THE USER TO GO INTO MULTI-ENTRY MODE.  HE MUST BE  */
         /* DEALING WITH A QUANTITY OF 1, AND, IF HE HAPPENS   */
         /* TO HAVE PICKED AN INCOMPLETE KIT, WE'VE GOT AN     */
         /* EXTRA SR_WKFL HANGING AROUND (WITH SR_REV =        */
         /* SEO-DEL) TO SUPPORT THE BACKORDER REPORT THAT      */
         /* PRINTS AUTOMATICALLY FOLLOWING MO SHIPMENT TIME.   */
         if (sod_fsm_type = "SEO" and sod_type = "K") then
            multi_entry = no.

         if c-application-mode <> "API" then
            display
               site
               location
               lotserial
               multi_entry
            with frame c.

         if change_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

            assign
               connect_db = ship_db
               db_undo = no.

            run check-db-connect
               (input connect_db, input-output db_undo).

            if db_undo then do:
               if c-application-mode <> "API" then do:
                  hide frame b.
                  hide frame f.
                  hide frame c.
               end. /* IF C-APPLICATION-MODE <> "API" THEN */
               undo loop0, leave loop0.
            end.
         end.

         {us/bbi/gprun.i ""sosoiss6.p"" "(input sod_nbr, input sod_line)"}

         if change_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

            assign
               connect_db = so_db
               db_undo = no.

            run check-db-connect
               (input connect_db, input-output db_undo).

            if db_undo then do:
               if c-application-mode <> "API" then do:
                  hide frame b.
                  hide frame f.
                  hide frame c.
               end. /* IF C-APPLICATION-MODE <> "API" THEN */
               undo loop0, leave loop0.
            end.
         end.

         for first tt_bo
            where tt_bo.tt_sod_line = sod_line
         no-lock: end.

         if available tt_bo then
            tt_bo.tt_cancel_bo = cancel_bo.
            l_consumeDOReplace = isDOReplacementShip.                                                  /*      */

         /* DO THIS ONLY FOR MO SHIPMENT */
         if sorec = fsseoship then do:
            if can-find(first itm_det where itm_domain = global_domain
                                      and   itm_nbr    = sod_ca_nbr
                                      and   itm_line   = sod_ca_line
                                      and   itm_repair_type <> "3" /* Not Replacement */
                       )
            then do:
               for first tt_ssm_sod_det
                  where tt_ssm_sod_det.tt_ssm_sod_nbr = sod_nbr
                  and   tt_ssm_sod_det.tt_ssm_sod_line = sod_line
               no-lock: end.
               if available tt_ssm_sod_det then
                  consumeShippedLine = tt_ssm_sod_det.tt_ssm_sod_consume.
            end.
            else do:
               /* WHILE DOING MO SHIPMENT ALWAYS CONSUME FOR DO REPLACEMENT TYPE LINE */
          assign
          l_consumeDOReplace = yes
               consumeShippedLine = yes .                                                            /*  */
               if c-application-mode <> "API" then
                  display consumeShippedLine with frame c.
            end. /* else do: */
         end. /* if sorec = fsseoship */


         /* SIMILARLY, FOR KITS/MO'S, DO NOT LET THE USER      */
         /* UPDATE THE MULTI-ENTRY FIELD.                      */
         if c-application-mode <> "API" then do:
            display lotserial_qty with frame c.
            update
               lotserial_qty when not available cil_mstr
               site      when (isDOReplacementShip = no) and (sod_fsm_type <> "SEO" or sod_type <> "K")
               location  when (isDOReplacementShip = no) and (sod_fsm_type <> "SEO" or sod_type <> "K")
               lotserial when (isDOReplacementShip = no) and (sod_fsm_type <> "SEO" or sod_type <> "K")
               lotref    when (isDOReplacementShip = no) and (sod_fsm_type <> "SEO" or sod_type <> "K")
               multi_entry when (sod_type = "" and not multi_entry)
               sod_req_date when (sorec = fsseoship)     
               sod_req_time when (sorec = fsseoship)     
               consumeShippedLine when (l_consumeDOReplace = no) and (sorec = fsseoship and so_ca_nbr <> "") /* */               
            with frame c
            editing:
               assign
                  global_site = input site
                  global_loc  = input location
                  global_lot  = input lotserial.
               readkey.
               apply lastkey.
            end.
         end. /* IF C-APPLICATION-MODE <> "API" THEN */
         else do: /* C-APPLICATION-MODE = "API" */
            assign
               {us/mf/mfaiset.i
                  lotserial_qty ttSoShipDet.ed_sod_qty}.

            if sod_fsm_type <> "SEO" or sod_type <> "K" then do:
               assign
                  {us/mf/mfaiset.i
                     site ttSoShipDet.ed_sod_site}
                  {us/mf/mfaiset.i
                     location ttSoShipDet.ed_sod_loc}
                  {us/mf/mfaiset.i
                     lotserial ttSoShipDet.ed_sod_lotser}
                  {us/mf/mfaiset.i
                     lotref ttSoShipDet.ed_sod_ref}.

            end. /* IF SOD_FSM_TYPE <> "SEO" OR SOD_TYPE <> "K" THEN */

            if sod_type = "" and not multi_entry then
               {us/mf/mfaiset.i
                  multi_entry ttSoShipDet.ed_multi_entry}.

            assign
               {us/mf/mfaiset.i
                  global_site site}
               {us/mf/mfaiset.i
                  global_loc location}
               {us/mf/mfaiset.i
                  global_lot lotserial}.

         end. /* C-APPLICATION-MODE = "API" */
         /* CHECK FOR VALID SITE */
         if not can-find(si_mstr
            where si_domain = global_domain
            and   si_site = site)
         then do:
            {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}  /* SITE DOES NOT EXIST */
            next-prompt site with frame c.
            undo setlot, retry.
         end.

         /* CHECK SITE FOR USER GROUP AUTHORIZATION */
         {us/bbi/gprun.i ""gpsiver.p"" "(input (input site),
                                  input ?,
                                  output return_int)"}
         if return_int = 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
            /* USER DOES NOT HAVE ACCESS TO SITE */
            undo setlot, retry.
         end.

         if execname = "sosois.p"  or     /* SO Shipments */
            execname = "fsrmais.p" or     /* RMA Receipts */
            execname = "fsrmash.p" or     /* RMA Shipments */
            execname = "fseops.p"         /* Material Order Shipments */
         then do:

            /* Set the Update Restriction Library to run persistently */
            run mfairunh.p
               (input "mgurpl.p",
                input ?,
                output hUpdateRestrictedLibrary).

            /* clear out the restrictions temp table */
            empty temp-table ttUpdateRestrictionSignature.

            /*
             * Create the update restrictions temp table to pass
             * in data to the update restrictions common library
            */
            create ttUpdateRestrictionSignature.
            assign
               ttUpdateRestrictionSignature.program
                                            = execname
               ttUpdateRestrictionSignature.category
                                            = if execname = "sosois.p"
                                              then {&SOSHP}
                                              else {&SSM}
               ttUpdateRestrictionSignature.part
                                            = sod_det.sod_part
               ttUpdateRestrictionSignature.inventoryStatus       = ?
               ttUpdateRestrictionSignature.inventoryStatusTo     = ?
               ttUpdateRestrictionSignature.account               = ?
               ttUpdateRestrictionSignature.subAccount            = ?
               ttUpdateRestrictionSignature.costCenter            = ?
               ttUpdateRestrictionSignature.project               = ?
               ttUpdateRestrictionSignature.changeInventoryStatus = ?.

            /* When called from the SSM programs, we need to get the Site To */
            /* and Location To values and pass these to the                  */
            /* isUpdateRestricted function for validation.                   */
            if ttUpdateRestrictionSignature.category = {&SSM} then
            do:
               /* If RMA Receipts */
               if sorec = fsrmarec then
               do:
                  /* Get the Site From and Location From values */
                  run getSiteFromAndLocationFromValues
                         in hUpdateRestrictedLibrary
                         (input  ship_so,
                          output cSiteFrom,
                          output cLocationFrom).
                  assign
                     ttUpdateRestrictionSignature.site       = cSiteFrom
                     ttUpdateRestrictionSignature.siteTo     = global_site
                     ttUpdateRestrictionSignature.location   = cLocationFrom
                     ttUpdateRestrictionSignature.locationTo = global_loc.

               end.
               else do:

                  assign
                     ttUpdateRestrictionSignature.site     = global_site
                     ttUpdateRestrictionSignature.location = global_loc.

                  /* RMA Shipments */
                  /* We need to get the issuing Site and Location values */
                  for first rma_mstr no-lock
                      where rma_domain = global_domain
                        and rma_nbr    = sod_nbr
                        and rma_prefix = "C":
                  end.
                  if available rma_mstr then
                  do:
                     assign
                        ttUpdateRestrictionSignature.siteTo     = rma_site_rec
                        ttUpdateRestrictionSignature.locationTo = rma_loc_rec.
                  end.       /* end if available rma_mstr */
                  else do:
                     /* Material Order */
                     run getSiteToAndLocationToValues
                            in hUpdateRestrictedLibrary
                            (output cSiteTo,
                             output cLocationTo).
                     assign
                        ttUpdateRestrictionSignature.siteTo     = cSiteTo
                        ttUpdateRestrictionSignature.locationTo = cLocationTo.
                  end.
               end.
            end.
            else do:
               /* SO Shipments */
               assign
                  ttUpdateRestrictionSignature.site       = global_site
                  ttUpdateRestrictionSignature.siteTo     = ?
                  ttUpdateRestrictionSignature.location   = global_loc
                  ttUpdateRestrictionSignature.locationTo = ?.
            end.

            /* Check if the record is restricted */
            if isUpdateRestricted
               (input table ttUpdateRestrictionSignature,
                input true)
            then do:
               undo loop0, retry.
            end.

            delete procedure hUpdateRestrictedLibrary.

         end. /* end if execname...*/

         /* If ship site doesn't match original site, make sure   */
         /* Domain isn't changing at the same time (this change */
         /* Should be made in SO Maintenance so we don't have to  */
         /* Include the code here to copy the line into the       */
         /* Remote domain).                                     */
         if global_db <> "" and site <> sod_site then do:

            if sod_site <> ship_site then do:
               for first si_mstr
                  where si_domain = global_domain
                  and   si_site = sod_site
               no-lock: end.
               original_db = si_db.
            end.
            else
               original_db = ship_db.

            if site <> ship_site then do:
               for first si_mstr
                  where si_domain = global_domain
                  and   si_site   = site
               no-lock: end.
               new_db = si_db.
            end.
            else
               new_db = ship_db.

            if new_db <> original_db then do:
               /* Order line is for domain #*/
               {us/bbi/pxmsg.i &MSGNUM=6254 &ERRORLEVEL=3 &MSGARG1=original_db}
               next-prompt site with frame c.
               undo setlot, retry.
            end.
         end.

         /* If specified site is not defined ship-from site, */
         /* Make sure it's in the same domain              */
         if global_db <> "" and site <> ship_site then do:

            for first si_mstr
               where si_domain = global_domain
               and   si_site   = site
            no-lock: end.

            if si_db <> ship_db then do:
               {us/bbi/pxmsg.i &MSGNUM=6253 &ERRORLEVEL=3}
               /* All ship-from sites must be in same domain */
               next-prompt site with frame c.
               undo, retry.
            end.
         end.

         /* CHECK TO SEE IF RESERVED LOCATION EXISTS */
         /* FOR OTHER CUSTOMERS--                    */
         run check-reserved-location.

         if ret-flag = 0 then do:
            /* THIS LOCATION RESERVED FOR ANOTHER CUSTOMER */
            {us/bbi/pxmsg.i &MSGNUM=3346 &ERRORLEVEL=3}
            next-prompt location with frame c.
            undo setlot, retry.
         end.

         for first si_mstr
            where si_domain = global_domain
            and   si_site   = site
         no-lock: end.

         /* VALIDATE OPEN GL PERIOD FOR ENTITY AND DOMAIN */
         /* SPECIFIED ON THE SHIPMENT LINE. WE NEED TO DO   */
         /* DO THIS HERE BECAUSE THE SITE AND ENTITY CAN BE */
         /* DIFFERENT THAN WHAT WAS ENTERED IN FIRST FRAME. */
         if c-application-mode <> "API" then do:
            {us/gp/gpglef3.i &from_db = so_db
                       &to_db   = ship_db
                       &module  = ""IC""
                       &entity  = si_entity
                       &date    = eff_date
                       &prompt  = "site"
                       &frame   = "c"
                       &loop    = "setlot"}
         end.
         else do:
            {us/gp/gpglef4.i &from_db = so_db
                       &to_db   = ship_db
                       &module  = ""IC""
                       &entity  = si_entity
                       &date    = eff_date}
         end.


         /* GET TAX MANAGEMENT DATA ONLY IF */
         /* THE SITE HAS BEEN CHANGED       */
         if site <> sod_site and sod_taxable then do:
            undo-all = true.
            {us/bbi/gprun.i ""sosoistx.p""
                     "(input so_mstr_recid,
                       input site,
                       input sod_site,
                       input sod_fsm_type,
                       input-output sod_taxable,
                       input-output so_taxc,
                       input-output sod_tax_usage,
                       input-output sod_tax_env,
                       input-output sod_tax_in,
                       input-output undo-all)"}

            if undo-all then undo setlot, retry.
         end.

         if sorec = fsseoship then do:
            {us/bbi/gprun.i ""fstimchk.p""
            "(input  ""T"",
              input  sod_req_time,
              input  """",
              output dummy-time,
              output dummy-length,
              output msgnbr)"}

            if msgnbr <> 69 then sod_req_time = dummy-time.

            if c-application-mode <> "API" then
               display sod_req_time with frame c.
            pause 0.

            if msgnbr <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=msgnbr &ERRORLEVEL=3}
               next-prompt sod_req_time with frame c.
               undo, retry.
            end. /* if msgnbr <> 0 */
         end. /* if sorec = fsseoship */

         /* CREATE THIS ONLY WHEN IT IS MO SHIPMENT */
         if sorec = fsseoship then do:

            sod_to_ref = lotref.
            if can-find(first itm_det where itm_domain = global_domain
                                      and   itm_nbr    = sod_ca_nbr
                                      and   itm_line   = sod_ca_line
                       )
            then do:
               for first tt_ssm_sod_det
                  where tt_ssm_sod_det.tt_ssm_sod_nbr = sod_nbr
                  and   tt_ssm_sod_det.tt_ssm_sod_line = sod_line
               no-lock: end.
               if not available tt_ssm_sod_det then do:
                  create tt_ssm_sod_det.
                  assign
                     tt_ssm_sod_det.tt_ssm_sod_nbr  = sod_nbr
                     tt_ssm_sod_det.tt_ssm_sod_line = sod_line
                     tt_ssm_sod_det.tt_ssm_sod_consume = consumeShippedLine.
               end.
            end. /* if can-find(first */
         end. /* if sorec = fsseoship */

         /*  IF THIS IS SOME TYPE OF RETURN THAT WOULD LIKE TO UPDATE
          *  THE INSTALLED BASE, BUT THE PART/SERIAL/REF DOESN'T
          *  EXIST IN THE ISB, OR THE QUANTITY DOESN'T MATCH THE
          *  ISB QUANTITY, WARN THE USER */
         if not available soc_ctrl then do:
            for first soc_ctrl
               where soc_domain = global_domain
            no-lock: end.
         end.

         if multi_entry  = no
            and (sod_rma_type = "I" or soc_returns_isb)
            and sod_qty_ord < 0
            and sod_upd_isb  = yes
         then do:

            for first isb_mstr
               where isb_domain = global_domain
               and   isb_eu_nbr = sod_enduser
               and   isb_part   = sod_part
               and   isb_serial = lotserial
               and   isb_ref    = sod_ref
            no-lock:
            end. /* FOR FIRST isb_mstr */

            if  not available isb_mstr then do:
               {us/bbi/pxmsg.i &MSGNUM=7123 &ERRORLEVEL=2}
               /* ITEM DOES NOT EXIST IN INSTALLED BASE */
            end.
            else do:
               /* LOT_SERIAL_QTY NOTES:  IF YOU'RE DOING AN
                * RMA RETURN, LOTSERIAL_QTY IS POSITIVE.
                * BUT, IF YOU'RE DOING A S.O. RETURN,
                * THIS QTY IS NEGATIVE.
                *
                * WE NEED TO WARN THE USER IF THE QTY BEING
                * RETURNED IS OTHER THAN THE QTY IN THE ISB.
                * WITH THE CONDITIONS NOTED ABOVE, THIS TAKES
                * A SPECIAL CHECK, DEPENDING ON THE TYPE OF
                * RETURN BEING DONE - AN RMA OR S.O. */

               if (sorec = fsrmarec and isb_qty <> lotserial_qty)
                  or (sorec = fssoship and - (isb_qty) <> lotserial_qty)
               then do:
                  /* INSTALLED BASE QTY (#) DOESN'T MATCH ITEM QTY */
                  {us/bbi/pxmsg.i &MSGNUM=1275 &ERRORLEVEL=2
                           &MSGARG1=trim(string(isb_qty,"">,>>>,>>>,>>9.9<<""))}
               end.    /* if sorec = fsrmarec... */

            end.    /* else, available isb_mstr, do */
         end. /* if multi_entry = no and ... */

         if change_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

            assign
               connect_db = ship_db
               db_undo = no.

            run check-db-connect
               (input connect_db, input-output db_undo).

            if db_undo then do:
               if c-application-mode <> "API" then do:
                  hide frame b.
                  hide frame f.
                  hide frame c.
               end. /* IF C-APPLICATION-MODE <> "API" THEN */
               undo loop0, leave loop0.
            end.
         end.

         assign
            ship_line = line
            sod_recno = recid(sod_det).

         if sod_rma_type = "O" then do:
            /* FOR RMA SHIPMENT LINES, ENSURE "SHIP BEFORE RECEIPT"
             * CONDITIONS (WHICH CAN BE SPECIFIED ON THE SERVICE TYPE)
             * WILL NOT BE VIOLATED BY SHIPPING THIS QUANTITY. */
            {us/bbi/gprun.i ""fsshb4r.p""
                     "(input sod_nbr,
                       input sod_line,
                       input (lotserial_qty * trans_conv),
                       output msgnbr,
                       output linked-line)"}

            if msgnbr <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=msgnbr &ERRORLEVEL=3 &MSGARG1=linked-line}
               lotserial_qty = prev_lotserial_qty.
               undo setlot, retry.
            end.
         end.  /* if sod_rma_type = "O" */

         /* Build sr_wkfl, which holds shipped-from locations */
         undo-all = yes.

         if multi_entry then do:
            if c-application-mode = "API" then do:
               {us/gp/gpttcp.i
                  ttSoShipLotSerial
                  ttInventoryTransDet
                     " ttSoShipLotSerial.nbr = ttSoShipDet.nbr and
                       ttSoShipLotSerial.line = ttSoShipDet.line
                     "
               }

               run setInventoryTransDet in apiMethodHandle(
                  input table ttInventoryTransDet).

            end. /* IF C-APPLICATION-MODE = "API" THEN */
            /* Prompt for multiple locations */
            sav_global_type = global_type.
            global_type = "shipundo".

            /* IF DOING RMA RECEIPT, WHICH IS TREATED AS A       */
            /* NEGATIVE SO ISSUE, CALL A DIFFERENT MULTI-ENTRY   */
            /* ROUTINE THAT SWITCHES THE SIGN ON THE QUANTITY    */
            /* SO THAT NO INCORRECT ERROR MESSAGES ARE RECEIVED  */
            if sorec = fsrmarec
               and sod_rma_type = "I"
            then do:
               {us/bbi/gprun.i ""icsrup3.p""
                        "(input sod_site,
                          input-output lotnext,
                          input lotprcpt)"}
            end.
            else do:
               assign
                  done_entry = true
                  lineid_list = "".

               for each soddet
                  where soddet.sod_domain = global_domain
                  and   soddet.sod_nbr = sod_det.sod_nbr
                  and   soddet.sod_part = sod_det.sod_part
                  and   soddet.sod_compl_stat = ""
               no-lock:
                  lineid_list = lineid_list
                              + trim(string(soddet.sod_line)) + ",".
               end.

               lineid_list =
                  substring(lineid_list,1, ((r-index(lineid_list,",") - 1 )) ).

               do while done_entry:

                  /* Identify context for QXtend */
                  {us/gp/gpcontxt.i
                     &STACKFRAG = 'icsrup,sosoisd,sosoism,sosoism,sosois'
                     &FRAME = 'a,c' &CONTEXT = 'SOSOISD'}

                  {us/ca/cacratpr.i &eff_date_attr=eff_date}
                  {us/bbi/gprun.i ""icsrup4.p""
                           "(input sod_site,
                             input sod_nbr,
                             input string(sod_line),
                             input-output lotnext,
                             input lotprcpt,
                             input no,
                             input table tt_attr_parameter by-reference,
                             input-output table tt_attr_pfvalue by-reference)"}

                  if execname = "sosois.p"
                     and not l_reallocate
                     and l_override
                  then do:
                     for each lad_det
                        where lad_det.lad_domain  = global_domain
                        and   lad_det.lad_dataset = "sod_det"
                        and   lad_det.lad_nbr     = sod_nbr
                        and   lad_det.lad_line    = string(sod_line)
                        and   lad_det.lad_part    = sod_part
                     exclusive-lock:
                        find first ld_det
                           where   ld_domain = global_domain
                           and     ld_site   = lad_site
                           and     ld_loc    = lad_loc
                           and     ld_part   = lad_part
                           and     ld_lot    = lad_lot
                           and     ld_ref    = lad_ref
                        exclusive-lock no-error.
                        if available ld_det
                        then
                           ld_qty_all = ld_qty_all -
                                       (lad_qty_all + lad_qty_pick).

                        delete lad_det.
                     end. /* FOR EACH lad_det */

                     for each sr_wkfl
                        where sr_wkfl.sr_domain   = global_domain
                        and   sr_wkfl.sr_userid   = SessionUniqueID
                        and   sr_wkfl.sr_lineid   = string(sod_line)
                     no-lock:
                        create lad_det.
                        assign
                           lad_domain    = global_domain
                           lad_dataset   = "sod_det"
                           lad_nbr       = sod_nbr
                           lad_line      = sr_lineid
                           lad_site      = sr_site
                           lad_loc       = sr_loc
                           lad_part      = sod_part
                           lad_lot       = sr_lotser
                           lad_ref       = sr_ref
                           lad_qty_all   = sr_qty.

                        find first ld_det
                           where ld_domain = global_domain
                           and   ld_site   = lad_site
                           and   ld_loc    = lad_loc
                           and   ld_part   = lad_part
                           and   ld_lot    = lad_lot
                           and   ld_ref    = lad_ref
                        exclusive-lock no-error.
                        if available ld_det
                        then
                           ld_qty_all = ld_qty_all + lad_qty_all.
                     end. /* FOR EACH sr_wkfl */
                  end. /* IF EXECNAME */



                  /* Clear context for QXtend */
                  {us/gp/gpcontxt.i
                     &STACKFRAG = 'icsrup,sosoisd,sosoism,sosoism,sosois'
                     &FRAME = 'a,c'}

                  {us/bbi/gprun.i ""icoviss.p""
                           "(input sod_det.sod_part,
                             input ship_so,
                             input lineid_list,
                             input sod_line,
                             output overissue_ok)"}

                  if overissue_ok then done_entry = false.

               end.

               if using_cust_consignment
                  and sod_consignment
               then do:

                  key1 = SessionUniqueID + "CONS".

                  /* TRANSFER qad_wkfl TO CONSIGNMENT TEMP-TABLE */
                  {us/gp/gprunmo.i &program = "socntmp.p" &module  = "ACN"
                             &param   = """(input 1,
                                            input key1,
                                            input-output table
                                               tt_consign_shipment_detail)"""}

                  if can-find(first tt_consign_shipment_detail
                              where sales_order = sod_nbr
                              and   order_line  = sod_line
                              and   consigned_return_material)
                  then
                     transtype = "ISS-TR".

               end.   /* using_cust_consignment */
            end.  /* else do (sorec = fsrmarec) */

            if global_type = "shipok" then undo-all = no.
            global_type = sav_global_type.

         end.   /* if multi_entry */
         else do:
            ship_line = sod_line.
            {us/px/pxrun.i &PROC = 'isItemSerializationMandatory'
                           &PROGRAM='pafunc.p'
                           &HANDLE = ph_pafunc
                           &PARAM = "(input sod_part,
                                      output isSerialized)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}

            if isSerialized then do:
               /* Serialized Item is not allowed */
               {us/bbi/pxmsg.i &MSGNUM=13694 &ERRORLEVEL=3}
               undo setlot, retry setlot.
            end.

            {us/px/pxrun.i &PROC = 'allowIssueWithoutSerialization'
                           &PROGRAM = 'paicxr.p'
                           &HANDLE = ph_paicxr
                           &PARAM = "(input sod_part,
                                      input site,
                                      input location,
                                      input lotserial,
                                      input lotref,
                                      input lotserial_qty * trans_conv,
                                      output allowOverIssue,
                                      output looseQty)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
            if not allowOverIssue then do:
               {us/bbi/pxmsg.i &MSGNUM=12772 &ERRORLEVEL=4 }
               undo setlot, retry setlot.
            end.

            /* Validate location */
            {us/bbi/gprun.i ""sosoisu2.p"" "(input p-site-to,
                                      input p-loc-to)"}

            /* VALIDATIONS FOR TRANSFER OF ITEM FROM CONSIGNED LOCATION    */
            /* TO REGULAR INVENTORY LOCATION ARE DONE BEFORE VALIDATIONS   */
            /* FOR NORMAL RETURN OF ITEM FROM CUSTOMER BACK INTO INVENTORY */
            if using_cust_consignment
               and execname = "sosois.p"
               and sod_consignment
               and not undo-all
            then do:

               /* CREATE CONSIGNMENT TEMP-TABLE RECORD */
               {us/gp/gprunmo.i &program = "socnship.p" &module = "ACN"
                          &param   = """(input  sod_nbr,
                                         input  sod_line,
                                         input  site,
                                         input  location,
                                         input  sod_part,
                                         input  lotserial,
                                         input  lotref,
                                         input  lotserial_qty * trans_conv,
                                         output ok_to_ship,
                                         input-output table
                                            tt_consign_shipment_detail)"""}

               if can-find(first tt_consign_shipment_detail
                           where sales_order = sod_nbr
                           and   order_line  = sod_line
                           and   consigned_return_material)
               then
                  transtype = "ISS-TR".

               if not ok_to_ship then
                  undo-all = yes.

            end.  /* IF using_cust_consignment */
         end.

         /* Make sure alias points to SO db in case the of F4 exit */
         {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

         assign
            connect_db = so_db
            db_undo = no.

         run check-db-connect
            (input connect_db, input-output db_undo).

         if db_undo then do:
            if c-application-mode <> "API" then do:
               hide frame b.
               hide frame f.
               hide frame c.
            end. /* IF C-APPLICATION-MODE <> "API" THEN */
            undo loop0, leave loop0.
         end.

         if undo-all then undo setlot, retry.

         /* WARN USER IF SHIPMENT ADJUSTMENT */
         /* EXCEEDS ORIGINAL SHIPMENT */
         if (sod_qty_ord > 0 and total_lotserial_qty < 0 and
             sod_qty_ship < (total_lotserial_qty * -1))
         or (sod_qty_ord < 0 and total_lotserial_qty > 0 and
            (sod_qty_ship * -1) < total_lotserial_qty)
         then do:
            if sod_fsm_type <> "RMA-RCT" then do:
               /* Reversal qty exceeds original qty shipped */
               {us/bbi/pxmsg.i &MSGNUM=812 &ERRORLEVEL=2 &MSGARG1=sod_qty_ship}
            end.
         end.

         if so_sched then do:
            /*CHECK IF ORDER LINE IS EFFECTIVE*/
            if sod_start_eff[1] > today or
               sod_end_eff[1] < today then do:

               /* ORDER LINE NOT EFFECTIVE. START DATE:MM/YY/DD END DATE:MM/YY/DD*/
               {us/bbi/pxmsg.i &MSGNUM=10341 &ERRORLEVEL=2 &MSGARG1=sod_start_eff[1]
                &MSGARG2=sod_end_eff[1]}
               if c-application-mode <> "API" then do:
                  /* DO YOU WISH TO CONTINUE? */
                  {us/bbi/pxmsg.i &MSGNUM=7734 &ERRORLEVEL=1 &CONFIRM=l_continue}
                  if l_continue = no
                  then do:
                     undo, retry.
                  end. /* IF l_continue = no */
               end. /* IF c-application-mode <> "API"*/
            end. /*if sod_start_eff[1] < today or */

            /*CHECK IF END EFFECTIVE QTY HAS BEEN EXCEEDED*/
            if sod_cum_qty[3] > 0 then do:
               dExcessQty = 0.
               {us/px/pxrun.i &PROC='calculateEndEffectiveQtyExcess'
                  &PROGRAM='sosodxr.p'
                  &HANDLE=ph_sosodxr
                  &PARAM="(input sod_nbr,
                           input sod_line,
                           input total_lotserial_qty,
                           input sod_cum_qty[3],
                           input so_cum_acct,
                           output dExcessQty)"
                  &NOAPPERROR=True
                  &CATCHERROR=True}
                  if valid-handle(ph_sosodxr) then
                     delete object ph_sosodxr.
                  ph_sosodxr = ?.

               if dExcessQty > 0 then do:

                  /* ORDER LINE END EFFECTIVE QTY EXCEEDED BY #*/
                  {us/bbi/pxmsg.i &MSGNUM=10342 &ERRORLEVEL=2 &MSGARG1=dExcessQty}
                  if c-application-mode <> "API" then do:
                     /* DO YOU WISH TO CONTINUE? */
                     {us/bbi/pxmsg.i &MSGNUM=7734 &ERRORLEVEL=1 &CONFIRM=l_continue}
                     if l_continue = no
                     then do:
                        undo, retry.
                     end. /* IF l_continue = no */
                  end. /* IF c-application-mode <> "API"*/
               end. /* if dExcessQty > 0 then do: */
            end. /* if sod_cum_qty[3]*/
         end. /* if so_sched */

         /* WARN USER IF OVERSHIPPING/OVER-RECEIVING (FOR RMA'S)  */
         if (sod_qty_ord < 0 and
            (sod_qty_ship - total_lotserial_qty) < sod_qty_ord)
         then do:
            /* QTY TO RECEIVE + QTY RECEIVED > QTY EXPECTED */
            {us/bbi/pxmsg.i &MSGNUM=7201 &ERRORLEVEL=2}
         end.
         else do:
            if sod_qty_ord * ( sod_qty_ord -
               (sod_qty_ship + total_lotserial_qty) ) < 0
            then do:
               l_overship = yes.
               /* Qty shiped > Qty Ordered */
               {us/bbi/pxmsg.i &MSGNUM=622 &ERRORLEVEL=2}
            end.
         end.

         /* LOCATION TYPE VALIDATION TO BE PERFORMED ONLY */
         /* FOR MATERIAL ORDER SHIPMENTS AND ALSO ONLY IF */
         /* loc type FOR ITEM TO BE SHIPPED IS NON-BLANK  */

         {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                  &HANDLE = ph_ppitxr
                  &PARAM =  "(input  sod_part,
                              input  sod_site,
                              input ""pt_loc_type"",
                              output l_loc_frm_typ)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
         }
         if execname = "fseops.p"
            and l_loc_frm_typ <> " "
         then do:

            run p-loc-mstr (input p-loc-to,
                            output l_loc_to_typ).

            if l_loc_to_typ <> l_loc_frm_typ
            then do:
               {us/bbi/pxmsg.i &MSGNUM = 240  &ERRORLEVEL = 3}
               undo, retry.
            end. /* IF l_loc_to_typ <> ... */

         end. /* IF execname = "fseops.p" */

         if not multi_entry 
         and transtype = "ISS-SO" 
         and lotserial_qty >= 0 then do:  /*debug*/
            for first sr_wkfl no-lock
               where sr_wkfl.sr_domain = global_domain
                 and sr_wkfl.sr_userid = SessionUniqueID
                 and sr_wkfl.sr_lineid = cline:

               {us/ca/cacratpr.i &eff_date_attr=eff_date}

               {us/px/pxrun.i &PROC       = 'createAttrpfValueISS'
                              &PROGRAM    = 'caisxr.p'
                              &HANDLE     = ph_caisxr
                              &PARAM      = "(input sr_wkfl.oid_sr_wkfl,
                                              input sod_det.sod_part,
                                              input site,
                                              input location,
                                              input lotserial,
                                              input lotref,
                                              input transtype,
                                              input sod_nbr,
                                              input sod_line,
                                              input table tt_attr_parameter by-reference,
                                              input-output table tt_attr_pfvalue by-reference)"
                              &NOAPPERROR = true
                              &CATCHERROR = true
               }

               for first tt_attr_pfvalue no-lock
                  where tt_attr_pfvalue.tt_oid_attrpf_mstr = sr_wkfl.oid_sr_wkfl
                  and tt_attr_pfvalue.tt_attrpfd_ui_display:

                  /* Start to maintain the attributes */
                  hide frame c no-pause.
                  hide frame b no-pause.
                  hide frame f no-pause.
                  {us/bbi/gprun.i ""caatui.p""
                     "(input sr_wkfl.oid_sr_wkfl,
                       input sod_det.sod_part,
                       input site,
                       input location,
                       input lotserial,
                       input lotref,
                       input sr_wkfl.sr_qty,
                       input trans_um,
                       input transtype,
                       input-output table tt_attr_pfvalue by-reference)"}
                  if sorec = fsrmarec then
                     view frame f.
                  else
                     view frame b.
                  view frame c.

               end. /* for first tt_attr_pfvalue */

               /* Check Result against attribute specification */
               {us/px/pxrun.i &PROC      ='validateAttrSpec'
                              &PROGRAM   ='caisxr.p'
                              &HANDLE    = ph_caisxr
                              &PARAM     ="(input sr_wkfl.oid_sr_wkfl,
                                            input-output table tt_attr_pfvalue by-reference)"
                              &NOAPPERROR=true
                              &CATCHERROR=true
               }

               if can-find(first tt_attr_pfvalue
                               where tt_attr_pfvalue.tt_oid_attrpf_mstr = sr_wkfl.oid_sr_wkfl
                               and not tt_attr_pfvalue.tt_attrpfd_validate_result)
               then do:

                  yn = no.
                  /* Lot/Serial attribute values not conforming with order. Continue */
                  {us/bbi/pxmsg.i &MSGNUM=12464
                                  &ERRORLEVEL=2
                                  &CONFIRM=yn
                                  &CONFIRM-TYPE='LOGICAL'}
                  if not yn then do:
                     next-prompt location with frame c.
                     undo setlot, retry.
                  end.

               end. /* if can-find non-conforming */

            end. /* for first sr_wkfl */
         end. /* if transtype = "ISS-UNP" */
      end.  /* SETLOT */

      sod_qty_chg = total_lotserial_qty.
      if cancel_bo
         and not l_overship
      then do:
         if so_fsm_type = "SEO"
         then do:
            set2:
            do on error undo, retry:
               if not so_secondary
               then do:
                  if sod_btb_type = "02"
                     or sod_btb_type = "03"
                  then do:
                     find po_mstr
                        where po_domain  = global_domain
                        and   po_nbr     = sod_btb_po
                        and   po_so_nbr  = sod_nbr
                        and   po_is_btb  = yes
                     no-lock no-error.
                     if not available po_mstr
                     then do:
                        /* PURCHASE ORDER DOES NOT EXIST */
                        {us/bbi/pxmsg.i &MSGNUM=343 &ERRORLEVEL=3}
                        if batchrun then undo, leave.
                        undo set2, retry set2.
                     end. /* IF NOT AVAILABLE po_mstr */

                     find pod_det
                        where pod_domain  = global_domain
                        and   pod_nbr     = po_nbr
                        and   pod_line    = sod_btb_pod_line
                        and   pod_qty_ord > 0
                     no-lock no-error.
                     if not available pod_det
                     then do:
                        /* PO LINE DOES NOT EXIST */
                        {us/bbi/pxmsg.i &MSGNUM=2890 &ERRORLEVEL=3}
                        if batchrun then undo, leave.
                        undo set2, retry set2.
                     end. /* IF NOT AVAILABLE pod_det */

                     if pod_status = ""
                        and sod_qty_chg < (sod_qty_ord - sod_qty_ship)
                     then do:
                        /* SUPPLIER MUST BE NOTIFIED OF CHANGE */
                        {us/bbi/pxmsg.i &MSGNUM=2824 &ERRORLEVEL=2}
                        if not batchrun
                        then
                           pause.
                     end. /* IF pod_status = "" */
                  end. /* IF sod_btb_type = "02" or ... */
               end. /* IF NOT so_secondary */
               else do:
                  if sod_qty_chg < (sod_qty_ord - sod_qty_ship)
                  then do:
                     /* SALES OFFICE MUST BE NOTIFIED */
                     {us/bbi/pxmsg.i &MSGNUM=2833 &ERRORLEVEL=2}
                     if not batchrun
                     then
                        pause.
                  end. /* IF sod_qty_chg < (sod_qty_ord - sod_qty_ship) */
               end. /* IF so_secondary */
            end. /* set2 */
         end. /* IF so_fsm_type = "SEO" and ... */
         sod_bo_chg = 0.
      end. /* IF cancel_bo and ... */
      else
      /***********************************************/
      /*  RMA quantites in sod_qty_chg are stored as */
      /*  Positive even though it is negative. Why?  */
      /*  Because I would have to do many + - +      */
      /*  Conversions throughout the code to handle  */
      /*  RMA receipts because receipts are dislayed */
      /*  As positive.  This will have to do for now */
      /***********************************************/
      
      if sod_fsm_type = "RMA-RCT" then
         sod_bo_chg = sod_qty_ord - sod_qty_ship + sod_qty_chg.
      else
         sod_bo_chg = if sod_qty_ord > 0
                         or not so_sched
                      then
                         sod_qty_ord - sod_qty_ship - sod_qty_chg
                      else
                         0.

      l_overship = no.

      if can-find (first sob_det
         where sob_domain = global_domain
         and   sob_nbr    = sod_nbr
         and   sob_line   = sod_line)
         and   sod_fa_nbr = ""
         and   sod_cfg_type <> "1"    /* Not "1" Assemble-to-Order */
         and   not undo-all
         and   sod_type = ""
         and   sod_lot    = ""
      then do:
         repeat:
            if c-application-mode = "API" and retry
               then return error return-value.
            undo-all = no.
            mod_iss = ?.
            form
               space(1)
               mod_iss
               space(2)
            with frame e row 16 column 21 side-labels 1 down overlay.

            /* SET EXTERNAL LABELS */
            setFrameLabels(frame e:handle).

            repeat with frame e:
               if c-application-mode = "API" and retry
                  then return error return-value.
               if c-application-mode <> "API" then do:
                  display yes @ mod_iss.
                  set mod_iss.
               end.
               else
                  {us/mf/mfaiset.i mod_iss ttSoShipDet.ed_mod_iss}.
               leave.
            end.
            if c-application-mode <> "API" then
               hide frame e.
/*c1348*/   if lotserial_qty = 0 then mod_iss = no.

            if mod_iss <> yes then leave.
            if c-application-mode <> "API" then do:
               hide frame c.
               hide frame f.
               hide frame b.
            end. /* IF C-APPLICATION-MODE <> "API" THEN */

            if change_db then do:
               {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

               assign
                  connect_db = ship_db
                  db_undo = no.

               run check-db-connect
                  (input connect_db, input-output db_undo).

               if db_undo then do:
                  if c-application-mode <> "API" then
                     hide frame e.
                  undo loop0, leave loop0.
               end.
            end.
            else do:
               sod_recno = recid(sod_det).
            end.

            /* PASSING THE CENTRAL DB sod_qty_chg TO CORRECTLY  */
            /* INITIALIZE BACKFLUSH QTY (back_qty) IN SOISE01.P */
            {us/bbi/gprun.i ""soise01.p""
                     "(input sod_nbr,
                       input sod_line,
                       input sod_qty_chg,
                       output l_rej,
                       input-output table tt_attr_pfvalue by-reference,
                       input-output table tt_serials      by-reference)"}
            if l_rej = yes then
               assign
                  sod_bo_chg  = if sod_qty_ord > 0
                                then
                                   sod_bo_chg + sod_qty_chg
                                else
                                   sod_bo_chg
                  sod_qty_chg = 0
                        l_rej = no.
            if change_db then do:
               {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

               assign
                  connect_db = so_db
                  db_undo = no.

               run check-db-connect
                  (input connect_db, input-output db_undo).

               if db_undo then do:
                  if c-application-mode <> "API" then
                     hide frame e.
                  undo loop0, leave loop0.
               end.
            end.

            if c-application-mode <> "API" then do:
               if sorec = fsrmarec then
                  view frame f.
               else
                  view frame b.

               view frame c.
               pause 0.
            end. /* IF C-APPLICATION-MODE <> "API" THEN */
            if undo-all = no then leave.
         end.

         if mod_iss <> yes 
/*c1348*/ or lotserial_qty = 0.0
	 then do:
            for each sr_wkfl
               where sr_domain = global_domain
               and   sr_userid = SessionUniqueID
               and sr_lineid begins string(sod_line) + "ISS"
            exclusive-lock:
               delete sr_wkfl.
            end.

            for each lotw_wkfl
               where lotw_domain = global_domain
               and   lotw_mfguser = SessionUniqueID
            exclusive-lock:
               delete lotw_wkfl.
            end.
         end.
      end. /* IF CAN-FIND */

      /* SWITCHING TO INVENTORY DOMAIN */
      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

         assign
            connect_db = ship_db
            db_undo    = no.

         run check-db-connect (input connect_db,
            input-output db_undo).

         if db_undo then do:
            if c-application-mode <> "API" then do:
               hide frame b.
               hide frame f.
               hide frame c.
            end. /* IF C-APPLICATION-MODE <> "API" THEN */
            undo loop0, leave loop0.
         end. /* IF DB_UNDO THEN */
      end. /* IF CHANGE_DB */

      /* SET STANDARD COST FROM INVENTORY DOMAIN */
      {us/bbi/gprun.i ""gpsct05.p""
               "(input sod_part,
                 input sod_site,
                 input 1,
                 output glxcst,
                 output curcst)"}

      if sod_type <> "M" then
         sod_std_cost = glxcst * sod_um_conv.

      /* SWITCHING BACK TO CENTRAL DOMAIN */
      if change_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

         assign
            connect_db = so_db
            db_undo    = no.

         run check-db-connect (input connect_db,
            input-output db_undo).

         if db_undo then do:
            if c-application-mode <> "API" then do:
               hide frame b.
               hide frame f.
               hide frame c.
            end. /* IF C-APPLICATION-MODE <> "API" THEN */
            undo loop0, leave loop0.
         end. /* IF DB_UNDO THEN */
      end. /* IF CHANGE_DB */

      if sod_sched then do:
         /* SET CURRENT PRICE */

         /* FOLLOWING SECTION IS ADDED TO REPLACE rcpccal.p WITH gppccal.p  */
         /* TO TAKE CARE OF PRICE LIST TYPES "M" AND "D" IN ADDITION TO "P" */

         for first soc_ctrl
            where soc_domain = global_domain
         no-lock: end.

         assign
            l_disc_pct1  = 0
            l_net_price  = ?
            l_rec_no     = ?
            l_list_price = 0.

         /* SCHEDULED ORDERS CAN BE CREATED ONLY IN STOCKING UM */
         /* MULTIPLYING BY sod_um_conv JUST FOR SAFETY          */
         if available pt_mstr then do:

            {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                      "(input base_curr,
                        input so_curr,
                        input exch_rate2,
                        input exch_rate,
                        input (pt_price * sod_um_conv),
                        input false,
                        output l_list_price,
                        output mc-error-number)"}
            if mc-error-number <> 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
            end.
         end. /* if available pt_mstr */

         {us/bbi/gprun.i ""gppccal.p""
                  "(input  sod_part,
                    input sod_qty_chg,
                    input sod_um,
                    input sod_um_conv,
                    input so_curr,
                    input {&CUSTOMER-CLASSIFICATION},
                    input sod_pr_list,
                    input eff_date,
                    input sod_std_cost,
                    input soc_pl_req,
                    0.0,
                    input-output  l_list_price,
                    output l_disc_pct1,
                    input-output  l_net_price,
                    output l_rec_no)"}

         create tt_sod_det.
         assign
            tt_sod_det.tt_sod_nbr  = sod_nbr
            tt_sod_det.tt_sod_line = sod_line
            tt_sod_det.tt_pr_found = if l_rec_no = 0 then false
                                     else true.

         if recid(tt_sod_det) = -1 then .

         if l_net_price <> ? then
            sod_price = l_net_price.

         /* SWITCHING TO INVENTORY DOMAIN */
         if change_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

            assign
               connect_db = ship_db
               db_undo    = no.

            run check-db-connect (input connect_db,
               input-output db_undo).

            if db_undo then do:
               if c-application-mode <> "API" then do:
                  hide frame b.
                  hide frame f.
                  hide frame c.
               end. /* IF C-APPLICATION-MODE <> "API" THEN */
               undo loop0, leave loop0.
            end. /* IF DB_UNDO THEN */
         end. /* IF CHANGE_DB */

         /* UPDATE NET PRICE, LIST PRICE, CUMULATIVE QTY IN */
         /* INVENTORY DOMAIN                              */
         {us/bbi/gprun.i ""sosoisu6.p""
                  "(input sod_nbr,
                    input sod_line,
                    input sod_price,
                    input l_list_price,
                    input sod_cum_qty[1],
                    input sod_cum_qty[2],
                    input sod_cum_qty[3])"}

         /* SWITCHING BACK TO CENTRAL DOMAIN */
         if change_db then do:
            {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

            assign
               connect_db = so_db
               db_undo    = no.

            run check-db-connect (input connect_db,
               input-output db_undo).

            if db_undo then do:
               if c-application-mode <> "API" then do:
                  hide frame b.
                  hide frame f.
                  hide frame c.
               end. /* IF C-APPLICATION-MODE <> "API" THEN */
               undo loop0, leave loop0.
            end. /* IF DB_UNDO THEN */
         end. /* IF CHANGE_DB */

         /* UPDATE SOD_LIST_PRICE FOR SCHEDULE ORDER WHEN   */
         /* SOD_LIST_PRICE IS ZERO OR                       */
         /* LIST PRICE IN ITEM MASTER IS ZERO SO THAT SALES */
         /* AMOUNT SHOULD BE POSTED TO PROPER ACCOUNT       */

         if pt_price = 0
            or sod_list_pr = 0
         then
            sod_list_pr = sod_price.
      end. /* IF SOD_SCHED */

      /* FREIGHT WEIGHTS */
      if sod_fr_list <> "" then do:
         set_wt:
         do on error undo, retry:
            freight_ok = yes.
            if calc_fr or disp_fr then do:
               detqty = sod_qty_chg.

               {us/bbi/gprun.i ""gpfrlwt.p""
                        "(input so_curr,
                          input so_ex_rate,
                          input so_ex_rate2,
                          input so_fr_min_wt,
                          input so_fr_terms,
                          input so_ship, input eff_date,
                          input sod_fr_list, input sod_part,
                          input detqty, input sod_site,
                          input sod_type, input sod_um,
                          input calc_fr,
                          input disp_fr,
                          input sod_nbr,
                          input sod_line,
                          input sod_sob_std,
                          input-output sod_fr_wt,
                          input-output sod_fr_wt_um,
                          input-output sod_fr_class,
                          input-output l_sod_fr_chg,
                          input-output freight_ok)"}
            end.

            if sod_fr_wt <> 0
            then do:
               find first ied_det
                  where ied_domain = global_domain
                  and   ied_type   = "1"
                  and   ied_nbr    = sod_nbr
                  and   ied_line   = sod_line
               exclusive-lock no-error.

               if available ied_det
               then
                  assign
                     ied_net_wt = sod_fr_wt
                     ied_net_wt_um = sod_fr_wt_um.

               release ied_det.
            end. /* IF sod_fr_wt <> 0 */

            if not freight_ok then
               undo set_wt, retry.
         end.
      end.
   end. /* REPEAT (NOT TRANSACTION) */

   if sorec = fsrmarec  then
      msgnbr = 7229.  /* DISPLAY RMA LINES BEING RECEIVED? */
   else
   if so_fsm_type = "SEO" then
      msgnbr = 3353.  /* DISPLAY MATERIAL ORDER LINES BEING SHIPPED? */
   else
   if so_fsm_type  = "KITASS" then
      msgnbr = 817.   /* DISPLAY KIT ITEMS BEING ASSEMBLED? */
   else
      msgnbr = 618.   /* DISPLAY SALES ORDER LINES BEING SHIPPED? */


   /* Display Shipment information for user review */
   do on endkey undo loop0,leave loop0
      on error  undo loop0,leave loop0:

      if c-application-mode = "API" and retry
         then return error return-value.

      l_remove_srwkfl = yes.

      yn = yes.
      /* Display sales order lines being shipped? */

      /* Identify context for QXtend */
      {us/gp/gpcontxt.i
         &STACKFRAG = 'sosoisd,sosoism,sosoism,sosois'
         &FRAME = 'yn' &CONTEXT = 'SOSOISD_1'}

      {us/bbi/pxmsg.i &MSGNUM=msgnbr &ERRORLEVEL=1 &CONFIRM=yn}

      /* Clear context for QXtend */
      {us/gp/gpcontxt.i
         &STACKFRAG = 'sosoisd,sosoism,sosoism,sosois'
         &FRAME = 'yn'}

      l_remove_srwkfl = no.

      if c-application-mode <> "API" then do:
         if yn = yes then do:


            hide frame b no-pause.
            hide frame f no-pause.
            hide frame c no-pause.

            /* Switch to the shipping db to display the shipment file */
            if ship_db <> global_db then do:
               {us/bbi/gprun.i ""gpalias3.p"" "(input ship_db, output err-flag)"}

               assign
                  connect_db = ship_db
                  db_undo = no.

               run check-db-connect
                  (input connect_db, input-output db_undo).

               if db_undo then do:
                  hide frame b.
                  hide frame f.
                  hide frame c.
                  undo loop0, leave loop0.
               end.
            end.
            

            {us/bbi/gprun.i ""sosoiss1.p"" "(input-output table tt_attr_pfvalue by-reference)"}
            

            {us/bbi/gprun.i ""gpalias3.p"" "(input so_db, output err-flag)"}

            assign
               connect_db = so_db
               db_undo = no.

            run check-db-connect
               (input connect_db, input-output db_undo).

            if db_undo then do:
               hide frame b.
               hide frame f.
               hide frame c.
               undo loop0, leave loop0.
            end.

         end.
      end. /* IF C-APPLICATION-MODE <> "API" THEN */
   end. /* DO ON ENDKEY */

   do on endkey undo loop0, leave loop0
      on error  undo loop0, leave loop0:

      if sorec = fsrmaship or
         sorec = fssoship or
         sorec = fssormaship or
         sorec = fsseoship or
         sorec = fsktship then do:

         if sorec <> fssoship 
         and sorec <> fsrmaship
         and sorec <> fsseoship then do:
            {us/px/pxrun.i &PROC = 'validateNonSerLooseQtyForShipment'
                                 &PROGRAM='pasdxr.p'
                                 &HANDLE = ph_pasdxr
                                 &PARAM = "(input ship_so,
                                            input SessionUniqueID,
                                            output allowOverIssue,
                                            output failedPart,
                                            output looseQty)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true}
         end.
         else
            run validateNonSerLooseQtyForShipment(input ship_so,
                                                  input SessionUniqueID,
                                                  output allowOverIssue,
                                                  output failedPart,
                                                  output looseQty).

         if not allowOverIssue then do:
            /* There's no enough loose inventory for item */
            {us/bbi/pxmsg.i &MSGNUM=13336 &ERRORLEVEL=3 &MSGARG1=failedPart}
            pause.
            undo loop0, retry loop0.
         end.

         end.

   end.

   do on endkey undo loop0, leave loop0
      on error  undo loop0, leave loop0:
      if c-application-mode = "API" and retry
         then return error return-value.

      find first cil_mstr
         where cil_mstr.cil_domain = global_domain
         and   cil_mstr.cil_cor_so_nbr = so_nbr
      no-lock no-error.

      if available cil_mstr then do:

         yn = yes.

         for each sod_det no-lock
            where sod_det.sod_domain = global_domain
            and   sod_nbr = ship_so
            and   sod_compl_stat = ""
         use-index sod_nbrln:

            assign srqty = 0.

            for each sr_wkfl where sr_domain = global_domain
               and sr_userid = SessionUniqueID
               and sr_lineid = string(sod_line)
            no-lock:
               assign srqty = srqty + sr_qty.
            end.

            if srqty <> (sod_qty_ord - sod_qty_ship) then do:
               yn = no.
              leave.
            end.

         end.

         if yn = no then do:
            yn = yes.
            /* Only full shipments are allowed for Correction Invoices */
            {us/bbi/pxmsg.i &MSGNUM=5371 &ERRORLEVEL=3}
            next.
         end.

      end.

      /* CREATE THIS ONLY WHEN IT IS MO SHIPMENT */
      /* WHEN SHIP ALLOCATED IS SET TO YES AND USER DOES NOT GO TO LINE */
      /* DETAIL FRAME SO SET THE QUANTITY THEN THIS CODE WILL CREATE RECORDS */
      /* FOR CONSUMPTION */
      if sorec = fsseoship then do:
         for each sod_det where sod_det.sod_domain = global_domain
                          and   sod_nbr = ship_so
                          and   sod_compl_stat = ""
            no-lock use-index sod_nbrln,
            each sr_wkfl where sr_wkfl.sr_domain = global_domain
                         and           sr_userid = SessionUniqueID
                         and           sr_lineid = string(sod_line)
         no-lock:
            for first itm_det                                                     /*  */
       where itm_domain = global_domain
            and   itm_nbr    = sod_ca_nbr
            and   itm_line   = sod_ca_line
            no-lock:
            end. /* FOR FIRST itm_det */
            if available itm_det
            then do:
               for first tt_ssm_sod_det
                  where tt_ssm_sod_det.tt_ssm_sod_nbr = sod_nbr
                  and   tt_ssm_sod_det.tt_ssm_sod_line = sod_line
               no-lock: end.
               if not available tt_ssm_sod_det then do:
                  create tt_ssm_sod_det.
                  assign
                     tt_ssm_sod_det.tt_ssm_sod_nbr  = sod_nbr
                     tt_ssm_sod_det.tt_ssm_sod_line = sod_line
                     tt_ssm_sod_det.tt_ssm_sod_consume = p-consume-shipped .
                 /* WHILE DOING MO SHIPMENT ALWAYS CONSUME DO REPLACEMENT TYPE LINE. */    /*  */
       if itm_repair_type = "3"
                 then
                   tt_ssm_sod_det.tt_ssm_sod_consume = yes.
               end. /* IF NOT AVAILABLE tt_ssm_sod_det */
         end.  /* IF AVAILABLE itm_det */
         end. /* for each sod_det */
      end. /* if  sorec = */

      yn = yes.

      l_remove_srwkfl = yes.

      /* Identify context for QXtend */
      {us/gp/gpcontxt.i
         &STACKFRAG = 'sosoisd,sosoism,sosoism,sosois'
         &FRAME = 'yn' &CONTEXT = 'SOSOISD_2'}

      /* Is all info correct? */
      {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=yn}

      /* Clear context for QXtend */
      {us/gp/gpcontxt.i
         &STACKFRAG = 'sosoisd,sosoism,sosoism,sosois'
         &FRAME = 'yn'}

      l_remove_srwkfl = no.

      if yn then do:
         if c-application-mode <> "API" then
         do:
            hide frame b.
            hide frame f.
            hide frame c.
         end.
         {us/ic/icshmtdf.i "new"}
         run proc-shipper.

         undo-select = false.
         leave loop0.
      end.
      else if c-application-mode <> "API" and fill_ship_by_pack = yes then do:
         /* Hide the frames if it's 'Ship by Pack' */
         hide frame b.
         hide frame f.
         hide frame c.
      end.
   end.
end.  /* LOOP0: REPEAT TRANSACTION */

/* Clear context for QXtend */
{us/gp/gpcontxt.i
   &STACKFRAG = 'sosoisd,sosoism,sosoism,sosois'
   &FRAME = 'yn'}

empty temp-table compute_ldd no-error.

/* IN GUI THE RETURN KEY IN THE QUESTION ALERT BOX IS NOT RECOGNIZED,*/
/* CONSEQUENTLY THE KEYFUNCTION(LASTKEY)WRONGLY RETURNS F4 OR ESC    */
/* KEY FROM THE PREVIOUS KEYSTROKE CAUSING ERRONEOUS DELETION OF     */
/* SR_WKFL. SO INSTEAD OF RELYING ON LASTKEY WE WILL USE LOGICAL     */
/* VARIABLE TO DETECT IF USER HAS PRESSED END-ERROR OR END-KEY.      */

if l_remove_srwkfl then do:
   for each sr_wkfl
      where sr_domain = global_domain
      and   sr_userid = SessionUniqueID
   exclusive-lock:
      delete sr_wkfl.
   end.

   for each lotw_wkfl
      where lotw_domain = global_domain
      and   lotw_mfguser = SessionUniqueID
   exclusive-lock:
      delete lotw_wkfl.
   end.

end.

unsubscribe to "getOverride".

PROCEDURE check-db-connect:
   define input parameter connect_db like dc_name.
   define input-output parameter db_undo like mfc_logical.

   if err-flag = 2 or err-flag = 3 then do:
      /* DOMAIN # IS NOT AVAILABLE */
      {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=connect_db}
      db_undo = yes.
   end.

END PROCEDURE.

PROCEDURE check-reserved-location:
/*  DETERMINE IF LOC TO BE USED IS VALID                                */

   ret-flag = 2.

   /* bypass checking SSM orders */
   if so_mstr.so_fsm_type = "" then do:
     {us/bbi/gprun.i ""sorlchk.p""
              "(input so_mstr.so_ship,
                input so_mstr.so_bill,
                input so_mstr.so_cust,
                input site,
                input location,
                output ret-flag)"}
   end.

END PROCEDURE.

PROCEDURE DisplayMessage:

   define input parameter ipMsgNum as integer   no-undo.
   define input parameter ipLevel  as integer   no-undo.
   define input parameter ipMsg1   as character no-undo.

   {us/bbi/pxmsg.i &MSGNUM=ipMsgNum &ERRORLEVEL=ipLevel &MSGARG1=ipMsg1}

END PROCEDURE.

PROCEDURE proc-shipper:

   assign
      from_site = ""
      to_site   = ""
      from_loc  = ""
      to_loc    = "".

   find qad_wkfl where qad_domain = global_domain
        and qad_key1 = "SITE/LOC"
        and qad_key2 = SessionUniqueID
   exclusive-lock no-error.

   if available qad_wkfl then do:
      assign
         to_site     = trim(qad_charfld[1])
         temp_siteto = to_site
         to_loc      = trim(qad_charfld[2]).
      delete qad_wkfl.
   end.

   find first sod_det where sod_det.sod_domain = global_domain
      and sod_nbr = ship_so
      and sod_compl_stat =  ""
   no-lock no-error.

   if available sod_det and sod_fsm_type = "SEO" then do:

      find first sr_wkfl no-lock
         where sr_domain = global_domain
           and sr_userid = SessionUniqueID
           and sr_lineid = string(sod_line)
      no-error.

      if available sr_wkfl then
      assign
         from_site     = sr_site
         temp_sitefrom = from_site
         from_loc      = sr_loc.

      if (from_site = to_site) and (from_loc <> to_loc) then do:

          for first loc_mstr
             where loc_domain = global_domain
               and loc_site = from_site
               and loc_loc  = from_loc
          no-lock: end.

          if available loc_mstr then
             assign
                from_site = loc_phys_addr.
          else
             assign
                from_site = "".

          for first loc_mstr
             where loc_domain = global_domain
               and loc_site = to_site
               and loc_loc  = to_loc
          no-lock: end.

          if available loc_mstr then
             assign
                to_site   = loc_phys_addr.
          else
             assign
                to_site   = "".

      end. /*FROM_SITE = TO_SITE*/

      if from_site <> to_site then do:
         {us/bbi/gprun.i ""icshmt1c.p""}

         assign v_lines_found = no.

         for each sod_det no-lock
            where sod_det.sod_domain = global_domain
            and   sod_nbr = ship_so
            and   sod_compl_stat = "" ,
         each sr_wkfl no-lock
            where sr_wkfl.sr_domain = global_domain
            and   sr_userid = SessionUniqueID
            and sr_lineid = string(sod_line):

            find pt_mstr where pt_domain = global_domain
               and pt_part = sod_part
            no-lock no-error.

            {us/bbi/gprun.i ""icshmt1a.p""
               "(sod_nbr,
                 sod_line,
                 sod_part,
                 sr_lotser,
                 sr_ref,
                 sr_site,
                 sr_loc,
                 sr_qty,
                 sod_um,
                 sod_um_conv,
                 if available pt_mstr
                    then pt_net_wt * sr_qty * sod_um_conv
                    else 0,
                 if available pt_mstr
                    then pt_net_wt_um
                    else """",
                 if available pt_mstr
                    then pt_size * sr_qty * sod_um_conv
                    else 0,
                 if available pt_mstr
                    then pt_size_um
                    else """" )" }

            assign v_lines_found = yes.

         end. /*for sod_det*/

         if v_lines_found then do:

            {us/bbi/gprun.i ""icshmt.p""
               "(from_site,
                 to_site,
                 ""ISS-TR"",
                 eff_date,
                 ""no"",
                 output v_abs_recid,
                 output v_trflow_flg)" }

            /* Get associated shipper */
            find abs_mstr where recid(abs_mstr) = v_abs_recid
            no-lock no-error.

            if available abs_mstr then do:

               /* If the transaction flow is not internal,
                  then print legal document*/
               if v_trflow_flg = yes then do:
                  /* Global Shipping: assign Legal Doc nbr */
                  {us/bbi/gprun.i ""gpldnbr.p"" "(recid(abs_mstr))"}

                  if sorec = fsrmarec or sorec = fsrmaship then do:
                     {us/bbi/gprun.i ""gpldcmt.p"" "(recid(abs_mstr),'RMA')"}
                  end.

                  /* COLLECT INFO FOR THE LEGAL DOCUMENT */
                  {us/px/pxrun.i &PROC = 'saveLegalSiteLoc'
                     &PROGRAM    = 'soldxr.p'
                     &HANDLE     = ph_soldxr
                     &PARAM      = "(input abs_id,
                                     input temp_sitefrom,
                                     input from_loc,
                                     input temp_siteto,
                                     input to_loc)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}

                  /* Print Legal Doc */
                  {us/bbi/gprun.i ""icldprt.p"" "(recid(abs_mstr))"}
               end.
            end. /* if available abs_mstr */

            find qad_wkfl where qad_domain = global_domain and
              qad_key1 = "ABS_ID" and
              qad_key2 = SessionUniqueID
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

         end. /*v_lines_found*/

      end.    /*from_site <> to_site*/

   end.       /*avail sod_det and sod_fsm_type = "SEO"*/

END PROCEDURE. /* proc-shipper */

PROCEDURE p-loc-mstr:

    define input  parameter p-loc  like sod_loc  no-undo.
    define output parameter p-type like loc_type no-undo.

    for first loc_mstr
       where loc_domain = global_domain
       and   loc_loc    = p-loc
    no-lock:
       p-type = loc_type.
    end. /* FOR FIRST loc_mstr */

END PROCEDURE. /* p-loc-mstr */

PROCEDURE getOverride:
   define input parameter p_override as logical no-undo.

   l_override = p_override.
END. /* PROCEDURE getOverride */

/**-----------------------------------------------------------------------------
 * Validate Non-Serialized Loose item Qty For Shipment
 * Copied from the same procedure from pasdxr.p
 *----------------------------------------------------------------------------*/
PROCEDURE validateNonSerLooseQtyForShipment:
   define input  parameter soNbr        like sod_nbr            no-undo.
   define input  parameter sessionId    like sr_userid          no-undo.
   define output parameter allowToIssue as   logical initial no no-undo.
   define output parameter failedPart   like sod_part no-undo.
   define output parameter looseQty like sr_qty no-undo.

   define variable isKitComponent as logical no-undo.
   define variable kitComponent as character no-undo.
   define variable isSerialized   as logical no-undo.

   define buffer sod_det    for   sod_det.
   define buffer sr_wkfl    for   sr_wkfl.
   define buffer srwkfl     for   sr_wkfl.
   define buffer bf_serials for  tt_serials.

   for each sod_det
      where sod_det.sod_domain = global_domain
        and sod_nbr = soNbr
        and sod_compl_stat = ""
    no-lock use-index sod_nbrln:
      isSerialized = no.
      {us/px/pxrun.i &PROC = 'isItemSerialized'
            &PROGRAM = 'pafunc.p'
            &HANDLE = ph_pafunc
            &PARAM = "(input sod_part,
                     output isSerialized)"
            &NOAPPERROR = true
            &CATCHERROR = true} 
      
      /* If it's not serialized item, check if any serial pack has been selected for the item */
      if not isSerialized then do:
         for first bf_serials
            where bf_serials.tt_sod_line = sod_det.sod_line
         no-lock: end.
         if available bf_serials then
            isSerialized = yes.
      end.

      /* No need to care about the serialized item or non-serialized item that has serial pack selected */
      if isSerialized then
         next.

      for each sr_wkfl
      where sr_wkfl.sr_domain = global_domain
        and sr_userid         = sessionId
        and sr_lineid         = string(sod_line)
      no-lock:

         isKitComponent = no.

         for each srwkfl no-lock
            where srwkfl.sr_domain = global_domain
              and srwkfl.sr_userid = sessionId
              and srwkfl.sr_lineid begins string(sod_line) + "ISS"
              and srwkfl.sr_qty <> 0:

            isKitComponent = yes.
            kitComponent = substring(srwkfl.sr_lineid,length(string(sod_line)) + 4).

            {us/px/pxrun.i &PROC = 'allowIssueWithoutSerialization'
                           &PROGRAM='paicxr.p'
                           &HANDLE = ph_paicxr
                           &PARAM = "(input kitComponent,
                                      input srwkfl.sr_site,
                                      input srwkfl.sr_loc,
                                      input srwkfl.sr_lotser,
                                      input srwkfl.sr_ref,
                                      input srwkfl.sr_qty,
                                      output allowToIssue,
                                      output looseQty)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
         end.

         if not isKitComponent then do:
            {us/px/pxrun.i &PROC = 'allowIssueWithoutSerialization'
                           &PROGRAM='paicxr.p'
                           &HANDLE = ph_paicxr
                           &PARAM = "(input sod_part,
                                      input sr_wkfl.sr_site,
                                      input sr_wkfl.sr_loc,
                                      input sr_wkfl.sr_lotser,
                                      input sr_wkfl.sr_ref,
                                      input sr_wkfl.sr_qty,
                                      output allowToIssue,
                                      output looseQty)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
         end.

         if not allowToIssue then do:
            failedPart = sod_part.
            return {&APP-ERROR-RESULT}.
         end.
      end.
   end.

   allowToIssue = yes.
   return {&SUCCESS-RESULT}.

END PROCEDURE. /* validateNonSerLooseQtyForShipment */

/******************************************************
 * Method to check if the Kit order contains any serialized item.
 */
PROCEDURE hasSerializedItemInKit:
   define input   parameter   orderNumber       like     so_nbr                     no-undo.
   define output  parameter   hasSerializedItem like     mfc_logical initial  no    no-undo.

   for each sob_det where sob_domain   = global_domain
                           and sob_nbr = orderNumber
   no-lock:
      for first pt_mstr where pt_domain      = global_domain
                        and   pt_part        = sob_part
                        and   pt_serialized  = {&PT-SERIALIZED-CODE-ALWAYS}
      no-lock: end.
      if available pt_mstr then do:
         hasSerializedItem = yes.
         return.
      end.
   end.

END PROCEDURE. /* hasSerializedItemInKit */

PROCEDURE isKitItem:
   define input   parameter   itemNumber        like     sod_part       no-undo.
   define output  parameter   isKit             like     mfc_logical initial  no    no-undo.

   for first pt_mstr where pt_domain   = global_domain
                     and   pt_part     = itemNumber
   no-lock:
      if pt_cfg_type = "2" then
         isKit = yes.
   end.

END PROCEDURE.


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
