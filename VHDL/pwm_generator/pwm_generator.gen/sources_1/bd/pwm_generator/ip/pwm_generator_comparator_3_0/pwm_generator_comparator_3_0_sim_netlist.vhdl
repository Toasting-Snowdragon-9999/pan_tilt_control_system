-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  9 11:03:25 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_comparator_3_0/pwm_generator_comparator_3_0_sim_netlist.vhdl
-- Design      : pwm_generator_comparator_3_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_comparator_3_0_comparator is
  port (
    c : out STD_LOGIC;
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    a : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_generator_comparator_3_0_comparator : entity is "comparator";
end pwm_generator_comparator_3_0_comparator;

architecture STRUCTURE of pwm_generator_comparator_3_0_comparator is
  signal c_INST_0_i_1_n_0 : STD_LOGIC;
begin
c_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => c_INST_0_i_1_n_0,
      I1 => b(3),
      I2 => a(3),
      I3 => b(4),
      I4 => a(4),
      O => c
    );
c_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => a(0),
      I1 => b(0),
      I2 => b(1),
      I3 => a(1),
      I4 => b(2),
      I5 => a(2),
      O => c_INST_0_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_comparator_3_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_comparator_3_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_comparator_3_0 : entity is "pwm_generator_comparator_3_0,comparator,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_comparator_3_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_comparator_3_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_comparator_3_0 : entity is "comparator,Vivado 2024.2";
end pwm_generator_comparator_3_0;

architecture STRUCTURE of pwm_generator_comparator_3_0 is
begin
U0: entity work.pwm_generator_comparator_3_0_comparator
     port map (
      a(4 downto 0) => a(4 downto 0),
      b(4 downto 0) => b(4 downto 0),
      c => c
    );
end STRUCTURE;
