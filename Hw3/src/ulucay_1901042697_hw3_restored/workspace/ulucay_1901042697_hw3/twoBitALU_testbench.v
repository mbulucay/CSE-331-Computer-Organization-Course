`define DELAY 20
module twoBitALU_testbench();

reg [1:0] a;
reg [1:0] b;
reg cin;
reg [2:0] Op;

wire [1:0] results;
wire C, V, S;

/*
module twoBitALU(a, b, Aluop, cin, cout, R, S, V);
input [2:0] Aluop;
input [1:0] a;
input [1:0] b;
input cin;
output cout ,S, V;
output [1:0] R;
*/

twoBitALU myAlu(a, b, Op, cin, C, results, S, V);

initial begin
/*
//OR
a = 2'b01; b = 2'b10; 
cin = 1'b0;
Op[0] = 1'b1; Op[1] = 1'b1; Op[2] = 1'b1;
#`DELAY;

a = 2'b00; b = 2'b10; 
cin = 1'b0;
Op[0] = 1'b1; Op[1] = 1'b1; Op[2] = 1'b1;
#`DELAY;

a = 2'b11; b = 2'b11; 
cin = 1'b0;
Op[0] = 1'b1; Op[1] = 1'b1; Op[2] = 1'b1;
#`DELAY;
*/

/*
//AND
a = 2'b10; b = 2'b01; 
cin = 1'b0;
Op[0] = 1'b1; Op[1] = 1'b1; Op[2] = 1'b0;
#`DELAY;

a = 2'b11; b = 2'b11; 
cin = 1'b0;
Op[0] = 1'b1; Op[1] = 1'b1; Op[2] = 1'b0;
#`DELAY;


a = 2'b00; b = 2'b01; 
cin = 1'b0;
Op[0] = 1'b1; Op[1] = 1'b1; Op[2] = 1'b0;
#`DELAY;
*/

/*
//ADD
a = 2'b11; b = 2'b11; 
cin = 1'b0;
Op[0] = 1'b0; Op[1] = 1'b0; Op[2] = 1'b0;
#`DELAY;

a = 2'b10; b = 2'b11; 
cin = 1'b0;
Op[0] = 1'b0; Op[1] = 1'b0; Op[2] = 1'b0;
#`DELAY;

a = 2'b00; b = 2'b11; 
cin = 1'b0;
Op[0] = 1'b0; Op[1] = 1'b0; Op[2] = 1'b0;
#`DELAY;

a = 2'b01; b = 2'b10; 
cin = 1'b0;
Op[0] = 1'b0; Op[1] = 1'b0; Op[2] = 1'b0;
#`DELAY;
*/

//SLT
a = 2'b00; b = 2'b11; 
cin = 1'b0;
Op[0] = 1'b1; Op[1] = 1'b0; Op[2] = 1'b0;


end


initial begin
$monitor("time = %2d, a =%2b, b=%2b, cin =%1b, Op0=%1b,, Op1=%1b, Op2=%1b cout=%1b,  R=%2b V=%1b S=%1b", $time, a, b, cin, Op[0], Op[1], Op[2], C, results, V, S);
end


endmodule
