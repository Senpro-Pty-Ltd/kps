/* xfporp03m0.i - FORMTRAP INCLUDE FILE PO PRINT                              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: QAD2014    BY: Amol Dudvadkar   DATE: 03/16/15   ECO: *grc338*   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   "0"                  at 001   format   "x(01)"  /* Record type 0 */
   po_nbr               at 002   format   "x(08)"  /* Purchase order number*/
   billto[1]            at 010   format   "x(38)"  /* Bill to name */
   billto[2]            at 048   format   "x(38)"  /* Bill to address line 1 */
   billto[3]            at 086   format   "x(38)"  /* Bill to address line 2 */
   billto[4]            at 124   format   "x(38)"  /* Bill to address line 3 */
   billto_city          at 162   format   "x(24)"  /* Bill to city */
   billto_state         at 186   format   "x(04)"  /* Bill to state */
   billto_zip           at 190   format   "x(10)"  /* Bill to zip code */
   billto[6]            at 200   format   "x(38)"  /* Bill to country */
   po_rev               at 238   format   ">>9"    /* Revision */
   year(po_ord_date)    at 241   format   "9999"   /* Due Date year */
   month(po_ord_date)   at 245   format   "99"     /* Due Date month */
   day(po_ord_date)     at 247   format   "99"     /* Due Date Day  */
   year(today)          at 249   format   "9999"   /* Print Date year */
   month(today)         at 253   format   "99"     /* Print Date month */
   day(today)           at 255   format   "99"     /* Print Date Day  */
   duplicate            at 257   format   "x(11)"  /* Duplicate message */
   po_vend              at 268   format   "x(08)"  /* Supplier code */
   poship               at 276   format   "x(08)"  /* Ship to code */
   vendor[1]            at 284   format   "x(38)"  /* Vendor name */
   vendor[2]            at 322   format   "x(38)"  /* Vendor address line 1 */
   vendor[3]            at 360   format   "x(38)"  /* Vendor address line 2 */
   vendor[4]            at 398   format   "x(38)"  /* Vendor address line 3 */
   vendor_city          at 436   format   "x(24)"  /* Vendor City */
   vendor_state         at 460   format   "x(04)"  /* Vendor State */
   vendor_zip           at 464   format   "x(10)"  /* Vendor Zip Code */
   vendor[6]            at 474   format   "x(38)"  /* Vendor country */
   vdattn               at 512   format   "x(24)"  /* Vendor attention */
   po_cr_terms          at 591   format   "x(08)"  /* Credit Terms code */
   po_shipvia           at 599   format   "x(20)"  /* Ship Via */
/*grc338* terms         at 619   format   "x(24)"  /* Credit Terms description */ */
/*grc338*/ termsdesc    at 619   format   "x(24)"  /* Credit Terms description */
   po_fob               at 643   format   "x(20)"  /* FOB */
   po_rmks              at 663   format   "x(40)"  /* Remarks */
   vatreg               at 703   format   "x(16)"  /* Bill To ABN */
   "PURCHASE ORDER"     at 747   format   "x(15)"  /* doc type */
   po_confirm           at 764   format   "yes/no" /* Confirming <yes/no> */
   vend_phone           at 767   format   "x(20)"  /* Vendor Phone Number */
   po_buyer             at 787   format   "x(08)"  /* Buyer code */
   po_contact           at 795   format   "x(24)"  /* Contact */
   vendor_phone         at 819   format   "x(20)"  /* Vendor Phone */
   vendor_fax           at 839   format   "x(20)"  /* Vendor Fax */
.

for first qad_wkfl no-lock
   where qad_domain = global_domain
     and qad_key1   = "ft_email"
     and qad_key2   = po_vend :
   put stream ft
      qad_charfld[1]    at 859   format   "x(40)"
   .
end. /*for first qad_wkfl*/

{us/xf/xfpo03u0.i}

for first creditor no-lock where creditor.creditorcode = po_vend :
  {us/xf/xfemail.i creditor.BusinessRelation_id "FT-PO" "" "stream ft"}
end.


put stream ft skip.

/* Optional first page header record type "1" */
put stream ft
   "1"                  at 001   format   "x(01)"  /* type "1"   */
.

{us/xf/xfpo03u1.i}

put stream ft skip.

update shipto = "".
for first ad_mstr no-lock
   where ad_domain = global_domain
     and ad_addr = po_ship :
   assign
      shipto[1]    = ad_name
      shipto[2]    = ad_line1
      shipto[3]    = ad_line2
      shipto[4]    = ad_line3
      shipto[5]    = ""
      shipto[6]    = ad_country
      shipto_city  = ad_city
      shipto_state = ad_state
      shipto_zip   = ad_zip.
end. /*for first ad_mstr*/

/* Sold-to Ship-to address - record type "2" */
put stream ft
   "2"            at 001   format   "x(01)"  /* type "2"   */
   shipto[1]      at 002   format   "x(38)"  /* ship name  */
   shipto[2]      at 040   format   "x(38)"  /* ship addr 1*/
   shipto[3]      at 078   format   "x(38)"  /* ship addr 2*/
   shipto[4]      at 116   format   "x(38)"  /* ship addr 3*/
   shipto_city    at 154   format   "x(24)"  /* ship city  */
   shipto_state   at 178   format   "x(04)"  /* ship state */
   shipto_zip     at 182   format   "x(10)"  /* ship pcode */
   shipto[6]      at 192   format   "x(38)"  /* country    */
.

{us/xf/xfpo03u2.i}

put stream ft skip.

/*** Optional first page header spacer - record type "Y" ***/
put stream ft
   "Y"         at 1    format "x"  /* type "Y"   */
.

{us/xf/xfpo03uy.i}

put stream ft skip.

{us/xf/xfcmtprt.i &type=PO &rectype=A &id=po_cmtindx}
