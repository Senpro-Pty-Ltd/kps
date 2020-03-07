/* xxptcmt.p - Item Master Custom Fields                                     */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/******************************************************************************/
/* REVISION: 1.0     LAST MODIFIED: 12-APR-2011     BY: gbg *C1213*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/

{us/mf/mfdtitle.i +1}



def var part          like pt_part.


form
part   colon 20
pt__chr03   colon 20  format "x(8)"  label "Capacity"
pt__chr04   colon 20  format "x(8)"  label "Voltage"
pt__chr05   colon 20  format "x(8)"  label "Max CHG"
pt__chr07   colon 20  format "x(8)"  label "St Current"
pt__chr08   colon 20  format "x(8)"  label "Current"
pt__chr09   colon 20  format "x(8)"  label "Qty Lead"
pt__chr10   colon 20  format "x(40)"  label "FldName"
pt__chr06   colon 20  format "x(40)"  label "Country of Origin"
pt__log01   colon 20                 label "Auto Serial"
pt__chr01   colon 20  format "x(8)"  label " "
pt__chr02   colon 20  format "x(8)"  label " "
pt_desc2    colon 20  format "x(24)"  label "Description"
with frame a side-labels width 80 no-attr-space.
setFrameLabels (frame a:handle).


mainloop:
repeat:
   update part
   with frame a.
   find first pt_mstr 
   where pt_domain = global_domain
   and   pt_part = part
   no-error.
   if available pt_mstr
   then do:
        update 
        pt__chr03   
        pt__chr04   
        pt__chr05   
        pt__chr07   
        pt__chr08   
        pt__chr09   
        pt__chr10   
        pt__chr06   
        pt__log01   
        pt__chr01   
        pt__chr02   
        pt_desc2    
	with frame a.
   end.
end.  /* mainloop */


