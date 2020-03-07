/* xxsomtcm.p - SALES ORDER MAINTENANCE CUSTOMER ENTRY                        */
/* sosomtcm.p - SALES ORDER MAINTENANCE CUSTOMER ENTRY                        */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxsomtcm.p,v 1.2 2018/03/13 17:10:00 gbg Exp $: */
/* REVISION: 7.0      LAST MODIFIED: 06/23/92   BY: afs *F678*                */
/* REVISION: 7.0      LAST MODIFIED: 06/30/92   BY: tjs *F698*                */
/* REVISION: 7.3      LAST MODIFIED: 09/27/92   BY: jcd *G247*                */
/* REVISION: 7.3      LAST MODIFIED: 01/20/93   BY: afs *G573*                */
/* REVISION: 7.3      LAST MODIFIED: 08/31/93   BY: tjs *GE56*                */
/* REVISION: 7.3      LAST MODIFIED: 11/18/93   BY: afs *GH40*                */
/* REVISION: 7.3      LAST MODIFIED: 05/23/94   BY: afs *FM85*                */
/* REVISION: 7.3      LAST MODIFIED: 05/27/94   BY: dpm *FO48*                */
/* REVISION: 7.3      LAST MODIFIED: 09/10/94   BY: bcm *GM05*                */
/* REVISION: 7.3      LAST MODIFIED: 11/01/94   BY: afs *FT20*                */
/* REVISION: 7.3      LAST MODIFIED: 04/10/95   BY: vrn *G0KG*                */
/* REVISION: 8.5      LAST MODIFIED: 08/25/95   BY: *J04C* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 05/13/96   BY: *J0M3* Sue Poland         */
/* REVISION: 8.5      LAST MODIFIED: 07/08/96   BY: *J0YR* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Elke Van Maele     */
/* REVISION: 8.6      LAST MODIFIED: 11/13/96   BY: *J182* Markus Barone      */
/* REVISION: 8.6      LAST MODIFIED: 03/11/97   BY: *J1KT* Meg Mori           */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K07S* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 07/11/97   BY: *K0DH* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 09/29/97   BY: *K0HB* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 09/18/97   BY: *H1FC* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 11/03/97   BY: *J24Z* Surekha Joshi      */
/* REVISION: 8.7      LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.7      LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 11/24/98   BY: *M017* Luke Pokic         */
/* REVISION: 9.0      LAST MODIFIED: 12/03/98   BY: *J2ZM* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 04/13/00   BY: *M0LN* Manish K.          */
/* REVISION: 9.1      LAST MODIFIED: 04/25/00   BY: *N0CG* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 06/14/00   BY: *L0Y4* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 07/03/00   BY: *N0DX* Rajinder Kamra     */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KN* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 12/01/00   BY: *M0XC* Ravikumar K        */
/* REVISION: 9.1      LAST MODIFIED: 10/14/00   BY: *N0WB* Mudit Mehta        */
/* Old ECO marker removed, but no ECO header exists *F039*                    */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *F349*                    */
/* Old ECO marker removed, but no ECO header exists *J10C*                    */
/* Revision: 1.36      BY: Jean Miller           DATE: 08/13/01  ECO: *M11Z*  */
/* Revision: 1.37      By: Jean Miller           DATE: 10/29/01  ECO: *P02K*  */
/* Revision: 1.38      BY: Niranjan R.           DATE: 03/12/02  ECO: *P020*  */
/* Revision: 1.39      BY: Duane Burdette        DATE: 07/02/02  ECO: *N1LX*  */
/* Revision: 1.40      BY: Deepak Rao            DATE: 12/19/02  ECO: *N223*  */
/* Revision: 1.42      BY: Paul Donnelly (SB)    DATE: 06/28/03  ECO: *Q00L*  */
/* Revision: 1.43      BY: Veena Lad             DATE: 02/03/04  ECO: *P1M6*  */
/* Revision: 1.44      BY: Veena Lad             DATE: 03/03/04  ECO: *Q064*  */
/* Revision: 1.45      BY: Gaurav Kerkar         DATE: 07/09/04  ECO: *P28X*  */
/* Revision: 1.46     BY: Bhavik Rathod          DATE: 01/07/05  ECO: *Q0GD*  */
/* Revision: 1.47     BY: Katie Hilbert          DATE: 01/07/05  ECO: *Q0GH*  */
/* Revision: 1.48     BY: SurenderSingh N.       DATE: 01/12/05  ECO: *P322*  */
/* Revision: 1.50     BY: Ed van de Gevel        DATE: 03/01/05  ECO: *R00G*  */
/* Revision: 1.51     BY: Alok Gupta             DATE: 08/04/05  ECO: *P3WS*  */
/* Revision: 1.53     BY: Deirdre O'Brien        DATE: 09/07/05  ECO: *R01P*  */
/* Revision: 1.54     BY: Shivaraman V.          DATE: 04/11/06  ECO: *P4P5*  */
/* Revision: 1.55     BY: Deirdre O'Brien        DATE: 07/24/07  ECO: *R0C6*  */
/* Revision: 1.58     BY: Jean Miller            DATE: 11/06/07  ECO: *P61L*  */
/* Revision: 1.59     BY: Roger He               DATE: 04/18/08  ECO: *R0Q0*  */
/* Revision: 1.67     BY: Jean Miller            DATE: 10/07/08  ECO: *R15M*  */
/* Revision: 1.68     BY: Katie Hilbert          DATE: 07/28/09  ECO: *R1ND*  */
/* Revision: 1.71     BY: Mallika Poojary        DATE: 07/30/09  ECO: *R1NR*  */
/* Revision: 1.72     BY: Jean Miller            DATE: 09/23/09  ECO: *R1RM*  */
/* Revision: 1.73     BY: Gerard Menezes         DATE: 11/13/09  ECO: *Q3M1*  */
/* Revision: 1.80     BY: Jean Miller            DATE: 02/17/10  ECO: *R1Y7*  */
/* $Revision: 1.2 $  BY: Prabu M                DATE: 06/25/10  ECO: *R21N*  */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB    LAST MODIFIED: 29-Apr-2011    BY:  nac *q9021*cy1042*              */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1227*                     */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1229*                     */
/* CYB        LAST MODIFIED: 18-OCT-2012  BY: gbg *c1351*                */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB        LAST MODIFIED: 22-Jan-2014  BY: gbg *c1453*                */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/gp/gpoidfcn.i}

define input parameter this-is-rma     as  logical.
define input parameter rma-recno       as  recid.
define input parameter new-rma         as  logical.
define input parameter l_allowedit     as  logical no-undo.
define output parameter l_edittax      like mfc_logical initial no no-undo.

define new shared variable ad_recno        as recid.
define new shared variable ship2_addr      like so_ship.
define new shared variable ship2_pst_id    like cm_pst_id.
define new shared variable ship2_lang      like cm_lang.
define new shared variable ship2_ref       like cm_addr.

define shared variable so_recno as recid.
define shared variable undo_cust    like mfc_logical.
define shared variable new_order    like mfc_logical initial no.
define shared variable rebook_lines as   logical initial no no-undo.
define shared variable old_billto   like so_bill no-undo. 

define variable yn              like mfc_logical initial yes.
define variable old_bill        like so_bill.
define variable l_old_soldto    like so_cust     no-undo.
define variable l_shiptocheck   as logical no-undo initial no.
define variable soc_dfltshp     like mfc_logical no-undo.

define variable hCreditManagementLib  as handle  no-undo.

define buffer bill_cm           for cm_mstr.

/* EMT SPECIFIC VARIABLES */
define variable prev-ship-to like so_ship no-undo.
define variable enduser-ok as logical no-undo.

/* Security Checking Parameters */
define variable o_mndNbr   as character no-undo.
define variable o_mndSel   as integer   no-undo.
define variable o_mndLabel as character no-undo.

define variable cBlockedCode               as character no-undo.
define variable hBlockedTransactionLibrary as handle no-undo.
define variable shiptoCreateError          as logical no-undo.
define variable vcresource    like Resources.Resource_ID.
define variable vcresourceuri like Resources.ResourceURI.

/* Ship-To Counting */
define variable ShipToCnt as integer initial 0 no-undo.
define variable DfltShip  as character         no-undo.

/* Blocked Transaction common library prototypes */
{us/mg/mgbltrpl.i "hBlockedTransactionLibrary"}

{us/so/sobtbvar.i }    /* EMT SHARED WORKFILES AND VARIABLES */

/* Frames */
define shared frame a.
define shared frame sold_to.
define shared frame ship_to.

/* CREDIT MANAGEMENT ROUTINE */
{us/mf/mfcredpl.i hCreditManagementLib}

run initialiseCreditManagementLibrary
   (input  hCreditManagementLib,
    output hCreditManagementLib).

form
   so_nbr label "Order"
   so_cust
   so_bill
   so_ship
with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

{us/mf/mfadform.i "sold_to" 1 SOLD-TO}
{us/mf/mfadform.i "ship_to" 41 SHIP-TO}
{us/mf/mfadform.i "bill_to" 41 BILL-TO}
{us/mf/mfadform.i "enduser" 41 END_USER}

/* INCLUDE FILE TO CHECK IF USER IS IN VIEWER MODE */
{us/gp/gpvwckhd.i}

form
   rma_enduser
with frame end-user overlay row 5 column 26 width 15.

/* SET EXTERNAL LABELS */
setFrameLabels(frame end-user:handle).
assign
   vcresourceuri = "urn:cbf:BDebtorShipTo.Create".

do transaction:

   for first soc_ctrl where soc_ctrl.soc_domain = global_domain
   no-lock: end.

   for first mfc_ctrl
      where mfc_ctrl.mfc_domain = global_domain
      and   mfc_field = "soc_dfltshp"
   no-lock:
      soc_dfltshp = mfc_logical.
   end. /* FOR FIRST mfc_ctrl */

   find so_mstr where recid(so_mstr) = so_recno exclusive-lock no-error.

   display
      so_nbr
      so_cust
      so_bill
      so_ship
   with frame a.

   assign
      l_edittax    = no
      l_old_soldto = so_cust.

   prompt-for
      so_mstr.so_cust
   with frame a editing:

      /* FIND NEXT/PREVIOUS  RECORD */
      {us/mf/mfnp.i cm_mstr so_cust  " cm_mstr.cm_domain = global_domain and
      cm_addr "  so_cust cm_addr cm_addr}

      if recno <> ? then do:
         so_cust = cm_addr.
         display
            so_cust
         with frame a.
         {us/mf/mfaddisp.i so_cust sold_to}
      end.
   end.

   /* added condition for soldto to prevent Qxtend errors */
   if not new so_mstr
      and so_cust entered and (l_old_soldto <> input so_cust)
   then do:

     /* CHECK FOR EXISTING PRE-SHIPPER OR SHIPPER */
      for first abs_mstr
         where abs_mstr.abs_domain = global_domain
         and    abs_order           = so_nbr
      no-lock: 
         /* CANNOT MODIFY CUSTOMER. PRE-SHIPPER/SHIPPER EXISTS */
         {us/bbi/pxmsg.i &MSGNUM=6867 &ERRORLEVEL=3}
         next-prompt so_cust.
         clear frame sold_to.
         undo, retry.
      end. /* FOR FIRST abs_mstr */

      /* CHECK FOR EXISTING SHIPMENTS */
      for first tr_hist
          where tr_hist.tr_domain = global_domain
            and tr_nbr = so_nbr
            and (tr_type = "ISS-SO" or tr_type = "ISS-COR")
      no-lock
         /* HINT FOR ORACLE TO USE THE CORRECT INDEX */
         query-tuning(HINT "INDEX(TR_HIST##TR_NBR_EFF)"):
      end.

      if available tr_hist then do:
         /* Can't modify customer, transaction history exists */
         {us/bbi/pxmsg.i &MSGNUM=3040 &ERRORLEVEL=3}
         next-prompt so_cust.
         clear frame sold_to.
         undo, retry.
      end.

      else
         rebook_lines = true.

      if l_old_soldto     <> ""
         and l_old_soldto <> input so_cust
         and can-find(first mfc_ctrl
                         where mfc_domain = global_domain
                         and   mfc_field  = "l_vqc_sold_usage"
                         and   mfc_logical)
      then do:

         /* SOLD-TO CHANGED. UPDATE TAX DATA */
         {us/bbi/pxmsg.i &MSGNUM=6463 &ERRORLEVEL=1 &CONFIRM=l_edittax}

         /* LOAD DEFAULT TAX CLASS & USAGE */
         if l_edittax
         then do:

            for first ad_mstr where ad_mstr.ad_domain = global_domain
               and ad_addr = input so_cust
            no-lock: end. /* FOR FIRST ad_mstr */

            find first cm_mstr where cm_domain = global_domain
                 and cm_addr = input so_cust
            no-lock no-error.

            if available(cm_mstr)
            then do:
              so_tax_usage = cm_tax_usage.
            end.

         end. /* IF l_edittax */

      end. /* IF l_old_soldto <> "" AND ... */

   end.

   {us/mf/mfaddisp.i "input so_cust" sold_to}

   for first cm_mstr
      where cm_mstr.cm_domain = global_domain and cm_addr = input so_cust
   no-lock: end.

   if not available ad_mstr or not available cm_mstr then do:
      /* Not a valid Customer */
      {us/bbi/pxmsg.i &MSGNUM=3 &ERRORLEVEL=3}
      next-prompt so_cust with frame a.
      undo, retry.
   end.

   assign
      so_cust = input so_cust.

   if not isViewer
   then do:
      /* Set Blocked Transaction Library running persistently */
      run mfairunh.p
         (input "mgbltrpl.p",
          input ?,
          output hBlockedTransactionLibrary).

      /* If parent program is Pending Invoice Maintenance */
      if execname = "soivmt.p" 
/*c1351*/ or execname = "xxsoivmt.p"
      then
         cBlockedCode = {&SO014}.
      else if execname = "sosomt.p" and not this-is-rma then
         cBlockedCode = {&SO001}.
/*cy1020*/   else if execname = "xxsosomt.p" and not this-is-rma then
/*cy1020*/      assign cBlockedCode = {&SO001}.
/*cy1020*/   else if execname = "xxsomt1.p" and not this-is-rma then
/*cy1020*/      assign cBlockedCode = {&SO001}.
/*c1453*/    else if execname = "xzsosomt.p" and not this-is-rma then
/*c1453*/       assign cBlockedCode = {&SO001}.
      else
         cBlockedCode = {&SSM018}.

      /* Check for blocked customer transactions */
      if blockedCustomer(input so_cust,
                         input cBlockedCode,
                         input true,
                         input "Sold-To Customer")
      then do:
         undo, retry.
      end. /* IF blockedCustomer(input input so_cust, */
   end. /* IF NOT isViewer */
   global_addr = so_cust.

   /* Display default bill-to and ship-to */
   if new_order then do:

      if cm_bill <> "" then
         so_bill = cm_bill.
      else
         so_bill = so_cust.

      /* Ship-To Count */
      assign
         ShipToCnt = 0
         DfltShip = so_cust.

      if not so_sched and soc_dfltshp then
      cntloop:
      for each ad_mstr where ad_domain = global_domain
                         and ad_type = "ship-to"
                         and ad_ref = so_cust
      no-lock:
         ShipToCnt = ShipToCnt + 1.
         if ShipToCnt = 1 then
            DfltShip = ad_addr.
         else do:
            DfltShip = "".
            leave cntloop.
         end.
      end.

      so_ship = DfltShip.

      display
         so_bill
         so_ship
      with frame a.

   end.
   assign 
      old_bill     = so_bill 
      old_billto   = old_bill. 

   do on error undo, retry:

      hide frame ship_to.
      {us/mf/mfaddisp.i so_bill bill_to}

      so_mstr.so_bill:screen-value = so_mstr.so_bill.
      prompt-for
         so_bill 
      with frame a editing:

         {us/mf/mfnp.i bill_cm so_bill  " bill_cm.cm_domain = global_domain and
         bill_cm.cm_addr "
            so_bill bill_cm.cm_addr cm_addr}

         if recno <> ? then do:

            so_bill = bill_cm.cm_addr.
            display
               so_bill
            with frame a.

            {us/mf/mfaddisp.i so_bill bill_to}
         end.
      end.

      for first bill_cm
          where bill_cm.cm_domain = global_domain
            and bill_cm.cm_addr = input so_bill
      no-lock: end.

      if not available bill_cm then do:
         /* Not a valid customer */
         {us/bbi/pxmsg.i &MSGNUM=3 &ERRORLEVEL=3}
         undo, retry.
      end.

      if not isViewer
      then do:
         /* Check for blocked customer transactions */
         if blockedCustomer(input input so_bill,
                            input cBlockedCode,
                            input true,
                            input "Bill-To Customer")
         then do:
            undo, retry.
         end. /* IF blockedCustomer(input input so_bill, */
      end. /* IF NOT isViewer */

      /* DON'T CHANGE BILL-TO IF BILL-TO'S DEFAULT CURR <> SO CURR */
      if (not new so_mstr)
         and (old_bill <> input so_bill)
         and (bill_cm.cm_curr <> so_curr)
      then do:
         /* CUSTOMER BILL-TO CURRENCY DOES NOT MATCH SALES ORDER CURRENCY  */
         {us/bbi/pxmsg.i &MSGNUM=2018 &ERRORLEVEL=2}
         if this-is-rma and not batchrun then pause.
      end.  /* do on error... */

      if not new so_mstr
         and not l_allowedit
         and old_bill <> input so_bill
      then do:
         /* CANNOT MODIFY CUSTOMER. PRE-SHIPPER/SHIPPER EXISTS */
         {us/bbi/pxmsg.i &MSGNUM=6867 &ERRORLEVEL=3}
         next-prompt so_bill.
         clear frame bill_to.
         undo, retry.
      end. /* IF (NOT NEW so_mstr) */

      assign
         so_bill = input so_bill.

      hide frame bill_to.

   end.  /* bill-to transaction */

   enduser-ok = yes.

   if this-is-rma then
   do on error undo, retry
      on endkey undo, leave:

      enduser-ok = no.

      find rma_mstr where recid(rma_mstr) = rma-recno
      exclusive-lock no-error.

      /* rma_cust_ven IS TO BE SET TO so_cust EVERY TIME,       */
      /* NOT ONLY FOR NEW RMA'S                                 */
      assign
         rma_cust_ven = so_cust.

      /* FOR NEW RMA'S, THE END USER DEFAULTS FROM THE CUSTOMER */
      if new-rma then do:
         so_ship      = rma_enduser.
         if rma_enduser = " " then
            rma_enduser  = rma_cust_ven.
      end.

      {us/mf/mfaddisp.i rma_enduser enduser}

      pause 0.

      display
         rma_enduser
      with frame end-user.

      eusetloop:
      do on error undo, retry
         on endkey undo, leave:

         prompt-for
            rma_enduser
         with frame end-user editing:

            {us/mf/mfnp.i eu_mstr rma_enduser  " eu_mstr.eu_domain = global_domain
            and eu_addr "  rma_enduser eu_addr eu_addr}

            if recno <> ? then do:

               rma_enduser  = eu_addr.

               display
                  rma_enduser
               with frame end-user.

               {us/mf/mfaddisp.i rma_enduser enduser}

            end.

         end.   /* editing */

         rma_enduser = input rma_enduser.

         for first eu_mstr
             where eu_mstr.eu_domain = global_domain and eu_addr =  rma_enduser
         no-lock: end.

         do while not available eu_mstr:
            {us/so/sostsec.i vcresourceuri}
            if l_shiptocheck
            then do:
               yn = yes.

               /* END USER DOES NOT EXIST. CREATE? */
               {us/bbi/pxmsg.i &MSGNUM=7208 &ERRORLEVEL=1 &CONFIRM=yn}

               if yn = no then
                  undo, retry.

               /* CREATE END USER */
               {us/bbi/gprun.i ""fscaeumt.p""
                  "(input        rma_cust_ven,
                    input        """",
                    input        """",
                    input        """",
                    input-output rma_enduser)"}

               for first eu_mstr
                  where eu_mstr.eu_domain = global_domain
                   and  eu_addr = rma_enduser no-lock:
               end. /* FOR FIRST EU_MSTR */
            end. /* if l_shiptocheck */
            else do:
               /* USER DOES NOT HAVE PERMISSION TO CREATE NEW SHIP-TO */
               {us/bbi/pxmsg.i &MSGNUM=1623 &ERRORLEVEL=3}
               next-prompt so_ship with frame a.
               undo, retry.
            end. /* else do: */
         end.   /* do while not available eu_mstr */

         /* DO NOT ALLOW AN END USER WHO IS NOT ASSOCIATED WITH THE */
         /* CURRENT CUSTOMER                                        */
         if eu_cm_nbr <> rma_cust_ven then do:
            /* End user does not belong to this customer */
            {us/bbi/pxmsg.i &MSGNUM=7301 &ERRORLEVEL=3}
            undo eusetloop, retry.
         end.

         if new-rma then do:
            so_ship     = rma_enduser.
            display so_ship with frame a.
         end.
         enduser-ok = yes.

      end.    /* eusetloop do */

   end.   /* if this-is-rma */

   hide frame enduser no-pause.
   hide frame end-user no-pause.

   view frame ship_to.

   if enduser-ok then
      if not so_sched then do:

      /* SHIP-TO CUSTOMER */
      do on error undo, retry:

         prev-ship-to = so_ship.

         if so_ship = "" then do:
            {us/mf/mfaddisp.i so_cust ship_to}
            /* Multiple ship-tos exist. Please specify */
            {us/bbi/pxmsg.i &MSGNUM=11050 &ERRORLEVEL=1}
         end.
         else do:
            {us/mf/mfaddisp.i so_ship ship_to}
         end.

         so_mstr.so_ship:screen-value = so_mstr.so_ship.

         prompt-for 
            so_mstr.so_ship
         with frame a
         editing:
            /* FIND NEXT/PREVIOUS  RECORD */
            {us/mf/mfnp01.i ad_mstr so_ship ad_addr ad_ref  " ad_mstr.ad_domain =
            global_domain and so_cust "  ad_ref}
            if recno <> ? then do:
               so_ship = ad_addr.
               display so_ship with frame a.
               {us/mf/mfaddisp.i so_ship ship_to}
            end.
         end. /* prompt-for so_ship */
         if not isViewer
         then do:
            /* Check for blocked customer transactions */
            if blockedCustomer(input (input so_ship),
                               input cBlockedCode,
                               input true,
                               input "Ship-To Customer")
            then do:
               undo, retry.
            end. /* IF blockedCustomer(input input so_ship), */
         end. /* IF NOT isViewer */

         /* CHECK FOR EXISTING PRE-SHIPPER OR SHIPPER */
         if not new so_mstr
            and so_ship entered
         then do:

            for first abs_mstr
               where abs_domain = global_domain
                 and abs_order  = so_nbr
            no-lock: end.

            if available abs_mstr
            then do:
               /* CANNOT MODIFY CUSTOMER. PRE-SHIPPER/SHIPPER EXISTS */
               {us/bbi/pxmsg.i &MSGNUM=6867 &ERRORLEVEL=3}
               next-prompt so_ship.
               clear frame ship_to.
               undo, retry.
            end. /* IF AVAILABLE abs_mstr */

         end. /* IF NOT NEW so_mstr AND so_ship ENTERED */

         assign
            so_ship = input so_ship.

         if so_ship = ""
           and soc_dfltshp
         then do:
            /* Blank not allowed */
            {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3}
            next-prompt so_ship with frame a.
            undo, retry.
         end. /* IF so_ship = ""  */

         {us/mf/mfaddisp.i so_ship ship_to}

         /* ENTERED SHIP-TO MUST BE A VALID CUSTOMER,SHIP-TO OR DOCK */
         if available ad_mstr      and
            ad_type <>  "customer"
         then do:

            if ad_ref = so_cust then do:

               for first ls_mstr
                   where ls_mstr.ls_domain = global_domain
                    and (ls_addr = input so_ship
                    and (ls_type = "customer" or
                         ls_type = "ship-to"  or
                         ls_type = "dock"))
               no-lock: end.

               if not available ls_mstr
               then do:
                  {us/so/sostsec.i vcresourceuri}
                  if l_shiptocheck
                  then do:

                     /* SHIP-TO DOES NOT EXIST DO YOU WISH TO ADD */
                     {us/bbi/pxmsg.i &MSGNUM=301 &ERRORLEVEL=1 &CONFIRM=yn }

                     if yn then do:
                        {us/bbi/gprun.i ""sosomtc4.p""
                           "(input so_ship,
                             output shiptoCreateError)"}

                        if shiptoCreateError
                        then do:
                           next-prompt so_ship with frame a.
                           undo, retry.
                        end.
                     end. /* IF YN THEN */
                     else do:
                        next-prompt so_ship with frame a.
                        undo, retry.
                     end. /* ELSE DO */
                  end.  /* IF l_shiptocheck */

                  else do:
                     /* USER DOES NOT HAVE PERMISSION TO CREATE NEW SHIP-TO */
                     {us/bbi/pxmsg.i &MSGNUM=1623 &ERRORLEVEL=3}
                     next-prompt so_ship with frame a.
                     undo, retry.
                  end. /* ELSE DO : */

               end.  /* IF NOT AVAILABLE LS_MSTR */

            end. /* IF AD_REF = SO_CUST */

            if ad_ref  <> so_cust and
               so_cust <> so_ship
            then do:
               for first ls_mstr
                  where ls_mstr.ls_domain = global_domain
                   and (ls_addr = input so_ship
                   and (ls_type = "customer" or
                        ls_type = "ship-to"  or
                        ls_type = "dock"))
               no-lock: end.
               if not available ls_mstr
               then do:
                  /* END USER DOES NOT BELONG TO THIS CUSTOMER */
                  {us/bbi/pxmsg.i &MSGNUM=7301 &ERRORLEVEL=3}
                  undo, retry.
               end. /* IF NOT AVAILABLE LS_MSTR */
            end. /* IF AD_REF <> SO_CUST */

         end. /* IF AVAILABLE AD_MSTR */

         if not available ad_mstr then do:
            {us/so/sostsec.i vcresourceuri}
            if l_shiptocheck
            then do:

               /* Ship-To does not exist, add? */
               {us/bbi/pxmsg.i &MSGNUM=301 &ERRORLEVEL=1 &CONFIRM=yn}

               if yn then do:

                  assign
                     ship2_addr   = so_ship
                     ship2_lang   = cm_mstr.cm_lang
                     ship2_pst_id = cm_mstr.cm_pst_id
                     ship2_ref    = cm_mstr.cm_addr.

                  /* Add Ship To */
                  {us/bbi/gprun.i ""sosost.p""}

                  for first ad_mstr where recid(ad_mstr) = ad_recno
                  no-lock: end.

                  if available ad_mstr then do:

                     find ctry_mstr where ctry_ctry_code = ad_ctry
                     no-lock no-error.

                     if so_ship = "" then
                        so_ship = ad_addr.

                     display
                        so_ship
                     with frame a.

                     view frame ship_to.

                     display
                        ad_name
                        ad_line1
                        ad_line2
                        ad_city
                        ad_state
                        ad_zip
                        ctry_country  when (available ctry_mstr)
                     with frame ship_to.

                  end. /* if available ad_mstr */

                  else do:
                     next-prompt so_ship with frame a.
                      undo, retry.
                  end.

               end. /* if yn then do */

            end. /* IF l_shiptocheck */
            else do:
               /* USER DOES NOT HAVE PERMISSION TO CREATE NEW SHIP-TO */
               {us/bbi/pxmsg.i &MSGNUM=1623 &ERRORLEVEL=3}
               next-prompt so_ship with frame a.
               undo, retry.
            end.  /* ELSE DO: */

            if not available ad_mstr
               or ad_ref <> cm_mstr.cm_addr
            then do:
               {us/bbi/pxmsg.i &MSGNUM=3 &ERRORLEVEL=3}
               next-prompt so_ship with frame a.
               undo, retry.
            end.

         end.

         /* DO NOT ALLOW CHANGE OF SHIP-TO AT THE SBU */
         if prev-ship-to <> so_ship and
            not new_order and
            soc_use_btb and
            so_secondary
         then do:
            /* No change is allowed on EMT Order */
            {us/bbi/pxmsg.i &MSGNUM=2825 &ERRORLEVEL=3}
            next-prompt so_ship with frame a.
            undo, retry.
         end.


         if so_ship <> so_cust and ad_ref <> so_cust then do:
            /* Ship-to is not for this customer */
            {us/bbi/pxmsg.i &MSGNUM=606 &ERRORLEVEL=2}
         end.

      end.  /* ship-to input */
      if not isViewer
      then do:
         /* Tidy up the persistent procedure now that we are finished */
         delete procedure hBlockedTransactionLibrary no-error.
      end. /* IF NOT isViewer */

   end. /* if not so_sched */

   else do:

      {us/mf/mfaddisp.i so_ship ship_to}

      if so_ship    <> so_cust
         and ad_ref <> so_cust
      then do:
         /* SHIP-TO IS NOT FOR THIS CUSTOMER */
         {us/bbi/pxmsg.i &MSGNUM=606 &ERRORLEVEL=2}
      end. /* IF so_ship <> so_cust */

   end. /* IF so_sched */

   if enduser-ok then
      undo_cust = false.
   else
      undo, retry.

end.  /* do transaction */
