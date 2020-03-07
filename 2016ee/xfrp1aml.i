/* xfrp1aml.i - Formtrap Include file Invoice Print                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "L"                  at 001   format "x(01)"                /* TYPE "L" */
   sfb_line             at 002   format ">>>9"                 /* LINE NO */
   sfb_desc             at 006   format "x(24)"                /* DESC     */
   sfb_qty_req          at 030   format "->>>>>>9.999999"      /* QTY REQ'D */
   if display-price then sfb_price
   else 0               at 045   format "->>>>>>>>>>9.99999"   /* LIST PRICE*/
   if display-price then billable-amt
   else 0               at 063   format "->>>>>>>>>>9.99999"   /* BILLABLE */
   if display-price then - sfb_covered_amt
   else 0               at 081   format "->>>>>>>>>>9.99999"
   sfb_fcg_code         at 099   format "x(08)"                /* CHARGE CODE*/
   sfb_part             at 107   format "x(18)"                /* ITEM      */
   sfb_fsc_code         at 125   format "x(08)"                /* SERVICE CAT*/
   sfb_pt_type          at 133   format ">>9"                  /* PART TYPE  */
   tot_tax              at 136   format "->>>>>>>>>>>9.99"     /* TAX AMT */
   tot_ex_tax + tot_tax at 152   format "->>>>>>>>>>>9.99"     /*amt incl tax*/
   tot_ex_tax           at 168   format "->>>>>>>>>>>9.99"     /*AMTEXCLTAX*/
skip.
