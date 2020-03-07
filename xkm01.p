{/home/gbg/xkm1.i NEW}
def var a as char.

input from xp.
repeat transaction on error undo, leave:
   create tps.
   import delimiter ":" tps.
end.
input close.


update a.
output to ps1.
run xkm1a.p (a).
output close.
