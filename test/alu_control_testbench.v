module alu_control_testbench();
	reg [1:0] ALUop;
	reg [5:0] func;

	wire [2:0] ALUcontrol;
	wire jr;

	alu_control alu_cont(ALUcontrol, jr, ALUop, func);

	initial begin
	ALUop = 2'b00; func = 6'b000000;
	#50;
	// 011 0
	ALUop = 2'b00; func = 6'b011000;
	#50;
	// 011 0
	ALUop = 2'b01; func = 6'b000000;
	#50;
	// 111 0
	ALUop = 2'b01; func = 6'b011000;
	#50;
	// 111 0
	ALUop = 2'b11; func = 6'b000000;
	#50;
	// 001 0
	ALUop = 2'b11; func = 6'b011000;
	#50;
	// 001 0
	ALUop = 2'b10; func = 6'b100000;
	#50;
	// 011 0
	ALUop = 2'b10; func = 6'b100010;
	#50;
	// 111 0
	ALUop = 2'b10; func = 6'b100100;
	#50;
	// 000 0
	ALUop = 2'b10; func = 6'b100101;
	#50;
	// 001 0
	ALUop = 2'b10; func = 6'b100110;
	#50;
	// 010 0
	ALUop = 2'b10; func = 6'b001000;
	#50;
	// x 1

	end
	  
	initial begin
		$monitor("time = %2d, ALUop = %2b, func= %6b, ALUcontrol= %3b, jr = %1b\n" , $time, ALUop, func, ALUcontrol, jr);
	end
	
endmodule