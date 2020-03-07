/* xxutgl01.p - Mark unposted gl ref as 'posted'                             */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 11-NOV-2011     BY: gbg *c1259*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/


{us/mf/mfdtitle.i +1}

def var vgltref       like glt_ref.
def var vMessage      as char.
def var i             as int.

def var vText         as char format "x(78)" extent 6.
vText[1] = 
"This utility changes the flags on unposted GL transactions".
vText[2] = 
"That are created from the ~"Posted Invoices~" so that they no longer".
vText[3] = 
"show as unbalanced. These transactions normally do not show, but ".
vText[4] = 
"can be left with the flags incorrectly set. This utility sets these".
vText[5] = 
"flags correctly. Run this by entering the GL reference for the ".
vText[6] = 
"individual invoice transaction.".

form
vgltref    colon 20  skip(2)
vText[1]   no-label skip
vText[2]   no-label skip
vText[3]   no-label skip
vText[4]   no-label skip
vText[5]   no-label skip
vText[6]   no-label skip(2)
vMessage   no-label
with frame a side-labels width 80 no-attr-space.




mainloop:
repeat:

   display 
   vText[1]
   vText[2]
   vText[3]
   vText[4]
   vText[5]
   vText[6]
   with frame a.
   update
   vgltref
   with frame a.
   vMessage = " ".
   display vMessage with frame a.


   if not can-find(first glt_det
                   where glt_domain = global_domain
		   and   glt_ref = vgltref)
   then do:
      vMessage = "No transactions with reference " + vgltref.
      {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
      undo mainloop, retry mainloop.
   end.

   i = 0.
   for each glt_det
   where glt_domain = global_domain
   and   glt_ref    = vgltref:
      assign
      i = i + 1
      glt_unb = no
      glt_exp = yes.
   end.
   vMessage = trim(string(i)) + " records processed".
   display vMessage with frame a.

end.  /* mainloop */
