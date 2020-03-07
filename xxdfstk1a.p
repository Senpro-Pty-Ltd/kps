/* xxdfstk1a.p - Check default stock location                             */
/* CYB    LAST MODIFIED: 2018-AUG-10    BY: gbg *k10017* Task*T1086*      */
/*------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
{us/xx/xxfnkit.i new}
{us/xx/xx1021.i new}


define input  parameter ipsom    as recid.
define input  parameter ipsod    as recid.
define output parameter opavail  as logical.



define buffer bsod for sod_det.


function isbattery returns logical (ippart as char):
  find first pt_mstr no-lock
  where pt_domain = global_domain
  and   pt_part = ippart
  no-error.
  if not available pt_mstr then return no.

  return lookup(pt_prod_line, pl_batterys) <> 0.

end.  /* function isbattery */

run plbattlist.

 
opavail = yes.
for first bsod no-lock
where recid(bsod) = ipsod:
    if fiskit(bsod.sod_part)
    then do:
       for each sob_det no-lock
       where sob_domain = global_domain
       and   sob_nbr = bsod.sod_nbr
       and   sob_line = bsod.sod_line,
       first pt_mstr no-lock
       where pt_domain = global_domain
       and   pt_part = sob_part,
       first si_mstr no-lock
       where si_domain = global_domain
       and   si_site = bsod.sod_site
      :
          if isbattery(sob_part) 
	  then do:
	     opavail = no.
	     find first pti_det no-lock
	     where pti_det.oid_pt_mstr = pt_mstr.oid_pt_mstr
	     and   pti_det.oid_si_mstr = si_mstr.oid_si_mstr
	     no-error.
	     if not available pti_det then return.



	     if can-find(first ld_det
                          where ld_domain = global_domain
		          and   ld_part = sob_part
		          and   ld_site = bsod.sod_site
		          and   ld_loc  = pti_loc
		          and   ld_qty_oh > 0)
             then do:
                opavail = yes.
		return.
	     end.
	     else do:
		return.
	     end.
	  end.
       end.
       return.
    end.
    else do:
       opavail = can-find(first ld_det
                        where ld_domain = global_domain
			and   ld_part = bsod.sod_part
			and   ld_site = bsod.sod_site
			and   ld_loc  = bsod.sod_loc
			and   ld_qty_oh > 0).
       return.
    end.
end.
