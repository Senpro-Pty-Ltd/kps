/* xxciml01.p - CIM to custom location transfer xxlotr03.p    */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB   LAST MODIFIED: 20-SEP-2013     BY: gbg *c1440*                      */
/*---------------------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/xx/xxciml01.i new}

/*debug*/ run logit("Start").

def var vError as int.
def var vMessage as char.

def var recid_ophist as recid.

recid_ophist = integer(global_addr) no-error.
if error-status:error then return.
/*debug*/ run logit("Valid Recid").

find first op_hist no-lock
where recid(op_hist) = recid_ophist
no-error.
if not available op_hist then return.
if not op_milestone then return.
if op_wo_op <= 10 then return.
/*debug*/ run logit("Valid Operation").

find first wo_mstr no-lock
where wo_domain = global_domain
and   wo_lot = op_wo_lot
no-error.
if not available wo_mstr then return.
/*debug*/ run logit("WO Master Found").


for first tr_hist no-lock
where tr_domain = global_domain
and   tr_nbr = wo_nbr
and   tr_part = wo_part
and   tr_lot = wo_lot
and   tr_type = "rct-wo"
and   tr_date = op_tran_date:

/*debug*/ run logit("tr_hist Found: " + string(tr_trnbr)).
   vPart = wo_part.
   vQuantity = op_qty_comp.
   vEffDate = today.
   vWOnbr = op_wo_nbr.
   vSOjob = "".
   vRmks = "".
   vSiteFrom = op_site.
   vlocFrom = tr_loc.
   vLotFrom = "".
   vRefFrom = "".
   vSiteTo = op_site.
   vLocTo = vLocFrom.
   vLotTo = vLotFrom.
   vRefTo = "".
   vOutputTo = "".

if not can-find(first code_mstr
            where code_domain = global_domain
	    and   code_fldname = "qxloc"
	    and   code_value = vLocFrom)
then return.
if not can-find(first code_mstr
where code_domain = global_Domain
and   code_fldname = "qxwkctr"
and   code_value = op_wkctr
and   (code_cmmt = "*" or
       lookup(trim(op_mch), code_cmmt) > 0))
then return.

   {us/bbi/gprun.i ""xxcimltr.p""
               "(
	       output vError,
	       output vMessage
	       )"}

   if vError <> 0
   then do:
/*debug*/ run logit("Cim Error: " + vMessage).
       {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=1}
       pause.
   end.    /* if vError <> ) */
end.    /* for first tr_hist */


/* debug *****************************************************************/
define stream logstream.
procedure logit.
define input parameter ipchar as char.

output stream logstream to /tmp/xxrebkfl append.

put stream logstream unformatted
program-name(1) "|"
program-name(2) "|"
string(today) "|"
string(time, "HH:MM:SS")  "|"
global_userid "|"
ipchar
skip.

output stream logstream close.

end.  /* end logit */
