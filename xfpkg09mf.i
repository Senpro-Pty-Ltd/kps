/* xfpkg09mf.i - FORMTRAP INCLUDE FILE SO PICKLIST PRINT                      */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "F"         at 1   format "x(1)"          /*Record Type*/
   sob_feature at 2   format "x(12)"         /*Feature*/
   fillchar + sob_part at 14  format "x(27)"         /*Item Part*/
   sob-qty     at 41  format "->>>>>>>>9.999999999" /*Qty*/
   sob_um      at 61  format "x(2)"          /*UM*/
   sob_desc    at 63  format "x(24)"         /*Item Desc1*/
   sob_desc2   at 87  format "x(24)"         /*Item Desc2*/
.

put stream ft skip.
