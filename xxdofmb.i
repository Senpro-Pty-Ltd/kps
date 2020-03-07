/* us/ds/dsdofmb.i - DISTRIBUTION ORDER MAINTENANCE FRAME B                         */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdofmb.i,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/* $Revision: 1.2 $                                                           */
/*V8:ConvertMode=Maintenance                                                  */
/******************************************************************************/
/* Revision: 1.6       BY: Robin McCarthy     DATE: 07/31/01 ECO: *P009*      */
/* Revision: 1.9     BY: Ed van de Gevel    DATE: 12/06/01 ECO: *N16Z*      */
/* Revision: 1.10  BY: Ed van de Gevel DATE: 12/01/03 ECO: *P0WR* */
/* $Revision: 1.2 $ BY: Ed van de Gevel DATE: 03/07/05 ECO: *R00K*/
/* CYB    LAST MODIFIED: 02-OCT-2012    BY:  gbg *c1347*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/

{us/bbi/cxcustom.i "us/ds/dsdofmb.i"}
{&DSDOFMB-I-TAG1}   /* USED FOR LOCALIZATIONS */
/*c1347* start added code */
form
   dss_created      colon 15
   dss_rmks         colon 35
   dss_shipdate     colon 15
   dss_lang         colon 35
   dss_due_date     colon 15
   dsscmmts         colon 35
   dss__chr02       colon 15 label "Van Loc"
   skip(1)
   dss_po_nbr       colon 15
   dss_shipvia      colon 50
   dss_fob          colon 15
   dss_bol          colon 50
   impexp           colon 15
   dss_status       colon 50
with frame b side-labels width 80.
/*c1347* end   added code */

/*c1347* start deleted code >>>>
form
   dss_created      colon 15
   dss_rmks         colon 35
   dss_shipdate     colon 15
   dss_lang         colon 35
   dss_due_date     colon 15
   dsscmmts         colon 35
   skip(1)
   dss_po_nbr       colon 15
   dss_shipvia      colon 50
   dss_fob          colon 15
   dss_bol          colon 50
   impexp           colon 15
   dss_status       colon 50
with frame b side-labels width 80.
*c1347* end deleted code <<<<<<<<*/

{&DSDOFMB-I-TAG2}   /* USED FOR LOCALIZATIONS */
/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).
