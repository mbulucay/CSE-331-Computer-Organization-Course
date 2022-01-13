module signExtend(in, out);

	input [5:0] in;
	output [31:0] out;

	and o0(out[0], in[0], 1'b1);
	and o1(out[1], in[1], 1'b1);
	and o2(out[2], in[2], 1'b1);
	and o3(out[3], in[3], 1'b1);
	and o4(out[4], in[4], 1'b1);
	and o5(out[5], in[5], 1'b1);
	and o6(out[6], in[5], 1'b1);
	and o7(out[7], in[5], 1'b1);
	and o8(out[8], in[5], 1'b1);
	and o9(out[9], in[5], 1'b1);

	and o10(out[10], in[5], 1'b1);
	and o11(out[11], in[5], 1'b1);
	and o12(out[12], in[5], 1'b1);
	and o13(out[13], in[5], 1'b1);
	and o14(out[14], in[5], 1'b1);
	and o15(out[15], in[5], 1'b1);
	and o16(out[16], in[5], 1'b1);
	and o17(out[17], in[5], 1'b1);
	and o18(out[18], in[5], 1'b1);
	and o19(out[19], in[5], 1'b1);

	and o20(out[20], in[5], 1'b1);
	and o21(out[21], in[5], 1'b1);
	and o22(out[22], in[5], 1'b1);
	and o23(out[23], in[5], 1'b1);
	and o24(out[24], in[5], 1'b1);
	and o25(out[25], in[5], 1'b1);
	and o26(out[26], in[5], 1'b1);
	and o27(out[27], in[5], 1'b1);
	and o28(out[28], in[5], 1'b1);
	and o29(out[29], in[5], 1'b1);

	and o30(out[30], in[5], 1'b1);
	and o31(out[31], in[5], 1'b1);

endmodule
