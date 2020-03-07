/* xxldbr02.p  - Load Customer Data Custome Fields                           */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 19-SEP-2011     BY: gbg *cy1052*         */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

{us/mf/mfdtitle.i +1}
{com/qad/mfgpro/gpgenfld.i} 

def var vFilename                as char format "x(60)" label "File Name".
def var vMessage                 as char.
def var vInputChar               as char format "x(400)".
def var vReadSuccess             as log.
def var vReturnValue             as log.
def var vLines                   as int.

def var vLabels as char extent 20.
def var vFields as char extent 20.

assign
vFields[1] = "cm_bhl01"
vFields[2] = "cm_bhl02"
vFields[3] = "cm_bhl03"
vFields[4] = "cm_bhl04"
vFields[5] = "cm_bhl05"
vFields[6] = "cm_field".
def temp-table ttBrands
field  vAddr                    as char
field  vCustomFields            as char extent 20.

form
vFilename   
with frame a side-labels width 80 no-attr-space.

mainloop:
repeat: 
    updloop:
    repeat:
       update vFilename
       with frame a.
       if search(vFilename)  = ?
       then do:
           vMessage = "File " + vFilename + " does not exist".
	   {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
	   next mainloop.
       end.


       /********************************************************/
       /* Read the first line of the file                      */
       /* it should contain labels                             */
       /********************************************************/
       input from value(vFilename) no-echo.
       empty temp-table ttbrands.
       vReadSuccess = true.
       import unformatted vInputChar.
       if vInputChar = ""
       then do:
          vMessage  = "File is empty".
          {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
	  vReadSuccess = false.
          leave updloop.
       end.
       else do:
         if num-entries(vInputChar) <> 6
         then do:
             vMessage  = "Expected 6 cols found " +
	                       string(num-entries(vInputChar)).
             {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
	     vReadSuccess = false.
	     leave updloop.
         end.
	 /*  Not sure what labels to expect yet  
         if entry(2, vInputChar) <> "brand 01"
         then do:
            vMessage = "File labels do match required labels".
             {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
	     vReadSuccess = false.
	     leave updloop.
         end.
	 */
       end.
       
       vLines = 2.
       loadloop:
       repeat:

          import unformatted vInputChar.
	  if vInputChar <> ""
	  then do:
             if num-entries(vInputChar) <> 6
	     then do:
                vMessage = "File format is incorrect. Line "
		            + string(vLines).
                {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
	        vReadSuccess = false.
	        leave updloop.
	     end.
	     vLines = vLines + 1.
	     create ttBrands.
	     assign
	     vAddr = entry(1, vInputChar)
	     vCustomFields[1]   = entry(2, vInputChar)
	     vCustomFields[2]   = entry(3, vInputChar)
	     vCustomFields[3]   = entry(4, vInputChar)
	     vCustomFields[4]   = entry(5, vInputChar)
	     vCustomFields[5]   = entry(6, vInputChar)
	     vCustomFields[6]   = entry(7, vInputChar).
	  end.
       end.
       leave updloop.
    end.    /* updloop */
    input close.
    if keyfunction(lastkey) = "end-error"
    then do:
        leave mainloop.
    end.
    if not vReadSuccess
    then do:
        next mainloop.
    end.


    /************************************************************/
    /* The data is now loaded in the temp-table                 */
    /* It is ready for updating the customer.                   */
    /************************************************************/

    for each ttBrands:
       find first cm_mstr no-lock
       where cm_domain = global_domain
       and   cm_addr = vAddr
       no-error.
       if available cm_mstr
       then do vLines = 1 to 6:
           vReturnValue = SetFieldValueChar ("cm_mstr",
	                                     vFields[vLines],
					     oid_cm_mstr,
					     vCustomFields[vLines]).
       end.
    end.

end.  /* mainloop */
