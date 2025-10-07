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

module NAND_gate (output Y, input A, input B, input C, input D);

       assign Y = ~(A & B & C & D);

endmodule


// Top-level module connecting two D flip-flops
module top_module;

    reg clk;
    reg rst_n;
    wire q1, q1_bar;
    wire q2, q2_bar;
    wire q3, q3_bar;
    wire q4, q4_bar;
    wire A, B, C, D, out;

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
        .clk(q1),
        .rst_n(rst_n),
        .d(q2_bar), // Q of dff1 connected to D input of dff2
        .q(q2),
        .q_bar(q2_bar)
    );

    // Instantiate the third D flip-flop
    d_flip_flop dff3 (
        .clk(q2),
        .rst_n(rst_n),
        .d(q3_bar), // Q of dff1 connected to D input of dff2
        .q(q3),
        .q_bar(q3_bar)
    );

    // Instantiate the fourth D flip-flop
    d_flip_flop dff4 (
        .clk(q3),
        .rst_n(rst_n),
        .d(q4_bar), // Q of dff1 connected to D input of dff2
        .q(q4),
        .q_bar(q4_bar)
    );

    //instantiate the 4-input NAND gate
    NAND_gate my_nand_gate (
	    .A(q1),
	    .B(q2),
	    .C(~q3),
	    .D(~q4),
	    .Y(out)
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
        release top_module.rst_n;

	$monitor("Time:%t | Reset:%b | Q4=%b | Q3:%b | Q2:%b | Q1:%b		",$time,rst_n,q4,q3,q2,q1);
        #200; // Run for some time
        $finish; // End simulation
    end

    // Dump variables for waveform viewing
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, top_module);
    end

endmodule
