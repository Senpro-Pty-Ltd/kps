/* xfrp1amv.i - Formtrap Include file Invoice Print                           */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

define variable tax_seq    as integer   no-undo.
define variable tax_seqx   as character no-undo.

define temp-table tt_tax no-undo
   field tt_sfb         as    recid
   field tt_tax_amt     like  tx2d_cur_tax_amt
   field tt_tax_ex_amt  like  tx2d_totamt
   index tt_sfb         is    primary unique tt_sfb.
