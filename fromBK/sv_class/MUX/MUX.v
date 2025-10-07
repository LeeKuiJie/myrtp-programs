module mux_8_to_1(
	input [7:0] a_i,
	input [2:0] s_i,
	output reg y_o
);

always @(*) begin
	case(s_i)
		3'b000: y_o = a_i[0];
		3'b001: y_o = a_i[1];
		3'b010: y_o = a_i[2];
		3'b011: y_o = a_i[3];
		3'b100: y_o = a_i[4];
		3'b101: y_o = a_i[5];
		3'b110: y_o = a_i[6];
		3'b111: y_o = a_i[7];
		default: y_o = 1'b0;
	endcase
end
endmodule

