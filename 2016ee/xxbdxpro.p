/* xxbdxpro.p - CIM - background processor                               */
/* COPYRIGHT qad.inc. ALL RIGHTS RESERVED. THIS IS AN UNPUBLISHED WORK. */
/*F0PN*/ /*V8:ConvertMode=Maintenance                                   */
/* REVISION: 8.6      LAST MODIFIED:  06/05/98  BY: kzn *CA329264*      */
/* 1.0     09-Jan-2009	C1112  Upgrade 2008        gbg  */
/* Everhard upgrade  LAST MODIFIED: FEB-2008    BY: gbg *q3301*               */
/* ONE HARVEST   LAST MODIFIED: 10-Mar-2009   BY: gbg *c1116*                 */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB    LAST MODIFIED: 19-AUG-2010    BY:  gbg *CA839672*                  */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB    LAST MODIFIED: 22-SEP-2011    BY:  gbg *c1244*                     */
/* CYB    LAST MODIFIED: 22-SEP-2011    BY:  gbg *c1245*                      */
/* CYB    LAST MODIFIED: 29-JUL-2011    BY:  gbg *cy1021*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
         
/************************************************************************
 *
 *
 *        Input Parameters:
 *                datasource       = input source
 *                group_list       = list of group numbers (comma delimited)
 *                undo_on_error    = undo transaction if errors
 *                undo_on_warn     = undo transaction if warnings
 *                
 *        Output Parameters:
 *                progress_errors  = count of Progress errors
 *                function_errors  = count of function errors
 *                function_warnings= count of function warnings
 *
 ************************************************************************/
         define input  parameter        datasource          as char        no-undo.
         define input  parameter        group_list          as char        no-undo.
         define input  parameter        undo_on_error          as log        no-undo.
         define input  parameter        undo_on_warn          as log        no-undo.
         define output parameter        progress_errors          as int        no-undo.
         define output parameter        function_errors          as int        no-undo.
         define output parameter        function_warnings as int        no-undo.

         {us/bbi/mfdeclre.i}

         def var linedata              as char                no-undo.
         def var i                     as int                no-undo.
         def var lastexecname          as character        no-undo.
         def var current_bdl_source    like bdl_source        no-undo.
         def var current_bdl_id        like bdl_id        no-undo.
         def var work_i_file           as char                no-undo.
         def var work_o_file           as char                no-undo.
         def var go_on                 like mfc_logical        no-undo init yes.
         def var lastbatchrun          like batchrun        no-undo.
         def var start_time            as char                no-undo.
         def var start_date            as date                no-undo.
         def var group_id              like bdl_id        no-undo.
         def var line_no               as int                no-undo.

         def temp-table group_mstr no-undo
            field group_group_id        like bdl_id
            field group_exec            like bdl_exec
            field group_date            as date
            field group_time            as char
            field group_progress_errors as int
            field group_function_errors as int.

         def temp-table error_det no-undo
            field error_group_id like bdl_id
            field error_linedata like linedata.

         assign
            lastexecname = execname
            lastbatchrun = batchrun.
         outer_block:
         do /* transaction */ on error undo, leave:
            mainloop:
            do i = 1 to num-entries(group_list) on error undo, leave:
               create group_mstr.
               assign
                  group_id    = integer(entry(i,group_list))
                  work_i_file = "x" + datasource + "x" + entry(i,group_list) + ".bpi"
                  work_o_file = "x" + datasource + "x" + entry(i,group_list) + ".bpo"
                  group_group_id = group_id
                  group_date = today
                  group_time = string(time,"HH:MM:SS").

               find bdl_mstr where 
/*q3301*/                      bdl_domain = global_domain and
	                       bdl_source = datasource
                               and bdl_id     = group_id
                        no-lock no-error.

               if not available bdl_mstr then do:
                  create error_det.
                  assign
                     group_function_errors = 1
                     function_errors       = function_errors + 1
                     error_group_id        = group_group_id
                     error_linedata  = "ERROR: " +
                                       "bdl_mstr record not found for Group " +
                                       string(group_id,"99999999").
                  next mainloop.
               end.
           
            assign
                  current_bdl_source = bdl_source
                  current_bdl_id     = bdl_id
                  lastexecname       = execname
                  execname           = bdl_exec
                  group_exec         = bdl_exec.

               output to value(work_i_file).
               for each bdld_det no-lock
                where 
/*q3301*/              bdld_domain = global_domain and
		       bdld_source = current_bdl_source
                  and bdld_id     = current_bdl_id:
                   if bdld_data = "" then
                      put skip(1).
                   else
                      put unformatted bdld_data skip.
               end.

               output close.
               {us/bbi/gprun.i ""mgbdpro1.p"" "(input execname, output go_on)"}
               if go_on then do:

                  input from value(work_i_file) no-echo.
                  output to value(work_o_file).

 /* Setup dtitle for callable program for reports that use it, */
 /* ours won't be messed up since output is redirected.        */

                  find first mnd_det where mnd_exec = execname
                     no-lock no-error.

 /* in case no menu detail use progname */
 /* Build dtitle from menu detail       */
                  dtitle = lc(execname).
                  {us/xx/xxmenu.i}
                  batchrun = yes.

                  pause 0 before-hide.
                  do on error undo, leave on endkey undo, leave:
                     {us/bbi/gprun.i ""gpwinrun.p"" "(execname, 'CIM', '', '')"}.
                  end.
                  batchrun = lastbatchrun.
                  pause before-hide.

                  output close.
                  input close.
                  execname = lastexecname.
                  /* Now let's look for errors in the function output file */

                  input from value(work_o_file) no-echo.
                  repeat:

                     import unformatted linedata.
                     /* Output error lines to temp table */
                     if linedata begins "**"
                     or linedata begins "WARNING: "
                     or linedata begins "ERROR: " then do:
                        create error_det.
                        assign
                           error_group_id = group_group_id
                           error_linedata = linedata.
                     end.

                    /* Count warning/error messages by type */
                    /* Progress err 132 indicates duplicate key */
                    if linedata begins "**" then do:
                       if ( linedata matches("*tr_hist*")
                         and linedata matches("*(132)") )
                       or ( linedata matches("*op_hist*")
                         and linedata matches("*(132)") )
                       then
                         function_warnings = function_warnings + 1.
                       else do:
                         progress_errors = progress_errors + 1.
                         group_progress_errors = group_progress_errors + 1.
                       end.
                    end.
                    else
                    if linedata begins "WARNING: " then
                      function_warnings = function_warnings + 1.
                    else
                    if linedata begins "ERROR: " then do:
                      function_errors = function_errors + 1.
                      group_function_errors = group_function_errors + 1.
                    end.
                  end. /* error file */

                  input close.
                  output close.
               end.  /* if go_on then do: */
               else do:
                  create error_det.
                  assign
                     group_function_errors = 1
                     function_errors = function_errors + 1
                     error_group_id  = group_group_id
                     error_linedata  = "ERROR: Could not find process to run".
               end.
            end. /* mainloop */
            /* set processed flag */
            {us/bbi/gprun.i ""xxbdldc.p""
                     "(datasource,
                       group_list,
                       today,
                       string(time, 'HH:MM:SS'))"}
            /* test for errors and undo if required */
            if (undo_on_error and progress_errors + function_errors > 0) or
               (undo_on_warn and function_warnings > 0) then
               undo outer_block, leave outer_block.
          end. /* outer_block */


         /* remove the temporary input and output files */
         if not can-find(first code_mstr where code_domain = global_domain
                         and code_fldname = "cimdebug"
                         and code_value = "on")
         then do:
         {us/bbi/gpfildel.i &filename = work_i_file}
         {us/bbi/gpfildel.i &filename = work_o_file}
         end.
         /*  update batch masters and usrw_wkfl with errors  */
         for each group_mstr:
            find bdl_mstr exclusive where
/*q3301*/        bdl_domain = global_domain and
                 bdl_source = datasource
                 and bdl_id = group_group_id.

            /*** Conor
            if available bdl_mstr then
               assign
                  bdl_date_pro = group_date
                  bdl_time_pro = group_time
                  bdl_pgm_errs = group_function_errors
                  bdl_pro_errs = group_progress_errors.
            *****/
            find last bdld_det where 
/*q3301*/        bdld_domain = global_domain and
            bdld_source = bdl_source and
            bdld_id = bdl_id no-lock no-error.
            assign line_no = 
               (if avail bdld_det then bdld_line else 100).
            for each error_det where error_group_id = group_group_id:
               create bdld_det.
               assign
/*q3301*/         bdld_domain = global_domain
                  line_no     = line_no + 1
                  bdld_source = bdl_source
                  bdld_id     = bdl_id
                  bdld_line   = line_no
                  bdld_data   = error_linedata.
               find first usrw_wkfl exclusive-lock
	       where 
/*q3301*/            usrw_domain = global_domain and
	             usrw_key1 = "CIM_OUT" + string(bdl_id, "99999999")
	       and   usrw_key2 = string(line_no, "99999999")
	       no-error.
	       if not available usrw_wkfl
	       then do:
                   create usrw_wkfl.
	           assign
/*q3301*/          usrw_domain = global_domain
	           usrw_key1 = "CIM_OUT" + string(bdl_id, "99999999")
	           usrw_key2 = string(line_no, "99999999").
	       end.
	       assign
	       usrw_datefld[1] = today
	       usrw_charfld[1] = error_linedata.
            end.
         end.




/*debug* >> */
procedure logit.
define input parameter ipmsg as char.
  output to gbglog append.
  put unformatted
  string(today) ":"
  string(time, "HH:MM:SS") ":"
  global_userid ":"
  ipmsg
  skip.
  output close.
end.
/*debug* << */
