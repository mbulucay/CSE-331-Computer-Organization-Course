`define DELAY 10
module mux_2x1_32bit_testbech();



reg [31:0] a;
reg [31:0] b;
reg s;
wire [31:0]r;

mux_2x1_32bit muxx(a, b, s, r);


initial begin

	a = 32'b00001110000000001111100010000010;
	b = 32'b00000000000000000000000000100001;
	s = 0;
	#`DELAY;
	
	
	a = 32'b11111111111111111111111111111111;
	b = 32'b00000000000000000000000000000000;
	s = 1;
	#`DELAY;
	

end


initial begin 
	$monitor("time = %2b a = %32b  b = %32b r = %32b s = %1b",$time, a, b, r, s);
end


endmodule
