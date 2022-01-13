`define DELAY 20
module instruction_decode_testbrench();

reg [15:0] instruction;

wire [3:0] opcode;
wire [2:0] rs;
wire [2:0] rt;
wire [2:0] rd;
wire[2:0] func;
wire [5:0] imm;

instruction_decode Decoder(instruction, opcode, rs, rt, rd, func, imm);


initial 
begin

//$4 = $2 + $1
instruction = 16'b0000001010100001;
#`DELAY;

//$1 = $4 and $2
instruction = 16'b0000010100001000;
#`DELAY;

//$1 = $2 + 9
instruction = 16'b0001010001001001;
#`DELAY;

//$6 = $3 and 010100 (20)
instruction = 16'b0010011110010101;
#`DELAY;

end

initial begin
	$monitor("instruction = %16b opcode = %4b rs = %3b rt = %3b rd = %3b func = %3b imm = %6b",instruction, opcode, rs, rt, rd, func, imm);
end


endmodule
