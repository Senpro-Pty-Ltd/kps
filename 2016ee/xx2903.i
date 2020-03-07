/* xx2903.i - Debug Procedures                                     */
/* CYB    LAST MODIFIED: 22-FEB-2013    BY:  gbg *c1367*                      */


define stream dbgstream.
procedure log1a.
define input parameter ipchar     as char.

define var vtoday as date.
vtoday = today.
define var filnm  as char.
filnm = global_userid + "_" + 
        string(year(vtoday), "9999") +
	string(month(vtoday), "99") +
	string(day(vtoday), "99") + 
	".log".

output stream dbgstream to value(filnm) append.

put stream dbgstream unformatted
string(time, "HH:MM:SS")
";"
program-name(2)
";"
ipchar
skip.

output stream dbgstream close.




end.  /* procedure log1a */

