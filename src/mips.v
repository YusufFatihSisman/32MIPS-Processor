module mips(clock);
	input clock;
	
	wire [31:0] instruction;
	wire [31:0] instructionAddress;
	wire [31:0] PC;
	
	wire RsWrite, ALUSrc, MemtoReg, WrReg1, 
	     WrReg2, MemRead, MemWr, BranchE, 
	     BranchNE, J, Jal, ORI, LUI, jr;
	
	wire [1:0] ALUop;
		  
	wire [2:0] ALUcontrol; 
	
	wire [31:0] rs,rt;
	
	wire [4:0] readReg1, readReg2;
	wire [31:0] readData1, readData2;
	wire [4:0] writeReg1, writeReg2;
	wire [31:0] writeData1, writeData2;
	wire [31:0] aluResult, aluCompareResult;
	wire [31:0] aluSecondInput;
	wire zero, nZero;
	wire [31:0] pcPlus4;
	wire [31:0] aluOrData;
	wire [31:0] dataMemoryResult;
	wire [31:0] luiPart;
	wire [31:0] immediateSignExt;
	wire [31:0] immediateZeroExt;
	wire [31:0] immediate;
	wire [31:0] immediateShift2;
	wire [31:0] branchAdress;
	wire [31:0] branchOrPc;
	wire beq, bne, beqORbne;
	wire [31:0] jrOrPc;
	wire jOrJal;
	wire [31:0] jumpAdress;
	wire RegWriteSign1, RegWriteSign2;
	wire nJr;
	wire carryOut;
	
	//instruction address is taken
	pc p0(instructionAddress, PC, clock);
	
	//instruction is taken
	instruction_memory im0(instruction, instructionAddress, clock);
	
	//control unit set signals according to instruction
	control_unit cu0(RsWrite, ALUSrc, MemtoReg, WrReg1, 
						  WrReg2, MemRead, MemWr, BranchE, 
					     BranchNE, J, Jal, ORI, LUI, ALUop, 
						  instruction[31:26]);
	
	//calculate lui part
	shiftLeft16 sl0(luiPart, instruction[15:0]);
		
	//choose write register 2 rt or rs
	mux5_1 m0(writeReg2, instruction[20:16], instruction[25:21], RsWrite);
	
	//choose write register 1 rd or 31
	mux5_1 m1(writeReg1, instruction[15:11], 5'b11111, Jal);
	
	//choose write data 1
	mux32_1 m2(writeData1, aluCompareResult, pcPlus4, Jal);
	
	//choose write data 2
	mux32_1 m3(writeData2, aluOrData, luiPart, LUI);
	
	//alu control set signals
	alu_control a0(ALUcontrol, jr, ALUop, instruction[5:0]);
	
	not notJR(nJr, jr);
	and chooseWriteSign1(RegWriteSign1, WrReg1, nJr);
	and chooseWriteSign2(RegWriteSign2, WrReg2, nJr);
	
	//register
	mips_registers mr0(readData1, readData2, instruction[25:21], instruction[20:16], 
							RegWriteSign1, RegWriteSign2, writeReg1, writeReg2, writeData1,
							writeData2, clock);
	
	signExtender16to32 se0(immediateSignExt, instruction[15:0]);
	zeroExtender16to32 ze0(immediateZeroExt, instruction[15:0]);
	
	//choose immediate
	mux32_1 m4(immediate, immediateSignExt, immediateZeroExt, ORI);
	
	//choose alu32 second input
	mux32_1 m5(aluSecondInput, readData2, immediate, ALUSrc);
	
	//alu32
	alu32 al0(aluResult, aluCompareResult, zero, readData1, aluSecondInput, ALUcontrol);
	
	//data memory
	data_memory dm0(dataMemoryResult, MemWr, MemRead, aluResult, readData2, clock);
	
	//choose alu or memory result
	mux32_1 memOrAlu(aluOrData, aluResult, dataMemoryResult, MemtoReg);
	
	//pc = pc + 4
	adder32 pc4(pcPlus4, instructionAddress, 32'b1);
	
	//branch address
	//shiftLeft2 sl2(immediateShift2 ,immediate);
	adder32 brnchAdress(branchAdress, pcPlus4, immediate);
	
	//choose pc+4 adress or branch adress
	and isBranchEq(beq, BranchE, zero);
	not n0(nZero, zero);
	and isBranchNeq(bne, BranchNE, nZero);
	or o0(beqORbne, beq, bne);
	mux32_1 pc4OrBrAdd(branchOrPc, pcPlus4, branchAdress, beqORbne);
	
	//choose pc or rs
	mux32_1 jrOPc(jrOrPc, branchOrPc, readData1, jr);
	
	//choose pc or jump
	or jOJal(jOrJal, J, Jal);
	assign jumpAdress[31:28] = instructionAddress[31:28];
	assign jumpAdress[25:0] = instruction[25:0];
	assign jumpAdress[27:26] = 2'b00;
	mux32_1 jOPc(PC, jrOrPc, jumpAdress, jOrJal);
			 
endmodule
	