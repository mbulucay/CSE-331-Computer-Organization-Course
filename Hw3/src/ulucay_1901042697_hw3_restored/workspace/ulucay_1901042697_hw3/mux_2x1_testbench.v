`define DELAY 20

module mux_2x1_testbench();

reg a, b, s;
wire returnVal;

mux_2x1 myMux(a, b, s, returnVal);

initial begin

a = 1'b0; b = 1'b1; 
s = 1'b0;
#`DELAY;

a = 1'b1; b = 1'b0; 
s = 1'b1;
#`DELAY;

a = 1'b0; b = 1'b1; 
s = 1'b1;
#`DELAY;

end



initial begin
$monitor("time = %2d, a =%1b, b=%1b, s=%1b, returnVal=%1b", $time, a, b, s, returnVal);
end

endmodule
