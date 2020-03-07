/* xxircn04.p - Intersite Requistion Remove Consolidated Lines               */
/* xxircn02.p - Intersite Requistion Remove Consolidated Lines               */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 22-MAY-2012     BY: gbg *d1815*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                   LAST MODIFIED: 2015-OCT-19 BY: gbg *d3269*   */
/*---------------------------------------------------------------------------*/

{us/mf/mfdtitle.i +1.0}


def var shipsite   like dsd_shipsite.
def var site       like dsd_site.
def var site1      like dsd_site.
/*d3269* start added code >>> */
def var daysBefore  as int format ">>9" label "Days Before".
def var daysAfter   as int format ">>9" label "Days After".
/*d3269* end added code   <<< */
def var vupdate    like mfc_logical.
def var vmessage   as char.

/*d3269* start added code >>> */
form
shipsite colon 20
site     colon 20 site1 colon 38 label "to"
daysBefore colon 20 label "Days Before"
daysAfter  colon 38 label "Days After"
skip(1)
vupdate  colon 20  label "Update"
skip(2)
with frame a width 80 side-labels no-attr-space.

setFrameLabels(frame a:handle).
/*d3269* end added code   <<< */

/*d3269* start deleted code >>>
* form
* shipsite colon 20
* site     colon 20 site1 label "to"
* skip(1)
* vupdate  colon 20  label "Update"
* skip(2)
* with frame a width 80 side-labels no-attr-space.
*d3269*  end deleted code <<< */


mainloop:
repeat:

   selloop:
   repeat:
      if site1 = hi_char then site1 = "".
      update 
      shipsite
      site
      site1
/*d3269* start added code >>> */
      daysBefore daysAfter
/*d3269* end added code   <<< */
      vupdate
      with frame a.
      if not can-find(first si_mstr
                      where si_domain = global_domain
		      and   si_site = shipsite)
      then do:
          vmessage = "Ship Site must be a valid site".
	  {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	  undo selloop, retry selloop.
      end.
      leave selloop.
   end.  /* selloop */
   if keyfunction(lastkey) = "end-error" then leave mainloop.
   bcdparm = "".
   {us/mf/mfquoter.i shipsite}
   {us/mf/mfquoter.i site}
   {us/mf/mfquoter.i site1}
/*d3269* start added code >>> */
   {us/mf/mfquoter.i daysBefore}
   {us/mf/mfquoter.i daysAfter}
/*d3269* end added code   <<< */
   {us/mf/mfquoter.i vupdate}
   if site1 = "" then site1 = hi_char.


   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType                = "printer"
               &printWidth               = 132
               &pagedFlag                = " "
               &stream                   = " "
               &appendToFile             = " "
               &streamedOutputToTerminal = "yes"
               &withBatchOption          = "yes"
               &displayStatementType     = 1
               &withCancelMessage        = "yes"
               &pageBottomMargin         = 6
               &withEmail                = "yes"
               &withWinprint             = "yes"
               &defineVariables          = "yes"}
   {us/bbi/mfphead.i}
   view frame phead1.
/*d3269* start added code >>> */
       {us/bbi/gprun.i ""xxircn4a.p""
                "(shipsite,
		  site,
		  site1,
		  daysBefore,
		  daysAfter,
		  today,
		  vupdate
		 )"}
/*d3269* end added code   <<< */
/*d3269* start deleted code >>>
*        {us/bbi/gprun.i ""xxircn2a.p""
*                 "(shipsite,
* 		  site,
* 		  site1,
* 		  today,
* 		  vupdate
* 		 )"}
*d3269*  end deleted code <<< */
   {us/mf/mfrtrail.i}                  /* print selection criteria */
        
/*   {us/bbi/mfreset.i}                   /* close output stream */  */



end.  /* mainloop */
