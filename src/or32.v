module or32(res, a, b);
	input [31:0] a, b;
	output [31:0] res;
	
	or o0(res[0], a[0], b[0]);
	or o1(res[1], a[1], b[1]);
	or o2(res[2], a[2], b[2]);
	or o3(res[3], a[3], b[3]);
	or o4(res[4], a[4], b[4]);
	or o5(res[5], a[5], b[5]);
	or o6(res[6], a[6], b[6]);
	or o7(res[7], a[7], b[7]);
	or o8(res[8], a[8], b[8]);
	or o9(res[9], a[9], b[9]);
	or o10(res[10], a[10], b[10]);
	or o11(res[11], a[11], b[11]);
	or o12(res[12], a[12], b[12]);
	or o13(res[13], a[13], b[13]);
	or o14(res[14], a[14], b[14]);
	or o15(res[15], a[15], b[15]);
	or o16(res[16], a[16], b[16]);
	or o17(res[17], a[17], b[17]);
	or o18(res[18], a[18], b[18]);
	or o19(res[19], a[19], b[19]);
	or o20(res[20], a[20], b[20]);
	or o21(res[21], a[21], b[21]);
	or o22(res[22], a[22], b[22]);
	or o23(res[23], a[23], b[23]);
	or o24(res[24], a[24], b[24]);
	or o25(res[25], a[25], b[25]);
	or o26(res[26], a[26], b[26]);
	or o27(res[27], a[27], b[27]);
	or o28(res[28], a[28], b[28]);
	or o29(res[29], a[29], b[29]);
	or o30(res[30], a[30], b[30]);
	or o31(res[31], a[31], b[31]);
	
endmodule