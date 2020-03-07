/* xx1347.i - Procedures and Functions                                       */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 02-OCT-2012     BY: gbg *c1347*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/


procedure vandealloc.
define input parameter iprecno  as recid.

  for first ds_det
  where recid(ds_det) = iprecno:
     for each lad_Det
     where lad_domain = global_domain
     and   lad_dataset = "ds_det"
     and   lad_nbr = ds_req_nbr
     and   lad_line = ds_site
     and   lad_part = ds_part
     and   lad_site = ds_shipsite:
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
        and   in_site = ds_shipsite
        and   in_part = ds_part:
           in_qty_all = in_qty_all - (lad_qty_all + lad_qty_pick).
        end.
        delete lad_det.
     end.
     ds_qty_all = 0.
     ds_qty_pick = 0.
  end.  /* for each ds_det .. */
end.  /* procedure vandealloc */


procedure vanalloc.
define input parameter iprecid     as recid.
define input parameter iploc       like loc_loc.
/****NB NB NB *********************************************************/
/* This procedure should only be used for van allocations in do       */
/* maintenance. It is NOT a general purpose allocation procedure      */
/*                                                                    */
/* Unloading vans - always allocate the stock from the van location   */
/* ignoring stock levels and location status                          */
/*                                                                    */
/****NB NB NB *********************************************************/


  find first ds_det exclusive-lock
  where recid(ds_det) = iprecid
  no-error.
  if not available ds_det then return.

  find first loc_mstr no-lock
  where loc_domain = global_domain
  and   loc_site = ds_shipsite
  and   loc_loc = iploc
  no-error.
  if not available loc_mstr then return.

  /**************************************************************/
  /* First clear all previous allocations                       */
  /* so we can start from scratch to force allocation from      */
  /* the selected van location                                  */
  /**************************************************************/
  run vandealloc (iprecid).


  find first ld_det
  where ld_domain = global_domain
  and   ld_site = ds_shipsite
  and   ld_loc = iploc
  and   ld_part = ds_part
  and   ld_lot = ""
  and   ld_ref = ""
  no-error.
  if not available ld_det
  then do:
      create ld_det.
      assign
      ld_domain = global_domain
      ld_site = ds_shipsite
      ld_loc = iploc
      ld_part = ds_part
      ld_lot = ""
      ld_ref = ""
      ld_status = loc_status.
  end.  /* not can-find(first ld_det .. */

  find first lad_Det
  where lad_domain = global_domain
  and   lad_dataset = "ds_det"
  and   lad_nbr = ds_req_nbr
  and   lad_line = ds_site
  and   lad_part = ds_part
  and   lad_site = ds_shipsite
  no-error.
   
  if not available lad_det
  then do:
     create lad_det.
     assign
     lad_domain = global_domain
     lad_dataset = "ds_det"
     lad_nbr = ds_req_nbr
     lad_line = ds_site
     lad_part = ds_part
     lad_site = ds_shipsite
     lad_loc = loc_loc
     lad_lot = ld_lot
     lad_ref = ld_ref.
  end.  /* not available lad_det */

  find first in_mstr
  where in_domain = global_domain
  and   in_site = ds_shipsite
  and   in_part = ds_part
  no-error.
  if not available in_mstr
  then do:
     create in_mstr.
     assign
     in_domain = global_domain
     in_site = ds_shipsite
     in_part = ds_part.
  end.  /* not can-find(fisrt in_mstr .. */

  in_qty_all = in_qty_all + ds_qty_ord
                          - ds_qty_all
                          - ds_qty_pick
                          - ds_qty_ship.
  lad_qty_all = lad_qty_all + ds_qty_ord 
                            - ds_qty_all 
                            - ds_qty_pick
                            - ds_qty_ship.
  ld_qty_all = ld_qty_all + ds_qty_ord 
                          - ds_qty_all 
		   - ds_qty_pick
		   - ds_qty_ship.
  ds_qty_all = ds_qty_ord - ds_qty_pick
                          - ds_qty_ship.

end.  /* procedure vanalloc */
