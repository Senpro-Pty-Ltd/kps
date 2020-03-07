/* xxrnacmt.p - SAF Reason Code Account Maintenance                     */
/* Copyright 1986-2010 QAD Inc., Santa Barbara, CA, USA.                */
/* All rights reserved worldwide.  This is an unpublished work.         */
/************************************************************************/
/* CYB        First Created: 26-MAY-2010    BY:  gbg *CY1016*           */
/* CYB        Last Modified: 09-JUL-2010    BY:  gbg *C1183*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/************************************************************************/
{us/mf/mfdtitle.i +x}

{us/gp/gpglefv.i}
{us/gp/gprunpdf.i "gpglvpl" "p"}


def var vmessage as char.
def var del-yn  like mfc_logical.
def var glvalid like mfc_logical.
def var xracid  as recid.
def var tempchar as char.

form
xrac_site   colon 14 label "Site"
si_desc     no-label
xrac_code   colon 14 label "Reason Code"
rsn_desc    no-label
xrac_acct   colon 14 label "Dr Acct"
ac_desc     no-label
xrac_sub    colon 14 label "   Sub"
sb_desc     no-label
xrac_cc     colon 14 format "x(4)" label "CC" 
cc_desc     no-label
xrac_proj   colon 14 label "Project"
prj_desc    no-label
with frame a side-labels width 80 no-attr-space.

mainloop:
repeat:
   keyloop:
   repeat:
     prompt-for 
     xrac_site 
     xrac_code
     with frame a editing:
	if frame-field = "xrac_site"
	then do:
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
	     find first sb_mstr no-lock
	     where sb_domain = global_domain
	     and   sb_sub = xrac_sub
	     no-error.
	     display
	     " " @ sb_desc
	     sb_desc when available sb_mstr
	     with frame a.
	     find first cc_mstr no-lock
	     where cc_domain = global_domain
	     and   cc_ctr = xrac_cc
	     no-error.
	     display
	     " " @ cc_desc
	     cc_desc when available cc_mstr
	     with frame a.
	     find first prj_mstr no-lock
	     where prj_domain = global_domain
	     and   prj_nbr = xrac_proj
	     no-error.
	     display
	     " " @ prj_desc
	     prj_desc when available prj_mstr
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
	     find first sb_mstr no-lock
	     where sb_domain = global_domain
	     and   sb_sub = xrac_sub
	     no-error.
	     display
	     " " @ sb_desc
	     sb_desc when available sb_mstr
	     with frame a.
	     find first cc_mstr no-lock
	     where cc_domain = global_domain
	     and   cc_ctr = xrac_cc
	     no-error.
	     display
	     " " @ cc_desc
	     cc_desc when available cc_mstr
	     with frame a.
	     find first prj_mstr no-lock
	     where prj_domain = global_domain
	     and   prj_nbr = xrac_proj
	     no-error.
	     display
	     " " @ prj_desc
	     prj_desc when available prj_mstr
	     with frame a.
	  end. /* if recno <> ? */
	end.  /* if frame-field = xrac_code */
	else do:
            readkey.
	    apply lastkey.
	end.  /* else do */
     end.  /* editing */


     hide message no-pause.
     find xrac_det no-lock
     where xrac_domain = global_domain
     and   xrac_site = input xrac_site
     and   xrac_code = input xrac_code
     no-error.
     if not available xrac_det
     then do:
       vmessage = "Adding new record".
       {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=1}
       find first si_mstr no-lock
       where si_domain = global_domain
       and   si_site = input xrac_site
       no-error.
       if not available si_mstr
       then do:
         vmessage = "Invalid Site".
	 {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	 undo keyloop, retry keyloop.
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
	 undo keyloop, retry keyloop.
       end.
       create xrac_det.
       assign
       xrac_domain = global_domain
       xrac_site = input frame a xrac_site
       xrac_type = "scrap"
       xrac_code = input frame a xrac_code.
     end.
     else 
     display xrac_site xrac_code
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
     find first sb_mstr no-lock
     where sb_domain = global_domain
     and   sb_sub = xrac_sub
     no-error.
     display
     " " @ sb_desc
     sb_desc when available sb_mstr
     with frame a.
     find first cc_mstr no-lock
     where cc_domain = global_domain
     and   cc_ctr = xrac_cc
     no-error.
     display
     " " @ cc_desc
     cc_desc when available cc_mstr
     with frame a.
     find first prj_mstr no-lock
     where prj_domain = global_domain
     and   prj_nbr = xrac_proj
     no-error.
     display
     " " @ prj_desc
     prj_desc when available prj_mstr
     with frame a.

    leave keyloop.
   end.

   if keyfunction(lastkey) = "end-error" 
   then do:
      hide frame a.
      clear frame a.
      leave mainloop.
   end.

   detloop:
   repeat:
      acctloop:
      repeat:
	if available xrac_det then xracid = recid(xrac_det).
	if not available xrac_det
	then do:
           find first xrac_det no-lock
	   where recid(xrac_det) = xracid
	   no-error.
	   if not available xrac_det then leave detloop.
	end.
	find current xrac_det exclusive-lock.

        tempchar = stline[1].
	stline[1] = stline[2].

        update
        xrac_acct
	go-on ("F5" "CTRL-D")
	with frame a editing:
           {us/mf/mfnp.i ac_mstr xrac_acct
	           "ac_domain = global_domain and
		    ac_code"
		    xrac_code ac_code ac_code}
	    if recno <> ?
	    then do:
              display ac_code @ xrac_acct
	      ac_desc
	      with frame a.
	    end.  /* if recno <> ? */
	end.  /* editing */

        stline[1] = tempchar.
	ststatus = stline[1].
        status input ststatus.

        if lastkey = keycode("F5")
	or lastkey = keycode("CTRL-D")
	then do:
           del-yn = yes.
	   {us/bbi/pxmsg.i &MSGNUM=11 &ERRORLEVEL=1 &CONFIRM=del-yn}
	   if del-yn = no then undo, retry.
	   delete xrac_det.
	   hide frame a no-pause.
	   clear frame a.
	   next mainloop.
	end.  /* lastkey = keycode("F5") */

	find first ac_mstr no-lock
	where ac_domain = global_domain
	and   ac_code =   input xrac_acct
	no-error.
	if not available ac_mstr
	then do:
	  vmessage = "Invalid Account".
	  {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
          next acctloop.
	end.

	leave acctloop.
      end.  /* acctloop */

      if keyfunction(lastkey) = "end-error"
      then do:
	 hide message no-pause.
         display " " @ xrac_acct
	 with frame a.
	 leave detloop.
      end.

      hide message no-pause.

      subloop:
      repeat:
          update
          xrac_sub
          xrac_cc
          xrac_project
          with frame a
	  editing:
	   if frame-field = "xrac_sub"
	   then do:
               {us/mf/mfnp.i sb_mstr xrac_sub
	               "sb_domain = global_domain and
		        sb_active and
		        sb_sub"
		        xrac_sub sb_sub sb_sub}
	        if recno <> ?
	        then do:
                  display sb_sub @ xrac_sub
	          sb_desc
	          with frame a.
	        end.  /* if recno <> ? */
	   end.  /* frame-field = "xrac_sub"  */
	   else if frame-field = "xrac_cc"
	   then do:
               {us/mf/mfnp.i cc_mstr xrac_cc
	               "cc_domain = global_domain and
		        cc_active and
		        cc_ctr"
		        xrac_cc cc_ctr cc_ctr}
	        if recno <> ?
	        then do:
                  display cc_ctr @ xrac_cc
	          cc_desc
	          with frame a.
	        end.  /* if recno <> ? */

	   end.
	   else  if frame-field = "xrac_proj"
	   then do:
               {us/mf/mfnp.i prj_mstr xrac_proj
	               "prj_domain = global_domain and
		        prj_nbr"
		        xrac_proj prj_nbr prj_nbr}
	        if recno <> ?
	        then do:
                  display prj_nbr @ xrac_proj
	          prj_desc
	          with frame a.
	        end.  /* if recno <> ? */

	   end.
	   else do:
             readkey.
	     apply lastkey.
	   end.
	  end.  /* editing */

	  display " " @ sb_desc
	          " " @ cc_desc
	          " " @ prj_desc
	  with frame a.
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
	       next subloop.
	     end.
	     else display sb_desc with frame a.
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
	       next subloop.
	     end.
	     else display cc_desc with frame a.
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
	       next subloop.
	     end.
	     else display prj_desc with frame a.
	  end.

          leave subloop.
      end.  /* detloop */
      if keyfunction(lastkey) = "end-error"
      then do:
          hide message no-pause.
	  leave detloop.
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
	 undo detloop, retry detloop.
      end.  /* if invalid combination */

      leave detloop.
   end.  /* detloop */


end.  /* mainloop */





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
