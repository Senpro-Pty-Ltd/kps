/* xxdomta.p - DISTRIBUTION ORDER MAINTENANCE (SUBPROGRAM)                    */
/* dsdomta.p - DISTRIBUTION ORDER MAINTENANCE (SUBPROGRAM)                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdomta.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/*                                                                            */
/* REVISION: 7.3            CREATED: 02/21/95  BY: srk *G0FL*                 */
/* REVISION: 7.3      LAST MODIFIED: 03/29/95  BY: dzn *F0PN*                 */
/* REVISION: 7.3      LAST MODIFIED: 10/24/95  BU: str *G19V*                 */
/* REVISION: 7.3      LAST MODIFIED: 04/21/97  BY: *G2LN* Russ Witt           */
/* REVISION: 7.3      LAST MODIFIED: 06/24/97  BY: *G2NN* Russ Witt           */
/* REVISION: 7.3      LAST MODIFIED: 07/03/97  BY: *G2NV* Maryjeane Date      */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98  BY: *L007* Annasaheb Rahane    */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98  BY: *K1Q4* Alfred Tan          */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98  BY: *J314* Alfred Tan          */
/* REVISION: 9.1      LAST MODIFIED: 08/13/99  BY: *L0GR* G.Latha             */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00  BY: *N08T* Annasaheb Rahane    */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00  BY: *N0KK* Jacolyn Neder       */
/* REVISION: 9.1      LAST MODIFIED: 09/21/00  BY: *N0W6* BalbeerS Rajput     */
/* Revision: 1.7.1.8         BY: Vandna Rohira     DATE: 05/25/01 ECO: *M18J* */
/* Revision: 1.7.1.10        BY: Robin McCarthy    DATE: 07/31/01 ECO: *P009* */
/* Revision: 1.7.1.11        BY: Ed van de Gevel   DATE: 12/03/01 ECO: *N16R* */
/* Revision: 1.7.1.17        BY: Manish Kulkarni   DATE: 05/01/02 ECO: *P042* */
/* Revision: 1.7.1.18        BY: Robin McCarthy    DATE: 07/03/02 ECO: *P08Q* */
/* Revision: 1.7.1.19        BY: Robin McCarthy    DATE: 07/15/02 ECO: *P0BJ* */
/* Revision: 1.7.1.20    BY: Robin McCarthy     DATE: 11/08/02 ECO: *P0JS* */
/* Revision: 1.7.1.22    BY: Paul Donnelly (SB) DATE: 06/26/03 ECO: *Q00B* */
/* Revision: 1.7.1.23    BY: Ed van de Gevel    DATE: 03/04/04 ECO: *P1S0* */
/* Revision: 1.7.1.24    BY: Ed van de Gevel    DATE: 03/07/05 ECO: *R00K* */
/* Revision: 1.7.1.25    BY: Andrew Dedman      DATE: 10/05/05 ECO: *R021* */
/* Revision: 1.7.1.26    BY: Samit Patil        DATE: 08/14/06 ECO: *P51D* */
/* $Revision: 1.2 $ BY: Cristobal Bravo    DATE: 12/18/09 ECO: *R1VW* */
/* CYB    LAST MODIFIED: 02-OCT-2012    BY:  gbg *c1347*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB      LAST MODIFIED: 2015-01-27  BY: gbg *c1520*                        */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/*V8:ConvertMode=Maintenance                                                  */

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}   /* EXTERNAL LABEL INCLUDE */
{us/bbi/cxcustom.i "DSDOMTA.P"}
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
/*c1347*/ {us/xx/xxkpvar.i new}
/*c1347*/ {us/xx/xx1347.i}

define new shared variable undo_dsdomtp like mfc_logical no-undo.

define shared variable del-req like mfc_logical no-undo.
define shared variable del-yn like mfc_logical.
define shared variable dss_recno as recid.
define shared variable go_back_to_main as logical.
define shared variable ds_recno as recid.
define shared variable ds_db like dc_name.
define shared variable undo-all like mfc_logical.
define shared variable dsscmmts like drp_dcmmts label "Comments".
define shared variable calc_fr like mfc_logical label "Calculate Freight"
   no-undo.
define shared variable disp_fr like mfc_logical label "Display Weight" no-undo.
define shared variable new_order     like mfc_logical.

define variable blank-char as character.
define variable totladqtyall like lad_qty_all no-undo.
define variable totladqtypick like lad_qty_pick no-undo.
define variable use-log-acctg as logical no-undo.
define variable ref like tx2d_ref no-undo.

define variable old_db   like global_db no-undo.
define variable ord_nr   as character   no-undo.
define variable err-flag as integer     no-undo.
define shared variable impexp   like mfc_logical
   label "Imp/Exp" no-undo.
define shared variable active_mod  like mfc_logical no-undo.
define        variable dss_ie_nbr  as   character   no-undo.
define        variable l_ds_date   like ds_due_date no-undo.

define variable l_conf_ship                as   integer     no-undo.
define variable l_conf_shid                like abs_par_id  no-undo.
define variable l_shipper_found            as   integer     no-undo.
define variable l_save_abs                 like abs_par_id  no-undo.

define shared frame b.
{&DSDOMTA-P-TAG1}
/* FRAME B DEFINITION */
/*c1347*  {us/ds/dsdofmb.i} */
/*c1347*/ {us/xx/xxdofmb.i}
{&DSDOMTA-P-TAG2}

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

{us/up/updaterestriction.i}

/* Start Update Restriction Library running Persistantly */
run mfairunh.p (input "mgurpl.p",
                input ?,
                output hUpdateRestrictedLibrary).


find dss_mstr where recid(dss_mstr) = dss_recno.

/* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
{us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}

order-header:
do on error undo, retry with frame b:

   ststatus = stline[2].
   status input ststatus.
   assign
      del-req = no
      del-yn = no.

   find first iec_ctrl  where iec_ctrl.iec_domain = global_domain no-lock no-error.
   if available iec_ctrl and iec_impexp = yes then impexp = yes.
   else impexp = no.
   if impexp and new_order = false then do:
      dss_ie_nbr = string(dss_nbr, "x(8)")
                 + string(dss_shipsite, "x(8)").
      find ie_mstr
         where ie_domain = global_domain
           and ie_type = "4"
           and ie_nbr  = dss_ie_nbr
      no-lock no-error.
      if not available ie_mstr then impexp = no.
      release ie_mstr.
   end.
   else if impexp and new_order = true then do:
      {us/bbi/gprun.i ""ieckcty2.p""
      "(input dss_rec_site, input dss_shipsite, input '4', output impexp)"}
      if not impexp then do:
         {us/bbi/gprun.i ""ieckcty2.p""
         "(input dss_shipsite, input dss_rec_site, input '4', output impexp)"}
      end.
   end.

   display
      dss_created
      dss_shipdate
      dss_due_date
      dss_po_nbr
      dss_fob
      dss_shipvia
      dss_rmks
      dss_lang
      dsscmmts
/*c1347*/ dss__chr02
/*c1520* /*c1347*/ " " when (dss_shipsite = dss_rec_site) @ dss__chr02  */
/*c1520*/ " " when (dss_shipsite <> dss_rec_site) @ dss__chr02 
      dss_bol
      dss_status
      impexp
   with frame b.

   {&DSDOMTA-P-TAG3}   /* USED FOR LOCALIZATIONS */
   setb:
   do on error undo, retry:

      {&DSDOMTA-P-TAG4}   /* USED FOR LOCALIZATIONS */
      set
         dss_created
         dss_shipdate
         dss_due_date
         dss_rmks
         dss_lang
         dsscmmts
/*c1347*/ dss__chr02 when (dss_shipsite = dss_rec_site)
         dss_po_nbr
         dss_fob
         dss_shipvia
         dss_bol
         impexp
         dss_status
      go-on ("F5" "CTRL-D").
      {&DSDOMTA-P-TAG5}   /* USED FOR LOCALIZATIONS */

      /* DELETE */
      if lastkey = keycode("F5") or lastkey = keycode("CTRL-D")
      then do:

         for each ds_det where ds_domain   = global_domain
                           and ds_nbr      = dss_nbr
                           and ds_shipsite = dss_shipsite
                           and ds_site     = dss_rec_site
                           no-lock:

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
               undo setb, retry setb.

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
         end. /* FOR EACH ds_det */

         del-yn = yes.
         /* PLEASE CONFIRM DELETE */
         {us/bbi/pxmsg.i &MSGNUM = 11 &ERRORLEVEL = 1
                  &CONFIRM = del-yn
                  &CONFIRM-TYPE = 'LOGICAL'}

         if not del-yn then
            undo, retry.

         for first ds_det
            fields( ds_domain ds_nbr      ds_qty_all ds_qty_pick ds_qty_ship
                   ds_shipsite ds_site    ds_status)
             where ds_det.ds_domain = global_domain and (  ds_nbr      = dss_nbr
            and   ds_shipsite = dss_shipsite
            and  (ds_qty_pick <> 0 or ds_qty_ship <> 0)
            ) no-lock:
         end. /* FOR FIRST ds_det */

         if available ds_det then do:
            /* CANNOT DELETE, NON-ZERO QTY PICKED OR SHIPPED */
            {us/bbi/pxmsg.i &MSGNUM = 978 &ERRORLEVEL = 3}
            undo, retry.
         end.
      end.

      if del-yn then do:
         /* DELETE ATTACHED INTERSITE REQUESTS? */
         {us/bbi/pxmsg.i &MSGNUM = 4558 &ERRORLEVEL = 1
                  &CONFIRM = del-req
                  &CONFIRM-TYPE = 'LOGICAL'}

         /*** DELETE ORDER ***/
         for each ds_det
         exclusive-lock use-index ds_nbr
          where ds_det.ds_domain = global_domain and  ds_nbr = dss_nbr
         and ds_shipsite = dss_shipsite
         and ds_site = dss_rec_site:

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
                  undo order-header, retry order-header.
               end.
            end. /* if execname = "dsdomt.p" or execname = "dsdomt02.p" */

            if not del-req then do:
               ds_nbr = "".
               if ds_qty_all = 0 and ds_qty_pick = 0 then
                  ds_status = "E".
            end.

            /* IF LOGISTICS ACCOUNTING IS ENABLED */
            if use-log-acctg then do:
               assign
                  ref = dss_nbr
                  substring(ref, 9, 8) = dss_shipsite.

               /* DELETE LOGISTICS ACCOUNTING tx2d_det RECORDS FOR DO LINE */
               {us/gp/gprunmo.i &module = "LA" &program = "lataxdel.p"
                          &param  = """(input '42',
                                        input ref,
                                        input ds_line)"""}
            end. /* IF use-log-acctg */

            assign
               ds_recno = recid(ds_det)
               ds_db = global_db
               undo-all = true.

            /* UPDATE dsd_det RECORD FOR REQUESTING SITE */
            {us/bbi/gprun.i ""dsdmmtv1.p""
                     "(input l_ds_date)"}
            if undo-all then
               undo.

            if del-req then do:

               assign
                  totladqtyall  = 0
                  totladqtypick = 0.

               /* DELETE MRP RECORDS */
               {us/mf/mfmrwdel.i "ds_det"
                   ds_part ds_req_nbr ds_shipsite ds_site}

               /* RESET MRP REQUIRED FLAG TO YES */
               {us/in/inmrp.i &part=ds_part &site=ds_shipsite}

               /* DELETE ALLOCATION DETAIL */
               for each lad_det  where lad_det.lad_domain = global_domain and
               lad_dataset = "ds_det"
               and lad_nbr = ds_req_nbr
               and lad_line = ds_site
               and lad_part = ds_part
               and lad_site = ds_shipsite exclusive-lock:

                  assign
                     totladqtyall  = totladqtyall  + lad_qty_all
                     totladqtypick = totladqtypick + lad_qty_pick.

                  for first ld_det  where ld_det.ld_domain = global_domain and
                  ld_site = lad_site
                  and ld_loc = lad_loc
                  and ld_part = lad_part
                  and ld_lot = lad_lot
                  and ld_ref = lad_ref exclusive-lock:
                     ld_qty_all = ld_qty_all - lad_qty_all - lad_qty_pick.
                  end.

                  delete lad_det.
               end.

               if ds_qty_all > totladqtyall then
                  totladqtyall = ds_qty_all.

               /* REVERSE ALLOCATION QTY FROM INVENTORY MASTER */
               if (totladqtyall + totladqtypick) <> 0 then do:
                  for first in_mstr  where in_mstr.in_domain = global_domain
                  and  in_part = ds_part
                  and in_site = ds_shipsite exclusive-lock:
                     in_qty_all = in_qty_all - (totladqtyall + totladqtypick).
                  end.
               end.

               /* DELETE DETAIL COMMENTS */
               for each cmt_det exclusive-lock  where cmt_det.cmt_domain =
               global_domain and  cmt_indx = ds_cmtindx:
                  delete cmt_det.
               end.

               delete ds_det.

            end.   /* IF  del-req */

         end. /* FOR EACH ds_det */

         for each cmt_det exclusive-lock  where cmt_det.cmt_domain =
         global_domain and  cmt_indx = dss_cmtindx:
            delete cmt_det.
         end.

         /* IF LOGISTICS ACCOUNTING IS ENABLED */
         if use-log-acctg then do:
            assign
               ref = dss_nbr
               substring(ref, 9, 8) = dss_shipsite.

            /* DELETE ALL LOGISTICS ACCOUNTING tx2d_det RECORDS FOR DO */
            {us/gp/gprunmo.i &module = "LA" &program = "lataxdel.p"
                       &param  = """(input '42',
                                     input ref,
                                     input 0)"""}

            /* DELETE lacd_det RECORD FOR THIS DO */
            {us/gp/gprunmo.i &module = "LA" &program = "laosupp.p"
                       &param  = """(input 'DELETE',
                                     input '{&TYPE_DO}',
                                     input dss_nbr,
                                     input dss_shipsite,
                                     input ' ',
                                     input ' ',
                                     input no,
                                     input no)"""}
         end. /* IF use-log-acctg */
         {&DSDOMTA-P-TAG6}
         assign
            old_db = global_db
            ord_nr = string(dss_nbr,"x(8)") + string(dss_shipsite,"x(8)").

         {us/bbi/gprun.i ""iedodel.p"" "(input ord_nr)"}

         find si_mstr where si_domain = global_domain and si_site = dss_rec_site
         no-lock no-error.
         if si_db <> global_db then do:
            {us/bbi/gprun.i ""gpmdas.p"" "(input si_db, output err-flag)"}
            if err-flag = 0 then do:
               {us/bbi/gprun.i ""iedodel.p"" "(input ord_nr)"}
            end.
            {us/bbi/gprun.i ""gpmdas.p"" "(input old_db, output err-flag)"}
         end.

         delete dss_mstr.

         go_back_to_main = true.
         leave.
      end. /* IF del-yn */

      else do:

/*c1347* start added code */
         if dss__chr02 = ? 
	 or dss_shipsite <> dss_rec_site
	 then dss__chr02 = "".
	 if dss__chr02 <> ""
	 then do:
            if not dss__chr02 begins "V"
	    or not can-find(first loc_mstr
	                    where loc_domain = global_domain
			    and   loc_site = dss_shipsite
			    and   loc_loc = dss__chr02)
	    then do:
	      kpMessage = "Must be a van location".
	      {us/bbi/pxmsg.i &MSGTEXT=kpMessage &ERRORLEVEL=3}
              undo setb, retry setb.
	    end.
	 end.
/*c1347* end   added code */
         if dss_shipdate = ? and dss_due_date = ? then
            dss_shipdate = today.

         if dss_due_date = ? and dss_shipdate <> ? then do:
            /* CALCULATE EXPECTED ARRIVAL DATE AT RECEIVING SITE */
            {us/bbi/gprun.i ""dsdate03.p""
                     "(input dss_shipsite,
                       input dss_rec_site,
                       input dss_shipvia,
                       input blank-char,
                       input dss_shipdate,
                       output dss_due_date)"}
         end.

         if dss_shipdate = ? and dss_due_date <> ? then do:
            /* CALCULATE NECESSARY SHIPMENT DATE FROM SOURCE */
            /* (DSS_SHIPDATE @ DSS_SHIPSITE) */
            {us/bbi/gprun.i ""dsdate02.p""
                     "(input dss_shipsite,
                       input dss_rec_site,
                       input dss_shipvia,
                       input blank-char,
                       input dss_due_date,
                       input-output dss_shipdate)"}
         end.

         display
            dss_shipdate
            dss_due_date.

         pause 0.

         /* IF LOGISTICS ACCOUNTING IS ENABLED */
         if use-log-acctg then do:
            hide frame b.

            assign
               undo_dsdomtp = true
               calc_fr = no
               disp_fr = yes.

            if new_order then
               calc_fr = yes.

            /* PROMPT FOR FREIGHT DATA */
            {us/gp/gprunmo.i &module="LA" &program="dsdomtp.p"
                       &param="""(input recid(dss_mstr),
                                  input true)"""}

            if undo_dsdomtp then
               undo setb, retry setb.
         end.  /* IF use-log-acctg */
      end.
   end. /*setb*/

   undo-all = false.
end. /* ORDER HEADER */
