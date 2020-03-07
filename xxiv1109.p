/* xxiv1101.p - INVOICE HISTORY INVOICE REPRINT MAINLOOP                     */
/* soiv1001.p - INVOICE HISTORY INVOICE REPRINT MAINLOOP                     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxiv1109.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* REVISION: 8.5      CREATED: 10/20/97          BY: *H1F8* Nirav Parikh     */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane         */
/* REVISION: 8.6E     LAST MODIFIED: 04/28/98   BY: *L00L* Adam Harris       */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6E     LAST MODIFIED: 06/23/98   BY: *L024* Sami Kureishy     */
/* REVISION: 8.6E     LAST MODIFIED: 12/04/98   BY: *J360* Poonam Bahl       */
/* REVISION: 8.6E     LAST MODIFIED: 02/01/99   BY: *L0D5* Robin McCarthy    */
/* REVISION: 8.6E     LAST MODIFIED: 02/05/99   BY: *J38T* Poonam Bahl       */
/* REVISION: 8.6E     LAST MODIFIED: 05/07/99   BY: *J3DQ* Niranjan R.       */
/* REVISION: 8.6E     LAST MODIFIED: 10/05/99   BY: *L0JV* Anup Pereira      */
/* REVISION: 9.1      LAST MODIFIED: 03/06/00   BY: *N05Q* Luke Pokic        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 02/16/00   BY: *N06R* Denis Tatarik     */
/* REVISION: 9.1      LAST MODIFIED: 05/07/00   BY: *N09G* Luke Pokic        */
/* REVISION: 9.1      LAST MODIFIED: 06/27/99   BY: *N0DQ* Katie Hilbert     */
/* REVISION: 9.1      LAST MODIFIED: 07/03/00   BY: *N0DX* Mudit Mehta       */
/* REVISION: 9.1      LAST MODIFIED: 08/23/00   BY: *N0ND* Mark Brown        */
/* REVISION: 9.1      LAST MODIFIED: 11/07/00   BY: *L15K* Kaustubh K        */
/* REVISION: 9.1      LAST MODIFIED: 10/13/00   BY: *N0W8* Mudit Mehta        */
/* Revision: 1.30     BY: Katie Hilbert       DATE: 04/01/01   ECO: *P002*    */
/* Revision: 1.31     BY: Manisha Sawant      DATE: 05/08/01   ECO: *N0YD*    */
/* Revision: 1.32     BY: Ellen Borden        DATE: 07/09/01   ECO: *P007*    */
/* Revision: 1.33     BY: Hareesh V.          DATE: 08/20/01   ECO: *N11L*    */
/* Revision: 1.34     BY: Vinod Nair          DATE: 08/24/01   ECO: *N11P*    */
/* Revision: 1.35     BY: Tiziana Giustozzi   DATE: 10/02/01   ECO: *N138*    */
/* Revision: 1.37     BY: Mercy Chittilapilly DATE: 10/08/02   ECO: *N1W1*    */
/* Revision: 1.38     BY: Amit Chaturvedi     DATE: 01/20/03   ECO: *N20Y*    */
/* Revision: 1.39     BY: Vandna Rohira       DATE: 04/28/03   ECO: *N1YL*    */
/* Revision: 1.40     BY: Narathip W.         DATE: 05/21/03   ECO: *P0S8*    */
/* Revision: 1.42     BY: Paul Donnelly (SB)  DATE: 06/28/03   ECO: *Q00P*    */
/* Revision: 1.43     BY: Vivek Gogte         DATE: 08/02/03   ECO: *N2GZ*    */
/* Revision: 1.44     BY: Ed van de Gevel     DATE: 08/22/03   ECO: *Q02M*    */
/* Revision: 1.45     BY: Manish Dani         DATE: 09/01/03   ECO: *P0VZ*    */
/* Revision: 1.46     BY: Ashish Maheshwari   DATE: 11/15/03   ECO: *P15L*    */
/* Revision: 1.47     BY: Shilpa Athalye      DATE: 11/26/03   ECO: *P1BF*    */
/* Revision: 1.48     BY: Vinay Soman         DATE: 01/20/04   ECO: *N2NZ*    */
/* Revision: 1.49     BY: Shivaraman V.       DATE: 02/05/04   ECO: *P1MR*    */
/* Revision: 1.51     BY: Swati Sharma        DATE: 02/27/04   ECO: *P1R4*    */
/* Revision: 1.52     BY: Bhagyashri Shinde   DATE: 02/01/05   ECO: *P365*    */
/* Revision: 1.57     BY: Ed van de Gevel     DATE: 03/01/05   ECO: *R00G*    */
/* Revision: 1.58     BY: Ed van de Gevel     DATE: 03/16/05   ECO: *R00H*    */
/* Revision: 1.59     BY: Ed van de Gevel     DATE: 18/03/05   ECO: *R00F*    */
/* Revision: 1.60     BY: Priya Idnani        DATE: 03/30/05   ECO: *P380*    */
/* Revision: 1.61     BY: Ed van de Gevel     DATE: 07/01/05   ECO: *R01H*    */
/* Revision: 1.62     BY: Alok Gupta          DATE: 01/24/06   ECO: *P43Q*    */
/* Revision: 1.63     BY: Nishit V            DATE: 02/06/06   ECO: *P4GY*    */
/* Revision: 1.65     BY: Tom Kennedy         DATE: 06/08/06   ECO: *Q0LK*    */
/* Revision: 1.66     BY: Samir Bavkar        DATE: 08/31/06   ECO: *R08J*    */
/* Revision: 1.70     BY: Katie Hilbert       DATE: 06/22/07   ECO: *R0C6*    */
/* Revision: 1.71     BY: Dinesh Dubey        DATE: 07/07/08   ECO: *R0W3*    */
/* Revision: 1.75     BY: Jean Miller         DATE: 10/07/08   ECO: *R15M*    */
/* Revision: 1.76     BY: Dilip Manawat       DATE: 10/03/08   ECO: *R15K*    */
/* Revision: 1.77     BY: Yizhou Mao          DATE: 02/10/09   ECO: *R1BY*    */
/* Revision: 1.78     BY: Hemant Dhavse       DATE: 03/20/09   ECO: *Q2J3*    */
/* Revision: 1.79     BY: Sundeep Kalla       DATE: 05/27/09   ECO: *R1K4*    */
/* Revision: 1.80     BY: Xiaolei Meng        DATE: 07/31/09   ECO: *R1N2*    */
/* Revision: 1.81     BY: Jean Miller         DATE: 11/23/09   ECO: *R1TW*    */
/* Revision: 1.82     BY: Manjusha Inglay     DATE: 12/14/09   ECO: *R1VM*    */
/* Revision: 1.83     BY: Sandeep Rohila      DATE: 02/03/10   ECO: *R1XM*    */
/* Revision: 1.84     BY: Trupti Khairnar     DATE: 08/24/10   ECO: *Q4BT*    */
/* CYB       LAST MODIFIED: 10-AUG-2010     BY: gbg *cy1002a*                 */
/* CYB       LAST MODIFIED: 10-AUG-2010     BY: gbg *cy1002b*                 */
/* CYB       LAST MODIFIED: 21-Sep-2010     BY: nac *cy1002c*                 */
/* CYB       LAST MODIFIED: 21-Sep-2010     BY: nac *cy1002e*                 */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 07-MAY-2013     BY: gbg *c1398*                   */
/* CYB    LAST MODIFIED: 30-MAY-2013    BY:  gbg *c1415*                     */
/* CYB    LAST MODIFIED: 2015-01-07     BY:  gbg *c1512*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* THIS PROGRAM IS SIMILAR TO sorp1001.p. CHANGES DONE IN THIS PROGRAM       */
/* MAY ALSO NEED TO BE DONE IN sorp1001.p.                                   */

/*! N1YL HAS CHANGED THE WAY TAXABLE/NON-TAXABLE AMOUNT IS CALCULATED.
    THE ORDER DISCOUNT IS APPLIED FOR EACH LINE TOTAL AND THEN IT IS
    SUMMED UP TO CALCULATE THE TAXABLE/NON-TAXABLE AMOUNT BASED ON THE
    TAXABLE STATUS OF EACH LINE. PREVIOUSLY, TAXABLE/NON-TAXABLE AMOUNT
    WAS OBTAINED FROM THE GTM TABLES. THIS CAUSED PROBLEMS WHEN
    MULTIPLE TAXABLE BASES ARE USED TO CALCULATE TAX.

    TAXABLE/NON-TAXABLE AMOUNT WILL NOW BE DISPLAYED IN THE TRAILER
    FRAME BASED ON THE VALUE OF THE FLAG "DISPLAY TAXABLE/NON-TAXABLE
    AMOUNT ON TRAILER" IN THE GLOBAL TAX MANAGEMENT CTRL FILE
 */
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
{us/px/pxphdef.i adcrxr}

{us/gp/gprunpdf.i "sopl" "p"}
{us/so/sotxidef.i}
{us/xf/xfdefa.i}  /*eb3sp5*/
{us/xf/xfiv10v.i} /*eb3sp5*/
{us/xf/xfiv10u.i} /*eb3sp5*/
/*cy1002*/  def shared var shipvia          like ih_shipvia.
/*cy1002*/  def shared var shipvia1         like ih_shipvia.
/*cy1002c*/ def shared var outboth        as logical initial yes
/*cy1002c*/                                   label "Output All".
/*cy1002c*/ def shared var outtype        as logical
/*cy1002c*/                                   format "Email/Print"
/*cy1002c*/                                   label "Output Type".

define new shared variable undo_txdetrp     like mfc_logical.
define new shared variable rmaso            like mfc_logical.
define new shared variable col-80           like mfc_logical initial true.
define new shared variable disc_prnt_label  as character format "x(8)".
define new shared variable sacontract       like mfc_logical.
define new shared variable isDomOrder        as logical no-undo.

define     shared variable prt_cor          like mfc_logical  initial no.
define     shared variable rndmthd          like rnd_rnd_mthd.
define     shared variable oldcurr          like ih_curr.
define     shared variable inv              like idh_inv_nbr.
define     shared variable inv1             like idh_inv_nbr.
define     shared variable nbr              like ih_nbr.
define     shared variable nbr1             like ih_nbr.
define     shared variable dnbr             like ih_nbr no-undo.
define     shared variable dnbr1            like ih_nbr no-undo.
define     shared variable dom-proc         as integer no-undo.
define     shared variable site             like ih_site.
define     shared variable site1            like ih_site.
define     shared variable print_lotserials like mfc_logical.
define     shared variable first_line       like mfc_logical.
define     shared variable pages            as integer.
define     shared variable comp_addr        like soc_company.
define     shared variable msg              like msg_desc.
define     shared variable inv_date         like ih_inv_date.
define     shared variable inv_date1        like ih_inv_date.
define     shared variable ih_recno         as recid.
define     shared variable company          as character
                                            format "x(38)" extent 6.
define     shared variable billto           as character
                                            format "x(38)" extent 6.
define     shared variable soldto           as character
                                            format "x(38)" extent 6.
define     shared variable termsdesc        as character format "x(40)" label "Description" no-undo.
define     shared variable shipdate         like ih_ship_date.
define     shared variable shipdate1        like shipdate.
define     shared variable addr             as character
                                            format "x(38)" extent 6.
define     shared variable print_options    like mfc_logical.
define     shared variable base_rpt         as character.
define     shared variable override_print_hist like mfc_logical.
define     shared variable hdr_po           as character format "x(38)".
define     shared variable cust             like ih_cust.
define     shared variable cust1            like ih_cust.
define     shared variable bill             like ih_bill.
define     shared variable bill1            like ih_bill.
define     shared variable ship             like so_ship.
define     shared variable ship1            like so_ship.
/* DEFINE VARIABLES FOR INVOICE TOTALS. */
define     shared variable resale           like cm_resale.
define     shared variable call-detail      like mfc_logical.
define     shared variable incinv           like mfc_logical.
define     shared variable incmemo          like mfc_logical.
define     shared variable slspsn1          as character no-undo.
define     shared variable slspsn           as character no-undo.
define     shared variable reprint          like mfc_logical.
define     shared variable update_invoice   like mfc_logical.
define     shared variable lang             like so_lang.
define     shared variable lang1            like lang.
define     shared variable sls-psn          like so_slspsn[1] no-undo.
define     shared variable sls-psn1         like so_slspsn[1] no-undo.
define     shared variable daybook          as character no-undo.
define     shared variable daybook1         as character no-undo.
define     shared variable inv_batch        like ih_batch no-undo.
define     shared variable inv_batch1       like ih_batch no-undo.

/* For fiscal number */
define     shared variable update_fnbr      like mfc_logical no-undo.
define     shared variable fnbr_seq         like nr_seqid    no-undo.
define            variable l_error          like mfc_logical no-undo.

/* Shared variables for print settings */
{us/so/soprsets.i}

{us/so/soivtot1.i}
/* DEFINITION FOR TEMP TABLE  t_tr_hist1 */
{us/so/sotrhstb.i}
define new shared frame phead1.

/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtegl.i}
{us/gp/gpvtecdf.i &var="shared"}
{us/gp/gpvtepdf.i &var="shared"}

define            variable first-invoice    like mfc_logical no-undo.
define            variable currdisp         like so_curr no-undo.
define            variable svremarks        as character format "x(58)"
                                            no-undo.
define            variable h_format         as handle no-undo.
define            variable prepaid-lbl      as character format "x(12)"
                                            no-undo.
define            variable prepaid_fmt      as character no-undo.
define            variable prepaid_old      as character no-undo.
define            variable tot_prepaid_amt  like so_prepaid.
define            variable hdl_sum_disc_lbl as handle no-undo.
define            variable tax_tr_type      like tx2d_tr_type
                                            initial "16" no-undo.
define            variable print_invoice    like mfc_logical no-undo.
define            variable hdr_call         as character
                                            format "x(21)" no-undo.
define            variable call-lbl         as character format "x(16)"
                                            no-undo.
define            variable tot_prepaid_nett like so_prepaid
                                            label "Total Prepaid" no-undo.
define            variable tot_ptax_amt     like ih_prep_tax no-undo.
define            variable amt_due_af_prep  like so_prepaid
                                            label "Amount Due" no-undo.
define            variable add-trl-length   as integer no-undo.
define            variable price_fmt        as character no-undo.
define            variable vlResult         like mfc_logical no-undo.
define            variable vcCreditCardMsg  as character format "x(80)"
                                            extent 3 no-undo.
define            variable translation      as character no-undo.
define            variable c-cont           as character format "x(35)" no-undo.
define            variable l_skip_rec       like mfc_logical        no-undo.
define            variable auth_price          like sod_price
                                               format "->>>>,>>>,>>9.99" no-undo.
define            variable auth_found          like mfc_logical     no-undo.
define            variable l_nontax_amt        like ih_trl2_amt initial 0.
define            variable l_tax_amt           like ih_trl2_amt initial 0.
define            variable ent_ord_bill        like ih_bill     no-undo.
define            variable ent_ord_ship        like ih_ship     no-undo.
define            variable ent_ord_nbr         like ih_nbr      no-undo.
define            variable ent_ord_line        like idh_line    no-undo.
define            variable ent_ord_line_part   like idh_part    no-undo.
define            variable ent_ord_line_uom    like idh_um      no-undo.
/* DOM variables needed for us/so/soivto10.i */
define            variable so-trl1-cd          like so_trl1_cd no-undo.
define            variable so-trl2-cd          like so_trl2_cd no-undo.
define            variable so-trl3-cd          like so_trl3_cd no-undo.
define            variable isConsolDom         as logical      no-undo.

define            variable l_conso             like mfc_logical no-undo.
define            variable l_tot_amt           as decimal no-undo.
define            variable l_tax_total_message as character extent 2
                                               format "x(13)" no-undo.
define            variable l_basetaxtot        like glt_amt no-undo.
define            variable is_fallback         as logical   no-undo.
define            variable l_gst_id            like cm_gst_id    no-undo.
define            variable l_last_shipdt       like ih_ship_date no-undo.
define            variable l_orig_taxdt        like ih_tax_date  no-undo.
/* InvoiceCerification 20110405 : Add a new variable that will hold the invoice-certificate text  that needs to be printed on the invoice for the Portugese decree-363 */
define variable vcInvoiceCertificationText as character no-undo.
define variable vcInvoiceYearVoucherNumber as character no-undo.
define variable lcovatreglbl               as character format "x(12)" no-undo.
define variable lcovatreg                  as character format "x(16)" no-undo.

define buffer abs_mst1     for abs_mstr.
define buffer ih_buff      for ih_hist.

define new shared temp-table t_absr_det                  no-undo
   field t_absr_id        like absr_id
   field t_absr_reference like absr_reference
   field t_absr_qty       as decimal format "->>>>,>>>,>>9.99"
   field t_absr_ext       as decimal format "->>>>,>>>,>>9.99"
   index t_absr_indx t_absr_id t_absr_reference.

for first txc_ctrl
   where txc_domain = global_domain
no-lock:
end.
{us/so/soeuinv.i}

assign l_tax_total_message[1] = getTermLabel("TOTAL_TAX",9)
                              + " "
                              + getTermLabel("IN",2)
       l_tax_total_message[2] = getTermLabel("TOTAL_TAX",9).


{us/so/sodiscwk.i &new="new"}

assign
   prepaid-lbl = getTermLabel("AMOUNT_PAID",11) + ":"
   call-lbl    = getTermLabel("CALL_NUMBER",14) + ": "
   c-cont      =  CAPS(dynamic-function ('getTermLabelFillCentered' in h-label,
                                  input "CONTINUED",
                                  input 35,
                                  input '*')).

/* SHARED WORKFILE FOR SUMMARY DISCOUNTS */
{us/et/etvar.i}
{us/et/etrpvar.i &new="new"}

{us/mf/mfivtrla.i  "NEW"}
{us/bbi/wbgp03.i &new="NEW SHARED"}

{us/px/pxpgmmgr.i}
{us/px/pxphdef.i pccalcxr}

assign
   l_nontaxable_lbl = getTermLabelRtColon("NON-TAXABLE", 12)
   l_taxable_lbl    = getTermLabelRtColon("TAXABLE", 12).

hdl_sum_disc_lbl = prnt_sum_disc_amt:handle in frame disc_sum_print.

/* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
assign
   nontax_old      = nontaxable_amt:format
   taxable_old     = taxable_amt:format
   line_tot_old    = line_total:format
   disc_old        = disc_amt:format
   trl_amt_old     = ih_trl1_amt:format
   tax_amt_old     = tax_amt:format
   container_old   = container_charge_total:format
   line_charge_old = line_charge_total:format
   ord_amt_old     = ord_amt:format.

form
   tot_prepaid_amt      colon 60
   tot_ptax_amt         colon 60
   tot_prepaid_nett     colon 60
   skip(1)
   amt_due_af_prep      colon 60
with frame ihprepd width 80
   side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame ihprepd:handle).

prepaid_old     = tot_prepaid_amt:format.
{us/bbi/gprun.i ""gpctryfmt.p"" "persistent set h_format"}

find first rmc_ctrl where rmc_domain = global_domain no-lock no-error.

find first soc_ctrl
   where soc_domain = global_domain
no-lock no-error.

/* Get statutory currency */
{us/px/pxrun.i &PROC  = 'getStatutoryCurrency'
   &PROGRAM='pccalcxr.p'
   &handle = ph_pccalcxr
   &PARAM = "(output g_mgmt_curr,
              output is_fallback)"
   &NOAPPERROR=true
   &CATCHERROR=true}

assign lcovatreglbl = covatreglbl
       lcovatreg    = covatreg.

mainloop:
do:
/*c1603* start deleted code >>>>>>>>
   for each ih_buff
      where ih_buff.ih_domain = global_domain
       and  (override_print_hist or ih_inv_mthd = ""
             or ih_inv_mthd begins " "
             or ih_inv_mthd begins "b"
             or ih_inv_mthd begins "p")
       and  (ih_inv_nbr >= inv and ih_inv_nbr <= inv1)
       and  ((ih_nbr >= dnbr and ih_nbr <= dnbr1)
        or   (ih_nbr >= nbr and ih_nbr <= nbr1))
       and  (ih_ship_date >= shipdate and ih_ship_date <= shipdate1)
       and  (ih_inv_date >= inv_date and ih_inv_date <= inv_date1)
       and  (ih_cust >= cust and ih_cust <= cust1)
       and  (ih_bill >= bill and ih_bill <= bill1)
       and  (ih_ship >= ship and ih_ship <= ship1)
       and  (ih_site >= site and ih_site <= site1)
       and  (ih_lang >= lang and ih_lang <= lang1)
       and  (ih_slspsn[1] >= sls-psn and ih_slspsn[1] <= sls-psn1)
       and  (ih_daybook >= daybook and ih_daybook <= daybook1)
       and  (ih_batch >= inv_batch and ih_batch <= inv_batch1)
   no-lock break by ih_inv_nbr:
**c1603* end   deleted code <<<<<<< */
/*c1603* start added code >>>>>> */
   for each ih_buff
      where ih_buff.ih_domain = global_domain
       and  (override_print_hist or ih_inv_mthd = ""
             or ih_inv_mthd begins " "
             or ih_inv_mthd begins "b"
             or ih_inv_mthd begins "p"
             or not ih_invoiced)
       and  (ih_inv_nbr >= inv and ih_inv_nbr <= inv1)
       and  ((ih_nbr >= nbr and ih_nbr <= nbr1))
       and   (ih_nbr >= nbr and ih_nbr <= nbr1)
       and  (ih_ship_date >= shipdate and ih_ship_date <= shipdate1)
       and  (ih_inv_date >= inv_date and ih_inv_date <= inv_date1)
       and  (ih_cust >= cust and ih_cust <= cust1)
       and  (ih_bill >= bill and ih_bill <= bill1)
       and  (ih_site >= site and ih_site <= site1)
       and  (ih_shipvia >= shipvia and ih_shipvia <= shipvia1)
       and  (ih_lang >= lang and ih_lang <= lang1)
       and  (ih_slspsn[1] >= sls-psn and ih_slspsn[1] <= sls-psn1)
       and  (ih_daybook >= daybook and ih_daybook <= daybook1)
       and  (ih_batch >= inv_batch and ih_batch <= inv_batch1)
       and can-find(first idh_hist
                    where idh_domain = global_domain
		    and   idh_inv_nbr = ih_inv_nbr
		    and   idh_qty_inv <> 0.0)
       use-index ih_nbr
   no-lock break by ih_inv_nbr:
/*c1603* end   added code <<<<<< */

/*cy1002c>>*/
      find first Debtor 
      where Debtor.DebtorCode = ih_cust 
      no-lock no-error.
      if lvunpriced then do:
	 if available Debtor and Debtor.CustomCombo6 <> "Unpriced" then next.
      end.
      if not outboth then do:
         if not outtype and available Debtor and Debtor.CustomLong1 <> "" then
	    next.
         if outtype and available Debtor and Debtor.CustomLong1 = "" then
	    next.
      end.
/*cy1002c<<*/

      if not reprint then
        if ih_invoiced then next.

      /* IS A DOM ORDER? */
      isDomOrder = false.
      {us/bbi/gprun.i ""sodomxr.p""
                "(input ih_nbr,
                  input 0,
                  input 'SO',
                  output ent_ord_nbr,
                  output ent_ord_line,
                  output ent_ord_bill,
                  output ent_ord_ship,
                  output ent_ord_line_part,
                  output ent_ord_line_uom)" }
      if ent_ord_nbr <> "" then
         isDomOrder = true.
      if dom-proc = 1 and      /* DOM ORDER ENTERED AND NO DOMAIN ORDERS */
         isDomOrder = false
      then next.
      /* Although it is intended to skip non-dom orders when only dom order */
      /* range is entered, the report should print all domain orders in the */
      /* range when domain order range is entered,regardless of their       */
      /* origin(DOM or MFG/PRO.)                                            */

      assign
         l_skip_rec         = no
         l_nontax_amt       = 0
         l_tax_amt          = 0
         isConsolDom        = false.

      /* MOVED THE CODE FOR GETTING THE ROUNDING METHOD FROM BELOW */
      /* AS IT IS REQUIRED BY THE PROCEDURE p-get-ord-amt          */
      {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
         "(input  ih_curr,
           output rndmthd,
           output mc-error-number)"}

      if mc-error-number <> 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
         next.
      end. /* IF mc-error-number <> 0 */

      /* EXCLUDE CREDIT/DEBIT INVOICE */
      if not incinv
         or not incmemo
      then do:

         /* OBTAIN TOTAL INVOICE VALUE */
         if first-of(ih_buff.ih_inv_nbr)
         then
            run p-get-ord-amt(input  ih_buff.ih_inv_nbr,
                              output ord_amt).

         {us/mf/mfrpchk.i &warn=false}

         /* SKIP THE DEBIT/CREDIT INVOICE */
         if (not incinv
             and ord_amt    >= 0)
            or (not incmemo
                and ord_amt  < 0)
         then
            l_skip_rec = yes.

      end. /* IF NOT incinv OR ... */

      if l_skip_rec
      then
         next.

      isDomOrder = false.
      {us/bbi/gprun.i ""sodomxr.p""
               "(input ih_nbr,
                 input 0,
                 input 'SO',
                 output ent_ord_nbr,
                 output ent_ord_line,
                 output ent_ord_bill,
                 output ent_ord_ship,
                 output ent_ord_line_part,
                 output ent_ord_line_uom)" }
      if ent_ord_nbr <> "" then
         isDomOrder = true.

      /* ASSIGN COMPANY VAT REG */
      assign covatreglbl = lcovatreglbl
             covatreg    = lcovatreg.

      /*CHECK IF SITE COMPANY ADDRESS HAS A STATE TAX ID */
      for first ad_mstr 
         where ad_domain = global_domain 
           and ad_addr   = ih_site 
      no-lock:
         if     ad_pst_id <> "":U 
            and ad_pst_id <> ? 
            and can-find (first ls_mstr 
                             where ls_domain = global_domain
                               and ls_addr   = ad_addr
                               and ls_type   = "company")
         then do:
            /* FIND VAT REG. NO & COUNTRY CODE */
            {us/gp/gpvtecrg.i}
         end.   /* IF     ad_pst_id */
      end.   /* FOR FIRST ad_mstr  */

      run removeEmptyStrings.

      /* InvoiceCerification 20110405 : Fill the new variable with the invoice-certificate text that needs to be printed on the invoice for the Portugese decree-363 ; this will be printed on the forms defined in soivhfrm.i */  
      /* This text needs to be printed in portugese regardless the language used for the other parts of the print and regardless the langauge of the user. It can thus be that the user is working in English, the print is requested in Dutch but even in this scenario this fixed text should be in Portugese */
      if ih__qadc05 <> "":U and 
         ih__qadc05 <> ?    and 
         num-entries(ih__qadc05,chr(4)) = 2
      then assign vcInvoiceCertificationText = trim(entry(2,ih__qadc05,chr(4))) + "-Processado por Programa Certificado n. ":U + trim(entry(1,ih__qadc05,chr(4))) + "/DGCI":U
                  vcInvoiceYearVoucherNumber = substring(ih_inv_nbr,1,4) + substring(ih_inv_nbr,6,length(ih_inv_nbr) - 14) + "/" + substring(ih_inv_nbr,length(ih_inv_nbr) - 8).     
      else assign vcInvoiceCertificationText = "":U
                  vcInvoiceYearVoucherNumber = ih_inv_nbr.

      /* form frame phead1 & phead1ent PAGE-TOP FRAME DEFINITION */
      {us/so/soivhfrm.i}

      run GetHeading.
      if isDomOrder then
         view frame phead1ent.
      else
         view frame phead1.
      first-invoice = if first-of(ih_inv_nbr) then yes else no.

      for first cil_mstr
         where cil_domain     = global_domain
         and   cil_cor_inv    = ih_inv_nbr
         and   cil_cor_so_nbr = ih_nbr
      no-lock:
      end. /* FOR FIRST cil_mstr */

      if available cil_mstr and not prt_cor then next.
      if first-invoice then page.
      if ih_fsm_type = "FSM-RO" then tax_tr_type = '16'.
      pages = page-number - 1.

      if (oldcurr <> ih_curr) or (oldcurr = "") then do:

         /* DETERMINE CURRENCY DISPLAY AMERICAN OR EUROPEAN */
         find rnd_mstr where rnd_rnd_mthd = rndmthd
         no-lock no-error.

         if not available rnd_mstr then do:
            /* ROUND METHOD RECORD NOT FOUND */
            {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=3}
            next.
         end. /* IF AVAIL rnd_mstr */

         {us/so/socurfmt.i}

         /* SET CURRENCY DEPENDENT FORMATS */
         prepaid_fmt = prepaid_old.

         {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output prepaid_fmt,
                                   input rndmthd)"}
         oldcurr = ih_curr.
      end.  /* IF (OLDCURR <> IH_CURR) */

      if first-invoice then
      do for ih_hist:
         assign
            tot_prepaid_amt = 0
            tot_ptax_amt    = 0
            l_gst_id        = ""
            l_last_shipdt   = ?.
         for each ih_hist
             where ih_hist.ih_domain  = global_domain
             and   ih_hist.ih_inv_nbr = ih_buff.ih_inv_nbr
         no-lock:
            if l_last_shipdt    = ? 
               or l_last_shipdt < ih_hist.ih_ship_date
            then
               l_last_shipdt = ih_hist.ih_ship_date.
         end. /* FOR EACH ih_hist */
         for each ih_hist
            where ih_hist.ih_domain = global_domain
              and ih_hist.ih_inv_nbr = ih_buff.ih_inv_nbr
         exclusive-lock break by ih_inv_nbr:
            first_line = yes.
            /* PRINT INVOICES, CREDITS, OR BOTH */

            if first-of(ih_inv_nbr) then do:
               /* INITIALIZE VARIABLES FOR INVOICE TOTALS.*/
               {us/so/soivtot2.i}
               clear frame ihtot.
               clear frame ihprepd.
            end. /* IF FIRST-OF ih_inv_nbr */

            assign
               ih_recno = recid(ih_hist)
               base_rpt = ih_curr.

            assign
               rmaso = no
               sacontract = no.

            /* RMASO INDICATES AN RMA INVOICE */
            if ih_fsm_type = "RMA" then
               rmaso = yes.

            /* SACONTRACT INDICATES A SERVICE CONTRACT INVOICE */
            if ih_fsm_type = "SC" then
               sacontract = yes.
            /* IF "PRINT NO CHARGE RECEIPTS" (rmc_prt_rtn) IS NO, */
            /* AND THE RMA INVOICE HAS ONLY ZERO PRICED RECEIPT   */
            /* LINES, THEN WE DON'T PRINT THE INVOICE.            */

            if available rmc_ctrl and
               not rmc_prt_rtn and
               rmaso
            then do:
               print_invoice = no.
               for each idh_hist
                  where idh_domain = global_domain
                    and idh_inv_nbr = ih_inv_nbr
                    and idh_qty_inv <> 0
               no-lock:

                  if idh_price <> 0 or
                     idh_rma_type <> "I"
                  then
                     print_invoice = yes.
               end. /* FOR EACH idh_hist */

               if print_invoice = no then
                  next.
            end.  /* IF AVAIL rmc_ctrl */

            {us/px/pxrun.i &PROC='getTermsDescription' &PROGRAM='adcrxr.p'
               &HANDLE=ph_adcrxr
               &PARAM="(input ih_cr_terms,
                        output termsdesc)"}

            find ad_mstr
               where ad_domain = global_domain
                and  ad_addr = ih_bill
            no-lock no-wait no-error.
            update billto = "".

            if available ad_mstr then do:

               /* Assign values to addr and format */
               {us/mf/mfadfmt.i}
/*cy1002e*/    {us/xf/xfaddr.i "billto"} /*eb3sp5*/

               for first cm_mstr where cm_domain = global_domain
                  and cm_addr   = ih_bill
               no-lock: end.

               /* Use bill-to country's format */
               run setFormatForCountryCode in h_format
                  (input cm_lang,
                   input ad_mstr.ad_ctry).

               assign
                  billto[1] = addr[1]
                  billto[2] = addr[2]
                  billto[3] = addr[3]
                  billto[4] = addr[4]
                  billto[5] = addr[5]
                  billto[6] = addr[6].

               hdr_po = getTermLabel("PURCHASE_ORDER",14) + ": " + ih_po.

               if addr[6] <> ""
                  and ih_po = ""
               then
                  billto[6] = addr[6].

            end. /* IF AVAIL ad_mstr */
            else do:
               for first usr_mstr
                  where usr_userid = global_userid
                  no-lock:
               end.
               /* Default to user's locale */
               run setFormatForCountryCode in h_format
                  (input global_user_lang,
                   input usr_ctry_code).
            end.

            for first cm_mstr 
               where cm_domain = global_domain
               and   cm_addr   = ih_cust
            no-lock:
            end. /* FOR FIRST cm_mstr */
            if available cm_mstr 
            then
               l_gst_id = cm_gst_id.
            else do:
               for first ad_mstr 
                  where ad_domain = global_domain
                  and   ad_addr   = ih_cust
               no-lock:
                  l_gst_id  = ad_gst_id.
               end. /* FOR FIRST ad_mstr */
            end. /* IF NOT AVAILABLE cm_mstr */

            find ad_mstr where ad_domain = global_domain
                and  ad_addr = ih_cust
            no-lock no-wait no-error.
            update soldto = "".

            if available ad_mstr then do:

               /* Assign values to addr and format */
               {us/mf/mfadfmt.i}
/*cy1002e*/    {us/xf/xfaddr.i "soldto"} /*eb3sp5*/

               assign
                  soldto[1] = addr[1]
                  soldto[2] = addr[2]
                  soldto[3] = addr[3]
                  soldto[4] = addr[4]
                  soldto[5] = addr[5]
                  soldto[6] = addr[6].

               find cm_mstr where cm_domain = global_domain
                    and cm_addr = ih_cust
               no-lock no-error.
               if available cm_mstr then
                  resale = cm_resale.
               else
                  resale = "".
            end. /* IF AVAIL ad_mstr */

            /* GET VAT REG NO AND COUNTRY CODE FOR SHIP-TO */
            find ad_mstr where ad_domain = global_domain
                and  ad_addr = ih_ship
            no-lock no-wait no-error.

            if available ad_mstr
            then do:

               vatreg1 = "".
               for first cm_mstr
                  where  cm_domain = global_domain
                  and    cm_addr   = ih_cust
               no-lock:
               end.
               if available cm_mstr
               then
                  vatreg1 = if  ih_cust <> ih_ship
                            then substring(ad_pst_id,1,15)
                            else substring(cm_pst_id,1,15).

               if ad_pst_id = "" then do:
                  find ad_mstr
                     where ad_domain = global_domain
                       and ad_addr = ih_bill
                  no-lock no-wait no-error.

                  if available ad_mstr then do:
                     {us/gp/gpvteprg.i}
                  end. /* IF AVAIL ad_mstr */

               end. /* IF ad_pst_id = "" */

               else do:
                  {us/gp/gpvteprg.i}
               end. /* ELSE ad_pst_id <> "" */

            end. /* IF AVAIL ad_mstr */

            /* FOR RMAs, CHECK FOR CALL NUMBER */
            hdr_call = "".

            if rmaso then
               hdr_call = call-lbl + ih_ca_nbr.

            /* Create/Update fiscal number cross-reference. It should be the */
            /* last action before the invoice being actually printed.        */
            if not available soc_ctrl then
               find first soc_ctrl where soc_ctrl.soc_domain = global_domain
               no-lock no-error.
            if available soc_ctrl and
               soc_use_fnbr and
               update_fnbr
            then do:
               {us/gp/gprunp.i "soldfnbr" "p" "createFiscalNbrXref"
                        "(input ih_buff.ih_inv_nbr,
                          input ih_buff.ih_nbr,
                          input fnbr_seq,
                          output l_error)"}
               if l_error then do:
                  next.
               end.
            end.

            if not isDomOrder then
            form
               header
               getTermLabelRtColon("SALES_ORDER",15) format "x(15)" to 15
               ih_nbr
               getTermLabelRtColon("SHIP_DATE",20) format "x(20)"   to 55
               l_last_shipdt
               getTermLabelRtColon("ORDER_DATE",15) format "x(15)" to 15
               ih_ord_date
               hdr_po            to 78 no-label
               getTermLabelRtColon("SALESPERSON(S)",15) format "x(15)" to 15
               ih_slspsn[1]
               ih_slspsn[2]
               getTermLabelRtColon("SHIP_TO",20) format "x(20)"     to 55
               ih_ship
               ih_slspsn[3]      at 17
               ih_slspsn[4]
               getTermLabelRtColon("SHIP_VIA",20) format "x(20)"    to 55
               ih_shipvia
               getTermLabelRtColon("CREDIT_TERMS",15) format "x(15)" to 15
               ih_cr_terms

               getTermLabelRtColon("BOL",10) format "x(10)"    to 55
               ih_bol
               " "               to 15
               termsdesc
               getTermLabelRtColon("FOB_POINT",15) format "x(15)"    to 55
               ih_fob
               getTermLabelRtColon("RESALE",15) format "x(15)" to 15
               resale
               hdr_call          to 64 no-label
               getTermLabelRtColon("REMARKS",15) format "x(15)" to 15
               ih_rmks
               getTermLabelRtColon("PAYMENT_REF",15) format "x(15)" to 15
               ih_pay_ref format "x(40)"
            with frame phead2 width 90.
            else
            form
               header
               getTermLabelRtColon("SALES_ORDER",15) format "x(15)" to 17
               ih_nbr
               getTermLabelRtColon("SHIP_DATE",20)   format "x(20)" to 57
               ih_ship_date
               getTermLabelRtColon("ORDER_DATE",15)  format "x(15)" to 17
               ih_ord_date
               hdr_po            to 80 no-label
               getTermLabelRtColon("ENTERPRISE_ORDER_NUMBER",17) format "x(17)" to 17
               ent_ord_nbr
               getTermLabelRtColon("SALESPERSON(S)",15) format "x(15)" to 17
               ih_slspsn[1]
               ih_slspsn[2]
               getTermLabelRtColon("SHIP-TO",20) format "x(20)"     to 57
               ih_ship
               ih_slspsn[3]      at 19
               ih_slspsn[4]
               getTermLabelRtColon("SHIP_VIA",20) format "x(20)"    to 57
               ih_shipvia
               getTermLabelRtColon("CREDIT_TERMS",15) format "x(15)" to 17
               ih_cr_terms
               getTermLabelRtColon("BOL",10) format "x(10)"    to 57
               ih_bol
               " "               to 17
               termsdesc
               getTermLabelRtColon("FOB_POINT",15) format "x(15)"    to 57
               ih_fob
               getTermLabelRtColon("RESALE",15) format "x(15)" to 17
               resale
               hdr_call          to 64 no-label
               getTermLabelRtColon("REMARKS",15) format "x(15)" to 17
               ih_rmks
            with frame phead2ent width 90.

            form
               l_gst_id colon 15 label "Tax ID"
            with frame phead3 side-labels width 90 no-box.

            /* SET EXTERNAL LABELS */
            setFrameLabels(frame phead3:handle).

            form header
               fill ("-",77)format "x(77)" skip space (31)
               c-cont
               skip(8)
            with frame continue page-bottom width 80.

            form
               vcCreditCardMsg[1] skip
               vcCreditCardMsg[2] skip
               vcCreditCardMsg[3]
            with frame soccmsg no-labels width 132.

            /* **NOTE: THE CUSTOMER HAS PROMISED TO PAY USING A CREDIT CARD */
            {us/bbi/pxmsg.i &MSGNUM=3867 &ERRORLEVEL=1 &MSGBUFFER=vcCreditCardMsg[1]}
            /* THE CARD USED AT ORDER TIME WILL BE PROCESSED FOR PAYMENT */
            {us/bbi/pxmsg.i &MSGNUM=3868 &ERRORLEVEL=1 &MSGBUFFER=vcCreditCardMsg[2]}
            /* CUSTOMER IS RESPONSIBLE FOR PAYMENT IF CREDIT CARD IS DENIED */
            {us/bbi/pxmsg.i &MSGNUM=3869 &ERRORLEVEL=1 &MSGBUFFER=vcCreditCardMsg[3]}

            /* PRINT LINE ITEMS */

            if first-of(ih_inv_nbr) then do:
               /* INITIALIZE VARIABLES FOR INVOICE TOTALS.*/
               {us/so/soivtot2.i}
               view frame continue.
               if not isDomOrder then
                  view frame phead2.
               else
                  view frame phead2ent.

               if available soc_ctrl
                  and soc_gst_pst
               then do:
                  display
                     l_gst_id
                  with frame phead3.
               end. /* IF AVAILABLE soc_ctrl ... */

               if ih_fsm_type = "SC" then do:

                  svremarks = getTermLabel("FOR_PERIOD",25)  + ": "
                            + string(ih_req_date,"99/99/99") + " "
                            + getTermLabel("TO",10)          + ": "
                            + string(ih_due_date,"99/99/99").
                  put svremarks at 15.

                  svremarks = getTermLabel("SERVICE_CONTRACT",30) + ": "
                            + ih_sa_nbr.
                  put svremarks at 15.
               end. /* IF ih_fsm_type = "SC" */

               run PrintHeaderComment(input ih_cmtindx,
                                      input vcPriHeadComment).
               put skip(1).
               /* IF THIS INVOICE IS FOR AN RMA WHICH REFERENCES */
               /* A CALL, PRINT HEADER COMMENTS FROM THAT CALL   */

               if rmaso then do:
                  /* NOTE: CA_CATEGORY = "0" FOR CALLS, AND  */
                  /*       "QUOTE" FOR CALL QUOTES.          */
                  find first ca_mstr
                     where ca_domain = global_domain
                      and  ca_nbr = ih_ca_nbr
                      and  ca_category = "0"
                  no-lock no-error.

                  if available ca_mstr then do:
                     put skip(1).
                     run PrintHeaderComment(input ca_cmtindx,
                                            input vcPriHeadComment).
                  end.  /* IF AVAIL ca_mstr */
                  else do:
                     find first chm_mstr
                        where chm_domain = global_domain
                         and  chm_nbr = ih_ca_nbr
                         and  chm_category = "0"
                     no-lock no-error.

                     if available chm_mstr then do:
                        put skip(1).
                        run PrintHeaderComment(input chm_cmtindx,
                                               input vcPriHeadComment).
                     end.  /* IF AVAIL chm_mstr */
                  end.  /* ELSE NOT AVAIL ca_mstr */
               end.  /* IF rmaso */

               if disc_det_key <> "1" then do:

                  run getTranslation(input disc_det_key,
                     output translation).

                  disc_prnt_label = translation.
               end.  /* IF  disc_det_key <> "1" */
               /* FOURTH AND FIFTH OUTPUT PARAMETERS ARE ADDED FOR
                  CALCULATING TAXABLE AND NON TAXABLE LINE AND CONTAINER
                  CHARGES */
               {us/bbi/gprun.i ""soivrp1a.p""
                        "(output invtot_container_amt,
                          output invtot_linecharge_amt,
                          input-output l_nontax_amt,
                          input-output l_tax_amt)"}

               assign
                  invtot_line_total = invtot_line_total +
                                      invtot_container_amt +
                                      invtot_linecharge_amt
                  invtot_ord_amt    = invtot_ord_amt +
                                      invtot_container_amt +
                                      invtot_linecharge_amt.
               if not isDomOrder then
                  hide frame phead2.
               else
                  hide frame phead2ent.

               hide frame phead3.
/*cy1102a*              hide frame continue. */
            end.  /* IF FIRST-OF ih_inv_nbr */

            /*Check if this is a credit card order*/
            {us/gp/gprunp.i "gpccpl" "p" "isCCOrder"
               "(input ih_nbr, output vlResult)"}
            /*If it is view credit card message frame*/
            if vlResult then
               display vcCreditCardMsg with frame soccmsg.

            if disc_sum_key <> "1" and
               disc_sum_key <> disc_det_key
            then do:
               run getTranslation(input disc_sum_key,
                                  output translation).

               disc_prnt_label = translation.

            end. /* IF disc_sum_key <> "1" */

            /* PRINT DISCOUNT SUMMARY, DELETE DISC WKFL RECORDS */
            {us/so/sopiprn2.i}
            assign
               tot_prepaid_amt = tot_prepaid_amt + ih_hist.ih_prepaid
               tot_ptax_amt    = tot_ptax_amt    + ih_hist.ih_prep_tax.
   
            /* TRAILER */
            /* (Only display trailer after all SOs for this invoice */
            /* have been printed.)                                  */

            if not last-of(ih_inv_nbr)
            then do:
               l_conso = yes.
               {us/bbi/gprun.i ""soihtrl2.p"" "(input l_conso)"}

               /* ACCUMULATE TRAILER TOTALS USING SOIVTOT9.I      */
               run p-acc-totals (buffer ih_hist,
                  input-output invtot_nontaxable_amt,
                  input-output invtot_taxable_amt,
                  input-output invtot_line_total,
                  input-output invtot_disc_amt,
                  input-output invtot_trl1_amt,
                  input-output invtot_trl2_amt,
                  input-output invtot_trl3_amt,
                  input-output invtot_tax_amt,
                  input-output invtot_ord_amt,
                  input-output invtot_container_amt,
                  input-output invtot_linecharge_amt) .

            end. /* IF NOT LAST-OF(IH_INV_NBR) */

            if update_invoice
               and ih_hist.ih_invoiced = false
            then do:
               ih_hist.ih_invoiced = true.
            end.

            if last-of(ih_inv_nbr) then do:

               undo_txdetrp = true.

               /* ADDED SIXTH INPUT PARAMETER '' AND SEVENTH INPUT     */
               /* PARAMETER yes TO ACCOMMODATE THE LOGIC INTRODUCED IN */
               /* txdetrpa.i FOR DISPLAYING THE APPROPRIATE CURRENCY   */
               /* AMOUNT.                                              */

               {us/bbi/gprun.i  ""txdetrp.p"" "(input tax_tr_type,
                                         input ih_inv_nbr,
                                         input '*',
                                         input col-80,
                                         input 10,
                                         input '',
                                         input yes)" }

               /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
               {us/bbi/gprun.i ""txtotal1.p"" "(input '16',
                                         input  ih_inv_nbr,
                                         input  '*',
                                         input  0,
                                         output l_tax_in)"}

               {us/bbi/gprun.i ""soihtrl2.p"" "(input l_conso)"}
               /* OBTAINING TOTAL TAX AMOUNT FOR THE INVOICE */
               {us/bbi/gprun.i  ""txtotal.p"" "(input '16',
                                         input ih_inv_nbr,
                                         input '*',
                                         input 0,
                                         output tax_amt)" }

               /* ADJUSTING TOTAL TAX AMOUNT BY INCLUDED TAX */
               assign
                  tax_amt = tax_amt + l_tax_in
                  ord_amt = ord_amt + tax_amt.

               if l_conso
               then 
                  assign
                     l_orig_taxdt = tax_date
                     tax_date     = l_last_shipdt.
               /* ACCUMULATE TRAILER TOTALS USING SOIVTOT9.I      */
               run p-acc-totals (buffer ih_hist,
                  input-output invtot_nontaxable_amt,
                  input-output invtot_taxable_amt,
                  input-output invtot_line_total,
                  input-output invtot_disc_amt,
                  input-output invtot_trl1_amt,
                  input-output invtot_trl2_amt,
                  input-output invtot_trl3_amt,
                  input-output invtot_tax_amt,
                  input-output invtot_ord_amt,
                  input-output invtot_container_amt,
                  input-output invtot_linecharge_amt) .

               if ih_curr <> base_curr 
                  and (isEUtransaction(ih_site, ih_cust) 
                       or isGBtransaction(ih_site, ih_ship))
               then do:
                  assign l_basetaxtot = 0.

                  for each tx2d_det where tx2d_domain = global_domain
                                      and tx2d_ref = ih_inv_nbr
                                      and tx2d_nbr = ih_nbr
                                      and tx2d_tr_type = tax_tr_type
                                      and tx2d_tax_code <> "00000000"
                  no-lock:
                     assign l_basetaxtot = l_basetaxtot + tx2d_tax_amt.
                  end.

                  {us/so/soivto11.i
                      &totaltaxbase=l_basetaxtot
                      &totaltax=invtot_tax_amt
                      &socurr=ih_curr
                      &eusite=ih_site
                      &eubill=ih_bill
                      &euship=ih_ship
                      &base_only=no
                      &linepos=38
                      &labelpos=23}
               end.

               if l_tax_in <> 0 and l_conso
               then do:
                  line_total = invtot_line_total.

                  {us/gp/gprunp.i "sopl" "p" "adjustDiscountAmount"
                     "(input        invtot_taxable_amt - l_tax_in,
                       input        invtot_nontaxable_amt,
                       input        invtot_trl1_amt,
                       input        invtot_trl2_amt,
                       input        invtot_trl3_amt,
                       input        invtot_line_total,
                       input-output disc_amt)"}
               end. /* IF l_tax_in <> 0 and ...*/

               assign
                  l_conso = no
                  l_tax_in = 0.

               if can-find(mfc_ctrl where mfc_domain = global_domain
                                      and mfc_module = "SO"
                                      and mfc_seq = 170)
               then do:
                  view frame continue.
                  {us/so/soivtotb.i}
                  hide frame continue.
               end.  /* FOUND mfc_ctrl RECORD */

               add-trl-length = if tot_prepaid_amt <> 0 then
                                   3
                                else 0.

               if page-size - line-counter < 12 + add-trl-length
               then do:
                  view frame continue.
                  page.
                  hide frame continue.
               end. /* IF page-size - line-counter < 12 */

               do while page-size - line-counter > 12 + add-trl-length:
                  put skip(1).
               end. /* DO WHILE page-size - line-counter > 12 */

               put msg skip.

               put fill("-",77) format "x(77)" skip.
               currdisp = ih_curr.

               /* DETERMINE IF THIS INVOICE IS A CONSOLIDATED INVOICE WHICH */
               /* WAS CONSOLIDATED FROM A DOM GLOBAL ORDER                  */
               if isDomOrder = true
               then do:
                  {us/bbi/gprun.i ""soivdom1.p""
                     "(input 'ih_hist',
                       input ih_inv_nbr,
                       output so-trl1-cd,
                       output so-trl2-cd,
                       output so-trl3-cd,
                       output isConsolDom)"}
               end.
 
               /* Calculate SC amount of total tax */
               tax_sc_amt = invtot_tax_amt.
               if ih_curr <> g_mgmt_curr then do:
                  {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                     "(input ih_curr,
                       input g_mgmt_curr,
                       input ih_mgmt_ex_rate,
                       input ih_mgmt_ex_rate2,
                       input tax_sc_amt,
                       input true,  /* ROUND */
                       output tax_sc_amt,
                       output mc-error-number)"}
                  if mc-error-number <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                  end.
               end.

               /* SET CURRENCY DEPENDENT FORMATS */
               assign
                  nontaxable_amt:format in frame ihtot         = nontax_fmt
                  taxable_amt:format in frame ihtot            = taxable_fmt
                  line_total:format in frame ihtot             = line_tot_fmt
                  disc_amt:format in frame ihtot               = disc_fmt
                  ih_trl1_amt:format in frame ihtot            = trl_amt_fmt
                  ih_trl2_amt:format in frame ihtot            = trl_amt_fmt
                  ih_trl3_amt:format in frame ihtot            = trl_amt_fmt
                  tax_amt:format in frame ihtot                = tax_amt_fmt
                  container_charge_total:format in frame ihtot = container_fmt
                  line_charge_total:format in frame ihtot      = line_charge_fmt
                  ord_amt:format in frame ihtot                = ord_amt_fmt
                  trl_amt:format in frame ihtot                = trl_amt_fmt.

               {us/so/soivto10.i}

               if l_orig_taxdt <> ?
               then 
                  tax_date = l_orig_taxdt.
               if tot_prepaid_amt <> 0
               then do:
                  price_fmt = "-zzzz,zzz,zz9.99".
                  {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output price_fmt,
                                            input rndmthd)"}

                  assign
                     tot_prepaid_amt:format in frame ihprepd  = price_fmt
                     tot_ptax_amt:format in frame ihprepd     = price_fmt
                     tot_prepaid_nett:format in frame ihprepd = price_fmt
                     amt_due_af_prep:format in frame ihprepd  = price_fmt
                     tot_prepaid_nett = tot_prepaid_amt + tot_ptax_amt
                     amt_due_af_prep  = invtot_ord_amt - tot_prepaid_nett.

                  display
                     tot_prepaid_amt
                     tot_ptax_amt
                     tot_prepaid_nett
                     amt_due_af_prep
                  with frame ihprepd.

               end. /* IF tot_prepaid_amt <> 0 */

            end. /* IF LAST-OF ih_inv_nbr */

         end.  /* FOR EACH ih_hist */
      end.  /* DO FOR ih_hist */
   end.  /* FOR EACH ih_buff */

end.  /* MAINLOOP */

run resetFormat in h_format.
delete procedure h_format no-error.


PROCEDURE p-get-ord-amt:
   /* THIS PROCEDURE IS DERIVED FROM SOIHTRL2.P AND  */
   /* OBTAINS THE TOTAL INVOICE VALUE                */

   define input  parameter p_inv_nbr as character no-undo.
   define output parameter l_ord_amt as decimal
                                     format "-zzzz,zzz,z99.99" no-undo.

   /* LOCAL VARIABLES */
   define variable l_ext_actual     like idh_price no-undo.
   define variable l_tmp_amt        as   decimal   no-undo.
   define variable mc-error-number  like msg_nbr   no-undo.

   define buffer ih_hist for ih_hist.

   assign
      line_total  = 0
      taxable_amt = 0.

   for each ih_hist
      where ih_domain = global_domain
       and  ih_inv_nbr = p_inv_nbr
   no-lock
   break by ih_inv_nbr:

      empty temp-table t_store_ext_actual no-error.

      assign
         line_total  = 0
         l_ord_contains_tax_in_lines = can-find (first idh_hist
                                          where idh_domain  = global_domain
                                          and   idh_inv_nbr = ih_inv_nbr
                                          and   idh_nbr     = ih_nbr
                                          and   idh_taxable
                                          and   idh_tax_in)
         taxable_amt = 0.

      /* sotrhstb.p CREATES TEMP-TABLE TO STORE tr_hist RECORDS AND RETRIEVE  */
      /* THE SAME IN soauthbl.p TO IMPROVE THE PERFORMANCE WHILE PRINTING     */
      /* AUTHORIZATION NUMBERS FOR SCHEDULE ORDERS.                           */

      if ((ih_sched = yes
           and can-find(first idh_hist
                           where idh_domain  = global_domain
                             and idh_inv_nbr = ih_inv_nbr
                             and idh_nbr     = ih_nbr
                             and idh__qadc06 = "yes"))
         or print_lotserials)
      and not can-find(first t_tr_hist1
                          where t_tr_nbr = ih_nbr)
      then do:

         {us/bbi/gprun.i ""sotrhstb.p""
            "(input ih_nbr,
              input ih_inv_nbr,
              input-output table t_tr_hist1)"}

      end. /* IF ih_sched ... */

      for each idh_hist
         where idh_domain  = global_domain
           and  idh_inv_nbr = ih_inv_nbr
           and  idh_nbr     = ih_nbr
      no-lock:

         l_ext_actual  =  idh_price * idh_qty_inv.

         /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output l_ext_actual,
              input        rndmthd,
              output       mc-error-number)" }
         if mc-error-number <> 0
         then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.

         /* CHECK AUTHORIZATION RECORDS FOR DIFFERENT EXT PRICE */
         if  idh_sched   = yes
         and idh__qadc06 = "yes"
         then do:

            auth_found = no.

            {us/bbi/gprun.i ""soauthbl.p""
                "(input table t_tr_hist1,
                  input idh_inv_nbr,
                  input idh__qadc06,
                  input idh_nbr,
                  input idh_line,
                  input idh_price,
                  input idh_site,
                  input l_ext_actual,
                  output auth_price,
                  output auth_found)"}

            l_ext_actual = auth_price.

         end. /*IF idh_sched */

        for first t_store_ext_actual
           where t_line = idh_line
        no-lock:
        end. /* FOR FIRST t_store_ext_actual ... */

         if not available t_store_ext_actual
         then do:
            create t_store_ext_actual.
            assign
               t_line       = idh_line
               t_ext_actual = l_ext_actual.
         end. /* IF NOT AVAILABLE t_store_ext_actual ... */

         if l_ord_contains_tax_in_lines = no
         then
            line_total = line_total + l_ext_actual.

         if idh_taxable
         then
            taxable_amt = taxable_amt + l_ext_actual.

      end. /* FOR EACH idh_hist */

      empty temp-table t_tr_hist1.

      if l_ord_contains_tax_in_lines = no
      then
         disc_amt = (- line_total * (ih_disc_pct / 100)).

      /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output disc_amt,
           input        rndmthd,
           output       mc-error-number)" }

      if mc-error-number <> 0
      then do:
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end.

      l_tmp_amt = taxable_amt * ih_disc_pct / 100.

      /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */

      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output l_tmp_amt,
           input        rndmthd,
           output       mc-error-number)" }
      if mc-error-number <> 0
      then do:
         /* ROUNDING METHOD DOES NOT EXIST */
         {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */

      taxable_amt = taxable_amt - l_tmp_amt.

      /* ALL PROCEDURES USED FOR CALCULATING VARIOUS TOTALS         */
      /* PERTAINING TO THE INVOICE ARE CLUBBED TOGETHER AND WOULD BE*/
      /* RUN ONLY ONCE WITHIN THE ih_hist loop, SO THAT THEY GET    */
      /* ADDED CORRECTLY TO l_ord_amt                               */

      if last-of(ih_inv_nbr)
      then do:

         /* OBTAIN INVOICE TOTAL TAX */
         {us/bbi/gprun.i ""txtotal.p""
            "(input  '16',
              input  ih_inv_nbr,
              input  '*',
              input  0,      /* ALL LINES */
              output tax_amt)"}

         /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
         {us/bbi/gprun.i ""txtotal1.p""
            "(input '16',
              input  ih_inv_nbr,
              input  '*',
              input  0,
              output l_tax_in)"}

         /* WHEN TAX DETAIL RECORDS ARE NOT AVAILABLE AND SO IS */
         /* TAXABLE THEN USE THE PROCEDURE TO CALCULATE ORDER   */
         /* TOTAL AND DISCOUNT                                  */

         /* WHEN TAX INCLUDED IS YES, ORDER DISCOUNT SHOULD BE */
         /* CALCULATED ON THE ORDER TOTAL AFTER REDUCING THE   */
         /* ORDER TOTAL BY THE INCLUDED TAX                    */
         if l_tax_in <> 0
            or (l_ord_contains_tax_in_lines
                and (not can-find (tx2d_det
                                   where tx2d_domain = global_domain
                                   and   tx2d_ref = ih_inv_nbr
                                   and   tx2d_nbr = ih_nbr)))
         then do:
            {us/gp/gprunp.i "sopl" "p" "calDiscAmountAfterSubtractingTax"
               "(input table  t_store_ext_actual,
                 input        rndmthd,
                 input        ih_disc_pct,
                 input        ih_inv_nbr,
                 input        ih_nbr,
                 input        tax_tr_type,
                 output       line_total,
                 output       disc_amt)"}

            /* DISCOUNT AMOUNT IS ADJUSTED TO AVOID ROUNDING ERROR */
            /* IN CALCULATION OF ORDER AMOUNT                      */
            {us/gp/gprunp.i "sopl" "p" "adjustDiscountAmount"
               "(input        taxable_amt - l_tax_in,
                 input        nontaxable_amt,
                 input        ih_trl1_amt,
                 input        ih_trl2_amt,
                 input        ih_trl3_amt,
                 input        line_total,
                 input-output disc_amt)"}

         end. /* IF l_tax_in <> 0 */

      end. /* IF LAST-OF(ih_inv_nbr) */

      /* JUST MOVED CODE FROM ABOVE AS THIS CALCULATION SHOULD BE */
      /* SALES ORDER WISE(ih_nbr) AND THEREFORE SHOULD BE RUN FOR */
      /* ALL ih_hist RECORDS                                      */
      {us/bbi/gprun.i ""txabsrb.p""
         "(input ih_inv_nbr,
           input ih_nbr,
           input '16',
           input-output line_total,
           input-output taxable_amt)"}

      /* ADJUSTING LINE TOTALS AND TAXABLE AMOUNT BY INCLUDED TAX */
      assign
         line_total       = line_total - l_tax_in
         tax_amt          = tax_amt + l_tax_in
         l_tax_in         = 0
         l_ord_amt        = l_ord_amt  + line_total + disc_amt + ih_trl1_amt
                          + ih_trl2_amt + ih_trl3_amt + tax_amt.

   end. /* FOR EACH ih_hist */

END PROCEDURE. /* PROCEDURE p-get-ord-amt */

PROCEDURE p-acc-totals:
   /* THIS PROCEDURE ACCUMULATES TRAILER TOTALS FOR GTM */

   define parameter buffer ih_hist       for  ih_hist.

   define input-output parameter invtot_nontaxable_amt as decimal no-undo.
   define input-output parameter invtot_taxable_amt    as decimal no-undo.
   define input-output parameter invtot_line_total     as decimal no-undo.
   define input-output parameter invtot_disc_amt       as decimal no-undo.
   define input-output parameter invtot_trl1_amt       like ih_trl1_amt no-undo.
   define input-output parameter invtot_trl2_amt       like ih_trl2_amt no-undo.
   define input-output parameter invtot_trl3_amt       like ih_trl3_amt no-undo.
   define input-output parameter invtot_tax_amt        as decimal no-undo.
   define input-output parameter invtot_ord_amt        as decimal no-undo.

   define input-output parameter invtot_container_amt  as decimal no-undo.
   define input-output parameter invtot_linecharge_amt as decimal no-undo.

   define variable tmpamt as decimal no-undo.
   define variable mc-error-number like msg_nbr no-undo.

   {us/so/soivtot9.i}
END PROCEDURE. /* PROCEDURE P-ACC-TOTALS */

PROCEDURE getTranslation:
/*---------------------------------------------------------------------------
Purpose: Get translation from language detail
Parameters: pKey1 - lngd_key1
pTranslation - output lngd_translation

Notes: Added by ECO N06R to prevent action segment compile error.
---------------------------------------------------------------------------*/.
   define input parameter pKey1 as character no-undo.
   define output parameter pTranslation as character no-undo.

   for first lngd_det where lngd_dataset begins "soprint" and
         lngd_field = "det_disc_prnt" and
         lngd_lang  = global_user_lang and
         lngd_key1  = pKey1
   no-lock:
      pTranslation = lngd_translation.
   end.

END PROCEDURE. /*GetTranslation*/

PROCEDURE removeEmptyStrings:
/*---------------------------------------------------------------------------
Purpose: Workaround for an issue with the Progress 10.1B client running
         with cpinternal to set utf-8.  The problem is that any field
         with an empty string in it "" will cause a form/frame defined as
         a "header" to lose data. The following code sets empty strings
         to single spaces in the fields that are in frames phead1 and
         phead1ent in us/so/soivhfrm.i.
---------------------------------------------------------------------------*/.
   define variable j as integer no-undo.
   do j = 1 to 6:
      if company[j] = "" then
         company[j] = " ".
      if billto[j] = "" then
         billto[j] = " ".
   end.

   if covatreglbl = "" then
      covatreglbl = " ".

   if covatreg = "" then
      covatreg = " ".

   if vatreglbl = "" then
      vatreglbl = " ".

   if vatreg = "" then
      vatreg = " ".

END PROCEDURE. /*removeEmptyStrings*/

/* procedures of print settings */
{us/so/soprprc1.i}
