/* xxcsrp10.p - BILL OF MATERIAL COST REPORT                                  */
/* bmpsrp01.p - BILL OF MATERIAL COST REPORT                                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xxcsrp10.p,v 1.2 2018/03/13 17:09:56 gbg Exp $: */
/*F0PN*/ /*V8:ConvertMode=Report                                              */
/* REVISION: 1.0          LAST EDIT: 04/29/86       MODIFIED BY: EMB       */
/* REVISION: 1.0          LAST EDIT: 11/20/86       MODIFIED BY: EMB *41*  */
/* REVISION: 1.0          LAST EDIT: 11/12/87       MODIFIED BY: emb       */
/* REVISION: 4.0          LAST EDIT: 02/16/88       MODIFIED BY: FLM *A175**/
/* REVISION: 4.0          LAST EDIT: 04/12/88       MODIFIED BY: FLM *A196**/
/* REVISION: 4.0          LAST EDIT: 07/29/88       MODIFIED BY: emb *A368**/
/* added no-undo to local variable declarations */
/* REVISION: 4.0          LAST EDIT: 01/04/89       MODIFIED BY: flm *A581**/
/* REVISION: 5.0          LAST EDIT: 07/06/89       MODIFIED BY: BJJ *B106**/
/* REVISION: 5.0          LAST EDIT: 09/21/89       MODIFIED BY: emb *B265**/
/* REVISION: 5.0          LAST EDIT: 04/05/90       MODIFIED BY: pml *B652**/
                                   /*  (rev only) */
/* REVISION: 5.0          LAST EDIT: 04/06/90       MODIFIED BY: emb *B653**/
                                /*  (rev only) */
/* REVISION: 5.0          LAST EDIT: 09/04/90       MODIFIED BY: emb *B784**/
/* REVISION: 6.0          LAST EDIT: 06/10/91       MODIFIED BY: emb *D509**/
/* REVISION: 7.0          LAST EDIT: 09/25/91                BY: pma *F003**/
/* REVISION: 8.6          LAST EDIT: 10/14/97       MODIFIED BY: gyk *K0ZG**/
/* REVISION: 9.1      LAST MODIFIED: 03/24/00 BY: *N08T* Annasaheb Rahane */
/* REVISION: 9.1      LAST MODIFIED: 08/11/00 BY: *N0KK* jyn                  */
/* CYB   LAST MODIFIED: 05-AUG-2013    BY: gbg  *c1429                        */
/*F003***********************************************************************/
/*               COMMENTED OUT ENTIRE EXISTING PROGRAM                      */
/*                                AND                                       */
/*                   REPLACED IT WITH THE FOLLOWING:                        */
/*       (NOTE: THE REPORT PRODUCED IS IDENTICAL TO THE PREVIOUS ONE)       */
/*F003***********************************************************************/
/*K0ZG*/ {us/bbi/mfdeclre.i}
{us/bbi/gplabel.i &ClearReg=yes} /* EXTERNAL LABEL INCLUDE */
/*F003*/ define new shared variable transtype as character format "x(4)".
/*K0ZG*
/*F003*/ {us/bbi/mfdeclre.i}
*K0ZG*/
/*K0ZG*/ {us/wb/wbrp01.i}

/*F003*/ transtype = "BM".
/*F003*/ {us/bbi/gprun.i ""xxcsrp07.p""}
/*K0ZG*/ {us/wb/wbrp04.i}
