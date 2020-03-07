/* xfsofm09mp.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: QAD2014       BY: Prasannan S         DATE: 17/09/10  ECO: *grc338**/
/* Revision: QAD2014    BY: Amol Dudvadkar   DATE: 03/16/15 ECO: *grc338*   */

put
    "P"         at 1    format "x"  /* type  "0"  */
    l_desc          at 2    format "x(24)"        /* Item Desc  */ /*grc338*/
    l_qty           at 26   format "->>>>>>9.9"   /* Quantity   */
    l_net_wt1       at 36   format "->>>>>>9.9"   /* Net Wt     */
    l_tare_wt1      at 46   format "->>>>>>9.9"   /* Tare Wt    */
    l_gross_wt1     at 56   format "->>>>>>9.9"   /* Gross Wt   */
    l_part_um       at 66   format "x(2)"         /* Wt Um      */
    .
put skip.
