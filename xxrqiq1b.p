/* xxrqiq1b.p - REQUISITION DETAIL INQUIRY - DISPLAY LINES                    */
/* rqrqiq1b.p - REQUISITION DETAIL INQUIRY - DISPLAY LINES                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxrqiq1b.p,v 1.2 2018/03/13 17:09:59 gbg Exp $: */
/* $Revision: 1.2 $                                                         */
/* NOTE: CHANGES MADE TO THIS PROGRAM MAY NEED TO BE MADE TO                  */
/* REQUISITION DETAIL INQUIRY AND/OR REQUISITION MAINTENANCE                  */
/* AND/OR REQUSITION REPORT.                                                  */
/*                                                                            */
/* Revision: 8.6    LAST MODIFIED BY: 05/05/97  By: B. Gates          *J1Q2*  */
/* Revision: 8.6    LAST MODIFIED BY: 01/26/98  By: B. Gates          *J2CL*  */
/* REVISION: 8.6E   LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane            */
/* REVISION: 8.6E   LAST MODIFIED: 03/02/98   BY: *L008* A. Rahane            */
/* REVISION: 8.6E   LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan           */
/* REVISION: 8.6E   LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan           */
/* REVISION: 8.6E   LAST MODIFIED: 08/09/99   BY: *L0FZ* Robert Jensen        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 05/11/00 BY: *N08Y* Kaustubh K.      */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KP* myb                  */
/* Revision: 1.7.1.8  BY: Tiziana Giustozzi  DATE: 07/12/01 ECO: *N104*       */
/* Revision: 1.7.1.11        BY: Vinod Nair         DATE: 02/27/03 ECO: *N28F*       */
/* Revision: 1.7.1.12    BY: Rajinder Kamra  DATE: 06/20/03  ECO *Q005*  */
/* $Revision: 1.2 $ BY: Rake Gui        DATE: 12/27/05  ECO *Q0NK*  */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1227*                     */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *c1228*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*                                                                            */
/*V8:ConvertMode=Maintenance                                                  */
/*                                                                            */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

define input parameter p_rqm_recid as recid no-undo.

{us/rq/rqconst.i}
define variable partial_ixval as integer no-undo.
define variable partial_ixlen as integer no-undo.
define variable ix1array as character extent 25 no-undo.
define variable recidarray as recid extent 25 no-undo.
define variable ixlastline as integer no-undo.
define variable i as integer no-undo.
define variable c-spacebar like msg_desc no-undo.

{us/bbi/pxmsg.i &MSGNUM=8809 &ERRORLEVEL=1 &MSGBUFFER=c-spacebar}.

find rqm_mstr where recid(rqm_mstr) = p_rqm_recid no-lock.

&SCOP table rqd_det
   &SCOP DISPLAYFIELDS ~
   rqd_line ~
   rqd_site ~
   rqd_part ~
   rqd_vend ~
   rqd_req_qty ~
   rqd_um ~
   rqd_pur_cost ~
   rqd_disc_pct
   &SCOP SCROLLFIELD rqd_line
   &SCOP USEINDEX use-index rqd_nbr
   &SCOP CRITERIA rqd_domain = global_domain and rqd_nbr = rqm_nbr
/*c1227*/  &SCOP PROGRAMTORUN xxrqiq1c.p
/*c1227*   &SCOP PROGRAMTORUN rqrqiq1c.p */

   if no then do:
/*c1227*  {us/bbi/gprun.i ""rqrqiq1c.p""} */
/*c1227*/ {us/bbi/gprun.i ""xxrqiq1c.p""}
   end.

form
   rqd_line
   rqd_site
   rqd_part
   rqd_vend
   rqd_req_qty
   rqd_um
   rqd_pur_cost        format ">>>>>>>>9.99<<<"
   rqd_disc_pct
with frame w scroll 1 down width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame w:handle).

hide message no-pause.

/* Use stline to allow GUI substitution of options */
ststatus = stline[4].
status input ststatus.

find first {&TABLE} where {&CRITERIA} no-lock no-error.

if not available {&TABLE} then do:

   /* THERE ARE NO RECORDS IN FILE */
   {us/bbi/pxmsg.i &MSGNUM=2767 &ERRORLEVEL=2
            &MSGARG1='{&TABLE}'}

   status default c-spacebar.
   readkey.
   return.
end.

{us/bbi/pxmsg.i &MSGNUM=2119 &ERRORLEVEL=1}
/*AFTER SELECTING, PRESS ENTER OR GO TO VIEW DETAILS*/

do with frame w:
   clear frame w all no-pause.
   ixlastline = 0.
   find first {&TABLE}
      where {&SCROLLFIELD} >= partial_ixval
      and {&CRITERIA} {&USEINDEX}
      no-lock no-error.

   if not available {&TABLE} then
      find last {&TABLE}
      where {&SCROLLFIELD} <= partial_ixval
      and {&CRITERIA} {&USEINDEX}
      no-lock no-error.

   do while available {&TABLE} with frame w:
      ixlastline = ixlastline + 1.
      ix1array[ixlastline] = string({&SCROLLFIELD}).
      recidarray[ixlastline] = recid({&TABLE}).
      display {&DISPLAYFIELDS}.

      if frame-line = frame-down then leave.
      find next {&TABLE} where {&CRITERIA} {&USEINDEX}
         no-lock no-error.
      if available {&TABLE} then down 1.
   end.

   partial_ixval =
   integer(substring(ix1array[1] + fill(' ',40),1,partial_ixlen)).

   up ixlastline - 1.
   color prompt messages {&SCROLLFIELD}.
end.

prompt-for {&SCROLLFIELD} with frame w
editing:
   do i = 1 to partial_ixlen:
      apply keycode("CURSOR-RIGHT").
   end.
   readkey.
   leave.
end.

do while lastkey = 8 or (lastkey >= 32 and lastkey <= 256)
      or lastkey = keycode("CURSOR-UP") or lastkey = keycode("CURSOR-DOWN")
      or lastkey = keycode("F9") or lastkey = keycode("F10")
      or lastkey = keycode("CURSOR-LEFT")
      or lastkey = keycode("CURSOR-RIGHT")
      or lastkey = keycode("F7") or lastkey = keycode("F8")
      or lastkey = keycode("PAGE-DOWN") or lastkey = keycode("PAGE-UP")
      or lastkey = keycode("CTRL-Z") or lastkey = keycode("CTRL-R")
      or lastkey = 18 or lastkey = 26 or lastkey = keycode("CTRL-X")
      or lastkey = keycode("RETURN") or lastkey = keycode("F1")
      or keyfunction(lastkey) = "GO"
      or ({us/bbi/gpiswrap.i}
          and keyfunction(lastkey) = "HELP")
   with frame w:

   if {us/bbi/gpiswrap.i}
      and keyfunction(lastkey) = "HELP"
   then
      apply lastkey.
   else

   if lastkey = keycode("RETURN") or lastkey = keycode("F1")
      or lastkey = keycode("CTRL-X")
      or keyfunction(lastkey) = "GO"
   then do:
      i = frame-line(w).
      hide frame w no-pause.

      {us/bbi/gprun.i ""{&PROGRAMTORUN}""
         "(input recidarray[i])"}

      view frame w.
   end.

   else
         if lastkey = 8 or lastkey = keycode("CURSOR-LEFT") then do:
      if partial_ixlen > 0 then partial_ixlen = partial_ixlen - 1.

      partial_ixval =
      integer(substring(string(partial_ixval)
         + fill(' ',40),1,partial_ixlen)).
   end.

   else
         if lastkey = keycode("CURSOR-RIGHT") then do:
      if length(ix1array[frame-line]) > partial_ixlen then do:
         partial_ixlen = partial_ixlen + 1.

         partial_ixval =
         integer(substring(ix1array[frame-line]
            + fill(' ',40),1,partial_ixlen)).
      end.
   end.

   else
         if lastkey >= 32 and lastkey <= 256 then do:
      partial_ixval = integer(string(partial_ixval) + chr(lastkey)).
      partial_ixlen = partial_ixlen + 1.

      if partial_ixval > integer(ix1array[ixlastline])
         or partial_ixval < integer(ix1array[1])
      then do:
         find first {&TABLE}
            where {&SCROLLFIELD} >= partial_ixval
            and {&CRITERIA} {&USEINDEX}
            no-lock no-error.

         if available {&TABLE} then do:
            if string({&SCROLLFIELD}) = ix1array[1] then do:
               up frame-line - 1.
               color prompt messages {&SCROLLFIELD}.

               partial_ixval =
               integer(substring(ix1array[1]
                  + fill(' ',40),1,partial_ixlen)).
            end.
            else do:
               clear frame w all no-pause.
               ixlastline = 0.
               find first {&TABLE}
                  where {&SCROLLFIELD} >= partial_ixval
                  and {&CRITERIA} {&USEINDEX}
                  no-lock no-error.

               do while available {&TABLE} with frame w:
                  ixlastline = ixlastline + 1.
                  ix1array[ixlastline] = string({&SCROLLFIELD}).
                  recidarray[ixlastline] = recid({&TABLE}).
                  display {&DISPLAYFIELDS}.

                  if frame-line = frame-down then leave.

                  find next {&TABLE}
                     where {&CRITERIA} {&USEINDEX}
                     no-lock no-error.

                  if available {&TABLE} then down 1.
               end.

               partial_ixval =
               integer(substring(ix1array[1]
                  + fill(' ',40),1,partial_ixlen)).

               up ixlastline - 1.
               color prompt messages {&SCROLLFIELD}.
            end.
         end.
         else do:
            if partial_ixlen > 1 then
               partial_ixlen = partial_ixlen - 1.

            partial_ixval =
            integer(substring(string(partial_ixval)
               + fill(' ',40),1,partial_ixlen)).
         end.
      end.
      else do:
         i = 1.

         do while integer(ix1array[i]) < partial_ixval:
            i = i + 1.
         end.

         up frame-line - i.
         color prompt messages {&SCROLLFIELD}.
         partial_ixval =
         integer(substring(ix1array[i] + fill(' ',40),1,partial_ixlen)).
      end.
   end.

   else
if lastkey = keycode("CURSOR-UP")
      or lastkey = keycode("F9")
   then do:
      if frame-line = 1 then do:
         find {&TABLE} where recid({&TABLE}) = recidarray[1]
            no-lock no-error.

         find prev {&TABLE} where {&CRITERIA} {&USEINDEX}
            no-lock no-error.

         if available {&TABLE} then do:
            clear frame w all no-pause.
            ixlastline = 0.

            do while available {&TABLE} with frame w:
               ixlastline = ixlastline + 1.
               ix1array[ixlastline] = string({&SCROLLFIELD}).
               recidarray[ixlastline] = recid({&TABLE}).
               display {&DISPLAYFIELDS}.
               if frame-line = frame-down then leave.

               find next {&TABLE} where {&CRITERIA} {&USEINDEX}
                  no-lock no-error.

               if available {&TABLE} then down 1.
            end.

            partial_ixval =
            integer(substring(ix1array[1]
               + fill(' ',40),1,partial_ixlen)).

            up ixlastline - 1.
            color prompt messages {&SCROLLFIELD}.
         end.
      end.
      else do:
         up 1.
         color prompt messages {&SCROLLFIELD}.

         partial_ixval =
         integer(substring(ix1array[frame-line]
            + fill(' ',40),1,partial_ixlen)).
      end.
   end.

   else
if lastkey = keycode("CURSOR-DOWN")
      or lastkey = keycode("F10")
   then do:
      if frame-line = ixlastline then do:
         find {&TABLE}
            where recid({&TABLE}) = recidarray[ixlastline]
            no-lock no-error.

         find next {&TABLE} where {&CRITERIA} {&USEINDEX}
            no-lock no-error.

         if available {&TABLE} then do:
            down 1.
            display {&DISPLAYFIELDS}.

            color prompt messages {&SCROLLFIELD}.

            do i = 1 to ixlastline:
               ix1array[i] = ix1array[i + 1].
               recidarray[i] = recidarray[i + 1].
            end.

            ix1array[ixlastline] = string({&SCROLLFIELD}).
            recidarray[ixlastline] = recid({&TABLE}).

            partial_ixval =
            integer(substring(ix1array[ixlastline]
               + fill(' ',40),1,partial_ixlen)).
         end.
      end.
      else do:
         down 1.
         color prompt messages {&SCROLLFIELD}.

         partial_ixval =
         integer(substring(ix1array[frame-line]
            + fill(' ',40),1,partial_ixlen)).
      end.
   end.

   else
if lastkey = keycode("F7") or lastkey = 18
      or lastkey = keycode("PAGE-UP") or lastkey = keycode("CTRL-R")
   then do:
      find {&TABLE} where recid({&TABLE}) = recidarray[1]
         no-lock no-error.

      find prev {&TABLE} where {&CRITERIA} {&USEINDEX}
         no-lock no-error.

      if available {&TABLE} then do:
         do i = 1 to frame-down - 2 while available {&TABLE}:
            find prev {&TABLE} where {&CRITERIA} {&USEINDEX}
               no-lock no-error.
         end.

         if not available {&TABLE} then
         find first {&TABLE} where {&CRITERIA} {&USEINDEX}
            no-lock no-error.

         clear frame w all no-pause.
         ixlastline = 0.

         do while available {&TABLE} with frame w:
            ixlastline = ixlastline + 1.
            ix1array[ixlastline] = string({&SCROLLFIELD}).
            recidarray[ixlastline] = recid({&TABLE}).
            display {&DISPLAYFIELDS}.
            if frame-line = frame-down then leave.

            find next {&TABLE}
               where {&CRITERIA} {&USEINDEX}
               no-lock no-error.

            if available {&TABLE} then down 1.
         end.

         partial_ixval =
         integer(substring(ix1array[1] + fill(' ',40),1,partial_ixlen)).

         up ixlastline - 1.
         color prompt messages {&SCROLLFIELD}.
      end.
   end.

   else
if lastkey = keycode("F8")
      or lastkey = 26
      or lastkey = keycode("PAGE-DOWN")
      or lastkey = keycode("CTRL-Z")
   then do:
      find {&TABLE} where recid({&TABLE}) = recidarray[ixlastline]
         no-lock no-error.

      clear frame w all no-pause.
      ixlastline = 0.

      do while available {&TABLE} with frame w:
         ixlastline = ixlastline + 1.
         ix1array[ixlastline] = string({&SCROLLFIELD}).
         recidarray[ixlastline] = recid({&TABLE}).
         display {&DISPLAYFIELDS}.
         if frame-line = frame-down then leave.

         find next {&TABLE} where {&CRITERIA} {&USEINDEX}
            no-lock no-error.

         if available {&TABLE} then down 1.
      end.

      partial_ixval =
      integer(substring(ix1array[1] + fill(' ',40),1,partial_ixlen)).

      up ixlastline - 1.
      color prompt messages {&SCROLLFIELD}.
   end.

   prompt-for {&SCROLLFIELD} with frame w
   editing:
      do i = 1 to partial_ixlen:
         apply keycode("CURSOR-RIGHT").
      end.

      readkey.
      leave.
   end.
end.

if no then assign rqd_line.

hide frame w no-pause.
