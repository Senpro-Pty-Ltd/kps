/* xxoplp.p - ONLINE PRODUCTION LABEL PRINT                             */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */
/* $Revision: 1.2 $                                                     */
/*V8:ConvertMode=Report                                                 */
/* CYB                  BY: nac           DATE: 27 Jan 11 ECO: *Q9028 CRD04*  */
/* CYB                  BY: gbg           DATE: 06-Sep-11 ECO: *c1237*        */
/* CYB                  BY: gbg           DATE: 06-Sep-11 ECO: *cy1035*       */
/* CYB                  BY: gbg           DATE: 27-Sep-11 ECO: *cy1035-001*   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 27-Mar-2013 BY: nac *d2101n*   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 27-Apr-2013 BY: nac *d2101x*   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "2+ "}

/*d2101n   define variable record    like rps_record no-undo. */
/*d2101x   /*d2101n*/ define variable record    as integer format ">>>>>>>9" no-undo. */
/*d2101x*/ /*d2101n*/ define variable record    as char format "x(8)" no-undo.
/*d2101x*/ define variable op        like wr_op no-undo.
define variable site      like rps_site no-undo.
define variable prline    like rps_line no-undo.
define variable due       like rps_due_date no-undo.
define variable rps_start like rps_due_date no-undo.
define variable msgText         like msg_desc no-undo.
define variable i         as integer no-undo.
define new shared variable part      like rps_part no-undo.
define new shared variable open_ref  like rps_qty_req column-label "Qty Open" no-undo.
define variable xcomma as character initial ",". 
define variable xbuffer_qty like rps_qty_req.

assign
   part    = global_part
   site    = global_site
/*d2101x*/   op      = 20 .


find first lnd_det no-lock
   where lnd_domain = global_domain
   and   lnd_site = site
   and   lnd_part = part no-error.
if available lnd_det then prline = lnd_line.

due = today.

if weekday(due) = 1
then due = due + 1.
else due = due + 2 - weekday(due).

/* New Selection Form */
form
   part colon 15
   pt_desc1 no-label format "x(16)" 
   record colon 15 label "ID Number" 
   due colon 15
/*d2101x*/ op colon 15 label "Op"
   skip(2)
with side-labels frame b no-underline width 80 attr-space.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

{us/wb/wbrp01.i}

repeat:

   if c-application-mode <> 'web' then
      update
         part
         record
         due
/*d2101x*/ op
      with frame b
   editing:

      if frame-field = "part" then do:

         /* FIND NEXT/PREVIOUS RECORD */
/*d2101x>>
         {us/mf/mfnp.i rps_mstr part  " rps_domain = global_domain
              and rps_part "  part rps_part rps_part}
 *d2101x<<*/
/*d2101x>> */
         {us/mf/mfnp.i wr_route part  " wr_domain = global_domain
              and wr_part "  part wr_part wr_part}
/*d2101x<<*/

         if recno <> ? then do:
/*d2101x    display rps_part @ part with frame b. */
/*d2101x    display rps_line with frame a. */
/*d2101x*/  display wr_part @ part with frame b.
/*d2101x*/  display wr_prod_line with frame a.
            find pt_mstr no-lock
               where pt_domain = global_domain
/*d2101x       and   pt_part = rps_part no-error. */
/*d2101x*/     and   pt_part = wr_part no-error.
            if available pt_mstr then
               display pt_desc1 pt_desc2 pt_site with frame a.
            else
               display " " @ pt_desc1 with frame a.
            recno = ?.
         end.
      end.
      else if frame-field = "record" then do:
         /* FIND NEXT/PREVIOUS RECORD */
/*d2101x>>
         {us/mf/mfnp05.i rps_mstr rps_part
            " rps_domain = global_domain
              and rps_part = input part" rps_record "input record"}
 *d2101x<<*/
/*d2101x>>*/
         {us/mf/mfnp05.i wr_route wr_part
            " wr_domain = global_domain
              and wr_part = input part" wr_lot "input record"}
/*d2101x<<*/

         if recno <> ? then do:
            display
/*d2101x       rps_record @ record */
/*d2101x       rps_due_date @ due */
/*d2101x*/     wr_lot @ record
/*d2101x*/     wr_due @ due
/*d2101x*/     wr_op @ op
            with frame b.
/*d2101x    display rps_line with frame a. */
/*d2101x*/  display wr_lot with frame a.
            find pt_mstr no-lock
               where pt_domain = global_domain
/*d2101x       and   pt_part = rps_part no-error. */
/*d2101x*/     and   pt_part = wr_part no-error.
            if available pt_mstr then
               display pt_desc1 pt_desc2 pt_site with frame a.
            else
               display " " @ pt_desc1 with frame a.
            recno = ?.
         end.
      end.
      else do:
         status input.
         readkey.
         apply lastkey.
      end.
   end.

/*d2101x>>
   find first rps_mstr
        where rps_domain = global_domain
         and  rps_part = part
         and  rps_record = record
	 and rps_due_date = due
   no-lock no-error.
   if not available rps_mstr then do:
     /* Schedule does not exist */
      {us/bbi/pxmsg.i &MSGNUM=7156 &ERRORLEVEL=3}
      if c-application-mode = 'web' then return.
      undo,retry.
   end.
 *d2101x<<*/

/*d2101x>>*/
   find first wr_route
        where wr_domain = global_domain
         and  wr_part = part
         and  wr_lot = record
	 and wr_due = due
	 and wr_op = op
	 /* and wr_status = "e" */
   no-lock no-error.
   if not available wr_route then do:
     /* operation does not exist */
      {us/bbi/pxmsg.i &MSGNUM=106 &ERRORLEVEL=3}
      if c-application-mode = 'web' then return.
      undo,retry.
   end.
/*d2101x<<*/

/*d2101x
   find first wo_mstr 
        where wo_domain = global_domain
	  and wo_nbr = rps_part 
	  and wo_lot = string(rps_record)
	  and wo_type = "s"
   no-lock no-error.
 *d2101x*/
/*d2101x>>*/
   find first wo_mstr 
        where wo_domain = global_domain
	  and wo_nbr = wr_part 
	  and wo_lot = wr_lot
	  and wo_type = "s"
   no-lock no-error.
/*d2101x<<*/

   find pt_mstr no-lock
   where pt_domain = global_domain
   and   pt_part = part no-error.
   if not available pt_mstr then do:
      /* Item number does not exist */
      {us/bbi/pxmsg.i &MSGNUM=16 &ERRORLEVEL=3}
      undo, retry.
   end.

/*d2101x>>
   find first wr_route no-lock
   where wr_domain = global_domain
   and   wr_lot = wo_lot no-error.
   if not available wr_route then do:
      /* wr_woute does not exist */
      {us/bbi/pxmsg.i &MSGNUM=106 &ERRORLEVEL=3}
      undo, retry.
   end.
 *d2101x<<*/

   find first code_mstr 
        where code_domain = global_domain
	  and code_fldname = "prdlbl"
   no-lock no-error.
   if available code_mstr then xbuffer_qty = integer(code_value).
   else xbuffer_qty = 0.

/*d2101x
   if rps_qty_req - rps_qty_comp > 0 then
      open_ref = (rps_qty_req - rps_qty_comp + xbuffer_qty).
   else
      open_ref = rps_qty_req + xbuffer_qty.
 *d2101x*/

/*d2101x>>*/
   if wr_qty_ord - wr_qty_comp > 0 then
      open_ref = (wr_qty_ord - wr_qty_comp + xbuffer_qty).
   else
      open_ref = wr_qty_ord + xbuffer_qty.
/*d2101x<<*/


   display 
      pt_desc1 colon 17 label "Description"
      pt_desc2 no-label skip
      pt_site colon 17 label "Site" skip
/*d2101x      rps_line colon 17 label "Production Line" skip */
/*d2101x*/    wr_prod_line colon 17 label "Production Line" skip
      wr_op colon 17 label "Operation" skip
      open_ref colon 17 label "Quantity"
      skip(3)
   with side-labels frame a.

   update open_ref with frame a.


   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
         &printWidth = 132
         &pagedFlag = " "
         &stream = " "
         &appendToFile = " "
         &streamedOutputToTerminal = " "
         &withBatchOption = "no"
         &displayStatementType = 1
         &withCancelMessage = "yes"
         &pageBottomMargin = 6
         &withEmail = "yes"
         &withWinprint = "yes"
         &defineVariables = "yes"
         &withSecondOutput = "yes"}


   /* FIND AND DISPLAY */


/*cy1035-001* start added code */
      {us/mf/mfrpchk.i}

/*d2101x   {us/xf/xfput.i rps_part        10   "x(18)" } */ /* Item  */

      put 
      {us/xf/xfput.i pt__chr05       1   "x(8)" }   /* label  */
      {us/xf/xfput.i xcomma          9   "x(1)"  } /* Comma */
/*d2101x*/ {us/xf/xfput.i wr_part        10   "x(18)" } /* Item  */
      {us/xf/xfput.i xcomma          28   "x(1)"  } /* Comma */
      {us/xf/xfput.i pt_draw         29   "x(18)" } /* Item  */
      {us/xf/xfput.i xcomma          47   "x(1)"  } /* Comma */
      {us/xf/xfput.i open_ref        48   "9999" }. /* Label Number  */
/*cy1035-001* end added code */


/*cy1035-001* start deleted code >>>>>>>>>
   do i = 1 to open_ref:

      {us/mf/mfrpchk.i}

      put 
      {us/xf/xfput.i pt__chr05       1   "x(8)" }   /* label  */
      {us/xf/xfput.i xcomma          9   "x(1)"  } /* Comma */
      {us/xf/xfput.i rps_part        10   "x(18)" } /* Item  */
      {us/xf/xfput.i xcomma          28   "x(1)"  } /* Comma */
      {us/xf/xfput.i pt_draw         29   "x(18)" } /* Item  */
      {us/xf/xfput.i xcomma          47   "x(1)"  } /* Comma */
      {us/xf/xfput.i i               48   "9999" }. /* Label Number  */

   end.
*cy1035-001 end deleted code */
   {us/bbi/mfreset.i}

   seconddevice:
   do:
      if {us/bbi/gpiswrap.i} then do:
         /* For Desktop the "page" mechanism doesn't expect to  */
         /* get two generated reports in a row.  However, if    */
         /* there is a screen in between them it will function. */
         /* Press 'Next' to print invoices */
         display msgText with frame aa no-labels.
         {us/gp/gpwait.i}  /* Does a "wait-for" */
      end.

      /* PRINT Second labels */
      {us/bbi/gprun.i ""xxoplpa.p""}
   end.
   {us/bbi/pxmsg.i &MSGNUM=8 &ERRORLEVEL=1}

end.

{us/wb/wbrp04.i &frame-spec = a}
