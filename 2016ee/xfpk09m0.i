/* xfpk09m0.i - FORMTRAP INCLUDE FILE SO PICKLIST PRINT                       */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/16/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "0"           at 1   format "x(1)"  /*Record Type*/
   so_inv_nbr    at 2   format "x(22)"  /*Invoice Number*/
   company[1]    at 24  format "x(38)" /*Company Addr[1]*/
   company[2]    at 62  format "x(38)" /*Company Addr[2]*/
   company[3]    at 100  format "x(38)" /*Company Addr[3]*/
   company[4]    at 138 format "x(38)" /*Company Addr[4]*/
   company_city  at 176 format "x(24)" /*Company City*/
   company_state at 200 format "x(4)"  /*Company State*/
   company_zip   at 204 format "x(10)" /*Company Zip*/
   company[6]    at 214 format "x(38)" /*Company Addr[6]*/
   so_rev        at 252 format ">>9"   /*Revision*/
   year(today)   at 263 format "9999"  /*Print Date - Year*/
   month(today)  at 267 format "99"    /*Print Date - Month*/
   day(today)    at 269 format "99"    /*Print Date - Day*/
   so_nbr        at 271 format "x(8)"  /*Sales Order */
   so_bill       at 279 format "x(8)"  /*Bill to code*/
   so_cust       at 287 format "x(8)"  /*Sold to code*/
   billto[1]     at 295 format "x(38)" /*Billto Addr[1]*/
   billto[2]     at 333 format "x(38)" /*Billto Addr[2]*/
   billto[3]     at 371 format "x(38)" /*Billto Addr[3]*/
   billto[4]     at 409 format "x(38)" /*Billto Addr[4]*/
   billto_city   at 447 format "x(24)" /*Billto City*/
   billto_state  at 471 format "x(4)"  /*Billto State*/
   billto_zip    at 475 format "x(10)" /*Billto Zip*/
   billto[6]     at 485 format "x(38)" /*Billto Addr[6]*/
   year(so_ord_date) at 531 format "9999"  /*Order Date - Year*/
   month(so_ord_date) at 535 format "99"    /*Order Date - Month*/
   day(so_ord_date) at 537 format "99"    /*Order Date - Day*/
   so_ship       at 547 format "x(8)"  /*Ship to Code*/
   so_bol        at 555 format "x(18)" /*Bill of Lading*/
   so_slspsn[1]  at 573 format "x(8)"  /*Salesperson1 code*/
   so_slspsn[2]  at 581 format "x(8)"  /*Salesperson2 code*/
   so_slspsn[3]  at 589 format "x(8)"  /*Salesperson3 code*/
   so_slspsn[4]  at 597 format "x(8)"  /*Salesperson4 code*/
   so_cr_terms   at 605 format "x(8)"  /*Credit Terms code*/
   so_shipvia    at 613 format "x(20)" /*Ship Via*/
   termsdesc     at 633 format "x(24)" /*Terms Description*/
   so_fob        at 657 format "x(20)" /*FOB*/
   so_rmks       at 677 format "x(40)" /*Remarks*/
   abn           at 717 format "x(16)" /*Company ABN */
   "PICKING SLIP" at 761 format "x(15)" /*Doc Type    */
   billattn      at 785 format "x(24)" /*Billto Attention*/
   billphn       at 809 format "x(16)" /*Billto Phone*/
   shipattn      at 825 format "x(24)" /*Shipto Attention*/
   shipphn       at 849 format "x(16)" /*Shipto Phone*/
   so_po         at 865 format "x(22)" /* Cust P.O. # */
   shipto_fax    at 887 format "x(20)" /*Sold to Fax*/
.


for first debtor no-lock where debtor.debtorcode = so_cust :
  {us/xf/xfemail.i debtor.BusinessRelation_id "FT-PACKLIST" "" "stream ft" }
end.


{us/xf/xfsopku0.i}
{us/xf/xfsopku1.i}

put stream ft skip.

put stream ft
   "2"           at 1   format "x(1)"  /*Record Type*/
   soldto[1]     at 2   format "x(38)" /*Sold to name*/
   soldto[2]     at 40  format "x(38)" /*Soldto addr1*/
   soldto[3]     at 78  format "x(38)" /*Soldto addr2*/
   soldto[4]     at 116 format "x(38)" /*Soldto addr3*/
   soldto_city   at 154 format "x(24)" /*Sold to City*/
   soldto_state  at 178 format "x(4)"  /*Sold to State*/
   soldto_zip    at 182 format "x(10)" /*Sold to Zip*/
   soldto[6]     at 192 format "x(38)" /*Sold to Country*/
   shipto[1]     at 230 format "x(38)" /*Shipto name*/
   shipto[2]     at 268 format "x(38)" /*Shipto addr1*/
   shipto[3]     at 306 format "x(38)" /*Shipto addr2*/
   shipto[4]     at 344 format "x(38)" /*Shipto addr3*/
   shipto_city   at 382 format "x(24)" /*Shipto City*/
   shipto_state  at 406 format "x(4)"  /*Shipto State*/
   shipto_zip    at 410 format "x(10)" /*Shipto Zip*/
   shipto[6]     at 420 format "x(38)" /*Shipto Country*/
.

{us/xf/xfsopku2.i}
put stream ft skip.

put stream ft
   "Y"  at 1   format "x(1)"  /*Record Type*/
.

{us/xf/xfsopkuy.i}

put stream ft skip.
