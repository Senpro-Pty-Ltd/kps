/* sofmsv09.p - Formtrap Shipper Print routine                                */
/* sofmsv01.p - SHIPPER FORM SERVICE ENCAPSULATION PROCEDURE                  */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: sofmsv09.p,v 1.3 2018/08/28 21:32:48 nac Exp $: */
/* REVISION: 8.6      LAST MODIFIED: 11/12/96   BY: *K003* Steve Goeke        */
/* REVISION: 8.6      LAST MODIFIED: 12/06/96   BY: *K02Z* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 12/19/96   BY: *K03J* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 01/28/97   BY: *K04R* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 02/05/97   BY: *K05Z* Steve Goeke        */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K04X* Steve Goeke        */
/* REVISION: 8.6      LAST MODIFIED: 03/28/97   BY: *G2LS* Jim Williams       */
/* REVISION: 8.6      LAST MODIFIED: 03/25/97   BY: *K0DH* Arul Victoria      */
/* REVISION: 8.6      LAST MODIFIED: 06/20/97   BY: *H19N* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 09/09/97   BY: *J20J* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 09/25/97   BY: *K0JZ* Joe Gawel          */
/* REVISION: 8.6      LAST MODIFIED: 10/01/97   BY: *K0KF* Joe Gawel          */
/* REVISION: 8.6      LAST MODIFIED: 10/23/97   BY: *J23T* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 11/07/97   BY: *K18J* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 11/19/97   BY: *K19X* Jim Williams       */
/* REVISION: 8.6      LAST MODIFIED: 11/25/97   BY: *J26R* Niranjan R.        */
/* REVISION: 8.6      LAST MODIFIED: 12/13/97   BY: *J20Q* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 12/19/97   BY: *J28J* Manish K.          */
/* REVISION: 8.6      LAST MODIFIED: 01/01/98   BY: *K1DL* Suresh Nayak       */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* A. Rahane          */
/* REVISION: 8.6E     LAST MODIFIED: 05/20/98   BY: *K1Q4* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 07/20/98   BY: *H1MC* Manish K.          */
/* REVISION: 8.6E     LAST MODIFIED: 08/05/98   BY: *J2VP* Manish K.          */
/* REVISION: 8.6E     LAST MODIFIED: 08/22/98   BY: *K1W8* Poonam Bahl        */
/* REVISION: 8.6E     LAST MODIFIED: 09/30/98   BY: *K1XF* Surekha Joshi      */
/* REVISION: 8.6E     LAST MODIFIED: 10/04/98   BY: *J314* Alfred Tan         */
/* REVISION: 8.6E     LAST MODIFIED: 07/12/98   BY: *K21J* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 08/27/99   BY: *N024* J. Fernando        */
/* REVISION: 9.1      LAST MODIFIED: 09/23/99   BY: *K230* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 10/25/99   BY: *N002* B. Gates           */
/* REVISION: 9.1      LAST MODIFIED: 06/30/99   BY: *N004* Patrick Rowan      */
/* REVISION: 9.1      LAST MODIFIED: 12/28/99   BY: *N05X* Surekha Joshi      */
/* REVISION: 9.1      LAST MODIFIED: 02/10/00   BY: *L0RC* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 04/10/00   BY: *L0RG* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 05/01/00   BY: *N0BG* Steve Nugent       */
/* REVISION: 9.1      LAST MODIFIED: 06/20/00   BY: *J3PY* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 07/06/00   BY: *N0F4* Mudit Mehta        */
/* REVISION: 9.1      LAST MODIFIED: 07/10/00   BY: *L118* Abhijeet Thakur    */
/* REVISION: 9.1      LAST MODIFIED: 08/08/00   BY: *M0QZ* Rajesh Kini        */
/* REVISION: 9.1      LAST MODIFIED: 08/18/00   BY: *N0MC* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 12/02/00   BY: *M0X8* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 10/14/00   BY: *N0W8* BalbeerS Rajput    */
/* Old ECO marker removed, but no ECO header exists *K139*                    */
/* Revision: 1.26.3.18  BY: Rajiv Ramaiah      DATE: 05/18/01 ECO: *M17M*     */
/* Revision: 1.26.3.19  BY: Steve Nugent       DATE: 07/09/01 ECO: *P007*     */
/* Revision: 1.26.3.20  BY: Chris Green        DATE: 07/27/01 ECO: *N101*     */
/* Revision: 1.26.3.22  BY: Nikita Joshi       DATE: 09/07/01 ECO: *M1JZ*     */
/* Revision: 1.26.3.23  BY: Ashwini G.         DATE: 11/09/01 ECO: *N160*     */
/* Revision: 1.26.3.24  BY: Rajaneesh S.       DATE: 03/08/02 ECO: *N1CC*     */
/* Revision: 1.26.3.25  BY: Katie Hilbert      DATE: 04/15/02 ECO: *P03J*     */
/* Revision: 1.26.3.26  BY: Jean Miller        DATE: 05/13/02 ECO: *P05M*     */
/* Revision: 1.26.3.28  BY: Ashish Kapadia     DATE: 08/16/02 ECO: *N1Q1*     */
/* Revision: 1.26.3.31  BY: Rajiv Ramaiah      DATE: 08/20/02 ECO: *N1R4*     */
/* Revision: 1.26.3.34  BY: Shilpa Athalye     DATE: 05/14/03 ECO: *N2FK*     */
/* Revision: 1.26.3.36  BY: Paul Donnelly (SB) DATE: 06/28/03 ECO: *Q00L*     */
/* Revision: 1.26.3.37  BY: K Paneesh          DATE: 08/01/03 ECO: *P0VB*     */
/* Revision: 1.26.3.38  BY: Ashutosh Pitre     DATE: 10/05/03 ECO: *P153*     */
/* Revision: 1.26.3.39  BY: Vinay Soman        DATE: 10/29/03 ECO: *P17B*     */
/* Revision: 1.26.3.40  BY: Rajiv Ramaiah      DATE: 11/18/03 ECO: *P19R*     */
/* Revision: 1.26.3.41  BY: Kirti Desai        DATE: 01/15/04 ECO: *P1JK*     */
/* Revision: 1.26.3.42  BY: Vinay Soman        DATE: 01/27/04 ECO: *P1L6*     */
/* Revision: 1.26.3.43  BY: Vinay Soman        DATE: 02/12/04 ECO: *P1NH*     */
/* Revision: 1.26.3.44  BY: Salil Pradhan      DATE: 02/23/04 ECO: *P1Q4*     */
/* Revision: 1.26.3.45  BY: Shivaraman V.      DATE: 05/11/04 ECO: *P212*     */
/* Revision: 1.26.3.47  BY: Ed van de Gevel    DATE: 03/05/04 ECO: *P1S6*     */
/* Revision: 1.26.3.47  BY: Ed van de Gevel    DATE: 04/20/04 ECO: *P1ZM*     */
/* Revision: 1.26.3.48  BY: Swati Sharma       DATE: 04/20/04 ECO: *P28J*     */
/* Revision: 1.26.3.49  BY: Vivek Gogte        DATE: 07/28/04 ECO: *Q0BM*     */
/* Revision: 1.26.3.50  BY: Vandna Rohira      DATE: 11/10/04 ECO: *P2TS*     */
/* Revision: 1.26.3.54  BY: Ed van de Gevel    DATE: 03/01/05 ECO: *R00G*     */
/* Revision: 1.26.3.55  BY: Ed van de Gevel    DATE: 18/03/05 ECO: *R00F*     */
/* Revision: 1.26.3.56  BY: Bhavik Rathod      DATE: 03/24/05 ECO: *P3CR*     */
/* Revision: 1.26.3.57  BY: K Paneesh          DATE: 07/21/05 ECO: *P3V4*     */
/* Revision: 1.26.3.58  BY: Manish Dani        DATE: 07/30/05 ECO: *P3VN*     */
/* Revision: 1.26.3.59  BY: Sai ZHANG          DATE: 03/27/05 ECO: *R03P*     */
/* Revision: 1.26.3.62  BY: Sanat Paul         DATE: 06/22/06 ECO: *P4TX*     */
/* Revision: 1.26.3.64  BY: Prerita Joshi      DATE: 09/18/06 ECO: *P56F*     */
/* Revision: 1.26.3.65  BY: Ellen Borden       DATE: 01/30/08 ECO: *R059*     */
/* Revision: 1.26.3.66    BY: Prashant S          DATE: 02/08/08 ECO: *P6L8* */
/* Revision: 1.26.3.69    BY: Jean Miller         DATE: 06/18/08  ECO: *R0VD* */
/* Revision: 1.26.3.70    BY: Jean Miller         DATE: 08/12/08  ECO: *P4S1* */
/* Revision: 1.26.3.72    BY: Jean Miller         DATE: 10/07/08  ECO: *R15M* */
/* Revision: 1.26.3.75    BY: Rohan Golatkar      DATE: 12/09/08  ECO: *Q1WJ* */
/* Revision: 1.26.3.76    BY: Prajakta Patil      DATE: 06/22/09  ECO: *P66L* */
/* Revision: 1.26.3.77    BY: Rajalaxmi Ganji     DATE: 07/09/09  ECO: *Q2QZ* */
/* Revision: 1.26.3.78    BY: Prabu M             DATE: 14/01/10  ECO: *R1TG* */
/* Revision: 1.26.3.80    BY: Jean Miller         DATE: 02/10/10  ECO: *R1Y2* */
/* Revision: 1.26.3.81    BY: Rajalaxmi Ganji     DATE: 04/28/10  ECO: *Q41F* */
/* Revision: 1.26.3.81    BY: sxh     DATE: 31/03/16  ECO: *grc338* */
/* CYB       QAD2016EE    BY: nac               DATE: 28AUG18   ECO: *k10017tsk1139* */
/*-Revision end---------------------------------------------------------------*/
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/*****************************************************************************/
/*                                                                            */
/* Description:                                                               */
/* GENERAL DESCRIPTION OF SHIPPER FORM SERVICE ENCAPSULATION                  */
/*                                                                            */
/* All procedures of the form "sofmsvXX.p" - where "XX" is the two-character  */
/* form code associated with the document format of a shipper - may           */
/* encapsulate any of the following set of shipper service procedures:        */
/*                                                                            */
/*   sh_gather_header  - invoked during maintenance of a shipper to gather    */
/*                       additional header-level information required to      */
/*                       appear on the printed shipper document               */
/*   sh_gather_item    - invoked during maintenance of a shipper to gather    */
/*                       additional line item-level information required to   */
/*                       appear on the printed shipper document               */
/*   sh_gather_trailer - invoked during maintenance of a shipper to gather    */
/*                       additional trailer-level information required to     */
/*                       appear on the printed shipper document               */
/*   sh_print          - invoked to perform the actual printing of a single   */
/*                       shipper document                                     */
/*   sh_rename         - invoked to change the key fields of the additional   */
/*                       header-, line item-, and trailer- level information  */
/*                       records when the shipper number changes              */
/*   sh_archive        - invoked to archive the additional header, line      */
/*                       item, and trailer information associated with a     */
/*                       single shipper header or detail record, as well as  */
/*                       all of its descendant (children, grandchildren,     */
/*                       etc.) records                                       */
/*   sh_delete         - invoked to delete the additional header, line item, */
/*                       and trailer information associated with a single    */
/*                       shipper header or detail record, as well as all of  */
/*                       its descendant records                              */
/*                                                                           */
/*                                                                           */
/* It is not required for a given service encapsulation routine to include   */
/* all of the above services, since not all of the services may be           */
/* applicable to a given format.  Hence it is necessary to check the         */
/* availability of any service before attempting to invoke it.               */
/*                                                                           */
/*****************************************************************************/
/*                                                                           */
/* INVOKING SERVICES                                                         */
/*                                                                           */
/* Shipper services are invoked from within MFG/PRO by running the           */
/* encapsulation procedure appropriate to the shipper's document format      */
/* PERSISTENT, checking whether the desired service(s) is available, running */
/* either the available internal service routine(s) encapsulated in the      */
/* persistent procedure or some alternative routine, and deleting the        */
/* encapsulation procedure.                                                  */
/*                                                                           */
/* The following serves as an example:                                       */
/*                                                                           */
/*                                                                           */
/*       define variable h_form_svc as handle no-undo.                       */
/*                                                                           */
/*       run sofmsvXX.p persistent set h_form_svc.                           */
/*                                                                           */
/*       if lookup ("sh_delete",h_form_svc:INTERNAL-ENTRIES) > 0 then        */
/*                                                                           */
/*          run sh_delete in h_form_svc (recid(abs_mstr)).                   */
/*                                                                           */
/*       else                                                                */
/*                                                                           */
/*          <take appropriate alternative action>.                           */
/*                                                                           */
/*       delete procedure h_form_svc.                                        */
/*                                                                           */
/*                                                                           */
/*****************************************************************************/
/*                                                                           */
/* ADDING ADDITIONAL SETS OF SERVICES                                        */
/*                                                                           */
/* Shipper form services may be added to support additional document formats */
/* as required.  To add a set of services, an encapsulation routine of the   */
/* form "sofmsvXX.p" must be created, where "XX" is a unique two-character   */
/* form code associated with the document format of a shipper.  This should  */
/* encapsulate - that is, include as an internal routine - any of the seven  */
/* possible services required by shippers using the format.  These internal  */
/* service routines MUST accept input parameters as follows:                 */
/*                                                                           */
/*   sh_gather_header  - recid of shipper for which data is to be gathered   */
/*   sh_gather_item    - recid of shipper for which data is to be gathered   */
/*   sh_gather_trailer - recid of shipper for which data is to be gathered   */
/*   sh_print          - recid of shipper to be printed,                     */
/*                       logical indicating whether to print ship comments,  */
/*                       logical indicating whether to print pack comments,  */
/*                       logical indicating whether to print features and    */
/*                       options                                             */
/*   sh_rename         - recid of shipper whose number is to change,         */
/*                       new value of the abs_id field                       */
/*   sh_archive        - recid of shipper or shipper line to be archived,    */
/*                       name of archive file                                */
/*   sh_delete         - recid of shipper or shipper line to be deleted      */
/*                                                                           */
/* It should not be required to modify any other standard MFG/PRO routines   */
/* to invoke these services, since the invokation points are already         */
/* provided.                                                                 */
/*                                                                           */
/* A service encapsulation routine should NEVER directly create, modify, or  */
/* delete any database table.  Such updates should always be performed in a  */
/* separately-compiled procedure.  This ensures that users without full      */
/* Progress can add or modify services.                                      */
/*                                                                           */
/*****************************************************************************/
/*                                                                           */
/* INTERNAL SUPPORT ROUTINES                                                 */
/*                                                                           */
/* It may be necessary to create additional routines internal to the service */
/* encapsulation procedure to support the provided service routines.  In     */
/* such cases, it is suggested that the support routines be named using a    */
/* "supp_" prefix, rather than the "sh_" prefix used by the service          */
/* routines, so that the two types of routines may be easily distinguished.  */
/*                                                                           */
/* Support routines should NEVER be invoked from outside of the service      */
/* encapsulation procedure.                                                  */
/*                                                                           */
/*****************************************************************************/
/*****************************************************************************/
/*                                                                           */
/* SPECIFIC DESCRIPTION - sofmsv01.p                                         */
/*                                                                           */
/* This particular instance of a service encapsulation routine, sofmsv01.p,  */
/* provides the services required for processing standard shippers.  Since   */
/* no additional information is required for such shippers, the only         */
/* functional service routine provided here is sh_print.  However,           */
/* non-functional examples of each of the other service routines -           */
/* sh_gather_header, sh_gather_item, sh_gather_trailer, sh_rename,           */
/* sh_archive, and sh_delete - are also included, to serve as models for     */
/* later development of actual service routines to fulfill localization      */
/* requirements.                                                             */
/*                                                                           */
/* A new service encapsulation routine can be created by simply copying and  */
/* modifying sofmsv01.p.  The sample service routines are disabled by being  */
/* enclosed in comments, but are otherwise fully functional.  Remove the     */
/* comments disabling whichever service procedures are required, and then    */
/* make the appropriate modifications.                                       */
/*                                                                           */
/*****************************************************************************/
/*                                                                           */
 
/* COMMON DEFINITIONS */
 
/* Here are defined all structures which must be accessible by */
/* multiple routines internal to the service encapsulation     */
/* procedure, but which cannot be passed as parameters, as     */
/* well as structures which Progress does not allow to be      */
/* defined within any internal routine.  This includes global  */
/* variables, frames, temp tables, constants, streams, etc.    */
/* Also defined here are any shared variables required to      */
/* support calls to legacy routines, since shared variables    */
/* cannot be defined within internal routines.                 */
 
 
/* INCLUDE FILE FOR SHARED VARIABLES */
{us/bbi/mfdeclre.i}
{us/so/sofs9pu.i "new" } /*grc338*/
{us/xf/xfdefa.i "new"} /*grc338*/
{us/xf/xfsofm09v.i}    /*grc338*/

{us/px/pxphdef.i gpumxr}
 
/* EXTERNAL LABEL INCLUDE */
{us/bbi/gplabel.i}
{us/gp/gpuid.i}
 
/* SHIPPER TEMP TABLE DEFINITION */
{us/rc/rcwabsdf.i new}
 
/* TEMP-TABLE DEFINITION FOR ttMasterSerialToShipper */
{us/pa/pattrciq.i}

{us/px/pxmaint.i}
{us/px/pxphdef.i ppcixr}
{us/px/pxphdef.i rcshwbxr}
{us/px/pxphdef.i pasexr}
 
{us/px/pxphdef.i caatdxr}
{us/px/pxphdef.i captdxr2}
{us/px/pxphdef.i caisxr}
{us/px/pxphdef.i pasopixr}

{us/ca/caattr.i}
{us/ca/cattdef2.i}
{us/pa/papgsch.i}
/* FRAME f_non_so_ship IN ROUTINE sh_print IS DEFINED AS DISPLAY OF */
/* Cumulative Qty Shipped IS NOT REQUIRED FOR NON SO SHIPPERS       */
 
/* Define the name of this procedure, used to identify records */
/* in qad_wkfl that are created, modified, or deleted by any   */
/* service encapsulated here.                                  */

/* &SCOPED-DEFINE PROC-NAME 'sofmsv01' *grc338*/
&scoped-define PROC-NAME 'sofmsv09.p' /*grc338*/

/* Define prefixes used to identify qad_wkfl records holding   */
/* additional header, line item, or trailer information.       */
 
&SCOPED-DEFINE HDR-PREFIX 'HDR'
&SCOPED-DEFINE ITM-PREFIX 'ITM'
&SCOPED-DEFINE TRL-PREFIX "TRL"
 
/* Define an unprintable field delimiter, to be used by all of */
/* the service routines which pack/unpack multiple variable-   */
/* length fields stored within a single character variable,    */
/* such as header, line item, and trailer data-gathering       */
/* routines.  Without using such a delimiter, fields with      */
/* values such as "AB" and "C" would be indistinguishable from */
/* those with values of "A" and "BC" when packed together.  An */
/* unprintable delimiter ensures that the user could not have  */
/* inadvertantly or intentionally entered the delimiter within */
/* any field that is to be packed. */
 
&SCOPED-DEFINE delimiter chr(1)
 
/* HEADER DATA-GATHERING SERVICE DEFINITIONS */
 
/* < Add defs required by the header data-gathering service here > */
 
/* LINE ITEM DATA-GATHERING SERVICE DEFINITIONS */
 
/* < Add defs required by line item data-gathering service here > */
 
/* TRAILER DATA-GATHERING SERVICE DEFINITIONS */
 
/* < Add defs required by the trailer data-gathering service here > */
 
/* PRINT SERVICE DEFINITIONS */
 
/* Required for external procedure gpaddr.p */
define new shared variable addr as character format "x(38)" extent 6.
 
define variable mHasPendingPickPack as logical no-undo.
define variable mPrevOidPackInfo as decimal no-undo.
define variable mOidPackInfo as decimal no-undo.
define variable mPackDesc as character no-undo.
define variable mPackQty as decimal no-undo.
define variable mPackTareWt as decimal no-undo.
define variable mPackTareWtUm as character no-undo.
define variable mPackNetWt as decimal no-undo.
define variable mPackNetWtUm as character no-undo.
define variable mPackGrossWt as decimal no-undo.
define variable mPackGrossWtUm as character no-undo.
define variable mTotalTareWt as decimal no-undo.
define variable mTotalNetWt as decimal no-undo.
define variable mTotalGrossWt as decimal no-undo.

define variable ps_print_item like pt_part format "x(40)"   no-undo.
define variable disp_item     like ps_print_item            no-undo.
define variable shipper-po    as   character format "x(22)" no-undo.
 
define temp-table t_abs_det no-undo
   field det_item     like abs_mstr.abs_item
   field det_order    like abs_mstr.abs_order
   field det_line     like abs_mstr.abs_line
   field det_qty      like abs_mstr.abs_qty
   field det_ship_qty like abs_mstr.abs_ship_qty
   field det_um       like abs_mstr.abs__qad02
   field det_conv     like abs_mstr.abs__qad03
   field det_cmtindx  like abs_mstr.abs_cmtindx
   field det_id       like abs_mstr.abs_id
   field det_shipfrom like abs_mstr.abs_shipfrom
   index item is primary
      det_item
      det_order
      det_line
   index order
      det_order.
 
define temp-table t_abs_comp no-undo
   field comp_item     like abs_mstr.abs_item
   field comp_shipfrom like abs_mstr.abs_shipfrom
   field comp_order    like abs_mstr.abs_order
   field comp_line     like abs_mstr.abs_line
   field comp_qty      like abs_mstr.abs_qty
   field comp_qty_picked like abs_mstr.abs_qty
   field comp_cmtindx  as   character
   index item_ship is primary
      comp_item
      comp_shipfrom
      comp_order
      comp_line
   index item_order
      comp_item
      comp_order
      comp_line
   index shipfrom
      comp_shipfrom
      comp_order
      comp_line.
 
/* ADDED  THE FOLLOWING CODE TO PRINT AUTHORIZATION NUMBER */
define temp-table t_absr_det no-undo
   field t_absr_reference like absr_reference
   field t_absr_qty like absr_qty.
 
/* ADDED THE FOLLOWING TABLE TO PRINT CUSTOMER SEQUENCES */
define new shared temp-table t_abss_det no-undo
   field t_abss_ship_id like abss_ship_id
   field t_abss_from_cust_job like abss_cust_job
   field t_abss_from_cust_seq like abss_cust_seq
   field t_abss_to_cust_job like abss_cust_job
   field t_abss_to_cust_seq like abss_cust_seq.

/* ADDED THE FOLLOWING TABLE TO PRINT SHIPPER LINE ITEM COMMENTS */
define temp-table ttcmtindx no-undo
   field tt_cmtindx as integer.
 
/* ARCHIVE SERVICE DEFINITIONS */
 
define stream s_history.
 
form
   ps_print_item                           column-label "Item Number!Serial ID"
   shipper-po                              column-label "PO Number"
   det_qty      format "->>>>>>9.99<<<<<<" column-label "Qty Shipped"
   abs_mstr.abs__qad02   format "x(2)"     column-label "UM"
with frame f_det down width 80 no-box.

/* SET EXTERNAL LABELS */
setFrameLabels(frame f_det:handle).
 
/* RENAME SERVICE DEFINITIONS */
 
/* < ADD DEFS REQUIRED BY THE RENAME SERVICE HERE > */
 
/* DELETE SERVICE DEFINITIONS */
 
/* < ADD DEFS REQUIRED BY THE DELETE SERVICE HERE > */
 
/* END OF COMMON DEFINITIONS */
 
/* DUMMY REFERENCES FOR bomS, UNREFERENCED-FILE REPORTS, ETC. */
if false
then do:
   {us/bbi/gprun.i ""gpqwdel.p""}
   {us/bbi/gprun.i ""gpqwren.p""}
end.
 
find qad_wkfl  where qad_wkfl.qad_domain = global_domain and
     qad_key1 = "SHIPPER" and
     qad_key2 = SessionUniqueID
no-lock no-error.
create t_abs_det.
 
/*****************************************************************************/
/* DO NOT REMOVE THE PROCEDURES: sh_gather_header, sh_gather_item, sh_gather_trailer */
/* THIS TEMPLATE CODE IS PROVIDED TO CUSTOMERS FOR CREATING CUSTOMIZED FORM SERVICES */
 
         /* HEADER DATA-GATHERING SERVICE */
 
/*         /* Remove comments to enable this service */
 *
 *         /* NOTE:  If additional header information is stored in any table */
 *         /* other than abs_mstr, remember that services to rename, delete, */
 *         /* and possibly archive the information will also be required. */
 *
 *
 *         PROCEDURE sh_gather_header:
 *
 *            /* Gathers additional header data associated with a shipper */
 *            /* and required to appear on the printed shipper document  */
 *
 *            /* INPUT PARAMETERS */
 *            define input parameter i_abs_recid as recid no-undo.
 *
 *            /* LOCAL VARIABLES */
 *            define variable v_char as   character   label "Local Char" no-undo.
 *            define variable v_int  as   integer     label "Local Int"  no-undo.
 *            define variable v_dec  like mfc_decimal label "Local Dec"  no-undo.
 *            define variable v_log  like mfc_logical label "Local Log"  no-undo.
 *            define variable v_date as   date        label "Local Date" no-undo.
 *
 *            /* FRAMES */
 *            form
 *               skip (1)
 *               v_char  colon 15
 *               v_int   colon 15
 *               v_dec   colon 15
 *               v_log   colon 15
 *               v_date  colon 15
 *               skip (1)
 *            with frame a overlay side-labels centered row 8
 *               title color normal " Local Header Data ".
 *
 *
 *            /* PROCEDURE BODY */
 *
 *            /* Find the shipper record with which this data is associated. */
 *            /* If it's not available, there's nothing to do, so leave. */
 *
 *            find abs_mstr no-lock where recid(abs_mstr) = i_abs_recid
 *               no-error.
 *            if not available abs_mstr then return.
 *
 *            /* Load data from qad_wkfl */
 *            run
 *               supp_load_qad_wkfl (
 *                  {&PROC-NAME},
 *                  {&HDR-PREFIX} + abs_shipfrom + {&DELIMITER} + abs_id,
 *                  output v_char,
 *                  output v_int,
 *                  output v_dec,
 *                  output v_log,
 *                  output v_date ).
 *
 *            /* Display info */
 *            display v_char v_int v_dec v_log v_date with frame a.
 *
 *            /* Prompt for user update */
 *            do on endkey undo, leave with frame a:
 *               set v_char v_int v_dec v_log v_date.
 *            end.  /* do on endkey */
 *
 *            hide frame a.
 *
 *            /* Save data into qad_wkfl */
 *            if keyfunction(lastkey) <> "END-ERROR" then
 *               run
 *                  supp_save_qad_wkfl (
 *                     {&PROC-NAME},
 *                     {&HDR-PREFIX} + abs_shipfrom + {&DELIMITER} + abs_id,
 *                     v_char,
 *                     v_int,
 *                     v_dec,
 *                     v_log,
 *                     v_date ).
 *
 *         END PROCEDURE.  /* sh_gather_header */
 */
         /* END OF HEADER DATA-GATHERING SERVICE */
 
/*****************************************************************************/
 
         /* LINE ITEM DATA-GATHERING SERVICE */
 
/*         /* Remove comments to enable this service */
 *
 *         /* NOTE:  If additional line item information is stored in any */
 *         /* table other than abs_mstr, remember that services to delete */
 *         /* and possibly archive the information will also be required. */
 *
 *
 *         PROCEDURE sh_gather_item:
 *
 *            /* Gathers additional line item data associated with a shipper */
 *            /* and required to appear on the printed shipper document  */
 *
 *            /* INPUT PARAMETERS */
 *            define input parameter i_abs_recid as recid no-undo.
 *
 *            /* LOCAL VARIABLES */
 *            define variable v_char as   character   label "Local Char" no-undo.
 *            define variable v_int  as   integer     label "Local Int"  no-undo.
 *            define variable v_dec  like mfc_decimal label "Local Dec"  no-undo.
 *            define variable v_log  like mfc_logical label "Local Log"  no-undo.
 *            define variable v_date as   date        label "Local Date" no-undo.
 *
 *            /* FRAMES */
 *            form
 *               skip (1)
 *               abs_item   colon 15  label "Item"
 *               abs_lotser colon 15
 *               abs_ref    colon 15
 *               skip (1)
 *               v_char  colon 15
 *               v_int   colon 15
 *               v_dec   colon 15
 *               v_log   colon 15
 *               v_date  colon 15
 *               skip (1)
 *            with frame a overlay side-labels centered row 8
 *               title color normal " Local Line Item Data ".
 *
 *
 *            /* PROCEDURE BODY */
 *
 *            /* Find the shipper record with which this data is associated. */
 *            /* If it's not available, there's nothing to do, so leave. */
 *
 *            find abs_mstr no-lock where recid(abs_mstr) = i_abs_recid
 *               no-error.
 *            if not available abs_mstr then return.
 *
 *            /* Load data from qad_wkfl */
 *            run
 *               supp_load_qad_wkfl (
 *                  {&PROC-NAME},
 *                  {&ITM-PREFIX} + abs_shipfrom + {&DELIMITER} + abs_id,
 *                  output v_char,
 *                  output v_int,
 *                  output v_dec,
 *                  output v_log,
 *                  output v_date ).
 *
 *            /* Display info */
 *            display
 *               abs_item abs_lotser abs_ref
 *               v_char v_int v_dec v_log v_date
 *            with frame a.
 *
 *            /* Prompt for user update */
 *            do on endkey undo, leave with frame a:
 *               set v_char v_int v_dec v_log v_date.
 *            end.  /* do on endkey */
 *
 *            hide frame a.
 *
 *            /* Save data into qad_wkfl */
 *            if keyfunction(lastkey) <> "END-ERROR" then
 *               run
 *                  supp_save_qad_wkfl (
 *                     {&PROC-NAME},
 *                     {&ITM-PREFIX} + abs_shipfrom + {&DELIMITER} + abs_id,
 *                     v_char,
 *                     v_int,
 *                     v_dec,
 *                     v_log,
 *                     v_date ).
 *
 *         END PROCEDURE.  /* sh_gather_item */
 */
          /* END OF LINE ITEM DATA-GATHERING SERVICE */
 
/*****************************************************************************/
 
         /* TRAILER DATA-GATHERING SERVICE */
 
/*         /* Remove comments to enable this service */
 *
 *         /* NOTE:  If additional trailer information is stored in any */
 *         /* table other than abs_mstr, remember that services to rename, */
 *         /* delete, and possibly archive the information will also be */
 *         /* required. */
 *
 *
 *         PROCEDURE sh_gather_trailer:
 *
 *            /* Gathers additional trailer data associated with a shipper */
 *            /* and required to appear on the printed shipper document  */
 *
 *            /* INPUT PARAMETERS */
 *            define input parameter i_abs_recid as recid no-undo.
 *
 *            /* LOCAL VARIABLES */
 *            define variable v_char as   character   label "Local Char" no-undo.
 *            define variable v_int  as   integer     label "Local Int"  no-undo.
 *            define variable v_dec  like mfc_decimal label "Local Dec"  no-undo.
 *            define variable v_log  like mfc_logical label "Local Log"  no-undo.
 *            define variable v_date as   date        label "Local Date" no-undo.
 *
 *            /* FRAMES */
 *            form
 *               skip (1)
 *               v_char  colon 15
 *               v_int   colon 15
 *               v_dec   colon 15
 *               v_log   colon 15
 *               v_date  colon 15
 *               skip (1)
 *            with frame a overlay side-labels centered row 8
 *               title color normal " Local Trailer Data ".
 *
 *
 *            /* PROCEDURE BODY */
 *
 *            /* Find the shipper record with which this data is associated. */
 *            /* If it's not available, there's nothing to do, so leave. */
 *
 *            find abs_mstr no-lock where recid(abs_mstr) = i_abs_recid
 *               no-error.
 *            if not available abs_mstr then return.
 *
 *            /* Load data from qad_wkfl */
 *            run
 *               supp_load_qad_wkfl (
 *                  {&PROC-NAME},
 *                  {&TRL-PREFIX} + abs_shipfrom + {&DELIMITER} + abs_id,
 *                  output v_char,
 *                  output v_int,
 *                  output v_dec,
 *                  output v_log,
 *                  output v_date ).
 *
 *            /* Display info */
 *            display v_char v_int v_dec v_log v_date with frame a.
 *
 *            /* Prompt for user update */
 *            do on endkey undo, leave with frame a:
 *               set v_char v_int v_dec v_log v_date.
 *            end.  /* do on endkey */
 *
 *            hide frame a.
 *
 *            /* Save data into qad_wkfl */
 *            if keyfunction(lastkey) <> "END-ERROR" then
 *               run
 *                  supp_save_qad_wkfl (
 *                     {&PROC-NAME},
 *                     {&TRL-PREFIX} + abs_shipfrom + {&DELIMITER} + abs_id,
 *                     v_char,
 *                     v_int,
 *                     v_dec,
 *                     v_log,
 *                     v_date ).
 *
 *         END PROCEDURE.  /* sh_gather_trailer */
 */
         /* END OF TRAILER DATA-GATHERING SERVICE */
 
/*****************************************************************************/
 
/* PRINT SERVICE */
 
PROCEDURE sh_print:
   {us/xf/xfsofm09v.i} /*S6B01*/
   /* Prints a single shipper */
 
   /* This routine is logically equivalent to rcrp1301.p */
 
   /* INPUT PARAMETERS */
   define input parameter i_abs_recid        as recid         no-undo.
   define input parameter i_ship_comments    like mfc_logical no-undo.
   define input parameter i_pack_comments    like mfc_logical no-undo.
   define input parameter i_features         like mfc_logical no-undo.
   define input parameter i_print_sodet      like mfc_logical no-undo.
   define input parameter i_so_um            like mfc_logical no-undo.
   define input parameter i_comp_addr        like ad_addr     no-undo.
   define input parameter i_print_lotserials like mfc_logical no-undo.
   define input parameter p_cust             like mfc_logical no-undo.
   define input parameter i_item_serial      like mfc_logical no-undo.
 
   /* LOCAL VARIABLES */
   define variable company      as   character format "x(38)" extent 6 no-undo.
   define variable billto       as   character format "x(38)" extent 6 no-undo.
   define variable shipto       as   character format "x(38)" extent 6 no-undo.
   define variable rpt_type     as   character format "x(23)" no-undo.
   define variable type_nbr     as   character format "x(17)" no-undo.
   define variable shipper_id   like abs_mstr.abs_id          no-undo.
   define variable ship_date    as   date                     no-undo.
   define variable print_date   as   date                     no-undo.
   define variable cust         like so_cust                  no-undo.
   define variable ship         like so_ship                  no-undo.
   define variable shipto_id    as   character                no-undo.
   define variable soldto_id    as   character                no-undo.
   define variable abs_shipvia  like so_shipvia               no-undo.
   define variable abs_fob      like so_fob                   no-undo.
   define variable abs_trans_mode as character format "x(20)" no-undo.
   define variable abs_carr_ref as   character format "x(20)" no-undo.
   define variable abs_totalpallet like abs__qadd01 format ">>9" no-undo.
   define variable abs_veh_ref  as   character format "x(20)" no-undo.
   define variable cum_qty      like sod_cum_qty[1] extent 0  no-undo.
   define variable cmt_ctr      as   integer                  no-undo.
   define variable i            as   integer                  no-undo.
   define variable dqty         like sob_qty_req
      format "->>>>>>>9.9<<<<<" no-undo.
   define variable v_tr_type    like im_tr_type               no-undo.
   define variable v_start_page as   integer                  no-undo.
   define variable msgdesc like msg_desc initial "" format "x(62)"
      no-undo.
   define variable addr_id      as   character                no-undo.
   define variable l_abs_twt       like abs_gwt               no-undo.
   define variable l_abs_tare_wt   like abs_gwt               no-undo.
   define variable l_tare_wt       like abs_gwt
      label "Tare!Weight"                      no-undo.
   define variable l_par_shipfrom  as character                no-undo.
   define variable l_par_id        as character                no-undo.
   define variable l_first_part_um like abs_wt_um              no-undo.
   define variable l_conv          as   decimal                no-undo.
   define variable l_net_wt1       like abs_nwt                no-undo.
   define variable l_gross_wt1     like abs_gwt                no-undo.
   define variable l_tare_wt1      like abs_gwt                no-undo.
   define variable l_net_wt2       like abs_nwt                no-undo.
   define variable l_gross_wt2     like abs_gwt                no-undo.
   define variable l_tare_wt2      like abs_gwt                no-undo.
   define variable l_qty           like abs_mstr.abs_qty       no-undo.
   define variable l_part_um       like abs_wt_um              no-undo.
   define variable v_absd_fld_name         like absd_fld_name  no-undo.
   define variable v_absd_fld_value        like absd_fld_value no-undo.
   define variable l_lot-lbl               as  character format "x(26)" no-undo.
   define variable l_ref-lbl               as  character format "x(12)" no-undo.
   define variable l_qty-lbl               as  character format "x(12)" no-undo.
   define variable l_cumqty-lbl            as  character format "x(22)" no-undo.
   define variable l_expire-lbl            as  character format "x(8)"  no-undo.
   define variable l_ld_expire             like ld_expire      no-undo.
   define variable l_parent_tare_wt        like abs_nwt        no-undo.
   define variable l_nonso_det_qty         like abs_mstr.abs_qty no-undo.
 
   define variable l_continue_lbl          as  character
                                           format "x(22)"      no-undo.
   define variable l_printed               like mfc_logical    no-undo.
   define variable l_so_ship               like so_cust        no-undo.
   define variable l_framename             as character        no-undo.
   define variable l_soldto                as character        no-undo.
   define variable cPart                   as character        no-undo.
   define variable cCustPart               as character        no-undo.
   define variable rCustItemRecid          as recid            no-undo.
   define variable l_desc                  as character format "x(24)" no-undo.
   define variable l_par_absid             as character        no-undo.
   define variable l_print_pending         as logical          no-undo.
   define variable l_pending_printed       as logical          no-undo 
   initial no.
   define variable l_print_pegging         as logical          no-undo
   initial no.
   define variable l_lot_pending_printed   as logical          no-undo
   initial no.
 
   define variable using_seq_schedules like mfc_logical initial no no-undo.
   define variable sequence_list as character format "x(36)" no-undo.
 
   define variable yn               as logical                   no-undo.
   define Variable shipQtyInPack    as decimal                   no-undo.
   define variable isFromShippingHistory as logical initial no   no-undo.
 
   /* BUFFERS */
   define buffer   b_abs_mstr      for  abs_mstr.
   define buffer   abssi_det       for  abssi_det.
   define buffer   tt_schedule_det for  tt_schedule_det.

   assign
      l_lot-lbl    = getTermLabel("LOT/SERIAL_NUMBERS_SHIPPED",26)
      l_ref-lbl    = getTermLabel("REFERENCE",12)
      l_qty-lbl    = getTermLabel("QUANTITY",12)
      l_cumqty-lbl = getTermLabel("CUMULATIVE",10) + " " +
                     getTermLabel("QTY_SHIPPED",12)
      l_expire-lbl = getTermLabel("EXPIRE",8)
      l_soldto     = getTermLabel("SOLD_TO",14) + ": "
      i = 1.
 
   /*grc338 DELETED
   do while program-name(i) <> ? and
      index(program-name(i), 'reshmt.') = 0 and
      index(program-name(i), 'rerp11.') = 0:
      i = i + 1.
   end.
 
   if index(program-name(i), 'reshmt.') > 0 or
      index(program-name(i), 'rerp11.') > 0
   then do:
      {us/bbi/gprun.i ""rerp11a.p"" "(i_abs_recid)"}
      leave.
   end.
 grc338 DELETED*/
   if p_cust = No
   then
      l_soldto = "".
 /*grc338 DELETED
   /* FRAMES */
   form header
      skip (3)
      company[1]  at 4        rpt_type      to 79
      company[2]  at 4
      sequence_list to 79
      company[3]  at 4        type_nbr      to 58   shipper_id
      company[4]  at 4
      getTermLabelRtColon("SHIP_DATE",14) format "x(14)"  to 58   ship_date
      company[5]  at 4
      getTermLabelRtColon("PRINT_DATE",14) format "x(14)" to 58   print_date
      getTermLabelRtColon("PAGE_OF_REPORT",10) format "x(10)" to 58
      trim(string(page-number - v_start_page + 1)) format "XXXX"
      company[6]  at 4
      skip (1)
      l_soldto + cust format "x(37)" at 8
      getTermLabel("SHIP_TO",14) + ": " + ship format "x(37)" at 46
      skip (1)
      billto[1]   at 8        shipto[1]     at 46
      billto[2]   at 8        shipto[2]     at 46
      billto[3]   at 8        shipto[3]     at 46
      billto[4]   at 8        shipto[4]     at 46
      billto[5]   at 8        shipto[5]     at 46
      billto[6]   at 8        shipto[6]     at 46
      skip(3)
      getTermLabelRtColon("SHIP_VIA",12)                   format "x(12)" to 14
      abs_shipvia
      getTermLabelRtColon("MODE_OF_TRANSPORT",23)          format "x(23)" to 60
      abs_trans_mode
      getTermLabelRtColon("FOB_POINT",12)                  format "x(12)" to 14
      abs_fob
      getTermLabelRtColon("CARRIER_SHIPMENT_REFERENCE",23) format "x(23)" to 60
      abs_carr_ref
      getTermLabelRtColon("TOTAL_PALLETS",14)              format "x(14)" to 14
      abs_totalpallet
      getTermLabelRtColon("VEHICLE_ID",12)                 format "x(12)" to 60
      abs_veh_ref
      skip(1)
   with frame f_formhdr page-top width 90
   no-box no-labels.
 grc338 DELETED*/
 
   /* ADDED FRAME f_non_so_ship FOR DISPLAY OF NON-SO SHIPPERS DETAILS */
   form
      ps_print_item                   column-label "Item Number!Serial ID"
      shipper-po                      column-label "PO Number"
      l_nonso_det_qty                 format "->>>>>>9.99<<<<<<"
                                      column-label "Qty Shipped"
      abs_mstr.abs__qad02             format "x(2)"
                                      column-label "UM"
   with frame f_non_so_ship down width 80 no-box.
 
   /* SET EXTERNAL LABELS */
   /*setFrameLabels(frame f_non_so_ship:handle). grc338*/
 
   /* ADDED FRAME f_do_ship FOR DISPLAY OF DO SHIPPERS DETAILS */
   form
      ps_print_item                   column-label "Item Number!Serial ID"
      shipper-po                      column-label "DO Number"
      l_nonso_det_qty                 format "->>>>>>9.99<<<<<<"
                                      column-label "Qty Shipped"
      abs_mstr.abs__qad02             format "x(2)"
                                      column-label "UM"
   with frame f_do_ship down width 80 no-box.
 
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame f_do_ship:handle).
 
   shipper-po:label in frame f_do_ship = getTermLabel("DO_NUMBER",22).
 
   /*grc338 DELETED
   /* DEFINING THE FORM FOR AUTHORIZATION NUMBER */
   form
      t_absr_reference column-label "Authorization Number"  at 11
      t_absr_qty       column-label "Pegged Qty" format "->,>>>,>>9.9<<<"
      sod_um
   with down frame auth.
 
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame auth:handle).
 
   /* DEFINING FORMS FOR CUSTOMER SEQUENCES */
   form
      t_abss_from_cust_seq    at 10
      t_abss_to_cust_seq      label "To"
   with down frame sequence2 width 80.
 
   /* SET EXTERNAL LABELS */
   setFrameLabels(frame sequence2:handle).
 
  /* DEFINING FORM FOR CONTAINER/LINE CHARGES */
   form
      space(5)
      v_absd_fld_name
      v_absd_fld_value
   with down frame absd_user_fields width 80.
 
    /* SET EXTERNAL LABELS */
   setFrameLabels(frame absd_user_fields:handle).
 
   /* DEFINE FORM FOR SHIPMENT WEIGHT SUMMARY */
   form
      pt_mstr.pt_desc1     column-label "Description" format "x(20)" 
      b_abs_mstr.abs_qty   column-label "Quantity" format "->>>>>>9.9"
      b_abs_mstr.abs_nwt   column-label "Net!Weight" format "->>>>>>9.9"   
      l_tare_wt            column-label "Tare!Weight" format "->>>>>>9.9"
      b_abs_mstr.abs_gwt   column-label "Gross!Weight" format "->>>>>>9.9"
      b_abs_mstr.abs_wt_um /* column-label "UM"  format "x(2)" */
      with frame frm_part down width 80 
      title color normal (getFrameTitle("SHIPMENT_WEIGHT_SUMMARY",33)).

   setFrameLabels(frame frm_part:handle).

   /* PREPROCESSORS */
   &SCOPED-DEFINE PAGEBREAK
   grc338 DELETED*/
   empty temp-table ttMasterSerialToShipper no-error.

   for first abs_mstr where recid(abs_mstr) = i_abs_recid
   no-lock: end.
 
   if not available abs_mstr then
      return.
 
   if substring(abs_mstr.abs_status, 2, 1) = 'y' then do:
      isFromShippingHistory = yes.
   end.

   {us/bbi/gprun.i ""parciq1a.p""
                   "(input oid_abs_mstr,
                     input today,
                     input isFromShippingHistory,
                     input-output table ttMasterSerialToShipper by-reference)"}
 
   /* GET THE SHIPPER'S TRANSACTION TYPE */
   run p-icshtyp
      (input i_abs_recid,
       output v_tr_type).
 
   l_continue_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
                       input "CONTINUE", input 22, input '*').
 
   /*grc338 DELETED
   if  v_tr_type = "ISS-SO"
   and page-size - line-counter < 1
   then do with frame f_det:
      page.
      display
         ps_print_item
         l_continue_lbl @ shipper-po.
      down 1.
   end. /* IF v_tr_type = "ISS-SO" */
 
   if  v_tr_type = "ISS-DO"
   and page-size - line-counter < 1
   then do with frame f_do_ship:
      page.
      display
         ps_print_item
         l_continue_lbl @ shipper-po.
      down 1.
   end. /* IF v_tr_type = "ISS-DO" */
 
   else if  v_tr_type <> "ISS-SO"
   and page-size - line-counter < 1
   then do with frame f_non_so_ship:
      page.
      display
         ps_print_item
         l_continue_lbl @ shipper-po.
      down 1.
   end. /* IF v_tr_type <> "ISS-SO" */
grc338 DELETED*/
 
   /* PROCEDURE BODY */
   assign
      v_start_page = page-number
      shipper_id   = substring(abs_id,2)
      ship_date    = abs_shp_date.
 
   {us/bbi/gprun.i ""gpmfc01.p""
      "(input 'enable_sequence_schedules',
        input '',
        input '',
        input 'rcf_ctrl',
        output using_seq_schedules)"}
 
 
   /* NOW DOCKTO, SHIPTO AND SOLDTO WILL BE TAKEN FROM ls_mstr */
   /* INSTEAD OF ad_mstr                                       */
   {us/xf/xfaddr3.i "shipto"} /*grc338*/
   find ad_mstr where ad_mstr.ad_domain = global_domain
      and ad_addr = abs_shipto
   no-lock no-error.
 
   if available ad_mstr
   then do:
 
      /* Assign values to addr and format */
      /*grc338
      {us/mf/mfadfmt.i}
       grc338*/
 
      assign
         shipto_id = ad_addr
         ship      = ad_addr.
 
     /*grc338
      assign
         shipto[1] = addr[1]
         shipto[2] = addr[2]
         shipto[3] = addr[3]
         shipto[4] = addr[4]
         shipto[5] = addr[5]
         shipto[6] = addr[6]. *grc338*/
 
      {us/xf/xfaddr.i shipto} /*grc338*/
   end.  /* IF AVAILABLE ad_mstr */
 
   /* EXPLODE SHIPPER/CONTAINER TO GET SALES ORDER DETAIL */
   empty temp-table t_abs_det.
 
   run supp_build_det (i_abs_recid).
 
   /* BUILD SHIPPER SO DETAIL FROM SHIPPING HISTORY FOR CONFIRMED SHIPPER */
   run pick_build_det (i_abs_recid).

   for each t_abs_det
   no-lock:
 
      for first so_mstr where so_domain = global_domain
         and so_nbr    = det_order
         and so_fsm_type <> "SEO"
         and so_compl_stat = ""
      no-lock: end.
 
      if available so_mstr
      then do:
         if l_so_ship = " "
         then
            l_so_ship = so_cust.
         else
         if l_so_ship <> so_cust
         then
            l_so_ship = abs_shipto .
      end. /* IF available so_mstr */
      else do:
         if l_so_ship = " "
         then do:
            for first ih_hist
               where ih_domain  = global_domain
               and   ih_inv_nbr = abs_inv_nbr
               and   ih_nbr     = det_order
            no-lock:
            end. /* FOR FIRST ih_hist */
            if available ih_hist
            then
               l_so_ship = ih_cust.
            else
               l_so_ship = abs_shipto.
         end. /* IF l_so_ship  = " " */
      end. /* ELSE */
 
   end. /* FOR EACH t_abs_det */
 
   /* BELOW ASSIGNMENT IS REQUIRED SO THAT THE SHIPPER THAT HAS ONLY HEADER */
   /* AND HAS NO LINES IS PRINTED WITHOUT ANY ERROR                         */
   l_so_ship = if l_so_ship = ""
               then
                  abs_shipto
               else
                  l_so_ship.
 
   /* GET SOLD-TO ADDRESS PRINT FIELDS */
   for first ad_mstr where ad_domain = global_domain
      and ad_addr   = l_so_ship
   no-lock:
      assign
         soldto_id = ad_addr
         cust      = ad_addr.
   end. /* FOR FIRST ad_mstr */
 
   find ls_mstr where ls_mstr.ls_domain = global_domain
      and ls_addr = ad_addr
      and ls_type = "customer"
   no-lock no-error.
 
   if not available ls_mstr and available ad_mstr and ad_ref > ""
   then do:
 
      find ls_mstr where ls_mstr.ls_domain = global_domain
         and ls_addr = ad_ref
         and ls_type = "customer"
      no-lock no-error.
 
      if available ls_mstr
      then
         assign
            soldto_id = ad_ref
            cust      = ad_ref.
 
      else if available ad_mstr then do:
 
         addr_id = ad_ref.
         find first ad_mstr where ad_mstr.ad_domain = global_domain
            and ad_addr = addr_id
         no-lock no-error.
 
         if available ad_mstr and ad_ref > "" then do:
 
            find ls_mstr  where ls_mstr.ls_domain = global_domain
               and ls_addr = ad_ref
               and ls_type = "customer"
            no-lock no-error.
 
            if available ls_mstr then
               assign
                  soldto_id = ad_ref
                  cust      = ad_ref.
         end. /* END OF IF ad_ref > "" */
 
      end. /* END OF ELSE DO */
 
   end. /* END OF NOT AVAILABLE ls_mstr */
 
   {us/xf/xfaddr3.i "billto"} /*grc338*/
   find first ad_mstr where ad_mstr.ad_domain = global_domain
      and ad_addr = soldto_id
   no-lock no-error.
 
   if available ad_mstr
   then do:
 
      /* Assign values to addr and format */
      /*pass
      {us/mf/mfadfmt.i}
 
      assign
         billto[1] = addr[1]
         billto[2] = addr[2]
         billto[3] = addr[3]
         billto[4] = addr[4]
         billto[5] = addr[5]
         billto[6] = addr[6].
       pass*/
 
      {us/xf/xfaddr.i "billto"} /*grc338*/
   end.  /* IF AVAILABLE (SOLDTO) ad_mstr */
 
   /* GET SHIP-FROM ADDRESS PRINT FIELDS */
   {us/xf/xfaddr3.i "company"} abn = "". /*grc338*/
   find ad_mstr where ad_mstr.ad_domain = global_domain
      and ad_addr = i_comp_addr
   no-lock no-error.
 
   if available ad_mstr
   then do:
 
      /* Assign values to addr and format */
      /*pass
      {us/mf/mfadfmt.i}
 
      assign
         company[1] = addr[1]
         company[2] = addr[2]
         company[3] = addr[3]
         company[4] = addr[4]
         company[5] = addr[5]
         company[6] = addr[6].
      pass*/
 
      find first gl_ctrl no-lock. /*S6B01*/
      {us/xf/xfgetabn.i &abn=abn} /*S6B01*/

      /*grc338 BEGIN*/
      {us/xf/xfaddr.i "company"}
      for first cm_mstr no-lock
         where  cm_domain = global_domain
         and    cm_addr   = ad_addr:
         abn = cm_gst_id.
      end.
      /*grc338 END*/
   end.  /* IF AVAILABLE (SHIPFROM) ad_mstr */
 
   /* EXPLODE SHIPPER/CONTAINER TO GET LOW-LEVEL ITEM DETAIL */
 
   empty temp-table t_abs_det.
 
   run supp_build_det (i_abs_recid).
 
   /* BUILD SHIPPER SO DETAIL FROM SHIPPING HISTORY FOR CONFIRMED SHIPPER */
   run pick_build_det (i_abs_recid).

   assign
      print_date     = today
      abs_shipvia    = substring(abs__qad01, 1,20,"column")
      abs_fob        = substring(abs__qad01,21,20,"column")
      abs_carr_ref   = substring(abs__qad01,41,20,"column")
      abs_trans_mode = substring(abs__qad01,61,20,"column")
      abs_veh_ref    = substring(abs__qad01,81,20,"column")
      abs_totalpallet = integer(abs__qadd01).
 
   if abs_id begins "s" then
   assign
      rpt_type = (if available qad_wkfl and qad_wkfl.qad_logfld[1] = yes
               then getTermLabel("BANNER_BACKSHIPPER",23)
               else getTermLabelRt("BANNER_SHIPPER",23))
 
      type_nbr = getTermLabelRtColon("SHIPPER_ID",17).
 
   else
   if abs_id begins "c" then
      assign
         rpt_type = getTermLabel("BANNER_PACKING_LIST",23)
         type_nbr = getTermLabelRtColon("CONTAINER_ID",17).
 
   else
   if abs_id begins "p" then
      assign
         rpt_type = getTermLabel("BANNER_PRE_SHIPPER",23)
         type_nbr = " " + getTermLabel("PRE-SHIPPER_ID",15) + ":".
 
   /* DISPLAY HEADER */
 
   if p_cust = No
   then
      assign
         billto[1] = ""
         billto[2] = ""
         billto[3] = ""
         billto[4] = ""
         billto[5] = ""
         billto[6] = "".
 
   /*view frame f_formhdr. grc338*/
   {us/xf/xfsofm09m0.i} /* Type 0 */ /*grc338*/
 
   /*page. grc338*/
 
   /* PRINT SHIPPER COMMENTS */
   if abs_cmtindx > 0 and i_ship_comments
   then do:
      /*grc338 {us/gp/gpcmtprt.i &type=SH &id=abs_cmtindx &pos=3} */
      {us/xf/xfcmtprt1.i &type=SH &id=abs_cmtindx &rectype=A} /*grc338*/
      /*put skip(1). grc338*/
   end.
 
   /* PRINT SALES ORDER COMMENTS */
   if i_pack_comments and (v_tr_type = "ISS-SO" or v_tr_type = "ISS-COR")
   then
      for each t_abs_det no-lock break by det_order:
 
      if first-of(det_order)
      then do:
 
         find so_mstr where so_mstr.so_domain = global_domain
            and so_nbr = det_order
         no-lock no-error.
 
         /* USING IDH_CONTR_ID TO FACILITATE PO NUMBER PRINTING FOR */
         /* DISCRETE AS WELL AS SCHEDULED ORDERS,                   */
         /* IF SALES ORDER IS NOT AVAILABLE                         */
 
         /* FINDING IDH_CONTR_ID BELOW IN SHIPPER DETAIL LOOPING    */
         /* STRUCTURE AS ONE SHIPPER CAN HAVE MANY SALES ORDERS     */
 
         if  available so_mstr and so_cmtindx > 0
         then do:
           /* grc338 {us/gp/gpcmtprt.i &type=PA &id=so_cmtindx &pos=3} */
           {us/xf/xfcmtprt1.i &type=PA &id=so_cmtindx &rectype=A} /*grc338*/
         end.
         else
            for first ih_hist where ih_hist.ih_domain = global_domain
               and ih_nbr = det_order
               and ih_cmtindx > 0
            no-lock:
               /*grc338  {us/gp/gpcmtprt.i &type=PA &id=ih_cmtindx &pos=3} */
               {us/xf/xfcmtprt1.i &type=PA &id=ih_cmtindx &rectype=A} /*grc338*/
            end. /* for first ih_hist ... */
 
      end.  /* IF FIRST-OF */
   end.  /* IF i_pack_comments ... THEN FOR */
 
   /* PRINT HEADER USER FIELDS */
   for each absd_det where absd_det.absd_domain = global_domain and
            absd_shipfrom = abs_shipfrom and
            absd_abs_id = abs_id
   no-lock
   break by absd_abs_id:
      /*grc338 DELETED
      display
         absd_fld_name  @ v_absd_fld_name
         absd_fld_value @ v_absd_fld_value
      with frame absd_user_fields.
 
      down 1 with frame absd_user_fields.
 
      if last-of(absd_abs_id) then
         down 2 with frame absd_user_fields.
      grc338 DELETED*/
      {us/xf/xfsofm09mm.i} /*grc338*/
 
   end. /* FOR EACH absd_det */
 
   /* LOOP THROUGH SHIPPER DETAILS */
 
   if i_print_lotserials
   then do:
 
      /* INITIALIZING work_abs_mstr */
      empty temp-table work_abs_mstr.
 
      /* EXPLODE SHIPPER TO GET ORDER DETAIL ONLY IF    */
      /* PRINT LOT/SERIAL NUMBERS IS "Yes"              */
 
      {us/bbi/gprun.i ""rcsoisa.p"" "(input i_abs_recid)"}
   end. /* IF i_print_lotserials */
 
   for each t_abs_det
      no-lock
      break by det_item
            by det_order
            by det_line
            by det_um:
 
      create ttcmtindx.
      tt_cmtindx = det_cmtindx.
 
      /* TO PRINT SHIPPER IN SO UM OR INVENTORY UM  */
      if i_so_um then
         run updateQtyUM
            (input det_order,
             input det_line,
             input det_item,
             input-output det_qty,
             input-output det_ship_qty,
             output det_um,
             input-output det_conv).
 
      accumulate det_qty     (sub-total by det_line by det_um).
      accumulate det_ship_qty(sub-total by det_line by det_um).
 
      /* ADD WORKFILE ENTRY FOR COMPONENT QUANTITIES FOR KIT ITEMS */
      run supp_build_comp
         (det_shipfrom,
          det_id,
          det_order,
          det_line).
 
      run isPrintPending(input det_item,
                         input det_order,
                         input integer(det_line),
                         output l_print_pending).

      if not l_print_pegging then do:
         l_print_pegging = yes.
         {us/px/pxrun.i &PROC='getPeggingScheduleDet' 
                        &PROGRAM='pasopixr.p'
                        &HANDLE=ph_pasopixr
                        &PARAM="(input abs_mstr.oid_abs_mstr,
                                 input det_order,
                                 input integer(det_line),
                              output table tt_schedule_det by-reference)"
                     &NOAPPERROR=True
                     &CATCHERROR=True}

         for each tt_schedule_det no-lock:

            for first t_absr_det exclusive-lock
               where t_absr_reference = tt_auth:
               t_absr_qty = tt_qty.
            end.
            if not available t_absr_det then do:
               create t_absr_det.
               assign
                  t_absr_reference = tt_auth
                  t_absr_qty = tt_qty.
            end.
         end.
      end.
      /* CREATING THE WORKFILE FOR PRINTING THE AUTHORIZATION NUMBER */
      for each absr_det where absr_det.absr_domain = global_domain and
               absr_shipfrom = det_shipfrom
           and absr_id = det_id
      no-lock:
 
         if absr_reference <> ""
         then do:
 
            find first t_absr_det exclusive-lock where 
                       t_absr_reference = absr_reference
            no-error.
 
            if not available t_absr_det
            then do:
               create t_absr_det.
               assign
                  t_absr_reference = absr_reference
                  t_absr_qty       = absr_qty.
            end.
            else do:
               t_absr_qty = t_absr_qty + absr_qty.
            end.
 
         end. /* END OF IF absr_reference <> "" */
 
      end. /* END OF FOR EACH absr_det */
 
      if first-of(det_line)
      then do:
         assign
            ps_print_item = det_item
            cum_qty   = 0
            l_pending_printed = no.
 
         if v_tr_type    = "ISS-DO"
            or v_tr_type = "ISS-PRV"
         then
            shipper-po = det_order.
 
         if v_tr_type = "ISS-SO" or v_tr_type = "ISS-COR"
         then do:
 
            for first sod_det
               where sod_det.sod_domain = global_domain
                 and sod_nbr            = det_order
                 and sod_line           = integer(det_line)
                 and sod_part           = det_item
            no-lock: end.
 
            if available sod_det
            then do:
 
               /* GET CUSTOMER ITEM RECORD IF ANY */
               cPart = sod_custpart.
               {us/px/pxrun.i &PROC='findCustomerItem' &PROGRAM='ppcixr.p'
                        &HANDLE=ph_ppcixr
                        &PARAM="(input so_ship, input cust, input """",
                                 input sod_site, input no, input sod_sched,
                                 input-output cPart, output cCustPart,
                                 output rCustItemRecid)"
                        &NOAPPERROR=True
                        &CATCHERROR=True}
 
               for first cp_mstr no-lock where
                   recid(cp_mstr) = rCustItemRecid:
               end.
 
               assign
                  ps_print_item = if available cp_mstr and cp_cust_partd <> ""
                              then
                                 cp_cust_partd
                              else if sod_custpart <> ""
                              then
                                 sod_custpart
                              else
                                 sod_part.
 
               for first pt_mstr
                  where pt_mstr.pt_domain = global_domain
                    and pt_part           = sod_part
               no-lock:
               end. /* FOR FIRST pt_mstr */
 
               if sod_sched then
                  shipper-po = sod_contr_id.
               else
                  for first so_mstr where so_mstr.so_domain = global_domain
                     and so_nbr = sod_nbr
                  no-lock:
                     shipper-po = so_ship_po.
                  end. /* FOR FIRST so_mstr */
 
               if sod__qadc04 <> ""
               then
                  ps_print_item = sod__qadc04.
 
            end.  /* IF AVAILABLE sod_det */
 
            else do:
 
               for first idh_hist
                  where idh_hist.idh_domain = global_domain
                    and idh_nbr             = det_order
                    and idh_line            = integer(det_line)
                    and idh_part            = det_item
               no-lock:
               end. /* FOR FIRST idh_hist */
 
               if available idh_hist
               then do:
 
                  /* GET CUSTOMER ITEM RECORD IF ANY */
                  cPart = idh_custpart.
                  {us/px/pxrun.i &PROC='findCustomerItem' &PROGRAM='ppcixr.p'
                           &HANDLE=ph_ppcixr
                           &PARAM="(input abs_mstr.abs_shipto, input cust,
                                    input """",
                                    input idh_site, input no, input no,
                                    input-output cPart, output cCustPart,
                                    output rCustItemRecid)"
                           &NOAPPERROR=True
                           &CATCHERROR=True}
 
                  for first cp_mstr no-lock where
                      recid(cp_mstr) = rCustItemRecid:
                  end.
 
                  assign
                     ps_print_item = if available cp_mstr
                                 and cp_cust_partd <> ""
                                 then
                                    cp_cust_partd
                                 else if idh_custpart <> ""
                                 then
                                    idh_custpart
                                 else
                                    idh_part.
 
                  for first pt_mstr
                     where pt_domain = global_domain
                       and pt_part   = idh_part
                     no-lock:
                  end. /* FOR FIRST pt_mstr */
 
                  if idh_sched then
                     shipper-po = idh_contr_id.
                  else
                     for first ih_hist
                         where ih_hist.ih_domain = global_domain
                           and ih_nbr            = idh_nbr
                     no-lock:
                        shipper-po = ih_ship_po.
                     end.
 
               end. /* IF AVAILABLE idh_hist */
 
               else
                  shipper-po = "".
 
            end. /* ELSE DO */
           /*grc338 DELETED
            display
               ps_print_item
               shipper-po
               with frame f_det.
             grc338 DELETED*/
         end.  /* IF v_tr_type */
 
      end. /* IF FIRST-OF(det_line) */
 
      if l_print_pending and (accum sub-total by det_um det_qty) <> 0 and 
         not l_pending_printed then do:
          /*grc338 DELETED
         if page-size - line-counter < 1
         then do:
            page.
            display
               ps_print_item
               l_continue_lbl @ shipper-po
                  with frame f_det.
            down with frame f_det.

         end.
         down with frame f_det.
         display
            getTermLabel("PENDING_PICK", 12) @ ps_print_item
         with frame f_det.
	    grc338 DELETED*/
         l_pending_printed = yes.
      end.
      if v_tr_type = "ISS-SO"
      then do:
         if execname = "sosois.p"
         then
            cum_qty = if i_so_um = no
                      then
                         cum_qty + det_ship_qty * decimal(det_conv)
                      else
                         cum_qty +  det_ship_qty.
         else if execname = "soivmt.p"
         then
            cum_qty = if i_so_um = no
                      then
                         cum_qty + sod_qty_ship * decimal(det_conv)
                      else
                         cum_qty + sod_qty_ship.
         else
            cum_qty = if i_so_um = no
                      then
                         cum_qty + (det_qty * decimal(det_conv)) -
                         (det_ship_qty * decimal(det_conv))
                      else
                         cum_qty + det_qty - det_ship_qty.
 
         /*grc338 DELETED
         if last-of(det_um)
         then do:
 
            if i_so_um = no and (accum sub-total by det_um det_qty) <> 0
            then do:
 
               display
                  (accum sub-total by det_um det_qty) @ det_qty
                  det_um                              @ abs_mstr.abs__qad02
                  with frame f_det down.
               down with frame f_det.
 
            end. /* IF i_so_um = no */
 
         end. /* if last-of(det_um) */
          grc338 DELETED*/
      end. /* IF v_tr_type = "ISS-SO" */
 
      /* PRINT DETAILS */
      if last-of(det_line)
      then do:

         /* Variable disp_item is only used here. Because disp_item will be   */
         /* used in so05a02. As to use correct term label, disp_item can not  */
         /* take the place of ps_print_item.                                  */
         disp_item = ps_print_item.
 
         if v_tr_type = "ISS-SO" or v_tr_type = "ISS-COR"
         then do:
 
            find sod_det where sod_det.sod_domain = global_domain and
               sod_nbr  = det_order and
               sod_line = integer(det_line) and
               sod_part = det_item
            no-lock no-error.
 
            if available sod_det
            then do:
 
               /* cum_qty NEED TO DISPLAYED IN SHIP UM */
               cum_qty = cum_qty +
                         sod_cum_qty[1] * (if i_so_um = yes
                                           then 1
                                           else decimal(sod_um_conv)).
            end.
            else do:
 
               for each idh_hist
                  where idh_domain = global_domain
                    and idh_nbr    = det_order
                    and idh_line   = integer(det_line)
                    and idh_part   = det_item
               no-lock:
 
                  cum_qty = cum_qty +
                            idh_qty_inv * (if i_so_um = yes
                                           then 1
                                           else decimal(idh_um_conv)).
 
               end. /* FOR EACH idh_hist */
 
            end. /* NOT AVAILABLE sod_det */
 
         end.  /* IF v_tr_type */
 
         /*grc338 DELETED
         /* DISPLAY THE LINE ITEM */
         if v_tr_type = "ISS-SO"
         then do with frame f_det:
 
            /* SKIP TO NEW PAGE */
            if page-size - line-counter < 1
            then
               page.
 
            if i_so_um = yes and (accum sub-total by det_line det_qty) <> 0
            then do:
 
               display
                  (accum sub-total by det_line det_qty) @ det_qty
                  det_um                                @ abs_mstr.abs__qad02
                    with frame f_det down.
               down with frame f_det.
 
            end. /* If i_so_um = yes */
 
            /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
            if page-size - line-counter < 1
            then do:
               page.
               display
                  ps_print_item
                  l_continue_lbl @ shipper-po
                     with frame f_det.
               down with frame f_det.
 
            end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
         end. /* IF v_tr_type = "ISS-SO" */
 
         else if v_tr_type = "ISS-DO"
         then do with frame f_do_ship:
 
            /* SKIP TO NEW PAGE */
            if page-size - line-counter < 1
            then
               page.
 
            display
               ps_print_item
               shipper-po.

            if (accum sub-total by det_line det_qty) <> 0 then do:
               display
               accum sub-total by det_line det_qty
                      @ l_nonso_det_qty
               det_um @ abs_mstr.abs__qad02.
            end.
            down with frame f_do_ship.
         end . /* ELSE IF v_tr_type = "ISS-DO" */
 
         else do with frame f_non_so_ship:
 
            /* SKIP TO NEW PAGE */
            if page-size - line-counter < 1
            then
               page.
 
            display
               ps_print_item
               shipper-po.
            if (accum sub-total by det_line det_qty) <> 0 then do:
               display
               accum sub-total by det_line det_qty
                      @ l_nonso_det_qty
               det_um @ abs_mstr.abs__qad02.
            end.
            down with frame f_non_so_ship.
         end. /* ELSE DO */
      grc338 DELETED*/
         run printSerialToShip(input det_item,
                               input det_order,
                               input integer(det_line),
                               input i_so_um,
                               input i_item_serial,
                               output shipQtyInPack).

         if substring(abs_mstr.abs_status,2,1) <> "y" then do:
            cum_qty = cum_qty + shipQtyInPack.
         end.
           /* grc338 DELETED*
         down with frame f_det.
             grc338 DELETED*/
	
      /**grc338 DELETED*     
         if available cp_mstr
         and available pt_mstr
         then do:
            if ps_print_item     = cp_cust_partd
               and cp_cust_partd <> cp_cust_part
               or  cp_cust_part  =  pt_part
               and cp_cust_partd <> ""
            then do:
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
               put
                  {us/bbi/gplblfmt.i &FUNC=getTermLabel(""CUSTOMER_ITEM"",30)
                              &CONCAT="': '"}  at 1.
               put
                  if available sod_det then sod_custpart
                  else if available idh_hist then idh_custpart
                  else cp_cust_part format "x(30)"
               skip(1).
 
               /*IF THE CUSTOMER ITEM IS DIFFERENT THAN THE */
               /*CUSTOMER REF THEN DISPLAY THE CUST_REF     */
               if  ((available sod_det)
               and (sod_custref <> sod_custpart)
               and (sod_custref <> ""))
               then do:
                  /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
                  if page-size - line-counter < 1
                  then do:
                     page.
                     {us/so/so05a02.i}
                  end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
                  display
                     (getTermLabel("CUSTOMER_REFERENCE",15) + ": "
                      + sod_custref) @ ps_print_item
                     with frame f_det.
                  down 1 with frame f_det.
               end. /* IF AVAILABLE sod_det ... */
 
            end.  /* IF ps_print_item = CP_CUST_PARTD..... */
 
            if cp_cust_partd     <> pt_part
               and cp_cust_partd <> ""
               or  cp_cust_partd =  cp_cust_part
            then do:
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
               display
                  (getTermLabel("ITEM_NUMBER",7) + ": "
                   + pt_part) @ ps_print_item
                  with frame f_det.
               down 1 with frame f_det.
            end. /* IF cp_cust_partd <> pt_part... */
 
            if ((available sod_det
            and ps_print_item     =  sod_custpart)
            or (available idh_hist
            and ps_print_item     =  idh_custpart))
            and cp_cust_partd =  ""
            and cp_cust_part  <> pt_part
            then do:
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
               display
                  (getTermLabel("ITEM_NUMBER",7) + ": "
                   + pt_part ) @ ps_print_item
                  with frame f_det.
               down 1 with frame f_det.
            end. /* IF ps_print_item = sod_custpart... */
 
         end. /* IF AVAILABLE cp_mstr AND pt_mstr */
         else
            if  ((available sod_det)
            and (sod_custref <> ""))
            then do:
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
               display
                  (getTermLabel("CUSTOMER_REFERENCE",15) + ": "
                   + sod_custref) @ ps_print_item
                  with frame f_det.
               down 1 with frame f_det.
            end. /* IF  ((AVAILABLE sod_det) AND (sod_custref <> ""))" */
 
         if  ((available sod_det)
         and (sod_modelyr <> ""))
         then do:
            /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
            if page-size - line-counter < 1
            then do:
               page.
               {us/so/so05a02.i}
            end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
            display
               (getTermLabel("MODEL_YEAR",15) + ": "
                + sod_modelyr) @ ps_print_item
               with frame f_det.
            down 1 with frame f_det.
         end. /* IF  ((AVAILABLE SOD_DET) AND (SOD_MODELYR <> ""))" */
 
         if  available cp_mstr
         and cp_cust_eco <> ""
         then do:
            /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
            if page-size - line-counter < 1
            then do:
               page.
               {us/so/so05a02.i}
            end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
            display
               (getTermLabel("CUST_ITEM_ECO",15)
                + ": " + cp_cust_eco) @ ps_print_item
               with frame f_det.
            down 1 with frame f_det.
         end. /* IF available cp_mstr... */
 
         if v_tr_type = "ISS-SO"
         then do:
            cum_qty = cum_qty / decimal(det_conv).
            display
               l_cumqty-lbl @ shipper-po
               cum_qty      @ det_qty
               det_um       when (i_so_um) @ abs_mstr.abs__qad02
               pt_um        when ((not i_so_um)
                                     and (available pt_mstr))
                               @ abs_mstr.abs__qad02
               sod_um       when ((not i_so_um)
                                     and (available sod_det)
                                     and (not available pt_mstr))
                               @ abs_mstr.abs__qad02
               ""           when ((not i_so_um)
                                     and (not available sod_det)
                                     and (not available pt_mstr))
                               @ abs_mstr.abs__qad02
            with frame f_det down.
 
            down with frame f_det.
 
            display " " @ ps_print_item with frame f_det.
            down with frame f_det.
         end. /* IF v_tr_type = "ISS-SO" */
 
         else if v_tr_type = "ISS-DO"
         then do:
            display
               " " @ ps_print_item
               with frame f_do_ship.
            down with frame f_do_ship.
         end. /* ELSE IF v_tr_type = "ISS-DO" */
 
         else do:
            display
               " " @ ps_print_item
               with frame f_non_so_ship.
            down with frame f_non_so_ship.
         end. /* ELSE DO */
        grc338 DELETED*/
        {us/xf/xfsofm09mb.i} /*grc338*/
 
         /* PRINTING AUTHORIZATION NUMBER */
         for each t_absr_det by t_absr_reference:
            {&PAGEBREAK}
            /*grc338 DELETED
            /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
            if page-size - line-counter < 1
            then do:
               page.
               {us/so/so05a02.i}
            end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
            display
               t_absr_reference
               t_absr_qty
               sod_um
            with frame auth.
            down with frame auth.
            grc338 DELETED*/
            {us/xf/xfsofm09mz.i} /*grc338*/
         end. /* END OF FOR EACH absr_det */
 
         /* DELETING THE WORKFILE */
         empty temp-table t_absr_det.
         l_print_pegging = no.
 
         if i_print_sodet and (v_tr_type = "ISS-SO" or v_tr_type = "ISS-COR")
         then do:
 
            msgdesc = "".
            if substring(abs_status,2,1) <> "y"
            and not available sod_det
            then do:
               /* DOES NOT EXIST. CANNOT CONFIRM. */
               {us/bbi/pxmsg.i &MSGNUM=1868 &MSGBUFFER=msgdesc}
               msgdesc = getTermLabel("SALES_ORDER",15) + ": "
                       + det_order + " "
                       + getTermLabel("LINE",8) + ": "
                       + string(det_line,"x(4)")
                       + msgdesc.
            end.
            else do:
               if available sod_det then
                  msgdesc = getTermLabel("SALES_ORDER",15) + ": " +
                            sod_nbr +  " " +
                            getTermLabel("LINE",8) + ": " + string(sod_line).
               else
                  msgdesc = getTermLabel("SALES_ORDER",15) + ":" +
                            det_order +
                            " " +
                            getTermLabel("LINE",8) + ": " +
                            string(det_line,"x(4)").
            end.
            {&PAGEBREAK}
            /*grc338 DELETED
            /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
            if page-size - line-counter < 1
            then do:
               page.
               {us/so/so05a02.i}
            end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
            put msgdesc at 3 skip(1).
            grc338 DELETED*/
            {us/xf/xfsofm09mo.i} /*grc338*/
         end. /* IF i_print_sodet */
 
         l_printed = no.

         /* PRINT LOT/SERIAL DETAILS FOR REGULAR, MEMO AND ATO ITEMS */
         if i_print_lotserials
         then do:
 
            for each work_abs_mstr
            exclusive-lock
               where work_abs_mstr.abs_order = det_order
                 and work_abs_mstr.abs_item  = det_item
                 and work_abs_mstr.abs_line  = string(det_line)
                 and not work_abs_mstr.abs_par_id begins "I"
                 and work_abs_mstr.abs_par_id <> ""
                 and work_abs_mstr.abs_type  = "s"
            break by work_abs_mstr.abs_order
                  by work_abs_mstr.abs_item
                  by work_abs_mstr.abs_line
                  by work_abs_mstr.abs_lotser
                  by work_abs_mstr.abs_ref:
 
 
               for first ld_det
                   where ld_det.ld_domain = global_domain 
                    and  ld_part = work_abs_mstr.abs_item
                    and  ld_site = work_abs_mstr.abs_site
                    and  ld_loc  = work_abs_mstr.abs_loc
                    and  ld_lot  = work_abs_mstr.abs_lotser
                    and  ld_ref  = work_abs_mstr.abs_ref
               no-lock:
               end. /* FOR FIRST ld_det */
 
               if available ld_det
               then
                  l_ld_expire  =  ld_expire.
               else do:
                  assign
                     l_ld_expire  =  ?
                     l_par_absid  =  "".

                  /* GET THE PARENT ID FROM SHIPPER ITEM RECORD */
                  run get_abs_parent (input  work_abs_mstr.abs_id,
                                      input  work_abs_mstr.abs_shipfrom,
                                      output l_par_absid).

                  /* GET LAST SHIPMENT TRANSACTION */
                  for each tr_hist
                     where tr_domain      =   global_domain
                     and   tr_nbr         =   work_abs_mstr.abs_order
                     and   tr_site        =   work_abs_mstr.abs_shipfrom
                     and   tr_ship_id     =   trim(substring(l_par_absid,2))
                     and   tr_type        =   "ISS-SO"
                     and   tr_part        =   work_abs_mstr.abs_item
                     and   tr_line        =   int(work_abs_mstr.abs_line)
                  no-lock
                  break by tr_trnbr:
                     if last(tr_trnbr)
                     then
                        l_ld_expire  =  tr_expire.
                  end. /* FOR EACH tr_hist */
               end. /* IF NOT AVAILABLE ld_det */

               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
	         /*   grc338 DELETED*
                  page.
                  {us/so/so05a02.i}
 
                  put skip(1)
                      l_lot-lbl    at 5
                      l_qty-lbl    at 32
                      l_expire-lbl at 50
                      l_ref-lbl    at 60
                      skip(1).
                     grc338 DELETED*/
                  /* SET l_printed = yes TO AVOID RE-PRINTING OF LABELS */
                  /* WHEN first-of(work_abs_mstr.abs_line ON A NEW PAGE */
 
                  l_printed = yes.
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
               if first-of(work_abs_mstr.abs_line) and l_printed = no
               then do:
	          /*   grc338 DELETED*
                  put l_lot-lbl    at 5
                      l_qty-lbl    at 32
                      l_expire-lbl at 50
                      l_ref-lbl    at 60
                      skip(1).
		         grc338 DELETED*/
                  l_printed = yes.
               end.

               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
	          /*   grc338 DELETED*
                  page.
                  {us/so/so05a02.i}
                  put skip(1).
		     grc338 DELETED*/
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
               if l_print_pending and not l_lot_pending_printed then do:
                  /*   grc338 DELETED*
                  put unformatted getTermLabel("PENDING_PICK", 12) at 3.
		     grc338 DELETED*/
                  l_lot_pending_printed = yes.
               end.
               /*   grc338 DELETED*
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
                  put skip(1).
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
                 grc338 DELETED*/
               
	       /* PUT STATEMENT RETAINED INSTEAD OF DISPLAY BECAUSE */
               /* THE SCOPE OF f_det FRAME IS LOST AND IT RESULTS   */
               /* IN MULTIPLE LOT LABELS ON A SINGLE PAGE           */
               if  v_tr_type = "ISS-SO"
               and i_so_um   = yes
               then
                  work_abs_mstr.abs_qty =
                                 (work_abs_mstr.abs_qty *
                                  decimal(work_abs_mstr.abs__qad03)) /
                                  decimal(det_conv).
 
               /* Prepare temp table tt_attr_pfvalue which contains attributes. */
               {us/bbi/gprun.i ""caispf.p""
                               "(input work_abs_mstr.oid_abs_mstr,
                                 input work_abs_mstr.abs_item,
                                 input work_abs_mstr.abs_site,
                                 input work_abs_mstr.abs_loc,
                                 input work_abs_mstr.abs_lotser,
                                 input work_abs_mstr.abs_ref,
                                 input v_tr_type,
                                 input work_abs_mstr.abs_order,
                                 input work_abs_mstr.abs_line,
                                 input-output table tt_attr_pfvalue by-reference)"
               }

               /* Check Result against attribute specification */
               {us/px/pxrun.i &PROC      ='validateAttrSpec'
                              &PROGRAM   ='caisxr.p'
                              &HANDLE    = ph_caisxr
                              &PARAM     ="(input work_abs_mstr.oid_abs_mstr,
                                            input-output table tt_attr_pfvalue by-reference)"
                              &NOAPPERROR=true
                              &CATCHERROR=true
               }
              /*   grc338 DELETED*
               put
                  work_abs_mstr.abs_lotser at 5
                  work_abs_mstr.abs_qty    at 32 format "->>>>>>9.9<<<<<<"
                  l_ld_expire              at 50
                  work_abs_mstr.abs_ref    at 60.
                grc338 DELETED*/
/*k10017*/	{us/xf/xfsofm09ml.i}
               delete work_abs_mstr.
            end. /* FOR EACH work_abs_mstr */

            run createInvGroupByLotAndRef
               (input det_item,
                input det_order,
                input integer(det_line),
                input i_so_um,
                output table ttInvGroupByLotAndRef by-reference).

            for each ttInvGroupByLotAndRef no-lock
               break by ttInvGroupByLotAndRef.part:
               if page-size - line-counter < 1
               then do:
	       /*   grc338 DELETED*
                  page.
                  {us/so/so05a02.i}

                  put skip(1)
                      l_lot-lbl    at 5
                      l_qty-lbl    at 32
                      l_expire-lbl at 50
                      l_ref-lbl    at 60
                      skip(1).
                   grc338 DELETED*/
                  l_printed = yes.
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

               if first-of(ttInvGroupByLotAndRef.part) and l_printed = no
               then do:
                 /*   grc338 DELETED*
		  put l_lot-lbl    at 5
                      l_qty-lbl    at 32
                      l_expire-lbl at 50
                      l_ref-lbl    at 60
                      skip(1).
                     grc338 DELETED*/
                  l_printed = yes.
               end.
               
	       /*   grc338 DELETED*
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
                  grc338 DELETED*/
		
               if first-of(ttInvGroupByLotAndRef.part) then do:
                  l_lot_pending_printed = yes.
                    /*   grc338 DELETED*
	          put getTermLabel("PICKED", 6) at 3.
		       grc338 DELETED*/
               end.

           /*   grc338 DELETED*
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

               put ttInvGroupByLotAndRef.lotser at     5
                   ttInvGroupByLotAndRef.qty at        32 format "->>>>>>9.9<<<<<<"
                   ttInvGroupByLotAndRef.expireDate at 50
                   ttInvGroupByLotAndRef.ref at        60
                   skip.
          ** grc338 DELETED*/
               l_printed = no.
           {us/xf/xfsofm09mk.i} /*grc338*/

            end.
         end. /* IF i_print_lotserials  */
 
         /* PRINT SHIPPER LINE ITEM COMMENTS */
         if i_ship_comments
         then
            for each ttcmtindx
            no-lock: 
               /* INTRODUCED us/so/so05a02.i FOR DISPLAYING 'Continue' MESSAGE */
               /* WITH LINE ITEM IN FRAME f_det.                         */
                  /*grc338 DELETED
               {us/gp/gpcmtprt.i &type   =SH
                                 &id     = tt_cmtindx &pos=3
                                 &command="~{us/so/so05a02.i~}"}
                    grc338 DELETED*/
                  /*grc338 BEGIN*/
                  {us/xf/xfcmtprt1.i &type=SH &id=tt_cmtindx
                           &rectype=A}
                  /*grc338 END*/
                  /*put skip(1). grc338*/
            end. /* FOR EACH ttcmtindx */
             
         empty temp-table ttcmtindx. 
 
         /* PRINT COMPONENTS */
         l_printed = no.
         for each t_abs_comp no-lock where
            comp_shipfrom = det_shipfrom and
            comp_order    = det_order    and
            comp_line     = det_line
         break by comp_shipfrom:
 
            find pt_mstr no-lock  where pt_mstr.pt_domain = global_domain and
            pt_part = comp_item no-error.
            /*grc338 DELETED
            {&PAGEBREAK}
 
            /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
            if page-size - line-counter < 1
            then do:
               page.
               {us/so/so05a02.i}
            end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
            put
               comp_item at 18
            .
	     grc338 DELETED*/

            run isPrintPending(input comp_item,
                               input det_order,
                               input integer(det_line),
                               output l_print_pending).
       /*   grc338 DELETED
            if not l_print_pending then do:
               put
                  comp_qty  format "->>>>>>>9.9<<<<<" at 58 " "
                  if available pt_mstr
                  then
                     pt_um else "".
            end.
 
            if available pt_mstr
            and pt_desc1 <> ""
            then do:
               {&PAGEBREAK}
 
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
               put pt_desc1 at 20 skip.
            end.
 
            if available pt_mstr
            and pt_desc2 <> ""
            then do:
               {&PAGEBREAK}
 
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if v_tr_type = "ISS-SO" and
               page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
               put pt_desc2 at 20 skip.
            end. /* IF AVAILABLE pt_mstr */
 
            if l_print_pending and comp_qty <> 0 then do:
               put
                  getTermLabel("PENDING_PICK", 12)    at 18
                  comp_qty  format "->>>>>>>9.9<<<<<" at 58 " "
                  if available pt_mstr
                     then
                     pt_um else "".
            end.
        grc338 DELETED*/

            run printSerialToShip(input comp_item,
                                  input det_order,
                                  input integer(det_line),
                                  input i_so_um,
                                  input i_item_serial,
                                  output shipQtyInPack).
      /*   grc338 DELETED*
            if last(comp_shipfrom)
            then
               put skip (1).
         grc338 DELETED*/

          /*grc338 BEGIN*/
            for first sob_det no-lock
               where  sob_domain  = global_domain
               and    sob_part    = comp_item
               and    sob_nbr     = comp_order
               and    sob_line    = int(comp_line):
            end. /*for first sob_det no-lock*/
            {us/xf/xfsofm09mf.i}
         /*grc338 END*/
	   
	   
            l_lot_pending_printed = no.
 
            for each work_abs_mstr
               where work_abs_mstr.abs_order = det_order
               and   work_abs_mstr.abs_item  = comp_item
               and   work_abs_mstr.abs_line  = string(det_line)
               no-lock
               break by work_abs_mstr.abs_order
                     by work_abs_mstr.abs_item
                     by work_abs_mstr.abs_line
                     by work_abs_mstr.abs_lotser
                     by work_abs_mstr.abs_ref:
 
               for first ld_det
                   where ld_det.ld_domain = global_domain and  ld_part =
                   work_abs_mstr.abs_item
                  and   ld_site = work_abs_mstr.abs_site
                  and   ld_loc  = work_abs_mstr.abs_loc
                  and   ld_lot  = work_abs_mstr.abs_lotser
                  and   ld_ref  = work_abs_mstr.abs_ref
                  no-lock:
               end. /* FOR FIRST ld_det */
 
               l_ld_expire = if available ld_det
                             then
                                ld_expire
                             else
                                ?.
 
              /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
              if page-size - line-counter < 1
              then do:
	        /*grc338 DELETED
                 page.
                 {us/so/so05a02.i}
                 put skip(1).
 
                 put l_lot-lbl    at 5
                     l_qty-lbl    at 32
                     l_expire-lbl at 50
                     l_ref-lbl    at 60
                     skip(1).
                  *grc338 DELETED*/
              /* SET FLAG TO YES TO AVOID RE-PRINT OF LOT LABELS */
              /* WHEN first-of(work_abs_mstr.abs_line).          */
 
              l_printed = yes.
 
              end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
 
               /* l_printed CONTROLS THE LOT/SERIAL LABELS PRINTING */
               if first-of(work_abs_mstr.abs_line) and l_printed = no
               then do:
                  /* CHANGED DISPLAY TO PUT, TO AVOID PRINTING OF EXTRA */
                  /* BLANK LINES AFTER THE LABELS ARE PRINTED.          */
		  /*grc338 DELETED
                  put
                     l_lot-lbl    at 5
                     l_qty-lbl    at 32
                     l_expire-lbl at 50
                     l_ref-lbl    at 60
                     skip(1).
		     *grc338 DELETED*/
                  l_printed = yes.
               end.
 
               /*grc338 DELETED
              /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
              if page-size - line-counter < 1
              then do:
                 page.
                 {us/so/so05a02.i}
                 put skip(1).
              end. /* IF page-size - line-counter < 1 */
              *grc338 DELETED*/
               if l_print_pending and not l_lot_pending_printed then do:
                  put unformatted getTermLabel("PENDING_PICK", 12) at 3.
                  l_lot_pending_printed = yes.
               end.

               /*grc338 DELETED
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
                  put skip(1).
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

 
              /* CHANGED DISPLAY TO PUT, TO AVOID PRINTING OF BLANK */
              /* LINES BETWEEN THE LOT/SERIAL DATA.                 */
              put
                work_abs_mstr.abs_lotser at 5
                work_abs_mstr.abs_qty    at 32
                            format "->>>>>>9.9<<<<<<"
                l_ld_expire              at 50
                work_abs_mstr.abs_ref    at 60.
               *grc338 DELETED*/
/*k10017          {us/xf/xfsofm09mk.i} /*grc338*/ */
/*k10017*/        {us/xf/xfsofm09ml.i} /*grc338*/
 
            if last-of(work_abs_mstr.abs_line)
               then
                  put skip(1).
            end. /* FOR EACH work_abs_mstr */

            run createInvGroupByLotAndRef
               (input comp_item,
                input det_order,
                input integer(det_line),
                input i_so_um,
                output table ttInvGroupByLotAndRef by-reference).

            for each ttInvGroupByLotAndRef no-lock
               break by ttInvGroupByLotAndRef.part:
               if page-size - line-counter < 1
               then do:
                 /*grc338 DELETED
                  page.
                  {us/so/so05a02.i}

                  put skip(1)
                      l_lot-lbl    at 5
                      l_qty-lbl    at 32
                      l_expire-lbl at 50
                      l_ref-lbl    at 60
                      skip(1).
                  *grc338 DELETED*/
                  l_printed = yes.
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

               if first-of(ttInvGroupByLotAndRef.part) and l_printed = no
               then do:
	           /*grc338 DELETED
                  put l_lot-lbl    at 5
                      l_qty-lbl    at 32
                      l_expire-lbl at 50
                      l_ref-lbl    at 60
                      skip(1).
                   *grc338 DELETED*/
                  l_printed = yes.
               end.

              /*grc338 DELETED
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

               if first-of(ttInvGroupByLotAndRef.part) then do:
                  l_lot_pending_printed = yes.
                  put getTermLabel("PICKED", 6) at 3.
               end.

               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

               put ttInvGroupByLotAndRef.lotser at     5
                   ttInvGroupByLotAndRef.qty at        32 format "->>>>>>9.9<<<<<<"
                   ttInvGroupByLotAndRef.expireDate at 50
                   ttInvGroupByLotAndRef.ref at        60
                   skip.
	         *grc338 DELETED*/
            end.

            l_printed = no.
 
            /* PRINT SHIPPER LINE COMPONENT ITEM COMMENTS */
            if i_ship_comments
            then
               do cmt_ctr = 1 to num-entries(comp_cmtindx):
                  if integer(entry(cmt_ctr,comp_cmtindx)) > 0
                  then do:
                     /* INTRODUCED us/so/so05a02.i FOR DISPLAYING 'Continue' MESSAGE */
                     /* WITH LINE ITEM IN FRAME f_det.                         */
                  /*grc338 DELETED
                     {us/gp/gpcmtprt.i &type   =SH
                                 &id     =integer(entry(cmt_ctr,comp_cmtindx)) &pos=3
                                 &command="~{us/so/so05a02.i~}"}
                    grc338 DELETED*/
                  /*grc338 BEGIN*/
                     {us/xf/xfcmtprt1.i &type=SH &id=integer(entry(cmt_ctr,comp_cmtindx))
                           &rectype=A}
                  /*grc338 END*/
                     /*put skip(1). grc338*/
                  end.  /* IF INTEGER(ENTRY(cmt_ctr,cmtindx_cdl)) > 0 */
               end. /* DO cmt_ctr = 1 ... */
 
         end.  /* FOR EACH t_abs_comp */
 
         /* PRINT FEATURES AND OPTIONS FOR ASSEMBLE-TO-ORDER ITEMS */
         if i_features
            and (v_tr_type = "ISS-SO" or v_tr_type = "ISS-COR")
            and available sod_det
            and sod_cfg_type = "1"
         then do:
 
            find first sob_det
               where sob_det.sob_domain = global_domain
               and   sob_nbr  = sod_nbr
               and   sob_line = sod_line
            no-lock no-error.
 
            if available sob_det
            then do:
               /*grc338 DELETED
               {us/bbi/gprun.i ""sopkg01a.p""
                  "(input """",
                    input 0,
                    input sod_nbr,
                    input sod_line)"}
                grc338 DELETED*/
               /*grc338 BEGIN*/
               {us/bbi/gprun.i ""xfpkg09a.p""
                  "(input """",
                    input 0,
                    input sod_nbr,
                    input sod_line)"}
               /*grc338 END*/
            end. /* IF AVAILABLE sob_det */
 
         end.  /* IF i_features */
 
         /* PRINT PACKING LIST COMMENTS */
         if i_pack_comments and (v_tr_type = "ISS-SO" or v_tr_type = "ISS-COR")
         then do:
 
            if available sod_det and sod_cmtindx > 0
            then do:
               /*grc338 DELETED
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
               grc338 DELETED*/
 
               /* INTRODUCED us/so/so05a02.i FOR DISPLAYING 'Continue' MESSAGE */
               /* WITH LINE ITEM IN FRAME f_det.                         */
               /*grc338 DELETED
               {us/gp/gpcmtprt.i &type=PA
                   &id=sod_cmtindx &pos=3
                   &command="~{us/so/so05a02.i~}"}
                 grc338 DELETED*/
               {us/xf/xfcmtprt1.i &type=PA &id=sod_cmtindx &rectype=D} /*grc338*/
            end. /* IF AVAILABLE sod_det ... */
 
            if not available sod_det
            and available idh_hist and idh_cmtindx > 0
            then do:
               /*grc338 DELETED
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  {us/so/so05a02.i}
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
                grc338 DELETED*/
 
               /* INTRODUCED us/so/so05a02.i FOR DISPLAYING 'Continue' MESSAGE */
               /* WITH LINE ITEM IN FRAME f_det.                         */
               /*grc338 DELETED
               {us/gp/gpcmtprt.i &type=PA
                  &id=idh_cmtindx &pos=3
                  &command="~{us/so/so05a02.i~}"}
                grc338 DELETED*/
               {us/xf/xfcmtprt1.i &type=PA &id=idh_cmtindx &rectype=D} /*grc338*/
            end. /* IF NOT AVAILABLE sod_det ... */
 
         end. /* IF i_pack_comments ... */
 
      end. /* IF LAST-OF det_line */
 
      {us/mf/mfrpchk.i &warn=false}
 
 
      /* PRINT LINE LEVEL USER FIELDS */
         for each absd_det no-lock  
            where absd_det.absd_domain = global_domain and
                  absd_shipfrom = abs_mstr.abs_shipfrom and
                  absd_abs_id = det_id
         break by absd_abs_id:
           /*grc338 DELETED
            display
               absd_fld_name  @ v_absd_fld_name
               absd_fld_value @ v_absd_fld_value
            with frame absd_user_fields.
 
            down 1 with frame absd_user_fields.
 
            if last-of(absd_abs_id) then
               down 2 with frame absd_user_fields.
             grc338 DELETED*/
            {us/xf/xfsofm09mn.i} /*grc338*/
         end. /* FOR EACH absd_det */
 
   end. /* FOR EACH t_abs_det */
 
   /* PRINT SEQUENCES AND A SEPARATE SEQUENCE PACKING LIST */
   if using_seq_schedules
   then do:
 
      for first rcf_ctrl
       where rcf_ctrl.rcf_domain = global_domain no-lock: end.
 
      for first rcc_mstr  where rcc_mstr.rcc_domain = global_domain and
      rcc_addr = so_ship
      no-lock: end.
 
      /* CHECK TO MAKE SURE WE'RE AT THE */
      /* PRE-SHIPPER OR SHIPPER LEVEL.   */
      if abs_mstr.abs_id begins "p"
      or abs_mstr.abs_id begins "s"
      then do:
 
         /* DETERMINE IF SEQ. RANGE SHOULD BE PRINTED */
         if available rcc_mstr
         and rcc_shipper_print
         or (not available rcc_mstr and
             available rcf_ctrl and rcf_shipper_print)
         then do:
 
            /*GET SEQUENCE SCHEDULE DATA*/
            {us/gp/gprunmo.i
               &program = ""rcsqprt.p""
               &module = "ASQ"
               &param = """(input i_abs_recid,
                            input '')"""}
 
            /* PRINTING CUSTOMER SEQUENCE RANGE */
            for each t_abss_det
            break by t_abss_ship_id
                  by t_abss_from_cust_job:
               /*grc338 DELETED
               {&PAGEBREAK}
               if first-of(t_abss_ship_id)
               then
                  put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""SEQUENCE_RANGES"",18)}
                     at 25.
               if first-of(t_abss_from_cust_job) and
                  t_abss_from_cust_job <> ""
               then
                  put {us/bbi/gplblfmt.i &FUNC=getTermLabel(""CUSTOMER_JOB"",15)
                                  &CONCAT = "': '"}
                     at 5 t_abss_from_cust_job.
               display
                  t_abss_from_cust_seq
                  t_abss_to_cust_seq
               with frame sequence2.
 
               down with frame sequence2.
               grc338 DELETED*/
               {us/xf/xfsofm09mj.i} /*grc338*/
            end. /* END OF FOR EACH abss_det */
 
            /* DELETING THE WORKFILE */
            empty temp-table t_abss_det.
 
         end.  /* AVAILABLE rcc_mstr OR rcf_ctrl */
 
         /*PRINT SEQUENCE LIST */
 
         sequence_list = getTermLabel("BANNER_SEQUENCE_PACKING_LIST",35)
                       + " ".
         {us/gp/gprunmo.i
            &program = ""sosob2.p""
            &module = "ASQ"
            &param = """(input i_abs_recid,
                         input-output v_start_page)"""}
         sequence_list = "".
 
      end.  /* IF abs_id BEGINS "p" ... */
 
   end. /* IF ENABLE SEQUENCED SCHEDULES */
 
   /* PRINT WEIGHT SUMMARY */
   assign
      l_par_shipfrom = abs_mstr.abs_shipfrom
      l_par_id       = abs_mstr.abs_id.
 
   /* CREATED INTERNAL PROCEDURE P-GET-PARENT-WT-UM TO GET THE */
   /* PARENT WEIGHT UM                                         */
 
   run p-get-parent-wt-um
      (input recid(abs_mstr),
       output l_parent_tare_wt,
       output l_first_part_um) .
 
   empty temp-table ttcmtindx. 
 
   /* PRINT SHIPPMENT SUMMARY */
   /*GRC338
   {us/bbi/gprun.i ""papawt.p""
   */ {us/bbi/gprun.i ""xfpapawt.p""
                   "(input abs_mstr.oid_abs_mstr,
                     input v_tr_type,
                     input i_so_um)"}
 
   /* PRINT CARRIER INFORMATION */
  /*grc338 {us/bbi/gprun.i ""rcrpcar.p"" "(abs_mstr.abs_id, 1)"} */
   {us/bbi/gprun.i ""xfrpcar9.p"" "(abs_mstr.abs_id, 1)"} /*grc338*/
 
   /* PRINT TRAILER COMMENTS */
   if i_ship_comments
   and abs_trl_cmtindx > 0
   then do:
     /*grc338 {us/gp/gpcmtprt.i &type=SH &id=abs_trl_cmtindx &pos=3} */
      {us/xf/xfcmtprt1.i &type=SH &id=abs_trl_cmtindx &rectype=G} /*grc338*/
     /*put skip(1).grc338*/
   end.
   
   /*grc338 DELETED
   /* PRINT SHIPMENT CERTIFICATION IF IT EXISTS */
   for first abssi_det where abssi_det.oid_abs_mstr = abs_mstr.oid_abs_mstr
      and abssi_status = '' no-lock:
      put skip(1).
      put unformatted trim(abssi_short_signature) + "-Processado por Programa Certificado n.":U 
         + trim(abssi_certificate) + "/AT":U at 20 skip.
   end.

   page.
   hide frame f_formhdr.
     grc338 */
   {us/xf/xfsofm09m9.i} /*grc338*/
 
END PROCEDURE.  /* sh_print */
 
/* END OF PRINT SERVICE */
 
/*****************************************************************************/
/* DO NOT REMOVE THE PROCEDURES: sh_rename, sh_archive, sh_delete */
/* THIS TEMPLATE CODE IS PROVIDED TO CUSTOMERS FOR CREATING CUSTOMIZED FORM SERVICES */
 
         /* RENAME SERVICE */
 
/*         /* Remove comments to enable this service */
 *
 *         /* NOTE:  This service is required whenever additional data is */
 *         /* stored in any table other than abs_mstr, and is indexed by the */
 *         /* abs_id field of the shipper record. */
 *
 *
 *         PROCEDURE sh_rename:
 *
 *            /* When the key field abs_id of abs_mstr changes, this service */
 *            /* changes the appropriate data in any additional information */
 *            /* records. */
 *
 *            /* INPUT PARAMETERS */
 *            define input parameter i_abs_recid as recid no-undo.
 *            define input parameter i_abs_id like abs_id no-undo.
 *
 *            /* LOCAL VARIABLES */
 *            define variable v_shipfrom like abs_shipfrom no-undo.
 *            define variable v_id       like abs_id       no-undo.
 *
 *
 *            /* PROCEDURE BODY */
 *
 *            /* Find the shipper record with which this data is associated. */
 *            /* If it's not available, there's nothing to do, so leave. */
 *
 *            find abs_mstr no-lock where recid(abs_mstr) = i_abs_recid
 *               no-error.
 *            if not available abs_mstr then return.
 *
 *            assign
 *               v_shipfrom = abs_shipfrom
 *               v_id       = abs_id.
 *
 *            /* Update header data record, if any  */
 *            {gprun.i
 *               ""gpqwren.p""
 *               "({&PROC-NAME},
 *                 {&HDR-PREFIX} + v_shipfrom + {&DELIMITER} + v_id,
 *                  {&PROC-NAME},
 *                 {&HDR-PREFIX} + v_shipfrom + {&DELIMITER} + i_abs_id)" }
 *
 *            /* Update line item data record, if any  */
 *            {gprun.i
 *               ""gpqwren.p""
 *               "({&PROC-NAME},
 *                 {&ITM-PREFIX} + v_shipfrom + {&DELIMITER} + v_id,
 *                  {&PROC-NAME},
 *                 {&ITM-PREFIX} + v_shipfrom + {&DELIMITER} + i_abs_id)" }
 *
 *            /* Update trailer data record, if any */
 *            {gprun.i
 *               ""gpqwren.p""
 *               "({&PROC-NAME},
 *                 {&TRL-PREFIX} + v_shipfrom + {&DELIMITER} + v_id,
 *                  {&PROC-NAME},
 *                 {&TRL-PREFIX} + v_shipfrom + {&DELIMITER} + i_abs_id)" }
 *
 *         END PROCEDURE.  /* sh_rename */
 */
         /* END OF RENAME SERVICE */
 
/*****************************************************************************/
 
         /* ARCHIVE SERVICE */
 
/*         /* Remove comments to enable this service */
 *
 *         /* NOTE:  Although not required, this service is recommended */
 *         /* whenever additional data is stored in any table other than */
 *         /* abs_mstr */
 *
 *
 *         PROCEDURE sh_archive:
 *
 *            /* Archives additional header, line item, and trailer data */
 *            /* associated with a shipper header or detail record, and all */
 *            /* of its descendant records */
 *
 *            /* INPUT PARAMETERS */
 *            define input parameter i_abs_recid as recid     no-undo.
 *            define input parameter i_filename  as character no-undo.
 *
 *            /* LOCAL VARIABLES */
 *            define variable v_shipfrom like abs_shipfrom no-undo.
 *            define variable v_id       like abs_id       no-undo.
 *
 *
 *            /* PROCEDURE BODY */
 *
 *            /* Find the shipper record with which this data is associated. */
 *            /* If it's not available, there's nothing to do, so leave. */
 *
 *            find abs_mstr no-lock where recid(abs_mstr) = i_abs_recid
 *               no-error.
 *            if not available abs_mstr then return.
 *
 *            assign
 *               v_shipfrom = abs_shipfrom
 *               v_id       = abs_id.
 *
 *            /* Archive info for descendant records */
 *            for each abs_mstr no-lock where
 *               abs_domain = global_domain and
 *               abs_shipfrom = v_shipfrom and
 *               abs_par_id   = v_id:
 *
 *               run sh_archive (recid(abs_mstr), i_filename).
 *
 *            end.  /* for each abs_mstr */
 *
 *            /* Archive additional header data, if any */
 *            run
 *               supp_archive_qad_wkfl (
 *                  {&PROC-NAME},
 *                  {&HDR-PREFIX} + v_shipfrom + {&DELIMITER} + v_id,
 *                  i_filename ).
 *
 *            /* Archive additional line item data, if any */
 *            run
 *               supp_archive_qad_wkfl (
 *                  {&PROC-NAME},
 *                  {&ITM-PREFIX} + v_shipfrom + {&DELIMITER} + v_id,
 *                  i_filename ).
 *
 *            /* Archive additional trailer data, if any */
 *            run
 *               supp_archive_qad_wkfl (
 *                  {&PROC-NAME},
 *                  {&TRL-PREFIX} + v_shipfrom + {&DELIMITER} + v_id,
 *                  i_filename ).
 *
 *         END PROCEDURE.  /* sh_archive */
 */
         /* END OF ARCHIVE SERVICE */
 
/*****************************************************************************/
 
         /* DELETE SERVICE */
 
/*         /* Remove comments to enable this service */
 *
 *         /* NOTE:  This service is required whenever additional data is */
 *         /* stored in any table other than abs_mstr */
 *
 *
 *         PROCEDURE sh_delete:
 *
 *            /* Deletes additional header, line item, and trailer data */
 *            /* associated with a shipper header or detail record, and */
 *            /* all of its descendant records */
 *
 *            /* INPUT PARAMETERS */
 *            define input parameter i_abs_recid as recid no-undo.
 *
 *            /* LOCAL VARIABLES */
 *            define variable v_shipfrom like abs_shipfrom no-undo.
 *            define variable v_id       like abs_id       no-undo.
 *
 *            /* BUFFERS */
 *            define buffer   b_abs_mstr for  abs_mstr.
 *
 *
 *
 *            /* PROCEDURE BODY */
 *
 *            /* Find the shipper record with which this data is associated. */
 *            /* If it's not available, there's nothing to do, so leave. */
 *
 *            find b_abs_mstr no-lock where recid(b_abs_mstr) = i_abs_recid
 *                 no-error.
 *            if not available b_abs_mstr then return.
 *
 *            assign
 *               v_shipfrom = b_abs_mstr.abs_shipfrom
 *               v_id       = b_abs_mstr.abs_id.
 *
 *            /* Delete info for descendant records */
 *            for each b_abs_mstr no-lock where
 *               b_abs_mstr.abs_domain = global_domain and
 *               abs_shipfrom = v_shipfrom and
 *               abs_par_id   = v_id:
 *
 *               run sh_delete (recid(b_abs_mstr)).
 *
 *            end.  /* for each b_abs_mstr */
 *
 *            /* Delete additional header data, if any */
 *            {gprun.i
 *               ""gpqwdel.p""
 *               "({&PROC-NAME},
 *                 {&HDR-PREFIX} + v_shipfrom + {&DELIMITER} + v_id )" }
 *
 *            /* Delete additional line item data, if any */
 *            {gprun.i
 *               ""gpqwdel.p""
 *               "({&PROC-NAME},
 *                 {&ITM-PREFIX} + v_shipfrom + {&DELIMITER} + v_id )" }
 *
 *            /* Delete additional trailer data, if any */
 *            {gprun.i
 *               ""gpqwdel.p""
 *               "({&PROC-NAME},
 *                 {&TRL-PREFIX} + v_shipfrom + {&DELIMITER} + v_id )" }
 *
 *         END PROCEDURE.  /* sh_delete */
 */
         /* END OF DELETE SERVICE */
 
/*****************************************************************************/
 
/* INTERNAL SUPPORT ROUTINES */
 
/* Each of the following routines supports one or more of the above */
/* service routines.  They should NEVER be invoked from outside of */
/* the service encapsulation procedure. */
 
/***************************************************************/
 
PROCEDURE supp_load_qad_wkfl:
 
   /* READ ADDITIONAL SHIPPER HEADER, LINE ITEM, OR TRAILER DATA */
   /* STORED IN A qad_wkfl RECORD AND LOAD INTO LOCAL VARIABLES */
 
   /* INPUT PARAMETERS */
   define input parameter i_key1 like qad_key1 no-undo.
   define input parameter i_key2 like qad_key2 no-undo.
 
   /* OUTPUT PARAMETERS */
   define output parameter o_char as character no-undo.
   define output parameter o_int  as integer   no-undo.
   define output parameter o_dec  as decimal   no-undo.
 
   define output parameter o_log  like  mfc_logical   no-undo.
   define output parameter o_date as date      no-undo.
 
   /* PROCEDURE BODY */
 
   find first qad_wkfl where qad_wkfl.qad_domain = global_domain and
      qad_key1 = i_key1 and
      qad_key2 = i_key2
   no-lock no-error.
 
   if available qad_wkfl then
      assign
         o_char = qad_charfld[1]
         o_int  = integer(qad_decfld[1])
         o_dec  = qad_decfld[2]
         o_log  = qad_charfld[2] = "Y"
         o_date = qad_datefld[1].
   else
      assign
         o_char = ""
         o_int  = 0
         o_dec  = 0
         o_log  = false
         o_date = ?.
 
END PROCEDURE.  /* supp_load_qad_wkfl */
 
/***************************************************************/
 
PROCEDURE supp_save_qad_wkfl:
 
   /* SAVE ADDITIONAL SHIPPER HEADER, LINE ITEM, */
   /* OR TRAILER DATA TO A qad_wkfl RECORD */
 
   /* INPUT PARAMETERS */
   define input parameter i_key1 like qad_key1  no-undo.
   define input parameter i_key2 like qad_key2  no-undo.
   define input parameter i_char as   character no-undo.
   define input parameter i_int  as   integer   no-undo.
   define input parameter i_dec  as   decimal   no-undo.
   define input parameter i_log  as   logical   no-undo.
   define input parameter i_date as   date      no-undo.
 
   /* PROCEDURE BODY */
 
   /* CREATE OR UPDATE A qad_wkfl RECORD.  THIS IS DONE IN A */
   /* SEPARATE ROUTINE, SINCE NO DB UPDATES ARE ALLOWED IN A */
   /* SERVICE ENCAPSULATION PROCEDURE. */
 
   {us/bbi/gprun.i ""gpqwup.p""
       "(i_key1,
        i_key2,
        '',
        '',
        '',
        '',
        i_char,
        if i_log
        then 'Y' else 'N',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        decimal(i_int),
        i_dec,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        i_date,
        ?,
        ?,
        ?,
        '',
        '',
        '' )" }
 
END PROCEDURE.  /* supp_save_qad_wkfl */
 
/***************************************************************/
{us/pa/paconst.i}

PROCEDURE pick_build_det:

   /* INPUT PARAMETERS */
   define input parameter i_abs_recid    as  recid     no-undo.

   /* BUFFERS */
   define buffer          b_abs_mstr     for abs_mstr.

   for first b_abs_mstr no-lock
      where recid(b_abs_mstr) = i_abs_recid:
   end.   

   if not available b_abs_mstr then return.

   for each ttMasterSerialToShipper no-lock
      where ttMasterSerialToShipper.shipFromID = b_abs_mstr.abs_shipfrom
      and   ttMasterSerialToShipper.shipperHeadID = b_abs_mstr.abs_id
      and   ttMasterSerialToShipper.isKitComp   = no:

      find first t_abs_det exclusive-lock
         where t_abs_det.det_order = ttMasterSerialToShipper.orderNumber
         and   t_abs_det.det_line  = ttMasterSerialToShipper.orderLine
      no-error.

      if not available t_abs_det then do:
         create t_abs_det.
         assign
            det_item     = ttMasterSerialToShipper.itemNumber
            det_order    = ttMasterSerialToShipper.orderNumber
            det_line     = ttMasterSerialToShipper.orderLine
            det_qty      = 0
            det_ship_qty = 0
            det_um       = ttMasterSerialToShipper.um
            det_conv     = string(ttMasterSerialToShipper.umConv)
            det_cmtindx  = 0
            det_id       = ttMasterSerialToShipper.shipperHeadID
            det_shipfrom = ttMasterSerialToShipper.shipFromID
         .
      end.
   end.
END PROCEDURE.


PROCEDURE supp_build_det:
 
   /* Build temp table of exploded details for this shipper */
 
   /* INPUT PARAMETERS */
   define input parameter i_abs_recid    as  recid     no-undo.
 
   /* LOCAL VARIABLES */
   define variable        v_abs_shipfrom as  character no-undo.
   define variable        v_abs_id       as  character no-undo.
 
   /* BUFFERS */
   define buffer          b_abs_mstr     for abs_mstr.
 
   find first t_abs_det no-lock no-error.
   /* PROCEDURE BODY */
 
   do for b_abs_mstr:
 
      find b_abs_mstr where recid(b_abs_mstr) = i_abs_recid
      no-lock no-error.
 
      if not available b_abs_mstr
      then return.
 
      if abs_id begins "i"
      then do:
 
         find first pt_mstr  where pt_mstr.pt_domain = global_domain and
         pt_part = abs_item no-lock no-error.
 
         create t_abs_det.
         assign
            det_item     = abs_item
            det_order    = abs_order
            det_line     = abs_line
            det_qty      = if (execname  = "soivmt.p" or execname = "sosois.p")
                           then
                              abs_ship_qty
                           else
                              abs_qty
            det_ship_qty = abs_ship_qty
            det_um       = abs__qad02
            det_conv     = abs__qad03
            det_cmtindx  = abs_cmtindx
            det_id       = abs_id
            det_shipfrom = abs_shipfrom.
 
 
      end.  /* IF abs_id begins "i" */
 
      else do:
 
         assign
            v_abs_shipfrom = abs_shipfrom
            v_abs_id       = abs_id.
 
         for each b_abs_mstr  where b_abs_mstr.abs_domain = global_domain and
            abs_shipfrom = v_abs_shipfrom and
            abs_par_id   = v_abs_id
         no-lock:
            run supp_build_det (recid(b_abs_mstr)).
         end.  /* FOR EACH b_abs_mstr */
      end.  /* ELSE */
   end.  /* DO FOR b_abs_mstr */
 
END PROCEDURE.  /* supp_build_det */
 
/***************************************************************/
 
PROCEDURE supp_build_comp:
 
   /* ADD/UPDATE WORKFILE ENTRIES FOR KIT ITEM COMPONENT QUANTITIES */
 
   /* INPUT PARAMETERS */
   define input parameter i_abs_shipfrom like abs_mstr.abs_shipfrom no-undo.
   define input parameter i_abs_id       like abs_mstr.abs_id       no-undo.
   define input parameter i_abs_order    like abs_mstr.abs_order    no-undo.
   define input parameter i_abs_line     like abs_mstr.abs_line     no-undo.
 
   /* BUFFERS */
   define buffer          b_abs_mstr     for  abs_mstr.
 
   /* PROCEDURE BODY */
   for each b_abs_mstr no-lock  where b_abs_mstr.abs_domain = global_domain and
      abs_shipfrom = i_abs_shipfrom and
      abs_par_id   = i_abs_id       and
      abs_order    = i_abs_order    and
      abs_line     = i_abs_line:
 
      find t_abs_comp exclusive-lock where
         comp_item     = abs_item     and
         comp_shipfrom = abs_shipfrom and
         comp_order    = abs_order    and
         comp_line     = abs_line no-error.
 
      if not available t_abs_comp
      then do:
 
         create t_abs_comp.
         assign
            comp_item     = abs_item
            comp_shipfrom = abs_shipfrom
            comp_order    = abs_order
            comp_line     = abs_line
            comp_qty      = 0
            comp_cmtindx  = string(abs_cmtindx).
 
      end.  /* IF NOT AVAILABLE */
      else
         comp_cmtindx = comp_cmtindx + "," + string(abs_cmtindx).
 
      comp_qty = comp_qty + abs_qty.
 
   end.    /* FOR EACH b_abs_mstr */

   for each ttMasterSerialToShipper no-lock
      where ttMasterSerialToShipper.orderNumber = i_abs_order
      and   ttMasterSerialToShipper.orderLine   = i_abs_line
      and   ttMasterSerialToShipper.isKitComp   = yes:

      find t_abs_comp exclusive-lock where
         comp_item     = ttMasterSerialToShipper.itemNumber  and
         comp_shipfrom = ttMasterSerialToShipper.shipFromID  and
         comp_order    = ttMasterSerialToShipper.orderNumber and
         comp_line     = ttMasterSerialToShipper.orderLine no-error.

      if not available t_abs_comp
      then do:

         create t_abs_comp.
         assign
            comp_item     = ttMasterSerialToShipper.itemNumber
            comp_shipfrom = ttMasterSerialToShipper.shipFromID
            comp_order    = ttMasterSerialToShipper.orderNumber
            comp_line     = ttMasterSerialToShipper.orderLine.

      end.  /* IF NOT AVAILABLE */

      comp_qty_picked = comp_qty_picked + ttMasterSerialToShipper.quantityToShip.
   end.
 
END PROCEDURE.  /* supp_build_comp */
 
/***************************************************************/
 
PROCEDURE supp_archive_qad_wkfl:
 
   /* Read and archive a qad_wkfl record */
 
   /* INPUT PARAMETERS */
   define input parameter i_key1      like qad_key1  no-undo.
   define input parameter i_key2      like qad_key2  no-undo.
   define input parameter i_filename  as   character no-undo.
 
   /* PROCEDURE BODY */
 
   find first qad_wkfl no-lock  where qad_wkfl.qad_domain = global_domain and
      qad_key1 = i_key1 and
      qad_key2 = i_key2
      no-error.
 
   if available qad_wkfl
   then do:
      output stream s_history to value(i_filename) append.
      export stream s_history "qad_wkfl".
      export stream s_history qad_wkfl.
      output stream s_history close.
   end.
 
END PROCEDURE.  /* supp_archive_qad_wkfl */
 
/***************************************************************/
/* < Add additional required internal support routines here > */
/***************************************************************/
 
/* END OF INTERNAL SUPPORT ROUTINES */
 
PROCEDURE p-get-parent-wt-um:
   define input  parameter l_recid          as   recid      no-undo.
   define output parameter l_parent_tare_wt like abs_nwt    no-undo.
   define output parameter l_first_part_um  like abs_wt_um  no-undo.
 
   define variable l_par_recid     as recid        no-undo.
   define buffer b_abs_mstr for abs_mstr.
 
   /* FIND TOP-LEVEL PARENT SHIPPER OR PRESHIPPER */
   {us/bbi/gprun.i ""gpabspar.p""
      "(l_recid, 'PS', false, output l_par_recid)" }
 
   for first b_abs_mstr
      where recid(b_abs_mstr) = l_par_recid
   no-lock:
 
      if (b_abs_mstr.abs_id begins "s"    or
          b_abs_mstr.abs_id begins "p")
      then
         l_first_part_um = abs_wt_um.
 
   end. /* FOR FIRST b_abs_mstr */
 
 
   {us/ab/absupack.i  "b_abs_mstr" 26 22 "l_parent_tare_wt" }
 
END PROCEDURE.
 
PROCEDURE p-icshtyp:
   define input  parameter i_abs_recid as   recid      no-undo.
   define output parameter o_tr_type   like im_tr_type no-undo.
 
   {us/bbi/gprun.i ""icshtyp.p""
            "(input  i_abs_recid,
              output o_tr_type)" }
 
END PROCEDURE. /* PROCEDURE p-icshtyp */
 
PROCEDURE updateQtyUM:
 
   define input        parameter i_det_order     as character no-undo.
   define input        parameter i_det_line      as character no-undo.
   define input        parameter i_det_item      like det_item no-undo.
   define input-output parameter io_det_qty      as decimal   no-undo.
   define input-output parameter io_det_ship_qty as decimal   no-undo.
   define output       parameter o_det_um        as character no-undo.
   define input-output parameter io_det_conv     as character no-undo.
 
   for first sod_det
      where sod_det.sod_domain = global_domain
        and sod_nbr  = i_det_order
        and sod_line = integer (i_det_line)
        and sod_part = i_det_item
      no-lock:
   end. /* FOR FIRST sod_det */
 
   if available sod_det
   then
      assign
         io_det_qty      = ( io_det_qty * decimal(io_det_conv) ) / sod_um_conv
         io_det_ship_qty = (io_det_ship_qty * decimal(io_det_conv)) /
                           sod_um_conv
         o_det_um        = sod_um
         io_det_conv     = string(sod_um_conv).
 
   else do:
      for first idh_hist
         where idh_domain = global_domain
           and idh_nbr    = i_det_order
           and idh_line   = integer(i_det_line)
           and idh_part   = i_det_item
      no-lock:
      end. /* FOR FIRST idh_hist */
 
      if available idh_hist
      then
         assign
            io_det_qty      = (io_det_qty * decimal(io_det_conv) ) /
                              idh_um_conv
            io_det_ship_qty = (io_det_ship_qty * decimal(io_det_conv)) /
                              idh_um_conv
            o_det_um        = idh_um
            io_det_conv     = string(idh_um_conv).
 
   end. /* ELSE DO */
 
END PROCEDURE. /* PROCDURE updateQtyUM */

PROCEDURE printSerialToShip:
   define input  parameter ipItemNumber like pt_mstr.pt_part  no-undo.
   define input  parameter ipSoNumber   like sod_det.sod_nbr  no-undo.
   define input  parameter ipSoLine     like sod_det.sod_line no-undo.
   define input  parameter ipUseSoUm    like mfc_logical      no-undo.
   define input  parameter ipItemSerial as logical            no-undo.
   define output parameter cumulativeQty as decimal           no-undo.

   define buffer sod_det  for sod_det.

   define variable serialId        like ttMasterSerialToShipper.masterSerialID no-undo.
   define variable quantityShipped as decimal   no-undo.
   define variable l_continue_lbl          as  character
                                           format "x(22)"      no-undo.
   define variable v_serialId        like ttMasterSerialToShipper.masterSerialID no-undo. /*grc338*/
   define variable v_qty       as decimal no-undo. /*grc338*/
   define variable v_um        as character no-undo. /*grc338*/

   l_continue_lbl = dynamic-function('getTermLabelFillCentered' in h-label,
                       input "CONTINUE", input 22, input '*').

   for each ttMasterSerialToShipper exclusive-lock
      where ttMasterSerialToShipper.isPhantom = yes:
      ttMasterSerialToShipper.masterSerialID = "PHANTOM_SERIAL_ID".
   end.

   for each ttMasterSerialToShipper no-lock
      where itemNumber = ipItemNumber
      and   orderNumber = ipSoNumber
      and   orderLine = string(ipSoLine)
   break by masterSerialID:
      if first(masterSerialID)
      then do:
        /*grc338 *******
         /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
         if page-size - line-counter < 1
         then do:
            page.
            display
               ttMasterSerialToShipper.itemNumber @ disp_item
               l_continue_lbl @ shipper-po
               with frame l_framename.
         end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */

         if ttMasterSerialToShipper.isKitComp then do:
            put getTermLabel("PICKED", 6) at 18 skip.
         end.
         else do:
            down with frame f_det.
            display
               getTermLabel("PICKED", 6) @ ps_print_item
            with frame f_det.
         end.
        *grc338 *******/
      end.

      if first-of(masterSerialID) then do:
         quantityShipped = 0.
      end.

      quantityShipped = quantityShipped + quantityToShip.

      if last-of(masterSerialID) then do:
         
         if ttMasterSerialToShipper.isPhantom then do:
            serialId = "".
         end.
         else do:
            serialId = ttMasterSerialToShipper.masterSerialID.
         end.

        /* grc338 *******
         /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
         if page-size - line-counter < 1
         then do:
            page.
            display
               ttMasterSerialToShipper.itemNumber @ disp_item
               l_continue_lbl @ shipper-po
               with frame l_framename.
         end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
        *grc338 *******/

         if ttMasterSerialToShipper.isKitComp then do:
	     if ipUseSoUm then do:

	       /*grc338*/ assign v_serialId = serialId
	                      v_qty =   quantityShipped / ttMasterSerialToShipper.umConv
			      v_um =  ttMasterSerialToShipper.orderUM.
              /*grc338
               put
                  serialId at 18
                  quantityShipped / ttMasterSerialToShipper.umConv format "->>>>>>>9.9<<<<<" at 58 " "
                  ttMasterSerialToShipper.orderUM.
		 grc338 */
              end.
              else do:
	       /*grc338*/ assign v_serialId = serialId
	                      v_qty =   quantityShipped 
			      v_um =  ttMasterSerialToShipper.orderUM.
               /*grc338
	       put
                  serialId at 18
                  quantityShipped  format "->>>>>>>9.9<<<<<" at 58 " "
                  ttMasterSerialToShipper.um
               .  grc338 */
	       end.
               {us/xf/xfsofm09mg.i} /*grc338*/
         end.
         else do:
            /* kit item line */
            if ttMasterSerialToShipper.masterSerialID = "" then do:
	      if ipUseSoUm then do:

	        /*grc338*/ assign 
	                      v_qty =   quantityShipped / ttMasterSerialToShipper.umConv
			      v_um =  ttMasterSerialToShipper.orderUM.
              /*grc338
                  display
                     quantityShipped / ttMasterSerialToShipper.umConv  @ det_qty
                     ttMasterSerialToShipper.orderUM                   @ abs_mstr.abs__qad02
                  with frame f_det.  *grc338 */
               end.
               else do:
	            /*grc338*/ assign  v_qty =   quantityShipped 
			                v_um =  um.
					
	         /* grc338
                  display
                     quantityShipped @ det_qty
                     um              @ abs_mstr.abs__qad02
                  with frame f_det.  grc338*/		 
	       end.
                {us/xf/xfsofm09mh.i} /*grc338*/
            end.
            else do:
               /* grc338 down with frame f_det.  * grc338*/
               if ipUseSoUm then do:
	              /*grc338*/  assign v_serialId = serialId
	                          v_qty =   quantityShipped / ttMasterSerialToShipper.umConv
			           v_um =  ttMasterSerialToShipper.orderUM.
	             /*grc338
                  display
                     serialId  @ ps_print_item
                     quantityShipped / ttMasterSerialToShipper.umConv @ det_qty
                     ttMasterSerialToShipper.orderUM @ abs_mstr.abs__qad02
                  with frame f_det. grc338*/
               end.
               else do:
	            /*grc338
                  display
                     serialId  @ ps_print_item
                     quantityShipped  @ det_qty
                     um              @ abs_mstr.abs__qad02
                  with frame f_det.    *grc338*/
		   /*grc338*/ assign v_serialID = serialId
	                      v_qty =   quantityShipped 
			      v_um =  um.
		end.
               {us/xf/xfsofm09mh.i}  /*grc338*/
            end.

            assign
               cumulativeQty = if ipUseSoUm then 
                                  cumulativeQty + quantityShipped / ttMasterSerialToShipper.umConv
                               else
                                  cumulativeQty + quantityShipped
               .
         end.
      end.

      if ipItemSerial and last-of(masterSerialID) then do:
         /* FOR CONFIRMED SHIPPER, GET ITEM SERIALs FROM SHIPPING HISTORY */
         if substring(abs_mstr.abs_status, 2, 1) = "y" then do:
            empty temp-table ttItemSerialToShipper.

            {us/px/pxrun.i &PROC = 'getItemSerIDByOrderLineFromShippingHistory'
                           &PROGRAM='pasexr.p'
                           &HANDLE = ph_pasexr
                           &PARAM = "(input masterSerialID,
                                      input abs_mstr.abs_shipfrom,
                                      input abs_mstr.abs_id,
                                      input ttMasterSerialToShipper.orderNumber,
                                      input ttMasterSerialToShipper.orderLine,
                                      input-output table ttItemSerialToShipper by-reference)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}

            for each  ttItemSerialToShipper no-lock
               where ttItemSerialToShipper.itemNumber = ttMasterSerialToShipper.itemNumber:

               /*grc338
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  display
                     ttMasterSerialToShipper.itemNumber @ disp_item
                     l_continue_lbl @ shipper-po
                     with frame l_framename.
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
               if ttMasterSerialToShipper.isKitComp then do:

                  put unformatted "   " + ttItemSerialToShipper.itemSerialID at 18.
               end.
               else do:
                  down with frame f_det.
                  display
                     "   " + ttItemSerialToShipper.itemSerialID @ ps_print_item
                  with frame f_det.
               end.
                * grc338*/
               {us/xf/xfsofm09mj.i} /*grc338*/

            end.
         end.
         else do:
            empty temp-table ttItemSerialToShipper.

            {us/px/pxrun.i &PROC = 'getItemSerIDByOrderLine'
                           &PROGRAM='pasexr.p'
                           &HANDLE = ph_pasexr
                           &PARAM = "(input masterSerialID,
                                      input ttMasterSerialToShipper.orderType,
                                      input ttMasterSerialToShipper.orderNumber,
                                      input ttMasterSerialToShipper.orderLine,
                                      input-output table ttItemSerialToShipper by-reference)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}

            for each  ttItemSerialToShipper no-lock
               where ttItemSerialToShipper.itemNumber = ttMasterSerialToShipper.itemNumber:
               /*grc338****
               /* DISPLAY *** Continue *** IF ITS A NEW PAGE */
               if page-size - line-counter < 1
               then do:
                  page.
                  display
                     ttMasterSerialToShipper.itemNumber @ disp_item
                     l_continue_lbl @ shipper-po
                     with frame l_framename.
               end. /* IF PAGE-SIZE - LINE-COUNTER < 1 */
               if ttMasterSerialToShipper.isKitComp then do:
                  put unformatted "   " + ttItemSerialToShipper.itemSerialID at 18.
               end.
               else do:
                  down with frame f_det.
                  display
                     "   " + ttItemSerialToShipper.itemSerialID @ ps_print_item
                  with frame f_det.
               end.
              *** grc338*/
               {us/xf/xfsofm09mj.i} /*grc338*/
            end.
         end.
      end.

   end. /* for each ttMasterSerialToShipper */
END PROCEDURE. /* PROCEDURE printSerialToShip */

PROCEDURE isPrintPending:
   define input parameter ipItemNumber   like pt_mstr.pt_part  no-undo.
   define input parameter ipSoNumber     like sod_det.sod_nbr  no-undo.
   define input parameter ipSoLine       like sod_det.sod_line no-undo.
   define output parameter isPrintPending as logical initial "no" no-undo.

   for first ttMasterSerialToShipper no-lock
      where itemNumber = ipItemNumber
      and   orderNumber = ipSoNumber
      and   orderLine = string(ipSoLine):
   end.

   if available ttMasterSerialToShipper then do:
      isPrintPending = yes.
   end.
END PROCEDURE. /* PROCEDURE isPrintPending */

PROCEDURE createInvGroupByLotAndRef:
   define input parameter ipItemNumber   like pt_mstr.pt_part  no-undo.
   define input parameter ipSoNumber     like sod_det.sod_nbr  no-undo.
   define input parameter ipSoLine       like sod_det.sod_line no-undo.
   define input  parameter ipUseSoUm    like mfc_logical      no-undo.
   define output parameter table for ttInvGroupByLotAndRef.

   define buffer bf_ld_det for ld_det.

   empty temp-table ttInvGroupByLotAndRef.

   for each ttMasterSerialToShipper no-lock
      where itemNumber = ipItemNumber
      and   orderNumber = ipSoNumber
      and   orderLine = string(ipSoLine):

      find first ttInvGroupByLotAndRef exclusive-lock
         where ttInvGroupByLotAndRef.part   = ttMasterSerialToShipper.itemNumber
         and   ttInvGroupByLotAndRef.site   = ttMasterSerialToShipper.site
         and   ttInvGroupByLotAndRef.location = ttMasterSerialToShipper.location
         and   ttInvGroupByLotAndRef.lotser = ttMasterSerialToShipper.lotSerial
         and   ttInvGroupByLotAndRef.ref    = ttMasterSerialToShipper.reference
      no-error.

      if not available ttInvGroupByLotAndRef then do:
         create ttInvGroupByLotAndRef.
         assign
            ttInvGroupByLotAndRef.site   = ttMasterSerialToShipper.site
            ttInvGroupByLotAndRef.location = ttMasterSerialToShipper.location
            ttInvGroupByLotAndRef.part   = ttMasterSerialToShipper.itemNumber
            ttInvGroupByLotAndRef.lotser = ttMasterSerialToShipper.lotSerial
            ttInvGroupByLotAndRef.ref    = ttMasterSerialToShipper.reference.

         if ipUseSoUm then do:
            assign
               ttInvGroupByLotAndRef.qty    = ttMasterSerialToShipper.quantityToShip
                                                 / ttMasterSerialToShipper.umConv
               ttInvGroupByLotAndRef.um     = ttMasterSerialToShipper.orderUM.
         end.
         else do:
            assign
               ttInvGroupByLotAndRef.qty    = ttMasterSerialToShipper.quantityToShip
               ttInvGroupByLotAndRef.um     = ttMasterSerialToShipper.um.
         end.

         for first bf_ld_det no-lock
            where bf_ld_det.ld_domain = global_domain
              and bf_ld_det.ld_part = ttMasterSerialToShipper.itemNumber
              and bf_ld_det.ld_site = ttMasterSerialToShipper.site
              and bf_ld_det.ld_loc = ttMasterSerialToShipper.location
              and bf_ld_det.ld_lot = ttMasterSerialToShipper.lotSerial
              and bf_ld_det.ld_ref = ttMasterSerialToShipper.reference:
         end.

         if available bf_ld_det then do:
            ttInvGroupByLotAndRef.expireDate = bf_ld_det.ld_expire.
         end.
      end.
      else do:
         if ipUseSoUm then do:
            ttInvGroupByLotAndRef.qty    = ttInvGroupByLotAndRef.qty +
               ttMasterSerialToShipper.quantityToShip / ttMasterSerialToShipper.umConv.
         end.
         else do:
            ttInvGroupByLotAndRef.qty = ttInvGroupByLotAndRef.qty +
               ttMasterSerialToShipper.quantityToShip.
         end.
      end.
   end.

END PROCEDURE. /* PROCEDURE createInvGroupByLotAndRef */
PROCEDURE get_abs_parent:
/*--------------------------------------------------------------------------
  Purpose:     Used to determine abs_id of the structure that is the
               highest parent ("ancestor" for lack of a better term)
  Parameters:
  Notes:       par_absid of ? is returned in case of some abnormal situation
--------------------------------------------------------------------------*/
   define input  parameter p_absid      as character       no-undo.
   define input  parameter p_shipfrom   as character       no-undo.
   define output parameter p_par_absid  as character       no-undo.

   define buffer abs_buff for abs_mstr.

   define variable l_ctr as integer no-undo.

   p_par_absid    = p_absid.

   /* GO UP THE "CHAIN" USING abs_par_id TILL THE "ANCESTOR" IS         */
   /* DETERMINED. PREVENT INFINITE LOOPING DUE TO FREAK DATA CORRUPTION */
   do while l_ctr < 1000:
      find abs_buff
         where abs_buff.abs_domain   = global_domain
         and   abs_buff.abs_shipfrom = p_shipfrom
         and   abs_buff.abs_id       = p_par_absid
      no-lock no-error.

      /* THE "ANCESTOR" RECORD HAS THE abs_par_id = "" */
      if available abs_buff
      then do:
         if abs_buff.abs_par_id = ""
         then do:
            p_par_absid = abs_buff.abs_id.
            leave.
         end. /* IF abs_buff.abs_par_id = "" */
         else
            p_par_absid = abs_buff.abs_par_id.
      end. /* IF AVAILABLE abs_buff */
      else do:
         p_par_absid = ?.
         leave.
      end. /* ELSE DO */
   end. /* DO WHILE l_ctr < 1000 */

   if l_ctr >= 1000
   then
      p_par_absid = ?.

END PROCEDURE. /* PROCEDURE get_abs_parent */
