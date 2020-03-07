/* xxuxlad.p - Utility to delete lad_det records for orphaned records        */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 27-NOV-2012    BY:  gbg *c1431*                      */
/*---------------------------------------------------------------------------*/
 
define buffer lflad for lad_det.
define variable site like si_site.
define variable site1 like si_site.
define variable part like pt_part.
define variable part1 like pt_part.
define variable lfall like lad_qty_pick.
define variable lfline like lad_line.
define variable lfnbr like lad_nbr.

/*H1HQ*/    define       variable  l_um_conv     like sod_um_conv no-undo.

define variable lfupdate as logical initial no.

{us/mf/mfdtitle.i "b+ "}

run pxgblmgr.p persistent set global_gblmgr_handle.

form

    site           colon 18
    site1          label {us/t0/t001.i} colon 49
    part           colon 18
    part1          label {us/t0/t001.i} colon 49
    lfupdate       colon 18 label "Update"
    with frame a side-labels width 80 attr-space.
repeat:

 display "Orphaned Allocations"  with centered.
     
     if site1 = hi_char then site1 = "".
     if part1 = hi_char then part1 = "".

     update site site1 part part1 lfupdate with frame a.

      bcdparm = "".
      {us/mf/mfquoter.i site   }
      {us/mf/mfquoter.i site1  }
      {us/mf/mfquoter.i part   }
      {us/mf/mfquoter.i part1  }
      {us/mf/mfquoter.i lfupdate }


     if site1 = "" then site1 = hi_char.
     if part1 = "" then part1 = hi_char.
        /* SELECT PRINTER */
           {us/mf/mfselbpr.i "printer" 132}
              {us/bbi/mfphead.i}

 
 
 for each lad_det      where lad_domain = global_domain and
                       lad_site >= site and lad_site <= site1   
                       and lad_part >= part and lad_part <= part1
                       and lad_dataset begins "so":
    
    find first sod_det  no-lock 
                        where sod_domain = global_domain
                        and sod_nbr = lad_det.lad_nbr
                        and string(sod_line) = lad_det.lad_line 
			no-error. 

    if not available sod_det then do:
    display lad_dataset 
            lad_nbr 
            lad_line 
            lad_part 
            lad_site 
	    lad_loc
            with down frame lf1.                            
    
    if lfupdate = yes then
       delete lad_det.
    
    end.                            
 end.


/*c1431* start deleted code >>>>>>>>
*  for each lad_det         where lad_domain = global_domain and  
*                                 lad_site >= site and lad_site <= site1
*                             and lad_part >= part and lad_part <= part1
*                             and lad_dataset = "wod_det":
*      find first wod_det no-lock where wod_domain = global_domain
*                             and wod_lot = lad_det.lad_nbr
*                             and string(wod_op) = lad_det.lad_line 
*                             and wod_part =  lad_part no-error.
*      if not available wod_det then do:
*      display lad_dataset
*              lad_nbr label "WO ID"
*              lad_line label "WO Op" 
*              lad_part 
*              lad_site with title "Strand WO Lad_det's"
*              with down frame lf2.
*      
*      if lfupdate = yes then 
*         delete lad_det.
*      end.
*  end.
*c1431* end deleted code */


  
  {us/mf/mfrpexit.i}

               
                    /* REPORT TRAILER */
                       {us/mf/mfrtrail.i}
end.                       
                       



