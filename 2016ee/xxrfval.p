/* xxrfval.p - get next pallet number                                        */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 21-SEP-2011     BY: gbg *cy1033*         */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
define output parameter oPalletID  as char.

def var lastNumber as int.
def var nextNumber as int.
def var palletPrefix as char.


find first usrw_wkfl no-lock
where usrw_domain = global_domain
and   usrw_key1 = "rfvalues"
and   usrw_key2 = "usepalletprefix"
no-error.
palletPrefix = if available usrw_wkfl then usrw_charfld[1] else "".

find first mfc_ctrl exclusive-lock
where mfc_domain = global_domain
and   mfc_field = "rcc_next_ctnr"
no-error.

if not available mfc_ctrl
then do:
   create mfc_ctrl.
   assign
   mfc_domain = global_domain
   mfc_field = "rcc_next_ctnr"
   mfc_module = "rc"
   mfc_seq = 0
   mfc_integer = 0.
end.

nextNumber = mfc_integer.

lastNumber = if nextNumber = 1 then 9999999 else max(1, nextNumber - 1).
do while can-find(first usrw_wkfl
                  where usrw_domain = global_domain
		  and   usrw_key1 = "LOTREF"
		  and   usrw_key2 = string(nextNumber, "99999999"))
and nextNumber <> lastNumber:
    nextNumber = nextNumber + 1.
    if nextNumber = 10000000 then nextNumber = 1.
end.
mfc_integer = nextNumber + 1.

create usrw_wkfl.
assign
usrw_domain = global_domain
usrw_key1 = "LOTREF"
usrw_key2 = string(nextNumber, "99999999")
usrw_datefld[1] = today.


oPalletID = string(nextNumber, "99999999").
substring(oPalletID, 1, length(trim(palletPrefix))) = trim(palletPrefix).

