/* xfsofm09mk.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/
/* Revision: QAD2012.1    BY: Steve Hong     DATE: 24/10/12  ECO: *93sp12.1  */
/* Revision: QAD2015EE    BY: Steve Hong     DATE: 13/01/16  ECO: *grc833.1  */

put
   "K"                      at 1 format "x(1)"   /*RECORD TYPE K */
   ttInvGroupByLotAndRef.lotser at 2  format "x(18)" /* Lot/Serial   */
   ttInvGroupByLotAndRef.qty    at 22 format "->>>>>>9.9<<<<<<"
   year(ttInvGroupByLotAndRef.expireDate) at 36 format "9999"  /* Expiry Year  */
   month(ttInvGroupByLotAndRef.expireDate)   at 40 format "99"    /* Expiry Month */
   day(ttInvGroupByLotAndRef.expireDate)    at 42 format "99"    /* Expiry Day   */
   ttInvGroupByLotAndRef.ref   at 44 format "x(8)"  /* Reference    */
.

{us/so/sofs9puk.i}

put skip.
