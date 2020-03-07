/* xxsoshpso.p - SHIPMENT PERFORMANCE DATA COLLECTION PROGRAM             */
/* soshpso.p - SHIPMENT PERFORMANCE DATA COLLECTION PROGRAM               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoshpso.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/*                                                                        */
/*                                                                        */
/* Revision: 1.6      BY: Steve Nugent       DATE: 10/15/01  ECO: *P003*  */
/* Revision: 1.7      BY: Dan Herman         DATE: 08/06/02  ECO: *P0D4*  */
/* Revision: 1.9      BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L*  */
/* $Revision: 1.2 $   BY: Jean Miller        DATE: 06/20/08  ECO: *R0VG*  */
/* CENTURY YUASA      LAST MODIFIED: 18-AUG-2011 BY: gbg *cy1044*          */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 2015-08-25     BY:  gbg *c1540*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end-----------------------------------------------------------*/
 
/*-----------------------------------------------------------------------
  Purpose: This program determines whether or not shipment performance
           data will be collected for shipment performance. This program
           is used by Sales Order Shipments (sosois.p), Pre-Shipper/
           Shipper Confirm (rcsois.p), RMA Maintenance (fsrmamt.p),
           RMA Shipments (fsrmash.p), Material Order Maintenance (fseomt.p)
           and Material Order Shipments (fseops.p).
------------------------------------------------------------------------*/
 
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
 
define input parameter sod_recid as recid no-undo.
define input parameter absid like abs_id no-undo.
define input parameter shipfrom like abs_shipfrom no-undo.
define input parameter shipperid like abs_par_id no-undo.
define input parameter using_shippers like mfc_logical no-undo.
define input parameter perf_ship_qty like sod_qty_ship no-undo.
define input parameter confirm_mode like mfc_logical no-undo.
define input parameter shipper_qty like abs_qty no-undo.
define input parameter pending_inv like mfc_logical no-undo.
 
define variable collect_data like mfc_logical initial no no-undo.
define variable current_release like mfc_logical no-undo.
define variable ship_lt like scc_ship_lt no-undo.
define variable sched_type like schd_type no-undo.
 
run collect_ship_data_yn
    (input sod_recid,
     output collect_data,
     output current_release,
     output ship_lt,
     output sched_type).
 
/*cy1044* start added code >>>>> */
if collect_data then do:
    {us/gp/gprunmo.i
       &program= ""xxsocrshp.p""
       &module="ASR"
       &param="""(input sod_recid,
                  input absid,
                  input shipfrom,
                  input shipperid,
                  input using_shippers,
                  input perf_ship_qty,
                  input confirm_mode,
                  input shipper_qty,
                  input pending_inv,
                  input current_release,
                  input ship_lt,
                  input sched_type)"""}
end. /* IF collect_data */
/*cy1044* end added code <<<<<< */

/*cy1044* start deleted code >>>>>
if collect_data then do:
    {us/gp/gprunmo.i
       &program= ""socrshp.p""
       &module="ASR"
       &param="""(input sod_recid,
                  input absid,
                  input shipfrom,
                  input shipperid,
                  input using_shippers,
                  input perf_ship_qty,
                  input confirm_mode,
                  input shipper_qty,
                  input pending_inv,
                  input current_release,
                  input ship_lt,
                  input sched_type)"""}
end. /* IF collect_data */
*cy1044* end deleted code <<<<<<<< */ 
 
         /* INTERNAL PROCEDURES */
 
PROCEDURE collect_ship_data_yn:
/*-----------------------------------------------------------------------------
  Purpose: This procedure determines whether or not shipment performance
           data needs to be collected for the sales order being processed.
           It also passes back information from the Performance Controls
           table (scc_mstr) that is needed for shipment performance data
           collection.
 
  Notes:
------------------------------------------------------------------------------*/
   define input parameter sod_recid as recid no-undo.
   define output parameter collect_data like mfc_logical no-undo.
   define output parameter current_release like mfc_logical no-undo.
   define output parameter ship_lt as integer no-undo.
   define output parameter sched_type like schd_type no-undo.
 
   define variable v_rma_iss as character no-undo.
   define variable v_seo as character no-undo.
 
   assign
      v_rma_iss = (getTermLabel("RMA-ISS",35))
      v_seo = (getTermlabel("SEO",35)).
 
   for first sod_det where recid(sod_det) = sod_recid
   no-lock: end.
 
   for first so_mstr where so_mstr.so_domain = global_domain
      and so_nbr = sod_nbr
      and so_compl_stat = ""
   no-lock: end.
 
   /* #1 MATCH SHIP-FROM, SHIP-TO, ITEM */
   for first scc_mstr where scc_mstr.scc_domain = global_domain and
            scc_customer_source = "1"   and
            scc_shipfrom = sod_site and
            scc_receive_addr = (if so_fsm_type = v_seo then so_cust
                                else so_ship) and
            scc_part = sod_part
   no-lock: end.
 
   if available scc_mstr then do:
     if ((sod_sched and scc_include_sched)                       or
        (not sod_sched and scc_include_so and sod_fsm_type = "") or
        (sod_fsm_type = v_rma_iss and scc_include_rma)           or
        (sod_fsm_type = v_seo and scc_include_mo))
        and scc_active
     then
          assign
            collect_data = yes
            current_release = scc_use_current
            ship_lt = scc_ship_lt
            sched_type = scc_sched_type
          .
     else collect_data = no.
     return.
   end. /* IF AVAILABLE scc_mstr */
 
   /* #2 MATCH SHIP-FROM AND SHIPTO */
   for first scc_mstr where scc_mstr.scc_domain = global_domain and
            scc_customer_source = "1"   and
            scc_shipfrom = sod_site  and
            scc_receive_addr = (if so_fsm_type = v_seo then so_cust
                                else so_ship) and
            scc_part = ""
   no-lock: end.
 
   if available scc_mstr then do:
     if ((sod_sched and scc_include_sched)                       or
        (not sod_sched and scc_include_so and sod_fsm_type = "") or
        (sod_fsm_type = v_rma_iss and scc_include_rma)           or
        (sod_fsm_type = v_seo and scc_include_mo))
        and scc_active
     then
          assign
            collect_data = yes
            current_release = scc_use_current
            ship_lt = scc_ship_lt
            sched_type = scc_sched_type
          .
     else collect_data = no.
     return.
   end. /* IF AVAILABLE scc_mstr */
 
   /* #3 MATCH SHIP-FROM AND ITEM */
   for first scc_mstr where scc_mstr.scc_domain = global_domain and
            scc_customer_source = "1"   and
            scc_shipfrom = sod_site  and
            scc_receive_addr = ""          and
            scc_part = sod_part
   no-lock: end.
 
   if available scc_mstr then do:
     if ((sod_sched and scc_include_sched)                       or
        (not sod_sched and scc_include_so and sod_fsm_type = "") or
        (sod_fsm_type = v_rma_iss and scc_include_rma)           or
        (sod_fsm_type = v_seo and scc_include_mo))
        and scc_active
     then
          assign
            collect_data = yes
            current_release = scc_use_current
            ship_lt = scc_ship_lt
            sched_type = scc_sched_type
          .
     else collect_data = no.
     return.
   end.
 
   /* #4 MATCH SHIP-TO AND ITEM */
   for first scc_mstr where scc_mstr.scc_domain = global_domain and
            scc_customer_source = "1"   and
            scc_shipfrom = "" and
            scc_receive_addr = (if so_fsm_type = v_seo then so_cust
                                else so_ship) and
            scc_part = sod_part
   no-lock: end.
 
   if available scc_mstr then do:
     if ((sod_sched and scc_include_sched)                       or
        (not sod_sched and scc_include_so and sod_fsm_type = "") or
        (sod_fsm_type = v_rma_iss and scc_include_rma)           or
        (sod_fsm_type = v_seo and scc_include_mo))
        and scc_active
     then
          assign
            collect_data = yes
            current_release = scc_use_current
            ship_lt = scc_ship_lt
            sched_type = scc_sched_type
          .
     else collect_data = no.
     return.
   end.
 
   /* #5 MATCH SHIP-FROM */
   for first scc_mstr where scc_mstr.scc_domain = global_domain and
            scc_customer_source = "1"   and
            scc_shipfrom = sod_site  and
            scc_receive_addr = "" and
            scc_part = ""
   no-lock: end.
 
   if available scc_mstr then do:
     if ((sod_sched and scc_include_sched)                       or
        (not sod_sched and scc_include_so and sod_fsm_type = "") or
        (sod_fsm_type = v_rma_iss and scc_include_rma)           or
        (sod_fsm_type = v_seo and scc_include_mo))
        and scc_active
     then
          assign
            collect_data = yes
            current_release = scc_use_current
            ship_lt = scc_ship_lt
            sched_type = scc_sched_type
          .
     else collect_data = no.
     return.
   end.
 
   /* #6 MATCH SHIP-TO */
   for first scc_mstr no-lock  where scc_mstr.scc_domain = global_domain and
            scc_customer_source = "1"   and
            scc_shipfrom = ""   and
            scc_receive_addr = (if so_fsm_type = v_seo then so_cust
                          else so_ship) and
            scc_part = "":
   end.
   if available scc_mstr then do:
     if ((sod_sched and scc_include_sched)                       or
        (not sod_sched and scc_include_so and sod_fsm_type = "") or
        (sod_fsm_type = v_rma_iss and scc_include_rma)           or
        (sod_fsm_type = v_seo and scc_include_mo))
        and scc_active
     then
          assign
            collect_data = yes
            current_release = scc_use_current
            ship_lt = scc_ship_lt
            sched_type = scc_sched_type
          .
     else collect_data = no.
     return.
   end.
 
   /* #7 MATCH ITEM */
   for first scc_mstr no-lock  where scc_mstr.scc_domain = global_domain and
            scc_customer_source = "1"   and
            scc_shipfrom = ""  and
            scc_receive_addr = "" and
            scc_part = sod_part:
   end.
   if available scc_mstr then do:
     if ((sod_sched and scc_include_sched)                       or
        (not sod_sched and scc_include_so and sod_fsm_type = "") or
        (sod_fsm_type = v_rma_iss and scc_include_rma)           or
        (sod_fsm_type = v_seo and scc_include_mo))
        and scc_active
     then
          assign
            collect_data = yes
            current_release = scc_use_current
            ship_lt = scc_ship_lt
            sched_type = scc_sched_type
          .
     else collect_data = no.
     return.
   end.
 
   /* #8 GLOBAL MATCH */
   for first scc_mstr no-lock  where scc_mstr.scc_domain = global_domain and
           scc_customer_source = "1"   and
           scc_shipfrom = "" and
           scc_receive_addr = "" and
           scc_part = "":
   end.
   if available scc_mstr then do:
     if ((sod_sched and scc_include_sched)                       or
        (not sod_sched and scc_include_so and sod_fsm_type = "") or
        (sod_fsm_type = v_rma_iss and scc_include_rma)           or
        (sod_fsm_type = v_seo and scc_include_mo))
        and scc_active
     then
          assign
            collect_data = yes
            current_release = scc_use_current
            ship_lt = scc_ship_lt
            sched_type = scc_sched_type
          .
     else collect_data = no.
     return.
   end.
 
   /* #9 IF NO MATCHES FOUND, USE CONTROL FILE VALUES */
   for first shpc_ctrl 
      where shpc_ctrl.shpc_domain = global_domain no-lock:
   end.
   if not available shpc_ctrl then do:
      create shpc_ctrl. shpc_ctrl.shpc_domain = global_domain.
      assign
         shpc_mod_userid = global_userid
         shpc_mod_date   = today.
   end.
 
   if ((sod_sched and shpc_include_sched)                           or
    (not sod_sched and shpc_include_do and sod_fsm_type = "") or
    (sod_fsm_type = v_rma_iss and shpc_include_rma)               or
    (sod_fsm_type = v_seo and shpc_include_mo))
    and shpc_active
   then
      assign
        collect_data = yes
        current_release = shpc_use_current
        ship_lt = 0
        sched_type = shpc_sched_type
      .
   else collect_data = no.
   return.
 
END PROCEDURE.
