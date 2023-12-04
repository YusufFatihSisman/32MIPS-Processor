module mux32_1(res, i0, i1, select);
	input [31:0] i0, i1;
	input select;
	output [31:0] res;
	
	mux1_1 m0(res[0], i0[0], i1[0], select);
	mux1_1 m1(res[1], i0[1], i1[1], select);
	mux1_1 m2(res[2], i0[2], i1[2], select);
	mux1_1 m3(res[3], i0[3], i1[3], select);
	mux1_1 m4(res[4], i0[4], i1[4], select);
	mux1_1 m5(res[5], i0[5], i1[5], select);
	mux1_1 m6(res[6], i0[6], i1[6], select);
	mux1_1 m7(res[7], i0[7], i1[7], select);
	mux1_1 m8(res[8], i0[8], i1[8], select);
	mux1_1 m9(res[9], i0[9], i1[9], select);
	mux1_1 m10(res[10], i0[10], i1[10], select);
	mux1_1 m11(res[11], i0[11], i1[11], select);
	mux1_1 m12(res[12], i0[12], i1[12], select);
	mux1_1 m13(res[13], i0[13], i1[13], select);
	mux1_1 m14(res[14], i0[14], i1[14], select);
	mux1_1 m15(res[15], i0[15], i1[15], select);
	mux1_1 m16(res[16], i0[16], i1[16], select);
	mux1_1 m17(res[17], i0[17], i1[17], select);
	mux1_1 m18(res[18], i0[18], i1[18], select);
	mux1_1 m19(res[19], i0[19], i1[19], select);
	mux1_1 m20(res[20], i0[20], i1[20], select);
	mux1_1 m21(res[21], i0[21], i1[21], select);
	mux1_1 m22(res[22], i0[22], i1[22], select);
	mux1_1 m23(res[23], i0[23], i1[23], select);
	mux1_1 m24(res[24], i0[24], i1[24], select);
	mux1_1 m25(res[25], i0[25], i1[25], select);
	mux1_1 m26(res[26], i0[26], i1[26], select);
	mux1_1 m27(res[27], i0[27], i1[27], select);
	mux1_1 m28(res[28], i0[28], i1[28], select);
	mux1_1 m29(res[29], i0[29], i1[29], select);
	mux1_1 m30(res[30], i0[30], i1[30], select);
	mux1_1 m31(res[31], i0[31], i1[31], select);
	
endmodule	