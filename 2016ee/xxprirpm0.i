/* xxprirpm0.i - PRICE LIST PRINT - RECORD TYPE ZERO (0)                     */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB     LAST MODIFIED: 24-AUG-2010            BY: psu *cy1004*            */
/* CYB          MODIFIED: 11-AUG-2011            BY: gbg *c1232*             */
/* CYB    LAST MODIFIED: 13-AUG-2012    BY:  gbg *c1327*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/

put stream ft
   {us/xf/xfput.i "'0'"                001   "x(01)"  }  /* type  "0"  */
   {us/xf/xfput.i tt_cust              002   "x(08)"  }  /* Customer Code */
   {us/xf/xfput.i tt_name              010   "x(24)"  }  /* Customer Name */
   {us/xf/xfput.i tt_slspsn            034   "x(08)"  }  /* Salesperson Code */
   {us/xf/xfput.i year(tt_effdate)     042   "9999"   }  /* Effective date */
   {us/xf/xfput.i month(tt_effdate)    046   "99"     }
   {us/xf/xfput.i day(tt_effdate)      048   "99"     }
   {us/xf/xfput.i "'AAA'"              050   "x(8)"   }
   {us/xf/xfput.i "'PRICELST'"         058   "x(8)"   }
   {us/xf/xfput.i tt_brand             066   "x(40)"  }  /* c1232 */
.
put stream ft skip.   
