/* xxlotr04.p - INVENTORY TRANSFER WITH LOT/SERIAL CHANGE                     */
/* xxlotr03.p - INVENTORY TRANSFER WITH LOT/SERIAL CHANGE                     */
/* iclotr03.p - INVENTORY TRANSFER WITH LOT/SERIAL CHANGE                     */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxlotr04.p,v 1.2 2018/03/13 17:09:58 gbg Exp $: */
/* $Revision: 1.2 $                                                           */
/*V8:ConvertMode=Maintenance                                                  */
/* REVISION: 7.0      LAST MODIFIED: 07/02/92    BY: pma *F701*               */
/* REVISION: 8.6      LAST MODIFIED: 06/11/96    BY: aal *K001*               */
/* REVISION: 8.6      LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 08/13/00    BY: *N0KS* Mark Brown        */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.7      BY: Jean Miller           DATE: 12/10/01  ECO: *P03H*   */
/* $Revision: 1.2 $       BY: Manjusha Inglay       DATE: 08/16/02  ECO: *N1QP*   */
/* $Revision: 1.2 $   BY: Dorota Hohol      DATE: 08/25/03 ECO: *P112* */
/* CYB               LAST MODIFIED: 08-SEP-2011 BY: gbg *cy1033*        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB               LAST MODIFIED: 2016-May-19 BY: gbg *c1578* D3474   */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/cxcustom.i "ICLOTR03.P"}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

define new shared variable trtype as character.
{&ICLOTR03-P-TAG1}
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}

/*c1578* start added code >>> */
{us/xx/xx1578.i NEW}


form
v_prh  colon 12 label "Receiver"  prh_nbr no-label ad_sort no-label
v_item colon 12 label "Item"    pt_desc1 no-label
v_qty  colon 12 label "Quantity"
v_site colon 12 label "Site"
v_loc  colon 12 label "Loc"
with frame a width 80 side-labels.

/*c1578* end added code <<< */

trtype = "LOT/SER".
/*cy1033*  {us/bbi/gprun.i ""iclotr.p""} */
/*c1578* /*cy1033*/ {us/bbi/gprun.i ""xxiclotr.p""} */

if not can-find(first msg_mstr no-lock
where msg_nbr = 90002)
then do:
   do transaction:
      create msg_mstr.
      assign
      msg_lang = "us"
      msg_nbr = 90002
      msg_desc = "~# ~# ~# ~#".
   end.
end.


/*c1578* start added code >>> */
mainloop:
repeat:

    selloop:
    repeat:
       v_prh = "".
       v_item = "".
       v_qty = 0.
       vseltype = true.
       empty temp-table ttparts.
       empty temp-table ttpallets.
       update
       v_prh
       with frame a editing:
	         {us/xx/xxnp.i
		  prh_hist
		  v_prh
		  " prh_domain = global_domain and prh_receiver "
		  v_prh
		  prh_receiver
		  prh_receiver}
		  if recno <> ?
		  then do:
                     v_prh = prh_receiver.
		     display v_prh with frame a.
		     for first po_mstr no-lock
		     where po_domain = global_domain
		     and   po_nbr = prh_nbr,
		     first ad_mstr no-lock
		     where ad_domain = global_domain
		     and   ad_addr = po_vend:
                        display prh_nbr ad_sort
			with frame a.
		     end.
		  end.
       end.  /* editing */
       if v_prh = ""
       then update
       v_item 
       v_qty  
       v_site
       v_loc
       with frame a editing:
          case frame-field:
             when "v_item" then do:
	         {us/mf/mfnp.i 
		      pt_mstr
                      v_item
		      " pt_domain = global_domain and pt_part "
		      v_item
		      pt_part
		      pt_part}
                 if recno <> ?
		 then do:
                    v_item = pt_part.
		    display v_item
		    pt_desc1
		    with frame a.
		 end.
	     end.  /* when "v_item" */
	     when "v_site" then do:
	       {us/mf/mfnp.i
	        si_mstr
		v_site
		" si_domain = global_domain and si_site "
		v_site
		si_site
		si_site}
	       if recno <> ?
	       then do:
                  v_site = si_site.
		  display v_site
		  with frame a.
	       end.
	     end.  /* when "v_site" */
	     when "v_loc" then do:
	       {us/mf/mfnp.i
	        loc_mstr
		v_loc
		" loc_domain = global_domain and loc_loc "
		v_site
		loc_site
		loc_loc}
               if recno <> ?
	       then do:
	          v_loc = loc_loc.
		  display v_loc
		  with frame a.
	       end.  /* if recno <> ? */
	     end.  /* when "v_loc" */
	     otherwise do:
               readkey.
	       apply lastkey.
	     end.  /*  otherwise do */
	  end.  /* case  frame-field */
       end.
       if v_prh = ""
       and v_item = ""
       then do:
          vmessage = "Enter either a receiver or an item number".
	  {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	  undo selloop, next selloop.
       end.  /* if v_prh = "" */
       if v_item <> ""
       then do:
	  find first pt_mstr no-lock
	  where pt_domain = global_domain
	  and   pt_part = v_item
	  no-error.
	  if not available pt_mstr
	  then do:
             vmessage = "Not a valid part number".
	     {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	     undo selloop, next selloop.
	  end.
	  if pt_size = ?
	  or pt_size = 0
	  then do:
             vmessage = "Pallet size not set for item " + v_item.
	     {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	     undo selloop, next selloop.
	  end.
          if  v_qty = 0
	  then do:
             vmessage = "Quantity cannot be zero".
	     {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	     undo selloop, next selloop.
	  end.
	  if v_qty < pt_size
	  then do:
             vmessage = "Qty is less than pallet size " + string(pt_size, ">>>9").
	     {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	     undo selloop, next selloop.
	  end.
	  if not can-find(first si_mstr
	                  where si_domain = global_domain
			  and   si_site = v_site)
          then do:
             vmessage = "Site " + trim(v_site) + " does not exist".
	     {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	     undo selloop, next selloop.
	  end.
	  if not can-find(first loc_mstr
	                  where loc_domain = global_domain
			  and   loc_site = v_site
			  and   loc_loc = v_loc)
          then do:
             vmessage = "Location " + trim(v_loc) + " does not exist".
	     {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	     undo selloop, next selloop.
	  end.
	  if not can-find(first ld_det
	                  where ld_domain = global_domain
			  and   ld_site = v_site
			  and   ld_loc = v_loc
			  and   ld_part = v_item
			  and   ld_ref = ""
			  and   ld_qty_oh >= pt_size)
          then do:
              vmessage = "Insufficient inventory at site/location " + v_site +
	                       "~/" + v_loc.
	      yn = yes.
	      {us/bbi/pxmsg.i &MSGNUM=90002 &MSGARG1=vmessage
			      &ERRORLEVEL=2 &CONFIRM=yn}
	      undo selloop, next selloop.
	  end.
	  for first ld_det no-lock
	  where ld_domain = global_domain
	  and   ld_site = v_site
	  and   ld_loc = v_loc
	  and   ld_part = v_item
	  and   ld_ref = ""
	  and   ld_qty_oh < v_qty   :
	      k = truncate(ld_qty_oh / pt_size, 0).
	      vmessagearg2 = " ".
              vmessagearg1 = string(ld_qty_oh) + 
	                     " in stock. Do you want to print " + 
	                     string(k) + 
			     " Labels?".
              vmessagearg2 = (string(k, ">>>9")).
	      yn = no.
	      {us/bbi/pxmsg.i &MSGNUM=90002 &MSGARG1=vmessagearg1
			      &ERRORLEVEL=2 &CONFIRM=yn}
	      if not yn then undo selloop, next selloop.
	      hide message no-pause.
	  end.
	  display
	  pt_desc1
	  with frame a.
       end.  /* if v_item <> "" */
       if v_prh <> ""
       then do:
          find first prh_hist no-lock
	  where prh_domain = global_domain
	  and   prh_receiver = v_prh
	  no-error.
	  if not available prh_hist
	  then do:
             vmessage = "Invalid receiver number " + v_prh.
	     {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	     undo selloop, next selloop.
	  end.
	  for first po_mstr no-lock
	  where po_domain = global_domain
	  and   po_nbr = prh_nbr,
	  first ad_mstr no-lock
	  where ad_domain = global_domain
	  and   ad_addr = po_vend:
              display prh_nbr ad_sort
	      with frame a.
	  end.
       end.  /* if v_prh <> "" */
       leave selloop.
    end.  /* selloop */
    if keyfunction(lastkey) = "end-error"
    then do:
        undo mainloop, leave mainloop.
    end.  /* if keyfunction(lastkey) = "end-error" */

    if v_prh = ? or v_prh = ""
    then do:
	k = integer(pt_size) no-error.
	if error-status:error then k = 0.
	if K > 0
	then do:
	  for first ld_det no-lock
	  where ld_domain = global_domain
	  and   ld_site = v_site
	  and   ld_loc = v_loc
	  and   ld_part = v_item
	  and   ld_ref = ""
	  and   ld_qty_oh > 0,
	  first pt_mstr no-lock
	  where pt_domain = global_domain
	  and   pt_part = v_item
	  :
            create ttparts.
	    assign
	    ttitem = v_item
	    ttqty = min(v_qty, ld_qty_oh)
	    ttprh = ?
	    ttsite = v_site
	    ttloc = v_loc
	    ttnbr = ""
	    ttsize = k.
	  end.
	end.
    end.
    else do:
	prhproc = no.
	prhloop:
        for each prh_hist no-lock
	where prh_domain = global_domain
	and   prh_receiver = v_prh
	and   prh_rcvd > 0.0,
	each tr_hist no-lock
	where tr_domain = global_domain
	and   tr_nbr = prh_nbr
	and   tr_line = prh_line
	and   tr_type = "rct-po"
	and   tr_date = prh_rcp_date
	and   tr_site = prh_site
	and   tr_part = prh_part,
	first pt_mstr no-lock
	where pt_domain = global_domain
	and   pt_part = prh_part,
	first ld_det no-lock
	where ld_domain = global_domain
	and   ld_site = tr_site
	and   ld_part = tr_part
	and   ld_loc = tr_loc
	and   ld_ref = "":


	  if pt_size = ?
	  or pt_size <= 0
	  then do:
              vmessage = "Pallet size not setup for item " + pt_part.
	      {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
	      next prhloop.
	  end.
	  if ld_qty_oh < pt_size
	  then do:
              vmessage = "Insufficient stock for item " + tr_part.
	      yn = no.
	      {us/bbi/pxmsg.i &MSGNUM=90002 &MSGARG1=vmessage
			      &ERRORLEVEL=2 &CONFIRM=yn}
	      next prhloop.
	  end.
	  if ld_qty_oh < prh_rcvd then do  :
	      k = truncate(ld_qty_oh / pt_size, 0) no-error.
	      if error-status:error then k = 0.
	      if k = ? then k = 0.
              vmessagearg1 = "Item " + prh_part + " " + string(ld_qty_oh) + 
	                     " in stock. Do you want to print " + 
	                     string(k) + 
			     " Labels?".
              vmessagearg2 = (string(k, ">>>9")).
	      yn = no.
	      {us/bbi/pxmsg.i &MSGNUM=90002 &MSGARG1=vmessagearg1
			      &ERRORLEVEL=2 &CONFIRM=yn}
	      if not yn then next prhloop.
	      hide message no-pause.
          end.


	    k = integer(pt_size) no-error.
	    if error-status:error then k = 0.
	    if k > 0
	    then do:
	       prhproc = yes.
               create ttparts.
	       assign
	       ttitem = prh_part
	       ttqty = min(prh_rcvd, ld_qty_oh)
	       ttprh = prh_receiver
	       ttsite = tr_site
	       ttloc = tr_loc
	       ttserial = tr_serial
	       ttnbr = prh_nbr
	       ttline = prh_line
	       ttsize = k.
	    end.
	end.  /* for each prh_hist */
	if prhproc = no
	then do:
           vmessagearg1 = "No labels will be processed".
	   yn = no.
	   {us/bbi/pxmsg.i &MSGNUM=90002 &MSGARG1=vmessagearg1
			      &ERRORLEVEL=2 &CONFIRM=yn}
           undo mainloop, next mainloop.
	end.  /* if prhproc = no */
    end.

    /* Now divide the transfers into pallets */
    for each ttparts where ttqty > 0:
       j = truncate(ttqty / ttsize, 0).
       do i = 1 to j:
          create ttpallets.
	  assign
	  tpitem = ttitem
	  tpqty = ttsize
	  tpsize = ttsize
	  tpprh = ttprh
	  tpsite = ttsite
	  tploc = ttloc
	  tpref = ttref
	  tpserial = ttserial
	  tpnbr = ttnbr
	  tpline = ttline
	  tptrnbr = tttrnbr.
       end.
    end.


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



    /*********************************************************/
    /* Now process the "transfer" to set the reference field */
    /* and print the labels                                  */
    /*********************************************************/
    for each ttpallets:
       do transaction:
         global_part = tpitem.
	 global_site = tpsite.
	 global_loc = tploc.
         global_lot = tpserial.
	 {us/bbi/gprun.i ""xxrfval.p"" "(output nextLotRef)"}
	 tpref = nextlotref.
         {us/bbi/gprun.i ""icxfer.p""
            "(tpitem,
              tpserial,
              """",
              tpref,
              tpqty,
              tpnbr,
              """",
              """",
              """",
              today,
              tpsite,
              tploc,
              tpsite,
              tploc,
              no,
              """",
              ?,
              """",
              0,
              """",
              output glcost,
              output iss_trnbr,
              output tptrnbr,
              input-output assay,
              input-output grade,
              input-output expire)"}
       end.  /* do transaction */

       {us/bbi/gprun.i ""xxplprint.p"" "(tptrnbr, optrnbr)"}

    end.  /* for each ttparts */

    {us/bbi/mfreset.i "stream ft"}   /* close output stream */

/*c1578* start deleted code >>>>  
code comes from xxiclotr.p bu Im not sure if its needed here

*   /* add pause here to adjust timing of output */
*   for first code_mstr no-lock
*   where code_domain = global_domain
*   and   code_fldname = "Pause xxiclotr"
*   and   code_value = "":
*      pausecount = integer(code_mstr.code_cmmt) no-error.
*      if error-status:error then pausecount = 0.
*      if pausecount = ? then pausecount = 0.
*      do i = pausecount to 1 by -1:
*         pause 1 no-message.
*      end.
*   end.
*c1578* end deleted code <<<< */


end.  /* mainloop */
/*c1578* end   added code >>> */
