/* xxutd01.p - Utility to remove orphaned dsr records                        */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 15-Jul-2013     BY: gbg *c1421*          */
/*---------------------------------------------------------------------------*/


{us/mf/mfdtitle.i +1.0}


def var vdate    as date label "Date".
def var rnbr     like dsr_req_nbr.
def var rnbr1    like dsr_req_nbr.
def var site     like si_site.
def var site1    like si_site.
def var vupdate  like mfc_logical.


form
rnbr   colon 24 label "Req Nbr"   rnbr1 colon 40 label "to"
site   colon 24                   site1 colon 40 label "to"
skip(1)
vdate  colon 24 label "Date"
vupdate colon 24 label "Update y/n?"
with frame a width 80 side-labels no-attr-space.

vdate = 11/01/11.
if not can-find(first code_mstr
               where code_domain = global_domain
               and   code_fldname = "vdate-dut"
               and   code_value = "default")
then do transaction:
   create code_mstr.
   assign
   code_domain = global_domain
   code_fldname = "vdate_dut"
   code_value = "default"
   code_cmmt = string(vdate).
   .
   release code_mstr.
end.

find first code_mstr no-lock
where code_domain = global_domain
and   code_fldname = "vdate-dut"
and   code_value = "default"
no-error.
if available code_mstr
and num-entries(code_cmmt, "/") = 3
then do:
    vdate =  date(code_cmmt) no-error.
    if vdate = ? then vdate = 11/01/11.
end.




mainloop:
repeat:
   if rnbr1 = hi_char then rnbr1 = "".
   if site1 = hi_char then site1 = "".
   vupdate = no.

   update
   rnbr   rnbr1
   site site1
   vdate
   vupdate
   with frame a.




   bcdparm = "".
   {us/mf/mfquoter.i rnbr}
   {us/mf/mfquoter.i rnbr1}
   {us/mf/mfquoter.i site}
   {us/mf/mfquoter.i site1}
   {us/mf/mfquoter.i vdate}
   {us/mf/mfquoter.i vupdate}

   if rnbr1 = "" then rnbr1 = hi_char.
   if site1 = "" then site1 = hi_char.

   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType                = "printer"
               &printWidth               = 132
               &pagedFlag                = " "
               &stream                   = " "
               &appendToFile             = " "
               &streamedOutputToTerminal = " "
               &withBatchOption          = "yes"
               &displayStatementType     = 1
               &withCancelMessage        = "yes"
               &pageBottomMargin         = 6
               &withEmail                = "yes"
               &withWinprint             = "yes"
               &defineVariables          = "yes"}
   {us/bbi/mfphead.i}
   view frame phead1.

   for each dsr_mstr
   where dsr_domain = global_domain
   and   dsr_ord_date <= vdate
   and   dsr_req_nbr >= rnbr
   and   dsr_req_nbr <= rnbr1
   and   dsr_site >= site
   and   dsr_site <= site1
   and   not can-find(first dsd_det
                      where dsd_domain = global_domain
		      and   dsd_req_nbr = dsr_req_nbr):
        display
	dsr_req_nbr
	dsr_site
	dsr_ord_date
	dsr_due_date
	dsr_part
	dsr_qty_req
	with frame d width 132 no-attr-space no-box down.
	down with frame d.

	if vupdate then delete dsr_mstr.

   end.

   {us/mf/mfrtrail.i}  /* print selection criteria */

end.  /* mainloop */
