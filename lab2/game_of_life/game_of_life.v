//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


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

module GreenLED_s1_arbitrator (
                                // inputs:
                                 clk,
                                 reset_n,
                                 tiger_top_0_dataMaster_address_to_slave,
                                 tiger_top_0_dataMaster_latency_counter,
                                 tiger_top_0_dataMaster_read,
                                 tiger_top_0_dataMaster_write,
                                 tiger_top_0_dataMaster_writedata,

                                // outputs:
                                 GreenLED_s1_address,
                                 GreenLED_s1_chipselect,
                                 GreenLED_s1_reset_n,
                                 GreenLED_s1_write_n,
                                 GreenLED_s1_writedata,
                                 d1_GreenLED_s1_end_xfer,
                                 tiger_top_0_dataMaster_granted_GreenLED_s1,
                                 tiger_top_0_dataMaster_qualified_request_GreenLED_s1,
                                 tiger_top_0_dataMaster_read_data_valid_GreenLED_s1,
                                 tiger_top_0_dataMaster_requests_GreenLED_s1
                              )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [  1: 0] GreenLED_s1_address;
  output           GreenLED_s1_chipselect;
  output           GreenLED_s1_reset_n;
  output           GreenLED_s1_write_n;
  output  [  8: 0] GreenLED_s1_writedata;
  output           d1_GreenLED_s1_end_xfer;
  output           tiger_top_0_dataMaster_granted_GreenLED_s1;
  output           tiger_top_0_dataMaster_qualified_request_GreenLED_s1;
  output           tiger_top_0_dataMaster_read_data_valid_GreenLED_s1;
  output           tiger_top_0_dataMaster_requests_GreenLED_s1;
  input            clk;
  input            reset_n;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_dataMaster_writedata;

  wire    [  1: 0] GreenLED_s1_address;
  wire             GreenLED_s1_allgrants;
  wire             GreenLED_s1_allow_new_arb_cycle;
  wire             GreenLED_s1_any_bursting_master_saved_grant;
  wire             GreenLED_s1_any_continuerequest;
  wire             GreenLED_s1_arb_counter_enable;
  reg     [  2: 0] GreenLED_s1_arb_share_counter;
  wire    [  2: 0] GreenLED_s1_arb_share_counter_next_value;
  wire    [  2: 0] GreenLED_s1_arb_share_set_values;
  wire             GreenLED_s1_beginbursttransfer_internal;
  wire             GreenLED_s1_begins_xfer;
  wire             GreenLED_s1_chipselect;
  wire             GreenLED_s1_end_xfer;
  wire             GreenLED_s1_firsttransfer;
  wire             GreenLED_s1_grant_vector;
  wire             GreenLED_s1_in_a_read_cycle;
  wire             GreenLED_s1_in_a_write_cycle;
  wire             GreenLED_s1_master_qreq_vector;
  wire             GreenLED_s1_non_bursting_master_requests;
  wire             GreenLED_s1_reset_n;
  reg              GreenLED_s1_slavearbiterlockenable;
  wire             GreenLED_s1_slavearbiterlockenable2;
  wire             GreenLED_s1_waits_for_read;
  wire             GreenLED_s1_waits_for_write;
  wire             GreenLED_s1_write_n;
  wire    [  8: 0] GreenLED_s1_writedata;
  reg              d1_GreenLED_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_GreenLED_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 31: 0] shifted_address_to_GreenLED_s1_from_tiger_top_0_dataMaster;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_GreenLED_s1;
  wire             tiger_top_0_dataMaster_qualified_request_GreenLED_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_GreenLED_s1;
  wire             tiger_top_0_dataMaster_requests_GreenLED_s1;
  wire             tiger_top_0_dataMaster_saved_grant_GreenLED_s1;
  wire             wait_for_GreenLED_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~GreenLED_s1_end_xfer;
    end


  assign GreenLED_s1_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_GreenLED_s1));
  assign tiger_top_0_dataMaster_requests_GreenLED_s1 = (({tiger_top_0_dataMaster_address_to_slave[31 : 4] , 4'b0} == 32'hf0000810) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)) & tiger_top_0_dataMaster_write;
  //GreenLED_s1_arb_share_counter set values, which is an e_mux
  assign GreenLED_s1_arb_share_set_values = 1;

  //GreenLED_s1_non_bursting_master_requests mux, which is an e_mux
  assign GreenLED_s1_non_bursting_master_requests = tiger_top_0_dataMaster_requests_GreenLED_s1;

  //GreenLED_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign GreenLED_s1_any_bursting_master_saved_grant = 0;

  //GreenLED_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign GreenLED_s1_arb_share_counter_next_value = GreenLED_s1_firsttransfer ? (GreenLED_s1_arb_share_set_values - 1) : |GreenLED_s1_arb_share_counter ? (GreenLED_s1_arb_share_counter - 1) : 0;

  //GreenLED_s1_allgrants all slave grants, which is an e_mux
  assign GreenLED_s1_allgrants = |GreenLED_s1_grant_vector;

  //GreenLED_s1_end_xfer assignment, which is an e_assign
  assign GreenLED_s1_end_xfer = ~(GreenLED_s1_waits_for_read | GreenLED_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_GreenLED_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_GreenLED_s1 = GreenLED_s1_end_xfer & (~GreenLED_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //GreenLED_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign GreenLED_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_GreenLED_s1 & GreenLED_s1_allgrants) | (end_xfer_arb_share_counter_term_GreenLED_s1 & ~GreenLED_s1_non_bursting_master_requests);

  //GreenLED_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          GreenLED_s1_arb_share_counter <= 0;
      else if (GreenLED_s1_arb_counter_enable)
          GreenLED_s1_arb_share_counter <= GreenLED_s1_arb_share_counter_next_value;
    end


  //GreenLED_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          GreenLED_s1_slavearbiterlockenable <= 0;
      else if ((|GreenLED_s1_master_qreq_vector & end_xfer_arb_share_counter_term_GreenLED_s1) | (end_xfer_arb_share_counter_term_GreenLED_s1 & ~GreenLED_s1_non_bursting_master_requests))
          GreenLED_s1_slavearbiterlockenable <= |GreenLED_s1_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster GreenLED/s1 arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = GreenLED_s1_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //GreenLED_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign GreenLED_s1_slavearbiterlockenable2 = |GreenLED_s1_arb_share_counter_next_value;

  //tiger_top_0/dataMaster GreenLED/s1 arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = GreenLED_s1_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //GreenLED_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign GreenLED_s1_any_continuerequest = 1;

  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_assign
  assign tiger_top_0_dataMaster_continuerequest = 1;

  assign tiger_top_0_dataMaster_qualified_request_GreenLED_s1 = tiger_top_0_dataMaster_requests_GreenLED_s1;
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_GreenLED_s1, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_GreenLED_s1 = tiger_top_0_dataMaster_granted_GreenLED_s1 & tiger_top_0_dataMaster_read & ~GreenLED_s1_waits_for_read;

  //GreenLED_s1_writedata mux, which is an e_mux
  assign GreenLED_s1_writedata = tiger_top_0_dataMaster_writedata;

  //master is always granted when requested
  assign tiger_top_0_dataMaster_granted_GreenLED_s1 = tiger_top_0_dataMaster_qualified_request_GreenLED_s1;

  //tiger_top_0/dataMaster saved-grant GreenLED/s1, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_GreenLED_s1 = tiger_top_0_dataMaster_requests_GreenLED_s1;

  //allow new arb cycle for GreenLED/s1, which is an e_assign
  assign GreenLED_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign GreenLED_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign GreenLED_s1_master_qreq_vector = 1;

  //GreenLED_s1_reset_n assignment, which is an e_assign
  assign GreenLED_s1_reset_n = reset_n;

  assign GreenLED_s1_chipselect = tiger_top_0_dataMaster_granted_GreenLED_s1;
  //GreenLED_s1_firsttransfer first transaction, which is an e_assign
  assign GreenLED_s1_firsttransfer = ~(GreenLED_s1_slavearbiterlockenable & GreenLED_s1_any_continuerequest);

  //GreenLED_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign GreenLED_s1_beginbursttransfer_internal = GreenLED_s1_begins_xfer;

  //~GreenLED_s1_write_n assignment, which is an e_mux
  assign GreenLED_s1_write_n = ~(tiger_top_0_dataMaster_granted_GreenLED_s1 & tiger_top_0_dataMaster_write);

  assign shifted_address_to_GreenLED_s1_from_tiger_top_0_dataMaster = tiger_top_0_dataMaster_address_to_slave;
  //GreenLED_s1_address mux, which is an e_mux
  assign GreenLED_s1_address = shifted_address_to_GreenLED_s1_from_tiger_top_0_dataMaster >> 2;

  //d1_GreenLED_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_GreenLED_s1_end_xfer <= 1;
      else if (1)
          d1_GreenLED_s1_end_xfer <= GreenLED_s1_end_xfer;
    end


  //GreenLED_s1_waits_for_read in a cycle, which is an e_mux
  assign GreenLED_s1_waits_for_read = GreenLED_s1_in_a_read_cycle & GreenLED_s1_begins_xfer;

  //GreenLED_s1_in_a_read_cycle assignment, which is an e_assign
  assign GreenLED_s1_in_a_read_cycle = tiger_top_0_dataMaster_granted_GreenLED_s1 & tiger_top_0_dataMaster_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = GreenLED_s1_in_a_read_cycle;

  //GreenLED_s1_waits_for_write in a cycle, which is an e_mux
  assign GreenLED_s1_waits_for_write = GreenLED_s1_in_a_write_cycle & 0;

  //GreenLED_s1_in_a_write_cycle assignment, which is an e_assign
  assign GreenLED_s1_in_a_write_cycle = tiger_top_0_dataMaster_granted_GreenLED_s1 & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = GreenLED_s1_in_a_write_cycle;

  assign wait_for_GreenLED_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //GreenLED/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module HexLED_0_avalon_slave_0_arbitrator (
                                            // inputs:
                                             clk,
                                             reset_n,
                                             tiger_top_0_dataMaster_address_to_slave,
                                             tiger_top_0_dataMaster_latency_counter,
                                             tiger_top_0_dataMaster_read,
                                             tiger_top_0_dataMaster_write,
                                             tiger_top_0_dataMaster_writedata,

                                            // outputs:
                                             HexLED_0_avalon_slave_0_reset_n,
                                             HexLED_0_avalon_slave_0_write,
                                             HexLED_0_avalon_slave_0_writedata,
                                             d1_HexLED_0_avalon_slave_0_end_xfer,
                                             tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0,
                                             tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0,
                                             tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0,
                                             tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0
                                          )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           HexLED_0_avalon_slave_0_reset_n;
  output           HexLED_0_avalon_slave_0_write;
  output  [ 31: 0] HexLED_0_avalon_slave_0_writedata;
  output           d1_HexLED_0_avalon_slave_0_end_xfer;
  output           tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0;
  input            clk;
  input            reset_n;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_dataMaster_writedata;

  wire             HexLED_0_avalon_slave_0_allgrants;
  wire             HexLED_0_avalon_slave_0_allow_new_arb_cycle;
  wire             HexLED_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             HexLED_0_avalon_slave_0_any_continuerequest;
  wire             HexLED_0_avalon_slave_0_arb_counter_enable;
  reg     [  2: 0] HexLED_0_avalon_slave_0_arb_share_counter;
  wire    [  2: 0] HexLED_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  2: 0] HexLED_0_avalon_slave_0_arb_share_set_values;
  wire             HexLED_0_avalon_slave_0_beginbursttransfer_internal;
  wire             HexLED_0_avalon_slave_0_begins_xfer;
  wire             HexLED_0_avalon_slave_0_end_xfer;
  wire             HexLED_0_avalon_slave_0_firsttransfer;
  wire             HexLED_0_avalon_slave_0_grant_vector;
  wire             HexLED_0_avalon_slave_0_in_a_read_cycle;
  wire             HexLED_0_avalon_slave_0_in_a_write_cycle;
  wire             HexLED_0_avalon_slave_0_master_qreq_vector;
  wire             HexLED_0_avalon_slave_0_non_bursting_master_requests;
  wire             HexLED_0_avalon_slave_0_reset_n;
  reg              HexLED_0_avalon_slave_0_slavearbiterlockenable;
  wire             HexLED_0_avalon_slave_0_slavearbiterlockenable2;
  wire             HexLED_0_avalon_slave_0_waits_for_read;
  wire             HexLED_0_avalon_slave_0_waits_for_write;
  wire             HexLED_0_avalon_slave_0_write;
  wire    [ 31: 0] HexLED_0_avalon_slave_0_writedata;
  reg              d1_HexLED_0_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_HexLED_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 31: 0] shifted_address_to_HexLED_0_avalon_slave_0_from_tiger_top_0_dataMaster;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_saved_grant_HexLED_0_avalon_slave_0;
  wire             wait_for_HexLED_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~HexLED_0_avalon_slave_0_end_xfer;
    end


  assign HexLED_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0));
  assign tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0 = (({tiger_top_0_dataMaster_address_to_slave[31 : 2] , 2'b0} == 32'hf0000820) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)) & tiger_top_0_dataMaster_write;
  //HexLED_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign HexLED_0_avalon_slave_0_arb_share_set_values = 1;

  //HexLED_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign HexLED_0_avalon_slave_0_non_bursting_master_requests = tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0;

  //HexLED_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign HexLED_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //HexLED_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign HexLED_0_avalon_slave_0_arb_share_counter_next_value = HexLED_0_avalon_slave_0_firsttransfer ? (HexLED_0_avalon_slave_0_arb_share_set_values - 1) : |HexLED_0_avalon_slave_0_arb_share_counter ? (HexLED_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //HexLED_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign HexLED_0_avalon_slave_0_allgrants = |HexLED_0_avalon_slave_0_grant_vector;

  //HexLED_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign HexLED_0_avalon_slave_0_end_xfer = ~(HexLED_0_avalon_slave_0_waits_for_read | HexLED_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_HexLED_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_HexLED_0_avalon_slave_0 = HexLED_0_avalon_slave_0_end_xfer & (~HexLED_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //HexLED_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign HexLED_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_HexLED_0_avalon_slave_0 & HexLED_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_HexLED_0_avalon_slave_0 & ~HexLED_0_avalon_slave_0_non_bursting_master_requests);

  //HexLED_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HexLED_0_avalon_slave_0_arb_share_counter <= 0;
      else if (HexLED_0_avalon_slave_0_arb_counter_enable)
          HexLED_0_avalon_slave_0_arb_share_counter <= HexLED_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //HexLED_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          HexLED_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|HexLED_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_HexLED_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_HexLED_0_avalon_slave_0 & ~HexLED_0_avalon_slave_0_non_bursting_master_requests))
          HexLED_0_avalon_slave_0_slavearbiterlockenable <= |HexLED_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster HexLED_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = HexLED_0_avalon_slave_0_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //HexLED_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign HexLED_0_avalon_slave_0_slavearbiterlockenable2 = |HexLED_0_avalon_slave_0_arb_share_counter_next_value;

  //tiger_top_0/dataMaster HexLED_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = HexLED_0_avalon_slave_0_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //HexLED_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign HexLED_0_avalon_slave_0_any_continuerequest = 1;

  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_assign
  assign tiger_top_0_dataMaster_continuerequest = 1;

  assign tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0 = tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0;
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0 = tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0 & tiger_top_0_dataMaster_read & ~HexLED_0_avalon_slave_0_waits_for_read;

  //HexLED_0_avalon_slave_0_writedata mux, which is an e_mux
  assign HexLED_0_avalon_slave_0_writedata = tiger_top_0_dataMaster_writedata;

  //master is always granted when requested
  assign tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0 = tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0;

  //tiger_top_0/dataMaster saved-grant HexLED_0/avalon_slave_0, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_HexLED_0_avalon_slave_0 = tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0;

  //allow new arb cycle for HexLED_0/avalon_slave_0, which is an e_assign
  assign HexLED_0_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign HexLED_0_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign HexLED_0_avalon_slave_0_master_qreq_vector = 1;

  //HexLED_0_avalon_slave_0_reset_n assignment, which is an e_assign
  assign HexLED_0_avalon_slave_0_reset_n = reset_n;

  //HexLED_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign HexLED_0_avalon_slave_0_firsttransfer = ~(HexLED_0_avalon_slave_0_slavearbiterlockenable & HexLED_0_avalon_slave_0_any_continuerequest);

  //HexLED_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign HexLED_0_avalon_slave_0_beginbursttransfer_internal = HexLED_0_avalon_slave_0_begins_xfer;

  //HexLED_0_avalon_slave_0_write assignment, which is an e_mux
  assign HexLED_0_avalon_slave_0_write = tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0 & tiger_top_0_dataMaster_write;

  assign shifted_address_to_HexLED_0_avalon_slave_0_from_tiger_top_0_dataMaster = tiger_top_0_dataMaster_address_to_slave;
  //d1_HexLED_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_HexLED_0_avalon_slave_0_end_xfer <= 1;
      else if (1)
          d1_HexLED_0_avalon_slave_0_end_xfer <= HexLED_0_avalon_slave_0_end_xfer;
    end


  //HexLED_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign HexLED_0_avalon_slave_0_waits_for_read = HexLED_0_avalon_slave_0_in_a_read_cycle & HexLED_0_avalon_slave_0_begins_xfer;

  //HexLED_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign HexLED_0_avalon_slave_0_in_a_read_cycle = tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0 & tiger_top_0_dataMaster_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = HexLED_0_avalon_slave_0_in_a_read_cycle;

  //HexLED_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign HexLED_0_avalon_slave_0_waits_for_write = HexLED_0_avalon_slave_0_in_a_write_cycle & HexLED_0_avalon_slave_0_begins_xfer;

  //HexLED_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign HexLED_0_avalon_slave_0_in_a_write_cycle = tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0 & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = HexLED_0_avalon_slave_0_in_a_write_cycle;

  assign wait_for_HexLED_0_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //HexLED_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RedLED_s1_arbitrator (
                              // inputs:
                               clk,
                               reset_n,
                               tiger_top_0_dataMaster_address_to_slave,
                               tiger_top_0_dataMaster_latency_counter,
                               tiger_top_0_dataMaster_read,
                               tiger_top_0_dataMaster_write,
                               tiger_top_0_dataMaster_writedata,

                              // outputs:
                               RedLED_s1_address,
                               RedLED_s1_chipselect,
                               RedLED_s1_reset_n,
                               RedLED_s1_write_n,
                               RedLED_s1_writedata,
                               d1_RedLED_s1_end_xfer,
                               tiger_top_0_dataMaster_granted_RedLED_s1,
                               tiger_top_0_dataMaster_qualified_request_RedLED_s1,
                               tiger_top_0_dataMaster_read_data_valid_RedLED_s1,
                               tiger_top_0_dataMaster_requests_RedLED_s1
                            )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [  1: 0] RedLED_s1_address;
  output           RedLED_s1_chipselect;
  output           RedLED_s1_reset_n;
  output           RedLED_s1_write_n;
  output  [ 17: 0] RedLED_s1_writedata;
  output           d1_RedLED_s1_end_xfer;
  output           tiger_top_0_dataMaster_granted_RedLED_s1;
  output           tiger_top_0_dataMaster_qualified_request_RedLED_s1;
  output           tiger_top_0_dataMaster_read_data_valid_RedLED_s1;
  output           tiger_top_0_dataMaster_requests_RedLED_s1;
  input            clk;
  input            reset_n;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_dataMaster_writedata;

  wire    [  1: 0] RedLED_s1_address;
  wire             RedLED_s1_allgrants;
  wire             RedLED_s1_allow_new_arb_cycle;
  wire             RedLED_s1_any_bursting_master_saved_grant;
  wire             RedLED_s1_any_continuerequest;
  wire             RedLED_s1_arb_counter_enable;
  reg     [  2: 0] RedLED_s1_arb_share_counter;
  wire    [  2: 0] RedLED_s1_arb_share_counter_next_value;
  wire    [  2: 0] RedLED_s1_arb_share_set_values;
  wire             RedLED_s1_beginbursttransfer_internal;
  wire             RedLED_s1_begins_xfer;
  wire             RedLED_s1_chipselect;
  wire             RedLED_s1_end_xfer;
  wire             RedLED_s1_firsttransfer;
  wire             RedLED_s1_grant_vector;
  wire             RedLED_s1_in_a_read_cycle;
  wire             RedLED_s1_in_a_write_cycle;
  wire             RedLED_s1_master_qreq_vector;
  wire             RedLED_s1_non_bursting_master_requests;
  wire             RedLED_s1_reset_n;
  reg              RedLED_s1_slavearbiterlockenable;
  wire             RedLED_s1_slavearbiterlockenable2;
  wire             RedLED_s1_waits_for_read;
  wire             RedLED_s1_waits_for_write;
  wire             RedLED_s1_write_n;
  wire    [ 17: 0] RedLED_s1_writedata;
  reg              d1_RedLED_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_RedLED_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 31: 0] shifted_address_to_RedLED_s1_from_tiger_top_0_dataMaster;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_RedLED_s1;
  wire             tiger_top_0_dataMaster_qualified_request_RedLED_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_RedLED_s1;
  wire             tiger_top_0_dataMaster_requests_RedLED_s1;
  wire             tiger_top_0_dataMaster_saved_grant_RedLED_s1;
  wire             wait_for_RedLED_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~RedLED_s1_end_xfer;
    end


  assign RedLED_s1_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_RedLED_s1));
  assign tiger_top_0_dataMaster_requests_RedLED_s1 = (({tiger_top_0_dataMaster_address_to_slave[31 : 4] , 4'b0} == 32'hf0000800) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)) & tiger_top_0_dataMaster_write;
  //RedLED_s1_arb_share_counter set values, which is an e_mux
  assign RedLED_s1_arb_share_set_values = 1;

  //RedLED_s1_non_bursting_master_requests mux, which is an e_mux
  assign RedLED_s1_non_bursting_master_requests = tiger_top_0_dataMaster_requests_RedLED_s1;

  //RedLED_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign RedLED_s1_any_bursting_master_saved_grant = 0;

  //RedLED_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign RedLED_s1_arb_share_counter_next_value = RedLED_s1_firsttransfer ? (RedLED_s1_arb_share_set_values - 1) : |RedLED_s1_arb_share_counter ? (RedLED_s1_arb_share_counter - 1) : 0;

  //RedLED_s1_allgrants all slave grants, which is an e_mux
  assign RedLED_s1_allgrants = |RedLED_s1_grant_vector;

  //RedLED_s1_end_xfer assignment, which is an e_assign
  assign RedLED_s1_end_xfer = ~(RedLED_s1_waits_for_read | RedLED_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_RedLED_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_RedLED_s1 = RedLED_s1_end_xfer & (~RedLED_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //RedLED_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign RedLED_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_RedLED_s1 & RedLED_s1_allgrants) | (end_xfer_arb_share_counter_term_RedLED_s1 & ~RedLED_s1_non_bursting_master_requests);

  //RedLED_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RedLED_s1_arb_share_counter <= 0;
      else if (RedLED_s1_arb_counter_enable)
          RedLED_s1_arb_share_counter <= RedLED_s1_arb_share_counter_next_value;
    end


  //RedLED_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RedLED_s1_slavearbiterlockenable <= 0;
      else if ((|RedLED_s1_master_qreq_vector & end_xfer_arb_share_counter_term_RedLED_s1) | (end_xfer_arb_share_counter_term_RedLED_s1 & ~RedLED_s1_non_bursting_master_requests))
          RedLED_s1_slavearbiterlockenable <= |RedLED_s1_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster RedLED/s1 arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = RedLED_s1_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //RedLED_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign RedLED_s1_slavearbiterlockenable2 = |RedLED_s1_arb_share_counter_next_value;

  //tiger_top_0/dataMaster RedLED/s1 arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = RedLED_s1_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //RedLED_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign RedLED_s1_any_continuerequest = 1;

  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_assign
  assign tiger_top_0_dataMaster_continuerequest = 1;

  assign tiger_top_0_dataMaster_qualified_request_RedLED_s1 = tiger_top_0_dataMaster_requests_RedLED_s1;
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_RedLED_s1, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_RedLED_s1 = tiger_top_0_dataMaster_granted_RedLED_s1 & tiger_top_0_dataMaster_read & ~RedLED_s1_waits_for_read;

  //RedLED_s1_writedata mux, which is an e_mux
  assign RedLED_s1_writedata = tiger_top_0_dataMaster_writedata;

  //master is always granted when requested
  assign tiger_top_0_dataMaster_granted_RedLED_s1 = tiger_top_0_dataMaster_qualified_request_RedLED_s1;

  //tiger_top_0/dataMaster saved-grant RedLED/s1, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_RedLED_s1 = tiger_top_0_dataMaster_requests_RedLED_s1;

  //allow new arb cycle for RedLED/s1, which is an e_assign
  assign RedLED_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign RedLED_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign RedLED_s1_master_qreq_vector = 1;

  //RedLED_s1_reset_n assignment, which is an e_assign
  assign RedLED_s1_reset_n = reset_n;

  assign RedLED_s1_chipselect = tiger_top_0_dataMaster_granted_RedLED_s1;
  //RedLED_s1_firsttransfer first transaction, which is an e_assign
  assign RedLED_s1_firsttransfer = ~(RedLED_s1_slavearbiterlockenable & RedLED_s1_any_continuerequest);

  //RedLED_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign RedLED_s1_beginbursttransfer_internal = RedLED_s1_begins_xfer;

  //~RedLED_s1_write_n assignment, which is an e_mux
  assign RedLED_s1_write_n = ~(tiger_top_0_dataMaster_granted_RedLED_s1 & tiger_top_0_dataMaster_write);

  assign shifted_address_to_RedLED_s1_from_tiger_top_0_dataMaster = tiger_top_0_dataMaster_address_to_slave;
  //RedLED_s1_address mux, which is an e_mux
  assign RedLED_s1_address = shifted_address_to_RedLED_s1_from_tiger_top_0_dataMaster >> 2;

  //d1_RedLED_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_RedLED_s1_end_xfer <= 1;
      else if (1)
          d1_RedLED_s1_end_xfer <= RedLED_s1_end_xfer;
    end


  //RedLED_s1_waits_for_read in a cycle, which is an e_mux
  assign RedLED_s1_waits_for_read = RedLED_s1_in_a_read_cycle & RedLED_s1_begins_xfer;

  //RedLED_s1_in_a_read_cycle assignment, which is an e_assign
  assign RedLED_s1_in_a_read_cycle = tiger_top_0_dataMaster_granted_RedLED_s1 & tiger_top_0_dataMaster_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = RedLED_s1_in_a_read_cycle;

  //RedLED_s1_waits_for_write in a cycle, which is an e_mux
  assign RedLED_s1_waits_for_write = RedLED_s1_in_a_write_cycle & 0;

  //RedLED_s1_in_a_write_cycle assignment, which is an e_assign
  assign RedLED_s1_in_a_write_cycle = tiger_top_0_dataMaster_granted_RedLED_s1 & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = RedLED_s1_in_a_write_cycle;

  assign wait_for_RedLED_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //RedLED/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module grid_0_avalon_slave_0_arbitrator (
                                          // inputs:
                                           clk,
                                           grid_0_avalon_slave_0_readdata,
                                           reset_n,
                                           tiger_top_0_dataMaster_address_to_slave,
                                           tiger_top_0_dataMaster_byteenable,
                                           tiger_top_0_dataMaster_dbs_address,
                                           tiger_top_0_dataMaster_dbs_write_8,
                                           tiger_top_0_dataMaster_latency_counter,
                                           tiger_top_0_dataMaster_read,
                                           tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register,
                                           tiger_top_0_dataMaster_write,

                                          // outputs:
                                           d1_grid_0_avalon_slave_0_end_xfer,
                                           grid_0_avalon_slave_0_address,
                                           grid_0_avalon_slave_0_readdata_from_sa,
                                           grid_0_avalon_slave_0_reset,
                                           grid_0_avalon_slave_0_write,
                                           grid_0_avalon_slave_0_writedata,
                                           tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0,
                                           tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0,
                                           tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0,
                                           tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0,
                                           tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0
                                        )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_grid_0_avalon_slave_0_end_xfer;
  output  [ 10: 0] grid_0_avalon_slave_0_address;
  output  [  7: 0] grid_0_avalon_slave_0_readdata_from_sa;
  output           grid_0_avalon_slave_0_reset;
  output           grid_0_avalon_slave_0_write;
  output  [  7: 0] grid_0_avalon_slave_0_writedata;
  output           tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0;
  input            clk;
  input   [  7: 0] grid_0_avalon_slave_0_readdata;
  input            reset_n;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input   [  3: 0] tiger_top_0_dataMaster_byteenable;
  input   [  1: 0] tiger_top_0_dataMaster_dbs_address;
  input   [  7: 0] tiger_top_0_dataMaster_dbs_write_8;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  input            tiger_top_0_dataMaster_write;

  reg              d1_grid_0_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_grid_0_avalon_slave_0;
  wire    [ 10: 0] grid_0_avalon_slave_0_address;
  wire             grid_0_avalon_slave_0_allgrants;
  wire             grid_0_avalon_slave_0_allow_new_arb_cycle;
  wire             grid_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             grid_0_avalon_slave_0_any_continuerequest;
  wire             grid_0_avalon_slave_0_arb_counter_enable;
  reg     [  2: 0] grid_0_avalon_slave_0_arb_share_counter;
  wire    [  2: 0] grid_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  2: 0] grid_0_avalon_slave_0_arb_share_set_values;
  wire             grid_0_avalon_slave_0_beginbursttransfer_internal;
  wire             grid_0_avalon_slave_0_begins_xfer;
  wire             grid_0_avalon_slave_0_end_xfer;
  wire             grid_0_avalon_slave_0_firsttransfer;
  wire             grid_0_avalon_slave_0_grant_vector;
  wire             grid_0_avalon_slave_0_in_a_read_cycle;
  wire             grid_0_avalon_slave_0_in_a_write_cycle;
  wire             grid_0_avalon_slave_0_master_qreq_vector;
  wire             grid_0_avalon_slave_0_non_bursting_master_requests;
  wire             grid_0_avalon_slave_0_pretend_byte_enable;
  wire    [  7: 0] grid_0_avalon_slave_0_readdata_from_sa;
  wire             grid_0_avalon_slave_0_reset;
  reg              grid_0_avalon_slave_0_slavearbiterlockenable;
  wire             grid_0_avalon_slave_0_slavearbiterlockenable2;
  wire             grid_0_avalon_slave_0_waits_for_read;
  wire             grid_0_avalon_slave_0_waits_for_write;
  wire             grid_0_avalon_slave_0_write;
  wire    [  7: 0] grid_0_avalon_slave_0_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_0;
  wire             tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_1;
  wire             tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_2;
  wire             tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_3;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_saved_grant_grid_0_avalon_slave_0;
  wire             wait_for_grid_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~grid_0_avalon_slave_0_end_xfer;
    end


  assign grid_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0));
  //assign grid_0_avalon_slave_0_readdata_from_sa = grid_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign grid_0_avalon_slave_0_readdata_from_sa = grid_0_avalon_slave_0_readdata;

  assign tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0 = ({tiger_top_0_dataMaster_address_to_slave[31 : 11] , 11'b0} == 32'hf0000000) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write);
  //grid_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign grid_0_avalon_slave_0_arb_share_set_values = (tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0)? 4 :
    1;

  //grid_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign grid_0_avalon_slave_0_non_bursting_master_requests = tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0;

  //grid_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign grid_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //grid_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign grid_0_avalon_slave_0_arb_share_counter_next_value = grid_0_avalon_slave_0_firsttransfer ? (grid_0_avalon_slave_0_arb_share_set_values - 1) : |grid_0_avalon_slave_0_arb_share_counter ? (grid_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //grid_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign grid_0_avalon_slave_0_allgrants = |grid_0_avalon_slave_0_grant_vector;

  //grid_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign grid_0_avalon_slave_0_end_xfer = ~(grid_0_avalon_slave_0_waits_for_read | grid_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_grid_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_grid_0_avalon_slave_0 = grid_0_avalon_slave_0_end_xfer & (~grid_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //grid_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign grid_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_grid_0_avalon_slave_0 & grid_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_grid_0_avalon_slave_0 & ~grid_0_avalon_slave_0_non_bursting_master_requests);

  //grid_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          grid_0_avalon_slave_0_arb_share_counter <= 0;
      else if (grid_0_avalon_slave_0_arb_counter_enable)
          grid_0_avalon_slave_0_arb_share_counter <= grid_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //grid_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          grid_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|grid_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_grid_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_grid_0_avalon_slave_0 & ~grid_0_avalon_slave_0_non_bursting_master_requests))
          grid_0_avalon_slave_0_slavearbiterlockenable <= |grid_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster grid_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = grid_0_avalon_slave_0_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //grid_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign grid_0_avalon_slave_0_slavearbiterlockenable2 = |grid_0_avalon_slave_0_arb_share_counter_next_value;

  //tiger_top_0/dataMaster grid_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = grid_0_avalon_slave_0_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //grid_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign grid_0_avalon_slave_0_any_continuerequest = 1;

  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_assign
  assign tiger_top_0_dataMaster_continuerequest = 1;

  assign tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0 = tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0 & ~((tiger_top_0_dataMaster_read & ((tiger_top_0_dataMaster_latency_counter != 0) | (|tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register))) | ((!tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0) & tiger_top_0_dataMaster_write));
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0 = tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_read & ~grid_0_avalon_slave_0_waits_for_read;

  //grid_0_avalon_slave_0_writedata mux, which is an e_mux
  assign grid_0_avalon_slave_0_writedata = tiger_top_0_dataMaster_dbs_write_8;

  //master is always granted when requested
  assign tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0 = tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0;

  //tiger_top_0/dataMaster saved-grant grid_0/avalon_slave_0, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_grid_0_avalon_slave_0 = tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0;

  //allow new arb cycle for grid_0/avalon_slave_0, which is an e_assign
  assign grid_0_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign grid_0_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign grid_0_avalon_slave_0_master_qreq_vector = 1;

  //~grid_0_avalon_slave_0_reset assignment, which is an e_assign
  assign grid_0_avalon_slave_0_reset = ~reset_n;

  //grid_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign grid_0_avalon_slave_0_firsttransfer = ~(grid_0_avalon_slave_0_slavearbiterlockenable & grid_0_avalon_slave_0_any_continuerequest);

  //grid_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign grid_0_avalon_slave_0_beginbursttransfer_internal = grid_0_avalon_slave_0_begins_xfer;

  //grid_0_avalon_slave_0_write assignment, which is an e_mux
  assign grid_0_avalon_slave_0_write = ((tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_write)) & grid_0_avalon_slave_0_pretend_byte_enable;

  //grid_0_avalon_slave_0_address mux, which is an e_mux
  assign grid_0_avalon_slave_0_address = {tiger_top_0_dataMaster_address_to_slave >> 2,
    tiger_top_0_dataMaster_dbs_address[1 : 0]};

  //d1_grid_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_grid_0_avalon_slave_0_end_xfer <= 1;
      else if (1)
          d1_grid_0_avalon_slave_0_end_xfer <= grid_0_avalon_slave_0_end_xfer;
    end


  //grid_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign grid_0_avalon_slave_0_waits_for_read = grid_0_avalon_slave_0_in_a_read_cycle & grid_0_avalon_slave_0_begins_xfer;

  //grid_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign grid_0_avalon_slave_0_in_a_read_cycle = tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = grid_0_avalon_slave_0_in_a_read_cycle;

  //grid_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign grid_0_avalon_slave_0_waits_for_write = grid_0_avalon_slave_0_in_a_write_cycle & grid_0_avalon_slave_0_begins_xfer;

  //grid_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign grid_0_avalon_slave_0_in_a_write_cycle = tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = grid_0_avalon_slave_0_in_a_write_cycle;

  assign wait_for_grid_0_avalon_slave_0_counter = 0;
  //grid_0_avalon_slave_0_pretend_byte_enable byte enable port mux, which is an e_mux
  assign grid_0_avalon_slave_0_pretend_byte_enable = (tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0)? tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0 :
    -1;

  assign {tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_3,
tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_2,
tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_1,
tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_0} = tiger_top_0_dataMaster_byteenable;
  assign tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0 = ((tiger_top_0_dataMaster_dbs_address[1 : 0] == 0))? tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_0 :
    ((tiger_top_0_dataMaster_dbs_address[1 : 0] == 1))? tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_1 :
    ((tiger_top_0_dataMaster_dbs_address[1 : 0] == 2))? tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_2 :
    tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //grid_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_controlSlave_arbitrator (
                                           // inputs:
                                            clk,
                                            jtag_uart_controlSlave_readdata,
                                            reset_n,
                                            tiger_top_0_dataMaster_address_to_slave,
                                            tiger_top_0_dataMaster_latency_counter,
                                            tiger_top_0_dataMaster_read,
                                            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register,
                                            tiger_top_0_dataMaster_write,
                                            tiger_top_0_dataMaster_writedata,

                                           // outputs:
                                            d1_jtag_uart_controlSlave_end_xfer,
                                            jtag_uart_controlSlave_address,
                                            jtag_uart_controlSlave_read,
                                            jtag_uart_controlSlave_readdata_from_sa,
                                            jtag_uart_controlSlave_reset_n,
                                            jtag_uart_controlSlave_write,
                                            jtag_uart_controlSlave_writedata,
                                            tiger_top_0_dataMaster_granted_jtag_uart_controlSlave,
                                            tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave,
                                            tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave,
                                            tiger_top_0_dataMaster_requests_jtag_uart_controlSlave
                                         )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_jtag_uart_controlSlave_end_xfer;
  output           jtag_uart_controlSlave_address;
  output           jtag_uart_controlSlave_read;
  output  [ 31: 0] jtag_uart_controlSlave_readdata_from_sa;
  output           jtag_uart_controlSlave_reset_n;
  output           jtag_uart_controlSlave_write;
  output  [ 31: 0] jtag_uart_controlSlave_writedata;
  output           tiger_top_0_dataMaster_granted_jtag_uart_controlSlave;
  output           tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave;
  output           tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave;
  output           tiger_top_0_dataMaster_requests_jtag_uart_controlSlave;
  input            clk;
  input   [ 31: 0] jtag_uart_controlSlave_readdata;
  input            reset_n;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_dataMaster_writedata;

  reg              d1_jtag_uart_controlSlave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_controlSlave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_controlSlave_address;
  wire             jtag_uart_controlSlave_allgrants;
  wire             jtag_uart_controlSlave_allow_new_arb_cycle;
  wire             jtag_uart_controlSlave_any_bursting_master_saved_grant;
  wire             jtag_uart_controlSlave_any_continuerequest;
  wire             jtag_uart_controlSlave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_controlSlave_arb_share_counter;
  wire    [  2: 0] jtag_uart_controlSlave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_controlSlave_arb_share_set_values;
  wire             jtag_uart_controlSlave_beginbursttransfer_internal;
  wire             jtag_uart_controlSlave_begins_xfer;
  wire             jtag_uart_controlSlave_end_xfer;
  wire             jtag_uart_controlSlave_firsttransfer;
  wire             jtag_uart_controlSlave_grant_vector;
  wire             jtag_uart_controlSlave_in_a_read_cycle;
  wire             jtag_uart_controlSlave_in_a_write_cycle;
  wire             jtag_uart_controlSlave_master_qreq_vector;
  wire             jtag_uart_controlSlave_non_bursting_master_requests;
  wire             jtag_uart_controlSlave_read;
  wire    [ 31: 0] jtag_uart_controlSlave_readdata_from_sa;
  wire             jtag_uart_controlSlave_reset_n;
  reg              jtag_uart_controlSlave_slavearbiterlockenable;
  wire             jtag_uart_controlSlave_slavearbiterlockenable2;
  wire             jtag_uart_controlSlave_waits_for_read;
  wire             jtag_uart_controlSlave_waits_for_write;
  wire             jtag_uart_controlSlave_write;
  wire    [ 31: 0] jtag_uart_controlSlave_writedata;
  wire    [ 31: 0] shifted_address_to_jtag_uart_controlSlave_from_tiger_top_0_dataMaster;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_jtag_uart_controlSlave;
  wire             tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave;
  wire             tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave;
  wire             tiger_top_0_dataMaster_requests_jtag_uart_controlSlave;
  wire             tiger_top_0_dataMaster_saved_grant_jtag_uart_controlSlave;
  wire             wait_for_jtag_uart_controlSlave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~jtag_uart_controlSlave_end_xfer;
    end


  assign jtag_uart_controlSlave_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave));
  //assign jtag_uart_controlSlave_readdata_from_sa = jtag_uart_controlSlave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_controlSlave_readdata_from_sa = jtag_uart_controlSlave_readdata;

  assign tiger_top_0_dataMaster_requests_jtag_uart_controlSlave = ({tiger_top_0_dataMaster_address_to_slave[31 : 3] , 3'b0} == 32'hf0000840) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write);
  //jtag_uart_controlSlave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_controlSlave_arb_share_set_values = 1;

  //jtag_uart_controlSlave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_controlSlave_non_bursting_master_requests = tiger_top_0_dataMaster_requests_jtag_uart_controlSlave;

  //jtag_uart_controlSlave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_controlSlave_any_bursting_master_saved_grant = 0;

  //jtag_uart_controlSlave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_controlSlave_arb_share_counter_next_value = jtag_uart_controlSlave_firsttransfer ? (jtag_uart_controlSlave_arb_share_set_values - 1) : |jtag_uart_controlSlave_arb_share_counter ? (jtag_uart_controlSlave_arb_share_counter - 1) : 0;

  //jtag_uart_controlSlave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_controlSlave_allgrants = |jtag_uart_controlSlave_grant_vector;

  //jtag_uart_controlSlave_end_xfer assignment, which is an e_assign
  assign jtag_uart_controlSlave_end_xfer = ~(jtag_uart_controlSlave_waits_for_read | jtag_uart_controlSlave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_controlSlave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_controlSlave = jtag_uart_controlSlave_end_xfer & (~jtag_uart_controlSlave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_controlSlave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_controlSlave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_controlSlave & jtag_uart_controlSlave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_controlSlave & ~jtag_uart_controlSlave_non_bursting_master_requests);

  //jtag_uart_controlSlave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_controlSlave_arb_share_counter <= 0;
      else if (jtag_uart_controlSlave_arb_counter_enable)
          jtag_uart_controlSlave_arb_share_counter <= jtag_uart_controlSlave_arb_share_counter_next_value;
    end


  //jtag_uart_controlSlave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_controlSlave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_controlSlave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_controlSlave) | (end_xfer_arb_share_counter_term_jtag_uart_controlSlave & ~jtag_uart_controlSlave_non_bursting_master_requests))
          jtag_uart_controlSlave_slavearbiterlockenable <= |jtag_uart_controlSlave_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster jtag_uart/controlSlave arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = jtag_uart_controlSlave_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //jtag_uart_controlSlave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_controlSlave_slavearbiterlockenable2 = |jtag_uart_controlSlave_arb_share_counter_next_value;

  //tiger_top_0/dataMaster jtag_uart/controlSlave arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = jtag_uart_controlSlave_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //jtag_uart_controlSlave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_controlSlave_any_continuerequest = 1;

  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_assign
  assign tiger_top_0_dataMaster_continuerequest = 1;

  assign tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave = tiger_top_0_dataMaster_requests_jtag_uart_controlSlave & ~((tiger_top_0_dataMaster_read & ((tiger_top_0_dataMaster_latency_counter != 0) | (|tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave = tiger_top_0_dataMaster_granted_jtag_uart_controlSlave & tiger_top_0_dataMaster_read & ~jtag_uart_controlSlave_waits_for_read;

  //jtag_uart_controlSlave_writedata mux, which is an e_mux
  assign jtag_uart_controlSlave_writedata = tiger_top_0_dataMaster_writedata;

  //master is always granted when requested
  assign tiger_top_0_dataMaster_granted_jtag_uart_controlSlave = tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave;

  //tiger_top_0/dataMaster saved-grant jtag_uart/controlSlave, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_jtag_uart_controlSlave = tiger_top_0_dataMaster_requests_jtag_uart_controlSlave;

  //allow new arb cycle for jtag_uart/controlSlave, which is an e_assign
  assign jtag_uart_controlSlave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_controlSlave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_controlSlave_master_qreq_vector = 1;

  //jtag_uart_controlSlave_reset_n assignment, which is an e_assign
  assign jtag_uart_controlSlave_reset_n = reset_n;

  //jtag_uart_controlSlave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_controlSlave_firsttransfer = ~(jtag_uart_controlSlave_slavearbiterlockenable & jtag_uart_controlSlave_any_continuerequest);

  //jtag_uart_controlSlave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_controlSlave_beginbursttransfer_internal = jtag_uart_controlSlave_begins_xfer;

  //jtag_uart_controlSlave_read assignment, which is an e_mux
  assign jtag_uart_controlSlave_read = tiger_top_0_dataMaster_granted_jtag_uart_controlSlave & tiger_top_0_dataMaster_read;

  //jtag_uart_controlSlave_write assignment, which is an e_mux
  assign jtag_uart_controlSlave_write = tiger_top_0_dataMaster_granted_jtag_uart_controlSlave & tiger_top_0_dataMaster_write;

  assign shifted_address_to_jtag_uart_controlSlave_from_tiger_top_0_dataMaster = tiger_top_0_dataMaster_address_to_slave;
  //jtag_uart_controlSlave_address mux, which is an e_mux
  assign jtag_uart_controlSlave_address = shifted_address_to_jtag_uart_controlSlave_from_tiger_top_0_dataMaster >> 2;

  //d1_jtag_uart_controlSlave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_controlSlave_end_xfer <= 1;
      else if (1)
          d1_jtag_uart_controlSlave_end_xfer <= jtag_uart_controlSlave_end_xfer;
    end


  //jtag_uart_controlSlave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_controlSlave_waits_for_read = jtag_uart_controlSlave_in_a_read_cycle & 0;

  //jtag_uart_controlSlave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_controlSlave_in_a_read_cycle = tiger_top_0_dataMaster_granted_jtag_uart_controlSlave & tiger_top_0_dataMaster_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_controlSlave_in_a_read_cycle;

  //jtag_uart_controlSlave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_controlSlave_waits_for_write = jtag_uart_controlSlave_in_a_write_cycle & 0;

  //jtag_uart_controlSlave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_controlSlave_in_a_write_cycle = tiger_top_0_dataMaster_granted_jtag_uart_controlSlave & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_controlSlave_in_a_write_cycle;

  assign wait_for_jtag_uart_controlSlave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/controlSlave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_1_controlSlave_arbitrator (
                                             // inputs:
                                              clk,
                                              jtag_uart_1_controlSlave_readdata,
                                              reset_n,
                                              tiger_top_0_dataMaster_address_to_slave,
                                              tiger_top_0_dataMaster_latency_counter,
                                              tiger_top_0_dataMaster_read,
                                              tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register,
                                              tiger_top_0_dataMaster_write,
                                              tiger_top_0_dataMaster_writedata,

                                             // outputs:
                                              d1_jtag_uart_1_controlSlave_end_xfer,
                                              jtag_uart_1_controlSlave_address,
                                              jtag_uart_1_controlSlave_read,
                                              jtag_uart_1_controlSlave_readdata_from_sa,
                                              jtag_uart_1_controlSlave_reset_n,
                                              jtag_uart_1_controlSlave_write,
                                              jtag_uart_1_controlSlave_writedata,
                                              tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave,
                                              tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave,
                                              tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave,
                                              tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave
                                           )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_jtag_uart_1_controlSlave_end_xfer;
  output           jtag_uart_1_controlSlave_address;
  output           jtag_uart_1_controlSlave_read;
  output  [ 31: 0] jtag_uart_1_controlSlave_readdata_from_sa;
  output           jtag_uart_1_controlSlave_reset_n;
  output           jtag_uart_1_controlSlave_write;
  output  [ 31: 0] jtag_uart_1_controlSlave_writedata;
  output           tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave;
  output           tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave;
  output           tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave;
  output           tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave;
  input            clk;
  input   [ 31: 0] jtag_uart_1_controlSlave_readdata;
  input            reset_n;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_dataMaster_writedata;

  reg              d1_jtag_uart_1_controlSlave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_1_controlSlave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_1_controlSlave_address;
  wire             jtag_uart_1_controlSlave_allgrants;
  wire             jtag_uart_1_controlSlave_allow_new_arb_cycle;
  wire             jtag_uart_1_controlSlave_any_bursting_master_saved_grant;
  wire             jtag_uart_1_controlSlave_any_continuerequest;
  wire             jtag_uart_1_controlSlave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_1_controlSlave_arb_share_counter;
  wire    [  2: 0] jtag_uart_1_controlSlave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_1_controlSlave_arb_share_set_values;
  wire             jtag_uart_1_controlSlave_beginbursttransfer_internal;
  wire             jtag_uart_1_controlSlave_begins_xfer;
  wire             jtag_uart_1_controlSlave_end_xfer;
  wire             jtag_uart_1_controlSlave_firsttransfer;
  wire             jtag_uart_1_controlSlave_grant_vector;
  wire             jtag_uart_1_controlSlave_in_a_read_cycle;
  wire             jtag_uart_1_controlSlave_in_a_write_cycle;
  wire             jtag_uart_1_controlSlave_master_qreq_vector;
  wire             jtag_uart_1_controlSlave_non_bursting_master_requests;
  wire             jtag_uart_1_controlSlave_read;
  wire    [ 31: 0] jtag_uart_1_controlSlave_readdata_from_sa;
  wire             jtag_uart_1_controlSlave_reset_n;
  reg              jtag_uart_1_controlSlave_slavearbiterlockenable;
  wire             jtag_uart_1_controlSlave_slavearbiterlockenable2;
  wire             jtag_uart_1_controlSlave_waits_for_read;
  wire             jtag_uart_1_controlSlave_waits_for_write;
  wire             jtag_uart_1_controlSlave_write;
  wire    [ 31: 0] jtag_uart_1_controlSlave_writedata;
  wire    [ 31: 0] shifted_address_to_jtag_uart_1_controlSlave_from_tiger_top_0_dataMaster;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave;
  wire             tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave;
  wire             tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave;
  wire             tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave;
  wire             tiger_top_0_dataMaster_saved_grant_jtag_uart_1_controlSlave;
  wire             wait_for_jtag_uart_1_controlSlave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~jtag_uart_1_controlSlave_end_xfer;
    end


  assign jtag_uart_1_controlSlave_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave));
  //assign jtag_uart_1_controlSlave_readdata_from_sa = jtag_uart_1_controlSlave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_1_controlSlave_readdata_from_sa = jtag_uart_1_controlSlave_readdata;

  assign tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave = ({tiger_top_0_dataMaster_address_to_slave[31 : 3] , 3'b0} == 32'hf0000850) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write);
  //jtag_uart_1_controlSlave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_1_controlSlave_arb_share_set_values = 1;

  //jtag_uart_1_controlSlave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_1_controlSlave_non_bursting_master_requests = tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave;

  //jtag_uart_1_controlSlave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_1_controlSlave_any_bursting_master_saved_grant = 0;

  //jtag_uart_1_controlSlave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_1_controlSlave_arb_share_counter_next_value = jtag_uart_1_controlSlave_firsttransfer ? (jtag_uart_1_controlSlave_arb_share_set_values - 1) : |jtag_uart_1_controlSlave_arb_share_counter ? (jtag_uart_1_controlSlave_arb_share_counter - 1) : 0;

  //jtag_uart_1_controlSlave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_1_controlSlave_allgrants = |jtag_uart_1_controlSlave_grant_vector;

  //jtag_uart_1_controlSlave_end_xfer assignment, which is an e_assign
  assign jtag_uart_1_controlSlave_end_xfer = ~(jtag_uart_1_controlSlave_waits_for_read | jtag_uart_1_controlSlave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_1_controlSlave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_1_controlSlave = jtag_uart_1_controlSlave_end_xfer & (~jtag_uart_1_controlSlave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_1_controlSlave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_1_controlSlave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_1_controlSlave & jtag_uart_1_controlSlave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_1_controlSlave & ~jtag_uart_1_controlSlave_non_bursting_master_requests);

  //jtag_uart_1_controlSlave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_1_controlSlave_arb_share_counter <= 0;
      else if (jtag_uart_1_controlSlave_arb_counter_enable)
          jtag_uart_1_controlSlave_arb_share_counter <= jtag_uart_1_controlSlave_arb_share_counter_next_value;
    end


  //jtag_uart_1_controlSlave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_1_controlSlave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_1_controlSlave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_1_controlSlave) | (end_xfer_arb_share_counter_term_jtag_uart_1_controlSlave & ~jtag_uart_1_controlSlave_non_bursting_master_requests))
          jtag_uart_1_controlSlave_slavearbiterlockenable <= |jtag_uart_1_controlSlave_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster jtag_uart_1/controlSlave arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = jtag_uart_1_controlSlave_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //jtag_uart_1_controlSlave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_1_controlSlave_slavearbiterlockenable2 = |jtag_uart_1_controlSlave_arb_share_counter_next_value;

  //tiger_top_0/dataMaster jtag_uart_1/controlSlave arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = jtag_uart_1_controlSlave_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //jtag_uart_1_controlSlave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_1_controlSlave_any_continuerequest = 1;

  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_assign
  assign tiger_top_0_dataMaster_continuerequest = 1;

  assign tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave = tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave & ~((tiger_top_0_dataMaster_read & ((tiger_top_0_dataMaster_latency_counter != 0) | (|tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave = tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave & tiger_top_0_dataMaster_read & ~jtag_uart_1_controlSlave_waits_for_read;

  //jtag_uart_1_controlSlave_writedata mux, which is an e_mux
  assign jtag_uart_1_controlSlave_writedata = tiger_top_0_dataMaster_writedata;

  //master is always granted when requested
  assign tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave = tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave;

  //tiger_top_0/dataMaster saved-grant jtag_uart_1/controlSlave, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_jtag_uart_1_controlSlave = tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave;

  //allow new arb cycle for jtag_uart_1/controlSlave, which is an e_assign
  assign jtag_uart_1_controlSlave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_1_controlSlave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_1_controlSlave_master_qreq_vector = 1;

  //jtag_uart_1_controlSlave_reset_n assignment, which is an e_assign
  assign jtag_uart_1_controlSlave_reset_n = reset_n;

  //jtag_uart_1_controlSlave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_1_controlSlave_firsttransfer = ~(jtag_uart_1_controlSlave_slavearbiterlockenable & jtag_uart_1_controlSlave_any_continuerequest);

  //jtag_uart_1_controlSlave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_1_controlSlave_beginbursttransfer_internal = jtag_uart_1_controlSlave_begins_xfer;

  //jtag_uart_1_controlSlave_read assignment, which is an e_mux
  assign jtag_uart_1_controlSlave_read = tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave & tiger_top_0_dataMaster_read;

  //jtag_uart_1_controlSlave_write assignment, which is an e_mux
  assign jtag_uart_1_controlSlave_write = tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave & tiger_top_0_dataMaster_write;

  assign shifted_address_to_jtag_uart_1_controlSlave_from_tiger_top_0_dataMaster = tiger_top_0_dataMaster_address_to_slave;
  //jtag_uart_1_controlSlave_address mux, which is an e_mux
  assign jtag_uart_1_controlSlave_address = shifted_address_to_jtag_uart_1_controlSlave_from_tiger_top_0_dataMaster >> 2;

  //d1_jtag_uart_1_controlSlave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_1_controlSlave_end_xfer <= 1;
      else if (1)
          d1_jtag_uart_1_controlSlave_end_xfer <= jtag_uart_1_controlSlave_end_xfer;
    end


  //jtag_uart_1_controlSlave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_1_controlSlave_waits_for_read = jtag_uart_1_controlSlave_in_a_read_cycle & 0;

  //jtag_uart_1_controlSlave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_1_controlSlave_in_a_read_cycle = tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave & tiger_top_0_dataMaster_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_1_controlSlave_in_a_read_cycle;

  //jtag_uart_1_controlSlave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_1_controlSlave_waits_for_write = jtag_uart_1_controlSlave_in_a_write_cycle & 0;

  //jtag_uart_1_controlSlave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_1_controlSlave_in_a_write_cycle = tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_1_controlSlave_in_a_write_cycle;

  assign wait_for_jtag_uart_1_controlSlave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_1/controlSlave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_mem_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   onchip_mem_s1_readdata,
                                   reset_n,
                                   tiger_top_0_dataMaster_address_to_slave,
                                   tiger_top_0_dataMaster_byteenable,
                                   tiger_top_0_dataMaster_latency_counter,
                                   tiger_top_0_dataMaster_read,
                                   tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register,
                                   tiger_top_0_dataMaster_write,
                                   tiger_top_0_dataMaster_writedata,
                                   tiger_top_0_instructionMaster_address_to_slave,
                                   tiger_top_0_instructionMaster_latency_counter,
                                   tiger_top_0_instructionMaster_read,
                                   tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register,

                                  // outputs:
                                   d1_onchip_mem_s1_end_xfer,
                                   onchip_mem_s1_address,
                                   onchip_mem_s1_byteenable,
                                   onchip_mem_s1_chipselect,
                                   onchip_mem_s1_clken,
                                   onchip_mem_s1_readdata_from_sa,
                                   onchip_mem_s1_write,
                                   onchip_mem_s1_writedata,
                                   tiger_top_0_dataMaster_granted_onchip_mem_s1,
                                   tiger_top_0_dataMaster_qualified_request_onchip_mem_s1,
                                   tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1,
                                   tiger_top_0_dataMaster_requests_onchip_mem_s1,
                                   tiger_top_0_instructionMaster_granted_onchip_mem_s1,
                                   tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1,
                                   tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1,
                                   tiger_top_0_instructionMaster_requests_onchip_mem_s1
                                )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_onchip_mem_s1_end_xfer;
  output  [  9: 0] onchip_mem_s1_address;
  output  [  3: 0] onchip_mem_s1_byteenable;
  output           onchip_mem_s1_chipselect;
  output           onchip_mem_s1_clken;
  output  [ 31: 0] onchip_mem_s1_readdata_from_sa;
  output           onchip_mem_s1_write;
  output  [ 31: 0] onchip_mem_s1_writedata;
  output           tiger_top_0_dataMaster_granted_onchip_mem_s1;
  output           tiger_top_0_dataMaster_qualified_request_onchip_mem_s1;
  output           tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1;
  output           tiger_top_0_dataMaster_requests_onchip_mem_s1;
  output           tiger_top_0_instructionMaster_granted_onchip_mem_s1;
  output           tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1;
  output           tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1;
  output           tiger_top_0_instructionMaster_requests_onchip_mem_s1;
  input            clk;
  input   [ 31: 0] onchip_mem_s1_readdata;
  input            reset_n;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input   [  3: 0] tiger_top_0_dataMaster_byteenable;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_dataMaster_writedata;
  input   [ 31: 0] tiger_top_0_instructionMaster_address_to_slave;
  input            tiger_top_0_instructionMaster_latency_counter;
  input            tiger_top_0_instructionMaster_read;
  input            tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register;

  reg              d1_onchip_mem_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_mem_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_tiger_top_0_dataMaster_granted_slave_onchip_mem_s1;
  reg              last_cycle_tiger_top_0_instructionMaster_granted_slave_onchip_mem_s1;
  wire    [  9: 0] onchip_mem_s1_address;
  wire             onchip_mem_s1_allgrants;
  wire             onchip_mem_s1_allow_new_arb_cycle;
  wire             onchip_mem_s1_any_bursting_master_saved_grant;
  wire             onchip_mem_s1_any_continuerequest;
  reg     [  1: 0] onchip_mem_s1_arb_addend;
  wire             onchip_mem_s1_arb_counter_enable;
  reg     [  2: 0] onchip_mem_s1_arb_share_counter;
  wire    [  2: 0] onchip_mem_s1_arb_share_counter_next_value;
  wire    [  2: 0] onchip_mem_s1_arb_share_set_values;
  wire    [  1: 0] onchip_mem_s1_arb_winner;
  wire             onchip_mem_s1_arbitration_holdoff_internal;
  wire             onchip_mem_s1_beginbursttransfer_internal;
  wire             onchip_mem_s1_begins_xfer;
  wire    [  3: 0] onchip_mem_s1_byteenable;
  wire             onchip_mem_s1_chipselect;
  wire    [  3: 0] onchip_mem_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_mem_s1_chosen_master_rot_left;
  wire             onchip_mem_s1_clken;
  wire             onchip_mem_s1_end_xfer;
  wire             onchip_mem_s1_firsttransfer;
  wire    [  1: 0] onchip_mem_s1_grant_vector;
  wire             onchip_mem_s1_in_a_read_cycle;
  wire             onchip_mem_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_mem_s1_master_qreq_vector;
  wire             onchip_mem_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_mem_s1_readdata_from_sa;
  reg     [  1: 0] onchip_mem_s1_saved_chosen_master_vector;
  reg              onchip_mem_s1_slavearbiterlockenable;
  wire             onchip_mem_s1_slavearbiterlockenable2;
  wire             onchip_mem_s1_waits_for_read;
  wire             onchip_mem_s1_waits_for_write;
  wire             onchip_mem_s1_write;
  wire    [ 31: 0] onchip_mem_s1_writedata;
  wire             p1_tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register;
  wire             p1_tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register;
  wire    [ 31: 0] shifted_address_to_onchip_mem_s1_from_tiger_top_0_dataMaster;
  wire    [ 31: 0] shifted_address_to_onchip_mem_s1_from_tiger_top_0_instructionMaster;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_onchip_mem_s1;
  wire             tiger_top_0_dataMaster_qualified_request_onchip_mem_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1;
  reg              tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register;
  wire             tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register_in;
  wire             tiger_top_0_dataMaster_requests_onchip_mem_s1;
  wire             tiger_top_0_dataMaster_saved_grant_onchip_mem_s1;
  wire             tiger_top_0_instructionMaster_arbiterlock;
  wire             tiger_top_0_instructionMaster_arbiterlock2;
  wire             tiger_top_0_instructionMaster_continuerequest;
  wire             tiger_top_0_instructionMaster_granted_onchip_mem_s1;
  wire             tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1;
  wire             tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1;
  reg              tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register;
  wire             tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register_in;
  wire             tiger_top_0_instructionMaster_requests_onchip_mem_s1;
  wire             tiger_top_0_instructionMaster_saved_grant_onchip_mem_s1;
  wire             wait_for_onchip_mem_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~onchip_mem_s1_end_xfer;
    end


  assign onchip_mem_s1_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_onchip_mem_s1 | tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1));
  //assign onchip_mem_s1_readdata_from_sa = onchip_mem_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_mem_s1_readdata_from_sa = onchip_mem_s1_readdata;

  assign tiger_top_0_dataMaster_requests_onchip_mem_s1 = ({tiger_top_0_dataMaster_address_to_slave[31 : 12] , 12'b0} == 32'h0) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write);
  //onchip_mem_s1_arb_share_counter set values, which is an e_mux
  assign onchip_mem_s1_arb_share_set_values = 1;

  //onchip_mem_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_mem_s1_non_bursting_master_requests = tiger_top_0_dataMaster_requests_onchip_mem_s1 |
    tiger_top_0_instructionMaster_requests_onchip_mem_s1 |
    tiger_top_0_dataMaster_requests_onchip_mem_s1 |
    tiger_top_0_instructionMaster_requests_onchip_mem_s1;

  //onchip_mem_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_mem_s1_any_bursting_master_saved_grant = 0;

  //onchip_mem_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_mem_s1_arb_share_counter_next_value = onchip_mem_s1_firsttransfer ? (onchip_mem_s1_arb_share_set_values - 1) : |onchip_mem_s1_arb_share_counter ? (onchip_mem_s1_arb_share_counter - 1) : 0;

  //onchip_mem_s1_allgrants all slave grants, which is an e_mux
  assign onchip_mem_s1_allgrants = |onchip_mem_s1_grant_vector |
    |onchip_mem_s1_grant_vector |
    |onchip_mem_s1_grant_vector |
    |onchip_mem_s1_grant_vector;

  //onchip_mem_s1_end_xfer assignment, which is an e_assign
  assign onchip_mem_s1_end_xfer = ~(onchip_mem_s1_waits_for_read | onchip_mem_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_mem_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_mem_s1 = onchip_mem_s1_end_xfer & (~onchip_mem_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_mem_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_mem_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_mem_s1 & onchip_mem_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_mem_s1 & ~onchip_mem_s1_non_bursting_master_requests);

  //onchip_mem_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_arb_share_counter <= 0;
      else if (onchip_mem_s1_arb_counter_enable)
          onchip_mem_s1_arb_share_counter <= onchip_mem_s1_arb_share_counter_next_value;
    end


  //onchip_mem_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_mem_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_mem_s1) | (end_xfer_arb_share_counter_term_onchip_mem_s1 & ~onchip_mem_s1_non_bursting_master_requests))
          onchip_mem_s1_slavearbiterlockenable <= |onchip_mem_s1_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster onchip_mem/s1 arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = onchip_mem_s1_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //onchip_mem_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_mem_s1_slavearbiterlockenable2 = |onchip_mem_s1_arb_share_counter_next_value;

  //tiger_top_0/dataMaster onchip_mem/s1 arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = onchip_mem_s1_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //tiger_top_0/instructionMaster onchip_mem/s1 arbiterlock, which is an e_assign
  assign tiger_top_0_instructionMaster_arbiterlock = onchip_mem_s1_slavearbiterlockenable & tiger_top_0_instructionMaster_continuerequest;

  //tiger_top_0/instructionMaster onchip_mem/s1 arbiterlock2, which is an e_assign
  assign tiger_top_0_instructionMaster_arbiterlock2 = onchip_mem_s1_slavearbiterlockenable2 & tiger_top_0_instructionMaster_continuerequest;

  //tiger_top_0/instructionMaster granted onchip_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_tiger_top_0_instructionMaster_granted_slave_onchip_mem_s1 <= 0;
      else if (1)
          last_cycle_tiger_top_0_instructionMaster_granted_slave_onchip_mem_s1 <= tiger_top_0_instructionMaster_saved_grant_onchip_mem_s1 ? 1 : (onchip_mem_s1_arbitration_holdoff_internal | ~tiger_top_0_instructionMaster_requests_onchip_mem_s1) ? 0 : last_cycle_tiger_top_0_instructionMaster_granted_slave_onchip_mem_s1;
    end


  //tiger_top_0_instructionMaster_continuerequest continued request, which is an e_mux
  assign tiger_top_0_instructionMaster_continuerequest = last_cycle_tiger_top_0_instructionMaster_granted_slave_onchip_mem_s1 & tiger_top_0_instructionMaster_requests_onchip_mem_s1;

  //onchip_mem_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_mem_s1_any_continuerequest = tiger_top_0_instructionMaster_continuerequest |
    tiger_top_0_dataMaster_continuerequest;

  assign tiger_top_0_dataMaster_qualified_request_onchip_mem_s1 = tiger_top_0_dataMaster_requests_onchip_mem_s1 & ~((tiger_top_0_dataMaster_read & ((1 < tiger_top_0_dataMaster_latency_counter) | (|tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register))) | tiger_top_0_instructionMaster_arbiterlock);
  //tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register_in = tiger_top_0_dataMaster_granted_onchip_mem_s1 & tiger_top_0_dataMaster_read & ~onchip_mem_s1_waits_for_read;

  //shift register p1 tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register = {tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register, tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register_in};

  //tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register <= 0;
      else if (1)
          tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register <= p1_tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register;
    end


  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1 = tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1_shift_register;

  //onchip_mem_s1_writedata mux, which is an e_mux
  assign onchip_mem_s1_writedata = tiger_top_0_dataMaster_writedata;

  //mux onchip_mem_s1_clken, which is an e_mux
  assign onchip_mem_s1_clken = 1'b1;

  assign tiger_top_0_instructionMaster_requests_onchip_mem_s1 = (({tiger_top_0_instructionMaster_address_to_slave[31 : 12] , 12'b0} == 32'h0) & (tiger_top_0_instructionMaster_read)) & tiger_top_0_instructionMaster_read;
  //tiger_top_0/dataMaster granted onchip_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_tiger_top_0_dataMaster_granted_slave_onchip_mem_s1 <= 0;
      else if (1)
          last_cycle_tiger_top_0_dataMaster_granted_slave_onchip_mem_s1 <= tiger_top_0_dataMaster_saved_grant_onchip_mem_s1 ? 1 : (onchip_mem_s1_arbitration_holdoff_internal | ~tiger_top_0_dataMaster_requests_onchip_mem_s1) ? 0 : last_cycle_tiger_top_0_dataMaster_granted_slave_onchip_mem_s1;
    end


  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_mux
  assign tiger_top_0_dataMaster_continuerequest = last_cycle_tiger_top_0_dataMaster_granted_slave_onchip_mem_s1 & tiger_top_0_dataMaster_requests_onchip_mem_s1;

  assign tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1 = tiger_top_0_instructionMaster_requests_onchip_mem_s1 & ~((tiger_top_0_instructionMaster_read & ((1 < tiger_top_0_instructionMaster_latency_counter) | (|tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register))) | tiger_top_0_dataMaster_arbiterlock);
  //tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register_in = tiger_top_0_instructionMaster_granted_onchip_mem_s1 & tiger_top_0_instructionMaster_read & ~onchip_mem_s1_waits_for_read;

  //shift register p1 tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register = {tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register, tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register_in};

  //tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register <= 0;
      else if (1)
          tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register <= p1_tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register;
    end


  //local readdatavalid tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1, which is an e_mux
  assign tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1 = tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1_shift_register;

  //allow new arb cycle for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_allow_new_arb_cycle = ~tiger_top_0_dataMaster_arbiterlock & ~tiger_top_0_instructionMaster_arbiterlock;

  //tiger_top_0/instructionMaster assignment into master qualified-requests vector for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_master_qreq_vector[0] = tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1;

  //tiger_top_0/instructionMaster grant onchip_mem/s1, which is an e_assign
  assign tiger_top_0_instructionMaster_granted_onchip_mem_s1 = onchip_mem_s1_grant_vector[0];

  //tiger_top_0/instructionMaster saved-grant onchip_mem/s1, which is an e_assign
  assign tiger_top_0_instructionMaster_saved_grant_onchip_mem_s1 = onchip_mem_s1_arb_winner[0] && tiger_top_0_instructionMaster_requests_onchip_mem_s1;

  //tiger_top_0/dataMaster assignment into master qualified-requests vector for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_master_qreq_vector[1] = tiger_top_0_dataMaster_qualified_request_onchip_mem_s1;

  //tiger_top_0/dataMaster grant onchip_mem/s1, which is an e_assign
  assign tiger_top_0_dataMaster_granted_onchip_mem_s1 = onchip_mem_s1_grant_vector[1];

  //tiger_top_0/dataMaster saved-grant onchip_mem/s1, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_onchip_mem_s1 = onchip_mem_s1_arb_winner[1] && tiger_top_0_dataMaster_requests_onchip_mem_s1;

  //onchip_mem/s1 chosen-master double-vector, which is an e_assign
  assign onchip_mem_s1_chosen_master_double_vector = {onchip_mem_s1_master_qreq_vector, onchip_mem_s1_master_qreq_vector} & ({~onchip_mem_s1_master_qreq_vector, ~onchip_mem_s1_master_qreq_vector} + onchip_mem_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_mem_s1_arb_winner = (onchip_mem_s1_allow_new_arb_cycle & | onchip_mem_s1_grant_vector) ? onchip_mem_s1_grant_vector : onchip_mem_s1_saved_chosen_master_vector;

  //saved onchip_mem_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_saved_chosen_master_vector <= 0;
      else if (onchip_mem_s1_allow_new_arb_cycle)
          onchip_mem_s1_saved_chosen_master_vector <= |onchip_mem_s1_grant_vector ? onchip_mem_s1_grant_vector : onchip_mem_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_mem_s1_grant_vector = {(onchip_mem_s1_chosen_master_double_vector[1] | onchip_mem_s1_chosen_master_double_vector[3]),
    (onchip_mem_s1_chosen_master_double_vector[0] | onchip_mem_s1_chosen_master_double_vector[2])};

  //onchip_mem/s1 chosen master rotated left, which is an e_assign
  assign onchip_mem_s1_chosen_master_rot_left = (onchip_mem_s1_arb_winner << 1) ? (onchip_mem_s1_arb_winner << 1) : 1;

  //onchip_mem/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_arb_addend <= 1;
      else if (|onchip_mem_s1_grant_vector)
          onchip_mem_s1_arb_addend <= onchip_mem_s1_end_xfer? onchip_mem_s1_chosen_master_rot_left : onchip_mem_s1_grant_vector;
    end


  assign onchip_mem_s1_chipselect = tiger_top_0_dataMaster_granted_onchip_mem_s1 | tiger_top_0_instructionMaster_granted_onchip_mem_s1;
  //onchip_mem_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_mem_s1_firsttransfer = ~(onchip_mem_s1_slavearbiterlockenable & onchip_mem_s1_any_continuerequest);

  //onchip_mem_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_mem_s1_beginbursttransfer_internal = onchip_mem_s1_begins_xfer;

  //onchip_mem_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_mem_s1_arbitration_holdoff_internal = onchip_mem_s1_begins_xfer & onchip_mem_s1_firsttransfer;

  //onchip_mem_s1_write assignment, which is an e_mux
  assign onchip_mem_s1_write = tiger_top_0_dataMaster_granted_onchip_mem_s1 & tiger_top_0_dataMaster_write;

  assign shifted_address_to_onchip_mem_s1_from_tiger_top_0_dataMaster = tiger_top_0_dataMaster_address_to_slave;
  //onchip_mem_s1_address mux, which is an e_mux
  assign onchip_mem_s1_address = (tiger_top_0_dataMaster_granted_onchip_mem_s1)? (shifted_address_to_onchip_mem_s1_from_tiger_top_0_dataMaster >> 2) :
    (shifted_address_to_onchip_mem_s1_from_tiger_top_0_instructionMaster >> 2);

  assign shifted_address_to_onchip_mem_s1_from_tiger_top_0_instructionMaster = tiger_top_0_instructionMaster_address_to_slave;
  //d1_onchip_mem_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_mem_s1_end_xfer <= 1;
      else if (1)
          d1_onchip_mem_s1_end_xfer <= onchip_mem_s1_end_xfer;
    end


  //onchip_mem_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_mem_s1_waits_for_read = onchip_mem_s1_in_a_read_cycle & 0;

  //onchip_mem_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_mem_s1_in_a_read_cycle = (tiger_top_0_dataMaster_granted_onchip_mem_s1 & tiger_top_0_dataMaster_read) | (tiger_top_0_instructionMaster_granted_onchip_mem_s1 & tiger_top_0_instructionMaster_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_mem_s1_in_a_read_cycle;

  //onchip_mem_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_mem_s1_waits_for_write = onchip_mem_s1_in_a_write_cycle & 0;

  //onchip_mem_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_mem_s1_in_a_write_cycle = tiger_top_0_dataMaster_granted_onchip_mem_s1 & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_mem_s1_in_a_write_cycle;

  assign wait_for_onchip_mem_s1_counter = 0;
  //onchip_mem_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_mem_s1_byteenable = (tiger_top_0_dataMaster_granted_onchip_mem_s1)? tiger_top_0_dataMaster_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_mem/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (tiger_top_0_dataMaster_granted_onchip_mem_s1 + tiger_top_0_instructionMaster_granted_onchip_mem_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (tiger_top_0_dataMaster_saved_grant_onchip_mem_s1 + tiger_top_0_instructionMaster_saved_grant_onchip_mem_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_tiger_top_0_dataMaster_to_sdram_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_tiger_top_0_instructionMaster_to_sdram_s1_module (
                                                                       // inputs:
                                                                        clear_fifo,
                                                                        clk,
                                                                        data_in,
                                                                        read,
                                                                        reset_n,
                                                                        sync_reset,
                                                                        write,

                                                                       // outputs:
                                                                        data_out,
                                                                        empty,
                                                                        fifo_contains_ones_n,
                                                                        full
                                                                     )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              clk,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,
                              tiger_top_0_dataMaster_address_to_slave,
                              tiger_top_0_dataMaster_byteenable,
                              tiger_top_0_dataMaster_dbs_address,
                              tiger_top_0_dataMaster_dbs_write_16,
                              tiger_top_0_dataMaster_latency_counter,
                              tiger_top_0_dataMaster_read,
                              tiger_top_0_dataMaster_write,
                              tiger_top_0_instructionMaster_address_to_slave,
                              tiger_top_0_instructionMaster_dbs_address,
                              tiger_top_0_instructionMaster_latency_counter,
                              tiger_top_0_instructionMaster_read,

                             // outputs:
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata,
                              tiger_top_0_dataMaster_byteenable_sdram_s1,
                              tiger_top_0_dataMaster_granted_sdram_s1,
                              tiger_top_0_dataMaster_qualified_request_sdram_s1,
                              tiger_top_0_dataMaster_read_data_valid_sdram_s1,
                              tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register,
                              tiger_top_0_dataMaster_requests_sdram_s1,
                              tiger_top_0_instructionMaster_granted_sdram_s1,
                              tiger_top_0_instructionMaster_qualified_request_sdram_s1,
                              tiger_top_0_instructionMaster_read_data_valid_sdram_s1,
                              tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register,
                              tiger_top_0_instructionMaster_requests_sdram_s1
                           )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_sdram_s1_end_xfer;
  output  [ 21: 0] sdram_s1_address;
  output  [  1: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 15: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 15: 0] sdram_s1_writedata;
  output  [  1: 0] tiger_top_0_dataMaster_byteenable_sdram_s1;
  output           tiger_top_0_dataMaster_granted_sdram_s1;
  output           tiger_top_0_dataMaster_qualified_request_sdram_s1;
  output           tiger_top_0_dataMaster_read_data_valid_sdram_s1;
  output           tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  output           tiger_top_0_dataMaster_requests_sdram_s1;
  output           tiger_top_0_instructionMaster_granted_sdram_s1;
  output           tiger_top_0_instructionMaster_qualified_request_sdram_s1;
  output           tiger_top_0_instructionMaster_read_data_valid_sdram_s1;
  output           tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register;
  output           tiger_top_0_instructionMaster_requests_sdram_s1;
  input            clk;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input   [  3: 0] tiger_top_0_dataMaster_byteenable;
  input   [  1: 0] tiger_top_0_dataMaster_dbs_address;
  input   [ 15: 0] tiger_top_0_dataMaster_dbs_write_16;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_instructionMaster_address_to_slave;
  input   [  1: 0] tiger_top_0_instructionMaster_dbs_address;
  input            tiger_top_0_instructionMaster_latency_counter;
  input            tiger_top_0_instructionMaster_read;

  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_tiger_top_0_dataMaster_granted_slave_sdram_s1;
  reg              last_cycle_tiger_top_0_instructionMaster_granted_slave_sdram_s1;
  wire    [ 21: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  reg     [  1: 0] sdram_s1_arb_addend;
  wire             sdram_s1_arb_counter_enable;
  reg     [  2: 0] sdram_s1_arb_share_counter;
  wire    [  2: 0] sdram_s1_arb_share_counter_next_value;
  wire    [  2: 0] sdram_s1_arb_share_set_values;
  wire    [  1: 0] sdram_s1_arb_winner;
  wire             sdram_s1_arbitration_holdoff_internal;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire    [  3: 0] sdram_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_s1_chosen_master_rot_left;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire    [  1: 0] sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  wire             sdram_s1_reset_n;
  reg     [  1: 0] sdram_s1_saved_chosen_master_vector;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire    [ 31: 0] shifted_address_to_sdram_s1_from_tiger_top_0_dataMaster;
  wire    [ 31: 0] shifted_address_to_sdram_s1_from_tiger_top_0_instructionMaster;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire    [  1: 0] tiger_top_0_dataMaster_byteenable_sdram_s1;
  wire    [  1: 0] tiger_top_0_dataMaster_byteenable_sdram_s1_segment_0;
  wire    [  1: 0] tiger_top_0_dataMaster_byteenable_sdram_s1_segment_1;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_sdram_s1;
  wire             tiger_top_0_dataMaster_qualified_request_sdram_s1;
  wire             tiger_top_0_dataMaster_rdv_fifo_empty_sdram_s1;
  wire             tiger_top_0_dataMaster_rdv_fifo_output_from_sdram_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_sdram_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  wire             tiger_top_0_dataMaster_requests_sdram_s1;
  wire             tiger_top_0_dataMaster_saved_grant_sdram_s1;
  wire             tiger_top_0_instructionMaster_arbiterlock;
  wire             tiger_top_0_instructionMaster_arbiterlock2;
  wire             tiger_top_0_instructionMaster_continuerequest;
  wire             tiger_top_0_instructionMaster_granted_sdram_s1;
  wire             tiger_top_0_instructionMaster_qualified_request_sdram_s1;
  wire             tiger_top_0_instructionMaster_rdv_fifo_empty_sdram_s1;
  wire             tiger_top_0_instructionMaster_rdv_fifo_output_from_sdram_s1;
  wire             tiger_top_0_instructionMaster_read_data_valid_sdram_s1;
  wire             tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register;
  wire             tiger_top_0_instructionMaster_requests_sdram_s1;
  wire             tiger_top_0_instructionMaster_saved_grant_sdram_s1;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_sdram_s1 | tiger_top_0_instructionMaster_qualified_request_sdram_s1));
  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign tiger_top_0_dataMaster_requests_sdram_s1 = ({tiger_top_0_dataMaster_address_to_slave[31 : 23] , 23'b0} == 32'h800000) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = (tiger_top_0_dataMaster_granted_sdram_s1)? 2 :
    (tiger_top_0_instructionMaster_granted_sdram_s1)? 2 :
    (tiger_top_0_dataMaster_granted_sdram_s1)? 2 :
    (tiger_top_0_instructionMaster_granted_sdram_s1)? 2 :
    1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = tiger_top_0_dataMaster_requests_sdram_s1 |
    tiger_top_0_instructionMaster_requests_sdram_s1 |
    tiger_top_0_dataMaster_requests_sdram_s1 |
    tiger_top_0_instructionMaster_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = 0;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = |sdram_s1_grant_vector |
    |sdram_s1_grant_vector |
    |sdram_s1_grant_vector |
    |sdram_s1_grant_vector;

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster sdram/s1 arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = sdram_s1_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //tiger_top_0/dataMaster sdram/s1 arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //tiger_top_0/instructionMaster sdram/s1 arbiterlock, which is an e_assign
  assign tiger_top_0_instructionMaster_arbiterlock = sdram_s1_slavearbiterlockenable & tiger_top_0_instructionMaster_continuerequest;

  //tiger_top_0/instructionMaster sdram/s1 arbiterlock2, which is an e_assign
  assign tiger_top_0_instructionMaster_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & tiger_top_0_instructionMaster_continuerequest;

  //tiger_top_0/instructionMaster granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_tiger_top_0_instructionMaster_granted_slave_sdram_s1 <= 0;
      else if (1)
          last_cycle_tiger_top_0_instructionMaster_granted_slave_sdram_s1 <= tiger_top_0_instructionMaster_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~tiger_top_0_instructionMaster_requests_sdram_s1) ? 0 : last_cycle_tiger_top_0_instructionMaster_granted_slave_sdram_s1;
    end


  //tiger_top_0_instructionMaster_continuerequest continued request, which is an e_mux
  assign tiger_top_0_instructionMaster_continuerequest = last_cycle_tiger_top_0_instructionMaster_granted_slave_sdram_s1 & tiger_top_0_instructionMaster_requests_sdram_s1;

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_s1_any_continuerequest = tiger_top_0_instructionMaster_continuerequest |
    tiger_top_0_dataMaster_continuerequest;

  assign tiger_top_0_dataMaster_qualified_request_sdram_s1 = tiger_top_0_dataMaster_requests_sdram_s1 & ~((tiger_top_0_dataMaster_read & ((tiger_top_0_dataMaster_latency_counter != 0) | (1 < tiger_top_0_dataMaster_latency_counter))) | ((!tiger_top_0_dataMaster_byteenable_sdram_s1) & tiger_top_0_dataMaster_write) | tiger_top_0_instructionMaster_arbiterlock);
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_tiger_top_0_dataMaster_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_tiger_top_0_dataMaster_to_sdram_s1_module rdv_fifo_for_tiger_top_0_dataMaster_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (tiger_top_0_dataMaster_granted_sdram_s1),
      .data_out             (tiger_top_0_dataMaster_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (tiger_top_0_dataMaster_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register = ~tiger_top_0_dataMaster_rdv_fifo_empty_sdram_s1;
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_sdram_s1, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & tiger_top_0_dataMaster_rdv_fifo_output_from_sdram_s1) & ~ tiger_top_0_dataMaster_rdv_fifo_empty_sdram_s1;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = tiger_top_0_dataMaster_dbs_write_16;

  assign tiger_top_0_instructionMaster_requests_sdram_s1 = (({tiger_top_0_instructionMaster_address_to_slave[31 : 23] , 23'b0} == 32'h800000) & (tiger_top_0_instructionMaster_read)) & tiger_top_0_instructionMaster_read;
  //tiger_top_0/dataMaster granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_tiger_top_0_dataMaster_granted_slave_sdram_s1 <= 0;
      else if (1)
          last_cycle_tiger_top_0_dataMaster_granted_slave_sdram_s1 <= tiger_top_0_dataMaster_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~tiger_top_0_dataMaster_requests_sdram_s1) ? 0 : last_cycle_tiger_top_0_dataMaster_granted_slave_sdram_s1;
    end


  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_mux
  assign tiger_top_0_dataMaster_continuerequest = last_cycle_tiger_top_0_dataMaster_granted_slave_sdram_s1 & tiger_top_0_dataMaster_requests_sdram_s1;

  assign tiger_top_0_instructionMaster_qualified_request_sdram_s1 = tiger_top_0_instructionMaster_requests_sdram_s1 & ~((tiger_top_0_instructionMaster_read & ((tiger_top_0_instructionMaster_latency_counter != 0) | (1 < tiger_top_0_instructionMaster_latency_counter))) | tiger_top_0_dataMaster_arbiterlock);
  //rdv_fifo_for_tiger_top_0_instructionMaster_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_tiger_top_0_instructionMaster_to_sdram_s1_module rdv_fifo_for_tiger_top_0_instructionMaster_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (tiger_top_0_instructionMaster_granted_sdram_s1),
      .data_out             (tiger_top_0_instructionMaster_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (tiger_top_0_instructionMaster_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register = ~tiger_top_0_instructionMaster_rdv_fifo_empty_sdram_s1;
  //local readdatavalid tiger_top_0_instructionMaster_read_data_valid_sdram_s1, which is an e_mux
  assign tiger_top_0_instructionMaster_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & tiger_top_0_instructionMaster_rdv_fifo_output_from_sdram_s1) & ~ tiger_top_0_instructionMaster_rdv_fifo_empty_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = ~tiger_top_0_dataMaster_arbiterlock & ~tiger_top_0_instructionMaster_arbiterlock;

  //tiger_top_0/instructionMaster assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[0] = tiger_top_0_instructionMaster_qualified_request_sdram_s1;

  //tiger_top_0/instructionMaster grant sdram/s1, which is an e_assign
  assign tiger_top_0_instructionMaster_granted_sdram_s1 = sdram_s1_grant_vector[0];

  //tiger_top_0/instructionMaster saved-grant sdram/s1, which is an e_assign
  assign tiger_top_0_instructionMaster_saved_grant_sdram_s1 = sdram_s1_arb_winner[0] && tiger_top_0_instructionMaster_requests_sdram_s1;

  //tiger_top_0/dataMaster assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[1] = tiger_top_0_dataMaster_qualified_request_sdram_s1;

  //tiger_top_0/dataMaster grant sdram/s1, which is an e_assign
  assign tiger_top_0_dataMaster_granted_sdram_s1 = sdram_s1_grant_vector[1];

  //tiger_top_0/dataMaster saved-grant sdram/s1, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_sdram_s1 = sdram_s1_arb_winner[1] && tiger_top_0_dataMaster_requests_sdram_s1;

  //sdram/s1 chosen-master double-vector, which is an e_assign
  assign sdram_s1_chosen_master_double_vector = {sdram_s1_master_qreq_vector, sdram_s1_master_qreq_vector} & ({~sdram_s1_master_qreq_vector, ~sdram_s1_master_qreq_vector} + sdram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_s1_arb_winner = (sdram_s1_allow_new_arb_cycle & | sdram_s1_grant_vector) ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;

  //saved sdram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_saved_chosen_master_vector <= 0;
      else if (sdram_s1_allow_new_arb_cycle)
          sdram_s1_saved_chosen_master_vector <= |sdram_s1_grant_vector ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_s1_grant_vector = {(sdram_s1_chosen_master_double_vector[1] | sdram_s1_chosen_master_double_vector[3]),
    (sdram_s1_chosen_master_double_vector[0] | sdram_s1_chosen_master_double_vector[2])};

  //sdram/s1 chosen master rotated left, which is an e_assign
  assign sdram_s1_chosen_master_rot_left = (sdram_s1_arb_winner << 1) ? (sdram_s1_arb_winner << 1) : 1;

  //sdram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_addend <= 1;
      else if (|sdram_s1_grant_vector)
          sdram_s1_arb_addend <= sdram_s1_end_xfer? sdram_s1_chosen_master_rot_left : sdram_s1_grant_vector;
    end


  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = tiger_top_0_dataMaster_granted_sdram_s1 | tiger_top_0_instructionMaster_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_s1_arbitration_holdoff_internal = sdram_s1_begins_xfer & sdram_s1_firsttransfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~((tiger_top_0_dataMaster_granted_sdram_s1 & tiger_top_0_dataMaster_read) | (tiger_top_0_instructionMaster_granted_sdram_s1 & tiger_top_0_instructionMaster_read));

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~(tiger_top_0_dataMaster_granted_sdram_s1 & tiger_top_0_dataMaster_write);

  assign shifted_address_to_sdram_s1_from_tiger_top_0_dataMaster = {tiger_top_0_dataMaster_address_to_slave >> 2,
    tiger_top_0_dataMaster_dbs_address[1],
    {1 {1'b0}}};

  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = (tiger_top_0_dataMaster_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_tiger_top_0_dataMaster >> 1) :
    (shifted_address_to_sdram_s1_from_tiger_top_0_instructionMaster >> 1);

  assign shifted_address_to_sdram_s1_from_tiger_top_0_instructionMaster = {tiger_top_0_instructionMaster_address_to_slave >> 2,
    tiger_top_0_instructionMaster_dbs_address[1],
    {1 {1'b0}}};

  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else if (1)
          d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = (tiger_top_0_dataMaster_granted_sdram_s1 & tiger_top_0_dataMaster_read) | (tiger_top_0_instructionMaster_granted_sdram_s1 & tiger_top_0_instructionMaster_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = tiger_top_0_dataMaster_granted_sdram_s1 & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((tiger_top_0_dataMaster_granted_sdram_s1)? tiger_top_0_dataMaster_byteenable_sdram_s1 :
    -1);

  assign {tiger_top_0_dataMaster_byteenable_sdram_s1_segment_1,
tiger_top_0_dataMaster_byteenable_sdram_s1_segment_0} = tiger_top_0_dataMaster_byteenable;
  assign tiger_top_0_dataMaster_byteenable_sdram_s1 = ((tiger_top_0_dataMaster_dbs_address[1] == 0))? tiger_top_0_dataMaster_byteenable_sdram_s1_segment_0 :
    tiger_top_0_dataMaster_byteenable_sdram_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (tiger_top_0_dataMaster_granted_sdram_s1 + tiger_top_0_instructionMaster_granted_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (tiger_top_0_dataMaster_saved_grant_sdram_s1 + tiger_top_0_instructionMaster_saved_grant_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module state_0_avalon_slave_0_arbitrator (
                                           // inputs:
                                            clk,
                                            reset_n,
                                            state_0_avalon_slave_0_readdata,
                                            tiger_top_0_dataMaster_address_to_slave,
                                            tiger_top_0_dataMaster_latency_counter,
                                            tiger_top_0_dataMaster_read,
                                            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register,
                                            tiger_top_0_dataMaster_write,

                                           // outputs:
                                            d1_state_0_avalon_slave_0_end_xfer,
                                            state_0_avalon_slave_0_address,
                                            state_0_avalon_slave_0_read,
                                            state_0_avalon_slave_0_readdata_from_sa,
                                            state_0_avalon_slave_0_reset,
                                            state_0_avalon_slave_0_wait_counter_eq_0,
                                            tiger_top_0_dataMaster_granted_state_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_requests_state_0_avalon_slave_0
                                         )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_state_0_avalon_slave_0_end_xfer;
  output  [  1: 0] state_0_avalon_slave_0_address;
  output           state_0_avalon_slave_0_read;
  output  [ 31: 0] state_0_avalon_slave_0_readdata_from_sa;
  output           state_0_avalon_slave_0_reset;
  output           state_0_avalon_slave_0_wait_counter_eq_0;
  output           tiger_top_0_dataMaster_granted_state_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0;
  output           tiger_top_0_dataMaster_requests_state_0_avalon_slave_0;
  input            clk;
  input            reset_n;
  input   [ 31: 0] state_0_avalon_slave_0_readdata;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  input            tiger_top_0_dataMaster_write;

  reg              d1_reasons_to_wait;
  reg              d1_state_0_avalon_slave_0_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_state_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 31: 0] shifted_address_to_state_0_avalon_slave_0_from_tiger_top_0_dataMaster;
  wire    [  1: 0] state_0_avalon_slave_0_address;
  wire             state_0_avalon_slave_0_allgrants;
  wire             state_0_avalon_slave_0_allow_new_arb_cycle;
  wire             state_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             state_0_avalon_slave_0_any_continuerequest;
  wire             state_0_avalon_slave_0_arb_counter_enable;
  reg     [  2: 0] state_0_avalon_slave_0_arb_share_counter;
  wire    [  2: 0] state_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  2: 0] state_0_avalon_slave_0_arb_share_set_values;
  wire             state_0_avalon_slave_0_beginbursttransfer_internal;
  wire             state_0_avalon_slave_0_begins_xfer;
  wire             state_0_avalon_slave_0_counter_load_value;
  wire             state_0_avalon_slave_0_end_xfer;
  wire             state_0_avalon_slave_0_firsttransfer;
  wire             state_0_avalon_slave_0_grant_vector;
  wire             state_0_avalon_slave_0_in_a_read_cycle;
  wire             state_0_avalon_slave_0_in_a_write_cycle;
  wire             state_0_avalon_slave_0_master_qreq_vector;
  wire             state_0_avalon_slave_0_non_bursting_master_requests;
  wire             state_0_avalon_slave_0_read;
  wire    [ 31: 0] state_0_avalon_slave_0_readdata_from_sa;
  wire             state_0_avalon_slave_0_reset;
  reg              state_0_avalon_slave_0_slavearbiterlockenable;
  wire             state_0_avalon_slave_0_slavearbiterlockenable2;
  reg              state_0_avalon_slave_0_wait_counter;
  wire             state_0_avalon_slave_0_wait_counter_eq_0;
  wire             state_0_avalon_slave_0_waits_for_read;
  wire             state_0_avalon_slave_0_waits_for_write;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_state_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_requests_state_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_saved_grant_state_0_avalon_slave_0;
  wire             wait_for_state_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~state_0_avalon_slave_0_end_xfer;
    end


  assign state_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0));
  //assign state_0_avalon_slave_0_readdata_from_sa = state_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign state_0_avalon_slave_0_readdata_from_sa = state_0_avalon_slave_0_readdata;

  assign tiger_top_0_dataMaster_requests_state_0_avalon_slave_0 = (({tiger_top_0_dataMaster_address_to_slave[31 : 4] , 4'b0} == 32'hf0000830) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)) & tiger_top_0_dataMaster_read;
  //state_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign state_0_avalon_slave_0_arb_share_set_values = 1;

  //state_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign state_0_avalon_slave_0_non_bursting_master_requests = tiger_top_0_dataMaster_requests_state_0_avalon_slave_0;

  //state_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign state_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //state_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign state_0_avalon_slave_0_arb_share_counter_next_value = state_0_avalon_slave_0_firsttransfer ? (state_0_avalon_slave_0_arb_share_set_values - 1) : |state_0_avalon_slave_0_arb_share_counter ? (state_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //state_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign state_0_avalon_slave_0_allgrants = |state_0_avalon_slave_0_grant_vector;

  //state_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign state_0_avalon_slave_0_end_xfer = ~(state_0_avalon_slave_0_waits_for_read | state_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_state_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_state_0_avalon_slave_0 = state_0_avalon_slave_0_end_xfer & (~state_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //state_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign state_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_state_0_avalon_slave_0 & state_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_state_0_avalon_slave_0 & ~state_0_avalon_slave_0_non_bursting_master_requests);

  //state_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          state_0_avalon_slave_0_arb_share_counter <= 0;
      else if (state_0_avalon_slave_0_arb_counter_enable)
          state_0_avalon_slave_0_arb_share_counter <= state_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //state_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          state_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|state_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_state_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_state_0_avalon_slave_0 & ~state_0_avalon_slave_0_non_bursting_master_requests))
          state_0_avalon_slave_0_slavearbiterlockenable <= |state_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster state_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = state_0_avalon_slave_0_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //state_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign state_0_avalon_slave_0_slavearbiterlockenable2 = |state_0_avalon_slave_0_arb_share_counter_next_value;

  //tiger_top_0/dataMaster state_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = state_0_avalon_slave_0_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //state_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign state_0_avalon_slave_0_any_continuerequest = 1;

  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_assign
  assign tiger_top_0_dataMaster_continuerequest = 1;

  assign tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0 = tiger_top_0_dataMaster_requests_state_0_avalon_slave_0 & ~((tiger_top_0_dataMaster_read & ((tiger_top_0_dataMaster_latency_counter != 0) | (|tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0 = tiger_top_0_dataMaster_granted_state_0_avalon_slave_0 & tiger_top_0_dataMaster_read & ~state_0_avalon_slave_0_waits_for_read;

  //master is always granted when requested
  assign tiger_top_0_dataMaster_granted_state_0_avalon_slave_0 = tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0;

  //tiger_top_0/dataMaster saved-grant state_0/avalon_slave_0, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_state_0_avalon_slave_0 = tiger_top_0_dataMaster_requests_state_0_avalon_slave_0;

  //allow new arb cycle for state_0/avalon_slave_0, which is an e_assign
  assign state_0_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign state_0_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign state_0_avalon_slave_0_master_qreq_vector = 1;

  //~state_0_avalon_slave_0_reset assignment, which is an e_assign
  assign state_0_avalon_slave_0_reset = ~reset_n;

  //state_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign state_0_avalon_slave_0_firsttransfer = ~(state_0_avalon_slave_0_slavearbiterlockenable & state_0_avalon_slave_0_any_continuerequest);

  //state_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign state_0_avalon_slave_0_beginbursttransfer_internal = state_0_avalon_slave_0_begins_xfer;

  //state_0_avalon_slave_0_read assignment, which is an e_mux
  assign state_0_avalon_slave_0_read = tiger_top_0_dataMaster_granted_state_0_avalon_slave_0 & tiger_top_0_dataMaster_read;

  assign shifted_address_to_state_0_avalon_slave_0_from_tiger_top_0_dataMaster = tiger_top_0_dataMaster_address_to_slave;
  //state_0_avalon_slave_0_address mux, which is an e_mux
  assign state_0_avalon_slave_0_address = shifted_address_to_state_0_avalon_slave_0_from_tiger_top_0_dataMaster >> 2;

  //d1_state_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_state_0_avalon_slave_0_end_xfer <= 1;
      else if (1)
          d1_state_0_avalon_slave_0_end_xfer <= state_0_avalon_slave_0_end_xfer;
    end


  //state_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign state_0_avalon_slave_0_waits_for_read = state_0_avalon_slave_0_in_a_read_cycle & state_0_avalon_slave_0_begins_xfer;

  //state_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign state_0_avalon_slave_0_in_a_read_cycle = tiger_top_0_dataMaster_granted_state_0_avalon_slave_0 & tiger_top_0_dataMaster_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = state_0_avalon_slave_0_in_a_read_cycle;

  //state_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign state_0_avalon_slave_0_waits_for_write = state_0_avalon_slave_0_in_a_write_cycle & wait_for_state_0_avalon_slave_0_counter;

  //state_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign state_0_avalon_slave_0_in_a_write_cycle = tiger_top_0_dataMaster_granted_state_0_avalon_slave_0 & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = state_0_avalon_slave_0_in_a_write_cycle;

  assign state_0_avalon_slave_0_wait_counter_eq_0 = state_0_avalon_slave_0_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          state_0_avalon_slave_0_wait_counter <= 0;
      else if (1)
          state_0_avalon_slave_0_wait_counter <= state_0_avalon_slave_0_counter_load_value;
    end


  assign state_0_avalon_slave_0_counter_load_value = ((state_0_avalon_slave_0_in_a_write_cycle & state_0_avalon_slave_0_begins_xfer))? 1 :
    (~state_0_avalon_slave_0_wait_counter_eq_0)? state_0_avalon_slave_0_wait_counter - 1 :
    0;

  assign wait_for_state_0_avalon_slave_0_counter = state_0_avalon_slave_0_begins_xfer | ~state_0_avalon_slave_0_wait_counter_eq_0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //state_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tiger_top_0_debugSlave_arbitrator (
                                           // inputs:
                                            clk,
                                            reset_n,
                                            tiger_top_0_dataMaster_address_to_slave,
                                            tiger_top_0_dataMaster_latency_counter,
                                            tiger_top_0_dataMaster_read,
                                            tiger_top_0_dataMaster_write,
                                            tiger_top_0_dataMaster_writedata,
                                            tiger_top_0_debugSlave_irq,

                                           // outputs:
                                            d1_tiger_top_0_debugSlave_end_xfer,
                                            tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave,
                                            tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave,
                                            tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave,
                                            tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave,
                                            tiger_top_0_debugSlave_irq_from_sa,
                                            tiger_top_0_debugSlave_write,
                                            tiger_top_0_debugSlave_writedata
                                         )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_tiger_top_0_debugSlave_end_xfer;
  output           tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave;
  output           tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave;
  output           tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave;
  output           tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave;
  output           tiger_top_0_debugSlave_irq_from_sa;
  output           tiger_top_0_debugSlave_write;
  output           tiger_top_0_debugSlave_writedata;
  input            clk;
  input            reset_n;
  input   [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  input            tiger_top_0_dataMaster_latency_counter;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_dataMaster_writedata;
  input            tiger_top_0_debugSlave_irq;

  reg              d1_reasons_to_wait;
  reg              d1_tiger_top_0_debugSlave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tiger_top_0_debugSlave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 31: 0] shifted_address_to_tiger_top_0_debugSlave_from_tiger_top_0_dataMaster;
  wire             tiger_top_0_dataMaster_arbiterlock;
  wire             tiger_top_0_dataMaster_arbiterlock2;
  wire             tiger_top_0_dataMaster_continuerequest;
  wire             tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave;
  wire             tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave;
  wire             tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave;
  wire             tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave;
  wire             tiger_top_0_dataMaster_saved_grant_tiger_top_0_debugSlave;
  wire             tiger_top_0_debugSlave_allgrants;
  wire             tiger_top_0_debugSlave_allow_new_arb_cycle;
  wire             tiger_top_0_debugSlave_any_bursting_master_saved_grant;
  wire             tiger_top_0_debugSlave_any_continuerequest;
  wire             tiger_top_0_debugSlave_arb_counter_enable;
  reg     [  2: 0] tiger_top_0_debugSlave_arb_share_counter;
  wire    [  2: 0] tiger_top_0_debugSlave_arb_share_counter_next_value;
  wire    [  2: 0] tiger_top_0_debugSlave_arb_share_set_values;
  wire             tiger_top_0_debugSlave_beginbursttransfer_internal;
  wire             tiger_top_0_debugSlave_begins_xfer;
  wire             tiger_top_0_debugSlave_end_xfer;
  wire             tiger_top_0_debugSlave_firsttransfer;
  wire             tiger_top_0_debugSlave_grant_vector;
  wire             tiger_top_0_debugSlave_in_a_read_cycle;
  wire             tiger_top_0_debugSlave_in_a_write_cycle;
  wire             tiger_top_0_debugSlave_irq_from_sa;
  wire             tiger_top_0_debugSlave_master_qreq_vector;
  wire             tiger_top_0_debugSlave_non_bursting_master_requests;
  reg              tiger_top_0_debugSlave_slavearbiterlockenable;
  wire             tiger_top_0_debugSlave_slavearbiterlockenable2;
  wire             tiger_top_0_debugSlave_waits_for_read;
  wire             tiger_top_0_debugSlave_waits_for_write;
  wire             tiger_top_0_debugSlave_write;
  wire             tiger_top_0_debugSlave_writedata;
  wire             wait_for_tiger_top_0_debugSlave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~tiger_top_0_debugSlave_end_xfer;
    end


  assign tiger_top_0_debugSlave_begins_xfer = ~d1_reasons_to_wait & ((tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave));
  assign tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave = (({tiger_top_0_dataMaster_address_to_slave[31 : 2] , 2'b0} == 32'hf0000860) & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)) & tiger_top_0_dataMaster_write;
  //tiger_top_0_debugSlave_arb_share_counter set values, which is an e_mux
  assign tiger_top_0_debugSlave_arb_share_set_values = 1;

  //tiger_top_0_debugSlave_non_bursting_master_requests mux, which is an e_mux
  assign tiger_top_0_debugSlave_non_bursting_master_requests = tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave;

  //tiger_top_0_debugSlave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tiger_top_0_debugSlave_any_bursting_master_saved_grant = 0;

  //tiger_top_0_debugSlave_arb_share_counter_next_value assignment, which is an e_assign
  assign tiger_top_0_debugSlave_arb_share_counter_next_value = tiger_top_0_debugSlave_firsttransfer ? (tiger_top_0_debugSlave_arb_share_set_values - 1) : |tiger_top_0_debugSlave_arb_share_counter ? (tiger_top_0_debugSlave_arb_share_counter - 1) : 0;

  //tiger_top_0_debugSlave_allgrants all slave grants, which is an e_mux
  assign tiger_top_0_debugSlave_allgrants = |tiger_top_0_debugSlave_grant_vector;

  //tiger_top_0_debugSlave_end_xfer assignment, which is an e_assign
  assign tiger_top_0_debugSlave_end_xfer = ~(tiger_top_0_debugSlave_waits_for_read | tiger_top_0_debugSlave_waits_for_write);

  //end_xfer_arb_share_counter_term_tiger_top_0_debugSlave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tiger_top_0_debugSlave = tiger_top_0_debugSlave_end_xfer & (~tiger_top_0_debugSlave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tiger_top_0_debugSlave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tiger_top_0_debugSlave_arb_counter_enable = (end_xfer_arb_share_counter_term_tiger_top_0_debugSlave & tiger_top_0_debugSlave_allgrants) | (end_xfer_arb_share_counter_term_tiger_top_0_debugSlave & ~tiger_top_0_debugSlave_non_bursting_master_requests);

  //tiger_top_0_debugSlave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_debugSlave_arb_share_counter <= 0;
      else if (tiger_top_0_debugSlave_arb_counter_enable)
          tiger_top_0_debugSlave_arb_share_counter <= tiger_top_0_debugSlave_arb_share_counter_next_value;
    end


  //tiger_top_0_debugSlave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_debugSlave_slavearbiterlockenable <= 0;
      else if ((|tiger_top_0_debugSlave_master_qreq_vector & end_xfer_arb_share_counter_term_tiger_top_0_debugSlave) | (end_xfer_arb_share_counter_term_tiger_top_0_debugSlave & ~tiger_top_0_debugSlave_non_bursting_master_requests))
          tiger_top_0_debugSlave_slavearbiterlockenable <= |tiger_top_0_debugSlave_arb_share_counter_next_value;
    end


  //tiger_top_0/dataMaster tiger_top_0/debugSlave arbiterlock, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock = tiger_top_0_debugSlave_slavearbiterlockenable & tiger_top_0_dataMaster_continuerequest;

  //tiger_top_0_debugSlave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tiger_top_0_debugSlave_slavearbiterlockenable2 = |tiger_top_0_debugSlave_arb_share_counter_next_value;

  //tiger_top_0/dataMaster tiger_top_0/debugSlave arbiterlock2, which is an e_assign
  assign tiger_top_0_dataMaster_arbiterlock2 = tiger_top_0_debugSlave_slavearbiterlockenable2 & tiger_top_0_dataMaster_continuerequest;

  //tiger_top_0_debugSlave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign tiger_top_0_debugSlave_any_continuerequest = 1;

  //tiger_top_0_dataMaster_continuerequest continued request, which is an e_assign
  assign tiger_top_0_dataMaster_continuerequest = 1;

  assign tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave = tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave;
  //local readdatavalid tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave, which is an e_mux
  assign tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave = tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave & tiger_top_0_dataMaster_read & ~tiger_top_0_debugSlave_waits_for_read;

  //tiger_top_0_debugSlave_writedata mux, which is an e_mux
  assign tiger_top_0_debugSlave_writedata = tiger_top_0_dataMaster_writedata;

  //master is always granted when requested
  assign tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave = tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave;

  //tiger_top_0/dataMaster saved-grant tiger_top_0/debugSlave, which is an e_assign
  assign tiger_top_0_dataMaster_saved_grant_tiger_top_0_debugSlave = tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave;

  //allow new arb cycle for tiger_top_0/debugSlave, which is an e_assign
  assign tiger_top_0_debugSlave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign tiger_top_0_debugSlave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign tiger_top_0_debugSlave_master_qreq_vector = 1;

  //tiger_top_0_debugSlave_firsttransfer first transaction, which is an e_assign
  assign tiger_top_0_debugSlave_firsttransfer = ~(tiger_top_0_debugSlave_slavearbiterlockenable & tiger_top_0_debugSlave_any_continuerequest);

  //tiger_top_0_debugSlave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tiger_top_0_debugSlave_beginbursttransfer_internal = tiger_top_0_debugSlave_begins_xfer;

  //tiger_top_0_debugSlave_write assignment, which is an e_mux
  assign tiger_top_0_debugSlave_write = tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave & tiger_top_0_dataMaster_write;

  assign shifted_address_to_tiger_top_0_debugSlave_from_tiger_top_0_dataMaster = tiger_top_0_dataMaster_address_to_slave;
  //d1_tiger_top_0_debugSlave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tiger_top_0_debugSlave_end_xfer <= 1;
      else if (1)
          d1_tiger_top_0_debugSlave_end_xfer <= tiger_top_0_debugSlave_end_xfer;
    end


  //tiger_top_0_debugSlave_waits_for_read in a cycle, which is an e_mux
  assign tiger_top_0_debugSlave_waits_for_read = tiger_top_0_debugSlave_in_a_read_cycle & tiger_top_0_debugSlave_begins_xfer;

  //tiger_top_0_debugSlave_in_a_read_cycle assignment, which is an e_assign
  assign tiger_top_0_debugSlave_in_a_read_cycle = tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave & tiger_top_0_dataMaster_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = tiger_top_0_debugSlave_in_a_read_cycle;

  //tiger_top_0_debugSlave_waits_for_write in a cycle, which is an e_mux
  assign tiger_top_0_debugSlave_waits_for_write = tiger_top_0_debugSlave_in_a_write_cycle & tiger_top_0_debugSlave_begins_xfer;

  //tiger_top_0_debugSlave_in_a_write_cycle assignment, which is an e_assign
  assign tiger_top_0_debugSlave_in_a_write_cycle = tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave & tiger_top_0_dataMaster_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = tiger_top_0_debugSlave_in_a_write_cycle;

  assign wait_for_tiger_top_0_debugSlave_counter = 0;
  //assign tiger_top_0_debugSlave_irq_from_sa = tiger_top_0_debugSlave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign tiger_top_0_debugSlave_irq_from_sa = tiger_top_0_debugSlave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //tiger_top_0/debugSlave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tiger_top_0_dataMaster_arbitrator (
                                           // inputs:
                                            clk,
                                            d1_GreenLED_s1_end_xfer,
                                            d1_HexLED_0_avalon_slave_0_end_xfer,
                                            d1_RedLED_s1_end_xfer,
                                            d1_grid_0_avalon_slave_0_end_xfer,
                                            d1_jtag_uart_1_controlSlave_end_xfer,
                                            d1_jtag_uart_controlSlave_end_xfer,
                                            d1_onchip_mem_s1_end_xfer,
                                            d1_sdram_s1_end_xfer,
                                            d1_state_0_avalon_slave_0_end_xfer,
                                            d1_tiger_top_0_debugSlave_end_xfer,
                                            grid_0_avalon_slave_0_readdata_from_sa,
                                            jtag_uart_1_controlSlave_readdata_from_sa,
                                            jtag_uart_controlSlave_readdata_from_sa,
                                            onchip_mem_s1_readdata_from_sa,
                                            reset_n,
                                            sdram_s1_readdata_from_sa,
                                            sdram_s1_waitrequest_from_sa,
                                            state_0_avalon_slave_0_readdata_from_sa,
                                            state_0_avalon_slave_0_wait_counter_eq_0,
                                            tiger_top_0_dataMaster_address,
                                            tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_byteenable_sdram_s1,
                                            tiger_top_0_dataMaster_granted_GreenLED_s1,
                                            tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_granted_RedLED_s1,
                                            tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave,
                                            tiger_top_0_dataMaster_granted_jtag_uart_controlSlave,
                                            tiger_top_0_dataMaster_granted_onchip_mem_s1,
                                            tiger_top_0_dataMaster_granted_sdram_s1,
                                            tiger_top_0_dataMaster_granted_state_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave,
                                            tiger_top_0_dataMaster_qualified_request_GreenLED_s1,
                                            tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_qualified_request_RedLED_s1,
                                            tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave,
                                            tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave,
                                            tiger_top_0_dataMaster_qualified_request_onchip_mem_s1,
                                            tiger_top_0_dataMaster_qualified_request_sdram_s1,
                                            tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave,
                                            tiger_top_0_dataMaster_read,
                                            tiger_top_0_dataMaster_read_data_valid_GreenLED_s1,
                                            tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_read_data_valid_RedLED_s1,
                                            tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave,
                                            tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave,
                                            tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1,
                                            tiger_top_0_dataMaster_read_data_valid_sdram_s1,
                                            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register,
                                            tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave,
                                            tiger_top_0_dataMaster_requests_GreenLED_s1,
                                            tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_requests_RedLED_s1,
                                            tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave,
                                            tiger_top_0_dataMaster_requests_jtag_uart_controlSlave,
                                            tiger_top_0_dataMaster_requests_onchip_mem_s1,
                                            tiger_top_0_dataMaster_requests_sdram_s1,
                                            tiger_top_0_dataMaster_requests_state_0_avalon_slave_0,
                                            tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave,
                                            tiger_top_0_dataMaster_write,
                                            tiger_top_0_dataMaster_writedata,
                                            tiger_top_0_debugSlave_irq_from_sa,

                                           // outputs:
                                            tiger_top_0_dataMaster_address_to_slave,
                                            tiger_top_0_dataMaster_dbs_address,
                                            tiger_top_0_dataMaster_dbs_write_16,
                                            tiger_top_0_dataMaster_dbs_write_8,
                                            tiger_top_0_dataMaster_irq,
                                            tiger_top_0_dataMaster_irqnumber,
                                            tiger_top_0_dataMaster_latency_counter,
                                            tiger_top_0_dataMaster_readdata,
                                            tiger_top_0_dataMaster_readdatavalid,
                                            tiger_top_0_dataMaster_reset,
                                            tiger_top_0_dataMaster_waitrequest
                                         )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  output  [  1: 0] tiger_top_0_dataMaster_dbs_address;
  output  [ 15: 0] tiger_top_0_dataMaster_dbs_write_16;
  output  [  7: 0] tiger_top_0_dataMaster_dbs_write_8;
  output           tiger_top_0_dataMaster_irq;
  output  [  5: 0] tiger_top_0_dataMaster_irqnumber;
  output           tiger_top_0_dataMaster_latency_counter;
  output  [ 31: 0] tiger_top_0_dataMaster_readdata;
  output           tiger_top_0_dataMaster_readdatavalid;
  output           tiger_top_0_dataMaster_reset;
  output           tiger_top_0_dataMaster_waitrequest;
  input            clk;
  input            d1_GreenLED_s1_end_xfer;
  input            d1_HexLED_0_avalon_slave_0_end_xfer;
  input            d1_RedLED_s1_end_xfer;
  input            d1_grid_0_avalon_slave_0_end_xfer;
  input            d1_jtag_uart_1_controlSlave_end_xfer;
  input            d1_jtag_uart_controlSlave_end_xfer;
  input            d1_onchip_mem_s1_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_state_0_avalon_slave_0_end_xfer;
  input            d1_tiger_top_0_debugSlave_end_xfer;
  input   [  7: 0] grid_0_avalon_slave_0_readdata_from_sa;
  input   [ 31: 0] jtag_uart_1_controlSlave_readdata_from_sa;
  input   [ 31: 0] jtag_uart_controlSlave_readdata_from_sa;
  input   [ 31: 0] onchip_mem_s1_readdata_from_sa;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [ 31: 0] state_0_avalon_slave_0_readdata_from_sa;
  input            state_0_avalon_slave_0_wait_counter_eq_0;
  input   [ 31: 0] tiger_top_0_dataMaster_address;
  input            tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0;
  input   [  1: 0] tiger_top_0_dataMaster_byteenable_sdram_s1;
  input            tiger_top_0_dataMaster_granted_GreenLED_s1;
  input            tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_granted_RedLED_s1;
  input            tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave;
  input            tiger_top_0_dataMaster_granted_jtag_uart_controlSlave;
  input            tiger_top_0_dataMaster_granted_onchip_mem_s1;
  input            tiger_top_0_dataMaster_granted_sdram_s1;
  input            tiger_top_0_dataMaster_granted_state_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave;
  input            tiger_top_0_dataMaster_qualified_request_GreenLED_s1;
  input            tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_qualified_request_RedLED_s1;
  input            tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave;
  input            tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave;
  input            tiger_top_0_dataMaster_qualified_request_onchip_mem_s1;
  input            tiger_top_0_dataMaster_qualified_request_sdram_s1;
  input            tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave;
  input            tiger_top_0_dataMaster_read;
  input            tiger_top_0_dataMaster_read_data_valid_GreenLED_s1;
  input            tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_read_data_valid_RedLED_s1;
  input            tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave;
  input            tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave;
  input            tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1;
  input            tiger_top_0_dataMaster_read_data_valid_sdram_s1;
  input            tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  input            tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave;
  input            tiger_top_0_dataMaster_requests_GreenLED_s1;
  input            tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_requests_RedLED_s1;
  input            tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave;
  input            tiger_top_0_dataMaster_requests_jtag_uart_controlSlave;
  input            tiger_top_0_dataMaster_requests_onchip_mem_s1;
  input            tiger_top_0_dataMaster_requests_sdram_s1;
  input            tiger_top_0_dataMaster_requests_state_0_avalon_slave_0;
  input            tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave;
  input            tiger_top_0_dataMaster_write;
  input   [ 31: 0] tiger_top_0_dataMaster_writedata;
  input            tiger_top_0_debugSlave_irq_from_sa;

  reg              active_and_waiting_last_time;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             p1_tiger_top_0_dataMaster_latency_counter;
  wire             pre_dbs_count_enable;
  wire             pre_flush_tiger_top_0_dataMaster_readdatavalid;
  wire             r_0;
  wire             r_1;
  reg     [ 31: 0] tiger_top_0_dataMaster_address_last_time;
  wire    [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  reg     [  1: 0] tiger_top_0_dataMaster_dbs_address;
  wire    [  1: 0] tiger_top_0_dataMaster_dbs_increment;
  reg     [  1: 0] tiger_top_0_dataMaster_dbs_rdv_counter;
  wire    [  1: 0] tiger_top_0_dataMaster_dbs_rdv_counter_inc;
  wire    [ 15: 0] tiger_top_0_dataMaster_dbs_write_16;
  wire    [  7: 0] tiger_top_0_dataMaster_dbs_write_8;
  wire             tiger_top_0_dataMaster_irq;
  wire    [  5: 0] tiger_top_0_dataMaster_irqnumber;
  wire             tiger_top_0_dataMaster_is_granted_some_slave;
  reg              tiger_top_0_dataMaster_latency_counter;
  wire    [  1: 0] tiger_top_0_dataMaster_next_dbs_rdv_counter;
  reg              tiger_top_0_dataMaster_read_but_no_slave_selected;
  reg              tiger_top_0_dataMaster_read_last_time;
  wire    [ 31: 0] tiger_top_0_dataMaster_readdata;
  wire             tiger_top_0_dataMaster_readdatavalid;
  wire             tiger_top_0_dataMaster_reset;
  wire             tiger_top_0_dataMaster_run;
  wire             tiger_top_0_dataMaster_waitrequest;
  reg              tiger_top_0_dataMaster_write_last_time;
  reg     [ 31: 0] tiger_top_0_dataMaster_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~tiger_top_0_dataMaster_qualified_request_GreenLED_s1 | ~tiger_top_0_dataMaster_read | (1 & ~d1_GreenLED_s1_end_xfer & tiger_top_0_dataMaster_read))) & ((~tiger_top_0_dataMaster_qualified_request_GreenLED_s1 | ~tiger_top_0_dataMaster_write | (1 & tiger_top_0_dataMaster_write))) & 1 & ((~tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0 | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & ~d1_HexLED_0_avalon_slave_0_end_xfer & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)))) & ((~tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0 | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & ~d1_HexLED_0_avalon_slave_0_end_xfer & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)))) & 1 & ((~tiger_top_0_dataMaster_qualified_request_RedLED_s1 | ~tiger_top_0_dataMaster_read | (1 & ~d1_RedLED_s1_end_xfer & tiger_top_0_dataMaster_read))) & ((~tiger_top_0_dataMaster_qualified_request_RedLED_s1 | ~tiger_top_0_dataMaster_write | (1 & tiger_top_0_dataMaster_write))) & 1 & ((tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0 | ((tiger_top_0_dataMaster_write & !tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_dbs_address[1] & tiger_top_0_dataMaster_dbs_address[0])) | ~tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0)) & ((~tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0 | ~tiger_top_0_dataMaster_read | (1 & ~d1_grid_0_avalon_slave_0_end_xfer & (tiger_top_0_dataMaster_dbs_address[1] & tiger_top_0_dataMaster_dbs_address[0]) & tiger_top_0_dataMaster_read))) & ((~tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0 | ~tiger_top_0_dataMaster_write | (1 & ~d1_grid_0_avalon_slave_0_end_xfer & (tiger_top_0_dataMaster_dbs_address[1] & tiger_top_0_dataMaster_dbs_address[0]) & tiger_top_0_dataMaster_write))) & 1 & (tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave | ~tiger_top_0_dataMaster_requests_jtag_uart_controlSlave) & ((~tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)))) & ((~tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)))) & 1 & (tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave | ~tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave) & ((~tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write))));

  //cascaded wait assignment, which is an e_assign
  assign tiger_top_0_dataMaster_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)))) & 1 & (tiger_top_0_dataMaster_qualified_request_onchip_mem_s1 | ~tiger_top_0_dataMaster_requests_onchip_mem_s1) & (tiger_top_0_dataMaster_granted_onchip_mem_s1 | ~tiger_top_0_dataMaster_qualified_request_onchip_mem_s1) & ((~tiger_top_0_dataMaster_qualified_request_onchip_mem_s1 | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)))) & ((~tiger_top_0_dataMaster_qualified_request_onchip_mem_s1 | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)))) & 1 & (tiger_top_0_dataMaster_qualified_request_sdram_s1 | (tiger_top_0_dataMaster_write & !tiger_top_0_dataMaster_byteenable_sdram_s1 & tiger_top_0_dataMaster_dbs_address[1]) | ~tiger_top_0_dataMaster_requests_sdram_s1) & (tiger_top_0_dataMaster_granted_sdram_s1 | ~tiger_top_0_dataMaster_qualified_request_sdram_s1) & ((~tiger_top_0_dataMaster_qualified_request_sdram_s1 | ~tiger_top_0_dataMaster_read | (1 & ~sdram_s1_waitrequest_from_sa & (tiger_top_0_dataMaster_dbs_address[1]) & tiger_top_0_dataMaster_read))) & ((~tiger_top_0_dataMaster_qualified_request_sdram_s1 | ~tiger_top_0_dataMaster_write | (1 & ~sdram_s1_waitrequest_from_sa & (tiger_top_0_dataMaster_dbs_address[1]) & tiger_top_0_dataMaster_write))) & 1 & (tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0 | ~tiger_top_0_dataMaster_requests_state_0_avalon_slave_0) & ((~tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0 | ~tiger_top_0_dataMaster_read | (1 & ~d1_state_0_avalon_slave_0_end_xfer & tiger_top_0_dataMaster_read))) & ((~tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0 | ~tiger_top_0_dataMaster_write | (1 & ((state_0_avalon_slave_0_wait_counter_eq_0 & ~d1_state_0_avalon_slave_0_end_xfer)) & tiger_top_0_dataMaster_write))) & 1 & ((~tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & ~d1_tiger_top_0_debugSlave_end_xfer & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write)))) & ((~tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave | ~(tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write) | (1 & ~d1_tiger_top_0_debugSlave_end_xfer & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign tiger_top_0_dataMaster_address_to_slave = {tiger_top_0_dataMaster_address[31 : 28],
    4'b0,
    tiger_top_0_dataMaster_address[23 : 0]};

  //tiger_top_0_dataMaster_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_read_but_no_slave_selected <= 0;
      else if (1)
          tiger_top_0_dataMaster_read_but_no_slave_selected <= tiger_top_0_dataMaster_read & tiger_top_0_dataMaster_run & ~tiger_top_0_dataMaster_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign tiger_top_0_dataMaster_is_granted_some_slave = tiger_top_0_dataMaster_granted_GreenLED_s1 |
    tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0 |
    tiger_top_0_dataMaster_granted_RedLED_s1 |
    tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0 |
    tiger_top_0_dataMaster_granted_jtag_uart_controlSlave |
    tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave |
    tiger_top_0_dataMaster_granted_onchip_mem_s1 |
    tiger_top_0_dataMaster_granted_sdram_s1 |
    tiger_top_0_dataMaster_granted_state_0_avalon_slave_0 |
    tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_tiger_top_0_dataMaster_readdatavalid = tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1 |
    (tiger_top_0_dataMaster_read_data_valid_sdram_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign tiger_top_0_dataMaster_readdatavalid = tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_data_valid_GreenLED_s1 |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0 |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_data_valid_RedLED_s1 |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    (tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0 & dbs_counter_overflow) |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0 |
    tiger_top_0_dataMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_dataMaster_readdatavalid |
    tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave;

  //actual waitrequest port, which is an e_assign
  assign tiger_top_0_dataMaster_waitrequest = ~tiger_top_0_dataMaster_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_latency_counter <= 0;
      else if (1)
          tiger_top_0_dataMaster_latency_counter <= p1_tiger_top_0_dataMaster_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_tiger_top_0_dataMaster_latency_counter = ((tiger_top_0_dataMaster_run & tiger_top_0_dataMaster_read))? latency_load_value :
    (tiger_top_0_dataMaster_latency_counter)? tiger_top_0_dataMaster_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {tiger_top_0_dataMaster_requests_onchip_mem_s1}} & 1;

  //~tiger_top_0_dataMaster_reset assignment, which is an e_assign
  assign tiger_top_0_dataMaster_reset = ~reset_n;

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_write & !tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0)) |
    (tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_read & 1 & 1 & ~d1_grid_0_avalon_slave_0_end_xfer) |
    (tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_write & 1 & 1 & ~d1_grid_0_avalon_slave_0_end_xfer) |
    (((~0) & tiger_top_0_dataMaster_requests_sdram_s1 & tiger_top_0_dataMaster_write & !tiger_top_0_dataMaster_byteenable_sdram_s1)) |
    (tiger_top_0_dataMaster_granted_sdram_s1 & tiger_top_0_dataMaster_read & 1 & 1 & ~sdram_s1_waitrequest_from_sa) |
    (tiger_top_0_dataMaster_granted_sdram_s1 & tiger_top_0_dataMaster_write & 1 & 1 & ~sdram_s1_waitrequest_from_sa);

  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = grid_0_avalon_slave_0_readdata_from_sa;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((tiger_top_0_dataMaster_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = grid_0_avalon_slave_0_readdata_from_sa;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((tiger_top_0_dataMaster_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = grid_0_avalon_slave_0_readdata_from_sa;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((tiger_top_0_dataMaster_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //tiger_top_0/dataMaster readdata mux, which is an e_mux
  assign tiger_top_0_dataMaster_readdata = ({32 {~(tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0 & tiger_top_0_dataMaster_read)}} | {grid_0_avalon_slave_0_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~(tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave & tiger_top_0_dataMaster_read)}} | jtag_uart_controlSlave_readdata_from_sa) &
    ({32 {~(tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave & tiger_top_0_dataMaster_read)}} | jtag_uart_1_controlSlave_readdata_from_sa) &
    ({32 {~tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1}} | onchip_mem_s1_readdata_from_sa) &
    ({32 {~tiger_top_0_dataMaster_read_data_valid_sdram_s1}} | {sdram_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0 & tiger_top_0_dataMaster_read)}} | state_0_avalon_slave_0_readdata_from_sa);

  //mux write dbs 2, which is an e_mux
  assign tiger_top_0_dataMaster_dbs_write_8 = ((tiger_top_0_dataMaster_dbs_address[1 : 0] == 0))? tiger_top_0_dataMaster_writedata[7 : 0] :
    ((tiger_top_0_dataMaster_dbs_address[1 : 0] == 1))? tiger_top_0_dataMaster_writedata[15 : 8] :
    ((tiger_top_0_dataMaster_dbs_address[1 : 0] == 2))? tiger_top_0_dataMaster_writedata[23 : 16] :
    tiger_top_0_dataMaster_writedata[31 : 24];

  //dbs count increment, which is an e_mux
  assign tiger_top_0_dataMaster_dbs_increment = (tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0)? 1 :
    (tiger_top_0_dataMaster_requests_sdram_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = tiger_top_0_dataMaster_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = tiger_top_0_dataMaster_dbs_address + tiger_top_0_dataMaster_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_dbs_address <= 0;
      else if (dbs_count_enable)
          tiger_top_0_dataMaster_dbs_address <= next_dbs_address;
    end


  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = sdram_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((tiger_top_0_dataMaster_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign tiger_top_0_dataMaster_dbs_write_16 = (tiger_top_0_dataMaster_dbs_address[1])? tiger_top_0_dataMaster_writedata[31 : 16] :
    tiger_top_0_dataMaster_writedata[15 : 0];

  //p1 dbs rdv counter, which is an e_assign
  assign tiger_top_0_dataMaster_next_dbs_rdv_counter = tiger_top_0_dataMaster_dbs_rdv_counter + tiger_top_0_dataMaster_dbs_rdv_counter_inc;

  //tiger_top_0_dataMaster_rdv_inc_mux, which is an e_mux
  assign tiger_top_0_dataMaster_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = tiger_top_0_dataMaster_read_data_valid_sdram_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          tiger_top_0_dataMaster_dbs_rdv_counter <= tiger_top_0_dataMaster_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = tiger_top_0_dataMaster_dbs_rdv_counter[1] & ~tiger_top_0_dataMaster_next_dbs_rdv_counter[1];

  //irq mux, which is an e_mux
  assign tiger_top_0_dataMaster_irq = tiger_top_0_debugSlave_irq_from_sa;

  //mux tiger_top_0/dataMaster irqnumber, which is an e_mux
  assign tiger_top_0_dataMaster_irqnumber = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //tiger_top_0_dataMaster_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_address_last_time <= 0;
      else if (1)
          tiger_top_0_dataMaster_address_last_time <= tiger_top_0_dataMaster_address;
    end


  //tiger_top_0/dataMaster waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= tiger_top_0_dataMaster_waitrequest & (tiger_top_0_dataMaster_read | tiger_top_0_dataMaster_write);
    end


  //tiger_top_0_dataMaster_address matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or tiger_top_0_dataMaster_address or tiger_top_0_dataMaster_address_last_time)
    begin
      if (active_and_waiting_last_time & (tiger_top_0_dataMaster_address != tiger_top_0_dataMaster_address_last_time))
        begin
          $write("%0d ns: tiger_top_0_dataMaster_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //tiger_top_0_dataMaster_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_read_last_time <= 0;
      else if (1)
          tiger_top_0_dataMaster_read_last_time <= tiger_top_0_dataMaster_read;
    end


  //tiger_top_0_dataMaster_read matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or tiger_top_0_dataMaster_read or tiger_top_0_dataMaster_read_last_time)
    begin
      if (active_and_waiting_last_time & (tiger_top_0_dataMaster_read != tiger_top_0_dataMaster_read_last_time))
        begin
          $write("%0d ns: tiger_top_0_dataMaster_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //tiger_top_0_dataMaster_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_write_last_time <= 0;
      else if (1)
          tiger_top_0_dataMaster_write_last_time <= tiger_top_0_dataMaster_write;
    end


  //tiger_top_0_dataMaster_write matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or tiger_top_0_dataMaster_write or tiger_top_0_dataMaster_write_last_time)
    begin
      if (active_and_waiting_last_time & (tiger_top_0_dataMaster_write != tiger_top_0_dataMaster_write_last_time))
        begin
          $write("%0d ns: tiger_top_0_dataMaster_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //tiger_top_0_dataMaster_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_dataMaster_writedata_last_time <= 0;
      else if (1)
          tiger_top_0_dataMaster_writedata_last_time <= tiger_top_0_dataMaster_writedata;
    end


  //tiger_top_0_dataMaster_writedata matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or tiger_top_0_dataMaster_write or tiger_top_0_dataMaster_writedata or tiger_top_0_dataMaster_writedata_last_time)
    begin
      if (active_and_waiting_last_time & (tiger_top_0_dataMaster_writedata != tiger_top_0_dataMaster_writedata_last_time) & tiger_top_0_dataMaster_write)
        begin
          $write("%0d ns: tiger_top_0_dataMaster_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tiger_top_0_instructionMaster_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   d1_onchip_mem_s1_end_xfer,
                                                   d1_sdram_s1_end_xfer,
                                                   onchip_mem_s1_readdata_from_sa,
                                                   reset_n,
                                                   sdram_s1_readdata_from_sa,
                                                   sdram_s1_waitrequest_from_sa,
                                                   tiger_top_0_instructionMaster_address,
                                                   tiger_top_0_instructionMaster_granted_onchip_mem_s1,
                                                   tiger_top_0_instructionMaster_granted_sdram_s1,
                                                   tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1,
                                                   tiger_top_0_instructionMaster_qualified_request_sdram_s1,
                                                   tiger_top_0_instructionMaster_read,
                                                   tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1,
                                                   tiger_top_0_instructionMaster_read_data_valid_sdram_s1,
                                                   tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register,
                                                   tiger_top_0_instructionMaster_requests_onchip_mem_s1,
                                                   tiger_top_0_instructionMaster_requests_sdram_s1,

                                                  // outputs:
                                                   tiger_top_0_instructionMaster_address_to_slave,
                                                   tiger_top_0_instructionMaster_dbs_address,
                                                   tiger_top_0_instructionMaster_latency_counter,
                                                   tiger_top_0_instructionMaster_readdata,
                                                   tiger_top_0_instructionMaster_readdatavalid,
                                                   tiger_top_0_instructionMaster_waitrequest
                                                )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [ 31: 0] tiger_top_0_instructionMaster_address_to_slave;
  output  [  1: 0] tiger_top_0_instructionMaster_dbs_address;
  output           tiger_top_0_instructionMaster_latency_counter;
  output  [ 31: 0] tiger_top_0_instructionMaster_readdata;
  output           tiger_top_0_instructionMaster_readdatavalid;
  output           tiger_top_0_instructionMaster_waitrequest;
  input            clk;
  input            d1_onchip_mem_s1_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input   [ 31: 0] onchip_mem_s1_readdata_from_sa;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [ 31: 0] tiger_top_0_instructionMaster_address;
  input            tiger_top_0_instructionMaster_granted_onchip_mem_s1;
  input            tiger_top_0_instructionMaster_granted_sdram_s1;
  input            tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1;
  input            tiger_top_0_instructionMaster_qualified_request_sdram_s1;
  input            tiger_top_0_instructionMaster_read;
  input            tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1;
  input            tiger_top_0_instructionMaster_read_data_valid_sdram_s1;
  input            tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register;
  input            tiger_top_0_instructionMaster_requests_onchip_mem_s1;
  input            tiger_top_0_instructionMaster_requests_sdram_s1;

  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             p1_tiger_top_0_instructionMaster_latency_counter;
  wire             pre_dbs_count_enable;
  wire             pre_flush_tiger_top_0_instructionMaster_readdatavalid;
  wire             r_1;
  reg     [ 31: 0] tiger_top_0_instructionMaster_address_last_time;
  wire    [ 31: 0] tiger_top_0_instructionMaster_address_to_slave;
  reg     [  1: 0] tiger_top_0_instructionMaster_dbs_address;
  wire    [  1: 0] tiger_top_0_instructionMaster_dbs_increment;
  reg     [  1: 0] tiger_top_0_instructionMaster_dbs_rdv_counter;
  wire    [  1: 0] tiger_top_0_instructionMaster_dbs_rdv_counter_inc;
  wire             tiger_top_0_instructionMaster_is_granted_some_slave;
  reg              tiger_top_0_instructionMaster_latency_counter;
  wire    [  1: 0] tiger_top_0_instructionMaster_next_dbs_rdv_counter;
  reg              tiger_top_0_instructionMaster_read_but_no_slave_selected;
  reg              tiger_top_0_instructionMaster_read_last_time;
  wire    [ 31: 0] tiger_top_0_instructionMaster_readdata;
  wire             tiger_top_0_instructionMaster_readdatavalid;
  wire             tiger_top_0_instructionMaster_run;
  wire             tiger_top_0_instructionMaster_waitrequest;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1 | ~tiger_top_0_instructionMaster_requests_onchip_mem_s1) & (tiger_top_0_instructionMaster_granted_onchip_mem_s1 | ~tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1) & ((~tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1 | ~(tiger_top_0_instructionMaster_read) | (1 & (tiger_top_0_instructionMaster_read)))) & 1 & (tiger_top_0_instructionMaster_qualified_request_sdram_s1 | ~tiger_top_0_instructionMaster_requests_sdram_s1) & (tiger_top_0_instructionMaster_granted_sdram_s1 | ~tiger_top_0_instructionMaster_qualified_request_sdram_s1) & ((~tiger_top_0_instructionMaster_qualified_request_sdram_s1 | ~tiger_top_0_instructionMaster_read | (1 & ~sdram_s1_waitrequest_from_sa & (tiger_top_0_instructionMaster_dbs_address[1]) & tiger_top_0_instructionMaster_read)));

  //cascaded wait assignment, which is an e_assign
  assign tiger_top_0_instructionMaster_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign tiger_top_0_instructionMaster_address_to_slave = {8'b0,
    tiger_top_0_instructionMaster_address[23 : 0]};

  //tiger_top_0_instructionMaster_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_instructionMaster_read_but_no_slave_selected <= 0;
      else if (1)
          tiger_top_0_instructionMaster_read_but_no_slave_selected <= tiger_top_0_instructionMaster_read & tiger_top_0_instructionMaster_run & ~tiger_top_0_instructionMaster_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign tiger_top_0_instructionMaster_is_granted_some_slave = tiger_top_0_instructionMaster_granted_onchip_mem_s1 |
    tiger_top_0_instructionMaster_granted_sdram_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_tiger_top_0_instructionMaster_readdatavalid = tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1 |
    (tiger_top_0_instructionMaster_read_data_valid_sdram_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign tiger_top_0_instructionMaster_readdatavalid = tiger_top_0_instructionMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_instructionMaster_readdatavalid |
    tiger_top_0_instructionMaster_read_but_no_slave_selected |
    pre_flush_tiger_top_0_instructionMaster_readdatavalid;

  //tiger_top_0/instructionMaster readdata mux, which is an e_mux
  assign tiger_top_0_instructionMaster_readdata = ({32 {~tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1}} | onchip_mem_s1_readdata_from_sa) &
    ({32 {~tiger_top_0_instructionMaster_read_data_valid_sdram_s1}} | {sdram_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign tiger_top_0_instructionMaster_waitrequest = ~tiger_top_0_instructionMaster_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_instructionMaster_latency_counter <= 0;
      else if (1)
          tiger_top_0_instructionMaster_latency_counter <= p1_tiger_top_0_instructionMaster_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_tiger_top_0_instructionMaster_latency_counter = ((tiger_top_0_instructionMaster_run & tiger_top_0_instructionMaster_read))? latency_load_value :
    (tiger_top_0_instructionMaster_latency_counter)? tiger_top_0_instructionMaster_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {tiger_top_0_instructionMaster_requests_onchip_mem_s1}} & 1;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = sdram_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((tiger_top_0_instructionMaster_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign tiger_top_0_instructionMaster_dbs_increment = (tiger_top_0_instructionMaster_requests_sdram_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = tiger_top_0_instructionMaster_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = tiger_top_0_instructionMaster_dbs_address + tiger_top_0_instructionMaster_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_instructionMaster_dbs_address <= 0;
      else if (dbs_count_enable)
          tiger_top_0_instructionMaster_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign tiger_top_0_instructionMaster_next_dbs_rdv_counter = tiger_top_0_instructionMaster_dbs_rdv_counter + tiger_top_0_instructionMaster_dbs_rdv_counter_inc;

  //tiger_top_0_instructionMaster_rdv_inc_mux, which is an e_mux
  assign tiger_top_0_instructionMaster_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = tiger_top_0_instructionMaster_read_data_valid_sdram_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_instructionMaster_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          tiger_top_0_instructionMaster_dbs_rdv_counter <= tiger_top_0_instructionMaster_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = tiger_top_0_instructionMaster_dbs_rdv_counter[1] & ~tiger_top_0_instructionMaster_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = tiger_top_0_instructionMaster_granted_sdram_s1 & tiger_top_0_instructionMaster_read & 1 & 1 & ~sdram_s1_waitrequest_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //tiger_top_0_instructionMaster_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_instructionMaster_address_last_time <= 0;
      else if (1)
          tiger_top_0_instructionMaster_address_last_time <= tiger_top_0_instructionMaster_address;
    end


  //tiger_top_0/instructionMaster waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= tiger_top_0_instructionMaster_waitrequest & (tiger_top_0_instructionMaster_read);
    end


  //tiger_top_0_instructionMaster_address matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or tiger_top_0_instructionMaster_address or tiger_top_0_instructionMaster_address_last_time)
    begin
      if (active_and_waiting_last_time & (tiger_top_0_instructionMaster_address != tiger_top_0_instructionMaster_address_last_time))
        begin
          $write("%0d ns: tiger_top_0_instructionMaster_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //tiger_top_0_instructionMaster_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tiger_top_0_instructionMaster_read_last_time <= 0;
      else if (1)
          tiger_top_0_instructionMaster_read_last_time <= tiger_top_0_instructionMaster_read;
    end


  //tiger_top_0_instructionMaster_read matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or tiger_top_0_instructionMaster_read or tiger_top_0_instructionMaster_read_last_time)
    begin
      if (active_and_waiting_last_time & (tiger_top_0_instructionMaster_read != tiger_top_0_instructionMaster_read_last_time))
        begin
          $write("%0d ns: tiger_top_0_instructionMaster_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module game_of_life_reset_clk_domain_synch_module (
                                                    // inputs:
                                                     clk,
                                                     data_in,
                                                     reset_n,

                                                    // outputs:
                                                     data_out
                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "MAX_DELAY=\"100ns\" ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module game_of_life (
                      // 1) global signals:
                       clk,
                       reset_n,

                      // the_GreenLED
                       out_port_from_the_GreenLED,

                      // the_HexLED_0
                       HEX0_from_the_HexLED_0,
                       HEX1_from_the_HexLED_0,
                       HEX2_from_the_HexLED_0,
                       HEX3_from_the_HexLED_0,
                       HEX4_from_the_HexLED_0,
                       HEX5_from_the_HexLED_0,
                       HEX6_from_the_HexLED_0,
                       HEX7_from_the_HexLED_0,

                      // the_RedLED
                       out_port_from_the_RedLED,

                      // the_grid_0
                       address_a_to_the_grid_0,
                       clock_a_to_the_grid_0,
                       data_a_to_the_grid_0,
                       q_a_from_the_grid_0,
                       wren_a_to_the_grid_0,

                      // the_sdram
                       zs_addr_from_the_sdram,
                       zs_ba_from_the_sdram,
                       zs_cas_n_from_the_sdram,
                       zs_cke_from_the_sdram,
                       zs_cs_n_from_the_sdram,
                       zs_dq_to_and_from_the_sdram,
                       zs_dqm_from_the_sdram,
                       zs_ras_n_from_the_sdram,
                       zs_we_n_from_the_sdram,

                      // the_state_0
                       mouse_button_to_the_state_0,
                       next_state_to_the_state_0,
                       x_to_the_state_0,
                       y_to_the_state_0
                    )
;

  output  [  7: 0] HEX0_from_the_HexLED_0;
  output  [  7: 0] HEX1_from_the_HexLED_0;
  output  [  7: 0] HEX2_from_the_HexLED_0;
  output  [  7: 0] HEX3_from_the_HexLED_0;
  output  [  7: 0] HEX4_from_the_HexLED_0;
  output  [  7: 0] HEX5_from_the_HexLED_0;
  output  [  7: 0] HEX6_from_the_HexLED_0;
  output  [  7: 0] HEX7_from_the_HexLED_0;
  output  [  8: 0] out_port_from_the_GreenLED;
  output  [ 17: 0] out_port_from_the_RedLED;
  output  [  7: 0] q_a_from_the_grid_0;
  output  [ 11: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram;
  output  [  1: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input   [ 10: 0] address_a_to_the_grid_0;
  input            clk;
  input            clock_a_to_the_grid_0;
  input   [  7: 0] data_a_to_the_grid_0;
  input            mouse_button_to_the_state_0;
  input            next_state_to_the_state_0;
  input            reset_n;
  input            wren_a_to_the_grid_0;
  input   [ 10: 0] x_to_the_state_0;
  input   [ 10: 0] y_to_the_state_0;

  wire    [  1: 0] GreenLED_s1_address;
  wire             GreenLED_s1_chipselect;
  wire             GreenLED_s1_reset_n;
  wire             GreenLED_s1_write_n;
  wire    [  8: 0] GreenLED_s1_writedata;
  wire    [  7: 0] HEX0_from_the_HexLED_0;
  wire    [  7: 0] HEX1_from_the_HexLED_0;
  wire    [  7: 0] HEX2_from_the_HexLED_0;
  wire    [  7: 0] HEX3_from_the_HexLED_0;
  wire    [  7: 0] HEX4_from_the_HexLED_0;
  wire    [  7: 0] HEX5_from_the_HexLED_0;
  wire    [  7: 0] HEX6_from_the_HexLED_0;
  wire    [  7: 0] HEX7_from_the_HexLED_0;
  wire             HexLED_0_avalon_slave_0_reset_n;
  wire             HexLED_0_avalon_slave_0_write;
  wire    [ 31: 0] HexLED_0_avalon_slave_0_writedata;
  wire    [  1: 0] RedLED_s1_address;
  wire             RedLED_s1_chipselect;
  wire             RedLED_s1_reset_n;
  wire             RedLED_s1_write_n;
  wire    [ 17: 0] RedLED_s1_writedata;
  wire             clk_reset_n;
  wire             d1_GreenLED_s1_end_xfer;
  wire             d1_HexLED_0_avalon_slave_0_end_xfer;
  wire             d1_RedLED_s1_end_xfer;
  wire             d1_grid_0_avalon_slave_0_end_xfer;
  wire             d1_jtag_uart_1_controlSlave_end_xfer;
  wire             d1_jtag_uart_controlSlave_end_xfer;
  wire             d1_onchip_mem_s1_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_state_0_avalon_slave_0_end_xfer;
  wire             d1_tiger_top_0_debugSlave_end_xfer;
  wire    [ 10: 0] grid_0_avalon_slave_0_address;
  wire    [  7: 0] grid_0_avalon_slave_0_readdata;
  wire    [  7: 0] grid_0_avalon_slave_0_readdata_from_sa;
  wire             grid_0_avalon_slave_0_reset;
  wire             grid_0_avalon_slave_0_write;
  wire    [  7: 0] grid_0_avalon_slave_0_writedata;
  wire             jtag_uart_1_controlSlave_address;
  wire             jtag_uart_1_controlSlave_read;
  wire    [ 31: 0] jtag_uart_1_controlSlave_readdata;
  wire    [ 31: 0] jtag_uart_1_controlSlave_readdata_from_sa;
  wire             jtag_uart_1_controlSlave_reset_n;
  wire             jtag_uart_1_controlSlave_write;
  wire    [ 31: 0] jtag_uart_1_controlSlave_writedata;
  wire             jtag_uart_controlSlave_address;
  wire             jtag_uart_controlSlave_read;
  wire    [ 31: 0] jtag_uart_controlSlave_readdata;
  wire    [ 31: 0] jtag_uart_controlSlave_readdata_from_sa;
  wire             jtag_uart_controlSlave_reset_n;
  wire             jtag_uart_controlSlave_write;
  wire    [ 31: 0] jtag_uart_controlSlave_writedata;
  wire    [  9: 0] onchip_mem_s1_address;
  wire    [  3: 0] onchip_mem_s1_byteenable;
  wire             onchip_mem_s1_chipselect;
  wire             onchip_mem_s1_clken;
  wire    [ 31: 0] onchip_mem_s1_readdata;
  wire    [ 31: 0] onchip_mem_s1_readdata_from_sa;
  wire             onchip_mem_s1_write;
  wire    [ 31: 0] onchip_mem_s1_writedata;
  wire    [  8: 0] out_port_from_the_GreenLED;
  wire    [ 17: 0] out_port_from_the_RedLED;
  wire    [  7: 0] q_a_from_the_grid_0;
  wire             reset_n_sources;
  wire    [ 21: 0] sdram_s1_address;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire    [  1: 0] state_0_avalon_slave_0_address;
  wire             state_0_avalon_slave_0_read;
  wire    [ 31: 0] state_0_avalon_slave_0_readdata;
  wire    [ 31: 0] state_0_avalon_slave_0_readdata_from_sa;
  wire             state_0_avalon_slave_0_reset;
  wire             state_0_avalon_slave_0_wait_counter_eq_0;
  wire    [ 31: 0] tiger_top_0_dataMaster_address;
  wire    [ 31: 0] tiger_top_0_dataMaster_address_to_slave;
  wire    [  3: 0] tiger_top_0_dataMaster_byteenable;
  wire             tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0;
  wire    [  1: 0] tiger_top_0_dataMaster_byteenable_sdram_s1;
  wire    [  1: 0] tiger_top_0_dataMaster_dbs_address;
  wire    [ 15: 0] tiger_top_0_dataMaster_dbs_write_16;
  wire    [  7: 0] tiger_top_0_dataMaster_dbs_write_8;
  wire             tiger_top_0_dataMaster_granted_GreenLED_s1;
  wire             tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_granted_RedLED_s1;
  wire             tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave;
  wire             tiger_top_0_dataMaster_granted_jtag_uart_controlSlave;
  wire             tiger_top_0_dataMaster_granted_onchip_mem_s1;
  wire             tiger_top_0_dataMaster_granted_sdram_s1;
  wire             tiger_top_0_dataMaster_granted_state_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave;
  wire             tiger_top_0_dataMaster_irq;
  wire    [  5: 0] tiger_top_0_dataMaster_irqnumber;
  wire             tiger_top_0_dataMaster_latency_counter;
  wire             tiger_top_0_dataMaster_qualified_request_GreenLED_s1;
  wire             tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_qualified_request_RedLED_s1;
  wire             tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave;
  wire             tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave;
  wire             tiger_top_0_dataMaster_qualified_request_onchip_mem_s1;
  wire             tiger_top_0_dataMaster_qualified_request_sdram_s1;
  wire             tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave;
  wire             tiger_top_0_dataMaster_read;
  wire             tiger_top_0_dataMaster_read_data_valid_GreenLED_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_read_data_valid_RedLED_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave;
  wire             tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave;
  wire             tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_sdram_s1;
  wire             tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register;
  wire             tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave;
  wire    [ 31: 0] tiger_top_0_dataMaster_readdata;
  wire             tiger_top_0_dataMaster_readdatavalid;
  wire             tiger_top_0_dataMaster_requests_GreenLED_s1;
  wire             tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_requests_RedLED_s1;
  wire             tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave;
  wire             tiger_top_0_dataMaster_requests_jtag_uart_controlSlave;
  wire             tiger_top_0_dataMaster_requests_onchip_mem_s1;
  wire             tiger_top_0_dataMaster_requests_sdram_s1;
  wire             tiger_top_0_dataMaster_requests_state_0_avalon_slave_0;
  wire             tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave;
  wire             tiger_top_0_dataMaster_reset;
  wire             tiger_top_0_dataMaster_waitrequest;
  wire             tiger_top_0_dataMaster_write;
  wire    [ 31: 0] tiger_top_0_dataMaster_writedata;
  wire             tiger_top_0_debugSlave_irq;
  wire             tiger_top_0_debugSlave_irq_from_sa;
  wire             tiger_top_0_debugSlave_write;
  wire             tiger_top_0_debugSlave_writedata;
  wire    [ 31: 0] tiger_top_0_instructionMaster_address;
  wire    [ 31: 0] tiger_top_0_instructionMaster_address_to_slave;
  wire    [  1: 0] tiger_top_0_instructionMaster_dbs_address;
  wire             tiger_top_0_instructionMaster_granted_onchip_mem_s1;
  wire             tiger_top_0_instructionMaster_granted_sdram_s1;
  wire             tiger_top_0_instructionMaster_latency_counter;
  wire             tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1;
  wire             tiger_top_0_instructionMaster_qualified_request_sdram_s1;
  wire             tiger_top_0_instructionMaster_read;
  wire             tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1;
  wire             tiger_top_0_instructionMaster_read_data_valid_sdram_s1;
  wire             tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] tiger_top_0_instructionMaster_readdata;
  wire             tiger_top_0_instructionMaster_readdatavalid;
  wire             tiger_top_0_instructionMaster_requests_onchip_mem_s1;
  wire             tiger_top_0_instructionMaster_requests_sdram_s1;
  wire             tiger_top_0_instructionMaster_waitrequest;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  GreenLED_s1_arbitrator the_GreenLED_s1
    (
      .GreenLED_s1_address                                  (GreenLED_s1_address),
      .GreenLED_s1_chipselect                               (GreenLED_s1_chipselect),
      .GreenLED_s1_reset_n                                  (GreenLED_s1_reset_n),
      .GreenLED_s1_write_n                                  (GreenLED_s1_write_n),
      .GreenLED_s1_writedata                                (GreenLED_s1_writedata),
      .clk                                                  (clk),
      .d1_GreenLED_s1_end_xfer                              (d1_GreenLED_s1_end_xfer),
      .reset_n                                              (clk_reset_n),
      .tiger_top_0_dataMaster_address_to_slave              (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_granted_GreenLED_s1           (tiger_top_0_dataMaster_granted_GreenLED_s1),
      .tiger_top_0_dataMaster_latency_counter               (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_GreenLED_s1 (tiger_top_0_dataMaster_qualified_request_GreenLED_s1),
      .tiger_top_0_dataMaster_read                          (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_GreenLED_s1   (tiger_top_0_dataMaster_read_data_valid_GreenLED_s1),
      .tiger_top_0_dataMaster_requests_GreenLED_s1          (tiger_top_0_dataMaster_requests_GreenLED_s1),
      .tiger_top_0_dataMaster_write                         (tiger_top_0_dataMaster_write),
      .tiger_top_0_dataMaster_writedata                     (tiger_top_0_dataMaster_writedata)
    );

  GreenLED the_GreenLED
    (
      .address    (GreenLED_s1_address),
      .chipselect (GreenLED_s1_chipselect),
      .clk        (clk),
      .out_port   (out_port_from_the_GreenLED),
      .reset_n    (GreenLED_s1_reset_n),
      .write_n    (GreenLED_s1_write_n),
      .writedata  (GreenLED_s1_writedata)
    );

  HexLED_0_avalon_slave_0_arbitrator the_HexLED_0_avalon_slave_0
    (
      .HexLED_0_avalon_slave_0_reset_n                                  (HexLED_0_avalon_slave_0_reset_n),
      .HexLED_0_avalon_slave_0_write                                    (HexLED_0_avalon_slave_0_write),
      .HexLED_0_avalon_slave_0_writedata                                (HexLED_0_avalon_slave_0_writedata),
      .clk                                                              (clk),
      .d1_HexLED_0_avalon_slave_0_end_xfer                              (d1_HexLED_0_avalon_slave_0_end_xfer),
      .reset_n                                                          (clk_reset_n),
      .tiger_top_0_dataMaster_address_to_slave                          (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0           (tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0),
      .tiger_top_0_dataMaster_latency_counter                           (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0 (tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0),
      .tiger_top_0_dataMaster_read                                      (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0   (tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0),
      .tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0          (tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0),
      .tiger_top_0_dataMaster_write                                     (tiger_top_0_dataMaster_write),
      .tiger_top_0_dataMaster_writedata                                 (tiger_top_0_dataMaster_writedata)
    );

  HexLED_0 the_HexLED_0
    (
      .HEX0     (HEX0_from_the_HexLED_0),
      .HEX1     (HEX1_from_the_HexLED_0),
      .HEX2     (HEX2_from_the_HexLED_0),
      .HEX3     (HEX3_from_the_HexLED_0),
      .HEX4     (HEX4_from_the_HexLED_0),
      .HEX5     (HEX5_from_the_HexLED_0),
      .HEX6     (HEX6_from_the_HexLED_0),
      .HEX7     (HEX7_from_the_HexLED_0),
      .iCLOCK   (clk),
      .iDATA    (HexLED_0_avalon_slave_0_writedata),
      .iRESET_N (HexLED_0_avalon_slave_0_reset_n),
      .iWR      (HexLED_0_avalon_slave_0_write)
    );

  RedLED_s1_arbitrator the_RedLED_s1
    (
      .RedLED_s1_address                                  (RedLED_s1_address),
      .RedLED_s1_chipselect                               (RedLED_s1_chipselect),
      .RedLED_s1_reset_n                                  (RedLED_s1_reset_n),
      .RedLED_s1_write_n                                  (RedLED_s1_write_n),
      .RedLED_s1_writedata                                (RedLED_s1_writedata),
      .clk                                                (clk),
      .d1_RedLED_s1_end_xfer                              (d1_RedLED_s1_end_xfer),
      .reset_n                                            (clk_reset_n),
      .tiger_top_0_dataMaster_address_to_slave            (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_granted_RedLED_s1           (tiger_top_0_dataMaster_granted_RedLED_s1),
      .tiger_top_0_dataMaster_latency_counter             (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_RedLED_s1 (tiger_top_0_dataMaster_qualified_request_RedLED_s1),
      .tiger_top_0_dataMaster_read                        (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_RedLED_s1   (tiger_top_0_dataMaster_read_data_valid_RedLED_s1),
      .tiger_top_0_dataMaster_requests_RedLED_s1          (tiger_top_0_dataMaster_requests_RedLED_s1),
      .tiger_top_0_dataMaster_write                       (tiger_top_0_dataMaster_write),
      .tiger_top_0_dataMaster_writedata                   (tiger_top_0_dataMaster_writedata)
    );

  RedLED the_RedLED
    (
      .address    (RedLED_s1_address),
      .chipselect (RedLED_s1_chipselect),
      .clk        (clk),
      .out_port   (out_port_from_the_RedLED),
      .reset_n    (RedLED_s1_reset_n),
      .write_n    (RedLED_s1_write_n),
      .writedata  (RedLED_s1_writedata)
    );

  grid_0_avalon_slave_0_arbitrator the_grid_0_avalon_slave_0
    (
      .clk                                                            (clk),
      .d1_grid_0_avalon_slave_0_end_xfer                              (d1_grid_0_avalon_slave_0_end_xfer),
      .grid_0_avalon_slave_0_address                                  (grid_0_avalon_slave_0_address),
      .grid_0_avalon_slave_0_readdata                                 (grid_0_avalon_slave_0_readdata),
      .grid_0_avalon_slave_0_readdata_from_sa                         (grid_0_avalon_slave_0_readdata_from_sa),
      .grid_0_avalon_slave_0_reset                                    (grid_0_avalon_slave_0_reset),
      .grid_0_avalon_slave_0_write                                    (grid_0_avalon_slave_0_write),
      .grid_0_avalon_slave_0_writedata                                (grid_0_avalon_slave_0_writedata),
      .reset_n                                                        (clk_reset_n),
      .tiger_top_0_dataMaster_address_to_slave                        (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_byteenable                              (tiger_top_0_dataMaster_byteenable),
      .tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0        (tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_dbs_address                             (tiger_top_0_dataMaster_dbs_address),
      .tiger_top_0_dataMaster_dbs_write_8                             (tiger_top_0_dataMaster_dbs_write_8),
      .tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0           (tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_latency_counter                         (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0 (tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_read                                    (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0   (tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register (tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0          (tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_write                                   (tiger_top_0_dataMaster_write)
    );

  grid_0 the_grid_0
    (
      .address_a (address_a_to_the_grid_0),
      .address_b (grid_0_avalon_slave_0_address),
      .clock_a   (clock_a_to_the_grid_0),
      .clock_b   (clk),
      .data_a    (data_a_to_the_grid_0),
      .data_b    (grid_0_avalon_slave_0_writedata),
      .q_a       (q_a_from_the_grid_0),
      .q_b       (grid_0_avalon_slave_0_readdata),
      .reset     (grid_0_avalon_slave_0_reset),
      .wren_a    (wren_a_to_the_grid_0),
      .wren_b    (grid_0_avalon_slave_0_write)
    );

  jtag_uart_controlSlave_arbitrator the_jtag_uart_controlSlave
    (
      .clk                                                             (clk),
      .d1_jtag_uart_controlSlave_end_xfer                              (d1_jtag_uart_controlSlave_end_xfer),
      .jtag_uart_controlSlave_address                                  (jtag_uart_controlSlave_address),
      .jtag_uart_controlSlave_read                                     (jtag_uart_controlSlave_read),
      .jtag_uart_controlSlave_readdata                                 (jtag_uart_controlSlave_readdata),
      .jtag_uart_controlSlave_readdata_from_sa                         (jtag_uart_controlSlave_readdata_from_sa),
      .jtag_uart_controlSlave_reset_n                                  (jtag_uart_controlSlave_reset_n),
      .jtag_uart_controlSlave_write                                    (jtag_uart_controlSlave_write),
      .jtag_uart_controlSlave_writedata                                (jtag_uart_controlSlave_writedata),
      .reset_n                                                         (clk_reset_n),
      .tiger_top_0_dataMaster_address_to_slave                         (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_granted_jtag_uart_controlSlave           (tiger_top_0_dataMaster_granted_jtag_uart_controlSlave),
      .tiger_top_0_dataMaster_latency_counter                          (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave (tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave),
      .tiger_top_0_dataMaster_read                                     (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave   (tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register  (tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_dataMaster_requests_jtag_uart_controlSlave          (tiger_top_0_dataMaster_requests_jtag_uart_controlSlave),
      .tiger_top_0_dataMaster_write                                    (tiger_top_0_dataMaster_write),
      .tiger_top_0_dataMaster_writedata                                (tiger_top_0_dataMaster_writedata)
    );

  jtag_uart the_jtag_uart
    (
      .avs_controlSlave_address   (jtag_uart_controlSlave_address),
      .avs_controlSlave_read      (jtag_uart_controlSlave_read),
      .avs_controlSlave_readdata  (jtag_uart_controlSlave_readdata),
      .avs_controlSlave_write     (jtag_uart_controlSlave_write),
      .avs_controlSlave_writedata (jtag_uart_controlSlave_writedata),
      .clk                        (clk),
      .reset_n                    (jtag_uart_controlSlave_reset_n)
    );

  jtag_uart_1_controlSlave_arbitrator the_jtag_uart_1_controlSlave
    (
      .clk                                                               (clk),
      .d1_jtag_uart_1_controlSlave_end_xfer                              (d1_jtag_uart_1_controlSlave_end_xfer),
      .jtag_uart_1_controlSlave_address                                  (jtag_uart_1_controlSlave_address),
      .jtag_uart_1_controlSlave_read                                     (jtag_uart_1_controlSlave_read),
      .jtag_uart_1_controlSlave_readdata                                 (jtag_uart_1_controlSlave_readdata),
      .jtag_uart_1_controlSlave_readdata_from_sa                         (jtag_uart_1_controlSlave_readdata_from_sa),
      .jtag_uart_1_controlSlave_reset_n                                  (jtag_uart_1_controlSlave_reset_n),
      .jtag_uart_1_controlSlave_write                                    (jtag_uart_1_controlSlave_write),
      .jtag_uart_1_controlSlave_writedata                                (jtag_uart_1_controlSlave_writedata),
      .reset_n                                                           (clk_reset_n),
      .tiger_top_0_dataMaster_address_to_slave                           (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave           (tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave),
      .tiger_top_0_dataMaster_latency_counter                            (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave (tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave),
      .tiger_top_0_dataMaster_read                                       (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave   (tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register    (tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave          (tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave),
      .tiger_top_0_dataMaster_write                                      (tiger_top_0_dataMaster_write),
      .tiger_top_0_dataMaster_writedata                                  (tiger_top_0_dataMaster_writedata)
    );

  jtag_uart_1 the_jtag_uart_1
    (
      .avs_controlSlave_address   (jtag_uart_1_controlSlave_address),
      .avs_controlSlave_read      (jtag_uart_1_controlSlave_read),
      .avs_controlSlave_readdata  (jtag_uart_1_controlSlave_readdata),
      .avs_controlSlave_write     (jtag_uart_1_controlSlave_write),
      .avs_controlSlave_writedata (jtag_uart_1_controlSlave_writedata),
      .clk                        (clk),
      .reset_n                    (jtag_uart_1_controlSlave_reset_n)
    );

  onchip_mem_s1_arbitrator the_onchip_mem_s1
    (
      .clk                                                                   (clk),
      .d1_onchip_mem_s1_end_xfer                                             (d1_onchip_mem_s1_end_xfer),
      .onchip_mem_s1_address                                                 (onchip_mem_s1_address),
      .onchip_mem_s1_byteenable                                              (onchip_mem_s1_byteenable),
      .onchip_mem_s1_chipselect                                              (onchip_mem_s1_chipselect),
      .onchip_mem_s1_clken                                                   (onchip_mem_s1_clken),
      .onchip_mem_s1_readdata                                                (onchip_mem_s1_readdata),
      .onchip_mem_s1_readdata_from_sa                                        (onchip_mem_s1_readdata_from_sa),
      .onchip_mem_s1_write                                                   (onchip_mem_s1_write),
      .onchip_mem_s1_writedata                                               (onchip_mem_s1_writedata),
      .reset_n                                                               (clk_reset_n),
      .tiger_top_0_dataMaster_address_to_slave                               (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_byteenable                                     (tiger_top_0_dataMaster_byteenable),
      .tiger_top_0_dataMaster_granted_onchip_mem_s1                          (tiger_top_0_dataMaster_granted_onchip_mem_s1),
      .tiger_top_0_dataMaster_latency_counter                                (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_onchip_mem_s1                (tiger_top_0_dataMaster_qualified_request_onchip_mem_s1),
      .tiger_top_0_dataMaster_read                                           (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1                  (tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register        (tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_dataMaster_requests_onchip_mem_s1                         (tiger_top_0_dataMaster_requests_onchip_mem_s1),
      .tiger_top_0_dataMaster_write                                          (tiger_top_0_dataMaster_write),
      .tiger_top_0_dataMaster_writedata                                      (tiger_top_0_dataMaster_writedata),
      .tiger_top_0_instructionMaster_address_to_slave                        (tiger_top_0_instructionMaster_address_to_slave),
      .tiger_top_0_instructionMaster_granted_onchip_mem_s1                   (tiger_top_0_instructionMaster_granted_onchip_mem_s1),
      .tiger_top_0_instructionMaster_latency_counter                         (tiger_top_0_instructionMaster_latency_counter),
      .tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1         (tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1),
      .tiger_top_0_instructionMaster_read                                    (tiger_top_0_instructionMaster_read),
      .tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1           (tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1),
      .tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register (tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_instructionMaster_requests_onchip_mem_s1                  (tiger_top_0_instructionMaster_requests_onchip_mem_s1)
    );

  onchip_mem the_onchip_mem
    (
      .address    (onchip_mem_s1_address),
      .byteenable (onchip_mem_s1_byteenable),
      .chipselect (onchip_mem_s1_chipselect),
      .clk        (clk),
      .clken      (onchip_mem_s1_clken),
      .readdata   (onchip_mem_s1_readdata),
      .write      (onchip_mem_s1_write),
      .writedata  (onchip_mem_s1_writedata)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .clk                                                                   (clk),
      .d1_sdram_s1_end_xfer                                                  (d1_sdram_s1_end_xfer),
      .reset_n                                                               (clk_reset_n),
      .sdram_s1_address                                                      (sdram_s1_address),
      .sdram_s1_byteenable_n                                                 (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                                   (sdram_s1_chipselect),
      .sdram_s1_read_n                                                       (sdram_s1_read_n),
      .sdram_s1_readdata                                                     (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                             (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                                (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                                      (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                                  (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                          (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                                      (sdram_s1_write_n),
      .sdram_s1_writedata                                                    (sdram_s1_writedata),
      .tiger_top_0_dataMaster_address_to_slave                               (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_byteenable                                     (tiger_top_0_dataMaster_byteenable),
      .tiger_top_0_dataMaster_byteenable_sdram_s1                            (tiger_top_0_dataMaster_byteenable_sdram_s1),
      .tiger_top_0_dataMaster_dbs_address                                    (tiger_top_0_dataMaster_dbs_address),
      .tiger_top_0_dataMaster_dbs_write_16                                   (tiger_top_0_dataMaster_dbs_write_16),
      .tiger_top_0_dataMaster_granted_sdram_s1                               (tiger_top_0_dataMaster_granted_sdram_s1),
      .tiger_top_0_dataMaster_latency_counter                                (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_sdram_s1                     (tiger_top_0_dataMaster_qualified_request_sdram_s1),
      .tiger_top_0_dataMaster_read                                           (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1                       (tiger_top_0_dataMaster_read_data_valid_sdram_s1),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register        (tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_dataMaster_requests_sdram_s1                              (tiger_top_0_dataMaster_requests_sdram_s1),
      .tiger_top_0_dataMaster_write                                          (tiger_top_0_dataMaster_write),
      .tiger_top_0_instructionMaster_address_to_slave                        (tiger_top_0_instructionMaster_address_to_slave),
      .tiger_top_0_instructionMaster_dbs_address                             (tiger_top_0_instructionMaster_dbs_address),
      .tiger_top_0_instructionMaster_granted_sdram_s1                        (tiger_top_0_instructionMaster_granted_sdram_s1),
      .tiger_top_0_instructionMaster_latency_counter                         (tiger_top_0_instructionMaster_latency_counter),
      .tiger_top_0_instructionMaster_qualified_request_sdram_s1              (tiger_top_0_instructionMaster_qualified_request_sdram_s1),
      .tiger_top_0_instructionMaster_read                                    (tiger_top_0_instructionMaster_read),
      .tiger_top_0_instructionMaster_read_data_valid_sdram_s1                (tiger_top_0_instructionMaster_read_data_valid_sdram_s1),
      .tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register (tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_instructionMaster_requests_sdram_s1                       (tiger_top_0_instructionMaster_requests_sdram_s1)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (clk),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  state_0_avalon_slave_0_arbitrator the_state_0_avalon_slave_0
    (
      .clk                                                             (clk),
      .d1_state_0_avalon_slave_0_end_xfer                              (d1_state_0_avalon_slave_0_end_xfer),
      .reset_n                                                         (clk_reset_n),
      .state_0_avalon_slave_0_address                                  (state_0_avalon_slave_0_address),
      .state_0_avalon_slave_0_read                                     (state_0_avalon_slave_0_read),
      .state_0_avalon_slave_0_readdata                                 (state_0_avalon_slave_0_readdata),
      .state_0_avalon_slave_0_readdata_from_sa                         (state_0_avalon_slave_0_readdata_from_sa),
      .state_0_avalon_slave_0_reset                                    (state_0_avalon_slave_0_reset),
      .state_0_avalon_slave_0_wait_counter_eq_0                        (state_0_avalon_slave_0_wait_counter_eq_0),
      .tiger_top_0_dataMaster_address_to_slave                         (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_granted_state_0_avalon_slave_0           (tiger_top_0_dataMaster_granted_state_0_avalon_slave_0),
      .tiger_top_0_dataMaster_latency_counter                          (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0 (tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0),
      .tiger_top_0_dataMaster_read                                     (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register  (tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0   (tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0),
      .tiger_top_0_dataMaster_requests_state_0_avalon_slave_0          (tiger_top_0_dataMaster_requests_state_0_avalon_slave_0),
      .tiger_top_0_dataMaster_write                                    (tiger_top_0_dataMaster_write)
    );

  state_0 the_state_0
    (
      .addr         (state_0_avalon_slave_0_address),
      .clk          (clk),
      .mouse_button (mouse_button_to_the_state_0),
      .next_state   (next_state_to_the_state_0),
      .read         (state_0_avalon_slave_0_read),
      .readdata     (state_0_avalon_slave_0_readdata),
      .reset        (state_0_avalon_slave_0_reset),
      .x            (x_to_the_state_0),
      .y            (y_to_the_state_0)
    );

  tiger_top_0_debugSlave_arbitrator the_tiger_top_0_debugSlave
    (
      .clk                                                             (clk),
      .d1_tiger_top_0_debugSlave_end_xfer                              (d1_tiger_top_0_debugSlave_end_xfer),
      .reset_n                                                         (clk_reset_n),
      .tiger_top_0_dataMaster_address_to_slave                         (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave           (tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave),
      .tiger_top_0_dataMaster_latency_counter                          (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave (tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave),
      .tiger_top_0_dataMaster_read                                     (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave   (tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave),
      .tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave          (tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave),
      .tiger_top_0_dataMaster_write                                    (tiger_top_0_dataMaster_write),
      .tiger_top_0_dataMaster_writedata                                (tiger_top_0_dataMaster_writedata),
      .tiger_top_0_debugSlave_irq                                      (tiger_top_0_debugSlave_irq),
      .tiger_top_0_debugSlave_irq_from_sa                              (tiger_top_0_debugSlave_irq_from_sa),
      .tiger_top_0_debugSlave_write                                    (tiger_top_0_debugSlave_write),
      .tiger_top_0_debugSlave_writedata                                (tiger_top_0_debugSlave_writedata)
    );

  tiger_top_0_dataMaster_arbitrator the_tiger_top_0_dataMaster
    (
      .clk                                                               (clk),
      .d1_GreenLED_s1_end_xfer                                           (d1_GreenLED_s1_end_xfer),
      .d1_HexLED_0_avalon_slave_0_end_xfer                               (d1_HexLED_0_avalon_slave_0_end_xfer),
      .d1_RedLED_s1_end_xfer                                             (d1_RedLED_s1_end_xfer),
      .d1_grid_0_avalon_slave_0_end_xfer                                 (d1_grid_0_avalon_slave_0_end_xfer),
      .d1_jtag_uart_1_controlSlave_end_xfer                              (d1_jtag_uart_1_controlSlave_end_xfer),
      .d1_jtag_uart_controlSlave_end_xfer                                (d1_jtag_uart_controlSlave_end_xfer),
      .d1_onchip_mem_s1_end_xfer                                         (d1_onchip_mem_s1_end_xfer),
      .d1_sdram_s1_end_xfer                                              (d1_sdram_s1_end_xfer),
      .d1_state_0_avalon_slave_0_end_xfer                                (d1_state_0_avalon_slave_0_end_xfer),
      .d1_tiger_top_0_debugSlave_end_xfer                                (d1_tiger_top_0_debugSlave_end_xfer),
      .grid_0_avalon_slave_0_readdata_from_sa                            (grid_0_avalon_slave_0_readdata_from_sa),
      .jtag_uart_1_controlSlave_readdata_from_sa                         (jtag_uart_1_controlSlave_readdata_from_sa),
      .jtag_uart_controlSlave_readdata_from_sa                           (jtag_uart_controlSlave_readdata_from_sa),
      .onchip_mem_s1_readdata_from_sa                                    (onchip_mem_s1_readdata_from_sa),
      .reset_n                                                           (clk_reset_n),
      .sdram_s1_readdata_from_sa                                         (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                      (sdram_s1_waitrequest_from_sa),
      .state_0_avalon_slave_0_readdata_from_sa                           (state_0_avalon_slave_0_readdata_from_sa),
      .state_0_avalon_slave_0_wait_counter_eq_0                          (state_0_avalon_slave_0_wait_counter_eq_0),
      .tiger_top_0_dataMaster_address                                    (tiger_top_0_dataMaster_address),
      .tiger_top_0_dataMaster_address_to_slave                           (tiger_top_0_dataMaster_address_to_slave),
      .tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0           (tiger_top_0_dataMaster_byteenable_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_byteenable_sdram_s1                        (tiger_top_0_dataMaster_byteenable_sdram_s1),
      .tiger_top_0_dataMaster_dbs_address                                (tiger_top_0_dataMaster_dbs_address),
      .tiger_top_0_dataMaster_dbs_write_16                               (tiger_top_0_dataMaster_dbs_write_16),
      .tiger_top_0_dataMaster_dbs_write_8                                (tiger_top_0_dataMaster_dbs_write_8),
      .tiger_top_0_dataMaster_granted_GreenLED_s1                        (tiger_top_0_dataMaster_granted_GreenLED_s1),
      .tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0            (tiger_top_0_dataMaster_granted_HexLED_0_avalon_slave_0),
      .tiger_top_0_dataMaster_granted_RedLED_s1                          (tiger_top_0_dataMaster_granted_RedLED_s1),
      .tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0              (tiger_top_0_dataMaster_granted_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave           (tiger_top_0_dataMaster_granted_jtag_uart_1_controlSlave),
      .tiger_top_0_dataMaster_granted_jtag_uart_controlSlave             (tiger_top_0_dataMaster_granted_jtag_uart_controlSlave),
      .tiger_top_0_dataMaster_granted_onchip_mem_s1                      (tiger_top_0_dataMaster_granted_onchip_mem_s1),
      .tiger_top_0_dataMaster_granted_sdram_s1                           (tiger_top_0_dataMaster_granted_sdram_s1),
      .tiger_top_0_dataMaster_granted_state_0_avalon_slave_0             (tiger_top_0_dataMaster_granted_state_0_avalon_slave_0),
      .tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave             (tiger_top_0_dataMaster_granted_tiger_top_0_debugSlave),
      .tiger_top_0_dataMaster_irq                                        (tiger_top_0_dataMaster_irq),
      .tiger_top_0_dataMaster_irqnumber                                  (tiger_top_0_dataMaster_irqnumber),
      .tiger_top_0_dataMaster_latency_counter                            (tiger_top_0_dataMaster_latency_counter),
      .tiger_top_0_dataMaster_qualified_request_GreenLED_s1              (tiger_top_0_dataMaster_qualified_request_GreenLED_s1),
      .tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0  (tiger_top_0_dataMaster_qualified_request_HexLED_0_avalon_slave_0),
      .tiger_top_0_dataMaster_qualified_request_RedLED_s1                (tiger_top_0_dataMaster_qualified_request_RedLED_s1),
      .tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0    (tiger_top_0_dataMaster_qualified_request_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave (tiger_top_0_dataMaster_qualified_request_jtag_uart_1_controlSlave),
      .tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave   (tiger_top_0_dataMaster_qualified_request_jtag_uart_controlSlave),
      .tiger_top_0_dataMaster_qualified_request_onchip_mem_s1            (tiger_top_0_dataMaster_qualified_request_onchip_mem_s1),
      .tiger_top_0_dataMaster_qualified_request_sdram_s1                 (tiger_top_0_dataMaster_qualified_request_sdram_s1),
      .tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0   (tiger_top_0_dataMaster_qualified_request_state_0_avalon_slave_0),
      .tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave   (tiger_top_0_dataMaster_qualified_request_tiger_top_0_debugSlave),
      .tiger_top_0_dataMaster_read                                       (tiger_top_0_dataMaster_read),
      .tiger_top_0_dataMaster_read_data_valid_GreenLED_s1                (tiger_top_0_dataMaster_read_data_valid_GreenLED_s1),
      .tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0    (tiger_top_0_dataMaster_read_data_valid_HexLED_0_avalon_slave_0),
      .tiger_top_0_dataMaster_read_data_valid_RedLED_s1                  (tiger_top_0_dataMaster_read_data_valid_RedLED_s1),
      .tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0      (tiger_top_0_dataMaster_read_data_valid_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave   (tiger_top_0_dataMaster_read_data_valid_jtag_uart_1_controlSlave),
      .tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave     (tiger_top_0_dataMaster_read_data_valid_jtag_uart_controlSlave),
      .tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1              (tiger_top_0_dataMaster_read_data_valid_onchip_mem_s1),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1                   (tiger_top_0_dataMaster_read_data_valid_sdram_s1),
      .tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register    (tiger_top_0_dataMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0     (tiger_top_0_dataMaster_read_data_valid_state_0_avalon_slave_0),
      .tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave     (tiger_top_0_dataMaster_read_data_valid_tiger_top_0_debugSlave),
      .tiger_top_0_dataMaster_readdata                                   (tiger_top_0_dataMaster_readdata),
      .tiger_top_0_dataMaster_readdatavalid                              (tiger_top_0_dataMaster_readdatavalid),
      .tiger_top_0_dataMaster_requests_GreenLED_s1                       (tiger_top_0_dataMaster_requests_GreenLED_s1),
      .tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0           (tiger_top_0_dataMaster_requests_HexLED_0_avalon_slave_0),
      .tiger_top_0_dataMaster_requests_RedLED_s1                         (tiger_top_0_dataMaster_requests_RedLED_s1),
      .tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0             (tiger_top_0_dataMaster_requests_grid_0_avalon_slave_0),
      .tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave          (tiger_top_0_dataMaster_requests_jtag_uart_1_controlSlave),
      .tiger_top_0_dataMaster_requests_jtag_uart_controlSlave            (tiger_top_0_dataMaster_requests_jtag_uart_controlSlave),
      .tiger_top_0_dataMaster_requests_onchip_mem_s1                     (tiger_top_0_dataMaster_requests_onchip_mem_s1),
      .tiger_top_0_dataMaster_requests_sdram_s1                          (tiger_top_0_dataMaster_requests_sdram_s1),
      .tiger_top_0_dataMaster_requests_state_0_avalon_slave_0            (tiger_top_0_dataMaster_requests_state_0_avalon_slave_0),
      .tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave            (tiger_top_0_dataMaster_requests_tiger_top_0_debugSlave),
      .tiger_top_0_dataMaster_reset                                      (tiger_top_0_dataMaster_reset),
      .tiger_top_0_dataMaster_waitrequest                                (tiger_top_0_dataMaster_waitrequest),
      .tiger_top_0_dataMaster_write                                      (tiger_top_0_dataMaster_write),
      .tiger_top_0_dataMaster_writedata                                  (tiger_top_0_dataMaster_writedata),
      .tiger_top_0_debugSlave_irq_from_sa                                (tiger_top_0_debugSlave_irq_from_sa)
    );

  tiger_top_0_instructionMaster_arbitrator the_tiger_top_0_instructionMaster
    (
      .clk                                                                   (clk),
      .d1_onchip_mem_s1_end_xfer                                             (d1_onchip_mem_s1_end_xfer),
      .d1_sdram_s1_end_xfer                                                  (d1_sdram_s1_end_xfer),
      .onchip_mem_s1_readdata_from_sa                                        (onchip_mem_s1_readdata_from_sa),
      .reset_n                                                               (clk_reset_n),
      .sdram_s1_readdata_from_sa                                             (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                          (sdram_s1_waitrequest_from_sa),
      .tiger_top_0_instructionMaster_address                                 (tiger_top_0_instructionMaster_address),
      .tiger_top_0_instructionMaster_address_to_slave                        (tiger_top_0_instructionMaster_address_to_slave),
      .tiger_top_0_instructionMaster_dbs_address                             (tiger_top_0_instructionMaster_dbs_address),
      .tiger_top_0_instructionMaster_granted_onchip_mem_s1                   (tiger_top_0_instructionMaster_granted_onchip_mem_s1),
      .tiger_top_0_instructionMaster_granted_sdram_s1                        (tiger_top_0_instructionMaster_granted_sdram_s1),
      .tiger_top_0_instructionMaster_latency_counter                         (tiger_top_0_instructionMaster_latency_counter),
      .tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1         (tiger_top_0_instructionMaster_qualified_request_onchip_mem_s1),
      .tiger_top_0_instructionMaster_qualified_request_sdram_s1              (tiger_top_0_instructionMaster_qualified_request_sdram_s1),
      .tiger_top_0_instructionMaster_read                                    (tiger_top_0_instructionMaster_read),
      .tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1           (tiger_top_0_instructionMaster_read_data_valid_onchip_mem_s1),
      .tiger_top_0_instructionMaster_read_data_valid_sdram_s1                (tiger_top_0_instructionMaster_read_data_valid_sdram_s1),
      .tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register (tiger_top_0_instructionMaster_read_data_valid_sdram_s1_shift_register),
      .tiger_top_0_instructionMaster_readdata                                (tiger_top_0_instructionMaster_readdata),
      .tiger_top_0_instructionMaster_readdatavalid                           (tiger_top_0_instructionMaster_readdatavalid),
      .tiger_top_0_instructionMaster_requests_onchip_mem_s1                  (tiger_top_0_instructionMaster_requests_onchip_mem_s1),
      .tiger_top_0_instructionMaster_requests_sdram_s1                       (tiger_top_0_instructionMaster_requests_sdram_s1),
      .tiger_top_0_instructionMaster_waitrequest                             (tiger_top_0_instructionMaster_waitrequest)
    );

  tiger_top_0 the_tiger_top_0
    (
      .avm_dataMaster_address              (tiger_top_0_dataMaster_address),
      .avm_dataMaster_byteenable           (tiger_top_0_dataMaster_byteenable),
      .avm_dataMaster_irq                  (tiger_top_0_dataMaster_irq),
      .avm_dataMaster_irqnumber            (tiger_top_0_dataMaster_irqnumber),
      .avm_dataMaster_read                 (tiger_top_0_dataMaster_read),
      .avm_dataMaster_readdata             (tiger_top_0_dataMaster_readdata),
      .avm_dataMaster_readdatavalid        (tiger_top_0_dataMaster_readdatavalid),
      .avm_dataMaster_waitrequest          (tiger_top_0_dataMaster_waitrequest),
      .avm_dataMaster_write                (tiger_top_0_dataMaster_write),
      .avm_dataMaster_writedata            (tiger_top_0_dataMaster_writedata),
      .avm_instructionMaster_address       (tiger_top_0_instructionMaster_address),
      .avm_instructionMaster_read          (tiger_top_0_instructionMaster_read),
      .avm_instructionMaster_readdata      (tiger_top_0_instructionMaster_readdata),
      .avm_instructionMaster_readdatavalid (tiger_top_0_instructionMaster_readdatavalid),
      .avm_instructionMaster_waitrequest   (tiger_top_0_instructionMaster_waitrequest),
      .avs_debugSlave_irq                  (tiger_top_0_debugSlave_irq),
      .avs_debugSlave_write                (tiger_top_0_debugSlave_write),
      .avs_debugSlave_writedata            (tiger_top_0_debugSlave_writedata),
      .clk                                 (clk),
      .reset                               (tiger_top_0_dataMaster_reset)
    );

  //reset is asserted asynchronously and deasserted synchronously
  game_of_life_reset_clk_domain_synch_module game_of_life_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0);


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

`ifdef USE_convert_hex2ver
`else
`define NO_PLI 1
`endif

`include "c:/altera/71/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/71/quartus/eda/sim_lib/220model.v"
`include "c:/altera/71/quartus/eda/sim_lib/sgate.v"
`include "jtag_uart_1.v"
`include "state_0.v"
`include "tiger_top_0.v"
`include "HexLED_0.v"
`include "grid_0.v"
`include "jtag_uart.v"
`include "RedLED.v"
`include "sdram.v"
`include "sdram_test_component.v"
`include "onchip_mem.v"
`include "GreenLED.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [  7: 0] HEX0_from_the_HexLED_0;
  wire    [  7: 0] HEX1_from_the_HexLED_0;
  wire    [  7: 0] HEX2_from_the_HexLED_0;
  wire    [  7: 0] HEX3_from_the_HexLED_0;
  wire    [  7: 0] HEX4_from_the_HexLED_0;
  wire    [  7: 0] HEX5_from_the_HexLED_0;
  wire    [  7: 0] HEX6_from_the_HexLED_0;
  wire    [  7: 0] HEX7_from_the_HexLED_0;
  wire    [ 10: 0] address_a_to_the_grid_0;
  reg              clk;
  wire             clock_a_to_the_grid_0;
  wire    [  7: 0] data_a_to_the_grid_0;
  wire             mouse_button_to_the_state_0;
  wire             next_state_to_the_state_0;
  wire    [  8: 0] out_port_from_the_GreenLED;
  wire    [ 17: 0] out_port_from_the_RedLED;
  wire    [  7: 0] q_a_from_the_grid_0;
  reg              reset_n;
  wire             wren_a_to_the_grid_0;
  wire    [ 10: 0] x_to_the_state_0;
  wire    [ 10: 0] y_to_the_state_0;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  game_of_life DUT
    (
      .HEX0_from_the_HexLED_0      (HEX0_from_the_HexLED_0),
      .HEX1_from_the_HexLED_0      (HEX1_from_the_HexLED_0),
      .HEX2_from_the_HexLED_0      (HEX2_from_the_HexLED_0),
      .HEX3_from_the_HexLED_0      (HEX3_from_the_HexLED_0),
      .HEX4_from_the_HexLED_0      (HEX4_from_the_HexLED_0),
      .HEX5_from_the_HexLED_0      (HEX5_from_the_HexLED_0),
      .HEX6_from_the_HexLED_0      (HEX6_from_the_HexLED_0),
      .HEX7_from_the_HexLED_0      (HEX7_from_the_HexLED_0),
      .address_a_to_the_grid_0     (address_a_to_the_grid_0),
      .clk                         (clk),
      .clock_a_to_the_grid_0       (clock_a_to_the_grid_0),
      .data_a_to_the_grid_0        (data_a_to_the_grid_0),
      .mouse_button_to_the_state_0 (mouse_button_to_the_state_0),
      .next_state_to_the_state_0   (next_state_to_the_state_0),
      .out_port_from_the_GreenLED  (out_port_from_the_GreenLED),
      .out_port_from_the_RedLED    (out_port_from_the_RedLED),
      .q_a_from_the_grid_0         (q_a_from_the_grid_0),
      .reset_n                     (reset_n),
      .wren_a_to_the_grid_0        (wren_a_to_the_grid_0),
      .x_to_the_state_0            (x_to_the_state_0),
      .y_to_the_state_0            (y_to_the_state_0),
      .zs_addr_from_the_sdram      (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram        (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram     (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram       (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram      (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram       (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram     (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram      (zs_we_n_from_the_sdram)
    );

  sdram_test_component the_sdram_test_component
    (
      .clk      (clk),
      .zs_addr  (zs_addr_from_the_sdram),
      .zs_ba    (zs_ba_from_the_sdram),
      .zs_cas_n (zs_cas_n_from_the_sdram),
      .zs_cke   (zs_cke_from_the_sdram),
      .zs_cs_n  (zs_cs_n_from_the_sdram),
      .zs_dq    (zs_dq_to_and_from_the_sdram),
      .zs_dqm   (zs_dqm_from_the_sdram),
      .zs_ras_n (zs_ras_n_from_the_sdram),
      .zs_we_n  (zs_we_n_from_the_sdram)
    );

  initial
    clk = 1'b0;
  always
    #20 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #400 reset_n <= 1;
    end

endmodule


//synthesis translate_on