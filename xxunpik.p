/* xxunpik.p - SO Unpick                                                     */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB               LAST MODIFIED: 13-AUG-2010     BY: gbg *cy1025*         */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*****************************************************************************/
{us/mf/mfdtitle.i +x1.0}


define var sonbr        like so_nbr.
define var cust       like so_cust.
define var vcontinue  like mfc_logical.
define var vmessage   as char.
define var cimerr     as int.
define var cimmsg     as char.
defin var vcount      as int.

form 
sonbr    colon 16
so_cust  
cm_sort no-label
with frame a side-labels width 80 no-attr-space.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

form
  vcontinue  label "Confirm - Unpick this order"
with frame b width 40 side-labels row 8 center overlay.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

form
"SO Shipment produced the following error" skip
cimmsg  no-label format "x(70)"
skip(1)
vcontinue  label "Continue"
with frame c width 80 side-labels.
/* SET EXTERNAL LABELS */
setFrameLabels(frame c:handle).


mainloop:
repeat:
   update sonbr
   with frame a
   editing:
      {us/mf/mfnp.i so_mstr
	      sonbr
              "so_domain = global_domain and
	       so_nbr "
              sonbr so_nbr so_nbr}
      if recno <> ?
      then do:
         find first cm_mstr no-lock
	 where cm_addr = so_cust
	 no-error.
	 sonbr = so_nbr.
	 display
	 sonbr
	 so_cust
	 " " @ cm_sort
	 cm_sort when available cm_mstr
	 with frame a.
      end.
   end.
   find first so_mstr no-lock
   where so_domain = global_domain
   and   so_nbr = sonbr
   no-error.
   if not available so_mstr
   then do:
      vmessage = "Invalid Order Number.".
      {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
      undo mainloop, retry mainloop.
   end.
   find first cm_mstr no-lock
   where cm_domain = global_domain
   and   cm_addr = so_cust
   no-error.

   display
   so_cust
   " " @ cm_sort
   cm_sort when available cm_mstr
   with frame a.


   vcount = 0.
   for each lad_det no-lock
   where lad_domain = global_domain
   and   lad_dataset = "sod_det"
   and   lad_nbr = so_nbr
   and   lad_qty_pick <> 0.0:
      vcount = vcount + 1.
   end.
   for each lad_det no-lock
   where lad_domain = global_domain
   and   lad_dataset = "sob_det"
   and   lad_nbr = so_nbr
   and   lad_qty_pick <> 0.0:
      vcount = vcount + 1.
   end.
   if vcount = 0
   then do:
       vmessage = "No picked lines on this order".
       {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
       undo mainloop, retry mainloop.
   end.

   vcontinue = yes.
   aloop:
   repeat:
     update vcontinue
     with frame b.
     leave aloop.
   end.  /* aloop */
   hide frame b no-pause.
   if keyfunction(lastkey) ="end-error"
   then do:
       undo mainloop, retry mainloop.
   end.

   if vcontinue
   then do:
      for each sod_det no-lock
      where sod_domain = global_domain
      and   sod_nbr = sonbr:

          {us/bbi/gprun.i ""xxunpik1.p"" "(sonbr, sod_line)"}

      end.  /* each sod_det */
   end.
end.  /* mainloop */



