/* xx3494.i - Variables and procedures for Navigator integration             */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 2016-Jul-11     BY: gbg *d3494*          */
/*---------------------------------------------------------------------------*/


def var plsplit as char.
def var pllabel as char.
def var contcount as int.
def var usrwkey   as int.

define temp-table ttnav
field xnav_PreShip      as char
field xnav_Order        as char
field xnav_ShipFromSite as char
field xnav_ShipVia      as char
field xnav_Ship         as char
field xnav_CustName     as char
field xnav_Add1         as char
field xnav_Add2         as char
field xnav_Add3         as char
field xnav_City         as char
field xnav_Zip          as char
field xnav_Line         as int
field xnav_Part         as char
field xnav_Group        as char
field xnav_Desc1        as char
field xnav_Draw         as char
field xnav_Loc          as char
field xnav_Lot          as char
field xnav_QtyOrd       as dec
field xnav_QtyPallet    as dec     /* pt_size - Itm inv */
field xnav_QtyLayer     as dec     /* pt_size / 3 */
field xnav_QtyPick      as dec     /* lad_qty_pick */
field xnav_QtyCont      as dec     /* Pick Qtysplit by Container */
field xnav_ContID       as char    /* P1, P2, L1, L2, etc */
field xnav_abc          as char    /* pt_abc */
field xnav_abcpti       as char    /* pti_abc */
field xnav_Weight       as dec     /* pt_ship_wt */
field xnav_Wt_UM        as char    /* pt_ship_qt_um */
field xnav_FootPrint    as char    /* pt_drwg_size */
field xnav_Article      as char    /* pt_article */
field xnav_FaceLblID    as char    /* pt__chr05 */
field xnav_TopLblID     as char    /* pt__chr06 */
field xnav_Created      as date    /* Date DO created */
field xnav_Modified     as date    /* Date DO Modified */
field xnav_SentSt       as log     /* yes = successfully sent to Navigator */
field xnav_domain       as char
.

define {1} shared temp-table tP
field Pt as char
field Pn  as int
field Ps  as int
field Pr  as int
field Pq as int
field Pi as int
field pL as char.

define {1} shared temp-table ttloc
field tloc_line as int
field tloc_chline as char
field tloc_part as char
field tloc_loc  as char
field tloc_qty_ship as dec.

def temp-table tPh
field Ht as char
field Hn as int
field Hs as int
field Hq as int.

/*---------------------------------------------------------------------------*/
function fappend returns char (ipchar as char, ipnew as char, ipdel as char).
def var vdlim1 as char.
vdlim1 = ipdel.
if length(vdlim1) > 1 then vdlim1 = substring(ipdel, 1, 1).
    return
    if ipchar = "" then replace(ipdel, vdlim1, "") + trim(ipnew)
    else ipchar +
         (if ipdel = "" then "," else ipdel) +
	 trim(ipnew).
end.  /* function fappend */

/*---------------------------------------------------------------------------*/
function plr returns integer
(ipfunc as char, ipqty as int, ippalletsize as int, iplayers as int).
def var p as int.
def var l as int.
def var r as int.

   if iplayers = 0 then return 0.
   if ippalletsize = 0 then return ipqty.
   if ippalletsize = 1 then return ipqty.
   if ippalletsize = 3 then return ipqty.

   assign
   p = truncate(ipqty / ippalletsize, 0)
   r = ipqty mod (ippalletsize / iplayers)
   l = truncate((ipqty - (p * ippalletsize) - r) / (ippalletsize / iplayers ) 
                 , 0)
   no-error.

   case ipfunc:
     when "Pallets" then return p.
     when "Layers" then return l.
     when "Remainder" then return r.
     otherwise do: return 0. end.
   end.
end.   /* function plr */



/*---------------------------------------------------------------------------*/
function plsplit returns char (ip as int, ps as int).

def var a as char.
def var i as int.

def var p as int.
def var ls as int.
p = ip.

    a = "".
    ls = ps / 3. 

    if ps > 3 then do:
       do i = 1 to plr("Pallets", ip, ps, 3):
          a = fappend(a, string(ps), ",").
       end.
       do i = 1 to plr("Layers", ip, ps, 3):
          a = fappend(a, string(ls), ",").
       end.
    end.
    if plr("Remainder", ip, ps, 3) > 0
    then do:
       a = fappend(a, string(plr("Remainder", ip, ps, 3)), ",").
    end.
    return a.

end.  /* function plsplit */


/*---------------------------------------------------------------------------*/
function pllabel returns char (a as char, ps as int):

def var b as char.
def var i as int.
def var j as int.
def var k as int.
def var ls as int.
ls = ps / 3.

    j = 1.
    k = 1.
    b = "".
    do i = 1 to num-entries(a) by 1:
       case integer(entry(i, a))    :
         when ps then do:
	   b = fappend(b, string(j, ">>>9"), ",P").
	   j = j + 1.
	 end.
	 when ls then do:
	   b = fappend(b, string(k, ">>>9"), ",L").
           k = k + 1.
	 end.
	 otherwise do:
	   b = fappend(b, "", ",").
	 end.
       end.
    end.
    return b.

end.


