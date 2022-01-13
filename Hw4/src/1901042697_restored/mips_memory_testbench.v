`define DELAY 10
module mips_memory_testbench();

/*
module mips_memory(address ,read_data, write_data, mem_write, mem_read, clk);

output reg [31:0] read_data;
input [7:0] address;
input [31:0] write_data;
input mem_read,mem_write,clk;
*/

wire [31:0] read_data;

reg [31:0] address;
reg [31:0] write_data;
reg mem_read,mem_write,clk;

mips_memory myMem(address ,read_data, write_data, mem_write, mem_read, clk);

initial begin
	clk = 1'b1;
	write_data = 32'b11111111111111111111111111111111;
	address = 32'b00000000000000000000000000000011;
	mem_read = 0;
	mem_write = 1;
	#`DELAY;

	
	write_data = 32'b11111111111111111111111111111001;
	address = 32'b00000000000000000000000000000101;
	mem_read = 0;
	mem_write = 1;
	#`DELAY;

	
	write_data = 32'b11111111111111111111111111111001;
	address = 32'b00000000000000000000000000000001;
	mem_read = 1;
	mem_write = 0;
	#`DELAY;
	

	write_data = 32'b11111111111111111111111100000010;
	address = 32'b00000000000000000000000000000010;
	mem_read = 0;
	mem_write = 1;
	#`DELAY;
	

	
	write_data = 32'b11111111111111111111111100000010;
	address = 32'b00000000000000000000000000000111;
	mem_read = 1;
	mem_write = 0;
	#`DELAY;
	
	
#100 $finish;
end

always begin 
	#2 clk = ~clk;
end


initial begin
	$monitor("time = %2b address = %32b\n read = %1b write = %1b C = %1b \n R => %32b\n W  => %32b\n", $time, address, mem_read, mem_write, clk,read_data, write_data);
end


endmodule
