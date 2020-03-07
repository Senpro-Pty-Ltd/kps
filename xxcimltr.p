/* xxcimltr.p -  CIM TO Location Transfer with pallet number generation       */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/******************************************************************************/
/* CYB   LAST MODIFIED: 20-SEP-2013     BY: gbg *c1440*                       */
/******************************************************************************/


{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/xx/xxciml01.i}

define output parameter operr   as int.
define output parameter opmsg   as char.


def var group_id as int no-undo.
def var error_ind as log no-undo.
def var error_msg as char no-undo.
def var line_no as int no-undo.
def var progress_errors as int no-undo.
def var function_errors as int no-undo.
def var function_warnings as int no-undo.
def var group_list as char no-undo.
def var linedata as char no-undo.
def var confdata as char no-undo.

/*------------------------------*/
function cimit returns char
(ipchar as char).
 
if ipchar = " "
or ipchar = ?
then return "-".
return ipchar.

end.


/*------------------------------*/
function stringdt returns char
(ipdate as date).
return     string(day(ipdate), "99") +
           string(month(ipdate), "99") +
           substring(string(year(ipdate), "9999"), 3, 2).
end.





operr = 0.
opmsg = "Success".

{us/bbi/gprun.i ""xxbdlid.p""
       "("""",
          ""xxlotr03.p"",
          output group_id,
          output error_ind,
          output error_msg)"}


linedata = vPart.

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

linedata = trim(string(vQuantity, "->>>>>>>9.99")) + " " +
           cimit(trim(stringdt(vEffDate))) + " " +
           cimit(vWOnbr) + " " +
	   cimit(vSOjob) + " " +
	   cimit(vRmks).


{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

linedata = cimit(vSiteFrom) + " " +
           cimit(vLocFrom) + " " +
           cimit(vLotFrom) + " " +
           cimit(vRefFrom).

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

linedata = cimit(vSiteTo) + " " +
           cimit(vLocTo) + " " +
           cimit(vLotTo) + " " +
           cimit(vRefTo).

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

linedata = cimit(vOutputTo).

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

linedata = ".".

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

linedata = ".".

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}




group_list = string(group_id,"99999999").

{us/bbi/gprun.i ""xxbdpro.p"" 
             "("""",
               group_list,
               no, no,
               output progress_errors,
               output function_errors,
               output function_warnings)"}


if progress_errors > 0
or function_errors > 0
then do:
    find first usrw_wkfl no-lock
    where 
    usrw_domain = global_domain and
    usrw_key1 = "CIM_OUT" + string(group_id, "99999999")
    no-error.
    if available usrw_wkfl
    then do:
       operr = progress_errors + function_errors.
       opmsg = usrw_charfld[1].
    end.
end.


