`include "defines.v"

module counter(input clk, input reset, input up, input down, input [7:0] offset, output [10:0] count);
	reg [10:0] i;
	assign count = i;
	
	always @(posedge clk or posedge reset)
	begin
		if(reset)
			i <= (`vc+`batheight)/2;
		else begin
			if(up) begin
				if(i < (`vc - offset))
					i <= i + offset;
				else if(i < `vc)
					i <= `vc;
			end else if(down) begin
				if(i > (`batheight + offset))
					i <= i - offset;
				else if(i > `batheight)
					i <= `batheight;
			end
		end
	end
endmodule
