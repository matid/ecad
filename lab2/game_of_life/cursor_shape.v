module cursor_shape(
	input [3:0] x,
	input [4:0] y,
	output pixel
	);

	assign pixel = linepattern[x];
 
	reg [0:11] linepattern;

	always @(*)
		case(y)
			5'h00: linepattern <= 12'b100000000000;
			5'h01: linepattern <= 12'b110000000000;
			5'h02: linepattern <= 12'b111000000000;
			5'h03: linepattern <= 12'b111100000000;
			5'h04: linepattern <= 12'b111110000000;
			5'h05: linepattern <= 12'b111111000000;
			5'h06: linepattern <= 12'b111111100000;
			5'h07: linepattern <= 12'b111111110000;
			5'h08: linepattern <= 12'b111111111000;
			5'h09: linepattern <= 12'b111111111100;
			5'h0a: linepattern <= 12'b111111111110;
			5'h0b: linepattern <= 12'b111111111111;
			5'h0c: linepattern <= 12'b111111110000;
			5'h0d: linepattern <= 12'b111111110000;
			5'h0e: linepattern <= 12'b111001111000;
			5'h0f: linepattern <= 12'b110001111000;
			5'h10: linepattern <= 12'b100000111100;
			5'h11: linepattern <= 12'b000000111100;
			5'h12: linepattern <= 12'b000000011110;
			5'h13: linepattern <= 12'b000000011110;
			5'h14: linepattern <= 12'b000000001100;
		default: linepattern <= 12'b000000000000;
	endcase
endmodule
