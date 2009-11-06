module cursor_outline(
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
			5'h02: linepattern <= 12'b101000000000;
			5'h03: linepattern <= 12'b100100000000;
			5'h04: linepattern <= 12'b100010000000;
			5'h05: linepattern <= 12'b100001000000;
			5'h06: linepattern <= 12'b100000100000;
			5'h07: linepattern <= 12'b100000010000;
			5'h08: linepattern <= 12'b100000001000;
			5'h09: linepattern <= 12'b100000000100;
			5'h0a: linepattern <= 12'b100000000010;
			5'h0b: linepattern <= 12'b100000011111;
			5'h0c: linepattern <= 12'b100010010000;
			5'h0d: linepattern <= 12'b100110010000;
			5'h0e: linepattern <= 12'b101001001000;
			5'h0f: linepattern <= 12'b110001001000;
			5'h10: linepattern <= 12'b100000100100;
			5'h11: linepattern <= 12'b000000100100;
			5'h12: linepattern <= 12'b000000010010;
			5'h13: linepattern <= 12'b000000010010;
			5'h14: linepattern <= 12'b000000001100;

			default: linepattern <= 12'b000000000000;
		endcase
endmodule
