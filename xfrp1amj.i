/* xfrp1amj.i - Formtrap Include file Invoice Print                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft 
   "J"               at 01   format "x(01)"  /* TYPE "J" */
   itm_ca_int_type   at 02   format "x(08)"  /* WORK CODE */
   if available fwk_mstr then fwk_desc
   else ""           at 10   format "x(24)"  /* WORK DESC */
   if available sv_mstr then sv_code
   else ""           at 34   format "x(08)"  /*SERVICE TYPE*/
   if available sv_mstr then sv_desc
   else ""           at 42   format "x(25)"  /*SERVICE DESC*/
skip.
