/* xfworlbmsg.i FORMTRAP Include file                                         */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Shridhar M         DATE: 02/12/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */

if available msg_mstr then
   put stream ft msg_desc          at 74    format "x(64)".  /* message */
