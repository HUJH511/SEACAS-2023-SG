module butterfly2 #(
   parameter NBITS = 16
)(
   input wire                    clk,
   input wire signed [NBITS-1:0] Ar,
   input wire signed [NBITS-1:0] Ai,
   input wire signed [NBITS-1:0] Br,
   input wire signed [NBITS-1:0] Bi,
   input wire signed [NBITS-1:0] Cr,
   input wire signed [NBITS-1:0] Ci,
   input wire signed [NBITS-1:0] Dr,
   input wire signed [NBITS-1:0] Di,
   input wire signed [NBITS-1:0] WBr,
   input wire signed [NBITS-1:0] WBi,
   input wire signed [NBITS-1:0] WCr,
   input wire signed [NBITS-1:0] WCi,
   input wire signed [NBITS-1:0] WDr,
   input wire signed [NBITS-1:0] WDi,
   output reg signed [NBITS-1:0] Xr_F,
   output reg signed [NBITS-1:0] Xi_F,
   output reg signed [NBITS-1:0] Yr_F,
   output reg signed [NBITS-1:0] Yi_F,
   output reg signed [NBITS-1:0] Mr_F,
   output reg signed [NBITS-1:0] Mi_F,
   output reg signed [NBITS-1:0] Nr_F,
   output reg signed [NBITS-1:0] Ni_F
);

   /****************************************************************************
    * Internal Signals
    ***************************************************************************/

   // Registered input values.
   // These are in 8.8 format.
   reg signed [NBITS-1:0] Ar_F;
   reg signed [NBITS-1:0] Ai_F;
   reg signed [NBITS-1:0] Br_F;
   reg signed [NBITS-1:0] Bi_F;
   reg signed [NBITS-1:0] Cr_F;
   reg signed [NBITS-1:0] Ci_F;
   reg signed [NBITS-1:0] Dr_F;
   reg signed [NBITS-1:0] Di_F;
   reg signed [NBITS-1:0] WBr_F;
   reg signed [NBITS-1:0] WBi_F;
   reg signed [NBITS-1:0] WCr_F;
   reg signed [NBITS-1:0] WCi_F;
   reg signed [NBITS-1:0] WDr_F;
   reg signed [NBITS-1:0] WDi_F;

   // Re-registered A values.
   // These are in 8.8 format.
   reg signed [NBITS-1:0] Ar_Fd2;
   reg signed [NBITS-1:0] Ai_Fd2;

   // Intermediate values used to store the product of B and WB.
   // The output of the multiply is 10.22 format.
   // These are in 10.20 format because the final two bits are truncated.
   reg signed [NBITS*2-3:0] ZBra_F;
   reg signed [NBITS*2-3:0] ZBrb_F;
   reg signed [NBITS*2-3:0] ZBia_F;
   reg signed [NBITS*2-3:0] ZBib_F;

   // Intermediate values used to store the product of C and WC.
   // The output of the multiply is 10.22 format.
   // These are in 10.20 format because the final two bits are truncated.
   reg signed [NBITS*2-3:0] ZCra_F;
   reg signed [NBITS*2-3:0] ZCrb_F;
   reg signed [NBITS*2-3:0] ZCia_F;
   reg signed [NBITS*2-3:0] ZCib_F;

   // Intermediate values used to store the product of D and WD.
   // The output of the multiply is 10.22 format.
   // These are in 10.20 format because the final two bits are truncated.
   reg signed [NBITS*2-3:0] ZDra_F;
   reg signed [NBITS*2-3:0] ZDrb_F;
   reg signed [NBITS*2-3:0] ZDia_F;
   reg signed [NBITS*2-3:0] ZDib_F;