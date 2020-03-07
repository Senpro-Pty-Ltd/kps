/* xfso05v.i FORMTRAP DEFINE VARIABLES FOR SO PRINT                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

/*Place all Formtrap required variables in this file                          */

define {1} shared variable shipto            as character format "x(38)" extent 6.
define {1} shared variable soldto            as character format "x(38)" extent 6.
define {1} shared variable billto            as character format "x(38)" extent 6.
define {1} shared variable company_city      like ad_city no-undo.
define {1} shared variable company_state     like ad_state no-undo.
define {1} shared variable company_zip       like ad_zip no-undo.
define {1} shared variable company_fax       as char format "x(16)".
define {1} shared variable tot_prepaid_amt   like so_prepaid.
define {1} shared variable billto_city       as char format "x(24)".
define {1} shared variable billto_state      as char format "x(4)".
define {1} shared variable billto_zip        as char format "x(10)".
define {1} shared variable billto_fax        as char format "x(16)".
define {1} shared variable billto_attn       as char format "x(16)".
define {1} shared variable billto_phn        as char format "x(16)".
define {1} shared variable shipto_city       as char format "x(24)".
define {1} shared variable shipto_state      as char format "x(4)".
define {1} shared variable shipto_zip        as char format "x(10)".
define {1} shared variable shipto_fax        as char format "x(16)".
define {1} shared variable shipto_attn       as char format "x(16)".
define {1} shared variable shipto_phn        as char format "x(16)".
define {1} shared variable soldto_city       as char format "x(24)".
define {1} shared variable soldto_state      as char format "x(4)".
define {1} shared variable soldto_zip        as char format "x(10)".
define {1} shared variable soldto_fax        as char format "x(16)".
define {1} shared variable soldto_attn       as char format "x(16)".
define {1} shared variable soldto_phn        as char format "x(16)".
define {1} shared variable v_tax_tr_type     like tx2d_tr_type no-undo.
