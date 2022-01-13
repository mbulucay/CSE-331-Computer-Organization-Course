module mux_8x1(a, b, c, d, e, f, g, h, s0, s1, s2, R);
input a, b, c, d, e, f, g, h, s0, s1, s2;
output R;

wire r1, r2;

mux_4x1 myMux1(a, b, c, d, s1, s2, r1);
mux_4x1 myMux2(e, f, g, h, s1, s2, r2);

mux_2x1 myMux(r1, r2, s0, R);

endmodule
