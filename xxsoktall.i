/* xxsoktall.i - PRE-SHIPPER/SHIPPER HARD ALLOCATIONS FOR KIT COMPONENTS */
/* soktall.i - PRE-SHIPPER/SHIPPER HARD ALLOCATIONS FOR KIT COMPONENTS */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoktall.i,v 1.2 2018/03/13 17:10:00 gbg Exp $: */

/* REVISION: 8.6      LAST MODIFIED: 09/27/96   by: flm  *K003*         */
/* REVISION: 8.6      LAST MODIFIED: 12/05/96   BY: *K022* Dennis Henson*/
/* REVISION: 8.6      LAST MODIFIED: 07/28/97   BY: *K0H3* Taek-Soo Chang */
/* REVISION: 8.6      LAST MODIFIED: 11/11/97   BY: *K18W* Suresh Nayak   */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan     */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan     */
/* REVISION: 8.6E     LAST MODIFIED: 02/09/99   BY: *K1ZB* Reetu Kapoor   */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0RF* Mark Brown     */
/* Revision: 1.15     BY: Russ Witt          DATE: 06/01/01 ECO: *P00J*   */
/* Revision: 1.17     BY: Russ Witt          DATE: 08/29/02 ECO: *P0H0*   */
/* Revision: 1.22     BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L*   */
/* $Revision: 1.2 $  BY: Dipanshu Talwar    DATE: 04/28/09 ECO: *Q2NV*   */
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
/***********************************************************/
/* &sort1 = field           &sort2 = "" or descending      */
/***********************************************************/

/* Note - This include file completely rewritten by *P00J*  */

/* LOAD ALL CUSTOMERS TO BE CHECKED INTO ARRAY  */
i = 1.
cust-to-allocate[i] = so_ship.

if so_cust <> so_ship then do:
   i = i + 1.
   cust-to-allocate[i] = so_cust.
end.

if so_bill <> so_ship and so_bill <> so_cust then do:
   i = i + 1.
   cust-to-allocate[i] = so_bill.
end.

allocate-proc:
do i = 1 to 3:
   if cust-to-allocate[i] <> "" then do:

      /* CLEAR TEMP FILE THAT STORES RESERVED LOCATIONS   */
      /*FOR THIS ADDRESS                                  */
      for each tt_resv_loc exclusive-lock:
         delete tt_resv_loc.
      end.

      /* LOAD LOCATIONS TO TEMP TABLE                     */
      for each locc_det
/*d2101* start deleted code  >>>>>>>>>>>>>>>>
      fields( locc_domain locc_site locc_loc locc_primary_loc locc_addr)
*d2101* end   deleted code  <<<<<<<<<<<<<<< */
       where locc_det.locc_domain = global_domain and  locc_site = sod_site
      and locc_addr = cust-to-allocate[i]
      no-lock:
         create tt_resv_loc.
         assign
            tt_loc         = locc_loc
            tt_primary_loc = locc_primary_loc.
      end.   /* FOR EACH LOCC_DET */

      /* BEGIN ALLOCATIONS NOW */
      /* FIRST CHECK FOR PRIMARY RESERVED LOCATION */
      for each tt_resv_loc where tt_primary_loc = yes:
         for each ld_det
/*d2101* start deleted code  >>>>>>>>>>>>>>>>
         fields( ld_domain ld_site ld_part ld_loc ld_qty_oh ld_qty_all
                ld_expire ld_lot ld_ref ld_status ld_date)
*d2101* end   deleted code  <<<<<<<<<<<<<<< */
          where ld_det.ld_domain = global_domain and (  ld_site = {&site}
         and ld_part = {&part}
         and ld_loc = tt_loc
         and ld_qty_oh - max(ld_qty_all,0) > 0
         and ld_qty_oh > 0
         and (ld_expire >= today + icc_ctrl.icc_iss_days
         or ld_expire = ?)
         ) exclusive-lock
         by {&sort1} {&sort2}:
            if this_lot <> ? and ld_lot <> this_lot
            then next.

            run detail-allocate.

            if qty_to_all = 0 then leave allocate-proc.
            delete tt_resv_loc.
         end. /*FOR EACH LD_DET*/
      end.  /* FOR EACH TT_PRIMARY_LOC... */

      /* NOW CHECK FOR ALL NON-PRIMARY RESERVED LOCATIONS */
      for each ld_det
/*d2101* start deleted code  >>>>>>>>>>>>>>>>
      fields( ld_domain  ld_site ld_part ld_loc ld_qty_oh ld_qty_all
              ld_expire ld_lot ld_ref ld_status ld_date)
*d2101* end   deleted code  <<<<<<<<<<<<<<< */
          where ld_det.ld_domain = global_domain and (  ld_site = {&site}
         and ld_part = {&part}
         and can-find(tt_resv_loc where tt_loc = ld_loc)
         and ld_qty_oh - max(ld_qty_all,0) > 0
         and ld_qty_oh > 0
         and (ld_expire >= today + icc_ctrl.icc_iss_days
         or ld_expire = ?)
         ) exclusive-lock
         by {&sort1} {&sort2}:
            if this_lot <> ? and ld_lot <> this_lot
            then next.

         run detail-allocate.

         if qty_to_all = 0 then leave allocate-proc.
      end. /*FOR EACH LD_DET*/

   end. /* cust-to-allocate[i] <> 0 */

end. /* allocate-proc block */

if qty_to_all <> 0
then
   /* NOW CHECK FOR NON-RESERVED LOCATIONS         */
   for each ld_det
/*d2101* start deleted code  >>>>>>>>>>>>>>>>
      fields( ld_domain  ld_site ld_part ld_loc ld_qty_oh ld_qty_all
              ld_expire ld_lot ld_ref ld_status ld_date)
*d2101* end   deleted code  <<<<<<<<<<<<<<< */
      where ld_det.ld_domain = global_domain
      and   (ld_site         = {&site}
      and   ld_part          = {&part}
      and   can-find(is_mstr
                        where is_mstr.is_domain = global_domain
                        and  (is_status         = ld_status
                        and   is_avail          = yes))
      and ld_qty_oh - max(ld_qty_all,0) > 0
      and ld_qty_oh > 0
      and (ld_expire >= today + icc_ctrl.icc_iss_days
             or ld_expire = ?))
   exclusive-lock
   by {&sort1} {&sort2}:
      if this_lot <> ? and ld_lot <> this_lot
      then
         next.

      run detail-allocate.

      if qty_to_all = 0 then leave.
   end. /*FOR EACH LD_DET*/

/*c1403* start added code */


/****************************************************************************/
/* If there is still some qty to allocate and                               */
/* If the item is associated with a location that allows overissue then     */
/* use that location and issue the stock from that location whether or not  */
/* the location contains sufficient stock.                                  */
/*                                                                          */
/****************************************************************************/
if qty_to_all <> 0
then do:
   find first si_mstr no-lock
   where si_domain = global_domain
   and   si_site = {&site}
   no-error.
   find first pt_mstr no-lock
   where pt_domain = global_domain
   and   pt_part = {&part}
   no-error.
   if  available si_mstr
   and available pt_mstr
   then do:
       locdefault = pt_loc.
       find first pti_det no-lock
       where pti_det.oid_pt_mstr = pt_mstr.oid_pt_mstr
       and   pti_det.oid_si_mstr = si_mstr.oid_si_mstr
       no-error.
       if available pti_det then locdefault = pti_loc.
       find first loc_mstr no-lock
       where loc_domain = global_domain
       and   loc_site = {&site}
       and   loc_loc = locdefault
       no-error.
       if available loc_mstr
       then do:
          find first is_mstr no-lock
	  where is_domain = global_domain
	  and   is_status = loc_status
	  no-error.
	  if available is_mstr
	  and  is_avail
	  and  not is_frozen
	  and  is_overissue
	  then do:
             find first ld_det exclusive-lock
	     where ld_domain = global_domain
	     and   ld_site = {&site}
	     and   ld_loc = loc_loc
	     and   ld_part = {&part}
	     and   ld_lot = ""
	     and   ld_ref = ""
	     no-error.
	     if not available ld_det
	     then do:
                 create ld_det.
		 assign
		 ld_domain = global_domain
		 ld_site = {&site}
		 ld_loc = loc_loc
		 ld_part = {&part}
		 ld_lot = ""
		 ld_ref = ""
		 ld_status = is_status.
	     end.
                 run detail-allocate.
	  end.
       end.

   end.
end.   /* if qty_to_all <> 0 */
