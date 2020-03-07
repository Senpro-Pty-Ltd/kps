/* xfputd.i - FORMTRAP DATE OUTPUT STREAM INCLUDE FILE                        */
/* Copyright 1986-2009 QAD Inc., Carpinteria, CA, USA.                        */
/* All rights reserved worldwide.  This is an unpublished work.               */
/* Revision: eB3SP5    BY: Achint Lele        DATE: 02/08/10  ECO: *eb3sp5*   */
/*V8:ConvertMode=Report                                                       */
/* {1} - Field                                                                */
/* {2} - Pos                                                                  */
/* format {xfputd.i fieldname startpos }                                      */
/* eg.    {xfputd.i today     8 }                                             */
/* Put statements should probably be "put stream ft"                          */
         
string(year({1}),"9999") + string(month({1}),"99") + string(day({1}),"99")
   at {2}   format   "x(08)" /*Date yyyymmdd*/
