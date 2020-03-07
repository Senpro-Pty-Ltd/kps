/* xfrp10mv.i - FORMTRAP INCLUDE FILE INVOICE PRINT                             */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "V"   at 1  format "x(01)"
.

{us/xf/xfso10uv.i} /*BLANK TEMPLATE*/

put stream ft skip.
