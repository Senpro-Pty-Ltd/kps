/* xfsofm09ml.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/* CYB       QAD2016EE    BY: nac               DATE: 28AUG18   ECO: *k10017tsk1139* */

put
   "L"                      at 1 format "x(1)"   /*RECORD TYPE K */
   work_abs_mstr.abs_lotser at 2  format "x(18)" /* Lot/Serial   */
   work_abs_mstr.abs_qty    at 22 format "->>>>>>9.9<<<<<<"
   year(l_ld_expire)        at 36 format "9999"  /* Expiry Year  */
   month(l_ld_expire)       at 40 format "99"    /* Expiry Month */
   day(l_ld_expire)         at 42 format "99"    /* Expiry Day   */
   work_abs_mstr.abs_ref    at 44 format "x(8)"  /* Reference    */
.

{us/so/sofs9pul.i}

put skip.
