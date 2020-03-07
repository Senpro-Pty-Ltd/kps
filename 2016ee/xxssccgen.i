/* xxssccgen.i - Common function to calculate a check digit          */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*****************************************************************************/
/* CYB               LAST MODIFIED: 28-MAY-2010     BY: gbg *cy....*         */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*****************************************************************************/

/* Function to calculate label check digit */ 
function fchekdig returns char (input v_lbl as char). 
def var v_len as int no-undo. 
def var v_i as int no-undo. 
def var v_num1 as int no-undo init 0. 
def var v_num2 as int no-undo init 0. 
def var v_checkdigit as int no-undo. 

   v_i = integer(v_lbl) no-error.
   if error-status:error then return "?".
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
end.


