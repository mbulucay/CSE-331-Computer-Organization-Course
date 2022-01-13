module mips_registers (read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );

	output reg [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [2:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	
	reg  [31:0] registers [7:0];

	initial begin
		$readmemb("registers.mem", registers);
	end
	
	always @(*)
		begin
			read_data_1 <= registers[read_reg_1];
			read_data_2 <= registers[read_reg_2];
		end
	
	always @(negedge clk)
		begin
		
			if(signal_reg_write && write_reg != 3'b000)
				begin
					registers[write_reg] <= write_data;
					$writememb("registers.mem", registers);
				end
			/*	
			else
				begin
					read_data_1 <= registers[read_reg_1];
					read_data_2 <= registers[read_reg_2];
				end
			*/
		end
		
		

endmodule
