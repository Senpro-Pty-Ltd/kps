/* xxsocrshp.p - PROGRAM TO CREATE SHIPMENT PERFORMANCE RECORDS         */
/* socrshp.p - PROGRAM TO CREATE SHIPMENT PERFORMANCE RECORDS           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsocrshp.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*                                                                      */
/*-----------------------------------------------------------------------
  DESCRIPTION: This program collects shipment performance data when a
               1) Sales Order or 2) Scheduled Sales Order or 3) RMA or
               4) Pending Invoice or 5) Material Order is shipped. The
               program creates shipment performance history records
               (shp_hist) and shipment performance history detail
               records (shpd_hist). This program also deletes and creates
               Shipment Performance reason/comment records (sosr_mstr
               and sosrd_det). If a reason code/comment is entered on
               a shipper a sosr_mstr and sosrd_det is created. The
               information in those files is put into shpd_hist and the
               sosr_mstr and sosrd_det are deleted in this program. If
               a shipper is being unconfirmed and the shpd_hist record(s)
               have reason code/comment information then the sosr_mstr
               and sosrd_det records will be re-created in this program.
------------------------------------------------------------------------------*/
/* Revision: 1.66  BY: Steve Nugent                DATE: 03/05/01 ECO: *P003* */
/* Revision: 1.67  BY: Santhosh Nair               DATE: 07/25/02 ECO: *P0C6* */
/* Revision: 1.69  BY: Paul Donnelly (SB)          DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.70  BY: Ed van de Gevel             DATE: 09/18/03 ECO: *Q03K* */
/* Revision: 1.71  BY: Somesh Jeswani              DATE: 06/03/04 ECO: *P24T* */
/* Revision: 1.72  BY: Nishit V                    DATE: 06/17/04 ECO: *P266* */
/* Revision: 1.73  BY: Manish Dani                 DATE: 06/28/04 ECO: *P271* */
/* Revision: 1.74  BY: Nishit V                    DATE: 07/01/04 ECO: *P27Y* */
/* Revision: 1.75  BY: Ellen Borden                DATE: 02/01/06 ECO: *R002* */
/* Revision: 1.76  BY: Ambrose Almeida             DATE: 06/21/06 ECO: *P4VD* */
/* Revision: 1.79  BY: Masroor Alam                DATE: 03/12/07 ECO: *P5R0* */
/* Revision: 1.80  BY: Munira Savai                DATE: 06/29/07 ECO: *P5ZY* */
/* Revision: 1.81  BY: Dilip Manawat               DATE: 08/24/07 ECO: *P5WN* */
/* Revision: 1.83  BY: Anju Dubey                  DATE: 01/14/08 ECO: *P6C8* */
/* Revision: 1.89        BY: Vivek Kamath         DATE: 04/09/08  ECO: *P6QD* */
/* Revision: 1.90        BY: Jean Miller          DATE: 06/18/08  ECO: *R0VD* */
/* CENTURY YUASA      LAST MODIFIED: 18-AUG-2011 BY: gbg *cy1044*          */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 13-DEC-2011    BY:  gbg *c1021b*                    */
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
 
{us/bbi/mfdeclre.i}
 
{us/rc/rcwabsdf.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i gpumxr}
{us/px/pxphdef.i sosodxr}
/* CHANGES MADE IN THIS PROGRAM MAY ALSO NEED TO BE MADE IN dscrshp.p */
 
define input parameter sod_recid as recid no-undo.
define input parameter absid like abs_mstr.abs_id no-undo.
define input parameter shipfrom like abs_mstr.abs_shipfrom no-undo.
define input parameter shipperid like abs_mstr.abs_par_id no-undo.
define input parameter using_shippers like mfc_logical no-undo.
define input parameter perf_ship_qty like sod_qty_ship no-undo.
define input parameter confirm_mode like mfc_logical no-undo.
define input parameter shipper_qty like abs_mstr.abs_qty no-undo.
define input parameter pending_inv like mfc_logical no-undo.
define input parameter current_release like mfc_logical no-undo.
define input parameter ship_lt like scc_ship_lt no-undo.
define input parameter sched_type like schd_type no-undo.
 
define variable due_status_code like sttqd_status_code no-undo.
define variable req_status_code like sttqd_status_code no-undo.
define variable perf_status_code like sttqd_status_code no-undo.
define variable due_time as integer no-undo.
define variable req_time as integer no-undo.
define variable perf_time as integer no-undo.
define variable days_diff as integer no-undo.
define variable elapse as integer no-undo.
define variable tot-elapsed-time as integer no-undo.
define variable sched_work_time as character no-undo.
define variable hour_work_time as character no-undo.
define variable qty_status as integer no-undo.
define variable qty_status_code like sttqd_status_code no-undo.
define variable qty_status_percent like shp_qty_pct no-undo.
define variable rel_id like schd_rlse_id no-undo.
define variable ship_qty like abs_mstr.abs_qty no-undo.
define variable ship_um like sod_um no-undo.
define variable ship_um_conv like sod_um_conv no-undo.
define variable ship_date like abs_shp_date no-undo.
define variable qty_open like schd_cum_qty no-undo.
define variable time_reason like shpd_rsn_code no-undo.
define variable qty_reason like shpd_rsn_code no-undo.
define variable cmmt_index like shp_cmtindx no-undo.
define variable avail_status_code like mfc_logical no-undo.
define variable cust_source like shp_customer_source no-undo.
define variable due_acceptable like shpd_acceptable no-undo.
define variable req_acceptable like shpd_acceptable no-undo.
define variable perf_acceptable like shpd_acceptable no-undo.
define variable qty_acceptable like shpd_acceptable no-undo.
define variable sched_date like schd_date no-undo.
define variable sched_time like schd_time no-undo.
define variable current_time as character no-undo.
define variable work_time as character no-undo.
define variable using_sequence_schedules like mfc_logical
   initial no no-undo.
define variable arrival_time as character     no-undo.
define variable arrival_date as date          no-undo.
define variable return_status as character    no-undo.
define variable trans_lt as decimal           no-undo.
define variable old_shipper  like shp_abs_id   no-undo.
define variable first_time   like mfc_logical   no-undo.
define variable days      as integer initial 1 no-undo.
define variable hours     as integer initial 2 no-undo.
define variable l_cumulative like mfc_logical   no-undo.
define variable l_abs        as   recid         no-undo.
define variable l_pcr_open_qty  like schd_cum_qty no-undo.
define variable l_pcr_ship_qty  like schd_cum_qty no-undo.
define variable l_remain_qty    like schd_cum_qty no-undo.
define variable l_tot_shipped   like schd_cum_qty no-undo.
define variable l_qty2b_shipped like schd_cum_qty no-undo.
define variable l_shp_um_cnv    like shp_ship_um_conv no-undo.
 
define new shared variable l_inc_wkend_shpcal like so_incl_iss no-undo.
 
define temp-table temp_absr no-undo
   field t_absrnbr     like absr_nbr
   field t_absrline    like absr_line
   field t_absropen    like absr_qty
   field t_absrship    like absr_qty
   field t_absrdate    like absr_date
   field t_absrtime    like schd_time
   field t_absrrelease like sch_rlse_id
   field t_absrref     like absr_reference.
  
/* CHECK TO SEE IF CUSTOMER SEQUENCE SCHEDULES IS INSTALLED */
{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'enable_sequence_schedules',
     input '',
     input '',
     input 'rcf_ctrl',
     output using_sequence_schedules)"}
 
/* CHECK TO SEE IF WE ARE UNCONFIRMING A PREVIOUS SHIPMENT.*/
/* IF WE ARE, THEN DELETE SHIPMENT HISTORY RECORDS FOR     */
/* THE SHIPPER BEING UNCONFIRMED.                          */
/* ALSO RE-CREATE REASON CODE/COMMENT RECORDS FOR THE      */
/* BEING UNCONFIRMED.                                      */
if not confirm_mode then do:
   for each shp_hist
      where shp_domain   = global_domain
      and   shp_shipfrom = shipfrom
      and   shp_abs_id   = shipperid
   exclusive-lock:
 
      for each shpd_hist exclusive-lock  where shpd_hist.shpd_domain =
            global_domain and
            shpd_tran_id = shp_tran_id:
 
         if old_shipper <> shp_abs_id then
            first_time = yes.
         else
            first_time = no.
 
         if (shp_cmtindx <> 0  or
            shpd_rsn_code <> "") and
            first_time then do:
 
            create sosr_mstr.
            
            assign
               sosr_domain = global_domain
               sosr_nbr = shp_nbr
               sosr_line = shp_line
               sosr_abs_id = shp_abs_id
               sosr_cmtindx = shp_cmtindx
               old_shipper = shp_abs_id
               sosr_shipfrom = shipfrom
               sosr_mod_date   = today
               sosr_mod_userid = global_userid.
 
         end.
         if shpd_rsn_code <> ""
            and not can-find (first sosrd_det
                                 where sosrd_domain   = global_domain
                                 and   sosrd_nbr      = sosr_nbr
                                 and   sosrd_line     = sosr_line
                                 and   sosrd_shipfrom = sosr_shipfrom
                                 and   sosrd_abs_id   = sosr_abs_id
                                 and   sosrd_measurement_type
                                                      = shpd_measurement_type
                                 and   sosrd_dataset  = "abs_mstr")
         then do:
            create sosrd_det.
            sosrd_det.sosrd_domain = global_domain.
            assign
               sosrd_nbr = sosr_nbr
               sosrd_line = sosr_line
               sosrd_abs_id = sosr_abs_id
               sosrd_shipfrom = sosr_shipfrom
               sosrd_measurement_type = shpd_measurement_type
               sosrd_dataset = "abs_mstr"
               sosrd_rsn_code = shpd_rsn_code
               sosrd_mod_date   = today
               sosrd_mod_userid = global_userid.
         end. /* IF shpd_rsn_code <> "" and NOT CAN-FIND (FIRST sosrd_det..*/
 
         delete shpd_hist.
      end.
 
      delete shp_hist.
 
   end. /* FOR EACH shp_hist */
end. /* IF NOT confirm_mode */
else do:
 
   /* INITIALIZE VARIABLES */
   assign
      time_reason = ""
      qty_reason = ""
      cmmt_index = 0.
 
   for first sod_det where recid(sod_det) = sod_recid
   no-lock: end.
 
   for first so_mstr where so_mstr.so_domain = global_domain
      and so_nbr = sod_nbr
      and so_compl_stat = ""
   no-lock:
      assign
         l_cumulative       = so_cum_acct
         l_inc_wkend_shpcal = so_incl_iss.
   end.
 
   for first abs_mstr
      where abs_mstr.abs_domain = global_domain
      and   abs_shipfrom        = shipfrom
      and   abs_id              = absid
   no-lock:
   l_abs = recid(abs_mstr).
   end.
   if available abs_mstr then do:
 
      assign
         ship_qty     = shipper_qty
         ship_um      = abs__qad02
         ship_um_conv = decimal(abs__qad03)
         qty_open     = sod_qty_ord - perf_ship_qty.

/*c1021b* start added code */
      if sod__dec02 <> 0
      then do transaction:
          if sod_bo_chg = 0 then qty_open = sod__dec02.
          find current sod_det exclusive-lock no-error.
          if available sod_det then do:
             sod__dec02 = 0.0.
          end.
      end.
/*c1021b* end   added code */



 
      /* GET REASON CODES IF THEY HAVE BEEN ENTERED PRIOR TO      */
      /* SHIPMENT. ALSO, GET COMMENTS ASSOCIATED TO REASON        */
      /* CODES SO THAT THEY CAN BE ADDED TO THE SHIPMENT          */
      /* PEFORMANCE RECORD.                                       */
 
      /* TIME REASON CODE */
      run get_reason_code
         (input abs_order,
         input abs_line,
         input substring(abs_par_id,2,20),
         input abs_shipfrom,
         input 1,
         input "abs_mstr",
         output time_reason,
         output cmmt_index).
 
      /* QUANTITY REASON CODE */
      run get_reason_code
         (input abs_order,
         input abs_line,
         input substring(abs_par_id,2,20),
         input abs_shipfrom,
         input 2,
         input "abs_mstr",
         output qty_reason,
         output cmmt_index).
 
   end. /* IF AVAILABLE abs_mstr */
 
/*cy1044* start deleted code >>>>
   if not using_shippers then
   assign
      ship_qty = sod_qty_chg
      ship_um = sod_um
      ship_um_conv = sod_um_conv
      qty_open = (if pending_inv then sod_qty_chg + sod_bo_chg
      else (if sod_bo_chg = 0 then sod_qty_chg
      else sod_qty_ord - sod_qty_ship)).
*cy1044* end deleted code <<<<<<< */


/*cy1044 start added code */
   if not using_shippers then
   assign
      ship_qty = sod_qty_chg
      ship_um = sod_um
      ship_um_conv = sod_um_conv
      qty_open = (if pending_inv then sod_qty_chg + sod_bo_chg
      else (if sod_bo_chg = 0 then sod_qty_ord 
      else sod_qty_ord )).

/*c1021b* start added code */
      if sod__dec02 <> 0
      then do transaction:
          if sod_bo_chg = 0 then qty_open = sod__dec02.
          find current sod_det exclusive-lock no-error.
          if available sod_det then do:
             sod__dec02 = 0.0.
          end.
      end.
/*c1021b* end   added code */

/*cy1044 end   added code */


 
   /* ACCOUNT FOR WHEN THE SHIP DATE IS BLANK. IF IT IS THEN  */
   /* SET THE VARIABLE ship_date EQUAL TO TODAY'S DATE        */
 
   if so_ship_date = ? then
      ship_date = today.
   else
      ship_date = so_ship_date.
 
   /* PROCESS SEQUENCE SCHEDULES IF SCHEDULED ORDER IS MARKED */
   /* AS SEQUENCED (so_seq_order = yes).                      */
   if sod_sched and using_sequence_schedules then do:
      if so_seq_order then do:
         for first abss_det where
            abss_det.abss_domain = global_domain and
            abss_ship_id = string("s" + shipperid)  and
            abss_part = abs_item:
         end. /* FOR FIRST abss_det */
         if available abss_det then do:
            for first rcs_mstr no-lock
               where rcs_mstr.rcs_domain = global_domain and
               rcs_shipfrom = abss_shipfrom  and
               rcs_shipto   = abss_shipto    and
               rcs_rlse_id  = abss_rlse_id:
            end. /* FOR FIRST rcs_mstr */
            if available rcs_mstr then do:
               trans_lt = decimal(substring(so_conrep,2,6)).
 
               if rcs_date_type then
               /* SHIP DATES */
               assign
                  sched_date = abss_date
                  sched_time = abss_time.
               else do:
                  /* DELIVERY DATES */
 
                  {us/bbi/gprun.i ""rcshipdt.p""
                     "(input rcs_shipfrom,
                       input rcs_shipto,
                       input abss_date,
                       input abss_time,
                       input trans_lt,
                       input 0,
                       output sched_date,
                       output sched_time,
                       output arrival_date,
                       output arrival_time,
                       output return_status)"}
 
               end. /* ELSE DO */
            end. /* IF AVAILABLE rcs_mstr */
 
            /* DETERMINE THE OPEN QTY FOR THE SEQUENCE SCHEDULE */
            for each rcsd_det no-lock  where rcsd_det.rcsd_domain =
                  global_domain and
                  rcsd_shipfrom = rcs_shipfrom       and
                  rcsd_shipto = rcs_shipto           and
                  rcsd_rlse_id = rcs_rlse_id         and
                  rcsd_part = abs_item               and
                  rcsd_date = abss_date              and
                  rcsd_time = abss_time              and
                  rcsd_cust_job >= abss_cust_job     and
                  rcsd_cust_seq >= abss_cust_seq     and
                  (not rcsd_deleted)                 and
                  (not rcsd_x_referenced):
 
               accumulate rcsd_discr_qty (total).
 
            end. /* FOR EACH rcsd_det */
 
            assign
               qty_open = accumulate total rcsd_discr_qty
               qty_open = qty_open * ship_um_conv
               rel_id = abss_rlse_id.
 
         end. /* IF AVAILABLE abss_det*/
      end. /* IF so_seq_order */
   end. /* IF sod_sched AND using_sequence_schedules */
   /* IF SCHEDULE ORDER IS NOT SEQUENCED THEN PROCESS AS */
   /* A REGULAR SCHEDULE.                                */
   if sod_sched and not so_seq_order then do:
      if not l_cumulative
         then
      run process_req_schedules
         (input sod_recid,
         input ship_qty,
         input sched_date,
         input ship_date,
         input sched_time,
         input rel_id,
         input qty_open).
      else
      run process_schedules
         (input  recid(sod_det),
         output rel_id,
         output qty_open,
         output sched_date,
         output sched_time).
 
      qty_open = qty_open * ship_um_conv.
   end. /* IF sod_sched AND NOT using_sequence schedules */
 
   /* ACCOUNT FOR THE POSSIBILITY THAT SALES ORDER DATES MIGHT */
   /* BE BLANK. IF THIS IS THE CASE, THE ORDER DATES WILL BE   */
   /* SET EQUAL TO THE SHIP DATE.                              */
 
   /* FOR MATERIAL ORDERS, THERE IS NO PERFORMANCE DATE. RATHER THAN */
   /* LEAVING IT BLANK OR SETTING IT TO THE SHIP DATE, WE WILL       */
   /* SET IT TO BE THE DUE DATE OF THE MATERIAL ORDER.               */
 
   if sod_due_date = ? then
      sod_due_date = ship_date.
 
   if sod_req_date = ? then
      sod_req_date = ship_date.
 
   if sod_per_date = ? and so_fsm_type = "SEO" then
      sod_per_date = sod_due_date.
   else do:
      if sod_per_date = ? then
         sod_per_date = ship_date.
   end. /* ELSE DO */
 
   /* GET STATUS CODES RELATED TO TIME AND QTY */
 
   /* INITIALIZE VARIABLES */
   assign
      cust_source         = "1"
      due_status_code     = ""
      req_status_code     = ""
      perf_status_code    = ""
      due_time            = (ship_date - sod_due_date) * 86400
      req_time            = ((ship_date - sod_req_date) + ship_lt) * 86400
      perf_time           = ((ship_date - sod_per_date) + ship_lt) * 86400
      work_time           = string(time,"HH:MM")
      current_time        = substring(work_time,1,2) + substring(work_time,4,2)
      qty_status_code     = ""
      qty_status_percent  = 0.
 
   if sod_sched then do:
      sched_work_time = substring(sched_time,1,2) +
         substring(sched_time,3,2).
 
      if sched_work_time <> "" then
         hour_work_time =  string(time,"HH:MM").
      else
         hour_work_time = "".
 
      assign
         days_diff = sched_date - ship_date
         elapse = (integer(substring(sched_work_time,1,2))  -
         integer(substring(hour_work_time,1,2))) * 60 * 60
         elapse = elapse + (integer(substring(sched_work_time,3,2))  -
         integer(substring(hour_work_time,4,2))) * 60
         elapse = elapse / 60
         tot-elapsed-time = ((days_diff - 1) * 1440) + (1440 + elapse)
         tot-elapsed-time = 0 - (tot-elapsed-time * 60)
         qty_status = qty_open - (ship_qty * ship_um_conv).
 
      /* FIND TIME STATUS CODE RECORD */
      /* SCHED DATE */
      if sched_time > "" then do:
         run get_time_status_code
            (input tot-elapsed-time,
            input so_ship,
            input sod_site,
            input sod_part,
            input hours,
            output due_status_code,
            output due_acceptable,
            output avail_status_code).
      end. /*if sched_time> ""*/
      else avail_status_code = no.
 
      if not avail_status_code then do:
 
         /* IF SHIPPING ON THE SAME DAY THE MATERIAL IS DUE     */
         /* AND NOT MEASURING SHIPMENTS BY THE HOUR             */
         /* THEN SET THE VARIABLE tot-elapsed-time TO BE ZERO   */
         /* SO THAT THE TOTAL ELAPSED TIME REPRESENTS THAT THE  */
         /* SHIP DATE AND THE DUE DATE ARE THE SAME DAY.        */
         if days_diff = 0 then tot-elapsed-time = 0.
 
         run get_time_status_code
            (input tot-elapsed-time,
            input so_ship,
            input sod_site,
            input sod_part,
            input days,
            output due_status_code,
            output due_acceptable,
            output avail_status_code).
      end.
 
      /* FIND QTY STATUS CODE RECORD */
      run get_qty_status_code
         (input qty_status,
         input so_ship,
         input sod_site,
         input sod_part,
         input qty_open,
         input ship_qty,
         input ship_um_conv,
         input sod_um_conv,
         output qty_status_code,
         output qty_status_percent,
         output qty_acceptable).
 
      if qty_open > 0
      then do:
         create shp_hist.
         shp_hist.shp_domain = global_domain.
 
         /* GET NEXT SEQUENCE/TRANSACTION NUMBER */
         {us/mf/mfrnseq.i shp_hist shp_hist.shp_tran_id shp_seq01}
 
         assign
            shp_customer_source = cust_source
            shp_cust = so_cust
            shp_shipto = so_ship
            shp_nbr = sod_nbr
            shp_line = sod_line
            shp_part = sod_part
            shp_ship_um = ship_um
            shp_ord_um = sod_um
            shp_currency = so_curr
            shp_cust_part = sod_custpart
            shp_shipfrom = sod_site
            shp_abs_id = shipperid
            shp_open_qty = qty_open
            shp_ext_price = (sod_price * shp_open_qty)
            shp_ship_qty = ship_qty
            shp_ship_price = ship_qty * sod_price
            shp_due_date = sched_date
            shp_req_date = shp_due_date
            shp_perf_date = shp_due_date
            shp_ship_date = ship_date
            shp_sched_time = sched_time
            shp_ship_time = current_time
            shp_include = yes
            shp_mod_date = today
            shp_mod_userid = global_userid
            shp_rel_id = rel_id
            shp_cmtindx = cmmt_index
            shp_order_category = sod_order_category
            shp_qty_pct = qty_status_percent.
 
        if recid(shp_hist) = -1 then .
 
        {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                       &HANDLE=ph_gpumxr
                       &PARAM="(input shp_part,
                                input shp_ship_um,
                                input shp_ord_um,
                                output l_shp_um_cnv)"
                       &NOAPPERROR=True
                       &CATCHERROR=True}
 
        if l_shp_um_cnv <> ?
        then
           shp_ship_um_conv = l_shp_um_cnv.
        else
           shp_ship_um_conv = 1.
 
         /* CREATE shpd_hist FOR TIMELINESS */
         if due_status_code <> "" or time_reason <> "" then do:
 
            /* DUE DATE */
            run create_shpd_hist
               (input shp_tran_id,
               input 1,
               input due_status_code,
               input due_acceptable,
               input 1,
               input time_reason,
               input 1 /* shiptime */ ).
 
            /* REQUIRED DATE */
            run create_shpd_hist
               (input shp_tran_id,
               input 1,
               input due_status_code,
               input due_acceptable,
               input 2,
               input time_reason,
               input 1 /* shiptime */ ).
 
            /* PERFORMANCE DATE */
            run create_shpd_hist
               (input shp_tran_id,
               input 1,
               input due_status_code,
               input due_acceptable,
               input 3,
               input time_reason,
               input 1 /* shiptime */ ).
 
         end.
 
         /* CREATE shpd_hist FOR COMPLETENESS */
         if qty_status_code <> "" or qty_reason <> "" then do:
            run create_shpd_hist
               (input shp_tran_id,
               input 2,
               input qty_status_code,
               input qty_acceptable,
               input 4,
               input qty_reason,
               input 2 /* shipqty */ ).
         end.
      end. /* IF qty_open > 0 */
 
   end. /* IF sod_sched */
   else do:
      /* FIND TIME STATUS CODE RECORD */
 
      /* MATERIAL ORDERS ARE A SPECIAL CASE. THE FIELD so_ship    */
      /* FOR MATERIAL ORDERS IS POPULATED WITH THE ENGINEER       */
      /* ASSOCIATED WITH THE ORDER RATHER THAN A SHIP-TO ADDRESS. */
      /* THE FIELD so_cust IS POPULATED WITH THE CUSTOMER OR      */
      /* SHIP-TO ASSOCIATED WITH THE ORDER. SO INSTEAD OF so_ship */
      /* WE PASS IN so_cust FOR MATERIAL ORDERS ONLY.             */
 
      /* DUE DATE */
      run get_time_status_code
         (input due_time,
         input (if so_fsm_type = "SEO" then so_cust else so_ship),
         input sod_site,
         input sod_part,
         input days,
         output due_status_code,
         output due_acceptable,
         output avail_status_code).
 
      /* REQUIRED DATE */
      run get_time_status_code
         (input req_time,
         input (if so_fsm_type = "SEO" then so_cust else so_ship),
         input sod_site,
         input sod_part,
         input days,
         output req_status_code,
         output req_acceptable,
         output avail_status_code).
 
      /* PERFORMANCE DATE */
      run get_time_status_code
         (input perf_time,
         input (if so_fsm_type = "SEO" then so_cust else so_ship),
         input sod_site,
         input sod_part,
         input days,
         output perf_status_code,
         output perf_acceptable,
         output avail_status_code).
 
      /* FIND QTY STATUS CODE RECORD */
      if using_shippers then
         qty_status = qty_open - (ship_qty * ship_um_conv).
      else
         qty_status = qty_open - ship_qty.
 
      run get_qty_status_code
         (input qty_status,
         input so_ship,
         input sod_site,
         input sod_part,
         input qty_open,
         input ship_qty,
         input ship_um_conv,
         input sod_um_conv,
         output qty_status_code,
         output qty_status_percent,
         output qty_acceptable).
 
      create shp_hist.
      shp_hist.shp_domain = global_domain.
 
      /* GET NEXT SEQUENCE/TRANSACTION NUMBER */
      {us/mf/mfrnseq.i shp_hist shp_hist.shp_tran_id shp_seq01}
 
      assign
         shp_customer_source = cust_source
         shp_cust = so_cust
         shp_shipto = so_ship
         shp_nbr = sod_nbr
         shp_line = sod_line
         shp_part = sod_part
         shp_ship_um = ship_um
         shp_ord_um = sod_um
         shp_currency = so_curr
         shp_cust_part = sod_custpart
         shp_shipfrom = sod_site
         shp_abs_id = shipperid
         shp_open_qty = qty_open
         shp_ext_price = (sod_price * qty_open)
         shp_ship_qty = ship_qty
         shp_ship_price = (if using_shippers then
                              (ship_qty * ship_um_conv) * (sod_price / sod_um_conv)
                           else
                               ship_qty * sod_price)
         shp_due_date = sod_due_date
         shp_req_date = sod_req_date
         shp_perf_date = sod_per_date
         shp_ship_date = ship_date
         shp_ship_time = current_time
         shp_include = yes
         shp_mod_date = today
         shp_mod_userid = global_userid
         shp_rel_id = ""
         shp_cmtindx = cmmt_index
         shp_order_category = sod_order_category
         shp_qty_pct = qty_status_percent.
 
      if recid(shp_hist) = -1 then .
 
      {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                     &HANDLE=ph_gpumxr
                     &PARAM="(input shp_part,
                              input shp_ship_um,
                              input shp_ord_um,
                              output l_shp_um_cnv)"
                     &NOAPPERROR=True
                     &CATCHERROR=True}
 
      if l_shp_um_cnv <> ?
      then
         shp_ship_um_conv = l_shp_um_cnv.
      else
         shp_ship_um_conv = 1.
 
 
      /* CREATE shpd_hist FOR TIMELINESS */
 
      if due_status_code <> "" or perf_status_code <> "" or
         req_status_code <> "" or time_reason <> "" then do:
         if due_status_code <> "" then
         run create_shpd_hist
            (input shp_tran_id,
            input 1,
            input due_status_code,
            input due_acceptable,
            input 1,
            input time_reason,
            input 1 /* shiptime */ ).
 
         if perf_status_code <> "" then
         run create_shpd_hist
            (input shp_tran_id,
            input 1,
            input perf_status_code,
            input perf_acceptable,
            input 2,
            input time_reason,
            input 1 /* shiptime */ ).
 
         if req_status_code <> "" then
         run create_shpd_hist
            (input shp_tran_id,
            input 1,
            input req_status_code,
            input req_acceptable,
            input 3,
            input time_reason,
            input 1 /* shiptime */ ).
      end.
 
      /* CREATE shpd_hist FOR COMPLETENESS */
      if qty_status_code <> "" or qty_reason <> "" then
      run create_shpd_hist
         (input shp_tran_id,
         input 2,
         input qty_status_code,
         input qty_acceptable,
         input 4,
         input qty_reason,
         input 2 /* shipqty */ ).
 
   end. /* ELSE DO. not sod_sched */
end. /* ELSE DO */
 
PROCEDURE get_time_status_code:
/*-----------------------------------------------------------------------------
Purpose: This procedure finds and passes back the appropriate time-based
status code for the order being shipped. The procedure
also passes back whether the status code is an acceptable code
(i.e., shipped on-time) or whether it was unacceptable (i.e late or
early). Time-based status codes for the orders processed with this
program are either tracked by days or by hours. This procedure
considers those status codes that are tracked by days.
 
Notes:
------------------------------------------------------------------------------*/
   define input parameter ship_time as integer no-undo.
   define input parameter shipto like so_ship no-undo.
   define input parameter site like sod_site no-undo.
   define input parameter item like sod_part no-undo.
   define input parameter tracking_measure like sttqd_tracking_measure no-undo.
   define output parameter time_status_code like sttqd_status_code no-undo.
   define output parameter acceptable_code like mfc_logical no-undo.
   define output parameter stat_found      like mfc_logical no-undo.
 
   /* MATCH SHIP-FROM, SHIP-TO AND ITEM */
 
   run find_time_status_record
      (input site,
      input shipto,
      input item,
      input 1,
      input tracking_measure,
      input ship_time,
      output time_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-FROM AND SHIP-TO */
 
   run find_time_status_record
      (input site,
      input shipto,
      input "",
      input 1,
      input tracking_measure,
      input ship_time,
      output time_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-FROM AND ITEM */
 
   run find_time_status_record
      (input site,
      input "",
      input item,
      input 1,
      input tracking_measure,
      input ship_time,
      output time_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-TO AND ITEM */
 
   run find_time_status_record
      (input "",
      input shipto,
      input item,
      input 1,
      input tracking_measure,
      input ship_time,
      output time_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-FROM */
 
   run find_time_status_record
      (input site,
      input "",
      input "",
      input 1,
      input tracking_measure,
      input ship_time,
      output time_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-TO */
 
   run find_time_status_record
      (input "",
      input shipto,
      input "",
      input 1,
      input tracking_measure,
      input ship_time,
      output time_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH ITEM */
 
   run find_time_status_record
      (input "",
      input "",
      input item,
      input 1,
      input tracking_measure,
      input ship_time,
      output time_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH NONE/GLOBAL MATCH */
 
   run find_time_status_record
      (input "",
      input "",
      input "",
      input 1,
      input tracking_measure,
      input ship_time,
      output time_status_code,
      output acceptable_code,
      output stat_found).
 
END PROCEDURE. /* get_time_status_code */
 
PROCEDURE get_qty_status_code:
/*-----------------------------------------------------------------------------
Purpose: This procedure finds and passes back the appropriate qty-based
status code for the order being shipped. The procedure
also passes back whether the status code is an acceptable code
(i.e., completely shipper) or whether it was unacceptable
(i.e., under shipped or over shipped).
 
Notes:
------------------------------------------------------------------------------*/
   define input parameter qty_status as integer no-undo.
   define input parameter shipto like so_ship no-undo.
   define input parameter site like sod_site no-undo.
   define input parameter item like sod_part no-undo.
   define input parameter qty_ord like sod_qty_ord no-undo.
   define input parameter ship_qty like sod_qty_chg no-undo.
   define input parameter ship_um_conv like sod_um_conv no-undo.
   define input parameter p_sod_um_conv like sod_um_conv no-undo.
   define output parameter qty_status_code like sttqd_status_code no-undo.
   define output parameter percent like shp_qty_pct no-undo.
   define output parameter acceptable_code like mfc_logical no-undo.
 
   define variable comp_value like shp_qty_pct no-undo.
   define variable stat_found like mfc_logical no-undo.
 
   if qty_ord = 0 then do:
      percent = 100.
   end. /* IF qty_ord = 0 */
   else do:
      if using_shippers then
         percent = (((ship_qty * ship_um_conv) / (qty_ord * p_sod_um_conv)) * 100) - 100.
      else
         percent = ((ship_qty / qty_ord) * 100) - 100.
   end. /* ELSE DO */
 
   if percent > 999.99 then
      percent = 999.99.
 
   if percent < -999.99 then
      percent = -999.99.
 
   comp_value = 0 - qty_status.
 
   /* MATCH SHIP-FROM, SHIP-TO AND ITEM */
 
   run find_qty_status_record
      (input site,
      input shipto,
      input item,
      input 2,
      input comp_value,
      input percent,
      output qty_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-FROM AND SHIP-TO */
   run find_qty_status_record
      (input site,
      input shipto,
      input "",
      input 2,
      input comp_value,
      input percent,
      output qty_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-FROM AND ITEM */
 
   run find_qty_status_record
      (input site,
      input "",
      input item,
      input 2,
      input comp_value,
      input percent,
      output qty_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-TO AND ITEM */
   run find_qty_status_record
      (input "",
      input shipto,
      input item,
      input 2,
      input comp_value,
      input percent,
      output qty_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-FROM */
   run find_qty_status_record
      (input site,
      input "",
      input "",
      input 2,
      input comp_value,
      input percent,
      output qty_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH SHIP-TO */
   run find_qty_status_record
      (input "",
      input shipto,
      input "",
      input 2,
      input comp_value,
      input percent,
      output qty_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH ITEM */
   run find_qty_status_record
      (input "",
      input "",
      input item,
      input 2,
      input comp_value,
      input percent,
      output qty_status_code,
      output acceptable_code,
      output stat_found).
 
   if stat_found then
      return.
 
   /* MATCH NONE/GLOBAL MATCH */
   run find_qty_status_record
      (input "",
      input "",
      input "",
      input 2,
      input comp_value,
      input percent,
      output qty_status_code,
      output acceptable_code,
      output stat_found).
 
END PROCEDURE. /* get_qty_status_code */
 
PROCEDURE get_reason_code:
/*-----------------------------------------------------------------------------
Purpose: This procedure finds any reason codes that were entered in the
Pre-Shipper/Shipper Workbench against the order line being shipped.
The procedure then passes back the reason codes and any comments
entered with them to be stored in the shp_hist and shpd_hist records.
 
Notes:
------------------------------------------------------------------------------*/
   define input parameter order_nbr like sosr_nbr no-undo.
   define input parameter order_line like sosr_line no-undo.
   define input parameter shipper_nbr like sosr_abs_id no-undo.
   define input parameter shipfrom like sosr_shipfrom no-undo.
   define input parameter reason_type like sosrd_measurement_type no-undo.
   define input parameter ip_dataset like sosrd_dataset no-undo.
   define output parameter reason_code like sosrd_rsn_code no-undo.
   define output parameter comment_id like sosr_cmtindx no-undo.
 
   for first sosr_mstr exclusive-lock  where sosr_mstr.sosr_domain =
      global_domain and
      sosr_nbr   = order_nbr       and
      sosr_line  = order_line      and
      sosr_abs_id = shipper_nbr    and
      sosr_shipfrom = shipfrom:
   end. /* FOR FIRST sosr_mstr */
   if available sosr_mstr then do:
      comment_id = sosr_cmtindx.
 
      for first sosrd_det  where sosrd_det.sosrd_domain = global_domain and
         sosrd_nbr    = sosr_nbr   and
         sosrd_line   = sosr_line    and
         sosrd_abs_id  = sosr_abs_id and
         sosrd_shipfrom = sosr_shipfrom and
         sosrd_measurement_type = reason_type  and
         sosrd_dataset  = ip_dataset:
      end. /* FOR FIRST sosrd_det */
      if available sosrd_det then do:
         reason_code = sosrd_rsn_code.
 
         delete sosrd_det.
      end. /* IF AVAILABLE sosrd_det */
      else
         reason_code = "".
 
      /* LOOK TO SEE IF THERE IS ANOTHER REASON CODE DETAIL   */
      /* RECORD IN THE SYSTEM. IF THERE IS DO NOT DELETE      */
      /* THE REASON CODE MASTER RECORD. IF THERE IS NOT       */
      /* ANOTHER DETAIL RECORD THEN DELETE THE MASTER RECORD. */
 
      if can-find (first sosrd_det  where sosrd_det.sosrd_domain =
         global_domain and
         sosrd_nbr    = sosr_nbr   and
         sosrd_line     = sosr_line    and
         sosrd_abs_id   = sosr_abs_id and
         sosrd_shipfrom = sosr_shipfrom and
         sosrd_dataset  = ip_dataset) then
         next.
      else
         delete sosr_mstr.
 
   end. /* IF AVAILABLE sosr_mstr */
   else assign comment_id = 0.
 
END PROCEDURE. /* get_reason_code */
 
PROCEDURE create_shpd_hist:
/*-----------------------------------------------------------------------------
Purpose: This procedure creates shipment performance history detail (shpd_hist)
records.
 
Notes:
------------------------------------------------------------------------------*/
   define input parameter tran_id like shpd_tran_id no-undo.
   define input parameter meas_type like shpd_measurement_type no-undo.
   define input parameter status_code     like shpd_status_code no-undo.
   define input parameter acceptable_code like shpd_acceptable no-undo.
   define input parameter meas_subtype    like shpd_meas_subtype no-undo.
   define input parameter reason_code like shpd_rsn_code no-undo.
   define input parameter reason_type like shpd_rsn_type no-undo.
 
   if not can-find (first shpd_hist
      where shpd_hist.shpd_domain = global_domain
      and   shpd_tran_id          = tran_id
      and   shpd_measurement_type = meas_type
      and   shpd_meas_subtype     = meas_subtype)
   then do:
 
      create shpd_hist.
      shpd_hist.shpd_domain = global_domain.
 
      assign
         shpd_tran_id          = tran_id
         shpd_measurement_type = meas_type
         shpd_status_code      = status_code
         shpd_acceptable       = acceptable_code
         shpd_meas_subtype     = meas_subtype
         shpd_rsn_code         = reason_code
         shpd_rsn_type         = reason_type
         shpd_mod_date   = today
         shpd_mod_userid = global_userid.
 
      if recid(shpd_hist) = -1 then .
 
   end. /* IF NOT CAN-FIND */
 
END PROCEDURE. /* create_shpd_hist */
 
PROCEDURE process_schedules:
/*-----------------------------------------------------------------------------
Purpose: This procedure finds all the schedules when a scheduled
order line is being shipped for CUM type of scheduled order.
After finding the schedule it will find the requirement in the
schedule that the shipment is consuming. The procedure then
passes the schedule requirement information to another procedure
to be stored in the shp_hist and shpd_hist records.
 
Notes:
------------------------------------------------------------------------------*/
   define input parameter sod_recid as recid no-undo.
   define output parameter rel_id like sch_rlse_id no-undo.
   define output parameter qty_open like schd_cum_qty no-undo.
   define output parameter sched_date like schd_date no-undo.
   define output parameter sched_time like schd_time no-undo.
 
   define variable arrive_time as character no-undo.
   define variable arrive_date as date no-undo.
   define variable ret_status as character no-undo.
   define variable translt_days as decimal no-undo.
   define variable dTotalShipQty   as decimal no-undo.
 
   for first sod_det where recid(sod_det) = sod_recid
   no-lock: end.
 
   /* GET THE TOTAL SHIPPED FOR SCHEDULED ORDER LINES RELATED TO THIS */
   /* LINE AS DEFINED BY AN ITEM REPLACEMENT SCHEDULE.                */
   dTotalShipQty = 0.
 
   {us/px/pxrun.i &PROC='getCumShipQtyByOrderLineSet' &PROGRAM='sosodxr.p'
            &HANDLE=ph_sosodxr
            &PARAM="(input sod_nbr, input sod_line,
                     output dTotalShipQty)"
            &NOAPPERROR=True
            &CATCHERROR=True}
 
   for first so_mstr where so_mstr.so_domain = global_domain
      and so_nbr = sod_nbr
      and so_compl_stat = ""
   no-lock: end.
 
   if current_release
   then do:
      for first sch_mstr
         where sch_mstr.sch_domain = global_domain
         and   sch_type            = sched_type
         and   sch_nbr             = sod_nbr
         and   sch_line            = sod_line
         and   sch_rlse_id         = sod_curr_rlse_id[sched_type]
      no-lock:
      end. /* FOR FIRST sch_mstr */
 
      if available sch_mstr
         then
         rel_id = sch_rlse_id.
      else
         leave.
 
   end. /* IF current_release */
   else do:
      for last sch_mstr
         where sch_mstr.sch_domain = global_domain
         and   sch_type            = sched_type
         and   sch_nbr             = sod_nbr
         and   sch_line            = sod_line
         and   sch_rlse_id         < sod_curr_rlse_id[sched_type]
      no-lock:
      end. /* FOR LAST sch_mstr */
      /* IF A PRIOR RELEASE DOES NOT EXIST THEN */
      /* FIND THE FIRST RELEASE.                */
      if not available sch_mstr
         then
      for first sch_mstr
         where sch_mstr.sch_domain = global_domain
         and   sch_type            = sched_type
         and   sch_nbr             = sod_nbr
         and   sch_line            = sod_line
         and   sch_rlse_id         = sod_curr_rlse_id[sched_type]
      no-lock:
      end. /* FOR FIRST sch_mstr */
 
      if available sch_mstr
         then
         rel_id = sch_rlse_id.
      else
         leave.
 
   end. /* ELSE DO current_release */
 
   for first schd_det
      where schd_det.schd_domain = global_domain
      and   schd_type            = sch_type
      and   schd_nbr             = sod_nbr
      and   schd_line            = sod_line
      and   (if using_shippers
      then
         schd_cum_qty > (dTotalShipQty - ship_qty)
      else
         schd_cum_qty > dTotalShipQty)
      and   schd_rlse_id = sch_rlse_id
   no-lock:
   end. /* FOR FIRST schd_det */
 
   if not available schd_det then
   for last schd_det  where schd_det.schd_domain = global_domain and
      schd_type = sched_type              and
      schd_nbr = sod_nbr                  and
      schd_line = sod_line                and
      schd_rlse_id = sch_rlse_id  no-lock:
   end. /* FOR LAST schd_det */
 
   if available schd_det
   then do:
 
      /* IF THERE ARE PRIOR CUM QUANTITIES STILL TO BE */
      /* SHIPPED THEN PROCESS THOSE QUANTITIES FIRST.  */
      if using_shippers
         then
      assign
         qty_open = sch_pcr_qty - (dTotalShipQty - ship_qty)
         l_qty2b_shipped = 0.
      else
      assign
         qty_open = sch_pcr_qty - dTotalShipQty
         l_qty2b_shipped = ship_qty.
 
      /* OPEN QUANTITIES GREATER THAN ZERO AT THIS STAGE WILL MEAN */
      /* THAT PRIOR CUM QUANTITIES ARE STILL TO BE SHIPPED         */
      if qty_open > 0
      then do:
 
         assign
            l_pcr_open_qty = qty_open
            l_pcr_ship_qty = (if qty_open > ship_qty
            then
            ship_qty
            else
            qty_open)
            l_remain_qty   = ship_qty - qty_open
            l_tot_shipped  = l_tot_shipped  + l_pcr_ship_qty
            + (dTotalShipQty + l_qty2b_shipped - ship_qty)
            sched_date     = sch_pcs_date
            sched_time     = schd_time.
 
         /* CREATE shp_hist AND shpd_hist RECORDS */
         run create_performance_data
            (input sod_nbr,
             input sod_line,
             input l_pcr_open_qty,
             input l_pcr_ship_qty,
             input sched_date,
             input sched_time,
             input rel_id).
 
      end. /* IF qty_open > 0 */
      else
      assign
         l_remain_qty   = ship_qty
         l_tot_shipped  = l_tot_shipped + (dTotalShipQty - ship_qty).
 
      /* IF PRIOR CUM QUANTITY HAS BEEN SATISFIED PROCESS */
      /* REQUIREMENTS IN THE SCHEDULE.                    */
 
      for each schd_det
            where schd_domain  = global_domain
            and   schd_type    = sch_type
            and   schd_nbr     = sod_nbr
            and   schd_line    = sod_line
            and   (if using_shippers
            then
            schd_cum_qty > (dTotalShipQty  - ship_qty)
            else
            schd_cum_qty > dTotalShipQty )
            and   schd_rlse_id = sch_rlse_id
         no-lock
            break by schd_type:
 
         /* IF THERE ARE NO MORE QUANTITIES LEFT TO BE PROCESSED */
         /* THEN LEAVE THE ITERATING BLOCK                       */
         if l_remain_qty <= 0
         then do:
            qty_open = 0.
            leave.
         end. /* IF l_remain_qty <= 0 */
 
         qty_open = max(schd_cum_qty -
            (dTotalShipQty + l_qty2b_shipped - l_remain_qty),0).
 
         if schd_cum_qty - (dTotalShipQty + l_qty2b_shipped) >= 0
            or (last(schd_type)
            and l_remain_qty > qty_open)
            then
            ship_qty = l_remain_qty.
         else
         ship_qty = schd_cum_qty - (dTotalShipQty + l_qty2b_shipped)
         + l_remain_qty.
 
         translt_days = decimal(substring(so_conrep,2,6)).
 
         if sched_type = 3 or (sched_type <> 3 and sch_sd_dates)
            then
         assign
            sched_date = schd_date
            sched_time = schd_time.
 
         if sched_type <> 3 and not sch_sd_dates
         then do:
 
            /* SCHEDULE IS A DELIVERY SCHEDULE. USE PROGRAM */
            /* rcshipdt.p TO GET CORRECT DELIVERY DATES FOR */
            /* THE SCHEDULE.                                */
 
            {us/bbi/gprun.i ""rcshipdt.p""
               "(input sod_site,
                 input sch_ship,
                 input schd_date,
                 input schd_time,
                 input translt_days,
                 input 0,
                 output sched_date,
                 output sched_time,
                 output arrive_date,
                 output arrive_time,
                 output ret_status)"}
 
         end. /* IF sched_type <> 3 ...  */
 
         /* CREATE shp_hist AND shpd_hist FOR SCHEDULE LINES */
         run create_performance_data
            (input sod_nbr,
             input sod_line,
             input qty_open,
             input ship_qty,
             input schd_date,
             input schd_time,
             input rel_id).
 
         assign
            l_tot_shipped = l_tot_shipped + ship_qty
            l_remain_qty  = dTotalShipQty + l_qty2b_shipped - l_tot_shipped
            qty_open      = 0.
 
      end. /* FOR EACH schd_det */
 
   end. /* IF AVAILABLE schd_det */
END PROCEDURE. /* process_schedules */
PROCEDURE find_time_status_record:
/*-----------------------------------------------------------------------------
Purpose: This procedure finds the most appropriate time based status code to
be assigned.
If an incoming status value can fall into three different status
code ranges (i.e. -1 to 0, 0 to 0, 0 to 1) , this procedure will
select the one that is an exact match where the min and max are
equal to the incoming status value (in this case the 0 to 0 range).
If a status value falls within two ranges that have an overlapping
value (i.e. -10 to -5 and -5 to 0) the range that is closer to zero
on the numberline will get selected (in this case, -5 to 0).
Notes:
------------------------------------------------------------------------------*/
   define input  parameter ip_shipfrom    as character no-undo.
   define input  parameter ip_receive_addr as character no-undo.
   define input  parameter ip_part         as character no-undo.
   define input  parameter ip_meas_type    as integer   no-undo.
   define input  parameter ip_track_meas   as character no-undo.
   define input  parameter ip_comp_value   as integer   no-undo.
   define output parameter op_status_code  as character no-undo.
   define output parameter op_stat_acceptable as logical no-undo.
   define output parameter op_stat_found      as logical no-undo.
 
   if ip_comp_value <> ? then
   for each sttqd_det no-lock  where sttqd_det.sttqd_domain = global_domain and
         sttqd_customer_source = "1"            and
         sttqd_shipfrom = ip_shipfrom           and
         sttqd_receive_addr = ip_receive_addr   and
         sttqd_part = ip_part                   and
         sttqd_measurement_type = ip_meas_type  and
         sttqd_active                           and
         sttqd_tracking_measure = ip_track_meas and
         (sttqd_min_value <= ip_comp_value and
         sttqd_max_value >= ip_comp_value)
         break by sttqd_min_value:
 
      if last(sttqd_min_value) then do:
 
         if first(sttqd_min_value) then
         assign
            op_status_code = sttqd_status_code
            op_stat_acceptable = sttqd_acceptable
            op_stat_found = yes.
         else
      if (ip_comp_value >= 0 and
            ip_comp_value = sttqd_max_value) or
            (ip_comp_value < 0 and
            ip_comp_value = sttqd_min_value) then
         assign
            op_status_code = sttqd_status_code
            op_stat_acceptable = sttqd_acceptable
            op_stat_found = yes.
 
         return.
      end. /*If last(sttqd_min_value)*/
      else do:
         if (ip_comp_value >= 0 and
            ip_comp_value = sttqd_max_value) or
            (ip_comp_value < 0 and
            ip_comp_value = sttqd_min_value) then
         assign
            op_status_code = sttqd_status_code
            op_stat_acceptable = sttqd_acceptable
            op_stat_found = yes.
         if sttqd_min_value = sttqd_max_value then
            return.
      end. /*else do*/
   end. /*for each sttqd_det*/
END PROCEDURE. /* find_time_status_record */
PROCEDURE find_qty_status_record:
/*-----------------------------------------------------------------------------
Purpose: This procedure finds the most appropriate qty based status code to
be assigned.
If an incoming status value can fall into three different status
code ranges (i.e. -1 to 0, 0 to 0, 0 to 1) , this procedure will
select the one that is an exact match where the min and max are
equal to the incoming status value (in this case the 0 to 0 range).
If a status value falls within two ranges that have an overlapping
value (i.e. -10 to -5 and -5 to 0) the range that is closer to zero
on the numberline will get selected (in this case, -5 to 0).
Notes:
------------------------------------------------------------------------------*/
   define input  parameter ip_shipfrom    as character no-undo.
   define input  parameter ip_receive_addr as character no-undo.
   define input  parameter ip_part         as character no-undo.
   define input  parameter ip_meas_type    as integer   no-undo.
   define input  parameter ip_comp_value   as integer   no-undo.
   define input  parameter ip_percent      like shp_qty_pct no-undo.
   define output parameter op_status_code  as character no-undo.
   define output parameter op_stat_acceptable as logical no-undo.
   define output parameter op_stat_found      as logical no-undo.
 
   for each sttqd_det no-lock  where sttqd_det.sttqd_domain = global_domain and (
         sttqd_customer_source = "1"            and
         sttqd_shipfrom = ip_shipfrom           and
         sttqd_receive_addr = ip_receive_addr   and
         sttqd_part = ip_part                   and
         sttqd_measurement_type = ip_meas_type  and
         sttqd_active                           and
         ((sttqd_tracking_measure = "3" and
         sttqd_min_value <= ip_comp_value and
         sttqd_max_value >= ip_comp_value)
         or
         (sttqd_tracking_measure = "4" and
         sttqd_min_value <= ip_percent    and
         sttqd_max_value >= ip_percent))
         ) break by sttqd_min_value:
 
      if last(sttqd_min_value) then do:
 
         if first(sttqd_min_value) then
         assign
            op_status_code = sttqd_status_code
            op_stat_acceptable = sttqd_acceptable
            op_stat_found = yes.
         else
      if (ip_percent    >= 0 and
            ip_percent    = sttqd_max_value) or
            (ip_percent    < 0 and
            ip_percent    = sttqd_min_value) then
         assign
            op_status_code = sttqd_status_code
            op_stat_acceptable = sttqd_acceptable
            op_stat_found = yes.
 
         return.
      end. /*If last(sttqd_min_value)*/
      else do:
         if (ip_percent    >= 0 and
            ip_percent    = sttqd_max_value) or
            (ip_percent    < 0 and
            ip_percent    = sttqd_min_value) then
         assign
            op_status_code = sttqd_status_code
            op_stat_acceptable = sttqd_acceptable
            op_stat_found = yes.
         if sttqd_min_value = sttqd_max_value then
            return.
      end. /*else do*/
   end. /*for each sttqd_det*/
END PROCEDURE. /* find_qty_status_record */
 
PROCEDURE process_req_schedules:
   define input parameter sod_recid          as recid                 no-undo.
   define input parameter ship_qty           like abs_mstr.abs_qty    no-undo.
   define input parameter sched_date         like schd_date           no-undo.
   define input parameter ship_date          like abs_mstr.abs_shp_date no-undo.
   define input parameter sched_time         like schd_time           no-undo.
   define input parameter rel_id             like schd_rlse_id        no-undo.
   define input parameter qty_open           like schd_cum_qty        no-undo.
 
   define variable l_absr_qty_tot            like abs_mstr.abs_qty      no-undo.
 
   define variable arrive_date  as date      no-undo.
   define variable arrive_time  as character no-undo.
   define variable ret_status   as character no-undo.
   define variable translt_days as decimal   no-undo.
   define variable l_absqtytot  like abs_mstr.abs_qty      no-undo.
 
   define buffer b_abs_mstr for abs_mstr.
 
   empty temp-table temp_absr.
 
   for first sod_det where recid(sod_det)= sod_recid
   no-lock:
   end. /* FOR FIRST sod_det */
 
   for first so_mstr where so_mstr.so_domain = global_domain
      and so_nbr = sod_nbr
      and so_compl_stat = ""
   no-lock:
   end. /* FOR FIRST so_mstr */
 
   for each work_abs_mstr
      no-lock
         where ((work_abs_mstr.abs_qty <> work_abs_mstr.abs_ship_qty)
         or      work_abs_mstr.abs_qty = 0),
         each abs_mstr exclusive-lock
         where abs_mstr.abs_domain   = global_domain
         and   abs_mstr.abs_shipfrom = work_abs_mstr.abs_shipfrom
         and   abs_mstr.abs_id       = work_abs_mstr.abs_id
         and work_abs_mstr.abs_order <> ""
         break by work_abs_mstr.abs_order
               by work_abs_mstr.abs_line
               by work_abs_mstr.abs_item
               by work_abs_mstr.abs_site
               by work_abs_mstr.abs_loc
               by work_abs_mstr.abs_lotser
               by work_abs_mstr.abs_ref:
 
         ship_qty = 0.
 
      if current_release
      then do:
         for first sch_mstr
            where sch_mstr.sch_domain = global_domain
            and   sch_type            = sched_type
            and   sch_nbr             = sod_nbr
            and   sch_line            = sod_line
            and   sch_rlse_id         = sod_curr_rlse_id[sched_type]
         no-lock:
         end. /* FOR FIRST sch_mstr */
 
         if available sch_mstr
            then
            rel_id = sch_rlse_id.
         else
            leave.
      end. /* IF current_release */
 
      else do:
         for last sch_mstr
            where sch_mstr.sch_domain = global_domain
            and   sch_type            = sched_type
            and   sch_nbr             = sod_nbr
            and   sch_line            = sod_line
            and   sch_rlse_id         < sod_curr_rlse_id[sched_type]
         no-lock:
         end. /* FOR LAST sch_mstr */
 
         /* IF A PRIOR RELEASE DOES NOT EXIST THEN */
         /* FIND THE FIRST RELEASE.                */
         if not available sch_mstr
            then
         for first sch_mstr
            where sch_mstr.sch_domain = global_domain
            and   sch_type            = sched_type
            and   sch_nbr             = sod_nbr
            and   sch_line            = sod_line
            and   sch_rlse_id         = sod_curr_rlse_id[sched_type]
         no-lock:
         end. /* FOR FIRST sch_mstr */
 
         if available sch_mstr
            then
            rel_id = sch_rlse_id.
         else
            leave.
 
      end. /* ELSE DO */
 
/* CHECK FOR SHIPMENT THAT DOES NOT HAVE REQUIREMENTS */
      if first-of(work_abs_mstr.abs_line)
      then do:
         for first absr_det
            where absr_domain   = global_domain
            and   absr_shipfrom = abs_mstr.abs_shipfrom
            and   absr_id       = abs_mstr.abs_id
            and   absr_nbr      = abs_mstr.abs_order
            and   absr_line     = sod_line
            and   absr_rlse_id  = sod_curr_rlse_id[3]
            no-lock:
         end. /*FOR FIRST absr_det */
 
         if not available absr_det
         then do:
 
            run calReqShipQty
               (input work_abs_mstr.abs_order,
                input work_abs_mstr.abs_line,
                output l_absr_qty_tot,
                output l_absqtytot).
 
 
            run create_performance_data
               (input sod_nbr,
                input sod_line,
                input 0,
                input (l_absqtytot - l_absr_qty_tot),
                input today,
                input 0,
                input "").
 
         end. /*IF NOT AVAILABLE absr_det*/
      end. /*IF FIRST-OF(work_abs_mstr.abs_line)*/
 
 
      /* FOR EACH SHIPMENT REQUIREMENT DETAIL */
      for each absr_det
            where absr_det.absr_domain = global_domain
            and   absr_shipfrom        = abs_mstr.abs_shipfrom
            and   absr_id              = abs_mstr.abs_id
            and   absr_nbr             = abs_mstr.abs_order
            and   absr_line            = sod_line
            and   absr_rlse_id         = sod_curr_rlse_id[3]
         no-lock
         break by absr_date
               by absr_reference:
 
         /* FIND THE FIRST RELEASE MGMT SCHEDULE DETAIL */
         for first schd_det
            where schd_det.schd_domain = global_domain
            and   schd_type            = sch_type
            and   schd_nbr             = absr_nbr
            and   schd_line            = absr_line
            and   schd_rlse_id         = rel_id
            and   schd_date            = absr_date
            and   schd_time            = absr_time
            and   schd_interval        = absr_interval
            and   schd_reference       = absr_reference
         no-lock:
         end. /* FOR FIRST schd_det */
 
         if available schd_det
         then do:
 
            if using_shippers
            then do:
 
               ship_qty       = absr_qty.
 
               if first-of(work_abs_mstr.abs_line)
               then do:
                  run calReqShipQty
                     (input work_abs_mstr.abs_order,
                      input work_abs_mstr.abs_line,
                      output l_absr_qty_tot,
                      output l_absqtytot).
 
                  if shipper_qty > l_absr_qty_tot
                  then
                     ship_qty = ship_qty + (shipper_qty - l_absr_qty_tot).
 
               end. /* IF FIRST-OF(work_abs_mstr.abs_line) */
 
            end. /* IF using_shippers */
 
            if sched_type = 3 or (sched_type <> 3 and sch_sd_dates)
               then
            assign
               sched_date = schd_date
               sched_time = schd_time.
 
            qty_open = max (schd_discr_qty - schd_ship_qty,0).
 
            if sched_type <> 3 and not sch_sd_dates
            then do:
 
               /* SCHEDULE IS A DELIVERY SCHEDULE. USE PROGRAM */
               /* rcshipdt.p TO GET CORRECT DELIVERY DATES FOR */
               /* THE SCHEDULE.                                */
 
               {us/bbi/gprun.i ""rcshipdt.p""
                  "(input sod_site,
                    input sch_ship,
                    input schd_date,
                    input schd_time,
                    input translt_days,
                    input 0,
                    output sched_date,
                    output sched_time,
                    output arrive_date,
                    output arrive_time,
                    output ret_status)"}
 
            end. /* IF sched_type <> 3 AND not sch_sd_dates */
 
            for first temp_absr
               where t_absrnbr     = absr_nbr
               and   t_absrline    = absr_line
               and   t_absrdate    = schd_date
               and   t_absrtime    = schd_time
               and   t_absrrelease = rel_id
               and   t_absrref     = absr_reference
             exclusive-lock:
             end. /* FOR FIRST temp_absr*/
 
             if available temp_absr
             then
                assign
                   t_absropen = qty_open
                   t_absrship = t_absrship + absr_qty.
 
             if not available temp_absr
             then do:
                create temp_absr.
                assign t_absrnbr     = absr_nbr
                       t_absrline    = absr_line
                       t_absrdate    = schd_date
                       t_absrtime    = schd_time
                       t_absrrelease = rel_id
                       t_absrref     = absr_reference
                       t_absropen    = qty_open.
 
                if absr_qty >= qty_open
                then
                   t_absrship = ship_qty.
                else
                   t_absrship = absr_qty.
 
             end.  /*IF NOT AVAILABLE temp_absr */
 
 
         end. /* IF AVAILABLE schd_det */
 
      end. /* FOR EACH absr_det */
 
   end. /* FOR EACH work_abs_mstr  */
 
   for each temp_absr
   exclusive-lock:
 
      run create_performance_data
         (input t_absrnbr,
          input t_absrline,
          input t_absropen,
          input t_absrship,
          input t_absrdate,
          input t_absrtime,
          input t_absrrelease).
 
      delete temp_absr.
   end. /*FOR EACH temp_absr*/
 
END PROCEDURE.
 
PROCEDURE create_performance_data:
/*-----------------------------------------------------------------------------
Purpose: This procedure receives the schedule requirement information
to be stored in the shp_hist and shpd_hist records.
 
Notes:
------------------------------------------------------------------------------*/
 
   define input parameter ip_sodnbr       like sod_nbr       no-undo.
   define input parameter ip_sodline      like sod_line      no-undo.
 
   define input parameter i_qty_open   as   integer       no-undo.
   define input parameter i_ship_qty   as   integer       no-undo.
   define input parameter i_sched_date like schd_date     no-undo.
   define input parameter i_sched_time like schd_time     no-undo.
   define input parameter i_rel_id     like schd_rlse_id  no-undo.
 
   define buffer so_mstr for so_mstr.
   define buffer sod_det for sod_det.
 
   /* ACCOUNT FOR THE POSSIBILITY THAT SALES ORDER DATES MIGHT */
   /* BE BLANK. IF THIS IS THE CASE, THE ORDER DATES WILL BE   */
   /* SET EQUAL TO THE SHIP DATE.                              */
 
   for first so_mstr
      where so_domain = global_domain
      and   so_nbr    = ip_sodnbr
      and   so_compl_stat = ""
   no-lock:
   end. /*FOR FIRST so_mstr */
 
   for first sod_det
      where sod_domain = global_domain
      and   sod_nbr    = ip_sodnbr
      and   sod_line   = ip_sodline
      and   sod_compl_stat = ""
      no-lock:
   end. /*FOR FIRST sod_det */
 
 
   if not available sod_det
      then
      leave.
 
   if not available so_mstr
      then
      leave.
 
   if sod_due_date = ?
      then
      sod_due_date = ship_date.
 
   if sod_req_date = ?
      then
      sod_req_date = ship_date.
 
   if  sod_per_date = ?
      and so_fsm_type = "SEO"
      then
      sod_per_date = sod_due_date.
   else do:
      if sod_per_date = ?
         then
         sod_per_date = ship_date.
   end. /* ELSE DO */
 
   /* GET STATUS CODES RELATED TO TIME AND QTY */
 
   /* INITIALIZE VARIABLES */
   assign
      cust_source         = "1"
      due_status_code     = ""
      req_status_code     = ""
      perf_status_code    = ""
      due_time            = (ship_date - sod_due_date) * 86400
      req_time            = ((ship_date - sod_req_date) + ship_lt) * 86400
      perf_time           = ((ship_date - sod_per_date) + ship_lt) * 86400
      work_time           = string(time,"HH:MM")
      current_time        = substring(work_time,1,2) + substring(work_time,4,2)
      qty_status_code     = ""
      qty_status_percent  = 0
      i_qty_open          = i_qty_open * ship_um_conv.
 
   if sod_sched
   then do:
      sched_work_time = substring(i_sched_time,1,2) +
         substring(i_sched_time,3,2).
 
      if sched_work_time <> ""
         then
         hour_work_time =  string(time,"HH:MM").
      else
         hour_work_time = "".
 
      assign
         days_diff = i_sched_date - ship_date
         elapse = (integer(substring(sched_work_time,1,2))  -
         integer(substring(hour_work_time,1,2))) * 60 * 60
         elapse = elapse + (integer(substring(sched_work_time,3,2))  -
         integer(substring(hour_work_time,4,2))) * 60
         elapse = elapse / 60
         tot-elapsed-time = ((days_diff - 1) * 1440) + (1440 + elapse)
         tot-elapsed-time = 0 - (tot-elapsed-time * 60)
         qty_status = i_qty_open - (i_ship_qty * ship_um_conv).
 
      /* FIND TIME STATUS CODE RECORD */
      /* SCHED DATE */
      if i_sched_time > ""
      then do:
         run get_time_status_code
            (input tot-elapsed-time,
            input so_ship,
            input sod_site,
            input sod_part,
            input hours,
            output due_status_code,
            output due_acceptable,
            output avail_status_code).
      end. /* IF i_sched_time> "" */
      else
         avail_status_code = no.
 
      if not avail_status_code
      then do:
 
         /* IF SHIPPING ON THE SAME DAY THE MATERIAL IS DUE     */
         /* AND NOT MEASURING SHIPMENTS BY THE HOUR             */
         /* THEN SET THE VARIABLE tot-elapsed-time TO BE ZERO   */
         /* SO THAT THE TOTAL ELAPSED TIME REPRESENTS THAT THE  */
         /* SHIP DATE AND THE DUE DATE ARE THE SAME DAY.        */
         if days_diff = 0
            then
            tot-elapsed-time = 0.
 
         run get_time_status_code
            (input tot-elapsed-time,
            input so_ship,
            input sod_site,
            input sod_part,
            input days,
            output due_status_code,
            output due_acceptable,
            output avail_status_code).
      end.  /* IF NOT avail_status_code */
 
      /* FIND QTY STATUS CODE RECORD */
      run get_qty_status_code
         (input qty_status,
         input so_ship,
         input sod_site,
         input sod_part,
         input i_qty_open,
         input i_ship_qty,
         input ship_um_conv,
         input sod_um_conv,
         output qty_status_code,
         output qty_status_percent,
         output qty_acceptable).
 
   end. /* IF sod_sched */
 
 
      create shp_hist.
 
      /* GET NEXT SEQUENCE/TRANSACTION NUMBER */
      {us/mf/mfrnseq.i shp_hist shp_hist.shp_tran_id shp_seq01}
 
      assign
         shp_domain          = global_domain
         shp_customer_source = cust_source
         shp_cust            = so_mstr.so_cust
         shp_shipto          = so_ship
         shp_nbr             = sod_nbr
         shp_line            = sod_line
         shp_part            = sod_part
         shp_ship_um         = ship_um
         shp_ord_um          = sod_um
         shp_currency        = so_curr
         shp_cust_part       = sod_custpart
         shp_shipfrom        = sod_site
         shp_abs_id          = shipperid
         shp_open_qty        = i_qty_open
         shp_ext_price       = (sod_price * shp_open_qty)
         shp_ship_qty        = i_ship_qty
         shp_ship_price      = shp_ship_qty * sod_price
         shp_due_date        = i_sched_date
         shp_req_date        = shp_due_date
         shp_perf_date       = shp_due_date
         shp_ship_date       = ship_date
         shp_sched_time      = i_sched_time
         shp_ship_time       = current_time
         shp_include         = yes
         shp_mod_date        = today
         shp_mod_userid      = global_userid
         shp_rel_id          = i_rel_id
         shp_cmtindx         = cmmt_index
         shp_order_category  = sod_order_category
         shp_qty_pct         = qty_status_percent.
 
      if recid(shp_hist) = -1 then .
 
      {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                     &HANDLE=ph_gpumxr
                     &PARAM="(input shp_part,
                              input shp_ship_um,
                              input shp_ord_um,
                              output l_shp_um_cnv)"
                     &NOAPPERROR=True
                     &CATCHERROR=True}
 
 
      if l_shp_um_cnv <> ?
      then
         shp_ship_um_conv = l_shp_um_cnv.
      else
         shp_ship_um_conv = 1.
 
   /* CREATE shpd_hist FOR TIMELINESS */
 
   if due_status_code  <> ""
      or time_reason      <> ""
   then do:
 
      /* DUE DATE */
      run create_shpd_hist
         (input shp_tran_id,
         input 1,
         input due_status_code,
         input due_acceptable,
         input 1,
         input time_reason,
         input 1 /* shiptime */ ).
 
      /* REQUIRED DATE */
      run create_shpd_hist
         (input shp_tran_id,
         input 1,
         input due_status_code,
         input due_acceptable,
         input 2,
         input time_reason,
         input 1 /* shiptime */ ).
 
      /* PERFORMANCE DATE */
      run create_shpd_hist
         (input shp_tran_id,
         input 1,
         input due_status_code,
         input due_acceptable,
         input 3,
         input time_reason,
         input 1 /* shiptime */ ).
 
   end. /* IF due_status_code  <> ""  */
 
   /* CREATE shpd_hist FOR COMPLETENESS */
   if qty_status_code <> ""
      or qty_reason      <> ""
      then
   run create_shpd_hist
      (input shp_tran_id,
      input 2,
      input qty_status_code,
      input qty_acceptable,
      input 4,
      input qty_reason,
      input 2 /* shipqty */ ).
 
END PROCEDURE. /* CREATE_PERFORMANCE_DATA */
 
PROCEDURE calReqShipQty:
 
define input  parameter ip_abs_order     like work_abs_mstr.abs_order no-undo.
define input  parameter ip_abs_line      like work_abs_mstr.abs_line  no-undo.
define output parameter op_absr_qty_tot  like work_abs_mstr.abs_qty   no-undo.
define output parameter op_absqtytot     like work_abs_mstr.abs_qty   no-undo.
 
define buffer b_abs_mstr for work_abs_mstr.
define buffer b_absr_det for absr_det.
 
for each b_abs_mstr
   where b_abs_mstr.abs_order = ip_abs_order
   and   b_abs_mstr.abs_line  = ip_abs_line
   no-lock :
 
   for each b_absr_det
      where b_absr_det.absr_domain  = global_domain
      and   b_absr_det.absr_shipfrom = b_abs_mstr.abs_shipfrom
      and   b_absr_det.absr_id       = b_abs_mstr.abs_id
      and   b_absr_det.absr_nbr      = b_abs_mstr.abs_order
      and   b_absr_det.absr_line     = integer(ip_abs_line)
      no-lock:
         op_absr_qty_tot = op_absr_qty_tot + b_absr_det.absr_qty.
   end. /*FOR EACH b_absr_det */
 
   op_absqtytot = b_abs_mstr.abs_qty + op_absqtytot.
end. /*FOR EACH lfabs_mstr */
 
END PROCEDURE. /* END PROCEDURE calReqShipQty */
