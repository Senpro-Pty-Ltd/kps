/* xfsofm09mb.i FORMTRAP Shipper List Print              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */

for first pt_mstr no-lock
   where pt_domain = global_domain
   and   pt_part   = det_item:
end.
put  
   if available pt_mstr and pt_desc2 <> "" then
      "B"
   else
      "E"        at 1    format "x"                 /*record type*/
   det_item      at 5    format "x(18)"             /* item code */
   accum sub-total by det_line det_qty 
                 at 32 format "->>>>>>>>9.999999999" /*qty shipped*/
   det_um        at 52   format "x(2)"       /* UOM  */
   if available sod_det then
      sod_custpart
   else
      ""         at 62   format "x(30)"      /* cust item */
   if available pt_mstr then
      pt_desc1
   else
      ""         at 92   format "x(24)"      /*item desc1*/
   if available pt_mstr and pt_desc2 <> "" then
      pt_desc2
   else
      ""         at 116  format "x(24)"      /*item desc2*/
   shipper-po    at 140  format "x(22)"      /* cust PO */
   if available sod_det then
      cum_qty
   else
      0          at 162  format "->>>>>>>>9.999999999" /*cum qty ship*/
          .                      
          
if available sod_det then 
   put 
      sod_custref at 182 format "x(30)"                /*Cust Ref*/
      sod_modelyr at 212 format "x(4)"                /*Model Yr*/
   .
                 
if available cp_mstr then
   put 
      cp_cust_eco at 216 format "x(8)"              /*Cust ECO*/
   .

if available pt_mstr and pt_desc2 <> "" then 
do:
   {us/so/sofs9pub.i}
end.
else do:
   {us/so/sofs9pue.i}
end.

put skip.
