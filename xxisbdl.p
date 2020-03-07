/* xxisbdl.p - Utility to delete isb records                                 */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 29-MAY-2012     BY: gbg *c1301*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

{us/mf/mfdtitle.i +1}

def var vpart      like pt_part.
def var vserial    like isb_serial.
def var vref       like isb_ref.
def var delconf    like mfc_logical.
def var vmessage   as char.

form
vpart  colon 16      pt_desc1 no-label
vserial  colon 16
vref    colon 16
isb_eu_nbr colon 16 ad_name no-label
skip(1)
delconf colon 16 label "Confirm delete"
with frame a side-labels width 80 no-attr-space.


on leave of vpart in frame a
do:
  find first pt_mstr no-lock
  where pt_domain = global_domain
  and   pt_part = input frame a vpart
  no-error.
  if available pt_mstr then display pt_desc1 with frame a.
end. /* leave of vpart */

mainloop:
repeat:
   delconf = no.
   update 
   vpart
   vserial
   vref
   with frame a
   editing:
      case frame-field:
	 when "vpart" then do:
            {us/mf/mfnp.i
	     isb_mstr
	     vpart
	     "isb_domain = global_domain and
	      isb_part "
	     vpart isb_part
	     isb_part_ser}
	     if recno <> ?
	     then do:
		vserial = isb_serial.
		vref = isb_ref.
		run dispisb (recno).
	     end.
	 end.  /*  when vpart */
	 when "vserial" then do:
            {us/mf/mfnp.i
	     isb_mstr
	     vserial
	     "isb_domain = global_domain and
	      isb_part = input vpart and
	      isb_serial "
	     vpart isb_part
	     isb_part_ser}
	     if recno <> ?
	     then do:
		vserial = isb_serial.
		vref = isb_ref.
		run dispisb (recno).
	     end.
	 end.  /* when vserial */
	 when "vref" then do:
            {us/mf/mfnp.i
	     isb_mstr
	     vref
	     "isb_domain = global_domain and
	      isb_part = input vpart and
	      isb_serial = input vserial and
	      isb_ref "
	     vpart isb_part
	     isb_part_ser}
	     if recno <> ?
	     then do:
		vserial = isb_serial.
		vref = isb_ref.
		run dispisb (recno).
	     end.
	 end.  /* when vref */
         otherwise do:
            readkey.
	    apply lastkey.
         end.  /* otherwise */
      end.  /* case */
   end.

   if not available isb_mstr 
   or recno = ?
   or recid(isb_mstr) <> recno then
   find first isb_mstr no-lock
   where isb_domain = global_domain
   and   isb_part = vpart
   and   isb_serial = vserial
   and   isb_ref = vref
   no-error.
   if not available isb_mstr
   then do:
	vmessage = "No isb record found".
	{us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
        undo mainloop, retry mainloop.
   end.
   run dispisb (recid(isb_mstr)).

   update delconf with frame a.

   if delconf then do:
       run delisb (recid(isb_mstr)).
   end.
   else do:
     vmessage = "Process abandoned. Record not deleted".
     {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=1}
     undo mainloop, retry mainloop.
   end.

   pause.
end.  /* mainloop */


procedure dispisb.
def input parameter iprecno as recid.
find first isb_mstr no-lock
where recid(isb_mstr)  = iprecno
no-error.
if not available isb_mstr then return.
display 
" " @ pt_desc1
isb_serial @ vserial
isb_ref @ vref
isb_eu_nbr
" " @ ad_name
with frame a.

find first pt_mstr no-lock
where pt_domain = global_domain
and   pt_part = isb_part
no-error.
if available pt_mstr then display pt_desc1 with frame a.

find first ad_mstr no-lock
where ad_domain = global_domain
and   ad_addr = isb_eu_nbr
no-error.
if available ad_mstr then display ad_name with frame a.


end.  /* procedure dispisb */

procedure delisb.
def input parameter iprecno  as recid.
find first isb_mstr exclusive-lock
where recid(isb_mstr) = iprecno
no-error.

if not available isb_mstr then return.

delete isb_mstr.

end.  /* procedure delisb */
