/* xfsofm09mz.i FORMTRAP Shipper List Print              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */

put
   "Z"              at 1    /* record type "Z" */
   t_absr_reference at 2    /* reference */
   t_absr_qty       at 26   format "->>>>>>>>>>9.99999" /* pegged qty */
   sod_um           at 44   /* uom  */
.

{us/so/sofs9puz.i}

put skip.
