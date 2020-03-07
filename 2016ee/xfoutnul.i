/* xfoutnul.i - OUTPUT TO THE BIT BUCKET (BY O.S.)                            */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Maintenance                                                  */

/*With a Formtrap converted routine, want the normal output to go to /dev/null*/
/* {1} - Stream name  eg. "stream test"                                       */

if opsys = "unix" then
   output {1} to "/dev/null".
else if opsys = "msdos" or opsys = "win32" then
   output {1} to "nul".
else if opsys = "vms" then
   output {1} to "nl:".
else if opsys = "btos" then
   output {1} to "[nul]".
