/* xfrvrpm0.i - PURCHASE ORDER RETURN PRINT USER CODE RECORD TYPE "0"         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: QAD2014    BY: Amol Dudvadkar   DATE: 03/16/15 ECO: *grc338*     */
/*V8:ConvertMode=Report                                                       */

 put stream ft
   "0"                  at 1    format "x(1)"   /* Record type 0 */
   prh_nbr              at 2    format "x(8)"   /* Purchase order number*/
   billto[1]            at 10   format "x(38)"  /* Bill to name */
   billto[2]            at 48   format "x(38)"  /* Bill to address line 1 */
   billto[3]            at 86   format "x(38)"  /* Bill to address line 2 */
   billto[4]            at 124  format "x(38)"  /* Bill to address line 3 */
   billto_city          at 162  format "x(24)"  /* Bill to city */
   billto_state         at 186  format "x(4)"   /* Bill to state */
   billto_zip           at 190  format "x(10)"  /* Bill to zip code */
   billto[6]            at 200  format "x(38)"  /* Bill to country */
   prh_receiver         at 238  format "x(8)"   /* Return Number */
   year(prh_rcp_date)   at 246  format "9999"   /* Return Date year */
   month(prh_rcp_date)  at 250  format "99"     /* Return Date month */
   day(prh_rcp_date)    at 252  format "99"     /* Return Date Day  */
   year(today)          at 254  format "9999"   /* Print Date year */
   month(today)         at 258  format "99"     /* Print Date month */
   day(today)           at 260  format "99"     /* Print Date Day  */
   duplicate            at 262  format "x(11)"  /* Duplicate message */
   prh_vend             at 273  format "x(8)"   /* Supplier code */
   received_at_site     at 281  format "x(8)"   /* Ship to code */
   vendor[1]            at 289  format "x(38)"  /* Vendor name */
   vendor[2]            at 327  format "x(38)"  /* Vendor address line 1 */
   vendor[3]            at 365  format "x(38)"  /* Vendor address line 2 */
   vendor[4]            at 403  format "x(38)"  /* Vendor address line 3 */
   vendor_city          at 441  format "x(24)"  /* Vendor City */
   vendor_state         at 465  format "x(4)"   /* Vendor State */
   vendor_zip           at 469  format "x(10)"  /* Vendor Zip Code */
   vendor[6]            at 479  format "x(38)"  /* Vendor country */
   vendor_attn          at 517  format "x(24)"  /* Vendor attention */
   cr_terms             at 541  format "x(8)"   /* Credit Terms code */
   shipvia              at 549  format "x(20)"  /* Ship Via */
/*grc338*  terms        at 569  format "x(24)"  /* Credit Terms description */ */
/*grc338*/ termsdesc    at 569  format "x(24)"  /* Credit Terms description */
   fob                  at 593  format "x(20)"  /* FOB */
   rmks                 at 613  format "x(40)"  /* Remarks */
   pvo_last_voucher     at 653  format "x(22)"  /* Voucher */  /*08*/
   "RETURN TO SUPPLIER" at 675  format "x(20)"  /* doc type */
   "  "                 at 695  format "x(2)"   /* spare field */
   vend_phone           at 697  format "x(16)"  /* Vendor Phone Number */
   prh_buyer            at 713  format "x(8)"   /* Buyer code */
   contact              at 721  format "x(24)"  /* Contact */
   fill(" ",16)         at 745  format "x(16)"  /* spare field */
   vendor_fax           at 761  format "x(20)"  /* fax */      /*16*/
.

find qad_wkfl
   where qad_domain = global_domain
     and qad_key1 = "ft_email"
     and qad_key2 = prh_vend
no-lock no-error.
if available qad_wkfl then
   put stream ft
      qad_charfld[1] at 781 format "x(40)"
   .

{us/xf/xfpo03u0.i}

for first creditor no-lock where creditor.creditorcode = po_vend :
  {us/xf/xfemail.i creditor.BusinessRelation_id "FT-PORTN" "" "stream ft" }
end.


put stream ft  skip.

/* Optional first page header record type "1" */
put stream ft
   "1"         at 1    format "x"  /* type "1"   */
.

{us/xf/xfpo03u1.i}
put stream ft  skip.

/* Sold-to Ship-to address - record type "2" */
put stream ft
   "2"            at 1    format "x"      /* type "2"   */
   shipto[1]      at 2    format "x(38)"  /* ship name  */
   shipto[2]      at 40   format "x(38)"  /* ship addr 1*/
   shipto[3]      at 78   format "x(38)"  /* ship addr 2*/
   shipto[4]      at 116  format "x(38)"  /* ship addr 3*/
   shipto_city    at 154  format "x(24)"  /* ship city  */
   shipto_state   at 178  format "x(4)"   /* ship state */
   shipto_zip     at 182  format "x(10)"  /* ship pcode */
   shipto[6]      at 192  format "x(38)"  /* country    */
.

{us/xf/xfpo03u2.i}
put stream ft  skip.

/* Optional first page header spacer - record type "Y" */
put stream ft
   "Y"         at 1    format "x"  /* type "Y"   */
.

{us/xf/xfpo03uy.i}
put stream ft  skip.

{us/xf/xfcmtprt.i &type=RV &rectype=A &id=po_cmtindx}
