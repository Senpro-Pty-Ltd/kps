/* xfivrp9amv.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

&SCOPED-DEFINE soivrp1a_p_12 " x periods "
/* MaxLen: Comment: */

&SCOPED-DEFINE soivrp1a_p_13 "Exchange"
/* MaxLen: Comment: */

&SCOPED-DEFINE soivrp1a_p_14 "Purchase Order:"
/* MaxLen: Comment: */

&SCOPED-DEFINE soivrp1a_p_22 " = shipped "
/* MaxLen: Comment: */

&SCOPED-DEFINE soivrp1a_p_24 "Units "
/* MaxLen: Comment: */

&SCOPED-DEFINE soivrp1a_p_26 "Service Contract:"
/* MaxLen: Comment: */

&SCOPED-DEFINE soivrp1a_p_27 "Return"
/* MaxLen: Comment: */

define variable tax_seq    as int  no-undo.
define variable tax_seqx   as char no-undo.

define temp-table tt_tax no-undo
   field tt_sfb         as    recid
   field tt_tax_amt     like  tx2d_cur_tax_amt
   field tt_tax_ex_amt  like  tx2d_totamt
   index tt_sfb         is primary unique tt_sfb.
