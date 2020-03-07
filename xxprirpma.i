/* xxprirpma.i - PRICE LIST PRINT - RECORD TYPE A                            */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB     LAST MODIFIED: 24-AUG-2010            BY: psu *cy1004*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/

put stream ft
   {us/xf/xfput.i "'A'"                001   "x(01)"  }  /* type  "A"  */
   {us/xf/xfput.i tt_typedesc          002   "x(40)"  }  /* Cmmt */
.
put stream ft skip. 
