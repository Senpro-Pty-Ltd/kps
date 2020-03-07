/* xfsol09m9a.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE               */
/*****************************************************************************/

if in_qad_charfld_9 <> "" then
         put stream ft  in_qad_decfld_1 / decimal(in_qad_charfld_11)
                         at 54 format "->>>>>>>>9.999999999".
      else if l_create_um then
         put stream ft  in_qad_decfld_1 / in_sod_um_conv
                         at 54 format "->>>>>>>>9.999999999".
      else
         put stream ft  in_qad_decfld_1 at 54 format "->>>>>>>>9.999999999".
      if in_qad_charfld_9 <> "" then
         put stream ft  in_qad_charfld_10  at 74 format "x(2)".
      put stream ft  in_qad_charfld_5 at 78 format "x(8)".

  /*93sp12.1*/
      put stream ft in_sod_contr_id at 86 format "x(30)".

