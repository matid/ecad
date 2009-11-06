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
	output [10:0] right,
	output reg [10:0] ball_x,
	output reg [10:0] ball_y,
	output reg [7:0] left_score,
	output reg [7:0] right_score
	);
	
	reg v_x;
	reg v_y;
	
	wire left_hit, right_hit;
	
	counter left_position(
		.clk(clk),
		.reset(reset),
		.up(left_up),
		.down(left_down),
		.offset(ball_speed * `batspeedup),
		.count(left)
	);
	
	counter right_position(
		.clk(clk),
		.reset(reset),
		.up(right_up),
		.down(right_down),
		.offset(ball_speed * `batspeedup),
		.count(right),
	);
	
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			ball_x <= (`hc + `ballsize) / 2;
			ball_y <= (`vc + `ballsize) / 2;
			v_x <= 1'b1;
			v_y <= 1'b1;
			left_score <= 8'd0;
			right_score <= 8'd0;
		end else begin
			if(ball_x >= (`hc - `ballsize) && ball_x <= (`hc - `ballsize + 8'b11111111)) begin
				v_x = 1'b0;
				if((right - `batheight) < ball_y && ball_y < right)
					right_score <= right_score + 1;
			end else if(ball_x == 0 || (ball_x >= (`hc - `ballsize + 8'b11111111))) begin
				v_x = 1'b1;
				if((left - `batheight) < ball_y && ball_y < left)
					left_score <= left_score + 1;
			end
				
			if(ball_y >= (`vc - `ballsize) && ball_y <= (`vc - `ballsize + 8'b11111111))
				v_y = 1'b0;
			else if(ball_y == 0 || (ball_y >= (`vc - `ballsize + 8'b11111111)))
				v_y = 1'b1;
				
			ball_x = ball_x + (v_x ? 1 : -1) * ball_speed;
			ball_y = ball_y + (v_y ? 1 : -1) * ball_speed;
		end
	end
endmodule
