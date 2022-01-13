`define DELAY 10
module alu_control_testbench();


reg [2:0] opcode;
reg [2:0] func;
wire [2:0] opctr;

/*

module alu_control(opctr, opcode, func);
output [2:0] opctr;
input [2:0] opcode;
input [2:0] func;
*/

alu_control myalucontrol(opctr, opcode, func);

initial begin 

opcode = 3'b000;
func = 3'b000;
#`DELAY;

func = 3'b001;
#`DELAY;

func = 3'b010;
#`DELAY;

func = 3'b011;
#`DELAY;

func = 3'b100;
#`DELAY;

func = 3'b101;
#`DELAY;


opcode = 3'b001;
#`DELAY;

opcode = 3'b010;
#`DELAY;

opcode = 3'b011;
#`DELAY;

opcode = 3'b100;
#`DELAY;

opcode = 3'b101;
#`DELAY;

opcode = 3'b110;
#`DELAY;

opcode = 3'b111;
#`DELAY;

end


initial begin
	$monitor("time = %2d op = %4b func = %3b ctr = %3b", $time, opcode, func, opctr );
end


endmodule
