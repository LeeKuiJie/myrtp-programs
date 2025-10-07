module JKFF_tb;

	reg clk;
	reg j_i;
	reg k_i;
	wire q_i;
	integer i; 

	JKFF DUT (
		.clk(clk),
		.j_i(j_i),
		.k_i(k_i),
		.q_i(q_i)
		);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$dumpfile("test.vcd");
                $dumpvars(0,JKFF_tb);

	        $display ("======== Results for JK Flip Flop ======== ");
                // $display ("Time: %0t, J: %0b, K: %0b, CLK: %0b, Output: %0b", $time, j_i, k_i, clk, q_i);
                $monitor("Time = %0t, J: %0b, K: %0b, CLK: %0b, Output: %0b", $time, j_i, k_i, clk, q_i);
		
		for(i=1;i<10;i+=1) begin
		j_i = 0;
		k_i = 0;
		
		#10 j_i = 0 ; k_i = 1;
		#10 j_i = 1 ; k_i = 0;
		#10 j_i = 1 ; k_i = 1;
		#10;
		end
		
		//repeat (10) @ (posedge clk);

		$finish;
	end
endmodule
