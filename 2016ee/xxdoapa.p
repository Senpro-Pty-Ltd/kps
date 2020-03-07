/* xxdoapa.p - PLANNED DISTRIBUTION ORDERS APPROVAL                     */
/* drdoapa.p - PLANNED DISTRIBUTION ORDERS APPROVAL                     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdoapa.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/* $Revision: 1.2 $                                                    */
/*V8:ConvertMode=Maintenance                                            */
/* REVISION: 7.0      LAST EDIT: 03/06/92   MODIFIED BY: emb *F225*     */
/* REVISION: 7.3      LAST EDIT: 01/06/93   MODIFIED BY: emb *G508*     */
/* REVISION: 7.3      LAST EDIT: 07/07/93   MODIFIED BY: qzl *GD15*     */
/* REVISION: 7.3      LAST EDIT: 09/11/94   MODIFIED BY: rwl *GM26*     */
/* REVISION: 7.3      LAST EDIT: 11/07/94   MODIFIED BY: ljm *GO15*     */
/* REVISION: 7.3      LAST EDIT: 04/13/95   MODIFIED BY: jpm *G0KR*     */
/* REVISION: 8.5     LAST MODIFIED: 10/16/96    BY: *J164* Murli Shastri */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan    */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan    */
/* REVISION: 9.0      LAST MODIFIED: 11/06/98   BY: *J33S* Sandesh Mahagaokar */
/* REVISION: 9.0      LAST MODIFIED: 11/25/98   BY: *J35G* Mugdha Tambe       */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 07/12/00   BY: *N0FJ* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00   BY: *N0KK* jyn                */
/* Revision: 1.20  BY: Paul Donnelly (SB) DATE: 06/26/03 ECO: *Q00B*          */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.22       BY: Reena Ambavi          DATE: 09/16/04  ECO: *Q0CR* */
/* Revision: 1.23       BY: Jean Miller           DATE: 03/05/08  ECO: *R0P4* */
/* $Revision: 1.2 $      BY: Robert Jensen         DATE: 07/15/08  ECO: *R0X6* */
/* CYB                    BY: nac                DATE: 25 May 10 ECO: *Q9021* */
/* CYB                    BY: nac             DATE: 26 May 10 ECO: *cy1010* */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/*-Revision end---------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

define shared variable release_all like mfc_logical.
define shared variable dsrrecno as recid extent 10 no-undo.
define shared variable numlines as integer initial 10.
define variable nbr like dsr_req_nbr.
define variable dwn like pod_line.
define shared variable mindwn as integer.
define shared variable maxdwn as integer.
define variable dsrnbrs as character extent 10.
define variable dsrsites as character extent 10.
define variable yn like mfc_logical column-label "OK".
define variable flag as integer initial 0 no-undo.
define variable dsrcnbr like dsr_req_nbr.
define variable qty like dsr_qty_req.
define variable approve like mfc_logical extent 10.
define variable l_db as character no-undo.
define variable l_err_flag as integer no-undo.

approve = release_all.
do transaction on error undo, retry:

   repeat:

      do dwn = mindwn to maxdwn with frame b 10 down width 80:

/*q90218 start added code */
         form
            dwn
            dsr_site
            dsr_part format "x(10)" column-label "Item"
            pt_desc1  format "x(24)" label "Description"
            qty format "->,>>9.9<<<<" column-label "Qty"
            dsr_due_date
            yn
         with frame b 10 down width 80 attr-space.
/*q90218 end   added code */
/*q9021* start deleted code >>>>>
         form
            dwn
            nbr
            dsr_site
            dsr_part
            qty
            dsr_due_date
            yn
         with frame b 10 down width 80 attr-space.
*q9021* end deleted code <<<<<<<<< */

         /* SET EXTERNAL LABELS */
/*q9021*         setFrameLabels(frame b:handle). */

         dsrnbrs[dwn - mindwn + 1] = "".
         dsrsites[dwn - mindwn + 1] = "".

         /* DISPLAY DETAIL */
         if dsrrecno[dwn - mindwn + 1] <> ? then
         do with frame b 10 down width 80:
            for first dsr_mstr where recid(dsr_mstr) = dsrrecno[dwn - mindwn + 1]
            no-lock:
            end.
            if available(dsr_mstr) then do:
/*Q9021*/      find first pt_mstr where pt_part = dsr_part and 
/*Q9021*/                               pt_domain =  global_domain
/*Q9021*/                               no-lock no-error.
/*Q9021* start added code */
               display
                  dwn 
                  dsr_site dsr_part 
/*Q9021*/         pt_desc1 when available pt_mstr
		  dsr_qty_req @ qty
                  dsr_due_date
                  approve[dwn - mindwn + 1] @ yn.
                  dsrnbrs[dwn - mindwn + 1] = dsr_req_nbr.
                  dsrsites[dwn - mindwn + 1] = dsr_site.
/*Q9021* end added code <<<<<< */
/*Q9021* start deleted code >>>
               display
                  dwn dsr_req_nbr @ nbr
                  dsr_site dsr_part dsr_qty_req @ qty
                  dsr_due_date
                  approve[dwn - mindwn + 1] @ yn.
                  dsrnbrs[dwn - mindwn + 1] = dsr_req_nbr.
                  dsrsites[dwn - mindwn + 1] = dsr_site.
*Q9021* end deleted code <<<<<< */

            end. /* for first dsr_mstr */

         end. /* DO with frame b */

      end. /* DO dwn = mindwn */

      nbr = "".

      do on error undo, leave:

         do on error undo, retry:

            form
               dwn
               nbr
               dsr_site
               dsr_part
               qty
               dsr_due_date
               yn
            with frame d width 80 attr-space.

            /* SET EXTERNAL LABELS */
            setFrameLabels(frame d:handle).

            l_db = global_db.

            dwn = mindwn - 1.

            set
               dwn
            with frame d width 80
            editing:

               {us/mf/mfnarray.i dwn mindwn maxdwn}

               display dwn with frame d.

               if dwn >= mindwn
                  and dwn <= maxdwn
                  and dsrnbrs[dwn - mindwn + 1] <> ""
               then do:
                  for first dsr_mstr
                     where recid(dsr_mstr) = dsrrecno[dwn - mindwn + 1]
                  no-lock:

/*Q9021*/            find first pt_mstr where pt_part = dsr_part and
/*Q9021*/                                     pt_domain = global_domain
/*Q9021*/                                     no-lock no-error.
                     display
                        dwn
                        dsr_req_nbr @ nbr
                        dsr_site dsr_part dsr_qty_req @ qty
                        dsr_due_date
                        approve[dwn - mindwn + 1] @ yn
                     with frame d.
                  end. /* for first dsr_mstr */
               end. /* IF dwn >= mindwn */

            end. /* EDITING */

            if input dwn <> 0
               and ((dwn < mindwn or dwn > maxdwn)
               or (input dwn <> 0 and dsrnbrs[dwn - mindwn + 1] = ""))
            then do:
               /* MUST SELECT A NUMBER LISTED ABOVE */
               {us/bbi/pxmsg.i &MSGNUM=18 &ERRORLEVEL=3}
               undo, retry.
            end. /* IF input */

            if input dwn <> 0 then
               if dsrnbrs[dwn - mindwn + 1] = "" then
                  undo, retry.

         end. /* DO ON ERROR UNDO, RETRY */

         if dwn >= mindwn
            and dwn <= maxdwn
         then do:

            for first dsr_mstr where recid(dsr_mstr) = dsrrecno[dwn - mindwn + 1]
            no-lock: end.

            if not available dsr_mstr
            then do:
               /*  ORDER DOES NOT EXIST */
               {us/bbi/pxmsg.i &MSGNUM=6010 &ERRORLEVEL=3}
               undo, retry.
            end. /* IF NOT AVAILABLE dsr_mstr */
            else do:
/*Q9021*/            find first pt_mstr where pt_part = dsr_part and
/*Q9021*/                                     pt_domain = global_domain
/*Q9021*/                                     no-lock no-error.
               display
                  dwn dsr_req_nbr @ nbr
                  dsr_site
                  dsr_part
                  dsr_qty_req @ qty
                  dsr_due_date
                  approve[dwn - mindwn + 1] @ yn
               with frame d.

               do on error undo, retry:
                  set
                     yn
                  with frame d.

                  approve[dwn - mindwn + 1] = yn.
               end. /* DO ON ERROR */

            end. /* ELSE DO */

         end. /* IF dwn >= mindwn */

         else do:

            repeat:
               yn = no.
               {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=yn}
               leave.
            end. /* REPEAT */

            if yn then do:
               do dwn = 1 to 10:

                  if dsrrecno[dwn] <> ?
                     and approve[dwn]
                  then do:

                     for first dsr_mstr where recid(dsr_mstr) = dsrrecno[dwn]
                     exclusive-lock: end.

                     if available dsr_mstr
                     then do:
                        dsr_status = "F".

                        for each dsd_det where dsd_domain = global_domain
                           and dsd_req_nbr = dsr_req_nbr
                           and dsd_site = dsr_site
                           and dsd_part = dsr_part
                        exclusive-lock:

                           assign
                              l_err_flag = 0
                              dsd_status = "F".

                           for first mrp_det where mrp_domain = global_domain
                              and mrp_dataset = "dsd_det"
                              and mrp_part  = dsd_part
                              and mrp_nbr   = dsd_req_nbr
                              and mrp_line  = dsd_site
                              and mrp_line2 = dsd_shipsite
                           exclusive-lock:
                              mrp_type = "SUPPLYF".
                              mrp_detail =
                               caps(getTermLabel("FIRM_PLANNED_ORDER",24)).
                           end.

                           for first si_mstr where si_domain = global_domain
                              and   si_site   = dsd_shipsite
                           no-lock: end.

                           if si_db <> l_db
                           then do:
                              {us/bbi/gprun.i ""gpmdas.p""
                                 "(input si_db,
                                   output l_err_flag)" }
                           end. /* IF si_db <> l_db */

                           if l_err_flag = 0
                           then do:
                              {us/bbi/gprun.i ""drdoapb.p""
                                 "(input dsd_req_nbr,
                                   input dsd_site,
                                   input dsd_shipsite)"}
                           end. /* IF l_err_flag */

                           /* SWITCH THE DATABASE BACK TO ORIGINAL SITE DB */
                           if si_db <> l_db
                           then do:
                              {us/bbi/gprun.i ""gpmdas.p""
                                 "(input l_db,
                                   output l_err_flag)" }
                           end. /* IF si_db <> l_db */

                        end. /* FOR EACH dsd_det */

                     end. /* IF AVAILABLE dsr_mstr */

                  end. /* IF dsrrecno[dwn] <> ? */

               end. /* DO dwn = 1 to 10 */

               flag = 1.
               leave.

            end. /* IF yn */

         end. /* ELSE DO */

      end. /* DO ON ERROR UNDO, LEAVE */

   end. /* REPEAT */

   if flag = 0
   then do:
      dsrrecno[1] = ?.
      hide frame d.
      undo, leave.
   end. /* IF flag */

   if dsrcnbr > ""
   then do:
      {us/mf/mfnctrlb.i "drp_ctrl.drp_domain = global_domain" "drp_ctrl.drp_domain"
         "dsr_mstr.dsr_domain = global_domain" drp_ctrl drp_req_nbr dsr_mstr
         dsr_req_nbr dsrcnbr}
   end. /* IF dsrcnbr */

   hide frame d.

end. /* DO TRANSACTION */
