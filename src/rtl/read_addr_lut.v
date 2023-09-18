//////////////////////////////////////////////////////////////////////////////////
// Engineer: Amey Kulkarni
// Design Name: Fast Fourier Transform (16-point) 
// Module Name: read_addr_lut
// Project Name: Fast Fourier Transform (16-point)
///////////////////////////////////////////////////////////////////////////

module read_addr_lut (
   input wire stage,                // Only 2 stages (1 bit)
   input wire [1:0] butterfly,      // 4 butterflies (2 bits)
   
   output reg [3:0] A_addr,         // radix-4
   output reg [3:0] B_addr,
   output reg [3:0] C_addr,
   output reg [3:0] D_addr,

   output reg [3:0] W_addr_b,       // To reach W9 (4 bits)
   output reg [3:0] W_addr_c,
   output reg [3:0] W_addr_d
);

   always @(*) begin

      case (stage)

         0: begin
            case (butterfly)

               0: begin
                  A_addr = 0;
                  B_addr = 4;
                  C_addr = 8;
                  D_addr = 12;

                  W_addr_b = 0;
                  W_addr_c = 0;
                  W_addr_d = 0;
               end

               1: begin
                  A_addr = 1;
                  B_addr = 5;
                  C_addr = 9;
                  D_addr = 13;

                  W_addr_b = 0;
                  W_addr_c = 0;
                  W_addr_d = 0;
               end

               2: begin
                  A_addr = 2;
                  B_addr = 6;
                  C_addr = 10;
                  D_addr = 14;

                  W_addr_b = 0;
                  W_addr_c = 0;
                  W_addr_d = 0;
               end

               3: begin
                  A_addr = 3;
                  B_addr = 7;
                  C_addr = 11;
                  D_addr = 15;

                  W_addr_b = 0;
                  W_addr_c = 0;
                  W_addr_d = 0;
               end

            endcase
         end // case: 0

         1: begin
            case (butterfly)

               0: begin
                  A_addr = 0;
                  B_addr = 1;
                  C_addr = 2;
                  D_addr = 3;

                  W_addr_b = 0;
                  W_addr_c = 0;
                  W_addr_d = 0;
               end

               1: begin
                  A_addr = 4;
                  B_addr = 5;
                  C_addr = 6;
                  D_addr = 7;

                  W_addr_b = 1;
                  W_addr_c = 2;
                  W_addr_d = 3;
               end

               2: begin
                  A_addr = 8;
                  B_addr = 9;
                  C_addr = 10;
                  D_addr = 11;

                  W_addr_b = 2;
                  W_addr_c = 4;
                  W_addr_d = 6;
               end

               3: begin
                  A_addr = 12;
                  B_addr = 13;
                  C_addr = 14;
                  D_addr = 15;

                  W_addr_b = 3;
                  W_addr_c = 6;
                  W_addr_d = 9;
               end

            endcase
         end // case: 1

      endcase

   end

endmodule
