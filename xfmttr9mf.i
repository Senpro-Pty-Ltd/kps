/* xfmttr9mf.i    FORMTRAP INCLUDE FILE PO PRINT                              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "F"               at 001   format   "x(01)"              /* Record type F */
.

{us/xf/xfpo03uf.i}

put stream ft skip.

put stream ft
   "5"               at 001   format   "x(01)"              /* Record type 5 */
   msg               at 002   format   "x(60)"              /* Message */
   nontaxable_amt    at 062   format   "->>>>>>>>>>>9.99"   /* Non-taxable */
   po_curr           at 078   format   "x(03)"              /* Currency */
   lines_total       at 081   format   "->>>>>>>>>>>9.99"   /* Line Total */
   taxable_amt       at 097   format   "->>>>>>>>>>>9.99"   /* Taxable Amount */
   tax_total         at 113   format   "->>>>>>>>>>>9.99"   /* Total Tax */
   year(tax_date)    at 129   format   "9999"               /* Tax Date Year */
   month(tax_date)   at 133   format   "99"                 /* Tax Date Month */
   day(tax_date)     at 135   format   "99"                 /* Tax Date Day */
   order_amt         at 137   format   "->>>>>>>>>>>9.99"   /* Total */
   po_prepaid        at 153   format   "->>>>>>>>>>>9.99"   /* Prepaid Amount */
.

{us/xf/xfpo03u5.i}

put stream ft skip.
