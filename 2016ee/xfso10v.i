/* xfso10v.i FORMTRAP DEFINE VARIABLES FOR INVOICE PRINT                      */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong      DATE: 25/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

/*** PLACE ALL FORMTRAP REQUIRED VARIABLES IN THIS FILE                     ***/

define {1} shared variable shipto            as   character format "x(38)" extent 6.
define {1} shared variable company_city      like ad_city no-undo.
define {1} shared variable company_state     like ad_state no-undo.
define {1} shared variable company_zip       like ad_zip no-undo.
define {1} shared variable company_fax       like ad_fax.
/*93sp12.1
define {1} shared variable tot_prepaid_amt   like so_prepaid.
*/
define {1} shared variable billto_city       as   character format "x(24)".
define {1} shared variable billto_state      like ad_state.
define {1} shared variable billto_zip        like ad_zip.
define {1} shared variable billto_fax        like ad_fax.
define {1} shared variable billto_attn       like ad_attn.
define {1} shared variable billto_phn        like ad_phone.
define {1} shared variable shipto_city       as   character format "x(24)".
define {1} shared variable shipto_state      like ad_state.
define {1} shared variable shipto_zip        like ad_zip.
define {1} shared variable shipto_fax        like ad_fax.
define {1} shared variable shipto_attn       like ad_attn.
define {1} shared variable shipto_phn        like ad_phone.
define {1} shared variable soldto_city       as   character format "x(24)".
define {1} shared variable soldto_state      like ad_state.
define {1} shared variable soldto_zip        like ad_zip.
define {1} shared variable soldto_fax        like ad_fax.
define {1} shared variable soldto_attn       like ad_attn.
define {1} shared variable soldto_phn        like ad_phone.
