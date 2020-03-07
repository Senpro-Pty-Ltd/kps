/* xfiv10u.i - INVOICE REPRINT USER CODE DATA DEFINITIONS                     */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/******************************************************************************/
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* CYB       LAST MODIFIED: 10-AUG-2010     BY: gbg *cy1002*                  */
/* CYB       LAST MODIFIED: 04-Oct-2010     BY: nac *cy1002f*                 */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                    */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 05-FEB-2013     BY: gbg *cy1002h*                 */
/* CYB       LAST MODIFIED: 16-APR-2013     BY: gbg *c1382*                   */
/******************************************************************************/
/*V8:ConvertMode=Report                                                       */
/******************************************************************************/


/* start of new code >> */
/*cy1002* start added code */
def {1} shared var lvshippedprior   as dec format "->,>>>,>>9.99".
def {1} shared var lvextweight      as dec format "->,>>>,>>9.99".
def {1} shared var lvsscc            as char format "x(10)".
def {1} shared var lvproofofdelivery like mfc_logical
                                     label "Proof of Delivery".
def {1} shared var lvunpriced        like mfc_logical 
                                     label "Print Unpriced".
def {1} shared var xx_inv_type       as char format "x(8)"
                                     label "Invoice Type".
def {1} shared var lvtotweight       as dec format "->,>>>,>>9.99"
                                     label "Total Weight".
def {1} shared var lvtotum           as char format "x(2)"
                                     label "Ship Wght UM".
/*cy1002* end   added code */


/*cy1002* added user functions */


/* Function to calculate label check digit */ 
function fn_lbl_check_digit returns char (input v_lbl as char). 
   def var v_len as int no-undo. 
   def var v_i as int no-undo. 
   def var v_num1 as int no-undo init 0. 
   def var v_num2 as int no-undo init 0. 
   def var v_checkdigit as int no-undo. 
   
   v_len = length(v_lbl). 
   do v_i = v_len to 1 by -2: 
      v_num1 = v_num1 + integer(substring(v_lbl, v_i, 1)). 
   end. 
   v_num1 = v_num1 * 3. 
   do v_i = v_len - 1 to 1 by -2: 
      v_num2 = v_num2 + integer(substring(v_lbl, v_i, 1)). 
   end. 
   
   v_checkdigit = (v_num1 + v_num2) mod 10. 
   
   if v_checkdigit <> 0 then v_checkdigit = 10 - v_checkdigit. 
   return string(v_checkdigit). 
end function.  /* function fn_lbl_check_digit */

function fn_sscc returns char (input ipnbr as char).
   def var lvsscc  as char.
   def var lvshipperid  as char.
   def var lvshipdate   as date.
   
   lvshipperid = "0000000000".
   lvshipdate = today.
   for each abs_mstr no-lock
   where abs_domain = global_domain
   and   abs_order = ipnbr
   and   abs_par_id begins "S"
   by abs_shp_date:
     lvshipperid = substring(abs_par_id, 2).
     lvshipdate = abs_shp_date.
   end.
   
   lvsscc = "".

   if length(lvshipperid) > 1
   then do:
     lvsscc = "00" + substring(lvshipperid, 1, 1) + "9313857" + 
/*cy1002f>>
 * 	 substring(string(year(lvshipdate), "9999"), 3, 2) +
 * 	 string(month(lvshipdate), "99") +
 *cy1002f<<*/
  	 substring(lvshipperid, 2).
     lvsscc = lvsscc + fn_lbl_check_digit(lvsscc).
   end.
   return lvsscc.
end.  /* function fn_sscc */

/*c1382* start added code */
function fn_sscc_inv returns char (input ipnbr as char).
/* This function replaces fn_sscc using invoice number instead of shipper */

   def var lvsscc  as char.
   
   
   lvsscc = "".

   if length(ipnbr) > 0
   then do:
     lvsscc = "0019313857" + substring(ipnbr, 1, min(9, length(ipnbr))).
     lvsscc = lvsscc + fn_lbl_check_digit(lvsscc).
   end.
   return lvsscc.
end.  /* function fn_sscc */
/* end of new code << */
