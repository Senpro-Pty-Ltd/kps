/* xxrmbd1a.p - CIM cleanup utility - remove bdld_det record                 */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB               LAST MODIFIED: 2014-JUN-19     BY: gbg *c1472*          */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
define input parameter bdldrecid        as recid.



for  first bdld_det exclusive-lock
where recid(bdld_det) = bdldrecid:
   delete bdld_det.
end.
