/* xxprir01.i - CYB Price List Report                                        */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 09-MAY-2013    BY:  gbg *c1404*                      */
/* CYB    LAST MODIFIED: 24-MAY-2013    BY:  gbg *c1408*                      */
/* CYB    LAST MODIFIED: 17-JUN-2013    BY:  gbg *c1419*                      */
/* CYB                   LAST MODIFIED: 2019-Feb-28 BY: gbg *K10017* P1033 */
/* CYB                   LAST MODIFIED: 2019-Feb-28 BY: gbg *K10017g* P1033 */
/*---------------------------------------------------------------------------*/



def {1} shared temp-table ttcan
field  ttcmaddr   like cm_addr
field  ttanxcode  like anx_code
field  ttrecid    as recid.



procedure bildcsanx.
define input parameter ipcode   as char.
define input parameter ipcmaddr as char.

for each an_mstr no-lock
where an_domain = global_domain
and  an_cmtindx = 0,
each anx_det no-lock
where anx_domain = global_domain
and anx_code = an_code
/*c1408*/ and anx_type = "9"
/*c1408*/ and anx_active
and   anx_node = ipcode
/*c1419*/  and not can-find(first code_mstr
                            where code_domain = global_domain
			    and   code_fldname = "priAlwaysExcl"
			    and   code_value = anx_code) 
/*c1408*/ and (not anx_logic or
/*c1408*/      not can-find(first code_mstr
                            where code_domain = global_domain
			    and   code_fldname = "priExclCodes"
			    and   code_value = anx_code))
:
   create ttcan.
   assign
   ttcmaddr = ipcmaddr
   ttanxcode = anx_code.
   run bildcsanx (anx_code, ipcmaddr).

end.

end. /* procedure bildanx */
