module adder(sum, carry_out, carry_in, a, b);
	input carry_in, a, b;
	output sum, carry_out;
	wire aXORb, aANDb, cANDaXORb;
	
	xor axorb(aXORb, a, b);
	xor result(sum, aXORb, carry_in);
	and candaxorb(cANDaXORb, carry_in, aXORb);
	and aandb(aANDb, a, b);
	or carryO(carry_out, cANDaXORb, aANDb);

endmodule