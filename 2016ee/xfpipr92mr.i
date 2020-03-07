/* xfpipr92mr.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   {us/xf/xfputc.i   "'R'"                                        01 1                    }  /*Record Type*/
   {us/xf/xfput.i    disc_desc                                    02 "x(24)"              }  /*Description*/
   {us/xf/xfput.i    amt_type                                     26 "x(08)"              }  /*Amount Type*/
   {us/xf/xfput.i    "(if disc_sum_key = '3' then '$' else '')"   34 "x(01)"              }  /* $ symbol */
   {us/xf/xfput.i    prnt_sum_disc_amt                            35 "->>>>>>>>>>9.99999" }  /*Amount*/
   {us/xf/xfput.i    "(if disc_sum_key = '2' then '%' else "''")" 53 "x(01)"              }  /* % symbol */
   {us/xf/xfput.i    disc_prnt_label                              54 "x(08)"              }  /*Amount label*/
.
{{&usercode}}

{us/xf/xfsolur.i}

put stream ft skip.
