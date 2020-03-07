/* xxprapa.p - APPROVE PLANNED PURCHASE ORDERS 1st subroutine           */
/* mrprapa.p - APPROVE PLANNED PURCHASE ORDERS 1st subroutine           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxprapa.p,v 1.3 2018/03/13 17:11:18 gbg Exp $: */
/* REVISION: 1.0     LAST MODIFIED: 05/09/86    BY: EMB      */
/* REVISION: 1.0     LAST MODIFIED: 10/24/86    BY: EMB *37* */
/* REVISION: 2.0     LAST MODIFIED: 03/06/87    BY: EMB *A39* */
/* REVISION: 2.1     LAST MODIFIED: 06/15/87    BY: WUG *A67* */
/* REVISION: 2.1     LAST MODIFIED: 09/18/87    BY: WUG *A94* */
/* REVISION: 2.1     LAST MODIFIED: 12/22/87    BY: emb       */
/* REVISION: 4.1     LAST MODIFIED: 07/14/88    BY: emb *A322**/
/* REVISION: 4.1     LAST MODIFIED: 09/06/88    BY: emb *A420**/
/* REVISION: 4.1     LAST MODIFIED: 01/24/89    BY: emb *A621**/
/* REVISION: 4.1     LAST MODIFIED: 05/30/89    BY: emb *A740**/
/* REVISION: 4.1     LAST MODIFIED: 01/08/90    BY: emb *A800**/
/* REVISION: 5.0     LAST MODIFIED: 11/10/89    BY: emb *B389**/
/* REVISION: 6.0     LAST MODIFIED: 07/06/90    BY: emb *D040**/
/* REVISION: 6.0     LAST MODIFIED: 01/29/91    BY: bjb *D248**/
/* REVISION: 6.0     LAST MODIFIED: 08/15/91    BY: RAM *D832**/
/* REVISION: 6.0     LAST MODIFIED: 12/17/91    BY: emb *D966**/
/* REVISION: 7.0     LAST MODIFIED: 08/28/91    BY: MLV *F006**/
/* REVISION: 7.0     LAST MODIFIED: 10/17/91    BY: emb *F024**/
/* REVISION: 7.0     LAST MODIFIED: 12/09/91    BY: RAM *F033**/
/* REVISION: 7.3     LAST MODIFIED: 01/06/93    BY: emb *G508**/
/* REVISION: 7.3     LAST MODIFIED: 09/13/93    BY: emb *GF09**/
/* REVISION: 7.3     LAST MODIFIED: 09/01/94    BY: ljm *FQ67**/
/* Oracle changes (share-locks)     09/12/94    BY: rwl *GM39**/
/* REVISION: 7.3     LAST MODIFIED: 09/20/94    BY: jpm *GM74**/
/* REVISION: 7.3     LAST MODIFIED: 11/09/94    BY: srk *GO05**/
/* REVISION: 7.3     LAST MODIFIED: 10/16/95    BY: emb *G0ZK**/
/* REVISION: 8.5     LAST MODIFIED: 10/16/96    BY: *J164* Murli Shastri */
/* REVISION: 8.5     LAST MODIFIED: 02/11/97    BY: *J1YW* Patrick Rowan */
/* REVISION: 8.6E    LAST MODIFIED: 02/23/98    BY: *L007* A. Rahane     */
/* REVISION: 8.6E    LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan    */
/* REVISION: 8.5     LAST MODIFIED: 07/30/98    BY: *J2V2* Patrick Rowan */
/* REVISION: 8.6E    LAST MODIFIED: 10/04/98    BY: *J314* Alfred Tan    */
/* REVISION: 9.0     LAST MODIFIED: 11/06/98    BY: *J33S* Sandesh Mahagaokar */
/* REVISION: 9.0     LAST MODIFIED: 03/13/99    BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1     LAST MODIFIED: 10/01/99    BY: *N014* Patti Gaultney     */
/* REVISION: 9.1     LAST MODIFIED: 10/19/99    BY: *K23S* John Corda         */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1     LAST MODIFIED: 08/13/00    BY: *N0KR* myb                */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.24     BY: Reetu Kapoor        DATE: 05/02/01 ECO: *M162*      */
/* Revision: 1.27     BY: Thomas Fernandes    DATE: 05/30/01 ECO: *L17S*      */
/* Revision: 1.28     BY: Niranjan R.         DATE: 07/23/01 ECO: *P00L*      */
/* Revision: 1.30     BY: Sandeep P.          DATE: 08/24/01 ECO: *M1J7*      */
/* Revision: 1.31     BY: Sandeep P.          DATE: 09/10/01 ECO: *M1KJ*      */
/* Revision: 1.33     BY: Mercy Chittilapilly DATE: 08/26/02 ECO: *N1RX*      */
/* Revision: 1.34     BY: Rajaneesh S.        DATE: 08/29/02 ECO: *M1BY*      */
/* Revision: 1.35     BY: Vandna Rohira       DATE: 01/21/03 ECO: *N24S*      */
/* Revision: 1.37     BY: Paul Donnelly (SB)  DATE: 06/28/03 ECO: *Q00J*      */
/* Revision: 1.39     BY: Katie Hilbert       DATE: 01/08/04 ECO: *P1J4*      */
/* Revision: 1.41     BY: Swati Sharma        DATE: 07/30/04 ECO: *P2CW*      */
/* CYB                BY: nac                DATE: 26 May 10 ECO: *Q9021*     */
/* CYB                BY: nac                DATE: 26 May 10 ECO: *cy1007*    */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*           */
/* CYB                    BY: gbg               DATE: 22 Mar 17 ECO: *D3738* */
/* CYB                BY: gbg               DATE: 12 May 17 ECO: *C1605* */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/* CYB   LAST MODIFIED: 15-FEB-2018    BY: gbg *K10017a*                       */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
/*d3738*/ {us/xx/xx3738.i}

{us/px/pxmaint.i}
{us/px/pxphdef.i gpcalxr}

define shared variable release_all       like mfc_logical.
define shared variable worecno           as recid extent 10 no-undo.
/*d3738*/ def shared  var woqty          like wo_qty_ord extent 10.
define shared variable numlines          as integer initial 10.
define shared variable mindwn            as integer.
define shared variable maxdwn            as integer.
define shared variable grs_req_nbr       like req_nbr no-undo.
define shared variable grs_approval_cntr as integer no-undo.

define variable nbr             like req_nbr           no-undo.
define variable dwn             like pod_line          no-undo.
define variable wonbrs          as character extent 10 no-undo.
define variable wolots          as character extent 10 no-undo.
define variable yn              like mfc_logical column-label "Approve" no-undo.
define variable flag            as integer initial 0   no-undo.
define variable line            like req_line          no-undo.
define variable i               as integer             no-undo.
define variable nonwdays        as integer             no-undo.
define variable overlap         as integer             no-undo.
define variable workdays        as integer             no-undo.
define variable interval        as integer             no-undo.
define variable frwrd           as integer             no-undo.
define variable know_date       as date                no-undo.
define variable find_date       as date                no-undo.
define variable approve         like mfc_logical extent 10    no-undo.
define variable grs_return_code as   integer           no-undo.
define variable remarks_text    like rqm_rmks          no-undo.
define variable l_req_nbr       like rqm_mstr.rqm_nbr  no-undo.
define variable l_approve_ctr   as   integer           no-undo.
define variable l_displayed     like mfc_logical       no-undo.
define variable using_grs       like mfc_logical       no-undo.

/*d3738*/ def var vdwoqty like wo_qty_ord.

define shared temp-table tt-rqm-mstr no-undo
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

define buffer b-rqm-mstr for tt-rqm-mstr.

form
   dwn
   nbr
   wo_part
/*d3738*   wo_qty_ord */
/*d3738*/ vdwoqty
   wo_rel_date label "Rel Date"
   wo_due_date
   yn
with frame d.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

remarks_text = getTermLabel("MRP_PLANNED_ORDER",23).

for first gl_ctrl
   where gl_domain = global_domain no-lock:
end. /* FOR FIRST gl_ctrl */

{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'grs_installed',
     input '',
     input '',
     input '',
     output using_grs)"}

assign
   l_approve_ctr = 0
   l_displayed   = no
   approve       = release_all.

/* GET NEXT GRS REQUISITION NBR IF RELEASE_ALL = YES */
if using_grs
then do:

   for each tt-rqm-mstr
      where tt-nbr = ""
   use-index ttnbr
   exclusive-lock break by tt-vend:

      for first b-rqm-mstr
         where b-rqm-mstr.tt-vend = tt-rqm-mstr.tt-vend
         and   b-rqm-mstr.tt-nbr  <> ""
      use-index vend
      no-lock:
      end. /* FOR FIRST b-rqm-mstr */
      if not available b-rqm-mstr
      then do:
         {us/gp/gprunmo.i
            &program="mrprapa1.p"
            &module="GRS"
            &param="""(output grs_return_code,
                       output grs_req_nbr)"""}
         if grs_return_code = 0
         then
            assign
               tt-rqm-mstr.tt-nbr = grs_req_nbr
               tt-rqm-mstr.tt-yn  = release_all.
      end. /* IF NOT AVAILABLE b-rqm-mstr */
      else do:
         l_req_nbr = b-rqm-mstr.tt-nbr.
         find first b-rqm-mstr
            where b-rqm-mstr.tt-vend = tt-rqm-mstr.tt-vend
            and   b-rqm-mstr.tt-nbr  = ""
         use-index vend
         exclusive-lock no-error.
         if available b-rqm-mstr
         then
            assign
               b-rqm-mstr.tt-nbr = l_req_nbr
               b-rqm-mstr.tt-yn  = release_all.
      end. /* ELSE DO */
   end. /* FOR EACH tt-rqm-mstr */

end.  /* if using_grs */

/*d3738* start added code >>> */
   vPalletCount = 0.
/*d3738* end added code   <<< */

do transaction on error undo, retry:
   mainloop:
   repeat:
/*d3738* start added code >>> */
vTotQty = 0.
vTotPlC = 0.
      /*V8-*/
/*d3738* start added code >>> */
      do dwn = mindwn to maxdwn
         with frame b 11 down width 80 attr-space:
/*d3738* end added code   <<< */

/*c1603* start deleted code >>>>>>>>
      do dwn = mindwn to maxdwn
         with frame b 10 down width 80:
**c1603* end   deleted code <<<<<<< */

         /* SET EXTERNAL LABELS */
         setFrameLabels(frame b:handle).

         wonbrs[dwn - mindwn + 1] = "".
         wolots[dwn - mindwn + 1] = "".

         /* DISPLAY DETAIL */
         if worecno[dwn - mindwn + 1] <> ?
         then do with frame b:

            for first wo_mstr
               where recid(wo_mstr) = worecno[dwn - mindwn + 1]
            no-lock:
            end. /* FOR FIRST wo_mstr */

            if available wo_mstr
            then do with frame b:

               /* CHECK AND SET THE APPROVAL FLAG FOR INDIVIDUAL WORK ORDER   */
               /* LINES WHEN DEFAULT APPROVAL FLAG (release_all) IS SET TO NO */
               /* BUT ONLY FOR THE FIRST ITERATION                            */

               if l_displayed = no
                  and release_all
               then do:

                  /* GET THE ITEM STATUS and CHECK IF IT HAS A RESTRICTED */
                  /* TRANSACTION 'ADD-PO'                                 */

                  for first pt_mstr
                      where pt_domain = global_domain
                       and  pt_part = wo_part
                  no-lock:

                     /* ADDED THIRD INPUT PARAMETER, TO INDICATE THAT  */
                     /* THE MESSAGE SHOULD NOT BE DISPLAYED            */
                     {us/px/pxrun.i &PROC='validateRestrictedStatus'
                              &PROGRAM='ppitxr.p'
                              &PARAM="(input pt_status,
                                       input 'ADD-PO',
                                       input no)"
                              &NOAPPERROR=True
                              &CATCHERROR=True}

                     if return-value <> {&SUCCESS-RESULT}
                     then do:
                        assign
                           approve[dwn - mindwn + 1] = no
                           l_approve_ctr             = l_approve_ctr + 1.

                        if using_grs
                        then
                           run grs_approve (input wo_nbr,
                                            input wo_lot).

                     end. /* IF return-value <> {&SUCCESS-RESULT} */

                  end. /* FOR FIRST pt_mstr */

               end. /* IF l_displayed = NO AND release_all */

/*Q9021*/      find first pt_mstr where pt_part = wo_part and
/*Q9021*/                               pt_domain = global_domain
/*Q9021*/                               no-lock no-error.

               /* DISPLAY GRS REQUISITION NBR IF APPROVE = YES */
               if using_grs /* debug >> and approve[dwn - mindwn + 1] */
               then do:
                  for first tt-rqm-mstr
                     where tt-rqm-mstr.tt-wo-nbr = wo_nbr
                     and   tt-rqm-mstr.tt-wo-lot = wo_lot
                  use-index ttnbrlot
                  no-lock:
                  end. /* FOR FIRST tt-rqm-mstr */
                  if available tt-rqm-mstr
                  then
/*c1603* start deleted code >>>>>>>>
                     display
                        dwn
                        tt-rqm-mstr.tt-nbr @ nbr
                        wo_part
                        wo_qty_ord
                        wo_rel_date label "Rel Date"
                        wo_due_date
                        approve[dwn - mindwn + 1] @ yn.
**c1603* end   deleted code <<<<<<< */

/*d2101* start added code >>>>   */
/*d3738* start added code >>> */
                     vPalletCount = wo_qty_ord / decimal(pt_size) no-error.
		     if error-status:error then vPalletCount = 0.
		     /*
		     else do:
                        if integer(pt_size) > 0 and
			wo_qty_ord modulo pt_size <> 0
			then vPalletCount = vPalletCount + 1.
		     end.
		     */
		     if vPalletCount = ? then vPalletCount = 0.
		     if approve[dwn - mindwn + 1] then
		     assign
		     vTotQty = vTotQty + wo_qty_ord
		     vTotPlC = vTotPlc + vPalletCount.

/*d3738* end added code   <<< */
                     display
                        dwn
                        wo_part format "x(11)" column-label "Item"
                        pt_desc1   format "x(24)" when available pt_mstr
                        wo_qty_ord format "->>>9.9<<<"
			           column-label "QtyOrd"
/*d3738* start deleted code >>>
                        wo_rel_date label "Rel Date"
*d3738*  end deleted code <<< */
/*d3738* start added code >>> */
                        vPalletCount format ">>9.99" column-label "PalCt"
/*d3738* end added code   <<< */
                        wo_due_date
                        approve[dwn - mindwn + 1] @ yn
			    column-label "OK".
/*d2101* end   added code <<<<<  */

               end.  /* if using_grs */

               wonbrs[dwn - mindwn + 1] = wo_nbr.
               wolots[dwn - mindwn + 1] = wo_lot.
            end.
         end.
/*d3738* start added code >>> */
         if dwn = maxdwn then do:
	    down with frame b.
            display "------------------  TOTAL " @ pt_desc1
              (vTotQtyRT + vTotQty) @ wo_qty_ord
	      (vTotPlcRT + vTotPlC) @ vPalletCount
	      "--------" @ wo_due_date
	      with frame b.
         end.
/*d3738* end added code   <<< */
      end.

      /* NOTIFY THE USER WHEN ANY OF THE ITEM IS NOT APPROVED (BECAUSE OF */
      /* 'ADD_PO' RESTRICTION) THOUGH THE DEFAULT APPROVAL IS SET TO YES  */

      if l_displayed        = no
         and release_all
         and l_approve_ctr <> 0
      then do:

         /* APPROVAL SET TO NO FOR ITEM(S) WITH RESTRICTED TRANSACTION #  */
         {us/bbi/pxmsg.i &MSGNUM    =5595
                  &ERRORLEVEL=2
                  &MSGARG1   =""ADD-PO""}

      end. /* IF l_displayed */

      /* l_displayed IS SET TO YES AS CHECKING/SETTING OF APPROVAL FLAG */
      /* BASED ON RESTRICTED TRANSACTION IS NO LONGER REQUIRED          */

      assign
         l_displayed = yes
         nbr         = "".

      do on error undo, leave:
         do on error undo, retry:

            dwn = mindwn - 1.
            clear frame d.
            set dwn with frame d width 80 
            editing:

               {us/mf/mfnarray.i dwn mindwn maxdwn}

               display dwn with frame d.

               if dwn >= mindwn and dwn <= maxdwn
                  and wonbrs[dwn - mindwn + 1] <> ""
               then do:
                  for first wo_mstr
                     where recid(wo_mstr) = worecno[dwn - mindwn + 1]
/*d3738a*                  no-lock */
/*d3738a*/            exclusive-lock
		  :
                  end. /* FOR FIRST wo_mstr */

                  if available wo_mstr
                  then do:
		  
/*Q9021*/            find first pt_mstr where pt_part = wo_part and
/*Q9021*/                                     pt_domain = global_domain
/*Q9021*/                                     no-lock no-error.

                     /* DISPLAY GRS REQUISITION NBR IF APPROVE = YES */
                     if using_grs /* debug* and approve[dwn - mindwn + 1] */
                     then do:
                        for first tt-rqm-mstr
                           where tt-rqm-mstr.tt-wo-nbr = wo_nbr
                           and   tt-rqm-mstr.tt-wo-lot = wo_lot
                        use-index ttnbrlot
                        no-lock:
                        end. /* FOR FIRST tt-rqm-mstr */
                        if available tt-rqm-mstr
                        then
                           display
                              dwn
                              tt-rqm-mstr.tt-nbr @ nbr
                              wo_part
/*d3738*                      wo_qty_ord */
/*d3738*/                     wo_qty_ord @ vdwoqty
/*d3738*/                     woqty[dwn - mindwn + 1] @ vdwoqty
                              wo_rel_date
                              wo_due_date
                              approve[dwn - mindwn + 1] @ yn
                           with frame d.
                     end.  /* if using_grs */
                  end. /* IF AVAILABLE(wo_mstr) ... */
                  else do:
                      /* PLANNED PURCHASE ORDER NUMBER DOES NOT EXIST. */
                      {us/bbi/pxmsg.i &MSGNUM=308 &ERRORLEVEL=3}
                      undo, retry.
                  end. /* ELSE - NOT AVAILABLE wo_mstr */

               end.
            end.

            if input dwn <> 0 and ((dwn < mindwn or dwn > maxdwn)
               or (dwn >= mindwn and dwn <= maxdwn
               and wonbrs[dwn - mindwn + 1] = ""))
            then do:
               /* MUST SELECT A NUMBER LISTED ABOVE. */
               {us/bbi/pxmsg.i &MSGNUM=18 &ERRORLEVEL=3}
               undo, retry.
            end.
         end.

         if dwn >= mindwn and dwn <= maxdwn
         then do:

            for first wo_mstr
               where recid(wo_mstr) = worecno[dwn - mindwn + 1]
            no-lock:
            end. /* FOR FIRST wo_mstr */

            if not available wo_mstr
            then do:
               /* PLANNED PURCHASE ORDER NUMBER DOES NOT EXIST. */
               {us/bbi/pxmsg.i &MSGNUM=308 &ERRORLEVEL=3}
               undo, retry.
            end.
            else do:

/*Q9021*/   find first pt_mstr where pt_part = wo_part and
/*Q9021*/                            pt_domain = global_domain
/*Q9021*/                            no-lock no-error.

               /* DISPLAY GRS REQUISITION NBR IF APPROVE = YES */
               if using_grs and approve[dwn - mindwn + 1]
               then do:
                  for first tt-rqm-mstr
                     where tt-rqm-mstr.tt-wo-nbr = wo_nbr
                     and   tt-rqm-mstr.tt-wo-lot = wo_lot
                  use-index ttnbrlot
                  no-lock:
                  end. /* FOR FIRST tt-rqm-mstr */
                  if available tt-rqm-mstr
                  then
                     display
                        dwn
                        tt-rqm-mstr.tt-nbr @ nbr
                        wo_part
/*d3738*                wo_qty_ord */
/*d3738*/               wo_qty_ord @ vdwoqty
/*d3738*/               woqty[dwn - mindwn + 1] @ vdwoqty
                        wo_rel_date
                        wo_due_date
                        approve[dwn - mindwn + 1] @ yn
                     with frame d.
               end.  /* if using_grs */

               setyn_loop:
               do on error undo, retry:

                  /* ONLY ALLOW ACCESS TO FLAG WHEN GRS INSTALLED */
/*d3738*/         vdwoqty = wo_qty_ord.
                  if using_grs
                  then do:
                     set 
/*d3738*/            vdwoqty
                     yn
                     with frame d.
                     nbr = wo_nbr.
                  end.  /* if using_grs */

                  /* STOP APPROVAL FOR THE ITEM WITH RESTRICTED    */
                  /* TRANSACTION OF 'ADD-PO'                       */
                  if yn
                  then do:

                     for first pt_mstr
                         where pt_domain = global_domain
                          and  pt_part = wo_part
                     no-lock:

                        /* ADDED THIRD INPUT PARAMETER, TO INDICATE THAT  */
                        /* THE MESSAGE SHOULD BE DISPLAYED                */
                        {us/px/pxrun.i &PROC='validateRestrictedStatus'
                                 &PROGRAM='ppitxr.p'
                                 &PARAM="(input pt_status,
                                          input 'ADD-PO',
                                          input yes)"
                                 &NOAPPERROR=True
                                 &CATCHERROR=True}

                        if return-value <> {&SUCCESS-RESULT}
                        then do:
                           next-prompt
                              yn
                           with frame d.

                           undo setyn_loop, retry setyn_loop.

                        end. /* IF return_value <> ... */

                     end. /* FOR FIRST pt_mstr */

                  end.  /* IF yn */

                  /* DISPLAY GRS REQUISITION NBR IF APPROVE = YES */
                  if using_grs
                  then do:

                     if approve[dwn - mindwn + 1] <> yn
                     then do:

                        find first tt-rqm-mstr
                           where tt-wo-nbr = wo_nbr
                           and   tt-wo-lot = wo_lot
                        use-index ttnbrlot
                        exclusive-lock.
                        if available tt-rqm-mstr
                        then
                           tt-rqm-mstr.tt-yn = yn.

                     end.
                  end.  /* if using_grs */

                  approve[dwn - mindwn + 1] = yn.

/*d3738* start added code >>> */
                  if yn then do:
		      woqty[dwn - mindwn + 1] = vdwoqty.
		      for first wo_mstr exclusive-lock
		      where recid(wo_mstr) = worecno[dwn - mindwn + 1]:
                          wo_qty_ord = vdwoqty.
		      end.
                  end.
/*d3738* end added code  <<< */

                  do i = mindwn to maxdwn:
                     if i <> dwn
                        and nbr = wonbrs[i - mindwn + 1]
                     then do:
                        /* REQUISITION NUMBER ALREADY EXISTS */
                        {us/bbi/pxmsg.i &MSGNUM=360 &ERRORLEVEL=2}
                     end.
                  end.

                  if wo_nbr <> nbr
                  then do:
                     if can-find(wo_mstr
                        where wo_domain = global_domain
                         and  wo_nbr = nbr
                         and  wo_lot = wolots[dwn - mindwn + 1])
                     then do:
                        /* Work Order already exists with that number */
                        {us/bbi/pxmsg.i &MSGNUM=505 &ERRORLEVEL=3}
                        undo, retry.
                     end.

                     dwn = 0.

                     do while wo_nbr <> nbr and dwn < 10:
                        dwn = dwn + 1.
                        if wo_nbr = wonbrs[dwn]
                        then do:
                           find wo_mstr
                              where recid(wo_mstr) = worecno[dwn]
                           exclusive-lock no-error.

                           wonbrs[dwn] = nbr.
			   /*c1603*/ wo_qty_ord = woqty[dwn].

                           for each wod_det
                              where wod_domain = global_domain
                              and   wod_lot = wo_lot
                           exclusive-lock:

                           /* ADDED LINE TO CHECK OPERATION OF THE COMPONENTS */

                              find first mrp_det exclusive-lock
                                 where mrp_domain  = global_domain
                                 and   mrp_dataset = "wod_det"
                                 and   mrp_part    = wod_part
                                 and   mrp_nbr     = wod_nbr
                                 and   mrp_line    = wod_lot
                                 and   mrp_line2   = string(wod_op)
                              no-error.
                              if available mrp_det
                              then
                                 mrp_nbr = nbr.

                              wod_nbr = nbr.
                           end.

                           find mrp_det exclusive-lock
                              where mrp_domain = global_domain
                              and   mrp_dataset = "wo_mstr"
                              and   mrp_part = wo_part
                              and   mrp_nbr = wo_nbr
                              and   mrp_line = wo_lot
                           no-error.
                           if available mrp_det
                           then
                              mrp_nbr = nbr.

                           wo_nbr = nbr.
                        end.
                     end.
                  end.
               end.
            end.
         end.
         else do:
            repeat:
               yn = no.
               /* IS ALL INFO CORRECT? */
               {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=yn}
               if yn = ?
               then undo mainloop, leave mainloop.
               leave.
            end.

            if yn
            then do on error undo, retry:
               do dwn = 1 to 10:

                  if worecno[dwn] <> ? and approve[dwn]
                  then do:

                     find wo_mstr exclusive-lock
                        where recid(wo_mstr) = worecno[dwn] no-error.
                     if available wo_mstr
                     then do:

                        for each wod_det
                           where wod_domain = global_domain
                           and   wod_lot = wo_lot
                        exclusive-lock:

                           find first mrp_det exclusive-lock
                              where mrp_domain  = global_domain
                              and   mrp_dataset = "wod_det"
                              and   mrp_part    = wod_part
                              and   mrp_nbr     = wod_nbr
                              and   mrp_line    = wod_lot
                              and   mrp_line2   = string(wod_op)
                           no-error.
                           if available mrp_det
                           then
                              delete mrp_det.

                           /* UPDATE PART MASTER MRP FLAG */
                           {us/in/inmrp.i &part=wod_part &site=wod_site}

                           delete wod_det.
                        end.

                        for each wr_route
                           where wr_domain = global_domain
                           and   wr_lot = wo_lot
                        exclusive-lock:
                           delete wr_route.
                        end.

                        find mrp_det exclusive-lock
                           where mrp_domain = global_domain
                           and   mrp_dataset = "wo_mstr"
                           and   mrp_part = wo_part
                           and   mrp_nbr = wo_nbr
                           and   mrp_line = wo_lot no-error.
                        if available mrp_det
                        then
                           delete mrp_det.

                        find mrp_det exclusive-lock
                           where mrp_domain = global_domain
                           and   mrp_dataset = "wo_scrap"
                           and   mrp_part = wo_part
                           and   mrp_nbr = wo_nbr
                           and   mrp_line = wo_lot no-error.
                        if available mrp_det
                        then
                           delete mrp_det.

                        line = 0.

                        if using_grs
                        then do:
                           /* CREATE rqm_mstr & rqd_det */
                           /* WHEN GRS IS INSTALLED */

                           for first tt-rqm-mstr
                              where tt-rqm-mstr.tt-wo-nbr = wo_nbr
                              and   tt-rqm-mstr.tt-wo-lot = wo_lot
                              and   tt-rqm-mstr.tt-yn
                              use-index ttnbrlot
                           no-lock:

                              grs_req_nbr = tt-rqm-mstr.tt-nbr.

                              for first rqm_mstr
                                 where rqm_domain = global_domain
                                 and   rqm_nbr    = tt-rqm-mstr.tt-nbr
                                 and   rqm_vend   = tt-rqm-mstr.tt-vend
                              no-lock:
                              end. /* FOR FIRST rqm_mstr */
                              if not available rqm_mstr
                              then
                                 grs_approval_cntr = 0.

                              /* ADD +1 TO THE COUNTER */
                              /* OF RECORDS SELECTED   */
                              grs_approval_cntr =
                                    grs_approval_cntr + 1.

/*d3738* start added code >>> */
			      vDueDateP = if vDueDate = ? then wo_due_date
			                   else vDueDate.
/*d3738* end added code   <<< */

/*c1603* start deleted code >>>>>>>>
                              {us/gp/gprunmo.i
                               &program="mrprapa2.p"
                               &module="GRS"
                               &param="""(input grs_approval_cntr,
                                          input grs_req_nbr,
                                          input wo_part,
                                          input wo_site,
                                          input wo_qty_ord,
                                          input wo_rel_date,
                                          input wo_due_date,
                                          input remarks_text,
                                          output grs_return_code)"""}
**c1603* end   deleted code <<<<<<< */
/*k10017a* start deleted code >>>>
/*d3738* start added code >>> */
                              {us/gp/gprunmo.i
                               &program="mrprapa2.p"
                               &module="GRS"
                               &param="""(input grs_approval_cntr,
                                          input grs_req_nbr,
                                          input wo_part,
                                          input wo_site,
                                          input woqty[dwn],
                                          input wo_rel_date,
                                          input vDueDateP,
                                          input remarks_text,
                                          output grs_return_code)"""}
/*d3738* end added code  <<<< */
*k10017a* end deleted code  <<<<<<< */

/*k10017a* start added code >>>>>> */
                              {us/gp/gprunmo.i
                               &program="xxprapa2.p"
                               &module="GRS"
                               &param="""(input grs_approval_cntr,
                                          input grs_req_nbr,
                                          input wo_part,
                                          input wo_site,
                                          input woqty[dwn],
                                          input wo_rel_date,
                                          input vDueDateP,
                                          input remarks_text,
                                          output grs_return_code)"""}
/*k10017a* end added code <<<< */

                              if grs_return_code <> 0
                              then do:
                                 hide frame d.
                                 undo, leave.
                              end. /* if grs_return_code <> 0 */
                           end. /* FOR FIRST tt-rqm-mstr */
                        end.  /* if using_grs */

                        delete wo_mstr.
                     end.
                  end.
               end.

               flag = 1.
               leave.
            end.
         end.
      end.
   end.

   if flag = 0
   then do:
      worecno[1] = ?.
      hide frame d.
      undo, leave.
   end.

   hide frame d.

end.

/*c1603* start added code >>>>>> */
vTotQtyRT = vTotQtyRT + vTotQty.
vTotPLCRT = vTotPLCRT + vTotPLC.
/*c1603* end   added code <<<<<< */
hide frame b.


/* PROCEDURE TO SET THE APPROVAL FLAG OF tt-rqm-mstr, WHEN USING GRS */

PROCEDURE grs_approve:

   define input parameter p_nbr     as character no-undo.
   define input parameter p_lot     as character no-undo.

   for first tt-rqm-mstr
      where tt-rqm-mstr.tt-wo-nbr = p_nbr
      and   tt-rqm-mstr.tt-wo-lot = p_lot
      use-index ttnbrlot
   exclusive-lock:

      tt-rqm-mstr.tt-yn = no.

   end. /* FOR FIRST tt-rqm-mstr */

END PROCEDURE. /* PROCEDURE grs_approve */
