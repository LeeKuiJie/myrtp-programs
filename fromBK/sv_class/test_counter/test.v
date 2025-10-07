module DFF (
	input clk,
	input d,
	input rst,   // active-low asyn reset
	output reg q,
	output q_bar
	);

	assign q_bar = ~q;

	always @ (negedge clk or negedge rst) begin
		if (!rst) begin
			q <= 1'b0;
		end else begin
			q <= d;
		end
	end

endmodule

module NAND (
	input A, B, C, D,
	output y);

	assign y = ~(A & B & C & D);
endmodule

module DFF_tb;

	reg clk;
	reg rst;
	wire q1, q1_bar;
	wire q2, q2_bar;
	wire q3, q3_bar;
	wire q4, q4_bar;
	wire y;

	DFF DFF1(
		.clk(clk),
		.d(q1_bar),
		.rst(rst),
		.q(q1),
		.q_bar(q1_bar)
	);

	DFF DFF2(
		.clk(q1),
		.d(q2_bar),
		.rst(rst),
		.q(q2),
		.q_bar(q2_bar)
	);

	DFF DFF3(
		.clk(q2),
		.d(q3_bar),
		.rst(rst),
		.q(q3),
		.q_bar(q3_bar)
	);

	DFF DFF4(
		.clk(q3),
		.d(q4_bar),
		.rst(rst),
		.q(q4),
		.q_bar(q4_bar)
	);

	NAND DUT(
		.A(q4),
		.B(q3),
		.C(q2),
		.D(q1_bar),
		.y(y)
	);
		
	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	initial  begin
		rst <= 0;
		#10;
		rst <= 1;		

		$monitor("Time:%t | Reset:%b | NAND Y:%b | Q1=%b | Q2:%b | Q3:%b | Q4:%b",$time,rst,y,q1,q2,q3,q4);
		#500;
		$finish;
	end

	always @ (!y) begin
		rst <= 0;
		#10 rst <= 1;
	end

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, DFF_tb);
	end
endmodule
