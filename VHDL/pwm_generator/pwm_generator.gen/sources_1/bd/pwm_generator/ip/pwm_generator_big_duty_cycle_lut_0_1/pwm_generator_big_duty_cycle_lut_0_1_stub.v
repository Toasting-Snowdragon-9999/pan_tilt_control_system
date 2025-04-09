// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed Apr  9 11:03:26 2025
// Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_big_duty_cycle_lut_0_1/pwm_generator_big_duty_cycle_lut_0_1_stub.v
// Design      : pwm_generator_big_duty_cycle_lut_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "pwm_generator_big_duty_cycle_lut_0_1,big_duty_cycle_lut,{}" *) (* core_generation_info = "pwm_generator_big_duty_cycle_lut_0_1,big_duty_cycle_lut,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=big_duty_cycle_lut,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "big_duty_cycle_lut,Vivado 2024.2" *) 
module pwm_generator_big_duty_cycle_lut_0_1(spi_in, en, duty_constant)
/* synthesis syn_black_box black_box_pad_pin="spi_in[4:0],en,duty_constant[4:0]" */;
  input [4:0]spi_in;
  input en;
  output [4:0]duty_constant;
endmodule
