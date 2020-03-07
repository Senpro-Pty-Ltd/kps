/* xfpiprn2.i - PRINT DISCOUNT SUMMARY ON SALES ORDERS AND INVOICES           */
/* sopiprn2.i - PRINT DISCOUNT SUMMARY ON SALES ORDERS AND INVOICES           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfpiprn2.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* $Revision: 1.2 $                                                       */
/* REVISION: 8.5      LAST MODIFIED: 04/19/95   BY: afs *J042*                */
/* REVISION: 8.5      LAST MODIFIED: 06/14/96   BY: DAH *J0T0*                */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* $Revision: 1.2 $   BY: Jean Miller        DATE: 05/05/06  ECO: *R047*  */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* This include file prints summary discount information for an */
/* entire sales quote, sales order or invoice line.  This       */
/* information is printed from a workfile defined in sodiscwk.i */
/* and created/updated in sopiprn1.i.                           */

/* There are no parameters because this include just dumps the  */
/* discount workfile if it exists.                              */

&IF DEFINED(sopiprn2_i) = 0 &THEN
&GLOBAL-DEFINE sopipr21_i
define variable sopiprn2_i_lvc_amt_fmt as character no-undo.  
&ENDIF

for each disc_wkfl exclusive-lock break by disc_prilist:

   /*eb3sp5 comment begin
   if first(disc_prilist) and page-size - line-counter < 4 then
      page.
   eb3sp5 comment end*/
   find first lngd_det where lngd_dataset = "pi_mstr"
      and lngd_field   = "pi_amt_type"
      and lngd_lang    = global_user_lang
      and lngd_key1    = disc_amt_type
   no-lock no-error.

   if available(lngd_det) then
      amt_type = lngd_translation.
   else
      amt_type = "".

   if disc_sum_key = "3" then        /* amount */
      /* Round me like an ext amt */
      prnt_sum_disc_amt = disc_disc_amt.

   else
   if disc_sum_key = "2" then   /* percent */
      prnt_sum_disc_amt = if disc_extamt <> 0 then
                             (disc_disc_amt / disc_extamt) * 100
                          else
                             0.
   /*eb3sp5 comment begin
   if page-size - line-counter < 1 then
      page.

   hdl_sum_disc_lbl:label = disc_prnt_label.

   /* SET EXTERNAL LABELS */
   setFrameLabels(frame disc_sum_print:handle).
   sopiprn2_i_lvc_amt_fmt = '->>>>,>>>,>>9.99<'.
   {us/bbi/gprun.i ""gpcurfmt.p"" 
      "(input-output sopiprn2_i_lvc_amt_fmt,
      input rndmthd)"} 
   display
      disc_desc
      amt_type
      prnt_sum_disc_amt
   with frame disc_sum_print.
   
   prnt_sum_disc_amt:format in frame disc_sum_print = sopiprn2_i_lvc_amt_fmt. 
   display 
      prnt_sum_disc_amt
   with frame disc_sum_print.
   
   down 1 with frame disc_sum_print.
   eb3sp5 comment end*/
   {us/xf/xfpipr92mr.i} /*93sp12.1*/

   delete disc_wkfl.

   /*eb3sp5 comment begin
   if last(disc_prilist) then
      down 1 with frame disc_sum_print.
   eb3sp5 comment end*/
end.  /* for each */
