module aluMsb(res, negative, carry_out, carry_in, a, b, aluCont);
	input a, b, carry_in;
	input [2:0] aluCont;
	output res, negative, carry_out;
	
	wire newB, overflow;
	wire [7:0]subOps;
	
	xor bXORsub(newB, b, aluCont[2]);
	
	and aANDb(subOps[0], a, newB);
	not NaANDb(subOps[1], subOps[0]);
	or aORb(subOps[2], a , newB);
	and aXORb(subOps[3], subOps[2], subOps[1]);
	
	and aXORbANDc(subOps[4], subOps[3], carry_in);
	not NaXORbANDc(subOps[5], subOps[4]);
	or aXORbORc(subOps[6], subOps[3], carry_in);
	and aXORbXORc(subOps[7], subOps[6], subOps[5]);
	
	or cOut(carry_out, subOps[0], subOps[4]);
	
	xor V(overflow, carry_in, carry_out);
	xor set(negative, overflow, subOps[7]);
	
	mux1_2 result(res, subOps[0], subOps[2], subOps[3], subOps[7], aluCont[1], aluCont[0]); 
	
endmodule