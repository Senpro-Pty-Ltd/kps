/* xfpiprn1.i - PRINT DISCOUNT DETAIL ON SALES ORDERS AND INVOICES       */
/* sopiprn1.i - PRINT DISCOUNT DETAIL ON SALES ORDERS AND INVOICES       */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfpiprn1.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* $Revision: 1.2 $                                                         */
/* REVISION: 8.5      LAST MODIFIED: 04/19/95   BY: afs *J042*           */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: DAH *J0T0*           */
/* REVISION: 8.5      LAST MODIFIED: 12/30/97   BY: *J28Y* Seema Varma   */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan    */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KN* myb              */
/* REVISION: 9.1      LAST MODIFIED: 10/10/00 BY: *N0WB* Mudit Mehta      */
/* Revision: 1.4.2.4  BY: Katie Hilbert DATE: 02/22/02 ECO: *N19T* */
/* Revision: 1.4.2.6  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L* */
/* $Revision: 1.2 $ BY: Ed van de Gevel DATE: 03/01/05 ECO: *R00G* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* This include file prints detailed discount information for a sales    */
/* quote, sales order or invoice line.                                   */

     /*
         doctype       like pih_doc_type.
               1 = sales order/invoice; 2 = sales quote
         nbr           like pih_nbr.
         line          like pih_line.
         part          like sod_part.
         parent        like pih_parent.
         feature       like pih_feature.
         popt          like pih_option.
         qty           like sod_qty_ord.
         list_price    like sod_list_pr.
         net_price     like sod_price.        *for accruals*
         confg_disc    like pih_confg_disc.
         command       command to display header information
                       after a page break.
     */

{us/bbi/cxcustom.i "SOPIPRN1.I"}
&IF DEFINED(sopiprn1_i) = 0 &THEN
&GLOBAL-DEFINE sopiprn1_i
define variable sopiprn1_i_lvc_curr    like so_mstr.so_curr        no-undo.  
define variable sopiprn1_i_lvc_amt_fmt as character                no-undo.
define variable sopiprn1_i_rndmthd     like rnd_rnd_mthd           no-undo.
define variable sopiprn1_i_mc-error-number like msg_nbr            no-undo.  
&ENDIF
   
for each pih_hist
   where pih_hist.pih_domain = global_domain and  pih_doc_type   = {&doctype}
      and pih_nbr        = {&nbr}
      and pih_line       = {&line}
      and lookup(pih_amt_type,"2,3,4,8,9") <> 0
      and pih_print
      and pih_confg_disc = {&confg_disc}
      and pih_parent     = {&parent}
      and pih_feature    = {&feature}
      and pih_option     = {&opt}
   no-lock
      query-tuning(hint "INDEX(T0 PIH_HIST##PIH_COMP)")
      break by pih_list:

   /*eb3sp5 comment begin
   if first(pih_list) and page-size - line-counter < 4 then do:
      page.
      {&command}
   end.
   eb3sp5 comment end*/
   &IF {&doctype} = 1 &THEN      
      sopiprn1_i_lvc_curr = so_mstr.so_curr.
   &ENDIF
   &IF {&doctype} = 2 &THEN
      sopiprn1_i_lvc_curr = qo_mstr.qo_curr.
   &ENDIF    
   /* GET ROUNDING METHOD FROM CURRENCY MASTER */
   {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
      "(input sopiprn1_i_lvc_curr,
       output sopiprn1_i_rndmthd,
       output sopiprn1_i_mc-error-number)"}
   if sopiprn1_i_mc-error-number <> 0
   then do:
      {us/bbi/pxmsg.i &MSGNUM=sopiprn1_i_mc-error-number &ERRORLEVEL=2}
      leave.
   end. /* IF sopiprn1_i_mc-error-number <> 0 */

   sopiprn1_i_lvc_amt_fmt = '->>>>,>>>,>>9.99<'.
   {us/bbi/gprun.i ""gpcurfmt.p"" 
      "(input-output sopiprn1_i_lvc_amt_fmt,
      input sopiprn1_i_rndmthd)"}   
   find pi_mstr  where pi_mstr.pi_domain = global_domain and  pi_list_id =
   pih_list_id no-lock no-error.

   if not available pi_mstr then do:
      find lngd_det
         where lngd_dataset = "pih_hist"         and
               lngd_field   = "pih_source"       and
               lngd_lang    = global_user_lang   and
               lngd_key1    = pih_source no-lock no-error.
      if available(lngd_det) then l_man_desc = lngd_translation.
   end. /* IF NOT AVAILABLE PI_MSTR */
   else
      l_man_desc = pi_desc.

   if disc_det_key <> "1" then do:

      find first lngd_det
       where lngd_dataset = "pi_mstr"
         and lngd_field   = "pi_amt_type"
         and lngd_lang    = global_user_lang
         and lngd_key1    = pih_amt_type
      no-lock no-error.
      if available(lngd_det) then amt_type = lngd_translation.
      else amt_type = "".

      if disc_det_key = "2" then do:  /* percent */

         if lookup(pih_amt_type,"3,4,9") <> 0 then
            prnt_disc_amt = if {&qty} <> 0 then
                               (pih_disc_amt / {&list_price}) * 100
                            else
                               0.
         else
            prnt_disc_amt = if {&qty} <> 0 then
                               pih_amt
                            else
                               0.
      end.
      else
      if disc_det_key = "3" then /* amount */
         {&SOPIPRN1-I-TAG1}
         prnt_disc_amt = pih_disc_amt * {&qty} * (if available cild_det then -1 else 1).
         {&SOPIPRN1-I-TAG2}

      /*eb3sp5 comment begin
      if page-size - line-counter < 1 then do:
         page.
         {&command}
      end.

      hdl_disc_lbl:label = disc_prnt_label.

      /* SET EXTERNAL LABELS */
      setFrameLabels(frame disc_print:handle).
      display
         l_man_desc @ pi_desc
         amt_type
         prnt_disc_amt
      with frame disc_print.
      
      prnt_disc_amt:format in frame disc_print = sopiprn1_i_lvc_amt_fmt.
      display
         prnt_disc_amt
      with frame disc_print.
           
      down 1 with frame disc_print.
      eb3sp5 comment end*/
      {us/xf/xfpipr91mq.i} /*93sp12.1*/
   end.

   /* Write discount information to summary workfile */
   if disc_sum_key <> "1" then do:

      find first disc_wkfl where disc_prilist = pih_list
      exclusive-lock no-error.
      if not available disc_wkfl then do:
         create disc_wkfl.
         assign
            disc_prilist  = pih_list
            disc_amt_type = pih_amt_type
            disc_desc     = l_man_desc
            .
      end.
      assign

         disc_extamt   = if pih_amt_type <> "8" then
                            disc_extamt + {&list_price} * {&qty}
                         else
                            disc_extamt + {&net_price} * {&qty}
         disc_disc_amt = disc_disc_amt + pih_disc_amt * {&qty}
         .

   end.  /* Summary workfile update */

   if disc_det_key <> "1" and last(pih_list) then
      down 1 with frame disc_print.

end.  /* for each */
