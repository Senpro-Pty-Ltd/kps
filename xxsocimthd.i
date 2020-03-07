/* xxsocimthd.i - CORRECTION INVOICE HEADER MAINTENANCE                      */
/* socimthd.i - CORRECTION INVOICE HEADER MAINTENANCE                        */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsocimthd.i,v 1.3 2018/03/14 14:07:27 gbg Exp $: */
/* Revision: 1.2        BY: Ed van de Gevel       DATE: 03/01/05  ECO: *R00G* */
/* Revision: 1.7        BY: Ed van de Gevel       DATE: 04/22/05  ECO: *R015* */
/* Revision: 1.8        BY: Ed van de Gevel       DATE: 07/01/05  ECO: *R01H* */
/* Revision: 1.9        BY: Jean Miller           DATE: 07/05/07  ECO: *R0C5* */
/* Revision: 1.11      BY: Jean Miller            DATE: 10/03/07  ECO: *R0C6* */
/* Revision: 1.12      BY: Sumit Karunakaran      DATE: 10/06/08  ECO: *R15G* */
/* Revision: 1.13      BY: Jean Miller            DATE: 09/09/09  ECO: *R1QZ* */
/* CYB                   LAST MODIFIED: 14-NOV-2012 BY: gbg *cy1020*  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 03-MAR-2013    BY:  gbg *c1369*                      */
/* CYB   LAST MODIFIED: 15-FEB-2018    BY: gbg *K10017b*                      */
/*-Revision end---------------------------------------------------------------*/

PROCEDURE ip_corr_inv:
   define variable isvalid     like mfc_logical no-undo.
   define variable mstr_inv    like ih_inv_nbr  no-undo.
   define variable l_old_nbr like ih_nbr no-undo.

/*cy1020*  start deleted code >>>>
   corr_inv = no.
   display inv_org with frame b.

   do on error undo, retry with frame f_cor_inv:

      pause 0.
      view frame f_cor_inv.

      if new_order then do:

         update inv_org with frame f_cor_inv editing:
            {us/mf/mfnp01.i ih_hist inv_org ih_inv_nbr ih_inv_nbr  "
            ih_hist.ih_domain = global_domain and ih_inv_nbr "
            ih_inv_nbr}
            if recno <> ? then
               display
                  ih_inv_nbr @ inv_org
                  ih_nbr     @ org_nbr with frame f_cor_inv.
         end.

         find first ih_hist where ih_domain = global_domain and
                                  ih_inv_nbr = inv_org
         no-lock no-error.

         if available ih_hist then
            org_nbr = ih_nbr.
         else
            org_nbr = "".

         if available ih_hist then do:
            assign
               so_mstr.so_bill = ih_bill
               so_cust = ih_cust
               so_ship = ih_ship.
            pause 0.
            display so_bill so_cust so_ship with frame a.
            {us/mf/mfaddisp.i so_cust sold_to}
            {us/mf/mfaddisp.i so_ship ship_to}
            pause 0.
         end.

         l_old_nbr = org_nbr.

         if inv_org  <> "" then
            update org_nbr with frame f_cor_inv editing:
            {us/mf/mfnp01.i ih_hist org_nbr ih_nbr inv_org  " ih_hist.ih_domain =
            global_domain and ih_inv_nbr "
             ih_inv_nbr}
            if recno <> ? then
               display
                  ih_nbr @ org_nbr
               with frame f_cor_inv.
         end.

         if l_old_nbr <> org_nbr then do:
            find first ih_hist where ih_domain = global_domain and
                                     ih_inv_nbr = inv_org and
                                     ih_nbr = org_nbr
            no-lock no-error.
            if available ih_hist then do:
               assign
                  so_mstr.so_bill = ih_bill
                  so_cust = ih_cust
                  so_ship = ih_ship.
               pause 0.
               display so_bill so_cust so_ship with frame a.
               {us/mf/mfaddisp.i so_cust sold_to}
               {us/mf/mfaddisp.i so_ship ship_to}
               pause 0.
            end.
         end.

         /* Determine Master Invoice Number - (Original) */
         find last cil_mstr where cil_domain = global_domain
            and cil_prev_inv = inv_org
            and cil_prev_so_nbr = org_nbr
         no-lock no-error.

         if not available cil_mstr then
            find first cil_mstr where cil_domain = global_domain
                                  and cil_cor_inv = inv_org
            no-lock no-error.

         assign
            mstr_inv = if available cil_mstr then cil_mstr_inv
                       else inv_org.

         l_old_nbr = "".
         if inv_org <> "" or org_nbr <> "" then do:

            run ip_check_invoice
               (input  inv_org,
                input  org_nbr,
                input  mstr_inv,
                output isvalid).
            if DInvoiceStatus:Available then
               delete object DInvoiceStatus.
            if  isvalid = false then do:
                pause.
                undo, retry.
            end.

            create cil_mstr.
            assign
               cil_domain = global_domain
               cil_prev_inv = inv_org
               cil_prev_so_nbr = org_nbr
               cil_cor_so_nbr  = so_mstr.so_nbr
               cil_mstr_inv = mstr_inv
               cil_mod_date = today
               cil_mod_userid = global_userid.

            find ih_hist where ih_domain = global_domain
                           and ih_inv_nbr = inv_org
                           and ih_nbr     = org_nbr
            no-lock no-error.

            assign
               so_ord_date    = ih_ord_date
               so_print_so    = ih_print_so
               so_req_date    = ih_req_date
               so_pr_list     = ih_pr_list
               so_cr_card     = ih_cr_card
               so_cr_init     = ih_cr_init
               promise_date   = ih_due_date
               so_cr_terms    = ih_cr_terms
               so_curr        = ih_curr
               so_disc_pct    = ih_disc_pct
               so_shipvia     = ih_shipvia
               so_partial     = ih_partial
               so_site        = ih_site
               so_taxable     = ih_taxable
               so_taxc        = ih_taxc
               so_tax_date    = ih_tax_date
               so_tax_env     = ih_tax_env
               so_tax_pct[1]  = ih_tax_pct[1]
               so_tax_pct[2]  = ih_tax_pct[2]
               so_tax_pct[3]  = ih_tax_pct[3]
               so_tax_usage   = ih_tax_usage
               so_due_date    = ih_due_date
               so_channel     = ih_channel
               so_fix_rate    = ih_fix_rate
               so_fix_pr      = ih_fix_pr
               so_pricing_dt  = ih_pricing_dt
               so_project     = ih_project
               so_po          = ih_po
               so_rmks        = ih_rmks
               so_userid      = global_userid
               so_slspsn[1]   = ih_slspsn[1]
               so_slspsn[2]   = ih_slspsn[2]
               so_slspsn[3]   = ih_slspsn[3]
               so_slspsn[4]   = ih_slspsn[4]
               so_comm_pct[1] = ih_comm_pct[1]
               so_comm_pct[2] = ih_comm_pct[2]
               so_comm_pct[3] = ih_comm_pct[3]
               so_comm_pct[4] = ih_comm_pct[4]
               so_fr_list     = ih_fr_list
               so_fr_terms    = ih_fr_terms
               so_fr_min_wt   = ih_fr_min_wt
               so_conf_date   = ih_conf_date
               so_lang        = ih_lang
               so_fob         = ih_fob
               so_pr_list2    = ih_pr_list2
               so_bol         = ih_bol
               so_trl1_cd     = ih_trl1_cd
               so_trl2_cd     = ih_trl2_cd
               so_trl3_cd     = ih_trl3_cd.

            if recid(cil_mstr)    = -1 then .

            {us/bbi/gprun.i ""gpsiver.p""
               "(input so_site,
                 input ?,
                 output return_int)"}

            if return_int = 0 then do:
                /*USER DOESN'T HAVE ACCESS*/
                {us/bbi/pxmsg.i &MSGNUM=2711
                         &ERRORLEVEL=2
                         &MSGARG1= so_site}
                so_site = "".
            end.

            /* GET DEFAULT TERMS INTEREST FOR ORDER */
            socrt_int = 0.
            if so_cr_terms <> "" then do:
                find ct_mstr where ct_domain = global_domain and
                                   ct_code = so_cr_terms
                no-lock no-error.
                if available ct_mstr then socrt_int = ct_terms_int.
            end.

            if so_slspsn[2] <> "" or
               so_slspsn[3] <> "" or
               so_slspsn[4] <> ""
            then
               mult_slspsn = true.
            else
               mult_slspsn = false.

            if so_conf_date = ? then
               confirm = no.
            else
               confirm = yes.

            run p-disp-b.
            display cil_cor_rsn.

         end.

      end.

      find cil_mstr where cil_domain = global_domain and
                          cil_cor_so_nbr = so_nbr
      exclusive-lock no-error.

      if available cil_mstr then do on error undo, retry:
         update cil_cor_rsn editing:
             {us/mf/mfnp01.i rsn_ref cil_cor_rsn rsn_code "'CORRINV':U"  "
             rsn_ref.rsn_domain = global_domain and rsn_type "  rsn_type}
             if recno <> ? then
                display rsn_code @ cil_cor_rsn.
         end.

         if cil_cor_rsn <> ""
         and not can-find(first rsn_ref where rsn_domain = global_domain
                                          and rsn_code = cil_cor_rsn
                                          and rsn_type = "CORRINV":U)
         then do:
            /* INVALID REASON CODE */
            {us/bbi/pxmsg.i &MSGNUM=655
                     &ERRORLEVEL=3}
            next-prompt cil_cor_rsn with frame f_cor_inv.
            undo, retry.
         end.

         assign
            corr_inv               = yes
            using_cust_consignment = no.
      end.

   end. /*DO ON ERROR*/

*cy1020*  end   deleted code <<<< */
END PROCEDURE.

PROCEDURE ip_check_invoice:
   define input  parameter p_inv_org  like ih_inv_nbr  no-undo.
   define input  parameter p_org_nbr  like ih_nbr      no-undo.
   define input  parameter p_mstr_inv like ih_inv_nbr no-undo.
   define output parameter p_isvalid  like mfc_logical no-undo.

   define variable first-uncorrected as        logical no-undo.
   define variable l_continue        like  mfc_logical no-undo.

   define variable l_year            as integer       no-undo.
   define variable l_daybookcode     as character     no-undo.
   define variable l_voucher         as integer       no-undo.

   /* Verify the Master Invoice is not closed */
   run getInvoiceComponents(input  p_mstr_inv,
                            output l_year,
                            output l_daybookcode,
                            output l_voucher).
   find first en_mstr no-lock
      where en_mstr.en_domain = global_domain  and
            en_mstr.en_primary  = yes 
   no-error.

   /* Run the data object class to get the Invoice Status */
   /* Parameters: CompanyId, CompanyCode, Year, DaybookCode, Voucher */
   do on error undo, throw:     
      DInvoiceStatus = new GetDInvoiceStatus(?,en_entity,l_year,l_daybookcode,l_voucher).   
      catch anError as Progress.Lang.Error:        
         /* Start qflib.p - QAD Financials Library running persistently */
         run mfairunh.p
            (input 'qflib.p',
             input '?',
             output hQADFinancialsLib) no-error.
         run processExceptions in hQADFinancialsLib (input anError).  
         p_isvalid = false.
         return.
      
      end catch. 
   end. 
   if not DInvoiceStatus:Available
   then do:
      p_isvalid = false.
      return.
   end.
   if DInvoiceStatus:DInvoiceIsOpen = no  
      and (can-find (first soc_ctrl 
           where soc_ctrl.soc_dom    = global_domain 
             and soc_ctrl.soc__qad03 <> 1))
   then do:
      /* PAYMENT AGAINST THIS INVOICE IS COMPLETE */
      {us/bbi/pxmsg.i &MSGNUM=8325 &ERRORLEVEL=3}
      p_isvalid = false.
      return.
   end.
   /* If Invoice is not Closed or if paid invoice correction is allowed, Check other Restrictions */
   else do:
      p_isvalid = false.

      find first cil_mstr where cil_domain = global_domain
                            and cil_prev_inv = p_inv_org
                            and cil_prev_so_nbr = p_org_nbr
                            and cil_cor_inv = ""
      no-lock no-error.
      if available cil_mstr then do:
         /* Corrected Sales Order Exists for this Invoice */
         {us/bbi/pxmsg.i &MSGNUM=5350 &ERRORLEVEL=3}
         return.
      end.

      find ih_hist where ih_domain = global_domain
         and ih_inv_nbr = p_inv_org
         and ih_nbr     = p_org_nbr
      no-lock no-error.

      if not available ih_hist then do:
         /* Invoice Does not Exist */
         {us/bbi/pxmsg.i &MSGNUM=8113 &ERRORLEVEL=3}
         return.
      end.
      else if ih_fsm_type <> "" then do:
         /* Cannot correct SSM Invoices */
         {us/bbi/pxmsg.i &MSGNUM=6783 &ERRORLEVEL=3}
         return.
      end.

      if can-find(first cncix_mstr where cncix_domain = global_domain
             and cncix_so_nbr = p_org_nbr) or
         can-find(first cncu_mstr where cncu_domain  = global_domain
             and cncu_so_nbr  = p_org_nbr)
      then do:
         /* Cannot create a correction invoice for a consignment order */
         {us/bbi/pxmsg.i &MSGNUM=6589 &ERRORLEVEL=3}
         return.
      end.

      if so_mstr.so_bill <> ih_bill
         or so_mstr.so_ship <> ih_ship
         or so_mstr.so_cust <> ih_cust
      then do:
         /* Invoice not for this customer */
         {us/bbi/pxmsg.i &MSGNUM=8114 &ERRORLEVEL=3}
         return.
      end.
      
      if not can-find (first tr_hist where tr_domain = global_domain
         and tr_nbr  = ih_nbr
         and tr_rmks = ih_inv_nbr
         and (tr_type = "ISS-SO" or tr_type = "ISS-COR")
         use-index tr_nbr_eff)
      then do:
         /* Transaction history for invoice has been deleted */
         {us/bbi/pxmsg.i &MSGNUM=5351 &ERRORLEVEL=2}
      end.

      if can-find(first ibh_hist where ibh_domain  = global_domain
         and ibh_inv_nbr = ih_inv_nbr
         and ibh_nbr     = ih_nbr)
      then do:
         /* Cannot create correction invoice: configured item in orig inv */
         {us/bbi/pxmsg.i &MSGNUM=6784 &ERRORLEVEL=3}
         return.
      end.

      if can-find(first abscc_det where abscc_domain  = global_domain
           and abscc_inv_nbr = ih_inv_nbr
           and abscc_order   = ih_nbr)
      then do:
         /* Cannot create correction invoice: container charge in orig inv */
         {us/bbi/pxmsg.i &MSGNUM=6785 &ERRORLEVEL=3}
         return.
      end.

      if can-find(first idhlc_hist
         where idhlc_domain  = global_domain
           and idhlc_inv_nbr = ih_inv_nbr)
      then do:
         {us/bbi/pxmsg.i &MSGNUM=6786 &ERRORLEVEL=3} /*LINE CHARGE*/
         return.
      end.

      first-uncorrected = false.
      for each idh_hist where idh_hist.idh_domain = global_domain
         and idh_inv_nbr = ih_inv_nbr
         and idh_nbr     = ih_nbr
      no-lock:
         find first cild_det where cild_det.cild_domain = global_domain
            and cild_prev_inv    = ih_inv_nbr
            and cild_prev_so_nbr = ih_nbr
            and cild_prev_line   = idh_line
         no-lock no-error.
         if not available cild_det then
            first-uncorrected = true.
      end.
      /* INVOICE WITH TRAILER AMOUNTS NEED TO BE VERIFIED */
      if not first-uncorrected and 
         ih_trl1_amt = 0 and
         ih_trl2_amt = 0 and
         ih_trl3_amt = 0 
      then do:
         /* All Invoice lines already corrected */
         {us/bbi/pxmsg.i &MSGNUM=5352 &ERRORLEVEL=3}
         return.
      end.
      /* If Invoice is closed then display warning */
      if DInvoiceStatus:DInvoiceIsOpen = no
      then do:
         /* PAYMENT AGAINST THIS INVOICE IS COMPLETE */
         {us/bbi/pxmsg.i &MSGNUM=8325 &ERRORLEVEL=2}
         /* Continue? */
         {us/bbi/pxmsg.i &MSGNUM=2316 &ERRORLEVEL=1 &CONFIRM=l_continue}
         if NOT l_continue then do:
            p_isvalid = false.
            return.
         end.
      end.
      p_isvalid = true.
   end. /* ELSE DO*/

END PROCEDURE.

PROCEDURE p-disp-b:

   if new_order then
      socmmts = if this-is-rma then
                rmc_ctrl.rmc_hcmmts
                else soc_ctrl.soc_hcmmts.
   else
      socmmts = (so_mstr.so_cmtindx <> 0).

   if not new_order then socrt_int = so__qad02.

   find first cil_mstr where cil_domain = global_domain and
                             cil_cor_so_nbr = so_nbr
   no-lock no-error.
   assign inv_org = if available cil_mstr then cil_prev_inv
                    else "".

   setFrameLabels(frame b:handle).

   display
      so_ord_date
      line_pricing
      confirm
      so_conf_date
      so_req_date
      so_pr_list
      so_curr
      so_lang
      promise_date
      so_site
      so_taxable
      so_taxc
      so_tax_date
      so_due_date
      so_channel
      so_fix_pr
      so_pricing_dt
      so_project
      so_cr_terms
      so_po
      socrt_int
      so_rmks
      reprice
/*cy1020*/  so__chr01
/*cy1020*       inv_org */
   with frame b.
END PROCEDURE.

PROCEDURE ectrl_1162:
   define input parameter ip_nbr like so_nbr.

   find first soc_ctrl where soc_domain = global_domain no-lock no-error.

   find first cil_mstr where cil_mstr.cil_domain = global_domain and
                             cil_cor_so_nbr = ip_nbr
   no-lock no-error.

   if available cil_mstr
      and soc_use_corr_inv = true
   then
      display
         cil_prev_inv    @ inv_org
         cil_prev_so_nbr @ org_nbr
         cil_cor_rsn
      with frame f_cor_inv.
   else
      hide frame f_cor_inv no-pause.

   if soc_use_corr_inv then
      assign
         inv_org = if available cil_mstr then cil_prev_inv else ""
         org_nbr = if available cil_mstr then cil_prev_so_nbr else "".

END PROCEDURE.

PROCEDURE getInvoiceComponents:
/*--------------------------------------------------------------------------
   Purpose      : This procedure takes the invoice number as the input and
                  breaks it out into the separate components that make it up
                  and returns these values

   Parameters   : input  pcInvoiceRef
                : output piYear
                  output pcDaybookCode
                  output piVoucherNum
   Notes        :
  ------------------------------------------------------------------------*/
   define input  parameter pcInvoiceRef   as character format "x(22)"     no-undo.
   define output parameter piYear         as integer   format "9999"      no-undo.
   define output parameter pcDaybookCode  as character format "x(8)"      no-undo.
   define output parameter piVoucherNum   as integer   format "999999999" no-undo.

   define variable         iLength        as integer                      no-undo.
   define variable         iStartInt      as integer                      no-undo.
   define variable         iDaybookLength as integer                      no-undo.

   /* INITIALIZE VALUES */
   assign
      piYear        = 0
      pcDaybookCode = ""
      piVoucherNum  = 0
      iLength        = length(pcInvoiceRef)
      iStartInt      = (iLength - 9) + 1 /* start pos' for voucher integer */
      iDaybookLength = iLength - 14.     /* 14 is length of constant strings */

   if length(pcInvoiceRef) > 8 then
   /* EXTRACT THE VARIOUS VALUES FROM THE INVOICE REFERENCE */
   assign
      piYear        = integer(substring(pcInvoiceRef,1,4))
      pcDaybookCode = substring(pcInvoiceRef,6,iDaybookLength)
      piVoucherNum  = integer(substring(pcInvoiceRef,iStartInt,9)).

/*k10017b* start deleted code >>>>>
*  /*c1369* start added code */
*  /* XS woa 15 Febr 2010 ********************************************/
*  /* 9DIGIT keep only the last 9 digits                             */
*  
*  else 
*  if length(pcInvoiceRef) = 9
*  then do:
*       assign pcDaybookCode = substring(pcInvoiceRef,1,1)
*  	    piVoucherNum  = integer(pcInvoiceRef).
*       find DInvoice where
*            DInvoice.DInvoiceVoucher = piVoucherNum no-lock no-error.
*       if available DInvoice
*       then assign piYear = DInvoice.DInvoicePostingYear.
*  end.
*  
*  /* XS woa 15 Febr 2010 ********************************************/
*  /*c1369* end   added code */
*k10017b* end deleted code <<<< */

END PROCEDURE.
