/* xxcimir.p -  CIM TO INTERSITE REQUEST                                      */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/******************************************************************************/
/* REVISION: 1.0     LAST MODIFIED: 05-APR-2012     BY: gbg *d1815*           */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/


{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}

define input parameter ipsite      as char.
define input parameter ipnbr       as char.
define input parameter ippart      as char.
define input parameter ipdtord     as date.
define input parameter ipdtdue     as date.
define input parameter ipqty       as dec.
define input parameter ipstat      as char.
define input parameter iprmks      as char.
define input parameter ipjob       as char.
define input parameter iploc       as char.
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
          ""dsdmmt.p"",
          output group_id,
          output error_ind,
          output error_msg)"}


linedata = cimit(ipsite) + " " +
           cimit(ipnbr).

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

if ippart <> ?
then do:
  linedata = cimit(ippart).

  {us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}
end.

linedata = cimit(stringdt(ipdtord)) + " " +
           cimit(stringdt(ipdtdue)) + " " +
           string(ipqty, "-9999999.99") + " " +
	   cimit(ipstat) + " " +
	   '"' + cimit(iprmks) + '" ' +
	   cimit(ipjob) + " " +
	   cimit(iploc) + " " +
	   "no ".                          /* no comments */

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}


linedata = ".".   /* No detail required */

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

linedata = ".".   /* Exit Program */

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
/*c1125*/ usrw_domain = global_domain and
    usrw_key1 = "CIM_OUT" + string(group_id, "99999999")
    no-error.
    if available usrw_wkfl
    then do:
       operr = progress_errors + function_errors.
       opmsg = usrw_charfld[1].
/*cy1020*
       display 
       "CIM returned the following error:" skip
       usrw_charfld[1]    format "x(60)"
       with frame cimer centered overlay no-labels no-attr-space.
       pause.
*cy1020*/
    end.
end.


