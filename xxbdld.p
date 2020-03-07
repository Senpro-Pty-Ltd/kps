/* xxbdld.p - CIM - write bdld_det records                              */
/* COPYRIGHT qad.inc. ALL RIGHTS RESERVED. THIS IS AN UNPUBLISHED WORK. */
/*F0PN*/ /*V8:ConvertMode=Maintenance                                   */
/* REVISION: 8.5      LAST MODIFIED:  26/03/98  BY: kzn *CA329264*      */
/* 1.0     09-Jan-2009	C1112  Upgrade 2008        gbg  */
/* Everhard upgrade  LAST MODIFIED: FEB-2008    BY: gbg *q3301*               */
/* ONE HARVEST   LAST MODIFIED: 10-Mar-2009   BY: gbg *c1116*                 */
/* CYB    LAST MODIFIED: 14-JUN-2010    BY:  gbg *q9021*cy1020*              */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
         
/************************************************************************
 *
 *	A record is created in bdld_det for each 'line' of CIM data.
 *	A line of CIM data corresponds to an update group within the
 *	application program screen.
 *
 *	Input Parameters:
 *		datasource       = input source
 *		group_id         = group number for this process
 *		linedata         = a line of data in CIM input format
 *		
 *	Input-output Parameter:
 *		line_no          = unique line number within group
 *				   (initially pass zero. line increments
 *				    before writing record)
 *
 *	Output Parameters:
 *		error_ind        = error flag
 *		error_msg        = error message (if errors)
 *
 ************************************************************************/
 {us/bbi/mfdeclre.i}
	 define input  parameter	datasource	as char	no-undo.
	 define input  parameter	group_id  	as int 	no-undo.
	 define input  parameter	linedata       	as char	no-undo.
	 define input-output parameter	line_no   	as int 	no-undo.
	 define output parameter	error_ind	as log	no-undo.
	 define output parameter	error_msg	as char	no-undo.

         assign
	    error_ind = true
	    error_msg = "ERROR: " + program-name(1) + " - ".

         do on error undo, leave:
	    create bdld_det.
	    assign
/*q3301*/      bdld_domain = global_domain
	       line_no     = line_no + 1
	       bdld_source = datasource
	       bdld_id     = group_id
	       bdld_line   = line_no
	       bdld_data   = linedata
	       error_ind   = false
	       error_msg   = "".

	 end.
