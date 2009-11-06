`include "defines.v"

module pong(
	input  CLOCK_27,
	input  [3:0] KEY,
	input  [17:0] SW,
	output [9:0] VGA_R,
	output [9:0] VGA_G,
	output [9:0] VGA_B,
	output VGA_CLK,
	output VGA_BLANK,
	output VGA_HS,
	output VGA_VS,
	output VGA_SYNC,
	output TD_RESET,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7
	);


	wire video_clock;

	pll108MHz pll(.inclk0(CLOCK_27), .c0(video_clock));

	assign VGA_CLK = video_clock;
	assign VGA_SYNC = 0;
	
	wire candraw;
	wire start;
	wire ballon;
	wire [10:0] x;
	wire [10:0] y;
	
	wire [10:0] left;
	wire [10:0] right;
	
	assign TD_RESET = 1'b1;

	// VGA parameters
	params p(
		.clk(video_clock),
		.vsync(VGA_VS),
		.hsync(VGA_HS),
		.x(x),
		.y(y),
		.can_draw(candraw),
		.start_of_frame(start)
		);

	// Module that does the drawing on screen
	renderer r(
		.clk(video_clock),
		.candraw(candraw),
		.x(x),
		.y(y),
		.left(left),
		.right(right),
		.red(VGA_R),
		.green(VGA_G),
		.blue(VGA_B),
		.vga_blank(VGA_BLANK)
		);
		
	game_logic gl(
		.clk(start),
		.reset(SW[17]),
		.left_up(~KEY[1]),
		.left_down(~KEY[0]),
		.right_up(~KEY[3]),
		.right_down(~KEY[2]),
		.ball_speed(SW[7:0]),
		.left(left),
		.right(right)
	);
	
	hex2leds h0(
		.hexval(left[3:0]),
		.ledcode(HEX0)
	);
	
	hex2leds h1(
		.hexval(left[7:4]),
		.ledcode(HEX1)
	);
	
	hex2leds h2(
		.hexval(right[3:0]),
		.ledcode(HEX2)
	);
	
	hex2leds h3(
		.hexval(right[7:4]),
		.ledcode(HEX3)
	);
endmodule
