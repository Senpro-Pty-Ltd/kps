/* xxcloseords.p - Close orders                                              */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 08-SEP-2011     BY: gbg *cy1021*         */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/* CYB    LAST MODIFIED: 17-JUN-2013    BY:  gbg *c1418*                     */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}

{us/xx/xxauis2.i}


for each ttOrdersProcessed,
first so_mstr no-lock
where so_domain = global_domain
and   so_nbr    = ttOrderNo
,
first cm_mstr no-lock
where cm_domain = global_domain
and   cm_addr = so_cust
and   cm__chr07 <> "yes"
break by ttOrderNo:
   if first-of(ttOrderNo)
   then do:
      {us/bbi/gprun.i ""xxsoclose.p"" "(ttOrderNo)"}
   end.
end.
