/* xxcsrp7x.p - Cost Comparison Report                                        */
/* CYB   LAST MODIFIED: 05-AUG-2013    BY: gbg  *c1429                        */
/******************************************************************************/

def var vrecseq as int.

def {1} shared temp-table tcost
field tcseq   as int
field tclevel as int
field tcleaf as logical
field tcpart like pt_part
field tcum   like pt_um
field tcqty   as dec format "->>>>>>9.9<<<<<<"
field tccost  as dec format "->>>>>>9.9<<<<<<"
field tccostext  as dec format "->>>>>>9.9<<<<<<"
field tcovh   as decimal format "->>>>>>9.9<<<<<<"
field tclbr   as decimal format "->>>>>>9.9<<<<<<".
