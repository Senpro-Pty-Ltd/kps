/* xfrp5amc.i STREAM DATA RECORD TYPE "C"                                     */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/16/10  ECO: *eb3sp5*   */

put stream ft
   "C"             at 1    format "x(1)"     /*RECORD TYPE*/
   sob_feature     at 2    format "x(12)"    /*FEATURE*/
   sob_part        at 14   format "x(18)"    /*ITEM NUMBER*/
   sob-qty         at 32   format "->>>>>>>>9.999999999" /*QUANTITY*/
   sob_um          at 52   format "x(2)"     /*UM*/
   sob_desc        at 54   format "x(24)"    /*ITEM DESC1*/
   sob_desc2       at 78   format "x(24)"    /*ITEM DESC2*/
.

{us/xf/xfso05uc.i}

put stream ft skip.
