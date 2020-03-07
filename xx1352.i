/* xx1352.i   -  xxedrpfm.p interface                                        */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB        LAST MODIFIED: 19-OCT-2012    BY: gbg *c1352*                  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

define {1} shared var incl_exch    like mfc_logical label "Incl Exchange Repository".
define {1} shared var incl_appl    like mfc_logical label "Incl Application Repository".

define var l_imp_name as char.
define var l_imp_vers as int.


define {1} shared temp-table ttrep
field doctype      as char
field fld1         as char
field fld2         as char
field fld3         as char.
