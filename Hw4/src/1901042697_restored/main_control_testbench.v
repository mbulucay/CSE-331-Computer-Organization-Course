`define DELAY 10
module main_control_testbench();


reg [3:0] opcode;
wire [2:0] AluOp;
wire branch, branchnot, imm_type, AluSrc, MemRead, MemWrite, RegWrite, RegDst, MemtoReg;

/*
module main_control(opcode, branch, branchnot, imm_type, AluSrc, AluOp, MemRead, MemWrite, RegWrite, RegDst, MemtoReg);

input[3:0] opcode;
output [2:0] AluOp;
// ? Jump gerekli mi degil mi ?
// normalinde yok
output Branch, Jump, AluSrc, MemRead, MemWrite, RegWrite, RegDst, MemtoReg;
*/

main_control mainC(opcode, branch, branchnot, imm_type, AluSrc, AluOp, MemRead, MemWrite, RegWrite, RegDst, MemtoReg);

initial begin 

opcode = 4'b0000;
#`DELAY;

opcode = 4'b0001;
#`DELAY;

opcode = 4'b0010;
#`DELAY;

opcode = 4'b0011;
#`DELAY;

opcode = 4'b0100;
#`DELAY;

opcode = 4'b0101;
#`DELAY;

opcode = 4'b0110;
#`DELAY;

opcode = 4'b0111;
#`DELAY;

opcode = 4'b1000;
#`DELAY;

opcode = 4'b1001;
#`DELAY;

end

initial begin
	$monitor("time = %2d Opcode = %4b AluOp = %3b branch = %1b  branchnot = %1b imm_type = %1b AluSrc = %1b MemRead = %1b MemWrite = %1b RegWrite = %1b RegDst = %1b MemtoReg = %1b", $time, opcode, AluOp, branch, branchnot, imm_type, AluSrc, MemRead, MemWrite, RegWrite, RegDst, MemtoReg );
end



endmodule
