/* xxrqrtmt.p   - REQUISITION REROUTE                                         */
/* rqrtmt.p   - REQUISITION REROUTE                                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqrtmt.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* $Revision: 1.2 $                                                       */
/*V8:ConvertMode=Maintenance                                                  */
/* Revision: 8.6    LAST MODIFIED BY: 05/05/97  By: B. Gates          *J1Q2*  */
/* REVISION: 8.6    LAST MODIFIED: 05/20/98     BY: *K1Q4* Alfred Tan         */
/* REVISION: 9.1    LAST MODIFIED: 08/12/00     BY: *N0KP* Mark Brown         */
/* $Revision: 1.2 $  BY: Jean Miller         DATE: 12/05/01  ECO: *P039*  */
/* CYB    LAST MODIFIED: 03-FEB-2012    BY:  gbg *c1276*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/mf/mfdtitle.i "b+ "}

/* COMMON API CONSTANTS AND VARIABLES */
{us/mf/mfaimfg.i}

if c-application-mode = "API" then do on error undo, return:

   /* Get handle of API Controller */
   {us/bbi/gprun.i ""gpaigach.p"" "(output ApiMethodHandle)"}

   if not valid-handle(ApiMethodHandle) then do:
      /* API Error */
      {us/bbi/pxmsg.i &MSGNUM=10461 &ERRORLEVEL=4}
      return error.
   end.

   run setCommonDataBuffer in ApiMethodHandle
      (input "ttRequisitionRoute").

end.  /* If c-application-mode = "API" */

/*c1276*  {us/bbi/gprun.i ""rqrtmt0.p""} */
/*c1276*/ {us/bbi/gprun.i ""xxrtmt0.p""}

if c-application-mode = "API" then do:
   run setCommonDataBuffer in ApiMethodHandle
      (input "").
end.   
