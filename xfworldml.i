/* xfworldml.i FORMTRAP Include file                                          */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "L"               at 1     format "x(1)"    /* Record Type */
   wr_op             at 2     format "999999"  /* Operation */
   wr_ctr_mch        at 8     format "x(8)"    /* Work centre */
   wr_std_op         at 16    format "x(8)"    /* Standard operation */
   wr_tool           at 24    format "x(8)"    /* Tool code */
   wr_setup          at 32    format "->>>>>>>>9.999999999"
                 /* Setup time */
   wc_description    at 52    format "x(24)"   /* Description */
   wr_vend           at 76    format "x(8)"    /* Supplier */
   wr_run * wr_qty_ord at 84    format "->>>>>>>>9.999999999"
                   /* run time */
   wr_desc           at 104   format "x(24)"   /* Description */
.

{us/xf/xfworlul.i}

put stream ft  skip.
