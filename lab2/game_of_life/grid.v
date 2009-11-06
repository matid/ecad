
module grid(
	input [10:0] address_a, // export
	input [10:0] address_b, // addr
	input wren_a,			// export
	input wren_b,			// writeenable
	input [7:0] data_a,		// export
	input [7:0] data_b,		// data
	input clock_a,			// export
	input clock_b,			// clk
	input reset,			// reset
	output [7:0] q_a,		// export
	output [7:0] q_b		// dataout
	);
	
	game_grid mem (
		.address_a(address_a),
		.address_b(address_b),
		.wren_a(wren_a),
		.wren_b(wren_b),
		.data_a(data_a),
		.data_b(data_b),
		.clock_a(clock_a),
		.clock_b(clock_b),
		.q_a(q_a),
		.q_b(q_b)
		);
endmodule
