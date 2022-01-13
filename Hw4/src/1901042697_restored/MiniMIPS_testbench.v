`define DELAY 100
module MiniMIPS_testbench ();

reg clk;
reg [31:0] pc;
wire [31:0] result;
wire [31:0] newPc;

MiniMIPS myMips(pc, result, clk, newPc);

initial begin

clk <=  1'b0;
pc <= 0;

/*
//$4 = $2 + $1
clk = 1'b1;
instruction = 16'b0000001010100001;
#`DELAY;
*/


//$1 = $4 and $2
//instruction = 16'b0000010100001000;
//clk = 1'b1;
//#`DELAY;


/*
//$1 = $2 + 9
instruction = 16'b0001010001001001;
clk = 1'b1;
#`DELAY;
*/

/*
//$6 = $3 and 010100 (20)
instruction = 16'b0010011110010101;
clk = 1'b1;
#`DELAY
*/

#2800 $finish; 
end


always begin
	#20 clk <= ~clk;
end

always @(*) 
	begin	
		/*
		$monitor("\ntime = %2b PC = %32b instruction %16b \n clk = %1b rs = %3b rt = %3b  rd = %3b wA = %3b \n ctr = %3b AluSrc = %1b RegWrite = %1b MemRead = %1b MemWrite = %1b MemtoReg = %1b RegDst = %1b imm_type = %1b branch = %1b cin = %1b\n R1 => %32b \n R2 => %32b RM = %32b Ex = %32b \n Sd => %32b \n Re => %32b Rd => %32b \n Wd => %32b"
		,$time, pc, myMips.instruction, myMips.clk, myMips.rs, myMips.rt, myMips.rd, myMips.write_reg
		,myMips.opctr,  myMips.AluSrc , myMips.RegWrite, myMips.MemRead, myMips.MemWrite, myMips.MemtoReg, myMips.RegDst, myMips.imm_type, myMips.branch, myMips.cin
		,myMips.read_data_1, myMips.read_data_2, myMips.read_data, myMips.extend_out, myMips.aluSrc_data, result, myMips.read_data, myMips.write_data);
		*/
		/*
		$monitor("reg[0] = %32b \nreg[1] = %32b \nreg[2] = %32b \nreg[3] = %32b \nreg[4] = %32b \nreg[5] = %32b \nreg[6] = %32b \nreg[7] = %32b \n",
							myMips.Registers2.registers[0],myMips.Registers2.registers[1],myMips.Registers2.registers[2],myMips.Registers2.registers[3],
							myMips.Registers2.registers[4],myMips.Registers2.registers[5],myMips.Registers2.registers[6],myMips.Registers2.registers[7],);
		*/
		
		$monitor("\npc = %1b instruction = %16b Opcode = %4b aluctr = %3b \n N1 = %32b N2 = %32b result = %32b",pc,myMips.instruction ,myMips.opcode, myMips.opctr, myMips.read_data_1 ,myMips.aluSrc_data, result);
		#`DELAY		
			
		pc <= newPc;

	end


endmodule
