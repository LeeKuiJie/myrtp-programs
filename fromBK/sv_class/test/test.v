module test (
	input wire a_i,
	input wire b_i,
	input wire c_i,
	input wire d_i,
	output wire y_o
);

assign y_o = ~((a_i | b_i) & (c_i & d_i));


endmodule
