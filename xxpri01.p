/* xxpri01.p - PRICE LIST PRINT                                              */
/* xxprirpt.p - PRICE LIST PRINT                                             */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB           CREATED: 24-AUG-2010            BY: psu *cy1004*            */
/* CYB          MODIFIED: 24-FEB-2011            BY: psu *cy1004-1*          */
/* CYB          MODIFIED: 11-MAY-2011            BY: psu *cy1004-2*          */
/* CYB          MODIFIED: 11-AUG-2011            BY: gbg *c1232*             */
/* CYB    LAST MODIFIED: 13-AUG-2012    BY:  gbg *c1327*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 07-MAY-2013    BY:  gbg *c1401*                      */
/* CYB    LAST MODIFIED: 09-MAY-2013    BY:  gbg *c1404*                      */
/* CYB    LAST MODIFIED: 24-MAY-2013    BY:  gbg *c1408*                      */
/* CYB    LAST MODIFIED: 17-JUN-2013    BY:  gbg *c1419*                      */
/* CYB    LAST MODIFIED: 04-NOV-2013    BY:  nac *nac1*                      */
/* CYB    LAST MODIFIED: 11-DEC-2013    BY:  gbg *c1449*                      */
/* CYB    LAST MODIFIED: 11-DEC-2013    BY:  gbg *c1455*                      */
/* CYB                   LAST MODIFIED: 2016-Apr-27 BY: gbg *c1577* d3475  */
/* CYB                   LAST MODIFIED: 2016-Apr-27 BY: gbg *d3475*   */
/* CYB                   LAST MODIFIED: 2016-Dec-21 BY: gbg *c1594*   */
/* CYB                   LAST MODIFIED: 2017-Feb-07 BY: gbg *c1596*   */
/* CYB                   LAST MODIFIED: 2017-May-12 BY: gbg *c1604*   */
/* CYB                   LAST MODIFIED: 2017-Jun-05 BY: gbg *c1608*   */
/******************************************************************************/

{us/mf/mfdtitle.i "x2 "}    /* TITLE AND DEFINED VARIABLES */ /*cy1004-2*/
{us/px/pxsevcon.i}         /* SEVERITY PREPROCESSOR INCLUDE FILE */

define variable code        like     cm_addr                        no-undo.
define variable code1       like     cm_addr                        no-undo.
define variable site        like     cm_site                        no-undo.
define variable site1       like     cm_site                        no-undo.
define variable slspsn      like     cm_slspsn[1]                   no-undo.
define variable slspsn1     like     cm_slspsn[1]                   no-undo.
define variable l_class     like     cm_class                       no-undo.
define variable l_effdate   as       date                           no-undo.
define variable l_cont      like     mfc_logical                    no-undo.
define variable l_csv       like     mfc_logical                    no-undo.
define variable l_filename  as       character   format "x(40)"     no-undo. 
define variable l_col       as       integer                        no-undo.
define variable i           as       integer                        no-undo.
define variable l_count     as       integer                        no-undo.
define variable l_sitesec   like     mfc_logical                    no-undo. /*cy1004-1*/
/*define variable l_catlist   as       character                      no-undo. /*cy1004-1*/ cy1004-2*/
define variable l_prtall    like     mfc_logical                    no-undo. /*cy1004-1*/
/*c1401* start added code */ 
def var itmstats  as char.
/*c1401* end   added code */ 
/*cy1004-2 BEGIN*/
define variable l_prlistgp   like     pt_break_cat                  no-undo.
define variable l_prlistgp1  like     pt_break_cat                  no-undo.
define variable l_prlistcat  like     pt_drwg_loc                   no-undo.
define variable l_prlistcat1 like     pt_drwg_loc                   no-undo.
define variable l_brand      like     pt_group                      no-undo.
define variable l_clscmt     as   character   format "x(25)"        no-undo.
define variable l_brncmt     as   character   format "x(25)"        no-undo.
define variable l_brandlst   as      character                      no-undo.
define variable lv_brand     as char.
/*cy1004-2 END*/
/*c1596* start added code >>> */
define variable l_startdt    as date.
/*c1596* end added code <<<< */

/* VARIABLES REQUIRED FOR sopiwiq1.p*/
define variable discount        as decimal  format "->>>9.9<<<".
define variable ext_price       like pih_amt.
define variable v_success       like mfc_logical   no-undo.
define variable best_net_price  like sod_price     no-undo.
define variable l_dummy         like sod_price     no-undo.
/*c1577* start added code >>>> */
define variable rrp_list_price  like sod_price     no-undo.
define variable taxcodes as char init "GST-O,U01,10".
/*c1577* end added code <<<< */

define stream csvstr.

/* SHARED DEFINITIONS */
{us/so/sopiwiq1.i new }  /* OUTPUT WORKFILE (SHARED) FOR PRICE LISTS USED */
{us/xf/xfdefa.i  "new"} /*global FT Vars */
{com/qad/mfgpro/gpgenfld.i} /*Methods to get values of additonal Screen fields defined here*/

/*c1404* start added code */
/*c1408*/ def new shared var anx_logic       as logical.
{us/xx/xxprir01.i NEW}
/*c1404* end   added code */

/*c1577* start added code >>>> */
define temp-table tt_data no-undo
   fields  tt_cust      like cm_addr
   fields  tt_name      like ad_name 
   fields  tt_effdate   like l_effdate
   fields  tt_slspsn    like cm_slspsn[1]
   fields  tt_type      like pt_drwg_loc
   fields  tt_cat       like pt_break_cat
   fields  tt_warranty  like pt_promo
   fields  tt_typedesc  like code_cmmt
   fields  tt_part      like pt_part
   fields  tt_desc1     like pt_desc1
   fields  tt_desc2     like pt_desc2
   fields  tt_price     as   decimal
   fields  tt_rrp       as   decimal
   fields  tt_brand     as   char
   fields  tt_curr      as   char
index idx1 is primary tt_cust tt_type tt_cat tt_part.
/*c1577* end   added code <<<< */
/*c1577* start deleted code >>>>
define temp-table tt_data no-undo
   fields  tt_cust      like cm_addr
   fields  tt_name      like ad_name 
   fields  tt_effdate   like l_effdate
   fields  tt_slspsn    like cm_slspsn[1]
   fields  tt_type      like pt_drwg_loc
   fields  tt_cat       like pt_break_cat
   fields  tt_warranty  like pt_promo
   fields  tt_typedesc  like code_cmmt
   fields  tt_part      like pt_part
   fields  tt_desc1     like pt_desc1
   fields  tt_desc2     like pt_desc2
   fields  tt_price     as   decimal
   fields  tt_brand     as   char
index idx1 is primary tt_cust tt_type tt_cat tt_part.

*c1577* end deleted code <<<<<< */
/*define buffer buf_data for tt_data. */
      
form 
   code              colon 20
   code1             colon 45 label "To"
   site              colon 20
   site1             colon 45 label "To"
   slspsn            colon 20
   slspsn1           colon 45 label "To"
   /*cy1004-2 BEGIN*/
   l_prlistgp        colon 20 label "Price List Group"
   l_prlistgp1       colon 45 label "To"
   l_prlistcat       colon 20 label "Price List Category"
   l_prlistcat1      colon 45 label "To"
   /*cy1004-2 END*/
   skip(1)
   l_brand           colon 35 label "Brand" /*cy1004-2*/
   l_brncmt no-labels format "x(25)"        /*cy1004-2*/ 
   l_effdate         colon 35 
/*c1596*/ l_startdt  colon 35 label "From Start Date"
   skip(1)
   l_csv             colon 35 label "Comma Separated File(CSV)"
   l_filename        colon 35 label "CSV FileName"
/*c1408*/ anx_logic  colon 35 label "Exclusion Logic"
with frame a side-labels width 80.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).

function typedesc returns character (input parm1 as character):
/*------------------------------------------------------------------------------
      Purpose: Get Description for Type                                                      
      Notes:                                                     
------------------------------------------------------------------------------*/ 

      define variable result as character no-undo.
      
      for first code_mstr no-lock
         where  code_domain  = global_domain
         and    code_fldname = "pt_drwg_loc" /*cy1004-1*/
         and    code_value   = parm1:
      end.
      if available code_mstr then
        result = trim(code_cmmt).
      else
        result = "Generalised Codes not defined for " + parm1.       
      return result.
end function.

function brandlist returns character (input parm1 as decimal):
/*------------------------------------------------------------------------------
      Purpose: Get List of brands assigned to the customer                                                      
      Notes:                                                     
------------------------------------------------------------------------------*/ 

      define variable result  as character no-undo.
      define variable l_temp  as character no-undo.
      define variable i       as integer   no-undo.
      define variable l_field as character no-undo.
      
      do i = 1 to 20:
         l_field = "cm_brand" + string(i,"99").
         l_temp = "".
         l_temp = GetFieldValueChar("cm_mstr",l_field,parm1,yes).
         if l_temp <> "" then
         do:
            if result = "" then 
               result = l_temp.
            else
               result = result + "," + l_temp.
         end. /*if l_temp <> "" then*/
      end. /*do i = 1 to 20:*/
          
      return result.
end function.

mainloop:
repeat:
   if code1   = hi_char then code1   = "".
   if site1   = hi_char then site1   = "".
   if slspsn1 = hi_char then slspsn1 = "".
   if l_prlistgp1  = hi_char then l_prlistgp1 = "". /*cy1004-2*/
   if l_prlistcat1 = hi_char then l_prlistcat1 = "". /*cy1004-2*/
   
   assign 
      l_effdate  = today
/*c1596*/ l_startdt  = today - 1
      l_cont     = no
      l_filename = "PRICELIST" + string(year(today),"9999")
                               + string(month(today),"99")
                               + string(month(today),"99")
                               + ".csv"
      l_sitesec = no
      l_prtall  = no
      l_clscmt  = ""   /*cy1004-2*/
      l_brncmt  = "".  /*cy1004-2*/
    
/*c1401* start added code */ 
   itmstats = "".
   for each code_mstr no-lock
   where code_domain = global_domain
   and   code_fldname = "pt_status_include":
      if itmstats <> "" then itmstats = itmstats + "|".
      itmstats = itmstats + trim(code_value).
   end.
/*c1401* end   added code */ 
   
   empty temp-table tt_data.
   
   update 
      code
      code1
      site
      site1
      slspsn
      slspsn1
      /*cy1004-2 BEGIN*/
      l_prlistgp
      l_prlistgp1
      l_prlistcat
      l_prlistcat1
      /*cy1004-2 END*/
      l_brand /*cy1004-2*/
      l_effdate
/*c1596*/ l_startdt
      l_csv
/*c1408*/ anx_logic
   with frame a
   editing:

      /*cy1004-2 BEGIN*/
      if frame-field = "l_brand" then 
      do:
         /* FIND NEXT/PREVIOUS RECORD */
         {us/mf/mfnp05.i code_mstr
                   code_fldval
                   " code_mstr.code_domain = global_domain
                     and code_fldname  = ""pt_group"" "
                   code_value
                   "l_brand"}
                                               
         if recno <> ? then 
         display 
            code_value @ l_brand
            code_cmmt  @ l_brncmt
         with frame a.                                
      end.
      /*cy1004-2 END*/
      else
      do:
         readkey.
         apply lastkey.
      end.   
   end. /*EDITING*/   

   
   if l_csv then 
      update l_filename with frame a.
      

   
   /*cy1004-2 BEGIN*/
   if l_brand <> "" and not can-find(first code_mstr 
                                     where code_domain  = global_domain
                                     and   code_fldname = "pt_group"
                                     and   code_value   = l_brand) then
   do:
      /* Value must exist in GENERALIZED CODES  */
      {us/bbi/pxmsg.i &MSGNUM=716 &ERRORLEVEL={&APP-ERROR-RESULT}}
      next-prompt l_brand with frame a.
      if not batchrun then
         undo mainloop, retry mainloop.
      else 
         undo mainloop, leave.
   end. /*if l_brand <> "" and*/                    
   /*cy1004-2 END*/

   if l_class = "" and code  = "" and code1 = "" and 
    site   = "" and site1   = "" and  slspsn = "" and slspsn1 = "" then 
   do:
      if not batchrun then
      do: 
         /*6667 Selection criteria may result in full table scan. Continue*/
         {us/bbi/pxmsg.i &MSGNUM=6667 &ERRORLEVEL={&INFORMATION-RESULT} &CONFIRM=l_cont}
         if not l_cont then 
         do:
           next-prompt code with frame a.
           undo mainloop, retry mainloop.
         end.
      end.     
   end. /*if code = "" and code1 = "" and l_class = "" then*/
   
   if l_class <> "" and (code <> "" or code1 <> "" or 
                         site <> "" or site1 <> "" or                       
                         slspsn <> "" or slspsn1 <> "") then
   do:
      /* Select either range or class but not both*/
      {us/bbi/pxmsg.i &MSGTEXT="'Select either range or class but not both'" &ERRORLEVEL={&APP-ERROR-RESULT}}
      next-prompt code with frame a.
      if not batchrun then
         undo mainloop, retry mainloop.
      else 
         undo mainloop, leave.
   end.     
   
   /* CHECK SITE SECURITY */
   {us/bbi/gprun.i ""gpsirvr.p""
      "(input site, input site1, output return_int)"}

   if return_int = 0
   then do:
      if not batchrun
      then do:
         next-prompt site with frame a.
         undo mainloop, retry mainloop.
      end.
      else
         undo mainloop, leave mainloop.
   end.
    
   bcdparm = "".
   
   {us/bbi/gprun.i ""gpquote.p""
            "(input-output bcdparm,
              input 8,
              input code,
              input code1,
              input site,
              input site1,
              input slspsn,
              input slspsn1,
              input l_class,
              input string(l_effdate),
              input string(l_startdt),
              input l_prtall,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char,
              input null_char)"}
              
   if code1   = "" then code1   = hi_char.
   if site1   = "" then site1   = hi_char.
   if slspsn1 = "" then slspsn1 = hi_char.
   if l_prlistgp1 = "" then l_prlistgp1  = hi_char. /*cy1004-2*/
   if l_prlistcat1 = "" then l_prlistcat1 = hi_char. /*cy1004-2*/
   
 
   /* OUTPUT DESTINATION SELECTION */
   {us/gp/gpselout.i &printType = "printer"
               &printWidth = 80
               &pagedFlag = "nopage"
               &stream = "stream ft"
               &appendToFile = " "
               &streamedOutputToTerminal = " "
               &withBatchOption = "yes"
               &displayStatementType = 1
               &withCancelMessage = "yes"
               &pageBottomMargin = 6
               &withEmail = "yes"
               &withWinprint = "yes"
               &defineVariables = "yes"}
   
   {us/xf/xfoutnul.i} 

/*c1596* start added code >>>>> */
/* clear previous records */
     for each usrw_wkfl
     where usrw_domain = global_domain
     and   usrw_key1 = "pricebrw":
        delete usrw_wkfl.
     end.
/*c1596* end added code <<< */

/*c1404* start deleted code *>>>>>
   for each cm_mstr no-lock 
      where cm_domain     = global_domain
      and   cm_addr      >= code
      and   cm_addr      <= code1
      and   cm_site      >= site
      and   cm_site      <= site1
      and   cm_slspsn[1] >= slspsn
      and   cm_slspsn[1] <= slspsn1
      and  (l_class = "" or cm_class = l_class),
      each  pi_mstr no-lock 
      where pi_domain     = global_domain
      and   pi_cs_code    = cm_addr
      and   pi_cs_type    = "9"
      and   pi_curr       = cm_curr
      and  (pi_start  <= l_effdate or pi_start  = ?)
      and  (pi_expire >= l_effdate or pi_expire = ?),
      first ad_mstr no-lock
      where ad_domain     = global_domain
      and   ad_addr       = cm_addr:
*c1404* end deleted code <<<<<<<<<<<<<<<*/

/*c1404* start added code */
   empty temp-table ttcan.



/*c1594* start added code >>>> */
   for each cm_mstr no-lock 
   where cm_domain     = global_domain
   and   cm_addr      >= code
   and   cm_addr      <= code1
   and   cm_site      >= site
   and   cm_site      <= site1
   and   cm_slspsn[1] >= slspsn
   and   cm_slspsn[1] <= slspsn1
/*c1604*/  and  (l_class = ? or cm_class = ""),
/*c1604*   and  (l_class = "" or cm_class = l_class), */
   first debtor no-lock
   where debtor.debtorcode = cm_addr
   and   debtor.debtorisactive
/*c1608*   and   debtor.customcombo6 = "priced" */
   :
      create ttcan.
      assign
      ttcmaddr = cm_addr
      ttanxcode = cm_addr.
      run bildcsanx (cm_addr, cm_addr). 
   end.
   /* remove duplicates */
   for each ttcan
   break by ttcmaddr by ttanxcode:
     if not first-of(ttanxcode) then delete ttcan.
   end.
/*c1594* end added code <<<< */


/*c1594* start deleted code >>>
*    for each cm_mstr no-lock 
*    where cm_domain     = global_domain
*    and   cm_addr      >= code
*    and   cm_addr      <= code1
*    and   cm_site      >= site
*    and   cm_site      <= site1
*    and   cm_slspsn[1] >= slspsn
*    and   cm_slspsn[1] <= slspsn1
*    and  (l_class = "" or cm_class = l_class):
*       create ttcan.
*       assign
*       ttcmaddr = cm_addr
*       ttanxcode = cm_addr.
*       run bildcsanx (cm_addr, cm_addr). 
*    end.
*    /* remove duplicates */
*    for each ttcan
*    break by ttcmaddr by ttanxcode:
*      if not first-of(ttanxcode) then delete ttcan.
*    end.
*c1594* end deleted code <<<<<< */

/*c1408*/ cmloop:
   for each cm_mstr no-lock 
      where cm_domain     = global_domain
      and   cm_addr      >= code
      and   cm_addr      <= code1
      and   cm_site      >= site
      and   cm_site      <= site1
      and   cm_slspsn[1] >= slspsn
      and   cm_slspsn[1] <= slspsn1
/*c1604*/     and  (l_class = ? or cm_class = ""),
/*c1604*      and  (l_class = "" or cm_class = l_class), */
      each ttcan where ttcmaddr = cm_addr,
      each  pi_mstr no-lock 
      where pi_domain     = global_domain
      and   pi_cs_code    = ttanxcode
      and   pi_cs_type    = "9"
      and   pi_curr       = cm_curr
/*c1596*/ and pi_start >= l_startdt
      and  (pi_start  <= l_effdate or pi_start  = ?)
      and  (pi_expire >= l_effdate or pi_expire = ?),
      first ad_mstr no-lock
      where ad_domain     = global_domain
      and   ad_addr       = cm_addr
/*c1594*/ break by cm_addr by pi_part_code      
      :
/*c1404* end   added code */

/*c1596* start deleted code >>>>
/*c1594* start added code */
  if first-of(cm_addr) then do:
     for each usrw_wkfl no-lock
     where usrw_domain = global_domain
     and   usrw_key1 = "pricebrw"
     and   usrw_key2 begins cm_addr:
        delete usrw_wkfl.
     end.
  end.
/*c1594* end added code */
*c1596* end deleted code <<<<<< */

      
      /*cy1004-1 BEGIN*/
      if not l_prtall and cm__chr04 = "yes" then next.
      
      /* CHECK SITE SECURITY */
      {us/bbi/gprun.i ""gpsiver.p""
	       "(input cm_site, input ?, output return_int)"}

      if return_int = 0  then 
      do:
         l_sitesec = yes.
         leave.
      end.
      /*cy1004-1 END*/
      
      /*cy1004-2 BEGIN*/
      /*Get Customer Brand details*/
      l_brandlst = "".
      l_brandlst = brandlist(oid_cm_mstr).
      if l_brand <> "" and lookup(l_brand,l_brandlst,",") = 0 then next.
      if l_brand <> "" then l_brandlst = l_brand.
      /*cy1004-2 END*/
      
      /*CHECK IF ITEM OR ANALYSIS CODE, IF ANALYSIS CODE THEN FIND ALL ITEMS   
        IN THE ANALYSIS CODE*/
      if not can-find(first pt_mstr where pt_domain = global_domain
                                    and   pt_part   = pi_part_code) then 
      do:
         for first an_mstr no-lock 
            where  an_domain = global_domain 
            and    an_type   = pi_part_type
            and    an_code   = pi_part_code:
         end.      
         if available an_mstr then 
         do:
            for each anx_det no-lock 
               where anx_domain = global_domain
               and   anx_type   = an_type
               and   anx_code   = an_code:

               for first pt_mstr no-lock
                  where pt_domain = global_domain
                  and   pt_part   = anx_node
/*c1232*/         and   pt_drwg_loc <> ?
/*c1232*/         and   pt_drwg_loc <> ""
                  /*cy1004-2 BEGIN*/
                  and   pt_break_cat >= l_prlistgp
                  and   pt_break_cat <= l_prlistgp1
                  and   pt_drwg_loc  >= l_prlistcat
                  and   pt_drwg_loc  <= l_prlistcat1
                  and   lookup(pt_group,l_brandlst,",") <> 0
                  /*cy1004-2 END*/:
               end.
               if available pt_mstr then  
               do:

/*c1232* start added code */
		  find first code_mstr no-lock
		  where code_domain = global_domain
		  and   code_fldname = "pt_group"
		  and   code_value = pt_group
		  no-error.
                  lv_brand = if available code_mstr then code_cmmt else "".
/*c1232* end   added code */
                       
                  for first tt_data exclusive-lock 
                     where  tt_cust   = cm_addr
                     and    tt_type   = pt_drwg_loc
                     and    tt_cat    = pt_break_cat
                     and    tt_part   = pt_part:
                  end.
                  if not available tt_data then 
                  do:
                     create tt_data.
                     assign 
                        tt_cust     = cm_addr
                        tt_name     = ad_name 
                        tt_effdate  = l_effdate
                        tt_slspsn   = cm_slspsn[1]
                        tt_type     = pt_drwg_loc
                        tt_warranty = pt_promo
                        tt_cat      = pt_break_cat
                        tt_typedesc = typedesc(pt_drwg_loc)
                        tt_part     = pt_part
                        tt_desc1    = pt_desc1
                        tt_desc2    = pt_desc2
/*c1232*/		tt_brand    = lv_brand
/*c1594*/               tt_curr = cm_curr
                        tt_price    = 0.   
/*c1577*/               tt_rrp = 0.
                      {us/xx/xxgetpri.i}
                      tt_price = best_net_price. /*cy1004-1*/
/*c1577*/             tt_rrp = rrp_list_price.
                  end. /*if not available tt_data then*/     
               end. /*if available pt_mstr then*/        
            end. /*for each anx_det no-lock*/       
         end. /*if available an_mstr then*/   
      end. /*if not can-find(first pt_mstr*/       
      else
      do:
         for first pt_mstr no-lock 
            where  pt_domain = global_domain
            and    pt_part   = pi_part_code
/*c1232*/   and   pt_drwg_loc <> ?
/*c1232*/   and   pt_drwg_loc <> ""
            /*cy1004-2 BEGIN*/
            and   pt_break_cat >= l_prlistgp
            and   pt_break_cat <= l_prlistgp1
            and   pt_drwg_loc  >= l_prlistcat
            and   pt_drwg_loc  <= l_prlistcat1
            and   lookup(pt_group,l_brandlst,",") <> 0
            /*cy1004-2 END*/:
         end. /*for first pt_mstr no-lock*/    
         if available pt_mstr then  
         do:
/*c1232* start added code */
		  find first code_mstr no-lock
		  where code_domain = global_domain
		  and   code_fldname = "pt_group"
		  and   code_value = pt_group
		  no-error.
                  lv_brand = if available code_mstr then code_cmmt else "".
/*c1232* end   added code */

             
            for first tt_data exclusive-lock 
               where  tt_cust   = cm_addr
               and    tt_type   = pt_drwg_loc
               and    tt_cat    = pt_break_cat
               and    tt_part   = pt_part:
            end.
            if not available tt_data then 
            do:
               create tt_data.
               assign 
                  tt_cust     = cm_addr
                  tt_name     = ad_name 
                  tt_effdate  = l_effdate
                  tt_slspsn   = cm_slspsn[1]
                  tt_type     = pt_drwg_loc
                  tt_warranty = pt_promo
                  tt_cat      = pt_break_cat
                  tt_typedesc = typedesc(pt_drwg_loc)
                  tt_part     = pt_part
                  tt_desc1    = pt_desc1
                  tt_desc2    = pt_desc2
/*c1232*/	  tt_brand    = lv_brand
                  tt_price    = 0.   
               {us/xx/xxgetpri.i}
               tt_price = best_net_price. /*cy1004-1*/
/*c1577*/             tt_rrp = rrp_list_price.
            end. /*if not available tt_data then*/     
         end. /*if available pt_mstr then*/          
      end. /*else*/                             
   end. /*for each cm_mstr no-lock*/   


/*c1401* start added code */
   if itmstats <> ""
   then do:
     for each tt_data,
     first pt_mstr no-lock
     where pt_domain = global_domain
     and   pt_part = tt_part:
        if lookup(pt_status, itmstats, "|") = 0
	then delete tt_data.
     end.
   end.
/*c1401* end   added code */
   
   /*cy1004-1 BEGIN*/
   if l_sitesec then 
   do:
      {us/bbi/pxmsg.i &MSGNUM=725 &ERRORLEVEL=3}
       undo, retry.
   end.
   /*cy1004-1 END*/

   /*CSV FILE OUTPUT*/
   if l_csv then 
     output stream csvstr to value(l_filename).
       
   l_col = 1.
   i     = 0.
   for each tt_data no-lock
      break by tt_cust
/*c1232*/   by substring(tt_type, 1, 1)
            by tt_type
/*c1232*/   by tt_desc1
            by tt_part:
         
      
/*nac1>>*/
      if first-of(tt_cust) and spooler 
/*c1449*/ and not first(tt_cust)
      then do:
         output stream ft through value(path) page-size value(printlength).
	 run sendControlCodesToOutputDevice.
      end.
/*nac1<<*/

      if first-of(tt_cust)
/*c1232*/   or first-of(substring(tt_type, 1, 1))
      then do:
/*c1327* start of added code */
         if first-of(tt_cust)
	 then do:
           {us/xx/xxprirpm0.i}
	 end.
	 else do:
            {us/xx/xxprirpm1.i}
	 end.
/*c1327* end   of added code */
         l_col = 1.
         i = 0.
         
         if l_csv then 
         do:
             put stream csvstr unformatted
                "Customer Code" + "," +
                "Customer Name" + "," +
                "Sales Person"  + "," +
                "Effective Date" + "," +
		"Brand"                      /* c1232 */
		skip.
             
             put stream csvstr unformatted
                tt_cust         + "," +
                tt_name         + "," +
                tt_slspsn       + "," +
                string(tt_effdate) + "," +
		tt_brand                   /* c1232*/
		skip.
         end. /*if l_csv then*/
      end. /*if first-of(tt_cust) then*/           

/*c1232* start added code >>>>> */

      if i = 48  
      or first-of(tt_type)


      then do:
	 if i = 48
	 then do:
	   if l_col = 2 then do:
/*c1327*/         {us/xx/xxprirpm1.i}
            l_col = 1.
	   end.
	   else l_col = 2.
	   i = 0.
	 end.
         {us/xx/xxprirpma.i}
         i = i + 1.
      end.
/*c1232* end   added code >>>>> */
      

/*c1232*/ if first-of(tt_type) then
/*c1232*/ do:
            if l_csv then 
            do:
                put stream csvstr unformatted 
                   tt_typedesc skip.
                
/*c1577* start added code >>>>> */
                   put stream csvstr unformatted 
                   "Item Number" + "," +
                   "Description" + "," +
                   "Type"        + "," +
                   "Warranty"    + "," +
                   "Price"       + "," +
		   "List"
		   skip.   
/*c1577* end   added code <<<<< */
/*c1577* start deleted code >>>>>
                   put stream csvstr unformatted 
                   "Item Number" + "," +
                   "Description" + "," +
                   "Type"        + "," +
                   "Warranty"    + "," +
                   "Price" 
		   skip.   
*c1577* end deleted code <<<< */
            end. /*if l_csv then*/
          end. /*if first-of(tt_type) then*/
      
      {us/xx/xxprirpmb.i}
      i = i + 1.
      
/*c1594* start added code >>> */
     create usrw_wkfl.
     assign
     usrw_wkfl.usrw_domain = global_domain
     usrw_wkfl.usrw_key1 = "pricebrw"
     usrw_wkfl.usrw_key2 = tt_cust + "|" + tt_part
     usrw_wkfl.usrw_key3 = tt_cust
     usrw_wkfl.usrw_key4 = tt_part
     usrw_wkfl.usrw_key5 = tt_curr
     usrw_wkfl.usrw_datefld[1] =  tt_effdate
     usrw_wkfl.usrw_decfld[1] = tt_price.
/*c1594* end added code <<< */

      if l_csv then 
      do:
/*c1577* start added code >>>>> */
          put stream csvstr unformatted 
             tt_part       + "," +   
             tt_desc1      + "," +
             tt_type       + "," +
             tt_warranty   + "," +
             string(tt_price) + ",".
	     if tt_rrp <> ? and tt_rrp <> 0.0 then 
	     put stream csvstr unformatted
	     string(tt_rrp).
	     put stream csvstr unformatted
	     skip.
/*c1577* end   added code <<<<< */
/*c1577* start deleted code >>>>>
          put stream csvstr unformatted 
             tt_part       + "," +   
             tt_desc1      + "," +
             tt_type       + "," +
             tt_warranty   + "," +
             string(tt_price) skip.
*c1577* end deleted code <<<< */
      end. /* if l_csv then*/

/*nac1>>*/
      if last-of(tt_cust) and spooler then do:
         {us/bbi/mfreset.i "stream ft"}
      end.
/*nac1<<*/
          
   end. /*for each tt_data no-lock*/  
   
   if l_csv then 
     output stream csvstr close.
/*nac1*/ if not spooler then do:
       {us/bbi/mfreset.i "stream ft"}
/*nac1*/ end.
end. /*MAINLOOP*/      




