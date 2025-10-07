// MOD 6 Counter Module

module mod6_counter (
    input clk,
    input rst_n, // Active-low reset
    output reg [2:0] count
);

always @(posedge clk or negedge rst_n) begin

    if (!rst_n) begin
        count <= 3'd0; // Reset to 0
    end else begin
        if (count == 3'd5) begin
            count <= 3'd0; // Reset to 0 after reaching 13
        end else begin
            count <= count + 3'd1; // Increment counter
        end
    end
end

endmodule
