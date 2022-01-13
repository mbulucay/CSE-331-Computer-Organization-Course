`define DELAY 10
module mips_registers_testbench();

	wire [31:0] read_data_1, read_data_2;
	
	reg [31:0] write_data;
	reg [2:0] read_reg_1, read_reg_2, write_reg;
	reg signal_reg_write, clk;


mips_registers myReg(read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);

initial begin 

	//$readmemb("registers.mem", myReg.registers);
	
	clk = 1'b0;
	write_data = 32'b00000000000000000000000000000111;
	write_reg =  3'b111;
	read_reg_1 = 3'b000;
	read_reg_2 = 3'b001;
	signal_reg_write = 1;
	#`DELAY;


	write_data = 32'b00000000000000000000000000000110;
	read_reg_1 = 3'b010;
	read_reg_2 = 3'b011;
	write_reg =  3'b110;
	signal_reg_write = 1;
	#`DELAY;



	write_data = 32'b11110000000011110000111111110101;
	read_reg_1 = 3'b011;
	read_reg_2 = 3'b100;
	write_reg =  3'b101;
	signal_reg_write = 1;
	#`DELAY;


	write_data = 32'b11111111111111110000000000000100;
	write_reg =  3'b100;
	read_reg_1 = 3'b100;
	read_reg_2 = 3'b101;
	signal_reg_write = 1;
	#`DELAY;

	//$writememb("../../registers.mem", myReg.registers);

end

always begin
	#2 clk = ~clk;
end


initial begin 

	$monitor("time = %2b write_signal= %1b clk = %1b \n %3b => R1 = %32b \n %3b => R2 = %32b \n %3b => W = %32b",$time, signal_reg_write, clk, read_reg_1, read_data_1, read_reg_2, read_data_2, write_reg, write_data);

end


endmodule
