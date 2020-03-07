/* xxshipfns.i - Functions for shipping                                     */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                    */
/* All rights reserved worldwide.  This is an unpublished work.             */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB    LAST MODIFIED: 04 Oct 2010    BY:  nac *q9021*C1197e*              */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/****************************************************************************/

def var qtytoship         as dec.

/*------------------------------*/
function fnegqtyallowed returns logical
(ipsite as char, iploc as char).
  find first si_mstr no-lock
  where si_domain = global_domain
  and   si_site = ipsite
  no-error.
  if not available si_mstr then return no.

  find first loc_mstr no-lock
  where loc_domain = global_domain
  and   loc_site = ipsite
  and   loc_loc = iploc
  no-error.
  if available loc_mstr
  then do:
      find first is_mstr no-lock
      where is_domain = global_domain
      and   is_status = loc_status
      no-error.
      if available loc_mstr 
      then do:
         return is_overissue.
      end.
  end.
  return si_auto_loc.
end.  /* function fnegqtyallowed */

/*------------------------------*/
function isserialpart returns logical
(ippart as char).

 return can-find(first pt_mstr 
		 where pt_part = ippart
		 and   pt_domain = global_domain
		 and   pt_lot_ser = "S").

end.



/*------------------------------*/
function fqtyavail returns decimal
(ippart as char, ipser as char, ipsite as char, iploc as char).
def var vnotserial as logical.

    vnotserial = not isserialpart(ippart).

    find first ld_det no-lock
    where ld_domain = global_domain
    and   ld_site = ipsite
    and   ld_loc  = iploc
    and   ld_part = ippart
    and   (vnotserial or ld_lot = ipser)
    no-error.

    if available ld_det then return (ld_qty_oh - ld_qty_all).

    return 0.0.
end.  /* function fqtyavail */


/*------------------------------*/
function fbackflushscreen returns logical
(ipnbr as char, ipshipsite as char).


if can-find(first cil_mstr where cil_domain = global_domain
                and cil_cor_so_nbr = ipnbr) then return no.
find first mfc_Ctrl no-lock
where mfc_domain = global_domain
and   mfc_field = "fac_bflush_comp"
no-error.
if not available mfc_ctrl then return false.
if not mfc_logical then return false.


if (can-find (first sob_det
              where sob_domain = global_domain
              and  (sob_nbr  = ipnbr))
              or  ipshipsite = "")
then do:

   for each sod_det where sod_domain = global_domain
      and sod_nbr = ipnbr
      and sod_compl_stat = ""
   no-lock:

      if sod_fa_nbr = ""
         and  sod_cfg_type <> "1"           /* Not "1" Assemble-to-Order */
         and (can-find (first sob_det
                        where sob_domain = global_domain
                        and  (sob_nbr = ipnbr
                        and   sob_line = sod_line))
                        or    ipshipsite = "")
      then do:
         /* There is at least one line we can do an automatic     */
         /* Backflush for.  That's all we wanted to know.         */
         return true.
      end.

   end.    /* for each sod_det */
return false.
end.   /* if can-find (first sob_det...) */

end.  /* function fbackflushscreen */


/*------------------------------*/
function fshipqty returns decimal
(ipnbr as char,
 ipline as int).

def var vqtyavailable   as dec.

    find first so_mstr no-lock
    where so_domain = global_domain
    and   so_nbr = ipnbr
    no-error.

    find first sod_det no-lock
    where sod_domain = global_domain
    and   sod_nbr = ipnbr
    and   sod_line = ipline
    no-error.
    if not available sod_det then return 0.0.
    if sod_type = "m" then return sod_qty_ord - sod_qty_ship.
    if sod_qty_ord < 0.0 then return sod_qty_ord - sod_qty_ship.

    find first loc_mstr no-lock
    where loc_domain = global_domain
    and   loc_site = sod_site
    and   loc_loc = so__chr01
    no-error.
    if not available loc_mstr
    then do:
        find first loc_mstr no-lock
        where loc_domain = global_domain
        and   loc_site = sod_site
        and   loc_loc = sod_loc
        no-error.
    end.
    if not available loc_mstr then return 0.0.
    vqtyavailable = fqtyavail(sod_part, "", sod_site, loc_loc) / sod_um_conv.

    if available loc_mstr 
    and fnegqtyallowed(loc_site, loc_loc)
    then return sod_qty_ord - sod_qty_ship.

    return minimum(vqtyavailable + sod_qty_all + sod_qty_pick, 
                        sod_qty_ord - sod_qty_ship).

end.  /* function fshipqty */





/*------------------------------*/
function cimit returns char
(ipchar as char).
 
if ipchar = " "
or ipchar = ?
then return "-".
return ipchar.

end.


/*------------------------------*/
function stringdt returns char
(ipdate as date).
return     string(day(ipdate), "99") +
           string(month(ipdate), "99") +
           substring(string(year(ipdate), "9999"), 3, 2).
end.

/*------------------------------*/
function fiskit returns logical (ippart as char).
find first pt_mstr no-lock
where pt_domain = global_domain
and   pt_part = ippart
no-error.
if not available pt_mstr then return no.
if pt_cfg = "2" then return yes.
return no.
end.
