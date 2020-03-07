/* xfaddr.i - FORMTRAP ADDRESS MANIPULATION INCLUDE FILE                      */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/* Revision: QAD2012.1    BY: Steve Hong        DATE: 07/10/12  ECO: *93sp12.1   */
/*V8:ConvertMode=Report                                                       */

assign
   addr[1] = ad_mstr.ad_name
   addr[2] = ad_line1
   addr[3] = ad_line2
   addr[4] = ad_line3
   addr[5] = ""
   addr[6] = ad_country.

/*Remove blank lines if flag set*/
if rolladdr
then do :
   {us/mf/mfcsz.i addr[5] ad_city ad_state ad_zip}
   {us/bbi/gprun.i ""gpaddr.p"" }
end. /*if rolladdr*/

assign
   {1}[1] = addr[1]
   {1}[2] = addr[2]
   {1}[3] = addr[3]
   {1}[4] = addr[4]
   {1}[5] = addr[5]
   {1}[6] = addr[6]
   {1}_city = ad_city
   {1}_state = ad_state
   {1}_zip = ad_zip
   {1}_fax = ad_fax.
