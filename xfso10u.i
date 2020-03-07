/* xfso10u.i - INVOICE PRINT USER CODE DATA DEFINITIONS                       */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* CYB       LAST MODIFIED: 10-AUG-2010     BY: gbg *cy1002*                  */
/* CYB       LAST MODIFIED: 04-Oct-2010     BY: nac *cy1002f*                 */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB       LAST MODIFIED: 05-FEB-2013     BY: gbg *cy1002h*                 */
/*V8:ConvertMode=Report                                                       */


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
   
   lvshipperid = "0000000000".
   for each abs_mstr no-lock
   where abs_domain = global_domain
   and   abs_order = ipnbr
   and   abs_par_id begins "s"
   by abs_shp_date:
     lvshipperid = substring(abs_par_id, 2).
   end.
   
   lvsscc = "".

   if length(lvshipperid) > 1
   then do:
     lvsscc = "00" + substring(lvshipperid, 1, 1) + "9313857" + 
/*cy1002f>>
 * 	 substring(string(year(abs_shp_date), "9999"), 3, 2) +
 * 	 string(month(abs_shp_date), "99") +
 *cy1002f<<*/
   	 substring(lvshipperid, 2).
     lvsscc = lvsscc + fn_lbl_check_digit(lvsscc).
   end.
   return lvsscc.
end.  /* function fn_sscc */
  
/* end of new code << */
