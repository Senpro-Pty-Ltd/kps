/* xfrp1amm.i - Formtrap Include file Invoice Print                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "M"                  at 001   format   "x(01)"              /* TYPE "M" */
   sfb_line             at 002   format   ">>>9"               /* LINE NO */
   sfb_desc             at 006   format   "x(24)"              /* DESC     */
   (- sfb_qty_ret)      at 030   format   "->>>>>>9.999999"    /* QTY RETURN*/
   if sfb_exchange then - sfb_exg_price
   else 0               at 045   format   "->>>>>>>>>>9.99999" /* LIST PRICE*/
   if sfb_exchange then - sfb_exg_price
   else 0               at 063   format   "->>>>>>>>>>9.99999" /* BILLABLE */
   if sfb_exchange then "EXCHANGE"
   else "RETURN"        at 081   format   "x(08)"
   sfb_part             at 089   format   "x(08)"              /* ITEM */
   tot_tax              at 107   format   "->>>>>>>>>>>9.99"   /* TAX AMT */
   tot_ex_tax + tot_tax at 123   format   "->>>>>>>>>>>9.99"   /*AMT INCL TAX*/
   tot_ex_tax           at 139   format   "->>>>>>>>>>>9.99"   /*AMT EXCL TAX*/
skip.
