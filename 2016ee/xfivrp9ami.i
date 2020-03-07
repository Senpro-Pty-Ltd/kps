/* xfivrp9ami.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "I"            at 001   format   "x(01)"              /* type "I" */
   restock_pct    at 002   format   "->>9.99"            /* percent  */
   restock_amt    at 009   format   ">>>>>9.99999"       /* amount   */
   restock_prc    at 021   format   ">>>>>>>>>>>9.99999" /* price    */
skip.
