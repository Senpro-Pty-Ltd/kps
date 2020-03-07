/* xxpomt.p - PURCHASE ORDER MAINTENANCE                                      */
/* popomt.p - PURCHASE ORDER MAINTENANCE                                      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxpomt.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* $Revision: 1.2 $                                                       */
/*V8:ConvertMode=Maintenance                                                  */
/*                                                                            */
/* Revision: 6.0  BY:SVG                DATE:08/13/90         ECO: *D058*     */
/* Revision: 7.0  BY:AFS   (rev only)   DATE:07/01/92         ECO: *F727*     */
/* Revision: 8.6  BY:Alfred Tan         DATE:05/20/98         ECO: *K1Q4*     */
/* Revision: 9.1  BY:Annasaheb Rahane   DATE:03/24/00         ECO: *N08T*     */
/* Revision: 1.3.4.2     BY: Mark B. Smith       DATE:11/08/99   ECO: *N059*  */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.3.4.3     BY: Jean Miller         DATE: 12/11/01  ECO: *P03N*  */
/* $Revision: 1.2 $  BY: Jean Miller         DATE: 01/07/02  ECO: *P040*  */
/* CYB                   BY: nac                DATE: 26 May 10 ECO: *Q9021*  */
/* CYB                   BY: nac                DATE: 26 May 10 ECO: *cy1012* */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*           */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}

/* INPUT OF FALSE MEANS THIS IS NOT A BLANKET PURCHASE ORDER */
/*cy1012*  {us/bbi/gprun.i ""pomt.p"" "(input false)"} */
/*cy1012*/ {us/bbi/gprun.i ""xxmt.p"" "(input false)"}
