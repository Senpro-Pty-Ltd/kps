/* xfdopkme.i - FORMTRAP INCLUDE FILE DO PICKLIST PRINT                       */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eb3sp5   BY: Prasannan S           DATE: 25/08/10  ECO: *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 11/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   {us/xf/xfput.i "'E'"                  001   "x(01)"    }  /* type "b" */
   {us/xf/xfput.i lad_part               002   "x(18)"    }  /* item number */
   {us/xf/xfput.i desc1                  020   "x(24)"    }  /* description 1 */
   {us/xf/xfput.i lad_loc                068   "x(08)"    }  /* location */
   {us/xf/xfput.i lad_lot                076   "x(18)"    }  /* lot Serial */
   {us/xf/xfput.i lad_ref                094   "x(08)"    }  /* reference */
   {us/xf/xfput.i lad_qty_all            102   "->>>>>>>>9.999999999"    }  /* reference */
   {us/xf/xfput.i pt_um                  122   "x(02)"    }  /* uom */
   {us/xf/xfput.i shipped                124   "x(10)"    }  /* Shipped */
.   

{us/xf/xfdopkue.i} /*BLANK TEMPLATE*/

put stream ft skip.
