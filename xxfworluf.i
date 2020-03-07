/* xxfworluf.i - PRINT WORK ORDER USER CODE RECORD TYPE "F"                   */
/* xfworluf.i - PRINT WORK ORDER USER CODE RECORD TYPE "F"                    */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* CYB   LAST MODIFIED: 01-MAY-2013    BY: gbg *c1397*                        */
/* CYB  LAST MODIFIED: 2014-JUL-22    BY: gbg *c1478*                         */
/*V8:ConvertMode=Report                                                       */

/* start of new code >> */
/*c1397* start added code */
   put stream ft unformatted
   string(wod_op, ">>>>>>") at 200.
/*c1397* end   added code */



/* end of new code << */
