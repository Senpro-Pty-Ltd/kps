/* xxfscaiv02.p  -  CALL INTERVENTION  REPORT                                 */
/* fscaiv02.p  -  CALL INTERVENTION  REPORT                                   */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxfscaiv02.p,v 1.2 2018/03/13 17:09:57 gbg Exp $: */
/*  REVISION: 7.3      LAST MODIFIED: 01/05/93   BY: sas *G547*               */
/*  REVISION: 7.3      LAST MODIFIED: 03/21/93   BY: sas *G837*               */
/*  REVISION: 7.3      LAST MODIFIED: 05/12/94   BY: gcs *GJ82*               */
/*  REVISION: 7.3      LAST MODIFIED: 05/12/94   BY: gcs *FO05*               */
/*  REVISION: 7.3      LAST MODIFIED: 01/06/95   BY: smp *G0B6*               */
/*  REVISION: 7.3      LAST MODIFIED: 01/09/95   BY: smp *G0BR*               */
/*  REVISION: 8.5      LAST MODIFIED: 04/07/95   BY: *J04C* Sue Poland        */
/*  REVISION: 8.5      LAST MODIFIED: 06/21/95   BY: *G0MG* Sue Poland        */
/*  REVISION: 8.5      LAST MODIFIED: 12/11/95   BY: *G0S1* Sue Poland        */
/*  REVISION: 8.5      LAST MODIFIED: 02/21/96   BY: *J04C* Markus Barone     */
/*  REVISION: 8.5      LAST MODIFIED: 01/21/97   BY: *J1B6* Markus Barone     */
/*  REVISION: 8.5      LAST MODIFIED: 11/07/97   BY: *J25P* Surekha Joshi     */
/*  REVISION: 8.6      LAST MODIFIED: 01/08/98   BY: bvm *K1FD*               */
/*  REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane         */
/*  REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan        */
/*  REVISION: 8.6E     LAST MODIFIED: 06/08/98   BY: *K1RF* A.Shobha          */
/*  REVISION: 8.6E     LAST MODIFIED: 08/06/98   BY: *J2VQ* Rajesh Talele     */
/*  REVISION: 9.0      LAST MODIFIED: 11/09/98   BY: *M00R* Markus Barone     */
/*  REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan        */
/*  REVISION: 9.0      LAST MODIFIED: 12/24/99   BY: *L0MZ* Sachin Shinde     */
/*  REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane  */
/*  REVISION: 9.1      LAST MODIFIED: 04/18/00   BY: *N07D* Annasaheb Rahane  */
/*  REVISION: 9.1      LAST MODIFIED: 08/14/00   BY: *N0L0* Jacolyn Neder     */
/* Old ECO marker removed, but no ECO header exists *F0PN*                    */
/* Old ECO marker removed, but no ECO header exists *G458*                    */
/* Revision: 1.24     BY: Murali Ayyagari    DATE: 07/05/01 ECO: *N0ZY*       */
/* Revision: 1.25     BY: Mamata Samant      DATE: 02/22/02 ECO: *N19W*       */
/* Revision: 1.27     BY: Paul Donnelly (SB) DATE: 06/26/03 ECO: *Q00C*       */
/* Revision: 1.28         BY: Rajinder Kamra      DATE: 07/08/03  ECO: *Q00X* */
/* Revision: 1.29         BY: Xiaolei Meng        DATE: 01/15/08  ECO: *R0LC* */
/* Revision: 1.31         BY: Jean Miller         DATE: 12/02/08  ECO: *R15M* */
/* Revision: 1.32         BY: Anish Mandalia      DATE: 03/30/10  ECO: *R1Z5* */
/* $Revision: 1.2 $      BY: Tony Brooks         DATE: 07/11/10  ECO: *R230* */
/* CYB    LAST MODIFIED: 23-Sep-2010    BY:  nac *cy1028*                    */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*i         */
/*-Revision end---------------------------------------------------------------*/


/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */

define input     parameter ca_recno       as   recid.
define input     parameter include-bom    like mfc_logical.
define input     parameter open-date      like ca_opn_date.
define input     parameter displaytz      like tzo_label.

define new shared variable billto         as character format "x(38)" extent 6.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
define new shared variable shipto         as character format "x(38)" extent 6.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

define new shared variable addr           as character format "x(38)" extent 6.
define new shared variable fname          like lngd_dataset no-undo
   initial "rmdtype".
define variable            lng_desc       like lngd_translation.

define     shared variable eventdate      like ca_evt_date.
define     shared variable eventtime      as   character format "xx:xx".
define     shared variable statusdate     like ca_nxt_date.
define     shared variable statustime     as   character format "xx:xx".

define variable nolines        as   integer initial 10.
define variable pages          as   integer.
define variable i              as   integer.
define variable typdesc        like pt_desc1.
define variable prodesc        like pt_desc1.
define variable resdesc        like pt_desc1.
define variable partdesc       like pt_desc1.
define variable aname          like pt_desc1.
define variable quedesc        like pt_desc1.
define variable statdesc       like pt_desc1.
define variable nxtdesc        like pt_desc1.
define variable part           as character format "x(18)"
   label  "Item".
define variable pqty           like  sod_qty_ord.
define variable pprice         like  sod_price.
define variable caprefix       as    character initial "CA".
define variable customer_nbr   like eu_cm_nbr.
define variable ship-label     as   character format "x(24)".
define variable receive-label  as   character format "x(24)".
define variable iss-rec        as   character
   format "x(1)" label "I/R".
define variable eutz           like tzo_label.
define variable eulabel        as   character format "x(12)".
define variable tzlabel        as   character format "x(10)".
define variable undo-all       like mfc_logical.
define variable c-desc-label as character no-undo
   format "x(12)".

/* -------- BEGIN SET INITIAL VALUES ------------ */
assign
    ship-label    = getTermLabelRt("QUANTITY_SHIPPED",23)
    receive-label = getTermLabelRt("QUANTITY_RECEIVED",23)
    eulabel       = getTermLabel("END_USER_TIME_ZONE",11) + ":"
    tzlabel       = getTermLabel("REPORT_TIME_ZONE",9) + ":"
    c-desc-label  = getTermLabelRtColon("DESCRIPTION",12).
/* -------- END SET INITIAL VALUES ------------ */

define            buffer   camstrl        for  ca_mstr.

/*cy1028>>*/
define variable cusname as character format "x(28)".
define variable doctype as character format "x(15)" 
                                   initial "JOB SHEET".
define variable fax as character format "x(16)".
define variable email as character format "x(40)".
{us/xf/xfdefa.i } /*eb3sp5*/
{us/xf/xfso10v.i } /*eb3sp5*/
/*cy1028<<*/

{us/fs/fscont.i new new}
{us/fs/fsconst.i}

form
   ca_name            colon 12
   ca_phone
   c-desc-label       to 12 no-label
   ca_desc                        no-label
   skip
   ca_po_nbr          colon 12
   isb_warr_cd        colon 66
   ca_int_type        colon 12    label "Work Code"
   isb_ins_date       colon 66
   ca_severity        colon 12
   isb_warr_exp       colon 66
   ca_type            colon 12
   typdesc                        no-label
   contract           colon 66    label "Contract"
   ca_problem         colon 12
   prodesc                        no-label
   ctr_start          colon 66
   ca_resolve         colon 12
   resdesc                        no-label
   ctr_end            colon 66
   ca_assign          colon 12
   aname                          no-label
   ca_pri             colon 12
   eulabel                        no-label
   eutz                           no-label
   skip
   tzlabel                        no-label
   displaytz                      no-label
   ca_status          colon 12
   statdesc                       no-label
   eventdate          colon 66
   ca_que             colon 12
   quedesc                        no-label
   eventtime          colon 66    label "Event Time"
   ca_nxt_act         colon 12
   nxtdesc                        no-label
   statusdate         colon 66
   ca_area            colon 12
   statustime         colon 66    label "Next Status Time"
with frame detail width 90 side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame detail:handle).

form
   itm_line
   ca_part
   ca_serial
   ca_ref      format ">>>>>>>9"
   partdesc
with frame b down width 90.

/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).

form
   part    at 3
   partdesc
   pqty
   iss-rec
   pprice
with frame c down width 90.

/* SET EXTERNAL LABELS */
setFrameLabels(frame c:handle).

define variable vc_desc like code_cmmt no-undo.

form
   csd_problem
   vc_desc
with frame d down width 90.

/* SET EXTERNAL LABELS */
setFrameLabels(frame d:handle).

global_lngd_raw = no.

if not can-find(first sac_ctrl where sac_domain = global_domain )
then do on error undo, leave:
   create sac_ctrl.
   sac_domain = global_domain.
   if recid(sac_ctrl) = -1 then.
   release sac_ctrl.
end.  /* sac_ctrl */

find first sac_ctrl where sac_domain = global_domain no-lock no-error.

if not can-find(first svc_ctrl where svc_domain = global_domain )
then do on error undo, leave:
   {us/bbi/gprun.i ""fssvc.p""}
end.  /* svc_ctrl */
find first svc_ctrl where svc_domain = global_domain no-lock no-error.

if svc_multi_time_zones then
assign
   eulabel:column   = eventdate:column - 13
   eutz:column      = eventdate:column
   tzlabel:column   = eventdate:column - 11
   displaytz:column = eventdate:column.

prefix = sac_sa_pre.

find ca_mstr no-lock where recid(ca_mstr) = ca_recno no-error.

if not available ca_mstr then return.

assign
   customer_nbr = " ".

if available ca_mstr then do:

   find eu_mstr where eu_mstr.eu_domain = global_domain
      and eu_addr = ca_eu_nbr
   no-lock no-error.

   assign
      customer_nbr = ca_bill.
   if available eu_mstr and customer_nbr = " " then
      assign customer_nbr = eu_cm_nbr.
end.    /* IF AVAILABLE ca_mstr */

update billto = "".
for first cm_mstr where cm_mstr.cm_domain = global_domain
   and cm_addr = customer_nbr
no-lock: end.

if available cm_mstr
and cm_bill <> ""
then
   customer_nbr = cm_bill.

/*cy1028>>*/
if available cm_mstr then
   cusname = cm_sort.
else
   cusname = "".
/*cy1028<<*/

find ad_mstr where ad_mstr.ad_domain = global_domain
   and ad_addr = customer_nbr
no-lock no-error.

if available ad_mstr then do:

   /* Assign addr extents */
   {us/mf/mfadfmt.i}

/*cy1028>>*/
   {us/xf/xfaddr.i "billto"} /*eb3sp5*/
   assign addr[5]      = ""
          billto_city  = ad_city
          billto_state = ad_state
          billto_zip   = ad_zip.
/*cy1028<<*/

   billto[1] = addr[1].
   billto[2] = addr[2].
   billto[3] = addr[3].
   billto[4] = addr[4].
   billto[5] = addr[5].
   billto[6] = addr[6].
   billto[6] = addr[6].

end.

else
   assign billto[1] = getTermLabel("CUSTOMER_ADDRESS_NOT_FOUND",30).

update shipto = "".

if available eu_mstr then
   find ad_mstr where ad_mstr.ad_domain = global_domain
      and ad_addr = eu_addr
   no-lock no-wait no-error.
else do:
     {us/bbi/pxmsg.i &MSGNUM=3612 &ERRORLEVEL=1 &MSGBUFFER=shipto[1]}
end.

if available ad_mstr then do:

   /* Assign addr extents */
   {us/mf/mfadfmt.i}

/*cy1028>>*/
   {us/xf/xfaddr.i "shipto"} /*eb3sp5*/
   assign addr[5]      = ""
          shipto_city  = ad_city
          shipto_state = ad_state
          shipto_zip   = ad_zip.
/*cy1028<<*/

   shipto[1] = addr[1].
   shipto[2] = addr[2].
   shipto[3] = addr[3].
   shipto[4] = addr[4].
   shipto[5] = addr[5].
   shipto[6] = addr[6].
   eutz      = ad_timezone.

end.

else
   assign
      shipto[1] = getTermLabel("END_USER_ADDRESS_NOT_FOUND",30)
      eutz      = "".

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
if page-number > 0 then
   page.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

form header
   getTermlabelRtColon("CALL_ID",15)  to 15 format "x(15)"
   ca_nbr
   getTermlabelRtColon("CALL_DATE",15)  to 71 format "x(15)"
   open-date
   skip(1)
   (getTermlabel("BILL_TO",12)  + ": " + customer_nbr)
   at 8 format "x(22)"
   (getTermlabel("END_USER",12) + ": " + ca_eu_nbr)
   at 46 format "x(22)"
   billto[1]          at 8
   shipto[1]          at 46
   billto[2]          at 8
   shipto[2]          at 46
   billto[3]          at 8
   shipto[3]          at 46
   billto[4]          at 8
   shipto[4]          at 46
   billto[5]          at 8
   shipto[5]          at 46
   billto[6]          at 8
   shipto[6]          at 46
   skip(3)
with frame phead1 page-top width 90.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
view frame phead1.

put skip(1).
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

/***********************************************/
/*  GET ALL THE GENERALIZED CODE DESCRIPTIONS  */
/***********************************************/

find fct_mstr where fct_mstr.fct_domain = global_domain
   and fct_type = ca_type
no-lock no-error.

if available fct_mstr then
   typdesc = fct_desc.
else
   typdesc = "".

find code_mstr where code_mstr.code_domain = global_domain
   and code_fldname = "fsskill"
   and code_value   = ca_problem
no-lock no-error.

if available code_mstr then
   prodesc = code_cmmt.
else
   prodesc = "".

find code_mstr where code_mstr.code_domain = global_domain
   and code_fldname   = "ca_resolve"
   and code_value     = ca_resolve
no-lock no-error.

if available code_mstr then
   resdesc = code_cmmt.
else
   resdesc = "".

/* FULLY QUALIFY CAS_MSTR KEY TO PREVENT AMBIGUITY WITH SR STATUSES */
find cas_mstr where cas_mstr.cas_domain = global_domain
   and cas_status  = ca_status
   and cas_file_type = "C"
no-lock no-error.

if available cas_mstr then
   statdesc  = cas_desc.
else
   statdesc  = "".

find cas_mstr where cas_mstr.cas_domain = global_domain
   and cas_status  = ca_nxt_act
   and cas_file_type = "C"
no-lock no-error.

if available cas_mstr then
   nxtdesc  = cas_desc.
else
   nxtdesc  = "".

/* WITH THE 8.5 RELEASE, FILE-TYPE IS ALSO PART OF THE CAQ_MSTR KEY */
find caq_mstr where caq_mstr.caq_domain = global_domain
   and caq_que  = ca_que
   and caq_file_type = "C"
no-lock no-error.

if available caq_mstr then
   quedesc  = caq_desc.
else
   quedesc  = "".

find eng_mstr where eng_mstr.eng_domain = global_domain
   and eng_addr = ca_assign
no-lock no-error.
if available eng_mstr
then do:
   find emp_mstr
      where emp_domain = global_domain
      and   emp_addr   = eng_addr
   no-lock no-error.
   if available emp_mstr
   then
      aname = emp_sort.
end. /*IF AVAILABLE eng_mstr */

/*cy1028>>*/
if available eng_mstr then do:
   find first Employee 
   where Employee.EmployeeCode = eng_code
   no-lock no-error.
   if available Employee then do:
      find first Address 
      where Address.BusinessRelation_ID = Employee.BusinessRelation_ID
      no-lock no-error.
      if available Address then
         assign fax = AddressEmail
                email = AddressFax.
   end.
end.
/*cy1028<<*/

/***********************************************/
/*         GET THE  PART DESCRIPTIONS          */
/***********************************************/
find isb_mstr where isb_mstr.isb_domain = global_domain
   and isb_part   = ca_part
   and isb_serial = ca_serial
   and isb_ref    = ca_ref
no-lock no-error.

partdesc  = "".

if not available isb_mstr or
   isb_desc1 = "" then do:

   find pt_mstr where pt_mstr.pt_domain = global_domain
      and pt_part  = ca_part
   no-lock no-error.
   if available pt_mstr then
      partdesc = pt_desc1.
end.
else
   partdesc = isb_desc1.

/* FIND CONTRACT INFO USING DATA ON CALL HEADER */
find sad_det where sad_det.sad_domain = global_domain
   and sad_nbr    = ca_contract
   and sad_line   = ca_cline
   and sad_prefix = prefix
no-lock no-error.
if available sad_det then
   assign
      contract  = sad_nbr
      ctr_start = sad_st_date
      ctr_end   = sad_end_date.
else
assign
   contract  = ""
   ctr_start = ?
   ctr_end   = ?.

/* CONVERT EVENT & NEXT STATUS DATES/TIMES TO REPORT TZ IF NOT */
/* ALREADY SENT IN CONVERTED.                                  */
if svc_multi_time_zones    and
   displaytz <> ""         and
   displaytz <> global_timezone
then do:
   if ca_evt_date <> ? and
      eventdate    = ?
   then do:
      {us/bbi/gprun.i ""fstzcon.p""
         "(input  ca_evt_date,
           input  ca_evt_time,
           input  global_timezone,
           input  displaytz,
           output eventdate,
           output eventtime,
           output undo-all)"}
   end.  /* if ca_evt_date <> ?... */

   if ca_nxt_date <> ? and
      statusdate   = ?
   then do:
      {us/bbi/gprun.i ""fstzcon.p""
         "(input  ca_nxt_date,
           input  ca_nxt_time,
           input  global_timezone,
           input  displaytz,
           output statusdate,
           output statustime,
           output undo-all)"}
   end.  /* if ca_nxt_date <> ?... */
end.  /* if svc_multi_time_zones... */
else
   assign
      eventdate  = ca_evt_date
      eventtime  = ca_evt_time
      statusdate = ca_nxt_date
      statustime = ca_nxt_time.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
display
   c-desc-label
   ca_name
   ca_phone
   ca_desc
   ca_type
   typdesc
   ca_problem
   prodesc
   ca_resolve
   resdesc
   ca_assign
   aname
   contract
   ctr_start
   ctr_end
   isb_ins_date       when (available isb_mstr)
   isb_warr_exp       when (available isb_mstr)
   isb_warr_cd        when (available isb_mstr)
   ca_int_type
   ca_severity
   ca_pri
   ca_status
   ca_que
   ca_nxt_act
   ca_area
   statdesc
   nxtdesc
   quedesc
   eventdate
   eventtime
   statusdate
   statustime
   eulabel            when (svc_multi_time_zones)
   eutz               when (svc_multi_time_zones)
   tzlabel            when (svc_multi_time_zones)
   displaytz          when (svc_multi_time_zones)
   ca_po_nbr
   skip(1)
with frame detail.

hide frame detail.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */


/*cy1028>>*/

put stream ft
   {us/xf/xfput.i "'0'"                001   "x(01)"  }  /* type  "0"  */
   {us/xf/xfput.i ca_nbr               002   "x(08)"  }  /* invoice no */
   {us/xf/xfput.i billto[1]            010   "x(38)"  }  /* bill name  */
   {us/xf/xfput.i billto[2]            048   "x(38)"  }  /* bill addr 1*/
   {us/xf/xfput.i billto[3]            086   "x(38)"  }  /* bill addr 2*/
   {us/xf/xfput.i billto[4]            124   "x(38)"  }  /* bill addr 3*/
   {us/xf/xfput.i billto_city          162   "x(24)"  }  /* bill city  */
   {us/xf/xfput.i billto_state         186   "x(04)"  }  /* bill state */
   {us/xf/xfput.i billto_zip           190   "x(10)"  }  /* bill pcode */
   {us/xf/xfput.i billto[6]            200   "x(38)"  }  /* country    */
   {us/xf/xfput.i year(ca_opn_date)    238   "9999"   }  /* call date  */
   {us/xf/xfput.i month(ca_opn_date)   242   "99"     }
   {us/xf/xfput.i day(ca_opn_date)     244   "99"     }
   {us/xf/xfput.i ca__chr01            246   "x(8)"  }  /* project code */
   {us/xf/xfput.i ca__chr01            254   "x(8)"   }  /* sales Order */
   {us/xf/xfput.i ca_bill              262   "x(8)"   }  /* Bill to code */
   {us/xf/xfput.i ca_eu_nbr            270   "x(8)"   }  /* EndUser Code */
   {us/xf/xfput.i shipto[1]            278   "x(38)"  }  /* ship name  */
   {us/xf/xfput.i shipto[2]            316   "x(38)"  }  /* ship addr 1*/
   {us/xf/xfput.i shipto[3]            354   "x(38)"  }  /* ship addr 2*/
   {us/xf/xfput.i shipto[4]            392   "x(38)"  }  /* ship addr 3*/
   {us/xf/xfput.i shipto_city          430   "x(24)"  }  /* ship city  */
   {us/xf/xfput.i shipto_state         454   "x(04)"  }  /* ship state */
   {us/xf/xfput.i shipto_zip           458   "x(10)"  }  /* ship pcode */
   {us/xf/xfput.i shipto[6]            468   "x(38)"  }  /* country    */
   {us/xf/xfput.i ca_name              506   "x(24)"  }  /* Contact */
   {us/xf/xfput.i ca_phone             530   "x(20)"  }  /* phone   */
   {us/xf/xfput.i ca_des               550   "x(8)"   }  /* call desc */
   {us/xf/xfput.i ca_type              558   "x(8)"   }  /* call type */
   {us/xf/xfput.i ca_po_nbr            566   "x(18)"  }  /* PO Nbr    */
   {us/xf/xfput.i year(ca_evt_date)    588   "9999"   }  /* event date */
   {us/xf/xfput.i month(ca_evt_date)   592   "99"     }
   {us/xf/xfput.i day(ca_evt_date)     594   "99"     }
   {us/xf/xfput.i ca_evt_time          596   "x(8)"   }  /* Event Time*/
   {us/xf/xfput.i year(ca_nxt_date)    604   "9999"   }  /* next status date */
   {us/xf/xfput.i month(ca_nxt_date)   608   "99"     }
   {us/xf/xfput.i day(ca_nxt_date)     610   "99"     }
   {us/xf/xfput.i ca_nxt_time          612   "x(8)"   }  /* next status time */
   {us/xf/xfput.i ca_assign            620   "x(8)"   }  /* service tech     */
   {us/xf/xfput.i aname                628   "x(20)"  }  /* engineer name    */
   {us/xf/xfput.i ca_customer          648   "x(8)"   }  /* customer code    */
   {us/xf/xfput.i cusname              656   "x(28)"  }  /* customer sortname*/
   {us/xf/xfput.i doctype              747   "x(15)"  }  /* JOB SHEET        */
   .
if available isb_mstr then
   put stream ft
      {us/xf/xfput.i isb_warr_cd          771   "x(8)"   }  /* ISB code         */
      {us/xf/xfput.i year(isb_warr_exp)   779   "9999"   }  /* ISB Warr expire  */
      {us/xf/xfput.i month(isb_warr_exp)  783   "99"     }
      {us/xf/xfput.i day(isb_warr_exp)    785   "99"     }
      {us/xf/xfput.i year(isb_ins_date)  787   "9999"   }  /* ISB Inst Date    */
      {us/xf/xfput.i month(isb_ins_date) 791   "99"     }
      {us/xf/xfput.i day(isb_ins_date)   793   "99"     }
      .
put stream ft
   {us/xf/xfput.i fax                  873   "x(16)"  }  /* Eng Fax number   */
   {us/xf/xfput.i email                889   "x(40)"  }  /* Eng Email addr   */
   {us/xf/xfput.i ca_des               929   "x(60)"  }  /* call desc */
.
/*cy1028<<*/

/*cy1028*   {us/gp/gpcmtprt.i &type=CS &id=ca_cmtindx &pos=3 } */
/*cy1028*/  {us/xf/xfcmtprt.i &type=CS &id=ca_cmtindx &rectype=A }

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
display skip.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

for each csd_det where csd_domain = global_domain
   and csd_category = ca_category
   and csd_ca_nbr   = ca_nbr
no-lock:

   for first code_mstr where code_domain = global_domain
      and code_fldname = "fsskill"
      and code_value   = csd_problem
   no-lock: end.

   assign
      vc_desc = if available code_mstr then code_cmmt
                                       else "".
/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
   display
      csd_problem
      vc_desc
   with frame d.
   down 1 with frame d.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

end.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
if page-size - line-counter < 11 then page.
do i = 1 to 7:
   put  skip(1).
   put
      "------------------------------------------------------"
       + "----------------------" format "x(77)".
end.

put skip.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

if can-find(first itm_det where itm_domain = global_domain
            and itm_nbr   = ca_nbr
            and itm_prefix begins caprefix)
then do:

   /* PRINT ONLY REGULAR CALL LINES, NOT THE INTERNALLY USED */
   /* CALL INVOICE DETAIL LINES (WHERE ITM_TYPE = "INV")     */
   for each itm_det where itm_domain = global_domain
      and itm_nbr   = ca_nbr
      and itm_type  = mfblank
      and itm_prefix  begins  caprefix
   no-lock:

      find isb_mstr where isb_mstr.isb_domain = global_domain
         and isb_part = itm_part
         and isb_serial = itm_serial
         and isb_ref = itm_ref
      no-lock no-error.

      if available isb_mstr then
         partdesc = isb_desc1.
      else do:
         find pt_mstr  where pt_mstr.pt_domain = global_domain and  pt_part  =
         itm_part no-lock no-error.
         if available pt_mstr then
            partdesc  = pt_desc1.
         else
            partdesc  = "".
      end.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
      display
         itm_line
         itm_part     @ ca_part
         partdesc
         itm_serial   @ ca_serial
      with frame b.

      down 1 with frame b.

      {us/gp/gpcmtprt.i &type=CS &id=itm_cmtindx &pos=6 }
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

/*cy1028>>*/
      put stream ft
         {us/xf/xfput.i "'B'"                001   "x(01)"  }  /* type  "B"  */
         {us/xf/xfput.i itm_part            002   "x(18)"  }  /* Item Code  */
         {us/xf/xfput.i itm_serial           020   "x(18)"  }  /* Item Serial*/
         {us/xf/xfput.i partdesc             038   "x(24)"  }  /* Part desc  */
      .
/*cy1028<<*/


   end. /**********for each************/

end.
else do:

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
   display
      ca_part
      ca_serial
      partdesc
   with frame b.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */
/*cy1028>>*/
      put stream ft
         {us/xf/xfput.i "'B'"                001   "x(01)"  }  /* type  "B"  */
         {us/xf/xfput.i ca_part            002   "x(18)"  }  /* Item Code  */
         {us/xf/xfput.i ca_serial           020   "x(18)"  }  /* Item Serial*/
         {us/xf/xfput.i partdesc             038   "x(24)"  }  /* Part desc  */
      .
/*cy1028<<*/

end.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
if page-size - line-counter < 11 then page.
do i = 1 to 7:
   put  skip(1).
   put
      "------------------------------------------------------"
       + "----------------------" format "x(77)".
end.

put skip.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

if include-bom then do:
/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
   page.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

   if can-find(first itm_det where itm_det.itm_domain = global_domain
               and itm_nbr   = ca_nbr
               and itm_prefix begins caprefix)
   then do:

      for each itm_det where itm_det.itm_domain = global_domain
         and itm_nbr   = ca_nbr
         and itm_type  = mfblank
         and itm_prefix  begins  caprefix
      no-lock:

         if itm_bom_code <> "" or
            itm_route <> ""
         then do:

            /* CHANGED BOM/ROUTE INPUT PARMS FROM CA_MSTR TO ITM_DET */
            /* ADDED ITM_LINE, ITM_ENG_CODE INPUT PARMS */
            {us/bbi/gprun.i ""fscaiv2a.p""
               "(input ca_recno,
                 input itm_line,
                 input itm_eng_code,
                 input itm_bom_code,
                 input itm_route,
                 input itm_part,
                 input itm_serial,
                 input itm_ref,
                 input ca_eu_date,
                 input no,
                 input yes)"}
         end. /********if route********/

      end. /**********for each************/

   end.

end.   /* if include-bom */

do for camstrl transaction on error undo, leave:
   find camstrl where recid(camstrl) = recid(ca_mstr)
   exclusive-lock.
   ca_printed = yes.
end.   /* transaction */

if ca_mstr.ca_rma_nbr = "" then
   leave.

/* PRINT ALL RMA'S (AND THEIR LINES) ASSOCIATED WITH THIS CALL, */
/* NOT ONLY THE ONE REFERENCED ON CA_MSTR                       */
for each rma_mstr where rma_mstr.rma_domain = global_domain
   and rma_ca_nbr = ca_nbr
use-index rma_ca_nbr
no-lock:

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
   put
      skip(1)
      {us/bbi/gplblfmt.i
         &FUNC=getTermLabel(""PARTS_USAGE/_BILLABLE_ITEMS"",35)} at 28
      skip
      {us/bbi/gplblfmt.i
         &FUNC=getTermLabelRtColon(""RMA/SALES_ORDER"",23)
         &CONCAT="' '"} at 28
      rma_nbr.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

   for each rmd_det where rmd_det.rmd_domain = global_domain
      and rmd_prefix  =  "C"
      and rmd_nbr     = rma_nbr
   no-lock:

      find pt_mstr where pt_mstr.pt_domain = global_domain
         and pt_part = rmd_part
      no-lock no-error.
      if available pt_mstr then
         partdesc  = pt_desc1.
      else
         partdesc  = rmd_desc.

      /* FOLLOWING HAS BEEN CHANGED TO SUPPORT PRINTING QUANTITIES */
      /* ORDERED/SHIPPED/RECEIVED, SEPARATE PRINT LOGIC FOR ISSUE/ */
      /* RECEIPT/LABOR AND EXPENSE LINES, AND ADDED PRINTING OF    */
      /* SERIAL NUMBER IF AVAILABLE                                */

      /* RMD_TYPE = "O" FOR ISSUE (OUTBOUND) LINES */
      if rmd_type = "O" then do:
         /* FIRST RESET TO "" */
         iss-rec = "".
         /* GET ISS-REC TYPE "I" (CODE = 1) FROM LNGD_DET */
         {us/gp/gplngn2a.i
            &file     = fname
            &field    = ""iss-rec""
            &code     = string(1)
            &mnemonic = iss-rec
            &label    = lng_desc}

         /* IF THERE IS NO MNEMONIC FOR ISS-REC, WE'LL MAKE AN */
         /* ENGLISH ONE AND STORE IT IN THE BASE LANGUAGE      */
         if iss-rec = ""
         then do transaction:
            create lngd_det.
            assign
               lngd_dataset = "rmdtype"
               lngd_key1 = "1"
               lngd_key2 = "I"
               lngd_field = "iss-rec"
               lngd_translation = "ISSUE"
               lngd_lang = global_user_lang.
            assign iss-rec = "I".
         end.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
         display
            rmd_part                @ part
            rmd_qty_ord             @ pqty
            rmd_price               @ pprice
            iss-rec
            partdesc
         with frame c.

         down 1 with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

         /* PRINT LOT/SERIAL AND/OR QUANTITY SHIPPED */
         if rmd_ser <> "" then do:
            assign part = getTermLabelRtColon("LOT/SERIAL",5)
                         + " " + rmd_ser.
/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
            display part with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */
         end.
         if rmd_qty_acp <> 0 then
/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
            display ship-label  @ partdesc
                    rmd_qty_acp @ pqty
            with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */
         /* IF LINE WAS PRINTED, ADVANCE */
         if rmd_ser <> "" or
            rmd_qty_acp <> 0 then
/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
            down 1 with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

         /* LEAVE BLANK LINE BETWEEN ITEMS */
/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
         down 1 with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

      end.

      else do:
         /* ELSE, RMD_TYPE = "I" FOR RECEIPT (INBOUND) LINES */

         /* FIRST RESET TO "" */
         iss-rec = "".
         /* GET ISS-REC TYPE "R" (CODE = 2) FROM LNGD_DET */
         {us/gp/gplngn2a.i
            &file     = fname
            &field    = ""iss-rec""
            &code     = string(2)
            &mnemonic = iss-rec
            &label    = lng_desc}

         /* IF THERE IS NO MNMMONIC FOR ISS-REC, WE'LL MAKE AN */
         /* ENGLISH ONE AND STORE IT IN THE BASE LANGUAGE      */
         if iss-rec = ""
         then do transaction:
            create lngd_det.
            assign
               lngd_dataset = "rmdtype"
               lngd_key1 = "2"
               lngd_key2 = "R"
               lngd_field = "iss-rec"
               lngd_translation = "RECEIPT"
               lngd_lang = global_user_lang.
            assign iss-rec = "R".
         end.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
         display
            rmd_part                @ part
            rmd_qty_ord             @ pqty
            rmd_price               @ pprice
            iss-rec
            partdesc
         with frame c.

         down  1 with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

         /* PRINT LOT/SER AND QUANTITY RECEIVED, IF ANY */
/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
         if rmd_qty_acp <> 0 then
            display
               receive-label     @ partdesc
               rmd_qty_acp       @ pqty
            with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

         if rmd_ser <> "" then do:
            assign
               part = getTermLabelRtColon("LOT/SERIAL",5)
                     + " " + rmd_ser.
/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
            display part with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */
         end.

/*cy1028* start deleted code  >>>>>>>>>>>>>>>>
         /* IF LINE PRINTED, ADVANCE */
         if rmd_ser <> "" or
            rmd_qty_acp <> 0
         then
            down 1 with frame c.

         /* LEAVE BLANK LINE BETWEEN ITEMS */
         down 1 with frame c.
*cy1028* end   deleted code  <<<<<<<<<<<<<<< */

      end.   /* else do: */

   end.   /* for each rmd_det */

end.   /* for each rma_mstr */
