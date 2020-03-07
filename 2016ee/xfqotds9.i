/* xfqotds9.i - SALES QUOTE TRAILER TOTALS INCLUDE FILE                 */
/* sqtotdsp.i - SALES QUOTE TRAILER TOTALS INCLUDE FILE                   */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfqotds9.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* REVISION: 7.4            CREATED: 06/07/93   BY: wep *H005**/
/* REVISION: 7.4      LAST MODIFIED: 07/14/93   BY: bcm *H030**/
/* REVISION: 7.4      LAST MODIFIED: 10/30/95   BY: jym *G0YN**/
/* REVISION: 7.4      LAST MODIFIED: 11/20/95   BY: rxm *H0GY**/
/* REVISION: 8.6E     LAST MODIFIED: 05/05/98   BY: Adam Harris *L00L*/
/* REVISION: 8.6E     LAST MODIFIED: 08 MAY 98  BY: *L00W* ED v.d.Gevel */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb              */
/* Revision: 1.6.1.3      BY: Manisha Sawant      DATE: 08/16/02  ECO: *N1RB* */
/* Revision: 1.6.1.4      BY: Kirti Desai         DATE: 03/20/03  ECO: *N28H* */
/* Revision: 1.6.1.5      BY: Vandna Rohira       DATE: 04/28/03  ECO: *N1YL* */
/* Revision: 1.6.1.7      BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00M* */
/* $Revision: 1.2 $   BY: Jean Miller         DATE: 11/23/09  ECO: *R1TW* */
/* Revision: eb3sp5      BY: Shilpa Ahuja    DATE: 18/02/10  ECO: *eb3sp5* */

/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

for first txc_ctrl where txc_ctrl.txc_domain = global_domain
no-lock: end.

/* SET EXTERNAL LABELS */
setFrameLabels(frame qotot:handle).

if txc__qad03
then
   display
      l_nontaxable_lbl
      nontaxable_amt
      l_taxable_lbl
      taxable_amt
      with frame qotot.
else
   display
      "" @ l_nontaxable_lbl
      "" @ nontaxable_amt
      "" @ l_taxable_lbl
      "" @ taxable_amt
      with frame qotot.

display
   line_total
   qo_mstr.qo_disc_pct
   disc_amt
   user_desc
   qo_mstr.qo_trl1_cd
   qo_mstr.qo_trl1_amt
   qo_mstr.qo_trl2_cd
   qo_mstr.qo_trl2_amt
   qo_mstr.qo_trl3_cd
   qo_mstr.qo_trl3_amt
   tax_amt
   qo_mstr.qo_curr
   ord_amt
   tax_date
   tax_edit_lbl
   tax_edit when (maint)
   ""       when (not maint) @ tax_edit
with frame qotot.
/*eb3sp5*/ {us/xf/xfqotdsmx.i}
