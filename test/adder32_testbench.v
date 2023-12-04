`define DELAY 20
module adder32_testbench();
	reg [31:0] a, b; 
	wire [31:0] sum; 
	wire carry_out;
	
	adder32 add(sum, carry_out, a, b);
	
endmodule