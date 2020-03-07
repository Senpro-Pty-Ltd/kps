/* xfsol09mb.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE                */
/*****************************************************************************/

 if sod_due_date <> ? then
         plform_date = string(year(sod_due_date),"9999") +
                       string(month(sod_due_date),"99") +
                       string(day(sod_due_date),"99").
      else
         plform_date = "".
      if desc2 <> "" then do:
         put stream ft  "B"          at 1   format "x(1)"       /*Record Type*/
             sod_line     at 2   format ">>9"        /*Line Number*/
             sod_part     at 5   format "x(18)"      /*Item Number*/
             sod_type     at 23  format "x(1)"       /*Type*/
             sod_site     at 24  format "x(8)"       /*Site*/
             sod_qty_ord  at 32  format "->>>>>>>>9.999999999" /*Qty ord*/
             sod_um       at 52  format "x(2)"       /*UM*/
             plform_date  at 54  format "x(8)"       /*Due Date*/
             sod_custpart at 62  format "x(30)"      /*Cust Item No*/
             desc1        at 92  format "x(24)"      /*Item Desc1*/
             desc2        at 116 format "x(24)"      /*Item Desc2*/
             rev          at 140 format "x(4)"       /* Revision */
             sod_qty_ship at 144 format "->>>>>>>>9.999999999" /*Qty Ship*/
             sod_custref at 164  format "x(30)"     /*Cust ref */
             sod_modelyr at 164  format "x(4)"     /*Cust ref */
             .

         {us/xf/xfsolub.i}

         put stream ft  skip.
      end.
      else do:
         put stream ft  "E"          at 1   format "x(1)"       /*Record Type*/
             sod_line     at 2   format ">>9"        /*Line Number*/
             sod_part     at 5   format "x(18)"      /*Item Number*/
             sod_type     at 23  format "x(1)"       /*Type*/
             sod_site     at 24  format "x(8)"       /*Site*/
             sod_qty_ord  at 32  format "->>>>>>>>9.999999999" /*Qty ord*/
             sod_um       at 52  format "x(2)"       /*UM*/
             plform_date  at 54  format "x(8)"       /*Due Date*/
             sod_custpart at 62  format "x(30)"      /*Cust Item No*/
             desc1        at 92  format "x(24)"      /*Item Desc1*/
             rev          at 116 format "x(4)"       /* Revision */
             sod_qty_ship at 120 format "->>>>>>>>9.999999999" /*Qty Ship*/
             sod_custref at 164  format "x(30)"     /*Cust ref */
             sod_modelyr at 164  format "x(4)"     /*Cust ref */
             .

         {us/xf/xfsolue.i}

         put stream ft  skip.
      end.
