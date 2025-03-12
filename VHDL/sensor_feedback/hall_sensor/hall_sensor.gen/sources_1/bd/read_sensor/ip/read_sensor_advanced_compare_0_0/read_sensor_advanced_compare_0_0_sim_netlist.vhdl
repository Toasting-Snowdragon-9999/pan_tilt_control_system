-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Wed Mar 12 11:44:12 2025
-- Host        : Windows_beast running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/chris/git/pan_tilt_control_system/VHDL/sensor_feedback/hall_sensor/hall_sensor.gen/sources_1/bd/read_sensor/ip/read_sensor_advanced_compare_0_0/read_sensor_advanced_compare_0_0_sim_netlist.vhdl
-- Design      : read_sensor_advanced_compare_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity read_sensor_advanced_compare_0_0_advanced_compare is
  port (
    direction : out STD_LOGIC;
    a_in : in STD_LOGIC;
    b_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of read_sensor_advanced_compare_0_0_advanced_compare : entity is "advanced_compare";
end read_sensor_advanced_compare_0_0_advanced_compare;

architecture STRUCTURE of read_sensor_advanced_compare_0_0_advanced_compare is
  signal direction02_out : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of direction_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of direction_reg : label is "VCC:GE GND:CLR";
begin
direction_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => direction02_out,
      G => '0',
      GE => '1',
      Q => direction
    );
direction_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => a_in,
      I1 => b_in,
      O => direction02_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity read_sensor_advanced_compare_0_0 is
  port (
    a_in : in STD_LOGIC;
    b_in : in STD_LOGIC;
    direction : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of read_sensor_advanced_compare_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of read_sensor_advanced_compare_0_0 : entity is "read_sensor_advanced_compare_0_0,advanced_compare,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of read_sensor_advanced_compare_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of read_sensor_advanced_compare_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of read_sensor_advanced_compare_0_0 : entity is "advanced_compare,Vivado 2024.2";
end read_sensor_advanced_compare_0_0;

architecture STRUCTURE of read_sensor_advanced_compare_0_0 is
begin
U0: entity work.read_sensor_advanced_compare_0_0_advanced_compare
     port map (
      a_in => a_in,
      b_in => b_in,
      direction => direction
    );
end STRUCTURE;
