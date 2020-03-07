/* xxdomxrf.p  - Multi-Domain Customisation - Parent/Child relationship Maint */
/* Copyright 1986-2009 QAD Inc., Santa Barbara, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* $Revision: 1.2 $                                                       */
/*V8:ConvertMode=Maintenance                                                  */
/* CYB     LAST MODIFIED: 03-DEC-2009              BY: gbg *Q9006*            */
/* CYB    LAST MODIFIED: 10-AUG-2011    BY:  gbg *cy1049* MultiDomain        */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/

{us/mf/mfdtitle.i "x+ "}

def var vDomain            as char label "Child Domains".
def var vDomDesc           like dom_name label "Parent Domain".
def var vMessage           as char.

def buffer dom1   for dom_mstr.
def buffer dom2   for dom_mstr.

form
vDomain     colon 16   dom1.dom_name no-label
dom1.dom_user1   colon 16  label "Parent Domain" vDomDesc  no-label
with frame a side-labels width 80 no-attr-space.

setFrameLabels (frame a:handle).


mainloop:
repeat:

    childloop:
    repeat:
      update vDomain
      with frame a editing:
         {us/mf/mfnp.i dom1
                 vDomain
                 dom1.dom_domain
                 vDomain
                 dom1.dom_domain
                 dom_domain}
         if recno <> ?
         then do:
            find first dom2 no-lock
            where dom2.dom_domain = dom1.dom_user1
            no-error.
            display 
            dom1.dom_domain @ vDomain
	    dom1.dom_name
            dom1.dom_user1
            " " @ vDomDesc
            dom2.dom_name when available dom2 @ vDomDesc
	    with frame a.
         end.
      end.  /* editing */
      find first dom1 exclusive-lock
      where dom1.dom_domain = vDomain
      no-error.
      if not available dom1
      then do:
        vmessage = "Invalid Domain".
        {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
        undo childloop, retry childloop.
      end.
      find first dom2 no-lock
      where dom2.dom_domain = dom1.dom_user1
      no-error.
      display
      dom1.dom_name
      dom1.dom_user1
      " " @ vDomDesc
      dom2.dom_name when available dom2 @ vDomDesc
      with frame a.

      leave childloop.
    end.   /* childloop */
    if key-function(lastkey) = "end-error"
    then do:
       leave mainloop.
    end.

    parloop:
    repeat:
      update dom1.dom_user1
      with frame a editing:
         {us/mf/mfnp.i  dom2
                  dom1.dom_user1
                  dom2.dom_domain
                  dom1.dom_user1
                  dom2.dom_domain
                  dom_domain}
        if recno <> ?
        then do:
          display dom2.dom_domain @ dom1.dom_user1
                  dom2.dom_name @ vDomDesc
          with frame a.
        end.
      end.
      find first dom2 no-lock
      where dom2.dom_domain = dom1.dom_user1
      no-error.
      if not available dom2
      then do:
        vmessage = "Invalid Parent Domain".
        {us/bbi/pxmsg.i &MSGTEXT=vmessage &ERRORLEVEL=3}
        undo parloop, retry parloop.
      end.
      display 
      dom1.dom_user1
      dom2.dom_name @ vDomDesc
      with frame a.
      leave parloop.
    end.  /* parloop */
end.  /* mainloop */
