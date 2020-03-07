/* xfdopkmv.i - FORMTRAP INCLUDE FILE DO PICKLIST PRINT                       */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eb3sp5   BY: Prasannan S           DATE: 25/08/10  ECO: *eb3sp5* */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "V"   at 1  format "x(01)"
.

{us/xf/xfdopkuv.i} /*BLANK TEMPLATE*/

put stream ft skip.
