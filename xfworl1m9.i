/* xfworl1m9.i - PRINT WORK ORDER USER CODE RECORD TYPE "9"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */
         
put stream ft
   "9"        at 1        format "x(1)"      /* Record type */
.

{us/xf/xfworlu9.i}

put stream ft skip.
