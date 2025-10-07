module encoder (

    input  wire [7:0] data_in,
    output reg  [2:0] encoded_out,
    output reg        valid_out
);

      always @(*)  begin

        // Default values
        encoded_out = 3'b000;
        valid_out = 1'b0;

        // Priority encoding (highest priority for data_in[7])
        if (data_in[7]) begin
            encoded_out = 3'b111;
            valid_out = 1'b1;
        end else if (data_in[6]) begin
            encoded_out = 3'b110;
            valid_out = 1'b1;
        end else if (data_in[5]) begin
            encoded_out = 3'b101;
            valid_out = 1'b1;
    	end else if (data_in[4]) begin
	    encoded_out = 3'b100;
            valid_out = 1'b1;	     
    	end else if (data_in[3]) begin
            encoded_out = 3'b011;
            valid_out = 1'b1;
        end else if (data_in[2]) begin
            encoded_out = 3'b010;
            valid_out = 1'b1;
        end else if (data_in[1]) begin
            encoded_out = 3'b001;
            valid_out = 1'b1;
        end else if (data_in[0]) begin
            encoded_out = 3'b000;
            valid_out = 1'b1;
        end else begin
            // No input asserted

            encoded_out = 3'b000; // Or 3'bx for don't care, depending on requirements
            valid_out = 1'b0;
        end
    end

endmodule
