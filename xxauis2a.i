/* xxauis2a.i                                                                */
/* Copyright 1986-2002 QAD Inc., Carpinteria, CA, USA.                       */
/* All rights reserved worldwide.  This is an unpublished work.              */
/*---------------------------------------------------------------------------*/
/* CYB    LAST MODIFIED: 23-JUN-2011    BY:  nac *cy1045*                    */
/* CYB    LAST MODIFIED: 13-SEP-2011    BY:  gbg *c1241*                     */
/* CYB Upgrade 2012.1EE  LAST MODIFIED: 14-NOV-2012 BY: gbg *d2101*   */
/*---------------------------------------------------------------------------*/

procedure prsetvars.

assign
vcPriHeading     = svcPriHeading
vcPriHeadComment = svcPriHeadComment
vcPriLineComment = svcPriLineComment
vlPriLineTax     = svlPriLineTax
vlPriDesc2       = svlPriDesc2
vlPriCustItem    = svlPriCustItem

vcHeading        = svcHeading
vcHeading1       = svcHeading1
vcTranType       = svcTranType
vcTaxRef         = svcTaxRef
vcTaxNbr         = svcTaxNbr
viTaxLine        = sviTaxLine
vdPrintWidth     = svdPrintWidth.

end.

procedure prunsetvars.

assign
svcPriHeading     = vcPriHeading
svcPriHeadComment = vcPriHeadComment
svcPriLineComment = vcPriLineComment
svlPriLineTax     = vlPriLineTax
svlPriDesc2       = vlPriDesc2
svlPriCustItem    = vlPriCustItem

svcHeading        = vcHeading
svcHeading1       = vcHeading1
svcTranType       = vcTranType
svcTaxRef         = vcTaxRef
svcTaxNbr         = vcTaxNbr
sviTaxLine        = viTaxLine
svdPrintWidth     = vdPrintWidth.

end.
