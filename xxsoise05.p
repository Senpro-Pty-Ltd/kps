/* xxsoise05.p - SALES ORDER COMPONENT ISSUE INPUT SIMULATION                 */
/* soise05.p - SALES ORDER COMPONENT ISSUE INPUT SIMULATION                   */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoise05.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 04/08/96   by: ais  *G1RS*               */
/* REVISION: 8.6      LAST MODIFIED: 09/24/96   by: flm  *K003*               */
/* REVISION: 8.6      LAST MODIFIED: 11/06/97   by: *K15N* Jim Williams       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 07/13/99   BY: *J2MD* A. Philips         */
/* REVISION: 9.1      LAST MODIFIED: 02/10/99   BY: *N07V* Kedar Deherkar     */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb                */
/* Old ECO marker removed, but no ECO header exists *L13N*                    */
/* Revision: 1.7.1.4     BY: Rajaneesh S.         DATE: 02/21/02  ECO: *L13N* */
/* Revision: 1.7.1.6     BY: Paul Donnelly (SB)   DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.7.1.7     BY: Karan Motwani        DATE: 01/13/04  ECO: *P1HP* */
/* Revision: 1.7.1.8     BY: Karan Motwani        DATE: 01/21/04  ECO: *P1KK* */
/* Revision: 1.7.1.9     BY: Jean Miller          DATE: 03/05/04  ECO: *Q06C* */
/* Revision: 1.7.1.10    BY: Vinod Kumar          DATE: 12/20/04  ECO: *P2TK* */
/* Revision: 1.7.1.11    BY: Binoy John           DATE: 01/27/05  ECO: *P35M* */
/* Revision: 1.7.1.12    BY: Prashant Menezes     DATE: 02/27/07  ECO: *P5PS* */
/* Revision: 1.7.1.13    BY: Warren Pinto         DATE: 12/27/07  ECO: *P6B3* */
/* Revision: 1.7.1.14    BY: Jean Miller          DATE: 06/19/08  ECO: *R0VD* */
/* $Revision: 1.2 $ BY: Katie Hilbert        DATE: 04/14/09  ECO: *Q2QR* */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CYB    LAST MODIFIED:                BY:  gbg *cy1238*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB        LAST MODIFIED: 11-NOV-2011    BY* gbg *c1258*                   */
/* CYB        LAST MODIFIED: 11-NOV-2011    BY* gbg *c1260*                   */
/* CYB   LAST MODIFIED: 22-MAR-2012  BY:  gbg *c1287*                  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 22-FEB-2013    BY:  gbg *c1367*                      */
/* CYB    LAST MODIFIED: 15-MAR-2013    BY:  gbg *c1374*                      */
/* CYB    LAST MODIFIED: 12-APR-2013    BY:  gbg *c1379*                      */
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
{us/px/pxmaint.i}
{us/px/pxphdef.i gpumxr}
{us/gp/gpuid.i}

/*c1238*/ {us/xx/xx1021.i NEW}
/*c1238*/ def var vSuccess as logical.
/*c1238*/ def var vAllocd  as logical init no.
/*c1238*/ def var wrkQty   as decimal.
/*c1238*/ {us/xx/xxfnkit.i}
 
define input parameter sonbr like so_nbr no-undo.
 
define new shared variable back_site like sr_site.
define new shared variable transtype as character initial "ISS-WO".
define new shared variable display-messages as logical no-undo.
define new shared variable cline as character.
define new shared variable undo-input like mfc_logical.
define new shared variable filter_status like is_status.
define new shared variable filter_loc like ld_loc.
define new shared variable filter_expire like ld_expire.
define new shared variable trans_um like pt_um.
 
define shared variable undo-all like mfc_logical initial yes no-undo.
define shared variable so_recno as recid.
define shared variable picking_logic like mfc_logical.
define shared variable change_db like mfc_logical.
define shared variable eff_date  like glt_effdate.
 
define variable back_assy    like pt_part label "Backflush Assy" no-undo.
define variable back_qty     like sr_qty no-undo.
define variable back_um      like pt_um no-undo.
define variable back_conv    like um_conv label "Conv" no-undo.
define variable back_loc     like sr_loc no-undo.
define variable l_flag       like mfc_logical no-undo.
define variable l_undo       like mfc_logical no-undo.
define variable pm_code      like pt_pm_code no-undo.
define variable temp_qty     as decimal no-undo.
define variable any_rejected like mfc_logical no-undo.
define variable rejected     like mfc_logical no-undo.
 
define buffer ptmaster for pt_mstr.
define buffer ptmstr for pt_mstr.


/*c1238*/ define buffer sobptmstr for pt_mstr.
/*c1238* start added code  >>>>>>>>>>>>>>>>>>> */
function fQtyOH returns decimal (ippart as char, ipsite as char):
define var vQOH as dec.
   vQOH = 0.0.
   for first in_mstr no-lock
   where  in_domain = global_domain
   and    in_site = ipsite
   and    in_part = ippart:
      vQOH = vQOH + in_qty_oh.
   end.
   return max(0, vQOH).
end.


function useLoc returns char (ipsite as char, iploc as char, ippart as char):
  find first pt_mstr no-lock
  where pt_domain = global_domain
  and pt_part = ippart
  no-error.
  find first si_mstr no-lock
  where si_domain = global_domain
  and   si_site = ipsite
  no-error.
  if not available si_mstr then return iploc.
  find first pti_det no-lock
  where pti_det.oid_pt_mstr = pt_mstr.oid_pt_mstr
  and   pti_det.oid_si_mstr = si_mstr.oid_si_mstr
  no-error.
  find first loc_mstr no-lock
  where loc_domain = global_domain
  and loc_site = ipsite
  and loc_loc = iploc
  and iploc <> ?
  and iploc <> ""
  no-error.
  if not available loc_mstr
  then do:
     if available pti_det then
       find first loc_mstr no-lock
       where loc_domain = global_domain
       and loc_site = ipsite
       and loc_loc = pti_loc
       no-error.
     else
       if available pt_mstr then
       find first loc_mstr no-lock
       where loc_domain = global_domain
       and loc_site = ipsite
       and loc_loc = pti_loc
       no-error.
       else return "".
  end.
  return if available loc_mstr then loc_loc else "".

end.  /* function useLoc */
/*c1238* end   added code  >>>>>>>>>>>>>>>>>>> */

/*c1379*  start added code */
function fQtyOHLoc returns decimal (ippart as char, ipsite as char, iploc as char).

define variable vReturn       as decimal.
vReturn = 0.0.
for each ld_det no-lock
where ld_domain = global_domain
and   ld_site = ipsite
and   ld_loc = iploc
,
first is_mstr no-lock
where is_domain = global_domain
and   is_status = ld_status
and   is_avail:
   vReturn = vReturn + ld_qty_oh - ld_qty_all.
end.
return vReturn.

end.  /* function fQtyOHLoc */

function fOrderlineLoc returns char (ipnbr as char ,  
                                     ipline as int, 
				     ippart as char).
for first sod_det no-lock
where sod_domain = global_domain
and   sod_nbr = ipnbr
and   sod_line = ipline:
   if sod_part = ippart
   then return sod_loc.
   for first sob_det no-lock
   where sob_domain = global_domain
   and   sob_nbr = sod_nbr
   and   sob_line = sod_line
   and   sob_part = ippart:
      return sob_loc.
   end.
   return useloc(sod_site, sod_loc, ippart).
end.

return "".
end.  /* function fOrderlineLoc */

/*c1379*  end added code */




/*c1238* start added code */
/*c1238*/  run plbattlist.
/*c1238* end added code */



 
/* IF THE INVENTORY DB IS THE SAME AS THE CENTRAL DB LOOKUP */
/* SALES ORDER BY recid FOR MORE EFFICIENT PROCESSING.      */
if change_db
then do:
   for first so_mstr where so_domain = global_domain
      and so_nbr = sonbr
      and so_compl_stat = ""
   no-lock: end.
end.
 
else do:
   for first so_mstr where recid(so_mstr) = so_recno
   no-lock: end.
end.
 
sodloop:
 
/* INCREASED THE TRANSACTION SCOPE BY INTRODUCING AN */
/* EXCLUSIVE-LOCK ON SOD_DET                         */
for each sod_det where sod_domain = global_domain
   and sod_nbr = so_nbr
   and sod_compl_stat = ""
exclusive-lock
/*c1238*/ by sod_line
:
 
   if sod_fa_nbr <> ""   or
      sod_cfg_type = "1" or      /* Assemble-to-Order = "1" */
      not can-find(first sob_det where sob_domain = global_domain
                                   and sob_nbr = sod_nbr
                                   and sob_line = sod_line)
   then
      next sodloop.
 
   for first pt_mstr where pt_domain = global_domain
      and pt_part = sod_part
   no-lock: end.
 
   assign
      back_assy     = sod_part
      back_loc      = ""
      back_site     = sod_site
      back_qty      = sod_qty_ord - sod_qty_ship
      back_um       = sod_um
      back_conv     = sod_um_conv
      filter_loc    = ""
      filter_status = ""
      filter_expire = ?
      undo-all      = yes.
 
   mainloop:
   repeat on error undo, retry:
 
      if c-application-mode = "API" and retry
         then return error return-value.
      undo-all = yes.
 
      if back_um <> pt_um
      then do:
 
         {us/px/pxrun.i &PROC  = 'retrieveUMConversion' &PROGRAM = 'gpumxr.p'
                        &HANDLE=ph_gpumxr
                        &PARAM="(input back_assy,
                                 input pt_um,
                                 input back_um,
                                 output back_conv)"
                        &NOAPPERROR=True
                        &CATCHERROR=True}
 
         if back_conv = ?
         then do:
            {us/bbi/pxmsg.i &MSGNUM=33 &ERRORLEVEL=2}
            /* Unable to backflush line #.  Do manually */
            {us/bbi/pxmsg.i &MSGNUM=1268 &ERRORLEVEL=2 &MSGARG1=string(sod_line)}
            if c-application-mode <> "API" then
               pause 2.
            undo sodloop, next sodloop.
         end.
 
      end.
 
      for each sr_wkfl
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
         and  (sr_lineid = string(sod_line)
             or sr_lineid begins (string (sod_line)+ "ISS"))
      exclusive-lock:
         delete sr_wkfl.
      end.
 
      for each lotw_wkfl
         where lotw_domain = global_domain and lotw_userid = SessionUniqueID
      exclusive-lock:
         delete lotw_wkfl.
      end.  /* FOR EACH lotw_wkfl */
 
      for each pk_det
         where pk_domain = global_domain and pk_user = SessionUniqueID
      exclusive-lock:
         delete pk_det.
      end.
 
      for each sob_det
         where sob_domain = global_domain
           and sob_nbr  = sod_nbr
           and sob_line = sod_line
           and sob_qty_req <> 0
      no-lock:
 
         /* PLACE NON-CONFIGURED SO BILL ITEMS IN PACK LIST DETAIL */
         pm_code = "".
 
         for first ptmaster
            where ptmaster.pt_domain = global_domain
              and ptmaster.pt_part = sob_part
         no-lock: end.
 
         if available ptmaster then
            pm_code = ptmaster.pt_pm_code.
 
         for first ptp_det
            where ptp_domain = global_domain
              and ptp_part = sob_part
              and ptp_site = sob_site
         no-lock: end.
 
         if available ptp_det then
            pm_code = ptp_pm_code.
 
         if pm_code <> "C"
         then do:
 
            find first pk_det
                where pk_domain = global_domain
                  and pk_user = SessionUniqueID
                 and pk_part = sob_part
            exclusive-lock no-error.
 
            if not available pk_det
            then do:
 
               create pk_det.
               assign
                  pk_domain = global_domain
                  pk_user = SessionUniqueID
                  pk_part = sob_part
                  pk_loc  = if back_loc > "" then back_loc
                                             else sob_loc.
               if recid(pk_det) = -1 then .
 
            end.
 
            if sod_um_conv <> 0 and sod_qty_ord <> 0
            then
               pk_qty = pk_qty + (sob_qty_req / sod_um_conv / sod_qty_ord)
                                 * back_qty * back_conv.
         end.
 
      end.  /* sob_det */
 
      cline = string(sod_line) + "ISS".
 
      if picking_logic
      then do:
 
         display-messages = false.
/*c1258*          {us/bbi/gprun.i ""soise02.p"" */
/*c1258*/         {us/bbi/gprun.i ""xxsoise02.p""
                      "(input sod_nbr,
                        input sod_line)"}
 
 /*c1238* start deleted code >>>>>>
         for each sob_det
             where sob_domain = global_domain
               and sob_nbr = sod_nbr
              and sob_line = sod_line
         no-lock:
*c1238* end deleted code <<<<<<<<< */

/*c1238* start added code >>>>> */
             for first sob_det no-lock
             where sob_domain = global_domain
             and sob_nbr = sod_nbr
             and sob_line = sod_line
             and can-find(first sobptmstr 
             where sobptmstr.pt_domain = global_domain
             and   sobptmstr.pt_part = sob_part
             and   lookup(sobptmstr.pt_prod_line, pl_batterys) <> 0)
             ,
             first sobptmstr no-lock
             where sobptmstr.pt_domain = global_domain
             and   sobptmstr.pt_part = sob_part
             and   lookup(sobptmstr.pt_prod_line, pl_batterys) <> 0:
/*c1238* end added code <<<<<<<<< */ 

            temp_qty = 0.
 
            for each sr_wkfl where sr_domain = global_domain
                 and sr_userid = SessionUniqueID
                 and sr_lineid begins string(sod_line) + "ISS" + sob_part
            no-lock:
               temp_qty = temp_qty + sr_qty.
            end.

/*c1238* start added code 2012-03-28 */

/*c1379* start added code */
            wrkQty =   fqtyohloc(sob_part,
	                            sod_site,
				    sob_loc)
		       - shipsofar(sod_nbr, sob_part, sod_line).
/*c1379* end added code */

            if temp_qty > 0
	    and  temp_qty > wrkQty
	    then do:
	      if wrkQty < 0
	      then wrkQty = 0.
	      temp_qty = wrkQty.

              for each sr_wkfl where sr_domain = global_domain
              and sr_userid = SessionUniqueID
              and sr_lineid begins string(sod_line) + "ISS" + sob_part:
                  if wrkQty > sr_qty then wrkQty = wrkQty - sr_qty.
		  else do:
                     sr_qty = wrkQty.
		     wrkQty = 0.
		  end.
              end.  /* for each sr_wkfl */

	    end.  /* if temp_qty > 0 */

/*c1238* end   added code 2012-03-28 */
/*cy1238*/   sod_qty_chg = 0.
/*cy1238*/   sod_qty_all = sod_qty_ord - sod_qty_ship - sod_qty_pick.




 
            if temp_qty <> (sob_qty_req - sob_qty_iss)
            then do on endkey undo sodloop, next sodloop
                    on error  undo sodloop, next sodloop:
/*c1238* start added coded >>>>>*/
                vAllocd = yes.
                {us/bbi/gprun.i ""xxchgiss.p""
		         "(so_nbr,
			   sod_line,
			   sob_part,
			   recid(sob_det),
			   temp_qty,
			   output vSuccess)"}
/*c1238* end   added coded <<<<<*/

/*c1238* start deleted code >>>>
               /* Unable to backflush line #.  Do manually */
               {us/bbi/pxmsg.i &MSGNUM=1268 &ERRORLEVEL=2 &MSGARG1=string(sod_line)}
               if c-application-mode <> "API" then
                  pause 2.
               undo sodloop, next sodloop.
*c1238* end deleted code  <<<<<< */
            end.
/*c1260*/   else sod_qty_chg = sod_qty_ord - sod_qty_ship.
 
         end.
 
      end.
 
      else do:
 
         any_rejected = no.
 
         for each pk_det where pk_domain = global_domain
            and pk_user = SessionUniqueID
         no-lock:
 
            find first sr_wkfl
               where sr_domain = global_domain
                 and sr_userid = SessionUniqueID
                 and sr_lineid = cline + pk_part
                 and sr_site   = back_site
                 and sr_loc    = pk_loc
            exclusive-lock no-error.
 
            /* VALIDATE SHIP-FROM LOCATIONS */
            for first ptmstr
                where ptmstr.pt_domain = global_domain
                  and ptmstr.pt_part = pk_part
            no-lock: end.
 
            {us/bbi/gprun.i ""icedit2.p""
               "(input ""ISS-WO"",
                 input back_site,
                 input pk_loc,
                 input pk_part,
                 input """",  input """",
                 input pk_qty +
                       if available sr_wkfl
                       then
                          sr_qty else 0,
                 input if available ptmstr
                       then
                          ptmstr.pt_um else """",
                 input """",
                 input """",
                 output rejected)"}
 
            if rejected then
            do on endkey undo sodloop, retry sodloop:
               any_rejected = yes.
               /* Unable to backflush line #.  Do manually */
               {us/bbi/pxmsg.i &MSGNUM=1268 &ERRORLEVEL=2 &MSGARG1=string(sod_line)}
               if c-application-mode <> "API" then
                  pause 2.
               undo sodloop, next sodloop.
            end.
 
            if not available sr_wkfl
            then do:
               create sr_wkfl.
               assign
                  sr_domain = global_domain
                  sr_userid = SessionUniqueID
                  sr_lineid = cline + pk_part
                  sr_site   = back_site
                  sr_loc    = pk_loc.
               if recid(sr_wkfl) = -1 then .
            end.
 
            sr_qty = sr_qty + pk_qty.
 
         end.
 
      end.   /* picking_logic = false */
 
      /* MAKE SURE THERE IS AT LEAST ONE SR_WKFL RECORD FOR EACH PK_DET*/
      for each pk_det
          where pk_domain = global_domain and pk_user = SessionUniqueID
      no-lock:
 
         for first sr_wkfl
             where sr_domain = global_domain
               and sr_userid = SessionUniqueID
               and sr_lineid = cline + pk_part
         no-lock: end.
 
         if not available sr_wkfl
         then do:
            create sr_wkfl.
            assign
               sr_domain = global_domain
               sr_userid = SessionUniqueID
               sr_lineid = cline + pk_part
               sr_site   = back_site
               sr_loc    = pk_loc.
            if recid(sr_wkfl) = -1 then .
         end.
 
      end.
 
      create sr_wkfl.
      assign
         sr_domain = global_domain
         sr_userid = SessionUniqueID
         sr_lineid = string(sod_line)
         sr_site   = back_site
         sr_loc    = sod_loc
         sr_qty    = sod_qty_ord - sod_qty_ship.
/*c1238*/ if vallocd then sr_qty = sod_qty_chg.
      if recid(sr_wkfl) = -1 then .
 

/*c1238* start added code */
      assign
         sod_qty_chg = if vallocd then sod_qty_chg else (sod_qty_ord - sod_qty_ship)
         sod_bo_chg = sod_qty_ord - sod_qty_ship - sod_qty_chg.
/*c1238* end added code */


/*c1238* start deleted code >>>>
      assign
         sod_qty_chg = sod_qty_ord - sod_qty_ship
         sod_bo_chg = 0.
*c1238* end deleted code <<<<<< */ 
      leave.
 
   end.  /* mainloop */
 
   /* LOGIC INTRODUCED FOR DELETION OF sr_wkfl RECORDS OF LINES */
   /*     WHICH CANNOT BE SHIPPED DUE TO INSUFFICIENT INVENTORY */
   /*               WHEN OVERISSUE IS SET TO NO                 */
   l_flag  = no .
 
   for each pk_det
      where pk_domain = global_domain
      and   pk_user   = SessionUniqueID
   no-lock:
 
      for each sr_wkfl
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
         and   sr_lineid  begins (string(sod_line) + "ISS" + pk_part)
      no-lock:
 
         if sr_qty > 0
         then do:
 
            {us/bbi/gprun.i ""rcinvchk.p""
               "(input  pk_part,
                 input  sr_site,
                 input  sr_loc,
                 input  sr_lotser,
                 input  sr_ref,
                 input  sr_qty ,
                 input  string(recid(sr_wkfl)),
                 input  no,
                 output l_undo)"}
 
            if  l_undo = yes
            then do:
               l_flag  = yes.
               leave .
            end. /* IF l_undo */
         end.  /* IF sr_qty */
      end.   /* FOR each sr_wkfl */
   end. /* FOR  EACH pk_det */
 
   if l_flag  = yes
   then do:
 
      for each sr_wkfl
         where sr_domain = global_domain
         and   sr_userid = SessionUniqueID
         and   substring(sr_lineid ,1 ,1 ) = string(sod_line)
      exclusive-lock:
         delete sr_wkfl.
      end.  /* FOR EACH sr_wkfl */
 
      assign
         sod_bo_chg  = sod_bo_chg + sod_qty_chg
         sod_qty_chg = 0 .
 
   end. /* IF l_flag =  */
 
end.  /* sodloop */
