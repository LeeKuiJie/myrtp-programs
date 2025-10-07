module d_ff_tb;

  // Declare signals for inputs and outputs of the DUT

  reg d;        // Data input
  reg clk;      // Clock input
  reg rst;    // Active-high reset input
  wire q;       // Data output

  // Instantiate the D flip-flop module (assuming it's named 'd_ff')

  d_flip_flop_sync_reset d_flip_flop_sync_reset (
    .q(q),
    .d(d),
    .rst(rst),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #1 clk = ~clk; // Generate a clock with a 10ns period
  end

  // Testbench initialization and stimulus application

  initial begin

    // Initialize inputs
    d = 0;
    rst = 1; // Assert reset
    #1 d = 1;  
    #1 d = 0;
    #1 d = 1;
    #1 d = 0;

    // De-assert reset and apply input changes
    #4 rst = 0;
    #1 d = 1;  // Apply D=1, Q should go high on next rising clock edge
    #1 d = 0;  // Apply D=0, Q should go low on next rising clock edge
    #1 d = 1;  // Apply D=1, Q should go high on next rising clock edge
    #1 d = 0;  // Apply D=0, Q should go low on next rising clock edge

    #10  $finish;
  end
  // Optional: Monitor signals during simulation
  initial begin
    $dumpfile("my_design.vcd");
    $dumpvars;  
    $monitor("Time=%0t, D=%b, CLK=%b, RST_N=%b, Q=%b", $time, d, clk, rst, q);
  end

endmodule
