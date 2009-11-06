//Legal Notice: (C)2007 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module state_0 (
                 // inputs:
                  addr,
                  clk,
                  mouse_button,
                  next_state,
                  read,
                  reset,
                  x,
                  y,

                 // outputs:
                  readdata
               )
;

  output  [ 31: 0] readdata;
  input   [  1: 0] addr;
  input            clk;
  input            mouse_button;
  input            next_state;
  input            read;
  input            reset;
  input   [ 10: 0] x;
  input   [ 10: 0] y;

  wire    [ 31: 0] readdata;
  state the_state
    (
      .addr         (addr),
      .clk          (clk),
      .mouse_button (mouse_button),
      .next_state   (next_state),
      .read         (read),
      .readdata     (readdata),
      .reset        (reset),
      .x            (x),
      .y            (y)
    );


endmodule

