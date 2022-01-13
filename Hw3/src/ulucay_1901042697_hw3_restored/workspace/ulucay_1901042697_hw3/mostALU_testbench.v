`define DELAY 20
module mostALU_testbench();

reg a, b, cin;
reg [2:0] AluOp;
wire cout, R, S, V;

//mostALU(ai, bi, ALUOP, cin, cout, R, S, V);
mostALU myMostAlu(a, b, AluOp ,cin, cout, R, S, V);




endmodule
