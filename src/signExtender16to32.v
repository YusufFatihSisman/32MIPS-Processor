module signExtender16to32(res, a);
	input [15:0] a;
	output [31:0] res;
	
	and r0(res[0], a[0], 1'b1);
	and r1(res[1], a[1], 1'b1);
	and r2(res[2], a[2], 1'b1);
	and r3(res[3], a[3], 1'b1);
	and r4(res[4], a[4], 1'b1);
	and r5(res[5], a[5], 1'b1);
	and r6(res[6], a[6], 1'b1);
	and r7(res[7], a[7], 1'b1);
	and r8(res[8], a[8], 1'b1);
	and r9(res[9], a[9], 1'b1);
	and r10(res[10], a[10], 1'b1);
	and r11(res[11], a[11], 1'b1);
	and r12(res[12], a[12], 1'b1);
	and r13(res[13], a[13], 1'b1);
	and r14(res[14], a[14], 1'b1);
	and r15(res[15], a[15], 1'b1);
	and r16(res[16], a[15], 1'b1);
	and r17(res[17], a[15], 1'b1);
	and r18(res[18], a[15], 1'b1);
	and r19(res[19], a[15], 1'b1);
	and r20(res[20], a[15], 1'b1);
	and r21(res[21], a[15], 1'b1);
	and r22(res[22], a[15], 1'b1);
	and r23(res[23], a[15], 1'b1);
	and r24(res[24], a[15], 1'b1);
	and r25(res[25], a[15], 1'b1);
	and r26(res[26], a[15], 1'b1);
	and r27(res[27], a[15], 1'b1);
	and r28(res[28], a[15], 1'b1);
	and r29(res[29], a[15], 1'b1);
	and r30(res[30], a[15], 1'b1);
	and r31(res[31], a[15], 1'b1);
	
endmodule	