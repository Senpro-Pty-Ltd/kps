/* xfsofm09v.i FORMTRAP Shipper List Print                                  */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5    BY: Prasannan S      DATE: 17/09/10  ECO: *eb3sp5*   */

define variable soldto     as char format "x(38)" extent 6 no-undo.
define variable company_city   like ad_city no-undo.
define variable company_state  like ad_state no-undo.
define variable company_zip    like ad_zip no-undo.
define variable company_fax as character format "x(16)".
define variable company_phn as char format "x(16)".
define variable company_attn    as char format "x(24)".
define variable billto_city    like ad_city no-undo.
define variable billto_state   like ad_state no-undo.
define variable billto_zip like ad_zip no-undo.
define variable billto_fax as character format "x(16)".
define variable billto_attn    as char format "x(24)".
define variable billto_phn as char format "x(16)".
define variable soldto_city    like ad_city no-undo.
define variable soldto_state   like ad_state no-undo.
define variable soldto_zip like ad_zip no-undo.
define variable shipto_city    like ad_city no-undo.
define variable shipto_state   like ad_state no-undo.
define variable shipto_zip like ad_zip no-undo.
define variable shipto_fax like ad_fax no-undo.
define variable shipto_attn    as char format "x(24)".
define variable shipto_phn as char format "x(16)".
define variable abn like ad_pst_id no-undo.
