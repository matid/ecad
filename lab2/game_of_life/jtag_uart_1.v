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

module jtag_uart_1 (
                     // inputs:
                      avs_controlSlave_address,
                      avs_controlSlave_read,
                      avs_controlSlave_write,
                      avs_controlSlave_writedata,
                      clk,
                      reset_n,

                     // outputs:
                      avs_controlSlave_readdata
                   )
;

  output  [ 31: 0] avs_controlSlave_readdata;
  input            avs_controlSlave_address;
  input            avs_controlSlave_read;
  input            avs_controlSlave_write;
  input   [ 31: 0] avs_controlSlave_writedata;
  input            clk;
  input            reset_n;

  wire    [ 31: 0] avs_controlSlave_readdata;
  vJTAGUart the_vJTAGUart
    (
      .avs_controlSlave_address   (avs_controlSlave_address),
      .avs_controlSlave_read      (avs_controlSlave_read),
      .avs_controlSlave_readdata  (avs_controlSlave_readdata),
      .avs_controlSlave_write     (avs_controlSlave_write),
      .avs_controlSlave_writedata (avs_controlSlave_writedata),
      .clk                        (clk),
      .reset_n                    (reset_n)
    );


endmodule

