module LUT (
   input wire [1:0] stage,
   
   output reg [3:0] addr_1,
   output reg [3:0] addr_2,
   output reg [3:0] addr_3,
   output reg [3:0] addr_4,
   output reg [3:0] addr_5,
   output reg [3:0] addr_6,
   output reg [3:0] addr_7,
   output reg [3:0] addr_8,
   output reg [3:0] addr_9,
   output reg [3:0] addr_10,
   output reg [3:0] addr_11,
   output reg [3:0] addr_12,
   output reg [3:0] addr_13,
   output reg [3:0] addr_14,
   output reg [3:0] addr_15,
   output reg [3:0] addr_16,

   output reg [31:0] W_value_1,
   output reg [31:0] W_value_2,
   output reg [31:0] W_value_3,
   output reg [31:0] W_value_4,
   output reg [31:0] W_value_5,
   output reg [31:0] W_value_6,
   output reg [31:0] W_value_7,
   output reg [31:0] W_value_8
   
);

 always @(*) begin

      case (stage)

         0: begin
		 addr_1 = 0;  
		 addr_2 = 8; 
		 addr_3 = 4; 
		 addr_4 = 12; 
		 addr_5 = 2; 
		 addr_6 = 10; 
		 addr_7 = 6; 
		 addr_8 = 14; 
		 addr_9 = 1; 
		addr_10 = 9; 
		addr_11 = 5; 
		addr_12 = 13; 
		addr_13 = 3; 
		addr_14 = 11; 
		addr_15 = 7; 
		addr_16 = 15; 
	        W_value_1 = {16'd16384, 16'd0};
	        W_value_2 = {16'd16384, 16'd0};
	        W_value_3 = {16'd16384, 16'd0};
	        W_value_4 = {16'd16384, 16'd0};
	        W_value_5 = {16'd16384, 16'd0};
	        W_value_6 = {16'd16384, 16'd0};
	        W_value_7 = {16'd16384, 16'd0};
	        W_value_8 = {16'd16384, 16'd0};

	 end


	 1: begin

		 addr_1 = 0;  
		 addr_2 = 4; 
		 addr_3 = 8; 
		 addr_4 = 12; 
		 addr_5 = 2; 
		 addr_6 = 6; 
		 addr_7 = 10; 
		 addr_8 = 14; 
		 addr_9 = 1; 
		addr_10 = 5; 
		addr_11 = 9; 
		addr_12 = 13; 
		addr_13 = 3; 
		addr_14 = 7; 
		addr_15 = 11; 
		addr_16 = 15; 
	        W_value_1 = {16'd16384, 16'd0};
	        W_value_2 = {16'd0, -16'd16384};
	        W_value_3 = {16'd16384, 16'd0};
	        W_value_4 = {16'd0, -16'd16384};
	        W_value_5 = {16'd16384, 16'd0};
	        W_value_6 = {16'd0, -16'd16384};
	        W_value_7 = {16'd16384, 16'd0};
	        W_value_8 = {16'd0, -16'd16384};

	 end


	 2: begin

		 addr_1 = 0;  
		 addr_2 = 2; 
		 addr_3 = 8; 
		 addr_4 = 10; 
		 addr_5 = 4; 
		 addr_6 = 6; 
		 addr_7 = 12; 
		 addr_8 = 14; 
		 addr_9 = 1; 
		addr_10 = 3; 
		addr_11 = 9; 
		addr_12 = 11; 
		addr_13 = 5; 
		addr_14 = 7; 
		addr_15 = 13; 
		addr_16 = 15; 
	        W_value_1 = {16'd16384, 16'd0};
	        W_value_2 = {16'd11585, -16'd11585};
	        W_value_3 = {16'd0, -16'd16384};
	        W_value_4 = {-16'd11585, -16'd11585};
	        W_value_5 = {16'd16384, 16'd0};
	        W_value_6 = {16'd11585, -16'd11585};
	        W_value_7 = {16'd0, -16'd16384};
	        W_value_8 = {-16'd11585, -16'd11585};

	 end


	 3: begin

		 addr_1 = 0;  
		 addr_2 = 1; 
		 addr_3 = 8; 
		 addr_4 = 9; 
		 addr_5 = 4; 
		 addr_6 = 5; 
		 addr_7 = 12; 
		 addr_8 = 13; 
		 addr_9 = 2; 
		addr_10 = 3; 
		addr_11 = 10; 
		addr_12 = 11; 
		addr_13 = 6; 
		addr_14 = 7; 
		addr_15 = 14; 
		addr_16 = 15; 
	        W_value_1 = {16'd16384, 16'd0};
	        W_value_2 = {16'd15137, -16'd6270};
	        W_value_3 = {16'd11585, -16'd11585};
	        W_value_4 = {16'd6270, -16'd15137};
	        W_value_5 = {16'd0, -16'd16384};
	        W_value_6 = {-16'd6270, -16'd15137};
	        W_value_7 = {-16'd11585, -16'd11585};
	        W_value_8 = {-16'd15137, -16'd6270};
	        
	 end

	endcase
end
		

endmodule