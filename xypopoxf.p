/* xypopoxf.p - Facade for popomtb2.p                                           */
/* popoxf.p - Facade for popomtb2.p                                           */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xypopoxf.p,v 1.2 2018/03/13 17:10:02 gbg Exp $: */
/* $Revision: 1.2 $                                                               */
/*                                                                            */
/* This is a facade for popomtb2.p                                            */
/*                                                                            */
/* Revision: 1.1       BY:Poonam Bahl       Date: 02/28/00  ECO: *N059*       */
/* Revision: 1.3  BY: Mudit Mehta DATE: 11/27/00 ECO: *N0W9* */
/* $Revision: 1.2 $ BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00J* */
/* CYB    LAST MODIFIED: 31-MAY-2013    BY:  gbg *c1416*                     */
/* CYB        LAST MODIFIED: 09-May-2017  BY: gbg *c1603*                */
/*-Revision end---------------------------------------------------------------*/


/*V8:ConvertMode=NoConvert                                                    */

{us/bbi/mfdeclre.i}
{us/bbi/cxcustom.i "POPOXF.P"}

   /* INPUT PARAMETERS */
   define input parameter pPONbr     as character     no-undo.
   define input parameter pIsBlanket like mfc_logical no-undo.
   define input parameter pOpenRequisitionResponse as logical no-undo.
   define output parameter pFailed   like mfc_logical no-undo.

   /* NEW SHARED VARIABLES */
   define new shared variable po_recno  as   recid.
   define new shared variable undo_all  like mfc_logical.
   define new shared variable ponbr     like po_nbr.
   define new shared variable del-yn    like mfc_logical.
   define new shared variable blanket   like mfc_logical.

   /* INITIALIZING ALL NEW SHARED VARIABLES */
   assign
      blanket   = pIsBlanket
      del-yn    = no
      undo_all  = yes
      ponbr     = pPONbr.

   /* OBTAINING PO RECID TO BE USED IN POPOMTB2.P */
   find po_mstr  where po_mstr.po_domain = global_domain and  po_nbr = pPONbr
   no-lock no-error.
   if available po_mstr then
      assign po_recno = recid(po_mstr).

   {&POPOXF-P-TAG1}
/*c1416*    {us/bbi/gprun.i ""popomtb2.p"" "(input pOpenRequisitionResponse)"} */
/*c1416*/   {us/bbi/gprun.i ""xypopomtb2.p"" "(input pOpenRequisitionResponse)"}

   assign
      pFailed = undo_all.
