/* xxsoclose.p - Close a Sales Order after shipped by Auto Confirm           */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 8-SEP-2011      BY: gbg *cy1021*         */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 11-APR-2012    BY:  gbg *c1294*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 30-MAY-2013    BY:  gbg *c1414*                     */
/* CYB    LAST MODIFIED: 17-JUN-2013    BY:  gbg *c1418*                     */
/* CYB    LAST MODIFIED: 02-AUG-2013    BY:  gbg *c1426*                     */
/* CYB    LAST MODIFIED: 2015-01-07     BY:  gbg *c1512*                     */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/rc/rcwabsdf.i NEW}

define input parameter ipnbr     like so_nbr.



define            variable  ipclose       as logical init no.
define            variable using_shipment_perf  like mfc_logical no-undo.
define            variable effdate       like glt_effdate.
define            variable closeit        as logical.
/*c1426*/ define shared variable post_inv like mfc_logical no-undo.
{us/in/inmrp1.i}

/* End of definitions ********************************************************/


/* DETERMINE IF SHIPMENT PERFORMANCE IS INSTALLED */
for first mfc_ctrl
   where mfc_domain = global_domain
   and   mfc_field = "enable_shipment_perf"
   and   mfc_module = "ADG"
   and   mfc_logical = yes
no-lock:
   using_shipment_perf = yes.
end.
effdate = today.


find first so_mstr 
where so_domain = global_domain
and   so_nbr = ipnbr
no-error.


if not available so_mstr then return.


if so_compl_stat = "01" then return.



for each sod_det
where sod_domain = global_domain
and   sod_nbr = so_nbr:

   /****************************************************/
   /* Update Shipment performance records              */
   /****************************************************/


/*mod2015*/
      if using_shipment_perf
         and (  (sod_due_date <= effdate)
             or (sod_per_date <= effdate)
             or (sod_req_date <= effdate)
             or (sod_qty_chg  <> 0 ) 
             or (sod_qty_ship + sod_qty_chg <> sod_qty_ord)
             )
      and  not can-find(first shp_hist
                 where shp_domain = global_domain
/*c1512* start added code */
		 and   shp_include
		 and   shp_part = sod_part
		 and   shp_shipfrom = sod_site
/*c1512* end   added code */
		 and   shp_nbr = sod_nbr
		 and   shp_line = sod_line)
      then do:
           {us/bbi/gprun.i ""xxsoshpso.p""
                    "(input recid(sod_det),
                                   input '',
                                   input '',
                                   input '',
                                   input no,
                                   input 0,
                                   input yes,
                                   input 0,
                                   input no)"}
      end. /* IF using_shipment_perf */

   /****************************************************/
   /* Undo any general allocations                     */
   /****************************************************/
   for first in_mstr 
   where in_domain = global_domain
   and   in_site = sod_site
   and   in_part = sod_part:
           in_qty_all = in_qty_all - sod_qty_all.
	   in_qty_req = in_qty_req  - sod_qty_ord + sod_qty_ship.
   end.

   /****************************************************/
   /* Remove mrp records particularly for cancelled    */
   /* back order lines                                 */
   /****************************************************/
   {us/mf/mfmrw.i "sod_det" sod_part sod_nbr string(sod_line) """"
            ? sod_due_date "0" "DEMAND" SALES_ORDER sod_site}

   {us/mf/mfmrwdel.i "sod_fas" sod_part sod_nbr string(sod_line) """" }

   for each sob_det no-lock
   where sob_domain = global_domain
   and   sob_nbr = sod_nbr 
   and   sob_line = sod_line:
      run inmrp (sob_part, sob_site).
      {us/mf/mfmrwdel.i "sob_det" sob_part sob_nbr 
            "string(sob_line) + ""-"" + sob_feature" sob_parent}
   end.


   /****************************************************/
   /* Update Order Line Quantities                     */
   /****************************************************/
   sod_qty_ord = sod_qty_ship.
   sod_qty_all = 0.0.
   sod_qty_chg = 0.0.
   sod_bo_chg = 0.0.

   /****************************************************/
   /* Set completed flag on order line                 */
   /****************************************************/
/*c1426*/ if post_inv then 
   assign
   sod_compl_stat = "01"
   sod_compl_date = today.


end.

/*c1426*/ if post_inv then
          assign
/*c1414*/ so_compl_stat = "01"
/*c1418*/ so_compl_date = today.




/*debug* >> */
def stream logit.
procedure logit.
define input parameter ipmsg as char.
  output stream logit to /tmp/gbglog append.
  put stream logit unformatted
  string(today) ":"
  string(time, "HH:MM:SS") ":"
  global_userid ":"
  ipmsg
  skip.
  output stream logit close.
end.
/*debug* << */
