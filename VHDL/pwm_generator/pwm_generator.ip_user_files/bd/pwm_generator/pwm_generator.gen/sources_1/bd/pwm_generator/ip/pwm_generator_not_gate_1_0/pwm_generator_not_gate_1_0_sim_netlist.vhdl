-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  2 09:40:54 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_not_gate_1_0/pwm_generator_not_gate_1_0_sim_netlist.vhdl
-- Design      : pwm_generator_not_gate_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_not_gate_1_0 is
  port (
    in_1 : in STD_LOGIC;
    out_1 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_not_gate_1_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_not_gate_1_0 : entity is "pwm_generator_not_gate_1_0,not_gate,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_not_gate_1_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_not_gate_1_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_not_gate_1_0 : entity is "not_gate,Vivado 2024.2";
end pwm_generator_not_gate_1_0;

architecture STRUCTURE of pwm_generator_not_gate_1_0 is
begin
out_1_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => in_1,
      O => out_1
    );
end STRUCTURE;
