/* xfworlbmj.i - PRINT WORK ORDER USER CODE RECORD TYPE "J"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "J"               at 1     format "x(1)"    /* Record Type */
   "********"        at 2     format "x(10)"
   wod_qty_all - accum total (lad_qty_all) at 37    format "->>>>>>>>9.999999999" /* qty*/
   "********"        at 57    format "x(10)"
.

{us/xf/xfworluj.i}

put stream ft skip.
