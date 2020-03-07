/* xfivrp9amj.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

/* REPAIR ORDER LINE - RECORD TYPE "J" */
put stream ft
   "J"            at 001   format   "x(01)"  /* type "J" */
   work-code      at 002   format   "x(08)"  /* work code */
   if available fwk_mstr then fwk_desc
   else ""        at 010   format   "x(24)"  /* work desc */
   if available sv_mstr then sv_code
   else ""        at 034   format   "x(08)"  /*service type*/
   if available sv_mstr then sv_desc
   else ""        at 042   format   "x(25)"  /*service desc*/
skip.
