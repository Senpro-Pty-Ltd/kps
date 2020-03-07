/* xxrcsois1e.p - Customer Schedules - Confirm Shipper Invoicing Sub-Program  */
/* rcsois1e.p - Customer Schedules - Confirm Shipper Invoicing Sub-Program    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrcsois1e.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*----------------------------------------------------------------------------*/
/* CYB  LAST MODIFIED: 2017-Jun-06    BY: gbg *c1603*                         */
/*----------------------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i gpumxr}
{us/gp/gpuid.i}
{us/bbi/gplabel.i}
{us/mf/mfsprtdf.i}
{us/fs/fsdeclr.i}
{us/gt/gtsoindf.i}

/*c1603* start added code >>>>>> */
{us/xx/xxauis2.i}
define shared variable print_inv like mfc_logical label "Print Invoices"  no-undo.
/*c1603* end added code <<<<<<< */
 
define temp-table tt_somstr no-undo
   field tt_sonbr   like so_nbr
   field tt_sotoinv like mfc_logical initial no
index sonbr is primary unique
   tt_sonbr.

define temp-table temp_somstr
   field temp_so_nbr like so_nbr
   field temp_so_inv_nbr like so_inv_nbr
   field temp_so_inv_date like so_inv_date
index temp_so_nbr temp_so_nbr ascending.
 
/* PARAMETERS */
define input  parameter table             for tt_somstr.
define input  parameter pPostFile         as character      no-undo.
define input  parameter p_prtInstBase     like mfc_logical  no-undo.
define input  parameter table             for temp_somstr.
define input  parameter temp_so_ship      like so_ship         no-undo.
define input  parameter temp_so_qadc01    like so__qadc01      no-undo.
define input  parameter temp_fob          like so_fob extent 30.
define input  parameter temp_shipvia      like so_shipvia extent 30.
define input  parameter temp_fob_list     as character         no-undo.
define input  parameter temp_shipvia_list as character         no-undo.
define input  parameter l_traddr          like tr_addr.
define input  parameter l_qty_iss_rcv     like tr_qty_loc.
define output parameter o_undo            like mfc_logical  no-undo 
                                          initial true.
define output parameter table             for ttisb.
 
/* SHARED VARIABLES */
define new shared variable   traddr         like tr_addr.
define new shared variable   qty_iss_rcv    like tr_qty_loc.
define new shared temp-table IntraStat field  StatID as recid.

define shared variable next_inv_nbr  like soc_inv.
define shared variable next_inv_pre  like soc_inv_pre.
define shared variable conso           like mfc_logical.
define shared variable abs_recid      as recid.
define shared variable auto_post      like mfc_logical label "Post Invoice".
define shared variable first_batch    like ar_batch.
define shared variable batch          like ar_batch.
define shared variable batch_tot      like glt_amt.
define shared variable bill           like so_bill.
define shared variable bill1          like so_bill.
define shared variable consolidate    like mfc_logical
                                      label "Consolidate Invoices".
define shared variable cust           like so_cust.
define shared variable cust1          like so_cust.
define shared variable ship           like so_ship.
define shared variable ship1          like so_ship.
define shared variable site          like so_site.
define shared variable site1          like so_site.
define shared variable eff_date       like glt_effdate label  "Effective".
define shared variable gl_sum         like mfc_logical format "Consolidated/Detail"
                                      initial yes.
define shared variable inv            like ar_nbr label "Invoice".
define shared variable inv1           like ar_nbr label "To".
define shared variable order_nbrs     as character extent 30.
define shared variable order_nbr_list as character no-undo.
define shared variable order_ct       as integer.
define shared variable post           like mfc_logical.
define shared variable ref            like glt_ref.
define shared variable ship_dt        like so_ship_date.
define shared variable so_recno       as recid.
define shared variable sod_recno      as recid.
define shared variable undo_all       like mfc_logical no-undo.
define shared variable confirm_mode   like mfc_logical no-undo.
define shared variable auto_inv       like mfc_logical.

/* LOCAL VARIABLES */
define variable i                   as integer             no-undo.
define variable inv_ct              as integer.
define variable inv_nbrs            as character extent 30.
define variable new_inv_nbr         as character.
define variable inv_nbr_list        as character           no-undo.
define variable order_num           as character           no-undo.
define variable undo_stat           like mfc_logical       no-undo.
define variable l_increment         like mfc_logical       no-undo.
define variable l_cur_tax_amt       like tx2d_cur_tax_amt  no-undo.
define variable l_po_schd_nbr       like sod_contr_id      no-undo.
define variable first_time          as logical initial yes no-undo.
define variable vba_recno           as recid               no-undo.
define variable sonbr               like so_nbr no-undo.
define variable sonbr1              like so_nbr no-undo.
define variable soshipdate1         like so_ship_date no-undo.
define variable soinvdate           like so_inv_date no-undo.

{us/px/pxphdef.i edgetpv}
 
{us/rc/rcsois.i}

{us/rc/rcwabsdf.i}

define temp-table tt_so_notaxdt no-undo
   field tt_sonum   like so_nbr
   index sonbr is primary unique
   tt_sonum.
 
empty temp-table tt_so_notaxdt.
/* Euro Tool Kit definitions */
{us/et/etvar.i}
{us/et/etdcrvar.i}
{us/et/etrpvar.i}
{us/so/soivtot1.i}  /* Define variables for invoice totals. */
 
{us/so/socurvar.i}
 
{us/gp/gpglefdf.i}

for first soc_ctrl
   where soc_domain = global_domain
no-lock:
end. /* FOR FIRST soc_ctrl */

for first sod_det 
   where recid(sod_det) = sod_recno
no-lock:
end. /* FOR FIRST sod_det */

for first abs_mstr 
   where recid(abs_mstr) = abs_recid
no-lock:
end. /* FOR FIRST abs_mstr */

assign
   traddr      = l_traddr
   qty_iss_rcv = l_qty_iss_rcv.

progloop:
do on error undo, leave:
   /* PRINT INVOICES IF WE NEED TO.  THIS SECTION  WAS  ADDED
    * FOR BRAZILIAN REQUIREMENTS.  */
   subloop:
   do transaction on error undo, leave:

      if auto_post
         or auto_inv
      then do:
 
         inv_ct = 0.
 
         /*FIRST ASSIGN INVOICE NUMBERS*/
         do i = 1 to order_ct:
 
            order_num = if (i <= 30)
                        then
                           order_nbrs[i]
                        else
                           entry(i - 30,order_nbr_list).
 
            find so_mstr
               where so_domain = global_domain
               and   so_nbr = order_num
               and   so_compl_stat = ""
            exclusive-lock no-error.
 
            if (consolidate
                and i = 1)
               or not consolidate
            then do:
               if auto_inv = false
               then do:
                  assign
                     so_recno     = recid(so_mstr)
                     next_inv_pre = soc_inv_pre
                     next_inv_nbr = soc_inv - 1.

                  {us/bbi/gprun.i ""sosoina.p""}
                  
                  new_inv_nbr = so_inv_nbr.
                  
                  {us/bbi/gprun.i ""sorp10b.p""}
               end. /* IF auto_inv = false */
               inv_ct = inv_ct + 1.
            end. /* IF (CONSOLIDATE AND I = 1) OR NOT CONSOLIDATE */
 
            if auto_inv = false
            then do:
               if inv_ct <= 30 
               then
                  inv_nbrs[inv_ct] = new_inv_nbr.
               else
                  inv_nbr_list = inv_nbr_list + new_inv_nbr + ",".
               so_inv_nbr = new_inv_nbr.
            end. /*IF auto_inv = false */
            assign   
               so_ship      = abs_mstr.abs_shipto
               so_to_inv    = yes
               so_ship_date = ship_dt
               so_print_bl  = no
               so_inv_date = eff_date.
 
            if sod_consignment  = no
               and so_tax_date  = ?
            then do:
               create tt_so_notaxdt.
               tt_sonum = so_nbr.
               so_tax_date  = ship_dt.
            end. /* IF sod_consignment */
 
         end. /* DO I = 1 TO ORDER_CT */
 
      end. /* IF AUTO_POST OR AUTO_INV THEN DO: */
 
      do on error undo, retry:
         if inv_ct >  0
         then do:
            if auto_post
            then do:
               conso = consolidate.
 
/*c1603* start deleted code >>>>>>
               {us/bbi/gprun.i ""rcsorp10.p""
                  "(input  table tt_somstr,
                    input  consolidate,
                    output undo_stat,
                    input-output inv_nbr_list,
                    input-output inv_nbrs)"}
*c1603* end deleted code <<<<<<<< */

/*c1603* start added code >>>>>> */
              if print_inv
	      then do:
		  auto_inv = yes.
		  if not can-find(first prd_det
		                  where prd_dev = invprinter)
                  then do:
		     printseq = printseq + 1.
		     invp = invprinter + string(printseq, "999").
		  end.
		  else do:
		     invp = invprinter.
		  end.
                  {us/bbi/gprun.i ""xxrcsorp11.p""
                      "(input  table tt_somstr,
                        input  consolidate,
                        output undo_stat,
                        input-output inv_nbr_list,
                        input-output inv_nbrs)"}
/*c1603* end added code <<<<<<<<<<<<<<< */ 
               if undo_stat
               then do: 
                  /*RESET INVOICE NUMBERS SO WE CAN DO IT AGAIN IF NEEDED*/
                  do i = 1 to order_ct:
                     order_num = if (i <= 30)
                                 then
                                    order_nbrs[i]
                                 else
                                    entry(i - 30,order_nbr_list).
 
                     find so_mstr
                        where so_domain = global_domain
                        and   so_nbr = order_num
                        and   so_compl_stat = ""
                     exclusive-lock no-error.
 
                     find temp_somstr
                        where temp_so_nbr = order_num
                     no-lock no-error.
 
                     if available temp_somstr
                     then
                        assign
                           so_inv_nbr  = temp_so_inv_nbr
                           so_inv_date = temp_so_inv_date.
                     else
                        assign
                           so_inv_nbr  = ""
                           so_inv_date = ?.
 
                     assign
                        so_to_inv   = yes
                        so_ship     = temp_so_ship
                        so__qadc01  = temp_so_qadc01.
 
                     for first tt_somstr
                        where tt_sonbr = so_nbr
                     no-lock :
                        so_to_inv = tt_sotoinv.
                     end.
 
                  end. /* do i = 1 to order_ct */
 
                  /* IF UNDO_STAT IS YES, DON'T POST THE INVOICE.  BUT */
                  /* UPDATE THE SHIPPER STATUS                         */
                  assign
                     auto_post = no
                     inv_ct    = 0.
  
                  release qad_wkfl.
                  leave subloop.
 
               end. /* IF undo_stat */ 
/*c1603*/    end. /* if print_inv */
            end. /* IF auto_post */
         end. /* IF inv_ct >  0 */
 
         release soc_ctrl.
         release qad_wkfl.
 
      end. /* DO ON ERROR UNDO RETRY */
 
   end. /* SUBLOOP */

   if auto_post
   then do transaction:
      /* Posting Invoice */
      run p_display_message (input 8235, input 1).
 
      do i = 1 to inv_ct:
 
         assign
            cust1    = hi_char
            bill1    = hi_char
            ship1    = hi_char
            site1    = hi_char
            inv      = if (i <= 30)
                       then
                          inv_nbrs[i]
                       else
                          entry(i - 30,inv_nbr_list)
            inv1     = inv
            post     = yes
            gl_sum   = yes
            undo_all = no
            insbase = no.
  
         for first svc_ctrl
            where  svc_domain = global_domain
         no-lock:
            assign
               serialsp = "S"
               nsusebom = no
               usebom   = svc_isb_bom
               needitem = svc_pt_mstr
               insbase  = svc_ship_isb.
         end. /* FOR FIRST svc_ctrl */
 
         if insbase 
         then do:
            {us/bbi/gpfildel.i &filename="global_userid + "".isb"""}
            output stream prt2 to value(global_userid + ".isb").
         end. /* IF INSBASE */
 
         assign
            expcount = 999
            pageno = 0.
 
         /* Do this on the first iteration only! Otherwise you get a Progress */
         /* error message when you try to "output to" on subsequent iterations */
         if i = 1
         then do:
            /* This is essentially disabling all the  */
            /* DISPLAY statements in Invoice Post     */
            if opsys = "unix"
            then
               output to "/dev/null".
            else
            if    opsys = "msdos"
               or opsys = "win32"
            then
               output to "nul".
         end. /* IF i = 1 */
 
         l_increment = no.
 
         so_mstr-loop:
         for each so_mstr
            where so_domain     = global_domain
            and   so_inv_nbr    = inv
            and   so_to_inv     = yes
            and   so_compl_stat = ""
         no-lock
         use-index so_invoice:
            for each sod_det 
               where sod_domain     = global_domain
               and   sod_nbr        = so_nbr
               and   sod_compl_stat = ""
            no-lock:
 
               l_po_schd_nbr = if so_sched
                               then
                                  sod_contr_id
                               else
                                  "".
 
               if   (sod_price * sod_qty_inv) <> 0
                  or sod_disc_pct             <> 0
               then do:
                  l_increment = yes.
                  leave so_mstr-loop.
               end. /* IF (sod_list_pr * sod_qty_inv) OR ...*/
 
               run p-check(input so_nbr,
                           input so_inv_nbr,
                           output l_increment).
 
               if l_increment = yes
               then
                  leave so_mstr-loop.
 
            end. /* FOR EACH sod_det */
 
            /* TO ACCUMULATE TAX AMOUNTS OF SHIPPED SO ONLY ('13'/ '14' type) */
            for each tx2d_det
               where   tx2d_domain  = global_domain
               and    (tx2d_ref     = so_nbr
               and    (tx2d_tr_type = '13'
               or      tx2d_tr_type = '14'))
            no-lock:
               l_cur_tax_amt = l_cur_tax_amt + absolute(tx2d_cur_tax_amt).
            end. /* FOR EACH tx2d_det */
 
            if (absolute(so_trl1_amt) + absolute(so_trl2_amt) +
                absolute(so_trl3_amt) + l_cur_tax_amt) <> 0
            then do:
               l_increment = yes.
               leave so_mstr-loop.
            end. /* IF ABSOLUTE(so_trl1_amt) + ... */
 
         end. /* FOR EACH SO_MSTR */
 
         if l_increment
         then do:
            run p_getbatch.
         end.
         else do:
            run p_getbatch.
            ref   = "".
            if first_time
            then
               assign
                  first_batch = batch
                  first_time = no.
         end. /* ELSE DO */
 
         /* GL TRANSACTIONS FOR FREIGHT ACCOUNTS GET CREATED         */
         /* PRIOR TO INVOICE POST, FOR CONSISTENCY WITH SO SHIPMENTS */
         
         undo_all = no.
         
         {us/bbi/gprun.i ""gtextract.p""
               "(input        sonbr,
                 input        sonbr1,
                 input        soinvdate,
                 input        ship_dt,
                 input        soshipdate1,
                 input        cust,
                 input        cust1,
                 input        bill,
                 input        bill1,
                 input        ship,
                 input        ship1,
                 input        site,
                 input        site1,
                 input        conso,
                 input        order_ct,
                 input        order_nbrs,
                 input        order_nbr_list)" }
                 
         if undo_all = TRUE
         then
            undo progloop, leave.
         
         {us/bbi/gprun.i ""soivpst1.p""
            "(input  abs_recid,
              input  l_po_schd_nbr,
              input  no,
              input  yes,           /* SHIPPER CONFIRMATION POSTS INVOICE - YES */
              input  pPostFile,     /* FILE NAME TO SAVE INVOICE POSTING ERRORS */
              input  p_prtInstBase, /* PRINT INSTALL BASE REPORT */
              output table ttisb)"}
         /* RESET PRINT FILE FOR INSTALLED BASE UPDATE */
         if insbase 
         then do:
            put stream prt2 " ".
            output stream prt2 close.
         end. /* IF INSBASE */
 
         if undo_all
         then do:
            o_undo = true.      /* TO UNDO THE SHIPPER CONFIRMATION WHEN POSTING FAILS */
            undo progloop, leave progloop.
         end. /* IF undo_all */
  
         if undo_all
         then do:
            run p_display_message (input 8236, input 3).
            run p_display_message (input 8237, input 1).
            pause.
            undo progloop, leave.
         end. /* IF unso_all */

         else do:
 
            find ba_mstr
               where ba_domain = global_domain
               and   ba_batch  = batch
               and   ba_module = "SO"
            exclusive-lock no-error.
 
            if available ba_mstr 
            then
               assign
                  ba_total  = ba_total + batch_tot
                  ba_ctrl   = ba_total
                  ba_userid = global_userid
                  ba_date   = today
                  batch_tot = 0
                  ba_status = "".
 
            release ba_mstr.
 
            /* ZERO SOD_QTY_INV IN REMOTE DOMAIN SOD RECORDS IF THERE ARE*/
            if available so_mstr
            then do:
               {us/bbi/gprun.i ""rcsoisd.p"" "(input so_nbr, input no)"}
            end. /* IF AVAILABLE so_mstr */
         end. /* IF NOT undo_all */
      end. /* DO i = 1 TO inv_ct: */
 
      /* Close the output for invoice post */
      output close.
  
      /*RESTORE SHIP-TO'S AND INVOICE METHOD*/
      do i = 1 to order_ct:
 
         order_num = if (i <= 30)
                     then
                        order_nbrs[i]
                     else
                        entry(i - 30,order_nbr_list).
 
         find so_mstr
            where so_domain     = global_domain
            and   so_nbr        = order_num
            and   so_compl_stat = ""
         exclusive-lock no-error.
 
         if available so_mstr 
         then
            if (i <= 30)
            then
               assign
                  so_ship    = so__qadc01 when ( so__qadc01 <> "" )
                  so__qadc01 = ""
                  so_fob     = temp_fob[i]
                  so_shipvia = temp_shipvia[i].
            else
               assign
                  so_ship    = so__qadc01 when ( so__qadc01 <> "" )
                  so__qadc01 = ""
                  so_fob     = entry(i - 30, temp_fob_list)
                  so_shipvia = entry(i - 30, temp_shipvia_list).
 
      end. /* DO i = 1 to order_ct: */
  
      if {us/bbi/gpiswrap.i} 
      then
         /* POSTING COMPLETE */
         run p_display_message (input 4276, input 1).
      hide message no-pause.
      
      /* CONFIRM PEGGED SHIPPER LINES */
      {us/bbi/gprun.i ""rcsois3a.p"" "(input abs_recid)"}
   end. /* IF auto_post */
    
   for each tt_so_notaxdt,
      first so_mstr
         where so_domain = global_domain
         and   so_nbr    = tt_sonum
      exclusive-lock:
         so_tax_date = ?.
   end. /* FOR EACH tt_so_notaxdt */
   o_undo = false.

end. /* progloop */

PROCEDURE p_display_message:
/*-------------------------------------------------------------------------
* Purpose:      To display message using us/bbi/pxmsg.i
*
* Parameters:   i_msg_nbr      Message number
*               i_err_level    Error Level
*
* Note:         Procedure created to remove Error "Action Segment has
*               exceeded its limit of 63488 bytes".
*-------------------------------------------------------------------------*/
 
   define input  parameter i_msg_nbr      as integer     no-undo.
   define input  parameter i_err_level    as integer     no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=i_msg_nbr &ERRORLEVEL=i_err_level}
 
END PROCEDURE.  /* p_display_message */

PROCEDURE p-check:
 
   define input  parameter ip_sod_nbr    like tt_sonbr    no-undo.
   define input  parameter ip_so_inv_nbr like so_inv_nbr  no-undo.
   define output parameter op_lupdate    like l_increment no-undo.
 
   for each work_abs_mstr
      where work_abs_mstr.abs_order = ip_sod_nbr
   no-lock:
 
      if    ((can-find (first absl_det
         where absl_det.absl_domain  = global_domain
         and   absl_abs_id           = work_abs_mstr.abs_id
         and   absl_order            = work_abs_mstr.abs_order
         and   string(absl_ord_line) = work_abs_mstr.abs_line
         and   absl_abs_shipfrom     = work_abs_mstr.abs_shipfrom
         and   absl_confirmed        = yes
         and   absl_inv_post         = no
         and   absl_lc_amt           <> 0 ))
         or
         (can-find(first absl_det
         where absl_det.absl_domain  = global_domain
         and   absl_order            = work_abs_mstr.abs_order
         and   string(absl_ord_line) = work_abs_mstr.abs_line
         and   absl_abs_shipfrom     = work_abs_mstr.abs_shipfrom
         and   absl_confirmed        = yes
         and   absl_inv_nbr          = ip_so_inv_nbr
         and   absl_inv_post         = no
         and   absl_lc_amt           <> 0 )))
 
         or ((can-find (first abscc_det
         where abscc_det.abscc_domain = global_domain
         and   abscc_abs_id          = work_abs_mstr.abs_id
         and   abscc_order           = work_abs_mstr.abs_order
         and  string(abscc_ord_line) = work_abs_mstr.abs_line
         and   abscc_abs_shipfrom    = work_abs_mstr.abs_shipfrom
         and   abscc_confirmed       = yes
         and   abscc_inv_post        = no
         and   abscc_cont_price      <> 0))
         or
         (can-find(first abscc_det
         where abscc_det.abscc_domain = global_domain
         and   abscc_order           = work_abs_mstr.abs_order
         and  string(abscc_ord_line) = work_abs_mstr.abs_line
         and   abscc_abs_shipfrom = work_abs_mstr.abs_shipfrom
         and   abscc_confirmed    = yes
         and   abscc_inv_nbr      = ip_so_inv_nbr
         and   abscc_inv_post     = no
         and   abscc_cont_price   <> 0)))
      then do:
         op_lupdate = yes .
         leave .
      end. /* IF CAN-FIND (FIRST absl_det ... */
   end. /* FOR EACH work_abs_mstr */
 
END PROCEDURE.

PROCEDURE p_getbatch:
/*--------------------------------------------------------------------
Purpose: Get next AR batch number
---------------------------------------------------------------------*/
 
   if can-find(first soc_ctrl
      where soc_domain = global_domain
      and   soc_ar     = yes)
   then do:
 
      /*Find or create batch number*/
      {us/bbi/gprun.i ""gpgetbat.p""
         "(input batch,
           input ""SO"",
           input ""I"",
           input 0,
           output vba_recno,
           output batch)"}
 
   end. /* IF CAN-FIND(FIRST soc_ctrl.. */
 
END PROCEDURE. /* PROCEDURE p_getbatch */
