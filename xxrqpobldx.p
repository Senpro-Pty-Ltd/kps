/* xxrqpobldx.p - Requisition Retrieval Sub-Program                         */
/* Copyright 1986-2010 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=ReportAndMaintenance                                       */
/* CYB     FIRST CREATED: 09-MAY-2010              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB    LAST MODIFIED: 07-AUG-2012    BY:  gbg *c1323*  MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/


{us/bbi/mfdeclre.i " "}

/* PARAMETERS */
define input parameter p_first_call   like mfc_logical no-undo.
define input parameter p_req_nbr      like rqm_mstr.rqm_nbr no-undo.
define input parameter p_req_nbr1     like rqm_mstr.rqm_nbr no-undo.
define input parameter p_supplier     like rqm_vend no-undo.
define input parameter p_supplier1    like rqm_vend no-undo.
define input parameter p_part         like rqd_part no-undo.
define input parameter p_part1        like rqd_part no-undo.
define input parameter p_need_date    like rqd_need_date no-undo.
define input parameter p_need_date1   like rqd_need_date no-undo.
define input parameter p_buyer_id     like rqm_buyer no-undo.
define input parameter p_site         like rqd_site no-undo.
define input parameter p_requester    like rqm_rqby_userid no-undo.
define input parameter p_job_name     like rqm_job no-undo.
define input parameter p_ship         like rqd_ship no-undo.
define input parameter p_currency     like rqm_curr no-undo.
define input parameter p_blank_suppliers  like mfc_logical no-undo.
define input parameter p_include_mrp_type like mfc_logical no-undo.
define input parameter p_include_mro_type like mfc_logical no-undo.
define input parameter p_default_copy     like mfc_logical no-undo.

/* VARIABLES */
define variable open_qty              like rqd_req_qty no-undo.
define variable qty_um                like rqd_um no-undo.
define variable old_db                as character no-undo.
define variable err-flag              as integer no-undo.
define variable hBlockedTransactionlibrary as handle no-undo.


def shared var vdom         like dom_domain.
def shared var vdom1        like dom_domain.

def var prev_domain like si_domain.
def var si_recno as recid.
def shared var ss-site like si_site.

def buffer parentdomain   for dom_mstr.
def buffer childdomain    for dom_mstr.

/* CONSTANTS */
{us/rq/rqconst.i}

/* SHARED VARIABLES*/
{us/rq/rqpovars.i }



   loopa:
   for each childdomain no-lock
   where childdomain.dom_domain = global_domain
   and   childdomain.dom_user1 <> ?
   and   childdomain.dom_user1 <> "",
   first parentdomain no-lock
   where parentdomain.dom_domain = childdomain.dom_user1
   and   parentdomain.dom_domain >= vdom 
   and   parentdomain.dom_domain <= vdom1:

      loopb:
      for each rqm_mstr where 
      rqm_domain = childdomain.dom_domain and 
      (rqm_open                      and
      (rqm_rtdto_purch)             and
/*c1323* /*q9006*/ rqm_nbr  = p_req_nbr  and  */
/*q9006*       (rqm_nbr        >= p_req_nbr  and rqm_nbr <= p_req_nbr1)   and*/
/*c1323*/      (rqm_nbr        >= p_req_nbr  and rqm_nbr <= p_req_nbr1)   and
      (rqm_rqby_userid = p_requester or p_requester = "")        and
      (rqm_buyer       = p_buyer_id  or p_buyer_id = "")         and
      (rqm_curr        = p_currency  or p_currency = "")         and
      (rqm_job         = p_job_name  or p_job_name = "")         and
      rqm_status       = ""                                      and
      (rqm_ship        = p_ship      or  p_ship = ""))
/*q9006*/ and rqm__dec01 = 900:
   
         for first rqda_det 
         where rqda_domain = rqm_domain
         and rqda_nbr = rqm_nbr:
   
             for each rqd_det
             where rqd_domain = global_domain
             and rqd_nbr = rqm_nbr
             and rqd_aprv_stat = APPROVAL_STATUS_UNAPPROVED:
                next loopb.
             end.

             rqda_domain = parentdomain.dom_domain.
             for each rqd_det 
             where rqd_domain = global_domain and
             rqd_nbr       = rqm_nbr:
/*c1206a*  start added code */	
                for each cmt_det
	        where cmt_domain = rqd_domain
	        and   cmt_indx = rqd_cmtindx:
                    cmt_domain = parentdomain.dom_domain.
	        end.
/*c1206a*  end   added code */
                rqd_domain = parentdomain.dom_domain.
            end.
/*c1206a*  start added code */	
            for each cmt_det
	    where cmt_domain = rqm_domain
	    and   cmt_indx = rqm_cmtindx:
                cmt_domain = parentdomain.dom_domain.
	    end.
/*c1206a*  end   added code */
            rqm_domain = parentdomain.dom_domain.
         end.  /* for each rqd_det */
      end.  /* for each rqm_mstr */
    end.  /* loopa - each parentdomain */

