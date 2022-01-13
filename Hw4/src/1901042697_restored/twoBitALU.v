module twoBitALU(a, b, Aluop, cin, cout, R, S, V);
input [2:0] Aluop;
input [1:0] a;
input [1:0] b;
input cin;
output cout ,S, V;
output [1:0] R;

wire [1:0] outs;

//module ALU(ai, bi, ALUOP, cin, cout, R);
ALU bit_0(a[0], b[0], Aluop, cin, outs[0], R[0]);

//module mostALU(ai, bi, ALUOP, cin, cout, R, S, V);
mostALU bit_1(a[1], b[1], Aluop, outs[0], cout, R[1], S, V);

endmodule
