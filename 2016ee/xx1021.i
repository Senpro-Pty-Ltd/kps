/* xx1021.i  - Include for cy1021 mods                                       */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: gbg             BY: gbg *cy1021*         */
/* REVISION: 1.0     LAST MODIFIED: 7-Sep-2011      BY: gbg *c1238*          */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB    LAST MODIFIED: 2015-SEP-11      BY: gbg *D3243*                     */
/*---------------------------------------------------------------------------*/

def {1} shared var pl_batterys as char.



function unlist returns char (inlist as  char).
def var pl_batterys   as char.
def var pl_batteryfrom as char.
def var pl_batteryto   as char.
def var pl_batterynext as char.
def var pl_ibattery    as int.
def var pl_ifrom       as int.
def var pl_ito         as int.
def var vicount       as int.
def var vicount2      as int.


  do vicount = 1 to num-entries(inlist):
     if num-entries(entry(vicount, inlist), "-") <= 1
     then pl_batterys = pl_batterys + (if pl_batterys = "" then 
                        entry(vicount, inlist) else
			"," + entry(vicount, inlist)).
     else do:
        pl_batteryfrom = entry(1, entry(vicount, inlist), "-").
        pl_batteryto   = entry(2, entry(vicount, inlist), "-").
	pl_ifrom    = integer(pl_batteryfrom) no-error.
	if not error-status:error then do:
	pl_ito      = integer(pl_batteryto) no-error.
	if not error-status:error 
	and pl_batteryto >= pl_batteryfrom then do:
	    do vicount2 = pl_ifrom       to pl_ito:       
               pl_batterys = pl_batterys + (
	                     if pl_batterys = "" then
	                     string(vicount2, "9999") else
			     "," + string(vicount2, "9999")).
	    end.
        end.
        end.

     end.
  end.
  return pl_batterys.
end.


procedure plbattlist.

pl_batterys = "".
find first code_mstr no-lock
where code_domain = global_domain
and   code_fldname = "pl_battery"
and   code_value = "pl_battery"
no-error.
if available code_mstr
then do:
    pl_batterys = unlist(code_cmmt).
end.

end.  /* procedure plbattlist */
