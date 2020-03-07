/* xfpkg09a.p - Sales order packing list print                               */
/* sopkg01a.p - Sales order packing list print                               */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfpkg09a.p,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/*V8:ConvertMode=NoConvert                                                   */
/*K1Q4*/ /*V8:RunMode=Character,Windows                                      */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K04X* Steve Goeke       */


/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00 BY: *N0KN* myb                 */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 30/10/12  ECO: *93sp12.1  */
         {us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

/* ********** Begin Translatable Strings Definitions ********* */

&SCOPED-DEFINE sopkg01a_p_1 "Qty Open!Qty to Ship"
/* MaxLen: Comment: */

/* ********** End Translatable Strings Definitions ********* */

         /* This is just a wrapper for sopkg01.p, which requires */
         /* that shared frame d to be defined before it is called. */

         /* INPUT PARAMETERS */
         define input parameter i_parent as character no-undo.
         define input parameter i_level  as integer   no-undo.
         define input parameter i_order  as character no-undo.
         define input parameter i_line   as integer   no-undo.

         /* LOCAL VARIABLES */
         define variable qty_open like sod_qty_ord
            column-label {&sopkg01a_p_1} format "->>>>>9.9<<<<<".

         /* FRAMES */
         define new shared frame d.

         {us/so/sopkf01.i}

         /* MAIN PROCEDURE BODY */

  /*93sp12.1       {us/bbi/gprun.i ""sopkg01.p"" "(i_parent, i_level, i_order, i_line)" } */
/*93sp12.1*/       {us/bbi/gprun.i ""xfpkg09.p"" "(i_parent, i_level, i_order, i_line)" } 

         /* END OF MAIN PROCEDURE BODY */
