/* xxfn1589.i - Price validation function */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                 */
/* All rights reserved worldwide.  This is an unpublished work.          */
/*-----------------------------------------------------------------------*/
/* CYB        CREATED: 2016-NOV-24            BY: gbg *C1589*            */
/*-----------------------------------------------------------------------*/

function canprice returns logical
    (pFieldName as character,
     pFieldValue as character,
     pTableName as character ,
     pRecid as recid ).


    def var pSuccess as logical.

    /* Set default value for result */
    pSuccess = true.
    
    find first sod_det no-lock
    where recid(sod_det) = pRecid
    no-error.
    if not available sod_det then return psuccess.
    find first so_mstr no-lock
    where so_domain = global_domain
    and   so_nbr = sod_nbr
    no-error.
    if not available so_mstr then return psuccess.
    
    find first sod_det no-lock
    where recid(sod_det) = pRecid
    and   (pFieldValue = "yes"
           or can-find(first code_mstr
                       where code_domain = global_domain
                       and code_fldname = "ulab"
                       and code_value = so_cust))
    no-error.
    if available sod_Det
    then do:
        find first pt_mstr no-lock
        where pt_domain = global_domain
        and   pt_part = sod_part
        no-error.
        if not available pt_mstr
        or not can-find(first code_mstr
                        where code_domain = global_domain
    		    and   code_fldname = "pending_inv_item_validation"
    		    and   code_value = pt_part_type)
        then pSuccess = false.
    end.
    return pSuccess.
end.  /* function canprice */


function ispriceapprover returns logical (usrcode as char).
   for first usr no-lock
   where usr.usrlogin = usrcode
   ,
   each usrrole of usr no-lock
   ,
   each role of usrrole
   ,
   first code_mstr no-lock
   where code_domain = "auauto"
   and   code_fldname = "pending_inv_role_validation"
   and   code_value = rolename:
        return yes.
   end.
   return no.

end. /* function ispriceapprover */

