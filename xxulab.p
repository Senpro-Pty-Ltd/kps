/* xxulab.p     - Template for user defined validations                  */
/* gpulab.p     - Template for user defined validations                  */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                 */
/* All rights reserved worldwide.  This is an unpublished work.          */
/*                                                                       */
/* $Id: */
/* CYB        LAST MODIFIED: 29-JUN-2011  BY: gbg *cy1046*               */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*                                                                       */
/* This is the template for user defined validations for configurable    */
/* screens.  When a validation program is made from this template it     */
/* should be compiled and placed in the propath.  It will be called      */
/* following the standard lang/module directory structure.  For example  */
/* if the program name is gpvalidate.p then it should reside in the      */
/* us/gp directory for English installations.                            */

{us/bbi/mfdeclre.i}

define input parameter pFieldName as character no-undo.
define input parameter pFieldValue as character no-undo.
define input parameter pTableName as character no-undo.
define input parameter pRecid as recid no-undo.
define output parameter pSuccess as logical no-undo.




/* Set default value for result */
pSuccess = true.

find first sod_det no-lock
where recid(sod_det) = pRecid
no-error.
if not available sod_det then return.
find first so_mstr no-lock
where so_domain = global_domain
and   so_nbr = sod_nbr
no-error.
if not available so_mstr then return.

find first sod_det no-lock
where recid(sod_det) = pRecid
and   (pFieldValue = "yes"
       or can-find(first code_mstr
                   where code_domain = global_domain
                   and code_fldname = "ulab"
                   and code_value = so_cust))
no-error.
if available sod_Det
then do:
    find first pt_mstr no-lock
    where pt_domain = global_domain
    and   pt_part = sod_part
    no-error.
    if not available pt_mstr
    or not can-find(first code_mstr
                    where code_domain = global_domain
		    and   code_fldname = "pending_inv_item_validation"
		    and   code_value = pt_part_type)
    then pSuccess = false.
end.

if pSuccess = false then do:
   {us/bbi/pxmsg.i &MSGNUM=9003 &ERRORLEVEL=3}  
end.

