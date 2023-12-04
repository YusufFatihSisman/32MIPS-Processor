module mux5_1(res, i0, i1, select);

	input [4:0] i0, i1;
	input  select;
	output [4:0] res;
	
	mux1_1 m0(res[0], i0[0], i1[0], select);
	mux1_1 m1(res[1], i0[1], i1[1], select);
	mux1_1 m2(res[2], i0[2], i1[2], select);
	mux1_1 m3(res[3], i0[3], i1[3], select);
	mux1_1 m4(res[4], i0[4], i1[4], select);

endmodule