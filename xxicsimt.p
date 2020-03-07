/* xxicsimt.p - INVENTORY SITE MASTER MAINTENANCE                             */
/* icsimt.p - INVENTORY SITE MASTER MAINTENANCE                               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxicsimt.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* REVISION: 6.0      LAST MODIFIED: 02/07/90   BY: EMB                       */
/* REVISION: 6.0      LAST MODIFIED: 03/30/90   BY: WUG *D015*                */
/* REVISION: 6.0      LAST MODIFIED: 04/09/91   BY: WUG *D504*                */
/* REVISION: 6.0      LAST MODIFIED: 09/03/91   BY: afs *D847*                */
/* REVISION: 7.0      LAST MODIFIED: 09/18/91   BY: pma *F003*                */
/* REVISION: 7.0      LAST MODIFIED: 05/22/92   BY: pma *F520*                */
/* REVISION: 7.0      LAST MODIFIED: 06/15/92   BY: pma *F617*                */
/* REVISION: 7.3      LAST MODIFIED: 10/06/92   BY: mpp *G011*                */
/* REVISION: 7.3      LAST MODIFIED: 10/13/92   BY: pma *G180*                */
/* REVISION: 7.3      LAST MODIFIED: 01/15/93   BY: pma *G561*                */
/* REVISION: 7.3      LAST MODIFIED: 09/09/93   BY: ram *GE98*                */
/* REVISION: 7.3      LAST MODIFIED: 07/20/94   BY: pxd *GK85*                */
/* Oracle changes (share-locks)      09/11/94   BY: rwl *GM31*                */
/* REVISION: 8.5      LAST MODIFIED: 10/05/94   BY: mwd *J034*                */
/* REVISION: 7.3      LAST MODIFIED: 02/24/95   BY: pxd *F0DX*                */
/* REVISION: 7.3      LAST MODIFIED: 03/17/95   BY: aed *G0HT*                */
/* REVISION: 7.4      LAST MODIFIED: 04/10/95   BY: pxd *F0PZ*                */
/* REVISION: 7.4      LAST MODIFIED: 01/29/96   BY: bcm *G1LM*                */
/* REVISION: 8.5      LAST MODIFIED: 02/26/96   BY: rxm *G1P3*                */
/* REVISION: 8.5      LAST MODIFIED: 01/30/96   BY: *J0CV* Robert Wachowicz   */
/* REVISION: 8.5      LAST MODIFIED: 03/29/96   BY: jxz *J078*                */
/* REVISION: 8.5      LAST MODIFIED: 06/25/96   BY: *J0W9* Robert Wachowicz   */
/* REVISION: 8.6      LAST MODIFIED: 09/31/96   BY: *K003* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Kurt De Wit        */
/* REVISION: 8.6      LAST MODIFIED: 01/13/98   BY: *J28L* Manmohan Pardesi   */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 06/01/98   BY: *H1KY* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 03/10/99   BY: *M0B8* Hemanth Ebenezer   */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Vijaya Pakala      */
/* REVISION: 9.1      LAST MODIFIED: 01/19/00   BY: *N077* Vijaya Pakala      */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 04/11/00   BY: *N08H* Kaustubh K.        */
/* REVISION: 9.1      LAST MODIFIED: 05/14/00   BY: *N0B1* David Morris       */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KS* myb                */
/* REVISION: 9.1      LAST MODIFIED: 08/16/00   BY: *N0K2* Phil DeRogatis     */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *M0NZ*                    */
/* Revision: 1.23     BY: Anil Sudhakaran        DATE: 04/09/01  ECO: *M0NZ*  */
/* Revision: 1.25     BY: Santosh Rao            DATE: 02/27/02  ECO: *N19Z*  */
/* Revision: 1.26     BY: Samir Bavkar           DATE: 04/05/02  ECO: *P000*  */
/* Revision: 1.28     BY: Paul Donnelly          DATE: 12/17/01  ECO: *N16J*  */
/* Revision: 1.29     BY: Patrick Rowan          DATE: 05/24/02  ECO: *P018*  */
/* Revision: 1.30     BY: Inna Fox               DATE: 06/12/02  ECO: *P04Z*  */
/* Revision: 1.31     BY: Inna Fox               DATE: 06/18/02  ECO: *P08S*  */
/* Revision: 1.32     BY: Ed van de Gevel        DATE: 07/04/02  ECO: *P0B4*  */
/* Revision: 1.33     BY: Katie Hilbert          DATE: 01/31/03  ECO: *P0MJ*  */
/* Revision: 1.35     BY: Paul Donnelly (SB)     DATE: 06/28/03  ECO: *Q00G*  */
/* Revision: 1.37     BY: Ed van de Gevel        DATE: 07/08/03  ECO: *Q003*  */
/* Revision: 1.37     BY: Neil Curzon            DATE: 07/24/03  ECO: *Q017*  */
/* Revision: 1.38     BY: Rajaneesh S.           DATE: 08/27/03  ECO: *N2J9*  */
/* Revision: 1.39     BY: Ed van de Gevel        DATE: 10/02/03  ECO: *Q045*  */
/* Revision: 1.40     BY: Kirti Desai            DATE: 10/17/03  ECO: *P169*  */
/* Revision: 1.42     BY: Julie Milligan         DATE: 11/24/03  ECO: *P1C0*  */
/* Revision: 1.45     BY: Paul Donnelly          DATE: 12/24/03  ECO: *Q04R*  */
/* Revision: 1.46     BY: Ed van de Gevel        DATE: 05/27/04  ECO: *Q08C*  */
/* Revision: 1.47     BY: Ed van de Gevel        DATE: 03/07/05  ECO: *R00K*  */
/* Revision: 1.48     BY: Shilpa Kamath          DATE: 04/04/06  ECO: *R03R*  */
/* Revision: 1.49     BY: Changlin Zeng          DATE: 04/29/06  ECO: *R045*  */
/* Revision: 1.50     BY: Katie Hilbert          DATE: 11/27/06  ECO: *R0BW*  */
/* Revision: 1.51     BY: Michael Yan            DATE: 06/01/07  ECO: *R0GR*  */
/* Revision: 1.52     BY: Dinesh Dubey           DATE: 06/04/07  ECO: *R0C6*  */
/* Revision: 1.53     BY: Jean Miller            DATE: 11/07/07  ECO: *Q111*  */
/* Revision: 1.54     BY: Jean Miller            DATE: 02/05/08  ECO: *R0N1*  */
/* Revision: 1.55   BY: John Pison        DATE: 07/07/09  ECO: *R1LR*  */
/* $Revision: 1.2 $  BY: Steve Nugent        DATE: 07/15/10  ECO: *Q2W2*  */
/* CYB       LAST MODIFIED:  28-MAY-2010      BY: gbg *Q3702*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/******************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "3+ "}

{us/bbi/gpfilev.i}

define variable del-yn     like mfc_logical initial no.
define variable yn         like mfc_logical initial no.
define variable valid_acct like mfc_logical.
define variable filename   like _file._file-name no-undo.
define variable table_list as character no-undo.
define variable si_recno   as recid no-undo.

/* Variable added to perform delete during CIM.
 * Record is deleted only when the value of this variable
 * Is set to "X" */
define variable batchdelete as character format "x(1)" no-undo.
define variable l_error     as integer no-undo.
define variable l_error2    as integer no-undo.
define variable l_error3    as integer no-undo.
define variable old_domain  like global_domain no-undo.
define variable lv_err_lg   as logical no-undo.
define variable old_site    like si_site no-undo.
define variable code_page as character no-undo.
define variable prev_useplansched_wbs as logical no-undo.

define buffer   si-buffer for si_mstr.

define new shared variable msg like msg_desc format "x(50)".

define new shared frame indel.
define new shared stream prt.

/* CHECK IF PRM IS INSTALLED */
/* SETS THE FLAG PRM-ENABLED = YES IF IT IS. */
{us/pj/pjchkprm.i}

{us/ut/utindel.i} /* FRAME indel */

/* DISPLAY SELECTION FORM */
form
   si_site             colon 30 skip(1)
   si_desc             colon 30
   si_db               colon 30 label "Domain"
   si_entity           colon 30
   si_decl             colon 30
   si_status           colon 30 validate (true, "")
   si_auto_loc         colon 30
   si_insp_loc         colon 30 label "Inspection Location"
   skip(1)
   si_btb_vend         colon 30
   si_ext_vd           colon 30
   skip(1)
   si_xfer_acct        colon 30 si_xfer_sub no-label si_xfer_cc no-label
   si_xfer_ownership   colon 30
   si_git_location     colon 30
   si_useplansched_wbs colon 30
with frame a side-labels width 80 attr-space.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
   icc_xclr_acct colon 25
   icc_xclr_sub  no-label
   icc_xclr_cc   no-label
with frame b side-labels width 80 attr-space.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

define new shared frame c.
form
   space(2) msg
with frame c width 55 down overlay row 4 column 12
no-labels no-attr-space.

/* SUPPLIER CONSIGNMENT VARIABLES */
{us/po/pocnvars.i}

/* DETERMINE IF SUPPLIER CONSIGNMENT IS ACTIVE */
{us/bbi/gprun.i ""gpmfc01.p""
         "(input ENABLE_SUPPLIER_CONSIGNMENT,
           input 11,
           input ADG,
           input SUPPLIER_CONSIGN_CTRL_TABLE,
           output using_supplier_consignment)"}

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.

/* DISPLAY */
view frame a.

if not {us/bbi/gpiswrap.i} and dbcodepage("qaddb") = "utf-8" and not {us/gp/gpisutf8.i} then do:
   /* PROGAM HAS LIMITED FUNCTIONALITY IN CHUI WITH UTF-8 DB, USE .NET UI */
   {us/bbi/pxmsg.i &MSGNUM=1551 &ERRORLEVEL=2 &PAUSEAFTER=TRUE}
   assign code_page = session:cpinternal.
end.

global_site = "".

mainloop:
repeat with frame a:
   do transaction:
      /* Initialize delete flag before each display of frame */
      assign
         batchdelete = ""
         l_error     = 0
         l_error2    = 0
         l_error3    = 0.
   
      hide frame b.
      hide frame c.
   
      /* Prompt for the delete variable in the key frame at the end of
      * The key field/s only when batchrun is set to yes */
      prompt-for si_site
         batchdelete no-label when (batchrun)
         editing:
   
         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i si_mstr si_site  " si_mstr.si_domain = global_domain and si_site
         "  si_site si_site si_site}
   
         if recno <> ? then
            display
               si_site si_desc
               si_db
               si_entity
               si_decl
               si_status
               si_auto_loc
               si_insp_loc
               si_btb_vend
               si_ext_vd
               si_xfer_acct si_xfer_sub si_xfer_cc
               si_xfer_ownership when(using_supplier_consignment)
               si_git_location
               si_useplansched_wbs.
   
      end. /* editing: */
      if index(input si_site,"|":U) <> 0 or
         index(input si_site,",":U) <> 0
      then do:
         /* CODE CANNOT CONTAIN (,) OR (|)*/
         {us/bbi/pxmsg.i &MSGNUM=25318 &ERRORLEVEL=3}
         undo mainloop, retry.
      end.

      /* ADD/MOD/DELETE  */
      find si_mstr
         using si_site
         where si_domain = global_domain
      exclusive-lock no-wait no-error.
   
      if not available si_mstr then do:
   
         if locked si_mstr
         then do:
            /* RECORD LOCKED BY ANOTHER USER, TRY LATER */
            {us/bbi/pxmsg.i &MSGNUM=7422 &ERRORLEVEL=4}
            if not batchrun then
               pause.
            undo mainloop, leave mainloop.
         end. /* IF LOCKED si_mstr */
   
         else do:
   
            /* Creating a new site master record */
            if input si_site = ""
            then do:
                /*Blank # not allowed*/
                {us/bbi/pxmsg.i &MSGNUM=906 &ERRORLEVEL=3 &MSGARG1=""site""}
                undo mainloop, retry.
            end. /* if input si_site = "" then do: */
   
            /** Adding new record **/
            {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}
   
            /* Creating new primary site record */
            create si_mstr.
            assign
               si_domain = global_domain
               si_site.
   
            if available gl_ctrl then do:
   
               assign
                  si_entity    = ""
                  si_db        = global_db
                  si_git_acct  = gl_inv_acct
                  si_git_sub   = gl_inv_sub
                  si_git_cc    = gl_inv_cc
                  si_xfer_acct = gl_xfer_acct
                  si_xfer_sub  = gl_xfer_sub
                  si_xfer_cc   = gl_xfer_cc.
   
               for first en_mstr
                  where en_domain = global_domain
                    and en_entity = gl_entity
                    and en_consolidation = false
               no-lock:
                  /* Default the entity to the default GL entity but only if that    */
                  /* entity is defined in en_mstr and its not a consolidating entity */
                  si_entity = gl_entity.
               end.
   
            end.
   
            for first poc_ctrl where poc_domain = global_domain
            no-lock:
               si_insp_loc = poc_insp_loc.
            end.
   
            /*IF ERS IS ON THEN CREATE ERS MASTER FOR THE NEW SITE*/
            if can-find(mfc_ctrl where mfc_domain = global_domain
                                   and mfc_field = "ers_conv_run"
                                   and mfc_logical = yes)
            then do:
                if not can-find(ers_mstr where ers_domain = global_domain
                                          and  ers_site = si_site
                                          and  ers_vend = ""
                                          and  ers_part = "")
                then do:
                   create ers_mstr.
                       assign
                          ers_domain        = global_domain
                          ers_site          = si_site
                          ers_mod_date      = today
                          ers_mod_userid    = global_userid.
                end. /*NOT CAN FIND EXISTING ERS MASTER*/
            end. /*CAN FIND MFC_CTRL*/
            si_type = no.
         end. /*else do*/
   
      end. /* if not available si_mstr then do: */
   
      if input si_site = "" then do:
         /*Blank # not allowed*/
         {us/bbi/pxmsg.i &MSGNUM=906 &ERRORLEVEL=3 &MSGARG1=""site""}
         undo mainloop, retry.
      end. /* if input si_site = "" then do: */
   
      recno = recid(si_mstr).
      global_site = si_site.
   
      {us/bbi/gprun.i ""gpsiver.p""
         "(input si_site, input recno, output return_int)"}
      if return_int = 0 then do:
         /* USER DOES NOT HAVE ACCESS TO THIS SITE */
         {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
         undo, retry.
      end. /* if return_int = 0 then do: */
   
      ststatus = stline[2].
      status input ststatus.
      del-yn = no.
   
      display
         si_site si_desc
         si_db
         si_entity
         si_decl
         si_status
         si_auto_loc
         si_insp_loc
         si_btb_vend
         si_ext_vd
         si_xfer_acct si_xfer_sub si_xfer_cc
         si_xfer_ownership when(using_supplier_consignment)
         si_git_location
         si_useplansched_wbs.
   
      prev_useplansched_wbs = si_useplansched_wbs.
   
      do on error undo, retry:
         hide frame b.
         hide frame c.
   
         set
            si_desc
            si_db
            si_entity
            si_decl
            si_status
            si_auto_loc
            si_insp_loc
            si_btb_vend
            si_ext_vd
            si_xfer_acct si_xfer_sub si_xfer_cc
            si_xfer_ownership when(using_supplier_consignment)
            si_git_location
            si_useplansched_wbs
         go-on("F5" "CTRL-D").
   
         for first loc_mstr
            where loc_domain = global_domain
              and loc_site = si_site
              and loc_loc = si_git_location
         no-lock: end.
   
         if si_git_location <> "" and not available loc_mstr then do:
            /*Location Master does not exist*/
            {us/bbi/pxmsg.i &MSGNUM=229 &ERRORLEVEL=3}
            next-prompt si_git_location with frame a.
            undo, retry.
         end.
   
         /* VALIDATING THE INVENTORY STATUS */
         if not can-find(is_mstr
                   where is_domain = global_domain
                     and is_status = input si_status)
         then do:
            /* INVENTORY STATUS MUST EXIST */
            {us/bbi/pxmsg.i &MSGNUM=6282 &ERRORLEVEL=3}
            next-prompt si_status.
            undo, retry.
         end. /* IF NOT CAN-FIND(is_mstr... ) */
   
         if si_decl <> "" then do:
            if not can-find(first decl_mstr
                            where decl_domain = global_domain
                              and decl_addr = si_decl)
            then do:
               /* DECLARANT DOES NOT EXIST. */
               {us/bbi/pxmsg.i &MSGNUM=4969 &ERRORLEVEL=3}
               next-prompt si_decl.
               undo, retry.
            end.
         end.
   
         if si_useplansched_wbs then do:
            find mfc_ctrl  where mfc_ctrl.mfc_domain = global_domain and  mfc_field =
            "rpc_using_new" no-lock no-error.
   
            if not available mfc_ctrl or mfc_logical = false then do:
               /* New Repetitive module is not enabled.  Use 18.22.24 */
               {us/bbi/pxmsg.i &MSGNUM=3837 &ERRORLEVEL=3}
   
               next-prompt si_useplansched_wbs.
               undo, retry.
            end.
         end.
   
         if si_useplansched_wbs <> prev_useplansched_wbs then do:
            /*PLEASE RE-EXPLODE YOUR REPETITIVE SCHEDULES*/
            {us/bbi/pxmsg.i &MSGNUM=11122 &ERRORLEVEL=2}
         end.
   
         /* DELETE */
         /* Delete to be executed if batchdelete is set or
          * F5 or CTRL-D pressed */
         if lastkey = keycode("F5")
         or lastkey = keycode("CTRL-D")
         or input batchdelete = "x"
         then do with frame c:
   
            del-yn = yes.
            /** Please confirm delete **/
            {us/bbi/pxmsg.i &MSGNUM=11 &ERRORLEVEL=1 &CONFIRM=del-yn}
            if not del-yn then undo, retry.
   
            if not si_type then do:
               /* If the site record that is being deleted is a connection type
                  then simply check the site record domain for records that may
                  reference it. If none are found, then delete the record.
                */
               {us/bbi/gprun.i ""icsimt2.p"" "(input si_site,
                                        input si_domain,
                                        output lv_err_lg)"}
               if lv_err_lg then undo, retry.
               else do:
                  /* Delete the site connection and related records */
                  {us/bbi/gprun.i ""icsimt3.p"" "(input si_site, input si_domain)"}
               end.
            end.
   
            else do:
   
               /* Check to see if site is in an domain witha different codepage*/
               if code_page <> "" then do:
                  assign lv_err_lg = no.
                  for each dom_mstr where dom_data_cpg <> code_page no-lock,
                      each si-buffer where si-buffer.si_domain = dom_domain
                             and si-buffer.si_site = si_mstr.si_site
                  no-lock:
                     /* Domain # is not available */
                     {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=dom_domain}
                     assign lv_err_lg = yes.
                  end.
                  if lv_err_lg then undo, retry.
               end.
   
               /* The site record is a primary type record.  The first phase is
                  to run icsimt2.p for each domain and check if there is a site
                  master record in the domain. If there is a site master record then
                  check if there are records in that domain which reference the site
                  master record. If such records are found (in any domain), then
                  stop checking and leave the loop.
                */
               assign
                  old_domain = global_domain
                  lv_err_lg = no.
   
               domcheck:
               for each dom_mstr no-lock
                  where dom_data_cpg = if code_page <> "" then
                                          code_page else dom_data_cpg
               break by dom_db:
                  {us/bbi/gprun.i ""gpmdas.p"" "(input dom_domain, output l_error)"}
                  if (l_error > 0 and l_error <> 9) then do:
                     /* Domain # is not available */
                     {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=3 &MSGARG1=dom_domain}
                     assign lv_err_lg = YES.
                     leave domcheck.
                  end.
                  {us/bbi/gprun.i ""icsimt2.p"" "(input si_site,
                                           input dom_domain,
                                           output lv_err_lg)"}
                  if lv_err_lg then leave domcheck.
               end.
   
               {us/bbi/gprun.i ""gpmdas.p"" "(input old_domain, output l_error)"}
   
               /* If records were found in a domain that reference the site
                  being deleted then stop trying to delete the site; it cannot be
                  deleted.
                  If there are no records, then cycle through all the domains
                  deleting the site master record for the site code. This
                  process will remove the primary site record and all the
                  site connection records.
                */
               if lv_err_lg then undo,retry.
               else do:
                  assign old_site = si_site.
                  sitedelete:
                  for each dom_mstr no-lock
                     where dom_data_cpg = if code_page <> "" then
                                             code_page else dom_data_cpg
                  break by dom_db:
                      {us/bbi/gprun.i ""gpmdas.p"" "(input dom_domain, output l_error)"}
                      if (l_error > 0 and l_error <> 9) then do:
                         /* Domain # is not available */
                         {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=3 &MSGARG1=dom_domain}
                         undo, retry.
                      end.
                      {us/bbi/gprun.i ""icsimt3.p"" "(input old_site, input dom_domain)"}
                  end.
                  {us/bbi/gprun.i ""gpmdas.p"" "(input old_domain, output l_error)"}
               end.
   
            end.
   
            pause 2 no-message.
            hide frame c no-pause.
            clear frame a.
            del-yn = no.
            next.
   
         end. /* then do */
   
         /* Add/Modify of si_mstr record */
         /* Yet another check for blank si_site values */
         if si_site = "" then do for si-buffer:
            find first si-buffer
               where si-buffer.si_domain = global_domain and
                     si-buffer.si_site <> input si_mstr.si_site
            no-lock no-error.
            if available si-buffer then do:
               /*Blank # not allowed*/
               {us/bbi/pxmsg.i &MSGNUM=906 &ERRORLEVEL=4 &MSGARG1=""site""}
               undo, retry.
            end. /* if available si-buffer then do: */
         end. /* if si_site = "" then do for si-buffer: */
   
         else do:
            if can-find(first si_mstr where si_domain = global_domain
                                        and si_site = "")
            then do:
               /*Blank site exists. Multi sites not allowed*/
               {us/bbi/pxmsg.i &MSGNUM=717 &ERRORLEVEL=4}
               undo, retry.
            end. /* if can-find(first si_mstr where si_site = "") then do: */
         end. /* else do: */
   
         si_type = (si_db = global_domain).
   
         /* The entity associated with a site can only exist in    */
         /* a single domain. For a primary site record verify that */
         /* the entity exists in the current domain.               */
/*q3702* start deleted code  >>>>>>>>>>>>>>>>
         if available si_mstr and si_type and si_entity <> glentity then do:
            if not can-find(en_mstr  where en_domain = global_domain
                                      and  en_entity = si_entity)
*q3702* end   deleted code  <<<<<<<<<<<<<<< */

/*q3702*  start added code */
      if available si_mstr and si_type and si_entity <> glentity then do:
         if not can-find(en_mstr  where en_entity = si_entity)
/*q3702*  end added code */
            then do:
               /* Invalid entity */
               {us/bbi/pxmsg.i &MSGNUM=3061 &ERRORLEVEL=3}
               next-prompt si_entity.
               undo, retry.
            end. /* if not can-find */
            if can-find(en_mstr where en_domain = global_domain
                                  and en_entity = si_entity
                                  and en_active = false)
            then do:
               /* Entity is not active */
               {us/bbi/pxmsg.i &MSGNUM=7623 &ERRORLEVEL=3}
               next-prompt si_entity.
               undo, retry.
            end. /* if not can-find */
/*q3702* start deleted code  >>>>>>>>>>>>>>>>
            if not can-find(en_mstr where en_domain = global_domain
                                      and en_entity = si_entity
                                      and en_consolidation = false)
*q3702* end   deleted code  <<<<<<<<<<<<<<< */

/*q3702* start added code */
         if not can-find(en_mstr where en_entity = si_entity
                                   and en_consolidation = false)
/*q3702*  end added code */
            then do:
               /* Consolidation entity */
               {us/bbi/pxmsg.i &MSGNUM=6183 &ERRORLEVEL=3}
               next-prompt si_entity.
               undo, retry.
            end. /* if not can-find */
         end. /* if available si_mstr  */
   
         {us/gp/gprunp.i "mgdompl" "p" "ppDomainValidate"
            "(input si_db, output l_error)"}
         if l_error >0 then do:
            next-prompt si_db.
            undo, retry.
         end.
   
         {us/gp/gpdelp.i "mgdompl" "p"}
   
         /* If si_type is yes then the si_mstr record created is a primary site record.
            Hence it will be necessary to create corresponding site connection records
            in the other domains.  First check that the site does not exist in another
            domain as a primary site reocrd.
            If the site is ok to be created as a primary record then run icsimdmt.p to
            allow the user to select which domains to create the connection records.
         */
         if si_type then do:
            assign
               old_domain = global_domain
               l_error2 = 1.
            domloop:
            for each dom_mstr
               where dom_domain <> old_domain
                 and dom_data_cpg = if code_page <> "" then code_page
                                       else dom_data_cpg
            no-lock break by dom_db:
   
               {us/bbi/gprun.i ""gpmdas.p"" "(input dom_domain, output l_error2)"}
   
               if (l_error2 > 0 and l_error2 <> 9) then do:
                  /* Domain # is not available */
                  {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=3 &MSGARG1=dom_domain}
                  l_error2 = 0.
                  leave domloop.
               end.
   
               {us/bbi/gprun.i ""icsimt1.p"" "(input si_mstr.si_site,
                                        input dom_domain,
                                        input '',
                                        output l_error2,
                                        output l_error3)"}
               if l_error2 = 0 then do:
                  /* The site is primary in another domain*/
                  {us/bbi/pxmsg.i &MSGNUM=6246 &ERRORLEVEL=3}
                  if not dom_active then
                     /** Domain # is not active **/
                     {us/bbi/pxmsg.i &MSGNUM=6248 &ERRORLEVEL=2 &MSGARG1=dom_domain}
                  leave domloop.
               end.
   
            end.
   
            {us/bbi/gprun.i ""gpmdas.p"" "(input old_domain, output l_error)"}
   
            if l_error2 <> 0 then do:
               {us/bbi/gprun.i ""icsimdmt.p"" "(input si_site)"}
/*d2101*/      {us/bbi/gprun.i ""xxsimden.p"" "(input si_site)"}
            end.
            else do:
               next-prompt si_db.
               undo, retry.
            end.
   
         end.
   
         else do:
   
            /* If si_type is no, then the si_mstr record being created is a connection
               record (being manually created). First the domain should be switched to
               the domain that should hold the primary site record. if the domain does
               not have the primary site record, then the creation of the connection
               should be halted. Also validate that the entity exists in the domain
               that owns the primary site record. Entity cannot be a consolidation entity.
            */
   
            old_domain = global_domain.
   
            {us/bbi/gprun.i ""gpmdas.p"" "(input si_db, output l_error)"}
   
            if (l_error > 0 and l_error <> 9) then do:
               /* Domain # is not available */
               {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=3 &MSGARG1=si_db}
               /* You cannot create a connection site without a primary site */
               {us/bbi/pxmsg.i &MSGNUM=6244 &ERRORLEVEL=3}
               next-prompt si_db.
               undo, retry.
            end.
   
            else do:
               {us/bbi/gprun.i ""icsimt1.p"" "(input si_mstr.si_site,
                                        input si_mstr.si_db,
                                        input si_mstr.si_entity,
                                        output l_error2,
                                        output l_error3)"}
               {us/bbi/gprun.i ""gpmdas.p"" "(input old_domain, output l_error)"}
               if l_error2 > 0 then do:
                  /* You cannot create a connection site without a primary site */
                  {us/bbi/pxmsg.i &MSGNUM=6244 &ERRORLEVEL=3}
                  next-prompt si_db.
                  undo, retry.
               end.
               if l_error3 = 1 then do:
                  /* Invalid entity */
                  {us/bbi/pxmsg.i &MSGNUM=3061 &ERRORLEVEL=3}
                  next-prompt si_entity.
                  undo, retry.
               end.
               if l_error3 = 2 then do:
                  /* Consolidation entity */
                  {us/bbi/pxmsg.i &MSGNUM=6183 &ERRORLEVEL=3}
                  next-prompt si_entity.
                  undo, retry.
               end.
               if l_error3 = 3 then do:
                  /* Entity is not active */
                  {us/bbi/pxmsg.i &MSGNUM=7623 &ERRORLEVEL=3}
                  next-prompt si_entity.
                  undo, retry.
               end.
   
            end.
   
         end.
   
         if si_btb_vend <> "" then do:
            find first vd_mstr where vd_domain = global_domain and
                                     vd_addr = si_btb_vend
            no-lock no-error.
            if not available vd_mstr then do:
               /* SUPPLIER CODE DOES NOT EXIST. */
               {us/bbi/pxmsg.i &MSGNUM=8601 &ERRORLEVEL=3}
               next-prompt si_btb_vend.
               undo, retry.
            end. /* if not available vd_mstr then do: */
         end. /* if si_btb_vend <> "" then do: */
   
         if si_ext_vd and not
            can-find(first vd_mstr where vd_domain = global_domain and
                                         vd_addr = si_site)
         then do:
            /* SITE NOT DEFINED AS SUPPLIER */
            {us/bbi/pxmsg.i &MSGNUM=2801 &ERRORLEVEL=3}
            next-prompt si_ext_vd.
            undo, retry.
         end. /* then do: */
   
         /*IF THERE IS OBVIOUSLY AT LEAST ONE OTHER SITE IN USE   */
         /*REQUIRE THAT THE INVENTORY TRANSFER ACCOUNTS BE DEFINED*/
   
         do for si-buffer:
   
            find first si-buffer
               where si-buffer.si_domain = global_domain and
                     si-buffer.si_site <> si_mstr.si_site
            no-lock no-error.
   
            if available si-buffer then do:
   
               find first icc_ctrl where icc_ctrl.icc_domain = global_domain
               no-lock no-error.
   
               if not available icc_ctrl then do:
                  create icc_ctrl.
                  assign
                     icc_domain = global_domain
                     icc_site = si-buffer.si_site.
               end. /* if not available icc_ctrl then do: */
   
               if si_mstr.si_xfer_acct = "" then do:
                  /* Valid non-blank acct required */
                  {us/bbi/pxmsg.i &MSGNUM=5227 &ERRORLEVEL=3}
                  next-prompt si_mstr.si_xfer_acct.
                  undo, retry.
               end. /* if si_mstr.si_xfer_acct = "" then do: */
   
               {us/gp/gprunp.i "gpglvpl" "p" "initialize"}
   
               /* SET PROJECT VERIFICATION TO NO */
               {us/gp/gprunp.i "gpglvpl" "p" "set_proj_ver" "(input false)"}
               {us/gp/gprunp.i "gpglvpl" "p" "validate_fullcode"
                  "(input si_mstr.si_xfer_acct,
                   input si_mstr.si_xfer_sub,
                   input si_mstr.si_xfer_cc,
                   input """",
                   input ""si_xfer_acct"",
                   output valid_acct)"}
   
               if valid_acct = no then do:
                  next-prompt si_mstr.si_xfer_acct with frame a.
                  undo, retry.
               end. /* if valid_acct = no then do: */
   
               do while icc_xclr_acct = "":
   
                  yn = yes.
   
                  /* Inv ctrl xfer accts not defined*/
                  {us/bbi/pxmsg.i &MSGNUM=5228 &ERRORLEVEL=2 &CONFIRM=yn}
   
                  if yn then do:
   
                     find first icc_ctrl where icc_ctrl.icc_domain = global_domain
                     exclusive-lock.
   
                     update
                        icc_xclr_acct icc_xclr_sub icc_xclr_cc
                     with frame b.
   
                     /* REPLACE OLD VALIDATION CALLS WITH NEW CALLS */
                     /* INITIALIZE SETTINGS */
                     {us/gp/gprunp.i "gpglvpl" "p" "initialize"}
                     /* SET PROJECT VERIFICATION TO NO */
                     {us/gp/gprunp.i "gpglvpl" "p" "set_proj_ver" "(input false)"}
                     /* ACCT/SUB/CC VALIDATION */
                     {us/gp/gprunp.i "gpglvpl" "p" "validate_fullcode"
                        "(input icc_xclr_acct,
                          input icc_xclr_sub,
                          input icc_xclr_cc,
                          input """",
                          input ""icc_xclr_acct"",
                          output valid_acct)"}
   
                     if valid_acct = no then do:
                        next-prompt icc_xclr_acct with frame b.
                        undo, retry.
                     end. /* if valid_acct = no then do: */
   
                  end. /* if yn then do: */
   
                  else do:
                     clear frame a.
                     undo mainloop, next.
                  end. /* else do: */
   
               end. /* do while icc_xclr_acct = "": */
   
               hide frame b.
   
            end. /* if available si-buffer then do: */
   
         end. /* do for si-buffer */
   
      end. /* do on error undo, retry: */
   end. /*do transaction*/
   
   if available si_mstr and si_useplansched_wbs <> prev_useplansched_wbs and
      prev_useplansched_wbs = false
   then do:
        /* CALL PROGRAM TO UPDATE WORK ORDERS WITH THIS SITE WITH */
        /* PRODUCTION LINE DATA NECESSARY TO SHOW ORDERS ON THE   */
        /* PLANNING/SCHEDULING WORKBENCHES.                       */
       {us/bbi/gprun.i ""woplupd.p""
                "(input si_site, input '')"}
   end.

   release si_mstr.

end. /* repeat with frame a: */
status input.
