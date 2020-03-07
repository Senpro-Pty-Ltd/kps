/* xfemail8.i - FORMTRAP EMAIL ADDRESS MANIPULATION INCLUDE FILE - 60 CHARS */
/* Copyright 1986-2015 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* REVISION: QAD2014EE   CREATED: 07/04/2015   BY  *sxh   */
/* Description: Formtrap Datastream for QAD2014EE                   */

/****************************************************************************/
/* {1} - C or D                                */
/* {2} - variable name eg. field for ad_addr                                */
/* {3} - Form Name                                                          */
/* {4} - stream name eg. stream ft                                          */

/* Data maintained in xfemmt3.p                                             */

/*Valid Forms Are  */
/*FT_INVOICE       */
/*FT_PO            */
/*FT_SO            */
/*FT_SHIPPER      */
/*FT_QUOTE        */
/*FT_PACKLIST     */

   for first BusinessRelation where BusinessRelation.BusinessRelation_id
         = {1} and BusinessRelationIsActive = yes no-lock :

         for each address of BusinessRelation no-lock,
            first AddressType of Address where 
               AddressTypeCode = "{2}" and 
               AddressTypeIsActiv = yes no-lock :

            put stream ft 
            {us/xf/xfput.i AddressEMail 1024 "x(40)" }  /*Email Addr*/
            .
         end.
         if not available AddressType then do :
            for each address of BusinessRelation no-lock,
                first AddressType of Address where 
                  AddressTypeCode = "HEADOFFICE" and 
                  AddressTypeIsActiv = yes no-lock :

               put stream ft 
                 {us/xf/xfput.i AddressEMail 1024 "x(40)" }  /*Email Addr*/
                  .
           end.
         end.

   end. /* for first*/

   for first usr_mstr no-lock where usr_userid = global_userid:
       put stream ft
      {us/xf/xfput.i usr_mail_address  1064 "x(60)" }
      {us/xf/xfput.i usr_name  1124 "x(40)" }
      {us/xf/xfput.i global_domain  1164 "x(8)" }
      .
   end.
