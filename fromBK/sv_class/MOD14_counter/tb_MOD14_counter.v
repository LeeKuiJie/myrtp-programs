// Testbench for MOD 14 Counter

module tb_mod14_counter;
    // Declare signals
    reg clk;
    reg rst_n;
    wire [3:0] count;

    // Instantiate the Device Under Test (DUT)
    mod14_counter DUT (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );

    // Clock generation
    initial begin
	  clk = 0;
	  forever  #5 clk = ~clk; // 10ns period (5ns high, 5ns low)
    end


    // Test stimulus and dumpvars
    initial begin
        // Dump VCD file for waveform viewing
        $dumpfile("mod14_counter.vcd");
        $dumpvars(0, tb_mod14_counter); // Dump all variables in the testbench and its hierarchy

        // Initialize inputs
        clk = 0;
        rst_n = 0; // Assert reset
        #10; // Hold reset for 10ns
        rst_n = 1; // De-assert reset

        // Monitor counter value
        $monitor("Time = %0t, Reset = %b, Count = %d", $time, rst_n, count);

        // Run simulation for a few cycles
        repeat (30) @(posedge clk); // Run for 30 clock cycles

        $finish; // End simulation
    end

endmodule
