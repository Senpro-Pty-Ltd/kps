/* xfrpkbmha.i - FORMTRAP INCLUDE FILE SO PICKLIST PRINT                      */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft 
   "H"       at 1    format "x"  /* REC TYPE */
   qty_open      at 2    format "->>>>>>>>9.999999999"
   year(schd_date) at 22   format "9999"
   month(schd_date) at 26   format "99"
   day(schd_date) at 28   format "99"
.

{us/xf/xfsopkuh.i}

put stream ft skip.
