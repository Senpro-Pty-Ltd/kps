/* xfrvrpmb.i - PURCHASE ORDER RETURN PRINT USER CODE RECORD TYPE "B"         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/18/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

{us/bbi/gprun.i ""xftxtots.p"" "(
   input ""25"",        /* tx2d_tr_type */
   input prh_receiver,       /* tx2d_ref */
   input prh_nbr,      /* tx2d_nbr */
   input prh_line,
   input """",          /* tx2d_trl */
   output tot_tax,
   output tot_ex_tax)"}

put stream ft
   if desc2 <> "" then "B"
   else "E"       at 1    format "x(1)"                  /* Record Type */
   prh_line       at 2    format ">>9"                   /* Line Number */
   prh_part       at 5    format "x(18)"                 /* Item Number */
   prh_ps_qty     at 23   format "->>>>>>>>9.999999999"  /* Pack Quantity */
   qty_open       at 43   format "->>>>>>>>9.999999999"  /* Qty Open */ 
   prh_um         at 63   format "x(2)"                  /* UM */
   unit_cost      at 65   format ">>>>>>>>>>>9.99999"    /* Unit Cost */
   ext_cost       at 83   format "->>>>>>>>>>9.99999"    /* Ext Cost */
   item-rev-lbl   at 101  format "x(10)"                 /* Revision Label */
   prh_rev        at 111  format "x(4)"                  /* Revision */
   site-lbl       at 115  format "x(6)"                  /* Site Label */
   prh_site       at 121  format "x(8)"                  /* Site */
   vpart-lbl      at 129  format "x(15)"                 /* Vendor Part Label */
   pod_vpart      at 144  format "x(30)"                 /* Supplier Number */
   type-lbl       at 174  format "x(6)"                  /* Type Label */
   typedesc       at 180  format "x(11)"                 /* Memo item type Description*/
   manuf-lbl      at 191  format "x(14)"                 /* Manufacture Part Label */
   mfgr           at 205  format "x(30)"                 /* Manufacturer */
   part-lbl       at 235  format "x(6)"                  /* Part Label */
   mfgr_part      at 241  format "x(18)"                 /* Manufacturer Item */
   desc1          at 259  format "x(49)"                 /* Item Description 1 */
   if desc2 <> "" then desc2
   else ""        at 308  format "x(49)"                 /* Item Description 2 */
   tot_tax        at 357  format "->>>>>>>>>>>9.99"      /* Tax Amount */
   (tot_ex_tax + tot_tax) at 373 format "->>>>>>>>>>>9.99"  /* Line Total incl Tax */
   tot_ex_tax     at 389  format "->>>>>>>>>>>9.99"      /* Line Total excl Tax */
.

if desc2 <> ""
then do :
   {us/xf/xfpo03ub.i}
end.
else
do :
   {us/xf/xfpo03ue.i}
end.
put stream ft skip.
