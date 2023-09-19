module input_buffer (
    input wire [3:0]   read_address,  // Read address (4 bits)
    input wire [3:0]   write_address, // Write address (4 bits)
    input wire [3:0]   write_address_1, // Write address (4 bits)
    input wire [3:0]   write_address_2, // Write address (4 bits)
    input wire [3:0]   write_address_3, // Write address (4 bits)
    input wire [3:0]   write_address_4, // Write address (4 bits)
    input wire [3:0]   write_address_5, // Write address (4 bits)
    input wire [3:0]   write_address_6, // Write address (4 bits)
    input wire [3:0]   write_address_7, // Write address (4 bits)
    input wire [3:0]   write_address_8, // Write address (4 bits)
    input wire [3:0]   write_address_9, // Write address (4 bits)
    input wire [3:0]   write_address_10, // Write address (4 bits)
    input wire [3:0]   write_address_11, // Write address (4 bits)
    input wire [3:0]   write_address_12, // Write address (4 bits)
    input wire [3:0]   write_address_13, // Write address (4 bits)
    input wire [3:0]   write_address_14, // Write address (4 bits)
    input wire [3:0]   write_address_15, // Write address (4 bits)
    input wire [3:0]   write_address_16, // Write address (4 bits)  
    
    input wire 	       read_enable,   // read enable
    input wire         write_enable,  // Write enable
    input wire	       write_back,    // Write back from BUTTERFLY
    input wire [31:0]  data_in,       // Input data (32 bits)
    input wire [31:0] data_in_1,
    input wire [31:0] data_in_2,
    input wire [31:0] data_in_3,
    input wire [31:0] data_in_4,
    input wire [31:0] data_in_5,
    input wire [31:0] data_in_6,
    input wire [31:0] data_in_7,
    input wire [31:0] data_in_8,
    input wire [31:0] data_in_9,
    input wire [31:0] data_in_10,
    input wire [31:0] data_in_11,
    input wire [31:0] data_in_12,
    input wire [31:0] data_in_13,
    input wire [31:0] data_in_14,
    input wire [31:0] data_in_15,
    input wire [31:0] data_in_16,

    output wire [31:0] data_out_1,
    output wire [31:0] data_out_2,
    output wire [31:0] data_out_3,
    output wire [31:0] data_out_4,
    output wire [31:0] data_out_5,
    output wire [31:0] data_out_6,
    output wire [31:0] data_out_7,
    output wire [31:0] data_out_8,
    output wire [31:0] data_out_9,
    output wire [31:0] data_out_10,
    output wire [31:0] data_out_11,
    output wire [31:0] data_out_12,
    output wire [31:0] data_out_13,
    output wire [31:0] data_out_14,
    output wire [31:0] data_out_15,
    output wire [31:0] data_out_16,
    output reg  [31:0] data_out_read
	  );

parameter DEPTH = 16;

reg [31:0] registers [DEPTH-1:0];

assign data_out_1  = registers[0];
assign data_out_2  = registers[1];
assign data_out_3  = registers[2];
assign data_out_4  = registers[3];
assign data_out_5  = registers[4];
assign data_out_6  = registers[5];
assign data_out_7  = registers[6];
assign data_out_8  = registers[7];
assign data_out_9  = registers[8];
assign data_out_10 = registers[9];
assign data_out_11 = registers[10];
assign data_out_12 = registers[11];
assign data_out_13 = registers[12];
assign data_out_14 = registers[13];
assign data_out_15 = registers[14];
assign data_out_16 = registers[15];

always @(posedge clk) begin
    if (read_enable) begin
	data_out_read = registers[read_address];
    end
    else if (!write_back && write_enable) begin
        registers[write_address] <= data_in;
    end
    else if (write_back && write_enable) begin
        registers[write_address_1]  <= data_in_1;
        registers[write_address_2]  <= data_in_2;
        registers[write_address_3]  <= data_in_3;
        registers[write_address_4]  <= data_in_4;
        registers[write_address_5]  <= data_in_5;
        registers[write_address_6]  <= data_in_6;
        registers[write_address_7]  <= data_in_7;
        registers[write_address_8]  <= data_in_8;
        registers[write_address_9]  <= data_in_9;
        registers[write_address_10] <= data_in_10;
        registers[write_address_11] <= data_in_11;
        registers[write_address_12] <= data_in_12;
        registers[write_address_13] <= data_in_13;
        registers[write_address_14] <= data_in_14;
        registers[write_address_15] <= data_in_15;
        registers[write_address_16] <= data_in_16;
    end
end

endmodule
