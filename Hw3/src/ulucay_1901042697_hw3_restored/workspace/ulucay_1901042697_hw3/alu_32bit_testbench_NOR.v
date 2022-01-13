`define DELAY 20
module alu_32bit_testbench_NOR();




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

//NOR
a = 32'b10101010101010101010101010101010; 
b = 32'b01010101010101010101010101010101; 
cin = 1'b0;
Op = 3'b101;
#`DELAY;


a = 32'b01010101010101010100000000000000; 
b = 32'b00110000101000111110101010101010; 
cin = 1'b0;
Op = 3'b101;
#`DELAY;

a = 32'b01010101010101010100001111000000; 
b = 32'b00000000101001100110101010101010; 
cin = 1'b0;
Op = 3'b101;
#`DELAY;

a = 32'b01000101100001010100001111000000; 
b = 32'b00011100101110000110000000101010; 
cin = 1'b0;
Op = 3'b101;
#`DELAY;

a = 32'b01010101010101010111001111000000; 
b = 32'b00011110101001100110101010101010; 
cin = 1'b0;
Op = 3'b101;
#`DELAY;

a = 32'b00000101100001010100001111000000; 
b = 32'b00000000000000000110001111111010; 
cin = 1'b0;
Op = 3'b101;
#`DELAY;

end


initial begin

$monitor("time = %2d, \na=%32b,\nb=%32b, \nR=%32b,\n cin =%1b, cout=%1b, Op%3b V=%1b S=%1b", $time, a, b, R, cin, cout, Op, V, S);

end


endmodule
