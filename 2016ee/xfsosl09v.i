/* xfsosl09v.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE               */

define variable billto as character format "x(38)" extent 6 no-undo.
define variable shipto_city as char format "x(24)".
define variable shipto_state as char format "x(4)".
define variable shipto_zip as char format "x(10)".
define variable shipto_fax as char format "x(16)".
define variable shipattn as char format "x(24)".
define variable shipphn as char format "x(16)".
define variable billto_city as char format "x(24)".
define variable billto_state as char format "x(4)".
define variable billto_zip as char format "x(10)".
define variable billto_fax as char format 'x(16)'. 
define variable plform_date as character format "x(8)".
define variable plform2_date as character format "x(8)".
define variable pcs_date   as character format "x(8)".
define variable tmp_charfld1 as char format "x(8)".
define variable tmp_charfld2 as char format "x(8)".
define variable tmp_charfld3 as char format "x(8)".
define variable tmp_charfld4 as char format "x(8)".
define variable tmp_charfld5 as char format "x(8)".
define variable tmp_decfld1 as decimal.
define variable tmp_decfld2 as decimal.
define variable pre_shipid like abs_id.
define variable fr_class like pt_fr_class.
define buffer b_qad_wkfl for qad_wkfl.    
