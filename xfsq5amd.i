/* xfsq5amd.i - SALES QUOTE PRINT USER CODE RECORD TYPE "D"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/18/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

fillchar = fill(".", level).
put stream ft
   "D"                     at 1    format "x"
   sob_feature     at 2    format "x(12)"    /*Feature*/
   sob_part        at 14   format "x(18)"    /*Item Number*/
   qob-qty         at 32   format "->>>>>>>>9.999999999" /*Quantity*/
   qob_um          at 52   format "x(2)"     /*UM*/
   qob_desc        at 54   format "x(24)"    /*Item Desc1*/
   qob_desc2       at 78   format "x(24)"    /*Item Desc2*/
.

{us/xf/xfqo10ud.i}

put stream ft skip.
