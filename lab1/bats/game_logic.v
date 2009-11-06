`include "defines.v"

module game_logic(
	input clk,
	input reset,
	input left_up,
	input left_down,
	input right_up,
	input right_down,
	input [7:0] ball_speed,
	output [10:0] left,
	output [10:0] right
	);
	
	counter left_counter(
		.clk(clk),
		.reset(reset),
		.up(left_up),
		.down(left_down),
		.offset(ball_speed * `batspeedup),
		.count(left)
	);
	
	counter right_counter(
		.clk(clk),
		.reset(reset),
		.up(right_up),
		.down(right_down),
		.offset(ball_speed * `batspeedup),
		.count(right)
	);
	
endmodule
