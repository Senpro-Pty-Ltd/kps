/* xxpomsk01.p    - Template for user defined validations                */
/* xxpomsk.p    - Template for user defined validations                  */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                 */
/* All rights reserved worldwide.  This is an unpublished work.          */
/*                                                                       */
/* $Id: */
/* CYB        LAST MODIFIED: 01-DEC-2011  BY: gbg *c1264*                */
/* CYB        LAST MODIFIED: 27-JUL-2012  BY: gbg *c1318*                */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                LAST MODIFIED: 08-MAY-2013 BY: gbg *c1402*           */
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

define input parameter pFieldValue as character no-undo.
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

vPOFormat = GetFieldValueChar("ad_mstr", "ad_po_format", oid_ad_mstr, yes). 
vPOInput = pFieldValue.


pSuccess = chkformat(vPOInput, vPOFormat).

