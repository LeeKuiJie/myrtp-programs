module exorGate_tb;

reg 	a;
reg 	b;
wire	c;

exorGate u0 (
		.a_i(a),
		.b_i(b),
		.c_o(c)
	);

initial begin

$dumpfile("test_exor.vcd");
$dumpvars(0, exorGate_tb);

#1	a=1'b0;
#4	b=1'b1;
#5	a=1'b1;

#200 $finish;

end

endmodule
