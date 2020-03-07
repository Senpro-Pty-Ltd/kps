/* xfrp109cmt.i - Formtrap Include file Invoice Print                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "T"            at 001   format   "x(01)"  /* type "T"       */
   if first-of(somstr2.so_nbr) then "Order:"
   else ""        at 002   format   "x(06)"  /* literal        */
   if first-of(somstr2.so_nbr) then qad_key1
   else ""        at 008   format   "x(08)"  /* order no       */
   substring(qad_key2,1,((r-index(qad_key2,"utsoship")) - 1))
                  at 016   format   "x(18)"  /* bill of lading */
   qad_charfld[2] at 034   format   "x(20)"  /* ship via       */
   qad_charfld[1] at 054   format   "x(8)"   /* site           */
   qad_charfld[3] at 062   format   "x(40)"  /* remarks        */
skip.

assign qad_key3 = so_mstr.so_inv_nbr.
