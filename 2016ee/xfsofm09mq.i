/* xfsofm09mq.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: QAD2015EE    BY: Steve Hong        DATE: 13/01/16  ECO: *grc338 */

put
   "Q"              at 1     format "x(1)"   /*Record Type Q */
    mPackDesc          at 2    format "x(24)"        /* Item Desc  */ /*grc338*/
    mPackQty           at 26   format "->>>>>>9.9"   /* Quantity   */
    mPackNetWt       at 36   format "->>>>>>9.9"   /* Net Wt     */
    mPackTareWt      at 46   format "->>>>>>9.9"   /* Tare Wt    */
    mPackGrossWt     at 56   format "->>>>>>9.9"   /* Gross Wt   */
    mPackNetWtUm       at 66   format "x(2)"         /* Wt Um      */
    .
put skip.
