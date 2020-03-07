/* xfivrp9amk.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

/* REPAIR BILLING DETAIL HEADER - RECORD TYPE "K" */
put stream ft
   "K"            at 001   format   "x(01)"  /* type K" */
   sfh_fis_sort   at 002   format   "x(18)"  /* type    */
skip.
