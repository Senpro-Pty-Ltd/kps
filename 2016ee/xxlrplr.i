/* xxlrplr.i - WORK ORDER LABEL PRINT COMMON ROUTINE                         */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB    LAST MODIFIED: 05-SEP-2012    BY:  gbg *c1340*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB     DATE: 2015-JUL-10      BY: gbg  *d3205*                    */
/******************************************************************************/

define variable l_lbl     as character  format "x(1)"   no-undo.
define variable l_ptc10   as character  format "x(40)"  no-undo.
define variable l_ptc06   as character  format "x(40)"  no-undo.
define variable l_ptdloc  as character  format "x(40)"  no-undo.
define variable l_ptdsize as character  format "x(40)"  no-undo.
define variable l_ptrev   as character  format "x(40)"  no-undo.
define variable k         as integer                    no-undo. 

assign 
   l_lbl      = ""
   l_ptc10    = ""
   l_ptc06    = ""
   l_ptdloc   = ""
   l_ptdsize  = ""
   l_ptrev    = "".
   
if l_lblno = 0 then l_lblno = 1.

if can-find(first code_mstr where code_domain  = global_domain
                            and   code_fldname = "pt_chg_prod"
                            and   code_value   = pt_prod_line) then
   l_lbl = "C".
else
   l_lbl = "B".

for first code_mstr no-lock 
   where code_domain  = global_domain 
   and   code_fldname = "pt__chr10"
   and   code_value   = pt__chr10:
   l_ptc10 = trim(code_cmmt).   
end.

for first code_mstr no-lock 
   where code_domain  = global_domain 
   and   code_fldname = "pt__chr06"
   and   code_value   = pt__chr06:
   l_ptc06 = trim(code_cmmt).   
end.
   
for first code_mstr no-lock 
   where code_domain  = global_domain 
   and   code_fldname = "pt_drwg_loc"
   and   code_value   = pt_drwg_loc:
   l_ptdloc = trim(code_cmmt).   
end.

for first code_mstr no-lock 
   where code_domain  = global_domain 
   and   code_fldname = "pt_drwg_size"
   and   code_value   = pt_drwg_size:
   l_ptdsize = trim(code_cmmt).   
end.

for first code_mstr no-lock 
   where code_domain  = global_domain 
   and   code_fldname = "pt_rev"
   and   code_value   = pt_rev:
   l_ptrev = trim(code_cmmt).   
end.
/*d3205* start deleted code >>>>
* do k = 1 to l_lblno:    
*    put stream ft unformatted
*       l_lbl                          + "," +
*       pt_part                        + "," +
*       replace(pt_desc1,","," ")      + "," +
*       ld_lot                         + "," +
*       ld_ref                         + "," +
*       pt__chr03                      + "," +
*       pt__chr04                      + "," +              
*       pt_draw                        + "," +
*       pt__chr05                      + "," +
*       pt__chr07                      + "," +
*       pt__chr08                      + "," +
*       pt__chr09                      + "," +
*       replace(l_ptc10,","," ")       + "," +
*       replace(l_ptc06,","," ")       + "," +
*       string(pt_size)                + "," +
*       pt_promo                       + "," +
*       replace(l_ptdloc,","," ")      + "," +
*       pt__chr01                      + "," +
*       pt__chr02                      + "," +
*       pt_desc2                       + "," +
*       replace(l_ptdsize,","," ")     + "," +
*       replace(l_ptrev,","," ")       skip.
* end.   
*d3205* end deleted code <<<< */

/*d3205* start added code >>> */
find first tr_hist no-lock
where tr_domain = ld_domain
and   tr_serial = ld_lot
and   tr_site = ld_site
and   tr_part = ld_part
and   tr_type = "rct-wo"
no-error.

do k = 1 to l_lblno:    
   put stream ft unformatted
      l_lbl                          + "," +
      pt_part                        + "," +
      replace(pt_desc1,","," ")      + "," +
      ld_lot                         + "," +
      ld_ref                         + "," +
      pt__chr03                      + "," +
      pt__chr04                      + "," +              
      pt_draw                        + "," +
      pt__chr05                      + "," +
      pt__chr07                      + "," +
      pt__chr08                      + "," +
      pt__chr09                      + "," +
      replace(l_ptc10,","," ")       + "," +
      replace(l_ptc06,","," ")       + "," +
      string(pt_size)                + "," +
      pt_promo                       + "," +
      replace(l_ptdloc,","," ")      + "," +
      pt__chr01                      + "," +
      pt__chr02                      + "," +
      pt_desc2                       + "," +
      replace(l_ptdsize,","," ")     + "," +
      replace(l_ptrev,","," ")       + ",".
      if available tr_hist  then
      put stream ft unformatted string(tr_date).

      put stream ft unformatted skip.
end.   
/*d3205* end added code <<<< */
   
                            
