/* xfsol09mw.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1 EE                */

/* GET WORKING RECORDS FOR THIS WORKFILE RECORD */
 put stream ft 
                 "W"           at 1    format "x(1)"   
                 wrk_dock      at 2    format "x(5)"
                 wrk_line_feed at 7    format "x(45)"
                 .
      
