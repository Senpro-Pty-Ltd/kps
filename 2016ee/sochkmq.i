/* sochkmq.i -   Check Min Qty and Max Qty                                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: sochkmq.i,v 1.1.1.1 2017/10/02 13:18:30 gbg Exp $: */
/*                                                                            */
/* The program provides the facility to create a new sod category. it         */
/* also provides for the modification and deletion of sod category.           */
/*                                                                            */
/* $Revision: 1.1.1.1 $       By: Jean Miller    Date: 08/12/08     ECO: *P4RW*  */
/*                                                                            */
/*============================================================================*/
/* ****************************  DEFINITIONS  ******************************* */
/*============================================================================*/
define variable qty_ordered     like sod_qty_ord   initial 0   no-undo.
define variable largest_list_id like pih_list_id               no-undo.
define variable test_um         like sod_um                    no-undo.
define variable test_cat        like sod_part                  no-undo.

assign
   nbr         = {&ord_nbr}
   global_disc = {&glb_disc}.

if line_pricing or (new_order = no and reprice_dtl = yes) then
do on endkey undo {&block_name} , leave {&block_name}:

   curr_min_ord_qty = 0.

   for each wkpi_wkfl
      where ((global_disc and wkpi_confg_disc)
             or (wkpi_parent  = sobparent
             and wkpi_feature = sobfeature
             and wkpi_option  = sobpart
             and not wkpi_confg_disc
             and not global_disc)
             or    (wkpi_source = "1"
             and    wkpi_parent  = ""
             and    wkpi_feature = ""
             and    wkpi_option  = ""))
             and    wkpi_min_net > 0
             and    wkpi_qty_type = "1"
   break by wkpi_min_net desc:

      /* Get largest min net                                        */
      /* When there is more than one Minimum Order quantity present,*/
      /* the largest Minimum Order quantity shall be considered.    */
      if first-of(wkpi_min_net) then do:
         assign
            curr_min_ord_qty = wkpi_wkfl.wkpi_min_net
            largest_list_id  = wkpi_wkfl.wkpi_list_id.
         leave.
      end.

   end. /* for each wkpi_wkfl */

   if largest_list_id <> "" then do:

      for first pi_mstr where pi_domain = global_domain
                          and pi_list_id = largest_list_id
      no-lock: end.


      /* Get quantity ordered*/
      if pi_break_cat <> "" then
         test_cat = pi_break_cat.
      else
         test_cat = {&partno}.

      if pi_um <> "" then
         test_um = pi_um.
      else
         test_um = {&um}.

      if available pt_mstr
      then
         if  pi_um       = ""
         and pi_qty_type = "1"
         and pt_um       <> {&um}
         then
            test_um = pt_um.

      find first wqty_wkfl
         where wqty_cat = test_cat
           and wqty_um  = test_um
      no-lock no-error.

      if not available wqty_wkfl then
         for first wqty_wkfl
            where wqty_cat = test_cat
         no-lock: end.

      if not available wqty_wkfl
      then do:
         {us/bbi/pxmsg.i &MSGNUM=13743 &ERRORLEVEL=3 &MSGARG1= {&partno}}
          pause.
          next-prompt line with frame c.
          undo {&block_name} ,leave {&block_name}.
      end.

      if curr_min_ord_qty > wqty_wkfl.wqty_qty
      then do:

         /* Item # requires minimum order quantity # . Continue? */
         {us/bbi/pxmsg.i &MSGNUM=7553 &ERRORLEVEL=1
                  &CONFIRM=continue-yn
                  &MSGARG1= {&partno}
                  &MSGARG2=curr_min_ord_qty}

         if continue-yn = yes and soc_so_hist
         then do:
            /* In SO maintaince, when Min Net less then order qty,*/
            /* popup the reason code frame*/
            if "{&from_prog}"  = "sosomtla" then do:
               assign
                  global_type = " "
                  global_ref  = {&ord_nbr}.
      /*debug*         run p-reason-code (output l_reason_err). */
            end.
         end.
         else if continue-yn = no then
             undo {&block_name} , leave {&block_name} .

      end. /* curr_min_ord_qty > wqty_wkfl.wqty_qty */

   end. /* if largest_list ... */

end. /*if line_pricing or (new_order = no and reprice_dtl = yes)*/

hide frame frsnbm no-pause.
hide frame rsn    no-pause.
