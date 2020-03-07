/* xfcmt9mi.i - Formtrap Include file Invoice Print                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/
/*V8:ConvertMode=Report                                                       */

put 
   "{&rectype}"   at 001   format   "x(01)"  /* Record Type  */
     cmt_cmmt[i]  at 002   format   "x(76)"  /* Comment line */
.
{{&usercode}}
put skip.
