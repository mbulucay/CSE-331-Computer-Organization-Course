module mips_memory(address ,read_data, write_data, mem_write, mem_read, clk);

output reg [31:0] read_data;

input [31:0] address;
input [31:0] write_data;
input mem_read,mem_write,clk;

reg [31:0] memory [255:0];

	initial begin
		$readmemb("data.txt", memory);
	end

	
	always @(*)
		begin 
			if (mem_read)
				begin
					read_data <= memory[address];
				end
		end
	
	
	always @(posedge clk)
	
		begin
			
			if(mem_write)
				begin 
					memory[address] <= write_data; 
					$writememb("data.txt", memory);
				end
		
		end

endmodule
