/* xx349401.p                                                                */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* Create SO Picking event for export to voice picking system (Navigator)    */
/* Populate sysproperty table and set event on this table                    */
/* Also create custom table xnav_det record for history browsing             */
/*---------------------------------------------------------------------------*/
/* CYB   LAST MODIFIED: 13-JUL-2016    BY: gbg *d3494* Navigator Integration */
/* CYB   LAST MODIFIED: 109-JAN-2017   BY: gbg *d3691* Navigator Integration */
/* CYB   LAST MODIFIED: 2017-Jun-05    BY: gbg *c1607*                       */
/* CYB   LAST MODIFIED: 2019-Mar-25    BY: gbg *p1034*                       */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
{us/xx/xx3494.i NEW}
def input parameter iprecno as recid.

def buffer abs1 for abs_mstr.
def buffer abs2 for abs_mstr.
def buffer d    for abs_mstr.
def buffer f    for abs_mstr.
def buffer pt1 for pt_mstr.
def buffer pt2 for pt_mstr.

def var previdentify as logical.
def var v_oid like oid_so_mstr.
def var vIDList as char.
def var LayerBase as int.
def var PallBase  as int.
def var RemBase   as int.

def var i as int.
def var nextsys as int.
def var qtypall as dec.
def var qtylayer as dec.
def var qtyship  as dec.
/*d3691*/ def var vlayers as int init 3.
def var vOrder   as char.
&SCOPED-DEFINE QXO-EVENT VoicePick
&SCOPED-DEFINE QXO-TABLE ck_mstr
def var sysRowID as rowid.
def var sysOID   as decimal init 1.0.
{us/qx/qxodef.i}

        empty temp-table ttloc.
        empty temp-table tph.

/*c1607* start deleted code >>>>>
* for first abs1 
* no-lock
* where recid(abs1) = iprecno
* ,
* each d no-lock
* where d.abs_domain = abs1.abs_domain
* and   d.abs_shipfrom = abs1.abs_shipfrom
* and   d.abs_par_id = abs1.abs_id
* ,
* first abs2 no-lock
* where (can-find(first f
*         where f.abs_domain = d.abs_domain
* 	and   f.abs_shipfrom = d.abs_shipfrom
* 	and   f.abs_par_id = d.abs_id)
* 	and  abs2.abs_shipfrom = d.abs_shipfrom
* 	and  abs2.abs_par_id = d.abs_id
* 	and  abs2.abs_item < "L")
* or    (not can-find(first f
*         where f.abs_domain = d.abs_domain
* 	and   f.abs_shipfrom = d.abs_shipfrom
* 	and   f.abs_par_id = d.abs_id)
* 	and  recid(abs2) = recid(d))
* ,
* first pt1 no-lock
* where pt1.pt_domain = global_domain
* and   pt1.pt_part = abs2.abs_item
* ,
* first pt2 no-lock
* where pt2.pt_domain = global_domain
* and   pt2.pt_part = d.abs_item
* break 
* by abs2.abs_order 
* by abs2.abs_line 
* by abs2.abs_item
* by abs2.abs_loc 
* by abs2.abs_lot:
*c1607* end deleted code <<<<<<< */

/*c1607* start added code >>>>> */
for first abs1 
no-lock
where recid(abs1) = iprecno
,
first code_mstr no-lock
where code_domain = global_domain
and   code_fldname = "voice_pick_pl_validation"
,
each d no-lock
where d.abs_domain = abs1.abs_domain
and   d.abs_shipfrom = abs1.abs_shipfrom
and   d.abs_par_id = abs1.abs_id
,
each abs2 no-lock
where (can-find(first f
        where f.abs_domain = d.abs_domain
	and   f.abs_shipfrom = d.abs_shipfrom
	and   f.abs_par_id = d.abs_id)
	and  abs2.abs_domain = global_domain
	and  abs2.abs_shipfrom = d.abs_shipfrom
	and  abs2.abs_par_id = d.abs_id
	and  abs2.abs_item < "L")
or    (not can-find(first f
        where f.abs_domain = d.abs_domain
	and   f.abs_shipfrom = d.abs_shipfrom
	and   f.abs_par_id = d.abs_id)
	and  recid(abs2) = recid(d))
,
first pt1 no-lock
where pt1.pt_domain = global_domain
and   pt1.pt_part = abs2.abs_item
and   (pt1.pt_prod_line >= code_value and pt1.pt_prod_line <= code_cmmt)
,
first pt2 no-lock
where pt2.pt_domain = global_domain
and   pt2.pt_part = d.abs_item
break 
by abs2.abs_order 
by abs2.abs_line 
by abs2.abs_item
by abs2.abs_loc 
by abs2.abs_lot:
/*c1607* end added code <<<<<<< */


    if first-of(abs2.abs_order) then do:
	LayerBase = 0.
	Pallbase = 0.
	Rembase = -1.
	vOrder = abs2.abs_order.
        usrwkey = 1000000 * random(1, 9) + 
	          10000 * integer(substring(string(time, "99999999"), 7)).
	do while can-find(first ck_mstr
	                  where ck_domain = global_domain
			  and   ck_ref    = string(usrwkey)):
	    usrwkey = usrwkey + 1.
	end.  /* do while can-find(first ck_mstr */
	create ck_mstr.
	assign
	ck_domain = global_domain
	ck_nbr = usrwkey
	ck_ref    = string(usrwkey)
	ck_user1 = "S"
	ck_user2 = abs2.abs_order
	.

    	    /* Create QXtend event here */
        assign sysRowID = rowid({&QXO-TABLE})
               sysOID = ck_mstr.oid_ck_mstr.

    end.  /* if first-of(abs2.abs_order) */
    if first-of(abs2.abs_loc) then do:
        empty temp-table ttloc.
        empty temp-table tph.
        empty temp-table tp.
    end.

    accumulate abs2.abs_qty (total by abs2.abs_item).
    accumulate abs2.abs_qty (total by abs2.abs_loc).

    if last-of(abs2.abs_loc)
    then do:
	create ttloc.
	assign
	tloc_line = integer(abs2.abs_line)
	tloc_part = abs2.abs_item
	tloc_loc = abs2.abs_loc
	tloc_qty_ship = accum total by abs2.abs_loc abs2.abs_qty.
    end.

    if last-of(abs2.abs_loc)
    then do:
	qtyship = accum total by abs2.abs_loc abs2.abs_qty.
        qtypall = decimal(pt1.pt_size) no-error.
        if error-status:error then qtypall = 3.
/*d3691* start added code >>>> */
        qtypall = decimal(pt1.pt_size) no-error.
        if error-status:error then qtypall = vlayers.
        if qtypall / vlayers = truncate(qtypall / vlayers, 0)
        then qtylayer = qtypall / vlayers.
        else assign
	   qtypall = 1
	   qtylayer = 1
           vlayers = 1.
/*d3691* end added code <<<< */
	if qtypall = 0 then qtypall = 1.
        plsplit = plsplit(integer(trunc(qtyship, 0)), 
                  integer(trunc(qtypall, 0))).
        pllabel = pllabel(plsplit,
                  integer(trunc(qtypall, 0))).


	i = 1.
        do while num-entries(plsplit) >= i:
           create tph.
           assign
           ht = substring(entry(i, pllabel), 1, 1)
           hs = integer(entry(i, plsplit))
	   i = i + 1
           .
	   case ht:
	     when "P" then do:
	       Pallbase = PallBase + 1.
	       hn = PallBase.
	     end.
	     when "L" then do:
	       Layerbase = LayerBase + 1.
	       hn = LayerBase.
	     end.
	     otherwise do:
	       Rembase = Rembase + 1.
	       hn = RemBase.
	     end.
	   end.  /* case */
        end.  /* do i = 1 to num-entries(plsplit) */
	run palletCreate.
        empty temp-table ttloc.
        empty temp-table tph.
        empty temp-table tp.
	if last-of(abs2.abs_order)
	then do:
	/* create qxtend event for order now */
    	    /* Create QXtend event here */
             /* RECORD QXTEND OUTBOUND EVENT. */
             run fireOutboundEvent (input '{&QXO-EVENT}',
                                    input '{&QXO-TABLE}',
                                    input sysRowID,
                                    input sysOID,
                                    input 'CREATE').

	end.
    end.  /* if last-of(abs2.abs_line) */
end.  /* for first abs1 */


procedure palletcreate.



find first tPh no-error.
find first ttloc no-error.

tlloop:
do while available ttloc
and available tPh:
  if tph.hq >= tph.hs then do:
     find next tph no-error.
     next tlloop.
  end.
  if tloc_qty_ship <= 0 then do:
      find next ttloc no-error.
      next tlloop.
  end.

  if tloc_qty_ship >= tph.hs - tph.hq
  then do:
     i = tph.hs - tph.hq.
     tph.hq = tph.hq + i.
     create tp.
     assign
     tp.pt = tph.ht
     tp.pn = tph.hn
     tp.ps = tph.hs
     tp.pi = tloc_line
     tp.pq = i
     tp.pl = tloc_loc.
     tloc_qty_ship = tloc_qty_ship - i.
     next tlloop.
  end.

  create tp.
  assign
  tph.hq = tph.hq + tloc_qty_ship
  tp.pt = tph.ht
  tp.pn = tph.hn
  tp.ps = tph.hs
  tp.pl = tloc_loc
  tp.pi = tloc_line
  tp.pq = tloc_qty_ship.
  tloc_qty_ship = 0.

end.



nextsys = integer(substring(string(time, "99999999"), 7)) * 100000.
nextsys = nextsys + random(1, 9999).
nextsys = nextsys + 1000000 * random(1, 9).

find first tp no-error.
for each tp,
first so_mstr no-lock
where so_domain = global_domain
and   so_nbr = vOrder
,
first sod_det no-lock
where sod_domain = global_domain
and   sod_nbr = so_nbr
and   sod_line = tp.pi
,
first pt_mstr no-lock
where pt_mstr.pt_domain = global_domain
and   pt_mstr.pt_part = sod_part
,
first si_mstr no-lock
where si_domain = global_domain
and   si_site = sod_site
:
          find first pti_det no-lock
          where pti_det.oid_pt_mstr = pt_mstr.oid_pt_mstr
          and   pti_det.oid_si_mstr = si_mstr.oid_si_mstr
          no-error.
          qtypall = decimal(pt_size) no-error.
          if error-status:error then qtypall = 3.
          qtylayer = qtypall / 3.
/*d3691* start added code >>>> */
         qtypall = decimal(pt_size) no-error.
         if error-status:error then qtypall = vlayers.
         if qtypall / vlayers = truncate(qtypall / vlayers, 0)
         then qtylayer = qtypall / vlayers.
         else assign
	   qtypall = 1
	   qtylayer = 1
           vlayers = 1.
/*d3691* end added code <<<< */
    

	    nextsys = nextsys + 1.
	    do while can-find(first xnav_det where xnav_domain = global_domain
	                      and xnav_id = nextsys)
	            or can-find(first sysproperty where sysproperty_id = nextsys):
                nextsys = nextsys + 1.
	    end.
            create xnav_det.
	    assign
            xnav_domain = global_domain
    	    xnav_id = nextsys 
            xnav_preshp = substring(abs1.abs_id, 2)
            xnav_order = so_nbr
            xnav_line = sod_line
            xnav_shipfromsite = abs2.abs_shipfrom
            xnav_shipvia = so_shipvia
            xnav_ship = so_ship
            xnav_part = pt2.pt_part
            xnav_group = pt2.pt_group
            xnav_desc1 = pt2.pt_desc1
            xnav_abc = pt2.pt_abc
            xnav_loc = tp.pl
            xnav_qtyord = sod_qty_ord
            xnav_qtypick = tp.pq
            xnav_qtycont = tp.ps
            xnav_contid  = tp.pt + trim(string(tp.pn, ">>>9"))
            xnav_qtypallet = qtypall
            xnav_qtylayer = qtylayer
            xnav_weight = pt2.pt_ship_wt
            xnav_wt_um = pt2.pt_ship_wt_um
            xnav_footprint = string(pt2.pt_drwg_size, ">>9")
            xnav_article = pt2.pt_article
            xnav_facelblid = pt2.pt__chr05
            xnav_toplblid = pt2.pt__chr06
            xnav_created = today
            xnav_modified = today + 1
            xnav_sentst = yes
            xnav_customshort0 = pt1.pt_part
            xnav_customshort1 = pt1.pt_desc1
            .
            xnav_abcpti = if available pti_det then pti_abc else "".
            for first debtor no-lock
            where debtorcode = so_cust
            ,
            first businessrelation of debtor,
            each address of businessrelation,
            first addresstype of address
            where addresstypecode = "headoffice"
            :
               assign
               xnav_custname = addressname
               xnav_add1 = addressstreet1
               xnav_add2 = addressstreet2
               xnav_add3 = addressstreet3
               xnav_city = addresscity
               xnav_zip = addresszip.
            end.
    
            for each sysproperty 
            where sysproperty.customdate2 < today - 20
            and   sysproperty.customcombo0 = "Navigator":
                delete sysproperty.
            end.
        
            create sysproperty.
            assign
            sysproperty_id = nextsys
            sysproperty.currency_id = usrwkey
    	    SysPropertyIsBusRelDomRes = no
    	    SysPropertyIsWithBudget = no
    	    SysPropertyIsBudOverCh = no
    	    SysPropertyIsBudOlCheckGL = no
    	    SysPropertyIsBudOLCheckCC = no
    	    SysPropertyIsSpecCIApprove = no
    	    sysproperty.CustomShort0 = xnav_preshp
    	    sysproperty.CustomShort1 = so_nbr
    	    sysproperty.CustomShort2 = string(sod_line, ">>9")
    	    sysproperty.CustomShort3 = abs2.abs_shipfrom
    	    sysproperty.CustomShort4 = so_shipvia
    	    sysproperty.CustomShort5 = so_ship
    	    sysproperty.CustomShort6 = pt2.pt_part
    	    sysproperty.CustomShort7 = tp.pl
    	    sysproperty.CustomShort8 = abs2.abs_lotser
    	    sysproperty.CustomShort9 = xnav_contid
    	    sysproperty.CustomCombo0 = "Navigator"
    	    sysproperty.CustomLong0  = pt1.pt_part
    	    sysproperty.CustomLong1  = pt1.pt_desc1
    	    sysproperty.CustomCombo1 = if available pti_det then pti_abc else ""
    	    sysproperty.CustomCombo2 = global_userid
    	    sysproperty.CustomCombo3 = global_domain
    	    sysproperty.CustomCombo4 = replace(xnav_custname, "~&", "~&amp~;")
    	    sysproperty.CustomCombo5 = replace(xnav_add1, "~&", "~&amp~;")
    	    sysproperty.CustomCombo6 = replace(xnav_add2, "~&", "~&amp~;")
    	    sysproperty.CustomCombo7 = replace(xnav_add3, "~&", "~&amp~;")
    	    sysproperty.CustomCombo8 = xnav_city
    	    sysproperty.CustomCombo9 = xnav_zip
    	    sysproperty.CustomInteger0 = xnav_qtycont
    	    sysproperty.CustomDecimal0 = sod_qty_ord
    	    sysproperty.CustomDecimal1 = tp.pq
    	    sysproperty.CustomDecimal2 = qtyship
    	    sysproperty.CustomDecimal3 = qtypall 
    	    sysproperty.CustomDecimal4 = qtylayer
    	    sysproperty.CustomDate0 =    abs2.abs_crt_date
    	    sysproperty.CustomDate1 =    sod_mod_date
    	    sysproperty.CustomDate2 =    today
    	    sysproperty.CustomDate2 =    today
    	    sysproperty.lastmodifiedtime =    time
    	    .
    
    
    
end.  /* for each tp */

end.  /* procedure palletcreate */


/*debug* >> */
def stream logit.
procedure logit.
define input parameter ipmsg as char.
def var logname as char.
logname = entry(num-entries(program-name(2), "~/"), program-name(2), "~/").
logname = entry(1, logname, "~.").
output stream logit to value("/tmp/" + trim(logname) + ".log") append.
  put stream logit unformatted
  string(today) ":"
  string(time, "HH:MM:SS") ":"
  global_userid ":"
  program-name(2) ":"
  ipmsg
  skip.
  output stream logit close.
end.
/*debug* << */
