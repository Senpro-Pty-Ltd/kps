/* xfsofm09mf.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */


put 
   "F"               at 1   format "x(1)"          /*Record Type*/
   if available sob_det then 
      sob_feature 
   else ""           at 2   format "x(12)"         /*Feature*/
   if available sod_det then 
      sob_part  
   else sod_part     at 14  format "x(27)"         /*Item Part*/
   dqty              at 41  format "->>>>>>>>9.999999999" /*Qty*/
   if available pt_mstr then 
      pt_um
   else ""           at 61  format "x(2)"          /*UM*/
   if available pt_mstr then 
      pt_desc1
   else ""           at 63  format "x(24)"         /*Item Desc1*/
   if available pt_mstr then 
      pt_desc2
   else ""           at 87  format "x(24)"         /*Item Desc2*/
    .
{us/so/sofs9puf.i}

put skip.
