/* xxdr.p     - Misc Procedures and Functions for DO                         */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 21-MAR-2012     BY: gbg *d1815*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}

{us/xx/xxdr.i}


def var vpart like pt_part.
def var vsite like si_site.
def var vdate as date.

vdate = today.

repeat:
   update vpart skip
          vsite skip
	  vdate
	with frame x side-labels width 80.

   message fNetWorkCode(vpart, vsite) " " 
           fNextShipDate(fNetworkCode(vpart, vsite),
                         vdate,
			 vsite) " DueDt: "
           fNextShipDate(fNetworkCode(vpart, vsite),
                         vdate,
			 vsite) + fSafetyTime(vpart, vsite).
   pause.
   
end.
