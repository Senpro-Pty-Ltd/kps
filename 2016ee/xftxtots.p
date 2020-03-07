/* xftxtots.p - CALCULATE TAX TOTAL AND TOTAL EXCLUDING TAX                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

/* FOR A TRANSACTION, LINE, OR TRAILER, PROGRAM CALCULATES:                   */
/*     . TOTAL TAX (INCLUDED & NOT INCLUDED IN PRICE)                         */
/*     . TOTAL EXCLUDING ANY TAX.                                             */
/* PARAMETERS                                                                 */
/* I/O     Name         Like             Description                          */
/* -----   -----------  ---------------  ------------------------------       */
/* input   tax_tr_type  tx2d_tr_type     Transaction Type Code                */
/* input   ref          tx2d_ref         Document Reference                   */
/* input   nbr          tx2d_nbr         Number (Related Document)            */
/* input   line         tx2d_line        Line Number                          */
/*                                       0 for transaction totals             */
/*                                       99999 for trailer totals             */
/* input   trl          tx2d_trl         Trailer Code                         */
/*                                       null for transaction totals          */
/*                                       null for line totals                 */
/* output  tot_tax      tx2d_cur_tax_amt Total Tax                            */
/* output  tot_ex_tax   tx2d_totamt      Transaction/Line/Trailer total       */
/*                                       excluding any tax                    */

{us/bbi/mfdeclre.i}

define input  parameter tax_tr_type like  tx2d_tr_type      no-undo.
define input  parameter ref         like  tx2d_ref          no-undo.
define input  parameter nbr         like  tx2d_nbr          no-undo.
define input  parameter line        like  tx2d_line         no-undo.
define input  parameter trl         like  tx2d_trl          no-undo.
define output parameter tot_tax     like  tx2d_cur_tax_amt  no-undo.
define output parameter tot_ex_tax  like  tx2d_totamt       no-undo.

assign
   tot_tax    = 0
   tot_ex_tax = 0.

for each tx2d_det no-lock
   where tx2d_det.tx2d_domain = global_domain 
     and  tx2d_ref = ref
     and (tx2d_nbr = nbr or nbr = "")
     and (tx2d_line = line or line = 0)
     and (tx2d_trl = trl or (trl = "" and line <> 99999999))
     and tx2d_tr_type = tax_tr_type :
   
   if tx2d_tr_type = "25" /* PO RETURN */
   then do :
      assign
         tot_ex_tax = tot_ex_tax -
                      (if tx2d_tottax = 0 then tx2d_totamt
                      else tx2d_tottax)
         tot_tax    = tot_tax - tx2d_cur_tax_amt.
   end.
   else do :
      /* CALCULATE TRANSACTION/LINE/TRAILER TOTAL EXCLUDING ANY TAX. */
      assign
         tot_ex_tax = tot_ex_tax +
                      (if tx2d_tottax = 0 then tx2d_totamt
                      else tx2d_tottax).

      /* CALCULATE TRANSACTION/LINE/TRAILER TAX TOTAL. */
      assign tot_tax = tot_tax + tx2d_cur_tax_amt.
   end.

   /* AR ABSORBED AMOUNT DO NOT SHOW UP IN TOTAL */
   if tx2d_tr_type >= "10"
   and tx2d_tr_type <= "19"
   then
      assign tot_tax = tot_tax + tx2d_cur_abs_ret_amt.
end.
