
`include "defines.v"

module renderer(
	input clk,
	input candraw,
	input [10:0] x,
	input [10:0] y,
	input [10:0] left,
	input [10:0] right,
	output reg [9:0] red,
	output reg [9:0] green,
	output reg [9:0] blue,
	output vga_blank
	);

	reg n_vga_blank;
	assign vga_blank = !n_vga_blank;
	
	always @(posedge clk) begin
		if (candraw) begin
		    n_vga_blank <= 1'b0;
			// 
			if (x < `batwidth && (left - `batheight) < y && y < left) begin
				red 	<= 10'd0;
				green 	<= 10'd0;
				blue	<= 10'b11_1111_1111;
			end else if (x > (`hc - `batwidth) && (right - `batheight) < y && y < right) begin
				red 	<= 10'd0;
				green 	<= 10'd0;
				blue	<= 10'b11_1111_1111;
			end else begin
				red		<= 10'd0;
				green	<= 10'b11_1111_1111;
				blue	<= 10'd0;
			end
		end else begin
			// if we are not in the visible area, we must set the screen blank
			n_vga_blank <= 1'b1;
		end
	end
endmodule 