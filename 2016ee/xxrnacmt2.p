/* xxrnacmt2.p - SAF Reason Code Account Maintenance                    */
/* Copyright 1986-2010 QAD Inc., Santa Barbara, CA, USA.                */
/* All rights reserved worldwide.  This is an unpublished work.         */
/************************************************************************/
/* CYB        First Created: 26-MAY-2010    BY:  gbg *CY1016*           */
/* CYB        Last Modified: 09-JUL-2010    BY:  gbg *C1183*            */
/* CYB        Rewrite      : 09 Sep 2010    BY:  nac *CY1016a*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "3+ "}

{us/bbi/gpfilev.i}
{us/gp/gprunpdf.i "gpglvpl" "p"}

define variable del-yn     like mfc_logical initial no.
define variable yn         like mfc_logical initial no.
define variable valid_acct like mfc_logical.
define variable filename   like _file._file-name no-undo.
define variable table_list as character no-undo.
define variable si_recno   as recid no-undo.

def var vmessage as char.
def var glvalid like mfc_logical.
def var xracid  as recid.
def var tempchar as char.

/* Variable added to perform delete during CIM.
 * Record is deleted only when the value of this variable
 * Is set to "X" */
define variable batchdelete as character format "x(1)" no-undo.
define variable l_error     as integer no-undo.
define variable l_error2    as integer no-undo.
define variable l_error3    as integer no-undo.
define variable old_domain  like global_domain no-undo.
define variable lv_err_lg   as logical no-undo.
define variable old_site    like si_site no-undo.
define variable code_page as character no-undo.

define buffer   si-buffer for si_mstr.

define new shared variable msg like msg_desc format "x(50)".

define new shared frame indel.
define new shared stream prt.

/* CHECK IF PRM IS INSTALLED */
/* SETS THE FLAG PRM-ENABLED = YES IF IT IS. */
{us/pj/pjchkprm.i}

{us/ut/utindel.i} /* FRAME indel */

/* DISPLAY SELECTION FORM */
form
   xrac_site   colon 14 label "Site"
   si_desc     no-label
   xrac_code   colon 14 label "Reason Code"
   rsn_desc    no-label
   skip(1)
   xrac_acct   colon 14 label "Dr Acct"
   xrac_sub    no-label  
   xrac_cc     no-label 
   xrac_proj   no-label
   ac_desc     no-label
with frame a side-labels width 80 attr-space.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

define new shared frame c.
form
   space(2) msg
with frame c width 55 down overlay row 4 column 12
no-labels no-attr-space.

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.

/* DISPLAY */
view frame a.

if not {us/bbi/gpiswrap.i} and dbcodepage("qaddb") = "utf-8" and not {us/gp/gpisutf8.i} then do:
   /* PROGAM HAS LIMITED FUNCTIONALITY IN CHUI WITH UTF-8 DB, USE .NET UI */
   {us/bbi/pxmsg.i &MSGNUM=1551 &ERRORLEVEL=2 &PAUSEAFTER=TRUE}
   assign code_page = session:cpinternal.
end.

global_site = "".

mainloop:
repeat with frame a:

   /* Initialize delete flag before each display of frame */
   assign
      batchdelete = ""
      l_error     = 0
      l_error2    = 0
      l_error3    = 0.

   hide frame c.

   /* Prompt for the delete variable in the key frame at the end of
   * The key field/s only when batchrun is set to yes */
   prompt-for 
      xrac_site 
      xrac_code
      batchdelete no-label when (batchrun)
   editing:
      if frame-field = "xrac_site"
      then do:
         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i xrac_det  xrac_site 
	         "xrac_domain = global_domain and xrac_site "
	         xrac_site xrac_site xrac_code}
         if recno <> ?
	 then do:
	    find first rsn_ref no-lock
	    where rsn_domain = global_domain
	    and   rsn_code = xrac_code
	    no-error.
	    find first si_mstr no-lock
	    where si_domain = global_domain 
	    and   si_site = xrac_site
	    no-error.
            display
	    xrac_site
	    " " @ si_desc
	    si_desc when available si_mstr
	    xrac_code
	    "no reason table " @ rsn_desc
	    rsn_desc when available rsn_ref
	    xrac_acct xrac_sub xrac_cc xrac_project
	    with frame a.

            find first ac_mstr no-lock
            where ac_domain = global_domain
	    and   ac_code = xrac_acct
	    no-error.
	    display
	    " " @ ac_desc
	    ac_desc when available ac_mstr
	    with frame a.
         end.  /* if recno <> ? */
      end. /* if frame-field = xrac_site */
      else if frame-field = "xrac_code"
      then do:
         {us/mf/mfnp.i xrac_det xrac_code
              "xrac_domain = global_domain and 
	      xrac_site = input xrac_site and 
	      xrac_code "
              xrac_code xrac_code xrac_code}
         if recno <> ?
	 then do:
	    find first rsn_ref no-lock
	    where rsn_domain = global_domain
	    and   rsn_type = "scrap"
	    and   rsn_code = input xrac_code
	    no-error.
            display
	    xrac_code
	    " " @ rsn_desc
	    rsn_desc when available rsn_ref
	    xrac_acct xrac_sub xrac_cc xrac_project
	    with frame a.
	    find first ac_mstr no-lock
	    where ac_domain = global_domain
	    and   ac_code = xrac_acct
	    no-error.
	    display
	    " " @ ac_desc
	    ac_desc when available ac_mstr
	    with frame a.
	 end. /* if recno <> ? */
      end.  /* if frame-field = xrac_code */
      else do:
         readkey.
         apply lastkey.
      end.  /* else do */
   end.  /* editing */

   /* ADD/MOD/DELETE  */
   find xrac_det
   where xrac_domain = global_domain
   and   xrac_site = input xrac_site
   and   xrac_code = input xrac_code
   exclusive-lock no-error.

   if not available xrac_det
   then do:

      if input xrac_site = ""
         or input xrac_code = ""
      then do:
          /*Blank # not allowed*/
          {us/bbi/pxmsg.i &MSGNUM=906 &ERRORLEVEL=3 &MSGARG1=""site""}
          undo mainloop, retry.
      end. /* if input xrac_site = "" then do: */
      find first si_mstr no-lock
      where si_domain = global_domain
      and   si_site = input xrac_site
      no-error.
      if not available si_mstr
      then do:
        vmessage = "Invalid Site".
        {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
        next-prompt xrac_site with frame a.
        undo, retry. 
      end.
      find first rsn_ref no-lock
      where rsn_domain = global_domain
      and   rsn_code = input xrac_code
      and   rsn_type = "scrap"
      no-error.
      if not available rsn_ref
      then do:
         vmessage = "Invalid Reason Code".
         {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
         next-prompt xrac_code with frame a.
         undo, retry.
      end.

      /** Adding new record **/
      {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}

      /* Creating new record */
      create xrac_det.
      assign
      xrac_domain = global_domain
      xrac_site = input frame a xrac_site
      xrac_type = "scrap"
      xrac_code = input frame a xrac_code.

   end. /* if not available si_mstr then do: */


   recno = recid(xrac_det).

   ststatus = stline[2].
   status input ststatus.
   del-yn = no.

   display
      xrac_site xrac_code
      xrac_acct xrac_sub xrac_cc xrac_proj
   with frame a.

   find first si_mstr no-lock
   where si_domain = global_domain
   and   si_site = xrac_site
   no-error.
   if available si_mstr
   then display si_desc
   with frame a.
   find first rsn_ref no-lock
   where rsn_domain = global_domain
   and   rsn_type = "scrap"
   and   rsn_code = xrac_code
   no-error.
   if available rsn_ref
   then display rsn_desc with frame a.

   find first ac_mstr no-lock
   where ac_domain = global_domain
   and   ac_code = xrac_acct
   no-error.
   display
   " " @ ac_desc
   ac_desc when available ac_mstr
   with frame a.

   do on error undo, retry:
      hide frame c.

      set
         xrac_acct xrac_sub xrac_cc xrac_proj
      go-on("F5" "CTRL-D").

      if xrac_acct <> ""
      then do:
	 find first ac_mstr no-lock
	 where ac_domain = global_domain
 	 and   ac_code =   input xrac_acct
	 no-error.
	 if not available ac_mstr
         then do:
            vmessage = "Invalid Account".
           {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
           next-prompt xrac_acct with frame a.
           undo, retry.
         end.
	 else
	    display ac_desc with frame a.
      end.

      if xrac_sub <> ""
      then do:
         find first sb_mstr no-lock
         where sb_domain = global_domain
         and   sb_active
         and   sb_sub = xrac_sub
         no-error.
         if not available sb_mstr 
         then do:
            vmessage = "Invalid Sub Account".
           {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
           next-prompt xrac_sub with frame a.
           undo, retry.
         end.
      end.

      if xrac_cc <> ""
      then do:
        find first cc_mstr no-lock
         where cc_domain = global_domain
         and   cc_active
         and   cc_ctr = xrac_cc
         no-error.
         if not available cc_mstr 
         then do:
           vmessage = "Invalid Cost Centre".
           {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
           next-prompt xrac_cc with frame a.
           undo, retry.
         end.
      end.

      if xrac_proj <> ""
      then do:
         find first prj_mstr no-lock
         where prj_domain = global_domain
         and   prj_nbr = xrac_proj
         no-error.
         if not available prj_mstr 
         then do:
            vmessage = "Invalid Project".
            {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
            next-prompt xrac_proj with frame a.
            undo, retry. 
          end.
       end.

      /* Check Account Combination */
      run verify-gl-accounts
          (input xrac_acct,
	   input xrac_sub,
	   input xrac_cc,
	   input xrac_proj,
	   input "dr_acct",
	   output glvalid).

      if not glvalid
      then do:
	 next-prompt xrac_acct with frame a.
	 undo, retry.
      end.  /* if invalid combination */

      /* DELETE */
      /* Delete to be executed if batchdelete is set or
       * F5 or CTRL-D pressed */
      if lastkey = keycode("F5")
      or lastkey = keycode("CTRL-D")
      or input batchdelete = "x"
      then do with frame c:

         del-yn = yes.
         /** Please confirm delete **/
         {us/bbi/pxmsg.i &MSGNUM=11 &ERRORLEVEL=1 &CONFIRM=del-yn}
         if not del-yn then undo, retry.

	 delete xrac_det.

         pause 2 no-message.
         hide frame c no-pause.
         clear frame a.
         del-yn = no.
         next.

      end. /* then do */

   end. /* do on error undo, retry: */

   release xrac_det.

end. /* repeat with frame a: */
status input.

PROCEDURE verify-gl-accounts:
   /* THIS SUBROUTINE DETERMINES THE VALIDITY OF THE ACCOUNT, SUB-    */
   /* ACCOUNT, COST CENTER AND PROJECT  USING THE PERSISTENT          */
   /* PROCEDURES.                                                     */
   define input  parameter acct        like trgl_dr_acct no-undo.
   define input  parameter sub         like trgl_dr_sub  no-undo.
   define input  parameter cc          like trgl_dr_cc   no-undo.
   define input  parameter proj        like wo_proj      no-undo.
   define input  parameter acctfldname like trgl_dr_acct no-undo.
   define output parameter glvalid     like mfc_logical initial true no-undo.

   /* INITIALIZE SETTINGS */
   {us/gp/gprunp.i "gpglvpl" "p" "initialize"}

   /* SET CONTROL FOR CHEKCING ACCOUNT GLTYPE/GLSYSTEMTYPE */
   {us/gp/gprunp.i "gpglvpl" "p" "set_acct_gltype_ver" "(input false)"}

   /* AP_ACCT/SUB/CC VALIDATION */
   {us/gp/gprunp.i "gpglvpl" "p" "validate_fullcode"
      "(input acct,
        input sub,
        input cc,
        input proj,
        input acctfldname,
        output glvalid)"}

END PROCEDURE.
