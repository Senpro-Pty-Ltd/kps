/* xf10h09mp.i - FORMTRAP INCLUDE FILE                                        */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 07/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

put stream ft
   {us/xf/xfputc.i "'P'"            1  1                       }  /* type "p" */
   {us/xf/xfput.i t_tr_serial       2  "x(18)"                 }  /* lot/serial */
   {us/xf/xfput.i lotserial_total   20 "->>>>>>>>9.999999999"  }  /* quantity */
.

if t_tr_expire <> ? then
   put stream ft
      {us/xf/xfputd.i t_tr_expire 40} /* expire date*/
   .

put stream ft
   {us/xf/xfput.i t_tr_ref 48 "x(8)"} /* reference*/
skip.
