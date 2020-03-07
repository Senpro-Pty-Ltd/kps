/* xfiv10u0.i - INVOICE RE-PRINT USER CODE RECORD TYPE "0"                    */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/******************************************************************************/
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* CYB       LAST MODIFIED: 10-AUG-2010     BY: gbg *cy1002*                  */
/* CYB       LAST MODIFIED: 26-AUG-2010     BY: gbg *cy1002a*                 */
/* CYB       LAST MODIFIED: 21-Sep-2010     BY: nac *cy1002c*                */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 05-FEB-2013     BY: gbg *cy1002h*                 */
/* CYB       LAST MODIFIED: 16-APR-2013     BY: gbg *c1382*                   */
/******************************************************************************/
/*V8:ConvertMode=Report                                                       */
/******************************************************************************/



/* start of new code >> */
def var lvsodtype     as char.
def var lvdunpriced   as char format "x(1)".
def var lvdproofofdelivery   as char format "x(1)".
def var xx_priced as char format "x(8)" initial "PRICED".

lvtotweight = 0.0.
/*c1382* start addesd code */
if length(ih_inv_nbr) > 0 then lvsscc = fn_sscc_inv(ih_inv_nbr).
else  lvsscc = fn_sscc(ih_nbr).
/*c1382* end   addesd code */

/*c1382* start deleted code >>>
lvsscc = fn_sscc(ih_nbr).
*c1382*  end deleted code */

lvdunpriced = if lvunpriced or ih__log01 then "Y" else "N".
lvdproofofdelivery = if lvproofofdelivery then "Y" else "N".

find first idh_hist no-lock
where idh_domain = global_domain
and   idh_inv_nbr = ih_inv_nbr
no-error.
lvsodtype = if available idh_hist then idh_type
            else " ".

lvtotum = " ".
for first idh_hist no-lock
where idh_domain = global_domain
and   idh_inv_nbr = ih_inv_nbr
,
first pt_mstr no-lock
where pt_domain = global_domain
and   pt_part = idh_part:
  lvtotum = pt_ship_wt_um.
end.

find first Debtor no-lock
where Debtor.DebtorCode = ih_cust
no-error.

 put stream ft
 {us/xf/xfput.i ih_site                1100  "x(8)" }  /* site */
 {us/xf/xfput.i lvsodtype              1108  "x(1)" }  /* type */
 .
 if available Debtor
 then do:
 put stream ft
 {us/xf/xfput.i debtor.CustomCombo1    1109  "x(20)" } /* Invoice Group */
 {us/xf/xfput.i Debtor.CustomCombo3    1129  "x(20)" } /* output print/fax/email*/
 {us/xf/xfput.i Debtor.CustomCombo7    1149  "x(20)" } /* Possible Future Use */
 {us/xf/xfput.i Debtor.CustomCombo8    1169  "x(20)" } /* Possible Future Use */
 .
 end.
 put stream ft
 {us/xf/xfput.i lvsscc                 1189  "x(20)" } /* SSCC Number */
 .
 if available Debtor
 then do:
 put stream ft
 {us/xf/xfput.i debtor.customshort0    1209  "x(20)" } /* Possible Future Use */
 {us/xf/xfput.i debtor.customshort1    1229  "x(20)" } /* Cust Ref No CRN */
 {us/xf/xfput.i debtor.customshort2    1249  "x(20)" } /* Store No/Membership No */
 {us/xf/xfput.i debtor.customshort3    1269  "x(20)" } /* Possible Future Use */
 {us/xf/xfput.i debtor.customshort4    1289  "x(20)" } /* Possible Future Use */
 {us/xf/xfput.i debtor.customshort5    1309  "x(20)" } /* Possible Future Use */
 {us/xf/xfput.i debtor.custominteger0 1329  "->,>>>,>>9" } /* Possible Future Use */
 {us/xf/xfput.i debtor.custominteger1 1339  "->,>>>,>>9" } /* Possible Future Use */
 {us/xf/xfput.i debtor.customdecimal0 1349  "->,>>>,>>9.99" } /* Future Use */
 {us/xf/xfput.i debtor.customdecimal1 1362  "->,>>>,>>9.99" } /* Credit Limit */
 {us/xf/xfput.i debtor.customdecimal2 1375  "->,>>>,>>9.99" } /* Future Use */
 .
 end.
 put stream ft
 {us/xf/xfput.i lvdproofofdelivery      1388  "x(1)" } /* from selection criteria */
 {us/xf/xfput.i lvdunpriced         1389  "x(1)" } /* if the selection criteria is */
                                            /* ticked this is always yes. If*/
                                            /* it is not ticked then it is  */
                                            /* the value in                 */
                                            /* Debtor.CustomCombo3 cnverted */
                                            /* to a logical field. That is  */
                                            /* Priced is no and Unpriced is */
                                            /* yes.                         */

 .

if xx_inv_type <> "" then
    put stream ft
    {us/xf/xfput.i xx_inv_type        1390  "x(8)" }. /* From selection criteria  */
else if available debtor and debtor.customcombo6 <> "" then
    put stream ft
    {us/xf/xfput.i debtor.customcombo6 1390  "x(8)" }. /* Priced or Unpriced */
else 
    put stream ft
    {us/xf/xfput.i xx_priced           1390  "x(8)" }. /* Priced      */


 if available Debtor
 then do:
 put stream ft
 {us/xf/xfput.i debtor.customlong0 1398  "x(100)" } /* Possible Future Use */
 {us/xf/xfput.i debtor.customlong1 1498  "x(100)" } /* Possible Future Use */
 .
 end.
 put stream ft "EOL".
 put stream ft "xfiv".




/* end of new code << */
