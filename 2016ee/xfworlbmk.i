/* xfworlbmk.i - PRINT WORK ORDER USER CODE RECORD TYPE "K"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

for first pt_mstr no-lock
   where pt_domain = global_domain
     and pt_part   = fs_part:
end.

/*  floorstock */
put stream ft
   "K"               at 1     format "x(1)"    /* Record Type */
   fs_part            at 2    format "x(18)"    /* Part */
   fs_qty             at 20   format "->>>>>>>>9.999999999" /* Qty */
.

if available pt_mstr
then do:
   put stream ft
   pt_um              at 40   format "x(2)"    /* UM */
   if pt_desc1 <> "" then pt_desc1
   else ""              at 42   format "x(24)"   /* Desc1 */
   if pt_desc2 <> "" then pt_desc2
   else ""              at 66   format "x(24)"   /* Desc1 */
.
end.

{us/xf/xfworluk.i}

put stream ft skip.

