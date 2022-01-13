module onebitALU(a, b, ALUOp, cin, R, cout);

input a, b, cin;
input [2:0] ALUOp;
output R, cout;

wire Wxor[2:0];
wire Wor[2:0];
wire Wand[3:0];
wire Wnot[1:0];


xor xor0(Wxor[0], b, ALUOp[2]);
or or0(Wor[0], a, Wxor[0]);
and and0(Wand[0], a, Wxor[0]);
not not0(Wnot[0], Wand[0]);
and and1(Wand[1], Wnot[0], Wor[0]);


and and2(Wand[2], Wand[1], cin);
or or1(Wor[1], Wand[1], cin);
not not1(Wnot[1], Wand[2]);


and and3(Wand[3], Wnot[1], Wor[1]);
or or2(cout, Wand[0], Wand[2]);


mux_4x1 myMux(Wand[0], Wand[3], Wor[0], 0, ALUOp[1], ALUOp[0] ,R);

endmodule
