`define DELAY 20
module zero_extend_testbrench();

reg [5:0] in;
wire [31:0] out;

zero_extend myExtend(in, out);


initial begin 

in = 6'b010011;
#`DELAY;


in = 6'b010111;
#`DELAY;

in = 6'b111111;
#`DELAY;

in = 6'b100000;
#`DELAY;

end


initial begin 

$monitor("time= %2d, input = %6b  output = %32b ",$time, in, out);

end


endmodule
