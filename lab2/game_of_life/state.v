
// Address Value
// 00      NextState
// 01      LeftButton
// 10      X
// 11      Y

module state(
	input clk,
	input [10:0] x,
	input [10:0] y,
	input mouse_button, // button is pressed if this wire changes
	input next_state,	// key is pressed if this wire is high
	input [1:0] addr,
	input read,
	input reset,
	output [31:0] readdata
	);
	
	reg newstate = 1'b0;
	reg processing = 1'b0;
	
	assign readdata = !read           ? readdata :
					  (addr == 2'b00) ? {{31{1'b0}}, newstate} :
					  (addr == 2'b01) ? {{31{1'b0}}, mouse_button} :
					  (addr == 2'b10) ? {{21{1'b0}}, x} : {{21{1'b0}}, y};
	
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			newstate <= 1'b0;
			processing <= 1'b0;
		end else begin
			if (next_state && !processing) begin
				newstate <= !newstate;
				processing <= 1'b1;
			end else if (!next_state) begin
				processing <= 1'b0;
			end
		end
	end
	
endmodule 