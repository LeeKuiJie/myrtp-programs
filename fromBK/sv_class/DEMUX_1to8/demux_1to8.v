module demux_1_to_8 (
    input wire data_in,
    input wire [2:0] sel,
    output reg [7:0] data_out
);

    always @(*) begin

        // Initialize all outputs to 0
        data_out = 8'b00000000; 

        // Assign data_in to the selected output based on 'sel'
        case (sel)
            3'b000: data_out[0] = data_in;
            3'b001: data_out[1] = data_in;
            3'b010: data_out[2] = data_in;
            3'b011: data_out[3] = data_in;
            3'b100: data_out[4] = data_in;
            3'b101: data_out[5] = data_in;
            3'b110: data_out[6] = data_in;
            3'b111: data_out[7] = data_in;
            default: data_out = 8'b00000000; // Handle X or Z on select lines
        endcase
    end

endmodule
