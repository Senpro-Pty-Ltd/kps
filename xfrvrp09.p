/* xfrvrp09.p - PURCHASE ORDER RTV PRINT MAIN SUBROUTINE                */
/* porvrp01.p - PURCHASE ORDER RTV PRINT MAIN SUBROUTINE                      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrvrp09.p,v 1.2 2018/03/13 17:09:37 gbg Exp $: */
/*                                                                            */
/* REVISION: 6.0     LAST MODIFIED: 08/10/90    BY: RAM *D030*                */
/* REVISION: 6.0     LAST MODIFIED: 11/02/90    BY: PML *D171*                */
/* REVISION: 6.0     LAST MODIFIED: 01/18/91    BY: RAM *D306*                */
/* REVISION: 6.0     LAST MODIFIED: 10/03/91    BY: RAM *D890*                */
/* REVISION: 6.0     LAST MODIFIED: 11/07/91    BY: RAM *D913*                */
/* REVISION: 6.0     LAST MODIFIED: 01/07/92    BY: RAM *D979*                */
/* REVISION: 7.0     LAST MODIFIED: 02/03/92    BY: RAM *F144*                */
/* REVISION: 7.3     LAST MODIFIED: 09/24/92    BY: tjs *G088*                */
/* REVISION: 7.3     LAST MODIFIED: 04/09/93    BY: afs *G926*                */
/* REVISION: 7.3     LAST MODIFIED: 07/06/94    BY: afs *FP27*                */
/*           7.3                    11/11/94    BY: bcm *GO37*                */
/* REVISION: 7.3     LAST MODIFIED: 03/14/95    By: dzn *G0G8*                */
/* REVISION: 7.3     LAST MODIFIED: 03/29/95    By: dzn *F0PN*                */
/* REVISION: 7.4     LAST MODIFIED: 05/31/95    By: jym *G0NR*                */
/* REVISION: 8.5     LAST MODIFIED: 10/23/95    By: taf *J053*                */
/* REVISION: 8.5     LAST MODIFIED: 02/14/96    By: rxm *H0JJ*                */
/* REVISION: 8.5     LAST MODIFIED: 07/18/96    BY: taf *J0ZS*                */
/* REVISION: 8.5     LAST MODIFIED: 02/13/97    BY: *G2KZ* Aruna Patil        */
/* REVISION: 8.5     LAST MODIFIED: 04/29/97    BY: *H0YN* Ajit Deodhar       */
/* REVISION: 8.5     LAST MODIFIED: 11/06/97    BY: *J25J* Mandar Kapshikar   */
/* REVISION: 8.6E    LAST MODIFIED: 02/23/98    BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E    LAST MODIFIED: 03/06/98    BY: *J2FM* Samir Bavkar       */
/* REVISION: 8.6E    LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E    LAST MODIFIED: 06/11/98    BY: *L020* Charles Yen        */
/* REVISION: 9.1     LAST MODIFIED: 08/14/98    BY: *N01P* Steve Nugent       */
/* REVISION: 9.1     LAST MODIFIED: 07/29/99    BY: *N01B* John Corda         */
/* REVISION: 9.1     LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1     LAST MODIFIED: 09/04/00    BY: *N0RC* Mark Brown         */
/* REVISION: 9.1     LAST MODIFIED: 08/17/00    BY: *N0KM* Mudit Mehta        */
/* REVISION: 9.1     LAST MODIFIED: 01/12/01    BY: *N0VL* Manish Kulkarni    */
/* Revision: 1.11.1.9     BY: Katie Hilbert        DATE: 04/01/01 ECO: *P002* */
/* Revision: 1.11.1.12    BY: Katie Hilbert        DATE: 04/17/01 ECO: *P00P* */
/* Revision: 1.11.1.13    BY: Rajaneesh Sarangi    DATE: 05/31/01 ECO: *N0ZC* */
/* Revision: 1.11.1.14    BY: Steve Nugent         DATE: 04/17/02 ECO: *P043* */
/* Revision: 1.11.1.16    BY: Paul Donnelly (SB)   DATE: 06/28/03 ECO: *Q00J* */
/* Revision: 1.11.1.17    BY: Rajaneesh Sarangi    DATE: 09/12/03 ECO: *N2KY* */
/* Revision: 1.11.1.18    BY: Somesh Jeswani       DATE: 07/21/04 ECO: *P2BP* */
/* Revision: 1.11.1.21    BY: Swati Sharma         DATE: 03/05/05 ECO: *P3B2* */
/* Revision: 1.11.1.22    BY: Robin McCarthy       DATE: 09/07/05 ECO: *P2PJ* */
/* Revision: 1.11.1.23    BY: Milind Shahane       DATE: 12/30/05 ECO: *P4DZ* */
/* Revision: 1.11.1.24    BY: Ellen Borden         DATE: 01/17/06 ECO: *R008* */
/* Revision: 1.11.1.25    BY: Puja Bajaj           DATE: 04/12/06 ECO: *P4P1* */
/* Revision: 1.11.1.26    BY: Robin McCarthy       DATE: 05/31/06 ECO: *R02F* */
/* Revision: 1.11.1.27    BY: Nivedita Banerjee    DATE: 06/21/06 ECO: *R06L* */
/* Revision: 1.11.1.28    BY: Amit Singh           DATE: 08/29/06 ECO: *P4X3*  */
/* Revision: 1.11.1.29    BY: Jean Miller          DATE: 09/24/07 ECO: *R0C5* */
/* Revision: 1.11.1.31    BY: Ken Casey            DATE: 10/03/07 ECO: *R0C6* */
/* Revision: 1.11.1.32    BY: Dinesh Dubey         DATE: 07/07/08 ECO: *R0W3* */
/* Revision: 1.11.1.33    BY: Julie Milligan       DATE: 08/04/08 ECO: *R104* */
/* Revision: 1.11.1.35    BY: Jean Miller          DATE: 12/02/08 ECO: *R15M* */
/* Revision: QAD2014      BY: Amol Dudvadkar    DATE: 03/16/15  ECO: *grc338  */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/px/pxmaint.i}
{us/px/pxphdef.i adcrxr}

/**grc338 ADDED PORTION BEGINS**/
{us/xf/xfdefa.i}
{us/xf/xfpo03u.i "NEW"}
{us/xf/xftxtots.i}
{us/xf/xfrv09v.i}
/**grc338 ADDED PORTION ENDS**/

/* PARAMETER TO FACILITATE DISPLAY OF "SIMULATION" */
/* TEXT IN REPORT HEADER                           */

define input parameter update_yn like mfc_logical no-undo.

/* NEW SHARED VARIABLES, BUFFERS AND FRAMES */
define new shared variable rndmthd     like rnd_rnd_mthd.
define new shared variable prh_recno   as recid.
define new shared variable addr        as character
   format "x(38)" extent 6.
define new shared variable tax_tr_type like tx2d_tr_type no-undo
   initial "25".
define new shared variable maint like  mfc_logical initial false
   no-undo.
define new shared variable po_recno as recid. /* USED FOR RCVR NBR */
define new shared variable receivernbr like prh_receiver.
define new shared variable eff_date    like glt_effdate.
define new shared variable fiscal_id   like prh_receiver.
define new shared variable fiscal_rec  as logical initial false.
define new shared variable convertmode as character no-undo.

/* SHARED VARIABLES, BUFFERS AND FRAMES */
define     shared variable nbr         like prh_nbr.
define     shared variable nbr1        like prh_nbr.
define     shared variable vend        like prh_vend.
define     shared variable vend1       like prh_vend.
define     shared variable buyer       like prh_buyer.
define     shared variable buyer1      like prh_buyer.
define     shared variable rcp_date    like prh_rcp_date.
define     shared variable rcp_date1   like prh_rcp_date.
define     shared variable new_only    like mfc_logical.
define     shared variable print_bill  like mfc_logical.
define     shared variable print_trlr  like mfc_logical initial no
   label "Print Receipt Trailer".
define     shared variable msg         as character format "x(60)".
define     shared variable print_lotserials like mfc_logical.

/* LOCAL VARIABLES, BUFFERS AND FRAMES */
define variable pages            as integer                             no-undo.
define variable old_prh_nbr      like prh_nbr                           no-undo.
define variable location         like pt_loc                            no-undo.
define variable i                as integer                             no-undo.
define variable billto           as character format "x(38)" extent 6   no-undo.
define variable vendor           as character format "x(38)" extent 6   no-undo.
define variable shipto           as character format "x(38)" extent 6   no-undo.
define variable duplicate        as character format "x(11)" label ""   no-undo.
define variable vend_phone       like ad_phone                          no-undo.
define variable vend_fax         like ad_fax                            no-undo.
define variable contact          like po_contact                        no-undo.
define variable cr_terms         like po_cr_terms                       no-undo.
define variable shipvia          like po_shipvia                        no-undo.
define variable fob              like po_fob                            no-undo.
define variable rmks             like po_rmks                           no-undo.
define variable termsdesc        as character format "x(40)" 
                                 label "Description"                    no-undo.
define variable dup-lbl          as character format "x(10)"            no-undo.
define variable prepaid-lbl      as character format "x(17)"            no-undo.
define variable signature-lbl    as character format "x(34)"            no-undo.
define variable by-lbl           as character format "x(3)"             no-undo.
define variable unit_cost        like prh_pur_cost
                                 format "->>>>>>9.99<<<"                no-undo.
define variable ext_cost         like prh_pur_cost
                                 format "(z,zzz,zzz,zz9.99)"            no-undo.
define variable desc1            as character format "x(49)"            no-undo.
define variable desc2            as character format "x(49)"            no-undo.
define variable qty_open         like prh_rcvd
                                 format "->>>>>>9.9<<<<<<"              no-undo.
define variable det_lines        as integer                             no-undo.
define variable mfgr             like vp_mfgr                           no-undo.
define variable mfgr_part        like vp_mfgr_part no-undo.
define variable y-lbl            as character format "x(1)"             no-undo.
define variable n-lbl            as character format "x(1)"             no-undo.
define variable item-rev-lbl     as character format "x(15)"            no-undo.
define variable item-rev-date-lbl as character format "x(20)"            no-undo.
define variable vpart-lbl        as character format "x(15)"            no-undo.
define variable manuf-lbl        as character format "x(14)"            no-undo.
define variable part-lbl         as character format "x(6)"             no-undo.
define variable site-lbl         as character format "x(6)"             no-undo.
define variable disc-lbl         as character format "x(5)"             no-undo.
define variable type-lbl         as character format "x(6)"             no-undo.
define variable typedesc         as character format "x(11)"            no-undo.
define variable cont-lbl         as character format "x(12)"            no-undo.
define variable vd-attn-lbl      as character format "x(16)"            no-undo.
define variable nullstring       as character format "x(1)" initial ""  no-undo.
define variable lot-lbl          as character format "x(43)"            no-undo.
define variable lotserial_total  like tr_qty_chg                        no-undo.
define variable oldsite          like prh_site                          no-undo.
define variable newsite          like mfc_logical                       no-undo.
define variable oldcurr          like prh_curr                          no-undo.
define variable h_format         as handle                              no-undo.
define variable doc_cost         as decimal                             no-undo.
define variable ext_cost_fmt     as character                           no-undo.
define variable ext_cost_old     as character                           no-undo.
define variable received_at_site like prh_site                          no-undo.
define variable mc-error-number  like msg_nbr                           no-undo.
define variable l_vend           like prh_vend                          no-undo.
define variable starteff-lbl     as character format "x(20)"            no-undo.
define variable endeff-lbl       as character format "x(18)"            no-undo.

define variable l_pvod_ex_rate     like prh_ex_rate                     no-undo.
define variable l_pvod_ex_rate2    like prh_ex_rate2                    no-undo.
define variable l_pvod_trans_qty   like pvo_trans_qty                   no-undo.
define variable l_pvod_pur_cost    like prh_pur_cost                    no-undo.
define variable l_pvo_last_voucher like pvo_last_voucher                no-undo.

define temp-table tt_rec_det  no-undo
   field tt_receiver   as character
   field tt_new        as logical
   index tt_index
         tt_receiver
         tt_new.

convertmode = "REPORT".

/* SET LABEL VARIABLES */
{us/po/po03b01.i}

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.

{us/po/pocurvar.i "NEW"}
{us/tx/txcurvar.i "NEW"}
{us/ap/apconsdf.i}

/**grc338 COMMENTED PORTION BEGINS**
/* PREPAID FRAME */
form
   prepaid-lbl at 2
   po_prepaid
with frame prepd no-labels width 80.
/* ITEM FRAME */
form
   prh_line    at 1
   prh_part
   prh_ps_qty           column-label "Pack Qty"
   format "->>>>>>9.9<<<<<<"
   qty_open             column-label "Return Qty"
   prh_um
   unit_cost            column-label "Unit Cost"
   ext_cost             column-label "Extended Cost"
with frame d width 80 no-box down.
ext_cost_old = ext_cost:format.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).
**grc338 COMMENTED PORTION ENDS**/

/* DEFINE TRAILER VARS AS NEW, SO THAT CORRECT _OLD FORMATS */
/* CAN BE ASSIGNED BASED ON INITIAL DEFINE                  */
/* {us/po/potrldef.i "NEW"} */
/*grc338*/ {us/xf/xftrldef.i "NEW"}

/**grc338 COMMENTED PORTION BEGINS**
assign
   nontax_old         = nontaxable_amt:format
   taxable_old        = taxable_amt:format
   lines_tot_old      = lines_total:format
   tax_tot_old        = tax_total:format
   order_amt_old      = order_amt:format
   prepaid_old        = po_prepaid:format.

assign
   oldcurr = ""
   pages = 0
   old_prh_nbr = ?.
**grc338 COMMENTED PORTION ENDS**/

{us/bbi/gprun.i ""gpctryfmt.p"" "persistent set h_format"}

for each prh_hist no-lock
   where prh_hist.prh_domain = global_domain
     and ((prh_nbr >= nbr) and (prh_nbr <= nbr1)
      and (prh_vend >= vend) and (prh_vend <= vend1)
      and (prh_buyer >= buyer and prh_buyer <= buyer1)
      and (prh_rcp_date >= rcp_date) and (prh_rcp_date <= rcp_date1)
      and (prh_print or not new_only)
      and (prh_rcp_type <> "") )
      break by prh_receiver
            by prh_site
            by prh_line
with frame d width 80:

   l_pvo_last_voucher = "".

   for first pvo_mstr
      where pvo_mstr.pvo_domain   = global_domain
      and   pvo_order_type        = {&TYPE_PO}
      and   pvo_order             = prh_nbr
      and   pvo_internal_ref_type = {&TYPE_POReceiver}
      and   pvo_internal_ref      = prh_receiver
      and   pvo_line              = prh_line
   no-lock:
   end. /* FOR FIRST pvo_mstr */

   if available pvo_mstr
   then do:

      l_pvo_last_voucher = pvo_last_voucher.

      for first pvod_det where pvod_domain = global_domain
         and pvod_id = pvo_id
      no-lock: end.

      assign
         l_pvod_ex_rate       = pvod_ex_rate
         l_pvod_ex_rate2      = pvod_ex_rate2
         l_pvod_trans_qty     = pvod_trans_qty
         l_pvod_pur_cost      = pvod_pur_cost.
   end. /* IF AVAILABLE pvo_mstr */

   else do:

      assign
         l_pvod_ex_rate       = prh_ex_rate
         l_pvod_ex_rate2      = prh_ex_rate2
         l_pvod_trans_qty     = prh_rcvd
         l_pvod_pur_cost      = prh_pur_cost
         l_pvo_last_voucher   = "".
   end. /* IF NOT AVAILABLE pvo_mstr */

   if (oldcurr <> prh_curr) or (oldcurr = "")
   then do:
      if prh_curr = gl_base_curr then
         rndmthd = gl_rnd_mthd.
      else do:
         /* GET ROUNDING METHOD FROM CURRENCY MASTER */
         {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
            "(input prh_curr,
              output rndmthd,
              output mc-error-number)"}
         if mc-error-number <> 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=4}
            if c-application-mode <> "WEB" then
               pause.
            next.
         end.
      end.

      /* DETERMINE CURRENCY DISPLAY AMERICAN OR EUROPEAN            */
      find rnd_mstr where rnd_rnd_mthd = rndmthd no-lock no-error.
      if not available rnd_mstr then do:
         {us/bbi/pxmsg.i &MSGNUM=863 &ERRORLEVEL=4}  /* ROUND METHOD RECORD NOT FOUND */
         next.
      end.

    /*grc338  {us/po/pocurfmt.i} */
      ext_cost_fmt = ext_cost_old.
      {us/bbi/gprun.i ""gpcurfmt.p"" "(input-output ext_cost_fmt,
                                       input rndmthd)"}
/*grc338 ext_cost:format = ext_cost_fmt. */
      oldcurr = prh_curr.
   end.

/**grc338 COMMENTED PORTION BEGINS**
   /* MOVED FRAME DEFINITION FROM BELOW FOR GUI STANDARDS */
   form
      header            skip(3)
      billto[1]         at 4
      getTermLabelRt("BANNER_RETURN_TO_SUPPLIER",35) to 80 format "x(35)"
      billto[2]         at 4

      /* DISPLAYS "SIMULATION" TEXT, IF REPORT IS RUN IN */
      /* SIMULATION MODE                                 */
      if not update_yn and prh_print then
         getTermLabelRt("BANNER_SIMULATION",28)
      else
         (if not prh_print then duplicate else "")  to 80 format "x(28)"
      billto[3]         at 4

      getTermLabelRtColon("RETURN_NUMBER",14)  to 56 format "x(14)"
      prh_receiver
      billto[4]         at 4

      getTermLabelRtColon("ORDER_NUMBER",14)  to 56 format "x(14)"
      prh_nbr
      billto[5]         at 4

      getTermLabelRtColon("RETURN_DATE",14)  to 56 format "x(14)"
      prh_rcp_date

      getTermLabelRtColon("PAGE_OF_REPORT",8)  to 76 format "x(8)"
      string(page-number - pages,">>9") format "x(3)"
      billto[6]         at 4

      getTermLabelRtColon("PRINT_DATE",14)  to 56 format "x(14)"
      today             skip(1)

      getTermLabel("RECEIVED_AT",20) + ": " +
      received_at_site at 8 format "x(30)"

      getTermLabel("RETURN_TO_SUPPLIER",30) + ": " + l_vend
      at 46 format "x(40)" skip(1)

      shipto[1]         at 8
      vendor[1]         at 46
      shipto[2]         at 8
      vendor[2]         at 46
      shipto[3]         at 8
      vendor[3]         at 46
      shipto[4]         at 8
      vendor[4]         at 46
      shipto[5]         at 8
      vendor[5]         at 46
      shipto[6]         at 8
      vendor[6]         at 46 skip(1)

      getTermLabelRtColon("FAX/TELEX",14) to 54 format "x(14)"
      vend_fax

      getTermLabelRtColon("BUYER",14)  to 14 format "x(14)"
      prh_buyer

      getTermLabelRtColon("SUPPLIER_TELEPHONE",25)  to 54 format "x(25)"
      vend_phone

      getTermLabelRtColon("VOUCHER",14)  to 14 format "x(14)"
      l_pvo_last_voucher

      getTermLabelRtColon("CONTACT",20)  to 54 format "x(20)"
      contact

      getTermLabelRtColon("CREDIT_TERMS",14)  to 14 format "x(14)"
      cr_terms

      getTermLabelRtColon("SHIP_VIA",20)  to 54 format "x(20)"
      shipvia
      " "               to 14
      termsdesc

      getTermLabelRtColon("FOB",10)  to 54 format "x(10)"
      fob

      getTermLabelRtColon("REMARKS",14)  to 14 format "x(14)"
      rmks
   with frame phead1 page-top width 90.

   view frame phead1.
**grc338 COMMENTED PORTION ENDS**/
   if prh_shipto = "" or prh_shipto = ?
   then
      l_vend = prh_vend.
   else
      l_vend = prh_shipto.

   newsite = no.
   if oldsite <> prh_site and not first(prh_receiver)
      then newsite = yes.
/*grc338 if newsite = yes then page. */

   if first-of(prh_receiver) or newsite = yes then do:

      if old_prh_nbr <> ? and newsite <> yes then
         pages = page-number.

      find po_mstr  where po_mstr.po_domain = global_domain and  po_nbr =
      prh_nbr no-lock no-error.

      if available po_mstr then do:
         assign
            contact  = po_contact
            cr_terms = po_cr_terms
            shipvia  = po_shipvia
            fob      = po_fob
            rmks     = po_rmks.
         {us/px/pxrun.i &PROC='getTermsDescription' &PROGRAM='adcrxr.p'
            &HANDLE=ph_adcrxr
            &PARAM="(input po_cr_terms,
                     output termsdesc)"}
      end.
      else
         assign
            contact   = ""
            cr_terms  = ""
            shipvia   = ""
            fob       = ""
            rmks      = ""
            termsdesc = "".

      if prh_print
      then duplicate = "".
      else duplicate = dup-lbl.

      if available po_mstr then do:

         find ad_mstr where ad_mstr.ad_domain = global_domain
            and ad_addr = po_bill
         no-lock no-wait no-error.

         if available ad_mstr and print_bill then do:

            /* Assign values to addr and format */
            {us/mf/mfadfmt.i}
            assign addr[5] = "". /*grc338*/
            assign
               billto[1] = addr[1]
               billto[2] = addr[2]
               billto[3] = addr[3]
               billto[4] = addr[4]
               billto[5] = addr[5]
               billto[6] = addr[6].
/*grc338*/ {us/xf/xfaddr.i "billto"}
         end.
      end.
/*grc338 else billto = "". */
/**grc338 ADDED PORTION BEGINS**/
      else
         assign
            billto = ""
            billto_city = ""
            billto_state = ""
            billto_zip = "".
/**grc338 ADDED PORTION ENDS**/

      /* WHEN SHIP-TO ADDRESS IS DIFFERENT FROM SUPPLIER ADDRESS */
      /* PRINT THE SHIP-TO ADDRESS DETAILS                       */
      if prh_shipto = "" or prh_shipto = ?
      then
         find ad_mstr where ad_mstr.ad_domain = global_domain
            and ad_addr = prh_vend
         no-lock no-wait no-error.
      else
         for first ad_mstr where ad_mstr.ad_domain = global_domain
            and ad_addr = prh_shipto
         no-lock: end.

      if available ad_mstr then do:

         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
         assign addr[5] = "". /*grc338*/

         for first vd_mstr where vd_domain = global_domain
            and vd_addr = l_vend
         no-lock: end.

         /* Use ship-to country's locale */
         run setFormatForCountryCode in h_format
            (input vd_lang, input ad_mstr.ad_ctry).

         assign
            vendor[1]  = addr[1]
            vendor[2]  = addr[2]
            vendor[3]  = addr[3]
            vendor[4]  = addr[4]
            vendor[5]  = addr[5]
            vendor[6]  = addr[6]
            vend_phone = ad_phone
            vend_fax   = ad_fax.
/*grc338*/ {us/xf/xfaddr.i "vendor"}
      end.
      else do:

         assign
            vendor = ""
            vend_phone = ""
            vend_fax   = ""
/**grc338 ADDED PORTION BEGINS**/
            vendor_city = ""
            vendor_state = ""
            vendor_zip = ""
            vendor_attn = ""
/**grc338 ADDED PORTION ENDS**/
            .

         for first usr_mstr where usr_userid = global_userid
         no-lock: end.

         /* Default to user's locale */
         run setFormatForCountryCode in h_format
            (input global_user_lang, input usr_ctry_code).

      end.

      shipto = "".

      find ad_mstr where ad_mstr.ad_domain = global_domain
         and ad_addr = prh_site
      no-lock no-wait no-error.

      if available ad_mstr then do:

         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}
/*grc338*/ addr[5] = "".
         received_at_site = prh_site.

         assign
            shipto[1] = addr[1]
            shipto[2] = addr[2]
            shipto[3] = addr[3]
            shipto[4] = addr[4]
            shipto[5] = addr[5]
            shipto[6] = addr[6].
/*grc338*/ {us/xf/xfaddr.i "shipto"}
      end.  /* available ad_mstr for prh_site */

      else do:

         find ad_mstr where ad_mstr.ad_domain = global_domain
            and ad_addr = prh_ship
         no-lock no-wait no-error.

         if available ad_mstr then do:

            /* Assign values to addr and format */
            {us/mf/mfadfmt.i}
/*grc338*/  addr[5] = "".
            received_at_site = prh_site.

            assign
               shipto[1] = addr[1]
               shipto[2] = addr[2]
               shipto[3] = addr[3]
               shipto[4] = addr[4]
               shipto[5] = addr[5]
               shipto[6] = addr[6].
/*grc338*/  {us/xf/xfaddr.i "shipto"}
         end. /* available address for prh_ship */
      end. /* not available address for prh_site */

      /* FORM HEADER */

      old_prh_nbr = prh_nbr.

      /* ENSURE THAT HEADER COMMENTS START PRINTING ONLY AFTER
      PRINTING REPORT HEADER. */
/**grc338 COMMENTED PORTION BEGINS**
      page.

      form
         skip with frame put1 width 90.

      /* CONSISTENTLY PRINT ONE BLANK LINE AFTER THE REPORT HEADER */

      if available po_mstr and po_cmtindx <> 0 then do:
         view frame put1.
         {us/gp/gpcmtprt.i &type=RV &id=po_cmtindx &pos=3}
      end.
      view frame put1.
**grc338 COMMENTED PORTION ENDS**/
/*grc338*/ {us/xf/xfrvrpm0.i}
   end. /* if first-of(prh_receiver) */

   prh_recno = recid(prh_hist).
   /* PRINT ORDER DETAIL */

   find pod_det where pod_det.pod_domain = global_domain
      and pod_nbr = prh_nbr
      and pod_line = prh_line
   no-lock no-error.

   qty_open = - l_pvod_trans_qty.

   /* UNIT_COST IS IN BASE CURRENCY */
   unit_cost = l_pvod_pur_cost * prh_um_conv.

   /* REGARDLESS OF CURRENCY CALCULATE IN DOC CURRENCY THEN CONVERT */
   ext_cost = qty_open * (l_pvod_pur_cost
                       * l_pvod_ex_rate
                       / l_pvod_ex_rate2)
                       * prh_um_conv.

   /* ROUND PER DOCUMENT CURRENCY ROUND METHOD */
   {us/gp/gprunp.i "mcpl" "p" "mc-curr-rnd"
      "(input-output ext_cost,
        input rndmthd,
        output mc-error-number)"}
   if mc-error-number <> 0 then do:
      {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
   end.

   /* SAVE THE DOCUMENT COST FOR LATER CALCULATIONS */
   doc_cost = ext_cost.

   /* CONVERTING UNIT COST TO DOC CURRENCY           */
   if prh_curr <> base_curr 
   then do:
      /* CONVERT FROM BASE TO FOREIGN CURRENCY */
      {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
         "(input base_curr,
           input prh_curr,
           input l_pvod_ex_rate2,
           input l_pvod_ex_rate,
           input unit_cost,
           input false, /* DO NOT ROUND */
           output unit_cost,
           output mc-error-number)"}.
   end.

   accumulate ext_cost (total by prh_receiver).

   if available pod_det then
      desc1 = pod_desc.
   else
      desc1 = "".

   desc2 = "".

   find pt_mstr where pt_mstr.pt_domain = global_domain and pt_part = prh_part
      no-lock no-wait no-error.

   if available pt_mstr then do:
      if desc1 = "" or desc1 = pt_desc1 then
         desc1 = pt_desc1 + " " + pt_desc2.
      else
         desc2 = pt_desc1 + " " + pt_desc2.
   end.

   mfgr = "".
   mfgr_part = "".
   if available pod_det and pod_vpart <> "" then do:
      find first vp_mstr where vp_mstr.vp_domain = global_domain
         and vp_vend = prh_vend
         and vp_vend_part = pod_vpart
         and vp_part = prh_part
      no-lock no-error.
      if available vp_mstr then
      assign
         mfgr = vp_mfgr
         mfgr_part = vp_mfgr_part.
   end.

   /* DETERMINE NUMBER OF LINES NEEDED FOR DETAIL */
/**grc338 COMMENTED PORTION BEGINS**
   det_lines = 1.
   if prh_rev <> "" then det_lines = det_lines + 1.
   if prh_site <> "" then det_lines = det_lines + 1.
   if pod_vpart <> "" then det_lines = det_lines + 1.
   if prh_type <> "" then det_lines = det_lines + 1.
   if mfgr <> "" or mfgr_part <> "" then det_lines = det_lines + 1.
   if desc1 <> "" then det_lines = det_lines + 1.
   if desc2 <> "" then det_lines = det_lines + 1.
   if page-size - det_lines - line-counter < 3
      then page.

   /* DISPLAY LINE ITEM */
   display
      prh_line
      prh_part
      (if ( prh_ps_qty < 0 ) then (prh_ps_qty * -1 ) else (prh_ps_qty) ) @ prh_ps_qty
      qty_open
      prh_um
      unit_cost
      ext_cost
   with frame d.
   down 1 with frame d.
   if prh_rev <> "" then do:
      put item-rev-lbl at 5 prh_rev skip.
   end.
   if prh_site <> "" then do:
      put site-lbl at 5 prh_site skip.
   end.
   if available pod_det and pod_vpart <> "" then do:
      put vpart-lbl at 5 pod_vpart skip.
   end.
**grc338 COMMENTED PORTION ENDS**/
   if prh_type <> "" then do:
      if prh_type = "M" or prh_type = "m" then
         typedesc = getTermLabel("MEMO",11).
      else
      if prh_type = "S" or prh_type = "s" then
         typedesc = getTermLabel("SUBCONTRACT",11).
      else
         typedesc = prh_type.
      put type-lbl at 5 typedesc skip.
   end.
/**grc338 COMMENTED PORTION BEGINS**
   if mfgr <> "" or mfgr_part <> "" then
   put
      manuf-lbl at 5 mfgr space(2)
      part-lbl mfgr_part skip.
   if desc1 <> "" then put desc1 at 5 skip.
   if desc2 <> "" then put desc2 at 5 skip.
**grc338 COMMENTED PORTION ENDS**/

   oldsite = prh_site.
/*grc338*/ {us/xf/xfrvrpmb.i}

   /* Print Lot/Serial Numbers */
   if print_lotserials then do:

      if prh_fsm_type = ""
      then do:

         for each tr_hist no-lock
            where tr_hist.tr_domain = global_domain
              and tr_type = "ISS-PRV"
              and tr_nbr = prh_nbr
              and tr_lot = prh_receiver
              and tr_line = prh_line
              and tr_serial <> ""
         use-index tr_nbr_eff break by tr_serial
                                    by tr_expire:
/**grc338 COMMENTED PORTION BEGINS**
            if first(tr_expire) then do:
               if page-size - line-counter < 1 then page.
               put lot-lbl at 3 skip.
            end.
**grc338 COMMENTED PORTION ENDS**/
            if first-of(tr_expire) then lotserial_total = 0.
            lotserial_total = lotserial_total - tr_qty_loc.
            if last-of(tr_expire)  then do:
/**grc338 COMMENTED PORTION BEGINS**
               if page-size - line-counter < 1 then page.
               put tr_serial at 5 lotserial_total at 25
               tr_expire at 40 skip.
**grc338 COMMENTED PORTION ENDS**/
/*grc338*/     {us/xf/xfrvrpmc.i}
            end.
         end.
      end. /* IF prh_fsm_type = "" */
      else do:
         for each tr_hist no-lock
            where tr_hist.tr_domain = global_domain
              and tr_type   = "RCT-PO"
              and tr_nbr    = prh_nbr
              and tr_lot    = prh_receiver
              and tr_line   = prh_line
              and tr_serial <> ""
         use-index tr_nbr_eff
         break by tr_serial
               by tr_expire:

            if first(tr_expire)
            then do:
               if page-size - line-counter < 1
               then
                  page.
               put lot-lbl at 3 skip.
            end. /* IF first(tr_expire ) */

            if first-of(tr_expire)
            then
               lotserial_total = 0.

            lotserial_total = lotserial_total - tr_qty_loc.

            if last-of(tr_expire)
            then do:
               if page-size - line-counter < 1
               then
                  page.
               put tr_serial       at 5
                   lotserial_total at 25
                   tr_expire       at 40 skip.
            end. /* IF last-of(tr_expire) */

         end. /* FOR EACH tr_hist */

      end. /* ELSE DO */

   end.

   if available pod_det then do:
/**grc338 COMMENTED PORTION BEGINS**
      {us/gp/gpcmtprt.i &type=RV &id=pod_cmtindx &pos=5
         &command="display prh_line prh_part nullstring @ prh_ps_qty
           nullstring @ qty_open nullstring @ prh_um
           cont-lbl @ unit_cost nullstring @ ext_cost with frame d."}
**grc338 COMMENTED PORTION ENDS**/
/*grc338*/ {us/xf/xfcmtprt.i &type=RV &rectype=D &id=pod_cmtindx}
   end.

   {us/mf/mfrpchk.i}

   if last-of(prh_receiver) then do:

      if last-of(prh_receiver) and print_trlr then do:
         undo_trl2 = true.
         find po_mstr where po_mstr.po_domain = global_domain
            and po_nbr = prh_nbr
         no-lock.
         po_recno = recid(po_mstr).
         receivernbr = prh_receiver.
     /*grc338     {us/bbi/gprun.i ""porctrl2.p"" */
     /*grc338*/ {us/bbi/gprun.i ""xfrctrl2.p""
            "(input table tt_rec_det)"}
         if undo_trl2 then undo, leave.
      end.
      else do:
/**grc338 COMMENTED PORTION BEGINS**
         /* TOTALS */
         if page-size - line-counter < 8 then page.
         do while page-size - line-counter > 8:
            put skip(1).
         end.

         put msg skip.
         put "-----------------------------------------"
            + "-----------------------------------------" format "x(80)".

         display
            "" @ prh_line
            "" @ prh_part
            "" @ prh_ps_qty
            "       " + prh_curr format "x(10)" @ qty_open
            "" @ prh_um
            getTermLabel("TOTAL_CREDIT",12) @ unit_cost
            (accum total by prh_receiver ext_cost) @ ext_cost
         with frame d.
**grc338 COMMENTED PORTION ENDS**/
      end.

/**grc338 COMMENTED PORTION BEGINS**
      po_prepaid:format in frame prepd = prepaid_fmt.
      if available po_mstr and po_prepaid <> 0
         then display prepaid-lbl po_prepaid with frame prepd.
      else put skip(1).

      if not print_trlr
      then
         put skip(1).
      put by-lbl to 47.
      put "______________________________" to 78 skip.
      put signature-lbl to 78 skip.
**grc338 COMMENTED PORTION ENDS**/
   end. /* if last-of(prh_receiver) */

   {us/bbi/gprun.i ""porcrpa.p""}

end. /* for each prh_hist */

run resetFormat in h_format.
delete procedure h_format no-error.
