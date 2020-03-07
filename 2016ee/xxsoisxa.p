/* xxsoisxa.p - Shipment Cancel Bo                                      */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */
/* CYB    LAST MODIFIED: July 2011     BY: gbg *cy1021*/
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
{us/bbi/mfdeclre.i}

def input parameter ipnbr    as char.

/*
create cil_mstr.
assign cil_domain = global_domain
       cil_cor_so_nbr = ipnbr.
       */
