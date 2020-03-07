/* xxfdopk01.i - DISTRIBUTION ORDER PICKLIST                                  */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* CYB   LAST MODIFIED: 21-SEP-2012    BY: gbg *cx1342*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/



   pages = 0.
   /* FOR UPDATE = YES, LIMITING THE TRANSACTION SCOPE FOR ONE       */
   /* DSS_MSTR RECORD AT A TIME AND MAINTAIN DATABASE INTEGRITY      */
   l_totalqty = 0.
   for each dss_mstr
       where dss_domain = global_domain
        and ((dss_nbr >= nbr)
        and  (dss_nbr <= nbr1)
        and  (dss_shipsite >= src_site)
        and  (dss_shipsite <= src_site1)
        and  (dss_rec_site >= rec_site)
        and  (dss_rec_site <= rec_site1)
        and  (dss_created >= ord or ord = ?)
        and  (dss_created <= ord1 or ord1 = ?)
        and  (dss_lang >= lang and dss_lang <= lang1)
        and can-find (first ds_det
                      where ds_domain = global_domain
                        and ds_nbr     = dss_nbr
                        and ds_status <> "c"))
/*cyx1048*/   no-lock by dss_nbr with         no-box
/*cyx1048*   no-lock by dss_nbr with frame b no-box */
   transaction:

      any_open = false.

      for each ds_det
          where ds_domain = global_domain
            and ds_nbr = dss_nbr
            and ds_shipsite   = dss_shipsite
            and ds_site       = dss_rec_site
            and ds_status    <> "c"
            and (ds_qty_conf >= 0
            and ds_qty_ship   < ds_qty_conf)
      no-lock:

         assign
            totpkqty  = 0
            totallqty = 0.

         for each lad_det
            where lad_domain = global_domain
              and lad_dataset = "ds_det"
              and lad_nbr = ds_req_nbr
              and lad_line = ds_site
              and lad_part = ds_part
              and lad_site = ds_shipsite
         no-lock:
            assign
               totallqty = totallqty + lad_qty_all
               totpkqty = totpkqty + lad_qty_pick.
         end. /* FOR EACH LAD_DET */

         qty_to_all = max(ds_qty_conf - max(ds_qty_ship, 0)
                    - max(totallqty, 0) - max(totpkqty, 0), 0).

         if qty_to_all > 0
         then do:
            ds_recno = recid(ds_det).
            {us/bbi/gprun.i ""dspkall.p""
                "(input update_yn,
                  output l_totalqty)"}
         end. /* IF QTY_TO_ALL > 0 */

         if (ds_qty_all <> 0 or
             update_yn  =  no )
         then
            any_open = true.

      end. /* FOR EACH DS_DET */

      if not any_open then
         next.

      for each ds_det no-lock
          where ds_domain = global_domain
            and ds_nbr = dss_nbr
            and ds_shipsite = dss_shipsite
            and ds_site     = dss_rec_site
            and ds_status   <> "c"
            and (ds_qty_all <> 0
               or (update_yn  =  no and
                   l_totalqty <> 0 ))
            /* ADDED can-find TO AVOID DISPLAYING HEADS FOR THOSE */
            /* DOs THAT HAVE NOTHING TO PICK.                     */
            and can-find(first lad_det where lad_domain = global_domain
               and lad_dataset = "ds_det"
               and lad_nbr = ds_req_nbr
               and lad_line = ds_site
               and lad_part = ds_part
               and lad_site = ds_shipsite)
               use-index ds_nbr
         break by ds_shipdate by ds_trans_id by ds_part with frame c:

         if first-of (ds_shipdate)
         then do:
            assign
               disp-do-pklist = getTermLabel("BANNER_DISTRIBUTION_ORDER",45)
                              + "  " + getTermLabel("BANNER_PICKLIST",25)
               disp-do-pklist = fill(" ", 72 - length(disp-do-pklist))
                              + disp-do-pklist.

            form header
               skip (2)
               disp-do-pklist    to 80
               skip(1)
               company[1]        at 4
               if not update_yn then
                  getTermLabelRt("BANNER_SIMULATION",28)
               else
                  ""                to 80 format "x(28)"
               getTermLabelRtColon("ORDER_NUMBER",14)  to 56 format "x(14)"
               dss_nbr           at 58
               getTermLabel("PAGE_OF_REPORT",4) + ": "
               + string(page-number - pages,">>9") format "x(9)"
                                 to 80
               company[2]        at 4
               getTermLabelRtColon("ORDER_DATE",14)  to 56 format "x(14)"
               dss_created       at 58
               company[3]        at 4
               getTermLabelRtColon("PRINT_DATE",14)  to 56 format "x(14)"
               today             at 58
               company[4]        at 4
               getTermLabelRtColon("SHIP_DATE",14)  to 56 format "x(14)"
               ds_shipdate
               company[5]        at 4
               company[6]        at 4
               getTermLabelRtColon("STATUS",10)  to 56 format "x(10)"
               dss_status        at 58
            with frame {&f1}phead1 page-top width 90.

            form
               space(7)
               dss_shipsite
               dss_rec_site   colon 53 skip (1)
               billto[1] at 8 no-label shipto[1] at 46 no-label
               billto[2] at 8 no-label shipto[2] at 46 no-label
               billto[3] at 8 no-label shipto[3] at 46 no-label
               billto[4] at 8 no-label shipto[4] at 46 no-label
               billto[5] at 8 no-label shipto[5] at 46 no-label
               billto[6] at 8 no-label shipto[6] at 46 no-label
               skip
            with frame {&f1}phead2 side-labels page-top width 90.

            /* SET EXTERNAL LABELS */
            setFrameLabels(frame {&f1}phead2:handle).

            form header
               fill("-",80)   format "x(80)" skip
               space(30)
               c-cont
            with frame {&f1}continue page-bottom width 80
            no-box.

            form
               billattn     colon 15
               shipattn     colon 53
               billphn      colon 15
               shipphn      colon 53
               skip (1)
               dss_po_nbr   colon 59
               dss_shipvia  colon 59
               termsdesc    colon 8 no-label
               dss_fob      colon 59
               dss_rmks     colon 15
               skip (1)
            with frame {&f1}phead3 side-labels
            page-top width 90 no-box.

            /* SET EXTERNAL LABELS */
            setFrameLabels(frame {&f1}phead3:handle).

            if comp_addr = ""
            then do:

               company = "".

               find ad_mstr where ad_domain = global_domain and
                  ad_addr = dss_shipsite
               no-lock no-error.

               if available ad_mstr
               then do:

                  /* Assign addr extents */
                  {us/mf/mfadfmt.i}
                  
                  /*eb3sp5 DELETED   
                  assign
                     company[1] = addr[1]
                     company[2] = addr[2]
                     company[3] = addr[3]
                     company[4] = addr[4]
                     company[5] = addr[5]
                     company[6] = addr[6].
                    eb3sp5 DELETED*/ 
                  {us/xf/xfaddr.i "company"} /*eb3sp5*/   
               end. /* IF AVAILABLE AD_MSTR */

            end. /* IF COMP_ADDR = "" */

            assign
               weight_um = ""
               cube_um = "".

            find tm_mstr where tm_domain = global_domain
               and tm_code = dss_shipvia
            no-lock no-error.
            if available tm_mstr then
               assign
                  cube_um = tm_cube_um
                  weight_um = tm_weight_um.

            assign
               first_line = yes
               dss_recno = recid(dss_mstr)
               billto = ""
               shipto = "".

            find ad_mstr where ad_domain = global_domain
               and ad_addr = dss_shipsite
            no-lock no-error.

            if available ad_mstr
            then do:

               /* Assign addr extents */
               {us/mf/mfadfmt.i}
               
               /*eb3sp5 DELETED
               assign
                  billto[1] = addr[1]
                  billto[2] = addr[2]
                  billto[3] = addr[3]
                  billto[4] = addr[4]
                  billto[5] = addr[5]
                  billto[6] = addr[6].
                 eb3sp5 DELETED*/
               {us/xf/xfaddr.i "billto"} /*eb3sp5*/  
               assign
                  billattn = ad_attn.
                  billphn = ad_phone.
            end. /* IF AVAILABLE AD_MSTR */

            find ad_mstr where ad_domain = global_domain
               and ad_addr = dss_rec_site
            no-lock no-error.

            if available ad_mstr
            then do:

               /* Assign addr extents */
               {us/mf/mfadfmt.i}
               /*eb3sp5 DELETED
               assign
                  shipto[1] = addr[1]
                  shipto[2] = addr[2]
                  shipto[3] = addr[3]
                  shipto[4] = addr[4]
                  shipto[5] = addr[5]
                  shipto[6] = addr[6].
                eb3sp5 DELETED*/
               {us/xf/xfaddr.i "shipto"} /*eb3sp5*/  
               assign
                  shipattn = ad_attn.
                  shipphn = ad_phone.
            end. /* IF AVAILABLE AD_MSTR */
            
            {us/xf/xfdopkm0.i} /*eb3sp5*/
            
            hide frame {&f1}phead1.
            view frame {&f1}phead1.

            pages = page-number - 1.

            hide frame {&f1}phead2.

            display
               dss_shipsite
               dss_rec_site
               billto
               shipto
            with frame {&f1}phead2.

            display
               billattn
               shipattn
               billphn
               shipphn
               dss_po
               dss_shipvia
               termsdesc
               dss_fob
               dss_rmks
            with frame {&f1}phead3.

            hide frame {&f1}phead2.
            hide frame {&f1}phead3.
                             
            /* PRINT COMMENTS */
            /*eb3sp5 DELETED
            {us/gp/gpcmtprt.i
               &type=PA &id=dss_cmtindx &pos=3 &command="down 1".}
              eb3sp5 DELETED*/
            
            {us/xf/xfcmtprt.i &type=PA &id= dss_cmtindx &rectype=A} /*eb3sp5*/
                
            assign
               cum_weight = 0
               cum_cube   = 0
               item_count = 0.   
               
            {us/xf/xfdopkmv.i} /*eb3sp5*/
         end. /* IF FIRST-OF (DS_SHIP) */

         assign
            desc1 = ""
            desc2 = ""
            req-nbr = ds_req_nbr.

         find pt_mstr where pt_domain = global_domain and pt_part = ds_part
         no-lock no-error.
         if available pt_mstr
         then do:
            assign
               desc1 = pt_desc1
               desc2 = pt_desc2.
         end.

         if ds_qty_ord >= 0 then
            qty_open = max(ds_qty_conf - max(ds_qty_ship, 0), 0).
         else
            qty_open = min(ds_qty_conf - min(ds_qty_ship, 0), 0).

         assign
            weight_conv = 1
            cube_conv = 1.

         if weight_um = "" and ds_fr_wt_um <> "" then
            weight_um = ds_fr_wt_um.

         if cube_um = "" and ds_fr_wt_um <> "" then
            cube_um = ds_fr_wt_um.

         if weight_um = "" or cube_um = ""
         then do:

            find tm_mstr where tm_domain = global_domain
               and tm_code = ds_trans_id
            no-lock no-error.

            if available tm_mstr then
               assign
                  cube_um   = if cube_um = "" then tm_cube_um
                              else cube_um
                  weight_um = if weight_um = "" then tm_weight_um
                              else weight_um.

         end. /* IF WEIGHT_UM = "" OR CUBE_UM = "" */

         if pt_ship_wt_um <> weight_um
         then do:
            /* UNIT OF MEASURE CONVERSION */
            {us/bbi/gprun.i ""gpumcnv.p""
                     "(input pt_ship_wt_um,
                       input weight_um,
                       input pt_part,
                       output weight_conv)"}
            if weight_conv = ? then
               weight_conv = 1.
         end. /* IF PT_SHIP_WT_UM <> WEIGHT_UM */

         if pt_size_um <> cube_um
         then do:
            /* UNIT OF MEASURE CONVERSION */
            {us/bbi/gprun.i ""gpumcnv.p""
                     "(input pt_size_um,
                       input cube_um,
                       input pt_part,
                       output cube_conv)"}
            if cube_conv = ? then
               cube_conv = 1.
         end. /* IF PT_SIZE_UM <> CUBE_UM */

         if ds_fr_wt = 0 then
            cum_weight = cum_weight + ds_qty_all * pt_ship_wt * weight_conv.
         else
            cum_weight = cum_weight + ds_qty_all * ds_fr_wt * weight_conv.

         assign
            cum_cube = cum_cube + ds_qty_all * pt_size * cube_conv
            item_count = item_count + 1
            first_line = no.

         if page-size - line-counter < 4
         then do:
            view frame {&f1}continue.
            page.
            hide frame {&f1}continue.
            view frame {&f1}phead1.
            view frame {&f1}phead2.
            view frame {&f1}phead3.
         end. /* IF PAGE_SIZE - LINE-COUNT < 3 */


/*cx1342* start added code */
	 if desc2 <> "" then
         put stream ft unformatted
	 {us/xf/xfput.i "'A'"         001 "x(01)"    }
	 {us/xf/xfput.i pt_part       002 "x(18)"    }
	 {us/xf/xfput.i desc1         020 "x(24)"    }
	 {us/xf/xfput.i desc2         044 "x(24)"    }.
	 else
         put stream ft unformatted
	 {us/xf/xfput.i "'D'"         001 "x(01)"    }
	 {us/xf/xfput.i pt_part       002 "x(18)"    }
	 {us/xf/xfput.i desc1         020 "x(24)"    }.
/*cx1342* end   added code */

         for each lad_det no-lock
            where lad_domain = global_domain
              and lad_dataset = "ds_det"
              and lad_nbr = ds_req_nbr
              and lad_line = ds_site
              and lad_part = ds_part
              and lad_site = ds_shipsite,
/*cyx1048*/ first ld_det no-lock
/*cyx1048*/ where ld_domain = global_domain
/*cyx1048*/ and   ld_site = lad_site
/*cyx1048*/ and   ld_loc  = lad_loc 
/*cyx1048*/ and   ld_part = lad_part
/*cyx1048*/ and   ld_lot  = lad_lot 
/*cyx1048*/ and   ld_ref  = lad_ref 
/*cyx1048*/   break by lad_dataset by {&sort1} {&sort2} by lad_part 
/*cyx1048*         break by lad_dataset by lad_nbr by lad_line by lad_part */
         with frame {&f1}d width 80 no-box down:

            /* SET EXTERNAL LABELS */
            setFrameLabels(frame {&f1}d:handle).

            if page-size - line-counter < 1
            then do:

               view frame {&f1}continue.

               page.

               hide frame {&f1}continue.

               view frame {&f1}phead1.
               view frame {&f1}phead2.
               view frame {&f1}phead3.

               display
                  ds_part format "x(27)"
                  cont_lbl @ lad_loc.

               down 1.

            end. /* IF PAGE-SIZE - LINE-COUNT < 1 */
            
            shipped = "(       )". /*eb3sp5*/
            
            /*eb3sp5 BEGIN*/
            if desc2 <> "" then 
            do:
               {us/xf/xfdopkmb.i}
            end.     
            else
            do: 
               {us/xf/xfdopkme.i}
            end.  
            /*eb3sp5 END*/
              
            if first-of (lad_part)
            then do:
               display ds_part format "x(27)".
            end.
            else do:
               if desc1 <> ""
               then do:
                  display "   " + desc1 @ ds_part.
                  desc1 = "".
               end.
               else if desc2 <> ""
               then do:
                     display "   " + desc2 @ ds_part.
                     desc2 = "".
               end.
               else if req-nbr <> ""
               then do:
                  display "   " + getTermLabel("REQUIRED",3) + ": " +
                     req-nbr @ ds_part.
                  req-nbr = "".
               end.

            end. /* ELSE DO */

           

            display
               lad_loc
               lad_lot
               lad_qty_all @ lad_qty_pick
               pt_um
               shipped column-label " Shipped".
            
            if lad_ref <> ""
            then do with frame {&f1}d:
               down 1.
               if desc1 <> ""
               then do:
                  display "   " + desc1 @ ds_part.
                  desc1 = "".
               end. /* IF DESC1 <> "" */
               else if desc2 <> ""
               then do:
                  display "   " + desc2 @ ds_part.
                  desc2 = "".
               end.
               else if req-nbr <> ""
               then do:
                  display
                     "   " + getTermLabel("REQUIRED",3) + ": " +
                     req-nbr @ ds_part.

                  req-nbr = "".
               end.

               display getTermLabel("REFERENCE",5) + ": " + lad_ref @ lad_lot.

            end. /* IF LAD_REF <> "" */
            
            if update_yn = yes
            then do:
               find laddet where recid(laddet) = recid(lad_det)
               exclusive-lock no-error.
               if available laddet then
                  assign
                     laddet.lad_qty_pick = laddet.lad_qty_pick
                                              + laddet.lad_qty_all
                     laddet.lad_qty_all  = 0.
               release laddet.
            end. /* IF update_yn = YES */

            if last-of (lad_det.lad_part)
            then do:
               if desc1 <> ""
               then do:
                  down 1.
                  display "   " + desc1 @ ds_part.
                  desc1 = "".
               end.
               if desc2 <> ""
               then do:
                  down 1.
                  display "   " + desc2 @ ds_part.
                  desc2 = "".
               end.
               if req-nbr <> ""
               then do:
                  down 1.
                  display "   " + getTermLabel("REQUIRED",3) + ": " +
                     req-nbr @ ds_part.
                  req-nbr = "".
               end.

            end. /* IF LAST-OF(LAD_PART) */

            /* PRINT COMMENTS */
            /*eb3sp5 DELETED
            {us/gp/gpcmtprt.i &type=PA &id=ds_cmtindx &pos=5
               &command="down 1 with frame {&f1}d".}
             eb3sp5 DELETED*/
            
            {us/xf/xfcmtprt.i &type=PA &id= ds_cmtindx &rectype=D} /*eb3sp5*/
             
            if last (lad_det.lad_dataset) then
               down 1.

         end. /* for each lad_det */

         if update_yn  = yes
         then do:

            find dsdet where recid(dsdet) = recid(ds_det)
            exclusive-lock no-error.
            if available dsdet then
               assign
                  dsdet.ds_qty_pick = dsdet.ds_qty_pick + dsdet.ds_qty_all
                  dsdet.ds_qty_all  = 0.
            release dsdet.
         end. /* IF update_yn = YES */

         if last-of (ds_det.ds_shipdate)
         then do with frame {&f1}ptrail:
            hide frame {&f1}continue.

            /* TRAILER */
            if page-size - line-counter < 4 then
               page.

            do while page-size - line-counter > 5:
               display
                  " "
                  skip(1)
               with frame {&f1}spaces no-box.
               down 1 with frame {&f1}spaces.
            end. /* DO WHILE PAGE-SIZE */

            /* SET EXTERNAL LABELS */
            setFrameLabels(frame {&f1}ptrail:handle).
            display
               fill("-",80)   format "x(80)" skip
               item_count
               space(2)
               string(cum_weight) + " " + weight_um @ cum_weight
               space(6)
               string(cum_cube) + " " + cube_um @ cum_cube
            with frame {&f1}ptrail width 80
               no-box side-labels.

            page.
            {us/xf/xfdopkmx.i} /*eb3sp5*/
         end. /* IF LAST-OF(DS_SHIPDATE) */

         {us/mf/mfrpchk.i}

      end. /* FOR EACH DS_DET */

      release ds_det.

   end. /* FOR EACH DSS_MSTR */

