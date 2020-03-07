/* xxfpkb09.p - PACKING LIST  PRINT - LINE ITEMS AND UPDATE                   */
/* xfpkb09.p - PACKING LIST  PRINT - LINE ITEMS AND UPDATE                    */
/* sopkb01.p - PACKING LIST  PRINT - LINE ITEMS AND UPDATE                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxfpkb09.p,v 1.2 2018/03/13 17:09:57 gbg Exp $: */
/* REVISION: 5.0      LAST MODIFIED: 07/14/89   BY: MLB *B130**/
/* REVISION: 6.0      LAST MODIFIED: 04/10/90   BY: ftb *D002**/
/* REVISION: 6.0      LAST MODIFIED: 04/23/90   BY: MLB *D021**/
/* REVISION: 6.0      LAST MODIFIED: 07/05/90   BY: WUG *D043**/
/* REVISION: 6.0      LAST MODIFIED: 07/30/90   BY: WUG *D051**/
/* REVISION: 6.0      LAST MODIFIED: 08/24/90   BY: WUG *D054**/
/* REVISION: 6.0      LAST MODIFIED: 01/30/91   BY: afs *D323**/
/* REVISION: 6.0      LAST MODIFIED: 03/12/91   BY: afs *D425**/
/* REVISION: 6.0      LAST MODIFIED: 04/29/91   BY: afs *D597**/
/* REVISION: 6.0      LAST MODIFIED: 07/13/91   BY: afs *D768**/
/* REVISION: 6.0      LAST MODIFIED: 09/19/91   BY: afs *F040**/
/* REVISION: 6.0      LAST MODIFIED: 11/13/91   BY: WUG *D887**/
/* REVISION: 7.0      LAST MODIFIED: 02/07/92   BY: afs *F180**/
/* REVISION: 7.0      LAST MODIFIED: 04/09/92   BY: emb *F369**/
/* REVISION: 7.0      LAST MODIFIED: 04/15/92   BY: afs *F398**/
/* REVISION: 7.0      LAST MODIFIED: 05/12/92   BY: tjs *F444**/
/* REVISION: 7.0      LAST MODIFIED: 06/15/92   BY: tjs *F504**/
/* REVISION: 7.3      LAST MODIFIED: 09/17/92   BY: pma *G068**/
/* REVISION: 7.3      LAST MODIFIED: 09/24/92   BY: tjs *G087**/
/* REVISION: 7.3      LAST MODIFIED: 11/12/92   BY: tjs *G191**/
/* REVISION: 7.3      LAST MODIFIED: 12/02/92   BY: WUG *G383**/
/* REVISION: 7.3      LAST MODIFIED: 01/06/92   BY: afs *G511**/
/* REVISION: 7.3      LAST MODIFIED: 09/09/93   BY: afs *GF01**/
/* REVISION: 7.3      LAST MODIFIED: 02/07/94   BY: afs *FL83**/
/* REVISION: 7.3      LAST MODIFIED: 03/16/94   BY: dpm *FM25**/
/* REVISION: 7.3      LAST MODIFIED: 06/22/94   BY: WUG *GK60**/
/* REVISION: 7.3      LAST MODIFIED: 11/02/94   BY: qzl *FT25**/
/* REVISION: 7.3      LAST MODIFIED: 04/19/95   BY: rxm *F0PD**/
/* REVISION: 7.3      LAST MODIFIED: 09/04/95   BY: dzn *G0W8**/
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Stephane Collard   */
/* REVISION: 8.6      LAST MODIFIED: 12/23/96   BY: *K022* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 08/23/97   BY: *J1ZD* Suresh Nayak       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00   BY: *N0JM* Mudit Mehta        */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *FI69*                    */
/* Revision: 1.10.1.6      BY: Jean Miller        DATE: 04/24/02  ECO: *P05M* */
/* Revision: 1.10.1.8      BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00L* */
/* Revision: 1.10.1.9      BY: Binoy John         DATE: 12/27/04  ECO: *Q0G4* */
/* Revision: 1.10.1.10     BY: Anitha Gopal       DATE: 06/13/05  ECO: *Q0JX* */
/* Revision: 1.10.1.11     BY: Jean Miller        DATE: 06/19/08  ECO: *R0VG* */
/* Revision: 1.10.1.18     BY: Jean Miller        DATE: 07/11/08  ECO: *R0WJ* */
/* $Revision: 1.2 $  BY: Xiaolei Meng       DATE: 08/14/09  ECO: *R1MZ* */
/* $Revision: eb3sp5  BY: Shridhar M       DATE: 02/14/10  ECO: *eb3sp5* */
/* Revision: QAD2012.1   BY: Steve Hong    DATE: 23/10/12  ECO: *93sp12.1 */
/* CYB      LAST MODIFIED: 2014-NOV-07     BY: gbg *c1502*                    */
/* CYB    LAST MODIFIED: 2015-SEP-11      BY: gbg *D3243*                     */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* WARNING: THIS PROGRAM SHOULD NOT INCLUDE DIRECT DATABASE UPDATES.  */
/* This is done so users with query-level Progress can still make     */
/* changes to the Packing List output.  Database updates should be    */
/* put into separate routines.                                        */

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
/*d3243* start added code >>>>>>> */
{us/xx/xx3243.i}
/*d3243* end   added code >>>>>>> */

{us/px/pxmaint.i}
{us/px/pxphdef.i fssmxr}
/**eb3sp5 ADDED PORTION BEGINS**/
 {us/xf/xfsopku.i}
 {us/xf/xfsopkv.i}
 {us/xf/xfdefa.i} /*FT Global vars */
/**eb3sp5 ADDED PORTION ENDS**/

define new shared variable addr         as character format "x(38)" extent 6.
define new shared variable alc_sod_nbr  like sod_nbr.
define new shared variable alc_sod_line like sod_line.
define new shared variable tot_qty_all  like lad_qty_all.

define shared variable due_date      like sod_due_date.
define shared variable due_date1     like sod_due_date.
define shared variable site          like sod_site.
define shared variable site1         like sod_site.
define shared variable pages         as integer.
define shared variable old_sod_nbr   like sod_nbr.
define shared variable sod_recno     as recid.
define shared variable so_recno      as recid.
define shared variable first_line    as logical.
define shared variable print_neg     like mfc_logical.
define shared variable all_only      as logical initial yes
   label "Print Only Lines to Pick".
define shared variable print_options as logical initial no
   label "Print Features and Options".

define variable desc1      like pt_desc1.
define variable location   like pt_loc.
define variable i          as integer.
define variable descount   as integer.
define variable rev        like pt_rev.
define variable det_lines  as integer.
define variable desc2      like desc1.
define variable cspart-lbl as character format "x(15)".
define variable cont_lbl   as character format "x(9)" no-undo.
define variable so_db      like si_db.
define variable err-flag   as integer.
define variable rev-lbl    as character format "x(10)".
define variable l_is_depot as logical   initial no no-undo.

define variable qtyshipped as character format "x(8)" label " Shipped"
   initial "(      )".
define variable qty_all like lad_qty_all format "->>>>>9.9<<<<<"
   label "Qty to Ship".
define variable qty_open   like sod_qty_ord column-label "Qty Open!Qty to Ship"
   format "->>>>>9.9<<<<<".
define variable ext_price  like sod_price label "Ext Price"
   format "->>,>>>,>>9.99".
define variable tms-error  like msg_nbr     no-undo.

define new shared frame d.

assign
   cont_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
   input "CONTINUE", input 9, input '*').

find so_mstr where recid(so_mstr) = so_recno no-lock.

{us/so/sopkf01.i}  /* Define shared frame d for sales order lines */

so_db = global_db.

for each sod_det  where sod_det.sod_domain = global_domain
   and sod_nbr = so_nbr
   and (sod_due_date >= due_date and sod_due_date <= due_date1)
   and (sod_site >= site and sod_site <= site1)
   and not sod_sched
   and ((sod_qty_all > 0 or (print_neg and sod_qty_all < 0)) or
        (not all_only and ((sod_qty_ord - sod_qty_pick - sod_qty_ship > 0) or
        (print_neg and sod_qty_ord - sod_qty_pick - sod_qty_ship < 0)) ))
   and sod_pickdate = ?
   and sod_confirm
   and sod_compl_stat = ""
exclusive-lock
by sod_line with frame d width 80 down no-box:

   {us/px/pxrun.i &PROC='isDepotOrder' &PROGRAM='fssmxr.p'
            &PARAM="(input  sod_nbr,
                     output l_is_depot)"
            &NOAPPERROR=true
            &CATCHERROR=true
   }

   /* If this is a depot order, we will skip the replacement line */
   if l_is_depot and
      can-find(first itm_det
               where itm_domain      = global_domain
               and   itm_nbr         = sod_nbr
               and   itm_prefix      = "CA"
               and   itm_type        = ""
               and   itm_itm_line    = 0
               and   itm_line        = sod_line
               and   itm_repair_type = "2")
   then
      next.

   if page-size - line-counter < 3 then page.

   find si_mstr  where si_mstr.si_domain = global_domain and  si_site =
   sod_site no-lock.
   /*PRINT HEADER COMMENTS*/
   if old_sod_nbr <> sod_nbr
   then do:

/*c1502* start deleted code * >>>
*     /*93sp12.1 {us/gp/gpcmtprt.i &type=PA &id=so_cmtindx &pos=3} */
*      {us/xf/xfcmtprt.i &type=PA &id=so_cmtindx &pos=3} /*eb3sp5*/
*c1502* END DELETED CODE <<< */

/*c1502*/   {us/xf/xfcmtprt.i &type=PA &id=so_cmtindx &pos=3 &rectype=A}

   end. /* IF old_sod_nbr <> sod_nbr */

   if si_db <> so_db then do:
      {us/bbi/gprun.i ""gpalias3.p"" "(si_db, output err-flag)" }
   end.

   /*CREATE HARD ALLOCATIONS IN THE INVENTORY SITE*/
   if sod_type = "" then do:
      assign
         alc_sod_nbr = sod_nbr
         alc_sod_line = sod_line.
      {us/bbi/gprun.i ""sopkall.p"" "(no)"}
   end.

   old_sod_nbr = sod_nbr.

   /* PRINT ORDER DETAIL */
   assign
      qty_open = sod_qty_ord - sod_qty_ship - sod_qty_pick
      ext_price = sod_qty_all * sod_price
      desc1 = sod_desc
      desc2 = ""
      location = ""
      rev = "".

   /* ITEM DESCRIPTION OF SOD LINES */
   {us/bbi/gprun.i ""sopkb01a.p"" "(input        sod_part,
                             output       desc2,
                             output       rev,
                             input-output desc1)"}

   location = "".
/*eb3sp5*/ {us/xf/xfpkb09mb.i}

   /*DISPLAY LINES*/
   {us/so/sopkb01.i}

   down 1 with frame d.

   if rev <> "" then do:
      if page-size - line-counter < 1 then do:
         page.
         /*DISPLAY CONTINUED*/
         {us/so/sopkd01.i}
         down 1 with frame d.
      end.
      put rev-lbl at 5 rev skip.
   end.

   if desc1 <> "" then do:
      if page-size - line-counter < 1 then do:
         page.
         /*DISPLAY CONTINUED*/
         {us/so/sopkd01.i}
         down 1 with frame d.
      end.
      put desc1 at 5 skip.
   end.

   if desc2 <> "" then do:
      if page-size - line-counter < 1 then do:
         page.
         /*DISPLAY CONTINUED*/
         {us/so/sopkd01.i}
         down 1 with frame d.
      end.
      put desc2 at 5 skip.
   end.

   if sod_type <> "" and sod_qty_all > 0 then do:
      display
         sod_qty_all @ qty_open
         qtyshipped @ sod_due_date
      with frame d.
      down 2 with frame d.
   end.

   if sod_custpart <> "" then do:
      if page-size - line-counter < 1 then do:
         page.
         /*DISPLAY CONTINUED*/
         {us/so/sopkd01.i}
         down 1 with frame d.
      end.
      put cspart-lbl at 7 sod_custpart at 23 skip.
   end.

   /*PRINT OPTIONS */
   /********************************************
    sob_serial subfield positions:
    1-4     operation number (old - now 0's)
    5-10    scrap percent
    11-14   id number of this record
    15-15   structure code
    16-16   "y" (indicates "new" format sob_det record)
    17-34   original qty per parent
    35-35   original mandatory indicator (y/n)
    36-36   original default indicator (y/n)
    37-39   leadtime offset
    40-40   price manually updated (y/n)
    41-46   operation number (new - 6 digits)
   *******************************************/
   if print_options and
      can-find(first sob_det where sob_det.sob_domain = global_domain
                               and sob_nbr = so_nbr
                               and sob_line = sod_line)
   then do:

      find first sob_det where sob_det.sob_domain = global_domain
         and sob_nbr = sod_nbr
         and sob_line = sod_line
      no-lock no-error.

      /* NEW STYLE sob_det RECORDS CONTAIN A
         SYMBOLIC REFERENCE IDENTIFIED BY BYTES 11-14 IN sob_serial
      */
      /*eb3sp5
      {us/bbi/gprun.i ""sopkg01.p""
         "(input """",
           input 0,
           input sod_nbr,
           input sod_line)"}
	 */
/*eb3sp5*/    {us/bbi/gprun.i ""xfpkg09.p""
         "(input """", input 0,
           input sod_nbr, input sod_line)"}
   end.

   /*DISPLAY ALLOCATION DETAIL*/
   /* Done in a subroutine because the allocations are in the inventory db*/
   tot_qty_all = 0.
   if sod_type = "" then do:
     /*93sp12.1 {us/bbi/gprun.i ""sopke01.p""} */
      {us/bbi/gprun.i ""xfpke09.p""} /*eb3sp5*/
   end.

   first_line = no.

   /* UPDATE QTY SALES ORDER QTY PICK */
   if si_db <> so_db then do:
      /* Update sod in remote database */
      {us/bbi/gprun.i  ""sosopkb.p"" "(sod_nbr, sod_line, tot_qty_all)"}
      /* Switch back to the sales order database */
      {us/bbi/gprun.i ""gpalias3.p"" "(so_db, output err-flag)" }
   end.

   /* PRINT LINE  ITEM COMMENTS */
   {us/bbi/gprun.i ""sopkb01b.p"" "(input sod_nbr,
                             input sod_line,
                             input sod_part,
                             input cont_lbl,
                             input i,
                             input qty_open)"}

   /* Update sod in SO database */
   {us/bbi/gprun.i  ""sosopkb.p"" "(sod_nbr, sod_line, tot_qty_all)"}

   /* TMS Black Box Interface */
   assign
      tms-error = 0.

   {us/bbi/gprun.i ""sotmsbb.p""
      "(input 'sod',
        input recid(so_mstr),
        input no,
        output tms-error)"}

   {us/mf/mfrpchk.i}
end.  /* For sod_... */

/*d3243* start added code >>>>>>> */
{us/bbi/gprun.i ""xxlocpk.p"" "(recid(so_mstr))"}
/*d3243* end   added code >>>>>>> */



define stream logit.
procedure logit.
def input parameter iptxt as char.
def var logname as char.
logname = entry(num-entries(program-name(1), "~/"), program-name(1), "~/").
logname = entry(1, logname, "~.").
   output stream logit to value("/tmp/" + trim(logname) + ".log") append.
   put stream logit unformatted
   string(program-name(2)) + "|" +
   string(today) + "|" +
   string(time, "HH:MM:SS") + "|" +
   global_userid + "|" +
   iptxt.
   if program-name(3) <> ? then
   put stream logit unformatted
   "|" + string(program-name(3)).
   if program-name(4) <> ? then
   put stream logit unformatted
   "|" + string(program-name(4)).
   put stream logit unformatted
   skip.
   output stream logit close.
   unix value("chmod 666 ~/tmp~/" + trim(logname) + ".log 2~>~/dev~/null").
end.  /* procedure logit */
