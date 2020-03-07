/* xxfworlbmf.i - PRINT WORK ORDER USER CODE RECORD TYPE "F"                  */
/* xfworlbmf.i - PRINT WORK ORDER USER CODE RECORD TYPE "F"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/* CYB   LAST MODIFIED: 01-MAY-2013    BY: gbg *c1397*                        */
/******************************************************************************/
/*V8:ConvertMode=Report                                                       */
/******************************************************************************/

put stream ft
   "F"               at 1     format "x(1)"    /* Record Type */
   wod_part          at 2     format "x(18)"   /* Work order part */
   com_rev           at 20    format "x(4)"    /* Revision */
   wod_site          at 24    format "x(8)"    /* Site */
   max(wod_qty_req - wod_qty_iss,0)
                     at 32    format "->>>>>>>>9.999999999"  /* qty */
   um                at 52    format "x(2)"    /* UM */
   description       at 54    format "x(48)"   /* Item Desc1 + 2 */
   ptdraw            at 102   format "x(18)"   /* Part draw */
.

/*c1397*/ {us/xx/xxfworluf.i}
{us/xf/xfworluf.i}      /* user code - record type "F" */

put stream ft skip.      
