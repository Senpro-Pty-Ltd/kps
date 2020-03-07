/* xfrvrpmc.i - PURCHASE ORDER RETURN PRINT USER CODE RECORD TYPE "C"         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/18/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "C"               at 1  format "x(1)"
   tr_serial         at 2  format "x(18)"
   lotserial_total   at 20 format "->>>>>>>>9.999999999"
   year(tr_expire)   at 40 format "9999"
   month(tr_expire)  at 44 format "99"
   day(tr_expire)    at 46 format "99"
.
{us/xf/xfpo03uc.i}
put stream ft skip.
