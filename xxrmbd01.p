/* xxrmbd01.p - Utility to clean up the CIM tables bdl_mstr bdld_det         */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB               LAST MODIFIED: 2014-JUN-19     BY: gbg *c1472*          */
/*---------------------------------------------------------------------------*/
{us/mf/mfdtitle.i +x1}

def var effdate   as date label "Date".
def var maxruntime as int label "Run (minutes)".
def var startdate  as date.
def var starttime  as int.
def var starttimex as int.
def var testdate   as date.
def var testtime   as int.
def var dayseconds as int.
dayseconds = 24 * 60 * 60.
def var dmsg       as char  format "x(130)".
def var vcount     as int.
def var vcount1    as int.

def var vmessage  as char.

form
effdate    colon 20
maxruntime colon 20
skip(2)
with frame a width 80 side-labels.
setFrameLabels(frame a:handle).

form
dmsg  label "Action"
with frame d width 132 no-box down.
setFrameLabels(frame d:handle).

function pasttesttime returns logical (itestdate as date, itesttime as int).
def var thisdate as date.
def var thistime as int.
def var thistimex as int.
thistime = time.
thisdate = today.
thistimex = time.
if thistimex < thistime
then do:
   thistime = thistimex.
   thisdate = today.
end.
if thisdate > itestdate then return true.
if thisdate = itestdate and thistime > itesttime then return true.
return false.
end.  /* function pasttesttime */



effdate = today - 5.
maxruntime = 60.

mainloop:
repeat:
    update
    effdate
    maxruntime
    with frame a.

    if effdate > today - 2
    then do:
        vmessage = "Date cannot be greater than " + string(today - 2).
	{us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	undo mainloop, next mainloop.
    end.

    bcdparm = "".
    {us/mf/mfquoter.i effdate}


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

   starttime = time.
   startdate = today.
   starttimex = time.
   if starttimex < starttime
   then do:
       starttime = starttimex.
       startdate = today.
   end.  /* if starttimex < starttime */
   testdate = startdate.
   testtime = starttime + (60 * maxruntime).
   if testtime > dayseconds
   then do:
       testtime = testtime - dayseconds.
       testdate = testdate + 1.
   end. /* if testtime > dayseconds */

   dmsg = "Start deleting orphaned bdld_det at " 
          + string(time, "HH:MM:SS").
   display dmsg
   with frame d.
   down with frame d.
   vcount = 0.
   for each bdld_det no-lock
   where not can-find(first bdl_mstr 
                       where bdl_domain = bdld_domain
		       and   bdl_id = bdld_id):
        {us/bbi/gprun.i ""xxrmbd1a.p"" "(recid(bdld_det))"}
	vcount = vcount + 1.
	if pasttesttime(testdate, testtime) then leave.
   end.  /* for each bdld_det */

   dmsg = "Completed deleting orphaned bdld_det records at " 
          + string(time, "HH:MM:SS").
   display dmsg
   with frame d.
   down with frame d.

   dmsg = "Deleted " 
          + trim(string(vcount, ">>>>>>>>9"))
	  + " orphaned bdld_det records.".
   display dmsg
   with frame d.
   down with frame d.


   if not pasttesttime(testdate, testtime)
   then do:

       dmsg = "Started deleting bdl_mstr records at " 
              + string(time, "HH:MM:SS").
       display dmsg
       with frame d.
       down with frame d.

       vcount = 0.
       vcount1 = 0.
       for each bdl_mstr no-lock
       where bdl_date_ent <= effdate:
         for each bdld_det no-lock
         where bdld_domain = bdl_domain
         and   bdld_id = bdl_id:
            {us/bbi/gprun.i ""xxrmbd1a.p"" "(recid(bdld_det))"}
	    vcount1 = vcount1 + 1.
         end.
         {us/bbi/gprun.i ""xxrmbd2a.p"" "(recid(bdl_mstr))"}
	 vcount = vcount + 1.
         if pasttesttime(testdate, testtime) then leave.
       end. /* for each bdl_mstr */

       dmsg = "Finished deleting bdl_mstr records at " 
              + string(time, "HH:MM:SS").
       display dmsg
       with frame d.
       down with frame d.

       dmsg = "Deleted " 
              + trim(string(vcount, ">>>>>>>>9"))
	      + " bdl_mstr records.".
       display dmsg
       with frame d.
       down with frame d.
    
       dmsg = "Deleted " 
              + trim(string(vcount1, ">>>>>>>>9"))
	      + " bdld_det records.".
       display dmsg
       with frame d.
       down with frame d.
    

   end.


   {us/mf/mfrtrail.i}  /* print selection criteria */

end. /* mainloop */
