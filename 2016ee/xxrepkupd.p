/* xxrepkupd.p - REPETITIVE PICKLIST CALCULATION                              */
/* repkupd.p - REPETITIVE PICKLIST CALCULATION                                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrepkupd.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 06/20/95   BY: str  *G0N9*               */
/* REVISION: 7.4   LAST MODIFIED: 11/15/96   BY: *H0P6* Murli Shastri         */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 11/29/99   BY: *J3MK* Prashanth Narayan  */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 04/17/00   BY: *J3PH* Kirti Desai        */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KP* myb                */
/* Revision: 1.6.1.6   BY: Hualin Zhong       DATE: 06/13/01 ECO: *N0ZF*      */
/* Revision: 1.6.1.7   BY: Nishit V           DATE: 12/10/02 ECO: *N21K*      */
/* Revision: 1.6.1.9   BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00K*      */
/* Revision: 1.6.1.10  BY: Manish Dani        DATE: 04/20/05 ECO: *P3HL*      */
/* Revision: 1.6.1.11     BY: Kirti Desai     DATE: 10/31/05  ECO: *P467*     */
/* $Revision: 1.2 $    BY: Steve Nugent    DATE: 07/15/10  ECO: *Q2W2*   */
/* CYB   LAST MODIFIED: 2016-Dec-13   BY: gbg *C1591*                        */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
 
/* STANDARD INCLUDE FILES */
{us/px/pxmaint.i}
 
 
define input parameter l_use_ord_multiple like mfc_logical no-undo.
 
define shared variable site like si_site.
define shared variable site1 like si_site.
define shared variable wkctr like op_wkctr.
define shared variable wkctr1 like op_wkctr.
define shared variable part like ps_par.
define shared variable part1 like ps_par.
define shared variable comp1 like ps_comp.
define shared variable comp2 like ps_comp.
define shared variable desc1 like pt_desc1.
define shared variable desc2 like pt_desc1.
define shared variable issue like wo_rel_date
   label "Production Date".
define shared variable issue1 like wo_rel_date.
define shared variable reldate like wo_rel_date
   label "Release Date".
define shared variable reldate1 like wo_rel_date.
define shared variable nbr as character format "x(10)"
   label "Picklist Number".
define shared variable delete_pklst like mfc_logical initial no
   label "Delete When Done".
define shared variable nbr_replace  as character format "x(10)".
define shared variable qtyneed like wod_qty_chg
   label "Qty Required".
define shared variable netgr like mfc_logical initial yes
   label "Use Work Center Inventory".
define shared variable detail_display like mfc_logical
   label "Detail Requirements".
define shared variable um like pt_um.
 
define shared variable wc_qoh like ld_qty_oh.
define shared variable temp_qty like wod_qty_chg.
define shared variable temp_nbr like lad_nbr.
define shared variable ord_max like pt_ord_max.
define shared variable comp_max like wod_qty_chg.
define shared variable pick-used like mfc_logical.
define shared variable isspol like pt_iss_pol.
 
define variable         l_rowid       as rowid.
/* USE TEMP-TABLE IN PLACE OF WORKFILE TO IMPROVE PERFORMANCE     */
 
define temp-table shortages no-undo
   field short-part  like ps_comp
   field short-assy  like ps_par
   field short-qty   like wod_qty_chg column-label "Qty Short"
   field short-date  like wr_start
   index shortages short-part short-date short-assy.
 
/* TEMP-TABLE TO STORE NET AVAILABLE QUANTITY FOR EACH COMPONENT */
/* TO PRINT SHORTAGE LIST                                        */
 
define temp-table net_comp no-undo
   field net_part like ps_comp
   field net_qty  like wod_qty_chg
   index net net_part.

/*c1591* start added code >>> */
form
wr_wkctr
wo_due_date
wr_seq        label "Sequence"
ps_par        label "Parent Item"
wo_qty_ord    label "Qty Open"
ps_comp       label "Component Item"
wod_qty_req   label "Qty Required"
with frame fd width 132 down no-attr-space.
/*c1591* end added code <<<< */
assign
   nbr_replace = getTermLabel("TEMPORARY",10)
   wc_qoh      = 0
   pick-used   = no
   temp_nbr    = nbr.
 
/* FIND AND DISPLAY */
for each rps_mstr no-lock
 where rps_mstr.rps_domain = global_domain and  rps_part >= part and rps_part
 <= part1
  and rps_site >= site and rps_site <= site1
  and (rps_due_date >= issue and rps_due_date <= issue1)
  and (rps_rel_date >= reldate and rps_rel_date <= reldate1),
  each wo_mstr no-lock
  where wo_mstr.wo_domain = global_domain
  and wo_site = rps_site
  and wo_mstr.wo_line = rps_line
  and wo_part = rps_part and wo_type = "S"
  and wo_status <> "C"
  and wo_due_date = rps_due_date,
each wr_route no-lock  where wr_route.wr_domain = global_domain and  wr_lot =
wo_lot,
first wc_mstr no-lock
 where wc_mstr.wc_domain = global_domain and  wc_wkctr = wr_wkctr
  and wc_mch = wr_mch
  and wc_wkctr >= wkctr and wc_wkctr <= wkctr1,
each wod_det no-lock  where wod_det.wod_domain = global_domain and  wod_lot =
wr_lot
  and wod_op = wr_op
  and wod_part >= comp1 and wod_part <= comp2
  and not can-find (first qad_wkfl  where qad_wkfl.qad_domain = global_domain
  and  qad_key1 = "pt_kanban"
  and qad_key2 = wod_part)

/*c1591* start deleted code >>>
* break by wo_site by wr_wkctr by wod_part by wod_deliver
* by wr_start by wr_part by wr_op
*c1591* end deleted code <<< */

/*c1591* start added code >>> */
break by wo_site by wr_wkctr 
by wr_seq by wr_part
by wod_part by wod_deliver
by wr_start by wr_op
/*c1591* end added code <<< */

with frame c width 132 down no-box:
 
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame c:handle).
 
   if first-of(wr_wkctr) then do:
 
      pick-used = yes.
 
      do on error undo, retry:
 
         do while 
            can-find (first lad_det
               where  lad_det.lad_domain = global_domain 
                  and lad_dataset        = "rps_det"
                  and lad_nbr begins  trim(string(wo_site,"x(8)") 
                                         + string(nbr,"x(10)")))
             or
            can-find(first qad_wkfl
               where qad_domain      =  global_domain
                  and qad_key1       =  "rpc_ctrl"
                  and qad_key2       <> SessionUniqueID
                  and qad_charfld[1] =  nbr)
         :
 
            {us/bbi/gprun.i ""gpnbr.p"" "(16,input-output nbr)"}
            /* GET THE PICKLIST NUMBER WHICH IS NOT USED IN OTHER SESSION */
            {us/px/pxrun.i &PROC='setPicklistNumber' &PROGRAM='rewoxr.p'
                           &PARAM="(input 'rpc_ctrl',
                                    input-output nbr)"}
 
         end.
                  run createladdet (
                      string(wo_site,"x(8)") + string(nbr,"x(10)"),
                      string(SessionUniqueID,"x(10)"),
                      buffer lad_det).
 
           if rowid(lad_det) = l_rowid
           then
              .
 
      end.

/*c1591* start added code >>> */
      form
      wo_site
      nbr
      skip(1)
      with frame b width 132 side-labels page-top.
      /* SET EXTERNAL LABELS */
      setFrameLabels(frame b:handle).

      display
	 wo_site
         string(nbr,"x(10)") when (not delete_pklst) @ nbr
         nbr_replace         when (delete_pklst) @ nbr
      with frame b.

/*c1591* end added code <<< */
 
/*c1591* start deleted code >>>
*      /* ADDED frame b DEFINITION */
*      form
*         wo_site
*         wr_wkctr
*         wc_desc no-label
*         nbr
*         skip(1)
*      with frame b width 132 side-labels page-top.
* 
*      /* SET EXTERNAL LABELS */
*      setFrameLabels(frame b:handle).
* 
*      display
*         wo_site
*         wr_wkctr
*         wc_desc no-label    when (available wc_mstr)
*         string(nbr,"x(10)") when (not delete_pklst) @ nbr
*         nbr_replace         when (delete_pklst) @ nbr
*         skip(1)
*      with frame b width 132 side-labels page-top.
*c1591* end deleted code <<< */
   end.
 
   view frame b.
   isspol = yes.
   find ptp_det no-lock
    where ptp_det.ptp_domain = global_domain and  ptp_site = wod_site
     and ptp_part = wod_part no-error.
   if available ptp_det then
      isspol = ptp_iss_pol.
   else do:
      find pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
      pt_part = wod_part no-error.
      if available pt_mstr then
         isspol = pt_iss_pol.
   end.

/*c1591* start added code >>> */
   skipBlock:
   do:
      updateBlock:
      do on stop undo, leave:
         if isspol then do:
	    display
	    "        " @ wr_wkctr
	    "        " @ wo_due_date
	    "        " @ wr_seq
	    "        " @ ps_par
	    "        " @ wo_qty_ord
	    wr_wkctr      when first-of(wr_wkctr)
	    wo_due_date  when first-of(wr_wkctr)
	    wr_seq        when first-of(wr_seq)
	    wr_part       when first-of(wr_part) @ ps_par
	    max(wo_qty_ord - wo_qty_comp, 0) when first-of(wr_part) @ wo_qty_ord
	    wod_part @ ps_comp
	    max(wod_qty_req - wod_qty_iss, 0) @ ps_comp
	    with frame fdet.
	    down with frame fdet.

            accumulate max(wod_qty_req - wod_qty_all - wod_qty_pick - wod_qty_iss,0)
               (total by wod_deliver).

            if first-of (wod_deliver) then do:
               assign
                  desc1 = ""
                  desc2 = ""
                  um    = "".
               find pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
               pt_part = wod_part no-error.
               if available pt_mstr then
                  assign
                     desc1 = pt_desc1
                     desc2 = pt_desc2
                     um    = pt_um.
            end.


            /* CREATE RECORDS IN shortage TABLE FOR EACH COMPONENT'S DEMAND */
            run store_demand (buffer wod_det, buffer wr_route).

            if last-of (wod_deliver) then do:

               ord_max = 0.
               find ptp_det no-lock
                  where ptp_det.ptp_domain = global_domain and  ptp_part = wo_part and
                  ptp_site = wo_site no-error.
               if available ptp_det
               then
                  ord_max = if l_use_ord_multiple
                            then
                               ptp_ord_max
                            else
                               0.
               else do:
                  find pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
                  pt_part = wo_part no-error.
                  if available pt_mstr
                  then
                     ord_max = if l_use_ord_multiple
                               then
                                  pt_ord_max
                               else
                                  0.
               end.
               comp_max = 0.
               if ord_max <> 0 then
                  comp_max = wod_qty_req / wo_qty_ord * ord_max.

               qtyneed = (accum total by wod_deliver
                         (max(wod_qty_req - wod_qty_all -
                          wod_qty_pick - wod_qty_iss,0))).

               if netgr then do:
                  /* Added wo_lot as input parameter */
                  {us/bbi/gprun.i ""repkupb.p"" "(wo_site,
                                                  wr_wkctr,
                                                  wod_part,
                                                  issue1,
                                                  qtyneed,
                                                  wo_lot,
                                                  input-output wc_qoh)"}
               end.

               temp_qty = 0.
               if netgr then
                  assign
                     temp_qty = min(qtyneed, wc_qoh)
                     qtyneed  = qtyneed - temp_qty.

               nbr = string(wo_site,"x(8)") + nbr.

               {us/bbi/gprun.i ""repkall.p"" "(nbr,
                                               wod_part,
                                               wo_site,
                                               wr_wkctr,
                                               wod_deliver ,
                                               comp_max ,
                                               l_use_ord_multiple,
                                               input-output qtyneed)" }

               if detail_display then do:





                  wc_qoh = wc_qoh - temp_qty.

                  for each lad_det no-lock
                   where lad_det.lad_domain = global_domain and  lad_dataset =
                   "rps_det"
                    and lad_nbr = nbr and lad_line = wr_wkctr
                    and lad_part = wod_part and lad_site = wo_site
                    and lad_user1 = wod_deliver
                  break by lad_dataset by lad_nbr by lad_line
                  by lad_part by lad_site:

                     accumulate lad_qty_all (total).

                  end.


               end.
               else do:


                  wc_qoh = wc_qoh - temp_qty.

                  for each lad_det no-lock
                    where lad_det.lad_domain = global_domain and  lad_dataset =
                    "rps_det"
                     and lad_nbr = nbr and lad_line = wr_wkctr
                     and lad_part = wod_part and lad_site = wo_site
                     and lad_user1 = wod_deliver
                  break by lad_dataset by lad_nbr by lad_line
                  by lad_part by lad_site:

                     accumulate lad_qty_all (total).


                     desc2 = "".
                  end.

                  if qtyneed > 0 then do:

                     desc2 = "".

                  end.


               end.

               /* STORE AVAILABLE QUANTITY IN shortages TABLE */

               run store_avail_qty (input (accum total by wod_deliver
                                          (max(wod_qty_req  - wod_qty_all -
                                           wod_qty_pick - wod_qty_iss,0))),
                                    input wod_part).

               nbr = substring(nbr,9).
            end.

         end.  /* if isspol */
         leave skipBlock. /* NO CTRL-C PROCESSING */
      end. /* UPDATEBLOCK */
      /* WHEN CTRL-C IS PRESSED WE NEED TO UNDO THE lad_det */
      /* CREATION WHICH CAN BE DONE BY REPKUPC.P */
      {us/bbi/gprun.i ""repkupc.p""}
      run removeQadWkflRecord.
      /* EXECUTE CTRL-C AGAIN */
      stop.
   end. /* SKIPBLOCK */
/*c1591* end added code <<< */
/*c1591* start deleted block >>>>
*   skipBlock:
*   do:
*      updateBlock:
*      do on stop undo, leave:
*         if isspol then do:
*            accumulate max(wod_qty_req - wod_qty_all - wod_qty_pick - wod_qty_iss,0)
*               (total by wod_deliver).
*
*            if first-of (wod_deliver) then do with frame c:
*               assign
*                  desc1 = ""
*                  desc2 = ""
*                  um    = "".
*               find pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
*               pt_part = wod_part no-error.
*               if available pt_mstr then
*                  assign
*                     desc1 = pt_desc1
*                     desc2 = pt_desc2
*                     um    = pt_um.
*               if detail_display then
*                  display wod_part @ ps_comp desc1.
*            end.
*            else
*            if desc2 <> "" and detail_display then do with frame c:
*               display
*                  desc2 @ desc1.
*               desc2 = "".
*            end.
*
*            if detail_display then
*               display
*                  max(wod_qty_req - wod_qty_iss,0) @ wod_qty_req
*                  um
*                  wr_part @ ps_par
*                  wo_due_date
*                  wr_op
*                  wr_mch
*                  wr_start.
*
*            /* CREATE RECORDS IN shortage TABLE FOR EACH COMPONENT'S DEMAND */
*            run store_demand (buffer wod_det, buffer wr_route).
*
*            if last-of (wod_deliver) then do:
*
*               ord_max = 0.
*               find ptp_det no-lock
*                  where ptp_det.ptp_domain = global_domain and  ptp_part = wo_part and
*                  ptp_site = wo_site no-error.
*               if available ptp_det
*               then
*                  ord_max = if l_use_ord_multiple
*                            then
*                               ptp_ord_max
*                            else
*                               0.
*               else do:
*                  find pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
*                  pt_part = wo_part no-error.
*                  if available pt_mstr
*                  then
*                     ord_max = if l_use_ord_multiple
*                               then
*                                  pt_ord_max
*                               else
*                                  0.
*               end.
*               comp_max = 0.
*               if ord_max <> 0 then
*                  comp_max = wod_qty_req / wo_qty_ord * ord_max.
*
*               qtyneed = (accum total by wod_deliver
*                         (max(wod_qty_req - wod_qty_all -
*                          wod_qty_pick - wod_qty_iss,0))).
*
*               if netgr then do:
*                  /* Added wo_lot as input parameter */
*                  {us/bbi/gprun.i ""repkupb.p"" "(wo_site,
*                                                  wr_wkctr,
*                                                  wod_part,
*                                                  issue1,
*                                                  qtyneed,
*                                                  wo_lot,
*                                                  input-output wc_qoh)"}
*               end.
*
*               temp_qty = 0.
*               if netgr then
*                  assign
*                     temp_qty = min(qtyneed, wc_qoh)
*                     qtyneed  = qtyneed - temp_qty.
*
*               nbr = string(wo_site,"x(8)") + nbr.
*
*               {us/bbi/gprun.i ""repkall.p"" "(nbr,
*                                               wod_part,
*                                               wo_site,
*                                               wr_wkctr,
*                                               wod_deliver ,
*                                               comp_max ,
*                                               l_use_ord_multiple,
*                                               input-output qtyneed)" }
*
*               if detail_display then do
*                  with frame dd width 132 down no-box:
*
*                  display
*                     skip
*                  with frame e.
*
*                  /* SET EXTERNAL LABELS */
*                  setFrameLabels(frame dd:handle).
*
*                  display
*                     " " @ ps_comp no-label
*                     " " @ desc1 no-label.
*
*                  display
*                     accum total by wod_deliver
*                     (max(wod_qty_req - wod_qty_all -
*                     wod_qty_pick - wod_qty_iss,0)) @ wod_qty_req
*                     um.
*
*                  display
*                     wc_qoh @ ld_qty_oh column-label "WC Net Avail".
*
*                  wc_qoh = wc_qoh - temp_qty.
*
*                  for each lad_det no-lock
*                   where lad_det.lad_domain = global_domain and  lad_dataset =
*                   "rps_det"
*                    and lad_nbr = nbr and lad_line = wr_wkctr
*                    and lad_part = wod_part and lad_site = wo_site
*                    and lad_user1 = wod_deliver
*                  break by lad_dataset by lad_nbr by lad_line
*                  by lad_part by lad_site with frame dd:
*
*                     display
*                        lad_loc
*                        lad_lot     format "x(14)"
*                        lad_ref     column-label "Ref"
*                        lad_qty_all column-label "Qty to Transfer"
*                        lad_user1 @ wod_deliver.
*
*                     accumulate lad_qty_all (total).
*
*                     if last-of (lad_site) = no then
*                        down 1.
*                  end.
*
*                  if qtyneed > 0 then do with frame dd:
*                     if can-find
*                        (first lad_det  where lad_det.lad_domain = global_domain and
*                        lad_dataset = "rps_det"
*                        and lad_nbr = nbr and lad_line = wr_wkctr
*                        and lad_part = wod_part
*                        and lad_site = wo_site) then
*                        down 1.
*
*                     display
*                        getTermLabelRtColon("QUANTITY_SHORT",14) @ lad_lot
*                        qtyneed @ lad_qty_all.
*
*                  end.
*
*                  down 1.
*
*               end.
*               else do with frame d width 132 down no-box:
*
*                  /* SET EXTERNAL LABELS */
*                  setFrameLabels(frame d:handle).
*                  display
*                     wod_part @ ps_comp desc1.
*
*                  display
*                     accum total by wod_deliver
*                     (max(wod_qty_req - wod_qty_all -
*                     wod_qty_pick - wod_qty_iss,0)) @ wod_qty_req
*                     um.
*
*                  display
*                     wc_qoh @ ld_qty_oh column-label "WC Net Avail".
*
*                  wc_qoh = wc_qoh - temp_qty.
*
*                  for each lad_det no-lock
*                    where lad_det.lad_domain = global_domain and  lad_dataset =
*                    "rps_det"
*                     and lad_nbr = nbr and lad_line = wr_wkctr
*                     and lad_part = wod_part and lad_site = wo_site
*                     and lad_user1 = wod_deliver
*                  break by lad_dataset by lad_nbr by lad_line
*                  by lad_part by lad_site with frame d:
*
*                     display
*                        lad_loc
*                        lad_lot     format "x(14)"
*                        lad_ref     column-label "Ref"
*                        lad_qty_all column-label "Qty to Transfer"
*                        lad_user1 @ wod_deliver.
*
*                     accumulate lad_qty_all (total).
*
*                     if last-of (lad_site) = no
*                        or (detail_display = no and desc2 <> "") then
*                        down 1.
*
*                     if detail_display = no and desc2 <> "" then
*                        display
*                           desc2 @ desc1.
*
*                     desc2 = "".
*                  end.
*
*                  if qtyneed > 0 then do with frame d:
*                     if can-find (first lad_det
*                           where lad_det.lad_domain = global_domain and (  lad_dataset
*                           = "rps_det"
*                            and lad_nbr = nbr and lad_line = wr_wkctr
*                            and lad_part = wod_part
*                            and lad_site = wo_site))
*                             or (detail_display = no and desc2 <> "") then
*                        down 1.
*
*                     if detail_display = no and desc2 <> "" then
*                        display
*                           desc2 @ desc1.
*
*                     desc2 = "".
*
*                     display
*                        getTermLabelRtColon("QUANTITY_SHORT",14) @ lad_lot
*                        qtyneed @ lad_qty_all.
*
*                  end.
*
*                  down 1.
*
*               end.
*
*               /* STORE AVAILABLE QUANTITY IN shortages TABLE */
*
*               run store_avail_qty (input (accum total by wod_deliver
*                                          (max(wod_qty_req  - wod_qty_all -
*                                           wod_qty_pick - wod_qty_iss,0))),
*                                    input wod_part).
*
*               nbr = substring(nbr,9).
*            end.
*
*         end.  /* if isspol */
*         leave skipBlock. /* NO CTRL-C PROCESSING */
*      end. /* UPDATEBLOCK */
*      /* WHEN CTRL-C IS PRESSED WE NEED TO UNDO THE lad_det */
*      /* CREATION WHICH CAN BE DONE BY REPKUPC.P */
*      {us/bbi/gprun.i ""repkupc.p""}
*      run removeQadWkflRecord.
*      /* EXECUTE CTRL-C AGAIN */
*      stop.
*   end. /* SKIPBLOCK */
*c1591* end deleted code <<<< */



/*c1591* start added code >>> */
   /* FOR SHORTAGE LIST PRINTING, DELETE THOSE COMPONENT DEMANDS */
   /* FOR WHICH AVAILABLE QTY CAN BE ADJUSTED. AND SUMMARIZE     */
   /* DEMANDS BY PARENT ITEMS.                                   */
 
   if last-of(wod_part) then
      run adjust_demand (input wod_part).
 
   if last-of (wr_wkctr) then do:
 
      find first lad_det
       where lad_det.lad_domain = global_domain and  lad_dataset = "rps_det"
        and lad_nbr begins trim(string(wo_site,"x(8)") + string(nbr,"x(10)"))
        and lad_part <> "rps_det" no-lock no-error.
 
      find first shortages no-error.
      if available shortages then do:
 
         for each shortages exclusive-lock
         break by short-part by short-date:
 
            find pt_mstr no-lock
             where pt_mstr.pt_domain = global_domain and  pt_part = short-part
             no-error.
 
            delete shortages.
         end.
      end.
   end.
/*c1591* end added code <<<< */



/*c1591* start deleted code >>>>
*   /* FOR SHORTAGE LIST PRINTING, DELETE THOSE COMPONENT DEMANDS */
*   /* FOR WHICH AVAILABLE QTY CAN BE ADJUSTED. AND SUMMARIZE     */
*   /* DEMANDS BY PARENT ITEMS.                                   */
* 
*   if last-of(wod_part) then
*      run adjust_demand (input wod_part).
* 
*   if last-of (wr_wkctr) then do:
* 
*      find first lad_det
*       where lad_det.lad_domain = global_domain and  lad_dataset = "rps_det"
*        and lad_nbr begins trim(string(wo_site,"x(8)") + string(nbr,"x(10)"))
*        and lad_part <> "rps_det" no-lock no-error.
* 
*      find first shortages no-error.
*      if available shortages then do:
* 
*         hide frame b.
* 
*         page.
* 
*         form
*            skip(1) space(19)
*            wo_site wr_wkctr
*            wc_desc no-label
*            nbr_replace label "Picklist Number"
*         with frame shortage page-top width 132 side-labels
*         title color normal (getFrameTitle("S_H_O_R_T_A_G_E___L_I_S_T",36)).
* 
*         /* SET EXTERNAL LABELS */
*         setFrameLabels(frame shortage:handle).
* 
*         display
*            wo_site
*            wo_site
*            wr_wkctr
*            wc_desc             when (available wc_mstr)
*            string(nbr,"x(10)") when (not delete_pklst) @ nbr_replace
*            nbr_replace         when (delete_pklst)
*         with frame shortage.
* 
*         /* PRINT DESCRIPTION OF PART ONLY ONCE. */
* 
*         for each shortages exclusive-lock
*         break by short-part by short-date
*         with frame short width 132:
* 
*            /* SET EXTERNAL LABELS */
*            setFrameLabels(frame short:handle).
* 
*            find pt_mstr no-lock
*             where pt_mstr.pt_domain = global_domain and  pt_part = short-part
*             no-error.
* 
*            if page-size - line-counter < 1 then
*               page.
* 
*            display
*               space(19)
*            with frame short.
* 
*            if first-of(short-part) then
*               display
*                  short-part @ ps_comp
*                  pt_desc1 when (available pt_mstr)
*               with frame short.
* 
*            display
*               short-qty
*               pt_um when (available pt_mstr)
*               short-assy @ ps_par
*            with frame short.
* 
*            if first-of(short-part) then do:
*               down 1.
*               if available pt_mstr and pt_desc2 <> "" then
*                  display
*                     pt_desc2 @ pt_desc1
*                  with frame short.
*            end. /* FIRST-OF(short-part) */
* 
*            if last-of(short-part) then
*               down 1.
* 
*            delete shortages.
*         end.
* 
*         hide frame shortage.
*         view frame b.
*         if not last (wr_wkctr) then page.
*      end.
*   end.
*c1591* end deleted code <<< */
 
end.
 
/* PROCEDURE TO STORE COMPONENT DEMAND FOR EACH PARENT ITEM. */
/* UNIQUE RECORDS ARE CREATED FOR EACH SCHEDULE DATE.        */
 
PROCEDURE store_demand:
 
   define parameter buffer wod_det  for wod_det.
   define parameter buffer wr_route for wr_route.
 
   if (wod_qty_req - wod_qty_iss) > 0 then
   do:
      find first shortages where
         short-part  = wod_part and
         short-date  = wr_start and
         short-assy  = wr_part
         exclusive-lock no-error.
      if not available shortages then
      do:
         create shortages.
         assign
            short-part  = wod_part
            short-date  = wr_start
            short-assy  = wr_part.
      end. /* IF NOT AVAILABLE shortages */
 
      short-qty   = short-qty + (wod_qty_req - wod_qty_iss).
 
   end. /* IF (wod_qty_req - wod_qty_iss) > 0 */
 
END PROCEDURE. /* store_demand */
 
PROCEDURE store_avail_qty:
 
   define input parameter demand_qty  like wod_qty_chg no-undo.
   define input parameter demand_part like wod_part    no-undo.
 
   /* STORE NET AVAILABLE QUANTITY                */
   /* AVAILABLE QTY = (REQUIRED QTY - SHORT QTY)  */
 
   for first net_comp where
         net_part = demand_part
         exclusive-lock:
   end. /* FOR FIRST net_comp */
 
   if not available net_comp then
   do:
      create net_comp.
      net_part = demand_part.
   end. /* IF NOT AVAILABLE components */
 
   net_qty = net_qty + demand_qty - qtyneed.
 
END PROCEDURE. /* store_avail_qty */
 
PROCEDURE adjust_demand:
   define input parameter demand_part like wod_part no-undo.
 
   define variable l_date like wr_start    no-undo.
   define variable l_qty  like wod_qty_chg no-undo initial 0.
 
   /* TAKE NET AVAILABLE QUANTITY FROM TEMP-TABLE */
 
   for first net_comp exclusive-lock where
         net_part = demand_part:
 
      l_qty = net_qty.
      delete net_comp.
   end. /* FOR FIRST net_comp */
 
   if l_qty > 0 then
   for each shortages exclusive-lock where
         short-part = demand_part:
 
      /* DELETE THOSE DEMAND RECORDS FOR WHICH AVAILABLE QTY    */
      /* CAN BE ADJUSTED                                        */
 
      if l_qty - short-qty >= 0 then do:
         l_qty = l_qty - short-qty.
         delete shortages.
      end. /* IF l_qty - short-qty >= 0 */
 
      else do:
 
         /* WHEN DEMAND IS MORE THAN AVAILABLE QTY THEN */
         /* DEMAND = DEMAND - REMAINING QTY.            */
         /* NO CHANGE FOR REMAINING RECORDS             */
 
         assign
            short-qty = short-qty - l_qty
            l_qty     = 0.
      end. /* l_qty <= short-qty */
 
      if l_qty = 0 then leave.
 
   end. /* FOR EACH shortages */
 
   /* SUMMARIZE TOTAL DEMANDS BY PARENT ITEMS AND ASSIGN */
   /* THE FIRST SCHEDULE DATE                             */
 
   for each shortages exclusive-lock
         where short-part = demand_part
         break by short-assy by short-date:
 
      if first-of(short-assy) then
         l_date = short-date.
 
      accumulate short-qty (total by short-assy).
 
      if last-of(short-assy) then
      assign
         short-qty  = accum total by short-assy short-qty
         short-date = l_date.
      else
         delete shortages.
 
   end. /* FOR EACH shortages */
 
END PROCEDURE. /* adjust_demand */
 
PROCEDURE createladdet:
   define input parameter  ip_lad_nbr as character no-undo.
   define input parameter  ip_site    as character no-undo.
   define parameter buffer lad_det    for lad_det.
 
   create lad_det.
   lad_domain = global_domain.
 
   assign
      lad_dataset = "rps_det"
      lad_nbr     = ip_lad_nbr
      lad_line    = "rps_det"
      lad_part    = "rps_det"
      lad_site    = ip_site
      lad_loc     = "rps_det"
      lad_lot     = "rps_det"
      lad_ref     = "rps_det".
 
   if recid(lad_det) = -1
   then
      .
 
END PROCEDURE. /* createladdet */

/*******************************************************************/
/* REMOVES THE qad_wkfl RECORD FOR THE CURRENT SESSION             */
/*******************************************************************/
procedure removeQadWkflRecord:
   define buffer del_qad_wkfl for qad_wkfl.

   for each del_qad_wkfl
      where del_qad_wkfl.qad_domain  = global_domain
      and   del_qad_wkfl.qad_key1    = "rpc_ctrl"
      and   del_qad_wkfl.qad_key2    = SessionUniqueID
   exclusive-lock:
      delete del_qad_wkfl.
   end. /* FOR FIRST del_qad_wkfl */
end procedure. /* removeQadWkflRecord */
