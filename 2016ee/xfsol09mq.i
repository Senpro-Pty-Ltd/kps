/* xfsol09mq.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE                */
/*****************************************************************************/
  
      put stream ft  "Q"                at 1 format "x(1)".
   if in_qad_charfld_15 = "" then
      put stream ft  in_qad_charfld_3 at 2 format "x(8)".
   if in_qad_charfld_15 = "" then
      put stream ft  in_qad_charfld_4 at 10 format "x(18)".
   if in_qad_charfld_15 <> "" then
      put stream ft  in_qad_charfld_15 at 28 format "x(12)".         
   if in_qad_charfld_9 <> "" then
      put stream ft  substring(in_qad_charfld_9,2) at 40 format "x(13)". 
