
module mouse_logic(
	input clk,
	input data_rx,
	input [7:0] data,
	input resend,
	output reg signed [11:0] x, // intentional - upper bit will be ignored by outer wrapper
	output reg signed [11:0] y, // intentional - upper bit will be ignored by outer wrapper
	output reg left
	);
	
	reg [1:0] state = 2'b00;
	reg prev_data;
	reg prev_resend;
	reg just_finished;
	
	reg [7:0] control;
	reg signed [8:0] dx, dy;
	
	reg is_mouse_down = 1'b0;
	
	always @(posedge clk) begin
		prev_data <= data_rx;
		prev_resend <= resend;
		
		if (prev_resend != resend) begin
			state <= 0;
			just_finished <= 0;
		end else if (prev_data != data_rx) begin
			case (state)
				0: begin
					just_finished <= 0;
					if (data[3] == 1) begin
						state <= 2'b01;
						control <= data;
						
						if (just_finished) begin
							x <= (x + dx) < 0 ? 0 
								:(x + dx) >= 1280 ? 1280 : x + dx;
							y <= (y + dy) < 0 ? 0
								:(y + dy) >= 1024 ? 1024 : y + dy;
							
							is_mouse_down <= control[0];
							if (!is_mouse_down) 
								left <= control[0] ? !left : left;	
						end
					end
				end
				1: begin
					state <= 2'b10;
					dx <= {control[4], data};
				end
				2: begin
					state <= 2'b00;
					dy <= ~{control[5], data} + 1;
					just_finished <= 1;
				end
			endcase
		end
	end
	
endmodule 