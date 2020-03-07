/* xfqo10ub.i - SALES QUOTE PRINT USER CODE RECORD TYPE "B"                   */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shilpa Ahuja       DATE: 02/18/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */
/*******************************************************************************
 *
 *  Code may be added here to extend the standard output record or
 *  create additional records.
 *
 *  To extend the standard record:
 *
 *  Fields should be output starting at a position beyond the end
 *  of the existing standard record.
 *  Attempts to put data at positions less than this will result in a
 *  new record being generated as Progress will not over-write existing
 *  data (even if that position contains nulls).
 *
 *  Output should be in the form:-
 *      put
 *         <field>  at <pos>    format <format>
 *         <field>  at <pos>    format <format>
 *         .
 *
 *      where 'field'  = field name, variable, constant, expression
 *            'pos'    = position within the record
 *            'format' = Progress format mask.
 *
 *  Notes:
 *      Do not add a 'skip' to the put statement as the main program
 *      will do this on return.
 *
 *      Be explicit with position and format.  Do not let these
 *      default as dictionary changes in later releases may cause
 *      data alignment problems.
 *
 *
 *  
 *  To create new records:
 *
 *  Issuing a 'put skip.' statement will close the existing record.
 *
 *  A new record can then be created using the logic above for extending
 *  an existing record with the starting position set to '1' and
 *  incrementing from there.
 *
 *  Heed the notes above and do not put a 'skip' on the last record
 *  created as the main program will do this.
 *
 *
 *  Standards:
 *
 *  To achieve consistency with standard output formats, you should
 *  ensure that your code conforms to the conventions illustrated in
 *  the sample code below.  Note the format for dates 'yyyymmdd',
 *  quantities, prices etc and the convention of commenting each line
 *  so that subsequent maintenance is made easier.
 *
 *
 *             /* line detail records */
 *       put
 *      "B"         at 1    format "x"  /* type "B"   */
 *      sod_line        at 2    format ">>9"    /* line number*/
 *              sod_part        at 5    format "x(18)"  /* item number*/
 *              sod_taxable     at 23   format "yes/no" /* taxable    */
 *      year(sod_due_date)  at 26   format "9999"   /* due date   */
 *      month(sod_due_date) at 30   format "99"
 *      day(sod_due_date)   at 32   format "99"
 *              sod_qty_inv     at 34   format "->>>>>>>>9.999999999"
 *                              /* qty inv */
 *      qty_bo          at 54   format "->>>>>>>>9.999999999"
 *                              /* qty b/o */
 *              sod_um          at 74   format "x(2)"   /* uom     */
 *              sod_price       at 76   format "->>>>>>>>9.99999"
 *                              /* price */
 *              ext_price       at 92   format "->>>>>>>>9.99999"
 *                              /* line value */
 *      sod_site        at 108  format "x(8)"   /* site */
 *      sod_custpart        at 116  format "x(30)"  /* cust item  */
 *      desc1           at 146  format "x(24)"  /* item desc 1*/
 *      desc2           at 170  format "x(24)"  /* item desc 2*/
 *      sod_disc_pct        at 194  format "->>9.99"
 *                              /* disc %     */
 *      sod_list_pr     at 201  format "->>>>>>>>9.99999"
 *                              /* list price */
 *      sod_pr_list     at 217  format "x(8)"   /* price list */
 *      skip.
 *
 ******************************************************************************/


/* start of new code >> */



/* end of new code << */
