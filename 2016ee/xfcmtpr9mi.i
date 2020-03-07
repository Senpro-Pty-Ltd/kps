/* xfcmtpr9mi.i - Formtrap Include file Invoice Print                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/*V8:ConvertMode=Report                                                       */
/* REVISION: FT-EB2.1sp2      CREATED: 15-Apr-05    BY  mwu                   */
/* FT-EB2.1sp5    LAST MODIFIED: 12-Dec-06  BY: *FT-EB2.1sp5* psu             */
/*****************************************************************************/
/********               KLEENMAID MIGRATION HISTORY                      *****/
/*****************************************************************************/
/* KLM08001          BY: Naimish Mamawala      DATE: 06/18/08                */
/*              Form Trap Migration from eB2.1sp6 to eB2.1sp7                */
/* REVISION: 9.21sp8FT  CREATED: 01/16/09  BY: Ashish Mishra  *QAD09003* */
/* QAD01             BY: Prajakta P.          DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012EE.1               */
/*****************************************************************************/

put stream ft 
       "{&rectype}"  at 1    format "x(1)"   /* Record Type  */
     cmt_cmmt[i]     at 2    format "x(76)"  /* Comment line */
     .
        {{&usercode}}
put stream ft skip.

