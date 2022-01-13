module mux_2x1_32bit(a, b, s, r);

input [31:0] a;
input [31:0] b;
input s;
output [31:0] r;

mux_2x1 	bit0(a[0], b[0], s, r[0]),
			bit1(a[1], b[1], s, r[1]),
			bit2(a[2], b[2], s, r[2]),
			bit3(a[3], b[3], s, r[3]),
			bit4(a[4], b[4], s, r[4]),
			bit5(a[5], b[5], s, r[5]),
			bit6(a[6], b[6], s, r[6]),
			bit7(a[7], b[7], s, r[7]),
			bit8(a[8], b[8], s, r[8]),
			bit9(a[9], b[9], s, r[9]),

			bit10(a[10], b[10], s, r[10]),
			bit11(a[11], b[11], s, r[11]),
			bit12(a[12], b[12], s, r[12]),
			bit13(a[13], b[13], s, r[13]),
			bit14(a[14], b[14], s, r[14]),
			bit15(a[15], b[15], s, r[15]),
			bit16(a[16], b[16], s, r[16]),
			bit17(a[17], b[17], s, r[17]),
			bit18(a[18], b[18], s, r[18]),
			bit19(a[19], b[19], s, r[19]),

			bit20(a[20], b[20], s, r[20]),
			bit21(a[21], b[21], s, r[21]),
			bit22(a[22], b[22], s, r[22]),
			bit23(a[23], b[23], s, r[23]),
			bit24(a[24], b[24], s, r[24]),
			bit25(a[25], b[25], s, r[25]),
			bit26(a[26], b[26], s, r[26]),
			bit27(a[27], b[27], s, r[27]),
			bit28(a[28], b[28], s, r[28]),
			bit29(a[29], b[29], s, r[29]),

			bit30(a[30], b[30], s, r[30]),
			bit31(a[31], b[31], s, r[31]);

endmodule
