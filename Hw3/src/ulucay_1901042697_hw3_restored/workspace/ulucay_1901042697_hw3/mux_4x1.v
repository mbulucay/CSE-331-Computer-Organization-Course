module mux_4x1(a, b, c, d, s0, s1, r);
input a, b, c, d;
input s0, s1;
output r;

wire r1, r2;

mux_2x1 mux_1(a, b, s1, r1);
mux_2x1 mux_2(c, d, s1, r2);

mux_2x1 mux_3(r1, r2, s0, r);

endmodule
