`define DELAY 20
module branch_module_testbrench();




reg branch, branchnot;
reg [31:0] result;
reg [31:0] sign_extend_out;
reg [31:0] pc;

wire [31:0] newPc;

branch_module Br(branch, branchnot, result, sign_extend_out, pc, newPc);

initial begin 

branch = 1'b1;
branchnot = 1'b0;
result = 32'b0000000000000000000000000000000;
sign_extend_out = 32'b00000000000000000000001010101111;
pc = 32'b00000000000000000000000000000001;
#`DELAY;

branch = 1'b0;
branchnot = 1'b0;
result = 32'b00000000000000000000000000001101;
sign_extend_out = 32'b00000000000000000000001010101111;
pc = 32'b00000000000000000000000000000001;
#`DELAY;


branch = 1'b0;
branchnot = 1'b1;
result = 32'b00000000000000000000000011011101;
sign_extend_out = 32'b00000000000000000000001010101111;
pc = 32'b00000000000000000000000000000001;
#`DELAY;

end


initial begin
	$monitor("branch = %1b branchnot = %1b \n alu result = %32b sign_extend_out = %32b \n pc = %32b \n newPc = %32b",branch, branchnot, result, sign_extend_out, pc, newPc);
end

endmodule
