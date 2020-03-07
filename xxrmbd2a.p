/* xxrmbd2a.p - CIM cleanup utility - remove bdl_mstr record                 */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB               LAST MODIFIED: 2014-JUN-19     BY: gbg *c1472*          */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
define input parameter bdlrecid        as recid.



for  first bdl_mstr exclusive-lock
where recid(bdl_mstr) = bdlrecid:
   delete bdl_mstr.
end.
