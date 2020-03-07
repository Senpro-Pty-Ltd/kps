/* xxldbr01.p  - Load Customer Brands from csv file                          */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 29-AUG-2011     BY: gbg *cy1052*         */
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
do vLines = 1 to 20:
   vLabels[vLines]  = "Brand " + string(vLines, "99").
   vFields[vLines]  = "cm_brand" + string(vLines, "99").
end.

def temp-table ttBrands
field  vAddr                    as char
field  vBrand                   as char extent 20.

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
         if num-entries(vInputChar) <> 21
         then do:
             vMessage  = "Expected 21 cols found " +
	                       string(num-entries(vInputChar)).
             {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
	     vReadSuccess = false.
	     leave updloop.
         end.
         if entry(2, vInputChar) <> "brand 01"
         then do:
            vMessage = "File labels do match required labels".
             {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
	     vReadSuccess = false.
	     leave updloop.
         end.
       end.
       
       vLines = 2.
       loadloop:
       repeat:

          import unformatted vInputChar.
	  if vInputChar <> ""
	  then do:
             if num-entries(vInputChar) <> 21
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
	     vBrand[1]   = entry(2, vInputChar)
	     vBrand[2]   = entry(3, vInputChar)
	     vBrand[3]   = entry(4, vInputChar)
	     vBrand[4]   = entry(5, vInputChar)
	     vBrand[5]   = entry(6, vInputChar)
	     vBrand[6]   = entry(7, vInputChar)
	     vBrand[7]   = entry(8, vInputChar)
	     vBrand[8]   = entry(9, vInputChar)
	     vBrand[9]   = entry(10, vInputChar)
	     vBrand[10]   = entry(11, vInputChar)
	     vBrand[11]   = entry(12, vInputChar)
	     vBrand[12]   = entry(13, vInputChar)
	     vBrand[13]   = entry(14, vInputChar)
	     vBrand[14]   = entry(15, vInputChar)
	     vBrand[15]   = entry(16, vInputChar)
	     vBrand[16]   = entry(17, vInputChar)
	     vBrand[17]   = entry(18, vInputChar)
	     vBrand[18]   = entry(19, vInputChar)
	     vBrand[19]   = entry(20, vInputChar)
	     vBrand[20]   = entry(21, vInputChar).
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
       then do vLines = 1 to 20:
           vReturnValue = SetFieldValueChar ("cm_mstr",
	                                     vFields[vLines],
					     oid_cm_mstr,
					     vBrand[vLines]).
       end.
    end.

end.  /* mainloop */
