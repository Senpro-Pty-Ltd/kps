/* xxdopkds.i - QRF DO PIcklist Dataset Defintions                      */
/*----------------------------------------------------------------------------*/
/* Copyright 2019 QAD Inc. All rights reserved.                               */
/*----------------------------------------------------------------------------*/
/* CYB   LAST MODIFIED: 15-FEB-2018    BY: gbg *K10017*Task1163*              */
/*----------------------------------------------------------------------------*/



define temp-table tt_ptdesc
field tp_part       as char format "x(18)"   /* FT REcords P/Q */
field tp_desc1      as char format "x(24)"
field tp_desc2      as char format "x(24)"
.

define temp-table tt_order
field th_nbr              as char format "x(08)"  /* FT Record 0 */
field th_company1         as char format "x(38)"
field th_company2         as char format "x(38)"
field th_company3         as char format "x(38)"
field th_company4         as char format "x(38)"
field th_companycity      as char format "x(24)"
field th_companystate     as char format "x(04)"
field th_companyzip       as char format "x(10)"
field th_company6         as char format "x(38)"
field th_created          as char format "x(08)"
field th_currentdate      as char format "x(08)"
field th_status           as char format "x(08)"
field th_shipdate         as char format "x(08)"
field th_billto1          as char format "x(38)"
field th_billto2          as char format "x(38)"
field th_billto3          as char format "x(38)"
field th_billto4          as char format "x(38)"
field th_billtocity       as char format "x(24)"
field th_billtostate      as char format "x(04)"
field th_billtozip        as char format "x(10)"
field th_billto6          as char format "x(38)"
field th_billattn         as char format "x(16)"
field th_billphn          as char format "x(16)"
field th_rec_site         as char format "x(08)"
field th_po_nbr           as char format "x(22)"
field th_shipvia          as char format "x(20)"
field th_termsdesc        as char format "x(40)"
field th_fob              as char format "x(20)"
field th_rmks             as char format "x(40)"
field th_simul            as char format "x(28)"
field th_email            as char format "x(60)"
field th_usrname          as char format "x(40)"
field th_domain           as char format "x(08)"
/* No additional user fields */
.



define temp-table tt_shipto
field ts_shipto1          as char format "x(38)"  /* FT Type 2 */
field ts_shipto2          as char format "x(38)"
field ts_shipto3          as char format "x(38)"
field ts_shipto4          as char format "x(38)"
field ts_shiptocity       as char format "x(24)"
field ts_shiptostate      as char format "x(04)"
field ts_shiptozip        as char format "x(10)"
field ts_shipto6          as char format "x(38)"
field ts_shipattn         as char format "x(38)"
field ts_shipphn          as char format "x(38)"
/* No additional user fields */
.


define temp-table tt_cmthdr
field tc_cmmt      as char format "x(76)"   /* FT Type A */
.


define temp-table tt_alloc
field ta_part         as char format "x(18)"
field ta_desc1        as char format "x(24)"
field ta_desc2        as char format "x(24)"
field ta_loc          as char format "x(08)"
field ta_lot          as char format "x(18)"
field ta_ref          as char format "x(08)"
field ta_qty_all      as char format "x(20)"
field ta_um           as char format "x(02)"
field ta_shipped      as char format "x(10)"
/* No additional user fields */
.


define temp-table tt_tots
field t5_count     as integer  format ">>>>>>>9"
field t5_weight    as decimal  format "->>,>>9.99<<<<"
field t5_cube      as decimal  format "->>,>>9.99"
/* No additional user fields */
.



