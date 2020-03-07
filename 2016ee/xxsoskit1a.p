/* xxsoskit1a.p - DETAIL (HARD) ALLOCATION AND PICK LOGIC FOR KIT COMPONENTS  */
/* soskit1a.p - DETAIL (HARD) ALLOCATION AND PICK LOGIC FOR KIT COMPONENTS    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoskit1a.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/* (from soise02.p and icpkall.p)                                             */
/* REVISION: 8.6      LAST MODIFIED: 09/27/96   by: flm  *K003*               */
/* REVISION: 8.6      LAST MODIFIED: 12/05/96   BY: *K022* Dennis Henson      */
/* REVISION: 8.6      LAST MODIFIED: 07/28/97   BY: *K0H3* Taek-Soo Chang     */
/* REVISION: 8.6      LAST MODIFIED: 11/11/97   BY: *K18W* Taek-Soo Chang     */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/01/98   BY: *J2LW* Niranjan R.        */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 08/14/00   BY: *N0K6* Mudit Mehta        */
/* Revision: 1.10.1.3    BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00L*  */
/* Revision: 1.10.1.4    BY: Rajinder Kamra      DATE: 06/23/03  ECO: *Q003*  */
/* Revision: 1.10.1.5    BY: Vinay Soman         DATE: 04/12/04  ECO: *P1X9*  */
/* Revision: 1.10.1.6    BY: Vandna Rohira       DATE: 05/31/04  ECO: *P249*  */
/* Revision: 1.10.1.7    BY: Sachin Deshmukh     DATE: 08/04/04  ECO: *P2D7*  */
/* Revision: 1.10.1.8    BY: Gaurav Kerkar       DATE: 10/04/04  ECO: *Q0DP*  */
/* Revision: 1.10.1.9    BY: Tejasvi Kulkarni    DATE: 01/05/06  ECO: *P4CV*  */
/* Revision: 1.10.1.10   BY: Munira Savai        DATE: 04/27/06  ECO: *P4Q4*  */
/* $Revision: 1.2 $ BY: Dipanshu Talwar    DATE: 04/28/09  ECO: *Q2NV*  */
/* CYB   LAST MODIFIED: 21-SEP-2012    BY: gbg *c1343*                        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB   LAST MODIFIED: 08-MAY-2013    BY: gbg *c1403*                        */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
 
define temp-table tt-comp no-undo
   field tt-part   like pt_part
   field tt-qty    like ld_qty_all
   field tt-ordnbr like sod_nbr.

/* INPUT VARIABLES */
define input parameter so_recid as recid no-undo.
define input parameter sod_recid as recid no-undo.
define input parameter cline as character no-undo.
define input parameter ship_avail_qty as logical no-undo.
define input parameter process_type as integer no-undo.
define input parameter p_kit_all    like mfc_logical no-undo.
 
/* OUTPUT VARIABLES */
define input-output parameter least_factor as decimal no-undo.
define output parameter table for tt-comp.
define output parameter abnormal_exit as logical no-undo.
 
/* SHARED VARIABLES */
define new shared variable new_site like sod_site.
 
/* LOCAL VARIABLES */
define variable so_db like si_db no-undo.
define variable pm_code like pt_pm_code no-undo.
define variable this_lot like ld_lot no-undo.
define variable tot_sr_qty as decimal no-undo.
define variable qty_to_all like wod_qty_all no-undo.
define variable all_this_loc like wod_qty_all no-undo.
define variable ld_adj_qty like ld_qty_all no-undo.
define variable in_adj_qty like in_qty_all no-undo.
define variable err_flag as integer no-undo.
define variable qty_per as decimal no-undo.
define variable v_unpicked_qty like sod_qty_pick no-undo.
define variable open_qty like sod_qty_pick no-undo.
define variable l_abs_pick_qty like sod_qty_pick no-undo.
 
define variable l_avail_qoh    like ld_qty_all   no-undo.
define variable l_qty_ord      like ld_qty_all   no-undo.
define variable l_avail_alloc  like ld_qty_all   no-undo.
define variable l_qty_least    as decimal        no-undo.
 
define variable l_qty_already_all as decimal init 0 no-undo.
define variable l_qty_avail_all   like ld_qty_all   no-undo.
 
/* DEFINE BUFFERS */
define buffer lddet for ld_det.
 
so_db = global_db.
 
find first icc_ctrl  where icc_ctrl.icc_domain = global_domain no-lock.
find so_mstr no-lock where recid(so_mstr) = so_recid.
find sod_det no-lock where recid(sod_det) = sod_recid.
 
{us/op/openqty.i}
 
for each pk_det exclusive-lock  where pk_det.pk_domain = global_domain and
      pk_user = SessionUniqueID:
 
   this_lot = ?.
   qty_to_all = pk_qty.
   in_adj_qty = 0.
 
   qty_per = pk_qty / ( open_qty * sod_um_conv ).
 
   /* SET GLOBAL_DB USING SOD_SITE */
   new_site = sod_site.
   {us/bbi/gprun.i ""gpalias.p""}
 
   /* SWITCH TO THE INVENTORY SITE */
   if so_db <> global_db then do:
      {us/bbi/gprun.i ""gpalias2.p"" "(sod_site, output err_flag)"}
      if err_flag <> 0 and err_flag <> 9 then do:
         /* DOMAIN # IS NOT AVAILABLE */
 
         {us/bbi/pxmsg.i
            &MSGNUM=6137
            &ERRORLEVEL=4
            &MSGARG1=getTermLabel(""FOR_REMOTE_INVENTORY"",33)
            }
         abnormal_exit = true.
         return.
      end.
   end.
 
   /* CREATE DETAIL ALLOCATIONS & PICK LOGIC FOR KIT COMPONENTS */
   /* ADDED PARAMETER process_type                              */
 
   assign
     l_qty_least       = pk_qty
     l_qty_already_all = 0
     l_qty_avail_all   = 0.
 
   /* CALCULATE AVAILABLE QUANTITY FOR KIT ITEM */
   {us/bbi/gprun.i ""soskit11.p"" "(input  sod_det.sod_nbr,
                             input  string(sod_det.sod_line),
                             input  pk_part,
                             output l_qty_already_all)"}
 
   if can-find(first soc_ctrl
                  where soc_ctrl.soc_domain = global_domain
                    and soc_all_avl         = yes)
   then do:
 
      assign
         l_avail_qoh   = 0
         l_qty_ord     = 0
         l_avail_alloc = 0.
 
      /* CHECK FOR INVENTORY IN UNRESERVED LOCATIONS */
      {us/bbi/gprun.i ""gpgetavl.p"" "(input  pk_part,
                                input  sod_det.sod_site,
                                input  so_ship,
                                input  so_bill,
                                input  so_cust,
                                input  so_fsm_type,
                                output l_avail_qoh,
                                output l_qty_ord,
                                output l_avail_alloc,
                                input  sod_qty_ord,
                                input  sod_qty_ship)" }
 
      assign
         l_qty_least = min(l_qty_least, l_avail_alloc + l_qty_already_all)
         l_qty_avail_all = l_qty_already_all + l_avail_alloc.
 
   end. /* IF CAN-FIND(FIRST soc_ctrl */
   else do:
 
      l_avail_alloc = 0.
      for each ld_det
         where ld_det.ld_domain  = global_domain
           and ld_site           = sod_site
           and ld_part           = pk_part
      no-lock:

         assign
            l_avail_alloc    = (l_avail_alloc + ld_qty_oh) -
                               (ld_qty_all + l_qty_already_all)
            l_qty_avail_all  = l_qty_avail_all + l_qty_already_all +
                               ld_qty_oh - ld_qty_all.
 
      end. /* FOR EACH ld_det */
 
      l_qty_least = min(l_qty_least, l_avail_alloc).
 
   end. /* ELSE DO */
 
/*c1343*   {us/bbi/gprun.i ""soktall.p"" */
/*c1343*/  {us/bbi/gprun.i ""xxsoktall.p""
      "(input cline,
        input pk_part,
        input pk_qty,
        input process_type,
        input so_db,
        input sod_nbr,
        input sod_line,
        input-output qty_to_all,
        output abnormal_exit)"}
 
if p_kit_all
then do:
   find first tt-comp
      where tt-part   = pk_part
      and   tt-ordnbr = sod_nbr
   exclusive-lock no-error.

   if not available tt-comp
   then do:
      create tt-comp.
      assign
         tt-part   = pk_part
         tt-ordnbr = sod_nbr.
   end. /* IF NOT AVAILABLE tt-comp */

   tt-qty = l_qty_avail_all.

end. /* IF p_kit_all */

   /* SWITCH BACK TO THE SALES ORDER DOMAIN */
   if so_db <> global_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err_flag)"}
      if err_flag <> 0 and err_flag <> 9 then do:
         /* DOMAIN # IS NOT AVAILABLE */
 
         {us/bbi/pxmsg.i
            &MSGNUM=6137
            &ERRORLEVEL=4
            &MSGARG1=getTermLabel(""FOR_SALES_ORDERS"",33)
            }
         abnormal_exit = true.
         return.
      end.
   end.
 
   /* PUT BALANCE OF qty_to_all USING DEFAULT SITE & LOCATION   */
   /* BECAUSE THIS IS A BACKFLUSH QUANTITY                       */
 
   if qty_to_all > 0 and not ship_avail_qty then do:
      find sr_wkfl  where sr_wkfl.sr_domain = global_domain and  sr_userid
         = SessionUniqueID
         and sr_lineid = cline + pk_part
         and sr_site = sod_site
         and sr_loc = pk_loc
         and sr_lotser = ""
         and sr_ref = ""
         no-error.
      if not available sr_wkfl then do:
         create sr_wkfl.
         sr_wkfl.sr_domain = global_domain.
         assign
            sr_userid = SessionUniqueID
            sr_lineid = cline + pk_part
            sr_site = sod_site
            sr_loc  = pk_loc.
      end.
      sr_qty = sr_qty  +  qty_to_all.
   end.
 
   /* BASED ON THE "SHIP AVAIL QTY" LOGIC UPON RETURN TO soskit01.p*/
 
   if ship_avail_qty
   then do:
 
/*c1403* start added code */
      find first ld_det no-lock
      where ld_domain = global_domain
      and   ld_site = sod_site
      and   ld_part = pk_part
      and   can-find(first is_mstr
                     where is_domain = global_domain
                     and   is_status = ld_status
                     and   is_avail
                     and not is_frozen
                     and  is_overissue)
      no-error.
      if not available ld_det
      then do:
/*c1403* end   added code */
         pause 0 no-message. /*DO NOT REMOVE THIS INSTRUCTION*/
 
         if pk_qty - qty_to_all >= qty_per
         then
            least_factor = min(least_factor,
                               (truncate(l_qty_least / qty_per, 0))
                               * qty_per / pk_qty).
         else
            least_factor = 0.
/*c1403* start added code */
      end.   /* not available ld_det */
/*c1403* end   added code */
   end. /* IF ship_avail_qty */
 
   /* DELETE pk_det SINCE IT HAS BEEN REPLACED BY sr_wkfl */
   delete pk_det.
 
end. /* for each pk_det */
