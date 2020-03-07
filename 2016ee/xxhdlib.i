/*  xxhdlib.i - Functions for traversing the widget tree */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */

function fhwindow returns handle (a as handle).
/* return the handle of the window node or root of a widget tree */
def var hdl as handle.
hdl = a.
if hdl = ? then return ?.
do while hdl:type <> "window":
  hdl = hdl:parent.
end.
return hdl.
end.  /* function fhwindow */


function fhframe returns handle (frm as char, c as handle).
/* return the handle of a specified node in a tree */
def var hc as handle.
def var hd as handle.
if lookup(c:type, "dialog-box,field-group,frame,menu,sub-menu,window, session") = 0 then return ?.
if c = ? then return ?.
hc = c.
hc = hc:first-child.
repeat:
   if valid-handle(hc) and hc:name = frm then return hc.
   if not valid-handle(hc) then leave.
   hc = hc:next-sibling.
end.
hc = c.
hc = hc:first-child.
if not valid-handle(hc) then return ?.
repeat:
   hd = fhframe(frm, hc).
   hc = hc:next-sibling.
   if valid-handle(hd) and hd:name = frm then return hd.
   if not valid-handle(hc) then return hc.
end.

end.  /* function fhnode */
