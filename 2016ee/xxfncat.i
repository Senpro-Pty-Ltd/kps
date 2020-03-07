/* xxfncat.i - Misc fuctions                                             */
/* CYB       LAST MODIFIED: 02-AUG-2013   BY: gbg *c1427*                */
/* CYB       LAST MODIFIED: 11-DEC-2013   BY: gbg *c1448*                */
/*************************************************************************/


function fCatalogCheck returns logical (ipaddr as char, 
                                        ipcust as char, 
					ippart as char).

def var useaddr as char.
def var useclass as char.

find first cm_mstr no-lock
where cm_domain = global_domain
and   cm_addr = ipcust
no-error.
useclass = ?.
if available cm_mstr then useclass = cm_class.

find first cm_mstr no-lock
where cm_domain = global_domain
and   cm_addr = ipaddr
no-error.
if available cm_mstr
then do:
      find first cp_mstr no-lock
      where cp_domain = global_domain
      and   cp_cust = cm_addr
      no-error.
      if not available cp_mstr 
      then do:
         find first cp_mstr no-lock
         where cp_domain = global_domain
         and   cp_cust = useclass
         no-error.
/*c1448* start added code */
         if not available cp_mstr 
         then do:
            find first cp_mstr no-lock
            where cp_domain = global_domain
            and   cp_cust = ""
            no-error.
         end.
/*c1448* end   added code */
      end.

      if not available cp_mstr then return true.

      useaddr = cp_cust.
      return can-find(first cp_mstr
      where cp_domain = global_domain
      and   cp_cust = useaddr
      and   cp_part = ippart).
end.

return true.

end.  /* function fcatalogcheck */
