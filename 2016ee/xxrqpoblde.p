/* xxrqpoblde.p - Requisition Retrieval Sub-Program                           */
/* rqpoblde.p - Requisition Retrieval Sub-Program                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqpoblde.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* REVISION 8.5       LAST MODIFIED: 04/15/97  BY: *J1Q2* Patrick Rowan     */
/* REVISION 8.6       LAST MODIFIED: 05/20/98  BY: *K1Q4* Alfred Tan        */
/* REVISION 8.6       LAST MODIFIED: 09/09/99  BY: *J39R* Reetu Kapoor      */
/* REVISION 9.0       LAST MODIFIED: 03/02/00  BY: *M0KC* Reetu Kapoor      */
/* REVISION 9.1       LAST MODIFIED: 08/12/00  BY: *N0KP* myb               */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.4.1.4  BY: Katie Hilbert           DATE: 09/19/02  ECO: *N1VC* */
/* Revision: 1.4.1.6.1.1  BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.4.1.6.1.3  BY: Andrew Dedman       DATE: 08/22/05  ECO: *R01P* */
/* Revision: 1.4.1.8      BY: David Morris        DATE: 09/29/05  ECO: *R021* */
/* Revision: 1.4.1.9      BY: Ken Casey           DATE: 03/27/07  ECO: *R0C6* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*----------------------------------------------------------------------------
 DESCRIPTION: Copy requisitions from a supplied site to a work-file.
              Supports the GRS Purchase Requisition Module of MFG/PRO.
 ------------------------------------------------------------------------------*/

{us/bbi/mfdeclre.i " "}

/* PARAMETERS */
define input parameter p_req_nbr      like rqm_mstr.rqm_nbr no-undo.
define input parameter p_req_nbr1     like rqm_mstr.rqm_nbr no-undo.
define input parameter p_supplier     like rqm_vend no-undo.
define input parameter p_supplier1    like rqm_vend no-undo.
define input parameter p_part         like rqd_part no-undo.
define input parameter p_part1        like rqd_part no-undo.
define input parameter p_need_date    like rqd_need_date no-undo.
define input parameter p_need_date1   like rqd_need_date no-undo.
define input parameter p_buyer_id     like rqm_buyer no-undo.
define input parameter p_site         like rqd_site no-undo.
define input parameter p_requester    like rqm_rqby_userid no-undo.
define input parameter p_job_name     like rqm_job no-undo.
define input parameter p_ship         like rqd_ship no-undo.
define input parameter p_currency     like rqm_curr no-undo.
define input parameter p_blank_suppliers  like mfc_logical no-undo.
define input parameter p_include_mrp_type like mfc_logical no-undo.
define input parameter p_include_mro_type like mfc_logical no-undo.
define input parameter p_default_copy     like mfc_logical no-undo.
define output parameter p_rqpo_wrk_cntr as integer no-undo.

/* VARIABLES */
define variable open_qty              like rqd_req_qty no-undo.
define variable qty_um                like rqd_um no-undo.
define variable hBlockedTransactionlibrary as handle no-undo.

/*q9006*/ def shared var vdom         like dom_domain.
/*q9006*/ def shared var vdom1        like dom_domain.

/*q9006*/  def var prev_domain like si_domain.
/*q9006*/  def var si_recno as recid.
/*q9006*/  def shared var ss-site like si_site.

/*q9006*/ def buffer parentdomain   for dom_mstr.
/*q9006*/ def buffer childdomain    for dom_mstr.

/* CONSTANTS */
{us/rq/rqconst.i}

/* SHARED VARIABLES*/
{us/rq/rqpovars.i }

/* User Update Restrictions Temp Table Definition */
{us/up/updaterestriction.i}

/*  INITIALIZE  */
p_rqpo_wrk_cntr = 0.

/*  CLEAR TEMP TABLE  */
for each rqpo_wrk exclusive-lock:
   delete rqpo_wrk.
end.

/* start blocked transaction library to run persistently */
run mfairunh.p
   (input "mgbltrpl.p",
    input  ?,
    output hBlockedTransactionlibrary).

{us/mg/mgbltrpl.i "hBlockedTransactionlibrary"}

/* User Update Restriction Procedure Library */
run mfairunh.p
   (input "mgurpl.p",
    input ?,
    output hUpdateRestrictedLibrary).

/* User Update Restriction Constants */
{us/mg/mgurpl.i "hUpdateRestrictedLibrary"}

/*  RETRIEVE RECORDS AND LOAD TEMP-TABLE */
/*  NOTES: rqm_rtdto_purch: indicates the req has been routed to purchasing.
       Reqs can only be routed to purchasing after full approval.  Once in OOT,
       the req. header remains routed to purchasing, even though the approval status
       is "unapproved". rqm_open: Indicates one or more lines has open quantity.
       Once the req. lines are consumed on POs, then the open qty = 0.    */
loopa:
for each rqm_mstr where rqm_domain = global_domain and
      (rqm_open                      and
      (rqm_rtdto_purch)             and
      (rqm_nbr        >= p_req_nbr  and rqm_nbr <= p_req_nbr1)   and
      (rqm_rqby_userid = p_requester or p_requester = "")        and
      (rqm_buyer       = p_buyer_id  or p_buyer_id = "")         and
      (rqm_curr        = p_currency  or p_currency = "")         and
      (rqm_job         = p_job_name  or p_job_name = "")         and
      rqm_status       = ""                                      and
      (rqm_ship        = p_ship      or  p_ship = ""))
no-lock:

   if blockedSupplier(input rqm_vend,
                      input {&PO002},
                      input false,
                      input "")
   then do:
/*q9006*         next loopa. */
   end.

   /*  NOTES: rqd_aprv_stat:  the approval status on the line. Only after the entire
          requisition has been approved does each line status become approved.
          rqd_open: Indicates the line has quantity that has not been placed on a PO. */

   for each rqd_det where rqd_domain = global_domain and
         ((rqd_nbr       = rqm_nbr)      and
          (rqd_open)                     and
          (rqd_status    = "")           and
          (rqd_aprv_stat = APPROVAL_STATUS_APPROVED or
           rqd_aprv_stat = APPROVAL_STATUS_OOT)                   and
          (rqd_part      >= p_part      and rqd_part <= p_part1)  and
          (rqd_need_date >= p_need_date and rqd_need_date <= p_need_date1)
          and
          ((p_blank_suppliers            and rqd_vend = "")
          or
          (p_blank_suppliers = no       and
          (rqd_vend >= p_supplier    and rqd_vend <= p_supplier1))) and
         ((p_include_mrp_type           and rqd_type = "")
          or
          (p_include_mro_type           and rqd_type <> ""))  
/*q9006*	  and (rqd_site = p_site             or  p_site = "") */
	  )
   no-lock:

      if blockedSupplier(input rqd_vend,
                         input {&PO002},
                         input false,
                         input "")
      then do:
/*q9006*            next. */
      end.

      /* VALIDATE IF THE USER UPDATE IS RESTRICTED */
      /* CLEAR TEMP TABLE RECORDS BEFORE CREATING NEW RECORD */
      empty temp-table ttUpdateRestrictionSignature.

      /* CREATE TEMP-TABLE RECORD */
      create ttUpdateRestrictionSignature.
      assign
         ttUpdateRestrictionSignature.category              = {&POMT}
         ttUpdateRestrictionSignature.program               = execname
         ttUpdateRestrictionSignature.part                  = rqd_part
         ttUpdateRestrictionSignature.site                  = rqd_site
         ttUpdateRestrictionSignature.siteTo                = ?
         ttUpdateRestrictionSignature.location              = rqd_loc
         ttUpdateRestrictionSignature.locationTo            = ?
         ttUpdateRestrictionSignature.inventoryStatus       = ?
         ttUpdateRestrictionSignature.inventoryStatusTo     = ?
         ttUpdateRestrictionSignature.account               = ?
         ttUpdateRestrictionSignature.subaccount            = ?
         ttUpdateRestrictionSignature.costCenter            = ?
         ttUpdateRestrictionSignature.project               = ?
         ttUpdateRestrictionSignature.changeInventoryStatus = ?.
      if recid(ttUpdateRestrictionSignature) = -1 then .

      if isUpdateRestricted(input table ttUpdateRestrictionSignature,
                            input false)
      then do:
         next.
      end.

      /* DETERMINE OPEN QTY: QTY ALREADY PLACED ON PO'S */
      open_qty = 0.
      {us/bbi/gprun.i ""rqoqty.p""
            "(input rqm_nbr,
              input rqd_line,
              output open_qty,
              output qty_um)"}

      /* MAKE SURE THERE IS OPEN BEFORE SELECTING THE LINE */
      if open_qty > 0 then do:
         create rqpo_wrk.
         assign
            rqpo_nbr        = rqm_nbr
            rqpo_line       = rqd_line
            rqpo_item       = rqd_part
            rqpo_site       = rqd_site
/*q9006*/           rqpo_site       = ss-site
            rqpo_net_qty    = open_qty
            rqpo_need_date  = rqd_need_date
            rqpo_supplier   = rqd_vend
            rqpo_ship       = rqm_ship
            rqpo_buyer_id   = rqm_buyer
            rqpo_copy_to_po = p_default_copy.

         p_rqpo_wrk_cntr = p_rqpo_wrk_cntr + 1.

      end.  /* if open_qty > 0 */

   end.  /* for each rqd_det */

end.  /* for each rqm_mstr */

delete procedure hBlockedTransactionlibrary no-error.
delete procedure hUpdateRestrictedLibrary.
