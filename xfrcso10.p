/* xfrcso10.p - SALES ORDER INVOICE PRINT DONE FROM SHIPPER CONFIRM           */
/* rcsorp10.p - SALES ORDER INVOICE PRINT DONE FROM SHIPPER CONFIRM           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrcso10.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */
/* REVISION: 7.4      LAST MODIFIED: 10/13/93   BY: WUG *H172*                */
/* REVISION: 7.4      LAST MODIFIED: 01/16/94   BY: tjs *H166*                */
/* REVISION: 7.4      LAST MODIFIED: 12/01/93   BY: WUG *H257*                */
/* REVISION: 7.4      LAST MODIFIED: 04/14/94   BY: dpm *H347*                */
/* REVISION: 7.4      LAST MODIFIED: 04/26/95   by: srk *H0DF*                */
/* REVISION: 7.4      LAST MODIFIED: 09/25/95   BY: vrn *H0G2*                */
/* REVISION: 7.4      LAST MODIFIED: 12/11/95   BY: jzs *H0HL*                */
/* REVISION: 8.5      LAST MODIFIED: 01/10/95   BY: DAH *J0BB*                */
/* REVISION: 8.5      LAST MODIFIED: 05/15/96   BY: GWM *J0MS*                */
/* REVISION: 8.5      LAST MODIFIED: 07/21/96   BY: *J0Y3* Robert Wachowicz   */
/* REVISION: 8.5      LAST MODIFIED: 02/13/97   BY: *H0S3* Suresh Nayak       */
/* REVISION: 8.5      LAST MODIFIED: 11/27/97   BY: *J272* Nirav Parikh       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 08 MAY 98  BY: *L00X* Ed v.d.Gevel       */
/* REVISION: 8.6E     LAST MODIFIED: 06/30/98   BY: *J2NR  A. Licha           */
/* REVISION: 8.6E     LAST MODIFIED: 07/14/98   BY: *L024* Steve Goeke        */
/* REVISION: 8.6E     LAST MODIFIED: 08/13/98   BY: *J2VM* Irine D'mello      */
/* REVISION: 8.6E     LAST MODIFIED: 09/14/98   BY: *J29B* Ajit Deodhar       */
/* REVISION: 9.1      LAST MODIFIED: 10/21/99   BY: *N04X* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 11/02/99   BY: *N04P* Robert Jensen      */
/* REVISION: 9.1      LAST MODIFIED: 11/05/99   BY: *N03C* Kieran O Dea       */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 05/04/00   BY: *N09S* Kieran O Dea       */
/* REVISION: 9.1      LAST MODIFIED: 08/10/00   BY: *M0QW* Falguni Dalal      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KP* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/25/00   BY: *N0WD* Mudit Mehta        */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *J2NR*                    */
/* Revision: 1.20.2.11     BY: Katie Hilbert      DATE: 04/01/01 ECO: *P002*  */
/* Revision: 1.20.2.12     BY: Katie Hilbert      DATE: 04/01/01 ECO: *P05V*  */
/* Revision: 1.20.2.13     BY: Ed van de Gevel    DATE: 07/04/02 ECO: *P0B4*  */
/* Revision: 1.20.2.15     BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00K*  */
/* Revision: 1.20.2.16     BY: Gaurav Kerkar      DATE: 03/19/04 ECO: *P1TH*  */
/* Revision: 1.20.2.17     BY: Shivganesh Hegde   DATE: 08/03/04 ECO: *P26L*  */
/* Revision: 1.20.2.18     BY: Manish Dani        DATE: 10/28/04 ECO: *P2RT*  */
/* Revision: 1.20.2.20     BY: Ed van de Gevel    DATE: 03/07/05 ECO: *R00G*  */
/* Revision: 1.20.2.21     BY: Ed van de Gevel    DATE: 18/03/05 ECO: *R00F*  */
/* Revision: 1.20.2.22     BY: Manish Dani        DATE: 04/08/05 ECO: *P3DM*  */
/* Revision: 1.20.2.23     BY: Shoma Salgaonkar   DATE: 08/31/05 ECO: *P408*  */
/* Revision: 1.20.2.25     BY: Jean Miller        DATE: 02/28/06 ECO: *Q0R5*  */
/* Revision: 1.20.2.26     BY: Arun Kumar         DATE: 01/25/07 ECO: *R0C6*  */
/* Revision: 1.20.2.28     BY: Jean Miller        DATE: 06/17/08 ECO: *R0V9*  */
/* Revision: 1.20.2.29     BY: Hualin Zhong       DATE: 06/17/08 ECO: *R0X5*  */
/* Revision: 1.20.2.30     BY: Katie Hilbert      DATE: 11/12/08 ECO: *R175*  */
/* Revision: 1.20.2.31     BY: Jean Miller        DATE: 12/03/08 ECO: *R18C*  */
/* Revision: 1.20.2.32     BY: Xiaolei Meng       DATE: 08/02/09 ECO: *R1N2*  */
/* Revision: 1.20.2.33     BY: Jean Miller        DATE: 11/23/09 ECO: *R1TV*  */
/* Revision: 1.20.2.34     BY: Jean Miller        DATE: 11/23/09 ECO: *R1TW*  */
/* Revision: 1.20.2.35     BY: Katie Hilbert      DATE: 02/04/10 ECO: *R1XQ*  */
/* Revision: 1.20.2.36     BY: Katie Hilbert      DATE: 02/20/10 ECO: *R1YB*  */
/* Revision: QAD2016      BY: sxh    DATE: 09/04/16  ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/mf/mfsprtdf.i}

/*grc338*/ {us/xf/xfdefa.i "new"}
/*grc338*/ {us/xf/xfso10v.i "new"} /* procedure vars */

define temp-table tt_somstr no-undo
   field tt_sonbr   like so_nbr
   field tt_sotoinv like mfc_logical initial no
index sonbr is primary unique
   tt_sonbr.
 
define input  parameter table     for tt_somstr.
define input  parameter l_consolidate as logical no-undo.
define output parameter undo_stat like mfc_logical no-undo.
define input-output parameter p_inv_nbr_list as character           no-undo.
define input-output parameter p_inv_nbrs     as character extent 30 no-undo.
 
define new shared variable lang         like so_lang.
define new shared variable lang1        like lang.
define new shared variable ldnbr        like lgd_nbr.
define new shared variable ldnbr1       like lgd_nbr.
define new shared variable ldshipfrom   like lgd_shipfrom.
define new shared variable ldshipfrom1  like lgd_shipfrom.
define new shared variable max_lines    as integer.
define new shared variable body_count   as integer.
define new shared variable undo_nota    like mfc_logical.
define new shared variable update_post  like mfc_logical initial yes.
 
define shared variable inv_date         like so_inv_date.
define shared variable inv_only         like mfc_logical.
define shared variable print_lotserials like mfc_logical.
define shared variable print_options    like mfc_logical.
define shared variable comp_addr        like soc_company.
define shared variable msg              like msg_desc.
define shared variable nbr              like so_nbr.
define shared variable nbr1             like so_nbr.
define shared variable daybookset1      like dybs_code.
define shared variable site1            like so_site.
define shared variable sls-psn1         like so_slspsn[1] no-undo.
define shared variable shipdate         like so_ship_date.
define shared variable shipdate1        like shipdate.
define shared variable cust             like so_cust.
define shared variable cust1            like so_cust.
define shared variable bill             like so_bill.
define shared variable bill1            like so_bill.
define shared variable ship             like so_ship.
define shared variable ship1            like so_ship.
define shared variable company          as character format "x(38)" extent 6.
define shared variable dnbr             like ih_nbr no-undo.
define shared variable dnbr1            like ih_nbr no-undo.
define shared variable incinv           like mfc_logical.
define shared variable incmemo          like mfc_logical.
define shared variable addr             as character format "x(38)" extent 6.
define shared variable call-detail      as logical.
define shared variable prt_cor          like mfc_logical.
define shared variable auto_inv         like mfc_logical.
define shared variable undo_all         like mfc_logical no-undo.
 
define shared variable next_inv_nbr   like soc_inv.
define shared variable next_inv_pre   like soc_inv_pre.
define shared variable conso          like mfc_logical.
define shared variable order_nbrs     as character extent 30.
define shared variable order_nbr_list as character no-undo.
define shared variable order_ct       as integer.
define shared variable disc_det_key   like lngd_key1.
define shared variable disc_sum_key   like lngd_key1.
define shared variable form_code      as character format "x(2)" no-undo.
define shared variable report_framework like mfc_logical initial no no-undo.
define shared variable so_recno       as recid. 
define variable prt_width as integer.
define variable run_file  as character format "x(12)".
define variable i         as integer.
define variable order_num as character no-undo.
define variable l_yn      like mfc_logical initial no no-undo.
define variable l_inv_ct              as integer      no-undo.
define variable l_new_inv_nbr         as character    no-undo.
 
/*     The following variables "disc_det_key" and "disc_sum_key" are
**     required by called procedure sorp1001.p.  By setting their initial
**     value to "1", sorp1001.p will not attempt to print discounts at the
**     detail and summary level.  These new variables are the result of
**     the Pricing and Promotions project new to v8.5.  Currently, Customer
**     Schedules does not support Pricing and Promotions.
*/
define variable disc_det like lngd_translation label "Discount Detail" no-undo.
define variable disc_sum like disc_det         label "Discount Summary" no-undo.
define variable l_program_name as character initial 'soprint.p' no-undo.
define variable has_rf_report       like mfc_logical no-undo initial no.

/* Determine whether API enabled version of RF is installed and whether converted report has been loaded */
assign has_rf_report = (({us/bbi/gpiswrap.i}) and (search("com/qad/shell/report/BatchServiceNextId.p") <> ?) and
  (can-find(first rptres_mstr where rptres_code = "QAD_InvoicePrintReprint"))).
 
{us/et/etvar.i &new="new"}
 
{us/gp/gpvtecdf.i &var="new shared"}
 
form
   inv_only             colon 35
   inv_date             colon 60
   print_lotserials     colon 35
   print_options        colon 35
   comp_addr            colon 35
   form_code            colon 60 deblank
   disc_det             colon 35
   disc_sum             colon 35
   report_framework     colon 35
   msg                      at 2
   skip
with frame a width 80 side-labels.
report_framework:hidden in frame a = (has_rf_report = no).
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
find first lngd_det where lngd_dataset = l_program_name
   and   lngd_field   = "det_disc_prnt"
   and   lngd_lang    = global_user_lang
   and   lngd_key1    = disc_det_key
no-lock no-error.
 
if available lngd_det then
   disc_det = lngd_translation.
else
   disc_det = "".
 
find first lngd_det where lngd_dataset = l_program_name
   and   lngd_field   = "det_disc_prnt"
   and   lngd_lang    = global_user_lang
   and   lngd_key1    = disc_sum_key
no-lock no-error.
 
if available lngd_det then
   disc_sum = lngd_translation.
else
   disc_sum = "".
 
assign
   undo_stat   = no
   lang1       = hi_char
   shipdate    = low_date
   shipdate1   = hi_date
   cust1       = hi_char
   bill1       = hi_char
   ship1       = hi_char
   daybookset1 = hi_char
   sls-psn1    = hi_char
   site1       = hi_char
   ldnbr1      = hi_char
   ldshipfrom1 = hi_char.
 
repeat on endkey undo, retry:
 
/*grc338   if form_code = "" then form_code = "1". */
/*grc338*/ if form_code = "" then form_code = "9".
   if inv_date = ? then inv_date = today.
 
   find first soc_ctrl 
      where soc_ctrl.soc_domain = global_domain
      no-lock no-error.
   if comp_addr = "" then do:
      comp_addr = soc_comp.
      inv_only = soc_ln_inv.
   end.
 
   if  retry
   and frame-name = "a"
   then do:
 
      l_yn = no.
      /* Invoice not printed/posted. Do you wish to continue? */
      {us/bbi/pxmsg.i &MSGNUM=8604 &ERRORLEVEL=1 &CONFIRM=l_yn}
 
      if l_yn
      then do:
         undo_stat = yes.
         leave.
      end. /* IF l_yn */
 
   end. /* IF RETRY ... */
 
   if auto_inv then do:
      update
         inv_only
         inv_date
         print_lotserials
         print_options
         comp_addr
         form_code
         disc_det disc_sum
         report_framework when(has_rf_report)
         msg
      with frame a
      editing:
 
         if frame-field = "disc_det" then do:
            {us/mf/mfnp05.i lngd_det lngd_trans
               "    lngd_dataset   = l_program_name
               and  lngd_field     = 'det_disc_prnt'
               and  lngd_lang      = global_user_lang"
               lngd_translation "input disc_det"}
            if recno <> ? then
               display lngd_translation @ disc_det with frame a.
         end. /* IF FRAME-FIELD  = "DISC_DET" */
 
         else if frame-field = "disc_sum" then do:
            {us/mf/mfnp05.i lngd_det lngd_trans
               "    lngd_dataset   = l_program_name
               and  lngd_field     = 'det_disc_prnt'
               and  lngd_lang      = global_user_lang"
               lngd_translation "input disc_sum"}
            if recno <> ? then
               display lngd_translation @ disc_sum with frame a.
         end. /* IF FRAME-FIELD  = DISC_SUM */
 
         else do:
            status input.
            readkey.
            apply lastkey.
         end. /* ELSE DO */
 
      end. /* EDITING */
 
      /* VALIDATION FOR DISCOUNT PRINT OPTION */
      find first lngd_det where
              lngd_dataset     = l_program_name
         and  lngd_field       = "det_disc_prnt"
         and  lngd_lang        = global_user_lang
         and  lngd_translation = input disc_det
      no-lock no-error.
 
      if not available lngd_det then do:
         /* INVALID OPTION */
         {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_det}
         {us/bbi/gprun.i ""gpmsgls1.p""
            "(6928, l_program_name, 'det_disc_prnt', global_user_lang)"}
         next-prompt disc_det with frame a.
         undo, retry.
      end. /* IF NOT AVAILABLE LNGD_DET */
 
      disc_det_key = lngd_key1.
 
      find first lngd_det where
              lngd_dataset     = l_program_name
         and  lngd_field       = "det_disc_prnt"
         and  lngd_lang        = global_user_lang
         and  lngd_translation = input disc_sum
      no-lock no-error.
 
      if not available lngd_det then do:
         /* INVALID OPTION */
         {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=disc_sum}
         {us/bbi/gprun.i ""gpmsgls1.p""
            "(6928, l_program_name, 'det_disc_prnt', global_user_lang)"}
         next-prompt disc_sum with frame a.
         undo, retry.
      end. /* IF NOT AVAILABLE LNGD_DET */
 
      disc_sum_key = lngd_key1.
 
      if inv_date = ? then do:
         /* Invalid date */
         {us/bbi/pxmsg.i &MSGNUM=27 &ERRORLEVEL=3}
         next-prompt inv_date with frame a.
         undo , retry.
      end.
 
/*grc338   if lookup(form_code,"1,11") = 0 then do: */
/*grc338*/ if lookup(form_code,"1,9,11") = 0 then do:
         /* Form code not installed */
         {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3}
         next-prompt form_code with frame a.
         undo , retry.
      end.
   end.
 
   assign company = "".
 
   /**grc338 ADDED PORTION BEGINS**/
   assign company_city  = ""
         company_state = ""
         company_zip   = "".
   /**grc338 ADDED PORTION ENDS**/
   if comp_addr <> "" then do:
      find ad_mstr where ad_mstr.ad_domain = global_domain
          and ad_addr = comp_addr
      no-lock no-wait no-error.
 
      if available ad_mstr then do:
 
         find ls_mstr
            where ls_mstr.ls_domain = global_domain
             and  ls_addr = ad_addr
             and  ls_type = "company"
         no-lock no-error.
 
         if not available ls_mstr then do:
            /* Not a valid company */
            {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
            next-prompt comp_addr with frame a.
            undo , retry.
         end.
 
         /* Assign addr values and format address */
         {us/mf/mfadfmt.i}
 
         assign
            company[1] = addr[1]
            company[2] = addr[2]
            company[3] = addr[3]
            company[4] = addr[4]
            company[5] = addr[5]
            company[6] = addr[6].
 
         {us/gp/gpvtecrg.i}
/*grc338*/ {us/xf/xfaddr.i "company"}
      end.
 
      else do:
         /* Not a valid company */
         {us/bbi/pxmsg.i &MSGNUM=28 &ERRORLEVEL=3}
         next-prompt comp_addr with frame a.
         undo , retry.
      end.
 
   end.
 
   if auto_inv then do:
      if form_code = "11" then
         prt_width = 132.
      else
         prt_width = 80.
 
      /* Show print setings frame */
      {us/so/soprstfr.i &New="new"
                  &ShowFrame=yes
                  &ParentFrame=a
                  &PrintTax=yes
                  &PrintWidth=prt_width}
 
 /*grc338
      {us/gp/gpselout.i
         &printType = "printer"
         &printWidth = prt_width
         &pagedFlag = " "
         &stream = " "
         &appendToFile = " "
         &streamedOutputToTerminal = " "
         &withBatchOption = "no"
         &displayStatementType = 1
         &withCancelMessage = "no"
         &pageBottomMargin = 6
         &withEmail = "yes"
         &withWinprint = "yes"
         &defineVariables = "no"}
 ***grc338 ***/

 /**grc338 add start */
      {us/gp/gpselout.i
         &printType = "printer"
         &printWidth = prt_width
         &pagedFlag = " "
         &stream = "stream ft"
         &appendToFile = " "
         &streamedOutputToTerminal = " "
         &withBatchOption = "no"
         &displayStatementType = 1
         &withCancelMessage = "no"
         &pageBottomMargin = 6
         &withEmail = "yes"
         &withWinprint = "yes"
         &defineVariables = "no"}

      {us/xf/xfoutnul.i}

 /**grc338 add end */

   end.
 
   {us/gp/gprfile.i}
 
   if auto_inv 
   then
      l_inv_ct = 0.
   /*OOPS, GOTTA SAY WE CAN PRINT THE INVOICES*/
   do i = 1 to order_ct transaction:
 
      order_num = if (i <= 30) then
         order_nbrs[i]
      else
         entry(i - 30,order_nbr_list).
 
      find so_mstr where so_mstr.so_domain = global_domain
          and so_nbr = order_num
          and so_compl_stat = ""
      exclusive-lock.
 
      if auto_inv 
      then do:
         if (l_consolidate and i = 1)
            or l_consolidate = false
         then do:
            assign
               so_recno     = recid(so_mstr)
               next_inv_pre = soc_inv_pre
               next_inv_nbr = soc_inv - 1.
            {us/bbi/gprun.i ""sosoina.p""}
            assign
               l_new_inv_nbr = so_inv_nbr
               l_inv_ct      = l_inv_ct + 1.
            {us/bbi/gprun.i ""sorp10b.p""}
         end. /* IF (l_consolidate AND i = 1) OR l_consolidate = false */
         if l_inv_ct <= 30 
         then
            p_inv_nbrs[l_inv_ct] = l_new_inv_nbr.
         else
            p_inv_nbr_list = p_inv_nbr_list + l_new_inv_nbr + ",".
         so_inv_nbr = l_new_inv_nbr.
      end. /* IF auto_inv THEN */
      /* ASSIGN so_to_inv to YES OR NO DEPENDING ON VALUES STORED IN */
      /* TEMP-TABLE FROM rcsois1.p, rcsois2.p OR rcauis01.p          */
      for first tt_somstr
         where  tt_sonbr = so_nbr
      no-lock:
         so_to_inv = tt_somstr.tt_sotoinv.
      end. /* FOR FIRST tt_somstr */
 
      if recid(so_mstr) = -1 then .
 
   end.
   /* THIS DUMMY FIND STATEMENT IS INTRODUCED FOR ORACLE, */
   /* IT MAKES FIND NEXT IN SORP1001.P TO SUCCESSFULLY FIND THE NEXT */
   /* RECORD TILL THE LAST ORDER NUMBER */
   for last so_mstr  where so_domain = global_domain and
                           so_nbr = order_num and
                           so_compl_stat = ""
   no-lock: end.
 
   /* SET THE LOW (nbr) AND HIGH (nbr1) ORDER NUMBER RANGE */
   nbr = order_nbrs[1].
   nbr1 = if ( order_ct <= 30) then
             order_nbrs[order_ct]
          else
             entry(order_ct - 30,order_nbr_list).
   undo_nota = no.

   /*grc338   {us/bbi/gprun.i " ""sorp10"" + run_file + "".p"" "} */
   /*grc338*/ {us/bbi/gprun.i " ""xfrp10"" + run_file + "".p"" "}

   /* CUSTOMIZED SECTION FOR VERTEX BEGIN */
   if can-find(first qad_wkfl
               where qad_domain = global_domain
               and   qad_key1   = "l_vertex_message"
               and   qad_key2   = "yes"
               and   qad_key3   = "rcsois.p"
               and   qad_key4   = SessionUniqueID)
   then do:
 
      /* DISPLAY A MESSAGE IN THE AUDIT TRAIL */
 
      /* API FUNCTION FAILURE. VERTEX REGISTER DB DID NOT UPDATE. */
      {us/bbi/pxmsg.i &MSGNUM=8882 &ERRORLEVEL=1}
 
      /* VERIFY THE DATA IN THE VERTEX REGISTER. */
      {us/bbi/pxmsg.i &MSGNUM=8883 &ERRORLEVEL=1}
 
   end. /* IF l_vtx_message */
   /* CUSTOMIZED SECTION FOR VERTEX END */
 
   if undo_nota then do:
      /* ERROR: Invoice has # lines. # lines allowed. */
      {us/bbi/pxmsg.i &MSGNUM=1922 &ERRORLEVEL=4
               &MSGARG1=body_count
               &MSGARG2=max_lines}
      batchrun = yes.
      undo_stat = yes.
      leave.
   end.
 
   leave.
 
end.
 
hide frame a.
