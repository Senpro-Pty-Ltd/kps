/* xfcmt9mi.i - Formtrap Include file Invoice Print                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*                   BY: sxh                  DATE:10/03/14       *Q1066078 */

/*V8:ConvertMode=Report                                                       */

put 
   "{&rectype}"   at 001   format   "x(01)"  /* Record Type  */
     cmt_cmmt[i]  at 002   format   "x(76)"  /* Comment line */
.
{{&usercode}}
put /*stream ft*/ skip.
