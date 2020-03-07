/* xfsofm09mr.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: qad2015EE       BY: sxh          DATE: 13/01/16  ECO: *grc338**/

put
   "R"             at 1    format "x"            /* type  "R"  */
   l_net_wt2       at 36   format "->>>>>>9.9"   /* Net Wt     */
   l_tare_wt2      at 46   format "->>>>>>9.9"   /* Tare Wt    */
   l_gross_wt2     at 56   format "->>>>>>9.9"   /* Gross Wt   */
   firstPartUM     at 66   format "x(2)"         /* Wt Um      */
.
put skip.
