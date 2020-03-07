/* xfivrp9amob.i - FORMTRAP INCLUDE FILE INVOICE PRINT                        */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

/* SERVICE CONTRACT/PO DETAIL - RECORD TYPE "O" */
put stream ft
   "O"                     at 001   format   "x(01)"
   if idh_sched then "Purchase Order" {&soivrp1a_p_14}  
   else "Service Contract" at 002   format   "x(18)"
   idh_contr_id            at 020   format   "x(30)"
skip.
