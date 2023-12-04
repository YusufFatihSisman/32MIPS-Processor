module mips_testbench();
	reg clk;
	wire [31:0] result;

	always #100 clk=~clk;

	mips m0(clk);
	
	initial begin
		clk = 1;
		//you must sure the memory files as same name in instruction modülü read and mips_register modülü read.
		$readmemb("instruction.mem",m0.im0.INST_MEMORY); 
		$readmemb("registers.mem",m0.mr0.registers);
		$readmemb("data.mem", m0.dm0.MEMORY);
	end

	always @(negedge clk) begin	
		$writememb("data_out.mem", m0.dm0.MEMORY);
		$writememb("registers_out.mem", m0.mr0.registers);
		$display("write data 1 = %32b, write register 1 = %5b, write data 2 = %32b, write register 2 = %5b, read data 1 = %32b, read data 2 = %32b, current pc = %32b, next pc = %32b, instruction = %32b \n" ,m0.writeData1, m0.writeReg1, m0.writeData2, m0.writeReg2, m0.readData1, m0.readData2, m0.instructionAddress, m0.PC, m0.instruction);
	end
		
	
endmodule
