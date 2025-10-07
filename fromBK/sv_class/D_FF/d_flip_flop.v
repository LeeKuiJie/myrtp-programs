module d_flip_flop_sync_reset (

    input wire clk,

    input wire rst, // Synchronous reset

    input wire d,

    output reg q

);



always @(posedge clk) begin

    if (rst) begin

        q <= 1'b0; // Reset Q to 0

    end else begin

        q <= d;    // Load data 'd' into Q on clock edge

    end

end



endmodule
