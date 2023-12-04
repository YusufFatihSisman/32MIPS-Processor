module alu32(res, compareResult, zero, a, b, aluCont);
	input [31:0] a, b;
	input [2:0] aluCont;
	output [31:0] res;
	output [31:0] compareResult;
	output zero; 
	wire negative, carry_out;
	
	wire nZero;
	wire [1:0] tempComp;
	wire[30:0] carry;
	
	alu a0(res[0], carry[0], aluCont[2], a[0], b[0], aluCont);
	alu a1(res[1], carry[1], carry[0], a[1], b[1], aluCont);
	alu a2(res[2], carry[2], carry[1], a[2], b[2], aluCont);
	alu a3(res[3], carry[3], carry[2], a[3], b[3], aluCont);
	alu a4(res[4], carry[4], carry[3], a[4], b[4], aluCont);
	alu a5(res[5], carry[5], carry[4], a[5], b[5], aluCont);
	alu a6(res[6], carry[6], carry[5], a[6], b[6], aluCont);
	alu a7(res[7], carry[7], carry[6], a[7], b[7], aluCont);
	alu a8(res[8], carry[8], carry[7], a[8], b[8], aluCont);
	alu a9(res[9], carry[9], carry[8], a[9], b[9], aluCont);
	alu a10(res[10], carry[10], carry[9], a[10], b[10], aluCont);
	alu a11(res[11], carry[11], carry[10], a[11], b[11], aluCont);
	alu a12(res[12], carry[12], carry[11], a[12], b[12], aluCont);
	alu a13(res[13], carry[13], carry[12], a[13], b[13], aluCont);
	alu a14(res[14], carry[14], carry[13], a[14], b[14], aluCont);
	alu a15(res[15], carry[15], carry[14], a[15], b[15], aluCont);
	alu a16(res[16], carry[16], carry[15], a[16], b[16], aluCont);
	alu a17(res[17], carry[17], carry[16], a[17], b[17], aluCont);
	alu a18(res[18], carry[18], carry[17], a[18], b[18], aluCont);
	alu a19(res[19], carry[19], carry[18], a[19], b[19], aluCont);
	alu a20(res[20], carry[20], carry[19], a[20], b[20], aluCont);
	alu a21(res[21], carry[21], carry[20], a[21], b[21], aluCont);
	alu a22(res[22], carry[22], carry[21], a[22], b[22], aluCont);
	alu a23(res[23], carry[23], carry[22], a[23], b[23], aluCont);
	alu a24(res[24], carry[24], carry[23], a[24], b[24], aluCont);
	alu a25(res[25], carry[25], carry[24], a[25], b[25], aluCont);
	alu a26(res[26], carry[26], carry[25], a[26], b[26], aluCont);
	alu a27(res[27], carry[27], carry[26], a[27], b[27], aluCont);
	alu a28(res[28], carry[28], carry[27], a[28], b[28], aluCont);
	alu a29(res[29], carry[29], carry[28], a[29], b[29], aluCont);
	alu a30(res[30], carry[30], carry[29], a[30], b[30], aluCont);
	aluMsb a31(res[31], negative, carry_out, carry[30], a[31], b[31], aluCont);
	
	or nonZero(nZero, res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7],
				  res[8], res[9], res[10], res[11], res[12], res[13], res[14], res[15], 
				  res[16], res[17], res[18], res[19], res[20], res[21], res[22], res[23], 
				  res[24], res[25], res[26], res[27], res[28], res[29], res[30], res[31]);
	
	not isZero(zero, nZero);
	 
	// if result == 0, 01
	// if result < 0, 10
	// if result > 0, 11
	mux1_1 greatORzero(tempComp[1], 1'b1, 1'b0, zero);
//	mux1_1 greatORless(tempComp[0], 1'b1, 1'b0, negative); 
	mux1_1 greatORless(tempComp[0], 1'b1, 1'b0, res[31]);
	
	and c0(compareResult[0], tempComp[0], 1'b1);
	and c1(compareResult[1], tempComp[1], 1'b1);
	and c2(compareResult[2], 1'b0, 1'b0);
	and c3(compareResult[3], 1'b0, 1'b0);
	and c4(compareResult[4], 1'b0, 1'b0);
	and c5(compareResult[5], 1'b0, 1'b0);
	and c6(compareResult[6], 1'b0, 1'b0);
	and c7(compareResult[7], 1'b0, 1'b0);
	and c8(compareResult[8], 1'b0, 1'b0);
	and c9(compareResult[9], 1'b0, 1'b0);
	and c10(compareResult[10], 1'b0, 1'b0);
	and c11(compareResult[11], 1'b0, 1'b0);
	and c12(compareResult[12], 1'b0, 1'b0);
	and c13(compareResult[13], 1'b0, 1'b0);
	and c14(compareResult[14], 1'b0, 1'b0);
	and c15(compareResult[15], 1'b0, 1'b0);
	and c16(compareResult[16], 1'b0, 1'b0);
	and c17(compareResult[17], 1'b0, 1'b0);
	and c18(compareResult[18], 1'b0, 1'b0);
	and c19(compareResult[19], 1'b0, 1'b0);
	and c20(compareResult[20], 1'b0, 1'b0);
	and c21(compareResult[21], 1'b0, 1'b0);
	and c22(compareResult[22], 1'b0, 1'b0);
	and c23(compareResult[23], 1'b0, 1'b0);
	and c24(compareResult[24], 1'b0, 1'b0);
	and c25(compareResult[25], 1'b0, 1'b0);
	and c26(compareResult[26], 1'b0, 1'b0);
	and c27(compareResult[27], 1'b0, 1'b0);
	and c28(compareResult[28], 1'b0, 1'b0);
	and c29(compareResult[29], 1'b0, 1'b0);
	and c30(compareResult[30], 1'b0, 1'b0);
	and c31(compareResult[31], 1'b0, 1'b0);
	
endmodule