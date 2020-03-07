/* xfcmtpr9.i - INCLUDE FILE TO PRINT COMMENTS                            */
/* gpcmtprt.i - INCLUDE FILE TO PRINT COMMENTS                          */
/* Copyright 1986-2008 QAD Inc., Carpinteria, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */

/* REVISION: 6.0     LAST MODIFIED: 07/02/90    BY: WUG                 */
/* REVISION: 6.0     LAST MODIFIED: 08/13/90    BY: RAM *D030*          */
/* REVISION: 7.3     LAST MODIFIED: 02/22/93    BY: tjs *G718*          */
/* REVISION: 9.1     LAST MODIFIED: 08/14/00    BY: *N0L1* Mark Brown   */
/* Old ECO marker removed, but no ECO header exists *F0PN*              */
/* Revision: 1.5  BY: Katie Hilbert      DATE: 04/01/01 ECO: *P008* */
/* Revision: 1.7  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00F* */
/* $Revision: 1.2 $ BY: Alex Joy         DATE: 01/17/08 ECO: *P6XQ* */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE                */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
/*!
Parameters:
&type       Identifies what document is printing:
            QO = Sales Quote
            SO = Sales Order
            IN = Invoice
            PA = Sales Order Packing List
            PO = Purchase Order
            RC = Purchase Receipt
            RV = Return to Vendor
            RP = Other non-mailout report (always printed)

&id         Identifies comment records, e.g. so_cmtindx for Sales Orders
&pos        Print position
&command    Command to perform after doing the page command,
e.g. "down 1.".  This is to optionally prevent comment
lines being printed between a page header and a column header.
*/

/*V8:ConvertMode=Maintenance                                            */

for each cmt_det no-lock
   where cmt_det.cmt_domain = global_domain
   and  (cmt_indx = {&id}
   and   cmt_indx > 0
   and  (lookup("{&type}",cmt_print) > 0 or "{&type}" = "RP") ) :
   do i = 1 to 15:
      if cmt_cmmt[i] <> ""
      then do:
{us/xf/xfcmtpr9mi.i &rectype={&rectype} &usercode={&usercode}} 
      end.
   end.
end.
