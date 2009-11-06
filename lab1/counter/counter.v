module counter(input clk, input up, input down, output [7:0] count);
	reg [7:0] i;
	assign count = i;
	
	always @(posedge clk)
	begin
		if(up)
			i <= i + 1;
		else if(down)
			i <= i - 1;
	end
endmodule
