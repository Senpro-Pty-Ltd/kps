/* xxutfc01.p - Utility to clear foreccast prior to refresh                  */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 24-AUG-2012     BY: gbg *c1331*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

{us/mf/mfdtitle.i +x1}

{us/xx/xxutfc01.i NEW}

form
site     label "Site" colon 20     site1     label {us/t0/t001.i} colon 45
part     label "Item" colon 20     part1     label {us/t0/t001.i} colon 45
fcdate   label "Date" colon 20     fcdate1   label {us/t0/t001.i} colon 45
skip(1)
vupdate  label "Update y/n" colon 20
skip(1)
with frame a width 80 side-labels no-attr-space.





/*---------------------------------------------------------------------------*/
fcdate = today + 1.
do while weekday(fcdate) <> 2:
   fcdate = fcdate + 1.
end.
{us/bbi/gprun.i ""fcsdate2.p"" 
         "(fcdate, output frprd)"}
fcdate1 = date(12, 31, year(fcdate) + 1).
{us/bbi/gprun.i ""fcsdate2.p"" 
         "(fcdate1, output toprd)"}

do while toprd = 53:
   fcdate1 = fcdate1 - 1.
   {us/bbi/gprun.i ""fcsdate2.p"" 
         "(fcdate1, output toprd)"}
end.




/*---------------------------------------------------------------------------*/
mainloop:
repeat:

    selloop:
    repeat:
       if site1   = hi_char   then site1   = " ".
       if part1   = hi_char   then part1   = " ".
       vupdate = no.

       update
       site site1
       part part1
       fcdate fcdate1
       vupdate
       with frame a.

       if fcdate = ?
       or fcdate1 = ?
       then do:
          vmessage = "Dates must be entered".
	  {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	  next-prompt fcdate with frame a.
	  next selloop.
       end.

       if fcdate >= fcdate1
       then do:
          vmessage = "To date must be greater than from date".
	  {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	  next-prompt fcdate with frame a.
	  next selloop.
       end.

       if site1    = ""  then site1  = hi_char.
       if part1    = ""  then part1  = hi_char.

       if not can-find(first fcs_sum
                       where fcs_domain = global_domain
		       and   fcs_year = year(fcdate)
		       and   fcs_site >= site
		       and   fcs_site <= site1
		       and   fcs_part >= part
		       and   fcs_part <= part1)
       then do:
          vmessage = "No forecast data for year " + string(year(fcdate)).
	  {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	  next-prompt fcdate.
	  next selloop.
       end.

       leave selloop.
    end.
    if keyfunction(lastkey) = "end-error"
    then leave mainloop.



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



    fryear = year(fcdate).
    toyear = year(fcdate1).
    {us/bbi/gprun.i ""fcsdate2.p"" 
             "(fcdate, output frprd)"}
    {us/bbi/gprun.i ""fcsdate2.p"" 
             "(fcdate1, output toprd)"}

    empty temp-table ttprds.
    wkdate2 = fcdate.
    do while wkdate2 <= fcdate1:
       wkyear = year(wkdate2).
       {us/bbi/gprun.i ""fcsdate2.p""
                "(wkdate2, output wkprd)"}
       if wkprd = 53 then do:
          wkyear = wkyear + 1.
	  wkprd = 1.
       end.
       create ttprds.
       assign
       ttyear = wkyear
       ttprd = wkprd
       ttdate = wkdate2
       wkdate2 = wkdate2 + 7.
    end.
    empty temp-table ttyrs.
    for each ttprds
    break by ttyear:
       if first-of(ttyear)
       then do:
           create ttyrs.
	   ttyr = ttyear.
       end.
    end.

    for each ttyrs:
        for each fcs_sum no-lock
	where fcs_domain = global_domain
	and   fcs_year = ttyr
	and   fcs_site >= site
	and   fcs_site <= site1
	and   fcs_part >= part
	and   fcs_part <= part1:
          {us/bbi/gprun.i ""xxutfc1a.p""
	           "(recid(fcs_sum),
		     ttyr)"}
	end.
    end.


/*   {us/bbi/mfreset.i}   /* close output stream */ */
   {us/mf/mfrtrail.i}  /* print selection criteria */
end.
