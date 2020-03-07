/* xxauis2a.p - Shipper Auto Confirm - Invoice Print                         */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                    */
/* CYB    LAST MODIFIED: 73-JUL-2011    BY:  gbg *c1226*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

define output parameter printdev as char.
{us/bbi/mfdeclre.i}
def stream fx.

def var gbg as char.


form
gbg
skip
with frame a side-labels.

   update gbg with frame a.

   {us/gp/gpselout.i
      &printType = "printer"
      &printWidth = 132
      &pagedFlag = "page"
      &stream = "stream fx"
      &appendToFile = "append"
      &streamedOutputToTerminal = " "
      &withBatchOption = "no"
      &displayStatementType = 1
      &withCancelMessage = "no"
      &pageBottomMargin = 6
      &withEmail = "no"
      &withWinprint = "no"
      &defineVariables = "yes"
      &device=gbg}
{us/bbi/mfreset.i}
