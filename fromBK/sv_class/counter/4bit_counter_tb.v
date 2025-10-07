module tb_counter_4bit;

    // Declare testbench signals
    reg clk;
    reg rstn;
    wire [3:0] count_out;

    // Instantiate the Unit Under Test (UUT)
    counter_4bit dut (
        .clk(clk),
        .rstn(rstn),
        .count_out(count_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5ns (10ns period)
    end

    // Stimulus generation
    initial begin

        // Dump waveforms for simulation analysis
        $dumpfile("tb_counter.vcd");
        $dumpvars(0, tb_counter_4bit);
    
	    // Initial conditions
        rstn = 0; // Assert reset
        #20;      // Hold reset for 20ns
        // rstn = 1;
        // #200;    // Allow counting for 100ns
        // rstn = 0; // Assert reset again
	rstn = 1;
	#300
        // #20;      // Hold reset
        //  rstn = 1; // Deassert reset
        // #50;      // Allow more counting
        $finish;  // End simulation
    end

    // Monitor and display output
    initial begin
        $monitor("Time=%0tns, clk=%0b, rstn=%0b, count_out=%0d", $time, clk, rstn, count_out);
    end

endmodule
