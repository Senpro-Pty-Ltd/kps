/* xfsolotspr.i - Lot/Serial Print                                              */
/* solotspr.i - Lot/Serial Print                                              */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsolotspr.i,v 1.2 2018/03/13 17:09:37 gbg Exp $: */
/* $Revision: 1.2 $ BY: Dipanshu Talwar  DATE: 06/10/09  ECO: *Q2K3*          */
/* Modified by: sxh              Date: 14/01/16 ECO: *S6B01*     */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

find first mfc_ctrl
   where mfc_domain = global_domain
   and   mfc_field  = "scan_tr_hist_days"
no-lock no-error.
if     available mfc_ctrl
   and mfc_integer <> 0
then
   l_effdate = today - mfc_integer.
else
   l_effdate = low_date.

empty temp-table tt_tr_hist. 

for each tr_hist
   where tr_domain   = global_domain
   and   tr_nbr      = ibh_nbr + "." + string(ibh_line)
   and   tr_effdate >= l_effdate
   and   tr_part     = ibh_part
   and   tr_type     = "ISS-FAS"
   and   tr_serial  <> ""
no-lock:
   for first tt_tr_hist
      where tt_tr_trnbr   =  tr_trnbr
   no-lock:
   end. /* FOR FIRST tt_tr_hist */
   if not available tt_tr_hist
   then do:
      create tt_tr_hist.
      assign
         tt_tr_trnbr    =  tr_trnbr
         tt_tr_type     =  tr_type
         tt_tr_rmks     =  tr_rmks
         tt_tr_serial   =  tr_serial
         tt_tr_expire   =  tr_expire
         tt_tr_ref      =  tr_ref
         tt_tr_nbr      =  tr_nbr
         tt_tr_part     =  tr_part
         tt_tr_effdate  =  tr_effdate
         tt_tr_qty_loc  =  tr_qty_loc
         tt_display     =  no.
   end. /* IF NOT AVAILABLE tt_tr_hist */
end. /* FOR EACH tr_hist */

for each tt_tr_hist:
   /* BY DEFAULT THE SYSTEM IS PICKING tr_nbr_eff INDEX         */
   /* HOWEVER IN THIS QUERY WE NEED tr_trnbr INDEX TO BE PICKED */
   for first tr_hist
      where tr_domain   = global_domain
      and   tr_trnbr    > tt_tr_trnbr
      and   tr_nbr      = ibh_nbr
      and   tr_line     = ibh_line
      and   tr_effdate  = tt_tr_effdate
      and   tr_type     = "ISS-SO"
      use-index tr_trnbr
   no-lock:
   end. /* FOR FIRST tr_hist */
   if available tr_hist
      and tr_rmks  =  ibh_inv_nbr
   then
      tt_display = yes.
end. /* FOR EACH tt_tr_hist */

for each tt_tr_hist
   where tt_display = yes
no-lock
break by tt_tr_serial
      by tt_tr_ref
      by tt_tr_expire:

   if first(tt_tr_expire)
   then do:
      if page-size - line-counter < 1
      then do:
/*S6B01*  page.                        */
/*S6B01*  clear frame d all no-pause.  */
/*S6B01*  display                      */
/*S6B01*   idh_part                    */
/*S6B01*   cont_lbl @ idh_qty_inv      */
/*S6B01*  with frame d.                */
      end. /* IF PAGE-SIZE */

/*S6B01* put              */
/*S6B01*  l_lot-lbl at 3  */
/*S6B01*  skip.           */
   end. /* IF FIRST(tr_expire) */

   if first-of(tt_tr_expire)
   then
      l_lotsrl_tot = 0.

   l_lotsrl_tot = l_lotsrl_tot - tt_tr_qty_loc.

   if     last-of(tt_tr_expire)
      and l_lotsrl_tot <> 0
   then do:
      if page-size - line-counter < 1
      then do:
/*S6B01*  page.                       */
/*S6B01*  clear frame d all no-pause. */
/*S6B01*  display                     */
/*S6B01*    idh_part                  */
/*S6B01*    cont_lbl @ idh_qty_inv    */
/*S6B01*  with frame d.               */
      end. /* IF PAGE-SIZE */
/*S6B01* put                  
         tt_tr_serial    at 5
         l_lotsrl_tot    at 25
         tt_tr_expire    at 40
         tt_tr_ref       at 50
      skip.              */
/*S6B01*/  put stream ft
/*S6B01*/    "W"          at 1  format "x"          /* TYPE "W" */
/*S6B01*/    tt_tr_serial    at 5  format "x(18)"      /* LOT/SERIAL CODE */
/*S6B01*/    l_lotsrl_tot at 25 format "->>>>>>>>9.999999999". /* QTY */ 

/*S6B01*/  if tr_expire <> ? then
/*S6B01*/    put stream ft
/*S6B01*/     string(year(tt_tr_expire))  at 50 format "9999" /* EXPIRY DATE-YEAR */
/*S6B01*/     string(month(tt_tr_expire)) at 54 format "99"   /* EXPIRY DATE-MONTH */
/*S6B01*/     string(day(tt_tr_expire))   at 56 format "99".  /* EXPIRY DATE-DAY */

/*S6B01*/  put stream ft
/*S6B01*/    tt_tr_ref       at 65 format "x(8)"       /* REFERENCE */
/*S6B01*/    skip.
   end. /* IF LAST-OF(tt_tr_expire) and */
end. /* FOR EACH tt_tr_hist */
