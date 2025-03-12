// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Wed Mar 12 11:44:12 2025
// Host        : Windows_beast running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/chris/git/pan_tilt_control_system/VHDL/sensor_feedback/hall_sensor/hall_sensor.gen/sources_1/bd/read_sensor/ip/read_sensor_advanced_compare_0_0/read_sensor_advanced_compare_0_0_stub.v
// Design      : read_sensor_advanced_compare_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "read_sensor_advanced_compare_0_0,advanced_compare,{}" *) (* core_generation_info = "read_sensor_advanced_compare_0_0,advanced_compare,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=advanced_compare,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "advanced_compare,Vivado 2024.2" *) 
module read_sensor_advanced_compare_0_0(a_in, b_in, direction)
/* synthesis syn_black_box black_box_pad_pin="a_in,b_in,direction" */;
  input a_in;
  input b_in;
  output direction;
endmodule
