module counter_4bit (

    input clk,
    input rstn, // Active-low reset
    output reg [3:0] count_out

);

always @(posedge clk or negedge rstn) begin

    if (!rstn) begin // If reset is active (low)
        count_out <= 4'b0000; // Reset counter to 0
    end else begin
        count_out <= count_out + 1; // Increment counter
    end
end

endmodule
