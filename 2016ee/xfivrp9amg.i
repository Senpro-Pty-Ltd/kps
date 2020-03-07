/* xfivrp9amg.i FORMTRAP DEFINE VARIABLES FOR INVOICE PRINT                 */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* REVISION: FT2.1 sp2      CREATED: 18-Apr-05       BY  Mike Whelan mwu */ 
/* FT-EB2.1sp5    LAST MODIFIED: 05-Dec-06  BY: *FT-EB2.1sp5* psu             */
/* REVISION: 9.21sp8FT  CREATED: 01/19/09  BY: Ashish Mishra  *QAD09003* */
/*****************************************************************************/

put stream ft
   {us/xf/xfput.i "'G'"    001   "x(01)"  }  /* type "G" */
   {us/xf/xfput.i idh_nbr  002   "x(08)"  }  /* order no */
   {us/xf/xfput.i "(if available ad_mstr then ad_name else '')"      010   "x(28)"  }
   {us/xf/xfput.i "(if available ihhist then ihhist.ih_po else '')"  038   "x(22)"} /* P/O no */
.

{us/xf/xfiv10ug.i} /*BLANK TEMPLATE*/

put stream ft skip.
