/* xxdocan.p - DISTRIBUTION ORDER CANCEL               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxdscan.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/* $Revision: 1.2 $                                                       */
/*V8:ConvertMode=Report                                                       */
/* CYB                     CREATED: 28-FEB-17  BY: *D3736* nac               */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/*-Revision end---------------------------------------------------------------*/

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "1+ "}

define variable rec_site like dss_rec_site no-undo.
define variable ship_site like dss_shipsite no-undo.
define variable nbr like dss_nbr no-undo.
define variable part like ds_part no-undo.
define variable req-nbr like ds_req_nbr no-undo.
define variable desc1 like pt_desc1 no-undo.
define variable open_qty like ds_qty_conf column-label "Qty Open" no-undo.

define variable v_count as int.
define variable v_confirm as logical.
define variable vError as int.
define variable vMessage as char.

ship_site = global_site.

form
   nbr ship_site 
with frame a width 80 attr-space no-underline.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

{us/wb/wbrp01.i}

repeat:

   if c-application-mode <> 'web' then
   update nbr ship_site
      with frame a
   editing:

      if frame-field = "nbr" then do:

         /* FIND NEXT/PREVIOUS RECORD */

         {us/mf/mfnp05.i dss_mstr dss_nbr  " dss_mstr.dss_domain =
              global_domain and yes "  dss_nbr "input nbr"}

         if recno <> ? then do:
            nbr = dss_nbr.
            display nbr with frame a.
            recno = ?.
         end.
      end.
      else do:
         status input.
         readkey.
         apply lastkey.
      end.
   end.

   {us/wb/wbrp06.i &command = update &fields = "  nbr ship_site " &frm = "a"}

   if (c-application-mode <> 'web') or
      (c-application-mode = 'web' and
      (c-web-request begins 'data')) then do:

      hide frame b.
      hide frame c.
      hide frame d.
      hide frame e.
      hide frame f.
      hide frame g.

      if ship_site > "" then do:
         if can-find (si_mstr where si_domain = global_domain and
                                    si_site = ship_site)
         then
            global_site = ship_site.
         else do:
              {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3} 
         end.
      end.

   end.

   v_count = 0.
   find first dss_mstr
   where dss_domain = global_domain
     and dss_nbr = nbr 
     and dss_shipsite = ship_site
   no-lock no-error.
   if not available dss_mstr then do:
      /*DISTRIBUTION ORDER DOES NOT EXIST */
      {us/bbi/pxmsg.i &MSGNUM=1600 &ERRORLEVEL=3}
   end.

   for each dss_mstr no-lock use-index dss_nbr
      where dss_domain = global_domain
      and ( dss_nbr = nbr
       and dss_shipsite = ship_site),
      each ds_det no-lock use-index ds_nbr
     where ds_domain = global_domain
      and (ds_nbr = dss_nbr
       and ds_shipsite = dss_shipsite)
   with frame b width 80 no-attr-space:

      /* SET EXTERNAL LABELS */
      setFrameLabels(frame b:handle).
      {us/mf/mfrpchk.i}

      open_qty = max(ds_qty_conf - max(ds_qty_ship,0),0).

      if open_qty > 0 then do:
         display
            dss_nbr
            dss_shipsite
            dss_rec_site
            ds_part
            ds_req_nbr
            open_qty
            ds_shipdate.
         v_count = v_count + 1.
      end.
   end.
   v_confirm = no.
   if v_count > 0 then do:
      message "Cancel above DO's?" update v_confirm.
   end.
   else do:
      message "No lines to cancel.". pause.
   end.
   if v_confirm then do:
      {us/bbi/gprun.i ""xxcimdsdois.p""
         "(nbr,
           ship_site,
	   output vError,
	   output vMessage)"}
      if vError <> 0 
      then do:
         {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=1}
	 pause.
      end.

   end.

end.

{us/wb/wbrp04.i &frame-spec = a}
