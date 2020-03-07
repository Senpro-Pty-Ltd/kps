/* xfpke09mc.i - FORMTRAP INCLUDE FILE SO PICKLIST PRINT                      */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

if ld_expire <> ? then
   pl_expire = string(year(ld_expire),"9999") +
               string(month(ld_expire),"99") +
               string(day(ld_expire),"99").
else
   pl_expire = "".

put stream ft
   "C"  at 1   format "x(1)"       /*Record Type*/
   lad_loc    at 2   format "x(8)"       /*Location*/
   lad_lot    at 10  format "x(18)"      /*Lot/Serial*/
   lad_ref    at 28  format "x(18)"      /*Reference*/
   pl_expire  at 46  format "x(8)"       /*Expire Date*/
   qty_all / sod_um_conv at 54  format "->>>>>>>>9.999999999" /*Qty Alloc*/
   msg   at 74  format "x(64)"  /*Message*/
.

{us/xf/xfsopkuc.i}
put stream ft skip.
