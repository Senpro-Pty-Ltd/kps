/* xfivrp9fmc.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

 /* OPTIONS/FEATURES - RECORD TYPE "C" */
put stream ft
   "C"         at 001   format   "x(01)"                 /* type "C" */
   ibh_feature at 002   format   "x(12)"                 /* feature */
   ibh_part    at 014   format   "x(18)"                 /* item no  */
   sob-qty     at 032   format   "->>>>>>>>9.999999999"  /* quantity */
   ibh_um      at 052   format   "x(02)"                 /* uom      */
   ibh_desc    at 054   format   "x(24)"                 /* item desc 1*/
   ibh_desc2   at 078   format   "x(24)"                 /* item desc 2*/
skip.
