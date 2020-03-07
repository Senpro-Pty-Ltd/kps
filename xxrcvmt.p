/* xxrcvmt.p  - Maintain list of valid sites for CYB Auto Receive            */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 19-SEP-2011     BY: gbg *cy1051*         */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/
{us/mf/mfdtitle.i +1}

def var vFldname  as char  label "Field Name"  init "autorcv".
def var del-yn    like mfc_logical.


form
vFldname     colon 18
usrw_key2    colon 18  label "Site begins"
usrw_charfld[1] colon 18 format "x(40)" label "Description"
with frame a side-labels width 80 no-attr-space.


mainloop:
repeat:
   display vFldname with frame a.
   prompt-for 
   usrw_key2
   with frame a
   editing:
       {us/mf/mfnp.i 
        usrw_wkfl
	usrw_key2
	"usrw_key1 = vFldname and usrw_domain = global_domain and usrw_key2 "
	usrw_key2
	usrw_key2
	usrw_index1}
	if recno <> ?
	then do:
            display usrw_key2 usrw_charfld[1]
	    with frame a.
	end.
   end.
   find first usrw_wkfl exclusive-lock
   where usrw_domain = global_domain
   and   usrw_key1 = vFldname
   and   usrw_key2 = input usrw_key2
   no-error.
   if not available usrw_wkfl
   then do:
        create usrw_wkfl.
	assign
	usrw_domain = global_domain
	usrw_key1 = vFldname
	usrw_key2 = input usrw_key2.
   end.

   update
   usrw_charfld[1]
   go-on ("F5" "CTRL-D")
   with frame a.

   if lastkey = keycode("F5")
   or lastkey = keycode("CTRL-D")
   then do:
       /* confirm delete */
       del-yn = yes.
       {us/bbi/pxmsg.i &MSGNUM=11 &ERRORLEVEL=1 &CONFIRM=del-yn}
       if del-yn then do:
           delete usrw_wkfl.
       end.
   end.   /* lastkey = keycode("F5") */


end.  /* repeat */
