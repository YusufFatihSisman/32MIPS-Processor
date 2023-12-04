module control_unit(RsWrite, ALUSrc, MemtoReg, WrReg1, WrReg2, MemRead, MemWr, BranchE, BranchNE, J, Jal, ORI, LUI, ALUop, opcode);
	input [5:0] opcode;
	output RsWrite, ALUSrc, MemtoReg, WrReg1, WrReg2, MemRead, MemWr, BranchE, BranchNE, J, Jal, ORI, LUI;
	output [1:0] ALUop;
	
	wire [5:0] notOpcode;
	wire rtype, lw, sw, beq, bne, ori, lui, j, jal;
	
	not n0(notOpcode[0], opcode[0]);
	not n1(notOpcode[1], opcode[1]);
	not n2(notOpcode[2], opcode[2]);
	not n3(notOpcode[3], opcode[3]);
	not n4(notOpcode[4], opcode[4]);
	not n5(notOpcode[5], opcode[5]);
	
	and rt(rtype, notOpcode[5], notOpcode[4], notOpcode[3], notOpcode[2], notOpcode[1], notOpcode[0]);
	and loadword(lw, opcode[5], notOpcode[4], notOpcode[3], notOpcode[2], opcode[1], opcode[0]);
	and storeword(sw, opcode[5], notOpcode[4], opcode[3], notOpcode[2], opcode[1], opcode[0]);
	and branchequal(beq, notOpcode[5], notOpcode[4], notOpcode[3], opcode[2], notOpcode[1], notOpcode[0]);
	and branchnotequal(bne, notOpcode[5], notOpcode[4], notOpcode[3], opcode[2], notOpcode[1], opcode[0]);
	and orimmediate(ori, notOpcode[5], notOpcode[4], opcode[3], opcode[2], notOpcode[1], opcode[0]);
	and loadupperimm(lui, notOpcode[5], notOpcode[4], opcode[3], opcode[2], opcode[1], opcode[0]);
	and jump(j, notOpcode[5], notOpcode[4], notOpcode[3], notOpcode[2], opcode[1], notOpcode[0]);
	and jumpandlink(jal, notOpcode[5], notOpcode[4], notOpcode[3], notOpcode[2], opcode[1], opcode[0]);
	
	and rswr(RsWrite, rtype, 1'b1);
	
	or alsr(ALUSrc, lw, sw, ori);
	
	and mtoreg(MemtoReg, lw, 1'b1);
	
	or wr1(WrReg1, rtype, jal);
	
	or wr2(WrReg2, rtype, lw, ori, lui);
	
	and jl(Jal, jal, 1'b1);
	
	and findori(ORI, ori, 1'b1);
	
	and findlui(LUI, lui, 1'b1);
	
	and memrd(MemRead, lw, 1'b1);
	
	and memwr(MemWr, sw, 1'b1);
	
	and bre(BranchE, beq, 1'b1);
	
	and brne(BranchNE, bne, 1'b1);
	
	and jmp(J, j, 1'b1);
	
	or alop1(ALUop[1], rtype, ori);
	
	or alop0(ALUop[0], beq, bne, ori);
	
endmodule
	