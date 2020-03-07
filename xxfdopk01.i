/* xxfdopk1.i - DISTRIBUTION ORDER PICKLIST                                   */
/* xxfdopk2.i - DISTRIBUTION ORDER PICKLIST                                   */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.               */
/*                                                                            */
/* Revision: eb3sp5   BY: Vishal Agarwal        DATE: 27/07/11  ECO: *cy1048* */
/* CYB                LAST MODIFIED: 13-JUN-2012 BY: gbg *c1313*           */
/* CYB   LAST MODIFIED: 21-SEP-2012    BY: gbg *c1342*                        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/***************************************************************************/

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
         ,each lad_det no-lock
            where lad_domain = global_domain
              and lad_dataset = "ds_det"
              and lad_nbr = ds_req_nbr
              and lad_line = ds_site
              and lad_part = ds_part
              and lad_site = ds_shipsite
            ,first ld_det no-lock
            where ld_domain = global_domain
            and   ld_site = lad_site
            and   ld_loc  = lad_loc 
            and   ld_part = lad_part
            and   ld_lot  = lad_lot 
            and   ld_ref  = lad_ref 
         break by ds_shipdate by ds_trans_id by {&sort1} {&sort2} by ds_part:

         if first-of (ds_shipdate)
         then do:
            assign
               disp-do-pklist = getTermLabel("BANNER_DISTRIBUTION_ORDER",45)
                              + "  " + getTermLabel("BANNER_PICKLIST",25)
               disp-do-pklist = fill(" ", 72 - length(disp-do-pklist))
                              + disp-do-pklist.


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
                  
                  {us/xf/xfaddr.i "company"}   
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
               
               {us/xf/xfaddr.i "billto"}  
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
               {us/xf/xfaddr.i "shipto"}  
               assign
                  shipattn = ad_attn.
                  shipphn = ad_phone.
            end. /* IF AVAILABLE AD_MSTR */
            
            {us/xf/xfdopkm0.i}
            
            {us/xf/xfcmtprt.i &type=PA &id= dss_cmtindx &rectype=A}
                
            assign
               cum_weight = 0
               cum_cube   = 0
               item_count = 0.   
               
            {us/xf/xfdopkmv.i}
         end. /* IF FIRST-OF (DS_SHIPdate) */

         if first-of(ds_part) then do:
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

/*c1342* start added code */
	 if desc2 <> "" then
         put stream ft unformatted
	 {us/xf/xfput.i "'P'"         001 "x(01)"    }
	 {us/xf/xfput.i pt_part       002 "x(18)"    }
	 {us/xf/xfput.i desc1         020 "x(24)"    }
	 {us/xf/xfput.i desc2         044 "x(24)"    }.
	 else
         put stream ft unformatted
	 {us/xf/xfput.i "'Q'"         001 "x(01)"    }
	 {us/xf/xfput.i pt_part       002 "x(18)"    }
	 {us/xf/xfput.i desc1         020 "x(24)"    }.
/*c1342* end   added code */
   
         end. /*if first-of(ds_part)..*/ 
         
         if desc2 <> "" then do:
            {us/xf/xfdopkmb.i}
         end.     
         else do: 
            {us/xf/xfdopkme.i}
         end.
           
         if update_yn = yes
         then do for laddet:
            find laddet where recid(laddet) = recid(lad_det)
            exclusive-lock no-error.
            if available laddet then
               assign
                  laddet.lad_qty_pick = laddet.lad_qty_pick
                                           + laddet.lad_qty_all
                  laddet.lad_qty_all  = 0.
            release laddet.
         end. /* IF update_yn = YES */
         /* PRINT COMMENTS */
         {us/xf/xfcmtprt.i &type=PA &id= ds_cmtindx &rectype=D}
         
/*c1313*         if last-of(ds_part) then do: */
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
/*c1313*         end. /*if first-of(ds_part) then do:...*/ */
         
         if last-of (ds_det.ds_shipdate)
         then do:
            {us/xf/xfdopkmx.i} /*eb3sp5*/
         end. /* IF LAST-OF(DS_SHIPDATE) */

         {us/mf/mfrpchk.i}

      end. /* FOR EACH DS_DET */
