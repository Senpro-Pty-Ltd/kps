/* xfpapawt.p - Calc Shippment Weight Summary Including Pack by Serl Logic      */
/* papawt.p - Calc Shippment Weight Summary Including Pack by Serl Logic      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/*                                                                            */
/* $Id: xfpapawt.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* $Id: xfpapawt.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/*                                                                            */
/*-Revision end---------------------------------------------------------------*/
{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/px/pxmaint.i}
{us/px/pxphdef.i rcshwbxr}

define input parameter absOid      like abs_mstr.oid_abs_mstr no-undo.
define input parameter tranType    like im_mstr.im_tr_type    no-undo.
define input parameter soUM        like mfc_logical           no-undo.

define buffer b_abs_mstr for abs_mstr.

define variable l_par_shipfrom like abs_mstr.abs_shipfrom no-undo.
define variable l_par_id       like abs_mstr.abs_par_id   no-undo.
define variable l_tare_wt      like abs_mstr.abs_gwt      no-undo.
define variable l_abs_twt      like abs_mstr.abs_gwt      no-undo.
define variable l_abs_tare_twt like abs_mstr.abs_gwt      no-undo.
define variable cmtindx_cdl    as   character             no-undo.
define variable cmt_ctr        as   integer               no-undo.
define variable i              as   integer               no-undo.
define variable l_part_um      like abs_mstr.abs_wt_um    no-undo.
define variable l_conv         as   decimal               no-undo.
define variable l_net_wt1      like abs_mstr.abs_nwt      no-undo.
define variable l_gross_wt1    like abs_mstr.abs_gwt      no-undo.
define variable l_tare_wt1     like abs_mstr.abs_gwt      no-undo.
define variable l_net_wt2      like abs_mstr.abs_nwt      no-undo.
define variable l_gross_wt2    like abs_mstr.abs_gwt      no-undo.
define variable l_tare_wt2     like abs_mstr.abs_gwt      no-undo.
define variable l_qty          like abs_mstr.abs_qty      no-undo.
define variable firstPartUM    like abs_mstr.abs_wt_um    no-undo.
define variable v_absd_fld_name  like absd_fld_name  no-undo.
define variable v_absd_fld_value like absd_fld_value no-undo.

define variable mHasPendingPickPack as logical no-undo.
define variable mPrevOidPackInfo    as decimal no-undo.
define variable mOidPackInfo        as decimal no-undo.
define variable mPackDesc           as character no-undo.
define variable mPackQty            as decimal no-undo.
define variable mPackTareWt         as decimal no-undo.
define variable mPackTareWtUm       as character no-undo.
define variable mPackNetWt          as decimal no-undo.
define variable mPackNetWtUm        as character no-undo.
define variable mPackGrossWt        as decimal no-undo.
define variable mPackGrossWtUm      as character no-undo.
define variable mTotalTareWt        as decimal no-undo.
define variable mTotalNetWt         as decimal no-undo.
define variable mTotalGrossWt       as decimal no-undo.
define variable l_desc    like pt_desc1  no-undo. /*grc338*/

/* DEFINE FORM FOR SHIPMENT WEIGHT SUMMARY */
form
   pt_mstr.pt_desc1     column-label "Description" format "x(20)" 
   b_abs_mstr.abs_qty   column-label "Quantity" format "->>>>>>9.9"
   b_abs_mstr.abs_nwt   column-label "Net!Weight" format "->>>>>>9.9"   
   l_tare_wt            column-label "Tare!Weight" format "->>>>>>9.9"
   b_abs_mstr.abs_gwt   column-label "Gross!Weight" format "->>>>>>9.9"
   b_abs_mstr.abs_wt_um /* column-label "UM"  format "x(2)" */
with frame frm_part down width 80 
   title color normal (getFrameTitle("SHIPMENT_WEIGHT_SUMMARY",33)).

setFrameLabels(frame frm_part:handle).

/* DEFINING FORM FOR CONTAINER/LINE CHARGES */
form
   space(5)
   v_absd_fld_name
   v_absd_fld_value
with down frame absd_user_fields width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame absd_user_fields:handle).

FUNCTION getParentUM returns character
(input recordID as recid):
   define variable parentRecordID as recid     no-undo.
   define variable parentUM       as character no-undo.

   define buffer b_abs_mstr for abs_mstr.

   {us/bbi/gprun.i ""gpabspar.p""
                   "(recordID, 'PS', false, output parentRecordID)"}

   for first b_abs_mstr no-lock
      where recid(b_abs_mstr) = parentRecordID:
      if (b_abs_mstr.abs_id begins "s"
          or b_abs_mstr.abs_id begins "p")
      then do:
         parentUM = b_abs_mstr.abs_wt_um.
      end.
   end.

   return parentUM.
END FUNCTION.

for first abs_mstr no-lock
   where abs_mstr.oid_abs_mstr = absOid:
   l_par_shipfrom = abs_mstr.abs_shipfrom.
   l_par_id = abs_mstr.abs_id.
   firstPartUM = getParentUM(recid(abs_mstr)).
end.

/* CALCULATE WEIGHT FROM SHIPPING HISTORY FOR CONFIRMED SHIPPER. FOR
   UNCONFIRMED SHIPPER, CALCULATE WEIGHT FROM SERIAL MASTER */
if substring(abs_status, 2, 1) = "y" then do:
   {us/px/pxrun.i &PROC = 'calculatePackInfoFromShippingHistory'
                  &PROGRAM = 'rcshwbxr.p'
                  &HANDLE = ph_rcshwbxr
                  &PARAM = "(input absOid)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}
end.
else do:
   {us/px/pxrun.i &PROC = 'calculatePackInfoOnTheShipper'
                  &PROGRAM = 'rcshwbxr.p'
                  &HANDLE = ph_rcshwbxr
                  &PARAM = "(input absOid)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}
end.

for each b_abs_mstr
no-lock
   where b_abs_mstr.abs_domain = global_domain
   and   abs_shipfrom          = l_par_shipfrom
   and   abs_par_id            = l_par_id
break by abs_item /*  with frame frm_part */:

   for first pt_mstr
      where pt_mstr.pt_domain = global_domain
        and pt_part           = abs_item
   no-lock:
   end. /* FOR FIRST pt_mstr */

   assign
      l_abs_twt = abs_gwt - abs_nwt
      l_tare_wt = l_abs_twt.

   /* cmtindx_cdl IS USED HERE FOR CONTAINER COMMENTS */
   if b_abs_mstr.abs_id begins "C"
   then
      cmtindx_cdl = cmtindx_cdl +
                    (if cmtindx_cdl <> ""
                     then ","
                     else "") +
                    string(abs_cmtindx).

   if first-of(abs_item)
   then
      l_part_um = abs_wt_um.

   if l_part_um <> abs_wt_um
   then do:
      {us/bbi/gprun.i ""gpumcnv.p""
                      "(l_part_um,
                        abs_wt_um,
                        """",
                        output l_conv)" }

      if l_conv = ? then l_conv = 1.

      assign
         l_net_wt1   = l_net_wt1   + abs_nwt / l_conv
         l_gross_wt1 = l_gross_wt1 + abs_gwt / l_conv
         l_tare_wt1  = l_tare_wt1  + l_tare_wt / l_conv.
   end. /* IF l_part_um <> abs_wt_um THEN */
   else
      assign
         l_net_wt1   = l_net_wt1   + abs_nwt
         l_tare_wt1  = l_tare_wt1  + l_tare_wt
         l_gross_wt1 = l_gross_wt1 + abs_gwt.

   if  tranType = "ISS-SO"
   and soUM   = yes
   and abs_id begins "I"
   then do:

      for first sod_det where sod_domain = global_domain
         and   sod_part   = b_abs_mstr.abs_item
         and   sod_nbr    = abs_order
         and   sod_line   = integer(abs_line)
      no-lock:
      end. /* FOR FIRST sod_det */

      if available sod_det
      then
         l_qty = l_qty + (abs_qty * decimal(abs__qad03)) / sod_um_conv.
      else
         for first idh_hist
            where idh_domain = global_domain
            and   idh_nbr    = abs_order
            and   idh_line   = integer(abs_line)
            and   idh_part   = b_abs_mstr.abs_item
         no-lock:
            l_qty = l_qty + abs_qty * decimal(abs__qad03) / idh_um_conv.
         end. /* FOR FIRST idh_hist */

   end. /* IF tranType = "ISS-SO" */
   else
      l_qty = l_qty + abs_qty.

   if firstPartUM <> abs_wt_um
   then do:
      {us/bbi/gprun.i ""gpumcnv.p""
                      "(firstPartUM,
                        abs_wt_um,
                        """",
                        output l_conv)" }

      if l_conv = ? then l_conv = 1.

      assign
         l_net_wt2   = l_net_wt2   + abs_nwt / l_conv
         l_gross_wt2 = l_gross_wt2 + abs_gwt / l_conv
         l_tare_wt2  = l_tare_wt2  + l_tare_wt / l_conv.

   end. /* IF firstPartUM <> abs_wt_um */
   else
      assign
         l_net_wt2   = l_net_wt2   + abs_nwt
         l_gross_wt2 = l_gross_wt2 + abs_gwt
         l_tare_wt2  = l_tare_wt2  + l_tare_wt.

   if last-of(abs_item) and l_qty <> 0
   then do:

        /*grc338 DELETED
      display
         pt_desc1 when (available pt_mstr)
         "" when (not available pt_mstr) @ pt_desc1
         l_qty @ abs_qty
         l_net_wt1 @ abs_nwt
         l_tare_wt1 @ l_tare_wt
         l_gross_wt1 @ abs_gwt
         l_part_um @ abs_wt_um
      with frame frm_part.

      down 1 with frame frm_part.

      grc338 DELETED*/

      /*grc338*/ l_desc = "".
                 if available pt_mstr then
                    l_desc = pt_desc1.

      {us/xf/xfsofm09mp.i} /*grc338*/

      /* PRINT CONTAINER COMMENTS */
      do cmt_ctr = 1 to num-entries(cmtindx_cdl):
         if integer(entry(cmt_ctr,cmtindx_cdl)) > 0
         then do:
          /*grc338 DELETED
            {us/gp/gpcmtprt.i &type= SH
                              &id  = integer(entry(cmt_ctr,cmtindx_cdl))
                              &pos = 3}
            put skip(1).
          *grc338 DELETED*/
            /*grc338 BEGIN*/
              {us/xf/xfcmtprt1.i &type=SH
                          &id=integer(entry(cmt_ctr,cmtindx_cdl))
                          &rectype=H}
            /*grc338 END*/

         end. /* IF INTEGER(ENTRY(cmt_ctr, cmtindx_cdl)) > 0 */

      end. /* DO cmt_ctr = 1 TO NUM-ENTRIES(cmtindx_cdl) */

      assign
         cmtindx_cdl = ""
         l_qty       = 0
         l_net_wt1   = 0
         l_tare_wt1  = 0
         l_gross_wt1 = 0.
   end. /* IF LAST-OF(abs_item) */

   if last(abs_item)
   then do:

      assign
         mHasPendingPickPack = true
         mPrevOidPackInfo = 0
         mOidPackInfo = 0.

      pack_info_loop:
      repeat:
            
         {us/px/pxrun.i &PROC = 'getNextPackInfoDet'
                        &PROGRAM = 'rcshwbxr.p'
                        &HANDLE = ph_rcshwbxr
                        &PARAM = "(input mPrevOidPackInfo,
                                   output mOidPackInfo,
                                   output mPackDesc,
                                   output mPackQty,
                                   output mPackTareWt,
                                   output mPackTareWtUm,
                                   output mPackNetWt,
                                   output mPackNetWtUm,
                                   output mPackGrossWt,
                                   output mPackGrossWtUm)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

         if mOidPackInfo = 0 then leave pack_info_loop.

         /*gr338
         display
            mPackDesc    @ pt_mstr.pt_desc1
            mPackQty     @ b_abs_mstr.abs_qty
            mPackNetWt   @ b_abs_mstr.abs_nwt
            mPackTareWt  @ l_tare_wt
            mPackGrossWt @ b_abs_mstr.abs_gwt
            mPackNetWtUm @ b_abs_mstr.abs_wt_um
         with frame frm_part.

         down 1 with frame frm_part.
         */

         {us/xf/xfsofm09mq.i} /*GRC338*/
           
         {us/px/pxrun.i &PROC = 'convWtAndPlus'
                        &PROGRAM = 'rcshwbxr.p'
                        &HANDLE = ph_rcshwbxr
                        &PARAM = "(input abs_item,
                                   input firstPartUM,
                                   input l_tare_wt2,
                                   input firstPartUM,
                                   input l_net_wt2,
                                   input firstPartUM,
                                   input l_gross_wt2,
                                   input firstPartUM,
                                   input mPackTareWt,
                                   input mPackNetWtUm,
                                   input mPackNetWt,
                                   input mPackNetWtUm,
                                   input mPackGrossWt,
                                   input mPackGrossWtUm,
                                   output mTotalTareWt,
                                   output mTotalNetWt,
                                   output mTotalGrossWt)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

         assign
            l_tare_wt2 = mTotalTareWt
            l_net_wt2 = mTotalNetWt
            l_gross_wt2 = mTotalGrossWt.

            
         mPrevOidPackInfo = mOidPackInfo.
      end. /* PACK_INFO_LOOP */

      /*grc338
      underline b_abs_mstr.abs_nwt l_tare_wt b_abs_mstr.abs_gwt
      with frame frm_part.

      down 1 with frame frm_part.
        
      display
         "" @ pt_mstr.pt_desc1
         "" @ b_abs_mstr.abs_qty
         l_net_wt2 @ b_abs_mstr.abs_nwt
         l_tare_wt2 @ l_tare_wt
         l_gross_wt2 @ b_abs_mstr.abs_gwt
         firstPartUM @ b_abs_mstr.abs_wt_um
      with frame frm_part.
     */

       {us/xf/xfsofm09mr.i} /*grc338*/

   end. /* IF LAST(abs_item) */

   if b_abs_mstr.abs_id begins "c" then do:
      /* PRINT CONTAINER LINE LEVEL USER FIELDS */
      for each absd_det no-lock where 
         absd_det.absd_domain = global_domain and
         absd_shipfrom = abs_mstr.abs_shipfrom and
         absd_abs_id = b_abs_mstr.abs_id
      break by absd_abs_id:

        /*grc338
         display
            absd_fld_name  @ v_absd_fld_name
            absd_fld_value @ v_absd_fld_value
         with frame absd_user_fields.

         down 1 with frame absd_user_fields.

         if last-of(absd_abs_id) then
            down 2 with frame absd_user_fields.
         */

         {us/xf/xfsofm09ms.i} /*grc338*/

      end. /* FOR EACH absd_det */
   end. /* if b_abs_mstr */
end. /* FOR EACH b_abs_mstr */

if not mHasPendingPickPack then do:

   assign
      mPrevOidPackInfo = 0
      mOidPackInfo = 0
      l_tare_wt2 = 0
      l_net_wt2 = 0
      l_gross_wt2 = 0.

   pack_info_loop:
   repeat:
            
      {us/px/pxrun.i &PROC = 'getNextPackInfoDet'
                     &PROGRAM = 'rcshwbxr.p'
                     &HANDLE = ph_rcshwbxr
                     &PARAM = "(input mPrevOidPackInfo,
                                output mOidPackInfo,
                                output mPackDesc,
                                output mPackQty,
                                output mPackTareWt,
                                output mPackTareWtUm,
                                output mPackNetWt,
                                output mPackNetWtUm,
                                output mPackGrossWt,
                                output mPackGrossWtUm)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}

      if mOidPackInfo = 0 then leave pack_info_loop.
        
      display
         mPackDesc    @ pt_mstr.pt_desc1
         mPackQty     @ b_abs_mstr.abs_qty
         mPackNetWt   @ b_abs_mstr.abs_nwt
         mPackTareWt  @ l_tare_wt
         mPackGrossWt @ b_abs_mstr.abs_gwt
         mPackNetWtUm @ b_abs_mstr.abs_wt_um
      with frame frm_part.

      down 1 with frame frm_part.

      {us/px/pxrun.i &PROC = 'convWtAndPlus'
                     &PROGRAM = 'rcshwbxr.p'
                     &HANDLE = ph_rcshwbxr
                     &PARAM = "(input '',
                                input firstPartUM,
                                input l_tare_wt2,
                                input firstPartUM,
                                input l_net_wt2,
                                input firstPartUM,
                                input l_gross_wt2,
                                input firstPartUM,
                                input mPackTareWt,
                                input mPackNetWtUm,
                                input mPackNetWt,
                                input mPackNetWtUm,
                                input mPackGrossWt,
                                input mPackGrossWtUm,
                                output mTotalTareWt,
                                output mTotalNetWt,
                                output mTotalGrossWt)"
                      &NOAPPERROR = true
                      &CATCHERROR = true}

      assign
         l_tare_wt2 = mTotalTareWt
         l_net_wt2 = mTotalNetWt
         l_gross_wt2 = mTotalGrossWt.
            
      mPrevOidPackInfo = mOidPackInfo.

   end. /* PACK_INFO_LOOP */
      
   /* down 1 with frame frm_part. */
        
   underline b_abs_mstr.abs_nwt l_tare_wt b_abs_mstr.abs_gwt
   with frame frm_part.

   down 1 with frame frm_part.
        
   display
      "" @ pt_mstr.pt_desc1
      "" @ b_abs_mstr.abs_qty
      l_net_wt2 @ b_abs_mstr.abs_nwt
      l_tare_wt2 @ l_tare_wt
      l_gross_wt2 @ b_abs_mstr.abs_gwt
      firstPartUM @ b_abs_mstr.abs_wt_um
      with frame frm_part.
end.   /* IF NOT MHASPENDINGPICKPACK */
