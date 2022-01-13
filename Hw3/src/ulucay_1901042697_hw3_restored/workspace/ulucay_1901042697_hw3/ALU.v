module ALU(ai, bi, ALUOP, cin, cout, R);

input ai, bi, cin;
input [2:0] ALUOP;
output cout, R;

wire _add, _xor, _sub, _mult, _slt, _nor, _and, _or;
wire not0, not1, and0, and1, or0;


// Eger 010 veya 100 ise alinan b flip ediliyor
wire not_op0, not_op1, not_op2;
wire flip_and_1, flip_and_2, flip_or, b;

not nop0(not_op0, ALUOP[0]);
not nop1(not_op1, ALUOP[1]);
not nop2(not_op2, ALUOP[2]);

and flip_And_1(flip_and_1, not_op2, ALUOP[1], not_op0);
and flip_And_2(flip_and_2, ALUOP[2], not_op1, not_op0);

or flip_Or(flip_or, flip_and_1, flip_and_2);
xor IsFlip(b, flip_or, bi);


//or and 
or _Or(_or, ai, b);
and _And(_and, ai, b);
nor _Nor(_nor, ai, bi);
xor _Xor(_xor, ai, bi);

//summing
not Not0(not0, _and);
and And0(and0, not0, _or);
and And1(and1, and0, cin);
or Or0(or0, and0, cin);
not Not1(not1, and1);

or Cout(cout, _and, and1);
and Add(_add, not1, or0);
and Sub(_sub, not1, or0);
and Mult(_mult, 0, 0);
and Slt(_slt, 0 , 0);

mux_8x1 Result(_add, _xor, _sub, _mult, _slt, _nor, _and, _or ,ALUOP[2], ALUOP[1], ALUOP[0], R);

endmodule
