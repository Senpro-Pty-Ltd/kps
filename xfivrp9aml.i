/* xfivrp9aml.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

/* REPAIR BILLING DETAIL - RECORD TYPE "L" */
put stream ft
   "L"                  at 001   format   "x(01)"              /* type "L" */
   sfh_line             at 002   format   ">>>9"               /* line no */
   sfh_desc             at 006   format   "x(24)"              /* desc     */
   sfh_qty_req          at 030   format   "->>>>>>9.999999"    /* qty req'd */
   if display-price then sfh_price
   else 0               at 045   format   "->>>>>>>>>>9.99999" /* list price*/
   if display-price then billable-amt
   else 0               at 063   format   "->>>>>>>>>>9.99999" /* billable */
   if display-price then - sfh_covered_amt
   else 0               at 081   format   "->>>>>>>>>>9.99999"
   sfh_fcg_code         at 099   format   "x(08)"              /* charge code*/
   sfh_part             at 107   format   "x(18)"              /* item      */
   sfh_fsc_code         at 125   format   "x(08)"              /* service cat*/
   sfh_pt_type          at 133   format   ">>9"                /* part type  */
   tot_tax              at 136   format   "->>>>>>>>>>>9.99"   /* tax amt */
   tot_ex_tax + tot_tax at 152   format   "->>>>>>>>>>>9.99"   /*amt incl tax*/
   tot_ex_tax           at 168   format   "->>>>>>>>>>>9.99"   /*amt excl tax*/
skip.
