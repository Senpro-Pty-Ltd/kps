/* xfrcrpmc.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/

put
   "C"        at 1    format "x"      /* type "C" */
   absc_seq       at 2    format ">>9"        /* sequence*/
   absc_carrier   at 5    format "x(8)"       /* carrier */
   company[1]     at 13   format "x(38)"      /* address 1*/
   company[2]     at 51   format "x(38)"      /* address 2*/
   company[3]     at 89   format "x(38)"      /* address 3*/
   company[4]     at 127  format "x(38)"      /* address 4*/
   company_city   at 165  format "x(24)"      /* city */
   company_state  at 189  format "x(4)"       /* state */
   company_zip    at 193  format "x(10)"      /* post code */
   company[6]     at 203  format "x(38)"      /* address 6*/
   .

 {us/so/sofs9puc.i}

put skip.
