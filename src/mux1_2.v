module mux1_2(res, i0, i1, i2, i3, select1, select0);
	input i0, i1, i2, i3, select1, select0;
	output res;
	
	wire nSelect0, nSelect1;
	wire [3:0] ands;
	
	not n0(nSelect0, select0);
	not n1(nSelect1, select1);
	
	and a0(ands[0], nSelect1, nSelect0, i0);
	and a1(ands[1], nSelect1, select0, i1);
	and a2(ands[2], select1, nSelect0, i2);
	and a3(ands[3], select1, select0, i3);
	
	or result(res, ands[0], ands[1], ands[2], ands[3]);

endmodule	