module alu_control(opctr, opcode, func);

output [2:0] opctr;

input [2:0] opcode;
input [2:0] func;

wire nop0, nop1, nop2;
wire nof0, nof1, nof2;

wire ctr0_0,ctr0_1,ctr0_2, ctr0_3, ctr0_4;
wire ctr1_0,ctr1_1,ctr1_2, ctr1_3, ctr1_4, ctr1_5;
wire ctr2_0,ctr2_1,ctr2_2, ctr2_3, ctr2_4, ctr2_5, ctr2_6;


not NotOp0(nop0, opcode[0]);
not NotOp1(nop1, opcode[1]);
not NotOp2(nop2, opcode[2]);

not NotFu0(nof0, func[0]);
not NotFu1(nof1, func[1]);
not NotFu2(nof2, func[2]);


and Ctr00(ctr0_0,	nof2,	func[1],	func[0],	nop2,	nop1,	nop0);
and Ctr01(ctr0_1, func[2],	nof1,	nof0,	nop2,	nop1,	nop0);
and Ctr02(ctr0_2, func[2],	nof1, func[0], nop2,	nop1,	nop0);
and Ctr03(ctr0_3, nop2, opcode[1], opcode[0]);
and Ctr04(ctr0_4, opcode[2], nop1,	nop0);

and Ctr10(ctr1_0, nof2, nof1,	nof0, nop2,	nop1,	nop0);
and Ctr11(ctr1_1, nof2, func[1],	nof0, nop2,	nop1,	nop0);
and Ctr12(ctr1_2, func[2],	nof1, func[0], nop2,	nop1,	nop0);
and Ctr13(ctr1_3, nop2,	opcode[1], nop0);
and Ctr14(ctr1_4, nop2,	opcode[1], opcode[0]);
and Ctr15(ctr1_5, opcode[2], nop1,	opcode[0]);

and Ctr20(ctr2_0, nof2, nof1,	nof0, nop2,	nop1,	nop0);
and Ctr21(ctr2_1, func[2], nof1,	nof0, nop2,	nop1,	nop0);
and Ctr22(ctr2_2, func[2],	nof1, func[0], nop2,	nop1,	nop0);
and Ctr23(ctr2_3, nop2,	opcode[1], nop0);
and Ctr24(ctr2_4, nop2,	opcode[1], opcode[0]);
and Ctr25(ctr2_5, opcode[2], nop1, nop0);
and Ctr26(ctr2_6, opcode[2], opcode[1], nop0);


or Ctr0(opctr[0], ctr0_0,ctr0_1,ctr0_2, ctr0_3, ctr0_4);
or Ctr1(opctr[1], ctr1_0,ctr1_1,ctr1_2, ctr1_3, ctr1_4, ctr1_5);
or Ctr2(opctr[2], ctr2_0,ctr2_1,ctr2_2, ctr2_3, ctr2_4, ctr2_5, ctr2_6);


endmodule

