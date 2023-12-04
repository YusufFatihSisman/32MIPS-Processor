module control_unit_testbench();
	reg [5:0] opcode;

	wire RsWrite, ALUSrc, MemtoReg, WrReg1, WrReg2, MemRead, MemWr, BranchE, BranchNE, J, Jal, ORI, LUI;
	wire [1:0] ALUop;

	control_unit cu(RsWrite, ALUSrc, MemtoReg, WrReg1, WrReg2, MemRead, MemWr, BranchE, BranchNE, J, Jal, ORI, LUI, ALUop, opcode);

	initial begin
	opcode = 6'b000000;
	#50;
	// rt
	opcode = 6'b100011;
	#50;
	// lw
	opcode = 6'b101011;
	#50;
	// sw
	opcode = 6'b000100;
	#50;
	// be
	opcode = 6'b000101;
	#50;
	// bn
	opcode = 6'b001101;
	#50;
	// ori
	opcode = 6'b001111;
	#50;
	// loadupperimm
	opcode = 6'b000010;
	#50;
	// jump
	opcode = 6'b000011;
	#50;
	// jumpandlink

	end
	  
	initial begin
		$monitor("time = %2d, opcode = %6b, RsWrite = %1b, ALUSrc = %1b, MemToReg = %1b, WrReg1 = %1b, WrReg2 = %1b, MemRead = %1b, MemWr = %1b, BranchE = %1b, BranchNE = %1b, J = %1b, Jal = %1b, ORI = %1b, LUI = %1b, ALUop = %2b\n", $time, opcode, RsWrite, ALUSrc, MemtoReg, WrReg1, WrReg2, MemRead, MemWr, BranchE, BranchNE, J, Jal, ORI, LUI, ALUop);
	end
	
endmodule