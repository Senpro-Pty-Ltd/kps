/* xxsosomtlb.p  - SALES ORDER MAINTENANCE LINE DETAIL SUBROUTINE            */
/* sosomtlb.p  - SALES ORDER MAINTENANCE LINE DETAIL SUBROUTINE              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsosomtlb.p,v 1.2 2018/03/13 17:10:01 gbg Exp $: */
/* REVISION: 6.0      LAST MODIFIED: 01/31/91   BY: afs *D327*               */
/* REVISION: 6.0      LAST MODIFIED: 09/19/91   BY: afs *F040*               */
/* REVISION: 6.0      LAST MODIFIED: 11/13/91   BY: WUG *D887*               */
/* REVISION: 7.0      LAST MODIFIED: 01/13/92   BY: afs *F042*               */
/* REVISION: 7.0      LAST MODIFIED: 02/21/92   BY: afs *F223*               */
/* REVISION: 7.0      LAST MODIFIED: 03/24/92   BY: dld *F297*               */
/* REVISION: 7.0      LAST MODIFIED: 04/06/92   BY: afs *F356*               */
/* REVISION: 7.0      LAST MODIFIED: 04/16/92   BY: dld *F382*               */
/* REVISION: 7.0      LAST MODIFIED: 06/12/92   BY: tjs *F504*               */
/* REVISION: 7.0      LAST MODIFIED: 06/16/92   BY: afs *F519*               */
/* REVISION: 7.0      LAST MODIFIED: 06/26/92   BY: afs *F711*               */
/* REVISION: 7.0      LAST MODIFIED: 07/27/92   BY: tjs *F765*               */
/* REVISION: 7.0      LAST MODIFIED: 07/27/92   BY: tjs *F802*               */
/* REVISION: 7.3      LAST MODIFIED: 09/17/92   BY: tjs *G035*               */
/* REVISION: 7.3      LAST MODIFIED: 10/06/92   BY: mpp *G013*               */
/* REVISION: 7.3      LAST MODIFIED: 01/26/93   BY: bcm *G429*               */
/* REVISION: 7.3      LAST MODIFIED: 02/08/93   BY: bcm *G415*               */
/* REVISION: 7.3      LAST MODIFIED: 04/05/93   BY: bcm *G889*               */
/* REVISION: 7.3      LAST MODIFIED: 04/15/93   BY: tjs *G948*               */
/* REVISION: 7.4      LAST MODIFIED: 06/21/93   BY: pcd *H008*               */
/* REVISION: 7.4      LAST MODIFIED: 08/23/93   BY: cdt *H049*               */
/* REVISION: 7.4      LAST MODIFIED: 10/19/93   BY: cdt *H184*               */
/* REVISION: 7.4      LAST MODIFIED: 02/11/94   BY: dpm *FM10*               */
/* REVISION: 7.4      LAST MODIFIED: 03/18/94   BY: dpm *FM25*               */
/* REVISION: 7.4      LAST MODIFIED: 06/10/94   BY: qzl *H380*               */
/* REVISION: 7.4      LAST MODIFIED: 07/11/94   BY: bcm *H438*               */
/* REVISION: 7.4      LAST MODIFIED: 08/17/94   BY: dpm *FQ29*               */
/* REVISION: 7.4      LAST MODIFIED: 08/29/94   BY: bcm *H494*               */
/* REVISION: 7.4      LAST MODIFIED: 09/02/94   BY: dpm *FQ53*               */
/* REVISION: 7.4      LAST MODIFIED: 10/28/94   BY: dpm *FR95*               */
/* REVISION: 7.4      LAST MODIFIED: 11/07/94   BY: str *FT44*               */
/* REVISION: 7.4      LAST MODIFIED: 11/16/94   BY: qzl *FT43*               */
/* REVISION: 7.4      LAST MODIFIED: 11/21/94   BY: afs *H605*               */
/* REVISION: 7.4      LAST MODIFIED: 01/13/95   BY: dpm *F0DR*               */
/* REVISION: 7.4      LAST MODIFIED: 01/17/95   BY: srk *G0C1*               */
/* REVISION: 7.4      LAST MODIFIED: 01/31/95   BY: bcm *F0G8*               */
/* REVISION: 7.4      LAST MODIFIED: 02/23/95   BY: jzw *H0BM*               */
/* REVISION: 7.4      LAST MODIFIED: 03/06/95   BY: wjk *H0BT*               */
/* REVISION: 7.4      LAST MODIFIED: 03/09/95   BY: kjm *F0K6*               */
/* REVISION: 7.4      LAST MODIFIED: 03/31/95   BY: rxm *F0PR*               */
/* REVISION: 7.4      LAST MODIFIED: 04/17/95   BY: jpm *H0CJ*               */
/* REVISION: 8.5      LAST MODIFIED: 03/05/95   BY: DAH *J042*               */
/* REVISION: 7.4      LAST MODIFIED: 10/23/95   BY: rxm *G19G*               */
/* REVISION: 7.4      LAST MODIFIED: 11/22/95   BY: ais *H0H2*               */
/* REVISION: 8.5      LAST MODIFIED: 11/07/95   BY: taf *J053*               */
/* REVISION: 8.5      LAST MODIFIED: 12/01/95   BY: *J04C* Sue Poland        */
/* REVISION: 8.5      LAST MODIFIED: 12/04/95   BY: *J04C* Tom Vogten        */
/* REVISION: 8.6      LAST MODIFIED: 09/27/96   BY: svs *K007*               */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Elke Van Maele    */
/* REVISION: 8.6      LAST MODIFIED: 11/05/96   BY: *H0NR* Suresh Nayak      */
/* REVISION: 8.6      LAST MODIFIED: 12/31/96   BY: *K03Y* Jean Miller       */
/* REVISION: 8.6      LAST MODIFIED: 06/16/97   BY: *J1SY* Suresh Nayak      */
/* REVISION: 8.6      LAST MODIFIED: 06/25/97   BY: *K0FM* Kieu Nguyen       */
/* REVISION: 8.6      LAST MODIFIED: 07/15/97   BY: *K0G6* Arul Victoria     */
/* REVISION: 8.6      LAST MODIFIED: 07/01/97   BY: *K0DH* Jim Williams      */
/* REVISION: 8.6      LAST MODIFIED: 08/06/97   BY: *J1YG* Seema Varma       */
/* REVISION: 8.6      LAST MODIFIED: 07/22/97   BY: *H1B1* Suresh Nayak      */
/* REVISION: 8.6      LAST MODIFIED: 09/09/97   BY: *H1F2* Todd Runkle       */
/* REVISION: 8.6      LAST MODIFIED: 09/29/97   BY: *K0HB* Kieu Nguyen       */
/* REVISION: 8.6      LAST MODIFIED: 10/08/97   BY: *K0N5* Kieu Nguyen       */
/* REVISION: 8.6      LAST MODIFIED: 11/18/97   BY: *J25B* Aruna Patil       */
/* REVISION: 8.6      LAST MODIFIED: 12/18/97   BY: *K15N* Jerry Zhou        */
/* REVISION: 8.6      LAST MODIFIED: 01/23/98   BY: *J2BW* Nirav Parikh      */
/* REVISION: 8.6      LAST MODIFIED: 01/31/98   BY: *J2D6* Seema Varma       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane         */
/* REVISION: 8.6E     LAST MODIFIED: 03/21/98   BY: *K1KQ* Niranjan R.       */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton      */
/* Old ECO marker removed, but no ECO header exists *G501*                   */
/* REVISION: 8.6E     LAST MODIFIED: 08/03/98   BY: *L024* Sami Kureishy     */
/* REVISION: 8.6E     LAST MODIFIED: 03/11/99   BY: *J3C5* Anup Pereira      */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Patti Gaultney    */
/* REVISION: 9.1      LAST MODIFIED: 12/15/99   BY: *N05D* Steve Nugent      */
/* REVISION: 9.1      LAST MODIFIED: 01/19/2000 BY: *L0PY* Kedar Deherkar    */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 04/25/00   BY: *N0CG* Santosh Rao       */
/* REVISION: 9.1      LAST MODIFIED: 06/30/00   BY: *N0DX* Mudit Mehta       */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb               */
/* REVISION: 9.1      LAST MODIFIED: 09/25/00   BY: *L121* Gurudev C         */
/* REVISION: 9.1      LAST MODIFIED: 12/18/00   BY: *M0TZ* Veena Lad         */
/* REVISION: 9.1      LAST MODIFIED: 10/17/00   BY: *N0WB* Mudit Mehta       */
/* REVISION: 9.1      LAST MODIFIED: 02/26/01   BY: *M126* Sandeep P         */
/* Revision: 1.34.1.16    BY: Katie Hilbert     DATE: 04/01/01  ECO: *P002*  */
/* Revision: 1.34.1.19    BY: Sandeep P.        DATE: 03/14/01  ECO: *M13J*  */
/* Revision: 1.34.1.22    BY: Russ Witt         DATE: 06/13/01  ECO: *P00J*  */
/* REVISION: 9.1      LAST MODIFIED: 29 JUN 2001 BY: *N0ZX* Ed van de Gevel  */
/* Revision: 1.34.1.23    BY: Dan Herman        DATE: 07/09/01  ECO: *P007*  */
/* Revision: 1.34.1.25    BY: Reetu Kapoor      DATE: 08/01/01  ECO: *N0ZT*  */
/* Revision: 1.34.1.26    BY: Russ Witt         DATE: 09/21/01  ECO: *P01H*  */
/* Revision: 1.34.1.27    BY: Russ Witt         DATE: 10/17/01  ECO: *P021*  */
/* Revision: 1.34.1.28    BY: Steve Nugent      DATE: 10/22/01  ECO: *P004*  */
/* Revision: 1.34.1.30    BY: Santhosh Nair     DATE: 12/10/01  ECO: *M1H1*  */
/* Revision: 1.34.1.31    BY: B. Gates          DATE: 03/04/02  ECO: *N1BT*  */
/* Revision: 1.34.1.32    BY: Inna Fox          DATE: 02/14/02  ECO: *M12Q*  */
/* Revision: 1.34.1.33    BY: Patrick Rowan     DATE: 03/24/02  ECO: *P00G*  */
/* Revision: 1.34.1.34    BY: Inna Fox          DATE: 04/17/02  ECO: *P05J*  */
/* Revision: 1.34.1.35    BY: Ashish M.         DATE: 05/20/02  ECO: *P04J*  */
/* Revision: 1.34.1.36    BY: Russ Witt         DATE: 06/03/02  ECO: *P07M*  */
/* Revision: 1.34.1.37    BY: Anitha Gopal      DATE: 06/17/02  ECO: *N1KQ*  */
/* Revision: 1.34.1.38    BY: Steve Nugent      DATE: 08/08/02  ECO: *P0DN*  */
/* Revision: 1.34.1.41    BY: John Pison        DATE: 08/30/02  ECO: *P0HM*  */
/* Revision: 1.34.1.43    BY: Ed van de Gevel   DATE: 12/03/02  ECO: *N1XD*  */
/* Revision: 1.34.1.45    BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.34.1.46    BY: Rajinder Kamra      DATE: 06/23/03  ECO: *Q003* */
/* Revision: 1.34.1.47    BY: Rajinder Kamra      DATE: 07/17/03  ECO: *Q013* */
/* Revision: 1.34.1.48    BY:Mercy Chittilapilly  DATE:08/04/03   ECO: *N2DJ* */
/* Revision: 1.34.1.49    BY:Somesh Jeswani       DATE:09/29/03   ECO: *P14M* */
/* Revision: 1.34.1.50    BY: Ashish Maheshwari   DATE:11/28/03   ECO: *P1CN* */
/* Revision: 1.34.1.51    BY: Ed van de Gevel     DATE: 12/02/03  ECO: *P0QT* */
/* Revision: 1.34.1.54    BY: Katie Hilbert       DATE: 03/05/04  ECO: *Q06B* */
/* Revision: 1.34.1.55    BY: Matthew Lee         DATE: 09/21/04  ECO: *N2XY* */
/* Revision: 1.34.1.56    BY: Tejasvi Kulkarni    DATE: 02/14/05  ECO: *P36W* */
/* Revision: 1.34.1.59    BY: Ed van de Gevel     DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.34.1.60    BY: Bhavik Rathod       DATE: 03/15/05  ECO: *P3B6* */
/* Revision: 1.34.1.61    BY: Tejasvi Kulkarni    DATE: 03/31/05  ECO: *P3B5* */
/* Revision: 1.34.1.63    BY: Niranjan Ranka      DATE: 05/03/05  ECO: *R01B* */
/* Revision: 1.34.1.65    BY: Paul Dreslinski     DATE: 08/15/05  ECO: *Q0KY* */
/* Revision: 1.34.1.61.1.2 BY: Tiziana Giustozzi  DATE: 08/22/05  ECO: *R021* */
/* Revision: 1.34.1.66     BY: Michael Hansen     DATE: 10/04/05  ECO: *R021* */
/* Revision: 1.34.1.67     BY: Sushant Pradhan    DATE: 04/17/06  ECO: *P4PD* */
/* Revision: 1.34.1.68     BY: Shilpa Kamath      DATE: 06/12/06  ECO: *R05X* */
/* Revision: 1.34.1.69     BY: Dinesh Dubey       DATE: 01/07/07  ECO: *R0C6* */
/* Revision: 1.34.1.70     BY: Sumit Karunakaran  DATE: 01/07/08  ECO: *P5MB* */
/* Revision: 1.34.1.72     BY: Vivek Kamath       DATE: 02/05/08  ECO: *P5S6* */
/* Revision: 1.34.1.75     BY: Kunal Pandya       DATE: 08/04/08  ECO: *Q1QM* */
/* Revision: 1.34.1.76     BY: Niranjan Ranka     DATE: 10/27/08  ECO: *R16D* */
/* Revision: 1.34.1.77     BY: Rajalaxmi Ganji     DATE: 12/17/08  ECO: *Q22R* */
/* Revision: 1.34.1.78     BY: Trupti Khairnar     DATE: 03/13/09  ECO: *Q2J1* */
/* $Revision: 1.2 $  BY: Sandeep Rohila   DATE: 06/29/09  ECO: *R1KQ* */
/* CYB    LAST MODIFIED: 19-JUL-2010    BY:  nac *q9021*cy1022*              */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/



         /*!
            SOSOMTLB.P is called by SOSOMTLA.P to maintain data elements in the
            larger line item data entry frame in SO and RMA Maintenance.
          */

         /*!
            Input parameters are:

            this-is-rma:    Will be yes in RMA Maintenance and no in Sales
                            Order Maintenance.
            rma-recno:      When processing an RMA, this is the rma_mstr (the
                            RMA header) recid.
            rma-issue-line: When processing RMA's, this will be yes when
                            maintaining the issue (outgoing) lines, and no
                            when maintaining the receipt (incoming) lines.
                            In SO Maintenance, this will be yes.
            rmd-recno:      In RMA Maintenance, this will contain the recid
                            for rmd_det (the RMA line).  For SO Maintenance,
                            this will be ?.
            l_prev_um_conv: When the User changes the type to "M" on sales
                            Order or RMA Maintenance then the Inventory will
                            be correctly de-allocated using correct Um
            l_sodqtyord   : Store the previous Quantity to Order to reduce the
                            Quantity Required when user changes the Ship Type
                            from <blank> to Memo.

            Input/Output parameters are:

            confirmApoAtpOrderLine:
                            Logical whether to confirm APO ATP request in
                            Adexa model.

            Output parameters are:

            atp-site:             Site returned from APO ATP request.
            atp-cum-qty:          Quantity returned from APO ATP request.
            atp-qty-site-changed: Logical whether Site or Quantity from APO ATP
                                  changed from orginal order line request.

*/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/gp/gprunpdf.i "gpglvpl" "p"}


/* CHANGES MADE HERE MAY ALSO NEED TO BE MADE IN fseomtlb.p */

define input parameter this-is-rma       as  logical.
define input parameter rma-recno         as  recid.
define input parameter rma-issue-line    as  logical.
define input parameter rmd-recno         as  recid.
define input parameter l_prev_um_conv    like sod_um_conv no-undo.
define input parameter using_consignment like mfc_logical no-undo.
define input parameter l_sodqtyord       like sod_qty_ord no-undo.
define input-output parameter confirmApoAtpOrderLine
                                         as logical        no-undo.
define output parameter atp-site         like  sod_site    no-undo.
define output parameter atp-cum-qty      like  sod_qty_ord no-undo.
define output parameter atp-qty-site-changed as logical  no-undo.

define new shared variable zone_to     like txz_tax_zone.
define new shared variable zone_from   like txz_tax_zone.
define new shared variable tax_usage   like so_tax_usage no-undo.
define new shared variable tax_env     like so_tax_env no-undo.
define new shared variable temp_zone   like txz_tax_zone.
define new shared variable l_loop_seta like mfc_logical no-undo.

/* DEFINE RNDMTHD FOR CALL TO GPFRLWT.P */
define shared variable rndmthd         like rnd_rnd_mthd.
define shared variable prev_type       like sod_type.
define shared variable all_days        as integer.
define shared variable clines          as integer.
define shared variable desc1           like pt_desc1.
define shared variable line            like sod_line.
define shared variable sngl_ln         like soc_ln_fmt.
define shared variable sod_recno       as recid.
define shared variable sodcmmts        like soc_lcmmts.
define shared variable sod-detail-all  like soc_det_all.
define shared variable so_recno        as recid.
define shared variable totallqty       like sod_qty_all.
define shared variable so_db           like dc_name.
define shared variable inv_db          like dc_name.
define shared variable undo_all2       like mfc_logical.
define shared variable mult_slspsn     like mfc_logical no-undo.
define shared variable new_line        like mfc_logical.
define shared variable old_sod_site    like sod_site no-undo.
define shared variable freight_ok      like mfc_logical.
define shared variable old_ft_type     like ft_type.
define shared variable calc_fr         like mfc_logical.
define shared variable disp_fr         like mfc_logical.
define shared variable soc_pc_line     like mfc_logical.
define shared variable err-flag        as integer.
define shared variable sonbr           like sod_nbr.
define shared variable soline          like sod_line.
define shared variable exch-rate       like exr_rate.
define shared variable exch-rate2      like exr_rate2.
define shared variable discount        as decimal.
define shared variable reprice_dtl     like mfc_logical.
define shared variable promise_date    as date.
define shared variable new_order       like  mfc_logical.
/* TAX_IN IS USED BY FSRMAVAT.P */
define shared variable tax_in          like  cm_tax_in.
/* THE SHARED VARIABLE current_fr_terms IS DEFINED IN pppivar.i, BUT */
/* SINCE ONLY THIS VARIABLE IS REQUIRED, TO AVOID OVERHEADS IT HAS   */
/* BEEN EXPLICITLY DEFINED HERE, INSTEAD OF CALLING PPPIVAR.I        */
define shared variable current_fr_terms like so_fr_terms.
/*cy1022*/ define shared variable cyb_so_type as char no-undo.

define variable sort                   as character format "x(28)"
                                       extent 4 no-undo.
define variable counter                as integer no-undo.
define variable valid_acct             like mfc_logical.
define variable glvalid                like mfc_logical.
define variable detqty                 like sod_qty_ord.
define variable old_site               like sod_site.
define variable continue               like mfc_logical no-undo.
define variable prev_qty_all           like sod_qty_all no-undo.
define variable warn                   like mfc_logical no-undo.
define variable rma-receipt-line       as  logical.
define variable frametitle             as character format "x(20)".
define variable sodstdcost             like sod_std_cost     no-undo.
define variable mc-error-number        like msg_nbr          no-undo.
define variable pkg_code_alt           like pt_part extent 7 no-undo.
define variable ord_mult_alt           like sod_ord_mult extent 7    no-undo.
define variable charge_type_alt        like cct_charge_type extent 7 no-undo.
define variable i                      as integer            no-undo.
define variable old_pkg_code           like sod_pkg_code     no-undo.
define variable last-field             as character          no-undo.
define variable old_charge_type        like cct_charge_type  no-undo.
define variable v_charge_type          like cct_charge_type  no-undo.
define variable msgnbr                 as integer            no-undo.
define variable chargeable             like mfc_logical      no-undo.
define variable c-alt-container        as character format "x(20)" no-undo.
define variable c-std-pack             as character format "x(12)" no-undo.
define variable c-charge-type          as character format "x(12)" no-undo.
define variable this-is-so             as logical            no-undo.
define variable atp-ok                 as logical            no-undo.
define variable atp-due-date           like sod_due_date     no-undo.
define variable auto-prom-date         like sod_promise_date no-undo.
define variable prev-confirm           like sod_confirm      no-undo.
define variable atp-due-date-changed   like mfc_logical      no-undo.
define variable l_prompt               like mfc_logical      no-undo.
define variable l_undo                 like mfc_logical      no-undo.
define variable proc_id                as character          no-undo.
define variable set-sod-type           like mfc_logical initial no no-undo.

/* BTB VARIABLES */
define shared variable s-btb-so        as   logical.
define shared variable s-sec-due       as   date.
define        variable exp-del         as   date.
define        variable pri-due         as   date.
define        variable transnbr        like cmf_trans_nbr.
define        variable prev-promise-date   like sod_promise_date.
define shared variable prev-due-date   like sod_due_date.
define shared variable po-ack-wait     as logical no-undo.
define        variable p-edi-rollback  as logical no-undo initial no.
define        variable net_avail       like sod_qty_all no-undo.
define        variable new_record      as logical no-undo.

define variable l_use_edi              like mfc_logical initial yes no-undo.
define variable l_update_qty_all       like mfc_logical initial no  no-undo.
define variable l_invalid_category     like mfc_logical initial no  no-undo.
define variable l_old_fr_list          like sod_fr_list             no-undo.
define variable l_undo_all2            like mfc_logical             no-undo.

define variable moduleGroup            as character no-undo.
define variable checkAtp               as logical   no-undo.
define variable useApoAtp              as logical   no-undo.
define variable errorResult            as character no-undo.
define variable apoAtpDelAvail         as logical   no-undo initial yes.
define variable apoAtpDelAvailMsg      as integer   no-undo.
define variable stdAtpUsed             as logical   no-undo.
define variable lv_error_num           as integer   no-undo.
define variable lv_name                as character no-undo.

define variable l_ret-flag             as integer   no-undo.
define variable l_err_flag             as integer   no-undo.

define variable l_input_sod_qty_all like sod_qty_all no-undo.
define variable l_det-flag          like mfc_logical no-undo.
define variable l_prev_qty_pick     like sod_qty_pick no-undo.

define new shared variable alc_sod_nbr  like sod_nbr.
define new shared variable alc_sod_line like sod_line.
define new shared variable tot_qty_all  like lad_qty_all.

define variable l_pt_lot_ser as character no-undo.
{us/so/sotmpdef.i new}

define shared stream apoAtpStream.

{us/px/pxmaint.i}

/* Define Handles for the programs. */
{us/px/pxphdef.i ppitxr}
{us/px/pxphdef.i sosoxr1}
{us/px/pxphdef.i giapoxr}
/* End Define Handles for the programs. */

/* APO ATP Global Defines */
{us/gi/giapoatp.i}

define        variable c1-discount like discount no-undo.
define shared variable corr_inv    like mfc_logical no-undo.
define        variable err_level   as integer no-undo.
define        variable v_is_avail  as logical no-undo.
define     shared variable inv_org               like cil_prev_inv no-undo.

{us/so/sobtbvar.i}    /* BACK TO BACK SHARED WORKFILES AND VARIABLES */

{us/gp/gptxcdec.i}    /* DECLARATIONS FOR us/gp/gptxcval.i */

{us/bbi/gpfilev.i} /* VARIABLE DEFINITIONS FOR gpfile.i */

define shared frame c.
define shared frame d.
define shared frame a.

/*THIS TEMP TABLE IS CREATED TO CALCULATE FREIGHT CHARGES  */
/*WHEN A NEW SALES ORDER LINE IS ADDED TO AN EXISTING ORDER*/
/*WHEN THE FREIGHT TYPE IS "INCLUDE".                      */
define shared temp-table  l_fr_table
       field l_fr_sonbr   like sod_nbr
       field l_fr_soline  like sod_line
       field l_fr_chrg    like sod_fr_chg
       field l_sodlist_pr like sod_list_pr
       index nbrline is primary l_fr_sonbr l_fr_soline.

/*DEFINE SHARED FORMS*/
{us/so/solinfrm.i}

/* Update Restrictions Temp Table Definition */
{us/up/updaterestriction.i}

/* CONSIGNMENT VARIABLES */
{us/so/socnvars.i}
using_cust_consignment = using_consignment.

form
   sod_pkg_code    colon 20 label "Container Item"
   sod_ord_mult    colon 20
   sod_charge_type colon 20
   sod_alt_pkg     colon 20
with frame cont_pop overlay side-labels centered row 12.
/* SET EXTERNAL LABELS */
setFrameLabels(frame cont_pop:handle).

form
   so_nbr    colon 7  label "Order"
   so_cust   colon 25 label "Bill-To"
   sngl_ln   colon 42 label "Ln Fmt"
   inv_org   colon 55 label "Org"
with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
   pkg_code_alt[1]
   pkg_code_alt[2]
   pkg_code_alt[3]
   pkg_code_alt[4]
   pkg_code_alt[5]
   pkg_code_alt[6]
   pkg_code_alt[7]
with frame alt overlay centered side-labels
title color normal (getFrameTitle("ALTERNATE_CONTAINERS",29)).
 /* SET EXTERNAL LABELS */
setFrameLabels(frame alt:handle).

form
   c-alt-container    at 8
   c-std-pack         at 28
   c-charge-type      at 42 skip(1)

   " 01."             at 3
   pkg_code_alt[1]    at 8
   ord_mult_alt[1]    at 30
   charge_type_alt[1] at 44 skip

   " 02."             at 3
   pkg_code_alt[2]    at 8
   ord_mult_alt[2]    at 30
   charge_type_alt[2] at 44 skip

   " 03."             at 3
   pkg_code_alt[3]    at 8
   ord_mult_alt[3]    at 30
   charge_type_alt[3] at 44 skip

   " 04."             at 3
   pkg_code_alt[4]    at 8
   ord_mult_alt[4]    at 30
   charge_type_alt[4] at 44 skip

   " 05."             at 3
   pkg_code_alt[5]    at 8
   ord_mult_alt[5]    at 30
   charge_type_alt[5] at 44 skip

   " 06."             at 3
   pkg_code_alt[6]    at 8
   ord_mult_alt[6]    at 30
   charge_type_alt[6] at 44 skip

   " 07."             at 3
   pkg_code_alt[7]    at 8
   ord_mult_alt[7]    at 30
   charge_type_alt[7] at 44 skip
with frame alt-clc overlay centered no-labels width 60
title color normal (getFrameTitle("ALTERNATE_CONTAINERS",29)).
 /* SET EXTERNAL LABELS */
setFrameLabels(frame alt-clc:handle).

 /*cy1022>>*/
 form
 sod__chr05 colon 20 label "Mths of Service"
 sod__chr09 colon 55 label "Test Method" skip(1)
 sod__chr06 colon 20 label "Wet Down Code"
 sod__chr10 colon 55 label "Test Results" skip(1)
 sod__chr07 colon 20 label "Manufacture Code" skip(1)
 sod__dte01 colon 20 label "Date of Sale" skip(1)
 sod__chr08 colon 20 label "Manufacture Source" skip(1)
 with frame cyb_warr overlay centered side-labels width 70 row 10.

 /* SET EXTERNAL LABELS */
setFrameLabels(frame cyb_warr:handle).
/*cy1022<<*/

 /* DETERMINE IF CONTAINER AND LINE CHARGES ARE ENABLED */
{us/cc/cclc.i}

define shared temp-table tt_soddet no-undo like sod_det.

assign
   c-alt-container = getTermLabel("ALTERNATE_CONTAINER",20)
   c-std-pack      = getTermLabel("STD_PACK_QTY",12)
   c-charge-type   = getTermLabel("CHARGE_TYPE",12).

/* ENSURE NECESSARY CODE_MSTR RECORDS EXIST */
if this-is-rma and
   not can-find(code_mstr where code_domain = global_domain
                            and code_fldname = "tr_type"
                            and code_value = "ISS-RMA")
then run createCodeMstr.

find first so_mstr
   where recid(so_mstr) = so_recno exclusive-lock no-error.

find first sod_det
   where recid(sod_det) = sod_recno exclusive-lock no-error.

for first soc_ctrl
      fields(soc_domain
             soc_all_avl
             soc_due_calc
             soc_lcmmts
             soc_atp_enabled
             soc_horizon
             soc_shp_lead
             soc_calc_promise_date
             soc_use_btb)
   where soc_domain = global_domain no-lock:
end. /* FOR FIRST SOC_CTRL */

rma-receipt-line = no.
if this-is-rma then do:
   find rma_mstr where recid(rma_mstr) = rma-recno
      exclusive-lock no-error.
   find rmd_det where recid(rmd_det) = rmd-recno
      exclusive-lock no-error.

   for first rmc_ctrl
      fields( rmc_domain rmc_lcmmts)
      where rmc_domain = global_domain
   no-lock:
   end. /* FOR FIRST RMC_CTRL */

   if not rma-issue-line then
      rma-receipt-line = yes.
end.

this-is-so =  if so_fsm_type = "" then yes else no.

find first tt_soddet no-error.
if available tt_soddet then
   old_site = tt_soddet.sod_site.

run siteChanged.

for first si_mstr
   fields( si_domain si_auto_loc si_db si_site si_status)
   where si_domain = global_domain
    and  si_site   = sod_det.sod_site
no-lock:
end. /* FOR FIRST SI_MSTR */

/* SET SLS, DISC ACCTS BASED ON PRODUCT LINE, SITE, CUST TYPE, CHANNEL */

for first pt_mstr
   fields( pt_domain pt_part)
   where pt_domain = global_domain
    and  pt_part = sod_det.sod_part
no-lock:
end. /* FOR FIRST PT_MSTR */

if available pt_mstr
then pt_recno = recid(pt_mstr).
else pt_recno = ?.
if new_line and corr_inv = no then do:
   {us/bbi/gprun.i ""soplsd.p""}
end.

sodcmmts = (sod_det.sod_cmtindx <> 0 or (new_line and soc_lcmmts)).
if not sodcmmts then
   if this-is-rma and new_line then
      sodcmmts = rmc_lcmmts.

if sngl_ln then do:
   /* Convert cost from remote base currency to local base currency */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
      "(input  """",
        input  base_curr,
        input  exch-rate,
        input  exch-rate2,
        input  sod_det.sod_std_cost,
        input  false,
        output sodstdcost,
        output mc-error-number)" }
   if mc-error-number <> 0 then
      run display_msg (input mc-error-number, input 2).

   display
      sod_det.sod_site
      sod_det.sod_loc
      sod_det.sod_serial
      sod_det.sod_qty_all
      sod_det.sod_qty_pick
      sod_det.sod_pricing_dt
      sodstdcost 
/*cy1022*/ when cyb_so_type <> "warranty"
      @ sod_det.sod_std_cost
      sod_det.sod_due_date
      sod_det.sod_req_date
      sod_det.sod_per_date
      sod_det.sod_promise_date
      sod_det.sod_fr_list
      sod_det.sod_acct
      sod_det.sod_sub
      sod_det.sod_cc
      sod_det.sod_project
      sod_det.sod_dsc_acct
      sod_det.sod_dsc_sub
      sod_det.sod_dsc_cc
      sod_det.sod_dsc_project
      sod_det.sod_confirm
      sod_det.sod_type
      sod_det.sod_um_conv
      sod-detail-all
      sod_det.sod_taxable
      sod_det.sod_taxc
      sod_det.sod_order_category
      sodcmmts
   with frame d.
end. /* if sngl_ln */

seta:
/* Prompt for rest of the line information on single line screen */
do on error undo, retry:

   /* Initialize to no so that if could not connect to APO ATP   */
   /* and user starts all over, that APO ATP processing will be  */
   /* attempted again.                                           */
   stdAtpUsed = no.

   if sngl_ln
   then do:
      /* ADD EDITING TO SET GLOBAL LOC FOR LOT/SER LOOKUP */
      assign
         prev_qty_all      = if new sod_det
                             then
                                0
                             else
                                sod_det.sod_qty_all
         l_prev_qty_pick   = if new sod_det
                             then
                                0
                             else
                                sod_det.sod_qty_pick
         prev-promise-date = sod_det.sod_promise_date
         prev-due-date     = sod_det.sod_due_date
         prev-confirm      = sod_det.sod_confirm.

      if not so_secondary and soc_use_btb then
         rollback:
      do on error undo, retry:

         for first cm_mstr
            fields( cm_domain cm_addr)
            where cm_domain = global_domain
             and  cm_addr = so_cust
         no-lock:
         end. /* FOR FIRST CM_ADDR */

         /* CONVERT A DATE TO A STRING VARIABLE */
         s-cmdval = string ( sod_det.sod_due_date ).

         /* ROLL-BACK */
         {us/bbi/gprun.i ""sobtbrb.p""
            "(input recid(so_mstr),
              input sod_det.sod_line,
              input ""pod_det"",
              input ""pod_due_date"",
              input p-edi-rollback,
              output return-msg)" }

         /* DISPLAY ERROR MESSAGE RETURN FROM SOBTBRB.P */
         if return-msg <> 0 then do:
            run display_msg (input return-msg, input 4).
            assign
               s-rb-init = no
               return-msg = 0.
               if not (batchrun or {us/bbi/gpiswrap.i}) then pause.
            undo rollback, return.

         end.

         /* CONVERT A STRING VARIABLE TO A DATE */
         sod_det.sod_due_date = date(s-cmdval).
         display
            sod_det.sod_due_date
         with frame d.
      end.  /* rollback */

      l_old_fr_list = sod_det.sod_fr_list.

      run setUpdateQtyAll.

      /* ALLOW TYPE TO BE SET WHEN NEW ORDER LINE FOR PART THAT IS IN */
      /* ITEM MASTER AND TYPE IS NOT BLANK.                           */
      if sod_det.sod_type <> "" and available pt_mstr and new_line then
         set-sod-type = yes.

      /* RMA RECEIPT LINES DO NOT GET ALLOCATIONS. */
      if corr_inv then do:
         sod_det.sod_qty_all = sod_det.sod_qty_ord.
         if sod_det.sod_qty_all < 0 then assign sod_det.sod_qty_all = 0.
         display sod_det.sod_qty_all with frame d.
      end.

      set
         sod_det.sod_loc
         sod_det.sod_std_cost    when (not available pt_mstr)
/*cy1022*/ or cyb_so_type <> "warranty"
         sod_det.sod_serial
         sod_det.sod_qty_all     when (not rma-receipt-line) and
                                (not s-btb-so or l_update_qty_all)
         /* BTB DIR-SHIP LINES DO NOT GET ALLOCATIONS IN PBU          */
         /* BTB TRANSHIP WITH EDI LINES DO NOT GET ALLOCATIONS IN PBU */
         sod_det.sod_comm_pct[1] when (sod_det.sod_slspsn[1] <> "")
         sod_det.sod_acct
         sod_det.sod_sub
         sod_det.sod_cc
         sod_det.sod_project
         sod_det.sod_dsc_acct    when (new_line or reprice_dtl)
         sod_det.sod_dsc_sub     when (new_line or reprice_dtl)
         sod_det.sod_dsc_cc      when (new_line or reprice_dtl)
         sod_det.sod_dsc_project when (new_line or reprice_dtl)
         sod_det.sod_confirm     when (sod_det.sod_confirm = no or new_line)
         sod_det.sod_req_date
         sod_det.sod_promise_date when (not po-ack-wait or so_primary)
         sod_det.sod_due_date     when (not po-ack-wait or not so_primary)
         sod_det.sod_per_date
         sod_det.sod_fix_pr
         sod_det.sod_type         when (sod_det.sod_qty_inv = 0 and
                                        sod_det.sod_qty_ship = 0 and
                                        sod_det.sod_type = ""
                                        or set-sod-type)

         sod_det.sod_um_conv     when (sod_det.sod_btb_type = "01")
         /* RMA RECEIPT LINES DO NOT GET TO CONSUME FORECAST */
         /* NOR DO THEY GET ALLOCATIONS */
         sod_det.sod_consume     when (not rma-receipt-line)
         sod-detail-all          when (not rma-receipt-line)
         /* DETAIL ALLOCATIONS ARE NOT ALLOWED ON BTB SO LINES */
                                     and  (not s-btb-so)
         sod_det.sod_taxable
         sod_det.sod_taxc
         sod_det.sod_fr_list
         sod_det.sod_order_category
         sodcmmts
      with frame d
      editing:
         if frame-field = "sod_serial" and
            input sod_det.sod_loc <> global_loc then
            global_loc = input sod_det.sod_loc.
         readkey.
         apply lastkey.
      end. /* END EDITING */

      if sod_det.sod_qty_all = ?
      then
         sod_det.sod_qty_all = 0.

      /* FOR RMA RECEIPT LINES, BECAUSE WE'RE EXPECTING     */
      /* TO RECEIVE THESE ITEMS INTO THE SPECIFIED SITE     */
      /* LOC, BE SURE IT'S VALID.                           */
      if this-is-rma and not rma-issue-line then do:
         /* SOD_SITE IS SCHEMA-VALIDATED */

         for first si_mstr
            fields( si_domain si_auto_loc si_db si_site si_status)
            where si_domain = global_domain
             and  si_site   = sod_det.sod_site
         no-lock:
         end. /* FOR FIRST SI_MSTR */

         if  not can-find(loc_mstr
            where loc_domain = global_domain
             and  loc_site  = sod_det.sod_site
            and   loc_loc   = sod_det.sod_loc)
         then do:
            /* WARN USER OF MISSING LOC IF AUTOLOCATIONS FOR SITE */
            if si_auto_loc then
               run display_msg (input 229, input 2).
               /* LOCATION MASTER DOES NOT EXIST */
            /* IF SITE DOESN'T HAVE AUTOLOCATIONS, GIVE ERROR */
            else do:
               run display_msg (input 229, input 3).
               next-prompt sod_det.sod_loc with frame d.
               undo, retry.
            end.
         end.     /* if not can-find loc_mstr */
         else do:

            /* ENSURE THIS SITE/LOCATION VALID FOR ISS-RMA */

            for first loc_mstr
               fields( loc_domain loc_loc loc_site loc_status)
               where loc_domain = global_domain
                and  loc_site = sod_det.sod_site
                and loc_loc = sod_det.sod_loc
            no-lock:
            end. /* FOR FIRST LOC_MSTR */

            for first ld_det
               fields( ld_domain ld_loc ld_lot ld_part
                       ld_ref ld_site ld_status)
               where ld_domain = global_domain
                and  ld_site = sod_det.sod_site
                and  ld_loc  = sod_det.sod_loc
                and  ld_part = sod_det.sod_part
                and  ld_lot  = sod_det.sod_serial
                and  ld_ref  = string(sod_det.sod_ref)
            no-lock:
            end. /* FOR FIRST LD_DET */

            if can-find(isd_det
             where isd_domain = global_domain
               and isd_tr_type = "ISS-RMA"
               and isd_status = (if available ld_det then ld_status else
                                 if available loc_mstr then loc_status else
                                 si_status))
            then do:
               /* RESTRICTED TRANSACTION FOR STATUS CODE: */
               {us/bbi/pxmsg.i &MSGNUM=373 &ERRORLEVEL=3
                        &MSGARG1=
                  "if available ld_det then ld_status
                   else
                   if available loc_mstr then loc_status
                   else si_status"}
               if sngl_ln then
                  next-prompt sod_det.sod_loc
                  with frame d.
               undo, retry.
            end.
         end.  /* else can-find loc_mstr, do */
      end.  /* if this-is-rma and ... */

      if execname = "sosomt.p" or      /* SO Maintenance */
         execname = "fsrmamt.p" then   /* RMA Maintenance */
      do:
         /* Update Restriction Procedure Library */
         run mfairunh.p
            (input "mgurpl.p",
             input ?,
             output hUpdateRestrictedLibrary).

         /* Update Restriction Constants */
         {us/mg/mgurpl.i "hUpdateRestrictedLibrary"}

         /* VALIDATE LINE IS NOT RESTRICTED FOR USER UPDATES */
         /* CLEAR TEMP TABLE RECORDS BEFORE CREATING NEW RECORD */
         empty temp-table ttUpdateRestrictionSignature.

         /* CREATE TEMP-TABLE RECORD */
         create ttUpdateRestrictionSignature.
         assign
            ttUpdateRestrictionSignature.program               = execname
            ttUpdateRestrictionSignature.category
                                         = if execname = "fsrmamt.p"
                                           then {&SSM}
                                           else {&SOMT}
            ttUpdateRestrictionSignature.part
                                         = sod_det.sod_part
            ttUpdateRestrictionSignature.inventoryStatus       = ?
            ttUpdateRestrictionSignature.inventoryStatusTo     = ?
            ttUpdateRestrictionSignature.account               = ?
            ttUpdateRestrictionSignature.subAccount            = ?
            ttUpdateRestrictionSignature.costCenter            = ?
            ttUpdateRestrictionSignature.project               = ?
            ttUpdateRestrictionSignature.changeInventoryStatus = ?.

         /* Check if a RMA or SO */
         if this-is-rma then
         do:
            /* Check if an issue or receipt order line */
            if rma-issue-line then
            do:
               assign
                  ttUpdateRestrictionSignature.site       = sod_det.sod_site
                  ttUpdateRestrictionSignature.siteTo     = rma_mstr.rma_site_rec
                  ttUpdateRestrictionSignature.location   = sod_det.sod_loc
                  ttUpdateRestrictionSignature.locationTo = rma_mstr.rma_loc_rec.
            end.
            else do:
               assign
                  ttUpdateRestrictionSignature.site       = rma_mstr.rma_site_iss
                  ttUpdateRestrictionSignature.siteTo     = sod_det.sod_site
                  ttUpdateRestrictionSignature.location   = rma_mstr.rma_loc_iss
                  ttUpdateRestrictionSignature.locationTo = sod_det.sod_loc.
            end.
         end.
         else do:
            /* Sales Order */
            assign
               ttUpdateRestrictionSignature.site       = sod_det.sod_site
               ttUpdateRestrictionSignature.siteTo     = ?
               ttUpdateRestrictionSignature.location   = sod_det.sod_loc
               ttUpdateRestrictionSignature.locationTo = ?.
         end.

         if isUpdateRestricted(input table ttUpdateRestrictionSignature,
                               input yes)
         then do:
            undo seta, retry.
         end.
      end.          /* end if lookup */

      assign
         continue = yes
         warn     = no
         atp-ok   = yes
         atp-due-date = ?.

      /* Determine promise date and due date defaulting  */
      if sod_det.sod_confirm = yes
         and ((not this-is-rma) or rma-issue-line)
         and soc_calc_promise_date = yes
         /* DO FOR RMA ISSUE LINES, NOT RECEIPT LINES */
         and not (s-btb-so = yes and sod_det.sod_btb_type > "01")
      then do:
         run p-calc-date-defaults (input so_ship,
                                   input sod_det.sod_site,
                                   input sod_det.sod_req_date,
                                   input-output sod_det.sod_promise_date,
                                   input-output sod_det.sod_due_date).

         display
            sod_det.sod_promise_date
            sod_det.sod_due_date
         with frame d.
         pause 0.
      end.  /* sod_confirm = yes...  */

      run checkSiteDB.

      if err-flag = 0 or err-flag = 9 then do:

         /* Validate ATP if necessary */
         if sod_det.sod_qty_ord - sod_det.sod_qty_ship > 0
         and not sod_det.sod_sched
         and ((not this-is-rma) or rma-issue-line)
            /* DO FOR RMA ISSUE LINES, NOT RECEIPT LINES */
         and not (s-btb-so = yes and sod_det.sod_btb_type > "01")
         then do:
            hide frame d.
            hide frame c.
            hide frame a.

   /* When an APO ATP request was processed with insufficient demand, */
   /* the user may choose to modify the order line to match the APO   */
   /* ATP results.  If the atp-due-date field is populated, this   */
   /* indicates that the user has chosen to override the original     */
   /* input with data returned from APO ATP.                          */
   /* Order line site, date and quantity are modified to the APO ATP  */
   /* site, date and quantity only for:                               */
   /* - multi line order entry or                                     */
   /* - single line order entry when quantity has changed or          */
   /* - site has changed                                              */

            run updateWithApoAtpData.

            /* DETERMINE IF TO USE APO ATP FOR MODULE */
            run setUpForApoAtp.

            if checkAtp then
               run p-check-atp.

            view frame a.
            view frame c.
            view frame d.
/*cy1022*/ if cyb_so_type = "warranty"  and sngl_ln then 
/*cy1022*/    display 0.0 @ sod_det.sod_std_cost with frame d.
            pause 0.

            if checkAtp and useApoAtp then do:
               if keyfunction(lastkey) = "end-error" then do:
                  next-prompt sod_det.sod_loc with frame d.
                  undo, retry.
               end.

               if not continue then do:
                  next-prompt sod_det.sod_due_date with frame d.
                  undo, retry.
               end.

               run updateWithApoAtpData.

               /* errorResult 0 - Confirm Order Line             */
               /* errorResult 1 - Change date for order line     */
               /* errorResult 2 - Change quantity for order line */
               /* errorResult 3 - Site changed for order line    */
               /* When date, quantity or site changed,           */
               /* return user to order line.                     */
               if errorResult = "0" then
                  confirmApoAtpOrderLine = yes.
               else if errorResult = "1" then do:
                  display sod_det.sod_due_date with frame d.
                  next-prompt sod_det.sod_due_date with frame d.
                  undo, retry.
               end.
               else if errorResult = "2" then do:
                  display sod_det.sod_qty_ord with frame c.
                  atp-qty-site-changed = true.
               end.
               else if errorResult = "3" then do:
                  display sod_det.sod_due_date with frame d.
                  atp-qty-site-changed = true.
               end.
            end. /* checkAtp and useApoAtp */
         end. /* Validate ATP if necessary */

      end. /* if err-flag */

      if si_db <> so_db then do:
         {us/bbi/gprun.i ""gpalias3.p"" "(so_db,output err-flag)" }
      end.  /* if si_db <> so_db */

      if warn then do:
         /* QTY AVAILABLE FOR ITEM */
         {us/bbi/pxmsg.i &MSGNUM=237 &ERRORLEVEL=2
                  &MSGARG1=" sod_det.sod_part + "": "" + string(net_avail) "}
         if not batchrun
         then do:
            /* DO YOU WISH TO CONTINUE? */
            {us/bbi/pxmsg.i &MSGNUM=7734 &ERRORLEVEL=2 &CONFIRM=continue
                     &CONFIRM-TYPE='LOGICAL'}
         end. /* IF NOT BATCHRUN */
         next-prompt sod_det.sod_qty_all with frame d.
         if not continue then do:
            hide message.
            undo, retry.
         end.
         else hide message.
      end.


      if checkAtp
         and useApoAtp = no
      then do:
         /* CHANGE DUE DATE IF DIFFERENT DATE RETURNED */
         atp-due-date-changed = no.

         if atp-due-date     <> ?
            and atp-due-date <> sod_det.sod_due_date
         then
            assign
               atp-due-date-changed = yes
               sod_det.sod_due_date = atp-due-date.

         if atp-due-date-changed
         then
            display
               sod_det.sod_due_date
            with frame d.

         if atp-ok = no
         then do:
            /*  ATP ENFORCEMENT ERROR, QTY ORDERED NOT ALLOWED  */
            /*  FOR  DUE DATE xxxxxxxx                          */
            {us/bbi/pxmsg.i &MSGNUM=4099 &ERRORLEVEL=3 &MSGARG1=sod_det.sod_due_date}
            next-prompt
               sod_det.sod_due_date  with frame d.
            if not batchrun
               and not {us/bbi/gpiswrap.i}
            then
               pause.
            undo, retry.
         end.

         /* RESET PROMISE DATE IF NEEDED */
         /* ONLY RESET IF CALC PROMISE DATE = YES */

         if soc_calc_promise_date = yes
            and (sod_det.sod_due_date       <> prev-due-date
                 or sod_det.sod_confirm     <> prev-confirm
                 or sod_det.sod_promise_date = ?
                 or atp-due-date-changed     = yes)
            and sod_det.sod_confirm  = yes
            and sod_det.sod_due_date <> ?
            /* DO FOR RMA ISSUE LINES, NOT RECEIPT LINES */
            and ((not this-is-rma)
                 or rma-issue-line)
            /* BYPASS EMT ITEMS */
            and not (s-btb-so                 = yes
                     and sod_det.sod_btb_type > "01")
         then do:
            auto-prom-date = ?.

            run p-calc-prom-or-due-date (input so_ship,
                                         input sod_det.sod_site,
                                         input-output sod_det.sod_due_date,
                                         input-output auto-prom-date).

            if auto-prom-date <> ?
            then do:
               sod_det.sod_promise_date = auto-prom-date.
               display
                  sod_det.sod_promise_date
               with frame d.
               pause 0.
            end. /* IF auto-prom-date <> ?  */

         end. /* IF soc_calc_promise_date = yes */
      end. /* IF checkAtp and useApoAtp = no */

      /* Allow only zero or positive quantity for allocation */
      if sod_det.sod_qty_all < 0 then do:
         /* Qty allocated  cannot be < 0 */
         run display_msg (input 6230, input 3).
         next-prompt sod_det.sod_qty_all with frame d.
         undo, retry.
      end.

      /* Allow allocations only for confirmed lines */
      if sod_det.sod_qty_all <> 0 and not sod_det.sod_confirm then do:
         run display_msg (input 688, input 3).
         /* Allocs not allowed for unconfirmed lines */
         next-prompt sod_det.sod_confirm with frame d.
         undo, retry.
      end.

      /* VALIDATE THE AVAILABILITY OF THE REMOTE DOMAIN */
      if sod_det.sod_confirm then do:

         for first si_mstr
            fields( si_domain si_auto_loc si_db si_site si_status)
            where si_domain = global_domain
             and  si_site = sod_det.sod_site
         no-lock:
         end. /* FOR FIRST SI_MSTR */
         if global_db <> si_db then do:
            {us/gp/gprunp.i "mgdompl" "p" "ppDomainConnect"
                                    "(input  si_db,
                                      output lv_error_num,
                                      output lv_name)"}

            if lv_error_num <> 0 then do:
               run display_msg (input lv_error_num, input 3).
               next-prompt sod_det.sod_confirm with frame d.
               undo, retry.
            end.
         end. /* if global_db <> si_db then do: */
      end.

      /* MULTI EMT DO NOT ALLOW DATE CHANGE AT THE SBU */
      if so_secondary and not new_line
         and sod_det.sod_promise_date <> prev-promise-date
         and (sod_det.sod_btb_type = "03" or sod_det.sod_btb_type = "02")
      then do:
         run display_msg (input 2825, input 3).
         /* NO CHANGE IS ALLOWED ON EMT SO */
         next-prompt sod_det.sod_promise_date with frame d.
         undo, retry.
      end.

      if so_secondary and not new_line
         and sod_det.sod_due_date <> prev-due-date
         and (sod_det.sod_btb_type = "03" or sod_det.sod_btb_type = "02")
      then do:
         run display_msg (input 2825, input 3).
         /* NO CHANGE IS ALLOWED ON EMT SO */
         next-prompt sod_det.sod_due_date with frame d.
         undo, retry.
      end.

      /* VALIDATE FREIGHT LIST */
      if sod_det.sod_fr_list <> "" then do:

         for first fr_mstr
            fields( fr_domain fr_curr fr_list fr_site)
            where fr_domain = global_domain
             and  fr_list = sod_det.sod_fr_list
             and  fr_site = sod_det.sod_site
             and  fr_curr = so_curr
         no-lock:
         end. /* FOR FIRST FR_MSTR */

         if not available fr_mstr then

            for first fr_mstr
               fields( fr_domain fr_curr fr_list fr_site)
               where fr_mstr.fr_domain = global_domain
                and  fr_list = sod_det.sod_fr_list
                and  fr_site = sod_det.sod_site
                and  fr_curr = base_curr
            no-lock:
            end. /* FOR FIRST FR_MSTR */

         if not available fr_mstr then do:
            /* FREIGHT LIST # NOT FOUND FOR SITE # CURRENCY */
            {us/bbi/pxmsg.i &MSGNUM=670
                     &MSGARG1=sod_det.sod_fr_list
                     &MSGARG2=sod_det.sod_site
                     &MSGARG3=so_curr}
            next-prompt sod_det.sod_fr_list with frame d.
            undo, retry.
         end.
      end.     /* if sod_fr_list <> "" */

      if sod_det.sod_fr_list <> l_old_fr_list
      then
         sod_det.sod_manual_fr_list = yes.

      /* ACCT/SUB/CC/PROJ VALIDATION */
      run ip_validate_fullcode
          (input  sod_det.sod_acct,
           input  sod_det.sod_sub,
           input  sod_det.sod_cc,
           input  sod_det.sod_project,
           input  "sod_acct",
           output valid_acct).

      if valid_acct = no then
         next-prompt sod_det.sod_acct with frame d.
      if valid_acct = no then
         undo, retry.

      /* ACCT/SUB/CC/PROJ VALIDATION */
      run ip_validate_fullcode
         (input  sod_det.sod_dsc_acct,
          input  sod_det.sod_dsc_sub,
          input  sod_det.sod_dsc_cc,
          input  sod_det.sod_dsc_project,
          input  "sod_dsc_acct",
          output valid_acct).

      if valid_acct = no then
         next-prompt sod_det.sod_dsc_acct with frame d.
      if valid_acct = no then
         undo, retry.

      if so_curr <> base_curr then do:

         for first ac_mstr
            fields( ac_domain ac_code ac_curr)
            where ac_domain = global_domain
             and  ac_code = sod_det.sod_acct
         no-lock:
         end. /* FOR FIRST AC_MSTR */

         if available ac_mstr and ac_curr <> so_curr
            and ac_curr <> base_curr
         then do:
            run display_msg (input 134, input 3).
            /*ACCT CURR MUST EITHER BE TRANS OR BASE CURR*/
            next-prompt sod_det.sod_acct with frame d.
            undo, retry.
         end.

         for first ac_mstr
            fields( ac_domain ac_code ac_curr)
            where ac_domain = global_domain
             and  ac_code = sod_det.sod_dsc_acct no-lock:
         end. /* FOR FIRST AC_MSTR */

         if available ac_mstr and ac_curr <> so_curr
            and ac_curr <> base_curr
         then do:
            run display_msg (input 134, input 3).
            /*ACCT CURR MUST EITHER BE TRANS OR BASE CURR*/
            next-prompt sod_det.sod_dsc_acct with frame d.
            undo, retry.
         end.
      end.

      /* VALIDATE TAXCODE*/
      {us/gp/gptxcval.i &code=sod_det.sod_taxc &frame="d"}

      /* VALIDATE sod_order_category AGAINST GENERALIZED CODES */
      l_invalid_category = no.
      if sod_det.sod_order_category <> "" then
         run ValidateCategory
            (input sod_det.sod_order_category,
             output l_invalid_category).
      if l_invalid_category then
         /* VALUE MUST EXIST IN GENERALIZED CODES */
            run display_msg (input 716,
                             input 3).
      if l_invalid_category then
         next-prompt sod_det.sod_order_category with frame d.
      if l_invalid_category then undo, retry.


      /* FOLLOWING TESTS NOT NEEDED FOR RMA RECEIPT LINES BECAUSE */
      /* ALLOCATIONS ON THEM WILL ALWAYS BE ZERO.                 */
      /* VALIDATE IF QTY ORD > 0 */
      if sod_det.sod_qty_ord >= 0 and
         sod_det.sod_qty_ord < sod_det.sod_qty_all
                             + sod_det.sod_qty_pick
                             + sod_det.sod_qty_ship
         and not sod_det.sod_sched
         and not rma-receipt-line
         /* ALLOCATIONS ON BTB SO LINES ARE ZERO */
         and not s-btb-so
      then do:
         repeat:
            run display_msg (input 4999, input 3).
            /* Ord qty cannot be < alloc+pick+ship */
            update sod_det.sod_qty_all with frame d.
            if sod_det.sod_qty_all = ?
            then
               sod_det.sod_qty_all = 0.
            continue = yes.
            warn = no.

            for first si_mstr
               fields( si_domain si_auto_loc si_db si_site si_status)
               where si_mstr.si_domain = global_domain
                and  si_site = sod_det.sod_site no-lock:
            end. /* FOR FIRST SI_MSTR */

            run allocationCheck.

            if warn then do:
               /* QTY AVAILABLE FOR ITEM */
               {us/bbi/pxmsg.i &MSGNUM=237 &ERRORLEVEL=2
                        &MSGARG1=" sod_det.sod_part + "": ""
                                 + string(net_avail) "}
               if not batchrun
               then do:
                  /* DO YOU WISH TO CONTINUE? */
                  {us/bbi/pxmsg.i &MSGNUM=7734 &ERRORLEVEL=2 &CONFIRM=continue
                           &CONFIRM-TYPE='LOGICAL'}
               end. /* IF NOT BATCHRUN */
               if not continue then
                  undo, retry.
            end.    /* if warn */

            if sod_det.sod_qty_all < 0 then do:
               run display_msg (input 6230, input 3).
               /* Qty allocated  cannot be < 0 */
               next-prompt sod_det.sod_qty_all  with frame d.
               undo, retry.
            end.
            if sod_det.sod_qty_ord >= sod_det.sod_qty_all +
               sod_det.sod_qty_pick + sod_det.sod_qty_ship
            then leave.
         end.    /* repeat */
         if keyfunction(lastkey) = "end-error" then undo, retry.
      end.   /* if sod_qty_ord >= 0 ... */

      /* FOLLOWING TESTS NOT NEEDED FOR RMA RECEIPT LINES BECAUSE */
      /* ALLOCATIONS ON THEM WILL ALWAYS BE ZERO.                 */
      /* VALIDATE IF QTY ORD < 0                                  */

      if sod_det.sod_qty_ord < 0
         and not sod_det.sod_sched
         and not rma-receipt-line
      then do:
         repeat on error undo, retry:

            if (sod_det.sod_qty_all<> 0 or sod_det.sod_qty_ship > 0 or
               sod_det.sod_qty_pick > 0)
            then do:
               /* ORD QTY CANNOT BE < ALLOC+PICK+SHIP */
               run display_msg (input 4999, input 3).
               update sod_det.sod_qty_all with frame d.
               if sod_det.sod_qty_all = ?
               then
                  sod_det.sod_qty_all = 0.
            end.
            else leave.

         end. /* END OF REPEAT ON ERROR, UNDO RETRY */
         if keyfunction(lastkey) = "end-error" then undo, retry.
      end. /* END OF IF sod_qty_ord < 0  */

      /* Update commission percentages if there are multiple salespersons. */
      if mult_slspsn and sngl_ln then
      set_comm:
      do on error undo, retry on endkey undo, leave seta:
         form
            sod_det.sod_slspsn[1]     colon 15 label "Salesperson 1"
            sod_det.sod_comm_pct[1]   colon 26 no-label
            sort[1]                   colon 35 no-label
            sod_det.sod_slspsn[2]     colon 15 label "Salesperson 2"
            sod_det.sod_comm_pct[2]   colon 26 no-label
            sort[2]                   colon 35 no-label
            sod_det.sod_slspsn[3]     colon 15 label "Salesperson 3"
            sod_det.sod_comm_pct[3]   colon 26 no-label
            sort[3]                   colon 35 no-label
            sod_det.sod_slspsn[4]     colon 15 label "Salesperson 4"
            sod_det.sod_comm_pct[4]   colon 26 no-label
            sort[4]                   colon 35 no-label
         with frame set_comm overlay side-labels
            centered row 16 width 66.

         run setSort.

         /* SET EXTERNAL LABELS */
         setFrameLabels(frame set_comm:handle).
         display
            sod_det.sod_slspsn
            sod_det.sod_comm_pct
            sort
         with frame set_comm.
         update sod_det.sod_comm_pct with frame set_comm.
         hide frame set_comm no-pause.
      end.

      /* FREIGHT WEIGHTS */
      if sod_det.sod_fr_list <> "" then do:
         set_wt:
         do on error undo, retry:
            freight_ok = yes.
            if sngl_ln and (calc_fr or disp_fr) then do:
               detqty = sod_det.sod_qty_ord - sod_det.sod_qty_ship.

               /* ASSIGN so_fr_terms WITH THE FREIGHT TERMS FROM */
               /* THE BEST PRICING ROUTINE TO PREVENT ANY ERROR  */
               /* OR WARNING MESSAGES FROM BEING DISPLAYED AT    */
               /* THE LINE LEVEL                                 */

               if current_fr_terms <> ""
                  and so_manual_fr_terms = no
               then
                  so_fr_terms = current_fr_terms.

               if old_ft_type = "5"
               then do:
                  for first l_fr_table
                      where l_fr_sonbr  = sod_det.sod_nbr
                        and l_fr_soline = sod_det.sod_line
                      no-lock:
                  end. /* FOR FIRST l_fr_table */
                  if not available l_fr_table
                  then do:
                     create l_fr_table.
                        assign
                           l_fr_sonbr   = sod_det.sod_nbr
                           l_fr_soline  = sod_det.sod_line
                           l_fr_chrg    = 0
                           l_sodlist_pr = (if reprice_dtl
                                           then sod_det.sod_list_pr
                                           else 0).
                  end. /* IF NOT AVAILABLE l_fr_table */

                  l_fr_chrg = (if new_line
                               then 0
                               else sod_det.sod_fr_chg).
               end. /* IF old_ft_type = "5" */

               /* IF IT IS A VALID DATE, USE THE DUE DATE.  OTHERWISE, USE */
               /* THE CURRENT DATE.                                        */
               /* ADDED SECOND EXCHANGE RATE BELOW */
               /* ADDED INPUT PARAMETERS sod_nbr, sod_line AND sod_sob_std */
               {us/bbi/gprun.i ""gpfrlwt.p""
                  "(input so_curr,
                    input so_ex_rate,
                    input so_ex_rate2,
                    input so_fr_min_wt,
                    input so_fr_terms,
                    input so_ship,
                    if sod_det.sod_due_date <> ?
                    then sod_det.sod_due_date
                    else today,
                    input sod_det.sod_fr_list,
                    input sod_det.sod_part,
                    input detqty,
                    input sod_det.sod_site,
                    input sod_det.sod_type,
                    input sod_det.sod_um,
                    input calc_fr,
                    input disp_fr,
                    input sod_det.sod_nbr,
                    input sod_det.sod_line,
                    input sod_det.sod_sob_std,
                    input-output sod_det.sod_fr_wt,
                    input-output sod_det.sod_fr_wt_um,
                    input-output sod_det.sod_fr_class,
                    input-output sod_det.sod_fr_chg,
                    input-output freight_ok)"}
            end.    /* if sngl_ln and... */

            if not freight_ok then do:
               /* FREIGHT ERROR DETECTED - CHARGES MAY BE INCOMPLETE */
               run display_msg (input 669, input 2).
               if not {us/bbi/gpiswrap.i} then
               pause.
               undo set_wt, leave set_wt.
            end.
         end.
      end.    /* if sod_fr_lst <> "" */

      run determineQuantityAllocated.

      run checkReservedLocation.

      if not corr_inv then do:
         if (sod-detail-all or sod_det.sod_qty_ord entered
            and l_ret-flag <> 1
            and totallqty  <> 0)
            and (sod_det.sod_qty_all > 0
               or (sod_det.sod_qty_all = 0
               and (available tt_soddet
               and tt_soddet.sod_qty_all > 0)))
            and sod_det.sod_type = ""
         then
         /* DO DETAIL ALLOCATIONS */
         run doDetailAllocations.

         if      sod_det.sod_qty_ord >= 0
            and  sod_det.sod_qty_ord < totallqty            +
                                       sod_det.sod_qty_pick +
                                       sod_det.sod_qty_ship
         then do:
            /* Qty ord cannot be less than all + pick + ship*/
            {us/bbi/pxmsg.i &MSGNUM=4999 &ERRORLEVEL=3}
            undo seta, retry seta.
         end. /* IF sod_det.sod_qty_ord >= 0 AND ... */
      end.
      else do:
         do on error undo,retry on endkey undo, leave:
            v_is_avail  = yes.
            if sod_det.sod_loc <> "" then do:
               for first loc_mstr no-lock where loc_domain = global_domain
                                           and  loc_site = sod_det.sod_site
                                           and  loc_loc  = sod_det.sod_loc:
                   for first is_mstr no-lock
                      where is_domain = global_domain
                      and   is_status = loc_mstr.loc_status :
                      if is_mstr.is_avail = no then v_is_avail  = no.
                   end.
               end.
            end.

            {us/px/pxrun.i &PROC  = 'getFieldDefault'
                     &PROGRAM = 'ppitxr.p'
                     &HANDLE = ph_ppitxr
                     &PARAM = "( input  sod_det.sod_part,
                                 input  sod_det.sod_site,
                                 input ""pt_lot_ser"",
                                 output l_pt_lot_ser)"
                     &NOAPPERROR = true
                     &CATCHERROR = true
            }
            if (sod-detail-all or sod_det.sod_qty_ord entered)
                and sod_det.sod_qty_all >= 0
                and sod_det.sod_type     = ""
                and ((l_pt_lot_ser = "L" or l_pt_lot_ser = "S")
                   or v_is_avail
                   or sod_det.sod_serial <> "")
            then do:
               run doDetailAllocations.

               if      sod_det.sod_qty_ord >= 0
                  and  sod_det.sod_qty_ord < totallqty            +
                                             sod_det.sod_qty_pick +
                                             sod_det.sod_qty_ship
               then do:
                  /* Qty ord cannot be less than all + pick + ship*/
                  {us/bbi/pxmsg.i &MSGNUM=4999 &ERRORLEVEL=3}
                  undo seta, retry seta.
               end. /* IF sod_det.sod_qty_ord >= 0 AND ... */

               if totallqty <> sod_det.sod_qty_ord then do:
                  {us/bbi/pxmsg.i &MSGNUM=6428 &ERRORLEVEL=3}
                  /* Quantity allocated <> quantity ordered */
                  undo seta, retry seta.
               end.
            end.
         end.
      end.

      if sod_det.sod_qty_all < totallqty
         and not l_update_qty_all
      then
         sod_det.sod_qty_all = totallqty.

      if corr_inv then sod_det.sod_qty_all = sod_det.sod_qty_ord.

      /* GET TAX MANAGEMENT DATA */
      {us/bbi/gprun.i ""sosomtlc.p"" "(input this-is-rma)"}
      if not l_loop_seta then leave seta.

   end.    /* if sngl_ln */
   else do: /* multi line */

      {us/gp/gptxcval.i &code=sod_det.sod_taxc  &frame="NO-FRAME"}
      /* Validate accounts and cost centers as they don't get validated */
      /* In multi line format */

      /* ACCT/SUB/CC/PROJ VALIDATION */
      run ip_validate_fullcode
          (input  sod_det.sod_acct,
           input  sod_det.sod_sub,
           input  sod_det.sod_cc,
           input  sod_det.sod_project,
           input  "sod_acct",
           output glvalid).

      if glvalid = no then  undo seta , leave.

      /* ACCT/SUB/CC/PROJ VALIDATION */
      run ip_validate_fullcode
          (input  sod_det.sod_dsc_acct,
           input  sod_det.sod_dsc_sub,
           input  sod_det.sod_dsc_cc,
           input  sod_det.sod_dsc_project,
           input  "sod_acct",
           output glvalid).
      if glvalid = no then  undo seta , leave.

      if so_curr <> base_curr then do:

         for first ac_mstr
            fields( ac_domain ac_code ac_curr)
            where ac_domain = global_domain
             and  ac_code = sod_det.sod_acct
         no-lock:
         end. /* FOR FIRST AC_CODE */

         if available ac_mstr and ac_curr <> so_curr
            and ac_curr <> base_curr
         then do:
            run display_msg (input 134, input 3).
            /*ACCT CURR MUST EITHER BE TRANS OR BASE CURR*/
            undo seta, leave.
         end.

         for first ac_mstr
            fields( ac_domain ac_code ac_curr)
            where ac_domain = global_domain
             and  ac_code = sod_det.sod_dsc_acct
         no-lock:
         end. /* FOR FIRST AC_MSTR */

         if available ac_mstr and ac_curr <> so_curr
            and ac_curr <> base_curr
         then do:
            run display_msg (input 134, input 3).
            /*ACCT CURR MUST EITHER BE TRANS OR BASE CURR*/
            undo seta, leave.
         end.
      end.    /* if so_curr <> base_curr */

      /* VALIDATE IF QTY ORD > 0 */

      if ((sod_det.sod_qty_ord >= 0
         and sod_det.sod_qty_ord < sod_det.sod_qty_all
                                 + sod_det.sod_qty_pick
                                 + sod_det.sod_qty_ship)
         or (sod_det.sod_qty_ord < 0 and
            (sod_det.sod_qty_all <>0 or sod_det.sod_qty_pick >0
                                     or sod_det.sod_qty_ship > 0))
         and not sod_det.sod_sched)
      then do:
          run display_msg (input 4999, input 3).
         /* Ord qty cannot be < alloc+pick+ship */
         undo seta, leave.
      end.
   end. /* multi line */

   if {us/bbi/gpiswrap.i} then pause 0. /* This prevents cases of DT UI "hanging"*/

   if (not sod-detail-all)
   then do:
      run checkReservedLocation.

      /* CHECK FOR NEW LINE (RECORD) AND HANDLE QUANTITY ALLOCATED */
      if l_ret-flag = 1
      and l_det-flag
      and new_line
      then do:
         assign
            alc_sod_nbr  = sod_det.sod_nbr
            alc_sod_line = sod_det.sod_line
            tot_qty_all  = sod_det.sod_qty_all.

         run detailAllocate.
         run determineQuantityAllocated.

         if sod_det.sod_qty_all > totallqty
         then
            sod_det.sod_qty_all = totallqty.
      end. /* IF l_ret-flag = 1 AND l_det-flag ... */

      /* HANDLE QUANTITY ALLOCATED FOR THE EXISTING LINE */
      else if l_ret-flag = 1
      and l_det-flag
      and (not new_line)
      and (input sod_det.sod_qty_all <> prev_qty_all)
      then do:
         l_input_sod_qty_all = input sod_det.sod_qty_all.
         run updateDetailAllocations.
      end. /* ELSE DO */
   end. /* IF NOT sod-detail-all */


   /* DISPLAY CONSIGNMENT FRAMES */
   if using_cust_consignment and this-is-so then do:
      proc_id = "popup-update".
      {us/gp/gprunmo.i
         &program=""socnsod.p""
         &module="ACN"
         &param="""(input proc_id,
           input  sod_det.sod_nbr,
           input  string(sod_det.sod_line),
           input  sod_det.sod_part,
           input  so_ship,
           input  sod_det.sod_site,
           input  no,
           input  sod_det.sod_type,
           output l_undo_all2)"""}
   end. /* IF using_cust_consignment */

   if l_undo_all2
   then do:
      undo_all2 = yes.
      undo seta, leave.
   end. /* IF l_undo_all2 */

   if using_container_charges and this-is-so then do:
      setcontainer:
         /* Prompt for rest of the line information on single line screen */
      do on error undo, retry on endkey undo, leave setcontainer:
         display
            sod_det.sod_pkg_code
            sod_det.sod_ord_mult
            sod_det.sod_charge_type
            sod_det.sod_alt_pkg
         with frame cont_pop.

         assign
            v_charge_type = ""
            last-field    = ""
            old_pkg_code  = sod_det.sod_pkg_code
            old_charge_type = sod_det.sod_charge_type.

         set
            sod_det.sod_pkg_code
            sod_det.sod_ord_mult
            sod_det.sod_charge_type
            sod_det.sod_alt_pkg
         with frame cont_pop editblk: editing:
            if frame-field <> "" then last-field = frame-field.
            readkey.
            apply lastkey.
            hide message.
            if (go-pending or (last-field <> frame-field))
            then do:
               if go-pending then do:
                  if last-field = "sod_pkg_code" and
                     frame-field = "sod_pkg_code"
                  then do:

                     if input sod_det.sod_pkg_code = "" then
                        sod_det.sod_charge_type = "".
                     else
                     if old_pkg_code <> input sod_det.sod_pkg_code
                     then do:

                        run validate_container
                           (input (input sod_det.sod_pkg_code),
                            output chargeable,
                            output v_charge_type,
                            output msgnbr).

                        if msgnbr > 0 then do:
                           run display_msg (input msgnbr, input 4).
                           /* ITEM HAS NOT BEEN DEFINED AS A CONTAINER */
                           next-prompt
                              sod_det.sod_pkg_code
                           with frame cont_pop.
                           next editblk.
                        end. /*IF MSGNBR > 0*/

                        if chargeable then
                           run get_charge_type
                              (input (input sod_det.sod_pkg_code),
                               input (if sod_det.sod_dock > "" then
                                         sod_det.sod_dock
                                      else if sod_det.sod_ship > "" then
                                         sod_det.sod_ship
                                      else so_ship),
                               input so_curr,
                               input-output v_charge_type).
                        display
                           v_charge_type @ sod_det.sod_charge_type
                        with frame cont_pop.
                     end. /* else if old_pkg_code */
                  end. /*IF LAST-FIELD = "SOD_PKG_CODE"*/

                  else if last-field = "sod_charge_type" and
                     frame-field = "sod_charge_type" and
                     old_charge_type <> input sod_det.sod_charge_type
                     and input sod_det.sod_charge_type > ""
                  then do:
                     run validate_charge_type
                        (input (input sod_det.sod_charge_type),
                         input yes,
                         output msgnbr).

                     if msgnbr > 0 then do:
                        run display_msg (input msgnbr, input 4).
                        /* NOT A VALID CHARGE TYPE */
                        next-prompt
                           sod_det.sod_charge_type
                        with frame cont_pop.
                        next editblk.
                     end.
                  end. /*ELSE IF*/
               end. /* IF go-pending then do*/
               else
               if last-field = "sod_pkg_code" and
                  frame-field <> "sod_pkg_code" and
                  input sod_det.sod_pkg_code > "" and
                  input sod_det.sod_pkg_code <> old_pkg_code
               then do:

                  run validate_container (input (input sod_det.sod_pkg_code),
                                          output chargeable,
                                          output v_charge_type,
                                          output msgnbr).

                  if msgnbr > 0 then do:
                     run display_msg (input msgnbr,
                                      input 4).
                    /* ITEM HAS NOT BEEN DEFINED AS A CONTAINER */
                     next-prompt sod_det.sod_pkg_code with frame cont_pop.
                     next editblk.
                  end. /*IF MSGNBR > 0*/

                  if chargeable then
                     run get_charge_type (input (input sod_det.sod_pkg_code),
                                          input (if sod_det.sod_dock > "" then
                                                    sod_det.sod_dock else
                                                 if sod_det.sod_ship > "" then
                                                    sod_det.sod_ship
                                                 else so_ship),
                                          input so_curr,
                                          input-output v_charge_type).
                  display
                     v_charge_type @ sod_det.sod_charge_type
                  with frame cont_pop.
                  old_pkg_code = input sod_det.sod_pkg_code.

               end. /*if last-field = "sod_pkg_code"*/

               else
               if last-field = "sod_charge_type" and
                  frame-field <> "sod_charge_type" and
                  input sod_det.sod_charge_type > "" and
                  input sod_det.sod_charge_type <> old_charge_type
               then do:
                  run validate_charge_type
                                    (input (input sod_det.sod_charge_type),
                                     input yes,
                                     output msgnbr).

                  if msgnbr > 0 then do:
                     run display_msg (input msgnbr,
                                      input 4).
                     /* NOT A VALID CHARGE TYPE */
                     next-prompt sod_det.sod_charge_type
                     with frame cont_pop.
                     next editblk.
                  end.
                  old_charge_type = input sod_det.sod_charge_type.
               end.  /*if last-field = "sod_charge_type" */
            end. /*go-pending or (last-field <> frame-field))*/
         end. /*EDITBLK*/

         hide frame cont_pop no-pause.

         if sod_det.sod_alt_pkg then do:
            {us/rc/rcsomtac.i}
         end.
      end. /*Setcontainer*/
   end. /* IF USING_CONT_CHARGES */

   if using_line_charges and this-is-so then
      run UpdateLineCharges
         (input recid(so_mstr),
          input recid(sod_det)).


   /* FOR RMA'S, UPDATE RMD_DET SPECIFIC DATA ELEMENTS.  */
   /* IF THIS ISN'T SINGLE-LINE MODE, FSRMALIN.P WILL    */
   /* NOT GIVE THE USER A POPUP WINDOW...                */
   if this-is-rma then do:
      {us/bbi/gprun.i ""fsrmalin.p""
         "(input rma-issue-line,
           input new_line,
           input rma-recno,
           input rmd-recno,
           input sod_recno,
           input tax_in,
           input so_db)"}
   end.

   /* SECONDARY SO */
   /* VALIDATE MODIFICATION OF SOD_DUE_DATE                   */

   if so_secondary and not new_line
      and sod_det.sod_promise_date <> prev-promise-date
   then do:

      /* DUE TO THE FACT THAT THE CMD_VAL IS MANDATORY THE ? CAN
       * NOT BE PASSED AND THE VALUE OF "" GOES INSTEAD - OTHERWISE
       * YOU GET HIDDEN PROGRESS ERRORS DURING SOSOBTB2.P */
      /* TRANSMIT CHANGES ON SECONDARY SO TO PRIMARY PO AND SO */
      {us/bbi/gprun.i ""sosobtb2.p""
         "(input recid(sod_det),
           input ""sod_promise_date"",
           input if prev-promise-date = ? then string('')
                 else string(prev-promise-date) ,
           output return-msg)"}

      /* DISPLAY ERROR MESSAGE RETURN FROM SOSOBTB2.P */
      if return-msg <> 0 then do:
         run display_msg (input return-msg, input 3).
         if not (batchrun or {us/bbi/gpiswrap.i}) then pause.
         undo seta, retry seta.
      end.

   end. /* not so_primary and change of sod_due_date */

   /* PRIMARY SO */
   /* CALCULATE DUE DATE WHEN CHANGING SOD_REQ_DATE OR AT CREATION */
   if    s-btb-so and not so_secondary
      and (new_line or sod_det.sod_due_date <> prev-due-date)
      and soc_due_calc
   then do:

      {us/bbi/gprun.i ""sodueclc.p""
         "(input sod_det.sod_due_date,
           input sod_det.sod_part,
           input so_cust,
           input sod_det.sod_btb_type,
           input sod_det.sod_site,
           output s-sec-due,
           output pri-due,
           output exp-del,
           input yes)" }

      assign
         sod_det.sod_promise_date = exp-del when (    soc_ctrl.soc_calc_promise_date
                                                  and sod_det.sod_promise_date = ?)
         sod_det.sod_exp_del      = exp-del
         sod_det.sod_due_date     = pri-due.

   end. /* due date calculation */

   /* Delete allocations if the ship_type is not blank */
   if sod_det.sod_type <> ""
      and (prev_type <> sod_det.sod_type)
      and not new sod_det
   then do:
      {us/bbi/gprun.i ""gpalias3.p"" "( si_db, output err-flag)" }
      if err-flag = 0 or err-flag = 9 then do:

         /* ADDITIONAL PARAMETERS prev_qty_all old_sod_site       */
         /* l_prev_um_conv PASSED TO SOLADDEL.P SO THAT INVENTORY */
         /* WILL BE CORRECTLY DE-ALLOCATED WHEN THE SHIP TYPE IS  */
         /* CHANGED TO "M" ON EXISTING SALES ORDERS.              */

         {us/bbi/gprun.i ""soladdel.p""
            "(input sod_det.sod_nbr,
              input sod_det.sod_line,
              input prev_qty_all,
              input old_sod_site,
              input l_prev_um_conv,
              input l_sodqtyord,
              input l_prev_qty_pick)"}

      end.
      {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err-flag)"}
   end.
   undo_all2 = false.
/*cy1022>>*/
   if sod_det.sod_type = "w" then
   do on error undo, retry on endkey undo, leave seta:
      update sod_det.sod__chr05
             sod_det.sod__chr06
             sod_det.sod__chr07
	     sod_det.sod__dte01
	     sod_det.sod__chr08
	     sod_det.sod__chr09
	     sod_det.sod__chr10
       with frame cyb_warr.
       hide frame cyb_warr.
   end.
/*cy1022<<*/
end. /* seta: set up for update block */

hide frame set_comm no-pause.

hide frame cont_pop no-pause.

PROCEDURE display_msg:
   define input parameter ip_msg_nbr as integer no-undo.
   define input parameter ip_error_level as integer no-undo.

   {us/bbi/pxmsg.i &MSGNUM = ip_msg_nbr &ERRORLEVEL = ip_error_level}

END PROCEDURE. /*DISPLAY_MSG*/

PROCEDURE validate_container:
   define input parameter ip_container like ptc_part no-undo.
   define output parameter op_chargeable like mfc_logical no-undo.
   define output parameter op_charge_type like cct_charge_type no-undo.
   define output parameter op_msg_nbr as integer no-undo.

   assign
      op_chargeable = false
      op_charge_type = ""
      op_msg_nbr = 4447. /* ITEM HAS NOT BEEN DEFINED AS A CONTAINER*/

   for first ptc_det
      fields( ptc_domain ptc_part ptc_charge ptc_charge_type)
      no-lock
      where ptc_domain = global_domain and
            ptc_part = ip_container:
      assign
         op_chargeable = ptc_charge
         op_msg_nbr = 0.
      if ptc_charge then op_charge_type = ptc_charge_type.
   end.

END PROCEDURE. /* VALIDATE_CONTAINER*/

PROCEDURE get_charge_type:
   define input parameter ip_container like ptc_part no-undo.
   define input parameter ip_shipto like so_ship no-undo.
   define input parameter ip_curr like so_curr no-undo.
   define input-output parameter io_charge_type like cct_charge_type.

   for first cclsc_mstr
      fields(cclsc_domain cclsc_shipto cclsc_part
             cclsc_curr cclsc_charge_type)
      no-lock
      where cclsc_domain = global_domain
       and  cclsc_shipto = ip_shipto
       and  cclsc_part   = ip_container
       and  cclsc_curr   = ip_curr:
   end.
   if not available cclsc_mstr then
     for first cclsc_mstr
        fields(cclsc_domain cclsc_shipto cclsc_part
               cclsc_curr cclsc_charge_type)
        no-lock
        where cclsc_domain = global_domain
        and   cclsc_shipto = ""
        and   cclsc_part   = ip_container
        and   cclsc_curr   = ip_curr:
   end.
   if available cclsc_mstr then
      io_charge_type = cclsc_charge_type.

END PROCEDURE. /*GET_CHARGE_TYPE*/

PROCEDURE validate_charge_type:
   define input parameter ip_container like ptc_part no-undo.
   define input parameter ip_container_type like mfc_logical no-undo.
   define output parameter op_msg_nbr as integer no-undo.

   op_msg_nbr = 4396. /* NOT A VALID CHARGE TYPE */

   for first cct_mstr
      fields( cct_domain cct_charge_type cct_container_type)
      no-lock
      where cct_domain = global_domain
      and   cct_charge_type = ip_container
      and   cct_container_type = ip_container_type:
      op_msg_nbr = 0.
   end.

END PROCEDURE. /*VALIDATE_CHARGE_TYPE*/

/* Calculate promise and/or due date via transit time table */
PROCEDURE p-calc-prom-or-due-date:

   define input parameter p-cust like cm_addr     no-undo.
   define input parameter p-site like pt_site     no-undo.
   define input-output parameter p-due-date
                                 like sod_det.sod_due_date     no-undo.
   define input-output parameter p-promise-date
                                 like sod_det.sod_promise_date no-undo.

   /* attempt to calculate promise date now... */
   /* retrieve address record of ship-to customer */
   for first ad_mstr
      fields( ad_domain ad_addr
              ad_ctry
              ad_state
              ad_city)
       where ad_domain = global_domain
        and  ad_addr = p-cust :

      for first si_mstr
         fields( si_domain si_site si_db)
         where si_domain = global_domain
          and  si_site = p-site
      no-lock:
         /* Switch to the Inventory site */
         {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err-flag)" }

         {us/bbi/gprun.i ""sopromdt.p""
                  "(input p-site,
                    input ad_ctry,
                    input ad_state,
                    input ad_city,
                    input """",
                    input-output p-due-date,
                    input-output p-promise-date)" }

         /* Switch back to the sales order site */
         {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err-flag)" }

      end. /* FOR FIRST si_mstr */
   end. /* for first ad_mstr */

END PROCEDURE.   /* p-calc-prom-or-due-date */

/*  Calculate promise and due date defaults  */
PROCEDURE p-calc-date-defaults:

   define input parameter p-cust like cm_addr     no-undo.
   define input parameter p-site like pt_site     no-undo.
   define input parameter p-required-date
                                 like sod_det.sod_req_date      no-undo.
   define input-output parameter p-promise-date
                                 like sod_det.sod_promise_date  no-undo.
   define input-output parameter p-due-date
                                 like sod_det.sod_due_date      no-undo.

   /* If promise <> ? and due <> ? the no defaulting */
   if p-due-date <> ? and p-promise-date <> ? then leave.

   /* If promise = ? and due <> ? then               */
   /*  calc promise date from due date now...        */
   if p-promise-date = ? and p-due-date <> ? then do:
      run p-calc-prom-or-due-date (input p-cust,
                                   input p-site,
                                   input-output p-due-date,
                                   input-output p-promise-date).
      leave.
   end. /* calculate promise date... */

   /* If promise = <> ? and due = ? then               */
   /*  calc due date from promise date now...          */
   if p-promise-date <> ? and p-due-date = ? then do:
      run p-calc-prom-or-due-date (input p-cust,
                                   input p-site,
                                   input-output p-due-date,
                                   input-output p-promise-date).
      leave.
   end. /* calculate due date... */

   if p-promise-date = ?
      and p-due-date = ?
   then do:
      if p-required-date <> ?
      then do:
         /* 1. DEFAULT PROMISE DATE FROM REQUIRED DATE */
         p-promise-date = p-required-date.

         /* 2. ATTEMPT TO CALCULATE DUE DATE FROM PROMISE DATE NOW */
         run p-calc-prom-or-due-date (input p-cust,
                                      input p-site,
                                      input-output p-due-date,
                                      input-output p-promise-date).

         /* 3. IF DUE NOT CALCULATED, DEFAULT TO REQUIRED DATE */
            if p-due-date = ?
            then
               p-due-date = p-required-date.
            leave.
      end. /* IF p-required-date <> ? */

      else do:
         /* 1. DUE DATE = TODAY + SHIPPING LEAD TIME        */
         p-due-date = today + soc_ctrl.soc_shp_lead.

         /* 2. CALC PROMISE DATE FROM DUE DATE NOW...        */
         run p-calc-prom-or-due-date (input p-cust,
                                      input p-site,
                                      input-output p-due-date,
                                      input-output p-promise-date).
         leave.
      end. /* p-required-date = ? */
      /* NOTE: IF new_line = no, AND ATP IS ON, USE BEST AVAIL */
      /* DUE DATE, BUT THIS IS DONE LATER IN THE CODE...       */
   end.  /* IF promise and due = ? */
END PROCEDURE.  /* p-calc-date-defaults */


PROCEDURE createRemoteLines:
   /* WE DON'T CREATE THE REMOTE LINES UNLESS THE LINE IS CONFIRMED */
   if si_mstr.si_db <> so_db and sod_det.sod_confirm then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err-flag)" }
      if err-flag = 0 or err-flag = 9 then do:

         /* ADDED INPUT PARAMETER no TO NOT EXECUTE MFSOFC01.I   */
         /* AND MFSOFC02.I WHEN CALLED FROM DETAIL LINE          */
         {us/bbi/gprun.i ""solndel.p""
            "(input no)"}
      end.
      /* Reset the domain to the sales order domain */
      {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err-flag)" }
      sod_recno = recid(sod_det).
   end.
   else do:
      {us/bbi/gprun.i ""solndel1.p""}
   end.
END PROCEDURE.   /* createRemoteLines */


PROCEDURE determineQuantityAllocated:
   /* Determine total quantity allocated */
   {us/bbi/gprun.i ""gpalias3.p"" "(si_mstr.si_db, output err-flag)" }
   if err-flag = 0 or err-flag = 9 then do:
      {us/bbi/gprun.i ""soladqty.p"" "(sod_det.sod_nbr, sod_det.sod_line,
                                sod_det.sod_um_conv, output totallqty )"}
   end.
   {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err-flag)"}

END PROCEDURE.   /* determineQuantityAllocated */

PROCEDURE doDetailAllocations:
   {us/bbi/gprun.i ""gpalias3.p"" "(si_mstr.si_db, output err-flag)" }
   if err-flag = 0 or err-flag = 9 then do:
      {us/bbi/gprun.i ""solcal1.p"" "( input sod_det.sod_site,
                                input sod_det.sod_nbr,
                                input sod_det.sod_line,
                                input sod_det.sod_part,
                                input sod_det.sod_um_conv,
                                input sod_det.sod_loc,
                                input sod_det.sod_serial,
                                input sod_det.sod_qty_ord,
                                input sod_det.sod_qty_all,
                                input sod_det.sod_qty_pick,
                                input sod_det.sod_qty_ship,
                                input sod_det.sod_due_date,
                                input-output totallqty )"}
   end.
   {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err-flag)"}

END PROCEDURE.  /*  doDetailAllocations */

PROCEDURE allocationCheck:
   if si_mstr.si_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias2.p"" "(sod_det.sod_site,output err-flag)" }
   end.

   if err-flag = 0 or err-flag = 9 then do:
      if soc_ctrl.soc_all_avl and sod_det.sod_qty_all > 0
         and sod_det.sod_type = ""
      then do:
         assign new_record = new sod_det.

         {us/bbi/gprun.i ""soallchk.p""
            "(sod_det.sod_part,
              sod_det.sod_site,
              prev_qty_all * l_prev_um_conv,
              sod_det.sod_qty_all * sod_det.sod_um_conv,
              new_record,
              so_mstr.so_ship,
              so_bill,
              so_cust,
              so_fsm_type,
              output warn,
              output net_avail)" }

      end. /* if soc_all_avl */
   end. /* if err-flag */

   if si_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(so_db,output err-flag)" }
   end.  /* if si_db <> so_db */
END PROCEDURE. /* allocationCheck */

PROCEDURE ValidateCategory:
   define input parameter ip_category like sod_det.sod_order_category no-undo.
   define output parameter op_error   like mfc_logical no-undo.

   if not ({gpcode.v ip_category "line_category"})
   then op_error = yes.
   else op_error = no.
END PROCEDURE. /* ValidateCategory */

PROCEDURE UpdateLineCharges:
   define input parameter ip_sorecid as recid no-undo.
   define input parameter ip_sodrecid as recid no-undo.

   {us/gp/gprunmo.i
      &module = "ACL"
      &program = ""rcsolcmt.p""
      &param = """(input ip_sorecid,
                   input ip_sodrecid)"""}

END PROCEDURE.

PROCEDURE createCodeMstr:
      create code_mstr. code_mstr.code_domain = global_domain.
      assign
         code_fldname = "tr_type"
         code_value   = "ISS-RMA".
         code_cmmt    = getTermLabel("PSEUDO_TRANS-TYPE_FOR_RMA_RECEIPT",40).
      if recid(code_mstr) = -1 then .

END PROCEDURE.

PROCEDURE siteChanged:

   /* ON SITE CHANGE IF THE ITEM IN NEW SITE IS NOT CONFIGURED THEN */
   /* DELETE SALES ORDER BILL RECORDS (sob_det), ALLOCATION DETAIL  */
   /* RECORDS (lad_det), COST RECORDS (sct_det); UPDATES FORECAST   */
   /* AND MRP DETAIL (mrp_det) AND UPDATES INVENTORY DETAIL BY      */
   /* LOCATION (ld_det) FOR PREVIOUS SITE                           */

   if sod_det.sod_site <> old_site
      and new_line = no
      and ((can-find (first pt_mstr
                       where pt_domain = global_domain
                       and ( pt_part =  sod_det.sod_part
                       and   pt_pm_code <> "c"))
           or can-find (first ptp_det
                         where ptp_domain = global_domain
                          and  ptp_part   =  sod_det.sod_part
                          and  ptp_site   =  old_site
                          and  ptp_pm_code <> "c"))
           and (can-find (first ptp_det
                           where ptp_domain  = global_domain
                            and  ptp_part    = sod_det.sod_part
                            and  ptp_site    = sod_det.sod_site
                            and  ptp_pm_code <> "c" )))
      then do:

         for first si_mstr
            fields( si_domain si_auto_loc si_db si_site si_status)
            where si_domain = global_domain
             and  si_site = old_site
         no-lock:
         end. /* FOR FIRST SI_MSTR */

         assign
            sonbr  = sod_det.sod_nbr
            soline = sod_det.sod_line.

         run createRemoteLines.
      end.
END PROCEDURE.

PROCEDURE setSort:
      sort = "".
      do counter = 1 to 4:

         for first ad_mstr
            where ad_mstr.ad_domain = global_domain
            and   ad_mstr.ad_addr   = sod_det.sod_slspsn[counter]
         no-lock:
         end. /* FOR FIRST ad_mstr */
         if available ad_mstr
         then
            sort[counter] = ad_sort.

      end.
END PROCEDURE.

PROCEDURE setUpdateQtyAll:
      for first po_mstr
         fields( po_domain po_inv_mthd)
         where po_domain = global_domain
         and   po_nbr = sod_det.sod_btb_po
      no-lock:
      end. /* FOR FIRST po_mstr */
      if available po_mstr
         and (right-trim(substring(po_inv_mthd,2,24)) = "")
      then
         l_use_edi = no.
      if (sod_det.sod_btb_type = "02"
         and sod_det.sod_qty_all > 0
         and not l_use_edi)
      then
         l_update_qty_all = yes.
END PROCEDURE.

PROCEDURE checkSiteDB:

      for first si_mstr
         fields( si_domain si_auto_loc si_db si_site si_status)
         where si_domain = global_domain
          and  si_site = sod_det.sod_site
      no-lock:
      end. /* FOR FIRST SI_MSTR */

      if si_db <> so_db then do:
         {us/bbi/gprun.i ""gpalias2.p"" "(sod_det.sod_site,output err-flag)" }
      end.

      if err-flag = 0 or err-flag = 9 then do:
         if soc_ctrl.soc_all_avl and sod_det.sod_qty_all > 0
            and sod_det.sod_type = ""
         then do:
            assign new_record = new sod_det.

            /* CONVERTED THIRD PARAMETER PREV_QTY_ALL AND FOURTH */
            /* PARAMETER SOD_QTY_ALL TO INVENTORY UM             */
            {us/bbi/gprun.i ""soallchk.p""
               "(sod_det.sod_part,
                 sod_det.sod_site,
                 prev_qty_all * l_prev_um_conv,
                 sod_det.sod_qty_all * sod_det.sod_um_conv,
                 new_record,
                 so_mstr.so_ship,
                 so_bill,
                 so_cust,
                 so_fsm_type,
                 output warn,
                 output net_avail)" }

            find cil_mstr where cil_mstr.cil_domain = global_domain and
               cil_cor_so_nbr = sod_nbr
            no-lock no-error.

            if available cil_mstr then do:
               if can-find(cild_det where cild_domain = global_domain
                           and cild_cor_inv  = cil_cor_inv
                           and cild_cor_so_nbr      = cil_cor_so_nbr
                           and cild_cor_line = sod_line
                           and cild_line_type     = "R") then .
               else do:
                  find idh_hist where idh_domain = global_domain
                     and idh_inv_nbr = cil_prev_inv
                     and idh_nbr     = cil_prev_so_nbr
                     and idh_line    = sod_line no-lock no-error.
                  assign
                     net_avail = net_avail +
                        (if available idh_hist then idh_qty_inv else 0).
                  if net_avail >= sod_qty_all then warn = no.
               end.

            end.
         end. /* if soc_all_avl */
      end. /* if err-flag = 0 or err-flag = 9 */

END PROCEDURE.

PROCEDURE setUpForApoAtp:
/* ---------------------------------------------------------------------------
Purpose:       This procedure determines APO ATP should be used.
               If it is in use then open io stream used for APO ATP.
Exceptions:    None
Conditions:
Pre:
Post:
Notes:
History:
----------------------------------------------------------------------------*/

   if this-is-rma then moduleGroup = "RMA".
   else moduleGroup = "SO".

   /* Get Apo Atp setup only if standard Atp was not used. */
   /* If standard Atp is used and the setup is run,       */
   /* useApoAtp will be set incorrectly.                  */
   if stdAtpUsed = no then do:
   /* Determine if Apo Atp is in Use */
      {us/px/pxrun.i &proc='getApoAtpSetup' &program='sosoxr1.p'
            &handle=ph_sosoxr1
            &param="(input sod_det.sod_site,
                     input sod_det.sod_part,
                     input sod_det.sod_confirm,
                     input sod_det.sod_type,
                     input sod_det.sod_btb_type,
                     input sod_det.sod_due_date,
                     input sod_det.sod_qty_ord,
                     input sod_det.sod_um_conv,
                     input moduleGroup,
                     input new_line,
                     input prev-confirm,
                     output checkAtp,
                     output useApoAtp,
                     output apoAtpDelAvail,
                     output apoAtpDelAvailMsg)"}
   end.

   if checkAtp and useApoAtp then do:
   /* After a new order line has been entered or an existing line      */
   /* is modified where the confirm flag is changed from no to yes     */
   /* then initialize Apo Atp values based on order line.              */

      assign
         atp-site     = sod_det.sod_site
         atp-cum-qty  = sod_det.sod_qty_ord
         atp-due-date = sod_det.sod_due_date.

      if apoAtpDelAvail then do:
      /* A Shared Stream cannot be used with app server logic */
      /* Open the apoAtpStream */
         {us/px/pxrun.i &proc='openApoAtpIOStream' &program='giapoxr.p'
                  &handle=ph_giapoxr
                  &catcherror=TRUE
                  &noapperror=TRUE
                  &module='GI1'}
      end.
   end.  /* checkAtp and useApoAtp */

END PROCEDURE. /* setUpForApoAtp */

PROCEDURE p-check-atp:
/* ---------------------------------------------------------------------------
Purpose:       This procedure determines if there are any problems
               with ATP Enforcement for the confirmed order line.
               APO ATP or standard ATP enforcement will be used for
               determining the output.
Exceptions:    None
Conditions:
Pre:
Post:
Notes:
History:
----------------------------------------------------------------------------*/

   {us/bbi/gprun.i ""soatpck.p""
           "(input so_mstr.so_cust,
             input so_ship,
             input so_bill,
             input sod_det.sod_nbr,
             input sod_det.sod_line,
             input sod_det.sod_site,
             input sod_det.sod_part,
             input sod_det.sod_due_date,
             input sod_det.sod_um_conv,
             input sod_det.sod_um,
             input (sod_det.sod_qty_ord - sod_det.sod_qty_ship),
             input sod_det.sod_btb_type,
             input sod_det.sod_confirm,
             input no,
             input soc_ctrl.soc_atp_enabled,
             input soc_horizon,
             input sod_det.sod_type,
             input sod_det.sod_consume,
             input sngl_ln,
             input useApoAtp,
             input moduleGroup,
             input apoAtpDelAvail,
             input apoAtpDelAvailMsg,
             output atp-ok,
             output atp-due-date,
             output atp-cum-qty,
             output atp-site,
             output errorResult,
             output continue,
             output stdAtpUsed)"}

   /* If Standard Atp enforcement was used,  */
   /* No Apo Atp checks should be done.      */
   if stdAtpUsed then useApoAtp = no.

END PROCEDURE. /* p-check-atp  */

PROCEDURE updateWithApoAtpData:
/* ---------------------------------------------------------------------------
Purpose:       This procedure updates site, date and quantity
               returned from apo atp.
               This is for single line processing only.
Exceptions:    None
Conditions:
Pre:
Post:
Notes:
History:

Inputs/Outputs:
None
----------------------------------------------------------------------------*/

   /* When atp-due-date = ?  then      */
   /* no changes were made by APO ATP  */
   if atp-due-date <> ? then do:
      if sod_det.sod_site <> atp-site or
      sod_det.sod_qty_ord <> atp-cum-qty then
         atp-qty-site-changed.

      /* If Users Selects To Confirm Order Line with Atp Due Date */
      if errorResult = "0" and sod_det.sod_due_date <> atp-due-date
      then
         sod_det.sod_due_date = atp-due-date.

      if (errorResult = "2" or errorResult = "3") then
         assign
            sod_det.sod_site     = atp-site
            sod_det.sod_due_date = atp-due-date
            sod_det.sod_qty_ord  = atp-cum-qty.
      else if errorResult = "1" then
         assign
            sod_det.sod_site     = atp-site
            sod_det.sod_due_date = atp-due-date.
   end.

END PROCEDURE. /* updateWithApoAtpData */

PROCEDURE ip_validate_fullcode:
/* ---------------------------------------------------------------------------
Purpose:       Validate Accout/Sub/CC/Project combination

   Parameters:   1. input    i_acct
                 2. input    i_sub
                 3. input    i_cc
                 4. input    i_project
                 5. output   o_valid_acct

   Note:         Procedure created to remove Error "Action Segment has exceeded
                 its limit of 63488 bytes".
----------------------------------------------------------------------------*/

   define input parameter i_acct        like sod_det.sod_acct    no-undo.
   define input parameter i_sub         like sod_det.sod_sub     no-undo.
   define input parameter i_cc          like sod_det.sod_cc      no-undo.
   define input parameter i_project     like sod_det.sod_project no-undo.
   define input parameter i_acctfldname like sod_det.sod_acct    no-undo.
   define output parameter o_valid_acct as logical               no-undo.

   /* INITIALIZE SETTINGS */
   {us/gp/gprunp.i "gpglvpl" "p" "initialize"}

   /* ACCT/SUB/CC/PROJ VALIDATION */
   {us/gp/gprunp.i "gpglvpl" "p" "validate_fullcode"
      "(input  i_acct,
        input  i_sub,
        input  i_cc,
        input  i_project,
        input  i_acctfldname,
        output o_valid_acct)"}


END PROCEDURE. /* ip_validate_fullcode */

PROCEDURE checkReservedLocation:

   assign
      l_ret-flag = 2
      l_det-flag = no.

   /* BYPASS CHECKING SSM ORDERS */
   if so_mstr.so_fsm_type = ""
   then do:
      {us/bbi/gprun.i ""sorlchk1.p""
         "(input so_mstr.so_ship,
           input so_mstr.so_bill,
           input so_mstr.so_cust,
           input sod_det.sod_site,
           input sod_det.sod_loc,
           output l_ret-flag,
           output l_det-flag)"}
   end. /* IF so_mstr.so_fsm_type = "" */
END PROCEDURE.  /* PROCEDURE checkReservedLocation */

PROCEDURE updateDetailAllocations:
   define variable l_undeallo_qty like sod_det.sod_qty_all no-undo.

   if l_input_sod_qty_all < totallqty
   then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(si_mstr.si_db, output err-flag)"}
      if err-flag = 0
      or err-flag = 9
      then do:
         {us/bbi/gprun.i ""sodeall.p""
            "(sod_det.sod_nbr,
              sod_det.sod_line,
              sod_det.sod_um_conv,
              totallqty - l_input_sod_qty_all,
              l_input_sod_qty_all)"}

      end. /* IF err-flag = 0 or err-flag = 9 */
      {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err-flag)"}
   end. /* IF l_input_sod_qty_all < totallqty */
   else do:
      assign
         alc_sod_nbr  = sod_det.sod_nbr
         alc_sod_line = sod_det.sod_line
         tot_qty_all  = sod_det.sod_qty_all.
      run detailAllocate.
      run determineQuantityAllocated.
      if sod_qty_all > totallqty
      then
         sod_det.sod_qty_all = totallqty.
   end. /* ELSE DO */
END PROCEDURE. /* PROCEDURE updateDetailAllocations */

PROCEDURE detailAllocate:

   for first sod_det
      where recid(sod_det) = sod_recno
      and   sod_det.sod_domain = global_domain
   no-lock:
   end. /* FOR FIRST sod_det */

   if sod_type = ""
   then do:
      assign
         so_db          = global_db
         alc_sod_nbr    = sod_nbr
         alc_sod_line   = sod_line
         sod_recno      = sod_recno
         so_recno       = so_recno.

      for first si_mstr
         fields(si_db si_site)
         where si_site           = sod_det.sod_site
         and   si_mstr.si_domain = global_domain
      no-lock:
      end. /* FOR FIRST si_mstr */

      if si_db <> so_db
      then do:
         /*CREATE HARD ALLOCATIONS IN THE INVENTORY SITE*/

         /* SWITCH TO THE INVENTORY SITE */
         {us/bbi/gprun.i ""gpalias3.p"" "(input si_db, output l_err_flag)"}

         if l_err_flag = 0
         or l_err_flag = 9
         then do:

            /* DO THE DETAIL ALLOCATIONS */
            {us/bbi/gprun.i ""sopkall.p"" "(no)"}

            /* UPDATE SALES ORDER QTY PICK AND QTY ALLOC AND PICK DATE */
            if so_db <> global_db
            then do:

               /* UPDATE DETAIL QTY ALL,  */
               {us/bbi/gprun.i ""sodetall.p""
                  "(input alc_sod_nbr,
                    input alc_sod_line,
                    input tot_qty_all)"}
            end. /* IF so_db <> global_db */

            /* SWITCH BACK TO THE SALES ORDER DATABASE */
            {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output l_err_flag)"}

            /* UPDATE SOD IN SO DATABASE, UPDATE DETAIL QTY ALL */
            {us/bbi/gprun.i ""sodetall.p""
               "(input alc_sod_nbr,
                 input alc_sod_line,
                 input tot_qty_all)"}
         end. /* IF l_err_flag = 0 or l_err_flag = 9 */
      end. /* IF si_db <> so_db */
      else do:

         {us/bbi/gprun.i ""sopkall.p"" "(no)"}
         {us/bbi/gprun.i ""sodetall.p""
            "(input alc_sod_nbr,
              input alc_sod_line,
              input tot_qty_all)"}
      end. /* ELSE DO */
   end. /* IF sod_type = "" */
END PROCEDURE. /* PROCEDURE detailAllocate */
