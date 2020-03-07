/* xfsoaut9mz.i - Formtrap Include file Invoice Print                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2015EE   BY: sxh        DATE: 13/01/16  ECO: *grc338*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "Z"               at 001                                 /*record type "Z"*/
   t_absr_reference  at 002                                 /*reference */
   l_qty    at 026   format "->>>>>>>>>>9.99999"   /*pegged qty */
   l_invprice         at 044   format "->>>>>>>>9.99999"
   l_qty_ext        at 060   format "->>>>>>>>>>9.99999"
skip.
