/* CYB    LAST MODIFIED: 03DEC18          BY: nac *K10017a*                   */

define {1} shared temp-table tt_loc no-undo
   field tl_soid  as integer /*link to so_mstr*/
   field tl_id  as integer   /*link  for lower tables*/
   field tl_loc as character
   .

define {1} shared temp-table tt_det no-undo
   field td_tlid as integer     /*link to tt_loc */
   field td_sodid as integer    /*link to so */
   field td_sod_link as integer /*link for lower levels*/
   field td_line as integer     
   field td_part as character
   field td_site as character
   field td_type as character
   field td_um as character
   field td_date as character
   field td_custpart as character
   field td_desc1 as character
   field td_desc2 as character
   field td_qtypick like sod_det.sod_qty_ord
   field td_qtyord like sod_det.sod_qty_ord
   field td_pt_pm_code like pt_mstr.pt_pm_code
   .

define {1} shared temp-table tt_grec
   field tg_kitid as integer  /*line to lower table*/
   field tg_line as integer     /*link to upper table */
   field tg_part as character
   field tg_type as character
   field tg_site as character
   field tg_um as character
   field tg_date as character
   field tg_custpart as character
   field tg_desc1 as character
   field tg_desc2 as character
   field tg_qtypick like sod_det.sod_qty_ord
   field tg_qtyord like sod_det.sod_qty_ord
   .
