/* xxbdldc.p - CIM - mark transaction as processed in bdl_mstr          */
/* COPYRIGHT qad.inc. ALL RIGHTS RESERVED. THIS IS AN UNPUBLISHED WORK. */
/*F0PN*/ /*V8:ConvertMode=Maintenance                                   */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 22-SEP-2011    BY:  gbg *cy1020*                     */
/* CYB    LAST MODIFIED: 22-SEP-2011    BY:  gbg *c1245*                      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
         
/************************************************************************
 *
 *
 *        Input Parameters:
 *                datasource       = input source
 *                group_list       = list of group numbers (comma delimited)
 *                
 ************************************************************************/
{us/bbi/mfdeclre.i}

 define input  parameter        datasource          as char        no-undo.
 define input  parameter        group_list          as char        no-undo.
 define input  parameter        datepro             as date        no-undo.
 define input  parameter        timepro             as char        no-undo.

 define var groupid as int.
 define var i       as int.

 if num-entries(group_list) > 0
 then 
 do i = 1 to num-entries(group_list):
    groupid = integer(entry(i, group_list)) no-error.
    if not error-status:error
    then do:
       for each bdl_mstr exclusive-lock
       where bdl_domain = global_domain
       and   bdl_source = datasource
       and   bdl_id     = groupid:
           assign
           bdl_date_pro = datepro
           bdl_time_pro = timepro.
       end.
    end.
 end.
