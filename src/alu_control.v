module alu_control(ALUcontrol, jr, ALUop, func);
	input [1:0] ALUop;
	input [5:0] func;
	output [2:0] ALUcontrol;
	output jr;
	
	wire [5:0] notFunc;
	wire [1:0] notALUop;
	wire subtractFunc, addFunc, xorFunc, orFunc, jrFunc, aluop01, aluop10, aluop11;
	wire [5:0] subOps;
	
	not no0(notALUop[0], ALUop[0]);
	not no1(notALUop[1], ALUop[1]);
	
	not n0(notFunc[0], func[0]);
	not n1(notFunc[1], func[1]);
	not n2(notFunc[2], func[2]);
	not n3(notFunc[3], func[3]);
	not n4(notFunc[4], func[4]);
	not n5(notFunc[5], func[5]);
	
	and subf(subtractFunc, func[5], notFunc[4], notFunc[3], notFunc[2], func[1], notFunc[0]);
	and addf(addFunc, func[5], notFunc[4], notFunc[3], notFunc[2], notFunc[1], notFunc[0]);
	and xorf(xorFunc, func[5], notFunc[4], notFunc[3], func[2], func[1], notFunc[0]);
	and orf(orFunc, func[5], notFunc[4], notFunc[3], func[2], notFunc[1], func[0]);
	and jrf(jrFunc, notFunc[5], notFunc[4], func[3], notFunc[2], notFunc[1], notFunc[0]);
	
	and a01(aluop01, notALUop[1], ALUop[0]); //aluop01
	and a10(aluop10, ALUop[1], notALUop[0]); //aluop10
	and a11(aluop11, ALUop[1], ALUop[0]); //aluop11
	
	//aluop10(add + sub + or)
	or o0(subOps[0], addFunc, subtractFunc, orFunc);
	and a0(subOps[1], aluop10, subOps[0]);
	
	or alucont0(ALUcontrol[0], notALUop[1], aluop11, subOps[1]);
	
	//aluop10(add + sub + xor)
	or o1(subOps[2], addFunc, subtractFunc, xorFunc);
	and a1(subOps[3], aluop10, subOps[2]);
	
	or alucont1(ALUcontrol[1], notALUop[1], subOps[3]);
	
	//aluop10.sub
	and a2(subOps[4], aluop10, subtractFunc);
	
	or alucont2(ALUcontrol[2], aluop01, subOps[4]);
	
	and a3(jr, aluop10, jrFunc);
	
endmodule