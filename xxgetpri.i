/* xxgetpri.i - FETCH THE ACTUAL PRICE                                       */
/* Copyright 1986-2010 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* CYB     LAST MODIFIED: 24-AUG-2010            BY: psu *cy1004*            */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB                   LAST MODIFIED: 2016-Apr-27 BY: gbg *c1577* d3475   */
/* CYB                   LAST MODIFIED: 2016-Apr-27 BY: gbg *d3475*   */
/* CYB                   LAST MODIFIED: 2019-Feb-28 BY: gbg *K10017* P1033 */
/******************************************************************************/

{us/bbi/gprun.i ""sopiwiq1.p""
         "(input  cm_addr,
           input  l_effdate,
           input  cm_site,
           input  cm_curr,
           input  pt_part,
           input  "1",
           input  "0",
           input  pt_um,
           input  """",
           input  """",
           input  "yes",
           output l_dummy,
           output discount,
           output best_net_price,
           output ext_price,
           output v_success)" }


/*c1577* start added code >>>>> */
/*c1603* start deleted code >>>>>>>>
{us/bbi/gprun.i ""sopiwiq1.p""
         "(input  ""RRP"",
           input  l_effdate,
           input  cm_site,
           input  cm_curr,
           input  pt_part,
           input  "1",
           input  "0",
           input  pt_um,
           input  ""RRP"",
           input  "0",
           input  "yes",
           input  """",
           input  """",
           output rrp_list_price,
           output discount,
           output l_dummy,
           output ext_price,
           output v_success)" }
**c1603* end   deleted code <<<<<<< */
/*c1603* start added code >>>>>> */
{us/bbi/gprun.i ""sopiwiq1.p""
         "(input  ""RRP"",
           input  l_effdate,
           input  cm_site,
           input  cm_curr,
           input  pt_part,
           input  "1",
           input  "0",
           input  pt_um,
           input  ""RRP"",
           input  """",
           input  "yes",
           output rrp_list_price,
           output discount,
           output l_dummy,
           output ext_price,
           output v_success)" }
/*c1603* end   added code <<<<<< */

if not can-find(first pi_mstr
                where pi_domain = global_domain
		and   pi_list = "rrp"
		and   pi_cs_type = "9"
                and   pi_cs_code = "rrp"
		and   pi_part_type = "6"
		and   pi_part_code = pt_part
		and   pi_curr = cm_curr
		and   pi_um = pt_um
		and   (pi_start = ? or pi_start <= l_effdate)
		and   (pi_expire = ? or pi_expire >= l_effdate))

then rrp_list_price = 0.0.


find first code_mstr no-lock
where code_domain = global_domain
and   code_value = "list"
no-error.
if not available code_mstr 
then do transaction:
   create code_mstr.
   assign
   code_domain = global_domain
   code_fldname = "rrpgst"
   code_value = "list"
   code_cmmt = taxcodes
   .
end.
else taxcodes = code_cmmt.

for last tx2_mstr no-lock
where tx2_domain = global_domain
and   tx2_tax_type = entry(1, taxcodes)
and   tx2_tax_usage = entry(2, taxcodes)
and   tx2_pt_taxc = entry(3, taxcodes)
and   tx2_effdate <= today
by tx2_effdate:
   rrp_list_price = rrp_list_price * (1 + (tx2_tax_pct / 100)).
end.

/*c1588* End added code <<<<<< */
