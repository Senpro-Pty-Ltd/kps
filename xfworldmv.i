/* xfworldmv.i FORMTRAP Include file                                          */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

/* Operation Barcode */
put stream ft
   "V"      at 1    format "x"      /* record type V */
   wr_op    at 2    format "999999"     /* operation */
.

{us/xf/xfworluv.i}

put stream ft skip.
