/* xxdr.i     - Misc Procedures and Functions for DO                         */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* REVISION: 1.0     LAST MODIFIED: 21-MAR-2012     BY: gbg *d1815*          */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

function fNetWorkCode returns char (ipPart as char, ipsite as char).
   for first ptp_det no-lock
   where ptp_domain = global_domain
   and   ptp_part = ippart
   and   ptp_site = ipsite:
       return ptp_network.
   end.
   for first pt_mstr no-lock
   where pt_domain = global_domain
   and   pt_part = ippart:
      return pt_network.
   end.
   return "".
end.  /* function fNetworkCode */


function fSafetyTime returns int (ipPart as char, ipsite as char).
   for first ptp_det no-lock
   where ptp_domain = global_domain
   and   ptp_part = ippart
   and   ptp_site = ipsite:
       return integer(ptp_sfty_tme).
   end.
   for first pt_mstr no-lock
   where pt_domain = global_domain
   and   pt_part = ippart:
      return integer(pt_sfty_time).
   end.
   return 0.
  
end.  /* function fSafetyTime */


function fNextShipDate returns date (ipNetwork as char, 
                                     ipDate as date,
				     ipSite as char).
def var i as int.

    for first ssd_det no-lock
    where ssd_domain = global_domain
    and   ssd_network = ipNetWork
    and   ssd_rec_site = ipSite
    and   (ssd_start = ? or ssd_start <= ipDate)
    and   (ssd_end = ? or ssd_end >= ipDate),
    first shd_det no-lock
    where shd_domain = global_domain
    and   shd_code    = ssd_trans
    and   shd_rec_site = ssd_rec_site
    and   shd_src_site = ssd_src_site
    and   shd_departs >= ipDate
    and   shd_user1 = "":
        return shd_departs.
    end.

    for first ssd_det no-lock
    where ssd_domain = global_domain
    and   ssd_network = ipNetWork
    and   ssd_rec_site = ipSite
    and   (ssd_start = ? or ssd_start <= ipDate)
    and   (ssd_end = ? or ssd_end >= ipDate):
    end.

    if available ssd_det 
    then do i = 1 to 21:
         find first shm_mstr where shm_domain = global_domain
            and (shm_code = ssd_tran
            and shm_src_site = ssd_src_site
            and shm_rec_site = ssd_rec_site
            and ((ipdate + i - 1) >= shm_start and shm_start <> ?)
            and ((ipdate + i - 1) <= shm_end   or shm_end = ?))
         no-lock no-error.

         if not available shm_mstr then
            find first shm_mstr where shm_domain = global_domain
               and (  shm_code = ssd_tran
               and shm_src_site = ssd_src_site
               and shm_rec_site = ssd_rec_site
               and ((ipdate + i - 1) >= shm_start or shm_start = ?)
               and ((ipdate + i - 1) <= shm_end   or shm_end = ?))
            no-lock no-error.
         if available shm_mstr
	 then do:
             if shm_ship_day[weekday(ipdate + i - 1)]
	     and  
               not ((can-find (shop_cal where shop_domain = global_domain
                             and (shop_site = shm_src_site
                             and shop_wkctr = "" and shop_mch = ""))
                  and can-find (hd_mstr where hd_domain = global_domain
                                and (hd_site = shm_src_site
                                and hd_date = ipdate + i - 1)))
               or (not can-find (shop_cal where shop_domain = global_domain
                                 and shop_site = shm_src_site
                                 and shop_wkctr = "" and shop_mch = "")
                  and can-find (shop_cal where shop_domain = global_domain
                                and shop_site = ""
                                and shop_wkctr = "" and shop_mch = "")
                  and can-find (hd_mstr where hd_domain = global_domain
                                and hd_site = ""
                                and hd_date = ipdate + i - 1)))
               then return ipdate + i - 1.
	 end.
     end.
     if available ssd_det
     then do i = 1 to 21:
               if  not ((can-find (shop_cal where shop_domain = global_domain
                             and (shop_site = ssd_src_site
                             and shop_wkctr = "" and shop_mch = ""))
                  and can-find (hd_mstr where hd_domain = global_domain
                                and (hd_site = ssd_src_site
                                and hd_date = ipdate + i - 1)))
               or (not can-find (shop_cal where shop_domain = global_domain
                                 and shop_site = ssd_src_site
                                 and shop_wkctr = "" and shop_mch = "")
                  and can-find (shop_cal where shop_domain = global_domain
                                and shop_site = ""
                                and shop_wkctr = "" and shop_mch = "")
                  and can-find (hd_mstr where hd_domain = global_domain
                                and hd_site = ""
                                and hd_date = ipdate + i - 1)))
               then return ipdate + i - 1.
     
    end.
    if weekday(today) = 6 then return today + 3.
    if weekday(today) = 7 then return today + 2.
    return today + 1.

end.  /* function fNextShipDate */


function fCalcDate returns date
(ipshipsite as char,
 ipsite as char,
 iptransid as char,
 ipnetwork as char,
 ipdsrdue as date,
 ipdsddue as date).
def var vDue as date.
def var vReturn as date.
     vDue = ipdsddue.
     {us/bbi/gprun.i ""dsdate01.p""
           "(ipshipsite,
	     ipsite,
	     iptransid,
	     ipdsrdue,
	     input-output vDue)"} 
     vReturn = vDue.
     {us/bbi/gprun.i ""dsdate02.p""
            "(ipshipsite,
	      ipsite,
	      iptransid,
	      ipnetwork,
	      vDue,
	      input-output vReturn)"}
     return vReturn.
end.   /* function fCalcDate */




function fGetDueDate returns date 
    (ippart as char, ipsite as char, ipshipsite as char, ipdate as date).
def var vTestDate as date.
def var vReqdShip as date.
vReqdShip =  fNextShipDate(fNetWorkCode(ippart, ipsite),
                     ipdate,
		     ipsite).

vTestDate = vReqdShip.
do while fCalcDate(ipshipsite,
                   ipsite,
                   "GIT",
		   fNetworkCode(ippart, ipsite),
		   vTestDate,
		   vTestDate)
< vReqdShip:
  vTestDate = vTestDate + 1.
end.
return vTestDate.


end.  /* function fGetDueDate */



