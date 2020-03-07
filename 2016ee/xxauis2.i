/* xxauis2.i - Shared resources for Auto Confirm Invoice Print               */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                    */
/* CYB    LAST MODIFIED: 73-JUL-2011    BY:  gbg *c1226*                     */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 09-AUG-2013    BY:  gbg *c1432*                     */
/*---------------------------------------------------------------------------*/


def {1} shared var invprinter      like prd_dev no-undo.
def {1} shared var invp            like prd_dev no-undo.
def {1} shared var printseq        as integer.
def {1} shared var sinv_only       like mfc_logical no-undo.
def {1} shared var sinv_date       like so_inv_date no-undo.
def {1} shared var sprint_lotserials like mfc_logical no-undo.
def {1} shared var sprint_options  like mfc_logical no-undo.
def {1} shared var scomp_addr      like soc_company no-undo.
def {1} shared var sform_code      as char format "x(2)" no-undo.
def {1} shared var sdisc_det       like lngd_translation 
                                   label "Discount Detail" no-undo.
def {1} shared var sdisc_sum       like sdisc_det         
                                   label "Discount Summary" no-undo.
def {1} shared var smsg            like msg_desc no-undo.



define {1} shared variable svcPriHeading     as character no-undo.
define {1} shared variable svcPriHeadComment as character no-undo.
define {1} shared variable svcPriLineComment as character no-undo.
define {1} shared variable svlPriLineTax     as logical   no-undo.
define {1} shared variable svlPriDesc2       as logical   no-undo.
define {1} shared variable svlPriCustItem    as logical   no-undo.

define {1} shared variable svcHeading        as character no-undo.
define {1} shared variable svcHeading1       as character no-undo.
define {1} shared variable svcTranType       as character no-undo.
define {1} shared variable svcTaxRef         as character no-undo.
define {1} shared variable svcTaxNbr         as character no-undo.
define {1} shared variable sviTaxLine        as integer   no-undo.
define {1} shared variable svdPrintWidth     as decimal   no-undo.

/*cy1021* start added code */
define {1} shared temp-table ttOrdersProcessed
field ttOrderNo          as char.
/*cy1021* end   added code */

/*c1432* start   added code */
define {1} shared temp-table ttLinesProcessed
field ttLineOrder   as char
field ttLineNumber  as int.
/*c1432*  end   added code */
