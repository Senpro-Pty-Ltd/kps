/* xxiclotr.p - LOCATION TRANSFER UN ISSUE / UN RECEIPT                       */
/* iclotr.p - LOCATION TRANSFER UN ISSUE / UN RECEIPT                         */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxiclotr.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/*                                                                            */
/* REVISION: 1.0      LAST MODIFIED: 06/11/86   BY: PML                       */
/* REVISION: 6.0      LAST MODIFIED: 03/14/90   BY: emb *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 04/03/90   BY: WUG *D015*                */
/* REVISION: 6.0      LAST MODIFIED: 05/03/90   BY: WUG *D002*                */
/* REVISION: 6.0      LAST MODIFIED: 10/31/90   BY: WUG *D156*                */
/* REVISION: 6.0      LAST MODIFIED: 03/14/91   BY: WUG *D472*                */
/* REVISION: 6.0      LAST MODIFIED: 04/19/91   BY: WUG *D547*                */
/* REVISION: 6.0      LAST MODIFIED: 07/15/91   BY: WUG *D770*                */
/* REVISION: 6.0      LAST MODIFIED: 08/01/91   BY: emb *D800*                */
/* REVISION: 7.0      LAST MODIFIED: 10/18/91   BY: pma *F003*                */
/* REVISION: 7.0      LAST MODIFIED: 11/11/91   BY: WUG *D887*                */
/* REVISION: 7.0      LAST MODIFIED: 01/25/92   BY: pma *F003*                */
/* REVISION: 7.0      LAST MODIFIED: 02/10/92   BY: pma *F190*                */
/* REVISION: 7.0      LAST MODIFIED: 06/26/92   BY: pma *F701*                */
/* REVISION: 7.0      LAST MODIFIED: 09/14/92   BY: pma *F895*                */
/* REVISION: 7.0      LAST MODIFIED: 09/28/92   BY: pma *G102*                */
/* Revision: 7.3      LAST MODIFIED: 09/27/93   BY: jcd *G247*                */
/* REVISION: 7.3      LAST MODIFIED: 11/16/92   BY: pma *G319*                */
/* REVISION: 7.3      LAST MODIFIED: 06/16/93   BY: pma *GC07*                */
/* REVISION: 7.3      LAST MODIFIED: 09/09/93   BY: ram *GE98*                */
/* REVISION: 7.3      LAST MODIFIED: 09/09/93   BY: pxd *GH52*                */
/* REVISION: 7.3      LAST MODIFIED: 02/15/94   BY: ais *FM01*                */
/* REVISION: 7.3      LAST MODIFIED: 05/20/94   BY: ais *FO32*                */
/* REVISION: 7.3      LAST MODIFIED: 07/15/94   BY: pxd *GK75*                */
/* REVISION: 7.3      LAST MODIFIED: 09/16/94   BY: dpm *FR46*                */
/* REVISION: 8.5      LAST MODIFIED: 10/05/94   BY: mwd *J034*                */
/* REVISION: 7.3      LAST MODIFIED: 10/07/94   BY: qzl *FS18*                */
/* REVISION: 7.3      LAST MODIFIED: 11/03/94   BY: pxd *FT37*                */
/* REVISION: 8.5      LAST MODIFIED: 11/16/94   BY: ktn *J038*                */
/* REVISION: 7.3      LAST MODIFIED: 01/06/95   BY: ais *F0D2*                */
/* REVISION: 7.3      LAST MODIFIED: 01/18/95   BY: ais *F0FH*                */
/* REVISION: 7.3      LAST MODIFIED: 03/20/95   BY: pxd *F0NL*                */
/* REVISION: 7.3      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.2      LAST MODIFIED: 05/16/95   BY: qzl *F0RN*                */
/* REVISION: 7.3      LAST MODIFIED: 07/26/95   BY: dzs *G0SQ*                */
/* REVISION: 7.3      LAST MODIFIED: 11/01/95   BY: ais *G0V9*                */
/* REVISION: 7.4      LAST MODIFIED: 11/13/95   BY: jym *G1D2*                */
/* REVISION: 7.4      LAST MODIFIED: 12/07/95   BY: jym *G1FP*                */
/* REVISION: 8.5      LAST MODIFIED: 07/11/96   BY: *G1ZM* Julie Milligan     */
/* REVISION: 8.5      LAST MODIFIED: 11/05/96   BY: *J17R* Murli Shastri      */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K04X* Steve Goeke        */
/* REVISION: 8.6      LAST MODIFIED: 04/18/97   BY: *H0S4* Russ Witt          */
/* REVISION: 8.6      LAST MODIFIED: 07/09/97   BY: *J1W2* Manmohan K.Pardesi */
/* REVISION: 8.6      LAST MODIFIED: 11/17/97   BY: *H1GR* Viji Pakala        */
/* REVISION: 7.4      LAST MODIFIED: 12/22/97   BY: *H1HN* Jean Miller        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 05/19/98   BY: *J2JV* Samir Bavkar       */
/* REVISION: 8.6E     LAST MODIFIED: 08/17/98   BY: *L062* Steve Nugent       */
/* REVISION: 8.6E     LAST MODIFIED: 09/02/98   BY: *J2YJ* Felcy D'Souza      */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Vijaya Pakala      */
/* REVISION: 9.1      LAST MODIFIED: 06/29/99   BY: *J3HJ* G.Latha            */
/* REVISION: 9.1      LAST MODIFIED: 10/15/99   BY: *J3KH* G.Latha            */
/* REVISION: 9.1      LAST MODIFIED: 10/25/99   BY: *N002* Steve Nugent       */
/* REVISION: 9.1      LAST MODIFIED: 07/06/00   BY: *L11B* Rajesh Thomas      */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00   BY: *N0KS* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 09/01/00   BY: *N0R0* Jean Miller        */
/* REVISION: 9.1      LAST MODIFIED: 10/19/00   BY: *N0W6* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 11/29/01   BY: *N16N* Ed van de Gevel    */
/* Revision: 1.31     BY: Ellen Borden            DATE: 05/30/01  ECO: *P00G* */
/* Revision: 1.33     BY: Jean Miller             DATE: 04/06/02  ECO: *P055* */
/* Revision: 1.34     BY: Jeff Wootton            DATE: 05/14/02  ECO: *P03G* */
/* Revision: 1.35     BY: Subramanian Iyer        DATE: 01/21/03  ECO: *N24M* */
/* Revision: 1.37     BY: Paul Donnelly (SB)      DATE: 06/26/03  ECO: *Q00G* */
/* Revision: 1.40     BY: A.R. Jayaram            DATE: 09/12/03  ECO: *P12D* */
/* Revision: 1.41     BY: Paul Donnelly           DATE: 10/01/03  ECO: *Q041* */
/* Revision: 1.42     BY: Swati Sharma            DATE: 03/26/04  ECO: *P1VZ* */
/* Revision: 1.43     BY: Nishit V                DATE: 06/04/04  ECO: *P24C* */
/* Revision: 1.44     BY: Michael Hansen          DATE: 07/14/04  ECO: *Q06H* */
/* Revision: 1.45     BY: Shoma Salgaonkar        DATE: 08/25/04  ECO: *Q0CJ* */
/* Revision: 1.46     BY: Ed van de Gevel         DATE: 03/07/05  ECO: *R00K* */
/* Revision: 1.47     BY: Ed van de Gevel         DATE: 03/18/05  ECO: *R00F* */
/* Revision: 1.48     BY: Ed van de Gevel         DATE: 03/29/05  ECO: *R00R* */
/* Revision: 1.49     BY: Reena Ambavi            DATE: 04/14/05  ECO: *P3FT* */
/* Revision: 1.50     BY: Andrew Dedman           DATE: 09/29/05  ECO: *R021* */
/* Revision: 1.51     BY: Andrew Dedman           DATE: 11/04/05  ECO: *R02C* */
/* Revision: 1.52     BY: Shivaraman V.           DATE: 11/24/05  ECO: *P48W* */
/* Revision: 1.53     BY: Vandna Rohira           DATE: 01/17/06  ECO: *P4FT* */
/* Revision: 1.54     BY: Shivaraman V.           DATE: 03/24/06  ECO: *P4LQ* */
/* Revision: 1.55     BY: Shilpa Kamath           DATE: 04/18/06  ECO: *R03R* */
/* Revision: 1.56     BY: Ashwini Ghaisas         DATE: 05/08/06  ECO: *P4HY* */
/* Revision: 1.57     BY: Shilpa Kamath           DATE: 06/15/06  ECO: *R05X* */
/* Revision: 1.58     BY: Robin McCarthy          DATE: 06/15/06  ECO: *R04H* */
/* Revision: 1.59     BY: Robin McCarthy          DATE: 06/30/06  ECO: *R04J* */
/* Revision: 1.61     BY: Munira Savai            DATE: 08/10/06  ECO: *P50Z* */
/* Revision: 1.64     BY: Yujie Sun               DATE: 03/25/08  ECO: *R0Q8* */
/* Revision: 1.67     BY: Nan Zhang               DATE: 06/04/08  ECO: *R0JS* */
/* Revision: 1.70     BY: Anju Dubey              DATE: 08/20/08  ECO: *P6Y7* */
/* Revision: 1.71     BY: John Pison              DATE: 11/12/08  ECO: *Q1ZS* */
/* Revision: 1.77     BY: Jiang Wan               DATE: 12/20/08  ECO: *R1BY* */
/* Revision: 1.81     BY: Yizhou Mao              DATE: 03/09/09  ECO: *R1DT* */
/* Revision: 1.82     BY: Mukesh Singh            DATE: 04/06/09  ECO: *P6V1* */
/* Revision: 1.83     BY: Jordan Fei              DATE: 06/18/09  ECO: *R1J1* */
/* Revision: 1.84     BY: Jiang Wan               DATE: 08/07/09  ECO: *R1N2* */
/* Revision: 1.86     BY: Zhijun Guan             DATE: 09/09/09  ECO: *R1V9* */
/* Revision: 1.87     BY: Rajalaxmi Ganji         DATE: 03/31/10  ECO: *Q3WL* */
/* Revision: 1.88     BY: Rajat Kulshreshtha      DATE: 05/26/10  ECO: *Q435* */
/* Revision: 1.89     BY: Xiaolei Meng            DATE: 05/25/10  ECO: *R1Z0* */
/* CYB               LAST MODIFIED: 08-SEP-2011 BY: gbg *cy1033*        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 15-APR-2013 BY: gbg *c1381*   */
/* CYB LAST MODIFIED: 2013-DEC-11      BY: gbg *c1447*                */
/*-Revision end---------------------------------------------------------------*/

/*****************************************************************************/
/* THIS PROGRAM WAS CLONED TO kblotr.p 05/14/02, REMOVING UI.      */
/* CHANGES TO THIS PROGRAM MAY ALSO NEED TO BE APPLIED TO kblotr.p */
/*****************************************************************************/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "3+ "}
{us/px/pxmaint.i}
{us/px/pxphdef.i soldxr}
{us/gp/gpuid.i}
/*c1447*/ def stream lg.

define new shared variable lotserial like sr_lotser no-undo.
define new shared variable lotserial_qty like sr_qty no-undo.
define new shared variable nbr like tr_nbr label "Order" no-undo.
define new shared variable so_job like tr_so_job no-undo.
define new shared variable rmks like tr_rmks no-undo.
define new shared variable transtype as character format "x(7)" initial "ISS-TR".
define new shared variable from_nettable       like mfc_logical.
define new shared variable to_nettable         like mfc_logical.
define new shared variable null_ch             as   character initial "".
define new shared variable old_mrpflag         like pt_mrp.
define new shared variable eff_date            like tr_effdate.
define new shared variable intermediate_acct   like trgl_dr_acct.
define new shared variable intermediate_sub    like trgl_dr_sub.
define new shared variable intermediate_cc     like trgl_dr_cc.
define new shared variable from_expire         like ld_expire.
define new shared variable from_date           like ld_date.
define new shared variable site_from           like pt_site   no-undo.
define new shared variable loc_from            like pt_loc    no-undo.
define new shared variable lotser_from         like sr_lotser no-undo.
define new shared variable lotref_from         like ld_ref    no-undo.
define new shared variable status_from         like ld_status no-undo.
define new shared variable site_to             like pt_site   no-undo.
define new shared variable loc_to              like pt_loc    no-undo.
define new shared variable lotser_to           like sr_lotser no-undo.
define new shared variable lotref_to           like ld_ref    no-undo.
/*cy1033*/ def var nextLotRef                  as char.
define new shared variable h_wiplottrace_procs as   handle    no-undo.
define new shared variable h_wiplottrace_funcs as   handle    no-undo.
define new shared variable lddate              like ld_date   no-undo.

define shared variable trtype as character.

define variable glcost        like sct_cst_tot.
define variable undo-input    like mfc_logical.
define variable yn            like mfc_logical.
define variable assay         like tr_assay.
define variable grade         like tr_grade.
define variable expire        like tr_expire.
define variable ld_recid        as recid.
define variable v_abs_recid     as recid           no-undo.
define variable v_trflow_flg    as logical         no-undo.
define variable v_shipnbr     like tr_ship_id      no-undo.
define variable v_shipdate    like tr_ship_date    no-undo.
define variable v_invmov      like tr_ship_inv_mov no-undo.
define variable ld_recid_from   as recid           no-undo.
define variable lot_control   like clc_lotlevel    no-undo.
define variable errmsg          as integer         no-undo.
define variable lot_found     like mfc_logical     no-undo.
define variable mesg_desc       as character       no-undo.
define variable ve_recid        as recid           no-undo.
define variable v_unconfirm_flg as logical         no-undo.
define variable v_elec_ld       as logical         no-undo.  
define variable v_print_elec_ld as logical         no-undo.

define new shared variable impexp          like mfc_logical
                                           label "Imp/Exp" no-undo.
define            variable part_part       like pt_part      no-undo.
define            variable part_desc       like pt_desc1     no-undo.
define            variable part_um         like pt_um        no-undo.
define            variable part_net_wt     like pt_net_wt    no-undo.
define            variable part_net_wt_um  like pt_net_wt_um no-undo.
define            variable part_size       like pt_size      no-undo.
define            variable part_size_um    like pt_size_um   no-undo.
define            variable from_proc       like mfc_logical  no-undo.
define            variable from_site       like pt_site      no-undo.
define            variable from_loc        like pt_loc       no-undo.
define            variable to_site         like pt_site      no-undo.
define            variable to_loc          like pt_loc       no-undo.

define            variable impexp_edit     like mfc_logical no-undo.
define            variable upd_okay        like mfc_logical no-undo.
define            variable imp-okay        like mfc_logical no-undo.
define            variable dss_ie_nbr      as character no-undo.
define new shared variable active_mod      like mfc_logical no-undo.
define            variable ietype          like ie_type no-undo.
define            variable ietype_desc     like glt_desc no-undo.

define new shared variable lgdkey as decimal no-undo.
define new shared variable issueld as logical no-undo initial yes.

find first iec_ctrl  where iec_ctrl.iec_domain = global_domain no-lock no-error.
active_mod = no.
if available iec_ctrl then active_mod = lookup("5", iec_act_in_type_list) <> 0.

define variable part           like pt_part    no-undo.
define variable trans_nbr      like tr_trnbr   no-undo.
define variable from-label     as   character  no-undo.
define variable to-label       as   character  no-undo.
define variable l_auth         like cncix_auth no-undo initial "".
define variable l_trfqty_avail like ld_qty_oh  no-undo initial 0.
define variable l_pt_lot_ser   as   character  no-undo.
define variable l_ldrecno      as   recid      no-undo.
define variable l_prompt       as   character  no-undo.

define buffer lddet for ld_det.
define buffer lddet1 for ld_det.

{us/wl/wlfnc.i} /* FUNCTION FORWARD DECLARATIONS */
{us/px/pxphdef.i ppitxr}

if is_wiplottrace_enabled() then do:
   {us/bbi/gprun.i ""wlpl.p"" "persistent set h_wiplottrace_procs"}
   {us/bbi/gprun.i ""wlfl.p"" "persistent set h_wiplottrace_funcs"}
end.

define variable iss_trnbr like tr_trnbr no-undo.
define variable rct_trnbr like tr_trnbr no-undo.
/*cy1033*/ define variable optrnbr like op_trnbr no-undo.
/*cy1033*/ define new shared stream ft.

/*c1460* start added code */
def var i as int.
def var pausecount as int.
/*c1460* end   added code */

define variable l_err_flag like mfc_logical no-undo.

{us/up/updaterestriction.i}

/* Start Update Restriction Library running Persistantly */
run mfairunh.p (input "mgurpl.p",
                input ?,
                output hUpdateRestrictedLibrary).

/* CONSIGNMENT VARIABLES. */
{us/so/socnvars.i}

{us/gp/gpglefdf.i}

/* SHARED TEMP TABLES */
{us/ic/icshmtdf.i "new" }

{us/gp/gpldform.i}

/* REPLACED pt_part USING LOCAL VARIABLE part TO TRIGGER */
/* DATABASE VALIDATION                                   */

from-label = getTermLabelRt("FROM",8).
to-label   = getTermLabelRt("TO",8).

form
   part             colon 22
   pt_desc1         colon 22
   pt_desc2         colon 51 no-label
   pt_um            colon 22
   skip(1)
   lotserial_qty    colon 22
   eff_date         colon 55
   nbr              colon 22
   so_job           colon 22
   rmks             colon 22
   skip(1)
   from-label       to 27    no-label
   to-label         to 58    no-label
   site_from        colon 22     site_to          colon 55
   loc_from         colon 22     loc_to           colon 55
   lotser_from      colon 22     lotser_to        colon 55
   lotref_from      colon 22     lotref_to        colon 55
   status_from      colon 22     lddet.ld_status  colon 55
   impexp           colon 22
with frame a side-labels width 80.

setFrameLabels(frame a:handle).

form
   part_desc        colon 22
   part_um          colon 22     skip(1)
   lotserial_qty    colon 22
   eff_date         colon 55
   nbr              colon 22     skip(1)
   part_net_wt      colon 22     part_net_wt_um   colon 55
   part_size        colon 22     part_size_um     colon 55 skip(1)
   from-label          to 27     no-label
   to-label            to 58     no-label
   site_from        colon 22     site_to          colon 55
   loc_from         colon 22     loc_to           colon 55
with frame b side-labels row 4 overlay width 80.
SetFrameLabels(frame b:handle).

/* E-Sig support include file */
{us/ic/iclotres.i}

for first poc_ctrl no-lock
   where poc_domain = global_domain:
end.

/* E-Signature Persistent Procedure initialization */
ll_isesig_on = isEsigConfigured("0007").
if ll_isesig_on then run initESig.

/* CREATE SESSION TRIGGER FOR USLH_HIST */
if ll_isesig_on then do:
   {us/es/essestrig.i &TABLE="uslh_hist" &EVENT="Write"}
end.

subscribe to "getPrompt" anywhere.

/* DISPLAY */
transloop:
repeat with frame a:

   if ll_quitmfgpro then undo, leave transloop.

   {us/bbi/gprun.i ""gplotwdl.p""}

   clear frame a all no-pause.
   display
      from-label
      to-label
   with frame a.

   assign
      part = global_part
      part_part = global_part
      nbr = ""
      so_job = ""
      rmks = ""
      lotserial_qty = 0
      eff_date = today.

   find pt_mstr  where pt_mstr.pt_domain = global_domain and  pt_part =
   global_part no-lock no-error.

   if available pt_mstr then
      display
         part
         pt_desc1
         pt_um
         lotserial_qty.

   prompt-for part with frame a no-validate
   editing:
      /* FIND NEXT/PREVIOUS RECORD */
      {us/mf/mfnp.i pt_mstr part  " pt_mstr.pt_domain = global_domain and pt_part "
      part pt_part pt_part}
      if recno <> ? then
      display
         pt_part @ part
         pt_desc1
         pt_desc2
         pt_um
         pt_site @ site_from
         pt_loc @ loc_from
      with frame a.
      recno = ?.
   end.
   status input.

   part_part = input frame a part.
   for first pt_mstr
   no-lock  where pt_mstr.pt_domain = global_domain and  pt_part = input part:
   end. /* FOR FIRST pt_mstr */

   if not available pt_mstr then do:
      if trtype = "LOT/SER" then do:
         {us/bbi/pxmsg.i &MSGNUM=7179 &ERRORLEVEL=3} /*Item does not exist */
         undo, retry.
      end.
      else do:
         assign yn = yes.

         {us/bbi/pxmsg.i &MSGNUM=5322 &ERRORLEVEL=1 &CONFIRM=yn}

         if yn = no then undo, retry.

         run proc_shipper. /* SHIPPER CREATION */

         if from_proc then do:
            hide frame b.
            clear frame a all no-pause.
            next transloop.
         end.
      end.

   end.
   if not available pt_mstr then do:
      hide frame b.
      next transloop.
   end.

   display
      pt_desc1
      pt_desc2
      pt_um
      pt_site @ site_from
      pt_loc @ loc_from
      lotserial_qty
      "" @ lotser_from
      "" @ lotref_from
   with frame a.

   old_mrpflag = pt_mrp.

   /* SET GLOBAL PART VARIABLE */
/*cy1033*/   {us/bbi/gprun.i ""xxrfval.p"" "(output nextLotRef)"}
   global_part = pt_part.

   xferloop:
   repeat:

      /* Initialize print electronic legal document flag and shipper
	    * recid.  These fields will be used to determine whether to
	    * print electronic legal document
	    */
      assign
         v_abs_recid     = ?
         v_print_elec_ld = no.

      toloop:
      do for lddet on error undo, retry with frame a:

         display
            eff_date
         with frame a.

         set
            lotserial_qty
            eff_date
            nbr
            so_job
            rmks
         with frame a.

         if lotserial_qty = 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=7100 &ERRORLEVEL=3} /*quantity is zero*/
            undo, retry.
         end.

         from-loop:
         do on error undo:

            /*For the .NET UI we set the loc_to to blank so that it is
              not used by the alias.dat mechanism for the loc_from lookup*/
            if {us/bbi/gpiswrap.i} then
               display "" @ loc_to with frame a.

            set
               site_from
               loc_from
               lotser_from
               lotref_from
            with frame a editing:
               assign
                  global_site = input frame a site_from
                  global_loc  = input frame a loc_from
                  global_lot  = input frame a lotser_from.

               if frame-field = "loc_from" then do:
                  if recno = ? then do:

                     if loc_from = "" or loc_from = ?
                     then do:
                        {us/px/pxrun.i
                           &PROC  = 'getFieldDefault'
                           &PROGRAM = 'ppitxr.p'
                           &HANDLE=ph_ppitxr
                           &PARAM = "(input  global_part,
                                      input  global_site,
                                      input ""pt_loc"",
                                      output loc_from)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}

                        display
                           loc_from
                        with frame a.
                        /* SET RECNO SO SOME VALUE SO THAT IT DOES NOT CALL */
                        /* getFieldDefault again */
                        recno = 99999999.
                     end. /* if loc_from = "" or loc_from = ? */
                  end.
                  readkey.
                  apply lastkey.
               end. /* if frame-field = "loc_from" */
               else do:
                  recno = ?.
                  readkey.
                  apply lastkey.
               end. /* else do: */

            end.

            find si_mstr  where si_mstr.si_domain = global_domain and  si_site
            = site_from no-lock no-error.
            if not available si_mstr then do:
               /* Invalid Site */
               {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}
               next-prompt site_from with frame a.
               undo from-loop, retry from-loop.
            end.

            /* Check Site Security */
            {us/bbi/gprun.i ""gpsiver.p""
               "(input si_site, input recid(si_mstr), output return_int)"}
            if return_int = 0 then do:
               {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}    /* USER DOES NOT HAVE */
               /* ACCESS TO THIS SITE*/
               next-prompt site_from with frame a.
               undo from-loop, retry from-loop.
            end.

            /* OPEN PERIOD VALIDATION FOR THE ENTITY OF FROM SITE */
            {us/gp/gpglef02.i &module = ""IC""
               &entity = si_entity
               &date   = eff_date
               &prompt = "site_from"
               &frame  = "a"
               &loop   = "from-loop"}

            assign
               site_to   = pt_site
               lotser_to = lotser_from
               lotref_to = lotref_from.
/*d2101* start deleted code  >>>>>>>>>>>>>>>>
            {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                     &HANDLE=ph_ppitxr
                     &PARAM =  "(input  pt_part,
                                 input  pt_site,
                                 input ""pt_loc"",
                                 output loc_to)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
*d2101* end   deleted code  <<<<<<<<<<<<<<< */

            find ld_det  where ld_det.ld_domain = global_domain and
            ld_det.ld_part = pt_part
               and ld_det.ld_site = site_from
               and ld_det.ld_loc = loc_from
               and ld_det.ld_lot = lotser_from
               and ld_det.ld_ref = lotref_from
            no-lock no-error.

            if not available ld_det then do:

               find si_mstr  where si_mstr.si_domain = global_domain and
               si_site = site_from no-lock no-error.
               find loc_mstr  where loc_mstr.loc_domain = global_domain and
               loc_site = site_from
                  and loc_loc = loc_from no-lock no-error.

               if not available si_mstr then do:
                  /* Invalid Site */
                  {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}
                  next-prompt site_from with frame a.
                  undo from-loop, retry from-loop.
               end.

               if not available loc_mstr then do:
                  if not si_auto_loc then do:
                     /* Location/lot/item/serial does not exist */
                     {us/bbi/pxmsg.i &MSGNUM=305 &ERRORLEVEL=3}
                     next-prompt loc_from.
                     if not batchrun then
                        undo from-loop, retry from-loop.
                     else
                        undo from-loop, leave transloop.
                  end.
                  else do:
                     find is_mstr  where is_mstr.is_domain = global_domain and
                     is_status = si_status
                     no-lock no-error.
                     if available is_mstr and is_overissue then do:
                        create loc_mstr. loc_mstr.loc_domain = global_domain.
                        assign
                           loc_site = si_site
                           loc_loc = loc_from
                           loc_date = today
                           loc_perm = no
                           loc_status = si_status.
                     end.
                     else do:
                        /* QUANTITY AVAILABLE IN SITE LOCATION FOR LOT/SERIAL */
                        {us/bbi/pxmsg.i &MSGNUM=208 &ERRORLEVEL=3 &MSGARG1=0}
                        undo xferloop, retry xferloop.
                     end.
                  end.
               end. /* if not available loc_mstr */

               find is_mstr  where is_mstr.is_domain = global_domain and
               is_status = loc_status
               no-lock no-error.

               {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                        &HANDLE=ph_ppitxr
                        &PARAM = "( input  pt_part,
                                    input  site_from,
                                    input ""pt_lot_ser"",
                                    output l_pt_lot_ser)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

               if available is_mstr and is_overissue and
                  ((l_pt_lot_ser <> "" and lotser_from <> "")
                    or l_pt_lot_ser = "" )
               then do:
                  create ld_det. ld_det.ld_domain = global_domain.
                  assign
                     ld_det.ld_site = site_from
                     ld_det.ld_loc = loc_from
                     ld_det.ld_part = pt_part
                     ld_det.ld_lot = lotser_from
                     ld_det.ld_ref = lotref_from
                     ld_det.ld_status = loc_status
                     status_from = loc_status.
               end.
               else do:
                  /* Location/lot/item/serial does not exist */
                  {us/bbi/pxmsg.i &MSGNUM=305 &ERRORLEVEL=3}
                  undo xferloop, retry xferloop.
               end.

            end.

            else
            if ld_det.ld_qty_oh - lotserial_qty -
               ld_det.ld_qty_all < 0
               and ld_det.ld_qty_all > 0
               and ld_det.ld_qty_oh > 0
               and lotserial_qty > 0
            then do:
               status_from = ld_det.ld_status.
               display status_from with frame a.
               yn = yes.
               if not batchrun
               then do:

                  /* Not enough unallocated inventory.  Are you sure? */
                  {us/bbi/pxmsg.i &MSGNUM=434 &ERRORLEVEL=2 &CONFIRM=yn}
                  if not yn then undo, retry.

               end. /* IF NOT batchrun */

            end. /* IF ld_det.ld_qty_oh */

            else do:
               status_from = ld_det.ld_status.
            end.

            display status_from with frame a.

            ld_recid_from = recid(ld_det).

            {us/bbi/gprun.i ""icedit.p""
               "(""ISS-TR"",
                 site_from,
                 loc_from,
                 pt_part,
                 lotser_from,
                 lotref_from,
                 lotserial_qty,
                 pt_um,
                 """",
                 """",
                 output undo-input)"}
           
            if undo-input 
            then do:
               case l_prompt:
                  when "loc" 
                  then do:
                     next-prompt loc_from.
                     undo, retry.
                  end. /* WHEN "loc" */
                  when "site" 
                  then do:
                     next-prompt site_from.
                     undo, retry.
                  end. /* WHEN "site" */
                  when "lotser" 
                  then do:
                     next-prompt lotser_from.
                     undo, retry.
                  end. /* WHEN "lotser" */
                  when "um" 
                  then do:
                     next-prompt part.
                     undo transloop, retry transloop.
                  end. /* WHEN "um" */
                  when "qty" 
                  then do:
                     next-prompt lotserial_qty.
                     undo toloop, retry toloop.
                  end. /* WHEN "qty" */
                  when "wo" 
                  then do:
                     next-prompt nbr.
                     undo toloop, retry toloop.
                  end. /* WHEN "wo" */
               end case.
            end. /* IF undo-input */
         end. /* from-loop */

         send-loop:

         do on error undo, retry:

/*cy1033*  start added code */
	    assign
            site_to = site_from
	    loc_to = loc_from
	    lotser_to = lotser_from.
	    lotref_to = nextLotRef.
	    display lotref_to with frame a.
/*cy1033*  end   added code */

            display site_to loc_to lotser_to lotref_to.
            if trtype = "LOT/SER" then do:
               set
                  site_to
                  loc_to
                  lotser_to
                  lotref_to
               with frame a editing:
                  assign
                     global_loc  = input frame a loc_to
                     global_lot  = input frame a lotser_to
                     global_site = input frame a site_to.
                  if frame-field = "loc_to" then do:
                     if recno = ? then do:
                       {us/px/pxrun.i &PROC = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                                &HANDLE=ph_ppitxr
                                &PARAM = "(input  global_part,
                                           input  global_site,
                                           input ""pt_loc"",
                                           output loc_to)"
                                &NOAPPERROR = true
                                &CATCHERROR = true}

                        display
                           loc_to
                        with frame a.
                        /* SET RECNO SO SOME VALUE SO THAT IT DOES NOT CALL */
                        /* getFieldDefault again */
                        recno = 99999999.
                     end.
                     readkey.
                     apply lastkey.
                  end. /* if frame-field = "loc_to" */
                  else do:
                     recno = ?.
                     readkey.
                     apply lastkey.
                  end.
               end.
            end.
            else do:
               set
                  site_to
                  loc_to
               with frame a editing:
                  assign
                     global_loc  = input frame a loc_to
                     global_site = input frame a site_to.
                  /* In UI, the following code is executed even when loc_to 
                  ** is not entered causing it to display an error. Funtion
                  ** 'entered' will limit the following code to run.
                  */
                  if frame-field = "loc_to"
                  and loc_to entered then do:
                     if recno = ? then do:
                        {us/px/pxrun.i &PROC = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                                 &HANDLE=ph_ppitxr
                                 &PARAM = "(input  global_part,
                                            input  global_site,
                                            input ""pt_loc"",
                                            output loc_to)"
                                 &NOAPPERROR = true
                                 &CATCHERROR = true}

                        display
                           loc_to
                        with frame a.
                        /* SET RECNO SO SOME VALUE SO THAT IT DOES NOT CALL */
                        /* getFieldDefault again */
                        recno = 99999999.
                     end.
                     readkey.
                     apply lastkey.
                  end. /* if frame-field = "loc_to" */
                  else do:
                     recno = ?.
                     readkey.
                     apply lastkey.
                  end.
               end.
            end.

            find si_mstr  where si_mstr.si_domain = global_domain and  si_site
            = site_to no-lock no-error.
            if not available si_mstr then do:
               /* SITE DOES NOT EXIST */
               {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}
               next-prompt site_to with frame a.
               undo , retry.
            end.

            {us/bbi/gprun.i ""gpsiver.p""
               "(input site_to, input ?, output return_int)"}
            if return_int = 0 then do:
               /* USER DOES NOT HAVE ACCESS TO THIS SITE*/
               {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
               /* ACCESS TO THIS SITE*/
               next-prompt site_to with frame a.
               undo, retry.
            end.

            /* OPEN PERIOD VALIDATION FOR THE ENTITY OF TO SITE */
            {us/gp/gpglef02.i &module = ""IC""
               &entity = si_entity
               &date   = eff_date
               &prompt = "site_to"
               &frame  = "a"
               &loop   = "toloop"}

            {us/px/pxrun.i &PROC  = 'getFieldDefault' &PROGRAM = 'ppitxr.p'
                     &HANDLE=ph_ppitxr
                     &PARAM = "( input  pt_part,
                                 input  site_to,
                                 input ""pt_lot_ser"",
                                 output l_pt_lot_ser)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}

            if (l_pt_lot_ser <> "") and (lotser_from <> lotser_to)
            then do:

               /* PERFORM COMPLIANCE CHECK  */
               {us/bbi/gprun.i ""gpltfnd1.p""
                  "(pt_part,
                    lotser_to,
                    """",
                    """",
                    output lot_control,
                    output lot_found,
                    output errmsg)"}

               if ( lot_control > 0 and lot_found ) then do:
                  /* SERIAL NUMBER ALREADY EXISTS */
                  {us/bbi/pxmsg.i &MSGNUM=7482 &ERRORLEVEL=3}
                  next-prompt lotser_to.
                  undo, retry.
               end.

            end.

            /* STOP THE USER FROM TRANSFERRING CUSTOMER CONSIGNED  */
            /* INVENTORY TO A SITE OTHER THAN THE 'FROM' SITE      */
            if site_from <> site_to
            then do:
               l_trfqty_avail = 0 .

               if  (can-find(first is_mstr
                                where is_domain     = global_domain
                                  and is_status     = ld_det.ld_status
                                  and is_overissue  = no))
               then do:
                  if  ld_det.ld_cust_consign_qty <> 0
                  and ld_det.ld_cust_consign_qty > (ld_det.ld_qty_oh  -
                                                    ld_det.ld_qty_all -
                                                    lotserial_qty)
                  then do:

                     l_trfqty_avail = ld_det.ld_qty_oh - ld_det.ld_qty_all -
                                    ld_det.ld_cust_consign_qty.

                     /* CANNOT TRANSFER CUST CONSIGNED INVENTORY. */
                     /* CAN TRANFER QTY UPTO */
                     {us/bbi/pxmsg.i &MSGNUM=7028 &ERRORLEVEL=4 
                     &MSGARG1=l_trfqty_avail}

                     undo xferloop, retry xferloop.

                  end. /* IF (ld_qty_oh - ld_qty_all - lotserial_qty) */
               end. /* IF CAN-FIND(FIRST is_mstr ... */

            end. /* IF site_from <> site_to */

            /* TO PREVENT DEADLOCK IN MULTIPLE SESSIONS LDDET EXCLUSIVE LOCKED */
            find lddet  where lddet.ld_domain = global_domain and
            lddet.ld_part = pt_part
               and lddet.ld_site = site_to
               and lddet.ld_loc  = loc_to
               and lddet.ld_lot  = lotser_to
               and lddet.ld_ref  = lotref_to
            exclusive-lock no-error.

            ld_recid = ?.
            if not available lddet then do:

               create lddet. lddet.ld_domain = global_domain.
               assign
                  lddet.ld_site = site_to
                  lddet.ld_loc = loc_to
                  lddet.ld_part = pt_part
                  lddet.ld_lot = lotser_to
                  lddet.ld_ref = lotref_to.

               find loc_mstr  where loc_mstr.loc_domain = global_domain and
               loc_site = site_to and
                  loc_loc = loc_to no-lock no-error.

               if available loc_mstr then do:
                  lddet.ld_status = loc_status.
               end.
               else do:
                  find si_mstr  where si_mstr.si_domain = global_domain and
                  si_site = site_to no-lock no-error.
                  if available si_mstr then do:
                     lddet.ld_status = si_status.
                  end.
               end.

               assign ld_recid = recid(lddet) no-error.

            end.

            display lddet.ld_status with frame a.

            /*ERROR CONDITIONS*/
            if  ld_det.ld_site = lddet.ld_site
               and ld_det.ld_loc  = lddet.ld_loc
               and ld_det.ld_part = lddet.ld_part
               and ld_det.ld_lot  = lddet.ld_lot
               and ld_det.ld_ref  = lddet.ld_ref
            then do:
               {us/bbi/pxmsg.i &MSGNUM=1919 &ERRORLEVEL=3}
               /*Data results in null transfer*/
               undo, retry.
            end.

            if (l_pt_lot_ser = "S") then do:
               /* LDDET EXACTLY MATCHES THE USER'S 'TO' CRITERIA */
               if lddet.ld_part = pt_part
                  and lddet.ld_site = site_to
                  and lddet.ld_loc  = loc_to
                  and lddet.ld_lot  = lotser_to
                  and lddet.ld_ref  = lotref_to
                  and lddet.ld_qty_oh > 0
               then do:
                  mesg_desc = lddet.ld_site + ', ' + lddet.ld_loc.
                  /* SERIAL EXISTS AT SITE, LOCATION */
                  {us/bbi/pxmsg.i &MSGNUM=79 &ERRORLEVEL=2 &MSGARG1=mesg_desc}
               end.
               else do:
                  find first lddet1  where lddet1.ld_domain = global_domain and
                   lddet1.ld_part = pt_part
                     and lddet1.ld_lot  = lotser_to
                     and lddet1.ld_qty_oh > 0
                     and recid(lddet1) <> ld_recid_from
                  no-lock no-error.
                  if available lddet1 then do:
                     mesg_desc = lddet1.ld_site + ', ' + lddet1.ld_loc.
                     /* SERIAL EXISTS AT SITE, LOCATION */
                     {us/bbi/pxmsg.i &MSGNUM=79 &ERRORLEVEL=2 &MSGARG1=mesg_desc}
                  end.
               end.
            end.

            if lddet.ld_qty_oh = 0 then do:
               assign
                  lddet.ld_date  = ld_det.ld_date
                  lddet.ld_assay = ld_det.ld_assay
                  lddet.ld_grade = ld_det.ld_grade
                  lddet.ld_expire = ld_det.ld_expire.
            end.
            else do:
               /*Assay, grade or expiration conflict. Xfer not allowed*/
               if lddet.ld_grade     <> ld_det.ld_grade
                  or lddet.ld_expire <> ld_det.ld_expire
                  or lddet.ld_assay  <> ld_det.ld_assay
               then do:
                  If execname = "iclotr02.p"
                  then do:
                     {us/bbi/gprun.i ""icldmta.p""
                        "(input site_to,
                          input loc_to,
                          input pt_part,
                          input lotser_to,
                          input lotref_to,
                          input lotserial_qty,
                          input eff_date,
                          input """",
                          input lddet.ld_status,
                          input lddet.ld_cnt_date,
                          input lddet.ld_grade,
                          input lddet.ld_assay,
                          input lddet.ld_status,
                          input lddet.ld_expire,
                          input lddet.ld_alt_um,
                          output l_ldrecno,
                          input """")"}
                     for first lddet
                        where recid(lddet) = l_ldrecno
                     exclusive-lock:
                     end. /* FOR FIRST lddet */
                  end. /*IF EXECNAME = "iclotr02.p*/
                  else do:
                     {us/bbi/pxmsg.i &MSGNUM=1918 &ERRORLEVEL=4}
                     undo, retry.
                  end. /*ELSE DO */
               end. /*IF lddet.ld_grade  <> ld_det.ld_grade*/
            end. /*ELSE DO*/

            if status_from <> lddet.ld_status then do:

               if lddet.ld_qty_oh = 0 then do:

                  if trtype = "LOT/SER" then do:
                     /*To-loc has zero balance. Status may be changed*/
                     {us/bbi/pxmsg.i &MSGNUM=1911 &ERRORLEVEL=1}
                     bell.
                     statusloop:
                     do on error undo, retry:
                        set lddet.ld_status with frame a.
                     end.
                  end. /*ld_qty_oh = 0 and trtype = "LOT/SER"*/

                  else do:

                     yn = no.
                     bell.
                     /*Status conflict.  Use "to" status?*/
                     {us/bbi/pxmsg.i &MSGNUM=1917 &ERRORLEVEL=1 &CONFIRM=yn}

                     if not yn then do:

                        yn = yes.
                        /*Status conflict.  Use "from" status?*/
                        {us/bbi/pxmsg.i &MSGNUM=1916 &ERRORLEVEL=1 &CONFIRM=yn}

                        if yn then do:
                           /* TO GENERATE ERROR MESSAGE WHEN "TO"       */
                           /* INVENTORY STATUS IS DIFFERENT FROM "FROM" */
                           /* INVENTORY STATUS AND IF ld_status IS      */
                           /* RESTRICTED FOR THE USER IN FIELD SECURITY */
                           /* MAINTENANCE                               */
                           if ({ us/gp/gppswd3.i &field = ""ld_status"" } = no)
                           then do:
                              /* USER DOES NOT HAVE ACCESS TO FIELD */
                              {us/bbi/pxmsg.i &MSGNUM=3337 &ERRORLEVEL=3
                                       &MSGARG1=""ld_status""}
                              undo,retry.
                           end. /* IF ({ us/gp/gppswd3.i */
                           lddet.ld_status = ld_det.ld_status.
                           display lddet.ld_status.
                        end.

                        else do:
                           undo, retry.
                        end.

                     end.

                  end. /*ld_qty_oh = 0 and trtype <> "LOT/SER"*/

               end. /*ld_qty_oh = 0*/

               else do:
                  /*Status conflict.  Use "to" status?*/
                  yn = yes.
                  bell.
                  {us/bbi/pxmsg.i &MSGNUM=1917 &ERRORLEVEL=1 &CONFIRM=yn}
                  if not yn then undo, retry.
               end. /*ld_qty_oh <> 0 & LOT/SER*/

            end. /*lddet.ld_status <> ld_det.ld_status*/

            find is_mstr  where is_mstr.is_domain = global_domain and
            is_status = lddet.ld_status no-lock.
            if not is_overissue and lddet.ld_qty_oh + lotserial_qty < 0
            then do:
               /*Transfer will result in negative qty at "to" loc*/
               {us/bbi/pxmsg.i &MSGNUM=1920 &ERRORLEVEL=3}
               next-prompt loc_to.
               undo, retry.
            end.

            {us/bbi/gprun.i ""icedit.p""
               "(""RCT-TR"",
                 site_to,
                 loc_to,
                 pt_part,
                 lotser_to,
                 lotref_to,
                 lotserial_qty,
                 pt_um,
                 """",
                 """",
                 output undo-input)"}

            if undo-input and batchrun then
               undo transloop,
               retry transloop.

            if undo-input and
               can-find(si_mstr  where si_mstr.si_domain = global_domain and
               si_site = site_to) and
               not can-find(loc_mstr  where loc_mstr.loc_domain = global_domain
               and  loc_site = site_to and
                                           loc_loc = loc_to)
            then
               next-prompt loc_to.
   
            if undo-input 
            then do:
               case l_prompt:
                  when "loc" 
                  then do:
                     next-prompt loc_to.
                     undo, retry.
                  end. /* WHEN "loc" */
                  when "site" 
                  then do:
                     next-prompt site_to.
                     undo, retry.
                  end. /* WHEN "site" */
                  when "lotser" 
                  then do:
                     next-prompt lotser_to.
                     undo, retry.
                  end. /* WHEN "lotser" */
                  when "um" 
                  then do:
                     next-prompt part.
                     undo transloop, retry transloop.
                  end. /* WHEN "um" */
                  when "qty" 
                  then do:
                     next-prompt lotserial_qty.
                     undo toloop, retry toloop.
                  end. /* WHEN "qty" */
                  when "wo" 
                  then do:
                     next-prompt nbr.
                     undo toloop, retry toloop.
                  end. /* WHEN "wo" */
               end case.
            end. /* IF undo-input */
   
            empty temp-table ttUpdateRestrictionSignature.
            create ttUpdateRestrictionSignature.

            /* Check if Item, Site & Location Combination is restricted */
            if lookup(execname, "iclotr02.p,iclotr03.p") > 0
            then do:

               assign
                  ttUpdateRestrictionSignature.category          = {&INVTRN}
                  ttUpdateRestrictionSignature.program           = execname
                  ttUpdateRestrictionSignature.part              = pt_part
                  ttUpdateRestrictionSignature.site              = site_from
                  ttUpdateRestrictionSignature.siteTo            = site_to
                  ttUpdateRestrictionSignature.location          = loc_from
                  ttUpdateRestrictionSignature.locationTo        = loc_to
                  ttUpdateRestrictionSignature.inventoryStatus   = status_from
                  ttUpdateRestrictionSignature.inventoryStatusTo = ld_status
                  ttUpdateRestrictionSignature.account           = ?
                  ttUpdateRestrictionSignature.subAccount        = ?
                  ttUpdateRestrictionSignature.costCenter        = ?
                  ttUpdateRestrictionSignature.project           = ?
                  ttUpdateRestrictionSignature.changeInventoryStatus = no.

              if isUpdateRestricted (input table ttUpdateRestrictionSignature,
                                     input yes)
               then do:
                  undo, retry.
               end.
            end.

            error-status:error = no.
            assign ve_recid = recid(ld_det) no-error.
            validate lddet no-error.
            if error-status:error then do:
               /* RECORD LOCKED BY ANOTHER USER.  TRY LATER # */
               {us/bbi/pxmsg.i &MSGNUM=7422 &ERRORLEVEL=3 }
               undo transloop, retry transloop.
            end. /* IF ERROR-STATUS:ERROR */
            release lddet.
            release ld_det.

            {us/bbi/gprun.i ""icedit.p""
               "(""ISS-TR"",
                 site_from,
                 loc_from,
                 pt_part,
                 lotser_from,
                 lotref_from,
                 lotserial_qty,
                 pt_um,
                 """",
                 """",
                 output undo-input)"}
   
            if undo-input 
            then do:
               case l_prompt:
                  when "loc" then 
                     next-prompt loc_to.
                  when "site" then 
                     next-prompt site_to.
                  when "lotser" then
                     next-prompt lotser_to.
                  when "um" then
                     next-prompt pt_um.
                  when "qty" then
                     next-prompt lotserial_qty.
                  when "wo" then
                     next-prompt nbr.
               end case.
               undo, retry.
            end. /* IF undo-input */
   
         end. /* send-loop */

         hide message.

         /* clear work table records of LG and GL */
         {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}

         /* RESET GLOBAL PART VARIABLE IN CASE IT HAS BEEN CHANGED*/
         global_part = pt_part.
         global_addr = "".

         /*PASS BOTH LOTSER_FROM & LOTSER_TO IN PARAMETER LOTSERIAL*/
         if lotser_from = ?
         then
            substring(lotserial,1,1) = "?".
         else
            lotserial = lotser_from.
         if lotser_to = ""
         then
            substring(lotserial,40,1) = "#".
         else if lotser_to = ?
         then
            substring(lotserial,40,1) = "?".
         else
            substring(lotserial,19,18) = lotser_to.

         if (   lotser_from <> lotser_to
             or site_from   <> site_to
             or lotref_from <> lotref_to)
         then do:
            if lotserial_qty > 0
            then do:
               for first ld_det
                  where ld_det.ld_domain = global_domain
                  and   ld_det.ld_part   = pt_part
                  and   ld_det.ld_site   = site_from
                  and   ld_det.ld_loc    = loc_from
                  and   ld_det.ld_lot    = lotser_from
                  and   ld_det.ld_ref    = lotref_from
               no-lock:
               end. /* FOR FIRST ld_det */

               if available ld_det
               then do:
                  {us/bbi/gprun.i ""iccnchk.p""
                     "(  input  site_from,
                         input  site_to,
                         input  loc_to,
                         input  lotser_from,
                         input  lotref_from,
                         input  lotserial_qty,
                         input  ld_det.ld_qty_oh,
                         input  loc_from,
                         output l_err_flag)"}

                  if l_err_flag = yes
                  then
                     undo, retry.
               end. /*IF AVAILABLE ld_det */
            end. /* IF lotserial_qty > 0 */

            else do:
               for first ld_det
                  where ld_det.ld_domain = global_domain
                  and   ld_det.ld_part   = pt_part
                  and   ld_det.ld_site   = site_to
                  and   ld_det.ld_loc    = loc_to
                  and   ld_det.ld_lot    = lotser_to
                  and   ld_det.ld_ref    = lotref_to
               no-lock:
               end. /* FOR FIRST ld_det */

               if available ld_det
               then do:
                  {us/bbi/gprun.i ""iccnchk.p""
                     "(input  site_to,
                       input  site_from,
                       input  loc_from,
                       input  lotser_to,
                       input  lotref_to,
                       input  (lotserial_qty * -1),
                       input  ld_det.ld_qty_oh,
                       input  loc_to,
                       output l_err_flag)"}

                  if l_err_flag = yes
                  then
                     undo. retry.
               end. /*IF AVAILABLE ld_det */
            end. /* IF NOT lotserial_qty > 0 */

         end. /*IF (lotser_from <> lotser_to*/

         run p_deleteOrphanedInvQadWkfl.
         l_err_flag = no.
         run p-chk-qadwkfl(input site_from,
                           input loc_from,
                           input pt_part,
                           input lotser_from,
                           input lotref_from,
                           input lotserial_qty,
                           output l_err_flag).
         if l_err_flag = yes
         then
            undo, retry.

         if poc_fiscal_confirm
         then do:
            pause 0.
            run fillLDInfo(input site_from, yes, yes).
            if return-value = {&APP-ERROR-RESULT}
            then do:
               hide frame rec-lgd.
               undo toloop, retry toloop.
            end.
            if not issueld then do:
               run fillLDSites(lgdkey, site_from, site_to, loc_from, loc_to).
            end.
         end.

         /* IS ALL INFORMATION CORRECT? */
         yn = true.
         {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM=yn}
         if not yn then undo transloop, retry transloop.

         run p-create-qadwkfl (input site_from,
                               input loc_from,
                               input pt_part,
                               input lotser_from,
                               input lotref_from,
                               input lotserial_qty).

         /* CONFIGURED TO BE ABLE TO PREVIEW E-SIGNATURE DATA */
         if ll_isesig_on then do:
            run preSignESigDataAlt(input part).
            if not ll_success then undo transloop, retry transloop.

            /* SESSION TRIGGER FOR TR_HIST TABLE */
            on write of tr_hist
            do:
               find first tt_log no-lock
                  where tt_rec = recid(tr_hist) no-error.
               if not available tt_log then
               do:
                  create tt_log.
                  tt_rec = recid(tr_hist).
               end.
            end.
         end.

         /* Clear shipper line item temp table */
         {us/bbi/gprun.i  ""icshmt1c.p"" }

         assign
            from_site = site_from
            from_loc  = loc_from
            to_site   = site_to
            to_loc    = loc_to.

         if from_site = to_site and from_loc <> to_loc then do:
            assign
               from_site = ""
               to_site   = "".
            for first loc_mstr
               where loc_mstr.loc_domain = global_domain
               and   loc_site = site_from
               and   loc_loc  = loc_from
            no-lock:
               from_site = loc_phys_addr.
            end.
            for first loc_mstr
               where loc_mstr.loc_domain = global_domain
               and   loc_site = site_to
               and   loc_loc  = loc_to
            no-lock:
               to_site   = loc_phys_addr.
            end.
         end.

         /* Add to shipper line item temp table */
         {us/bbi/gprun.i ""icshmt1a.p""
            "(nbr,
              """",
              pt_part,
              lotser_from,
              lotref_from,
              from_site,
              from_loc,
              lotserial_qty,
              pt_um,
              1,
              pt_net_wt * lotserial_qty,
              pt_net_wt_um,
              pt_size * lotserial_qty,
              pt_size_um)" }
      end. /* end of toloop */

      createShipperLoop:
      do on error undo:
         /* Do not create shipper for RCT of Inventory Transfer */
         if not poc_fiscal_confirm or issueld = yes
         then do:
            /* Get unconfirmShipperFlg from Shipper Control, and */
            /* display a message for user confirmation */
            {us/gp/gprunp.i "soldxr" "p" "getUnconfirmShipperFlg"
          "(input from_site,
            input to_site)"}

            if from_site <> to_site then do:
               /* Create shipper */
               {us/bbi/gprun.i ""icshmt.p""
                  "(from_site,
                    to_site,
                    ""ISS-TR"",
                    eff_date,
                    ""yes"",
                    output v_abs_recid,
                    output v_trflow_flg)" }

               run p-del-qad-wkfl (input "icshmt.p",
                                   input SessionUniqueID).

               if c-application-mode <> "API" then
               view frame a.
            end.
         end.
         else do:
            assign
               v_abs_recid = ?
               v_trflow_flg = no.
         end.
      end. /* createShipperLoop */

      postShipperLoop:
      do on error undo:
         /* Get associated shipper */
         find abs_mstr where recid(abs_mstr) = v_abs_recid
         no-lock no-error.
         if available abs_mstr then
         assign
            v_shipnbr  = substring(abs_id,2)
            v_shipdate = abs_shp_date
            v_invmov   = abs_inv_mov.
         else
         assign
            v_shipnbr  = ""
            v_shipdate = ?
            v_invmov   = "".

         /* SHIP_NBR, SHIP_DATE, INV_MOV,                                 */

         assign impexp = no.
         if active_mod = yes then do:
            find first iec_ctrl  where iec_ctrl.iec_domain = global_domain no-lock
            no-error.
            if available iec_ctrl and iec_impexp = yes then impexp = yes.

            if impexp then do:
               {us/bbi/gprun.i ""ieckcty2.p""
                  "(input site_to, input site_from, input '5', output impexp)"}
            end.
            update impexp with frame a.
         end.

         /* RESET GLOBAL PART VARIABLE IN CASE IT HAS BEEN CHANGED        */

         {us/bbi/gprun.i ""icxfer.p""
            "("""",
              lotserial,
              lotref_from,
              lotref_to,
              lotserial_qty,
              nbr,
              so_job,
              rmks,
              """",
              eff_date,
              site_from,
              loc_from,
              site_to,
              loc_to,
              no,
              v_shipnbr,
              v_shipdate,
              v_invmov,
              0,
              """",
              output glcost,
              output iss_trnbr,
              output rct_trnbr,
              input-output assay,
              input-output grade,
              input-output expire)"}

         {us/gp/gprunp.i "soldxr" "p" "check_unconfirmship"
                   "(output v_unconfirm_flg)"}

         if not v_unconfirm_flg and v_invmov <> "" and v_shipnbr <> "" then do:
            /* Tax posting */
            for each tr_hist where tr_domain = global_domain
               and tr_ship_inv_mov = v_invmov
               and tr_ship_id      = v_shipnbr no-lock
            break by tr_type by tr_nbr by tr_line by tr_part by tr_serial:
               if last-of(tr_serial) and tr_type <> "RCT-TR" then
                  {us/bbi/gprun.i ""icgltax.p""
                                  "(input tr_trnbr,
                                    input v_abs_recid)"}
            end.
         end.

         /* E-Signature Signing */
         if ll_isesig_on then do:
            release tr_hist no-error.
            on write of tr_hist revert.
            run signESigDataAlt.
            if not ll_success then undo transloop, retry transloop.
         end.

/*cy1033*  start added code */
         optrnbr = integer(rmks) no-error.
         if error-status:error then optrnbr = ?.

/*c1447*/ run logit("Rmks: " + rmks + "|" + "Null: " + string(optrnbr = ?)).

         /* OUTPUT DESTINATION SELECTION */
         {us/gp/gpselout.i &printType                = "printer"
               &printWidth               = 132
               &pagedFlag                = " "
               &stream                   = "stream ft"
               &appendToFile             = " "
               &streamedOutputToTerminal = " "
               &withBatchOption          = "no"
               &displayStatementType     = 1
               &withCancelMessage        = "yes"
               &pageBottomMargin         = 6
               &withEmail                = "yes"
               &withWinprint             = "yes"
               &defineVariables          = "yes"}

/*c1447*/ run logit("Printer - xxplprint.p|" + dev).
/*c1447*/ run logit("Print Labels - xxplprint.p|" + rmks).

        {us/bbi/gprun.i ""xxplprint.p"" "(rct_trnbr, optrnbr)"}

      {us/bbi/mfreset.i "stream ft"}   /* close output stream */

/*c1460* start added code */
/* add pause here to adjust timing of output */
for first code_mstr no-lock
where code_domain = global_domain
and   code_fldname = "Pause xxiclotr"
and   code_value = "":
   pausecount = integer(code_mstr.code_cmmt) no-error.
   if error-status:error then pausecount = 0.
   if pausecount = ? then pausecount = 0.
   do i = pausecount to 1 by -1:
      pause 1 no-message.
   end.
end.
/*c1460* end   added code */

/*c1447*/ run logit("Datastream Close - mfreset.i|" + rmks).
/*cy1033*  end added code */

         /* If the transaction flow is not internal,
         then print non-electronic legal document */
         v_print_elec_ld = no.
         if v_trflow_flg = yes and not v_unconfirm_flg then do:
            /* Global Shipping: assign Legal Doc nbr */
            {us/bbi/gprun.i ""gpldnbr.p"" "(recid(abs_mstr))"}

            /* COLLECT INFO FOR THE LEGAL DOCUMENT */
            {us/gp/gprunp.i "soldxr" "p" "saveLegalSiteLoc"
               "(input abs_id,
                 input site_from,
                 input loc_from,
                 input site_to,
                 input loc_to)"}

            {us/gp/gprunp.i "soldxr" "p" "checkElecLDForShipper"
               "(input oid_abs_mstr,
                 output v_elec_ld)"}

            if v_elec_ld = no then do: 
               {us/bbi/gprun.i ""icldprt.p"" "(recid(abs_mstr))"}
            end.
            else
               v_print_elec_ld = yes.
         end.

         /* Clear the records in work table for unconfirm shipper flag. */
         {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfUnConfirmSh"}

         /* update legal document number in General Ledger Unposted Transaction Detail table */
         {us/gp/gprunp.i "soldxr" "p" "updateLegalNumToUnpostedGL"}

         /* CHECK TO SEE IF CONSIGNMENT IS ACTIVE */
         {us/bbi/gprun.i ""gpmfc01.p""
            "(input ENABLE_CUSTOMER_CONSIGNMENT,
              input 10,
              input ADG,
              input CUST_CONSIGN_CTRL_TABLE,
              output using_cust_consignment)"}

         if site_from = site_to
         then do:
            if using_cust_consignment then do:
               {us/gp/gprunmo.i &program=""socncix1.p"" &module="ACN"
                  &param="""(input pt_part,
                             input lotserial_qty,
                             input nbr,
                             input site_from,
                             input loc_from,
                             input lotser_from,
                             input lotref_from,
                             input l_auth,
                             input site_to,
                             input loc_to,
                             input lotser_to,
                             input lotref_to,
                             input so_job,
                             input pt_um,
                             input iss_trnbr,
                             input rct_trnbr,
                             input eff_date,
                             input v_shipnbr)"""}
            end. /*IF USING_CUST_CONSIGNMENT*/
         end. /* IF site_from = site_to   */

         /* DETERMINE IF SUPPLIER PERFORMANCE IS INSTALLED */
         if can-find (mfc_ctrl  where mfc_ctrl.mfc_domain = global_domain and
                     mfc_field = "enable_supplier_perf" and mfc_logical) and
            can-find (_File where _File-name = "vef_ctrl") then do:

            {us/bbi/gprun.i ""iclotrve.p""
                      "(input pt_part)"}
         end.  /* IF ENABLE SUPPLIER PERFORMANCE */

         /* RECORD WIP LOT TRACING DATA WHEN CHANGING ONE LOT/SERIAL */
         /* NUMBER TO ANOTHER LOT/SERIAL NUMBER                      */
         if is_wiplottrace_enabled() and
            lotser_from <> ""        and
            lotser_to <> ""
         then do:

            run get_transaction_number in h_wiplottrace_procs
               (output trans_nbr).

            run record_lot_serial_change in h_wiplottrace_procs
               (input trans_nbr,
                input lotser_from,
                input lotser_to,
                input pt_part,
                input lotserial_qty).

         end. /* if is_wiplottrace_enabled */

         do:
            if ld_recid <> ? then
               find ld_det where ld_recid = recid(ld_det) no-error.

            if available ld_det then do:
               find loc_mstr  where loc_mstr.loc_domain = global_domain and
               loc_site = ld_det.ld_site
                               and loc_loc  = ld_det.ld_loc
               no-lock.
               if ld_det.ld_qty_oh = 0 and ld_det.ld_qty_all = 0 and
                  not loc_perm and
                  not can-find(first tag_mstr
                                where tag_mstr.tag_domain = global_domain and
                                tag_site   = ld_det.ld_site
                                 and tag_loc    = ld_det.ld_loc
                                 and tag_part   = ld_det.ld_part
                                 and tag_serial = ld_det.ld_lot
                                 and tag_ref    = ld_det.ld_ref)
               then
                  delete ld_det.
            end.
         end. /* end transaction */
      
         display
            global_part @ part
            from-label
            to-label
         with frame a.
/*c1381* /*cy1033*/ leave xferloop. */
/*c1381* moved as it pre-empted qad_wkfl cleanup */

         if poc_fiscal_confirm
         then do:
            run bindTRHist(input lgdkey, input ?, input rct_trnbr).
            run clearEmptyLD(input lgdkey, no).

         end.

         run p-del-qad-wkfl (input "iclotr.p" + SessionUniqueID,
                             input SessionUniqueID).

         /* NOTE: PRINT ELECTRONIC LEGAL DOCUMENT AFTER THE 
          *       TRANACTION ISCOMMITED TO PREVENT SENDING 
          *       ELECTRONIC REQUEST FOR ANY LEGAL DOCUMENT
          *       THAT IS ROLLED BACK BY THE SYSTEM.
          */
         if v_abs_recid <> ? and v_print_elec_ld then do:
            {us/bbi/gprun.i ""icldprt.p"" "(v_abs_recid)"}
         end.
      end. /* postShipperLoop */
/*c1381*/ leave xferloop. 
   end. /* xferloop */
end. /* transloop */

if is_wiplottrace_enabled() then
   delete PROCEDURE h_wiplottrace_procs no-error.
if is_wiplottrace_enabled() then
   delete PROCEDURE h_wiplottrace_funcs no-error.

/* DUE TO THE TRANSACTION SCOPING AND THE USLH_HIST RECORDS */
/* CREATED IN CREATELOGONHISTORY WHICH GETS UNDONE WHEN THE */
/* USER IS DEACTIVATED, WE NOW NEED TO CREATE THEM AGAIN.   */
if ll_isesig_on and ll_quitmfgpro then do:
   {us/es/essestrig.i &TABLE="uslh_hist" &EVENT="RevertWrite"}
end.

/* E-Sig cleaning */
if ll_isesig_on then run cleanupEsig.

unsubscribe to "getPrompt".

PROCEDURE proc_shipper:
   view frame b.
   display from-label to-label with frame b.
   assign
      from_proc       = ?
      lotser_from     = ""
      lotref_from     = ""
      part_net_wt_um  = (if part_net_wt_um = "" then "EA"
                        else part_net_wt_um)
      part_size_um    = (if part_size_um = "" then "EA" else part_size_um)
      eff_date        = (if eff_date = ? then today else eff_date).

   frame-b-loop:
   do on error undo, retry  on endkey undo, leave with frame b:
      display part_desc part_um with frame b.
      set part_desc part_um with frame b.

      lotser-loop:
      do on error undo:
         display eff_date lotserial_qty with frame b.
         set lotserial_qty  eff_date  nbr with frame b.
         if lotserial_qty = 0 then do:
            {us/bbi/pxmsg.i &MSGNUM=7100 &ERRORLEVEL=3}
            undo lotser-loop, retry lotser-loop.
         end.

         partinfo-loop:
         do on error undo, retry on endkey undo, leave with frame b:

            display part_net_wt
                    part_net_wt_um
                    part_size
                    part_size_um
                    site_from
                    loc_from
                    site_to
                    loc_to
            with frame b.

            set part_net_wt
                part_net_wt_um
                part_size
                part_size_um
                site_from
                loc_from
                site_to
                loc_to
            with frame b.
            if not can-find(si_mstr
               where si_mstr.si_domain = global_domain
               and  si_site            = site_from no-lock)
            then do:
               {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}
                next-prompt site_from with frame b.
                undo partinfo-loop, retry partinfo-loop.
            end.

            if not can-find(si_mstr
               where si_mstr.si_domain = global_domain
               and  si_site            = site_to no-lock)
            then do:
               {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}
               next-prompt site_to with frame b.
               undo partinfo-loop, retry partinfo-loop.
            end.
         end.
      end.
      assign yn = true.
      {us/bbi/pxmsg.i &MSGNUM=12 &ERRORLEVEL=1 &CONFIRM = yn}
      if not yn then undo frame-b-loop, retry frame-b-loop.

      /* CLEAR SHIPPER LINE ITEM TEMP TABLE */
      {us/bbi/gprun.i  ""icshmt1c.p"" }

      assign from_site = site_from
             from_loc  = loc_from
             to_site   = site_to
             to_loc    = loc_to.
      if from_site = to_site and from_loc <> to_loc then do:
         assign
            from_site = ""
            to_site   = "".
         for first loc_mstr
          where loc_mstr.loc_domain = global_domain
            and loc_site    = site_from
            and loc_loc  = loc_from
         no-lock:
            from_site = loc_phys_addr.
         end.

         for first loc_mstr
          where loc_mstr.loc_domain = global_domain
            and loc_site   = site_to
            and loc_loc  = loc_to
         no-lock:
            to_site   = loc_phys_addr.
         end.
      end.

      /* ADD TO SHIPPER LINE ITEM TEMP TABLE */
      {us/bbi/gprun.i
         ""icshmt1a.p""
         "("""",
           """",
           part_part,
           lotser_from,
           lotref_from,
           from_site,
           from_loc,
           lotserial_qty,
           part_um,
           1,
           part_net_wt * lotserial_qty,
           part_net_wt_um,
           part_size * lotserial_qty,
           part_size_um)" }

      /* Get unconfirmShipperFlg from Shipper Control, and */
      /* display a message for user confirmation */
      {us/gp/gprunp.i "soldxr" "p" "getUnconfirmShipperFlg"
         "(input from_site,
	   input to_site)"}

      /* CREATE SHIPPER */
      {us/bbi/gprun.i
         ""icshmt.p""
         "(from_site,
           to_site,
           ""ISS-TR"",
           eff_date,
           ""yes"",
           output v_abs_recid,
           output v_trflow_flg)" }

      if v_abs_recid = ? then do:
         {us/bbi/pxmsg.i &MSGNUM=5323 &ERRORLEVEL=1}
         undo, retry.
      end.

      run p-del-qad-wkfl (input "icshmt.p",
                          input SessionUniqueID).

      {us/gp/gprunp.i "soldxr" "p" "check_unconfirmship"
                "(output v_unconfirm_flg)"}

      if v_trflow_flg = yes and not v_unconfirm_flg then do:
         {us/bbi/gprun.i ""gpldnbr.p"" "(v_abs_recid)"}

         find first abs_mstr where recid(abs_mstr) = v_abs_recid no-lock no-error.

         if available abs_mstr then do:
            {us/px/pxrun.i &PROC='saveLegalSiteLoc'
                &PROGRAM='soldxr.p'
                &HANDLE=ph_soldxr
                &PARAM="(input abs_id,
                         input site_from,
                         input loc_from,
                         input site_to,
                         input loc_to)"
                &NOAPPERROR=true
                &CATCHERROR=true}
         end.

         {us/bbi/gprun.i ""icldprt.p"" "(v_abs_recid)"}
      end.

      /* Clear the records in work table for unconfirm shipper flag. */
      {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfUnConfirmSh"}
   end.

   /* GET ASSOCIATED SHIPPER */
   find abs_mstr where recid(abs_mstr) = v_abs_recid exclusive-lock no-error.
   if available abs_mstr then do:
      assign
         abs_item       =  part_part
         abs_shipfrom   =  from_site
         abs_inv_nbr    =  nbr
         abs_desc       =  part_desc.
   end.
   assign from_proc = yn.
   hide frame b no-pause.
   view frame dtitle.
end.

delete procedure hUpdateRestrictedLibrary no-error.

procedure getPrompt:
   define input parameter p_nextprompt as character no-undo.

   l_prompt = p_nextprompt.
end procedure. /* GETPROMPT */

procedure p-del-qad-wkfl:
/*-----------------------------------------------------------------------
  Purpose:      Clean up qad_wkfl records used for icshmt.p and iclotr.p
  Parameters:
  Notes:
-------------------------------------------------------------------------*/
   define input parameter pi_key  like qad_key1 no-undo.
   define input parameter pi_key2 like qad_key4 no-undo.

   define buffer b_qad_wkfl     for qad_wkfl.
   define buffer b_del_qad_wkfl for qad_wkfl.

   for each b_qad_wkfl
      where b_qad_wkfl.qad_domain = global_domain
      and   b_qad_wkfl.qad_key1   = pi_key
      and   b_qad_wkfl.qad_key4   = pi_key2
   no-lock:
      find b_del_qad_wkfl
         where recid(b_del_qad_wkfl) = recid(b_qad_wkfl)
      exclusive-lock no-error.
      if available b_del_qad_wkfl
      then
         delete b_del_qad_wkfl.
   end. /* FOR EACH qad_wkfl */
end procedure.  /* p-del-qad-wkfl */

procedure p-chk-qadwkfl:
/*-----------------------------------------------------------------------
 Purpose: To check qad_wkfl record exist or not
 Parameters:
 Notes:
-------------------------------------------------------------------------*/
   define input parameter p_site_from   like ld_site     no-undo.
   define input parameter p_loc_from    like ld_loc      no-undo.
   define input parameter p_part        like ld_part     no-undo.
   define input parameter p_lotser_from like ld_lot      no-undo.
   define input parameter p_lotref_from like ld_ref      no-undo.
   define input parameter p_qty         like ld_qty_oh   no-undo.
   define output parameter p_err_flag   like mfc_logical no-undo.

   define buffer buf_ld_det for ld_det.
   define buffer buf_is_mstr for is_mstr.

   define variable l_qty    like ld_qty_oh   no-undo.
   define variable l_remQty like ld_qty_oh   no-undo.
   define variable l_qadAvl like mfc_logical no-undo.

   for each qad_wkfl
      where qad_domain = global_domain
      and   qad_key1   begins "iclotr.p"
      and   qad_key2   = p_part + "," + p_site_from + ',' + p_loc_from
                       + ',' + p_lotser_from + ',' + p_lotref_from
   no-lock:
      if qad_wkfl.qad_key4 <> SessionUniqueID
      then
         assign
            l_qty    = l_qty + qad_wkfl.qad_decfld[1]
            l_qadAvl = yes.
   end. /* FOR EACH qad_wkfl */

   if l_qadAvl = yes then do:
      for first buf_ld_det
         where buf_ld_det.ld_domain = global_domain
         and   buf_ld_det.ld_site   = p_site_from
         and   buf_ld_det.ld_loc    = p_loc_from
         and   buf_ld_det.ld_part   = p_part
         and   buf_ld_det.ld_lot    = p_lotser_from
         and   buf_ld_det.ld_ref    = p_lotref_from
      no-lock:
         if buf_ld_det.ld_qty_oh < (l_qty + p_qty)
         then do:
            l_remQty = buf_ld_det.ld_qty_oh - l_qty.
            for first buf_is_mstr
               where buf_is_mstr.is_domain = global_domain
               and   buf_is_mstr.is_status = buf_ld_det.ld_status
            no-lock:
               if not is_overissue
               then do:
                  /* QUANTITY AVAILABLE IN SITE LOCATION FOR LOT/SERIAL */
                  {us/bbi/pxmsg.i &MSGNUM=208 &ERRORLEVEL=3 &MSGARG1=l_remQty}
                  p_err_flag = yes.
               end. /* IF NOT is_overissue */
            end. /* FOR FIRST buf_is_mstr */
         end. /* IF buf_ld_det.ld_qty_oh < (l_qty + p_qty) */
      end. /* FOR FIRST buf_ld_det */
   end. /* IF l_qadAvl = yes */
   return.
end procedure. /* p-chk-qadwkfl */

procedure p-create-qadwkfl:
/*-----------------------------------------------------------------------
 Purpose: To create qad_wkfl record if does not exist.
 Parameters:
 Notes:
-------------------------------------------------------------------------*/
   define input parameter p_site_from   like ld_site   no-undo.
   define input parameter p_loc_from    like ld_loc    no-undo.
   define input parameter p_part        like ld_part   no-undo.
   define input parameter p_lotser_from like ld_lot    no-undo.
   define input parameter p_lotref_from like ld_ref    no-undo.
   define input parameter p_qty         like ld_qty_oh no-undo.

   do transaction:

      for first qad_wkfl
         where qad_domain = global_domain
         and   qad_key1   = "iclotr.p" + SessionUniqueID
         and   qad_key2   =  p_part + "," + p_site_from + ',' + p_loc_from
                          + ',' + p_lotser_from + ',' + p_lotref_from
         and   qad_key4   = SessionUniqueID
      no-lock:
      end. /* FOR FIRST qad_wkfl */

      if not available qad_wkfl
      then do:
         create qad_wkfl.
         assign
            qad_domain     = global_domain
            qad_key1       = "iclotr.p" + SessionUniqueID
            qad_key2       = p_part + "," + p_site_from + ',' + p_loc_from
                           + ',' + p_lotser_from + ',' + p_lotref_from
            qad_decfld[1]  = p_qty
            qad_key4       = SessionUniqueID
            qad_key3       = mfguser /* This is stored so that we can */
                                     /* check for mon_mstr availability */
            qad_charfld[1] = global_userid
            qad_charfld[2] = p_part
            qad_charfld[3] = p_site_from
            qad_date[1]    = today
            qad_charfld[5] = string(time, "hh:mm:ss").

         if recid(qad_wkfl) = -1
         then
            .
      end. /* IF NOT AVAILABLE qad_wkfl */
   end. /* DO TRANSACTION */
end procedure. /* p-create-qadwkfl */

procedure p_deleteOrphanedInvQadWkfl:
/*-----------------------------------------------------------------------
 Purpose: To delete orphaned qad_wkfl records if user exited using ctrl-c
 Parameters:
 Notes:
-------------------------------------------------------------------------*/
   define buffer b_qad_wkfl     for qad_wkfl.
   define buffer b_del_qad_wkfl for qad_wkfl.

   for each b_qad_wkfl
      where b_qad_wkfl.qad_domain = global_domain
      and   b_qad_wkfl.qad_key1   begins "iclotr.p"
   no-lock:
      if not can-find(mon_mstr
                         where mon_mstr.mon_sid = b_qad_wkfl.qad_key3)
      then do:
         find b_del_qad_wkfl
            where recid(b_del_qad_wkfl) = recid(b_qad_wkfl)
         exclusive-lock no-error.
         if available b_del_qad_wkfl
         then
            delete b_del_qad_wkfl.
      end. /* IF NOT CAN-FIND(mon_mstr) */
   end. /* FOR EACH b_qad_wkfl */
end procedure. /* p_deleteOrphanedInvQadWkfl */




/* c1447* start added code */
procedure logit.
define input parameter ipmsg as char.
def var cfilname as char.
cfilname = "iclotr_" + 
		  string(year(today), "9999") +
		  string(month(today), "99") +
		  string(day(today), "99") +
		  ".log".

output stream lg to value(cfilname) append.
put stream lg unformatted
string(today) "|"
string(time, "HH:MM:SS") "|"
trim(global_userid) "|"
trim(program-name(2)) "|"
trim(program-name(3)) "|"
trim(ipmsg)
skip.

output stream lg close.
end.  /* procedure logit */
/* c1447* end   added code */
