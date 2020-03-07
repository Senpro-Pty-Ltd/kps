/* xfsol09a.i FORMTRAP Include file              */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                      */
/* All rights reserved worldwide.  This is an unpublished work.             */
/*V8:ConvertMode=Report                                                     */
/* QAD01             BY: Geogy P.             DATE: 09/23/2010    *QAD10003 */
/* Modified by: Sandeep BS(s6b)               Date: 06/21/12 ECO: *S6B01*     */
/* Description: Formtrap Datastream migration to QAD 2012.1EE                 */
/*****************************************************************************/

/* GET WORKING RECORDS FOR THIS WORKFILE RECORD */
     find so_mstr where so_domain = global_domain and 
                        so_nbr = qad_charfld[7] no-lock.

     /* SET ADDRESS FOR PRINTING */
     if so_nbr <> old_sod_nbr then do:
  
        assign soship = so_ship
        shipto = "".

        find ad_mstr where ad_domain = global_domain and
	                    ad_addr = so_ship no-lock no-error.
        if available ad_mstr then do:

            assign   shipto[1] = ad_name
                     shipto[2] = ad_line1
                     shipto[3] = ad_line2
                     shipto[4] = ad_line3
                     shipto[5] = ""
                     shipto[6] = ad_country
                     shipto_city = ad_city
                     shipto_state = ad_state
                     shipto_zip = ad_zip
                     shipto_fax = ad_fax
                     shipattn = ad_attn
                     shipphn = ad_phone.
         end.

      end.  /* IF SO_NBR <> OLD_SO_NBR */

      billto = "".

      find ad_mstr where ad_domain = global_domain and 
                         ad_addr = so_bill no-lock no-error.
      if available ad_mstr then do:

         assign      billto[1] = ad_name
                     billto[2] = ad_line1
                     billto[3] = ad_line2
                     billto[4] = ad_line3
                     billto[5] = ""
                     billto[6] = ad_country
                     billto_city = ad_city
                     billto_state = ad_state
                     billto_zip = ad_zip
                     billto_fax = ad_fax.
      end.
      
