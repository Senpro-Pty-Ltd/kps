/* xfrp1amg.i - FORMTRAP ORDER HEADER INCLUDE FILE                            */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   {us/xf/xfput.i "'G'"    001   "x(01)"  }  /* type "G" */
   {us/xf/xfput.i so_nbr   002   "x(08)"  }  /* order no */
   {us/xf/xfput.i "(if available ad_mstr then ad_name else '')"   010   "x(28)"  }
   {us/xf/xfput.i so_po    038   "x(22)"  }  /* P/O no   */
.
{us/xf/xfso10ug.i}   /*** BLANK TEMPLATE ***/

put stream ft skip.
