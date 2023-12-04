module instruction_memory(instruction, address, clock);

	input [31:0] address;
	input clock;
	output reg[31:0] instruction;
	
	reg [31:0] INST_MEMORY[0:16];
	
	always @(posedge clock) begin
		//$readmemb("instruction.mem", INST_MEMORY);
		instruction <= INST_MEMORY[address];
	end
	
endmodule