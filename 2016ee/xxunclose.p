/*xxunclose.p - re-Open a sales order                             */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 2011-OCT-06     BY: gbg *c1250*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/
{us/mf/mfdtitle.i 1+}

def var vmessage as char.
def var i as int.
def var vNbr     like so_nbr.
def var vCont    like mfc_logical.

form
vNbr         colon 20
cm_sort no-label
skip(2)
vCont        colon 20 label "Continue"
skip(2)
so_to_inv    colon 20
so_invoiced  colon 20
with frame a width 80 side-labels no-attr-space.



mainloop:
repeat:
     vNbr = "".
     display " " @ vNbr
             " " @ cm_sort
     with frame a.
     update vnbr
     with frame a.
     find first so_mstr no-lock
     where so_domain = global_domain
     and   so_nbr = vNbr
     no-error.
     if not available so_mstr
     then do:
       vMessage = "Order does not exist. Retry.".
       {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
       undo mainloop, retry mainloop.
     end.
     if so_compl_stat <> "01"
     then do:
       vMessage = "Order is not closed. Retry".
       {us/bbi/pxmsg.i &MSGTEXT=vMessage &ERRORLEVEL=3}
       undo mainloop, retry mainloop.
     end.

     display so_to_inv so_invoiced
     with frame a.
     find first cm_mstr no-lock
     where cm_domain = global_domain
     and   cm_addr = so_cust
     no-error.
     display
     " " @ cm_sort
     cm_sort when available cm_mstr
     with frame a.

     vCont = yes.
     update vCont with frame a.  

     if vCont
     then do:
         find current so_mstr exclusive-lock.

         update
         so_to_inv
         so_invoiced
         with frame a.
         for each sod_det exclusive-lock
         where sod_domain = global_domain
         and   sod_nbr = so_nbr:
            sod_compl_stat = " ".
         end.
         so_compl_stat = " ".
         release so_mstr.
     end.
     else do:
       display
       " " @ so_to_inv
       " " @ so_invoiced
       with frame a.
     end.

end.  /* mainloop */
