-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Wed Mar 12 11:44:12 2025
-- Host        : Windows_beast running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/chris/git/pan_tilt_control_system/VHDL/sensor_feedback/hall_sensor/hall_sensor.gen/sources_1/bd/read_sensor/ip/read_sensor_advanced_compare_0_0/read_sensor_advanced_compare_0_0_stub.vhdl
-- Design      : read_sensor_advanced_compare_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity read_sensor_advanced_compare_0_0 is
  Port ( 
    a_in : in STD_LOGIC;
    b_in : in STD_LOGIC;
    direction : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of read_sensor_advanced_compare_0_0 : entity is "read_sensor_advanced_compare_0_0,advanced_compare,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of read_sensor_advanced_compare_0_0 : entity is "read_sensor_advanced_compare_0_0,advanced_compare,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=advanced_compare,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of read_sensor_advanced_compare_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of read_sensor_advanced_compare_0_0 : entity is "module_ref";
end read_sensor_advanced_compare_0_0;

architecture stub of read_sensor_advanced_compare_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "a_in,b_in,direction";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "advanced_compare,Vivado 2024.2";
begin
end;
