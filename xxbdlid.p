/* xxbdlid.p - CIM - obtain next Group Id and create bdl_mstr record    */
/* COPYRIGHT qad.inc. ALL RIGHTS RESERVED. THIS IS AN UNPUBLISHED WORK. */
/*F0PN*/ /*V8:ConvertMode=ConditionalIncludeExclude                     */
/* REVISION: 8.5      LAST MODIFIED:  26/03/98  BY: kzn *CA329264*      */
/* REVISION: 8.6      LAST MODIFIED:  19/06/98  BY: kzn *CA341087*      */
/* REVISION: 8.6      LAST MODIFIED:  10/08/98  BY: gbg *CA355051*      */
/* 1.0     09-Jan-2009	C1112  Upgrade 2008        gbg  */
/* Everhard upgrade  LAST MODIFIED: FEB-2008    BY: gbg *q3301*               */
/* ONE HARVEST   LAST MODIFIED: 10-Mar-2009   BY: gbg *c1116*                 */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
         
/************************************************************************
 *
 *	Input Parameters:
 *		datasource       = input source
 *		function_to_run  = MFG/PRO program to process the data
 *		
 *	Output Parameters:
 *		group_id         = next available group number
 *		error_ind        = error flag
 *		error_msg        = error message (if errors)
 *
 ************************************************************************/
 {us/bbi/mfdeclre.i}

	 define input  parameter	datasource	as char	no-undo.
	 define input  parameter	function_to_run	as char	no-undo.
	 define output parameter	group_id	as int	no-undo.
	 define output parameter	error_ind	as log	no-undo.
	 define output parameter	error_msg	as char	no-undo.

         define variable next_id    like bdl_id.

         define buffer bdl_next_id for bdl_mstr.

         assign
	    error_ind   = true
	    error_msg   = "ERROR: " + program-name(1) + " - ".

         do transaction on error undo, leave:
            find last bdl_next_id where
/*q3301*/   bdl_next_id.bdl_domain = global_domain and
            bdl_next_id.bdl_source >= "" and
            bdl_next_id.bdl_id     >= 0
            exclusive-lock no-error.
            if available bdl_next_id then
               next_id = bdl_next_id.bdl_id + 1.
            else
               next_id = 1.



/*355015*/  do while can-find(first bdl_mstr 
/*355015*/                    where
/*q3301*/                          bdl_mstr.bdl_domain = global_domain and
/*355015*/                          bdl_mstr.bdl_source = ""
/*355015*/                    and   bdl_mstr.bdl_id     = next_id):
/*355015*/       next_id = next_id + 1.
/*355015*/  end.

/*nac*/     do while can-find(first usrw_wkfl 
/*nac*/              where 
/*q3301*/                    usrw_domain = global_domain and
/*nac*/                    usrw_key1 = "CIM_OUT" + string(next_id,"99999999")):
/*nac*/         next_id = next_id + 1.
/*nac*/     end.

            create bdl_mstr.
            assign
/*q3301*/          bdl_mstr.bdl_domain   = global_domain
                   bdl_mstr.bdl_source   = ""
                   bdl_mstr.bdl_id       = next_id
                   bdl_mstr.bdl_exec     = function_to_run
                   bdl_mstr.bdl_date_ent = today
                   bdl_mstr.bdl_time_ent = string(time,"HH:MM:SS").

	    assign
	       group_id  = bdl_mstr.bdl_id
	       error_ind = false
	       error_msg = "".
         end.
         release bdl_next_id.
         release bdl_mstr.
