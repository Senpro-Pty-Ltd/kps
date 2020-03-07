/* xfemmt3.p   - Maintenance of Addr/Email WITH FORM OVERRIDES                */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/*V8:ConvertMode=Maintenance                                                  */
/* REVISION: 9.21sp4        CREATED: 21-Jun-06  BY: Andrew Foord *080812*     */
/* REVISION: 9.21sp8FT  CREATED: 01/19/09  BY: Ashish Mishra  *QAD09003* */
/* QAD01             BY: Prajakta P.          DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Modified by: Steve Hong                              Date: 01/11/12 *     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE                */
/****************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "x1 "}

define variable del-yn   like mfc_logical initial no.
define variable emailstr as cha no-undo.
define variable faxstr   as cha no-undo.

define temp-table ftforms no-undo
field form-code  as cha
field form-desc  as cha
index idx1 form-code.

/*Valid Forms Are  */
/*invoice          */
/*po               */
/*so               */
/*shipper          */
/*quote            */
/*remit            */
/*wo               */
/*statement        */
/*packlist         */

/*See xfemail7.i   */

create ftforms.
assign form-code = "invoice"
       form-desc = "Invoice Print/Invoice-Reprint".
       
create ftforms.
assign form-code = "po"
       form-desc = "Purchase Order Print".       

create ftforms.
assign form-code = "so"
       form-desc = "Sales Order Print".

create ftforms.
assign form-code = "shipper"
       form-desc = "Shipper/Pre-Shipper".
       
create ftforms.
assign form-code = "quote"
       form-desc = "Sales Quote".
       
create ftforms.
assign form-code = "remit"
       form-desc = "Remitance Advice/EFT Payment Specification". 
       
create ftforms.
assign form-code = "wo"
       form-desc = "Work Order".
       
create ftforms.
assign form-code = "statement"
       form-desc = "Customer Statement".
       
create ftforms.
assign form-code = "packlist"
       form-desc = "Picklist/Pre-Shipper - Automatic".                                  



/* Variable added to perform delete during CIM.
* Record is deleted only when the value of this variable
* Is set to "X" */
define variable batchdelete as character format "x(1)" no-undo.

/* DISPLAY SELECTION FORM */

form
   ad_addr         colon 15
   ad_name         colon 15
   skip(1)
   ad_fax          colon 15
   skip(1)
   qad_logfld[1]   colon 15 label "Type" format "Email/Fax"
   "    (E)mail/(F)ax"
   qad_charfld[2]  colon 15 format "x(54)" label "Email/FaxNo"
   skip
   "                                        |" colon 15
   skip
   qad_charfld[1]  colon 15 label "Output String" format "x(60)"
with frame a side-labels width 80 attr-space.

form
   form-code       colon 15 format "x(9)" label "Form"
   form-desc       format "x(40)" no-label

   qad_logfld[1]   colon 15 label "Type" format "Email/Fax"
   "    (E)mail/(F)ax"
   qad_charfld[2]  colon 15 format "x(54)" label "Email/FaxNo"
   skip
   "                                        |" colon 15
   skip
   qad_charfld[1]  colon 15 label "Output String" format "x(60)"
with frame b side-labels width 80 attr-space title color normal " Form Override ".


/* /* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
*/

do transaction:
   for first code_mstr no-lock
   where code_domain = global_domain 
   and   code_fldname = "ft_email_startz"
   and   code_value   = "":
   end.

   if not available code_mstr then do:
      create code_mstr.
      assign code_domain  = global_domain
             code_fldname = "ft_email_startz"
             code_value   = ""
             code_cmmt    = "SMTPTO#".
          
   end.

   emailstr = code_cmmt.

   for first code_mstr no-lock 
   where code_domain  = global_domain 
   and   code_fldname = "ft_fax_startz"
   and   code_value   = "":
   end.

   if not available code_mstr then do:
      create code_mstr.  
      assign code_domain  = global_domain
             code_fldname = "ft_fax_startz"
             code_value   = ""
             code_cmmt    = "W2KFAX#".
          
   end.

   faxstr = code_cmmt.

end.

/* DISPLAY */
view frame a.
view frame b.

mainloop:
repeat with frame a:

   /* Initialize delete flag before each display of frame */
   batchdelete = "".

   do on error undo, retry:

      /* Prompt for the delete variable in the key frame at the
       * End of the key field/s only when batchrun is set to yes */
      prompt-for
         ad_addr
         batchdelete no-label when (batchrun)
      editing:
         {us/mf/mfnp.i ad_mstr ad_addr "ad_domain = global_domain and ad_addr"
	 ad_addr ad_addr ad_addr}

         if recno <> ? then do:
            run showa.
         end.
      end. /* editing: */
   end. /* do on error undo, retry: */

   /* ADD/MOD/DELETE  */
   for first ad_mstr where ad_domain = global_domain and 
   ad_addr = input ad_addr exclusive-lock:
   end.
   
   if not available ad_mstr then do:
      {us/bbi/pxmsg.i &MSGNUM=980 &ERRORLEVEL=3}
      undo, retry.
   end.

   run showa.

   for first qad_wkfl where qad_domain = global_domain
   and qad_key1 = "ft_email"
   and qad_key2 = ad_addr exclusive-lock:
   end.

   if not available qad_wkfl then do:
      {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}
      create qad_wkfl.
      assign
         qad_domain    = global_domain
	 qad_key1      = "ft_email"
	 qad_logfld[1] = yes /*email*/
         qad_key2      = ad_addr.
   end. /* if not available qad_wkfl then do: */

   ststatus = stline[2].
   status input ststatus.

   display qad_logfld[1].

   set qad_logfld[1]
       qad_charfld[2]
       go-on(F5 CTRL-D).

   /* Delete to be executed if batchdelete is set or
    * F5 or CTRL-D pressed */
   if lastkey = keycode("F5") or lastkey = keycode("CTRL-D")
   or input batchdelete = "x"
   then do:

      del-yn = yes.

      /* Please confirm delete */
      {us/bbi/pxmsg.i &MSGNUM=11 &ERRORLEVEL=1 &CONFIRM=del-yn}
   
      if del-yn then do:
         delete qad_wkfl.
         
         /*Remove any Form Overrides */
         for each qad_wkfl exclusive-lock
         where qad_domain = global_domain
	 and qad_key1     = "ft_email"
         and  qad_key2 begins ad_addr + "+":
            delete qad_wkfl.
         end.
         
         clear frame a.
      end. /* if del-yn then do: */

   end. /* then do: */
   else do:
      if qad_charfld[2] = "" then qad_charfld[1] = "".
      else qad_charfld[1] = (if qad_logfld[1] = yes then emailstr else faxstr) + qad_charfld[2].
   
      run showa.
   end.
   
   mainloop:
   repeat with frame b:
      /* Prompt for the delete variable in the key frame at the
       * End of the key field/s only when batchrun is set to yes */
      prompt-for
         form-code
         batchdelete no-label when (batchrun)
      editing:
         {us/mf/mfnp.i ftforms form-code form-code form-code form-code idx1}
   
         if recno <> ? then do:
            run showb.
         end.
      end. /* editing: */
   
      /* ADD/MOD/DELETE  */
      for first ftforms where form-code = input frame b form-code:
      end. 
      
      if not available ftforms then do:
         msg_temp = "Invalid Form".
         {us/bbi/pxmsg.i &MSGTEXT=msg_temp &ERRORLEVEL=3}
         undo, retry.
      end.     
   
      run showb.
   
      for first qad_wkfl where qad_domain = global_domain
      and qad_key1 = "ft_email"
      and qad_key2 = input ad_addr + "+" + ftforms.form-code exclusive-lock:
      end.
   
      if not available qad_wkfl then do:
         {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}
         create qad_wkfl.
         assign
            qad_domain    = global_domain
   	 qad_key1      = "ft_email"
   	 qad_logfld[1] = yes /*email*/
            qad_key2      = input frame a ad_addr + "+" + ftforms.form-code .
      end. /* if not available qad_wkfl then do: */
   
      ststatus = stline[2].
      status input ststatus.
   
      display qad_logfld[1].
   
      set qad_logfld[1]
          qad_charfld[2]
          go-on(F5 CTRL-D).
   
      /* Delete to be executed if batchdelete is set or
       * F5 or CTRL-D pressed */
      if lastkey = keycode("F5") or lastkey = keycode("CTRL-D")
      or input batchdelete = "x"
      then do:
   
         del-yn = yes.
   
         /* Please confirm delete */
         {us/bbi/pxmsg.i &MSGNUM=11 &ERRORLEVEL=1 &CONFIRM=del-yn}
      
         if del-yn then do:
            delete qad_wkfl.
                     
            clear frame b.
         end. /* if del-yn then do: */
   
      end. /* then do: */
      else do:
         if qad_charfld[2] = "" then qad_charfld[1] = "".
         else qad_charfld[1] = (if qad_logfld[1] = yes then emailstr else faxstr) + qad_charfld[2].
      
         run showb.
      end.
      
   end. /*repeat with frame b*/

end. /* repeat with frame a */

status input.

procedure showa:
   clear frame b.

   for first qad_wkfl no-lock
   where qad_domain = global_domain
   and   qad_key1 = "ft_email"
   and   qad_key2 = ad_mstr.ad_addr:
   end.

   display ad_addr
           ad_name when available ad_mstr
           ad_fax 
           qad_logfld[1] when available qad_wkfl
           "" when not available qad_wkfl @ qad_logfld[1] 
           qad_charfld[2] when available qad_wkfl
           "" when not available qad_wkfl @ qad_charfld[2]
           qad_charfld[1] when available qad_wkfl
           "" when not available qad_wkfl @ qad_charfld[1]
           with frame a.

   for first qad_wkfl no-lock
   where qad_domain = global_domain
   and   qad_key1 = "ft_email"
   and   qad_key2 begins ad_mstr.ad_addr + "+":
   end.
   
   if available qad_wkfl then do:
      display "** Form Overrides Exist **" @ form-desc with frame b.
   end.            
           
end.

procedure showb:
   for first qad_wkfl no-lock
   where qad_domain = global_domain
   and   qad_key1 = "ft_email"
   and   qad_key2 = ad_mstr.ad_addr + "+" + ftforms.form-code:
   end.

   display form-code
           form-desc
           qad_logfld[1] when available qad_wkfl
           "" when not available qad_wkfl @ qad_logfld[1] 
           qad_charfld[2] when available qad_wkfl
           "" when not available qad_wkfl @ qad_charfld[2]
           qad_charfld[1] when available qad_wkfl
           "" when not available qad_wkfl @ qad_charfld[1]
           with frame b.
end.

/*eof*/
