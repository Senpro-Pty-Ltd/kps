/* xxcimdsdois  -  CIM TO DISTRIBUTED ORDERS SHIPMENT                         */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB    LAST MODIFIED: 08 Sep 2010    BY:  nac *q9021*C1197*              */
/* CYB    LAST MODIFIED: 08 Sep 2010    BY:  nac *q9021*C1197a*              */
/* CYB    LAST MODIFIED: 22 Sep 2010    BY:  nac *q9021*C1197b*              */
/* CYB    LAST MODIFIED: 22 Sep 2010    BY:  nac *q9021*C1197c*              */
/* CYB    LAST MODIFIED: 30 Sep 2010    BY:  nac *q9021*C1197d*              */
/* CYB    LAST MODIFIED: 04 Oct 2010    BY:  nac *q9021*C1197e*              */
/* CYB    LAST MODIFIED: 04 Oct 2010    BY:  nac *q9021*C1197f*              */
/* CYB    LAST MODIFIED: 04 Feb 2011    BY:  nac *q9021*C1197g*              */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 15-SEP-2011    BY:  gbg *c1243*                     */
/* CYB    LAST MODIFIED:                BY:  nac *ca791753*                  */
/* CYB    LAST MODIFIED: 22-SEP-2011    BY:  gbg *c1245*                      */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1022*              */
/* CYB                LAST MODIFIED: 13-JUN-2012 BY: gbg *c1312*           */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                LAST MODIFIED: 11-Feb-2013 BY: nac *c1363*           */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/* CYB                LAST MODIFIED: 28-FEB-2017 BY: nac *d3736*           */
/*                                                                            */


{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}

define input parameter ipnbr    as char.
define input parameter ipshipsite    as char.
define output parameter operr   as int.
define output parameter opmsg   as char.

/*cy1022a*/ define shared variable cyb_so_type as char no-undo.

def var group_id as int no-undo.
def var error_ind as log no-undo.
def var error_msg as char no-undo.
def var line_no as int no-undo.
def var progress_errors as int no-undo.
def var function_errors as int no-undo.
def var function_warnings as int no-undo.
def var group_list as char no-undo.
def var linedata as char no-undo.
def var confdata as char no-undo.

def buffer bcomponents for pt_mstr.
def var vAllAvailable as log.
/*c1197d*/ def var issmsg as char format "x(50)".
/*nac*/ define variable v_ship_frame as logical no-undo.
/*nac*/ define variable v_shipgrp like sg_grp no-undo.

/*c1363>>*/
def var pos_qty as logical initial no.
def var neg_qty as logical initial no.
/*c1363<<*/

define variable open_qty like ds_qty_conf column-label "Qty Open" no-undo.

{us/xx/xxshipfns.i}  /* Shipping functions */

find first dss_mstr no-lock
where dss_domain = global_domain
and   dss_nbr = ipnbr
and   dss_shipsite = ipshipsite 
no-error.
if not available dss_mstr
then do:
  operr = 1.
  opmsg = "DO " + ipnbr + " does not exist in domain " + 
          global_domain.
  return.
end.


operr = 0.
opmsg = "Success".

{us/bbi/gprun.i ""xxbdlid.p""
       "("""",
          ""xxdois.p"",
          output group_id,
          output error_ind,
          output error_msg)"}


linedata = dss_nbr + " " + dss_shipsite + " - - - no".
/*Order Number + Site + Ship-to + Date + Ship Allocated + Ship Picked */

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

linedata = "- - - -".
/* FreightData */

{us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

for each ds_det no-lock use-index ds_nbr
where ds_domain = global_domain
  and (ds_nbr = dss_nbr
  and ds_shipsite = dss_shipsite):

  open_qty = max(ds_qty_conf - max(ds_qty_ship,0),0).

  if open_qty <> 0
  then do:
    linedata = ds_part + " " + ds_req.
    {us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

    find first loc_mstr
    where loc_domain = global_domain
      and loc_site = dss_shipsite
      and loc_status = "AVAIL"
      no-lock no-error.
    if available loc_mstr then
       linedata = "0 yes - " + trim(loc_loc) + " - - -".
    else
       linedata = "0 yes - - - - -".
   
    {us/bbi/gprun.i ""xxbdld.p""
      "("""",
         group_id,
         linedata,
         input-output line_no,
         output error_ind,
         output error_msg)"}

   end.  
end.

linedata =  ".".    /* finished lines */
{us/bbi/gprun.i ""xxbdld.p""
    "("""",
       group_id,
       linedata,
       input-output line_no,
       output error_ind,
       output error_msg)"}

linedata =  "yes".    /* Display items being issued */
{us/bbi/gprun.i ""xxbdld.p""
    "("""",
       group_id,
       linedata,
       input-output line_no,
       output error_ind,
       output error_msg)"}

linedata = "yes".  /* all information correct */
{us/bbi/gprun.i ""xxbdld.p""
    "("""",
       group_id,
       linedata,
       input-output line_no,
       output error_ind,
       output error_msg)"}

linedata = "- - - - - - -".   /* Trailer screen */
{us/bbi/gprun.i ""xxbdld.p""
    "("""",
       group_id,
       linedata,
       input-output line_no,
       output error_ind,
       output error_msg)"}


linedata =  ".".  /* exit program */
{us/bbi/gprun.i ""xxbdld.p""
    "("""",
       group_id,
       linedata,
       input-output line_no,
       output error_ind,
       output error_msg)"}


group_list = string(group_id,"99999999").

{us/bbi/gprun.i ""xxbdxpro.p"" 
             "("""",
               group_list,
               no, no,
               output progress_errors,
               output function_errors,
               output function_warnings)"}


if progress_errors > 0
or function_errors > 0
then do:
    find first usrw_wkfl no-lock
    where 
/*c1125*/ usrw_domain = global_domain and
    usrw_key1 = "CIM_OUT" + string(group_id, "99999999")
    no-error.
    if available usrw_wkfl
    then do:
       operr = progress_errors + function_errors.
       opmsg = usrw_charfld[1].
    end.
end.

