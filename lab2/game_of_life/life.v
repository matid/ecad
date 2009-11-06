
module life(
	input CLOCK_50,
	input CLOCK_27,
	inout PS2_CLK,
	input [3:0] KEY,
	output [9:0] VGA_R,
	output [9:0] VGA_G,
	output [9:0] VGA_B,
	output VGA_CLK,
	output VGA_BLANK,
	output VGA_HS,
	output VGA_VS,
	output VGA_SYNC,
	output [17:0] LEDR,
	output [8:0] LEDG,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	output TD_RESET,
	output [11:0] DRAM_ADDR,
	output DRAM_BA_0,
	output DRAM_BA_1,
	output DRAM_LDQM,
	output DRAM_UDQM,
	output DRAM_RAS_N,
	output DRAM_CAS_N,
	output DRAM_CKE,
	output DRAM_WE_N,
	output DRAM_CS_N,
	output DRAM_CLK,
	inout [15:0] DRAM_DQ,
	inout PS2_DAT
	);
	
	assign TD_RESET = 1'b1;
	
	wire video_clock;
	wire CLOCK_25;
	
	pll108MHz pll(.inclk0(CLOCK_27), .c0(video_clock));
	pll25MHz pll25(.inclk0(CLOCK_50), .c0(CLOCK_25), .c1(DRAM_CLK));
	
	assign VGA_CLK = video_clock;
	assign VGA_SYNC = 0;
	
	wire candraw;
	wire start;
	wire [10:0] x;
	wire [10:0] y;
	
	wire [7:0] change_x;
	wire [7:0] change_y;
	wire [7:0] controls;
	
	assign left = button_press;
		
	mouse m(
		.clk(CLOCK_25),
		.ps2_clk(PS2_CLK),
		.ps2_data(PS2_DAT),
		.resend(resend),
		.data(mousedata),
		.datarx(datarx)
		);
	
	wire [7:0] mousedata;
	wire [10:0] cursor_x, cursor_y;
	wire datarx;
	wire button_press;
	wire resend;
	mouse_logic ml(
		.clk(CLOCK_25),
		.data_rx(datarx),
		.data(mousedata),
		.resend(resend),
		.x(cursor_x),
		.y(cursor_y),
		.left(button_press)
		);

	params p(
		.clk(video_clock),
		.vsync(VGA_VS),
		.hsync(VGA_HS),
		.x(x),
		.y(y),
		.can_draw(candraw),
		.start_of_frame(start)
		);
		
	renderer r(
		.clk(video_clock),
		.candraw(candraw),
		.x(x),
		.y(y),
		.cursor_x(cursor_x),
		.cursor_y(cursor_y),
		.red(VGA_R),
		.green(VGA_G),
		.blue(VGA_B),
		.vga_blank(VGA_BLANK),
		.addr(rdaddr),
		.data(data_out)
		);

	wire [7:0] data_out;
	wire [10:0] rdaddr;
	game_of_life gol(
		.clk(CLOCK_25),
		.reset_n(1'b1),
		.out_port_from_the_GreenLED(LEDG[8:0]),
		.out_port_from_the_RedLED(LEDR[17:0]),
		.HEX0_from_the_HexLED_0(HEX0),
		.HEX1_from_the_HexLED_0(HEX1),
		.HEX2_from_the_HexLED_0(HEX2),
		.HEX3_from_the_HexLED_0(HEX3),
		.HEX4_from_the_HexLED_0(HEX4),
		.HEX5_from_the_HexLED_0(HEX5),
		.HEX6_from_the_HexLED_0(HEX6),
		.HEX7_from_the_HexLED_0(HEX7),
		.address_a_to_the_grid_0(rdaddr),
		.clock_a_to_the_grid_0(video_clock),
		.data_a_to_the_grid_0(8'hXX),
		.q_a_from_the_grid_0(data_out),			    
		.wren_a_to_the_grid_0(1'b0),
		.mouse_button_to_the_state_0(button_press), 
        .next_state_to_the_state_0(!KEY[0]),
        .x_to_the_state_0(cursor_x),
        .y_to_the_state_0(cursor_y),
        .zs_addr_from_the_sdram(DRAM_ADDR),
        .zs_ba_from_the_sdram({DRAM_BA_1, DRAM_BA_0}),
        .zs_cas_n_from_the_sdram(DRAM_CAS_N),
        .zs_cke_from_the_sdram(DRAM_CKE),
        .zs_cs_n_from_the_sdram(DRAM_CS_N),
        .zs_dq_to_and_from_the_sdram(DRAM_DQ),
        .zs_dqm_from_the_sdram({DRAM_UDQM, DRAM_LDQM}),
        .zs_ras_n_from_the_sdram(DRAM_RAS_N),
        .zs_we_n_from_the_sdram(DRAM_WE_N)
	);
endmodule 