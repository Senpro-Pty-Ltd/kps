/* xfauth.p - ROUTINE TO PRINT AUTHORIZATION NUMBERS ON INVOICE PRINT         */
/* soauth.p - ROUTINE TO PRINT AUTHORIZATION NUMBERS ON INVOICE PRINT         */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfauth.p,v 1.2 2018/03/13 17:09:34 gbg Exp $: */
/* REVISION: 8.6    CREATED    : 12/12/97       BY: *K1DL* Suresh Nayak       */

/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 12/15/98   BY: *K1YG* Seema Varma        */
/* REVISION: 8.6E     LAST MODIFIED: 01/07/99   BY: *K1YD* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 06/28/00   BY: *N0DM* Rajinder Kamra     */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb                */
/* REVISION: 9.1      LAST MODIFIED: 10/10/00   BY: *N0W8* Mudit Mehta        */
/* Revision: 1.12.2.5 BY: Hareesh V             DATE: 11/01/02  ECO: *N1YR*   */
/* Revision: 1.12.2.6 BY: Manisha Sawant        DATE: 12/23/02  ECO: *N22Q*   */
/* Revision: 1.12.2.7 BY: Amit Chaturvedi       DATE: 01/20/03  ECO: *N20Y*   */
/* Revision: 1.12.2.9 BY: Paul Donnelly (SB)    DATE: 06/28/03  ECO: *Q00L*   */
/* Revision: 1.12.2.10  BY: Gnanasekar         DATE: 08/04/03 ECO: *P0V7* */
/* Revision: 1.12.2.12  BY: Ed van de Gevel    DATE: 03/01/05 ECO: *R00G* */
/* Revision: 1.12.2.13  BY: Priyank Khandare   DATE: 11/28/05 ECO: *P49L* */
/* $Revision: 1.2 $         BY: Nishit V           DATE: 02/06/06 ECO: *P4GY* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 07/10/12  ECO: *93sp12.1   */
/* Revision: QAD2015EE    BY: Steve Hong        DATE: 13/01/16  ECO: *grc338   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/* THIS ROUTINE IS CALLED BY sorp1a01.p AND soivrp1a.p TO PRINT THE  */
/* AUTHORIZATION NUMBER ON THE INVOICE PRINT AND INVOICE REPRINT     */

/* STANDARD DEFINITIONS */
{us/bbi/mfdeclre.i}
{us/bbi/cxcustom.i "SOAUTH.P"}
{us/xf/xfdefa.i} /*eb3sp5*/
/* EXTERNAL LABEL INCLUDE */
{us/bbi/gplabel.i}

define shared variable sonbr       like sod_nbr.
define shared variable soline      like sod_line.
define shared variable sopart      like sod_part.
define shared variable so_db       like dc_name.
/* define shared variable soinv       like idh_inv_nbr no-undo. */ /*eb3sp5*/
define shared variable soinv       like idh_inv_nbr. /*eb3sp5*/

define variable cont_lbl     as   character  format "x(10)"           no-undo.
define variable l_par_string like abs_par_id                          no-undo.
define variable l_qty_bo     like sod_qty_ord format "->>>>>>9.9<<<<" no-undo.
define variable l_ext_price  like sod_price
                          label "Ext Price" format "->>>>,>>>,>>9.99" no-undo.
define variable err_flag   as   integer                               no-undo.
define variable l_invprice like sod_price                             no-undo.
define variable l_qty      like sod_qty_ord format "->>>>,>>>,>>9.99" no-undo.
define variable l_qty_ext  like sod_qty_ord format "->>>>,>>>,>>9.99" no-undo.
define variable l_final    like sod_qty_ord format "->>>>,>>>,>>9.99" no-undo.

define variable l_qty_ext_fmt   as character                          no-undo.
define variable l_qty_ext_old   as character                          no-undo.
define variable lv_curr         like so_curr                          no-undo.
define variable rndmthd         like rnd_rnd_mthd                     no-undo.
define variable mc-error-number like msg_nbr                          no-undo.

define shared temp-table t_absr_det no-undo
   field t_absr_id        like absr_id
   field t_absr_reference like absr_reference
   field t_absr_qty       as decimal format "->>>>,>>>,>>9.99"
   field t_absr_ext       as decimal format "->>>>,>>>,>>9.99"
   index t_absr_indx t_absr_id t_absr_reference.
{&SOAUTH-P-TAG1}

cont_lbl = getTermLabel("CONTINUE",10).

/* FORM FOR PRINTING AUTHORIZATION NUMBER FOR CUSTOMERS WHO */
/* PAY BY AUTHORIZATION NUMBER                              */

form
   t_absr_reference column-label "Authorization Number"
   l_qty            column-label "Pagged Qty"
   l_invprice       format ">,>>>,>>9.99<<<"
   l_qty_ext        column-label "Ext Price"
with down frame auth2 width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame auth2:handle).

/* THIS FRAME IS DEFINED FOR DISPLAYING THE ITEM NUMBER AND THE **CONTD** */
/* ON A NEW PAGE WHEN THERE IS A PAGE BREAK. THIS IS DONE BECAUSE BOTH    */
/* INVOICE PRINT AND CLOSED INVOICE REPRINT USES THE SAME FRAME d FOR     */
/* DISPLAYING THE ITEM INFORMATION BUT USE DIFFERENT FORM FOR THE SAME    */
/* FRAME d. INVOICE PRINT USES sod_det TABLE TO DEFINE FRAME d AND CLOSED */
/* INVOICE RE-PRINT USES idh_det TO DEFINE FRAME d.                       */

form
   sod_part
   sod_um
   sod_qty_inv     column-label "   Shipped" format "->>>>>>9.9<<<<<"
   l_qty_bo        column-label " Backorder"
   sod_taxable
   l_invprice      format "->>>>>>>,>>9.99<"
   l_ext_price
with frame contd width 90.

/* SET EXTERNAL LABELS */
setFrameLabels(frame contd:handle).
                   
assign
   l_qty_ext_old = l_qty_ext:format in frame auth2.
   l_invprice = 0.

for first so_mstr 
   where so_domain = global_domain
     and so_nbr    = sonbr
   no-lock:
   lv_curr = so_curr.
end.
if lv_curr = base_curr 
then do:
   find first gl_ctrl where gl_domain = global_domain no-lock no-error.
   rndmthd = gl_rnd_mthd.
end.
else do:
   /* GET ROUNDING METHOD FROM CURRENCY MASTER */
   {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
      "(input lv_curr,
       output rndmthd,
       output mc-error-number)"}
   if mc-error-number <> 0
   then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
      leave.
   end. /* IF soivto11_mc-error-number <> 0 */   
end.

l_qty_ext_fmt = l_qty_ext_old.
{us/bbi/gprun.i ""gpcurfmt.p"" 
   "(input-output l_qty_ext_fmt,
    input rndmthd)"}
l_qty_ext:format in frame auth2 = l_qty_ext_fmt.
                   
for first sod_det
  where sod_det.sod_domain = global_domain
   and   sod_nbr            = sonbr
   and   sod_line           = soline
   no-lock:
   l_invprice = sod_price. 
end. /* FOR FIRST sod_det */

for first idh_hist
  where  idh_domain  = global_domain
   and    idh_inv_nbr = soinv
   and    idh_nbr     = sonbr
   and    idh_line    = soline
   no-lock:
   l_invprice = idh_price.
end. /* FOR FIRST idh_hist */

/*eb3sp5 comment begin
if page-size - line-counter < 1
then do:

   page.

   display
      sod_part
      cont_lbl @ sod_qty_inv
   with frame contd.
end. /* IF page-size -line-count < 1 */
eb3sp5 comment end*/

/* PRINTING AUTHORIZATION NUMBER */
for each t_absr_det
   no-lock
   break by t_absr_reference:

   l_qty     = l_qty     + t_absr_qty.
   l_qty_ext = l_qty_ext + t_absr_ext.

   if t_absr_qty <> 0
   and last-of(t_absr_reference)
   then do:

      /* DISPLAY THE EXTENDED AMOUNT FOR EACH AUTHORIZATION */
      /*eb3sp5 comment begin
      display
         t_absr_reference
         l_qty
         l_invprice
         l_qty_ext
      with frame auth2.
      down with frame auth2.
      eb3sp5 comment end*/
      {us/xf/xfsoaut9mz.i} /*eb3sp5*/

      l_final = l_final + l_qty_ext.

      assign
         l_qty     = 0
         l_qty_ext = 0.

   end. /* IF t_absr_qty <> 0 */

   if last-of(t_absr_reference)
   then
      display
         getTermLabel("TOTAL",12) + ": " @ l_invprice
         l_final                         @ l_qty_ext
      with frame auth2.

end. /* FOR EACH t_absr_det */

/* DELETING THE WORKFILE */
empty temp-table t_absr_det
   no-error.
