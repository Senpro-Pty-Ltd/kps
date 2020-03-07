/* xxtxck01.p - Check processed orders for missing tax records               */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 08-SEP-2011     BY: gbg *cy1021x*        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/
{us/bbi/mfdeclre.i}

{us/xx/xxauis2.i}

def var vMissing   as logical.
def var vCont      as logical label "Continue y/n".
def var vMessage1  as char format "x(60)".
def var vMessage2  as char format "x(60)".
vMessage1 = "This order line appears to be missing tax information.".
vMessage2 = "Please investigate".

form
so_nbr   colon 16
sod_line colon 16
sod_part colon 16
vMessage1 colon 16 no-label
vMessage2 colon 16 no-label
skip(1)
vCont    colon 16
with frame ftx width 80 side-labels no-attr-space row 8 overlay.


for each ttOrdersProcessed,
first so_mstr no-lock
where so_domain = global_domain
and   so_nbr    = ttOrderNo
break by ttOrderNo:
   if first-of(ttOrderNo)
   then do:
      vMissing = no.

       for each sod_det no-lock
       where sod_domain = global_domain
       and   sod_nbr = so_nbr
       and   sod_qty_inv <> 0.0
       and   not can-find(first tx2d_det
             where tx2d_domain = global_domain
             and   tx2d_ref = sod_nbr
             and   tx2d_line = sod_line
             and   tx2d_tr_type = "13")
       and   not can-find(first tx2d_det
             where tx2d_domain = global_domain
             and   tx2d_ref = sod_nbr
             and   tx2d_line = 0
	     and   tx2d_trl = " "
             and   tx2d_tr_type = "13"):
           vMissing = yes.
       end.
       if vMissing
       then do:
           display so_nbr
	   sod_line 
	   sod_part
	   vMessage1
	   vMessage2
	   with frame ftx.
	   ocontloop:
	   repeat:
	     contloop:
	     repeat:
	       update vCont
	       with frame ftx.
               if vCont then leave ocontloop.
	     end.
           end.
	   hide frame ftx no-pause.
       end.
   end.
end.
