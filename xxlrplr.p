/* xxlrplr.p  - WORK ORDER LABEL REPRINT                                     */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB    LAST MODIFIED: 05-SEP-2012    BY:  gbg *c1340*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB     DATE: 2015-JUL-10      BY: gbg  *d3205*                    */
/******************************************************************************/

{us/mf/mfdtitle.i "x1 "}   /* TITLE AND DEFINED VARIABLES */
{us/px/pxsevcon.i}         /* SEVERITY PREPROCESSOR INCLUDE FILE */
{us/xf/xfdefa.i  "new"}    /*global FT Vars */

define variable part       like wo_part                      no-undo.
define variable lotserial  like ld_lot                       no-undo.
define variable ref        like ld_ref  label "Weight"       no-undo.
define variable l_data     like mfc_logical                  no-undo.
define variable l_prt      like mfc_logical                  no-undo.
define variable l_lotitm   like mfc_logical                  no-undo.
define variable l_lblno    as   integer     format ">>9"     no-undo.
define variable vmessage   as char.
define variable ld_recid   as recid.


form
   part           colon 20 pt_desc1 no-label
   lotserial      colon 20
   ref            colon 20
   skip(1)
   l_lblno        colon 20 label "Number of Copies"
   skip(1)
with frame a side-labels width 80 attr-space.   
   
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

on leave of part in frame a
do:
   display " " @ pt_desc1
   with frame a.
   find first pt_mstr no-lock
   where pt_domain = global_domain
   and   pt_part = input frame a part
   no-error.
   if available pt_mstr then 
   display pt_desc1
   with frame a.
end.

mainloop:
repeat:
   
   assign 
      l_data = no
      l_prt  = yes
      l_lotitm = no
      l_lblno  = 1.
      
   
   if c-application-mode <> "WEB" then
      update 
         part
         lotserial
         ref
      with frame a.

   {us/wb/wbrp06.i &command = update
             &fields = "part lotserial ref"
             &frm = "a"}
   
   find first pt_mstr no-lock
   where pt_domain = global_domain
   and   pt_part = part
   no-error.
   if not available pt_mstr
   then do:
      vmessage = "Item does not exist".
      {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
      undo mainloop, retry mainloop.
   end.

   display pt_desc1
   with frame a.
   
   ld_recid = ?.
   for each ld_det no-lock
   where ld_domain = global_domain
   and   ld_part = part
   and   ld_lot = lotserial
   and   (ref = " " or ld_ref = ref)
   and   ld_qty_oh > 0.0
   break by ld_domain by ld_part by ld_lot:
     if not (first-of(ld_lot) and last-of(ld_lot))
     then do:
        vmessage = "Item/Serial exists in multiple locations".
	{us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=1}
     end.
     ld_recid = recid(ld_det).
   end.

   if ld_recid <> ? then 
   find first ld_det no-lock
   where recid(ld_det) = ld_recid
   no-error.

   if ld_recid = ?
   or not available ld_det
   then do:
      vmessage = "No inventory for this Item/Serial/Ref".
      {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
      undo mainloop, retry mainloop.
   end.
   
   
   bcdparm = "".
   {us/bbi/gprun.i ""gpquote.p""
            "(input-output bcdparm,
              input 6,
              input part,
              input lotserial,
              input ref,
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
              input null_char,
              input null_char,
              input null_char,
              input null_char)"}
              
   
   /*remove this if no labels need to be activated only for lot items*/
   l_lotitm = yes.
   l_lblno = 1.
   
   update 
      l_lblno when l_lotitm
   with frame a.
   
      
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
   {us/xx/xxlrplr.i}
   {us/bbi/mfreset.i "stream ft"} 
end. /*mainloop*/
