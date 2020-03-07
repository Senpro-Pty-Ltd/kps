/* xxunpik1.p  - Unpick a Sales Order                                         */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*****************************************************************************/
/* REVISION: 1.0     LAST MODIFIED: 11-SEP-2010     BY: gbg *cy1025*         */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*                                                                           */
/*****************************************************************************/

{us/bbi/mfdeclre.i}

define input  parameter ipnbr          like so_nbr.
define input  parameter ipline         like sod_line.

def var qtyunpicked                 as dec.

def buffer bsod for sod_det.


for first bsod
where sod_domain = global_domain
and   sod_nbr = ipnbr
and   sod_line = ipline:

  qtyunpicked = 0.0.
  for each sob_det
  where sob_domain = global_domain
  and   sob_nbr = ipnbr
  and   sob_line = ipline:
      for each lad_det
      where lad_domain = global_domain
      and   lad_dataset = "sob_det"
      and   lad_nbr = ipnbr
      and   lad_line = string(ipline):
           qtyunpicked = qtyunpicked + lad_qty_pick.
	   lad_qty_pick = 0.
	   if lad_qty_all = 0
	   and lad_qty_pick = 0
	   then delete lad_det.
      end.  /* each lad_det */
      sob_qty_all = sob_qty_all + qtyunpicked.
      sob_qty_pick = sob_qty_pick - qtyunpicked.
  end.  /* each sob_det */

  qtyunpicked = 0.0.
  for each lad_det
  where lad_domain = global_domain
  and   lad_dataset = "sod_det"
  and    lad_nbr = sod_nbr
  and    lad_line = string(sod_line):
        qtyunpicked = qtyunpicked + lad_qty_pick.
	lad_qty_all = lad_qty_all + lad_qty_pick.
	lad_qty_pick = 0.0.
	if lad_qty_all = 0
	and lad_qty_pick = 0
	then delete lad_det.
  end.  /* each lad_det */
  sod_qty_all = sod_qty_all + (qtyunpicked * sod_um_conv).
  sod_qty_pick = sod_qty_pick - (qtyunpicked * sod_um_conv).
  sod_qty_chg = 0.0.
  sod_pickdate = ?.
  sod_compl_stat = "".

end.   /* each lad_det */
