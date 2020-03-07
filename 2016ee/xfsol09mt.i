/* xfsol09mt.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE                 */

  put stream ft "T"  at 1  format "x(1)"     /* Record Type T*/
                      schd_reference at 2 format "x(18)"
                      qty_open    at 20 format "->>>>>>>>9.999999999" 
                      sod_um      at 40 format "x(2)"    
                      year(schd_date)   at 42   format "9999"   /* order date */
                      month(schd_date)  at 46   format "99"
                      day(schd_date)    at 48   format "99"
                      .
                   
