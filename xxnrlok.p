/* xxnrlok.p */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 2011-OCT-06     BY: gbg *c1250*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/
def buffer nr1 for nr_mstr.

for each nr_mstr no-lock:

find first nr1 exclusive-lock
where recid(nr_mstr) = recid(nr1)
no-wait no-error.
if locked nr1 then do: 
   display nr_mstr.nr_seqid recid(nr_mstr)
   with frame d down. 
   down with frame d.
end.
pause.

end.


