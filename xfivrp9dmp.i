/* xfivrp9dmp.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: eB3SP5    BY: sxh         DATE: 14/01/16  ECO: *grc338*   */
/*V8:ConvertMode=Report                                                       */

/* LOT/SERIAL - RECORD TYPE "P" */
put stream ft
   "P"                     at 001   format   "x(01)"  /* type "p" */
   t_tr_serial             at 002   format   "x(18)"  /* lot/serial */
   lotserial_total         at 020   format   "->>>>>>>>9.999999999". /* quantity */

if t_tr_expire <> ? then
   put stream ft
      year(t_tr_expire)    at 040   format   "9999"   /* expire date*/
      month(t_tr_expire)   at 044   format   "99"
      day(t_tr_expire)     at 046   format   "99".

put stream ft
   t_tr_ref                at 048   format   "x(08)"  /* reference*/
skip.

/*added grc338*/
  for each tt_item_serials no-lock:
  put stream ft
    "P"                     at 001   format   "x(01)"  /* type "p" */
   tt_serial_id             at 048   format   "x(40)"  /* lot/serial */
   skip.
  end.

