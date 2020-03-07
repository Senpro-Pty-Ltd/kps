/* xxwoapa.p - APPROVE PLANNED WORK ORDERS 1st subroutine                     */
/* mrwoapa.p - APPROVE PLANNED WORK ORDERS 1st subroutine                     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxwoapa.p,v 1.2 2018/03/13 17:10:02 gbg Exp $: */
/* REVISION: 1.0      LAST EDIT: 06/26/86   MODIFIED BY: EMB                  */
/* REVISION: 1.0      LAST EDIT: 10/24/86   MODIFIED BY: EMB *37*             */
/* REVISION: 1.0      LAST EDIT: 03/06/87   MODIFIED BY: EMB *A39*            */
/* REVISION: 2.1      LAST EDIT: 09/17/87   MODIFIED BY: WUG *A94*            */
/* REVISION: 2.1      LAST EDIT: 12/23/87   MODIFIED BY: emb                  */
/* REVISION: 4.0      LAST EDIT: 02/05/88   MODIFIED BY: emb *A173*           */
/* REVISION: 4.0      LAST EDIT: 09/06/88   MODIFIED BY: emb *A420*           */
/* REVISION: 4.0      LAST EDIT: 05/30/89   MODIFIED BY: emb *A740*           */
/* REVISION: 6.0      LAST EDIT: 12/17/91   MODIFIED BY: emb *D966*           */
/* REVISION: 7.3      LAST EDIT: 01/06/93   MODIFIED BY: emb *G508*           */
/* REVISION: 7.3      LAST EDIT: 09/12/94   MODIFIED BY: rwl *GM39*           */
/* REVISION: 7.3      LAST EDIT: 09/20/94   MODIFIED BY: jpm *GM74*           */
/* REVISION: 7.5      LAST EDIT: 11/09/94   MODIFIED BY: tjs *J027*           */
/* REVISION: 7.3      LAST EDIT: 11/09/94   MODIFIED BY: srk *GO05*           */
/* REVISION: 8.5      LAST MODIFIED: 10/16/96   BY: *J164* Murli Shastri      */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 11/06/98   BY: *J33S* Sandesh Mahagaokar */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/18/99   BY: *K23S* John Corda         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 07/20/00   BY: *N0GF* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KR* myb                */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.16     BY: Vandna Rohira         DATE: 01/21/03 ECO: *N24S*    */
/* Revision: 1.18     BY: Paul Donnelly (SB)    DATE: 06/28/03 ECO: *Q00J*    */
/* Revision: 1.21     BY: Kirti Desai           DATE: 10/31/05 ECO: *P46X*    */
/* Revision: 1.22     BY: Ambrose Almeida       DATE: 06/13/07 ECO: *P5Z1*    */
/* Revision: 1.23     BY: Katie Hilbert         DATE: 05/02/08 ECO: *R0S9*    */
/* $Revision: 1.2 $     BY: Ruma Bibra            DATE: 05/14/08 ECO: *P6SZ*    */
/* CYB                    BY: nac                DATE: 26 May 10 ECO: *Q9021* */
/* CYB                    BY: nac             DATE: 26 May 10 ECO: *CY1008* */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 16-FEB-2013 BY: gbg *c1364*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* INCLUDE FILE SHARED VARIABLES */
{us/bbi/mfdeclre.i}

/* EXTERNAL LABEL INCLUDE */
{us/bbi/gplabel.i}

/* STANDARD MAINTENANCE COMPONENT INCLUDE FILE */
{us/px/pxmaint.i}

/* SHARED VARIABLE DEFINITIONS */
define new shared variable wo_recno     as recid.
define new shared variable prev_status  like wo_status.
define new shared variable prev_due     like wo_due_date.
define new shared variable prev_qty     like wo_qty_ord.
define new shared variable del-joint    like mfc_logical.
define new shared variable undo_all     like mfc_logical no-undo.
define new shared variable leadtime     like pt_mfg_lead.
define new shared variable joint_type   like wo_joint_type.
define new shared variable comp         like ps_comp.
define new shared variable qty          like wo_qty_ord decimals 10.
define new shared variable prev_release like wo_rel_date.
define new shared variable any_issued   like mfc_logical.
define new shared variable any_feedbk   like mfc_logical.
define new shared variable prev_site    like wo_site.
define new shared variable err_msg      as integer.
define new shared variable no_msg       like mfc_logical initial no.

define shared variable release_all      like mfc_logical.
define shared variable worecno          as recid extent 10 no-undo.
define shared variable numlines         as integer initial 10.
define shared variable mindwn           as integer.
define shared variable maxdwn           as integer.

/* LOCAL VARIABLE DEFINITIONS */
define variable nbr           like wo_nbr.
define variable dwn           like pod_line.
define variable wonbrs        as character     extent 10.
define variable wolots        as character     extent 10.
define variable yn            like mfc_logical column-label "OK" no-undo.
define variable flag          as integer       initial 0         no-undo.
define variable wocnbr        like nbr.
define variable qt            like wo_qty_ord.
define variable approve       like mfc_logical extent 10.
define variable l_approve_ctr as   integer                       no-undo.
define variable l_displayed   like mfc_logical                   no-undo.

/* BUFFER DEFINITION */
define buffer wo_mstr1 for wo_mstr.

form
with frame b 10 down width 80.
/* SET EXTERNAL LABELS */
/*q9021* start deleted code  >>>>>>>>>>>>>>>>
setFrameLabels(frame b:handle).
*q9021* end   deleted code  <<<<<<<<<<<<<<< */

/* FOR BOOLEAN VALUE IN DOWN FRAME,    */
/* ENSURE TRANSLATION TO USER LANGUAGE */
{us/gp/gpfrmdis.i &fname = "b"}

form
with frame d width 80.
/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

assign
   l_approve_ctr = 0
   l_displayed   = no
   approve       = release_all.

do transaction on error undo, retry:
   mainloop:
   repeat:
      clear frame b all.
      do dwn = mindwn to maxdwn
         with frame b 10 down width 80:

         assign
            wonbrs[dwn - mindwn + 1] = ""
            wolots[dwn - mindwn + 1] = "".

         /* DISPLAY DETAIL */
         if worecno[dwn - mindwn + 1] <> ?
         then
            do with frame b 10 down width 80:
               for first wo_mstr
                  fields( wo_domain wo_joint_type wo_lot wo_nbr wo_part
                          wo_qty_ord wo_rel_date wo_status)
                  where recid(wo_mstr) = worecno[dwn - mindwn + 1] no-lock:
               end. /* FOR FIRST wo_mstr */
               if available wo_mstr
               then do:

                  /* CHECK AND SET THE APPROVAL FLAG FOR INDIVIDUAL WORK */
                  /* ORDER LINES WHEN DEFAULT APPROVAL FLAG (release_all)*/
                  /* IS SET TO YES                                       */

                  if l_displayed = no
                     and release_all
                  then do:

                     /* GET THE ITEM STATUS and CHECK IF IT HAS A RESTRICTED */
                     /* TRANSACTION 'ADD-WO'                                 */

                     for first pt_mstr
                        fields( pt_domain pt_part pt_status)
                        where pt_mstr.pt_domain = global_domain
                         and  pt_part = wo_part
                     no-lock:

                        {us/px/pxrun.i &PROC='validateRestrictedStatus'
                           &PROGRAM='ppitxr.p'
                           &PARAM="(input pt_status,
                                   input 'ADD-WO',
                                   input no)"
                           &NOAPPERROR=true
                           &CATCHERROR=true}

                        if return-value <> {&SUCCESS-RESULT}
                        then
                           assign
                              approve[dwn - mindwn + 1] = no
                              l_approve_ctr             = l_approve_ctr + 1.

                     end. /* FOR FIRST pt_mstr */

                  end. /* IF l_displayed = NO AND release_all */

/*Q9021*/         find first pt_mstr where pt_part = wo_part and
/*Q9021*/                                  pt_domain = global_domain
/*Q9021*/                                  no-lock no-error.


/*d2101* start added code >>>>   */
                  display
                     dwn
                     wo_nbr @ nbr format "x(16)"
                     wo_part format "x(8)" column-label "Item"
                     pt_desc1 when available pt_mstr format "x(24)"
                     wo_qty_ord @ qt format "->,>>9.99<<<" 
		                     column-label "QtyOrd"
                     wo_rel_date
                     approve[dwn - mindwn + 1] @ yn.
                  down with frame b.
/*d2101* end   added code <<<<<  */
/*d2101* start deleted code  >>>>>>>>>>>>>>>>
                  display
                     dwn
                     wo_nbr @ nbr
                     wo_lot
                     wo_part
                     wo_qty_ord @ qt
                     wo_rel_date
                     approve[dwn - mindwn + 1] @ yn.
                  down with frame b.
*d2101* end   deleted code  <<<<<<<<<<<<<<< */

                  assign
                     wonbrs[dwn - mindwn + 1] = wo_nbr
                     wolots[dwn - mindwn + 1] = wo_lot.
               end. /* IF AVAILABLE wo_mstr */
            end. /* DO WITH FRAME b 10 DOWN WIDTH 80 */
      end. /* DO dwn = mindwn TO maxdwn */

      /* NOTIFY THE USER WHEN ANY OF THE ITEM IS NOT APPROVED (BECAUSE OF */
      /* 'ADD_WO' RESTRICTION) THOUGH THE DEFAULT APPROVAL IS SET TO YES  */

      if l_displayed        = no
         and release_all
         and l_approve_ctr <> 0
      then do:

         /* APPROVAL SET TO NO FOR ITEM(S) WITH RESTRICTED TRANSACTION #  */
         {us/bbi/pxmsg.i &MSGNUM =5595 &ERRORLEVEL=2 &MSGARG1   =""ADD-WO""}

      end. /* IF l_displayed */

      /* l_displayed IS SET TO YES AS CHECKING/SETTING OF APPROVAL FLAG */
      /* BASED ON RESTRICTED TRANSACTION IS NO LONGER REQUIRED          */

      assign
         l_displayed = yes
         nbr         = "".

      do on error undo, leave:
         do on error undo, retry:
            dwn = mindwn - 1.
            clear frame d all.
            set dwn with frame d width 80
            editing:
               {us/mf/mfnarray.i dwn mindwn maxdwn}

               display dwn with frame d.

               if dwn >= mindwn and dwn <= maxdwn
                  and wonbrs[dwn - mindwn + 1] <> ""
               then do:
                  for first wo_mstr
                     fields( wo_domain wo_joint_type wo_lot wo_nbr wo_part
                             wo_qty_ord wo_rel_date wo_status)
                     where recid(wo_mstr) = worecno[dwn - mindwn + 1]
                  no-lock:
                  end. /* FOR FIRST wo_mstr */

/*Q9021*/         find first pt_mstr where pt_part = wo_part and
/*Q9021*/                                  pt_domain = global_domain
/*Q9021*/                                  no-lock no-error.

                  display
                     dwn
                     wo_nbr @ nbr
                     wo_lot
                     wo_part
/* /*c1364*/            pt_desc1 when available pt_mstr format "x(24)" */
                     wo_qty_ord @ qt
                     wo_rel_date

                     approve[dwn - mindwn + 1] @ yn
                  with frame d.
               end. /* IF dwn >= mindwn AND dwn <= maxdwn */
            end. /* SET dwn WITH FRAME d WIDTH 80 EDITING */

            if input  dwn <> 0
               and ((dwn  < mindwn  or
                     dwn  > maxdwn) or
                    (input dwn                <> 0 and
                     wonbrs[dwn - mindwn + 1] = ""))
            then do:
               /* MUST SELECT A NUMBER LISTED ABOVE */
               {us/bbi/pxmsg.i &MSGNUM=18 &ERRORLEVEL=3}
               undo, retry.
            end. /* IF INPUT  dwn <> 0 */

            if input dwn <> 0
            then
               if wonbrs[dwn - mindwn + 1] = ""
               then
                  undo, retry.
         end. /* DO ON ERROR UNDO, RETRY */

         if dwn    >= mindwn
           and dwn <= maxdwn
         then do:

            for first wo_mstr
               fields( wo_domain wo_joint_type wo_lot wo_nbr wo_part
                       wo_qty_ord wo_rel_date wo_status)
               where recid(wo_mstr) = worecno[dwn - mindwn + 1]
            no-lock:
            end. /* FOR FIRST wo_mstr */
            if not available wo_mstr
            then do:
               /*  WORK ORDER NUMBER DOES NOT EXIST */
               {us/bbi/pxmsg.i &MSGNUM=503 &ERRORLEVEL=3}
               undo, retry.
            end. /* IF NOT AVAILABLE wo_mstr */
            else do:

/*Q9021*/      find first pt_mstr where pt_part = wo_part and
/*Q9021*/                               pt_domain = global_domain
/*Q9021*/                               no-lock no-error.

               display
                  dwn
                  wo_nbr @ nbr
                  wo_lot
                  wo_part
/* /*c1364*/            pt_desc1 when available pt_mstr format "x(24)" */
                  wo_qty_ord @ qt
                  wo_rel_date
                  approve[dwn - mindwn + 1] @ yn
               with frame d.

               setyn_loop:
               do on error undo, retry:
                  set
                     nbr
                     yn
                  with frame d.

                  /* TO STOP APPROVAL FOR THE ITEM WITH RESTRICTED */
                  /* TRANSACTION OF 'ADD-WO'                       */
                  if yn
                  then do:

                     for first pt_mstr
                        fields( pt_domain pt_part pt_status)
                        where pt_mstr.pt_domain = global_domain
                         and  pt_part = wo_part
                     no-lock:

                        {us/px/pxrun.i &PROC='validateRestrictedStatus'
                           &PROGRAM='ppitxr.p'
                           &PARAM="(input pt_status,
                                    input 'ADD-WO',
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

                  approve[dwn - mindwn + 1] = yn.

                  /* CHANGE WORK ORDER NUMBER, CHECK FOR JOINT ORDER */
                  if wo_nbr <> nbr
                  then do for wo_mstr1:
                     for first wo_mstr1
                        fields( wo_domain wo_joint_type wo_lot wo_nbr wo_part
                                wo_qty_ord wo_rel_date wo_status)
                        where wo_mstr1.wo_domain = global_domain
                         and (wo_mstr1.wo_nbr = nbr
                         and (wo_mstr1.wo_joint_type <> "" or
                              wo_mstr.wo_joint_type <> "") )
                     no-lock:
                     end. /* FOR FIRST wo_mstr1 */
                     if available wo_mstr1 then do:
                        /* ORDER CANNOT BE ADDED TO A SET OF JOINT ORDERS */
                        {us/bbi/pxmsg.i &MSGNUM=6540 &ERRORLEVEL=3}
                        undo, retry.
                     end. /* IF AVAILABLE wo_mstr1 */
                  end. /* DO FOR wo_mstr1 */

                  /* CHANGE WORK ORDER NUMBER */
                  if wo_nbr <> nbr
                  then do:

                     if nbr = ""
                     then do:
                        {us/mf/mfnctrla.i "woc_ctrl.woc_domain = global_domain"
                        "woc_ctrl.woc_domain" "wo_mstr.wo_domain =
                        global_domain" woc_ctrl woc_nbr wo_mstr wo_nbr nbr}
                        wocnbr = nbr.
                     end. /* IF nbr = "" */

                     if nbr = ""
                     then do:
                        /* BLANK NOT ALLOWED */
                        {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3}
                        undo, retry.
                     end. /* IF nbr = "" */
                     if can-find(first wo_mstr where wo_mstr.wo_domain =
                        global_domain and  wo_nbr = nbr)
                     then do:
                        /* WORK ORDER ALREADY EXISTS WITH THAT NUMBER */
                        {us/bbi/pxmsg.i &MSGNUM=505 &ERRORLEVEL=2}
                     end. /* IF CAN-FIND(FIRST wo_mstr ... */

                     dwn = 0.
                     do while wo_nbr <> nbr
                        and dwn < 10:

                        dwn = dwn + 1.
                        if wo_lot = wolots[dwn]
                        then do:
                           wonbrs[dwn] = nbr.
                           find wo_mstr
                              where recid(wo_mstr) = worecno[dwn]
                           exclusive-lock no-error.

                           /* UPDATES FOR JOINT PRODUCT WOs IN THE SET */
                           if wo_joint_type <> ""
                           then do:

                              do for wo_mstr1:
                                 for each wo_mstr1
                                    where wo_mstr1.wo_domain = global_domain
                                    and   wo_mstr1.wo_nbr =  wo_mstr.wo_nbr
                                    and   wo_mstr1.wo_lot <> wo_mstr.wo_lot
                                    exclusive-lock:

                                    find mrp_det
                                       where mrp_det.mrp_domain = global_domain
                                        and  mrp_dataset = "wo_mstr"
                                        and  mrp_part   = wo_mstr1.wo_part
                                        and  mrp_nbr    = wo_mstr1.wo_nbr
                                        and  mrp_line   = wo_mstr1.wo_lot
                                    exclusive-lock no-error.
                                    if available mrp_det
                                    then
                                       mrp_nbr = nbr.

                                    find mrp_det
                                       where mrp_det.mrp_domain = global_domain
                                       and   mrp_dataset = "wo_scrap"
                                       and   mrp_part    = wo_mstr1.wo_part
                                       and   mrp_nbr     = wo_mstr1.wo_nbr
                                       and   mrp_line    = wo_mstr1.wo_lot
                                    exclusive-lock no-error.
                                    if available mrp_det
                                    then
                                       mrp_nbr = nbr.

                                    if wo_mstr1.wo_joint_type = "5"
                                    then do:
                                       find mrp_det
                                          where mrp_det.mrp_domain = global_domain
                                          and   mrp_dataset = "jp_det"
                                          and   mrp_part    = wo_mstr1.wo_part
                                          and   mrp_nbr     = wo_mstr1.wo_nbr
                                          and   mrp_line    = wo_mstr1.wo_lot
                                          exclusive-lock no-error.
                                       if available mrp_det
                                       then
                                          mrp_nbr = nbr.

                                       for each wod_det
                                          where wod_det.wod_domain = global_domain
                                           and  wod_lot = wo_mstr1.wo_lot
                                       exclusive-lock:

                                          /* ADDED LINE TO CHECK OPERATION */
                                          /* OF THE COMPONENTS             */

                                          find first mrp_det
                                             where mrp_det.mrp_domain = global_domain
                                             and   mrp_dataset = "wod_det"
                                             and   mrp_part    = wod_part
                                             and   mrp_nbr     = wod_nbr
                                             and   mrp_line    = wod_lot
                                             and   mrp_line2   = string(wod_op)
                                          exclusive-lock no-error.
                                          if available mrp_det
                                          then
                                             mrp_nbr = nbr.
                                          wod_nbr = nbr.
                                       end. /* FOR EACH wod_det */

                                       for each wr_route
                                          where wr_route.wr_domain = global_domain
                                           and  wr_lot = wo_lot
                                       exclusive-lock:
                                          wr_nbr = nbr.
                                       end. /* FOR EACH wr_route */
                                    end. /* IF wo_mstr1.wo_joint_type = "5" */

                                   wo_mstr1.wo_nbr = nbr.
                                 end. /* FOR EACH wo_mstr1 */
                              end. /* DO FOR wo_mstr1 */

                              if wo_joint_type = "5"
                              then do:
                                 find mrp_det
                                    where mrp_det.mrp_domain = global_domain
                                    and   mrp_dataset = "jp_det"
                                    and   mrp_part    = wo_part
                                    and   mrp_nbr     = wo_nbr
                                    and   mrp_line    = wo_lot
                                 exclusive-lock no-error.
                                 if available mrp_det
                                 then
                                    mrp_nbr = nbr.
                              end. /* IF wo_joint_type = "5" */

                           end. /* IF wo_joint_type <> "" */
                           if index("1234",wo_joint_type) = 0
                           then do:
                              for each wod_det
                                 exclusive-lock
                                 where wod_det.wod_domain = global_domain
                                 and   wod_lot = wo_lot:

                                 find first mrp_det
                                    where mrp_det.mrp_domain = global_domain
                                    and   mrp_dataset = "wod_det"
                                    and   mrp_part    = wod_part
                                    and   mrp_nbr     = wod_nbr
                                    and   mrp_line    = wod_lot
                                    and   mrp_line2   = string(wod_op)
                                 exclusive-lock no-error.
                                 if available mrp_det
                                 then
                                    mrp_nbr = nbr.
                                 wod_nbr = nbr.
                              end. /* FOR EACH wod_det*/

                              for each wr_route
                                 exclusive-lock
                                 where wr_route.wr_domain = global_domain
                                 and wr_lot = wo_lot:
                                 wr_nbr = nbr.
                              end. /* FOR EACH wr_route */
                           end. /* IF INDEX("1234",wo_joint_type) = 0 */

                           find mrp_det
                              where mrp_det.mrp_domain = global_domain
                              and   mrp_dataset = "wo_mstr"
                              and   mrp_part    = wo_part
                              and   mrp_nbr     = wo_nbr
                              and   mrp_line    = wo_lot
                           exclusive-lock no-error.
                           if available mrp_det
                           then
                              mrp_nbr = nbr.

                           find mrp_det
                              where mrp_det.mrp_domain = global_domain
                              and   mrp_dataset = "wo_scrap"
                              and   mrp_part    = wo_part
                              and   mrp_nbr     = wo_nbr
                              and   mrp_line    = wo_lot
                           exclusive-lock no-error.
                           if available mrp_det
                           then
                              mrp_nbr = nbr.

                           wo_nbr = nbr.

                        end. /* IF wo_lot = wolots[dwn] */
                     end. /* DO WHILE wo_nbr <> nbr */
                  end. /* IF wo_nbr <> nbr */
               end.  /* DO ON ERROR UNDO, RETRY */
            end. /* IF AVAILABLE wo_mstr */
         end. /* IF dwn >= mindwn AND dwn <= maxdwn */
         else do:
            repeat:
               yn = no.
               /* IS ALL INFO CORRECT? */
               {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=yn}
               leave.
            end. /* REPEAT */

            if yn
            then do:
               do dwn = 1 to 10:
                  if worecno[dwn] <> ?
                     and approve[dwn]
                  then do:
                     find wo_mstr exclusive-lock
                        where recid(wo_mstr) = worecno[dwn] no-error.
                     if available wo_mstr
                     then do:

                        wo_status = "F".
                        find mrp_det
                           where mrp_det.mrp_domain = global_domain
                            and  mrp_dataset = "wo_mstr"
                            and  mrp_part   = wo_part
                            and  mrp_nbr    = wo_nbr
                            and  mrp_line   = wo_lot
                        exclusive-lock no-error.
                        if available mrp_det
                        then
                           assign
                              mrp_detail =
                              caps(getTermLabel("FIRM_PLANNED_ORDER",24))
                           mrp_type   = "SUPPLYF".

                        /* UPDATES FOR JOINT PRODUCT WOs IN THE SET */
                        if wo_joint_type <> ""
                        then do:
                           do for wo_mstr1:
                              for each wo_mstr1
                                 where wo_mstr1.wo_domain = global_domain
                                 and   wo_mstr1.wo_nbr =  wo_mstr.wo_nbr
                                 and   wo_mstr1.wo_lot <> wo_mstr.wo_lot
                              exclusive-lock:

                                 wo_mstr1.wo_status = "F".

                                 find mrp_det
                                    where mrp_det.mrp_domain = global_domain
                                    and   mrp_dataset = "wo_mstr"
                                    and   mrp_part    = wo_mstr1.wo_part
                                    and   mrp_nbr     = wo_mstr1.wo_nbr
                                    and   mrp_line    = wo_mstr1.wo_lot
                                 exclusive-lock no-error.
                                 if available mrp_det
                                 then
                                    assign
                                       mrp_detail =
                                    caps(getTermLabel("FIRM_PLANNED_ORDER",24))
                                       mrp_type   = "SUPPLYF".
                              end. /* FOR EACH wo_mstr1 */
                           end. /* DO FOR wo_mstr1 */
                        end. /* IF wo_joint_type <> "" */
                     end. /* IF AVAILABLE wo_mstr */
                  end. /* IF worecno[dwn] <> ? */
               end. /* DO dwn = 1 to 10 */
               flag = 1.
               leave.
            end. /* IF yn */
         end. /* IF NOT(dwn >= mindwn AND dwn <= maxdwn) */
      end. /* DO ON ERROR UNDO, LEAVE: */
   end. /* MAINLOOP */

   if flag = 0
   then do:
      worecno[1] = ?.
      hide frame d.
      undo, leave.
   end. /* IF FLAG = 0 */

   if wocnbr > ""
   then do:
      {us/mf/mfnctrlb.i "woc_ctrl.woc_domain = global_domain" "woc_ctrl.woc_domain"
      "wo_mstr.wo_domain = global_domain" woc_ctrl woc_nbr wo_mstr wo_nbr
      wocnbr}
   end. /* IF wocnbr > "" */

   hide frame d.

end. /* DO TRANSACTION ON ERROR UNDO, RETRY */
hide frame b.
