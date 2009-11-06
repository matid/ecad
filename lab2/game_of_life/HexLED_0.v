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

module HexLED_0 (
                  // inputs:
                   iCLOCK,
                   iDATA,
                   iRESET_N,
                   iWR,

                  // outputs:
                   HEX0,
                   HEX1,
                   HEX2,
                   HEX3,
                   HEX4,
                   HEX5,
                   HEX6,
                   HEX7
                )
;

  output  [  7: 0] HEX0;
  output  [  7: 0] HEX1;
  output  [  7: 0] HEX2;
  output  [  7: 0] HEX3;
  output  [  7: 0] HEX4;
  output  [  7: 0] HEX5;
  output  [  7: 0] HEX6;
  output  [  7: 0] HEX7;
  input            iCLOCK;
  input   [ 31: 0] iDATA;
  input            iRESET_N;
  input            iWR;

  wire    [  7: 0] HEX0;
  wire    [  7: 0] HEX1;
  wire    [  7: 0] HEX2;
  wire    [  7: 0] HEX3;
  wire    [  7: 0] HEX4;
  wire    [  7: 0] HEX5;
  wire    [  7: 0] HEX6;
  wire    [  7: 0] HEX7;
  HexLED the_HexLED
    (
      .HEX0     (HEX0),
      .HEX1     (HEX1),
      .HEX2     (HEX2),
      .HEX3     (HEX3),
      .HEX4     (HEX4),
      .HEX5     (HEX5),
      .HEX6     (HEX6),
      .HEX7     (HEX7),
      .iCLOCK   (iCLOCK),
      .iDATA    (iDATA),
      .iRESET_N (iRESET_N),
      .iWR      (iWR)
    );


endmodule

