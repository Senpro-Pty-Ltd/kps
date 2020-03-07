/* xxlocpk.p - Pick by location                                              */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 2015-SEP-11      BY: gbg *D3243*                     */
/* CYB    LAST MODIFIED: 2017-JUL-19      BY: gbg *C1614*                     */
/* CYB    LAST MODIFIED: 03DEC18          BY: nac *K10017a*                   */
/*---------------------------------------------------------------------------*/


def input parameter iprecid as recid.
def input parameter ipautoid as integer no-undo.
def input parameter ipsodlink as integer no-undo.

def var locid as int no-undo.

{us/bbi/mfdeclre.i}
{us/xx/xx1021.i NEW}
{us/xx/xxplqrf.i}

/*--------------------------------------------------------------------------*/
function isbattery returns logical (ippart as char):
  find first pt_mstr no-lock
  where pt_domain = global_domain
  and   pt_part = ippart
  no-error.
  if not available pt_mstr then return no.

  return lookup(pt_prod_line, pl_batterys) <> 0.

end.  /* function isbattery */
/*--------------------------------------------------------------------------*/

def var plform_due as char format "x(8)".
def var qtypick as dec.
def var qtybatt as dec.

def var batpart as char.
def var batloc  as char.
def var kitpart as char.


def temp-table ttl
field tloc as char
field tbatt as char
field tkit  as char
field tpart as char
field tline as int
field tqtycomp as dec
field sodrecno as recid
field sobrecno as recid
field ladrecno as recid.


run plbattlist.

find first so_mstr no-lock
where recid(so_mstr) = iprecid
no-error.
if not available so_mstr then return.

for each sod_det no-lock /*no-lock added*/
where sod_domain = global_domain
and   sod_nbr = so_nbr
and   sod_compl_stat = "" /*added by Iris*/
:
    batloc = "UNAVAIL".
    if can-find(first sob_det
                where sob_domain = sod_domain
                and   sob_nbr = sod_nbr
                and sob_line = sod_line)
    then do:
      batpart = "".

      /* first find the battery component */
      for each sob_det no-lock
      where sob_domain = sod_domain
      and   sob_nbr = sod_nbr
      and   sob_line = sod_line:
	  if isbattery(sob_part) 
	  then do:
	     batpart = sob_part.
             find first ld_det no-lock
             where ld_domain = global_domain
             and   ld_site = sod_site
             and   ld_part = batpart
             and   ld_qty_oh > 0
             and   ld_qty_oh > ld_qty_all
	     and can-find(first is_mstr
	                  where is_domain = global_domain
			  and   is_status = ld_status
			  and   is_avail)
             no-error.
	     if available ld_det then batloc = ld_loc.
	     leave.
	  end.
      end.


      create ttl.    
      assign sodrecno = recid(sod_det)
             sobrecno = recid(sob_det)
             ladrecno = ?
             tloc = batloc
             tbatt = if batpart <> "" then batpart else sod_part
	     tkit = "A"
             tpart = sob_part
             tline = sod_line.
      
      qtybatt = 0.0.
      for each sob_det no-lock    /*no-lock added*/
      where sob_domain = sod_domain
      and   sob_nbr = sod_nbr
      and   sob_line = sod_line:
        create ttl.    
        assign sodrecno = recid(sod_det)
               sobrecno = recid(sob_det)
               ladrecno = ?
               tloc = batloc
               tbatt = if batpart <> "" then batpart else sod_part
	       tkit = if batpart = sob_part then "B" else "C"
               tpart = sob_part
               tline = sod_line.
	       tqtycomp = 0.
               for each ld_det no-lock
               where ld_domain = global_domain
               and   ld_site = sod_site
               and   ld_part = batpart
               and   ld_qty_oh > 0
               and   ld_qty_oh > ld_qty_all
	       and can-find(first is_mstr
	                  where is_domain = global_domain
			  and   is_status = ld_status
			  and   is_avail):
                  tqtycomp = tqtycomp + ld_qty_oh - ld_qty_all.
               end.
	       tqtycomp = min(tqtycomp, sob_qty_req).
	       if tkit = "B" then qtybatt = tqtycomp.
	       else tqtycomp = sob_qty_req.
      end.
    end.
    else do:
        if can-find(first lad_det
                    where lad_domain = sod_domain
                    and   lad_nbr = sod_nbr
                    and   lad_line = string(sod_line)
                    and   lad_qty_pick <> 0)
        then do:
           for each lad_det no-lock    /*no-lock added*/
           where lad_domain = sod_domain
           and   lad_nbr = sod_nbr
           and   lad_line = string(sod_line)
           and   lad_qty_pick <> 0.0:
               create ttl.
               assign
               tloc = lad_loc
               tbatt = sod_part
               tpart = sod_part
               tline = sod_line
	       tkit = ""
               sodrecno = recid(sod_Det)
               sobrecno = ?
               ladrecno = recid(lad_Det).
           end.
        end.
        else do:
               
           create ttl.
           assign sodrecno = recid(sod_det)
                  ladrecno = ?
                  sobrecno = ?
                  tloc = "UNAVAIL"
		  tkit = ""
                  tbatt = sod_part
                  tpart = sod_part
                  tline = sod_line.
        end.
    end.
end.


for each ttl break by tloc by tbatt by tline by tkit by tpart:
    find first sod_Det where recid(sod_det) = sodrecno no-error.
    find first sob_det where recid(sob_det) = sobrecno no-error.
    find first lad_Det where recid(lad_det) = ladrecno no-error.

    find first pt_mstr no-lock
    where pt_domain = global_domain
    and   pt_part = tpart
    no-error.

    if first-of(tloc)
    then do:
/*K10017a>>
 *     put stream cyb
 *     "C" at 1 format "x(1)"
 *     tloc
 *     skip
 *     .
 *K10017a<<*/
       locid = locid + 1.
       create tt_loc.
       assign tl_soid = ipautoid
              tl_id = locid
	      tl_loc = tloc
	      .
    end.

    if not available sod_det then next.
    if sod_due_date <> ? then 
       plform_due = string(year(sod_due_date),"9999") +
                    string(month(sod_due_date),"99") +
                    string(day(sod_due_date),"99").
    else plform_due = "".

    qtypick = (sod_qty_ord - sod_qty_pick - sod_qty_ship) * sod_um_conv.


    if tkit = "A"
    then do:
	if tloc = "UNAVAIL" then qtypick = 0.0.
        find first pt_mstr no-lock
        where pt_domain = global_domain
        and   pt_part = sod_part
        no-error.
/*K10017a>>
 *      if available pt_mstr
 *      and pt_desc2 <> ""
 *      then put stream cyb "B" at 1 format "x(1)".
 *      else put stream cyb "E" at 1 format "x(1)".
 * 
 *      put stream cyb
 * 	sod_line at 2 format ">>9"
 * 	sod_part at 5 format "x(18)"
 * 	qtypick  at 32 format "->>>>>>>>9.999999999"
 *      sod_um   at 52  format "x(2)"       /*UM*/
 *      sod_custpart at 62  format "x(30)"      /*Cust Item No*/
 * 	pt_desc1 at 92 format "x(24)"
 * 	pt_desc2 at 116 format "x(24)"
 * 	sod_qty_ord  at 140 format "->>>>>>>>9.999999999"
 * 	skip.
 *      find first pt_mstr no-lock
 *      where pt_domain = global_domain
 *      and   pt_part = tpart
 *      no-error.
 *K10017a<<*/
/*K10017a>>*/
        create tt_det.
	assign ipsodlink = ipsodlink + 1
	       td_tlid = locid
	       td_sodid = ipautoid
	       td_sod_link = ipsodlink
	       td_line = sod_line
	       td_part = sod_part
	       td_type = sod_type
	       td_site = sod_site
               td_qtypick = qtypick
	       td_um = sod_um
	       td_date = plform_due
	       td_custpart = sod_custpart
	       td_qtyord = sod_qty_ord
	       .
        find first pt_mstr
             where pt_domain = global_domain
               and pt_part = sod_part
             no-lock no-error.
        if available pt_mstr then
	   assign td_desc1 = pt_desc1
	          td_desc2 = pt_desc2
		  td_pt_pm_code = pt_pm_code
                  . 
/*K10017a<<*/
    end.  /* if tkit = "A" */
    else do:

        if sod_type = "" then qtypick = sod_qty_all.
    
    
        if available lad_det
        then do:
    
           qtypick = lad_qty_pick.
    
/*K10017a>>
 *         if available pt_mstr
 *         and pt_desc2 <> ""
 *         then put stream cyb "B" at 1 format "x(1)".
 *         else put stream cyb "E" at 1 format "x(1)".
 *  
 *         put stream cyb
 *         sod_line at 2   format ">>9"        /*Line Number*/
 *         sod_part at 5   format "x(18)"      /*Item Number*/
 *         sod_type at 23  format "x(1)"       /*Type*/
 *         sod_site at 24  format "x(8)"       /*Site*/
 *         qtypick  at 32  format "->>>>>>>>9.999999999" 
 *         sod_um   at 52  format "x(2)"       /*UM*/
 *         plform_due   at 54 format "x(8)"       /*Due Date*/
 *         sod_custpart at 62  format "x(30)"      /*Cust Item No*/
 *         pt_desc1    at 92  format "x(24)"      /*Item Desc1*/
 *         pt_desc2    at 116 format "x(24)"      /*Item Desc2*/
 *         sod_qty_ord  at 140  format "->>>>>>>>9.999999999" 
 *         .
 *K10017a<<*/

/*K10017a>>*/
        create tt_det.
	assign ipsodlink = ipsodlink + 1
	       td_tlid = locid
	       td_sodid = ipautoid
	       td_sod_link = ipsodlink
	       td_line = sod_line
	       td_part = sod_part
	       td_type = sod_type
	       td_site = sod_site
               td_qtypick = qtypick
	       td_um = sod_um
	       td_date = plform_due
	       td_custpart = sod_custpart
	       td_qtyord = sod_qty_ord
	       .
        if available pt_mst then
	   assign td_desc1 = pt_desc1
	          td_desc2 = pt_desc2
		  td_pt_pm_code = pt_pm_code
                  . 
/*K10017a<<*/
    
    
    
        end.  /* if available lad_det */
        else do:
           if available sob_det
           then do:
    	   if  tkit <> tpart
    	   and not can-find(first code_mstr
    	                   where code_domain = global_domain
    			   and   code_fldname = "pikkit"
    			   and   code_value = "no")
               then do:
                  qtypick = sob_qty_req .
                  if tkit = "B" then assign qtybatt = tqtycomp 
		                            qtypick = tqtycomp.
                  else               qtypick = if sod_qty_ord = 0
		                               then 0
					       else 
					       tqtycomp 
		                                  * qtybatt 
					          / sod_qty_ord.
    
/*K10017a>>
 *                put stream cyb
 *                "G" at 1 format "x(1)"
 *                sod_line at 2   format ">>9"        /*Line Number*/
 *                sob_part at 5   format "x(18)"      /*Item Number*/
 *                sod_type at 23  format "x(1)"       /*Type*/
 *                sod_site at 24  format "x(8)"       /*Site*/
 *                qtypick  at 32  format "->>>>>>>>9.999999999" 
 *                sod_um   at 52  format "x(2)"       /*UM*/
 *                plform_due   at 54 format "x(8)"       /*Due Date*/
 *                sod_custpart at 62  format "x(30)"      /*Cust Item No*/
 *                pt_desc1    at 92  format "x(24)"      /*Item Desc1*/
 *                pt_desc2    at 116 format "x(24)"      /*Item Desc2*/
 *                .
 *K10017a<<*/

/*K10017a>>*/
                  create tt_grec.
            	  assign tg_kitid = ipsodlink
	                 tg_line = sod_line
	                 tg_part = sob_part
	                 tg_type = sod_type
	                 tg_site = sod_site
                         tg_qtypick = qtypick
	                 tg_um = sod_um
	                 tg_date = plform_due
	                 tg_custpart = sod_custpart
	                 tg_qtyord = sod_qty_ord
	                 .
                  if available pt_mst then
	             assign tg_desc1 = pt_desc1
	                    tg_desc2 = pt_desc2
                            . 
/*K10017a<<*/
               end.
           end.  /* if available sob_det */
           else do:
              if sod_type <> ""
    	      or  not can-find(first code_mstr
    	                   where code_domain = global_domain
    			   and   code_fldname = "pikmemo"
    			   and   code_value = "no")
              then do:
/*K10017a>>
 *                if available pt_mstr
 *                and pt_desc2 <> ""
 *                then put stream cyb "B" at 1 format "x(1)".
 *                else put stream cyb "E" at 1 format "x(1)".
 *  
 *                put stream cyb
 *                sod_line at 2   format ">>9"        /*Line Number*/
 *                sod_part at 5   format "x(18)"      /*Item Number*/
 *                sod_type at 23  format "x(1)"       /*Type*/
 *                sod_site at 24  format "x(8)"       /*Site*/
 *                qtypick  at 32  format "->>>>>>>>9.999999999" 
 *                sod_um   at 52  format "x(2)"       /*UM*/
 *                plform_due   at 54 format "x(8)"       /*Due Date*/
 *                sod_custpart at 62  format "x(30)"      /*Cust Item No*/
 *                pt_desc1    at 92  format "x(24)"      /*Item Desc1*/
 *                pt_desc2    at 116 format "x(24)"      /*Item Desc2*/
 *                sod_qty_ord  at 140  format "->>>>>>>>9.999999999" 
 *                .
 *K10017a<<*/

/*K10017a>>*/
                  create tt_det.
          	  assign ipsodlink = ipsodlink + 1
	                 td_tlid = locid
	                 td_sodid = ipautoid
	                 td_sod_link = ipsodlink
	                 td_line = sod_line
	                 td_part = sod_part
	                 td_type = sod_type
	                 td_site = sod_site
                         td_qtypick = qtypick
	                 td_um = sod_um
	                 td_date = plform_due
	                 td_custpart = sod_custpart
	                 td_qtyord = sod_qty_ord
	                 .
                  if available pt_mst then
	             assign td_desc1 = pt_desc1
	                    td_desc2 = pt_desc2
		            td_pt_pm_code = pt_pm_code
                            . 
/*K10017a<<*/
               end.
           end.  /* if available sob_det .. else */
        end.   /* if available lad_det .. else .. */
    end.  /*  if tkit = "A" .. ele do: .. */




end.

