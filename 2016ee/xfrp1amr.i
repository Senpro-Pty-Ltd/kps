/* xfrp1amr.i - Formtrap Include file Invoice Print                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

assign
   fsremarks = "UNITS" + string(sod_qty_item) + " x " + "PERIODS" +
               string(sod_qty_per) + " = " + "SHIPPED" + string(sod_qty_inv).

/*** SERVICE CONTRACT DETAILS - RECORD TYPE "O" ***/
put stream ft
   "O"         at 001   format   "x(01)"  /* TYPE "O" */
   fsremarks   at 002   format   "x(60)"  
skip.
