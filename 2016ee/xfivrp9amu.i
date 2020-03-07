/* xfivrp9amu.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

/* SUMMARY BILLING - RECORD TYPE "U" */
put stream ft
   "U"                  at 001   format "x(01)"             /*type*/
   sfb-line-count       at 002   format ">>>9"
   fis_desc             at 006   format "x(24)"
   total-price          at 030   format "->>>>>>>>>>9.99999"
   total-billable       at 046   format "->>>>>>>>>>9.99999"
   (- total-covered)    at 064   format "->>>>>>>>>>9.99999"
   if total-exchange <> 0 then - total-exchange
   else 0               at 082   format "->>>>>>>>>>9.99999"
   tot_tax              at 100   format "->>>>>>>>>>>9.99"  /* tax amt */
   tot_ex_tax + tot_tax at 116   format "->>>>>>>>>>>9.99"  /*amt incl tax*/
   tot_ex_tax           at 132   format "->>>>>>>>>>>9.99"  /*amt excl tax*/
skip.
