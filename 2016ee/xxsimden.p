/* xxsimden.p - Update entities on Site connection records                   */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB               LAST MODIFIED: 28-MAY-2010     BY: gbg gg1000           */
/* CYB       LAST MODIFIED:  28-MAY-2010      BY: gbg *Q3702*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/

def input parameter ip_site  like si_site.
{us/bbi/mfdeclre.i}
def var vmessage as char.


form
si_site    colon 10
si_desc no-label
with frame am width 80 side-labels.

form
si_db    format "x(8)" no-label
dom_name format "x(20)" no-label 
si_entity format "x(4)"
en_name format "x(20)" no-label
with frame m width 80 side-labels.

find first si_mstr no-lock
where si_domain = global_domain
and   si_site = ip_site
no-error.
if not available si_mstr then return.
display
si_site si_desc
with frame am.

mainloop:
for each si_mstr
where si_site = ip_site
and   si_db = global_domain
and   si_db <> si_domain
,
first dom_mstr no-lock
where dom_domain = si_domain:
   find first en_mstr no-lock
   where en_entity = si_entity
   and   en_domain = si_domain
   no-error.
   if not available en_mstr
   then do:
      find first en_mstr no-lock
      where en_entity = si_entity
      and   en_domain = si_db
      no-error.
   end.

   display
   si_db 
   dom_name 
   si_entity 
   " " @ en_name
   en_name when available en_mstr
   with frame m.

   entloop:
   repeat:
     update 
     si_entity
     with frame m
     editing:
        {us/mf/mfnp.i en_mstr si_entity
	        "en_domain = si_domain and en_entity"
		si_entity en_entity en_entity}
        if recno <> ?
	then do:
	   si_entity = en_entity.
           display 
	   si_entity
	   en_name
	   with frame m.
	end.  /* reno <> ? */
     end. /* editing */
     find first en_mstr no-lock
     where en_domain = si_domain
     and   en_entity = si_entity
     no-error.
     if not available en_mstr
     then do:
          vmessage = "Invalid Entity".
	  {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=1}
     end.
     display 
     " " @ en_name
     en_name when available en_mstr
     with frame m.
     leave entloop.
   end.
   if key-function(lastkey) = "end-error"
   then do:
      leave mainloop.
   end.

end.
