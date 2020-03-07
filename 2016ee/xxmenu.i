/* xxmenu.i - MFG/PRO Manufacturing System Menu include file            */
/* mfmenu.i - MFG/PRO Manufacturing System Menu include file            */
/* Copyright 1986-2007 QAD Inc., Carpinteria, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */

/*  REVISION: 1.0       LAST EDIT: 05/21/87      MODIFIED BY: EMB       */
/*  REVISION: 6.0       LAST EDIT: 08/28/90      MODIFIED BY: WUG *D054**/
/*  REVISION: 8.5       LAST EDIT: 11/22/95  BY: *J094* Tom Vogten      */
/*  Revision: 8.5    Last Modified: 04/24/98 BY: *J2JB* Suhas Bhargave  */
/*  REVISION: 8.5       LAST EDIT: 04/13/98  BY: *H1L9* Vijaya Pakala   */
/*  REVISION: 9.1       LAST EDIT: 08/13/00  BY: *N0KR* myb             */
/*  Revision: 1.9.4.2 $  BY: Ed van de Gevel DATE: 07/08/03 ECO: *Q003* */
/* $Revision: 1.2 $  BY: Deepak Taneja   DATE: 09/19/07 ECO: *Q1C9* */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/
/************************************************************************/

/*F0PN*/ /*V8:ConvertMode=Maintenance                                   */


define variable l as integer NO-UNDO.

if global_usrc_right_hdr_disp < 2 then do:
if available mnd_det then do:
    for first mnt_det where mnt_nbr    = mnd_nbr
                  and mnt_select = mnd_select
                  and mnt_lang   = global_user_lang
                  no-lock : end.
   assign
      l      = length( mnd_nbr
               + ".":U
               + string(mnd_select)
               + " ":U
               + if available mnt_det then mnt_label else "","raw":U)  /*H1L9*/
      dtitle = dtitle
               + fill(" ":U,integer(max(1,39 - l / 2) - length(dtitle,"raw":U)) + 2) /*H1L9*/
               + mnd_nbr
               + ".":U
               + string(mnd_select)
               + " ":U
               + (if available mnt_det then mnt_label else "")
               + fill(" ":U,integer(max(1,39 - l / 2) - 8.5) - 2)
             + (if global_usrc_right_hdr_disp = 1
                then string(global_userid)
                else string(today)).
   end.
   else do:
     assign /*J094*/
      l      = 1
      dtitle = dtitle
          + fill(" ":U,integer( max( 1,39 - l / 2) - length (dtitle,"raw":U)))
             + fill(" ":U,integer( max( 1,39 - l / 2) - 8.5))
             + (if global_usrc_right_hdr_disp = 1
                then string(global_userid)
                else string(today)).
   end.
end.
else do:
   if available mnd_det then do:
     for first mnt_det where mnt_nbr    = mnd_nbr
                  and mnt_select = mnd_select
                  and mnt_lang   = global_user_lang
                  no-lock : end.
     l = length(mnd_nbr + "." + string(mnd_select) + " "  +
         (if available mnt_det then mnt_label else ""),"raw").
     dtitle = "".
     {us/gp/gprunp.i "mgdompl" "p" "ppDomHeader"
       "(input global_domain, input false, input mnd_exec, output dtitle)"}
     overlay(dtitle,15,56) = " [" + base_curr + "] "
         + mnd_nbr + "." + string(mnd_select) + " "
         + (if available mnt_det then mnt_label else "").
  end.
  else do:
     l = 1.
     dtitle = "".
     {us/gp/gprunp.i "mgdompl" "p" "ppDomHeader"
       "(input global_domain, input false, input '', output dtitle)"}
     overlay(dtitle,15,56) = " [" + base_curr +  "] ".
  end.
  overlay(dtitle,71,8,"RAW") = if global_usrc_right_hdr_disp = 3
                               then
                                  string(global_userid,"x(8)")
                               else
                                  string(today,"99/99/99").
end.
