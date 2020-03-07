/* xfdetr9bms.i - FORMTRAP INCLUDE FILE INVOICE PRINT                        */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "S"         at 001   format   "x(01)"              /* Record Type S */
   typedesc    at 002   format   "x(24)"              /* Tax Type Description */
   taxdesc     at 026   format   "x(24)"              /* Tax Rate Description */
   taxclass    at 050   format   "x(03)"              /* Tax Class */
   taxusage    at 053   format   "x(08)"              /* Tax Usage */
   taxtotal    at 061   format   "->>>>>>>>>>>9.99"   /* Tax Amount */
   taxpercnt   at 077   format   "->>9.99"            /* Tax Rate */
   taxbase     at 084   format   "->>>>>>>>>>>9.99"   /* Taxable Sales */
   nontax      at 100   format   "->>>>>>>>>>>9.99"   /*Non-taxable Sales*/
skip.
