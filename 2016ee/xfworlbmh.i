/* xfworlbmh.i - PRINT WORK ORDER USER CODE RECORD TYPE "H"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */
           
put stream ft
   "H"               at 1     format "x(1)"    /* Record Type */
   lad_loc           at 2     format "x(8)"    /* Location */
   lad_lot           at 10    format "x(18)"   /* Lot */
   lad_ref           at 28    format "x(18)"   /*Reference*/	  
.

if available ld_det and ld_expire <> ? then
   put stream ft 
	   year(ld_expire)  at 46   format "9999"    /*Expire Date year*/
      month(ld_expire) at 50   format "99"      /*Expire Date month*/
      day(ld_expire)   at 52   format "99"      /*Expire Date Day*/
   .

put stream ft qtyall  at 54   format "->>>>>>>>9.999999999" /*qty*/
.
