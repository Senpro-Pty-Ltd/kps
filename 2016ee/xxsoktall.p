/* xxsoktall.p - DETAIL (HARD) ALLOCATION AND PICK LOGIC FOR KIT COMPONENTS  */
/* soktall.p - DETAIL (HARD) ALLOCATION AND PICK LOGIC FOR KIT COMPONENTS    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoktall.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/*                                                                           */
/* REVISION: 8.6      LAST MODIFIED: 09/25/96   by: flm  *K003*              */
/* REVISION: 8.6      LAST MODIFIED: 12/05/96   BY: *K022* Dennis Henson     */
/* REVISION: 8.6      LAST MODIFIED: 07/28/97   BY: *K0H3* Taek-Soo Chang    */
/* REVISION: 8.6      LAST MODIFIED: 11/1197    BY: *K18W* Suresh Nayak      */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6      LAST MODIFIED: 02/09/99   BY: *K1ZB* Reetu Kapoor      */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown        */
/* REVISION: 9.1      LAST MODIFIED: 12/28/00   BY: *L13Y* Kaustubh K.       */
/* REVISION: 9.1      LAST MODIFIED: 01/24/01   BY: *L14B* Satish Chavan     */
/* Revision: 1.5.1.9    BY: Russ Witt        DATE: 06/04/01 ECO: *P00J*      */
/* Revision: 1.5.1.10   BY: Kirti Desai      DATE: 05/22/01 ECO: *N0Y4*      */
/* Revision: 1.5.1.13   BY: Hareesh V.       DATE: 08/30/01 ECO: *M1G1*      */
/* Revision: 1.5.1.14   BY: Dipesh Bector    DATE: 03/05/02 ECO: *M1W0*      */
/* Revision: 1.5.1.15   BY: Rajaneesh S.     DATE: 03/09/02 ECO: *L13N*      */
/* Revision: 1.5.1.16   BY: Ashwini Ghaisas  DATE: 12/20/02 ECO: *N22G*      */
/* Revision: 1.5.1.17  BY: Rajaneesh S. DATE: 02/24/03 ECO: *N282* */
/* Revision: 1.5.1.19  BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L*    */
/* Revision: 1.5.1.20  BY: Rajinder Kamra     DATE: 06/23/03  ECO: *Q003*    */
/* Revision: 1.5.1.21  BY: Subramanian Iyer   DATE: 08/14/03  ECO: *P0ZR*    */
/* Revision: 1.5.1.22  BY: Xavier Prat        DATE: 06/15/06  ECO: *R03Q*    */
/* Revision: 1.5.1.23  BY: Xavier Prat        DATE: 07/13/06  ECO: *R079*    */
/* Revision: 1.5.1.24  BY: Amit Singh         DATE: 11/27/06  ECO: *P5GL*    */
/* Revision: 1.5.1.25     BY: Munira Savai        DATE: 02/28/07  ECO: *R0DY* */
/* Revision: 1.5.1.26     BY: Navjot Singh Azad   DATE: 05/21/08  ECO: *R0TH* */
/* Revision: 1.5.1.27     BY: Jean Miller         DATE: 06/21/08  ECO: *R0VG* */
/* $Revision: 1.2 $  BY: Xavier Prat         DATE: 02/23/09  ECO: *R1CX* */
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

{us/bbi/gplabel.i}

/* INPUT VARIABLES */
define input parameter cline as character no-undo.
define input parameter part like pk_part no-undo.
define input parameter pick_qty like pk_qty no-undo.
define input parameter process_type as integer no-undo.
define input parameter so_db like si_db no-undo.
define input parameter v_sod_nbr like sod_nbr no-undo.
define input parameter v_sod_line like sod_line no-undo.

/* INPUT-OUTPUT VARIABLES */
define input-output parameter qty_to_all like sod_qty_ord no-undo.

/* OUTPUT VARIABLES */
define output parameter abnormal_exit as logical no-undo.

/* LOCAL VARIABLES */
define variable pm_code like pt_pm_code no-undo.
define variable this_lot like ld_lot no-undo.
define variable tot_sr_qty as decimal no-undo.
define variable all_this_loc like wod_qty_all no-undo.
define variable ld_adj_qty like ld_qty_all no-undo.
define variable in_adj_qty like in_qty_all no-undo.
define variable err_flag as integer no-undo.
define variable old_global_db like global_db  no-undo.
define variable l_qty_avail   like in_qty_all no-undo.
define variable l_qty_pick    like in_qty_all no-undo.
define variable cust-to-allocate like so_cust extent 3 no-undo.
define variable i as integer no-undo.
define variable l_pick_qty    like in_qty_all  no-undo.
define variable trans-ok like mfc_logical no-undo.

/*DEFINE TEMP TABLE USED IN RESERVED LOCATION ALLOCATIONS */
define temp-table tt_resv_loc
   field tt_loc             like ld_loc
   field tt_primary_loc     like locc_primary_loc
   index tt_loc is unique primary
   tt_loc.

{us/so/sotmpdef.i}
{us/so/soabsdef.i}
/*c1403* start added code */
def var locdefault like pt_loc.
/*c1403* end   added code */

find first icc_ctrl  where icc_ctrl.icc_domain = global_domain no-lock.

for first so_mstr where so_mstr.so_domain = global_domain
   and so_nbr = v_sod_nbr
   and so_compl_stat = ""
no-lock:  end.

find sod_det where sod_det.sod_domain = global_domain
   and sod_nbr = v_sod_nbr
   and sod_line = v_sod_line
   and sod_compl_stat = ""
no-lock.

assign
   tot_sr_qty  = 0
   this_lot    = ?
   l_pick_qty  = pick_qty
   l_qty_avail = 0.

for each lad_det
    where lad_det.lad_domain = global_domain
   and  lad_dataset = "sob_det"
   and lad_nbr     = sod_nbr
   and lad_line    = string (sod_line)
   and lad_part    = part
exclusive-lock:

   assign tot_sr_qty = tot_sr_qty + lad_qty_all.
   if this_lot = ? and lad_qty_all > 0 then
      assign this_lot = lad_lot.

   /* CHANGED ALLOCATION LOGIC FOR KIT COMPONENTS */
   if process_type <> 5
   then do:

   /* CALL TO soktalla.p MOVED BELOW     */
   /* CHANGED THE SIXTH INPUT PARAMETER  */
   /* TO l_qty_pick FROM lad_qty_all     */

      if execname = "sososl.p"
      then do:

         create t_all_data.
         assign
            t_sod_nbr     = sod_nbr
            t_sod_line    = sod_line
            t_sod_all     = sod_qty_all
            t_sod_pick    = sod_qty_pick
            t_lad_dataset = lad_dataset
            t_lad_site    = lad_site
            t_lad_loc     = lad_loc
            t_lad_lot     = lad_lot
            t_lad_ref     = lad_ref
            t_lad_part    = lad_part
            t_lad_all     = lad_qty_all
            t_lad_pick    = lad_qty_pick
            t_det_all     = no.

      end. /* IF execname = "sososl.p" */

      l_qty_pick = 0.
      /* CREATE TEMP TABLE tmp_alloc_mstr FOR STORING */
      /* ACTUAL QUANTITY PICKED OF THE COMPONENT      */
      find tmp_alloc_mstr where
         tmp_order= lad_nbr  and
         tmp_line = lad_line and
         tmp_site = lad_site and
         tmp_loc  = lad_loc  and
         tmp_item = lad_part and
         tmp_lot  = lad_lot  and
         tmp_ref  = lad_ref exclusive-lock no-error.
      if not available tmp_alloc_mstr
      then do:
         create tmp_alloc_mstr.
         assign
            tmp_order= lad_nbr
            tmp_line = lad_line
            tmp_site = lad_site
            tmp_loc  = lad_loc
            tmp_item = lad_part
            tmp_lot  = lad_lot
            tmp_ref  = lad_ref.
      end. /* IF NOT AVAILABLE tmp_alloc_mstr */

      find in_mstr  where in_mstr.in_domain = global_domain and
         in_site = lad_site and
         in_part = lad_part exclusive-lock no-error.

      find ld_det  where ld_det.ld_domain = global_domain and
         ld_site = lad_site and
         ld_loc  = lad_loc  and
         ld_part = lad_part and
         ld_lot  = lad_lot  and
         ld_ref  = lad_ref exclusive-lock no-error.

      if available ld_det
      then do:
         if execname = "sososl.p"
         then
            t_ld_all = ld_qty_all.

         l_qty_avail = max(ld_qty_oh - ld_qty_all, 0).

      end. /* IF AVAILABLE ld_det */

      if l_pick_qty <= lad_qty_all
      then
         assign
            l_qty_pick   = min(lad_qty_all, l_pick_qty)
            lad_qty_all  = max(lad_qty_all  - l_pick_qty,0)
            lad_qty_pick = lad_qty_pick + l_qty_pick.
      else
         assign
            lad_qty_pick = lad_qty_pick + lad_qty_all
            l_qty_pick   = lad_qty_all
            lad_qty_all  = 0.

      assign
         l_pick_qty    = l_pick_qty - l_qty_pick
         tmp_qty       = l_qty_pick
         old_global_db = global_db.

      /* SWITCH TO THE SALES ORDER DOMAIN */
      if so_db <> old_global_db
      then do:
         {us/bbi/gprun.i ""gpalias3.p""
            "(input  so_db,
              output err_flag)"}

        if  err_flag <> 0
        and err_flag <> 9
        then do:
           {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                    &MSGARG1=getTermLabel(""FOR_SALES_ORDERS"",24)}
           abnormal_exit = true.
           return.
         end. /* IF err_flag <> 0 AND err_flag <> 9 */
      end. /* IF so_db <> old_global_db */

      {us/bbi/gprun.i ""soktalla.p""
         "(input lad_part,
           input lad_site,
           input lad_loc,
           input lad_lot,
           input lad_ref,
           input l_qty_pick,
           input cline)"}

      /* SWITCH BACK TO THE INVENTORY SITE */
      if so_db <> old_global_db
      then do:
         {us/bbi/gprun.i ""gpalias2.p""
            "(input  sod_site,
              output err_flag)"}

         if  err_flag <> 0
         and err_flag <> 9
         then do:
            {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4
                     &MSGARG1=getTermLabel(""FOR_REMOTE_INVENTORY"",24)}
            abnormal_exit = true.
            return.
         end. /* IF err_flag <> 0 AND err_flag <> 9 */
      end. /* IF so_db <> old_global_db */

   end. /* PROCESS_TYPE <> 5 and LAD_QTY_ALL > 0 */
end. /* FOR EACH LAD_DET */

assign
   qty_to_all = pick_qty - tot_sr_qty
   pick_qty   = qty_to_all
   in_adj_qty = 0.

/* CREATE DETAIL ALLOCATIONS */
if qty_to_all > 0 then do:

   find pt_mstr where pt_mstr.pt_domain = global_domain and  pt_part = part
   no-lock no-error.

   if available pt_mstr and pt_sngl_lot = no then
      this_lot = ?.

   /* AIM PICKING ONLY IF AIM MODULE HAS BEEN ACTIVATED  */
   /* AND (LOCATION IS AN ACTIVE "DUMMY" WHSE LOCATION   */
   /* OR LOCATION BELONGS TO AN ACTIVE WAREHOUSE)        */
   /* OTHERWISE STANDARD MFG/PRO PICKING                 */
   find LocM where LocM.Domain = global_domain
               and LocM.Site   = sod_site
               and LocM.Loc    = sod_loc
             no-lock no-error.

   if available LocM then
      find WhseM of LocM no-lock no-error.
   else
      find WhseM where WhseM.Domain = global_domain
                   and WhseM.Site   = sod_site
                   and WhseM.Whse   = sod_loc
                 no-lock no-error.

   /* AIM PICKING */
   if {us/wh/whgpwhon.i}
      and available WhseM and WhseM.Active
   then do:
      {us/gp/gprunmo.i &module="AIM"
                 &program="whpkctrl.p"
                 &param="""(input """"PICK-FAS"""",
                            sod_site,
                            sod_loc,
                            "''",
                            part,
                            this_lot,
                            "''",
                            """"sob_det"""",
                            sod_nbr,
                            string(sod_line),
                            so_db,
                            "string(process_type)",
                            no,
                            output abnormal_exit,
                            input-output qty_to_all,
                            no)"""}
   end.

   /* STANDARD PICKING */
   else do :
      if icc_ascend then do:
         if icc_pk_ord <= 2 then do:
/*c1343*    {us/so/soktall.i &part = part &site = sod_site */
/*c1343*/   {us/xx/xxsoktall.i &part = part &site = sod_site
               &sort1 = "(if icc_pk_ord = 1 then ld_loc else ld_lot)" }
         end.
         else do:
/*c1343*    {us/so/soktall.i &part = part &site = sod_site */
/*c1343*/   {us/xx/xxsoktall.i &part = part &site = sod_site
               &sort1 = "(if icc_pk_ord = 3
                          then ld_date else ld_expire)" }
         end.
      end.
      else do:
         if icc_pk_ord <= 2 then do:
/*c1343*    {us/so/soktall.i &part = part &site = sod_site */
/*c1343*/   {us/xx/xxsoktall.i &part = part &site = sod_site
               &sort1 = "(if icc_pk_ord = 1 then ld_loc else ld_lot)"
               &sort2 = "descending"}
         end.
         else do:
/*c1343*    {us/so/soktall.i &part = part &site = sod_site */
/*c1343*/   {us/xx/xxsoktall.i &part = part &site = sod_site
               &sort1 = "(if icc_pk_ord = 3 then ld_date else ld_expire)"
               &sort2 = "descending"}
         end.
      end.
   end.
end.

/* ADJUST in_mstr ALLOCATION BY PICKED LESS THE QUANTITY NOT */
/* THAT COULD NOT BE DETAIL ALLOCATED (qty_to_all)           */
if can-find(in_mstr
   where in_mstr.in_domain = global_domain
   and   in_part           = part
   and   in_site           = sod_site)
then do:
   find in_mstr
      where in_mstr.in_domain = global_domain
      and   in_part           = part
      and   in_site           = sod_site
      no-error.
   if available in_mstr
   then do:
      if sod_type <> "M"
      then
         in_qty_all = in_qty_all + pick_qty - qty_to_all.
   end. /* IF AVAILABLE in_mstr */
end. /* CAN-FIND(in_mstr .. ) */

/* -----------------------------------------------------  */
/*       I N T E R N A L      P R O C E D U R E S         */
/* -----------------------------------------------------  */

PROCEDURE detail-allocate:
   define buffer lddet for ld_det.

   allocate-proc:
   do:
      /* BYPASS ALLOCATION IS THIS IS A RESTRICTED TRANSACTION   */
      for first isd_det
      fields( isd_domain isd_status isd_tr_type isd_bdl_allowed)
       where isd_det.isd_domain = global_domain and  isd_status =
       ld_det.ld_status and isd_tr_type = "ISS-FAS"
      no-lock:
        if batchrun = no or (batchrun = yes and isd_bdl_allowed = no)
        then leave allocate-proc.
      end.

      if qty_to_all < ld_qty_oh - max(ld_qty_all,0)
      then all_this_loc = qty_to_all.
      else all_this_loc = ld_qty_oh - max(ld_qty_all,0).

/*c1403* start added code */
      find first is_mstr no-lock
      where is_domain = global_domain
      and   is_status = ld_status
      and   is_avail
      and   not is_frozen
      and   is_overissue
      no-error.
      if available is_mstr
      then do:
          all_this_loc = qty_to_all.
      end.

/*c1403* end   added code */

      if  process_type = 2
      and qty_to_all < ld_qty_oh - max(ld_qty_all,0)
      and qty_to_all < 0
      then
         all_this_loc = 0.

      if pt_mstr.pt_sngl_lot and all_this_loc < qty_to_all
      and this_lot = ?
      then do for lddet:
         for each lddet  where lddet.ld_domain = global_domain and (
         lddet.ld_site = sod_det.sod_site
         and lddet.ld_part = part
         and lddet.ld_lot = ld_det.ld_lot
         and lddet.ld_ref = ld_det.ld_ref
         and can-find(is_mstr  where is_mstr.is_domain = global_domain and (
         is_status = lddet.ld_status
         and is_avail = yes))
         and (ld_expire > today + icc_ctrl.icc_iss_days
         or ld_expire = ?)
         and lddet.ld_qty_oh - lddet.ld_qty_all > 0 ) :
            accum (lddet.ld_qty_oh - lddet.ld_qty_all) (total).
         end.

         if (accum total lddet.ld_qty_oh - lddet.ld_qty_all)
         >= qty_to_all
         then this_lot = ld_det.ld_lot.
      end.

      /*IF ALL AVAILABLE TO ALLOCATE OR NOT SINGLE LOT
        THEN CREATE LAD_DET*/
      if all_this_loc = qty_to_all or pt_sngl_lot = no
      or (this_lot <> ? and ld_lot = this_lot)
      then do:

         /* CREATE DETAIL ALLOCATION */
         find lad_det  where lad_det.lad_domain = global_domain and
         lad_dataset = "sob_det"
         and lad_nbr = sod_nbr and lad_line = string(sod_line) and
         lad_part = part and lad_site = sod_site
         and lad_loc = ld_loc and lad_lot = ld_lot
         and lad_ref = ld_ref
         no-error.

         /*IF SNGL LOT AND LAD EXISTS THEN ALLOCATE ALL
           TO EXISTING LAD_DET                            */
         if not available lad_det then do:
            create lad_det. lad_det.lad_domain = global_domain.
            assign
               lad_dataset = "sob_det"
               lad_nbr = sod_nbr
               lad_line = string(sod_line)
               lad_site = sod_site
               lad_loc = ld_loc
               lad_part = part
               lad_lot = ld_lot
               lad_ref = ld_ref.
         end.

         if  execname   = "rcshwb.p"
         and pt_lot_ser = "s"
         then do:
            {us/bbi/gprun.i ""gplotwup.p"" "(ld_det.ld_lot,
                                      part,
                                      output trans-ok)"}

            if not trans-ok
            then
               undo, retry.
         end. /* IF execname .... */


         /* CREATE THE TEMP-TABLE TO STORE THE VALUES OF lad_det, ld_det */
         /* AND sod_det BEFORE THEY ARE UPDATED BY NEW VALUES            */

         if execname = "sososl.p"
/*c1403*/ or execname = "xxsosl.p"
         then do:
            create t_all_data.
            assign
               t_sod_nbr     = sod_nbr
               t_sod_line    = sod_line
               t_sod_all     = sod_qty_all
               t_sod_pick    = sod_qty_pick
               t_ld_all      = all_this_loc
               t_lad_dataset = lad_dataset
               t_lad_site    = lad_site
               t_lad_loc     = lad_loc
               t_lad_lot     = lad_lot
               t_lad_ref     = lad_ref
               t_lad_part    = lad_part
               t_lad_all     = lad_qty_all
               t_lad_pick    = lad_qty_pick.
         end. /* IF execname  = sososl.p */

         if process_type <> 5 then do:
            /* SWITCH BACK TO THE SALES ORDER DOMAIN */
            old_global_db = global_db.
            if so_db <> global_db then do:
               {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err_flag)"}
               if err_flag <> 0 and err_flag <> 9 then do:
                  /* DOMAIN # IS NOT AVAILABLE */
                  {us/bbi/pxmsg.i &MSGNUM=6137
                           &ERRORLEVEL=4
                           &MSGARG1=getTermLabel(""FOR_SALES_ORDERS"",24)}
                  abnormal_exit = true.
                  return.
               end.
            end.

            /* CREATE sr_wkfl RECORDS FOR COMPONENT RECORDS */
            {us/bbi/gprun.i ""soktalla.p""
            "(input ld_part,
              input ld_site,
              input ld_loc,
              input ld_lot,
              input ld_ref,
              input all_this_loc,
              input cline)"}

            /* SWITCH TO THE INVENTORY SITE */
            if old_global_db <> global_db then do:
               {us/bbi/gprun.i ""gpalias2.p"" "(sod_site, output err_flag)"}
               if err_flag <> 0 and err_flag <> 9 then do:
                  /* DOMAIN # IS NOT AVAILABLE */
                  {us/bbi/pxmsg.i &MSGNUM=6137
                           &ERRORLEVEL=4
                           &MSGARG1=getTermLabel(""FOR_REMOTE_INVENTORY"",24)}

                  abnormal_exit = true.
                  return.
               end.
            end.
         end. /* if process_type <> 5 */

         /* UPDATE VALUES */
         ld_qty_all = ld_qty_all + all_this_loc.

         /* REPLACE QTY PICKED FOR THIS COMPONENT, IT ONLY OCCURS  */
         /* ONCE FOR A pk_det RECORD - DO NOT INCREMENT THE        */
         /* EXISTING QTY                                           */

         /*  CHANGED THE FORMAULA BECAUSE EARLIER WHEN 2 SHIPPERS  */
         /* WERE ADDE THEN IN lad_det THE lad_qty_pick WAS         */
         /* OVERWRITTEN WITH THE QTY OF THE SECOND SHIPPER INSTEAD */
         /* OF ACCUMULATING.                                       */

         if process_type = 5
         then do:
            if sod_type <> "M"
            then
               lad_qty_all  =  lad_qty_all  + all_this_loc.
         end. /* IF process_type = 5 */
         else
            lad_qty_pick =  lad_qty_pick + all_this_loc.
            qty_to_all = qty_to_all - all_this_loc.

         if execname = "rcshwb.p"
         then do:
            find first tmp_alloc_mstr
               where tmp_order = lad_nbr
                 and tmp_line  = lad_line
                 and tmp_item  = lad_part
                 and tmp_site  = lad_site
                 and tmp_loc   = lad_loc
                 and tmp_lot   = lad_lot
                 and tmp_ref   = lad_ref
               exclusive-lock no-error.

            if available tmp_alloc_mstr
            then
               tmp_qty = tmp_qty + all_this_loc.
         end. /* IF execname = "rcshwb.p" */

      end. /* if all_this_loc = qty_to_all or pt_sngl_lot = no... */
   end. /* do block */
END PROCEDURE.    /* detail-allocate  */
