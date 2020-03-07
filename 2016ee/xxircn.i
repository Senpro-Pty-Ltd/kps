/* xxircn.i  Includes for Intersite Request Consolidation                    */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 28-AUG-2012    BY:  gbg *c1335*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/


function nextirseq returns char ().
def var tempvar-seq as int.
def var tempvar-pre as char.
def var tempreturn as char.

find first code_mstr exclusive-lock
  where code_domain = global_domain
  and   code_fldname = "ircons"
  and   code_value = "voucher"
  no-error.
  if not available code_mstr then do:
     create code_mstr.
     assign
     code_domain = global_domain
     code_fldname = "ircons"
     code_value = "voucher"
     code_cmmt = "A0000002"
     tempreturn = "A0000001".
     return tempreturn.
  end.
  tempreturn = code_cmmt.
  tempvar-pre = substring(code_cmmt, 1, 1).
  tempvar-seq = integer(substring(code_cmmt, 2)) no-error.
  if error-status:error then tempvar-seq = 9999999.
  if tempvar-seq >= 9999999
  then do:
     tempvar-pre = if tempvar-pre = "Z" then "A" else
                   chr(asc(tempvar-pre) + 1).
     tempvar-seq = 1.
  end.
  else tempvar-seq = tempvar-seq + 1.
  code_cmmt = tempvar-pre +
              string(tempvar-seq, "9999999").
  return tempreturn.
end.
