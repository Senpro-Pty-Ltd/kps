/* xftrldef.i - PURCHASE ORDER TRAILER FIELD DEFINITIONS                      */
/* potrldef.i - PURCHASE ORDER TRAILER FIELD DEFINITIONS                      */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xftrldef.i,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/*                                                                            */
/* REVISION: 7.4        BY: Bryan Merich          DATE: 04/11/94  ECO: *H334* */
/* REVISION: 8.5        BY: Doug Norton           DATE: 03/29/95  ECO: *F0PN* */
/* REVISION: 8.5        BY: ccc                   DATE: 09/08/95  ECO: *J053* */
/* REVISION: 8.6E       BY: Annasaheb Rahane      DATE: 02/23/98  ECO: *L007* */
/* REVISION: 8.6E       BY: Alfred Tan            DATE: 05/20/98  ECO: *K1Q4* */
/* REVISION: 8.6E       BY: Alfred Tan            DATE: 10/04/98  ECO: *J314* */
/* REVISION: 9.1        BY: Annasaheb Rahane      DATE: 03/24/00  ECO: *N08T* */
/* Revision: 1.6.3.4    BY: Mark B. Smith         DATE: 07/20/00  ECO: *N059* */
/* Revision: 1.6.3.5    BY: Mudit Mehta           DATE: 08/17/00  ECO: *N0KM* */
/* Revision: 1.6.3.5    BY: Katie Hilbert         DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.6.3.7    BY: Vandna Rohira         DATE: 04/28/03  ECO: *N1YL* */
/* Revision: 1.6.3.10   BY: Robin McCarthy        DATE: 05/31/06  ECO: *R02F* */
/* $Revision: 1.2 $ BY: Anil Sudhakaran      DATE: 07/12/09  ECO: *R1LB* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*V8:ConvertMode=Maintenance                                                  */

define {1} shared frame    potot.
define {1} shared frame    pomtd.

define {1} shared variable undo_trl2        like mfc_logical.
define {1} shared variable taxable_amt      as decimal
   format "->>>>,>>>,>>9.99"
   label "Taxable".
define {1} shared variable nontaxable_amt   like taxable_amt
   label "Non-Taxable".
define {1} shared variable lines_total      as decimal
   format "-zzzz,zzz,zz9.99"
   label "Line Total".
define {1} shared variable tax_total        like lines_total
   label "Total Tax".
define {1} shared variable tax_date         like po_tax_date.
define {1} shared variable tax_edit         like mfc_logical
   initial false.
define {1} shared variable tax_edit_lbl     like mfc_char
   format "x(28)".
define {1} shared variable order_amt        like lines_total
   label "Total".
define {1} shared variable edi_po           like mfc_logical
   label "EDI PO".

define {1} shared variable l_nontaxable_lbl as character format "x(12)" no-undo.
define {1} shared variable l_taxable_lbl    as character format "x(12)" no-undo.

define            variable rma_bol          like rma_rts_bol no-undo.

&IF (string("{1}") = "NEW") &THEN
   assign tax_edit_lbl = getTermLabelRtColon("VIEW/EDIT_TAX_DETAIL",28).
&ENDIF

/* WHEN THE VARS ARE "NEW", THE CURRENCY DEPENDENT FORMATS REQUIRED */
/* BY THE FORMS ARE NOT YET AVAILABLE                               */
if (string("{1}") <> "NEW") then do:
   /*eb3sp5 comment begin
   {us/po/pototfrm.i}

   form
      {us/po/pomtdfrm.i}
   with frame pomtd attr-space side-labels width 80.

   /* SET EXTERNAL LABELS */
   setFrameLabels(frame pomtd:handle).

   assign
      po_rev_date:label = getTermLabel("ORDER_REVISION_DATE", 15)
      po_prepaid:format = prepaid_fmt.
   eb3sp5 comment end*/
end.
