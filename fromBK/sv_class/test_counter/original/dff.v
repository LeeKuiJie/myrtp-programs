// D Flip-Flop Module
module d_flip_flop(
    input clk,
    input rst_n, // Active-low reset
    input d,
    output reg q,
    output q_bar
);

    assign q_bar = ~q; // Q_bar is the complement of Q

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin // Active-low reset
            q <= 1'b0;
        end else begin
            q <= d;
        end
    end

endmodule

// Top-level module connecting two D flip-flops
module top_module;

    reg clk;
    reg rst_n;
    wire q1, q1_bar;
    wire q2, q2_bar;

    // Instantiate the first D flip-flop
    d_flip_flop dff1 (
        .clk(clk),
        .rst_n(rst_n),
        .d(q1_bar), // Q_bar of dff1 connected to its own D input
        .q(q1),
        .q_bar(q1_bar)
    );

    // Instantiate the second D flip-flop
    d_flip_flop dff2 (
        .clk(clk),
        .rst_n(rst_n),
        .d(q1), // Q of dff1 connected to D input of dff2
        .q(q2),
        .q_bar(q2_bar)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk; // 10ns period (5ns high, 5ns low)
    end

    // Test sequence
    initial begin
        rst_n = 1'b0; // Assert reset
        #10;
        rst_n = 1'b1; // De-assert reset

        #100; // Run for some time
        $finish; // End simulation
    end

    // Dump variables for waveform viewing
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, top_module);
    end

endmodule
