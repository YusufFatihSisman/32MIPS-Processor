module mips_registers(readData1, readData2, readReg1, readReg2, RegWriteSign1, RegWriteSign2, writeReg1, writeReg2, writeData1, writeData2, clock);

	output [31:0] readData1, readData2;
	input [4:0] readReg1, readReg2, writeReg1, writeReg2;
	input RegWriteSign1, RegWriteSign2, clock;
	input [31:0] writeData1, writeData2;
	
	reg [31:0] registers [31:0];
	
	assign readData1 = registers[readReg1];
	assign readData2 = registers[readReg2];
	
	always @(negedge clock) begin
		if(RegWriteSign1 == 1'b1 && writeReg1 != 5'b00000) begin
			registers[writeReg1] = writeData1;
		end
		if(RegWriteSign2 == 1'b1 && writeReg2 != 5'b00000) begin
			registers[writeReg2] = writeData2;
		end
	end
	
endmodule
	