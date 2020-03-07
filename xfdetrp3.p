/* xfdetrp3.p - DISPLAY TAX DETAIL AMOUNTS FOR A TRANSACTION                  */
/* txdetrp3.p - DISPLAY TAX DETAIL AMOUNTS FOR A TRANSACTION                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfdetrp3.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/*  This program displays a down frame of tax detail (by) for each            */
/*  tax type/class/usage shows the tax; descrip, amount, base amount & tax %  */
/* $Revision: 1.2 $    BY: Prajakta Patil        DATE: 01/07/08  ECO: *P67L* */
/* Revision: QAD2014   BY: Amol Dudvadkar        DATE: 03/16/15 ECO: *grc338* */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*!
Receives the following parameters
I/O     Name        Like            Description
-----   ----------- --------------- ------------------------------
input   tr_type     tx2d_tr_type    Transaction Type Code
input   ref         tx2d_ref        Document Reference
input   nbr         tx2d_nbr        Number (Shipper, etc.)
                                    "*" indicates all tx2d_nbr(s)
                                    for a given tx2d_ref
input   col-80      mfc_logical     True for 80 column report
input   page_break  integer         number of lines on first page

*/
/***************************************************************************/
/* NOTE ALTHOUGH EACH TX2D_DET RECORD HAS A CURRENCY, WE WILL NOT USE */
/* THIS CURRENCY FOR DISPLAY PURPOSES.  THIS IS THE TAX ROUND METHOD  */
/* AND WAS USED TO ROUND THE AMOUNTS PRIOR TO ROUNDING THEM TO THE    */
/* DOCUMENT CURRENCY.  ALL AMOUNTS DISPLAYED ON A DOCUMENT ARE        */
/* DISPLAYED IN DOCUMENT CURRENCY.  THE SHARED VARIABLE RNDMTHD       */
/* CONTAINS THE ROUNDING METHOD FOR THE DOCUMENT CURRENCY.            */
{us/bbi/mfdeclre.i }
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/xf/xfdefa.i} /*grc338*/
/* PARAMETERS */
define input  parameter tr_type     like tx2d_tr_type no-undo.
define input  parameter ref         like tx2d_ref no-undo.
define input  parameter nbr         like tx2d_nbr no-undo.
define input  parameter col-80      as logical    no-undo.
define input  parameter page_break  as integer    no-undo.
define input  parameter base_rpt    like ap_curr      no-undo.
define input  parameter mixed_rpt   like mfc_logical  no-undo.

/* WORKFILES */
{us/tx/txdetdef.i}

define buffer bufsomstr for so_mstr.
define buffer bufihhist for ih_hist.

/*SHARED VARIABLES */
define shared variable undo_txdetrp     like mfc_logical.
define shared variable rndmthd          like rnd_rnd_mthd.
/* define shared variable l_include_retain like mfc_logical no-undo. */ /*grc338*/

/* LOCAL VARIABLES */
define variable first_page            as logical initial true no-undo.
define variable ar_ap                 as logical initial true no-undo.
define variable l_sign                as integer            no-undo.
define variable l-taxdesc             like tx2_desc    no-undo.
define variable l-taxclass            like tx2_pt_taxc no-undo.
define variable l-nontax              like tx2d_tottax no-undo.
define variable c-cont                as character format "x(35)" no-undo.
define variable i                     as integer no-undo.
define variable l_taxlang             as character no-undo.
define variable comment_printed       like mfc_logical no-undo.
define variable l_tax_comment_message as character extent 2 format "x(40)" no-undo.

{us/bbi/pxmsg.i &MSGNUM=6638 &ERRORLEVEL=1 &MSGBUFFER=l_tax_comment_message[1]}
{us/bbi/pxmsg.i &MSGNUM=6639 &ERRORLEVEL=1 &MSGBUFFER=l_tax_comment_message[2]}

c-cont = CAPS(dynamic-function('getTermLabelFillCentered' in h-label,
   input "CONTINUED",
   input 35,
   input "*")).

{us/tx/txcurvar.i}
{us/gp/gpcrfmt.i}
/*grc338 comment begin
form header
   fill("-",77) format "x(77)" skip
   space(30)
   c-cont
   skip(8)
with frame continue page-bottom width 80.
grc338 comment end*/
form
   taxdetail.taxdesc        column-label "Tax Type Description!Tax Rate Description"
   taxdetail.taxclass at 28 column-label "Tax Class!Tax Usage"
   taxdetail.taxtotal       column-label "Tax Amount"
   taxdetail.taxpercnt      column-label "Tax!Rate"
   taxdetail.nontax         column-label "Taxable!Non-taxable"
                            format "->>>>,>>>,>>9.99"
with frame det_80 width 80 down.

/* SET EXTERNAL LABELS */
setFrameLabels(frame det_80:handle).

form
   taxdetail.typedesc    column-label "Tax Type!Description"
   l-taxdesc             column-label "Tax!Description"
   l-taxclass            column-label "Tax!Class"
   taxdetail.taxusage    column-label "Tax!Usage"
   taxdetail.taxtotal    column-label "Tax!Amount"
   taxdetail.taxpercnt   column-label "Tax!Rate"
   taxdetail.taxbase     column-label "Taxable!Sales"
                         format "->>>>,>>>,>>9.99"
   l-nontax              column-label "Non-Taxable!Sales"
                         format "->>>>,>>>,>>9.99"
with frame det_132 width 132 down.

/* SET EXTERNAL LABELS */
setFrameLabels(frame det_132:handle).

assign
   gtm_taxbase_old = taxdetail.taxbase:format
   gtm_taxtot_old = taxdetail.taxtotal:format
   gtm_nontax_old = taxdetail.nontax:format.

for first txc_ctrl
   where txc_ctrl.txc_domain = global_domain
no-lock: end.

if not txc_detrp
then do:
   /* PRINT ONLY IF FLAG = TRUE */
   undo_txdetrp = false.
   return.
end. /* IF NOT TXC_DETRP */

/* ADD TRANSACTION TYPES FOR LOGISTICS CHARGES(40-48) */
if lookup(tr_type,
    "20,21,22,23,24,25,26,27,28,29,40,41,42,43,44,45,46,47,48") <> 0 then
   ar_ap = false.

/* MOST USER DOCS ARE 80-COLUMN FORMAT : SET ONLY IF 132 COLUMNS ARE NEEDED */
mainloop:
do on endkey undo, leave:

   /* ACCUMULATE TAX DETAILS  */
   if tr_type = "33" or tr_type = "34" then do:
      {us/fs/fstdetrp.i}
   end.
   else do:
      {us/tx/txdetrpa.i}
   end.
   /*grc338 comment begin
   for each taxdetail
      where taxdetail.taxapruse = yes
      exclusive-lock:
      if not l_include_retain
      then
         taxstopdisplay = yes.
   end. /* FOR EACH taxdetail */
   grc338 comment end*/
   /* SET UP CURRENCY DEPENDENT FORMATS */
   /* SET UP TAXBASE FORMAT FOR FRAME DET_132 */
   gtm_taxbase_fmt = gtm_taxbase_old.

   run gpcrfmt (input-output gtm_taxbase_fmt, input rndmthd).

   taxdetail.taxbase:format in frame det_132 = gtm_taxbase_fmt.

   /* SET UP TAXTOTAL FORMAT FOR FRAMES DET_80 & DET_132 */
   gtm_taxtot_fmt = gtm_taxtot_old.

   run gpcrfmt (input-output gtm_taxtot_fmt, input rndmthd).

   taxdetail.taxtotal:format in frame det_80 = gtm_taxtot_fmt.
   taxdetail.taxtotal:format in frame det_132 = gtm_taxtot_fmt.

   /* SET UP NONTAX FORMAT FOR FRAMES DET_80 & DET_132 */
   gtm_nontax_fmt = gtm_nontax_old.

   run gpcrfmt (input-output gtm_nontax_fmt, input rndmthd).

   taxdetail.nontax:format in frame det_80 = gtm_nontax_fmt.
   l-nontax:format in frame det_132 = gtm_nontax_fmt.

   /* DISPLAY TAX DETAILS    */
   /* {us/tx/txdetrpb.i} *grc338*/
   {us/xf/xfdetrpb.i} /*grc338*/

   undo_txdetrp = false.

end. /* end mainloop do */
