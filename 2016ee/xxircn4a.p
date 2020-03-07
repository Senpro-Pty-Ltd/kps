/* xxircn4a.p - Intersite Request Remove Consolidated Lines                  */
/* xxircn2a.p - Intersite Request Remove Consolidated Lines                  */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 22-MAY-2012     BY: gbg *d1815*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                   LAST MODIFIED: 2015-OCT-19 BY: gbg *d3269*   */
/*---------------------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/xx/xxdr.i}

define input parameter ipshipsite           as char.
define input parameter ipsitefr             as char.
define input parameter ipsiteto             as char.
/*d3269* start added code >>> */
define input parameter daysBefore      as int.
define input parameter daysAfter       as int.
/*d3269* end added code   <<< */
define input parameter ipdate               as date.
define input parameter ipupdate             as logical.

define buffer bdsr for dsr_mstr.
define buffer bdsd for dsd_det. 

def var trfr_qty  as dec format "->>,>>>,>>9.99" label "Consol Qty".
def var trfr_nbr  as char label "Consol Req".
def var req_nbr   as char.
def var vError   as int.
def var vErrMessage as char.
def var vMessage as char.




form
dsd_Det.dsd_req_nbr
dsd_Det.dsd_part
dsd_det.dsd_shipsite
dsd_Det.dsd_site
dsd_det.dsd_shipdate
dsd_det.dsd_qty_ord
trfr_qty 
trfr_nbr
with frame rpd width 132 down no-box no-attr-space.

def var dsdstatexcl as char.
find first code_mstr no-lock
where code_domain = global_domain
and   code_fldname = "dsdstatexcl"
and   code_value = "excl"
no-error.
if available code_mstr then dsdstatexcl = code_cmmt.
else dsdstatexcl = "B,E,A,R,F".


for each si_mstr no-lock
where si_domain = global_domain
and   si_site >= ipsitefr
and si_site <= ipsiteto:
    updloop:
    repeat transaction:

        for each dsd_det no-lock
        where dsd_det.dsd_domain = global_domain
        and   dsd_det.dsd_shipsite = ipshipsite
/*d3269* start added code >>> */
        and dsd_det.dsd_shipdate >= ipdate - daysBefore
        and dsd_det.dsd_shipdate <= ipdate + daysAfter
/*d3269* end added code   <<< */
        and   dsd_det.dsd_site = si_site,
        first dsr_mstr no-lock
        where dsr_mstr.dsr_domain = global_domain
        and   dsr_mstr.dsr_req_nbr = dsd_det.dsd_req_nbr
	and   (dsr_mstr.dsr_rmks = "consolidated ir" or
	       dsd_det.dsd_rmks = "consolidated ir")
        break by dsd_det.dsd_site by dsd_det.dsd_part:

	   if dsd_det.dsd_nbr = ""
	   and dsd_det.dsd_status = "P"
	   then do:
              assign
              trfr_qty = dsd_Det.dsd_qty_ord - dsd_det.dsd_qty_ship.

              accumulate trfr_qty (total by dsd_det.dsd_part).


              display 
              dsd_Det.dsd_req_nbr
              dsd_Det.dsd_part
              dsd_det.dsd_shipsite
              dsd_Det.dsd_site
              dsd_det.dsd_shipdate
              dsd_det.dsd_qty_ord
              trfr_qty 
              trfr_nbr
              with frame rpd.
              down with frame rpd.
	   end.

           if ipupdate 
	   and dsd_det.dsd_nbr = ""
	   and dsd_det.dsd_status = "P"
	   then do:              /* remove this ir & mrp record */
              {us/bbi/gprun.i ""xxcimir.p""
               "(dsd_det.dsd_site,
                 dsd_det.dsd_req_nbr,
		 ?,
                 dsr_mstr.dsr_ord_date,
                 dsr_mstr.dsr_due_date,
 		 0.0,
 		 ""P"",
 		 ""Consolidated IR"",
 		 """",
 		 """",
 		 output vError,
 		 output vErrMessage)"}
              if vError <> 0
              then do:
                 {us/bbi/pxmsg.i &MSGTEXT=vErrMessage &ERRORLEVEL=1}
	         pause.
              end.
           end.
	   else do:
	     if ipupdate
	     and  dsd_det.dsd_status = "P"
	     then do:
                run clearrmks(recid(dsd_det)).
	     end.
	   end.  /* if ipupdate and dsd_det.dsd_nbr = "" ..  else do */



        end.
        if not ipupdate then do:
           undo updloop, leave updloop.
        end.
        leave updloop.
    end. /* repeat transaction */
end. /* each si_site */

procedure clearrmks.
define input parameter iprecid   as recid.

find first bdsd exclusive-lock
where recid(bdsd) = iprecid
no-error.
if available bdsd
then do:
   find first bdsr exclusive-lock
   where bdsr.dsr_domain = global_domain
   and   bdsr.dsr_req_nbr = bdsd.dsd_req_nbr
   and   bdsr.dsr_site = bdsd.dsd_site
   and  bdsr.dsr_rmks = "concolidated ir"
   no-error.
   if available bdsr then bdsr.dsr_rmks = " ".
   if bdsd.dsd_rmks = "consolidated ir" then bdsd.dsd_rmks = " ".
end.

end.  /* procedure clearrmks */
