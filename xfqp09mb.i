/* xfqp09mb.i - SALES QUOTE PRINT USER CODE RECORD TYPE "B"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/18/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 13/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

{us/bbi/gprun.i ""xftxtots.p"" "(
   input ""10"",
   input qo_nbr,/* tx2d_ref */
   "" "", /*tx2d_nbr*/
   input qod_line,
   input """", /* tx2d_trl */
   output tot_tax,
   output tot_ex_tax)"}

put stream ft 
   "B"                  at 1    format "x"              /* type "B" */
   qod_line             at 2    format ">>9"            /* line number*/
   qod_part             at 5    format "x(18)"          /* item number*/
   qod_qty_quot         at 23   format "->>>>>>9.9<<"   /* Qty */
   qod_rel_chg          at 35   format "->>>>>>9.9<<"   /* Release */
   qod_um               at 47   format "x(2)"           /* UM */
   qod_price            at 49   format "->>>>>>9.99<<"  /* Price */
   ext_price            at 62   format "->>>>>>>>>9.99" /* Ext Price */
   qod_custpart         at 76   format "x(30)"          /* Cust Part */
   desc1                at 106  format "x(24)"          /* Part Desc */
   desc2                at 130  format "x(24)"          /* Part Desc */
   tot_tax              at 155  format "->>>>>>>>9.99"  /* Tot Tax */
   (tot_tax + tot_ex_tax) at 170  format "->>>>>>>>9.99"  /* Total */
   tot_ex_tax           at 185  format "->>>>>>>>9.99"  /* Tot ex Tax */
.

{us/xf/xfqo10ub.i}
