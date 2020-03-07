/* xfsopkv.i - FORMTRAP INCLUDE FILE SO PICKLIST PRINT                        */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

define {1} shared variable company_city  as char format "x(24)".
define {1} shared variable company_state as char format "x(4)".
define {1} shared variable company_zip   as char format "x(10)".
define {1} shared variable company_fax   as char format "x(16)".
define {1} shared variable abn like ad_pst_id .     
define {1} shared variable plform_due as char format "x(8)".
define {1} shared variable billattn as char format "x(24)".
define {1} shared variable billphn as char format "x(16)".
define {1} shared variable billto_city as char format "x(24)".
define {1} shared variable billto_state as char format "x(4)".
define {1} shared variable billto_zip as char format "x(10)".
define {1} shared variable billto_attn as char format "x(24)".
define {1} shared variable billto_phn as char format "x(16)".
define {1} shared variable billto_fax   as char format "x(16)".
define {1} shared variable shipto_city as char format "x(24)".
define {1} shared variable shipto_state as char format "x(4)".
define {1} shared variable shipto_zip as char format "x(10)".
define {1} shared variable shipattn as char format "x(24)".
define {1} shared variable shipphn as char format "x(16)".
define {1} shared variable shipto_fax   as char format "x(16)".
define {1} shared variable soldto as character format "x(38)" extent 6.
define {1} shared variable soldto_city as char format "x(24)".
define {1} shared variable soldto_state as char format "x(4)".
define {1} shared variable soldto_zip as char format "x(4)".
define {1} shared variable soldattn as char format "x(24)".
define {1} shared variable soldphn as char format "x(16)".
define {1} shared variable msg as char format "x(64)".
define {1} shared variable pl_expire as char format "x(8)".
