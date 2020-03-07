/* xypopomti.p - PURCHASE ORDER MAINTENANCE SUBROUTINE                        */
/* popomti.p - PURCHASE ORDER MAINTENANCE SUBROUTINE                          */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xypopomti.p,v 1.2 2018/03/13 17:10:02 gbg Exp $: */
/* This program updates and validates the purchase order line site.           */
/*F0PN*/
/* REVISION: 7.4   BY:dpm                           DATE:07/21/93 ECO: *H034* */
/* REVISION: 7.4   BY:cdt                           DATE:07/30/93 ECO: *H047* */
/* REVISION: 7.5   BY:mwd                           DATE:10/18/94 ECO: *J034* */
/* REVISION: 7.5   BY:WUG                           DATE:02/14/97 ECO: *J1YW* */
/* REVISION: 8.6E  BY:A. Rahane                     DATE:02/23/98 ECO: *L007* */
/* REVISION: 8.6E  BY:Jeff Wootton                  DATE:05/09/98 ECO: *L00Y* */
/* REVISION: 8.6E  BY:Charles Yen                   DATE:06/02/98 ECO: *L020* */
/* REVISION: 9.0   BY:A. Philips                    DATE:11/27/98 ECO: *J35N* */
/* REVISION: 9.0   BY:Alfred Tan                    DATE:03/13/99 ECO: *M0BD* */
/* Revision: 9.1   BY:Annasaheb Rahane              DATE:03/24/00 ECO: *N08T* */
/* Revision: 1.18  BY:John Corda                    DATE:03/27/00 ECO: *N059* */
/* Revision: 1.19  BY:Samir Bavkar                  DATE:12/12/01 ECO: *P013* */
/* Revision: 1.20  BY:Rajaneesh S.                  DATE:08/29/02 ECO: *M1BY* */
/* Revision: 1.22  BY: Laurene Sheridan             DATE:10/17/02 ECO: *N13P* */
/* Revision: 1.24  BY: Paul Donnelly (SB)           DATE:06/28/03 ECO: *Q00J* */
/* Revision: 1.25  BY: Rajinder Kamra               DATE:06/23/03 ECO: *Q003* */
/* Revision: 1.26  BY: Steve Nugent                 DATE:03/10/09 ECO: *R1F3* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 18-FEB-2013    BY:  gbg *c1366*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
/* ************************************************************************** */
/* Note: This code has been modified to run when called inside an MFG/PRO API */
/* method as well as from the MFG/PRO menu, using the global variable         */
/* c-application-mode to conditionally execute API- vs. UI-specific logic.    */
/* Before modifying the code, please review the MFG/PRO API Development Guide */
/* in the QAD Development Standards for specific API coding standards and     */
/* guidelines.                                                                */
/* ************************************************************************** */

/*============================================================================*/
/* **************************** Definitions ********************************* */
/*============================================================================*/

/* STANDARD INCLUDE FILES */
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
{us/px/pxsevcon.i}

/* SHARED FRAMES */
define shared frame chead.
define shared frame c.
define shared frame d.

/* SHARED VARIABLES */
define  shared variable desc1 like pt_desc1.
define  shared variable desc2 like pt_desc2.
define shared variable line like sod_line.
define shared variable po_recno as recid.
define  shared variable ext_cost like pod_pur_cost.
define  shared variable pod_recno as recid.
define shared variable podcmmts       like mfc_logical.
define shared variable sngl_ln like poc_ln_fmt.
define  shared variable mfgr like vp_mfgr.
define  shared variable mfgr_part like vp_mfgr_part.
define  shared variable continue like mfc_logical.
define  shared variable st_qty like pod_qty_ord.
define  shared variable st_um like pod_um.
define  shared variable clines as integer initial ?.
define shared variable blanket   like mfc_logical.
define shared variable old_pod_site like pod_site.
define shared variable line_opened as logical.
define shared variable new_pod like mfc_logical.

/* LOCAL VARIABLES */
define variable old_site_db like si_db       no-undo.
define variable new_site_db like si_db       no-undo.
define variable yn          like mfc_logical no-undo.
define variable reqerr      as   logical     no-undo.
define variable errcd       as   integer     no-undo.
define variable using_grs   like mfc_logical no-undo.
define variable lLegacyAPI  as   logical     no-undo.

if c-application-mode = "API"
then do on error undo,return:

   /* COMMON API CONSTANTS AND VARIABLES */
   {us/mf/mfaimfg.i}

   /* PURCHASE ORDER API TEMP-TABLE, NAMED USING THE "Api" PREFIX */
   {us/po/popoit01.i}

   /* PURCHASE ORDER MAINTENANCE API dataset definition */
   {us/po/podsmt.i "reference-only"}


   /* Get handle of API Controller */
   {us/bbi/gprun.i ""gpaigach.p"" "(output ApiMethodHandle)"}
 
   if valid-handle(ApiMethodHandle) then do:
      /* Get the PURCHASE ORDER MAINTENANCE API dataset from the controller */
      run getRequestDataset in ApiMethodHandle (
         output dataset dsPurchaseOrder bind).
 
      lLegacyAPI = false.
   end.
   else do:
      /* GET HANDLE OF API CONTROLLER */
      {us/bbi/gprun.i ""gpaigh.p""
          "(output ApiMethodHandle,
            output ApiProgramName,
            output ApiMethodName,
            output apiContextString)"}

      /* GET LOCAL PO DETAIL TEMP-TABLE */
      create ttPurchaseOrderDet.
      run getPurchaseOrderDetRecord in ApiMethodHandle
         (buffer ttPurchaseOrderDet).
      lLegacyAPI = true.
   end.
end.  /* If c-application-mode = "API" */

/* DEFINES FORMS c & d */
{us/mf/mfpomtb.i}

{us/bbi/gprun.i ""gpmfc01.p""
   "(input 'grs_installed',
     input '',
     input '',
     input '',
     output using_grs)"}

/*============================================================================*/
/* ****************************** Main Block ******************************** */
/*============================================================================*/

if sngl_ln then
   clines = 1.

     continue = no.

for first po_mstr
   where recid(po_mstr) = po_recno
   no-lock:
end.

for first pod_det
   where recid(pod_det) = pod_recno
   exclusive-lock:
end.

setreq:
do on error undo, retry:
/* DO NOT RETRY WHEN PROCESSING API REQUEST */
   if retry and c-application-mode = "API" then
      undo setreq, return error.
   ststatus = stline[1].
   status input ststatus.
   if  c-application-mode <> "API"
   then do:
      prompt-for
      pod_site
      with frame c no-validate
      editing:
         if frame-field = "pod_site"
         then do:
            /* FIND NEXT/PREVIOUS RECORD */
            {us/mf/mfnp.i
               si_mstr
               pod_site
                " si_mstr.si_domain = global_domain and si_site "
               pod_site
               si_site
               si_site}
            if recno <> ?
            then do:
               pod_site = si_site.
               display
                  pod_site
               with frame c.
            end.
         end.  /* If frame-field = "pod_site" */
         else do:
            ststatus = stline[3].
            status input ststatus.
            readkey.
            apply lastkey.
         end. /* ELSE */
      end.  /* Editing */
   end. /*  c-application-mode <> "API" */
   else do:
      if not lLegacyAPI then
      assign
         {us/mf/mfaiset.i pod_site ttPurchaseOrderLine.podSite}
         .
   end.

   if  c-application-mode <> "API" then
       assign pod_site.
   else /* If c-application-mode = "API" */
      if lLegacyAPI then
      assign {us/mf/mfaiset.i pod_site ttPurchaseOrderDet.site}.

   pod_recno = recid(pod_det).

/*q9006* start deleted code >>>>>
   {us/px/pxrun.i &PROC='validateSite' &PROGRAM='icsixr.p'
            &PARAM="(input ""pod_det.pod_site"",
                     input pod_site,
                     input no,
                     input '')"
            &NOAPPERROR=True
            &CATCHERROR=True}

   if return-value <> {&SUCCESS-RESULT}
*q9006* end deleted code <<<<<<<< */

/*q9006*  start added code */
   if not can-find(first si_mstr
                   where si_site = pod_site)
/*q9006*  end added code */
   then do:
      if  c-application-mode <> "API"
      then do:
         next-prompt
         pod_site
         with frame c no-validate.
         undo setreq, retry setreq.
      end. /*  c-application-mode <> "API" */
      else  /*  c-application-mode = "API" */
         undo setreq, return error.
   end.

/*q9006* start deleted code <<<<<<
   {us/px/pxrun.i &PROC='validateSiteSecurity' &PROGRAM='icsixr.p'
            &PARAM="(input pod_site,
                     input '')"
            &NOAPPERROR=True
            &CATCHERROR=True}

   if return-value <> {&SUCCESS-RESULT}
   then do:
      if  c-application-mode <> "API"
      then do:
         next-prompt
         pod_site
         with frame c no-validate.
         undo setreq, retry setreq.
      end. /*  c-application-mode <> "API" */
      else  /*  c-application-mode = "API" */
         undo setreq, return error.
   end.

   /* VALIDATE GL PERIOD FOR ENTITY/DATABASE */
   find si_mstr where si_domain = global_domain
    and si_site = pod_site
   no-lock no-error.
*q9006* end deleted code <<<<<<< */

/*q9006* start added code */
   find si_mstr where si_domain = global_domain
    and si_site = po_site
   no-lock no-error.
/*q9006* end added code */


/*q9006* start deleted code <<<<<<
   /* Disable COP Functionality for QAD 2008 */
   if available(si_mstr) and
      si_db <> global_db
   then do:
      /* SITE IS NOT ASSIGNED TO THIS DOMAIN */
      {us/bbi/pxmsg.i &MSGNUM=6251 &ERRORLEVEL=3
      &FIELDNAME=""podSite""}
      if  c-application-mode <> "API"
      then do:
         next-prompt
         pod_site
         with frame c no-validate.
         undo setreq, retry setreq.
      end. /*  c-application-mode <> "API" */
      else  /*  c-application-mode = "API" */
         undo setreq, return error.
   end.
*q9006* end deleted code <<<<<<<< */

   if not new_pod
   then do:
      if pod_site <> old_pod_site
      then do:

         if (pod_status = "C" or pod_status = "X")
         then do:
            yn = no.
            /* PO AND/OR PO LINE CLOSED OR CANCELLED - REOPEN? */
            /* MESSAGE #339 - PO AND/OR PO LINE CLOSED OR */
            /* CANCELLED - REOPEN? */
            if c-application-mode <> "API"
            then do:
               {us/bbi/pxmsg.i
                  &MSGNUM=339
                  &ERRORLEVEL={&INFORMATION-RESULT}
                  &CONFIRM=yn}
            end.
            else
               assign
                  yn = yes.

            if yn = yes
            then do:
               {us/px/pxrun.i &PROC='reOpenPurchaseOrder' &PROGRAM='popoxr.p'
                        &PROGRAM='popoxr.p'
                        &PARAM="(input pod_nbr)"
                        &NOAPPERROR=True &CATCHERROR=True}

               assign
                  pod_status = ""
                  line_opened = true.
            end. /* IF YN = YES */
            else do:
               pod_site  = old_pod_site.
               if c-application-mode <> "API"
               then do:
                  display pod_site with frame c.
                  next-prompt pod_site with frame c no-validate.
                  undo setreq, retry.
               end.
               else  /* if c-application-mode = "API" */
                  undo setreq, return error.
            end. /* IF YN = NO */
         end. /* IF POD_STATUS = "C" OR "X" */

         /* GET THE OLD SITE DB */
         {us/px/pxrun.i &PROC='getSiteDataBase' &PROGRAM='icsixr.p'
                  &PARAM="(input old_pod_site,
                           output old_site_db)"
                  &NOAPPERROR=True
                  &CATCHERROR=True}

         /* SITE CHANGE ACROSS DATABASE NOT ALLOWED FOR RELEASED */
         /* BLANKET ORDER LINES.                                  */
         if pod_blanket <> ""
         then do:
            /* GET THE NEW SITE DB */
            {us/px/pxrun.i &PROC='getSiteDataBase' &PROGRAM='icsixr.p'
                     &PARAM="(input pod_site,
                              output new_site_db)"
                     &NOAPPERROR=True
                     &CATCHERROR=True}

            if new_site_db <> old_site_db
            then do:
               /* SITE NOT IN SAME DOMAIN AS BLANKET ORDER LINE */
               {us/bbi/pxmsg.i &MSGNUM=6258 &ERRORLEVEL={&APP-ERROR-RESULT}
               &FIELDNAME=""podSite""}
               if c-application-mode <> "API"
               then do:
                  next-prompt pod_site with frame c no-validate.
                  undo setreq, retry.
               end.
               else  /* if c-application-mode = "API" */
                  undo setreq, return error.
            end.
         end. /* IF pod_blanket <> "" */

         /* VALIDATE THE ATTACHED REQ AGAINST THE NEW SITE */
         if pod_req_nbr <> "" and using_grs
         then do:
            reqerr = false.
            /* VALIDATE THE REQ AGAINST THE NEW SITE */
            {us/bbi/gprun.i ""popomtia.p""
               "(input pod_site,
                 input pod_req_nbr,
                 input pod_req_line,
                 input old_site_db,
                 output reqerr)"}

            if reqerr
            then do:
               if c-application-mode <> "API" then
                  undo setreq, retry.
               else
                  undo setreq, return error.
            end.
         end. /* POD_REQ_NBR <> "" */

         /* UPDATE MRP WORKFILE IN HEADER/CENTRAL DB */
         {us/px/pxrun.i &PROC='deleteMRPDetailForPOLine' &PROGRAM='popoxr1.p'
                  &PARAM="(input pod_part,
                           input pod_nbr,
                           input string(pod_line))"
                  &NOAPPERROR=True &CATCHERROR=True}

         /* GET ITEM COST / UPDATE PO LINE DETAIL BASED ON NEW SITE */
         {us/bbi/gprun.i ""popomteb.p""}

         /*UPDATE ERS LINE ITEM OPTION TO PROPER VALUE*/
         {us/px/pxrun.i &PROC='getERSLineOption' &PROGRAM='aperxr.p'
                  &PARAM="(input po_ers_opt,
                           input po_pr_lst_tp,
                           input po_vend,
                           input pod_part,
                           input pod_site,
                           output pod_ers_opt,
                           output pod_pr_lst_tp)"
                  &NOAPPERROR=True
                  &CATCHERROR=True}
      end. /* IF POD_SITE <> OLD_POD_SITE */
   end. /* IF NOT NEW pod_det */

   continue = yes.
end. /* Setreq */
