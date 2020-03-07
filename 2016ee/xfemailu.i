/* xfemailu.i - FORMTRAP EMAIL ADDRESS MANIPULATION INCLUDE FILE - 60 CHARS */
/* Copyright 1986-2015 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* REVISION: QAD2016EE   CREATED: 07/04/2015   BY  *sxh   */
/* Description: Formtrap Datastream for QAD2014EE                   */

/****************************************************************************/
/* {1} - stream name eg. stream ft                                          */

/* Output to stream ft                                             */

/*Valid Forms Are  */
/*FT_INVOICE       */
/*FT_PO            */
/*FT_SO            */
/*FT_DO            */
/*FT_SHIPPER      */
/*FT_QUOTE        */
/*FT_PACKLIST     */

for first usr_mstr no-lock where usr_userid = global_userid:
       put {1}
      {us/xf/xfput.i usr_mail_address  1064 "x(60)" }
      {us/xf/xfput.i usr_name  1124 "x(40)" }
      {us/xf/xfput.i global_domain  1164 "x(8)" }
      .
end.
