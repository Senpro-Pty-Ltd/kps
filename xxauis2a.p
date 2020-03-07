/* xxauis2a.p - Shipper Auto Confirm - Invoice Print                         */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                    */
/* CYB    LAST MODIFIED: 73-JUL-2011    BY:  gbg *c1226*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

define output parameter printdev as char.
{us/bbi/mfdeclre.i}
define shared variable printdefault       like prd_dev.


def var dev        like prd_dev.


outerloop:
repeat:

prdloop:
repeat:

dev = printdefault.
display dev with frame a.
prompt-for dev  Label "Output"
with frame a
side-labels row 8 centered title "Invoice Printer Selection"
editing:
   {us/mf/mfnp05.i prd_det prd_dev "yes" prd_dev "input dev"}
   if recno <> ?
   then do:
       dev = prd_dev.
       display dev
       with frame a.
   end.
end.
find first prd_det no-lock
where prd_dev = input dev
no-error.
if not available prd_det
then do:
   {us/bbi/pxmsg.i &MSGNUM=34 &ERRORLEVEL=2}
   pause.
   hide message no-pause.
end.

printdev = input dev.

hide frame a no-pause.

leave prdloop.
end.  /* prdloop */

if printdev <> "" 
and printdev <> ?
then leave outerloop.
end.

