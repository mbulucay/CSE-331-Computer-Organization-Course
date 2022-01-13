`define DELAY 20

module onebitALU_testbench();


reg a, b, cin;
reg [2:0] AluOp;
wire cout, R;

onebitALU myAlu(a, b, AluOp, cin, R, cout);


initial begin

a = 1'b0; b = 1'b0; cin = 1'b1;
AluOp[0] = 1'b0; AluOp[1] = 1'b1;
AluOp[2] = 1'b0;
#`DELAY;

a = 1'b0; b = 1'b1; cin = 1'b0;
AluOp[0] = 1'b0; AluOp[1] = 1'b1;
AluOp[2] = 1'b0;
#`DELAY;


a = 1'b1; b = 1'b0; cin = 1'b1;
AluOp[0] = 1'b0; AluOp[1] = 1'b1;
AluOp[2] = 1'b0;
#`DELAY;


a = 1'b1; b = 1'b1; cin = 1'b0;
AluOp[0] = 1'b0; AluOp[1] = 1'b1;
AluOp[2] = 1'b0;
#`DELAY;


a = 1'b1; b = 1'b1; cin = 1'b1;
AluOp[0] = 1'b0; AluOp[1] = 1'b1;
AluOp[2] = 1'b0;
#`DELAY;

end


initial begin
	$monitor("time = %2d, a =%1b, b=%1b, cin =%1b, Op0=%1b,, Op1=%1b, Op2=%1b cout=%1b,  R=%1b ", $time, a, b, cin, AluOp[0], AluOp[1], AluOp[2], cout, R);
end

endmodule