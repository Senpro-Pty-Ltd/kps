/* xfsofm09mn.i FORMTRAP Print              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/

put
   "N"             at 1    format "x"  /* type "2"   */
   absd_fld_seq    at 2    format ">>9"
   absd_fld_name   at 5    format "x(30)"
   absd_fld_value  at 35    format "x(30)"
.
put skip.
