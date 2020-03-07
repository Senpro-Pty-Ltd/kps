/* xfsol09mh.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE              */
/*****************************************************************************/

  if sch_pcs_date <> ? then
               pcs_date   = string(year(sch_pcs_date),"9999") +
                            string(month(sch_pcs_date),"99") +
                            string(day(sch_pcs_date),"99").
            else
               pcs_date   = "".

            put stream ft  "H"         at 1  format "x(1)"     /* Record Type H*/
                qty_open    at 2  format "->>>>>>>>9.999999999" /* Qty Open */
                sod_um      at 22 format "x(2)"     /* Unit of Measure */
                pcs_date    at 24 format "x(8)"     /* Prior Cum Date */
                .

            {us/xf/xfsoluh.i}

            put stream ft  skip.
