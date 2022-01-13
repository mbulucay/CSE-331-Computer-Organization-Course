module main_control(opcode, branch, branchnot, imm_type, AluSrc, AluOp, MemRead, MemWrite, RegWrite, RegDst, MemtoReg);

input[3:0] opcode;
output [2:0] AluOp;
// ? Jump gerekli mi degil mi ?
// normalinde yok
output branch, branchnot, imm_type, AluSrc, MemRead, MemWrite, RegWrite, RegDst, MemtoReg;

wire nop0, nop1, nop2, nop3;
wire r, lw, sw, addi, andi, ori, nori, stli;

not not_op_0(nop0, opcode[0]);
not not_op_1(nop1, opcode[1]);
not not_op_2(nop2, opcode[2]);
not not_op_3(nop3, opcode[3]);


and R(r, nop3, nop2, nop1, nop0);
and Lw(lw, opcode[3], nop2, nop1, nop0);
and Sw(sw, opcode[3], nop2, nop1, opcode[0]);
and Beq(branch, nop3, opcode[2], nop1, opcode[0]);
and Bne(branchnot, nop3, opcode[2], opcode[1], nop0);
and Addi(addi, nop3, nop2, nop1, opcode[0]);
and Andi(andi, nop3, nop2, opcode[1], nop0);
and Ori(ori, nop3, nop2, opcode[1], opcode[0]);
and Nori(nori, nop3, opcode[2], nop1, nop0);
and Slti(stli, nop3, opcode[2], opcode[1], opcode[0]);


// AluOp
or Op0(AluOp[0], addi, ori, branch, branchnot, lw, sw);
or Op1(AluOp[1], andi, ori, stli, lw, sw);
or Op2(AluOp[2], nori, branch, branchnot, stli, lw, sw);

and memtoreg(MemtoReg, lw, 1'b1);
and memread(MemRead, lw, 1'b1);
and memwrite(MemWrite, sw, 1'b1);
and regdst(RegDst, r, 1'b1);
//or Branch(branch, beq, bne);
or regwrite(RegWrite, r, lw, addi, andi, ori, nori, stli);
or alusrc(AluSrc, lw, sw, addi, andi, ori, nori, stli);
or ImmType(imm_type, andi, nori, ori);

endmodule
