/* xfiv1009m0.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong     DATE: 11/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

/*** HEADER RECORD TYPE "0" ***/
put stream ft
   {us/xf/xfput.i "'0'"                001   "x(01)"  }  /* type  "0"  */
   {us/xf/xfput.i ih_inv_nbr           002   "x(22)"  }  /* invoice no */ /*08*/
   {us/xf/xfput.i company[1]           024   "x(38)"  }  /* coy name   */
   {us/xf/xfput.i company[2]           062   "x(38)"  }  /* coy addr 1 */
   {us/xf/xfput.i company[3]           100   "x(38)"  }  /* coy addr 2 */
   {us/xf/xfput.i company[4]           138   "x(38)"  }  /* coy addr 3 */
   {us/xf/xfput.i company_city         176   "x(24)"  }  /* coy city   */
   {us/xf/xfput.i company_state        200   "x(04)"  }  /* coy state  */
   {us/xf/xfput.i company_zip          204   "x(10)"  }  /* coy pcode  */
   {us/xf/xfput.i company[6]           214   "x(38)"  }  /* coy country*/
   {us/xf/xfput.i ih_rev               252   ">>9"    }  /* revision   */
   {us/xf/xfput.i year(ih_inv_date)    255   "9999"   }  /* inv date   */
   {us/xf/xfput.i month(ih_inv_date)   259   "99"     }
   {us/xf/xfput.i day(ih_inv_date)     261   "99"     }
   {us/xf/xfput.i year(today)          263   "9999"   }  /* print date */
   {us/xf/xfput.i month(today)         267   "99"     }
   {us/xf/xfput.i day(today)           269   "99"     }
   {us/xf/xfput.i ih_nbr               271   "x(08)"  }  /* s/o number */
   {us/xf/xfput.i ih_bill              279   "x(08)"  }  /* bill to    */
   {us/xf/xfput.i ih_cust              287   "x(08)"  }  /* sold to    */
   {us/xf/xfput.i billto[1]            295   "x(38)"  }  /* bill name  */
   {us/xf/xfput.i billto[2]            333   "x(38)"  }  /* bill addr 1*/
   {us/xf/xfput.i billto[3]            371   "x(38)"  }  /* bill addr 2*/
   {us/xf/xfput.i billto[4]            409   "x(38)"  }  /* bill addr 3*/
   {us/xf/xfput.i billto_city          447   "x(24)"  }  /* bill city  */
   {us/xf/xfput.i billto_state         471   "x(04)"  }  /* bill state */
   {us/xf/xfput.i billto_zip           475   "x(10)"  }  /* bill pcode */
   {us/xf/xfput.i billto[6]            485   "x(38)"  }  /* country    */
   {us/xf/xfput.i year(ih_ship_date)   523   "9999"   }  /* ship date  */
   {us/xf/xfput.i month(ih_ship_date)  527   "99"     }
   {us/xf/xfput.i day(ih_ship_date)    529   "99"     }
   {us/xf/xfput.i year(ih_ord_date)    531   "9999"   }  /* order date */
   {us/xf/xfput.i month(ih_ord_date)   535   "99"     }
   {us/xf/xfput.i day(ih_ord_date)     537   "99"     }
   {us/xf/xfput.i "' '"                539   "x(08)"  }  /* spare field*/
   {us/xf/xfput.i ih_ship              547   "x(08)"  }  /* ship to    */
   {us/xf/xfput.i ih_bol               555   "x(18)"  }  /* bill lading*/
   {us/xf/xfput.i ih_slspsn[1]         573   "x(08)"  }  /* sls person1*/
   {us/xf/xfput.i ih_slspsn[2]         581   "x(08)"  }  /* sls person2*/
   {us/xf/xfput.i ih_slspsn[3]         589   "x(08)"  }  /* sls person3*/
   {us/xf/xfput.i ih_slspsn[4]         597   "x(08)"  }  /* sls person4*/
   {us/xf/xfput.i ih_cr_terms          605   "x(08)"  }  /* credit term*/
   {us/xf/xfput.i ih_shipvia           613   "x(20)"  }  /* ship via   */
   {us/xf/xfput.i termsdesc            633   "x(24)"  }  /* terms desc */
   {us/xf/xfput.i ih_fob               657   "x(20)"  }  /* FOB        */
   {us/xf/xfput.i ih_rmks              677   "x(40)"  }  /* remarks    */
   {us/xf/xfput.i covatreg             717   "x(16)"  }  /* VAT Reg no */
   {us/xf/xfput.i resale               733   "x(20)"  }  /* resale     */
   {us/xf/xfput.i ih_ca_nbr            753   "x(08)"  }  /* call no    */
   {us/xf/xfput.i invcrdt              761   "x(15)"  }  /* inv/credit */
   {us/xf/xfput.i "'*REPRINT'"         776   "x(09)"  }  /* reprint    */
   /*
   {us/xf/xfput.i "'        '"         776   "x(09)"  }  /* reprint    */
   */
   {us/xf/xfput.i billto_attn          785   "x(24)"  }  /* bill attn  */
   {us/xf/xfput.i billto_phn           809   "x(16)"  }  /* bill phone */
   {us/xf/xfput.i shipto_attn          825   "x(24)"  }  /* ship attn  */
   {us/xf/xfput.i shipto_phn           849   "x(16)"  }  /* ship phone */
   {us/xf/xfput.i ih_po                865   "x(22)"  }  /* Cust P.O.  */
   {us/xf/xfput.i billto_fax           887   "x(20)"  }  /* Billto Fax */ /*16*/
.

find qad_wkfl no-lock
   where qad_domain = global_domain
     and qad_key1   = "ft_email"
     and qad_key2   = ih_bill
no-error.
if available qad_wkfl then
   put stream ft qad_charfld[1] at 907 format "x(40)". 

/*debug*
for first debtor no-lock where debtor.debtorcode = ih_bill :
  {us/xf/xfemail.i debtor.BusinessRelation_id "FT-Invoice" "" "stream ft"}
end.
*debug*/

{us/xf/xfiv10u0.i} /*BLANK TEMPLATE*/

put stream ft skip.

/* Optional first page header record type "1" */
put stream ft      
   {us/xf/xfput.i "'1'"                001   "x(01)"  }  /* type "1"   */
.

{us/xf/xfiv10u1.i} /*BLANK TEMPLATE*/

put stream ft skip.

/* SOLD-TO SHIP-TO ADDRESS - RECORD TYPE "2" */
put stream ft
   {us/xf/xfput.i "'2'"                001   "x(01)"  }  /* type "2"   */
   {us/xf/xfput.i soldto[1]            002   "x(38)"  }  /* cust name  */
   {us/xf/xfput.i soldto[2]            040   "x(38)"  }  /* cust addr 1*/
   {us/xf/xfput.i soldto[3]            078   "x(38)"  }  /* cust addr 2*/
   {us/xf/xfput.i soldto[4]            116   "x(38)"  }  /* cust addr 3*/
   {us/xf/xfput.i soldto_city          154   "x(24)"  }  /* cust city  */
   {us/xf/xfput.i soldto_state         178   "x(04)"  }  /* cust state */
   {us/xf/xfput.i soldto_zip           182   "x(10)"  }  /* cust pcode */
   {us/xf/xfput.i soldto[6]            192   "x(38)"  }  /* country    */
   {us/xf/xfput.i shipto[1]            230   "x(38)"  }  /* ship name  */
   {us/xf/xfput.i shipto[2]            268   "x(38)"  }  /* ship addr 1*/
   {us/xf/xfput.i shipto[3]            306   "x(38)"  }  /* ship addr 2*/
   {us/xf/xfput.i shipto[4]            344   "x(38)"  }  /* ship addr 3*/
   {us/xf/xfput.i shipto_city          382   "x(24)"  }  /* ship city  */
   {us/xf/xfput.i shipto_state         406   "x(04)"  }  /* ship state */
   {us/xf/xfput.i shipto_zip           410   "x(10)"  }  /* ship pcode */
   {us/xf/xfput.i shipto[6]            420   "x(38)"  }  /* country    */
.

{us/xf/xfiv10u2.i} /*BLANK TEMPLATE*/

put stream ft skip.

/*** OPTIONAL FIRST PAGE HEADER SPACER - RECORD TYPE "Y" ***/

put stream ft
   {us/xf/xfput.i "'Y'"                001   "x(01)"  }  /* type "Y"   */
.

{us/xf/xfiv10uy.i} /*BLANK TEMPLATE*/

put stream ft skip.
