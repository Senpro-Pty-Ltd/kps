/* xfqp09m0.i - SALES QUOTE PRINT USER CODE RECORD TYPE "0"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/18/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "0"                  at 1     format "x(1)"  /* Record type 0 */
   company[1]           at 2     format "x(38)" /* Company */
   company[2]           at 40    format "x(38)" /* Company */
   company[3]           at 78    format "x(38)" /* Company */
   company[4]           at 116   format "x(38)" /* Company */
   company[5]           at 154   format "x(38)" /* Company */
   company[6]           at 192   format "x(38)" /* Company */
   qo_nbr               at 230   format "x(8)"  /* Nbr */
   qo_rev               at 238   format ">>9"   /* Revision */
   year(qo_ord_date)    at 241   format "9999"  /* Due Date year */
   month(qo_ord_date)   at 245   format "99"    /* Due Date month */
   day(qo_ord_date)     at 247   format "99"    /* Due Date Day  */
   year(today)          at 249   format "9999"  /* Due Date year */
   month(today)         at 253   format "99"    /* Due Date month */
   day(today)           at 255   format "99"    /* Due Date Day */
   year(qo_exp_date)    at 259   format "9999"  /* Due Date year */
   month(qo_exp_date)   at 263   format "99"    /* Due Date month */
   day(qo_exp_date)     at 265   format "99"    /* Due Date Day  */
   qo_cust              at 273   format "x(8)"  /* Sold To       */
   billto[1]            at 281   format "x(38)" /*Billto Name */
   billto[2]            at 319   format "x(38)" /*Billto Addr1*/
   billto[3]            at 357   format "x(38)" /*Billto Addr2*/
   billto[4]            at 395   format "x(38)" /*Billto Addr3*/
   billto_city          at 433   format "x(24)" /*Billto City */
   billto_state         at 457   format "x(4)"  /*Billto State*/
   billto_zip           at 461   format "x(10)" /*Billto Zip  */
   billto[6]            at 471   format "x(38)" /*Billto C    */
   qo_ship              at 509   format "x(8)"  /* Ship To       */
   shipto[1]            at 517   format "x(38)" /*Shipto Name */
   shipto[2]            at 555   format "x(38)" /*Shipto Addr1*/
   shipto[3]            at 593   format "x(38)" /*Shipto Addr2*/
   shipto[4]            at 631   format "x(38)" /*Shipto Addr3*/
   shipto_city          at 669   format "x(24)" /*Shipto City */
   shipto_state         at 693   format "x(4)"  /*Shipto State*/
   shipto_zip           at 697   format "x(10)" /*Shipto Zip  */
   "SALES QUOTE"        at 747   format "x(15)" /*Document Identifier */
   shipto[6]            at 762   format "x(38)" /*Shipto C    */
   billto_fax           at 800   format "x(16)" /*Billto Fax */
.

find qad_wkfl
   where qad_domain = global_domain
     and qad_key1 = "ft_email"
     and qad_key2 = qo_cust
no-lock no-error.
if available qad_wkfl then
   put stream ft
      qad_charfld[1] at 761 format "x(40)"
   .

for first debtor no-lock where debtor.debtorcode = qo_cust  :
  {us/xf/xfemail.i debtor.BusinessRelation_id "FT-QUOTE" "" "stream ft" }
end.

{us/xf/xfqo10u0.i}

put stream ft
   "1"                 at 1    format "x"      /* type "1"   */
   billattn            at 2    format "x(24)"  /* Contact  */
   billphn             at 26   format "x(16)"  /* Phone  */
   shipattn            at 42   format "x(24)"  /* Contact  */
   shipphn             at 66   format "x(16)"  /* Phone  */
   qo_slspsn[1]        at 82   format "x(8)"   /* Sales Person  */
   qo_slspsn[2]        at 90   format "x(8)"   /* Sales Person  */
   qo_slspsn[3]        at 98   format "x(8)"   /* Sales Person  */
   qo_slspsn[4]        at 106  format "x(8)"   /* Sales Person  */
   qo_po               at 114  format "x(20)"  /* PO  */
   qo_cr_terms         at 134  format "x(8)"   /* Cr Terms  */
   termsdesc           at 142  format "x(24)"  /* Terms Desc */
   qo_shipvia          at 166  format "x(20)"  /* Ship Via  */
   qo_fob              at 186  format "x(20)"  /* FOB  */
   resale              at 206  format "x(20)"  /* Resale  */
   qo_rmks             at 226  format "x(40)"  /* Remarks  */
.

{us/xf/xfqo10u1.i}

{us/xf/xfcmtprt.i &type=QO &id=qo_cmtindx &rectype=A}
