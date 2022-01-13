module instruction_memory(clk, address, instruction);
	input clk;
	input [31:0] address;
	output reg [15:0] instruction;

	reg [15:0] instructions [255:0];
	
	initial begin
		$readmemb("instructionList.txt",instructions);
	end

	always @(posedge clk)
		begin 
			instruction <= instructions[address];
		end

endmodule
