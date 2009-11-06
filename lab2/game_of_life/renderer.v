
`include "defines.v"

module renderer(
	input clk,
	input candraw,
	input [10:0] x,
	input [10:0] y,
	input [10:0] cursor_x,
	input [10:0] cursor_y,
	input [7:0] data,
	output reg [9:0] red,
	output reg [9:0] green,
	output reg [9:0] blue,
	output [10:0] addr,
	output vga_blank
	);
	
	reg n_vga_blank;
	assign vga_blank = !n_vga_blank;
	
	always @(posedge clk) begin
		if (candraw) begin
		    n_vga_blank <= 1'b0;
			
			//////////////////////////////////////////
			// Insert render code here
			//////////////////////////////////////////
			                       
		end else begin
			// if we are not in the visible area, we must set the screen blank
			n_vga_blank <= 1'b1;
		end
	end
endmodule 