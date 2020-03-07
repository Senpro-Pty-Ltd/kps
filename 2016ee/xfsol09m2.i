/* xfsol09m2.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE                */
/*****************************************************************************/

if break_order then 
  put stream ft  "2"      at 1    format "x(1)". /*Record Type 2*/
else
  put stream ft  "C"                at 1        format "x(1)". /*Record Type C*/

put stream ft  so_nbr      at 2    format "x(8)" /* Sales Order Number*/
             year(so_ord_date)   at 10   format "9999"   /* order date */
             month(so_ord_date)  at 14   format "99"
             day(so_ord_date)    at 16   format "99"
             so_ship_po          at 18   format "x(22)" /* Ship To PO */
             .

         {us/xf/xfsolu2.i}

         put stream ft  skip.
