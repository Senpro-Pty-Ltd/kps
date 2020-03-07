/* xxauis.p  - Shipper auto create - Main program                             */
/* rcauis.p  - Shipper auto create - Main program                             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxauis.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* REVISION: 9.1            CREATED: 04/01/00   BY: *N0B5* Vinay Nayak-Sujir  */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KP* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/05/00   BY: *N0R9* Mudit Mehta        */
/* Revision: 1.4     BY: Jean Miller        DATE: 03/22/01 ECO: *P008*        */
/* Revision: 1.5     BY: Narathip W.        DATE: 05/22/03 ECO: *P0S8*        */
/* Revision: 1.7     BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00K*        */
/* Revision: 1.8     BY: Bharath Kumar      DATE: 09/23/04 ECO: *P2LB*        */
/* Revision: 1.9     BY: Shivanand H        DATE: 01/27/05 ECO: *P35N*        */
/* Revision: 1.10    BY: Preeti Sattur      DATE: 03/15/05 ECO: *P3CL*        */
/* Revision: 1.11       BY: Manish Dani          DATE: 04/08/05  ECO: *P3DM*  */
/* Revision: 1.11.1.1   BY: Deirdre O'Brien      DATE: 08/24/05  ECO: *R01P*  */
/* Revision: 1.13       BY: Deirdre O'Brien      DATE: 09/30/05  ECO: *R021*  */
/* Revision: 1.14       BY: Sumit Karunakaran    DATE: 08/03/07  ECO: *P5HV*  */
/* Revision: 1.15       BY: Jean Miller          DATE: 09/13/07  ECO: *R0C6*  */
/* Revision: 1.17       BY: Jean Miller          DATE: 02/19/08  ECO: *P5LS*  */
/* Revision: 1.18       BY: Nan Zhang            DATE: 06/04/08  ECO: *R0JS*  */
/* Revision: 1.19       BY: Rajalaxmi Ganji      DATE: 07/23/08  ECO: *P6Y1*  */
/* Revision: 1.20       BY: Yizhou Mao           DATE: 12/05/08  ECO: *R18K*  */
/* Revision: 1.23       BY: Jean Miller          DATE: 04/01/09  ECO: *R1G2*  */
/* Revision: 1.24       BY: Jordan Fei           DATE: 06/18/09  ECO: *R1J1*  */
/* Revision: 1.26       BY: Jordan Fei           DATE: 07/30/09  ECO: *R1N2*  */
/* $Revision: 1.2 $    BY: Yiqing Chen      DATE: 04/28/10  ECO: *R1Z0*  */
/* CYB                    BY: nac               DATE: 26 May 10 ECO: *Q9021* */
/* CYB                    BY: nac               DATE: 26 May 10 ECO: *cy1006* */
/* CYB                    BY: gbg            DATE: 09-JUL-2010 ECO: *c1184*  */
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                    */
/* CYB    LAST MODIFIED: 27-JUL-2011    BY:  nac *c1226*                     */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 15-FEB-2012    BY:  gbg *c1275*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 30-MAY-2013    BY:  gbg *c1415*                     */
/* CYB    LAST MODIFIED: 17-JUN-2013    BY:  gbg *c1418*                     */
/* CYB    LAST MODIFIED: 02-AUG-2013    BY:  gbg *c1426*                     */
/* CYB    LAST MODIFIED: 09-AUG-2013    BY:  gbg *c1432*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
{us/mf/mfdtitle.i}
{us/gp/gpldcons.i} /* CONSTANTS FOR LEGAL DOCUMENT */
{us/px/pxmaint.i}
{us/px/pxphdef.i paicxr}
/*c1226*/ {us/xx/xxauis2.i "NEW"}
/*c1418*/ def new shared var outboth        as logical initial yes.
/*c1418*/ def new shared var outtype        as logical.
/*Q9021*/
define new shared variable cyb_van like so_shipvia label "Van" no-undo.
define new shared variable cyb_van1 like so_shipvia. 
define new shared variable abs_recid as recid.
define new shared variable shipvia like so_shipvia.
define new shared variable shipvia1 like so_shipvia.
/*Q9021*/
/*cy1045*/ define new shared variable print_inv like mfc_logical 
                                label "Print Invoices"  no-undo.
/*c1226*/  define var prt_width as integer.
def new shared var gvproofofdelivery   like mfc_logical label "Proof of Delivery".

define variable shippernum  like abs_id label "Number" no-undo.
define variable shippernum1 like abs_id no-undo.
define variable shipfrom    like abs_shipfrom label "Ship-From" no-undo.
define variable shipfrom1   like abs_shipfrom no-undo.
define variable shipto      like abs_shipto label "Ship-To/Dock" no-undo.
define variable shipto1     like abs_shipto no-undo.
define variable range       as   character no-undo.
define variable range1      as   character no-undo.
define variable invmov      like abs_inv_mov no-undo.
define variable invmov1     like abs_inv_mov no-undo.
 
define variable pick_ship      like mfc_logical format "Pre-Shipper/Shipper"
                               label "Pre-Shippers/Shippers" initial true no-undo.
define variable ship_date      like so_ship_date no-undo.
define variable eff_date       as   date label "Effective" no-undo.
define variable shipper_processed_ok like mfc_logical
                                     format "Confirmed/Failed" no-undo.
define variable print_only     like mfc_logical label "Print Selection Only" no-undo.
define variable consol_inv     like mfc_logical label "Consolidate Invoices"  no-undo.
define new shared variable post_inv       like mfc_logical label "Post Invoice"  no-undo.
define variable preshipper     like mfc_logical format "P/" no-undo.
 
define variable err_file      as character  no-undo.
define variable junk_file     as character  no-undo.
define variable l_post_file   as character  no-undo.
define variable errfile_created like mfc_logical no-undo.
define variable l_invpost     as    logical no-undo.
define variable allowToIssue as logical no-undo.

/* CUSTOMIZED SECTION FOR VERTEX BEGIN */
define variable l_vtx_message   like mfc_logical initial no no-undo.
define variable l_cont          like mfc_logical initial no no-undo.
define variable l_api_handle      as handle                 no-undo.
define variable l_vq_reg_db_open  as logical     initial no no-undo.
define variable result-status     as integer                no-undo.
/* CUSTOMIZED SECTION FOR VERTEX END */
 
define new shared variable document like tr_doc_id label "Document".
 
define buffer babs_mstr for abs_mstr.
define temp-table tt_message no-undo
   field tt_msg       as character
   field tt_type      as integer.
 
define temp-table ttisb no-undo
   field ttisb_so      as   character format "x(8)"
   field ttisb_line    as   integer
   field ttisb_cmaddr  as   character format "x(8)"
   field ttisb_euaddr  as   character format "x(8)"
   field ttisb_level   as   character format "x(8)"
   field ttisb_part    as   character format "x(18)"
   field ttisb_serial  as   character format "x(18)"
   field ttisb_no      as   character format "x(8)"
   field ttisb_desc    as   character format "x(60)"
   field ttisb_newser  as   character format "x(8)".
 
define variable l_post_noupdate   like mfc_logical initial no no-undo.
 
define variable hBlockedTransactionLibrary as handle       no-undo.
define variable lBlockedTransactionError   as logical      no-undo.
define variable lRestricted                as logical      no-undo.
define variable l_prtInstBase   like mfc_logical 
                                label "Print ISB Details" no-undo.
 
/* Global Shipping */
define variable c_ld_form_code like df_ld_form_code no-undo.
define variable c_seq_id       like lgdnr_seq_id    no-undo.
define variable l_elec         like lgdnr_elec      no-undo.
define variable l_allowed      as   logical         no-undo.
define variable l_dis_message  as   logical         no-undo.
define variable c_message      as   character       no-undo.
define variable l_temp as character no-undo.
define temp-table tt_abs_id no-undo
   field c_abs_shipfrom like abs_shipfrom
   field c_abs_id       like abs_id.
 
/* Blocked Transaction common library prototypes */
{us/mg/mgbltrpl.i "hBlockedTransactionLibrary"}
 
/*update restrictions module*/
{us/up/updaterestriction.i}
 
form
   shipfrom       colon 25
   shipfrom1      colon 52 label "To"
   shipto         colon 25
   shipto1        colon 52 label "To"
   shippernum     colon 25
   shippernum1    colon 52 label "To"
   invmov         colon 25
   invmov1        colon 52 label "To"
/*c1184*/ cyb_van colon 25 
/*c1184*/ cyb_van1 colon 52 label "To"
   pick_ship      colon 43 skip(1)
   post_inv       colon 43
   l_prtInstBase  colon 43
   consol_inv     colon 43 skip(1)
/*cy1045*/ print_inv colon 43
/*c1415*/ gvproofofdelivery colon 43
   ship_date      colon 43
   eff_date       colon 43 
   document       colon 43
   print_only     colon 43
with frame a side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
form
   preshipper   format "x(22)" no-label
   abs_id       label "Number"
   abs_shipfrom label "Ship-From"
 
   abs_shipto   label "Ship-To/Dock"
   abs_inv_mov
   shipper_processed_ok no-label
with frame succfail width 80 down.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame succfail:handle).
 
form
   c_message  format "x(70)" no-label
   skip(1)
with frame pb width 80.
 
form
   l_temp no-label
   tt_message.tt_msg no-label view-as editor
   INNER-CHARS 65 INNER-LINES 1
with frame ferr width 170 down.
 
/*c1184*/ {us/rc/rcwabsdf.i new}
assign
   ship_date   = today
   eff_date    = today
   print_only  = yes.
 
/* Shipper control file settings */
run ip_get_ctrl_defaults.
 
/* Get names of files used to capture output */
run ip_gen_filenames
   (output err_file,
    output junk_file,
    output l_post_file).
 
empty temp-table ttisb.
 
mainloop:
repeat:
 
   if shippernum1 = hi_char then shippernum1 = "".
   if shipto1 = hi_char then shipto1 = "".
   if shipfrom1 = hi_char then shipfrom1 = "".
   if invmov1 = hi_char then invmov1 = "".
/*c1184*/   if cyb_van1 = hi_char then cyb_van1 = "".
/*cy1045*/ print_inv = yes.
/*c1415*/ gvproofofdelivery = yes.
/*c1418*/ print_inv = no.
/*c1415*/ gvproofofdelivery = no.
 
   document = "".

   /* PERFORM SECURITY CHECK FOR ACCESS OF INVOICE POST MENU */
   for first mnd_det where mnd_exec = "soivpst.p"
   no-lock:
      /* API Check to see if Resource is Allowed */
      {us/gp/gprunp.i "gpmenupl" "p" "checkResourceSecurity"
         "(input mnd_det.mnd_uri,
           input false,
           output l_invpost)"}
   end. /* IF AVAILABLE mnd_det */
 
   /* DISBABLE UPDATE TO INVOICE POST FLAG WHEN SELF */
   /* BILLING IS ENABLED BUT INTEGRATE WITH AR IS NO */
 
   if can-find(sbic_ctl
       where sbic_domain  = global_domain
       and   sbic_active  = yes)
   then do:
       if can-find(soc_ctrl
           where  soc_domain = global_domain
           and    soc_ar     = no)
       then
          assign
             post_inv        = no
             l_post_noupdate = yes.
 
   end. /* IF CAN-FIND(sbic_ctl) */
 
   if l_invpost = no then
      post_inv  = no.
 
   update
      shipfrom shipfrom1
      shipto shipto1
      shippernum shippernum1
      invmov invmov1
/*c1184*/ cyb_van cyb_van1
      pick_ship
      post_inv    when (not l_post_noupdate
                        and l_invpost = yes)
      l_prtInstBase when (not l_post_noupdate
                        and l_invpost = yes)
      consol_inv  when (l_invpost = yes)
/*cy1045*/ print_inv
/*c1415*/  gvproofofdelivery
      ship_date
      eff_date
      document
      print_only
   with frame a.
   l_post_noupdate = no.
 
   if post_inv
   then do:
      /* VERIFY GL BEFORE POSTING */
      if can-find(gl_ctrl
         where gl_domain = global_domain
           and gl_verify = false)
      then do:
         /* CANNOT EXECUTE INVOICE POST */
         {us/bbi/pxmsg.i &MSGNUM=6671 &ERRORLEVEL=4}
         next-prompt post_inv with frame a.
         next mainloop.
      end.
 
   end.
 
   if search("shipper.err") <> ?
   then
      os-delete shipper.err.
 
   /* CUSTOMIZED SECTION FOR VERTEX BEGIN */
 
   /* RUN vqregopn.p TO SEE IF VERTEX SUTI API IS RUNNING, */
   /* AND THEN OPEN REGISTER DB                            */
 
   /* TRY AND FIND VERTEX TAX API'S PROCEDURE HANDLE. */
   {us/gp/gpfindph.i vqapi l_api_handle}
 
   /* IF THERE IS NO PROCEDURE HANDLE WE ARE DONE. */
   if  post_inv
   and not print_only
   and l_api_handle <> ?
   then do:
 
      {us/bbi/gprun.i ""vqregopn.p"" "(output result-status)"}
      hide message.
 
      if result-status = 0
      then
         l_vq_reg_db_open = yes.
 
      if  result-status <> 0
      and not batchrun
      then do:
 
         /* INVOICES WILL POST TO MFG/PRO BUT NOT UPDATE THE VERTEX REGISTER */
         {us/bbi/pxmsg.i &MSGNUM=8880 &ERRORLEVEL=1}
 
         /* CONTINUE WITH INVOICE POST? */
         {us/bbi/pxmsg.i &MSGNUM=8881 &ERRORLEVEL=1 &CONFIRM=l_cont}
         if  l_cont = no
         then
            undo, retry.
 
      end. /* IF  result-status <> 0... */
 
      if result-status <> 0
      then
         l_vtx_message = yes.
 
   end. /* IF l_api_handle */
   /* CUSTOMIZED SECTION FOR VERTEX END  */

/*c1226*/ if print_inv
/*c1226*/ and not print_only
/*c1226*/ then do:
/*c1226*/     repeat:
/*c1226*/       /* Show print setings frame */
/*c1226*/       {us/so/soprstfr.i &New="new"
                  &ShowFrame=yes
                  &ParentFrame=a
                  &PrintTax=yes
                  &PrintWidth=prt_width}
/*c1226*/       if keyfunction(lastkey) = "end-error" then leave.
/*c1226*/       run prunsetvars.
/*c1226*/       {us/bbi/gprun.i ""xxauis2b.p""}
/*c1226*/       if keyfunction(lastkey) = "end-error" then leave.
/*c1226*/       {us/bbi/gprun.i ""xxauis2a.p"" "(output invprinter)"}
/*c1226*/       leave.
/*c1226*/     end.
/*c1226*/     if keyfunction(lastkey) = "end-error" then undo mainloop, leave mainloop.
/*c1226*/ end.


 
   run preprocessSelection.
 
   /* output DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer" &printWidth = 80
               &pagedFlag = " "
               &stream = " "
               &appendToFile = " "
               &streamedoutputToTerminal = " "
               &withBatchOption = "yes"
               &displayStatementType = 1
               &withCancelMessage = "yes"
               &pageBottomMargin = 6
               &withEmail = "yes"
               &withWinprint = "yes"
               &defineVariables = "yes"}
   {us/bbi/mfphead.i}
 
   if pick_ship then
      assign
         range  = "p" + shippernum
         range1 = "p" + shippernum1.
   else
      assign
         range  = "s" + shippernum
         range1 = "s" + shippernum1.
 
   /* Set Blocked Transaction Library running persistently */
   run mfairunh.p
      (input "mgbltrpl.p",
       input ?,
       output hBlockedTransactionLibrary).
 
   /* Set the Update Restriction Library to run persistently */
   run mfairunh.p
      (input "mgurpl.p",
       input ?,
       output hUpdateRestrictedLibrary).
 
   l_dis_message = no.
 
   procloop:
   for each abs_mstr
      where abs_mstr.abs_domain = global_domain
       and  abs_shipfrom >= shipfrom and abs_shipfrom <= shipfrom1
       and  abs_shipto >= shipto and abs_shipto <= shipto1
       and  abs_inv_mov >= invmov and abs_inv_mov <= invmov1
       and  abs_id >= range and abs_id <= range1
   no-lock break by abs_id:



/*c1184*  start added code */

      for each work_abs_mstr exclusive-lock:
         delete work_abs_mstr.
      end.
      abs_recid = recid(abs_mstr).

      /* Explode shipper to get order detail. This creates
      a copy of the shipper and its child records in work_abs_mstr */
      {us/bbi/gprun.i ""rcsoisa.p"" "(input abs_recid)"}

      for each work_abs_mstr no-lock:

         find first so_mstr no-lock
         where so_domain = global_Domain
         and   so_nbr = work_abs_mstr.abs_order
         no-error.
/*c1275* start added code */
	 if available so_mstr
	 then do:
             for each sod_Det exclusive-lock
	     where sod_Domain = so_domain
	     and   sod_nbr = so_nbr:
                  sod__dec02 = sod_qty_ord.
	     end.
	 end.
/*c1275*  <<<<< */
         if available so_mstr
         and (so_shipvia < cyb_van or so_shipvia > cyb_van1)
         then 
	    next procloop.
      end.
/*c1184*  end   added code */




      /* Filter out the NON-SO shippers */
      if abs_inv_mov <> "" and
         not can-find
         (first im_mstr  where im_mstr.im_domain = global_domain and
             im_inv_mov = abs_inv_mov and
             (im_tr_type = "ISS-SO" or im_tr_type = "ISS-COR"))
      then do:
         next procloop. /* NOT A SALES ORDER SHIPPER */
      end.  /* if abs_inv_mov */
          
      /*
      * Check to see if the shipper has any blocked transactions for
      * its customers
      */
      run checkShipperForBlockedTransactions in hBlockedTransactionLibrary
         (input oid_abs_mstr,
          input abs_shipto,
          input {&SO008},
          input false, /* don't display message */
          output lBlockedTransactionError).
 
      /* If one of the customers is blocked then raise an error */
      if lBlockedTransactionError
      then do:
         next procloop.
      end.
 
      /* Check to see if the shipper has any restricted sales orders */
      run checkShipperForRestrictions in hUpdateRestrictedLibrary
         (input  oid_abs_mstr,
          input  {&SOSHP},
          input  false,
          input  hBlockedTransactionLibrary,
          output lRestricted).
 
      /* If any of the sales orders are restricted then undo */
      if lRestricted
      then do:
         next procloop.
      end.
 
      /* Check this shipper comfirmation has pending invoice
         limitation or not */
      {us/gp/gprunp.i "soldxr" "p" "checkPendingInvoiceByShipper"
                "(input abs_shipfrom,
                  input abs_id,
                  input eff_date,
                  output l_allowed)"}
      if not l_allowed
      then do:
         l_dis_message = yes.
         next procloop.
      end.
 
      assign
         errfile_created = no
         shipper_processed_ok = no.
 
      {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}
 
      procblock:
      do:
 
         /* If it is confirmed already */
         if substring(abs_status,2,1) = "Y" then do:
            /* Shipper previously confirmed */
            if print_only then
               run ip_msg (8146, 4).
            next procloop.
         end.
 
         if not print_only
         then do:
 
            {us/px/pxrun.i &PROC = 'allowIssueWithoutSerializationInSoShipper'
                           &PROGRAM='paicxr.p'
                           &HANDLE = ph_paicxr
                           &PARAM = "(input abs_shipfrom,
                                      input abs_id,
                                      output allowToIssue)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
 
            if allowToIssue then do:

/*cy1021*/     empty temp-table ttOrdersProcessed.
/*c1432*/      empty temp-table ttLinesProcessed.

/*c1432*       {us/bbi/gprun.i ""rcauis01.p"" */
/*c1432*/      {us/bbi/gprun.i ""xxauis01.p""
                  "(input abs_shipfrom,
                    input abs_id,
                    input ship_date,
                    input eff_date,
                    input post_inv,
                    input consol_inv,
                    input err_file,
                    input junk_file,
                    input no,         /* UPDATE DAYBOOK SET ? */
                    input '',
                    input l_post_file, /* FILE NAME TO SAVE INVOICE POSTING ERRORS */
                    input l_prtInstBase, /* PRINT INSTALL BASE REPORT */
                    output shipper_processed_ok,
                    output table ttisb)"}

            end.

/*debug*   {us/gp/gpwait.i &INCLUDEPAUSE} */
/*cy1021*/  {us/bbi/gprun.i ""xxcloseords.p""}
/*c1432*/   {us/bbi/gprun.i ""xxaulad.p""}

            /* Because control has been thru rcauis01.p, error file
             * must have been created */
            errfile_created = yes.
 
            /* Global Shipping */
            if shipper_processed_ok then
            do:
               /* save abs_id for later Legal Doc printing */
               create tt_abs_id.
               assign
                  tt_abs_id.c_abs_shipfrom = abs_shipfrom
                  tt_abs_id.c_abs_id       = abs_id.
               if recid(tt_abs_id) = ? then.
 
               for each lgd_mstr where lgd_domain = global_domain
                  and lgd_type       = yes
                  and lgd_status     = {&LD_CONFIRMED}
                  and lgd_shipper_id = abs_id
               exclusive-lock:
                  if lgd_effdate = ? then
                     lgd_effdate   = eff_date.
 
                  assign
                     lgd_ship_date  = ship_date.
                  run updateLDHist(input substring(abs_id, 2),
                                   input lgd_mstr.lgd_nbr,
                                   input lgd_mstr.oid_lgd_mstr).
 
               end.
 
            end. /* if shipper_processed_ok */
 
         end. /* IF not print_only */
 
      end. /* procblock */
 
      {us/gp/gprunp.i "soldxr" "p" "updateLegalNumToUnpostedGL"}
 
      /* Do the necessary printing */
      run ip_report
         (input recid(abs_mstr)).
 
      if l_prtInstBase
      then
         run p_printISBOutput.
 
   end. /* procloop */
 
   /* Tidy up the persistent procedure now that we are finished */
   delete procedure hBlockedTransactionLibrary no-error.
 
   /* Display a warning message to let user know pending invoice
      limitation for shipper comfirmation */
   if l_dis_message then
      /* Failed to confirm shipper(s), post any pending invoice first */
      {us/bbi/pxmsg.i &MSGNUM=10653 &ERRORLEVEL=2 &MSGBUFFER=c_message}
      display c_message
         with frame pb.
 
   /* CUSTOMIZED SECTION FOR VERTEX BEGIN */
   if l_vtx_message
   then do:
 
      /* DISPLAY A MESSAGE IN THE AUDIT TRAIL */
 
      /* API FUNCTION FAILURE. VERTEX REGISTER DB DID NOT UPDATE. */
      {us/bbi/pxmsg.i &MSGNUM=8882 &ERRORLEVEL=1}
 
      /* VERIFY THE DATA IN THE VERTEX REGISTER. */
      {us/bbi/pxmsg.i &MSGNUM=8883 &ERRORLEVEL=1}
 
   end. /* IF l_vtx_message */
   /* CUSTOMIZED SECTION FOR VERTEX END */
 
   {us/mf/mfrtrail.i}
 
   /* CUSTOMIZED SECTION FOR VERTEX BEGIN */
   /* CHECK IF VERTEX REGISTER DB WAS OPENED */
   if l_vq_reg_db_open
   then do:
      {us/bbi/gprun.i ""vqregcls.p""}
      l_vq_reg_db_open = no.
   end. /* IF l_vq_reg_db_open */
   /* CUSTOMIZED SECTION FOR VERTEX END */
 
/*c1603* start deleted code >>>>>>>>
   /* Global Shipping: Batch Print Legal Doc */
   if can-find(first tt_abs_id where c_abs_id <> "" or
                                     c_abs_id <> ? no-lock)
   then do:
      {us/bbi/gprun.i ""soldbaprt.p"" "(input table tt_abs_id)"}
   end.
**c1603* end   deleted code <<<<<<< */




 
   hide all no-pause.
   view frame dtitle.
 
end. /* mainloop */
 
/* CUSTOMIZED SECTION FOR VERTEX BEGIN */
/* CHECK IF VERTEX REGISTER DBF WAS OPENED */
if l_vq_reg_db_open
then do:
   {us/bbi/gprun.i ""vqregcls.p""}
   l_vq_reg_db_open = no.
end. /* IF l_vq_reg_db_open */
/*  CUSTOMIZED SECTION FOR VERTEX END */
 
os-delete value(err_file).
os-delete value(junk_file).
 
PROCEDURE ip_report:
/*--------------------------------------------------------------------
  Purpose:      Report results of processing the shipper/pre-shipper
  Parameters:   input abs_recid  - recid of the abs_mstr
  Notes:
---------------------------------------------------------------------*/
   define input parameter abs_recid as recid no-undo.
 
   define variable errornum as integer no-undo.
   define variable warnnum as integer no-undo.
   define variable infonum as integer no-undo.
   define variable msgtext as character no-undo.
 
   define buffer b_abs_mstr for abs_mstr.
 
   procblk:
   do for b_abs_mstr:
 
      for first b_abs_mstr where recid(b_abs_mstr) = abs_recid
      no-lock: end.
 
      if available(b_abs_mstr) then
         preshipper = (abs_id begins "P").
 
      if available b_abs_mstr and length(abs_id) > 1 then
         display
            preshipper
            substring(abs_id,2) @ abs_mstr.abs_id
            abs_shipfrom        @ abs_mstr.abs_shipfrom
            abs_shipto          @ abs_mstr.abs_shipto
            abs_inv_mov         @ abs_mstr.abs_inv_mov
            ""                  @ shipper_processed_ok
         with frame succfail.
      else
         display
            preshipper
            ""  @ abs_mstr.abs_id
            ""  @ abs_mstr.abs_shipfrom
            ""  @ abs_mstr.abs_shipto
            ""  @ abs_mstr.abs_inv_mov
            ""  @ shipper_processed_ok
         with frame succfail.
 
      if print_only = no then
         display
            shipper_processed_ok
         with frame succfail.
 
      down with frame succfail.
 
      if not print_only and allowToIssue then do:
         if errfile_created then do:
            /* Read the messages in the error file, save them in the
             * message temp-table. */
            {us/bbi/gprun.i ""edimerrp.p""
               "(input err_file,
                 input '',
                 input '',
                 input '',
                 input-output table tt_message,
                 input-output errornum,
                 input-output warnnum,
                 input-output infonum)"}
         end. /* if errfile_created */
 
         if can-find (first tt_message)
         then do:
            /* Messages generated during processing */
            {us/bbi/pxmsg.i &MSGNUM=8591 &ERRORLEVEL=1 &MSGBUFFER=msgtext}
            /* Remove trailing "." in the message */
            if substring(msgtext, length(msgtext),1) = "." then
               msgtext = substring(msgtext,1, length(msgtext) - 1).
            display
               msgtext format "x(65)"
            with no-label column 5.
         end.
 
         for each tt_message:
            display
               (if tt_type = 1 then
                  ""
               else
               if tt_type =2 then
                  getTermLabel("WARNING",8)
               else
                  getTermLabel("ERROR",8))
               tt_msg format "x(65)"
            with no-label column 5.
         end.
 
         if search(l_post_file) <> ?
         then do:
            empty temp-table tt_message.
            {us/bbi/gprun.i ""edimerrp.p""
               "(input l_post_file,
                 input '',
                 input '',
                 input '',
                 input-output table tt_message,
                 input-output errornum,
                 input-output warnnum,
                 input-output infonum)"}
 
            if can-find (first tt_message)
            then do:
               for each tt_message:
                  display
                     (if tt_type = 1 then
                        ""
                     else
                     if tt_type =2 then
                        getTermLabel("WARNING",8)
                     else
                        getTermLabel("ERROR",8)) @ l_temp
                     tt_msg
                  with frame ferr no-label column 5.
                  down with frame ferr.
               end. /* FOR EACH tt_message */
            end. /* IF CAN-FIND(FIRST tt_message) */
         end. /* IF SEARCH(l_post_file) */
      end. /* if not print_only  */
 
   end. /* procblk */
 
   for each tt_message exclusive-lock:
      delete tt_message.
   end.
 
   if search(l_post_file) <> ?
   then
      os-delete value(l_post_file).
END PROCEDURE. /* ip_report */
 
PROCEDURE ip_get_ctrl_defaults:
/*--------------------------------------------------------------------
  Purpose:      Get defaults from the shipper control file, create
                record if it does not exist
  Parameters:   <None>
  Notes:
---------------------------------------------------------------------*/
 
   /* Create the control record if they do not exist */
   {us/bbi/gprun.i ""socrshc.p""}
   {us/bbi/gprun.i ""rcpma.p""}
 
   for first mfc_ctrl
      where mfc_ctrl.mfc_domain = global_domain
       and  mfc_field = "rcc_auto_post"
   no-lock:
      post_inv = mfc_logical.
   end.
 
   for first mfc_ctrl
      where mfc_ctrl.mfc_domain = global_domain
       and  mfc_field = "rcc_consolidate"
   no-lock:
      consol_inv = mfc_logical.
   end.
 
END PROCEDURE. /* ip_get_ctrl_defaults */
 
PROCEDURE ip_msg:
/*--------------------------------------------------------------------
  Purpose:      Message Processing routine
  Parameters:
       input:   i_num - error #
       input:   i_stat - severity of error, 1-info, 2-warn, 3&4-error
  Notes:
---------------------------------------------------------------------*/
   define input parameter i_num as integer no-undo.
   define input parameter i_stat as integer no-undo.
 
   define variable msgtext as character no-undo.
 
   /* To prevent the "Error" and "Warning" from being added,
    * we uses status 1. In tt_type save the correct status */
   {us/bbi/pxmsg.i &MSGNUM=i_num &ERRORLEVEL=1 &MSGBUFFER=msgtext}
 
   create tt_message.
   assign
      tt_msg = msgtext
      tt_type = i_stat.
 
   if recid(tt_message) = ? then.
 
END PROCEDURE. /* ip_msg */
 
PROCEDURE ip_gen_filenames:
/*--------------------------------------------------------------------
  Purpose:      Generate filenames
  Parameters:
      output:   err_file - filename capture output to be used later
      output:   junk_file - filename capture output to be discarded
  Notes:
---------------------------------------------------------------------*/
   define output parameter err_file as character no-undo.
   define output parameter junk_file as character no-undo.
   define output parameter p_post_file as character no-undo.
 
   define variable file_prefix as character initial "tmp" no-undo.
   define variable file_ext as character initial ".qad" no-undo.
 
   err_file = file_prefix + string (time, "99999") + file_ext.
   junk_file = file_prefix + string (time + 1, "99999") + file_ext.
   p_post_file = file_prefix + string (time + 2, "99999") + file_ext.
 
END PROCEDURE. /* ip_gen_filenames */
 
 
PROCEDURE preprocessSelection:
/*---------------------------------------------------------------
    Purpose: Quote Selection variables and add hichar
 Parameters: <none>
      Notes:
---------------------------------------------------------------*/
   bcdparm = "".
 
   {us/mf/mfquoter.i shipfrom}
   {us/mf/mfquoter.i shipfrom1}
   {us/mf/mfquoter.i shipto }
   {us/mf/mfquoter.i shipto1}
   {us/mf/mfquoter.i shippernum }
   {us/mf/mfquoter.i shippernum1}
   {us/mf/mfquoter.i invmov}
   {us/mf/mfquoter.i invmov1}
/*c1184*/   {us/mf/mfquoter.i cyb_van}
/*c1184*/   {us/mf/mfquoter.i cyb_van1}
   {us/mf/mfquoter.i pick_ship}
   {us/mf/mfquoter.i post_inv}
   {us/mf/mfquoter.i l_prtInstBase}
   {us/mf/mfquoter.i consol_inv}
/*cy1045*/   {us/mf/mfquoter.i print_inv}
   {us/mf/mfquoter.i ship_date}
   {us/mf/mfquoter.i eff_date}
   {us/mf/mfquoter.i document}
   {us/mf/mfquoter.i print_only}
 
   if shipfrom1   = "" then shipfrom1   = hi_char.
   if shipto1     = "" then shipto1     = hi_char.
   if shippernum1 = "" then shippernum1 = hi_char.
   if invmov1     = "" then invmov1     = hi_char.
/*c1184*/   if cyb_van1     = "" then cyb_van1     = hi_char.
/*cy1045*/ shipvia = cyb_van.
/*cy1045*/ shipvia1 = cyb_van1.
 
   if pick_ship then
      assign
         range  = "p" + shippernum
         range1 = "p" + shippernum1.
   else
      assign
         range  = "s" + shippernum
         range1 = "s" + shippernum1.
 
END PROCEDURE.
 
PROCEDURE p_printISBOutput:
   define variable l_expcount as integer no-undo.
 
   if not can-find(first ttisb) 
   then
      return.
 
   l_expcount = 999.
   page.
 
   if (l_expcount + 4 > page-size) 
   and page-size <>  0 
   then do:
      page.
      put {us/bbi/gplblfmt.i 
             &FUNC=getTermLabel(""INSTALLED_BASE_POST_REPORT"",35)}  at 20
         skip(1).
 
      put 
         getTermLabel("ORDER",8)     format "x(9)"
         getTermLabel("LINE",5)      format "x(6)"
         getTermLabel("CUSTOMER",8)  format "x(9)"
         getTermLabel("END_USER",8)  format "x(9)"
         getTermLabel("LEVEL",8)     format "x(9)"
         getTermLabel("ITEM",18)     format "x(19)"
         getTermLabel("SERIAL",18)   format "x(19)"
         getTermLabel("REFERENCE",8) format "x(9)"
         getTermLabel("DESCRIPTION",12) format "X(12)"
         skip
         "------------------------------------------------------------"
         "---------"
         "------------------------------------------------"
         skip.
      l_expcount = 6.
   end. /* IF (l_expcount + 4 > page-size) */
 
   for each ttisb 
   no-lock:
      put
         ttisb_so      format "x(8)"      " "
         ttisb_line    format "zzz"       "   "
         ttisb_cmaddr  format "x(8)"      " "
         ttisb_euaddr  format "x(8)"      " "
         ttisb_level   format "x(8)"      " "
         ttisb_part    format "x(18)"     " "
         ttisb_serial  format "x(18)"     " "
         ttisb_no      format "x(8)"      " "
         ttisb_desc format "x(" + string(length(ttisb_desc)) + ")"  " "
         ttisb_newser
      skip.
   end. /* FOR EACH ttisb */
   empty temp-table ttisb.
END PROCEDURE.
 
PROCEDURE updateLDHist:
   /* Update transaction history records with the Legal Document ID*/
   define input parameter ShipperID as character no-undo.
   define input parameter LD-ID as character no-undo.
   define input parameter LD-oid as decimal no-undo.
   
   define buffer tr_hist for tr_hist.
   
   for each tr_hist exclusive-lock where
      tr_hist.tr_domain = global_domain and
      tr_hist.tr_ship_id = ShipperID
      use-index tr_shipper:
      if tr_hist.oid_lgd_mstr = LD-oid and
         (tr_hist.tr_doc_id = "" or
          tr_hist.tr_doc_id = ?) then
         tr_hist.tr_doc_id = LD-ID.    
   end.           
   release tr_hist no-error.
END PROCEDURE. /*updateLDHist*/


/*c1226*/ {us/xx/xxauis2a.i} /* Invoice Printing procedure library */





define stream logit.
procedure logit.
def input parameter iptxt as char.
def var logname as char.
logname = entry(num-entries(program-name(1), "~/"), program-name(1), "~/").
logname = entry(1, logname, "~.").
   output stream logit to value("/tmp/" + trim(logname) + ".log") append.
   put stream logit unformatted
   string(program-name(2)) + "|" +
   string(today) + "|" +
   string(time, "HH:MM:SS") + "|" +
   global_userid + "|" +
   iptxt.
   if program-name(3) <> ? then
   put stream logit unformatted
   "|" + string(program-name(3)).
   if program-name(4) <> ? then
   put stream logit unformatted
   "|" + string(program-name(4)).
   put stream logit unformatted
   skip.
   output stream logit close.
   unix value("chmod 666 ~/tmp~/" + trim(logname) + ".log 2~>~/dev~/null").
end.  /* procedure logit */
