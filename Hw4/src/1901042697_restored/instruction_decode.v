module instruction_decode(instruction, opcode, rs, rt, rd, func, imm);

input [15:0] instruction;

output [3:0] opcode;
output [2:0] rs;
output [2:0] rt;
output [2:0] rd;
output [2:0] func;
output [5:0] imm;

and i15(opcode[3], instruction[15], 1'b1);
and i14(opcode[2], instruction[14], 1'b1);
and i13(opcode[1], instruction[13], 1'b1);
and i12(opcode[0], instruction[12], 1'b1);

and i11(rs[2], instruction[11], 1'b1);
and i10(rs[1], instruction[10], 1'b1);
and i9(rs[0], instruction[9], 1'b1);

and i8(rt[2], instruction[8], 1'b1);
and i7(rt[1], instruction[7], 1'b1);
and i6(rt[0], instruction[6], 1'b1);

and i5(rd[2], instruction[5], 1'b1);
and i4(rd[1], instruction[4], 1'b1);
and i3(rd[0], instruction[3], 1'b1);

and i2(func[2], instruction[2], 1'b1);
and i1(func[1], instruction[1], 1'b1);
and i0(func[0], instruction[0], 1'b1);

and imm5(imm[5], instruction[5], 1'b1);
and imm4(imm[4], instruction[4], 1'b1);
and imm3(imm[3], instruction[3], 1'b1);
and imm2(imm[2], instruction[2], 1'b1);
and imm1(imm[1], instruction[1], 1'b1);
and imm0(imm[0], instruction[0], 1'b1);


endmodule
