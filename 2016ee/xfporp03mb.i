/* xfporp03mb.i - FORMTRAP INCLUDE FILE PO PRINT                              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 13/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

if pod_due_date <> ? then
   assign
      poform_due = string(year(pod_due_date),"9999") +
                   string(month(pod_due_date),"99") +
                   string(day(pod_due_date),"99").
else
   assign poform_due = "".

{us/bbi/gprun.i ""xftxtots.p"" "(
   input ""20"",        /* tx2d_tr_type */
   input po_nbr,        /* tx2d_ref */
   input po_blanket,    /* tx2d_nbr */
   input pod_line,
   input """",          /* tx2d_trl */
   output tot_tax,
   output tot_ex_tax)"}

put stream ft
   if desc2 <> "" then "B"
   else "E"                at 001   format   "x(01)"                 /* Record Type */
   pod_line                at 002   format   ">>9"                   /* Line Number */
   pod_part                at 005   format   "x(18)"                 /* Item Number */
   tax_flag                at 023   format   "!"                     /* Taxable Flag */
   poform_due              at 024   format   "x(08)"                 /* Due Date */
   qty_open                at 032   format   "->>>>>>>>9.999999999"  /* Qty Open */
   pod_um                  at 052   format   "x(02)"                 /* UM */
   pod_pur_cost            at 054   format   ">>>>>>>>>>>9.99999"    /* Unit Cost */
   ext_cost                at 072   format   "->>>>>>>>>>9.99999"    /* Ext Cost */
   po_so_nbr               at 090   format   "x(08)"                 /* EMT Sales Order Number */
   pod_sod_line            at 098   format   ">>9"                   /* EMT SO Line Number */
   pod_rev                 at 101   format   "x(04)"                 /* Revision */
   discdesc                at 105   format   "x(14)"                 /* Discount Description */
   pod_site                at 119   format   "x(08)"                 /* Site */
   pod_vpart               at 127   format   "x(30)"                 /* Supplier Number */
   typedesc                at 157   format   "x(11)"                 /* Memo item type Description*/
   mfgr                    at 168   format   "x(08)"                 /* Manufacturer */
   mfgr_part               at 176   format   "x(18)"                 /* Manufacturer Item */
   desc1                   at 194   format   "x(49)"                 /* Item Description 1 */
   if desc2 <> "" then desc2                                         
   else ""                 at 243   format   "x(49)"                 /* Item Description 2 */
   tot_tax                 at 292   format   "->>>>>>>>>>>9.99"      /* Tax Amount */
   (tot_ex_tax + tot_tax)  at 308   format   "->>>>>>>>>>>9.99"      /* Line Total incl Tax */
   tot_ex_tax              at 324   format   "->>>>>>>>>>>9.99"      /* Line Total excl Tax */
.

if desc2 <> ""
then do:
   {us/xf/xfpo03ub.i}
end.
else do:
   {us/xf/xfpo03ue.i}
end.

put stream ft skip. 
