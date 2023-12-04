module data_memory(readData, memWriteSign, memReadSign, address, writeData, clock);
	input[31:0] writeData, address;
	input memWriteSign, memReadSign, clock;
	output [31:0] readData;
	
	reg [31:0] MEMORY [255:0];
	
	assign readData = MEMORY[address[7:0]];
	
	always @(negedge clock) begin
		if(memWriteSign == 1'b1) begin
			MEMORY[address[7:0]] = writeData;
			//$writememb("data.mem", MEMORY);
		end
	end
	
	//always @(posedge clock) begin
	//	if(memReadSign == 1'b1) begin
	//		readData = MEMORY[address[7:0]];
	//	end
	//end

endmodule