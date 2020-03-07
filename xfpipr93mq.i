/* xfpipr93mq.i - FORMTRAP INCLUDE FILE                                       */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

/* DISCOUNT DETAIL LINE - RECORD TYPE "Q" */

put stream ft
   "Q"               at 001   format "x(01)" /* type "Q" */
   l_man_desc        at 002   format "x(24)" /* desc     */
   amt_type          at 026   format "x(08)" /* amt type */
   if disc_det_key = "3" then "$"
   else ""           at 034   format "x(01)" /* $ symbol */
   prnt_disc_amt     at 035   format "->>>>>>>>>>9.99999" /* amount */
   if disc_det_key = "2" then "%"
   else ""           at 053   format "x(01)" /* % symbol */
   disc_prnt_label   at 054   format "x(08)" /* amt label*/
.

{us/xf/xfsoluq.i}

put stream ft skip.
