/* xfpiprn3.i - PRINT DISCOUNT DETAIL ON INVOICE REPRINT                      */
/* sopiprn3.i - PRINT DISCOUNT DETAIL ON INVOICE REPRINT                      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfpiprn3.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* $Revision: 1.2 $                                                       */
/* REVISION: 8.5      LAST MODIFIED: 08/18/95   BY: afs *J06R*                */
/* REVISION: 8.5      LAST MODIFIED: 06/13/96   BY: DAH *J0T0*                */
/* REVISION: 8.5      LAST MODIFIED: 10/21/96   BY: *J15C* Markus Barone      */
/* REVISION: 8.5      LAST MODIFIED: 12/30/97   BY: *J28Y* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 10/09/00   BY: *N0WB* Mudit Mehta        */
/* Revision: 1.5.2.5      BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L*  */
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

/* This include file prints detailed discount information from invoice  */
/* history.                                                             */

/* The only differences between this include and sopiprn1.i are that    */
/* this include references iph_hist instead of pih_hist, doc_type is    */
/* not needed as a search component because iph_hist is only created    */
/* invoices, and invoice number is added as a search component.         */
/*
   nbr           like iph_nbr.
   inv_nbr       like iph_inv_nbr.
   line          like iph_line.
   part          like sod_part.
   parent        like iph_parent.
   feature       like iph_feature.
   popt          like iph_option.
   qty           like sod_qty_ord.
   list_price    like sod_list_pr.
   net_price     like sod_price.     * for accruals *
   confg_disc    like iph_confg_disc.
   command       command to display header information after a page break.
*/
{us/bbi/cxcustom.i "SOPIPRN3.I"}

&IF DEFINED(sopiprn3_i) = 0 &THEN
&GLOBAL-DEFINE sopiprn3_i
define variable sopiprn3_i_lvc_curr    like so_mstr.so_curr        no-undo.  
define variable sopiprn3_i_lvc_amt_fmt as character                no-undo.
define variable sopiprn3_i_rndmthd     like rnd_rnd_mthd           no-undo.
define variable sopiprn3_i_mc-error-number like msg_nbr            no-undo.  

define buffer bih_hist for ih_hist.
&ENDIF

for first bih_hist 
   where bih_hist.ih_domain = global_domain 
     and bih_hist.ih_nbr = {&nbr}
no-lock:  
   sopiprn3_i_lvc_curr = bih_hist.ih_curr.
end.
/* GET ROUNDING METHOD FROM CURRENCY MASTER */
{us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
   "(input sopiprn3_i_lvc_curr,
    output sopiprn3_i_rndmthd,
    output sopiprn3_i_mc-error-number)"}
if sopiprn3_i_mc-error-number <> 0
then do:
   {us/bbi/pxmsg.i &MSGNUM=sopiprn3_i_mc-error-number &ERRORLEVEL=2}
   leave.
end. /* IF sopiprn1_i_mc-error-number <> 0 */

sopiprn3_i_lvc_amt_fmt = '->>>>,>>>,>>9.99<'.
{us/bbi/gprun.i ""gpcurfmt.p"" 
   "(input-output sopiprn3_i_lvc_amt_fmt,
    input sopiprn3_i_rndmthd)"}     
         
for each iph_hist where
         iph_domain     = global_domain
     and iph_nbr        = {&nbr}
     and iph_inv_nbr    = {&inv_nbr}
     and iph_line       = {&line}
     and lookup(iph_amt_type,"2,3,4,8,9") <> 0
     and iph_print
     and iph_confg_disc = {&confg_disc}
     and iph_parent     = {&parent}
     and iph_feature    = {&feature}
     and iph_option     = {&opt}
no-lock break by iph_list:

   /*eb3sp5 comment begin
   if first(iph_list) and page-size - line-counter < 4 then do:
      page.
      {&command}
   end.
   eb3sp5 comment end*/

   find pi_mstr where pi_domain = global_domain
                  and pi_list_id = iph_list_id
   no-lock no-error.

   if not available pi_mstr then do:
      find lngd_det where
         lngd_dataset = "pih_hist"         and
         lngd_field   = "pih_source"       and
         lngd_lang    = global_user_lang   and
         lngd_key1    = iph_source
      no-lock no-error.
      if available(lngd_det) then
         l_man_desc = lngd_translation.
   end. /* IF NOT AVAILABLE PI_MSTR */
   else
      l_man_desc = pi_desc.

   if disc_det_key <> "1" then do:

      find first lngd_det where
             lngd_dataset = "pi_mstr"
         and lngd_field   = "pi_amt_type"
         and lngd_lang    = global_user_lang
         and lngd_key1    = iph_amt_type
      no-lock no-error.

      if available(lngd_det) then
         amt_type = lngd_translation.
      else
         amt_type = "".

      if disc_det_key = "2" then do:  /* percent */

         if lookup(iph_amt_type,"3,4,9") <> 0 then
            prnt_disc_amt = if {&qty} <> 0 then
                               (iph_disc_amt / {&list_price}) * 100
                            else
                               0.
         else
            prnt_disc_amt = if {&qty} <> 0 then
                               iph_amt
                            else
                               0.
      end.

      else
      if disc_det_key = "3" then /* amount */
         prnt_disc_amt = iph_disc_amt * {&qty}.

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
      
      prnt_disc_amt:format in frame disc_print = sopiprn3_i_lvc_amt_fmt.
      display
         prnt_disc_amt
      with frame disc_print.      
    
      down 1 with frame disc_print.
      eb3sp5 comment end*/
      {us/xf/xfpipr93mq.i} /*93sp12.1 - eb3sp5*/
   end.

   /* Write discount information to summary workfile */
   if disc_sum_key <> "1" then do:

      find first disc_wkfl where disc_prilist = iph_list
      exclusive-lock no-error.

      if not available disc_wkfl then do:
         create disc_wkfl.
         assign
            disc_prilist  = iph_list
            disc_amt_type = iph_amt_type
            disc_desc     = l_man_desc.
      end.

      assign
         disc_extamt   = if iph_amt_type <> "8" then
                            disc_extamt + {&list_price} * {&qty}
                         else
                            disc_extamt + {&net_price} * {&qty}
         disc_disc_amt = disc_disc_amt + iph_disc_amt * {&qty}.

   {&SOPIPRN3-I-TAG1}

      assign
         disc_extamt   =  disc_extamt * (if available cild_det then -1 else 1)
         disc_disc_amt =  disc_disc_amt * (if available cild_det then -1 else 1).

   end.  /* Summary workfile update */

   /*eb3sp5 comment begin
   if last(iph_list) and disc_det_key <> "1"
   then
      down 1 with frame disc_print.
   eb3sp5 comment end*/
end.  /* for each */
