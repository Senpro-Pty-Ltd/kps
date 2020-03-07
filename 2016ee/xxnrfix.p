/* xxnrfix.p - Fix a Number Range Sequence after it gets corrupted */
/* CYB     LAST MODIFIED: 08-JUN-2012         BY: gbg *c1309*      */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*******************************************************************/
def buffer bnr1 for nr_mstr.
def buffer bnr2 for nr_mstr.
def var v_ini as int format "x(9)" label "Next Value".

update v_ini
with frame a width 80 side-labels.

for first bnr1
no-lock
where bnr1.nr_seg_ini = ""
,
first bnr2 no-lock
where bnr2.nr_domain <> bnr1.nr_domain
and   bnr2.nr_seq = bnr1.nr_seq
:
    buffer-copy
        bnr2 
        except nr_seg_value 
               nr_domain  
               nr_seqid 
               nr_desc 
               nr_dataset 
               oid_nr_mstr
    to bnr1
       assign entry(4, bnr1.nr_seg_value) = string(v_ini, "999999999").
end.
