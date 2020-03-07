/* xfprprc2.i  -  SALES ORDER PRINT PROCEDURES                                */
/* soprprc2.i  -  SALES ORDER PRINT PROCEDURES                                */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfprprc2.i,v 1.2 2018/03/13 17:09:35 gbg Exp $: */
/* Revision: 1.9          BY: Xiaolei Meng        DATE: 07/29/09  ECO: *R1N2* */
/* $Revision: 1.2 $      BY: Yizhou Mao          DATE: 08/27/09  ECO: *R1Q6* */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/*   &PageEnd - Will be executed, when new page needed                        */
/******************************************************************************/

&IF DEFINED(SOPRPROC_I) = 0 &THEN
&SCOPED-DEFINE SOPRPROC_I
/*eb3sp5 comment begin
/* Get Heading */
PROCEDURE GetHeading:

   if vcPriHeading = "INV" then
      assign
         vcHeading  = getTermLabelRt("BANNER_INVOICE", 30)
         vcHeading1 = getTermLabelRt("BANNER_PREVIEW_INVOICE", 28).
   else if vcPriHeading = "CN" then
      assign
         vcHeading  = getTermLabelRt("BANNER_CREDIT_NOTE", 28)
         vcHeading1 = getTermLabelRt("BANNER_CREDIT_NOTE", 28).
   else if vcPriHeading = "DN" then
      assign
         vcHeading  = getTermLabelRt("BANNER_DEBIT_NOTE", 28)
         vcHeading1 = getTermLabelRt("BANNER_DEBIT_NOTE", 28).
   else
      assign
         vcHeading  = ""
         vcHeading1 = "".

END PROCEDURE. /* GetHeading */

/* Print Header Comment */
PROCEDURE PrintHeaderComment:

   define input parameter ip_index   as integer   no-undo.
   define input parameter ip_setting as character no-undo.

   if ip_setting = "Optional" then
   do:
      {us/gp/gpcmtprt.i &TYPE=IN &ID=ip_index &POS=3}
   end.
   else if ip_setting = "yes" then
   do:
      {us/gp/gpcmtprt.i &TYPE=RP &ID=ip_index &POS=3}
   end.
END PROCEDURE. /* PrintHeaderComment */

/* Print Line Comment */
PROCEDURE PrintLineComment:

   define input parameter ip_index   as integer   no-undo.
   define input parameter ip_setting as character no-undo.

   if ip_setting = "Optional" then
   do:
      {us/gp/gpcmtprt.i &TYPE=IN &ID=ip_index &POS=3 &COMMAND="~{{&PageEnd}~}"}
   end.
   else if ip_setting = "yes" then
   do:
      {us/gp/gpcmtprt.i &TYPE=RP &ID=ip_index &POS=3 &COMMAND="~{{&PageEnd}~}"}
   end.
END PROCEDURE. /* PrintLineComment */

/* Print customer item */
PROCEDURE PrintCustomerItem:

   define input parameter ip_item like sod_custpart no-undo.
   define input parameter ip_pos  as   integer      no-undo.

   if vlPriCustItem and ip_item <> "" then
   do:
      if page-size - line-counter < 1 then do:
         page.
         {{&PageEnd}}
      end.
      put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""CUSTOMER_ITEM"",13)
                      &CONCAT="' :'"} at ip_pos
          ip_item at ip_pos + 17.
      if viTaxLine <> 0 then
         run PrintTaxRate.
      put skip.
   end.
END PROCEDURE. /* PrintCustomerItem */

/* Print item description */
PROCEDURE PrintDescription:

   define input parameter ip_desc   like pt_desc1 no-undo.
   define input parameter ip_show   as   logical  no-undo.
   define input parameter ip_secode as   logical  no-undo.
   define input parameter ip_pos    as   integer  no-undo.

   if ip_show or ((not ip_secode or vlPriDesc2) and ip_desc <> "") then
   do:
      if page-size - line-counter < 1 then do:
         page.
         {{&PageEnd}}
      end.
      put ip_desc at ip_pos.
      if viTaxLine <> 0 then
         run PrintTaxRate.
      put skip.
   end.
END PROCEDURE. /* PrintDescription */
eb3sp5 comment end*/
/* Record tax data */
PROCEDURE RecordTaxData:

   define input parameter ip_tr_type  as character no-undo.
   define input parameter ip_ref      as character no-undo.
   define input parameter ip_nbr      as character no-undo.
   define input parameter ip_line     as integer   no-undo.

   assign
      vcTranType = ip_tr_type
      vcTaxRef   = ip_ref
      vcTaxNbr   = ip_nbr
      viTaxLine  = ip_line.
END PROCEDURE. /* RecordTaxData */

/* Calculate Tax Percentage */
PROCEDURE CalculateTaxPct:

   define output parameter opTaxAmount like tx2_tax_pct no-undo.
   define        variable  vdTaxRate   like tx2_tax_pct no-undo.

   for each tx2d_det no-lock
      where tx2d_domain  = global_domain
      and   tx2d_ref     = vcTaxRef
      and   tx2d_nbr     = vcTaxNbr
      and   tx2d_line    = viTaxLine
      and   tx2d_tr_type = vcTranType:

      for first tx2_mstr no-lock
         where tx2_domain   = global_domain
         and   tx2_tax_code = tx2d_tax_code:
      end.

      if tx2d_edited then do:
         if tx2d_tottax = 0 then
            vdTaxRate = 0.
         else
            vdTaxRate = tx2d_cur_tax_amt / tx2d_tottax * 100.
      end.
      else if available tx2_mstr then
         vdTaxRate = tx2_tax_pct.

      assign
         opTaxAmount = opTaxAmount + vdTaxRate
         vdTaxRate   = 0.
   end. /* for first tx2d_det no-lock */

END PROCEDURE. /* CalculateTaxPct */
/*eb3sp5 comment begin
/* Print tax rate */
PROCEDURE PrintTaxRate:

   define variable vcTaxRate like tx2_tax_pct            no-undo.
   define variable viFrWidth as   integer     initial 80 no-undo.

   if vlPriLineTax then do:

      run CalculateTaxPct(output vcTaxRate).

      if vcTaxRate <> 0.0 then
      do:
         if page-size - line-counter < 1 then do:
            page.
            {{&PageEnd}}
         end.

         if vdPrintWidth <> 0.0 then
            viFrWidth = integer(vdPrintWidth).

         put getTermLabelRtColon("TAX", 4) + " " format "x(5)"
                at viFrWidth - 13
             vcTaxRate at viFrWidth - 8.
      end.
   end. /* if vbPriLineTax then do */

   /* Tax rate has been shown */
   viTaxLine = 0.
END PROCEDURE. /* PrintTaxRate */
eb3sp5 comment end*/
&ENDIF
