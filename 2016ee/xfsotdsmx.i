/* xfsotdsmx.i SALES ORDER PRINT USER CODE RECORD TYPE "X"                    */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/16/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*V8:ConvertMode=Report                                                       */

do:
   put stream ft  "X"             at 1    format "x(1)"   /*Record Type*/
      "PRE-TRAILER" at 2 format "x(16)"
   .

   {us/xf/xfso05ux.i}

   put stream ft  skip.

   put stream ft
      "5"             at 1    format "x(1)"   /*Record Type*/
         nontaxable_amt  at 62   format "->>>>>>>>>>>9.99" /*Non-taxable Amount*/
         so_mstr.so_curr at 78   format "x(3)"   /*Currency*/
         line_total      at 81   format "->>>>>>>>>>>9.99" /*Line Total*/
         taxable_amt     at 97   format "->>>>>>>>>>>9.99" /*Taxable Amount*/
         tax_amt         at 113  format "->>>>>>>>>>>9.99" /*Total Tax*/
         year(tax_date)  at 129  format "9999"   /*Tax Date - Year*/
         month(tax_date) at 133  format "99"     /*Tax Date - Month*/
         day(tax_date)   at 135  format "99"     /*Tax Date - Day*/
         ord_amt         at 137  format "->>>>>>>>>>>9.99" /*Total*/
         user_desc[1]    at 169  format "x(24)"  /*Trailer 1 Desc*/
         so_mstr.so_trl1_cd at 193  format "x(2)"   /*Trailer 1 Code*/
         so_mstr.so_trl1_amt at 195 format "->>>>>>>>>>>9.99" /*Trailer 1 Amount*/
         user_desc[2]    at 211  format "x(24)"  /*Trailer 2 Desc*/
         so_mstr.so_trl2_cd at 235  format "x(2)"   /*Trailer 2 Code*/
         so_mstr.so_trl2_amt at 237 format "->>>>>>>>>>>9.99" /*Trailer 2 Amount*/
         user_desc[3]    at 253  format "x(24)"  /*Trailer 3 Desc*/
         so_mstr.so_trl3_cd at 277  format "x(2)"   /*Trailer 3 Code*/
         so_mstr.so_trl3_amt at 279 format "->>>>>>>>>>>9.99" /*Trailer 3 Amount*/
         so_mstr.so_disc_pct at 310  format "->>9.99"/*Discount Percentage*/
         disc_amt        at 317  format "->>>>>>>>>>>9.99" /*Discount Amount*/
      .
   
   {us/bbi/gprun.i ""xftxtots.p"" "(
      input tax_tr_type,    /*tx2d_tr_type */
      input so_mstr.so_nbr, /* tx2d_ref */
      input """",           /* tx2d_nbr */
      input 99999999,          /* tx2d_line */
      input so_mstr.so_trl1_cd,
      output tot_tax,
      output tot_ex_tax)"}
   
   put stream ft
      tot_tax   at 333  format "->>>>>>>>>>>9.99" /* Trailer 1 Tax Amount */
      (tot_ex_tax + tot_tax) at 349  format "->>>>>>>>>>>9.99" /* Trailer 1 Total inc  Tax */
      tot_ex_tax at 365 format "->>>>>>>>>>>9.99" /*Trailer1 Total excl Tax */
   .
   
   {us/bbi/gprun.i ""xftxtots.p"" "(
      input tax_tr_type,    /* tx2d_tr_type */
      input so_mstr.so_nbr, /* tx2d_ref */
      input """",           /* tx2d_nbr */
      input 99999999,          /* tx2d_line */
      input so_mstr.so_trl2_cd,
      output tot_tax,
      output tot_ex_tax)"}
   
   put stream ft
      tot_tax    at 381  format "->>>>>>>>>>>9.99" /* Trailer 2 Tax Amount */
      (tot_ex_tax + tot_tax) at 397  format "->>>>>>>>>>>9.99" /* Trailer 2 Total inc  Tax */
      tot_ex_tax at 413 format "->>>>>>>>>>>9.99" /*Trailer 2 Total excl Tax */
   .
   
   {us/bbi/gprun.i ""xftxtots.p"" "(
      input tax_tr_type,    /* tx2d_tr_type */
      input so_mstr.so_nbr, /* tx2d_ref */
      input """",           /* tx2d_nbr */
      input 99999999,          /* tx2d_line */
      input so_mstr.so_trl3_cd,
      output tot_tax,
      output tot_ex_tax)"}
   
   put stream ft
      tot_tax at 429  format "->>>>>>>>>>>9.99" /* Trailer 3 Tax Amount */
      (tot_ex_tax + tot_tax) at 445  format "->>>>>>>>>>>9.99" /* Trailer 3 Total inc  Tax */
      tot_ex_tax at 461 format "->>>>>>>>>>>9.99" /*Trailer3 Total excl Tax */
   .

   {us/xf/xfso05u5.i}

   put stream ft  skip.
end. 
