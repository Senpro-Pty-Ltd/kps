/* xfpkb09mb.i - FORMTRAP INCLUDE FILE SO PICKLIST PRINT                      */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/16/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

if sod_due_date <> ? then
   plform_due = string(year(sod_due_date),"9999") +
                string(month(sod_due_date),"99") +
                string(day(sod_due_date),"99").
else
   plform_due = "".

if desc2 <> ""
then do:
   put stream ft
      "B"      at 1   format "x(1)"       /*Record Type*/
      sod_line at 2   format ">>9"        /*Line Number*/
      sod_part at 5   format "x(18)"      /*Item Number*/
      sod_type at 23  format "x(1)"       /*Type*/
      sod_site at 24  format "x(8)"       /*Site*/
      if sod_type <> "" then sod_qty_all
      else qty_open  at 32  format "->>>>>>>>9.999999999" /*Qty Open*/
      sod_um   at 52  format "x(2)"       /*UM*/
      plform_due   at 54 format "x(8)"       /*Due Date*/
      sod_custpart at 62  format "x(30)"      /*Cust Item No*/
      desc1    at 92  format "x(24)"      /*Item Desc1*/
      desc2    at 116 format "x(24)"      /*Item Desc2*/
   .
   {us/xf/xfsopkub.i}

   put stream ft skip.
end.
else do:
   put stream ft
      "E"      at 1   format "x(1)"       /*Record Type*/
      sod_line at 2   format ">>9"        /*Line Number*/
      sod_part at 5   format "x(18)"      /*Item Number*/
      sod_type at 23  format "x(1)"       /*Type*/
      sod_site at 24  format "x(8)"       /*Site*/
      if sod_type <> "" then  sod_qty_all
      else qty_open  at 32  format "->>>>>>>>9.999999999" /*Qty Open*/
      sod_um   at 52  format "x(2)"       /*UM*/
      plform_due   at 54 format "x(8)"       /*Due Date*/
      sod_custpart at 62  format "x(30)"      /*Cust Item No*/
      desc1    at 92  format "x(24)"      /*Item Desc1*/
   .

   {us/xf/xfsopkue.i}
   put stream ft skip.
end.
