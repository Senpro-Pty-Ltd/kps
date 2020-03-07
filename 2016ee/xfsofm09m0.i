/* xfsofm09m0.i FORMTRAP Shipper List Print              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */


put 
    "0"              at 1    format "x"  /* type  "0"  */
    company[1]       at 10   format "x(38)"  /* coy name   */
    company[2]       at 48   format "x(38)"  /* coy addr 1 */
    company[3]       at 86   format "x(38)"  /* coy addr 2 */
    company[4]       at 124  format "x(38)"  /* coy addr 3 */
    company_city     at 162  format "x(24)"  /* coy city   */
    company_state    at 186  format "x(4)"   /* coy state  */
    company_zip      at 190  format "x(10)"  /* coy pcode  */
    company[6]       at 200  format "x(38)"  /* coy country*/
    ""               at 238  format ">>9"    /* revision   */
    year(ship_date)  at 241  format "9999"   /* ship date  */
    month(ship_date) at 245  format "99"
    day(ship_date)   at 247  format "99"
    year(today)      at 249  format "9999"   /* print date */
    month(today)     at 253  format "99"
    day(today)       at 255  format "99"
    abs_order        at 257  format "x(8)"   /* s/o number */
    cust             at 265  format "x(8)"   /* bill to    */
    ""               at 273  format "x(8)"   /* sold to    */
    billto[1]        at 281  format "x(38)"  /* bill name  */
    billto[2]        at 319  format "x(38)"  /* bill addr 1*/
    billto[3]        at 357  format "x(38)"  /* bill addr 2*/
    billto[4]        at 395  format "x(38)"  /* bill addr 3*/
    billto_city      at 433  format "x(24)"  /* bill city  */
    billto_state     at 457  format "x(4)"   /* bill state */
    billto_zip       at 461  format "x(10)"  /* bill pcode */
    billto[6]        at 471  format "x(38)"  /* country    */
                                             /* ship date  */
                                             /* order date */
    " "              at 525  format "x(8)"   /* spare field*/
    ship             at 533  format "x(8)"   /* ship to    */
    ""               at 541  format "x(18)"  /* bill lading*/
    ""               at 559  format "x(8)"   /* sls person1*/
    ""               at 567  format "x(8)"   /* sls person2*/
    ""               at 575  format "x(8)"   /* sls person3*/
    ""               at 583  format "x(8)"   /* sls person4*/
    ""               at 591  format "x(8)"   /* credit term*/
    abs_shipvia      at 599  format "x(20)"  /* ship via   */
    shipper_id       at 619  format "x(20)"  /* shipper no */
    ""               at 639  format "x(4)"   /* spare field*/
    abs_fob          at 643  format "x(20)"  /* FOB        */
    abs_carr_ref     at 663  format "x(20)"  /* carrier    */
    abs_veh_ref      at 683  format "x(20)"  /* vehicle    */
    abn              at 703  format "x(16)"  /* Company ABN*/
    abs_trans_mode   at 719  format "x(20)"  /* transport  */
    ""               at 739  format "x(8)"   /* call no    */
    trim(rpt_type)   at 747  format "x(15)"  /* doc type   */ 
    ""               at 762  format "x(9)"   /* reprint    */
    billto_attn      at 771  format "x(24)"  /* bill attn  */
    billto_phn       at 795  format "x(16)"  /* bill phone */
    shipto_attn      at 811  format "x(24)"  /* ship attn  */
    shipto_phn       at 835  format "x(16)"  /* ship phone */
    shipper-po       at 851  format "x(22)"  /* Cust P.O.  */
    shipto_fax       at 873  format "x(16)"  /* ship pcode */
    .

if trim(rpt_type) = "S H I P P E R" then do :
   for first debtor no-lock where debtor.debtorcode = so_cust :
     {us/xf/xfemail.i debtor.BusinessRelation_id "FT-SHIPPER" }
   end.
end.
else do :
   for first debtor no-lock where debtor.debtorcode = so_cust :
     {us/xf/xfemail.i debtor.BusinessRelation_id "FT-PACKLIST" }
   end.
end.


{us/so/sofs9pu0.i}

put skip.

/* Optional first page header record type "1" */
put
   "1"         at 1    format "x"  /* type "1"   */
   .

{us/so/sofs9pu1.i}

put skip.

/* Sold-to Ship-to address - record type "2" */
put 
    "2"         at 1    format "x"  /* type "2"   */
    soldto[1]       at 2    format "x(38)"  /* cust name  */
    soldto[2]       at 40   format "x(38)"  /* cust addr 1*/
    soldto[3]       at 78   format "x(38)"  /* cust addr 2*/
    soldto[4]       at 116  format "x(38)"  /* cust addr 3*/
    soldto_city     at 154  format "x(24)"  /* cust city  */
    soldto_state    at 178  format "x(4)"   /* cust state */
    soldto_zip      at 182  format "x(10)"  /* cust pcode */
    soldto[6]       at 192  format "x(38)"  /* country    */
    shipto[1]       at 230  format "x(38)"  /* ship name  */
    shipto[2]       at 268  format "x(38)"  /* ship addr 1*/
    shipto[3]       at 306  format "x(38)"  /* ship addr 2*/
    shipto[4]       at 344  format "x(38)"  /* ship addr 3*/
    shipto_city     at 382  format "x(24)"  /* ship city  */
    shipto_state    at 406  format "x(4)"   /* ship state */
    shipto_zip      at 410  format "x(10)"  /* ship pcode */
    shipto[6]       at 420  format "x(38)"  /* country    */
    .

{us/so/sofs9pu2.i}

put skip.

/* Optional first page header spacer - record type "Y" */
put
   "Y"         at 1    format "x"  /* type "Y"   */
   .

{us/so/sofs9puy.i}

put skip.
