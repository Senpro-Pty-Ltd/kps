/* xxprirpmc.i - PRICE LIST PRINT - RECORD TYPE C                            */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB     LAST MODIFIED: 24-AUG-2010            BY: psu *cy1004*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/

put stream ft
   {us/xf/xfput.i "'C'"                001   "x(01)"  }  /* type  "C"  */
.

put stream ft skip. 
