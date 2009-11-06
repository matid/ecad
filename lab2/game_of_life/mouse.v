
`define IDLE     0
`define WRITE	 1
`define READ	 10
`define NEXT	 state + 1

module mouse(
	input clk,				// 25MHz clock
	inout ps2_clk,			// PS/2 clock pin
	inout ps2_data,			// PS/2 data pin
	output reg [7:0] data,	// received byte
	output reg datarx,		// 2-phase indicator
							// changes when a valid byte has been received
	output reg resend		// 2-phase indicator
							// changes when we have had to request a re-transmission		
	);
	
	reg [3:0] state;
	reg psclk, psnewclk, psdata, pstemp;
	reg psclke, psoute;
	
	reg need_reset = 1'b1;
	
	assign ps2_clk  = psclke ? 1'b0 : 1'bz;
	assign ps2_data = psoute ? senddata : 1'bz;
	
	reg senddata;
	
	reg [8:0] receivebuf;
	reg [3:0] receivecount;
	reg [8:0] sendbuf;
	reg [3:0] sendcount;
	
	// At a 25MHz clock
	// 100us = 2500 cycles
	// 15us  = 375  cycles
	// 40us  = 1000 cycles
	// 55us  = 1375 cycles
	// 10us  = 250  cycles
	reg [13:0] wait_count;
	
	// At a 25MHz clock => 50000 cycles
	reg [17:0] wait2ms; 
	reg writing;
	
	reg [1:0] readstate;
	reg [1:0] sendstate;
	
	always @(posedge clk) begin
		// A write must not take longer than 2ms
		// if it does, end transmission
	    if (writing) begin
		    wait2ms <= wait2ms + 1;
			if (wait2ms > 50000) begin
				state <= `IDLE;
				writing <= 0;
			end
		end
		
		psclk <= psnewclk;
		psnewclk <= pstemp;
		pstemp <= ps2_clk;
		psdata <= ps2_data;
		
		case (state)
			`IDLE: begin
				// start bit
				if (psnewclk == 0 && psclk == 1 && psdata == 0) begin
					state <= `READ;
					wait_count <= 0;
					readstate <= 2'b0;
				// reset the mouse by sending it byte 0xF4
				end else if (need_reset) begin
					need_reset <= 1'b0;
					state <= `WRITE;
					sendbuf[7:0] <= 8'hF4;
				end
			end 
			
			//-------------------------------------------------------------------
			
			`READ: begin
				receivecount <= 0;
				psclke <= 0;
				psoute <= 0;
				wait_count <= wait_count + 1;
				if (wait_count == 375) begin
					state <= `NEXT;
					wait_count <= 0;
					readstate <= 0;
				end
			end
			`READ + 1: begin
				// read 8 data bits and parity bit into receivebuf
				case (readstate)
					0: begin
						if (psnewclk == 0 && psclk == 1) begin
						    wait_count <= 0;
						    readstate <= readstate + 1;
						    if (receivecount == 9) state <= `NEXT;
						end
					end
					1: begin
						if (wait_count < 375) begin
							wait_count <= wait_count + 1;
						end else begin
							readstate <= readstate + 1;
							wait_count <= 0;
						end
					end
					2: begin
						receivebuf[receivecount] <= psdata;
						receivecount <= receivecount + 1;
						readstate <= 3;
					end
					3: begin
						wait_count <= wait_count + 1;
						if (wait_count == 1000) readstate <= readstate + 1;
					end
				endcase
			end
			`READ + 2: begin
				// stop bit
				wait_count <= wait_count + 1;
				if (wait_count == 375) state <= `NEXT;
			end
			`READ + 3: begin
				// wait for rising edge of clock
				if (psnewclk == 1 && psclk == 0) state <= `NEXT;
			end
			`READ + 4: begin
				// parity wrong, request a re-send
				if (receivebuf[8] == (^(receivebuf[7:0]))) begin
					state <= `WRITE;
					sendbuf[7:0] <= 8'hFE;
					resend <= !resend;
				end
				// correct parity, so handle the received byte
				else begin
					state <= `NEXT;
				end
			end
			`READ + 5: begin
				state <= `IDLE;
				data <= receivebuf[7:0];
				datarx <= !datarx;
			end
			
			//-------------------------------------------------------------------
			
			`WRITE: begin
				sendcount <= 0;
				wait_count <= 0;
				sendbuf[8] <= !(^(sendbuf[7:0]));
				state <= `NEXT;
				sendstate <= 0;
				writing <= 1;
				wait2ms <= 0;
			end
			`WRITE + 1: begin
				psclke <= 1;
				wait_count <= wait_count + 1;
				
				// send the start bit
				if (wait_count == 2525) begin
					senddata <= 0;
					psclke <= 0;
					psoute <= 1;
					state <= `NEXT;
				end
			end
			`WRITE + 2: begin
				// send 8 data bits and parity bit
				case (sendstate)
					0: begin
						if (psnewclk == 0 && psclk == 1) begin
							wait_count <= 0;
							sendstate <= 2'd1;
							if (sendcount == 9) state <= `NEXT;
						end
					end
					1: begin
						wait_count <= wait_count + 1;
						senddata <= sendbuf[sendcount];
						if (wait_count == 1375) sendstate <= 2'd2;
					end
					2: begin
						sendcount <= sendcount + 1;
						sendstate <= 2'd0;
					end
				endcase
			end
			// send stop bit
			`WRITE + 3: begin
				wait_count <= wait_count + 1;
				if (wait_count == 128) begin
					senddata <= 1;
					state <= `NEXT;
				end
			end
			`WRITE + 4: begin
				if (psnewclk == 1 && psclk == 0) begin
					psoute <= 0;
					state <= `NEXT;
				end
			end
			`WRITE + 5: begin
				if (psdata == 0) state <= `NEXT;
			end
			`WRITE + 6: begin
				if (psnewclk == 1 && psclk == 0) state <= `NEXT;
			end
			`WRITE + 7: begin
				if (psdata == 1) state <= `NEXT;
			end
			`WRITE + 8: begin
				state <= `IDLE;
				writing <= 0;
			end
			default: begin
				state <= `IDLE;
			end
		endcase
	end
	
endmodule 