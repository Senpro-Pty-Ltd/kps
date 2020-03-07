/* xx1578.i   Shared vars */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB               LAST MODIFIED: 2016-May-19 BY: gbg *c1578* D3474   */
/*---------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------*/

def var vmessage as char.
def var vmessagearg1 as char.
def var vmessagearg2 as char.
def var i as int.
def var j as int.
def var k as int.
def var yn as logical.
def var prhproc as logical.
def var vseltype  as logical.
def var glcost as dec.
def var iss_trnbr like tr_trnbr.
def var rct_trnbr like tr_trnbr.
def var optrnbr   like op_trnbr.
def var assay like ld_assay.
def var grade like ld_grade.
def var expire like ld_expire.
define {1} shared var transtype as character 
                                format "x(7)" initial "ISS-TR".
define {1} shared variable impexp          like mfc_logical
                                           label "Imp/Exp" no-undo.
def {1} shared var v_item   like pt_part.
def {1} shared var v_qty    like tr_qty_chg.
def {1} shared var v_site   like si_site.
def {1} shared var v_loc    like ld_loc.
def {1} shared var v_prh    like prh_receiver.
def var nextLotRef                  as char.


def temp-table ttparts
field ttitem  as char
field ttqty   as dec
field ttsize  as int
field ttprh   as char
field ttsite  as char
field ttloc   as char
field ttref   as char
field ttserial as char
field ttnbr as char
field ttline  as int
field tttrnbr like tr_trnbr
.

def temp-table ttpallets
field tpitem  as char
field tpqty   as dec
field tpsize  as int
field tpprh   as char
field tpsite  as char
field tploc   as char
field tpref   as char
field tpserial as char
field tpnbr as char
field tpline  as int
field tptrnbr like tr_trnbr
.



def new shared stream ft.
