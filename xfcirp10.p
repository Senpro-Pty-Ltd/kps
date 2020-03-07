/* xfcirp10.p - SALES ORDER INVOICE PRINT FOR CORRECTION SALES ORDERS         */
/* socirp10.p - SALES ORDER INVOICE PRINT FOR CORRECTION SALES ORDERS         */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfcirp10.p,v 1.2 2018/03/13 17:09:34 gbg Exp $: */
/* Revision: 1.2        BY: Ed van de Gevel      DATE: 03/01/05  ECO: *R00G*  */
/* Revision: 1.5        BY: Ed van de Gevel      DATE: 03/16/05  ECO: *R00H*  */
/* Revision: 1.6        BY: Ed van de Gevel      DATE: 07/01/05  ECO: *R01H*  */
/* Revision: 1.7        BY: Ed van de Gevel      DATE: 08/16/05  ECO: *P3Y1*  */
/* Revision: 1.8        BY: Katie Hilbert        DATE: 06/08/06  ECO: *Q0LK*  */
/* Revision: 1.9        BY: Katie Hilbert        DATE: 08/06/07  ECO: *R0C6*  */
/* Revision: 1.10       BY: Deepak Taneja        DATE: 01/29/08  ECO: *R0KN*  */
/* Revision: 1.11       BY: Jean Miller          DATE: 02/14/08  ECO: *P64X*  */
/* Revision: 1.13       BY: Juncheng Cui         DATE: 09/16/08  ECO: *R13S*  */
/* Revision: 1.15       BY: Jean Miller          DATE: 10/07/08  ECO: *R15M*  */
/* Revision: 1.16       BY: Yizhou Mao           DATE: 02/11/09  ECO: *R1BY*  */
/* Revision: 1.17       BY: Sundeep Kalla        DATE: 05/27/09  ECO: *R1K4*  */
/* Revision: 1.18       BY: Xiaolei Meng         DATE: 08/02/09  ECO: *R1N2*  */
/* Revision: 1.24       BY: Jean Miller          DATE: 08/31/09  ECO: *R1QP*  */
/* Revision: 1.27       BY: Mukesh Singh         DATE: 10/29/09  ECO: *Q3L4*  */
/* Revision: 1.28       BY: Jean Miller          DATE: 11/23/09  ECO: *R1TW*  */
/* $Revision: 1.2 $    BY: Rinku Keswani          DATE: 05/27/10  ECO: *R20R*  */

/* Revision: QAD2016    BY: sxh      DATE: 13/01/16  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
 
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
{us/px/pxphdef.i pashphxr}
 
{us/pa/pashphtb.i} /* tt_item_serial temp table */
 
{us/xf/xfso10u.i} /*grc338*/
{us/xf/xfso10v.i} /*grc338*/
{us/xf/xfdefa.i}  /*grc338*/
define            variable xab              as   character format "x(70)" .
define            variable prevxab          like xab.
define workfile shipper field shipper_sonbr like sod_nbr.
define new shared variable shipper_id       like abs_id       no-undo.
define new shared variable shipper_date     like abs_shp_date no-undo.
define new shared variable abs_recno        as   recid.
 
define     shared variable prt_cor          like mfc_logical  initial no.
define            variable vat_amount_old   as   character    no-undo.
define            variable vat_amount_fmt   as   character    no-undo.
define     shared variable rndmthd          like rnd_rnd_mthd.
define     shared variable oldcurr          like ih_curr.
define new shared variable undo_txdetrp     like mfc_logical.
define     shared variable due_date         like idh_due_date.
define     shared variable due_date1        like idh_due_date.
define     shared variable inv              like idh_inv_nbr.
define     shared variable inv1             like idh_inv_nbr.
define     shared variable nbr              like ih_nbr.
define     shared variable nbr1             like ih_nbr.
define     shared variable site             like ih_site.
define     shared variable site1            like ih_site.
define     shared variable reprint          like mfc_logical.
define     shared variable update_invoice   like mfc_logical.
define     shared variable print_lotserials like mfc_logical initial no.
define            variable pages            as   integer.
define     shared variable comp_addr        like soc_company.
define     shared variable msg              like msg_desc initial "             * * * D U P L I C A T E * * *".
define     shared variable inv_date         like ih_inv_date.
define     shared variable inv_date1        like ih_inv_date.
define     shared variable ih_recno         as recid.
define     shared variable company          as character format "x(38)" extent 6.
define            variable billto           as character format "x(38)" extent 6.
define     shared variable soldto           as character format "x(38)" extent 6.
define     shared variable termsdesc        as character format "x(40)" label "Description" no-undo.
define     shared variable shipdate         like ih_ship_date.
define     shared variable shipdate1        like shipdate.
define     shared variable addr             as character format "x(38)" extent 6.
define     shared variable print_options    like mfc_logical initial no.
define     shared variable tot_trl1         like ih_trl1_amt.
define     shared variable tot_trl2         like ih_trl2_amt.
define     shared variable tot_trl3         like ih_trl3_amt.
define     shared variable base_rpt         as character.
define     shared variable tot_disc         like ih_trl1_amt.
define     shared variable rpt_tot_tax      like ih_trl1_amt.
define     shared variable tot_ord_amt      like ih_trl1_amt.
define     shared variable override_print_hist like mfc_logical.
 
/* Shared variables for print settings */
{us/so/soprsets.i}
 
define            variable hdr_po           as character format "X(38)".
define     shared variable cust             like ih_cust.
define     shared variable cust1            like ih_cust.
define     shared variable bill             like ih_bill.
define     shared variable bill1            like ih_bill.
define     shared variable ship            like so_ship.
define     shared variable ship1           like so_ship.
define            variable ihrecno          as recid.
 
define variable ent_ord_bill        like ih_bill     no-undo.
define variable ent_ord_ship        like ih_ship     no-undo.
define variable ent_ord_nbr         like ih_nbr      no-undo.
define variable ent_ord_line        like idh_line    no-undo.
define variable ent_ord_line_part   like idh_part    no-undo.
define variable ent_ord_line_uom    like idh_um      no-undo.
 
define variable l_basetaxtot like glt_amt no-undo.
define variable l_basesubtot like glt_amt no-undo.
 
define variable vl_corrinfo  as logical initial no no-undo.
 
/* For fiscal number */
define     shared variable update_fnbr      like mfc_logical no-undo.
define     shared variable fnbr_seq         like nr_seqid    no-undo.
define            variable l_error          like mfc_logical no-undo.
 
define new shared frame sotot.
{us/et/etvar.i}
{us/et/etrpvar.i &new="new"}
/*grc338 {us/et/etsotrla.i "NEW"} */
{us/xf/xfsotrla.i "NEW"} /*grc338*/

define new shared frame d.
define new shared variable qty_bo  like sod_qty_ord format "->>>>>>9.9<<<<".
define new shared variable ext_price like sod_price
                  label "Ext Price" format "->>>>,>>>,>>9.99".
 
{us/so/soivhfm2.i}
{us/so/socirp05.i}
 
define variable extprice_old     as   character   no-undo.
define variable extprice_fmt     as   character   no-undo.
define variable net_price_old    as   character   no-undo.
define variable net_price_fmt    as   character   no-undo.
define variable article          like pt_article  no-undo.
define variable desc1            like pt_desc1    no-undo.
define variable desc2            like pt_desc2    no-undo.
define variable qty_inv          like sod_qty_inv no-undo.
define variable sonbr            like so_nbr      no-undo.
define variable soline           like sod_line    no-undo.
define variable sopart           like sod_part    no-undo.
define variable lot-lbl          as   character   no-undo format "x(56)"
                                 initial "Lot/Serial Numbers Shipped:    Qty   Expire    Reference".
define variable lotserial_total  like tr_qty_chg  no-undo.
define variable hdl_disc_lbl     as   handle      no-undo.
define variable hdl_sum_disc_lbl as   handle      no-undo.
define variable comp_name        as   character   no-undo format "x(36)".
define variable org_user_desc    like trl_desc     extent  3.
define variable org_vttax        like vt_tax       extent  3.
define variable dif_vatamount    like sod_std_cost extent  3.
define variable org_vatamount    like sod_std_cost extent  3.
define variable dif_netprice     like sod_std_cost extent  3.
define variable org_netprice     like sod_std_cost extent  3.
define variable cor_trl_amt      like sod_std_cost extent  3.
define variable cor_vatamount    like sod_std_cost extent  3.
define variable cor_netprice     like sod_std_cost extent  3.
define variable org_disc_amt     like sod_std_cost no-undo.
define variable cor_disc_amt     like sod_std_cost no-undo.
define variable dif_disc_amt     like sod_std_cost no-undo.
 
define variable in_words         as   character    no-undo format "x(100)".
define variable old_inv_nbr      like ih_inv_nbr    no-undo.
define variable ihtrlamt         like ih_trl1_amt   no-undo extent 3.
define variable sotrlamt         like so_trl1_amt   no-undo extent 3.
define variable invnbr           like ih_inv_nbr    no-undo.
define variable invdate          like ih_inv_date   no-undo.
define variable ihnbr            like ih_nbr        no-undo.
define variable first-invoice    like mfc_logical   no-undo.
define variable mixed_rpt like mfc_logical no-undo initial yes.
define variable po-lbl           as   character    format "x(8)" initial "Purchase Order: ".
 
{us/so/sodiscwk.i &new="NEW"}
{us/so/soivtot1.i "NEW"}
 
define shared variable incinv  like mfc_logical initial yes.
define shared variable incmemo like mfc_logical initial yes.
define new shared variable disc_prnt_label as character format "x(8)".
 
define variable tax-tran-type   as  character no-undo.
define variable l_consolidate   as  logical initial no no-undo.
define variable l_msg_text      as character no-undo.
define variable first_invoice   like mfc_logical no-undo.
define variable trl_length      as integer initial 17.
define variable col-80          like mfc_logical initial false.
 
define buffer ih_buff for ih_hist.
 
define variable vat_manual like vat_amount no-undo.
define variable total_vat  like vat_amount no-undo.
define variable total_org  like vat_amount no-undo.
 
define variable disp_char8_1   as character format "x(10)".
define variable disp_char8_2   as character format "x(10)".
define variable disp_char8_3   as character format "x(10)".
define variable disp_char8_4   as character format "x(10)".
define variable disp_char9_1   as character format "x(70)".
define variable disp_char9_2   as character format "x(70)".
define variable disp_char9_3   as character format "x(70)".
define variable disp_char9_4   as character format "x(70)".
define variable disp_char10_1  as character format "x(70)".
define variable disp_char10_2  as character format "x(70)".
define variable disp_char10_3  as character format "x(70)".
define variable disp_char10_4  as character format "x(70)".
define variable disc-lbl       as character format "x(10)".
define variable lcovatreglbl   as character format "x(12)" no-undo.
define variable lcovatreg      as character format "x(16)" no-undo.
 
{us/so/soeuinv.i}
 
/* InvoiceCerification 20110405 : Add a new variable that will hold the invoice-certificate text that needs to be printed on the correction-invoice for the Portugese decree-363 */
Define variable vcInvoiceCertificationText as character no-undo.
 
for first txc_ctrl  where txc_domain = global_domain no-lock:
end.
 
assign
   cont_lbl = "***" + getTermLabel("CONTNUE",4) + "***"
   lot-lbl  = getTermLabelRt("LOT/SERIAL_NUMBER",18) + " " +
              getTermLabelRtColon("SHIPPED",8) + "    " +
              getTermLabelRt("QUANTITY",3) + "   " + getTermLabelRt("EXPIRE",6) + "    " +
              getTermLabelRt("REFERENCE",9)
   po-lbl   = getTermLabelRtColon("PURCHASE_ORDER",15)
   msg      = "             * * * " + trim(getTermLabel("D_U_P_L_I_C_A_T_E",35)) + " * * *"
   disc-lbl = getTermLabelRt("DISCOUNT",10).
 
form header
   fill("-",129)   format "x(129)" skip
   space(55)
   ("*** " + trim(getTermLabel("CONTINUED",35)) + " ***") format "x(70)" skip(8)
with frame continue page-bottom width 132.
assign
   disp_char8_1  = getTermLabelRt("ORIGINAL",10)
   disp_char8_2  = getTermLabelRt("ORIGINAL",10)
   disp_char8_3  = getTermLabelRt("ORIGINAL",10)
   disp_char8_4  = getTermLabelRt("ORIGINAL",10)
   disp_char9_1  = getTermLabelRt("CORRECTION",70)
   disp_char9_2  = getTermLabelRt("CORRECTION",70)
   disp_char9_3  = getTermLabelRt("CORRECTION",70)
   disp_char9_4  = getTermLabelRt("CORRECTION",70)
   disp_char10_1 = getTermLabelRt("CORRECTED",70)
   disp_char10_2 = getTermLabelRt("CORRECTED",70)
   disp_char10_3 = getTermLabelRt("CORRECTED",70)
   disp_char10_4 = getTermLabelRt("CORRECTED",70).
 
form
   ih_buff.ih_disc_pct no-label to 49
   disc-lbl                  to 59
   disp_char8_4 no-label     to 70
   ":"                       at 72
   org_disc_amt              at 74
   disp_char10_4 no-label    to 70
   ":"                       at 72
   dif_disc_amt              at 74
   disp_char9_4 no-label     to 70
   ":"                       at 72
   cor_disc_amt              at 74
   org_user_desc[1]          to 54
   ih_buff.ih_trl1_cd        to 59 format "x(2)"
   disp_char8_1 no-label     to 70
   ":"                       at 72
   ihtrlamt[1]               at 74
   org_vttax[1]              to 98
   org_vatamount[1]          to 114
   org_netprice[1]           to 129 skip
   disp_char10_1 no-label    to 70
   ":"                       at 72
   cor_trl_amt[1]            at 74
   cor_vatamount[1]          to 114
   cor_netprice[1]           to 129 skip
   disp_char9_1 no-label     to 70
   ":"                       at 72
   sotrlamt[1]               at 74
   dif_vatamount[1]          to 114
   dif_netprice[1]           to 129
   org_user_desc[2]          to 54
   ih_buff.ih_trl2_cd        to 59 format "x(2)"
   disp_char8_2 no-label     to 70
   ":"                       at 72
   ihtrlamt[2]               at 74
   org_vttax[2]              to 98
   org_vatamount[2]          to 114
   org_netprice[2]           to 129
   disp_char10_2 no-label    to 70
   ":"                       at 72
   cor_trl_amt[2]            at 74
   cor_vatamount[2]          to 114
   cor_netprice[2]           to 129
   disp_char9_2 no-label     to 70
   ":"                       at 72
   sotrlamt[2]               at 74
   dif_vatamount[2]          to 114
   dif_netprice[2]           to 129
   org_user_desc[3]          to 54
   ih_buff.ih_trl3_cd        to 59 format "x(2)"
   disp_char8_3 no-label     to 70
   ":"                       at 72
   ihtrlamt[3]               at 74
   org_vttax[3]              to 98
   org_vatamount[3]          to 114
   org_netprice[3]           to 129
   disp_char10_3 no-label    to 70
   ":"                       at 72
   cor_trl_amt[3]            at 74
   cor_vatamount[3]          to 114
   cor_netprice[3]           to 129
   disp_char9_3 no-label     to 70
   ":"                       at 72
   sotrlamt[3]               at 74
   dif_vatamount[3]          to 114
   dif_netprice[3]           to 129
with frame invtrl width 132 no-labels.
 
assign
   hdl_disc_lbl     = prnt_disc_amt:handle in frame disc_print
   hdl_sum_disc_lbl = prnt_sum_disc_amt:handle in frame disc_sum_print.
{us/so/socifrm.i}
 
/* ASSIGN ORIGINAL FORMAT TO _OLD VARIABLES */
/*grc338 comment begin
assign
   nontax_old     = nontaxable_amt:format
   taxable_old    = taxable_amt:format
   line_tot_old   = line_total:format
   disc_old       = disc_amt:format
   trl_amt_old    = so_trl1_amt:format
   tax_amt_old    = tax_amt:format
   ord_amt_old    = ord_amt:format
   extprice_old   = extprice:format
   net_price_old  = net_price:format
   vat_amount_old = vat_amount:format.
grc338 comment end*/
 
find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.
 
/* DEFINE VARIABLES FOR DISPLAY OF VAT REG NO & COUNTRY CODE */
{us/gp/gpvtecdf.i &var="shared"}
{us/gp/gpvtepdf.i &var=" "}
 
assign
   maint       = no
   pages       = 0
   old_inv_nbr = ?.
 
if msg <> ""     then trl_length = trl_length + 1.
if nbr1 = ""     then nbr1 = hi_char.
if inv1 = ""     then inv1 = hi_char.
if shipdate = ?  then shipdate = low_date.
if shipdate1 = ? then shipdate1 = hi_date.
if inv_date = ?  then inv_date = low_date.
if inv_date1 = ? then inv_date1 = hi_date.
if site1 = ""    then site1 = hi_char.
if cust1 = ""    then cust1 = hi_char.
if bill1 = ""    then bill1 = hi_char.
if ship1 = ""    then ship1 = hi_char.
 
assign lcovatreglbl = covatreglbl
       lcovatreg    = covatreg.
 
mainloop:
do:
   for each ih_buff where ih_buff.ih_domain = global_domain
      and ((override_print_hist or ih_inv_mthd = ""
           or ih_inv_mthd begins " "
           or ih_inv_mthd begins "b"
           or ih_inv_mthd begins "p")
         and (ih_inv_nbr >= inv and ih_inv_nbr <= inv1)
         and (ih_nbr >= nbr and ih_nbr <= nbr1)
         and (ih_ship_date >= shipdate and ih_ship_date <= shipdate1)
         and (ih_inv_date >= inv_date and ih_inv_date <= inv_date1)
         and (ih_cust >= cust and ih_cust <= cust1)
         and (ih_bill >= bill and ih_bill <= bill1)
         and (ih_ship >= ship and ih_ship <= ship1)
         and (ih_site >= site and ih_site <= site1))
   no-lock break by ih_inv_nbr with width 132:
		
      if not reprint then
         if ih_invoiced
		 then next.
		
	 if  update_invoice
	 and ih_buff.ih_invoiced = false
     then do:
			
	    run ip_ih_invoiced (input ih_buff.ih_nbr,
   						    input ih_buff.ih_inv_nbr) .
	 end. /*IF update_invoice*/
		
      sonbr = ih_buff.ih_nbr.
 
      first-invoice = if first-of(ih_inv_nbr) then yes else no.
 
      find first cil_mstr where cil_mstr.cil_domain = global_domain
           and cil_cor_so_nbr = ih_nbr
      no-lock no-error.
      if not available cil_mstr then next.
 
      if first-invoice then page.
 
      for each shipper exclusive-lock:
         delete shipper.
      end.
 
      create shipper.
      assign
         shipper.shipper_sonbr = cil_cor_so_nbr.
 
      if (oldcurr <> ih_curr) or (oldcurr = "") then do:
 
         {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
            "(input  ih_curr,
              output rndmthd,
              output mc-error-number)"}
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
            next.
         end.
 
         /* DETERMINE CURRENCY DISPLAY AMERICAN OR EUROPEAN */
         find rnd_mstr where rnd_rnd_mthd = rndmthd no-lock no-error.
 
         if not available rnd_mstr then do:
            /* ROUND METHOD RECORD NOT FOUND */
            {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=3}
            next.
         end. /* IF AVAIL rnd_mstr */
 
         extprice_fmt = extprice_old.
         if recid(shipper) = -1 then.
         {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output extprice_fmt,
              input rndmthd)"}
         net_price_fmt = net_price_old.
         {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output net_price_fmt,
              input rndmthd)"}
 
         vat_amount_fmt = vat_amount_old.
         {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output vat_amount_fmt,
              input rndmthd)"}
 
         {us/so/socurfmt.i}
 
         assign
            org_disc_amt:format     = disc_fmt
            dif_disc_amt:format     = disc_fmt
            cor_disc_amt:format     = disc_fmt
            ihtrlamt[1]:format      = trl_amt_fmt
            ihtrlamt[2]:format      = trl_amt_fmt
            ihtrlamt[3]:format      = trl_amt_fmt
            sotrlamt[1]:format      = trl_amt_fmt
            sotrlamt[2]:format      = trl_amt_fmt
            sotrlamt[3]:format      = trl_amt_fmt
            cor_trl_amt[1]:format   = trl_amt_fmt
            dif_vatamount[1]:format = vat_amount_fmt
            org_vatamount[1]:format = vat_amount_fmt
            cor_vatamount[1]:format = vat_amount_fmt
            dif_netprice[1]:format  = net_price_fmt
            org_netprice[1]:format  = net_price_fmt
            cor_netprice[1]:format  = net_price_fmt
            cor_trl_amt[2]:format   = trl_amt_fmt
            dif_vatamount[2]:format = vat_amount_fmt
            org_vatamount[2]:format = vat_amount_fmt
            cor_vatamount[2]:format = vat_amount_fmt
            dif_netprice[2]:format  = net_price_fmt
            org_netprice[2]:format  = net_price_fmt
            cor_netprice[2]:format  = net_price_fmt
            cor_trl_amt[3]:format   = trl_amt_fmt
            dif_vatamount[3]:format = vat_amount_fmt
            org_vatamount[3]:format = vat_amount_fmt
            cor_vatamount[3]:format = vat_amount_fmt
            dif_netprice[3]:format  = net_price_fmt
            org_netprice[3]:format  = net_price_fmt
            cor_netprice[3]:format  = net_price_fmt.
 
         assign
            extprice:format in frame orginfo    = extprice_fmt
            vat_amount:format in frame orginfo  = vat_amount_fmt
            net_price:format in frame orginfo   = net_price_fmt
            extprice:format in frame   newinfo  = extprice_fmt
            vat_amount:format in frame newinfo  = vat_amount_fmt
            net_price:format in frame  newinfo  = net_price_fmt
            extprice:format in frame   corrinfo = extprice_fmt
            vat_amount:format in frame corrinfo = vat_amount_fmt
            net_price:format in frame  corrinfo = net_price_fmt.
 
         oldcurr = ih_curr.
      end.
      tax-tran-type = "13".
 
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
 
      find ad_mstr where ad_mstr.ad_domain = global_domain
          and  ad_addr = ih_bill
      no-lock no-wait no-error.
 
      update billto = "".
 
      if available ad_mstr then do:
 
         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
 
         assign
            billto[1] = addr[1]
            billto[2] = addr[2]
            billto[3] = addr[3]
            billto[4] = addr[4]
            billto[5] = addr[5]
            billto[6] = addr[6]
            hdr_po    = getTermLabel("PURCHASE_ORDER",14) + ": " + ih_po.
      end.
 
      /* GET VAT REG NO AND COUNTRY CODE FOR SHIP-TO */
      find ad_mstr where ad_mstr.ad_domain = global_domain
          and ad_addr = ih_ship
      no-lock no-wait no-error.
 
      if available ad_mstr
      then do:
         vatreg1 = "".
         for first cm_mstr
           where cm_domain = global_domain
           and   cm_addr   = ih_cust
         no-lock:
         end.
         if available cm_mstr
         then
           vatreg1 = if  ih_cust <> ih_ship
                     then substring(ad_pst_id,1,15)
                     else substring(cm_pst_id,1,15).
 
         if ad_pst_id = "" then
            find ad_mstr where ad_mstr.ad_domain = global_domain
                and  ad_addr = ih_bill
            no-lock no-wait no-error.
         if available ad_mstr then do:
            {us/gp/gpvteprg.i}
         end.
      end.
 
      assign comp_name = company[1].
 
      /* FIND THE SO BEING CORRECTED IN IH_HIST BUFFER */
      do for ih_hist:
 
         assign
            ihnbr    = ""
            invnbr   = ""
            invdate  = ?
            ihtrlamt = 0.
 
         find first ih_hist where ih_hist.ih_domain = global_domain
              and ih_hist.ih_inv_nbr = cil_prev_inv
              and ih_hist.ih_nbr     = cil_prev_so_nbr
         no-lock no-error.
 
         if available ih_hist then
            assign
               invnbr      = ih_hist.ih_inv_nbr
               invdate     = ih_hist.ih_inv_date
               ihnbr       = ih_hist.ih_nbr
               ihtrlamt[1] = ih_hist.ih_trl1_amt
               ihtrlamt[2] = ih_hist.ih_trl2_amt
               ihtrlamt[3] = ih_hist.ih_trl3_amt
               ihrecno     = recid(ih_hist).
      end.
 
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
 
      /* InvoiceCerification 20110405 : Fill the new variable with the invoice-certificate text that needs to be printed on the invoice for the Portugese decree-363 ; this will be printed on the forms defined in soivhfrm.i */  
      /* This text needs to be printed in portugese regardless the language used for the other parts of the print and regardless the langauge of the user. It can thus be that the user is working in English, the print is requested in Dutch but even in this scenario this fixed text should be in Portugese */
      if ih__qadc05 <> "":U and 
         ih__qadc05 <> ?    and 
         num-entries(ih__qadc05,chr(4)) = 2
      then assign vcInvoiceCertificationText = trim(entry(2,ih__qadc05,chr(4))) + "-Processado por Programa Certificado n. ":U + trim(entry(1,ih__qadc05,chr(4))) + "/DGCI":U.
      else assign vcInvoiceCertificationText = "":U.
 
 
      form header
         skip(2)
         (getTermLabel("CORRECTION_INVOICE_NUMBER",30) + ": " +
         ih_inv_nbr) format "x(55)" at 41
 
         /* InvoiceCerification 20110405 : Add a new field to the form holding the invoice-certification text that is required for the Portugese Decree363 */
         vcInvoiceCertificationText to 76 format "x(56)"
 
         (getTermLabel("CORRECTION_TO_VAT_INVOICE_NUMBER",30) + ": "
            + invnbr) format "x(55)" at 4
         (trim(getTermLabel("COMPANY",30)) + ": " + comp_name) format "x(70)" at 60
         (trim(getTermLabel("INVOICE_DATE",35)) + ": " + string(invdate)) format "x(45)" at 4
         (trim(getTermLabel("DATE",35)) + ": " + string(today)) format "x(70)" at 60
         skip(1)
         (trim(getTermLabel("COMPANY",15)) + ": " + company[1]) format "x(55)" at 4
         (trim(getTermLabel("CUSTOMER_CODE",35)) + ": " + ih_bill) format "x(70)" at 60
         company[2]     at 4
         billto[1]      at 60
         company[3]     at 4
         billto[2]      at 60
         company[4]     at 4
         billto[3]      at 60
         company[5]     at 4
         billto[4]      at 60
         company[6]     at 4
         billto[5]      at 60
         hdr_po         at 4
         billto[6]      at 60
         covatreglbl to 15
         covatreg
         vatreglbl   to 55
         vatreg
         (trim(getTermLabel("PAYMENT_REF",15)) + ": " + ih_pay_ref) format "x(40)" at 4 
         skip
      with frame phead page-top width 132.
 
      view frame phead.
 
      /* INITIALIZE VARIABLES FOR INVOICE TOTALS.*/
      {us/so/soivtot2.i}
 
      ih_recno = recid(ih_buff).
      base_rpt = ih_buff.ih_curr.
 
      if not incinv or not incmemo then do:
         /* TOTAL INVOICE */
         run ip_calc_ord_amt.
 
         /* INVOICE PRINT / CREDIT PRINT TEST */
         if (not incinv  and ord_amt >= 0)
            or (not incmemo and ord_amt <  0) then do:
               undo_txdetrp = true.
               /*grc338
               {us/bbi/gprun.i  ""txdetrp.p"" "(input tax-tran-type,
	       */ {us/bbi/gprun.i  ""xfdetrp.p"" "(input tax-tran-type,
                    input ih_inv_nbr,
                    input '*',
                    input col-80,
                    input trl_length,
                    input base_rpt,
                    input mixed_rpt)" }
            run ip_print_trailer (input yes).
            {us/mf/mfrpexit.i "false"}
            next.
         end.
      end.
 
      if old_inv_nbr <> ? then page.
 
      pages = page-number - 1.
 
      view frame continue.
 
      run PrintHeaderComment(input ih_cmtindx,
                             input vcPriHeadComment).
      put skip(1).
 
      old_inv_nbr = ih_inv_nbr.
 
      if disc_det_key <> "1" then do:
         find first lngd_det where lngd_dataset begins "soprint"
                               and lngd_field   = "det_disc_prnt"
                               and lngd_lang    = global_user_lang
                               and lngd_key1    = disc_det_key
         no-lock no-error.
         if available lngd_det then
            disc_prnt_label = lngd_translation.
      end.
 
      ih_recno = ihrecno.
      run ip_print_orginfo.
      total_org = total_vat + vat_manual.
      org_disc_amt = - extprice * ih_buff.ih_disc_pct / 100.
 
      assign ih_recno = recid(ih_buff).
      run ip_print_newinfo.
      cor_disc_amt = - extprice * ih_buff.ih_disc_pct / 100.
 
      /* CORRECTION IN CORRINFO FRAME LINE INFORMATION DISPLAY */
      run ip_print_corrinfo.
      dif_disc_amt = - extprice * ih_buff.ih_disc_pct / 100.
 
      hide frame continue.
 
      if disc_sum_key <> "1" and
         disc_sum_key <> disc_det_key then do:
         find first lngd_det where lngd_dataset begins "soprint"
                               and lngd_field   = "det_disc_prnt"
                               and lngd_lang    = global_user_lang
                               and lngd_key1    = disc_sum_key
         no-lock no-error.
         if available lngd_det then
            disc_prnt_label = lngd_translation.
         else
            disc_prnt_label = "".
      end.
 
     /*grc338 {us/so/sopiprn2.i} */
     /*grc338*/ {us/xf/xfpiprn2.i}
 
      find first soc_ctrl where soc_domain = global_domain
      no-lock no-error.
      put skip(1).
      if available soc_ctrl and (soc_print_ship = yes) then do:
         assign prevxab = "" .
         for each shipper,
             each idh_hist
                where idh_hist.idh_domain = global_domain and
                               idh_inv_nbr = ih_inv_nbr and
                               idh_nbr     = shipper_sonbr no-lock,
             each abs_mstr
                where abs_mstr.abs_domain = global_domain 
                and   abs_order           = shipper_sonbr 
                and   abs_line            = string(idh_line)
                and   abs_type            = "s"
         no-lock by abs_id:
 
            if abs_inv_nbr <> ih_inv_nbr then next.
            else do:
               assign abs_recno = recid(abs_mstr).
               {us/bbi/gprun.i ""socishr6.p""}
               assign xab = getTermLabel("SHIPPER_NUMBER",10) + " : "
                            + substring(shipper_id,2)
                            + getTermLabel("DATE",4) + ": " + string(shipper_date).
               if xab <> prevxab then put xab at 2 skip .
               assign prevxab = xab.
            end.
         end.
      end.
 
      ih_recno = recid(ih_buff).
 
      /* PRINT TAX DETAIL FOR ALL SALES ORDERS */
      /* FOR THIS INVOICE NUMBER USING 132 COLUMN */
      /* AND NO FORCED PAGE BREAK              */
 
      undo_txdetrp = true.
     /*grc338
      {us/bbi/gprun.i ""txdetrp.p""
      */   {us/bbi/gprun.i ""xfdetrp.p""
         "(input '16',
           input ih_inv_nbr,
           input '*',
           input col-80,
           input trl_length,
           input base_rpt,
           input mixed_rpt)"}
      if undo_txdetrp then
            undo, leave.
 
      if page-size - line-counter < trl_length then page.
      do while page-size - line-counter > trl_length:
         put skip(1).
      end.
 
      if msg <> "" then put msg skip.
 
      put fill("-",131) format "x(132)".
      run ip_print_trailer (input no).
 
   end.
 
end.
 
PROCEDURE ip_print_orginfo:
 
   total_vat = 0.
 
   for each idh_hist where idh_hist.idh_domain = global_domain
         and idh_inv_nbr = cil_mstr.cil_prev_inv
         and idh_nbr     = cil_mstr.cil_prev_so_nbr no-lock,
       each cild_det where cild_det.cild_domain = global_domain
            and cild_prev_inv = idh_inv_nbr
            and cild_prev_so_nbr     = idh_nbr
            and cild_prev_line = idh_line
            and cild_line_type    = "R" no-lock
   break by idh_line
   with frame orginfo:
 
      assign
         article = ""
         desc1   = idh_desc
         desc2   = "".
 
      /* ADDED FIELD pt_part TO THE FIELD LIST */
      for each pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = idh_part
       no-lock:
         assign
            article = pt_article
            desc1   = if idh_desc = "" then pt_desc1 else idh_desc
            desc2   = pt_desc2.
      end.
 
      assign
         qty_inv   = idh_qty_inv
         extprice  = qty_inv * idh_price.
 
      /* FIND LINE SALES TAX RATE */
      run ip_find_tax
         (cil_prev_inv,
          cil_prev_so_nbr,
          cild_prev_line,
          '',
          extprice,
          output vat_amount,
          output vt_tax).
 
      total_vat  = total_vat + vat_amount.
 
      assign
         net_price  = extprice + vat_amount.
 
      display
         cild_prev_line @ sod_line
         idh_part       @ sod_part
         article        @ pt_article
         idh_um         @ sod_um
         qty_inv        @ sod_qty_inv
         idh_price      @ sod_price
         extprice
         vt_tax
         vat_amount
         net_price.
 
      down 1 with frame orginfo.
 
      run PrintCustomerItem(input idh_custpart,
                            input 3).
      run PrintDescription(input desc1,
                           input true,
                           input false,
                           input 3).
      run PrintDescription(input desc2,
                           input false,
                           input true,
                           input 3).
      assign
         soline = idh_line
         sopart = idh_part.
 
      if print_lotserials then do:
         run ip_print_lotserial(input "O").
      end.
 
      run ip_print_options.
      accumulate extprice  (total).
 
   end.
 
   extprice   =  accum total (extprice).
 
END PROCEDURE.
 
PROCEDURE ip_print_newinfo:
 
   total_vat = - total_org.
 
   for each idh_hist where idh_hist.idh_domain = global_domain
        and idh_inv_nbr = cil_mstr.cil_cor_inv
        and idh_nbr     = cil_mstr.cil_cor_so_nbr no-lock,
       each cild_det where cild_det.cild_domain = global_domain
           and  cild_cor_inv  = cil_mstr.cil_cor_inv
           and  cild_cor_so_nbr  = cil_mstr.cil_cor_so_nbr
           and  cild_cor_line = idh_line
           and  cild_line_type = "C"
   no-lock
   break by idh_line
   with frame newinfo:
 
      assign
         article = ""
         desc1   = idh_desc
         desc2   = "".
 
      /* ADDED FIELD pt_part TO THE FIELD LIST */
      for each pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = idh_part
       no-lock:
         assign
            article = pt_article
            desc1   = if idh_desc = "" then pt_desc1 else idh_desc
            desc2   = pt_desc2.
      end.
 
      assign
         qty_inv   = idh_qty_inv
         extprice  = qty_inv * idh_price.
 
      /* FIND LINE SALES TAX RATE */
      run ip_find_tax
         (idh_inv_nbr,
          idh_nbr,
          idh_line,
          '',
          extprice,
          output vat_amount,
          output vt_tax).
 
      total_vat = total_vat + vat_amount.
 
      assign
         net_price  = extprice + vat_amount.
 
      display
         idh_line    @ sod_line
         idh_part    @ sod_part
         article     @ pt_article
         idh_um      @ sod_um
         idh_qty_inv @ sod_qty_inv
         idh_price   @ sod_price
         extprice
         vt_tax
         vat_amount
         net_price.
 
      down 1 with frame newinfo.
 
      run PrintCustomerItem(input idh_custpart,
                            input 3).
      run PrintDescription(input desc1,
                           input true,
                           input false,
                           input 3).
      run PrintDescription(input desc2,
                           input false,
                           input true,
                           input 3).
      assign
         soline = idh_line
         sopart = idh_part.
 
      if print_lotserials then do:
         run ip_print_lotserial(input "N").
      end.
 
      run PrintLineComment(input idh_cmtindx,
                           input vcPriLineComment).
      run ip_print_options.
      accumulate extprice  (total).
 
   end.
 
   extprice   =  accum total (extprice).
 
END PROCEDURE.
 
PROCEDURE ip_print_corrinfo:
   define variable sodprice like extprice   no-undo.
   define variable vat_amt1 like vat_amount no-undo.
   define variable vt_tax1  like vt_tax     no-undo.
   define buffer   idh_buff for idh_hist.
 
   assign
      extprice   = 0
      vat_amount = 0
      net_price  = 0
      total_vat   = 0
      vl_corrinfo = yes.
 
   for each idh_buff
      where idh_buff.idh_domain = global_domain
         and idh_inv_nbr     = cil_mstr.cil_cor_inv
         and idh_nbr         = cil_mstr.cil_cor_so_nbr no-lock,
       each cild_det
          where cild_det.cild_domain = global_domain
           and  cild_cor_inv = cil_mstr.cil_cor_inv
           and  cild_cor_so_nbr     = cil_mstr.cil_cor_so_nbr
           and  cild_cor_line = idh_line
           and  cild_line_type    = "C"
   no-lock
      break by idh_line
   with frame corrinfo:
 
      assign
         article = ""
         desc1   = idh_desc
         desc2   = "".
 
      /* ADDED FIELD pt_part TO THE FIELD LIST */
      for each pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = idh_part
      no-lock:
         assign
            article = pt_article
            desc1   = if idh_desc = "" then pt_desc1 else idh_desc
            desc2   = pt_desc2.
      end.
 
      for first idh_hist
         where idh_hist.idh_domain  = global_domain
         and   idh_hist.idh_inv_nbr = cil_prev_inv
         and   idh_hist.idh_nbr     = cil_prev_so_nbr
         and   idh_hist.idh_line    = idh_buff.idh_line
      no-lock: end.
 
      assign
         qty_inv   = idh_buff.idh_qty_inv
         sodprice  = idh_buff.idh_price
         extprice  = qty_inv * idh_buff.idh_price.
 
      /* FIND LINE SALES TAX RATE */
      run ip_find_tax(idh_buff.idh_inv_nbr,
         idh_buff.idh_nbr,
         idh_buff.idh_line,
         '',
         extprice,
         output vat_amount,
         output vt_tax).
 
      total_vat = total_vat + vat_amount.
 
      if idh_hist.idh_part = idh_buff.idh_part then
         qty_inv = idh_buff.idh_qty_inv - idh_hist.idh_qty_inv
                 * idh_hist.idh_um_conv / idh_buff.idh_um_conv.
 
      assign
         sodprice = idh_buff.idh_price
         - (idh_hist.idh_price / idh_hist.idh_um_conv) * idh_buff.idh_um_conv
         extprice = extprice - idh_hist.idh_price * idh_hist.idh_qty_inv.
	
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
             "(input-output  extprice,
              input rndmthd,
              output mc-error-number)"}
 
      run ip_find_tax(idh_hist.idh_inv_nbr,
         idh_hist.idh_nbr,
         idh_hist.idh_line,
         '',
         (idh_hist.idh_price * idh_hist.idh_qty_inv),
         output vat_amt1,
         output vt_tax1).
 
      total_vat  = total_vat  - vat_amt1.
 
      assign
         vat_amount = vat_amount - vat_amt1
         net_price  = extprice + vat_amount.
 
      if idh_buff.idh_part <> idh_hist.idh_part then do:
 
         find pt_mstr where pt_mstr.pt_domain = global_domain and
              pt_part = idh_hist.idh_part
         no-lock no-error.
 
         display
            idh_buff.idh_line  @ sod_line
            idh_hist.idh_part  @ sod_part
            pt_article
            idh_hist.idh_um    @ sod_um
            (- idh_hist.idh_qty_inv * idh_hist.idh_um_conv
                / idh_buff.idh_um_conv)
                           @ sod_qty_inv
            '' @ sod_price
            '' @ extprice
            '' @ vt_tax
            '' @ vat_amount
            '' @ net_price
         with frame corrinfo.
 
         down 1 with frame corrinfo.
 
         run PrintDescription
            (input pt_desc1,
             input true,
             input false,
             input 3).
 
         run PrintDescription
            (input pt_desc2,
             input false,
             input true,
             input 3).
 
      end.
 
      display
         idh_buff.idh_line @ sod_line
         idh_buff.idh_part @ sod_part
         article @ pt_article
         idh_buff.idh_um @ sod_um
         qty_inv @ sod_qty_inv
         sodprice @ sod_price
         extprice
         vt_tax  when vt_tax = vt_tax1
         ' '     when vt_tax <> vt_tax1 @ vt_tax
         vat_amount
         net_price.
 
      down 1 with frame corrinfo.
 
      run PrintCustomerItem
         (input idh_buff.idh_custpart,
          input 3).
 
      run PrintDescription
         (input desc1,
          input true,
          input false,
          input 3).
 
      run PrintDescription
         (input desc2,
          input false,
          input true,
          input 3).
 
      accumulate extprice  (total).
      accumulate vat_amount (total).
      accumulate net_price  (total).
 
   end.
 
   if print_lotserials then do:
      run ip_print_lotserial(input "C").
   end.
 
   assign
      extprice   =  accum total (extprice)
      vat_amount = accum total (vat_amount)
      net_price  = accum total (net_price).
 
   underline extprice vat_amount net_price with frame corrinfo.
   down 1 with frame corrinfo.
 
   find first rsn_ref  where rsn_ref.rsn_domain = global_domain
      and rsn_code = cil_cor_rsn
      and rsn_type = "CORRINV"
   no-lock no-error.
 
   display
      getTermLabelRtColon("CORRECTION_REASON",18)
        format "x(18)"
      @ sod_part
      cil_cor_rsn         @ pt_article
      getTermLabelRt("SUM_OF",12)  format "x(12)" @ sod_qty_inv
      " " + getTermLabel("CORRECTION",10) format "x(11)"
      @ sod_price
      extprice
      vat_amount
      net_price
   with frame corrinfo.
   if available rsn_ref then put rsn_desc at 24.
 
   vl_corrinfo = no.
END PROCEDURE.
 
PROCEDURE ip_find_tax:
   define input  parameter p_ref      like tx2d_ref      no-undo.
   define input  parameter p_nbr      like tx2d_nbr      no-undo.
   define input  parameter p_line     like sod_line      no-undo.
   define input  parameter p_trl      like tx2d_trl      no-undo.
   define input  parameter p_amount   like sod_std_cost  no-undo.
   define output parameter p_tax      like tx2d_tax_amt  no-undo.
   define output parameter p_tax_pct  like tx2_tax_pct   no-undo.
 
   define  variable taxable_amt  as   decimal no-undo.
   define  variable tax_amt      as   decimal no-undo.
 
   define variable l_taxc like tx2d_taxc      no-undo.
   define buffer soddet   for sod_det.
   define buffer idhhist  for idh_hist.
   define buffer trlmstr  for trl_mstr.
   find soddet  where soddet.sod_domain = global_domain
                  and soddet.sod_nbr    = p_nbr
                  and soddet.sod_line   = p_line
   no-lock no-error.
   find idhhist  where idhhist.idh_domain  = global_domain
                   and idhhist.idh_inv_nbr = p_ref
                   and idhhist.idh_nbr     = p_nbr
                   and idhhist.idh_line    = p_line
   no-lock no-error.
   find trlmstr where trlmstr.trl_domain = global_domain
                  and trlmstr.trl_code   = p_trl
   no-lock no-error.
   if available soddet       then l_taxc = soddet.sod_taxc.
   else if available idhhist then l_taxc = idhhist.idh_taxc.
   else if available trlmstr then l_taxc = trlmstr.trl_taxc.
 
   assign
      p_tax     = 0
      p_tax_pct = 0.
 
   for each tx2d_det
        where tx2d_det.tx2d_domain = global_domain
         and  (tx2d_ref     = p_ref
         and   tx2d_nbr     = p_nbr
         and  (tx2d_line    = p_line or tx2d_line = 0)
         and   tx2d_trl     = p_trl
         and   tx2d_tr_type = "16"
      ) no-lock:
      if tx2d_line = p_line then
         assign p_tax = p_tax + tx2d_cur_tax_amt.
      else do:
         find tx2_mstr
            where tx2_mstr.tx2_domain = global_domain and
                  tx2_tax_code = tx2d_tax_code
         no-lock no-error.
         if not available tx2_mstr or l_taxc <> tx2d_taxc
            then next.
         assign p_tax = p_tax + tx2_tax_pct * p_amount / 100.
      end.
   end.
 
   if p_amount = 0 then
      assign p_tax_pct = 0.
   else
      assign p_tax_pct = round(p_tax * 100 / p_amount, 1).
END PROCEDURE.
 
PROCEDURE ip_print_lotserial:
   define input parameter p-type as character format "X(1)" no-undo.
 
   define buffer trhist for tr_hist.
   define buffer eucrddet for cild_det.
   define variable revline like sod_line no-undo.
 
   revline = 0.
   if p-type = "C" or p-type = "O"
   then do for eucrddet:
      find first eucrddet
         where eucrddet.cild_domain = global_domain
          and  cild_cor_inv  = cil_mstr.cil_cor_inv
          and   cild_cor_so_nbr  = cil_mstr.cil_cor_so_nbr
          and   cild_cor_line = soline
          and   cild_line_type = "R"
      no-lock no-error.
      if available eucrddet then
         assign revline = eucrddet.cild_cor_line.
   end.
   for each tr_hist no-lock
      where tr_hist.tr_domain  = global_domain
      and   (tr_type     = (if p-type = "O"
                            then "ISS-SO"
                            else "ISS-COR")
         and tr_nbr      = (if p-type = "O"
                            then cil_mstr.cil_prev_so_nbr
                            else sonbr)
         and tr_rmks     = (if p-type = "O"
                            then cil_mstr.cil_prev_inv
                            else cil_mstr.cil_cor_inv)
         and tr_line     = soline
        /* and (tr_line    = (if p-type = "O"
                            then revline
                            else soline)
            or (tr_line = revline
               and p-type = "C"))*/
         and tr_serial  <> "")
   break by tr_serial by tr_ref by tr_expire:
      if first-of(tr_serial) then do:
         empty temp-table tt_item_serials.
      end.
      if first(tr_expire) then do:
         if page-size - line-counter < 1 then do:
            page.
            run ip_clear_frame.
         end.
         put lot-lbl at 3
            skip.
      end.
 
      if first-of(tr_expire) then lotserial_total = 0.
      lotserial_total = lotserial_total - tr_qty_loc.
      if last-of(tr_expire) and lotserial_total <> 0 then do:
         if page-size - line-counter < 1 then do:
            page.
            run ip_clear_frame.
         end.
 
         put tr_serial at 5
            (if p-type = "O" then - lotserial_total else lotserial_total) at 25
            tr_expire at 40
            tr_ref at 50
            skip.
      end.
      if p-type <> "C" then do:
         {us/px/pxrun.i &PROC       = 'getShippingSerialHistoryByTrans'
                        &PROGRAM    = 'pashphxr.p'
                        &HANDLE     = ph_pashphxr
                        &PARAM      = "(input tr_hist.tr_trnbr,
                                        input-output table tt_item_serials by-reference)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
         if last-of (tr_serial) then do:
            for each tt_item_serials no-lock:
               put tt_serial_id at 5 skip.
            end.
         end.
      end.
   end. /* FOR EACH tr_hist */
 
END PROCEDURE.
 
PROCEDURE ip_print_options:
 
   define variable sob-qty   like sob_qty_req no-undo.
   define variable ibh_desc  like pt_desc1    no-undo.
   define variable ibh_desc2 like pt_desc2    no-undo.
   define variable ibh_um    like pt_um       no-undo.
   define variable pm_code   like pt_pm_code  no-undo.
 
   /* PRINT FEATURES AND OPTIONS */
   /********************************************
   SOB_SERIAL SUBFIELD POSITIONS:
   1-4     OPERATION NUMBER (OLD - NOW 0'S)
   5-10    SCRAP PERCENT
   11-14   ID NUMBER OF THIS RECORD
   15-15   STRUCTURE CODE
   16-16   "Y" (INDICATES "NEW" FORMAT SOB_DET RECORD)
   17-34   ORIGINAL QTY PER PARENT
   35-35   ORIGINAL MANDATORY INDICATOR (Y/N)
   36-36   ORIGINAL DEFAULT INDICATOR (Y/N)
   37-39   LEADTIME OFFSET
   40-40   PRICE MANUALLY UPDATED (Y/N)
   41-46   OPERATION NUMBER (NEW - 6 DIGITS)
   *******************************************/
 
   if print_options and
      can-find(first ibh_hist
       where ibh_hist.ibh_domain = global_domain and  ibh_inv_nbr =
       idh_hist.idh_inv_nbr
      and   ibh_nbr     = idh_hist.idh_nbr
      and   ibh_line    = idh_hist.idh_line) then do:
      /* PRINT DISCOUNTS FOR PARENT ITEM */
    /*grc338  ** removed
      {us/so/sopiprn3.i &nbr = idh_nbr
         &inv_nbr = idh_inv_nbr
         &line = idh_line
         &part = idh_part
         &parent=""""     &feature=""""   &opt=""""
         &qty = idh_qty_inv
         &list_price = idh_list_pr
         &net_price = idh_price
         &confg_disc = "no"
         &command="run ip_clear_frame." } */
 /*grc338  ** added */
      {us/xf/xfpiprn3.i &nbr = idh_nbr
         &inv_nbr = idh_inv_nbr
         &line = idh_line
         &part = idh_part
         &parent=""""     &feature=""""   &opt=""""
         &qty = idh_qty_inv
         &list_price = idh_list_pr
         &net_price = idh_price
         &confg_disc = "no" }

      find first ibh_hist
         where ibh_hist.ibh_domain = global_domain
          and  ibh_inv_nbr = idh_inv_nbr
          and  ibh_line    = idh_line
          and  ibh_nbr     = idh_nbr
      no-lock no-error.
 
      if substring(ibh_serial, 16, 1) = "Y" then do:
       /*grc338
         {us/bbi/gprun.i ""soivrp1f.p"" "(input """", input 0,
        */  {us/bbi/gprun.i ""xfivrp1f.p"" "(input """", input 0,
              input idh_nbr, input idh_line)"}
      end.
      else do:
         for each ibh_hist
            where ibh_hist.ibh_domain = global_domain
             and (ibh_inv_nbr = idh_inv_nbr
             and   ibh_nbr = idh_nbr
             and   ibh_line = idh_line
             and (ibh_parent = idh_part
                 or ibh_parent = "")
             and ibh_qty_req <> 0 )
         no-lock:
            if idh_qty_ord = 0 then sob-qty = 0.
            else sob-qty = ibh_qty_req / idh_qty_ord.
            find pt_mstr
               where pt_mstr.pt_domain = global_domain
                 and pt_part = ibh_part
            no-lock no-error.
            if available pt_mstr then
               assign
                  ibh_desc  = pt_desc1
                  ibh_desc2 = pt_desc2
                  ibh_um    = pt_um.
            else
               assign
                  ibh_desc  = ""
                  ibh_desc2 = "".
 
            if page-size - line-counter < 1 then do:
               page.
               run ip_clear_frame.
            end.
            put ibh_feature format "x(12)" at 5 " " ibh_part
                sob-qty " " idh_um.
 
            run PrintDescription(input ibh_desc,
                                 input false,
                                 input false,
                                 input 20).
            run PrintDescription(input ibh_desc2,
                                 input false,
                                 input true,
                                 input 20).
 
            /* PRINT DISCOUNTS FOR COMPONENT ITEM */
             /*grc338 ** deleted
            {us/so/sopiprn3.i
               &nbr = idh_nbr
               &inv_nbr = idh_inv_nbr
               &line=idh_line
               &part=sod_part
               &parent=ibh_parent &feature="substring(ibh_feature,1,12)"
               &opt=ibh_part
               &qty="(sob-qty * idh_qty_inv)"
               &list_price=ibh_tot_std
               &net_price=ibh_price
               &confg_disc="no"
               &command="run ip_clear_frame."} */
 /*grc338 ** added*/
            {us/xf/xfpiprn3.i
               &nbr = idh_nbr
               &inv_nbr = idh_inv_nbr
               &line=idh_line
               &part=sod_part
               &parent=ibh_parent &feature="substring(ibh_feature,1,12)"
               &opt=ibh_part
               &qty="(sob-qty * idh_qty_inv)"
               &list_price=ibh_tot_std
               &net_price=ibh_price
               &confg_disc="no" }

         end.
      end.
   end.
 
   /* TEST FOR CONFIGURED PARENT WITHOUT COMPONENTS */
   if  cil_mstr.cil_prev_inv = idh_inv_nbr and
       cil_mstr.cil_prev_so_nbr = idh_nbr
   then
      find first cild_det
         where cild_det.cild_domain = global_domain
          and   cild_cor_inv  = cil_cor_inv
          and   cild_cor_so_nbr  = cil_cor_so_nbr
          and   cild_cor_line = idh_line
          and   cild_line_type = "R" no-lock no-error.
   else release cild_det.
 
   if available pt_mstr then do:
      pm_code = pt_pm_code.
      find ptp_det
         where ptp_domain = global_domain and
               ptp_part = idh_part and
               ptp_site = idh_site
      no-lock no-error.
      if available ptp_det then pm_code = ptp_pm_code.
      if pm_code = "C" and
         not can-find(first ibh_hist
             where ibh_hist.ibh_domain = global_domain
              and  ibh_inv_nbr = idh_inv_nbr
              and  ibh_nbr  = idh_nbr
              and  ibh_line = idh_line)
      then do:
         /*grc338 *** deleted
         {us/so/sopiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
            &line=idh_line &part=idh_part
            &parent="""" &feature="""" &opt=""""
            &qty=idh_qty_inv &list_price=idh_list_pr
            &net_price=idh_price
            &confg_disc="no"
            &command="run ip_clear_frame."}  **/


          /*grc338 *** added*/
        {us/xf/xfpiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
            &line=idh_line &part=idh_part
            &parent="""" &feature="""" &opt=""""
            &qty=idh_qty_inv &list_price=idh_list_pr
            &net_price=idh_price
            &confg_disc="no" }

      end.
   end.
 
   /* PRINT GLOBAL DISCOUNT FOR ITEM/CONFIGURATION */
   /*grc338 *** deleted
   {us/so/sopiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
      &line=idh_line &part=idh_part
      &parent="""" &feature="""" &opt=""""
      &qty=idh_qty_inv &list_price=idh_list_pr
      &net_price=idh_price
      &confg_disc="yes"
      &command="run ip_clear_frame."} */
 /*grc338 *** added */
   {us/xf/xfpiprn3.i &nbr=idh_nbr &inv_nbr=idh_inv_nbr
      &line=idh_line &part=idh_part
      &parent="""" &feature="""" &opt=""""
      &qty=idh_qty_inv &list_price=idh_list_pr
      &net_price=idh_price
      &confg_disc="yes" }

END PROCEDURE.
 
PROCEDURE ip_clear_frame:
 
   if available cild_det then do:
      if cild_line_type = "C" then do:
         if vl_corrinfo then do:
            clear frame corrinfo all no-pause.
            display
               idh_hist.idh_part @ sod_part
               cont_lbl @ pt_article
            with frame corrinfo.
            down 1 with frame corrinfo.
         end.
         else do:
            clear frame newinfo all no-pause.
            display
               idh_hist.idh_part @ sod_part
               cont_lbl @ pt_article with
            frame newinfo.
            down 1 with frame newinfo.
         end.
      end.
      else do:
         clear frame orginfo all no-pause.
         display
            idh_hist.idh_part @ sod_part
            cont_lbl @ pt_article
         with frame orginfo.
         down 1 with frame orginfo.
      end.
   end.
 
END PROCEDURE.
 
PROCEDURE ip_print_trailer:
   define input parameter header_info like mfc_logical no-undo.
   define variable temp_amount as decimal no-undo.
 
   if header_info then
      display extprice vat_amount net_price with frame corrinfo.
 
   blocka:
   do on error undo, retry on endkey undo, leave:
      {us/tx/txedttrl.i &code  = "ih_buff.ih_trl1_cd"
         &amt   = "ihtrlamt[1]"
         &desc  = "org_user_desc[1]"
         &frame = "invtrl"
         &loop  = "blocka"}
 
      {us/tx/txedttrl.i &code  = "ih_trl2_cd"
         &amt   = "ihtrlamt[2]"
         &desc  = "org_user_desc[2]"
         &frame = "invtrl"
         &loop  = "blocka"}
 
      {us/tx/txedttrl.i &code  = "ih_trl3_cd"
         &amt   = "ihtrlamt[3]"
         &desc  = "org_user_desc[3]"
         &frame = "invtrl"
         &loop  = "blocka"}
   end.
 
   assign
      sotrlamt[1] = ih_trl1_amt
      sotrlamt[2] = ih_trl2_amt
      sotrlamt[3] = ih_trl3_amt.
 
   /* FIND LINE SALES TAX RATE */
   run ip_find_tax(invnbr,
                   ihnbr,
                   99999999,
                   ih_trl1_cd,
                   ihtrlamt[1],
                   output org_vatamount[1],
                   output org_vttax[1]).
 
   /* IF ORIGINAL TRAILER AMOUNT WAS BLANK THEN TAX RATE WILL BE
   CALCULATED USING CORRECTION SALES ORDER */
   if  org_vttax[1] = 0 then
      run ip_find_tax(ih_inv_nbr,
                      ih_nbr,
                      99999999,
                      ih_trl1_cd,
                      ih_trl1_amt,
                      output temp_amount,
                      output org_vttax[1]).
   assign
      dif_vatamount[1] = sotrlamt[1] * org_vttax[1] / 100
      org_netprice[1]  = ihtrlamt[1] + org_vatamount[1]
      dif_netprice[1]  = sotrlamt[1] + dif_vatamount[1]
      cor_trl_amt[1]   = ihtrlamt[1] + sotrlamt[1]
      cor_vatamount[1] = org_vatamount[1] + dif_vatamount[1]
      cor_netprice[1]  = org_netprice[1] + dif_netprice[1].
 
   run ip_find_tax(invnbr,
                   ihnbr,
                   99999999,
                   ih_trl2_cd,
                   ihtrlamt[2],
                   output org_vatamount[2],
                   output org_vttax[2]).
 
   /* IF ORIGINAL TRAILER AMOUNT WAS BLANK THEN TAX RATE WILL BE
   CALCULATED USING CORRECTION SALES ORDER */
   if  org_vttax[2] = 0 then
      run ip_find_tax(ih_inv_nbr,
                      ih_nbr,
                      99999999,
                      ih_trl2_cd,
                      ih_trl2_amt,
                      output temp_amount,
                      output org_vttax[2]).
 
   assign
      dif_vatamount[2] = sotrlamt[2] * org_vttax[2] / 100
      org_netprice[2]  = ihtrlamt[2] + org_vatamount[2]
      dif_netprice[2]  = sotrlamt[2] + dif_vatamount[2]
      cor_trl_amt[2]   = ihtrlamt[2] + sotrlamt[2]
      cor_vatamount[2] = org_vatamount[2] + dif_vatamount[2]
      cor_netprice[2]  = org_netprice[2] + dif_netprice[2].
 
   run ip_find_tax(invnbr,
                   ihnbr,
                   99999999,
                   ih_trl3_cd,
                   ihtrlamt[3],
                   output org_vatamount[3],
                   output org_vttax[3]).
 
 
   /* IF ORIGINAL TRAILER AMOUNT WAS BLANK THEN TAX RATE WILL BE
   CALCULATED USING CORRECTION SALES ORDER */
   if  org_vttax[3] = 0 then
      run ip_find_tax(ih_inv_nbr,
                      ih_nbr,
                      99999999,
                      ih_trl3_cd,
                      ih_trl3_amt,
                      output temp_amount,
                      output org_vttax[3]).
 
   assign
      dif_vatamount[3] = sotrlamt[3] * org_vttax[3] / 100
      org_netprice[3]  = ihtrlamt[3] + org_vatamount[3]
      dif_netprice[3]  = sotrlamt[3] + dif_vatamount[3]
      cor_trl_amt[3]   = ihtrlamt[3] + sotrlamt[3]
      cor_vatamount[3] = org_vatamount[3] + dif_vatamount[3]
      cor_netprice[3]  = org_netprice[3] + dif_netprice[3].
 
   display
      ih_disc_pct   disc-lbl     disp_char8_4
      org_disc_amt  disp_char9_4 cor_disc_amt
      disp_char10_4 dif_disc_amt
      disp_char8_1 disp_char8_2 disp_char8_3 disp_char9_1
      disp_char9_2 disp_char9_3 disp_char10_1 disp_char10_2 disp_char10_3
      org_user_desc
      ih_trl1_cd     ihtrlamt
      ih_trl2_cd
      ih_trl3_cd
      org_vttax      org_vatamount   org_netprice
      cor_trl_amt    cor_vatamount   cor_netprice
      sotrlamt       dif_vatamount   dif_netprice
   with frame invtrl.
 
   put "---------------"  to 89
      "--------------"   to 113
      "----------------" to 130
      skip.
 
   extprice   = extprice + sotrlamt[1] + sotrlamt[2] + sotrlamt[3]
              + dif_disc_amt.
   vat_amount = vat_amount + dif_vatamount[1] + dif_vatamount[2]
              + dif_vatamount[3].
   net_price  = net_price + dif_netprice[1] + dif_netprice[2]
              + dif_netprice[3] + dif_disc_amt.
 
   put
      {us/bbi/gplblfmt.i
      &FUNC=getTermLabelRtColon(""INVOICE_SUMMARY"",16)
      } to 73
      extprice   format extprice_fmt   to 89
      vat_amount format vat_amount_fmt to 113
      net_price  format net_price_fmt  to 130.
   if ih_curr <> base_curr and isEUtransaction(ih_site, ih_cust) then do:
      assign l_basetaxtot = 0.
 
      for each tx2d_det where tx2d_det.tx2d_domain = global_domain
                          and tx2d_ref = ih_inv_nbr
                          and tx2d_nbr = ih_nbr
                          and tx2d_tr_type = "16"
                          and tx2d_tax_code <> "00000000"
                        no-lock:
 
         /* CONVERT L_TOT_AMT TO BASE_CURRENCY */
         {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
            "(input  ih_curr,
              input  base_curr,
              input  ih_ex_rate,
              input  ih_ex_rate2,
              input  tx2d_cur_tax_amt,
              input  true, /* ROUND */
              output l_basesubtot,
              output mc-error-number)" }
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end. /* IF MC-ERROR-NUMBER <> 0 */
 
         assign l_basetaxtot = l_basetaxtot + l_basesubtot.
      end.
      put "(" at 98 l_basetaxtot format vat_amount_fmt to 113 " " base_curr ")".
   end.
 
   put "---------------"  to 89
      "--------------"   to 113
      "----------------" to 130
      skip.
 
   {us/bbi/gprun.i ""sociword.p""
      "(input ih_curr,
        input net_price,
        output in_words)"}
 
   if net_price < 0 then
      assign in_words = in_words + "  ****" + getTermLabel("CREDIT",6) + "****".
   put
      {us/bbi/gplblfmt.i
      &FUNC=getTermLabel(""CURRENCY"",8)
      &CONCAT="' :'"
      } at 4
      ih_curr at 15
      {us/bbi/gplblfmt.i
      &FUNC=getTermLabelRtColon(""TO_PAY"",7)
      } at 4
      net_price at 12
      skip
      {us/bbi/gplblfmt.i
      &FUNC=getTermLabelRtColon(""THE_AMOUNT_IN_WORDS"",19)
      } at 4.
   if length(in_words) < 100 then
      put in_words skip(1).
   else do:
      i = 100.
      repeat:
         if substring(in_words,i,1) = " " then leave.
         assign i = i - 1.
      end.
      put substring(in_words,1,i) format "x(100)" at 25 skip.
      put space(2) substring(in_words,i ) format "x(100)".
   end.
END PROCEDURE.
 
PROCEDURE ip_calc_ord_amt:
   define variable sodprice like extprice   no-undo.
   define variable vat_amt1 like vat_amount no-undo.
 
   assign
      extprice   = 0
      vat_amount = 0
      net_price  = 0
      ord_amt    = 0.
 
   for each idh_hist
      where idh_hist.idh_domain = global_domain
      and   idh_inv_nbr     = cil_mstr.cil_cor_inv
      and   idh_nbr         = cil_mstr.cil_cor_so_nbr
   no-lock:
      assign sodprice = idh_qty_inv * idh_price.
 
      /* FIND LINE SALES TAX RATE */
      run ip_find_tax(idh_inv_nbr,
                      idh_nbr,
                      idh_line,
                      '',
                      sodprice,
                      output vat_amt1,
                      output vt_tax).
 
      assign
         extprice   = extprice   + sodprice
         vat_amount = vat_amount + vat_amt1
         net_price  = net_price +  sodprice + vat_amt1.
   end.
 
   {us/bbi/gprun.i ""txtotal.p""
      "(input  '16',
        input  ih_buff.ih_inv_nbr,
        input  '*',
        input  0,      /* ALL LINES */
        output tax_amt)"}
 
   ord_amt = extprice + ih_buff.ih_trl1_amt
           + ih_buff.ih_trl2_amt + ih_buff.ih_trl3_amt + tax_amt.
 
END PROCEDURE.
 
PROCEDURE ip_ih_invoiced:
/* Updating ih_invoiced */
define input parameter p_so_nbr as char no-undo.
define input parameter p_inv_nbr as char no-undo.
 
define buffer ih_buff2 for ih_hist.
 
   for each ih_buff2
   where ih_buff2.ih_domain = global_domain
     and ih_buff2.ih_nbr = p_so_nbr 
     and ih_buff2.ih_inv_nbr = p_inv_nbr
   exclusive-lock break by ih_inv_nbr:
		
	  assign ih_invoiced = true.
		
   end. /*FOR EACH ih_buff2*/
 
END PROCEDURE.
 
/* procedures of print settings */
{us/so/soprprc3.i &PageEnd="run ip_clear_frame."}
