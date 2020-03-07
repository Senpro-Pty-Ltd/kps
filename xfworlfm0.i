/* xfworlfm0.i FORMTRAP Include file                                          */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

procedure print_header:
   put stream ft 
      "0"               at 1    format "x(1)"   /* Record type */
      wo_mstr.wo_nbr    at 2    format "x(18)"  /* Work order # */
      wo_mstr.wo_lot    at 20   format "x(8)"   /* Work order ID  */
      wo_mstr.wo_batch  at 28   format "x(18)"  /* Batch  */
      wo_mstr.wo_part   at 46   format "x(18)"  /* Item Number     */
      par_rev           at 64   format "x(4)"   /* Revision */
      year(wo_mstr.wo_due_date) at 76   format "9999"   /* Due Date year */
      month(wo_mstr.wo_due_date) at 80   format "99" /* Due Date month */
      day(wo_mstr.wo_due_date) at 82   format "99" /* Due Date Day  */
      wo_des            at 84   format "x(48)"  /* Description */
      wo_mstr.wo_rmks   at 132  format "x(40)"  /* Remarks */
      wo_mstr.wo_so_job at 172  format "x(8)"   /* Sales/Job */
      wo_qty            at 180  format "->>>>>>>>9.999999999" /* Qty */
      wo_um             at 200  format "x(2)"   /* UM */
      wo_mstr.wo_site   at 202  format "x(8)"   /* Site */
      deliv             at 210  format "x(8)"   /* Deliver to */
      par_draw          at 218  format "x(18)"  /* Drawing   */
      year(today)   at 236  format "9999"   /* Print Date */
      month(today)  at 240  format "99"
      day(today)    at 242  format "99"
      string(time,"hh:mm:ss") at 244  format "x(8)"   /* Print Time */
      "W/O BY-PRODUCTS" at 747  format "x(15)"  /* doc id */
   .

   {us/xf/xfemailu.i "stream ft"} /* user email - record "0" */

   {us/xf/xfworlu0.i} /* user code - record "0" */

   put stream ft  skip.

   /* Work Order Co/By-Product Receipts */
   put stream ft 
     "1"                  at 1     format "x(1)"    /* Record Type 1 */
     "Work Order Co/By-Products Receipts"
                          at 2     format "x(40)"   /* Title */
   .

   {us/xf/xfworlu1.i}       /* user code - record type "1" */

   put stream ft  skip.
end procedure.
