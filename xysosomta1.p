/* xysosomta1.p - PROCESS SALES ORDER HEADER FRAMES                           */
/* xxsosomta1.p - PROCESS SALES ORDER HEADER FRAMES                           */
/* sosomta1.p - PROCESS SALES ORDER HEADER FRAMES                             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xysosomta1.p,v 1.2 2018/03/13 17:10:02 gbg Exp $: */
/* REVISION: 8.5      LAST MODIFIED: 02/21/96   BY: sxb *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 03/04/96   BY: tjs *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 04/09/96   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 04/26/96   BY: *J0KJ* Dennis Hensen      */
/* REVISION: 8.5      LAST MODIFIED: 05/13/96   BY: *J0M3* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 05/23/96   BY: *J0NH* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 05/23/96   BY: *J0R6* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 07/19/96   BY: *J0ZZ* T. Farnsworth      */
/* REVISION: 8.5      LAST MODIFIED: 08/27/96   BY: *G2D5* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Elke Van Maele     */
/* REVISION: 8.6      LAST MODIFIED: 11/05/96   BY: *K01T* Stephane Collard   */
/* REVISION: 8.6      LAST MODIFIED: 05/06/97   BY: *K0CZ* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 06/11/97   BY: *K0DQ* Taek-Soo Chang     */
/* REVISION: 8.6      LAST MODIFIED: 07/01/97   BY: *H1B3* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 07/15/97   BY: *K0G6* Arul Victoria      */
/* REVISION: 8.6      LAST MODIFIED: 07/11/97   BY: *K0DH* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 09/27/97   BY: *K0HB* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 11/17/97   BY: *J26C* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 12/17/97   BY: *J288* Surekha Joshi      */
/* REVISION: 8.6      LAST MODIFIED: 12/29/97   BY: *J28V* Surekha Joshi      */
/* REVISION: 8.6      LAST MODIFIED: 01/08/98   BY: *J29J* Surekha Joshi      */
/* REVISION: 8.6      LAST MODIFIED: 01/15/98   BY: *K1FK* Jim Williams       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 12/23/98   BY: *M045* Raphael Thoppil    */
/* REVISION: 9.0      LAST MODIFIED: 12/28/98   BY: *J2ZM* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 02/16/99   BY: *J3B4* Madhavi Pradhan    */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Patti Gaultney     */
/* REVISION: 9.1      LAST MODIFIED: 10/27/99   BY: *N03P* Mayse Lai          */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 04/25/00   BY: *N0CG* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 06/30/00   BY: *N0DX* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 07/24/00   BY: *J3Q2* Ashwini G.         */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/28/00   BY: *M0T7* Rajesh Kini        */
/* REVISION: 9.1      LAST MODIFIED: 10/03/00   BY: *L14Q* Abhijeet Thakur    */
/* REVISION: 9.1      LAST MODIFIED: 10/16/00   BY: *N0WB* BalbeerS Rajput    */
/* REVISION: 9.1      LAST MODIFIED: 02/21/01   BY: *M125* Satish Chavan      */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.42        BY: Katie Hilbert        DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.43        BY: Nikita Joshi         DATE: 06/19/01  ECO: *M1BP* */
/* Revision: 1.44        BY: Jean Miller          DATE: 08/08/01  ECO: *M11Z* */
/* Revision: 1.45        BY: Russ Witt            DATE: 09/21/01  ECO: *P01H* */
/* Revision: 1.46        BY: Russ Witt            DATE: 10/17/01  ECO: *P02C* */
/* Revision: 1.47        BY: Rajiv Ramaiah        DATE: 10/25/01  ECO: *M1MP* */
/* Revision: 1.48        BY: Ed van de Gevel      DATE: 12/03/01  ECO: *N16R* */
/* Revision: 1.51        BY: Patrick Rowan        DATE: 03/14/02  ECO: *P00G* */
/* Revision: 1.52        BY: Deepak Rao           DATE: 07/08/02  ECO: *N1NH* */
/* Revision: 1.53        BY: Reetu Kapoor         DATE: 08/28/02  ECO: *P0GX* */
/* Revision: 1.54        BY: Nishit V             DATE: 10/16/02  ECO: *N1X1* */
/* Revision: 1.55        BY: Laurene Sheridan     DATE: 12/10/02  ECO: *M219* */
/* Revision: 1.58        BY: Narathip W.          DATE: 05/08/03  ECO: *P0RL* */
/* Revision: 1.58        BY: Neil Curzon          DATE: 07/11/03  ECO: *Q00Q* */
/* Revision: 1.59        BY: Shoma Salgaonkar     DATE: 08/02/03  ECO: *N2J7* */
/* Revision: 1.60        BY: Patrick de Jong      DATE: 08/07/03  ECO: *P0Z6* */
/* Revision: 1.61        BY: Marcin Serwata       DATE: 09/08/03  ECO: *P12G* */
/* Revision: 1.62        BY: Veena Lad            DATE: 02/03/04  ECO: *P1M6* */
/* Revision: 1.63        BY: Jean Miller          DATE: 02/20/04  ECO: *Q062* */
/* Revision: 1.64        BY: Veena Lad            DATE: 03/03/04  ECO: *Q064* */
/* Revision: 1.65        BY: Veena Lad            DATE: 04/22/04  ECO: *P1YK* */
/* Revision: 1.69        BY: Katie Hilbert        DATE: 01/07/05  ECO: *Q0GG* */
/* Revision: 1.70        BY: Katie Hilbert        DATE: 01/07/05  ECO: *Q0GH* */
/* Revision: 1.71        BY: SurenderSingh N.     DATE: 01/12/05  ECO: *P322* */
/* Revision: 1.75        BY: Ed van de Gevel      DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.77        BY: Swati Sharma         DATE: 03/23/05  ECO: *P3DF* */
/* Revision: 1.78        BY: Ashwini G.           DATE: 04/08/05  ECO: *P3GG* */
/* Revision: 1.79        BY: Alok Gupta           DATE: 05/04/05  ECO: *P3K4* */
/* Revision: 1.81        BY: Ed van de Gevel      DATE: 07/05/05  ECO: *R01H* */
/* Revision: 1.82        BY: Shilpa Kamath        DATE: 11/03/05  ECO: *R02B* */
/* Revision: 1.83        BY: Amit Singh           DATE: 11/22/05  ECO: *P48V* */
/* Revision: 1.84        BY: Preeti Sattur        DATE: 03/22/06  ECO: *Q0SL* */
/* Revision: 1.85        BY: Dan Herman           DATE: 03/30/06  ECO: *R001* */
/* Revision: 1.87        BY: Austin Xie           DATE: 03/30/06  ECO: *R084* */
/* Revision: 1.88        BY: Katie Hilbert        DATE: 08/31/06  ECO: *R08J* */
/* Revision: 1.94        BY: Ajit Philip          DATE: 06/13/07  ECO: *Q15G* */
/* Revision: 1.95        BY: Katie Hilbert        DATE: 07/25/07  ECO: *R0C6* */
/* Revision: 1.96        BY: Jean Miller          DATE: 11/06/07  ECO: *P64D* */
/* Revision: 1.98        BY: Dinesh Dubey         DATE: 03/14/08  ECO: *R0LZ* */
/* Revision: 1.99        BY: Deirdre O'Brien      DATE: 03/13/08  ECO: *R0P6* */
/* Revision: 1.105       BY: Nan Zhang            DATE: 04/22/08  ECO: *R0JS* */
/* Revision: 1.114       BY: Jean Miller          DATE: 07/11/08  ECO: *R0WZ* */
/* Revision: 1.121       BY: Jean Miller          DATE: 07/11/08  ECO: *R0WJ* */
/* Revision: 1.122       BY: Deepa Mathew         DATE: 12/17/08  ECO: *P6Z3* */
/* Revision: 1.123       BY: Sumit Karunakaran    DATE: 10/06/08  ECO: *R15G* */
/* Revision: 1.124       BY: Deepak Keni          DATE: 02/10/09  ECO: *R1BX* */
/* Revision: 1.127       BY: Deepak Keni          DATE: 05/11/09  ECO: *R1J7* */
/* Revision: 1.128       BY: Prajakta Patil       DATE: 07/27/09  ECO: *Q352* */
/* Revision: 1.129       BY: Sandeep Rohila       DATE: 08/14/09  ECO: *Q2VW* */
/* Revision: 1.133       BY: Archana Kirtane      DATE: 11/16/09  ECO: *Q3J5* */
/* Revision: 1.136       BY: Nancy Philip         DATE: 05/10/10  ECO: *R206* */
/* Revision: 1.137       BY: Rinku Keswani        DATE: 05/18/10  ECO: *Q42V* */
/* Revision: 1.139       BY: Rajalaxmi Ganji      DATE: 07/09/10  ECO: *R229* */
/* Revision: 1.140       BY: Katie Hilbert        DATE: 08/30/10  ECO: *R25W* */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB    LAST MODIFIED: 19-JUL-2010    BY:  nac *q9021*cy1022*              */
/* CYB                LAST MODIFIED: 26 Nov 10  BY: *A1007-CR01* nac      */
/* CYB                LAST MODIFIED: 13-JUN-2012 BY: gbg *c1312*           */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                LAST MODIFIED: 08-MAY-2013 BY: gbg *c1402*           */
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
 
/* Note: This program is called by SOSOMT1.P.  It was initially split from
   SOSOMT.P due to compile size limits.  */
using com.qad.eefin.bdinvoice.GetDInvoiceStatus.
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i} /* PERSISTENT PROCEDURE PROGRAM MANAGER */
{us/px/pxphdef.i sosoxr} /* DEFINES HANDLE FOR SO HEADER ROP */
{us/px/pxphdef.i mglbdxr}
 
{us/so/socurvar.i}
{us/gp/gpoidfcn.i}
 
/* Includes 'getnbr' */
{us/gp/gpnbrgen.i}
 
/* QAD Financials API DEFINITIONS */
define variable hQADFinancialsLib as handle no-undo.
define variable DInvoiceStatus    as GetDInvoiceStatus no-undo.
 
/* Input/Output Parameters */
define input  parameter this-is-rma as logical.
define output parameter not_okay    as integer no-undo.
define output parameter rma-recno   as recid.
 
/* Shared Variables */
define new shared variable l_edittax  like mfc_logical
                                      initial no no-undo.
define new shared variable l_up_sales like mfc_logical no-undo.
 
define shared variable lDomSwthBlocked as logical no-undo.
define shared variable rndmthd       like rnd_rnd_mthd.
define shared variable oldcurr       like so_curr.
define shared variable line          like sod_line.
define shared variable del-yn        like mfc_logical.
define shared variable qty_req       like in_qty_req.
define shared variable prev_due      like sod_due_date.
define shared variable prev_qty_ord  like sod_qty_ord.
define shared variable trnbr         like tr_trnbr.
define shared variable qty           as decimal.
define shared variable part          as character format "x(18)".
define shared variable eff_date      as date.
define shared variable all_days      like soc_all_days.
define shared variable all_avail     like soc_all_avl.
define shared variable sngl_ln       like soc_ln_fmt.
define shared variable so_recno      as recid.
define shared variable cm_recno      as recid.
define shared variable comp          like ps_comp.
define shared variable cmtindx       like cmt_indx.
define shared variable sonbr         like so_nbr.
define shared variable socmmts       like soc_hcmmts label "Comments".
define shared variable prev_abnormal like sod_abnormal.
define shared variable promise_date  as date label "Promise Date".
define shared variable perform_date  as date label "Perform Date".
define shared variable base_amt      like ar_amt.
define shared variable consume       like sod_consume.
define shared variable prev_consume  like sod_consume.
define shared variable confirm       like mfc_logical
                                     format "yes/no" initial yes
                                     label "Confirmed".
define shared variable sotrcust      like so_cust.
define shared variable merror        like mfc_logical initial no.
define shared variable so-detail-all like soc_det_all.
define shared variable new_order     like mfc_logical initial no.
define shared variable sotax_trl     like tax_trl.
define shared variable tax_in        like cm_tax_in.
define shared variable rebook_lines  as logical initial no no-undo.
define shared variable so_db         like dc_name.
define shared variable inv_db        like dc_name.
define shared variable mult_slspsn   like mfc_logical no-undo.
define shared variable undo_cust     like mfc_logical.
define shared variable freight_ok    like mfc_logical initial yes.
define shared variable old_ft_type   like ft_type.
define shared variable calc_fr       like mfc_logical label "Calculate Freight".
define shared variable undo_flag     like mfc_logical.
define shared variable disp_fr       like mfc_logical.
define shared variable display_trail like mfc_logical initial yes.
define shared variable soc_pc_line   like mfc_logical initial yes.
define shared variable socrt_int     like sod_crt_int.
define shared variable impexp        like mfc_logical no-undo.
define shared variable picust        like cm_addr.
define shared variable price_changed like mfc_logical.
define shared variable line_pricing  like pic_so_linpri label "Line Pricing".
define shared variable reprice       like mfc_logical label "Reprice" initial no.
define shared variable balance_fmt   as character.
define shared variable limit_fmt     as character.
define shared variable prepaid_fmt   as character no-undo.
define shared variable prepaid_old   as character no-undo.
define shared variable inv_org       like cil_prev_inv  no-undo.
define shared variable org_nbr       like cil_cor_so_nbr   no-undo.
define shared variable old_billto    like so_bill no-undo.
/*cy1022*/ define shared variable cyb_so_type as char no-undo.
 
/* Local Variables */
define        variable corr_inv like mfc_logical  no-undo.
define variable in_batch_proces as   logical.
define variable msgnbr          as   integer no-undo.
define variable call-number     like rma_ca_nbr initial " ".
define variable local-undo      as   integer no-undo.
define variable l_old_shipto    like so_ship no-undo.
define variable counter         as   integer no-undo.
 
define variable emt-bu-lvl      like global_part no-undo.
define variable save_part       like global_part no-undo.
define variable l-shipto        like so_ship     no-undo.
define variable msg-arg         as   character   format "x(24)" no-undo.
define variable l_edit_instat   like mfc_logical initial no no-undo.
define variable l_vq_use_sold   like mfc_logical initial no no-undo.
define variable tms-error       like msg_nbr no-undo.

/*c1312 start added code */
def var vmessage as char.
def var i as int.
def var vfound as logical.
/*c1312 end   added code */
 
define variable iValidCustomerCreditLimit as integer no-undo.
 
/* CREDIT MANAGEMENT */
define variable hCreditLibrary    as handle        no-undo.
 
{us/mf/mfcredpl.i "hCreditLibrary"}
 
/* THESE HANDLE FIELDS ARE USED TO GIVE RMA'S DIFFERENT LABELS */
define variable l-hdl-req-date  as  handle.
define variable l-hdl-due-date  as  handle.
 
/* Buffers */
define        buffer bill_cm       for cm_mstr.
 
{us/so/sobtbvar.i }    /* EMT SHARED WORKFILES AND VARIABLES */
 
define     shared frame a.
define new shared frame sold_to.
define new shared frame ship_to.
define new shared frame b.
 
{us/so/sosomt01.i}
 
/* VARIABLES FOR CONSIGNMENT INVENTORY */
{us/so/socnvars.i}
define variable procedure_id as character no-undo.
define variable ccOrder         as logical                      no-undo.
 
/* Global Shipping: Use Seq ID to generate SO nbr */
define variable l_errorst  like mfc_logical no-undo.
define variable i_errornum as   integer     no-undo.
define variable c_sonrm    like so_nrm      no-undo.
define variable use_nrmseq as   logical initial no no-undo.
 
define temp-table tt_nrm
   field tt_dataset like nr_dataset
   field tt_seqid   like nr_seqid
   field tt_nbrtype as   character
index idx_seqid_pk is unique primary tt_seqid.
 
form
   tt_seqid
with frame frame_seqid side-labels overlay row 2 columns 12.
 
setFrameLabels(frame frame_seqid:handle).
 
/* INCLUDE FILE TO CHECK IF USER IS IN VIEWER MODE */
{us/gp/gpvwckhd.i}
 
run initialiseCreditManagementLibrary ( input  hCreditLibrary,
                                        output hCreditLibrary).
 
/* DETERMINE IF CUSTOMER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input ENABLE_CUSTOMER_CONSIGNMENT,
     input 10,
     input ADG,
     input CUST_CONSIGN_CTRL_TABLE,
     output using_cust_consignment)"}
 
if this-is-rma = yes
then
   using_cust_consignment = no.
 
/* FIELD SERVICE VARIABLE'S DEFINITION */
{us/fs/fsconst.i}
 
for first pic_ctrl where pic_domain = global_domain
no-lock: end.
 
/* THE LOCAL-UNDO VARIABLE HANDLES UNDO PROCESSING WITHIN SOSOMTA1.P */
/* AS IT HAS THE 'NO-UNDO' ATTRIBUTE, IT GETS SET TO INDICATE THE    */
/* APPROPRIATE PROCESSING FOR THE CALLING ROUTINE (SOSOMT1.P), THEN  */
/* PROCESSING DONE IN THE CURRENT TRANSACTION IS UNDONE.  IF THE     */
/* USER SUCCESSFULLY EXECUTES THE CODE IN THIS PROGRAM (AND HENCE,   */
/* NO 'UNDO' IS NECESSARY), THIS WILL BE SET TO 0 FOR SOSOMT1.P.     */
 
/* VALUES USED BY THIS UNDO FLAG ARE:            */
/* 1 = NEXT MAINLOOP (WITH NO UNDO)              */
/* 2 = UNDO MAINLOOP, NEXT MAINLOOP              */
/* 3 = UNDO MAINLOOP, RETRY MAINLOOP             */
/* 4 = UNDO MAINLOOP, LEAVE                      */
 
assign
   local-undo = 4
   not_okay   = 4. /* undo mainloop, leave */
 
loopx:
do on error undo, retry on endkey undo, leave:
 
   for first soc_ctrl where soc_domain = global_domain
   no-lock: end.
 
   if this-is-rma then do:
      /* DELETE ANY HANGING SR_WKFL'S FROM PREVIOUS RMA     */
      /* MAINTENANCE SHIPMENT/RECEIPT THAT WASN'T COMPLETED */
      for each sr_wkfl where sr_domain = global_domain
                         and sr_userid = SessionUniqueID
      exclusive-lock:
         delete sr_wkfl.
      end.
 
      /* DELETE ANY HANGING LOTW_WKFL'S FROM PREVIOUS RMA     */
      /* MAINTENANCE RECEIPT THAT WASN'T COMPLETED            */
      {us/bbi/gprun.i ""gplotwdl.p""}
 
      for first rmc_ctrl where rmc_domain = global_domain
      no-lock: end.
   end.
   else
      socmmts = soc_hcmmts.
 
   /* Form Definitions for shared frames a and b */
/*cy1020*   {us/so/sosomt02.i} */
/*cy1020*/  {us/xx/xxsosomt02.i}
 
   /* CREATE SOLD_TO & SHIP_TO FRAMES */
   {us/mf/mfadform.i "sold_to" 1 SOLD-TO}
   {us/mf/mfadform.i "ship_to" 41 SHIP-TO}
 
      if this-is-rma
      then do:
         if not dynamic-function('getTranslateFramesFlag' in h-label)
         then do with frame b:
            assign
               l-hdl-req-date       = so_req_date:handle
               l-hdl-req-date:label = getTermLabel("DUE_DATE", 8)
               l-hdl-due-date       = so_due_date:handle
               l-hdl-due-date:label = getTermLabel("DATE_EXPECTED", 8).
         end. /* IF NOT dynamic-function('getTranslateFramesFlag' ... */
         else do:
            /* DETERMINE IF AN LBLD_DET RECORD EXISTS FOR
               SO_REQ_DATE AND EXECNAME COMBINATION        */
 
            {us/px/pxrun.i &PROC='processRead'
                     &PROGRAM='mglbdxr.p'
                     &HANDLE=ph_mglbdxr
                     &PARAM="(input execname,
                              input 'so_req_date',
                              buffer lbld_det,
                              input {&NO_LOCK_FLAG},
                              input {&NO_WAIT_FLAG})"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
 
            if return-value = {&RECORD-NOT-FOUND}
            then do with frame b:
               assign
                  l-hdl-req-date       = so_req_date:handle
                  l-hdl-req-date:label = getTermLabel("DUE_DATE", 8).
            end. /* IF RETURN-VALUE = {&RECORD-NOT-FOUND} */
 
            /* DETERMINE IF AN LBLD_DET RECORD EXISTS FOR
               SO_DUE_DATE AND EXECNAME COMBINATION        */
 
            {us/px/pxrun.i &PROC='processRead'
                     &PROGRAM='mglbdxr.p'
                     &HANDLE=ph_mglbdxr
                     &PARAM="(input execname,
                              input 'so_due_date',
                              buffer lbld_det,
                              input {&NO_LOCK_FLAG},
                              input {&NO_WAIT_FLAG})"
                     &NOAPPERROR=true
                     &CATCHERROR=true}
 
            if return-value = {&RECORD-NOT-FOUND}
            then do with frame b:
               assign
                  l-hdl-due-date       = so_due_date:handle
                  l-hdl-due-date:label = getTermLabel("DATE_EXPECTED", 8).
            end. /* IF RETURN-VALUE = {&RECORD-NOT-FOUND} */
         end. /* ELSE IF dynamic-function('getTranslateFramesFlag' ... */
      end.   /* IF this-is-rma */
 
   view frame a.
   view frame sold_to.
   view frame ship_to.
   view frame b.
 
   new_order = no.
 
   /* CHECKING IF FLAG USE SOLD-TO FOR TAX USAGE EXCEPTIONS IS SET TO YES/NO */
   for first mfc_ctrl where mfc_domain = global_domain
      and mfc_field  = "l_vqc_sold_usage"
   no-lock:
      l_vq_use_sold = mfc_logical.
   end. /* FOR FIRST mfc_ctrl */
 
   /* Check is any NRM sequences defined for Numbering */
   use_nrmseq = can-find(first nr_mstr where nr_domain = global_domain
                                         and nr_dataset begins "so_nbr."
                                         and nr_effdate <= today
                                         and (nr_exp_date = ? or nr_exp_date >= today)).
 
   c_sonrm = "".
 
   prompt-for so_nbr with frame a
   editing:
 
      /* ALLOW LAST SO NUMBER REFRESH */
      if keyfunction(lastkey) = "RECALL" or lastkey = 307
      then
         display
            sonbr @ so_nbr
         with frame a.
 
      /* IF WE'RE MAINTAINING RMA'S, NEXT/PREV ON RMA'S, */
      /* ELSE, NEXT/PREV ON SALES ORDERS.                */
      if this-is-rma then do:
 
         /* CHANGED THIRD PARAMETER FROM SO_FSM_TYPE = ""RMA"" TO */
         /* SO_FSM_TYPE = RMA_C                                   */
         {us/mf/mfnp05.i so_mstr so_fsm_type
            "so_domain = global_domain and so_fsm_type  = rma_c
              and so_compl_stat = '' "
            so_nbr "input so_nbr"}
      end.
      else do:
         /* FIND NEXT/PREVIOUS RECORD - SO'S ONLY */
         {us/mf/mfnp05.i so_mstr so_fsm_type
            "so_domain = global_domain and so_fsm_type  = ''
               and so_compl_stat = '' "
            so_nbr "input so_nbr"}
      end.
 
      if recno <> ? then do with frame b:
 
         {us/mf/mfaddisp.i so_cust sold_to}
         {us/mf/mfaddisp.i so_ship ship_to}
 
         display
            so_nbr
            so_cust
            so_bill
            so_ship
         with frame a.
 
         assign promise_date = ?
                perform_date = ?.
 
         for first sod_det where sod_domain = global_domain
            and sod_nbr = so_nbr
            and sod_compl_stat = ""
         no-lock: end.
 
         if so_conf_date = ? then
            confirm = no.
         else
            confirm = yes.
 
         if so_slspsn[2] <> "" or
            so_slspsn[3] <> "" or
            so_slspsn[4] <> ""
         then
            mult_slspsn = true.
         else
            mult_slspsn = false.
 
         /* Display so_ord_date, etc in frame B */
/*cy1010*         {us/so/sosomtdi.i} */
/*cy1010*/     {us/xx/xxsosomtdi.i}
 
      end. /* IF RECNO <> ? */
 
   end. /* PROMPT-FOR SO_NBR */

/*c1312* start added code */
   if trim(input so_nbr) <> input so_nbr
   and not can-find(first so_mstr
                      where so_domain = global_domain
		      and   so_nbr = input so_nbr)
   then do:
	 vmessage = "Leading spaces entered in Order Number".
	 {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
         undo loopx, retry loopx.
   end.
   vfound = no.
   if input so_nbr <> ""
   and not can-find(first so_mstr
                    where so_domain = global_domain
		    and   so_nbr = input so_nbr)
   then do i = 1 to 8:
       vfound = vfound or
                can-find(first so_mstr
		         where so_domain = global_domain
			 and  so_nbr = fill(" ", i) + input so_nbr).
   end.
   if vfound
   then do:
       vmessage = "Order " + trim(input so_nbr) + " exists with leading spaces".
       {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=1}
       pause.
   end.
/*c1312* end   added code */
 
   do transaction on error undo, leave on endkey undo, return:
 
      if input so_nbr = "" then do:
 
         /* Global Shipping: Identify SO type using NRM, RMA won't use NRM*/
         if not this-is-rma and use_nrmseq then do:
 
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
 
         end. /* if not this-is-rma */
 
         /* Set the Seq ID and return the value */
         settype:
         do on error undo, retry on endkey undo, leave:
 
            if not this-is-rma and use_nrmseq then do:
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
 
               if not available tt_nrm and input tt_seqid <> ""
               then do:
                  /* Invalid Sequence */
                  {us/bbi/pxmsg.i &MSGNUM=2818 &ERRORLEVEL=3}
                  next-prompt tt_seqid.
                  undo, retry.
               end.
               else if input tt_seqid <> "" then
                  c_sonrm = tt_nbrtype.
 
            end. /* if not this-is-rma */
 
            GetSoNbr:
            repeat:
 
               if not this-is-rma then do:
 
                  if input tt_seqid <> "" and use_nrmseq
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
 
               end. /* if not this-is-rma */
 
               else if this-is-rma then do:
                  /* GET NEXT RMA NUMBER WITH PREFIX */
                  {us/fs/fsnctrl2.i "rmc_domain = global_domain"
                     "rmc_domain" "so_domain = global_domain"
                     "rma_domain = global_domain" rmc_ctrl
                     rmc_so_nbr
                     so_mstr
                     so_nbr
                     sonbr
                     rmc_so_pre
                     rma_mstr
                     rma_prefix
                     ""C""
                     rma_nbr}
                  for first rmc_ctrl where rmc_domain = global_domain
                  no-lock: end.
               end.   /* if this-is-rma */
 
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
 
      end. /* IF INPUT SO_NBR = "" */
      else   /* TAKE SONBR AS ENTERED BY USER */
         sonbr = input so_nbr.
 
   end.  /* DO TRANSACTION ON ERROR UNDO.. */
 
   if keyfunction(lastkey) = "end-error" then
      undo loopx, retry loopx.
 
   if sonbr = " " then
      return.
 
   /* CHECK To SEE IF SALES ORDER IS NOT CORRECTION SALES ORDER */
   if     can-find(first cil_mstr
                      where cil_mstr.cil_domain = global_domain
                      and   cil_cor_so_nbr      = sonbr)
      and not can-find(first so_mstr
                          where so_domain = global_domain
                          and   so_nbr    = sonbr)
   then do:
      /* INVALID SALES ORDER NUMBER, AS CORRECTION SO IS AVAILABLE */
      {us/bbi/pxmsg.i &MSGNUM=20006 &ERRORLEVEL=3}
       pause.
       not_okay   = 3 .
       return.
   end. /* IF CAN-FIND(FIRST cil_mstr... */
 
   trans2:
   do transaction on error undo, retry:
 
      old_ft_type = "".
 
      find so_mstr where so_domain = global_domain
           and so_nbr    = sonbr
      exclusive-lock no-error.
 
      if not available so_mstr then do:
 
         if this-is-rma and not available rmc_ctrl then
            for first rmc_ctrl where rmc_domain = global_domain
            no-lock: end.
 
         for first soc_ctrl where soc_domain = global_domain
         no-lock: end.
 
         clear frame sold_to.
         clear frame ship_to.
         clear frame b.
         clear frame f_cor_inv.
 
         /** For Qxtend to provide order number as part of message
          *  and then to made available with context for response
          *  In case of auto generated, response qdoc is void of
          *  context
          **/
 
         /* ADDING NEW RECORD */
         if {us/gp/gpisapi.i} then do:
            {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1 &MSGARG1=sonbr}
         end.
         else do:
            {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}
         end.
 
         create so_mstr.
         new_order = yes.
         assign
            so_domain    = global_domain
            so_nbr       = sonbr
            so_ord_date  = today
            so_due_date  = today + soc_shp_lead
            so_print_so  = soc_print
            so_fob       = soc_fob
            confirm      = soc_confirm
            /* SET SO_PRINT_PL SO IT DOES NOT PRINT WHILE IT IS */
            /* BEING CREATED. IT IS RESET TO YES IN SOSOMTC.P   */
            so_print_pl  = no
            so_userid    = global_userid
            socmmts      = soc_hcmmts
            so_nrm       = c_sonrm.

/*cy1022>>*/
           if cyb_so_type = "warranty"
	   then
	      so_pr_list = "warranty".
/*cy1022<<*/
 
         /* FOR RMA'S, HEADER INFORMATION IS ALSO    */
         /*  STORED IN RMA_MSTR */
         if this-is-rma then do:
            create rma_mstr.
            assign
               rma_domain   = global_domain
               rma_nbr      = sonbr
               rma_ord_date = today
               so_req_date  = today + soc_shp_lead
               rma_req_date = so_req_date
               so_due_date  = today
               rma_exp_date = so_due_date
               rma_prt_rec  = so_print_so
               rma_prefix   = "C"
               socmmts      = rmc_hcmmts
               confirm      = yes
               so_fsm_type  = rma_c.
 
            if recid(rma_mstr) = -1 then .
         end.    /* if this-is-rma */
 
      end. /* IF NOT AVAILABLE SO_MSTR */
 
      else do: /* IF AVAILABLE SO_MSTR */
 
         if so_trade_sale then do:
            /* Trade Sales Scheduled Order Cannot be Modified */
            {us/bbi/pxmsg.i &MSGNUM=6237 &ERRORLEVEL=3}
            local-undo = 3.
            leave trans2.
         end.
 
         if so_compl_stat <> "" and not isViewer
         then do:
            /* Order is closed. Modification not allowed */
            {us/bbi/pxmsg.i &MSGNUM=8042 &ERRORLEVEL=3}
            local-undo = 3.
            leave trans2.
         end.
 
         if so_compl_stat <> "" and isViewer
         then do:
            /* Order is closed */
            {us/bbi/pxmsg.i &MSGNUM=8024 &ERRORLEVEL=2}
         end.
 
         /* SECONDARY SO */
         if so_secondary and not isViewer
         then do:
            /* IF SECONDARY SO AND PO CHANGE LOAD NOT YET ACKNOWLEDGED */
            /* OR PO CHANGES NOT YET ACKNOWLEDGED, THEN ERROR...      */
            if can-find(trq_mstr where trq_domain = global_domain
                                   and trq_doc_type = "SO"
                                   and trq_doc_ref  = so_nbr
                                   and (trq_msg_type = "ORDRSP-S" or
                                        trq_msg_type = "ORDRSP-C"))
            then do:
               /* Modification is not allowed on Processed Secondary SO */
               {us/bbi/pxmsg.i &MSGNUM=2812 &ERRORLEVEL=3}
               if not batchrun then pause.
               not_okay = 3. /* undo mainloop, retry mainloop */
               return.
            end. /* if can-find trq_mstr */
 
         end.  /* secondary SO */
 
         /* ENSURE WE HAVE THE CORRECT ORDER TYPE */
         if (not this-is-rma and so_fsm_type <> "")
         or (this-is-rma and so_fsm_type <> rma_c)
         then do:
            if so_fsm_type = " " then
               /* THIS IS A SALES ORDER. USE SALES ORDER MAINT FOR UPDATES */
               msgnbr = 1282.
            else
            if so_fsm_type = seo_c then
               /* THIS IS A MATERIAL ORDER. USE MO MAINT FOR UPDATE */
               msgnbr = 3360.
            else
            if so_fsm_type = scontract_c then
               /* THIS IS A SERVICE CONTRACT. USE CONTRACT MAINT FOR UPDATE */
               msgnbr = 1280.
            else
            if so_fsm_type = rma_c then
               /* THIS IS AN RMA. CANNOT PROCESS */
               msgnbr = 7190.
            else
            if so_fsm_type = "PRM" then
               /* THIS IS A PRM PENDING INVOICE. CANNOT PROCESS */
               /* CHECKING FOR INVOICED CALL */
               msgnbr = 3435.
            else
            if so_fsm_type = fsmro_c then
               /* THIS IS AN INVOICED CALL. USE CALL MAINTENANCE/CAR FOR UPDATE. */
               msgnbr = 2450.
            {us/bbi/pxmsg.i &MSGNUM=msgnbr &ERRORLEVEL=3}
 
            local-undo = 3.
            leave trans2.      /* Nothing's been modified - no undo needed. */
 
         end. /* IF SO_FSM_TYPE <> "" */
 
         /* DISALLOW MAINTENANCE IF REVIEWED BY CREDIT CONTROLLER */
         if soc_maintain_reviewed = no
         and so_reviewed          = yes
         and not isViewer
         then do:
            /* ORDER HAS BEEN REVIEWED BY CREDIT CONTROLLER. UNABLE TO MODIFY*/
            {us/bbi/pxmsg.i &MSGNUM=7597 &ERRORLEVEL=3}
            not_okay = 3. /* undo mainloop, retry mainloop */
            return.
         end.
 
         /* EDITING EXISTING RECORD */
         /* SUPPRESS MESSAGE IN VIEWER MODE */
         if not isViewer then do:
            {us/bbi/pxmsg.i &MSGNUM=10 &ERRORLEVEL=1}
         end.
 
         if this-is-rma then
         for first rma_mstr where rma_domain = global_domain
            and rma_nbr    = so_nbr
            and rma_prefix = "C"
         no-lock: end.
 
         {us/bbi/gprun.i ""gpsiver.p""
            "(input so_site,
              input ?,
              output return_int)"}
 
         if return_int = 0 then do:
 
            display
               so_nbr
               so_cust
               so_bill
               so_ship
            with frame a.
 
            /* Display so_ord_date, etc with frame b */
/*cy1010*            {us/so/sosomtdi.i} */
/*cy1010*/   {us/xx/xxsosomtdi.i}
 
            /* USER DOES NOT HAVE ACCESS TO THIS SITE*/
            {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
            local-undo = 3.
            leave trans2.      /* Nothing's been modified - no undo needed. */
 
         end. /* IF RETURN_INT = 0 */
 
         /* CHECK FOR BATCH SHIPMENT RECORD */
         in_batch_proces = no.
         {us/so/sosrchk.i so_nbr in_batch_proces}
         if in_batch_proces then do:
            local-undo = 3.
            leave trans2.      /* Nothing's been modified - no undo needed. */
         end.
 
         {us/mf/mfaddisp.i so_cust sold_to}
         if not available ad_mstr then do:
            hide message no-pause.
            /* CUSTOMER DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=3 &ERRORLEVEL=2}
         end. /* IF NOT AVAILABLE AD_MSTR */
 
         {us/mf/mfaddisp.i so_ship ship_to}
 
         if so_conf_date = ? then
            confirm = no.
         else
            confirm = yes.
 
         new_order = no.
 
         for first ft_mstr where ft_domain = global_domain
              and ft_terms  = so_fr_terms
         no-lock:
            old_ft_type = ft_type.
         end.
 
         if so_sched then do:
            /* ORDER WAS CREATED BY SCHEDULED ORDER MAINT */
            {us/bbi/pxmsg.i &MSGNUM=8210 &ERRORLEVEL=2}
         end.
 
      end. /* ELSE IF AVAILABLE SO_MSTR */
 
      /* FOR RMAs CONSUME FORECAST FLAG ON THE HEADER SHOULD DEFAULT */
      /* FROM RMA/RTS CONTROL FILE                                   */
      if this-is-rma
      then do:
         assign
            so-detail-all = rmc_det_all
            consume       = rmc_consume.
 
         if new_order
         then
            all_days      = rmc_all_days.
 
      end. /* IF this-is-rma */
      else do:
         assign
            so-detail-all = soc_det_all
            consume       = yes.
 
         if new_order
         then
            all_days      = soc_all_days.
      end. /* ELSE DO */
 
      recno = recid(so_mstr).
 
      /* CHECK FOR COMMENTS*/
      if so_cmtindx <> 0 then
         socmmts = yes.
 
      display
         so_nbr
         so_cust
         so_bill
         so_ship
      with frame a.
 
      /* Create a record for the Sales Order Header if this is EMT or a DOM owned order */
      if (soc_use_btb or so_app_owner = "DOM")
         and so_primary
      then do:
 
         {us/gp/gprunp.i "soemttrg" "p" "create-temp-so-mstr"
            "(input so_nbr)"}
      end. /* IF (soc_use_btb or so_app_owner = "DOM") AND so_primary */
 
      assign
         promise_date = ?
         perform_date = ?
         sotrcust = so_cust.
 
      for first sod_det where sod_domain = global_domain
           and sod_nbr = so_nbr
      no-lock:
      end.
 
      if so_slspsn[2] <> "" or
         so_slspsn[3] <> "" or
         so_slspsn[4] <> ""
      then
         mult_slspsn = true.
      else
         mult_slspsn = false.
 
      /* Display SO Order Date, etc in Frame B */
/*cy1010*      {us/so/sosomtdi.i} */
/*cy1010*/     {us/xx/xxsosomtdi.i}
 
      /* FOR RMA'S, THE USER MAY OPTIONALLY ATTACH A CALL */
      /* NUMBER TO THE ORDER.  CALL FSRMACA.P TO GET THAT */
      /* CALL NUMBER, AND, IF ENTERED, DEFAULT RELEVANT   */
      /* CALL FIELDS TO THE RMA BEING CREATED.            */
      if this-is-rma and new_order then do on error undo, retry:
 
         display so_nbr with frame a.
 
         {us/bbi/gprun.i ""fsrmaca.p""
            "(input  recid(rma_mstr),
              input  recid(so_mstr),
              output call-number)"}
 
         if call-number = "?" then undo, retry.
 
         assign
            so-detail-all = rmc_det_all.
 
         display
            so_ship
            so_bill
            so_cust
         with frame a.
 
         display
            so_po
         with frame b.
 
      end.    /* if this-is-rma and... */
 
      l_old_shipto = so_ship.
 
      /* GET SOLD-TO, BILL-TO, AND SHIP-TO CUSTOMER                         */
      /* FOR RMA'S, ALSO GET THE END USER                                   */
      /* SHIP-TO/SOLD-TO CHANGED; UPDATE TAX DATA ON CONFIRMATION. PREVIOUS */
      /* HEADER TAX ENVIRONMENT BLANKED OUT FOR RECALCULATION LATER         */
      assign
         so_recno  = recid(so_mstr)
         undo_cust = true
         l_edittax = no.
 
      run ectrl_1162(recid(so_mstr)).
 
      if soc_use_corr_inv = true then do:
         if (new_order and this-is-rma = false) or available cil_mstr then do:
            run ip_corr_inv.
            if key-function(lastkey) = "END-ERROR" then
               undo loopx, retry.
            hide frame f_cor_inv.
         end.
      end.
 
      if corr_inv = no then do:
/*cy1020* {us/bbi/gprun.i ""sosomtcm.p"" */
/*cy1020*/ {us/bbi/gprun.i ""xxsomtcm.p""
            "(input  this-is-rma,
              input  recid(rma_mstr),
              input  new_order,
              input  yes,
              output l_edittax)"}
 
         if undo_cust then do:
            local-undo = 3.
            undo trans2, leave.  /* MUST UNDO CREATION OF SO_MSTR */
         end. /* IF UNDO_CUST */
      end.
 
      /* SHIP-TO CANNOT BE CHANGED; QUANTITY TO INVOICE EXISTS */
      if l_old_shipto <> "" and
         l_old_shipto <> so_ship
      then do:
         if can-find(first sod_det where sod_domain = global_domain and
                                         sod_nbr    = so_nbr and
                                         sod_qty_inv <> 0 and
                                         sod_compl_stat = "")
         then do:
            /* OUTSTANDING QUANTITY TO INVOICE; SHIP-TO TAXES CANNOT BE UPDATED */
            {us/bbi/pxmsg.i &MSGNUM=2863 &ERRORLEVEL=4}
            display
               l_old_shipto @ so_ship
            with frame a.
            local-undo = 3.
            undo trans2, leave trans2.
         end. /* IF CAN-FIND FIRST SOD_DET */
      end. /* IF SHIP-TO IS CHANGED IN GTM */
 
      /* WHEN CREATING A NEW RMA, SOSOMTCM.P LOADS IN THE DEFAULT    */
      /* END USER (THE CUSTOMER), AND ALLOWS THE USER TO CHANGE IT.  */
      /* IF HE F4-ED OUT OF SOSOMTCM.P, THEN, RMA_ENDUSER GETS       */
      /* UNDONE AND LEFT BLANK, SO, FIX IT HERE...                   */
      if this-is-rma and new_order then do:
 
         if rma_enduser = "" then
            assign
               rma_enduser = so_cust
               rma_cust_ven = so_cust.
 
         for first eu_mstr where eu_domain = global_domain
            and eu_addr = rma_enduser
         no-lock: end.
 
         /* IF USER DIDN'T ATTACH A CALL TO THIS RMA */
         /* (AND DEFAULT SOME OF THE CALL FIELDS     */
         /* INTO THIS NEW ORDER), THEN OPTIONALLY    */
         /* DISPLAY SERVICE CONTRACTS FOR THIS END   */
         /* USER.                                    */
         if call-number = " " then do:
            {us/bbi/gprun.i ""fsrmasv.p""
               "(input      rma_enduser,
                 input        eu_type,
                 input        rmc_swsa,
                 input-output rma_contract,
                 input-output rma_ctype,
                 input-output rma_crprlist,
                 input-output rma_pr_list,
                 input-output rma_rstk_pct)"}
         end.    /* if call-number = " " */
 
      end.    /* if this-is-rma and new_order */
 
      /* SHIP-TO CHANGED; UPDATE TAX DATA ON CONFIRMATION. PREVIOUS */
      /* HEADER TAX ENVIRONMENT BLANKED OUT FOR RECALCULATION LATER */
 
      if not batchrun and
         l_old_shipto <> "" and
         l_old_shipto <> so_ship
      then do:
 
         /* ADDED CHECK FOR UPDATION OF INTRASTAT RECORDS WHEN */
         /* THE CHANGED SHIP-TO HAS A DIFFERENT COUNTRY        */
         for first iec_ctrl where iec_domain     = global_domain
            and iec_use_instat = yes
         no-lock: end.
 
         if available iec_ctrl
         then do:
 
            if can-find (ie_mstr where ie_domain = global_domain
                                   and ie_type   = "1"
                                   and ie_nbr    = so_mstr.so_nbr)
            then do:
 
               /* SHIP-TO CHANGED; UPDATE COUNTRY OF */
               /* DEST/DISP FOR INTRASTAT?           */
               {us/bbi/pxmsg.i &MSGNUM=6084 &ERRORLEVEL=1 &CONFIRM=l_edit_instat}
            end. /* IF CAN-FIND (ie_mstr... */
 
            if l_edit_instat = yes
            then do:
 
               for first ad_mstr where ad_domain = global_domain
                    and ad_addr = so_mstr.so_ship
               no-lock:
 
                  for first ie_mstr where ie_domain = global_domain
                       and ie_type   = "1"
                       and ie_nbr    = so_mstr.so_nbr
                  exclusive-lock:
 
                     ie_ctry_desdisp = ad_ctry.
 
                     for each ied_det where ied_domain = global_domain
                          and ied_type   = "1"
                          and ied_nbr    = sod_det.sod_nbr
                     exclusive-lock:
                        ied_ctry_desdisp = ad_ctry.
                     end. /* FOR EACH ied_det */
 
                  end. /* FOR FIRST ie_mstr */
 
               end. /* FOR FIRST ad_mstr */
 
            end. /* IF l_edit_instat = yes */
 
         end. /* IF AVAILABLE iec_ctrl */
 
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
                  so_taxc      = cm_mstr.cm_taxc.
            end. /* FOR FIRST CM_MSTR */
 
            if not available cm_mstr
            then do:
               for first ad_mstr
                  where ad_mstr.ad_domain = global_domain
                    and ad_mstr.ad_addr   = so_ship
               no-lock:
                  assign
                     so_taxable   = ad_mstr.ad_taxable
                     so_tax_usage = ad_mstr.ad_tax_usage
                     so_taxc      = ad_mstr.ad_taxc.
               end. /* FOR FIRST AD_MSTR */
            end.
 
            if not available cm_mstr and
               not available ad_mstr
            then do:
               for first cm_mstr
                  where cm_mstr.cm_domain = global_domain
                    and cm_mstr.cm_addr   = so_cust
               no-lock:
                  assign
                     so_taxable   = cm_mstr.cm_taxable
                     so_tax_usage = cm_mstr.cm_tax_usage
                     so_taxc      = cm_mstr.cm_taxc.
               end. /* FOR FIRST CM_MSTR */
            end.
 
            if l_vq_use_sold
            then do:
               find first cm_mstr
                  where cm_mstr.cm_domain = global_domain
                    and cm_mstr.cm_addr   = so_cust
               no-lock no-error.
               if available(cm_mstr)
               then do:
                  so_tax_usage = cm_mstr.cm_tax_usage.
               end.
            end. /* IF l_vq_use_sold */
 
            so_tax_env = "".
 
         end.  /* IF l_edittax IS TRUE */
 
      end. /* IF SHIP-TO CHANGED IN GTM AND NOT BATCHRUN */
 
      for first cm_mstr where cm_mstr.cm_domain = global_domain
           and cm_mstr.cm_addr = so_cust
      no-lock: end.
 
      for first bill_cm where bill_cm.cm_domain = global_domain
           and bill_cm.cm_addr = so_bill
      no-lock: end.
 
      for first ad_mstr where ad_domain = global_domain
         and ad_addr = so_bill
      no-lock: end.
 
      if ad_inv_mthd = "" then do:
 
         for first ad_mstr where ad_domain = global_domain
            and ad_addr = so_ship
         no-lock: end.
 
         if ad_inv_mthd = "" then
            for first ad_mstr where ad_domain = global_domain
               and ad_addr = so_cust
            no-lock: end.
 
      end. /* IF AD_INV_MTHD = "" */
 
      if new_order then
         so_inv_mthd = ad_inv_mthd.
 
      if new_order then
         substring(so_inv_mthd,3,1) = substring(ad_edi_ctrl[5],1,1).
 
      /*SET CUSTOMER VARIABLE USED BY PRICING ROUTINE gppibx.p*/
      picust = so_cust.
      if so_cust <> so_ship and
         can-find(cm_mstr where cm_mstr.cm_domain = global_domain and
                                cm_mstr.cm_addr = so_ship)
      then
         picust = so_ship.
 
      if new_order then
         line_pricing = pic_so_linpri.
      else
         line_pricing = no.
 
      order-header:
      do on error undo, retry with frame b:
 
         ststatus = stline[2].
         status input ststatus.
         del-yn = no.
 
         /* SET DEFAULTS WHEN CREATING A NEW ORDER - */
         /* USE SHIP-TO CUSTOMER INFO FOR DEFAULT IF */
         /* AVAILABLE ELSE USE SOLD-TO INFO          */
         if new so_mstr and corr_inv = false then do:
 
            run assign_new_so.
 
            assign
               so_cr_terms  = bill_cm.cm_cr_terms
               so_curr      = bill_cm.cm_curr
               so_fix_pr    = cm_mstr.cm_fix_pr
               so_disc_pct  = cm_mstr.cm_disc_pct
               so_shipvia   = cm_mstr.cm_shipvia
               so_partial   = cm_mstr.cm_partial
               so_rmks      = cm_mstr.cm_rmks
               so_site      = cm_mstr.cm_site
               so_taxable   = cm_mstr.cm_taxable
               so_taxc      = cm_mstr.cm_taxc
               so_pst       = cm_mstr.cm_pst
               so_fst_id    = cm_mstr.cm_fst_id
               so_pst_id    = ad_pst_id   /*ship-to*/
               so_fr_list   = cm_mstr.cm_fr_list
               so_fr_terms  = cm_mstr.cm_fr_terms
               so_fr_min_wt = cm_mstr.cm_fr_min_wt
               so_userid    = global_userid.
 
            {us/bbi/gprun.i ""gpsiver.p""
               "(input so_site,
                 input ?,
                 output return_int)"}
 
            if return_int = 0 then do:
               /* USER DOESN'T HAVE ACCESS TO DEFAULT SITE XXXX    */
               {us/bbi/pxmsg.i &MSGNUM=2711 &ERRORLEVEL=2 &MSGARG1=so_site}
               so_site = "".
               display so_site with frame b.
            end.
 
            /* GET DEFAULT TERMS INTEREST FOR ORDER */
            socrt_int = 0.
            if so_cr_terms <> "" then do:
               for first ct_mstr where ct_domain = global_domain
                  and ct_code = so_cr_terms
               no-lock:
                  socrt_int = ct_terms_int.
               end. /* FOR FIRST CT_MSTR */
            end. /* SO_CR_TERMS <> "" */
 
            /* SET NEW TAX DEFAULTS FOR GLOBAL TAX */
            /* LOAD DEFAULT TAX CLASS & USAGE */
            for first cm_mstr where cm_mstr.cm_domain = global_domain
                 and cm_mstr.cm_addr   = so_ship
            no-lock:
               assign
                  so_taxable   = cm_mstr.cm_taxable
                  so_tax_usage = cm_mstr.cm_tax_usage
                  so_taxc      = cm_mstr.cm_taxc.
            end. /* FOR FIRST CM_MSTR */
 
            if not available cm_mstr then
               for first ad_mstr
                  where ad_mstr.ad_domain = global_domain
                    and ad_mstr.ad_addr   = so_ship
               no-lock:
                  assign
                     so_taxable   = ad_mstr.ad_taxable
                     so_tax_usage = ad_mstr.ad_tax_usage
                     so_taxc      = ad_mstr.ad_taxc.
               end. /* FOR FIRST AD_MSTR */
 
 
            if not available cm_mstr and
               not available ad_mstr
            then
               for first cm_mstr where cm_mstr.cm_domain = global_domain
                    and cm_mstr.cm_addr   = so_cust
               no-lock:
                  assign
                     so_taxable   = cm_mstr.cm_taxable
                     so_tax_usage = cm_mstr.cm_tax_usage
                     so_taxc      = cm_mstr.cm_taxc.
               end. /* FOR FIRST CM_MSTR */
 
            for first ad_mstr where ad_domain = global_domain
               and ad_addr = so_ship
            no-lock: end.
 
            if not available ad_mstr then
               for first ad_mstr where ad_domain = global_domain
                  and ad_addr = so_cust
               no-lock: end.
 
            if l_vq_use_sold
               and available ad_mstr
               and ad_addr <> so_cust
            then do:
               for first ad_mstr where ad_domain = global_domain
                  and ad_addr   = so_cust
               no-lock: end.
            end. /* IF l_vq_use_sold AND ... */
 
            /* Refind the customer record after the taxes check*/
            for first cm_mstr where cm_mstr.cm_domain = global_domain
               and cm_mstr.cm_addr = so_cust
            no-lock: end.
 
           /* SET DEFAULTS FOR ALL FOUR SALESPERSONS. */
            do counter = 1 to 4:
 
               so_slspsn[counter] = cm_mstr.cm_slspsn[counter].
 
               if cm_mstr.cm_slspsn[counter] <> "" then do:
 
                  for first spd_det where spd_domain  = global_domain
                       and spd_addr    = so_slspsn[counter]
                       and spd_prod_ln = ""
                       and spd_part    = ""
                       and spd_cust    = cm_mstr.cm_addr
                  no-lock:
                     so_comm_pct[counter] = spd_comm_pct.
                  end. /* FOR FIRST SPD_DET */
 
                  if not available spd_det then
                     for first sp_mstr where sp_domain = global_domain
                          and sp_addr = cm_mstr.cm_slspsn[counter]
                     no-lock:
                        so_comm_pct[counter] = sp_comm_pct.
                     end. /* FOR FIRST SP_MSTR */
 
               end. /* IF CM_MSTR.CM_SLSPSN[CTR] <> "" */
 
            end. /* DO COUNTER = 1 TO 4 */
 
            if so_slspsn[2] <> "" or
               so_slspsn[3] <> "" or
               so_slspsn[4] <> ""
            then
               mult_slspsn = true.
            else
               mult_slspsn = false.
 
         end.  /* SET DEFAULTS IF NEW SO_MSTR */
 
         /* INITIALIZE TRANSPORT DAYS FROM          */
         /* DELIVERY TRANSIT LEAD-TIME (2.16.1).    */
         if available ad_mstr
            and not so_sched
         then do:
 
            {us/px/pxrun.i &PROC='getDefaultTransitLTDays'
                     &PROGRAM='sosoxr.p'
                     &HANDLE=ph_sosoxr
                     &PARAM="(input so_site,
                              input ad_ctry,
                              input ad_state,
                              input ad_city,
                              input """",
                              output translt_days)" }
            substring(so_conrep,2,6) = string(translt_days,"999.99").
         end.  /* IF AVAILABLE ad_mstr AND .. */
 
         /* LOAD DEFAULT TAX CLASS & USAGE */
         for first cm_mstr
            where cm_mstr.cm_domain = global_domain
              and cm_mstr.cm_addr   = so_ship
         no-lock:
            assign
               tax_in    = cm_mstr.cm_tax_in
               so_pst_id = cm_mstr.cm_pst_id.
         end. /* FOR FIRST CM_MSTR */
 
         if not available cm_mstr
         then do:
            for first ad_mstr
               where ad_mstr.ad_domain = global_domain
                 and ad_mstr.ad_addr   = so_ship
            no-lock:
               assign
                  tax_in    = ad_mstr.ad_tax_in
                  so_pst_id = ad_mstr.ad_pst_id.
            end. /* FOR FIRST AD_MSTR */
         end.
 
         if not available cm_mstr and
            not available ad_mstr
         then do:
            for first cm_mstr
               where cm_mstr.cm_domain = global_domain
                 and cm_mstr.cm_addr   = so_cust
            no-lock:
               assign
                  tax_in    = cm_mstr.cm_tax_in
                  so_pst_id = cm_mstr.cm_pst_id.
            end. /* FOR FIRST CM_MSTR */
         end.
 
         if this-is-rma then do:
 
            for first svc_ctrl where svc_domain = global_domain
            no-lock: end.
 
            assign
               rma_bill_to = so_bill
               rma_ship    = so_ship.
 
         end. /* IF this-is-rma */
 
         /* FIND OUT IF THIS IS A CREDITCARD SO */
         ccOrder = can-find(first qad_wkfl
                            where qad_domain = global_domain
                              and qad_key1 begins string(so_nbr, "x(8)")
                              and qad_key2 = "creditcard").
 
         /* CHECK CREDIT LIMIT */
         iValidCustomerCreditLimit =
            validCustomerCreditLimit(bill_cm.cm_addr, 0.0, 0.0, so_curr, 2, "SO", yes).
 
         if so_stat = ""
         then do:
            if (iValidCustomerCreditLimit < 0
               and not(ccOrder)
	           and soc_cr_hold = yes)
               and not isViewer
            then do:
 
               if this-is-rma
               then do:
 
                  if svc_hold_call = 1
                  then do:
 
                     if so_stat = ""
                     then do:
                        /* RMA ORDER PLACED ON CREDIT HOLD */
                        msg-arg = getTermLabel("RMA_ORDER",11).
                        {us/bbi/pxmsg.i &MSGNUM=690 &ERRORLEVEL=1 &MSGARG1=msg-arg}
                        so_stat = "HD".
                     end. /* IF so_stat = "" */
 
                  end. /* IF svc_hold_call = 1 */
 
                  if svc_hold_call = 2
                  then do:
 
                     /* CUSTOMER ON CREDIT HOLD OR OVER CREDIT LIMIT. */
                     /* RMA NOT ACCEPTED.                             */
                     msg-arg = getTermLabel("RMA_ORDER",11).
                     {us/bbi/pxmsg.i &MSGNUM=6791 &ERRORLEVEL=4 &MSGARG1=msg-arg}
 
                     if not batchrun
                     then
                        pause.
 
                     local-undo = 2.
                     undo trans2, leave.     /* MUST UNDO RMA CREATION */
 
                  end. /* IF svc_hold_call = 2 */
 
               end. /* IF THIS-IS-RMA */
 
               else do:
                  so_stat = "HD".
                  /* Sales Order placed on credit hold */
                  {us/bbi/pxmsg.i &MSGNUM=690 &ERRORLEVEL=1
                           &MSGARG1=getTermLabel(""SALES_ORDER"",20)}
               end. /* ELSE DO */
 
            end. /* IF credit limit is below balance */
         end. /* IF so_stat = "" */
 
         /* CHECK CREDIT HOLD */
         if new so_mstr
            and isCustomerOnCreditHold(input so_bill)
         then do:
 
            if this-is-rma then do:
               if svc_hold_call = 1 then do:
                  /* CUSTOMER ON CREDIT HOLD */
                  so_stat = "HD".
               end.
               else if svc_hold_call = 2 then do:
                  local-undo = 2.
                  undo trans2, leave.     /* MUST UNDO RMA CREATION */
               end.
            end.    /* if this-is-rma */
            else do:
               so_stat = "HD".
            end.    /* else, this isn't an RMA */
 
         end.
 
         /* TMS Black Box Interface */
         assign
            tms-error = 0.
 
         {us/bbi/gprun.i ""sotmsbb.p""
            "(input 'sow',
              input recid(so_mstr),
              input yes,
              output tms-error)"}
 
         if this-is-rma then
            rma-recno = recid(rma_mstr).
         else
            rma-recno = ?.
 
         /* UPDATE FRAME B - HEADER, TAX, SLSPSNS, FRT, ALLOCS */
/*cy1010* {us/so/sosomtdi.i} /* DISPLAY SO_ORD_DATE, ETC IN FRAME B */ */
/*cy1010*/ {us/xx/xxsosomtdi.i} /* DISPLAY SO_ORD_DATE, ETC IN FRAME B */
 
         undo_flag = true.
 
/*cy1020*         {us/bbi/gprun.i ""sosomtp.p"" */
/*c1402* /*cy1020*/        {us/bbi/gprun.i ""xxsosomtp.p"" */
/*c1402*/ {us/bbi/gprun.i ""xysosomtp.p""
            "(input this-is-rma,
              input using_cust_consignment)"}
         if lDomSwthBlocked then
            return.
 
         /* IF UNDO_FLAG THEN NEXT MAINLOOP (IN SOSOMT.P). */
 
         /* JUMP OUT IF S.O. WAS (SUCCESSFULLY) DELETED */
         if not can-find(so_mstr where so_domain = global_domain and
                                       so_nbr = input so_nbr)
         then do:
            local-undo = 1.
            leave trans2.     /* SO'S ALREADY BEEN DELETED - NOTHING TO UNDO */
         end. /* IF NOT CAN-FIND(SO_MSTR..) */
 
         if can-find(so_mstr where so_domain = global_domain
                               and so_nbr = input so_nbr
                               and so_compl_stat <> "")
            and not isViewer
         then do:
            local-undo = 1.
            leave trans2.     /* SO'S ALREADY BEEN DELETED - NOTHING TO UNDO */
         end. /* IF NOT CAN-FIND(SO_MSTR..) */
 
         if undo_flag then do:
            local-undo = 2.
            undo trans2, leave.  /* AN UNKNOWN ERROR OCCURRED NEEDING UNDO. */
         end. /* IF UNDO_FLAG */
 
         if (oldcurr <> so_curr) or oldcurr = "" then do:
            /* SET CURRENCY DEPENDENT FORMATS */
            {us/so/socurfmt.i}
            /* SET THE CURRENCY DEPENDENT FORMAT FOR PREPAID */
            prepaid_fmt = prepaid_old.
            {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output prepaid_fmt,
                                      input rndmthd)"}
            oldcurr = so_curr.
         end. /* IF OLDCURR <> SO_CURR */
 
         /* FOR RMAs,IF THE HEADER PERFORM DATE (perform_date) is LEFT */
         /* BLANK, SET IT TO THE HEADER DUE DATE (so_req_date)         */
         if perform_date = ? then do:
            if this-is-rma then
               perform_date = so_req_date.
            else
               perform_date = so_due_date.
         end. /* If perform_date = ? */
 
         if so_req_date = ? then
            so_req_date = so_due_date.
 
         if so_fsm_type <> "" and so_pricing_dt = ? then
            so_pricing_dt = so_ord_date.
 
         if so_pricing_dt = ? then do:
            if pic_so_date = "ord_date" then
               so_pricing_dt = so_ord_date.
            else
            if pic_so_date = "req_date" then
               so_pricing_dt = so_req_date.
            else
            if pic_so_date = "per_date" then
               so_pricing_dt = perform_date.
            else
            if pic_so_date = "prm_date" then
               so_pricing_dt = promise_date.
            else
            if pic_so_date = "due_date" then
               so_pricing_dt = so_due_date.
            else
               so_pricing_dt = today.
         end. /* IF SO_PRICING_DT = ? */
 
         if pic_so_date       = "prm_date"
            and promise_date  = ?
            and so_pricing_dt = ?
         then
            so_pricing_dt     = today.
 
         if this-is-rma then do:
            /* LET USER ENTER OTHER RMA-HEADER-SPECIFIC FIELDS */
            {us/bbi/gprun.i ""fsrmah1.p""
               "(input rma-recno,
                 input recid(so_mstr),
                 input new_order,
                 output undo_flag)"}
            if undo_flag then
               undo order-header, retry order-header.
         end. /* if this-is-rma */
 
      end. /* ORDER HEADER */
 
      if rebook_lines then do:
         {us/bbi/gprun.i ""sosomtrb.p""}
         rebook_lines = false.
      end.
 
      /* DETAIL - FIND LAST LINE */
      line = 0.
 
      for last sod_det where sod_domain = global_domain
         and sod_nbr = so_mstr.so_nbr
      use-index sod_nbrln no-lock:
         line = sod_line.
      end. /* FOR LAST SOD_DET */
 
      /* Check for custom program set up in menu system */
      if this-is-rma then do:
         {us/fs/fsmnp02.i ""fsrmamt.p"" 10 """(input so_recno, input rma-recno)"""}
      end.
      else do:
         {us/fs/fsmnp02.i ""sosomt.p"" 10 """(input so_recno)"""}
      end.
 
      /* If EMT, determine the Comment Type */
      run determine-bu-lvl (output emt-bu-lvl).
 
      /* COMMENTS */
      assign
         global_lang = so_mstr.so_lang
         global_type = "".
 
      if socmmts = yes then do:
         assign
            cmtindx     = so_mstr.so_cmtindx
            global_ref  = so_mstr.so_cust
            save_part   = global_part
            global_part = emt-bu-lvl.
         {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""so_mstr"")"}
         assign
            so_mstr.so_cmtindx = cmtindx
            global_part = save_part.
         if this-is-rma then
            rma_mstr.rma_cmtindx = cmtindx.
      end. /* IF SOCMMTS = YES */
 
      /* IF THEY'VE MADE IT TO HERE, ALL IS WELL */
      local-undo = 0.
 
   end. /* DO TRANSACTION #2 */
 
   if local-undo = 0 then do:
      /*INITIALIZE QTY ACCUMULATION WORKFILES USED BY BEST PRICING*/
      {us/bbi/gprun.i ""gppiqty1.p""
         "(input ""1"",
           input so_mstr.so_nbr,
           input yes,
           input yes)"}
   end.  /* if local-undo = 0 */
 
end.
 
hide frame sold_to no-pause.
hide frame ship_to no-pause.
hide frame b1 no-pause.
hide frame b no-pause.
hide frame a no-pause.
hide frame f_cor_inv no-pause.
not_okay = local-undo.
/*cy1020*  {us/so/socimthd.i &prog="'SO'"} */
/*cy1020*/ {us/xx/xxsocimthd.i &prog="'SO'"}
 
PROCEDURE assign_new_so:
/* ------------------------------------------------------------------
Purpose:
Parameters:  <None>
Notes:
------------------------------------------------------------------*/
 
   if so_mstr.so_cust <> so_mstr.so_ship
   then do:
 
      if can-find(cm_mstr where cm_mstr.cm_domain = global_domain and
                                cm_mstr.cm_addr = so_ship)
      then do:
         for first cm_mstr where cm_mstr.cm_domain = global_domain
              and cm_mstr.cm_addr = so_mstr.so_ship
         no-lock: end.
         so_mstr.so_lang = cm_mstr.cm_lang.
      end. /* IF CAN-FIND */
 
      else do:
         for first ad_mstr where ad_domain = global_domain
              and ad_addr = so_mstr.so_ship
         no-lock: end.
         so_mstr.so_lang = ad_lang.
      end. /* ELSE DO */
 
   end. /* IF so_cust <> so_ship */
   else
      so_mstr.so_lang = cm_mstr.cm_lang.
 
END PROCEDURE.
 
PROCEDURE determine-bu-lvl:
   /* ------------------------------------------------------------------
   Purpose:     Get EMT Business Level
   Parameters:  p-emt-bu-level Business Unit Level
   Notes:
   ------------------------------------------------------------------*/
   define output parameter p-emt-bu-lvl like global_part.
 
   p-emt-bu-lvl = "".
 
   if     so_mstr.so_primary and
      not so_mstr.so_secondary
   then
      p-emt-bu-lvl = "MAN".
   else
   if so_mstr.so_primary           and
      so_mstr.so_secondary         and
      so_mstr.so_app_owner = "DOM" and
      so_mstr.so__qadl04
   then
      p-emt-bu-lvl = "PBU".
   else
   if so_mstr.so_primary  and
      so_mstr.so_secondary
   then
      p-emt-bu-lvl = "MBU".
   else
   if so_mstr.so_secondary
   then
      p-emt-bu-lvl = "SBU".
 
END PROCEDURE.
