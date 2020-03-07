/* xfrp0509mw.i STREAM DATA RECORD TYPE "W"                                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft 
   "W"            at 1    format "x(1)"      /*Record Type*/
   trl_desc       at 2    format "x(32)"
   ext_line_charge at 34    format "->>>>>>>>>>9.99"
.
