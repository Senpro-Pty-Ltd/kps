/* xxrqpobldg.p - Requisition Line Item Retrieval Sub-Program                   */
/* rqpobldg.p - Requisition Line Item Retrieval Sub-Program                   */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqpobldg.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/*!
 *----------------------------------------------------------------------------
 * DESCRIPTION: Copy all requisition detail from a supplied site to a work-file.
 *              Supports the GRS Purchase Requisition Module of MFG/PRO.
 * ----------------------------------------------------------------------------
!*/
/* REVISION 8.5       LAST MODIFIED: 03/29/95  BY: *F0PN* Doug Norton         */
/* REVISION 8.5       LAST MODIFIED: 04/15/97  BY: *J1Q2* Patrick Rowan       */
/* REVISION 8.6       LAST MODIFIED: 05/20/98  BY: *K1Q4* Alfred Tan          */
/* REVISION 8.6       LAST MODIFIED: 06/22/98  BY: *J2QB* Bill Gates          */
/* REVISION 9.1       LAST MODIFIED: 10/01/99  BY: *N014* Robin McCarthy      */
/* REVISION 9.1       LAST MODIFIED: 08/12/00  BY: *N0KP* Mark Brown          */
/* Revision: 1.5.3.6     BY: Mugdha Tambe         DATE: 08/28/01  ECO: *P012* */
/* Revision: 1.5.3.7     BY: Manisha Sawant       DATE: 12/05/02  ECO: *N219* */
/* Revision: 1.5.3.9.1.1 BY: Paul Donnelly (SB)   DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.5.3.12    BY: Shilpa Kamath        DATE: 02/22/06  ECO: *R036* */
/* Revision: 1.5.3.13    BY: Robin McCarthy       DATE: 05/31/06  ECO: *R02F* */
/* Revision: 1.5.3.14    BY: Vivek Kamath        DATE: 01/29/08  ECO: *Q1GG* */
/* CYB     LAST MODIFIED: 12-OCT-2010              BY: gbg *c1199*            */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB     LAST MODIFIED: 09-FEB-2011              BY: gbg *c1025*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i " "}

/* VARIABLES */
define variable i                     as   integer     no-undo.

/* CONSTANTS */
{us/rq/rqconst.i}

/* SHARED VARIABLES*/
{us/rq/rqpovars.i }

/* INITIALIZATION */

/* CLEAR TEMP TABLES  */
empty temp-table wkrqd_det.
empty temp-table wkcmt_det.

/*  RETRIEVE RECORDS AND LOAD TEMP-TABLES */
rqpoloop:
for each rqpo_wrk
   where rqpo_copy_to_po
no-lock:

   /* COPY REQUISITION LINE ITEM */
   for first rqd_det
      where rqd_domain = global_domain
      and   rqd_nbr  = rqpo_nbr
      and   rqd_line = rqpo_line
   no-lock: end.

   create wkrqd_det.
   assign
      wkrqd_nbr           = rqd_nbr
      wkrqd_line          = rqd_line
      wkrqd_site          = rqd_site
      wkrqd_due_date      = rqd_due_date
      wkrqd_disc_pct      = rqd_disc_pct
      wkrqd_pr_list       = rqd_pr_list
      wkrqd_desc          = rqd_desc
      wkrqd_project       = rqd_project
      wkrqd_um            = rqd_um
      wkrqd_um_conv       = rqd_um_conv
      wkrqd_acct          = rqd_acct
/*c1199*/  wkrqd_sub           = rqd__chr01
/*c1199*/  wkrqd_cc            = rqd_cc
      wkrqd_status        = rqd_status
      wkrqd_pur_cost      = rqd_pur_cost
      wkrqd_vpart         = rqd_vpart
      wkrqd_vend          = rqd_vend
      wkrqd_part          = rqd_part
      wkrqd_insp_rqd      = rqd_insp_rqd
      wkrqd_loc           = rqd_loc
      wkrqd_rev           = rqd_rev
      wkrqd_item_rev_date = rqd_item_rev_date
      wkrqd_due_date      = rqd_due_date
      wkrqd_need_date     = rqd_need_date
      wkrqd_type          = rqd_type
      wkrqd_wo_lot        = rqd_wo_lot
      wkrqd_sub_type      = rqd_sub_type
      wkrqd_op            = rqd_op
      wkrqd_wip_lotser    = rqd_wip_lotser
      wkrqd_qadc01        = rqd__qadc01.

   /* COPY REQUISITION HEADER DATA */
   for first rqm_mstr
       where rqm_domain = global_domain
       and   rqm_nbr    = rqpo_nbr
   no-lock: 

      assign
         wkrqd_job          = rqm_job
         wkrqd_rqby_userid  = rqm_rqby_userid
         wkrqd_prev_userid  = rqm_prev_userid
         wkrqd_end_userid   = rqm_end_userid
         wkrqd_email_opt    = rqm_email_opt
         wkrqd_curr         = rqm_curr.
/*c1199*         wkrqd_sub          = rqm_sub */
/*c1199*         wkrqd_cc           = rqm_cc. */
   end.

   /* COPY REQ. LINE COMMENTS, IF THEY EXIST AND ARE FLAGGED */
   if include_lcmmts
      and rqd_cmtindx <> 0
   then do:

      wkrqd_cmtindx = rqd_cmtindx.

      /*COPY COMMENTS*/
      for each cmt_det
         where cmt_domain = global_domain
         and   cmt_indx   = rqd_cmtindx
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
            wkcmt_det.wkcmt_cmmt [i]  = cmt_det.cmt_cmmt [i].
         end.

      end. /* FOR EACH cmt_det WHERE cmt_indx = rqd_cmtindx  */

   end. /* IF include_lcmmts AND rqd_cmtindx <> 0  */
   else
      wkrqd_cmtindx = 0.

end.  /* FOR EACH rqpo_wrk */
