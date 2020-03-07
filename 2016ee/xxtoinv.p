/* xxtoinv.p - update so_to_inv flag in separate transaction */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 29-APR-2013    BY:  gbg *c1394*                     */
/*---------------------------------------------------------------------------*/

def input parameter iprecid as recid.

def buffer xso for so_mstr.

for first xso where recid(xso) = iprecid:
   xso.so_to_inv = yes.
end.
