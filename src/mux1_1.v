module mux1_1(res, i0, i1, select);
	input i0, i1, select;
	output res;
	
	wire nSelect;
	wire [1:0] ands;
	
	not n(nSelect, select);
	
	and a0(ands[0], i0, nSelect);
	and a1(ands[1], i1, select);
	
	or r(res, ands[0], ands[1]);
	
endmodule