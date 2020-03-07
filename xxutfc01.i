/* xxutfc01.i - Forecast Clear Utility                                       */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 24-AUG-2012     BY: gbg *c1331*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/


define {1} shared var  site    like si_site.
define {1} shared var  site1   like si_site.
define {1} shared var  part    like pt_part.
define {1} shared var  part1   like pt_part.
define {1} shared var  fcdate  as date.
define {1} shared var  fcdate1 as date.
define {1} shared var  wkdate  as date.
define {1} shared var  wkdate1 as date.
define {1} shared var  wkdate2 as date.
define {1} shared var  wkyear  as int.
define {1} shared var  wkprd   as int.
define {1} shared var  fryear  as int.
define {1} shared var  toyear  as int.
define {1} shared var  frprd   as int.
define {1} shared var  toprd   as int.
define {1} shared var  vupdate like mfc_logical.

define var vmessage as char.
define var i as int.
define var j as int.


def {1} shared temp-table ttprds
field  ttyear    as int
field  ttprd     as int
field  ttdate    as date.

def {1} shared temp-table ttyrs
field ttyr   as int.
