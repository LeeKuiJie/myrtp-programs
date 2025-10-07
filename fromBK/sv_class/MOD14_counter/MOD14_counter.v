// MOD 14 Counter Module

module mod14_counter (
    input clk,
    input rst_n, // Active-low reset
    output reg [3:0] count
);

always @(posedge clk or negedge rst_n) begin

    if (!rst_n) begin
        count <= 4'd0; // Reset to 0
    end else begin
        if (count == 4'd13) begin
            count <= 4'd0; // Reset to 0 after reaching 13
        end else begin
            count <= count + 4'd1; // Increment counter
        end
    end
end

endmodule
