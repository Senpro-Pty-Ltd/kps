/* xfivrp9ams.i - FORMTRAP INCLUDE FILE INVOICE PRINT                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 12/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

/* IF WE HAVE A SERVICE CONTRACT AND THIS INVOICE WAS NOT CREATED */
/* VIA CUSTOMER SCHEDULES, THEN GET THE SERVICE TYPE DESCRIPTION  */
if sacontract
then do:
   find first sv_mstr no-lock
      where sv_domain = global_domain
        and sv_code   = idh_part
   no-error.
   if available sv_mstr then
      assign desc1 = sv_desc.
   else
      desc1 = "".
end. /*if sacontract*/

find tt_tax where tt_sfb = 0 no-error.
assign
   tot_tax    = if available tt_tax then tt_tax_amt
                else 0
   tot_ex_tax = if available tt_tax then tt_tax_ex_amt
                else 0.

/*** LINE DETAIL RECORDS ***/
if desc2 = "" then
   put stream ft "E" at 001 format "x(01)".
else
   put stream ft "B" at 001 format "x(01)".

put stream ft
   {us/xf/xfput.i idh_line                   002   ">>9"    }  /* line number */
   {us/xf/xfput.i idh_part                   005   "x(18)"  }  /* item number */
   {us/xf/xfput.i idh_taxable                023   "yes/no" }  /* taxable     */
   {us/xf/xfput.i year(idh_due_date)         026   "9999"   }  /* due date    */
   {us/xf/xfput.i month(idh_due_date)        030   "99"     }
   {us/xf/xfput.i day(idh_due_date)          032   "99"     }
   {us/xf/xfput.i "(if (idh_fsm_type <> 'FSM-RO':U) then idh_qty_inv ~
              else if (idh_fsm_type = 'FSM-RO':U               ~
              and available itm_det) then itm_qty_call         ~
              else if (idh_fsm_type = 'FSM-RO':U               ~
              and not available itm_det                        ~
              and available itmh_hist) then itmh_qty_call      ~
              else 0)"                 034   "->>>>>>>>9.999999999"  }
   {us/xf/xfput.i "(if idh_fsm_type <> 'FSM-RO':U then qty_bo ~
              else 0")                 054   "->>>>>>>>9.999999999"  }
   {us/xf/xfput.i idh_um                     074   "x(02)"           }  /* uom     */
   {us/xf/xfput.i "(if idh_fsm_type <> 'FSM-RO':U then idh_price  ~
              else if idh_fsm_type = 'FSM-RO':U             ~
              and idh_fix_pr then idh_fixed_price           ~
              else 0)"                 076   "->>>>>>>>9.99999"      }
   {us/xf/xfput.i ext_price                  092   "->>>>>>>>9.99999"}  /* line value */
   {us/xf/xfput.i idh_site                   108   "x(08)"           }  /* site */
   {us/xf/xfput.i idh_custpart               116   "x(30)"           }  /* cust item  */
   {us/xf/xfput.i desc1                      146   "x(24)"           }  /* item desc 1*/
   {us/xf/xfput.i "(if desc2 <> '' then desc2 ~
             else '')"                 170   "x(24)"           }
   {us/xf/xfput.i idh_disc_pct               194   "->>9.99"         }  /* disc %     */
   {us/xf/xfput.i idh_list_pr                201   "->>>>>>>>9.99999"}  /* list price */
   {us/xf/xfput.i idh_pr_list                217   "x(08)"           }  /* price list */
   {us/xf/xfput.i tot_tax                    225   "->>>>>>>>>>>9.99"}  /* Tax Amount */
   {us/xf/xfput.i "(ext_price + tot_tax)"   241   "->>>>>>>>>>>9.99"}  /* Line Total incl Tax */
   {us/xf/xfput.i ext_price                 257   "->>>>>>>>>>>9.99"}  /* Line Total excl Tax */
   {us/xf/xfput.i year(idh_promise_date)     274   "9999"            }
   {us/xf/xfput.i month(idh_promise_date)    278   "99"              }
   {us/xf/xfput.i day(idh_promise_date)      280   "99"              }
.

if desc2 = ""
then do :
   {us/xf/xfiv10ue.i} /*BLANK TEMPLATE*/
end.
else do:
   {us/xf/xfiv10ub.i} /*BLANK TEMPLATE*/
end.

put stream ft skip.
