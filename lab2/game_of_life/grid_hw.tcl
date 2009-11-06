# TCL File Generated by Component Editor on: 
# Tue Jul 31 16:35:59 BST 2007
# DO NOT MODIFY

set_source_file "grid.v"
set_module "grid"
set_module_description ""
set_module_property instantiateInSystemModule true
set_module_property version "1.0"
set_module_property group ""
set_module_property editable true

# Module parameters

# Wire Interface global_signals_export
add_interface "global_signals_export" "conduit" "output" "asynchronous"
# Ports in interface global_signals_export
add_port_to_interface "global_signals_export" "address_a" "export"
add_port_to_interface "global_signals_export" "wren_a" "export"
add_port_to_interface "global_signals_export" "data_a" "export"
add_port_to_interface "global_signals_export" "clock_a" "export"
add_port_to_interface "global_signals_export" "q_a" "export"

# Clock Interface avalon_slave_0_clock
add_clock_interface "avalon_slave_0_clock" 
set_interface_property "avalon_slave_0_clock" "externallyDriven" "false"
set_interface_property "avalon_slave_0_clock" "clockRateKnown" "false"
set_interface_property "avalon_slave_0_clock" "clockRate" "0"
# Ports in interface avalon_slave_0_clock
add_port_to_interface "avalon_slave_0_clock" "clock_b" "clk"
add_port_to_interface "avalon_slave_0_clock" "reset" "reset"

# Interface avalon_slave_0
add_interface "avalon_slave_0" "avalon" "slave" "avalon_slave_0_clock"
set_interface_property "avalon_slave_0" "isNonVolatileStorage" "false"
set_interface_property "avalon_slave_0" "burstOnBurstBoundariesOnly" "false"
set_interface_property "avalon_slave_0" "transparentBridge" "false"
set_interface_property "avalon_slave_0" "readLatency" "0"
set_interface_property "avalon_slave_0" "readWaitStates" "1"
set_interface_property "avalon_slave_0" "isFlash" "false"
set_interface_property "avalon_slave_0" "holdTime" "0"
set_interface_property "avalon_slave_0" "printableDevice" "false"
set_interface_property "avalon_slave_0" "registerIncomingSignals" "false"
set_interface_property "avalon_slave_0" "readWaitTime" "1"
set_interface_property "avalon_slave_0" "setupTime" "0"
set_interface_property "avalon_slave_0" "addressGroup" "0"
set_interface_property "avalon_slave_0" "interleaveBursts" "false"
set_interface_property "avalon_slave_0" "addressAlignment" "DYNAMIC"
set_interface_property "avalon_slave_0" "isBigEndian" "false"
set_interface_property "avalon_slave_0" "writeLatency" "0"
set_interface_property "avalon_slave_0" "writeWaitTime" "1"
set_interface_property "avalon_slave_0" "timingUnits" "Cycles"
set_interface_property "avalon_slave_0" "minimumUninterruptedRunLength" "1"
set_interface_property "avalon_slave_0" "registerOutgoingSignals" "false"
set_interface_property "avalon_slave_0" "addressSpan" "2048"
set_interface_property "avalon_slave_0" "isMemoryDevice" "true"
set_interface_property "avalon_slave_0" "linewrapBursts" "false"
set_interface_property "avalon_slave_0" "alwaysBurstMaxBurst" "false"
set_interface_property "avalon_slave_0" "writeWaitStates" "1"
set_interface_property "avalon_slave_0" "maximumPendingReadTransactions" "0"
set_interface_property "avalon_slave_0" "wellBehavedWaitrequest" "false"
# Ports in interface avalon_slave_0
add_port_to_interface "avalon_slave_0" "address_b" "address"
add_port_to_interface "avalon_slave_0" "wren_b" "write"
add_port_to_interface "avalon_slave_0" "data_b" "writedata"
add_port_to_interface "avalon_slave_0" "q_b" "readdata"
