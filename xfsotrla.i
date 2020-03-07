/* xfsotrla.i - SALES ORDER TRAILER DEFINE VARIABLES                    */
/* etsotrla.i - SALES ORDER TRAILER DEFINE VARIABLES                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsotrla.i,v 1.2 2018/03/13 17:09:55 gbg Exp $: */
/* REVISION: 7.0      LAST MODIFIED: 03/03/92   BY: tjs *F247* */
/* REVISION: 7.0      LAST MODIFIED: 03/19/92   BY: TMD *F263* */
/* REVISION: 7.0      LAST MODIFIED: 03/26/92   BY: dld *F297* */
/* REVISION: 7.0      LAST MODIFIED: 04/08/92   BY: tmd *F367* */
/* REVISION: 7.3      LAST MODIFIED: 08/24/92   BY: tjs *G033* */
/* REVISION: 7.4      LAST MODIFIED: 08/18/93   BY: pcd *H009* */
/* REVISION: 7.3      LAST MODIFIED: 08/25/93   BY: bcm *GE49* */
/* REVISION: 7.4      LAST MODIFIED: 10/26/93   BY: bcm *H194* */
/*                                   03/07/94   BY: bcm *FM68* */
/* REVISION: 8.5      LAST MODIFIED: 07/17/95   BY: taf *J053* */
/* Old patch markers are here for reference - file created from mfsotrla.i */
/* REVISION: 8.6E           CREATED: 02/23/98   BY: *L00L* Adam Harris  */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan   */
/* REVISION: 8.6E     LAST MODIFIED: 06/04/98   BY: *L01M* Jean Miller  */
/* REVISION: 8.6E     LAST MODIFIED: 09/08/98   BY: *H1MZ* Poonam Bahl  */
/* REVISION: 9.1      LAST MODIFIED: 07/12/00   BY: *N0FK* Marcia Silva */
/* REVISION: 9.1      LAST MODIFIED: 08/29/00   BY: *N0PN* Mark Brown   */
/* Revision: 1.8.2.3      BY: Katie Hilbert      DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.8.2.6      BY: Ellen Borden       DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.8.2.7      BY: Ellen Borden       DATE: 04/22/03  ECO: *N1YL* */
/* Revision: 1.8.2.9      BY: Paul Donnelly (SB) DATE: 06/28/03  ECO: *Q00C* */
/* Revision: 1.8.2.10     BY: Jing Li            DATE: 01/09/08  ECO: *R0JR* */
/* $Revision: 1.2 $  BY: Jean Miller        DATE: 11/23/09  ECO: *R1TW* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 24/10/12  ECO: *93sp12.1  */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

define {1} shared variable taxable_amt as decimal
   format "->>>>,>>>,>>9.99" label "Taxable".
define {1} shared variable nontaxable_amt like taxable_amt
   label "Non-Taxable".
define {1} shared variable line_total as decimal
   format "-zzzz,zzz,zz9.99" label "Line Total".
define {1} shared variable disc_amt like line_total
   format "(zzzz,zzz,zz9.99)" label "Discount".
define {1} shared variable tax_amt   like line_total
   label "Total Tax".
define {1} shared variable trl_amt like line_total.
define {1} shared variable ord_amt like line_total
   label "Total".
define {1} shared variable tot_line_comm as decimal
   format "->>>>,>>>,>>9.99<<<<" extent 4.
define {1} shared variable invcrdt as character format "x(15)".
define {1} shared variable user_desc like trl_desc extent 3.
define            variable i as integer.
define {1} shared variable total_pst like line_total
   label "Total PST".
define {1} shared variable maint like mfc_logical.
define {1} shared variable line_taxable_amt as decimal
   format "->>>>,>>>,>>9.99".
define {1} shared variable tax_date like so_tax_date.
define {1} shared variable tax_edit like mfc_logical initial false.
define {1} shared variable tax_edit_lbl like mfc_char format "x(28)".
define {1} shared variable container_charge_total as decimal
   format "->>>>>>>>9.99" label "Containers" no-undo.
define {1} shared variable line_charge_total as decimal
   format "->>>>>>>>9.99" label "Line Charges" no-undo.
define {1} shared variable tax like ord_amt extent 3.
define {1} shared variable l_nontaxable_lbl as character format "x(12)" no-undo.
define {1} shared variable l_taxable_lbl    as character format "x(12)" no-undo.

if (string("{1}") = "NEW") then
   assign tax_edit_lbl = getTermLabel("VIEW/EDIT_TAX_DETAIL",20).

find first gl_ctrl where gl_ctrl.gl_domain = global_domain no-lock.
find first soc_ctrl where soc_ctrl.soc_domain = global_domain no-lock.

{us/so/socurvar.i {1} }
{us/tx/txcurvar.i {1} }

/* WHEN THE VARIABLES ARE NEW THE FORMATS ARE NOT AVAIALABLE */
/*eb3sp5 comment begin
if (string("{1}") <> "NEW") then do:
   {us/so/sototfrm.i}
end. /* if string... */
eb3sp5 comment end*/
