/* xxoplpa.p - ONLINE PRODUCTION LABEL PRINT                             */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                  */
/* All rights reserved worldwide.  This is an unpublished work.         */
/* $Revision: 1.2 $                                                     */
/*V8:ConvertMode=Report                                                 */
/* CYB                  BY: nac           DATE: 27 Jan 11 ECO: *Q9028 CRD04*  */
/* CYB                  BY: gbg           DATE: 06-Sep-11 ECO: *c1237*        */
/* CYB                  BY: gbg           DATE: 06-Sep-11 ECO: *cy1035*       */
/* CYB                  BY: gbg           DATE: 27-Sep-11 ECO: *cy1035-001*   */
/* CYB    LAST MODIFIED: 05-SEP-2012    BY:  gbg *c1338*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/bbi/mfdeclre.i}
{us/bbi/gplabel.i}
{us/mf/mfsprtdf.i}

define variable i         as integer no-undo.
define variable group_desc as char format "x(40)" no-undo.

define shared variable part      like rps_part no-undo.
define shared variable open_ref  like rps_qty_req column-label "Qty Open" no-undo.
define variable xcomma as character initial ",". 

form
with frame a no-labels width 80.

/* OUTPUT DESTINATION SELECTION */
{us/gp/gpselout.i &printType                = "printer"
            &printWidth               = 132
            &pagedFlag                = " "
            &stream                   = "  "
            &appendToFile             = " "
            &streamedOutputToTerminal = " "
            &withBatchOption          = "no"
            &displayStatementType     = 1
            &withCancelMessage        = "yes"
            &pageBottomMargin         = 6
            &withEmail                = "yes"
            &withWinprint             = "yes"
            &defineVariables          = "no"
            &device                   = "dev2"}


find pt_mstr
where pt_domain = global_domain 
  and pt_part = part
no-lock no-error.

find first code_mstr 
     where code_domain = global_domain 
       and code_fldname = "pt_group" 
       and code_value = pt_group 
       no-lock no-error.
if available code_mstr then
   group_desc = code_cmmt.
else
   group_desc = "".

/*c1338* start added code */
    put 
    {us/xf/xfput.i pt__chr06   1   "x(8)" }   /* SpotLabel  */
    {us/xf/xfput.i xcomma      9   "x(1)"  } /* Comma */
    {us/xf/xfput.i part        10  "x(18)" } /* Item  */
    {us/xf/xfput.i xcomma      28   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt_draw     29  "x(18)" } /* CustomerGroup  */
    {us/xf/xfput.i xcomma      47   "x(1)"  } /* Comma */
    {us/xf/xfput.i group_desc  48  "x(40)" } /* ItemArticle  */
    {us/xf/xfput.i xcomma      88   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt_article  89  "x(18)" } /* ItemArticle  */
    {us/xf/xfput.i xcomma     107   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr01  108  "x(8)" }  /* ItemCCA  */
    {us/xf/xfput.i xcomma     116   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr02  117  "x(8)" }  /* ItemRC  */
    {us/xf/xfput.i xcomma     125   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr03  126  "x(8)" }  /* ItemAmpHr  */
    {us/xf/xfput.i xcomma     134   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr04  135  "x(8)" }  /* ItemVoltage  */
    {us/xf/xfput.i xcomma     143   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr10  144  "x(8)" }  /* MCA  */
    {us/xf/xfput.i xcomma     152  "x(1)"  } /* Comma */
    {us/xf/xfput.i open_ref   153  "9999" }. /* LabelNumber  */
/*c1338* end   added code */


/*c1338* start deleted code >>>>>>
/*cy1035-001* start added code */
    put 
    {us/xf/xfput.i pt__chr06   1   "x(8)" }   /* SpotLabel  */
    {us/xf/xfput.i xcomma      9   "x(1)"  } /* Comma */
    {us/xf/xfput.i part        10  "x(18)" } /* Item  */
    {us/xf/xfput.i xcomma      28   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt_draw     29  "x(18)" } /* CustomerGroup  */
    {us/xf/xfput.i xcomma      47   "x(1)"  } /* Comma */
    {us/xf/xfput.i group_desc  48  "x(40)" } /* ItemArticle  */
    {us/xf/xfput.i xcomma      88   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt_article  89  "x(18)" } /* ItemArticle  */
    {us/xf/xfput.i xcomma     107   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr01  108  "x(8)" }  /* ItemCCA  */
    {us/xf/xfput.i xcomma     116   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr02  117  "x(8)" }  /* ItemRC  */
    {us/xf/xfput.i xcomma     125   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr03  126  "x(8)" }  /* ItemAmpHr  */
    {us/xf/xfput.i xcomma     134   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr04  135  "x(8)" }  /* ItemVoltage  */
    {us/xf/xfput.i xcomma     143   "x(1)"  } /* Comma */
    {us/xf/xfput.i open_ref   144  "9999" }. /* LabelNumber  */
/*cy1035-001* end added code 2011-Sep-27 */
*c1338* <<<<  end deleted code. */

/*cy1035-001* start deleted code >>>>>>>>>>  2011-Sep-27 >>>>
do i = 1 to open_ref:

    put 
    {us/xf/xfput.i pt__chr06   1   "x(8)" }   /* SpotLabel  */
    {us/xf/xfput.i xcomma      9   "x(1)"  } /* Comma */
    {us/xf/xfput.i part        10  "x(18)" } /* Item  */
    {us/xf/xfput.i xcomma      28   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt_group    29  "x(18)" } /* CustomerGroup  */
    {us/xf/xfput.i xcomma      47   "x(1)"  } /* Comma */
    {us/xf/xfput.i group_desc  48  "x(40)" } /* ItemArticle  */
    {us/xf/xfput.i xcomma      88   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt_article  89  "x(18)" } /* ItemArticle  */
    {us/xf/xfput.i xcomma     107   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr01  108  "x(8)" }  /* ItemCCA  */
    {us/xf/xfput.i xcomma     116   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr02  117  "x(8)" }  /* ItemRC  */
    {us/xf/xfput.i xcomma     125   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr03  126  "x(8)" }  /* ItemAmpHr  */
    {us/xf/xfput.i xcomma     134   "x(1)"  } /* Comma */
    {us/xf/xfput.i pt__chr04  135  "x(8)" }  /* ItemVoltage  */
    {us/xf/xfput.i xcomma     143   "x(1)"  } /* Comma */
    {us/xf/xfput.i i          144  "9999" }. /* LabelNumber  */
end.
*cy1035-001* *end deleted code <<<<<<<<<< */

/* start deleted code *
/*c1237*  start added code */
    i = open_ref.
    put unformatted
    trim(pt__chr06) 
    ","
    trim(part)
    ","
    trim(pt_group)
    ","
    trim(group_desc)
    ","
    trim(pt_article)
    ","
    trim(pt__chr01)
    ","
    trim(pt__chr02)
    ","
    trim(pt__chr03)
    ","
    trim(pt__chr04)
    ","
    trim(pt_draw)
    ","
    trim(string(i, "9999")).
/*c1237*  end added code */
* end deleted code */
{us/bbi/mfreset.i }
