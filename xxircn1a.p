/* xxircn1a.p - Intersite Request Lines Consolidation                        */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 21-MAR-2012     BY: gbg *d1815*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/xx/xxdr.i}

define input parameter ipshipsite           as char.
define input parameter ipsitefr             as char.
define input parameter ipsiteto             as char.
define input parameter ipdate               as date.
define input parameter ipupdate             as logical.

def var trfr_qty  as dec format "->>,>>>,>>9.99" label "Consol Qty".
def var trfr_nbr  as char label "Consol Req".
def var req_nbr   as char.
def var vError   as int.
def var vErrMessage as char.
def var vMessage as char.

def temp-table tns
field tpart   as char
field tsite as char
field nship as date.




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

define new shared temp-table tdsd like dsd_det.

for each si_mstr no-lock
where si_domain = global_domain
and   si_site >= ipsitefr
and si_site <= ipsiteto:
    updloop:
    repeat transaction:
        empty temp-table tns.
        for each dsd_det no-lock
        where dsd_det.dsd_domain = global_domain
        and   dsd_det.dsd_nbr = ""
        and   dsd_det.dsd_shipsite = ipshipsite
        and   dsd_det.dsd_shipdate <=  today + 21
        and   dsd_det.dsd_site = si_site
        /*
        and   dsd_det.dsd_site >= ipsitefr
        and   dsd_det.dsd_site <= ipsiteto
        */
        and   lookup(dsd_status, dsdstatexcl) = 0
        and   dsd_Det.dsd_qty_ord <> dsd_det.dsd_qty_ship
        break by dsd_site by dsd_part:
            if first-of(dsd_part)
            then do:
               create tns.
               assign
               tns.tsite = dsd_det.dsd_site
               tns.tpart = dsd_det.dsd_part
               tns.nship = 
                    fNextShipDate(fNetWorkCode(dsd_det.dsd_part, dsd_det.dsd_site),
                          ipdate,
			  dsd_det.dsd_site).
            end.
        end.

        empty temp-table tdsd.

        for each dsd_det no-lock
        where dsd_det.dsd_domain = global_domain
        and   dsd_det.dsd_nbr = ""
        and   dsd_det.dsd_shipsite = ipshipsite
        and   dsd_det.dsd_site = si_site
        /* and   dsd_det.dsd_site >= ipsitefr
        and   dsd_det.dsd_site <= ipsiteto
        */
        and   lookup(dsd_status, dsdstatexcl) = 0
        and   dsd_Det.dsd_qty_ord <> dsd_det.dsd_qty_ship,
        first tns
        where tns.tsite = dsd_det.dsd_site
        and   tns.tpart = dsd_det.dsd_part
        and   tns.nship >= dsd_det.dsd_shipdate,
        first dsr_mstr no-lock
        where dsr_domain = global_domain
        and   dsr_req_nbr = dsd_req_nbr
        break by dsd_site by dsd_part:
           if first-of(dsd_part)
           then do:
              empty temp-table tdsd.
              create tdsd.
              buffer-copy dsd_det to tdsd
              assign
              tdsd.dsd_qty_ord = 0.0
              tdsd.dsd_qty_conf = 0.0
              tdsd.dsd_qty_rcvd = 0.0
              tdsd.dsd_qty_ship = 0.0
              tdsd.dsd_transit = 0.0
              tdsd.dsd_rmks = ""
              tdsd.dsd_status = ""
              tdsd.dsd_cmtindx = 0
              tdsd.dsd_residual = 0.0
              tdsd.dsd_qty_chg = 0.0
              tdsd.dsd_po_nbr = ""
              tdsd.dsd_pod_line = 0.
           end.
           assign
           trfr_qty = dsd_Det.dsd_qty_ord - dsd_det.dsd_qty_ship.
           tdsd.dsd_qty_ord = tdsd.dsd_qty_ord + trfr_qty.

           accumulate trfr_qty (total by dsd_part).

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

           if ipupdate then do:              /* remove this ir & mrp record */
              {us/bbi/gprun.i ""xxcimir.p""
               "(dsd_det.dsd_site,
                 dsd_det.dsd_req_nbr,
		 ?,
                 dsr_ord_date,
                 dsr_due_date,
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

           if last-of(dsd_part) then do:
              if ipupdate then do:
	         find first tdsd.

	         /* Get next requisition number */
                 {us/mf/mfnctrlc.i
                 "drp_ctrl.drp_domain = global_domain"
                 "drp_ctrl.drp_domain"
                 "dsr_mstr.dsr_domain = global_domain"
                 drp_ctrl
                 drp_req_pre
                 drp_req_nbr
                 dsr_mstr
                 dsr_req_nbr
                 req_nbr}

	         {us/bbi/gprun.i ""xxcimir.p""
                       "(tdsd.dsd_site,
                         req_nbr,
		         tdsd.dsd_part,
                         today,
                         fGetDueDate(tdsd.dsd_part, 
		          tdsd.dsd_site, 
		          tdsd.dsd_shipsite,
		          today),
		         tdsd.dsd_qty_ord,
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
              display  
              "--------------" @ trfr_qty
              with frame rpd.
              down with frame rpd.
              display  
              " " @ dsd_Det.dsd_req_nbr
              tdsd.dsd_part @ dsd_Det.dsd_part
              tdsd.dsd_shipsite @ dsd_det.dsd_shipsite
              tdsd.dsd_site @ dsd_Det.dsd_site
              " " @ dsd_det.dsd_shipdate
              (accum total by dsd_part trfr_qty) @ trfr_qty
              req_nbr @ trfr_nbr
              with frame rpd.
              down with frame rpd.
              display  
              "==============" @ trfr_qty
              with frame rpd.
              down with frame rpd.
              down with frame rpd.
        
           end.
        end.
        if not ipupdate then do:
           undo updloop, leave updloop.
        end.
        leave updloop.
    end. /* repeat transaction */
end. /* each si_site */

