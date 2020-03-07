/* xfsotds9.i - SALES ORDER TRAILER TOTALS INCLUDE FILE                 */
/* sototdsp.i - SALES ORDER TRAILER TOTALS INCLUDE FILE                 */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsotds9.i,v 1.2 2018/03/13 17:09:54 gbg Exp $: */

/* REVISION: 7.3      LAST MODIFIED: 02/04/93   BY: bcm *G415**/
/* REVISION: 7.4      LAST MODIFIED: 07/01/93   BY: bcm *H002**/
/* REVISION: 7.4      LAST MODIFIED: 07/20/93   BY: bcm *H032**/
/* REVISION: 7.4      LAST MODIFIED: 10/20/95   BY: jym *G0XY**/
/* REVISION: 7.4      LAST MODIFIED: 11/20/95   BY: rxm *H0GY**/
/* REVISION: 8.6E     LAST MODIFIED: 05/05/98   BY: EvdG *L00L**/
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb              */
/* Revision: 1.6.1.3      BY: Ellen Borden        DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.6.1.4      BY: Manisha Sawant      DATE: 08/16/02  ECO: *N1RB* */
/* Revision: 1.6.1.5      BY: Vandna Rohira       DATE: 04/28/03  ECO: *N1YL* */
/* Revision: 1.6.1.7      BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* $Revision: 1.2 $   BY: Jean Miller         DATE: 11/23/09  ECO: *R1TW* */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 16/02/10  ECO: *eb3sp5* */
/* Revision: QAD20115    BY: Steve Hong        DATE: 18/01/16  ECO: *grc338  */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

&IF DEFINED(sototdsp_i) = 0 &THEN
&GLOBAL-DEFINE sototdsp_i
   define variable sototdsp_i_rndmthd as character no-undo.
   define variable sototdsp_i_mc-error-number like msg_nbr no-undo.
   define variable sototdsp_i_oldcurr as character no-undo.

   define variable sototdsp_i_line_total_fmt_old        as character no-undo.
   define variable sototdsp_i_disc_amt_fmt_old          as character no-undo.
   define variable sototdsp_i_tax_amt_fmt_old           as character no-undo.
   define variable sototdsp_i_ord_amt_fmt_old           as character no-undo.
   define variable sototdsp_i_cont_charge_total_fmt_old as character no-undo.
   define variable sototdsp_i_line_charge_total_fmt_old as character no-undo.

   define variable sototdsp_i_line_total_fmt            as character no-undo.
   define variable sototdsp_i_disc_amt_fmt              as character no-undo.
   define variable sototdsp_i_tax_amt_fmt               as character no-undo.
   define variable sototdsp_i_ord_amt_fmt               as character no-undo.
   define variable sototdsp_i_cont_charge_total_fmt     as character no-undo.
   define variable sototdsp_i_line_charge_total_fmt     as character no-undo.
&ENDIF
for first txc_ctrl where txc_ctrl.txc_domain = global_domain
no-lock: end.

/**eb3sp5 COMMENTED PORTION BEGINS**
if txc__qad03 then
   display
      l_nontaxable_lbl
      nontaxable_amt
      l_taxable_lbl
      taxable_amt
      with frame sotot.
else
   display
      "" @ l_nontaxable_lbl
      "" @ nontaxable_amt
      "" @ l_taxable_lbl
      "" @ taxable_amt
      with frame sotot.

display
   line_total
   so_mstr.so_disc_pct
   disc_amt
   user_desc
   so_mstr.so_trl1_cd
   so_mstr.so_trl1_amt
   so_mstr.so_trl2_cd
   so_mstr.so_trl2_amt
   so_mstr.so_trl3_cd
   so_mstr.so_trl3_amt
   tax_amt
   so_mstr.so_curr
   invcrdt ord_amt
   tax_date
   tax_edit_lbl
   tax_edit when (maint)
   ""       when (not maint) @ tax_edit
   container_charge_total
   line_charge_total
with frame sotot.

/* SET EXTERNAL LABELS */
setFrameLabels(frame sotot:handle).
**eb3sp5 COMMENTED PORTION ENDS**/

if (sototdsp_i_oldcurr <> so_mstr.so_curr) or (sototdsp_i_oldcurr = "") then do:
   /* GET ROUNDING METHOD FROM CURRENCY MASTER */
   {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
             "(input so_mstr.so_curr,
               output sototdsp_i_rndmthd,
               output sototdsp_i_mc-error-number)"}

   if sototdsp_i_mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=sototdsp_i_mc-error-number &ERRORLEVEL=4}
      pause.
      next.
   end.

   find rnd_mstr where rnd_rnd_mthd = rndmthd no-lock no-error.
   if not available rnd_mstr then do:
      /* ROUND METHOD RECORD NOT FOUND */
      {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=4}
      pause.
      next.
   end.

   sototdsp_i_oldcurr = so_mstr.so_curr.
end.
/*line_total, disc_amt, tax_amt, ord_amt, container_charge_total, line_Charge_total*/

/*grc338
if sototdsp_i_line_total_fmt_old = "" then /* assign initial format */
   assign
      sototdsp_i_line_total_fmt_old = line_total:format in frame sotot
      sototdsp_i_disc_amt_fmt_old = "(zzzz,zzz,zz9.99)"
      sototdsp_i_tax_amt_fmt_old = tax_amt:format in frame sotot
      sototdsp_i_ord_amt_fmt_old = ord_amt:format in frame sotot
      sototdsp_i_cont_charge_total_fmt_old
         = container_charge_total:format in frame sotot
      sototdsp_i_line_charge_total_fmt_old
         = line_charge_total:format in frame sotot.

assign
   sototdsp_i_line_total_fmt        = sototdsp_i_line_total_fmt_old
   sototdsp_i_disc_amt_fmt          = sototdsp_i_disc_amt_fmt_old
   sototdsp_i_tax_amt_fmt           = sototdsp_i_tax_amt_fmt_old
   sototdsp_i_ord_amt_fmt           = sototdsp_i_ord_amt_fmt_old
   sototdsp_i_cont_charge_total_fmt = sototdsp_i_cont_charge_total_fmt_old
   sototdsp_i_line_charge_total_fmt = sototdsp_i_line_charge_total_fmt_old.

{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output sototdsp_i_line_total_fmt,
     input sototdsp_i_rndmthd)"}

{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output sototdsp_i_disc_amt_fmt,
     input sototdsp_i_rndmthd)"}

{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output sototdsp_i_tax_amt_fmt,
     input sototdsp_i_rndmthd)"}

{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output sototdsp_i_ord_amt_fmt,
     input sototdsp_i_rndmthd)"}

{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output sototdsp_i_cont_charge_total_fmt,
     input sototdsp_i_rndmthd)"}

{us/bbi/gprun.i ""gpcurfmt.p""
   "(input-output sototdsp_i_line_charge_total_fmt,
     input sototdsp_i_rndmthd)"}

assign
   line_total:format in frame sotot        = sototdsp_i_line_total_fmt
   disc_amt:format in frame sotot          = sototdsp_i_disc_amt_fmt
   tax_amt:format in frame sotot           = sototdsp_i_tax_amt_fmt
   ord_amt:format in frame sotot           = sototdsp_i_ord_amt_fmt
   container_charge_total:format in frame sotot
      = sototdsp_i_cont_charge_total_fmt
   line_charge_total:format in frame sotot = sototdsp_i_line_charge_total_fmt.

display
   line_total
   disc_amt
   tax_amt
   ord_amt
   container_charge_total
   line_charge_total
with frame sotot.
*/ {us/xf/xfsotdsmx.i}
