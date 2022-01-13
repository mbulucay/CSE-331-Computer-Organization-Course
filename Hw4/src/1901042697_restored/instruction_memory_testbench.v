`define DELAY 10
module instruction_memory_testbench();
	
	reg clk;
	reg [31:0] address;
	wire [15:0] instruction;
	
	instruction_memory myInstMem(clk, address, instruction);

initial begin

	clk = 1'b0;
	address = 0;
	
	#100 $finish;
end

always begin
	#5 clk = ~clk;
end


always @(posedge clk)
	begin 
		$monitor("time = %2b clk = %1b address = %32b inst = %16b \n",$time,clk, address, instruction);
		#`DELAY
		address <= address + 1;
	
	end

endmodule
