/* xxprap.p - COMPUTER PLANNED PURCHASE ORDER (REQUISITION) APPROVAL    */
/* mrprap.p - COMPUTER PLANNED PURCHASE ORDER (REQUISITION) APPROVAL    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxprap.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* REVISION: 1.0      LAST MODIFIED: 06/26/86   BY: EMB                 */
/* REVISION: 1.0      LAST MODIFIED: 12/23/87   BY: EMB                 */
/* REVISION: 4.0      LAST MODIFIED: 05/30/89   BY: EMB *A740           */
/* REVISION: 6.0      LAST MODIFIED: 09/12/90   BY: emb *D040*          */
/* REVISION: 6.0      LAST MODIFIED: 08/15/91   BY: ram *D832           */
/* REVISION: 6.0      LAST MODIFIED: 12/17/91   BY: emb *D966*          */
/* REVISION: 7.3      LAST MODIFIED: 01/06/93   BY: emb *G508*          */
/* REVISION: 7.3      LAST MODIFIED: 09/13/93   BY: emb *GF09* (rev)    */
/* REVISION: 7.5      LAST MODIFIED: 08/09/94   BY: tjs *J014*          */
/* REVISION: 7.3      LAST MODIFIED: 11/09/94   BY: srk *GO05*          */
/* REVISION: 7.5      LAST MODIFIED: 01/01/95   BY: mwd *J034*          */
/* REVISION: 8.5      LAST MODIFIED: 02/11/97   BY: *J1YW* Patrick Rowan      */
/* REVISION: 8.5      LAST MODIFIED: 10/14/97   BY: *G2PT* Felcy D'Souza      */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 07/10/98   BY: *J2QS* Samir Bavkar       */
/* REVISION: 8.5      LAST MODIFIED: 08/12/98   BY: *J2V2* Patrick Rowan      */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KR* myb                */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.11.1.4     BY: Reetu Kapoor   DATE: 05/02/01 ECO: *M162*       */
/* Revision: 1.11.1.6     BY: Sandeep P.     DATE: 08/24/01 ECO: *M1J7*       */
/* Revision: 1.11.1.7     BY: Sandeep P.     DATE: 09/10/01 ECO: *M1KJ*       */
/* Revision: 1.11.1.8   BY: Rajaneesh S.       DATE: 08/29/02 ECO: *M1BY* */
/* Revision: 1.11.1.10  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00J* */
/* Revision: 1.11.1.11  BY: Subramanian Iyer   DATE: 11/24/03 ECO: *P13Q* */
/* Revision: 1.11.1.12  BY: Steve Nugent       DATE: 07/15/10 ECO: *Q2W2* */
/* CYB                    BY: nac               DATE: 26 May 10 ECO: *Q9021* */
/* CYB                    BY: nac               DATE: 26 May 10 ECO: *CY1007* */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                    BY: gbg               DATE: 22 Mar 17 ECO: *D3738* */
/* CYB                BY: gbg               DATE: 12 May 17 ECO: *C1605* */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/mf/mfdtitle.i "x1 "}
/*d3738*/ {us/xx/xx3738.i NEW}

 
 
define new shared variable release_all like mfc_logical
   label "Default Approve".
define new shared variable numlines as integer initial 10.
define new shared variable mindwn as integer.
define new shared variable maxdwn as integer.
define new shared variable worecno as recid extent 10 no-undo.
/*d3738*/ def new shared  var woqty          like wo_qty_ord extent 10.
define new shared variable grs_req_nbr like req_nbr no-undo.
define new shared variable grs_approval_cntr as integer no-undo.
 
 
define variable show_phantom like mfc_logical
   label "Include Phantoms" initial no.
define variable show_mfg like mfc_logical initial no
   label "Include Manufactured Items".
define variable buyer like pt_buyer.
define variable nbr like req_nbr.
define variable part like mrp_part.
define variable part2 like mrp_part.
define variable rel_date like mrp_rel_date.
define variable rel_date2 like mrp_rel_date.
define variable dwn as integer.
define variable yn like mfc_logical.
define variable site like si_site.
define variable site2 like si_site.
define variable l_part like pt_part no-undo.
define variable l_vend like pt_vend no-undo.
define variable l_cnt  as   integer no-undo.
define variable using_grs like mfc_logical no-undo.
define variable show_kanban as logical
   label "Include Kanban Replenished Items" initial false no-undo.
 
define new shared temp-table tt-rqm-mstr no-undo
    field tt-vend   like rqm_mstr.rqm_vend
    field tt-nbr    like rqm_mstr.rqm_nbr
    field tt-line   like rqd_det.rqd_line
    field tt-part   like rqd_det.rqd_part
    field tt-yn     like mfc_logical
    field tt-wo-nbr like wo_nbr
    field tt-wo-lot like wo_lot
    index vend is primary
       tt-vend
       tt-nbr
       tt-line
    index ttnbrlot
       tt-wo-nbr
       tt-wo-lot
    index ttnbr
       tt-nbr.
 
/* INPUT OPTION FORM */
/*d3738* start added cdeo >>>> */
form
   part                     colon 15
   /*V8! View-as fill-in size 18 by 1 */
   part2 label {us/t0/t001.i}     colon 45
   /*V8! View-as fill-in size 18 by 1 */
   site                     colon 15
   site2 label {us/t0/t001.i}     colon 45
   rel_date                 colon 15
   rel_date2 label {us/t0/t001.i} colon 45 
   vend                     colon 15
   vend1 label {us/t0/t001.i}     colon 45
   prodline                 colon 15
   prodline1 label {us/t0/t001.i}     colon 45 skip(1)
   vDueDate                 colon 36 skip(1)
   release_all              colon 36
   buyer                    colon 36
   show_kanban        colon 36
   show_phantom             colon 36
   show_mfg                 colon 36
with frame a side-labels width 80 attr-space.
/*d3738* end added code <<<< */
/*c1603* start deleted code >>>>>>>>
form
   part                     colon 15
   part2 label "To"     colon 45
   site                     colon 15
   site2 label "To"     colon 45
   rel_date                 colon 15
   rel_date2 label "To" colon 45 skip(1)
   release_all              colon 36
   buyer                    colon 36
   show_kanban        colon 36
   show_phantom             colon 36
   show_mfg                 colon 36
with frame a side-labels width 80.
**c1603* end   deleted code <<<<<<< */
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
assign
   release_all = yes
   site = global_site
   site2 = global_site.
/*c1603*/ assign site = "" site2 = "".
 
main-loop:
repeat:
   assign
      worecno = ?
      dwn = 0
      mindwn = 1
      maxdwn = 0.
 
    ststatus = stline[1].
    status input ststatus.
 
   if part2 = hi_char then part2 = "".
   if site2 = hi_char then site2 = "".
   if rel_date = low_date then rel_date = ?.
   if rel_date2 = hi_date  then rel_date2 = ?.
/*d3738* start added code >>> */
   if vend1 = hi_char then vend1 = "".
   if prodline1 = hi_char then prodline1 = "".
/*d3738* end added code <<<< */
 
   /* GRS INITIALIZATION */
   assign
      l_cnt             = 0
      grs_req_nbr       = ""
      grs_approval_cntr = 0.

   {us/bbi/gprun.i ""gpmfc01.p""
      "(input 'grs_installed',
        input '',
        input '',
        input '',
        output using_grs)"}

 
   update
      part part2
      site site2
      rel_date rel_date2
/*d3269* start added code >>> */
      vend vend1
      prodline prodline1
      vDueDate
/*d3269* end added code   <<< */
      release_all
      buyer
      show_kanban
      show_phantom
      show_mfg
   with frame a
   editing:
 
      if frame-field = "part"
      then do:
 
         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i wo_mstr part  " wo_mstr.wo_domain = global_domain and wo_part
         "  part wo_part wo_part}
 
         if recno <> ?
         then do:
            if available wo_mstr
            and wo_joint_type = ""
            then do:
               part = wo_part.
               display part with frame a.
               recno = ?.
            end. /*IF AVAILABLE .......*/
         end. /* IF recno <> ? */
      end. /* IF frame-field = "part" */
      else if frame-field = "part2"
      then do:
 
         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i wo_mstr part2  " wo_mstr.wo_domain = global_domain and wo_part
         "  part2 wo_part wo_part}
 
         if recno <> ?
         then do:
 
            if available wo_mstr
            and wo_joint_type = ""
            then do:
               part2 = wo_part.
               display part2 with frame a.
               recno = ?.
            end. /* IF AVAILABLE wo_mstr */
         end. /* IF recno <> ? */
      end. /* ELSE IF */
      else if frame-field = "site"
      then do:
 
         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i si_mstr site  " si_mstr.si_domain = global_domain and si_site
         "  site si_site si_site}
 
         if recno <> ?
         then
            display si_site @ site with frame a.
      end. /* ELSE IF frame-field .. */
      else if frame-field = "site2"
      then do:
 
         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i si_mstr site2  " si_mstr.si_domain = global_domain and si_site
         "  site2 si_site si_site}
 
         if recno <> ?
         then
            display si_site @ site2 with frame a.
      end. /* ELSE IF frame-field = "site2" */
/*d3269* start added code >>> */
      else if frame-field = "vend"
      then do:

         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i vd_mstr vend  
	 " vd_mstr.vd_domain = global_domain and si_site "
         vend vd_addr vd_addr}

         if recno <> ?
         then
            display vd_addr @ vend with frame a.
      end. /* ELSE IF frame-field = "vend" */
      else if frame-field = "vend1"
      then do:

         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i vd_mstr vend1  
	 " vd_mstr.vd_domain = global_domain and si_site "
         vend1 vd_addr vd_addr}

         if recno <> ?
         then
            display vd_addr @ vend1 with frame a.
      end. /* ELSE IF frame-field = "vend1" */
      else if frame-field = "prodline"
      then do:

         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i pl_mstr prodline  
	 " pl_mstr.pl_domain = global_domain and pl_prod_line "
         prodline pl_prod_line pl_prod_line}

         if recno <> ?
         then
            display pl_prod_line @ prodline  with frame a.
      end. /* ELSE IF frame-field = "prodline" */
      else if frame-field = "prodline1"
      then do:

         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i pl_mstr prodline1  
	 " pl_mstr.pl_domain = global_domain and pl_prod_line "
         prodline1  pl_prod_line pl_prod_line}

         if recno <> ?
         then
            display pl_prod_line @ prodline1   with frame a.
      end. /* ELSE IF frame-field = "prodline1" */
/*d3269* end added code   <<< */
      else do:
         ststatus = stline[3].
         status input ststatus.
         readkey.
         apply lastkey.
      end. /* ELSE DO */
   end. /* EDITING */
 
   status input "".
 
   if part2 = "" then part2 = hi_char.
   if site2 = "" then site2 = hi_char.
   if rel_date = ? then  rel_date = low_date.
   if rel_date2 = ? then rel_date2 = hi_date.
/*d3269* start added code >>> */
   if vend1 = "" then vend1 = hi_char.
   if prodline1 = "" then prodline1 = hi_char.
/*d3269* end added code   <<< */
 
   {us/bbi/gprun.i ""gpsirvr.p""
      "(input site, input site2, output return_int)"}
   if return_int = 0
   then do:
      next-prompt site with frame a.
      undo main-loop, retry main-loop.
   end. /* IF return_int = 0 */
 
   for each tt-rqm-mstr
      exclusive-lock:
      delete tt-rqm-mstr.
   end. /* FOR EACH tt-rqm-mstr */
 
   /* BELOW CODE STARTS WITH THE PT_MSTR AND IN_MSTR TABLES,         */
   /* SELECTING THE RECORDS WITHIN THE SELECTION CRITERIA OF ITEM    */
   /* AND SITE FOR WHICH WO EXISTS. THEN A CHECK IS MADE FOR PURCHASE*/
   /* MANUFACTURE, PHANTOM, BUYER/PLANNER VALUES BEFORE SEARCHING FOR*/
   /* WORK ORDERS WITH A PLANNED STATUS CODE. THIS IS SIGNIFICANTLY  */
   /* FASTER WHEN THERE ARE LARGE NUMBER OF WORK ORDERS AND WHEN     */
   /* BUYER/PLANNER FIELD IS ENTERED IN THE SELECTION CRITERIA.      */
 
   for each pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
   (pt_part >= part
                              and  pt_part <= part2)
/*d3269* start added code >>> */
                             and(pt_vend >= vend and pt_vend <= vend1)
                             and(pt_prod_line >= prodline 
			         and pt_prod_line <= prodline1)
/*d3269* end added code   <<< */
			      ,
       each in_mstr no-lock  where in_mstr.in_domain = global_domain and
       in_part  = pt_part
                              and (in_site >= site
                              and  in_site <= site2)
         and can-find (first wo_mstr  where wo_mstr.wo_domain = global_domain
         and
            wo_part = in_part and wo_site = in_site):
 
      find ptp_det
         no-lock
          where ptp_det.ptp_domain = global_domain and  ptp_part = in_part
         and ptp_site = in_site
         no-error.
 
      if (available ptp_det
         and (ptp_phantom = no    or show_phantom   = yes)
         and (ptp_replenishment_mthd <> "2" or show_kanban = yes)
         and (ptp_buyer   = buyer or buyer          = "" )
         and (ptp_pm_code = "P"   or show_mfg       = yes))
         or
         (not available ptp_det
         and (pt_phantom  = no    or show_phantom   = yes)
         and (pt_replenishment_mthd <> "2" or show_kanban = yes)
         and (pt_buyer    = buyer or buyer          = "" )
         and (pt_pm_code  = "P"   or show_mfg       = yes)) then
      do:
 
         for each wo_mstr no-lock  where wo_mstr.wo_domain = global_domain and
                   wo_part      = in_part
               and wo_site      = in_site
               and wo_rel_date >= rel_date
               and wo_rel_date <= rel_date2
               and wo_status    = "P"
               and wo_joint_type = ""
               use-index wo_part_rel:
 
            assign
               dwn = dwn + 1
               maxdwn = maxdwn + 1
               worecno[dwn] = recid(wo_mstr)
/*d3738*/      woqty[dwn] = wo_qty_ord
               l_part       = pt_part
               l_vend       = if available ptp_det
                              then ptp_vend
                              else pt_vend.
 
 
            /* RESTRICTING maxdwn TO 999 AND REASSIGNING dwn TO 0 */
            /* SO THAT DETAIL LINES TO APPROVE WOULD START FROM   */
            /* 1 - 999 FOR THE NEXT SET OF LINES ABOVE 999        */
 
            /* CREATING TEMP-TABLE tt-rqm-mstr. BASED ON THE RECORDS */
            /* CREATED, CORRESPONDING GRS WILL BE CREATED FOR EACH   */
            /* VENDOR (SUPPLIER)                                     */ 
 
            if using_grs
            then do:
               create tt-rqm-mstr.
               assign
                  tt-wo-nbr = wo_nbr
                  tt-wo-lot = wo_lot
                  tt-vend   = l_vend
                  tt-line   = dwn
                  tt-part   = l_part.
               release tt-rqm-mstr.
            end. /* IF using_grs */
 
            if dwn = numlines or maxdwn = 999
            then do:
 
               hide frame a.
/*q9021*       {us/bbi/gprun.i ""mrprapa.p""} */
/*q9021*/      {us/bbi/gprun.i ""xxprapa.p""}
 
               if maxdwn = 999
               then
                  assign
                     mindwn = 1
                     maxdwn = 0.
 
               if worecno[1] = ?
               then do:
                  worecno = ?.
                  dwn = 0.
                  undo main-loop, next main-loop.
               end. /*IF worecno[1] = ? */
 
               assign
                  worecno = ?
                  dwn = 0
                  mindwn = maxdwn + 1.
            end. /* IF DWN = NUMLINES */
 
         end. /* FOR EACH WO_MSTR */
      end. /* IF AVAILABLE PTP_DET */
   end. /* FOR EACH PT_MSTR */
 
   if dwn <> 0
   then do:
      hide frame a.
/*q9021*   {us/bbi/gprun.i ""mrprapa.p""} */
/*q9021*/  {us/bbi/gprun.i ""xxprapa.p""}
      if worecno[1] = ?
      then
         undo main-loop, next main-loop.
   end. /* IF dwn <> 0 */
   else do:
      {us/bbi/pxmsg.i &MSGNUM=307 &ERRORLEVEL=1}
      /* NO MORE PLANNED PURCHASE ORDERS SATISFY CRITERIA */
   end. /* ELSE DO */
 
   if using_grs
   and grs_req_nbr <> ""
   then do:
      for each tt-rqm-mstr
         where tt-nbr <> ""
           and tt-yn
         no-lock break by tt-vend:
         if last-of(tt-vend)
         then
            l_cnt = l_cnt + 1.
      end. /* FOR EACH tt-rqm-mstr */
 
      /* PROCEDURE COMPLETE. # REQUISITIONS CREATED */
      {us/bbi/pxmsg.i &MSGNUM=4640 &ERRORLEVEL=1 &MSGARG1=l_cnt}
 
      for last tt-rqm-mstr
        where tt-nbr <> ""
          and tt-yn
        use-index ttnbr no-lock:
      end. /* FOR LAST tt-rqm-mstr */
      if  available tt-rqm-mstr
      and l_cnt > 0
      then do:
         if l_cnt = 1
         then do:
            /* REQUISITION CREATED. REQUISITION NUMBER IS */
            {us/bbi/pxmsg.i &MSGNUM=2765 &ERRORLEVEL=1 &MSGARG1=tt-rqm-mstr.tt-nbr}
         end. /* IF l_cnt = 1 */
         else do:
            /* LAST REQUISITION CREATED: */
            {us/bbi/pxmsg.i &MSGNUM=4641 &ERRORLEVEL=1 &MSGARG1=tt-rqm-mstr.tt-nbr}
         end. /* ELSE DO */
      end. /* IF AVAILABLE tt-rqm-mstr AND l_cnt > 0 */
 
   end. /* IF using_grs */
 
end. /* MAINLOOP */
