/* xxiv1001rpt.i - Invoice Print/Reprint                                     */
/* soiv1001rpt.i - Invoice Print/Reprint                                     */
/* Copyright 2010 QAD Inc. All rights reserved.                              */
/* $Id:: soiv1001rpt.i 47263 2014-09-05 13:30:58Z p8k                     $: */
/*-Revision end--------------------------------------------------------------*/
{com/qad/shell/report/reports/soivrp1arpt.i}


procedure RunInvoice:
   

define buffer ih_hist      for ih_hist.

define variable l_statutory_curr     as character no-undo.
define variable l-statpropertyisstat as logical   no-undo.
 
define variable queryString as character no-undo.
define variable hIHBQuery as handle.
define query IHBQuery for ih_buff.

define variable frtermsdesc         as character no-undo.
define variable lcovatreglbl        as character format "x(12)" no-undo.
define variable lcovatreg           as character format "x(16)" no-undo.

{{&US_BBI}gprun.i ""gpctryfmt.p"" "persistent set h_format"}

{{&US_PX}pxrun.i &PROC  = 'getStatutoryCurrency'
            &PROGRAM='pccalcxr.p'
            &handle = ph_pccalcxr
            &PARAM = "(output s_currency,
                       output lStatIsFallBack)"
            &NOAPPERROR=true
            &CATCHERROR=true}

for first txc_ctrl
   where txc_domain = global_domain
no-lock:
end.

assign l_tax_total_message[1] = getTermLabel("TOTAL_TAX",9)
                              + " "
                              + getTermLabel("IN",2)
       l_tax_total_message[2] = getTermLabel("TOTAL_TAX",9).
       

create ttCreditCardMsg.
/* **NOTE: The customer has promised to pay using a credit card */
{{&US_BBI}pxmsg.i &MSGNUM=3867 &ERRORLEVEL=1 &MSGBUFFER=ttCreditCardMsg.fCreditCardMsg_1}
/* The card used at order time will be processed for payment */
{{&US_BBI}pxmsg.i &MSGNUM=3868 &ERRORLEVEL=1 &MSGBUFFER=ttCreditCardMsg.fCreditCardMsg_2}
/* Customer is responsible for payment if credit card is denied */
{{&US_BBI}pxmsg.i &MSGNUM=3869 &ERRORLEVEL=1 &MSGBUFFER=ttCreditCardMsg.fCreditCardMsg_3}


find first rmc_ctrl where rmc_domain = global_domain no-lock no-error.

assign lcovatreglbl = covatreglbl
       lcovatreg    = covatreg.

mainloop:
do:
   queryString = "for each ih_buff no-lock where ih_buff.ih_domain = " + quoter(global_domain).
   queryString = queryString + " and ( " + string(in_override_print_hist) + " or ih_inv_mthd = ~"~" or ih_inv_mthd begins ~" ~" or ih_inv_mthd begins ~"b~" or ih_inv_mthd begins ~"p~" or not ih_invoiced)".
   run AddSpecificConditions in reportHandle(
         "ttReportOptions", "inv:ih_buff.ih_inv_nbr,shipdate:ih_buff.ih_ship_date,inv_date:ih_buff.ih_inv_date,
                              cust:ih_buff.ih_cust,bill:ih_buff.ih_bill,ship:ih_buff.ih_ship,site:ih_buff.ih_site,daybook:ih_buff.ih_daybook,
                              inv_batch:ih_buff.ih_batch,lang:ih_buff.ih_lang,shipvia:ih_buff.ih_shipvia", input-output queryString).  /*added shipvia - VX001*/
   queryString = queryString + " and ((( ih_buff.ih_nbr >= " + quoter(in_dnbr) + " and ih_buff.ih_nbr <= " + quoter(in_dnbr1) + " )".
   queryString = queryString + " or ( ih_buff.ih_nbr >= " + quoter(in_nbr) + " and ih_buff.ih_nbr <= " + quoter(in_nbr1) + " ))".
   queryString = queryString + " and ( true".
   run AddSpecificConditions in reportHandle(
         "ttReportOptions", "nbr:ih_buff.ih_nbr", input-output queryString).
   queryString = queryString + " )) break by ih_buff.ih_inv_nbr:".
   
   hIHBQuery = query IHBQuery:handle.
   hIHBQuery:query-prepare(queryString).
   hIHBQuery:query-open().
   SetGroupNamesForQry(input hIHBQuery, input "ih_buff.ih_inv_nbr").
   hIHBQuery:get-next().
   
   repeat while not hIHBQuery:query-off-end:
      if not in_reprint then
         if ih_buff.ih_invoiced then do:
            hIHBQuery:get-next().
            next.
         end.
        
      isDomOrder = false.
      {{&US_BBI}gprun.i ""sodomxr.p""
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
         
      if dom-proc = 1 and     /* DOM ORDER ENTERED AND NO DOMAIN ORDERS */
       isDomOrder = false then do:
         hIHBQuery:get-next().
         next.
      end.
      
      /* Although it is intended to skip non-dom orders when only dom order */
      /* range is entered, the report should print all domain orders in the */
      /* range when domain order range is entered,regardless of their       */
      /* origin(DOM or MFG/PRO.)                                            */

      assign
         l_skip_rec         = no
         l_nontax_amt       = 0
         l_tax_amt          = 0
         isConsolDom        = false.
         
      {{&US_GP}gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
         "(input  ih_curr,
           output rndmthd,
           output mc-error-number)"}
           
      if mc-error-number <> 0
      then do:
         {{&US_BBI}pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=3}
         hIHBQuery:get-next().
         next.
      end. /* IF mc-error-number <> 0 */
      
       /* EXCLUDE CREDIT/DEBIT INVOICE */
      if not in_incinv
         or not in_incmemo
      then do:

         /* OBTAIN TOTAL INVOICE VALUE */
         if FirstOfName(input hIHBQuery, input "ih_buff.ih_inv_nbr")
         then
            run p-get-ord-amt(input  ih_buff.ih_inv_nbr,
                              output ord_amt).

         /* SKIP THE DEBIT/CREDIT INVOICE */
         if (not in_incinv
             and ord_amt    >= 0)
            or (not in_incmemo
                and ord_amt  < 0)
         then
            l_skip_rec = yes.

      end. /* IF NOT incinv OR ... */
      
      if l_skip_rec then do:
         hIHBQuery:get-next().
         next.
      end.
      
      isDomOrder = false.
      {{&US_BBI}gprun.i ""sodomxr.p""
               "(input ih_buff.ih_nbr,
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

      /* FETCHES THE Statutory CURRENCY */
      {{&US_GP}gprunp.i "fapl" "p" "fa-getstatutorycurrency"
        "(output l_statutory_curr,
          output l-statpropertyisstat)"} 
         
      /* InvoiceCerification 20110405 : Fill the new variable with the invoice-certificate text that needs to be printed on the invoice for the Portugese decree-363 ; this will be printed on the forms defined in soivhfrm.i */  
      /* This text needs to be printed in portugese regardless the language used for the other parts of the print and regardless the langauge of the user. It can thus be that the user is working in English, the print is requested in Dutch but even in this scenario this fixed text should be in Portugese */
      if ih_buff.ih__qadc05 <> "":U and 
         ih_buff.ih__qadc05 <> ?    and 
         num-entries(ih__qadc05,chr(4)) = 2
      then assign vcInvoiceCertificationText = trim(entry(2,ih__qadc05,chr(4))) + "-Processado por Programa Certificado n. ":U + trim(entry(1,ih__qadc05,chr(4))) + "/DGCI":U
                  vcInvoiceYearVoucherNumber = substring(ih_inv_nbr,1,4) + substring(ih_inv_nbr,6,length(ih_inv_nbr) - 14) + "/" + substring(ih_inv_nbr,length(ih_inv_nbr) - 8).
      else assign vcInvoiceCertificationText = "":U
                  vcInvoiceYearVoucherNumber = ih_buff.ih_inv_nbr.

      assign covatreglbl = lcovatreglbl
             covatreg    = lcovatreg.

      /*CHECK IF SITE COMPANY ADDRESS HAS A STATE TAX ID */
      for first ad_mstr 
         where ad_domain = global_domain 
           and ad_addr   = ih_buff.ih_site 
      no-lock:
         if     ad_pst_id <> "":U 
            and ad_pst_id <> ? 
            and can-find (first ls_mstr 
                             where ls_domain = global_domain
                               and ls_addr = ad_addr
                               and ls_type = "company")
         then do:
            /* FIND VAT REG. NO & COUNTRY CODE */
            {us/gp/gpvtecrg.i}
         end.   /* IF     ad_pst_id */
      end.   /* FOR FIRST ad_mstr  */

     find first ttRptHeader 
        where ttRptHeader.fih_inv_nbr = ih_buff.ih_inv_nbr 
     no-lock no-error.
     if not available ttRptHeader
     then do:
        create ttRptHeader.
        assign
           ttRptHeader.fSubLink   = GetNextLink()
           ttRptHeader.fih_rev    = string(ih_buff.ih_rev)
           ttRptHeader.fCompany1  = company[1]
           ttRptHeader.fCompany2  = company[2]
           ttRptHeader.fCompany3  = company[3]
           ttRptHeader.fCompany4  = company[4]
           ttRptHeader.fCompany5  = company[5]
           ttRptHeader.fCompany6  = company[6]
           ttRptHeader.fNotCorr   = true
           ttRptHeader.fvcInvoiceYearVoucherNumber = if isDomOrder then ih_buff.ih_inv_nbr else vcInvoiceYearVoucherNumber
           ttRptHeader.fvcInvoiceCertificationText = vcInvoiceCertificationText
           ttRptHeader.fih_inv_date = ih_buff.ih_inv_date
           ttRptHeader.fShipFrom = ih_buff.ih_site           
           ttRptHeader.fSoldTo    = ih_buff.ih_cust
           ttRptHeader.fBillTo    = ih_buff.ih_bill
	   ttRptHeader.fShipTo    = ih_buff.ih_ship
           ttRptHeader.fcovatreglbl = covatreglbl
           ttRptHeader.fent_ord_bill  = if isDomOrder then ent_ord_bill else ""
           ttRptHeader.fcovatreg  = covatreg
           ttRptHeader.fvatreglbl = vatreglbl
           ttRptHeader.fvatreg    = vatreg
           ttRptHeader.fmsg       = in_msg
           ttRptHeader.fih_nbr    = ih_buff.ih_nbr
           ttRptHeader.fih_po     = ih_buff.ih_po
           ttRptHeader.fStatutoryCurr = l_statutory_curr
           
           .

        run GetHeading(output ttRptHeader.fTitle).
      end. /* FIND FIRST ttRptHeader */

      find ad_mstr
         where ad_domain = global_domain
          and  ad_addr = ih_buff.ih_bill
      no-lock no-wait no-error.
      assign addr = "".
      if available ad_mstr then do:

         /* Assign values to addr and format */
         {{&US_MF}mfadfmt.i}

         for first cm_mstr where cm_domain = global_domain
            and cm_addr   = ih_bill
         no-lock: end.

         /* Use bill-to country's format */
         run setFormatForCountryCode in h_format
            (input cm_lang,
             input ad_mstr.ad_ctry).

         assign
            ttRptHeader.fBillTo1 = addr[1]
            ttRptHeader.fBillTo2 = addr[2]
            ttRptHeader.fBillTo3 = addr[3]
            ttRptHeader.fBillTo4 = addr[4]
            ttRptHeader.fBillTo5 = addr[5]
            ttRptHeader.fBillTo6 = addr[6]
            .

         hdr_po = getTermLabel("PURCHASE_ORDER",14) + ": " + ih_buff.ih_po.

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

      find ad_mstr where ad_domain = global_domain
          and  ad_addr = ih_buff.ih_cust
      no-lock no-wait no-error.
      update addr = "".

      if available ad_mstr then do:

         /* Assign values to addr and format */
         {{&US_MF}mfadfmt.i}

         assign
            ttRptHeader.fSoldTo1 = addr[1]
            ttRptHeader.fSoldTo2 = addr[2]
            ttRptHeader.fSoldTo3 = addr[3]
            ttRptHeader.fSoldTo4 = addr[4]
            ttRptHeader.fSoldTo5 = addr[5]
            ttRptHeader.fSoldTo6 = addr[6]
            .

         find cm_mstr where cm_domain = global_domain
              and cm_addr = ih_buff.ih_cust
         no-lock no-error.
         if available cm_mstr then
            resale = cm_resale.
         else
            resale = "".
      end. /* IF AVAIL ad_mstr */
      
      first-invoice = if FirstOfName(input hIHBQuery, input "ih_buff.ih_inv_nbr") then yes else no.
      
      for first cil_mstr
         where cil_domain     = global_domain
         and   cil_cor_inv    = ih_buff.ih_inv_nbr
         and   cil_cor_so_nbr = ih_buff.ih_nbr
      no-lock:
      end. /* FOR FIRST cil_mstr */

      if available cil_mstr and not in_prt_cor then do:
         hIHBQuery:get-next().
         delete ttRptHeader.
         next.
      end.
      
      if ih_buff.ih_fsm_type = "FSM-RO" then tax_tr_type = '16'.
      
      if (oldcurr <> ih_buff.ih_curr) or (oldcurr = "") then do:

         /* DETERMINE CURRENCY DISPLAY AMERICAN OR EUROPEAN */
         find rnd_mstr where rnd_rnd_mthd = rndmthd
         no-lock no-error.

         if not available rnd_mstr then do:
            /* ROUND METHOD RECORD NOT FOUND */
            {{&US_BBI}pxmsg.i &MSGNUM=863 &ERRORLEVEL=3}
            hIHBQuery:get-next().
            delete ttRptHeader.
            next.
         end. /* IF AVAIL rnd_mstr */

         oldcurr = ih_curr.
      end.  /* IF (OLDCURR <> IH_CURR) */
      
      if first-invoice then
      do for ih_hist:
         assign
            tot_prepaid_amt = 0
            tot_ptax_amt = 0.
         for each ih_hist
            where ih_hist.ih_domain = global_domain
              and ih_hist.ih_inv_nbr = ih_buff.ih_inv_nbr
         exclusive-lock break by ih_hist.ih_inv_nbr:
            first_line = yes.
            /* PRINT INVOICES, CREDITS, OR BOTH */
            if first-of(ih_hist.ih_inv_nbr) then do:
               /* INITIALIZE VARIABLES FOR INVOICE TOTALS.*/
               {{&US_SO}soivtot2.i}
            end. /* IF FIRST-OF ih_inv_nbr */
            
            assign
               ih_recno = recid(ih_hist)
               base_rpt = ih_curr.
               
            assign
               rmaso = no
               sacontract = no.
               
            /* RMASO INDICATES AN RMA INVOICE */
            if ih_hist.ih_fsm_type = "RMA" then
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
                  where idh_hist.idh_domain = global_domain
                    and idh_hist.idh_inv_nbr = ih_hist.ih_inv_nbr
                    and idh_hist.idh_qty_inv <> 0
               no-lock:

                  if idh_price <> 0 or
                     idh_rma_type <> "I"
                  then
                     print_invoice = yes.
               end. /* FOR EACH idh_hist */

               if print_invoice = no then do:
                  next.
               end.
            end.  /* IF AVAIL rmc_ctrl */
            
            run getTermsDescriptionByLng(input ih_cr_terms, output termsdesc).
            run getTermsDescriptionByLng(input ih_fr_terms, output frtermsdesc).
                        
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
                     {{&US_GP}gpvteprg.i}
                  end. /* IF AVAIL ad_mstr */

               end. /* IF ad_pst_id = "" */

               else do:
                  {{&US_GP}gpvteprg.i}
               end. /* ELSE ad_pst_id <> "" */

               assign
                  ttRptHeader.fvatreglbl = getTermLabel("VAT_REG",7)
                  ttRptHeader.fvatreg    = vatreg.

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
               {{&US_GP}gprunp.i "soldfnbr" "p" "createFiscalNbrXref"
                        "(input ih_buff.ih_inv_nbr,
                          input ih_buff.ih_nbr,
                          input fnbr_seq,
                          output l_error)"}
               if l_error then do:
                  next.
               end.
            end.
            
            if first-of(ih_inv_nbr) then do:
               {{&US_SO}soivtot2.i}
         /*      create ttRptHeader.*/
               assign
               /*   ttRptHeader.fUpLink = ttRptTitle.fSubLink
                  ttRptHeader.fSubLink = GetNextLink()*/
                  ttRptHeader.fih_userid = ih_hist.ih_userid
                  ttRptHeader.fih_domain = ih_hist.ih_domain                  
                  ttRptHeader.fih_nbr = ih_hist.ih_nbr
                  ttRptHeader.fStatutoryCurr = l_statutory_curr
                  ttRptHeader.fih_inv_nbr = ih_hist.ih_inv_nbr
                  ttRptHeader.fih_ship_date = ih_hist.ih_ship_date
                  ttRptHeader.fih_ord_date = ih_hist.ih_ord_date
                  ttRptHeader.fih_po = ih_hist.ih_po
                  ttRptHeader.fent_ord_nbr = if isDomOrder then ent_ord_nbr else ""
                  ttRptHeader.fih_ship = ih_hist.ih_ship
                  ttRptHeader.fih_shipvia = ih_hist.ih_shipvia
                  ttRptHeader.fih_cr_terms = ih_hist.ih_cr_terms
                  ttRptHeader.fih_fr_terms = ih_hist.ih_fr_terms                  
                  ttRptHeader.fih_bol = ih_hist.ih_bol
                  ttRptHeader.ftermsdesc = termsdesc
                  ttRptHeader.ffrtermsdesc = frtermsdesc                  
                  ttRptHeader.fih_fob = ih_hist.ih_fob
                  ttRptHeader.fresale = resale
                  ttRptHeader.fhdr_call = hdr_call
                  ttRptHeader.fih__chr01 = ih_hist.ih__chr01
                  ttRptHeader.fih__chr02 = ih_hist.ih__chr02
                  ttRptHeader.fih__chr03 = ih_hist.ih__chr03
                  ttRptHeader.fih__chr04 = ih_hist.ih__chr04
                  ttRptHeader.fih__chr05 = ih_hist.ih__chr05
                  ttRptHeader.fih__chr06 = ih_hist.ih__chr06
                  ttRptHeader.fih__chr07 = ih_hist.ih__chr07
                  ttRptHeader.fih__chr08 = ih_hist.ih__chr08
                  ttRptHeader.fih__chr09 = ih_hist.ih__chr09
                  ttRptHeader.fih__chr10 = ih_hist.ih__chr10
                  ttRptHeader.fih_curr = ih_hist.ih_curr                  
                  ttRptHeader.fih_rmks = ih_hist.ih_rmks
                  ttRptHeader.fih_fsm_type = ih_hist.ih_fsm_type
                  ttRptHeader.fih_due_date = ih_hist.ih_due_date
                  ttRptHeader.fih_req_date = ih_hist.ih_req_date
                  ttRptHeader.fih_sa_nbr = ih_hist.ih_sa_nbr
                  ttRptHeader.fNotCorr = true
                  ttRptHeader.fInvoiceType = ih__log01               /*VX001*/
                  .
               /* Add miscellaneous Tax ID for bill to */
               for first ad_mstr no-lock
                  where ad_mstr.ad_domain = global_domain
                  and   ad_mstr.ad_addr = ih_hist.ih_bill:
                  ttRptHeader.fad_misc1_id = ad_mstr.ad_misc1_id.
                  ttRptHeader.fad_misc2_id = ad_mstr.ad_misc2_id.
                  ttRptHeader.fad_misc3_id = ad_mstr.ad_misc3_id.
               end.
                  
               for first ad_mstr where ad_mstr.ad_domain = global_domain
                             and ad_mstr.ad_addr   = ih_hist.ih_slspsn[1] no-lock:
                  ttRptHeader.fih_slspsn = ad_mstr.ad_sort.
               end.
                  
               run PrintComment(input ih_hist.ih_cmtindx, input in_vcPriHeadComment, input ttRptHeader.fSubLink).
               
               if rmaso then do:
                  /* NOTE: CA_CATEGORY = "0" FOR CALLS, AND  */
                  /*       "QUOTE" FOR CALL QUOTES.          */
                  find first ca_mstr
                     where ca_domain = global_domain
                      and  ca_nbr = ih_ca_nbr
                      and  ca_category = "0"
                  no-lock no-error.

                  if available ca_mstr then do:
                     run PrintComment(input ca_cmtindx, input in_vcPriHeadComment, input ttRptHeader.fSubLink).
                  end.  /* IF AVAIL ca_mstr */
                  else do:
                     find first chm_mstr
                        where chm_domain = global_domain
                         and  chm_nbr = ih_ca_nbr
                         and  chm_category = "0"
                     no-lock no-error.

                     if available chm_mstr then do:
                        run PrintComment(input chm_cmtindx, input in_vcPriHeadComment, input ttRptHeader.fSubLink).
                     end.  /* IF AVAIL chm_mstr */
                  end.  /* ELSE NOT AVAIL ca_mstr */
               end.  /* IF rmaso */
               
               run printItemDetail (output invtot_container_amt, output invtot_linecharge_amt, input-output l_nontax_amt, input-output l_tax_amt).
               
               assign
                  invtot_line_total = invtot_line_total +
                                      invtot_container_amt +
                                      invtot_linecharge_amt
                  invtot_ord_amt    = invtot_ord_amt +
                                      invtot_container_amt +
                                      invtot_linecharge_amt.
               
            end.  /* if first-of(ih_inv_nbr) */
            
            /*Check if this is a credit card order*/
            {{&US_GP}gprunp.i "gpccpl" "p" "isCCOrder"
               "(input ih_nbr, output vlResult)"}
            assign
               ttRptHeader.fCreditCard = vlResult.
            
            run PrintDiscountSummary(input ttRptHeader.fSubLink, input ih_curr).
            
            assign
               tot_prepaid_amt = tot_prepaid_amt + ih_hist.ih_prepaid
               tot_ptax_amt    = tot_ptax_amt    + ih_hist.ih_prep_tax.
               
            /* TRAILER */
            /* (Only display trailer after all SOs for this invoice */
            /* have been printed.)                                  */

            if not last-of(ih_inv_nbr)
            then do:
               l_conso = yes.
               {{&US_BBI}gprun.i ""soihtrl2.p"" "(input l_conso)"}

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

               run GetTaxDetails in reportBussinessHelper 
                          (input tax_tr_type,
                           input ih_inv_nbr,
                           input '*',
                           input ih_curr,
                           input ih_ex_rate,
                           input ih_ex_rate2,
                           input base_rpt,
                           input yes,
                           input-output table ttTaxDetail BY-REFERENCE
                           ).
              
               /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
               {{&US_BBI}gprun.i ""txtotal1.p"" "(input '16',
                                         input  ih_inv_nbr,
                                         input  '*',
                                         input  0,
                                         output l_tax_in)"}

               {{&US_BBI}gprun.i ""soihtrl2.p"" "(input l_conso)"}
               /* OBTAINING TOTAL TAX AMOUNT FOR THE INVOICE */
               {{&US_BBI}gprun.i  ""txtotal.p"" "(input '16',
                                         input ih_inv_nbr,
                                         input '*',
                                         input 0,
                                         output tax_amt)" }
                                         
              /* ADJUSTING TOTAL TAX AMOUNT BY INCLUDED TAX */
               assign
                  tax_amt = tax_amt + l_tax_in
                  ord_amt = ord_amt + tax_amt.
                  
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
                  
               if ih_curr <> base_curr and isEUtransaction(ih_site, ih_cust) then do:
                  assign l_basetaxtot = 0.

                  for each tx2d_det where tx2d_domain = global_domain
                                      and tx2d_ref = ih_inv_nbr
                                      and tx2d_nbr = ih_nbr
                                      and tx2d_tr_type = tax_tr_type
                                      and tx2d_tax_code <> "00000000"
                  no-lock:
                     assign l_basetaxtot = l_basetaxtot + tx2d_tax_amt.
                  end.
                  if (l_basetaxtot <> 0) and (ih_curr <> base_curr) and 
                     isEUtransaction(ih_site, ih_bill) then do:
                     create ttTaxTotal.
                     assign
                        ttTaxTotal.fUpLink = ttRptHeader.fSubLink
                        .
                     if txc_detrp then do:
                        assign
                           ttTaxTotal.fmsg = l_tax_total_message[1]
                           ttTaxTotal.fCurr1 = ih_curr
                           ttTaxTotal.fTotalTax1 = invtot_tax_amt
                           ttTaxTotal.fCurr2 = base_curr
                           ttTaxTotal.fTotalTax2 = l_basetaxtot
                           .
                     end.
                     else do:
                        assign
                           ttTaxTotal.fmsg = l_tax_total_message[2]
                           ttTaxTotal.fCurr1 = base_curr
                           ttTaxTotal.fTotalTax1 = l_basetaxtot
                           .
                     end.
                  end.
               end.
               
               if l_tax_in <> 0 and l_conso
               then do:
                  line_total = invtot_line_total.
                  {{&US_GP}gprunp.i "sopl" "p" "adjustDiscountAmount"
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
                  run PrintBOL(input recid(ih_hist), input ttRptHeader.fSubLink).
               end.  /* FOUND mfc_ctrl RECORD */
               
               currdisp = ih_curr.
               
               /* DETERMINE IF THIS INVOICE IS A CONSOLIDATED INVOICE WHICH */
               /* WAS CONSOLIDATED FROM A DOM GLOBAL ORDER                  */
               if isDomOrder = true
               then do:
                  {{&US_BBI}gprun.i ""soivdom1.p""
                     "(input 'ih_hist',
                       input ih_inv_nbr,
                       output so-trl1-cd,
                       output so-trl2-cd,
                       output so-trl3-cd,
                       output isConsolDom)"}
               end.
               
               run PrintTrailer(input recid(ih_hist), input ttRptHeader.fSubLink).
               
               if tot_prepaid_amt <> 0
               then do:
                  assign 
                     tot_prepaid_nett = tot_prepaid_amt + tot_ptax_amt
                     amt_due_af_prep  = invtot_ord_amt - tot_prepaid_nett.
                  create ttPrepaidTax.
                  assign
                     ttPrepaidTax.fUpLink = ttRptHeader.fSubLink
                     ttPrepaidTax.ftot_prepaid_amt = tot_prepaid_amt
                     ttPrepaidTax.ftot_ptax_amt = tot_ptax_amt
                     ttPrepaidTax.ftot_prepaid_nett = tot_prepaid_nett
                     ttPrepaidTax.famt_due_af_prep = amt_due_af_prep
                     ttPrepaidTax.fcurr = ih_curr
                     .
               end. /* if tot_prepaid_amt <> 0 */
            end. /* if last-of(ih_inv_nbr) */
         end. /* for each ih_hist */ 
      end. /* if first-invoice then do for ih_hist */
      
      hIHBQuery:get-next().
   end. /* Repeat query */
   hIHBQuery:query-close ().
   
end. /* mainloop: */   

       
end procedure. /* RunInvoice */

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
         or in_print_lotserials)
      and not can-find(first t_tr_hist1
                          where t_tr_nbr = ih_nbr)
      then do:

         {{&US_BBI}gprun.i ""sotrhstb.p""
            "(input ih_nbr,
              input ih_inv_nbr,
              input-output table t_tr_hist1)"}

      end. /* IF ih_sched ... */

      for each idh_hist
         fields( idh_domain idh_inv_nbr idh_nbr idh_price
                 idh_tax_in  idh_sched    idh_line
                 idh_qty_inv idh_rma_type idh_taxable
                 idh__qadc06 idh_part     idh_site)
          where idh_domain  = global_domain
           and  idh_inv_nbr = ih_inv_nbr
           and  idh_nbr     = ih_nbr
      no-lock:

         l_ext_actual  =  idh_price * idh_qty_inv.

         /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
         {{&US_GP}gprunp.i "mcpl" "p" "mc-curr-rnd"
            "(input-output l_ext_actual,
              input        rndmthd,
              output       mc-error-number)" }
         if mc-error-number <> 0
         then do:
            {{&US_BBI}pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
         end.

         /* CHECK AUTHORIZATION RECORDS FOR DIFFERENT EXT PRICE */
         if  idh_sched   = yes
         and idh__qadc06 = "yes"
         then do:

            auth_found = no.

            {{&US_BBI}gprun.i ""soauthbl.p""
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
      {{&US_GP}gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output disc_amt,
           input        rndmthd,
           output       mc-error-number)" }

      if mc-error-number <> 0
      then do:
         {{&US_BBI}pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end.

      l_tmp_amt = taxable_amt * ih_disc_pct / 100.

      /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */

      {{&US_GP}gprunp.i "mcpl" "p" "mc-curr-rnd"
         "(input-output l_tmp_amt,
           input        rndmthd,
           output       mc-error-number)" }
      if mc-error-number <> 0
      then do:
         /* ROUNDING METHOD DOES NOT EXIST */
         {{&US_BBI}pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      end. /* IF mc-error-number <> 0 */

      taxable_amt = taxable_amt - l_tmp_amt.

      /* ALL PROCEDURES USED FOR CALCULATING VARIOUS TOTALS         */
      /* PERTAINING TO THE INVOICE ARE CLUBBED TOGETHER AND WOULD BE*/
      /* RUN ONLY ONCE WITHIN THE ih_hist loop, SO THAT THEY GET    */
      /* ADDED CORRECTLY TO l_ord_amt                               */

      if last-of(ih_inv_nbr)
      then do:

         /* OBTAIN INVOICE TOTAL TAX */
         {{&US_BBI}gprun.i ""txtotal.p""
            "(input  '16',
              input  ih_inv_nbr,
              input  '*',
              input  0,      /* ALL LINES */
              output tax_amt)"}

         /* OBTAINING TOTAL INCLUDED TAX FOR THE TRANSACTION */
         {{&US_BBI}gprun.i ""txtotal1.p""
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
            {{&US_GP}gprunp.i "sopl" "p" "calDiscAmountAfterSubtractingTax"
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
            {{&US_GP}gprunp.i "sopl" "p" "adjustDiscountAmount"
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
      {{&US_BBI}gprun.i ""txabsrb.p""
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

   {{&US_SO}soivtot9.i}
END PROCEDURE. /* PROCEDURE P-ACC-TOTALS */
