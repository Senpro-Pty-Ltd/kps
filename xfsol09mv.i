/* xfsol09mv.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012EEEE               */

 put stream ft 
                "V"         at 1  format "x(1)"     /* Record Type U*/
                tmp_wkfl.qad_charfld[3] at 2 format "x(8)"
                tmp_wkfl.qad_charfld[4] at 10 format "x(18)"   
                pt_um at 28 format "x(2)"
                .
