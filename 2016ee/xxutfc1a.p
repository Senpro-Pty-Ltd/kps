/* xxutfc1a.p   Forecast Clear sub-routine - clear one fc number             */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 24-AUG-2012     BY: gbg *c1331*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/xx/xxutfc01.i}

define input parameter fcsid      as recid.
define input parameter fcyear     as int.

def var fcsnbr as char.
def var open_qty as dec.
def var dispqty as dec format "->>,>>>,>>9".
def var disppart like pt_desc1.

form
fcs_year 
fcs_site
fcs_part
disppart
ttprd
ttdate
dispqty
with frame d width 132 no-box no-attr-space down.


find first fcs_sum exclusive-lock
where recid(fcs_sum) = fcsid
no-error.
if available fcs_sum
then do:
    find first pt_mstr no-lock
    where pt_domain = global_domain
    and   pt_part = fcs_part
    no-error.
    disppart = if available pt_mstr then pt_desc1 else "-".
    open_qty = 0.0.
    fcsnbr = string(fcs_year, "9999") + 
                trim(fcs_site).
    for each ttprds
    where ttyear = fcyear:

       dispqty = fcs_fcst_qty[ttprd].
       display
       fcs_year 
       fcs_site
       fcs_part
       disppart
       ttprd
       ttdate
       dispqty
       with frame d.
       down with frame d.


       if vupdate
       then do:
           /* clear the mrp record */

           {us/mf/mfmrwdel.i
            "fcs_sum"
	    fcs_part
	    fcsnbr
	    string(ttprd)
	    """"
	    ?
	    }
           fcs_fcst_qty[ttprd] = 0.0.
       end.
    end.
end.
