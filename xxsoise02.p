/* xxsoise02.p - INVENTORY HARD ALLOCATIONS FOR SOB_DET                       */
/* soise02.p - INVENTORY HARD ALLOCATIONS FOR SOB_DET                         */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoise02.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/* REVISION: 6.0      LAST MODIFIED: 01/14/91   BY: emb *D313*/
/* REVISION: 6.0      LAST MODIFIED: 09/20/91   BY: WUG *D858*/
/* REVISION: 6.0      LAST MODIFIED: 10/07/91   BY: alb *D887**/
/* Revision: 7.3        Last edit: 09/27/93             By: jcd *G247* */
/* REVISION: 7.3      LAST MODIFIED: 10/21/94   BY: rmh *FQ08**/
/* REVISION: 7.5      LAST MODIFIED: 11/22/94   BY: taf *J038**/
/* REVISION: 8.5      LAST MODIFIED: 04/15/96   by: ais *G1RS**/
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   by: *K1Q4* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 07/13/99   BY: *J2MD* A. Philips         */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.7.1.3  BY: Jean Miller DATE: 05/21/02 ECO: *P05V* */
/* Revision: 1.7.1.5  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L* */
/* $Revision: 1.2 $ BY: Vinod Kumar        DATE: 12/21/04 ECO: *P2TK* */
/* $Revision: 1.2 $ BY: Masroor Alam DATE: 06/28/06  ECO: *P4VR* */
/* $Revision: 1.2 $ BY: Dhananjay Govekar       DATE: 05/03/07 ECO: *P5W3* */
/* CYB        LAST MODIFIED: 11-NOV-2011    BY* gbg *c1258*                   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/* (from icpkall.p) */
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
 
{us/gp/gpoidfcn.i}
{us/ca/cattdef2.i}
 
{us/px/pxmaint.i}
{us/px/pxphdef.i caisxr}
{us/px/pxphdef.i caparaxr}
 
define input parameter sodnbr like sod_nbr no-undo.
define input parameter sodln like sod_line no-undo.
 
define shared variable back_site like sr_site.
define shared variable cline as character.
define shared variable filter_loc like ld_loc.
define shared variable filter_status like is_status.
define shared variable filter_expire like ld_expire.
define shared variable display-messages as logical no-undo.
define shared variable eff_date  like glt_effdate.
 
define variable rejected like mfc_logical no-undo.
define variable found_reject like mfc_logical no-undo.
define variable any_rejected like mfc_logical no-undo.
define variable qty_to_all like wod_qty_all no-undo.
define variable all_this_loc like wod_qty_all no-undo.
define variable this_lot like ld_lot no-undo.
define variable oidParent as decimal no-undo.
 
define buffer ptmstr for pt_mstr.
define buffer lddet for ld_det.
 
for first icc_ctrl
 where icc_ctrl.icc_domain = global_domain no-lock: end.
 
for each pk_det
    where pk_det.pk_domain = global_domain and  pk_user = SessionUniqueID
no-lock:
 
   assign
      found_reject = no
      this_lot = ?
      qty_to_all = pk_qty.
 
   find first sr_wkfl
      where sr_domain = global_domain
      and   sr_userid = SessionUniqueID
      and   sr_lineid = cline + pk_part
      and   sr_site   = back_site
   no-lock no-error.
      if available sr_wkfl then qty_to_all = 0.
 
   if qty_to_all > 0 then do:
 
      for first pt_mstr
          where pt_mstr.pt_domain = global_domain and  pt_part = pk_part
      no-lock: end.
 
      if available pt_mstr and pt_sngl_lot then do:
 
         for first sr_wkfl
             where sr_wkfl.sr_domain = global_domain and  sr_userid = SessionUniqueID
              and sr_lineid = cline + pk_part
              and sr_qty > 0
         no-lock:
            this_lot = sr_lotser.
         end.
 
      end.
 
/*c1258*/ filter_loc = pk_loc.
      if icc_ascend then do:
 
         if icc_pk_ord <= 2 then do:
            {us/so/soisall.i &part = pk_part &site = back_site
               &sort1 = "(if icc_pk_ord = 1 then ld_loc else ld_lot)" }
         end.
 
         else do:
            {us/so/soisall.i &part = pk_part &site = back_site
               &sort1 = "(if icc_pk_ord = 3 then ld_date
                 else ld_expire)" }
         end.
 
      end.
 
      else do:
 
         if icc_pk_ord <= 2 then do:
            {us/so/soisall.i &part = pk_part &site = back_site
               &sort1 = "(if icc_pk_ord = 1 then ld_loc else ld_lot)"
               &sort2 = "descending"}
         end.
 
         else do:
            {us/so/soisall.i &part = pk_part &site = back_site
               &sort1 = "(if icc_pk_ord = 3 then ld_date else ld_expire)"
               &sort2 = "descending"}
         end.
 
      end.
 
   end.
 
   if qty_to_all <> 0 then do:
 
      find sr_wkfl  where sr_wkfl.sr_domain = global_domain and  sr_userid =
      SessionUniqueID
         and sr_lineid = cline + pk_part
         and sr_site = back_site
         and sr_loc = pk_loc
         and sr_lotser = ""
         and sr_ref = ""
      exclusive-lock no-error.
 
      {us/bbi/gprun.i ""icedit2.p""
         "(input ""ISS-WO"",
           input back_site,
           input pk_loc,
           input pk_part,
           input """",
           input """",
           input qty_to_all + if available sr_wkfl
                              then sr_qty else 0,
           input if available pt_mstr
                 then pt_um else """",
           input """",
           input """",
           output rejected)"}
 
      if rejected then do:
         found_reject = yes.
      end.
 
      else do:
 
         if not available sr_wkfl then do:
            create sr_wkfl. sr_wkfl.sr_domain = global_domain.
            assign
               sr_userid = SessionUniqueID
               sr_lineid = cline + pk_part
               sr_site = back_site
               sr_loc  = pk_loc
               sr_lot  = pk_lot.
 
          end.
 
         sr_qty = sr_qty + qty_to_all.
      end.
 
   end.
 
   if found_reject then do on endkey undo, retry:
      if display-messages then do:
         {us/bbi/pxmsg.i &MSGNUM=161 &ERRORLEVEL=2 &MSGARG1=pk_part}
      end.
      any_rejected = yes.
   end.
 
end.
 
if (not batchrun) and display-messages and any_rejected
   and c-application-mode <> "API" then pause.
