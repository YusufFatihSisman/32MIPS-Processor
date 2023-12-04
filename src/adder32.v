module adder32(sum, a, b);
	input [31:0] a, b;
	output [31:0] sum;
	wire carry_out;
	wire [30:0] carry;
	
	adder a0(sum[0], carry[0], 1'b0, a[0], b[0]);
	adder a1(sum[1], carry[1], carry[0], a[1], b[1]);
	adder a2(sum[2], carry[2], carry[1], a[2], b[2]);
	adder a3(sum[3], carry[3], carry[2], a[3], b[3]);
	adder a4(sum[4], carry[4], carry[3], a[4], b[4]);
	adder a5(sum[5], carry[5], carry[4], a[5], b[5]);
	adder a6(sum[6], carry[6], carry[5], a[6], b[6]);
	adder a7(sum[7], carry[7], carry[6], a[7], b[7]);
	adder a8(sum[8], carry[8], carry[7], a[8], b[8]);
	adder a9(sum[9], carry[9], carry[8], a[9], b[9]);
	adder a10(sum[10], carry[10], carry[9], a[10], b[10]);
	adder a11(sum[11], carry[11], carry[10], a[11], b[11]);
	adder a12(sum[12], carry[12], carry[11], a[12], b[12]);
	adder a13(sum[13], carry[13], carry[12], a[13], b[13]);
	adder a14(sum[14], carry[14], carry[13], a[14], b[14]);
	adder a15(sum[15], carry[15], carry[14], a[15], b[15]);
	adder a16(sum[16], carry[16], carry[15], a[16], b[16]);
	adder a17(sum[17], carry[17], carry[16], a[17], b[17]);
	adder a18(sum[18], carry[18], carry[17], a[18], b[18]);
	adder a19(sum[19], carry[19], carry[18], a[19], b[19]);
	adder a20(sum[20], carry[20], carry[19], a[20], b[20]);
	adder a21(sum[21], carry[21], carry[20], a[21], b[21]);
	adder a22(sum[22], carry[22], carry[21], a[22], b[22]);
	adder a23(sum[23], carry[23], carry[22], a[23], b[23]);
	adder a24(sum[24], carry[24], carry[23], a[24], b[24]);
	adder a25(sum[25], carry[25], carry[24], a[25], b[25]);
	adder a26(sum[26], carry[26], carry[25], a[26], b[26]);
	adder a27(sum[27], carry[27], carry[26], a[27], b[27]);
	adder a28(sum[28], carry[28], carry[27], a[28], b[28]);
	adder a29(sum[29], carry[29], carry[28], a[29], b[29]);
	adder a30(sum[30], carry[30], carry[29], a[30], b[30]);
	adder a31(sum[31], carry_out, carry[30], a[31], b[31]);
	
endmodule