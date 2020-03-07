/* xf10e01.i - DEFINE FRAME FOR INVOICE LINE ITEM INFORMATION                 */
/* so10e01.i - DEFINE FRAME FOR INVOICE LINE ITEM INFORMATION                 */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xf10e01.i,v 1.2 2018/03/13 17:09:34 gbg Exp $: */
/*so10e01.i INVOICE PRINT include file                                        */
/* REVISION: 5.0    LAST MODIFIED:  03/12/89   BY: MLB *B615                  */
/* REVISION: 6.0    LAST MODIFIED:  07/05/90   BY: WUG *D043*                 */
/* REVISION: 8.5    LAST MODIFIED:  08/31/95   BY: taf *J053*                 */
/* REVISION: 8.5    LAST MODIFIED:  06/26/96   BY: *J0WF* Sue Poland          */
/* REVISION: 8.5    LAST MODIFIED:  08/16/96   BY: *G29K* Markus Barone       */
/* REVISION: 8.6E   LAST MODIFIED:  02/23/98   BY: *L007* A. Rahane           */
/* REVISION: 8.6E   LAST MODIFIED:  04/23/98   BY: *L00L* EvdGevel            */
/* REVISION: 8.6E   LAST MODIFIED:  05/20/98   BY: *K1Q4* Alfred Tan          */
/* REVISION: 8.6E   LAST MODIFIED:  06/04/98   BY: *L01M* Jean Miller         */
/* REVISION: 9.0    LAST MODIFIED:  11/20/98   BY: *J33Y* Poonam Bahl         */
/* REVISION: 9.0    LAST MODIFIED:  03/13/99   BY: *M0BD* Alfred Tan          */
/* REVISION: 9.1    LAST MODIFIED:  10/07/99   BY: *K23H* Sachin Shinde       */
/* REVISION: 9.1    LAST MODIFIED:  03/24/00   BY: *N08T* Annasaheb Rahane    */
/* REVISION: 9.1    LAST MODIFIED:  05/02/00   BY: *L0X1* Veena Lad           */
/* REVISION: 9.1    LAST MODIFIED:  08/12/00   BY: *N0JM* Mudit Mehta         */
/* REVISION: 9.1    LAST MODIFIED:  08/25/00   BY: *N0P0* Arul Victoria       */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Revision: 1.19      BY: Jean Miller         DATE: 04/16/02  ECO: *P05S*    */
/* Revision: 1.20      BY: Amit Chaturvedi     DATE: 01/20/03  ECO: *N20Y*    */
/* Revision: 1.21      BY: Narathip W.         DATE: 05/13/03  ECO: *P0RT*    */
/* Revision: 1.23      BY: Katie Hilbert       DATE: 06/08/06  ECO: *Q0LK*    */
/* Revision: 1.24      BY: Xiaolei Meng        DATE: 07/31/09  ECO: *R1N2*    */
/* $Revision: 1.2 $   BY: Jean Miller         DATE: 11/23/09  ECO: *R1TW*    */
/* Revision: QAD2014   BY: Amol Dudvadkar      DATE: 03/16/15  ECO: *grc338*  */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/* THE TRANSLATED TEXT SHOULD BE THE SAME SIZE IF POSSIBLE*/
/* THIS INCLUDE FILE IS CALLED BY sorp1a01.p              */
/* INVOICE REPRINT, ANY CHANGES MADE HERE WILL BE NEEDED IN SOIVRP1A.P */

/* FOR CALL INVOICES, WE DON'T ALWAYS PRINT THE PRICE BECAUSE,     */
/* WHEN IT'S NOT A 'FIXED PRICE REPAIR' (MEANING WHENEVER PART     */
/* NUMBER X GETS FIXED, IT COSTS $100, FOR EXAMPLE), SOD_PRICE IS  */
/* THE TOTAL OF ALL LABOR/EXPENSES/PARTS USED IN THE REPAIR LESS   */
/* EXCHANGE CREDITS, LESS CONTRACT COVERAGE.  AND, THAT PRICE IS   */
/* FOR THE FULL QUANTITY OF PARTS REPAIRED - IT'S NOT A UNIT PRICE */
/* SO, IT DOESN'T MAKE SENSE TO PRINT IT THAT WAY. HOWEVER, WHEN   */
/* FIXED PRICE REPAIRS ARE BEING INVOICED, THE GROSS FIXED PRICE   */
/* DOES PRINT IN THE 'PRICE' COLUMN.  THE NET PRICE DISPLAYED IS   */
/* NET OF ANY EXCHANGE CREDIT GIVEN.                               */

/* ALSO, FOR CALL INVOICES, AS WE DON'T REALLY 'SHIP' ANYTHING,    */
/* THE QUANTITY OF INTEREST IS THE QUANTITY REPAIRED ON THE CALL   */
/* LINE.  THEREFORE, PRINT THAT INSTEAD OF QTY TO INVOICE AND      */
/* PRINT NO BACKORDER QUANTITY (BECAUSE THERE ISN'T ANY).          */

{us/xf/xf10e01mb.i} /*grc338*/

/*grc338 comment begin
if sod_fsm_type <> "FSM-RO"
then
   assign
      ext_price:label in frame d     = getTermLabel("EXTENDED_PRICE",16)
      ext_price:label in frame dent  = getTermLabel("EXTENDED_PRICE",16).
else
   assign
      ext_price:label in frame d     = getTermLabel("NET_PRICE",16)
      ext_price:label in frame dent  = getTermLabel("NET_PRICE",16).

if so_app_owner = 'DOM'
then do:
   display
      sod_part @ ent_ord_line_part
      sod_um   @ ent_ord_line_uom
      sod_qty_inv
      qty_bo
      sod_taxable
      sod_price
      ext_price        when (not auth_found)
      ""               when (auth_found) @ ext_price
   with frame dent.

   /* Only display the Enterprise Item data if the item id or uom are different */
   /* from the MFG/PRO values. Otherwise it would just be duplicate information  */
   if (ent_ord_line_part <> sod_part) or
      (ent_ord_line_uom <> sod_um)
   then do:
      down 1 with frame dent.

      display
         ent_ord_line_part
         ent_ord_line_uom
         (sod_qty_inv * conversion_factor) @ sod_qty_inv format "->>>>>>9.9<<<<<"
         (qty_bo * conversion_factor)      @ qty_bo      format "->>>>>>9.9<<<<"
         ""                @ sod_taxable
         ""                @ sod_price
         ""                @ ext_price
      with frame dent.
   end. /* if so_app_owner = 'DOM' */

   if vdPrintWidth = 0.0 then
      vdPrintWidth = frame dent:width-chars.
end.

else do:
   display
      sod_part
      sod_um
      sod_qty_inv      format "->>>>>>9.9<<<<<" when (sod_fsm_type <> "FSM-RO")
      itm_qty_call     when (sod_fsm_type = "FSM-RO"
                        and available itm_det) @ sod_qty_inv
                       format "->>>>>>9.9<<<<<"
      qty_bo           column-label "Backorder" when (sod_fsm_type <> "FSM-RO")
      sod_taxable
      sod_price        when (sod_fsm_type <> "FSM-RO"
                         or (sod_fsm_type =  "FSM-RO"
                        and  sod_fix_pr   = no))
      sod_fixed_price  when (sod_fsm_type =  "FSM-RO"
                        and  sod_fix_pr) @ sod_price
      ext_price        when (not auth_found)
      ""               when (auth_found) @ ext_price
   with frame d.

   if vdPrintWidth = 0.0 then
      vdPrintWidth = frame d:width-chars.
end. /* IF NOT et_dc_print THEN */
grc338 comment end*/
