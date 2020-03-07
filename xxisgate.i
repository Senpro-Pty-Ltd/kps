/* xxisgate.i  Gate code for shipping - force single stream shiping          */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *cgbg1*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/


do transaction:
if not can-find(first usrw_wkfl where usrw_domain = "ALLDOMAINS"
                      and usrw_key1 = "soisgatelock"
                      and usrw_key2 = "soisgatelock")
then do:
   create usrw_wkfl.
   assign
   usrw_domain = "ALLDOMAINS"
   usrw_key1 = "soisgatelock"
   usrw_key2 = "soisgatelock".
   release usrw_wkfl.
end.
end.  /* transaction */



do transaction:
  gateloop:
  repeat:
      hide frame fgate no-pause.
      clear frame fgate.
      find first usrw_wkfl exclusive-lock
      where usrw_domain = "ALLDOMAINS"
      and   usrw_key1 = "soisgatelock"
      and   usrw_key2 = "soisgatelock"
      no-wait no-error.
      if available usrw_wkfl then do:
	leave gateloop.
      end.
      display "Waiting for shipment processing queue" at 10
      with frame fgate width 80 row 8 no-labels.
      pause 1 no-message.
  end.
  hide frame fgate no-pause.
end.  /* transaction */
