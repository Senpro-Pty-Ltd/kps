/* xxlog.i    - Include to add logging to debug programs                     */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 29-NOV-2012    BY:  gbg *c1450*                     */
/*---------------------------------------------------------------------------*/


procedure logit.
define input parameter ipmsg as char.

if can-find(first code_mstr
            where code_domain = global_domain
	    and   code_fldname = "debug"
	    and   code_value begins "txfix")
then do:
   output stream xlog to 
             value("/home/mfg/txfix.log")
	     append.
	  
      put stream xlog unformatted
          string(today) "|"
          program-name(1) "|"
          global_userid "|"
          string(time, "HH:MM:SS") "|"
          ipmsg
          skip.

   output stream xlog close.
end.
end.  /* proceddure logit */
