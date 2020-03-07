/* xxsoisbo.p - SALES ORDER SHIPMENT CANCEL BACK ORDER QTY                    */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/******************************************************************************/
/* CYB        LAST MODIFIED: 31-JAN-2012  BY: gbg *cy1021*                    */
/* CYB   LAST MODIFIED: 31-JAN-2012  BY:  gbg *c1279*                  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/******************************************************************************/

{us/bbi/mfdeclre.i}

def input parameter iprecno as recid.


for first sod_det
where recid(sod_det) = iprecno:
     sod_bo_chg = 0.
end.
