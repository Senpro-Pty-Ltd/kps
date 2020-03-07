/* xxaulad.p - Remove allocations  after shipped by Auto Confirm           */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 09-AUG-2013    BY:  gbg *c1432*                     */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/xx/xxauis2.i}


for each ttLinesProcessed
,
first sod_det
where sod_domain = global_domain
and   sod_nbr = ttLineOrder
and   sod_line = ttLineNumber:
    for each lad_det 
    where lad_domain = global_domain
    and   lad_dataset = "sob_det"
    and   lad_nbr = sod_nbr
    and   lad_line = string(sod_line):
        for first ld_det
	where ld_domain = global_domain
	and   ld_site = lad_site
	and   ld_loc = lad_loc
	and   ld_part = lad_part
	and   ld_lot = lad_lot
	and   ld_ref = lad_ref:
            ld_qty_all = ld_qty_all - lad_qty_all - lad_qty_pick.
	end.
	for first in_mstr
	where in_domain = global_domain
	and   in_site = lad_site
	and   in_part = lad_part:
            in_qty_all = in_qty_all - lad_qty_all - lad_qty_pick.
	end.
	delete lad_det.
    end.
    for each lad_det 
    where lad_domain = global_domain
    and   lad_dataset = "sod_det"
    and   lad_nbr = sod_nbr
    and   lad_line = string(sod_line):
        for first ld_det
	where ld_domain = global_domain
	and   ld_site = lad_site
	and   ld_loc = lad_loc
	and   ld_part = lad_part
	and   ld_lot = lad_lot
	and   ld_ref = lad_ref:
            ld_qty_all = ld_qty_all - lad_qty_all - lad_qty_pick.
	end.
	for first in_mstr
	where in_domain = global_domain
	and   in_site = lad_site
	and   in_part = lad_part:
            in_qty_all = in_qty_all - lad_qty_all - lad_qty_pick.
	end.
	delete lad_det.
    end.
    delete ttLinesProcessed.
end.



