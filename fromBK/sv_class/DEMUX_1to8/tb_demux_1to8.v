module tb_demux_1_to_8;

    // Declare signals for the demux
    reg data_in_tb;
    reg [2:0] sel_tb;
    wire [7:0] data_out_tb;

    // Instantiate the demux module
    demux_1_to_8 uut (
        .data_in(data_in_tb),
        .sel(sel_tb),
        .data_out(data_out_tb)
    );

    initial begin

        // Dump variables for waveform viewing
        $dumpfile("demux_1_to_8.vcd");
        $dumpvars(0, tb_demux_1_to_8); // Dump all signals in the current scope and below

        // Test cases
        data_in_tb = 1'b1;
        sel_tb = 3'b000; #10; // Output 0 high
        sel_tb = 3'b001; #10; // Output 1 high
        sel_tb = 3'b010; #10; // Output 2 high
        sel_tb = 3'b011; #10; // Output 3 high
        sel_tb = 3'b100; #10; // Output 4 high
        sel_tb = 3'b101; #10; // Output 5 high
        sel_tb = 3'b110; #10; // Output 6 high
        sel_tb = 3'b111; #10; // Output 7 high

        data_in_tb = 1'b0;
        sel_tb = 3'b000; #10; // All outputs low
        sel_tb = 3'b111; #10; // All outputs low

        $finish; // End simulation
    end

endmodule
