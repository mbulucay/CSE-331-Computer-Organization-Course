`define DELAY 20
module mux_4x1_testbench();

reg a, b, c, d, s0, s1;
wire returnVal;

mux_4x1 myMux(a, b, c, d, s0, s1, returnVal);

initial begin

a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; 
s0 = 1'b0; s1 = 1'b0;
#`DELAY;

a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; 
s0 = 1'b0; s1 = 1'b1;
#`DELAY;

a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; 
s0 = 1'b1; s1 = 1'b0;
#`DELAY;

a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; 
s0 = 1'b1; s1 = 1'b1;
#`DELAY;


end


initial begin
$monitor("time = %2d, a =%1b, b=%1b, c =%1b, d=%1b, s0=%1b,  s1=%1b, returnVal=%1b", $time, a, b, c, d, s0, s1, returnVal);
end


endmodule
