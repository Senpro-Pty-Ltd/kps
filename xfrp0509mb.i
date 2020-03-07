/* xfrpso0509mb.i STREAM DATA RECORD TYPE "B"                                 */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

v_tax_tr_type = (if so_fsm_type = "RMA"
                       then "36"
                       else if so_fsm_type = "FSM-RO"
                       then "38"
                       else "11").
{us/bbi/gprun.i ""xftxtots.p"" "(
   input v_tax_tr_type,
   input so_nbr,        /* tx2d_ref */
   input """",          /* tx2d_nbr */
   input sod_line,
   input """",          /* tx2d_trl */
   output tot_tax,
   output tot_ex_tax)"}

if desc2 <> ""
then do:
   put stream ft
      "B"            at 1    format "x(1)"      /*Record Type*/
      sod_line       at 2    format ">>9"       /*Line Number*/
      sod_part       at 5    format "x(18)"     /*Item Number*/
      sod_taxable    at 23   format "yes/no"    /*Taxable flag*/
      year(sod_due_date) at 26   format "9999"      /*Due Date - Year*/
      month(sod_due_date) at 30   format "99"        /*Due Date - Month*/
      day(sod_due_date) at 32   format "99"        /*Due Date - Day*/
      qty_open       at 34   format "->>>>>>>>9.999999999" /*Qty Open*/
      sod_um         at 74   format "x(2)"      /*UM*/
      net_price      at 76   format ">>>>>>>>>9.99999" /*Price*/
      ext_price      at 92   format "->>>>>>>>9.99999" /*Ext Amount*/
      sod_site       at 108  format "x(8)"      /*Site*/
      sod_custpart   at 116  format "x(30)"     /*Customer Item No*/
      desc1          at 146  format "x(24)"     /*Item Desc1*/
      desc2          at 170  format "x(24)"     /*Item Desc2*/
      sod_disc_pct   at 194  format "->>9.99"   /* disc % */
      sod_list_pr    at 201  format "->>>>>>>>9.99999" /* list price */
      sod_pr_list    at 217  format "x(8)"      /* price list */
      tot_tax        at 225  format "->>>>>>>>>>>9.99" /* Tax Amount */
      (tot_ex_tax + tot_tax) at 241  format "->>>>>>>>>>>9.99" /* Line Total incl Tax */
      tot_ex_tax     at 257  format "->>>>>>>>>>>9.99" /* Line Total excl Tax */
      year(sod_promise_date) at 274 format "9999"
      month(sod_promise_date) at 278 format "99"
      day(sod_promise_date) at 280 format "99"
   .

   {us/xf/xfso05ub.i}

   put stream ft skip.
end.
else do:
   put stream ft
      "E"            at 1    format "x(1)"      /*Record Type*/
      sod_line       at 2    format ">>9"       /*Line Number*/
      sod_part       at 5    format "x(18)"     /*Item Number*/
      sod_taxable    at 23   format "yes/no"    /*Taxable flag*/
      year(sod_due_date) at 26   format "9999"      /*Due Date - Year*/
      month(sod_due_date) at 30   format "99"        /*Due Date - Month*/
      day(sod_due_date) at 32   format "99"        /*Due Date - Day*/
      qty_open       at 34   format "->>>>>>>>9.999999999" /*Qty Open*/
      sod_um         at 74   format "x(2)"      /*UM*/
      net_price      at 76   format ">>>>>>>>>9.99999" /*Price*/
      ext_price      at 92   format "->>>>>>>>9.99999" /*Ext Amount*/
      sod_site       at 108  format "x(8)"      /*Site*/
      sod_custpart   at 116  format "x(30)"     /*Customer Item No*/
      desc1          at 146  format "x(24)"     /*Item Desc1*/
      sod_disc_pct   at 194  format "->>9.99"   /* disc % */
      sod_list_pr    at 201  format "->>>>>>>>9.99999" /* list price */
      sod_pr_list    at 217  format "x(8)"      /* price list */
      tot_tax        at 225  format "->>>>>>>>>>>9.99" /* Tax Amount */
      (tot_ex_tax + tot_tax) at 241  format "->>>>>>>>>>>9.99" /* Line Total incl Tax */
      tot_ex_tax     at 257  format "->>>>>>>>>>>9.99" /* Line Total excl Tax */
      year(sod_promise_date) at 274 format "9999"
      month(sod_promise_date) at 278 format "99"
      day(sod_promise_date) at 280 format "99"
   .

   {us/xf/xfso05ue.i}

   put stream ft skip.
end.
