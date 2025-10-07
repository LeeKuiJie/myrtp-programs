module mux_8_to_1_tb;
	reg [7:0] a_i;
	reg [2:0] s_i;
	wire y_o;
	integer i;

	mux_8_to_1 DUT(
		.a_i(a_i),
		.s_i(s_i),
		.y_o(y_o)
	);

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,mux_8_to_1_tb);
	end

	initial begin
		a_i = 8'b00100101;	
		for (i=0;i<=7;i+=1) begin
		s_i=i;
		#10;
		$display("Time: %0t, Input: %b, Selector: %b, Output: %b", $time, a_i, s_i, y_o);
		end
	$finish;
	end
	endmodule


		
