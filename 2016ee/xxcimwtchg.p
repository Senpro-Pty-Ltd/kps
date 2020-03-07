/* xxcimwtchg  -  CIM TO LOT SERIAL CHANGE - WEIGHT CHANGE                    */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* CYB     LAST MODIFIED: 12-MAR-2012            BY: nac *d1801*             */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*                                                                            */


{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}

define input parameter ipnbr    as char.
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
def var qtytochg as dec no-undo.

/*------------------------------*/
function cimit returns char
(ipchar as char).
 
if ipchar = " "
or ipchar = ?
then return "-".
return '"' + right-trim(ipchar) + '"'.

end.


/*------------------------------*/
function stringdt returns char
(ipdate as date).
return     string(day(ipdate), "99") +
           string(month(ipdate), "99") +
           substring(string(year(ipdate), "9999"), 3, 2).
end.


define shared temp-table xxlbls
	field xxtrnbr like tr_trnbr
	field xxline as integer
	field xxpart like tr_part
	field xxsite like tr_site
	field xxloc like tr_loc
	field xxserial like tr_serial
	field xxoref like tr_ref
	field xxref like tr_ref
	field xxprint as logical initial no
	field xxnbr like wo_nbr.

operr = 0.
opmsg = "Success".
qtytochg = 1.

{us/bbi/gprun.i ""xxbdlid.p""
       "("""",
          ""iclotr03.p"",
          output group_id,
          output error_ind,
          output error_msg)"}

for each xxlbls where xxprint:
   find tr_hist where tr_domain = global_domain and tr_trnbr = xxtrnbr
   no-lock no-error.

/*debug*
   find ld_det where ld_domain = global_domain 
   and ld_part = tr_part
   and ld_site = tr_site
   and ld_lot = tr_lot
   and ld_ref = tr_ref
   and ld_qty_oh > 0.0
   no-lock no-error.
*debug*/

   linedata = cimit(xxpart).

   {us/bbi/gprun.i ""xxbdld.p""
         "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}


   linedata = string(qtytochg, "->>>>>9.9999") 
           + " - " 
      	   + xxnbr
	   + " - "
	   + " - ".

   {us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

   /*From Data*/

   linedata = cimit(xxsite)
           + " " 
	   + cimit(xxloc)
	   + " "
	   + cimit(xxserial)
	   + "   "
	   + cimit(xxoref).

   {us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

/*
   /* Warning: Not enough unallocated inventory question */
   if ld_qty_oh - 1 - ld_qty_all < 0 
   and ld_qty_all > 0
   and ld_qty_oh > 0 
   then do:
      linedata = "-".
      {us/bbi/gprun.i ""xxbdld.p""
         "("""",
            group_id,
            linedata,
            input-output line_no,
            output error_ind,
            output error_msg)"}
   end.
*/

   /*To Data*/

   linedata = cimit(xxsite)
           + " " 
	   + cimit(xxloc)
	   + " "
	   + cimit(xxserial)
	   + "  "
	   + cimit(xxref).

   {us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

/*
    /*Status Change*/
    find ld_det where ld_domain = global_domain 
    and ld_part = tr_part
    and ld_site = tr_site
    and ld_loc = tr_loc 
    and ld_lot = tr_lot
    and ld_ref = xxref
    no-lock no-error.
    if ld_qty_oh = 0 then do:
       linedata = "-".
       {us/bbi/gprun.i ""xxbdld.p""
          "("""",
             group_id,
             linedata,
             input-output line_no,
             output error_ind,
             output error_msg)"}
    end.
*/

   linedata = "-".
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
end.

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
