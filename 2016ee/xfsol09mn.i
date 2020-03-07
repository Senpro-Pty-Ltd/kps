/* xfsol09mn.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: sxh             DATE: 16/05/16    * */
/* Description: Formtrap Datastream migration to QAD 2016EE                */
/*****************************************************************************/

 put stream ft 
                   "N"         at 1  format "x(1)"     /* Record Type M*/
                   fPack at 2 format "x(40)" 
                   fPackNum at 52 format "x(40)" skip.
