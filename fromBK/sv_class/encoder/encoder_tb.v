module encoder_tb;

integer i;
reg [7:0] in_tb;
reg enable_tb;
wire [2:0] out_tb;
 
	encoder DUT (
		.in(in_tb),
		.enable(enable_tb),
		.out(out_tb)
	);

	initial begin 
		$dumpfile("encoder.vcd");
		$dumpvars(0, encoder_tb);
	
		in_tb=8'b00000001;
		enable_tb=1'b0;
		#10;

		$display ("--- Outputs when Enable is 0 ---");
		for (i=0;i<8;i+=1) begin
			$display("Time: %0t, Input: %b, Enable: %b, Output: %b", $time, in_tb, enable_tb, out_tb);
			in_tb = in_tb << 1;
			#10;
		end
		$display ("--- Outputs when Enable is 1 ---");
		in_tb=8'b00000001;
        	enable_tb=1'b1;
		#10;
        	for (i=0;i<8;i+=1) begin
                	$display("Time: %0t, Input: %b, Enable: %b, Output: %b", $time, in_tb, enable_tb, out_tb);
                	in_tb = in_tb << 1;
			#10;
		end

		$finish;
	end

endmodule




	



