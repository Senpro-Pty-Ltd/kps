/* xfso10u5.i - INVOICE PRINT USER CODE Summary Billing Record                */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/******************************************************************************/
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* CYB       LAST MODIFIED: 10-AUG-2010     BY: gbg *cy1002*                  */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 05-FEB-2013     BY: gbg *cy1002h*                 */
/******************************************************************************/
/*V8:ConvertMode=Report                                                       */

/* start of new code >> */

put stream ft
  {us/xf/xfput.i lvtotweight    0600 "->,>>>,>>9.99" } /* Total Ship weight */
  {us/xf/xfput.i lvtotum        0613 "x(2)"          } /* Total Ship weight UM */
  .

/* end of new code << */
