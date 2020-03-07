/* xfdopkm0.i - FORMTRAP INCLUDE FILE DO PICKLIST PRINT                       */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eb3sp5   BY: Prasannan S           DATE: 25/08/10  ECO: *eb3sp5* */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 11/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   {us/xf/xfput.i "'0'"                001   "x(01)"  }  /* type  "0"  */
   {us/xf/xfput.i dss_nbr              002   "x(08)"  }  /* invoice no */
   {us/xf/xfput.i company[1]           010   "x(38)"  }  /* coy name   */
   {us/xf/xfput.i company[2]           048   "x(38)"  }  /* coy addr 1 */
   {us/xf/xfput.i company[3]           086   "x(38)"  }  /* coy addr 2 */
   {us/xf/xfput.i company[4]           124   "x(38)"  }  /* coy addr 3 */
   {us/xf/xfput.i company_city         162   "x(24)"  }  /* coy city   */
   {us/xf/xfput.i company_state        186   "x(04)"  }  /* coy state  */
   {us/xf/xfput.i company_zip          190   "x(10)"  }  /* coy pcode  */
   {us/xf/xfput.i company[6]           200   "x(38)"  }  /* coy country*/ 
   {us/xf/xfput.i year(dss_created)    238   "9999"   }  /* Order date */
   {us/xf/xfput.i month(dss_created)   242   "99"     }
   {us/xf/xfput.i day(dss_created)     244   "99"     }
   {us/xf/xfput.i year(today)          246   "9999"   }  /* Print date */
   {us/xf/xfput.i month(today)         250   "99"     }
   {us/xf/xfput.i day(today)           252   "99"     }
   {us/xf/xfput.i year(ds_shipdate)    254   "9999"   }  /* Ship  date */
   {us/xf/xfput.i month(ds_shipdate)   258   "99"     }
   {us/xf/xfput.i day(ds_shipdate)     260   "99"     }
   {us/xf/xfput.i dss_status           262   "x(08)"  }  /* Status */
   {us/xf/xfput.i dss_shipsite         270   "x(08)"  }  /* Site */
   {us/xf/xfput.i billto[1]            278   "x(38)"  }  /* bill name  */
   {us/xf/xfput.i billto[2]            316   "x(38)"  }  /* bill addr 1*/
   {us/xf/xfput.i billto[3]            354   "x(38)"  }  /* bill addr 2*/
   {us/xf/xfput.i billto[4]            392   "x(38)"  }  /* bill addr 3*/
   {us/xf/xfput.i billto_city          430   "x(24)"  }  /* bill city  */
   {us/xf/xfput.i billto_state         454   "x(04)"  }  /* bill state */
   {us/xf/xfput.i billto_zip           458   "x(10)"  }  /* bill pcode */
   {us/xf/xfput.i billto[6]            468   "x(38)"  }  /* country    */
   {us/xf/xfput.i billattn             506   "x(16)"  }  /* bill attention  */
   {us/xf/xfput.i billphn              522   "x(16)"  }  /* bill phone */
   {us/xf/xfput.i dss_rec_site         538   "x(08)"  }  /* Ship-To */
   {us/xf/xfput.i dss_po_nbr           546   "x(22)"  }  /* PO Nbr */
   {us/xf/xfput.i dss_shipvia          568   "x(20)"  }  /* Ship Via */
   {us/xf/xfput.i termsdesc            588   "x(40)"  }  /* Credit Terms */
   {us/xf/xfput.i dss_fob              628   "x(20)"  }  /* FOB Point */
   {us/xf/xfput.i dss_rmks             648   "x(40)"  }  /* Remarks   */
   .
   
   if not update_yn then
   do:
      put stream ft 
        {us/xf/xfput.i "'SIMULATION'"  688   "x(28)"  }  /* SIMULATION  */
      .  
   end.    
   else
   do:
      put stream ft 
         {us/xf/xfput.i  "''"          688   "x(28)"  }  /* Blank   */ 
      .             
   end.
   
   {us/xf/xfemail.i debtor.BusinessRelation_id "FT_DO" "" "stream ft"}
   {us/xf/xfdopku0.i} /*BLANK TEMPLATE*/
   
put stream ft skip.
   
   /* Optional first page header record type "1" */
put stream ft      
   {us/xf/xfput.i "'1'"                001   "x(01)"  }  /* type "1"   */
.

{us/xf/xfdopku1.i} /*BLANK TEMPLATE*/

put stream ft skip.

/* SHIP-TO ADDRESS - RECORD TYPE "2" */
put stream ft
   {us/xf/xfput.i "'2'"                001   "x(01)"  }  /* type "2"   */
   {us/xf/xfput.i shipto[1]            002   "x(38)"  }  /* ship name  */
   {us/xf/xfput.i shipto[2]            040   "x(38)"  }  /* ship addr 1*/
   {us/xf/xfput.i shipto[3]            078   "x(38)"  }  /* ship addr 2*/
   {us/xf/xfput.i shipto[4]            116   "x(38)"  }  /* ship addr 3*/
   {us/xf/xfput.i shipto_city          154   "x(24)"  }  /* ship city  */
   {us/xf/xfput.i shipto_state         178   "x(04)"  }  /* ship state */
   {us/xf/xfput.i shipto_zip           182   "x(10)"  }  /* ship pcode */
   {us/xf/xfput.i shipto[6]            192   "x(38)"  }  /* country    */
   {us/xf/xfput.i shipattn             230   "x(16)"  }  /* ship attention  */
   {us/xf/xfput.i shipphn              246   "x(16)"  }  /* ship phone */    
   .

{us/xf/xfdopku2.i} /*BLANK TEMPLATE*/

put stream ft skip.   

/*** OPTIONAL FIRST PAGE HEADER SPACER - RECORD TYPE "Y" ***/

put stream ft
   {us/xf/xfput.i "'Y'"                001   "x(01)"  }  /* type "Y"   */
.

{us/xf/xfdopkuy.i} /*BLANK TEMPLATE*/

put stream ft skip.
