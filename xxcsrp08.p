/* xxcsrp08.p - BILL OF MATERIAL COST REPORT                            */
/* xxcsrp07.p - BILL OF MATERIAL COST REPORT                            */
/* bmcsrp01.p - BILL OF MATERIAL COST REPORT                            */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxcsrp08.p,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* CHANGED CONVERT MODE FROM FULLGUIREPORT TO REPORT                    */
/* REVISION: 7.0      LAST MODIFIED: 09/25/91   BY: pma *F003*          */
/* REVISION: 7.3      LAST MODIFIED: 02/18/93   BY: pma *G032*          */
/* REVISION: 7.3      LAST MODIFIED: 08/31/93   BY: pxd *GE64*(rev only)*/
/* REVISION: 7.3      LAST MODIFIED: 12/29/93   BY: ais *FL07           */
/* REVISION: 7.3      LAST MODIFIED: 12/06/94   BY: cdt *GO70           */
/* REVISION: 8.6      LAST MODIFIED: 10/14/97   BY: GYK *K0ZG*          */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane    */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan   */
/* REVISION: 9.0      LAST MODIFIED: 02/11/99   BY: *M081* Mugdha Tambe */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan   */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00 BY: *N0KK* jyn              */
/* Revision: 1.7.1.8  BY: Paul Donnelly (SB)  DATE: 06/26/03  ECO: *Q00B* */
/* Revision: 1.7.1.9  BY: Rajinder Kamra      DATE: 06/23/03  ECO: *Q003* */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *FL07*                    */
/* Old ECO marker removed, but no ECO header exists *GO70*                    */
/* $Revision: 1.2 $ BY: Gaurav Kerkar        DATE: 12/18/06  ECO: *P5JD*  */
/* CYB   LAST MODIFIED: 05-AUG-2013    BY: gbg  *c1429                        */
/* CYB   LAST MODIFIED: 18-SEP-2013    BY: gbg  *c1439                        */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/*-Revision end---------------------------------------------------------------*/
/*V8:ConvertMode=Report                                                       */

/* DISPLAY TITLE          */
{us/mf/mfdtitle.i "1+ "}

define shared variable transtype as character.

define new shared variable site  like si_site.
define new shared variable csset like sct_sim.
/*c1429* start added code */
define new shared variable cssetx1 like sct_sim.
define new shared variable csdesc1 like cs_desc format "x(18)".
define new shared variable csmethod1 like cs_method.
define new shared variable cstype1  like cs_type.

define            variable  t1pct      as dec format "->>9.9<<".
define            variable  tot1pb     as dec format "->>>>>>9.9<<<<<<".
define            variable  tot1mtl    as dec format "->>>>>>9.9<<<<<<".
define            variable  tot1std    as dec format "->>>>>>9.9<<<<<<".


define variable vlabour1      as dec format "->>>>>>9.9<<<<<<".
define variable voverhead1    as dec format "->>>>>>9.9<<<<<<".
define variable vscrap1       as dec format "->>>>>>9.9<<<<<<".
define variable vscrapdesc   as char init "Scrap Component".
define variable vprevlevel   as int.


def temp-table tresults
field tpart like pt_part
field tdesc1 like pt_desc1
field tum    like pt_um
field t1qty   as dec format "->>>>>>9.9<<<<<<"
field t2qty   as dec format "->>>>>>9.9<<<<<<"
field tdqty   as dec format "->>>>>>9.9<<<<<<"
field t1cost  as dec format "->>>>>>9.9<<<<<<"
field t2cost  as dec format "->>>>>>9.9<<<<<<"
field tdcost  as dec format "->>>>>>9.9<<<<<<"
field t1lbr   as dec format "->>>>>>9.9<<<<<<"
field t2lbr   as dec format "->>>>>>9.9<<<<<<"
field t1ovh   as dec format "->>>>>>9.9<<<<<<"
field t2ovh   as dec format "->>>>>>9.9<<<<<<"
field t1costext  as dec format "->>>>>>9.9<<<<<<"
field t2costext  as dec format "->>>>>>9.9<<<<<<"
field tdcostext  as dec format "->>>>>>9.9<<<<<<"
index tidx1 tpart.

{us/xx/xxcsrp7x.i NEW}
/*moved to include >>>
def new shared temp-table tcost
field tcpart like pt_part
field tcum   like pt_um
field tcqty   as dec format "->>>>>>9.9<<<<<<"
field tccost  as dec format "->>>>>>9.9<<<<<<"
field tccostext  as dec format "->>>>>>9.9<<<<<<".
*moved to include */

	form
	tpart
	pt_desc1 
	tum
        t1qty       label "QUANTITY"
	t1cost      label "STD COST"
	t1costext   label "TOTAL"
	t1pct       label "~% TOTAL"
	with frame detx down
	no-box no-attr-space
	width 350.

/*c1429* end added code */

define new shared variable part  like pt_part.
define new shared variable part1 like pt_part.

define new shared variable numlevels as integer format ">>>" label "Levels".
define            variable defaultlevels as int.
define new shared variable eff_date  as date initial today
                                             label "As of Date".

define new shared variable newpage like mfc_logical initial yes
                                   label "New Page Each Assembly".
define variable catelm             like mfc_logical format "Element/Category"
                                   label "By Category/Element".
define variable formula_only       like mfc_logical initial no
                                   label "Formula Only" no-undo.

{us/wb/wbrp02.i}
/*c1429* start deleted code >>>>
form skip(1)
   part           colon 25 part1 label "To" skip(1)
   numlevels      colon 25
   eff_date       colon 25
   newpage        colon 25
   catelm         colon 25
   skip(1)
   site           colon 25 skip(1)
   formula_only   colon 25
   csset         colon 25
   cs_desc         colon 25
   cs_method      colon 25
   cs_type        colon 25
with frame a side-labels width 80 attr-space.
*c1429* end deleted code <<<<<<<<<<<<<< */

/*c1429 start added code */

form skip(1)
   part           colon 25 
   numlevels      colon 25
   eff_date       colon 25
   newpage        colon 25
   catelm         colon 25
   skip(1)
   site           colon 25 skip(1)
   formula_only   colon 25
   cssetx1         colon 25  label "Cost Set"
   csdesc1        colon 25
   csmethod1     colon 25
   cstype1       colon 25
   skip(1)
with frame a side-labels width 80 attr-space.

/*c1429 end added code */
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

find first icc_ctrl
   where icc_ctrl.icc_domain = global_domain no-lock.

site = global_site.

find si_mstr no-lock
   where si_mstr.si_domain = global_domain
   and   si_site           = site no-error.

if available si_mstr
then
/*c1429*/   cssetx1 = si_cur_set.
/*c1429*   csset = si_cur_set. */


if not can-find(first code_mstr
where code_domain = global_domain
and   code_fldname = "numlevels"
and   code_value = "default")
then do:
   do transaction:
     create code_mstr.
     assign
     code_domain = global_domain
     code_fldname = "numlevels"
     code_value = "default"
     code_cmmt = "9".
   end.  /* transaction */
   release code_mstr.
end.
find first code_mstr no-lock
where code_domain = global_domain
and   code_fldname = "numlevels"
and   code_value = "default"
no-error.
defaultlevels = 9.
if available code_mstr then do:
  defaultlevels = integer(code_cmmt) no-error.
  if error-status:error then defaultlevels = 9.
end.

repeat:


/*c1429*  start deleted code >>>
   if c-application-mode <> 'web'
   then
      update
         part part1
         numlevels
         eff_date
         newpage
         catelm
         site
         formula_only
         csset
   with frame a
*c1429* end deleted code */

/*c1429*  start added code */
   numlevels = defaultlevels.
   cssetx1 = "standard".
   if c-application-mode <> 'web'
   then
      update
         part
         numlevels
         eff_date
         newpage
         catelm
         site
         formula_only
         cssetx1
   with frame a
/*c1429* end added code */
   editing:

      if frame-field = "site"
      then do:

         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp.i si_mstr site  " si_mstr.si_domain = global_domain and si_site
              "  site si_site si_site}

         if recno <> ?
         then do:
            site = si_site.
            display site with frame a.
            recno = ?.
         end. /* IF recno <> ? */

      end. /* IF frame-field = "site" */

/*c1429* start deleted code >>>>>>
      else if frame-field = "csset"
      then do:
         /* FIND NEXT/PREVIOUS RECORD */
         if transtype = "SIM"
         then do:
            {us/mf/mfnp01.i cs_mstr csset cs_set ""SIM""  "
                 cs_mstr.cs_domain = global_domain and cs_type "  cs_set}
         end. /* IF transtype = "SIM" */
         else
            if transtype = "COST"
            then do:
               {us/mf/mfnp01a.i cs_mstr csset cs_set ""SIM""  "
                  cs_mstr.cs_domain = global_domain and cs_type "  cs_set}
            end. /* IF transtype = "COST" */
            else do:
               {us/mf/mfnp.i cs_mstr csset  " cs_mstr.cs_domain = global_domain and
                 cs_set "  csset cs_set cs_set}
            end. /* IF transtype <> "COST" */

         if recno <> ?
         then do:
            csset = cs_set.
            display csset with frame a.
            find cs_mstr
               where cs_mstr.cs_domain = global_domain
               and   cs_set            = csset
            no-lock no-error.
            if available cs_mstr
            then
               display cs_desc cs_method cs_type with frame a.
            recno = ?.
         end. /* IF recno <> ? */
      end. /* IF frame-field = "csset" */
*c1429* end deleted code <<<<<<<<<<<*/

/*c1429* start added code */
      else if frame-field = "cssetx1"
      then do:
         /* FIND NEXT/PREVIOUS RECORD */
         if transtype = "SIM"
         then do:
            {us/mf/mfnp01.i cs_mstr cssetx1 cs_set ""SIM""  "
                 cs_mstr.cs_domain = global_domain and cs_type "  cs_set}
         end. /* IF transtype = "SIM" */
         else
            if transtype = "COST"
            then do:
               {us/mf/mfnp01a.i cs_mstr cssetx1 cs_set ""SIM""  "
                  cs_mstr.cs_domain = global_domain and cs_type "  cs_set}
            end. /* IF transtype = "COST" */
            else do:
               {us/mf/mfnp.i cs_mstr cssetx1  " cs_mstr.cs_domain = global_domain and
                 cs_set "  cssetx1 cs_set cs_set}
            end. /* IF transtype <> "COST" */

         if recno <> ?
         then do:
            cssetx1 = cs_set.
            display cssetx1 with frame a.
            find cs_mstr
               where cs_mstr.cs_domain = global_domain
               and   cs_set            = cssetx1
            no-lock no-error.
            if available cs_mstr
            then
               display cs_desc  @ csdesc1
	               cs_method  @ csmethod1
		       cs_type  @ cstype1
		       with frame a.
            recno = ?.
         end. /* IF recno <> ? */
      end. /* IF frame-field = "cssetx1" */
/*c1429* end added code */
      else do:
         readkey.
         apply lastkey.
      end. /* IF frame-field <> "csset" */
   end. /* IF (c-application-mode <> 'web') */

   {us/wb/wbrp06.i &command = update &fields = " part part1 numlevels eff_date
        newpage  catelm site formula_only csset " &frm = "a"}

   if (c-application-mode <> 'web')
   or (c-application-mode = 'web'
       and (c-web-request begins 'data'))
   then do:

      bcdparm = "".
      {us/mf/mfquoter.i part        }
      {us/mf/mfquoter.i numlevels   }
      {us/mf/mfquoter.i eff_date    }
      {us/mf/mfquoter.i newpage     }
      {us/mf/mfquoter.i catelm      }
      {us/mf/mfquoter.i site        }
      {us/mf/mfquoter.i formula_only}
/*c1429*/      {us/mf/mfquoter.i cssetx1      }

/*c1429*/      part1 = part.

      /* MOVED VALIDATIONS BELOW MFQUOTER CALLS FOR GUI CONVERSION. */
      if true
      then do:
         find si_mstr
            where si_mstr.si_domain = global_domain
            and   si_site           = site
         no-lock no-error.
         if not available si_mstr
         then do:
            /* SITE DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=708 &ERRORLEVEL=3}

            if c-application-mode = 'web'
            then
               return.
            else
               next-prompt site with frame a.
            undo, retry.
         end. /* IF NOT available si_mstr */

         if si_db <> global_db
         then do:
            /* SITE IS NOT ASSIGNED TO THIS DOMAIN */
            {us/bbi/pxmsg.i &MSGNUM=6251 &ERRORLEVEL=3}

            if c-application-mode = 'web'
            then
               return.
            else
               next-prompt site with frame a.
            undo, retry.
         end. /* IF si_db <> global_db */
      end. /* IF TRUE */

      if true
      then do:

/*c1429* start added code */
         if cssetx1 = ""
         then do:
            /* BLANK NOT ALLOWED */
            {us/bbi/pxmsg.i &MSGNUM=40 &ERRORLEVEL=3}

            if c-application-mode = 'web'
            then
               return.
            else
               next-prompt cssetx1 with frame a.
            undo, retry.
         end. /* IF cssetx1 = "" */

         find cs_mstr
         where cs_mstr.cs_domain = global_domain
         and   cs_set            = cssetx1
         no-lock no-error.
         if not available cs_mstr
         then do:
            /* COST SET DOES NOT EXIST */
            {us/bbi/pxmsg.i &MSGNUM=5407 &ERRORLEVEL=3}

            if c-application-mode = 'web'
            then
               return.
            else
               next-prompt cssetx1 with frame a.
            undo, retry.
         end. /* IF NOT AVAILABLE cs_mstr */

         display cs_desc @ csdesc1
	         cs_method @ csmethod1
		 cs_type  @ cstype1
		 with frame a.



/*c1429* end added code */

      end. /* TRUE */

   end. /* IF (c-application-mode <> 'web') ... */

   assign
   vlabour1      = 0.0
   voverhead1    = 0.0
   vscrap1       = 0.0.

   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 132
               &pagedFlag = " "
               &stream = " "
               &appendToFile = " "
               &streamedOutputToTerminal = " "
               &withBatchOption = "yes"
               &displayStatementType = 1
               &withCancelMessage = "yes"
               &pageBottomMargin = 6
               &withEmail = "yes"
               &withWinprint = "yes"
               &defineVariables = "yes"}

/*c1429*   {us/bbi/mfphead.i} */

/*c1429* start added code */
     csset = cssetx1.
     empty temp-table tcost.
     {us/bbi/gprun.i ""xxcsrp7a.p"" "(input formula_only)"}
     vprevlevel = 0.
     for each tcost by tcseq desc:
        if tclevel < vprevlevel then tcleaf = no.
	vprevlevel = tclevel.
     end.
     for first sct_det no-lock
     where sct_domain = global_domain
     and   sct_site = site
     and   sct_part = part
     and   sct_sim = cssetx1:
	assign
        vlabour1 = vlabour1 + sct_lbr_tl.
        voverhead1 = voverhead1 + sct_ovh_tl.
     end.


     /*  summarise first cost set here */
     empty temp-table tresults.
     vscrap1 = 0.0.
     for each tcost:
        vlabour1 = vlabour1 + tclbr.
	voverhead1 = voverhead1 + tcovh.
     end.

     for each tcost
     where tcleaf or tccostext <> 0.0
     ,
     first pt_mstr no-lock
     where pt_domain = global_domain
     and   pt_part = tcpart
     break by tcpart begins "pb" desc
           by tcpart:
	if tcpart begins "zzscrap"
	then do:
           vscrap1 = vscrap1 + tccostext.
	   vscrapdesc = pt_desc1.
	end.
	else do:
	   accumulate tcqty (total by tcpart).
	   accumulate tccostext (total by tcpart).
	   if last-of(tcpart)
	   then do:
	      find first tresults where tpart = tcpart no-error.
	      if not available tresults then do:
                  create tresults.
	          assign
	          tpart = tcpart
	          tum = tcum
	          t1qty = 0.0
	          t1cost = 0.0
	          t1costext = 0.0
	          t1costext = 0.0
		  t1lbr = 0.0
		  t1ovh = 0.0.
	      end.
   
	      assign
	      t1qty = t1qty + (accum total by tcpart tcqty)
	      t1cost = tccost
	      t1costext = t1costext + (accum total by tcpart tccostext).

	   end.  /* last-of(tcpart)  */
	end.  /* if tcpart begins "zzscrap"  ...  else do:  */
     end.  /* each tcost */


     for each tresults:
        voverhead1 = voverhead1 + t1ovh.
        vlabour1 = vlabour1 + t1lbr.

     end.

     tot1pb = 0.0.
     tot1mtl = 0.0.
     tot1std = vlabour1 + voverhead1 + vscrap1.


     for each tresults:


         if tpart begins "pb" 
	 then do:
	    tot1pb = tot1pb + t1costext.
	 end.
	 else if tpart begins "zzscrap"
	 then do:
            
	 end.
	 else do:
           tot1mtl = tot1mtl + t1costext.
	 end.

         tot1std = tot1std + t1costext.
     end.



     /*  generate report here */

     find first pt_mstr no-lock
     where pt_domain = global_domain
     and   pt_part = part
     no-error.

     form
     tpart to 18
     pt_desc1 to 43
     t1qty to 54
     tum to 57
     t1cost to 68
     t1costext to 79
     t1pct     to 87
     with frame detx1 down no-labels no-box no-attr-space width 350.
     display 
     part @ tpart 
     pt_desc1
     "  " + string(eff_date) format "x(10)" @ t1qty 
     " "  @ tum 
     " Cost Set:" @ t1cost 
     upper(cssetx1) @ t1costext 
     with frame detx1.
     down with frame detx1.
     put skip(2).


     for each tresults 
     ,
     first pt_mstr no-lock
     where pt_domain = global_domain
     and   pt_part = tpart
     break by tpart begins "pb" desc
           by tpart:
        display
	tpart
	pt_desc1 
	tum
        t1qty     
	t1cost   
	t1costext
	" " @ t1pct
	with frame detx down
	no-box no-attr-space
	width 350.
	down with frame detx.
	if last-of(tpart begins "pb") 
	then do:
	    if tpart begins "pb"
	    then do:
	       t1pct = round(tot1pb / tot1std, 3).
	       display
	       "----------" @ t1costext
	       with frame detx.
	       down with frame detx.
	       display
	       "TOTAL LEAD" @ pt_desc1
	       tot1pb @ t1costext
	       t1pct
	       with frame detx.
	       down with frame detx.
	       put skip(3).
	    end.
	    else do:
	       t1pct = round(tot1mtl / tot1std, 3).
	       display
	       "----------" @ t1costext
	       with frame detx.
	       down with frame detx.
	       display
	       "TOTAL MATERIAL EXCL LEAD" @ pt_desc1
	       tot1mtl @ t1costext
	       t1pct
	       with frame detx.
	       down with frame detx.
	       put skip(3).
	    end.
	end.
     end.


     t1pct = round(vlabour1 / tot1std, 3).
     display 
     " " @ tpart
     "Labour" @ pt_desc1 format "x(24)" 
     " " @ t1qty  
     " " @ tum format "x(2)"
     " " @ t1cost 
     vlabour1 @ t1costext
     t1pct
     with frame detx1.
     down with frame detx1.

     t1pct = round(voverhead1 / tot1std, 3).
     display 
     " " @ tpart
     "Overhead" @ pt_desc1
     " " @ t1qty
     " " @ tum
     " " @ t1cost
     voverhead1 @ t1costext
     t1pct
     with frame detx1.
     down with frame detx1.

     t1pct = round(vscrap1 / tot1std, 3).
     display 
     " " @ tpart
     vscrapdesc @ pt_desc1
     " " @ t1qty
     " " @ tum
     " " @ t1cost
     vscrap1 @ t1costext
     t1pct
     with frame detx1.
     down with frame detx1.

     t1pct = round(tot1std / tot1std, 3).
     display
     "----------" @ t1costext
     with frame detx1.
     down with frame detx1.

     display 
     " " @ tpart
     "TOTAL STD COST" @ pt_desc1
     " " @ t1qty
     " " @ tum
     " " @ t1cost
     tot1std @ t1costext
     t1pct
     with frame detx1.
     down with frame detx1.


/*c1429* end  added code */




   /* REPORT TRAILER */
   {us/mf/mfrtrail.i}  

   global_site = site.
end.

{us/wb/wbrp04.i &frame-spec = a}
