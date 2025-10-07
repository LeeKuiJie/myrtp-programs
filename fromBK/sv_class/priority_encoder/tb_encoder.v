`timescale 1ns / 1ps

module tb_encoder;

    // Testbench signals
    reg  [7:0] tb_data_in;
    wire [2:0] tb_encoded_out;
    wire       tb_valid_out;

    // Instantiate the Device Under Test (DUT)
    encoder dut (
        .data_in     (tb_data_in),
        .encoded_out (tb_encoded_out),
        .valid_out   (tb_valid_out)
    );

    // Initial block for stimulating inputs
    initial begin
        // Initialize inputs
        tb_data_in = 8'b00000000;
        #10;

        // Test cases
        tb_data_in = 8'b00000001; // data_in[0] active
        #10;
        tb_data_in = 8'b00000010; // data_in[1] active
        #10;
        tb_data_in = 8'b00000100; // data_in[2] active
        #10;
        tb_data_in = 8'b00001000; // data_in[3] active
        #10;
        tb_data_in = 8'b00010000; // data_in[4] active
        #10;
        tb_data_in = 8'b00100000; // data_in[5] active
        #10;
        tb_data_in = 8'b01000000; // data_in[6] active
        #10;
        tb_data_in = 8'b10000000; // data_in[7] active
        #10;

        // Test with multiple inputs active (priority should be observed)
        tb_data_in = 8'b10000001; // data_in[7] and data_in[0] active, [7] has priority
        #10;
        tb_data_in = 8'b00000111; // data_in[2], [1], [0] active, [2] has priority
        #10;

        // No input active
        tb_data_in = 8'b00000000;
        #10;

        $finish; // End simulation
    end

    // Dump VCD for waveform viewing

    initial begin
        $dumpfile("encoder.vcd");
        $dumpvars(0, tb_encoder); // Dump all signals in the current scope
    end

    // Display simulation results (optional)
    always @* begin

        $display("Time: %0t, Data_in: %b, Encoded_out: %b, Valid_out: %b",
                 $time, tb_data_in, tb_encoded_out, tb_valid_out);
    end
endmodule
