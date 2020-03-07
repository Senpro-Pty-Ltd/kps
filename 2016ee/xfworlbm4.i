/* xfworlbm4.i - PRINT WORK ORDER USER CODE RECORD TYPE "4"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "4"          at 1    format "x"      /* type "4" */
   year(wod_iss_date)   at 2    format "9999"       /* issue date*/
   month(wod_iss_date)  at 6    format "99"
   day(wod_iss_date)    at 8    format "99"
.

{us/xf/xfworlu4.i}
put stream ft skip.      

{us/xf/xfcmtprt.i &type=RP &rectype=Y &id=wo_cmtindx
                  &usercode="us/xf/xfworluy.i"}
