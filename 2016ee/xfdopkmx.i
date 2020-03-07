/* xfdopkmx.i - FORMTRAP INCLUDE FILE DO PICKLIST PRINT                       */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eb3sp5   BY: Prasannan S           DATE: 25/08/10  ECO: *eb3sp5* */
/*V8:ConvertMode=Report                                                       */

put stream ft
   {us/xf/xfput.i "'X'"             001   "x(01)"  }
.

{us/xf/xfdopkux.i} /*BLANK TEMPLATE*/

put stream ft skip.

/*** TRAILER - RECORD TYPE "5" ***/
put stream ft
   {us/xf/xfput.i    "'5'"                   001   "x(01)"           }  /* type 5 */
   {us/xf/xfput.i    item_count              002   ">>>>>>>9"        }  /* Item Count */
   {us/xf/xfput.i    cum_weight              010   "->>,>>9.99<<<<"  }  /* Cum Weight */
   {us/xf/xfput.i    cum_cube                024   "->>,>>9.99"      }  /* Cum Cube   */
.

{us/xf/xfdopku5.i}

put stream ft skip.   
