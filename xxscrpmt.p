/* xxscrpmt.p - SCRAP TRANSACTION                                             */
/* icscrpmt.p - SCRAP TRANSACTION                                             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxscrpmt.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */

/* $Revision: 1.2 $      BY: Hitendra PV      DATE: 07/20/06   ECO: *R07B*   */
/* CYB    LAST MODIFIED: 31-MAY-2010    BY:  gbg *cy1016*                    */
/* CYB    LAST MODIFIED: 13-MAY-2011    BY:  gbg *c1214*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* THIS PROGRAM IS PART OF THE SCRAP TRANSACTION FUNCTIONALITY WHICH PROVIDES */
/* CAPABILITY TO SCRAP MATERIAL AT THE PART NUMBER LEVEL WITH DETAILS OF      */
/* QUANTITIES AND REASON CODES WITH A UNIQUE TRANSACTION (ISS-SCRP) CREATED   */
/* FOR SCRAP                                                                  */

/*V8:ConvertMode=Maintenance                                                  */
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

{&ICUNIS-P-TAG1}

define new shared variable transtype as character format "x(7)" no-undo.

{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}

transtype = "ISS-SCRP".
/*cy1016*  {us/bbi/gprun.i ""icscintr.p""} */
/*cy1016*/ {us/bbi/gprun.i ""xxscintr.p""}
