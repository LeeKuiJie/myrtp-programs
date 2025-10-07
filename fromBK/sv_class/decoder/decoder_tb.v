// Testbench for 3-to-8 Decoder
module testbench_decoder_3_to_8;

integer i;

    // Inputs
    reg [2:0] tb_in;
    reg tb_enable;

    // Outputs
    wire [7:0] tb_out;

    // Instantiate the Unit Under Test (UUT)
    decoder_3_to_8 uut (
        .in(tb_in),
        .enable(tb_enable),
        .out(tb_out)
    );

    initial begin

        // Dump waves for simulation visualization
        $dumpfile("decoder_waveform.vcd");
        $dumpvars(0, testbench_decoder_3_to_8); // Dump all signals in this module and its hierarchy

        // Initialize inputs
        tb_enable = 1'b0;
        tb_in = 3'b000;
        #10; // Wait for initial state to settle

        // Test with enable off
        $display("--- Testing with Enable OFF ---");
        tb_enable = 1'b0;
        for (i = 0; i < 8; i = i + 1) begin
            tb_in = i;
            #10;
            $display("Time: %0t, Input: %b, Enable: %b, Output: %b", $time, tb_in, tb_enable, tb_out);
        end

        // Test with enable on
        $display("--- Testing with Enable ON ---");
        tb_enable = 1'b1;
	tb_in = 3'b000;
        for (i = 0; i < 8; i = i + 1) begin
            tb_in = i;
            #10;
	    $display("Time: %0t, Input: %b, Enable: %b, Output: %b", $time, tb_in, tb_enable, tb_out);
        end

        // Finish simulation
        $finish;
    end

endmodule
