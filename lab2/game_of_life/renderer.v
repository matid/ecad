
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
	output reg [10:0] addr,
	output vga_blank
	);
	
	reg n_vga_blank;
	assign vga_blank = !n_vga_blank;
	wire shape;
	wire outline;
	
	cursor_shape cs(
		.x(x-cursor_x),
		.y(y-cursor_y),
		.pixel(shape)
	);
	
	cursor_outline co(
		.x(x-cursor_x),
		.y(y-cursor_y),
		.pixel(outline)
	);
	
	always @(posedge clk) begin
		if (candraw) begin
		    n_vga_blank <= 1'b0;
		    
		    addr <= 40*(y >> 5)+(x >> 5);
		    
		    if(x%32 == 0 || x%32 == 31 || y%32 == 0 || y%32 == 31) begin
				red <= 10'd0;
				green <= 10'b11_1111_1111;
				blue <= 10'd0;
			end else begin
				if(data == 8'b0000_0000) begin
					red <= 10'b11_1111_1111;
					green <= 10'b11_1111_1111;
					blue <= 10'b11_1111_1111;
				end else begin
					red <= 10'd0;
					green <= 10'd0;
					blue <= 10'd0;
				end
			end
			
			if(x >= cursor_x && x < cursor_x + `cursorwidth && y >= cursor_y && y < cursor_y + `cursorheight) begin
				if(shape) begin
					red <= 10'd0;
					green <= 10'd0;
					blue <= 10'd0;
				end
			
				if(outline) begin
					red <= 10'b11_1111_1111;
					green <= 10'b11_1111_1111;
					blue <= 10'b11_1111_1111;
				end
			end
			
		end else begin
			// if we are not in the visible area, we must set the screen blank
			n_vga_blank <= 1'b1;
		end
	end
endmodule 