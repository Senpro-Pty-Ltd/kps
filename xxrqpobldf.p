/* xxrqpobldf.p - Requisition Retrieval Sub-Program                           */
/* rqpobldf.p - Requisition Retrieval Sub-Program                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqpobldf.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* REVISION 8.5       LAST MODIFIED: 04/15/97  BY: *J1Q2* Patrick Rowan     */
/* REVISION 8.6       LAST MODIFIED: 05/20/98  BY: *K1Q4* Alfred Tan        */
/* REVISION 9.1       LAST MODIFIED: 10/01/99  BY: *N014* Brian Compton     */
/* REVISION 9.1       LAST MODIFIED: 08/12/00  BY: *N0KP* myb               */
/* REVISION 9.1       LAST MODIFIED: 11/13/00  BY: *M0W9* Veena Lad         */
/* Old ECO marker removed, but no ECO header exists *F0PN*                  */
/* Revision: 1.3.1.6  BY: Rajaneesh S. DATE: 08/04/02 ECO: *N1QN* */
/* Revision: 1.3.1.8  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L* */
/* Revision: 1.3.1.9  BY: Vivek Kamath DATE: 01/11/08 ECO: *Q1GG* */
/* $Revision: 1.2 $  BY: Neil Curzon        DATE: 04/30/09 ECO: *R1HB* */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*!
 ----------------------------------------------------------------------------
 DESCRIPTION: Copy all requisition detail from a supplied site to a work-file.
              Supports the GRS Purchase Requisition Module of MFG/PRO.

 Notes:

============================================================================
!*/
/*V8:ConvertMode=ReportAndMaintenance                                       */

{us/bbi/mfdeclre.i " "}

/* PARAMETERS */
define input parameter p_first_call   like mfc_logical no-undo.
define input parameter p_site         like rqd_site no-undo.

/* VARIABLES */
define variable old_db                as character no-undo.
define variable err-flag              as integer no-undo.
define variable i                     as integer no-undo.
/*q9006*/ def shared var ss-site like si_site.

/* CONSTANTS */
{us/rq/rqconst.i}

/* SHARED VARIABLES*/
{us/rq/rqpovars.i }

find rqpo_wrk
    exclusive-lock
    where recid(rqpo_wrk) = rqpo_recno.

/* INITIALIZATION */
if p_first_call
then do:

   /* FIRST TIME IN, WE CLEAR TEMP TABLES  */
   for each wkrqm_mstr
      exclusive-lock:
      delete wkrqm_mstr.
   end. /* FOR EACH wkrqm_mstr */

   for each wkcmt_det
      exclusive-lock:
      delete wkcmt_det.
   end. /* FOR EACH wkcmt_det */
end.  /* if p_first_call */

if p_first_call
  and  p_site <> ""
then do:
   /* WE SWITCH DB'S IF A SITE HAS BEEN PASSED AND
   CALL OURSELVES AGAIN, WHICH WILL EXECUTE THE ELSE BLOCK*/
   for first si_mstr
      fields( si_domain si_site si_db)
       where si_mstr.si_domain = global_domain and  si_site = p_site
      no-lock:
   end. /* FOR FIRST si_mstr */.

   if si_db <> global_db
   then do:
      old_db = global_db.
      {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err-flag)"}
   end. /* IF si_db <> global_db */

   {us/bbi/gprun.i ""rqpobldf.p""
      "(input false,
        input p_site)"}

   /*SWITCH BACK TO CENTRAL PO DB IF WE HAVE TO*/
   if old_db <> global_db
   then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(old_db, output err-flag)"}
   end. /* IF old_db <> global_db */

end. /* IF p_first_call */
else do:
   for first vd_mstr
      fields( vd_domain vd_addr vd_curr vd_pr_list vd_pr_list2)
       where vd_mstr.vd_domain = global_domain and  vd_addr = rqpo_supplier
      no-lock:
   end. /* FOR FIRST vd_mstr */

   /*  RETRIEVE RECORDS AND LOAD TEMP-TABLES */

   /* COPY REQUISITION MASTER FROM 1ST REQUISITION LINE */
   for first rqm_mstr
       where rqm_mstr.rqm_domain = global_domain and  rqm_nbr = rqpo_nbr
      no-lock:
   end. /* FOR FIRST rqm_mstr */

   create wkrqm_mstr.
   assign
      wkrqm_nbr                = rqm_nbr
      wkrqm_disc_pct           = rqm_disc_pct
      wkrqm_rmks               = rqm_rmks
      wkrqm_sub                = rqm_sub
      wkrqm_cc                 = rqm_cc
      wkrqm_curr               = vd_curr when (available vd_mstr)
      wkrqm_pr_list            = if rqm_vend = ""
                                 and available vd_mstr
                                 then
                                    vd_pr_list
                                 else
                                    rqm_pr_list
      wkrqm_pr_list2           = if rqm_vend = ""
                                 and available vd_mstr
                                 then
                                    vd_pr_list2
                                 else
                                    rqm_pr_list2
      wkrqm_fix_rate           = rqm_fix_rate
      wkrqm_lang               = rqm_lang
      wkrqm_buyer              = rqm_buyer
      wkrqm_due_date           = rqm_due_date
      wkrqm_job                = rqm_job
      wkrqm_site               = rqm_site
      wkrqm_daybookset         = rqm_daybookset
      wkrqm_project            = rqm_project
      wkrqm_rqby_userid        = rqm_rqby_userid
      wkrqm_prev_userid        = rqm_prev_userid
      .

   /* COPY REQ. HEADER COMMENTS, IF THEY EXIST AND ARE FLAGGED */
   if include_hcmmts
   and rqm_cmtindx <> 0
   then do:
      wkrqm_cmtindx = rqm_cmtindx.

      /*COPY COMMENTS*/

      for each cmt_det
         fields( cmt_domain cmt_cmmt cmt_indx cmt_lang cmt_print
                cmt_ref cmt_seq cmt_type)
          where cmt_det.cmt_domain = global_domain and  cmt_indx = rqm_cmtindx
         no-lock:

         create wkcmt_det.

         assign
            wkcmt_det.wkcmt_indx      = cmt_det.cmt_indx
            wkcmt_det.wkcmt_seq       = cmt_det.cmt_seq
            wkcmt_det.wkcmt_ref       = cmt_det.cmt_ref
            wkcmt_det.wkcmt_type      = cmt_det.cmt_type
            wkcmt_det.wkcmt_print     = cmt_det.cmt_print
            wkcmt_det.wkcmt_lang      = cmt_det.cmt_lang .

         do i = 1 to 15:
            wkcmt_det.wkcmt_cmmt [i]  = cmt_cmmt [i].
         end.
      end. /* FOR EACH cmt_det */

   end. /* IF include_hcmmts */
   else
      wkrqm_cmtindx = 0.

end. /* ELSE DO */

/* RETURN */
