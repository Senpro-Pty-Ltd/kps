/* xfworlb.i - PRINT PICKLISTS                                              */
/* mfworlb.i - PRINT PICKLISTS                                              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfworlb.i,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* REVISION: 1.0     LAST MODIFIED: 05/06/86    BY: EMB                     */
/* REVISION: 1.0     LAST MODIFIED: 09/02/86    BY: EMB *12*                */
/* REVISION: 1.0     LAST MODIFIED: 02/05/87    BY: EMB *35*                */
/* REVISION: 2.0     LAST MODIFIED: 07/24/87    BY: EMB *A75*               */
/* REVISION: 2.0     LAST MODIFIED: 09/03/87    BY: EMB *A88*               */
/* REVISION: 2.1     LAST MODIFIED: 09/11/87    BY: WUG *A94*               */
/* REVISION: 4.0     LAST MODIFIED: 01/29/88    BY: PML *A119*              */
/* REVISION: 4.0     LAST MODIFIED: 06/08/88    BY: FLM *A268*              */
/* REVISION: 4.0     LAST MODIFIED: 06/16/88    BY: EMB *A288*              */
/* REVISION: 4.0     LAST MODIFIED: 07/15/88    BY: WUG *A324*              */
/* REVISION: 4.0     LAST MODIFIED: 07/26/88    BY: WUG *A363*              */
/* REVISION: 4.0     LAST MODIFIED: 09/22/88    BY: EMB *A451*              */
/* REVISION: 4.0     LAST MODIFIED: 11/18/88    BY: EMB *A539*              */
/* REVISION: 4.0     LAST MODIFIED: 12/13/88    BY: RL  *B001*              */
/* REVISION: 4.0     LAST MODIFIED: 03/16/89    BY: MLB *A672*              */
/* REVISION: 4.0     LAST MODIFIED: 01/22/90    BY: EMB *A802*              */
/* REVISION: 6.0     LAST MODIFIED: 05/03/90    BY: MLB *D024*              */
/* REVISION: 6.0     LAST MODIFIED: 07/03/90    BY: WUG *D043*              */
/* REVISION: 6.0     LAST MODIFIED: 07/31/90    BY: WUG *D051*              */
/* REVISION: 6.0     LAST MODIFIED: 07/31/90    BY: WUG *D054*              */
/* REVISION: 6.0     LAST MODIFIED: 04/09/91    BY: RAM *D508*              */
/* REVISION: 6.0     LAST MODIFIED: 04/16/91    BY: RAM *D530*              */
/* REVISION: 6.0     LAST MODIFIED: 10/05/91    BY: SMM *D887*              */
/* REVISION: 7.0     LAST MODIFIED: 04/01/92    BY: ram *F351*              */
/* REVISION: 7.0     LAST MODIFIED: 08/18/92    BY: ram *F858*              */
/* REVISION: 7.3     LAST MODIFIED: 02/03/93    BY: emb *G656*              */
/* REVISION: 7.3     LAST MODIFIED: 04/29/93    BY: ksp *GA63*              */
/* Oracle changes (share-locks)     09/12/94    BY: rwl *FR19*              */
/* REVISION: 7.5     LAST MODIFIED: 10/14/94    BY: TAF *J035*              */
/* REVISION: 8.6E    LAST MODIFIED: 02/23/98    BY: *L007* A. Rahane        */
/* REVISION: 8.6E    LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan       */
/* REVISION: 8.6E    LAST MODIFIED: 10/04/98    BY: *J314* Alfred Tan       */
/* REVISION: 8.6E    LAST MODIFIED: 10/28/98    BY: *J330* Mugdha Tambe     */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1     LAST MODIFIED: 08/13/00    BY: *N0KR* myb              */
/* Old ECO marker removed, but no ECO header exists *F0PN*                  */
/* Revision: 1.13        BY: Katie Hilbert       DATE: 04/01/01  ECO: *P008* */
/* Revision: 1.15        BY: Tiziana Giustozzi   DATE: 09/16/01  ECO: *N12M* */
/* Revision: 1.17        BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00G* */
/* Revision: 1.18        BY: Shilpa Kamath       DATE: 04/08/06  ECO: *R03V* */
/* Revision: 1.19        BY: Shilpa Kamath       DATE: 06/15/06  ECO: *R05X* */
/* $Revision: 1.2 $     BY: Jean Miller         DATE: 06/15/08  ECO: *R0TC* */
/* REVISION: eb3sp5  CREATED: 11/02/10  BY: Shridhar M  *eB3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*-Revision end--------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/px/pxmaint.i}
{us/px/pxphdef.i capfxr}
{us/px/pxphdef.i caisxr}

{us/ql/qlconst.i}
{us/ca/cattdef.i}

define variable description like pt_desc1.
define variable um like pt_um.
define variable loc like pt_loc.
define variable issued as character initial "(      )" label "Issued".
define variable com_rev like pt_rev label "Rv".
define variable issue-date like wod_iss_date.
define variable qtyall like lad_qty_all.
define variable c-cont as character format "x(18)" no-undo.
define variable c-quantity as character format "x(18)" no-undo.
define variable c-not-avail as character format "x(18)" no-undo.
define variable c-msg-text  as character format "x(45)" no-undo.
define variable l_pt_lot_ser as character no-undo.
define variable isConforming as character no-undo.
define variable l_all_avl_limit    as logical            no-undo.

define new shared variable wod_recno as recid.
define new shared variable fas_unit_qty as character.

define workfile floorstk no-undo
   field fs_part as character label "Floor Stock" format "x(28)"
   field fs_qty like wod_qty_req.

 /*eB3sp5*/ {us/xf/xfworlbv.i}
 
assign
   c-cont = "*** " + getTermLabel("CONTINUED",18) + " ***"
   c-quantity = getTermLabel("QUANTITY",18)
   c-not-avail = getTermLabel("NOT_AVAILABLE",18) + ":".

{us/mf/mfworlb1.i &row="1"}

form
   skip (1)
   wo_nbr         colon 13
   wod_iss_date   colon 68
   wo_lot         colon 13
   wo_batch       colon 13
   wo_part        colon 13
   par_rev        colon 40 label "Rev"
   wo_due_date    colon 68 label "Work Order Due Date" skip
   wo_des         no-label format "x(49)" at 15
   wo_rmks        colon 13
   wo_so_job      colon 68
   wo_qty         colon 13
   wo_um          no-label
   deliv          colon 68 skip (1)
with frame picklist page-top side-labels width 80
title (getFrameTitle("WORK_ORDER_PICKLIST",25)).

/* SET EXTERNAL LABELS */
setFrameLabels(frame picklist:handle).

/* Read control file for configured product unit control flag */
do transaction:
   fas_unit_qty = string(false).      /*DEFAULT VALUE*/
   find first fac_ctrl where fac_ctrl.fac_domain = global_domain
   no-lock no-error.
   if available fac_ctrl then
      fas_unit_qty = string(fac_unit_qty).
end.

find pt_mstr where pt_mstr.pt_domain = global_domain and  pt_part = wo_part
no-lock no-error.

assign
   wo_des          = ""
   wo_um           = ""
   par_rev         = ""
   l_all_avl_limit =   if can-find(first mfc_ctrl 
                              where mfc_domain = global_domain 
                              and   mfc_field  = "woc_all_avl"
                              and mfc_logical)
                           then
                              true
                           else
                              false.

if available pt_mstr
then do:

   assign
      wo_des = pt_desc1
      wo_des = wo_des + " " + pt_desc2
      /*eB3sp5*/  par_draw = pt_draw
      wo_um = pt_um.

   /*  REVISION NUMBER IS DISPLAYED FROM PTP_DET TO GET LATEST  */
   /*  MODIFIED REVISION NUMBER                                 */
   for first ptp_det where ptp_det.ptp_domain = global_domain
      and ptp_part = wo_part
      and ptp_site = wo_site
   no-lock: end.

   if available ptp_det then
      par_rev = ptp_rev .
   else
      par_rev =  pt_rev .

end.

issue-date = ?.

for each wod_det where wod_det.wod_domain = global_domain
   and wod_lot = wo_lot
no-lock:

   if issue-date = ? or issue-date > wod_iss_date then
      issue-date = wod_iss_date.

   if incl_floor_stk
   then do:

      find pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = wod_part
      no-lock no-error.
      find ptp_det where ptp_det.ptp_domain = global_domain
         and ptp_part = wod_part
         and ptp_site = wod_site
      no-lock no-error.

      if (available ptp_det and ptp_iss_pol = no)
         or (not available ptp_det
         and available pt_mstr and pt_iss_pol = no)
      then do:
         find last floorstk where fs_part < wod_part no-error.
         create floorstk.
         assign
            fs_part = wod_part
            fs_qty = wod_qty_req.
      end.

   end.

end.

for each wod_det where wod_det.wod_domain = global_domain
   and wod_lot = wo_lot
   and ((wod_qty_req = 0 and incl_zero_reqd)
     or ( if l_all_avl_limit 
          then 
             wod_qty_req > 0 
          else 
             wod_qty_all <> 0)
     or (wod_qty_pick <> 0 and incl_pick_qtys)
     or (max(wod_qty_req - wod_qty_iss,0) = 0 and incl_zero_open)
     or (max(wod_qty_req - wod_qty_iss,0) > 0 
            and  ( if l_all_avl_limit 
                   then 
                        true 
                   else 
                        wod_qty_all <> 0))
     )
exclusive-lock
break by wod_lot by wod_iss_date by wod_part
with frame detail no-box down:

   picklistprinted = yes.

   if first-of(wod_iss_date)
   then do:
      hide frame picklist.
      page.
      display wod_iss_date with frame picklist.
   end.

   if first-of(wod_lot)
   then do:
      display
         wo_nbr
         wo_lot
         wo_batch
         wo_part
         par_rev
         wod_iss_date
         wo_due_date
         wo_des
         wo_rmks
         wo_so_job
         wo_qty
         wo_um deliv
      with frame picklist.
/*eB3sp5*/      run print_header in this-procedure.

      for each sod_det where sod_det.sod_domain = global_domain
         and sod_nbr = wo_so_job
         and sod_compl_stat = ""
      no-lock:

         if sod_fa_nbr = wo_nbr and sod_lot = wo_lot
         then do:
        /*93sp12.1    {us/gp/gpcmtprt.i &type=RP &id=sod_cmtindx &pos=5} */
            /*eB3sp5*/ {us/xf/xfcmtprt.i &type=RP &rectype=X &id=sod_cmtindx
                           &usercode="us/xf/xfworlux.i"}
         end.

         else
         if sod_fa_nbr = wo_nbr and sod_lot = "" and fas_unit_qty = string(true)
         then do:

            find pt_mstr where pt_mstr.pt_domain = global_domain
               and pt_part = sod_part
            no-lock no-error.

            if available pt_mstr then do:
               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &PARAM = "( input  sod_part,
                                    input  wod_site,
                                    input ""pt_lot_ser"",
                                    output l_pt_lot_ser)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
            end.
            if available pt_mstr and l_pt_lot_ser = "S"
            then do:
            /*93sp12.1   {us/gp/gpcmtprt.i &type=RP &id=sod_cmtindx &pos=5} */
                /*eB3sp5*/  {us/xf/xfcmtprt.i &type=RP &rectype=X &id=sod_cmtindx
                           &usercode="us/xf/xfworlux.i"}
            end.

         end.

      end.

   end.
   else
      view frame picklist.

   /*DISPLAY COMMENTS */
   if first-of(wod_iss_date)
   then do:
      /*93sp12.1 {us/gp/gpcmtprt.i &type=RP &id=wo_cmtindx &pos=3} */
     /*eB3sp5*/     {us/xf/xfworlbm4.i}
   end.

   assign
      um = ""
      loc = ""
      com_rev = ""
      loc = wod_loc
     /*eB3sp5*/  ptdraw = ""
      description = "".

   find pt_mstr where pt_mstr.pt_domain = global_domain
      and pt_part = wod_part
   no-lock no-error.
   /*eB3sp5*/  if available pt_mstr then ptdraw = pt_draw.

   find ptp_det where ptp_det.ptp_domain = global_domain
      and ptp_part = wod_part
      and ptp_site = wod_site
   no-lock no-error.

   if (available ptp_det and ptp_iss_pol = no)
      or (not available ptp_det
      and available pt_mstr and pt_iss_pol = no)
   then
      next.

   if available pt_mstr
   then do:

      um = pt_um.

      if loc = "" then do:
         {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                  &PARAM = "(input  wod_part,
                             input  wod_site,
                             input ""pt_loc"",
                             output loc)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}
      end.

      assign
         description = pt_desc1
         description = description + " " + pt_desc2.

      if available ptp_det then
         com_rev = ptp_rev.
      else
         com_rev = pt_rev.
   end.

   if page-size - line-counter < 4 then page.

   /* SET EXTERNAL LABELS */
   setFrameLabels(frame detail:handle).

   display
      wod_part
      com_rev
      wod_site @ lad_loc     column-label "Site!Location"
      ""       @ lad_lot     column-label "Lot/Serial!Ref"
      max(wod_qty_req - wod_qty_iss,0)
               @ wod_qty_all column-label "Required!Qty to Issue"
                             format "->>>,>>>,>>9.9<<<<<<<<"
      um
      ""       @ issued
   with frame detail width 80 .
   down 1 with frame detail.

   if available pt_mstr and pt_desc1 <> ""
   then do:
      if page-size - line-counter < 1
      then do:
         page.
         /*DISPLAY CONTINUED*/
         display
            wod_part
            c-cont @ lad_lot
         with frame detail.
         down 1 with frame detail.

      end.

      put space(3) pt_desc1 skip.

   end.

   if available pt_mstr and pt_desc2 <> ""
   then do:
      if page-size - line-counter < 1
      then do:
         page.
         /*DISPLAY CONTINUED*/
         display
            wod_part
            c-cont @ lad_lot
         with frame detail.
         down 1 with frame detail.

      end.

      put space(3) pt_desc2 skip.

   end.

   if     l_all_avl_limit 
      and (wod_qty_all + wod_qty_pick) = 0
   then do:
      /* QUANTITY NOT AVAILABLE AT THIS LOCATION */
      {us/bbi/pxmsg.i &MSGNUM=4992 &ERRORLEVEL=1 &MSGBUFFER=c-msg-text}
      put c-msg-text at 20 skip.
   end. /* IF l_all_avl_limit */
   
   /*eB3sp5*/ {us/xf/xfworlbmf.i}

   if autopick 
   then do: 
      /*DISPLAY ALLOCATION DETAIL*/
      for each lad_det where lad_det.lad_domain = global_domain
         and lad_dataset = "wod_det"
         and lad_nbr = wod_lot
         and lad_line = string(wod_op)
         and lad_part = wod_part
      with frame detail:
   
         find ld_det where ld_det.ld_domain = global_domain
            and ld_site = lad_site
            and ld_loc = lad_loc
            and ld_part = lad_part
            and ld_lot = lad_lot
            and ld_ref = lad_ref
         no-lock no-error.
   
         accumulate lad_qty_all (total).
   
         if page-size - line-counter < 1
         then do:
            page.
            /*DISPLAY CONTINUED*/
            display
               wod_part
               c-cont @ lad_lot
            with frame detail.
            down 1 with frame detail.
   
         end.
   
         if incl_pick_qtys then
            qtyall = lad_qty_all + lad_qty_pick.
         else
            qtyall = lad_qty_all.
   
         display
            lad_loc
            lad_lot
            qtyall @ wod_qty_all
            issued
         with frame detail.
         down 1 with frame detail.
   
         display
            lad_ref @ lad_lot
         with frame detail.
   
         if available ld_det and ld_expire <> ? then
            display
               ld_expire @ lad_loc
            with frame detail.
   
         /* DISPLAY NON-CONFORMING STATUS IF PROFILE EXISTS FOR WO BILL */
         if available ld_det then do:
            empty temp-table tt_attrpf_mstr.
            empty temp-table tt_attrpfd_det.
            {us/px/pxrun.i &PROC       = 'getWOBillProfile'
                           &PROGRAM    = 'capfxr.p'
                           &HANDLE     = ph_capfxr
                           &PARAM      = "(input wod_lot,
                                           input wod_part,
                                           input wod_op,
                                           output table tt_attrpf_mstr by-reference,
                                           output table tt_attrpfd_det by-reference)"
                           &NOAPPERROR = true
                           &CATCHERROR = true
            }
            if can-find(first tt_attrpf_mstr) then do:
               {us/px/pxrun.i &PROC = 'validateWOAttrSpecByKeys'
                        &HANDLE = ph_caisxr
                        &PROGRAM = 'caisxr.p'
                        &PARAM = "(input ld_det.oid_ld_det,
                                   input ld_det.ld_part,
                                   input ld_det.ld_site,
                                   input ld_det.ld_loc,
                                   input ld_det.ld_lot,
                                   input ld_det.ld_ref,
                                   input wod_lot,
                                   input wod_op,
                                   output isConforming)"
                        &NOAPPERROR = true
                        &CATCHERROR = true
               }
               down 1 with frame detail.
               if isConforming = {&QUALITY_TEST_RESULT_STATUS_CONFORM} then do:
                  display
                     getTermLabel("CONFORMING", 15) @ lad_lot with frame detail.
               end.
               else if isConforming = {&QUALITY_TEST_RESULT_STATUS_NON_CONFORM} then do:
                  display
                     getTermLabel("NON-CONFORMING", 15) @ lad_lot with frame detail.
               end.
            end.
         end.
   
         down 1 with frame detail.
   
         /*eB3sp5*/       {us/xf/xfworlbmh.i}
	 
         /*IF QTY OH - QTY ALL TO OTHER ORDERS < QTY ALL TO THIS ORDER*/
         if not available ld_det
            or ld_qty_oh - ld_qty_all + lad_qty_all < lad_qty_all
         then do:
            if page-size - line-counter < 1
            then do:
               page.
               /*DISPLAY CONTINUED*/
               display
                  wod_part
                  c-cont @ lad_lot
               with frame detail.
               down 1 with frame detail.
   
            end.
   
               /*Quantity not available at this location*/
               {us/bbi/pxmsg.i &MSGNUM=4992 &ERRORLEVEL=1 &MSGBUFFER=c-msg-text}
   
               put c-msg-text at 20 skip.
             /*eB3sp5*/  {us/xf/xfworlbmsg.i}
         end.
      /*eB3sp5*/   {us/xf/xfworlbmsh.i}
   
         /*UPDATE QTY PICKED*/
         assign
            lad_qty_pick = lad_qty_pick + lad_qty_all
            lad_qty_all = 0.
   
      end.
   
      if wod_qty_all > accum total(lad_qty_all)
         then do with frame detail:
   
         if page-size - line-counter < 1
         then do:
            page.
            /*DISPLAY CONTINUED*/
            display
               wod_part
               c-cont @ lad_lot
            with frame detail.
            down 1 with frame detail.
   
         end.
   
         display
            "      ********" @ wod_part
            c-quantity @ lad_loc
            c-not-avail @ lad_lot
            wod_qty_all - accum total (lad_qty_all) @ wod_qty_all
               format "->>>,>>>,>>9.9<<<<<<<<"
            "********" @ issued
         with frame detail.
 /*eb3sp5*/     {us/xf/xfworlbmj.i}
   
      end.
   
      put skip(1).
      assign
         wod_qty_pick = wod_qty_pick + accum total(lad_qty_all)
         wod_qty_all = wod_qty_all - accum total(lad_qty_all).
   end. /*IF autopick*/ 
end. /*FOR EACH*/

if incl_floor_stk
then do:
   find first floorstk no-error.

   if available floorstk
   then do:

      if picklistprinted = no
      then do:

         hide frame picklist.
         page.

         display
            wo_nbr
            wo_lot
            wo_batch
            wo_part
            par_rev
            wo_due_date
            issue-date @ wod_iss_date
            wo_des
            wo_rmks
            wo_so_job
            wo_qty
            wo_um
            deliv
         with frame picklist.
/*eB3sp5*/         run print_header in this-procedure.

         for each sod_det where sod_det.sod_domain = global_domain
            and sod_nbr = wo_so_job
            and sod_compl_stat = ""
         no-lock:
            if sod_fa_nbr = wo_nbr and sod_lot = wo_lot
            then do:
             /*93sp12.1  {us/gp/gpcmtprt.i &type=RP &id=sod_cmtindx &pos=5} */
                /*eB3sp5*/  {us/xf/xfcmtprt.i &type=RP &rectype=X &id=sod_cmtindx
                          &usercode="us/xf/xfworlux.i"}
            end.
         end.

         /* DISPLAY COMMENTS */
       /*93sp12.1  {us/gp/gpcmtprt.i &type=RP &id=wo_cmtindx &pos=3} */
         /*eB3sp5*/   {us/xf/xfcmtprt.i &type=RP &rectype=Y &id=wo_cmtindx
               &usercode="us/xf/xfworluy.i"}

         picklistprinted = yes.

      end. /*if picklistprinted = no.*/

      display skip(1) with frame floorstk1.

   end.

   if available floorstk then

   for each floorstk with frame floorstk width 80 down:

      find pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = fs_part
      no-lock no-error.

      if (pt_desc1 <> "" or pt_desc2 <> "")
         and (page-size - line-counter < 2) then page.
      else
      if (pt_desc1 <> "" and pt_desc2 <> "")
         and (page-size - line-counter < 3) then page.

      /* SET EXTERNAL LABELS */
      setFrameLabels(frame floorstk:handle).

      display
         space(3)
         fs_part
         fs_qty
         pt_um.

      if pt_desc1 <> "" then down 1.
      if pt_desc1 <> "" then display "   " + pt_desc1 @ fs_part.
      if pt_desc2 <> "" then down 1.
      if pt_desc2 <> "" then display "   " + pt_desc2 @ fs_part.

      /*eB3sp5*/      {us/xf/xfworlbmk.i}
      delete floorstk.

   end.

end.

page.
hide frame picklist.
/*eB3sp5*/   {us/xf/xfworlbm0.i} /* print procedure */
