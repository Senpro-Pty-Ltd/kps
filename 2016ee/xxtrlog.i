/* xxtrlog.i - trace log for bulk shipping */
/* CYB  LAST MODIFIED: 20-OCT-2011    BY: gbg *c1253*                */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
procedure tracelog.
define input parameter ipref             as char.
define input parameter ipfield           as char.
define input parameter ipvalue           as char.


output to /tmp/trace.auis append.
put unformatted 
string(today) "|"
string(time, "HH:MM:SS") "|"
global_userid "|"
global_domain "|"
trim(ipref) "|"
trim(ipfield) "|"
trim(ipvalue)
skip.

end.  /* procedure tracelog */
