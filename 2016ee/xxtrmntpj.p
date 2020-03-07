/* xxtrmntpj.p - TRANSACTION MAINTENANCE FOR PROJECT CODES                    */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* CYB                   LAST MODIFIED: 23-MAR-2015 BY: nac *d3032*   */
/* CYB                   LAST MODIFIED: 2016-SEP-27 BY: gbg *d3032a*  */
/*-Revision end---------------------------------------------------------------*/

/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

/*V8:ConvertMode=Maint                                                        */

/* DISPLAY TITLE */
{us/mf/mfdtitle.i "3+ "}

define variable plrecid as recid.
define variable xpostingyear like Posting.PostingYear no-undo.
define variable xjournalcode like Journal.JournalCode no-undo.
define variable xpostingvoucher like Posting.PostingVoucher no-undo.
define variable xpostinglinesequence like PostingLine.PostingLineSequence no-undo.
define variable xprojectcode like Project.ProjectCode no-undo.

define variable xx_cc like CostCentre.CostCentreCode.
define variable xx_sub like Division.DivisionCode.
define variable xx_acct like GL.GLCode.
define variable xx_project like Project.ProjectCode no-undo.
define variable xlabel1 as char format "x(4)" initial "Year" no-undo.
define variable xlabel2 as char initial "Daybook" no-undo.
define variable xlabel3 as char initial "Voucher#" no-undo.
define variable xlabel4 as char initial "Line#" no-undo.

define variable valid_acct like mfc_logical.
define variable cErrorField as character no-undo.
define variable iValError as integer no-undo.

{us/px/pxmaint.i}

/* DISPLAY SELECTION FORM*/
form
   xlabel1 at 22 no-label
   xlabel2 at 28 no-label
   xlabel3 at 38 no-label
   xlabel4 at 49 no-label
   xpostingyear colon 20 label "Journal Reference"
   xjournalcode no-label
   xpostingvoucher no-label
   xpostinglinesequence no-label
   skip
   xx_acct colon 20 label "Account"
   xx_sub colon 20 label "Sub-Account"
   xx_cc colon 20 label "Cost Centre"
   xx_project colon 20 label "Project"
   skip(1)
   xprojectcode colon 20 label "New Project Code"
with frame a no-underline width 80 attr-space side-labels.

/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).


mainloop:
do while true with frame a:

   display xlabel1 xlabel2 xlabel3 xlabel4 with frame a.

   if c-application-mode <> 'api' then
   do:
      update 
       xpostingyear
       xjournalcode
       xpostingvoucher 
/*     xpostinglinesequence  */
      with frame a.
      
     find first Domains 
       where Domains.DomainCode = global_domain no-lock no-error.

     find first DomainSharedSet 
       where (Domains.Domain_ID = DomainSharedSet.Domain_ID) no-lock no-error.

     find first SharedSet 
       where (SharedSet.SharedSetTypeCode = "GL") no-lock no-error.

     find first SharedSet 
       where (SharedSet.SharedSetTypeCode = "journal") no-lock no-error.

     find first Journal where Journal.SharedSet_ID = SharedSet.SharedSet_ID 
	  and Journal.JournalCode = xjournalcode
	       no-lock no-error.

     find first Company where Company.CompanyCode = current_entity 
           no-lock no-error.

     find first  Posting where Company.Company_ID = Posting.Company_ID 
                    and Posting.PostingYear = xpostingyear 
		    and Posting.Journal_ID = Journal.Journal_ID
		    and Posting.PostingVoucher = xpostingvoucher
           no-lock no-error.

     update 
       xpostinglinesequence 
     with frame a
     editing:
        {us/mf/mfnp01.i PostingLine 
	                xpostinglinesequence
			"PostingLine.PostingLineSequence"
			"PostingLine.Posting_ID"
			"Posting.Posting_ID"
			"Posting"}
        if recno <> ? then do:
	   xpostinglinesequence = PostingLine.PostingLineSequence.
	   display xpostinglinesequence
	   with frame a.
	end.
     end.

     for each Company where Company.CompanyCode = current_entity no-lock,
     each Posting where Company.Company_ID = Posting.Company_ID 
                    and Posting.PostingYear = xpostingyear 
		    and Posting.Journal_ID = Journal.Journal_ID
		    and Posting.PostingVoucher = xpostingvoucher
     no-lock,
     each PostingLine where Posting.Posting_ID = PostingLine.Posting_ID 
                      and PostingLine.PostingLineSequence = xpostinglinesequence
     no-lock,
     each Journal where Posting.Journal_ID = Journal.Journal_ID no-lock:


        assign xx_project = xprojectcode.

        find first CostCentre 
	    where CostCentre.CostCentre_ID = PostingLine.CostCentre_ID
	no-lock no-error.
	if available CostCentre then
	   xx_cc = CostCentreCode.
        else
	   xx_cc = "".
        find first Division 
	   where Division.Division_ID = PostingLine.Division_ID
	no-lock no-error.
	if available Division then
	   xx_sub = DivisionCode.
        else
	   xx_sub = "".
        find first GL 
	    where GL.GL_ID = PostingLine.GL_ID
	no-lock no-error.
	if available GL then
	   xx_acct = GLCode.
        else
	   xx_acct = "".
        find first Project 
	    where Project.Project_ID = PostingLine.Project_ID
	no-lock no-error.
	if available Project then
	   xx_project = ProjectCode.
        else
	   xx_project = "".

        assign plrecid = recid(PostingLine).
     end.

     display xx_acct xx_sub xx_cc xx_project with frame a.
 
     projectloop:
     do on error undo, retry:
        update
          xprojectcode
        with frame a.
   
        /* CHECK PROJECT */
        do with frame a:
           if not ({gpglproj.v xprojectcode}) then do:
      	      run p_ip_msg (input 3128, input 3).
	      /* INVALID PROJECT */
	      next-prompt xprojectcode with frame a.
	      undo projectloop, retry projectloop.
           end.
        end.

/**/
     /*CHECK GL ACCOUNT/COST CENTRE */
     {us/px/pxrun.i &PROC='validateFullAccount' &PROGRAM='glacxr.p'
                    &PARAM="(input  xx_acct,
                             input  xx_sub,
                             input  xx_cc,
                             input  xprojectcode,
                             input ""pod_acct"")"
                    &NOAPPERROR=true
                    &CATCHERROR=true}
      if return-value <> {&SUCCESS-RESULT}
      then do:
         next-prompt xprojectcode with frame a no-validate.
	 undo projectloop, retry projectloop.
      end.
/**/

         /* VALIDATE PROJECT CODE */
         {us/px/pxrun.i &PROC='validateProjectCode' &PROGRAM='glacxr.p'
                        &PARAM="(xprojectcode)"
                        &NOAPPERROR=true
                        &CATCHERROR=true}
/*d3032>>*/
            find first SharedSet where SharedSet.SharedSetTypeCode = "GL"
	    no-lock no-error.
            find first Domains where Domains.DomainCode = global_domain
	    no-lock no-error.
	    find first DomainSharedSet 
	        where DomainSharedSet.Domain_ID = Domains.Domain_ID
	        no-lock no-error.
            if available DomainSharedSet then do:
/*d3032a >>> */
               if can-find(first GL
	                   where GL.SharedSet_ID = SharedSet.SharedSet_ID
			   and   GL.GLcode = xx_acct
			   and   GL.GLIsCostCentreAccount
			   and   xx_cc = "")
               or can-find(first GL
	                   where GL.SharedSet_ID = SharedSet.SharedSet_ID
			   and   GL.GLcode = xx_acct
			   and   GL.GLAnalysisLimitation = "BOTHREQUIRED"
			   and   xprojectcode = ""
			   and   xx_cc = "")
               then do:
                  /* COST CENTER OR PROJECT OR BOTH ARE REQUIRED */
                  run p_ip_msg (input 1729, input 3).
                  next-prompt xprojectcode with frame a.
                  undo projectloop, retry projectloop.
	       end.
/*d3032a* <<< */
/*d3032a*>>>
               find first GL 
	            where GL.SharedSet_ID = SharedSet.SharedSet_ID 
	                           and GL.GLcode = xx_acct
/*d3032a*	                   and GL.GLIsProjectAccount  */
/*d3032a*/                         and GL.GLAnalysisLimitation = "BOTHREQUIRED"
   				   and  xprojectcode = ""
/*d3032a*/                         and  xx_cc = ""
   				   no-lock no-error.
               if available GL
               then do:
                  /* COST CENTER OR PROJECT OR BOTH ARE REQUIRED */
                  run p_ip_msg (input 1729, input 3).
                  next-prompt xprojectcode with frame a.
                  undo projectloop, retry projectloop.
	       end.
*d3032a <<< */
	    end.
      end.   
   end.
   find first SharedSet 
   where (SharedSet.SharedSetTypeCode = "project") no-lock no-error.
   find Project where Project.SharedSet_ID = SharedSet.SharedSet_ID and
                      Project.ProjectCode = xprojectcode
                      no-lock no-error.
   if available Project then do transaction:
      find PostingLine where recid(PostingLine) = plrecid exclusive-lock.
      assign PostingLine.Project_ID = Project.Project_ID.
      release PostingLine.
   end.
end.


PROCEDURE p_ip_msg:

   define input parameter l_num  as integer no-undo.
   define input parameter l_stat as integer no-undo.

   {us/bbi/pxmsg.i &MSGNUM=l_num &ERRORLEVEL=l_stat}
END PROCEDURE.
