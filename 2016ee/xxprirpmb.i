/* xxprirpmb.i - PRICE LIST PRINT - RECORD TYPE B                            */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB     LAST MODIFIED: 24-AUG-2010            BY: psu *cy1004*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                   LAST MODIFIED: 2016-Apr-27 BY: gbg *c1577* d3475  */
/******************************************************************************/

/*c1577* start added code >>>> */
put stream ft
   {us/xf/xfput.i "'B'"                001   "x(01)"  }  /* type  "B"  */
   {us/xf/xfput.i tt_part              002   "x(18)"  }  /* Item Number */
   {us/xf/xfput.i tt_desc1             020   "x(24)"  }  /* Item Desc   */
   {us/xf/xfput.i tt_type              044   "x(08)"  }  /* Type   */
   {us/xf/xfput.i tt_warranty          052   "x(02)"  }  /* Warranty Months   */
   {us/xf/xfput.i tt_price             054   "->>>>>>>>9.99"  }  /* Price   */
   {us/xf/xfput.i tt_rrp               067   "->>>>>>>>9.99"  }  /* List    */
.
/*c1577* end   added code <<<< */
/*c1577* start deleted code >>>>
put stream ft
   {us/xf/xfput.i "'B'"                001   "x(01)"  }  /* type  "B"  */
   {us/xf/xfput.i tt_part              002   "x(18)"  }  /* Item Number */
   {us/xf/xfput.i tt_desc1             020   "x(24)"  }  /* Item Desc   */
   {us/xf/xfput.i tt_type              044   "x(08)"  }  /* Type   */
   {us/xf/xfput.i tt_warranty          052   "x(02)"  }  /* Warranty Months   */
   {us/xf/xfput.i tt_price             054   "->>>>>>>>9.99"  }  /* Price   */
.
*c1577 end deleted code <<<<< */

put stream ft skip. 
