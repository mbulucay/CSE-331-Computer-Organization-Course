module shiftLeft2(in, out);

input [31:0] in;
output [31:0] out;

and o0(out[0], 0, 0);
and o1(out[1], 0, 0);

and o2(out[2], in[0], 1);
and o3(out[3], in[1], 1);
and o4(out[4], in[2], 1);
and o5(out[5], in[3], 1);
and o6(out[6], in[4], 1);
and o7(out[7], in[5], 1);
and o8(out[8], in[6], 1);
and o9(out[9], in[7], 1);

and o10(out[10], in[8], 1);
and o11(out[11], in[9], 1);
and o12(out[12], in[10], 1);
and o13(out[13], in[11], 1);
and o14(out[14], in[12], 1);
and o15(out[15], in[13], 1);
and o16(out[16], in[14], 1);
and o17(out[17], in[15], 1);
and o18(out[18], in[16], 1);
and o19(out[19], in[17], 1);

and o20(out[20], in[18], 1);
and o21(out[21], in[19], 1);
and o22(out[22], in[20], 1);
and o23(out[23], in[21], 1);
and o24(out[24], in[22], 1);
and o25(out[25], in[23], 1);
and o26(out[26], in[24], 1);
and o27(out[27], in[25], 1);
and o28(out[28], in[26], 1);
and o29(out[29], in[27], 1);

and o30(out[30], in[28], 1);
and o31(out[31], in[29], 1);


endmodule
