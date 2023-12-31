`define DELAY 20
module adder_testbench();
	reg a, b, carry_in;
	wire sum, carry_out;
	
	adder add(sum, carry_out, carry_in, a, b);
	
	initial begin
		a = 1'b0; b = 1'b0; carry_in = 1'b0;
		#`DELAY;
		a = 1'b0; b = 1'b0; carry_in = 1'b1;
		#`DELAY;
		a = 1'b0; b = 1'b1; carry_in = 1'b0;
		#`DELAY;
		a = 1'b0; b = 1'b1; carry_in = 1'b1;
		#`DELAY;
		a = 1'b1; b = 1'b0; carry_in = 1'b0;
		#`DELAY;
		a = 1'b1; b = 1'b0; carry_in = 1'b1;
		#`DELAY;
		a = 1'b1; b = 1'b1; carry_in = 1'b0;
		#`DELAY;
		a = 1'b1; b = 1'b1; carry_in = 1'b1;
	end
	
	initial begin
		$monitor("time = %2d, a =%1b, b=%1b, carry_in=%1b, sum=%1b, carry_out=%1b", $time, a, b, carry_in, sum, carry_out);
	end
 
endmodule