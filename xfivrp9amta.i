/* xfivrp9amta.i - FORMTRAP INCLUDE FILE INVOICE PRINT                        */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

assign
   tot_tax    = if available tt_tax then tt_tax_amt
                else 0.
   tot_ex_tax = if available tt_tax then tt_tax_ex_amt
                else 0.
