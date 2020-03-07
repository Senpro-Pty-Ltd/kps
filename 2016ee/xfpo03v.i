/* xfpo03v.i FORMTRAP Include file                                            */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

define {1} shared variable billto_city       as   character format "x(24)".
define {1} shared variable billto_state      like  ad_state.
define {1} shared variable billto_zip        like  ad_zip.
define {1} shared variable billto_fax        like  ad_fax.
define {1} shared variable vendor_city       as    character format "x(24)".
define {1} shared variable vendor_state      like  ad_state.
define {1} shared variable vendor_zip        like  ad_zip.
define {1} shared variable vendor_phone      like  ad_phone.
define {1} shared variable vendor_fax        like  ad_fax.
define {1} shared variable shipto_city       as    character format "x(24)".
define {1} shared variable shipto_state      like  ad_state.
define {1} shared variable shipto_zip        like  ad_zip.
define {1} shared variable shipto_fax        like  ad_fax.
define {1} shared variable order_tax_total   like  tx2d_cur_tax_amt no-undo.
define {1} shared variable poform_due        as    character format "x(28)".
