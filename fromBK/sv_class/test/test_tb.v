module test_tb;

	integer i;
	reg a, b, c, d;
	wire y;

	test DUT (
		.a_i(a),
		.b_i(b),
		.c_i(c),
		.d_i(d),
		.y_o(y)
	);

	initial begin 
		$dumpfile("test.vcd");
		$dumpvars(0,test_tb);

		for (i=0;i<=15;i+=1) begin
			a=(i>>3)&1;
			b=(i>>2)&1;
			c=(i>>1)&1;
			d=i &1;
			#25

			$display("Input: A=%0b, B=%0b, C=%0b, D=%0b", a, b, c, d);
			$display("Output: %0b", y);

		end
		$finish;
	end
endmodule



