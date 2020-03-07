/* xx349403.p                                                                */
/* xx349402.p                                                                */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* Create DO Picking event for export to voice picking system (Navigator)    */
/* Populate sysproperty table and set event on this table                    */
/* Also create custom table xnav_det record for history browsing             */
/*---------------------------------------------------------------------------*/
/* CYB   LAST MODIFIED: 13-JUL-2016    BY: gbg *d3494* Navigator Integration */
/* CYB   LAST MODIFIED: 109-JAN-2017   BY: gbg *d3691* Navigator Integration */
/* CYB   LAST MODIFIED: 2-AUG-2018     BY: gbg *s1087*                       */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}


{us/xx/xx3494.i NEW}
def input parameter iprecno as recid.

def buffer s1 for si_mstr.
def buffer s2  for si_mstr.


def var LayerBase as int.
def var PallBase  as int.
def var RemBase   as int.

def var nextsys as int.
def var qtypall as dec.
def var qtyship as dec.
def var qtylayer as dec.
def var splitpallets  as log.
/*d3691*/ def var vlayers as int init 3.
def var i as int.
&SCOPED-DEFINE QXO-EVENT VoicePick
&SCOPED-DEFINE QXO-TABLE ck_mstr
def var sysRowID as rowid.
def var sysOID   as decimal.
{us/qx/qxodef.i}


empty temp-table ttloc.
empty temp-table tph.


for first dss_mstr
no-lock
where recid(dss_mstr) = iprecno
,
each ds_det no-lock
where  ds_domain = global_domain
and    ds_nbr = dss_nbr
and    ds_shipsite = dss_shipsite
and    ds_site = dss_rec_site
and    ds_status <> "c"
and    (ds_qty_conf >= 0 and ds_qty_ship < ds_qty_conf)
,
each lad_det no-lock
where lad_domain = ds_domain
and   lad_dataset = "ds_det"
and   lad_nbr = ds_req_nbr
and   lad_line = ds_site
and   lad_part = ds_part
and   lad_site = ds_shipsite
,
first pt_mstr no-lock
where pt_domain = global_domain
and  pt_part = lad_part
break by dss_nbr by lad_nbr by lad_line by lad_loc by lad_lot
:

    if first-of(dss_nbr) then do:
	LayerBase = 0.
	Pallbase = 0.
	Rembase = -1.
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
	ck_user1 = "D"
	ck_user2 = dss_nbr.
	.

    	    /* Create QXtend event here */
        assign sysRowID = rowid({&QXO-TABLE})
               sysOID = ck_mstr.oid_ck_mstr.

    end.  /* if first-of(abs2.abs_order) */
    if first-of(lad_loc) then do:
        empty temp-table ttloc.
        empty temp-table tph.
        empty temp-table tp.
    end.

    accumulate lad_qty_pick (total by lad_line).
    accumulate lad_qty_pick (total by lad_loc).
    if last-of(lad_loc)
    then do:
	create ttloc.
	assign
	tloc_line = ds_line
	tloc_chline = lad_line
	tloc_part = lad_part
	tloc_loc = lad_loc
	tloc_qty_ship = accum total by lad_loc  lad_qty_pick.
    end.


    if last-of(lad_loc)
    then do:
	splitpallets = yes.
	qtyship = accum total by lad_loc lad_qty_pick.
        qtypall = decimal(pt_size) no-error.
        if error-status:error then qtypall = 3. 
/*d3691* start added code >>>> */
      qtypall = decimal(pt_size) no-error.
      if error-status:error then qtypall = vlayers.
      if qtypall / vlayers = truncate(qtypall / vlayers, 0)
      then do:
            qtylayer = qtypall / vlayers.
            plsplit = plsplit(integer(trunc(qtyship, 0)), 
                  integer(trunc(qtypall, 0))).
            pllabel = pllabel(plsplit,
                  integer(trunc(qtypall, 0))).
      end.
      else do:
	    splitpallets = no.
	    plsplit = "".
	    pllabel = "".
            plsplit = fappend(plsplit, string(qtyship), ",").
	    pllabel = pllabel(plsplit, integer(trunc(qtyship, 0))).
      end.
/*d3691* end added code <<<< */

/*d3691* start deleted code >>>>
	if qtypall = 0 then qtypall = 1.
	if qtypall = 1
	then do:
            plsplit = fappend(plsplit, string(qtyship), ",").
	    pllabel = pllabel(plsplit, qtyship).
	end.
	else do:
            plsplit = plsplit(integer(trunc(qtyship, 0)), 
                  integer(trunc(qtypall, 0))).
            pllabel = pllabel(plsplit,
                  integer(trunc(qtypall, 0))).
	end.
*d3691* end deleted code <<< */

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

	if last-of(dss_nbr)
	and last-of(lad_nbr)
	and last(lad_line)
	and last-of(lad_line)
	then do:

    	    /* Create QXtend event here */
            /* RECORD QXTEND OUTBOUND EVENT. */
            run fireOutboundEvent (input '{&QXO-EVENT}',
                                 input '{&QXO-TABLE}',
                                 input sysRowID,
                                 input sysOID,
                                 input 'CREATE').
	end.   /* if last-of(lad_nbr) */


    end.  /* if last-of(lad_line) */
end.   /*   for first ds_det */


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

  if splitpallets 
  and tloc_qty_ship >= tph.hs - tph.hq
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
first dss_mstr no-lock
where recid(dss_mstr) = iprecno,
first ds_det no-lock
where dss_domain = ds_domain
and   dss_shipsite = ds_shipsite
and   dss_nbr = ds_nbr
and   ds_line = tp.pi
,
first pt_mstr no-lock
where pt_domain = ds_domain
and   pt_part = ds_part
,
first s1 no-lock
where s1.si_domain = ds_domain
and  s1.si_site = ds_site
    :
      find first pti_det no-lock
      where pti_det.oid_pt_mstr = pt_mstr.oid_pt_mstr
      and   pti_det.oid_si_mstr = s1.oid_si_mstr
      no-error.
      qtypall = decimal(pt_size) no-error.
      if error-status:error then qtypall = 3.
      qtylayer = qtypall / 3.
/*d3691* start added code >>>> */
      vlayers = 3.
      qtypall = decimal(pt_size) no-error.
      if error-status:error then qtypall = vlayers.
      if qtypall / vlayers = truncate(qtypall / vlayers, 0)
      then qtylayer = qtypall / vlayers.
      else assign
	   qtypall = 1
	   qtylayer = 1.
/*d3691* end added code <<<< */

      /*
      plsplit = plsplit(tp.pq,
                      integer(trunc(qtypall, 0))).
      pllabel = pllabel(plsplit,
                      integer(trunc(qtypall, 0))).
      do contcount = 1 to num-entries(plsplit) by 1:
      */
         /* nextsys = random(0, 1000000). */
    	 do while can-find(first xnav_det 
	                   where xnav_domain = global_domain
			   and   xnav_id = nextsys):
                nextsys = nextsys + 1.
    	 end.
         create xnav_det.
         assign
         xnav_domain = global_domain
	 xnav_id = nextsys
	 nextsys = nextsys + 1
         xnav_preshp = ""
         xnav_order = ds_nbr
         xnav_line = ds_line
         xnav_customshort0 = ds_req_nbr
         xnav_shipfromsite = ds_shipsite
         xnav_shipvia = dss_shipvia
         xnav_ship = dss_rec_site
         xnav_part = ds_part
         xnav_group = pt_group
         xnav_desc1 = pt_desc1
         xnav_abc = pt_abc
         xnav_loc = tp.pl
         xnav_lot = ?.
	 assign
         xnav_qtyord = ds_qty_ship
         xnav_qtypick = tp.pq
         xnav_qtycont = tp.pq
         xnav_contid  = tp.pt + trim(string(tp.pn, ">>>9"))
         xnav_qtypallet = qtypall
         xnav_qtylayer = qtylayer
         xnav_weight = pt_ship_wt
         xnav_wt_um = pt_ship_wt_um.
	 assign
         xnav_footprint = string(pt_drwg_size)
         xnav_article = pt_article
         xnav_facelblid = pt__chr05
         xnav_toplblid = pt__chr06
         xnav_created = dss_created
         xnav_modified = dss_created
         xnav_sentst = yes
         .
/*d3691* start added code >>> */
         assign
         xnav_customshort1 = ds_loc
         xnav_customshort1 = pt_loc
         xnav_customshort1 = if available pti_det then pti_loc 
	                                          else xnav_customshort1
/*d3691* end added code <<<<< */
         xnav_abcpti = if available pti_det then pti_abc else "".
         for first s2 no-lock
         where s2.si_domain = dss_domain
         and   s2.si_site = dss_rec_site,
/*d3691* start deleted code >>>
         ,
         first company no-lock
         where companycode = s2.si_entity
         ,
         first companyproperty of company
         ,
         first businessrelation of companyproperty,
         each address of businessrelation,
         first addresstype of address
         where addresstypecode = "headoffice"
*d3691* end deleted code <<<< */
/*d3691* start added code >>>> */
         first businessrelation no-lock
	 where businessrelationcode = s1.si_site,
         first address of businessrelation
/*d3691* end added code <<<< */
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
         nextsys = random(0, 1000000).
    	 do while can-find(first sysproperty where sysproperty_id = nextsys):
                nextsys = nextsys + 1.
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
    	 sysproperty.CustomShort0 = ""
    	 sysproperty.CustomShort1 = ds_nbr
    	 sysproperty.CustomShort2 = ds_req_nbr
    	 sysproperty.CustomShort3 = ds_shipsite
    	 sysproperty.CustomShort4 = dss_shipvia
    	 sysproperty.CustomShort5 = dss_rec_site
    	 sysproperty.CustomShort6 = ds_part
    	 sysproperty.CustomShort7 = tp.pl
    	 sysproperty.CustomShort8 = ""
/*d3691*/ sysproperty.CustomShort8 = xnav_customshort1
    	 sysproperty.CustomShort9 = xnav_contid
    	 sysproperty.CustomCombo0 = "Navigator"
    	 sysproperty.CustomCombo1 = xnav_abcpti
    	 sysproperty.CustomCombo2 = global_userid
    	 sysproperty.CustomCombo3 = global_domain
    	 sysproperty.CustomCombo4 = replace(xnav_custname, "~&", "~&amp~;")
    	 sysproperty.CustomCombo5 = replace(xnav_add1, "~&", "~&amp~;")
    	 sysproperty.CustomCombo6 = replace(xnav_add2, "~&", "~&amp~;")
    	 sysproperty.CustomCombo7 = replace(xnav_add3, "~&", "~&amp~;")
    	 sysproperty.CustomCombo8 = xnav_city
    	 sysproperty.CustomCombo9 = xnav_zip
    	 sysproperty.CustomInteger0 = xnav_qtycont
    	 sysproperty.CustomDecimal0 = ds_qty_conf
    	 sysproperty.CustomDecimal1 = tp.pq
    	 sysproperty.CustomDecimal2 = tp.pq
    	 sysproperty.CustomDecimal3 = qtypall
    	 sysproperty.CustomDecimal4 = qtylayer
    	 sysproperty.CustomDate0 =    dss_created
    	 sysproperty.CustomDate1 =    dss_created
    	 sysproperty.CustomDate2 =    today
    	 .


      /* end. /* do contcount */ */
end.  /* for each tp */
end. /* procedure palletcreate */





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
