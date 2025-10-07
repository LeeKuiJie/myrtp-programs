module votertb;
	
	integer i;

	reg  a, b, c;	// UUT input
	wire v;		// UUT output

	voter UUT (
		.a_i(a),
		.b_i(b),
		.c_i(c),
		.v_o(v)
	);

	initial begin
		$dumpfile("voter_tb.vcd");
		$dumpvars(0,votertb);


		for (i=0; i<8; i+=1) begin
			a=(i>>2) &1;
			b=(i>>1) &1;
			c=i &1;
			#20

			$display("Input: A=%0b, B=%0b, C=%0b", a, b, c);
			$display("Output: v=%0b", v);
		end

		$finish;
	end
endmodule

