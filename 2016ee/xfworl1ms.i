/* xfworl1ms.i - PRINT WORK ORDER USER CODE RECORD TYPE "S"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "S"           at 1     format "x(1)"   /* Record type */
   l_msgdesc.

{us/xf/xfworlus.i} /* USER CODE - RECORD "S" */

put stream ft skip.
