module mux_2x1(a, b, s, r);

	input a, b, s;
	output r;

	// r = s'a + sb
	wire and_0;
	wire s_not;
	wire and_1;

	not Not0(s_not, s);
	and And0(and_0, s_not, a);
	and And1(and_1, s, b);

	or Or0(r, and_0, and_1);


endmodule
