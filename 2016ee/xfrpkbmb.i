/* xfrpkbmb.i - FORMTRAP INCLUDE FILE SO PICKLIST PRINT                       */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

if sod_due_date <> ? then
   plform_due = string(year(sod_due_date),"9999") +
                string(month(sod_due_date),"99") +
                string(day(sod_due_date),"99").
else plform_due = "".

qty_open = 0.

if desc2 <> "" then
   put  stream ft "B"       at 1   format "x(1)".     /*RECORD TYPE*/
else
   put  stream ft "E"       at 1   format "x(1)".     /*RECORD TYPE*/

put stream ft
   sod_line       at 2   format ">>9"       /*LINE NUMBER*/
   sod_part       at 5   format "x(18)"     /*ITEM NUMBER*/
   sod_type       at 23  format "x(1)"      /*TYPE*/
   sod_site       at 24  format "x(8)"      /*SITE*/
   qty_open       at 32  format "->>>>>>>>9.999999999" /*QTY OPEN*/
   sod_um         at 52  format "x(2)"      /*UM*/
   plform_due     at 54 format "x(8)"       /*DUE DATE*/
   sod_custpart   at 62  format "x(30)"     /*CUST ITEM NO*/
   desc1          at 92  format "x(24)"     /*ITEM DESC1*/
.

if desc2 <> ""
then do:
   put stream ft desc2       at 116 format "x(24)".    /*ITEM DESC2*/
   {us/xf/xfsopkub.i}
end.
else do:
   {us/xf/xfsopkue.i}
end.
put stream ft skip.
