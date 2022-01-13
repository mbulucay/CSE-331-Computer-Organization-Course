`define DELAY 20
module alu_32bit_testbench_STL();


reg [31:0] a;
reg [31:0] b;
reg cin;
reg [2:0] Op;

wire [31:0] R;
wire cout, V, S;

/*
module alu_32bit(a, b, Aluop, cin, cout, R, S, V);
input [2:0] Aluop;
input [31:0] a;
input [31:0] b;
output [31:0] R;
input cin;
output cout ,S, V;
*/

alu_32bit myALU(a, b, Op, cin, cout, R, S, V);

initial begin


//SLT
a = 32'b00000000000000000000000000001011; 
b = 32'b00000000000011111111000000000101;
cin = 1'b0;
Op = 3'b100;
#`DELAY;

a = 32'b00000000000000000000000000001011; 
b = 32'b00000000000000000000001000000101; 
cin = 1'b0;
Op = 3'b100;
#`DELAY;

a = 32'b00000000000000000100011000001011; 
b = 32'b00000000000000001000000000000000; 
cin = 1'b0;
Op = 3'b100;
#`DELAY;

a = 32'b00000000010110000100011000001011; 
b = 32'b00000100000000000110001000000101; 
cin = 1'b0;
Op = 3'b100;
#`DELAY;

a = 32'b00111000010000000100111100000111; 
b = 32'b00000011000000000011000100000001; 
cin = 1'b0;
Op = 3'b100;
#`DELAY;

a = 32'b00000000010000000100011000001011; 
b = 32'b01111110000000000110001000000101; 
cin = 1'b0;
Op = 3'b100;
#`DELAY;

a = 32'b00000000010011000100011000001011; 
b = 32'b00000000001111000110001000000101; 
cin = 1'b0;
Op = 3'b100;
#`DELAY;

end


initial begin

$monitor("time = %2d, \na=%32b,\nb=%32b, \nR=%32b,\n cin =%1b, cout=%1b, Op%3b V=%1b S=%1b", $time, a, b, R, cin, cout, Op, V, S);
end

endmodule


