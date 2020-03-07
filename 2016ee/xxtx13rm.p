/* xxtx13rm.p - Fix tax only invoices                                        */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 29-NOV-2012    BY:  gbg *c1359*                     */
/* CYB       LAST MODIFIED: 05-FEB-2013     BY: gbg *cy1002h*                 */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

{us/bbi/mfdeclre.i}


define input parameter  iprecid  as recid.
define output parameter opresult as int.

define stream xlog.
define buffer btx2d for tx2d_det.






find first so_mstr no-lock
where recid(so_mstr) = iprecid
no-error.
if not available so_mstr then return.
run logit("SOTX:" + so_nbr).
opresult = 0.


for each tx2d_det no-lock 
where tx2d_det.tx2d_domain = so_domain
and   tx2d_det.tx2d_ref = so_nbr
and   tx2d_det.tx2d_nbr = ""
and   tx2d_det.tx2d_line = 0
and   tx2d_det.tx2d_trl = ""
and   tx2d_det.tx2d_tr_type = "13" 
and   tx2d_totamt <> 0:
      
  find first sod_det no-lock 
  where sod_domain = so_domain 
  and   sod_nbr = so_nbr 
  and   sod_qty_inv <> 0 no-error .
     
  if not available sod_det 
  then  do:
     find first btx2d exclusive-lock
     where recid(btx2d) = recid(tx2d_det)
     no-error.
     if available btx2d 
     then do:
        run logit("RMTX:" + so_nbr + ":" + tx2d_det.tx2d_tr_type + ":" +
	      trim(string(tx2d_det.tx2d_totamt, "->>>>>>>9.99"))).
        delete btx2d.
	opresult = 1.
     end. /* if available btx2d */
  end.  /* not available sod_det */
end.  /* each tx2d_det */


procedure logit.
define input parameter ipmsg as char.

if can-find(first code_mstr
            where code_domain = global_domain
	    and   code_fldname = "debug"
	    and   code_value begins "xxtx13rm")
then do:
   output stream xlog to 
             value(string(year(today), "9999")  +
             string(month(today), "99")  +
             string(day(today), "99") +
             global_userid)
	     append.
	  
      put stream xlog unformatted
          string(today) "|"
          program-name(1) "|"
          global_userid "|"
          string(time, "HH:MM:SS") "|"
          ipmsg
          skip.

   output stream xlog close.
end.
end.  /* proceddure logit */
