module branch_module(branch, branchnot, result, sign_extend_out, pc, newPc);

input branch, branchnot;
input [31:0] result;
input [31:0] sign_extend_out;
input [31:0] pc;


output [31:0] newPc;

wire cout, S, V, bMux, bnMux, noteq, eq, mux;
wire [31:0] bpc,npc;


//module alu_32bit(a, b, Aluop, cin, cout, r, S, V);
alu_32bit MyAlu2(1,pc,3'b000,1'b0, cout ,npc, S, V);

alu_32bit MyAlu(sign_extend_out, npc, 3'b000, 1'b0, cout ,bpc, S, V);

or isEq(noteq, result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9],
				result[10], result[11], result[12], result[13], result[14], result[15], result[16], result[17], result[18], result[19],
				result[20], result[21], result[22], result[23], result[24], result[25], result[26], result[27], result[28], result[29],
				result[30], result[31]);

				
not Eq(eq, noteq);

and bAnd1(bMux, branch, eq);
and bAnd2(bnMux, branchnot, noteq);

or br(mux, bMux, bnMux);

mux_2x1_32bit pcMux(npc, bpc, mux, newPc);

endmodule
