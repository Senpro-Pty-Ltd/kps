/* xfrp1amp.i - Formtrap Include file Invoice Print                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "O"                     at 001   format   "x(01)"
   if sod_sched then "PURCHASE_ORDER"
   else "SERVICE_CONTRACT" at 002   format   "x(18)"
   sod_contr_id            at 020   format   "x(30)"
skip.
