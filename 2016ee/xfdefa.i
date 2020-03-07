/* xfdefa.i - FORMTRAP PRELIMINARY INCLUDE FILE                               */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

define {1} shared variable rolladdr  like mfc_logical no-undo.
define {1} shared variable showcntry like mfc_logical no-undo.
define {1} shared variable found_addr like mfc_logical no-undo.

define {1} shared stream ft.

/*
*        function ftout return logical (input parm1 as char,
*                                       input pos1  as int,
*                                       input fmt1  as char).
*
*           define variable fttmpval as character no-undo.
*
*           assign fttmpval = right-trim(trim(parm1)) no-error.
*
*           if fttmpval = "skip" then
*              put stream ft unformatted skip.
*           else
*              put stream ft unformatted fttmpval at pos1 format fmt1.
*
*        end function. /*ftout*/
*/   
