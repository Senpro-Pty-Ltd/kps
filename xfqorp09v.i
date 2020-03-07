/* xfqorp09v.i - SALES QUOTE PRINT INCLCUDE FILE                              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/18/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */
  
define {1} shared variable billto_city as character format "x(24)".
define {1} shared variable billto_state as character format "x(4)".
define {1} shared variable billto_zip as character format "x(10)".
define {1} shared variable billto_fax as character format "x(16)".
define {1} shared variable shipto_city as character format "x(24)".
define {1} shared variable shipto_state as character format "x(4)".
define {1} shared variable shipto_zip as character format "x(10)".
define {1} shared variable shipto_fax as character format "x(16)".
define {1} shared variable company_city like ad_city no-undo.
define {1} shared variable company_state like ad_state no-undo.
define {1} shared variable company_zip like ad_zip no-undo.
define {1} shared variable company_fax as char format "x(16)".
