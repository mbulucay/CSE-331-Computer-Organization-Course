module alu_32bit(a, b, Aluop, cin, cout, r, S, V);
input [2:0] Aluop;
input [31:0] a;
input [31:0] b;
input cin;
output [31:0] r;
output cout ,S, V;

wire [30:0] couts;
wire first;

//module ALU(ai, bi, ALUOP, cin, cout, r);
ALU bit_0(a[0], b[0], Aluop, cin, couts[0], first),
	 bit_1(a[1], b[1], Aluop, couts[0], couts[1], r[1]),
	 bit_2(a[2], b[2], Aluop, couts[1], couts[2], r[2]),
	 bit_3(a[3], b[3], Aluop, couts[2], couts[3], r[3]),
	 bit_4(a[4], b[4], Aluop, couts[3], couts[4], r[4]),
	 bit_5(a[5], b[5], Aluop, couts[4], couts[5], r[5]),
	 bit_6(a[6], b[6], Aluop, couts[5], couts[6], r[6]),
	 bit_7(a[7], b[7], Aluop, couts[6], couts[7], r[7]),
	 bit_8(a[8], b[8], Aluop, couts[7], couts[8], r[8]),
	 bit_9(a[9], b[9], Aluop, couts[8], couts[9], r[9]),
	 bit_10(a[10], b[10], Aluop, couts[9], couts[10], r[10]),
	 bit_11(a[11], b[11], Aluop, couts[10], couts[11], r[11]),
	 bit_12(a[12], b[12], Aluop, couts[11], couts[12], r[12]),
	 bit_13(a[13], b[13], Aluop, couts[12], couts[13], r[13]),
	 bit_14(a[14], b[14], Aluop, couts[13], couts[14], r[14]),
	 bit_15(a[15], b[15], Aluop, couts[14], couts[15], r[15]),
	 bit_16(a[16], b[16], Aluop, couts[15], couts[16], r[16]),
	 bit_17(a[17], b[17], Aluop, couts[16], couts[17], r[17]),
	 bit_18(a[18], b[18], Aluop, couts[17], couts[18], r[18]),
	 bit_19(a[19], b[19], Aluop, couts[18], couts[19], r[19]),
	 bit_20(a[20], b[20], Aluop, couts[19], couts[20], r[20]),
	 bit_21(a[21], b[21], Aluop, couts[20], couts[21], r[21]),
	 bit_22(a[22], b[22], Aluop, couts[21], couts[22], r[22]),
	 bit_23(a[23], b[23], Aluop, couts[22], couts[23], r[23]),
	 bit_24(a[24], b[24], Aluop, couts[23], couts[24], r[24]),
	 bit_25(a[25], b[25], Aluop, couts[24], couts[25], r[25]),
	 bit_26(a[26], b[26], Aluop, couts[25], couts[26], r[26]),
	 bit_27(a[27], b[27], Aluop, couts[26], couts[27], r[27]),
	 bit_28(a[28], b[28], Aluop, couts[27], couts[28], r[28]),
	 bit_29(a[29], b[29], Aluop, couts[28], couts[29], r[29]),
	 bit_30(a[30], b[30], Aluop, couts[29], couts[30], r[30]);
//module mostALU(ai, bi, ALUOP, cin, cout, r, S, V);
mostALU	 bit_31(a[31], b[31], Aluop, couts[30], cout, r[31], S, V);

wire slt,not0,not1;
not n0(not0,Aluop[0]);
not n1(not1,Aluop[1]);

and slt_bit(slt,Aluop[2],not0,not1,S);
xor slt_foo(r[0],first, slt);

endmodule
