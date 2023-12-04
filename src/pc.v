module pc(out, in, clock);
	
	input [31:0] in;
	input clock;
	output reg[31:0] out;
	
	initial begin
		out = 32'b0;
	end
	
	always @(negedge clock) begin
		out = in;
	end
	
endmodule