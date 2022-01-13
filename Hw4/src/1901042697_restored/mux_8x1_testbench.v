`define DELAY 20
module mux_8x1_testbench();


reg a, b, c, d, e, f, g, h, s0, s1, s2;
wire returnVal;

mux_8x1 myMux(a, b, c, d, e, f, g, h, s0, s1, s2, returnVal);

initial begin

//a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; 
//s0 = 1'b0; s1 = 1'b0; s2 = 1'b0;
//#`DELAY;

a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b0; f = 1'b1; g = 1'b1; h = 1'b1; 
s0 = 1'b1; s1 = 1'b0; s2 = 1'b0;
#`DELAY;

a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; 
s0 = 1'b0; s1 = 1'b0; s2 = 1'b0;
#`DELAY;

a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; 
s0 = 1'b0; s1 = 1'b0; s2 = 1'b1;
#`DELAY;

a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; 
s0 = 1'b0; s1 = 1'b1; s2 = 1'b0;
#`DELAY;

a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; 
s0 = 1'b0; s1 = 1'b1; s2 = 1'b1;
#`DELAY;

a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b0; f = 1'b1; g = 1'b1; h = 1'b1; 
s0 = 1'b1; s1 = 1'b0; s2 = 1'b0;
#`DELAY;

a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; 
s0 = 1'b1; s1 = 1'b0; s2 = 1'b1;
#`DELAY;

a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; 
s0 = 1'b1; s1 = 1'b1; s2 = 1'b0;
#`DELAY;

a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; 
s0 = 1'b0; s1 = 1'b0; s2 = 1'b1;
#`DELAY;


end


initial begin

$monitor("time = %2d, a =%1b, b=%1b, c =%1b, d=%1b, e =%1b, f=%1b, g =%1b, h=%1b, s0=%1b, s1=%1b, s2=%1b returnVal=%1b", $time, a, b, c, d, e, f, g, h, s0, s1, s2, returnVal);
end


endmodule
