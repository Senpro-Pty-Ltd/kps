/* xf10e01mb.i - Formtrap Include file Invoice Print                          */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong      DATE: 07/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

define variable tot_calc_tax as decimal.

find first tt_tax where tt_sfb = 0 no-error.
assign
   tot_tax    = if available tt_tax then tt_tax_amt    else 0
   tot_ex_tax = if available tt_tax then tt_tax_ex_amt else 0.

/*** LINE DETAIL RECORDS ***/
assign tot_calc_tax = tot_tax + tot_ex_tax.
if desc2 = "" then
   put stream ft "E" at 001 format "x(01)".
else
   put stream ft "B" at 001 format "x(01)".

/*93sp12.1** added us/xf for all include file */
put stream ft
   {us/xf/xfput.i sod_line                002   ">>9"    }  /* line number */
   {us/xf/xfput.i sod_part                005   "x(18)"  }  /* item number */
   {us/xf/xfput.i sod_taxable             023   "yes/no" }  /* taxable     */
   {us/xf/xfput.i year(sod_due_date)      026   "9999"   }  /* due date    */
   {us/xf/xfput.i month(sod_due_date)     030   "99"     }
   {us/xf/xfput.i day(sod_due_date)       032   "99"     }
   {us/xf/xfput.i "(if sod_fsm_type <> 'FSM-RO':U then sod_qty_inv ~
              else if sod_fsm_type = 'FSM-RO':U              ~
              and available itm_det then itm_qty_call        ~
              else 0)"              034   "->>>>>>>>9.999999999"  }
   {us/xf/xfput.i "(if sod_fsm_type <> 'FSM-RO':U then qty_bo ~
              else 0")              054   "->>>>>>>>9.999999999"  }
   {us/xf/xfput.i sod_um                  074   "x(02)"           }  /* uom     */
   {us/xf/xfput.i "(if sod_fsm_type <> 'FSM-RO':U then sod_price  ~
              else if sod_fsm_type = 'FSM-RO':U             ~
              and sod_fix_pr then sod_fixed_price           ~
              else 0)"              076   "->>>>>>>>9.99999"      }
   {us/xf/xfput.i ext_price               092   "->>>>>>>>9.99999"}  /* line value */
   {us/xf/xfput.i sod_site                108   "x(08)"           }  /* site */
   {us/xf/xfput.i sod_custpart            116   "x(30)"           }  /* cust item  */
   {us/xf/xfput.i desc1                   146   "x(24)"           }  /* item desc 1*/
   {us/xf/xfput.i "(if desc2 <> '' then desc2 ~
             else '')"              170   "x(24)"           }
   {us/xf/xfput.i sod_disc_pct            194   "->>9.99"         }  /* disc %     */
   {us/xf/xfput.i sod_list_pr             201   "->>>>>>>>9.99999"}  /* list price */
   {us/xf/xfput.i sod_pr_list             217   "x(08)"           }  /* price list */
   {us/xf/xfput.i tot_tax                 225   "->>>>>>>>>>>9.99"}  /* Tax Amount */
   {us/xf/xfput.i "(ext_price + tot_tax)"            241   "->>>>>>>>>>>9.99"}  /* Line Total incl Tax */
   {us/xf/xfput.i ext_price              257   "->>>>>>>>>>>9.99"}  /* Line Total excl Tax */
   {us/xf/xfput.i year(sod_promise_date)  274   "9999"            }
   {us/xf/xfput.i month(sod_promise_date) 278   "99"              }
   {us/xf/xfput.i day(sod_promise_date)   280   "99"              }
.

if desc2 = ""
then do :
   {us/xf/xfso10ue.i} /*BLANK TEMPLATE*/
end.
else do:
   {us/xf/xfso10ub.i} /*BLANK TEMPLATE*/
end.

put stream ft skip.
