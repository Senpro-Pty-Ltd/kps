/* xxdomt2a.p - DISTRIBUTION ORDER MAINTENANCE                                */
/* dsdomt2a.p - DISTRIBUTION ORDER MAINTENANCE                                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdomt2a.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/*                                                                            */
/*! dsdomt2a.p IS CALLED FROM dsdomt.p AND dsdomt02.p                         */
/*                                                                            */
/* Revision: 1.24     BY: Samir Bavkar            DATE: 07/31/01  ECO: *P009* */
/* Revision: 1.25     BY: Saurabh Chaturvedi      DATE: 09/19/01  ECO: *M1KP* */
/* Revision: 1.28     BY: Steve Nugent            DATE: 10/15/01  ECO: *P004* */
/* Revision: 1.33     BY: Manish Kulkarni         DATE: 01/05/02  ECO: *P042* */
/* Revision: 1.37     BY: Robin McCarthy          DATE: 06/16/02  ECO: *P08P* */
/* Revision: 1.38     BY: Samir Bavkar            DATE: 07/07/02  ECO: *P0B0* */
/* Revision: 1.39     BY: Robin McCarthy          DATE: 07/15/02  ECO: *P0BJ* */
/* Revision: 1.40     BY: Robin McCarthy          DATE: 11/08/02  ECO: *P0JS* */
/* Revision: 1.42     BY: Paul Donnelly (SB)      DATE: 06/26/03  ECO: *Q00B* */
/* Revision: 1.43     BY: Rajinder Kamra          DATE: 05/05/03  ECO: *Q003* */
/* Revision: 1.44     BY: Reena Ambavi            DATE: 09/03/03  ECO: *P122* */
/* Revision: 1.45     BY: Jean Miller             DATE: 01/08/04  ECO: *Q04Y* */
/* Revision: 1.46     BY: Ed van de Gevel         DATE: 03/07/05  ECO: *R00K* */
/* Revision: 1.48     BY: Ed van de Gevel         DATE: 03/29/05  ECO: *R00P* */
/* Revision: 1.49     BY: Priyank Khandare        DATE: 05/17/05  ECO: *P3LT* */
/* Revision: 1.50     BY: Sunil Fegade            DATE: 05/26/05  ECO: *Q0J4* */
/* Revision: 1.51     BY: Shivganesh Hegde        DATE: 08/30/05  ECO: *P403* */
/* Revision: 1.52     BY: Andrew Dedman           DATE: 10/05/05  ECO: *R021* */
/* Revision: 1.53     BY: Alok Gupta              DATE: 12/05/05  ECO: *P4B6* */
/* Revision: 1.54     BY: Shilpa Kamath           DATE: 02/08/06  ECO: *R03V* */
/* Revision: 1.55     BY: Preeti Sattur           DATE: 05/15/06  ECO: *P4RD* */
/* Revision: 1.56     BY: Robin McCarthy          DATE: 06/15/06  ECO: *R04H* */
/* Revision: 1.57     BY: Preeti Sattur           DATE: 06/26/06  ECO: *P4TY* */
/* Revision: 1.58     BY: Samit Patil             DATE: 08/14/06  ECO: *P51D* */
/* Revision: 1.59     BY: Masroor Alam            DATE: 12/19/06  ECO: *P5JV* */
/* Revision: 1.61     BY: Sandeep Panchal         DATE: 04/22/08  ECO: *P6K9* */
/* Revision: 1.63     BY: Prajakta Patil          DATE: 06/17/08  ECO: *P6S8* */
/* Revision: 1.64     BY: Ruchita Shinde          DATE: 08/13/08  ECO: *R112* */
/* Revision: 1.65     BY: Deepa Mathew            DATE: 12/02/08  ECO: *Q20Z* */
/* Revision: 1.66     BY: Cristobal Bravo         DATE: 12/18/09  ECO: *R1VW* */
/* Revision: 1.67     BY: Ambrose Almeida         DATE: 01/04/10  ECO: *Q3QT* */
/* $Revision: 1.2 $  BY: Rajat Kulshreshtha    DATE: 02/16/10  ECO: *Q3TW* */
/* Revision:2009.1EE  BY: Vishal Agarwal  DATE: 26/01/11 ECO: *Q9028-CRD07*   */
/* CYB      LAST MODIFIED: 26-AUG-2011      BY: gbg *c1234*                   */
/* CYB      LAST MODIFIED: 26-AUG-2011      BY: gbg *ca840519*                */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}   /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
/*c1347*/ {us/xx/xx1347.i}

{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
/*Define handles for the program */
{us/px/pxphdef.i ppitxr}

define input parameter auto_do_proc like mfc_logical no-undo.
define input parameter orderNbr  like dss_nbr       no-undo.
define input parameter shipSite  like dss_shipsite  no-undo.
define input parameter recSite   like dss_rec_site  no-undo.

define new shared variable del-yn like mfc_logical.
define new shared variable dss_recno as recid.
define new shared variable dsscmmts like drp_dcmmts label "Comments".
define new shared variable new_order like mfc_logical initial no.
define new shared variable cmtindx like dss_cmtindx.
define new shared variable ds_recno as recid.
define new shared variable ds_db like dc_name.
define new shared variable undo-all like mfc_logical.
define new shared variable go_back_to_main as logical.
define new shared variable qty_to_all like ds_qty_all.
define new shared variable totallqty like ds_qty_all.
define new shared variable totpkqty like ds_qty_pick.
define new shared variable order_date like dsr_ord_date no-undo.
define new shared variable sales_job like dsr_so_job no-undo.
define new shared variable rcpt_loc like dsr_loc no-undo.
define new shared variable del-req like mfc_logical no-undo.
define new shared variable qty_ord like ds_qty_ord no-undo.
define new shared variable calc_fr like mfc_logical no-undo.
define new shared variable disp_fr like mfc_logical no-undo.
define new shared variable freight_ok like mfc_logical no-undo.
define new shared variable rndmthd like rnd_rnd_mthd.

define variable err_nbr as integer no-undo.
define variable severity as integer no-undo.
define variable err_arg1 as character no-undo.
define variable err_arg2 as character no-undo.
define variable err_arg3 as character no-undo.
define variable last_dsline like ds_line no-undo.
define variable donbr like dss_nbr.
define variable yn like mfc_logical initial yes.
define variable i as integer.
define variable comment_type like dss_lang.
define variable open_qty like mrp_qty.
define variable l_prev_ds_status like ds_status no-undo.
define variable l_prev_ds_qty like ds_qty_conf no-undo.
define variable dss_recid as recid no-undo.
define variable got_dss_mstr like mfc_logical no-undo.
define variable l_shipsite like dss_shipsite no-undo.
define variable continue like mfc_logical no-undo.
define variable prev_qty_all like ds_qty_all no-undo.
define variable req_nbr like ds_req_nbr no-undo.
define variable change_db as logical no-undo.
define variable err-flag as integer no-undo.
define variable use-log-acctg as logical no-undo.
define variable ref like tx2d_ref no-undo.

define variable l_new_dsdet like mfc_logical no-undo.

define new shared variable impexp      like mfc_logical
   label "Imp/Exp" no-undo.
define            variable impexp_edit like mfc_logical no-undo.
define            variable upd_okay    like mfc_logical no-undo.
define            variable imp-okay    like mfc_logical no-undo.
define            variable dss_ie_nbr  as character no-undo.
define new shared variable active_mod  like mfc_logical no-undo.
define variable l_dss_rec_site like dss_rec_site no-undo.
define variable l_dss_shipvia  like dss_shipvia  no-undo.
define variable l_ds_date      like ds_due_date  no-undo.

define variable l_totladqtyall  like lad_qty_all  no-undo.
define variable l_totladqtypick like lad_qty_pick no-undo.

define variable l_conf_ship                as   integer     no-undo.
define variable l_conf_shid                like abs_par_id  no-undo.
define variable l_shipper_found            as   integer     no-undo.
define variable l_save_abs                 like abs_par_id  no-undo.


active_mod = no.
for first iec_ctrl  where iec_ctrl.iec_domain = global_domain no-lock:
    active_mod = lookup("4", iec_act_in_type_list) <> 0.
end.

define buffer dsdet for ds_det.

{us/la/lafrttmp.i "new"}   /* FREIGHT ACCRUAL TEMP TABLE DEFINITION */

define new shared frame b.
define new shared frame d.
define variable vErrorMsgNbr as integer no-undo.
define variable vErrorMsgType as integer no-undo.

{us/up/updaterestriction.i}

/* Start Update Restriction Library running Persistantly */
run mfairunh.p (input "mgurpl.p",
                input ?,
                output hUpdateRestrictedLibrary).

/* FRAME D DEFINITION */
{us/ds/dsdofmd.i}

form
   order_date    colon 22
   ds_status     colon 22
   sales_job     colon 22
   rcpt_loc      colon 22   label "Receipt Location"
with frame e side-labels overlay width 34
   title color normal (getFrameTitle("INTERSITE_REQUEST",32))
   row 11 column 24.

/* SET EXTERNAL LABELS */
setFrameLabels(frame e:handle).

mainloop:
repeat:

   do transaction on error undo, retry:

      /* DISPLAY SELECTION FORM */
      form
         space(1)
         dss_nbr
         dss_shipsite label "Ship-From"
         dss_rec_site
      with frame a side-labels width 80 .

      /* SET EXTERNAL LABELS */
      setFrameLabels(frame a:handle).

      /* FRAME B DEFINITION */
      /*c1348*      {us/ds/dsdofmb.i} */
      /*c1348*/     {us/xx/xxdofmb.i}

{us/mf/mfadform.i ship_from  1 SHIP-FROM}
{us/mf/mfadform.i ship_to   41 SHIP-TO}

/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

view frame dtitle.
view frame a.
view frame ship_from.
view frame ship_to.
view frame b.

display
global_site @ dss_shipsite
with frame a.

if auto_do_proc then do:
display
orderNbr @ dss_nbr
shipSite @ dss_shipsite
with frame a.
end.
else do:
prompt-for
dss_nbr
dss_shipsite
with frame a
editing:

if frame-field = "dss_nbr" then do:
/* FIND NEXT/PREVIOUS  RECORD */
{us/mf/mfnp.i dss_mstr dss_nbr  "dss_domain = global_domain
	and dss_nbr "  dss_nbr dss_nbr dss_nbr}

	if recno <> ? then do with frame b:

{us/mf/mfaddisp.i dss_rec_site ship_to}
{us/mf/mfaddisp.i dss_shipsite ship_from}

                  display
                     dss_nbr
                     dss_rec_site
                     dss_shipsite
                  with frame a.
                  impexp = no.

                  /* SET THE DEFAULT VALUE BASED ON IEC_CTRL FILE */
                  if available iec_ctrl and iec_impexp = yes then impexp = yes.
                  if impexp and not new dss_mstr then do:
                     dss_ie_nbr = string(dss_nbr, "x(8)")
                                + string(dss_shipsite, "x(8)").
                     if not can-find(first ie_mstr
                        where ie_mstr.ie_domain = global_domain
                        and   ie_type = "4"
                        and   ie_nbr  = dss_ie_nbr)
                     then impexp = no.
                  end.

                  display
                     dss_created
                     dss_shipdate
                     dss_due_date
                     dss_po_nbr
                     dss_fob
                     dss_shipvia
                     dss_rmks
                     dsscmmts
                     dss_lang
                     dss_bol
                     dss_status
                     impexp
                  with frame b.

                  if dss_cmtindx <> 0 then
                     display true @ dsscmmts.
               end.
            end.
            else
            /* PREVENT THE USER FROM EXITING THE ORDER NUMBER FIELD WHILE IT  */
            /* IS BLANK AND AUTO NUMBER IS NO IN THE DRP CONTROL FILE.        */
            if frame-field = "dss_shipsite" and input dss_nbr = "" then do:
               find first drp_ctrl where drp_domain = global_domain
               no-lock no-error.
               if not available drp_ctrl or not drp_auto_nbr then do:
                  {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3} /* BLANK NOT ALLOWED */
                  next-prompt dss_nbr with frame a.
                  undo, retry.
               end.

               run getNextDO (input-output donbr).

               display
                  donbr @ dss_nbr
               with frame a.
            end.
            else if frame-field = "dss_shipsite" then do:

               /* FIND NEXT/PREVIOUS  RECORD */
               {us/mf/mfnp01.i dss_mstr dss_shipsite dss_shipsite dss_nbr  "
                  dss_domain = global_domain and donbr "
                  dss_nbr}

               if recno <> ? then do:
                  display
                     dss_shipsite
                  with frame a.
                  {us/mf/mfaddisp.i dss_shipsite ship_from}
               end.
            end.
            else do:
               readkey.
               apply lastkey.
            end.
         end. /* PROMPT-FOR EDITING BLOCK */

         for first si_mstr
            where si_mstr.si_domain = global_domain
            and   si_site           = input dss_shipsite
         no-lock:
         end. /* FOR FIRST si_mstr */

         if available si_mstr
         then
            if si_db <> global_db
            then do:
               /* SITE IS NOT ASSIGNED TO THIS DOMAIN */
               {us/bbi/pxmsg.i &MSGNUM     = 6251
                        &ERRORLEVEL = 3}
               undo, retry.
            end. /* IF si_db <> global_db */

         l_shipsite  = input dss_shipsite.
      end.   /*ELSE DO (AUTO_DO_PROC) */

      if not auto_do_proc then do:
         if input dss_nbr = "" then do:
            for first drp_ctrl where drp_domain = global_domain
            no-lock:
	    end.
            if not available drp_ctrl or not drp_auto_nbr then do:
               {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3} /* BLANK NOT ALLOWED */
               undo, retry.
            end.

            run getNextDO (input-output donbr).
         end.
         else
            donbr = input dss_nbr.

         for first si_mstr where si_domain = global_domain and
                            si_site = input dss_shipsite
         no-lock:
	 end.
         if not available si_mstr then do:

            if input dss_shipsite = "" then
               display
                  global_site @ dss_shipsite
               with frame a.

            for first si_mstr where si_domain = global_domain and
                               si_site = global_site
            no-lock:
	    end.
            if not available si_mstr then do:
               {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3} /* SITE DOES NOT EXIST */
               next-prompt dss_shipsite with frame a.
               undo, retry.
            end.
         end.

         /* CHECK SITE SECURITY */
         if available si_mstr then do:
            {us/bbi/gprun.i ""gpsiver.p""
               "(input si_site, input recid(si_mstr), output return_int)"}
         end.
         else do:
            {us/bbi/gprun.i ""gpsiver.p""
               "(input (input dss_shipsite), input ?, output return_int)"}
         end.

         if return_int = 0 then do:
            /*USER DOES NOT HAVE ACCESS TO THIS SITE */
            {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
            next-prompt dss_shipsite with frame a.
            undo mainloop, retry.
         end.
      end. /* IF not auto_do_proc */

   end.  /* TRANSACTION */

   do transaction on error undo, retry:

      if auto_do_proc then
         run find_dss_mstr
            (input orderNbr,
             input shipSite,
             output got_dss_mstr).
      else
         run find_dss_mstr
            (input donbr,
             input l_shipsite,
             output got_dss_mstr).

      if not got_dss_mstr then do:

         clear frame ship_from no-pause.
         clear frame ship_to no-pause.
         clear frame b no-pause.

         {us/bbi/pxmsg.i &MSGNUM=1 &ERRORLEVEL=1}   /* ADDING NEW RECORD */

         for first drp_ctrl where drp_domain = global_domain
         no-lock:
	 end.
         dsscmmts = drp_dcmmts.

         if auto_do_proc then
            run create_dss_mstr
               (input orderNbr,
                input shipSite).
         else
            run create_dss_mstr
               (input donbr,
                input l_shipsite).

         new_order = true.

         dss_recid = recid(dss_mstr).

         /* SHIP-TO SITE */
         if auto_do_proc then do:
            dss_rec_site = recSite.
            if recid(dss_mstr) = -1 then .
            display
               dss_rec_site
            with frame a.

            {us/mf/mfaddisp.i dss_rec_site ship_to}
         end.
         else do:
            run get_rec_site.
            if not continue then
               undo mainloop, retry.
         end.

      end. /* IF got_dss_mstr */

      else do:
         new_order = false.

         clear frame ship_from no-pause.
         clear frame ship_to no-pause.
         clear frame b no-pause.

         for first dss_mstr where recid(dss_mstr) = dss_recid
            exclusive-lock:
	         {us/mf/mfaddisp.i dss_shipsite ship_from}
	         {us/mf/mfaddisp.i dss_rec_site ship_to}
	 

	         /* CHECK FOR COMMENTS*/
	         if dss_cmtindx <> 0 then
	            dsscmmts = yes.
	         else
	            dsscmmts = no.
         end.
      end.

      recno = recid(dss_mstr).

      display
         dss_nbr
         dss_shipsite
         dss_rec_site
      with frame a.

      /* SET THE DEFAULT VALUE BASED ON IEC_CTRL FILE */
      if available iec_ctrl and iec_impexp = yes
         then impexp = yes.
         else impexp = no.

      display
         dss_created
         dss_shipdate
         dss_due_date
         dss_po_nbr
         dss_fob
         dss_shipvia
         dss_rmks
         dsscmmts
         dss_lang
         dss_bol
         dss_status
         impexp
      with frame b.

      {us/mf/mfaddisp.i dss_shipsite ship_from}

      assign dss_shipsite.

      assign
         global_addr = dss_rec_site
         global_site = dss_shipsite
         go_back_to_main = false
         undo-all = true
         dss_recno = recid(dss_mstr).

      if new_order then do:
         for first ssd_det where
            ssd_domain     = global_domain           and
            ssd_rec_site   = dss_rec_site            and    /* ShipTo */
            ssd_src_site   = dss_shipsite            and    /* ShipFrom */
            (ssd_start <= today or ssd_start = ?)    and
            (ssd_end >= today or ssd_end = ?)
         no-lock:

            assign
               dss_fr_list    =   ssd_fr_list
               dss_fr_min_wt  =   ssd_fr_min_wt
               dss_fr_terms   =   ssd_fr_terms
            .
         end.
      end. /*  if new_order then do: */
/*c1347*      {us/bbi/gprun.i ""dsdomta.p"" } */
/*c1347*/     {us/bbi/gprun.i ""xxdomta.p"" }

      /* go_back_to_main IS SET to TRUE in dsdomta.p WHEN A D/O IS DELETED */

      /* WHEN A D/O IS DELETED OR undo-all IS TRUE, CONTROL SHOULD BE      */
      /* RETURNED TO THE D/O PROCESSING SCREEN IF THIS PROGRAM WAS CALLED  */
      /* FROM THE D/O PROCESSING SCREEN (auto_do_proc).                    */

      if go_back_to_main then
         if auto_do_proc then
            leave mainloop.
         else
            next mainloop.

      if undo-all then
         if auto_do_proc then
            undo mainloop, leave mainloop.
         else
            undo mainloop, next mainloop.

      /* COMMENTS */
      assign
         global_lang = dss_lang
         global_type = "".

      if dsscmmts then do:
         assign
            cmtindx = dss_cmtindx
            global_ref = dss_rec_site.
         {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""dss_mstr"")"}
         dss_cmtindx = cmtindx.
      end.
   end.   /* TRANSACTION */

   hide frame b no-pause.
   hide frame ship_to no-pause.
   hide frame ship_from no-pause.

   /* LINE ITEMS */
   form
      space(1)
      ds_req_nbr
      ds_part
      pt_desc1
      ds_qty_ord
      pt_um
   with frame c width 80 .

   /* SET EXTERNAL LABELS */
   setFrameLabels(frame c:handle).

   view frame c.
   view frame d.

   loopc:
   repeat with frame c:

      hide frame e.

      do transaction on error undo, retry:
         assign
            last_dsline = 0
            l_new_dsdet = no.

         prompt-for ds_req_nbr with frame c
         editing:

            {us/mf/mfnp05.i ds_det ds_nbr
               "ds_domain = global_domain and ds_nbr = dss_nbr and
               ds_shipsite = dss_shipsite
                                 and ds_site = dss_rec_site"
                ds_req_nbr "input ds_req_nbr"}

            if recno <> ? then do:
               find pt_mstr where pt_domain = global_domain
                              and pt_part = ds_part
               no-lock no-error.
               display ds_req_nbr ds_part ds_qty_ord.

               if available pt_mstr then
                  display pt_desc1 pt_um.
               else
                  display "" @ pt_desc1 "" @ pt_um.

               detail_all = no.

               /* SEE IF ANY DETAIL ALLOCATIONS EXIST */
               if can-find (first lad_det where
                            lad_domain = global_domain
                       and  lad_dataset = "ds_det"
                       and lad_nbr = ds_req_nbr
                       and lad_line = ds_site
                       and lad_part = ds_part
                       and lad_site = ds_shipsite)
               then
                  detail_all = yes.

               display
                  ds_qty_conf
                  ds_qty_all
                  ds_qty_pick
                  ds_qty_ship
                  ds_trans_id
                  ds_shipdate
                  detail_all
                  ds_due_date
                  ds_git_site
                  ds_project
                  ds_order_category
                  ds_fr_list
                  true when (ds_cmtindx <> 0) @ ds-cmmts
                  false when (ds_cmtindx = 0) @ ds-cmmts
               with frame d.

            end.   /* IF RECNO <> ? */
         end.   /* PROMPT-FOR EDITING */

         if input ds_req_nbr = "" then do:
            for first drp_ctrl where drp_domain = global_domain
            no-lock: end.
            if available drp_ctrl then do:
               if not drp_auto_req then do:
                  /* BLANK NOT ALLOWED */
                  {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3}
                  undo, retry.
               end.

               /* GET NEXT REQ NBR FROM CTRL FILE */
                  {us/mf/mfnctrlc.i
                  "drp_domain = global_domain"
                  "drp_domain"
                  "ds_domain = global_domain"
                  drp_ctrl
                  drp_req_pre
                  drp_req_nbr
                  ds_det
                  ds_req_nbr
                  req_nbr}
            end.

            if req_nbr = "" then do:
               /* BLANK NOT ALLOWED */
               {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3}
               undo, retry.
            end.

            display req_nbr @ ds_req_nbr.
         end. /* IF INPUT DS_REQ_NBR..*/
      end. /* TRANSACTION  */

      do transaction on error undo loopc, retry loopc:
         if can-find (first ds_det
            where ds_domain   = global_domain
            and   ds_site     = dss_rec_site
            and   ds_shipsite = dss_shipsite
            and   ds_req_nbr  = input ds_req_nbr
            and   ds_status   = "c")
         then do:
            /* REQUISITION CLOSED, CANNOT PROCESS DISTRIBUTION ORDER # */
            {us/bbi/pxmsg.i &MSGNUM=6790 &ERRORLEVEL=3 &MSGARG1=dss_nbr}
            undo, retry.
         end. /* IF CAN-FIND (FIRST ds_det .... */

         find ds_det exclusive-lock using ds_req_nbr
          where ds_domain = global_domain
            and ds_nbr = dss_nbr
            and ds_shipsite = dss_shipsite
            and ds_site = dss_rec_site
         use-index ds_req_nbr no-error.

         if not available ds_det then
            find ds_det exclusive-lock using ds_req_nbr
             where ds_domain = global_domain
               and ds_nbr = ""
               and ds_shipsite = dss_shipsite
               and ds_site = dss_rec_site
            use-index ds_req_nbr no-error.

         if not available ds_det then do:
            find ds_det no-lock using ds_req_nbr
             where ds_domain = global_domain
               and ds_site = dss_rec_site
               and ds_shipsite = dss_shipsite
            use-index ds_req_nbr no-error.

            if available ds_det then do:
               /* REQUISITION ALREADY ATTACHED TO DISTRIBUTION ORDER # */
               {us/bbi/pxmsg.i &MSGNUM=1610 &ERRORLEVEL=3 &MSGARG1=ds_nbr}
               undo, retry.
            end.

            find first ds_det no-lock using ds_req_nbr
               use-index ds_req_nbr
               where ds_domain = global_domain  no-error.

            /* CREATE INTERSITE REQUEST */
            if not available ds_det then do:
               assign
                  err-flag = 0
                  detail_all = no
                  req_nbr = input ds_req_nbr.

               clear frame c no-pause.
               clear frame d no-pause.

               display req_nbr @ ds_req_nbr.

               /* CREATING INTERSITE REQUEST */
               {us/bbi/pxmsg.i &MSGNUM=4557 &ERRORLEVEL=1}
               create ds_det.
               assign
                  ds_domain   = global_domain
                  ds_req_nbr  = req_nbr
                  ds_site     = dss_rec_site
                  ds_shipsite = dss_shipsite
                  ds_due_date = dss_due_date
                  ds_git_site = ds_site
                  ds_status   = "A"
                  ds_shipdate = dss_shipdate
                  ds_per_date = today
                  ds_fr_list  = dss_fr_list
                  ds_trans_id = if avail ssd_det then ssd_trans else ""
                  ds_nbr      = dss_nbr.

               l_new_dsdet = yes.

               /* FIND THE LINE NUMBER (ds_line) FOR THE LAST REQ ATTACHED  */
               do for dsdet:
                  for last dsdet
                     fields(ds_domain ds_nbr ds_shipsite ds_line)
                     where dsdet.ds_domain = global_domain and
                           dsdet.ds_nbr = dss_nbr and
                           dsdet.ds_shipsite = dss_shipsite
                  no-lock
                  use-index ds_nbr:
                     last_dsline = dsdet.ds_line + 1.
                  end.

                  if not available dsdet then
                     last_dsline = 1.
               end. /* DO FOR dsdet */

               ds_line = last_dsline.

               if recid(ds_det) = -1 then .

               update ds_part.

               for first pt_mstr
                  fields(pt_domain pt_desc1 pt_um pt_loc pt_fr_class
                          pt_ship_wt pt_ship_wt_um)
                   where pt_domain = global_domain and
                         pt_part = ds_part
               no-lock: end.

               /* INITIALIZE FREIGHT VALUES */
               if available pt_mstr then do:
                  /*LETS CHECK FOR PO_TOT_TERMS CODE AND SEE IF THIS ITEM HAS ANY ISSUES*/
                  /* LETS VALIDATE THE ITEMS IN PO FOR THE RULES IN TERMS OF TRADE*/
                  {us/px/pxrun.i &PROC ='validateShippingAndVolumeInDOLines'
                           &PROGRAM='ppitxr.p'
                           &HANDLE = ph_ppitxr
                           &PARAM ="(input ds_nbr,
                                     input ds_req_nbr,
                                     input dss_fr_terms,
                                     output vErrorMsgNbr,
                                     output vErrorMsgType)"}
                  if vErrorMsgNbr > 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM=vErrorMsgNbr &ERRORLEVEL=vErrorMsgType}
                     if vErrorMsgType  = 3 then
                        undo, retry.
                  end.
                  assign
                     ds_fr_class = pt_fr_class
                     ds_fr_wt_um = pt_ship_wt_um.

                  if calc_fr then
                     ds_fr_wt = pt_ship_wt.
               end. /* IF AVAILABLE pt_mstr */

               display
                  ds_part
                  pt_desc1
                  pt_um.

               update ds_qty_ord.
               display ds_qty_ord.

               assign
                  ds_qty_conf = ds_qty_ord
                  qty_ord     = ds_qty_ord
                  order_date  = today
                  rcpt_loc    = ""
                  sales_job   = "".
               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &PARAM =  "(input  ds_part,
                                    input  ds_shipsite,
                                    input ""pt_loc"",
                                    output ds_loc)"
                        &NOAPPERROR = true
                        &CATCHERROR = true
               }

               for first in_mstr
                  fields(in_domain in_loc)
                  where in_domain = global_domain
                    and in_part = ds_part
                    and in_site = ds_shipsite
               no-lock:
                  if in_loc <> "" then
                     ds_loc   = in_loc.
               end.

               /* FIND OUT IF WE NEED TO CHANGE DOMAINS FOR THE      */
               /* RECEIVING SITE                                       */
               ds_db = global_db.

               for first si_mstr
                  fields(si_domain si_db)
                  where si_domain = global_domain
                    and si_site = ds_site
               no-lock: end.

               change_db = (si_db <> ds_db).

               if change_db then do:
                  /* SWITCH TO THE RECEIVING SITE DB */
                  {us/bbi/gprun.i ""gpmdas.p"" "(input si_db, output err-flag)"}

                  /* IF THE RECEIVING SITE DB IS NOT AVAILABLE, UNDO AND*/
                  /* LEAVE THE DETAIL LOOP.                             */
                  if err-flag <> 0 then do:
                     /* DOMAIN # IS NOT AVAILABLE */
                     {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=si_db}
                     undo loopc, leave loopc.
                  end.
               end.

               /* GET DEFAULT RECEIPT LOCATION FROM THE RCV'ING SITE */
               {us/bbi/gprun.i ""dsdomt2b.p""
                        "(input  ds_part,
                          input  ds_site,
                          output rcpt_loc)"}

               if change_db then do:
                  /* SWITCH DOMAIN ALIAS BACK TO ORIGINAL SITE DB  */
                  {us/bbi/gprun.i ""gpmdas.p"" "(input ds_db, output err-flag)"}

                  /* IF ORIGINAL SITE DB (SHIPPING SITE DB) IS NOT   */
                  /* AVAILABLE WHILE SWITCHING BACK THEN UNDO, LEAVE */
                  /* THE UPDATE LOOP.                                */
                  if err-flag <> 0 then do:
                     /* DOMAIN # IS NOT AVAILABLE */
                     {us/bbi/pxmsg.i &MSGNUM=6137 &ERRORLEVEL=4 &MSGARG1=ds_db}
                     undo loopc, leave loopc.
                  end.
               end.

               if dss_shipsite = dss_rec_site then  /*Q9028*/
                  rcpt_loc = dss_shipvia.           /*Q9028*/

               do on error undo, retry with frame e
                  on endkey undo loopc, retry loopc:

                  display
                     ds_status
                  with frame e.

                  update
                     order_date
                     sales_job
                     rcpt_loc
                  with frame e.
                  /*>>Q9028*/
                  if dss_shipsite = dss_rec_site then do:
                     if not can-find(first loc_mstr 
		                     where loc_domain = global_domain
                                     and loc_site   = dss_rec_site
                                     and loc_loc    = rcpt_loc) 
	             then do:
                        {us/bbi/pxmsg.i &MSGNUM=10508 &ERRORLEVEL=3}
                        next-prompt rcpt_loc with frame e.
                        undo, retry.
                     end.
                  end.
                  /*<<Q9028*/
               end.

               hide frame e.

               /* DETERMINE IF SUPPLIER PERFORMANCE IS INSTALLED */
               if can-find (mfc_ctrl where
                            mfc_domain = global_domain and
                            mfc_field = "enable_supplier_perf" and
                            mfc_logical) and
                  can-find (_File where _File-name = "vef_ctrl")
               then do:
                  /* IF SUPPLIER PERFORMANCE IS INSTALLED CALL A SUB- */
                  /* PROGRAM TO POP-UP SUPPLIER PERFORMANCE WINDOW TO */
                  /* GATHER PERFORMANCE DATE AND SUBCONTRACT TYPE     */
                  {us/bbi/gprun.i ""dsdmve.p""
                           "(input ?,
                             input recid(ds_det))"}
               end.

            end.   /* IF NOT AVAIL ds_det */

            else do:
               if dss_shipsite <> ds_shipsite then do:
                  /* REQUISITION SHIPPING SITE # */
                  {us/bbi/pxmsg.i &MSGNUM=1611 &ERRORLEVEL=3 &MSGARG1=ds_shipsite}
                  undo, retry.
               end.

               /* REQUISITION DESTINATION SITE # */
               {us/bbi/pxmsg.i &MSGNUM=1612 &ERRORLEVEL=3 &MSGARG1=ds_site}
               undo, retry.
            end.
         end. /* IF NOT AVAIL ds_det */

         else do:
            ds_db = global_db.

            for first si_mstr
               fields(si_domain si_db)
               where si_domain = global_domain
                 and si_site = ds_site
            no-lock: end.

            change_db = (si_db <> ds_db).
         end.

         prev_qty_all = ds_qty_all + ds_qty_pick.

         find pt_mstr where pt_domain = global_domain and
                            pt_part = ds_part
         no-lock no-error.

         display
            ds_req_nbr
            ds_part
            ds_qty_ord.

         if available pt_mstr then
            display
               pt_desc1
               pt_um.

         if ds_nbr = "" then do:
            /* FIND THE LINE NUMBER (ds_line) FOR THE LAST REQ ATTACHED  */
            do for dsdet:
               for last dsdet
                  fields(ds_domain ds_nbr ds_shipsite ds_line)
                  where dsdet.ds_domain = global_domain
                    and dsdet.ds_nbr = dss_nbr
                    and dsdet.ds_shipsite = dss_shipsite
               no-lock
               use-index ds_nbr:
                  last_dsline = dsdet.ds_line + 1.
               end.

               if not available dsdet then
                  last_dsline = 1.
            end. /* DO FOR dsdet */

            /* ATTACHING REQUISITION TO DIST ORDER */
            {us/bbi/pxmsg.i &MSGNUM=1601 &ERRORLEVEL=1}
            assign
               ds_fr_list = dss_fr_list
               ds_line = last_dsline
               ds_nbr = dss_nbr.

         /* CALCULATE FREIGHT WHEN EXISTING INTERSITE REQUEST ATTACHED */
         for first pt_mstr
            where pt_domain = global_domain
            and pt_part     = ds_part
            no-lock:
             /* INITIALIZE FREIGHT VALUES */
            assign
               ds_fr_class = pt_fr_class
               ds_fr_wt_um = pt_ship_wt_um.
            if calc_fr
            then
               ds_fr_wt = pt_ship_wt.
         end. /* FOR FIRST pt_mstr */

      end. /* IF ds_nbr = "" */

         assign
            ststatus = stline[2]
            detail_all = no.
         status input ststatus.

         /* SEE IF ANY DETAIL ALLOCATIONS EXIST */
         if can-find (first lad_det  where
                            lad_domain = global_domain
                        and lad_dataset = "ds_det"
                        and lad_nbr  = ds_req_nbr
                        and lad_line = ds_site
                        and lad_part = ds_part
                        and lad_site = ds_shipsite)
         then do:

            assign
               detail_all = yes.

            /* Check if Item, Site & Location Combination is restricted */
            if lookup(execname, "dsdomt.p,dsdomt02.p") > 0
            then do:

               for each lad_det
                  where lad_domain  = global_domain
                    and lad_dataset = "ds_det"
                    and lad_nbr     = ds_req_nbr
                    and lad_line    = ds_site
                    and lad_part    = ds_part
                    and lad_site    = ds_shipsite.

                  empty temp-table ttUpdateRestrictionSignature.
                  create ttUpdateRestrictionSignature.

                  assign
                     ttUpdateRestrictionSignature.category          = {&DOMT}
                     ttUpdateRestrictionSignature.program           = execname
                     ttUpdateRestrictionSignature.part              = ds_part
                     ttUpdateRestrictionSignature.site              = ds_shipsite
                     ttUpdateRestrictionSignature.siteTo            = ds_site
                     ttUpdateRestrictionSignature.location          = lad_loc
                     ttUpdateRestrictionSignature.locationTo        = ?
                     ttUpdateRestrictionSignature.inventoryStatus   = ?
                     ttUpdateRestrictionSignature.inventoryStatusTo = ?
                     ttUpdateRestrictionSignature.account           = ?
                     ttUpdateRestrictionSignature.subAccount        = ?
                     ttUpdateRestrictionSignature.costCenter        = ?
                     ttUpdateRestrictionSignature.project           = ?
                     ttUpdateRestrictionSignature.changeInventoryStatus = ?.

                  if isUpdateRestricted(input table ttUpdateRestrictionSignature,
                                        input yes)
                  then do:
                     undo loopc, retry loopc.
                  end. /* if isUpdateRestricted */
               end. /* for each lad_det */
            end. /* if execname = "dsdomt.p" or execname = "dsdomt02.p" */
            /* Finish check if Item, Site & Location Combination is restricted */
         end. /* if can-find (lad_det ..) */
         else do:

            /* Check if Item, Site & Location Combination is restricted */
            if lookup(execname, "dsdomt.p,dsdomt02.p") > 0
            then do:

               empty temp-table ttUpdateRestrictionSignature.
               create ttUpdateRestrictionSignature.

               assign
                  ttUpdateRestrictionSignature.category          = {&DOMT}
                  ttUpdateRestrictionSignature.program           = execname
                  ttUpdateRestrictionSignature.part              = ds_part
                  ttUpdateRestrictionSignature.site              = ds_shipsite
                  ttUpdateRestrictionSignature.siteTo            = ds_site
                  ttUpdateRestrictionSignature.location          = ds_loc
                  ttUpdateRestrictionSignature.locationTo        = ?
                  ttUpdateRestrictionSignature.inventoryStatus   = ?
                  ttUpdateRestrictionSignature.inventoryStatusTo = ?
                  ttUpdateRestrictionSignature.account           = ?
                  ttUpdateRestrictionSignature.subAccount        = ?
                  ttUpdateRestrictionSignature.costCenter        = ?
                  ttUpdateRestrictionSignature.project           = ?
                  ttUpdateRestrictionSignature.changeInventoryStatus = ?.

               if isUpdateRestricted(input table ttUpdateRestrictionSignature,
                                     input yes)
               then do:
                  undo loopc, retry loopc.
               end. /* if isUpdateRestricted */
            end. /* if execname = "dsdomt.p" or execname = "dsdomt02.p" */
            /* Finish check if Item, Site & Location Combination is restricted */
         end. /* else if can-find (lad_det .....) */

         display
            ds_qty_conf
            ds_qty_all
            ds_qty_pick
            ds_qty_ship
            ds_trans_id
            ds_shipdate
            detail_all
            ds_due_date
            ds_git_site
            ds_project
            ds_order_category
            ds_fr_list
            true when  (ds_cmtindx <> 0) @ ds-cmmts
            false when (ds_cmtindx = 0)  @ ds-cmmts
         with frame d.

         do on error undo, retry with frame d:

            l_prev_ds_status = ds_status.
            run get_ds_open_qty (buffer ds_det,
                                 output l_prev_ds_qty).

            del-yn = no.

            set
               ds_qty_conf
               ds_qty_all
               detail_all
               ds_trans_id
               ds_shipdate
               ds_due_date
               ds_git_site
               ds_project
               ds_order_category
               ds_fr_list when (use-log-acctg)
               ds-cmmts
            go-on ("F5" "CTRL-D")
            with frame d.

            /* DELETE */
            if lastkey = keycode("F5") or lastkey = keycode("CTRL-D") then do:

               /* CHECK IF THIS REQUISITION IS LINKED TO A SHIPPER. */
               /* IN THIS CASE DELETE WILL NOT BE ALLOWED           */
               assign l_conf_ship     = 0
                      l_shipper_found = 0.

               {us/bbi/gprun.i ""dssddelb.p""
                  "(input ds_det.ds_nbr,
                    input ds_det.ds_req_nbr,
                    input-output l_shipper_found,
                    input-output l_save_abs,
                    input-output l_conf_ship,
                    input-output l_conf_shid)"}

               if l_shipper_found > 0
               then do:
                  l_save_abs   = substring(l_save_abs,2,20).

                  /* # SHIPPERS/CONTAINERS EXISTS FOR ORDER, INCLUDING # */
                  {us/bbi/pxmsg.i
                     &MSGNUM = 1118
                     &ERRORLEVEL = 3
                     &MSGARG1 = l_shipper_found
                     &MSGARG2 = l_save_abs}

                  /* DO NOT ALLOW TO DELETE ORDER LINE, IF UNCONFIRMED */
                  /* SHIPPER EXISTS                                    */
                  undo, retry.

               end. /* IF L_SHIPPER_FOUND > 0 */

               /* IF ALL THE SHIPPERS FOR THE ORDER HAVE BEEN CONFIRMED  */
               /* DISPLAY WARNING AND ALLOW TO DELETE ORDER              */
               else if l_conf_ship > 0
               then do:
                  l_conf_shid = substring(l_conf_shid,2,20).
                  /* # CONFIRMED SHIPPERS EXIST FOR ORDER, INCLUDING # */
                  {us/bbi/pxmsg.i
                     &MSGNUM = 3314
                     &ERRORLEVEL = 2
                     &MSGARG1 = l_conf_ship
                     &MSGARG2 = l_conf_shid}
                  /* PAUSING FOR USER TO SEE THE MESSAGE */
                  if not batchrun then
                     pause.
               end. /* IF L_CONF_SHIP > 0 */

               del-yn = yes.

               /* PLEASE CONFIRM DELETE */
               {us/bbi/pxmsg.i &MSGNUM=11 &ERRORLEVEL=1 &CONFIRM=del-yn}
               if not del-yn then
                  undo, retry.
            end.

            /* DELETING IN THIS PROGRAM AT THIS POINT MEANS TO DETACH THE    */
            /* INTERSITE REQUEST FROM THE DISTRIBUTION ORDER.                */
            if del-yn then do:
               if ds_qty_pick <> 0 or ds_qty_ship <> 0 then do:
                  /* CANNOT DELETE NON-ZERO QTY PICKED OR SHIPPED*/
                  {us/bbi/pxmsg.i &MSGNUM=978 &ERRORLEVEL=3}
                  undo, retry.
               end.

               if can-find (first lad_det
                               where lad_domain  = global_domain
                               and   lad_dataset = "ds_det"
                               and   lad_nbr     = ds_req_nbr
                               and   lad_line    = ds_site
                               and   lad_part    = ds_part
                               and   lad_site    = ds_shipsite)
               then do:
                  /* CANCEL DETAIL ALLOCATIONS? */
                  {us/bbi/pxmsg.i &MSGNUM = 10094 &CONFIRM = del-yn}
               end. /* IF CAN-FIND (FIRST lad_det ...) */

               if not del-yn
               then do:
                  /* NO RECORDS DELETED */
                  {us/bbi/pxmsg.i &MSGNUM = 10451 &ERRORLEVEL = 1 &MSGARG1 = "No"}
                  undo, retry.
               end. /* IF NOT del-yn */

               assign
                 l_totladqtyall  = 0
                 l_totladqtypick = 0.

               /* DELETE ALLOCATION DETAIL */
               for each lad_det
                  where lad_domain  = global_domain
                  and   lad_dataset = "ds_det"
                  and   lad_nbr     = ds_req_nbr
                  and   lad_line    = ds_site
                  and   lad_part    = ds_part
                  and   lad_site    = ds_shipsite
               exclusive-lock:

                  assign
                     l_totladqtyall  = l_totladqtyall  + lad_qty_all
                     l_totladqtypick = l_totladqtypick + lad_qty_pick.

                  for first ld_det
                     where ld_domain = global_domain
                     and   ld_site   = lad_site
                     and   ld_loc    = lad_loc
                     and   ld_part   = lad_part
                     and   ld_lot    = lad_lot
                     and   ld_ref    = lad_ref
                  exclusive-lock:
                     ld_qty_all = ld_qty_all - lad_qty_all - lad_qty_pick.
                  end. /* FOR FIRST ld_det */

                  delete lad_det.

               end. /* FOR EACH lad_det */

               assign
                  ds_qty_all  = 0
                  ds_qty_pick = 0.

               if prev_qty_all > (l_totladqtyall + l_totladqtypick)
               then
                  l_totladqtyall = prev_qty_all.

               /* REVERSE ALLOCATION QTY FROM INVENTORY MASTER */
               if (l_totladqtyall + l_totladqtypick) <> 0
               then do:

                  for first in_mstr
                     where in_domain = global_domain
                     and   in_part   = ds_part
                     and   in_site   = ds_shipsite
                  exclusive-lock:
                     in_qty_all = in_qty_all - (l_totladqtyall + l_totladqtypick).
                  end. /* FOR FIRST in_mstr */

               end. /* IF (l_totladqtyall + l_totladqtypick) <> 0 */

               /* IF LOGISTICS ACCOUNTING IS ENABLED */
               if use-log-acctg then do:
                  assign
                     ref = ds_nbr
                     substring(ref, 9, 8) = ds_shipsite.

                  /* DELETE LOGISTICS ACCOUNTING tx2d_det RECORDS FOR DO LINE */
                  {us/gp/gprunmo.i &module = "LA" &program = "lataxdel.p"
                             &param  = """(input '42',
                                           input ref,
                                           input ds_line)"""}
                  for each lacod_det where
                           oid_order_line = oid_ds_det exclusive-lock:
                     delete lacod_det.
                  end.
               end. /* IF use-log-acctg */

               /* SET ds_line TO ZERO WHEN DELETING REQUISTION FROM THE ORDER */
               assign
                  ds_nbr = ""
                  ds_line = 0.

               /* REQUISITION DELETED FROM DIST ORDER */
               {us/bbi/pxmsg.i &MSGNUM=1602 &ERRORLEVEL=1}

               /* RESET REQUISITION STATUS BACK TO EXPLODED AFTER DETACHING */
               if ds_qty_all = 0 and ds_qty_pick = 0 then
                  ds_status = "E".

               clear frame d no-pause.
               clear frame c no-pause.

            end.
            else do:
               assign
                  global_lang = dss_lang
                  global_type = ""
                  ds_recno = recid(ds_det).

               /* VALIDATE ds_order_category AGAINST GENERALIZED CODES */
               if not ({gpcode.v ds_order_category "line_category"})
               then do:
                  /* VALUE MUST EXIST IN GENERALIZED CODES */
                  {us/bbi/pxmsg.i &MSGNUM=716 &ERRORLEVEL=3}
                  if batchrun
                  then
                     undo mainloop,leave mainloop.

                  next-prompt ds_order_category with frame d.
                  undo, retry.
               end. /* IF NOT gpcode.v ds_order_category */

               /* IF LOGISTICS ACCOUNTING IS ENABLED */
               if use-log-acctg and ds_fr_list <> "" then do:

                  /* VALIDATE FREIGHT PARAMETERS */
                  {us/gp/gprunmo.i  &module = "LA" &program = "dsdofrt.p"
                              &param = """(buffer dss_mstr,
                                           buffer ds_det,
                                           input pt_um,
                                           output err_nbr,
                                           output severity,
                                           output err_arg1,
                                           output err_arg2,
                                           output err_arg3)"""}

                  if err_nbr <> 0 then do:
                     {us/bbi/pxmsg.i &MSGNUM  = err_nbr &ERRORLEVEL = severity
                              &MSGARG1 = err_arg1
                              &MSGARG2 = err_arg2
                              &MSGARG3 = err_arg3}
                     next-prompt ds_fr_list with frame d.
                     if severity = 3 or severity = 4 then
                        undo, retry.
                     else if not (batchrun or {us/bbi/gpiswrap.i}) then pause.
                  end.
               end.  /* use-log-acctg */

               if not can-find(first tm_mstr where
                                     tm_domain = global_domain
                                 and tm_code = ds_trans_id)
               then do:
                  /* TRANSPORTATION MASTER DOES NOT EXIST */
                  {us/bbi/pxmsg.i &MSGNUM=1503 &ERRORLEVEL=3}
                  next-prompt ds_trans_id with frame d.
                  undo, retry.
               end.


               /* INVENTORY ALLOCATIONS */
/*c1347*  start added code */
               if dss_shipsite = dss_rec_site
	       and dss__chr02 <> ""
	       then do:

		  /********************************************/
		  /* for unloading vans force allocation from */
		  /* the selected van location                */
		  /********************************************/
                  run vanalloc(recid(ds_det), dss__chr02).
	       end.  /* if dss_shipsite = dss_rec_site  .. */
	       else do:
/*c1347*  end   added code */
               {us/bbi/gprun.i ""dsdoall.p""
                        "(input detail_all,
                          input (if ds_qty_conf entered then true
                                 else false),
                          input prev_qty_all)"}

/*c1347*/      end. /*  if dss_shipsite = dss_rec_site  .. else ... */
               /* TO CHECK QTY CONFIRMED IS NOT LESS THAN ALLOCATED + */
               /* PICKED + SHIPPED FOR GENERAL AND DETAIL ALLOCATION */

               if ((ds_qty_all + ds_qty_pick + ds_qty_ship > ds_qty_conf )or
                  ((totpkqty + totallqty > ds_qty_conf) and
                  (totpkqty    <> 0 or
                   totallqty   <> 0 )))
               then do:
                  /* QTY CONFIRMED CANNOT BE < ALLOC + PICKED + SHIPPED */
                  {us/bbi/pxmsg.i &MSGNUM=4576 &ERRORLEVEL=3}
                  next-prompt ds_qty_conf.
                  undo, retry.
               end. /* IF ds_qty_conf < ds_qty_all */

               if ds-cmmts then do:
                  assign
                     cmtindx = ds_cmtindx
                     global_ref = ds_part.

                  /* ENTER COMMENTS */
                  {us/bbi/gprun.i ""gpcmmt01.p"" "(input ""ds_det"")"}
                  ds_cmtindx = cmtindx.

                  view frame a.
                  view frame c.
                  view frame d.
               end.

               if ds_qty_ord >= 0 then
                  open_qty = max(ds_qty_conf - max(ds_qty_ship, 0), 0).
               else
                  open_qty = min(ds_qty_conf - min(ds_qty_ship, 0), 0).

               if ds_status <> "C" then
                  ds_status = "A".
               else
                  open_qty = 0.

               /* MRP WORKFILE UPDATE */
               {us/mf/mfmrw.i "ds_det"
                  ds_part
                  ds_req_nbr
                  ds_shipsite
                  ds_site
                  ?
                  ds_shipdate
                  open_qty
                  "DEMAND"
                  INTERSITE_DEMAND
                  ds_shipsite}

            end.   /* ELSE del-yn */

            /* UPDATE in_qty_req */
            if del-yn = no  and ds_status <> "C" then do:

               /* LOGIC TO UPDATE THE QUANTITY REQUIRED AT THE SHIPPING */
               /* SITE WHEN THE STATUS IS UNCHANGED.                    */

               if l_new_dsdet
                  and ds_status = "A"
               then do:

                  find first in_mstr
                     where in_domain = global_domain
                     and   in_part   = ds_part
                     and   in_site   = ds_shipsite
                  exclusive-lock no-error.
                  if available in_mstr
                  then
                     in_qty_req = in_qty_req + open_qty.

                  l_new_dsdet = no.
               end. /* IF l_new_dsdet ... */
               else do:
                  run update_in_qty_req
                     (input l_prev_ds_status,
                      input l_prev_ds_qty,
                      input ds_status,
                      input open_qty,
                      input ds_part,
                      input ds_shipsite).
               end. /* IF NOT l_new_dsdet ... */
            end. /* IF del-yn ... */

            assign
               ds_recno = recid(ds_det)
               ds_db    = global_db
               undo-all = true.

            run set_git_acct (input recid(ds_det)).

            /* UPDATE dsd_det RECORD FOR REQUESTING SITE */
            {us/bbi/gprun.i ""dsdmmtv1.p""
                     "(input l_ds_date)"}

            if undo-all then
               undo.

         end. /* DO ON ERROR ... */
      end. /* TRANSACTION  */
      release ds_det.
   end. /* REPEAT WITH FRAME C*/

   /* IF LOGISTICS ACCOUNTING IS ENABLED */
   if use-log-acctg     and
      dss_fr_list <> "" and
      dss_fr_terms <> "" and
      can-find (first ds_det where
                      ds_domain = global_domain and
                      ds_nbr = dss_nbr and
                      ds_fr_list <> "" )
   then do transaction on error undo, retry:

      for first ft_mstr
         fields(ft_domain ft_lc_charge ft_accrual_level)
          where ft_domain = global_domain
            and ft_terms = dss_fr_terms
      no-lock:

         if (ft_accrual_level = {&LEVEL_Shipment} or
             ft_accrual_level = {&LEVEL_Line})
         then do:

            hide frame c.

            {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                        &param = """(input 'DELETE',
                                     input '{&TYPE_DO}',
                                     input dss_nbr,
                                     input dss_shipsite,
                                     input ' ',
                                     input ' ',
                                     input no,
                                     input no)"""}

            /* DISPLAY LOGISTICS CHARGE CODE DETAIL */
            {us/gp/gprunmo.i  &module = "LA" &program = "laosupp.p"
                        &param = """(input 'ADD',
                                     input '{&TYPE_DO}',
                                     input dss_nbr,
                                     input dss_shipsite,
                                     input ft_lc_charge,
                                     input ft_accrual_level,
                                     input yes,
                                     input yes)"""}
            if use-log-acctg = TRUE then do:
               {us/bbi/gprun.i ""lacamts.p""
                  "(input global_domain,
                    input '',
                    input dss_nbr,
                    input '{&TYPE_DO}',
                    input dss_shipsite)"}.
             end.
         end. /* IF AVAILABLE ft_mstr */
      end. /* FOR FIRST ft_mstr */

      /* FREIGHT CALCULATION */
      {us/gp/gprunmo.i  &module = "LA" &program = "dsfrcalc.p"
                  &param = """(input dss_recno)"""}

      /* CREATE TAX RECORDS FOR FREIGHT ACCRUAL */
      {us/gp/gprunmo.i  &module = "LA" &program = "lafrtax.p"
                  &param  = """(input dss_shipsite,
                                input '{&TYPE_DO}',
                                input (if dss_due_date <> ? then
                                          dss_due_date
                                       else dss_created),
                                input (if dss_due_date <> ? then
                                          dss_due_date
                                       else dss_created),
                                input base_curr,
                                input 1,
                                input 1,
                                input ' ',  /* EX_RATE_TYPE */
                                input 0,    /* EXRU_SEQ */
                                input no)"""}
   end. /* IF use-log-acctg and  */

   /* IF IMPORT EXPORT FLAG IS SET TO YES CALL THE IMPORT EXPORT     */
   /* CREATE ROUTINE TO CREATE ie_mstr ied_det AND UPDATE  ie_mstr   */
   if impexp then do:
      assign imp-okay   = no
             dss_ie_nbr = string(dss_nbr, "x(8)")
                        + string(dss_shipsite,"x(8)").
      hide frame d.

      {us/bbi/gprun.i ""iemstrcr.p"" "(input ""4"",
        input dss_ie_nbr,
        input recid(dss_mstr),
        input-output imp-okay )"}
   end.

   /*IF IMPORT-EXPORT FLAG IS SET TO YES, CALL THE IMPORT-EXPORT */
   /* DETAIL LINE MAINTENANCE PROGRAM FOR USER TO UPDATE ied_det */
   if not batchrun and impexp and active_mod then do:
      impexp_edit = no.
      {us/bbi/pxmsg.i &MSGNUM=271
               &ERRORLEVEL=1
               &CONFIRM = impexp_edit}
      if impexp_edit then do:
         hide all no-pause.
         view frame dtitle.
         view frame a.
         upd_okay = no.
         {us/bbi/gprun.i ""iedmta.p"" "(input ""4"",
           input dss_ie_nbr,
           input-output upd_okay )"}
      end.
   end.

   assign
      l_dss_rec_site = dss_rec_site
      l_dss_shipvia  = dss_shipvia
      ds_db          = global_db.

   for first si_mstr 
      where si_domain = global_domain 
      and   si_site   = dss_rec_site
   no-lock:
   end. /* FOR FIRST si_mstr */

   if available si_mstr
   then do:
      change_db = (si_db <> ds_db).

      if change_db then do:
         {us/bbi/gprun.i ""gpmdas.p"" "(input si_db, output err-flag)"}
         if impexp and err-flag = 0 then do:
            imp-okay = no.

            {us/bbi/gprun.i ""iemstdor.p""
            "(input dss_ie_nbr,
              input l_dss_rec_site,
              input l_dss_shipvia,
              input-output imp-okay )"}
         end.
         if not batchrun and impexp and active_mod and err-flag = 0 then do:
            impexp_edit = no.
            {us/bbi/pxmsg.i &MSGNUM=271
                     &ERRORLEVEL=1
                     &CONFIRM = impexp_edit}
            if impexp_edit then do:
               hide all no-pause.
               view frame dtitle.
               view frame a.
               upd_okay = no.
               {us/bbi/gprun.i ""iedmta.p"" "(input ""4"",
                 input dss_ie_nbr,
                 input-output upd_okay )"}
            end.
         end.
         {us/bbi/gprun.i ""gpmdas.p"" "(input ds_db, output err-flag)"}
      end. /* IF change_db */
   end. /* IF AVAILABLE si_mstr */

   hide frame c no-pause.

   if auto_do_proc then
      leave mainloop.

   /* TO AVOID LOCKING OF IN_MSTR */
   release in_mstr.
   /* TO AVOID LOCKING OF DSS_MSTR */
   release dss_mstr.
end. /* mainloop */

delete procedure hUpdateRestrictedLibrary no-error.

status input.

/***************** INTERNAL PROCEDURES *********************/

PROCEDURE set_git_acct:
/* -------------------------------------------------------------
   Purpose: This internal procedure gets the GL Goods In Transit
   Account and Cost Center and assigns it to ds_git_acct
   and ds_git_cc.
   ----------------------------------------------------------------*/

   define input  parameter ds_recno  as   recid        no-undo.

   define variable git_acct  like si_git_acct  no-undo.
   define variable git_sub   like si_git_sub   no-undo.
   define variable git_cc    like si_git_cc    no-undo.

   find first ds_det where recid(ds_det) = ds_recno exclusive-lock.

   for first pt_mstr
      fields(pt_domain pt_part pt_prod_line)
      where pt_domain = global_domain and
            pt_part = ds_part
   no-lock: end.

   if available pt_mstr then do:
      for first pld_det
         fields(pld_domain pld_prodline pld_site pld_loc
                pld_inv_acct pld_inv_sub pld_inv_cc)
         where pld_domain   = global_domain
           and pld_prodline = pt_prod_line
           and pld_site     = ds_site
           and pld_loc      = ds_trans_id
      no-lock: end.
      if available pld_det and pld_inv_acct <> "" then
         assign
            git_acct = pld_inv_acct
            git_sub  = pld_inv_sub
            git_cc   = pld_inv_cc.
      else do:
         for first pld_det
            fields(pld_domain pld_prodline pld_site pld_loc
                   pld_inv_acct pld_inv_sub pld_inv_cc)
            where pld_domain = global_domain
              and pld_prodline = pt_prod_line
              and pld_site     = ds_site
              and pld_loc      = ""
         no-lock: end.
         if available pld_det and pld_inv_acct <> "" then
            assign
               git_acct = pld_inv_acct
               git_sub  = pld_inv_sub
               git_cc   = pld_inv_cc.
         else do:
            for first pl_mstr
               fields(pl_domain pl_prod_line
                      pl_inv_acct pl_inv_sub pl_inv_cc)
               where pl_domain = global_domain
                 and pl_prod_line = pt_prod_line
            no-lock: end.
            if available pl_mstr and pl_inv_acct <> "" then
               assign
                  git_acct = pl_inv_acct
                  git_sub  = pl_inv_sub
                  git_cc   = pl_inv_cc.
            else do:
               for first si_mstr
                  fields(si_domain si_site
                         si_git_acct si_git_sub si_git_cc)
                  where si_domain = global_domain
                    and si_site = ds_site
               no-lock: end.
               if available si_mstr and si_git_acct <> "" then
                  assign
                     git_acct = si_git_acct
                     git_sub  = si_git_sub
                     git_cc   = si_git_cc.
               else do:
                  for first gl_ctrl
                     fields(gl_domain gl_inv_acct gl_inv_sub gl_inv_cc)
                     where gl_domain = global_domain
                  no-lock: end.
                  if available gl_ctrl then
                     assign
                        git_acct = gl_inv_acct
                        git_sub  = gl_inv_sub
                        git_cc   = gl_inv_cc.
               end. /* ELSE OF IF AVAILABLE SI_MSTR */

            end. /* ELSE OF IF AVAILABLE PL_MSTR */

         end. /* ELSE OF IF AVAILABLE PLD_DET */

      end. /* ELSE OF IF AVAILABLE PLD_DET */

   end. /* IF AVAILABLE PT_MSTR */

   assign
      ds_git_acct = git_acct
      ds_git_sub  = git_sub
      ds_git_cc   = git_cc.

END PROCEDURE. /* PROCEDURE SET_GIT_ACCT */

PROCEDURE getNextDO:
/* -------------------------------------------------------------
   Purpose: This internal procedure gets the next Distribution
   Order number from  the control file.
   ----------------------------------------------------------------*/

   define input-output parameter donbr like dss_nbr no-undo.

   {us/mf/mfnctrlc.i
   "drp_domain = global_domain"
   "drp_domain"
   "dss_domain = global_domain"
   drp_ctrl
   drp_nbr_pre
   drp_nbr
   dss_mstr
   dss_nbr
   donbr}

   display
      donbr @ dss_nbr
   with frame a.

END PROCEDURE. /* PROCEDURE getNextDO */

PROCEDURE find_dss_mstr:
/* -------------------------------------------------------------
   Purpose: This internal procedure finds dss_mstr record and
   returns the available status.
   ----------------------------------------------------------------*/

   define input parameter p_nbr like dss_nbr no-undo.
   define input parameter p_shipsite like dss_shipsite no-undo.
   define output parameter got_dss_mstr like mfc_logical no-undo.

   got_dss_mstr = false.

   for first dss_mstr
      where dss_domain   = global_domain
        and dss_nbr      = p_nbr
        and dss_shipsite = p_shipsite
   no-lock:
      assign
         dss_recid = recid(dss_mstr)
         got_dss_mstr = true.
   end.

END PROCEDURE. /* PROCEDURE find_dss_mstr */

PROCEDURE create_dss_mstr:
/* -------------------------------------------------------------
   Purpose: This internal procedure creates dss_mstr record.
   ----------------------------------------------------------------*/

   define input parameter p_nbr like dss_nbr no-undo.
   define input parameter p_shipsite like dss_shipsite no-undo.

   create dss_mstr.
   assign
      dss_domain = global_domain
      dss_nbr = p_nbr
      dss_shipsite = p_shipsite
      dss_created = today
      dss_due_date = today.

   if recid(dss_mstr) = -1 then .

END PROCEDURE. /* PROCEDURE create_dss_mstr */

PROCEDURE get_rec_site:
/* -------------------------------------------------------------
   Purpose: This internal procedure accepts user input
   for Ship-To/Receiving Site.
   ----------------------------------------------------------------*/

   find dss_mstr where recid(dss_mstr) = dss_recid exclusive-lock.

   continue = false.

   do on error undo, retry:
      prompt-for dss_rec_site with frame a
      editing:
         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i si_mstr dss_rec_site  "si_domain = global_domain and
         si_site "
            dss_rec_site si_site si_site}

         if recno <> ? then do:
            dss_rec_site = si_site.
            display dss_rec_site with frame a.
            {us/mf/mfaddisp.i dss_rec_site ship_to}
         end.
      end.

      assign dss_rec_site.

      /* CHECK SITE SECURITY */
      if not {gpsite.v &field = dss_rec_site &blank_ok = no} then do:
         {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3} /* SITE DOES NOT EXIST */
         undo, retry.
      end.

      {us/mf/mfaddisp.i dss_rec_site ship_to}

      continue = true.
   end.  /* ship-to input */
END PROCEDURE. /* PROCEDURE get_rec_site */

/* INCLUDE FILE CONTAINING COMMON PROCEDURES FOR DRP */
{us/ds/dsopnqty.i}
