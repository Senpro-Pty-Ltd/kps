/* xx1021a.p - Cancel BO Logic                                               */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/* REVISION: 1.0     LAST MODIFIED: 29-JUN-2011     BY: gbg *cy1021*         */
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                    */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */


{us/bbi/mfdeclre.i}

def input parameter cmaddr    like cm_addr.
def output parameter cancelbo as logical.


/* Default Result */
cancelbo = yes.

    find first cm_mstr no-lock
    where cm_domain = global_domain
    and   cm_addr = cmaddr
    no-error.
    if available cm_mstr 
    and cm__chr07 = "yes"
    then do:
      cancelbo = no.
    end.

