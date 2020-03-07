/* xxutd02.p - Utility to remove orphaned lad_det records                    */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 15-Jul-2013     BY: gbg *c1422*          */
/*---------------------------------------------------------------------------*/


{us/mf/mfdtitle.i +1.0}


def var snbr     like lad_nbr.
def var snbr1    like lad_nbr.
def var site     like si_site.
def var site1    like si_site.
def var vupdate  like mfc_logical.


form
snbr   colon 24 label "Req Nbr"   snbr1 colon 40 label "to"
site   colon 24                   site1 colon 40 label "to"
skip(1)
vupdate colon 24 label "Update y/n?"
with frame a width 80 side-labels no-attr-space.




mainloop:
repeat:
   if snbr1 = hi_char then snbr1 = "".
   if site1 = hi_char then site1 = "".
   vupdate = no.

   update
   snbr   snbr1
   site   site1
   vupdate
   with frame a.




   bcdparm = "".
   {us/mf/mfquoter.i snbr}
   {us/mf/mfquoter.i snbr1}
   {us/mf/mfquoter.i site}
   {us/mf/mfquoter.i site1}
   {us/mf/mfquoter.i vupdate}

   if snbr1 = "" then snbr1 = hi_char.
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

   for each lad_det
   where lad_domain = global_domain
   and   lad_dataset = "sod_det"
   and   lad_nbr >= snbr
   and   lad_nbr <= snbr1
   and   lad_site >= site
   and   lad_site <= site1
   and   (not can-find(first sod_det
                      where sod_domain = global_domain
		      and   sod_nbr     = lad_nbr
		      and   sod_line = integer(lad_line)
		      and   sod_compl_stat = "")
	  or
          not can-find(first abs_mstr
	              where abs_domain = global_domain
		      and   abs_order = lad_nbr
	              and   integer(abs_line) = integer(lad_line))
	  ):


        display
	lad_site
	lad_nbr
	lad_line
	lad_part
	lad_qty_all
	with frame d width 132 no-attr-space no-box down.
	down with frame d.

	if vupdate then delete lad_det.

   end.

   {us/mf/mfrtrail.i}  /* print selection criteria */

end.  /* mainloop */
