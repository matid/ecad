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

module grid_0 (
                // inputs:
                 address_a,
                 address_b,
                 clock_a,
                 clock_b,
                 data_a,
                 data_b,
                 reset,
                 wren_a,
                 wren_b,

                // outputs:
                 q_a,
                 q_b
              )
;

  output  [  7: 0] q_a;
  output  [  7: 0] q_b;
  input   [ 10: 0] address_a;
  input   [ 10: 0] address_b;
  input            clock_a;
  input            clock_b;
  input   [  7: 0] data_a;
  input   [  7: 0] data_b;
  input            reset;
  input            wren_a;
  input            wren_b;

  wire    [  7: 0] q_a;
  wire    [  7: 0] q_b;
  grid the_grid
    (
      .address_a (address_a),
      .address_b (address_b),
      .clock_a   (clock_a),
      .clock_b   (clock_b),
      .data_a    (data_a),
      .data_b    (data_b),
      .q_a       (q_a),
      .q_b       (q_b),
      .reset     (reset),
      .wren_a    (wren_a),
      .wren_b    (wren_b)
    );


endmodule

