module voter(
	input wire a_i,
	input wire b_i,
	input wire c_i,
	output wire v_o
	);

assign v_o = (a_i & b_i) | (a_i & c_i) | (b_i & c_i);

endmodule
