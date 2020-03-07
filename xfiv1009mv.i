/* xfiv1009mv.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 11/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

/* END OF HEADER, START OF LINE ITEMS RECORD */
put stream ft
   "V"   at 001   format "x(01)"
.

{us/xf/xfiv10uv.i} /*BLANK TEMPLATE*/

put stream ft skip.
