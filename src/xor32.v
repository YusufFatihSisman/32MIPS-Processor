module xor32(res, a, b);
	input [31:0] a, b;
	output [31:0] res;
	
	xor xo0(res[0],a[0], b[0]);
	xor xo1(res[1],a[1], b[1]);
	xor xo2(res[2], a[2], b[2]);
	xor xo3(res[3], a[3], b[3]);
	xor xo4(res[4], a[4], b[4]);
	xor xo5(res[5], a[5], b[5]);
	xor xo6(res[6], a[6], b[6]);
	xor xo7(res[7], a[7], b[7]);
	xor xo8(res[8], a[8], b[8]);
	xor xo9(res[9], a[9], b[9]);
	xor xo10(res[10], a[10], b[10]);
	xor xo11(res[11], a[11], b[11]);
	xor xo12(res[12], a[12], b[12]);
	xor xo13(res[13], a[13], b[13]);
	xor xo14(res[14], a[14], b[14]);
	xor xo15(res[15], a[15], b[15]);
	xor xo16(res[16], a[16], b[16]);
	xor xo17(res[17], a[17], b[17]);
	xor xo18(res[18], a[18], b[18]);
	xor xo19(res[19], a[19], b[19]);
	xor xo20(res[20], a[20], b[20]);
	xor xo21(res[21], a[21], b[21]);
	xor xo22(res[22], a[22], b[22]);
	xor xo23(res[23], a[23], b[23]);
	xor xo24(res[24], a[24], b[24]);
	xor xo25(res[25], a[25], b[25]);
	xor xo26(res[26], a[26], b[26]);
	xor xo27(res[27], a[27], b[27]);
	xor xo28(res[28], a[28], b[28]);
	xor xo29(res[29], a[29], b[29]);
	xor xo30(res[30], a[30], b[30]);
	xor xo31(res[31], a[31], b[31]);
	
endmodule