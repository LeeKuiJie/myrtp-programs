module full_adder_tb;

    integer i;

    // Declare signals for inputs and outputs
    reg a_tb, b_tb, cin_tb;
    wire sum_tb, cout_tb;

    // Instantiate the full adder module
    full_adder dut (
        .a(a_tb),
        .b(b_tb),
        .cin(cin_tb),
        .sum(sum_tb),
        .cout(cout_tb)
    );


    // Initial block for applying stimulus and monitoring results
    initial begin

        // Dump waveforms for simulation analysis
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        // Test all possible input combinations

        for ( i = 0; i < 8; i=i+1) begin
            a_tb = (i >> 2) & 1; // Extract bit 2 for 'a'
            b_tb = (i >> 1) & 1; // Extract bit 1 for 'b'
            cin_tb = i & 1;       // Extract bit 0 for 'cin'
            #10; // Wait for 10 time units for stable output

            // Display inputs and outputs

            $display("A=%0b, B=%0b, Cin=%0b | Sum=%0b, Cout=%0b", a_tb, b_tb, cin_tb, sum_tb, cout_tb);

            // Assertions for verification (optional, but good practice)
            // Example: Verify sum for a specific case
            // if (a_tb == 1 && b_tb == 1 && cin_tb == 0) begin
            //     if (sum_tb != 0 || cout_tb != 1) begin
            //         $error("Mismatch for A=1, B=1, Cin=0");
            //     end
            // end
         end
        $finish; // End simulation
    end

endmodule
