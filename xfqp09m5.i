/* xfqp09m5.i - SALES QUOTE PRINT USER CODE RECORD TYPE "5"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/18/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */
         
put stream ft 
   "5" at 1 format "x(1)"
   ext_price_total at 137 format "->>>>>>>>>>>9.99"
.
