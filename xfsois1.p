/* xfrcsoi1.p - Customer Schedules Confirm Shipper                            */
/* rcsois1.p - Customer Schedules Confirm Shipper                             */
/* Copyright 1986 QAD Inc. All rights reserved.                               */
/* $Id: xfsois1.p,v 1.2 2018/03/13 17:09:37 gbg Exp $: */
/* REVISION: 7.3      LAST MODIFIED: 10/12/92   BY: WUG *G462*                */
/* REVISION: 7.3      LAST MODIFIED: 04/22/93   BY: WUG *GA12*                */
/* REVISION: 7.3      LAST MODIFIED: 06/01/93   BY: WUG *GB46*                */
/* REVISION: 7.3      LAST MODIFIED: 07/26/93   BY: WUG *GD70*                */
/* REVISION: 7.3      LAST MODIFIED: 08/13/93   BY: WUG *GE19*                */
/* REVISION: 7.3      LAST MODIFIED: 08/27/93   BY: WUG *GE58*                */
/* REVISION: 7.3      LAST MODIFIED: 09/03/93   BY: WUG *GE79*                */
/* REVISION: 7.4      LAST MODIFIED: 07/22/93   BY: pcd *H039*                */
/* REVISION: 7.4      LAST MODIFIED: 09/21/93   BY: WUG *H130*                */
/* REVISION: 7.4      LAST MODIFIED: 09/28/93   BY: WUG *H140*                */
/* REVISION: 7.4      LAST MODIFIED: 09/30/93   BY: WUG *H146*                */
/* REVISION: 7.4      LAST MODIFIED: 10/13/93   BY: WUG *H172*                */
/* REVISION: 7.4      LAST MODIFIED: 10/15/93   BY: WUG *H180*                */
/* REVISION: 7.4      LAST MODIFIED: 12/01/93   BY: WUG *H257*                */
/* REVISION: 7.4      LAST MODIFIED: 12/21/93   BY: WUG *GI20*                */
/* REVISION: 7.4      LAST MODIFIED: 12/22/93   BY: WUG *H268*                */
/* REVISION: 7.4      LAST MODIFIED: 01/04/93   BY: tjs *H166*                */
/* REVISION: 7.4      LAST MODIFIED: 03/24/94   BY: pcd *H304*                */
/* REVISION: 7.4      LAST MODIFIED: 03/24/94   BY: dpm *H074*                */
/* REVISION: 7.4      LAST MODIFIED: 04/14/94   BY: dpm *H347*                */
/* REVISION: 7.4      LAST MODIFIED: 07/20/94   BY: bcm *H447*                */
/* REVISION: 7.4      LAST MODIFIED: 08/09/94   BY: dpm *GL13*                */
/* REVISION: 7.4      LAST MODIFIED: 09/07/94   BY: bcm *H507*                */
/* REVISION: 7.4      LAST MODIFIED: 09/08/94   BY: bcm *H509*                */
/* REVISION: 7.4      LAST MODIFIED: 11/02/94   BY: mmp *H579*                */
/* REVISION: 7.4      LAST MODIFIED: 11/19/94   BY: GWM *H604*                */
/* REVISION: 7.4      LAST MODIFIED: 11/30/94   BY: afs *H611*                */
/* REVISION: 7.4      LAST MODIFIED: 12/07/94   BY: bcm *H617*                */
/* REVISION: 7.4      LAST MODIFIED: 12/08/94   BY: jxz *GO77*                */
/* REVISION: 7.4      LAST MODIFIED: 12/09/94   BY: jxz *GO83*                */
/* REVISION: 7.4      LAST MODIFIED: 12/15/94   BY: str *G09F*                */
/* REVISION: 7.4      LAST MODIFIED: 12/15/94   BY: rxm *GN16*                */
/* REVISION: 7.4      LAST MODIFIED: 12/19/94   BY: bcm *H09G*                */
/* REVISION: 7.4      LAST MODIFIED: 01/06/94   BY: aep *G0BK*                */
/* REVISION: 8.5      LAST MODIFIED: 12/13/94   BY: mwd *J034*                */
/* REVISION: 7.4      LAST MODIFIED: 01/20/95   BY: rxm *G0CX*                */
/* REVISION: 7.4      LAST MODIFIED: 03/13/95   BY: jxz *F0M3*                */
/* REVISION: 7.4      LAST MODIFIED: 03/29/95   BY: dzn *F0PN*                */
/* REVISION: 7.4      LAST MODIFIED: 04/06/95   BY: ame *H0CF*                */
/* REVISION: 7.4      LAST MODIFIED: 05/09/95   BY: dxk *G0MC*                */
/* REVISION: 7.4      LAST MODIFIED: 06/14/95   BY: bcm *F0SR*                */
/* REVISION: 8.5      LAST MODIFIED: 06/16/95   BY: rmh *J04R*                */
/* REVISION: 7.4      LAST MODIFIED: 07/20/95   BY: jym *H0F7*                */
/* REVISION: 7.4      LAST MODIFIED: 08/15/95   BY: vrn *G0V3*                */
/* REVISION: 7.4      LAST MODIFIED: 08/28/95   BY: vrn *G0VP*                */
/* REVISION: 7.4      LAST MODIFIED: 09/25/95   BY: vrn *H0G2*                */
/* REVISION: 7.4      LAST MODIFIED: 10/05/95   BY: vrn *G0X3*                */
/* REVISION: 8.5      LAST MODIFIED: 08/01/95   BY: taf *J053*                */
/* REVISION: 8.5      LAST MODIFIED: 07/13/95   BY: gwm *J0JL*                */
/* REVISION: 8.5      LAST MODIFIED: 04/18/96   BY: mzh *J0JL*                */
/* REVISION: 8.5      LAST MODIFIED: 04/24/96   BY: GWM *J0K9*                */
/* REVISION: 8.5      LAST MODIFIED: 05/14/96   BY: vrn *G1LV*                */
/* REVISION: 8.6      LAST MODIFIED: 06/11/96   BY: ejh *K001*                */
/* REVISION: 8.5      LAST MODIFIED: 06/19/96   BY: rvw *G1XY*                */
/* REVISION: 8.5      LAST MODIFIED: 07/18/96   BY: taf *J0ZS*                */
/* REVISION: 8.5      LAST MODIFIED: 07/30/96   BY: gwm *J12V*                */
/* REVISION: 8.6      LAST MODIFIED: 08/09/96   BY: *K02H* Vinay Nayak-Sujir  */
/* REVISION: 8.5      LAST MODIFIED: 08/16/96   BY: *H0MD* Suresh Nayak       */
/* REVISION: 8.5      LAST MODIFIED: 08/26/96   BY: *G2CR* Ajit Deodhar       */
/* REVISION: 8.6      LAST MODIFIED: 09/20/96   BY: TSI *K005*                */
/* REVISION: 8.6      LAST MODIFIED: 10/04/96   BY: *K02H* forrest mori       */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K004* Kurt De Wit        */
/* REVISION: 8.6      LAST MODIFIED: 10/22/96   BY: *K01T* Kurt De Wit        */
/* REVISION: 8.6      LAST MODIFIED: 12/06/96   BY: *K030* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 12/10/96   BY: *K039* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 12/30/96   BY: *K03V* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 01/26/96   BY: *K03J* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 02/04/97   BY: *K05V* Vinay Nayak-Sujir  */
/* REVISION: 8.6      LAST MODIFIED: 03/15/97   BY: *K04X* Steve Goeke        */
/* REVISION: 8.6      LAST MODIFIED: 04/02/97   BY: *K09H* Vinay Nayak-Sujir  */
/* REVISION: 8.5      LAST MODIFIED: 04/07/97   BY: *J1M3* Jean Miller        */
/* REVISION: 8.6      LAST MODIFIED: 04/15/97   BY: *H0W3* Suresh Nayak       */
/* REVISION: 8.6      LAST MODIFIED: 05/13/97   BY: *J1MP* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 07/10/97   BY: *K0G6* Arul Victoria      */
/* REVISION: 8.6      LAST MODIFIED: 07/12/97   BY: *K0DH* Kieu Nguyen        */
/* REVISION: 8.6      LAST MODIFIED: 08/06/97   BY: *J1YG* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 09/20/97   BY: *H1F5* Niranjan Ranka     */
/* REVISION: 8.6      LAST MODIFIED: 10/09/97   BY: *K0JV* Surendra Kumar     */
/* REVISION: 8.6      LAST MODIFIED: 11/03/97   BY: *J22N* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 11/18/97   BY: *K18W* Taek-Soo Chang     */
/* REVISION: 8.6      LAST MODIFIED: 11/06/97   BY: *H1GD* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 11/19/97   BY: *H1GL* Nirav Parikh       */
/* REVISION: 8.6      LAST MODIFIED: 11/28/97   BY: *H1GZ* Seema Varma        */
/* REVISION: 8.6      LAST MODIFIED: 12/13/97   BY: *J20Q* Aruna Patil        */
/* REVISION: 8.6      LAST MODIFIED: 12/30/97   BY: *J281* Manish Kulkarni    */
/* REVISION: 8.6      LAST MODIFIED: 12/02/97   BY: *K15N* Jim Williams       */
/* REVISION: 8.6      LAST MODIFIED: 01/22/98   BY: *H1J7* Nirav Parikh       */
/* REVISION: 8.6E     LAST MODIFIED: 04/07/98   BY: *J2DD* Kawal Batra        */
/* REVISION: 8.6E     LAST MODIFIED: 02/23/98   BY: *L007* Annasaheb Rahane   */
/* REVISION: 8.6E     LAST MODIFIED: 05/09/98   BY: *L00Y* Jeff Wootton       */
/* REVISION: 8.6E     LAST MODIFIED: 05/29/98   BY: *K1JN* Niranjan Ranka     */
/* REVISION: 8.6E     LAST MODIFIED: 06/18/98   BY: *J2KY* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 06/26/98   BY: *J2MG* Samir Bavkar       */
/* REVISION: 8.6E     LAST MODIFIED: 06/29/98   BY: *J2PB* Dana Tunstall      */
/* REVISION: 8.6E     LAST MODIFIED: 07/07/98   BY: *L03Q* Niranjan Ranka     */
/* REVISION: 8.6E     LAST MODIFIED: 07/15/98   BY: *L024* Bill Reckard       */
/* REVISION: 8.6E     LAST MODIFIED: 08/27/98   BY: *K1WQ* Irine D'mello      */
/* REVISION: 8.6E     LAST MODIFIED: 09/02/98   BY: *H1LZ* Manish Kulkarni    */
/* REVISION: 8.6E     LAST MODIFIED: 10/23/98   BY: *L0CD* Steve Goeke        */
/* REVISION: 9.0      LAST MODIFIED: 12/16/98   BY: *J371* Niranjan Ranka     */
/* REVISION: 9.0      LAST MODIFIED: 12/17/98   BY: *K1YG* Seema Varma        */
/* REVISION: 9.0      LAST MODIFIED: 01/19/99   BY: *M05Q* Seema Varma        */
/* REVISION: 9.0      LAST MODIFIED: 03/13/99   BY: *M0BD* Alfred Tan         */
/* REVISION: 9.0      LAST MODIFIED: 03/23/99   BY: *H1NP* Poonam Bahl        */
/* REVISION: 9.0      LAST MODIFIED: 03/30/99   BY: *K1ZH* Santosh Rao        */
/* REVISION: 9.0      LAST MODIFIED: 04/27/99   BY: *H1NW* Santosh Rao        */
/* REVISION: 9.0      LAST MODIFIED: 04/28/99   BY: *J3BM* Reetu Kapoor       */
/* REVISION: 9.0      LAST MODIFIED: 05/26/99   BY: *J3G7* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 10/01/99   BY: *N014* Vijaya Pakala      */
/* REVISION: 9.1      LAST MODIFIED: 06/22/99   BY: *K20Q* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 06/22/99   BY: *K21B* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 07/09/99   BY: *J3HZ* Poonam Bahl        */
/* REVISION: 9.1      LAST MODIFIED: 08/06/99   BY: *N01G* Kedar Deherkar     */
/* REVISION: 9.1      LAST MODIFIED: 08/11/99   BY: *K224* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 08/12/99   BY: *J3KJ* Bengt Johansson    */
/* REVISION: 9.1      LAST MODIFIED: 10/27/99   BY: *K240* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 01/11/00   BY: *J3N6* Santosh Rao        */
/* REVISION: 9.1      LAST MODIFIED: 03/24/00   BY: *N08T* Annasaheb Rahane   */
/* REVISION: 9.1      LAST MODIFIED: 02/18/00   BY: *N06R* Brian Henderson    */
/* REVISION: 9.1      LAST MODIFIED: 04/21/00   BY: *N09J* Denis Tatarik      */
/* REVISION: 9.1      LAST MODIFIED: 05/17/00   BY: *L0XV* Kedar Deherkar     */
/* REVISION: 9.1      LAST MODIFIED: 06/06/00   BY: *N0CZ* John Pison         */
/* REVISION: 9.1      LAST MODIFIED: 07/14/00   BY: *N0F2* John Pison         */
/* REVISION: 9.1      LAST MODIFIED: 07/20/00   BY: *L0QV* Manish Kulkarni    */
/* REVISION: 9.1      LAST MODIFIED: 08/12/00   BY: *N0KP* Mark Brown         */
/* REVISION: 9.1      LAST MODIFIED: 08/25/00   BY: *L12D* Reetu Kapoor       */
/* REVISION: 9.1      LAST MODIFIED: 12/14/00   BY: *M0Y0* Ashwini Ghaisas    */
/* REVISION: 9.1      LAST MODIFIED: 12/20/00   BY: *L155* Abhijeet Thakur    */
/* REVISION: 9.1      LAST MODIFIED: 09/23/00   BY: *N0WD* BalbeerS Rajput    */
/* Revision: 1.93      BY: Katie Hilbert          DATE: 04/01/01  ECO: *P002* */
/* Revision: 1.96      BY: Rajaneesh Sarangi      DATE: 06/29/01  ECO: *M1CP* */
/* Revision: 1.97      BY: Dan Herman             DATE: 07/09/01  ECO: *P007* */
/* Revision: 1.98      BY: Jean Miller            DATE: 08/07/01  ECO: *M11Z* */
/* Revision: 1.100     BY: Dan Herman             DATE: 08/15/01  ECO: *P01L* */
/* Revision: 1.102     BY: Ashwini Ghaisas        DATE: 12/15/01  ECO: *M1LD* */
/* Revision: 1.103     BY: Mark Christian         DATE: 02/07/02  ECO: *N18X* */
/* Revision: 1.106     BY: Patrick Rowan          DATE: 04/24/01  ECO: *P00G* */
/* Revision: 1.107     BY: Jean Miller            DATE: 04/03/02  ECO: *P053* */
/* Revision: 1.108     BY: Ed van de Gevel        DATE: 04/17/02  ECO: *N1GR* */
/* Revision: 1.109     BY: Vandna Rohira          DATE: 04/29/02  ECO: *M1Y2* */
/* Revision: 1.110     BY: Mercy Chittilapilly    DATE: 05/29/02  ECO: *N1K8* */
/* Revision: 1.111     BY: Sandeep Parab          DATE: 06/04/02  ECO: *M1XH* */
/* Revision: 1.114     BY: Robin McCarthy         DATE: 07/02/02  ECO: *P0B2* */
/* Revision: 1.115     BY: R.Satya Narayan        DATE: 06/25/02  ECO: *P086* */
/* Revision: 1.116     BY: Samir Bavkar           DATE: 07/07/02  ECO: *P0B0* */
/* Revision: 1.117     BY: Robin McCarthy         DATE: 07/15/02  ECO: *P0BJ* */
/* Revision: 1.119     BY: Samir Bavkar           DATE: 08/15/02  ECO: *P09K* */
/* Revision: 1.120     BY: Samir Bavkar           DATE: 08/18/02  ECO: *P0FS* */
/* Revision: 1.121     BY: Manjusha Inglay        DATE: 08/27/02  ECO: *N1S3* */
/* Revision: 1.122     BY: Ed van de Gevel        DATE: 09/05/02  ECO: *P0HQ* */
/* Revision: 1.123     BY: Rajiv Ramaiah          DATE: 01/13/03  ECO: *N23Z* */
/* Revision: 1.124     BY: Amit Chaturvedi        DATE: 01/20/03  ECO: *N20Y* */
/* Revision: 1.128     BY: Robin McCarthy         DATE: 02/28/03  ECO: *P0M9* */
/* Revision: 1.129     BY: Narathip W.            DATE: 05/08/03  ECO: *P0RL* */
/* Revision: 1.132     BY: Paul Donnelly (SB)     DATE: 06/28/03  ECO: *Q00P* */
/* Revision: 1.133     BY: Rajinder Kamra         DATE: 05/05/03  ECO: *Q00Y* */
/* Revision: 1.134     BY: Rajinder Kamra         DATE: 07/14/03  ECO: *Q013* */
/* Revision: 1.136     BY: Katie Hilbert          DATE: 08/05/03  ECO: *P0TV* */
/* Revision: 1.137     BY: Ashish Maheshwari      DATE: 08/12/03  ECO: *P0V3* */
/* Revision: 1.138     BY: Deepak Rao             DATE: 08/20/03  ECO: *N2K3* */
/* Revision: 1.139     BY: Ed van de Gevel        DATE: 08/27/03  ECO: *Q02M* */
/* Revision: 1.140     BY: Deepak Rao             DATE: 09/08/03  ECO: *N2KM* */
/* Revision: 1.141     BY: Vinay Soman            DATE: 10/22/03  ECO: *N2M1* */
/* Revision: 1.142     BY: Vinay Soman            DATE: 10/27/03  ECO: *N2M8* */
/* Revision: 1.143     BY: Veena Lad              DATE: 12/23/03  ECO: *P1H3* */
/* Revision: 1.144     BY: Sushant Pradhan        DATE: 03/10/04  ECO: *P1SR* */
/* Revision: 1.145     BY: Manish Dani            DATE: 04/24/04  ECO: *P1YP* */
/* Revision: 1.146     BY: Vandna Rohira          DATE: 05/31/04  ECO: *P1Z0* */
/* Revision: 1.147     BY: Mercy Chittilapilly    DATE: 06/16/04  ECO: *P26B* */
/* Revision: 1.148     BY: Vandna Rohira          DATE: 06/22/04  ECO: *P277* */
/* Revision: 1.149     BY: Abhishek Jha           DATE: 07/23/04  ECO: *P2B9* */
/* Revision: 1.150     BY: Shivganesh Hegde       DATE: 08/03/04  ECO: *P26L* */
/* Revision: 1.151     BY: Sachin Deshmukh        DATE: 09/09/04  ECO: *Q0CS* */
/* Revision: 1.155     BY: Bharath Kumar          DATE: 09/23/04  ECO: *P2LB* */
/* Revision: 1.156     BY: Shivganesh Hegde       DATE: 09/22/04  ECO: *P2LM* */
/* Revision: 1.157     BY: Sushant Pradhan        DATE: 12/17/04  ECO: *P2Z7* */
/* Revision: 1.158     BY: Ed van de Gevel        DATE: 03/07/05  ECO: *R00K* */
/* Revision: 1.159     BY: Preeti Sattur          DATE: 03/17/05  ECO: *P3CL* */
/* Revision: 1.160     BY: Manish Dani            DATE: 04/08/05  ECO: *P3DM* */
/* Revision: 1.161     BY: Somesh Jeswani         DATE: 08/23/05  ECO: *P3YQ* */
/* Revision: 1.164     BY: Deirdre O'Brien        DATE: 09/07/05  ECO: *R01P* */
/* Revision: 1.165     BY: Deirdre O'Brien        DATE: 04/08/05  ECO: *R021* */
/* Revision: 1.167     BY: Steve Nugent           DATE: 11/09/05  ECO: *R027* */
/* Revision: 1.168     BY: Tejasvi Kulkarni       DATE: 11/30/05  ECO: *P49S* */
/* Revision: 1.169     BY: Shivganesh Hegde       DATE: 12/30/05  ECO: *P4DV* */
/* Revision: 1.170     BY: Cindy Votro            DATE: 03/20/06  ECO: *R001* */
/* Revision: 1.173     BY: Munira Savai           DATE: 04/24/06  ECO: *P4N7* */
/* Revision: 1.174     BY: Amit Singh             DATE: 05/10/06  ECO: *P4PV* */
/* Revision: 1.175     BY: Miguel Alonso          DATE: 08/02/06  ECO: *R079* */
/* Revision: 1.176     BY: Katie Hilbert          DATE: 10/06/06  ECO: *R098* */
/* Revision: 1.177     BY: Preeti Sattur          DATE: 10/30/06  ECO: *P5CN* */
/* Revision: 1.178     BY: Suyash Keny            DATE: 11/17/06  ECO: *P5FF* */
/* Revision: 1.180     BY: Antony LejoS           DATE: 01/03/07  ECO: *P5HT* */
/* Revision: 1.181     BY: Xavier Prat            DATE: 03/07/07  ECO: *R0FP* */
/* Revision: 1.182     BY: Sumit Karunakaran      DATE: 07/18/07  ECO: *P5HV* */
/* Revision: 1.186     BY: Edgar Roca             DATE: 09/13/07  ECO: *R0C6* */
/* Revision: 1.189     BY: Jean Miller            DATE: 10/29/07  ECO: *R0JM* */
/* Revision: 1.190     BY: Robin McCarthy         DATE: 01/11/08  ECO: *R08C* */
/* Revision: 1.191     BY: Iram Momin             DATE: 01/29/08  ECO: *Q1BJ* */
/* Revision: 1.192     BY: Steve Nugent           DATE: 01/30/08  ECO: *R059* */
/* Revision: 1.193     BY: Jean Miller            DATE: 02/12/08  ECO: *P66J* */
/* Revision: 1.196     BY: Jean Miller            DATE: 02/19/08  ECO: *P5LS* */
/* Revision: 1.197     BY: Neil Curzon            DATE: 03/17/08  ECO: *R0P6* */
/* Revision: 1.198     BY: Vivek Kamath           DATE: 04/22/08  ECO: *P4LG* */
/* Revision: 1.204     BY: Jean Miller            DATE: 06/18/08  ECO: *R0V9* */
/* Revision: 1.206     BY: Nan Zhang              DATE: 07/02/08  ECO: *R0JS* */
/* Revision: 1.207     BY: Xavier Prat            DATE: 07/07/08  ECO: *R0NZ* */
/* Revision: 1.210     BY: Nan Zhang              DATE: 07/09/08  ECO: *R0W4* */
/* Revision: 1.211     BY: Nan Zhang              DATE: 07/16/08  ECO: *R0XB* */
/* Revision: 1.212     BY: Rajalaxmi Ganji        DATE: 07/16/08  ECO: *P6WZ* */
/* Revision: 1.215     BY: Nan Zhang              DATE: 08/28/08  ECO: *R12F* */
/* Revision: 1.220     BY: Katie Hilbert          DATE: 11/12/08  ECO: *R175* */
/* Revision: 1.221     BY: Yizhou Mao             DATE: 12/04/08  ECO: *R18K* */
/* Revision: 1.222     BY: Jiang Wan              DATE: 02/28/09  ECO: *R1BY* */
/* Revision: 1.223     BY: Jean Miller            DATE: 03/06/09  ECO: *R1DP* */
/* Revision: 1.224     BY: Katie Hilbert          DATE: 06/29/09  ECO: *R1L2* */
/* Revision: 1.225     BY: Xavier Prat            DATE: 07/10/09  ECO: *R1M2* */
/* Revision: 1.226     BY: Jordan Fei             DATE: 06/18/09  ECO: *R1J1* */
/* Revision: 1.227     BY: Jordan Fei             DATE: 07/30/09  ECO: *R1N2* */
/* Revision: 1.228     BY: Jean Miller            DATE: 09/02/09  ECO: *Q3C7* */
/* Revision: 1.229     BY: Jean Miller            DATE: 09/24/09  ECO: *P69Z* */
/* Revision: 1.230     BY: Zhijun Guan            DATE: 08/20/09  ECO: *R1V9* */
/* Revision: 1.231     BY: Dipanshu Talwar        DATE: 01/04/10  ECO: *Q3QG* */
/* Revision: 1.233     BY: Jordan Fei             DATE: 01/12/10  ECO: *R1W5* */
/* Revision: 1.235     BY: Katie Hilbert          DATE: 02/20/10  ECO: *R1YB* */
/* Revision: 1.236     BY: Jordan Fei             DATE: 03/02/10  ECO: *R22Q* */
/* Revision: 1.237     BY: Josep Ma Garcia        DATE: 07/09/10  ECO: *R22F* */
/* Revision: 1.238     BY: Jordan Fei             DATE: 07/30/10  ECO: *R235* */
/* Revision: 1.239     BY: Jordan Fei             DATE: 08/10/10  ECO: *R24T* */
/* Revision: QAD2014      BY: Amol Dudvadkar    DATE: 03/16/15  ECO: *grc338  */
/*-Revision end---------------------------------------------------------------*/
 
/******************************************************************************/
/* All patch markers and commented out code have been removed from the source */
/* code below. For all future modifications to this file, any code which is   */
/* no longer required should be deleted and no in-line patch markers should   */
/* be added.  The ECO marker should only be included in the Revision History. */
/******************************************************************************/
 
/* CHANGES MADE TO THIS PROGRAM NEED TO BE MADE TO RCSOIS2.P, AS WELL */
using com.qad.eefin.bdomain.DomainForOperationalInfo.
using com.qad.eefin.bexchangeratetype.ExchangeRateTypeByTypeCode.
using com.qad.eefin.bcurrency.SelectCurrency.
 
{us/bbi/mfdeclre.i}
{us/gp/gpuid.i}
{us/bbi/gplabel.i} /* EXTERNAL LABEL INCLUDE */
{us/pp/ppprlst.i} /* PRICE LIST CONSTANTS */
{us/gl/gldydef.i new}
{us/gl/gldynrm.i new}
 
{us/ap/apconsdf.i}   /* PRE-PROCESSOR CONSTANTS FOR LOGISTICS ACCOUNTING */
{us/so/sottval.i}    /* COMMON TEMP-TABLES FOR SHIPPER/ASN VALIDATION */
{us/so/sovalcon.i}   /* COMMON CONSTANTS FOR SHIPPER/ASN VALIDATION */
{us/so/sovalprc.i}   /* COMMON PROCEDURES FOR SHIPPER/ASN VALIDATION */
{us/gp/gpldcons.i} /* CONSTANTS FOR LEGAL DOCUMENT */
{us/px/pxmaint.i}
{us/px/pxphdef.i sosodxr}
{us/px/pxphdef.i pashphxr}
{us/px/pxphdef.i padovdxr}
{us/pa/paconst.i}

{ proxy/datasets/tfcmessages.i }

/* NEW SHARED VARIABLES, BUFFERS AND FRAMES */
define new shared variable rndmthd        like rnd_rnd_mthd.
define new shared variable abs_carr_ref     as character.
define new shared variable abs_fob        like so_fob.
define new shared variable abs_recid        as recid.
define new shared variable abs_shipvia    like so_shipvia.
define new shared variable accum_wip      like tr_gl_amt.
define new shared variable already_posted like glt_amt.
define new shared variable auto_post      like mfc_logical label "Post Invoice".
define new shared variable base_amt       like ar_amt.
define new shared variable batch          like ar_batch.
define new shared variable first_batch    like ar_batch.
define new shared variable batch_tot      like glt_amt.
define new shared variable bill           like so_bill.
define new shared variable bill1          like so_bill.
define new shared variable change_db      like mfc_logical.
define new shared variable consolidate    like mfc_logical
   label "Consolidate Invoices".
define new shared variable cr_acct        like trgl_cr_acct.
define new shared variable cr_sub         like trgl_cr_sub.
define new shared variable cr_amt           as decimal
   format "->>>,>>>,>>>.99" label "Credit Amount".
define new shared variable cr_cc          like trgl_cr_cc.
define new shared variable cr_proj        like trgl_cr_proj.
define new shared variable curr_amt       like glt_amt.
define new shared variable cust           like so_cust.
define new shared variable cust1          like so_cust.
define new shared variable desc1          like pt_desc1 format "x(49)".
define new shared variable dr_acct        like trgl_dr_acct.
define new shared variable dr_sub         like trgl_dr_sub.
define new shared variable dr_amt           as decimal
   format "->>>,>>>,>>>.99" label "Debit Amount".
define new shared variable dr_cc          like trgl_dr_cc.
define new shared variable eff_date       like glt_effdate label "Effective".
define new shared variable exch_rate      like exr_rate.
define new shared variable exch_rate2     like exr_rate2.
define new shared variable exch_ratetype  like exr_ratetype.
define new shared variable exch_exru_seq  like exru_seq.
define new shared variable ext_cost       like sod_price.
define new shared variable ext_disc         as decimal decimals 2.
define new shared variable gr_margin      like sod_price
   label "Unit Margin" format "->>>>,>>9.99".
define new shared variable ext_gr_margin  like gr_margin label "Ext Margin".
define new shared variable base_margin    like ext_gr_margin.
define new shared variable ext_list       like sod_list_pr decimals 2.
define new shared variable ext_price        as decimal
   label "Ext Price" decimals 2 format "->>>>,>>>,>>9.99".
define new shared variable base_price     like ext_price.
define new shared variable freight_ok     like mfc_logical.
define new shared variable gl_amt         like sod_fr_chg.
define new shared variable gl_sum         like mfc_logical
   format "Consolidated/Detail" initial yes.
define new shared variable inv            like ar_nbr label "Invoice".
define new shared variable inv1           like ar_nbr label "To".
define new shared variable inv_only       like mfc_logical initial yes.
define new shared variable loc like pt_loc.
define new shared variable lotserial_total like tr_qty_chg.
define new shared variable name           like ad_name.
define new shared variable nbr like tr_nbr.
define new shared variable net_price      like sod_price.
define new shared variable net_list       like sod_list_pr.
define new shared variable old_ft_type      as character.
define new shared variable ord-db-cmtype  like cm_type no-undo.
define new shared variable order_ct         as integer.
define new shared variable order_nbrs       as character extent 30.
define new shared variable order_nbr_list   as character no-undo.
define new shared variable part             as character format "x(18)".
define new shared variable post           like mfc_logical.
define new shared variable post_entity    like ar_entity.
define new shared variable print_lotserials like mfc_logical
   label "Print Lot/Serial Numbers Shipped".
define new shared variable project        like wo_project no-undo.
define new shared variable projectcr      like wo_project no-undo.
define new shared variable que-doc          as logical.
define new shared variable qty              as decimal.
define new shared variable qty_all        like sod_qty_all.
define new shared variable qty_pick       like sod_qty_pick.
define new shared variable qty_bo         like sod_bo_chg.
define new shared variable qty_chg        like sod_qty_chg.
define new shared variable qty_cum_ship   like sod_qty_ship.
define new shared variable qty_inv        like sod_qty_inv.
define new shared variable qty_iss_rcv    like tr_qty_loc.
define new shared variable qty_left       like tr_qty_chg.
define new shared variable qty_open       like sod_qty_ord.
define new shared variable qty_ord        like sod_qty_ord.
define new shared variable qty_req        like in_qty_req.
define new shared variable qty_ship       like sod_qty_ship.
define new shared variable ref            like glt_ref.
define new shared variable rejected       like mfc_logical no-undo.
define new shared variable rmks           like tr_rmks.
define new shared variable sct_recid        as recid.
define new shared variable sct_recno        as recid.
define new shared variable ship_db        like global_db.
define new shared variable ship_dt        like so_ship_date.
define new shared variable ship_line      like sod_line.
define new shared variable ship_site        as character.
define new shared variable ship_so        like so_nbr.
define new shared variable should_be_posted like glt_amt.
define new shared variable so_db          like global_db.
define new shared variable so_job         like tr_so_job.
define new shared variable so_hist        like soc_so_hist.
define new shared variable so_mstr_recid    as recid.
define new shared variable so_recno         as recid.
define new shared variable sod_entity     like en_entity.
define new shared variable sod_recno        as recid.
define new shared variable std_cost       like sod_std_cost.
define new shared variable tax_recno        as recid.
define new shared variable tot_curr_amt   like glt_amt.
define new shared variable tot_ext_cost   like sod_price.
define new shared variable tot_line_disc    as decimal decimals 2.
define new shared variable tr_recno         as recid.
define new shared variable transtype        as character format "x(7)".
define new shared variable trgl_recno       as recid.
define new shared variable trlot          like tr_lot.
define new shared variable trqty          like tr_qty_chg.
define new shared variable unit_cost      like tr_price label "Unit Cost".
define new shared variable undo_all       like mfc_logical no-undo.
define new shared variable wip_entity     like si_entity.
define new shared workfile work_sr_wkfl   like sr_wkfl.
define new shared variable yn             like mfc_logical.
define new shared variable critical-part  like wod_part    no-undo.
define new shared variable prog_name        as character
   initial "rcsois.p" no-undo.
define new shared variable auto_inv       like mfc_logical
                                          label "Print Invoice".
define new shared variable l_undo         like mfc_logical no-undo.
define new shared variable document         as character format "x(24)".
define new shared variable comp_addr        like soc_company. 

/* SHARED VARIABLES, BUFFERS AND FRAMES */
define shared variable confirm_mode like mfc_logical       no-undo.
define shared variable global_recid as recid.
 
/* LOCAL VARIABLES, BUFFERS AND FRAMES */
define variable abs_trans_mode    as   character     no-undo.
define variable abs_veh_ref       as   character     no-undo.
define variable disp_abs_id       like abs_mstr.abs_id no-undo.
define variable first_so_bill     like so_bill       no-undo.
define variable first_so_cust     like so_cust       no-undo.
define variable first_so_curr     like so_curr       no-undo.
define variable first_so_cr_terms like so_cr_terms   no-undo.
define variable first_so_slspsn   like so_slspsn     no-undo.
define variable first_so_trl1_cd  like so_trl1_cd    no-undo.
define variable first_so_trl2_cd  like so_trl2_cd    no-undo.
define variable first_so_trl3_cd  like so_trl3_cd    no-undo.
define variable first_so_entity   like si_entity     no-undo.
define variable msg_text          as   character     no-undo.
define variable shipqty           as   decimal       no-undo.
define variable txcalcref         as   character     no-undo.
define variable conf_type         as   logical
   format "Pre-Shipper/Shipper"        initial true  no-undo.
define variable l_first_so_nbr    like so_nbr        no-undo.
define variable l_consolidate_ok  as   logical       no-undo.
define variable oldcurr           like so_curr       no-undo.
define variable id_length         as   integer       no-undo.
define variable shipgrp           like sg_grp        no-undo.
define variable shipnbr           like abs_mstr.abs_id no-undo.
define variable nrseq             like shc_ship_nr_id  no-undo.
define variable errorst           as   logical       no-undo.
define variable errornum          as   integer       no-undo.
define variable is_valid          as   logical       no-undo.
define variable is_internal       as   logical       no-undo.
define variable l_invpost         as   logical       no-undo.
define new shared temp-table IntraStat field StatID as recid.
define new shared variable report_framework like mfc_logical initial no no-undo.
 
define buffer abs_temp for abs_mstr.
define buffer b_lacd_det for lacd_det.
define buffer lgdfcb_add for lgdfcb_det.
 
define variable l_disc_pct1       as   decimal       no-undo.
define variable l_net_price       as   decimal       no-undo.
define variable l_list_price      as   decimal       no-undo.
define variable l_rec_no          as   recid         no-undo.
define variable change-queued     as   logical       no-undo.
define variable l_flag            like mfc_logical   no-undo.
define variable undo_stat         like mfc_logical   no-undo.
define variable l_tr_type         like tx2d_tr_type  initial "13" no-undo.
define variable l_nbr             like tx2d_nbr      initial ""   no-undo.
define variable l_line            like tx2d_line     initial 0    no-undo.
define variable l_calc_freight    like mfc_logical   initial yes
                                  label "Calculate Freight" no-undo.
define variable errorNbr          as   integer       no-undo.
define variable vSOToHold         like so_nbr        no-undo.
define variable creditCardOrder   as   logical       no-undo.
define variable l_undoflg         like mfc_logical   no-undo.
define variable l_flag1           like mfc_logical   no-undo.
define variable use-log-acctg     as   logical       no-undo.
define variable first_so_site     like so_site       no-undo.
define variable first_so_ex_rate  like so_ex_rate    no-undo.
define variable first_so_ex_rate2 like so_ex_rate2   no-undo.
define variable first_so_exru_seq like so_exru_seq   no-undo.
define variable lv_error_num      as integer         no-undo.
define variable lv_name           as character       no-undo.
define variable item_key          as character       no-undo.
define variable l_wo_reject       like mfc_logical   no-undo.
define variable is_active like mfc_logical initial no   no-undo.
define variable is_lock   like mfc_logical initial no   no-undo.
define variable cErrorArgs        as character          no-undo.
define variable l_is_mutiple_so like mfc_logical initial no   no-undo.
define variable oidShphHist  as decimal no-undo.
define variable isConfirmedShipperReturned like mfc_logical no-undo.
 
define variable tot_freight_gl_amt    like sod_fr_chg. /* NOT NO-UNDO */
define variable l_auto_noupdate   like mfc_logical   no-undo initial no.
define variable isStructureChanged   like mfc_logical   no-undo initial no.
define variable isReturnUnconfirmed  like mfc_logical   no-undo initial no.
define variable reason_code        like lgd_mstr.lgd_cancel_rsn no-undo.
 
define new shared temp-table work_ldd no-undo
   field work_ldd_id like abs_id
   index work_ldd_id work_ldd_id.
 
define variable l_consigned_line_item like mfc_logical      no-undo.
 
/* CUSTOMIZED SECTION FOR VERTEX BEGIN */
define variable l_cont          like mfc_logical initial no no-undo.
define variable l_api_handle      as handle                 no-undo.
define variable l_vq_reg_db_open  as logical     initial no no-undo.
/* CUSTOMIZED SECTION FOR VERTEX END */
 
define temp-table tt_consign_rec no-undo
   field tt_consign_order   like so_nbr
   field tt_consign_line    like sod_line
   field tt_consign_qty_chg like sod_qty_chg
   index tt_consign_rec_idx tt_consign_order tt_consign_line.
 
define variable msgnbr         as integer no-undo.
define variable dummy-length   as character format "999:99" no-undo.
define variable shp_time       as character format "xx:xx"  no-undo.
define variable arr_date       like abs_arr_date            no-undo.
define variable arr_time       as character format "xx:xx"  no-undo.
define variable l_so_to_inv    like so_to_inv               no-undo.
 
define variable return_status   as   integer                 no-undo.
define variable lErrCondition   as logical no-undo.
define variable lWarnCondition  as logical no-undo.
define variable cShipStep       as character no-undo.
define variable cValFld         as character extent 14 no-undo.
define variable cValValue       as character extent 14 no-undo.
define variable lDispPrintFrame as logical no-undo.
define variable cShipFrom       as character no-undo.
define variable cShipTo         as character no-undo.
define variable dShipDate       as date no-undo.
define variable cAbsID          as character no-undo.
define variable LVTaskFound     as logical no-undo.
define variable l_complete      as logical no-undo.
 
define variable hBlockedTransactionLibrary as handle  no-undo.
define variable lBlockedTransactionError   as logical no-undo.
define variable lRestricted                as logical no-undo.
define variable cDaybookSet                like so_daybookset no-undo.
define variable hDaybooksetValidation      as handle  no-undo.
define variable iErrorNumber               as integer no-undo.
 
define variable brazil_ld           as logical initial false no-undo.
define variable l_allowed           as logical no-undo.
define variable l_disable_con       as logical initial no no-undo.
define variable using_consign       as logical no-undo.
define variable mapping_simul       as logical no-undo.
define variable shipping_tax        as character no-undo.
define variable dExcessQty          as decimal no-undo.
define variable l_continue          as logical no-undo.
define variable appMode             as character no-undo.
define variable i_err_num           as integer no-undo.
define variable DomainInfo          as DomainForOperationalInfo   no-undo.
define variable ExchangeRateType    as ExchangeRateTypeByTypeCode no-undo.
define variable StatCurrency        as SelectCurrency             no-undo.
define variable soLineDeleted       as logical no-undo initial no.
define variable overissued as logical no-undo initial no.
define variable isNotUnconfirmed as logical no-undo initial yes.

define variable finTransCommitted     as logical no-undo.
define variable finAPIError           as integer no-undo.
define variable hQADFinInvPostLib as handle no-undo.

define variable temp_so_ship        like so_ship           no-undo.
define variable temp_so_qadc01      like so__qadc01        no-undo.
define variable temp_fob            like so_fob extent 30.
define variable temp_shipvia        like so_shipvia extent 30.
define variable temp_fob_list       as character           no-undo.
define variable temp_shipvia_list   as character           no-undo.
define variable l_traddr            like tr_addr           no-undo.
define variable l_qty_iss_rcv       like tr_qty_loc        no-undo.

FUNCTION isSimulMismatched returns logical(
   input p_shipfrom as character,
   input p_shipto   as character) forward.
   
FUNCTION isSimulCustomized returns logical(
   input p_shipfrom  as character,
   input p_shipto    as character,
   input p_tax_usage as character,
   input p_order     as character) forward.
 
/* DAYBOOKSET VALIDATION LIBRARY PROTOTYPES */
{us/dy/dybvalpl.i hDaybooksetValidation}
 
/* Blocked Transaction common library prototypes */
{us/mg/mgbltrpl.i "hBlockedTransactionLibrary"}
 
/* Update restriction include file */
{us/up/updaterestriction.i}
 
define variable v_abs_shipfrom like abs_shipfrom no-undo.
define variable v_conf_type    like conf_type no-undo.
define variable v_abs_id       like abs_id no-undo.
define variable v_shiptime     as character format "xx:xx"  no-undo.
define variable v_arrtime      as character format "xx:xx"  no-undo.
define variable l_prtInstBase  like mfc_logical 
                               label "Print ISB Details" no-undo.
define variable l_prtExtRep  like mfc_logical no-undo.
define variable l_ordertotal        as decimal no-undo.
define variable l_before_ordertotal as decimal no-undo.

define variable l_new_trl like tx2d_tax_amt no-undo.
define variable l_Add_Trl_Bal like tx2d_tax_amt no-undo.
define variable iReturnStatus  as integer no-undo.
define variable l_error        as logical no-undo.

/* CREDIT MANAGEMENT */
define variable hCreditLibrary    as handle        no-undo.
{us/mf/mfcredpl.i "hCreditLibrary"}
run initialiseCreditManagementLibrary ( input  hCreditLibrary,
                                        output hCreditLibrary).
 
define variable shipperModified  like mfc_logical initial no no-undo.
define variable parentAbsOid     like abs_mstr.oid_abs_mstr  no-undo.
define variable fromStage        like ser_stage              no-undo.
define variable hasSerialItem    as logical no-undo.
define variable l_disperr        as logical no-undo.
define variable negative         as logical no-undo.

{us/mf/mfaimfg.i} /* COMMON API CONSTANTS AND VARIABLES */
{us/so/sosoit01.i} /* DEFINE API SALES ORDER TEMP TABLES */
{us/mf/mfsprtdf.i new}
{us/so/soivtot1.i new}  /* Define variables for invoice totals. */
{us/rc/rcsois.i new}

if c-application-mode = "API" then do:
    /* GET HANDLE OF API CONTROLLER */
   {us/bbi/gprun.i ""gpaigh.p""
            "(output ApiMethodHandle,
              output ApiProgramName,
              output ApiMethodName,
              output ApiContextString)"}
 
   /* GET SALES ORDER SHIPPER TRANSACTION TEMP-TABLE */
   run getSalesOrderShipperTransRecord in ApiMethodHandle
      (buffer ttSalesOrderShipperTrans).
end. /* if c-application-mode = "API" */
 

define new shared temp-table ttSoTrls no-undo
field tt_so_nbr        like so_nbr 
field tt_so_bill       like so_bill
field tt_so_taxable    like so_taxable
field tt_so_trl1_amt_o like so_trl1_amt
field tt_so_trl2_amt_o like so_trl1_amt
field tt_so_trl3_amt_o like so_trl1_amt
field tt_so_trl1_amt_n like so_trl1_amt
field tt_so_trl2_amt_n like so_trl1_amt
field tt_so_trl3_amt_n like so_trl1_amt
field tt_trl_tax       like tx2d_tax_amt.

define temp-table tt_sod_det no-undo
   field tt_sod_nbr  like sod_nbr
   field tt_sod_line like sod_line
   field tt_pr_found as logical
   index i_sodnbr tt_sod_nbr.
 
define temp-table tt_so_mstr no-undo
   field tt_so_nbr       like so_nbr
   field tt_so_to_inv    like so_to_inv
   field tt_so_ship_date like so_ship_date
   field tt_so_tax_date  like so_tax_date
   field tt_so_bol       like so_bol
   field tt_so__qadc01   like so__qadc01
   index i_sonbr tt_so_nbr.
 
define temp-table tt_somstr no-undo
   field tt_sonbr   like so_nbr
   field tt_sotoinv like mfc_logical initial no
   index sonbr is primary unique
   tt_sonbr.
define temp-table tt_so_notaxdt no-undo
    field tt_sonum   like so_nbr
    index sonbr is primary unique
    tt_sonum.

define temp-table temp_somstr
   field temp_so_nbr like so_nbr
   field temp_so_inv_nbr like so_inv_nbr
   field temp_so_inv_date like so_inv_date
index temp_so_nbr temp_so_nbr ascending.
 
define stream abs.
  
{us/gp/gpscdef.i}

/* EURO TOOL KIT DEFINITIONS */
{us/et/etvar.i &new="new"}
{us/et/etdcrvar.i "new"}
{us/et/etrpvar.i &new="new"}
{us/et/etsotrla.i "new"}
 
{us/fs/fsdeclr.i new}
 
{us/gp/gpglefdf.i}
{us/tx/txcalvar.i}
{us/rc/rcwabsdf.i new}
{us/bbi/gpfilev.i}   /* VARIABLE DEFINITIONS FOR gpfile.i */
 
/* CONSIGNMENT VARIABLES */
{us/so/socnvars.i}
{us/px/pxsevcon.i}
 
/* FREIGHT ACCRUAL TEMP TABLE DEFINITION */
{us/la/lafrttmp.i "new"}
 
{us/gp/gprunpdf.i "gpccpl" "p"}
 
{us/px/pxphdef.i pasopixr}
{us/px/pxphdef.i pafunc}
{us/px/pxphdef.i pasexr}
{us/px/pxphdef.i pasldel}
{us/rc/rcsois1.i new}

form
   abs_mstr.abs_shipfrom colon 35 label "Ship-From"
   si_desc               at 47    no-label
   conf_type             colon 35 label "Pre-Shipper/Shipper"
   abs_mstr.abs_id       colon 35 label "Number"
   skip(1)
   abs_mstr.abs_shipto   colon 35 label "Ship-To/Dock"
   ad_name               at 47    no-label format "x(31)"
   ad_line1              at 47    no-label format "x(31)"
   ship_dt               colon 35
   eff_date              colon 35
   skip(1)
   document              colon 35 label "Document"
with frame a side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame a:handle).
 
form
   abs_veh_ref colon 35 label "Vehicle ID"    format "x(20)"
   shp_time    colon 35 label "Shipping Time"
   arr_date    colon 35 label "Arrive Date"
   arr_time    colon 35 label "Arrival Time"
with frame ab side-labels width 80.
 
setFrameLabels(frame ab:handle).
/* "Print Invoice " WILL NOW APPEAR IN THE FRAME BELOW AND WILL NO  */
/* LONGER APPEAR AFTER THE PROMPT "Is all the information correct"  */
form
   auto_post             colon 35
   l_prtInstBase         colon 70
   auto_inv              colon 35
   cDaybookSet           colon 35
   consolidate           colon 35
   l_calc_freight        colon 35
with frame b side-labels width 80.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame b:handle).
 
form
   space(1)
   shipnbr label "Shipper Number"
with frame convfrm centered side-labels
   title color normal (getFrameTitle("CONVERT_PRE-SHIPPER_TO_SHIPPER",42))
   overlay width 45.
 
/* SET EXTERNAL LABELS */
setFrameLabels(frame convfrm:handle).

subscribe to "p_giveErrorForTaxLD" anywhere.
 
/* INITIALIZE PERSISTENT PROCEDURES */
run mfairunh.p
   (input "dybvalpl.p",
    input ?,
    output hDaybooksetValidation).
 
run getControlFiles
   (buffer gl_ctrl,
   buffer shc_ctrl,
   input enable_customer_consignment,
   input adg,
   input cust_consign_ctrl_table,
   output use-log-acctg,
   output using_cust_consignment,
   output auto_post,
   output auto_inv,
   output consolidate).
 
{us/px/pxrun.i &PROC = 'setProgName'
   &PROGRAM='pasldel.p'
   &HANDLE = ph_pasldel
   &PARAM = "(input prog_name)"
   &NOAPPERROR = true
   &CATCHERROR = true}

{us/cc/cclc.i} /*CHECK FOR ENABLEMENT OF CONTAINER AND LINE CHARGES*/
 
for first abs_mstr where recid(abs_mstr) = global_recid
no-lock: end.
 
if available abs_mstr
   and abs_type = "S"
   and (abs_id begins "P"
   or  abs_id begins "S")
then do:
 
   for first si_mstr where si_mstr.si_domain = global_domain
      and si_site = abs_shipfrom
   no-lock: end.
 
   conf_type = abs_id begins "p".
 
   if available si_mstr 
   then
      if c-application-mode <> "API" then
      display
         abs_shipfrom
         si_desc
         conf_type
         substring(abs_id,2,50) @ abs_id
      with frame a.
 
end.
 
assign
   ship_dt  = today
   eff_date = if confirm_mode
                 or not available abs_mstr
              then
                 today
              else
                 abs_eff_date
   oldcurr  = "".
 
if c-application-mode <> "API" then
display
   ship_dt
   eff_date
   conf_type
with frame a.
 
{us/gp/gpscproxy.i}

mainloop:
repeat:
 
   document = "".

   if shipperModified then do:
      {us/px/pxrun.i &PROC = 'removePackingQtyFromAbsMstr'
                     &PROGRAM='pasopixr.p'
                     &HANDLE = ph_pasopixr
                     &PARAM = "(input parentAbsOid,
                                input confirm_mode,
                                input fromStage)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}

      soLineDelet:
      do transaction:

         {us/px/pxrun.i &PROC = 'deleteCompletedSalesOrderLine'
            &PROGRAM='pasldel.p'
            &HANDLE = ph_pasldel
            &NOAPPERROR = true
            &CATCHERROR = true}

         if return-value <> {&SUCCESS-RESULT} then do:
            undo soLineDelet, leave soLineDelet.
         end.

      end.

      assign
         shipperModified = no
         parentAbsOid    = 0.
         isNotUnconfirmed = no.
   end.
   if isNotUnconfirmed and isReturnUnconfirmed then do:
      {us/px/pxrun.i &PROC = 'clearOrdInfoForSoReturnUnconfirm'
                     &PROGRAM='pasopixr.p'
                     &HANDLE = ph_pasopixr
                     &PARAM = "(input parentAbsOid)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}
   end.
    
   if c-application-mode = "API" and retry then
      return error return-value.
 
   /* INITIALIZE work_ldd */
   run p_InitializeTempTableWorkLdd.
   empty temp-table tt_so_notaxdt.
   empty temp-table ttSoTrls.
 
   /* Inserting a block so that orders can be placed on hold      */
   /* if the credit card validations fail even if the user enters */
   /* F4 or answers no to "Is all information correct?".          */
   CK-CC-HOLD:
   do on error undo CK-CC-HOLD, leave CK-CC-HOLD:
 
      if c-application-mode = "API" and retry then
         return error return-value.
 
      assign
         vSOToHold  = ""
         oldcurr    = ""
         brazil_ld  = no
         l_complete = no.
 
      run del-qad-wkfl.
 
      {us/gp/gprunp.i "soldxr" "p" "clearWorkTableOfLGAndGL"}
 
      if c-application-mode <> "API" then
      do with frame a:
 
         prompt-for
            abs_shipfrom
            conf_type
            abs_id
         editing:
 
            global_site = input abs_shipfrom.
 
            if frame-field = "abs_shipfrom"
            then do:
               /* ADDED () AROUND THE or STATEMENT */
               {us/mf/mfnp05.i abs_mstr abs_id
                  " abs_mstr.abs_domain = global_domain
                    and (abs_id  begins 's'
                    or   abs_id  begins 'p')"
                  abs_shipfrom
                  "input abs_shipfrom"}
 
               if recno <> ?
               then do:
 
                  for first si_mstr where si_mstr.si_domain = global_domain
                     and si_site = abs_shipfrom
                  no-lock: end.
 
                  assign
                     global_site = abs_shipfrom
                     global_lot  = abs_id
                     conf_type   = abs_id begins "p"
                     disp_abs_id = substring(abs_id,2,50).
 
                  display
                     abs_shipfrom
                     si_desc  when (available si_mstr)
                     ""       when (not available si_mstr) @ si_desc
                     conf_type
                     disp_abs_id @ abs_id.
 
               end. /* if recno <> ? */
 
            end. /* if frame-field "abs_shipfrom" */
 
            else if frame-field = "abs_id"
            then do:
 
               /* HANDLE SHIPPERS */
               if not input conf_type
               then do:
 
                  {us/mf/mfnp05.i abs_mstr abs_id
                     "abs_mstr.abs_domain = global_domain
                       and abs_shipfrom  = input abs_shipfrom
                       and abs_id begins ""s""
                       and abs_type    = ""s"""
                     abs_id " ""s"" + input abs_id"}
               end. /* if not input conf_type */
 
               else do:
                  {us/mf/mfnp05.i abs_mstr abs_id
                     "abs_mstr.abs_domain = global_domain
                       and abs_shipfrom  = input abs_shipfrom
                       and abs_id begins
                       ""p"" " abs_id " ""p"" + input abs_id"}
 
               end. /* else */
 
               if recno <> ?
               then do:
 
                  for first si_mstr where si_mstr.si_domain = global_domain
                     and si_site = abs_shipfrom
                  no-lock: end.
 
                  assign
                     global_site = abs_shipfrom
                     global_lot  = abs_id
                     conf_type   = abs_id begins "p"
                     disp_abs_id = substring(abs_id,2,50).
 
                  display
                     abs_shipfrom
                     si_desc  when (available si_mstr)
                     ""       when (not available si_mstr) @ si_desc
                     conf_type
                     disp_abs_id @ abs_id.
 
               end. /* if recno <> ? */
 
            end. /* if frame-field = "abs_id" */
 
            else do:
               status input.
               readkey.
               apply lastkey.
            end.
 
         end. /* prompt-for */
 
      end. /* do with frame a */
 
      if c-application-mode <> "API" then
        assign
            v_abs_shipfrom = input abs_shipfrom
            v_conf_type = input conf_type
            v_abs_id = input abs_id.
      else do:
         assign
            {us/mf/mfaiset.i v_abs_shipfrom ttSalesOrderShipperTrans.shipFrom}
            {us/mf/mfaiset.i v_conf_type ttSalesOrderShipperTrans.confType}
            {us/mf/mfaiset.i v_abs_id ttSalesOrderShipperTrans.id}.
      end.
 
      assign
         so_db = global_db.
 
      for first si_mstr where si_domain = global_domain
          and si_site = v_abs_shipfrom
      no-lock: end.
 
      if not available si_mstr
      then do:
         /* Site does not exist */
         run DisplayMessage (input 708, input 3, input '').
         next-prompt abs_shipfrom with frame a.
         undo, retry.
      end.
 
      if c-application-mode <> "API" then
      display
         si_desc
      with frame a.
 
      if global_db <> si_db then do:
 
         {us/gp/gprunp.i "mgdompl" "p" "ppDomainConnect"
            "(input  si_db,
              output lv_error_num,
              output lv_name)"}
 
         /* Making sure domain is connected */
         if lv_error_num <> 0
         then do:
            /* Domain # is not available */
            run DisplayMessage (input lv_error_num, input 3, input lv_name).
            next-prompt abs_shipfrom with frame a.
            undo, retry.
         end.
 
      end. /* if global_db <> si_db then do: */
 
      assign
         ship_db   = si_db
         change_db = ship_db <> global_db.
 
      for first abs_mstr where abs_domain = global_domain
           and abs_shipfrom = v_abs_shipfrom
           and abs_id       = (if v_conf_type
                               then
                                  "P"
                               else
                                  "S")
                            + v_abs_id
           and abs_type     = "S"
      no-lock: end.
 
      if not available abs_mstr
      then do:
         /* Picklist/Shipper does not exist */
         run DisplayMessage (input 8145, input 3, input '').
         next-prompt abs_id with frame a.
         undo, retry.
      end.
      else do:

         {us/px/pxrun.i &PROC = 'checkPickedSoLineLostByShipper'
                        &PROGRAM='pasopixr.p'
                        &HANDLE = ph_pasopixr
                        &PARAM = "(input abs_id,
                                   input abs_shipfrom,
                                   output soLineDeleted)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

      end.

      if soLineDeleted then do:

         run DisplayMessage (input 764, input 3, input '').
         next-prompt abs_id with frame a.
         undo, retry.

      end.
 
      /* Set Blocked Transaction Library running persistently */
      run mfairunh.p
         (input "mgbltrpl.p",
          input ?,
          output hBlockedTransactionLibrary).
 
      /* If running from Shipper confirm check for blocked customer transactions */
      if execname = /*grc338 "rcsois.p" */ "xfrcsois.p"
      then do:
 
         /* Check to see if the shipper has any blocked transactions */
         /* for its customers                                        */
         run checkShipperForBlockedTransactions in hBlockedTransactionLibrary
            (input abs_mstr.oid_abs_mstr,
             input abs_shipto,
             input {&SO007},
             input if c-application-mode <> "API" then true
                   else false, /* display message */
             output lBlockedTransactionError).
 
         /* If one of the customers is blocked then raise an error */
         if lBlockedTransactionError
         then do:
            undo, retry.
         end.
 
      end. /* running from shipper confirm */
 
      /* Set the Update Restriction Library to run persistently */
      run mfairunh.p
         (input "mgurpl.p",
          input ?,
          output hUpdateRestrictedLibrary).
 
      /* Check to see if the shipper has any restricted sales orders */
      run checkShipperForRestrictions in hUpdateRestrictedLibrary
         (input  abs_mstr.oid_abs_mstr,
          input  {&SOSHP},
          input  if c-application-mode <> "API" then true
                 else false,
          input  hBlockedTransactionLibrary,
          output lRestricted).
 
      /* If any of the sales orders are restricted then undo */
      if lRestricted
      then do:
         undo, retry.
      end.
 
      delete PROCEDURE hUpdateRestrictedLibrary.
 
      /* Tidy up the persistent procedure now that we are finished */
      delete PROCEDURE hBlockedTransactionLibrary.
 
      /* Check Site Security */
      {us/bbi/gprun.i ""gpsiver.p""
         "(input v_abs_shipfrom, input ?, output return_int)"}
 
      if return_int = 0
      then do:
         /* User does not have access to site */
         run DisplayMessage (input 725, input 3, input '').
         undo, retry.
      end.
 
      /* Check Inventory Movement Code Security */
      {us/bbi/gprun.i ""gpsimver.p""
         "(input abs_shipfrom,
           input abs_inv_mov,
           output l_flag)"}.
 
      if not l_flag
      then do:
         /* USER DOES NOT HAVE ACCESS TO THIS SITE/INVENTORY MOVEMENT CODE */
         run DisplayMessage (input 5990, input 4, input '').
         undo, retry.
      end.

      l_error = no.
      run p-chk-qadwkfl (input input frame a abs_shipfrom,
                         input string(input frame a conf_type,"p/s"),
                         input input frame a abs_id).

      if l_error = yes
      then
         undo, retry.
 
      if abs_canceled
      then do:
         /* SHIPPER CANCELED */
         run DisplayMessage (input 5885, input 3, input '').
         undo, retry.
      end.
 
      /* DETERMINE THE FIELDS TO BE VALIDATED FOR SHIPPER VALIDATION */
      /* DO NOT RUN VALIDATIONS IF UNCONFIRMING A SHIPPER.           */
      /* DO NOT RUN VALIDATIONS IF THIS IS AIM SHIPPER.              */
      if confirm_mode and
         execname <> "whrfshtr.p"
      then do:
 
         cShipStep = {&TYPE_Confirm}.
 
         empty temp-table tt_validation_fields.
         run getFieldsToValidate
            (input abs_shipfrom,
             input abs_shipto,
             input cShipStep,
             input abs_shp_date,
             output table tt_validation_fields).
 
         /* CREATE USER FIELDS */
         {us/bbi/gprun.i ""sosob1b.p""
                  "(input abs_id,
                    input abs_shipfrom,
                    input 1, /* SHIPPER LEVEL */
                    input table tt_validation_fields)"}
 
         hide frame a no-pause.
         hide frame ab no-pause.
 
         if c-application-mode <> "API"
         then do:
            {us/bbi/gprun.i ""rcswbuf.p""
                     "(input abs_id,
                       input abs_shipfrom,
                       input cShipStep,
                       input 6, /* FRAME SIZE */
                       input table tt_validation_fields)"}
         end.
      end.
 
      if (substring(abs_status,2,1) = "y") = confirm_mode
      then do:
         if confirm_mode then
            /* Shipper previously confirmed */
            run DisplayMessage (input 8146, input 3, input '').
         else
            /* Shipper previously not confirmed */
            run DisplayMessage (input 8140, input 3, input '').
         undo, retry.
      end.
 
      if abs_inv_mov <> ""
         and not can-find(first im_mstr
         where im_mstr.im_domain = global_domain
         and   im_inv_mov = abs_inv_mov
         and   (im_tr_type = "ISS-SO"  or
                im_tr_type = "ISS-COR"))
      then do:
         /* Not a Sales Order Shipper */
         run DisplayMessage (input 5802, input 3, input '').
         undo, retry.
      end.  /* if abs_inv_mov */

      if confirm_mode then do:
         /* Check LD Integrity */
         if abs_id begins "S" then do:
            {us/gp/gprunp.i "soldxr" "p" "checkIssuedLDIntegrity"
                      "(input  oid_abs_mstr,
                        output l_allowed)"}
            if l_allowed = no then
               undo, retry.
         end.
      end.
 
      /* If it's a item in shipper, the abs_id with this format:
         IsSH1712000so18822-B . Item_key will append the value of
         shipper id , ship_from, then use the item_key to matches the related
         SO Number*/
      item_key = "I" + abs_mstr.abs_id + abs_shipfrom.
 
      if not confirm_mode
      then do:
         run isReturnedShipperUnconfirmAllowed(
               input abs_mstr.oid_abs_mstr,
               output isStructureChanged,
               output isReturnUnconfirmed).

         if isStructureChanged and isReturnUnconfirmed then do:
            /* Pack Structure changed, cannot unconfirm */
            run DisplayMessage (input 13414, input 3, input '').
            undo CK-CC-HOLD, leave CK-CC-HOLD.
         end.
         if not isReturnUnconfirmed then do:
            {us/px/pxrun.i &PROC = 'isConfirmedShipperReturned'
                           &PROGRAM='pasopixr.p'
                           &HANDLE = ph_pasopixr
                           &PARAM = "(input abs_mstr.oid_abs_mstr,
                                      output isConfirmedShipperReturned)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
   
            if isConfirmedShipperReturned then do:
               /* Shipper can't be unconfirmed. Item/Pack returned */
               run DisplayMessage (input 13413, input 3, input '').
               undo CK-CC-HOLD, leave CK-CC-HOLD.
            end.
         end.

         if c-application-mode <> "API" then do:
            yn = no.
 
            /* Continue with Unconfirm ? */
            run DisplayMessage1 (input 5987, input 1, input-output yn).
 
            if not yn then
               undo CK-CC-HOLD, leave CK-CC-HOLD.
         end.
 
         if can-find (first lgd_mstr where lgd_domain = global_domain
               and lgd_shipper_id = abs_mstr.abs_id
               and lgd_type = yes)
         then
         for first lgdc_ctrl
            where lgdc_ctrl.lgdc_domain = global_domain
            and   lgdc_ctrl.lgdc_type   = "ISS"
         no-lock:
            if today - abs_eff_date > lgdc_days_cancel_lgd or
               lgdc_days_cancel_lgd <= 0
            then do:
               /* DOESN'T REACH LEGAL DOC CANCELLATION DAYS */
               {us/bbi/pxmsg.i &MSGNUM=8050 &ERRORLEVEL=3}
               undo CK-CC-HOLD, leave CK-CC-HOLD.
            end.
         end.
 
         assign
            eff_date = abs_eff_date
            ship_dt  = abs_shp_date.
 
         if c-application-mode <> "API" then
         display
            eff_date
            ship_dt
         with frame a.
 
      end.
 
      /* CHECK AND ASSIGN CORRECT SHIP-TO TO ABS_SHIPTO IF */
      /* IT CONTAINS A SESSION ID THAT IS ASSIGNED DUE TO  */
      /* ABNORMAL TERMINATION                              */
 
      if abs_shipto <> abs__qad05
         and abs__qad05 <> ""
      then
         run chk_shipto_prefix(input abs_shipfrom,
                               input abs_id).
 
 
      /* Get length of shipper # */
      if abs_id begins "P"
      then do:
 
         {us/bbi/gprun.i ""gpgetgrp.p""
            "(input  abs_shipfrom,
              input  abs_shipto,
              output shipgrp)"}
 
         nrseq = shc_ship_nr_id.
 
         if shipgrp <> ?
         then
            for first sgid_det where sgid_det.sgid_domain = global_domain
                 and sgid_grp = shipgrp
                 and sgid_inv_mov = abs_inv_mov
            no-lock:
               nrseq = sgid_ship_nr_id.
            end.
 
         run get_nr_length
            (input nrseq,
             output id_length,
             output errorst,
             output errornum).
 
         if errorst
         then do:
            run DisplayMessage (input errornum, input 3, input '').
            undo, retry.
         end.
 
      end. /* if abs_id begins "p" */
 
      else
         id_length = length(substring(abs_id,2)).
 
      if confirm_mode
         and substring(abs_status,1,1) <> "y"
      then
         /* Shipper not printed */
         run DisplayMessage (input 8147, input 2, input '').
 
      /* ASSIGN global_recid FOR USE IN THE TAX CALCULATION ROUTINE */
      assign
         abs_recid    = recid(abs_mstr)
         global_recid = abs_recid.
 
      for each work_abs_mstr
      exclusive-lock:
         delete work_abs_mstr.
      end.
 
      empty temp-table tt_so_mstr.
 
      assign
         shipperModified = yes
         parentAbsOid    = abs_mstr.oid_abs_mstr.

      /* IF THERE IS SERIAL CONTROLLED ITEM IN PENDING PICK, SHIPMENT
         IS NOT ALLOWED */
      if not can-find(first serd_det
         where serd_table_name = "abs_mstr"
           and oid_table_record = oid_abs_mstr) then do:
         hasSerialItem = no.

         {us/px/pxrun.i &PROC = 'hasSerialControlledItem'
                        &PROGRAM='pasopixr.p'
                        &HANDLE = ph_pasopixr
                        &PARAM = "(input oid_abs_mstr,
                                   input-output hasSerialItem)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

         if hasSerialItem then do:
            /* ERROR: SERIAL CONTROLLED ITEM IN SHIPPER NOT PICKED */
            {us/bbi/pxmsg.i &MSGNUM=13659 &ERRORLEVEL=3}
            undo, retry.
         end.
      end.

      if confirm_mode then do:
         {us/px/pxrun.i &PROC = 'removePendingPickQtyFromShipper'
                        &PROGRAM='pasopixr.p'
                        &HANDLE = ph_pasopixr
                        &PARAM = "(input abs_mstr.oid_abs_mstr)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
      end.

      {us/px/pxrun.i &PROC = 'validateNonserializedOverissue'
                     &PROGRAM='pasopixr.p'
                     &HANDLE = ph_pasopixr
                     &PARAM = "(input abs_mstr.oid_abs_mstr,
                                input confirm_mode,
                                output overissued)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}

      if overissued then do:
         /* Not enough qty in inventory */
         run DisplayMessage (input 11362, input 3, input '').
         undo, retry.
      end.

      run getFromStage(input parentAbsOid, output fromStage).

      if (fromStage = {&SER-STAGE-CONSUMED} and confirm_mode) or not confirm_mode then do:
         run validateSerialIdAgainstShipper(
            input abs_mstr.oid_abs_mstr,
            output negative).
         if negative then do:
            run DisplayMessage (input 6372, input 3, input '').
            next-prompt abs_id with frame a.
            undo, retry.
         end.
      end.

      if isReturnUnconfirmed then do:
         {us/px/pxrun.i &PROC = 'populateOrdInfoFromShipHist'
                        &PROGRAM='pasopixr.p'
                        &HANDLE = ph_pasopixr
                        &PARAM = "(input abs_mstr.oid_abs_mstr)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
      end.
      {us/px/pxrun.i &PROC = 'addPackingQtyToAbsMstr'
                     &PROGRAM='pasopixr.p'
                     &HANDLE = ph_pasopixr
                     &PARAM = "(input parentAbsOid,
                                input confirm_mode,
                                output fromStage)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}

      /* EXPLODE SHIPPER TO GET ORDER DETAIL */
      {us/bbi/gprun.i ""rcsoisa.p"" "(input recid(abs_mstr))"}

      if not can-find(first work_abs_mstr
                         where work_abs_mstr.abs_order <> "")
      then do:
         /* SALES ORDER DOES NOT EXIST  */
         run DisplayMessage (input 609, 
                             input 3, 
                             input '').
         undo CK-CC-HOLD, leave CK-CC-HOLD.
      end. /* IF NOT CAN-FIND(FIRST work_abs_mstr */
      /* ADDED THE BLOCK TO CHECK WHETHER THE SALES ORDER IS */
      /* ATTACHED TO THE SHIPPER LINE ITEM. IF THE SO IS NOT */
      /* ATTACHED, THE SHIPPER WILL NOT GET CONFIRMED AND    */
      /* THE DETAILS WILL BE PRINTED IN 'shipper.err' FILE  */
      if abs_inv_mov <> ""
         and can-find(first im_mstr
                      where im_mstr.im_domain = global_domain
                      and   im_inv_mov = abs_inv_mov
                      and   im_tr_type = "ISS-SO")
      then do:
         if can-find(first work_abs_mstr
                        where (work_abs_mstr.abs_id begins "ic"
                               or work_abs_mstr.abs_id begins "is")
                        and work_abs_mstr.abs_order = ""
                        and work_abs_mstr.abs_line  = "")
         then do:
            run abs_audit.
            undo, retry.
         end. /* IF CAN-FIND ... */
      end.
 
      /* ADD CONSIGNMENT DATA TO work_abs_mstr */
      if using_cust_consignment
      then do:
 
         if change_db
         then do:
 
            run ip_alias
               (input ship_db,
               output l_flag).
 
            if l_flag then
               undo CK-CC-HOLD, leave CK-CC-HOLD.
 
         end. /* IF change_db */
 
         {us/gp/gprunmo.i &module = "ACN" &program = "rcsoisa2.p"}
 
         /* SWITCH BACK TO SALES ORDER DOMAIN IF NECESSARY */
         if change_db
         then do:
 
            run ip_alias
               (input so_db,
                output l_flag).
 
            if l_flag then
               undo CK-CC-HOLD, leave CK-CC-HOLD.
 
         end. /* IF change_db */
 
      end.  /* if using_cust_consignment */
 
      if isSimulMismatched(input abs_mstr.abs_shipfrom,
                           input abs_mstr.abs_shipto)
      then do:
         /* Mismatch with pending invoice - cannot consolidate */
         run DisplayMessage (input 1046, input 3, input '').
         undo, retry.
      end.
 
      /* USE THE qad_wkfl TO KEEP TRACK OF THE SALES ORDERS BEING     */
      /* CONFIRMED SO THAT SHIPPERS RELATED TO THE SAME ORDER ARE NOT */
      /* SIMULTANEOUSLY CONFIRMED.                                    */
      do transaction:
         run p-qadwkfl.
         if l_undoflg = yes
         then
            undo CK-CC-HOLD, leave CK-CC-HOLD.
      end.  /* DO TRANSACTION */
 
      assign
         l_undoflg = no
      /* EXIT IF THERE IS ANY PENDING CHANGE FOR EMT ORDER */
      que-doc = no.
 
      for each work_abs_mstr
         where abs_order > ""
         no-lock
      break by work_abs_mstr.abs_order
      on endkey undo CK-CC-HOLD, leave CK-CC-HOLD:
 
         if first-of (work_abs_mstr.abs_order)
         then do:
 
            assign l_wo_reject = no
                   l_undoflg   = no.
 
            run CheckWOAndCMF (input work_abs_mstr.abs_order,
                              input work_abs_mstr.abs_line,
                              output l_wo_reject,
                              output l_undoflg,
                              input-output que-doc) no-error.
 
            if l_wo_reject = yes
            then
               undo mainloop, retry mainloop.
 
            if l_undoflg = yes
            then
               undo, retry.
 
         end. /* if first-of(abs_order) */
 
      end. /* for each work_abs_mstr */
 
      assign
         shp_time = substring(string(abs_shp_time,"hh:mm"),1,2)
                  + substring(string(abs_shp_time,"hh:mm"),4,2)
         arr_date = abs_arr_date
         arr_time = substring( string(abs_arr_time,"hh:mm"),1,2)
                  + substring( string(abs_arr_time,"hh:mm"),4,2)
         abs_shipvia    = substring(abs__qad01,1,20)
         abs_fob        = substring(abs__qad01,21,20)
         abs_carr_ref   = substring(abs__qad01,41,20)
         abs_trans_mode = substring(abs__qad01,61,20)
         abs_veh_ref    = substring(abs__qad01,81,20).
 
      /* ADD CODE TO DEFAULT FRAME ab */
      /* WE DO NOT DEFAULT abs_veh_ref SINCE THAT FIELD WAS INITIALLY SET */
      /* WHEN THE SHIPPER WAS FIRST CREATED.                              */
      /* DO NOT EXECUTE FOR AN AIM SHIPPER.                               */
      if confirm_mode and
         execname <> "whrfshtr.p"
      then
         run getABFieldDefaults
            (input-output shp_time,
             input-output arr_date,
             input-output arr_time,
             input table tt_validation_fields).
 
      /* REPLACED PARAMETER auto_post FROM OUTPUT TO INPUT-OUTPUT */
      /* FOR DISPLAYING THE CORRECT FLAG SETTING AS PER CONTROL FILE */
 
      run find_auto_post (input-output auto_post).
 
      for first ad_mstr
         where ad_mstr.ad_domain = global_domain
           and  ad_addr = abs_mstr.abs_shipto
      no-lock: end.
 
      if c-application-mode <> "API" then
      display
         si_desc
         abs_mstr.abs_shipto
         ad_name
         ad_line1
      with frame a.
 
      if confirm_mode then do:
         if c-application-mode <> "API" then
         do:
            update
               ship_dt
            with frame a.
 
            for first lgdc_ctrl
               where lgdc_ctrl.lgdc_domain = global_domain
               and lgdc_ctrl.lgdc_type   = "ISS"
            no-lock:
               if lgdc_eff_date then
               update
                  eff_date
               with frame a.
            end.
            if not available lgdc_ctrl then
               update
                  eff_date
               with frame a.
         end.
 
         else assign
            {us/mf/mfaiset.i ship_dt ttSalesOrderShipperTrans.shipDate}
            {us/mf/mfaiset.i eff_date ttSalesOrderShipperTrans.effDate}.
      end.

      if confirm_mode then do:
         /* Check this shipper has pending invoice limitation or not */
         {us/gp/gprunp.i "soldxr" "p" "checkPendingInvoiceByShipper"
                   "(input abs_shipfrom,
                     input abs_id,
                     input eff_date,
                     output l_allowed)"}
         if l_allowed = no then do:
            /* Failed to confirm shipper(s), post any pending invoice first */
            run DisplayMessage (input 10653, input 3, input '').
            undo, retry.
         end.
      end.

      if c-application-mode <> "API" then
      update
         document
      with frame a.
 
      if ship_dt = ?
      then
         ship_dt = today.
 
      /* VERIFY OPEN GL PERIOD FOR LINE ITEM SITE/ENTITY, */
      /* NOT PRIMARY ENTITY                               */
      run p_glcalval
         (output l_flag).
      if l_flag
      then do:
 
         next-prompt abs_mstr.abs_shipfrom with frame a.
         undo CK-CC-HOLD, leave CK-CC-HOLD.
      end.  /* IF L_FLAG */
 
      if c-application-mode <> "API" then
      display
         abs_veh_ref shp_time arr_date arr_time
      with frame ab.
 
      do with frame ab on error undo, retry:
 
         if c-application-mode = "API" and retry then
            return error return-value.
 
         if c-application-mode <> "API" and
            confirm_mode
         then do:
            /* USE BRANCHED LOOKUPS FOR VEHICLE */
            run determineBrowse
               (input "abs_veh_ref",
                input "abs_veh_ref",
                input "gplu072.p",
                input false,
                input table tt_validation_fields,
                input table tt_data_correction).
         end.
 
         if c-application-mode <> "API" then
         set
            abs_veh_ref
            shp_time
            arr_date
            arr_time with frame ab.
         else assign
            v_shiptime =
               substring(string(ttSalesOrderShipperTrans.shipTime,"hh:mm"),1,2) +
               substring(string(ttSalesOrderShipperTrans.shipTime,"hh:mm"),4,2)
            v_arrtime =
               substring(string(ttSalesOrderShipperTrans.arrTime,"hh:mm"),1,2) +
               substring(string(ttSalesOrderShipperTrans.arrTime,"hh:mm"),4,2)
            {us/mf/mfaiset.i abs_veh_ref ttSalesOrderShipperTrans.vehRef}
            {us/mf/mfaiset.i shp_time v_shiptime}
            {us/mf/mfaiset.i arr_date ttSalesOrderShipperTrans.arrDate}
            {us/mf/mfaiset.i arr_time v_arrtime}.
 
         /* RESET THE BRANCHED BROWSE FOR THE VEHICLE REF FIELD */
         if c-application-mode <> "API" and
            confirm_mode
         then do:
            {us/bbi/gprun.i ""gpbranch.p""
                     "(input 'gplu072.p',
                       input '')"}
         end.
 
         /* EDIT USER INPUT TIME FIELDS */
         {us/bbi/gprun.i ""fstimchk.p""
          "(input         ""T"",
            input         shp_time,
            input         """",
            output        shp_time,
            output        dummy-length,
            output        msgnbr)"}
 
          /* FSTIMCHK WILL RETURN ONE OF TWO POTENTIAL  */
          /* ERRORS.  #30 IS FOR MINUTES > 59.  #69     */
          /* INDICATES NON-NUMERIC INPUT, IN WHICH CASE */
          /* WE WANT TO PRESERVE AND REDISPLAY THE USER */
          /* INPUT.                                     */
         if msgnbr <> 0
         then do:
             run DisplayMessage (input msgnbr, input 3, input '').
             next-prompt shp_time with frame ab.
             undo,retry.
         end.
 
         /* EDIT USER INPUT TIME FIELDS */
         {us/bbi/gprun.i ""fstimchk.p""
           "(input         ""T"",
             input         arr_time,
             input         """",
             output        arr_time,
             output        dummy-length,
             output        msgnbr)"}
 
         /* FSTIMCHK WILL RETURN ONE OF TWO POTENTIAL  */
         /* ERRORS.  #30 IS FOR MINUTES > 59.  #69     */
         /* INDICATES NON-NUMERIC INPUT, IN WHICH CASE */
         /* WE WANT TO PRESERVE AND REDISPLAY THE USER */
         /* INPUT.                                     */
 
         if msgnbr <> 0
         then do:
             run DisplayMessage (input msgnbr, input 3, input '').
             next-prompt arr_time with frame ab.
             undo,retry.
         end.
 
         /* VALIDATE THE FIELDS IN FRAME ab ACCORDING TO SHIPPER/ASN */
         /* VALIDATION RULES.                                        */
         /* DO NOT EXECUTE FOR AN AIM SHIPPER.                       */
         if confirm_mode and
            execname <> "whrfshtr.p"
         then do:
            assign
               cValFld[1]    = "abs_veh_ref"
               cValValue[1]  = trim(string(abs_veh_ref,"x(20)"))
               cValFld[2]    = "shp_time"
               cValValue[2]  = trim(string(shp_time))
               cValFld[3]    = "arr_date"
               cValValue[3]  = trim(string(arr_date))
               cValFld[4]    = "arr_time"
               cValValue[4]  = trim(string(arr_time)).
 
            run updateValidationTT
               (input cValFld,
                input cValValue,
                input-output table tt_validation_fields).
 
            empty temp-table tt_validation_errors.
 
            run validateFields
               (input abs_id,
                input abs_shipfrom,
                input abs_shipto,
                input "",         /* INVENTORY MOVEMENT CODE */
                input no,         /* SO SHIPMENT */
                input no,         /* CONFIRMED */
                input no,         /* CANCELED */
                input "",         /* TRANSACTION TYPE */
                input cShipStep,
                input-output table tt_validation_fields,
                output table tt_validation_errors).
 
 
            /* DISPLAY VALIDATION MESSAGES */
            if c-application-mode <> "API"
            then do:
               run displayValMessages
                  (input table tt_validation_errors).
            end.
 
            /* RECORD VALIDATION MESSAGES */
            run recordValMessages
               (input table tt_validation_errors).
 
            /* IF HARD VALIDATION ERRORS HAVE OCCURRED undo, retry THE FRAME */
            /* THIS CHECK IS ONLY FOR FRAME ab.                              */
            if c-application-mode <> "API"
            then do:
               if can-find(first tt_validation_errors where
                                 tt_val_level = 3)
               then do:
                  next-prompt abs_veh_ref with frame ab.
                  undo, retry.
               end.
            end.
         end.

         find abs_mstr where recid(abs_mstr) = abs_recid
         exclusive-lock no-error.
 
         assign
            abs_shp_time = ((integer(substring(shp_time,1,2)) * 60)
                           + integer(substring(shp_time,3,2))) * 60
            abs_arr_date = arr_date
            abs_arr_time = ((integer(substring(arr_time,1,2)) * 60)
                           + integer(substring(arr_time,3,2))) * 60
            overlay(abs__qad01,81,20) = string(abs_veh_ref,"x(20)").
 
      end.
 
      /* Warn if there is any sales orders on the shipper */
      /* that has its action status non-blank             */
      for each work_abs_mstr
         no-lock
         where work_abs_mstr.abs_id begins "ic"
      or work_abs_mstr.abs_id begins "is"
      break by abs_order
      on endkey undo CK-CC-HOLD, leave CK-CC-HOLD:
 
         if first-of (abs_order)
         then do:
 
            for first so_mstr where so_mstr.so_domain = global_domain
                 and  so_nbr = abs_order
            no-lock: end.
 
            if available so_mstr
            then do:
 
               for first cm_mstr
                   where cm_mstr.cm_domain = global_domain
                    and  cm_addr = so_bill
               no-lock: end.
 
               if available cm_mstr and
                  isCustomerOnCreditHold(input cm_addr)
               then do:
                  /* CUSTOMER ON CREDIT HOLD */
                  run DisplayMessage (input 614, input 2, input '').
                  leave.
               end. /* IF AVAILABLE CM_MSTR */
 
               if so_stat <> ""
               then do:
                  /* SALES ORDER STATUS NOT BLANK */
                  run DisplayMessage (input 623, input 2, input so_stat).
                  leave.
               end.
 
               if so_compl_stat <> ""
               then do:
                  /* SALES ORDER IS CLOSED */
                  run DisplayMessage (input 8024, input 3, input '').
                  undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.
 
               if not can-find (first tt_so_mstr
                                where tt_so_mstr.tt_so_nbr = so_nbr)
               then do:
                  create tt_so_mstr.
                  assign
                     tt_so_mstr.tt_so_nbr       = so_nbr
                     tt_so_mstr.tt_so_to_inv    = so_to_inv
                     tt_so_mstr.tt_so_ship_date = so_ship_date
                     tt_so_mstr.tt_so_tax_date  = so_tax_date
                     tt_so_mstr.tt_so_bol       = so_bol
                     tt_so_mstr.tt_so__qadc01   = so__qadc01.
               end. /* IF NOT CAN-FIND (FIRST tt_so_mstr */
 
            end. /* IF AVAILABLE SO_MSTR */
 
            else if not available so_mstr
            then do:
               /* SALES ORDER DOES NOT EXIST  */
               run DisplayMessage (input 609, input 3, input '').
               undo CK-CC-HOLD, leave CK-CC-HOLD.
            end.

            /* SAVE THE ORDER TOTAL, THIS COULD BE A NEW ORDER OR AN EXISTING ORDER,*/
            /* STORE THIS VALUE, IT IS USED AS A BEFORE VALUE */
            /* addSalesOrderTotal CREATES TEMP-TABLE WHICH STORES THE ORDER TOTAL */
            if so_sched
            then
               run addSalesOrderTotal in hCreditLibrary
                          ( input so_nbr,
                            input getOrderTotal( input so_nbr)).
 
         end. /* if first-of  abs_order */
 
         if not can-find(sod_det where sod_det.sod_domain = global_domain
               and sod_nbr  = abs_order
               and sod_line = integer(abs_line))
               and abs_qty <> abs_ship_qty
         then do:
            /* SALES ORDER LINE DOES NOT EXIST  */
            run DisplayMessage (input 764, input 3, input '').
            undo CK-CC-HOLD, leave CK-CC-HOLD.
         end.
 
         if can-find(sod_det where sod_det.sod_domain = global_domain
               and sod_nbr  = abs_order
               and sod_line = integer(abs_line)
               and sod_compl_stat <> "")
               and abs_qty <> abs_ship_qty
         then do:
            /* SALES ORDER LINE is CLOSED  */
            run DisplayMessage (input 8025, input 3, input '').
            undo CK-CC-HOLD, leave CK-CC-HOLD.
         end.
 
      end. /* for each work_abs_mstr */
 
      do transaction:

         /* If the structure is a "pre-shipper" then convert it into */
         /* a "shipper" first. For that, generate the shipper#       */
         if abs_mstr.abs_id begins "p"
         then do:
 
            /* WHEN WMS IS ACTIVE CHECK IF AIM TASKS LINKED TO IT, IF SO */
            /* CONVERSION IS NOT ALLOWED.                                */
            if {us/wh/whgpwhon.i} then do:
 
               {us/bbi/gprun.i ""whgpchsh.p"" "(input abs_mstr.abs_shipfrom,
                  input abs_mstr.abs_id,
                  input '',
                  output LVTaskFound)"}
 
               if LVTaskFound then do:
                  /* CONVERSION NOT ALLOWED. WAREHOUSE TRANSACTIONS EXIST */
                  run DisplayMessage (input 10876, input 3, input '').
                  undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.
            end. /* IF {us/wh/whgpwhon.i} */
 
            {us/bbi/gprun.i ""gpgetgrp.p""
               "(input  abs_mstr.abs_shipfrom,
                 input  abs_mstr.abs_shipto,
                 output shipgrp)"}
 
            nrseq = shc_ship_nr_id.
 
            if shipgrp <> ?
            then do:
 
               for first sgid_det
                   where sgid_domain = global_domain
                     and sgid_grp = shipgrp
                     and sgid_inv_mov = abs_inv_mov
               no-lock:
                  nrseq = sgid_ship_nr_id.
               end. /* FOR FIRST SGID_DET */
 
            end.
 
            run chk_internal
               (input nrseq,
                output is_internal,
                output errorst,
                output errornum).
 
            if errorst
            then do:
               run DisplayMessage (input errornum, input 3, input '').
               undo CK-CC-HOLD, leave CK-CC-HOLD.
            end.
 
            if is_internal
            then do:
 
               run getnbr
                  (input nrseq,
                   input today,
                   output shipnbr,
                   output errorst,
                   output errornum).
 
               if errorst
               then do:
                  run DisplayMessage (input errornum, input 3, input '').
                  undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.
 
               if c-application-mode <> "API" then do:
                  display
                     shipnbr
                  with frame convfrm.
                  {us/gp/gpwait.i}
                  if not batchrun then pause.
               end. /* if c-application-mode <> "API" */
 
            end.
 
            else do: /* external sequence */
 
               updnbr:
               do on endkey undo updnbr, leave updnbr:
 
                  if c-application-mode = "API" and retry then
                     return error return-value.
 
                  if c-application-mode <> "API" then
                  update
                     shipnbr
                  with frame convfrm.
                  else
                     {us/mf/mfaiset.i shipnbr ttSalesOrderShipperTrans.shipNbr}.
 
                  if can-find (first abs_temp
                      where abs_temp.abs_domain = global_domain
                        and abs_temp.abs_shipfrom = abs_mstr.abs_shipfrom
                        and abs_temp.abs_id = "S" + shipnbr)
                  then do:
                     /* SHIPPER ALREADY EXISTS */
                     run DisplayMessage (input 8278,
                                         input 3,
                                         input '').
                     undo updnbr, retry updnbr.
                  end.
 
                  run valnbr
                     (input nrseq,
                      input today,
                      input shipnbr,
                      output is_valid,
                      output errorst,
                      output errornum).
 
                  if errorst
                  then do:
                     run DisplayMessage (input errornum,
                                         input 3,
                                         input '').
                     undo updnbr, retry updnbr.
                  end.
 
                  else if not is_valid
                  then do:
                     /* INVALID PRE-SHIPPER/SHIPPER NUMBER FORMAT */
                     run DisplayMessage (input 5950,
                                         input 3,
                                         input '').
                     undo updnbr, retry updnbr.
                  end.
 
               end. /* updnbr */
 
               if keyfunction(lastkey) = "end-error"
               then do:
                  if c-application-mode <> "API" then
                     hide frame convfrm no-pause.
                  undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.
 
            end. /* external sequence */
 
            if c-application-mode <> "API" then
               hide frame convfrm no-pause.
 
            shipnbr = "S" + shipnbr.
 
            find abs_mstr where recid(abs_mstr) = abs_recid
            exclusive-lock no-error.
 
            /* Save the preshipper# and overwrite abs_id with shipper# */
            assign
               abs_mstr.abs_preship_id    = abs_mstr.abs_id
               abs_mstr.abs_preship_nr_id = abs_mstr.abs_nr_id
               abs_mstr.abs_nr_id         = nrseq.

            /* CHANGE THE SHIPPER NUMBER IN THE WORK_ABS_MSTR */
            {us/bbi/gprun.i ""rcsoisa1.p""
               "(abs_mstr.abs_shipfrom,
                 abs_mstr.abs_id,
                 shipnbr)"}
 
            /* CHANGE THE SHIPPER NUMBER FOR ENTIRE SHIPPER STRUCTURE */
            {us/bbi/gprun.i ""icshchg.p"" "(recid(abs_mstr), shipnbr)" }
 
            /* ASSIGN SHIPPER NUMBER TO CARRIER REF IF CARRIER REF IS */
            /* PRE_SHIPPER NUMBER */
            if right-trim(substring(abs_mstr.abs_preship_id,2,20)) =
               right-trim(substring(abs_mstr.abs__qad01,41,20))
            then
               assign
                  overlay(abs_mstr.abs__qad01,41,20) =
                     substring(abs_mstr.abs_id,2,20)
                  abs_carr_ref = substring(abs_mstr.abs__qad01,41,20).
 
            if use-log-acctg
            then do:
               if     abs_mstr.abs_shipfrom <> ""
                  and not can-find(first lacd_det
                            where lacd_det.lacd_domain = global_domain
                            and   lacd_internal_ref_type = {&TYPE_SOPreShipper}
                            and   lacd_internal_ref  =
                                        substring(abs_mstr.abs_preship_id,2)
                            and   lacd_shipfrom      = abs_mstr.abs_shipfrom)
               then do:
                  for each work_abs_mstr
                  no-lock
                     where work_abs_mstr.abs_par_id = abs_mstr.abs_id
                     and   work_abs_mstr.abs_order > ""
                  break by work_abs_mstr.abs_order:
 
                     if can-find(first lacd_det
                            where lacd_det.lacd_domain = global_domain
                            and   lacd_internal_ref_type = {&TYPE_SO}
                            and   lacd_internal_ref  = work_abs_mstr.abs_order
                            and   lacd_shipfrom      = abs_mstr.abs_shipfrom)
                     then do:
                         for each lacd_det
                             where lacd_det.lacd_domain     = global_domain
                             and   lacd_internal_ref_type   = {&TYPE_SO}
                             and   lacd_internal_ref        = work_abs_mstr.abs_order
                             and   lacd_shipfrom            = abs_mstr.abs_shipfrom
                         exclusive-lock:
                             if not can-find(first b_lacd_det
                                where b_lacd_det.lacd_domain = global_domain
                                and   b_lacd_det.lacd_internal_ref_type = {&TYPE_SOShipper}
                                and b_lacd_det.lacd_internal_ref      = substring(abs_mstr.abs_id,2)
                                and b_lacd_det.lacd_shipfrom          = abs_mstr.abs_shipfrom
                                and b_lacd_det.lacd_lc_charge  = lacd_det.lacd_lc_charge)
                             then do:
                                 create b_lacd_det.
                                 b_lacd_det.lacd_domain = global_domain.
 
                                 buffer-copy lacd_det except oid_lacd_det  to b_lacd_det
                                    assign b_lacd_det.lacd_internal_ref_type = {&TYPE_SOShipper}
                                           b_lacd_det.lacd_internal_ref      = substring(abs_mstr.abs_id,2)
                                           b_lacd_det.lacd_shipfrom          = abs_mstr.abs_shipfrom
                                           b_lacd_det.lacd_mod_userid        = global_userid
                                           b_lacd_det.lacd_mod_date          = today
                                 no-error.
                                 b_lacd_det.lacd_domain = global_domain.
 
                                if recid(b_lacd_det) = -1 then.
                             end.  /* IF NOT CAN-FIND */
                         end.   /* FOR EACH LACD_DET */
                     end. /* if can-find lacd_det */
                  end.  /* for each work_abs_mstr */
               end. /* abs_ship_from */
 
               run changeShipperNumberInLogAcctDetail
                      (input {&TYPE_SOPreShipper},
                       input substring(abs_mstr.abs_preship_id,2),
                       input abs_mstr.abs_shipfrom,
                       input {&TYPE_SOShipper},
                       input substring(abs_mstr.abs_id,2),
                       input abs_mstr.abs_shipfrom).
 
 
            end. /* IF use-log-act  */

            {us/bbi/gprun.i ""icshld.p""
                     "(input  recid(abs_mstr),
                       input  no,
                       input  no,
                       output i_err_num)"}

         end. /* IF ABS_MSTR.ABS_ID BEGINS "P"  */
 
      end. /* DO TRANSACTION */

      /* CHECK FOR UNPEGGED SHIPPER LINES */
      {us/bbi/gprun.i ""rcsois4a.p""
         "(input abs_recid, output yn)"}
 
      if yn then
         undo CK-CC-HOLD, leave CK-CC-HOLD.
 
      /* PERFORM A FINAL CHECK BEFORE CONFIRMATION OF STORED DATA */
      /* FIELDS IN abs_mstr AND absc_det AS DETERMINED BY         */
      /* ASN/SHIPPER VALIDATION RULES.                            */
      /* IN ORDER TO PERFORM THE FINAL CHECK PROPERLY IT MUST BE  */
      /* RUN ONCE FOR SHIP STEP = SHIPPER AND SHIP STEP = CONFIRM */
      /* DO NOT RUN FOR AN AIM SHIPPER.                           */
      if confirm_mode and
         execname <> "whrfshtr.p"
      then do:
 
         assign
            cShipFrom = abs_mstr.abs_shipfrom
            cShipTo   = abs_mstr.abs_shipto
            dShipDate = abs_mstr.abs_shp_date
            cAbsID    = abs_mstr.abs_id.
 
         run validateFieldsAtConfirm
            (input cShipFrom,
             input cShipTo,
             input dShipDate,
             input cAbsID,
             input {&TYPE_Shipper}).
 
         run validateFieldsAtConfirm
            (input cShipFrom,
             input cShipTo,
             input dShipDate,
             input cAbsID,
             input {&TYPE_Confirm}).
 
         /* IF THE SHIPPER TRYING TO BE CONFIRMED HAS HARD VALIDATION */
         /* ERRORS THEN PREVENT THE CONFIRMATION FROM OCCURRING.      */
         assign
            lErrCondition = false
            lWarnCondition = false.
 
         run checkForValidationErrors
            (input cAbsID,
             input cShipFrom,
             output lErrCondition,
             output lWarnCondition).
 
 
         if (lErrCondition or
             lWarnCondition)
         then do:
 
            if c-application-mode <> "API"
            then do:
 
               hide frame a no-pause.
               hide frame ab no-pause.
 
               /* IF ANY SHIPPER DATA ERRORS EXIST GIVE THE USER AN */
               /* OPPORTUNITY TO CORRECT THEM BEFORE THE SHIPPER IS */
               /* CONFIRMED.                                        */
               run correctShipData
                  (input cAbsID,
                   input cShipFrom,
                   input cShipTo,
                   input table tt_validation_fields,
                   output lDispPrintFrame).
 
               view frame a.
            end.
 
            /* RE-CHECK AFTER DATA CORRECTION IF ANY VALIDATION    */
            /* ERRORS STILL EXIST.                                 */
            run checkForValidationErrors
               (input cAbsID,
                input cShipFrom,
                output lErrCondition,
                output lWarnCondition).
 
            if lErrCondition
            then
               undo,retry.
         end.
      end.
 
      /* RE-FIND THE abs_mstr RECORD IF IT'S NO LONGER AVAILABLE */
      if not available abs_mstr
      then do:
         for first abs_mstr exclusive-lock where
             recid(abs_mstr) = abs_recid:
         end.
      end.
 
      if available so_mstr
      then do:
         {us/gp/gprunp.i "gpccpl" "p" "isCCOrder"
            "(input so_nbr, output creditCardOrder)"}
      end. /* IF AVAILABLE so_mstr */
 
      if creditCardOrder
      then do:
         assign
            consolidate = no.
      end. /*if creditCardOrder then do:*/
 
      /* PERFORM SECURITY CHECK FOR ACCESS OF INVOICE POST MENU */
      for first mnd_det where mnd_exec = "soivpst.p"
      no-lock:
         /* API Check to see if Resource is Allowed */
         {us/gp/gprunp.i "gpmenupl" "p" "checkResourceSecurity"
            "(input mnd_det.mnd_uri,
              input false,
              output l_invpost)"}
      end. /* IF AVAILABLE mnd_det */

      /*grc338 added */
       /* PERFORM SECURITY CHECK FOR ACCESS OF INVOICE POST MENU */
      for first mnd_det where mnd_exec = "xfivpst.p"
      no-lock:
         /* API Check to see if Resource is Allowed */
         {us/gp/gprunp.i "gpmenupl" "p" "checkResourceSecurity"
            "(input mnd_det.mnd_uri,
              input false,
              output l_invpost)"}
      end. /* IF AVAILABLE mnd_det */

      /*grc338 add end */
 
      /* DISABLE UPDATE TO INVOICE POST FLAG WHEN SELF BILLING */
      /* IS ACTIVE BUT INTEGRATE WITH AR IS 'NO'               */
      run proc-archeck
         (input-output auto_post,
          input-output l_auto_noupdate).
 
      /* Cannot print Invoice if it is not posted */
      if auto_post = no then
         auto_inv = no.
 
      /* DEFAULT DAYBOOKSET BY SITE */
      if available so_mstr then do:
         if so_daybookset = ""
         then do:
            assign
               cDaybookSet = getDefaultDaybookSetBySite (input so_bill).
         end.
         else do:
            assign
               cDaybookSet = so_daybookset.
         end.
      end.
 
      run getDefaultConsolidate
         (buffer abs_mstr,
          buffer shc_ctrl,
          output consolidate).

      if c-application-mode <> "API" then
         display
         cDaybookSet
         consolidate
     with frame b.

      setb:
      do with frame b on error undo,
         retry on endkey undo, leave setb:
 
         if l_invpost = no
            and auto_post
         then 
            assign
               auto_post = no
               auto_inv  = no.
 
         if c-application-mode <> "API" then
         update
            auto_post   when (not l_auto_noupdate
                              and l_invpost  = yes)
            l_prtInstBase   when (not l_auto_noupdate
                              and l_invpost  = yes)
            auto_inv    when (not l_auto_noupdate
                              and l_invpost = yes)
            consolidate when (not creditCardOrder
                          and l_disable_con = no
                              and l_invpost = yes)
            l_calc_freight
         with frame b.
         else do:
            assign
               auto_inv = no /* NO INVOICE PRINTING IN API MODE */
               {us/mf/mfaiset.i l_calc_freight ttSalesOrderShipperTrans.calcFreight}.
            if not l_auto_noupdate then
               {us/mf/mfaiset.i auto_post ttSalesOrderShipperTrans.autoPost}.
            if not creditCardOrder then assign
               {us/mf/mfaiset.i consolidate ttSalesOrderShipperTrans.consolidate}.
         end.
 
         if not auto_post and auto_inv then do:
            /* INVOICE MUST BE POSTED BEFORE IT CAN BE PRINTED */
            run DisplayMessage (input 7679, input 3, input '').
            if c-application-mode <> "API" then
               next-prompt auto_post with frame b.
            undo, retry setb.
         end.
 
         if (auto_post)
         then do:
            /* VERIFY GL BEFORE POSTING */
            if can-find(gl_ctrl
               where gl_domain = global_domain
                 and gl_verify = false)
            then do:
               /* CANNOT EXECUTE INVOICE POST */
               run DisplayMessage (input 6671, input 3, input '').
               if c-application-mode <> "API" then
                  hide frame b no-pause.
               next mainloop.
            end.
 
            if available so_mstr
            then do:
               /* VALIDATE DAYBOOK SET BY SITE */
               run validateDaybookSet in hDaybookSetValidation
                  (input  cDaybookSet,
                   input  so_site,
                   input  eff_date,
                   output iErrorNumber,
                   output cErrorArgs).
 
               if iErrorNumber > 0
               then do:
                  run DisplayMessage (input iErrorNumber, input 3, input '').
                  /* DAYBOOKSET IS NOT UPDATABLE FIELD. PUT CURSOR ON auto_inv */
                  if c-application-mode <> "API" then
                     next-prompt auto_inv with frame b.
                  undo, retry setb.
               end.
               else do:
                  run saveDaybookSet
                     (input so_nbr, input cDaybookSet).
               end.
            end. /* IF AVAILABLE sO_mstr */
         end. /* IF AUTO POST */
 
         find abs_mstr where recid(abs_mstr) = abs_recid no-lock no-error.
 
         if available abs_mstr then do:
            /* Get legal document form code */
            {us/gp/gprunp.i "soldxr" "p" "isBrazilStyleLD"
                      "(input  abs_shipfrom,
                        input  abs_id,
                        output brazil_ld)"}
         end.
 
      end. /* SETB */
 
      l_auto_noupdate = no.
 
      run connect_vertex no-error.
      if error-status:error then
         undo, retry.

      /* VALIDATES THAT THERE IS ADEQUATE INVENTORY AVAILABLE TO SHIP ALL */
      /* LINES WITH SAME SITE, LOC & PART IF OVER-ISSUE NOT ALLOWED */
      /* VALIDATE WHEN CONFIRMING, SKIP WHEN UN-CONFIRMING. */
      /* THIS ALLOWS SERIAL NUMBERS TO BE RETURNED FROM CONSIGNMENT */
      /* LOCATIONS. */
 
      if confirm_mode
      then do:
         {us/bbi/gprun.i ""rcsoisg.p""}
         if rejected then
            undo CK-CC-HOLD, leave CK-CC-HOLD.
      end.  /* if confirm_mode */
 
      /* Check the shipper is a consignment simultaneous shipper or not
         before transaction started */
      assign
         using_consign = no
         mapping_simul = no.
      if using_cust_consignment then do:
         {us/gp/gprunp.i "soldxr" "p" "isUsingConsign"
                   "(input abs_mstr.abs_id,
                     input abs_mstr.abs_shipfrom,
                     input-output using_consign)"}
         if using_consign then do:
            for first lgd_mstr where lgd_domain = global_domain
               and lgd_type = yes
               and lgd_status <> {&LD_CANCELLED}
               and lgd_shipper_id = abs_mstr.abs_id no-lock,
               first so_mstr where so_domain = global_domain
               and so_nbr = lgd_order
               and so_compl_stat = ""
            no-lock:
               {us/gp/gprunp.i "soldxr" "p" "checkSimultaneus"
                         "(input abs_mstr.abs_shipto,
                           input abs_mstr.abs_shipfrom,
                           input so_tax_usage,
                           input lgd_order,
                           input 'SO',
                           input yes,
                           output mapping_simul)"}
               if mapping_simul then
                  {us/gp/gprunp.i "soldxr" "p" "getShippingTaxUsage"
                   "(input abs_mstr.abs_shipto,
                     input abs_mstr.abs_shipfrom,
                     input so_tax_usage,
                     input lgd_order,
                     input 'SO',
                     input yes,
                     output shipping_tax)"}
            end.
         end. /* if using_consign */
      end. /* if using_cust_consignment */
 
      /* GO THRU WORKFILE FOR  VALIDATION,  UPDATE  STD  COSTS,      */
      /* SET PRICES,  SET  INVOICING  FLAGS, UPDATE FREIGHT CHARGES, */
      /* MANUAL UPDATE OF TRAILER CHARGES,                           */
      /* AND ORDER  THE  SECRETARY  FLOWERS                          */
 
      assign
         tot_freight_gl_amt = 0
         order_ct = 0.
 
      if confirm_mode = no then 
      do:
         /* Prompt user to enter additional information */
         {us/bbi/gprun.i ""gpreascod.p"" "(input abs_mstr.oid_abs_mstr,
                                           output reason_code)"}
      end.
 
      do transaction:

         for each work_abs_mstr
            where abs_order > ""
         no-lock,
             each sod_det exclusive-lock
            where sod_det.sod_domain = global_domain
              and sod_nbr = abs_order
              and sod_line = integer(abs_line)
              and sod_compl_stat = ""
         break by abs_order by abs_line:
 
            if (oldcurr <> so_curr)
               or (oldcurr = "")
            then do:
 
               /* GET ROUNDING METHOD FROM CURRENCY MASTER */
               {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
                  "(input so_curr,
                    output rndmthd,
                    output mc-error-number)"}
 
               if mc-error-number <> 0
               then do:
                  run DisplayMessage (input mc-error-number,
                                      input 3,
                                      input '').
                  undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.  /* mc-error-number <> 0 */
 
               oldcurr = so_curr.
 
            end.
 
            if first(abs_order)
            then do:
 
               find so_mstr where so_mstr.so_domain = global_domain
                    and so_nbr = sod_nbr
                    and so_compl_stat = ""
               exclusive-lock.
 
               assign
                  l_first_so_nbr     = so_nbr
                  first_so_bill      = so_bill
                  first_so_cust      = so_cust
                  first_so_curr      = so_curr
                  first_so_cr_terms  = so_cr_terms
                  first_so_trl1_cd   = so_trl1_cd
                  first_so_trl2_cd   = so_trl2_cd
                  first_so_trl3_cd   = so_trl3_cd
                  first_so_slspsn[1] = so_slspsn[1]
                  first_so_slspsn[2] = so_slspsn[2]
                  first_so_slspsn[3] = so_slspsn[3]
                  first_so_slspsn[4] = so_slspsn[4]
                  first_so_entity    = ""
                  first_so_site      = so_site
                  first_so_ex_rate   = so_ex_rate
                  first_so_ex_rate2  = so_ex_rate2
                  first_so_exru_seq  = so_exru_seq.
 
               for first si_mstr
                   where si_mstr.si_domain = global_domain
                    and  si_site = so_site
               no-lock:
                  first_so_entity = si_entity.
               end.
               /* MULTI-DB: USE SHIP-TO CUSTOMER TYPE FOR DEFAULT */
               /* IF AVAILABLE ELSE USE BILL-TO TYPE USED TO      */
               /* FIND COGS ACCOUNT IN SOCOST02.p                 */
               {us/bbi/gprun.i ""gpcust.p""
                  "(input  so_nbr, output ord-db-cmtype)"}
 
            end.
            else 
               l_is_mutiple_so = yes.
 
            /* CONVERTING SHIPQTY TO INVENTORY UM FROM SHIP UM */
            shipqty = (if confirm_mode
                       then
                          (work_abs_mstr.abs_qty - work_abs_mstr.abs_ship_qty)
                      /* CORRECTED THE SHIPQTY DURING UNCONFIRM MODE  */
                       else
                          (-1 * work_abs_mstr.abs_qty)) *
                         decimal(work_abs_mstr.abs__qad03).
 
            if abs_item = sod_part
            then
               accumulate shipqty (sub-total by abs_line).
 
            if first-of(abs_order)
            then do:
               l_so_to_inv = no.
 
               order_ct = order_ct + 1.
 
               if order_ct <= 30
               then
                  order_nbrs[order_ct] = sod_nbr.
               else
                  order_nbr_list = order_nbr_list + sod_nbr + ",".
 
               for first so_mstr where so_mstr.so_domain = global_domain
                    and so_nbr = sod_nbr
                    and so_compl_stat = ""
               no-lock: end.
 
 
               /*CHECK CONSISTENCY OF SALES ORDERS*/
               if       consolidate
                  and  (auto_inv
                     or auto_post)
               then do:
 
                  msg_text = "".
 
                  /* PROCEDURE FOR CONSOLIDATION RULES */
                  {us/bbi/gprun.i ""soconso.p""
                     "(input 2,
                       input  l_first_so_nbr ,
                       input  so_nbr ,
                       output l_consolidate_ok,
                       output msg_text)"}
 
                  if msg_text > ""
                  then do:
                     /* MISMATCH WITH PENDING INVOICE - CAN'T CONSOLIDATE. */
                     run DisplayMessage (input 1046,
                                         input 3,
                                         input msg_text).
                     undo CK-CC-HOLD, leave CK-CC-HOLD.
                  end.
 
               end. /* IF CONSOLIDATE */
 
               if use-log-acctg
                  and l_calc_freight
               then do:
 
                  msg_text = "".
 
                  run validateSOForLogisticsAccounting
                         (input l_first_so_nbr,
                          input so_nbr,
                          output msg_text).
 
                  if msg_text > ""
                  then do:
                     /* ALL ATTACHED ORDERS MUST HAVE SAME # */
                     run DisplayMessage (input 5588,
                                         input 3,
                                         input msg_text).
                     undo CK-CC-HOLD, leave CK-CC-HOLD.
                  end.
 
               end. /* IF USE-LOG-ACCTG AND l_CALC_FREIGHT */
 
               if so_fix_rate
               then
                  assign
                     exch_rate     = so_ex_rate
                     exch_rate2    = so_ex_rate2
                     exch_ratetype = so_ex_ratetype
                     exch_exru_seq = so_exru_seq.
               else do:
 
                  /* GET EXCHANGE RATE FOR BASE TO ACCOUNT CURRENCY */
                  {us/gp/gprunp.i "mcpl" "p" "mc-get-ex-rate"
                           "(input  so_curr,
                             input  base_curr,
                             input  so_ex_ratetype,
                             input  eff_date,
                             output exch_rate,
                             output exch_rate2,
                             output mc-error-number)" }
 
                  if mc-error-number <> 0
                  then do:
                     run DisplayMessage (input mc-error-number,
                                         input 3,
                                         input '').
                     undo CK-CC-HOLD, leave CK-CC-HOLD.
                  end.
 
                  assign
                     exch_ratetype = so_ex_ratetype
                     exch_exru_seq = 0.
 
               end.  /* else */
 
               find so_mstr where so_mstr.so_domain = global_domain
                    and so_nbr = sod_nbr
                    and so_compl_stat = ""
               exclusive-lock.
 
               if available so_mstr then do:
                  so_ship_date = ship_dt.
                  if sod_consignment = no
                     and so_tax_date = ?
                  then do:
                     create tt_so_notaxdt.
                     tt_sonum = so_nbr.
                     so_tax_date = ship_dt.
                  end.  /* IF sod_consignment = no THEN */
               end.
 
               /* TO DOWNGRADE THE LOCK TO NO-LOCK AS THE FIELDS */
               /* OF THE so_mstr ARE ACCESSED BELOW              */
               for first so_mstr where so_domain = global_domain
                   and so_nbr    = sod_nbr
                   and so_compl_stat = ""
               no-lock: end.
 
            end. /* IF FIRST-OF(ABS_ORDER) */
 
            if last-of(abs_line)
            then do:
 
               /* SET STANDARD COST */
 
               /* SWITCH TO INVENTORY DOMAIN IF NECESSARY */
               if change_db
               then do:
                  run ip_alias
                     (input ship_db,
                      output l_flag).
                  if l_flag
                  then
                     undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.
 
               /* SET STANDARD COST FROM INVENTORY DOMAIN */
               {us/bbi/gprun.i ""gpsct05.p""
                  "(input sod_part,
                    input sod_site,
                    input 1,
                    output glxcst,
                    output curcst)"}
 
               /* SWITCH BACK TO SALES ORDER DOMAIN IF NECESSARY */
               if change_db
               then do:
                  run ip_alias
                     (input so_db,
                      output l_flag).
                  if l_flag
                  then
                     undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.
 
               if sod_type <> "M" then
                  sod_std_cost = glxcst * sod_um_conv.
 
               /* If Scheduled Order */
               if sod_sched
               then do:
 
                  /*CHECK IF ORDER LINE IS EFFECTIVE*/
                  if sod_start_eff[1] > today or
                     sod_end_eff[1] < today
                     then do on endkey undo CK-CC-HOLD, leave CK-CC-HOLD:
 
                     if c-application-mode <> "API" then
                        hide message no-pause.
 
                     /* ORDER LINE NOT EFFECTIVE. START DATE:MM/YY/DD */
                     /* END DATE:MM/YY/DD*/
                     {us/bbi/pxmsg.i &MSGNUM=10341 &ERRORLEVEL=2
                              &MSGARG1=sod_start_eff[1]
                      &MSGARG2=sod_end_eff[1]}
 
                     if c-application-mode <> "API" then do:
                        /* DO YOU WISH TO CONTINUE? */
                        {us/bbi/pxmsg.i &MSGNUM=7734 &ERRORLEVEL=1 &CONFIRM=l_continue}
                        if l_continue = no
                        then do:
                              undo CK-CC-HOLD, leave CK-CC-HOLD.
                        end. /* IF l_continue = no */
 
                     end. /* IF c-application-mode <> "API" */
                  end. /*if sod_start_eff[1] < today or */
 
                  if sod_cum_qty[3] > 0 then do:
                     dExcessQty = 0.
 
                     {us/px/pxrun.i &PROC='calculateEndEffectiveQtyExcess'
                              &PROGRAM='sosodxr.p'
                              &HANDLE=ph_sosodxr
                              &PARAM="(input sod_nbr,
                                       input sod_line,
                                       input 0,
                                       input sod_cum_qty[3],
                                       input so_cum_acct,
                                       output dExcessQty)"
                              &NOAPPERROR=True
                              &CATCHERROR=True}
                      if valid-handle(ph_sosodxr) then
                         delete object ph_sosodxr.
                      ph_sosodxr = ?.
 
                     if dExcessQty > 0
                     then do on endkey undo CK-CC-HOLD, leave CK-CC-HOLD:
 
                     if c-application-mode <> "API" then
                        hide message no-pause.
 
                       /* ORDER LINE END EFFECTIVE QTY EXCEEDED BY 9999999 */
                       {us/bbi/pxmsg.i &MSGNUM=10342 &ERRORLEVEL=2 &MSGARG1=dExcessQty}
                       if c-application-mode <> "API" then do:
                          /* DO YOU WISH TO CONTINUE? */
                          {us/bbi/pxmsg.i &MSGNUM=7734 &ERRORLEVEL=1
                                                &CONFIRM=l_continue}
                          if l_continue = no
                          then
                             undo CK-CC-HOLD, leave CK-CC-HOLD.
                        end. /* IF c-application-mode <> "API" */
                     end. /* if dExcessQty > 0 then do: */
 
                  end.
 
                  /* SET CURRENT PRICE */
                  for first pt_mstr
                      where pt_mstr.pt_domain = global_domain
                       and  pt_part = sod_part
                  no-lock: end.
 
                  /* FOLLOWING SECTION IS ADDED TO REPLACE rcpccal.p */
                  /* WITH gppccal.p TO TAKE CARE OF PRICE LIST TYPES */
                  /* "M" AND "D" IN ADDITION TO "P"                  */
                  for first soc_ctrl
                      where soc_ctrl.soc_domain = global_domain
                  no-lock: end.
 
                  assign
                     l_disc_pct1  = 0
                     l_net_price  = ?
                     l_rec_no     = ?
                     l_list_price = 0.
 
                  /* SCHEDULED ORDERS CAN BE CREATED ONLY IN STOCKING */
                  /* UM MULTIPLYING BY sod_um_conv JUST FOR SAFETY    */
                  if available pt_mstr
                  then do:
 
                     /* CONVERT FROM BASE TO ACCOUNT CURRENCY */
                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                              "(input  base_curr,
                                input  so_curr,
                                input  exch_rate2,
                                input  exch_rate,
                                input  pt_price * sod_um_conv,
                                input  false,   /* DO NOT ROUND */
                                output l_list_price,
                                output mc-error-number)"}.
 
                     if mc-error-number <> 0
                     then do:
                        run DisplayMessage (input mc-error-number,
                                            input 3,
                                            input '').
                        undo CK-CC-HOLD, leave CK-CC-HOLD.
                     end.
 
                  end.  /* if available */
 
                  /* CALCULATE PRICE */
                  {us/bbi/gprun.i ""gppccal.p""
                     "(input  sod_part,
                       input (accum sub-total by abs_line shipqty) / sod_um_conv,
                       input sod_um,
                       input sod_um_conv,
                       input so_curr,
                       input {&CUSTOMER-CLASSIFICATION},
                       input sod_pr_list ,
                       input eff_date,
                       input (sod_std_cost * so_ex_rate),
                       input soc_pl_req,
                       0.0,
                       input-output  l_list_price,
                       output        l_disc_pct1,
                       input-output  l_net_price,
                       output        l_rec_no)"}
 
                  create tt_sod_det.
 
                  assign
                     tt_sod_nbr  = sod_nbr
                     tt_sod_line = sod_line
                     tt_pr_found = if l_rec_no = 0
                                   then
                                      false
                                   else
                                      true.
 
                  if recid(tt_sod_det) = -1 then .
 
                  if l_net_price <> ? then
                     sod_price = l_net_price.
 
                  /* UPDATE SOD_LIST_PRICE FOR SCHEDULE ORDER WHEN   */
                  /* SOD_LIST_PRICE IS ZERO OR                       */
                  /* LIST PRICE IN ITEM MASTER IS ZERO SO THAT SALES */
                  /* AMOUNT SHOULD BE POSTED TO PROPER ACCOUNT       */
                  if pt_price    = 0 or
                     sod_list_pr = 0
                  then
                     sod_list_pr = sod_price.
 
                  /* SWITCHING TO INVENTORY DOMAIN */
                  if change_db
                  then do:
                     run ip_alias
                        (input ship_db,
                         output l_flag).
                     if l_flag then
                        undo CK-CC-HOLD, leave CK-CC-HOLD.
                  end. /* IF CHANGE_DB */
 
                  /* UPDATE NET PRICE, LIST PRICE, CUMULATIVE QTY IN */
                  /* INVENTORY DOMAIN                              */
                  {us/bbi/gprun.i ""sosoisu6.p""
                     "(input sod_nbr,
                       input sod_line,
                       input sod_price,
                       input l_list_price,
                       input sod_cum_qty[1],
                       input sod_cum_qty[2],
                       input sod_cum_qty[3])"}
 
                  /* SWITCHING BACK TO CENTRAL DOMAIN */
                  if change_db
                  then do:
                     run ip_alias (input so_db, output l_flag).
                     if l_flag then
                        undo CK-CC-HOLD, leave CK-CC-HOLD.
                  end. /* IF CHANGE_DB */
 
               end.
 
               /* SOD_QTY_CHG IS FOR EVERY SALES ORDER LINE AND THE */
               /* QUANTITY SHOULD BE ACCUMULATED FOR EACH LOTSERIAL */
               /* LINE ENTERED VIA MULTI-ENTRY MODE                 */
               assign
                  sod_qty_chg =
                     (accum sub-total by abs_line shipqty) / sod_um_conv.
 
               /* CREATE IMPORT EXPORT HISTORY RECORD */
               run createImpExpHist
                   (buffer sod_det,
                    input sod_qty_chg,
            input abs_mstr.abs_id,
                    input eff_date).
 
            end. /* if last-of abs_line */
 
            if last-of(abs_order)
            then do:
 
               gl_amt = 0.
 
               run calculate_freight_charge
                  (buffer so_mstr,
                   input l_calc_freight,
                   input substring(abs_mstr.abs_id,2,50)).
 
               if rndmthd = ""
               then do:
 
                  /* GET ROUNDING METHOD FROM CURRENCY MASTER */
                  {us/gp/gprunp.i "mcpl" "p" "mc-get-rnd-mthd"
                     "(input so_curr,
                       output rndmthd,
                       output mc-error-number)"}
 
                  if mc-error-number <> 0
                  then do:
                     run DisplayMessage (input mc-error-number,
                                         input 3,
                                         input '').
                     undo CK-CC-HOLD, leave CK-CC-HOLD.
                  end.  /* IF mc-error-number <> 0 */
 
               end. /* IF rndmthd = "" */
 
               /* MANUAL UPDATE OF TRAILER DATA */
               {us/bbi/gprun.i ""rcsoistr.p""
                  "(input sod_nbr,
                    output undo_stat)"}
 
               /* WHEN POSTING FREIGHT WITH LOGISTICS ACCOUNTING WE NEED THE  */
               /* TRANSACTION NUMBER(tr_trnbr)FOR THE "ISS-SO" TRANSACTION.   */
               /* THIS NUMBER IS USED TO RELATE THE TRGL_DET RECORDS CREATED  */
               /* IN LAFRPST.P TO "ISS-SO" TRANSACTION(TR_HIST) RECORD.       */
               /* THERFORE THE FREIGHT ACCRUAL POSTING FOR LOGISTICS ACCTNG   */
               /* IS DONE AFTER SHIPMENTS ARE PROCESSED (I.E.AFTER RCSOIS1A.P */
               /* IS CALLED).                                                 */

               if available so_mstr
               then
                  for first ft_mstr
                     where   ft_domain = global_domain
                     and     ft_terms  = so_fr_terms
                  no-lock:
                  end.
 
               /* POST FREIGHT ACCRUALS - WHEN LOG ACCTG IS NOT ENABLED */
               if gl_amt <> 0
                  and (not use-log-acctg
                        or (use-log-acctg 
                           and available ft_mstr 
                           and ft_type  = "3" 
                                    and ft_lc_charge = ""))
               then do:
                  so_mstr_recid = recid(so_mstr).
                  {us/bbi/gprun.i ""sofrpst.p"" "(input eff_date)"}
               end. /* IF GL_AMT <> 0 */
 
               tot_freight_gl_amt = tot_freight_gl_amt + gl_amt.
 
               if undo_stat then
                  undo CK-CC-HOLD, leave CK-CC-HOLD.
 
            end. /* if last-of(abs_order) */
 
            /* CHECK FOR SALES ORDER HAVING ALL CONSIGNED LINES AND NO       */
            /* TRAILER AMOUNTS AND SET so_to_inv = NO FOR SUCH SALES ORDERS. */
            run  p_set-so-to-invoice (input work_abs_mstr.abs_order,
                                      input work_abs_mstr.abs_line,
                                      input work_abs_mstr.abs_qty,
                                      input work_abs_mstr.abs_consigned_return,
                                      input-output l_so_to_inv).
 
         end. /* for each work_abs_mstr */
 
         /* For Pre-shipper/shipper confirm determines if this order
          * will be processed with a credit card and validate that
          * the credit card info is valid and that the authorized
          * amount is enough to process the order.*/
         if confirm_mode = yes
            and available so_mstr
         then do:
 
            {us/gp/gprunp.i "soccval" "p" "preValidateCCProcessing"
               "(input so_nbr, output errorNbr)"}
 
            if errorNbr <> 0
            then do:
               run DisplayMessage (input errorNbr, input 2, input '').
               /*ORDER PLACED ON HOLD*/
               run DisplayMessage (input 3468, input 2, input '').
               vSOToHold = so_nbr.
            end.
         end. /* IF confirm_mode = YES AND ... */
 
         /* WHILE UNCONFIRMING THE SHIPPER, trq_mstr GETS DELETED  */
         /* IF ASN HAS BEEN EXPORTED OTHERWISE DISPLAY THE WARNING */
         if can-find(btb_det
             where btb_det.btb_domain = global_domain
             and   btb_so       = sod_nbr
             and   btb_sod_line = sod_line)
             and not confirm_mode
         then do:
            run p-del-trq_mstr.
            if l_flag1 = yes then
               undo CK-CC-HOLD, leave CK-CC-HOLD.
         end. /* IF CAN-FIND(btb_det) */
 
         if using_container_charges
         then do:
            /* CREATE THE SALES ORDER DETAIL CONTAINER CHARGE RECORDS */
            {us/gp/gprunmo.i &module = "ACL" &program = ""rcsoiscd.p""
               &param   = """(input abs_shipfrom,
                              input abs_shipto,
                              input ship_dt,
                              input eff_date,
                              input abs_recid,
                              input confirm_mode,
                              input auto_post,
                              input no)"""}
         end.
 
         if using_line_charges
         then do:
            /* EXPLODE SHIPPER TO GET ORDER ADDITIONAL CHARGES DETAIL */
            {us/gp/gprunmo.i &module = "ACL" &program = ""rcsoiscf.p""
               &param   = """(input recid(abs_mstr),
                              input confirm_mode,
                              input no)"""}
         end.
 
         txcalcref = string(abs_mstr.abs_shipfrom,"x(8)") +
                            abs_mstr.abs_id.
 
         if c-application-mode <> "API" then do:
            do on error undo, leave:
               yn = yes.
               /* Is all information correct ? */
               run DisplayMessage1 (input 12, input 1, input-output yn).

               if keyfunction(lastkey) = "END-ERROR"
                  or keyfunction(lastkey) = "F4"
                  or keyfunction(lastkey) = "ENDKEY" then do:

                  undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.
                            
            if not yn 
               or key-function(lastkey) = "END-ERROR"
            then
               undo CK-CC-HOLD, leave CK-CC-HOLD.
            end.
         end.
 
          if confirm_mode
            and brazil_ld
            and can-find (first lgd_mstr
                             where lgd_domain     = global_domain
                             and   lgd_shipper_id = abs_mstr.abs_id
                             and   lgd_shipfrom   = abs_mstr.abs_shipfrom)
         then 
            l_disperr = yes.
         else
            l_disperr = no.

         /* THE POST FLAG IS SET TO 'NO' BECAUSE WE ARE NOT CREATING
          * QUANTUM REGISTER RECORDS FROM THIS CALL TO TXCALC.P */
         run p_taxcal.

         if result-status = 11415
            or (l_disperr
                and not can-find(first tx2d_det
                                  where tx2d_domain  = global_domain
                                  and   tx2d_ref     = txcalcref
                                  and   tx2d_nbr     = work_abs_mstr.abs_order
                                  and  (tx2d_line    = integer(work_abs_mstr.abs_line)
                                     or tx2d_line    = 0)
                                  and   tx2d_tr_type = "14"))
         then do:
            /* TAX DATA IS INCOMPLETE. TAX DETAIL WAS NOT CREATED */
            run DisplayMessage (input 11415, input 3, input '').
            undo ck-cc-hold, leave ck-cc-hold.
         end. /* IF l_tax_status = no */

         /* UPDATE SALES ORDER BALANCE FOR SCHEDULE ORDER */
         if available so_mstr 
            and so_sched 
         then do:
            for each tt_so_mstr
            no-lock:
               for first so_mstr
                  where so_domain = global_domain
                  and   so_nbr    = tt_so_mstr.tt_so_nbr
               no-lock:
               end. /* FOR FIRST so_mstr */

               if available so_mstr
               then do:
                  for first cm_mstr
                     where cm_domain  = global_domain
                     and   cm_addr    = so_bill
                  no-lock:
                  end. /* FOR FIRST cm_mstr */
                  if available cm_mstr
                  then do:
                     /* IF BASE CURRENCY AND CUSTOMER CURRENCY ARE SAME  */
                     /* AND SALES ORDER IN FOREIGN CURRENCY AND          */
                     /* SO_FXIED_RATE = YES THEN UPDATE DEBTOR BALANCE   */
                     /* BASED ON USER ENTERED EXCHANGE RATE              */
                     if (base_curr =  cm_curr and
                        base_curr <> so_curr) and
                        so_fix_rate = yes
                     then do:
                        assign
                           l_ordertotal = getOrderTotal (input so_nbr)
                           l_before_ordertotal = getBeforeOrderTotal(input so_nbr).
                        /* CONVERT THE ORDER TOTAL */
                        {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                           "(input so_curr,
                             input base_curr,
                             input so_ex_rate,
                             input so_ex_rate2,
                             input l_ordertotal,
                             input false,
                             output l_ordertotal,
                             output mc-error-number)"}

                        if mc-error-number <> 0 
                        then
                           {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}

                        {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                           "(input so_curr,
                             input base_curr,
                             input so_ex_rate,
                             input so_ex_rate2,
                             input l_before_ordertotal,
                             input false,
                             output l_before_ordertotal,
                             output mc-error-number)"}
                        if mc-error-number <> 0 
                        then
                           {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}

                        if (l_before_ordertotal - l_ordertotal) <> 0 
                        then
                           /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
                           run updateOpenOrderTotal in hCreditLibrary
                              ( input  so_bill,
                                input  l_before_ordertotal,
                                input  l_OrderTotal,
                                input  cm_curr,
                                output iReturnStatus).
                     end. /* IF base_curr =  cm_curr AND ...  */
                     else
                        /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
                        run updateOpenOrderTotal in hCreditLibrary
                           ( input  so_bill,
                             input  getBeforeOrderTotal(input so_nbr),
                             input  getOrderTotal      (input so_nbr),
                             input  so_curr,
                             output iReturnStatus).

                     /* CLEAR qad_wkfl AFTER UPDATE */
                     run clearSOTotals in hCreditLibrary ( input  so_nbr).
                  end. /* IF AVAILABLE cm_mstr */
               end. /* IF AVAILABLE so_mstr */

            end. /* FOR EACH tt_so_mstr */
         end. /* IF AVAILABLE so_mstr */

         /* IF TRAILER ADDED/MODIFIED/DELETED THEN UPDATE THE BALANCE ACCORDINGLY */
         if available so_mstr 
            and not so_sched
         then do:
            for each ttSoTrls no-lock:
               assign
                  l_new_trl = 0
                  l_Add_Trl_Bal = 0.

               if tt_so_taxable = No 
               then
                  l_Add_Trl_Bal = (tt_so_trl1_amt_n - tt_so_trl1_amt_o) + (tt_so_trl2_amt_n - tt_so_trl2_amt_o) + (tt_so_trl3_amt_n - tt_so_trl3_amt_o).
               else do:
                  l_Add_Trl_Bal = (tt_so_trl1_amt_n - tt_so_trl1_amt_o) + (tt_so_trl2_amt_n - tt_so_trl2_amt_o) + (tt_so_trl3_amt_n - tt_so_trl3_amt_o).

                  for each tx2d_det 
                     where tx2d_domain = global_domain 
                       and tx2d_ref = ttSoTrls.tt_so_nbr 
                       and tx2d_tr_type = "13"
                       and tx2d_trl <> ""
                  no-lock:
                     l_new_trl = l_new_trl + tx2d_tax_amt.
                  end.
                  l_Add_Trl_Bal = l_Add_Trl_Bal + (l_new_trl - tt_trl_tax).
               end.   /* IF tt_so_taxable */

               if l_Add_Trl_Bal <> 0 
               then do:

                  for first cm_mstr
                     where cm_domain = global_domain
                       and cm_addr   = tt_so_bill
                  no-lock:
                  end.

                  for first so_mstr 
                     where so_domain = global_domain
                       and so_nbr = ttSoTrls.tt_so_nbr 
                  no-lock:
                  end.

                  /* IF BASE CURRENCY AND CUSTOMER CURRENCY ARE SAME                */
                  /* AND SALES ORDER IN FOREIGN CURRENCY AND SO_FXIED_RATE = YES    */
                  /* THEN UPDATE DEBTOR BALANCE BASED ON USER ENTERED EXCHANGE RATE */
                  if (base_curr =  cm_curr and
                     base_curr <>  so_curr) and
                     so_fix_rate = yes
                  then do:
                     /* CONVERT THE ORDER TOTAL */
                     {us/gp/gprunp.i "mcpl" "p" "mc-curr-conv"
                        "(input so_curr,
                          input base_curr,
                          input so_ex_rate,
                          input so_ex_rate2,
                          input l_Add_Trl_Bal,
                          input false,
                          output l_Add_Trl_Bal,
                          output mc-error-number)"}

                     if mc-error-number <> 0 then do:
                        {us/bbi/pxmsg.i &MSGNUM=mc-error-number &ERRORLEVEL=2}
                     end.
                     /* UPDATE OPEN ORDER TOTAL IN QAD FINANCIALS */
                     run updateOpenOrderTotal in hCreditLibrary
                        ( input  tt_so_bill,
                          input  0,
                          input  l_Add_Trl_Bal,
                          input  cm_curr,
                          output iReturnStatus).
                  end.  /* IF (base_curr =  cm_curr*/
                  else do:
                     run updateOpenOrderTotal in hCreditLibrary
                     ( input  tt_so_bill,
                       input  0,
                       input  l_Add_Trl_Bal,
                       input  so_curr,
                       output iReturnStatus).
                  end.
               end.   /* IF l_Add_Trl_Bal <> 0 */
            end. /* FOR EACH ttSoTrls*/
         end. /* IF AVAILABLE so_mstr */

         /* Global Shipping: Legal Documents */
         if confirm_mode = no then do:
            /* Remove balance from Fiscal Control */
            for each lgd_mstr
               where lgd_domain = global_domain
               and   lgd_type   = yes
               and   lgd_status <> {&LD_CANCELLED}
               and   lgd_shipper_id = abs_mstr.abs_id
            no-lock use-index lgd_shipper,
               each lgdd_det of lgd_mstr no-lock:

               for each lgdfc_mstr no-lock
                  where lgdfc_domain = global_domain,
                  each lgdfcd_det no-lock
                  where lgdfcd_domain = global_domain and
                        lgdfcd_id = lgdfc_id and
                        lgdfcd_key = lgdd_tax_usage,
                  each lgdfcb_det exclusive-lock
                  where lgdfcb_domain = global_domain and
                        lgdfcb_id = lgdfcd_id and
                        lgdfcb_det.oid_lgdd_det = lgdd_det.oid_lgdd_det:

                  /* Addition */
                  if lgdfcd_op = "1" 
                  then do:
                     if can-find(first lgddl_det
                                 where oid_lgdd_det_prim = lgdd_det.oid_lgdd_det) 
                     then do:
                        /* Subtraction documents linked. Cannot remove from Fiscal Control */
                        {us/bbi/pxmsg.i &MSGNUM=13785 &ERRORLEVEL=1}
                     end.
                     else 
                        delete lgdfcb_det.
                  end.
                  /* Subtraction */
                  else do:
                     for each lgddl_det exclusive-lock
                        where lgddl_det.oid_lgdd_det = lgdd_det.oid_lgdd_det:           
                        for each lgdfcb_add exclusive-lock
                           where lgdfcb_add.lgdfcb_domain = global_domain and
                                 lgdfcb_add.lgdfcb_id = lgdfc_id and
                                 lgdfcb_add.oid_lgdd_det = oid_lgdd_det_prim:
                           lgdfcb_add.lgdfcb_status = "P".
                        end.
                        delete lgddl_det.
                     end.
                     delete lgdfcb_det.
                  end.
               end. /* for each lgdfc_mstr no-lock */                           
            end. /* for each lgd_mstr */
            
            /* Cancel legal document while unconfirming */
            /* Find the existed Legal Document */
            for each lgd_mstr
               where lgd_domain = global_domain
               and   lgd_type   = yes
               and   lgd_status <> {&LD_CANCELLED}
               and   lgd_shipper_id = abs_mstr.abs_id
            exclusive-lock use-index lgd_shipper:
               assign
                  lgd_status = {&LD_CANCELLED}
                  lgd_cancel_date = today
                  lgd_cancel_time = string(time)
                  lgd_cancel_user = global_userid.

               /* Keep the Legal nbr to Work Table for later Legal nbr update to GL */
               {us/gp/gprunp.i "soldxr" "p" "keepLegalDocNbr"
                                "(input lgd_nbr)"}
            end.
         end. /* if confirm_mode = no */
 
         else /* confirm shipper */
         do:
            /* After shipper confirmed, assign Legal doc number */
            {us/bbi/gprun.i ""gpldnbr.p"" "(recid(abs_mstr))"}
            if key-function(lastkey) = "END-ERROR"
            then
               undo CK-CC-HOLD, leave CK-CC-HOLD.
 
            /* Effective and Ship Date is available after shipper confirmed */
            for each lgd_mstr
               where lgd_domain = global_domain
               and   lgd_type   = yes
               and   lgd_status = {&LD_CONFIRMED}
               and   lgd_shipper_id = abs_mstr.abs_id
            exclusive-lock use-index lgd_shipper:
               if lgd_effdate = ? then
                  lgd_effdate = eff_date.

               assign
                  lgd_ship_date  = ship_dt.

            end.
            /* IF FORM CODE IS NOT BRAZIL THEN PRINT LEGAL DOCUMENT */
            if brazil_ld = no then do:
               /* Print Legal doc */
               {us/bbi/gprun.i ""icldprt.p"" "(recid(abs_mstr))"}
            end.
         end. /* else */
 
         /* SWITCH TO INVENTORY DOMAIN IF NECESSARY */
         if change_db
         then do:
            run ip_alias (input ship_db, output l_flag).
            if l_flag then
               undo CK-CC-HOLD, leave CK-CC-HOLD.
         end.
 
         {us/bbi/gprun.i ""gpnxtsq.p"" "(output trlot)" }
 
         /* SWITCH BACK TO SALES ORDER DOMAIN IF NECESSARY */
         if change_db
         then do:
            run ip_alias (input so_db, output l_flag).
            if l_flag then
               undo CK-CC-HOLD, leave CK-CC-HOLD.
         end.
 
         if c-application-mode <> "API" then
            hide frame b no-pause.
 
         run check_somstr.

         l_prtExtRep = yes.

         /* IF BRAZIL LD THEN NOT PRINT INVOICE */
	 /*grc338
         {us/bbi/gprun.i ""rcsois1a.p""
	 */ {us/bbi/gprun.i ""xfrcso1a.p""
            "(input ""so_shipper_confirm"",
              input using_cust_consignment,
              input no,
              input no,
              output undo_stat,
              input-output table temp_somstr,
              input-output temp_so_ship,
              input-output temp_so_qadc01,
              input-output temp_fob,
              input-output temp_shipvia,
              input-output temp_fob_list,
              input-output temp_shipvia_list,
              input-output l_traddr,
              input-output l_qty_iss_rcv)" }

         if undo_stat then
            undo CK-CC-HOLD, leave CK-CC-HOLD.
        end. /* DO TRANSACTION: */

        do transaction:
           assign finTransCommitted = false.

           /*
            * Start financial automatic transaction so that if
            * any errors occur within shipper confirm/unconfirm
            * then financial transaction can also be rolled back
            * along with operational DB transactions.
            */
           if(auto_post) then do:
              /* start the financial transaction */
              run proxy/starttransaction.p (output dataset tFcMEssages,
                                            output finAPIError).
              if finAPIError < 0
              then do:
                /* Start qflib.p - QAD Financials Library running persistently */
                 run mfairunh.p
                   (input  'qflib.p',
                    input  '?',
                    output hQADFinInvPostLib) no-error.
                 run processErrors in hQADFinInvPostLib
                   (input table tFcMessages,
                    input 3).
                 undo, leave.      
              end.
           end. /* if(auto_post) */

           {us/bbi/gprun.i ""rcsois1e.p""
              "(input table tt_somstr,              
                input """",        /* FILE NAME TO SAVE INVOICE POSTING ERRORS */
                input l_prtInstBase, /* PRINT INSTALL BASE REPORT */
                input table temp_somstr,
                input temp_so_ship,
                input temp_so_qadc01,
                input temp_fob,
                input temp_shipvia,
                input temp_fob_list,
                input temp_shipvia_list,
                input l_traddr,
                input l_qty_iss_rcv,
                output undo_stat,
                output table ttisb)" }

         if undo_stat then
            undo CK-CC-HOLD, leave CK-CC-HOLD.

          for each tt_so_notaxdt :
             find so_mstr
                where so_domain = global_domain
                and   so_nbr    = tt_sonum 
                exclusive-lock no-error . 
             if available so_mstr 
             then do: 
                so_tax_date = ?.
                /*DOWN GRADING TO NO LOCK */
                find current so_mstr no-lock.   
             end.  /* IF AVAILABLE so_mstr */ 
          end. /* FOR EACH  tt_so_notaxdt, */

          
        if  yn = yes /* User proceeds with confirm or unconfirm */
         and confirm_mode = no then 
         do:
            if available abs_mstr and substring(abs_status,2,1) <> "y" then do:
               pause 0.
               /* ADDITIONAL PROCESSING FOR LD CANCELLATION */
               {us/bbi/gprun.i ""gpshldcan.p"" "(input abs_mstr.oid_abs_mstr,
                                                 input reason_code,
                                                 output l_continue)"}
               if l_continue = no
               then do:
                     undo CK-CC-HOLD, leave CK-CC-HOLD.
               end. /* IF l_continue = no */
            end.
         end.

        /*
         * Commit financial automatic transaction so that if
         * any errors occur within shipper confirm/unconfirm
         * then financial transaction can also be rolled back
         * along with operational DB transactions.
         */

         if(auto_post) then do: 
             run proxy/committransaction.p (output dataset tFcMEssages,
                                              output finAPIError).
             if finAPIError < 0
               then do:
                /* Start qflib.p - QAD Financials Library running persistently */
                  run mfairunh.p
                   (input  'qflib.p',
                    input  '?',
                    output hQADFinInvPostLib) no-error.
                  run processErrors in hQADFinInvPostLib
                   (input table tFcMessages,
                    input 3).
                  undo, leave.
             end.
             else
                 assign finTransCommitted = true.
         end. /* if(auto_post) */
         finally:
            /*
             * Rollback financial automatic transaction for
             * any errors that occur within shipper confirm/unconfirm
             * so that financial transactions are properly synchronized
             * with the operational DB transactions.
             */
            if auto_post
               and not finTransCommitted 
            then do:
            
               /* INVOICE NOT CREATED. */
               /* USE INVOICE POST AND PRINT TO CREATE IT */ 
               {us/bbi/pxmsg.i &MSGNUM=14434 &ERRORLEVEL=2}

               /* ===================================================== */
               /* End the Financial transaction on the FIN Appserver    */
               /* ===================================================== */
               run proxy/rollbacktransaction.p (output dataset tFcMEssages,
                                                output finAPIError).
               if c-application-mode <> "API"
               then do:
                  undo CK-CC-HOLD, leave CK-CC-HOLD.
               end.
            end. /* IF auto_post */
         end. /* FINALLY */

      end. /* do transaction */

      if fromStage = {&SER-STAGE-CONSUMED} and confirm_mode then do:
         {us/px/pxrun.i &PROC = 'createShipperConfirmShippingHist'
            &PROGRAM='pashphxr.p'
            &HANDLE = ph_pashphxr
            &PARAM = "(input abs_mstr.oid_abs_mstr,
                       input 'RCT-SOR',
                       output oidShphHist)"
            &NOAPPERROR = true
            &CATCHERROR = true}

         {us/px/pxrun.i &PROC = 'updateShippingSerialStage'
            &PROGRAM='pashphxr.p'
            &HANDLE = ph_pashphxr
            &PARAM = "(input oidShphHist,
                       input {&SER-STAGE-ACTIVE})"
            &NOAPPERROR = true
            &CATCHERROR = true}

         {us/px/pxrun.i &PROC = 'returnPack'
                        &PROGRAM='pasopixr.p'
                        &HANDLE = ph_pasopixr
                        &PARAM = "(input abs_mstr.oid_abs_mstr,
                                   input confirm_mode)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

      end.
      /*SO return unconfirm*/
      else if isReturnUnconfirmed then do:

         {us/px/pxrun.i &PROC = 'createShipperConfirmShippingHist'
            &PROGRAM='pashphxr.p'
            &HANDLE = ph_pashphxr
            &PARAM = "(input abs_mstr.oid_abs_mstr,
                       input 'ISS-SO',
                       output oidShphHist)"
            &NOAPPERROR = true
            &CATCHERROR = true}

         {us/px/pxrun.i &PROC = 'updateShippingSerialStage'
            &PROGRAM='pashphxr.p'
            &HANDLE = ph_pashphxr
            &PARAM = "(input oidShphHist,
                       input {&SER-STAGE-CONSUMED})"
            &NOAPPERROR = true
            &CATCHERROR = true}
            {us/px/pxrun.i &PROC = 'returnPack'
                           &PROGRAM='pasopixr.p'
                           &HANDLE = ph_pasopixr
                           &PARAM = "(input abs_mstr.oid_abs_mstr,
                                      input confirm_mode)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
      end.
      else do:
         if fromStage = {&SER-STAGE-CONSUMED} and not confirm_mode then do:
            run populateWeightFromShippingHist(input abs_mstr.oid_abs_mstr).
         end.

         {us/px/pxrun.i &PROC = 'createShipperConfirmShippingHist'
            &PROGRAM='pashphxr.p'
            &HANDLE = ph_pashphxr
            &PARAM = "(input abs_mstr.oid_abs_mstr,
                       input 'ISS-SO',
                       output oidShphHist)"
            &NOAPPERROR = true
            &CATCHERROR = true}

         if fromStage = {&SER-STAGE-CONSUMED} and not confirm_mode then do:

            {us/px/pxrun.i &PROC = 'updateShippingSerialStage'
               &PROGRAM='pashphxr.p'
               &HANDLE = ph_pashphxr
               &PARAM = "(input oidShphHist,
                          input {&SER-STAGE-PICKED})"
               &NOAPPERROR = true
               &CATCHERROR = true}

            {us/px/pxrun.i &PROC = 'updateShippingSerialPackQtyNegative'
               &PROGRAM='pashphxr.p'
               &HANDLE = ph_pashphxr
               &PARAM = "(input oidShphHist)"
               &NOAPPERROR = true
               &CATCHERROR = true}

         end.
         else do:

            {us/px/pxrun.i &PROC = 'updateShippingSerialStage'
               &PROGRAM='pashphxr.p'
               &HANDLE = ph_pashphxr
               &PARAM = "(input oidShphHist,
                          input {&SER-STAGE-CONSUMED})"
               &NOAPPERROR = true
               &CATCHERROR = true}

         end.

         {us/px/pxrun.i &PROC = 'shipPack'
                        &PROGRAM='pasopixr.p'
                        &HANDLE = ph_pasopixr
                        &PARAM = "(input abs_mstr.oid_abs_mstr,
                                   input confirm_mode)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}

      end.

      for each tt_somstr exclusive-lock:
         delete tt_somstr.
      end. /* FOR EACH tt_somstr */
 
      /* PROCEDURE CREATED TO AVOID ACTION SEGMENT ERROR   */
      run p-undo.
 
      if undo_stat
      then do transaction:
 
         /* RESET THE tx2d_det, so_mstr AND sod_det TO PRIOR STATUS */
         /* IN CASE OF AN ERROR                                     */
         run p_undo_records
            (buffer tt_so_mstr,
             input txcalcref).
 
      end. /* IF undo_stat */
 
      if l_undo then
         undo mainloop, retry mainloop.
 
      if undo_stat then
         undo CK-CC-HOLD, leave CK-CC-HOLD.
 
      /* FREIGHT POSTING WITH LOGISTICS ACCOUNTING DISABLED ARE HANDLED */
      /* ABOVE BY SOFRPST.P                                             */
 
      /* POST FREIGHT ACCRUALS WITH LOGISTICS ACCOUNTING ENABLED    */
      run p_PostFreightForLogAcctg.
 
      if available sod_det and not sod_consignment
      then do:
         if can-find(first lotw_wkfl
            where lotw_domain  = global_domain
            and   lotw_mfguser = SessionUniqueID)
         then do:
            for each lotw_wkfl
               where lotw_domain = global_domain
               and   lotw_mfguser = SessionUniqueID
            exclusive-lock:
               delete lotw_wkfl.
            end. /* FOR EACH lotw_wkfl */
         end. /* IF CAN-FIND FIRST(lotw_wkfl) */
      end. /* IF NOT sod_consignment */
 
      /*ADD PROCEDURE TO CLEAR GLOBAL_RECID IF NOT AVAILABLE*/
         /* CHECK IF EXISTING RECORD WITH GLOBAL_RECID */
         find abs_mstr
            where recid(abs_mstr) = global_recid
         no-lock no-error.
         if available abs_mstr and abs_type = "s" 
            and (abs_id begins "p" or abs_id begins "s")
         then do:
            find si_mstr 
               where si_domain = global_domain
               and   si_site   = abs_shipfrom
            no-lock no-error.
            if not available si_mstr 
            then 
               global_recid = ?.
            if abs_domain <> global_domain 
            then 
               global_recid = ?.
         end. /* IF AVAILABLE abs_mstr */
      if available so_mstr
      then
         if not so_sched
         then do:
            run p_wrk_so_calc.
         end. 
 
      global_recid = abs_recid.
      release sod_det.
 
      {us/gp/gprunp.i "soldxr" "p" "updateLegalNumToUnpostedGL"}
 
      /* AT THE END OF THIS BLOCK WHICH MEANS WE ARE OK TO POST */
      l_complete = yes.
   end. /* CK-CC-HOLD */

   if yn = yes then do:  /* User proceeds with confirm or unconfirm */
      /* NOTE: PRINT AND CANCEL FOR ELECTRONIC DOCUMENT MUST BE PROCESSED
       * AFTER THE TRANACTION IS COMMITED TO PREVENT SENDING REQUEST FOR
       * ANY LEGAL DOCUMENT THAT IS ROLLED BACK BY THE SYSTEM.
       */ 
      if confirm_mode then do:
         /* IF BRAZIL AND POSTING IS OK, PRINT LEGAL DOUCMENT (OPTIONALLY
          * PROCESSING ELECTRONIC LD IF APPLICABLE)
          */
         if brazil_ld = yes and auto_post and auto_inv and undo_all = no 
         then do:
            pause 0.
            {us/bbi/gprun.i ""icldprt.p"" "(input abs_recid)"}
         end.
         
         for first lgd_mstr no-lock
            where lgd_domain = global_domain
            and lgd_type = yes
            and lgd_status <> {&LD_CANCELLED}
            and lgd_shipper_id = abs_mstr.abs_id:
          end.
          if available lgd_mstr
             and isSimulCustomized(input lgd_mstr.lgd_shipfrom, 
                               input lgd_mstr.lgd_ship,
                               input lgd_mstr.lgd_tax_usage,
                               input lgd_mstr.lgd_order) then
          do:
             {us/bbi/gprun.i ""gpldsoct.p"" "(input recid(abs_mstr),
                                              output i_err_num)"}
          end.         
      end.
      else /* confirm_mode = no */
      do:
         if available abs_mstr and substring(abs_status,2,1) <> "y" then do:
            pause 0.
            /* ADDITIONAL PROCESSING FOR LD CANCELLATION */
            {us/bbi/gprun.i ""gpshldcan.p"" "(input abs_mstr.oid_abs_mstr,
                                              input reason_code,
                                              output l_continue)"}
         end.
         
          for first lgd_mstr no-lock
            where lgd_domain = global_domain
            and lgd_type = yes
            and lgd_status = {&LD_CANCELLED}
            and lgd_shipper_id = abs_mstr.abs_id:
          end.
          if available lgd_mstr
             and isSimulCustomized(input lgd_mstr.lgd_shipfrom, 
                               input lgd_mstr.lgd_ship,
                               input lgd_mstr.lgd_tax_usage,
                               input lgd_mstr.lgd_order) then
          do:
             {us/bbi/gprun.i ""gpldsocn.p"" "(input recid(abs_mstr),
                                              input reason_code,
                                              output i_err_num)"}
          end.
      end.
   end.

   /* IF CREDIT CARD VALIDATIONS FAILED, PUT THE ORDER ON HOLD */
   /* BEFORE REPEATING THE MAINLOOP.                           */
   if vSOToHold <> ""
   then do transaction:
      run updateSOStatus
         (input vSOToHold).
   end.
 
   if available abs_mstr
   then do:
      /* WMS ALERT */
      /* RECORD OUTBOUND EVENT QXEVENT DB. */
      {us/qx/qxotrign.i
         &EVENT-NAME = 'ShipperConfirm'
         &TABLE-NAME = 'abs_mstr'
         &ROW-ID = string(rowid(abs_mstr))
         &OID = string(abs_mstr.oid_abs_mstr)
         &TRIGGER-TYPE = 'WRITE'}.
   end. /* IF AVAILABLE abs_mstr */

   release abs_mstr.

   /* FORM CODE IS NOT BRAZIL THEN PRINT INVOICE IF POSTING IS OK */
   if brazil_ld = no 
      and auto_post 
      and auto_inv 
      and undo_all = no 
      and yn
      and l_complete
   then do:
      pause 0.
      hide message no-pause.
      /* INVOICE POSTED SUCCESSFULLY...PRINTING THE INVOICE  */
      {us/bbi/pxmsg.i &MSGNUM=25324 &ERRORLEVEL=1}
      if not batchrun then pause 5.

      /* PRINT INVOICES */
      {us/bbi/gprun.i ""rcsopspr.p""}
      
      if l_prtInstBase
         and l_prtExtRep
      then
         {us/bbi/gprun.i ""fsprtisb.p"" "(input table ttisb)"}
   end. /* IF brazil_ld = no */
   run disconnect_vertex.

   /* DO NOT REPEAT WHEN PROCESSING API REQUEST */
   if  c-application-mode = "API" then leave.
 
end. /* mainloop (repeat) */
 
if shipperModified then do:
   {us/px/pxrun.i &PROC = 'removePackingQtyFromAbsMstr'
                  &PROGRAM='pasopixr.p'
                  &HANDLE = ph_pasopixr
                  &PARAM = "(input parentAbsOid,
                             input confirm_mode,
                             input fromStage)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}
   assign
      shipperModified = no
      parentAbsOid    = 0
      isNotUnconfirmed = no.
end.
if isNotUnconfirmed and isReturnUnconfirmed then do:
   {us/px/pxrun.i &PROC = 'clearOrdInfoForSoReturnUnconfirm'
                  &PROGRAM='pasopixr.p'
                  &HANDLE = ph_pasopixr
                  &PARAM = "(input parentAbsOid)"
                  &NOAPPERROR = true
                  &CATCHERROR = true}
end.

run disconnect_vertex.

   /* Clean up invoice post procedure */
   if valid-handle(hQADFinInvPostLib)
   then delete procedure hQADFinInvPostLib.
 
{us/gp/gpdelp.i "soccval" "p"} /*Delete persistent procedure*/
 
{us/gp/gpnbrgen.i}
{us/gp/gpnrseq.i}
 
{us/rc/rctxcal.i}
 
run del-qad-wkfl.

unsubscribe to "p_giveErrorForTaxLD".

if c-application-mode = "API" then
   return {&SUCCESS-RESULT}.
 
PROCEDURE del-qad-wkfl:
/*-----------------------------------------------------------------------
  Purpose:      Clean up qad_wkfl records used for rcsois.p
  Parameters:
  Notes:        Internal procedure created to reduce compile size
 -------------------------------------------------------------------------*/
 
   define buffer qad_wkfl for qad_wkfl.
 
   for each qad_wkfl
       where qad_wkfl.qad_domain = global_domain
        and qad_key3 = "rcsois.p"
        and qad_key4 = SessionUniqueID
   exclusive-lock:
      delete qad_wkfl.
   end.
 
END PROCEDURE.  /* del-qad-wkfl */
 
PROCEDURE p_glcalval:
/*-----------------------------------------------------------------------
  Purpose:      Verifies open GL Period for each site/entity of
                each line item
 
  Parameters:   l_flag
 
  Notes:
 -------------------------------------------------------------------------*/
   define output parameter l_flag like mfc_logical no-undo.
 
   define buffer work_abs_mstr for work_abs_mstr.
   define buffer si_mstr       for si_mstr.
 
   for each work_abs_mstr
      where work_abs_mstr.abs_qty <> work_abs_mstr.abs_ship_qty
        and (work_abs_mstr.abs_id begins "I" or
            work_abs_mstr.abs_id begins "C")
   no-lock:
 
      for first si_mstr
          where si_mstr.si_domain = global_domain
           and  si_site = work_abs_mstr.abs_site
      no-lock: end.
 
      if available si_mstr
      then do:
 
         /* CHECK GL EFFECTIVE DATE */
         {us/gp/gpglef01.i ""IC"" si_entity eff_date}
 
         if gpglef > 0
         then do:
            run DisplayMessage (input gpglef, input 4, input si_entity).
            l_flag = yes.
            return.
         end. /* IF GPGLEF > 0 */
 
         else do:
 
            /* CHECK GL EFFECTIVE DATE */
            {us/gp/gpglef01.i ""SO"" si_entity eff_date}
 
            if gpglef > 0
            then do:
               run DisplayMessage (input gpglef, input 4, input si_entity).
               l_flag = yes.
               return.
            end. /* IF GPGLEF > 0 */
 
         end. /* ELSE IF GPGLEF = 0 */
 
      end. /* IF AVAILABLE SI_MSTR */
 
   end. /* FOR EACH WORK_ABS_MSTR */
 
END PROCEDURE.  /* p_glcalval */
 
PROCEDURE ip_alias:
/*-----------------------------------------------------------------------
  Purpose:      Establish an Alias for a particular db
 
  Parameters:   i_db          Name of the database
                o_err_flag    If true, then database alias not established
  Notes:
 -------------------------------------------------------------------------*/
   define input  parameter i_db       like global_db no-undo.
   define output parameter o_err_flag as   logical   no-undo.
   define variable         v_err_num  as   integer   no-undo.
 
   {us/bbi/gprun.i ""gpalias3.p"" "(i_db, output v_err_num)" }
 
   o_err_flag = v_err_num = 2 or v_err_num = 3.
 
   if o_err_flag
   then do:
      /* Domain # is not available */
      run DisplayMessage (input 6137, input 4, input i_db).
   end.
 
END PROCEDURE.  /* ip_alias */
 
PROCEDURE updateSOStatus:
/*-----------------------------------------------------------------------
  Purpose:      Set the so_stat field of a Sales Order to the value of
                ccc_cc_hold_status
  Parameters:   pSONbr - Sales Order Number
  Notes:        added by N06R for Net.Commerce
 -------------------------------------------------------------------------*/
   define input parameter pSONbr as character no-undo.
 
   define buffer ccc_ctrl for ccc_ctrl.
   define buffer so_mstr  for so_mstr.
 
   for first ccc_ctrl
      where ccc_ctrl.ccc_domain = global_domain
   no-lock:
 
      for first so_mstr
          where so_mstr.so_domain = global_domain
           and  so_mstr.so_nbr = pSONbr
           and  so_mstr.so_compl_stat = ""
      exclusive-lock:
         so_stat = ccc_cc_hold_status.
      end.
 
      release so_mstr.
 
   end.
 
END PROCEDURE.
 
PROCEDURE p-qadwkfl:
/*-----------------------------------------------------------------------
  Purpose:
  Parameters:   <None>
  Notes:
 -------------------------------------------------------------------------*/
 
   define buffer work_abs_mstr for work_abs_mstr.
   define buffer qad_wkfl      for qad_wkfl.
 
   for each work_abs_mstr
   exclusive-lock:
 
      if work_abs_mstr.abs_order <> ""
      then do:
 
         for first qad_wkfl
             where qad_wkfl.qad_domain = global_domain
               and qad_key1 = "rcsois.p"
               and qad_key2 = work_abs_mstr.abs_order
         no-lock: end.
 
         if available qad_wkfl
            and qad_wkfl.qad_key4 <> SessionUniqueID
         then do:
            /* SALES ORDER # IS BEING CONFIRMED BY USER # */
            {us/bbi/pxmsg.i &MSGNUM=2262 &ERRORLEVEL=3
                     &MSGARG1=qad_key2
                     &MSGARG2=qad_charfld[1]}
            l_undoflg = yes.
         end.  /* IF AVAILABLE qad_wkfl */
 
         else
         if not available qad_wkfl
         then do:
 
            create qad_wkfl.
            assign
               qad_domain     = global_domain
               qad_key1       = "rcsois.p"
               qad_key2       = work_abs_mstr.abs_order
               qad_key3       = "rcsois.p"
               qad_key4       = SessionUniqueID
               qad_charfld[1] = global_userid
               qad_charfld[2] = work_abs_mstr.abs_par_id
               qad_charfld[3] = work_abs_mstr.abs_shipfrom
               qad_date[1]    = today
               qad_charfld[5] = string(time, "hh:mm:ss").
 
            if recid(qad_wkfl) = -1
            then
               .
 
         end.  /* IF NOT AVAILABLE qad_wkfl */
 
      end. /* IF abs_order <> "" */
 
      assign
         work_abs_mstr.abs_ship_qty = 0.
 
   end.  /* FOR EACH work_abs_mstr */
 
END PROCEDURE.
 
PROCEDURE p-del-trq_mstr:
   define buffer trq_mstr for trq_mstr.
 
   find first trq_mstr
      where trq_domain   = global_domain          and
            trq_doc_type = "ASN"                  and
            trq_doc_ref  =  abs_mstr.abs_shipfrom and
            trq_add_ref  =  trim("s" +
                            substring(abs_mstr.abs__qad01,41,20))
   exclusive-lock no-error.
 
   if available trq_mstr
   then
      delete trq_mstr.
   else do:
 
      if c-application-mode <> "API" then do:
 
         yn = no.
 
         /* This is an EMT Shipper. The ASN is already transmitted. */
         run DisplayMessage (input 4391, input 1, input '').
         /* Continue with Unconfirm ? */
         run DisplayMessage1 (input 5987, input 1, input-output yn).
 
         if yn = no then
            l_flag1 = yes.
         else
            l_flag1 = no.
      end.
 
      /* UNCONFIRM SHIPPIER IN API MODE */
      else
         l_flag1 = no.
 
   end. /* ELSE DO */
 
END PROCEDURE. /*PROCEDURE p-del-trq_mstr */
 
PROCEDURE p-undo :
/*-----------------------------------------------------------------------
  Purpose: To avoid Action segment error .
  Parameters:   <None>
  Notes:
 -------------------------------------------------------------------------*/
 
   if l_undo then do:
      if c-application-mode <> "API" and not batchrun then
         pause.
   end. /* IF l_undo */
 
END PROCEDURE.
 
/* INTERNAL PROCEDURES changeShipperNumberInLogAcctDetail AND          */
/*   validateSOForLogisticsAccounting ARE DEFINED IN larcsois.i        */
{us/rc/rcsoisla.i}
 
PROCEDURE DisplayMessage:
   define input parameter ipMsgNum as integer no-undo.
   define input parameter ipLevel  as integer no-undo.
   define input parameter ipMsg1   as character no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=ipMsgNum &ERRORLEVEL=ipLevel &MSGARG1=ipMsg1}
 
END PROCEDURE.
 
PROCEDURE p_InitializeTempTableWorkLdd:
   for each work_ldd
   exclusive-lock:
      delete work_ldd.
   end. /* FOR EACH work_ldd */
END PROCEDURE. /* p_InitializeTempTableWorkLdd */
 
PROCEDURE p_PostFreightForLogAcctg:
 
   if use-log-acctg
      and l_calc_freight
      and tot_freight_gl_amt <> 0
   then do:
 
      /* IF LOGISTICS ACCOUNTING IS ENABLED THEN CREATE PENDING VOUCHER */
      /* MASTER AND DETAIL RECORDS AND POST THE FREIGHT TO THE GL.      */
      {us/gp/gprunmo.i &module  = "LA" &program = "lafrpst.p"
                 &param   = """(input '{&TYPE_SOShipper}',
                                input substring(abs_mstr.abs_id,2),
                                input if l_is_mutiple_so then '' else l_first_so_nbr, /*EXT-RF*/
                                input abs_mstr.abs_shp_date,
                                input eff_date,
                                input abs_mstr.abs_shipto,   /* SHIP-TO */
                                input '{&TYPE_SO}',
                                input first_so_curr,
                                input first_so_ex_rate,
                                input first_so_ex_rate2,
                                input ' ',  /* BLANK PVO_EX_RATETYPE */
                                input first_so_exru_seq,
                                input first_so_cust)"""}
 
   end. /* IF USE-LOG-ACCTG AND ... */
END PROCEDURE. /*    p_PostFreightForLogAcctg */
 
PROCEDURE getControlFiles:
 
   define        parameter buffer gl_ctrl              for gl_ctrl.
   define        parameter buffer shc_ctrl             for shc_ctrl.
   define input  parameter enable_customer_consignment as character no-undo.
   define input  parameter adg                         as character no-undo.
   define input  parameter cust_consign_ctrl_table     as character no-undo.
   define output parameter use-log-acctg               as logical   no-undo.
   define output parameter using_cust_consignment      as logical   no-undo.
   define output parameter auto_post                   as logical   no-undo.
   define output parameter auto_inv                    as logical   no-undo.
   define output parameter consolidate                 as logical   no-undo.
 
   /* CHECK IF LOGISTICS ACCOUNTING IS ENABLED */
   {us/bbi/gprun.i ""lactrl.p"" "(output use-log-acctg)"}
 
   for first gl_ctrl
      where gl_ctrl.gl_domain = global_domain
   no-lock: end.
 
   /* CREATE SHIPPER CONTROL IF NOT FOUND */
   {us/bbi/gprun.i ""socrshc.p""}
 
   for first shc_ctrl
      where shc_ctrl.shc_domain = global_domain
   no-lock: end.
 
   /* CREATE rcc_ctrl FILE RECORDS IF NECESSARY */
   {us/bbi/gprun.i ""rcpma.p""}
 
   /* DETERMINE IF CUSTOMER CONSIGNMENT IS ACTIVE */
   {us/bbi/gprun.i ""gpmfc01.p""
      "(input ENABLE_CUSTOMER_CONSIGNMENT,
        input 10,
        input ADG,
        input CUST_CONSIGN_CTRL_TABLE,
        output using_cust_consignment)"}
 
   /* FIND mfc_ctrl RECORDS FOR rcc_variables */
   for first mfc_ctrl
      where mfc_ctrl.mfc_domain = global_domain
       and  mfc_field = "rcc_auto_post"
   no-lock:
      auto_post = mfc_logical.
   end. /* FOR FIRST MFC_CTRL */
 
   for first mfc_ctrl
       where mfc_ctrl.mfc_domain = global_domain
        and  mfc_field = "rcc_auto_inv"
   no-lock:
      auto_inv = mfc_logical.
   end. /* FOR FIRST mfc_ctrl */
 
   for first mfc_ctrl
       where mfc_ctrl.mfc_domain = global_domain
        and  mfc_field = "rcc_consolidate"
   no-lock:
      consolidate = mfc_logical.
   end. /* FOR FIRST MFC_CTRL */
 
   /* When Separate Invoices for Each Shipment is set as Yes,
      Consolidation of Invoice flag is forced to be disabled with Yes */
   if shc_ctrl.shc_check_ship_pending then do:
      assign
         l_disable_con = yes
         consolidate   = yes.
    end.
END PROCEDURE.   /* getControlFiles */

PROCEDURE getDefaultConsolidate:
/*-----------------------------------------------------------------------
   Purpose: To get the default value of consolidate.
   Parameters: abs_mstr
               shc_ctrl
               consolidate
   Notes:
   -------------------------------------------------------------------------*/
   define        parameter buffer abs_mstr             for  abs_mstr.
   define        parameter buffer shc_ctrl             for  shc_ctrl.
   define output parameter        consolidate          as   logical   no-undo.

   define        variable         l_multi_consolidate  as   logical   no-undo.
   define        variable         l_temp_consolidate   as   logical   no-undo.
   define        variable         i_so_amount          as   integer   no-undo.
   define        buffer           b_abs_mstr           for  abs_mstr.
   define        buffer           b_so_mstr            for  so_mstr.
   define        buffer           b_cm_mstr            for  cm_mstr.

   consolidate = no.  /* set it to no, then read the configure */
   for-abs-so-mstr:
   for each b_abs_mstr no-lock
       where b_abs_mstr.abs_domain   = global_domain
        and  b_abs_mstr.abs_shipfrom = abs_mstr.abs_shipfrom
        and  b_abs_mstr.abs_par_id   = abs_mstr.abs_id:
      for first b_so_mstr no-lock
          where b_so_mstr.so_domain = global_domain 
           and  b_so_mstr.so_nbr    = b_abs_mstr.abs_order: 
         for first b_cm_mstr no-lock
             where b_cm_mstr.cm_domain = global_domain
              and  b_cm_mstr.cm_addr   = b_so_mstr.so_cust:
            i_so_amount = i_so_amount + 1.
            if i_so_amount = 1 then do:
               l_temp_consolidate = b_cm_mstr.cm_cons_inv.
            end.
            else if l_temp_consolidate <> b_cm_mstr.cm_cons_inv then do:
               l_multi_consolidate = yes.
               leave for-abs-so-mstr.
            end.
         end.  /* FOR FIRST b_cm_mstr */
      end.  /* FOR FIRST b_so_mstr */
   end. /* FOR EACH b_abs_mstr */

   /* When multi "Sold-to"s for the current single shipper (but with the same "Ship-to",
    and the customer settings are not the same, it gets the default from the global setting. */
   if not l_multi_consolidate then do:
     /* When Separate Invoices for Each Shipment is set as Yes,
        Consolidation of Invoice flag is forced to be disabled with Yes */
      if shc_ctrl.shc_check_ship_pending then do:
         consolidate   = yes.
      end.

      if not consolidate then do:
         for first b_cm_mstr
             where b_cm_mstr.cm_domain = global_domain
              and  b_cm_mstr.cm_addr = abs_mstr.abs_shipto
         no-lock:
            consolidate = b_cm_mstr.cm_cons_inv.
         end.
      end.
   end.
   else do:
      for first mfc_ctrl
          where mfc_ctrl.mfc_domain = global_domain
           and  mfc_ctrl.mfc_field = "rcc_consolidate"
      no-lock:
          consolidate = mfc_ctrl.mfc_logical.
      end.
   end.

END PROCEDURE.  /* getDefaultConsolidate */
 
PROCEDURE createImpExpHist:
 
   define parameter buffer sod_det for sod_det.
   define input parameter sod_qty_chg like sod_qty_chg no-undo.
   define input parameter p_absmstrid like abs_mstr.abs_id no-undo.
   define input parameter eff_date as date no-undo.
 
   if can-find(iec_ctrl where iec_ctrl.iec_domain = global_domain and
                                       iec_use_instat = yes)
   then do:
 
      /* CREATE IMPORT EXPORT HISTORY RECORD */
      {us/bbi/gprun.i ""iehistso.p"" "(buffer sod_det,
                                input sod_qty_chg,
                input substring(p_absmstrid,2),
                input 0,
                                input eff_date,
                                input ""SHIP"")"}
   end.
 
END PROCEDURE.   /* createImpExpHist */
 
PROCEDURE find_auto_post:
/*-----------------------------------------------------------------------
   Purpose:      To find auto_post.
 
   Parameters:   1. output  o_auto_post - logical if invoice auto post
 
   Note:         Procedure created to remove Error "Action Segment has exceeded
                 its limit of 63488 bytes".
-------------------------------------------------------------------------*/
 
   define input-output parameter o_auto_post like mfc_logical no-undo.
 
   for first work_abs_mstr
      where work_abs_mstr.abs_id begins "I"
   no-lock:
 
      if work_abs_mstr.abs_order <> ""
      then do:
 
         for first scx_ref
            where scx_ref.scx_domain = global_domain
              and scx_type  = 1
              and scx_order = abs_order
         no-lock: end.
      end. /* IF ABS_ORDER <> "" */
 
      else
      for first scx_ref
          where scx_domain = global_domain
            and scx_type     = 1
            and scx_shipfrom = abs_shipfrom
            and scx_shipto   = abs_shipto
      no-lock: end.
   end. /* FOR FIRST work_abs_mstr */
 
   if available scx_ref then
      for first so_mstr
         where so_domain = global_domain
           and so_nbr = scx_order
           and so_compl_stat = ""
      no-lock:
         o_auto_post  = substring(so_inv_mthd,2,1) = "y".
      end.
 
END PROCEDURE.
 
PROCEDURE calculate_freight_charge:
/*-----------------------------------------------------------------------
   Purpose:      To calculate freight charge
 
   Parameters:   1. Buffer so_mstr
                 2. input i_l_calc_freight  - logical if freight is to be calculated
 
   Note:         Procedure created to remove Error "Action Segment has exceeded
                 its limit of 63488 bytes".
-------------------------------------------------------------------------*/
 
   define       parameter buffer so_mstr for so_mstr.
   define input parameter i_l_calc_freight like mfc_logical no-undo.
   define input parameter i_asn like abs_mstr.abs_id no-undo.
 
   if so_mstr.so_fr_terms <> ""
       and i_l_calc_freight
   then do:
 
      /*CALCULATE FREIGHT CHARGES*/
      for first ft_mstr
         where ft_mstr.ft_domain = global_domain
          and  ft_terms = so_fr_terms
      no-lock:
          old_ft_type = ft_type.
      end. /* FOR FIRST FT_MSTR */
 
      so_mstr_recid = recid(so_mstr).
 
      /* FREIGHT CHARGE AND WEIGHT CALC FOR SHIPMENTS */
      {us/bbi/gprun.i ""sofrcals.p""
         "(input table tt_sod_det,
           input i_asn)"}
 
      for each tt_sod_det
      exclusive-lock:
         delete tt_sod_det.
      end. /* FOR EACH tt_sod_det */
 
      if not freight_ok
      then do:
         /* Freight error detected - */
         run DisplayMessage (input 669, input 2, input '').
         if c-application-mode <> "API" then
            pause.
      end.
 
   end. /* IF SO_FR_TERMS <> "" AND i_L_CALC_FREIGHT */
 
END PROCEDURE.
 
PROCEDURE woValidate:
 
   define input  parameter ip_sod_lot    like sod_lot     no-undo.
   define input  parameter ip_sod_fa_nbr like sod_fa_nbr  no-undo.
   define output parameter op_wo_reject  like mfc_logical no-undo.
 
   op_wo_reject = no.
 
   if ip_sod_lot <> ""
   then do:
 
      for first wo_mstr
         where wo_domain = global_domain
           and wo_lot    = ip_sod_lot
         no-lock:
      end. /* FOR FIRST wo_mstr */
 
      if available wo_mstr
      and lookup(wo_status, "A,R,C") = 0
      then
         op_wo_reject = yes.
 
   end. /* IF ip_sod_lot <> "" */
 
   else do:
 
      if ip_sod_fa_nbr <> ""
      then do:
 
         for first wo_mstr
            where wo_domain                = global_domain
              and wo_nbr                   = ip_sod_fa_nbr
              and lookup(wo_status, "A,R,C") = 0
            no-lock:
         end. /* FOR FIRST wo_mstr */
 
         if available wo_mstr
         then
            op_wo_reject = yes.
 
      end. /* IF ip_sod_fa_nbr <> "" */
 
   end. /* ELSE */
 
   if op_wo_reject = yes
   then do:
      /* WORK ORDER ID IS CLOSED, PLANNED OR */
      /* FIRM PLANNED                        */
      run DisplayMessage (input 523, input 4, input ":" + wo_nbr).
      /* CURRENT WORK ORDER STATUS: */
      run DisplayMessage (input 525, input 1, input wo_status).
   end. /* IF l_wo_reject = yes */
 
END PROCEDURE.  /* woValidate */
 
PROCEDURE CheckWOAndCMF:
 
   define input        parameter ip_abs_order like abs_mstr.abs_order no-undo.
   define input        parameter ip_abs_line  like abs_mstr.abs_line  no-undo.
   define output       parameter op_wo_reject like mfc_logical        no-undo.
   define output       parameter op_undo_var  like mfc_logical        no-undo.
   define input-output parameter io_que-doc   like mfc_logical        no-undo.
 
   define variable               l_woreject   like mfc_logical        no-undo.
 
   assign
      op_wo_reject = no
      op_undo_var  = no.
 
   for first so_mstr
       where so_mstr.so_domain = global_domain
        and  so_nbr = ip_abs_order
        and  so_compl_stat = ""
      no-lock:
   end. /* FOR FIRST so_mstr */
 
   for first sod_det
       where sod_domain = global_domain
         and sod_nbr  = ip_abs_order
         and sod_line = integer(ip_abs_line)
         and sod_compl_stat = ""
      no-lock:
   end. /* FOR FIRST sod_det */
 
   /* CHECK IF WORK ORDER IS RELEASED OR ALLOCATED */
   /* FOR ATO CONFIGURED ITEMS                     */
 
   if available sod_det
   then do:
 
      /* CHECK WO STATUS */
      run woValidate(input  sod_lot,
                     input  sod_fa_nbr,
                     output l_woreject).
 
      if l_woreject = yes
      then do:
         op_wo_reject = yes.
         return.
      end. /* IF l_woreject = yes */
 
   end. /* IF AVAILABLE sod_det */
 
   if available so_mstr
      and available sod_det
   then
      if not so_secondary
   then
      for first cmf_mstr
          where cmf_mstr.cmf_domain = global_domain
           and (cmf_doc_type = "PO"
           and cmf_doc_ref  = sod_btb_po
           and (cmf_status   = "1" or
                cmf_status   = "2" or
                cmf_status   = "3"   ) )
         no-lock:
      end. /* FOR FIRST cmf_mstr */
 
   else do:
 
      for first cmf_mstr
          where cmf_mstr.cmf_domain = global_domain
            and cmf_doc_type        = "SO"
            and cmf_doc_ref         = so_nbr
            and cmf_status          = "1"
      no-lock:
 
         for first cmd_det
             where cmd_det.cmd_domain = global_domain
               and (cmd_trans_nbr     = cmf_trans_nbr
               and cmd_key_val        = so_nbr + "," + string(sod_line)
               and (cmd_field         = "sod_due_date" or
                    cmd_field         = "sod_qty_ord" ) )
         no-lock:
            change-queued = yes.
         end. /* FOR FIRST cmd_det */
 
      end. /* FOR FIRST cmf_mstr */
 
   end. /* ELSE */
 
   if available so_mstr
   and ((not so_secondary
   and available cmf_mstr )
   or (so_secondary and change-queued ))
   then do:
      /* CHANGE ON EMT SO WITH PENDING CHANGE IS NOT ALLOWED */
      run DisplayMessage (input 2834, input 3, input '').
      assign op_undo_var = yes.
      return.
   end. /* IF AVAILABLE so_mstr */
 
   /* THIS IS THE NORMAL SHIPMENT OF A SALES ORDER THUS */
   /* WE ONLY QUEUE A DOCUMENT IF THIS IS THE SECONDARY */
   /* SO BECAUSE FOR THE PRIMARY SO THIS CORRESPONDS TO */
   /* THE SHIPMENT OF A NORMAL SO AND NO DOCUMENT WILL  */
   /* BE QUEUED.                                        */
 
   /* THIS IS DIFFERENT IN THE PROGRAM rcsois2.p !!!!!!! */
   if available so_mstr
   and so_secondary
   and not io_que-doc
   then
      io_que-doc = yes.
 
END PROCEDURE.  /* CheckWOAndCMF */
 
PROCEDURE p_undo_records:
   define parameter buffer tt_so_mstr   for tt_so_mstr.
   define input  parameter p_txcalcref  like tx2d_ref no-undo.
 
   /* DELETE THE tx2d_det RECORDS IN CASE OF AN ERROR  WHEN THE TYPE */
   /* IS SO SHIPPER MAINTENANCE AND RESET sod_qty_chg TO ZERO        */
 
   for each tx2d_det exclusive-lock
      where tx2d_domain  = global_domain
      and   tx2d_ref     = p_txcalcref
      and   tx2d_tr_type = "14":
 
      /* RESET THE so_mstr FIELDS IN CASE OF AN ERROR */
      find first so_mstr
         where so_domain = global_domain
         and   so_nbr    = tx2d_nbr
         and   so_compl_stat = ""
         exclusive-lock.
      if available so_mstr
      then do:
 
         for first tt_so_mstr
            where tt_so_mstr.tt_so_nbr = so_nbr
         no-lock:
            assign
               so_to_inv    = tt_so_mstr.tt_so_to_inv
               so_ship_date = tt_so_mstr.tt_so_ship_date
               so_tax_date  = tt_so_mstr.tt_so_tax_date
               so_bol       = tt_so_mstr.tt_so_bol
               so__qadc01   = tt_so_mstr.tt_so__qadc01.
         end. /* for first tt_so_mstr */
 
      end. /* if available so_mstr */
      release so_mstr.
 
      for each sod_det exclusive-lock
         where sod_domain = global_domain
         and   sod_nbr    = tx2d_nbr
         and  (sod_line   = tx2d_line or tx2d_line  = 0)
         and   sod_compl_stat = "":
 
         sod_qty_chg = 0.
 
         {us/bbi/gprun.i ""txcalc.p""
            "(input  '13',
              input  sod_nbr,
              input  '',
              input  if tx2d_line = 0
                     then
                        0
                     else
                        sod_line,
              input  no,
              output return_status)"}
 
      end. /* FOR EACH sod_det */
 
      delete tx2d_det.
 
   end. /* FOR EACH tx2d_det */
 
END PROCEDURE. /* PROCEDURE p_undo_records */
 
{us/so/sotoinv.i}
 
PROCEDURE DisplayMessage1:
   define input        parameter pMsgNum   as   integer     no-undo.
   define input        parameter pLevel    as   integer     no-undo.
   define input-output parameter pconfirm  like mfc_logical no-undo.
 
   {us/bbi/pxmsg.i &MSGNUM=pmsgnum &ERRORLEVEL=plevel &CONFIRM=pconfirm}
 
END PROCEDURE.
 
PROCEDURE proc-archeck:
   define input-output parameter auto_post       like mfc_logical no-undo.
   define input-output parameter l_auto_noupdate like mfc_logical no-undo.
 
   if can-find(sbic_ctl
         where sbic_domain = global_domain
           and sbic_active = yes)
      then do:
          if can-find(soc_ctrl
              where soc_domain = global_domain
                and soc_ar     = no)
          then
             assign
                auto_post       = no
                l_auto_noupdate = yes.
 
   end. /* IF CAN-FIND(sbic_ctl) */
 
END PROCEDURE.
 
PROCEDURE connect_vertex :
 
   /* RUN vqregopn.p TO SEE IF VERTEX SUTI API IS RUNNING, */
   /* AND THEN OPEN REGISTER DB                            */
 
   /* TRY AND FIND VERTEX TAX API'S PROCEDURE HANDLE. */
   {us/gp/gpfindph.i vqapi l_api_handle}
 
   /* IF THERE IS NO PROCEDURE HANDLE WE ARE DONE. */
   if  auto_post
   /*grc338*
   and execname = "rcsois.p"
   */
   and execname = "xfrcsois.p"
   and l_api_handle <> ?
   then do:
 
      {us/bbi/gprun.i ""vqregopn.p"" "(output result-status)"}
 
      if c-application-mode <> "API" then
         hide message.
 
      if result-status = 0
      then
         l_vq_reg_db_open = yes.
 
      if  result-status <> 0
      then do:
 
         /* INVOICES WILL POST TO MFG/PRO BUT NOT UPDATE THE VERTEX */
         /* REGISTER */
         run DisplayMessage (input 8880, input 1, input '').
 
         if c-application-mode <> "API" then do:
            /* CONTINUE WITH INVOICE POST? */
            run DisplayMessage1 (input 8881, input 1, input-output l_cont).
            if l_cont = no then
               return error.
         end.
 
      end. /* IF  result-status <> 0... */
 
      if  result-status <> 0
      then do:
         do transaction:
 
            create qad_wkfl.
            assign
               qad_domain = global_domain
               qad_key1   = "l_vertex_message"
               qad_key2   = "yes"
               qad_key3   = "rcsois.p"
               qad_key4   = SessionUniqueID.
 
            if recid(qad_wkfl) = -1 then .
 
         end. /* DO TRANSACTION */
 
      end. /* IF  result-status <> 0 */
 
   end. /* IF l_api_handle */
 
END PROCEDURE. /* connect_vertex */
 
PROCEDURE disconnect_vertex:
 
   /* CHECK IF VERTEX REGISTER DB WAS OPENED */
   if l_vq_reg_db_open
   then do:
      {us/bbi/gprun.i ""vqregcls.p""}
      l_vq_reg_db_open = no.
   end. /* IF l_vq_reg_db_open */
 
END PROCEDURE. /* disconnect_vertex */
 
PROCEDURE check_somstr:
   for each tt_somstr:
      for first so_mstr
         where so_domain = global_domain
           and so_nbr    = tt_sonbr
           and so_compl_stat = ""
      exclusive-lock:
            so_to_inv = tt_sotoinv.
      end. /* FOR FIRST so_mstr */
      release so_mstr.
   end. /* FOR EACH tt_somstr */
END PROCEDURE. /* check_somstr */
 
PROCEDURE saveDaybookSet:
/*---------------------------------------------------------------
    Purpose: Saves a daybookset against a sales order.
 Parameters: <input>
             pcSoNbr      - Used to find the Sales Order.
             pcDaybookSet - Daybookset which needs to be saved.
      Notes:
---------------------------------------------------------------*/
   define input parameter pcSoNbr      as character no-undo.
   define input parameter pcDaybookSet as character no-undo.
   define buffer bsomstr  for so_mstr.
 
   for first bsomstr
      where so_domain = global_domain
       and so_nbr     = pcSoNbr
       and so_compl_stat = ""
   exclusive-lock:
      if pcDaybookSet <> "" and so_daybookset <> pcDaybookSet
      then do:
         assign
            so_daybookset = pcDaybookSet.
       end.
    end.
END PROCEDURE.
 
PROCEDURE chk_shipto_prefix:
   define input parameter p_abs_shipfrom like abs_mstr.abs_shipfrom no-undo.
   define input parameter p_abs_id       like abs_mstr.abs_id       no-undo.
   define buffer b_abs_mstr for abs_mstr.
 
   find first b_abs_mstr
      where abs_domain   = global_domain
      and   abs_shipfrom = p_abs_shipfrom
      and   abs_id       = p_abs_id
   exclusive-lock no-wait no-error.
 
   if available b_abs_mstr
      and abs__qad05 <> abs_shipto
   then do:
       for first ad_mstr where ad_domain = abs_domain
          and ad_addr   = abs_shipto
       no-lock: end.
 
       if not available ad_mstr
       then do:
          for first ad_mstr where ad_domain = abs_domain
             and  ad_addr   = abs__qad05
          no-lock:
             abs_shipto = ad_addr.
          end. /* FOR FIRST ad_mstr */
       end. /* IF NOT AVAILABLE ad_mstr */
 
    end. /* IF NOT AVAILABLE b_abs_mstr */
 
END PROCEDURE. /* chk_shipto_prefix */
 
PROCEDURE abs_audit:
   define variable l_msg as character format "x(80)" no-undo.
 
   /* SHIPPER NOT CONFIRMED. PLEASE CHECK 'shipper.err' FOR DETAILS. */
   {us/bbi/pxmsg.i &MSGNUM=7640 &ERRORLEVEL=2}
 
   /* NO MATCHING SALES ORDER/LINE FOR FOLLOWING ITEMS IN SHIPPER # */
   {us/bbi/pxmsg.i &MSGNUM=7642 &ERRORLEVEL=1
            &MSGARG1=substring(abs_mstr.abs_id,2,20)
            &MSGBUFFER=l_msg}.
 
   output stream abs to "shipper.err".
 
   put stream abs l_msg.
 
   for each work_abs_mstr
      where work_abs_mstr.abs_id begins "ic"
         or work_abs_mstr.abs_id begins "is"
   no-lock:
      display stream abs
         work_abs_mstr.abs_item
         work_abs_mstr.abs_qty
         work_abs_mstr.abs_site
         work_abs_mstr.abs_loc
         work_abs_mstr.abs_lotser
         work_abs_mstr.abs_ref.
   end. /* FOR EACH work_abs_mstr */
 
   output stream abs close.
 
END PROCEDURE. /* END abs_audit */
 
/*----------------------------------------------------------------------------*/
PROCEDURE getABFieldDefaults:
/*----------------------------------------------------------------------------*/
   define input-output parameter opShipTime as character no-undo.
   define input-output parameter opArrDate as date no-undo.
   define input-output parameter opArrTime as character no-undo.
   define input        parameter table for tt_validation_fields.
 
   for each tt_validation_fields no-lock:
      if tt_shphv_field = "shp_time"          /* SHIPMENT TIME */
      then
         opShipTime = tt_shphv_default.
      else
      if tt_shphv_field = "arr_date"          /* ARRIVAL DATE */
      then
         opArrDate = date(tt_shphv_default).
      else
      if tt_shphv_field = "arr_time"          /* ARRIVAL TIME */
      then
         opArrTime = tt_shphv_default.
   end.
 
END PROCEDURE. /* getABFieldDefaults */
 
FUNCTION isSimulMismatched returns logical(
   input p_shipfrom as character,
   input p_shipto   as character):
 
   define variable c_last_shipto      as character   no-undo.
   define variable l_last_simul       as logical     no-undo.
   define variable c_shipto           as character   no-undo.
   define variable l_simul            as logical     no-undo.
   define variable l_first_order      as logical     no-undo.
 
   l_first_order = yes.
 
   for each work_abs_mstr no-lock,
      each sod_det where sod_domain = global_domain
      and sod_nbr = abs_order
      and sod_line = integer(abs_line)
      and sod_compl_stat = "" no-lock
   break by sod_nbr:
      if first-of(sod_nbr) then do:
         for first so_mstr where so_domain = global_domain
            and so_nbr = sod_nbr
            and so_compl_stat = "" no-lock:
         end.
 
         assign
            l_simul  = no
            c_shipto = "".
 
         for first lgdtx_det where lgdtx_domain = global_domain
            and lgdtx_type = 'SO'
            and lgdtx_so_tax_usage = so_tax_usage
            and lgdtx_shipfrom = p_shipfrom
            and lgdtx_shipto = p_shipto
            and lgdtx_so_nbr = sod_nbr
            and lgdtx_consign = no
         no-lock:
            assign
               l_simul  = yes
               c_shipto = lgdtx_soldto.
 
         end.
 
         if not available lgdtx_det then do:
            for first lgdtx_det where lgdtx_domain = global_domain
               and lgdtx_type = 'SO'
               and lgdtx_so_tax_usage = so_tax_usage
               and lgdtx_shipfrom = p_shipfrom
               and lgdtx_shipto = p_shipto
               and (lgdtx_so_nbr = "" or lgdtx_so_nbr = ?)
               and lgdtx_consign = no
            no-lock:
               assign
                  l_simul  = yes
                  c_shipto = lgdtx_soldto.
            end.
         end.
 
         if not l_first_order then do:
            if l_simul <> l_last_simul or
               (l_simul and c_shipto <> c_last_shipto) then
               return yes.
         end.
         else
            l_first_order = no.
 
         assign
            l_last_simul  = l_simul
            c_last_shipto = c_shipto.
      end. /* if first-of(sod_nbr) then */
   end.
 
   return no.
END.

FUNCTION isSimulCustomized returns logical(
   /* Function checks if a Custom Legal Document should be created            */
   input p_shipfrom  as character,
   input p_shipto    as character,
   input p_tax_usage as character,
   input p_order     as character):
      
   define buffer lgdtx_det for lgdtx_det.
 
   for first lgdtx_det no-lock
      where lgdtx_det.lgdtx_domain = global_domain
      and lgdtx_det.lgdtx_type = 'SO'
      and lgdtx_det.lgdtx_so_tax_usage = p_tax_usage
      and lgdtx_det.lgdtx_shipfrom = p_shipfrom
      and lgdtx_det.lgdtx_shipto = p_shipto
      and (lgdtx_det.lgdtx_so_nbr = p_order or lgdtx_so_nbr = ""
      or lgdtx_det.lgdtx_so_nbr = ?)
      and lgdtx_consign = no :
   end.
   if available lgdtx_det and lgdtx_det.lgdtx__qadc01 = 'y'
      then return yes. 
      else return no.
 
END. /* isSimulCustomized */

PROCEDURE p_giveErrorForTaxLD:
define output parameter l_err as logical no-undo.

   l_err = l_disperr.

END PROCEDURE. /* p_getErrorForTaxLD */

/**-----------------------------------------------------------------------------
 * Populate weight information from shipping history to serial master.
 *
 * @param ser_mstr 
 *----------------------------------------------------------------------------*/
PROCEDURE populateSerialWeightFromShippingHist:
   define parameter buffer ser_mstr for ser_mstr.

   define buffer shph_hist for shph_hist.
   define buffer shpserh_hist for shpserh_hist.
   define buffer shpordh_hist for shpordh_hist.
   define buffer serd_det for serd_det.
   define buffer sod_det for sod_det.

   define variable lastDate like shph_timestamp no-undo.
   define variable lastHistOid as decimal no-undo.

   {us/px/pxrun.i &PROC = 'getLatestShippingHist'
            &PROGRAM='pashphxr.p'
            &HANDLE = ph_pashphxr
            &PARAM = "(input ser_mstr.ser_serial_id,
                       buffer shph_hist)"
            &NOAPPERROR = true
            &CATCHERROR = true}

   for first shpserh_hist no-lock
      where shpserh_hist.oid_shph_hist = shph_hist.oid_shph_hist
         and shpserh_hist.shpserh_serial_id = ser_mstr.ser_serial_id:

      assign
         ser_mstr.ser_gross_weight    = shpserh_hist.shpserh_gross_weight
         ser_mstr.ser_gross_weight_um = shpserh_hist.shpserh_gross_weight_um
         ser_mstr.ser_ship_wt         = shpserh_hist.shpserh_tare_weight
         ser_mstr.ser_ship_wt_um      = shpserh_hist.shpserh_tare_weight_um
         ser_mstr.ser_size            = shpserh_hist.shpserh_size
         ser_mstr.ser_size_um         = shpserh_hist.shpserh_size_um.

      for each serd_det exclusive-lock
         where serd_det.oid_ser_mstr = ser_mstr.oid_ser_mstr
            and serd_det.serd_table_name = {&SERD-SOD-DET}
            and serd_det.serd_type = {&SERD-TYPE-PICKING}:

         for first sod_det no-lock
            where sod_det.oid_sod_det = serd_det.oid_table_record:

            for first shpordh_hist no-lock
               where shpordh_hist.oid_shpserh_hist = shpserh_hist.oid_shpserh_hist
                  and shpordh_hist.shpordh_nbr = sod_det.sod_nbr
                  and shpordh_hist.shpordh_line = string(sod_det.sod_line):
               assign
                  serd_det.serd_net_wt = shpordh_hist.shpordh_net_weight
                  serd_det.serd_net_wt_um = shpordh_hist.shpordh_net_weight_um.
            end.
         end.
      end.
   end.
END PROCEDURE. /*populateSerialWeightFromShippingHist*/


/**-----------------------------------------------------------------------------
 * Populate weight information from shipping history to serial master.
 *
 * @param ip_absOid Shipper OID
 *----------------------------------------------------------------------------*/
PROCEDURE populateWeightFromShippingHist:
   define input parameter ip_absOid as decimal no-undo.

   define buffer ser_mstr for ser_mstr.
   define buffer abs_mstr for abs_mstr.
   define buffer serd_det for serd_det.

   for each serd_det no-lock
      where serd_det.serd_table_name = {&SERD-ABS-MSTR}
         and serd_det.oid_table_record = ip_absOid:

      for first ser_mstr exclusive-lock
         where ser_mstr.oid_ser_mstr = serd_det.oid_ser_mstr:
         run populateSerialWeightFromShippingHist(
            buffer ser_mstr).
      end.
   end.
END PROCEDURE. /*populateWeightFromShippingHist*/

/**-----------------------------------------------------------------------------
 * Validate the inventory detail is negative or not.
 *
 * @param ip_absOid Shipper OID
 * @param op_negative Negative
 *----------------------------------------------------------------------------*/
PROCEDURE validateSerialIdAgainstShipper:
   define input parameter ip_absOid as decimal no-undo.
   define output parameter op_negative as logical no-undo.

   define buffer ser_mstr for ser_mstr.
   define buffer abs_mstr for abs_mstr.
   define buffer serd_det for serd_det.

   for each serd_det no-lock
      where serd_det.serd_table_name = {&SERD-ABS-MSTR}
         and serd_det.oid_table_record = ip_absOid:

      for first ser_mstr no-lock
         where ser_mstr.oid_ser_mstr = serd_det.oid_ser_mstr:
         {us/px/pxrun.i &PROC = 'validateInvDetailForPack'
                        &PROGRAM = 'padovdxr.p'
                        &HANDLE = ph_padovdxr
                        &PARAM = "(input ser_mstr.ser_serial_id,
                                   output op_negative)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
         if op_negative then do:
            return.
         end.
      end.
   end.
END PROCEDURE.

/**-----------------------------------------------------------------------------
 * Validate pack structure against shipping history whether it's changed or not
 * for SO Return. and if the linked so line is deleted, it's also not allowed.
 *
 * @param ip_absOid Shipper OID
 * @param op_changed Changed
 *----------------------------------------------------------------------------*/
PROCEDURE isReturnedShipperUnconfirmAllowed:
   define input parameter ip_absOid as decimal no-undo.
   define output parameter op_changed as logical no-undo.
   define output parameter op_isReturn as logical no-undo initial yes.

   define variable parentId as character no-undo.

   define buffer abs_mstr for abs_mstr.
   define buffer shph_hist for shph_hist.
   define buffer shpserh_hist for shpserh_hist.
   define buffer ser_mstr for ser_mstr.
   define buffer shpordh_hist for shpordh_hist.

   for first abs_mstr where oid_abs_mstr = ip_absOid:
      {us/px/pxrun.i &PROC = 'getLastShippingHistoryByShipper'
                     &PROGRAM='pashphxr.p'
                     &HANDLE = ph_pashphxr
                     &PARAM = "(input abs_shipfrom,
                                input abs_id,
                                buffer shph_hist)"
                     &NOAPPERROR = true
                     &CATCHERROR = true}

      /* If the qty in last shipping history is positive, the transaction is not a 
         returned shipper unconfirm.*/
      for each shpserh_hist no-lock
         where shpserh_hist.oid_shph_hist = shph_hist.oid_shph_hist:

         if can-find(first shpordh_hist
               where shpordh_hist.oid_shpserh_hist = shpserh_hist.oid_shpserh_hist
                  and shpordh_hist.shpordh_qty_pck > 0) then do:
            op_changed = no.
            op_isReturn = no.
            return.
         end.
      end.

      for each shpserh_hist no-lock
         where shpserh_hist.oid_shph_hist = shph_hist.oid_shph_hist:

         for each shpordh_hist no-lock
            where shpordh_hist.oid_shpserh_hist = shpserh_hist.oid_shpserh_hist:

            if not can-find(first sod_det
               where sod_det.sod_domain = global_domain
                  and sod_det.sod_nbr= shpordh_hist.shpordh_nbr
                  and sod_det.sod_line = integer(shpordh_hist.shpordh_line)) then do:
               op_changed = yes.
               return.
            end.
         end.

         for first ser_mstr no-lock
            where ser_mstr.ser_domain = global_domain
               and ser_mstr.ser_serial_id = shpserh_hist.shpserh_serial_id:

            if ser_mstr.ser_qty_avail + shpserh_hist.shpserh_content_qty <> 0 then do:
               op_changed = yes.
               return.
            end.
            {us/px/pxrun.i &PROC = 'getParentSerialId'
                           &PROGRAM='pasexr.p'
                           &HANDLE = ph_pasexr
                           &PARAM = "(input ser_mstr.ser_serial_id,
                                      output parentId)"
                           &NOAPPERROR = true
                           &CATCHERROR = true}
            if parentId <> shpserh_hist.shpserh_parent_id then do:
               op_changed = yes.
               return.
            end.
            if ser_mstr.oid_ser_mstr_parent = 0 and (
                  ser_mstr.ser_site <> shpserh_hist.shpserh_site or 
                  ser_mstr.ser_loc <> shpserh_hist.shpserh_loc ) then do:
               op_changed = yes.
               return.
            end.
            if ser_mstr.ser_lotser <> shpserh_hist.shpserh_lotser or 
               ser_mstr.ser_ref <> shpserh_hist.shpserh_ref or
               ser_mstr.ser_part <> shpserh_hist.shpserh_part then do:
               op_changed = yes.
               return.
            end.
         end.
      end.
   end.
END PROCEDURE. /*isReturnedShipperUnconfirmAllowed*/


/**-----------------------------------------------------------------------------
 * Get From stage
 *
 * @param ip_absOid shipper OID
 * @param op_stage from stage
 *----------------------------------------------------------------------------*/
PROCEDURE getFromStage:
   define input parameter ip_absOid as decimal no-undo.
   define output parameter op_stage as character no-undo.

   define buffer ser_mstr for ser_mstr.
   define buffer serd_det for serd_det.

   for first serd_det no-lock
      where serd_det.serd_table_name = {&SERD-ABS-MSTR}
         and serd_det.oid_table_record = ip_absOid:
      for first ser_mstr no-lock
         where ser_mstr.oid_ser_mstr = serd_det.oid_ser_mstr:
         {us/px/pxrun.i &PROC = 'getMasterPackStage'
                        &PROGRAM='pasexr.p'
                        &HANDLE = ph_pasexr
                        &PARAM = "(input ser_mstr.ser_serial_id,
                                   output op_stage)"
                        &NOAPPERROR = true
                        &CATCHERROR = true}
      end.
   end.
END PROCEDURE. /*getFromStage*/

PROCEDURE p-chk-qadwkfl:
/*-----------------------------------------------------------------------
 Purpose: To check if the Shipper is locked by another user
 Parameters:   <None>
 Notes:
-------------------------------------------------------------------------*/
   define input parameter p_shipfrom as   character    no-undo.
   define input parameter p_doctype  as   character    no-undo.
   define input parameter p_absid    as   character    no-undo.

   define buffer buf_abs_mstr for abs_mstr.

   p_absid = p_doctype + p_absid.

   for first buf_abs_mstr
      where buf_abs_mstr.abs_domain   = global_domain
      and   buf_abs_mstr.abs_shipfrom = p_shipfrom
      and   buf_abs_mstr.abs_id       = p_absid
   no-lock:
      for first qad_wkfl
         where qad_domain = global_domain
         and   qad_key1   = "rcshwb.p"
         and   qad_key2   = p_shipfrom + "," + p_absid
      no-lock:
         if qad_wkfl.qad_key4 <> SessionUniqueID
         then do:
            /* RECORD LOCKED BY ANOTHER USER.  TRY LATER # */
            {us/bbi/pxmsg.i &MSGNUM=7422 &ERRORLEVEL=4}
            l_error = yes.
         end.  /* IF qad_wkfl.qad_key4 = SessionUniqueID */
         return.
      end. /* FOR FIRST qad_wkfl */
   end. /* FOR FIRST buf_abs_mstr */
END PROCEDURE.
