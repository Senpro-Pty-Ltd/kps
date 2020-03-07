/* xxpomsk.p    - Template for user defined validations                  */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                 */
/* All rights reserved worldwide.  This is an unpublished work.          */
/*                                                                       */
/* $Id: */
/* CYB        LAST MODIFIED: 01-DEC-2011  BY: gbg *c1264*                */
/* CYB        LAST MODIFIED: 27-JUL-2012  BY: gbg *c1318*                */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*                                                                       */
/* This is the template for user defined validations for configurable    */
/* screens.  When a validation program is made from this template it     */
/* should be compiled and placed in the propath.  It will be called      */
/* following the standard lang/module directory structure.  For example  */
/* if the program name is gpvalidate.p then it should reside in the      */
/* us/gp directory for English installations.                            */

{us/bbi/mfdeclre.i}

/*Methods to get values of additonal Screen fields defined here*/
{com/qad/mfgpro/gpgenfld.i} 

define input parameter pFieldName as character no-undo.
define input parameter pFieldValue as character no-undo.
define input parameter pTableName as character no-undo.
define input parameter pRecid as recid no-undo.
define output parameter pSuccess as logical no-undo.

define var  vPOFormat   as char.
define var  vPOInput    as char.
define var  hdl1        as handle.
/*c1318* start added code >>>*/
define var vReturnValue as logical.
/*c1318* end   added code <<<*/


/*******************************************************************/
/* Start of user defined functions and procedures                  */
/*******************************************************************/
function chkformat returns logical (indata as char, infmt as char).
def var chars as char init "abcdefghijklmnopqrstuvwxyz".
def var ints  as char init "1234567890".
def var vfmt as char.
vfmt = trim(replace(infmt, ".", " ")).
vfmt = replace(vfmt, " ", ".").

def var i as int.


  if vfmt = "" then return true.
  if substring(infmt, 1, 1) = "!"
  then do:
     vfmt = substring(infmt, 2).
     if length(indata) > length(vfmt) then return false.

     do i = 1 to length(indata):
         case substring(vfmt, i, 1):
         when "9" then do:
             if index(ints, substring(indata, i, 1)) = 0
             then return false.
         end.
         when "X" then do:
             if index(chars, substring(indata, i, 1)) = 0
             then return false.
         end.
         when "A" then do:
             if index(chars, substring(indata, i, 1)) = 0 and
                index(ints, substring(indata, i, 1)) = 0
             then return false.
         end.
         when "." then .
         otherwise do:
            if substring(indata, i, 1) <> substring(infmt, i, 1) then
            return false.
         end.
         end.
     end.
     return true.
  end.


  if length(indata) > length(infmt) then return false.
  if length(indata) < length(vfmt)  then return false.
  
  do i = 1 to length(vfmt):
      case substring(vfmt, i, 1):
      when "9" then do:
          if index(ints, substring(indata, i, 1)) = 0
          then return false.
      end.
      when "X" then do:
          if index(chars, substring(indata, i, 1)) = 0
          then return false.
      end.
      when "A" then do:
          if index(chars, substring(indata, i, 1)) = 0 and
             index(ints, substring(indata, i, 1)) = 0
          then return false.
      end.
      when "." then .
      otherwise do:
         if substring(indata, i, 1) <> substring(infmt, i, 1) then
         return false.
      end.
      end.
  end.
  return true.
end.  /* function chkformat */


/* Start main procesing section *************************************/
/* Set default value for result */
pSuccess = true.



find first so_mstr no-lock
where recid(so_mstr) = precid
no-error.
if not available so_mstr
then do:
    psuccess = false.
    return.
end.
find first cm_mstr no-lock
where cm_domain = global_domain
/*c1318*/ and   cm_addr = so_bill
/*c1318*  and   cm_addr = so_cust */
no-error.
if not available cm_mstr
then do:
   pSuccess = true.
   return.
end.
find first ad_mstr no-lock
where ad_domain = global_domain
and   ad_addr = cm_addr
no-error.
if not available ad_mstr 
then do:
  pSuccess = true.
  return.
end.
/* vPOFormat = GetFieldValueChar("cm_mstr", "cm_po_format", oid_cm_mstr, yes). */
vPOFormat = GetFieldValueChar("ad_mstr", "ad_po_format", oid_ad_mstr, yes). 
vPOInput = pFieldValue.


pSuccess = chkformat(vPOInput, vPOFormat).

/* delete >>>
* if pSuccess then do:
*    find current so_mstr exclusive-lock no-error.
*    if available so_mstr 
*    then do:
*       so_po = vPOInput.
*    end.
*    release so_mstr.
* end.
* delete <<<<<<<<<<<< */


/*
if pFieldName <> "so__chr01"
then do:
   pSuccess = true.
   return.
end.
*/

if pSuccess = false then do:
   {us/bbi/pxmsg.i &MSGNUM=9004 &ERRORLEVEL=3}  
   return.
end.


/*c1318* start added code >>> */
vReturnValue = SetFieldValueChar ("so_mstr",
                                  "so_po_validation",
				  oid_so_mstr,
				  pFieldValue).
/*c1318* end   added code <<< */


case self:type:
  when "fill-in" then hdl1 = self:frame.
  when "frame" then hdl1 = self.
  otherwise hdl1 = ?.
end.
if hdl1 = ? then return.
hdl1 = hdl1:first-child.   /* ? = Field-group */
hdl1 = hdl1:first-child.   /* ? */
hdl1 = hdl1:next-sibling.  /* first-field */
hdl_loop:
repeat:
  if hdl1:name = "so_po"
  then do:
     hdl1:screen-value = vPOInput.
     leave hdl_loop.
  end.
  hdl1 = hdl1:next-sibling.
  if not valid-handle(hdl1)
  then do:
     return.
  end.
end.



/* removed ulab code >>>>>>>>>>>>>>>>>>>>>>>>>>
*  find first sod_det no-lock
*  where recid(sod_det) = pRecid
*  no-error.
*  if not available sod_det then return.
*  find first so_mstr no-lock
*  where so_domain = global_domain
*  and   so_nbr = sod_nbr
*  no-error.
*  if not available so_mstr then return.
*  
*  find first sod_det no-lock
*  where recid(sod_det) = pRecid
*  and   (pFieldValue = "yes"
*         or can-find(first code_mstr
*                     where code_domain = global_domain
*                     and code_fldname = "ulab"
*                     and code_value = so_cust))
*  no-error.
*  if available sod_Det
*  then do:
*      find first pt_mstr no-lock
*      where pt_domain = global_domain
*      and   pt_part = sod_part
*      no-error.
*      if not available pt_mstr
*      or not can-find(first code_mstr
*                      where code_domain = global_domain
*  		    and   code_fldname = "pending_inv_item_validation"
*  		    and   code_value = pt_part_type)
*      then pSuccess = false.
*  end.
*   removed ulab code   <<<<<<<<<<<<<<<<<<< */


/*c1318*  start added code >>> */
procedure updso.

find current so_mstr exclusive-lock no-error.
if available so_mstr 
then do:
    so_po = pfieldvalue.  
    release so_mstr.
end.
find first so_mstr no-lock
where recid(so_mstr) = precid
no-error.

end.
