/* xxwoblpr.p - WORK ORDER LABEL REPRINT - weight update                     */
/* xxwolbrp.p - WORK ORDER LABEL REPRINT                                     */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB           CREATED: 11-MAR-2011            BY: psu *cy1018*            */
/* CYB     LAST MODIFIED: 12-MAR-2012            BY: nac *d1801*             */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB     LAST MODIFIED: 02-AUG-2013 BY: gbg *c1425*   */

{us/mf/mfdtitle.i "x1 "}   /* TITLE AND DEFINED VARIABLES */
{us/px/pxsevcon.i}         /* SEVERITY PREPROCESSOR INCLUDE FILE */
{us/xf/xfdefa.i  "new"}    /*global FT Vars */

define variable nbr        like wo_nbr                       no-undo.
define variable lot        like wo_lot                       no-undo.
define variable part       like wo_part                      no-undo.
define variable part1      like wo_part                      no-undo.
define variable lotserial  like tr_lot                       no-undo.
define variable lotserial1 like tr_lot                       no-undo.
define variable l_data     like mfc_logical                  no-undo.
define variable l_prt      like mfc_logical                  no-undo.
define variable l_lotitm   like mfc_logical                  no-undo.
define variable l_lblno    as   integer     format ">>9"     no-undo.
define variable vERRNbr as int.
def var vERRMsg as char.
def var chkpart like pt_part no-undo.
def var delyn like mfc_logical.
def var vMessage as char.

define var i as integer no-undo.
define variable lline as integer no-undo.
define variable xline as integer no-undo.
define new shared temp-table xxlbls
	field xxtrnbr like tr_trnbr
	field xxline as integer
	field xxpart like tr_part
	field xxsite like tr_site
	field xxloc like tr_loc
	field xxserial like tr_serial
	field xxoref like tr_ref
	field xxref like tr_ref
	field xxprint as logical initial no
	field xxnbr like wo_nbr.

define buffer bxxlbls for xxlbls.

form
   nbr            colon 20
   lot            colon 20
   part           colon 20
   part1          colon 55
   lotserial      colon 20
   lotserial1     colon 55
with frame a side-labels width 80 attr-space.   
   
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

/*
form
   tr_part     format "x(12)"
   pt_desc1 
   tr_serial 
   tr_ref      column-label "Weight" 
   tr_qty_chg  column-label "Quantity"
with frame x width 80.
*/

form
wo_nbr
skip
xxpart
pt_desc1 at 40 no-label
skip
xxsite
pt_desc2 at 40 no-label
with frame x1 side-labels width 80.

form
xxline column-label "Ln"
xxserial column-label "Serial"
xxoref column-label "Weight"
xxloc    column-label "Location"
with frame x2 width 80 5 down.

form
xline column-label "Line"
bxxlbls.xxserial column-label "Lot/Ser"
bxxlbls.xxref column-label "Weight"
bxxlbls.xxloc column-label "Location"
bxxlbls.xxprint column-label "Print Label"
with frame x3 width 80.

mainloop:
repeat:
   clear frame x all.
   hide frame x. 
   clear frame x1 all. 
   hide frame x1.
   clear frame x2 all. 
   hide frame x2.
   clear frame x3 all. 
   hide frame x3.
   
   assign 
      l_data = no
      l_prt  = yes
      l_lotitm = no
      l_lblno  = 1.
      
   if part1 = hi_char then part1 = "".
   if lotserial1 = hi_char then lotserial1 = "".
   
   if c-application-mode <> "WEB" then
      update 
         nbr
         lot
         part
         part1
         lotserial
         lotserial1
      with frame a.
   
/*
   {us/wb/wbrp06.i &command = update
             &fields = "nbr lot part part1 lotserial lotserial1"
             &frm = "a"}
*/
   
   if nbr = "" and lot = "" then
   do:
      {us/bbi/pxmsg.i &MSGTEXT="'Enter either WO nbr or WO id'" &ERRORLEVEL={&APP-ERROR-RESULT}}
      undo, retry.
   end. /*if nbr = "" and lot = "" then*/
   
   if nbr <> "" and lot <> "" then
      for first wo_mstr no-lock
         where wo_mstr.wo_domain = global_domain 
         and   wo_nbr = nbr 
         and   wo_lot = lot:
      end. /*for first wo_mstr no-lock*/
   if nbr = "" and lot <> "" then
      for first wo_mstr no-lock
         where wo_mstr.wo_domain = global_domain 
         and   wo_lot = lot:
      end. /*for first wo_mstr no-lock*/
   if nbr <> "" and lot = "" then
      for first wo_mstr no-lock
         where wo_mstr.wo_domain = global_domain 
         and   wo_nbr = nbr:
      end. /*for first wo_mstr no-lock*/
         
   if not available wo_mstr then 
   do:
      {us/bbi/pxmsg.i &MSGNUM=510 &ERRORLEVEL=3} /*  WORK ORDER DOES NOT EXIST.*/
      undo, retry.
   end. /*if not available wo_mstr then*/
   
   if available wo_mstr and wo_status <> "C" and wo_status <> "R" then
   do: 
      {us/bbi/pxmsg.i &MSGTEXT="'WO Status should be C or R'" &ERRORLEVEL={&APP-ERROR-RESULT}}
      undo, retry. 
   end. /* if available wo_mstr and (wo_status <> "C" or wo_status <> "R") then*/
   
   bcdparm = "".
   {us/bbi/gprun.i ""gpquote.p""
            "(input-output bcdparm,
              input 6,
              input nbr,
              input lot,
              input part,
              input part1,
              input lotserial,
              input lotserial1,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char)"}
              
   if part1   = "" then part1   = hi_char.
   if lotserial1   = "" then lotserial1   = hi_char.
   
   lline = 0.
   for each xxlbls:
      delete xxlbls.
   end.

   for each tr_hist no-lock 
      where tr_domain   = global_domain
      and   tr_nbr      = nbr
      and  (tr_lot      = lot or lot = "") 
      and   tr_type     = "RCT-WO"
      and   tr_part    >= part
      and   tr_part    <= part1
      and   tr_serial  >= lotserial
      and   tr_serial  <= lotserial1,
      first pt_mstr no-lock
      where pt_domain   = global_domain
      and   pt_part     = tr_part
      break by tr_part by tr_trnbr /* by int(entry(2,tr_serial,"-"))*/:

      l_data = yes.
      lline = lline + 1.
      create xxlbls.
      assign xxtrnbr = tr_trnbr
             xxline = lline
	     xxpart = tr_part
	     xxsite = tr_site
	     xxloc = tr_loc
	     xxserial = tr_serial
	     xxoref = tr_ref
	     xxref = tr_ref
	     xxprint = no
	     xxnbr = wo_nbr.

          find ld_det where ld_domain = global_domain 
          and ld_part = tr_part
          and ld_site = tr_site
          and ld_lot = tr_lot
          and ld_ref = tr_ref
          and ld_qty_oh > 0.0
          no-lock no-error.
	  if available ld_det then xxloc = ld_loc.

   end. /*for each tr_hist no-lock*/  
/*   {us/gp/gpwait.i &OUTSIDELOOP=YES} */


   hide frame a.
   view frame x1.
   i = 0.
   chkpart = "".
   for each xxlbls break by xxpart:
      if xxpart <> chkpart then do:
         find pt_mstr where pt_domain = global_domain 
	                and pt_part = xxpart
			no-lock no-error.
         display wo_nbr
                 xxpart pt_desc1
                 xxsite pt_desc2
         with frame x1.
	 chkpart = xxpart.
      end.
      i = i + 1.
      display xxline
             xxserial
	     xxloc
             xxoref
      with frame x2.
      down with frame x2.
      clear frame x3.
      if i = 5  or last-of(xxpart) then do:
         xline = 1.
         repeat:
/*c1425*    update xline with frame x3. */
/*c1425* start added code */
            updloop:
            repeat:
	       update xline with frame x3.
	       find bxxlbls where bxxlbls.xxline = xline no-error.
	       display bxxlbls.xxserial
	            bxxlbls.xxref
	            bxxlbls.xxloc
               with frame x3.
	       find first ld_det no-lock
	       where ld_domain = global_domain
	       and   ld_site = bxxlbls.xxsite
	       and   ld_loc = bxxlbls.xxloc
	       and   ld_part = bxxlbls.xxpart
	       and   ld_lot = bxxlbls.xxserial
	       and   ld_ref = bxxlbls.xxref
	       and   ld_qty_oh > 0
	       no-error.
	       if not available ld_det
	       then do:
                  vMessage = "Item not in stock".
		  {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
		  undo updloop, retry updloop.
	       end.
	       leave updloop.
            end.  /* updloop P*/
	    if keyfunction(lastkey) = "end-error"
	    then undo, leave.
/*c1425* end   added code */
	    find bxxlbls where bxxlbls.xxline = xline no-error.
	    display bxxlbls.xxserial
	            bxxlbls.xxref
	            bxxlbls.xxloc
            with frame x3.
	    update bxxlbls.xxref 
	           bxxlbls.xxloc 
	    with frame x3.
	    if bxxlbls.xxref <> bxxlbls.xxoref then
	       bxxlbls.xxprint = yes.
            display bxxlbls.xxprint
	    with frame x3.
	 end.
         clear frame x2 all.
	 i = 0.
      end.
   end.
   
   if not l_data then 
   do:
      {us/bbi/pxmsg.i &MSGTEXT="'No Data Found for the Selection'" &ERRORLEVEL={&APP-ERROR-RESULT}}
      undo, retry.
   end.
   
   /*remove this if no labels need to be activated only for lot items*/
   l_lotitm = yes.
   
   /*
   hide all.
   view frame a.
   */

   /*Display all lines selected*/
   {us/bbi/pxmsg.i &MSGNUM=359 &ERRORLEVEL=1 &CONFIRM=l_prt &CONFIRM-TYPE='LOGICAL'}

   hide frame x1.
   hide frame x2.
   hide frame x3.

   if not l_prt then
      undo, retry.
   else do:

      for each xxlbls where xxprint:
         find pt_mstr where pt_domain = global_domain and pt_part = xxpart
	 no-lock no-error.
         display xxpart column-label "Item Number"
	         pt_desc1 column-label "Description"
		 xxserial column-label "Lot/Serial"
		 xxref column-label "Weight"
	 with overlay down frame x4 centered.
	 down with frame x4.
      end.
   end.
   
   /*Is all information correct*/
   {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=l_prt &CONFIRM-TYPE='LOGICAL'}

   if not l_prt then
      undo , retry.

      
   find first xxlbls where xxprint = yes no-lock no-error.
   if available xxlbls then do:

      {us/bbi/gprun.i ""xxcimwtchg.p""
               "(wo_nbr,
	         output vERRNbr,
		 output vERRMsg)"}

     if vErrNbr > 0
     then do:
       do transaction:
          find first msg_mstr exclusive-lock
          where msg_lang = global_user_lang
          and   msg_nbr = 90000
          no-error.
          if not available msg_mstr then do:
             create msg_mstr.
             assign
             msg_lang = global_user_lang
             msg_nbr = 90000.
          end.
          msg_desc = vErrMsg + ". Continue yn".
          release msg_mstr.
       end.
       delyn = no.
       do while delyn = no:
          {us/bbi/pxmsg.i &MSGNUM=90000 &ERRORLEVEL=2 &CONFIRM=delyn}
       end.
       vMessage = vErrMsg.
       {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=2}
       undo, retry.
       pause.
     end.
   end.

   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 80
               &pagedFlag = "nopage"
               &stream = "stream ft"
               &appendToFile = " "
               &streamedOutputToTerminal = " "
               &withBatchOption = "yes"
               &displayStatementType = 1
               &withCancelMessage = "yes"
               &pageBottomMargin = 6
               &withEmail = "yes"
               &withWinprint = "yes"
               &defineVariables = "yes"}
   
   /* {us/xf/xfoutnul.i} */
   for each xxlbls where xxprint break by xxpart by xxtrnbr:
      find first tr_hist where tr_domain = global_domain and tr_trnbr = xxtrnbr
      no-lock no-error.
     {us/xx/xxwolblx.i}
   end. /*for each tr_hist no-lock*/  
   {us/bbi/mfreset.i "stream ft"} 
end. /*mainloop*/
