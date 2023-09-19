module TOP #(parameter N = 8, parameter M = 16
)(

input wire 	    clk,
input wire	    stage,
input wire          read_enable,
input wire 	    write_enable,
input wire 	    write_back,
input wire  [3:0]   read_address,
input wire  [3:0]   write_address,
input wire  [3:0]   read_address,
input wire  [31:0]  data_in,
output wire [31:0]  data_out
);



wire [N*M*2-1:0] A_w, B_w, X_w, Y_w, W_w;


input_buffer ib (
     .read_address(read_address),
     .write_address(write_address),     
     .write_address_1(addr_1), 
     .write_address_2(addr_2), 
     .write_address_3(addr_3), 
     .write_address_4(addr_4), 
     .write_address_5(addr_5), 
     .write_address_6(addr_6), 
     .write_address_7(addr_7), 
     .write_address_8(addr_8), 
     .write_address_9(addr_9), 
     .write_address_10(addr_10),
     .write_address_11(addr_11),
     .write_address_12(addr_12),
     .write_address_13(addr_13),
     .write_address_14(addr_14),
     .write_address_15(addr_15),
     .write_address_16(addr_16), 
     .read_enable(read_enable), 
     .write_enable(write_enable),  // Write enable
     .write_back(write_back),    // Write back from BUTTERFLY
     .data_in(data_in),       // Input data (32 bits)
     .data_in_1(A_w[0+:32]),
     .data_in_2(B_w[0+:32]),
     .data_in_3(A_w[32+:32]),
     .data_in_4(B_w[32+:32]),
     .data_in_5(A_w[64+:32]),
     .data_in_6(B_w[64+:32]),
     .data_in_7(A_w[96+:32]),
     .data_in_8(B_w[96+:32]),
     .data_in_9(A_w[128+:32]),
     .data_in_10(B_w[128+:32]),
     .data_in_11(A_w[160+:32]),
     .data_in_12(B_w[160+:32]),
     .data_in_13(A_w[192+:32]),
     .data_in_14(B_w[192+:32]),
     .data_in_15(A_w[224+:32]),
     .data_in_16(B_w[224+:32]),
     .data_out_1(A_w[0+:32]),
     .data_out_2(B_w[0+:32]),
     .data_out_3(A_w[32+:32]),
     .data_out_4(B_w[32+:32]),
     .data_out_5(A_w[64+:32]),
     .data_out_6(B_w[64+:32]),
     .data_out_7(A_w[96+:32]),
     .data_out_8(B_w[96+:32]),
     .data_out_9(A_w[128+:32]),
     .data_out_10(B_w[128+:32]),
     .data_out_11(A_w[160+:32]),
     .data_out_12(B_w[160+:32]),
     .data_out_13(A_w[192+:32]),
     .data_out_14(B_w[192+:32]),
     .data_out_15(A_w[224+:32]),
     .data_out_16(B_w[224+:32]),
     .data_out_read(data_out)
);


LUT LUT_int(

.stage(stage),
.addr_1(addr_1),
.addr_2(addr_2),
.addr_3(addr_3),
.addr_4(addr_4),
.addr_5(addr_5),
.addr_6(addr_6),
.addr_7(addr_7),
.addr_8(addr_8),
.addr_9(addr_9),
.addr_10(addr_10),
.addr_11(addr_11),
.addr_12(addr_12),
.addr_13(addr_13),
.addr_14(addr_14),
.addr_15(addr_15),
.addr_16(addr_16),
.W_value_1(W_w[0+:32]),
.W_value_2(W_w[32+:32]),
.W_value_3(W_w[64+:32]),
.W_value_4(W_w[96+:32]),
.W_value_5(W_w[128+:32]),
.W_value_6(W_w[160+:32]),
.W_value_7(W_w[192+:32]),
.W_value_8(W_w[224+:32]),
);


genvar i;

for (i = 0; i < N ; i = i + 1) begin
	butterfly buy (.clk(clk), 
			.Ar(A_w[(i*16+15)+:16]),
			.Ai(A_w[(i*16)+:16]),   
                        .Br(B_w[(i*16+15)+:16]),
                        .Bi(B_w[(i*16)+:16]),
                        .Wr(W_w[(i*16+15)+:16]),
                        .Wi(W_w[(i*16)+:16]),
			.Xr_F(X_w[(i*16+15)+:16]),
                        .Xi_F(X_w[(i*16)+:16]),
			.Yr_F(Y_w[(i*16+15)+:16]),
	                .Yi_F(Y_w[(i*16)+:16])
			);
end


endmodule
