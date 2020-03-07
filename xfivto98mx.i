/* xfivto98mx.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   {us/xf/xfput.i "'X'"             001   "x(01)"  }
   {us/xf/xfput.i "'PRE-TRAILER'"   002   "x(16)"  }
.

{us/xf/xfso10ux.i} /*BLANK TEMPLATE*/

put stream ft skip.

/*** TRAILER - RECORD TYPE "5" ***/
put stream ft
   {us/xf/xfputc.i   "'5'"                   001   1}                   /* type 5 */
   {us/xf/xfput.i    msg                     002   "x(60)"           }  /* message */
   {us/xf/xfput.i    invtot_nontaxable_amt   062   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    so_curr                 078   "x(03)"           }  /* currency */
   {us/xf/xfput.i    invtot_line_total       081   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    invtot_taxable_amt      097   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    invtot_tax_amt          113   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    year(tax_date)          129   "9999"            }  /* tax date */
   {us/xf/xfput.i    month(tax_date)         133   "99"              }
   {us/xf/xfput.i    day(tax_date)           135   "99"              }
   {us/xf/xfput.i    invtot_ord_amt          137   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    tot_prepaid_amt         153   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    user_desc[1]            169   "x(24)"           }  /* trl 1 desc */
   {us/xf/xfput.i    so_trl1_cd              193   "x(02)"           }  /* trl 1 code */
   {us/xf/xfput.i    invtot_trl1_amt         195   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    user_desc[2]            211   "x(24)"           }  /* trl 2 desc */
   {us/xf/xfput.i    so_trl2_cd              235   "x(02)"           }  /* trl 2 code */
   {us/xf/xfput.i    invtot_trl2_amt         237   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    user_desc[3]            253   "x(24)"           }  /* trl 3 desc */
   {us/xf/xfput.i    so_trl3_cd              277   "x(02)"           }  /* trl 3 code */
   {us/xf/xfput.i    invtot_trl3_amt         279   "->>>>>>>>>>>9.99"}
   {us/xf/xfput.i    invcrdt                 295   "x(15)"           }  /* literal */
.

put stream ft
   {us/xf/xfput.i "(if invtot_line_total <> 0 and l_consolidate ~
              then (ROUND(invtot_disc_amt / invtot_line_total * -100, 2)) ~
              else so_disc_pct)"       310   "->>9.99"         }
   {us/xf/xfput.i invtot_disc_amt            317   "->>>>>>>>>>>9.99"}
.

{us/bbi/gprun.i ""xftxtots.p"" "(
   input ""16"",
   input so_inv_nbr, /* tx2d_ref */
   input """",       /* tx2d_nbr */
   input 99999999,   /* tx2d_line */
   input so_trl1_cd,
   output tot_tax,
   output tot_ex_tax)"}
                          
put stream ft
   {us/xf/xfput.i tot_tax                    333   "->>>>>>>>>>>9.99"}  /* Trailer 1 Tax Amount */
   {us/xf/xfput.i "((tot_ex_tax + tot_tax))" 349   "->>>>>>>>>>>9.99"}  /* Trailer 1 Total inc  Tax */
   {us/xf/xfput.i tot_ex_tax                 365   "->>>>>>>>>>>9.99"}  /* Trailer 1 Total excl Tax */
.

{us/bbi/gprun.i ""xftxtots.p"" "(
   input ""16"",
   input so_inv_nbr, /* tx2d_ref */
   input """",       /* tx2d_nbr */
   input 99999999,   /* tx2d_line */
   input so_trl2_cd,
   output tot_tax,
   output tot_ex_tax)"}

put stream ft
   {us/xf/xfput.i tot_tax                    381   "->>>>>>>>>>>9.99"}  /* Trailer 2 Tax Amount */
   {us/xf/xfput.i "((tot_ex_tax + tot_tax))" 397   "->>>>>>>>>>>9.99"}  /* Trailer 2 Total inc  Tax */
   {us/xf/xfput.i tot_ex_tax                 413   "->>>>>>>>>>>9.99"}  /* Trailer 2 Total excl Tax */
.

{us/bbi/gprun.i ""xftxtots.p"" "(
   input ""16"",
   input so_inv_nbr, /* tx2d_ref */
   input """",       /* tx2d_nbr */
   input 99999999,   /* tx2d_line */
   input so_trl3_cd,
   output tot_tax,
   output tot_ex_tax)"}

put stream ft
   {us/xf/xfput.i tot_tax                    429   "->>>>>>>>>>>9.99"}  /* Trailer 3 Tax Amount */
   {us/xf/xfput.i "((tot_ex_tax + tot_tax))" 445   "->>>>>>>>>>>9.99"}  /* Trailer 3 Total inc  Tax */
   {us/xf/xfput.i tot_ex_tax                 461   "->>>>>>>>>>>9.99"}  /* Trailer 3 Total excl Tax */
.

{us/xf/xfso10u5.i}

put stream ft skip.
