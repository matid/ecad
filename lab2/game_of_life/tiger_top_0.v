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

module tiger_top_0 (
                     // inputs:
                      avm_dataMaster_irq,
                      avm_dataMaster_irqnumber,
                      avm_dataMaster_readdata,
                      avm_dataMaster_readdatavalid,
                      avm_dataMaster_waitrequest,
                      avm_instructionMaster_readdata,
                      avm_instructionMaster_readdatavalid,
                      avm_instructionMaster_waitrequest,
                      avs_debugSlave_write,
                      avs_debugSlave_writedata,
                      clk,
                      reset,

                     // outputs:
                      avm_dataMaster_address,
                      avm_dataMaster_byteenable,
                      avm_dataMaster_read,
                      avm_dataMaster_write,
                      avm_dataMaster_writedata,
                      avm_instructionMaster_address,
                      avm_instructionMaster_read,
                      avs_debugSlave_irq
                   )
;

  output  [ 31: 0] avm_dataMaster_address;
  output  [  3: 0] avm_dataMaster_byteenable;
  output           avm_dataMaster_read;
  output           avm_dataMaster_write;
  output  [ 31: 0] avm_dataMaster_writedata;
  output  [ 31: 0] avm_instructionMaster_address;
  output           avm_instructionMaster_read;
  output           avs_debugSlave_irq;
  input            avm_dataMaster_irq;
  input   [  5: 0] avm_dataMaster_irqnumber;
  input   [ 31: 0] avm_dataMaster_readdata;
  input            avm_dataMaster_readdatavalid;
  input            avm_dataMaster_waitrequest;
  input   [ 31: 0] avm_instructionMaster_readdata;
  input            avm_instructionMaster_readdatavalid;
  input            avm_instructionMaster_waitrequest;
  input            avs_debugSlave_write;
  input            avs_debugSlave_writedata;
  input            clk;
  input            reset;

  wire    [ 31: 0] avm_dataMaster_address;
  wire    [  3: 0] avm_dataMaster_byteenable;
  wire             avm_dataMaster_read;
  wire             avm_dataMaster_write;
  wire    [ 31: 0] avm_dataMaster_writedata;
  wire    [ 31: 0] avm_instructionMaster_address;
  wire             avm_instructionMaster_read;
  wire             avs_debugSlave_irq;
  tiger_top the_tiger_top
    (
      .avm_dataMaster_address              (avm_dataMaster_address),
      .avm_dataMaster_byteenable           (avm_dataMaster_byteenable),
      .avm_dataMaster_irq                  (avm_dataMaster_irq),
      .avm_dataMaster_irqnumber            (avm_dataMaster_irqnumber),
      .avm_dataMaster_read                 (avm_dataMaster_read),
      .avm_dataMaster_readdata             (avm_dataMaster_readdata),
      .avm_dataMaster_readdatavalid        (avm_dataMaster_readdatavalid),
      .avm_dataMaster_waitrequest          (avm_dataMaster_waitrequest),
      .avm_dataMaster_write                (avm_dataMaster_write),
      .avm_dataMaster_writedata            (avm_dataMaster_writedata),
      .avm_instructionMaster_address       (avm_instructionMaster_address),
      .avm_instructionMaster_read          (avm_instructionMaster_read),
      .avm_instructionMaster_readdata      (avm_instructionMaster_readdata),
      .avm_instructionMaster_readdatavalid (avm_instructionMaster_readdatavalid),
      .avm_instructionMaster_waitrequest   (avm_instructionMaster_waitrequest),
      .avs_debugSlave_irq                  (avs_debugSlave_irq),
      .avs_debugSlave_write                (avs_debugSlave_write),
      .avs_debugSlave_writedata            (avs_debugSlave_writedata),
      .clk                                 (clk),
      .reset                               (reset)
    );


endmodule

