/* xxrqporef.p  - REQUISITIONS MAINTAIN REQ/PO CROSSREFERENCE RECORD      */
/* rqporef.p  - REQUISITIONS MAINTAIN REQ/PO CROSSREFERENCE RECORD      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqporef.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* REVISION: 8.5     LAST MODIFIED: 02/13/97    BY: B. Gates *J1Q2*     */
/* REVISION: 9.1     LAST MODIFIED: 08/12/00    BY: *N0KP* myb          */
/* Old ECO marker removed, but no ECO header exists *F0PN*              */
/* Revision: 1.4     BY: Rajaneesh S. DATE: 12/17/02 ECO: *N22B* */
/* Revision: 1.6     BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.7     BY: Tejasvi Kulkarni   DATE: 03/04/05 ECO: *P3BH* */
/* Revision: 1.8     BY: Shivaraman V.      DATE: 09/27/06 ECO: *P57S* */
/* Revision: 1.9     BY: Ambrose Almeida    DATE: 02/07/08 ECO: *P5TK* */
/* $Revision: 1.2 $     BY: Kunal Pandya       DATE: 11/28/08 ECO: *Q1YW* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/************************************************************************/

{us/bbi/mfdeclre.i}

define input parameter p_first_call as   logical       no-undo.
define input parameter p_req_site   like pod_site      no-undo.
define input parameter p_req_nbr    like rqpo_req_nbr  no-undo.
define input parameter p_req_line   like rqpo_req_line no-undo.
define input parameter p_po_nbr     like rqpo_po_nbr   no-undo.
define input parameter p_po_line    like rqpo_po_line  no-undo.
define input parameter p_qty_ord    like pod_qty_ord   no-undo.
define input parameter p_pod_um     like pod_um        no-undo.
define output parameter p_req_um    like rqd_um        no-undo.
define output parameter p_ok        as   logical       no-undo.

define variable old_db            as character no-undo.
define variable err-flag          as integer   no-undo.
define variable prev_qty          as decimal   no-undo.
define variable conversion_factor as decimal   no-undo.
define variable l_opn-yn          as logical   no-undo.

define buffer b_poddet for pod_det.

if p_first_call
then do:
   /*FIRST TIME IN, WE SWITCH DB'S IF WE HAVE TO THEN
   CALL OURSELVES AGAIN, WHICH WILL EXECUTE THE ELSE BLOCK*/
   for first si_mstr
      fields( si_domain si_db si_site)
       where si_mstr.si_domain = global_domain and  si_site = p_req_site
      no-lock:
   end. /* FOR FIRST si_mstr */

   if si_db <> global_db
   then do:
      old_db = global_db.
      {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err-flag)"}
   end. /* IF si_db <> global_db */

/*q9006*   {us/bbi/gprun.i ""rqporef.p"" */
/*q9006*/  {us/bbi/gprun.i ""xxrqporef.p""
      "(input no, input p_req_site, input p_req_nbr,
        input p_req_line, input p_po_nbr,
        input p_po_line, input p_qty_ord, input p_pod_um,
        output p_req_um, output p_ok)"}

   /*SWITCH BACK TO CENTRAL PO DB IF WE HAVE TO*/
   if old_db <> global_db
   then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(old_db, output err-flag)"}
   end. /* IF old_db <> global_db */
end. /* IF p_first_call */
else do:
   prev_qty = 0.

   find rqpo_ref
       where rqpo_ref.rqpo_domain = global_domain and  rqpo_req_nbr  = p_req_nbr
        and rqpo_req_line = p_req_line
        and rqpo_po_nbr   = p_po_nbr
        and rqpo_po_line  = p_po_line
      exclusive-lock no-error.

   for first rqd_det
      where  rqd_det.rqd_domain = global_domain
         and rqd_nbr            = p_req_nbr
         and rqd_line           = p_req_line
      exclusive-lock:
   end. /* FOR FIRST rqd_det */

   if  available rqpo_ref
   and not available rqd_det
   then do:
      delete rqpo_ref.
      leave.
   end. /* IF AVAILABLE rqpo_ref */

   p_req_um = rqd_um.

   if p_qty_ord = 0
   then do:
      if available rqpo_ref
      then
         delete rqpo_ref.
      p_ok = true.
   end. /* IF p_qty_ord = 0 */
   else do:
      if not available rqpo_ref
      then do:
         create rqpo_ref. rqpo_ref.rqpo_domain = global_domain.

         assign
            rqpo_req_nbr  = p_req_nbr
            rqpo_req_line = p_req_line
            rqpo_po_nbr   = p_po_nbr
            rqpo_po_line  = p_po_line
            .

         if recid(rqpo_ref) = -1 then.
      end. /* IF NOT AVAILABLE rqpo_ref ... */

      conversion_factor = 1.

      if p_pod_um <> rqd_um
      then do:
         {us/bbi/gprun.i ""gpumcnv.p""
            "(input p_pod_um, input rqd_um, input rqd_part,
              output conversion_factor)"}
      end. /* IF p_pod_um <> rqd_um */

      if conversion_factor = ?
      then
         conversion_factor = 1.

      rqpo_qty_ord = p_qty_ord * conversion_factor.
      p_ok = rqpo_qty_ord <> ?.

      /*REOPEN REQUISITION IF LESS QUANTITY ON PO */
      if     rqpo_qty_ord < rqd_req_qty
         and rqd_status   = "C"
      then do:
         {us/bbi/pxmsg.i &MSGNUM=3327
                  &CONFIRM=l_opn-yn}
          if l_opn-yn
          then
             rqd_status = "".
      end. /* IF rqpo_qty_ord < rqd_req_qty*/

   end. /* ELSE DO */

   /*CHECK AND SET THE OPEN AND APRV STATUS INDICATORS*/

    for first rqm_mstr
       fields( rqm_domain rqm_aprv_stat rqm_nbr rqm_open rqm_status)
        where rqm_mstr.rqm_domain = global_domain and  rqm_nbr = p_req_nbr
       no-lock:
    end. /* FOR FIRST rqm_mstr */
   {us/bbi/gprun.i ""rqsetopn.p"" "(input rqm_nbr)"}
end. /* ELSE DO */
