/* xxwolbrp.p - WORK ORDER LABEL REPRINT                                     */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB           CREATED: 11-MAR-2011            BY: psu *cy1018*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB     DATE: 2015-JUL-10      BY: gbg  *d3205*                    */
/******************************************************************************/

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

form
   nbr            colon 20
   lot            colon 20
   part           colon 20
   part1          colon 55
   lotserial      colon 20
   lotserial1     colon 55
   skip(1)
   l_lblno        colon 20 label "Number of Copies"
   skip(1)
with frame a side-labels width 80 attr-space.   
   
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
   tr_part     format "x(12)"
   pt_desc1 
   tr_serial 
   tr_ref      column-label "Weight" 
   tr_qty_chg  column-label "Quantity"
with frame x width 80.

mainloop:
repeat:
   clear frame x all no-pause.
   hide frame x no-pause.
   
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
   
   
   {us/wb/wbrp06.i &command = update
             &fields = "nbr lot part part1 lotserial lotserial1"
             &frm = "a"}
   
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
      
      for first si_mstr no-lock 
         where si_domain = global_domain
         and   si_site   = tr_site:
         if can-find(first pti_det
             where pti_det.oid_pt_mstr = pt_mstr.oid_pt_mstr
             and   pti_det.oid_si_mstr = si_mstr.oid_si_mstr
             and   pti_lot_ser = "L") then 
             l_lotitm = yes. 
         else
             if pt_lot_ser = "L" then l_lotitm = yes.            
      end.
         
      display
         tr_part     
         pt_desc1 
         tr_serial 
         tr_ref      
         tr_qty_chg  
      with frame x width 80 down.
      down with frame x.     
      {us/gp/gpwait.i &INSIDELOOP=YES &FRAMENAME=x}
   end. /*for each tr_hist no-lock*/  
   {us/gp/gpwait.i &OUTSIDELOOP=YES}
   
   if not l_data then 
   do:
      {us/bbi/pxmsg.i &MSGTEXT="'No Data Found for the Selection'" &ERRORLEVEL={&APP-ERROR-RESULT}}
      undo, retry.
   end.
   
   /*remove this if no labels need to be activated only for lot items*/
   l_lotitm = yes.
   
   update 
      l_lblno when l_lotitm
   with frame a.
   
   /*Is all information correct*/
   {us/bbi/pxmsg.i &MSGNUM=12004 &ERRORLEVEL=1 &CONFIRM=l_prt &CONFIRM-TYPE='LOGICAL'}
   
   if not l_prt then
      undo , retry.
      
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
   
   {us/xf/xfoutnul.i} 
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
      break by tr_part by tr_trnbr /*by int(entry(2,tr_serial,"-"))*/:
     {us/xx/xxwolbl.i}
   end. /*for each tr_hist no-lock*/  
   {us/bbi/mfreset.i "stream ft"} 
end. /*mainloop*/
