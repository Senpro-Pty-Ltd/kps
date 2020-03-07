/* xxptsimt.p - Item Master Custom Fields   Item-Site Planning               */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* REVISION: 1.0     LAST MODIFIED: 12-APR-2011     BY: gbg *C1213*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */

{us/mf/mfdtitle.i +1}



def var part          like pt_part.
def var site          like si_site.


form
part   colon 20
site   colon 20
pti_userl01 colon 20  label "UserL01"
with frame a side-labels width 80 no-attr-space.
setFrameLabels (frame a:handle).


mainloop:
repeat:
   update part site
   with frame a.
   find first pt_mstr 
   where pt_domain = global_domain
   and   pt_part = part
   no-error.
   find first si_mstr no-lock
   where si_Domain = global_domain
   and   si_site = site
   no-error.
   if available pt_mstr
   and available si_mstr
   then do:
	find first pti_det
	of pt_mstr
	where pti_det.oid_si_mstr = si_mstr.oid_si_mstr
	no-error.
	if available pti_det
	then do:
          update 
          pti_userl01
	  with frame a.
	end.
   end.
end.  /* mainloop */


