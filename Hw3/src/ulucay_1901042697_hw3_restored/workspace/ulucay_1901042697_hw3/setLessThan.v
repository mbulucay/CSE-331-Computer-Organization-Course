module setLessThan(AluOp, S, R);

input [2:0] AluOp;
input S;
input R;

wire tmp,not0,not1;

not n0(not0, AluOp[0]);
not n1(not1, AluOp[1]);

and aa(tmp, AluOp[2], not1, not0, S);

xor (R, R,tmp);




endmodule
