module JKFF(
	input j_i,
	input k_i,
	input clk,
	output reg q_i
);

always @ (posedge clk) begin
	case ({j_i, k_i})
		2'b00: q_i <= q_i; //No change
		2'b01: q_i <= 0; 
		2'b10: q_i <= 1;
		2'b11: q_i <= ~q_i;
	endcase
end

endmodule

					
			


