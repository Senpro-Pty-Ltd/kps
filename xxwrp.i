/* xxwrp.i - wrapper to execute code on leaving any frame                    */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED:                 BY: gbg                  */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}

def var hdl1     as handle.

on go anywhere
do:

    case self:type:
       when "fill-in" then hdl1 = self:frame.
       when "frame" then hdl1 = self.
       otherwise hdl1 = ?.
    end.
    if hdl1 <> ? then do:

    end.

end.
