/* xx3738.i - Planned PO Approval - Custom fields                        */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                 */
/* All rights reserved worldwide.  This is an unpublished work.          */
/*-----------------------------------------------------------------------*/
/* CYB                BY: gbg               DATE: 22 Mar 17 ECO: *D3738* */
/* CYB                BY: gbg               DATE: 12 May 17 ECO: *C1605* */
/*-----------------------------------------------------------------------*/

def {1} shared var prodline     like pl_prod_line.
def {1} shared var prodline1    like pl_prod_line.
def {1} shared var vend         like vd_addr.
def {1} shared var vend1        like vd_addr.
def {1} shared var vDueDate     as date label "Update Due Date".
def {1} shared var vDueDateP    as date.
def {1} shared var vPalletCount as dec format ">>9.99".
def {1} shared var vTotQty      as dec format ">>>>9.9".
def {1} shared var vTotQtyRT    as dec format ">>>>9.9".
def {1} shared var vTotPLC      as dec format ">>9.99".
def {1} shared var vTotPLCRT    as dec format ">>>>9.9".

