/* xfrpcar9.p - Print Carrier Information for structures using abs_mstr  */
/* rcrpcar.p - Print Carrier Information for structures using abs_mstr  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfrpcar9.p,v 1.2 2018/03/13 17:09:36 gbg Exp $: */

/* REVISION: 8.6          CREATED: 10/17/96      BY: *K003* Vinay Nayak-Sujir */
/* REVISION: 8.6      LAST MODIFIED: 02/04/97    BY: *K05Q* Vinay Nayak-Sujir */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98    BY: *L007* A. Rahane         */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98    BY: *K1Q4* Alfred Tan        */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98    BY: *J314* Alfred Tan        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00    BY: *N08T* Annasaheb Rahane  */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00    BY: *N0KP* myb               */
/* Revision: 1.7.1.4      BY: Paul Donnelly (SB)  DATE: 06/28/03  ECO: *Q00K* */
/* $Revision: 1.2 $   BY: Jean Miller         DATE: 11/12/08  ECO: *R15M* */
/* Revision: eB3SP5       BY: Prasannan S         DATE: 17/09/10  ECO: *eb3sp5**/
/* Revision: QAD2012.1    BY: Steve Hong      DATE: 23/10/12  ECO: *93sp12.1  */

/*-Revision end---------------------------------------------------------------*/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

/*eb3sp5 BEGIN*/
{us/so/sofs9pu.i}
{us/xf/xfdefa.i}
{us/xf/xfsofm09v.i}
/*eb3sp5 END*/

define input parameter absid like abs_id no-undo.
define input parameter column_pos as integer no-undo.

define new shared variable addr as character format "x(38)" extent 6.

define variable company as character format "x(38)" extent 6 no-undo.
define variable addrline as character label "Address"
  format "x(38)" no-undo.
define variable ctr as integer no-undo.

form
   absc_seq
   absc_carrier
   addrline
with frame carr_info down.

/* SET EXTERNAL LABELS */
setFrameLabels(frame carr_info:handle).

frame carr_info:column = column_pos.

if can-find (first absc_det where absc_det.absc_domain = global_domain
                              and absc_abs_id = absid)
then do:

   for each absc_det where absc_det.absc_domain = global_domain
      and absc_abs_id = absid
   no-lock
   with frame carr_info:
     /*eb3sp5 DELETED
      display
         absc_seq
         absc_carrier.
      eb3sp5 DELETED*/
      find ad_mstr where ad_mstr.ad_domain = global_domain
         and ad_addr = absc_carrier
      no-lock no-error.

      if available ad_mstr then do:
         /*eb3sp5 DELETED
         /* Assign values to addr and format */
         {us/mf/mfadfmt.i}

         assign
            company[1] = addr[1]
            company[2] = addr[2]
            company[3] = addr[3]
            company[4] = addr[4]
            company[5] = addr[5]
            company[6] = addr[6].
         eb3sp5 DELETED*/
         {us/xf/xfaddr.i "company"} /*eb3sp5*/
      end. /* if available ad_mstr */

      do ctr = 1 to 6:

         if company[ctr] <> "" then do:
        /*eb3sp5 DELETED
            if ctr = 1 then
               display
                  absc_seq
                  absc_carrier
                  company[1] @ addrline.
            else
               display
                  "" @ absc_seq
                  "" @ absc_carrier
                  company[ctr] @ addrline.
            down.
         eb3sp5 DELETED*/
         end.

      end.

      {us/xf/xfrcrpmc.i} /*eb3sp5*/
      /*down 1. eb3sp5*/

      assign
         addr = ""
         company = "".

   end. /* for each absc_det */

end. /* if can-find absc_det  */
