/* xxsoskit01.p - SALES ORDER KIT ALLOCATION AND PRE-SHIPPER/SHIPPER PROCESS */
/* soskit01.p - SALES ORDER KIT ALLOCATION AND PRE-SHIPPER/SHIPPER PROCESS   */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsoskit01.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/*                                                                           */
/* REVISION: 8.6      LAST MODIFIED: 10/10/96   by: flm  *K003*              */
/* REVISION: 8.6      LAST MODIFIED: 12/05/96   BY: *K022* Dennis Henson     */
/* REVISION: 8.6      LAST MODIFIED: 11/11/97   BY: *K18W* tcc     */
/* REVISION: 8.6      LAST MODIFIED: 02/11/98   BY: *K1GK* Manish K.         */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6E     LAST MODIFIED: 06/01/98   BY: *J2LW* Niranjan R.       */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* myb               */
/* REVISION: 9.1      LAST MODIFIED: 12/28/00   BY: *L13Y* Kaustubh K.       */
/* REVISION: 9.1      LAST MODIFIED: 01/03/01   BY: *L157* Jayaram A.        */
/* REVISION: 9.1      LAST MODIFIED: 01/24/01   BY: *L14B* Satish Chavan     */
/* REVISION: 9.1      LAST MODIFIED: 02/26/01   BY: *M12F* Rajaneesh S.      */
/* Revision: 1.10.1.13 BY: Rajaneesh S.    DATE: 02/21/02  ECO: *L13N*       */
/* Revision: 1.10.1.14  BY: A.R. Jayaram DATE: 03/04/03 ECO: *N28S* */
/* Revision: 1.10.1.16  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.10.1.17  BY: Subramanian Iyer DATE: 08/20/03       ECO: *P107* */
/* Revision: 1.10.1.18  BY: Vinay Soman      DATE: 03/08/04       ECO: *N2Q3* */
/* Revision: 1.10.1.19  BY: Manish Dani      DATE: 07/13/05       ECO: *P3SV* */
/* Revision: 1.10.1.20  BY: Shilpa Kamath    DATE: 04/18/06       ECO: *R043* */
/* Revision: 1.10.1.21  BY: Xavier Prat    DATE: 06/02/09       ECO: *R1JT* */
/* $Revision: 1.2 $ BY: Sandeep Rohila DATE: 02/18/10       ECO: *Q3TL* */
/* CYB   LAST MODIFIED: 21-SEP-2012    BY: gbg *c1343*                        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* CORRECTED REVISION FROM 8.6E TO 9.1 FOR THE ECO L157                      */
 
/* Code based on soise05.p and soise01.p                                     */
/* REPLACED qty_ratio WITH part_qty / part2_qty                              */
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/px/pxmaint.i}

define temp-table tt-comp no-undo
   field tt-part   like pt_part
   field tt-qty    like ld_qty_all
   field tt-ordnbr like sod_nbr.

/* INPUT VARIABLES */
 
define input parameter so_recid        as  recid       no-undo.
define input parameter sod_recid       as  recid       no-undo.
define input parameter kit_all         as  logical     no-undo.
 
define input parameter part_qty       like sod_qty_ord no-undo.
define input parameter part2_qty      like sod_qty_ord no-undo.
define input parameter process_type   as   integer     no-undo.
define input parameter ship_avail_qty as   logical     no-undo.
define input parameter stage_open     as   logical     no-undo.
define input parameter p_kit_all      like mfc_logical no-undo.
 
/* OUTPUT VARIABLES */
define output parameter table for tt-comp.
define output parameter abnormal_exit as logical no-undo.
 
/* LOCAL VARIABLES */
define variable so_db          like si_db             no-undo.
define variable cline          as   character         no-undo.
define variable err_flag       as   integer           no-undo.
define variable invloc         like pt_loc            no-undo.
define variable tot_sr_qty     as   decimal           no-undo.
define variable tot_sob_qty    as   decimal           no-undo.
define variable pm_code        like pt_pm_code        no-undo.
define variable adj_factor     as   decimal initial 1 no-undo.
define variable least_factor   as   decimal initial 1 no-undo.
define variable open_qty       like sod_qty_pick      no-undo.
define variable v_unpicked_qty like sod_qty_pick      no-undo.
define variable l_abs_pick_qty like sod_qty_pick      no-undo.
define variable l_first_pass   like mfc_logical       no-undo.
define variable l_dec_format    as character format "x(1)"  no-undo.
define variable l_qty_per_char  as character format "x(20)" no-undo.
define variable l_after_decimal as character format "x(9)"  no-undo.
define variable LVOpenQty       as decimal                  no-undo.
define variable LVReqQty        as decimal                  no-undo.
 
/* SHARED VARIABLES FOR */
 
/*********************************************************************/
/* SETTINGS FOR INPUT VARIABLE process_type                          */
/* 1 = PICKLIST/PRESHIPPER CREATE AUTOMATIC                          */
/* 2 = PRE-SHIPPER/SHIPPER WORKBENCH                                 */
/* 3 = SALES ORDER SHIPMENTS AUTO ISSUE (not used)                   */
/* 4 = SALES ORDER SHIPMENTS ISSUE COMPONENTS FROM SO LINE (not used)*/
 
/*********************************************************************/
 
find so_mstr where recid(so_mstr) = so_recid.
find sod_det where recid(sod_det) = sod_recid.
 
{us/op/openqty.i}
 
assign
   l_first_pass = true
   so_db        = global_db.
 
alloc_blk:
repeat on error undo alloc_blk, retry:
 
   if process_type <= 2 or process_type = 5
   then do:
 
      for each sr_wkfl exclusive-lock
          where sr_wkfl.sr_domain = global_domain and  sr_userid = SessionUniqueID
           and sr_lineid begins string(sod_line):
         delete sr_wkfl.
      end.
 
      for each lotw_wkfl
          where lotw_wkfl.lotw_domain = global_domain and  lotw_mfguser =
          SessionUniqueID
         exclusive-lock:
         delete lotw_wkfl.
      end. /* FOR EACH lotw_wkfl */
 
      for each pk_det exclusive-lock  where pk_det.pk_domain = global_domain
      and  pk_user = SessionUniqueID:
         delete pk_det.
      end.
 
      /* CREATE pk_det FOR ISSUABLE COMPONENTS                    */
      /* (i.e., COMPONENT QTY <> 0 AND NOT CONFIGURABLE           */
 
      for each sob_det no-lock
       where sob_det.sob_domain = global_domain and  sob_nbr      = sod_nbr
        and sob_line     = sod_line
        and sob_qty_req <> 0:
 
         /* PLACE NON-CONFIGURED COMPONENT ITEMS IN pk_det */
         pm_code = "".
         find pt_mstr
             where pt_mstr.pt_domain = global_domain and  pt_part = sob_part
         no-lock no-error.
         if available pt_mstr then do:
         pm_code = pt_pm_code.
         {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                  &PARAM =  "(input  sob_part,
                              input  sob_site,
                              input ""pt_loc"",
                              output invloc)"
                  &NOAPPERROR = true
                  &CATCHERROR = true
         }
         end.
         else
            invloc = sob_loc.
         if part_qty < 0
         then do:
            for first si_mstr
               where  si_domain = global_domain
               and    si_site   = sob_site
            no-lock:
            end. /* FOR FIRST si_mstr */
            if not available si_mstr
            then do:
               /* SITE DOES NOT EXIST */
               {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}
               abnormal_exit = true.
               return.
            end. /* IF NOT AVAILABLE si_mstr THEN */
            if not si_auto_loc
            then do:
               for first loc_mstr
                  where loc_mstr.loc_domain = global_domain
                  and   loc_site            = sob_site
                  and   loc_loc             = invloc
               no-lock:
               end. /* FOR FIRST loc_mstr */
               if not available loc_mstr
               then do:
                  /* LOCATION DOES NOT EXIST */
                  {us/bbi/pxmsg.i &MSGNUM=7215 &MSGARG1= sob_line &MSGARG2= sob_part &ERRORLEVEL=3}
                  abnormal_exit = true.
                  return.
               end. /* IF NOT AVAILABLE LOC_MSTR */
            end. /* IF NOT SI_AUTO_LOC THEN */
         end. /* IF  part_qty < 0 THEN   */
         find ptp_det
             where ptp_det.ptp_domain = global_domain and  ptp_part = sob_part
              and ptp_site = sob_site no-lock no-error.
 
         if available ptp_det
         then
            pm_code = ptp_pm_code.
 
         if pm_code <> "C"
         then do:
            find first pk_det
             where pk_det.pk_domain = global_domain and  pk_user = SessionUniqueID
              and pk_part = sob_part no-error.
 
            if not available pk_det
            then do:
               create pk_det. pk_det.pk_domain = global_domain.
               assign pk_user = SessionUniqueID
                      pk_part = sob_part
                      pk_loc  = invloc.
 
               if recid(pk_det) = -1
               then .
            end.
 
            /* IN CASE OF AIM ACTIVATED, IF WE HAVE DECIDED NOT TO PICK/SHIP  */
            /* THE KIT AVAILABLE QUANTITY THE SYSTEM TRIED TO PICK AS MUCH    */
            /* INVENTORY AS POSSIBLE FOR EACH KIT COMPONENT IN EVERY STEP OF  */
            /* THE WAVE PROCESS. THIS MEANS THAT THERE IS A DIFFERENT OPEN    */
            /* QUANTITY (part_qty) FOR EACH COMPONENT (sob_det). THIS IS A    */
            /* SITUATION THAT NEVER HAPPENS IN STANTDARD KIT PROCESSING. THIS */
            /* PIECE OF CODE IS RESPONSIBLE FOR RECALCULATING THE CORRECT     */
            /* OPEN KIT QUANTITY EVERY TIME                                   */
            if {us/wh/whgpwhon.i}
               and ship_avail_qty = false
               and stage_open = false
            then do:
 
               /* CALCULATE OPEN QTY FOR KIT COMPONENT */
               {us/bbi/gprun.i ""whwaoqkc.p"" "(input sod_site,
                  input sob_nbr,
                  input sob_line,
                  input sob_part,
                  output LVOpenQty,
                  output LVReqQty,
                  output abnormal_exit)"}
 
               /* REAL OPEN PART QUANTITY FOR THIS COMPONENT ITEM */
               part_qty = LVOpenQty * sod_qty_ord * sod_um_conv / LVReqQty.
            end.
 
            /* TO AVOID THE QTY FOR COMPONENTS GETTING DISPLAYED AS ? */
            if sod_qty_ord <> 0
            then do:
               pk_qty = pk_qty
                        + ((sob_qty_req / sod_qty_ord)
                        * (if process_type = 5
                           then (sod_qty_ord - sod_qty_ship) / part2_qty
                           else 1)
                        * part_qty * adj_factor).
 
               assign
                  l_qty_per_char = string(sob_qty_req / sod_qty_ord).
                  l_dec_format   = (if session:numeric-format = "american"
                                    then
                                       "."
                                    else
                                       ",").
 
               if index(l_qty_per_char, l_dec_format) <> 0
               then do:
 
                  l_after_decimal = substring(l_qty_per_char,
                                       index(l_qty_per_char, l_dec_format) + 1,
                                       9).
 
                  if integer(l_after_decimal) = 0
                  then
                     pk_qty = round(pk_qty, 0).
                  else
                     pk_qty = round(pk_qty, length(l_after_decimal)).
 
               end. /* IF INDEX(l_qty_per_char, l_dec_format) <> 0 */
               else
                  pk_qty = round(pk_qty, 0).
 
            end. /* IF sod_qty_ord <> 0 */
         end.
      end.  /* sob_det */
 
      cline = string(sod_line) + "ISS-FAS".
 
      /* BACKFLUSH USING DETAIL ALLOCATIONS & PICK LOGIC */
 
      if    kit_all
        and (open_qty     > 0 or
             process_type = 2    )
      then do:
 
         /* ADDED PARAMETERS ship_qty_avail, process_type, and */
 
/*c1343*         {us/bbi/gprun.i ""soskit1a.p"" */
/*c1343*/        {us/bbi/gprun.i ""xxsoskit1a.p""
            "(input so_recid,
              input sod_recid,
              input cline,
              input ship_avail_qty,
              input process_type,
              input p_kit_all,
              input-output least_factor,
              output table tt-comp,
              output abnormal_exit)"}
 
         if     process_type <= 2
            and not ship_avail_qty
         then do:
 
            /* CREATE sr_wkfl FOR OPEN QTY NOT DETAIL ALLOCATED */
            for each sob_det no-lock
                where sob_det.sob_domain = global_domain and  sob_nbr     =
                sod_nbr
                 and sob_line    = sod_line
                 and sob_qty_req <> 0
               break by sob_part:
 
               if first-of(sob_part)
               then
                  tot_sob_qty = 0.
 
               /* TO AVOID THE QTY FOR COMPONENTS GETTING DISPLAYED AS ? */
               if part2_qty <> 0
               then
                  tot_sob_qty = tot_sob_qty +
                                (part_qty / part2_qty) * sob_qty_req
                                * (sod_qty_ord - sod_qty_ship) / sod_qty_ord.
               else
                  tot_sob_qty = tot_sob_qty
                                + (sob_qty_req / sod_qty_ord) * part_qty.
 
               if last-of(sob_part)
               then do:
                  tot_sr_qty = 0.
                  for each sr_wkfl
                     no-lock
                     where sr_wkfl.sr_domain = global_domain
                     and   sr_userid         = SessionUniqueID
                     and   sr_lineid         = cline + sob_part:
 
                        tot_sr_qty = tot_sr_qty + sr_qty.
                  end. /* FOR EACH sr_wkfl */
 
                  /* CHECK PICKED BALANCES WITH QTY OPEN */
                  if tot_sr_qty <> tot_sob_qty
                  then do:
                     pm_code = "".
                     find pt_mstr
                         where pt_mstr.pt_domain = global_domain and  pt_part =
                         sob_part
                     no-lock no-error.
                     if available pt_mstr
                     then do:
                        pm_code = pt_pm_code.
                        {us/px/pxrun.i &PROC  = 'getFieldDefault'
                                 &PROGRAM = 'ppitxr.p'
                                 &PARAM =  "(input  sob_part,
                                             input  sob_site,
                                             input ""pt_loc"",
                                             output invloc)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true
                        }
                     end.
                     else
                        invloc = sob_loc.
 
                     find ptp_det
                         where ptp_det.ptp_domain = global_domain and  ptp_part
                         = sob_part
                          and ptp_site = sob_site no-lock no-error.
 
                     if available ptp_det
                     then
                        pm_code = ptp_pm_code.
 
                       /* CREATE sr_wkfl FOR BALANCE OF NON-CONFIGURED */
                       /* COMPONENT QTY */
                     if pm_code <> "c"
                     then do:
                        find sr_wkfl
                            where sr_wkfl.sr_domain = global_domain and
                            sr_userid = SessionUniqueID
                             and sr_lineid = cline + sob_part
                             and sr_site   = sod_site
                             and sr_loc    = invloc
                             and sr_lotser = ""
                             and sr_ref    = "" no-error.
                        if not available sr_wkfl
                        then do:
                           create sr_wkfl. sr_wkfl.sr_domain = global_domain.
                           assign
                              sr_userid = SessionUniqueID
                              sr_lineid = cline + sob_part
                              sr_site = sod_site
                              sr_loc = invloc.
                        end.
 
                        sr_qty = sr_qty + tot_sob_qty - tot_sr_qty.
 
                     end. /* pm_code <> "c" */
                  end. /* total qty picked < qty open */
               end. /* last-of sob_part */
            end. /* for each sob_det */
         end. /* process_type <= 2 */
      end. /* kit_all = yes */
 
      /* BACKFLUSH WITH DEFAULTS - NO ALLOCATIONS OR PICK LOGIC */
      else do: /* kit_all = no */
         for each pk_det no-lock
             where pk_det.pk_domain = global_domain and  pk_user = SessionUniqueID:
 
            find first sr_wkfl
                where sr_wkfl.sr_domain = global_domain and  sr_userid = SessionUniqueID
                 and sr_lineid = cline + pk_part
                 and sr_site   = sod_site
                 and sr_loc    = pk_loc
            no-error.
            if not available sr_wkfl
            then do:
               create sr_wkfl. sr_wkfl.sr_domain = global_domain.
               assign
                  sr_userid = SessionUniqueID
                  sr_lineid = cline + pk_part
                  sr_site   = sod_site
                  sr_loc    = pk_loc.
               if recid(sr_wkfl) = -1 then .
            end.
            sr_qty = sr_qty + pk_qty.
         end. /* each pk_det */
      end. /* kit_all = no */
 
      /* CREATE STAGE LIST qad_wkfl RECORDS FROM sr_wkfl */
      /* qad_wkfl ARE USED WHEN CREATING abs_mstr        */
 
      if process_type <= 2
      then do:
 
         /* ADDED FOURTH INPUT PARAMETER KIT_ALL */
         {us/bbi/gprun.i ""soskit1b.p""
            "(input so_recid,
              input sod_recid,
              input stage_open,
              input kit_all,
              output abnormal_exit)"}
      end.
 
      /* VARIABLE least_factor IS SET IN soskit1a.p.  IT IS */
      /* BASED ON THE LEAST AVAILABLE QTY TO ALLOCATE OF    */
      /* ANY COMPONENT FOR THIS SALES ORDER LINE.  IF THE   */
      /* REPLEAT BLOCK alloc_blk IS REDONE THEN THE VARIABLE*/
 
      /* ALLOCATIONS ACROSS THE ENTIRE CONFIGURATION.       */
 
      if     ship_avail_qty
         and least_factor <> 1
         and l_first_pass
      then do:
         if least_factor <> 0
         then do:
            assign
               adj_factor   = adj_factor * least_factor
               least_factor = 1
               l_first_pass = false .
 
            undo alloc_blk, retry alloc_blk.
         end.
         else
            undo alloc_blk, leave alloc_blk.
      end.
 
      leave alloc_blk.
 
   end. /* if process_type <= 2 */
 
end. /* repeat, alloc_blk */
