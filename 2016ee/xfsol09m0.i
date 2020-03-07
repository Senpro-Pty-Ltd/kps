/* xfsol09m0.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE                 */

/*100430>> If break_order is no we only want record 0 being output if it is*/
/*         a new Picklist                                                   */
if old_pack_nbr <> pack_nbr 
or break_order = yes then do:
/*100430<<*/

 put stream ft      "0"             at 1    format "x(1)"   /* Record Type */
                 soship          at 2    format "x(8)"   /* Ship To Code */
                 shipto[1]       at 10   format "x(38)"  /* Ship To Addr[1] */
                 shipto[2]       at 48   format "x(38)"  /* Ship To Addr[2] */
                 pre_shipid      at 86   format "x(20)"  /* Preshipper id */
                 shipto[3]       at 106  format "x(38)"  /* Ship To Addr[3] */
                 shipto[4]       at 144  format "x(38)"  /* Ship To Addr[4] */
                 year(today)     at 182  format "9999"   /*Print Date - Year*/
                 month(today)    at 186  format "99"     /*Print Date - Month*/
                 day(today)      at 188  format "99"     /*Print Date - Day*/
                 shipto_city     at 190  format "x(24)"  /*Shipto City*/
                 shipto_state    at 214  format "x(4)"   /*Shipto State*/
                 shipto_zip      at 218  format "x(10)"  /*Shipto Zip*/
                 shipto[6]       at 228  format "x(38)"  /* Ship To Addr[6] */
                 shipattn        at 266  format "x(24)"  /*Shipto Attention*/
                 shipphn         at 290  format "x(16)"  /*Shipto Phone*/
                 so_bill         at 306  format "x(8)"   /*Bill to code*/
                 billto[1]       at 314  format "x(38)"  /*Bill to Addr[1]*/
                 billto[2]       at 352  format "x(38)"  /*Bill to Addr[2]*/
                 billto[3]       at 390  format "x(38)"  /*Bill to Addr[3]*/
                 billto[4]       at 428  format "x(38)"  /*Bill to Addr[4]*/
                 billto_city     at 466  format "x(24)"  /*Bill to city*/
                 billto_state    at 490  format "x(4)"   /*Bill to state*/
                 billto_zip      at 494  format "x(10)"  /*Bill to zip*/
                 so_shipvia      at 504  format "x(20)"  /*Ship Via*/
                 so_bol          at 524  format "x(18)"  /*Bol*/
                 so_fob          at 542  format "x(20)"  /*FOB Point*/
                 so_rmks         at 562  format "x(40)"  /*Remarks*/
                 so_cust         at 602  format "x(8)"   /*Sold to Code*/
                 pack_nbr        at 610  format "x(20)"  /*Preshipper Number*/
                 billto_fax      at 630  format 'x(16)'  /*Fax number*/
                 .
 
        for first b_qad_wkfl where b_qad_wkfl.qad_domain = global_domain
	                       and b_qad_wkfl.qad_key1 = "ft_email" 
                               and b_qad_wkfl.qad_key2 = soship no-lock:
            put stream ft  b_qad_wkfl.qad_charfld[1] at 646 format "x(40)". /* email */
        end.

        put stream ft  "PACKING LIST"  at 747  format "x(15)".  /*Document Type*/
        for first debtor no-lock where debtor.debtorcode = so_ship :
           {us/xf/xfemail.i debtor.BusinessRelation_id "FT-PACKLIST" "" "stream ft" }
        end.


         {us/xf/xfsolu0.i}
 
         put stream ft  skip.

         put stream ft  "1" at 1    format "x(1)"   /*Optional Header Type Record */
             .

         {us/xf/xfsolu1.i}

         put stream ft  skip.

end. /*if old_pack_nbr <> pack_nbr */

