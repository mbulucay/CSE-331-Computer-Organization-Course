module MiniMIPS(pc, result, clk, newPc);

input clk;
//input [15:0] instruction;
input [31:0] pc;
output [31:0] result;
output [31:0] newPc;

wire [15:0] instruction;
wire [3:0] opcode;
wire [2:0] rs;
wire [2:0] rt;
wire [2:0] rd;
wire [2:0] func;
wire [5:0] imm;

wire [2:0] AluOp;
wire branch, branchnot, imm_type, AluSrc, MemRead, MemWrite, RegWrite, RegDst, MemtoReg;

wire [31:0] read_data_1, read_data_2, read_data, empty1, empty2;
wire [31:0] write_data ;
wire [2:0] read_reg_1, read_reg_2, write_reg;

wire [31:0] extend_out, sign_extend_out, zero_extend_out;
wire [31:0] aluSrc_data;

wire [2:0] opctr, nopctr;
wire cin ,cout , S, V, sub;

wire zero, one;

and Z(zero, 1'b0, 1'b0);
and O(one, 1'b1 , 1'b1);

//instruction_memory(clk, address, instruction);
instruction_memory InstMem(clk, pc, instruction);

//instruction_decode(instruction, opcode, rs, rt, rd, func, imm);
instruction_decode Decode(instruction, opcode, rs, rt, rd, func, imm);

//main_control(opcode, branch, imm_type, AluSrc, AluOp, MemRead, MemWrite, RegWrite, RegDst, MemtoReg);
main_control Control(opcode, branch, branchnot, imm_type, AluSrc, AluOp, MemRead, MemWrite, RegWrite, RegDst, MemtoReg);

//mux_2x1(a, b, s, r);
mux_2x1 writeReg0( rt[0], rd[0] ,RegDst, write_reg[0]);
mux_2x1 writeReg1( rt[1], rd[1] ,RegDst, write_reg[1]);
mux_2x1 writeReg2( rt[2], rd[2] ,RegDst, write_reg[2]);

// mips_registers (read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );
mips_registers Registers1(read_data_1, read_data_2, write_data, rs, rt, write_reg, RegWrite, clk);

signExtend SignExtend(imm, sign_extend_out);
zero_extend ZeroExtend(imm, zero_extend_out);
mux_2x1_32bit immType(sign_extend_out, zero_extend_out, imm_type, extend_out);

mux_2x1_32bit aluTypeData(read_data_2, extend_out, AluSrc, aluSrc_data);

alu_control AluControl(opctr, AluOp, func);

//cin = sub da 1 olacak sekilde ayarlanacak opctr 010   ---- (010)sub, beq ve bne da da olacak
not (nopctr[0], opctr[0]);
not (nopctr[1], opctr[1]);
not (nopctr[2], opctr[2]);
and (cin , nopctr[2], opctr[1], nopctr[0]);
alu_32bit ALU(read_data_1, aluSrc_data, opctr, cin, cout, result, S, V);

//branch_module(branch, result, sign_extend_out, pc, newPc);
branch_module Branch(branch, branchnot, result, sign_extend_out, pc, newPc);

//mips_memory(address ,read_data, write_data, mem_write, mem_read, clk);
mips_memory Cash(result ,read_data, read_data_2, MemWrite, MemRead, clk);

mux_2x1_32bit WriteData(result, read_data, MemtoReg, write_data);



endmodule
