/* xfrp1b09mc.i - Formtrap Include file Invoice Print                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "C"         at 001   format   "x(01)"                 /* TYPE "C" */
   sob_feature at 002   format   "x(12)"                 /* FEATURE */
   sob_part    at 014   format   "x(18)"                 /* ITEM NO  */
   sob-qty     at 032   format   "->>>>>>>>9.999999999"  /* QUANTITY */
   sob_um      at 052   format   "x(02)"                 /* UOM      */
   sob_desc    at 054   format   "x(24)"                 /* ITEM DESC 1*/
   sob_desc2   at 078   format   "x(24)"                 /* ITEM DESC 2*/
skip.
