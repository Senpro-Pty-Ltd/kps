/* xxauis2b.p - Shipper Auto Confirm - Invoice Print                         */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                    */
/* CYB    LAST MODIFIED: 73-JUL-2011    BY:  gbg *c1226*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/xx/xxauis2.i}
define variable l_program_name as character initial 'soprint.p' no-undo.
define variable sdisc_det_key like lngd_key1.
define variable sdisc_sum_key like lngd_key1.


form
   sinv_only             colon 35
                         label "Print Only Lines to Invoice"
   sinv_date             colon 60
                         label "Invoice Date"
   sprint_lotserials     colon 35
                         label "Print Lot/Serial Numbers Shipped"
   sprint_options        colon 35
                         label "Print Features and Options"
   scomp_addr            colon 35
                         label "Entity Address"
   sform_code            colon 60 deblank
                         label "Form Code"
   sdisc_det             colon 35
                         label "Discount Detail"
   sdisc_sum             colon 35
                         label "Discount Summary"
   smsg                      at 2
                         label "Message"
   skip
with frame a width 80 row 6 attr-space side-labels title "Invoice Print Options".

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

   if scomp_addr = "" then do:
      find first soc_ctrl
         where soc_ctrl.soc_domain = global_domain
      no-lock.
      scomp_addr = soc_comp.
      sinv_only = soc_ln_inv.
   end.


   sinv_date = today.
   sprint_lotserials = no.
   sprint_options = no.
   sform_code = "09".
   sdisc_det = "None".
   sdisc_sum = "None".
   smsg = "".


      update
         sinv_only
         sinv_date
         sprint_lotserials
         sprint_options
         scomp_addr
         sform_code
         sdisc_det sdisc_sum
         smsg
      with frame a 
      editing:

         if frame-field = "sdisc_det" then do:
            {us/mf/mfnp05.i lngd_det lngd_trans
               "    lngd_dataset   = l_program_name
               and  lngd_field     = 'sdet_disc_prnt'
               and  lngd_lang      = global_user_lang"
               lngd_translation "input sdisc_det"}
            if recno <> ? then
               display lngd_translation @ sdisc_det with frame a.
         end. /* IF FRAME-FIELD  = "sDISC_DET" */

         else if frame-field = "sdisc_sum" then do:
            {us/mf/mfnp05.i lngd_det lngd_trans
               "    lngd_dataset   = l_program_name
               and  lngd_field     = 'sdet_disc_prnt'
               and  lngd_lang      = global_user_lang"
               lngd_translation "input sdisc_sum"}
            if recno <> ? then
               display lngd_translation @ sdisc_sum with frame a.
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
         and  lngd_translation = input sdisc_det
      no-lock no-error.

      if not available lngd_det then do:
         /* INVALID OPTION */
         {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=sdisc_det}
         {us/bbi/gprun.i ""gpmsgls1.p""
            "(6928, l_program_name, 'det_disc_prnt', global_user_lang)"}
         next-prompt sdisc_det with frame a.
         undo, retry.
      end. /* IF NOT AVAILABLE LNGD_DET */

      sdisc_det_key = lngd_key1.

      find first lngd_det where
              lngd_dataset     = l_program_name
         and  lngd_field       = "det_disc_prnt"
         and  lngd_lang        = global_user_lang
         and  lngd_translation = input sdisc_sum
      no-lock no-error.

      if not available lngd_det then do:
         /* INVALID OPTION */
         {us/bbi/pxmsg.i &MSGNUM=712 &ERRORLEVEL=3 &MSGARG1=sdisc_sum}
         {us/bbi/gprun.i ""gpmsgls1.p""
            "(6928, l_program_name, 'det_disc_prnt', global_user_lang)"}
         next-prompt sdisc_sum with frame a.
         undo, retry.
      end. /* IF NOT AVAILABLE LNGD_DET */

      sdisc_sum_key = lngd_key1.

      if sinv_date = ? then do:
         /* Invalid date */
         {us/bbi/pxmsg.i &MSGNUM=27 &ERRORLEVEL=3}
         next-prompt sinv_date with frame a.
         undo , retry.
      end.

      if lookup(sform_code,"1,11,09") = 0 then do:
         /* Form code not installed */
         {us/bbi/pxmsg.i &MSGNUM=129 &ERRORLEVEL=3}
         next-prompt sform_code with frame a.
         undo , retry.
      end.
